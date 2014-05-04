SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE sp_DEC_CAESAR  ( @s VARCHAR(255), @x tinyint, @dec VARCHAR(255) out ) 
--Returns a string decrypted with key x ( Caesar Cipher encryption )
AS
DECLARE @result VARCHAR(255), @i int, @j int, @temp tinyint
SET @i=1
SET @result=''
WHILE @i<=LEN(@s)
	BEGIN
	SET @temp=ASCII(SUBSTRING(@s,@i,1))
	SET @j=CONVERT(int,@temp)-@x
	IF @j<0
		SET @j=@j+255
	SET @result=@result + CHAR(@j)
	SET @i=@i+1
	END
SET @dec= @result
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

