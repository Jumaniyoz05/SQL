CREATE TABLE Products ( ProductID INT, NAME VARCHAR(50),PRICE DECIMAL(10,2))

--Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
SELECT * FROM  Products
INSERT INTO  Products( ProductID , NAME ,PRICE )VALUES (1,'ANNA',23.2),(2, 'JECCC')

INSERT INTO  Products( ProductID , NAME )VALUES (2, 'JECCC')

DROP TABLE Products
CREATE TABLE  Products (ID INT, NAME VARCHAR(50), AGE INT, CITY VARCHAR(50))
INSERT INTO  Products VALUES ('ANNA',22,'LONDON')
DELETE FROM Products
SELECT * FROM  Products
--Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
----CREATE TABLE Categories (
--    CategoryID INT PRIMARY KEY,
--    CategoryName VARCHAR(255) UNIQUE
CREATE TABLE  Categories (ProductID INT IDENTITY, NAME VARCHAR(50), AGE INT NOT NULL, CITY VARCHAR(50) UNIQUE)
SELECT*FROM Categories 
DROP TABLE Categories
CREATE TABLE  Categories (CATEGORIID INT IDENTITY, NAME VARCHAR(50))


SELECT * FROM  Products


--. Use BULK INSERT to import data from a text file into the Products table.
--"C:\Users\Администратор\Downloads\Telegram Desktop\Customers.txt"
BULK INSERT Products
FROM'C:\Users\Администратор\Downloads\Telegram Desktop\Customers.txt'
WITH(
FIRSTROW =2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
-- Explain the differences between PRIMARY KEY and UNIQUE KEY.

CREATE TABLE  Products (ID INT PRIMARY KEY, NAME VARCHAR(50), AGE INT, CITY VARCHAR(50))
INSERT INTO  Products VALUES (1,'ANNA',22,'LONDON')
DELETE FROM Products
SELECT * FROM  Products

INSERT INTO Products VALUES (2,'JACCC',32,'TASHKENT')
INSERT INTO Products VALUES (2,'JAMM',41,'JIZZAX')
INSERT INTO Products VALUES (3,'KELLY',17,'SIRR')

--Add a CHECK constraint to the Products table ensuring Price > 0.
DROP TABLE Products
CREATE TABLE  Products (ID INT PRIMARY KEY, NAME VARCHAR(50), AGE INT CHECK (AGE>17), CITY VARCHAR(50))
INSERT INTO  Products VALUES (1,'ANNA',22,'LONDON')
DELETE FROM Products
SELECT * FROM  Products

INSERT INTO Products VALUES (2,'JACCC',32,'TASHKENT')
INSERT INTO Products VALUES (2,'JAMM',41,'JIZZAX')
INSERT INTO Products VALUES (3,'KELLY',17,'SIRR')

 --Modify the Products table to add a column Stock (INT, NOT NULL).
 DROP TABLE Products
CREATE TABLE  Products (ID INT PRIMARY KEY, NAME VARCHAR(50), AGE, INT CHECK (AGE>17), CITY VARCHAR(50))
INSERT INTO  Products VALUES (1,'ANNA',22,'LONDON')
DELETE FROM Products
SELECT * FROM  Products

INSERT INTO Products VALUES (2,'JACCC',32,'TASHKENT')
INSERT INTO Products VALUES (2,'JAMM',41,'JIZZAX')
INSERT INTO Products VALUES (3,'KELLY',17,'SIRR')
 ALTER TABLE Products
ALTER add Stock INT NOT NULL

DROP TABLE VVVH

CREATE TABLE VVVH (ID INT IDENTITY, NAME VARCHAR(50), Stock INT NOT NULL, CITY VARCHAR(50) unique )

SELECT * FROM VVVH
INSERT INTO VVVH VALUES (NULL, 25, 'Paris')

INSERT INTO VVVH VALUES ('Joh', 5, 'Pari')
INSERT INTO VVVH VALUES ('John', NULL, 'Paris')
-- Use the ISNULL function to replace NULL values in Price column with a 0.
DROP TABLE VVVH

CREATE TABLE VVVH (ID INT IDENTITY, NAME VARCHAR(50), Stock INT NOT NULL, CITY VARCHAR(50) unique )

SELECT * ,ISNULL(NAME, STOCK) FROM VVVH
INSERT INTO VVVH VALUES (NULL, 25, 'Paris')

INSERT INTO VVVH VALUES ('Joh', 5, 'Pari')
INSERT INTO VVVH VALUES ('John', NULL, 'Paris')
DROP TABLE  Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT CHECK (Age >= 18)
)
CREATE TABLE Product (
    ProductID INT IDENTITY(100, 10) PRIMARY KEY,
    ProductName VARCHAR(100)
);
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);
SELECT COALESCE(NULL, NULL, 'Default', 'Another') AS Result; 
SELECT ISNULL(NULL, 'Fallback') AS Result;
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE
	CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
