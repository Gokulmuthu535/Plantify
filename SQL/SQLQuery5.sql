USE [PlantifyDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[UpdateEmployeeSalary]
		@EmployeeID = asv,
		@updatedSalary = 11000.00

SELECT	'Return Value' = @return_value

GO
