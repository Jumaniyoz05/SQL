
. Write a SQL query to find strings from a table where the string itself contains the % character.(TestPercent)
select * from TestPercent
where Strs like '%1%%' escape '1'
--
--3. In this puzzle you will have to split a string based on dot(.).(Splitter)

--select * from Splitter
--select *, string_split(vals,'.')

SELECT vals,SUBSTRING(vals,1, CHARINDEX('.' ,vals)-1) ,
            SUBSTRING(vals, CHARINDEX('.' ,vals)+1,    len (CHARINDEX('.' ,vals)) +1)

from Splitter


--4. Write a SQL query to replace all integers (digits) in the string with 'X'.(1234ABC123456XYZ1234567890ADS)

--Find the employees who have been with the company for more than 10 years, but less than 15 years. 
--Display their Employee ID, First Name, Last Name, Hire Date, and the Years of Service (calculated as the number of years between the current date and the hire date).(Employees)


select * from Employees

select datediff(year ,'2025-06-15' ,' 2025-02-02' )
 select Employee_ID, First_Name, Last_Name, Hire_Date,  datediff( YEAR, getdate() ,Hire_Date ) as  Years_of_Service  from Employees


 --Write a SQL query to separate the integer values and the character values into two different columns.(rtcfvty34redt)
 select CONCAT( SUBSTRING('rtcfvty34redt' , 1 ,CHARINDEX(  'y','rtcfvty34redt')   ), SUBSTRING('rtcfvty34redt' , CHARINDEX('4','rtcfvty34redt' )+1, len('rtcfvty34redt')) ) as harf,
         SUBSTRING('rtcfvty34redt', CHARINDEX(  'y','rtcfvty34redt')+1 ,2 ) as son
		

		





 select CHARINDEX(  'y','rtcfvty34redt')

 --5 write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.(weather)
 ---O'tgan (kecha) sanalardagi haroratga nisbatan yuqori bo'lgan barcha sanalarning Idlarini topish uchun SQL so'rovini yozing.
 select * from weather



SELECT w1.Id
FROM Weather w1
JOIN Weather w2
  ON day(w1.RecordDate) = day(w2.RecordDate)+1
WHERE w1.Temperature > w2.Temperature

--- 6 Write an SQL query that reports the first login date for each player.(Activity)
--Har bir o'yinchining birinchi kirish sanasini hisobot qiluvchi SQL so'rovini yozing.(Faoliyat)


--

SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;


--7Your task is to return the third item from that list.(fruits)
--Sizning vazifangiz ro'yxatdagi uchinchi narsani qaytarishdir.(mevalar)
select* from fruits
SELECT --fruit_list, --SUBSTRING(fruit_list, 1 , CHARINDEX('O',fruit_list )-1),
                   SUBSTRING(fruit_list ,CHARINDEX('O',fruit_list ),CHARINDEX(',',fruit_list ) )AS C






FROM fruits
                
-- 5Write a SQL query to create a table where each character from the string will be converted into a row.(sdgfhsdgfhs@121313131)	
--Har bir belgi matndan qatorga aylantirilishi uchun jadval yaratish uchun SQL so'rovini yozing. (sdgfhsdgfhs@121313131)
-- Step 1: Declare the string
DECLARE @inputString VARCHAR(100) = 'sdgfhsdgfhs@121313131';

-- Step 2: Create a table to hold each character
CREATE TABLE Characters (
    CharPosition INT,
    CharacterValue CHAR(1)
);

-- Step 3: Use a Tally Table (sequence of numbers) to break the string into characters
;WITH Numbers AS (
    SELECT TOP (LEN(@inputString))
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects  -- Large system view to generate enough rows
)
-- Step 4: Insert each character into the table
INSERT INTO Characters (CharPosition, CharacterValue)
SELECT 
    n,
    SUBSTRING(@inputString, n, 1)
FROM Numbers;
SELECT * FROM Characters
---- Step 5: Select the result
--SELECT * FROM Characters;




---6 You are given two tables: p1 and p2. Join these tables on the id column. The catch is: when the value of p1.code is 0, replace it with the value of p2.code.(p1,p2)
--Sizga ikkita jadval beriladi: p1 va p2. Ushbu jadvallarni id ustuni bo'yicha biriktiring. Qoida shuki: agar p1.code qiymati 0 bo'lsa, uni p2.code qiymati bilan almashtiring.
select * from p1
select * from p2
select 
       case
	      when p1.code = 0 then p2.code
		  else p1.code end as final_code
		  


