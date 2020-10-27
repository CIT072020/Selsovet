SELECT 
   Sum( CASE WHEN b1.value is null THEN 1 ELSE 0 END) BIG_ENIMAL, 
   Sum( CASE WHEN b2.value is null THEN 1 ELSE 0 END) KOROVA, 
   Sum( CASE WHEN b3.value is null THEN 1 ELSE 0 END) SVINI, 
   Sum( CASE WHEN b4.value is null THEN 1 ELSE 0 END) OVCI, 
   Sum( CASE WHEN b5.value is null THEN 1 ELSE 0 END) KOZI 
 FROM Ћицевые—чета l 
 LEFT JOIN Ѕаза—войствќбъектов b1 ON l.date_fiks=b1.date_fiks and l.id=b1.id and b1.pokaz='BIG_ENIMAL'
 LEFT JOIN Ѕаза—войствќбъектов b2 ON l.date_fiks=b2.date_fiks and l.id=b2.id and b2.pokaz='KOROVA'
 LEFT JOIN Ѕаза—войствќбъектов b3 ON l.date_fiks=b3.date_fiks and l.id=b3.id and b3.pokaz='SVINI'
 LEFT JOIN Ѕаза—войствќбъектов b4 ON l.date_fiks=b4.date_fiks and l.id=b4.id and b4.pokaz='OVCI'
 LEFT JOIN Ѕаза—войствќбъектов b5 ON l.date_fiks=b5.date_fiks and l.id=b5.id and b5.pokaz='KOZI'
 WHERE l.date_fiks='1899-12-30' and 
       (l.candelete=false or l.candelete is null)

--- всех животных ----------------------------------------	   
SELECT 
   Sum( CASE WHEN b.value is null THEN 1 ELSE 0 END) ALL_ENIMAL 
 FROM Ћицевые—чета l 
 LEFT JOIN Ѕаза—войствќбъектов b ON l.date_fiks=b.date_fiks and l.id=b.id 
  and (b.pokaz='BIG_ENIMAL' or b.pokaz='KOROVA' or b.pokaz='SVINI' or
       b.pokaz='OVCI' or b.pokaz='KOZI')
 WHERE l.date_fiks='1899-12-30' and 
       (l.candelete=false or l.candelete is null)
