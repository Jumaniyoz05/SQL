create database hom_15

use hom_15

CREATE TABLE Numbers1(Number INT)

INSERT INTO Numbers1 VALUES (5),(9),(8),(6),(7)

CREATE TABLE FindSameCharacters
(
     Id INT
    ,Vals VARCHAR(10)
)
 
INSERT INTO FindSameCharacters VALUES
(1,'aa'),
(2,'cccc'),
(3,'abc'),
(4,'aabc'),
(5,NULL),
(6,'a'),
(7,'zzz'),
(8,'abc')



CREATE TABLE RemoveDuplicateIntsFromNames
(
      PawanName INT
    , Pawan_slug_name VARCHAR(1000)
)
 
 
INSERT INTO RemoveDuplicateIntsFromNames VALUES
(1,  'PawanA-111'  ),
(2, 'PawanB-123'   ),
(3, 'PawanB-32'    ),
(4, 'PawanC-4444' ),
(5, 'PawanD-3'  )





CREATE TABLE Example
(
Id       INTEGER IDENTITY(1,1) PRIMARY KEY,
String VARCHAR(30) NOT NULL
);


INSERT INTO Example VALUES('123456789'),('abcdefghi');


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
(1, 1, 'John', 'Doe', 60000.00),
(2, 1, 'Jane', 'Smith', 65000.00),
(3, 2, 'James', 'Brown', 70000.00),
(4, 3, 'Mary', 'Johnson', 75000.00),
(5, 4, 'Linda', 'Williams', 80000.00),
(6, 2, 'Michael', 'Jones', 85000.00),
(7, 1, 'Robert', 'Miller', 55000.00),
(8, 3, 'Patricia', 'Davis', 72000.00),
(9, 4, 'Jennifer', 'García', 77000.00),
(10, 1, 'William', 'Martínez', 69000.00);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'Finance'),
(5, 'IT'),
(6, 'Operations'),
(7, 'Customer Service'),
(8, 'R&D'),
(9, 'Legal'),
(10, 'Logistics');

CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    EmployeeID INT,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SaleDate DATE
);
INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES
-- January 2025
(1, 1, 1, 1550.00, '2025-01-02'),
(2, 2, 2, 2050.00, '2025-01-04'),
(3, 3, 3, 1250.00, '2025-01-06'),
(4, 4, 4, 1850.00, '2025-01-08'),
(5, 5, 5, 2250.00, '2025-01-10'),
(6, 6, 6, 1450.00, '2025-01-12'),
(7, 7, 1, 2550.00, '2025-01-14'),
(8, 8, 2, 1750.00, '2025-01-16'),
(9, 9, 3, 1650.00, '2025-01-18'),
(10, 10, 4, 1950.00, '2025-01-20'),
(11, 1, 5, 2150.00, '2025-02-01'),
(12, 2, 6, 1350.00, '2025-02-03'),
(13, 3, 1, 2050.00, '2025-02-05'),
(14, 4, 2, 1850.00, '2025-02-07'),
(15, 5, 3, 1550.00, '2025-02-09'),
(16, 6, 4, 2250.00, '2025-02-11'),
(17, 7, 5, 1750.00, '2025-02-13'),
(18, 8, 6, 1650.00, '2025-02-15'),
(19, 9, 1, 2550.00, '2025-02-17'),
(20, 10, 2, 1850.00, '2025-02-19'),
(21, 1, 3, 1450.00, '2025-03-02'),
(22, 2, 4, 1950.00, '2025-03-05'),
(23, 3, 5, 2150.00, '2025-03-08'),
(24, 4, 6, 1700.00, '2025-03-11'),
(25, 5, 1, 1600.00, '2025-03-14'),
(26, 6, 2, 2050.00, '2025-03-17'),
(27, 7, 3, 2250.00, '2025-03-20'),
(28, 8, 4, 1350.00, '2025-03-23'),
(29, 9, 5, 2550.00, '2025-03-26'),
(30, 10, 6, 1850.00, '2025-03-29'),
(31, 1, 1, 2150.00, '2025-04-02'),
(32, 2, 2, 1750.00, '2025-04-05'),
(33, 3, 3, 1650.00, '2025-04-08'),
(34, 4, 4, 1950.00, '2025-04-11'),
(35, 5, 5, 2050.00, '2025-04-14'),
(36, 6, 6, 2250.00, '2025-04-17'),
(37, 7, 1, 2350.00, '2025-04-20'),
(38, 8, 2, 1800.00, '2025-04-23'),
(39, 9, 3, 1700.00, '2025-04-26'),
(40, 10, 4, 2000.00, '2025-04-29'),
(41, 1, 5, 2200.00, '2025-05-03'),
(42, 2, 6, 1650.00, '2025-05-07'),
(43, 3, 1, 2250.00, '2025-05-11'),
(44, 4, 2, 1800.00, '2025-05-15'),
(45, 5, 3, 1900.00, '2025-05-19'),
(46, 6, 4, 2000.00, '2025-05-23'),
(47, 7, 5, 2400.00, '2025-05-27'),
(48, 8, 6, 2450.00, '2025-05-31'),
(49, 9, 1, 2600.00, '2025-06-04'),
(50, 10, 2, 2050.00, '2025-06-08'),
(51, 1, 3, 1550.00, '2025-06-12'),
(52, 2, 4, 1850.00, '2025-06-16'),
(53, 3, 5, 1950.00, '2025-06-20'),
(54, 4, 6, 1900.00, '2025-06-24'),
(55, 5, 1, 2000.00, '2025-07-01'),
(56, 6, 2, 2100.00, '2025-07-05'),
(57, 7, 3, 2200.00, '2025-07-09'),
(58, 8, 4, 2300.00, '2025-07-13'),
(59, 9, 5, 2350.00, '2025-07-17'),
(60, 10, 6, 2450.00, '2025-08-01');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES
(1, 1, 'Laptop', 1000.00),
(2, 1, 'Smartphone', 800.00),
(3, 2, 'Tablet', 500.00),
(4, 2, 'Monitor', 300.00),
(5, 3, 'Headphones', 150.00),
(6, 3, 'Mouse', 25.00),
(7, 4, 'Keyboard', 50.00),
(8, 4, 'Speaker', 200.00),
(9, 5, 'Smartwatch', 250.00),
(10, 5, 'Camera', 700.00);



