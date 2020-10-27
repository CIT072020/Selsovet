SELECT distinct(ID) FROM
(
SELECT n.ID FROM Население n
  LEFT JOIN ЛицевыеСчета l ON n.date_fiks=l.date_fiks and n.lic_id=l.id
WHERE n.date_fiks=&DATE_FIKS& and l.id is null and (n.lic_id is null or n.lic_id<>0)

  union all

SELECT n.ID FROM Население n
  LEFT JOIN БазаДомов b ON n.date_fiks=b.date_fiks and n.adres_id=b.id
  LEFT JOIN СпрНасПунктов s ON s.id=b.punkt
WHERE n.date_fiks=&DATE_FIKS& and n.adres_id<>0 and propis=true and (s.id is null or b.id is null)
) a
