USE [PlantifyDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[UpdateEmployeeSalary]
		@EmployeeID = asp,
		@updatedSalary = 234.00

SELECT	'Return Value' = @return_value

GO
