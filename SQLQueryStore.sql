-- 1
SELECT
SUM(CASE WHEN name = 'Revo' THEN price * quantity * (1 - discount / 100) ELSE 0 END) AS total_revo_revenue,
SUM(CASE WHEN name = 'Marlboro' THEN price * quantity * (1 - discount / 100) ELSE 0 END) AS total_marlboro_revenue,
SUM(CASE WHEN name IN ('Revo', 'Marlboro') THEN price * quantity * (1 - discount / 100) ELSE 0 END) AS total_combined_revenue
FROM Product WHERE name IN ('Revo', 'Marlboro');

-- 2
SELECT name product, date_of_delivery, quantity FROM Product
WHERE date_of_delivery >= DATEADD(day, -1, GETDATE())
AND date_of_delivery < DATEADD(day, 1, GETDATE())
AND quantity > 10;

-- 3
SELECT name product, price FROM Product
WHERE date_of_delivery >= DATEADD(month, -1, GETDATE());

-- 4
SELECT name, price FROM Product
WHERE category = 'Meat' AND supplier <> 'Meat Co.';

-- 5
SELECT * FROM Product
WHERE name LIKE 'S%' AND category LIKE '%A%';

-- 6
SELECT * FROM Product
WHERE name >= 'C' AND name <= 'E';

-- 7
SELECT * FROM Product
WHERE price < 50 AND date_of_delivery BETWEEN '2023-05-01' AND DATEADD(DAY, -1, GETDATE());

-- 8
SELECT * FROM Product
WHERE category = 'Beverages' AND quantity > 100;

-- 9
SELECT *
FROM Product
WHERE price >= 100 AND price <= 200
ORDER BY price ASC;

-- 10
UPDATE Product
SET price = price * 0.95;

-- 11
UPDATE Product
SET date_of_delivery = GETDATE()
WHERE date_of_delivery IS NULL;

-- 12
DELETE FROM Product
WHERE quantity < 100 AND price > 70;

-- 13
DELETE FROM Product
WHERE category = 'Meat' OR category = 'Snacks';

-- 14
DELETE FROM Product
WHERE LEN(name) = 5;

-- 15
DELETE FROM Product
WHERE date_of_delivery IS NULL OR discount > 10;

-- 16
DELETE FROM Product
WHERE date_of_delivery < DATEADD(MONTH, -3, GETDATE());

-- 17
DELETE FROM Product
WHERE supplier IS NULL OR discount > 10;