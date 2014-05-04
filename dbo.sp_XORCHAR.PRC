SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE sp_XORCHAR( @s VARCHAR(255), @x tinyint, @dec VARCHAR(255) out) 
--Returns a string encrypted/decrypted with key t ( XOR encryption )
AS
DECLARE @result VARCHAR(255), @i int, @temp tinyint
SET @i=1
SET @result=''
WHILE @i<=LEN(@s)
	BEGIN
	SET @temp=ASCII(SUBSTRING(@s,@i,1))
	SET @result=@result + CHAR(@temp ^ @x)
	SET @i=@i+1
	END
SET @dec= @result
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

