import json
import os
import re

def parse_apk_size_to_mb(size_string):
    if not isinstance(size_string, str) or "N/A" in size_string.upper():
        return None
    number_part = re.findall(r'[\d.]+', size_string)
    if not number_part:
        return None
    size = float(number_part[0])
    if 'GB' in size_string.upper():
        return size * 1024
    elif 'KB' in size_string.upper():
        return size / 1024
    else:
        return size

def preprocess_app_details_data(raw_data):
    clean_data = []
    for app in raw_data:
        # Memastikan 'price' ada sebelum diolah
        raw_price = app.get("price", "") or "" # Mengatasi jika nilai price adalah None
        price_cleaned = "Free" if "free" in raw_price.lower() else raw_price

        raw_maturity = app.get("maturity", "N/A") or "N/A" # Mengatasi jika nilai maturity adalah None
        maturity_cleaned = None if raw_maturity == "N/A" else raw_maturity.replace(" Maturity", "").strip()

        apk_size_mb = parse_apk_size_to_mb(app.get("apk_size"))
        
        price_numeric = 0.0 if price_cleaned == "Free" else None

        processed_app = {
            "app_name": app.get("app_name"),
            "developer": app.get("developer"),
            "category": app.get("category"),
            "price_text": price_cleaned, 
            "price_numeric": price_numeric,
            "apk_size_mb": apk_size_mb,
            "maturity": maturity_cleaned,
            "source_url": app.get("source_url")
        }
        clean_data.append(processed_app)
    return clean_data

# --- Bagian Utama Skrip ---
if __name__ == "__main__":
    input_dir = os.path.join('Data Scraping', 'data')
    input_filename = 'app_details_200.json'
    output_filename = 'app_details_clean.json'
    
    input_path = os.path.join(input_dir, input_filename)
    output_path = os.path.join(input_dir, output_filename)

    try:
        with open(input_path, 'r', encoding='utf-8') as f:
            raw_data = json.load(f)
        print(f"Berhasil memuat {len(raw_data)} data dari {input_filename}.")
    except FileNotFoundError:
        print(f"Error: File '{input_filename}' tidak ditemukan.")
        exit()

    clean_data = preprocess_app_details_data(raw_data)
    print("Preprocessing data detail aplikasi selesai.")

    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(clean_data, f, indent=4, ensure_ascii=False)
    print(f"Data bersih berhasil disimpan di '{output_path}'.")