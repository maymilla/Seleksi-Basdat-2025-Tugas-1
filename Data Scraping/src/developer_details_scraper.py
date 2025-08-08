from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.common.exceptions import NoSuchElementException, TimeoutException
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager
from bs4 import BeautifulSoup
import time
import json
import os
import re

# URL dan konstanta
RANKING_URL = 'https://www.appbrain.com/stats/google-play-rankings/top_free/all/us'
BASE_URL = 'https://www.appbrain.com'
TARGET_APP_COUNT = 200 # Target jumlah aplikasi yang akan di-scrape

def setup_driver():
    """Menginisialisasi dan mengembalikan instance Selenium WebDriver."""
    try:
        service = Service(ChromeDriverManager().install())
        driver = webdriver.Chrome(service=service)
        return driver
    except Exception as e:
        print(f"Error saat setup Selenium WebDriver: {e}")
        print("Pastikan Google Chrome sudah terinstall di komputer Anda.")
        exit()

def get_developer_links(driver, url, limit):
    """
    Mengambil link developer unik dari aplikasi sebanyak 'limit'.
    """
    driver.get(url)
    print(f"Mengakses URL peringkat: {url}")
    time.sleep(3)

    app_rows_html = []
    page_count = 1
    
    # Kumpulkan HTML baris tabel dari setiap halaman hingga target tercapai
    while len(app_rows_html) < limit:
        print(f"\n--- Mengambil baris data dari Halaman Peringkat {page_count} ---")
        page_source = driver.page_source
        soup = BeautifulSoup(page_source, 'html.parser')
        
        table_body = soup.find('table', id='rankings-table').find('tbody')
        if not table_body:
            print("Tabel peringkat tidak ditemukan.")
            break
            
        rows = table_body.find_all('tr')
        for row in rows:
            app_rows_html.append(str(row))
        
        print(f"{len(rows)} baris aplikasi ditemukan di halaman ini. Total terkumpul: {len(app_rows_html)}.")

        try:
            # Cari tombol 'Next' dan klik
            next_button = driver.find_element(By.LINK_TEXT, "Next")
            driver.execute_script("arguments[0].click();", next_button)
            print("Menuju ke halaman berikutnya...")
            page_count += 1
            time.sleep(3)
        except NoSuchElementException:
            print("\nTombol 'Next' tidak ditemukan. Berhenti mengambil halaman.")
            break

    # Ekstrak link developer unik dari baris HTML yang sudah terkumpul
    unique_dev_links = []
    print(f"\nMengekstrak link developer unik dari {limit} aplikasi teratas...")
    for row_html in app_rows_html[:limit]:
        row_soup = BeautifulSoup(row_html, 'html.parser')
        try:
            creator_div = row_soup.find('div', class_='ranking-app-cell-creator')
            link_tag = creator_div.find('a')
            if link_tag and 'href' in link_tag.attrs:
                relative_url = link_tag['href']
                full_url = BASE_URL + relative_url
                if full_url not in unique_dev_links:
                    unique_dev_links.append(full_url)
        except (AttributeError, IndexError):
            continue

    print(f"Berhasil mengumpulkan {len(unique_dev_links)} link developer unik.")
    return unique_dev_links

def find_infotile_data(soup, label_text):
    """
    Fungsi bantuan untuk mengekstrak data dari 'infotiles' di halaman developer.
    """
    try:
        infotiles = soup.find_all('div', class_='infotile')
        for tile in infotiles:
            bottom_div = tile.find('div', class_='infotile-bottom')
            if bottom_div and label_text.lower() in bottom_div.text.lower():
                main_text = tile.find('div', class_='infotile-text').text.strip()
                sub_text_div = tile.find('div', class_='infotile-subtext')
                sub_text = sub_text_div.text.strip() if sub_text_div else ""
                return f"{main_text} {sub_text}".strip()
    except AttributeError:
        return "N/A"
    return "N/A"

def scrape_developer_details(driver, dev_url):
    """
    Mengambil detail dari satu halaman developer.
    """
    driver.get(dev_url)
    dev_data = {
        'developer_name': 'N/A', 'active_since': 'N/A', 'app_count': 'N/A',
        'total_downloads': 'N/A', 'average_rating': 'N/A',
        'total_rating_count': 'N/A', 'source_url': dev_url
    }
    try:
        WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.CLASS_NAME, "infotiles"))
        )
        soup = BeautifulSoup(driver.page_source, 'html.parser')
        
        try:
            dev_data['developer_name'] = soup.find('h1', itemprop='name').text.strip()
        except AttributeError: pass
        
        dev_data['active_since'] = find_infotile_data(soup, "Active since")
        dev_data['app_count'] = find_infotile_data(soup, "App count")
        dev_data['total_downloads'] = find_infotile_data(soup, "Downloads")
        dev_data['average_rating'] = find_infotile_data(soup, "Average rating")
        dev_data['total_rating_count'] = find_infotile_data(soup, "Rating count")
    except TimeoutException:
        print(f"  -> Halaman {dev_url} tidak dimuat tepat waktu.")
    except Exception as e:
        print(f"  -> Terjadi error saat scraping {dev_url}: {e}")
    return dev_data

def main():
    """Fungsi utama untuk menjalankan proses scraping."""
    driver = setup_driver()
    
    # Tahap 1: Kumpulkan link developer unik dari 200 aplikasi teratas
    dev_links_to_scrape = get_developer_links(driver, RANKING_URL, limit=TARGET_APP_COUNT)
    if not dev_links_to_scrape:
        print("Tidak ada link developer untuk di-scrape. Program berhenti.")
        driver.quit()
        return

    all_dev_details = []
    
    # Tahap 2: Scrape detail untuk setiap link developer unik
    actual_count = len(dev_links_to_scrape)
    print(f"\n>>> Memulai scraping detail untuk {actual_count} developer unik... <<<")
    
    for i, link in enumerate(dev_links_to_scrape):
        print(f"Scraping {i+1}/{actual_count}: {link}")
        details = scrape_developer_details(driver, link)
        all_dev_details.append(details)
        print(f"-> Selesai scraping untuk: {details.get('developer_name', 'N/A')}")
        time.sleep(1) # Jeda sopan antar request

    driver.quit()

    # Menyimpan hasil ke dalam file JSON
    output_dir = os.path.join('Data Scraping', 'data')
    os.makedirs(output_dir, exist_ok=True)
    output_path = os.path.join(output_dir, f'developer_details_top{TARGET_APP_COUNT}.json')

    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(all_dev_details, f, indent=4, ensure_ascii=False)

    print(f"\nScraping SELESAI. Total {len(all_dev_details)} detail developer berhasil disimpan di '{output_path}'")

if __name__ == '__main__':
    main()