------------------------------------------------------------------------------------------------------------------------------
--NOTA IMPORTANTE: El script debe ejecutarse de FORMA COMPLETA y no po bloques debido a que utiliza un cursor y variables.
------------------------------------------------------------------------------------------------------------------------------
	
	DECLARE @_BD VARCHAR(25)			--BASE DE DATOS
	DECLARE @_COUNTBD INT
	DECLARE @_COUNTERROR INT
	DECLARE @_FECHA VARCHAR(12)
	
	
	SELECT @_FECHA=CONVERT(VARCHAR(10),GETDATE(),105)

	SET NOCOUNT ON
	
	SET @_COUNTBD = 0
	SET @_COUNTERROR = 0
	
	--CARGA EN EL CURSOR LA LISTA DE BASES DE DATOS REGISTRADAS
	DECLARE TMPCURSOR01 CURSOR FOR 
	select emp_base BDS from sysweb.dbo.GEMPRESAS where emp_nombre like '%ids%'

		--SELECT     NAME AS BDS
		--FROM         sys.databases SD
		--WHERE (NAME <> 'master') 
		--and (NAME <> 'model') 
		--and (NAME <> 'msdb') 
		--and (NAME <> 'tempdb')
		--and (NAME <> 'ReportServer$SYSWEB')
		--and (NAME <> 'ReportServer$SYSWEBTempDB')
		--and NAME not like '% %'


		


		
		

	OPEN TMPCURSOR01
	 
		FETCH NEXT FROM TMPCURSOR01 INTO @_BD

		WHILE @@FETCH_STATUS = 0 
		BEGIN			--BEGIN WHILE
			--POR CADA BASE DE DATOS EN EL CURSOR EJECUTA EL UPDATE
			BEGIN TRY
				
				PRINT '----> RESPALDANDO BASE DE DATOS '+@_BD 
				PRINT ''
				EXEC('BACKUP DATABASE '+@_BD+' TO  DISK = N''C:\respaldos\'+@_BD +' '+@_FECHA+'.bak'' WITH NOFORMAT, NOINIT,  NAME = N'''+@_BD+'-Full Database Backup'', SKIP, NOREWIND, NOUNLOAD,  STATS = 10')										

				

				PRINT ''
				PRINT '----> '+@_BD +' RESPALDADA'
				PRINT '------------------------------------------------------------------------------------------------'
				SET @_COUNTBD = @_COUNTBD +1
			END TRY
			BEGIN CATCH
				PRINT ''
				PRINT '----> ERROR EN ' +@_BD
				PRINT 'DETALLE : ' + ERROR_MESSAGE()
				SET @_COUNTERROR = @_COUNTERROR + 1
				
			END CATCH

			FETCH NEXT FROM TMPCURSOR01 INTO @_BD
		END				--END WHILE
			
	CLOSE TMPCURSOR01
	DEALLOCATE TMPCURSOR01

	PRINT ''
	PRINT '--------------------------------------------------	RESULTADOS	--------------------------------------------------'
	PRINT '----> CANTIDAD DE RESPALDOS REALIZADOS: ' + CONVERT(VARCHAR(5),@_COUNTBD)
	PRINT ''
	PRINT '----> CANTIDAD DE ERRORES: ' + CONVERT(VARCHAR(5),@_COUNTERROR)
	
	
	
