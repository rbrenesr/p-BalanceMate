--//-- ----------------------------------------------------------------- --//--
--// LOS SCRIPTS QUE GENERE ESTA CONSULTA SE DEBEN DE EJECUTAR UNO POR UNO //--
--//-- ----------------------------------------------------------------- --//--




/*-----------------------------------------------------------------------------------------------*/

--//-- --------------------------------------------------------- --//--
/*  Ejecuta e imprime el query para reorganizar o reconstruir
    los índices que lo requieran, en una base de datos específica,
    donde su porcentaje de fragmentación sea mayor a 10% 
    y posean más de 1000 páginas idexadas.                         

 INSTRUCCIONES:
 [-1-] Asegúrese de que se encuentra en la BD correcta
 [-2-] La BD NO puede estar en uso por parte de los usuarios
 [-3-] Haga un backup antes de ejecutar el procedimiento
 [-4-] Ejecute el procedimiento para reorganizar los índices
 [-5-] Los scripts resultantes se deben ejecutar uno a uno
 [-6-] Reinie el servicio de Base de Datos
 [-7-] Pruebe el ingreso al sistema                             */
--//-- -------------------------------------------------------- --//--
--USE [SYSWEB_ACT]
GO

SET NOCOUNT ON;
DECLARE @objectId       int;
DECLARE @indexId        int;
DECLARE @partitionCount bigint;
DECLARE @schemaName     nvarchar(130);
DECLARE @objectName     nvarchar(130);
DECLARE @indexName      nvarchar(130);
DECLARE @partitionNum   bigint;
DECLARE @fragPercent    float;
DECLARE @command        nvarchar(4000) = N''; 

-- Selecciona índices de tablas en la función sys.dm_db_index_physical_stats
-- y convierte ID de BD al nombre de la base de datos actual [DB_ID()]
-- extrae aquellos indices que muestra un porcentaje de defragmentación
-- mayor al 10% con un tamaño superior a mil páginas indexadas.
SELECT
    object_id                    AS objectId,
    index_id                     AS indexId,
    partition_number             AS partitionNum,
    avg_fragmentation_in_percent AS fragPercent
INTO #TBLTMP_ListadoIndices
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL , NULL, 'LIMITED')
WHERE avg_fragmentation_in_percent > 10.0 AND index_id > 0 AND page_count > 1000;

-- Declara el cursor para la listar las particiones a procesar.
DECLARE CursorIndices CURSOR FOR SELECT * FROM #TBLTMP_ListadoIndices;

-- Apertura del cursor.
OPEN CursorIndices;

-- Recorrido de las particiones
WHILE (1=1) 
BEGIN
        FETCH NEXT FROM CursorIndices 
            INTO @objectId, @indexId, @partitionNum, @fragPercent;

        IF (@@FETCH_STATUS < 0) BREAK; --> Para salir del recorrido
        
        SELECT @objectName = QUOTENAME(o.name), @schemaName = QUOTENAME(s.name)
        FROM sys.objects AS o
        JOIN sys.schemas as s ON s.schema_id = o.schema_id
        WHERE o.object_id = @objectId;

        SELECT @indexName = QUOTENAME(name)
        FROM sys.indexes
        WHERE  object_id = @objectId AND index_id = @indexId;

        SELECT @partitionCount = count (*)
        FROM sys.partitions
        WHERE object_id = @objectId AND index_id = @indexId;

        -- 30 es un punto para establecer entre reorganizar y reconstruir el indice.
        IF @fragPercent < 30.0
            SET @command = N'ALTER INDEX ' + @indexName + N' ON ' + @schemaName + N'.' + @objectName + N' REORGANIZE';
        IF @fragPercent >= 30.0
            SET @command = N'ALTER INDEX ' + @indexName + N' ON ' + @schemaName + N'.' + @objectName + N' REBUILD';
        IF @partitionCount > 1
            SET @command = @command + N' PARTITION=' + CAST(@partitionNum AS nvarchar(10));
            
        --EXEC (@command);        --> Ejecuta el comando
        PRINT N'' + @command;   --> Imprime el comando
END --END WHILE

IF NOT(@command!=N'') PRINT N'NO HACE FALTA REORGANIZAR INDICES DE BD!!!';

-- Cierre y desasignación del cursor
CLOSE CursorIndices;
DEALLOCATE CursorIndices;

