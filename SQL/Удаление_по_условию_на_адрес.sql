try
  drop table #del_lic;
catch all
end;
try
  drop table #del_men;
catch all
end;
try
  drop table #del_adr;
catch all
end;

--select id into #del_adr from ��������� where id not in (select id from ��������� where (punkt=1 and ul=21))

select a.id into #del_adr from ��������� a where date_fiks='1899-12-30' and        
      &ADD_WHERE&;

delete from BigHouse where 
      &ADD_WHERE&;

//----- ������� ����� -------------
//---------	
select id into #del_lic from ������������ where date_fiks='1899-12-30' and adres_id in (select id from #del_adr); 

delete from ������������ where id in (select id from #del_lic);
delete from �������������������� where id in (select id from #del_lic);
delete from Nalogi where typeobj=2 and id in (select id from #del_lic);
delete from Dokuments where typeobj=2 and id in (select id from #del_lic);
delete from ������������������� where typeobj=2 and id in (select id from #del_lic);
delete from ��������� where typeobj=2 and id in (select id from #del_lic);
//----- ������ -------------
delete from ��������� where id in (select id from #del_adr);
delete from HouseOwners where id in (select id from #del_adr);
delete from HouseOwnersHist where id in (select id from #del_adr);
delete from HouseProps where id in (select id from #del_adr);
delete from Nalogi where typeobj=1 and id in (select id from #del_adr);
delete from Dokuments where typeobj=1 and id in (select id from #del_adr);
delete from ������������������� where typeobj=1 and id in (select id from #del_adr);
delete from ��������� where typeobj=1 and id in (select id from #del_adr);
//----- ���� -------------
select id into #del_men from ��������� where date_fiks='1899-12-30' and (adres_id in (select id from #del_adr) &ADD_MEN&); 
// !!!======= �� ������� ����� ������� ������� ��������������, �� ������ ���� ������������������ �� ���������� ������� !!!
delete from #del_men where id in (
  select distinct kod as id from HouseOwners where typekod=1 and id in (select id from ��������� where date_fiks='1899-12-30'));
//==================================================

delete from ��������� where id in (select id from #del_men);
delete from ������������ where id in (select id from #del_men);
delete from Ochered where id in (select id from #del_men);
delete from OcheredResh where id in (select id from #del_men);
delete from VUS where id in (select id from #del_men);
delete from SostavSem where id in (select id from #del_men);
delete from ����������������� where id in (select id from #del_men);
delete from ��������������� where id in (select id from #del_men);
delete from ����������������� where id in (select id from #del_men);
delete from Nalogi where typeobj=3 and id in (select id from #del_men);
delete from Dokuments where typeobj=3 and id in (select id from #del_men);
delete from ������������������� where typeobj=3 and id in (select id from #del_men);
delete from ��������� where typeobj=3 and id in (select id from #del_men);
delete from ��������������� where id in (select id from #del_men);
delete from HistoryZAGS where typeobj=3 and id in (select id from #del_men);



