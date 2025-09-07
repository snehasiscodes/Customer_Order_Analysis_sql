# Customer_Order_Analysis_sql
This repository shows us how to clean and extract customer order insights in the easiest way possible by SQL.

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
