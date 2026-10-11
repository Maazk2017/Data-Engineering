-- FILTERING USING BETWEEN
SELECT * FROM production.products
WHERE list_price BETWEEN 500 AND 1000;


-- FILTERING WITH DATES
SELECT order_id, order_date
FROM sales.orders
WHERE order_date BETWEEN '2018-01-01' AND '2018-03-31';

-- FILTERING WITH IN
SELECT order_id, customer_id, order_status 
FROM sales.orders WHERE order_status IN (3, 4) AND order_id IN (1, 2); 

SELECT first_name, last_name
FROM sales.customers
WHERE customer_id IN (
    SELECT customer_id FROM sales.orders WHERE order_status = 4
);

-- PATTERN MATCHING
SELECT product_name, product_id FROM production.products
WHERE product_name LIKE '%rly%'

-- Putting it together
SELECT
    product_name,
    category_id,
    list_price
FROM production.products
WHERE list_price BETWEEN 300 AND 3000
  AND category_id IN (1, 6)
  AND product_name NOT LIKE '%Frame%'
ORDER BY list_price DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;


































