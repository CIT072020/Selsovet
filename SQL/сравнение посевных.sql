SELECT l.nomer,
    sum(CASE WHEN POKAZ='POSEV'      THEN cast(NValue as sql_numeric) ELSE 0 END) NUM_ALL, 
    sum(CASE WHEN POKAZ='POSEV_ZERN' THEN cast(NValue as sql_numeric) ELSE 0 END) NUM1,
    sum(CASE WHEN POKAZ='POSEV_KART' THEN cast(NValue as sql_numeric) ELSE 0 END) NUM2,
    sum(CASE WHEN POKAZ='POSEV_OV'   THEN cast(NValue as sql_numeric) ELSE 0 END) NUM3,
    sum(CASE WHEN POKAZ='POSEV_KORM' THEN cast(NValue as sql_numeric) ELSE 0 END) NUM4,
    sum(CASE WHEN POKAZ='POSEV_TRAV' THEN cast(NValue as sql_numeric) ELSE 0 END) NUM5
   FROM Ѕаза—войствќбъектов b
   LEFT JOIN Ћицевые—чета l ON l.id=b.id and l.date_fiks=b.date_fiks
   WHERE l.date_fiks='1899-12-30'
   GROUP BY l.nomer
   having num_all<>num1+num2+num3+num4+num5
