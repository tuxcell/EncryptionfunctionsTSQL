--test SP
DECLARE @msg varchar(12), @pwd varchar(8), @msgenc varchar(255)
SET @msg='Hello World!'
SET @pwd='abc'
EXEC sp_XORCHAR @msg,157,@msgenc OUT
PRINT @msgenc
EXEC sp_XORCHAR 'Õøññò½Êòïñù¼',157,@msgenc OUT
PRINT @msgenc
EXEC sp_RC4T @msg,@pwd,@msgenc OUT
PRINT @msgenc
EXEC sp_RC4T '…øµE7ÿº^‹ë',@pwd,@msgenc OUT
PRINT @msgenc
EXEC sp_ENC_VIGENERE @msg,@pwd,@msgenc OUT
PRINT @msgenc
EXEC sp_DEC_VIGENERE '©ÇÏÍÑƒ¸ÑÓÎÇ‚',@pwd,@msgenc OUT
PRINT @msgenc
EXEC sp_ENC_TEA2 @msg,@pwd,@msgenc OUT
PRINT @msgenc
EXEC sp_DEC_TEA2 'ÇÜ2Æıo¾£te¥€a8·',@pwd,@msgenc OUT
PRINT @msgenc
EXEC sp_ENC_TEA @msg,@pwd,@msgenc OUT
PRINT @msgenc
EXEC sp_DEC_TEA '¹İ³HS°ŸIgî¡r«',@pwd,@msgenc OUT
PRINT @msgenc
EXEC sp_ENC_CAESAR @msg,13,@msgenc OUT
PRINT @msgenc
EXEC sp_DEC_CAESAR 'Uryy|-d|yq.',13,@msgenc OUT
PRINT @msgenc
EXEC sp_CRYPTX8 @msg,@pwd,@msgenc OUT
PRINT @msgenc
EXEC sp_CRYPTX8 ')C6@',@pwd,@msgenc OUT
PRINT @msgenc


--test UDF

print dbo.ENC_TEA2('Hello world!','secret')
print dbo.DEC_TEA2('£òËS«(HÑæéÈ','secret')
print dbo.ENC_TEA('Hello world!','secret')
print dbo.DEC_TEA('ò"Owo™zN;{ŞÌ','secret')
print dbo.RC4('Hello world!','secret')
print dbo.RC4('¥S¾pí„¡É@§ßı','secret')
print dbo.ENC_VIGENERE('Hello world!','secret')
print dbo.DEC_VIGENERE('»ÊÏŞÔ”êÔåÑÇ“','secret')
print dbo.ENC_CAESAR('Hello world!',15)
print dbo.DEC_CAESAR('Wt{{~/†~{s0',15)
print dbo.CRYPTX8('Hello world!','SECRET')
print dbo.CRYPTX8(' />*t$*!)''s','SECRET')
print dbo.XORCHAR('Hello world!',158)
print dbo.XORCHAR('Öûòòñ¾éñìòú¿',158)


£òËS«(HÑæéÈ
Hello world!
ò"Owo™zN;{ŞÌ
Hello world!
¥S¾pí„¡É@§ßı
Hello world!
»ÊÏŞÔ”êÔåÑÇ“
Hello world!
Wt{{~/†~{s0
Hello world!
 />*t$*!)'s
Hello world!
Öûòòñ¾éñìòú¿
Hello world!