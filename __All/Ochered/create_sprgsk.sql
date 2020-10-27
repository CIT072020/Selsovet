CREATE TABLE SprGSK ( 
      id AutoInc,
      Name CIChar( 30 ),
      Adres_Id Integer,
      Text_Adres Char( 200 ),
      KolKv Short,
      KolKv1 Short,
      KolKv2 Short,
      KolKv3 Short,
      KolKv4 Short,
      PloshAll Double( 15 ),
      PloshGil Double( 15 ),
      PloshSnip Money,
      ReshDate TimeStamp,
      ReshNomer Integer,
      GIKDate TimeStamp,
      GIKNomer Short) IN DATABASE;
EXECUTE PROCEDURE sp_CreateIndex( 
   'SprGSK',
   'SprGSK.adi',
   'PR_KEY',
   'id',
   '',
   3,
   512 );


EXECUTE PROCEDURE sp_CreateIndex( 
   'SprGSK',
   'SprGSK.adi',
   'NAME_KEY',
   'Name',
   '',
   3,
   512 );


EXECUTE PROCEDURE sp_ModifyTableProperty( 'SprGSK', 
   'Table_Auto_Create', 
   'True', 'APPEND_FAIL', 'SprGSKfail');

EXECUTE PROCEDURE sp_ModifyTableProperty( 'SprGSK', 
   'Table_Primary_Key', 
   'PR_KEY', 'APPEND_FAIL', 'SprGSKfail');

EXECUTE PROCEDURE sp_ModifyTableProperty( 'SprGSK', 
   'Table_Default_Index', 
   'NAME_KEY', 'APPEND_FAIL', 'SprGSKfail');

EXECUTE PROCEDURE sp_ModifyTableProperty( 'SprGSK', 
   'Table_Permission_Level', 
   '2', 'APPEND_FAIL', 'SprGSKfail');

EXECUTE PROCEDURE sp_ModifyTableProperty( 'SprGSK', 
   'Triggers_Disabled', 
   'False', 'APPEND_FAIL', 'SprGSKfail');

