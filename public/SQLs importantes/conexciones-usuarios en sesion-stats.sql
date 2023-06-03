SELECT db_name(dbid) as DatabaseName, count(dbid) as NoOfConnections,
loginame as LoginName
FROM sys.sysprocesses
WHERE dbid > 0
GROUP BY dbid, loginame


select COUNT(*) as usuarios from swe.SWTADM_SESCONTROL



exec sp_who2
--DBCC INPUTBUFFER(67)
--KILL 67


select * from sys.dm_exec_query_stats
select * from sys.dm_exec_query_stats order by creation_time desc
select * from sys.dm_exec_query_stats order by total_worker_time desc
select * from sys.dm_exec_query_plan(0x05000500243FCB0340A16F84000000000000000000000000)
select * from sys.dm_exec_procedure_stats order by total_worker_time desc