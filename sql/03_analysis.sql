-- =============================================
-- Chocolate Sales Project
-- Script 3: Analysis
-- =============================================

-- ----------------------
-- REVENUE OVERVIEW
-- ----------------------

-- Total revenue
SELECT SUM(amount) AS total_revenue
FROM chocolate_sales;

-- Average revenue per sale by country
SELECT 
    country,
    ROUND(AVG(amount), 2) AS avg_revenue_per_sale
FROM chocolate_sales
GROUP BY country
ORDER BY avg_revenue_per_sale DESC;

-- Best performing month
SELECT 
    TO_CHAR(DATE_TRUNC('month', sale_date), 'Mon-YYYY') AS month,
    SUM(amount) AS revenue
FROM chocolate_sales
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY revenue DESC
LIMIT 1;

-- Monthly revenue trend
SELECT 
    TO_CHAR(DATE_TRUNC('month', sale_date), 'Mon-YYYY') AS month,
    SUM(amount) AS revenue
FROM chocolate_sales
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY DATE_TRUNC('month', sale_date);

-- ----------------------
-- PRODUCT ANALYSIS
-- ----------------------

-- Top 10 products by revenue
SELECT product, SUM(amount) AS revenue
FROM chocolate_sales
GROUP BY product
ORDER BY revenue DESC
LIMIT 10;

-- Revenue per box by product
SELECT 
    product,
    SUM(boxes_shipped) AS total_boxes,
    SUM(amount) AS total_revenue,
    ROUND(SUM(amount) / SUM(boxes_shipped), 2) AS revenue_per_box
FROM chocolate_sales
GROUP BY product
ORDER BY revenue_per_box DESC;

-- Most consistent product across countries
SELECT product, COUNT(DISTINCT country) AS countries_sold_in,
SUM(amount) AS total_revenue
FROM chocolate_sales
GROUP BY product
ORDER BY countries_sold_in DESC, total_revenue DESC
LIMIT 10;

-- ----------------------
-- COUNTRY ANALYSIS
-- ----------------------

-- Top countries by revenue
SELECT country, SUM(amount) AS revenue
FROM chocolate_sales
GROUP BY country
ORDER BY revenue DESC;

-- Most consistent country by revenue variability
SELECT 
    country,
    ROUND(AVG(amount), 2) AS avg_sale,
    ROUND(STDDEV(amount), 2) AS variability
FROM chocolate_sales
GROUP BY country
ORDER BY variability ASC;

-- ----------------------
-- SALESPERSON ANALYSIS
-- ----------------------

-- Top 10 salespeople by revenue
SELECT sales_person, SUM(amount) AS revenue
FROM chocolate_sales
GROUP BY sales_person
ORDER BY revenue DESC
LIMIT 10;

-- Most efficient salespeople (revenue per sale)
SELECT 
    sales_person,
    COUNT(*) AS total_sales,
    SUM(amount) AS total_revenue,
    ROUND(SUM(amount) / COUNT(*), 2) AS revenue_per_sale
FROM chocolate_sales
GROUP BY sales_person
ORDER BY revenue_per_sale DESC
LIMIT 5;

-- Salesperson territory count
SELECT sales_person, COUNT(DISTINCT country) AS territories
FROM chocolate_sales
GROUP BY sales_person
ORDER BY territories DESC
LIMIT 5;

-- Does more territory mean more sales?
SELECT 
    sales_person,
    COUNT(DISTINCT country) AS territories,
    COUNT(*) AS total_sales
FROM chocolate_sales
GROUP BY sales_person
ORDER BY territories DESC, total_sales DESC;

-- Does more sales mean more revenue?
SELECT 
    sales_person,
    COUNT(*) AS total_sales,
    SUM(amount) AS revenue
FROM chocolate_sales
GROUP BY sales_person
ORDER BY total_sales DESC;

-- Top salesperson per country
SELECT DISTINCT ON (country)
    country,
    sales_person,
    SUM(amount) AS revenue
FROM chocolate_sales
GROUP BY country, sales_person
ORDER BY country, revenue DESC;

-- Worst performing salesperson overall
SELECT sales_person, SUM(amount) AS revenue
FROM chocolate_sales
GROUP BY sales_person
ORDER BY revenue ASC
LIMIT 5;

-- Worst performing salesperson per country
SELECT DISTINCT ON (country)
    country,
    sales_person,
    SUM(amount) AS revenue
FROM chocolate_sales
GROUP BY country, sales_person
ORDER BY country, revenue ASC;

-- ----------------------
-- WILONE O'KIELT DEEP DIVE
-- ----------------------

-- Wilone performance by country
SELECT country, SUM(amount) AS revenue
FROM chocolate_sales
WHERE sales_person = 'Wilone O''Kielt'
GROUP BY country
ORDER BY revenue ASC;

-- Wilone product mix
SELECT product, SUM(boxes_shipped) AS boxes, SUM(amount) AS revenue
FROM chocolate_sales
WHERE sales_person = 'Wilone O''Kielt'
GROUP BY product
ORDER BY revenue DESC;

-- Wilone performance over time
SELECT 
    TO_CHAR(DATE_TRUNC('month', sale_date), 'Mon-YYYY') AS month,
    SUM(amount) AS revenue
FROM chocolate_sales
WHERE sales_person = 'Wilone O''Kielt'
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY DATE_TRUNC('month', sale_date);

-- ----------------------
-- MADELENE UPCOTT DEEP DIVE
-- ----------------------

-- Madelene performance by country
SELECT country, COUNT(*) AS sales, SUM(amount) AS revenue,
ROUND(SUM(amount)/COUNT(*),2) AS revenue_per_sale
FROM chocolate_sales
WHERE sales_person = 'Madelene Upcott'
GROUP BY country
ORDER BY revenue_per_sale DESC;