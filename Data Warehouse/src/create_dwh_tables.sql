-- ========= DIMENSION TABLES =========

-- Dimensi untuk Developer
CREATE TABLE Dim_Developers (
    developer_id INT PRIMARY KEY,
    developer_name VARCHAR(255) NOT NULL,
    active_year INT,
    active_month INT,
    app_count INT,
    total_downloads BIGINT,
    average_rating REAL,
    total_rating_count BIGINT
);

-- Dimensi untuk Aplikasi
CREATE TABLE Dim_Apps (
    app_id INT PRIMARY KEY,
    app_name VARCHAR(255) NOT NULL,
    price_text VARCHAR(50),
    apk_size_mb REAL
);

-- Dimensi untuk Kategori
CREATE TABLE Dim_Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Dimensi untuk Peringkat Kedewasaan
CREATE TABLE Dim_MaturityRatings (
    maturity_id INT PRIMARY KEY,
    maturity_level VARCHAR(50) NOT NULL
);


-- ========= FACT TABLE =========

-- Tabel Fakta Pusat untuk Analisis Peringkat
CREATE TABLE Fact_AppRanking (
    fact_id SERIAL PRIMARY KEY,
    
    -- Foreign Keys to Dimension Tables
    app_id INT,
    developer_id INT,
    category_id INT,
    maturity_id INT,
    
    -- Measures (Fakta Numerik)
    rank INT,
    rating REAL,
    total_installs BIGINT,
    recent_installs BIGINT,
    price_numeric NUMERIC(10, 2),
    
    -- Foreign Key Constraints
    FOREIGN KEY (app_id) REFERENCES Dim_Apps(app_id),
    FOREIGN KEY (developer_id) REFERENCES Dim_Developers(developer_id),
    FOREIGN KEY (category_id) REFERENCES Dim_Categories(category_id),
    FOREIGN KEY (maturity_id) REFERENCES Dim_MaturityRatings(maturity_id)
);