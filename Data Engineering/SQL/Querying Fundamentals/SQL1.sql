-- SELECTIONS
SELECT * FROM production.products;

SELECT * FROM production.brands

-- Alias
SELECT p.product_id, p.product_name, ROUND(p.list_price, 0) FROM production.products p;

-- Mathematical Operation
SELECT p.product_id, p.product_name, p.list_price AS original_price, p.list_price - (p.list_price * 0.2) AS discount_price FROM production.products p;


-- DISTINCT
SELECT DISTINCT p.category_id FROM production.products p;

-- ORDER
SELECT p.product_id, p.product_name, p.list_price, p.category_id FROM production.products p ORDER BY p.list_price DESC, p.category_id ASC;

SELECT p.product_id, p.product_name, p.list_price, p.category_id FROM production.products p ORDER BY p.category_id ASC, p.list_price DESC;

-- LIMITING ROWS
SELECT TOP 3 product_name, list_price
FROM production.products
ORDER BY list_price DESC;

SELECT product_name, list_price
FROM production.products ORDER BY list_price DESC
OFFSET 3 ROWS FETCH NEXT 3 ROWS ONLY;

-- FILTERING WITH WHERE
SELECT * 
FROM sales.orders o
WHERE o.customer_id > 100;


-- FILTERING WITH LOGICAL OPERATORS
SELECT p.product_name, p.category_id, p.list_price 
FROM production.products p
WHERE p.category_id = 6 OR p.category_id = 3 AND p.list_price < 1000;






