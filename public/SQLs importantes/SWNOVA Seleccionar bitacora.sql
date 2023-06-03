/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [EMP_IntCodigo]
      ,[BIT_IntTipo]
      ,[USU_IntCodigo]
      ,[BIT_FecFecha]
      ,[BIT_ChrTabla]
      ,CONVERT(VARCHAR(MAX),DECRYPTBYPASSPHRASE('KIDFAROCADENJK', [BIT_BinDatos]))
  FROM [SYSWEB_BIT].[swe].[SWTCOM_BITGENERAL]
--  WHERE ISNULL(CONVERT(VARCHAR(MAX),DECRYPTBYPASSPHRASE('KIDFAROCADENJK', [BIT_BinDatos])),'1')='1'
WHERE BIT_ChrTabla='SWTCOM_LDESCUENTOS'
ORDER BY BIT_FecFecha