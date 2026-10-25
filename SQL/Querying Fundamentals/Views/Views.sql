-- Views

-- Creating a view
CREATE VIEW sales.vw_customers
AS
SELECT * FROM sales.customers;

-- Querying a view
SELECT * FROM sales.vw_customers;

-- Alter a query
CREATE OR ALTER sales.vw_customers
AS
SELECT c.first_name, c.phone, c.city FROM sales.customers c;

-- Drop a view
DROP VIEW sales.vw_customers;

---
CREATE VIEW production.vw_orders
AS 
SELECT * FROM sales.orders

CREATE VIEW sales.vw_stores
AS
SELECT * FROM sales.stores;

CREATE VIEW production.vw_stocks
AS
SELECT * FROM production.stocks;

CREATE VIEW production.vw_products
AS
SELECT * FROM production.products;

CREATE VIEW production.vw_categories
AS
SELECT * FROM production.categories;

--
