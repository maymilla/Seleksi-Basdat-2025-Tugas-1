import json
import os
import psycopg2

# --- SESUAIKAN DETAIL KONEKSI DATABASE ANDA DI SINI ---
DB_NAME = "seleksi_basdat"
DB_USER = "postgres"
DB_PASS = "basdathebat"
DB_HOST = "localhost"
DB_PORT = "5432"

def load_data_from_json(filepath):
    """Membuka dan memuat data dari sebuah file JSON."""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            return json.load(f)
    except FileNotFoundError:
        print(f"Error: File tidak ditemukan di {filepath}")
        return None

def main():
    """Fungsi utama untuk menghubungkan ke DB dan memuat semua data."""
    # Menyiapkan path ke file-file JSON yang sudah bersih
    input_dir = os.path.join('Data Scraping', 'data')
    ranking_data = load_data_from_json(os.path.join(input_dir, 'ranking_clean.json'))
    app_details_data = load_data_from_json(os.path.join(input_dir, 'app_details_clean.json'))
    dev_details_data = load_data_from_json(os.path.join(input_dir, 'developer_details_clean.json'))

    if not all([ranking_data, app_details_data, dev_details_data]):
        print("Satu atau lebih file JSON bersih tidak ditemukan. Proses dibatalkan.")
        return

    conn = None
    try:
        # Menghubungkan ke database PostgreSQL
        conn = psycopg2.connect(
            dbname=DB_NAME, user=DB_USER, password=DB_PASS, host=DB_HOST, port=DB_PORT
        )
        cur = conn.cursor()
        print("Koneksi ke database PostgreSQL berhasil.")

        # URUTAN INSERT SANGAT PENTING KARENA FOREIGN KEY
        
        # 1. Masukkan data ke tabel dimensi (Categories, MaturityRatings)
        all_categories = {app['category'] for app in app_details_data if app.get('category')}
        all_maturities = {app['maturity'] for app in app_details_data if app.get('maturity')}

        print("\nMemasukkan data ke tabel Categories...")
        for category in all_categories:
            cur.execute("INSERT INTO Categories (category_name) VALUES (%s) ON CONFLICT (category_name) DO NOTHING;", (category,))
        
        print("Memasukkan data ke tabel MaturityRatings...")
        for maturity in all_maturities:
            if maturity: # Memastikan tidak memasukkan nilai null
                cur.execute("INSERT INTO MaturityRatings (maturity_level) VALUES (%s) ON CONFLICT (maturity_level) DO NOTHING;", (maturity,))

        # 2. Masukkan data ke tabel Developers
        print("Memasukkan data ke tabel Developers...")
        for dev in dev_details_data:
            cur.execute(
                """
                INSERT INTO Developers (developer_name, active_year, active_month, source_url)
                VALUES (%s, %s, %s, %s) ON CONFLICT (developer_name) DO NOTHING;
                """,
                (dev['developer_name'], dev.get('active_year'), dev.get('active_month'), dev['source_url'])
            )

        # 3. Masukkan data ke tabel DeveloperStats
        print("Memasukkan data ke tabel DeveloperStats...")
        for dev in dev_details_data:
            cur.execute("SELECT developer_id FROM Developers WHERE developer_name = %s;", (dev['developer_name'],))
            dev_id_result = cur.fetchone()
            if dev_id_result:
                dev_id = dev_id_result[0]
                cur.execute(
                    """
                    INSERT INTO DeveloperStats (developer_id, app_count, total_downloads, average_rating, total_rating_count)
                    VALUES (%s, %s, %s, %s, %s);
                    """,
                    (dev_id, dev.get('app_count'), dev.get('total_downloads'), dev.get('average_rating'), dev.get('total_rating_count'))
                )

        # 4. Masukkan data ke tabel Apps
        print("Memasukkan data ke tabel Apps...")
        for app in app_details_data:
            cur.execute("SELECT category_id FROM Categories WHERE category_name = %s;", (app.get('category'),))
            cat_id_res = cur.fetchone()
            cat_id = cat_id_res[0] if cat_id_res else None
            
            cur.execute("SELECT developer_id FROM Developers WHERE developer_name = %s;", (app.get('developer'),))
            dev_id_res = cur.fetchone()
            dev_id = dev_id_res[0] if dev_id_res else None
            
            cur.execute("SELECT maturity_id FROM MaturityRatings WHERE maturity_level = %s;", (app.get('maturity'),))
            mat_id_res = cur.fetchone()
            mat_id = mat_id_res[0] if mat_id_res else None

            cur.execute(
                """
                INSERT INTO Apps (app_name, category_id, developer_id, maturity_id, price_numeric, apk_size_mb, source_url)
                VALUES (%s, %s, %s, %s, %s, %s, %s) ON CONFLICT (source_url) DO NOTHING;
                """,
                (app['app_name'], cat_id, dev_id, mat_id, app.get('price_numeric'), app.get('apk_size_mb'), app.get('source_url'))
            )

        # 5. Masukkan data ke tabel Rankings
        print("Memasukkan data ke tabel Rankings...")
        app_url_to_id_map = {}
        cur.execute("SELECT app_id, source_url FROM Apps;")
        for row in cur.fetchall():
            app_url_to_id_map[row[1]] = row[0]
        
        app_name_to_url_map = {app['app_name']: app['source_url'] for app in app_details_data}

        for rank_info in ranking_data:
            app_name = rank_info['app_name']
            source_url = app_name_to_url_map.get(app_name)
            if source_url:
                app_id = app_url_to_id_map.get(source_url)
                if app_id:
                    cur.execute(
                        """
                        INSERT INTO Rankings (app_id, rank, rating, total_installs, recent_installs)
                        VALUES (%s, %s, %s, %s, %s);
                        """,
                        (app_id, rank_info['rank'], rank_info['rating'], rank_info['total_installs'], rank_info['recent_installs'])
                    )
        
        # Simpan semua perubahan ke database
        conn.commit()
        print("\nSelamat! Semua data telah berhasil dimasukkan ke dalam database.")

    except psycopg2.Error as e:
        print(f"Gagal terhubung atau mengeksekusi perintah di database: {e}")
    finally:
        # Tutup kursor dan koneksi
        if conn is not None:
            cur.close()
            conn.close()
            print("Koneksi ke database ditutup.")

if __name__ == '__main__':
    main()