    
    
DECLARE @RC int
DECLARE @entEMPIntCodigo int = xx
DECLARE @entTRAChrNumero varchar(25) = 'FAC-00000125'
DECLARE @entKEYChrEncripta varchar(25) = 'KIDFAROCADENJK'
DECLARE @salASEChrNumero varchar(25) = ''
DECLARE @salEstatusProc bit = 0
DECLARE @salMensajeProc varchar(150) = ''


EXECUTE @RC = [SYSWEB_ACT].[swe].[pr_InsCOM_TRANSAC_ASIENTO] 
   @entEMPIntCodigo
  ,@entTRAChrNumero
  ,@entKEYChrEncripta
  ,@salASEChrNumero OUTPUT
  ,@salEstatusProc OUTPUT
  ,@salMensajeProc OUTPUT


SELECT @salASEChrNumero, @salEstatusProc, @salMensajeProc