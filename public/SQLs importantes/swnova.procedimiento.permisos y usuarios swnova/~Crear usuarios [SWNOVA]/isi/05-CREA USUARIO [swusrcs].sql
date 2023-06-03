-----------------------------------------------------------------------------
--1--------------------------------------------------------------------------
-- CREA EL USUARIO DE APLICACION PARA LAS BASES DE DATOS MASTER
-----------------------------------------------------------------------------
USE master
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrcs') 
	DROP LOGIN swusrcs
GO
EXEC sp_addlogin swusrcs,'Bq3hc7NaZNpm92wEPLcKp547uugkJRTaSMjFvHF6nTg7xpnbZrydksVqw3AQwjRdGLvNjZJgwCeSBsEst3fq6NDsFPTMKAB3WVF6yfYTuPBURRXaK4qsGDuY5cnECPha'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrcs')
	DROP USER swusrcs
GO
CREATE USER swusrcs FOR LOGIN swusrcs WITH DEFAULT_SCHEMA = swe
GO





-----------------------------------------------------------------------------
--2--------------------------------------------------------------------------
-- CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS
-----------------------------------------------------------------------------
USE SYSWEB_ACT
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrcs')
    DROP USER swusrcs
GO
CREATE USER swusrcs FOR LOGIN swusrcs WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_ADM
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrcs')
    DROP USER swusrcs
GO
CREATE USER swusrcs FOR LOGIN swusrcs WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_BIT
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrcs')
    DROP USER swusrcs
GO
CREATE USER swusrcs FOR LOGIN swusrcs WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_SIN
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrcs')
    DROP USER swusrcs
GO
CREATE USER swusrcs FOR LOGIN swusrcs WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_INT
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrcs')
    DROP USER swusrcs
GO
CREATE USER swusrcs FOR LOGIN swusrcs WITH DEFAULT_SCHEMA = swe
GO




-----------------------------------------------------------------------------
--3--------------------------------------------------------------------------
-- ASIGNA LOS PERMISOS NECESARIOS, EN CADA BD
-----------------------------------------------------------------------------

--asigna los permisos GRANT al usuario en las base de datos de sistema
USE SYSWEB_ACT
    GRANT SELECT    ON DATABASE :: SYSWEB_ACT TO swusrcs
    GRANT SELECT    ON SCHEMA :: swe TO swusrcs
GO

USE SYSWEB_BIT
    GRANT SELECT    ON DATABASE :: SYSWEB_BIT TO swusrcs
    GRANT SELECT    ON SCHEMA :: swe TO swusrcs
GO

USE SYSWEB_ADM
    --//-- No posee accesos de consulta
GO

USE SYSWEB_SIN
    GRANT SELECT    ON DATABASE :: SYSWEB_SIN TO swusrcs
    GRANT SELECT    ON SCHEMA :: swe TO swusrcs
GO

USE SYSWEB_INT
    GRANT SELECT    ON DATABASE :: SYSWEB_INT TO swusrcs
    GRANT SELECT    ON SCHEMA :: swe TO swusrcs
GO

