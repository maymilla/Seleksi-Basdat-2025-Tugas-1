# TUGAS SELEKSI 2 - 18223025

## Author

- Nama: Muhammad Azzam Robbani
- NIM: 18223025

---

## Deskripsi Singkat Data & DBMS

Proyek ini merupakan implementasi alur kerja ETL (Extract, Transform, Load) untuk mengumpulkan, membersihkan, dan menyimpan data peringkat aplikasi dari Google Play Store. Data diekstrak dari website AppBrain, kemudian melalui tahap preprocessing untuk pembersihan dan transformasi. Hasilnya disimpan ke dalam database operasional PostgreSQL yang ternormalisasi. Sebagai tugas bonus, data dari database operasional tersebut kemudian diproses lebih lanjut dan dimuat ke dalam sebuah Data Warehouse dengan model Star Schema untuk mendukung kueri analitik.

---

## Struktur Folder Proyek
.
├── Data Scraping
│   ├── data
│   │   ├── ranking.json (raw)
│   │   ├── app_details_200.json (raw)
│   │   ├── developer_details_top200.json (raw)
│   │   ├── ranking_clean.json
│   │   ├── app_details_clean.json
│   │   └── developer_details_clean.json
│   └── src
│       ├── Rank Scraper.py
│       ├── app_details_scraper.py
│       ├── developer_details_scraper.py
│       ├── preprocess_ranking.py
│       ├── preprocess_app_details.py
│       └── preprocess_developer_details.py
│
├── Data Storing
│   ├── design
│   │   ├── ERD.png
│   │   └── Relational_Diagram.png
│   ├── export
│   │   └── seleksi_basdat_export.sql
│   ├── screenshots
│   │   └── [CONTOH_SCREENSHOT_SELECT.png]
│   └── src
│       ├── create_tables.sql
│       └── load_data.py
│
├── Data Warehouse
│   ├── design
│   │   └── DWH_Star_Schema.png
│   ├── export
│   │   └── seleksi_basdat_dwh_export.sql
│   ├── screenshots
│   │   └── [CONTOH_KUERI_ANALITIK.png]
│   └── src
│       ├── create_dwh_tables.sql
│       └── load_dwh.py
│
└── README.md

Tahap 1: Data Scraping & Preprocessing
Cara Penggunaan
Instalasi Library
Pastikan Python dan pip sudah terinstal. Jalankan perintah berikut untuk menginstal semua library yang dibutuhkan:

Bash

pip install selenium beautifulsoup4 webdriver-manager psycopg2-binary
Menjalankan Scraper (Extract)
Jalankan skrip-skrip berikut secara berurutan untuk mengumpulkan data mentah. Skrip akan menyimpan hasilnya dalam format JSON di folder Data Scraping/data/.

Bash

# Mengambil data peringkat dasar
python "Data Scraping/src/Rank Scraper.py"

# Mengambil detail 200 aplikasi
python "Data Scraping/src/app_details_scraper.py"

# Mengambil detail developer dari 200 aplikasi
python "Data Scraping/src/developer_details_scraper.py"
Menjalankan Preprocessing (Transform)
Setelah data mentah terkumpul, jalankan skrip berikut untuk membersihkan, mem-parsing, dan mentransformasi data mentah menjadi format yang bersih dan siap pakai.

Bash

python "Data Scraping/src/preprocess_ranking.py"
python "Data Scraping/src/preprocess_app_details.py"
python "Data Scraping/src/preprocess_developer_details.py"
Struktur File JSON Bersih
ranking_clean.json: Menyimpan data peringkat dasar setiap aplikasi.

app_name (string), rank (integer), rating (float), total_installs (integer), recent_installs (integer).

app_details_clean.json: Menyimpan detail spesifik setiap aplikasi.

app_name (string), developer (string), category (string), price_text (string), price_numeric (float), apk_size_mb (float), maturity (string), source_url (string).

