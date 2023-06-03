DECLARE @entEMPIntCodigo INT 
SET @entEMPIntCodigo = 50 -- OJO CAMBIAR CODIGO DE EMPRESA  

-- verifica SI HAY MOTIVOS GENERADOS PARA TOMAR EL SIGUIENTE MOT_INTCODIGO 

SELECT * FROM SWE.SWTCOM_TRANSAC_MOT WHERE EMP_IntCodigo = @entEMPIntCodigo

INSERT INTO SWE.SWTCOM_TRANSAC_MOT
SELECT @entEMPIntCodigo, 1, 'CLIDFC','Anulación Gral. Dif. Cam. CLI','Anulación Gral. Dif. Cam. CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 2, 'CLICOT','Anulación Gral. Cotizaciones CLI','Anulación Gral. Cotizaciones CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 3, 'CLINCD','Anulacion Gral. NCR x Devolución CLI','Anulacion Gral. NCR x Devolución CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 4, 'CLINCM','Anulación Gral. NCR x Monto CLI','Anulación Gral. NCR x Monto CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 5, 'CLINDM','Anulación Gral. NDB x Monto CLI','Anulación Gral. NDB x Monto CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 6, 'CLIPED','Anulación Gral. Pedidos CLI','Anulación Gral. Pedidos CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 7, 'CLIREC','Anulación Gral.Recibos CLI','Anulación Gral.Recibos CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 8, 'CLISAF','Anulacion Gral. Saldos a Favor CLI','Anulacion Gral. Saldos a Favor CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 9, 'CLIVEN','Anulación Gral. Facturas CLI','Anulación Gral. Facturas CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 10, 'DSPBIT','Anulación Gral. de Bitácoras DSP','Anulación Gral. de Bitácoras DSP','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 11, 'DSPDSC','Anulación Gral. Despacho CLI','Anulación Gral. Despacho CLI','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 12, 'INVACT','Anulación Gral. Actualización INV','Anulación Gral. Actualización INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 13, 'INVAJN','Anulación Gral. Ajuste Neg. INV','Anulación Gral. Ajuste Neg. INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 14, 'INVAJP','Anulación Gral. Ajuste Pos INV','Anulación Gral. Ajuste Pos INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 15, 'INVENS','Anulación Gral. Ensamble INV','Anulación Gral. Ensamble INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 16, 'INVENT','Anulación Gral. Entradas INV','Anulación Gral. Entradas INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 17, 'INVREQ','Anulación Gral. Requisición INV','Anulación Gral. Requisición INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 18, 'INVSAL','Anulación Gral. Salidas INV','Anulación Gral. Salidas INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 19, 'INVTFI','Anulación Gral. Toma Física INV','Anulación Gral. Toma Física INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 20, 'INVTRB','Anulación Gral.Trasl. Bodega INV','Anulación Gral.Trasl. Bodega INV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 21, 'PRVDFC','Anulación Gral. Ajuste Dif. Cambiario PRV','Anulación Gral. Ajuste Dif. Cambiario PRV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 22, 'PRVCOM','Anulación Gral. Compras PRV','Anulación Gral. Compras PRV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 23, 'PRVCNS','Anulación Gral. Consolidación Docs PRV','Anulación Gral. Consolidación Docs PRV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 24, 'PRVIMP','Anulación Gral. Importaciones PRV','Anulación Gral. Importaciones PRV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 25, 'PRVNCA','Anulación Gral. NCR Abierta PRV','Anulación Gral. NCR Abierta PRV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 26, 'PRVNCM','Anulación Gral. NCR x Monto PRV','Anulación Gral. NCR x Monto PRV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 27, 'PRVNDM','Anulación Gral. NDB x Monto PRV','Anulación Gral. NDB x Monto PRV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 28, 'PRVOCO','Anulacion Gral. Orden de Compra PRV','Anulacion Gral. Orden de Compra PRV','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 29, 'FNCCHK','Anulación Gral. Cks FNC','Anulación Gral. Cks FNC','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 30, 'FNCDPB','Anulación Gral. Dep. Bancario FNC','Anulación Gral. Dep. Bancario FNC','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 31, 'FNCLMP','Anulación Gral. Lote de Depósito x Medio de Pago FNC','Anulación Gral. Lote de Depósito x Medio de Pago FNC','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 32, 'FNCNCB','Anulación Gral. NCR Bancaria FNC','Anulación Gral. NCR Bancaria FNC','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 33, 'FNCNDB','Anulación Gral. NDB Bancaria FNC','Anulación Gral. NDB Bancaria FNC','ANU',0,GETDATE(),0, GETDATE() UNION ALL
SELECT @entEMPIntCodigo, 34, 'FNCSOL','Anulación Gral. Solicitud de Pago FNC','Anulación Gral. Solicitud de Pago FNC','ANU',0,GETDATE(),0, GETDATE() 
