-----------------------------------------------------------------------------------------------
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
 [-5-] El procedimiento pude tardar hasta 10 min
 [-6-] Reinie el servicio de Base de Datos
 [-7-] Pruebe el ingreso al sistema                             */
--//-- -------------------------------------------------------- --//--
USE [SYSWEB_ACT_VMATHER]
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


