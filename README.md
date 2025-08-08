# ETL Project: Data Scraping, Database Modeling, and Data Storing

**Author:**  

Nama : **Kenlyn Tesalonika Winata**<br>
NIM  : **18223098**

## Deskripsi Singkat

Pada proyek ETL ini, data yang digunakan adalah **Top 100 Dishes in the World** yang bersumber dari [TasteAtlas](https://www.tasteatlas.com/best-rated-dishes-in-the-world), sebuah platform ensiklopedia kuliner global yang memuat informasi hidangan, resep, hingga restoran dari seluruh dunia.

Saya memilih topik ini karena datanya yang menarik, bervariasi, dan kaya akan potensi untuk dianalisis lebih lanjut. Harapannya, hasil analisis dari data ini dapat memberikan *insight* baru terkait popularitas dan karakteristik hidangan dari berbagai belahan dunia, serta keterkaitannya dengan negara asal, kategori, dan kualitas hidangan tersebut.

Proses ETL yang dilakukan berhasil mengumpulkan data yang mencakup **7 entitas utama**: dishes, recipes, restaurants, comments, categories, countries, dan quality_labels. Untuk melengkapi model data, saya juga menambahkan satu tabel relevan yaitu `users` untuk merepresentasikan interaksi pengguna terhadap data kuliner yang ada.

Untuk tahap *data storing*, saya menggunakan **PostgreSQL** sebagai RDBMS. PostgreSQL dipilih karena fitur relasionalnya yang kuat, dukungan tipe data yang kaya, serta kemudahan integrasinya dengan bahasa pemrograman Python yang digunakan dalam proyek ini.

## Cara Menggunakan Scraper
### 1. Prerequisites

Pertama-tama pastikan terlebih dahulu bahwa Python3 sudah terinstall di perangkat Anda. Lalu ada beberapa library yang perlu di-instal yaitu selenium, webdriver-manager, dan unidecode. Berikut adalah caranya:

```bash
pip install selenium
pip install webdriver-manager
pip install unidecode
```
### 2. Langkah-Langkah

1.  **Clone Repository**
    ```bash
    git clone 
    ```

2.  **Jalankan Scraper**

    Buka folder hasil cloning dan masuk ke direktori `Data Scraping/src/`, dan jalankan kedua file scraper.
    ```bash
    # Scraper utama untuk data hidangan
    python dishes_scraper.py

    # Scraper tambahan untuk data detail
    python additional_scraper.py
    ```
    Proses ini akan menghasilkan 7 file data mentah (`dishes.json`, `recipes.json`, `restaurants.json`, `comments.json`,
    `categories.json`, `countries.json`, dan `quality_labels.json`) di folder `Data Scraping/data/`.

4.  **Jalankan Preprocessing**

    Untuk membersihkan data mentah, jalankan file `preprocessing.py` yang ada di direktori yang sama.

    ```bash
    python preprocessing.py
    ```
    Proses ini akan menghasilkan file-file `_clean.json` yang siap untuk tahap *data storing*.

## Cara Melakukan Data Storing
### 1. Prerequisites

Install library psycopg2 untuk koneksi Python ke PostgreSQL:

```bash
pip install psycopg2
```
### 2. Langkah-Langkah

1.  **Buat Database**
    Masuk ke PostgreSQL dan buat database baru
    ```bash
    CREATE DATABASE tasteatlas;
    ```

3.  **Jalankan Program Data Storing**

    Masuk ke direktori Data Storing/src/ dan jalankan:
    ```bash
    python storing_tasteatlas.py
    ```
    Proses ini akan menghasilkan file tasteatlas.sql yang berisi struktur tabel beserta data hasil scraping.

4.  **Import ke PostgreSQL**
    Buka terminal dan masukkan perintah:
    ```bash
    psql -U postgres -d tasteatlas -f tasteatlas.sql
    ```
    Masukkan password PostgreSQL dan data akan tersimpan di database.



## Struktur File JSON
### countries_clean.json
| Kolom          | Tipe Data | Deskripsi                               |
|----------------|-----------|-----------------------------------------|
| `country_id`   | `String`  | Primary Key unik untuk setiap negara.   |
| `country_name` | `String`  | Nama negara.                            |
| `continent`    | `String`  | Benua tempat negara berada.             |

---

### categories_clean.json
| Kolom           | Tipe Data | Deskripsi                                 |
|-----------------|-----------|-------------------------------------------|
| `category_id`   | `String`  | Primary Key unik untuk setiap kategori.   |
| `category_name` | `String`  | Nama kategori hidangan. |

---

### quality_labels_clean.json
| Kolom        | Tipe Data | Deskripsi                                      |
|--------------|-----------|------------------------------------------------|
| `label_id`   | `String`  | Primary Key unik untuk setiap label.           |
| `label_name` | `String`  | Nama label atau sertifikasi.    |
| `desc`       | `String`  | Deskripsi singkat mengenai arti dari label.    |

---

### dishes_clean.json
| Kolom             | Tipe Data | Deskripsi                                       |
|-------------------|-----------|-------------------------------------------------|
| `dish_id`         | `String`  | Primary Key unik untuk setiap hidangan.         |
| `dish_name`       | `String`  | Nama hidangan.                                  |
| `ranking`         | `Integer` | Peringkat hidangan (1-100).                     |
| `category_id`     | `String`  | Foreign Key ke tabel `categories`.              |
| `country_id`      | `String`  | Foreign Key ke tabel `countries`.               |
| `city`            | `String`  | Kota asal hidangan (jika ada).                  |
| `rating` | `Float`   | Rating hidangan.                      |
| `desc`            | `String`  | Deskripsi lengkap mengenai hidangan.            |
| `image`           | `String`  | URL gambar hidangan.                            |
| `link`            | `String`  | URL ke halaman detail hidangan di TasteAtlas.   |

---

### restaurants_clean.json
| Kolom        | Tipe Data | Deskripsi                                  |
|--------------|-----------|--------------------------------------------|
| `resto_id`   | `String`  | Primary Key unik untuk setiap restoran.    |
| `name`       | `String`  | Nama restoran.                             |
| `city`       | `String`  | Kota lokasi restoran.                      |
| `country_id` | `String`  | Foreign Key ke tabel `countries`.          |
| `address`    | `String`  | Alamat lengkap restoran.                   |
| `website`    | `String`  | URL situs web restoran.                    |
| `rating`     | `Float`   | Rating restoran.                           |

---

#### recipes_clean.json
| Kolom            | Tipe Data | Deskripsi                                         |
|------------------|-----------|---------------------------------------------------|
| `recipe_id`      | `String`  | Primary Key unik untuk setiap resep.              |
| `dish_id`        | `String`  | Foreign Key ke tabel `dishes`.                    |
| `variation_name` | `String`  | Nama variasi resep.       |
| `prep`           | `String`  | Waktu persiapan.                     |
| `cook`           | `String`  | Waktu memasak.                     |
| `rating`         | `Float`   | Rating untuk resep tersebut.                      |
| `desc`           | `String`  | Deskripsi singkat mengenai resep.                 |

---

### comments_clean.json
| Kolom        | Tipe Data | Deskripsi                                       |
|--------------|-----------|-------------------------------------------------|
| `comment_id` | `String`  | Primary Key unik untuk setiap komentar.         |
| `dish_id`    | `String`  | Foreign Key ke tabel `dishes`.                  |
| `username`   | `String`  | Nama pengguna yang memberikan komentar.         |
| `content`    | `String`  | Isi dari komentar.                              |
| `rating`     | `Float`   | Rating yang diberikan dalam komentar.|
| `date`       | `String`  | Tanggal komentar.          |
| `likes`      | `Integer` | Jumlah suka pada komentar.             |
| `dislikes`   | `Integer` | Jumlah tidak suka pada komentar.       |

## Desain Database

### ER-Diagram
![TasteAtlas ERD](Data%20Storing/design/TasteAtlas_ERD.png)

### Relational Model
![TasteAtlas Relational Diagram](Data%20Storing/design/TasteAtlas_Relational_Diagram.png)

---

## Pemetaan ER-Diagram menjadi Model Relational

### 1. Pemetaan Entity menjadi Relasi

#### Strong Entity
Strong entity adalah entitas yang dapat berdiri sendiri, memiliki **primary key**-nya sendiri, dan keberadaannya tidak bergantung pada entitas lain.  
Langkah pertama dalam memetakan ER diagram menjadi model relational yaitu dengan mengubah strong entity menjadi sebuah relasi/tabel.

Pada diagram TasteAtlas terdapat **8 strong entity** yaitu sebagai berikut:
- **Dishes** = {dish_id, dish_name, ranking, city, average_rating, desc, image, link}
- **Recipes** = {recipe_id, variation_name, prep, cook, desc, rating}
- **Restaurants** = {resto_id, name, city, address, website, rating}
- **Categories** = {category_id, category_name}
- **Countries** = {country_id, country_name, continent}
- **Quality_label** = {label_id, label_name, label_img, desc}
- **Comments** = {comment_id, content, rate, created_at, likes, dislikes}
- **Users** = {email, first_name, last_name, username, password}

---

### 2. Pemetaan Relationship menjadi Relasi

- **belongs_to**  
  Many-to-one relationship dengan *many* di sisi `Recipes`.  
  PK dari `Dishes` (`dish_id`) menjadi FK di `Recipes`.

- **categorized_as**  
  Many-to-one relationship dengan *many* di sisi `Dishes`.  
  PK dari `Categories` (`category_id`) menjadi FK di `Dishes`.

- **originates_from**  
  Many-to-one relationship dengan *many* di sisi `Dishes`.  
  PK dari `Countries` (`country_id`) menjadi FK di `Dishes`.
  
- **location**  
  Many-to-one relationship dengan *many* di sisi `Restaurants`.  
  PK dari `Countries` (`country_id`) menjadi FK di `Restaurants`.

- **favorite**  
  Many-to-many relationship → dibuat entitas baru `User_Favorites` berisi `dish_id` dan `email` serta atribut tambahan `fav_ranking`.
  ![Contoh Pemetaan many-to-many](Data%20Storing/design/contoh_many_to_many.png)

- **has_label**  
  Many-to-many relationship → dibuat entitas baru `Dish_Label` berisi `dish_id` dan `label_id`.

- **available_at**  
  Many-to-many relationship → dibuat entitas baru `Resto_Menu` berisi `dish_id` dan `resto_id`.

- **review_dishes**  
  Ternary relationship → PK dari `Users` dan `Dishes` masuk ke `Comments` sebagai FK.

---

### 3. Foreign Keys

#### One-to-many / Many-to-one
- Recipes(dish_id) → Dishes(dish_id)  
- Dishes(category_id) → Categories(category_id)  
- Dishes(country_id) → Countries(country_id)  
- Restaurants(country_id) → Countries(country_id)  
- Comments(dish_id) → Dishes(dish_id)  
- Comments(email) → Users(email)  

#### Many-to-many
- Dish_Label(dish_id) → Dishes(dish_id)  
- Dish_Label(label_id) → Quality_Label(label_id)  
- Resto_Menu(dish_id) → Dishes(dish_id)  
- Resto_Menu(resto_id) → Restaurants(resto_id)  
- User_Favorites(dish_id) → Dishes(dish_id)  
- User_Favorites(email) → Users(email)  

---

### 4. Hasil Pemetaan

- Dishes = {dish_id, dish_name, category_id, country_id, ranking, origin_city, avarage_rating, desc, image, link}  
- Recipes = {recipe_id, dish_id, variation_name, prep, cook, desc, rating}  
- Restaurants = {resto_id, name, city, address, website, rating}  
- Categories = {category_id, category_name}  
- Comments = {comment_id, email, dish_id, content, rate, created_at, likes, dislikes}  
- Countries = {country_id, country_name, continent}  
- Users = {email, first_name, last_name, username, password}  
- Users_Favorites = {email, dish_id, fav_rating}  
- Quality_Label = {label_id, label_name, label_img, desc}  
- Dish_Label = {dish_id, label_id}  
- Resto_Menu = {dish_id, resto_id}  

## Screenshot Program

Beberapa hasil tampilan saat program dijalankan:

### 1. Menjalankan Scraper
![Tampilan Saat Menjalankan Scraper](Data%20Storing/screenshots/proses_scraping.png)

### 2. Proses Export ke Database
![Proses Exportr](Data%20Storing/screenshots/proses_export.png)

### 3. Menjalankan Query
![Select from where](Data%20Storing/screenshots/query2.png)
Isi desc yang panjang membuat tabel terlihat berantakan.

## Referensi

- **Library yang Digunakan**
  - Selenium untuk melakukan web scraping otomatis.
  - webdriver-manager untuk mengelola driver browser secara otomatis.
  - unidecode untuk proses normalisasi teks.
  - psycopg2 untuk proses storing.
  
- **Halaman Web yang di-Scrape**
  - [TasteAtlas](https://www.tasteatlas.com/)

- **Tools Database**
  - PostgreSQL
