SELECT oc.OCHERED_ID,oc.ID, oc.DELO, oc.NOMER_OCH, oc.OLD_NOMER, oc.DEC_DATE, oc.DEC_TIME, oc.REG_DATE,oc.REG_RESH, oc.REG_NOMER, oc.REG_OSNOV, oc.REG_OSNOV_TEXT, oc.REG_OSNOV2, oc.REG_OSNOV_TEXT2,
oc.ISK_RESH, oc.ISK_DATE, oc.ISK_OSNOV, oc.ISK_OSNOV_TEXT, oc.PER_DATE, oc.PLOSH_ALL, oc.KOLVO_PROPIS, oc.KOLVO_SOSTAV, oc.KOLVO_KOMN, oc.KOLVO_KOMN_PR, oc.TYPEHOUSE, 
PUNKT, UL, DOM, KORP, KV, NOT_DOM, n.DATE_FIKS, n.PRESENT, n.CANDELETE, n.PROPIS, ' ' AS SOSTAV_SEM, n.ADRES_ID, n.WORK_SPR, n.DATER, getVozrast(ISNULL(n.DATES,CURDATE()),n.DATER) VOZR, 
n.FAMILIA, n.NAME, n.OTCH, n.pol, n.LICH_NOMER, n.LIC_ID, oc.OCHERED_ID, true AS GURNAL_OCH, oc.GSK, oc.UCHASTOK, oc.SOCIAL, 
ISKL, IIF(oc.ISKL=true,0,1) N_ISKL, OTKAZ, NEW_ADRES_ID, NEW_DOGOVOR, SUBSID_SUMMA, SUBSID_DATE, KREDIT_SUMMA, KREDIT_DATE, ISK_ADDINFO, 
n.PASP_UDOST, n.Pasp_Seria, n.Pasp_Nomer, n.Pasp_Date,' ' PASP_VIDAN, n.DATE_SROK_DN, n.SPEC_UCH, n.NEW_ID, n.Citizen 
FROM Ochered oc 
  left join Население n on n.id=oc.ID 
--FROM Население n 
--  left join Ochered oc on n.id=oc.ID 
  left join БазаДомов a on a.date_fiks='1899-12-30' and a.id=n.adres_id
  left join СпрНасПунктов sp ON sp.id=punkt 
  left join СпрУлиц su ON su.id=ul 
  left join СпрТипУлиц tu ON tu.id=su.tip 
  left join SysSpr.TypePunkt tp ON tp.id=sp.typepunkt 
  WHERE n.date_fiks='1899-12-30' and n.OCHERED=true and oc.OCHERED_ID=1 and (oc.ISKL=false or true=true) 
  ORDER BY OCHERED_ID,NOMER_OCH 
