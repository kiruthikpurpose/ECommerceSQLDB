-- Step 1: Create the Database and use it
CREATE DATABASE EcommerceDB;
USE EcommerceDB;

-- Step 2: Create the Customers Table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    Country VARCHAR(50)
);

-- Step 3: Create the Products Table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL
);

-- Step 4: Create the Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Step 5: Create the OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Step 6: Insert Sample Data into Customers Table
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, City, State, ZipCode, Country)
VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street', 'Springfield', 'IL', '62701', 'USA'),
('Jane', 'Smith', 'jane.smith@example.com', '555-789-1234', '456 Oak Avenue', 'Springfield', 'IL', '62701', 'USA');

-- Step 7: Insert Sample Data into Products Table
INSERT INTO Products (ProductName, Category, Price, Stock)
VALUES
('Laptop', 'Electronics', 999.99, 50),
('Smartphone', 'Electronics', 499.99, 100),
('Tablet', 'Electronics', 299.99, 75);

-- Step 8: Insert Sample Data into Orders Table
INSERT INTO Orders (OrderDate, CustomerID, TotalAmount)
VALUES
('2024-07-01', 1, 1499.97),
('2024-07-02', 2, 299.99);

-- Step 9: Insert Sample Data into OrderDetails Table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES
(1, 1, 1, 999.99),
(1, 2, 1, 499.99),
(2, 3, 1, 299.99);

-- Step 10: Query to Retrieve All Customers
SELECT * FROM Customers;

-- Step 11: Query to Retrieve All Products
SELECT * FROM Products;

-- Step 12: Query to Retrieve Orders with Customer Details
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName, Orders.TotalAmount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- Step 13: Query to Retrieve Order Details with Product Information
SELECT OrderDetails.OrderDetailID, Orders.OrderID, Products.ProductName, OrderDetails.Quantity, OrderDetails.Price
FROM OrderDetails
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID;
