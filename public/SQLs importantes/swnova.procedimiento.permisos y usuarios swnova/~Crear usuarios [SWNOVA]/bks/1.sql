USE msdb
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrap') 
    DROP LOGIN swusrap
GO
EXEC sp_addlogin swusrap,'Sw123'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrap') 
    DROP USER swusrap
GO
CREATE USER swusrap FOR LOGIN swusrap WITH DEFAULT_SCHEMA = dbo
GO



USE master
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrap') 
    DROP LOGIN swusrap
GO
EXEC sp_addlogin swusrap,'Sw123'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrap') 
    DROP USER swusrap
GO
CREATE USER swusrap FOR LOGIN swusrap WITH DEFAULT_SCHEMA = swe
GO
--------------



USE master
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrcs') 
    DROP LOGIN swusrcs
GO
EXEC sp_addlogin swusrcs,'Sw123'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrcs')
    DROP USER swusrcs
GO
CREATE USER swusrcs FOR LOGIN swusrcs WITH DEFAULT_SCHEMA = swe
GO
--------------
USE master
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrbk') 
    DROP LOGIN swusrbk
GO
EXEC sp_addlogin swusrbk,'Sw123'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrbk')
    DROP USER swusrbk
GO
CREATE USER swusrbk FOR LOGIN swusrbk WITH DEFAULT_SCHEMA = swe
GO
--------------
USE master
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrrp') 
    DROP LOGIN swusrrp
GO
EXEC sp_addlogin swusrrp,'Sw123'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrrp')
    DROP USER swusrrp
GO
CREATE USER swusrrp FOR LOGIN swusrrp WITH DEFAULT_SCHEMA = swe
GO
