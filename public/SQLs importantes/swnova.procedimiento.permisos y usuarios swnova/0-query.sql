--Script 0: 
--En caso de haber instalado por primera vez la instancia
-----------------------------------------------------------------------------
-- EN CASO DE HABER INSTALADO POR PRIMERA VEZ LA BD Y LEVANTADO LOS RESPALDOS
-- SE DEBE EJECUTAR ESTAS LINEAS DEL SCRIPT
-- PARA CREAR LOS USUARIOS DE APLICACION, CONSULTA Y BACKUPS EN BD MASTER

--Crea login y usuario en la base de datos [master]
USE master
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrap') 
	DROP LOGIN swusrap
GO
EXEC sp_addlogin swusrap,'Sw123456'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrap')
	DROP USER swusrap
GO
CREATE USER swusrap FOR LOGIN swusrap WITH DEFAULT_SCHEMA = swe
GO


--//-- ------------------------------------------------------- --//--
--Crea login y usuario en la base de datos [master]
USE master
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrcs') 
	DROP LOGIN swusrcs
GO
EXEC sp_addlogin swusrcs,'Sw123456'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrcs')
	DROP USER swusrcs
GO
CREATE USER swusrcs FOR LOGIN swusrcs WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--Crea login y usuario en la base de datos [master]
USE master
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrbk') 
	DROP LOGIN swusrbk
GO
EXEC sp_addlogin swusrbk,'Sw123456'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrbk')
	DROP USER swusrbk
GO
CREATE USER swusrbk FOR LOGIN swusrbk WITH DEFAULT_SCHEMA = swe
GO
--//-- ------------------------------------------------------- --//--

--//-- ------------------------------------------------------- --//--
--Crea login y usuario en la base de datos [master]
USE master
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrrp') 
	DROP LOGIN swusrrp
GO
EXEC sp_addlogin swusrrp,'Sw123456'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrrp')
	DROP USER swusrrp
GO
CREATE USER swusrrp FOR LOGIN swusrrp WITH DEFAULT_SCHEMA = swe
GO
--//-- ------------------------------------------------------- --//--


USE master
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrsin') 
	DROP LOGIN swusrsin
GO
EXEC sp_addlogin swusrsin,'Sw123456'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrsin')
	DROP USER swusrsin
GO
CREATE USER swusrsin FOR LOGIN swusrsin WITH DEFAULT_SCHEMA = swe
GO
--//-- ------------------------------------------------------- --//--



-----------------------------------------------------------------------------
-- EN CASO DE MODIFICAR LA CONTRASEÑA
-----------------------------------------------------------------------------
--//-- ------------------------------------------------------- --//--
USE master
GO
ALTER LOGIN swusrap WITH PASSWORD = 'Sw123456'
ALTER LOGIN swusrbk WITH PASSWORD = 'Sw123456'
ALTER LOGIN swusrcs WITH PASSWORD = 'Sw123456'
ALTER LOGIN swusrrp WITH PASSWORD = 'Sw123456'
ALTER LOGIN swusrsin WITH PASSWORD = 'Sw123456'
GO
--//-- ------------------------------------------------------- --//--
