try
  drop table #tmp;
  drop table #tb_update;
catch all
end;
select ate_id tmp_ate_id, max(datein) tmp_datein into #tmp from ate group by 1;
select * from #tmp;
 
--select count(*)
--from ( 
select a.ate_id, a.kod kod_ate, s.Kod kod, a.name name_ate, s.name, a.name_b name_b_ate, s.name_b, s.typepunkt,cat2tp(category) new_typepunkt, category, a.namec, a.datein, a.dateout new_dateout
into #tb_update 
from #tmp t
left join ate a on a.ate_id=tmp_ate_id and a.datein=tmp_datein
left join спрсоато s on tmp_ate_id=s.ate_id
where (s.kod<>a.kod or s.name<>a.name or s.name_b<>a.name_b or s.typepunkt<>cat2tp(a.category))  
       and a.category<>245 and a.category<>243 and a.category<>103 and a.category<>101 and a.category<>202 and a.category<>102;
--	   and a.name='Орша' 
--) aaa
--order by a.ate_id, a.datein;
--select count(*) from #tb_update

//---- UPDATE ------------------
--update s set name_b=name_b_ate, name=name_ate, kod=kod_ate, typepunkt=new_typepunkt, dateout=new_dateout 
-- from спрсоато s inner join #tb_update t ON s.ate_id=t.ate_id

--select count(*) from спрсоато s inner join #tb_update t ON s.ate_id=t.ate_id
--select count(*) from #tb_update


