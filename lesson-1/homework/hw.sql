Data – This is a numerical, textual or other form of representation of real-life objects, events or processes (for example, name, age, price)
Database – This is a system that allows you to systematically store, manage and quickly access data.
Relational database – Data is stored in the form of tables and they are linked to each other (through foreign keys, primary keys).
Table – This is a structure that stores data in the form of rows and columns.
High-level security (Security) – Protects data through authentication and permissions.
Backup and Restore (Backup and Restore) – Allows you to recover data in case of loss.
Analysis Services (Analysis Services) – Tools for Business Intelligence.
Relational Database Management (RDBMS) – Manage data through tables.
Transaction support (ACID principles) – Ensures data integrity.
Authentication – The user connects using the username they use to log in to Windows.
SQL Server Authentication – Connects using a custom SQL username and password.
Create a new database called SchoolDB in SSMS:
Differences between SQL Server, SSMS, and SQL:
Concept Description
SQL Server Database management software (DBMS).
SSMS (SQL Server Management Studio) A graphical interface for working with SQL Server.
SQL (Structured Query Language) A language for writing queries for working with data
Types of SQL commands and examples:
Type Full name Description Example
DQL Data Query Language Data query SELECT * FROM Students;
DML Data Manipulation Language Data manipulation INSERT INTO Students VALUES (1, 'Ali', 20);
DDL Data Definition Language Create/modify structure CREATE TABLE Students (...);
DCL Data Control Language Manage rights GRANT SELECT ON Students TO user1;
TCL Transaction Control Language Manage transactions BEGIN TRANSACTION; ... COMMIT;

➕ 8. Insert three records into the Students table:
sql
