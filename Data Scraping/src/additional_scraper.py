from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from unidecode import unidecode
import json
import time
import re
from difflib import get_close_matches
import os

# Fungsi untuk memecah teks jadi kata-kata
def tokenize(text):
    return set(re.findall(r'\b[a-z]+\b', text.lower()))

# Fungsi untuk mencari dish_id berdasarkan kecocokan dengan recipe_name
def find_best_match(guess_name, dish_name_to_id):
    if not guess_name or guess_name == "N/A":
        return None

    guess_tokens = tokenize(guess_name)
    best_match = None
    best_score = 0
    
    for dish_name, dish_id in dish_name_to_id.items():
        dish_tokens = tokenize(dish_name)

        # Skip kalau dua-duanya kosong
        max_len = max(len(guess_tokens), len(dish_tokens))
        if max_len == 0:
            continue

        common_words = guess_tokens & dish_tokens
        score = len(common_words) / max_len
        
        if score > best_score:
            best_score = score
            best_match = dish_id
    
    if best_score >= 0.5:
        return best_match
    return None

# Fungsi untuk scrape category
def scrape_categories(driver):
    # Menunggu sampai header bar tempat categories berada sudah muncul
    WebDriverWait(driver, 15).until(EC.presence_of_element_located((By.CSS_SELECTOR, ".menu-item")))

    try:
        # Mencari menu "Foods" (elemen dengan link text = "Foods") lalu diklik
        foods_menu = driver.find_element(By.LINK_TEXT, "Foods")
        foods_menu.click()
        time.sleep(2)

        # Mencari menu "Dishes" (elemen dengan <span> text mengandung "Dishes") lalu diklik
        dishes_menu = driver.find_element(By.XPATH, "//span[contains(text(),'Dishes')]")
        dishes_menu.click()
        time.sleep(2)

        # Mencari daftar categories (yang di dalam div-nya terdapat <a> yang punya atribut ng-repeat="foodItem")
        categories = driver.find_elements(By.CSS_SELECTOR, "div[ng-repeat*='foodItem'] a")
        category_list = [] # Link untuk menyimpan data categories

        # Menyimpan categories yang sudah ditemukan ke dalam list category
        for idx, cat in enumerate(categories):
            try:
                category_name = cat.text.strip()
                if category_name:
                    category_list.append({
                        "category_id": f"cat{idx+1:03d}",
                        "category_name": category_name
                    })
            except Exception as e:
                continue

            # Print untuk mengecek hasil
            # print(f'[{idx+1}] {category_name}')

        # Menyimpan data ke format JSON
        with open("../data/category.json", "w", encoding="utf-8") as f:
            json.dump(category_list, f, indent=2, ensure_ascii=False)

        print(f"Berhasil scrape {len(category_list)} categories")
    except Exception as e:
        print(f"Gagal scrape categories: {e}")

# Fungsi untuk scrape countries 
def scrape_countries(driver):
    # Menunggu sampai header bar tempat countries berada sudah muncul
    WebDriverWait(driver, 15).until(EC.presence_of_element_located((By.CSS_SELECTOR, ".menu-item")))

    try:
        dest_menu = driver.find_element(By.LINK_TEXT, "Destinations")
        dest_menu.click()
        time.sleep(2)

        continents = ["Africa", "Asia", "Australia", "Europe", "North America", "South America"]
        country_list = [] # List untuk menyimpan data countries
        country_id = 1

        # Mengambil daftar negara di setiap continent
        for cont in continents:
            try:
                # Mencari tab continent lalu diklik
                cont_tab = driver.find_element(By.XPATH, f"//span[contains(text(),'{cont}')]")
                cont_tab.click()
                time.sleep(2)

                # Mencari daftar countries
                countries = driver.find_elements(By.CSS_SELECTOR, "div[ng-repeat*='country'] a")

                # Menambahkan data ke list country
                for c in countries:
                    try:
                        country_name = c.text.strip()
                        if country_name:
                            country_list.append({
                                "country_id": f"ctr{country_id+1:03d}",
                                "country_name": country_name,
                                "continent": cont
                            })
                            country_id += 1
                    except Exception as e:
                        continue
            except Exception as e:
                continue

        # Menyimpan data ke format JSON
        with open("../data/countries.json", "w", encoding="utf-8") as f:
            json.dump(country_list, f, indent=2, ensure_ascii=False)

        print(f"Berhasil scrape {len(country_list)} countries")

    except Exception as e:
        print(f"Gagal scrape countries: {e}")

