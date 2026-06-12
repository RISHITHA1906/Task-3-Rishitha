CREATE DATABASE data_analytics;
CREATE TABLE orders (
OrderID VARCHAR(20),
Date DATE,
CustomerID VARCHAR(20),
Product VARCHAR(50),
Quantity INTEGER,
UnitPrice NUMERIC(10,2),
ShippingAddress TEXT,
PaymentMethod VARCHAR(50),
OrderStatus VARCHAR(50),
TrackingNumber VARCHAR(50),
ItemsInCart INTEGER,
CouponCode VARCHAR(50),
ReferralSource VARCHAR(50),
TotalPrice NUMERIC(10,2)
);

-- STEP 2:
-- IMPORT DATASET INTO orders
--
-- (Use Import/Upload button
-- in PostgreSQL UI)

SELECT *
FROM orders;
SELECT
COUNT(*) AS total_orders
FROM orders;

SELECT
AVG(TotalPrice) AS average_order,
MIN(TotalPrice) AS minimum_order,
MAX(TotalPrice) AS maximum_order,
SUM(TotalPrice) AS total_revenue
FROM orders;

SELECT
Product,
COUNT(*) AS total_orders
FROM orders
GROUP BY Product
ORDER BY total_orders DESC;

SELECT
Product,
SUM(TotalPrice) AS revenue
FROM orders
GROUP BY Product
ORDER BY revenue DESC;

SELECT
TO_CHAR(Date,'YYYY-MM') AS month,
SUM(TotalPrice) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

SELECT
PaymentMethod,
COUNT(*) AS total
FROM orders
GROUP BY PaymentMethod
ORDER BY total DESC;

SELECT
OrderStatus,
COUNT(*) AS orders
FROM orders
GROUP BY OrderStatus
ORDER BY orders DESC;

SELECT
Product,
AVG(Quantity) AS avg_quantity
FROM orders
GROUP BY Product
ORDER BY avg_quantity DESC;

SELECT
COUNT(*) AS coupon_users
FROM orders
WHERE CouponCode IS NOT NULL;

SELECT
ReferralSource,
COUNT(*) AS total_orders
FROM orders
GROUP BY ReferralSource
ORDER BY total_orders DESC;

SELECT
CustomerID,
SUM(TotalPrice) AS total_spent
FROM orders
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;

SELECT *
FROM orders
WHERE TotalPrice >
(
SELECT AVG(TotalPrice)
FROM orders
);

SELECT
Product,
SUM(TotalPrice) AS revenue
FROM orders
GROUP BY Product
HAVING SUM(TotalPrice) > 100000
ORDER BY revenue DESC;

SELECT
OrderID,
Product,
TotalPrice
FROM orders
ORDER BY TotalPrice DESC
LIMIT 5;