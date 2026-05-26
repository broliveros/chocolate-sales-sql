-- =============================================
-- Chocolate Sales Project
-- Script 1: Create Table
-- =============================================

CREATE TABLE chocolate_sales (
    id            SERIAL PRIMARY KEY,
    sales_person  VARCHAR(100),
    country       VARCHAR(100),
    product       VARCHAR(150),
    sale_date     VARCHAR(20),
    amount        VARCHAR(20),
    boxes_shipped INTEGER
);