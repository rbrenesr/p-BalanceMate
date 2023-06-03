-----------------------------------------------------------------------------
-- CREA EL USUARIO DE APLICACION SECUNDARIO PARA SWNOVA
-----------------------------------------------------------------------------
USE master
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrad') 
	DROP LOGIN swusrad
GO
EXEC sp_addlogin swusrad,'Sw123456'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrad')
	DROP USER swusrad
GO
CREATE USER swusrad FOR LOGIN swusrad WITH DEFAULT_SCHEMA = swe
GO






-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_ACT
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrad')
    DROP USER swusrad
GO
CREATE USER swusrad FOR LOGIN swusrad WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_ADM
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrad')
    DROP USER swusrad
GO
CREATE USER swusrad FOR LOGIN swusrad WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_BIT
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrad')
    DROP USER swusrad
GO
CREATE USER swusrad FOR LOGIN swusrad WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_SIN
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrad')
    DROP USER swusrad
GO
CREATE USER swusrad FOR LOGIN swusrad WITH DEFAULT_SCHEMA = swe
GO




-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
--asigna los permisos GRANT al usuario swusrad en las base de datos master
USE master
GRANT ALL ON DATABASE :: MASTER to swusrad
GRANT CREATE DATABASE ON DATABASE :: MASTER TO swusrad
GO

USE SYSWEB_ACT
GRANT ALL               ON DATABASE :: SYSWEB_ACT TO swusrad
GRANT SELECT            ON DATABASE :: SYSWEB_ACT TO swusrad 
GRANT EXECUTE           ON DATABASE :: SYSWEB_ACT TO swusrad
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_ACT TO swusrad 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_ACT TO swusrad 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_ACT TO swusrad 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_ACT TO swusrad 
GRANT SELECT        ON SCHEMA :: swe TO swusrad
GRANT INSERT        ON SCHEMA :: swe TO swusrad
GRANT UPDATE        ON SCHEMA :: swe TO swusrad
GRANT DELETE        ON SCHEMA :: swe TO swusrad
GRANT EXECUTE       ON SCHEMA :: swe TO swusrad
GRANT REFERENCES    ON SCHEMA :: swe TO swusrad
EXEC master..sp_addsrvrolemember @loginame = N'swusrad', @rolename = N'bulkadmin'
GO

USE SYSWEB_BIT
GRANT ALL               ON DATABASE :: SYSWEB_BIT TO swusrad
GRANT SELECT            ON DATABASE :: SYSWEB_BIT TO swusrad 
GRANT EXECUTE           ON DATABASE :: SYSWEB_BIT TO swusrad
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_BIT TO swusrad 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_BIT TO swusrad 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_BIT TO swusrad 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_BIT TO swusrad 
GRANT SELECT        ON SCHEMA :: swe TO swusrad
GRANT INSERT        ON SCHEMA :: swe TO swusrad
GRANT UPDATE        ON SCHEMA :: swe TO swusrad
GRANT DELETE        ON SCHEMA :: swe TO swusrad
GRANT EXECUTE       ON SCHEMA :: swe TO swusrad
GRANT REFERENCES    ON SCHEMA :: swe TO swusrad
GO

USE SYSWEB_ADM
GRANT ALL               ON DATABASE :: SYSWEB_ADM TO swusrad
GRANT SELECT            ON DATABASE :: SYSWEB_ADM TO swusrad 
GRANT EXECUTE           ON DATABASE :: SYSWEB_ADM TO swusrad
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_ADM TO swusrad 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_ADM TO swusrad 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_ADM TO swusrad 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_ADM TO swusrad 
GRANT SELECT        ON SCHEMA :: swe TO swusrad
GRANT INSERT        ON SCHEMA :: swe TO swusrad
GRANT UPDATE        ON SCHEMA :: swe TO swusrad
GRANT DELETE        ON SCHEMA :: swe TO swusrad
GRANT EXECUTE       ON SCHEMA :: swe TO swusrad
GRANT REFERENCES    ON SCHEMA :: swe TO swusrad
GO


USE SYSWEB_SIN
GRANT ALL               ON DATABASE :: SYSWEB_SIN TO swusrad
GRANT SELECT            ON DATABASE :: SYSWEB_SIN TO swusrad 
GRANT EXECUTE           ON DATABASE :: SYSWEB_SIN TO swusrad
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_SIN TO swusrad 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_SIN TO swusrad 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_SIN TO swusrad 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_SIN TO swusrad 
GRANT SELECT        ON SCHEMA :: swe TO swusrad
GRANT INSERT        ON SCHEMA :: swe TO swusrad
GRANT UPDATE        ON SCHEMA :: swe TO swusrad
GRANT DELETE        ON SCHEMA :: swe TO swusrad
GRANT EXECUTE       ON SCHEMA :: swe TO swusrad
GRANT REFERENCES    ON SCHEMA :: swe TO swusrad
EXEC master..sp_addsrvrolemember @loginame = N'swusrad', @rolename = N'bulkadmin'
GO