-- Borra la tabla temporal
DROP TABLE #TBLTMP_ListadoIndices;
GO
-----------------------------------------------------------------------------------------------





-----------------------------------------------------------------------------------------------
/*
--//-- -------------------------------------------------------------- --//--
--  EJEMPLO PARA CORRER LA RECONSTRUCCION DE LOS INDICES DE FORMA MANUAL
--//-- -------------------------------------------------------------- --//--
USE [SYSWEB_ACT]
GO

ALTER INDEX [PK_SWTCOM_MOVIMIENTO_INV] ON [swe].[SWTCOM_MOVIMIENTO_INV] REBUILD
ALTER INDEX [PK_SWTCOM_TRANSAC_DETINV_DES] ON [swe].[SWTCOM_TRANSAC_DETINV_DES] REBUILD
ALTER INDEX [PK_SWTCOM_TRANSAC_DETINV_IMP] ON [swe].[SWTCOM_TRANSAC_DETINV_IMP] REBUILD
ALTER INDEX [PK_SWTCOM_TRANSACCION_ENC] ON [swe].[SWTCOM_TRANSACCION_ENC] REBUILD
ALTER INDEX [PK_SWTRHU_ACCION_PERSONAL_DETATR] ON [swe].[SWTRHU_ACCION_PERSONAL_DETATR] REBUILD
ALTER INDEX [PK_SWTRHU_PLANILLA_DETCSAL] ON [swe].[SWTRHU_PLANILLA_DETCSAL] REBUILD
ALTER INDEX [PK_SWTCON_ASIENTO_ENC] ON [swe].[SWTCON_ASIENTO_ENC] REBUILD
ALTER INDEX [PK_SWTRHU_PLANILLA_DETCSAL_DETBAND] ON [swe].[SWTRHU_PLANILLA_DETCSAL_DETBAND] REBUILD
ALTER INDEX [PK_SWTCOM_TRANSAC_DETMPG] ON [swe].[SWTCOM_TRANSAC_DETMPG] REBUILD
ALTER INDEX [PK_SWTCON_ASIENTO_DET_1] ON [swe].[SWTCON_ASIENTO_DET] REBUILD
ALTER INDEX [PK_SWTCOM_TRANSAC_DETCTA] ON [swe].[SWTCOM_TRANSAC_DETCTA] REBUILD
ALTER INDEX [PK_SWTCOM_TRANSAC_DETMOT] ON [swe].[SWTCOM_TRANSAC_DETMOT] REBUILD
ALTER INDEX [PK_SWTRHU_PLANILLA_DETCSAL_DETCSAL] ON [swe].[SWTRHU_PLANILLA_DETCSAL_DETCSAL] REBUILD
ALTER INDEX [PK_SWTCOM_MOVIMIENTO_TER] ON [swe].[SWTCOM_MOVIMIENTO_TER] REBUILD
ALTER INDEX [PK_SWTEMP_PERFIL_X_ACCESO] ON [swe].[SWTEMP_PERFIL_X_ACCESO] REBUILD
ALTER INDEX [PK_SWTFNC_CONCIL_DET_SSCONC] ON [swe].[SWTFNC_CONCIL_DET_SSCONC] REBUILD
ALTER INDEX [PK_SWTCOM_MOVIMIENTO_INVAUX] ON [swe].[SWTCOM_MOVIMIENTO_INVAUX] REBUILD
ALTER INDEX [PK_SWTCON_ASIENTO_ENC_X_EST] ON [swe].[SWTCON_ASIENTO_ENC_X_EST] REBUILD
ALTER INDEX [PK_SWTCOM_INVENTARIO_X_CATALOGO] ON [swe].[SWTCOM_INVENTARIO_X_CATALOGO] REORGANIZE
ALTER INDEX [PK__SWTCOM_T__760C1DCE513D5D52] ON [swe].[SWTCOM_TRANSAC_DETOCA] REBUILD
ALTER INDEX [PK_SWTCOM_TRANSAC_DETINV] ON [swe].[SWTCOM_TRANSAC_DETINV] REBUILD
ALTER INDEX [PK_SWTCOM_TRANSAC_DETEST] ON [swe].[SWTCOM_TRANSAC_DETEST] REBUILD
ALTER INDEX [PK_SWTCOM_INVENTARIO] ON [swe].[SWTCOM_INVENTARIO] REORGANIZE
*/
-----------------------------------------------------------------------------------------------


