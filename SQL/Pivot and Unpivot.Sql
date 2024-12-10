-----------Pivot and Unpivot--------------
-- Step 1: Drop Table if Exists
DROP TABLE IF EXISTS StudentMarks;
GO

-- Step 2: Create StudentMarks Table
CREATE TABLE StudentMarks (
    StudentID INT,
    StudentName NVARCHAR(50),
    Subject NVARCHAR(50),
    Marks INT
);
GO

-- Step 3: Insert Sample Data into StudentMarks Table
INSERT INTO StudentMarks (StudentID, StudentName, Subject, Marks) VALUES
(1, 'Anu', 'Math', 85),
(1, 'Anu', 'Science', 90),
(2, 'Banu', 'Math', 78),
(2, 'Banu', 'Science', 88),
(3, 'Sharvesh', 'Math', 92),
(3, 'Sharvesh', 'Science', 81);
GO

-- Step 4: View Original Table
SELECT * FROM StudentMarks;
GO

-- Step 5: PIVOT - Convert Subjects into Columns
SELECT StudentID, StudentName, 
       ISNULL([Math], 0) AS Math, 
       ISNULL([Science], 0) AS Science
FROM (
    SELECT StudentID, StudentName, Subject, Marks
    FROM StudentMarks
) AS SourceTable
PIVOT (
    MAX(Marks) FOR Subject IN ([Math], [Science])
) AS PivotTable;
GO

-- Step 6: UNPIVOT - Convert Columns Back into Rows
SELECT StudentID, StudentName, Subject, Marks
FROM (
    SELECT StudentID, StudentName, [Math], [Science]
    FROM (
        SELECT StudentID, StudentName, Subject, Marks
        FROM StudentMarks
    ) AS SourceTable
    PIVOT (
        MAX(Marks) FOR Subject IN ([Math], [Science])
    ) AS PivotTable
) AS PivotedData
UNPIVOT (
    Marks FOR Subject IN ([Math], [Science])
) AS UnpivotedData;
GO
