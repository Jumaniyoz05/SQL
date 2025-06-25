create database hom_18
use hom_18

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);
 
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(1, 'Samsung Galaxy S23', 'Electronics', 899.99),
(2, 'Apple iPhone 14', 'Electronics', 999.99),
(3, 'Sony WH-1000XM5 Headphones', 'Electronics', 349.99),
(4, 'Dell XPS 13 Laptop', 'Electronics', 1249.99),
(5, 'Organic Eggs (12 pack)', 'Groceries', 3.49),
(6, 'Whole Milk (1 gallon)', 'Groceries', 2.99),
(7, 'Alpen Cereal (500g)', 'Groceries', 4.75),
(8, 'Extra Virgin Olive Oil (1L)', 'Groceries', 8.99),
(9, 'Mens Cotton T-Shirt', 'Clothing', 12.99),
(10, 'Womens Jeans - Blue', 'Clothing', 39.99),
(11, 'Unisex Hoodie - Grey', 'Clothing', 29.99),
(12, 'Running Shoes - Black', 'Clothing', 59.95),
(13, 'Ceramic Dinner Plate Set (6 pcs)', 'Home & Kitchen', 24.99),
(14, 'Electric Kettle - 1.7L', 'Home & Kitchen', 34.90),
(15, 'Non-stick Frying Pan - 28cm', 'Home & Kitchen', 18.50),
(16, 'Atomic Habits - James Clear', 'Books', 15.20),
(17, 'Deep Work - Cal Newport', 'Books', 14.35),
(18, 'Rich Dad Poor Dad - Robert Kiyosaki', 'Books', 11.99),
(19, 'LEGO City Police Set', 'Toys', 49.99),
(20, 'Rubiks Cube 3x3', 'Toys', 7.99);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate)
VALUES
(1, 1, 2, '2025-04-01'),
(2, 1, 1, '2025-04-05'),
(3, 2, 1, '2025-04-10'),
(4, 2, 2, '2025-04-15'),
(5, 3, 3, '2025-04-18'),
(6, 3, 1, '2025-04-20'),
(7, 4, 2, '2025-04-21'),
(8, 5, 10, '2025-04-22'),
(9, 6, 5, '2025-04-01'),
(10, 6, 3, '2025-04-11'),
(11, 10, 2, '2025-04-08'),
(12, 12, 1, '2025-04-12'),
(13, 12, 3, '2025-04-14'),
(14, 19, 2, '2025-04-05'),
(15, 20, 4, '2025-04-19'),
(16, 1, 1, '2025-03-15'),
(17, 2, 1, '2025-03-10'),
(18, 5, 5, '2025-02-20'),
(19, 6, 6, '2025-01-18'),
(20, 10, 1, '2024-12-25'),
(21, 1, 1, '2024-04-20');CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(1, 'Samsung Galaxy S23', 'Electronics', 899.99),
(2, 'Apple iPhone 14', 'Electronics', 999.99),
(3, 'Sony WH-1000XM5 Headphones', 'Electronics', 349.99),
(4, 'Dell XPS 13 Laptop', 'Electronics', 1249.99),
(5, 'Organic Eggs (12 pack)', 'Groceries', 3.49),
(6, 'Whole Milk (1 gallon)', 'Groceries', 2.99),
(7, 'Alpen Cereal (500g)', 'Groceries', 4.75),
(8, 'Extra Virgin Olive Oil (1L)', 'Groceries', 8.99),
(9, 'Mens Cotton T-Shirt', 'Clothing', 12.99),
(10, 'Womens Jeans - Blue', 'Clothing', 39.99),
(11, 'Unisex Hoodie - Grey', 'Clothing', 29.99),
(12, 'Running Shoes - Black', 'Clothing', 59.95),
(13, 'Ceramic Dinner Plate Set (6 pcs)', 'Home & Kitchen', 24.99),
(14, 'Electric Kettle - 1.7L', 'Home & Kitchen', 34.90),
(15, 'Non-stick Frying Pan - 28cm', 'Home & Kitchen', 18.50),
(16, 'Atomic Habits - James Clear', 'Books', 15.20),
(17, 'Deep Work - Cal Newport', 'Books', 14.35),
(18, 'Rich Dad Poor Dad - Robert Kiyosaki', 'Books', 11.99),
(19, 'LEGO City Police Set', 'Toys', 49.99),
(20, 'Rubiks Cube 3x3', 'Toys', 7.99);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate)
VALUES
(1, 1, 2, '2025-04-01'),
(2, 1, 1, '2025-04-05'),
(3, 2, 1, '2025-04-10'),
(4, 2, 2, '2025-04-15'),
(5, 3, 3, '2025-04-18'),
(6, 3, 1, '2025-04-20'),
(7, 4, 2, '2025-04-21'),
(8, 5, 10, '2025-04-22'),
(9, 6, 5, '2025-04-01'),
(10, 6, 3, '2025-04-11'),
(11, 10, 2, '2025-04-08'),
(12, 12, 1, '2025-04-12'),
(13, 12, 3, '2025-04-14'),
(14, 19, 2, '2025-04-05'),
(15, 20, 4, '2025-04-19'),
(16, 1, 1, '2025-03-15'),
(17, 2, 1, '2025-03-10'),
(18, 5, 5, '2025-02-20'),
(19, 6, 6, '2025-01-18'),
(20, 10, 1, '2024-12-25'),
(21, 1, 1, '2024-04-20');