--1 Create a numbers table using a recursive query from 1 to 1000.
--1 dan 1000 gacha raqamlar jadvalini rekursiv so'rovdan foydalangan holda yarating.
;WITH CTE AS(
SELECT 1 AS NUMBER
UNION ALL
SELECT NUMBER + 1 FROM CTE WHERE NUMBER < 1000
)
SELECT * FROM CTE OPTION (MAXRECURSION 5000)
--2Write a query to find the total sales per employee using a derived table.(Sales, Employees)
--Bir xodim uchun jami savdoni topish uchun hosil qilingan jadvaldan foydalanib so'rov yozing. (Savdolar, Xodimlar)


select Employees.FirstName, sum(Sales.SalesAmount )as sum_sales from Employees join Sales on Employees.EmployeeID= Sales.EmployeeID
group by Employees.FirstName

-- 3 Create a CTE to find the average salary of employees.(Employees)
--Ishchilar (Employees) o'rtacha maoshini topish uchun CTE yarating.

;with CTE as(
select FirstName ,avg(salary) AS AVG_SALARY from Employees
group by FirstName
)
select * from cte

--4 Write a query using a derived table to find the highest sales for each product.(Sales, Products)
--Har bir mahsulot uchun eng yuqori savdoni topish uchun olingan jadvaldan foydalanib so'rov yozing. (Savdolar, Mahsulotlar)

;with CTE AS (
select Products.ProductName, max(Sales.SalesAmount) as max_sales from Products join Sales on Products.ProductID=Sales.ProductID
group by Products.ProductName)
select * from CTE

--5 Beginning at 1, write a statement to double the number for each record, the max value you get should be less than 1000000.
--1-dan boshlang, har bir yozuv uchun raqamini ikki baravar oshiradigan bir bayonot yozing, siz oladigan maksimal qiymat 1000000 dan kam bo'lishi kerak.
;with CTE AS (
select 1 as  num
UNION ALL
select num *2 from CTE WHERE NUM <1000000)
SELECT * FROM CTE

--6     Use a CTE to get the names of employees who have made more than 5 sales.(Sales, Employees)
--5 tadan ortiq savdo qilgan xodimlarning ismlarini olish uchun CTE dan foydalaning. (Savdo, Xodimlar)
SELECT * FROM Sales
SELECT * FROM Employees 
;WITH CTE AS (
SELECT FirstName,COUNT(SALESID)AS COUNT_SALAS  FROM Employees AS E JOIN Sales ON E.EmployeeID=Sales.EmployeeID
GROUP BY FirstName
)
SELECT  * FROM CTE WHERE COUNT_SALAS> 5


--7 Write a query using a CTE to find all products with sales greater than $500.(Sales, Products)
--500 dollardan yuqori savdoga ega bo'lgan barcha mahsulotlarni topish uchun CTE dan foydalanib so'rov yozing.(Savdolar, Mahsulotlar)


;WITH CTE AS (
SELECT Products.ProductName,SUM(Price)AS SUM_S  FROM Products JOIN Sales ON Products.ProductID=Sales.ProductID
GROUP BY Products.ProductName)
SELECT * FROM CTE 
WHERE SUM_S>500

--8 Create a CTE to find employees with salaries above the average salary.(Employees)
--O'rtacha maoshdan yuqori bo'lgan xodimlarni topish uchun CTE yarating. (Xodimlar)
;WITH CTE AS (
SELECT   AVG(SALARY) AS AVG_S FROM Employees
)
SELECT FirstName,Salary FROM Employees JOIN CTE ON Employees.Salary>CTE.AVG_S

      -- MEDIUM
