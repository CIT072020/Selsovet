select punkt, 0 tip, 0 ul, '  ' name, kol_dom, dom_one_kv, dom_mn_kv,
	   kol_kv, zareg, zareg_one_kv, zareg_mn_kv, fact_progiv
from (	   
select punkt, count(*) kol_dom,
       sum(iif(one_kv=true,1,0)) dom_one_kv,
       sum(iif(one_kv=false,1,0)) dom_mn_kv,
	   sum(iif(one_kv=false,kol_kv,0)) kol_kv,
	   sum(zareg) zareg,
       sum(iif(one_kv=true,zareg,0)) zareg_one_kv,
       sum(iif(one_kv=false,zareg,0)) zareg_mn_kv,
       sum(fact_progiv) fact_progiv
 from #forma2
 group by 1
 ) aaa

   union all
--  четные-нечетные дома //////////////////////////
select punkt, 1 tip, ul, iif(chet=true,' 2',' 1') name,
 kol_dom, dom_one_kv, dom_mn_kv, kol_kv, zareg, zareg_one_kv, zareg_mn_kv, fact_progiv
 from (
select  
 punkt, ul, chet, count(*) kol_dom,
       sum(iif(one_kv=true,1,0)) dom_one_kv,
       sum(iif(one_kv=false,1,0)) dom_mn_kv,
	   sum(iif(one_kv=false,kol_kv,0)) kol_kv,
	   sum(zareg) zareg,
       sum(iif(one_kv=true,zareg,0)) zareg_one_kv,
       sum(iif(one_kv=false,zareg,0)) zareg_mn_kv,
       sum(fact_progiv) fact_progiv
 from #forma2
 where otdelno=false	   
 group by 1,2,3
 ) ссс
   
-- ///////////////////////////////////////////////   
   union all
 
--  отдельно сто€щие дома //////////////////////////
select  punkt, 2 tip, 0 ul, name, kol_dom, dom_one_kv, dom_mn_kv,
	   kol_kv, zareg, zareg_one_kv, zareg_mn_kv, fact_progiv
from (	     
select punkt, name, count(*) kol_dom,
       sum(iif(one_kv=true,1,0)) dom_one_kv,
       sum(iif(one_kv=false,1,0)) dom_mn_kv,
	   sum(iif(one_kv=false,kol_kv,0)) kol_kv,
	   sum(zareg) zareg,
       sum(iif(one_kv=true,zareg,0)) zareg_one_kv,
       sum(iif(one_kv=false,zareg,0)) zareg_mn_kv,
       sum(fact_progiv) fact_progiv
 from #forma2
 where otdelno=true and name is not null
 group by 1,2
) bbb 
order by punkt,tip,ul,name 


