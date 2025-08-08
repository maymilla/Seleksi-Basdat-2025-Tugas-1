import json
import os
import re

def parse_installs(install_string):
    """
    Mengubah string seperti "630 M", "3.8 B", "950 K" menjadi angka integer.
    """
    if not isinstance(install_string, str):
        return None

    # Menggunakan regular expression untuk mengekstrak angka
    number_part = re.findall(r'[\d.]+', install_string)
    if not number_part:
        return None

    number = float(number_part[0])
    
    # Menentukan pengali berdasarkan huruf di akhir string
    if 'B' in install_string.upper():
        multiplier = 1_000_000_000
    elif 'M' in install_string.upper():
        multiplier = 1_000_000
    elif 'K' in install_string.upper():
        multiplier = 1_000
    else:
        multiplier = 1
        
    return int(number * multiplier)

def preprocess_ranking_data(raw_data):
    """
    Melakukan preprocessing pada data dari ranking.json.
    """
    clean_data = []
    for app in raw_data:
        processed_app = {
            "app_name": app.get("app_name"),
            "rank": int(app.get("rank")),
            "rating": float(app.get("rating")),
            "total_installs": parse_installs(app.get("total_installs")),
            "recent_installs": parse_installs(app.get("recent_installs"))
        }
        clean_data.append(processed_app)
    return clean_data

# --- Bagian Utama Skrip ---
if __name__ == "__main__":
    # Path ke file input dan output
    input_dir = os.path.join('Data Scraping', 'data')
    input_filename = 'ranking.json'
    output_filename = 'ranking_clean.json'
    
    input_path = os.path.join(input_dir, input_filename)
    output_path = os.path.join(input_dir, output_filename)

    # 1. Memuat data mentah dari ranking.json
    try:
        with open(input_path, 'r', encoding='utf-8') as f:
            raw_data = json.load(f)
        print(f"Berhasil memuat {len(raw_data)} data dari {input_filename}.")
    except FileNotFoundError:
        print(f"Error: File '{input_filename}' tidak ditemukan.")
        exit()

    # 2. Melakukan proses preprocessing
    clean_data = preprocess_ranking_data(raw_data)
    print("Preprocessing data ranking selesai.")

    # 3. Menyimpan data yang sudah bersih ke file baru
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(clean_data, f, indent=4, ensure_ascii=False)
    print(f"Data bersih berhasil disimpan di '{output_path}'.")