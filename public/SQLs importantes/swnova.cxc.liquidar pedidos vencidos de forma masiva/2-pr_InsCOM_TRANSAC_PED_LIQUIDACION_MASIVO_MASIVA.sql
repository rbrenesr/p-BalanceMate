USE [SYSWEB_ACT]
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'pr_InsCOM_TRANSAC_PED_LIQUIDACION_MASIVA')        
    DROP PROCEDURE [swe].[pr_InsCOM_TRANSAC_PED_LIQUIDACION_MASIVA]
GO

-- ===================================================================================================
-- Procedimiento:    pr_InsCOM_TRANSAC_PED_LIQUIDACION_MASIVA                                INSERTAR
-- Autor:            Antonio Garita
-- Fecha:            2017-07-14
-- Descripción:      
--                  Selecciona los pedidos cliente, cuya fecha de validez exceda la fecha final, 
--                  enviada por parámetro, generando traslados de bodega de forma automática, 
--                  liquidando los ítems pendientes de cada transacción; retornando a la bodega
--                  origen, los productos, accesorios y series ingresados.
--                  Retorna un tabla con el listado de pedidos liquidados, el traslado de bodega o
--                  requisición generado, su asiento respectivo y el estados junto al mensaje 
--                  en caso de que el la transación pedido no se haya podido liquidar.
--
--                   Ingresar registros en la Tablas:
--                   SWTCOM_TRANSACCION_ENC 
--                       SWTCOM_TRANSAC_DETMOT / SWTCOM_TRANSAC_DETCTA / SWTCOM_TRANSAC_DETEST
--                       SWTCOM_TRANSAC_DETINV / SWTCOM_TRANSAC_DETINV_SER / SWTCOM_TRANSAC_DETINV_ACC
--                       SWTCOM_MOVIMIENTO_INV / SWTCOM_MOVIMIENTO_INVSER
--                   SWTCON_ASIENTO_ENC 
--                       SWTCON_ASIENTO_DET / SWTCON_ASIENTO_ENC_X_EST
--                        
-- Retorna:         True si se ingreso el registro y False si no se ingreso.
-- ===================================================================================================
CREATE PROCEDURE [swe].[pr_InsCOM_TRANSAC_PED_LIQUIDACION_MASIVA](
     @entEMPIntCodigo       INT                 --Código de empresa    
    ,@entSUCChrCodigo       VARCHAR(5)          --Código de sucursal (% = Todas)
    ,@entTTPChrCodigo       VARCHAR(25)         --Código de tipo de transacción pedido (% = Todos)
    ,@entUSUIntCodigo       INT                 --Usuario quien genera la transacción
    ,@entTRAFecFechaFin     DATETIME            --Fecha final tope de validez pedidos
    ,@entKEYChrEncripta     VARCHAR(25)         --Llave de encripción
    ,@salEstatusProc        BIT          OUTPUT --Estado de la transacción
    ,@salMensajeProc        VARCHAR(150) OUTPUT --Mensaje en caso erroreo
) AS BEGIN

    SET NOCOUNT ON

    --//Validaciones
    IF((@entEMPIntCodigo IS NULL) OR (@entSUCChrCodigo IS NULL) OR (@entTRAFecFechaFin IS NULL) OR
       (@entUSUIntCodigo IS NULL) OR (@entKEYChrEncripta IS NULL))
    BEGIN
        SET @salMensajeProc='Debe completar todos los campos requeridos'
        RETURN
    END
    
    IF((@entEMPIntCodigo = 0) OR (@entSUCChrCodigo = '') OR (@entUSUIntCodigo = 0) OR (@entKEYChrEncripta = ''))
    BEGIN
        SET @salMensajeProc='Faltan campos requeridos '
        RETURN
    END


    DECLARE @varPERIntCodigo INT  
    --Selecciona el perfil del usuario
    SELECT @varPERIntCodigo = USU.PER_IntCodigo FROM swe.SWTEMP_USUARIO USU
    WHERE USU.EMP_IntCodigo = @entEMPIntCodigo AND USU.USU_IntCodigo = @entUSUIntCodigo

    --//Declara tabla temporal de salida con las transacciones de pedido y su estatus de liquidación
     --//Declara tabla temporal con el listado de pedidos con fecha de validez vencida
    DECLARE @varTBL_TransacPedLIQ TABLE 
        (TRA_ChrNumeroPed    VARCHAR(25)      --Número de transacción pedido por liquidar
        ,TRA_ChrNumeroTrb    VARCHAR(25)      --Número de transacción traslado de bodega generado
        ,ASE_ChrNumeroTrb    VARCHAR(25)      --Número de asiento del traslado de bodega generado
        ,LIQ_BitEstatusProc  BIT              --Estado de la ejecución de liquidación del pedido
        ,LIQ_ChrMensajeProc  VARCHAR(150))    --Mensaje de retorno en caso de error

    --//Declara tabla temporal con el listado de pedidos con fecha de validez vencida
    DECLARE @varTBL_ListTransac TABLE    
        (EMP_IntCodigo          INT
        ,TRA_ChrNumero          VARCHAR(25)
        ,TRA_IntConsecutivo     INT
        ,TRA_ChrNumExt          VARCHAR(25)
        ,TTP_ChrCodigo          VARCHAR(25)
        ,SUC_IntCodigo          INT
        ,TRA_FecFechaPrc        DATETIME
        ,TRA_FecFechaDoc        DATETIME
        ,TRA_FecFechaVnc        DATETIME
        ,TRA_FecFechaVal        DATETIME
        ,TRA_IntDiasValVnc      INT
        ,TRA_IntDiasValido      INT
        ,TER_IntCodigo          INT
        ,TRA_ChrNombreTercero   VARCHAR(250)
        ,TRA_ChrReferenciaInt   VARCHAR(1000)
        ,TRA_ChrAnotaciones1    VARCHAR(1000)
        ,VEN_IntCodigoPri       INT
        ,MND_IntCodigo          INT
        ,TRA_MonTasaMon         DECIMAL(25,6)
        ,TRA_MonTSubTotalORG    DECIMAL(25,6)
        ,TRA_MonTDescuentoDET   DECIMAL(25,6)
        ,TRA_MonTotalBruto      DECIMAL(25,6)
        ,TRA_MonTImpuesto       DECIMAL(25,6)
        ,TRA_MonTotalNeto       DECIMAL(25,6))


    --//Llena la tabla temporal con el listado de pedidos con fecha de validez vencida
    INSERT INTO @varTBL_ListTransac
        (EMP_IntCodigo          
        ,TRA_ChrNumero          
        ,TRA_IntConsecutivo     
        ,TRA_ChrNumExt          
        ,TTP_ChrCodigo          
        ,SUC_IntCodigo          
        ,TRA_FecFechaPrc        
        ,TRA_FecFechaDoc        
        ,TRA_FecFechaVnc        
        ,TRA_FecFechaVal        
        ,TRA_IntDiasValVnc      
        ,TRA_IntDiasValido      
        ,TER_IntCodigo          
        ,TRA_ChrNombreTercero   
        ,TRA_ChrReferenciaInt   
        ,TRA_ChrAnotaciones1    
        ,VEN_IntCodigoPri       
        ,MND_IntCodigo          
        ,TRA_MonTasaMon         
        ,TRA_MonTSubTotalORG    
        ,TRA_MonTDescuentoDET   
        ,TRA_MonTotalBruto      
        ,TRA_MonTImpuesto       
        ,TRA_MonTotalNeto)
    SELECT TOP 1000
         ENC.EMP_IntCodigo
        ,ENC.TRA_ChrNumero
        ,ROW_NUMBER() OVER(ORDER BY DATEDIFF(DAY,@entTRAFecFechaFin,DATEADD(DAY,ENC.TRA_IntDiasValido,ENC.TRA_FecFechaDoc)) ASC) AS 'TRA_IntConsecutivo'
        ,ENC.TRA_ChrNumExt
        ,ENC.TTP_ChrCodigo
        ,ENC.SUC_IntCodigo
        ,ENC.TRA_FecFechaPrc
        ,ENC.TRA_FecFechaDoc
        ,ENC.TRA_FecFechaVnc
        ,DATEADD(DAY,ENC.TRA_IntDiasValido,ENC.TRA_FecFechaDoc) AS 'TRA_FecFechaVal'
        ,DATEDIFF(DAY,@entTRAFecFechaFin,DATEADD(DAY,ENC.TRA_IntDiasValido,ENC.TRA_FecFechaDoc)) AS 'TRA_IntDiasValVnc'
        ,ENC.TRA_IntDiasValido
        ,ENC.TER_IntCodigo
        ,ENC.TRA_ChrNombreTercero
        ,ENC.TRA_ChrReferenciaInt
        ,ENC.TRA_ChrAnotaciones1
        ,ENC.VEN_IntCodigoPri
        ,ENC.MND_IntCodigo
        ,ENC.TRA_MonTasaMon
        ,ENC.TRA_MonTSubTotalORG
        ,ENC.TRA_MonTDescuentoDET
        ,ENC.TRA_MonTotalBruto
        ,ENC.TRA_MonTImpuesto
        ,ENC.TRA_MonTotalNeto
    FROM 
        swe.SWTCOM_TRANSACCION_ENC ENC
        INNER JOIN (--tipos de transaccion que tiene acceso el perfil del usuario
            SELECT DISTINCT TCL_ChrCodigo, TCL_ChrNombre, TTP_ChrCodigo, TTP_ChrNombre
            FROM swe.fn_SelEMP_PERFIL_TRANSAC_EST(@entEMPIntCodigo,@varPERIntCodigo) 
            WHERE EST_BndAsignado=1 AND TCL_ChrCodigo LIKE 'CLIPED'
        ) AS TTP
            ON  ENC.EMP_IntCodigo = @entEMPIntCodigo
            AND ENC.TTP_ChrCodigo = TTP.TTP_ChrCodigo
            AND LEFT(ENC.TTP_ChrCodigo,6) = 'CLIPED'
            AND ((LEFT(ENC.EST_ChrCodigo,3)!='701')AND(LEFT(ENC.EST_ChrCodigo,3)!='900')AND(LEFT(ENC.EST_ChrCodigo,3)!='750'))
            AND CONVERT(VARCHAR(5),ENC.SUC_IntCodigo) LIKE @entSUCChrCodigo
            AND ENC.TTP_ChrCodigo LIKE @entTTPChrCodigo
        INNER JOIN (--sucursales a las que tiene acceso el perfil del usuario
            SELECT SUC_IntCodigo, SUC_ChrNombre
            FROM swe.fn_SelEMP_PERFIL_SUCURSAL(@entEMPIntCodigo,@varPERIntCodigo) 
            WHERE SUC_BndAsignada=1 AND SUC_ChrEstado='ACT'
        ) AS SUC
            ON ENC.SUC_IntCodigo = SUC.SUC_IntCodigo
	    INNER JOIN swe.SWTCOM_VENDEDOR VEN
            ON  ENC.EMP_IntCodigo = VEN.EMP_IntCodigo
            AND ENC.VEN_IntCodigoPri = VEN.VEN_IntCodigo
    WHERE
        DATEDIFF(DAY,@entTRAFecFechaFin,DATEADD(DAY,ENC.TRA_IntDiasValido,ENC.TRA_FecFechaDoc)) < 0
    ORDER BY 
        ROW_NUMBER() OVER(ORDER BY DATEDIFF(DAY,@entTRAFecFechaFin,DATEADD(DAY,ENC.TRA_IntDiasValido,ENC.TRA_FecFechaDoc)) ASC)


    --//Establece la cantidad de pedidos con fecha de validez vencida
    DECLARE @varIntCantTransac INT = 0
    DECLARE @varIntConsTransac INT = 0
    SELECT @varIntCantTransac = ISNULL(MAX(TRA_IntConsecutivo),0) FROM @varTBL_ListTransac

    IF (@varIntCantTransac <= 0) BEGIN --//INI Si la candidad de Transacciones no es mayor a cero
        SET @salMensajeProc = 'No se encuentran pedidos vencidos por liquidar!'
        RETURN
    END --//-- ----------------------- --//FIN Si la candidad de Transacciones no es mayor a cero


    --//Variables con información de la transacción de pedidos a liquidar
    DECLARE
         @varTRAChrNumeroPed VARCHAR(25)    --Número de pedido a liquidar
        ,@varTRAChrNumeroTrb VARCHAR(25)    --Número de transacción traslado de bodega generado
        ,@varASEChrNumeroTrb VARCHAR(25)    --Número de asiento del traslado de bodega generado
        ,@varEstatusProcLiqP BIT            --Estado de la ejecución de liquidación del pedido
        ,@varMensajeProcLiqP VARCHAR(150)   --Mensaje de retorno en caso de error

    BEGIN TRY

        BEGIN TRANSACTION
        
            SET @varIntConsTransac = 1 --Inicializa el consecutivo

            WHILE(@varIntConsTransac <= @varIntCantTransac)BEGIN --//INI Mientras existan transacciones de pedido a liquidar

                SELECT @varTRAChrNumeroPed = TRA_ChrNumero
                FROM @varTBL_ListTransac WHERE TRA_IntConsecutivo = @varIntConsTransac
                        
                --//Ejecuta el proceso de liquidación para el pedido seleccionado
                EXEC [swe].[pr_InsCOM_TRANSAC_PED_LIQUIDACION]
                     @entEMPIntCodigo           --Código de empresa    
                    ,@varTRAChrNumeroPed        --Número de pedido a liquidar
                    ,@entUSUIntCodigo           --Usuario quien genera la transacción
                    ,@entKEYChrEncripta         --Llave de encripción
                    ,@varTRAChrNumeroTrb OUTPUT --Número de transacción traslado de bodega generado
                    ,@varASEChrNumeroTrb OUTPUT --Número de asiento del traslado de bodega generado
                    ,@varEstatusProcLiqP OUTPUT --Estado de la ejecución de liquidación del pedido
                    ,@varMensajeProcLiqP OUTPUT --Mensaje de retorno en caso de error

                --//Ingresa a la tabla de retorno, el resultado de la liquidación del pedido
                INSERT INTO @varTBL_TransacPedLIQ
                    (TRA_ChrNumeroPed,  TRA_ChrNumeroTrb,     ASE_ChrNumeroTrb,    LIQ_BitEstatusProc, LIQ_ChrMensajeProc)
                SELECT 
                    @varTRAChrNumeroPed, @varTRAChrNumeroTrb, @varASEChrNumeroTrb, @varEstatusProcLiqP, @varMensajeProcLiqP  

                SET @varIntConsTransac = @varIntConsTransac + 1

            END --//------------------------------------------- --//FIN Mientras existan transacciones de pedido a liquidar 

            SET @salEstatusProc = 1

            COMMIT TRANSACTION 

            --//Selecciona la información con el resultado de la liquidación masiva de pedidos
            SELECT 
                TRA_ChrNumeroPed, TRA_ChrNumeroTrb, ASE_ChrNumeroTrb, LIQ_BitEstatusProc, LIQ_ChrMensajeProc
            FROM @varTBL_TransacPedLIQ ORDER BY TRA_ChrNumeroPed
        
    END TRY
    BEGIN CATCH

        --//-- SEGMENTO PARA LA RECUPERACION DE LOS DETALLES DE ERROR --//--
        DECLARE @ERROR VARCHAR(620)  SET @ERROR     = (SELECT ERROR_MESSAGE())
        DECLARE @STATE INT           SET @STATE     = (SELECT ERROR_STATE())
        DECLARE @SEVERITY INT        SET @SEVERITY  = (SELECT ERROR_SEVERITY())
        DECLARE @LINE INT            SET @LINE      = (SELECT ERROR_LINE())
        
        SET @salMensajeProc = @ERROR
        SET @salEstatusProc = 0
        
        ROLLBACK TRANSACTION
                
        RAISERROR(@ERROR,@SEVERITY,@STATE)

    END CATCH
END
GO

