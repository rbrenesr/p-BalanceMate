

--consulta todas las bases de datos que tienen el atributo auto_close activo
--el objetivo es que este atributo no este activo, para que las bases de datos esten siempre disponibles		
SELECT * FROM sys.databases WHERE DATABASEPROPERTYEX(name, 'IsAutoClose') = 1

--actualiza atributo auto_close activo a 0 (apagado)
SELECT top 100
'ALTER DATABASE ' + name +' SET AUTO_CLOSE OFF'
FROM sys.databases WHERE DATABASEPROPERTYEX(name, 'IsAutoClose') = 1

