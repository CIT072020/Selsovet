drop table #tmp;
select id, trim(iif(a1.name is null,'',trim(a1.name)+' '+trim(a1.namec))+iif(a2.name is null,'',', '+trim(a2.name)+' '+trim(a2.namec))+
          iif(a3.name is null,'',', '+trim(a3.name)+' '+trim(a3.namec))+iif(a4.name is null,'', iif(a1.name is null,'',', ')+trim(a4.namec)+' '+trim(a4.name))) as new_name_path,s.*
into #tmp		   
from gisun_sprzah s  
left join ate a1 on ate_obl=a1.ate_id
left join ate a2 on ate_rn=a2.ate_id 
left join ate a3 on ate_ss=a3.ate_id 
left join ate a4 on ate_punkt=a4.ate_id
order by id;

select id,name_path,new_name_path from #tmp where name_path<>new_name_path;
--select max(length(new_name_path)) from #tmp
--update gisun_sprZah set gisun_sprZah.name_path=substring(u.new_name_path,1,150) from #tmp u where gisun_sprZah.id=u.id;
