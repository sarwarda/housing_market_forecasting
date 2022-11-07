/*
To familiarize ourselves with the data, queries against the database can be generated.

We will answer the following questions and store the results in a table:

State with the highest median home sale overall?
State with the highest median home sale in 2022?
State with the lowest median home sale overall?
State with the lowest median home sale in 2022?
State with the greatest inventory overall?
State with the greatest inventory in 2022?
State with the lowest inventory overall?
State with the lowest inventory in 2022?
State with the greatest median price per square foot overall?
State with the greatest median price per square foot in 2022?
State with the lowest median price per square foot overall?
State with the lowest median price per square foot in 2022?
State with the greatest number of homes sold overall?
State with the greatest number of homes sold in 2022?
State with the lowest number of homes sold overall?
State with the lowest number of homes sold in 2022?
State with the greatest number of days on the market overall?
State with the greatest number of days on the market in 2022?
State with the least number of days on the market overall?
State with the least number of days on the market in 2022?
State with the greatest percent of homes that sold above list price overall?
State with the greatest percent of homes that sold above list price in 2022?
State with the lowest percent of homes that sold above list price overall?
State with the lowest percent of homes that sold above list price in 2022?

County with the highest median home sale overall?
County with the highest median home sale in 2022?
County with the lowest median home sale overall?
County with the lowest median home sale in 2022?
County with the greatest inventory overall?
County with the greatest inventory in 2022?
County with the lowest inventory overall?
County with the lowest inventory in 2022?
County with the greatest median price per square foot overall?
County with the greatest median price per square foot in 2022?
County with the lowest median price per square foot overall?
County with the lowest median price per square foot in 2022?
County with the greatest number of homes sold overall?
County with the greatest number of homes sold in 2022?
County with the lowest number of homes sold overall?
County with the lowest number of homes sold in 2022?
County with the greatest number of days on the market overall?
County with the greatest number of days on the market in 2022?
County with the least number of days on the market overall?
County with the least number of days on the market in 2022?
County with the greatest percent of homes that sold above list price overall?
County with the greatest percent of homes that sold above list price in 2022?

Year with the highest median home sale nationally overall?
Year with the lowest median home sale nationally overall?
Year with the greatest inventory nationally overall?
Year with the lowest inventory nationally overall?
Year with the greatest median price per square foot nationally overall?
Year with the lowest median price per square foot nationally overall?
Year with the greatest number of homes sold nationally overall?
Year with the lowest number of homes sold nationally overall?
Year with the greatest number of days on the market nationally overall?
Year with the least number of days on the market nationally overall?
Year with the greatest percent of homes that sold above list price nationally overall?
Year with the lowest percent of homes that sold above list price nationally overall?
*/

/* -------------------------------------------------------------------------------------------------------------------*/
/* STATE QUERIES */

INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the highest median home sale overall',
        'State',
        'Result uses average median sales overall and finds the max average,
                   result alternative uses the max median without any averaging');


