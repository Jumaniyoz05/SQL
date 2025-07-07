creaTE  DATAbase hom_22
CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    product_category VARCHAR(50),
    product_name VARCHAR(100),
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    order_date DATE,
    region VARCHAR(50)
);

INSERT INTO sales_data VALUES
    (1, 101, 'Alice', 'Electronics', 'Laptop', 1, 1200.00, 1200.00, '2024-01-01', 'North'),
    (2, 102, 'Bob', 'Electronics', 'Phone', 2, 600.00, 1200.00, '2024-01-02', 'South'),
    (3, 103, 'Charlie', 'Clothing', 'T-Shirt', 5, 20.00, 100.00, '2024-01-03', 'East'),
    (4, 104, 'David', 'Furniture', 'Table', 1, 250.00, 250.00, '2024-01-04', 'West'),
    (5, 105, 'Eve', 'Electronics', 'Tablet', 1, 300.00, 300.00, '2024-01-05', 'North'),
    (6, 106, 'Frank', 'Clothing', 'Jacket', 2, 80.00, 160.00, '2024-01-06', 'South'),
    (7, 107, 'Grace', 'Electronics', 'Headphones', 3, 50.00, 150.00, '2024-01-07', 'East'),
    (8, 108, 'Hank', 'Furniture', 'Chair', 4, 75.00, 300.00, '2024-01-08', 'West'),
    (9, 109, 'Ivy', 'Clothing', 'Jeans', 1, 40.00, 40.00, '2024-01-09', 'North'),
    (10, 110, 'Jack', 'Electronics', 'Laptop', 2, 1200.00, 2400.00, '2024-01-10', 'South'),
    (11, 101, 'Alice', 'Electronics', 'Phone', 1, 600.00, 600.00, '2024-01-11', 'North'),
    (12, 102, 'Bob', 'Furniture', 'Sofa', 1, 500.00, 500.00, '2024-01-12', 'South'),
    (13, 103, 'Charlie', 'Electronics', 'Camera', 1, 400.00, 400.00, '2024-01-13', 'East'),
    (14, 104, 'David', 'Clothing', 'Sweater', 2, 60.00, 120.00, '2024-01-14', 'West'),
    (15, 105, 'Eve', 'Furniture', 'Bed', 1, 800.00, 800.00, '2024-01-15', 'North'),
    (16, 106, 'Frank', 'Electronics', 'Monitor', 1, 200.00, 200.00, '2024-01-16', 'South'),
    (17, 107, 'Grace', 'Clothing', 'Scarf', 3, 25.00, 75.00, '2024-01-17', 'East'),
    (18, 108, 'Hank', 'Furniture', 'Desk', 1, 350.00, 350.00, '2024-01-18', 'West'),
    (19, 109, 'Ivy', 'Electronics', 'Speaker', 2, 100.00, 200.00, '2024-01-19', 'North'),
    (20, 110, 'Jack', 'Clothing', 'Shoes', 1, 90.00, 90.00, '2024-01-20', 'South'),
    (21, 111, 'Kevin', 'Electronics', 'Mouse', 3, 25.00, 75.00, '2024-01-21', 'East'),
    (22, 112, 'Laura', 'Furniture', 'Couch', 1, 700.00, 700.00, '2024-01-22', 'West'),
    (23, 113, 'Mike', 'Clothing', 'Hat', 4, 15.00, 60.00, '2024-01-23', 'North'),
    (24, 114, 'Nancy', 'Electronics', 'Smartwatch', 1, 250.00, 250.00, '2024-01-24', 'South'),
    (25, 115, 'Oscar', 'Furniture', 'Wardrobe', 1, 1000.00, 1000.00, '2024-01-25', 'East')


--1 Compute Running Total Sales per Customer
--2 Count the Number of Orders per Product Category
--3 Find the Maximum Total Amount per Product Category
--4 Find the Minimum Price of Products per Product Category
--5 Compute the Moving Average of Sales of 3 days (prev day, curr day, next day)
--6 Find the Total Sales per Region
--7 Compute the Rank of Customers Based on Their Total Purchase Amount
--8 Calculate the Difference Between Current and Previous Sale Amount per Customer
--9  Find the Top 3 Most Expensive Products in Each Category
--10 Compute the Cumulative Sum of Sales Per Region by Order Date




--1 Mijoz boshiga sotilgan jami sotishni hisoblash

