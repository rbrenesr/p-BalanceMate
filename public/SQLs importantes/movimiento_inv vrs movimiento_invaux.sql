select * from swe.SWTCOM_MOVIMIENTO_INVAUX 
where EMP_IntCodigo = 48
and TRA_ChrNumero in (


select TRA_ChrNumero from swe.SWTCOM_TRANSACCION_ENC
where TRA_ChrNumero in (
select distinct TRA_ChrNumero from swe.SWTCOM_MOVIMIENTO_INVAUX 
where EMP_IntCodigo= 48 
and MINV_FecFechaPrc > '2018-01-01'
and TRA_ChrNumero not in (
select TRA_ChrNumero from swe.SWTCOM_MOVIMIENTO_INV
where EMP_IntCodigo= 48 
and MINV_FecFechaPrc > '2018-01-01'
)
)
)
