from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.common.exceptions import NoSuchElementException
from webdriver_manager.chrome import ChromeDriverManager
from bs4 import BeautifulSoup
import time
import json
import os

URL = 'https://www.appbrain.com/stats/google-play-rankings/top_free/all/us'

try:
    service = Service(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=service)
except Exception as e:
    print(f"Error saat setup Selenium WebDriver: {e}")
    print("Pastikan Google Chrome sudah terinstall di komputer Anda.")
    exit()

driver.get(URL)
print(f"Mengakses URL: {URL}")

time.sleep(3)

all_scraped_apps = []
page_count = 1

while True:
    print(f"\n--- Scraping Halaman {page_count} ---")
    
    page_source = driver.page_source
    soup = BeautifulSoup(page_source, 'html.parser')
    
    table_body = soup.find('table', id='rankings-table').find('tbody')
    
    if not table_body:
        print("Tabel tidak ditemukan.")
        break

    rows_on_page = 0
    for row in table_body.find_all('tr'):
        cols = row.find_all('td')
        if len(cols) >= 8:
            try:
                app_name = cols[3].find('a').text.strip()
                rank = cols[0].text.strip()
                rating = cols[5].find('span').text.strip()
                installs = cols[6].text.strip()
                recent_installs = cols[7].text.strip()

                app_data = {
                    'app_name': app_name,
                    'rank': int(rank),
                    'rating': float(rating),
                    'total_installs': installs,
                    'recent_installs': recent_installs
                }
                all_scraped_apps.append(app_data)
                rows_on_page += 1
            except (AttributeError, IndexError):
                continue
    
    print(f"{rows_on_page} aplikasi ditemukan di halaman ini.")

    try:
        # Cari link <a> yang teksnya persis 'Next'
        next_button = driver.find_element(By.LINK_TEXT, "Next")
        
        # --- PERBAIKAN DI SINI ---
        # Gunakan JavaScript untuk mengklik elemen, ini menghindari masalah tumpang tindih
        print("Menekan tombol 'Next' untuk ke halaman berikutnya...")
        driver.execute_script("arguments[0].click();", next_button)
        
        page_count += 1
        time.sleep(3)

    except NoSuchElementException:
        print("\nTombol 'Next' tidak ditemukan. Scraping selesai.")
        break

driver.quit()

# Path untuk menyimpan file output diubah agar sesuai dengan struktur folder Anda
output_dir = os.path.join('Data Scraping', 'data')
os.makedirs(output_dir, exist_ok=True)
output_path = os.path.join(output_dir, 'ranking.json')

# Simpan hasil ke file JSON
with open(output_path, 'w', encoding='utf-8') as f:
    json.dump(all_scraped_apps, f, indent=4, ensure_ascii=False)

print(f"\nScraping SELESAI. Total {len(all_scraped_apps)} aplikasi berhasil disimpan di '{output_path}'")