# 🛒 E-Commerce SQL Data Analysis

## 📌 Overview
This project demonstrates **SQL data analysis** on an e-commerce database using **MySQL Workbench**.  
It covers:
- Data extraction with filtering & sorting
- Joins (INNER, LEFT, RIGHT)
- Subqueries
- Aggregate functions (SUM, AVG)
- Views for reusable analysis
- Indexes for performance optimization

---

## 🗂 Dataset
Used 2 SQL files( Data Creation  & Data Insertion from https://github.com/mohammadusman666/E-Commerce-Database-Management-System 

The database contains multiple interconnected tables representing a real-world e-commerce system.

| Table Name       | Description                                                            |
|------------------|------------------------------------------------------------------------|
| **Customer**     | Stores customer details such as name, contact info, and date of birth. |
| **Country**      | Contains country names for address mapping.                            |
| **Province**     | Stores province/region names.                                          |
| **City**         | Stores city names linked to provinces and countries.                   |
| **ZipCode**      | Stores postal codes with location mappings. |
| **Address**      | Stores customer addresses linked to city, province, and country. |
| **Category**     | Contains product category names. |
| **Vendor**       | Stores vendor/shop details. |
| **Product**      | Stores product names and categories. |
| **VendorProduct**| Links vendors to products with price, quantity, and description. |
| **Courier**      | Stores courier/delivery service details. |
| **VendorCourier**| Maps vendors to couriers they use for deliveries. |
| **Orders**       | Stores customer orders with delivery and tracking info. |
| **OrderedProduct**| Stores products included in each order with quantity. |
| **Review**       | Stores customer ratings and feedback for ordered products. |
| **Cart**         | Stores shopping cart info for each customer. |
| **CartProduct**  | Links products to specific customer carts. |

---

## 🛠 Tools Used
- **MySQL Workbench** 🐬
- **MySQL Server**
- SQL language

---

## 📋 Queries Implemented

### 1️⃣ SELECT, WHERE, ORDER BY, GROUP BY
- Retrieved customers from specific locations, sorted alphabetically.  
- Counted the number of products in each category.

---

### 2️⃣ JOINS (INNER, LEFT, RIGHT)
- **INNER JOIN:** Displayed orders along with the customer who placed them.  
- **LEFT JOIN:** Listed all customers, showing order details if available.  
- **RIGHT JOIN:** Listed all vendors with the products they sell.

---

### 3️⃣ Subqueries
- Found products priced **above the average price** in the database.

---

### 4️⃣ Aggregate Functions (SUM, AVG)
- Calculated **total** and **average** quantity ordered per customer.

---

### 5️⃣ Views for Analysis
- Created a view `TopSellingProducts` to quickly check which products sell the most.

---

### 6️⃣ Optimizing Queries with Indexes
- Added indexes on frequently used columns like `CustomerID` in Orders and `ProductID` in VendorProduct to improve query performance.

---


## 📢 Conclusion
This project demonstrates how to effectively **query and analyze** an e-commerce dataset using SQL.  
By applying **joins, subqueries, aggregates, views, and indexes**, we can extract meaningful insights and improve performance. 🚀

---
