-- Actualiza el valor de atributo para tipos de transacción

declare @EMP_IntCodigo int
declare @TTP_ChrCodigo varchar(50)
declare @ATR_ChrClave varchar(50)
declare @TXA_ChrDato varchar(50)

set @EMP_IntCodigo = 43
set @TTP_ChrCodigo ='RHUPLN0001'
set @ATR_ChrClave = 'PLNFecIni'
set @TXA_ChrDato = '10/01/2016 00:00:01 AM'


select * from swe.SWTCOM_TRANSAC_TIP_X_ATR
where EMP_IntCodigo = @EMP_IntCodigo
and TTP_ChrCodigo = @TTP_ChrCodigo
and ATR_ChrClave = @ATR_ChrClave


--update swe.SWTCOM_TRANSAC_TIP_X_ATR
--set TXA_ChrDato = @TXA_ChrDato
--where EMP_IntCodigo = @EMP_IntCodigo
--and TTP_ChrCodigo = @TTP_ChrCodigo
--and ATR_ChrClave = @ATR_ChrClave