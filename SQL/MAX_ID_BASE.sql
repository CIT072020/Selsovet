SELECT MAX(id) FROM 
 ( SELECT MAX(id) id FROM Ќаселение where id_base=&id_base&
      union all   
   SELECT MAX(id) id FROM Ћицевые—чета where id_base=&id_base&
      union all   
   SELECT MAX(id) id FROM Ѕазаƒомов where id_base=&id_base&
      union all   
   SELECT MAX(id) id FROM —прћест–аботы where id_base=&id_base&
 ) m
