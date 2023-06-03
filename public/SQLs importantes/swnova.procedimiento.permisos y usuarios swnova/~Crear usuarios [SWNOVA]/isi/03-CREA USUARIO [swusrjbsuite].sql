-----------------------------------------------------------------------------
--1--------------------------------------------------------------------------
-- CREA EL USUARIO DE APLICACION PARA LAS BASES DE DATOS MASTER
-----------------------------------------------------------------------------
USE master
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrjbsuite') 
	DROP LOGIN swusrjbsuite
GO
EXEC sp_addlogin swusrjbsuite,'ujFXd682afrvMGyBgPmrkNbppMCa2hN6s6Tf2S72J87nFvzMULP6qQ5pdxq5EN2GJwMmdJczHVLYfaBMx2HMtpLxKZs2r4yYrbWewYDPKZDCMRe9uyxML9U7KWXZRnBS'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrjbsuite')
	DROP USER swusrjbsuite
GO
CREATE USER swusrjbsuite FOR LOGIN swusrjbsuite WITH DEFAULT_SCHEMA = swe
GO

USE msdb
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrjbsuite') 
    DROP LOGIN swusrjbsuite
GO
EXEC sp_addlogin swusrjbsuite,'ujFXd682afrvMGyBgPmrkNbppMCa2hN6s6Tf2S72J87nFvzMULP6qQ5pdxq5EN2GJwMmdJczHVLYfaBMx2HMtpLxKZs2r4yYrbWewYDPKZDCMRe9uyxML9U7KWXZRnBS'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrjbsuite') 
    DROP USER swusrjbsuite
GO
CREATE USER swusrjbsuite FOR LOGIN swusrjbsuite WITH DEFAULT_SCHEMA = dbo
GO



-----------------------------------------------------------------------------
--2--------------------------------------------------------------------------
-- CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS
-----------------------------------------------------------------------------
USE SYSWEB_ACT
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrjbsuite')
    DROP USER swusrjbsuite
GO
CREATE USER swusrjbsuite FOR LOGIN swusrjbsuite WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_ADM
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrjbsuite')
    DROP USER swusrjbsuite
GO
CREATE USER swusrjbsuite FOR LOGIN swusrjbsuite WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_BIT
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrjbsuite')
    DROP USER swusrjbsuite
GO
CREATE USER swusrjbsuite FOR LOGIN swusrjbsuite WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_SIN
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrjbsuite')
    DROP USER swusrjbsuite
GO
CREATE USER swusrjbsuite FOR LOGIN swusrjbsuite WITH DEFAULT_SCHEMA = swe
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
USE SYSWEB_INT
GO
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrjbsuite')
    DROP USER swusrjbsuite
GO
CREATE USER swusrjbsuite FOR LOGIN swusrjbsuite WITH DEFAULT_SCHEMA = swe
GO


-----------------------------------------------------------------------------
--3--------------------------------------------------------------------------
-- ASIGNA LOS PERMISOS NECESARIOS, EN CADA BD
-----------------------------------------------------------------------------
--asigna los permisos GRANT al usuario en las base de datos master
USE master
GRANT ALL ON DATABASE :: MASTER to swusrjbsuite
GRANT CREATE DATABASE ON DATABASE :: MASTER TO swusrjbsuite
GO

USE msdb
GRANT ALL               ON DATABASE :: msdb TO swusrjbsuite
GRANT SELECT            ON DATABASE :: msdb TO swusrjbsuite 
GRANT EXECUTE           ON DATABASE :: msdb TO swusrjbsuite
GRANT INSERT            ON DATABASE :: msdb TO swusrjbsuite
GRANT CREATE FUNCTION   ON DATABASE :: msdb TO swusrjbsuite 
GRANT CREATE PROCEDURE  ON DATABASE :: msdb TO swusrjbsuite 
GRANT CREATE TABLE      ON DATABASE :: msdb TO swusrjbsuite 
GRANT CREATE VIEW       ON DATABASE :: msdb TO swusrjbsuite 
EXEC master..sp_addsrvrolemember @loginame = N'swusrjbsuite', @rolename = N'sysadmin'
GO

--asigna los permisos GRANT al usuario en las base de datos de sistema
USE SYSWEB_ACT
GRANT ALL               ON DATABASE :: SYSWEB_ACT TO swusrjbsuite
GRANT SELECT            ON DATABASE :: SYSWEB_ACT TO swusrjbsuite 
GRANT EXECUTE           ON DATABASE :: SYSWEB_ACT TO swusrjbsuite
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_ACT TO swusrjbsuite 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_ACT TO swusrjbsuite 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_ACT TO swusrjbsuite 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_ACT TO swusrjbsuite 
GRANT SELECT        ON SCHEMA :: swe TO swusrjbsuite
GRANT INSERT        ON SCHEMA :: swe TO swusrjbsuite
GRANT UPDATE        ON SCHEMA :: swe TO swusrjbsuite
GRANT DELETE        ON SCHEMA :: swe TO swusrjbsuite
GRANT EXECUTE       ON SCHEMA :: swe TO swusrjbsuite
GRANT REFERENCES    ON SCHEMA :: swe TO swusrjbsuite
EXEC master..sp_addsrvrolemember @loginame = N'swusrjbsuite', @rolename = N'bulkadmin'
GO

