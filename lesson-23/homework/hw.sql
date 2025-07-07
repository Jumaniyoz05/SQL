create database hom_23
CREATE TABLE Dates (
    Id INT,
    Dt DATETIME
);
INSERT INTO Dates VALUES
(1,'2018-04-06 11:06:43.020'),
(2,'2017-12-06 11:06:43.020'),
(3,'2016-01-06 11:06:43.020'),
(4,'2015-11-06 11:06:43.020'),
(5,'2014-10-06 11:06:43.020');

--Ushbu jumboqda siz dt ustunidan oyni ajratib olishingiz va agar mavjud bo'lsa, 
--nol bitta raqamli oyni qo'shishingiz kerak. Iltimos, namuna kiritish va kutilgan natijani tekshiring.
--| Id | Dt                       | MonthPrefixedWithZero  |
--|----|--------------------------|------------------------|
--| 1  | 2018-04-06 11:06:43.020  | 04                     |
--| 2  | 2017-12-06 11:06:43.020  | 12                     |
--| 3  | 2016-01-06 11:06:43.020  | 01                     |
--| 4  | 2015-11-06 11:06:43.020  | 11                     |
--| 5  | 2014-10-06 11:06:43.020  | 10                     |

---
select *,MONTH(Dt) from Dates


CREATE TABLE MyTabel (
    Id INT,
    rID INT,
    Vals INT
);
INSERT INTO MyTabel VALUES
(121, 9, 1), (121, 9, 8),
(122, 9, 14), (122, 9, 0), (122, 9, 1),
(123, 9, 1), (123, 9, 2), (123, 9, 10);

 --2  In this puzzle you have to find out the unique Ids present in the table.
 --You also have to find out the SUM of Max values of vals columns for each Id and RId.
 --For more details please see the sample input and expected output.

--2  Ushbu jumboqda siz jadvalda mavjud noyob identifikatorlarni topishingiz kerak. 
--Bundan tashqari, har bir Id va RId uchun vals ustunlarining Maks qiymatlari yig'indisini topishingiz kerak.
--Batafsil ma'lumot uchun namuna kiritish va kutilgan natijaga qarang.

--| Distinct_Ids | rID | TotalOfMaxVals |
--|--------------|-----|----------------|
--| 3            | 9   | 32             |





SELECT 
    COUNT(DISTINCT Id) AS Distinct_Ids,
    rID,
    SUM(MaxVals) AS TotalOfMaxVals
FROM (
    SELECT 
        Id,
        rID,
        MAX(Vals) AS MaxVals
    FROM 
        MyTabel
    GROUP BY 
        Id, rID
) AS Sub
GROUP BY 
    rID;


	CREATE TABLE TestFixLengths (
    Id INT,
    Vals VARCHAR(100)
);
INSERT INTO TestFixLengths VALUES
(1,'11111111'), (2,'123456'), (2,'1234567'), 
(2,'1234567890'), (5,''), (6,NULL), 
(7,'123456789012345');

--3: Ushbu jumboqda siz kamida 6 ta belgidan va maksimal 10 ta belgidan iborat yozuvlarni olishingiz kerak. 
--Iltimos, kirish namunasi va kutilgan natijaga qarang.

select*
from TestFixLengths
where   len(vals)>=6 and  len(vals)<=10



CREATE TABLE TestMaximum (
    ID INT,
    Item VARCHAR(20),
    Vals INT
);
INSERT INTO TestMaximum VALUES
(1, 'a1',15), (1, 'a2',20), (1, 'a3',90),
(2, 'q1',10), (2, 'q2',40), (2, 'q3',60), (2, 'q4',30),
(3, 'q5',20);

--4: Ushbu jumboqda siz har bir Id uchun maksimal qiymatni topishingiz va keyin ushbu Id va Maksimal qiymat 
--uchun elementni olishingiz kerak. Iltimos, namuna kiritish va kutilgan natijani tekshiring

select * from TestMaximum



SELECT t.ID, t.Item, t.Vals
FROM TestMaximum t
JOIN (
    SELECT ID, MAX(Vals) AS MaxVal
    FROM TestMaximum
    GROUP BY ID
) AS max_vals
ON t.ID = max_vals.ID AND t.Vals = max_vals.MaxVal;


