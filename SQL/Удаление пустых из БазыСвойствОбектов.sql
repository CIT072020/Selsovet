DELETE FROM ������������������� WHERE id in 
( SELECT distinct b.id FROM ������������������� b
   LEFT OUTER JOIN ������������ l ON b.date_fiks=l.date_fiks and b.id=l.id
   WHERE l.id is null and b.typeobj=2
   union all
  SELECT distinct b.id FROM ������������������� b
   LEFT OUTER JOIN ��������� n ON b.date_fiks=n.date_fiks and b.id=n.id
   WHERE n.id is null and b.typeobj=3
   union all
 SELECT distinct b.id FROM ������������������� b
   LEFT OUTER JOIN ��������� d ON b.date_fiks=d.date_fiks and b.id=d.id
   WHERE d.id is null and b.typeobj=1 ) 
   
