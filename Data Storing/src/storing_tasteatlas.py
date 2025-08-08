import json
import os
from datetime import datetime

INPUT_DIR = "../../Data Scraping/data"
OUTPUT_FILE = "../tasteatlas.sql"

def read_json(filename):
    with open(os.path.join(INPUT_DIR, filename), "r", encoding="utf-8") as f:
        return json.load(f)

def sql_escape(val):
    if val is None: # <-- Cukup cek "None" saja
        return "NULL"
    if isinstance(val, (int, float)):
        return str(val)
    return "'" + str(val).replace("'", "''") + "'"

# Header
def write_header(f):
    f.write("-- PostgreSQL database dump\n")
    f.write(f"-- Generated on {datetime.now()}\n\n")
    f.write("SET statement_timeout = 0;\n")
    f.write("SET lock_timeout = 0;\n")
    f.write("SET idle_in_transaction_session_timeout = 0;\n")
    f.write("SET client_encoding = 'UTF8';\n")
    f.write("SET standard_conforming_strings = on;\n")
    f.write("SET check_function_bodies = false;\n")
    f.write("SET xmloption = content;\n")
    f.write("SET client_min_messages = warning;\n")
    f.write("SET row_security = off;\n\n")

# CREATE TABLE
def write_schema(f):
    f.write("""
            
CREATE TABLE users (
    email VARCHAR(255) PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    username VARCHAR(100) UNIQUE,
    "password" TEXT NOT NULL
);
            
CREATE TABLE countries (
    country_id VARCHAR(10) PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    continent VARCHAR(100)
);

CREATE TABLE categories (
    category_id VARCHAR(10) PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE quality_labels (
    label_id VARCHAR(10) PRIMARY KEY,
    label_name VARCHAR(200) NOT NULL,
    label_img TEXT,
    "desc" TEXT
);

CREATE TABLE dishes (
    dish_id VARCHAR(10) PRIMARY KEY,
    dish_name VARCHAR(200) NOT NULL,
    category_id VARCHAR(10) REFERENCES categories(category_id),
    country_id VARCHAR(10) REFERENCES countries(country_id),
    ranking INT CHECK (ranking > 0),
    city VARCHAR(100),
    average_rating NUMERIC(3,2) CHECK (average_rating >= 0 AND average_rating <= 5),
    "desc" TEXT,
    image TEXT,
    link TEXT
);

CREATE TABLE restaurants (
    resto_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    city VARCHAR(100),
    country_id VARCHAR(10) REFERENCES countries(country_id),
    address TEXT,
    website TEXT,
    rating NUMERIC(3,2) CHECK (rating >= 0 AND rating <= 5)
);

CREATE TABLE resto_menu (
    dish_id VARCHAR(10) REFERENCES dishes(dish_id),
    resto_id VARCHAR(10) REFERENCES restaurants(resto_id),
    PRIMARY KEY (dish_id, resto_id)
);

CREATE TABLE recipes (
    recipe_id VARCHAR(20) PRIMARY KEY,
    dish_id VARCHAR(10) REFERENCES dishes(dish_id),
    variation_name VARCHAR(200),
    prep VARCHAR(50),
    cook VARCHAR(50),
    "desc" TEXT,
    rating NUMERIC(3,2) CHECK (rating >= 0 AND rating <= 5)
);

CREATE TABLE comments (
    comment_id VARCHAR(10) PRIMARY KEY,
    dish_id VARCHAR(10) REFERENCES dishes(dish_id),
    email VARCHAR(255) REFERENCES users(email),
    content TEXT,
    rate NUMERIC(3,2) CHECK (rate >= 0 AND rate <= 5),
    created_at DATE,
    likes INT,
    dislikes INT
);

CREATE TABLE users_favorites (
    email VARCHAR(200) REFERENCES users(email),
    dish_id VARCHAR(10) REFERENCES dishes(dish_id),
    fav_ranking INT,
    PRIMARY KEY (email, dish_id)
);

CREATE TABLE dish_label (
    dish_id VARCHAR(10) REFERENCES dishes(dish_id),
    label_id VARCHAR(10) REFERENCES quality_labels(label_id),
    PRIMARY KEY (dish_id, label_id)
);

-- Validasi nilai rating ada di antara 0 dan 5
CREATE OR REPLACE FUNCTION check_rating_range()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.rating < 0 OR NEW.rating > 5 THEN
        RAISE EXCEPTION 'Rating harus antara 0 dan 5';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Menjalankan check_rating_range pada tabel dishes sebelum insert atau update
CREATE TRIGGER trg_check_dish_rating
BEFORE INSERT OR UPDATE ON dishes
FOR EACH ROW EXECUTE FUNCTION check_rating_range();

-- Menjalankan check_rating_range pada tabel recipes sebelum insert atau update
CREATE TRIGGER trg_check_restaurant_rating
BEFORE INSERT OR UPDATE ON restaurants
FOR EACH ROW EXECUTE FUNCTION check_rating_range();

""")

# Insert data
def write_inserts(f, table_name, data, columns):
    if data is None:
        print(f"Tidak ada data untuk di-insert ke tabel {table_name}.")
        return
    
    # Formating nama kolom
    formatted_columns = [f'"{c}"' if c == "desc" else c for c in columns]
    column_string = ", ".join(formatted_columns)

    for row in data:
        values = [sql_escape(row.get(col)) for col in columns]
        values_string = ", ".join(values)
        f.write(f"INSERT INTO {table_name} ({column_string}) VALUES ({values_string});\n")
    f.write("\n")
    print(f"Berhasil menulis data.")

def main():
    # Membaca file
    os.makedirs(os.path.dirname(OUTPUT_FILE), exist_ok=True)
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        write_header(f)
        write_schema(f)

        # Load data
        countries = read_json("countries_clean.json")
        categories = read_json("categories_clean.json")
        labels = read_json("quality_labels_clean.json")
        dishes = read_json("dishes_clean.json")
        restaurants = read_json("restaurants_clean.json")
        recipes = read_json("recipes_clean.json")
        # comments = read_json("comments_clean.json") # Karena comment berhubungan erat dengan users, sedangkan tabel users tidak ada datanya sehingga dicomment terlebih dahulu

        # Write copy
        write_inserts(f, "countries", countries, ["country_id", "country_name", "continent"])
        write_inserts(f, "categories", categories, ["category_id", "category_name"])
        write_inserts(f, "quality_labels", labels, ["label_id", "label_name", "label_img", "desc"])
        write_inserts(f, "dishes", dishes, ["dish_id", "dish_name", "category_id", "country_id", "ranking", "city", "average_rating", "desc", "image", "link"])
        write_inserts(f, "restaurants", restaurants, ["resto_id", "name", "city", "country_id", "address", "website", "rating"])
        write_inserts(f, "recipes", recipes, ["recipe_id", "dish_id", "variation_name", "prep", "cook", "desc", "rating"])

    print(f"Proses dumb berhasil")

if __name__ == "__main__":
    main()
