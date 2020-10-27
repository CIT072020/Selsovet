--население для которого нет соответствия в базе лицевых счетов
DELETE FROM Население where id in
 (SELECT n.id FROM Население n
   LEFT OUTER JOIN ЛицевыеСчета l ON n.date_fiks=l.date_fiks and n.lic_id=l.id
   WHERE l.id is null)
