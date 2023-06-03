DECLARE @dbname nvarchar(128) 
SET @dbname = N'sysweb_bit'

IF (EXISTS (SELECT name 
FROM master.dbo.sysdatabases 
WHERE ('[' + name + ']' = @dbname 
OR name = @dbname)))
DROP DATABASE sysweb_bit;



SET @dbname = N'sysweb_adm'

IF (EXISTS (SELECT name 
FROM master.dbo.sysdatabases 
WHERE ('[' + name + ']' = @dbname 
OR name = @dbname)))
DROP DATABASE sysweb_adm;


SET @dbname = N'sysweb_act'

IF (EXISTS (SELECT name 
FROM master.dbo.sysdatabases 
WHERE ('[' + name + ']' = @dbname 
OR name = @dbname)))
DROP DATABASE sysweb_act;



