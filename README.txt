ETL Project: Data Scraping, Database Modeling, and Data Storing

======================================== a. Author ========================================
Nama: MUHAMMAD AZZAM ROBBANI
NIM: 18223025

======================================== b. Deskripsi Proyek ========================================
Proyek ini merupakan implementasi proses ETL (Extract, Transform, Load) lengkap yang mengambil data mengenai peringkat aplikasi gratis teratas dari Google Play Store.

Topik: Peringkat, Detail, dan Statistik Developer dari 200 Aplikasi Gratis Teratas di Google Play Store Amerika Serikat.

Sumber Data: Data di-scrape dari website AppBrain (https://www.appbrain.com/stats/google-play-rankings/).

Alasan Pemilihan Topik: Topik ini dipilih karena data aplikasi mobile sangat dinamis dan kaya akan informasi. Ini memungkinkan analisis tren popularitas, performa developer, dan karakteristik aplikasi yang sukses, yang merupakan studi kasus yang menarik untuk perancangan database.

DBMS: PostgreSQL.

======================================== c. Cara Menggunakan Scraper dan Hasil Outputnya ========================================
Proses untuk mengumpulkan dan membersihkan data terdiri dari dua tahap utama: menjalankan skrip scraper untuk mendapatkan data mentah, dan menjalankan skrip preprocessing untuk membersihkan data tersebut.

1. Prasyarat: Instalasi Library
Sebelum menjalankan skrip, pastikan semua library yang dibutuhkan sudah terinstal. Buka terminal dan jalankan perintah berikut:

pip install selenium beautifulsoup4 webdriver-manager psycopg2-binary

2. Menjalankan Skrip Scraper (Untuk Mendapatkan Data Mentah)
Jalankan skrip-skrip berikut secara berurutan dari direktori utama proyek Anda untuk mengumpulkan data mentah dari AppBrain.

# Mengambil data peringkat dasar
python "Data Scraping/src/Rank Scraper.py"

# Mengambil detail 200 aplikasi
python "Data Scraping/src/app_details_scraper.py"

# Mengambil detail developer dari 200 aplikasi
python "Data Scraping/src/developer_details_scraper.py"

Setelah proses ini selesai, Anda akan mendapatkan tiga file JSON mentah di dalam folder Data Scraping/data/.

3. Menjalankan Skrip Preprocessing (Untuk Membersihkan Data)
Data mentah tersebut harus dibersihkan sebelum dimasukkan ke database. Jalankan skrip-skrip berikut untuk melakukan pembersihan, parsing, dan transformasi data.

python "Data Scraping/src/preprocess_ranking.py"
python "Data Scraping/src/preprocess_app_details.py"
python "Data Scraping/src/preprocess_developer_details.py"

Hasil dari proses ini adalah tiga file _clean.json. File-file inilah yang akan digunakan sebagai sumber data untuk dimasukkan ke dalam database PostgreSQL.

======================================== d. Penjelasan Struktur File JSON yang Dihasilkan ========================================

1. ranking_clean.json: Menyimpan data peringkat dasar setiap aplikasi.
app_name (Teks): Nama aplikasi.
rank (Angka Bulat): Peringkat aplikasi.
rating (Angka Desimal): Rata-rata rating aplikasi.
total_installs (Angka Bulat): Angka total instalasi.
recent_installs (Angka Bulat): Angka instalasi dalam 30 hari terakhir.

2. app_details_clean.json: Menyimpan detail spesifik setiap aplikasi.
app_name (Teks): Nama aplikasi.
developer (Teks): Nama developer.
category (Teks): Kategori aplikasi.
price_text (Teks): Keterangan harga (contoh: "Free").
price_numeric (Angka Desimal): Harga dalam format numerik (0.0 untuk gratis).
apk_size_mb (Angka Desimal): Ukuran file APK dalam Megabyte.
maturity (Teks): Tingkat kedewasaan konten (contoh: "Medium").
source_url (Teks): URL sumber halaman detail aplikasi.

3. developer_details_clean.json: Menyimpan detail dan statistik agregat setiap developer.
developer_name (Teks): Nama developer.
active_year (Angka Bulat): Tahun pertama developer aktif.
active_month (Angka Bulat): Bulan pertama developer aktif.
app_count (Angka Bulat): Jumlah aplikasi yang dimiliki developer.
total_downloads (Angka Bulat): Total unduhan dari semua aplikasi developer.
average_rating (Angka Desimal): Rata-rata rating dari semua aplikasi developer.
total_rating_count (Angka Bulat): Total jumlah rating dari semua aplikasi developer.
source_url (Teks): URL sumber halaman profil developer.

======================================== e. Struktur ERD dan diagram relasional RDBMS ========================================

============================== f. Penjelasan Proses Translasi ERD menjadi Diagram Relasional ==============================
Proses translasi dari ERD (model konseptual) menjadi Skema Relasional (model fisik untuk implementasi di PostgreSQL) mengikuti aturan-aturan standar berikut:

Setiap Entitas Menjadi Sebuah Tabel: Setiap entitas yang didefinisikan dalam ERD (seperti Developers, Apps, Categories, MaturityRatings, DeveloperStats, dan Rankings) diimplementasikan sebagai sebuah tabel terpisah di dalam database.

Setiap Atribut Menjadi Sebuah Kolom: Setiap atribut yang dimiliki oleh sebuah entitas di ERD diubah menjadi kolom pada tabel yang bersangkutan. Selama proses ini, tipe data yang paling sesuai untuk setiap kolom ditentukan (misalnya, VARCHAR untuk teks, INT untuk angka bulat, REAL atau NUMERIC untuk angka desimal, BIGINT untuk angka yang sangat besar seperti jumlah unduhan).

Identifier Unik Menjadi Primary Key: Atribut unik yang berfungsi sebagai pembeda utama setiap baris data dalam entitas (ditandai sebagai PK di ERD) ditetapkan sebagai PRIMARY KEY pada tabel. Dalam desain ini, tipe SERIAL digunakan untuk membuat ID unik yang bertambah secara otomatis untuk setiap tabel.

Hubungan One-to-Many (1:N) Diimplementasikan dengan Foreign Key: Hubungan antar entitas diimplementasikan menggunakan foreign key. Untuk hubungan 1-ke-N, Primary Key dari tabel di sisi "satu" (1) ditambahkan sebagai kolom baru (Foreign Key) pada tabel di sisi "banyak" (N). Contohnya:

Untuk relasi 1-ke-N antara Developers dan Apps, developer_id (PK dari tabel Developers) ditambahkan ke dalam tabel Apps sebagai foreign key.

Hal yang sama berlaku untuk category_id dan maturity_id di dalam tabel Apps.

================================================== g. Screenshot Program ==================================================


================================================== h. Referensi ==================================================
Sumber Data
Website: AppBrain - Google Play Ranking
URL: https://www.appbrain.com/stats/google-play-rankings/

Teknologi & Library

Bahasa Pemrograman: Python

Library Pihak Ketiga (Perlu diinstal):
-Selenium: Untuk otomasi browser dan scraping data dari halaman web dinamis.
-BeautifulSoup4: Untuk mem-parsing dokumen HTML dan mengekstrak data.
-WebDriver-Manager: Untuk mengelola driver browser secara otomatis untuk Selenium.
-psycopg2-binary: Sebagai adaptor untuk menghubungkan Python dengan database PostgreSQL.

Library Standar (Bawaan Python):
-json: Untuk membaca dan menulis data dalam format JSON.
-os: Untuk berinteraksi dengan sistem operasi, terutama dalam mengelola path file.
-re: Untuk operasi regular expression, digunakan saat membersihkan dan mem-parsing teks.
-time: Untuk memberikan jeda (sleep) antar request saat melakukan scraping.