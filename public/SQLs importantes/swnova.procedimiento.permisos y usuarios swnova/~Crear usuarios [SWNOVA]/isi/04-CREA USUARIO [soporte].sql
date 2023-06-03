-----------------------------------------------------------------------------
--1--------------------------------------------------------------------------
-- CREA EL USUARIO DE APLICACION PARA LAS BASES DE DATOS MASTER
-----------------------------------------------------------------------------
USE master
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'soporte') 
	DROP LOGIN soporte
GO
EXEC sp_addlogin soporte,'conestapalabraentrasoporte*'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'soporte')
	DROP USER soporte
GO
CREATE USER soporte FOR LOGIN soporte WITH DEFAULT_SCHEMA = swe
GO

USE msdb
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'soporte') 
    DROP LOGIN soporte
GO
EXEC sp_addlogin soporte,'conestapalabraentrasoporte*'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'soporte') 
    DROP USER soporte
GO
CREATE USER soporte FOR LOGIN soporte WITH DEFAULT_SCHEMA = dbo
GO



-----------------------------------------------------------------------------
--2--------------------------------------------------------------------------
-- CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS
-----------------------------------------------------------------------------
USE SYSWEB_ACT
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'soporte')
    DROP USER soporte
GO
CREATE USER soporte FOR LOGIN soporte WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_ADM
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'soporte')
    DROP USER soporte
GO
CREATE USER soporte FOR LOGIN soporte WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_BIT
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'soporte')
    DROP USER soporte
GO
CREATE USER soporte FOR LOGIN soporte WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_SIN
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'soporte')
    DROP USER soporte
GO
CREATE USER soporte FOR LOGIN soporte WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_INT
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'soporte')
    DROP USER soporte
GO
CREATE USER soporte FOR LOGIN soporte WITH DEFAULT_SCHEMA = swe
GO


-----------------------------------------------------------------------------
--3--------------------------------------------------------------------------
-- ASIGNA LOS PERMISOS NECESARIOS, EN CADA BD
-----------------------------------------------------------------------------
--asigna los permisos GRANT al usuario en las base de datos master
USE master
GRANT ALL ON DATABASE :: MASTER to soporte
GRANT CREATE DATABASE ON DATABASE :: MASTER TO soporte
GO

USE msdb
GRANT ALL               ON DATABASE :: msdb TO soporte
GRANT SELECT            ON DATABASE :: msdb TO soporte 
GRANT EXECUTE           ON DATABASE :: msdb TO soporte
GRANT INSERT            ON DATABASE :: msdb TO soporte
GRANT CREATE FUNCTION   ON DATABASE :: msdb TO soporte 
GRANT CREATE PROCEDURE  ON DATABASE :: msdb TO soporte 
GRANT CREATE TABLE      ON DATABASE :: msdb TO soporte 
GRANT CREATE VIEW       ON DATABASE :: msdb TO soporte 
EXEC master..sp_addsrvrolemember @loginame = N'soporte', @rolename = N'sysadmin'
GO

--asigna los permisos GRANT al usuario en las base de datos de sistema
USE SYSWEB_ACT
GRANT ALL               ON DATABASE :: SYSWEB_ACT TO soporte
GRANT SELECT            ON DATABASE :: SYSWEB_ACT TO soporte 
GRANT EXECUTE           ON DATABASE :: SYSWEB_ACT TO soporte
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_ACT TO soporte 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_ACT TO soporte 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_ACT TO soporte 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_ACT TO soporte 
GRANT SELECT        ON SCHEMA :: swe TO soporte
GRANT INSERT        ON SCHEMA :: swe TO soporte
GRANT UPDATE        ON SCHEMA :: swe TO soporte
GRANT DELETE        ON SCHEMA :: swe TO soporte
GRANT EXECUTE       ON SCHEMA :: swe TO soporte
GRANT REFERENCES    ON SCHEMA :: swe TO soporte
EXEC master..sp_addsrvrolemember @loginame = N'soporte', @rolename = N'bulkadmin'
GO

USE SYSWEB_BIT
GRANT ALL               ON DATABASE :: SYSWEB_BIT TO soporte
GRANT SELECT            ON DATABASE :: SYSWEB_BIT TO soporte 
GRANT EXECUTE           ON DATABASE :: SYSWEB_BIT TO soporte
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_BIT TO soporte 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_BIT TO soporte 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_BIT TO soporte 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_BIT TO soporte 
GRANT SELECT        ON SCHEMA :: swe TO soporte
GRANT INSERT        ON SCHEMA :: swe TO soporte
GRANT UPDATE        ON SCHEMA :: swe TO soporte
GRANT DELETE        ON SCHEMA :: swe TO soporte
GRANT EXECUTE       ON SCHEMA :: swe TO soporte
GRANT REFERENCES    ON SCHEMA :: swe TO soporte
GO

USE SYSWEB_ADM
GRANT ALL               ON DATABASE :: SYSWEB_ADM TO soporte
GRANT SELECT            ON DATABASE :: SYSWEB_ADM TO soporte 
GRANT EXECUTE           ON DATABASE :: SYSWEB_ADM TO soporte
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_ADM TO soporte 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_ADM TO soporte 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_ADM TO soporte 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_ADM TO soporte 
GRANT SELECT        ON SCHEMA :: swe TO soporte
GRANT INSERT        ON SCHEMA :: swe TO soporte
GRANT UPDATE        ON SCHEMA :: swe TO soporte
GRANT DELETE        ON SCHEMA :: swe TO soporte
GRANT EXECUTE       ON SCHEMA :: swe TO soporte
GRANT REFERENCES    ON SCHEMA :: swe TO soporte
GO


USE SYSWEB_SIN
GRANT ALL               ON DATABASE :: SYSWEB_SIN TO soporte
GRANT SELECT            ON DATABASE :: SYSWEB_SIN TO soporte 
GRANT EXECUTE           ON DATABASE :: SYSWEB_SIN TO soporte
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_SIN TO soporte 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_SIN TO soporte 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_SIN TO soporte 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_SIN TO soporte 
GRANT SELECT        ON SCHEMA :: swe TO soporte
GRANT INSERT        ON SCHEMA :: swe TO soporte
GRANT UPDATE        ON SCHEMA :: swe TO soporte
GRANT DELETE        ON SCHEMA :: swe TO soporte
GRANT EXECUTE       ON SCHEMA :: swe TO soporte
GRANT REFERENCES    ON SCHEMA :: swe TO soporte
EXEC master..sp_addsrvrolemember @loginame = N'soporte', @rolename = N'bulkadmin'
GO


USE SYSWEB_INT
GRANT ALL               ON DATABASE :: SYSWEB_INT TO soporte
GRANT SELECT            ON DATABASE :: SYSWEB_INT TO soporte 
GRANT EXECUTE           ON DATABASE :: SYSWEB_INT TO soporte
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_INT TO soporte 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_INT TO soporte 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_INT TO soporte 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_INT TO soporte 
GRANT SELECT        ON SCHEMA :: swe TO soporte
GRANT INSERT        ON SCHEMA :: swe TO soporte
GRANT UPDATE        ON SCHEMA :: swe TO soporte
GRANT DELETE        ON SCHEMA :: swe TO soporte
GRANT EXECUTE       ON SCHEMA :: swe TO soporte
GRANT REFERENCES    ON SCHEMA :: swe TO soporte
EXEC master..sp_addsrvrolemember @loginame = N'soporte', @rolename = N'bulkadmin'
GO


