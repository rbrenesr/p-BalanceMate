use SYSWEB_SIN
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




IF EXISTS (select * from sys.sysusers s where name = 'swusrjbsuite')
    DROP USER swusrjbsuite
GO
CREATE USER swusrjbsuite FOR LOGIN swusrjbsuite WITH DEFAULT_SCHEMA = swe
GO



IF EXISTS (select * from sys.sysusers s where name = 'soporte')
    DROP USER soporte
GO
CREATE USER soporte FOR LOGIN soporte WITH DEFAULT_SCHEMA = swe
GO



IF EXISTS (SELECT * FROM SYS.sysusers WHERE NAME = 'swusrcs')
    DROP USER swusrcs
GO
CREATE USER swusrcs FOR LOGIN swusrcs WITH DEFAULT_SCHEMA = swe
GO



IF EXISTS (SELECT * FROM SYS.sysusers WHERE NAME = 'swusrbk ')
    DROP USER swusrbk 
GO
CREATE USER swusrbk FOR LOGIN swusrbk WITH DEFAULT_SCHEMA = swe
GO



IF EXISTS (SELECT * FROM SYS.sysusers WHERE NAME = 'swusrrp ')
    DROP USER swusrrp 
GO
CREATE USER swusrrp FOR LOGIN swusrrp WITH DEFAULT_SCHEMA = swe
GO