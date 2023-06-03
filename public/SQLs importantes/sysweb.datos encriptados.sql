-----------------------Lectura de datos encriptados
--select *, CONVERT(VARCHAR(250), DECRYPTBYPASSPHRASE('SOFTDIAL',USUARIOS)) from [dbo].[CGE]
--where emp_nombre = 'softdial'

-----------------------Insert / update de datos encriptados
--insert into [dbo].[CGE]
--select 'softdial', ENCRYPTBYPASSPHRASE('SOFTDIAL','10')