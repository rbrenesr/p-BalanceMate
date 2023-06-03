


declare @fecha char(12)
declare @path varchar(100)
declare @name varchar(20)


set @fecha = convert(char(8),getdate(),112) + replace(convert(char(5),getdate(),108),':','')
set @path = 'C:\sysweb_act'+@fecha+'.bak'
set @name = 'sysweb_act'+@fecha


BACKUP DATABASE sysweb_act
TO DISK = @path
WITH NO_COMPRESSION, NAME=@name