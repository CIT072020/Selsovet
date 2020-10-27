select t.name typepunkt, s.name namepunkt, kolvo  from СпрНасПунктов s
left join sysspr.typepunkt t on t.id=s.typepunkt
left join (  
 select punkt, count(*) kolvo from ( 
 select punkt, isNull(ul,0), trim(isnull(dom,'''')), trim(isnull(korp,'''')), count(*) kolvo  
    from базадомов 
 where date_fiks='1899-12-30'
 group by 1,2,3,4) aaa 
 group by 1 ) bbb on bbb.punkt=s.id
 order by &order_by&