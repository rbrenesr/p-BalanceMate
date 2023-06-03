USE [SYSWEB_ACT]
GO

--------------------------------------------------------------------------
--//-- EJECUTA LA LIQUIDACION MASIVA DE PEDIDOS

    --//-- Parámetros de entrada --//--
    DECLARE 
         @entEMPIntCodigo   INT          = xxx
        ,@entSUCChrCodigo   VARCHAR(5)   = '%'
        ,@entTTPChrCodigo   VARCHAR(25)  = '%'
        ,@entUSUIntCodigo   INT          = 1
        ,@entTRAFecFechaFin DATETIME     = GETDATE()
        ,@entKEYChrEncripta VARCHAR(25)  = 'KIDFAROCADENJK'
        ,@salEstatusProc    BIT          = 0
        ,@salMensajeProc    VARCHAR(150) = ''
    
    EXEC [swe].[pr_InsCOM_TRANSAC_PED_LIQUIDACION_MASIVA]
         @entEMPIntCodigo       
        ,@entSUCChrCodigo   
        ,@entTTPChrCodigo       
        ,@entUSUIntCodigo       
        ,@entTRAFecFechaFin     
        ,@entKEYChrEncripta     
        ,@salEstatusProc        OUTPUT
        ,@salMensajeProc        OUTPUT

    SELECT 
        @salEstatusProc AS '@salEstatusProc', 
        @salMensajeProc AS '@salMensajeProc'
--------------------------------------------------------------------------
--------------------------------------------------------------------------    
        