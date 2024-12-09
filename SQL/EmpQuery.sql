----Employee Table-----
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    Salary DECIMAL(10, 2),
    Department VARCHAR(50)
);
------INSERT-----
INSERT INTO Employee (Name, Salary, Department)
VALUES 
('Jack', 55000.00, 'HR'),
('Rose', 72000.00, 'Finance'),
('Madhavan', 65000.00, 'IT'),
('Swetha', 48000.00, 'Marketing');
----SecondHighestSalary--------
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee);
-----MINIMUM-----
SELECT MIN(Salary) ' Minimum  Sallery'
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee);
----Number of Employees----
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY Department;
