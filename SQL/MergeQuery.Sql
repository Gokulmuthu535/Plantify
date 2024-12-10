-----------MERGE Concept in SQL---------------

-- Step 1: Drop Tables if Exists
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS NewStudents;
GO

-- Step 2: Create Students Table (Target Table)
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName NVARCHAR(100),
    Class NVARCHAR(50)
);
GO

-- Step 3: Create NewStudents Table (Source Table)
CREATE TABLE NewStudents (
    StudentID INT,
    StudentName NVARCHAR(100),
    Class NVARCHAR(50)
);
GO

-- Step 4: Insert Sample Data into Students (Target Table)
INSERT INTO Students (StudentID, StudentName, Class)
VALUES 
(1, 'Anu', '10th'),
(2, 'Bhuvi', '10th'),
(3, 'Sharvesh', '11th');
GO

-- Step 5: Insert Sample Data into NewStudents (Source Table)
INSERT INTO NewStudents (StudentID, StudentName, Class)
VALUES
(2, 'Banu', '10th'), -- Updated
(4, 'Kani', '12th');  -- New entry
GO

-- Step 6: Select Data from Both Tables to View Current Data
SELECT * FROM Students; -- Target Table
SELECT * FROM NewStudents; -- Source Table


------------MERGE Operation---------------------


-- Step 7: Perform MERGE Operation
MERGE INTO Students AS target
USING NewStudents AS source
ON target.StudentID = source.StudentID

-- When there's a match, update the data
WHEN MATCHED THEN
    UPDATE SET target.StudentName = source.StudentName,
               target.Class = source.Class

-- When there's no match in target, insert new records
WHEN NOT MATCHED BY TARGET THEN
    INSERT (StudentID, StudentName, Class)
    VALUES (source.StudentID, source.StudentName, source.Class)

-- When there's no match in source, delete the records from target
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;
GO

-- Step 8: View Data After MERGE Operation
SELECT * FROM Students; -- Updated Target Table
