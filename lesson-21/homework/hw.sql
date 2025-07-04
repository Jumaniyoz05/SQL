create database hom_21
use hom_21


CREATE TABLE ProductSales (
    SaleID INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    SaleDate DATE NOT NULL,
    SaleAmount DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    CustomerID INT NOT NULL
);
INSERT INTO ProductSales (SaleID, ProductName, SaleDate, SaleAmount, Quantity, CustomerID)
VALUES 
(1, 'Product A', '2023-01-01', 148.00, 2, 101),
(2, 'Product B', '2023-01-02', 202.00, 3, 102),
(3, 'Product C', '2023-01-03', 248.00, 1, 103),
(4, 'Product A', '2023-01-04', 149.50, 4, 101),
(5, 'Product B', '2023-01-05', 203.00, 5, 104),
(6, 'Product C', '2023-01-06', 252.00, 2, 105),
(7, 'Product A', '2023-01-07', 151.00, 1, 101),
(8, 'Product B', '2023-01-08', 205.00, 8, 102),
(9, 'Product C', '2023-01-09', 253.00, 7, 106),
(10, 'Product A', '2023-01-10', 152.00, 2, 107),
(11, 'Product B', '2023-01-11', 207.00, 3, 108),
(12, 'Product C', '2023-01-12', 249.00, 1, 109),
(13, 'Product A', '2023-01-13', 153.00, 4, 110),
(14, 'Product B', '2023-01-14', 208.50, 5, 111),
(15, 'Product C', '2023-01-15', 251.00, 2, 112),
(16, 'Product A', '2023-01-16', 154.00, 1, 113),
(17, 'Product B', '2023-01-17', 210.00, 8, 114),
(18, 'Product C', '2023-01-18', 254.00, 7, 115),
(19, 'Product A', '2023-01-19', 155.00, 3, 116),
(20, 'Product B', '2023-01-20', 211.00, 4, 117),
(21, 'Product C', '2023-01-21', 256.00, 2, 118),
(22, 'Product A', '2023-01-22', 157.00, 5, 119),
(23, 'Product B', '2023-01-23', 213.00, 3, 120),
(24, 'Product C', '2023-01-24', 255.00, 1, 121),
(25, 'Product A', '2023-01-25', 158.00, 6, 122),
(26, 'Product B', '2023-01-26', 215.00, 7, 123),
(27, 'Product C', '2023-01-27', 257.00, 3, 124),
(28, 'Product A', '2023-01-28', 159.50, 4, 125),
(29, 'Product B', '2023-01-29', 218.00, 5, 126),
(30, 'Product C', '2023-01-30', 258.00, 2, 127);


CREATE TABLE Employees1 (
    EmployeeID   INT PRIMARY KEY,
    Name         VARCHAR(50),
    Department   VARCHAR(50),
    Salary       DECIMAL(10,2),
    HireDate     DATE
);

INSERT INTO Employees1 (EmployeeID, Name, Department, Salary, HireDate) VALUES
(1, 'John Smith', 'IT', 60000.00, '2020-03-15'),
(2, 'Emma Johnson', 'HR', 50000.00, '2019-07-22'),
(3, 'Michael Brown', 'Finance', 75000.00, '2018-11-10'),
(4, 'Olivia Davis', 'Marketing', 55000.00, '2021-01-05'),
(5, 'William Wilson', 'IT', 62000.00, '2022-06-12'),
(6, 'Sophia Martinez', 'Finance', 77000.00, '2017-09-30'),
(7, 'James Anderson', 'HR', 52000.00, '2020-04-18'),
(8, 'Isabella Thomas', 'Marketing', 58000.00, '2019-08-25'),
(9, 'Benjamin Taylor', 'IT', 64000.00, '2021-11-17'),
(10, 'Charlotte Lee', 'Finance', 80000.00, '2016-05-09'),
(11, 'Ethan Harris', 'IT', 63000.00, '2023-02-14'),
(12, 'Mia Clark', 'HR', 53000.00, '2022-09-05'),
(13, 'Alexander Lewis', 'Finance', 78000.00, '2015-12-20'),
(14, 'Amelia Walker', 'Marketing', 57000.00, '2020-07-28'),
(15, 'Daniel Hall', 'IT', 61000.00, '2018-10-13'),
(16, 'Harper Allen', 'Finance', 79000.00, '2017-03-22'),
(17, 'Matthew Young', 'HR', 54000.00, '2021-06-30'),
(18, 'Ava King', 'Marketing', 56000.00, '2019-04-16'),
(19, 'Lucas Wright', 'IT', 65000.00, '2022-12-01'),
(20, 'Evelyn Scott', 'Finance', 81000.00, '2016-08-07');


