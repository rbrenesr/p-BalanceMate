-----------------------------------------------------------------------------
--1--------------------------------------------------------------------------
-- CREA EL USUARIO DE APLICACION PARA LAS BASES DE DATOS MASTER
-----------------------------------------------------------------------------
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

USE msdb
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrap') 
    DROP LOGIN swusrap
GO
EXEC sp_addlogin swusrap,'Sw123456'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrap') 
    DROP USER swusrap
GO
CREATE USER swusrap FOR LOGIN swusrap WITH DEFAULT_SCHEMA = dbo
GO



-----------------------------------------------------------------------------
--2--------------------------------------------------------------------------
-- CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS
-----------------------------------------------------------------------------
USE SYSWEB_ACT
GO
--pasa momentáneamente el esquema a dbo
ALTER AUTHORIZATION ON SCHEMA::swe TO dbo

--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrap')
    DROP USER swusrap
GO
CREATE USER swusrap FOR LOGIN swusrap WITH DEFAULT_SCHEMA = swe
GO
ALTER AUTHORIZATION ON SCHEMA::swe TO swusrap
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_ADM
GO
--pasa momentáneamente el esquema a dbo
ALTER AUTHORIZATION ON SCHEMA::swe TO dbo

--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrap')
    DROP USER swusrap
GO
CREATE USER swusrap FOR LOGIN swusrap WITH DEFAULT_SCHEMA = swe
GO
ALTER AUTHORIZATION ON SCHEMA::swe TO swusrap
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_BIT
GO
--pasa momentáneamente el esquema a dbo
ALTER AUTHORIZATION ON SCHEMA::swe TO dbo

--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrap')
    DROP USER swusrap
GO
CREATE USER swusrap FOR LOGIN swusrap WITH DEFAULT_SCHEMA = swe
GO
ALTER AUTHORIZATION ON SCHEMA::swe TO swusrap
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_SIN
GO
--pasa momentáneamente el esquema a dbo
ALTER AUTHORIZATION ON SCHEMA::swe TO dbo

--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrap')
    DROP USER swusrap
GO
CREATE USER swusrap FOR LOGIN swusrap WITH DEFAULT_SCHEMA = swe
GO
ALTER AUTHORIZATION ON SCHEMA::swe TO swusrap
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_INT
GO
--pasa momentáneamente el esquema a dbo
ALTER AUTHORIZATION ON SCHEMA::swe TO dbo

--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrap')
    DROP USER swusrap
GO
CREATE USER swusrap FOR LOGIN swusrap WITH DEFAULT_SCHEMA = swe
GO
ALTER AUTHORIZATION ON SCHEMA::swe TO swusrap
GO


-----------------------------------------------------------------------------
--3--------------------------------------------------------------------------
-- ASIGNA LOS PERMISOS NECESARIOS, EN CADA BD
-----------------------------------------------------------------------------
--asigna los permisos GRANT al usuario en las base de datos master
USE master
GRANT ALL ON DATABASE :: MASTER to swusrap
GRANT CREATE DATABASE ON DATABASE :: MASTER TO swusrap
GO

USE msdb
GRANT ALL               ON DATABASE :: msdb TO swusrap
GRANT SELECT            ON DATABASE :: msdb TO swusrap 
GRANT EXECUTE           ON DATABASE :: msdb TO swusrap
GRANT INSERT            ON DATABASE :: msdb TO swusrap
GRANT CREATE FUNCTION   ON DATABASE :: msdb TO swusrap 
GRANT CREATE PROCEDURE  ON DATABASE :: msdb TO swusrap 
GRANT CREATE TABLE      ON DATABASE :: msdb TO swusrap 
GRANT CREATE VIEW       ON DATABASE :: msdb TO swusrap 
EXEC master..sp_addsrvrolemember @loginame = N'swusrap', @rolename = N'sysadmin'
GO

--asigna los permisos GRANT al usuario en las base de datos de sistema
USE SYSWEB_ACT
GRANT ALL               ON DATABASE :: SYSWEB_ACT TO swusrap
GRANT SELECT            ON DATABASE :: SYSWEB_ACT TO swusrap 
GRANT EXECUTE           ON DATABASE :: SYSWEB_ACT TO swusrap
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_ACT TO swusrap 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_ACT TO swusrap 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_ACT TO swusrap 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_ACT TO swusrap 
GRANT SELECT        ON SCHEMA :: swe TO swusrap
GRANT INSERT        ON SCHEMA :: swe TO swusrap
GRANT UPDATE        ON SCHEMA :: swe TO swusrap
GRANT DELETE        ON SCHEMA :: swe TO swusrap
GRANT EXECUTE       ON SCHEMA :: swe TO swusrap
GRANT REFERENCES    ON SCHEMA :: swe TO swusrap
EXEC master..sp_addsrvrolemember @loginame = N'swusrap', @rolename = N'bulkadmin'
GO

