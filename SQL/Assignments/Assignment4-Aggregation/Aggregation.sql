-- Exercise

-- 4.1 - Write a query that returns the total number of customers and the number with a non-NULL phone value.
SELECT COUNT(c.customer_id) total_customers, COUNT(c.phone)
FROM sales.customers c
WHERE c.phone IS NOT NULL;

-- 4.2 - Group production.products by brand_id and return the product count and average list_price per brand, sorted by average price descending.
SELECT p.brand_id, COUNT(p.product_id) product_count, AVG(p.list_price) avg_price
FROM production.products p
GROUP BY p.brand_id;

-- 4.3 - Using HAVING, find every brand with an average list_price above $1000.
SELECT p.brand_id, AVG(p.list_price) avg_price
FROM production.products p
GROUP BY p.brand_id 
HAVING AVG(p.list_price) > 1000;

-- 4.4 - The following query does not run. Explain the error and fix it:
/*

SELECT customer_id, SUM(list_price) AS total
FROM sales.order_items
WHERE SUM(list_price) > 5000
GROUP BY customer_id;

*/
-- firstly customer_id is not a field in sales.order_items so we need to make a join secondly group by comes before where clause lastly where cannot be used on aggregate colums so we need having clause
SELECT o.customer_id, SUM(oi.list_price) AS total
FROM sales.order_items oi
INNER JOIN sales.orders o
ON o.order_id = oi.order_id
GROUP BY customer_id
HAVING SUM(list_price) > 5000;

-- 4.5 - Write a query that joins sales.orders, sales.order_items, and production.products, then returns total quantity sold per product name, sorted from highest to lowest, limited to the top 10.
SELECT
p.product_name, 
SUM(oi.quantity) total_quantity
FROM sales.orders o
INNER JOIN sales.order_items oi
ON o.order_id = oi.order_id
INNER JOIN production.products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- 4.6 - Think About It: A colleague joins orders to order_items and reports "we received 4,658 orders last year." Explain why this count is likely wrong and write the corrected version.
-- each order can have multiple items so the result is inaccurate as result is duplicated
SELECT COUNT(DISTINCT(o.order_id)) total_orders
FROM sales.orders o
INNER JOIN sales.order_items oi
ON o.order_id = oi.order_id
