USE msdb
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrap') 
    DROP LOGIN swusrap
GO
EXEC sp_addlogin swusrap,'Sw123'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrap') 
    DROP USER swusrap
GO
CREATE USER swusrap FOR LOGIN swusrap WITH DEFAULT_SCHEMA = dbo
GO

USE master
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrap') 
    DROP LOGIN swusrap
GO
EXEC sp_addlogin swusrap,'Sw123'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrap') 
    DROP USER swusrap
GO
CREATE USER swusrap FOR LOGIN swusrap WITH DEFAULT_SCHEMA = swe
GO

-------------------------------------------------------------------------------------------

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


-------------------------------------------------------------------------------------------

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

-------------------------------------------------------------------------------------------

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


-------------------------------------------------------------------------------------------

USE master
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrbk') 
    DROP LOGIN swusrbk
GO
EXEC sp_addlogin swusrbk,'Sw123'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrbk')
    DROP USER swusrbk
GO
CREATE USER swusrbk FOR LOGIN swusrbk WITH DEFAULT_SCHEMA = swe
GO

-------------------------------------------------------------------------------------------

USE master
GO
IF EXISTS (SELECT * FROM sys.syslogins WHERE loginname = 'swusrrp') 
    DROP LOGIN swusrrp
GO
EXEC sp_addlogin swusrrp,'Sw123'
GO
IF EXISTS (SELECT * FROM sys.sysusers WHERE NAME = 'swusrrp')
    DROP USER swusrrp
GO
CREATE USER swusrrp FOR LOGIN swusrrp WITH DEFAULT_SCHEMA = swe
GO