USE SYSWEB_BIT
GRANT ALL               ON DATABASE :: SYSWEB_BIT TO swusrap
GRANT SELECT            ON DATABASE :: SYSWEB_BIT TO swusrap 
GRANT EXECUTE           ON DATABASE :: SYSWEB_BIT TO swusrap
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_BIT TO swusrap 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_BIT TO swusrap 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_BIT TO swusrap 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_BIT TO swusrap 
GRANT SELECT        ON SCHEMA :: swe TO swusrap
GRANT INSERT        ON SCHEMA :: swe TO swusrap
GRANT UPDATE        ON SCHEMA :: swe TO swusrap
GRANT DELETE        ON SCHEMA :: swe TO swusrap
GRANT EXECUTE       ON SCHEMA :: swe TO swusrap
GRANT REFERENCES    ON SCHEMA :: swe TO swusrap
GO

USE SYSWEB_ADM
GRANT ALL               ON DATABASE :: SYSWEB_ADM TO swusrap
GRANT SELECT            ON DATABASE :: SYSWEB_ADM TO swusrap 
GRANT EXECUTE           ON DATABASE :: SYSWEB_ADM TO swusrap
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_ADM TO swusrap 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_ADM TO swusrap 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_ADM TO swusrap 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_ADM TO swusrap 
GRANT SELECT        ON SCHEMA :: swe TO swusrap
GRANT INSERT        ON SCHEMA :: swe TO swusrap
GRANT UPDATE        ON SCHEMA :: swe TO swusrap
GRANT DELETE        ON SCHEMA :: swe TO swusrap
GRANT EXECUTE       ON SCHEMA :: swe TO swusrap
GRANT REFERENCES    ON SCHEMA :: swe TO swusrap
GO


USE SYSWEB_SIN
GRANT ALL               ON DATABASE :: SYSWEB_SIN TO swusrap
GRANT SELECT            ON DATABASE :: SYSWEB_SIN TO swusrap 
GRANT EXECUTE           ON DATABASE :: SYSWEB_SIN TO swusrap
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_SIN TO swusrap 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_SIN TO swusrap 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_SIN TO swusrap 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_SIN TO swusrap 
GRANT SELECT        ON SCHEMA :: swe TO swusrap
GRANT INSERT        ON SCHEMA :: swe TO swusrap
GRANT UPDATE        ON SCHEMA :: swe TO swusrap
GRANT DELETE        ON SCHEMA :: swe TO swusrap
GRANT EXECUTE       ON SCHEMA :: swe TO swusrap
GRANT REFERENCES    ON SCHEMA :: swe TO swusrap
EXEC master..sp_addsrvrolemember @loginame = N'swusrap', @rolename = N'bulkadmin'
GO


USE SYSWEB_INT
GRANT ALL               ON DATABASE :: SYSWEB_INT TO swusrap
GRANT SELECT            ON DATABASE :: SYSWEB_INT TO swusrap 
GRANT EXECUTE           ON DATABASE :: SYSWEB_INT TO swusrap
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_INT TO swusrap 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_INT TO swusrap 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_INT TO swusrap 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_INT TO swusrap 
GRANT SELECT        ON SCHEMA :: swe TO swusrap
GRANT INSERT        ON SCHEMA :: swe TO swusrap
GRANT UPDATE        ON SCHEMA :: swe TO swusrap
GRANT DELETE        ON SCHEMA :: swe TO swusrap
GRANT EXECUTE       ON SCHEMA :: swe TO swusrap
GRANT REFERENCES    ON SCHEMA :: swe TO swusrap
EXEC master..sp_addsrvrolemember @loginame = N'swusrap', @rolename = N'bulkadmin'
GO



--------------------------------------------------------------------------
--4-----------------------------------------------------------------------
-- ASIGNA LOS PERMISOS NECESARIOS PARA EL ENVÍO DE CORREOS
--------------------------------------------------------------------------
USE [SYSWEB_ACT]
GO
EXEC sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO
 
-- enable Database Mail XPs
EXEC sp_configure 'Database Mail XPs', 1
GO
RECONFIGURE
GO
 
-- check if it has been changed
EXEC sp_configure 'Database Mail XPs'
GO
 
-- hide advanced options
EXEC sp_configure 'show advanced options', 0
GO
RECONFIGURE
--------------------------------------------------------------------------