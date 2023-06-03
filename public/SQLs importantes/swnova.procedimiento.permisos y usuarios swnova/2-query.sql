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
GRANT ALL ON DATABASE :: SYSWEB_ACT TO swusrap
GRANT ALL ON DATABASE :: SYSWEB_ACT TO swusrsin
GRANT ALL ON DATABASE :: SYSWEB_ACT TO swusrrp
GRANT SELECT ON DATABASE :: SYSWEB_ACT TO swusrcs
GRANT EXECUTE ON DATABASE :: SYSWEB_ACT TO swusrbk
GRANT BACKUP DATABASE TO swusrbk
EXEC master..sp_addsrvrolemember @loginame = N'swusrap', @rolename = N'bulkadmin'
GO

USE SYSWEB_BIT
GRANT ALL ON DATABASE :: SYSWEB_BIT TO swusrap
GRANT ALL ON DATABASE :: SYSWEB_BIT TO swusrsin
GRANT INSERT ON DATABASE :: SYSWEB_BIT TO swusrbk
GO

USE SYSWEB_ADM
GRANT ALL ON DATABASE :: SYSWEB_ADM TO swusrap
GRANT ALL ON DATABASE :: SYSWEB_ADM TO swusrsin
GO

USE SYSWEB_INT
GRANT ALL ON DATABASE :: SYSWEB_INT TO swusrap
GRANT ALL ON DATABASE :: SYSWEB_INT TO swusrsin
GRANT ALL ON DATABASE :: SYSWEB_INT TO swusrrp
GRANT SELECT ON DATABASE :: SYSWEB_INT TO swusrcs
GRANT EXECUTE ON DATABASE :: SYSWEB_INT TO swusrbk
GRANT BACKUP DATABASE TO swusrbk
EXEC master..sp_addsrvrolemember @loginame = N'swusrap', @rolename = N'bulkadmin'
GO


USE SYSWEB_SIN
GRANT ALL ON DATABASE :: SYSWEB_SIN TO swusrsin
GO