/* Using average median sale prices: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_medians.state, ', ', average_medians.avg_med_home_sale) AS result1
                FROM (SELECT state, AVG(median_sale_price) AS avg_med_home_sale
                      FROM State
                      GROUP BY state
                      ORDER BY avg_med_home_sale DESC) AS average_medians
                LIMIT 1)
WHERE query = 'State with the highest median home sale overall';

/* Using max median sale price, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(max_medians.state, ', ', max_medians.max_med_home_sale) AS result2
                            FROM (SELECT state, MAX(median_sale_price) AS max_med_home_sale
                                  FROM State
                                  GROUP BY state
                                  ORDER BY max_med_home_sale DESC) AS max_medians
                            LIMIT 1)
WHERE query = 'State with the highest median home sale overall';


/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the highest median home sale in 2022',
        'State',
        'Result uses average median sales overall and finds the max average,
                  result alternative uses the max median without any averaging');

/* Using average median sale prices: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_medians.state, ', ', average_medians.avg_med_home_sale) AS result1
                FROM (SELECT state, AVG(median_sale_price) AS avg_med_home_sale
                      FROM State
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY state
                      ORDER BY avg_med_home_sale DESC) AS average_medians
                LIMIT 1)
WHERE query = 'State with the highest median home sale in 2022';

/* Using max median sale price, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(max_medians.state, ', ', max_medians.max_med_home_sale) AS result2
                            FROM (SELECT state, MAX(median_sale_price) AS max_med_home_sale
                                  FROM State
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY state
                                  ORDER BY max_med_home_sale DESC) AS max_medians
                            LIMIT 1)
WHERE query = 'State with the highest median home sale in 2022';


/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the lowest median home sale overall',
        'State',
        'Result uses average median sales overall and finds the min average,
                  result alternative uses the min median without any averaging');

/* Using average median sale prices: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_medians.state, ', ', average_medians.avg_med_home_sale) AS result1
                FROM (SELECT state, AVG(median_sale_price) AS avg_med_home_sale
                      FROM State
                      GROUP BY state
                      ORDER BY avg_med_home_sale ASC) AS average_medians
                LIMIT 1)
WHERE query = 'State with the lowest median home sale overall';

/* Using max median sale price, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(min_medians.state, ', ', min_medians.min_med_home_sale) AS result2
                            FROM (SELECT state, MAX(median_sale_price) AS min_med_home_sale
                                  FROM State
                                  GROUP BY state
                                  ORDER BY min_med_home_sale ASC) AS min_medians
                            LIMIT 1)
WHERE query = 'State with the lowest median home sale overall';


/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the lowest median home sale in 2022',
        'State',
        'Result uses average median sales overall and finds the min average,
                  result alternative uses the min median without any averaging');

/* Using average median sale prices: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_medians.state, ', ', average_medians.avg_med_home_sale) AS result1
                FROM (SELECT state, AVG(median_sale_price) AS avg_med_home_sale
                      FROM State
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY state
                      ORDER BY avg_med_home_sale ASC) AS average_medians
                LIMIT 1)
WHERE query = 'State with the lowest median home sale in 2022';

/* Using max median sale price, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(min_medians.state, ', ', min_medians.min_med_home_sale) AS result2
                            FROM (SELECT state, MAX(median_sale_price) AS min_med_home_sale
                                  FROM State
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY state
                                  ORDER BY min_med_home_sale ASC) AS min_medians
                            LIMIT 1)
WHERE query = 'State with the lowest median home sale in 2022';


/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the greatest inventory overall',
        'State',
        'Result uses average inventory overall for each state and finds the max average,
                   result alternative uses the max overall without any averaging');


/* Using average inventory: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(state_avg_inv.state, ', ', state_avg_inv.avg_inv) AS result1
                FROM (SELECT state, AVG(inventory) AS avg_inv
                      FROM State
                      GROUP BY state
                      ORDER BY avg_inv DESC) AS state_avg_inv
                LIMIT 1)
WHERE query = 'State with the greatest inventory overall';

/* Using max inventory, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(state_max_inv.state, ', ', state_max_inv.max_inv) AS result2
                            FROM (SELECT state, MAX(inventory) AS max_inv
                                  FROM State
                                  GROUP BY state
                                  ORDER BY max_inv DESC) AS state_max_inv
                            LIMIT 1)
WHERE query = 'State with the greatest inventory overall';


/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the greatest inventory in 2022',
        'State',
        'Result uses average inventory overall for each state and finds the max average,
                   result alternative uses the max overall without any averaging');


/* Using average inventory: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(state_avg_inv.state, ', ', state_avg_inv.avg_inv) AS result1
                FROM (SELECT state, AVG(inventory) AS avg_inv
                      FROM State
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY state
                      ORDER BY avg_inv DESC) AS state_avg_inv
                LIMIT 1)
WHERE query = 'State with the greatest inventory in 2022';

/* Using max inventory, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(state_max_inv.state, ', ', state_max_inv.max_inv) AS result2
                            FROM (SELECT state, MAX(inventory) AS max_inv
                                  FROM State
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY state
                                  ORDER BY max_inv DESC) AS state_max_inv
                            LIMIT 1)
WHERE query = 'State with the greatest inventory in 2022';

/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the lowest inventory overall',
        'State',
        'Result uses average inventory overall for each state and finds the min average,
                   result alternative uses the min overall without any averaging');


/* Using average inventory: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(state_avg_inv.state, ', ', state_avg_inv.avg_inv) AS result1
                FROM (SELECT state, AVG(inventory) AS avg_inv
                      FROM State
                      GROUP BY state
                      ORDER BY avg_inv ASC) AS state_avg_inv
                LIMIT 1)
WHERE query = 'State with the lowest inventory overall';

/* Using min inventory, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(state_min_inv.state, ', ', state_min_inv.min_inv) AS result2
                            FROM (SELECT state, MIN(inventory) AS min_inv
                                  FROM State
                                  GROUP BY state
                                  ORDER BY min_inv ASC) AS state_min_inv
                            LIMIT 1)
WHERE query = 'State with the lowest inventory overall';


/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the lowest inventory in 2022',
        'State',
        'Result uses average inventory overall for each state and finds the min average,
                   result alternative uses the min overall without any averaging');


/* Using average inventory: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(state_avg_inv.state, ', ', state_avg_inv.avg_inv) AS result1
                FROM (SELECT state, AVG(inventory) AS avg_inv
                      FROM State
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY state
                      ORDER BY avg_inv ASC) AS state_avg_inv
                LIMIT 1)
WHERE query = 'State with the lowest inventory in 2022';

/* Using min inventory, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(state_min_inv.state, ', ', state_min_inv.min_inv) AS result2
                            FROM (SELECT state, MIN(inventory) AS min_inv
                                  FROM State
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY state
                                  ORDER BY min_inv ASC) AS state_min_inv
                            LIMIT 1)
WHERE query = 'State with the lowest inventory in 2022';


/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the greatest median price per square foot overall',
        'State',
        'Result uses average median ppsf overall for each state and finds the max average,
                   result alternative uses the max median ppsf overall without any averaging');


/* Using average price per square foot overall: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(state_avg_ppsf.state, ', ', state_avg_ppsf.avg_ppsf) AS result1
                FROM (SELECT state, AVG(median_ppsf) AS avg_ppsf
                      FROM State
                      GROUP BY state
                      ORDER BY avg_ppsf DESC) AS state_avg_ppsf
                LIMIT 1)
WHERE query = 'State with the greatest median price per square foot overall';

/* Using max price per square foot, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(state_max_ppsf.state, ', ', state_max_ppsf.max_ppsf) AS result2
                            FROM (SELECT state, MAX(median_ppsf) AS max_ppsf
                                  FROM State
                                  GROUP BY state
                                  ORDER BY max_ppsf DESC) AS state_max_ppsf
                            LIMIT 1)
WHERE query = 'State with the greatest median price per square foot overall';


/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the greatest median price per square foot in 2022',
        'State',
        'Result uses average median ppsf overall for each state and finds the max average,
                   result alternative uses the max median ppsf overall without any averaging');


/* Using average price per square foot overall: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(state_avg_ppsf.state, ', ', state_avg_ppsf.avg_ppsf) AS result1
                FROM (SELECT state, AVG(median_ppsf) AS avg_ppsf
                      FROM State
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY state
                      ORDER BY avg_ppsf DESC) AS state_avg_ppsf
                LIMIT 1)
WHERE query = 'State with the greatest median price per square foot in 2022';

/* Using max price per square foot, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(state_max_ppsf.state, ', ', state_max_ppsf.max_ppsf) AS result2
                            FROM (SELECT state, MAX(median_ppsf) AS max_ppsf
                                  FROM State
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY state
                                  ORDER BY max_ppsf DESC) AS state_max_ppsf
                            LIMIT 1)
WHERE query = 'State with the greatest median price per square foot in 2022';

/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the lowest median price per square foot overall',
        'State',
        'Result uses average median ppsf overall for each state and finds the min average,
                   result alternative uses the min median ppsf overall without any averaging');


/* Using average price per square foot overall: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(state_avg_ppsf.state, ', ', state_avg_ppsf.avg_ppsf) AS result1
                FROM (SELECT state, AVG(median_ppsf) AS avg_ppsf
                      FROM State
                      GROUP BY state
                      ORDER BY avg_ppsf ASC) AS state_avg_ppsf
                LIMIT 1)
WHERE query = 'State with the lowest median price per square foot overall';

/* Using min price per square foot, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(state_min_ppsf.state, ', ', state_min_ppsf.min_ppsf) AS result2
                            FROM (SELECT state, MIN(median_ppsf) AS min_ppsf
                                  FROM State
                                  GROUP BY state
                                  ORDER BY min_ppsf ASC) AS state_min_ppsf
                            LIMIT 1)
WHERE query = 'State with the lowest median price per square foot overall';


/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the lowest median price per square foot in 2022',
        'State',
        'Result uses average median ppsf overall for each state and finds the min average,
                   result alternative uses the min median ppsf overall without any averaging');


/* Using average price per square foot overall: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(state_avg_ppsf.state, ', ', state_avg_ppsf.avg_ppsf) AS result1
                FROM (SELECT state, AVG(median_ppsf) AS avg_ppsf
                      FROM State
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY state
                      ORDER BY avg_ppsf ASC) AS state_avg_ppsf
                LIMIT 1)
WHERE query = 'State with the lowest median price per square foot in 2022';

/* Using min price per square foot, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(state_min_ppsf.state, ', ', state_min_ppsf.min_ppsf) AS result2
                            FROM (SELECT state, MIN(median_ppsf) AS min_ppsf
                                  FROM State
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY state
                                  ORDER BY min_ppsf ASC) AS state_min_ppsf
                            LIMIT 1)
WHERE query = 'State with the lowest median price per square foot in 2022';

/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the greatest number of homes sold overall',
        'State',
        'Result uses average number of homes sold and finds the max average,
                   result alternative uses the max without any averaging');


/* Using average number of homes sold for each state: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_homes_sold.state, ', ', average_homes_sold.avg_hs) AS result1
                FROM (SELECT state, AVG(homes_sold) AS avg_hs
                      FROM State
                      GROUP BY state
                      ORDER BY avg_hs DESC) AS average_homes_sold
                LIMIT 1)
WHERE query = 'State with the greatest number of homes sold overall';

/* Using max homes sold, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(max_homes_sold.state, ', ', max_homes_sold.max_hs) AS result2
                            FROM (SELECT state, MAX(homes_sold) AS max_hs
                                  FROM State
                                  GROUP BY state
                                  ORDER BY max_hs DESC) AS max_homes_sold
                            LIMIT 1)
WHERE query = 'State with the greatest number of homes sold overall';

/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the greatest number of homes sold in 2022',
        'State',
        'Result uses average number of homes sold and finds the max average,
                   result alternative uses the max without any averaging');


/* Using average number of homes sold for each state: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_homes_sold.state, ', ', average_homes_sold.avg_hs) AS result1
                FROM (SELECT state, AVG(homes_sold) AS avg_hs
                      FROM State
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY state
                      ORDER BY avg_hs DESC) AS average_homes_sold
                LIMIT 1)
WHERE query = 'State with the greatest number of homes sold in 2022';

/* Using max homes sold, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(max_homes_sold.state, ', ', max_homes_sold.max_hs) AS result2
                            FROM (SELECT state, MAX(homes_sold) AS max_hs
                                  FROM State
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY state
                                  ORDER BY max_hs DESC) AS max_homes_sold
                            LIMIT 1)
WHERE query = 'State with the greatest number of homes sold in 2022';


/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the lowest number of homes sold overall',
        'State',
        'Result uses average number of homes sold and finds the min average,
                   result alternative uses the min without any averaging');


/* Using average number of homes sold for each state: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_homes_sold.state, ', ', average_homes_sold.avg_hs) AS result1
                FROM (SELECT state, AVG(homes_sold) AS avg_hs
                      FROM State
                      GROUP BY state
                      ORDER BY avg_hs ASC) AS average_homes_sold
                LIMIT 1)
WHERE query = 'State with the lowest number of homes sold overall';

/* Using min homes sold, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(min_homes_sold.state, ', ', min_homes_sold.min_hs) AS result2
                            FROM (SELECT state, MIN(homes_sold) AS min_hs
                                  FROM State
                                  GROUP BY state
                                  ORDER BY min_hs ASC) AS min_homes_sold
                            LIMIT 1)
WHERE query = 'State with the lowest number of homes sold overall';

/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the lowest number of homes sold in 2022',
        'State',
        'Result uses average number of homes sold and finds the min average,
                   result alternative uses the min without any averaging');


/* Using average number of homes sold for each state: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_homes_sold.state, ', ', average_homes_sold.avg_hs) AS result1
                FROM (SELECT state, AVG(homes_sold) AS avg_hs
                      FROM State
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY state
                      ORDER BY avg_hs ASC) AS average_homes_sold
                LIMIT 1)
WHERE query = 'State with the lowest number of homes sold in 2022';

/* Using min homes sold, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(min_homes_sold.state, ', ', min_homes_sold.min_hs) AS result2
                            FROM (SELECT state, MIN(homes_sold) AS min_hs
                                  FROM State
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY state
                                  ORDER BY min_hs ASC) AS min_homes_sold
                            LIMIT 1)
WHERE query = 'State with the lowest number of homes sold in 2022';


/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the greatest number of days on the market overall',
        'State',
        'Result uses average number of days on market for each state and finds the max average,
                   result alternative uses the max without any averaging');


/* Using average number of days on the market for each state: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_DOM.state, ', ', average_DOM.avg_days) AS result1
                FROM (SELECT state, AVG(median_dom) AS avg_days
                      FROM State
                      GROUP BY state
                      ORDER BY avg_days DESC) AS average_DOM
                LIMIT 1)
WHERE query = 'State with the greatest number of days on the market overall';

/* Using max days on the market, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(max_DOM.state, ', ', max_DOM.max_days) AS result2
                            FROM (SELECT state, MAX(median_dom) AS max_days
                                  FROM State
                                  GROUP BY state
                                  ORDER BY max_days DESC) AS max_DOM
                            LIMIT 1)
WHERE query = 'State with the greatest number of days on the market overall';

/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the greatest number of days on the market in 2022',
        'State',
        'Result uses average number of days on market for each state in 2022 and finds the max average,
                   result alternative uses the max in 2022 without any averaging');


/* Using average number of days on the market for each state: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_DOM.state, ', ', average_DOM.avg_days) AS result1
                FROM (SELECT state, AVG(median_dom) AS avg_days
                      FROM State
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY state
                      ORDER BY avg_days DESC) AS average_DOM
                LIMIT 1)
WHERE query = 'State with the greatest number of days on the market in 2022';

/* Using max overall, rather than averaging each state: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(max_DOM.state, ', ', max_DOM.max_days) AS result2
                            FROM (SELECT state, MAX(median_dom) AS max_days
                                  FROM State
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY state
                                  ORDER BY max_days DESC) AS max_DOM
                            LIMIT 1)
WHERE query = 'State with the greatest number of days on the market in 2022';


/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the lowest number of days on the market overall',
        'State',
        'Result uses average number of days on market for each state and finds the min average,
                   result alternative uses the min without any averaging');


/* Using average number of days on the market for each state: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_DOM.state, ', ', average_DOM.avg_days) AS result1
                FROM (SELECT state, AVG(median_dom) AS avg_days
                      FROM State
                      GROUP BY state
                      ORDER BY avg_days ASC) AS average_DOM
                LIMIT 1)
WHERE query = 'State with the lowest number of days on the market overall';

/* Using max days on the market, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(min_DOM.state, ', ', min_DOM.min_days) AS result2
                            FROM (SELECT state, MIN(median_dom) AS min_days
                                  FROM State
                                  GROUP BY state
                                  ORDER BY min_days ASC) AS min_DOM
                            LIMIT 1)
WHERE query = 'State with the lowest number of days on the market overall';

/* -------------------------------------------------------------------------------------------------------------------*/



INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the lowest number of days on the market in 2022',
        'State',
        'Result uses average number of days on market for each state in 2022 and finds the min average,
                   result alternative uses the min in 2022 without any averaging');


/* Using average number of days on the market for each state: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_DOM.state, ', ', average_DOM.avg_days) AS result1
                FROM (SELECT state, AVG(median_dom) AS avg_days
                      FROM State
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY state
                      ORDER BY avg_days ASC) AS average_DOM
                LIMIT 1)
WHERE query = 'State with the lowest number of days on the market in 2022';

/* Using max overall, rather than averaging each state: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(min_DOM.state, ', ', min_DOM.min_days) AS result2
                            FROM (SELECT state, MIN(median_dom) AS min_days
                                  FROM State
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY state
                                  ORDER BY min_days ASC) AS min_DOM
                            LIMIT 1)
WHERE query = 'State with the lowest number of days on the market in 2022';


/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the greatest percent of homes that sold above list price overall',
        'State',
        'Result uses average percent of homes that sold above list price for each state and finds the max average,
                   result alternative uses the max without any averaging');


/* Using average percent sold above list price for each state: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_POL.state, ', ', average_POL.avg_percent) AS result1
                FROM (SELECT state, AVG(sold_above_list) AS avg_percent
                      FROM State
                      GROUP BY state
                      ORDER BY avg_percent DESC) AS average_POL
                LIMIT 1)
WHERE query = 'State with the greatest percent of homes that sold above list price overall';

/* Using overall max percent of homes sold above list price, rather than averaging them for each state: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(max_POL.state, ', ', max_POL.max_percent) AS result2
                            FROM (SELECT state, MAX(sold_above_list) AS max_percent
                                  FROM State
                                  GROUP BY state
                                  ORDER BY max_percent DESC) AS max_POL
                            LIMIT 1)
WHERE query = 'State with the greatest percent of homes that sold above list price overall';

/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the greatest percent of homes that sold above list price in 2022',
        'State',
        'Result uses average percent of homes that sold above list price for each state in 2022 and finds the max average,
                   result alternative uses the max in 2022 without any averaging');


/* Using average percent sold above list price for each state: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_POL.state, ', ', average_POL.avg_percent) AS result1
                FROM (SELECT state, AVG(sold_above_list) AS avg_percent
                      FROM State
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY state
                      ORDER BY avg_percent DESC) AS average_POL
                LIMIT 1)
WHERE query = 'State with the greatest percent of homes that sold above list price in 2022';

/* Using overall max percent of homes sold above list price, rather than averaging them for each state: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(max_POL.state, ', ', max_POL.max_percent) AS result2
                            FROM (SELECT state, MAX(sold_above_list) AS max_percent
                                  FROM State
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY state
                                  ORDER BY max_percent DESC) AS max_POL
                            LIMIT 1)
WHERE query = 'State with the greatest percent of homes that sold above list price in 2022';


/* -------------------------------------------------------------------------------------------------------------------*/
INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the lowest percent of homes that sold above list price overall',
        'State',
        'Result uses average percent of homes that sold above list price for each state and finds the min average,
                   result alternative uses the min without any averaging');


