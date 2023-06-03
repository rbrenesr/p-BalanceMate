DECLARE @entEMPIntCodigo INT
SET @entEMPIntCodigo = 61  --OJO COLOCAR CODIGO DE LA EMPRESA

--- TIPOS ASIENTO ----- 

SELECT * FROM swe.SWTCON_TIPO_ASIENTO WHERE EMP_IntCodigo = @entEMPIntCodigo


INSERT INTO swe.SWTCON_TIPO_ASIENTO
SELECT @entEMPIntCodigo,'A01','CON - (C01) - Asiento de diario','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'A02','CON - (C02) - Asiento gastos','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'A03','CON - (C03) - Asiento de ajuste','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'A04','CON - (A04) - Ajustes por dif. cambiario','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'A05','CON - (A05) - Ajustes Planillas','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C01','CLI - (C01) - Cotización','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C02','CLI - (C02) - Pedido','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C03','CLI - (C03) - Venta','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C04','CLI - (C04) - Nota de crédito x dev','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C05','CLI - (C05) - Nota de crédito x monto','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C06','CLI - (C06) - Nota de débito x monto','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C07','CLI - (C07) - Recibos','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C08','CLI - (C08) - Saldos a favor','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C09','CLI - (C09) - Ajustes de caja','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'D01','DSP - (D01) - Bitácora','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F01','FNC - (F01) - Depósito bancario','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F02','FNC - (F02) - Nota de crédito bancaria','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F03','FNC - (F03) - Nota de débito bancaria','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F04','FNC - (F04) - Conciliación bancaria','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F05','FNC - (F05) - Solicitud de pago','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F06','FNC - (F06) - Cheque','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F07','FNC - (F07) - Transferencias','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F08','FNC - (F08) - Lote de medio de pago','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F09','FNC - (F09) - Caja Chica','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'I01','INV - (I01) - Actualización de inv','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'I02','INV - (I02) - Ajuste positivo','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'I03','INV - (I03) - Ajuste negativo','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'I04','INV - (I04) - Requisición','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'I05','INV - (I05) - Toma física','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'I06','INV - (I06) - Traslado de bodega','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'I07','INV - (I07) - Entradas de inv','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'I08','INV - (I08) - Salidas de inv','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'P01','PRV - (P01) - Orden de compra','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'P02','PRV - (P02) - Compra','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'P03','PRV - (P03) - Importación','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'P04','PRV - (P04) - Concolidación de documento','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'P05','PRV - (P05) - Nota crédito x monto','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'P06','PRV - (P06) - Nota débito x monto','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'P07','PRV - (P07) - Nota crédito abierta','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'P08','PRV - (P08) - Consolidacion IMP','0','0','1900-01-01','0','1900-01-01' 

--- TIPOS DOCUMENTO ----- 

SELECT * FROM swe.SWTCON_TIPO_DOCUMENTO WHERE EMP_IntCodigo = @entEMPIntCodigo 


INSERT INTO swe.SWTCON_TIPO_DOCUMENTO
SELECT @entEMPIntCodigo,'A01','CON - (C01) - Asiento de diario','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'A02','CON - (C02) - Asiento gastos','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'A03','CON - (C03) - Asiento de ajuste','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'A04','CON - (A04) - Ajustes por dif. cambiario','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'A05','CON - (A05) - Ajustes Planillas','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C01','CLI - (C01) - Cotización','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C02','CLI - (C02) - Pedido','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C03','CLI - (C03) - Venta','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C04','CLI - (C04) - Nota de crédito x dev','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C05','CLI - (C05) - Nota de crédito x monto','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C06','CLI - (C06) - Nota de débito x monto','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C07','CLI - (C07) - Recibos','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C08','CLI - (C08) - Saldos a favor','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'C09','CLI - (C09) - Ajustes de caja','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'D01','DSP - (D01) - Bitácora','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F01','FNC - (F01) - Depósito bancario','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F02','FNC - (F02) - Nota de crédito bancaria','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F03','FNC - (F03) - Nota de débito bancaria','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F04','FNC - (F04) - Conciliación bancaria','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F05','FNC - (F05) - Solicitud de pago','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F06','FNC - (F06) - Cheque','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F07','FNC - (F07) - Transferencias','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F08','FNC - (F08) - Lote de medio de pago','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'F09','FNC - (F09) - Caja Chica','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'I01','INV - (I01) - Actualización de inv','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'I02','INV - (I02) - Ajuste positivo','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'I03','INV - (I03) - Ajuste negativo','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'I04','INV - (I04) - Requisición','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'I05','INV - (I05) - Toma física','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'I06','INV - (I06) - Traslado de bodega','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'I07','INV - (I07) - Entradas de inv','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'I08','INV - (I08) - Salidas de inv','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'P01','PRV - (P01) - Orden de compra','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'P02','PRV - (P02) - Compra','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'P03','PRV - (P03) - Importación','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'P04','PRV - (P04) - Concolidación de documento','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'P05','PRV - (P05) - Nota crédito x monto','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'P06','PRV - (P06) - Nota débito x monto','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'P07','PRV - (P07) - Nota crédito abierta','0','0','1900-01-01','0','1900-01-01' UNION ALL
SELECT @entEMPIntCodigo,'P08','PRV - (P08) - Consolidacion IMP','0','0','1900-01-01','0','1900-01-01' 
