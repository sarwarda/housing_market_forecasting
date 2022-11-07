LOAD DATA LOCAL INFILE 'Raw Redfin Data/us_national_market_tracker.tsv000'
INTO TABLE National
FIELDS TERMINATED by '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(period_begin, period_end, period_duration, region_type, region_type_id, table_id, is_seasonally_adjusted,
region, city, state, state_code, property_type, property_type_id, median_sale_price, median_sale_price_mom,
median_sale_price_yoy, median_list_price, median_list_price_mom, median_list_price_yoy, median_ppsf,
median_ppsf_mom, median_ppsf_yoy, median_list_ppsf, median_list_ppsf_mom, median_list_ppsf_yoy, homes_sold,
homes_sold_mom, homes_sold_yoy, pending_sales, pending_sales_mom, pending_sales_yoy, new_listings,
new_listings_mom, new_listings_yoy, inventory, inventory_mom, inventory_yoy, months_of_supply,
months_of_supply_mom, months_of_supply_yoy, median_dom, median_dom_mom, median_dom_yoy, avg_sale_to_list,
avg_sale_to_list_mom, avg_sale_to_list_yoy, sold_above_list, sold_above_list_mom, sold_above_list_yoy,
price_drops, price_drops_mom, price_drops_yoy, off_market_in_two_weeks, off_market_in_two_weeks_mom,
off_market_in_two_weeks_yoy, parent_metro_region, parent_metro_region_metro_code, last_updated);

LOAD DATA LOCAL INFILE 'Raw Redfin Data/state_market_tracker.tsv000'
INTO TABLE State
FIELDS TERMINATED by '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(period_begin, period_end, period_duration, region_type, region_type_id, table_id, is_seasonally_adjusted,
region, city, state, state_code, property_type, property_type_id, median_sale_price, median_sale_price_mom,
median_sale_price_yoy, median_list_price, median_list_price_mom, median_list_price_yoy, median_ppsf,
median_ppsf_mom, median_ppsf_yoy, median_list_ppsf, median_list_ppsf_mom, median_list_ppsf_yoy, homes_sold,
homes_sold_mom, homes_sold_yoy, pending_sales, pending_sales_mom, pending_sales_yoy, new_listings,
new_listings_mom, new_listings_yoy, inventory, inventory_mom, inventory_yoy, months_of_supply,
months_of_supply_mom, months_of_supply_yoy, median_dom, median_dom_mom, median_dom_yoy, avg_sale_to_list,
avg_sale_to_list_mom, avg_sale_to_list_yoy, sold_above_list, sold_above_list_mom, sold_above_list_yoy,
price_drops, price_drops_mom, price_drops_yoy, off_market_in_two_weeks, off_market_in_two_weeks_mom,
off_market_in_two_weeks_yoy, parent_metro_region, parent_metro_region_metro_code, last_updated);

LOAD DATA LOCAL INFILE 'Raw Redfin Data/county_market_tracker.tsv000'
INTO TABLE County
FIELDS TERMINATED by '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(period_begin, period_end, period_duration, region_type, region_type_id, table_id, is_seasonally_adjusted,
region, city, state, state_code, property_type, property_type_id, median_sale_price, median_sale_price_mom,
median_sale_price_yoy, median_list_price, median_list_price_mom, median_list_price_yoy, median_ppsf,
median_ppsf_mom, median_ppsf_yoy, median_list_ppsf, median_list_ppsf_mom, median_list_ppsf_yoy, homes_sold,
homes_sold_mom, homes_sold_yoy, pending_sales, pending_sales_mom, pending_sales_yoy, new_listings,
new_listings_mom, new_listings_yoy, inventory, inventory_mom, inventory_yoy, months_of_supply,
months_of_supply_mom, months_of_supply_yoy, median_dom, median_dom_mom, median_dom_yoy, avg_sale_to_list,
avg_sale_to_list_mom, avg_sale_to_list_yoy, sold_above_list, sold_above_list_mom, sold_above_list_yoy,
price_drops, price_drops_mom, price_drops_yoy, off_market_in_two_weeks, off_market_in_two_weeks_mom,
off_market_in_two_weeks_yoy, parent_metro_region, parent_metro_region_metro_code, last_updated);




/* The following tables are extremely large and take significant amounts of time via Docker,
   so they are not created or used in this project. */

