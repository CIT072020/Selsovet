SELECT sss.nomer, sss.name name_punkt, t.name type_punkt, sss.soato, sss.id, aaa.kolvo_p, aaa.kolvo_o 
  FROM СпрНасПунктов sss 
  LEFT JOIN SysSpr.TypePunkt t on sss.typepunkt=t.id
  LEFT JOIN (
    SELECT s.id, 
      Count(*) kolvo,
      SUM( CASE WHEN PRESENT=true THEN 1 ELSE 0 END) KOLVO_P,
      SUM( CASE WHEN PROPIS=true and PRESENT=false THEN 1 ELSE 0 END) KOLVO_O
      FROM Население n
        LEFT OUTER JOIN БазаДомов d ON n.date_fiks=d.date_fiks and n.adres_id=d.id
        LEFT OUTER JOIN СпрНасПунктов s ON s.id=d.punkt
      WHERE n.date_fiks='1899-12-30' and n.candelete=false and dates is null
      GROUP BY 1
    ) aaa  ON aaa.id=sss.id
ORDER BY 1,2