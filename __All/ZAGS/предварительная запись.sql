CREATE TABLE PredZapis ( 
      ID AutoInc,
      TYPEOBJ Integer,
      MESTO Integer,
      GOD Short,
      MONTH Short,
      DAY Short,
      BEGINR Time,
      LONGR Short,
      TYPEZ Short,
      DECL_ID Integer,
      AKT_ID Integer,
      NOMER Integer,
      DATER TimeStamp,
      DATE_CORR ModTime,
      DATEB Date,
      OPIS Memo,
      SPEC CIChar( 50 ),
      TELEFON CIChar( 20 ),
      ON_FIO CIChar( 50 ),
      ONA_FIO CIChar( 50 ),
      FIRST_BRAK Logical,
      OTKAZ Logical) IN DATABASE;
EXECUTE PROCEDURE sp_CreateIndex( 
   'PredZapis',
   'PredZapis.adi',
   'PR_KEY',
   'ID',
   '',
   3,
   512 );


EXECUTE PROCEDURE sp_CreateIndex( 
   'PredZapis',
   'PredZapis.adi',
   'DECL_KEY',
   'DECL_ID',
   '',
   2,
   512 );


EXECUTE PROCEDURE sp_CreateIndex( 
   'PredZapis',
   'PredZapis.adi',
   'MESTO_KEY',
   'MESTO',
   '',
   2,
   512 );


EXECUTE PROCEDURE sp_CreateIndex( 
   'PredZapis',
   'PredZapis.adi',
   'NOMER_KEY',
   'GOD;NOMER',
   '',
   2,
   512 );


EXECUTE PROCEDURE sp_CreateIndex( 
   'PredZapis',
   'PredZapis.adi',
   'VIEW_KEY',
   'OTKAZ;TYPEOBJ;MESTO;GOD;MONTH;DAY;BEGINR',
   '',
   2,
   512 );


EXECUTE PROCEDURE sp_CreateIndex( 
   'PredZapis',
   'PredZapis.adi',
   'DATER_KEY',
   'DATER',
   '',
   2,
   512 );


EXECUTE PROCEDURE sp_ModifyTableProperty( 'PredZapis', 
   'Table_Auto_Create', 
   'True', 'APPEND_FAIL', 'PredZapisfail');

EXECUTE PROCEDURE sp_ModifyTableProperty( 'PredZapis', 
   'Table_Primary_Key', 
   'PR_KEY', 'APPEND_FAIL', 'PredZapisfail');

EXECUTE PROCEDURE sp_ModifyTableProperty( 'PredZapis', 
   'Table_Permission_Level', 
   '2', 'APPEND_FAIL', 'PredZapisfail');

EXECUTE PROCEDURE sp_ModifyTableProperty( 'PredZapis', 
   'Table_Memo_Block_Size', 
   '32', 'APPEND_FAIL', 'PredZapisfail');

EXECUTE PROCEDURE sp_ModifyTableProperty( 'PredZapis', 
   'Triggers_Disabled', 
   'False', 'APPEND_FAIL', 'PredZapisfail');

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'TYPEOBJ', 'Field_Can_Be_Null', 
      'False', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'TYPEOBJ', 'Comment', 
      '��� �������', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'MESTO', 'Field_Default_Value', 
      '0', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'MESTO', 'Comment', 
      '����� �����������', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'GOD', 'Field_Can_Be_Null', 
      'False', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'GOD', 'Comment', 
      '���', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'MONTH', 'Field_Can_Be_Null', 
      'False', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'MONTH', 'Comment', 
      '�����', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'DAY', 'Field_Can_Be_Null', 
      'False', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'DAY', 'Comment', 
      '����', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'BEGINR', 'Field_Validation_Msg', 
      '����� ������', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'LONGR', 'Comment', 
      '������������������', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'TYPEZ', 'Field_Can_Be_Null', 
      'False', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'TYPEZ', 'Field_Default_Value', 
      '0', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'TYPEZ', 'Comment', 
      '��� ���������. ������ (0-���������.,1-�������., 9-������', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'DECL_ID', 'Comment', 
      'ID ���������', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'AKT_ID', 'Comment', 
      'ID ������� ������', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'NOMER', 'Comment', 
      '����� ��������������� ������ ������', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'DATER', 'Comment', 
      '���� ��������������� ������', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'DATE_CORR', 'Comment', 
      '���� ��������� ������������', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'DATEB', 'Comment', 
      '�� ����� ���� �������������', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'SPEC', 'Comment', 
      '����������', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'TELEFON', 'Comment', 
      '���������� �������', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'ON_FIO', 'Comment', 
      '����� ���', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'ONA_FIO', 'Comment', 
      '������� ���', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'FIRST_BRAK', 'Field_Default_Value', 
      'true', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'FIRST_BRAK', 'Comment', 
      '���� �������', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'OTKAZ', 'Field_Default_Value', 
      'false', 'APPEND_FAIL', 'PredZapisfail' ); 

EXECUTE PROCEDURE sp_ModifyFieldProperty ( 'PredZapis', 
      'OTKAZ', 'Comment', 
      '����� �� ������', 'APPEND_FAIL', 'PredZapisfail' ); 

