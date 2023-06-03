
--use SYSWEB_ACT
--use SYSWEB_ADM
--use SYSWEB_BIT
--use SYSWEB_INT
--use SYSWEB_REP

--despliega la lista de idiomas disponibles
execute sp_helplanguage 

-- get idioma actual
SELECT @@LANGUAGE AS 'Language Name' 

SET LANGUAGE us_english
exec sp_defaultlanguage sa, 'us_english'
exec sp_defaultlanguage swusrap, 'us_english'
exec sp_defaultlanguage swusrbk, 'us_english'
exec sp_defaultlanguage swusrcs, 'us_english'