--1. Create a temporary table named MonthlySales to store the total quantity sold and total revenue for each product in the current month.
--Return: ProductID, TotalQuantity, TotalRevenue

--1. Joriy oyda har bir mahsulot uchun sotilgan umumiy miqdor va jami daromadni saqlash uchun MonthlySales nomli vaqtinchalik jadval yarating.
--Qaytish: mahsulot identifikatori, umumiy miqdor, umumiy tushum

select * from Products
select * from Sales

create view vw_MonthlySales
as 
select p.ProductID,sum(Price) as sum_p, sum(Quantity)as sum_q from Products p join Sales s on p.ProductID=s.ProductID
group by p.ProductID
 
 select * from vw_MonthlySales

 --2 2. Create a view named vw_ProductSalesSummary that returns product info along with total sales quantity across all time.
 --2. Mahsulot ma'lumotlarini va barcha vaqt davomida umumiy savdo miqdorini qaytaradigan vw_ProductSalesSummary nomli ko'rinish yarating.
 
 create view vw_ProductSalesSummary 
 as 
 select  p.ProductID, ProductName,Category, (select  sum(Quantity)as sum_q 
 from Products p join Sales s on p.ProductID=s.ProductID)as TotalQuantitySold from Products p join Sales s on p.ProductID=s.ProductID
 
 --4 4. Create an function fn_GetSalesByCategory(@Category VARCHAR(50))
--Return: ProductName, TotalQuantity, TotalRevenue for all products in that category.

--4. Create a function named fn_GetTotalRevenueForProduct(@ProductID INT)
--Return: total revenue for the given product ID
--. fn_GetTotalRevenueForProduct(@ProductID INT) nomli funksiya yarating
--Qaytish: berilgan mahsulot identifikatori uchun jami daromad

--CREATE FUNCTION udf_Greating (@name VARCHAR(50))
--RETURNS VARCHAR(50)
--AS
--BEGIN
--	RETURN 'HELLO ' + @name
--END

create function udf_fn_GetTotalRevenueForProduct(@productID int )
returns int
as
begin
declare @result int
select @result = sum(p.Price*s.Quantity) as ff from Products p join Sales s on p.ProductID=s.ProductID
where p.ProductID = @productID
group by p.ProductID
return @result
end;

select dbo.udf_fn_GetTotalRevenueForProduct(5)


--4 4. Create an function fn_GetSalesByCategory(@Category VARCHAR(50))
--Return: ProductName, TotalQuantity, TotalRevenue for all products in that category.

--4. fn_GetSalesByCategory(@Category VARCHAR(50)) funksiyasini yarating
--Qaytish: ushbu turkumdagi barcha mahsulotlar uchun mahsulot nomi, umumiy miqdor, umumiy tushum.

create function udf_GetSalesByCategory (@NATIJA VARCHAR(54))
RETURNs TABLE
AS
return
(
select  ProductName, sum(Quantity) as sum_q, sum(Quantity*Price) as total_q from Products p join Sales s on p.ProductID=s.ProductID
where  Category=@NATIJA
group by ProductName 

)

SELECT * FROM dbo.udf_GetSalesByCategory('Electronics')

--5  You have to create a function that get one argument as input from user and the function should return 
--'Yes' if the input number is a prime number and 'No' otherwise You can start it like this:
--
--Siz foydalanuvchidan kirish sifatida bitta argument oladigan funksiya yaratishingiz kerak va agar kiritilgan raqam tub son boʻlsa,
--funksiya “Ha” va aks holda “Yoʻq” ni qaytarishi kerak. Siz buni quyidagicha boshlashingiz mumkin:



DECLARE @Check_Prime INT = 97;


DECLARE @number_of_divs INT = 0, @start INT = 1

