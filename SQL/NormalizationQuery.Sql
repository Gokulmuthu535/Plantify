---------------First Normal Form (1NF)----------------
CREATE TABLE StudentsSubjects_1NF (
    StudentID INT,
    StudentName NVARCHAR(100),
    Class NVARCHAR(50),
    Teacher NVARCHAR(100),
    Subject NVARCHAR(50)
);

INSERT INTO StudentsSubjects_1NF VALUES
(1, 'Anu', '10th', 'Mr. Arun', 'Math'),
(1, 'Ishu', '10th', 'Mr.Ram', 'Science'),
(2, 'Math', '10th', 'Mr. Jeeva', 'Math'),
(2, 'Sharvesh', '10th', 'Mr. John', 'Science'),
(3, 'Kani', '11th', 'Ms. Kalpana', 'History'),
(3, 'Vengi', '11th', 'Ms. Vinu', 'Physics');

select * from StudentsSubjects_1NF

-------------Second Normal Form (2NF)--------------

DROP TABLE IF EXISTS Subjects_2NF;
DROP TABLE IF EXISTS Students_2NF;
GO

-- Create Students Table
CREATE TABLE Students_2NF (
    StudentID INT PRIMARY KEY,
    StudentName NVARCHAR(100),
    Class NVARCHAR(50),
    Teacher NVARCHAR(100)
);

-- Insert Data into Students_2NF
INSERT INTO Students_2NF VALUES
(1, 'Ambal', '10th', 'Mr. Janartan'),
(2, 'Banu', '10th', 'Mr. Bala'),
(3, 'Cintu', '11th', 'Ms. Janani');

-- Create Subjects Table
CREATE TABLE Subjects_2NF (
    StudentID INT FOREIGN KEY REFERENCES Students_2NF(StudentID),
    Subject NVARCHAR(50)
);

-- Insert Data into Subjects_2NF
INSERT INTO Subjects_2NF VALUES
(1, 'Math'),
(1, 'Science'),
(2, 'Math'),
(2, 'Science'),
(3, 'History'),
(3, 'Physics');

select * from Students_2NF

-----------Third Normal Form (3NF)----------------

-- Drop existing tables if they exist
DROP TABLE IF EXISTS Subjects_3NF;
DROP TABLE IF EXISTS Students_3NF;
DROP TABLE IF EXISTS Classes_3NF;
GO

-- Create Classes Table to store Class and Teacher relationship
CREATE TABLE Classes_3NF (
    Class NVARCHAR(50) PRIMARY KEY,
    Teacher NVARCHAR(100)
);

-- Insert data into Classes Table
INSERT INTO Classes_3NF VALUES
('10th', 'Mr. Bala'),
('11th', 'Ms. Janani');

-- Create Students Table to store Student details
CREATE TABLE Students_3NF (
    StudentID INT PRIMARY KEY,
    StudentName NVARCHAR(100),
    Class NVARCHAR(50) FOREIGN KEY REFERENCES Classes_3NF(Class)
);

-- Insert data into Students Table
INSERT INTO Students_3NF VALUES
(1, 'Ambal', '10th'),
(2, 'Banu', '10th'),
(3, 'Cintu', '11th');

-- Create Subjects Table to store Subjects linked to Students
CREATE TABLE Subjects_3NF (
    StudentID INT FOREIGN KEY REFERENCES Students_3NF(StudentID),
    Subject NVARCHAR(50)
);

-- Insert data into Subjects Table
INSERT INTO Subjects_3NF VALUES
(1, 'Math'),
(1, 'Science'),
(2, 'Math'),
(2, 'Science'),
(3, 'History'),
(3, 'Physics');

-- Verify the Data
SELECT * FROM Classes_3NF;
SELECT * FROM Students_3NF;
SELECT * FROM Subjects_3NF;
