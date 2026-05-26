-- =============================================
-- Chocolate Sales Project
-- Script 2: Data Cleaning
-- =============================================

-- Convert sale_date from text to DATE
ALTER TABLE chocolate_sales
ALTER COLUMN sale_date TYPE DATE
USING sale_date::DATE;

-- Convert amount from text to NUMERIC
ALTER TABLE chocolate_sales
ALTER COLUMN amount TYPE NUMERIC(10,2)
USING amount::NUMERIC(10,2);

-- Validate no nulls
SELECT
    COUNT(*) - COUNT(sales_person)  AS missing_sales_person,
    COUNT(*) - COUNT(country)       AS missing_country,
    COUNT(*) - COUNT(product)       AS missing_product,
    COUNT(*) - COUNT(sale_date)     AS missing_sale_date,
    COUNT(*) - COUNT(amount)        AS missing_amount,
    COUNT(*) - COUNT(boxes_shipped) AS missing_boxes_shipped
FROM chocolate_sales;

-- Validate no duplicates
SELECT sales_person, country, product, sale_date, amount, boxes_shipped,
       COUNT(*) AS duplicate_count
FROM chocolate_sales
GROUP BY sales_person, country, product, sale_date, amount, boxes_shipped
HAVING COUNT(*) > 1;