SELECT MAX(id) FROM 
 ( SELECT MAX(id) id FROM ���������
      union all   
   SELECT MAX(id) id FROM ������������
      union all   
   SELECT MAX(id) id FROM ���������
      union all   
   SELECT MAX(id) id FROM �������������
      union all   
   SELECT MAX(id) id FROM SMDOPost
      union all   
   SELECT MAX(task_id) id FROM SMDOTask
 ) m
