import json
import os
import re
from datetime import datetime # TAMBAHAN: Import library datetime untuk memproses tanggal

# --- VARIABEL BARU UNTUK PROSES CLEANING ---
# TAMBAHAN: Dictionary untuk menggabungkan kategori yang mirip (e.g., "Pizza" dan "Pizzas")
category_consolidation_map = {
    "pizzas": "pizza",
    "street food": "street food", # Memastikan konsistensi penulisan
    "dumplings": "dumplings",
    "noodle dish": "noodle dishes",
    "sweet pastry": "pastries",
    "pancake": "pancakes",
    "casserole": "casseroles",
    "bread roll": "breads",
    "breakfast": "breakfasts",
    "appetizer": "appetizers",
    "salsa": "salsas",
    "dip": "dips",
    "dessert": "desserts",
    "sauce": "sauces"
}

# TAMBAHAN: Counter untuk resep yang tidak punya ID, agar bisa kita buatkan ID baru
next_recipe_id_counter = 1

# Lokasi folder untuk input & output
INPUT_DIR = "../data" 
OUTPUT_DIR = "../data"
os.makedirs(OUTPUT_DIR, exist_ok=True)

# Fungsi untuk baca & tulis JSON
def read_json(filename):
    filepath = os.path.join(INPUT_DIR, filename)
    if not os.path.exists(filepath):
        print(f"[ERROR] File tidak ditemukan: {filepath}. Silakan periksa path dan nama file.")
        return None
    with open(filepath, "r", encoding="utf-8") as f:
        return json.load(f)

