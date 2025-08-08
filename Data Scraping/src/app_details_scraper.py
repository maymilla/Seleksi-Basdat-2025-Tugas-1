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

def get_app_links(driver, url, limit):
    """
    Mengambil link dari semua halaman hingga mencapai jumlah 'limit'.
    """
    driver.get(url)
    print(f"Mengakses URL: {url}")
    time.sleep(3) 

    app_links = []
    page_count = 1

    # Loop akan berjalan hingga tombol 'Next' tidak ada atau limit tercapai
    while True:
        print(f"\n--- Mengambil link dari Halaman Peringkat {page_count} ---")
        page_source = driver.page_source
        soup = BeautifulSoup(page_source, 'html.parser')
        
        table_body = soup.find('table', id='rankings-table').find('tbody')
        if not table_body:
            print("Tabel peringkat tidak ditemukan.")
            break
        
        links_on_page = 0
        for row in table_body.find_all('tr'):
            app_cell = row.find_all('td')[3]
            app_link_tag = app_cell.find('a')
            if app_link_tag and 'href' in app_link_tag.attrs:
                relative_url = app_link_tag['href']
                full_url = BASE_URL + relative_url
                app_links.append(full_url)
                links_on_page += 1
                # Hentikan penambahan link jika sudah mencapai target
                if len(app_links) >= limit:
                    break
        
        print(f"{links_on_page} link aplikasi ditemukan di halaman ini. Total terkumpul: {len(app_links)}.")

        # Hentikan looping jika sudah mencapai target
        if len(app_links) >= limit:
            print(f"\nTarget {limit} link aplikasi telah tercapai. Berhenti mengambil link.")
            break

        try:
            # Cari tombol 'Next' dan klik
            next_button = driver.find_element(By.LINK_TEXT, "Next")
            driver.execute_script("arguments[0].click();", next_button)
            print("Menuju ke halaman berikutnya...")
            page_count += 1
            time.sleep(3)
        except NoSuchElementException:
            print("\nTombol 'Next' tidak ditemukan. Selesai mengumpulkan semua link yang ada.")
            break
            
    return app_links

def find_detail_in_table(soup, label_text):
    """
    Fungsi bantuan untuk mencari data dalam tabel di halaman detail.
    """
    try:
        all_labels = soup.find_all('b')
        for label in all_labels:
            if label_text.lower() in label.text.lower():
                value_cell = label.find_parent('td').find_next_sibling('td')
                return value_cell.text.strip()
    except AttributeError:
        return "N/A"
    return "N/A"

def scrape_app_details(driver, app_url):
    """
    Mengambil detail dari satu halaman aplikasi dengan selector yang sudah diperbarui.
    """
    driver.get(app_url)
    
    app_data = {
        'app_name': 'N/A', 'developer': 'N/A', 'price': 'N/A',
        'apk_size': 'N/A', 'maturity': 'N/A', 'category': 'N/A',
        'source_url': app_url
    }

    try:
        WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.ID, "main_content"))
        )
        soup = BeautifulSoup(driver.page_source, 'html.parser')

        try:
            app_data['app_name'] = soup.find('h1', itemprop='name').text.strip()
        except AttributeError:
            pass

        try:
            app_data['developer'] = soup.select_one('span[itemprop="author"] span[itemprop="name"]').text.strip()
        except AttributeError:
            pass

        try:
            category_span = soup.select_one('meta[itemprop="position"][content="2"]').parent.find('span', itemprop='name')
            app_data['category'] = category_span.text.strip()
        except AttributeError:
            pass

        app_data['price'] = find_detail_in_table(soup, "Price")
        app_data['apk_size'] = find_detail_in_table(soup, "APK size")
        app_data['maturity'] = find_detail_in_table(soup, "Maturity")

    except TimeoutException:
        print(f"  -> Halaman {app_url} tidak dimuat tepat waktu.")
    except Exception as e:
        print(f"  -> Terjadi error saat scraping {app_url}: {e}")
        
    return app_data

def main():
    """Fungsi utama untuk menjalankan keseluruhan proses scraping."""
    driver = setup_driver()
    
    # Tahap 1: Kumpulkan URL aplikasi hingga batas TARGET_APP_COUNT
    app_links_to_scrape = get_app_links(driver, RANKING_URL, TARGET_APP_COUNT)
    if not app_links_to_scrape:
        print("Tidak ada link untuk di-scrape. Program berhenti.")
        driver.quit()
        return

    all_app_details = []
    
    # Pastikan kita hanya memproses sejumlah target, bahkan jika get_app_links mengambil lebih sedikit
    links_to_process = app_links_to_scrape[:TARGET_APP_COUNT]
    actual_count = len(links_to_process)
    
    print(f"\n>>> Memulai scraping detail untuk {actual_count} aplikasi... <<<")
    for i, link in enumerate(links_to_process):
        print(f"Scraping {i+1}/{actual_count}: {link}")
        details = scrape_app_details(driver, link)
        all_app_details.append(details)
        print(f"-> Selesai scraping untuk: {details.get('app_name', 'N/A')}")
        time.sleep(1) # Jeda sopan

    driver.quit()

    output_dir = os.path.join('Data Scraping', 'data')
    os.makedirs(output_dir, exist_ok=True)
    output_path = os.path.join(output_dir, f'app_details_{actual_count}.json')

    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(all_app_details, f, indent=4, ensure_ascii=False)

    print(f"\nScraping SELESAI. Total {len(all_app_details)} detail aplikasi berhasil disimpan di '{output_path}'")

if __name__ == '__main__':
    main()