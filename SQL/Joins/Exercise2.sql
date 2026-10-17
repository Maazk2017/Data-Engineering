-- Exercises

-- The fan out problem
SELECT
    o.order_id,
    o.order_date,
    oi.product_id,
    oi.quantity
FROM sales.orders AS o
INNER JOIN sales.order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.order_id = 1;

-- Wrong: counts line items, not orders
SELECT COUNT(*) AS total_orders
FROM sales.orders AS o
INNER JOIN sales.order_items AS oi ON o.order_id = oi.order_id;

-- Correct 
SELECT COUNT(DISTINCT(o.order_id)) AS total_orders
FROM sales.orders AS o
INNER JOIN sales.order_items AS oi ON o.order_id = oi.order_id;

-- 2.1 . Write a query that lists every product with its brand name, using production.products and production.brands.
SELECT
	p.product_name,
	b.brand_name
FROM production.products p
INNER JOIN production.brands b
ON p.brand_id = b.brand_id;

-- 2.2  Using a LEFT JOIN, write a query that finds every store with zero staff currently assigned to it.
SELECT 
	s.store_name, 
	s.store_id,
	s.state,
	s.street
FROM sales.stores s
LEFT JOIN sales.staffs st
ON s.store_id = st.store_id
WHERE st.staff_id IS NULL;

-- 2.3. Explain, in your own words, why the following query returns every product regardless of stock level, and rewrite it so that it only returns products with fewer than 5 units in stock at store 1:

SELECT p.product_name, s.quantity, s.store_id
FROM production.products AS p
LEFT JOIN production.stocks AS s
    ON p.product_id = s.product_id AND s.quantity < 5 AND s.store_id = 1;

-- because left join give every thing from the left table SO use inner join
SELECT p.product_name, s.quantity, s.store_id
FROM production.products AS p
INNER JOIN production.stocks AS s
    ON p.product_id = s.product_id AND s.quantity < 5 AND s.store_id = 1;

-- 2.4. Write a self join on sales.staffs that lists every manager along with a count placeholder column showing 1 for each employee they manage (you will replace this with a real COUNT in Chapter 3); for now, just produce one row per employee-manager pair.
SELECT
	s1.staff_id employee_id,
	s1.first_name || ' ' || s1.last_name AS employee_full_name,
	s1.manager_id AS employee_kay_manager_ki_id,

	s2.staff_id manager_id,
	s2.first_name || ' ' || s2.last_name AS manager_full_name
FROM sales.staffs s1
LEFT JOIN sales.staffs s2 ON
s1.manager_id = s2.staff_id;

-- 2.5. Write a three-table join across sales.orders, sales.order_items, and production.products that lists every item in order #1, including product name and quantity.
SELECT 
	oi.item_id,
	p.product_name,	
	oi.quantity
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN production.products p ON oi.product_id = p.product_id
WHERE o.order_id = 1
ORDER BY 1;


-- 2.6. A colleague joins orders to order_items and reports "we received 4,658 orders last year." Explain what actually went wrong with that number and how you would find the true order count instead.
/*
		If Order #1 has 3 line items, the join returns 3 separate rows for that single order.

		Running a plain COUNT(*) on that joined result counts total line items, not unique
		orders. The number 4,658 represents the total quantity of items ordered across all
		transactions last year, massively 
		inflating the actual order count because orders with multiple items were counted multiple 
		times.

*/

-- 2.7 Think About It: CROSS JOIN is often considered dangerous because it can
-- accidentally produce millions of rows from two innocent-looking tables.
-- Under what real circumstances would you deliberately want a CROSS JOIN, 
--and how would you guard against using one by accident, for example, by forgetting 
--an ON clause that was meant to be there?


/*
Filling Gaps in Time-Series or Matrix Reports: 
If you want to generate a sales report that shows every product alongside every 
month of the year—even months where a product had zero sales—you cross-join a
distinct list of 
products with a distinct list of months, then LEFT JOIN your actual sales data against it.

*/