/* Using average percent sold above list price for each state: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_POL.state, ', ', average_POL.avg_percent) AS result1
                FROM (SELECT state, AVG(sold_above_list) AS avg_percent
                      FROM State
                      GROUP BY state
                      ORDER BY avg_percent ASC) AS average_POL
                LIMIT 1)
WHERE query = 'State with the lowest percent of homes that sold above list price overall';

/* Using overall min percent of homes sold above list price, rather than averaging them for each state: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(min_POL.state, ', ', min_POL.min_percent) AS result2
                            FROM (SELECT state, MIN(sold_above_list) AS min_percent
                                  FROM State
                                  GROUP BY state
                                  ORDER BY min_percent ASC) AS min_POL
                            LIMIT 1)
WHERE query = 'State with the lowest percent of homes that sold above list price overall';

/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('State with the lowest percent of homes that sold above list price in 2022',
        'State',
        'Result uses average percent of homes that sold above list price for each state in 2022 and finds the min average,
                   result alternative uses the min in 2022 without any averaging');


/* Using average percent sold above list price for each state: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_POL.state, ', ', average_POL.avg_percent) AS result1
                FROM (SELECT state, AVG(sold_above_list) AS avg_percent
                      FROM State
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY state
                      ORDER BY avg_percent ASC) AS average_POL
                LIMIT 1)
WHERE query = 'State with the lowest percent of homes that sold above list price in 2022';

/* Using overall min percent of homes sold above list price, rather than averaging them for each state: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(min_POL.state, ', ', min_POL.min_percent) AS result2
                            FROM (SELECT state, MIN(sold_above_list) AS min_percent
                                  FROM State
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY state
                                  ORDER BY min_percent ASC) AS min_POL
                            LIMIT 1)
WHERE query = 'State with the lowest percent of homes that sold above list price in 2022';


/* -------------------------------------------------------------------------------------------------------------------*/
/* COUNTY QUERIES */

INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the highest median home sale overall',
        'County',
        'Result uses average median sales overall and finds the max average,
                   result alternative uses the max median without any averaging');


