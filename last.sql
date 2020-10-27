SELECT b.ID, b.DateZ, b.Nomer, b.Svid_Seria, b.Svid_nomer,
b.ON_Familia, b.ON_Name, b.ON_Otch, b.ON_DateR, b.ON_OBRAZ, b.ON_NATION, b.ON_GRAG, b.DATE_ANUL,
b.ONA_Familia, b.ONA_Name, b.ONA_Otch, b.ONA_DateR, b.ONA_OBRAZ, b.ONA_NATION, b.ONA_GRAG, b.POLE_GRN,
b.ON_SVID , b.ONA_SVID, b.Vosstan, b.ID_ZAGS, b.ON_ONLYGOD, b.ONA_ONLYGOD, b.NAME_ZAGS, b.ON_DOKUMENT, b.ON_IDENTIF, b.ONA_DOKUMENT,
b.ON_VOZR , b.ONA_VOZR, ' ' ON_M_ADRES1, ' ' ONA_M_ADRES1, b.ONA_IDENTIF, b.ON_FAMILIAP, b.ONA_FAMILIAP, b.ID_SOURCE, b.osnov,
TRUNCATE(TIMESTAMPDIFF(SQL_TSI_MONTH,b.on_dater,b.datez)/12,0)-IIF(month(b.on_dater)=month(b.datez), IIF(dayofmonth(b.on_dater)-dayofmonth(b.datez)>0,1,0),0) as ON_VozrR,
TRUNCATE(TIMESTAMPDIFF(SQL_TSI_MONTH,b.ona_dater,datez)/12,0)-IIF(month(ona_dater)=month(datez), IIF(dayofmonth(ona_dater)-dayofmonth(datez)>0,1,0),0) as ONA_VozrR,
b.ON_DOK_TYPE, b.ON_DOK_DATE, b.ON_DOK_SERIA, b.ON_DOK_NOMER, b.ON_DOK_ORGAN,
b.ONA_DOK_TYPE, b.ONA_DOK_DATE, b.ONA_DOK_SERIA, b.ONA_DOK_NOMER, b.ONA_DOK_ORGAN, b.SUM_POSHLINA,
b.ON_M_DOM, b.ON_M_KORP, b.ON_M_KV, b.ONA_M_DOM, b.ONA_M_KORP, b.ONA_M_KV, b.TARIF, b.TYPE_RAST, b.SUDRESH, b.SUDSILA, b.R_NOMER, b.R_DATE, b.S_NOMER, b.S_DATE, b.DATEIZM,
IIF(b.ON_B_RESP,1,0) as EDIT_GIS
FROM ЗаключениеБраков b
ORDER BY Year(b.DateZ) DESC, b.Nomer DESC
