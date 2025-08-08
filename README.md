# TUGAS SELEKSI 1 - 13523086

## Author

- Nama: Bob Kunanda
- NIM: 13523086

---

## Deskripsi Singkat Data & DBMS

Proyek ini membangun sebuah database dan data warehouse untuk data sepatu, review, dan toko dari berbagai link. Data disimpan dalam PostgreSQL (RDBMS). Topik sepatu basket dipilih karena hobby saya terhadap basket. Awalnya topik yang saya inginkan adalah data NBA karena data tersebut sangat tertruktur dan bersih, namun saya tidak menemukan satu pun website data NBA yang memperbolehkan scraping sehingga saya merubah topik saya menjadi sepatu basket. Website ini saya pilih karena saya sendiri pernah menggunakannya untuk kebutuhan pribadi dan sudah lumayan mengenal strukturnya sehingga membantu saya dalam scraping.

---

## Cara Menggunakan Scraper & Output

### Setup Virtual Environment (venv)

Sebelum menjalankan project, aktifkan virtual environment agar semua library yang dibutuhkan sudah terinstall dan terisolasi dari sistem global.

**Cara membuat dan mengaktifkan venv:**

```bash
# Membuat virtual environment (jika belum ada)
python -m venv venv

# Mengaktifkan venv (Windows)
venv\Scripts\activate

# Mengaktifkan venv (Linux/Mac)
source venv/bin/activate

# Install semua dependency
pip install -r [requirements.txt](http://_vscodecontentref_/1)
```

Pastikan menjalankan semua perintah di atas sebelum menjalankan scraper atau script lain.

### Konfigurasi Environment (.env)

File `.env` digunakan untuk menyimpan konfigurasi database dan data warehouse.  
Contoh isi file `.env`:

```env
DB_NAME=basketbal_shoes
DB_USER=postgres
DB_PASS=your_password
DB_HOST=localhost
DB_PORT=5432

DW_DB_NAME=shoes_warehouse
DW_DB_USER=postgres
DW_DB_PASS=your_password
DW_DB_HOST=localhost
DW_DB_PORT=5432
```

### Cara Menjalankan

1. **Jalankan Scraper**  
    Sebelumnya pastikan sudah berada pada root folder yaitu TUGAS_SELEKSI_1_13523086

    Scraper dapat dijalankan dengan perintah berikut di terminal:

    ``` bash
    invoke scrape
    ```

    Scraper akan mengambil data dari web dan menyimpannya dalam file JSON di folder `Data Scraping/data/`.
2. **Menggunakan Output**  
    File JSON hasil scraping dapat digunakan untuk proses ETL ke database dengan menjalankan:

    **Windows:**

    ```bash
    python Data" "Storing/src/storing.py
    ```

    **macOS/Linux:**

    ```bash
    python Data\ Storing/src/storing.py
    ```

    atau untuk menghindari duplikasi data, gunakan:

    **Windows:**

    ```bash
    python Data" "Warehouse/src/etl.py
    ```

    **macOS/Linux:**

    ```bash
    python Data\ Warehouse/src/etl.py
    ```

    `storing.py` dapat menybabkan duplikasi karena digunakan untuk penyimpanan awal dan `etl` akan unik karena diperuntukan automated scheduling

    Proses ini akan memasukkan data ke `PostgreSQL` sesuai struktur relasional yang telah dibuat.

---

## Struktur File JSON Output

