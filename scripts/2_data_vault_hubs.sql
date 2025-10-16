CREATE SCHEMA IF NOT EXISTS student3;

-- Hubs
CREATE TABLE student3.hub_ship_mode (
    ship_mode_key VARCHAR(32) PRIMARY KEY NOT NULL,
    ship_mode_name VARCHAR(50) NOT NULL,
    load_dts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    rec_src VARCHAR(30) NOT NULL
) DISTRIBUTED BY (ship_mode_key);

CREATE TABLE student3.hub_segment (
    segment_key VARCHAR(32) PRIMARY KEY NOT NULL,
    segment_name VARCHAR(50) NOT NULL,
    load_dts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    rec_src VARCHAR(30) NOT NULL
) DISTRIBUTED BY (segment_key);

CREATE TABLE student3.hub_country (
    country_key VARCHAR(32) PRIMARY KEY NOT NULL,
    country_name VARCHAR(100) NOT NULL,
    load_dts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    rec_src VARCHAR(30) NOT NULL
) DISTRIBUTED BY (country_key);

CREATE TABLE student3.hub_location (
    location_key VARCHAR(32) PRIMARY KEY NOT NULL,
    location_name VARCHAR(150) NOT NULL,
    load_dts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    rec_src VARCHAR(30) NOT NULL
) DISTRIBUTED BY (location_key);

CREATE TABLE student3.hub_region (
    region_key VARCHAR(32) PRIMARY KEY NOT NULL,
    region_name VARCHAR(20) NOT NULL,
    load_dts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    rec_src VARCHAR(30) NOT NULL
) DISTRIBUTED BY (region_key);

CREATE TABLE student3.hub_category (
    category_key VARCHAR(32) PRIMARY KEY NOT NULL,
    category_name VARCHAR(50) NOT NULL,
    load_dts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    rec_src VARCHAR(30) NOT NULL
) DISTRIBUTED BY (category_key);

CREATE TABLE student3.hub_sub_category (
    sub_category_key VARCHAR(32) PRIMARY KEY NOT NULL,
    sub_category_name VARCHAR(50) NOT NULL,
    load_dts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    rec_src VARCHAR(30) NOT NULL
) DISTRIBUTED BY (sub_category_key);
