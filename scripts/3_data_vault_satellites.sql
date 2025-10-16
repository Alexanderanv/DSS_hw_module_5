-- Satellites
CREATE TABLE student3.sat_locations (
    location_key VARCHAR(32) NOT NULL,
    load_dts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    hash_diff VARCHAR(32) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50),
    postal_code VARCHAR(12),
    rec_src VARCHAR(30) NOT NULL,
    PRIMARY KEY (location_key, load_dts),
    CONSTRAINT fk_sat_locations FOREIGN KEY (location_key) 
        REFERENCES student3.hub_location(location_key)
) DISTRIBUTED BY (location_key);

CREATE TABLE student3.sat_sales (
    lnk_key VARCHAR(32) NOT NULL,
    load_dts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    hash_diff VARCHAR(32) NOT NULL,
    sales DECIMAL(12,4),
    quantity INTEGER,
    discount DECIMAL(4,2),
    profit DECIMAL(12,4),
    rec_src VARCHAR(30) NOT NULL,
    PRIMARY KEY (lnk_key, load_dts)
) DISTRIBUTED BY (lnk_key);