WHILE @start <= SQRT(@Check_Prime)+1 AND @Check_Prime > 1
BEGIN
    PRINT @start

    IF @Check_Prime % @start = 0
    BEGIN
        SET @number_of_divs += 1        
    END
    SET @start = @start + 1

END

IF @number_of_divs = 1
BEGIN
    SELECT CONCAT(@Check_Prime, ' IS PRIME')
END
ELSE
BEGIN
    SELECT CONCAT(@Check_Prime, ' IS NOT PRIME')
END



SELECT @number_of_divs

---6  Create a table-valued function named fn_GetNumbersBetween that accepts two integers as input:
-- Kirish sifatida ikkita butun sonni qabul qiladigan fn_GetNumbersBetween nomli jadval qiymati funksiyasini yarating:






CREATE FUNCTION fn_GetNumbersBetween
(
    @Start INT,
    @End INT
)
RETURNS @Numbers TABLE
(
    Number INT
)
AS
BEGIN
    DECLARE @Current INT
    SET @Current = @Start

    WHILE @Current <= @End
    BEGIN
        INSERT INTO @Numbers (Number)
        VALUES (@Current)

        SET @Current = @Current + 1
    END

    RETURN
END


--7  Write a SQL query to return the Nth highest distinct salary from the Employee table. If there are fewer than N distinct salaries, return NULL.
--Xodimlar jadvalidan N-chi eng yuqori aniq maoshni qaytarish uchun SQL so'rovini yozing. Agar N dan kam ish haqi bo'lsa, NULLni qaytaring.
drop table emoloyee
create table employee (id int, salary int)
insert into employee  (id,salary) values (1,100),(2,200),(3,300)

--select * from employee
--order by salary desc


declare @num int =3
begin
if @num in(select id from employee)
select salary from employee
where id=@num
else
select null
end


--8  Write a SQL query to find the person who has the most friends.
--Return: Their id, The total number of friends they have

--Friendship is mutual. For example, if user A sends a request to user B and it's accepted, both A and B are considered friends with each other. 
--The test case is guaranteed to have only one user with the most friends.
--Input.RequestAccepted table:


--Eng ko'p do'stlari bo'lgan odamni topish uchun SQL so'rovini yozing.
--Qaytish: ularning identifikatori, ulardagi do'stlarining umumiy soni

--Do'stlik o'zaro. Misol uchun, agar A foydalanuvchisi B foydalanuvchisiga so'rov yuborsa va u qabul qilinsa, A va B ham bir-biri bilan do'st hisoblanadi.
--Sinov ishi eng ko'p do'stlari bo'lgan faqat bitta foydalanuvchiga ega bo'lishi kafolatlanadi.
--Input.RequestAccepted jadvali:

| requester_id | accepter_id | accept_date |
+--------------+-------------+-------------+
| 1            | 2           | 2016/06/03  |
| 1            | 3           | 2016/06/08  |
| 2            | 3           | 2016/06/08  |
| 3            | 4           | 2016/06/09  |



create table friends (requester_id int,accepter_id int,accept_date date)
insert into  friends(requester_id ,accepter_id ,accept_date) values
     (1,2,2016-06-03 ),( 1,3,2016-06-08),( 2,3,2016-06-08 ),( 3,4,2016-06-09 )
select * from friends
/*
10. Write an SQL statement to fill in the missing gaps.
You have to write only select statement, no need to modify the table.


| RowNumber | Workflow |
|----------------------|
| 1         | Alpha    |
| 2         | Alpha    |
| 3         | Alpha    |
| 4         | Alpha    |
| 5         | Bravo    |
| 6         | Bravo    |
| 7         | Bravo    |
| 8         | Bravo    |
| 9         | Bravo    |
| 10        | Charlie  |
| 11        | Charlie  |
| 12        | Charlie  |
*/
DROP TABLE IF EXISTS Gaps;

CREATE TABLE Gaps
(
RowNumber   INTEGER PRIMARY KEY,
TestCase    VARCHAR(100) NULL
);
TRUNCATE TABLE gaps
INSERT INTO Gaps (RowNumber, TestCase) VALUES
(1,'Alpha'),(2,NULL),(3,NULL),(4,NULL),
(5,'Bravo'),(6,NULL),(7,NULL),(8,NULL),(9,NULL),(10,'Charlie'), (11, NULL), (12, NULL)

--INS = INSIDE

SELECT(SELECT MAX(TestCase) FROM Gaps INS WHERE INS.RowNumber<=Gaps.RowNumber) AS Workflow  
FROM Gaps
