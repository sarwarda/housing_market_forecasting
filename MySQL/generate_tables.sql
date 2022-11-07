DROP TABLE if exists National;

CREATE TABLE National (
    id INTEGER AUTO_INCREMENT,
    period_begin DATE,
    period_end DATE,
    period_duration INTEGER,
    region_type VARCHAR(255),
    region_type_id INTEGER,
    table_id INTEGER,
    is_seasonally_adjusted VARCHAR(1),
    region VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    state_code VARCHAR(255),
    property_type VARCHAR(255),
    property_type_id INTEGER,
    median_sale_price FLOAT,
    median_sale_price_mom FLOAT,
    median_sale_price_yoy FLOAT,
    median_list_price FLOAT,
    median_list_price_mom FLOAT,
    median_list_price_yoy FLOAT,
    median_ppsf FLOAT,
    median_ppsf_mom	FLOAT,
    median_ppsf_yoy	FLOAT,
    median_list_ppsf FLOAT,
    median_list_ppsf_mom FLOAT,
    median_list_ppsf_yoy FLOAT,
    homes_sold FLOAT,
    homes_sold_mom FLOAT,
    homes_sold_yoy FLOAT,
    pending_sales FLOAT,
    pending_sales_mom FLOAT,
    pending_sales_yoy FLOAT,
    new_listings FLOAT,
    new_listings_mom FLOAT,
    new_listings_yoy FLOAT,
    inventory INTEGER,
    inventory_mom FLOAT,
    inventory_yoy FLOAT,
    months_of_supply FLOAT,
    months_of_supply_mom FLOAT,
    months_of_supply_yoy FLOAT,
    median_dom FLOAT,
    median_dom_mom FLOAT,
    median_dom_yoy FLOAT,
    avg_sale_to_list FLOAT,
    avg_sale_to_list_mom FLOAT,
    avg_sale_to_list_yoy FLOAT,
    sold_above_list FLOAT,
    sold_above_list_mom	FLOAT,
    sold_above_list_yoy	FLOAT,
    price_drops	FLOAT,
    price_drops_mom	FLOAT,
    price_drops_yoy	FLOAT,
    off_market_in_two_weeks	FLOAT,
    off_market_in_two_weeks_mom	FLOAT,
    off_market_in_two_weeks_yoy	FLOAT,
    parent_metro_region	FLOAT,
    parent_metro_region_metro_code FLOAT,
    last_updated DATE,
    PRIMARY KEY (id)
);

DROP TABLE if exists State;

CREATE TABLE State (
    id INTEGER AUTO_INCREMENT,
    period_begin DATE,
    period_end DATE,
    period_duration INTEGER,
    region_type VARCHAR(255),
    region_type_id INTEGER,
    table_id INTEGER,
    is_seasonally_adjusted VARCHAR(1),
    region VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    state_code VARCHAR(255),
    property_type VARCHAR(255),
    property_type_id INTEGER,
    median_sale_price FLOAT,
    median_sale_price_mom FLOAT,
    median_sale_price_yoy FLOAT,
    median_list_price FLOAT,
    median_list_price_mom FLOAT,
    median_list_price_yoy FLOAT,
    median_ppsf FLOAT,
    median_ppsf_mom	FLOAT,
    median_ppsf_yoy	FLOAT,
    median_list_ppsf FLOAT,
    median_list_ppsf_mom FLOAT,
    median_list_ppsf_yoy FLOAT,
    homes_sold FLOAT,
    homes_sold_mom FLOAT,
    homes_sold_yoy FLOAT,
    pending_sales FLOAT,
    pending_sales_mom FLOAT,
    pending_sales_yoy FLOAT,
    new_listings FLOAT,
    new_listings_mom FLOAT,
    new_listings_yoy FLOAT,
    inventory INTEGER,
    inventory_mom FLOAT,
    inventory_yoy FLOAT,
    months_of_supply FLOAT,
    months_of_supply_mom FLOAT,
    months_of_supply_yoy FLOAT,
    median_dom FLOAT,
    median_dom_mom FLOAT,
    median_dom_yoy FLOAT,
    avg_sale_to_list FLOAT,
    avg_sale_to_list_mom FLOAT,
    avg_sale_to_list_yoy FLOAT,
    sold_above_list FLOAT,
    sold_above_list_mom	FLOAT,
    sold_above_list_yoy	FLOAT,
    price_drops	FLOAT,
    price_drops_mom	FLOAT,
    price_drops_yoy	FLOAT,
    off_market_in_two_weeks	FLOAT,
    off_market_in_two_weeks_mom	FLOAT,
    off_market_in_two_weeks_yoy	FLOAT,
    parent_metro_region	FLOAT,
    parent_metro_region_metro_code FLOAT,
    last_updated DATE,
    PRIMARY KEY (id)
);

