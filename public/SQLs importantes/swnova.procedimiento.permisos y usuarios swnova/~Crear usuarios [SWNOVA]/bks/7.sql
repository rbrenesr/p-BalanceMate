
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
