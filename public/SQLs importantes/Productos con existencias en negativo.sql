
declare @emp_IntCodigo int = 1

----Obtener las bodegas de reserva de la empresa en cuestion
--Select * from swe.SWTCOM_BODEGA where EMP_IntCodigo = @emp_IntCodigo and BOD_ChrTipo = 'RES'

declare @bodega varchar(5) = 'BR1'

----Selecciona de movimiento auxilizar la existencia actual menor a cero de todos los items de inv
--select inv_intcodigo,valor from 
--(
--	select 
--		inv_intcodigo,
--		SUM(MINV_MonCantMovido) as valor
--	from swe.SWTCOM_MOVIMIENTO_INVAUX
--	where EMP_IntCodigo = @emp_IntCodigo and BOD_ChrCodigo = @bodega 
--group by inv_intcodigo
--) t where valor < 0




----Selecciona los codigos de inv de todos los pedidos en estado 700-APL (pendientes de procesar a facturas)
--select distinct INV_IntCodigo 
--from swe.SWTCOM_TRANSAC_DETINV
--where EMP_IntCodigo = @emp_IntCodigo
--and TRA_ChrNumero in (
--						--Selecciona todos los pedidos en estado 700-APL (pendientes de procesar a facturas)
--						select TRA_ChrNumero from swe.SWTCOM_TRANSACCION_ENC where EMP_IntCodigo = @emp_IntCodigo and TRA_ChrNumero like 'PED%' and EST_ChrCodigo = '700-APL'
--)


