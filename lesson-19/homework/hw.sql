create database hom_19
use hom_19
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10,2)
);

CREATE TABLE DepartmentBonus (
    Department NVARCHAR(50) PRIMARY KEY,
    BonusPercentage DECIMAL(5,2)
);

INSERT INTO Employees VALUES
(1, 'John', 'Doe', 'Sales', 5000),
(2, 'Jane', 'Smith', 'Sales', 5200),
(3, 'Mike', 'Brown', 'IT', 6000),
(4, 'Anna', 'Taylor', 'HR', 4500);

INSERT INTO DepartmentBonus VALUES
('Sales', 10),
('IT', 15),
('HR', 8);

CREATE PROC Employee_Bonus_Calculator
AS
BEGIN

    CREATE TABLE #EmployeeBonus (EmployeeID INT, FullName VARCHAR(100), Department VARCHAR(40), Salary FLOAT, BonusAmount FLOAT)

    INSERT INTO #EmployeeBonus

    SELECT EmployeeID,
           CONCAT(FIRSTNAME,' ', LASTNAME) AS FullName,
           E.Department,
           Salary,
           Salary * BonusPercentage / 100 AS BonusAmount

    FROM Employees AS E JOIN DepartmentBonus AS DB ON E.Department = DB.Department

    SELECT * FROM #EmployeeBonus

END
EXECUTE Employee_Bonus_Calculator

SELECT * FROM DepartmentBonus

--2--Parametr sifatida bo'lim nomini va o'sish foizini qabul qiladi
--Ushbu bo'limdagi barcha xodimlarning ish haqini berilgan foizda yangilang
--Ushbu bo'limdan yangilangan xodimlarni qaytaradi.




CREATE TABLE Products_Current (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);

CREATE TABLE Products_New (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);

INSERT INTO Products_Current VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 600),
(3, 'Smartphone', 800);

INSERT INTO Products_New VALUES
(2, 'Tablet Pro', 700),
(3, 'Smartphone', 850),
(4, 'Smartwatch', 300);


----2 Perform a MERGE operation that:

--Updates ProductName and Price if ProductID matches
--Inserts new products if ProductID does not exist
--Deletes products from Products_Current if they are missing in Products_New
--Return the final state of Products_Current after the MERGE.

--Birlashtirish operatsiyasini bajaring:

--Agar ProductID mos kelsa, Mahsulot nomi va narxini yangilaydi
--ProductID mavjud bo'lmasa, yangi mahsulotlarni kiritadi
--Mahsulotlar Products_New ichida etishmayotgan bo'lsa, Products_Current dan mahsulotlarni o'chirib tashlaydi
--MERGEdan keyin Products_Current ning yakuniy holatini qaytaring.

select * from Products_Current
select * from Products_New







CREATE TABLE Tree (id INT, p_id INT);
TRUNCATE TABLE Tree;
INSERT INTO Tree (id, p_id) VALUES (1, NULL);
INSERT INTO Tree (id, p_id) VALUES (2, 1);
INSERT INTO Tree (id, p_id) VALUES (3, 1);
INSERT INTO Tree (id, p_id) VALUES (4, 2);
INSERT INTO Tree (id, p_id) VALUES (5, 2);


--3- Tree Node

--Each node in the tree can be one of three types:

--"Leaf": if the node is a leaf node.
--"Root": if the node is the root of the tree.
--"Inner": If the node is neither a leaf node nor a root node.
--Write a solution to report the type of each node in the tree.

--Daraxt tugunlari

--Daraxtdagi har bir tugun uchta turdan biri bo'lishi mumkin:

--"Yaproq": agar tugun barg tugun bo'lsa.
--"Ildiz": agar tugun daraxtning ildizi bo'lsa.
--"Ichki": Agar tugun barg tugunlari ham, ildiz tugunlari ham bo'lmasa.
--Daraxtdagi har bir tugunning turini xabar qilish uchun yechim yozing.


--1-tugun ildiz tugunidir, chunki uning asosiy tugunlari null va u 2 va 3-tugunlarga ega.
--2-tugun ichki tugundir, chunki u 1-ota-tugun va 4-va 5-chi tugunlarga ega.
--3, 4 va 5-tugunlar barg tugunlaridir, chunki ularning ota-ona tugunlari bor va ularda tugun yoʻq.

--Output: 
--+----+-------+
--| id | type  |
--+----+-------+
--| 1  | Root  |
--+----+-------+
select * from Tree
select id,case when p_id =1 then 'Root'
       when p_id=2 then 'Inner'
	   when p_id=3 then 'Leaf'
	   end as gul
from Tree
where (case when p_id =1 then 'Root'
       when p_id=2 then 'Inner'
	   when p_id=3 then 'Leaf'
	   end ) is not null




	   ---5-

CREATE TABLE Signups (user_id INT, time_stamp DATETIME);
CREATE TABLE Confirmations (
    user_id INT,
    time_stamp DATETIME,
    action VARCHAR(10)
    CONSTRAINT CHK_Action CHECK (action IN ('confirmed', 'timeout'))
);

TRUNCATE TABLE Signups;
INSERT INTO Signups (user_id, time_stamp) VALUES 
(3, '2020-03-21 10:16:13'),
(7, '2020-01-04 13:57:59'),
(2, '2020-07-29 23:09:44'),
(6, '2020-12-09 10:39:37');

