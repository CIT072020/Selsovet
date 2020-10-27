//----- всего по сельскому совету /////////////////////////////////
select punkt, 0 tip, 0 ul, '  ' name, kol_dom, kol_dom_zareg, kol_dom_progiv, dom_one_kv, dom_mn_kv,
	   kol_kv, zareg, zareg_one_kv, zareg_mn_kv, fact_progiv
from (	   
select 0 punkt, count(*) kol_dom,
       sum(iif(zareg>0,1,0)) kol_dom_zareg,
       sum(iif(zareg=0,1,0)) kol_dom_progiv,
       sum(iif(one_kv=true and zareg>0,1,0)) dom_one_kv,
       sum(iif(one_kv=false and zareg>0,1,0)) dom_mn_kv,
	   sum(iif((one_kv=false or giloe=false) and zareg>0,kol_kv,0)) kol_kv,
	   sum(zareg) zareg,
       sum(iif(one_kv=true,zareg,0)) zareg_one_kv,
       sum(iif(one_kv=false,zareg,0)) zareg_mn_kv,
       sum(fact_progiv) fact_progiv
 from #forma2
 ) zzz
   union all
//------ всего по нас. пункту //////////////////////////////////////////
select punkt, 0 tip, 0 ul, '  ' name, kol_dom, kol_dom_zareg, kol_dom_progiv, dom_one_kv, dom_mn_kv,
	   kol_kv, zareg, zareg_one_kv, zareg_mn_kv, fact_progiv
from (	   
select punkt, count(*) kol_dom,
       sum(iif(zareg>0,1,0)) kol_dom_zareg,
       sum(iif(zareg=0,1,0)) kol_dom_progiv,
       sum(iif(one_kv=true and zareg>0,1,0)) dom_one_kv,
       sum(iif(one_kv=false and zareg>0,1,0)) dom_mn_kv,
	   sum(iif(one_kv=false and zareg>0,kol_kv,0)) kol_kv,
	   sum(zareg) zareg,
       sum(iif(one_kv=true,zareg,0)) zareg_one_kv,
       sum(iif(one_kv=false,zareg,0)) zareg_mn_kv,
       sum(fact_progiv) fact_progiv
 from #forma2
 group by 1
 ) aaa
   union all
--  четные-нечетные дома по улицам //////////////////////////
select punkt, 1 tip, ul, iif(chet=true,' 2',' 1') name,
       kol_dom, kol_dom_zareg, kol_dom_progiv, dom_one_kv, dom_mn_kv,
	   kol_kv, zareg, zareg_one_kv, zareg_mn_kv, fact_progiv
 from (
select  
 punkt, ul, chet, count(*) kol_dom,
       sum(iif(zareg>0,1,0)) kol_dom_zareg,
       sum(iif(zareg=0,1,0)) kol_dom_progiv,
       sum(iif(one_kv=true and zareg>0,1,0)) dom_one_kv,
       sum(iif(one_kv=false and zareg>0,1,0)) dom_mn_kv,
	   sum(iif(one_kv=false and zareg>0,kol_kv,0)) kol_kv,
	   sum(zareg) zareg,
       sum(iif(one_kv=true,zareg,0)) zareg_one_kv,
       sum(iif(one_kv=false,zareg,0)) zareg_mn_kv,
       sum(fact_progiv) fact_progiv
 from #forma2
 where otdelno=false	   
 group by 1,2,3
 ) ссс
   
   union all
--  отдельно стоящие дома //////////////////////////
select punkt, 2 tip, 0 ul, name,
       kol_dom, kol_dom_zareg, kol_dom_progiv, dom_one_kv, dom_mn_kv,
	   kol_kv, zareg, zareg_one_kv, zareg_mn_kv, fact_progiv
from (	     
select punkt, name, count(*) kol_dom,
       sum(iif(zareg>0,1,0)) kol_dom_zareg,
       sum(iif(zareg=0,1,0)) kol_dom_progiv,
       sum(iif(one_kv=true and zareg>0,1,0)) dom_one_kv,
       sum(iif(one_kv=false and zareg>0,1,0)) dom_mn_kv,
	   sum(iif(one_kv=false and zareg>0,kol_kv,0)) kol_kv,
	   sum(zareg) zareg,
       sum(iif(one_kv=true,zareg,0)) zareg_one_kv,
       sum(iif(one_kv=false,zareg,0)) zareg_mn_kv,
       sum(fact_progiv) fact_progiv
 from #forma2
 where otdelno=true 
 group by 1,2
) bbb 
order by punkt,tip,ul,name 


