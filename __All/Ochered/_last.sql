DELETE FROM #tmp_fmGurnOchered;
 insert into #tmp_fmGurnOchered (ID) SELECT ID FROM ochered where id in ( 
   select distinct id from (    select id from sostavsem where member_id in (select id from НаселениеСобств  ) 
     union all 
   select id from ochered where id in (select id from НаселениеСобств ) ) aaa);
