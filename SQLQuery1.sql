CREATE DATABASE TechWorldHDRB;
use TechWorldHDRB;
Create Table TemporaryStaff(
StaffID int primary key ,
StaffName NVARCHAR(50),
HireDate DATE
)
Select * From TemporaryStaff;

Create Table Departments (
DepartmentID int primary key,
DepartmentName NVARCHAR(50)
)
Select * From Departments;

CREATE TABLE  Employees(
EmployeeID int primary key ,
FullName NVARCHAR(100)NOT NULL,
Email VARCHAR(100)UNIQUE,
Salary DECIMAL(10,2),
DepartmentID int
)

ALTER TABLE Employees
ADD PhoneNumber VARCHAR(20);

DROP TABLE TemporaryStaff;

INSERT INTO Departments
VALUES(1,'IT');

INSERT INTO Departments
VALUES(2,'HR');

INSERT INTO Departments
VALUES(3,'Finance');

Select * From Departments;

INSERT INTO Employees 
Values(1,'Ahmad Ali','ahmad@techworld.com',1200.00,1,'0791111111');

INSERT INTO Employees 
Values(2,'Sara Hassan','sara@techworld.com',950.00,2,'0792222222');

INSERT INTO Employees 
Values(3,'Zaid Omar','zaid@techworld.com',1500.00,1,'0793333333');

INSERT INTO Employees 
Values(4,'Mona Khaled','mona@techworld.com',800.00,3,'0794444444');


UPDATE Employees
SET Salary=1350.00
WHERE EmployeeID=1;

Delete From Employees
Where EmployeeID=4;

Select * From Employees;

Select FullName,Salary From Employees;

Select SUM(Salary) as TotalSalaries From Employees ;

Select AVG(Salary) as AveragesSalary From Employees;

Select MAX(Salary)as HighestSalary ,Min(Salary)as LowestSalary From Employees;

Select Count(*)as TotalEmployees From Employees;

