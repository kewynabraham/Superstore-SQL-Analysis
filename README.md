# Superstore Sales Analysis — SQL Case Study

This project explores the Kaggle Superstore dataset using MySQL to answer 
real business questions. The raw CSV was normalised into a 3-table relational 
schema (customers, products, orders) and analysed using advanced SQL techniques. 
Key findings include identifying the top 5 revenue-generating customers, 
uncovering a consistent Q4 sales spike across all four years, and discovering 
that 98.5% of customers are repeat buyers — pointing to strong retention but 
weak new customer acquisition.

## Tools
- MySQL 8.0
- Python 3.11 (for data import)
- Dataset: Kaggle Superstore (9,994 rows)

## Business Questions

### 1. Top 5 Customers by Revenue
Sean Miller was the highest spender at $25,043 across just 5 orders (~$5,000 
average order value). Adrian Barton placed 10 orders but ranked last in the 
group, showing two distinct high-value customer profiles: high order value vs. 
high frequency.

### 2. Monthly Sales Trend
Q4 (September–December) is consistently the strongest period every year. 
November 2017 was the single highest month at $118,447. Year-over-year growth 
is clear — 2014 peaked at ~$81K vs 2017 at ~$118K. July 2014 recorded negative 
profit despite $33K in sales, likely due to heavy discounting.

### 3. Repeat vs New Customers
98.5% of customers are repeat buyers, indicating excellent retention. However, 
only 1.5% are new customers — suggesting the business needs to invest more in 
customer acquisition to sustain long-term growth.

## SQL Skills Used
- JOIN — linking orders to customers and products
- GROUP BY + SUM — aggregating revenue per customer and per month
- Date functions — YEAR(), MONTH(), MONTHNAME()
- CTE (WITH clause) — breaking complex queries into readable steps
- CASE WHEN — classifying customers as new or repeat
- Window Functions — SUM() OVER () for percentage calculation
