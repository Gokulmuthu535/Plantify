Create Procedure UpdateEmployeeSalary(@EmployeeID int, @updatedSalary decimal)
AS
BEGIN
SET NOCOUNT ON;

BEGIN TRY
Update Employee
set Salary = @updatedSalary
where EmpID = @EmployeeID;

 IF @@ROWCOUNT = 0
        BEGIN
            THROW 50001, 'No rows were updated. Invalid EmployeeID.', 1;
        END
END TRY

BEGIN CATCH
Insert into ErrorLog(ErrorMessage, ErrorDate)
values(ERROR_MESSAGE(), GETDATE());
THROW;
END CATCH;
END;

CREATE TABLE ErrorLog (
    ErrorID INT IDENTITY(1,1) PRIMARY KEY,
    ErrorMessage NVARCHAR(MAX),
    ErrorDate DATETIME
);


select* from Employee

select * from ErrorLog

EXEC UpdateEmployeeSalary @EmployeeID = 999, @updatedSalary = 60000;
