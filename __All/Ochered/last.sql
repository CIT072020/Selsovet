SELECT oc.ID_BASE, oc.ID, oc.DELO, oc.NOMER_OCH, oc.OLD_NOMER, oc.DEC_DATE, oc.DEC_TIME, oc.DEC_DATE_REAL,
ocr.DATER REG_DATE, ocr.NOMER REG_RESH, ocr.OSNOV REG_OSNOV, ocr.OSNOV_TEXT REG_OSNOV_TEXT, ocr.OSNOV2 REG_OSNOV2, ocr.OSNOV_TEXT2 REG_OSNOV_TEXT2,
oc.PER_DATE, oc.PLOSH_ALL, oc.KOLVO_PROPIS, oc.KOLVO_SOSTAV, oc.KOLVO_KOMN, oc.KOLVO_KOMN_PR, oc.TYPEHOUSE,
oc.SIROTA, oc.NEWSEM, oc.IS_UCHASTOK, oc.IS_UCHASTOK_DATE,
LgotMen(n.date_fiks,oc.ID,Char(13)+Char(10)) LGOT, ' ' SOBSTV,
n.DATE_FIKS, n.PRESENT, n.CANDELETE, n.PROPIS, ' ' AS SOSTAV_SEM, n.ADRES_ID, n.WORK_SPR, n.DATER, getVozrast(ISNULL(n.DATES,CURDATE()),n.DATER) VOZR,
n.FAMILIA, n.NAME, n.OTCH, n.pol, n.LICH_NOMER, n.LIC_ID, oc.OCHERED_ID, true AS GURNAL_OCH, oc.GSK, oc.UCHASTOK, oc.UCHASTOK_DATE, oc.SOCIAL, ISKL, REG_NOMER, n.TELEFON, n.TELEFON_M,
IIF(oc.ISKL=true,0,IIF(oc.SIMPLE=0,2,1)) N_ISKL, oc.OTKAZ, NEW_ADRES_ID, NEW_DOGOVOR, SUBSID_SUMMA, SUBSID_DATE, KREDIT_SUMMA, KREDIT_DATE, oc.RESIDENCE_DATE, n.NOMER_SEM, oc.LGOT_DATE,
n.DATE_SROK_DN, n.SPEC_UCH, n.NEW_ID, n.Citizen, oc.ID_POST_RESH, oc.ID_SN_RESH, oc.ID_LAST_RESH, ocr.TIP TYPE_RESH, substring(sn.SOATO,1,4) SOATO_RN, oc.ONLY, oc.SIMPLE
FROM Ochered oc
left join OcheredResh ocr on oc.id_last_resh=ocr.auto_id
left join Население n on n.id=oc.ID
left join НаселениеДоп d on d.id=oc.ID
left join SprNames sn on sn.id=oc.ID_BASE
LEFT JOIN БазаДомов a ON n.date_fiks=a.date_fiks and n.adres_id=a.id
LEFT JOIN СпрУлиц u ON u.id=a.ul WHERE oc.id_base=0 and oc.ochered_id=0 and oc.id in (select id from #tmp_fmGurnOchered) and (oc.OCHERED_ID>0 or oc.ONLY=false)/*END*/        ORDER BY dec_date DESC
