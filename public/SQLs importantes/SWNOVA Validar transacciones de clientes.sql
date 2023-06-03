
select * from swe.SWTCOM_TRANSACCION_ENC WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35

select * from swe.SWTCOM_TRANSAC_DETINV WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35
select * from swe.SWTCOM_TRANSAC_DETINV_ACC WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35
select * from swe.SWTCOM_TRANSAC_DETINV_SER WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35
select * from swe.SWTCOM_TRANSAC_DETINV_IMP WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35
select * from swe.SWTCOM_TRANSAC_DETINV_DES WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35

select * from swe.SWTCOM_TRANSAC_DETMOT WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35

select * from swe.SWTCOM_TRANSAC_DETCTA WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35

select * from swe.SWTCOM_MOVIMIENTO_INV WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35 ORDER BY MINV_IntConsecutivo 
select * from swe.SWTCOM_MOVIMIENTO_INVSER WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35 
select * from swe.SWTCOM_MOVIMIENTO_TER WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35 

select * from swe.SWTCON_ASIENTO_ENC where ASE_ChrNumero = (select ASE_ChrNumeroRef from swe.SWTCOM_TRANSACCION_ENC WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35) and emp_intcodigo=35
select * from swe.SWTCON_ASIENTO_DET where ASE_ChrNumero = (select ASE_ChrNumeroRef from swe.SWTCOM_TRANSACCION_ENC WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35) and emp_intcodigo=35

select * from swe.SWTCOM_TRANSAC_DETEST WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35
select * from swe.SWTCOM_TRANSAC_DETOCA WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35
select * from swe.SWTCOM_TRANSAC_DETMPG WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35
select * from swe.SWTCOM_TRANSAC_DETCTO WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35


--select * from swe.SWTCOM_BODEGA where emp_intcodigo=35


--select * from swe.SWTCON_ASIENTO_ENC WHERE ASE_ChrDocumentoRef='REC-00000007' and emp_intcodigo=35

--SELECT * FROM swe.SWTCOM_TRANSAC_TIP_X_ATR WHERE TTP_ChrCodigo = (select TTP_ChrCodigo from swe.SWTCOM_TRANSACCION_ENC WHERE TRA_ChrNumero = 'REC-00000007' and emp_intcodigo=35)



