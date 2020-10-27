try
  drop table #del_id;
catch all
end;

select distinct id into #del_id from &TABLE_NAME& where &ADD_WHERE&;

delete from &TABLE_NAME& where &ADD_WHERE&;
delete from BaseProp where typeobj=&TYPE_OBJ& and id in (select id from #del_id);
delete from BaseTextProp where typeobj=&TYPE_OBJ& and id in (select id from #del_id);
delete from HistoryZAGS where typeobj=&TYPE_OBJ& and id in (select id from #del_id);
delete from SvidPovtor where svid_type=&TYPE_OBJ& and akt_id in (select id from #del_id);

try
  drop table #del_id;
catch all
end;
