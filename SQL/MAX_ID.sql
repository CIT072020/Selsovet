SELECT MAX(id) FROM 
 ( SELECT MAX(id) id FROM Ќаселение
      union all   
   SELECT MAX(id) id FROM Ћицевые—чета
      union all   
   SELECT MAX(id) id FROM Ѕазаƒомов
      union all   
   SELECT MAX(id) id FROM —прћест–аботы
 ) m
