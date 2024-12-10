----Employee-----
CREATE TABLE EmployeeDetails (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT
);
-------Department------
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
-----Insert----
INSERT INTO EmployeeDetails (EmpID, Name, DepartmentID)
VALUES (1, 'Vijay', 101), (2, 'Arjun', 102), (3, 'Vimal', NULL);

INSERT INTO Department (DepartmentID, DepartmentName)
VALUES (101, 'HR'), (102, 'IT');

-----Inner Join-----
SELECT e.Name, d.DepartmentName
FROM EmployeeDetails e
INNER JOIN Department d ON e.DepartmentID = d.DepartmentID;
-----Left Join----
SELECT e.Name, d.DepartmentName
FROM EmployeeDetails e
LEFT JOIN Department d ON e.DepartmentID = d.DepartmentID;
-----Right Join----
SELECT e.Name, d.DepartmentName
FROM EmployeeDetails e
Right JOIN Department d ON e.DepartmentID = d.DepartmentID;
------Full Join-----
SELECT e.Name, d.DepartmentName
FROM EmployeeDetails e
FULL JOIN Department d ON e.DepartmentID = d.DepartmentID;
----Cross Join----
SELECT e.Name, d.DepartmentName
FROM EmployeeDetails e
CROSS JOIN Department d;




