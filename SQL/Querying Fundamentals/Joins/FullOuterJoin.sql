-- Full Outer Join
SELECT
    p.product_name,
    s.quantity
FROM production.products AS p
FULL OUTER JOIN production.stocks AS s
    ON p.product_id = s.product_id AND s.store_id = 1;

--
SELECT
    b.brand_name,
    p.product_name
FROM production.brands AS b
FULL OUTER JOIN production.products AS p
    ON b.brand_id = p.brand_id
WHERE p.product_id IS NULL OR b.brand_id IS NULL;