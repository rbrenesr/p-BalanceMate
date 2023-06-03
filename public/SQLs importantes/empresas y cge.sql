select 
	c.CGE_IntCodigo as coigoCGE,
	e.EMP_IntCodigo as codemp,
	c.CGE_ChrNombre as nombreCGE,
	right('000' + CONVERT(varchar,e.EMP_IntCodigo),3) as codigoEmpresa,
	e.EMP_ChrNombre as empresa
from swe.SWTEMP_EMPRESA e
inner join swe.SWTEMP_CGE c
on e.CGE_IntCodigo = c.CGE_IntCodigo
order by e.EMP_IntCodigo
