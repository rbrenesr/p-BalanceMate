--// PASA UNA TRANSACCION DE TOMA FISICA DE APROBADO A ESTADO APLICADO, 
--   GENERANDO MOVIMIENTO INVENTARIO Y ASIENTO CONTABLE	
USE [SYSWEB_ACT]
GO


--// ----------------------------------------------------------------------------------------------
--//DECLARACION DE PARAMETROS DE ENTRADA PARA EJECUCION EN LOS PROCEDIMIENTOS
DECLARE @p_entEMPIntCodigo   INT          = 0                   --Código de empresa
DECLARE @p_entTRAChrNumero   VARCHAR(25)  = ''					--Número de transacción

DECLARE @p_entTCLChrCodigo   VARCHAR(25)  = 'INVTFI'            --Clasificación de transacción
DECLARE @p_entTRAFecFechaPrc DATETIME     = GETDATE()           --Fecha de Proceso
DECLARE @p_entcodUsuario     INT          =	1					--Usuario 
DECLARE @p_adminKey          VARCHAR(50)  = 'KIDFAROCADENJK' 
DECLARE @p_entTRABndActEYS	 BIT =  0 
--//DECLARACION DE PARAMETROS DE SALIDA
DECLARE @p_salASEChrNumero   VARCHAR(25)  = ''
DECLARE @p_salEstatusProc    BIT          = 0
DECLARE @p_salMensajeProc    VARCHAR(500) = ''
--// ----------------------------------------------------------------------------------------------

--// ----------------------------------------------------------------------------------------------
--// [1]- Actualizar la fecha de proceso de la transacción
	EXECUTE [swe].pr_UpdCOM_TRANSACINV_ENC_PRC
		@p_entEMPIntCodigo,
		@p_entTRAChrNumero,
		@p_entTRAFecFechaPrc,
		@p_entcodUsuario,
		@p_adminKey,
		@p_salEstatusProc OUTPUT,
		@p_salMensajeProc OUTPUT;

    SELECT @p_salEstatusProc AS '@p_salEstatusProc', @p_salMensajeProc AS '@p_salMensajeProc'
--// ----------------------------------------------------------------------------------------------

--// ----------------------------------------------------------------------------------------------
--// [2]- Insertar Movimiento de inventario de la transacción
	EXECUTE [swe].pr_InsCOM_MOVIMIENTO_INV
		@p_entEMPIntCodigo,
		@p_entTRAChrNumero,
		@p_entTCLChrCodigo,
		@p_entcodUsuario,
		@p_entTRABndActEYS,
		@p_salEstatusProc OUTPUT,
		@p_salMensajeProc OUTPUT;

    SELECT @p_salEstatusProc AS '@p_salEstatusProc', @p_salMensajeProc AS '@p_salMensajeProc'
--// ----------------------------------------------------------------------------------------------				

--// ----------------------------------------------------------------------------------------------
--// [3]- Insertar Asiento contable de la transacción             
	EXECUTE [swe].pr_InsCOM_TRANSAC_ASIENTO
			@p_entEMPIntCodigo,
			@p_entTRAChrNumero,
			@p_adminKey,
			@p_salASEChrNumero OUTPUT,
			@p_salEstatusProc  OUTPUT,
			@p_salMensajeProc  OUTPUT;

    SELECT @p_salEstatusProc AS '@p_salEstatusProc', @p_salMensajeProc AS '@p_salMensajeProc', @p_salASEChrNumero AS '@p_salASEChrNumero'
--// ----------------------------------------------------------------------------------------------

--// ----------------------------------------------------------------------------------------------
--// [4]- Actualiza el costo promedio de los items asociados a la transacción
	EXECUTE [swe].pr_UpdCOM_INVENTARIO_CostoPromedio
		@p_entEMPIntCodigo,
		@p_entTRAChrNumero,
		@p_salEstatusProc  OUTPUT,
		@p_salMensajeProc  OUTPUT;

    SELECT @p_salEstatusProc AS '@p_salEstatusProc', @p_salMensajeProc AS '@p_salMensajeProc'
--// ----------------------------------------------------------------------------------------------
		
--// ----------------------------------------------------------------------------------------------
--// [5]- Actualizar el estado de la transacción a aplicado
	EXECUTE [swe].pr_UpdCOM_TRANSACINV_ENC_EST
		@p_entEMPIntCodigo,
		@p_entTRAChrNumero,
		'700-APL',
		'Cambio de Estado, transacción aplicada',
		@p_entcodUsuario,
		@p_salEstatusProc OUTPUT,
		@p_salMensajeProc OUTPUT;

    SELECT @p_salEstatusProc AS '@p_salEstatusProc', @p_salMensajeProc AS '@p_salMensajeProc'
--// ----------------------------------------------------------------------------------------------
	