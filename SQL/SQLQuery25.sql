USE [PlantifyDB]
GO
/****** Object:  StoredProcedure [dbo].[UpdateSignUp]    Script Date: 06-12-2024 04:47:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UpdateSignUp]
    @Username VARCHAR(50),
    @Password VARCHAR(100)
AS
BEGIN
BEGIN TRY
    UPDATE SignUp
    SET Password = @Password
    WHERE Username = @Username;
	END TRY
BEGIN CATCH
      Declare @errorMsg varchar(100);
      set @errorMsg = ERROR_MESSAGE();
      THROW 50000, @errorMsg, 1;
   END CATCH;
END;	