developer_details_clean.json: Menyimpan detail dan statistik agregat setiap developer.

developer_name (string), active_year (integer), active_month (integer), app_count (integer), total_downloads (integer), average_rating (float), total_rating_count (integer), source_url (string).

Tahap 2: Data Modeling & Storing (Database Operasional)
ERD & Skema Relasional
Berikut adalah rancangan ERD dan Skema Relasional untuk database operasional seleksi_basdat.

Entity-Relationship Diagram (ERD)

Relational Diagram

Penjelasan Translasi ERD ke Skema Relasional
Proses translasi dari ERD ke skema relasional merupakan langkah esensial untuk mengubah desain konseptual menjadi struktur database fisik yang fungsional. Setiap entitas pada ERD, seperti Developers dan Apps, diimplementasikan sebagai tabel individual. Atribut-atribut yang mendeskripsikan setiap entitas kemudian dipetakan menjadi kolom-kolom di dalam tabel tersebut, dengan pemilihan tipe data PostgreSQL yang cermat seperti VARCHAR untuk teks dan BIGINT untuk data numerik besar. Untuk menjamin keunikan setiap entri, atribut identifier pada ERD ditetapkan sebagai PRIMARY KEY, yang secara praktis diimplementasikan menggunakan tipe SERIAL agar ID dapat dibuat secara otomatis.

Hubungan one-to-many antar entitas diwujudkan melalui mekanisme foreign key. Misalnya, untuk menerapkan hubungan di mana satu Developer dapat memiliki banyak App, kolom developer_id yang merupakan primary key dari tabel Developers ditambahkan ke dalam tabel Apps sebagai foreign key. Lapisan terakhir dari integritas data dicapai dengan menerapkan constraints tambahan. UNIQUE digunakan pada kolom seperti developer_name untuk mencegah duplikasi, sementara NOT NULL memastikan bahwa data penting tidak boleh kosong, sehingga menjaga konsistensi dan keandalan database.

Cara Memasukkan Data ke Database (Load)
Buat Database & Tabel: Buat database seleksi_basdat di PostgreSQL, lalu jalankan skrip di bawah ini untuk membuat semua tabel.

Bash

psql -U postgres -d seleksi_basdat -f "Data Storing/src/create_tables.sql"
Load Data: Jalankan skrip load_data.py untuk memuat data dari file _clean.json ke dalam tabel-tabel yang sudah dibuat.

Bash

python "Data Storing/src/load_data.py"
Bonus: Implementasi Data Warehouse
Sebagai tugas bonus, sebuah data warehouse diimplementasikan menggunakan pendekatan Star Schema untuk menyediakan struktur yang dioptimalkan untuk kebutuhan kueri analitik.

Desain Star Schema
Skema ini terdiri dari satu tabel fakta (Fact_AppRanking) dan empat tabel dimensi (Dim_Apps, Dim_Developers, Dim_Categories, Dim_MaturityRatings) yang memberikan konteks pada data.

Cara Implementasi DWH
Buat Database & Tabel DWH: Buat database seleksi_basdat_dwh, lalu jalankan skrip di bawah ini untuk membuat semua tabel DWH.

Bash

psql -U postgres -d seleksi_basdat_dwh -f "Data Warehouse/src/create_dwh_tables.sql"
Load Data ke DWH: Jalankan skrip load_dwh.py untuk melakukan proses ETL dari database operasional ke data warehouse.

Bash

python "Data Warehouse/src/load_dwh.py"
Bukti Implementasi (Screenshots)
Data di dalam tabel Apps (Database Operasional):

Contoh Kueri Analitik pada Data Warehouse:

Referensi
Sumber Data: AppBrain - Google Play Ranking (https://www.appbrain.com/stats/google-play-rankings/)

Library Pihak Ketiga:
Selenium
BeautifulSoup4
WebDriver-Manager
psycopg2-binary

Library Standar:
json
os
re
time
