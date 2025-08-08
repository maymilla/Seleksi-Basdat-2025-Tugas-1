import os
import pandas as pd
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
import logging
from dotenv import load_dotenv
from tqdm import tqdm

logging.basicConfig(level=logging.INFO, format='%(asctime)s [%(levelname)s] %(message)s', datefmt='%H:%M:%S')

project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
dotenv_path = os.path.join(project_root, '.env')
load_dotenv(dotenv_path=dotenv_path)

DB_CONFIG = {
    "dbname": "olympics_db",
    "user": os.getenv('DB_USER'),
    "password": os.getenv('DB_PASSWORD'),
    "host": os.getenv('DB_HOST'),
    "port": "5432"
}

# --- Konfigurasi File ---
DATA_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'Data Scraping', 'data', 'cleaned_data'))

# ==============================================================================
# SCRIPT SQL UNTUK MEMBUAT TABEL
# ==============================================================================
CREATE_TABLES_SQL = """
-- Script to create the table structure for the Olympics database.
-- This script is designed for PostgreSQL and includes integrity constraints.

-- Drop tables if they exist to ensure a clean setup
DROP TABLE IF EXISTS partisipasi, pertandingan_venue, venue, pertandingan, atlet, negara, olahraga CASCADE;

-- Table: negara
CREATE TABLE negara (
    nama_negara VARCHAR(255) PRIMARY KEY,
    benua VARCHAR(255)
);

-- Table: atlet
CREATE TABLE atlet (
    id INT PRIMARY KEY,
    nama_negara VARCHAR(255) NOT NULL REFERENCES negara(nama_negara),
    nama VARCHAR(255) NOT NULL,
    cabang_olahraga VARCHAR(255),
    jumlah_partisipasi_olimpiade INT,
    olimpiade_pertama VARCHAR(255),
    tahun_lahir INT
);

-- Table: olahraga
CREATE TABLE olahraga (
    nama_olahraga VARCHAR(255) PRIMARY KEY
);

-- Table: pertandingan
CREATE TABLE pertandingan (
    id INT PRIMARY KEY,
    nama_olahraga VARCHAR(255) NOT NULL REFERENCES olahraga(nama_olahraga),
    nama_pertandingan VARCHAR(255) NOT NULL,
    jenis_pertandingan VARCHAR(255) CHECK (jenis_pertandingan IN ('team', 'individual'))
);

-- Table: partisipasi (Junction Table)
CREATE TABLE partisipasi (
    id_pertandingan INT NOT NULL REFERENCES pertandingan(id),
    id_atlet INT NOT NULL REFERENCES atlet(id),
    medali VARCHAR(50) CHECK (medali IN ('emas', 'perak', 'perunggu') OR medali LIKE '#%'),
    PRIMARY KEY (id_pertandingan, id_atlet)
);

-- Table: venue
CREATE TABLE venue (
    id INT PRIMARY KEY,
    nama_tempat VARCHAR(255),
    kapasitas_penonton INT CHECK (kapasitas_penonton >= 0)
);

-- Table: pertandingan_venue (Junction Table)
CREATE TABLE pertandingan_venue (
    id_pertandingan INT NOT NULL REFERENCES pertandingan(id),
    id_venue INT NOT NULL REFERENCES venue(id),
    PRIMARY KEY (id_pertandingan, id_venue)
);
"""

# ==============================================================================
# SETUP DATABASE
# ==============================================================================

def setup_database(config):
    """
    Memastikan database ada. Jika tidak, database akan dibuat.
    """
    db_name = config["dbname"]
    conn_config = config.copy()
    conn_config["dbname"] = "postgres" 
    
    conn = None
    try:
        conn = psycopg2.connect(**conn_config)
        conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        cursor = conn.cursor()
        
        cursor.execute(f"SELECT 1 FROM pg_database WHERE datname = '{db_name}'")
        exists = cursor.fetchone()
        
        if not exists:
            logging.info(f"Database '{db_name}' tidak ditemukan. Membuat database baru...")
            cursor.execute(f"CREATE DATABASE {db_name}")
            logging.info(f"Database '{db_name}' berhasil dibuat.")
        else:
            logging.info(f"Database '{db_name}' sudah ada.")
            
        cursor.close()
    except psycopg2.Error as e:
        logging.error(f"Error saat setup database: {e}")
    finally:
        if conn:
            conn.close()

# ==============================================================================
# KELOLA DATABASE
# ==============================================================================

