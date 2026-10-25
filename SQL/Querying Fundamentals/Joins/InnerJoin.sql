-- INNER JOIN
SELECT p.product_id, p.product_name, p.category_id product_category_id, c.category_id category_category_id,
c.category_name
FROM production.products p
INNER JOIN production.categories c ON
p.category_id = c.category_id;

SELECT
    o.order_id,
    o.order_date,
    s.store_name,
    s.city
FROM sales.orders AS o
INNER JOIN sales.stores AS s
    ON o.store_id = s.store_id
WHERE o.order_id IN (1, 2, 3);


SELECT o.order_id, o.order_date,
s.staff_id,
s.first_name || ' ' || s.last_name AS full_name
FROM sales.orders o
INNER JOIN sales.staffs s
ON o.staff_id = s.staff_id
ORDER BY 2 DESC
OFFSET 500 ROWS FETCH NEXT 500 ROWS ONLY;