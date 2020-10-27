select t.name typepunkt, s.name namepunkt, kolvo  from СпрНасПунктов s
left join sysspr.typepunkt t on t.id=s.typepunkt
left join (  
 select punkt, count(*) kolvo from ( 
 select b.punkt, isNull(b.ul,0), trim(isnull(b.dom,'''')), trim(isnull(b.korp,'''')), count(*) kolvo  
    from базадомов b
    left join bighouse d on b.date_fiks=d.date_fiks and b.punkt=d.punkt and isnull(b.ul,0)=isnull(d.ul,0) and 
                            isnull(b.dom,'0')=isnull(d.dom,'0') and isnull(b.korp,'#')=isnull(d.korp,'#')
    where &kol_kv& b.date_fiks='1899-12-30'
    group by 1,2,3,4 ) aaa 
 group by 1 ) bbb on bbb.punkt=s.id
 where kolvo>0
 order by &order_by&