USE SYSWEB_BIT
GRANT ALL               ON DATABASE :: SYSWEB_BIT TO swusrjbsuite
GRANT SELECT            ON DATABASE :: SYSWEB_BIT TO swusrjbsuite 
GRANT EXECUTE           ON DATABASE :: SYSWEB_BIT TO swusrjbsuite
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_BIT TO swusrjbsuite 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_BIT TO swusrjbsuite 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_BIT TO swusrjbsuite 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_BIT TO swusrjbsuite 
GRANT SELECT        ON SCHEMA :: swe TO swusrjbsuite
GRANT INSERT        ON SCHEMA :: swe TO swusrjbsuite
GRANT UPDATE        ON SCHEMA :: swe TO swusrjbsuite
GRANT DELETE        ON SCHEMA :: swe TO swusrjbsuite
GRANT EXECUTE       ON SCHEMA :: swe TO swusrjbsuite
GRANT REFERENCES    ON SCHEMA :: swe TO swusrjbsuite
GO

USE SYSWEB_ADM
GRANT ALL               ON DATABASE :: SYSWEB_ADM TO swusrjbsuite
GRANT SELECT            ON DATABASE :: SYSWEB_ADM TO swusrjbsuite 
GRANT EXECUTE           ON DATABASE :: SYSWEB_ADM TO swusrjbsuite
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_ADM TO swusrjbsuite 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_ADM TO swusrjbsuite 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_ADM TO swusrjbsuite 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_ADM TO swusrjbsuite 
GRANT SELECT        ON SCHEMA :: swe TO swusrjbsuite
GRANT INSERT        ON SCHEMA :: swe TO swusrjbsuite
GRANT UPDATE        ON SCHEMA :: swe TO swusrjbsuite
GRANT DELETE        ON SCHEMA :: swe TO swusrjbsuite
GRANT EXECUTE       ON SCHEMA :: swe TO swusrjbsuite
GRANT REFERENCES    ON SCHEMA :: swe TO swusrjbsuite
GO


USE SYSWEB_SIN
GRANT ALL               ON DATABASE :: SYSWEB_SIN TO swusrjbsuite
GRANT SELECT            ON DATABASE :: SYSWEB_SIN TO swusrjbsuite 
GRANT EXECUTE           ON DATABASE :: SYSWEB_SIN TO swusrjbsuite
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_SIN TO swusrjbsuite 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_SIN TO swusrjbsuite 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_SIN TO swusrjbsuite 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_SIN TO swusrjbsuite 
GRANT SELECT        ON SCHEMA :: swe TO swusrjbsuite
GRANT INSERT        ON SCHEMA :: swe TO swusrjbsuite
GRANT UPDATE        ON SCHEMA :: swe TO swusrjbsuite
GRANT DELETE        ON SCHEMA :: swe TO swusrjbsuite
GRANT EXECUTE       ON SCHEMA :: swe TO swusrjbsuite
GRANT REFERENCES    ON SCHEMA :: swe TO swusrjbsuite
EXEC master..sp_addsrvrolemember @loginame = N'swusrjbsuite', @rolename = N'bulkadmin'
GO


USE SYSWEB_INT
GRANT ALL               ON DATABASE :: SYSWEB_INT TO swusrjbsuite
GRANT SELECT            ON DATABASE :: SYSWEB_INT TO swusrjbsuite 
GRANT EXECUTE           ON DATABASE :: SYSWEB_INT TO swusrjbsuite
GRANT CREATE FUNCTION   ON DATABASE :: SYSWEB_INT TO swusrjbsuite 
GRANT CREATE PROCEDURE  ON DATABASE :: SYSWEB_INT TO swusrjbsuite 
GRANT CREATE TABLE      ON DATABASE :: SYSWEB_INT TO swusrjbsuite 
GRANT CREATE VIEW       ON DATABASE :: SYSWEB_INT TO swusrjbsuite 
GRANT SELECT        ON SCHEMA :: swe TO swusrjbsuite
GRANT INSERT        ON SCHEMA :: swe TO swusrjbsuite
GRANT UPDATE        ON SCHEMA :: swe TO swusrjbsuite
GRANT DELETE        ON SCHEMA :: swe TO swusrjbsuite
GRANT EXECUTE       ON SCHEMA :: swe TO swusrjbsuite
GRANT REFERENCES    ON SCHEMA :: swe TO swusrjbsuite
EXEC master..sp_addsrvrolemember @loginame = N'swusrjbsuite', @rolename = N'bulkadmin'
GO


