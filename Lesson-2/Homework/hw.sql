-- Create a table `Employees` with columns: `EmpID` INT, `Name` (VARCHAR(50)), and `Salary` (DECIMAL(10,2)).
CREATE TABLE Employees (EmpID INT, Name VARCHAR(50), Salary DECIMAL(10,2))
-- Insert three records into the `Employees` table using different INSERT INTO approaches (single-row insert and multiple-row insert).  
INSERT INTO Employees (EmpID, Name) VALUES (1, 'JASSS')
SELECT * FROM dbo.Employees
-- Update the `Salary` of an employee where `EmpID = 1`.  
--Update the `Salary` of an employee to `7000` where `EmpID = 1`.  ]
ALTER TABLE Employees
ADD AGE INT
UPDATE Employees
SET SALARY=7000
