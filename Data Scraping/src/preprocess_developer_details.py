import json
import os
import re

def convert_to_number(text):
    """
    Mengubah teks seperti '600 million', '23 million', '150 thousand' menjadi angka integer.
    """
    if not isinstance(text, str):
        return None

    text = text.lower()
    number_part = re.findall(r'[\d.]+', text)
    if not number_part:
        return None

    number = float(number_part[0])
    
    if 'billion' in text:
        multiplier = 1_000_000_000
    elif 'million' in text:
        multiplier = 1_000_000
    elif 'thousand' in text:
        multiplier = 1_000
    else:
        multiplier = 1
        
    return int(number * multiplier)

def preprocess_developer_data(raw_data):
    """
    Melakukan preprocessing pada data developer dengan memisahkan tahun dan bulan.
    """
    clean_data = []
    for dev in raw_data:
        # Parsing: Pisahkan tahun dan bulan dari 'active_since'
        active_since_str = dev.get('active_since')
        year, month = None, None
        if active_since_str and active_since_str.upper() != 'N/A':
            parts = active_since_str.split()
            if len(parts) == 2:
                try:
                    year = int(parts[0])
                    month_map = {
                        "january": 1, "february": 2, "march": 3, "april": 4, 
                        "may": 5, "june": 6, "july": 7, "august": 8, 
                        "september": 9, "october": 10, "november": 11, "december": 12
                    }
                    month = month_map.get(parts[1].lower())
                except (ValueError, IndexError):
                    year, month = None, None

        # Transformation: Ubah semua nilai relevan ke tipe data numerik
        try:
            app_count = int(dev.get('app_count')) if dev.get('app_count') else None
        except (ValueError, TypeError):
            app_count = None
            
        try:
            avg_rating = float(dev.get('average_rating')) if dev.get('average_rating') else None
        except (ValueError, TypeError):
            avg_rating = None

        processed_dev = {
            'developer_name': dev.get('developer_name'),
            'active_year': year,
            'active_month': month,
            'app_count': app_count,
            'total_downloads': convert_to_number(dev.get('total_downloads')),
            'average_rating': avg_rating,
            'total_rating_count': convert_to_number(dev.get('total_rating_count')),
            'source_url': dev.get('source_url')
        }
        clean_data.append(processed_dev)
    return clean_data

# --- Bagian Utama Skrip ---
if __name__ == "__main__":
    input_dir = os.path.join('Data Scraping', 'data')
    input_filename = 'developer_details_top200.json'
    output_filename = 'developer_details_clean.json'
    
    input_path = os.path.join(input_dir, input_filename)
    output_path = os.path.join(input_dir, output_filename)

    try:
        with open(input_path, 'r', encoding='utf-8') as f:
            raw_data = json.load(f)
        print(f"Berhasil memuat {len(raw_data)} data dari {input_filename}.")
    except FileNotFoundError:
        print(f"Error: File '{input_filename}' tidak ditemukan.")
        exit()

    clean_data = preprocess_developer_data(raw_data)
    print("Preprocessing data developer selesai.")

    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(clean_data, f, indent=4, ensure_ascii=False)
    print(f"Data bersih berhasil disimpan di '{output_path}'.")