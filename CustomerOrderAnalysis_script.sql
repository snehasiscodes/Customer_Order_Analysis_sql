CREATE TABLE customer_table (
	customerID INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	age INT,
	region VARCHAR(20)
    );

CREATE TABLE orders (
	orderID INT,
    customerID INT,
    product VARCHAR(50),
    quantity INT (100),
    price INT,
    order_date DATE
);

#checking if the tables are created
select * from orders;
select * from customers;

INSERT INTO customers
VALUES  ( 1 , "Alice", "Johnson", 28, "West"),
		( 2, "Bob", "Smith", 34, "East"),
        ( 3, "Carol", "Davis", 25, "North"),
        ( 4, "David", "Lee", 40, "South"),
        ( 5, "Eve", "Martinez", 40, "West");


#Top 3 customers by total spending
SELECT c.first_name, last_name, SUM(o.quantity * o.price) AS TotalSpent
FROM customers c
JOIN orders o ON c.customerID = o.customerID
GROUP BY c.first_name, last_name
ORDER BY TotalSpent DESC
LIMIT 3;

#Total sales per product
SELECT product, SUM( quantity*price) AS TotalSales
FROM orders
GROUP BY product
ORDER BY TotalSales DESC;

#Total orders by region
SELECT c.region, count(o.orderID) AS TotalOrders
FROM customers c
JOIN orders o ON c.customerID = o.customerID
GROUP BY c.region
ORDER BY TotalOrders DESC;
 
 #Average order value per customer
SELECT c.first_name, last_name, ROUND(AVG(o.quantity * o.price), 3) AS AvgOrderValue 
FROM customers c
JOIN orders o ON c.customerID = o.customerID
GROUP BY c.first_name, last_name
ORDER BY AvgOrderValue DESC;

#Orders placed in August 2025
SELECT * FROM orders
WHERE order_date BETWEEN '25-08-01' AND '25-08-31';

#Cheapest product 
SELECT product, price
FROM orders
ORDER BY price ASC
LIMIT 1;

#Most expensive product
SELECT product, price
FROM orders
ORDER BY price DESC
LIMIT 1;