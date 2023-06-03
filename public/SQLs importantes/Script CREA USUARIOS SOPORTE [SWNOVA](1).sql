--//-- ------------------------------------------------------- --//--
--//--  GENERAR USUARIOS DE SOPORTE DE BASE DE DATOS [SWNOVA]  --//--
--//-- ------------------------------------------------------- --//--

--//-- ------------------------------------------------------- --//--
----//-- Modificar Clave usuaro SA
--USE [master]
--GO
--ALTER LOGIN [sa] WITH PASSWORD=N'SW2Sfd2220175'
--GO
--//-- ------------------------------------------------------- --//--


--//-- ------------------------------------------------------- --//--
--Crea login y usuario en la base de datos [master]
--//-- ------------------------------------------------------- --//--
USE master
GO
IF EXISTS(SELECT * FROM SYS.syslogins WHERE loginname = 'Soporte01') 
	DROP LOGIN Soporte01
GO
exec sp_addlogin Soporte01,'SW2S0p0rte01'
GO
IF EXISTS(SELECT * FROM SYS.sysusers WHERE NAME = 'Soporte01')
	DROP USER Soporte01
GO
CREATE USER Soporte01 FOR LOGIN Soporte01 WITH DEFAULT_SCHEMA = swe
GO
--//-- ------------------------------------------------------- --//--





--//-- ------------------------------------------------------- --//--
--Crea usuario en las bases de datos, con permiso al esquema
--   [SYSWEB_ACT],    [SYSWEB_ADM],    [SYSWEB_BIT]
--//-- ------------------------------------------------------- --//--
USE [SYSWEB_ACT]
GO
--si existe el usuario en la bd lo elimina
IF EXISTS(SELECT * FROM SYS.sysusers WHERE NAME = 'Soporte01')
	DROP USER Soporte01
GO
CREATE USER Soporte01 FOR LOGIN Soporte01 WITH DEFAULT_SCHEMA = swe
GO
--//-- --------------------
USE [SYSWEB_ADM]
GO
--si existe el usuario en la bd lo elimina
IF EXISTS(SELECT * FROM SYS.sysusers WHERE NAME = 'Soporte01')
	DROP USER Soporte01
GO
CREATE USER Soporte01 FOR LOGIN Soporte01 WITH DEFAULT_SCHEMA = swe
GO
--//-- --------------------
--Crea usuario en la base de datos [SYSWEB_BIT] con permiso al esquema
USE [SYSWEB_BIT]
GO
--si existe el usuario en la bd lo elimina
IF EXISTS(SELECT * FROM SYS.sysusers WHERE NAME = 'Soporte01')
	DROP USER Soporte01
GO
CREATE USER Soporte01 FOR LOGIN Soporte01 WITH DEFAULT_SCHEMA = swe
GO
--//-- ------------------------------------------------------- --//--



--//-- ------------------------------------------------------- --//--
--se le asignan los diferentes permisos al usuario
--//-- ------------------------------------------------------- --//--
USE [SYSWEB_ACT]
GO
GRANT EXECUTE ON DATABASE :: [SYSWEB_ACT] TO Soporte01
GO
GRANT BACKUP DATABASE TO Soporte01
GO
GRANT SELECT ON DATABASE :: [SYSWEB_ACT] TO Soporte01
GO
GRANT UPDATE ON DATABASE :: [SYSWEB_ACT] TO Soporte01
GO
GRANT DELETE ON DATABASE :: [SYSWEB_ACT] TO Soporte01
GO
GRANT CREATE TABLE ON DATABASE :: [SYSWEB_ACT] TO Soporte01
GO
GRANT CONTROL ON SCHEMA :: [swe] TO Soporte01
GO
GRANT CREATE FUNCTION ON DATABASE :: [SYSWEB_ACT] TO Soporte01
GO
GRANT CREATE PROCEDURE ON DATABASE :: [SYSWEB_ACT] TO Soporte01
GO 
--Esta opción no otorga todos los permisos posibles. 
--La concesión de ALL es equivalente a la concesión de los permisos siguientes: 
--Base de datos BACKUP, BACKUP LOG, CREAR BASE DE DATOS, CREATE DEFAULT, CREATE FUNCTION, 
--CREATE PROCEDURE, CREATE RULE, CREATE TABLE y CREATE VIEW.
GRANT ALL ON DATABASE :: [SYSWEB_ACT] to Soporte01
GO
--//-- ------------------------------------------------------- --//--
--//-- --------------------
--//-- ------------------------------------------------------- --//--
USE [SYSWEB_ADM]
GO
GRANT EXECUTE ON DATABASE :: [SYSWEB_ADM] TO Soporte01
GO
GRANT BACKUP DATABASE TO Soporte01
GO
GRANT SELECT ON DATABASE :: [SYSWEB_ADM] TO Soporte01
GO
GRANT UPDATE ON DATABASE :: [SYSWEB_ADM] TO Soporte01
GO
GRANT DELETE ON DATABASE :: [SYSWEB_ADM] TO Soporte01
GO
GRANT CREATE TABLE ON DATABASE :: [SYSWEB_ADM] TO Soporte01
GO
GRANT CREATE FUNCTION ON DATABASE :: [SYSWEB_ADM] TO Soporte01
GO
GRANT CREATE PROCEDURE ON DATABASE :: [SYSWEB_ADM] TO Soporte01
GO 
--Esta opción no otorga todos los permisos posibles. 
--La concesión de ALL es equivalente a la concesión de los permisos siguientes: 
--Base de datos BACKUP, BACKUP LOG, CREAR BASE DE DATOS, CREATE DEFAULT, CREATE FUNCTION, 
--CREATE PROCEDURE, CREATE RULE, CREATE TABLE y CREATE VIEW.
GRANT ALL ON DATABASE :: [SYSWEB_ADM] to Soporte01
GO
--//-- ------------------------------------------------------- --//--
--//-- --------------------
--//-- ------------------------------------------------------- --//--
USE [SYSWEB_BIT]
GO
GRANT EXECUTE ON DATABASE :: [SYSWEB_BIT] TO Soporte01
GO
GRANT BACKUP DATABASE TO Soporte01
GO
GRANT SELECT ON DATABASE :: [SYSWEB_BIT] TO Soporte01
GO
GRANT UPDATE ON DATABASE :: [SYSWEB_BIT] TO Soporte01
GO
GRANT DELETE ON DATABASE :: [SYSWEB_BIT] TO Soporte01
GO
GRANT CREATE TABLE ON DATABASE :: [SYSWEB_BIT] TO Soporte01
GO
GRANT CREATE FUNCTION ON DATABASE :: [SYSWEB_BIT] TO Soporte01
GO
GRANT CREATE PROCEDURE ON DATABASE :: [SYSWEB_BIT] TO Soporte01
GO 
--Esta opción no otorga todos los permisos posibles. 
--La concesión de ALL es equivalente a la concesión de los permisos siguientes: 
--Base de datos BACKUP, BACKUP LOG, CREAR BASE DE DATOS, CREATE DEFAULT, CREATE FUNCTION, 
--CREATE PROCEDURE, CREATE RULE, CREATE TABLE y CREATE VIEW.
GRANT ALL ON DATABASE :: [SYSWEB_BIT] to Soporte01
GO
--//-- ------------------------------------------------------- --//--