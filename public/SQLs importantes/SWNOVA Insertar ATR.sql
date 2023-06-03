--NoValPrecBajoCost
select * from swe.SWTCOM_TRANSAC_ATR where ATR_ChrClave like '%NoValPrecBajoCost%'

--insert into swe.SWTCOM_TRANSAC_ATR
--select 43,'NoValPrecBajoCost','No validar precio bajo costo',1,''	


select * from swe.SWTCOM_TRANSAC_CLA_X_ATR
where ATR_ChrClave = 'NoValPrecBajoCost'
--insert into swe.SWTCOM_TRANSAC_CLA_X_ATR
--select 43,	'CLICOT','NoValPrecBajoCost' union all
--select 43,	'CLIPED','NoValPrecBajoCost'union all
--select 43,	'CLIVEN','NoValPrecBajoCost'


select * from swe.SWTCOM_TRANSAC_TIP_X_ATR
where EMP_IntCodigo = 43
and ATR_ChrClave = 'NoValPrecBajoCost'
--insert into swe.SWTCOM_TRANSAC_TIP_X_ATR
--select 43, 'CLICOT0001',	'NoValPrecBajoCost','',	1,	'2015-09-11 14:22:43.170' union all
--select 43,	'CLIPED0001',	'NoValPrecBajoCost','',	1,	'2015-09-11 14:22:43.170'union all
--select 43,	'CLIVEN0001',	'NoValPrecBajoCost','',	1,	'2015-09-11 14:22:43.170'