--1 Mijoz boshiga sotilgan jami sotishni hisoblash
--2 Mahsulot toifasidagi buyurtmalar sonini hisoblang
--3 Mahsulot toifasi uchun maksimal umumiy miqdorni toping
--4 Tovar toifasidagi mahsulotlarning minimal narxini toping
--5 3 kunlik savdolarning harakatlanuvchi o'rtacha ko'rsatkichini hisoblang (oldingi kun, joriy kun, keyingi kun)
--6 Hudud bo'yicha jami sotishni toping
--7 Xaridorlarning umumiy xarid miqdoridan kelib chiqqan holda reytingini hisoblang
--8 Har bir mijoz uchun joriy va oldingi sotuv summasi o'rtasidagi farqni hisoblang
--9 Har bir toifadagi eng qimmat 3 ta mahsulotni toping
--10 Buyurtma sanasi bo'yicha mintaqaga to'g'ri keladigan sotuvlarning umumiy summasini hisoblang--3 Mahsulot toifasi uchun maksimal umumiy miqdorni toping
--4 Tovar toifasidagi mahsulotlarning minimal narxini toping
--5 3 kunlik savdolarning harakatlanuvchi o'rtacha ko'rsatkichini hisoblang (oldingi kun, joriy kun, keyingi kun)
--6 Hudud bo'yicha jami sotishni toping
--7 Xaridorlarning umumiy xarid miqdoridan kelib chiqqan holda reytingini hisoblang
--8 Har bir mijoz uchun joriy va oldingi sotuv summasi o'rtasidagi farqni hisoblang
--9 Har bir toifadagi eng qimmat 3 ta mahsulotni toping
--10 Buyurtma sanasi bo'yicha mintaqaga to'g'ri keladigan sotuvlarning umumiy summasini hisoblang

select customer_name,
       sum(unit_price*quantity_sold) as sum_
from sales_data
group by customer_name

--2  Mahsulot toifasidagi buyurtmalar sonini hisoblang
select product_category,count(quantity_sold) as sum_pp from sales_data
group  by product_category



--3 Mahsulot toifasi uchun maksimal umumiy miqdorni toping
;with cte as(
select product_category,sum (quantity_sold) as sum_pp from sales_data
group  by product_category)
select product_category, max(sum_pp)from cte
group by product_category

--4 Tovar toifasidagi mahsulotlarning minimal narxini toping
;with cte as (
select 
        min(unit_price) over(partition by product_category) as mmin,
		product_category

from sales_data)
select distinct*
from cte

--5 3 kunlik savdolarning harakatlanuvchi o'rtacha ko'rsatkichini hisoblang (oldingi kun, joriy kun, keyingi kun)
select 
        avg(unit_price) over (order by order_date rows between 1 preceding and 1 following ) as avg_salary 
       
from sales_data

--6 Hudud bo'yicha jami sotishni toping
select region,
       sum(total_amount) as sum_
	   from sales_data
group by region

--7 Xaridorlarning umumiy xarid miqdoridan kelib chiqqan holda reytingini hisoblang
;with cte as (
select  customer_name,
      sum(quantity_sold*unit_price) as sum_salary
from sales_data
group by customer_name)
select customer_name,
       ROW_NUMBER() over (order by sum_salary)as reting

from cte

--8 Har bir mijoz uchun joriy va oldingi sotuv summasi o'rtasidagi farqni hisoblang
;with cte as (
select customer_name,
       unit_price-
      LAG(unit_price,1 ,0)OVER (order by customer_id)as lag_

from sales_data)
select customer_name, sum(lag_) from cte
group by customer_name

----9 Har bir toifadagi eng qimmat 3 ta mahsulotni toping
;with cte as(
select product_category,
       product_name,
	   
	   ROW_NUMBER() over (partition by product_category order by unit_price desc ) nr
from sales_data)
select * from cte
where nr>=1 and nr<=3

--10 Buyurtma sanasi bo'yicha mintaqaga to'g'ri keladigan sotuvlarning umumiy summasini hisoblang
select REGION, 
       sum(total_amount) over (partition by region order by order_date)  Cumulative_Sales
from sales_data
ORDER BY total_amount ,order_date

---11Compute Cumulative Revenue per Product Category
--Mahsulot toifasi bo'yicha jami daromadni hisoblang
SELECT product_category,
sum(total_amount)as sum_total FROM sales_data 
group by  product_category

--12 Bu erda siz oldingi qiymatlarning yig'indisini topishingiz kerak. Iltimos, namuna kiritish va kutilgan natijani ko'rib chiqing.
--mple Input

--| ID |
--|----|
--|  1 |
--|  2 |
--|  3 |
--|  4 |
--|  5 |
--Expected Output

