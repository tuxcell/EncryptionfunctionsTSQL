--test SP
DECLARE @msg varchar(12), @pwd varchar(8), @msgenc varchar(255)
SET @msg='Hello World!'
SET @pwd='abc'
EXEC sp_XORCHAR @msg,157,@msgenc OUT
PRINT @msgenc
EXEC sp_XORCHAR '�����������',157,@msgenc OUT
PRINT @msgenc
EXEC sp_RC4T @msg,@pwd,@msgenc OUT
PRINT @msgenc
EXEC sp_RC4T '���E7��^��',@pwd,@msgenc OUT
PRINT @msgenc
EXEC sp_ENC_VIGENERE @msg,@pwd,@msgenc OUT
PRINT @msgenc
EXEC sp_DEC_VIGENERE '����у����ǂ',@pwd,@msgenc OUT
PRINT @msgenc
EXEC sp_ENC_TEA2 @msg,@pwd,@msgenc OUT
PRINT @msgenc
EXEC sp_DEC_TEA2 '��2��o��te��a8�',@pwd,@msgenc OUT
PRINT @msgenc
EXEC sp_ENC_TEA @msg,@pwd,@msgenc OUT
PRINT @msgenc
EXEC sp_DEC_TEA '�ݳHS���Ig��r�',@pwd,@msgenc OUT
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
print dbo.DEC_TEA2('���S�(H����','secret')
print dbo.ENC_TEA('Hello world!','secret')
print dbo.DEC_TEA('�"Ow�o�zN;{��','secret')
print dbo.RC4('Hello world!','secret')
print dbo.RC4('�S�p턡�@���','secret')
print dbo.ENC_VIGENERE('Hello world!','secret')
print dbo.DEC_VIGENERE('����Ԕ����Ǔ','secret')
print dbo.ENC_CAESAR('Hello world!',15)
print dbo.DEC_CAESAR('Wt{{~/�~�{s0',15)
print dbo.CRYPTX8('Hello world!','SECRET')
print dbo.CRYPTX8(' />*t$*!)''s','SECRET')
print dbo.XORCHAR('Hello world!',158)
print dbo.XORCHAR('�����������',158)


���S�(H����
Hello world!
�"Ow�o�zN;{��
Hello world!
�S�p턡�@���
Hello world!
����Ԕ����Ǔ
Hello world!
Wt{{~/�~�{s0
Hello world!
 />*t$*!)'s
Hello world!
�����������
Hello world!