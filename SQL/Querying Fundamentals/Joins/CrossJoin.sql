-- Cross Join
SELECT
	s.store_name,
	c.category_name
FROM sales.stores s
CROSS JOIN production.categories c;


--
SELECT
    st.store_name,
    b.brand_name
FROM sales.stores AS st
CROSS JOIN production.brands AS b
WHERE st.store_id = 1;