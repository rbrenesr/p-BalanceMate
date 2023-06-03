USE SYSWEB_ACT
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'pr_DelEMP_EMPRESA_TOTAL')		
	DROP PROCEDURE [swe].[pr_DelEMP_EMPRESA_TOTAL]
GO




delete from swe.SWTEMP_CGE
where CGE_IntCodigo = xx

delete from swe.SWTADM_APPSERVER 
where CGE_IntCodigo = xx

delete  from swe.SWTADM_CONFIGURACION 
where CGE_IntCodigo = xx

