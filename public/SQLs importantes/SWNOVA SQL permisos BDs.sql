--1------------------------------------------------
--//EJECUTAR EL SCRIPT EN LAS DIFERENTES BASES 
--//DEPENDIENDO DE CUAL BD FUE RESTAURADA
---------------------------------------------------
use SYSWEB_ACT
--use SYSWEB_ADM
--use SYSWEB_BIT
--use SYSWEB_INT

--pasa momentaneamente el esquema a dbo
ALTER AUTHORIZATION ON SCHEMA::swe TO dbo

--si existe el usuario en la bd lo elimina
if exists(select * from SYSWEB_ACT.sys.sysusers s where name = 'swusrap')
drop user swusrap

--vuelve a crear el usuario
CREATE USER swusrap FOR LOGIN swusrap WITH DEFAULT_SCHEMA = swe

--asigna el esquema nuevamente al usuario
ALTER AUTHORIZATION ON SCHEMA::swe TO swusrap

--asigna los permisos GRANT al usuario swusrap en las base de datos
USE master
GRANT ALL ON DATABASE :: MASTER to swusrap
GRANT CREATE DATABASE ON DATABASE :: MASTER TO swusrap
GO

--2------------------------------------------------
--//EJECUTAR LA LINEA DEL SCRIPT
--//DEPENDIENDO DE CUAL BD FUE RESTAURADA
---------------------------------------------------

USE SYSWEB_ACT
GRANT ALL ON DATABASE :: SYSWEB_ACT to swusrap
GRANT EXECUTE ON DATABASE :: SYSWEB_ACT TO swusrbk
GRANT SELECT ON DATABASE :: SYSWEB_ACT TO swusrcs
GO

USE SYSWEB_BIT
GRANT ALL ON DATABASE :: SYSWEB_BIT to swusrap
GRANT INSERT ON DATABASE :: SYSWEB_BIT TO swusrbk
GO

USE SYSWEB_ADM
GRANT ALL ON DATABASE :: SYSWEB_ADM to swusrap
