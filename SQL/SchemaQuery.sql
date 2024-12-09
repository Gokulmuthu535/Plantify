create database SchoolManagementDB
-- Create the Admin schema
CREATE SCHEMA Admin;

-- Create the Academics schema
CREATE SCHEMA Academics;

CREATE TABLE Academics.Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Class NVARCHAR(10),
    AdmissionDate DATE DEFAULT GETDATE()
);

CREATE TABLE Academics.Teachers (
    TeacherID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Subject NVARCHAR(50),
    HireDate DATE DEFAULT GETDATE()
);

CREATE TABLE Academics.Classes (
    ClassID INT PRIMARY KEY IDENTITY(1,1),
    ClassName NVARCHAR(10) NOT NULL,
    TeacherID INT FOREIGN KEY REFERENCES Academics.Teachers(TeacherID)
);

CREATE TABLE Admin.Fees (
    FeeID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT FOREIGN KEY REFERENCES Academics.Students(StudentID),
    Amount DECIMAL(10,2) CHECK (Amount > 0),
    PaymentDate DATE DEFAULT GETDATE()
);
CREATE TABLE Admin.Staff (
    StaffID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Position NVARCHAR(50),
    HireDate DATE DEFAULT GETDATE()
);


INSERT INTO Academics.Students (FirstName, LastName, DateOfBirth, Class)
VALUES 
('Gokul', 'Muthusamy', '2002-01-10', '5A'),
('Sarma', 'Madheswaran', '2001-05-15', '6B');

INSERT INTO Academics.Teachers (FirstName, LastName, Subject)
VALUES 
('Rudhra', 'Priya', 'English'),
('Samitha', 'Karthikeyan', 'Social');

INSERT INTO Academics.Classes (ClassName, TeacherID)
VALUES 
('5A', 1),
('6B', 2);

INSERT INTO Admin.Fees (StudentID, Amount)
VALUES 
(1, 1500.00),
(2, 2000.00);


INSERT INTO Admin.Staff (FirstName, LastName, Position, HireDate)
VALUES
('Samitha', 'Karthikeyan', 'Social', '2022-01-15'),
('Rudhra', 'Priya', 'English', '2023-03-01'),
('Malathi', 'Karthikeyan', 'IT Specialist', '2021-08-20');


-----Retrieve All Students and Their Classes-------
SELECT S.StudentID, S.FirstName, S.LastName, S.Class, C.ClassName
FROM Academics.Students S
LEFT JOIN Academics.Classes C ON S.Class = C.ClassName;

----Get Total Fees Paid by Each Student---
SELECT S.FirstName, S.LastName, SUM(F.Amount) AS TotalFees
FROM Admin.Fees F
JOIN Academics.Students S ON F.StudentID = S.StudentID
GROUP BY S.FirstName, S.LastName;


----Retrieve Teachers and Their Classes----
SELECT T.TeacherID, T.FirstName + ' ' + T.LastName AS TeacherName, T.Subject, C.ClassName
FROM Academics.Teachers T
LEFT JOIN Academics.Classes C ON T.TeacherID = C.TeacherID;



----------VIEWS---------



------Displays all staff members.---
CREATE VIEW Admin.Vw_AllStaff AS
SELECT StaffID, FirstName, LastName, Position, HireDate
FROM Admin.Staff;
SELECT * FROM Admin.Vw_AllStaff;


---Displays staff based on their role/position.
CREATE VIEW Admin.Vw_StaffByPosition AS
SELECT StaffID, FirstName, LastName, Position, HireDate
FROM Admin.Staff
WHERE Position IS NOT NULL;
GO

SELECT * FROM Admin.Vw_StaffByPosition WHERE Position = 'IT Specialist';


----View for Students' Age----
CREATE VIEW Academics.Vw_StudentsAge AS
SELECT StudentID, FirstName, LastName, Class, DateOfBirth,
       DATEDIFF(YEAR, DateOfBirth, GETDATE()) AS Age
FROM Academics.Students;

SELECT * FROM Academics.Vw_StudentsAge;

---------TRIGGERS-----------
-- Create the Audit Log Table in Admin Schema
CREATE TABLE Admin.StudentAuditLog (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,        -- Unique identifier for each log entry
    Action VARCHAR(50),                            -- Action performed (e.g., 'INSERT', 'UPDATE', 'DELETE')
    StudentID INT,                                 -- StudentID that was modified
    FirstName NVARCHAR(50),                        -- First Name of the student
    LastName NVARCHAR(50),                         -- Last Name of the student
    DateOfBirth DATE,                              -- Date of Birth of the student
    ActionDate DATETIME DEFAULT GETDATE()          -- Timestamp of when the action occurred
);


DROP TRIGGER IF EXISTS Admin.trg_AfterStudentInsert;


CREATE TRIGGER trg_AfterStudentInsert
ON Academics.Students
AFTER INSERT
AS
BEGIN
    BEGIN TRY
        -- Attempt to insert into the audit table
        INSERT INTO Admin.StudentAuditLog (Action, StudentID, FirstName, LastName, DateOfBirth)
        SELECT 'INSERT', StudentID, FirstName, LastName, DateOfBirth
        FROM inserted;
    END TRY
    BEGIN CATCH
        -- Handle errors
        PRINT 'Error occurred in trigger.';+
    END CATCH
END;

-- Insert a new student into the Students table
INSERT INTO Academics.Students (FirstName, LastName, Class, DateOfBirth)
VALUES ('John', 'Doe', 'Math 101', '2000-01-01');

Select * from Admin.StudentAuditLog