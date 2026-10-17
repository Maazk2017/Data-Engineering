-- Right Join
SELECT
    p.product_name,
    oi.order_id
FROM sales.order_items AS oi
RIGHT JOIN production.products AS p
    ON oi.product_id = p.product_id
WHERE oi.order_id IS NULL;

--
SELECT
    st.store_name,
    s.first_name,
    s.last_name
FROM sales.staffs AS s
RIGHT JOIN sales.stores AS st
    ON s.store_id = st.store_id
    WHERE s.staff_id IS NULL;

-- 
SELECT 
    p.product_name,
    p.product_id,
    s.quantity
FROM production.products p
RIGHT JOIN production.stocks s
ON p.product_id = s.product_id
WHERE s.quantity IS NULL;


