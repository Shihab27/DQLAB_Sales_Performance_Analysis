-- SELECT * FROM clean_data;
-- SELECT
-- 	YEAR(order_date) AS year1,
--     COUNT(order_id) AS total_orders,
--     SUM(sales) AS total_sales
-- FROM clean_data
-- WHERE order_status = 'Order Finished'
-- AND order_date BETWEEN '2009-01-01' AND '2012-12-31'
-- GROUP BY 1;

-- SELECT year(order_date) years, product_sub_category, SUM(sales) sales FROM clean_data 
-- WHERE year(order_date) BETWEEN 2011 AND 2012 AND order_status = 'Order Finished'
-- GROUP BY years, product_sub_category
-- ORDER BY years, sales DESC;

-- SELECT year(order_date) years, SUM(discount_value)/SUM(sales) * 100 AS Burn_Rate
-- FROM clean_data
-- WHERE order_status = 'Order Finished'
-- AND year(order_date) BETWEEN '2009' AND '2012'
-- GROUP BY year(order_date);

-- SELECT product_sub_category, 
-- 	SUM(IF(YEAR(order_date) = 2011, sales, 0)) Sales2011,
-- 	SUM(IF(YEAR(order_date) = 2012, sales, 0)) Sales2012
--     FROM clean_data
--     WHERE order_status = 'Order Finished'
-- 	GROUP BY product_sub_category;

-- SELECT YEAR(order_date) years, product_category, product_sub_category, 
-- SUM(sales) sales, SUM(discount_value) Promotion_Value,
-- ROUND(SUM(discount_value)*100/SUM(sales),2) 'Burn_Rate_Percentage'
-- FROM clean_data
-- WHERE YEAR(order_date) = 2012 AND order_status = 'Order Finished'
-- GROUP BY 3, 2, 1
-- ORDER BY 4 DESC;

-- SELECT YEAR(order_date) years, COUNT(DISTINCT customer) 'No_of_transactions_a_year' FROM clean_data
-- GROUP BY 1;

-- SELECT YEAR(first_order), COUNT(customer) 'New_Customer'
-- FROM(
-- SELECT customer, min(order_date) first_order
-- FROM clean_data
-- WHERE order_status = 'Order Finished' GROUP BY 1) first
-- GROUP BY 1;


