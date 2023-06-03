
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

USE master
    GRANT ALL ON DATABASE :: MASTER to soporte
    GRANT CREATE DATABASE ON DATABASE :: MASTER TO soporte
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

USE master
    GRANT ALL ON DATABASE :: MASTER to swusrjbsuite
    GRANT CREATE DATABASE ON DATABASE :: MASTER TO swusrjbsuite
GO


USE SYSWEB_ACT
	--app
    GRANT ALL       ON DATABASE :: SYSWEB_ACT to swusrap
    EXEC master..sp_addsrvrolemember @loginame = N'swusrap', @rolename = N'bulkadmin'
	GRANT ALL       ON DATABASE :: SYSWEB_ACT to soporte
    EXEC master..sp_addsrvrolemember @loginame = N'soporte', @rolename = N'bulkadmin'
	GRANT ALL       ON DATABASE :: SYSWEB_ACT to swusrjbsuite
    EXEC master..sp_addsrvrolemember @loginame = N'swusrjbsuite', @rolename = N'bulkadmin'
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
    --app
    GRANT ALL ON DATABASE :: SYSWEB_BIT TO swusrap
	GRANT ALL ON DATABASE :: SYSWEB_BIT TO soporte
	GRANT ALL ON DATABASE :: SYSWEB_BIT TO swusrjbsuite
    --backup    
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
    --app
    GRANT ALL ON DATABASE :: SYSWEB_ADM TO swusrap
	GRANT ALL ON DATABASE :: SYSWEB_ADM TO soporte
	GRANT ALL ON DATABASE :: SYSWEB_ADM TO swusrjbsuite
    --backup
    GRANT EXECUTE   ON DATABASE :: SYSWEB_ADM TO swusrbk
    GRANT EXECUTE   ON SCHEMA :: swe TO swusrbk
    GRANT BACKUP    DATABASE TO swusrbk
GO


USE SYSWEB_SIN
    --app
    GRANT ALL ON DATABASE :: SYSWEB_SIN TO swusrap
    EXEC master..sp_addsrvrolemember @loginame = N'swusrap', @rolename = N'bulkadmin'
	GRANT ALL ON DATABASE :: SYSWEB_SIN TO soporte
    EXEC master..sp_addsrvrolemember @loginame = N'soporte', @rolename = N'bulkadmin'
	GRANT ALL ON DATABASE :: SYSWEB_SIN TO swusrjbsuite
    EXEC master..sp_addsrvrolemember @loginame = N'swusrjbsuite', @rolename = N'bulkadmin'
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


USE SYSWEB_INT
    --app
    GRANT ALL ON DATABASE :: SYSWEB_INT TO swusrap
    EXEC master..sp_addsrvrolemember @loginame = N'swusrap', @rolename = N'bulkadmin'
	GRANT ALL ON DATABASE :: SYSWEB_INT TO soporte
    EXEC master..sp_addsrvrolemember @loginame = N'soporte', @rolename = N'bulkadmin'
	GRANT ALL ON DATABASE :: SYSWEB_INT TO swusrjbsuite
    EXEC master..sp_addsrvrolemember @loginame = N'swusrjbsuite', @rolename = N'bulkadmin'
    --backup
    GRANT EXECUTE   ON DATABASE :: SYSWEB_INT TO swusrbk
    GRANT EXECUTE   ON SCHEMA :: swe TO swusrbk
    GRANT BACKUP    DATABASE TO swusrbk
    --consulta y reportes
    GRANT SELECT    ON DATABASE :: SYSWEB_INT TO swusrcs
    GRANT SELECT    ON SCHEMA :: swe TO swusrcs
    GRANT SELECT    ON DATABASE :: SYSWEB_INT TO swusrrp
    GRANT SELECT    ON SCHEMA :: swe TO swusrrp
GO


