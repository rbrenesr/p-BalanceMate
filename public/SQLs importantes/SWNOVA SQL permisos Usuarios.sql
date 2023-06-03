USE master
exec sp_addlogin swusrap,'Sw123'
exec sp_addlogin swusrbk,'Sw123'
exec sp_addlogin swusrcs,'Sw123'
exec sp_addlogin smusrap,'Sm123'
GO

USE master
CREATE USER swusrap FOR LOGIN swusrap
CREATE USER swusrbk FOR LOGIN swusrbk
CREATE USER swusrcs FOR LOGIN swusrcs
CREATE USER smusrap FOR LOGIN smusrap
GO


------------------------------------------------------------------------------
-- UTILIZADO PARA CREAR EL ESQUEMA sme EN LAS DIFERENTES BASES DE DATOS
-- ESTABLECE COMO DUEÑO DEL ESQUEMA sme EL USUARIO DE APLICACION
------------------------------------------- -----------------------------------
USE SYSWEB_INT
GO
CREATE SCHEMA swe
GO
CREATE USER swusrap FOR LOGIN smusrap WITH DEFAULT_SCHEMA = swe
GO