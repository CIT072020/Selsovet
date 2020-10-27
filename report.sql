try
  drop table #ttt;
catch all
end;                         
//---------------------------------------
select lic_id, count(*) kolvo into #ttt 
  from население n
  where date_fiks='1899-12-30' and lic_id>0 and propis=true and candelete=false and (trud(curdate(),n.dater, n.pol)=1)
  group by 1;
//---------------------------------------
select n.id, n.adres_id, nd.en_adres_id, nd.en_lgot_data, sp.name punkt_name, su.name punkt_ul, a.dom1, a.dom2, a.kv, n.lic_id, tt.kolvo,
       so.name name_otnosh, n.familia, n.name, n.otch, n.lich_nomer, n.dater, n.datep, n.datev, n.dates, n.AKT_SMER_NOMER, n.AKT_SMER_DATE,
       iif(n.candelete=false and n.propis=true, n.datep, null) datep_, 
       iif(n.candelete=false and n.propis=false and n.present=true and n.lic_id>0 and n.date_srok is not null, true, false) tmp_prib, 
       iif((n.candelete=true and n.propis=false) or (n.candelete=false and n.propis=true and n.present=false), n.datev, null) datev_, 
	   l.date_likv, l.nomer, l.adres_id, a.punkt, a.dom, a.korp, n.present, n.propis, n.candelete, n.date_srok,
	   l.own_house,
	   getFIO(nn.Familia,nn.Name,nn.Otch) fio_first, nn.propis propis_first, n.pol,
       iif(sp.name is null, '', trim(isnull(tp.name,''))+' '+trim(sp.name)) name_punkt, iif(su.name is null,'',trim(isnull(tu.name,''))+' '+trim(su.name)) name_ul 
from Население n 
left join НаселениеДоп nd on n.id=nd.id  
left join ЛицевыеСчета l on l.date_fiks=n.date_fiks and n.lic_id=l.id  
left join Население nn on l.date_fiks=nn.date_fiks and nn.id=l.first
left join СпрОтношений so on so.id=n.otnosh
left join БазаДомов a on l.date_fiks=a.date_fiks and l.adres_id=a.id  
left join СпрНасПунктов sp on sp.id=a.punkt                                        
left join СпрУлиц su on su.id=a.ul  
left join SysSpr.TypePunkt tp on tp.id=sp.typepunkt
left join СпрТипУлиц tu on tu.id=su.tip
left join #ttt tt on tt.lic_id=n.lic_id  
where n.date_fiks='1899-12-30' and n.lic_id>0  and ( (n.datep>='2000-10-01' and n.candelete=false and n.propis=true ) or (n.datev>='2000-10-01' and n.candelete=true and n.propis=false)) and (trud(curdate(),n.dater, n.pol)=1)
order by sp.name,su.name,a.dom1,a.dom2,kv,korp,n.lic_id