DROP TABLE if exists County;

CREATE TABLE County (
    id INTEGER AUTO_INCREMENT,
    period_begin DATE,
    period_end DATE,
    period_duration INTEGER,
    region_type VARCHAR(255),
    region_type_id INTEGER,
    table_id INTEGER,
    is_seasonally_adjusted VARCHAR(1),
    region VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    state_code VARCHAR(255),
    property_type VARCHAR(255),
    property_type_id INTEGER,
    median_sale_price FLOAT,
    median_sale_price_mom FLOAT,
    median_sale_price_yoy FLOAT,
    median_list_price FLOAT,
    median_list_price_mom FLOAT,
    median_list_price_yoy FLOAT,
    median_ppsf FLOAT,
    median_ppsf_mom	FLOAT,
    median_ppsf_yoy	FLOAT,
    median_list_ppsf FLOAT,
    median_list_ppsf_mom FLOAT,
    median_list_ppsf_yoy FLOAT,
    homes_sold FLOAT,
    homes_sold_mom FLOAT,
    homes_sold_yoy FLOAT,
    pending_sales FLOAT,
    pending_sales_mom FLOAT,
    pending_sales_yoy FLOAT,
    new_listings FLOAT,
    new_listings_mom FLOAT,
    new_listings_yoy FLOAT,
    inventory INTEGER,
    inventory_mom FLOAT,
    inventory_yoy FLOAT,
    months_of_supply FLOAT,
    months_of_supply_mom FLOAT,
    months_of_supply_yoy FLOAT,
    median_dom FLOAT,
    median_dom_mom FLOAT,
    median_dom_yoy FLOAT,
    avg_sale_to_list FLOAT,
    avg_sale_to_list_mom FLOAT,
    avg_sale_to_list_yoy FLOAT,
    sold_above_list FLOAT,
    sold_above_list_mom	FLOAT,
    sold_above_list_yoy	FLOAT,
    price_drops	FLOAT,
    price_drops_mom	FLOAT,
    price_drops_yoy	FLOAT,
    off_market_in_two_weeks	FLOAT,
    off_market_in_two_weeks_mom	FLOAT,
    off_market_in_two_weeks_yoy	FLOAT,
    parent_metro_region	FLOAT,
    parent_metro_region_metro_code FLOAT,
    last_updated DATE,
    PRIMARY KEY (id)
);

/* The following tables are extremely large and take significant amounts of time via Docker,
   so they are not created or used in this project. */

