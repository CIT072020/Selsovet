SELECT 
    CAST( Sum( CASE WHEN POKAZ='POSEV_ZERN'   THEN NValue ELSE 0 END) AS SQL_NUMERIC) NUM2,
    CAST( Sum( CASE WHEN POKAZ='POSEV_KART'   THEN NValue ELSE 0 END) AS SQL_NUMERIC) NUM3,
    CAST( Sum( CASE WHEN POKAZ='POSEV_OV'     THEN NValue ELSE 0 END) AS SQL_NUMERIC) NUM4,
    CAST( Sum( CASE WHEN POKAZ='POSEV_KORM'   THEN NValue ELSE 0 END) AS SQL_NUMERIC) NUM5,
    CAST( Sum( CASE WHEN POKAZ='POSEV_TRAV'   THEN NValue ELSE 0 END) AS SQL_NUMERIC) NUM6,
    CAST( Sum( CASE WHEN POKAZ='PR_SERNO'     THEN NValue ELSE 0 END) AS SQL_NUMERIC) NUM7,
    CAST( Sum( CASE WHEN POKAZ='PR_KART'      THEN NValue ELSE 0 END) AS SQL_NUMERIC) NUM8,
    CAST( Sum( CASE WHEN POKAZ='PR_OVOCHI'    THEN NValue ELSE 0 END) AS SQL_NUMERIC) NUM9,
    CAST( Sum( CASE WHEN POKAZ='PR_OVOCH_Z'   THEN NValue ELSE 0 END) AS SQL_NUMERIC) NUM10
     FROM ������������������� b 
     LEFT JOIN ������������ l ON l.id=b.id and l.date_fiks=b.date_fiks
     WHERE b.date_fiks='1899-12-30' and b.typeobj=2
