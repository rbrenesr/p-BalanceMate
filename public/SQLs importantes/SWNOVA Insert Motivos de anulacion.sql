DECLARE @entEMPIntCodigo INT 
SET @entEMPIntCodigo = 50 -- OJO CAMBIAR CODIGO DE EMPRESA  

-- verifica SI HAY MOTIVOS GENERADOS PARA TOMAR EL SIGUIENTE MOT_INTCODIGO 

SELECT * FROM SWE.SWTCOM_TRANSAC_MOT WHERE EMP_IntCodigo = @entEMPIntCodigo

INSERT INTO SWE.SWTCOM_TRANSAC_MOT
SELECT @entEMPIntCodigo, 1, 'CLIDFC','Anulaci�n Gral. Dif. Cam. CLI','Anulaci�n Gral. Dif. Cam. CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 2, 'CLICOT','Anulaci�n Gral. Cotizaciones CLI','Anulaci�n Gral. Cotizaciones CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 3, 'CLINCD','Anulacion Gral. NCR x Devoluci�n CLI','Anulacion Gral. NCR x Devoluci�n CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 4, 'CLINCM','Anulaci�n Gral. NCR x Monto CLI','Anulaci�n Gral. NCR x Monto CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 5, 'CLINDM','Anulaci�n Gral. NDB x Monto CLI','Anulaci�n Gral. NDB x Monto CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 6, 'CLIPED','Anulaci�n Gral. Pedidos CLI','Anulaci�n Gral. Pedidos CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 7, 'CLIREC','Anulaci�n Gral.Recibos CLI','Anulaci�n Gral.Recibos CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 8, 'CLISAF','Anulacion Gral. Saldos a Favor CLI','Anulacion Gral. Saldos a Favor CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 9, 'CLIVEN','Anulaci�n Gral. Facturas CLI','Anulaci�n Gral. Facturas CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 10, 'DSPBIT','Anulaci�n Gral. de Bit�coras DSP','Anulaci�n Gral. de Bit�coras DSP','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 11, 'DSPDSC','Anulaci�n Gral. Despacho CLI','Anulaci�n Gral. Despacho CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 12, 'INVACT','Anulaci�n Gral. Actualizaci�n INV','Anulaci�n Gral. Actualizaci�n INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 13, 'INVAJN','Anulaci�n Gral. Ajuste Neg. INV','Anulaci�n Gral. Ajuste Neg. INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 14, 'INVAJP','Anulaci�n Gral. Ajuste Pos INV','Anulaci�n Gral. Ajuste Pos INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 15, 'INVENS','Anulaci�n Gral. Ensamble INV','Anulaci�n Gral. Ensamble INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 16, 'INVENT','Anulaci�n Gral. Entradas INV','Anulaci�n Gral. Entradas INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 17, 'INVREQ','Anulaci�n Gral. Requisici�n INV','Anulaci�n Gral. Requisici�n INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 18, 'INVSAL','Anulaci�n Gral. Salidas INV','Anulaci�n Gral. Salidas INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 19, 'INVTFI','Anulaci�n Gral. Toma F�sica INV','Anulaci�n Gral. Toma F�sica INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 20, 'INVTRB','Anulaci�n Gral.Trasl. Bodega INV','Anulaci�n Gral.Trasl. Bodega INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 21, 'PRVDFC','Anulaci�n Gral. Ajuste Dif. Cambiario PRV','Anulaci�n Gral. Ajuste Dif. Cambiario PRV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 22, 'PRVCOM','Anulaci�n Gral. Compras PRV','Anulaci�n Gral. Compras PRV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 23, 'PRVCNS','Anulaci�n Gral. Consolidaci�n Docs PRV','Anulaci�n Gral. Consolidaci�n Docs PRV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 24, 'PRVIMP','Anulaci�n Gral. Importaciones PRV','Anulaci�n Gral. Importaciones PRV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 25, 'PRVNCA','Anulaci�n Gral. NCR Abierta PRV','Anulaci�n Gral. NCR Abierta PRV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 26, 'PRVNCM','Anulaci�n Gral. NCR x Monto PRV','Anulaci�n Gral. NCR x Monto PRV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 27, 'PRVNDM','Anulaci�n Gral. NDB x Monto PRV','Anulaci�n Gral. NDB x Monto PRV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 28, 'PRVOCO','Anulacion Gral. Orden de Compra PRV','Anulacion Gral. Orden de Compra PRV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 29, 'FNCCHK','Anulaci�n Gral. Cks FNC','Anulaci�n Gral. Cks FNC','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 30, 'FNCDPB','Anulaci�n Gral. Dep. Bancario FNC','Anulaci�n Gral. Dep. Bancario FNC','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 31, 'FNCLMP','Anulaci�n Gral. Lote de Dep�sito x Medio de Pago FNC','Anulaci�n Gral. Lote de Dep�sito x Medio de Pago FNC','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 32, 'FNCNCB','Anulaci�n Gral. NCR Bancaria FNC','Anulaci�n Gral. NCR Bancaria FNC','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 33, 'FNCNDB','Anulaci�n Gral. NDB Bancaria FNC','Anulaci�n Gral. NDB Bancaria FNC','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 34, 'FNCSOL','Anulaci�n Gral. Solicitud de Pago FNC','Anulaci�n Gral. Solicitud de Pago FNC','ANU',0,GETDATE(),0, GETDATE() 