def write_json(filename, data):
    with open(os.path.join(OUTPUT_DIR, filename), "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
    print(f"Proses clean {filename} berhasil ({len(data)} records)")

# Baca file countries dan categories untuk lookup
countries_file = read_json("countries.json")
categories_file = read_json("categories.json")

# Mapping untuk lookup
country_name_to_id = {c["country_name"].strip().lower(): c["country_id"] for c in countries_file}
category_name_to_id = {c["category_name"].strip().lower(): c["category_id"] for c in categories_file}

# --- FUNGSI HELPER BARU ---
# TAMBAHAN: Fungsi untuk mengubah format tanggal dari "MONTH DAY, YEAR" ke "YYYY-MM-DD"
def parse_date(date_str):
    if not date_str:
        return None
    try:
        # Coba parse dengan format "MONTH DAY, YEAR" (e.g., "JULY 31, 2025")
        dt_object = datetime.strptime(date_str, "%B %d, %Y")
        return dt_object.strftime("%Y-%m-%d")
    except ValueError:
        # Jika formatnya beda, kita bisa tambahkan logika lain di sini atau kembalikan None
        print(f"[WARNING] Format tanggal tidak dikenali: '{date_str}'")
        return None

# Fungsi untuk konversi ke float
def safe_float(val):
    try:
        return float(val)
    except (ValueError, TypeError):
        return None

def clean_category_name(name):
    if not name:
        return None
    name = name.title()
    name = name.split(" Or ")[0].split(" And ")[0]
    return name.strip()

def clean_comment_content(text):
    if not text:
        return None
    text = text.replace("\n", " ")
    text = re.sub(r'USEFUL RECOMMENDATION\?', '', text, flags=re.IGNORECASE)
    text = re.sub(r'\b0\s*0\b', '', text)
    text = text.replace("'", "")
    text = text.strip()
    if text.startswith('"') and text.endswith('"'):
        text = text[1:-1].strip()
    return text

# Fungsi untuk mengubah karakter yang tidak dapat diproses
def clean_desc(description):
    if not description:
        return description
    description = description.replace("’", "'").replace("‘", "'")
    description = re.sub(r'\n\n+', ' ', description)
    description = description.replace("\n", " ").replace("\r", " ")
    description = re.sub(r'[^\x00-\x7F]+', ' ', description)
    description = description.replace("'", "")
    description = ' '.join(description.split())
    return description.strip()


# Preprocess dishes
def clean_dishes():
    dishes = read_json("dishes.json")
    if dishes is None: return []
    cleaned = []

    for d in dishes:
        # Pecah origin ke city, country
        city, country = None, None
        if d.get("origin"):
            parts = [p.strip() for p in d["origin"].split(",")]
            if len(parts) == 2:
                city, country = parts
            elif len(parts) == 1:
                country = parts[0]

        # Cari country_id
        country_id = None
        if country:
            country_key = country.lower()
            country_id = country_name_to_id.get(country_key)
            # TAMBAHAN: Beri peringatan jika country ada tapi ID tidak ditemukan
            if not country_id:
                print(f"[WARNING] Country ID tidak ditemukan untuk '{country}' pada dish '{d.get('dish_name')}'.")

        # Cari category_id, kalo belum ada ditambahkan yang baru
        category_id = None
        cat_name_clean = clean_category_name(d.get("category"))

        if cat_name_clean:
            # TAMBAHAN: Normalisasi nama kategori sebelum lookup menggunakan map konsolidasi
            normalized_cat_name = cat_name_clean.lower()
            if normalized_cat_name in category_consolidation_map:
                cat_name_clean = category_consolidation_map[normalized_cat_name].title()

            if cat_name_clean.lower() in category_name_to_id:
                category_id = category_name_to_id[cat_name_clean.lower()]
            else:
                new_id = f"cat{len(categories_file)+1:03d}"
                new_cat = {
                    "category_id": new_id,
                    "category_name": cat_name_clean
                }
                categories_file.append(new_cat)
                category_name_to_id[cat_name_clean.lower()] = new_id
                category_id = new_id

        cleaned.append({
            "dish_id": d.get("dish_id"),
            "dish_name": clean_desc(d.get("dish_name")),
            "ranking": int(d["ranking"]) if d.get("ranking") else None,
            "category_id": category_id,
            "certificate": d.get("certificate"),
            "city": clean_desc(city),
            "country": clean_desc(country),
            "country_id": country_id,
            "desc": clean_desc(d.get("desc")),
            "average_ratings": safe_float(d.get("average_ratings")),
            "image": d.get("image"),
            "link": d.get("link")
        })

    # write_json("dishes_clean.json", cleaned)
    return cleaned

# Preprocess restaurants
def clean_restaurants():
    data = read_json("restaurants.json")
    if data is None: return
    cleaned = []
    seen_ids = set()

    for r in data:
        resto_id = r.get("resto_id")
        if not resto_id or resto_id in seen_ids:
            continue

        seen_ids.add(resto_id)
        city, country = None, None

        # Pecah city_country
        city_country = r.get("city_country")
        if city_country:
            parts = [p.strip() for p in city_country.split(",") if p.strip()]
            if len(parts) == 2:
                city, country = parts
            elif len(parts) == 1:
                country = parts[0]

        # Cari country_id
        country_id = None
        if country:
            country_key = country.lower()
            country_id = country_name_to_id.get(country_key)
            # TAMBAHAN: Beri peringatan jika country ada tapi ID tidak ditemukan
            if not country_id:
                print(f"[WARNING] Country ID tidak ditemukan untuk '{country}' pada restoran '{r.get('name')}'.")

        cleaned.append({
            "resto_id": resto_id,
            "name": clean_desc(r.get("name")),
            "city": clean_desc(city),
            "country": clean_desc(country),
            "country_id": country_id,
            "address": clean_desc(r.get("address")),
            "phone": r.get("phone"),
            "website": r.get("website"),
            "rating": safe_float(r.get("rating"))
        })

    write_json("restaurants_clean.json", cleaned)

# Preprocess recipes
def clean_recipes(valid_dishes): 
    global next_recipe_id_counter
    recipes_raw = read_json("recipes.json")
    if recipes_raw is None: return
    
    # Buat sebuah set dari dish_id yang valid untuk pencarian super cepat
    valid_dish_ids = {d['dish_id'] for d in valid_dishes}
    
    recipes_cleaned = []

    for r in recipes_raw:
        dish_id = r.get("dish_id")
        
        # INI BAGIAN PENTINGNYA: Cek apakah dish_id dari resep ini ada di daftar dish_id yang valid
        if dish_id in valid_dish_ids:
            if r.get("variation_name") == "N/A":
                continue
            
            recipe_id = r.get("recipe_id")
            if not recipe_id:
                recipe_id = f"rec_new_{next_recipe_id_counter:03d}"
                print(f"[INFO] Generated new recipe_id '{recipe_id}' untuk resep '{r.get('variation_name')}'")
                next_recipe_id_counter += 1

            recipes_cleaned.append({
                "recipe_id": recipe_id,
                "dish_id": dish_id,
                "variation_name": clean_desc(r.get("variation_name")),
                "prep": r.get("prep"),
                "cook": r.get("cook"),
                "ready_in": r.get("ready_in"),
                "rating": safe_float(r.get("rating")),
                "desc": clean_desc(r.get("desc", ""))
            })
        else:
            # Beri tahu kita resep mana yang dilewati
            print(f"[INFO] Melewati resep '{r.get('variation_name')}' karena dish_id '{dish_id}' tidak valid.")

    write_json("recipes_clean.json", recipes_cleaned)

# Preprocess comments
def clean_comments():
    data = read_json("comments.json")
    if data is None: return
    cleaned = []
    for c in data:
        cleaned.append({
            "comment_id": c.get("comment_id"),
            "dish_id": c.get("dish_id"),
            "username": clean_desc(c.get("username")),
            "content": clean_desc(clean_comment_content(c.get("content"))),
            "rating": safe_float(c.get("rating")),
            "date": parse_date(c.get("date")), # TAMBAHAN: Gunakan fungsi parse_date
            "likes": int(c["likes"]) if c.get("likes") else 0,
            "dislikes": int(c["dislikes"]) if c.get("dislikes") else 0
        })
    write_json("comments_clean.json", cleaned)


# Preprocess quality label descriptions
def clean_quality_labels():
    data = read_json("quality_labels.json")
    if data is None: return
    cleaned = []

    for entry in data:
        # TAMBAHAN: Hanya ambil kolom yang relevan untuk tabel lookup quality_labels
        # Kolom 'dish_id' dan 'created_at' tidak diperlukan sesuai desain database.
        cleaned.append({
            "label_id": entry.get("label_id"),
            "label_name": entry.get("label_name"),
            "desc": clean_desc(entry.get("desc"))
            # 'label_img' tidak ada di data source, jadi tidak kita masukkan.
        })
    
    write_json("quality_labels_clean.json", cleaned)

# Simpan hasil penambahan categories dan countries
def save_files():
    # TAMBAHAN: Lakukan de-duplikasi final pada file categories sebelum disimpan
    if categories_file:
        final_categories = {}
        for cat in categories_file:
            # Menggunakan nama kategori sebagai key akan otomatis menimpa duplikat
            final_categories[cat["category_name"]] = cat
        
        # Ubah kembali ke format list of dictionaries
        unique_categories_list = list(final_categories.values())
        write_json("categories_clean.json", unique_categories_list)

    if countries_file:
        write_json("countries_clean.json", countries_file)

# Eksekusi semua
if __name__ == "__main__":
    print("Mulai proses preprocessing...")
    
    # Jalankan clean_dishes dulu dan simpan hasilnya
    cleaned_dishes_data = clean_dishes()
    
    # Baru jalankan fungsi lain, berikan data dishes ke clean_recipes
    clean_restaurants()
    clean_recipes(cleaned_dishes_data) # <-- Berikan datanya ke sini
    clean_comments()
    clean_quality_labels()
    
    # Tulis file yang sudah bersih di akhir
    write_json("dishes_clean.json", cleaned_dishes_data)
    save_files()
    
    print("\nPreprocessing selesai semua!")