--1 Write a query using a derived table to find the top 5 employees by the number of orders made.(Employees, Sales)
--Buyurtma soni bo'yicha eng yaxshi 5 nafar xodimni topish uchun olingan jadvaldan foydalanib so'rov yozing. (Xodimlar, Savdo)

SELECT FirstName, COUNT(SalesID) AS COUNT_SS FROM Employees E JOIN Sales S ON E.EmployeeID=S.EmployeeID
GROUP BY FirstName
SELECT TOP 5 FIRSTNAME ,COUNT_SS  FROM (SELECT FirstName, COUNT(SalesID) AS COUNT_SS FROM Employees E JOIN Sales S ON E.EmployeeID=S.EmployeeID
GROUP BY FirstName) AS JJ

--2 Write a query using a derived table to find the sales per product category.(Sales, Products)
--Mahsulot toifasiga qarab savdolarni topish uchun olingan jadvaldan foydalanib so'rov yozing.(Savdolar, Mahsulotlar)

SELECT 
    p.CategoryID,
    SUM(sales_by_product.TotalSales) AS TotalCategorySales
FROM (
    SELECT 
        ProductID, 
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
) sales_by_product
JOIN Products p ON sales_by_product.ProductID = p.ProductID
GROUP BY p.CategoryID
ORDER BY p.CategoryID;

--Write a script to return the factorial of each value next to it.(Numbers1)
--Har bir qiymatning faktorialini qaytaradigan skript yozing.(Sonlar1/'
)
SELECT * FROM NUMBERS1

;with CTE AS (
select 1 as  num
UNION ALL
select num *(num+1) from CTE WHERE NUM <100000)
SELECT * FROM CTE

--Use a CTE to calculate the sales difference between the current month and the previous month.(Sales)
select * from Sales


;with  cte as (
select sum ( salesamount)as sum_s, month(saledate) as month_s from Sales
group by month(saledate)
)
select   (cte.sum_s-c.sum_s ) as farq from cte full join cte as c on cte.month_s=c.month_s+1
 where (cte.sum_s-c.sum_s )is not null

 --Create a derived table to find employees with sales over $45000 in each quarter.(Sales, Employees)
 --Har bir chorakda 45000 dollar yoki undan yuqori savdoga ega xizmatkorlarni topish uchun hosil qilingan jadval yarating. (Savdo, Xodimlar)
 select * from Sales
  select * from Employees


  select quarter(200)




 SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName
FROM Employees e
JOIN (
    -- Bu yerda har chorak bo‘yicha savdosi 45000 dan oshgan xodimlar olinmoqda
    SELECT 
        EmployeeID 
    FROM (
        SELECT 
            EmployeeID,
            QUARTER(SaleDate) AS Quarter,
            SUM(SalesAmount) AS TotalSales
        FROM Sales
        WHERE YEAR(SaleDate) = 2025
        GROUP BY EmployeeID, QUARTER(SaleDate)
        HAVING SUM(SalesAmount) > 45000
    ) AS QuarterlySales
    GROUP BY EmployeeID
    HAVING COUNT(DISTINCT Quarter) = 4
) AS QualifiedEmployees
ON e.EmployeeID = QualifiedEmployees.EmployeeID;

CREATE FUNCTION dbo.Fibonacci (@n INT)
RETURNS INT
AS
BEGIN
    IF @n <= 1
        RETURN @n;
    RETURN dbo.Fibonacci(@n - 1) + dbo.Fibonacci(@n - 2);
END;

SELECT *
FROM YourTable
WHERE LEN(YourColumn) > 1
  AND LEN(YourColumn) = LEN(REPLACE(YourColumn, LEFT(YourColumn, 1), ''));



DECLARE @n INT = 5;
WITH Numbers AS (
    SELECT 1 AS num, CAST('1' AS VARCHAR(MAX)) AS seq
    UNION ALL
    SELECT num + 1, seq + CAST(num + 1 AS VARCHAR)
    FROM Numbers
    WHERE num + 1 <= @n
)

SELECT seq
FROM Numbers
OPTION (MAXRECURSION 1000);
SELECT e.EmployeeID, e.EmployeeName, s.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(Amount) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
    GROUP BY EmployeeID
) s ON e.EmployeeID = s.EmployeeID
WHERE s.TotalSales = (
    SELECT MAX(TotalSales)
    FROM (
        SELECT EmployeeID, SUM(Amount) AS TotalSales
        FROM Sales
        WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
        GROUP BY EmployeeID
    ) x
);



-- Step-by-step table-splitting + frequency counting
WITH SplitValues AS (
    SELECT value, COUNT(*) AS cnt
    FROM (
        SELECT value = TRIM(value)
        FROM YourTable
        CROSS APPLY STRING_SPLIT(YourStringColumn, ',')
    ) AS Values
    GROUP BY value
    HAVING COUNT(*) > 1
)
SELECT STRING_AGG(value, ',') AS CleanedString
FROM SplitValues;
