SELECT MAX(id) FROM 
 ( SELECT MAX(id) id FROM ��������� where id_base=&id_base&
      union all   
   SELECT MAX(id) id FROM ������������ where id_base=&id_base&
      union all   
   SELECT MAX(id) id FROM ��������� where id_base=&id_base&
      union all   
   SELECT MAX(id) id FROM ������������� where id_base=&id_base&
 ) m
