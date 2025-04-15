create database sales_trend_analysis;
use sales_trend_analysis;
create table online_sales(
transaction_id int,
date DATE,
product_category VARCHAR(100),
product_name varchar(100),
units_sold int,
units_price decimal(10,2),
total_revenue decimal(10,2),
region varchar(100),
payment_method varchar(50)
);
SHOW TABLES;

SELECT * FROM CLEANED_ONLINE_SALES limit 10;

-- MONTHLY REVENUE & ORDERS

SELECT 
    YEAR(order_date) AS sale_year,
    MONTH(order_date) AS sale_month,
    COUNT(DISTINCT transaction_id) AS total_orders,
    SUM(amount) AS total_revenue
FROM cleaned_online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY sale_year, sale_month;

-- TOP 5 SELLING PRODUCTS

SELECT 
    product_id,
    SUM(amount) AS revenue_generated
FROM cleaned_online_sales
GROUP BY product_id
ORDER BY revenue_generated DESC
LIMIT 5;
 
 -- CATEGORY WISE MONTHLY SALES
 
SELECT 
    product_category,
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(amount) AS total_revenue
FROM cleaned_online_sales
GROUP BY product_category, month
ORDER BY product_category, month;

-- REGION-WISE ORDERS AND REVENUE

SELECT 
    region,
    COUNT(DISTINCT transaction_id) AS total_orders,
    SUM(amount) AS total_revenue
FROM cleaned_online_sales
GROUP BY region
ORDER BY total_revenue DESC;

-- PAYMENT METHOD PREFERENCES

SELECT 
    payment_method,
    COUNT(*) AS usage_count,
    SUM(amount) AS total_spent
FROM cleaned_online_sales
GROUP BY payment_method
ORDER BY usage_count DESC;

-- PEAK REVENUE DAY

select 
    order_date,
    sum(amount) as total_revenue
    from cleaned_online_sales
    group by order_date
    order by total_revenue DESC
    LIMIT 1;