from p1 join p2 on p1.id=p2.id

--7 Write an SQL query to determine the Employment Stage for each employee based on their HIRE_DATE. The stages are defined as follows:
--Har bir xodimning HIRE_DATE asosida Ishga olish bosqichini aniqlash uchun SQL so'rovini yozing. Bosqichlar quyidagicha belgilangan:

--If the employee has worked for less than 1 year → 'New Hire'
--If the employee has worked for 1 to 5 years → 'Junior'
--If the employee has worked for 5 to 10 years → 'Mid-Level'
--If the employee has worked for 10 to 20 years → 'Senior'
--If the employee has worked for more than 20 years → 'Veteran'(Employees)


select HIRE_DATE, datediff(YYYY, HIRE_DATE, getdate() )as satj from Employees

     SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE,
    DATE_PART('year', AGE(CURRENT_DATE, HIRE_DATE)) AS YEARS_OF_SERVICE,
    CASE
        WHEN AGE(CURRENT_DATE, HIRE_DATE) < INTERVAL '1 year' THEN 'New Hire'
        WHEN AGE(CURRENT_DATE, HIRE_DATE) < INTERVAL '4 years' THEN 'Junior'
        WHEN AGE(CURRENT_DATE, HIRE_DATE) < INTERVAL '8 years' THEN 'Mid-level'
        WHEN AGE(CURRENT_DATE, HIRE_DATE) < INTERVAL '16 years' THEN 'Senior'
        ELSE 'Veteran'
    END AS EMPLOYMENT_STAGE
FROM
    Employees;
 


-- MySQL 8+ version
WITH RECURSIVE SplitVals AS (
    SELECT 
        id,
        SUBSTRING_INDEX(val, ',', 1) AS part,
        SUBSTRING_INDEX(val, ',', -1) AS rest,
        val,
        1 as level
    FROM MultipleVals
    UNION ALL
    SELECT
        id,
        SUBSTRING_INDEX(SUBSTRING_INDEX(val, ',', level + 1), ',', -1),
        rest,
        val,
        level + 1
    FROM SplitVals
    WHERE level < LENGTH(val) - LENGTH(REPLACE(val, ',', '')) + 1
),
Swapped AS (
    SELECT
        id,
        CONCAT(SUBSTRING(part, 2, 1), SUBSTRING(part, 1, 1), SUBSTRING(part, 3)) AS swapped_part,
        level
    FROM SplitVals
),
Rebuilt AS (
    SELECT id, GROUP_CONCAT(swapped_part ORDER BY level) AS result
    FROM Swapped
    GROUP BY id
)
SELECT * FROM Rebuilt;

SELECT player_id, 
       device_id
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY player_id ORDER BY event_date ASC) AS rnk
    FROM Activity
    WHERE event_type = 'login'
) t
WHERE rnk = 1;

WITH SalesWithWeek AS (
    SELECT 
        area,
        sale_date,
        WEEK(sale_date, 1) AS week_num, -- Mode 1: Monday is the first day
        YEAR(sale_date) AS year,
        sales_amount
    FROM Sales
),
WeekTotals AS (
    SELECT 
        year,
        week_num,
        SUM(sales_amount) AS total_week_sales
    FROM SalesWithWeek
    GROUP BY year, week_num
),
PercentageCalc AS (
    SELECT 
        s.area,
        s.sale_date,
        s.year,
        s.week_num,
        s.sales_amount,
        w.total_week_sales,
        ROUND((s.sales_amount / w.total_week_sales) * 100, 2) AS percent_of_week
    FROM SalesWithWeek s
    JOIN WeekTotals w
      ON s.year = w.year AND s.week_num = w.week_num
)
SELECT *
FROM PercentageCalc
ORDER BY year, week_num, area, sale_date;




--7 Write an SQL query to determine the Employment Stage for each employee based on their HIRE_DATE. The stages are defined as follows:
--Har bir xodimning HIRE_DATE asosida Ishga olish bosqichini aniqlash uchun SQL so'rovini yozing. Bosqichlar quyidagicha belgilangan:


select HIRE_DATE, datediff(YYYY, HIRE_DATE, getdate() )as satj from Employees
