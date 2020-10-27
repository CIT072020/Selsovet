update sysspr.gisun_sprzah set ate_punkt=0 
  where (ate_punkt>0) and ate_punkt not in (select ate_id from sysspr.ate);