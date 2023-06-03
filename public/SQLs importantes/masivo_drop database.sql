USE master
IF EXISTS(select * from sys.databases where name='SYSWEB_ACT')
DROP DATABASE SYSWEB_ACT

IF EXISTS(select * from sys.databases where name='SYSWEB_ADM')
DROP DATABASE SYSWEB_ADM

IF EXISTS(select * from sys.databases where name='SYSWEB_INT')
DROP DATABASE SYSWEB_INT

IF EXISTS(select * from sys.databases where name='SYSWEB_BIT')
DROP DATABASE SYSWEB_BIT