--| ID | SumPreValues |
--|----|--------------|
--|  1 |            1 |
--|  2 |            3 |
--|  3 |            6 |
--|  4 |           10 |
--|  5 |           15 |

creATE TABLE ID (ID INT)
INSERT INTO  id values(1),(2),(3),(4),(5) 

;with cte as (
select id,ROW_NUMBER() over (order by id) as rn from id)
select [id], sum(rn)over (order by [id]) from cte

--13 Sum of Previous Values to Current Value
--Oldingi qiymatlarning joriy qiymatga yig'indisi
CREATE TABLE OneColumn (
    Value SMALLINT
);
INSERT INTO OneColumn VALUES (10), (20), (30), (40), (100);
with cte as(
select value,
       ROW_NUMBER()over (order by (select 1)) as rn
	   from OneColumn)

select value ,
       sum(value) over (order by rn) as rn from cte
---14 Find customers who have purchased items from more than one product_category
---Bir nechta mahsulot_kategoriyasidan mahsulot sotib olgan mijozlarni toping


SELECT 
    customer_id,
    customer_name,
    COUNT(DISTINCT product_category) AS category_count
FROM 
    sales_data
GROUP BY 
    customer_id, customer_name
HAVING 
    COUNT(DISTINCT product_category) > 1;

	---15Find Customers with Above-Average Spending in Their Region

	---O'z mintaqasida o'rtachadan yuqori xarajatlarga ega mijozlarni toping
	;WITH CTE AS (
	SELECT *,
	       AVG(total_amount) OVER (PARTITION BY REGION ) AS AVG_SALARY
	
	FROM sales_data)
	SELECT  CUSTOMER_NAME ,
	        total_amount,
			AVG_SALARY
	FROM CTE
	WHERE total_amount>AVG_SALARY

-- 15 Rank customers based on their total spending (total_amount) within each region. 
--If multiple customers have the same spending, they should receive the same rank.
	
	--Mijozlarni har bir mintaqadagi umumiy xarajatlari (jami_summa) asosida tartiblang.
	--Agar bir nechta mijozlar bir xil xarajatlarga ega bo'lsa, ular bir xil darajani olishlari kerak.
	WITH CTE AS(
SELECT *,
       SUM(total_amount) OVER (PARTITION BY REGION ) AS SUM_T 
FROM  sales_data)
SELECT customer_name,
      DENSE_RANK() OVER (ORDER BY SUM_T) AS DR
FROM CTE

--17 Calculate the running total (cumulative_sales) of total_amount for each customer_id, ordered by order_date.
--18 Calculate the sales growth rate (growth_rate) for each month compared to the previous month.
--19 Identify customers whose total_amount is higher than their last order''s total_amount.(Table sales_data)

--17 order_date bo'yicha buyurtma qilingan har bir mijoz_identifikatori uchun jami_summaning amaldagi jami (jami_sotish)ni hisoblang.
--18 O'tgan oyga nisbatan har oy uchun savdo o'sish sur'atini (o'sish_stavkasi) hisoblang.
--19 Jami_summi oxirgi buyurtmasining umumiy_summasidan yuqori bo'lgan mijozlarni aniqlang.(Sotuvlar_ma'lumotlari jadvali)
SELECT customer_id,
      SUM(total_amount) OVER (PARTITION BY ORDER_Date) tota_sum
	  FROM sales_data

--18 O'tgan oyga nisbatan har oy uchun savdo o'sish sur'atini (o'sish_stavkasi) hisoblang.

;WITH CTE AS(
SELECT MONTH(order_date) AS MONTHID,SUM(total_amount) AS MONTHLYSALES FROM sales_data
GROUP BY MONTH(order_date)
)
,CTE1 AS (
SELECT MONTHID,
       MONTHLYSALES,
       LAG(MONTHLYSALES,1) OVER (ORDER BY MONTHID) PREVMONTH,
        (MONTHLYSALES -  LAG(MONTHLYSALES,1,0) OVER (ORDER BY MONTHID)) -- AS DIFF 
        / 
        LAG(MONTHLYSALES,1) OVER (ORDER BY MONTHID)  * 100 AS GROWTHPERCENTAGE --PREVMONTH       
FROM CTE
)
SELECT MONTHID,
       MONTHLYSALES,
       PREVMONTH,
       CAST(ROUND(GROWTHPERCENTAGE,2) AS FLOAT) GROWTHPERCENTAGE  
FROM CTE1

