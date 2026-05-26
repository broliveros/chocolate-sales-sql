# 🍫 Chocolate Sales SQL Analysis

## Project Overview
End to end SQL data analytics project using a real world chocolate sales dataset from Kaggle.
Designed to simulate a real data analyst workflow from database setup through to business insights.

**Tools Used:** PostgreSQL, DBeaver, Python (pandas), VS Code

## Dataset
- **Source:** Kaggle, Chocolate Sales Dataset
- **Size:** 3,282 rows
- **Fields:** Sales Person, Country, Product, Date, Amount, Boxes Shipped

## Workflow
1. Set up PostgreSQL database and created table schema
2. Cleaned raw CSV using Python (removed $ signs, commas, renamed columns)
3. Imported clean data into PostgreSQL via DBeaver
4. Validated data (nulls, duplicates, data types)
5. Ran business analysis queries across revenue, products, countries and salespeople

## Key Business Insights

### 💰 Revenue
- Total revenue across all sales: **$19,791,571.86**
- **January 2024** was the best performing month at **$1,013,621**
- **UK** generates the highest average revenue per sale at **$6,302**
- All countries perform within a similar range suggesting a consistent global operation

### 🍫 Products
- **Smooth Silky Salty** is the #1 revenue product at **$1,120,201**
- Top 10 products all sell across every country (6/6), globally distributed portfolio
- **Almond Choco** generates the highest revenue per box at **$43.31** despite not appearing in the top 10 by total revenue, a potentially undermarketed premium product

### 🌍 Countries
- **Australia** is the most predictable market with the lowest sales variability, ideal for stable revenue forecasting
- All 6 countries show similar average revenue per sale, no major regional underperformance

### 👤 Salespeople
- **Madelene Upcott** is the most efficient salesperson at **$7,481 revenue per sale**
- Dominates every market except Australia where her per sale revenue drops to $5,636
- Territory size does not drive revenue,quality of sales matters more than coverage
- More sales volume does not guarantee more revenue, efficiency beats quantity

### ⚠️ Underperformer Spotlight: Wilone O'Kielt
- Lowest overall revenue at **$439,961** despite covering 6 territories
- Weakest markets are Canada ($26,540) and UK ($27,222)
- Core issue is poor product mix, over reliance on low margin products like Drinking Coco ($12/box) while underselling premium products like Almond Choco ($43/box)
- Shows steady year over year growth and consistent seasonal patterns, suggesting the problem is fixable with better product focus

## Folder Structure

    chocolate_project/
    ├── data/
    │   ├── raw/
    │   └── cleaned/
    ├── sql/
    │   ├── 01_create_table.sql
    │   ├── 02_data_cleaning.sql
    │   └── 03_analysis.sql
    └── README.md

## How to Reproduce
1. Clone this repository
2. Set up a PostgreSQL database called `chocolate_project`
3. Run `01_create_table.sql` to create the schema
4. Import `data/cleaned/chocolate_clean.csv` using DBeaver import wizard
5. Run `02_data_cleaning.sql` to convert data types
6. Run `03_analysis.sql` to reproduce all analysis queries