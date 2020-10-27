SELECT l.nomer, IFNULL(b1.nvalue,0) posev_zern, IFNULL(b2.nvalue,0) posev_kart,
       IFNULL(b3.nvalue,0) posev_ov, IFNULL(b4.nvalue,0) posev_korm,
       IFNULL(b5.nvalue,0) posev_trav, IFNULL(ba.nvalue,0) posev
FROM ЛицевыеСчета l

LEFT JOIN БазаСвойствОбъектов b2 ON b2.id=l.id and b2.pokaz='K_MEAT' and b2.typeobj=2 
LEFT JOIN БазаСвойствОбъектов b3 ON b3.id=l.id and b3.pokaz='S_MEAT' and b3.typeobj=2
LEFT JOIN БазаСвойствОбъектов b4 ON b4.id=l.id and b4.pokaz='P_MEAT' and b4.typeobj=2
LEFT JOIN БазаСвойствОбъектов b5 ON b5.id=l.id and b5.pokaz='POSEV_TRAV' and b5.typeobj=2
LEFT JOIN БазаСвойствОбъектов ba ON ba.id=l.id and ba.pokaz='POSEV' and ba.typeobj=2
--WHERE ba.nvalue=b1.nvalue+b2.nvalue+b3.nvalue+b4.nvalue --+b5.nvalue
WHERE IFNULL(ba.nvalue,0)<>IFNULL(b1.nvalue,0)+IFNULL(b2.nvalue,0)+IFNULL(b3.nvalue,0)+IFNULL(b4.nvalue,0)+IFNULL(b5.nvalue,0)
ORDER BY nomer
