import psycopg2
import os

# --- DETAIL KONEKSI DATABASE ---
# Database sumber (Operasional)
SRC_DB_NAME = "seleksi_basdat"

# Database tujuan (Data Warehouse)
DWH_DB_NAME = "seleksi_basdat_dwh"

DB_USER = "postgres"
DB_PASS = "basdathebat"
DB_HOST = "localhost"
DB_PORT = "5432"

def main():
    """Fungsi utama untuk proses ETL dari DB operasional ke DWH."""
    conn_src = None
    conn_dwh = None
    
    try:
        # --- EXTRACT ---
        # 1. Buka koneksi ke database SUMBER (seleksi_basdat) untuk mengambil data
        print(f"Menghubungkan ke database sumber: {SRC_DB_NAME}...")
        conn_src = psycopg2.connect(
            dbname=SRC_DB_NAME, user=DB_USER, password=DB_PASS, host=DB_HOST, port=DB_PORT
        )
        cur_src = conn_src.cursor()

        print("Mengambil data dari database sumber...")
        cur_src.execute("SELECT category_id, category_name FROM Categories;")
        categories_data = cur_src.fetchall()

        cur_src.execute("SELECT maturity_id, maturity_level FROM MaturityRatings;")
        maturities_data = cur_src.fetchall()

        cur_src.execute("SELECT app_id, app_name, price_text, apk_size_mb FROM Apps;")
        apps_data = cur_src.fetchall()
        
        cur_src.execute("""
            SELECT d.developer_id, d.developer_name, d.active_year, d.active_month, 
                   ds.app_count, ds.total_downloads, ds.average_rating, ds.total_rating_count
            FROM Developers d JOIN DeveloperStats ds ON d.developer_id = ds.developer_id;
        """)
        developers_data = cur_src.fetchall()

        cur_src.execute("""
            SELECT a.app_id, a.developer_id, a.category_id, a.maturity_id,
                   r.rank, r.rating, r.total_installs, r.recent_installs, a.price_numeric
            FROM Rankings r JOIN Apps a ON r.app_id = a.app_id;
        """)
        facts_data = cur_src.fetchall()

        print("Pengambilan data dari sumber selesai.")
        cur_src.close()
        conn_src.close()
        print(f"Koneksi ke {SRC_DB_NAME} ditutup.")

        # --- TRANSFORM & LOAD ---
        # 2. Buka koneksi ke database TUJUAN (seleksi_basdat_dwh) untuk memasukkan data
        print(f"\nMenghubungkan ke database tujuan: {DWH_DB_NAME}...")
        conn_dwh = psycopg2.connect(
            dbname=DWH_DB_NAME, user=DB_USER, password=DB_PASS, host=DB_HOST, port=DB_PORT
        )
        cur_dwh = conn_dwh.cursor()

        print("Mengosongkan tabel Data Warehouse sebelum memuat data baru...")
        cur_dwh.execute("TRUNCATE TABLE Fact_AppRanking, Dim_Developers, Dim_Apps, Dim_Categories, Dim_MaturityRatings RESTART IDENTITY CASCADE;")

        print("Memuat data ke tabel Dimensi...")
        cur_dwh.executemany("INSERT INTO Dim_Categories (category_id, category_name) VALUES (%s, %s);", categories_data)
        cur_dwh.executemany("INSERT INTO Dim_MaturityRatings (maturity_id, maturity_level) VALUES (%s, %s);", maturities_data)
        cur_dwh.executemany("INSERT INTO Dim_Apps (app_id, app_name, price_text, apk_size_mb) VALUES (%s, %s, %s, %s);", apps_data)
        cur_dwh.executemany("""
            INSERT INTO Dim_Developers (developer_id, developer_name, active_year, active_month, app_count, total_downloads, average_rating, total_rating_count)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s);
        """, developers_data)

        print("Memuat data ke tabel Fakta...")
        cur_dwh.executemany("""
            INSERT INTO Fact_AppRanking (app_id, developer_id, category_id, maturity_id, rank, rating, total_installs, recent_installs, price_numeric)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s);
        """, facts_data)

        conn_dwh.commit()
        print("\nSelamat! Proses ETL ke Data Warehouse telah selesai.")

    except psycopg2.Error as e:
        print(f"Gagal terhubung atau mengeksekusi perintah di database: {e}")
    finally:
        if conn_src is not None:
            conn_src.close()
        if conn_dwh is not None:
            cur_dwh.close()
            conn_dwh.close()
            print(f"Koneksi ke {DWH_DB_NAME} ditutup.")

if __name__ == '__main__':
    main()