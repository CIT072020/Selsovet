//------- создание временных таблиц --------------
select l.id into #del_lic 
  from лицевыесчета l
   left join базадомов d on l.date_fiks=d.date_fiks and l.adres_id=d.id
   left join спрнаспунктов p on d.punkt=p.id
   where l.date_fiks='1899-12-30' and p.id=:ppp1;
   //---------------------------------------------   
select n.id into #del_men 
  from население n
   left join базадомов d on n.date_fiks=d.date_fiks and n.adres_id=d.id
   left join спрнаспунктов p on d.punkt=p.id
   where n.date_fiks='1899-12-30' and p.id=:ppp2;
  //------------------------------------------------   
select d.id into #del_adr 
  from базадомов d
   left join спрнаспунктов p on d.punkt=p.id
   where d.date_fiks='1899-12-30' and p.id=:ppp3;
   

//----- лицевые счета -------------
delete from Ћицевые—чета where date_fiks='1899-12-30' and 
                               id in (select id from #del_lic);
delete from Ћицевые—четаѕризнаки where date_fiks='1899-12-30' and 
                                       id in (select id from #del_lic);
delete from Nalogi where date_fiks='1899-12-30' and typeobj=2 and 
                                       id in (select id from #del_lic);
delete from Dokuments where date_fiks='1899-12-30' and typeobj=2 and 
                                       id in (select id from #del_lic);
delete from Ѕаза—войствќбъектов where date_fiks='1899-12-30' and typeobj=2 and
                                      id in (select id from #del_lic);
delete from Ѕаза—трок where date_fiks='1899-12-30' and typeobj=2 and
                                      id in (select id from #del_lic);
//----- люди -------------
delete from Ќаселение where date_fiks='1899-12-30' and 
                            id in (select id from #del_men);
delete from Ќаселениеƒоп where id in (select id from #del_men);
delete from Ochered where id in (select id from #del_men);
delete from VUS where id in (select id from #del_men);
delete from SostavSem where id in (select id from #del_men);
delete from Ќаселениеѕризнаки   where date_fiks='1899-12-30' and 
                                       id in (select id from #del_men);
delete from ЌаселениеЋьготы     where date_fiks='1899-12-30' and 
                                       id in (select id from #del_men);
delete from Ќаселениеƒвижение   where date_fiks='1899-12-30' and 
                                       id in (select id from #del_men);
delete from Nalogi where date_fiks='1899-12-30' and typeobj=3 and 
                                       id in (select id from #del_men);
delete from Dokuments where date_fiks='1899-12-30' and typeobj=3 and 
                                       id in (select id from #del_men);
delete from Ѕаза—войствќбъектов where date_fiks='1899-12-30' and typeobj=3 and
                                      id in (select id from #del_men);
delete from Ѕаза—трок where date_fiks='1899-12-30' and typeobj=3 and
                                      id in (select id from #del_men);
//----- адреса -------------
delete from Ѕазаƒомов where date_fiks='1899-12-30' and       	
                            id in (select id from #del_adr);
delete from HouseOwners where date_fiks='1899-12-30' and 
                              id in (select id from #del_adr);
delete from HouseOwnersHist where id in (select id from #del_adr);
delete from HouseProps where date_fiks='1899-12-30' and 
                              id in (select id from #del_adr);
delete from Nalogi where date_fiks='1899-12-30' and typeobj=1 and 
                                       id in (select id from #del_adr);
delete from Dokuments where date_fiks='1899-12-30' and typeobj=1 and 
                                       id in (select id from #del_adr);
delete from Ѕаза—войствќбъектов where date_fiks='1899-12-30' and typeobj=1 and
                                      id in (select id from #del_adr);
delete from Ѕаза—трок where date_fiks='1899-12-30' and typeobj=1 and
                                      id in (select id from #del_adr);
//-------------------------------------------------------------------------
delete from BigHouse where date_fiks='1899-12-30' and 
                            punkt=:ppp4;
	