/*

CREATE TABLE Metro (
    metro_id INTEGER AUTO_INCREMENT,
    state_index INTEGER,
    period_begin DATE,
    period_end DATE,
    period_duration INTEGER,
    region_type VARCHAR(255),
    region_type_id INTEGER,
    table_id INTEGER,
    is_seasonally_adjusted VARCHAR(1),
    region VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    state_code VARCHAR(255),
    property_type VARCHAR(255),
    property_type_id INTEGER,
    median_sale_price FLOAT,
    median_sale_price_mom FLOAT,
    median_sale_price_yoy FLOAT,
    median_list_price FLOAT,
    median_list_price_mom FLOAT,
    median_list_price_yoy FLOAT,
    median_ppsf FLOAT,
    median_ppsf_mom	FLOAT,
    median_ppsf_yoy	FLOAT,
    median_list_ppsf FLOAT,
    median_list_ppsf_mom FLOAT,
    median_list_ppsf_yoy FLOAT,
    homes_sold FLOAT,
    homes_sold_mom FLOAT,
    homes_sold_yoy FLOAT,
    pending_sales FLOAT,
    pending_sales_mom FLOAT,
    pending_sales_yoy FLOAT,
    new_listings FLOAT,
    new_listings_mom FLOAT,
    new_listings_yoy FLOAT,
    inventory INTEGER,
    inventory_mom FLOAT,
    inventory_yoy FLOAT,
    months_of_supply FLOAT,
    months_of_supply_mom FLOAT,
    months_of_supply_yoy FLOAT,
    median_dom FLOAT,
    median_dom_mom FLOAT,
    median_dom_yoy FLOAT,
    avg_sale_to_list FLOAT,
    avg_sale_to_list_mom FLOAT,
    avg_sale_to_list_yoy FLOAT,
    sold_above_list FLOAT,
    sold_above_list_mom	FLOAT,
    sold_above_list_yoy	FLOAT,
    price_drops	FLOAT,
    price_drops_mom	FLOAT,
    price_drops_yoy	FLOAT,
    off_market_in_two_weeks	FLOAT,
    off_market_in_two_weeks_mom	FLOAT,
    off_market_in_two_weeks_yoy	FLOAT,
    parent_metro_region	FLOAT,
    parent_metro_region_metro_code FLOAT,
    last_updated DATE,
    PRIMARY KEY (metro_id)
);

CREATE TABLE City (
    city_id INTEGER AUTO_INCREMENT,
    period_begin DATE,
    period_end DATE,
    period_duration INTEGER,
    region_type VARCHAR(255),
    region_type_id INTEGER,
    table_id INTEGER,
    is_seasonally_adjusted VARCHAR(1),
    region VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    state_code VARCHAR(255),
    property_type VARCHAR(255),
    property_type_id INTEGER,
    median_sale_price FLOAT,
    median_sale_price_mom FLOAT,
    median_sale_price_yoy FLOAT,
    median_list_price FLOAT,
    median_list_price_mom FLOAT,
    median_list_price_yoy FLOAT,
    median_ppsf FLOAT,
    median_ppsf_mom	FLOAT,
    median_ppsf_yoy	FLOAT,
    median_list_ppsf FLOAT,
    median_list_ppsf_mom FLOAT,
    median_list_ppsf_yoy FLOAT,
    homes_sold FLOAT,
    homes_sold_mom FLOAT,
    homes_sold_yoy FLOAT,
    pending_sales FLOAT,
    pending_sales_mom FLOAT,
    pending_sales_yoy FLOAT,
    new_listings FLOAT,
    new_listings_mom FLOAT,
    new_listings_yoy FLOAT,
    inventory INTEGER,
    inventory_mom FLOAT,
    inventory_yoy FLOAT,
    months_of_supply FLOAT,
    months_of_supply_mom FLOAT,
    months_of_supply_yoy FLOAT,
    median_dom FLOAT,
    median_dom_mom FLOAT,
    median_dom_yoy FLOAT,
    avg_sale_to_list FLOAT,
    avg_sale_to_list_mom FLOAT,
    avg_sale_to_list_yoy FLOAT,
    sold_above_list FLOAT,
    sold_above_list_mom	FLOAT,
    sold_above_list_yoy	FLOAT,
    price_drops	FLOAT,
    price_drops_mom	FLOAT,
    price_drops_yoy	FLOAT,
    off_market_in_two_weeks	FLOAT,
    off_market_in_two_weeks_mom	FLOAT,
    off_market_in_two_weeks_yoy	FLOAT,
    parent_metro_region	FLOAT,
    parent_metro_region_metro_code FLOAT,
    last_updated DATE,
    PRIMARY KEY (city_id)
);

CREATE TABLE Neighborhood (
    neighborhood_id INTEGER AUTO_INCREMENT,
    period_begin DATE,
    period_end DATE,
    period_duration INTEGER,
    region_type VARCHAR(255),
    region_type_id INTEGER,
    table_id INTEGER,
    is_seasonally_adjusted VARCHAR(1),
    region VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    state_code VARCHAR(255),
    property_type VARCHAR(255),
    property_type_id INTEGER,
    median_sale_price FLOAT,
    median_sale_price_mom FLOAT,
    median_sale_price_yoy FLOAT,
    median_list_price FLOAT,
    median_list_price_mom FLOAT,
    median_list_price_yoy FLOAT,
    median_ppsf FLOAT,
    median_ppsf_mom	FLOAT,
    median_ppsf_yoy	FLOAT,
    median_list_ppsf FLOAT,
    median_list_ppsf_mom FLOAT,
    median_list_ppsf_yoy FLOAT,
    homes_sold FLOAT,
    homes_sold_mom FLOAT,
    homes_sold_yoy FLOAT,
    pending_sales FLOAT,
    pending_sales_mom FLOAT,
    pending_sales_yoy FLOAT,
    new_listings FLOAT,
    new_listings_mom FLOAT,
    new_listings_yoy FLOAT,
    inventory INTEGER,
    inventory_mom FLOAT,
    inventory_yoy FLOAT,
    months_of_supply FLOAT,
    months_of_supply_mom FLOAT,
    months_of_supply_yoy FLOAT,
    median_dom FLOAT,
    median_dom_mom FLOAT,
    median_dom_yoy FLOAT,
    avg_sale_to_list FLOAT,
    avg_sale_to_list_mom FLOAT,
    avg_sale_to_list_yoy FLOAT,
    sold_above_list FLOAT,
    sold_above_list_mom	FLOAT,
    sold_above_list_yoy	FLOAT,
    price_drops	FLOAT,
    price_drops_mom	FLOAT,
    price_drops_yoy	FLOAT,
    off_market_in_two_weeks	FLOAT,
    off_market_in_two_weeks_mom	FLOAT,
    off_market_in_two_weeks_yoy	FLOAT,
    parent_metro_region	FLOAT,
    parent_metro_region_metro_code FLOAT,
    last_updated DATE,
    PRIMARY KEY (neighborhood_id)
);

CREATE TABLE Zipcode (
    zip_id INTEGER AUTO_INCREMENT,
    period_begin DATE,
    period_end DATE,
    period_duration INTEGER,
    region_type VARCHAR(255),
    region_type_id INTEGER,
    table_id INTEGER,
    is_seasonally_adjusted VARCHAR(1),
    region VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    state_code VARCHAR(255),
    property_type VARCHAR(255),
    property_type_id INTEGER,
    median_sale_price FLOAT,
    median_sale_price_mom FLOAT,
    median_sale_price_yoy FLOAT,
    median_list_price FLOAT,
    median_list_price_mom FLOAT,
    median_list_price_yoy FLOAT,
    median_ppsf FLOAT,
    median_ppsf_mom	FLOAT,
    median_ppsf_yoy	FLOAT,
    median_list_ppsf FLOAT,
    median_list_ppsf_mom FLOAT,
    median_list_ppsf_yoy FLOAT,
    homes_sold FLOAT,
    homes_sold_mom FLOAT,
    homes_sold_yoy FLOAT,
    pending_sales FLOAT,
    pending_sales_mom FLOAT,
    pending_sales_yoy FLOAT,
    new_listings FLOAT,
    new_listings_mom FLOAT,
    new_listings_yoy FLOAT,
    inventory INTEGER,
    inventory_mom FLOAT,
    inventory_yoy FLOAT,
    months_of_supply FLOAT,
    months_of_supply_mom FLOAT,
    months_of_supply_yoy FLOAT,
    median_dom FLOAT,
    median_dom_mom FLOAT,
    median_dom_yoy FLOAT,
    avg_sale_to_list FLOAT,
    avg_sale_to_list_mom FLOAT,
    avg_sale_to_list_yoy FLOAT,
    sold_above_list FLOAT,
    sold_above_list_mom	FLOAT,
    sold_above_list_yoy	FLOAT,
    price_drops	FLOAT,
    price_drops_mom	FLOAT,
    price_drops_yoy	FLOAT,
    off_market_in_two_weeks	FLOAT,
    off_market_in_two_weeks_mom	FLOAT,
    off_market_in_two_weeks_yoy	FLOAT,
    parent_metro_region	FLOAT,
    parent_metro_region_metro_code FLOAT,
    last_updated DATE,
    PRIMARY KEY (zip_id)
);
*/

DROP TABLE if exists Query_results;

CREATE TABLE Query_results (
query_id INTEGER AUTO_INCREMENT,
table_id VARCHAR(255),
query VARCHAR(255),
result VARCHAR(255),
result_alternative varchar(255),
comments VARCHAR(255),
PRIMARY KEY (query_id)
);