1. `shoe_links.json` json untuk penyimpanan link untuk setiap sepatu yang digunakan untuk scraping selanjutnya:

    | Field         | Description                                                                 |
    |---------------|-----------------------------------------------------------------------------|
    | `total_links_found`     | Banyak link yang ditemukan                               |
    | `shoe_links`        | Array berisi link yang sudah discrape |

    Contoh:

    ```json
    [{
    "total_links_found": 351,
    "shoe_links": [
        "https://www.thehoopsgeek.com/shoe-reviews/reebok-engine-a/",
        "https://www.thehoopsgeek.com/shoe-reviews/jordan-luka-4/",
        ..
            ]
        }
    ]

2. `Shoe.json` json untuk penyimpanan data sepatu dengan struktur sebagai berikut:

    | Field         | Description                                                                 |
    |---------------|-----------------------------------------------------------------------------|
    | `shoe_id`     | Identifikasi unik untuk setiap sepatu(integer)                                   |
    | `name`        | Nama sepatu (string)                                                   |
    | `brand`       | Merk sepatu (cth: Nike, Adidas, Reebok)                             |
    | `player`      | Pemain yang disponsor untuk sepatu                    |
    | `release_date`| Tanggal pengeluaran sepatu dengan format `YYYY-MM-DD` (string)                             |
    | `description` | Deskripsi singkat terkait sepatu (string)     |
    | `shoe_type`   | Tipe sepatu (cth: Low Top, High Top, dsb) (string)                         |
    | `retail_price`| Harga retail dalam USD (float)                                                 |

    Contoh:

    ```json
    [
        {
            "shoe_id": 1,
            "name": "Reebok Engine A",
            "brand": "Reebok",
            "player": null,
            "release_date": "2025-05-01",
            "description": "The Reebok Engine A is best for bigger players looking for solid impact protection.",
            "shoe_type": "Low Top",
            "retail_price": 119.99
        },
        ..
    ]
    ```

3. `Colorway.json` json untuk penyimpanan colorway untuk setiap sepatu

    | Field         | Description                                                                 |
    |---------------|-----------------------------------------------------------------------------|
    | `colorway_id`     | Identifikasi unik untuk setiap colorway (integer)                                |
    | `shoe_id`        | Identifikasi unik untuk setiap colorway (integer) |
    | `colorway`        | Nama atau sebutan dari colorway (string) |

    Contoh:

    ```json
   [
        {
            "colorway_id": 1,
            "shoe_id": 2,
            "colorway": "Barely Green / Vapor Green / Metallic Silver / Black"
        },
        ..
    ]
    ```

4. `Store.json` json untuk penyimpanan data toko yang menjual sepatu tersebut

    | Field         | Description                                                                 |
    |---------------|-----------------------------------------------------------------------------|
    | `store_id`     | Identifikasi unik untuk setiap toko (integer)                                |
    | `name`        | Nama dari toko tersebut (string) |
    | `main_link`        | Link utama yang menuju ke toko tersebut (string) |

    Contoh:

    ```json
   [
        {
            "store_id": 1,
            "name": "Foot Locker",
            "main_link": "https://www.footlocker.com"
        },
        ..
    ]
    ```

5. `Shoe_listing.json` json untuk penyimpanan data terkait pemasangan harga untuk setiap sepatu dan toko

    | Field         | Description                                                                 |
    |---------------|-----------------------------------------------------------------------------|
    | `store_id`     | Identifikasi unik untuk setiap toko (integer)                                |
    | `shoe_id`        | Identifikasi unik untuk setiap sepatu  (integer) |
    | `price`        | Harga sekarang yang dijual pada toko tersebut (float) |
    | `link`        | Link terkait penjualan tersebut (string) |

    Contoh:

    ```json
    [
        {
            "store_id": 1,
            "shoe_id": 2,
            "price": 99.99,
            "link": "https://footlocker.8s4u9r.net/c/1960210/793097/11068?prodsku=F082330010&u=https%3A%2F%2Fwww.footlocker.com%2Fproduct%2F%7E%2FF0823300.html&intsrc=CATF_5700&subid1=price_comp_price"
        },
        ..
    ]
    ```

6. `critics_link_data.json` json untuk penyimpanan data link untuk setiap kritikus

    | Field         | Description                                                                 |
    |---------------|-----------------------------------------------------------------------------|
    | `critic_id`     | Identifikasi unik untuk setiap kritikus (integer)                                |
    | `link`        | Link yang mengacu kepada profil kritikus  (string) |
    | `is_expert`        | Penanda terkait expert atau user (integer) |

    Contoh:

    ```json
    [
        {
            "critic_id": 1,
            "link": "https://www.thehoopsgeek.com/shoe-reviews/critic?id=37",
            "is_expert": 1
        },
        ..
    ]
    ```

7. `Critic.json` json untuk penyimpanan data untuk setiap kritikus

    | Field         | Description                                                                 |
    |---------------|-----------------------------------------------------------------------------|
    | `critic_id`     | Identifikasi unik untuk setiap kritikus (integer)                                |
    | `name`        | Nama kritikus  (string) |

    Contoh:

    ```json
    [
        {
            "critic_id": 1,
            "name": "Foot Doctor Zach"
        },
        ..
    ]
    ```

8. `Expert.json` json untuk penyimpanan data untuk setiap kritikus yang tergolong expert

    | Field         | Description                                                                 |
    |---------------|-----------------------------------------------------------------------------|
    | `critic_id`     | Identifikasi unik untuk setiap kritikus yang tergolong expert (integer)                                |
    | `profile_link`        | Link untuk menuju profil external  (string) |

    Contoh:

    ```json
    [
        {
            "critic_id": 1,
            "profile_link": "https://www.youtube.com/channel/UCSOQGnOJqKOlIeQoXOSFyjw"
        },
        ..
    ]
    ```

9. `User.json` json untuk penyimpanan data untuk setiap kritikus yang tergolong user

    | Field         | Description                                                                 |
    |---------------|-----------------------------------------------------------------------------|
    | `critic_id`     | Identifikasi unik untuk setiap kritikus yang tergolong user (integer)                                |

    Contoh:

    ```json
    [
        {
            "critic_id": 4
        },
        ..
    ]
    ```

10. `Review.json` json untuk penyimpanan data review dari sebuah sepatu oleh seorang kritikus

    | Field         | Description                                                                 |
    |---------------|-----------------------------------------------------------------------------|
    | `review_id`     | Identifikasi unik untuk setiap review(integer)                                |
    | `shoe_id`     | Identifikasi unik untuk setiap sepatu(integer)                                |
    | `critic_id`     | Identifikasi unik untuk setiap kritikus (integer)                                |
    | `rating`     | Nilai penilaian yang diberikan kritikus terhadap sepatu (float)                                |
    | `date`| Tanggal review sepatu dengan format `YYYY-MM-DD` (string)                                  |
    | `type`   | Tipe review (cth: cushion, traction, dsb) (string) |
    | `description`     | Deskripsi singkat terkait review terhadap sepatu (string)                                |

    Contoh:

    ```json
    [
        {
            "review_id": 1,
            "shoe_id": 1,
            "critic_id": 1,
            "rating": 8.6,
            "date": "2025-05-15",
            "type": "expert_overall",
            "description": "The Reebok Engine A does not disappoint. If you can get the fit right, the performance feels fantastic."
        },
    ]
    ```

---

## Struktur ERD & Diagram Relasional

**ERD:**
![ERD](Data%20Storing/design/ERD.drawio.png)

**Diagram Relasional:**
![Diagram Relasional](Data%20Storing/design/Relational_diagram.drawio.png)

---

## Translasi ERD ke Diagram Relasional

1. Terdapat relasi **many-to-many** antara `Store` dan `Shoe` dengan atribut tambahan berupa `price` dan `link`. Oleh karena itu, dibentuk tiga buah tabel:

    - `Store`
    - `Shoe`
    - `Shoe_listing` (tabel relasi dengan atribut tambahan)

    Relasi & Constraint

    **PK:**
    - `Shoe_listing` : (`shoe_id`, `store_id`)
    - `Shoe` : (`shoe_id`)
    - `Store` : (`store_id`)

    **FK:**
    - `Shoe_listing.shoe_id` → `Shoe.shoe_id`
    - `Shoe_listing.store_id` → `Store.store_id`

2. `Shoe` memiliki **weak entity** `Colorway` sehingga dapat dibuat tabel baru yaitu:
    - `Colorway`

    Relasi & Constraint

    **PK:**
    - `Colorway`: (`shoe_id`, `colorway_id`)

    **FK:**
    - `Colorway.shoe_id` → `Shoe.shoe_id`

3. `Critic` memiliki **specialization** yang terbagi dua menjadi `Expert` dan `User` sehingga menghasilkan tabel:
    - `Critic`
    - `Expert`
    - `User`

    Relasi & Constraint

    **PK:**
    - `Critic` : (`critic_id`)
    - `Expert` : (`critic_id`)
    - `User` : (`critic_id`)

    **FK:**
    - `Expert.critic_id` → `Critic.critic_id`
    - `User.critic_id` → `Critic.critic_id`

4. `Review` relasi **many-to-one** terhadap `Shoe` dan `Critic` sehingga menghasilkan tabel:
    - `Review`

    Relasi & Constraint

    **PK:**
    - `Review` : (`review_id`)

    **FK:**
    - `Review.shoe_id` → `Shoe.shoe_id`
    - `Review.critic_id` → `Critic.critic_id`

---

## Screenshot Hasil

- **Shoe**
![shoe](Data%20Storing/screenshot/shoe.png)

- **Store**
![store](Data%20Storing/screenshot/store.png)

- **Shoe_listing**
![shoe_listing](Data%20Storing/screenshot/shoe_listing.png)

- **Critic**
![critic](Data%20Storing/screenshot/critic.png)

- **Colorway**
![colorway](Data%20Storing/screenshot/colorway.png)

- **Expert**
![expert](Data%20Storing/screenshot/expert.png)

- **User**
![user](Data%20Storing/screenshot/user.png)

- **Review**
![review](Data%20Storing/screenshot/review.png)

---

## Bonus

## Data Warehouse

### Deskripsi Singkat

Dimension table yang digunakan menggunakan *star scheme* dengan `Fact_Review` sebagai pusatnya.

### Struktur ERD & Diagram Relasional

**ERD:**
![ERD](Data%20Warehouse/design/data_warehouse_ERD.png)

**Diagram Relasional:**
![Diagram Relasional](Data%20Warehouse/design/data_warehouse_relational_diagram.png)

---

### Screenshot Hasil

- **Fact_Review**
![fact_review](Data%20Storing/screenshot/fact_review.png)

- **Dim_Shoe**
![dim_shoe](Data%20Storing/screenshot/dim_shoe.png)

- **Dim_Critic**
![dim_critic](Data%20Storing/screenshot/dim_critic.png)

- **Dim_Date**
![dim_date](Data%20Storing/screenshot/dim_date.png)

- **Dim_ReviewType**
![dim_reviewtype](Data%20Storing/screenshot/dim_reviewtype.png)

---

## Automated Scheduling

### Deskripsi Singkat

Automated scheduling dilakukan secara 3 tahap

1. Scraping seluruh data dari `website` menjadi `json` dengan menggunakan seluruh file scraping pada `Data Scraping/src` agar dapat terambil jika ada perubahan pada data lama.
2. `Json` dimasukkan ke `database` menggunakan `Data Warehouse/src/etl.py` dan dengan menggunakan constraint untuk menghindari terjadinya insertion yang duplicate namun tetap memperbolehkan untuk update data lama.
3. Data pada `database` ke `data warehouse` menggunakan `Data Warehouse/src/storing.py` dan berbeda dengan tahap 2, pada tahap ini tidak ada update karena data warehouse memerlukan penyimpanan data historis sehingga data lama yang berubah akan dianggap sebagai data baru.

Ketiga tahap tersebut dijalankan oleh `tasks.py` dan dibantu oleh task_scheduler setiap jam `01.00`.

### Otomasi `invoke full-pipeline` menggunakan Windows Task Scheduler

Automated scheduling dapat dilakukan dengan bantuan dari **Windows Task Scheduler**.

### Cara Set Up

1. **Buka Task Scheduler**
   - Pencet `Win + S`, ketik **Task Scheduler**, dan buka.

2. **Pembuatan Task**
   - Pencet **Create Basic Task...** atau **Create Task**.
   - Beri nama untuk task yang ingin dibuat.

3. **Pilih Trigger**
   - Pilih kapan ingin dijalankan tasknya.
   - Pilih waktunya. (Saya sendiri menggunakan daily jam 01.00)

4. **Set Action**
   - Action: **Start a Program**
   - **Program/script**:

     ```Bash
     {Path menuju repo}\TUGAS_SELEKSI_1_13523086\venv\Scripts\invoke.exe
     ```

   - **Tambahkan arguments**:

     ```Bash
     full-pipeline
     ```

   - **Start in (optional)**:

     ```Bash
     {Path menuju repo}\TUGAS_SELEKSI_1_13523086
     ```

---

- Atau langsung melalui terminal:

```bash
{Path menuju repo}\TUGAS_SELEKSI_1_13523086\venv\Scripts\python.exe -m invoke full-pipeline
```

### Screenshot

- **Action Settings**
![Action Setting](Automated%20Scheduling/screenshot/action_settings.png)

- **Tampilan Task**
![Tampilan Task](Automated%20Scheduling/screenshot/tampilan_task.png)

- **Hasil**
![Hasil](Automated%20Scheduling/screenshot/bukti_berhasil.png)

Karena waktu mepet, pengambilan data tidak dilakukan dalam waktu yang seharusnya (01.00), namun dapat dilihat pada gambar hasil bahwa program berjalan dengan lancar yang dibuktikan oleh return code 0.

---

## Referensi

Library yang Digunakan

- **requests**

    Untuk melakukan HTTP request ke halaman web.
    <https://docs.python-requests.org/>

- **BeautifulSoup (bs4)**

    Untuk parsing dan ekstraksi data dari HTML.
    <https://www.crummy.com/software/BeautifulSoup/bs4/doc/>

- **re** (Regular Expressions)

    Untuk pencocokan pola dan ekstraksi teks.
    <https://docs.python.org/3/library/re.html>

- **json**

    Untuk membaca dan menulis file JSON.
    <https://docs.python.org/3/library/json.html>

- **csv**

    Untuk membaca dan menulis file CSV.
    <https://docs.python.org/3/library/csv.html>

- **pandas**

    Untuk manipulasi data dan membaca/menulis data tabular.
    <https://pandas.pydata.org/>

- **psycopg2**

    Untuk koneksi dan eksekusi query ke database PostgreSQL.
    <https://www.psycopg.org/>

- **dotenv**

    Untuk memuat variabel lingkungan dari file .env.
    <https://pypi.org/project/python-dotenv/>

- **selenium**

    Untuk otomasi browser dan scraping halaman web dinamis.
    <https://selenium-python.readthedocs.io/>

- **invoke**

    Untuk otomasi task dan menjalankan pipeline.
    <https://www.pyinvoke.org/>

- **concurrent.futures**

    Untuk menjalankan task scraping secara paralel.
    <https://docs.python.org/3/library/concurrent.futures.html>

Sumber Web yang Di-scrape

- **The Hoops Geek**

    Sumber utama untuk review sepatu basket, profil kritikus, dan detail sepatu.
    <https://www.thehoopsgeek.com/shoe-reviews/>