/* Using average median sale prices: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_medians.region, ', ', average_medians.avg_med_home_sale) AS result1
                FROM (SELECT region, AVG(median_sale_price) AS avg_med_home_sale
                      FROM County
                      GROUP BY region
                      ORDER BY avg_med_home_sale DESC) AS average_medians
                LIMIT 1)
WHERE query = 'County with the highest median home sale overall';

/* Using max median sale price, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(max_medians.region, ', ', max_medians.max_med_home_sale) AS result2
                            FROM (SELECT region, MAX(median_sale_price) AS max_med_home_sale
                                  FROM County
                                  GROUP BY region
                                  ORDER BY max_med_home_sale DESC) AS max_medians
                            LIMIT 1)
WHERE query = 'County with the highest median home sale overall';


/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the highest median home sale in 2022',
        'County',
        'Result uses average median sales overall and finds the max average,
                  result alternative uses the max median without any averaging');

/* Using average median sale prices: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_medians.region, ', ', average_medians.avg_med_home_sale) AS result1
                FROM (SELECT region, AVG(median_sale_price) AS avg_med_home_sale
                      FROM County
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY region
                      ORDER BY avg_med_home_sale DESC) AS average_medians
                LIMIT 1)
WHERE query = 'County with the highest median home sale in 2022';

/* Using max median sale price, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(max_medians.region, ', ', max_medians.max_med_home_sale) AS result2
                            FROM (SELECT region, MAX(median_sale_price) AS max_med_home_sale
                                  FROM County
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY region
                                  ORDER BY max_med_home_sale DESC) AS max_medians
                            LIMIT 1)
WHERE query = 'County with the highest median home sale in 2022';


/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the lowest median home sale overall',
        'County',
        'Result uses average median sales overall and finds the min average,
                  result alternative uses the min median without any averaging');

/* Using average median sale prices: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_medians.region, ', ', average_medians.avg_med_home_sale) AS result1
                FROM (SELECT region, AVG(median_sale_price) AS avg_med_home_sale
                      FROM County
                      GROUP BY region
                      ORDER BY avg_med_home_sale ASC) AS average_medians
                LIMIT 1)
WHERE query = 'County with the lowest median home sale overall';

/* Using max median sale price, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(min_medians.region, ', ', min_medians.min_med_home_sale) AS result2
                            FROM (SELECT region, MAX(median_sale_price) AS min_med_home_sale
                                  FROM County
                                  GROUP BY region
                                  ORDER BY min_med_home_sale ASC) AS min_medians
                            LIMIT 1)
WHERE query = 'County with the lowest median home sale overall';


/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the lowest median home sale in 2022',
        'County',
        'Result uses average median sales overall and finds the min average,
                  result alternative uses the min median without any averaging');

/* Using average median sale prices: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_medians.region, ', ', average_medians.avg_med_home_sale) AS result1
                FROM (SELECT region, AVG(median_sale_price) AS avg_med_home_sale
                      FROM County
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY region
                      ORDER BY avg_med_home_sale ASC) AS average_medians
                LIMIT 1)
WHERE query = 'County with the lowest median home sale in 2022';

/* Using max median sale price, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(min_medians.region, ', ', min_medians.min_med_home_sale) AS result2
                            FROM (SELECT region, MAX(median_sale_price) AS min_med_home_sale
                                  FROM County
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY region
                                  ORDER BY min_med_home_sale ASC) AS min_medians
                            LIMIT 1)
WHERE query = 'County with the lowest median home sale in 2022';


/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the greatest inventory overall',
        'County',
        'Result uses average inventory overall for each county and finds the max average,
                   result alternative uses the max overall without any averaging');


/* Using average inventory: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(county_avg_inv.region, ', ', county_avg_inv.avg_inv) AS result1
                FROM (SELECT region, AVG(inventory) AS avg_inv
                      FROM County
                      GROUP BY region
                      ORDER BY avg_inv DESC) AS county_avg_inv
                LIMIT 1)
WHERE query = 'County with the greatest inventory overall';

/* Using max inventory, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(county_max_inv.region, ', ', county_max_inv.max_inv) AS result2
                            FROM (SELECT region, MAX(inventory) AS max_inv
                                  FROM County
                                  GROUP BY region
                                  ORDER BY max_inv DESC) AS county_max_inv
                            LIMIT 1)
WHERE query = 'County with the greatest inventory overall';


/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the greatest inventory in 2022',
        'County',
        'Result uses average inventory overall for each County and finds the max average,
                   result alternative uses the max overall without any averaging');


/* Using average inventory: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(county_avg_inv.region, ', ', county_avg_inv.avg_inv) AS result1
                FROM (SELECT region, AVG(inventory) AS avg_inv
                      FROM County
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY region
                      ORDER BY avg_inv DESC) AS county_avg_inv
                LIMIT 1)
WHERE query = 'County with the greatest inventory in 2022';

/* Using max inventory, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(county_max_inv.region, ', ', county_max_inv.max_inv) AS result2
                            FROM (SELECT region, MAX(inventory) AS max_inv
                                  FROM County
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY region
                                  ORDER BY max_inv DESC) AS county_max_inv
                            LIMIT 1)
WHERE query = 'County with the greatest inventory in 2022';

/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the lowest inventory overall',
        'County',
        'Result uses average inventory overall for each County and finds the min average,
                   result alternative uses the min overall without any averaging');


/* Using average inventory: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(county_avg_inv.region, ', ', county_avg_inv.avg_inv) AS result1
                FROM (SELECT region, AVG(inventory) AS avg_inv
                      FROM County
                      GROUP BY region
                      ORDER BY avg_inv ASC) AS county_avg_inv
                LIMIT 1)
WHERE query = 'County with the lowest inventory overall';

/* Using min inventory, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(county_min_inv.region, ', ', county_min_inv.min_inv) AS result2
                            FROM (SELECT region, MIN(inventory) AS min_inv
                                  FROM County
                                  GROUP BY region
                                  ORDER BY min_inv ASC) AS county_min_inv
                            LIMIT 1)
WHERE query = 'County with the lowest inventory overall';


/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the lowest inventory in 2022',
        'County',
        'Result uses average inventory overall for each County and finds the min average,
                   result alternative uses the min overall without any averaging');


/* Using average inventory: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(county_avg_inv.region, ', ', county_avg_inv.avg_inv) AS result1
                FROM (SELECT region, AVG(inventory) AS avg_inv
                      FROM County
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY region
                      ORDER BY avg_inv ASC) AS county_avg_inv
                LIMIT 1)
WHERE query = 'County with the lowest inventory in 2022';

/* Using min inventory, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(county_min_inv.region, ', ', county_min_inv.min_inv) AS result2
                            FROM (SELECT region, MIN(inventory) AS min_inv
                                  FROM County
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY region
                                  ORDER BY min_inv ASC) AS county_min_inv
                            LIMIT 1)
WHERE query = 'County with the lowest inventory in 2022';


/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the greatest median price per square foot overall',
        'County',
        'Result uses average median ppsf overall for each County and finds the max average,
                   result alternative uses the max median ppsf overall without any averaging');


/* Using average price per square foot overall: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(county_avg_ppsf.region, ', ', county_avg_ppsf.avg_ppsf) AS result1
                FROM (SELECT region, AVG(median_ppsf) AS avg_ppsf
                      FROM County
                      GROUP BY region
                      ORDER BY avg_ppsf DESC) AS county_avg_ppsf
                LIMIT 1)
WHERE query = 'County with the greatest median price per square foot overall';

/* Using max price per square foot, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(county_max_ppsf.region, ', ', county_max_ppsf.max_ppsf) AS result2
                            FROM (SELECT region, MAX(median_ppsf) AS max_ppsf
                                  FROM County
                                  GROUP BY region
                                  ORDER BY max_ppsf DESC) AS county_max_ppsf
                            LIMIT 1)
WHERE query = 'County with the greatest median price per square foot overall';


/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the greatest median price per square foot in 2022',
        'County',
        'Result uses average median ppsf overall for each County and finds the max average,
                   result alternative uses the max median ppsf overall without any averaging');


/* Using average price per square foot overall: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(county_avg_ppsf.region, ', ', county_avg_ppsf.avg_ppsf) AS result1
                FROM (SELECT region, AVG(median_ppsf) AS avg_ppsf
                      FROM County
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY region
                      ORDER BY avg_ppsf DESC) AS county_avg_ppsf
                LIMIT 1)
WHERE query = 'County with the greatest median price per square foot in 2022';

/* Using max price per square foot, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(county_max_ppsf.region, ', ', county_max_ppsf.max_ppsf) AS result2
                            FROM (SELECT region, MAX(median_ppsf) AS max_ppsf
                                  FROM County
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY region
                                  ORDER BY max_ppsf DESC) AS county_max_ppsf
                            LIMIT 1)
WHERE query = 'County with the greatest median price per square foot in 2022';

/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the lowest median price per square foot overall',
        'County',
        'Result uses average median ppsf overall for each County and finds the min average,
                   result alternative uses the min median ppsf overall without any averaging');


/* Using average price per square foot overall: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(county_avg_ppsf.region, ', ', county_avg_ppsf.avg_ppsf) AS result1
                FROM (SELECT region, AVG(median_ppsf) AS avg_ppsf
                      FROM County
                      GROUP BY region
                      ORDER BY avg_ppsf ASC) AS county_avg_ppsf
                LIMIT 1)
WHERE query = 'County with the lowest median price per square foot overall';

/* Using min price per square foot, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(county_min_ppsf.region, ', ', county_min_ppsf.min_ppsf) AS result2
                            FROM (SELECT region, MIN(median_ppsf) AS min_ppsf
                                  FROM County
                                  GROUP BY region
                                  ORDER BY min_ppsf ASC) AS county_min_ppsf
                            LIMIT 1)
WHERE query = 'County with the lowest median price per square foot overall';


/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the lowest median price per square foot in 2022',
        'County',
        'Result uses average median ppsf overall for each County and finds the min average,
                   result alternative uses the min median ppsf overall without any averaging');


/* Using average price per square foot overall: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(county_avg_ppsf.region, ', ', county_avg_ppsf.avg_ppsf) AS result1
                FROM (SELECT region, AVG(median_ppsf) AS avg_ppsf
                      FROM County
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY region
                      ORDER BY avg_ppsf ASC) AS county_avg_ppsf
                LIMIT 1)
WHERE query = 'County with the lowest median price per square foot in 2022';

/* Using min price per square foot, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(county_min_ppsf.region, ', ', county_min_ppsf.min_ppsf) AS result2
                            FROM (SELECT region, MIN(median_ppsf) AS min_ppsf
                                  FROM County
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY region
                                  ORDER BY min_ppsf ASC) AS county_min_ppsf
                            LIMIT 1)
WHERE query = 'County with the lowest median price per square foot in 2022';

/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the greatest number of homes sold overall',
        'County',
        'Result uses average number of homes sold and finds the max average,
                   result alternative uses the max without any averaging');


/* Using average number of homes sold for each county: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_homes_sold.region, ', ', average_homes_sold.avg_hs) AS result1
                FROM (SELECT region, AVG(homes_sold) AS avg_hs
                      FROM County
                      GROUP BY region
                      ORDER BY avg_hs DESC) AS average_homes_sold
                LIMIT 1)
WHERE query = 'County with the greatest number of homes sold overall';

/* Using max homes sold, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(max_homes_sold.region, ', ', max_homes_sold.max_hs) AS result2
                            FROM (SELECT region, MAX(homes_sold) AS max_hs
                                  FROM County
                                  GROUP BY region
                                  ORDER BY max_hs DESC) AS max_homes_sold
                            LIMIT 1)
WHERE query = 'County with the greatest number of homes sold overall';

/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the greatest number of homes sold in 2022',
        'County',
        'Result uses average number of homes sold and finds the max average,
                   result alternative uses the max without any averaging');


/* Using average number of homes sold for each county: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_homes_sold.region, ', ', average_homes_sold.avg_hs) AS result1
                FROM (SELECT region, AVG(homes_sold) AS avg_hs
                      FROM State
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY region
                      ORDER BY avg_hs DESC) AS average_homes_sold
                LIMIT 1)
WHERE query = 'County with the greatest number of homes sold in 2022';

/* Using max homes sold, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(max_homes_sold.region, ', ', max_homes_sold.max_hs) AS result2
                            FROM (SELECT region, MAX(homes_sold) AS max_hs
                                  FROM County
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY region
                                  ORDER BY max_hs DESC) AS max_homes_sold
                            LIMIT 1)
WHERE query = 'County with the greatest number of homes sold in 2022';


/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the lowest number of homes sold overall',
        'County',
        'Result uses average number of homes sold and finds the min average,
                   result alternative uses the min without any averaging');


/* Using average number of homes sold for each county: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_homes_sold.region, ', ', average_homes_sold.avg_hs) AS result1
                FROM (SELECT region, AVG(homes_sold) AS avg_hs
                      FROM County
                      GROUP BY region
                      ORDER BY avg_hs ASC) AS average_homes_sold
                LIMIT 1)
WHERE query = 'County with the lowest number of homes sold overall';

/* Using min homes sold, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(min_homes_sold.region, ', ', min_homes_sold.min_hs) AS result2
                            FROM (SELECT region, MIN(homes_sold) AS min_hs
                                  FROM County
                                  GROUP BY region
                                  ORDER BY min_hs ASC) AS min_homes_sold
                            LIMIT 1)
WHERE query = 'County with the lowest number of homes sold overall';

/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the lowest number of homes sold in 2022',
        'County',
        'Result uses average number of homes sold and finds the min average,
                   result alternative uses the min without any averaging');


/* Using average number of homes sold for each county: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_homes_sold.region, ', ', average_homes_sold.avg_hs) AS result1
                FROM (SELECT region, AVG(homes_sold) AS avg_hs
                      FROM County
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY region
                      ORDER BY avg_hs ASC) AS average_homes_sold
                LIMIT 1)
WHERE query = 'County with the lowest number of homes sold in 2022';

/* Using min homes sold, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(min_homes_sold.region, ', ', min_homes_sold.min_hs) AS result2
                            FROM (SELECT region, MIN(homes_sold) AS min_hs
                                  FROM County
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY region
                                  ORDER BY min_hs ASC) AS min_homes_sold
                            LIMIT 1)
WHERE query = 'County with the lowest number of homes sold in 2022';


/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the greatest number of days on the market overall',
        'County',
        'Result uses average number of days on market for each county and finds the max average,
                   result alternative uses the max without any averaging');


/* Using average number of days on the market for each county: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_DOM.region, ', ', average_DOM.avg_days) AS result1
                FROM (SELECT region, AVG(median_dom) AS avg_days
                      FROM County
                      GROUP BY region
                      ORDER BY avg_days DESC) AS average_DOM
                LIMIT 1)
WHERE query = 'County with the greatest number of days on the market overall';

/* Using max days on the market, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(max_DOM.region, ', ', max_DOM.max_days) AS result2
                            FROM (SELECT region, MAX(median_dom) AS max_days
                                  FROM County
                                  GROUP BY region
                                  ORDER BY max_days DESC) AS max_DOM
                            LIMIT 1)
WHERE query = 'County with the greatest number of days on the market overall';

/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the greatest number of days on the market in 2022',
        'County',
        'Result uses average number of days on market for each county in 2022 and finds the max average,
                   result alternative uses the max in 2022 without any averaging');


/* Using average number of days on the market for each county: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_DOM.region, ', ', average_DOM.avg_days) AS result1
                FROM (SELECT region, AVG(median_dom) AS avg_days
                      FROM County
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY region
                      ORDER BY avg_days DESC) AS average_DOM
                LIMIT 1)
WHERE query = 'County with the greatest number of days on the market in 2022';

/* Using max overall, rather than averaging each county: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(max_DOM.region, ', ', max_DOM.max_days) AS result2
                            FROM (SELECT region, MAX(median_dom) AS max_days
                                  FROM County
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY region
                                  ORDER BY max_days DESC) AS max_DOM
                            LIMIT 1)
WHERE query = 'County with the greatest number of days on the market in 2022';


/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the lowest number of days on the market overall',
        'County',
        'Result uses average number of days on market for each county and finds the min average,
                   result alternative uses the min without any averaging');


/* Using average number of days on the market for each county: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_DOM.region, ', ', average_DOM.avg_days) AS result1
                FROM (SELECT region, AVG(median_dom) AS avg_days
                      FROM County
                      GROUP BY region
                      ORDER BY avg_days ASC) AS average_DOM
                LIMIT 1)
WHERE query = 'County with the lowest number of days on the market overall';

/* Using max days on the market, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(min_DOM.region, ', ', min_DOM.min_days) AS result2
                            FROM (SELECT region, MIN(median_dom) AS min_days
                                  FROM County
                                  GROUP BY region
                                  ORDER BY min_days ASC) AS min_DOM
                            LIMIT 1)
WHERE query = 'County with the lowest number of days on the market overall';

/* -------------------------------------------------------------------------------------------------------------------*/



INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the lowest number of days on the market in 2022',
        'County',
        'Result uses average number of days on market for each county in 2022 and finds the min average,
                   result alternative uses the min in 2022 without any averaging');


/* Using average number of days on the market for each county: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_DOM.region, ', ', average_DOM.avg_days) AS result1
                FROM (SELECT region, AVG(median_dom) AS avg_days
                      FROM County
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY region
                      ORDER BY avg_days ASC) AS average_DOM
                LIMIT 1)
WHERE query = 'County with the lowest number of days on the market in 2022';

/* Using max overall, rather than averaging each county: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(min_DOM.region, ', ', min_DOM.min_days) AS result2
                            FROM (SELECT region, MIN(median_dom) AS min_days
                                  FROM County
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY region
                                  ORDER BY min_days ASC) AS min_DOM
                            LIMIT 1)
WHERE query = 'County with the lowest number of days on the market in 2022';


/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the greatest percent of homes that sold above list price overall',
        'County',
        'Result uses average percent of homes that sold above list price for each county and finds the max average,
                   result alternative uses the max without any averaging');


/* Using average percent sold above list price for each county: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_POL.region, ', ', average_POL.avg_percent) AS result1
                FROM (SELECT region, AVG(sold_above_list) AS avg_percent
                      FROM County
                      GROUP BY region
                      ORDER BY avg_percent DESC) AS average_POL
                LIMIT 1)
WHERE query = 'County with the greatest percent of homes that sold above list price overall';

/* Using overall max percent of homes sold above list price, rather than averaging them for each county: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(max_POL.region, ', ', max_POL.max_percent) AS result2
                            FROM (SELECT region, MAX(sold_above_list) AS max_percent
                                  FROM County
                                  GROUP BY region
                                  ORDER BY max_percent DESC) AS max_POL
                            LIMIT 1)
WHERE query = 'County with the greatest percent of homes that sold above list price overall';

/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the greatest percent of homes that sold above list price in 2022',
        'County',
        'Result uses average percent of homes that sold above list price for each county in 2022 and finds the max average,
                   result alternative uses the max in 2022 without any averaging');


/* Using average percent sold above list price for each county: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_POL.region, ', ', average_POL.avg_percent) AS result1
                FROM (SELECT region, AVG(sold_above_list) AS avg_percent
                      FROM County
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY region
                      ORDER BY avg_percent DESC) AS average_POL
                LIMIT 1)
WHERE query = 'County with the greatest percent of homes that sold above list price in 2022';

/* Using overall max percent of homes sold above list price, rather than averaging them for each county: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(max_POL.region, ', ', max_POL.max_percent) AS result2
                            FROM (SELECT region, MAX(sold_above_list) AS max_percent
                                  FROM County
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY region
                                  ORDER BY max_percent DESC) AS max_POL
                            LIMIT 1)
WHERE query = 'County with the greatest percent of homes that sold above list price in 2022';


/* -------------------------------------------------------------------------------------------------------------------*/
INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the lowest percent of homes that sold above list price overall',
        'County',
        'Result uses average percent of homes that sold above list price for each county and finds the min average,
                   result alternative uses the min without any averaging');


