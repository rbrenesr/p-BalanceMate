USE [SYSWEB_ACT]
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'pr_InsCOM_TRANSAC_PED_LIQUIDACION')        
    DROP PROCEDURE [swe].[pr_InsCOM_TRANSAC_PED_LIQUIDACION]
GO

-- ===================================================================================================
-- Procedimiento:    pr_InsCOM_TRANSAC_PED_LIQUIDACION                                        INSERTAR
-- Autor:            Antonio Garita
-- Fecha:            2015-11-10
-- Descripción:      Generar un traslado de bodega de forma automática, que permita liquidar los ítems
--                   pendientes de una transacción pedido de cliente; retornando a la bodega origen,
--                   los productos, accesorios y series ingresados en el pedido.
--
--                    Ingresar registros en la Tablas:
--                    SWTCOM_TRANSACCION_ENC 
--                        SWTCOM_TRANSAC_DETMOT / SWTCOM_TRANSAC_DETCTA / SWTCOM_TRANSAC_DETEST
--                        SWTCOM_TRANSAC_DETINV / SWTCOM_TRANSAC_DETINV_SER / SWTCOM_TRANSAC_DETINV_ACC
--                        SWTCOM_MOVIMIENTO_INV / SWTCOM_MOVIMIENTO_INVSER
--                    SWTCON_ASIENTO_ENC 
--                        SWTCON_ASIENTO_DET / SWTCON_ASIENTO_ENC_X_EST
--                        
-- Retorna:         True si se ingreso el registro y False si no se ingreso.
-- ===================================================================================================
CREATE PROCEDURE [swe].[pr_InsCOM_TRANSAC_PED_LIQUIDACION](
     @entEMPIntCodigo       INT                    --Código de empresa    
    ,@entTRAChrNumeroPed    VARCHAR(25)            --Número de pedido a liquidar
    ,@entUSUIntCodigo       INT                    --Usuario quien genera la transacción
    ,@entKEYChrEncripta     VARCHAR(25)            --Llave de encripción
    ,@salTRAChrNumero       VARCHAR(25)  OUTPUT    --Número de transacción generado
    ,@salASEChrNumero       VARCHAR(25)  OUTPUT    --Número de asiento generado
    ,@salEstatusProc        BIT          OUTPUT    --Estado de la transacción
    ,@salMensajeProc        VARCHAR(150) OUTPUT    --Mensaje
) AS BEGIN

    SET NOCOUNT ON

    --//Declaración de variables e inicialización
    DECLARE 
        --// Datos generales
         @varDatosBit                        VARCHAR(MAX)       --Almacena datos para bitácora
        ,@varGEN_BitContabxBod               BIT                --Bandera que establece si la contabilización es por bodega
        ,@varGEN_DetalleItems                XML                --Detalle de ítems del pedido en XML para traer detalle de ctas
        ,@varGEN_IntDINVConsecMIN            INT                --Mínimo de los consecutivos en el detalle de la transacción pedido a liquidar
        ,@varGEN_IntDINVConsecMAX            INT                --Máximo de los consecutivos en el detalle de la transacción pedido a liquidar
        ,@varGEN_IntDINVConsecACT            INT                --Controla el consecutivo actual del detalle de ítems del pedido a liquidar
        ,@varGEN_IntCantItems                INT                --Establece la catidad de ítems que se deben liquidar en el pedido
        --// TRansacción
        ,@varTRB_TRAChrNumero                VARCHAR(25)        --Número de transaccion a generar
        ,@varTRB_TRAIntCorrel                INT                --Numero de correlativo del tipo de transacción    
        ,@varTRB_MOTIntCodigo                INT                --Motivo a utilizar en la transaccion
        ,@varTRB_TTPChrCodigo                VARCHAR(50)        --Tipo Transaccion traslado de bodega
        ,@varTRB_TCLChrCodigo                VARCHAR(25)        --Clasificación de transacción traslado de bodega
        ,@varTRB_TDCChrCodigo                VARCHAR(25)        --Tipo de documento del traslado de bodega
        ,@varTRB_ESTChrCodigo                VARCHAR(10)        --Estado de la transacción
        ,@varTRB_NoGenAsiento                BIT                --Establece si genera o no asiento
        ,@varTRB_SUCIntCodigo                INT                --Sucursal del traslado de bodega
        ,@varTRB_FecFechaPrc                 DATETIME           --Fecha para el traslado de bodega
        ,@varTRB_MNDIntCodigo                INT                --Moneda del traslado de bodega
        ,@varTRB_TRAMonTasaMon               DECIMAL(25,6)      --Tasa del traslado de bodega
        ,@varTRB_TRAChrTasaTip               VARCHAR(1)         --Tipo de tasa para el traslado de bodega
        ,@varTRB_BODChrCodigo                VARCHAR(5)         --Bodega original de reserva
        ,@varTRB_TRAMonTotalNeto             DECIMAL(25,6)      --Total de la transacción traslado de bodega
        --//Asiento
        ,@varASI_ASEChrNumero                VARCHAR(25)        --Número de asiento a generar
        --//Detalle de invantario
        ,@varDTRB_DINVIntConsecutivo        INT                 --Número / Consecutivo de linea de la transacción
        ,@varDTRB_INVIntCodigo              INT                 --Referencia al código de inventario
        ,@varDTRB_DINVChrNombre             VARCHAR(250)        --Nombre del item para la transacción 
        ,@varDTRB_BODChrCodigo              VARCHAR(5)          --Código de bodega referente a la linea de la transacción
        ,@varDTRB_LOTIntCodigo              INT                 --Referencia al código de lote de la linea de la transacción
        ,@varDTRB_DINVChrPropiedad          VARCHAR(250)        --Almacena la propiedades del artículo al momento de guardar la transacción
        ,@varDTRB_UNDChrCodigo              VARCHAR(5)          --Referencia al código de unidad utilizado en la transacción
        ,@varDTRB_IXUMonFactor              DECIMAL(25,6)       --Factor multiplicativo para calcular la unidad principal
        ,@varDTRB_DINVMonCantIngresada      DECIMAL(25,6)       --Cantidad, según unidad de producto utilizada en la transacción
        ,@varDTRB_DINVMonCantRegistrada     DECIMAL(25,6)       --Cantidad, según unidad de producto registrada para transacciones de entradas y salidas
        ,@varDTRB_DINVMonCostUnitario       DECIMAL(25,6)       --Valor del costo unitario del ítem en la linea de detalle de la transacción, en la unidad del item
        ,@varDTRB_DINVMonTotalNeto          DECIMAL(25,6)       --Moto total de la línea aplicando el impuesto    
        ,@varDTRB_TRAChrDatosSER            VARCHAR(MAX)        --Detalle para números de serie de la línea de detalle de la transacción
        ,@varDTRB_EstatusProc               BIT                 --Estado del detalle de la transacción
        ,@varDTRB_MensajeProc               VARCHAR(150)        --Mensaje
    
    
    SELECT
        --// Datos generales
         @salEstatusProc            = 0
        ,@salMensajeProc            = ''
        ,@varDatosBit               = ''
        ,@salTRAChrNumero           = ''
        ,@salASEChrNumero           = ''
        ,@varGEN_BitContabxBod      = 0
        ,@varGEN_DetalleItems       = NULL
        ,@varGEN_IntDINVConsecMIN   = 0
        ,@varGEN_IntDINVConsecMAX   = 0
        ,@varGEN_IntDINVConsecACT   = 0
        ,@varGEN_IntCantItems       = 0
        --// TRansacción
        ,@varTRB_TRAChrNumero       = ''
        ,@varTRB_MOTIntCodigo       = 0
        ,@varTRB_TTPChrCodigo       = ''
        ,@varTRB_TCLChrCodigo       = ''
        ,@varTRB_TDCChrCodigo       = ''
        ,@varTRB_ESTChrCodigo       = '700-APL' 
        ,@varTRB_SUCIntCodigo       = ''
        ,@varTRB_FecFechaPrc        = GETDATE()
        ,@varTRB_MNDIntCodigo       = 0
        ,@varTRB_TRAMonTasaMon      = 0 
        ,@varTRB_TRAChrTasaTip      = 'C'
        ,@varTRB_BODChrCodigo       = ''
        ,@varTRB_TRAMonTotalNeto    = 0
        --// Asiento
        ,@varASI_ASEChrNumero       = ''    
    
    
    --//Declara tabla temporal para detalle del asiento 
    DECLARE @varTAsiDetalle TABLE 
    (    
         EMP_IntCodigo          INT
        ,ASE_ChrNumero          VARCHAR(25)
        ,ASD_IntConsecutivo     INT
        ,CAT_ChrCodigo          VARCHAR(50)
        ,SUC_IntCodigo          INT
        ,CCC_ChrCodigo          VARCHAR(50)
        ,CCE_ChrCodigo          VARCHAR(50)
        ,ASD_ChrAnotaciones     VARCHAR(250)
        ,TDC_ChrCodigo          VARCHAR(10)
        ,ASD_ChrNumeroDoc       VARCHAR(25)
        ,TER_IntCodigo          INT
        ,TER_ChrTipo            VARCHAR(5)
        ,ASD_MonDebe            DECIMAL(25,6)
        ,ASD_MonHaber           DECIMAL(25,6)  
    )

    
    --//Validaciones
    IF((@entEMPIntCodigo IS NULL) OR (@entTRAChrNumeroPed IS NULL)
        OR (@entUSUIntCodigo IS NULL) OR (@entKEYChrEncripta IS NULL) )
    BEGIN
        SET @salMensajeProc='Debe completar todos los campos requeridos'
        RETURN
    END
    
    IF((@entEMPIntCodigo = 0) OR (@entTRAChrNumeroPed = '')
       OR (@entUSUIntCodigo ='') OR (@entKEYChrEncripta ='') )
    BEGIN
        SET @salMensajeProc='Faltan campos requeridos '
        RETURN
    END
    
    --para verificar el estado que este en estado 700 - pediente de convertir o con productos pendientes -
    IF ((SELECT LEFT(EST_ChrCodigo,7) FROM [swe].[fn_SelCOM_TRANSACCLI_ENC](@entEMPIntCodigo,@entTRAChrNumeroPed)) != '700-APL')
    BEGIN
        SET @salMensajeProc='El pedido debe estar en estado APLICADO '
        RETURN
    END
    
    
    
    --//Selecciona de la configuración del tipo de transacción pedido
    --//(El tipo de transacción traslado de bodega / El motivo de para el traslado de bodega / Si el pedido genera asiento)
    SELECT 
         @varTRB_TTPChrCodigo = PIV.CodTipTra
        ,@varTRB_TCLChrCodigo = LEFT(PIV.CodTipTra,6)
        ,@varTRB_MOTIntCodigo = CONVERT(INT,CASE WHEN (ISNUMERIC(PIV.CodMotivo)=1) THEN PIV.CodMotivo ELSE '0' END)
        ,@varTRB_NoGenAsiento = CASE WHEN (UPPER(PIV.NoGenAsiento) = 'TRUE') THEN 1 ELSE 0 END 
        ,@varTRB_BODChrCodigo = PIV.CodBodReser
    FROM
    (    --// Selecciona los atributos del tipo de transacción del pedido
        SELECT 
            TXA.ATR_ChrClave  AS COLUMNA, 
            TXA.TXA_ChrDato   AS VALOR
        FROM swe.SWTCOM_TRANSACCION_ENC ENC
            INNER JOIN swe.SWTCOM_TRANSAC_TIP_X_ATR TXA
                ON  ENC.EMP_IntCodigo = TXA.EMP_IntCodigo
                AND ENC.TTP_ChrCodigo = TXA.TTP_ChrCodigo
                AND ENC.EMP_IntCodigo = @entEMPIntCodigo
                AND ENC.TRA_ChrNumero = @entTRAChrNumeroPed
                AND TXA.ATR_ChrClave  IN ('CodTipTra','CodMotivo','NoGenAsiento','CodBodReser')
    ) ORG
    PIVOT
    (
        MAX(ORG.VALOR)
        FOR ORG.COLUMNA IN (CodTipTra,CodMotivo,NoGenAsiento,CodBodReser)
    ) PIV;
    
    --// Selecciona tipo de documento para el traslado de bodega
    SELECT @varTRB_TDCChrCodigo = TXA_ChrDato
    FROM swe.SWTCOM_TRANSAC_TIP_X_ATR TXA
    WHERE EMP_IntCodigo = @entEMPIntCodigo
      AND TTP_ChrCodigo = @varTRB_TTPChrCodigo
      AND ATR_ChrClave  = 'TipDoc'
      
    IF (@varTRB_TTPChrCodigo='')BEGIN
        SET @salMensajeProc='No se han configurado los parámetros para hacer la liquidación '
        RETURN
    END 
      
    
    --/Obtiene los datos de la transaccion Pedidos que se requieren para generar transaccion Traslado de bodega
    SELECT @varTRB_SUCIntCodigo  = SUC_IntCodigo,
           @varTRB_FecFechaPrc   = GETDATE(),
           @varTRB_MNDIntCodigo  = MND_IntCodigo,
           @varTRB_TRAMonTasaMon = TRA_MonTasaMon, 
           @varTRB_TRAChrTasaTip = TRA_ChrTasaTip
    FROM swe.SWTCOM_TRANSACCION_ENC 
    WHERE EMP_IntCodigo = @entEMPIntCodigo
      AND TRA_ChrNumero = @entTRAChrNumeroPed
                
    --//Selecciona el póximo numero de transaccion según el tipo de documento
    SELECT  @varTRB_TRAChrNumero = @varTRB_TDCChrCodigo + '-' + 
            REPLICATE('0',CASE WHEN ((8-LEN(T.NUMERO))<0) THEN 0 ELSE (8-LEN(T.NUMERO)) END) +
            T.NUMERO
    FROM(    
        SELECT  CONVERT(VARCHAR,
                CASE WHEN MAX(SUBSTRING(TRA_ChrNumero,CHARINDEX('-',TRA_ChrNumero)+1,10)) IS NULL THEN 
                    1 
                ELSE 
                    MAX(SUBSTRING(TRA_ChrNumero,CHARINDEX('-',TRA_ChrNumero)+1,10)) + 1 
                END) AS NUMERO
        FROM swe.SWTCOM_TRANSACCION_ENC
        WHERE EMP_IntCodigo = @entEMPIntCodigo
        AND TRA_ChrNumero LIKE @varTRB_TDCChrCodigo+'-%'    
    ) AS T
    
    --//Valida que se haya formado con exito el número de transaccion        
    IF(@varTRB_TRAChrNumero = '')
    BEGIN
        SET @salMensajeProc='No se puede establecer el numero de transaccion'
        RETURN
    END
    
    --//Obtener el correlativo de la transaccion
    SELECT @varTRB_TRAIntCorrel = T.CORRELATIVO 
    FROM (
        SELECT CASE WHEN MAX(TRA_IntCorrelativo) IS NULL THEN 1 ELSE MAX(TRA_IntCorrelativo) + 1 END AS CORRELATIVO 
        FROM swe.SWTCOM_TRANSACCION_ENC WHERE EMP_IntCodigo = @entEMPIntCodigo AND TTP_ChrCodigo = @varTRB_TTPChrCodigo
    ) AS T
    
    --//Obtener el total para la transaccion traslado de bodega, además de la 
    --//cantidad de ítems y los consecutivos mínimo y máximo del detalle a liquidar
    SELECT 
         @varTRB_TRAMonTotalNeto     = SUM(((   CASE WHEN (FNC.DINV_MonCantIngresada > FNC.DINV_MonExistencia)THEN
                                                    FNC.DINV_MonExistencia
                                                ELSE FNC.DINV_MonCantIngresada END) * FNC.DINV_MonCostUnitario)) 
        ,@varGEN_IntDINVConsecMIN     = MIN(FNC.DINV_IntConsecutivo)
        ,@varGEN_IntDINVConsecMAX     = MAX(FNC.DINV_IntConsecutivo)
        ,@varGEN_IntCantItems         = COUNT(FNC.DINV_IntConsecutivo)
    FROM [swe].[fn_SelCOM_TRANSACCLI_DETINV](@entEMPIntCodigo,@entUSUIntCodigo,@entTRAChrNumeroPed,0,0) FNC
    WHERE 
        INV_ChrTipoItem != 'SRV'
        AND (    
                CASE WHEN (FNC.DINV_MonCantIngresada > FNC.DINV_MonExistencia)THEN
                    FNC.DINV_MonExistencia
                ELSE FNC.DINV_MonCantIngresada END
            ) > 0
    
    
    --//Establece si el pedido posee ítems menores a la existencia
    --IF EXISTS(
    --    SELECT TOP 1 1
    --    FROM [swe].[fn_SelCOM_TRANSACCLI_DETINV](@entEMPIntCodigo,@entUSUIntCodigo,@entTRAChrNumeroPed,0,0) FNC
    --    WHERE FNC.INV_ChrTipoItem != 'SRV'
    --    AND FNC.DINV_MonCantIngresada > FNC.DINV_MonExistencia
    --)BEGIN
    --    SET @salMensajeProc='No hay existencias para generar la liquidación'
    --    RETURN
    --END 
    
    --//-- INI LLENA LA TABLA TEMPORAL DEL DETALLE CONTABLE --//--
        --//Establece si la contabilización de inventario es por bodega
        SELECT 
            @varGEN_BitContabxBod = CASE WHEN (UPPER(CNF_ChrDato)='TRUE') THEN 1 ELSE 0 END
        FROM swe.SWTEMP_CONFIGURACION_X_EMPRESA
        WHERE EMP_IntCodigo = @entEMPIntCodigo AND CNF_ChrNombre = 'ComGen_ContabxBod'        
        
        --//Obtiene el detalle de ítems en el pedido a liquidar en XML para consulta del detalle contable
        SET @varGEN_DetalleItems = (
            SELECT --Selecciona los ítems y sus montos en XML
                 FNC.INV_IntCodigo        AS 'CodInv'
                ,FNC.BOD_ChrCodigo        AS 'CodBodOrg'
                ,DINV.BOD_ChrCodigo       AS 'CodBodDes'
                ,(( CASE WHEN (FNC.DINV_MonCantIngresada > FNC.DINV_MonExistencia)THEN
                        FNC.DINV_MonExistencia
                    ELSE FNC.DINV_MonCantIngresada END) * FNC.DINV_MonCostUnitario
                 ) AS 'MontoTotal'
            FROM [swe].[fn_SelCOM_TRANSACCLI_DETINV](@entEMPIntCodigo,@entUSUIntCodigo,@entTRAChrNumeroPed,0,0) FNC
                INNER JOIN swe.SWTCOM_TRANSAC_DETINV DINV
                    ON  FNC.EMP_IntCodigo = DINV.EMP_IntCodigo
                    AND FNC.TRA_ChrNumero = DINV.TRA_ChrNumero
                    AND FNC.DINV_IntConsecutivo = DINV.DINV_IntConsecutivo
                    AND FNC.INV_IntCodigo = DINV.INV_IntCodigo
                    AND INV_ChrTipoItem != 'SRV'
            WHERE(    
                    CASE WHEN (FNC.DINV_MonCantIngresada > FNC.DINV_MonExistencia)THEN
                        FNC.DINV_MonExistencia
                    ELSE FNC.DINV_MonCantIngresada END
                 ) > 0
            FOR XML PATH('Lin'), root ('DetalleItems')
        );
        
        --//Ingresa el detalle contable de la transacción
        INSERT INTO @varTAsiDetalle (    
             EMP_IntCodigo          ,ASE_ChrNumero            
            ,ASD_IntConsecutivo        
            ,CAT_ChrCodigo          ,SUC_IntCodigo           ,CCC_ChrCodigo
            ,CCE_ChrCodigo          ,ASD_ChrAnotaciones      ,TDC_ChrCodigo            
            ,ASD_ChrNumeroDoc       ,TER_IntCodigo           ,TER_ChrTipo            
            ,ASD_MonDebe            ,ASD_MonHaber            
        )
        SELECT 
             T.EMP_IntCodigo        ,T.ASE_ChrNumero            
            ,ROW_NUMBER() OVER(ORDER BY T.EMP_IntCodigo) AS ASD_IntConsecutivo        
            ,T.CAT_ChrCodigo        ,T.SUC_IntCodigo        ,T.CCC_ChrCodigo        
            ,T.CCE_ChrCodigo        ,T.ASD_ChrAnotaciones   ,T.TDC_ChrCodigo    
            ,T.ASD_ChrNumeroDoc     ,T.TER_IntCodigo        ,T.TER_ChrTipo                    
            ,T.ASD_MonDebe          ,T.ASD_MonHaber            
        FROM (
            --//Selecciona las cuentas contables para los ítems a liquidar y arma el detalle contable del traslado de bodega
            SELECT 
                 @entEMPIntCodigo            AS EMP_IntCodigo        ,@varTRB_TRAChrNumero       AS ASE_ChrNumero
                ,1                           AS ASD_IntConsecutivo   ,FN.CAT_ChrCodigoBDesPri    AS CAT_ChrCodigo            
                ,@varTRB_SUCIntCodigo        AS SUC_IntCodigo        ,''                         AS CCC_ChrCodigo            
                ,''                          AS CCE_ChrCodigo        ,''                         AS ASD_ChrAnotaciones        
                ,@varTRB_TDCChrCodigo        AS TDC_ChrCodigo        ,@varTRB_TRAChrNumero       AS ASD_ChrNumeroDoc        
                ,0                           AS TER_IntCodigo        ,''                         AS TER_ChrTipo            
                ,FN.DINV_MonMontoTotal       AS ASD_MonDebe          ,0                          AS ASD_MonHaber            
            FROM swe.[fn_SelCOM_MuestraTraInv_CtasInventario](@entEMPIntCodigo,@varGEN_DetalleItems,@varGEN_BitContabxBod) FN
            UNION ALL
            SELECT 
                 @entEMPIntCodigo            AS EMP_IntCodigo        ,@varTRB_TRAChrNumero       AS ASE_ChrNumero
                ,1                           AS ASD_IntConsecutivo   ,FN.CAT_ChrCodigoBOrgPri    AS CAT_ChrCodigo            
                ,@varTRB_SUCIntCodigo        AS SUC_IntCodigo        ,''                         AS CCC_ChrCodigo            
                ,''                          AS CCE_ChrCodigo        ,''                         AS ASD_ChrAnotaciones                
                ,@varTRB_TDCChrCodigo        AS TDC_ChrCodigo        ,@varTRB_TRAChrNumero       AS ASD_ChrNumeroDoc        
                ,0                           AS TER_IntCodigo        ,''                         AS TER_ChrTipo            
                ,0                           AS ASD_MonDebe          ,FN.DINV_MonMontoTotal      AS ASD_MonHaber            
            FROM swe.[fn_SelCOM_MuestraTraInv_CtasInventario](@entEMPIntCodigo,@varGEN_DetalleItems,@varGEN_BitContabxBod) FN
        ) T
    --//-- FIN LLENA LA TABLA TEMPORAL DEL DETALLE CONTABLE --//--

    
    BEGIN TRY

        BEGIN TRANSACTION

        IF(@varGEN_IntCantItems > 0) BEGIN --//Si la cantidad de ítems a liquidar es mayor a cero 
        
            --//---------------------------------------------------------------------------------
            --//--Ingresa el encabezado del traslado de bodega---------------------------------
            --//---------------------------------------------------------------------------------
            INSERT INTO swe.SWTCOM_TRANSACCION_ENC ( 
                 EMP_IntCodigo              ,TRA_ChrNumero               ,TRA_ChrNumExt            
                ,TRA_IntCorrelativo         ,TTP_ChrCodigo               ,SUC_IntCodigo            
                ,TDC_ChrCodigo              ,MND_IntCodigo               ,TRA_MonTasaMon            
                ,TRA_ChrTasaTip             ,TRA_FecFechaPrc             ,TRA_FecFechaDoc        
                ,TRA_FecFechaVnc            ,TRA_ChrResponsable          ,TRA_ChrReferenciaInt    
                ,ASE_ChrNumeroRef           ,TRA_ChrAnotaciones1    
                ,BOD_ChrCodigoOrg           ,TRA_MonTSubTotalORG         ,TRA_MonTSubTotalPRC    
                ,TRA_MonTotalBruto          ,TRA_MonTotalNeto            ,EST_ChrCodigo            
                ,USU_IntCodigoIng           ,USU_FecFechaIng             ,USU_IntCodigoMod        ,USU_FecFechaMod
            )
            SELECT
                 @entEMPIntCodigo           ,@varTRB_TRAChrNumero       ,@varTRB_TRAChrNumero
                ,@varTRB_TRAIntCorrel       ,@varTRB_TTPChrCodigo       ,@varTRB_SUCIntCodigo
                ,@varTRB_TDCChrCodigo       ,@varTRB_MNDIntCodigo       ,@varTRB_TRAMonTasaMon
                ,@varTRB_TRAChrTasaTip      ,@varTRB_FecFechaPrc        ,@varTRB_FecFechaPrc
                ,@varTRB_FecFechaPrc        ,'LIQUIDACION DE PEDIDO'    ,@entTRAChrNumeroPed
                ,@varASI_ASEChrNumero       ,'LIQUIDACION DE PEDIDO   [ '+ @entTRAChrNumeroPed +' ]'
                ,@varTRB_BODChrCodigo       ,@varTRB_TRAMonTotalNeto    ,@varTRB_TRAMonTotalNeto
                ,@varTRB_TRAMonTotalNeto    ,@varTRB_TRAMonTotalNeto    ,@varTRB_ESTChrCodigo
                ,@entUSUIntCodigo           ,GETDATE()                  ,@entUSUIntCodigo        ,GETDATE();
            
            
            --//Datos para la bitácora para encabezado transacción
            SET @varDatosBit =     ''+       'LIQUIDACION DE PEDIDO'                                                     + '~' +
                'EMP_IntCodigo = '+          CONVERT(VARCHAR,@entEMPIntCodigo)                                           + '~' +
                'TRA_ChrNumero = '+          CONVERT(VARCHAR,@varTRB_TRAChrNumero)                                       + '~' +
                'TRA_ChrNumExt = '+          CONVERT(VARCHAR,@varTRB_TRAChrNumero)                                       + '~' +
                'TRA_IntCorrelativo = '+     CONVERT(VARCHAR,@varTRB_TRAIntCorrel)                                       + '~' +
                'TTP_ChrCodigo = '+          CONVERT(VARCHAR,@varTRB_TTPChrCodigo)                                       + '~' +
                'SUC_IntCodigo = '+          CONVERT(VARCHAR,@varTRB_SUCIntCodigo)                                       + '~' +
                'TDC_ChrCodigo = '+          CONVERT(VARCHAR,@varTRB_TDCChrCodigo)                                       + '~' +
                'MND_IntCodigo = '+          CONVERT(VARCHAR,@varTRB_MNDIntCodigo)                                       + '~' +
                'TRA_MonTasaMon = '+         CONVERT(VARCHAR,@varTRB_TRAMonTasaMon)                                      + '~' +
                'TRA_ChrTasaTip = '+         CONVERT(VARCHAR,@varTRB_TRAChrTasaTip)                                      + '~' +
                'TRA_FecFechaPrc = '+        CONVERT(VARCHAR,@varTRB_FecFechaPrc)                                        + '~' +
                'TRA_FecFechaDoc = '+        CONVERT(VARCHAR,@varTRB_FecFechaPrc)                                        + '~' +
                'TRA_FecFechaVnc= '+         CONVERT(VARCHAR,@varTRB_FecFechaPrc)                                        + '~' +
                'TRA_ChrResponsable = '+     'LIQUIDACION DE PEDIDO'                                                     + '~' +
                'BOD_ChrCodigoOrg = '+       CONVERT(VARCHAR,@varTRB_BODChrCodigo)                                       + '~' +
                'TRA_ChrReferenciaInt = '+   CONVERT(VARCHAR,@entTRAChrNumeroPed)                                        + '~' +
                'TRA_ChrAnotaciones1 = '+    CONVERT(VARCHAR,'LIQUIDACION DE PEDIDO   [ '+ @entTRAChrNumeroPed +' ]')    + '~' +
                'TRA_MonTSubTotalPRC = '+    CONVERT(VARCHAR,@varTRB_TRAMonTotalNeto)                                    + '~' +
                'TRA_MonTotalBruto = '+      CONVERT(VARCHAR,@varTRB_TRAMonTotalNeto)                                    + '~' +
                'TRA_MonTotalNeto = '+       CONVERT(VARCHAR,@varTRB_TRAMonTotalNeto)                                    + '~' +
                'EST_ChrCodigo = '+          CONVERT(VARCHAR,@varTRB_ESTChrCodigo)                                       + '~' +
                'USU_IntCodigoIng = '+       CONVERT(VARCHAR,@entUSUIntCodigo)                                           + '~' +
                'USU_FecFechaIng = '+        CONVERT(VARCHAR,GETDATE())                                                  + '~' +
                'USU_IntCodigoMod = '+       CONVERT(VARCHAR,@entUSUIntCodigo)                                           + '~' +
                'USU_FecFechaMod = '+        CONVERT(VARCHAR,GETDATE())    
            
            --//Insertar bitácora de encabezado asiento                                                                            
            EXEC swe.pr_BitInsCOM_TRANSACCION_ENC @entEMPIntCodigo, @varTRB_TRAChrNumero, 1, @entUSUIntCodigo,'CGEModComercial_CLI', @varDatosBit, @entKEYChrEncripta
            
            
            --//---------------------------------------------------------------------------------
            --//Ingresa el detalle de motivos del traslado de bodega---------------------------
            --//---------------------------------------------------------------------------------
            INSERT INTO swe.SWTCOM_TRANSAC_DETMOT(
                 EMP_IntCodigo              ,TRA_ChrNumero                
                ,DMOT_IntConsecutivo        ,MOT_IntCodigo                
                ,DMOT_ChrNotaAdicional        
                ,DMOT_MonMontoDebe          ,DMOT_MonMontoHaber            
            )
            SELECT  
                 @entEMPIntCodigo           ,@varTRB_TRAChrNumero
                ,1                          ,@varTRB_MOTIntCodigo
                ,'LIQUIDACION DE PEDIDO   [ '+ @entTRAChrNumeroPed +' ]'
                ,@varTRB_TRAMonTotalNeto    ,0;
            
                
            --//---------------------------------------------------------------------------------
            --//--Detalle contable del traslado de bodega -------------------------------------
            --//---------------------------------------------------------------------------------
            INSERT INTO swe.SWTCOM_TRANSAC_DETCTA (
                EMP_IntCodigo,           TRA_ChrNumero,          DCTA_IntConsecutivo,    DCTA_ChrTipoCta,
                CAT_ChrCodigo,           CCC_ChrCodigo,          TER_IntCodigo,          TER_ChrTipo,            
                TRA_ChrNumeroRef,        DCTA_FecFechaVnc,       DCTA_MonDebe,           DCTA_MonHaber,            
                USU_IntCodigoMod,        USU_FecFechaMod)
            SELECT 
                EMP_IntCodigo,           @varTRB_TRAChrNumero,   ASD_IntConsecutivo,     'INV' AS DCTA_ChrTipoCta,
                CAT_ChrCodigo,           CCC_ChrCodigo,          TER_IntCodigo,          TER_ChrTipo,     
                '' AS TRA_ChrNumeroRef,  @varTRB_FecFechaPrc,    ASD_MonDebe,            ASD_MonHaber,            
                @entUSUIntCodigo,       GETDATE()    
            FROM @varTasidetalle;
            
            
            --//---------------------------------------------------------------------------------
            --//--Estado de la transacción-----------------------------------------------------
            --//--------------------------------------------------------------------------------- 
            INSERT INTO swe.SWTCOM_TRANSAC_DETEST(
                EMP_IntCodigo,          TRA_ChrNumero, 
                DEST_IntConsecutivo,    EST_ChrCodigo,             DEST_ChrAnotaciones,
                USU_IntCodigoMod,       USU_FecFechaMod
            )
            SELECT            
                @entEMPIntCodigo,        @varTRB_TRAChrNumero,
                1,                       @varTRB_ESTChrCodigo,    'LIQUIDACION DE PEDIDO   [ '+ @entTRAChrNumeroPed +' ]',
                @entUSUIntCodigo,        GETDATE();
            


            --//---------------------------------------------------------------------------------
            --//--Ingresa el detalle de inventario --------------------------------------------
            --//---------------------------------------------------------------------------------    
            SET @varGEN_IntDINVConsecACT = @varGEN_IntDINVConsecMIN
            
            WHILE (@varGEN_IntDINVConsecACT <= @varGEN_IntDINVConsecMAX) BEGIN
                
                --//Setea las varibles de control de estado
                SELECT @varDTRB_EstatusProc = 0, @varDTRB_MensajeProc = 0;
                                        
                --//Selecciona el ítem del detalle del pedido a liquidar para ingresarlo
                SELECT
                     @varDTRB_DINVIntConsecutivo    = FNC.DINV_IntConsecutivo
                    ,@varDTRB_INVIntCodigo          = FNC.INV_IntCodigo
                    ,@varDTRB_DINVChrNombre         = FNC.DINV_ChrNombre
                    ,@varDTRB_BODChrCodigo          = DINV.BOD_ChrCodigo            --//Bodega destino
                    ,@varDTRB_LOTIntCodigo          = FNC.LOT_IntCodigo
                    ,@varDTRB_DINVChrPropiedad      = FNC.DINV_ChrPropiedad
                    ,@varDTRB_UNDChrCodigo          = FNC.UND_ChrCodigo
                    ,@varDTRB_IXUMonFactor          = FNC.IXU_MonFactor
                    ,@varDTRB_DINVMonCantIngresada  = FNC.DINV_MonCantIngresada
                    ,@varDTRB_DINVMonCantRegistrada = 0
                    ,@varDTRB_DINVMonCostUnitario   = FNC.DINV_MonCostUnitario
                    ,@varDTRB_DINVMonTotalNeto      = ((CASE WHEN (FNC.DINV_MonCantIngresada > FNC.DINV_MonExistencia)THEN
                                                            FNC.DINV_MonExistencia
                                                        ELSE FNC.DINV_MonCantIngresada END)* FNC.DINV_MonCantIngresada)
                    ,@varDTRB_TRAChrDatosSER        = FNC.DINV_ChrSeries    
                    ,@varDTRB_EstatusProc           = 0
                    ,@varDTRB_MensajeProc           = ''        
                FROM [swe].[fn_SelCOM_TRANSACCLI_DETINV](@entEMPIntCodigo,@entUSUIntCodigo,@entTRAChrNumeroPed,0,0) FNC
                    INNER JOIN swe.SWTCOM_TRANSAC_DETINV DINV
                        ON  FNC.EMP_IntCodigo = DINV.EMP_IntCodigo
                        AND FNC.TRA_ChrNumero = DINV.TRA_ChrNumero
                        AND FNC.DINV_IntConsecutivo = DINV.DINV_IntConsecutivo
                        AND FNC.INV_IntCodigo = DINV.INV_IntCodigo
                        AND FNC.INV_ChrTipoItem != 'SRV'
                        AND FNC.DINV_IntConsecutivo = @varGEN_IntDINVConsecACT 
                WHERE(    
                    CASE WHEN (FNC.DINV_MonCantIngresada > FNC.DINV_MonExistencia)THEN
                        FNC.DINV_MonExistencia
                    ELSE FNC.DINV_MonCantIngresada END
                 ) > 0
                 
                --//Ingresa el ítem al detalle de inventario
                EXEC [swe].[pr_InsCOM_TRANSACINV_DETINV]
                     @entEMPIntCodigo
                    ,@varTRB_TRAChrNumero
                    ,@varDTRB_DINVIntConsecutivo        
                    ,@varDTRB_INVIntCodigo                
                    ,@varDTRB_DINVChrNombre                    
                    ,@varDTRB_BODChrCodigo                
                    ,@varDTRB_LOTIntCodigo                
                    ,@varDTRB_DINVChrPropiedad            
                    ,@varDTRB_UNDChrCodigo                
                    ,@varDTRB_IXUMonFactor                
                    ,@varDTRB_DINVMonCantIngresada        
                    ,@varDTRB_DINVMonCantRegistrada        
                    ,@varDTRB_DINVMonCostUnitario        
                    ,@varDTRB_DINVMonTotalNeto
                    ,@entUSUIntCodigo            
                    ,@varDTRB_TRAChrDatosSER
                    ,@entKEYChrEncripta    
                    ,@varDTRB_EstatusProc    OUTPUT
                    ,@varDTRB_MensajeProc    OUTPUT;
                
                IF (@varDTRB_EstatusProc = 1) BEGIN
                    --//INI Selecciona el siguiente consecutivo del detalle de ítems a liquidar
                    SELECT @varGEN_IntDINVConsecACT = ISNULL((
                        SELECT 
                            CASE WHEN (@varGEN_IntDINVConsecACT < @varGEN_IntDINVConsecMAX) THEN
                                T.DINV_IntConsecutivo
                            ELSE (@varGEN_IntDINVConsecMAX + 1) END AS CONS
                        FROM(
                                SELECT FNC.DINV_IntConsecutivo, ROW_NUMBER() OVER(ORDER BY FNC.DINV_IntConsecutivo ASC) AS ORDEN
                                FROM [swe].[fn_SelCOM_TRANSACCLI_DETINV](@entEMPIntCodigo,@entUSUIntCodigo,@entTRAChrNumeroPed,0,0) FNC
                                WHERE FNC.INV_ChrTipoItem != 'SRV'   
                                    AND FNC.DINV_IntConsecutivo > @varGEN_IntDINVConsecACT
                                    AND (    
                                        CASE WHEN (FNC.DINV_MonCantIngresada > FNC.DINV_MonExistencia)THEN
                                            FNC.DINV_MonExistencia
                                        ELSE FNC.DINV_MonCantIngresada END
                                     ) > 0
                            ) T
                        WHERE T.ORDEN = 1
                    ),(@varGEN_IntDINVConsecMAX + 1))
                    --//FIN Selecciona el siguiente consecutivo del detalle de ítems a liquidar
                END ELSE BEGIN
                    --// Setea las variables para salir y devolver el error
                    SELECT 
                         @varGEN_IntDINVConsecACT = (@varGEN_IntDINVConsecMAX + 1)
                        ,@salEstatusProc = @varDTRB_EstatusProc
                        ,@salMensajeProc = @varDTRB_MensajeProc;
                END
                
            END --//END WHILE (@varGEN_IntDINVConsecACT <= @varGEN_IntDINVConsecMAX)

                        
            --//---------------------------------------------------------------------------------
            --//--Ingresa el movimiento de inventario -----------------------------------------
            --//---------------------------------------------------------------------------------
            IF (@varDTRB_EstatusProc = 1) BEGIN
                
                EXEC [swe].[pr_InsCOM_MOVIMIENTO_INV] 
                     @entEMPIntCodigo
                    ,@varTRB_TRAChrNumero
                    ,@varTRB_TCLChrCodigo
                    ,@entUSUIntCodigo
                    ,0    
                    ,@varDTRB_EstatusProc    OUTPUT
                    ,@varDTRB_MensajeProc    OUTPUT;
            END


            --//---------------------------------------------------------------------------------
            --//--Ingresa el asiento contable -------------------------------------------------
            --//---------------------------------------------------------------------------------
            --//INI Si la configuración del pedido a liquidar, establece que debe generar asiento
            IF ((@varTRB_NoGenAsiento != 1) AND (@varDTRB_EstatusProc = 1)) BEGIN
                
                EXEC [swe].[pr_InsCOM_TRANSAC_ASIENTO]
                     @entEMPIntCodigo
                    ,@varTRB_TRAChrNumero
                    ,@entKEYChrEncripta
                    ,@varASI_ASEChrNumero    OUTPUT
                    ,@varDTRB_EstatusProc    OUTPUT
                    ,@varDTRB_MensajeProc    OUTPUT;
            END
            --//FIN Si la configuración del pedido a liquidar, establece que debe generar asiento
        
        END ELSE BEGIN 
            
            SELECT 
                 @varDTRB_EstatusProc = 1    --//Si no posee detalle de ítems a liquidar
                ,@varTRB_TRAChrNumero = ''    --//Limpia el número de transacción
                ,@varASI_ASEChrNumero = ''    --//Limpia el número de asiento.
            
        END --//END IF(@varGEN_IntCantItems > 0) --//Si la cantidad de ítems a liquidar es mayor a cero 
        
        
        --//---------------------------------------------------------------------------------
        --//-- Actualiza el estado de la transacción del pedido, a liquidada --------------
        --//---------------------------------------------------------------------------------
        IF (@varDTRB_EstatusProc = 1) BEGIN
        
            EXEC [swe].[pr_UpdCOM_TRANSACINV_ENC_EST] 
                 @entEMPIntCodigo
                ,@entTRAChrNumeroPed
                ,'701-COS'
                ,'LIQUIDACION DE PEDIDO'
                ,@entUSUIntCodigo
                ,@varDTRB_EstatusProc    OUTPUT
                ,@varDTRB_MensajeProc    OUTPUT;
        END
        
        
        --//Si el detalle de la transaccion se ingresó correctamente
        IF (@varDTRB_EstatusProc = 1) BEGIN
        
            SELECT 
                 @salEstatusProc = 1
                ,@salTRAChrNumero = @varTRB_TRAChrNumero
                ,@salASEChrNumero = @varASI_ASEChrNumero
                
        END ELSE BEGIN
        
            SELECT @salEstatusProc = 0
            
        END    
        
        COMMIT TRANSACTION 
        
    END TRY
    BEGIN CATCH
    
        --//--    SEGMENTO PARA LA RECUPERACION DE LOS DETALLES DE ERROR    --//--
        DECLARE @ERROR VARCHAR(620)  SET @ERROR     = (SELECT ERROR_MESSAGE())
        DECLARE @STATE INT           SET @STATE     = (SELECT ERROR_STATE())
        DECLARE @SEVERITY INT        SET @SEVERITY  = (SELECT ERROR_SEVERITY())
        DECLARE @LINE INT            SET @LINE      = (SELECT ERROR_LINE())
        
        SET @salEstatusProc = 0
        
        ROLLBACK TRANSACTION
                
        SET @varDatosBit =
            'MENSAJE ERROR='+    CONVERT(VARCHAR,@ERROR)       +'~'+
            'ESTADO='       +    CONVERT(VARCHAR,@STATE)       +'~'+
            'GRAVEDAD='     +    CONVERT(VARCHAR,@SEVERITY)    +'~'+
            'LINEA='        +    CONVERT(VARCHAR,@LINE)        
        
        --//Insertar bitácora de encabezado de transacción
        EXEC swe.pr_BitInsCOM_TRANSACCION_ENC @entEMPIntCodigo, @varTRB_TRAChrNumero, 1, @entUSUIntCodigo, 'CGEModComercial_CLI', @varDatosBit, @entKEYChrEncripta
                
        RAISERROR(@ERROR,@SEVERITY,@STATE)

    END CATCH
        
END
GO


