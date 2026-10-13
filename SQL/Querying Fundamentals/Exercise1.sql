-- Exercise
-- 1.1 Write a query that selects product_name, list_price, and a calculated column price_in_thousands (list_price divided by 1000) from production.products.
SELECT p.product_name, p.list_price,
p.list_price / 1000 price_in_thousand
FROM production.products p

-- 1.2 Write a query that returns the distinct list of state values from sales.customers.
SELECT DISTINCT(c.state) FROM sales.customers c;

-- 1.3 Write a query that returns the 5 cheapest products, showing product_name and list_price, sorted appropriately.
SELECT p.product_name, p.list_price 
FROM production.products p 
ORDER BY 2 OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- 1.4 Write a query that returns products priced between 200 and 600, where the category is either 1 or 6. Use BETWEEN and IN together.
SELECT p.product_name FROM production.products p WHERE p.list_price
BETWEEN 200 AND 600 AND p.category_id IN (1, 6);

-- 1.5 The following query is meant to find affordable mountain or road bikes (categories 1 and 6) under $1000, but it has a bug. Identify it and rewrite it correctly:
SELECT product_name, category_id, list_price
FROM production.products
WHERE category_id = 1 OR category_id = 6 AND list_price < 1000;
-- The bug in the query is caused by operator precedence. In SQL, the AND operator takes precedence over the OR operator.
SELECT product_name, category_id, list_price
FROM production.products
WHERE (category_id = 1 OR category_id = 6) 
  AND list_price < 1000;

-- 1.6 Write a query that finds all customers whose email ends in .com and whose last_name starts with the letter "M".
SELECT * FROM sales.customers c WHERE c.email LIKE '%.com' AND c.last_name LIKE 'M%'

-- 1.7. Write a query that returns the 11th through 20th most expensive products using OFFSET...FETCH.
SELECT * FROM production.products p ORDER BY list_price DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

-- 1.8 Think About It: A junior engineer writes WHERE discount <> NULL to find order items with a defined discount, and the query returns zero rows even though the table clearly has non-null discount values. Explain why, using three-valued logic, and write the correct version.
-- Any standard comparison operator used with NULL (such as =, <>, <, >, or !=) automatically evaluates to UNKNOWN rather than TRUE or FALSE.
SELECT * FROM sales.order_items oi WHERE oi.discount IS NOT NULL;