--1  SaleDate asosida har bir sotuvga qator raqamini belgilash uchun so'rov yozing.
---Write a query to assign a row number to each sale based on the SaleDate.

select SaleDate,
       ROW_NUMBER() over  (order by saledate  asc) as number 

from ProductSales

--2 - Write a query to rank products based on the total quantity sold. give the same rank for the same amounts without skipping numbers.
--Sotilgan umumiy miqdorga qarab mahsulotlarni tartiblash uchun so'rov yozing.
--raqamlarni o'tkazib yubormasdan bir xil miqdorlar uchun bir xil darajani bering.
;with cte as (
select SaleAmount*Quantity as total_salary 
from ProductSales)

select  total_salary , DENSE_RANK() over (order by total_salary )from cte

--3-Write a query to identify the top sale for each customer based on the SaleAmount.
---SaleAmount asosida har bir mijoz uchun eng yuqori sotuvni aniqlash uchun so'rov yozing.
;with cte as (
select
      ProductName,
       SaleAmount,
       ROW_NUMBER() over (partition by productname order by saleamount desc ) as rn
from ProductSales)
select * from cte
where rn = '1'

--4- Write a query to display each sale's amount along with the next sale amount in the order of SaleDate.
----Har bir sotuv summasini SaleDate tartibida keyingi sotuv summasi bilan birga ko'rsatish uchun so'rov yozing.
select SaleDate,
       lead(SaleAmount , 1 ) over (order by saledate)
	   from ProductSales

-- 5 Write a query to display each sale's amount along with the previous sale amount in the order of SaleDate.
---Har bir sotuv summasini SaleDate tartibida oldingi sotuv summasi bilan birga ko'rsatish uchun so'rov yozing.
select SaleAmount,
       lag(SaleAmount,1,0) over (order by saledate)
from ProductSales
--6 Write a query to identify sales amounts that are greater than the previous sale's amount
--Oldingi sotuv summasidan kattaroq bo'lgan savdo summalarini aniqlash uchun so'rov yozing

;with cte as(
select SaleAmount,
       lag(SaleAmount,1,0) over (order by saledate) as lag_s
from ProductSales)
select * from cte
where SaleAmount>lag_s


-- 6 Write a query to calculate the difference in sale amount from the previous sale for every product
---Har bir mahsulot uchun oldingi sotuvdan sotilgan summadagi farqni hisoblash uchun so'rov yozing

select SaleAmount-
       lag(SaleAmount,1,0) over (order by saledate) as deferesnt
from ProductSales

-- 8 Write a query to compare the current sale amount with the next sale amount in terms of percentage change.
--Joriy sotuv summasini keyingi sotuv summasi bilan foiz o‘zgarishi bo‘yicha solishtirish uchun so‘rov yozing.
 
;with cte AS (
select SaleAmount,
       lead(SaleAmount,1 ,0) over (order by saledate) as lead_
from ProductSales)
SELECT  round((lead_-SaleAmount)*100.0/SaleAmount,2) as fr
from cte


--9 Write a query to calculate the ratio of the current sale amount to the previous sale amount within the same product.
--Xuddi shu mahsulot ichidagi joriy sotuv summasining oldingi sotilgan summasiga nisbatini hisoblash uchun so'rov yozing.
;with cte as (
select SaleAmount,
       lag(SaleAmount,1) over (order by saledate) as deferesnt
from ProductSales)
select  round(SaleAmount/ deferesnt,2) as bolinma from cte 

--10 Write a query to calculate the difference in sale amount from the very first sale of that product.
--Ushbu mahsulotning birinchi sotilganidan so'ng sotish summasidagi farqni hisoblash uchun so'rov yozing.








