CREATE DATABASE IF NOT EXISTS OnlineShopping;

USE OnlineShopping;

-- List all customers from Lahore, ordered by Last Name
SELECT FirstName, LastName, Email, Contact
FROM Customer
WHERE Contact LIKE '03%'  -- Assuming contacts starting with 03 are local numbers
ORDER BY LastName ASC;


-- Count number of products in each category
SELECT c.CategoryName, COUNT(p.ProductID) AS TotalProducts
FROM Category c
JOIN Product p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
ORDER BY TotalProducts DESC;


-- INNER JOIN: Orders with customer names
SELECT o.OrderID, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, o.OrderDate
FROM Orders o
INNER JOIN Customer c ON o.CustomerID = c.CustomerID;


-- LEFT JOIN: All customers and their orders (if any)
SELECT c.CustomerID, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, o.OrderID
FROM Customer c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;


-- RIGHT JOIN: All vendors and the products they sell
SELECT v.Name AS VendorName, p.ProductName
FROM Product p
RIGHT JOIN VendorProduct vp ON p.ProductID = vp.ProductID
RIGHT JOIN Vendor v ON vp.VendorID = v.VendorID;


-- Products priced above the average price
SELECT p.ProductName, vp.Price
FROM VendorProduct vp
JOIN Product p ON vp.ProductID = p.ProductID
WHERE vp.Price > (SELECT AVG(Price) FROM VendorProduct);


-- Total and average quantity ordered per customer
SELECT c.CustomerID, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
       SUM(op.Quantity) AS TotalQuantity,
       AVG(op.Quantity) AS AvgQuantity
FROM Orders o
JOIN OrderedProduct op ON o.OrderID = op.OrderID
JOIN Customer c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalQuantity DESC;


-- Create a view for top-selling products
CREATE VIEW TopSellingProducts AS
SELECT p.ProductName, SUM(op.Quantity) AS TotalSold
FROM OrderedProduct op
JOIN VendorProduct vp ON op.VendorProductID = vp.VendorProductID
JOIN Product p ON vp.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC;

-- Check the view
SELECT * FROM TopSellingProducts;

-- Add index to speed up CustomerID lookups in Orders
CREATE INDEX idx_orders_customerid ON Orders(CustomerID);

-- Add index for ProductID in VendorProduct
CREATE INDEX idx_vendorproduct_productid ON VendorProduct(ProductID);