/*

LOAD DATA LOCAL INFILE 'Raw Redfin Data/redfin_metro_market_tracker.tsv000'
INTO TABLE Metro
FIELDS TERMINATED by '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(period_begin, period_end, period_duration, region_type, region_type_id, table_id, is_seasonally_adjusted,
region, city, state, state_code, property_type, property_type_id, median_sale_price, median_sale_price_mom,
median_sale_price_yoy, median_list_price, median_list_price_mom, median_list_price_yoy, median_ppsf,
median_ppsf_mom, median_ppsf_yoy, median_list_ppsf, median_list_ppsf_mom, median_list_ppsf_yoy, homes_sold,
homes_sold_mom, homes_sold_yoy, pending_sales, pending_sales_mom, pending_sales_yoy, new_listings,
new_listings_mom, new_listings_yoy, inventory, inventory_mom, inventory_yoy, months_of_supply,
months_of_supply_mom, months_of_supply_yoy, median_dom, median_dom_mom, median_dom_yoy, avg_sale_to_list,
avg_sale_to_list_mom, avg_sale_to_list_yoy, sold_above_list, sold_above_list_mom, sold_above_list_yoy,
price_drops, price_drops_mom, price_drops_yoy, off_market_in_two_weeks, off_market_in_two_weeks_mom,
off_market_in_two_weeks_yoy, parent_metro_region, parent_metro_region_metro_code, last_updated);


LOAD DATA LOCAL INFILE 'Raw Redfin Data/city_market_tracker.tsv000'
INTO TABLE City
FIELDS TERMINATED by '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(period_begin, period_end, period_duration, region_type, region_type_id, table_id, is_seasonally_adjusted,
region, city, state, state_code, property_type, property_type_id, median_sale_price, median_sale_price_mom,
median_sale_price_yoy, median_list_price, median_list_price_mom, median_list_price_yoy, median_ppsf,
median_ppsf_mom, median_ppsf_yoy, median_list_ppsf, median_list_ppsf_mom, median_list_ppsf_yoy, homes_sold,
homes_sold_mom, homes_sold_yoy, pending_sales, pending_sales_mom, pending_sales_yoy, new_listings,
new_listings_mom, new_listings_yoy, inventory, inventory_mom, inventory_yoy, months_of_supply,
months_of_supply_mom, months_of_supply_yoy, median_dom, median_dom_mom, median_dom_yoy, avg_sale_to_list,
avg_sale_to_list_mom, avg_sale_to_list_yoy, sold_above_list, sold_above_list_mom, sold_above_list_yoy,
price_drops, price_drops_mom, price_drops_yoy, off_market_in_two_weeks, off_market_in_two_weeks_mom,
off_market_in_two_weeks_yoy, parent_metro_region, parent_metro_region_metro_code, last_updated);

LOAD DATA LOCAL INFILE 'Raw Redfin Data/zip_code_market_tracker.tsv000'
INTO TABLE Zipcode
FIELDS TERMINATED by '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(period_begin, period_end, period_duration, region_type, region_type_id, table_id, is_seasonally_adjusted,
region, city, state, state_code, property_type, property_type_id, median_sale_price, median_sale_price_mom,
median_sale_price_yoy, median_list_price, median_list_price_mom, median_list_price_yoy, median_ppsf,
median_ppsf_mom, median_ppsf_yoy, median_list_ppsf, median_list_ppsf_mom, median_list_ppsf_yoy, homes_sold,
homes_sold_mom, homes_sold_yoy, pending_sales, pending_sales_mom, pending_sales_yoy, new_listings,
new_listings_mom, new_listings_yoy, inventory, inventory_mom, inventory_yoy, months_of_supply,
months_of_supply_mom, months_of_supply_yoy, median_dom, median_dom_mom, median_dom_yoy, avg_sale_to_list,
avg_sale_to_list_mom, avg_sale_to_list_yoy, sold_above_list, sold_above_list_mom, sold_above_list_yoy,
price_drops, price_drops_mom, price_drops_yoy, off_market_in_two_weeks, off_market_in_two_weeks_mom,
off_market_in_two_weeks_yoy, parent_metro_region, parent_metro_region_metro_code, last_updated);

LOAD DATA LOCAL INFILE 'Raw Redfin Data/neighborhood_market_tracker.tsv000'
INTO TABLE Neighborhood
FIELDS TERMINATED by '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(period_begin, period_end, period_duration, region_type, region_type_id, table_id, is_seasonally_adjusted,
region, city, state, state_code, property_type, property_type_id, median_sale_price, median_sale_price_mom,
median_sale_price_yoy, median_list_price, median_list_price_mom, median_list_price_yoy, median_ppsf,
median_ppsf_mom, median_ppsf_yoy, median_list_ppsf, median_list_ppsf_mom, median_list_ppsf_yoy, homes_sold,
homes_sold_mom, homes_sold_yoy, pending_sales, pending_sales_mom, pending_sales_yoy, new_listings,
new_listings_mom, new_listings_yoy, inventory, inventory_mom, inventory_yoy, months_of_supply,
months_of_supply_mom, months_of_supply_yoy, median_dom, median_dom_mom, median_dom_yoy, avg_sale_to_list,
avg_sale_to_list_mom, avg_sale_to_list_yoy, sold_above_list, sold_above_list_mom, sold_above_list_yoy,
price_drops, price_drops_mom, price_drops_yoy, off_market_in_two_weeks, off_market_in_two_weeks_mom,
off_market_in_two_weeks_yoy, parent_metro_region, parent_metro_region_metro_code, last_updated);

*/