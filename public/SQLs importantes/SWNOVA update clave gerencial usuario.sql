
DECLARE 
	 @varEMPIntCodigo INT
	,@varUSUIntCodigo INT
	,@varUSUChrClaveG VARCHAR(25)

SELECT 
	 @varEMPIntCodigo = 3
	,@varUSUIntCodigo = 2
	,@varUSUChrClaveG = 'Zxcv123456'
	


--SELECT 
--	CONVERT(VARCHAR(250), DECRYPTBYPASSPHRASE('KIDFAROCADENJK',USU_BinClaveGerencial)), * 	
--FROM  swe.SWTEMP_USUARIO
--WHERE EMP_IntCodigo = @varEMPIntCodigo


SELECT 
	CONVERT(VARCHAR(250), DECRYPTBYPASSPHRASE('KIDFAROCADENJK',USU_BinClaveGerencial)), * 	
FROM  swe.SWTEMP_USUARIO
WHERE EMP_IntCodigo = @varEMPIntCodigo
AND USU_IntCodigo = @varUSUIntCodigo


	
--UPDATE 
--	swe.SWTEMP_USUARIO
--SET 
--	USU_BinClaveGerencial =  ENCRYPTBYPASSPHRASE('KIDFAROCADENJK',@varUSUChrClaveG)
--WHERE 
--	EMP_IntCodigo = @varEMPIntCodigo AND
--  USU_IntCodigo = @varUSUIntCodigo
--GO