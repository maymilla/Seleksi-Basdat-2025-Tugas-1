# TUGAS SELEKSI 1 - 18223025

## Author

- Nama: Muhammad Azzam Robbani
- NIM: 18223025

---

## Deskripsi Singkat Data & DBMS

Proyek ini merupakan implementasi alur kerja ETL (Extract, Transform, Load) untuk mengumpulkan, membersihkan, dan menyimpan data peringkat aplikasi dari Google Play Store. Data diekstrak dari website AppBrain, kemudian melalui tahap preprocessing untuk pembersihan dan transformasi. Hasilnya disimpan ke dalam database operasional PostgreSQL yang ternormalisasi. Sebagai tugas bonus, data dari database operasional tersebut kemudian diproses lebih lanjut dan dimuat ke dalam sebuah Data Warehouse dengan model Star Schema untuk mendukung kueri analitik.

---

## Tahap 1: Data Scraping & Preprocessing
Cara Penggunaan

1. Instalasi Library
Pastikan Python dan pip sudah terinstal. Jalankan perintah berikut untuk menginstal semua library yang dibutuhkan:

pip install selenium beautifulsoup4 webdriver-manager psycopg2-binary

2. Menjalankan Scraper (Extract)
Jalankan skrip-skrip berikut secara berurutan untuk mengumpulkan data mentah. Skrip akan menyimpan hasilnya dalam format JSON di folder Data Scraping/data/.

- Mengambil data peringkat dasar
python "Data Scraping/src/Rank Scraper.py"

- Mengambil detail 200 aplikasi
python "Data Scraping/src/app_details_scraper.py"

- Mengambil detail developer dari 200 aplikasi
python "Data Scraping/src/developer_details_scraper.py"

3. Menjalankan Preprocessing (Transform)
Setelah data mentah terkumpul, jalankan skrip berikut untuk membersihkan, mem-parsing, dan mentransformasi data mentah menjadi format yang bersih dan siap pakai.

- python "Data Scraping/src/preprocess_ranking.py"
- python "Data Scraping/src/preprocess_app_details.py"
- python "Data Scraping/src/preprocess_developer_details.py"

Struktur File JSON Bersih
1. ranking_clean.json: Menyimpan data peringkat dasar setiap aplikasi.
app_name (string), rank (integer), rating (float), total_installs (integer), recent_installs (integer).

2. app_details_clean.json: Menyimpan detail spesifik setiap aplikasi.
app_name (string), developer (string), category (string), price_text (string), price_numeric (float), apk_size_mb (float), maturity (string), source_url (string).

3. developer_details_clean.json: Menyimpan detail dan statistik agregat setiap developer.
developer_name (string), active_year (integer), active_month (integer), app_count (integer), total_downloads (integer), average_rating (float), total_rating_count (integer), source_url (string).

---

## Tahap 2: Data Modeling & Storing (Database Operasional)
ERD & Skema Relasional
Berikut adalah rancangan ERD dan Skema Relasional untuk database operasional seleksi_basdat.

Entity-Relationship Diagram (ERD)
<img width="1893" height="1750" alt="ERD" src="https://github.com/user-attachments/assets/660075d5-ddb0-4f60-a01f-61131b069576" />

Relational Diagram
<img width="1800" height="705" alt="Relational Diagram" src="https://github.com/user-attachments/assets/53c80c66-7e95-4899-bc9b-fab99c56122b" />

Penjelasan Translasi ERD ke Skema Relasional
Proses translasi dari ERD ke skema relasional merupakan langkah esensial untuk mengubah desain konseptual menjadi struktur database fisik yang fungsional. Setiap entitas pada ERD, seperti Developers dan Apps, diimplementasikan sebagai tabel individual. Atribut-atribut yang mendeskripsikan setiap entitas kemudian dipetakan menjadi kolom-kolom di dalam tabel tersebut, dengan pemilihan tipe data PostgreSQL yang cermat seperti VARCHAR untuk teks dan BIGINT untuk data numerik besar. Untuk menjamin keunikan setiap entri, atribut identifier pada ERD ditetapkan sebagai PRIMARY KEY, yang secara praktis diimplementasikan menggunakan tipe SERIAL agar ID dapat dibuat secara otomatis.

Hubungan one-to-many antar entitas diwujudkan melalui mekanisme foreign key. Misalnya, untuk menerapkan hubungan di mana satu Developer dapat memiliki banyak App, kolom developer_id yang merupakan primary key dari tabel Developers ditambahkan ke dalam tabel Apps sebagai foreign key. Lapisan terakhir dari integritas data dicapai dengan menerapkan constraints tambahan. UNIQUE digunakan pada kolom seperti developer_name untuk mencegah duplikasi, sementara NOT NULL memastikan bahwa data penting tidak boleh kosong, sehingga menjaga konsistensi dan keandalan database.

Cara Memasukkan Data ke Database (Load)
- Buat Database & Tabel: Buat database seleksi_basdat di PostgreSQL, lalu jalankan skrip di bawah ini untuk membuat semua tabel.
psql -U postgres -d seleksi_basdat -f "Data Storing/src/create_tables.sql"

- Load Data: Jalankan skrip load_data.py untuk memuat data dari file _clean.json ke dalam tabel-tabel yang sudah dibuat.
python "Data Storing/src/load_data.py"

Contoh Kueri Analitik pada Data Storing:
<img width="1418" height="877" alt="Screenshot 2025-08-08 174412" src="https://github.com/user-attachments/assets/7a6d2908-b7c8-4da7-b7c3-ba6494e0a7da" />

****

---

## Bonus: Implementasi Data Warehouse

Sebagai tugas bonus, sebuah data warehouse diimplementasikan menggunakan pendekatan Star Schema untuk menyediakan struktur yang dioptimalkan untuk kebutuhan kueri analitik.

Desain Star Schema
Skema ini terdiri dari satu tabel fakta (Fact_AppRanking) dan empat tabel dimensi (Dim_Apps, Dim_Developers, Dim_Categories, Dim_MaturityRatings) yang memberikan konteks pada data.

Cara Implementasi DWH
Buat Database & Tabel DWH: Buat database seleksi_basdat_dwh, lalu jalankan skrip di bawah ini untuk membuat semua tabel DWH.

psql -U postgres -d seleksi_basdat_dwh -f "Data Warehouse/src/create_dwh_tables.sql"
Load Data ke DWH: Jalankan skrip load_dwh.py untuk melakukan proses ETL dari database operasional ke data warehouse.

python "Data Warehouse/src/load_dwh.py"
Bukti Implementasi (Screenshots)
Data di dalam tabel Apps (Database Operasional):

Contoh Kueri Analitik pada Data Warehouse:
<img width="1680" height="591" alt="Screenshot 2025-08-08 200858" src="https://github.com/user-attachments/assets/160e2c7f-e299-458b-8e55-5c556bb25f84" />

---

## Referensi
Sumber Data: AppBrain - Google Play Ranking (https://www.appbrain.com/stats/google-play-rankings/)

Library Pihak Ketiga:
- Selenium
- BeautifulSoup4
- WebDriver-Manager
- psycopg2-binary

Library Standar:
- json
- os
- re
- time
