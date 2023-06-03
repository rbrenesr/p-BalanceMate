select 
g.CGE_IntCodigo
,g.CGE_ChrNombre
,e.EMP_IntCodigo
,e.EMP_ChrNombre
 from swe.SWTEMP_EMPRESA e
inner join swe.SWTEMP_CGE g
on e.CGE_IntCodigo = g.CGE_IntCodigo
and g.CGE_ChrEstado = 'ACT'