/* Using average percent sold above list price for each county: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_POL.region, ', ', average_POL.avg_percent) AS result1
                FROM (SELECT region, AVG(sold_above_list) AS avg_percent
                      FROM County
                      GROUP BY region
                      ORDER BY avg_percent ASC) AS average_POL
                LIMIT 1)
WHERE query = 'County with the lowest percent of homes that sold above list price overall';

/* Using overall min percent of homes sold above list price, rather than averaging them for each county: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(min_POL.region, ', ', min_POL.min_percent) AS result2
                            FROM (SELECT region, MIN(sold_above_list) AS min_percent
                                  FROM County
                                  GROUP BY region
                                  ORDER BY min_percent ASC) AS min_POL
                            LIMIT 1)
WHERE query = 'County with the lowest percent of homes that sold above list price overall';

/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('County with the lowest percent of homes that sold above list price in 2022',
        'County',
        'Result uses average percent of homes that sold above list price for each county in 2022 and finds the min average,
                   result alternative uses the min in 2022 without any averaging');


/* Using average percent sold above list price for each county: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(average_POL.region, ', ', average_POL.avg_percent) AS result1
                FROM (SELECT region, AVG(sold_above_list) AS avg_percent
                      FROM County
                      WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                      GROUP BY region
                      ORDER BY avg_percent ASC) AS average_POL
                LIMIT 1)
WHERE query = 'County with the lowest percent of homes that sold above list price in 2022';

/* Using overall min percent of homes sold above list price, rather than averaging them for each county: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(min_POL.region, ', ', min_POL.min_percent) AS result2
                            FROM (SELECT region, MIN(sold_above_list) AS min_percent
                                  FROM County
                                  WHERE period_begin BETWEEN '2022-01-01' AND '2022-12-31'
                                  GROUP BY region
                                  ORDER BY min_percent ASC) AS min_POL
                            LIMIT 1)
WHERE query = 'County with the lowest percent of homes that sold above list price in 2022';

/* -------------------------------------------------------------------------------------------------------------------*/
/* NATIONAL QUERIES BY YEAR */

