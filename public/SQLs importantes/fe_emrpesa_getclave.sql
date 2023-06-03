
select * from FETEMP_EMPRESA
where empChrNombreComercial like '%BL CONSULTING %'

DECLARE @pe_codEmpresa VARCHAR(50) = '0100100100000246'
DECLARE @pe_empKEYChrEncripta VARCHAR(25) = 'KEYFACTELECTSFD'

SELECT empchrmailcopia,
   CONVERT(VARCHAR(250),DECRYPTBYPASSPHRASE(@pe_empKEYChrEncripta,empBinClave)) AS empBinClave ,
   CONVERT(VARCHAR(250),DECRYPTBYPASSPHRASE(@pe_empKEYChrEncripta,empBinTokenClave)) AS empBinTokenClave,
  CONVERT(VARCHAR(250),DECRYPTBYPASSPHRASE(@pe_empKEYChrEncripta,empBinCertificadoClave)) AS empBinTokenClave,
  CONVERT(VARCHAR(250),DECRYPTBYPASSPHRASE(@pe_empKEYChrEncripta,empBinSiteClave)) AS empBinSiteClave
FROM FETEMP_EMPRESA
WHERE @pe_codEmpresa = empChrCodigo

