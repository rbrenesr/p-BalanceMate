--0------------------------------------------------
--//-- EJECUTAR EL SCRIPT PARA LA CREACION DE LOS
--//-- LOGINS Y USUARIOS EN LA BDs  [SWNOVA]
--//-- 
--//--  - swusrap (APLICACI�N)
--//--  - swusrcs (CONSULTA -SELECTS-)
--//--  - swusrrp (CONSULTA -REPORTES-)
--//--  - swusrbk (RESPALDO)
---------------------------------------------------

---------------------------------------------------
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
--------------
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
--------------
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
--------------
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





USE SYSWEB_ACT
--use SYSWEB_ADM
--use SYSWEB_BIT
--use SYSWEB_SIN
--use SYSWEB_ANT
GO

ALTER AUTHORIZATION ON SCHEMA::swe TO dbo
IF EXISTS (select * from sys.sysusers s where name = 'swusrap')
    DROP USER swusrap
GO
CREATE USER swusrap FOR LOGIN swusrap WITH DEFAULT_SCHEMA = swe
GO
ALTER AUTHORIZATION ON SCHEMA::swe TO swusrap
GO
--
IF EXISTS (SELECT * FROM SYS.sysusers WHERE NAME = 'swusrcs')
    DROP USER swusrcs
GO
CREATE USER swusrcs FOR LOGIN swusrcs WITH DEFAULT_SCHEMA = swe
GO
--
IF EXISTS (SELECT * FROM SYS.sysusers WHERE NAME = 'swusrbk ')
    DROP USER swusrbk 
GO
CREATE USER swusrbk FOR LOGIN swusrbk WITH DEFAULT_SCHEMA = swe
GO
--
IF EXISTS (SELECT * FROM SYS.sysusers WHERE NAME = 'swusrrp ')
    DROP USER swusrrp 
GO
CREATE USER swusrrp FOR LOGIN swusrrp WITH DEFAULT_SCHEMA = swe
GO
--//-- ------------------------------------------------------- --//--











--2-----------------------------------------------------------------------
--//--EJECUTAR LA LINEA DEL SCRIPT, DEPENDIENDO DE CUAL BD FUE RESTAURADA
--//--ASIGNA LOS PERMISOS NECESARIOS A CADA USUARIO, EN CADA BD
--------------------------------------------------------------------------
--asigna los permisos GRANT al usuario swusrap en las base de datos master
USE master
    GRANT ALL ON DATABASE :: MASTER to swusrap
    GRANT CREATE DATABASE ON DATABASE :: MASTER TO swusrap
GO

USE SYSWEB_ACT
    --aplicaci�n
    GRANT ALL       ON DATABASE :: SYSWEB_ACT to swusrap
    EXEC master..sp_addsrvrolemember @loginame = N'swusrap', @rolename = N'bulkadmin'
    --backup
    GRANT EXECUTE   ON DATABASE :: SYSWEB_ACT TO swusrbk
    GRANT EXECUTE   ON SCHEMA :: swe TO swusrbk
    GRANT BACKUP    DATABASE TO swusrbk
    --consulta y reportes
    GRANT SELECT    ON DATABASE :: SYSWEB_ACT TO swusrcs
    GRANT SELECT    ON SCHEMA :: swe TO swusrcs
    GRANT SELECT    ON DATABASE :: SYSWEB_ACT TO swusrrp
    GRANT SELECT    ON SCHEMA :: swe TO swusrrp
GO


USE SYSWEB_BIT
    --aplicaci�n
    GRANT ALL ON DATABASE :: SYSWEB_BIT TO swusrap
    --backup
    GRANT INSERT    ON DATABASE :: SYSWEB_BIT TO swusrbk
    GRANT EXECUTE   ON DATABASE :: SYSWEB_BIT TO swusrbk
    GRANT EXECUTE   ON SCHEMA :: swe TO swusrbk
    GRANT BACKUP    DATABASE TO swusrbk
    --consulta y reportes
    GRANT SELECT    ON DATABASE :: SYSWEB_BIT TO swusrcs
    GRANT SELECT    ON SCHEMA :: swe TO swusrcs
    GRANT SELECT    ON DATABASE :: SYSWEB_BIT TO swusrrp
    GRANT SELECT    ON SCHEMA :: swe TO swusrrp
GO


USE SYSWEB_ADM
    --aplicaci�n
    GRANT ALL ON DATABASE :: SYSWEB_ADM TO swusrap
    --backup
    GRANT EXECUTE   ON DATABASE :: SYSWEB_ADM TO swusrbk
    GRANT EXECUTE   ON SCHEMA :: swe TO swusrbk
    GRANT BACKUP    DATABASE TO swusrbk
GO


USE SYSWEB_SIN
    --aplicaci�n
    GRANT ALL ON DATABASE :: SYSWEB_SIN TO swusrap
    EXEC master..sp_addsrvrolemember @loginame = N'swusrap', @rolename = N'bulkadmin'
    --backup
    GRANT EXECUTE   ON DATABASE :: SYSWEB_SIN TO swusrbk
    GRANT EXECUTE   ON SCHEMA :: swe TO swusrbk
    GRANT BACKUP    DATABASE TO swusrbk
    --consulta y reportes
    GRANT SELECT    ON DATABASE :: SYSWEB_SIN TO swusrcs
    GRANT SELECT    ON SCHEMA :: swe TO swusrcs
    GRANT SELECT    ON DATABASE :: SYSWEB_SIN TO swusrrp
    GRANT SELECT    ON SCHEMA :: swe TO swusrrp
GO


-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
--asigna los permisos GRANT al usuario swusrrp en las base de datos master
USE master
GRANT ALL ON DATABASE :: MASTER to swusrrp
GRANT CREATE DATABASE ON DATABASE :: MASTER TO swusrrp
GO

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
