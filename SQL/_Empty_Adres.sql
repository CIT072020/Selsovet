// if ParamAsInteger('CH_ADRES')=0 then sSort:='s.id' else sSort:='s.nomer';
select AdresToString(bbb.id,'1899-12-30',0) as Adres, cast(NValue as sql_numeric) Plosh_All, bbb.LastDateV, d.* from
(
select  aa.id, max(isnull(dates,datev)) as LastDateV from БазаДомов aa
left join население nn on aa.date_fiks=nn.date_fiks and aa.id=nn.adres_id 
where aa.id in ( select a.id from БазаДомов a
             left join население n on a.date_fiks=n.date_fiks and a.id=n.adres_id and n.candelete=false and n.propis=true
             where a.date_fiks='1899-12-30' and n.id is null ) and aa.date_fiks='1899-12-30' 
group by 1) bbb
left join БазаДомов d on d.date_fiks='1899-12-30' and bbb.id=d.id 
left join БазаСвойствОбъектов s on  s.date_fiks='1899-12-30' and pokaz='PLOSH_ALL' and bbb.id=s.id
left join СпрНасПунктов sp on  sp.id=d.punkt
where tip<>6 and tip<>7  // 6-участок 7-стоится
order by sp.nomer, ul, dom1,dom2,kv

