# Customer Order Analysis
This repository shows us how to extract customer order insights in the easiest way possible by SQL.

📌 Project Overview

This project demonstrates SQL skills for data analysis using a simple customer orders dataset. It includes table creation, data insertion, and analytical queries to extract business insights such as top customers, product sales, and regional trends.

The goal is to showcase proficiency in SQL joins, aggregations, and grouping operations.

📂 Dataset

The project uses two tables:
1. Orders table
2. Customers table

Files included:
1. [orders_table.csv](https://github.com/user-attachments/files/22198075/orders_table.csv)
2. [CustomerOrderAnalysis_script.sql](https://github.com/user-attachments/files/22198078/CustomerOrderAnalysis_script.sql)

Queries Implemented:
1. Top 3 customers by total spending- 
  SELECT c.Name, SUM(o.Quantity * o.Price) AS TotalSpent
  FROM Customers c
  JOIN Orders o ON c.CustomerID = o.CustomerID
  GROUP BY c.Name
  ORDER BY TotalSpent DESC
  LIMIT 3;

2. Total sales per product
   SELECT product, SUM( quantity*price) AS TotalSales
  FROM orders
  GROUP BY product
  ORDER BY TotalSales DESC;

3. Total orders by region
  SELECT c.region, count(o.orderID) AS TotalOrders
  FROM customers c
  JOIN orders o ON c.customerID = o.customerID
  GROUP BY c.region
  ORDER BY TotalOrders DESC;

4. Average order value per customer
  SELECT c.first_name, last_name, ROUND(AVG(o.quantity * o.price), 3) AS AvgOrderValue 
  FROM customers c
  JOIN orders o ON c.customerID = o.customerID
  GROUP BY c.first_name, last_name
  ORDER BY AvgOrderValue DESC;

5. Orders placed in August 2025
   SELECT * FROM orders
WHERE order_date BETWEEN '25-08-01' AND '25-08-31';

6. Cheapest product
   SELECT product, price
  FROM orders
  ORDER BY price ASC
  LIMIT 1;

7. Most expensive product
  SELECT product, price
  FROM orders
  ORDER BY price DESC
  LIMIT 1;
