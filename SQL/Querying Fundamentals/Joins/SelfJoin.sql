-- Self Join
SELECT
    e.first_name + ' ' + e.last_name AS employee,
    m.first_name + ' ' + m.last_name AS manager
FROM sales.staffs AS e
LEFT JOIN sales.staffs AS m
    ON e.manager_id = m.staff_id;

--
SELECT
    c1.first_name + ' ' + c1.last_name AS customer_a,
    c2.first_name + ' ' + c2.last_name AS customer_b,
    c1.city
FROM sales.customers AS c1
INNER JOIN sales.customers AS c2
    ON c1.city = c2.city AND c1.customer_id < c2.customer_id;