INSERT INTO Query_results(query, table_id, comments)
VALUES ('Year with the highest median home sale nationally overall',
        'National',
        'Result uses average median sales overall and finds the max average,
                   result alternative uses the max median without any averaging');


/* Using average median sale prices: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(year, ', ', average_medians.avg_med_home_sale) AS result1
                FROM (SELECT EXTRACT(year FROM period_begin) AS year, AVG(median_sale_price) AS avg_med_home_sale
                      FROM National
                      GROUP BY EXTRACT(year FROM period_begin)
                      ORDER BY avg_med_home_sale DESC) AS average_medians
                LIMIT 1)
WHERE query = 'Year with the highest median home sale nationally overall';

/* Using max median sale price, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(year, ', ', max_medians.max_med_home_sale) AS result2
                            FROM (SELECT EXTRACT(year FROM period_begin) AS Year, MAX(median_sale_price) AS max_med_home_sale
                                  FROM National
                                  GROUP BY EXTRACT(year FROM period_begin)
                                  ORDER BY max_med_home_sale DESC) AS max_medians
                            LIMIT 1)
WHERE query = 'Year with the highest median home sale nationally overall';

/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('Year with the lowest median home sale nationally overall',
        'National',
        'Result uses average median sales overall and finds the min average,
                   result alternative uses the min median without any averaging');


/* Using average median sale prices: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(year, ', ', average_medians.avg_med_home_sale) AS result1
                FROM (SELECT EXTRACT(year FROM period_begin) AS year, AVG(median_sale_price) AS avg_med_home_sale
                      FROM National
                      GROUP BY EXTRACT(year FROM period_begin)
                      ORDER BY avg_med_home_sale ASC) AS average_medians
                LIMIT 1)
WHERE query = 'Year with the lowest median home sale nationally overall';

/* Using max median sale price, rather than averaging them all: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(year, ', ', max_medians.max_med_home_sale) AS result2
                            FROM (SELECT EXTRACT(year FROM period_begin) AS Year, MIN(median_sale_price) AS max_med_home_sale
                                  FROM National
                                  GROUP BY EXTRACT(year FROM period_begin)
                                  ORDER BY max_med_home_sale ASC) AS max_medians
                            LIMIT 1)
WHERE query = 'Year with the lowest median home sale nationally overall';

/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('Year with the greatest inventory nationally overall',
        'National',
        'Result uses average inventory overall for each year and finds the max average,
                   result alternative uses the max overall without any averaging');


/* Using average inventory for each year: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(year, ', ', average_inventory.avg_inv) AS result1
                FROM (SELECT EXTRACT(year FROM period_begin) AS year, AVG(inventory) AS avg_inv
                      FROM National
                      GROUP BY EXTRACT(year FROM period_begin)
                      ORDER BY avg_inv DESC) AS average_inventory
                LIMIT 1)
WHERE query = 'Year with the greatest inventory nationally overall';

/* Using max inventory overall, rather than averaging them by year: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(year, ', ', max_inventory.max_inv) AS result2
                            FROM (SELECT EXTRACT(year FROM period_begin) AS Year, MAX(inventory) AS max_inv
                                  FROM National
                                  GROUP BY EXTRACT(year FROM period_begin)
                                  ORDER BY max_inv DESC) AS max_inventory
                            LIMIT 1)
WHERE query = 'Year with the greatest inventory nationally overall';

/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('Year with the lowest inventory nationally overall',
        'National',
        'Result uses average inventory overall for each year and finds the min average,
                   result alternative uses the min overall without any averaging');


/* Using average inventory for each year: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(year, ', ', average_inventory.avg_inv) AS result1
                FROM (SELECT EXTRACT(year FROM period_begin) AS year, AVG(inventory) AS avg_inv
                      FROM National
                      GROUP BY EXTRACT(year FROM period_begin)
                      ORDER BY avg_inv ASC) AS average_inventory
                LIMIT 1)
WHERE query = 'Year with the lowest inventory nationally overall';

/* Using min inventory overall, rather than averaging them by year: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(year, ', ', min_inventory.min_inv) AS result2
                            FROM (SELECT EXTRACT(year FROM period_begin) AS Year, MIN(inventory) AS min_inv
                                  FROM National
                                  GROUP BY EXTRACT(year FROM period_begin)
                                  ORDER BY min_inv ASC) AS min_inventory
                            LIMIT 1)
WHERE query = 'Year with the lowest inventory nationally overall';

/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('Year with the greatest median price per square foot nationally overall',
        'National',
        'Result uses average ppsf overall for each year and finds the max average,
                   result alternative uses the max overall without any averaging');


/* Using average price per square foot for each year: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(year, ', ', average_ppsf.avg_ppsf) AS result1
                FROM (SELECT EXTRACT(year FROM period_begin) AS year, AVG(median_ppsf) AS avg_ppsf
                      FROM National
                      GROUP BY EXTRACT(year FROM period_begin)
                      ORDER BY avg_ppsf DESC) AS average_ppsf
                LIMIT 1)
WHERE query = 'Year with the greatest median price per square foot nationally overall';

/* Using max ppsf overall, rather than averaging them by year: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(year, ', ', maximum_ppsf.max_ppsf) AS result2
                            FROM (SELECT EXTRACT(year FROM period_begin) AS Year, MAX(median_ppsf) AS max_ppsf
                                  FROM National
                                  GROUP BY EXTRACT(year FROM period_begin)
                                  ORDER BY max_ppsf DESC) AS maximum_ppsf
                            LIMIT 1)
WHERE query = 'Year with the greatest median price per square foot nationally overall';

/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('Year with the lowest median price per square foot nationally overall',
        'National',
        'Result uses average ppsf overall for each year and finds the min average,
                   result alternative uses the min overall without any averaging');


/* Using average price per square foot for each year: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(year, ', ', average_ppsf.avg_ppsf) AS result1
                FROM (SELECT EXTRACT(year FROM period_begin) AS year, AVG(median_ppsf) AS avg_ppsf
                      FROM National
                      GROUP BY EXTRACT(year FROM period_begin)
                      ORDER BY avg_ppsf ASC) AS average_ppsf
                LIMIT 1)
WHERE query = 'Year with the lowest median price per square foot nationally overall';

/* Using min ppsf overall, rather than averaging them by year: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(year, ', ', minimum_ppsf.min_ppsf) AS result2
                            FROM (SELECT EXTRACT(year FROM period_begin) AS Year, MIN(median_ppsf) AS min_ppsf
                                  FROM National
                                  GROUP BY EXTRACT(year FROM period_begin)
                                  ORDER BY min_ppsf ASC) AS minimum_ppsf
                            LIMIT 1)
WHERE query = 'Year with the lowest median price per square foot nationally overall';

/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('Year with the greatest number of homes sold nationally overall',
        'National',
        'Result uses average number of homes sold overall for each year and finds the max average,
                   result alternative uses the max overall without any averaging');


/* Using average homes sold for each year: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(year, ', ', average_hs.avg_hs) AS result1
                FROM (SELECT EXTRACT(year FROM period_begin) AS year, AVG(homes_sold) AS avg_hs
                      FROM National
                      GROUP BY EXTRACT(year FROM period_begin)
                      ORDER BY avg_hs DESC) AS average_hs
                LIMIT 1)
WHERE query = 'Year with the greatest number of homes sold nationally overall';

/* Using max homes sold overall, rather than averaging them by year: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(year, ', ', maximum_hs.max_hs) AS result2
                            FROM (SELECT EXTRACT(year FROM period_begin) AS Year, MAX(homes_sold) AS max_hs
                                  FROM National
                                  GROUP BY EXTRACT(year FROM period_begin)
                                  ORDER BY max_hs DESC) AS maximum_hs
                            LIMIT 1)
WHERE query = 'Year with the greatest number of homes sold nationally overall';


/* -------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Query_results(query, table_id, comments)
VALUES ('Year with the lowest number of homes sold nationally overall',
        'National',
        'Result uses average number of homes sold overall for each year and finds the min average,
                   result alternative uses the min overall without any averaging');


/* Using average homes sold for each year: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(year, ', ', average_hs.avg_hs) AS result1
                FROM (SELECT EXTRACT(year FROM period_begin) AS year, AVG(homes_sold) AS avg_hs
                      FROM National
                      GROUP BY EXTRACT(year FROM period_begin)
                      ORDER BY avg_hs ASC) AS average_hs
                LIMIT 1)
WHERE query = 'Year with the lowest number of homes sold nationally overall';

/* Using min homes sold overall, rather than averaging them by year: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(year, ', ', minimum_hs.min_hs) AS result2
                            FROM (SELECT EXTRACT(year FROM period_begin) AS Year, MIN(homes_sold) AS min_hs
                                  FROM National
                                  GROUP BY EXTRACT(year FROM period_begin)
                                  ORDER BY min_hs ASC) AS minimum_hs
                            LIMIT 1)
WHERE query = 'Year with the lowest number of homes sold nationally overall';


/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('Year with the greatest number of days on the market nationally overall',
        'National',
        'Result uses average days on the market overall for each year and finds the max average,
                   result alternative uses the max overall without any averaging');


/* Using average days on market for each year: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(year, ', ', average_dom.avg_dom) AS result1
                FROM (SELECT EXTRACT(year FROM period_begin) AS year, AVG(median_dom) AS avg_dom
                      FROM National
                      GROUP BY EXTRACT(year FROM period_begin)
                      ORDER BY avg_dom DESC) AS average_dom
                LIMIT 1)
WHERE query = 'Year with the greatest number of days on the market nationally overall';

/* Using max days on market overall, rather than averaging them by year: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(year, ', ', maximum_dom.max_dom) AS result2
                            FROM (SELECT EXTRACT(year FROM period_begin) AS Year, MAX(median_dom) AS max_dom
                                  FROM National
                                  GROUP BY EXTRACT(year FROM period_begin)
                                  ORDER BY max_dom DESC) AS maximum_dom
                            LIMIT 1)
WHERE query = 'Year with the greatest number of days on the market nationally overall';


/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('Year with the least number of days on the market nationally overall',
        'National',
        'Result uses average days on market overall for each year and finds the min average,
                   result alternative uses the min overall without any averaging');


/* Using average days on market for each year: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(year, ', ', average_dom.avg_dom) AS result1
                FROM (SELECT EXTRACT(year FROM period_begin) AS year, AVG(median_dom) AS avg_dom
                      FROM National
                      GROUP BY EXTRACT(year FROM period_begin)
                      ORDER BY avg_dom ASC) AS average_dom
                LIMIT 1)
WHERE query = 'Year with the least number of days on the market nationally overall';

/* Using min days on market overall, rather than averaging them by year: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(year, ', ', minimum_dom.min_dom) AS result2
                            FROM (SELECT EXTRACT(year FROM period_begin) AS Year, MIN(median_dom) AS min_dom
                                  FROM National
                                  GROUP BY EXTRACT(year FROM period_begin)
                                  ORDER BY min_dom ASC) AS minimum_dom
                            LIMIT 1)
WHERE query = 'Year with the least number of days on the market nationally overall';


/* -------------------------------------------------------------------------------------------------------------------*/


INSERT INTO Query_results(query, table_id, comments)
VALUES ('Year with the greatest percent of homes that sold above list price nationally overall',
        'National',
        'Result uses average percent of homes that sold above list price for each year and finds the max average,
                   result alternative uses the max overall without any averaging');


/* Using average percent of homes that sold above list price (solp) for each year: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(year, ', ', average_solp.avg_solp) AS result1
                FROM (SELECT EXTRACT(year FROM period_begin) AS year, AVG(sold_above_list) AS avg_solp
                      FROM National
                      GROUP BY EXTRACT(year FROM period_begin)
                      ORDER BY avg_solp DESC) AS average_solp
                LIMIT 1)
WHERE query = 'Year with the greatest percent of homes that sold above list price nationally overall';

/* Using max percent of homes that sold above list price overall, rather than averaging them by year: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(year, ', ', maximum_solp.max_solp) AS result2
                            FROM (SELECT EXTRACT(year FROM period_begin) AS Year, MAX(sold_above_list) AS max_solp
                                  FROM National
                                  GROUP BY EXTRACT(year FROM period_begin)
                                  ORDER BY max_solp DESC) AS maximum_solp
                            LIMIT 1)
WHERE query = 'Year with the greatest percent of homes that sold above list price nationally overall';



/* -------------------------------------------------------------------------------------------------------------------*/

/*
 Year with the lowest percent of homes that sold above list price nationally overall
 */


INSERT INTO Query_results(query, table_id, comments)
VALUES ('Year with the lowest percent of homes that sold above list price nationally overall',
        'National',
        'Result uses average percent of homes that sold above list price for each year and finds the min average,
                   result alternative uses the min overall without any averaging');


/* Using average percent of homes that sold above list price for each year: */
UPDATE Query_results AS qr
SET result = (SELECT CONCAT(year, ', ', average_solp.avg_solp) AS result1
                FROM (SELECT EXTRACT(year FROM period_begin) AS year, AVG(sold_above_list) AS avg_solp
                      FROM National
                      GROUP BY EXTRACT(year FROM period_begin)
                      ORDER BY avg_solp ASC) AS average_solp
                LIMIT 1)
WHERE query = 'Year with the lowest percent of homes that sold above list price nationally overall';

/* Using min percent of homes that sold above list price overall, rather than averaging them by year: */
UPDATE Query_results AS qr
SET result_alternative = (SELECT CONCAT(year, ', ', minimum_solp.min_solp) AS result2
                            FROM (SELECT EXTRACT(year FROM period_begin) AS Year, MIN(sold_above_list) AS min_solp
                                  FROM National
                                  GROUP BY EXTRACT(year FROM period_begin)
                                  ORDER BY min_solp ASC) AS minimum_solp
                            LIMIT 1)
WHERE query = 'Year with the lowest percent of homes that sold above list price nationally overall';


/* -------------------------------------------------------------------------------------------------------------------*/


