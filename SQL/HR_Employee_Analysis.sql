-- HR Employee SQL Analysis
-- Course: DATA 581 - Data Visualization | Gonzaga University
-- Author: Harrison Christophersen

-- SECTION 1: SCHEMA AND DATA

CREATE TABLE Departments (
    DeptID   INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

INSERT INTO Departments VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'Finance'),
(4, 'Operations'),
(5, 'Human Resources');

CREATE TABLE Employees (
    EmployeeID   INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DeptID       INT,
    HireDate     DATE,
    Salary       DECIMAL(10,2),
    JobLevel     VARCHAR(20),
    Gender       VARCHAR(10),
    Age          INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees VALUES
(1001,'Linda Wright',1,'2016-03-03',52400,'Junior','Female',37),
(1002,'Jennifer Smith',1,'2011-12-14',143500,'Manager','Female',59),
(1003,'Andrew Walker',1,'2010-08-06',95900,'Senior','Male',57),
(1004,'Mark Garcia',1,'2016-03-28',84200,'Mid','Male',22),
(1005,'Matthew Brown',1,'2017-07-20',50000,'Junior','Male',28),
(1006,'Betty Carter',1,'2010-12-22',97500,'Senior','Female',51),
(1007,'Joshua Anderson',1,'2024-02-06',87100,'Mid','Male',61),
(1008,'Joseph Williams',1,'2024-10-31',62500,'Junior','Male',36),
(1009,'Nancy Garcia',1,'2020-03-03',85900,'Mid','Female',62),
(1010,'Andrew Garcia',1,'2025-05-01',108600,'Senior','Male',26),
(1011,'Lisa Johnson',2,'2018-01-15',55000,'Junior','Female',31),
(1012,'Robert Wilson',2,'2015-06-10',76000,'Mid','Male',44),
(1013,'Karen Thomas',2,'2012-09-05',121000,'Manager','Female',52),
(1014,'Paul Martin',2,'2021-03-17',63000,'Junior','Male',27),
(1015,'Susan Lee',2,'2019-11-21',84500,'Mid','Female',38),
(1016,'Michael White',2,'2014-04-09',101500,'Senior','Male',49),
(1017,'Donna Hall',2,'2016-12-11',93500,'Senior','Female',46),
(1018,'Steven Clark',2,'2023-07-01',58000,'Junior','Male',24),
(1019,'Patricia Lewis',2,'2013-02-14',119000,'Manager','Female',55),
(1020,'Kevin Young',2,'2020-08-30',80500,'Mid','Male',35),
(1021,'Angela King',3,'2018-04-05',61000,'Junior','Female',30),
(1022,'Brian Scott',3,'2011-07-19',97500,'Senior','Male',53),
(1023,'Deborah Green',3,'2014-09-01',112500,'Manager','Female',50),
(1024,'Jason Adams',3,'2022-01-12',59000,'Junior','Male',25),
(1025,'Carol Baker',3,'2017-05-24',78500,'Mid','Female',40),
(1026,'Ryan Nelson',3,'2016-10-08',92500,'Senior','Male',45),
(1027,'Sharon Hill',3,'2013-06-18',104000,'Senior','Female',48),
(1028,'Gary Rivera',3,'2024-03-01',56500,'Junior','Male',23),
(1029,'Janet Cooper',3,'2012-08-22',127500,'Manager','Female',57),
(1030,'Eric Reed',3,'2019-02-15',82000,'Mid','Male',36),
(1031,'Emily Cook',4,'2018-02-10',57000,'Junior','Female',29),
(1032,'Daniel Morgan',4,'2015-10-03',79500,'Mid','Male',42),
(1033,'Brenda Bell',4,'2011-04-27',118500,'Manager','Female',54),
(1034,'Adam Murphy',4,'2021-08-11',60500,'Junior','Male',26),
(1035,'Cynthia Bailey',4,'2017-09-30',84500,'Mid','Female',39),
(1036,'Frank Rogers',4,'2014-05-16',99500,'Senior','Male',50),
(1037,'Diane Peterson',4,'2013-01-21',102000,'Senior','Female',47),
(1038,'Scott Kelly',4,'2024-04-05',56000,'Junior','Male',24),
(1039,'Helen Howard',4,'2012-12-12',130000,'Manager','Female',58),
(1040,'Greg Cox',4,'2019-07-18',83500,'Mid','Male',37),
(1041,'Laura Ward',5,'2018-11-08',59000,'Junior','Female',32),
(1042,'Patrick Torres',5,'2015-02-13',81500,'Mid','Male',43),
(1043,'Ruth Peterson',5,'2010-07-07',125000,'Manager','Female',56),
(1044,'Nathan Gray',5,'2022-06-01',62000,'Junior','Male',27),
(1045,'Teresa Ramirez',5,'2016-09-09',86500,'Mid','Female',41),
(1046,'Dennis James',5,'2014-11-20',98000,'Senior','Male',48),
(1047,'Janice Watson',5,'2013-03-14',106000,'Senior','Female',51),
(1048,'Sean Brooks',5,'2023-10-02',57500,'Junior','Male',25),
(1049,'Martha Price',5,'2011-05-17',132000,'Manager','Female',60),
(1050,'Jeff Long',5,'2019-08-26',85000,'Mid','Male',38);


-- SECTION 2: IN-CLASS QUERIES

-- Basic SELECT: all columns
SELECT * FROM Employees;

-- Select specific columns
SELECT EmployeeName, Salary, Age
FROM Employees;

-- Limit results to first 10
SELECT * FROM Employees LIMIT 10;

-- Filter: employees earning over $90,000
SELECT * FROM Employees
WHERE Salary > 90000;

-- Filter: employees older than 40
SELECT * FROM Employees
WHERE Age > 40;

-- Filter: female employees only
SELECT * FROM Employees
WHERE Gender = 'Female';

-- Filter: multiple conditions
SELECT * FROM Employees
WHERE Age > 40
AND Salary > 80000;

-- Sort: highest salaries first
SELECT EmployeeName, Salary
FROM Employees
ORDER BY Salary DESC;

-- Sort: youngest employees first
SELECT EmployeeName, Age
FROM Employees
ORDER BY Age ASC;

-- Aggregates: headcount, avg/max/min salary
SELECT COUNT(*) AS TotalEmployees FROM Employees;
SELECT AVG(Salary) AS AverageSalary FROM Employees;
SELECT MAX(Salary) AS HighestSalary FROM Employees;
SELECT MIN(Salary) AS LowestSalary FROM Employees;

-- GROUP BY: employee count per job level
SELECT JobLevel, COUNT(*) AS Employees
FROM Employees
GROUP BY JobLevel;

-- GROUP BY: average salary per job level
SELECT JobLevel, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY JobLevel;

-- JOIN: employee name + department name + salary
SELECT e.EmployeeName, d.DeptName, e.Salary
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID;

-- JOIN + GROUP BY: average salary by department
SELECT d.DeptName, AVG(e.Salary) AS AvgSalary
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
GROUP BY d.DeptName;

-- Bonus: highest paying department
SELECT d.DeptName, AVG(e.Salary) AS AvgSalary
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
GROUP BY d.DeptName
ORDER BY AvgSalary DESC;

-- Quiz Q1: employees younger than 30
SELECT * FROM Employees
WHERE Age < 30;

-- Quiz Q2: top 5 highest-paid employees
SELECT EmployeeName, Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 5;

-- Quiz Q3: employee count per department
SELECT d.DeptName, COUNT(*) AS EmployeeCount
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
GROUP BY d.DeptName;

-- Quiz Q4: employee name and department name
SELECT e.EmployeeName, d.DeptName
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID;


-- SECTION 3: EXTENDED ANALYTICS

-- Salary summary stats in one query
SELECT
    COUNT(*) AS TotalEmployees,
    ROUND(AVG(Salary), 2) AS AvgSalary,
    ROUND(MIN(Salary), 2) AS MinSalary,
    ROUND(MAX(Salary), 2) AS MaxSalary,
    ROUND(MAX(Salary) - MIN(Salary), 2) AS SalaryRange
FROM Employees;

-- Average salary by department and job level
SELECT
    d.DeptName,
    e.JobLevel,
    ROUND(AVG(e.Salary), 2) AS AvgSalary,
    COUNT(*) AS Headcount
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
GROUP BY d.DeptName, e.JobLevel
ORDER BY d.DeptName, AvgSalary DESC;

-- Gender breakdown by department
SELECT
    d.DeptName,
    e.Gender,
    COUNT(*) AS Headcount,
    ROUND(AVG(e.Salary), 2) AS AvgSalary
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
GROUP BY d.DeptName, e.Gender
ORDER BY d.DeptName, e.Gender;

-- Employees earning above company average
SELECT
    e.EmployeeName,
    d.DeptName,
    e.Salary,
    ROUND(e2.AvgSal, 2) AS CompanyAvgSalary
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
CROSS JOIN (SELECT AVG(Salary) AS AvgSal FROM Employees) e2
WHERE e.Salary > e2.AvgSal
ORDER BY e.Salary DESC;

-- Longest-tenured employee per department
SELECT
    d.DeptName,
    e.EmployeeName,
    e.HireDate,
    e.JobLevel
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
WHERE e.HireDate = (
    SELECT MIN(HireDate)
    FROM Employees e2
    WHERE e2.DeptID = e.DeptID
)
ORDER BY e.HireDate ASC;
