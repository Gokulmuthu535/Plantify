
----SINGLE STORED PROCEDURE----------

CREATE PROCEDURE StudentAdmissionCRUD
    @Action VARCHAR(10),
    @StudentID INT,
    @Name VARCHAR(50),
    @Age INT,
    @Course VARCHAR(50)
AS
BEGIN
    IF @Action = 'Insert'
    BEGIN
        INSERT INTO Student (StudentID, Name, Age, Course)
        VALUES (@StudentID, @Name, @Age, @Course);
    END
    ELSE IF @Action = 'Update'
    BEGIN
        UPDATE Student
        SET Name = @Name, Age = @Age, Course = @Course
        WHERE StudentID = @StudentID;
    END
    ELSE IF @Action = 'Delete'
    BEGIN
        DELETE FROM Student
        WHERE StudentID = @StudentID;
    END
END;

EXEC StudentAdmissionCRUD 
    @Action = 'Insert', 
    @StudentID = 1, 
    @Name = 'John Doe', 
    @Age = 20, 
    @Course = 'Computer Science';

EXEC StudentAdmissionCRUD 
    @Action = 'Update', 
    @StudentID = 1, 
    @Name = 'John Doe', 
    @Age = 21, 
    @Course = 'Data Science';

EXEC StudentAdmissionCRUD 
    @Action = 'Delete', 
    @StudentID = 1, 
    @Name = NULL, 
    @Age = NULL, 
    @Course = NULL;
	SELECT*FROM student
