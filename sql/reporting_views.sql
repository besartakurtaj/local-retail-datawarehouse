CREATE OR ALTER VIEW vw_total_sales_by_product AS
SELECT
    p.product_id,
    p.product_name,
    SUM(f.total_amount) AS total_sales,
    COUNT(f.sale_id) AS total_orders
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.product_id, p.product_name;

CREATE OR ALTER VIEW vw_total_sales_by_customer_segment AS
SELECT
    c.segment,
    SUM(f.total_amount) AS total_sales,
    COUNT(f.sale_id) AS total_orders
FROM fact_sales f
JOIN dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.segment;

CREATE OR ALTER VIEW vw_total_sales_by_year_month AS
SELECT
    t.year,
    t.month,
    SUM(f.total_amount) AS total_sales,
    COUNT(f.sale_id) AS total_orders
FROM fact_sales f
JOIN dim_time t ON f.time_id = t.time_id
GROUP BY t.year, t.month


CREATE OR ALTER VIEW vw_top_customers AS
SELECT
    c.customer_id,
    c.customer_name,
    SUM(f.total_amount) AS total_sales,
    COUNT(f.sale_id) AS total_orders
FROM fact_sales f
JOIN dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name

CREATE OR ALTER VIEW vw_product_sales_details AS
SELECT
    f.sale_id,
    p.product_name,
    c.customer_name,
    t.date,
    f.quantity,
    f.total_amount
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
JOIN dim_customer c ON f.customer_id = c.customer_id
JOIN dim_time t ON f.time_id = t.time_id;