--11 Write a query to find sales that have been increasing continuously for a product
--(i.e., each sale amount is greater than the previous sale amount for that product).

--Mahsulot uchun doimiy ravishda oshib borayotgan sotuvlarni topish uchun so'rov yozing
--(ya'ni, har bir sotuv miqdori ushbu mahsulot uchun oldingi sotilgan summadan kattaroqdir).
;with cte as(
select Quantity,
       lead(Quantity,1) over (order by (select 1 )) as ldl
from ProductSales)
select * from cte
where ldl>Quantity

--12 Write a query to calculate a "closing balance"(running total) for sales amounts which adds the current sale amount to a running total of previous sales.
--Joriy sotuv summasini oldingi sotuvlar umumiy summasiga qo'shadigan savdo summalari uchun "yopilish balansini" (jami jami) hisoblash uchun so'rov yozing.

;with cte as(
select 
      SaleAmount,
	  ROW_NUMBER() over (order by (select 1))as hh
   
from ProductSales )
select 
     sum(SaleAmount) over (order by hh) as fr
	 from  cte

--12 Write a query to calculate the moving average of sales amounts over the last 3 sales.
--Oxirgi 3 ta sotuvda sotuvlar miqdorining harakatlanuvchi o'rtacha qiymatini hisoblash uchun so'rov yozing.-

select 
        avg(Quantity)over (partition by productname order by saledate ROWS BETWEEN 2 PRECEDING  AND CURRENT ROW ) as rdf
from ProductSales

--14  Write a query to show the difference between each sale amount and the average sale amount.
--Har bir sotuv miqdori va o'rtacha sotuv miqdori o'rtasidagi farqni ko'rsatish uchun so'rov yozing.
select (quantity-
       avg(quantity) over ()) as deferns
from ProductSales

--15 Find Employees Who Have the Same Salary Rank
--Bir xil ish haqi darajasiga ega bo'lgan xodimlarni toping
select *,
       dense_rank() over (order by salary)as dr
from Employees1

--16 Identify the Top 2 Highest Salaries in Each Department
--17 Find the Lowest-Paid Employee in Each Department
--18 Calculate the Running Total of Salaries in Each Department
--19 Find the Total Salary of Each Department Without GROUP BY
--20 Calculate the Average Salary in Each Department Without GROUP BY
--21 Find the Difference Between an Employee’s Salary and Their Department’s Average
--22 Calculate the Moving Average Salary Over 3 Employees (Including Current, Previous, and Next)
--23 Find the Sum of Salaries for the Last 3 Hired Employees

--16 Har bir bo'limda eng yuqori 2 ta ish haqini aniqlang
--17 Har bir bo'limda eng kam maosh oluvchi xodimni toping
--18 Har bir bo'limdagi ish haqining umumiy miqdorini hisoblang
--19 GROUP BY holda har bir bo'limning umumiy ish haqini toping
--20 Har bir bo'limda o'rtacha ish haqini GROUP BY holda hisoblang
--21 Xodimning ish haqi va ularning bo'limining o'rtacha ish haqi o'rtasidagi farqni toping
--22 3 ta xodimdan oshiq o'rtacha ish haqini hisoblang (joriy, oldingi va keyingi)
--23 Ishga qabul qilingan oxirgi 3 nafar xodimning ish haqi yig'indisini toping


--16
;with cte as (
select department,
       salary ,
      ROW_NUMBER() over (partition by department order by salary  desc)as rn 

from Employees1)
select * from cte
where rn<3
--17
;with cte as (
select department,
       salary ,
      ROW_NUMBER() over (partition by department order by salary  )as rn 

from Employees1)
select * from cte
where rn='1'
--18
;with cte as (
select department,
       salary ,
      ROW_NUMBER() over (partition by department order by salary  desc)as rn 

from Employees1)
select Department,sum(Salary) as totla_salary from cte
group by Department

--19
;with cte as (
select department,
       salary ,
      ROW_NUMBER() over (partition by department order by salary  desc)as rn 

from Employees1)
select Department,sum(Salary) as totla_salary from cte
group by Department

--20 
select Department,
       avg(salary ) as avg_salary 
from Employees1
group by Department

---21 


select Department ,
avg(salary) over ()-
  avg(Salary) over (partition by department)
 from Employees1

