USE SYSWEB_ACT
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'pr_DelEMP_EMPRESA_TOTAL')		
	DROP PROCEDURE [swe].[pr_DelEMP_EMPRESA_TOTAL]
GO

-- ================================================================================
-- procedimiento:	pr_DelEMP_EMPRESA_TOTAL								ELIMINAR
-- Autor:			Antonio Garita
-- Fecha:			2015-01-23
-- Descripcion:		Elimina registros en las Tablas que correspondan al código de
--					empresa, enviado por parámetro.
-- Recibe:			Codigo de empresa a eliminar
-- Retorna:			True si se elimino el registro y False si no se elimino.
-- ================================================================================
CREATE PROCEDURE [swe].[pr_DelEMP_EMPRESA_TOTAL](
	@entEMPIntCodigo	INT						,
	@entUSUIntCodigo	INT						,
	@entKEYChrEncripta	VARCHAR(25)				,
	@salEMPChrNombre	VARCHAR(250)	OUTPUT	,
	@salEstatusProc		BIT				OUTPUT	,
	@salMensajeProc		VARCHAR(150)	OUTPUT
) AS BEGIN

	--//-- ---------------------------  SETEO DE VARIABLES DE SALIDA -------------------------- --//--
		SET NOCOUNT ON
		
		SELECT @salEMPChrNombre = '', @salEstatusProc = 0, @salMensajeProc = ''
	--//-- ------------------------------------------------------------------------------------	--//--
	

	--//-- --------------------------- DECLARACION DE VARIABLES INTERNAS ---------------------- --//--

		--CREA LA TABLA QUE ALMACENA LAS TABLAS Y SUS TABLAS HIJAS
		DECLARE @varTBLJerarquia TABLE(
			TABLA_MADRE VARCHAR(150),
			TABLA_HIJA  VARCHAR(150)	
		)
		--CREA TABLA QUE ALMACENA LOS NOMBRES DE TABLAS Y SU NIVEL DE JERARQUIA
		DECLARE @varTBLJerarquiaNIVEL TABLE(
			TABLA_MADRE VARCHAR(150),
			TABLA_NIVEL INT	
		)
		
		DECLARE @varDatosBit	VARCHAR(MAX)
		DECLARE @varCadenaSQL	VARCHAR(MAX)
		DECLARE @varTBLNombre	VARCHAR(150)
		DECLARE @varTBLNivel	INT
		DECLARE @varNumLinea	INT
	--//-- ------------------------------------------------------------------------------------	--//--	


	--//-- -------------------------- SETEO DE VARIABLES INTERNAS ----------------------------- --//--
		
		SELECT 
			@salEMPChrNombre = EMP_ChrNombre,	--SELECCIONA EL NOMBRE DE LA EMPRESA
			@varDatosBit=
				'CGE_IntCodigo='+		CONVERT(VARCHAR,CGE_IntCodigo)	+'~'+
				'EMP_IntCodigo='+		CONVERT(VARCHAR,EMP_IntCodigo)	+'~'+
				'EMP_ChrNombre='+		EMP_ChrNombre					+'~'+	
				'EMP_ChrCedula='+		EMP_ChrCedula					+'~'+
				'TCE_ChrCodigo='+		TCE_ChrCodigo					+'~'+	
				'DIR_ChrDireccionCod='+ DIR_ChrDireccionCod				+'~'+	
				'EMP_ChrDireccionDet='+ EMP_ChrDireccionDet				+'~'+
				'EMP_ChrPaginaWeb='+	EMP_ChrPaginaWeb				 
		FROM SYSWEB_ACT.swe.SWTEMP_EMPRESA 
		WHERE EMP_IntCodigo = @entEMPIntCodigo

		--ALMACENA LAS TABLAS Y SUS TABLAS HIJAS
		INSERT INTO @varTBLJerarquia
		SELECT 
			 TX.TABLA_MADRE, TX.TABLA_HIJA
		FROM (
			SELECT 
				T.TABLE_NAME AS 'TABLA_MADRE', TH1.[TABLA_HIJA]
			FROM 
				INFORMATION_SCHEMA.TABLES T
				LEFT JOIN (
					--SELECCIONA LAS LLAVES FORANEAS DE LAS TABLAS HIJAS
					select 
						 TCR.TABLE_NAME		AS 'TABLA_MADRE'
						,TC.Table_name		AS 'TABLA_HIJA'
					from 
						INFORMATION_SCHEMA.TABLE_CONSTRAINTS TC 
						inner join INFORMATION_SCHEMA.TABLES T on TC.TABLE_NAME = T.TABLE_NAME and T.TABLE_SCHEMA = 'swe'
						inner join INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC on TC.Constraint_Name = RC.Constraint_Name 
						inner join INFORMATION_SCHEMA.TABLE_CONSTRAINTS TCR on RC.Unique_Constraint_Name = TCR.Constraint_Name 
					where TC.CONSTRAINT_TYPE='FOREIGN KEY'
				) TH1 ON T.TABLE_NAME = TH1.TABLA_MADRE 
			WHERE T.TABLE_SCHEMA = 'swe' and T.table_name not like 'SWV%'
		) AS TX;

		--GENERA LA BUSQUEDA RECURSIVA DONDE UNA TABLA HIJA ESTA COMO TABLA MADRE
		WITH Jerarquia (TABLA_MADRE, TABLA_HIJA, Nivel)
		AS (
			--inicializacion
			SELECT TABLA_MADRE, TABLA_HIJA, 0 as Nivel
			FROM @varTBLJerarquia
			WHERE TABLA_HIJA IS NULL
			UNION ALL
			--la ejecucion recursiva
			SELECT e.TABLA_MADRE, e.TABLA_HIJA, j.Nivel+1 as Nivel
			FROM @varTBLJerarquia e 
				INNER JOIN Jerarquia j
					ON e.TABLA_HIJA = j.TABLA_MADRE
		)

		--INGRESA LOS NOMBRES DE TABLAS Y SU NIVEL JERARQUIA, A LA TABLA TEMPORAL [@varTBLJerarquiaNIVEL],
		--DE AQUELLAS TABLAS QUE POSEAN LA COLUMNA [EMP_IntCodigo]
		INSERT INTO @varTBLJerarquiaNIVEL
		SELECT JX.TABLA_MADRE, MAX(JX.Nivel) AS TABLA_NIVEL
		FROM Jerarquia JX
			INNER JOIN INFORMATION_SCHEMA.COLUMNS COL
			ON COL.TABLE_NAME = JX.TABLA_MADRE
				AND COL.TABLE_SCHEMA = 'swe' 
				AND COL.COLUMN_NAME = 'EMP_IntCodigo'
		GROUP BY JX.TABLA_MADRE
	--//-- ------------------------------------------------------------------------------------	--//--

	--//-- ------------------------------------------------------------------------------------ --//--
	--SELECT 
	--	JX.TABLA_MADRE, JX.TABLA_NIVEL, 
	--	ROW_NUMBER() OVER( ORDER BY TABLA_NIVEL, JX.TABLA_MADRE) AS NUM_LINEA
	--FROM @varTBLJerarquiaNIVEL JX
	--//-- ------------------------------------------------------------------------------------ --//--
	
	--//-- ------------------------------- VALIDACION DE DATOS -------------------------------- --//--
		IF (@salEMPChrNombre = '') BEGIN
			SELECT @salMensajeProc = 'El codigo de empresa no existe'
			RETURN
		END
	--//-- ------------------------------------------------------------------------------------	--//--


	--//-- ------------------------------------------------------------------------------------ --//--
	BEGIN TRY

		BEGIN TRANSACTION
			
			DECLARE Dyn_cursor CURSOR FOR 
				SELECT JX.TABLA_MADRE, JX.TABLA_NIVEL, 
					ROW_NUMBER() OVER( ORDER BY TABLA_NIVEL, JX.TABLA_MADRE) AS NUM_LINEA
				FROM @varTBLJerarquiaNIVEL JX
			
			Open Dyn_Cursor
		
				-- RECORRIDO DEL CURSOR
				FETCH NEXT FROM Dyn_Cursor INTO @varTBLNombre, @varTBLNivel, @varNumLinea
				WHILE @@FETCH_STATUS = 0 BEGIN
				
					SET @varCadenaSQL = '
						DELETE FROM [SYSWEB_ACT].[swe].['+ @varTBLNombre +'] 
						WHERE EMP_IntCodigo =	'+ CONVERT(VARCHAR(10),@entEMPIntCodigo) + ''
					
					--//-- ------------------------------------------------------------------------- --//--
					--SET @varCadenaSQL = '
					--	SELECT 
					--		'''+ @varTBLNombre +''' AS TABLA, 
					--		'''+ CONVERT(VARCHAR(10),@varTBLNivel) +''' AS NIVEL, COUNT(*) AS REGISTROS 
					--	FROM [SYSWEB_ACT].[swe].['+ @varTBLNombre +'] 
					--	WHERE EMP_IntCodigo =	'+ CONVERT(VARCHAR(10),@entEMPIntCodigo) + ''
					--//-- ------------------------------------------------------------------------- --//--
					
					Exec(@varCadenaSQL)
				
					FETCH NEXT FROM Dyn_Cursor INTO @varTBLNombre, @varTBLNivel, @varNumLinea
				
				END -- FIN WHILE
	 
			Close Dyn_cursor
			Deallocate Dyn_cursor
		
			SET @salEstatusProc = 1
			
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH
		
		--//--	SEGMENTO PARA LA RECUPERACION DE LOS DETALLES DE ERROR	--//--
		DECLARE @ERROR VARCHAR(620)	SET @ERROR = (SELECT ERROR_MESSAGE())
		DECLARE @STATE INT			SET @STATE = (SELECT ERROR_STATE())
		DECLARE @SEVERITY INT		SET @SEVERITY = (SELECT ERROR_SEVERITY())
		DECLARE @LINE INT			SET @LINE = (SELECT ERROR_LINE())
		
		SET @salEstatusProc = 0
		
		--//-- CIERRA EL CURSOR EN CASO DE QUE ESTE ABIERTO --//--
		IF ((SELECT CURSOR_STATUS('global','Dyn_Cursor')) > 0) BEGIN
			IF ((SELECT CURSOR_STATUS('global','Dyn_Cursor')) = -1) BEGIN
				Close Dyn_cursor
			END
			DEALLOCATE Dyn_Cursor
		END
		
		ROLLBACK TRANSACTION
		
		--//--	SEGMENTO PARA REALIZAR EL PROCESO DE REGISTRO DE ERROR EN LA BITACORA	--//--
		SET @varDatosBit =
			'MENSAJE ERROR='+@ERROR+'~'+
			'ESTADO='+CONVERT(VARCHAR,@STATE)+'~'+
			'GRAVEDAD='+CONVERT(VARCHAR,@SEVERITY)+'~'+
			'LINEA='+CONVERT(VARCHAR,@LINE)
			
		EXEC SYSWEB_ACT.swe.pr_BitInsEMP_PROCESO 0, 4, @entUSUIntCodigo, 'SWTEMP_EMPRESA', @varDatosBit, @entKEYChrEncripta
		
		--//--	ENVIO DE ERROR A LA APLICACION		--//--
		RAISERROR(@ERROR,@SEVERITY,@STATE)

	END CATCH
	--//-- ------------------------------------------------------------------------------------	--//-
	
END
GO


