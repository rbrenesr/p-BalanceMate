--1------------------------------------------------
--//EJECUTAR EL SCRIPT EN LAS DIFERENTES BASES 
--//DEPENDIENDO DE CUAL BD FUE RESTAURADA
---------------------------------------------------
use SMWEB01
GO

--pasa momentaneamente el esquema a dbo
ALTER AUTHORIZATION ON SCHEMA::sme TO dbo

--si existe el usuario en la bd lo elimina
if exists(select * from sys.sysusers s where name = 'smusrap')
drop user smusrap

--vuelve a crear el usuario
CREATE USER smusrap FOR LOGIN smusrap WITH DEFAULT_SCHEMA = sme

--asigna el esquema nuevamente al usuario
ALTER AUTHORIZATION ON SCHEMA::sme TO smusrap

--asigna los permisos GRANT al usuario smusrap en las base de datos
USE master
GRANT ALL ON DATABASE :: MASTER to smusrap
GRANT CREATE DATABASE ON DATABASE :: MASTER TO smusrap
GO



--2----------------------------------------------------
--//AUTORIZA EL USUARIO EN LAS BASES DE DATOS Y ESQUEMA 
-------------------------------------------------------
--USE SYSWEB_ACT
--USE SYSWEB_ADM
--USE SYSWEB_BIT

GO

--si existe el usuario en la bd lo elimina
if exists(select * from sys.sysusers s where name = 'smusrap')
drop user smusrap

--vuelve a crear el usuario
CREATE USER smusrap FOR LOGIN smusrap WITH DEFAULT_SCHEMA = swe

--asigna el esquema nuevamente al usuario swusrap
ALTER AUTHORIZATION ON SCHEMA::swe TO swusrap



--3------------------------------------------------
--//EJECUTAR LA LINEA DEL SCRIPT
--//DEPENDIENDO DE CUAL BD FUE RESTAURADA
---------------------------------------------------

USE SMWEB01
GRANT ALL ON DATABASE :: SMWEB01 to smusrap
GO

USE SYSWEB_ACT
GRANT ALL ON DATABASE :: SYSWEB_ACT to smusrap

GRANT SELECT ON SCHEMA :: swe TO smusrap;
GRANT UPDATE ON SCHEMA :: swe TO smusrap;
GRANT INSERT ON SCHEMA :: swe TO smusrap;
GRANT DELETE ON SCHEMA :: swe TO smusrap;
GRANT EXECUTE ON SCHEMA :: swe TO smusrap;
GO

USE SYSWEB_ADM
GRANT ALL ON DATABASE :: SYSWEB_ADM to smusrap

GRANT SELECT ON SCHEMA :: swe TO smusrap;
GRANT UPDATE ON SCHEMA :: swe TO smusrap;
GRANT INSERT ON SCHEMA :: swe TO smusrap;
GRANT DELETE ON SCHEMA :: swe TO smusrap;
GRANT EXECUTE ON SCHEMA :: swe TO smusrap;
GO

USE SYSWEB_BIT
GRANT ALL ON DATABASE :: SYSWEB_BIT to smusrap

GRANT SELECT ON SCHEMA :: swe TO smusrap;
GRANT UPDATE ON SCHEMA :: swe TO smusrap;
GRANT INSERT ON SCHEMA :: swe TO smusrap;
GRANT DELETE ON SCHEMA :: swe TO smusrap;
GRANT EXECUTE ON SCHEMA :: swe TO smusrap;
GO