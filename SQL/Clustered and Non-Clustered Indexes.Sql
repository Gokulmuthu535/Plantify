-------------- Clustered and Non-Clustered Indexes---------------
-- Step 1: Drop Tables if Exist
DROP TABLE IF EXISTS Students;
GO

-- Step 2: Create Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY, -- By default, this creates a Clustered Index
    StudentName NVARCHAR(100),
    Class NVARCHAR(50),
    DateOfBirth DATE
);
GO

-- Step 3: Insert Sample Data into Students Table
INSERT INTO Students VALUES 
(1, 'Anu', '10th', '2005-05-20'),
(2, 'Bhuvi', '10th', '2006-03-15'),
(3, 'Sharvesh', '11th', '2005-10-12'),
(4, 'Kani', '11th', '2006-01-18'),
(5, 'Vengi', '12th', '2004-08-25');
GO

-- Step 4: View Indexes on the Table
SELECT 
    ind.name AS IndexName,
    ind.type_desc AS IndexType,
    col.name AS ColumnName
FROM 
    sys.indexes ind
INNER JOIN 
    sys.index_columns ic ON ind.object_id = ic.object_id AND ind.index_id = ic.index_id
INNER JOIN 
    sys.columns col ON ic.object_id = col.object_id AND ic.column_id = col.column_id
WHERE 
    ind.object_id = OBJECT_ID('Students');
GO

-- Step 5: Create Non-Clustered Index on StudentName Column
CREATE NONCLUSTERED INDEX IX_StudentName
ON Students (StudentName);
GO

-- Step 6: Create Non-Clustered Index on Class Column
CREATE NONCLUSTERED INDEX IX_Class
ON Students (Class);
GO

-- Step 7: Check Indexes Again
SELECT 
    ind.name AS IndexName,
    ind.type_desc AS IndexType,
    col.name AS ColumnName
FROM 
    sys.indexes ind
INNER JOIN 
    sys.index_columns ic ON ind.object_id = ic.object_id AND ind.index_id = ic.index_id
INNER JOIN 
    sys.columns col ON ic.object_id = col.object_id AND ic.column_id = col.column_id
WHERE 
    ind.object_id = OBJECT_ID('Students');
GO

-- Step 8: Query to Test Indexes
-- Clustered Index (Search by Primary Key)
SELECT * FROM Students WHERE StudentID = 3;

-- Non-Clustered Index (Search by StudentName)
SELECT * FROM Students WHERE StudentName = 'Bhuvi';

-- Non-Clustered Index (Search by Class)
SELECT * FROM Students WHERE Class = '11th';
