# Analisis Data Olimpiade Paris 2024

**Author:**  
Nama: Izhar Alif Akbar 
NIM: 18223129

---

## Deskripsi Singkat Data

Proyek ini melakukan scraping data komprehensif dari hasil Olimpiade Musim Panas Paris 2024 melalui situs resmi [Olympics.com](https://olympics.com/). Data yang diambil mencakup tiga domain utama:

- **Hasil Pertandingan:**  
  Detail setiap pertandingan dari semua cabang olahraga, termasuk peraih medali dan peringkat peserta.

- **Profil Atlet:**  
  Informasi mendetail untuk lebih dari 5.000 atlet, mencakup negara asal, cabang olahraga, riwayat partisipasi, dan tahun lahir.

- **Klasemen Medali:**  
  Rekapitulasi perolehan medali (emas, perak, perunggu) untuk setiap negara yang berpartisipasi.

DBMS yang digunakan adalah **PostgreSQL**, sebuah sistem manajemen basis data relasional yang andal dan open-source. Di dalamnya, terdapat **7 tabel** yang saling berelasi untuk merepresentasikan data secara ternormalisasi:  
**Negara, Atlet, Olahraga, Pertandingan, Partisipasi, Venue, dan Pertandingan_Venue.**

---

## Alasan Pemilihan Topik

Olimpiade adalah panggung olahraga terbesar di dunia yang menghasilkan volume data yang sangat besar dan menarik. Topik ini dipilih karena ketertarikan pribadi pada dunia olahraga dan tantangan teknis dalam mengumpulkan serta menstrukturkan data dari berbagai jenis pertandingan (tim, ganda, dan individual).

Proyek ini bertujuan untuk membangun sebuah basis data yang solid yang dapat digunakan untuk analisis lebih lanjut, seperti:

- Korelasi antara negara dan performa di cabang olahraga tertentu.
- Analisis demografis atlet peraih medali.
- Tren partisipasi atlet di berbagai edisi Olimpiade.

---

## Persyaratan Program

- **Python 3.9+**
- **PostgreSQL Server**
- Library Python:  
  `selenium`, `beautifulsoup4`, `pandas`, `psycopg2-binary`, `tqdm`, `webdriver-manager`, `python-dotenv`.

Jalankan perintah berikut untuk menginstal semua dependencies:

```bash
pip install selenium beautifulsoup4 pandas psycopg2-binary tqdm webdriver-manager python-dotenv
```

---

## Cara Menggunakan

### 1. Clone Repositori

Buat .env di root dan isi:



```bash
git clone [URL_REPOSITORI_ANDA]
cd [NAMA_REPOSITORI]
```

### 2. Konfigurasi Environment

Pada root folder (sejajar dengan folder `Data Storing`), buat file baru bernama `.env` dan isi dengan kredensial database PostgreSQL Anda:

```env
DB_PASSWORD=123456789 (disesuaikan)
DB_HOST=localhost (disesuaikan)
DB_USER=postgres (disesuaikan)
```

### 3. Jalankan Scraper

Cukup jalankan dan otomatis keseluruhan proses dijalankan:
```bash
python "./Data Scraping/src/main.ipynb"
```
Output: Folder `cleaned_data` berisi file `negara.csv`, `atlet.csv`, `pertandingan.csv`, dan `partisipasi.csv`.

### 4. Storing Data ke PostgreSQL

Skrip ini akan secara otomatis membuat database `olympics_db` (jika belum ada), membuat semua tabel, dan memasukkan data dari file CSV.

```bash
python "./Data Storing/src/store_data_to_rdbms.py"
```

Setelah proses selesai, data Anda sudah tersimpan di dalam PostgreSQL.

---

## Penjelasan Struktur File JSON

### raw_sports.json

Berisi daftar hasil dari setiap pertandingan. Setiap entri merepresentasikan satu tim atau atlet dalam satu event.

```json
[
  {
    "sport": "3x3 Basketball",
    "event": "Men",
    "event_url": "...",
    "event_type": "Team",
    "rank": "G",
    "team_or_athlete_name": "Netherlands",
    "members": [
      {
        "name": "Jan DRIESSEN",
        "profile_url": "..."
      }
    ]
  }
]
```

### raw_athletes.json

Berisi profil detail untuk setiap atlet yang unik.

```json
[
  {
    "url": "...",
    "name": "A'ja WILSON",
    "country": "United States of America",
    "discipline": "Basketball",
    "game_participations": "2",
    "first_olympic_games": "Tokyo 2020",
    "year_of_birth": "1996",
    "olympic_medals": {
      "gold": 2,
      "silver": 0,
      "bronze": 0
    }
  }
]
```

### raw_medals.json

Berisi rekapitulasi perolehan medali per negara.

```json
[
  {
    "country": "United States of America",
    "gold": 40,
    "silver": 44,
    "bronze": 42,
    "total": 126
  }
]
```

---

## Struktur ERD dan Diagram Relasional

### Entity-Relationship Diagram (ERD)

![ERD](./ERD_Paris_Olympic_2024.jpg)

**Diagram Relasional:**

![Diagram Relasional](./Diagram_Relasional_Paris_Olympic_2024.jpg)

#### Proses Translasi ERD ke Diagram Relasional

- **Entitas menjadi Tabel:**  
  Setiap entitas kuat (Negara, Atlet, Olahraga, Pertandingan, Venue) langsung ditranslasikan menjadi sebuah tabel. Atribut pada entitas menjadi kolom pada tabel, dengan Primary Key (PK) yang sudah ditentukan.

- **Relasi Many-to-Many:**  
  - Relasi partisipasi (antara Atlet dan Pertandingan) adalah many-to-many. Relasi ini diubah menjadi tabel baru bernama `partisipasi`. Tabel ini berisi Foreign Key (FK) yang merujuk ke PK dari tabel atlet (`id_atlet`) dan pertandingan (`id_pertandingan`). Atribut medali dari relasi menjadi kolom di tabel ini.
  - Relasi tempat_diselenggarakan (antara Pertandingan dan Venue) juga many-to-many dan diubah menjadi tabel `pertandingan_venue` dengan logika yang sama.

- **Relasi One-to-Many:**  
  - Relasi mewakili (antara Atlet dan Negara) adalah one-to-many (satu negara bisa diwakili banyak atlet). Ini diimplementasikan dengan menambahkan kolom `nama_negara` sebagai Foreign Key di dalam tabel atlet yang merujuk ke tabel negara.
  - Relasi kategori (antara Olahraga dan Pertandingan) juga one-to-many dan diimplementasikan dengan cara yang sama melalui kolom `nama_olahraga` di tabel pertandingan.

---

## Screenshot Program

![Hasil Storing Data](./Data%20Storing/screenshot/Storing_Data_Paris_2024_Olympic.png)

![Hasil Query 1](./Data%20Storing/screenshot/contoh_query_1.png)
![Hasil Query 2](./Data%20Storing/screenshot/contoh_query_2.png)
![Hasil Query 3](./Data%20Storing/screenshot/contoh_query_3.png)


---

## Referensi

- **Sumber Data:** [Olympics.com - Paris 2024 Results](https://olympics.com/)
- **Library Utama:** Selenium, BeautifulSoup, Pandas, Psycopg2
- **DBMS:** PostgreSQL