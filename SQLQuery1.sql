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

USE TechWorldHDRB;
--TASK 2
CREATE TABLE AccessCards(
CardID INT PRIMARY KEY,
CardNumber VARCHAR(50) NOT NULL UNIQUE ,
EmployeeID INT UNIQUE FOREIGN KEY  
REFERENCES Employees(EmployeeID)
)


 

CREATE TABLE PROJECTS (
ProjectID int primary key,
ProjectName VARCHAR(100)NOT NULL
)
Select*FROM PROJECTS


CREATE Table Employee_Projects(
AssignDate Date,

EmployeeID INT FOREIGN KEY
REFERENCES Employees(EmployeeID),

ProjectID INT FOREIGN KEY
REFERENCES PROJECTS(ProjectID),

PRIMARY KEY (EmployeeID, ProjectID)
)

INSERT INTO PROJECTS VALUES(1,'AI & Security Training'),(2,'Cloud Migration');

INSERT INTO AccessCards
VALUES(101, '101', 1),(102, '102', 2),(103, '103', 3);

INSERT INTO Employee_Projects (EmployeeID, ProjectID, AssignDate)
VALUES(1,1,'2026-10-29'),(1,2,'2026-10-29'),(2,1,'2026-10-29'),(3,2,'2026-10-29')

SELECT * FROM AccessCards;

SELECT * FROM PROJECTS;

SELECT * FROM Employee_Projects;

SELECT Employees.FullName , Employees.Salary, Departments.DepartmentName
FROM Employees
INNER JOIN Departments 
ON Employees.DepartmentID = Departments.DepartmentID;

SELECT Departments.DepartmentName,Employees.FullName
From Departments
LEFT JOIN Employees
ON Departments.DepartmentID = Employees.DepartmentID;

SELECT Employees.FullName , AccessCards.CardNumber
FROM Employees
INNER JOIN AccessCards
ON AccessCards.EmployeeID=Employees.EmployeeID

SELECT Employees.FullName ,PROJECTS.ProjectName,Employee_Projects.AssignDate
FROM Employee_Projects
INNER JOIN PROJECTS
ON Employee_Projects.EmployeeID = PROJECTS.ProjectID
INNER JOIN Employees
ON Employee_Projects.ProjectID = PROJECTS.ProjectID;

SELECT Employees.DepartmentID,SUM(Employees.Salary) AS TotalSalary,COUNT(Employees.EmployeeID) AS EmployeeCount
FROM Employees
GROUP BY Employees.DepartmentID;

SELECT Employees.DepartmentID,AVG(Employees.Salary)AS AvgSalary
From Employees
GROUP BY Employees.DepartmentID
HAVING AVG(Employees.Salary)>1000.00

Select * From Employees
Where Salary > ( Select AVG(SALARY) From Employees);


CREATE VIEW vw_EmployeeDetails AS
SELECT EmployeeID ,Employees.FullName,Employees.Email , Departments.DepartmentName
FROM Employees
INNER JOIN Departments 
ON Employees.DepartmentID = Departments.DepartmentID;


CREATE PROCEDURE sp_GetEmployeesByDepartment
    @DeptID INT
AS
BEGIN
    SELECT *
    FROM Employees
    WHERE DepartmentID = @DeptID;
END;


CREATE TABLE EmployeeAudit
(
    AuditID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT,
    Action VARCHAR(50),
    ActionDate DATETIME
);

GO

CREATE TRIGGER trg_EmployeeDelete
ON Employees
AFTER DELETE
AS
BEGIN
    INSERT INTO EmployeeAudit (EmployeeID, Action, ActionDate)
    SELECT EmployeeID, 'DELETE', GETDATE()
    FROM deleted;
END;








