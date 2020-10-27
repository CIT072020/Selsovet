SELECT aa.ID, aa.DateZ, aa.Nomer, aa.Svid_Seria, aa.Svid_nomer,
aa.FamiliaDo, aa.NameDo, aa.OtchDo, aa.DATE_ANUL,
aa.FamiliaPosle, aa.NamePosle, aa.OtchPosle, aa.Pol,
aa.ON_Familia, aa.ON_Name, aa.ON_Otch, aa.ON_DateR, aa.POLE_GRN,
aa.ONA_Familia, aa.ONA_Name, aa.ONA_Otch, aa.ONA_DateR, aa.ID_ZAGS, aa.NAME_ZAGS, aa.ID_SOURCE
FROM AktAdopt aa
ORDER BY Year(aa.DateZ) DESC, aa.Nomer DESC
