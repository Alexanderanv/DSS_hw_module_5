-- Data load into hubs
INSERT INTO student3.hub_ship_mode (ship_mode_key, ship_mode_name, load_dts, rec_src)
SELECT md5(ship_mode), ship_mode, CURRENT_TIMESTAMP, 'SampleSuperstore.csv'
FROM student3.superstore
GROUP BY ship_mode;

INSERT INTO student3.hub_segment (segment_key, segment_name, load_dts, rec_src)
SELECT md5(segment), segment, CURRENT_TIMESTAMP, 'SampleSuperstore.csv'
FROM student3.superstore
GROUP BY segment;

INSERT INTO student3.hub_country (country_key, country_name, load_dts, rec_src)
SELECT md5(country), country, CURRENT_TIMESTAMP, 'SampleSuperstore.csv'
FROM student3.superstore
GROUP BY country;

INSERT INTO student3.hub_location (location_key, location_name, load_dts, rec_src)
SELECT md5(city || ', ' || state || ', ' || postal_code), city || ', ' || state || ', ' || postal_code, CURRENT_TIMESTAMP, 'SampleSuperstore.csv'
FROM student3.superstore
GROUP BY city, state, postal_code;

INSERT INTO student3.hub_region (region_key, region_name, load_dts, rec_src)
SELECT md5(region), region, CURRENT_TIMESTAMP, 'SampleSuperstore.csv'
FROM student3.superstore
GROUP BY region;

INSERT INTO student3.hub_category (category_key, category_name, load_dts, rec_src)
SELECT md5(category), category, CURRENT_TIMESTAMP, 'SampleSuperstore.csv'
FROM student3.superstore
GROUP BY category;

INSERT INTO student3.hub_sub_category (sub_category_key, sub_category_name, load_dts, rec_src)
SELECT md5(sub_category), sub_category, CURRENT_TIMESTAMP, 'SampleSuperstore.csv'
FROM student3.superstore
GROUP BY sub_category;

-- Data load into links
INSERT INTO student3.lnk_location_country (lnk_key, location_key, country_key, load_dts, rec_src)
SELECT md5(location_key || country_key), location_key, country_key, CURRENT_TIMESTAMP, 'SampleSuperstore.csv'
FROM (
    SELECT DISTINCT md5(city || state || postal_code) AS location_key, md5(country) AS country_key
    FROM student3.superstore
) t;

INSERT INTO student3.lnk_location_region (lnk_key, location_key, region_key, load_dts, rec_src)
SELECT md5(location_key || region_key), location_key, region_key, CURRENT_TIMESTAMP, 'SampleSuperstore.csv'
FROM (
    SELECT DISTINCT md5(city || state || postal_code) AS location_key, md5(region) AS region_key
    FROM student3.superstore
) t;

INSERT INTO student3.lnk_sub_category_category (lnk_key, sub_category_key, category_key, load_dts, rec_src)
SELECT md5(sub_category_key || category_key), sub_category_key, category_key, CURRENT_TIMESTAMP, 'SampleSuperstore.csv'
FROM (
    SELECT DISTINCT md5(sub_category) AS sub_category_key, md5(category) AS category_key
    FROM student3.superstore
) t;

INSERT INTO student3.lnk_sales (
        lnk_key, hub_location_key, hub_ship_mode_key, hub_segment_key, hub_sub_category_key, load_dts, rec_src
)
SELECT md5(location_key || ship_mode_key || segment_key || sub_category_key), location_key, ship_mode_key, segment_key, sub_category_key, CURRENT_TIMESTAMP, 'SampleSuperstore.csv'
FROM (
    SELECT DISTINCT
        md5(city || state || postal_code) AS location_key,
        md5(ship_mode) AS ship_mode_key,
        md5(segment) AS segment_key,
        md5(sub_category) AS sub_category_key
    FROM student3.superstore
) t;

-- Data load into satellites
INSERT INTO student3.sat_locations (
    location_key, load_dts, hash_diff, city, state, postal_code, rec_src
)
SELECT DISTINCT
    md5(city || ', ' || state || ', ' || postal_code),
    CURRENT_TIMESTAMP,
    md5(city || state || postal_code)
    city, state, postal_code, 'SampleSuperstore.csv'
FROM student3.superstore;

INSERT INTO student3.sat_sales (
    lnk_key, load_dts, hash_diff, sales, quantity, discount, profit, rec_src
)
SELECT
    md5(md5(city || ', ' || state || ', ' || postal_code) || md5(ship_mode) || md5(segment) || md5(sub_category)),
    CURRENT_TIMESTAMP,
    md5(COALESCE(SUM(sales)::text,'') || COALESCE(SUM(quantity)::text,'') || COALESCE(SUM(discount)::text,'') || COALESCE(SUM(profit)::text,'')),
    SUM(sales), SUM(quantity), SUM(discount), SUM(profit), 'SampleSuperstore.csv'
FROM student3.superstore
GROUP BY
    md5(md5(city || ', ' || state || ', ' || postal_code) || md5(ship_mode) || md5(segment) || md5(sub_category));
