#1 creating the database
CREATE DATABASE superstore;
USE superstore;

CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(50),
    sub_category VARCHAR(50)
);

CREATE TABLE orders (
    order_id VARCHAR(20),
    row_id INT PRIMARY KEY,
    customer_id VARCHAR(20),
    product_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    quantity INT,
    sales DECIMAL(10,2),
    discount DECIMAL(4,2),
    profit DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
# Question 1: Top 5 customers by revenue
SELECT 
    c.customer_name,
    c.segment,
    c.region,
    ROUND(SUM(o.sales), 2) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name, c.segment, c.region
ORDER BY total_revenue DESC
LIMIT 5;
#Question 2: Monthly sales trend
SELECT 
    YEAR(order_date)  AS year,
    MONTH(order_date) AS month,
    MONTHNAME(order_date) AS month_name,
    ROUND(SUM(sales), 2) AS monthly_sales,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(profit), 2) AS monthly_profit
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date), MONTHNAME(order_date)
ORDER BY year, month;
#Question 3: Repeat vs new customers
WITH customer_order_counts AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders
    FROM orders
    GROUP BY customer_id
),
customer_type AS (
    SELECT
        customer_id,
        total_orders,
        CASE 
            WHEN total_orders = 1 THEN 'New Customer'
            ELSE 'Repeat Customer'
        END AS customer_type
    FROM customer_order_counts
)
SELECT
    customer_type,
    COUNT(*) AS num_customers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM customer_type
GROUP BY customer_type;
