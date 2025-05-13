CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10, 2)
);
INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Alice', 5000.00);
INSERT INTO Employees (EmpID, Name, Salary)
VALUES
(2, 'Bob', 6000.00),
(3, 'Charlie', 5500.00);
UPDATE Employees
SET Salary = 7000.00
WHERE EmpID = 1;
DELETE FROM Employees
WHERE EmpID = 2;
ALTER TABLE Employees
MODIFY Name VARCHAR(100);
ALTER TABLE Employees
ADD Department VARCHAR(50);
ALTER TABLE Employees
MODIFY Salary FLOAT;
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
TRUNCATE TABLE Employees;
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT 1, 'HR'
UNION ALL
SELECT 2, 'Finance'
UNION ALL
SELECT 3, 'IT'
UNION ALL
SELECT 4, 'Marketing'
UNION ALL
SELECT 5, 'Sales';
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;
TRUNCATE TABLE Employees;
ALTER TABLE Employees
DROP COLUMN Department;
RENAME TABLE Employees TO StaffMembers;
DROP TABLE Departments;
