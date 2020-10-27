SELECT s.name, 
    Count(*) COUNT_PUNKT,
    Sum( CAST(b3.nvalue as SQL_NUMERIC) ) PLOSH_ZDAN,
    Sum( CAST(b1.nvalue as SQL_NUMERIC) ) PLOSH_ALL,
    Sum( CAST(b2.nvalue as SQL_NUMERIC) ) PLOSH_GIL,
    Sum( CASE WHEN b6.value='1' THEN 1 ELSE 0 END ) VANNA,     //5
    Sum( CASE WHEN b4.value='1' THEN 1 ELSE 0 END ) VODOPROV,
    Sum( CASE WHEN b5.value='1' THEN 1 ELSE 0 END ) KANALIZ,
    Sum( CASE WHEN b7.value='1' THEN 1 ELSE 0 END ) CENT_OTOP,
    Sum( CASE WHEN b8.value='1' THEN 1 ELSE 0 END ) GOR_VODA,
    Sum( CASE WHEN b9.value='1' THEN 1 ELSE 0 END ) GAZ,          //10
    Sum( CASE WHEN b10.value='1' THEN 1 ELSE 0 END ) GID_GAZ,     //11
    Sum( CASE WHEN b11.value='1' THEN 1 ELSE 0 END ) EL_PLIT,     //12
    Sum( CASE WHEN b4.value='1' THEN CAST(b1.nvalue as SQL_NUMERIC) ELSE 0 END ) PL_VODOPROV,
    Sum( CASE WHEN b5.value='1' THEN CAST(b1.nvalue as SQL_NUMERIC) ELSE 0 END ) PL_KANALIZ,
    Sum( CASE WHEN b7.value='1' THEN CAST(b1.nvalue as SQL_NUMERIC) ELSE 0 END ) PL_CENT_OTOP,
    Sum( CASE WHEN b8.value='1' THEN CAST(b1.nvalue as SQL_NUMERIC) ELSE 0 END ) PL_GOR_VODA,
    Sum( CASE WHEN b9.value='1' THEN CAST(b1.nvalue as SQL_NUMERIC) ELSE 0 END ) PL_GAZ,
    Sum( CASE WHEN b10.value='1' THEN CAST(b1.nvalue as SQL_NUMERIC) ELSE 0 END ) PL_GID_GAZ,
    Sum( CASE WHEN b11.value='1' THEN CAST(b1.nvalue as SQL_NUMERIC) ELSE 0 END ) PL_EL_PLIT,   //19
    Sum( CASE WHEN b6.value='1' THEN CAST(b1.nvalue as SQL_NUMERIC) ELSE 0 END ) PL_VANNA       //20
     FROM БазаДомов d 
     LEFT JOIN СпрНасПунктов s ON s.id=d.punkt 
     LEFT JOIN БазаСвойствОбъектов b1 ON d.date_fiks=b1.date_fiks and d.id=b1.id and b1.pokaz='PLOSH_ALL'
     LEFT JOIN БазаСвойствОбъектов b2 ON d.date_fiks=b2.date_fiks and d.id=b2.id and b2.pokaz='PLOSH_GIL'
     LEFT JOIN БазаСвойствОбъектов b3 ON d.date_fiks=b3.date_fiks and d.id=b3.id and b3.pokaz='PLOSH_ZDAN'
     LEFT JOIN БазаСвойствОбъектов b4 ON d.date_fiks=b4.date_fiks and d.id=b4.id and b4.pokaz='VODOPROV'
     LEFT JOIN БазаСвойствОбъектов b5 ON d.date_fiks=b5.date_fiks and d.id=b5.id and b5.pokaz='KANALIZ'
     LEFT JOIN БазаСвойствОбъектов b6 ON d.date_fiks=b6.date_fiks and d.id=b6.id and b6.pokaz='VANNA'
     LEFT JOIN БазаСвойствОбъектов b7 ON d.date_fiks=b7.date_fiks and d.id=b7.id and b7.pokaz='CENT_OTOP'
     LEFT JOIN БазаСвойствОбъектов b8 ON d.date_fiks=b8.date_fiks and d.id=b8.id and b8.pokaz='GOR_VODA'
     LEFT JOIN БазаСвойствОбъектов b9 ON d.date_fiks=b9.date_fiks and d.id=b9.id and b9.pokaz='GAZ'
     LEFT JOIN БазаСвойствОбъектов b10 ON d.date_fiks=b10.date_fiks and d.id=b10.id and b10.pokaz='GID_GAZ'
     LEFT JOIN БазаСвойствОбъектов b11 ON d.date_fiks=b11.date_fiks and d.id=b11.id and b11.pokaz='EL_PLIT'
     WHERE d.date_fiks='1899-12-30' and 
        (d.candelete=false or d.candelete is null)
     GROUP BY 1
