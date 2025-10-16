-- Links
CREATE TABLE student3.lnk_location_country (
    lnk_key VARCHAR(32) PRIMARY KEY NOT NULL,
    location_key VARCHAR(32) NOT NULL,
    country_key VARCHAR(32) NOT NULL,
    load_dts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    rec_src VARCHAR(30) NOT NULL,
    CONSTRAINT fk_lnk_loc_country_location FOREIGN KEY (location_key) 
        REFERENCES student3.hub_location(location_key),
    CONSTRAINT fk_lnk_loc_country_country FOREIGN KEY (country_key) 
        REFERENCES student3.hub_country(country_key)
) DISTRIBUTED BY (lnk_key);

CREATE TABLE student3.lnk_location_region (
    lnk_key VARCHAR(32) PRIMARY KEY NOT NULL,
    location_key VARCHAR(32) NOT NULL,
    region_key VARCHAR(32) NOT NULL,
    load_dts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    rec_src VARCHAR(30) NOT NULL,
    CONSTRAINT fk_lnk_loc_region_location FOREIGN KEY (location_key) 
        REFERENCES student3.hub_location(location_key),
    CONSTRAINT fk_lnk_loc_region_region FOREIGN KEY (region_key) 
        REFERENCES student3.hub_region(region_key)
) DISTRIBUTED BY (lnk_key);

CREATE TABLE student3.lnk_sub_category_category (
    lnk_key VARCHAR(32) PRIMARY KEY NOT NULL,
    sub_category_key VARCHAR(32) NOT NULL,
    category_key VARCHAR(32) NOT NULL,
    load_dts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    rec_src VARCHAR(30) NOT NULL,
    CONSTRAINT fk_lnk_sub_cat_category FOREIGN KEY (category_key) 
        REFERENCES student3.hub_category(category_key),
    CONSTRAINT fk_lnk_sub_cat_sub_category FOREIGN KEY (sub_category_key) 
        REFERENCES student3.hub_sub_category(sub_category_key)
) DISTRIBUTED BY (lnk_key);

CREATE TABLE student3.lnk_sales (
    lnk_key VARCHAR(32) PRIMARY KEY NOT NULL,
    hub_location_key VARCHAR(32) NOT NULL,
    hub_ship_mode_key VARCHAR(32) NOT NULL,
    hub_segment_key VARCHAR(32) NOT NULL,
    hub_sub_category_key VARCHAR(32) NOT NULL,
    load_dts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    rec_src VARCHAR(30) NOT NULL,
    CONSTRAINT fk_lnk_sales_location FOREIGN KEY (hub_location_key) 
        REFERENCES student3.hub_location(location_key),
    CONSTRAINT fk_lnk_sales_ship_mode FOREIGN KEY (hub_ship_mode_key) 
        REFERENCES student3.hub_ship_mode(ship_mode_key),
    CONSTRAINT fk_lnk_sales_segment FOREIGN KEY (hub_segment_key) 
        REFERENCES student3.hub_segment(segment_key),
    CONSTRAINT fk_lnk_sales_sub_category FOREIGN KEY (hub_sub_category_key) 
        REFERENCES student3.hub_sub_category(sub_category_key)
) DISTRIBUTED BY (lnk_key);
