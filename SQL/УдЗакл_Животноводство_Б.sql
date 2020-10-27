DELETE FROM БазаСвойствОбъектов
  WHERE date_fiks='1899-12-30' and 
  (POKAZ='MEAT' or POKAZ='K_MEAT' or POKAZ='S_MEAT' or POKAZ='P_MEAT' or  
   POKAZ='MOLOKO' or POKAZ='KOR_MOLOKO' or POKAZ='KOZ_MOLOKO' or  
   POKAZ='JAICA' or POKAZ='MED' )