--19 Jami_summi oxirgi buyurtmasining umumiy_summasidan yuqori bo'lgan mijozlarni aniqlang.(Sotuvlar_ma'lumotlari jadvali)
;WITH CTE AS (
SELECT
    sale_id,
    customer_id,
    customer_name,
    order_date,
    total_amount,
    LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_total_amount
FROM
    sales_data)
	SELECT *FROM CTE
WHERE
    total_amount > previous_total_amount

---20 Identify Products that prices are above the average product price
---Narxlari o'rtacha mahsulot narxidan yuqori bo'lgan mahsulotlarni aniqlang
WITH CTE AS (
SELECT customer_name,
        unit_price,
       AVG(unit_price) OVER () AS AVG_
FROM sales_data)
SELECT customer_name FROM CTE
WHERE unit_price>AVG_






CREATE TABLE MyData (
    Id INT, Grp INT, Val1 INT, Val2 INT
);
INSERT INTO MyData VALUES
(1,1,30,29), (2,1,19,0), (3,1,11,45), (4,2,0,0), (5,2,100,17);
---21 In this puzzle you have to find the sum of val1 and val2 for each group and put that value at
--the beginning of the group in the new column. The challenge here is to do this in a single select.
--For more details please see the sample input and expected output.

--Ushbu jumboqda siz har bir guruh uchun val1 va val2 yig'indisini topishingiz va bu qiymatni guruh boshiga 
--yangi ustunga qo'yishingiz kerak. Bu erda qiyinchilik buni bitta tanlovda qilishdir.
--Batafsil ma'lumot uchun namuna kiritish va kutilgan natijaga qarang.

--| Id | Grp | Val1 | Val2 | Tot  |
--|----|-----|------|------|------|
--| 1  | 1   | 30   | 29   | 134  |
--| 2  | 1   | 19   | 0    | NULL |
--| 3  | 1   | 11   | 45   | NULL |
--| 4  | 2   | 0    | 0    | 117  |
--| 5  | 2   | 100  | 17   | NULL |
;WITH CTE AS(
SELECT *,
       SUM(Val1) OVER (PARTITION BY GRP)  +
	    SUM(Val2) OVER (PARTITION BY GRP) AS TOT
	

FROM MyData)
SELECT Id,
       GRP,
	   VAL1,
	   VAL2,
	   CASE
	   WHEN ID=( RANK() OVER (ORDER BY TOT DESC))THEN TOT
	   ELSE NULL
	   END AS TOT
FROM CTE


CREATE TABLE TheSumPuzzle (
    ID INT, Cost INT, Quantity INT
);
INSERT INTO TheSumPuzzle VALUES
(1234,12,164), (1234,13,164), (1235,100,130), (1235,100,135), (1236,12,136);

--22  Here you have to sum up the value of the cost column based on the values of Id.
--For Quantity if values are different then we have to add those values.
--Please go through the sample input and expected output for details.

--22 Bu yerda siz Id qiymatlari asosida xarajat ustunining qiymatini jamlashingiz kerak.
--Miqdor uchun qiymatlar boshqacha bo'lsa, biz ushbu qiymatlarni qo'shishimiz kerak.
--Tafsilotlar uchun namuna kiritish va kutilgan natijani ko'rib chiqing.

--| Id   | Cost | Quantity |
--|------|------|----------|
--| 1234 | 25   | 164      |
--| 1235 | 200  | 265      |
--| 1236 | 12   | 136      |


SELECT 
    ID,
    SUM(Cost) AS Cost,

    CASE 
        WHEN COUNT(DISTINCT Quantity) = 1 THEN MIN(Quantity)
        ELSE SUM(DISTINCT Quantity)
    END AS Quantity
FROM 
    TheSumPuzzle
GROUP BY 
    ID;
	--23 From following set of integers, write an SQL statement to determine the expected outputs
CREATE TABLE Seats 
( 
SeatNumber INTEGER 
); 

INSERT INTO Seats VALUES 
(7),(13),(14),(15),(27),(28),(29),(30), 
(31),(32),(33),(34),(35),(52),(53),(54); 
Output:

-----------------------
--|Gap Start	|Gap End|
-----------------------
--|     1     |	6	|
--|     8     |	12	|
--|     16    |	26	|
--|     36    |	51	|
-----------------------
--Quyidagi butun sonlar to‘plamidan kutilgan natijalarni aniqlash uchun SQL bayonotini yozing
SELECT * ,
       ROW_NUMBER() OVER (ORDER BY SEATNUMBER) AS RN
FROM Seats



