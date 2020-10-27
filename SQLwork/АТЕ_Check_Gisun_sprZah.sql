--select * from gisun_sprzah  
--  where (ate_punkt>0) and ate_punkt not in (select ate_id from ate)
//----------------------------------------------------
drop table #tmp;
select a.ate_parentid new_ate_ss, s.* into #tmp from gisun_sprzah s
  left join ate a on s.ate_punkt=a.ate_id 
  where (ate_punkt>0) and (ate_ss>0) and ate_ss is not null and ate_ss not in (select ate_id from ate);
--update gisun_sprZah set gisun_sprZah.ate_ss=u.new_ate_ss from #tmp u where gisun_sprZah.id=u.id;  
  
