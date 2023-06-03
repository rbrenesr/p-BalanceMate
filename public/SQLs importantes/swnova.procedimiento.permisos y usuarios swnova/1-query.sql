--Script 1: 
--Volver a crear el usuario en caso de restaurar una base de datos

--1------------------------------------------------
--//-- EJECUTAR EL SCRIPT EN LAS DIFERENTES BASES 
--//-- DEPENDIENDO DE CUAL BD FUE RESTAURADA
---------------------------------------------------
--USE SYSWEB_ACT
--use SYSWEB_ADM
--use SYSWEB_BIT
--use SYSWEB_INT
--use SYSWEB_SIN
GO

--//-- ------------------------------------------------------- --//--
--//--    CREAR USUARIO DE APLICACION PARA LA BASE DE DATOS    --//--
--//-- ------------------------------------------------------- --//--
--pasa momentáneamente el esquema a dbo
ALTER AUTHORIZATION ON SCHEMA::swe TO dbo

--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrap')
    DROP USER swusrap
GO
CREATE USER swusrap FOR LOGIN swusrap WITH DEFAULT_SCHEMA = swe
GO
--asigna el esquema nuevamente al usuario
ALTER AUTHORIZATION ON SCHEMA::swe TO swusrap
GO
--//-- ------------------------------------------------------- --//--
--//--     CREAR USUARIO DE CONSULTA PARA LA BASE DE DATOS     --//--
--//-- ------------------------------------------------------- --//--
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (SELECT * FROM SYS.sysusers WHERE NAME = 'swusrcs')
	DROP USER swusrcs
GO
CREATE USER swusrcs FOR LOGIN swusrcs WITH DEFAULT_SCHEMA = swe
GO
--//-- ------------------------------------------------------- --//--
--//--      CREAR USUARIO DE BACKUP PARA LA BASE DE DATOS      --//--
--//-- ------------------------------------------------------- --//--
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (SELECT * FROM SYS.sysusers WHERE NAME = 'swusrbk')
	DROP USER swusrbk 
GO
CREATE USER swusrbk FOR LOGIN swusrbk WITH DEFAULT_SCHEMA = swe
GO
--//-- ------------------------------------------------------- --//--

--//-- ------------------------------------------------------- --//--
--//--      CREAR USUARIO DE REPORETES PARA LA BASE DE DATOS      --//--
--//-- ------------------------------------------------------- --//--
--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (SELECT * FROM SYS.sysusers WHERE NAME = 'swusrrp')
	DROP USER swusrrp
GO
CREATE USER swusrrp FOR LOGIN swusrrp WITH DEFAULT_SCHEMA = swe
GO
--//-- ------------------------------------------------------- --//--


--si existe el usuario en la bd lo elimina y vuelve a crear
IF EXISTS (select * from sys.sysusers s where name = 'swusrsin')
    DROP USER swusrsin
GO
CREATE USER swusrsin FOR LOGIN swusrsin WITH DEFAULT_SCHEMA = swe
GO
--asigna el esquema nuevamente al usuario
ALTER AUTHORIZATION ON SCHEMA::swe TO swusrsin
GO