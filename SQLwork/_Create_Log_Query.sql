CREATE TABLE logtable ( 
      ID AutoInc,
      [Start Time] TimeStamp,
      Optimized Logical,
      [Return Code] Integer,
      [Rows Affected] Integer,
      [End Time] TimeStamp,
      [Run Time] Double( 15 ),
      Database Char( 255 ),
      [User Name] Char( 100 ),
      [Connection Name] Char( 100 ),
      [Application ID] Memo,
      Query Memo) IN DATABASE;
