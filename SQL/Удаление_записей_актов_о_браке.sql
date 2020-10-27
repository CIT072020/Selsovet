try
  drop table #del_id;
catch all
end;

select distinct id into #del_id from Çàêëş÷åíèåÁğàêîâ where id>=41792 and id<=44458;

delete from Çàêëş÷åíèåÁğàêîâ where id>=41792 and id<=44458;
delete from BaseProp where typeobj=5 and id in (select id from #del_id);
delete from BaseTextProp where typeobj=5 and id in (select id from #del_id);
delete from HistoryZAGS where typeobj=5 and id in (select id from #del_id);
delete from SvidPovtor where svid_type=5 and akt_id in (select id from #del_id);

try
  drop table #del_id;
catch all
end;
