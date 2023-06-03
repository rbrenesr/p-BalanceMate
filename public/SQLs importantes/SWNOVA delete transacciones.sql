USE SYSWEB_ACT

DECLARE @varEMP_IntCodigo  int
DECLARE @varTRA_ChrNumero VARCHAR(50)
DECLARE  @varASE_ChrNumero VARCHAR(50)

set @varEMP_IntCodigo = 69
SET  @varTRA_ChrNumero = 'AIV-00000001' 
select @varASE_ChrNumero =  ASE_ChrNumeroRef from swe.SWTCOM_TRANSACCION_ENC 
where EMP_IntCodigo = @varEMP_IntCodigo and TRA_ChrNumero = @varTRA_ChrNumero

-- OJO VALIDAR SI ES DE CONTADO PARA CAMBIAR LA CAJA 

DELETE FROM swe.SWTCOM_TRANSAC_DETINV_IMP WHERE EMP_IntCodigo = @varEMP_IntCodigo
AND TRA_ChrNumero = @varTRA_ChrNumero 
DELETE FROM swe.SWTCOM_TRANSAC_DETINV_DES WHERE EMP_IntCodigo = @varEMP_IntCodigo
AND TRA_ChrNumero = @varTRA_ChrNumero 
DELETE FROM swe.SWTCOM_TRANSAC_DETINV_ACC WHERE EMP_IntCodigo = @varEMP_IntCodigo
AND TRA_ChrNumero = @varTRA_ChrNumero 
DELETE FROM swe.SWTCOM_TRANSAC_DETINV WHERE EMP_IntCodigo = @varEMP_IntCodigo
AND TRA_ChrNumero = @varTRA_ChrNumero 
DELETE FROM swe.SWTFNC_CONCIL_DET_SNCONC WHERE EMP_IntCodigo = @varEMP_IntCodigo
AND TRA_ChrNumero = @varTRA_ChrNumero 
DELETE FROM swe.SWTFNC_CONCIL_DET_SSCONC WHERE EMP_IntCodigo = @varEMP_IntCodigo
AND TRA_ChrNumero = @varTRA_ChrNumero 
DELETE FROM swe.SWTCOM_TRANSAC_DETCTA WHERE EMP_IntCodigo = @varEMP_IntCodigo
AND TRA_ChrNumero = @varTRA_ChrNumero 
DELETE FROM  swe.SWTCOM_TRANSAC_DETDOC WHERE EMP_IntCodigo = @varEMP_IntCodigo
AND TRA_ChrNumero = @varTRA_ChrNumero 
DELETE FROM  swe.SWTCOM_TRANSAC_DETADU WHERE EMP_IntCodigo = @varEMP_IntCodigo
AND TRA_ChrNumero = @varTRA_ChrNumero 
DELETE FROM swe.SWTCOM_TRANSAC_DETEST  WHERE EMP_IntCodigo = @varEMP_IntCodigo
AND TRA_ChrNumero = @varTRA_ChrNumero 
DELETE FROM swe.SWTCOM_TRANSAC_DETMOT WHERE EMP_IntCodigo = @varEMP_IntCodigo
AND TRA_ChrNumero = @varTRA_ChrNumero 
DELETE FROM swe.SWTCOM_MOVIMIENTO_TER WHERE EMP_IntCodigo = @varEMP_IntCodigo
AND TRA_ChrNumero = @varTRA_ChrNumero 
DELETE FROM swe.SWTCOM_TRANSAC_DETOCA WHERE EMP_IntCodigo = @varEMP_IntCodigo
AND TRA_ChrNumero = @varTRA_ChrNumero 
DELETE FROM swe.SWTCOM_TRANSAC_DETMPG WHERE  EMP_IntCodigo = @varEMP_IntCodigo
AND TRA_ChrNumero = @varTRA_ChrNumero 
DELETE FROM swe.SWTCOM_MOVIMIENTO_INV WHERE  EMP_IntCodigo = @varEMP_IntCodigo
AND TRA_ChrNumero = @varTRA_ChrNumero 
DELETE FROM SWE.SWTCOM_TRANSACCION_ENC WHERE EMP_IntCodigo = @varEMP_IntCodigo
AND TRA_ChrNumero = @varTRA_ChrNumero 
DELETE FROM SWE.SWTCON_ASIENTO_DET WHERE EMP_IntCodigo = @varEMP_IntCodigo
AND ASE_ChrNumero =@varASE_ChrNumero
DELETE FROM SWE.SWTCON_ASIENTO_ENC_X_EST WHERE EMP_IntCodigo = @varEMP_IntCodigo
AND ASE_ChrNumero =@varASE_ChrNumero
DELETE FROM SWE.SWTCON_ASIENTO_ENC WHERE EMP_IntCodigo = @varEMP_IntCodigo
AND ASE_ChrNumero =@varASE_ChrNumero


