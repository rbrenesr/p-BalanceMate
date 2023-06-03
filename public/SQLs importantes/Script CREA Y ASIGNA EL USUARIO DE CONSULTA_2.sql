--//-- -------------------------------------------------------- --//--
-- GENERAR USUARIO DE CONSULTA PARA LA BASE DE DATOS SYSWEB_ACT --//--
--//-- -------------------------------------------------------- --//--

--//-- -------------------------------------------------------- --//--
--Crea login y usuario en la base de datos [master]
USE master
GO
IF EXISTS(SELECT * FROM SYS.syslogins WHERE loginname = 'swusrcs') 
	DROP LOGIN swusrcs
GO
exec sp_addlogin swusrcs,'Sw123'
GO
IF EXISTS(SELECT * FROM SYS.sysusers WHERE NAME = 'swusrcs')
	DROP USER swusrcs
GO
CREATE USER swusrcs FOR LOGIN swusrcs WITH DEFAULT_SCHEMA = swe
GO
--//-- -------------------------------------------------------- --//--

--//-- -------------------------------------------------------- --//--
--Crea usuario en la base de datos [SYSWEB_ACT]
USE [SYSWEB_ACT]
GO
--si existe el usuario en la bd lo elimina
IF EXISTS(SELECT * FROM SYS.sysusers WHERE NAME = 'swusrcs')
	DROP USER swusrcs
GO
CREATE USER swusrcs FOR LOGIN swusrcs WITH DEFAULT_SCHEMA = swe
GO

GRANT SELECT ON DATABASE :: [SYSWEB_ACT] TO swusrcs
GO
--//-- -------------------------------------------------------- --//--

--//-- -------------------------------------------------------- --//--
--Crea usuario en la base de datos [SYSWEB_INT]
USE [SYSWEB_INT]
GO
--si existe el usuario en la bd lo elimina
IF EXISTS(SELECT * FROM SYS.sysusers WHERE NAME = 'swusrcs')
	DROP USER swusrcs
GO
CREATE USER swusrcs FOR LOGIN swusrcs WITH DEFAULT_SCHEMA = swe
GO

GRANT SELECT ON DATABASE :: [SYSWEB_INT] TO swusrcs
GO
--//-- -------------------------------------------------------- --//--