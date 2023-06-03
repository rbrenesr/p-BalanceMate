USE [master]
GO
ALTER DATABASE [SYSWEB_INT] COLLATE SQL_Latin1_General_CP1_CI_AS
GO


SELECT name, collation_name
FROM sys.databases

DBCC CHECKDB WITH DATA_PURITY



SELECT sysobjects.name AS TABLA, CASE WHEN sysindexkeys.keyno IS NULL THEN '' ELSE 'PK' END AS 'PRIMARY', syscolumns.collation,
'ALTER TABLE ' + sysobjects.name + ' ' +
'ALTER COLUMN ' + syscolumns.name + ' ' +
systypes.name + '(' + cast(syscolumns.length as varchar) + ') ' +
'COLLATE SQL_Latin1_General_CP1_CI_AS ' +
case when syscolumns.isnullable = 1 then 'NULL;' else 'NOT NULL;' end as SQL
from syscolumns
inner join sysobjects
        on sysobjects.id = syscolumns.id
inner join systypes
        on systypes.xtype = syscolumns.xtype
inner join INFORMATION_SCHEMA.TABLES 
		on INFORMATION_SCHEMA.TABLES.TABLE_NAME = sysobjects.name
left join  sysindexkeys 
		on sysindexkeys.id = syscolumns.id AND sysindexkeys.colid = syscolumns.colid 
where syscolumns.collation is not null
and INFORMATION_SCHEMA.TABLES.TABLE_CATALOG='SYSWEB_INT' AND INFORMATION_SCHEMA.TABLES.TABLE_TYPE='BASE TABLE'
ORDER BY sysobjects.name, syscolumns.colorder

--Copiar la columna SQL y ejecutar


