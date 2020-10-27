select count(id) from базадомов b
where exists
   ( select * from
      (
         select punkt,ul,dom,korp  from базадомов
            where date_fiks='1899-12-30' 
            group by punkt,ul,dom,korp
            having count(*)>19 
      ) a
      where b.date_fiks='1899-12-30' and 
	        a.punkt=b.punkt and a.ul=b.ul and a.dom=b.dom 
   )
  
