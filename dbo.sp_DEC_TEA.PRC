SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE sp_DEC_TEA  (@s VARCHAR(1024), @k VARCHAR(16), @dec VARCHAR(255) out ) 
--Returns a string decrypted with key k ( TEA encryption )
--TEA- Tiny Encryption Algorithm, copyrightDavid J Wheeler & Roger M Needham
AS
DECLARE @result VARCHAR(1024), @l bigint, @i bigint, @j bigint, @temp bigint, @x bigint
declare @y bigint, @z bigint, @sum bigint, @delta bigint, @n bigint, @q bigint
declare @k0 bigint, @k1 bigint, @k2 bigint, @k3 bigint
declare @v0 bigint, @v1 bigint, @tvb VARBINARY(4), @t1 bigint, @t2 bigint, @t3 bigint
SET @i=LEN(@k)
IF @i<16--if the pwd<16 char
	BEGIN
	SET @k=@k+@k+@k+@k+@k+@k+@k+@k+@k+@k+@k+@k+@k+@k+@k+@k--add pwd to itself
	SET @k=LEFT(@k,16)
	END
SET @l=(LEN(@s) % 8)
IF @l<>0--if there are no complete 64 bit blocks
	BEGIN
	SET @i=(LEN(@s))/8+1
	SET @l= @i*8-len(@s)
	SET @s=@s+replicate(CHAR(0),@l)
	END
SET @k0=ASCII(SUBSTRING(@k, 1,1))*16777216+ASCII(SUBSTRING(@k, 2,1))*65536+
ASCII(SUBSTRING(@k, 3, 1))*256+ASCII(SUBSTRING(@k ,4, 1))
SET @k1=ASCII(SUBSTRING(@k, 5, 1))*16777216+ASCII(SUBSTRING(@k ,6, 1))*65536+
ASCII(SUBSTRING(@k, 7, 1))*256+ASCII(SUBSTRING(@k, 8, 1))
SET @k2=ASCII(SUBSTRING(@k, 1,9))*16777216+ASCII(SUBSTRING(@k ,10, 1))*65536+
ASCII(SUBSTRING(@k, 11, 1))*256+ASCII(SUBSTRING(@k ,12, 1))
SET @k3=ASCII(SUBSTRING(@k, 1,13))*16777216+ASCII(SUBSTRING(@k ,14, 1))*65536+
ASCII(SUBSTRING(@k, 15, 1))*256+ASCII(SUBSTRING(@k ,16, 1))
SET @i=1
SET @result=''
WHILE @i<=LEN(@s)
	BEGIN
	SET @v0=convert(bigint,(ASCII(SUBSTRING(@s,(@i-1)+ 1,1))))*16777216+
convert(bigint,(ASCII(SUBSTRING(@s,(@i-1)+ 2,1))))*65536+
	convert(bigint,(ASCII(SUBSTRING(@s, (@i-1)+3, 1))))*256+
convert(bigint,(ASCII(SUBSTRING(@s ,(@i-1)+4, 1))))
	SET @v1=convert(bigint,(ASCII(SUBSTRING(@s,(@i-1)+ 5, 1))))*16777216+
convert(bigint,(ASCII(SUBSTRING(@s ,(@i-1)+6, 1))))*65536+
	convert(bigint,(ASCII(SUBSTRING(@s, (@i-1)+7, 1))))*256+
convert(bigint,(ASCII(SUBSTRING(@s, (@i-1)+8, 1))))

	set @delta=2654435769
	 SET @sum=3337565984
	set @n=32
	SET @y=@v0
	SET @z=@v1
	WHILE @n>0
		BEGIN

set @t1= (convert(bigint,(@y*16)) +@k2) & convert(bigint,4294967295)
set @t2= (convert(bigint,(@y+@sum)) & convert(bigint,4294967295))
set @t3= (convert(bigint,(@y/32)) +@k3) & convert(bigint,4294967295)
SET @z=@z- (convert(bigint,(@t1^@t2^@t3))) & convert(bigint,4294967295)
SET @z=convert(bigint,@z) & convert(bigint,4294967295)
--print str(@y)+'    '+str(@t1)+'    '+str(@t2)+'    '+str(@t3)+'    '+str(@z)

set @t1= (convert(bigint,(@z*16)) +@k0) & convert(bigint,4294967295)
set @t2= (convert(bigint,(@z+@sum)) & convert(bigint,4294967295))
set @t3= (convert(bigint,(@z/32)) +@k1) & convert(bigint,4294967295)
SET @y=@y- (convert(bigint,(@t1^@t2^@t3))) & convert(bigint,4294967295)
SET @y=convert(bigint,@y) & convert(bigint,4294967295)

SET @sum=@sum-@delta
	set @n=@n-1
		END
	SET @v0=@y
	SET @v1=@z	
	SET @tvb=CONVERT(VARBINARY(4),@v0)
	SET @result= @result+CONVERT(varchar(4),@tvb)
	SET @tvb=CONVERT(VARBINARY(4),@v1)
	SET @result= @result+CONVERT(varchar(4),@tvb)
	SET @i=@i+8
	END
	SET @result=REPLACE(@result,CHAR(0),'')

SET @dec=   @result
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

