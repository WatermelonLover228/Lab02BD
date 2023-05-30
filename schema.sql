CREATE TABLE region (
    region_code INTEGER PRIMARY KEY,
    region_name VARCHAR(50) NOT NULL
);

CREATE TABLE country (
    country_code INTEGER PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL,
    region_code INTEGER REFERENCES region(region_code) ON DELETE CASCADE,
    country_number INTEGER UNIQUE
);

CREATE TABLE city (
    city_code INTEGER PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL,
    country_code INTEGER REFERENCES country(country_code) ON DELETE CASCADE,
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL,
    data_file VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE measurement (
    measurement_code SERIAL PRIMARY KEY,
    temperature FLOAT NOT NULL,
    city_code INTEGER REFERENCES city(city_code) ON DELETE CASCADE,
    measurement_time TIMESTAMP NOT NULL
);

CREATE TABLE coastline (
    line_number INTEGER NOT NULL,
    point_number INTEGER NOT NULL,
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL,
    PRIMARY KEY(line_number, point_number)
);
