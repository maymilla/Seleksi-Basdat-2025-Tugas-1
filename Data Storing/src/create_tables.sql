CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE MaturityRatings (
    maturity_id SERIAL PRIMARY KEY,
    maturity_level VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Developers (
    developer_id SERIAL PRIMARY KEY,
    developer_name VARCHAR(255) NOT NULL UNIQUE,
    active_year INT,
    active_month INT,
    source_url TEXT
);

CREATE TABLE DeveloperStats (
    stat_id SERIAL PRIMARY KEY,
    developer_id INT NOT NULL,
    app_count INT,
    total_downloads BIGINT,
    average_rating REAL,
    total_rating_count BIGINT,

    FOREIGN KEY (developer_id) REFERENCES Developers(developer_id) ON DELETE CASCADE
);

CREATE TABLE Apps (
    app_id SERIAL PRIMARY KEY,
    app_name VARCHAR(255) NOT NULL,
    category_id INT,
    developer_id INT,
    maturity_id INT,
    price_numeric NUMERIC(10, 2),
    apk_size_mb REAL,
    source_url TEXT UNIQUE,

    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (developer_id) REFERENCES Developers(developer_id),
    FOREIGN KEY (maturity_id) REFERENCES MaturityRatings(maturity_id)
);

CREATE TABLE Rankings (
    ranking_id SERIAL PRIMARY KEY,
    app_id INT NOT NULL,
    rank INT,
    rating REAL,
    total_installs BIGINT,
    recent_installs BIGINT,

    FOREIGN KEY (app_id) REFERENCES Apps(app_id) ON DELETE CASCADE
);