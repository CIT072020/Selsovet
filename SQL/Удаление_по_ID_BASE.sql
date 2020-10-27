try
  drop table #del_men;
catch all
end;
try
  drop table #del_och;
catch all
end;

select distinct id into #del_men from Население where &ADD_WHERE&;
select distinct id into #del_och from Ochered where &ADD_WHERE&;

delete from Население where id in (select id from #del_men);
delete from НаселениеДоп where id in (select id from #del_men);
delete from VUS where id in (select id from #del_men);
delete from НаселениеПризнаки where id in (select id from #del_men);
delete from НаселениеЛьготы where id in (select id from #del_men);
delete from НаселениеДвижение where id in (select id from #del_men);
delete from БазаСвойствОбъектов where typeobj=3 and id in (select id from #del_men);
delete from БазаСтрок where typeobj=3 and id in (select id from #del_men);
delete from BaseProp where typeobj=3 and id in (select id from #del_men);
delete from BaseTextProp where typeobj=3 and id in (select id from #del_men);
delete from НаселениеСобств where id in (select id from #del_men);
delete from HistoryZAGS where typeobj=3 and id in (select id from #del_men);

delete from Ochered where id in (select id from #del_och);
delete from OcheredResh where id in (select id from #del_och);
delete from SostavSem where id in (select id from #del_och);

try
  drop table #del_men;
catch all
end;
try
  drop table #del_och;
catch all
end;