CREATE TABLE SumOfMax (
    DetailedNumber INT,
    Vals INT,
    Id INT
);
INSERT INTO SumOfMax VALUES
(1,5,101), (1,4,101), (2,6,101), (2,3,101),
(3,3,102), (4,2,102), (4,3,102);
--5: In this puzzle you have to first find the maximum value for each Id and DetailedNumber, and then Sum the data using Id only.
--Please check out sample input and expected output.
--Ushbu jumboqda siz avval har bir Id va DetailedNumber uchun maksimal qiymatni topishingiz kerak,
--so'ngra faqat Id yordamida ma'lumotlarni jamlashingiz kerak.
----Iltimos, namuna kiritish va kutilgan natijani tekshiring.
with cte as (
SELECT 
       DetailedNumber,
	   id,
	   max(Vals)as max_

FROM SumOfMax
group by DetailedNumber,
	   id
	   )
select id,sum(max_)as SumofMax from cte
group by id



CREATE TABLE TheZeroPuzzle (
    Id INT,
    a INT,
    b INT
);
INSERT INTO TheZeroPuzzle VALUES
(1,10,4), (2,10,10), (3,1, 10000000), (4,15,15);

--Bu jumboqda siz har bir satr orasidagi a va b ustunlari orasidagi farqni topishingiz kerak 
--va agar farq 0 ga teng boʻlmasa, farqni koʻrsating, yaʼni a – b aks holda 0. 
--Endi bu nolni boʻsh joy bilan almashtirishingiz kerak. Iltimos, namuna kiritish va kutilgan natijani tekshiring.
WITH cte AS (
    SELECT *,
           a - b AS OUTPUT
    FROM TheZeroPuzzle
)
SELECT id,a,b,
       CASE
           WHEN OUTPUT = 0 THEN ''
           ELSE CAST(OUTPUT AS VARCHAR)
       END AS OutputDisplay
FROM cte;


CREATE TABLE TheZeroPuzzle (
    Id INT,
    a INT,
    b INT
);
INSERT INTO TheZeroPuzzle VALUES
(1,10,4), (2,10,10), (3,1, 10000000), (4,15,15);




CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    Product VARCHAR(50),
    Category VARCHAR(50),
    QuantitySold INT,
    UnitPrice DECIMAL(10,2),
    SaleDate DATE,
    Region VARCHAR(50),
    CustomerID INT
);

INSERT INTO Sales (Product, Category, QuantitySold, UnitPrice, SaleDate, Region, CustomerID)
VALUES
('Laptop', 'Electronics', 10, 800.00, '2024-01-01', 'North', 1),
('Smartphone', 'Electronics', 15, 500.00, '2024-01-02', 'North', 2),
('Tablet', 'Electronics', 8, 300.00, '2024-01-03', 'East', 3),
('Headphones', 'Electronics', 25, 100.00, '2024-01-04', 'West', 4),
('TV', 'Electronics', 5, 1200.00, '2024-01-05', 'South', 5),
('Refrigerator', 'Appliances', 3, 1500.00, '2024-01-06', 'South', 6),
('Microwave', 'Appliances', 7, 200.00, '2024-01-07', 'East', 7),
('Washing Machine', 'Appliances', 4, 1000.00, '2024-01-08', 'North', 8),
('Oven', 'Appliances', 6, 700.00, '2024-01-09', 'West', 9),
('Smartwatch', 'Electronics', 12, 250.00, '2024-01-10', 'East', 10),
('Vacuum Cleaner', 'Appliances', 5, 400.00, '2024-01-11', 'South', 1),
('Gaming Console', 'Electronics', 9, 450.00, '2024-01-12', 'North', 2),
('Monitor', 'Electronics', 14, 300.00, '2024-01-13', 'West', 3),
('Keyboard', 'Electronics', 20, 50.00, '2024-01-14', 'South', 4),
('Mouse', 'Electronics', 30, 25.00, '2024-01-15', 'East', 5),
('Blender', 'Appliances', 10, 150.00, '2024-01-16', 'North', 6),
('Fan', 'Appliances', 12, 75.00, '2024-01-17', 'South', 7),
('Heater', 'Appliances', 8, 120.00, '2024-01-18', 'East', 8),
('Air Conditioner', 'Appliances', 2, 2000.00, '2024-01-19', 'West', 9),
('Camera', 'Electronics', 7, 900.00, '2024-01-20', 'North', 10);

--1 Barcha sotishdan olingan umumiy daromad qancha?
--2-Mahsulot birligining o'rtacha narxi qancha?
--3--Qancha savdo operatsiyalari qayd etilgan?

