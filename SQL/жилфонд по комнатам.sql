SELECT s.name,

    Sum( CASE WHEN b1.nvalue=1 or b1.nvalue is null THEN 1 ELSE 0 END ) K1_KOLVO,
    Sum( CASE WHEN b1.nvalue=1 or b1.nvalue is null THEN CAST(b2.nvalue as SQL_NUMERIC) ELSE 0 END ) K1_PL_ALL,
    Sum( CASE WHEN b1.nvalue=1 or b1.nvalue is null THEN CAST(b3.nvalue as SQL_NUMERIC) ELSE 0 END ) K1_PL_GIL,

    Sum( CASE WHEN b1.nvalue=2 THEN 1 ELSE 0 END ) K2_KOLVO,
    Sum( CASE WHEN b1.nvalue=2 THEN CAST(b2.nvalue as SQL_NUMERIC) ELSE 0 END ) K2_PL_ALL,
    Sum( CASE WHEN b1.nvalue=2 THEN CAST(b3.nvalue as SQL_NUMERIC) ELSE 0 END ) K2_PL_GIL,

    Sum( CASE WHEN b1.nvalue=3 THEN 1 ELSE 0 END ) K3_KOLVO,
    Sum( CASE WHEN b1.nvalue=3 THEN CAST(b2.nvalue as SQL_NUMERIC) ELSE 0 END ) K3_PL_ALL,
    Sum( CASE WHEN b1.nvalue=3 THEN CAST(b3.nvalue as SQL_NUMERIC) ELSE 0 END ) K3_PL_GIL,

    Sum( CASE WHEN b1.nvalue=4 THEN 1 ELSE 0 END ) K4_KOLVO,
    Sum( CASE WHEN b1.nvalue=4 THEN CAST(b2.nvalue as SQL_NUMERIC) ELSE 0 END ) K4_PL_ALL,
    Sum( CASE WHEN b1.nvalue=4 THEN CAST(b3.nvalue as SQL_NUMERIC) ELSE 0 END ) K4_PL_GIL,

    Sum( CASE WHEN b1.nvalue>4 THEN 1 ELSE 0 END ) K5_KOLVO,
    Sum( CASE WHEN b1.nvalue>4 THEN CAST(b2.nvalue as SQL_NUMERIC) ELSE 0 END ) K5_PL_ALL,
    Sum( CASE WHEN b1.nvalue>4 THEN CAST(b3.nvalue as SQL_NUMERIC) ELSE 0 END ) K5_PL_GIL

     FROM БазаДомов d 
     LEFT JOIN СпрНасПунктов s ON s.id=d.punkt 
     LEFT JOIN БазаСвойствОбъектов b1 ON d.date_fiks=b1.date_fiks and d.id=b1.id and b1.pokaz='KOL_KOMN'
     LEFT JOIN БазаСвойствОбъектов b2 ON d.date_fiks=b2.date_fiks and d.id=b2.id and b2.pokaz='PLOSH_ALL'
     LEFT JOIN БазаСвойствОбъектов b3 ON d.date_fiks=b3.date_fiks and d.id=b3.id and b3.pokaz='PLOSH_GIL'
     WHERE d.date_fiks='1899-12-30' and 
          (d.candelete=false or d.candelete is null) 
     GROUP BY 1
