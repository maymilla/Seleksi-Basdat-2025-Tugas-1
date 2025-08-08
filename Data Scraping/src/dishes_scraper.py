from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from unidecode import unidecode
from bs4 import BeautifulSoup
import json
import time
import re
import os

# Fungsi untuk scroll sampai dua elemen restoran muncul
def scroll_until_restaurants_loaded(driver, min_count=2, max_scrolls=15):
    for i in range(max_scrolls):
        elems = driver.find_elements(By.CSS_SELECTOR, ".where-to-eat__column-list .item-header a.name")
        visible_elems = [el for el in elems if el.is_displayed()]
        if len(visible_elems) >= min_count:
            return True
        driver.execute_script("window.scrollBy(0, 400);")
        time.sleep(1.5)
    return False

# Fungsi untuk scrape dishes
def scrape_dishes(driver, limit=100):
    base_url = "https://www.tasteatlas.com/best-rated-dishes-in-the-world"
    driver.get(base_url)
    time.sleep(7)

    # Kalau limit > 25, klik "LOAD MORE" untuk memuat data urutan ke-26-100 (2 kali karena kadang kalau sekali tetap gagal)
    if limit > 25:
        for _ in range(2):
            try:
                load_more = driver.find_element(By.CSS_SELECTOR, "button.btn--inline")
                load_more.click()
                time.sleep(2)
            except:
                break

    # Scroll biar semua elemennya kebuka
    for _ in range(3):
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
        time.sleep(2)

    items = driver.find_elements(By.CSS_SELECTOR, "div.top-list-article__item")
    print(f"\n Memuat {len(items)} items, akan discrape {min(limit, len(items))}\n")

    all_dishes = []
    all_recipes = []
    all_restaurants = []
    all_comments = []

    # Iterasi untuk mengambil data
    for i in range(limit):
        dish_id = f"dis{str(i+1).zfill(3)}"
        print(f"\n=======Scraping dish ke-{i+1}=======")

        try:
            WebDriverWait(driver, 5).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, "div.top-list-article__item")))
            time.sleep(1)
        except:
            print("Gagal load daftar dish.")
            continue

        dish_cards = driver.find_elements(By.CSS_SELECTOR, ".top-list-article__item")
        
        if i >= len(dish_cards):
            print(f"Dish ke-{i+1} tidak tersedia di halaman.")
            continue

        item = dish_cards[i]
        # Mencarai parent title untuk top 1-25
        try:
            parent = item.find_element(By.CSS_SELECTOR, ".top-list-article__item-title")
        except:
            parent = None

        # Mengambil data nama makanan
        try:
            name_elem = WebDriverWait(item, 5).until(
                EC.presence_of_element_located(
                    (By.CSS_SELECTOR, ".middle-right-part .certificate-container h2 a, .middle .certificate-container h2 a")
                )
            )
            raw_name = name_elem.text.strip()
            if raw_name == "":
                raw_name = name_elem.get_attribute("innerText").strip()
        except:
            try:
                raw_name = parent.find_element(By.TAG_NAME, "h2").text.strip()
            except:
                try:
                    raw_name = item.find_element(By.TAG_NAME, "h2").text.strip()
                except:
                    raw_name = "N/A"

        name = raw_name

        # Mengambil data nama makanan yang didalam kurung saja
        match = re.search(r'\((.*?)\)', raw_name)
        if match:
            real_name = match.group(1)
        else:
            real_name = raw_name

        # Mengkonversi nama menjadi unidecode, huruf kecil, dan mengganti spasi menjadi "-" untuk keperluan mencari link
        converted_name = unidecode(real_name).lower().replace(" ", "-")

        # Mencari link menggunakan converted_name
        try:
            links = item.find_elements(By.TAG_NAME, "a")
            detail_link = ""
            for l in links:
                href = l.get_attribute("href")
                if href and converted_name in href.lower():
                    detail_link = href
                    break

            # Fallback kalau real_name ga ketemu
            if detail_link == "":
                try:
                    name_link = parent.find_element(By.TAG_NAME, "h2").find_element(By.TAG_NAME, "a")
                    detail_link = name_link.get_attribute("href")
                except:
                    detail_link = "N/A"
        except:
            detail_link = "N/A"

        # Link detail dish
        detail_link = ""
        for l in item.select("a"):
            href = l.get("href", "")
            if converted_name in href.lower():
                detail_link = href
                break

        if not detail_link:
            detail_link = "N/A"

        # Tambahin domain kalau link relatif
        if detail_link.startswith("/"):
            detail_link = "https://www.tasteatlas.com" + detail_link

        # Cek valid URL sebelum get
        if detail_link != "N/A" and detail_link.startswith("http"):
            driver.get(detail_link)
            time.sleep(2)
            soup = BeautifulSoup(driver.page_source, "html.parser")
        else:
            print("Detail link tidak valid, skip dish ini.")
            continue


        # Akses page detail dish
        driver.get(detail_link)
        try:
            WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CSS_SELECTOR, "nav.tab__nav ul li")))
            time.sleep(1)
        except:
            print("Halaman gagal dimuat.")

        # ========== DISH ==========
        print(f"\nMengambil data makanan")
        try: 
            category = driver.find_element(By.CSS_SELECTOR, ".group a.category-name-items.ng-binding").text.strip()
        except: 
            category = "N/A"

        try:
            cert_element = driver.find_element(By.CSS_SELECTOR, ".certificate__container i.certificate__item")
            certificate = cert_element.get_attribute("title").strip()
        except:
            certificate = "N/A"

        try: 
            origin = driver.find_element(By.CSS_SELECTOR, ".region").text.strip()
        except: 
            origin = "N/A"

        try:
            dish_desc = driver.find_element(By.CSS_SELECTOR, ".read-more--hidden.ng-scope").text.strip()
        except:
            dish_desc = "N/A"

        try: 
            dish_rating = driver.find_element(By.CSS_SELECTOR, ".main-score span").text.strip()
        except: 
            dish_rating = "N/A"

        try:
            img = driver.find_element(By.CSS_SELECTOR, "div[ng-if='photo.Image'] img.img")
            image = img.get_attribute("src").strip()
        except:
            image = "N/A"

        # ========== RECIPE ==========
        print("\nMengambil data resep")
        # Coba cari semua tab navigasi dulu
        tabs = driver.find_elements(By.CSS_SELECTOR, "nav.tab__nav ul li a")
        has_recipe_tab = False
        for tab in tabs:
            if "recipe" in tab.get_attribute("href"):
                has_recipe_tab = True
                recipe_tab = tab
                break

        if has_recipe_tab:
            try:
                driver.execute_script("arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'})", recipe_tab)
                WebDriverWait(driver, 10).until(EC.element_to_be_clickable(recipe_tab))
                recipe_tab.click()
                time.sleep(2)
            except Exception as e:
                print(f"Gagal klik tab 'Recipes': {e}")
        else:
            print("Tab 'Recipes' tidak tersedia.")

        
        try:
            recipe_tab = driver.find_element(By.CSS_SELECTOR, "nav.tab__nav ul li a[ng-href*='recipe']")
            recipe_tab.click()
            time.sleep(2)

            # Scroll ke bawah biar bagian variasi resep muncul
            scroll_pause_time = 0.5
            total_scrolls = 7

            # Scroll pelan-pelan biar termuat semua
            for _ in range(total_scrolls):
                driver.execute_script("window.scrollBy(0, 400);")
                time.sleep(scroll_pause_time)
            time.sleep(2)
        except Exception as e:
            print(f"Gagal membuka tab 'Recipes': {e}")

        # Ambil data recipe pertama (yang sudah terbuka detail pagenya)
        try:
            variation_name = driver.find_element(By.CSS_SELECTOR, ".selected-variation h2.h2").text.strip()
        except:
            variation_name = "N/A"
        
        try:
            prep = driver.find_element(By.CSS_SELECTOR, ".time-item.preparation-time b").text.strip()
        except:
            prep = None

        try:
            cook = driver.find_element(By.CSS_SELECTOR, ".time-item.cook-time b").text.strip()
        except:
            cook = None

        try:
            ready_in = driver.find_element(By.CSS_SELECTOR, ".time-item.ready-time span").text.strip()
        except:
            ready_in = None

        try:
            recipe_rating = driver.find_element(By.CSS_SELECTOR, ".rating-col.rating-preview p").text.strip()
        except:
            recipe_rating = None

        try:
            recipe_desc = driver.find_element(By.CSS_SELECTOR, ".selected-variation-text.with-image p").text.strip()
        except:
            recipe_desc = None

        # Menambahkan data recipe ke list all_recipes
        all_recipes.append({
            "dish_id": dish_id,
            "recipe_id": f"rec{i+1:03d}",
            "variation_name": variation_name,
            "prep": prep,
            "cook": cook,
            "ready_in": ready_in,
            "rating": recipe_rating,
            "desc": recipe_desc
        })

        # Ambil data recipe kedua yang ada di slider (kalau ada)
        try:
            slider_items = driver.find_elements(By.CSS_SELECTOR, "div.recipe-variation-slider li.similar-list__item")
            # Ambil item ke-2 (index ke-1)
            if len(slider_items) >= 2:
                item = slider_items[1]
                info_div = item.find_element(By.CSS_SELECTOR, "div.similar-list__info")

                try:
                    variation_name = info_div.find_element(By.CSS_SELECTOR, "h3.h3 a").text.strip()
                except:
                    variation_name = "N/A"

                try:
                    recipe_rating = info_div.find_element(By.CSS_SELECTOR, "div.rating-col.rating-preview p").text.strip()
                except:
                    recipe_rating = None

                try:
                    ready_in = info_div.find_element(By.CSS_SELECTOR, "div.similar-list__item-label").text.strip()
                except:
                    ready_in = None

                try:
                    recipe_desc = info_div.find_element(By.CSS_SELECTOR, "div[ng-bind-html] p").text.strip()
                except:
                    recipe_desc = None

                # Tambahkan ke list recipes
                all_recipes.append({
                    "dish_id": dish_id,
                    "variation_name": variation_name,
                    "prep": None,
                    "cook": None,
                    "ready_in": ready_in,
                    "rating": recipe_rating,
                    "desc": recipe_desc
                })
        except:
            continue

        # ========== RESTAURANT ==========
        print("\nScraping Restaurants")

        try:
            # Scroll ke atas dulu
            driver.execute_script("window.scrollTo({top: 0, behavior: 'smooth'});")
            time.sleep(2)

            # Pastikan semua tabnya udah muncul
            WebDriverWait(driver, 5).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, "nav.tab__nav ul li a")))
            tabs = driver.find_elements(By.CSS_SELECTOR, "nav.tab__nav ul li a")

            # Mencari tab "Where to eat"
            found_tab = False
            for tab in tabs:
                if "where to eat" in tab.text.strip().lower():
                    driver.execute_script("arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'})", tab)
                    WebDriverWait(driver, 5).until(EC.element_to_be_clickable(tab))
                    tab.click()
                    time.sleep(2)
                    found_tab = True
                    break

        except Exception as e:
            print("Tab 'Where to eat' tidak ditemukan atau gagal diklik: ", e)

        # Mencari daftar restaurant
        try:
            try:
                WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CSS_SELECTOR, ".where-to-eat__column-list")))
                if not scroll_until_restaurants_loaded(driver):
                    print("Tidak ada restoran yang muncul.")
                    raise Exception("No restaurants loaded")
            except Exception as e:
                print(f"Tab 'Where to eat' kosong atau gagal load: {e}")

            # Mengambil maksimal 2 data restaurant
            for idx in range(2):
                try:
                    # Scroll agar daftar restoran termuat semua
                    container = driver.find_element(By.CSS_SELECTOR, ".where-to-eat__column-list")
                    driver.execute_script("arguments[0].scrollIntoView();", container)
                    time.sleep(2)

                    # Ambil ulang semua link restoran (a.name) setiap iterasi
                    link_elems = driver.find_elements(By.CSS_SELECTOR, ".where-to-eat__column-list .item__header a.name")
                    rest_link = link_elems[idx].get_attribute("href")
                    full_link = "https://www.tasteatlas.com" + rest_link if rest_link.startswith("/") else rest_link

                    # Buka halaman detail resto
                    driver.get(full_link)
                    time.sleep(2)
                    WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CSS_SELECTOR, "div.card__header h1.h1")))

                    # Ambil data detail resto
                    try:
                        resto_name = driver.find_element(By.CSS_SELECTOR, "div.card__header h1.h1").text.strip()
                    except:
                        resto_name = "N/A"
                    try:
                        resto_city = driver.find_element(By.CSS_SELECTOR, "div.card__header h4.h4 a.no-hover-link").text.strip()
                    except:
                        resto_city = "N/A"
                    try:
                        resto_country = driver.find_element(By.CSS_SELECTOR, "div.card__header h4.h4 a[ng-if*='$ctrl']").text.strip()
                    except:
                        resto_country = "N/A"
                    try:
                        address = driver.find_element(By.CSS_SELECTOR, "div.card__main div.card__text span.ng-binding").text.strip()
                    except:
                        address = "N/A"
                    try:
                        website = driver.find_element(By.CSS_SELECTOR, "div.card__links a[target='_blank']").get_attribute("href")
                    except:
                        website = None
                    try:
                        resto_rating = driver.find_element(By.CSS_SELECTOR, "div.restaurant-badge__google-rating.flex.ng-scope.clickable div.ng-binding").text.strip()
                    except:
                        resto_rating = None
                    try:
                        phone = driver.find_element(By.XPATH, "//div[@class='card__text']/span[2]").text.strip()
                    except:
                        phone = "N/A"

                    # Menambahkan data restoran ke list all_restaurant
                    all_restaurants.append({
                        "dish_id": dish_id,
                        "resto_id": f"res{i+1:03d}",
                        "name": resto_name,
                        "city_country": f"{resto_city}, {resto_country}",
                        "address": address,
                        "phone": phone,
                        "website": website,
                        "rating": resto_rating
                    })

                    # Balik ke halaman sebelumnya
                    driver.back()
                    time.sleep(2)

                    # Tunggu halaman daftar restoran reload lagi
                    WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CSS_SELECTOR, ".where-to-eat__column-list .item-header a.name")))

                except Exception as e:
                    try:
                        # Balik lagi dan tunggu reload lagi
                        driver.back()
                        WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CSS_SELECTOR, ".where-to-eat__column-list")))
                    except:
                        pass
                    continue

        except Exception as e:
            print("Gagal load daftar restoran:", e)
            continue

        # ========== COMMENT ==========
        print("\nMengambil data komentar")

        try:
            # Scroll ke atas dan tunggu tab "Comments" muncul
            driver.execute_script("window.scrollTo({top: 0, behavior: 'smooth'});")
            time.sleep(2)
            WebDriverWait(driver, 5).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, "nav.tab__nav ul li a")))
            tabs = driver.find_elements(By.CSS_SELECTOR, "nav.tab__nav ul li a")

            # Cari dan klik tab "Comments"
            for tab in tabs:
                if "comments" in tab.text.strip().lower():
                    driver.execute_script("arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'})", tab)
                    WebDriverWait(driver, 10).until(EC.element_to_be_clickable(tab))
                    tab.click()
                    time.sleep(3)
                    break
        except Exception as e:
            print("Tab 'Comments' tidak ditemukan atau gagal diklik: ", e)

        # Mengambil data comments
        comment_ids = [] # untuk ID comment
        comment_boxes = driver.find_elements(By.CSS_SELECTOR, "div.opinion__body")[:5]
        for j, c in enumerate(comment_boxes):
            comment_id = f"com{dish_id[-3:]}{str(j+1).zfill(2)}"
            comment_ids.append(comment_id)

            try:
                username = c.find_element(By.CSS_SELECTOR, "div.opinion__author").text.strip()
            except:
                username = "N/A"

            try:
                rating_stars = c.find_elements(By.CSS_SELECTOR, ".opinion__stars i.icon-star-full")
                comment_rating = len(rating_stars)
            except:
                comment_rating = 0

            try:
                date = c.find_element(By.CSS_SELECTOR, "div.opinion__date").text.strip()
            except:
                date = "N/A"

            try:
                text = c.find_element(By.CSS_SELECTOR, "div.opinion__main").text.strip()
            except:
                text = "N/A"

            try:
                likes = c.find_elements(By.CSS_SELECTOR, "div.handy__like span.ng-binding")[0].text.strip()
            except:
                likes = "0"

            try:
                dislikes = c.find_elements(By.CSS_SELECTOR, "div.handy__dislike span.ng-binding")[0].text.strip()
            except:
                dislikes = "0"

            # Menambahkan data komentar ke list all_comments
            all_comments.append({
                "comment_id": comment_id,
                "dish_id": dish_id,
                "username": username,
                "content": text,
                "rating": comment_rating,
                "date": date,
                "likes": likes,
                "dislikes": dislikes
            })

        # Menambahkan data makanan ke list all_dishes
        all_dishes.append({
            "dish_id": dish_id,
            "dish_name": real_name,
            "ranking": i+1,
            "category": category,
            "certificate": certificate,
            "origin": origin,
            "desc": dish_desc,
            "average_ratings": dish_rating,
            "image": image,
            "link": detail_link,
            "comment_ids": comment_ids
        })

        # Simpan semua ke file JSON
        with open("../data/last_dishes12.json", "w", encoding="utf-8") as f:
            json.dump(all_dishes, f, indent=2, ensure_ascii=False)

        with open("../data/last_recipes12.json", "w", encoding="utf-8") as f:
            json.dump(all_recipes, f, indent=2, ensure_ascii=False)

        with open("../data/last_restaurants12.json", "w", encoding="utf-8") as f:
            json.dump(all_restaurants, f, indent=2, ensure_ascii=False)

        with open("../data/last_comments12.json", "w", encoding="utf-8") as f:
            json.dump(all_comments, f, indent=2, ensure_ascii=False)

        driver.get(base_url)
        time.sleep(5)

    print(f"\nBerhasil scrape {len(all_dishes)} dish (plus recipe & comment)")


if __name__ == "__main__":
    # Setup konfigurasi browser
    options = Options()
    options.add_argument("--headless") 
    options.add_argument("--disable-gpu")
    options.add_argument("--window-size=1920,1080")
    options.add_experimental_option('excludeSwitches', ['enable-logging'])

    # Menjalankan chrome
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)
    url = "https://www.tasteatlas.com/best-rated-dishes-in-the-world"
    driver.get(url) # Mengirim HTTP request untuk membuka halaman
    time.sleep(5)

    # Memenggil fungsi scrape_dishes
    scrape_dishes(driver, limit=100)

    driver.quit()