TRUNCATE TABLE Confirmations;
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES 
(3, '2021-01-06 03:30:46', 'timeout'),
(3, '2021-07-14 14:00:00', 'timeout'),
(7, '2021-06-12 11:57:29', 'confirmed'),
(7, '2021-06-13 12:58:28', 'confirmed'),
(7, '2021-06-14 13:59:27', 'confirmed'),
(2, '2021-01-22 00:00:00', 'confirmed'),
(2, '2021-02-28 23:59:59', 'timeout');



--Find the confirmation rate for each user. If a user has no confirmation requests, the rate should be 0.

--Har bir foydalanuvchi uchun tasdiqlash tezligini toping. Agar foydalanuvchida tasdiqlash so'rovlari bo'lmasa, tarif 0 bo'lishi kerak.

;WITH CTE AS
(
SELECT S.user_id, 
       COUNT(C.action) AS TOTAL_ACTIONS,
       SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) AS Confirmed_Actions
FROM Signups AS S LEFT JOIN Confirmations AS C ON S.user_id = C.user_id
GROUP BY S.user_id
),FINAL AS(
SELECT user_id ,
       CASE WHEN TOTAL_ACTIONS = 0 THEN 0
       ELSE Confirmed_Actions * 1.0 / TOTAL_ACTIONS 
       END AS CONFIRMATION_RATE
FROM CTE)
SELECT user_id, CAST(CONFIRMATION_RATE AS DECIMAL(3,2)) AS CONFIRMATION_RATE FROM FINAL




----6
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);
--Find employees with the lowest salary
--Eng kam maoshli xodimlarni toping
select name ,min(salary) as min_salary from employees
group by name 

--- 7 

-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10,2)
);

-- Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT,
    SaleDate DATE
);

INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop Model A', 'Electronics', 1200),
(2, 'Laptop Model B', 'Electronics', 1500),
(3, 'Tablet Model X', 'Electronics', 600),
(4, 'Tablet Model Y', 'Electronics', 700),
(5, 'Smartphone Alpha', 'Electronics', 800),
(6, 'Smartphone Beta', 'Electronics', 850),
(7, 'Smartwatch Series 1', 'Wearables', 300),
(8, 'Smartwatch Series 2', 'Wearables', 350),
(9, 'Headphones Basic', 'Accessories', 150),
(10, 'Headphones Pro', 'Accessories', 250),
(11, 'Wireless Mouse', 'Accessories', 50),
(12, 'Wireless Keyboard', 'Accessories', 80),
(13, 'Desktop PC Standard', 'Computers', 1000),
(14, 'Desktop PC Gaming', 'Computers', 2000),
(15, 'Monitor 24 inch', 'Displays', 200),
(16, 'Monitor 27 inch', 'Displays', 300),
(17, 'Printer Basic', 'Office', 120),
(18, 'Printer Pro', 'Office', 400),
(19, 'Router Basic', 'Networking', 70),
(20, 'Router Pro', 'Networking', 150);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate) VALUES
(1, 1, 2, '2024-01-15'),
(2, 1, 1, '2024-02-10'),
(3, 1, 3, '2024-03-08'),
(4, 2, 1, '2024-01-22'),
(5, 3, 5, '2024-01-20'),
(6, 5, 2, '2024-02-18'),
(7, 5, 1, '2024-03-25'),
(8, 6, 4, '2024-04-02'),
(9, 7, 2, '2024-01-30'),
(10, 7, 1, '2024-02-25'),
(11, 7, 1, '2024-03-15'),
(12, 9, 8, '2024-01-18'),
(13, 9, 5, '2024-02-20'),
(14, 10, 3, '2024-03-22'),
(15, 11, 2, '2024-02-14'),
(16, 13, 1, '2024-03-10'),
(17, 14, 2, '2024-03-22'),
(18, 15, 5, '2024-02-01'),
(19, 15, 3, '2024-03-11'),
(20, 19, 4, '2024-04-01');

--GetProductSalesSummary deb nomlangan saqlangan protsedura yarating, bu:

--@ProductID kiritishni qabul qiladi
--Qaytaradi:
--Mahsulot nomi
--Jami sotilgan miqdori
--Umumiy savdo summasi (miqdori × narxi)
--Birinchi sotilgan sana
--Oxirgi sotuv sanasi
--Agar mahsulot sotilmagan bo'lsa, miqdor, umumiy miqdor, birinchi sana va oxirgi sana uchun NULLni qaytaring, lekin baribir mahsulot nomini qaytaring.


Create a stored procedure called GetProductSalesSummary that:

--Accepts a @ProductID input
--Returns:
--ProductName
--Total Quantity Sold
--Total Sales Amount (Quantity × Price)
--First Sale Date
--Last Sale Date
--If the product has no sales, return NULL for quantity, total amount, first date, and last date, but still return the product name.

select* from Sales
select * from Products

;create proc GetProductSalesSummary @ProductID int
as
begin
select s.ProductId,
     ProductName,
	 sum(Quantity) asTotal_Quantity_Sold,
	 sum(Quantity*Price)as total_Sales_Amount,
	 min(saledate)as First_Sale_Date,
	 max(saledate)as las_Sale_Date
	
	
	 from Products p join Sales s on p.ProductID=s.ProductID
	 where s.ProductId=@ProductID
	 group by ProductName, s.ProductId

end;
execute GetProductSalesSummary 19
