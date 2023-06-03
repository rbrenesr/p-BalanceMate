
--/BORRAR EMPRESA-----------------------------------/--
--/ Script que permite eliminar una empresa			/--
--/ y todos sus registros, en las diferentes tablas	/--
--/ de la base de datos								/--
--/-------------------------------------------------/--

DECLARE
	 @entEMPIntCodigo	INT
	,@entUSUIntCodigo	INT
	,@entKEYChrEncripta	VARCHAR(25)
	,@salEMPChrNombre	VARCHAR(250)
	,@salEstatusProc	BIT	
	,@salMensajeProc	VARCHAR(150)	
	
SELECT
	 @entEMPIntCodigo	= 44 
	,@entUSUIntCodigo	= 1
	,@entKEYChrEncripta	= 'KIDFAROCADENJK'
	,@salEMPChrNombre	= ''
	,@salEstatusProc	= 0
	,@salMensajeProc	= ''

EXECUTE [swe].[pr_DelEMP_EMPRESA_TOTAL]
	 @entEMPIntCodigo		
	,@entUSUIntCodigo		
	,@entKEYChrEncripta		
	,@salEMPChrNombre	OUTPUT
	,@salEstatusProc	OUTPUT
	,@salMensajeProc	OUTPUT
	
SELECT 
	 @salEMPChrNombre AS '@salEMPChrNombre'
	,@salEstatusProc  AS '@salEstatusProc'
	,@salMensajeProc  AS '@salMensajeProc'		
GO