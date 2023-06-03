-----------------------------------------------------------------------------
--1--------------------------------------------------------------------------
-- CREA EL USUARIO DE APLICACION PARA LAS BASES DE DATOS MASTER
-----------------------------------------------------------------------------
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



-----------------------------------------------------------------------------
--2--------------------------------------------------------------------------
-- CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS
-----------------------------------------------------------------------------
USE SYSWEB_ACT
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrrp')
    DROP USER swusrrp
GO
CREATE USER swusrrp FOR LOGIN swusrrp WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_ADM
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrrp')
    DROP USER swusrrp
GO
CREATE USER swusrrp FOR LOGIN swusrrp WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_BIT
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrrp')
    DROP USER swusrrp
GO
CREATE USER swusrrp FOR LOGIN swusrrp WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_SIN
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrrp')
    DROP USER swusrrp
GO
CREATE USER swusrrp FOR LOGIN swusrrp WITH DEFAULT_SCHEMA = swe
GO




-----------------------------------------------------------------------------
--3--------------------------------------------------------------------------
-- ASIGNA LOS PERMISOS NECESARIOS, EN CADA BD
-----------------------------------------------------------------------------
--asigna los permisos GRANT al usuario en las base de datos master
USE master
GRANT ALL ON DATABASE :: MASTER to swusrrp
GRANT CREATE DATABASE ON DATABASE :: MASTER TO swusrrp
GO


--asigna los permisos GRANT al usuario en las base de datos de sistema
USE SYSWEB_ACT
GRANT ALL               ON DATABASE :: SYSWEB_ACT TO swusrrp
GRANT SELECT            ON DATABASE :: SYSWEB_ACT TO swusrrp 
GRANT EXECUTE           ON DATABASE :: SYSWEB_ACT TO swusrrp
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_ACT TO swusrrp 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_ACT TO swusrrp 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_ACT TO swusrrp 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_ACT TO swusrrp 
GRANT SELECT        ON SCHEMA :: swe TO swusrrp
GRANT INSERT        ON SCHEMA :: swe TO swusrrp
GRANT UPDATE        ON SCHEMA :: swe TO swusrrp
GRANT DELETE        ON SCHEMA :: swe TO swusrrp
GRANT EXECUTE       ON SCHEMA :: swe TO swusrrp
GRANT REFERENCES    ON SCHEMA :: swe TO swusrrp
EXEC master..sp_addsrvrolemember @loginame = N'swusrrp', @rolename = N'bulkadmin'
GO

USE SYSWEB_BIT
GRANT ALL               ON DATABASE :: SYSWEB_BIT TO swusrrp
GRANT SELECT            ON DATABASE :: SYSWEB_BIT TO swusrrp 
GRANT EXECUTE           ON DATABASE :: SYSWEB_BIT TO swusrrp
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_BIT TO swusrrp 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_BIT TO swusrrp 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_BIT TO swusrrp 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_BIT TO swusrrp 
GRANT SELECT        ON SCHEMA :: swe TO swusrrp
GRANT INSERT        ON SCHEMA :: swe TO swusrrp
GRANT UPDATE        ON SCHEMA :: swe TO swusrrp
GRANT DELETE        ON SCHEMA :: swe TO swusrrp
GRANT EXECUTE       ON SCHEMA :: swe TO swusrrp
GRANT REFERENCES    ON SCHEMA :: swe TO swusrrp
GO

USE SYSWEB_ADM
GRANT ALL               ON DATABASE :: SYSWEB_ADM TO swusrrp
GRANT SELECT            ON DATABASE :: SYSWEB_ADM TO swusrrp 
GRANT EXECUTE           ON DATABASE :: SYSWEB_ADM TO swusrrp
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_ADM TO swusrrp 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_ADM TO swusrrp 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_ADM TO swusrrp 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_ADM TO swusrrp 
GRANT SELECT        ON SCHEMA :: swe TO swusrrp
GRANT INSERT        ON SCHEMA :: swe TO swusrrp
GRANT UPDATE        ON SCHEMA :: swe TO swusrrp
GRANT DELETE        ON SCHEMA :: swe TO swusrrp
GRANT EXECUTE       ON SCHEMA :: swe TO swusrrp
GRANT REFERENCES    ON SCHEMA :: swe TO swusrrp
GO


USE SYSWEB_SIN
GRANT ALL               ON DATABASE :: SYSWEB_SIN TO swusrrp
GRANT SELECT            ON DATABASE :: SYSWEB_SIN TO swusrrp 
GRANT EXECUTE           ON DATABASE :: SYSWEB_SIN TO swusrrp
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_SIN TO swusrrp 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_SIN TO swusrrp 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_SIN TO swusrrp 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_SIN TO swusrrp 
GRANT SELECT        ON SCHEMA :: swe TO swusrrp
GRANT INSERT        ON SCHEMA :: swe TO swusrrp
GRANT UPDATE        ON SCHEMA :: swe TO swusrrp
GRANT DELETE        ON SCHEMA :: swe TO swusrrp
GRANT EXECUTE       ON SCHEMA :: swe TO swusrrp
GRANT REFERENCES    ON SCHEMA :: swe TO swusrrp
EXEC master..sp_addsrvrolemember @loginame = N'swusrrp', @rolename = N'bulkadmin'
GO
