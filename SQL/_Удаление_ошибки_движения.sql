try
  drop table #d1;
  drop table #d2;
  drop table #d3;
  drop table #d4;
catch all
end;

select id id1, max(date_srok) ddd1 into #d1 from населениеƒвижение where date_fiks='1899-12-30' and tip=0 and contant=0 and date_srok is not null group by 1;
select id id2, max(date)      ddd2 into #d2 from населениеƒвижение where date_fiks='1899-12-30' and tip=0 and contant=1 group by 1;
select id id3, max(date)      ddd3 into #d3 from населениеƒвижение where date_fiks='1899-12-30' group by 1;

select id1 idX, ddd1 dddX into #d4 from #d1 d1 
  left join #d2 d2 on d1.id1=d2.id2 
  left join #d3 d3 on d1.id1=d3.id3 
where d1.ddd1=d2.ddd2 and d2.ddd2=d3.ddd3; 

delete from населениеƒвижение 
 where cast(id as SQL_CHAR)+CAST(date as SQL_CHAR) in(select cast(idX as SQL_CHAR)+CAST(dddX as SQL_CHAR) from #d4) 
       and date_fiks='1899-12-30';
	   
update население set date_srok=d.dddX, datev=null, propis=true, present=true, candelete=false
  from #d4 d where candelete=true and date_fiks='1899-12-30' and id=d.idX;