SELECT  sum(QuantitySold*UnitPrice AS total_sales FROM Sales


--2
SELECT Product,avg(UnitPrice)as avg_sales FROM Sales
group by Product
--3
SELECT COUNT(QuantitySold) CUANT_SALES FROM Sales

--4-Bitta tranzaksiyada sotilgan birliklarning eng ko'p soni qancha?
;WITH CTE AS(
SELECT Category,
       COUNT(QuantitySold) CUNT
FROM Sales
GROUP BY Category
)
SELECT  Category,MAX(CUNT) FROM CTE
GROUP BY Category

--Har bir toifada nechta mahsulot sotilgan?
SELECT Category,COUNT(QuantitySold)AS COUNT_ FROM Sales
GROUP BY Category

--What is the total revenue for each region?
--Har bir mintaqa uchun umumiy daromad qancha?
SELECT Region,SUM(QuantitySold)AS TOTAL
FROM Sales
GROUP BY Region

--Sotish sanasi bo'yicha buyurtma qilingan jami daromad miqdorini hisoblang.
SELECT SaleDate,SUM(UnitPrice) AS SUM_ FROM Sales
GROUP BY SaleDate

--How much does each category contribute to total sales revenue?
---Har bir toifa umumiy savdo daromadiga qancha hissa qo'shadi?
SELECT Category,SUM(UnitPrice) AS SUM_ FROM Sales
GROUP BY Category

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Region VARCHAR(50),
    JoinDate DATE
);
INSERT INTO Customers (CustomerName, Region, JoinDate)
VALUES
('John Doe', 'North', '2022-03-01'),
('Jane Smith', 'West', '2023-06-15'),
('Emily Davis', 'East', '2021-11-20'),
('Michael Brown', 'South', '2023-01-10'),
('Sarah Wilson', 'North', '2022-07-25'),
('David Martinez', 'East', '2023-04-30'),
('Laura Johnson', 'West', '2022-09-14'),
('Kevin Anderson', 'South', '2021-12-05'),
('Sophia Moore', 'North', '2023-02-17'),
('Daniel Garcia', 'East', '2022-08-22');

--Barcha sotuvlarni mos keladigan mijozlar nomlari bilan ko'rsating
--Hech qanday xarid qilmagan mijozlarni ro'yxatlang
--Har bir mijozdan olingan umumiy daromadni hisoblang
--Eng ko'p daromad keltirgan mijozni toping
--Bir mijozga to'g'ri keladigan jami sotishni hisoblang

SELECT * FROM Sales
SELECT CustomerName,Product FROM Customers C JOIN Sales S ON C.CustomerID=S.CustomerID

SELECT CustomerName,Product FROM Customers C FULL JOIN Sales S ON C.CustomerID=S.CustomerID
WHERE Product IS NULL

SELECT CustomerName, SUM(QuantitySold*UnitPrice) AS TOTAL_SALARY FROM Customers C FULL JOIN Sales S ON C.CustomerID=S.CustomerID
GROUP BY CustomerName


SELECT TOP 1 CustomerName, SUM(QuantitySold*UnitPrice) AS TOTAL_SALARY FROM Customers C FULL JOIN Sales S ON C.CustomerID=S.CustomerID
GROUP BY CustomerName
ORDER BY SUM(QuantitySold*UnitPrice) DESC


CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    CostPrice DECIMAL(10,2),
    SellingPrice DECIMAL(10,2)
);
INSERT INTO Products (ProductName, Category, CostPrice, SellingPrice)
VALUES
('Laptop', 'Electronics', 600.00, 800.00),
('Smartphone', 'Electronics', 350.00, 500.00),
('Tablet', 'Electronics', 200.00, 300.00),
('Headphones', 'Electronics', 50.00, 100.00),
('TV', 'Electronics', 900.00, 1200.00),
('Refrigerator', 'Appliances', 1100.00, 1500.00),
('Microwave', 'Appliances', 120.00, 200.00),
('Washing Machine', 'Appliances', 700.00, 1000.00),
('Oven', 'Appliances', 500.00, 700.00),
('Gaming Console', 'Electronics', 320.00, 450.00);



--1Hech bo'lmaganda bir marta sotilgan barcha mahsulotlarni sanab o'ting
--Mahsulotlar jadvalida eng qimmat mahsulotni toping
--Sotish narxi o'z toifasidagi o'rtacha sotish narxidan yuqori bo'lgan barcha mahsulotlarni toping


SELECT ProductName,QuantitySold FROM Products P JOIN Sales S ON P.ProductName=S.Product
WHERE QuantitySold>1

SELECT TOP 1 ProductName,MAX(SellingPrice)AS MAX_ FROM Products
GROUP BY ProductName
ORDER BY MAX(SellingPrice) DESC
