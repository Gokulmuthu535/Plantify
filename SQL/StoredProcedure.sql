CREATE PROCEDURE InsertSignUp
    @Username VARCHAR(50),
    @Password VARCHAR(100),
    @Email VARCHAR(100),
    @PhoneNumber VARCHAR(15)
AS
BEGIN
    INSERT INTO SignUp (Username, Password, Email, PhoneNumber)
    VALUES (@Username, @Password, @Email, @PhoneNumber);
END;

EXEC InsertSignUp @Username = 'JohnDoe', @Password = 'password123', @Email = 'john.doe@example.com', @PhoneNumber = '1234567890';

CREATE PROCEDURE UpdateSignUp
    @Username VARCHAR(50),
    @Password VARCHAR(100)
AS
BEGIN
    UPDATE SignUp
    SET Password = @Password
    WHERE Username = @Username;
END;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Course VARCHAR(50)
);

---------SELECT SP--------
CREATE PROCEDURE SelectSignUp
    @Username VARCHAR(50) = NULL -- Optional parameter
AS
BEGIN
    IF @Username IS NULL
    BEGIN
        -- Retrieve all records if no Username is specified
        Print 'Username not found';
    END
    ELSE
    BEGIN
        -- Retrieve specific record based on Username
        SELECT * FROM SignUp
        WHERE Username = @Username;
    END
END;

-----------DELETE SP-------------
CREATE PROCEDURE DeleteSignUp
    @Username VARCHAR(50)
AS
BEGIN
    DELETE FROM SignUp
    WHERE Username = @Username;
END;



Select * from SignUp