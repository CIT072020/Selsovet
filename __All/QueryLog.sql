CREATE TABLE QueryLog ( 
      ID AutoInc,
      [Start Time] TimeStamp,
      Optimized Logical,
      [Return Code] Integer,
      [Rows Affected] Integer,
      [End Time] TimeStamp,
      [Run Time] Double( 2 ),
      Database Char( 255 ),
      [User Name] Char( 100 ),
      [Connection Name] Char( 100 ),
      [Application ID] Memo,
      Query Memo) IN DATABASE;

EXECUTE PROCEDURE sp_CreateIndex( 
   'QueryLog',
   'QueryLog.adi',
   'ID',
   'ID',
   '',
   2,
   512 );


EXECUTE PROCEDURE sp_ModifyTableProperty( 'QueryLog', 
   'Table_Auto_Create', 
   'False', 'APPEND_FAIL', 'QueryLogfail');

EXECUTE PROCEDURE sp_ModifyTableProperty( 'QueryLog', 
   'Table_Permission_Level', 
   '2', 'APPEND_FAIL', 'QueryLogfail');

EXECUTE PROCEDURE sp_ModifyTableProperty( 'QueryLog', 
   'Table_Memo_Block_Size', 
   '512', 'APPEND_FAIL', 'QueryLogfail');

EXECUTE PROCEDURE sp_ModifyTableProperty( 'QueryLog', 
   'Triggers_Disabled', 
   'False', 'APPEND_FAIL', 'QueryLogfail');

