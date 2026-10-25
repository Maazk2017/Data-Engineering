-- Aggregation

-- COUNT
SELECT COUNT(*) total_rows FROM sales.customers;

SELECT COUNT(c.phone) total_phone_count FROM sales.customers c;

-- SUM & GROUP BY
SELECT c.category_name, SUM(p.list_price) sum_products FROM production.products p
LEFT JOIN production.categories c
ON p.category_id = c.category_id
GROUP BY c.category_name;


-- GROUP BY
SELECT COUNT(phone) phone_number, COUNT(customer_id) customers, city FROM sales.customers
GROUP BY city;

-- HAVING
SELECT
    category_id,
    COUNT(*) AS product_count
FROM production.products
GROUP BY category_id
HAVING COUNT(*) > 50;

-- COUNT(DISTINCT ...)
SELECT COUNT(DISTINCT o.order_id) AS total_orders
FROM sales.orders AS o
INNER JOIN sales.order_items AS oi
    ON o.order_id = oi.order_id;

-- GROUP BY Multiple Columns
SELECT
    category_id,
    brand_id,
    COUNT(*) AS product_count
FROM production.products
GROUP BY category_id, brand_id
ORDER BY category_id, product_count DESC;

-- Aggregating Across Joins
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT o.order_id)                                AS order_count,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount))      AS total_spent
FROM sales.customers AS c
INNER JOIN sales.orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN sales.order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;