# Fungsi untuk scrape recipes tambahan
def scrape_recipes(driver):
    WebDriverWait(driver, 7).until(EC.presence_of_element_located((By.CSS_SELECTOR, ".menu-item")))

    # Load dishes.json untuk mapping dish_name menjadi dish_id
    with open("../data/dishes.json", "r", encoding="utf-8") as f:
        dishes_data = json.load(f)
    dish_name_to_id = {d['dish_name'].lower(): d['dish_id'] for d in dishes_data}

    # Cari nomor terakhir recipe_id dari file recipes.json
    last_number = 0
    recipes_file1_path = "../data/recipes.json"
    if os.path.exists(recipes_file1_path):
        with open(recipes_file1_path, "r", encoding="utf-8") as f:
            recipes_file1 = json.load(f)
        last_number = max(
            [int(r['recipe_id'][3:]) for r in recipes_file1 if r['recipe_id'].startswith("rec")],
            default=0
        )

    # Klik menu "Recipes"
    try:
        recipes_menu = driver.find_element(By.LINK_TEXT, "Recipes")
        recipes_menu.click()
        time.sleep(4)
    except Exception as e:
        return
    
    # Klik "LOAD MORE" dua kali aja
    for i in range(5):
        try:
            load_more_btn = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button[ng-click*='loadMoreRecipesItems']")))
            driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", load_more_btn)
            time.sleep(1)
            load_more_btn.click()
            time.sleep(3)
        except Exception as e:
            break
    
    items = driver.find_elements(By.CSS_SELECTOR, "div.recipe-result-list__item")
    new_recipes = []

    # Mengambil data yang tersedia
    for idx, item in enumerate(items):
        try:
            name = item.find_element(By.CSS_SELECTOR, "h3.recipe-name").text.strip()
        except:
            name = "N/A"

        try:
            rating = item.find_element(By.CSS_SELECTOR, ".rating-col--wrapper p").text.strip()
        except:
            rating = "N/A"

        try:
            prep = item.find_element(By.CSS_SELECTOR, ".preparation-wrapper div[ng-if*='PrepTime'] span").text.strip()
        except:
            prep = "N/A"

        try:
            cook = item.find_element(By.CSS_SELECTOR, ".preparation-wrapper div[ng-if*='CookTime'] span").text.strip()
        except:
            cook = "N/A"

        try:
            ready_in = item.find_element(By.CSS_SELECTOR, ".preparation-wrapper div[ng-if*='TotalTime'] span").text.strip()
        except:
            ready_in = "N/A"

        try:
            desc = item.find_element(By.CSS_SELECTOR, ".details-main-txt p").text.strip()
        except:
            desc = "N/A"

        # print(f"[{idx+1}] {name} | {rating} | {prep} | {cook} | {ready_in}")

        # Menambahkan data ke list
        dish_id = find_best_match(name, dish_name_to_id) # cari dish yang cocok dan ambil idnya
        new_recipes.append({
            "dish_id": dish_id,
            "recipe_id": f"rec{last_number + idx + 1:03d}",
            "variation_name": name,
            "rating": rating,
            "prep": prep,
            "cook": cook,
            "ready_in": ready_in,
            "desc": desc
        })

    # Gabungkan dengan file recipes2.json
    recipes_file_path = "../data/recipes.json"
    if os.path.exists(recipes_file_path):
        with open(recipes_file_path, "r", encoding="utf-8") as f:
            old_data = json.load(f)
    else:
        old_data = []

    all_recipes = old_data + new_recipes

    with open(recipes_file_path, "w", encoding="utf-8") as f:
        json.dump(all_recipes, f, indent=2, ensure_ascii=False)

    print(f"Berhasil scrape {len(new_recipes)} recipes baru, total sekarang {len(all_recipes)} recipes di recipes.json")

def scrape_quality_label(driver):
    WebDriverWait(driver, 15).until(EC.presence_of_element_located((By.CSS_SELECTOR, ".menu-item")))

    try:
        # Klik menu "Quality Labels"
        quality_menu = driver.find_element(By.LINK_TEXT, "Quality Labels")
        quality_menu.click()
        time.sleep(3)

        seen_links = set()
        label_data = []
        idx_counter = 1

        while True:
            visible_labels = driver.find_elements(By.CSS_SELECTOR, ".swiper-slide a")

            for a_tag in visible_labels:
                try:
                    link = a_tag.get_attribute("href")
                    if not link or link in seen_links:
                        continue
                    seen_links.add(link)

                    # Buka halaman detail label
                    driver.execute_script("window.open(arguments[0]);", link)
                    driver.switch_to.window(driver.window_handles[1])
                    time.sleep(1.5)

                    # Ambil data yang tersedia
                    try:
                        wrapper = driver.find_element(By.CSS_SELECTOR, ".certificate-header__wrapper")
                        label_name = wrapper.find_element(By.CSS_SELECTOR, "h1.heading").text.strip()
                        label_img = wrapper.find_element(By.TAG_NAME, "img").get_attribute("src")
                        desc = wrapper.find_element(By.CSS_SELECTOR, "p.heading-txt").text.strip()
                    except:
                        label_name = "N/A"
                        label_img = "N/A"
                        desc = "N/A"

                    driver.close()
                    driver.switch_to.window(driver.window_handles[0])

                    label_data.append({
                        "label_id": f"lab{idx_counter:03d}",
                        "label_name": label_name,
                        "label_img": label_img,
                        "desc": desc
                    })
                    idx_counter += 1
                except:
                    continue

            # Klik tombol next
            try:
                next_btn = driver.find_element(By.CSS_SELECTOR, ".swiper-button-next")
                next_btn.click()
                time.sleep(0.8)
            except:
                break

            if len(seen_links) >= 22:
                break

        # Simpan ke JSON
        with open("../data/quality_labels.json", "w", encoding="utf-8") as f:
            json.dump(label_data, f, indent=2, ensure_ascii=False)

        print(f"Berhasil scrape {len(label_data)} quality labels")

    except Exception as e:
        print(f"Gagal scrape quality labels: {e}")


# Memanggil fungsi
if __name__ == "__main__":
    # Setup konfigurasi browser
    options = Options()
    options.add_argument("--headless")
    options.add_argument("--disable-gpu")
    options.add_argument("--window-size=1920,1080")
    options.add_experimental_option('excludeSwitches', ['enable-logging'])

    # Menjalankan Chrome
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)
    url = "https://www.tasteatlas.com/best-rated-dishes-in-the-world"
    driver.get(url) # Mengirim HTTP request untuk membuka halaman, render HTML, dan menjalankan JavaScript
    time.sleep(7)
    
    # Memanggil setiap fungsi
    scrape_categories(driver)
    scrape_countries(driver)
    scrape_recipes(driver)
    scrape_quality_label(driver)
    
    driver.quit()