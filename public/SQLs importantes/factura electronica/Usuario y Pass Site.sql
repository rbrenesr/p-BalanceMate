USE [FE_CRService]
GO
DECLARE @pe_codEmpresa VARCHAR(50) = '0200215200000001'
DECLARE @pe_empKEYChrEncripta VARCHAR(25) = 'KEYFACTELECTSFD'

SELECT
	empchrmailcopia,
    CONVERT(VARCHAR(250),DECRYPTBYPASSPHRASE(@pe_empKEYChrEncripta,empBinSiteClave)) AS empBinSiteClave
FROM FETEMP_EMPRESA

WHERE @pe_codEmpresa = empChrCodigo