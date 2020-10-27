--    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV_ZERN')+' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM2,'+
--    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV_KART')+' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM3,'+
--    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV_OV')  +' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM4,'+
--    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV_KORM')+' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM5,'+
--    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV_TRAV')+' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM6,'+
--    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV') +    ' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM14 '+
SELECT l.nomer, IFNULL(b1.nvalue,0) posev_zern, IFNULL(b2.nvalue,0) posev_kart,
       IFNULL(b3.nvalue,0) posev_ov, IFNULL(b4.nvalue,0) posev_korm,
       IFNULL(b5.nvalue,0) posev_trav, IFNULL(ba.nvalue,0) posev
FROM ЛицевыеСчета l
LEFT JOIN БазаСвойствОбъектов b1 ON b1.id=l.id and b1.pokaz='POSEV_ZERN' and b1.typeobj=2 
LEFT JOIN БазаСвойствОбъектов b2 ON b2.id=l.id and b2.pokaz='POSEV_KART' and b2.typeobj=2 
LEFT JOIN БазаСвойствОбъектов b3 ON b3.id=l.id and b3.pokaz='POSEV_OV' and b3.typeobj=2
LEFT JOIN БазаСвойствОбъектов b4 ON b4.id=l.id and b4.pokaz='POSEV_KORM' and b4.typeobj=2
LEFT JOIN БазаСвойствОбъектов b5 ON b5.id=l.id and b5.pokaz='POSEV_TRAV' and b5.typeobj=2
LEFT JOIN БазаСвойствОбъектов ba ON ba.id=l.id and ba.pokaz='POSEV' and ba.typeobj=2
--WHERE ba.nvalue=b1.nvalue+b2.nvalue+b3.nvalue+b4.nvalue --+b5.nvalue
WHERE IFNULL(ba.nvalue,0)<>IFNULL(b1.nvalue,0)+IFNULL(b2.nvalue,0)+IFNULL(b3.nvalue,0)+IFNULL(b4.nvalue,0)+IFNULL(b5.nvalue,0)
ORDER BY nomer
