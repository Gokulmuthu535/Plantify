USE [PlantifyDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[UpdateSignUp]
		@Username = N'GOKULLLLL',
		@Password = N'12224433647'

SELECT	'Return Value' = @return_value

GO

SELECT * FROM Signup