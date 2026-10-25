-- Exercises

-- 3.1. Create a view called production.vw_product_catalog that joins products, categories, and brands to show product_name, category_name, brand_name, and list_price in one result.
CREATE VIEW production.vw_product_catalog 
AS 
SELECT p.product_name, c.category_name, b.brand_name, p.list_price 
FROM production.products p
LEFT JOIN production.categories c
ON p.category_id = c.category_id
INNER JOIN production.brands b
ON p.brand_id = b.brand_id;

-- 3.2. Using the view from 5.1, write a query that returns only products under $500, sorted by price ascending.
SELECT *
FROM production.vw_product_catalog p
WHERE p.list_price < 500 ORDER BY p.list_price;

-- 3.3. Create a view sales.vw_customer_contact that exposes only customer_id, first_name, last_name, and city from sales.customers, explicitly excluding email and phone. Explain in one sentence what real-world problem this view solves.
CREATE VIEW sales.vw_customer_contact 
AS
SELECT c.customer_id, c.first_name, c.last_name,
c.city FROM sales.customers c
-- only non sensitive or public data can be viewed phone and email can be spammed on

-- 3.4  Explain why the following view cannot be used in a simple UPDATE statement, and identify exactly which part of its definition causes the restriction:
 /* views involving joins created ambiguity on which table to perform update on the exact cause is
 INNER JOIN sales.customers AS c ON o.customer_id = c.customer_id /*

-- 3.5. A teammate says, "I made this report faster by turning the query into a view." Explain whether this claim is accurate, and what would actually need to happen for a view to improve performance.
-- no as the view only stores the query not the result of the quey so the claim is inaccurate for the view to have better performance it need to be a materialized view


-- 3.6. Think About It: Two different teams each maintain their own version of a "completed orders" query, written independently, six months apart. One filters order_status = 4; the other accidentally filters order_status = 3 after misreading the status codes from Chapter 1. What specific failure does a shared view prevent here that code review and documentation alone do not?
-- people will not need to memorize the status number as the view locks the correct logic in one place