class DataStorer:
    """
    Mengelola koneksi ke database dan proses DDL (membuat tabel) serta DML (memasukkan data).
    """
    def __init__(self, db_config):
        self.db_config = db_config
        self.conn = None

    def connect(self):
        """Membangun koneksi ke database PostgreSQL."""
        try:
            logging.info(f"Menghubungkan ke database '{self.db_config['dbname']}'...")
            self.conn = psycopg2.connect(**self.db_config)
            logging.info("Koneksi berhasil.")
        except psycopg2.OperationalError as e:
            logging.error(f"Gagal terhubung ke database: {e}")
            self.conn = None

    def create_tables(self):
        """Mengeksekusi skrip SQL untuk membuat struktur tabel."""
        if not self.conn: return
        cursor = self.conn.cursor()
        try:
            logging.info("Membuat struktur tabel database...")
            cursor.execute(CREATE_TABLES_SQL)
            self.conn.commit()
            logging.info("Semua tabel berhasil dibuat.")
        except (Exception, psycopg2.DatabaseError) as error:
            logging.error(f"Error saat membuat tabel: {error}")
            self.conn.rollback()
        finally:
            cursor.close()

    def insert_data(self, table_name: str, df: pd.DataFrame):
        """Fungsi generik untuk memasukkan data dari DataFrame ke tabel PostgreSQL."""
        if not self.conn: return

        cursor = self.conn.cursor()
        logging.info(f"Memulai proses penyimpanan ke tabel '{table_name}'...")
        
        df = df.where(pd.notnull(df), None)
        cols = ','.join(df.columns)
        vals_template = ','.join(['%s'] * len(df.columns))
        query = f"INSERT INTO {table_name} ({cols}) VALUES ({vals_template})"

        try:
            # PERBAIKAN: Menyimpan referensi ke baris terakhir untuk logging error
            last_processed_row = None
            last_processed_index = -1
            
            for index, row in tqdm(df.iterrows(), total=df.shape[0], desc=f"Storing to {table_name}"):
                last_processed_row = row
                last_processed_index = index
                cursor.execute(query, tuple(row))
                
            self.conn.commit()
            logging.info(f"Berhasil menyimpan {len(df)} baris ke tabel '{table_name}'.")
            
        except (Exception, psycopg2.DatabaseError) as error:
            logging.error(f"Error saat menyimpan ke tabel '{table_name}': {error}")
            if last_processed_row is not None:
                # Menampilkan informasi baris yang menyebabkan error
                logging.error(f"Error kemungkinan terjadi pada baris CSV ke-{last_processed_index + 2} (index pandas: {last_processed_index}).")
                logging.error(f"Data baris yang gagal: \n{last_processed_row.to_dict()}")
            self.conn.rollback()
        finally:
            cursor.close()

    def close_connection(self):
        """Menutup koneksi database."""
        if self.conn is not None:
            self.conn.close()
            logging.info('Koneksi database ditutup.')

# ==============================================================================
# MAIN FUNCTION
# ==============================================================================

def run_storing_pipeline():
    """
    Fungsi utama untuk menjalankan seluruh alur kerja.
    """
    setup_database(DB_CONFIG)

    logging.info(f"Mencari file CSV di direktori: {DATA_DIR}")

    try:
        df_negara = pd.read_csv(os.path.join(DATA_DIR, 'negara.csv'))
        df_atlet = pd.read_csv(os.path.join(DATA_DIR, 'atlet.csv'))
        df_pertandingan = pd.read_csv(os.path.join(DATA_DIR, 'pertandingan.csv'))
        df_partisipasi = pd.read_csv(os.path.join(DATA_DIR, 'partisipasi.csv'))
        df_olahraga = pd.DataFrame(df_pertandingan['nama_olahraga'].unique(), columns=['nama_olahraga'])
        
        df_negara.columns = [col.lower() for col in df_negara.columns]
        df_atlet.columns = [col.lower() for col in df_atlet.columns]
        df_pertandingan.columns = [col.lower() for col in df_pertandingan.columns]
        df_partisipasi.columns = [col.lower() for col in df_partisipasi.columns]
        df_olahraga.columns = [col.lower() for col in df_olahraga.columns]
        
        logging.info("Semua file CSV berhasil dibaca.")
    except FileNotFoundError as e:
        logging.error(f"Error: Tidak dapat menemukan file CSV. {e}")
        return

    storer = DataStorer(DB_CONFIG)
    storer.connect()

    if storer.conn:
        storer.create_tables()
        
        storer.insert_data('negara', df_negara)
        storer.insert_data('olahraga', df_olahraga)
        storer.insert_data('atlet', df_atlet)
        storer.insert_data('pertandingan', df_pertandingan)
        storer.insert_data('partisipasi', df_partisipasi)
        
        storer.close_connection()

if __name__ == "__main__":
    run_storing_pipeline()

