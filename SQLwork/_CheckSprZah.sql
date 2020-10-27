--- 1 ---------------------------------  
/*
select s.id, s.name, ss.lex1 from gisun_sprzah s
left join gisun_class ss on id=extcode
where typespr=134 and 
    (Replace(Replace(Replace(s.name,'»',''),'«',''),' ','')<>Replace(Replace(Replace(ss.lex1 COLLATE ads_default_ci,'»',''),'«',''),' ','') 
     or s.name is null)  
order by id
*/--
-- 2 ------------------------------------
select s.id, ss.extcode, s.name, ss.lex1 from gisun_class ss
left join gisun_sprzah s on id=extcode
where typespr=134 and ss.enddate is null and extcode<>'0' and 
    (Replace(Replace(Replace(s.name,'»',''),'«',''),' ','')<>Replace(Replace(Replace(ss.lex1 COLLATE ads_default_ci,'»',''),'«',''),' ','') 
     or s.name is null)  
order by id
-----------------------------------------
--select * from tmp
--update gisun_sprzah set gisun_sprzah.name=substring(tmp.lex1,1,100) from tmp where gisun_sprzah.id=tmp.id

