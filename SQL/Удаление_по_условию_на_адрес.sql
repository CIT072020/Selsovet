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

--select id into #del_adr from Ѕазаƒомов where id not in (select id from Ѕазаƒомов where (punkt=1 and ul=21))

select a.id into #del_adr from базаƒомов a where date_fiks='1899-12-30' and        
      &ADD_WHERE&;

delete from BigHouse where 
      &ADD_WHERE&;

//----- лицевые счета -------------
//---------	
select id into #del_lic from лицевыесчета where date_fiks='1899-12-30' and adres_id in (select id from #del_adr); 

delete from Ћицевые—чета where id in (select id from #del_lic);
delete from Ћицевые—четаѕризнаки where id in (select id from #del_lic);
delete from Nalogi where typeobj=2 and id in (select id from #del_lic);
delete from Dokuments where typeobj=2 and id in (select id from #del_lic);
delete from Ѕаза—войствќбъектов where typeobj=2 and id in (select id from #del_lic);
delete from Ѕаза—трок where typeobj=2 and id in (select id from #del_lic);
//----- адреса -------------
delete from Ѕазаƒомов where id in (select id from #del_adr);
delete from HouseOwners where id in (select id from #del_adr);
delete from HouseOwnersHist where id in (select id from #del_adr);
delete from HouseProps where id in (select id from #del_adr);
delete from Nalogi where typeobj=1 and id in (select id from #del_adr);
delete from Dokuments where typeobj=1 and id in (select id from #del_adr);
delete from Ѕаза—войствќбъектов where typeobj=1 and id in (select id from #del_adr);
delete from Ѕаза—трок where typeobj=1 and id in (select id from #del_adr);
//----- люди -------------
select id into #del_men from население where date_fiks='1899-12-30' and (adres_id in (select id from #del_adr) &ADD_MEN&); 
// !!!======= не удал€ем людей которые владеют собственностью, но могуть быть незарегистрированы по оставшимс€ адресам !!!
delete from #del_men where id in (
  select distinct kod as id from HouseOwners where typekod=1 and id in (select id from базаƒомов where date_fiks='1899-12-30'));
//==================================================

delete from Ќаселение where id in (select id from #del_men);
delete from Ќаселениеƒоп where id in (select id from #del_men);
delete from Ochered where id in (select id from #del_men);
delete from OcheredResh where id in (select id from #del_men);
delete from VUS where id in (select id from #del_men);
delete from SostavSem where id in (select id from #del_men);
delete from Ќаселениеѕризнаки where id in (select id from #del_men);
delete from ЌаселениеЋьготы where id in (select id from #del_men);
delete from Ќаселениеƒвижение where id in (select id from #del_men);
delete from Nalogi where typeobj=3 and id in (select id from #del_men);
delete from Dokuments where typeobj=3 and id in (select id from #del_men);
delete from Ѕаза—войствќбъектов where typeobj=3 and id in (select id from #del_men);
delete from Ѕаза—трок where typeobj=3 and id in (select id from #del_men);
delete from Ќаселение—обств where id in (select id from #del_men);
delete from HistoryZAGS where typeobj=3 and id in (select id from #del_men);



