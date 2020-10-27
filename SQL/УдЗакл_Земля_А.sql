DELETE FROM БазаСвойствОбъектов
  WHERE date_fiks='1899-12-30' and 
  (POKAZ='VSEGO' or POKAZ='SOBST' or POKAZ='POSTR' or POKAZ='PRIUSAD' or  
   POKAZ='SOTKI' or POKAZ='ARENDA')
