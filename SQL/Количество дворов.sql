select rownum() npp, t.name typepunkt, s.name namepunkt, isnull(kolvo,0) kolvo, isnull(kolvo1,0) kolvo1, isnull(kolvo2,0) kolvo2, isnull(kolvo_mn,0) kolvo_mn, isnull(kolvo0,0) kolvo0  
from СпрНасПунктов s
left join sysspr.typepunkt t on t.id=s.typepunkt
left join (  
 select aaa.punkt, count(*) kolvo, sum(iif(kol_kv=1,1,0)) kolvo1, sum(iif(kol_kv=2,1,0)) kolvo2, sum(iif(kol_kv>2,1,0)) kolvo_mn, sum(iif(kol_kv is null or kol_kv=0,1,0)) kolvo0  
    from  (select distinct date_fiks, b.punkt, isNull(b.ul,0) ul, b.dom , b.korp from базадомов b where date_fiks='1899-12-30') aaa
    left join bighouse d on aaa.date_fiks=d.date_fiks and aaa.punkt=d.punkt and isnull(aaa.ul,0)=isnull(d.ul,0) and 
                            isnull(aaa.dom,'')=isnull(d.dom,'') and isnull(aaa.korp,'#')=isnull(d.korp,'#')
  group by 1
  ) nnn on s.id=nnn.punkt
 order by &order_by&