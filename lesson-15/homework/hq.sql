create database homm__16
use homm__16
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);
select * from employees
--1 Task: Retrieve employees who earn the minimum salary in the company. Tables: employees (columns: id, name, salary)
select id,Name,min(salary)as min_salary  from employees
group by id,Name

CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products (id, product_name, price) VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 400),
(3, 'Smartphone', 800),
(4, 'Monitor', 300);
--2 Task: Retrieve products priced above the average price. Tables: products (columns: id, product_name, price)
--Vazifa: O'rtacha narxdan yuqori bo'lgan mahsulotlarni olib kelish. Jadval: mahsulotlar (ustunlar: id, mahsulot_nomi, narx)



select * from cte  
select product_name, price,(
select  avg(price) as avg_salary  from products
)as rd from products
where price>(
select  avg(price) as avg_salary  from products
)



CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'Sales'),
(2, 'HR');

INSERT INTO employees (id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);

--3 . Find Employees in Sales Department Task: Retrieve employees who work in the "Sales" department. 
--Tables: employees (columns: id, name, department_id), departments (columns: id, department_name)

--Sotuv bo'limidagi xodimlarni topish. Vazifa: "Sotuv" bo'limida ishlaydigan xodimlarni qaytarish. 
--Jadval: xodimlar (ustunlar: id, ism, bo'lim_id), bo'limlar (ustunlar: id, bo'lim_nomi)


select name,department_name from employees e full join departments d on e.department_id=d.id
where department_name ='sales'


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');

INSERT INTO orders (order_id, customer_id) VALUES
(1, 1),
(2, 1);

--4 Task: Retrieve customers who have not placed any orders. Tables: customers (columns: customer_id, name), orders (columns: order_id, customer_id)
--Vazifa: Hech qanday buyurtma bermagan mijozlarni topish. Jadval: mijozlar (ustunlar: mijoz_id, ism), buyurtmalar (ustunlar: buyurtma_id, mijoz_id)
select * from customers
select * from orders
select name from customers c full join orders o on c.customer_id=o.customer_id
where order_id is null



CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products (id, product_name, price, category_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);


--Task: Retrieve products with the highest price in each category. Tables: products (columns: id, product_name, price, category_id)
--Vazifa: Har bir kategoriya bo'yicha eng yuqori narxdagi mahsulotlarni olib kelish. Jadval: mahsulotlar (ustunlar: id, mahsulot_nomi, narx, kategoriya_id)
select * from products
select pc.category_id,max(pc.price) as max_price from products as pp full join products as pc on pp.id=pc.category_id
group by   pc.category_id
having  pc.category_id is not null


drop table  departments
drop table employees

CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO employees (id, name, salary, department_id) VALUES
(1, 'Jack', 80000, 1),
(2, 'Karen', 70000, 1),
(3, 'Leo', 60000, 2);

-- 6 Task: Retrieve employees working in the department with the highest average salary.
--Tables: employees (columns: id, name, salary, department_id), departments (columns: id, department_name)

--Vazifa: Eng yuqori o'rtacha maoshga ega bo'lgan bo'limda ishlayotgan xodimlarni olish. 
--Jadvallar: xodimlar (ustunlar: id, ism, maosh, bo'lim_id), bo'limlar (ustunlar: id, bo'lim_nomi)


select top 1  avg(salary) avg_salary ,department_name from employees e full join departments d on  e.department_id=d.id
group by department_name
order by avg_salary  desc

--select *,(select * from departments


--select * from departments
--where id= department_id

select id , ff.department_name, avg_salary  from departments join (select top 1  avg(salary) avg_salary ,department_name from employees e full join departments d on  e.department_id=d.id
group by department_name
order by avg_salary  desc) as ff on departments.department_name=ff.department_name

select name  from employees e join (select id , ff.department_name, avg_salary  from departments join (select top 1  avg(salary) avg_salary ,department_name from employees e full join departments d on  e.department_id=d.id
group by department_name
order by avg_salary  desc) as ff on departments.department_name=ff.department_name) as gg on e.department_id=gg.id

drop table employees 

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees (id, name, salary, department_id) VALUES
(1, 'Mike', 50000, 1),
(2, 'Nina', 75000, 1),
(3, 'Olivia', 40000, 2),
(4, 'Paul', 55000, 2);

--7 Task: Retrieve employees earning more than the average salary in their department. Tables: employees (columns: id, name, salary, department_id)
--Vazifa: Bo'limidagi o'rtacha maoshdan ko'proq tushiradigan xodimlarni olish. Jadvallar: xodimlar (ustunlar: id, ism, maosh, bo'lim_id)
select avg(salary) as avg_ from employees

select name,(select avg(salary) as avg_ from employees) as avg__ from employees
where salary>(select avg(salary) as avg_ from employees)


CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE grades (
    student_id INT,
    course_id INT,
    grade DECIMAL(4, 2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO students (student_id, name) VALUES
(1, 'Sarah'),
(2, 'Tom'),
(3, 'Uma');

INSERT INTO grades (student_id, course_id, grade) VALUES
(1, 101, 95),
(2, 101, 85),
(3, 102, 90),
(1, 102, 80);

--8 Task: Retrieve students who received the highest grade in each course. Tables: students (columns: student_id, name), grades (columns: student_id, course_id, grade)
--Vazifa: Har bir kursda eng yuqori ball olgan talabalarni qaytarib olish. Jadvallar: talabalar (ustunlar: talabalar_id, ism), ballar (ustunlar: talabalar_id, kurs_id, ball)

select * from students
select * from grades

select  course_id,max(grade) as max_ from  students s join  grades g on s.student_id=g.student_id
group by course_id

select student_id from grades g join (select  course_id,max(grade) as max_ from  students s join  grades g on s.student_id=g.student_id
group by course_id) as ss on g.course_id=ss.course_id and g.grade=ss.max_

select name from students s join (

select student_id from grades g join (select  course_id,max(grade) as max_ from  students s join  grades g on s.student_id=g.student_id
group by course_id) as ss on g.course_id=ss.course_id and g.grade=ss.max_) as dd on s.student_id=dd.student_id



CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees (id, name, salary, department_id) VALUES
(1, 'Alex', 70000, 1),
(2, 'Blake', 90000, 1),
(3, 'Casey', 50000, 2),
(4, 'Dana', 60000, 2),
(5, 'Evan', 75000, 1);

-- 10 Task: Retrieve employees with salaries above the company average but below the maximum in their department. 
--Tables: employees (columns: id, name, salary, department_id)

--Vazifa: Kompaniya o'rtacha maoshidan yuqori, lekin o'z bo'limidagi maksimal maoshdan past bo'lgan xodimlarni olib kelish.
--Jadvallar: xodimlar (ustunlar: id, ism, maosh, bo'lim_id)
select avg(salary) as avg_salary from employees

select max(salary)as max_salary, department_id from employees
group by department_id

select * from employees e join 
select max(salary)as max_salary, department_id from employees
group by department_id) as ss on e.department_id=ss.department_id
