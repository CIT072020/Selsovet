
unit CheckDictionary;

interface

uses
  Windows, Messages, SysUtils, Classes,
  adsdata, adsfunc, adstable, adscnnct, adsdictionary, ace, db,
  dbFunc, funcpr, dialogs
  {$IFDEF VER150} ,Variants {$ENDIF}  ;

const
   SYS_OBJECT_NAME    = 'Name';
   SYS_OBJECT_PARENT  = 'Parent';
   MAX_ARRAY_SIZE = 255;

   arrPropDataBase : array[0..13] of String =('VERSION_MAJOR','VERSION_MINOR',
           'LOG_IN_REQUIRED', 'VERIFY_ACCESS_RIGHTS', 'ENCRYPT_TABLE_PASSWORD',
           'ENCRYPT_NEW_TABLE', 'ENABLE_INTERNET', 'INTERNET_SECURITY_LEVEL',
           'MAX_FAILED_ATTEMPTS', 'COMMENT', 'FTS_DELIMITERS',
           'FTS_NOISE_WORDS', 'FTS_DROP_CHARS', 'FTS_CONDITIONAL_CHARS');
         // 'DEFAULT_TABLE_PATH', 'TEMP_TABLE_PATH',

   arrPropTable : array[0..7] of String =('TABLE_AUTO_CREATE','TABLE_PRIMARY_KEY',
            'TABLE_DEFAULT_INDEX','TABLE_PERMISSION_LEVEL','TABLE_VALIDATION_MSG',
            'TABLE_VALIDATION_EXPR', 'COMMENT', 'TABLE_MEMO_BLOCK_SIZE');
             //TABLE_ENCRYPTION
   arrPropLinks : array[0..3] of String =('LINK_OPTIONS','LINK_PATH',
                                  'NAME', 'LINK_USERNAME');
type
   TTypeCheck = (tcOk,tcChStru, tcChConst);
   TCheckObjectType = ( coTable, coRI, coTrigger, coDataBase, coLinks, coScript );
   TEnabledCheckObjects = set of TCheckObjectType;

   TCheckObject=class(TObject)
   private
     FMainCheck    : TStringList;
     FExtCheck     : TStringList;
     FBeforeCheck  : TStringList;
     FAfterCheck   : TStringList;
     FObjectType: TCheckObjectType;
     procedure SetObjectType(const Value: TCheckObjectType);
   public
     property ObjectType  : TCheckObjectType read FObjectType write SetObjectType;
     property BeforeCheck : TStringList read FBeforeCheck;
     property MainCheck   : TStringList read FMainCheck;
     property ExtCheck    : TStringList read FExtCheck;
     property AfterCheck  : TStringList read FAfterCheck;
     constructor Create;
     destructor Destroy; override;
   end;

   TCheckScript=class(TCheckObject)
     constructor Create;
   end;
   TCheckRI=class(TCheckObject)
     constructor Create;
   end;
   TCheckLinks=class(TCheckObject)
     constructor Create;
   end;
   TCheckDataBase=class(TCheckObject)
     constructor Create;
   end;
   TCheckTable=class(TCheckObject)
   public
     ListCreateTables : TStringList;
     constructor Create;
     destructor Destroy; override;
   end;

   TListCheck=class(TObject)
   private
     FList : TStringList;
   public
     function  CountObjects : Integer;
     procedure AddObject( Check : TCheckObject);
     procedure DelObject( i : Integer);
     procedure ClsObject( i : Integer);
     procedure SetObject( i : Integer; Check : TCheckObject);
     function  GetObject( i : Integer ) : TCheckObject;
     constructor Create;
     destructor Destroy; override;
   end;

   TCheckDictionary=class(TObject)
   private
     Def_FTS_NOISE_WORDS:String;
     Def_FTS_DELIMITERS:String;
     Def_FTS_DROP_CHARS:String;
     Def_FTS_CONDITIONAL_CHARS:String;

     FListCheck  : TListCheck;
     FCurDict    : TAdsDictionary;
     FNewDict    : TAdsDictionary;
     FCurConnect : TAdsConnection;
     FNewConnect : TAdsConnection;
     FCheckCommentColumn: Boolean;
     FShowCheck: Boolean;
     FEnableCloseCheck : Boolean;
//     FQueryC : TAdsQuery;
//     FQueryN : TAdsQuery;
     procedure SetCurConnect(const Value: TAdsConnection);
     procedure SetNewConnect(const Value: TAdsConnection);
     function  GetStruColumn(ds : TDataSet) : String;
     procedure SetCheckCommentColumn(const Value: Boolean);
     procedure SetShowCheck(const Value: Boolean);
     procedure ChangeShow( strNew : String);
     function  ValueAsString( fld : TField) : String; overload;
     function  GetValueAsString( fld : TField) : String;
     function  ValueAsString( v : Variant) : String; overload;
//     function GetLinkPath(strName : String) : String;
   public
     ADS10:Boolean;
     FOnly:Boolean;
     TablesNotCheck:String;
     EnabledCheckObjects : TEnabledCheckObjects;
     function  CheckDataBase : Boolean;
     procedure CheckLinks;

     property  ShowCheck : Boolean read FShowCheck write SetShowCheck;
     procedure ScriptForModifyDataBaseProperty( poSQL : TStringList );

     property  CheckCommentColumn : Boolean read FCheckCommentColumn write SetCheckCommentColumn;
     function  CheckStruCurrentColumn(QueryC,QueryN : TAdsQuery;
                var slExtProc : TStringList) : String;
     function  CreatePropCurrentColumn(Query : TAdsQuery; var slExtProc : TStringList) : String;
     function  GetScript(sl : TStringList) : Boolean;
     procedure GetCreateTables(sl: TStringList);
     procedure CheckTables;
     procedure CheckTable(QueryCur,QueryNew : TAdsQuery; n : Integer);
     procedure CheckRelations;

     procedure CheckFunctions;
     procedure ScriptForCreateFunction(poSQL : TStringList; poQuery : TAdsQuery);   //
     procedure ScriptForDropFunction(poSQL : TStringList; poQuery : TAdsQuery);     //DropRelationStmp

     procedure CheckStoredProcedure;
     procedure ScriptForDropProcedure(poSQL : TStringList; poQuery : TAdsQuery);     //DropRelationStmp
     procedure ScriptForCreateProcedure(poSQL : TStringList; poQuery : TAdsQuery);     //DropRelationStmp
     procedure AddProcedureParameters( poSQL: TStrings; strParameters : string; bOutput: boolean);

     procedure ScriptForCreateTableProperty( QueryCur : TAdsQuery; poSQL : TStringList);
     procedure ScriptForModifyTableProperty( QueryC,QueryN : TAdsQuery; poSQL : TStringList);
     procedure ScriptForModifyTablePropertyIndex( QueryN : TAdsQuery; poSQL : TStringList);


     procedure ModifyTableProperty( poSQL : TStringList;
                 strTable : string; strProperty : string; strValue : string);
     function CheckIndexTable(strTableName : String;
               var slDrop,slCreate : TStringList) : Boolean;
     procedure CreateIndexStmt( poSQL : TStringList; poQuery : TAdsQuery );
     procedure DropIndexStmt( poSQL : TStringList; poQuery : TAdsQuery );

     procedure CreateRelationStmp( poSQL : TStringList; poQuery : TAdsQuery);
     procedure DropRelationStmp(poSQL : TStringList; poQuery : TAdsQuery);

     function  CheckStruCurrentIndex(QueryCur,QueryNew : TAdsQuery;
                                     var slCreate,slDrop : TStringList) : Boolean;

     function SeekRelation(strTableName,strIndexName : String) : String;
     procedure ScriptForCreateTable(QueryCur : TAdsQuery; n : Integer);
     procedure ScriptForDropTable(QueryCur : TAdsQuery; n : Integer);
     procedure ScriptForCreateIndex(QueryCur : TAdsQuery; var slCreate : TStringList);

     property CurConnect : TAdsConnection read FCurConnect write SetCurConnect;
     property NewConnect : TAdsConnection read FNewConnect write SetNewConnect;
     procedure CreateSystemQuery(var QueryCur,QueryNew : TAdsQuery; strSQL : String);
     procedure FreeSystemQuery(var QueryCur,QueryNew : TAdsQuery);
     function SysQuery(sText:String):String;
     constructor Create(NewDict, CurDict : TAdsDictionary);
     destructor  Destroy; override;
   end;

  PTypeField = ^TTypeField;
  TTypeField = record
    Name : String;
    Ads  : TAdsFieldTypes;
  end;

const
  ArrSootv : array[1..22] of TTypeField =
             (
               (Name:'LOGICAL'      ;  Ads:AdsfldLOGICAL     ),  //1  ADS_LOGICAL
               (Name:'NUMERIC'      ;  Ads:AdsfldNUMERIC     ),  //2  ADS_NUMERIC
               (Name:'DATE'         ;  Ads:AdsfldDATE        ),  //3  ADS_DATE
               (Name:'CHAR'         ;  Ads:AdsfldSTRING      ),  //4  ADS_STRING
               (Name:'MEMO'         ;  Ads:AdsfldMEMO        ),  //5  ADS_MEMO
               (Name:'BLOB'         ;  Ads:AdsfldBINARY      ),  //6  ADS_BINARY
               (Name:'BLOB'         ;  Ads:AdsfldIMAGE       ),  //7  ADS_IMAGE
               (Name:'VARCHAR'      ;  Ads:AdsfldVARCHAR     ),  //8 не поддерж.
               (Name:'COMPACTDATE'  ;  Ads:AdsfldCOMPACTDATE ),  //9 не поддерж.
               (Name:'DOUBLE'       ;  Ads:AdsfldDOUBLE      ),  //10 ADS_DOUBLE
               (Name:'INTEGER'      ;  Ads:AdsfldINTEGER     ),  //11 ADS_INTEGER
               (Name:'SHORT'        ;  Ads:AdsfldSHORTINT    ),  //12
               (Name:'TIME'         ;  Ads:AdsfldTIME        ),  //13
               (Name:'TIMESTAMP'    ;  Ads:AdsfldTIMESTAMP   ),  //14
               (Name:'AUTOINC'      ;  Ads:AdsfldAUTOINC     ),  //15
               (Name:'RAW'          ;  Ads:AdsfldRAW         ),  //16
               (Name:'CURDOUBLE'    ;  Ads:AdsfldCURDOUBLE   ),  //17
               (Name:'MONEY'        ;  Ads:AdsfldMONEY       ),  //18
               (Name:'LONGLONG'     ;  Ads:AdsfldMONEY       ),  //19 // фиктивный тип
               (Name:'CICHAR'       ;  Ads:AdsfldCISTRING    ),  //20
               (Name:'ROWVERSION'   ;  Ads:AdsfldROWVERSION  ),  //21
               (Name:'MODTIME'      ;  Ads:AdsfldMODTIME     )   //22
             );

  function AdsType2Str(AdsType: TAdsFieldTypes): String;

implementation


function AdsType2Str(AdsType: TAdsFieldTypes): String;
var
  i : Integer;
begin
  Result := '';
  for i:=Low(ArrSootv) to High(ArrSootv) do begin
    if ArrSootv[i].Ads = AdsType then begin
      Result := ArrSootv[i].Name;
      break;
    end;
  end;
end;

{ TCheckDictionary }

procedure TCheckDictionary.CreateSystemQuery(var QueryCur,QueryNew : TAdsQuery; strSQL : String);
begin
  QueryNew := TAdsQuery.Create(nil);
  with QueryNew do begin
    DatabaseName:=FNewConnect.Name;
    SQL.Text := strSQL;
    Open;
  end;
  QueryCur := TAdsQuery.Create(nil);
  with QueryCur do begin
    DatabaseName:=FCurConnect.Name;
    SQL.Text := strSQL;
    Open;
  end;
end;
procedure TCheckDictionary.FreeSystemQuery(var QueryCur,QueryNew : TAdsQuery);
begin
  FreeAndNil(QueryNew);
  FreeAndNil(QueryCur);
end;

//-------------------------------------------------------------------------------
function TCheckDictionary.CheckStruCurrentIndex(QueryCur,
               QueryNew: TAdsQuery; var slCreate, slDrop: TStringList): Boolean;
begin
  Result := true;
  if (QueryCur.FieldByName('Index_File_Name').AsString<>
      QueryNew.FieldByName('Index_File_Name').AsString) or
     (QueryCur.FieldByName('Index_Options').AsString<>
      QueryNew.FieldByName('Index_Options').AsString) or
     (lowercase(QueryCur.FieldByName('Index_Expression').AsString)<>
      lowercase(QueryNew.FieldByName('Index_Expression').AsString)) or
     (QueryCur.FieldByName('Index_Condition').AsString<>
      QueryNew.FieldByName('Index_Condition').AsString) or
     (QueryCur.FieldByName('Index_Key_Length').AsString<>
      QueryNew.FieldByName('Index_Key_Length').AsString) or
     (lowercase(Trim(QueryCur.FieldByName('Comment').AsString))<>
      lowercase(Trim(QueryNew.FieldByName('Comment').AsString))) or
     (QueryCur.FieldByName('Index_FTS_Min_Length').AsString<>
      QueryNew.FieldByName('Index_FTS_Min_Length').AsString)
//      or         происходит дублироание свойств ??? разобратьс€ потом
//     (QueryCur.FieldByName('Index_FTS_Delimiters').AsString<>
//      QueryNew.FieldByName('Index_FTS_Delimiters').AsString) or
//     (QueryCur.FieldByName('Index_FTS_Noise').AsString<>
//      QueryNew.FieldByName('Index_FTS_Noise').AsString) or
//     (QueryCur.FieldByName('Index_FTS_Drop_Chars').AsString<>
//      QueryNew.FieldByName('Index_FTS_Drop_Chars').AsString) or
//     (QueryCur.FieldByName('Index_FTS_Conditional_Chars').AsString<>
//      QueryNew.FieldByName('Index_FTS_Conditional_Chars').AsString)
  then begin
    DropIndexStmt( slDrop, QueryCur);
    CreateIndexStmt( slCreate, QueryNew);
    Result:=false;
  end;
end;

//-------------------------------------------------------------------------------
procedure TCheckDictionary.DropIndexStmt( poSQL : TStringList; poQuery : TAdsQuery );
begin
  poSQL.Add('DROP INDEX '+poQuery.FieldByName('Parent').AsString+'.'+
             poQuery.FieldByName('Name').AsString+';');
end;
//--------------------------------------------------------------------------------
procedure TCheckDictionary.CreateIndexStmt( poSQL : TStringList; poQuery : TAdsQuery );
var
   iIndexOptions : integer;
   poIndexFile   : TAdsQuery;
   s:String;
begin
   iIndexOptions := poQuery.FieldByName( 'Index_Options' ).AsInteger;

   {* See if this is an FTS Index by checking if min word length is not null. *}
   if ( poQuery.FieldByName( 'Index_FTS_Min_Length' ).IsNull = False ) then
   begin
      poSQL.Add( 'CREATE INDEX ' + QIdent( poQuery.FieldByName( SYS_OBJECT_NAME ).AsString ) + ' ON ' );
      poSQL.Add( '      ' + QIdent( poQuery.FieldByName( 'Parent' ).AsString ) + ' ( ' );
      poSQL.Add( '      ' + QIdent( poQuery.FieldByName( 'Index_Expression' ).AsString ) + ' )' );
      poSQL.Add( '      CONTENT MIN WORD ' + poQuery.FieldByName( 'Index_FTS_Min_Length' ).AsString );
      poSQL.Add( '      MAX WORD ' + poQuery.FieldByName( 'Index_Key_Length' ).AsString );
      poSQL.Add( '      DELIMITERS ' + QStr( poQuery.FieldByName( 'Index_FTS_Delimiters' ).AsString ) );
      s:=StringReplace( poQuery.FieldByName( 'Index_FTS_Drop_Chars' ).AsString, '''', '''''', [rfReplaceAll]);
      poSQL.Add( '      DROPCHARS ' + QStr(s) );
      poSQL.Add( '      NOISE ' + QStr( poQuery.FieldByName( 'Index_FTS_Noise' ).AsString ) );
      poSQL.Add( '      CONDITIONALS ' + QStr( poQuery.FieldByName( 'Index_FTS_Conditional_Chars' ).AsString ) );

      if (( iIndexOptions AND ADS_FTS_FIXED ) = ADS_FTS_FIXED ) then
         poSQL.Add( '      ' + 'NOTMAINTAINED ' );

      if (( iIndexOptions AND ADS_FTS_CASE_SENSITIVE ) = ADS_FTS_CASE_SENSITIVE ) then
         poSQL.Add( '      ' + 'CASESENSITVIE ' );

      if (( iIndexOptions AND ADS_FTS_KEEP_SCORE ) = ADS_FTS_KEEP_SCORE ) then
         poSQL.Add( '      ' + 'KEEPSCORE ' );

      if (( iIndexOptions AND ADS_FTS_PROTECT_NUMBERS ) = ADS_FTS_PROTECT_NUMBERS ) then
         poSQL.Add( '      ' + 'PROTECTNUMBERS ' );
      {* Retrieve the index page size from the parent index. *}
      poIndexFile := TAdsQuery.Create( nil );
      try

         poIndexFile.DatabaseName := poQuery.DatabaseName;
         poIndexFile.SQL.Add( 'SELECT * FROM '+SysQuery('system.indexfiles')+' WHERE Name = ' + QStr( poQuery.FieldByName( 'Index_File_Name' ).AsString ) );
         poIndexFile.Open;

         poSQL.Add( '      PAGESIZE ' + poIndexFile.FieldByName( 'Index_File_PageSize' ).AsString );

 
      finally
         poIndexFile.Close;
         FreeAndNil( poIndexFile );
      end;

      poSQL.Add( '      IN FILE "' + poQuery.FieldByName( 'Index_File_Name' ).AsString + '";' );

   end {* if *}
   else
   begin

      poSQL.Add( 'EXECUTE PROCEDURE sp_CreateIndex( ' );
      poSQL.Add( '   ' + QStr( poQuery.FieldByName( 'Parent' ).AsString ) + ',' );
      poSQL.Add( '   ' + QStr( poQuery.FieldByName( 'Index_File_Name' ).AsString ) + ',' );
      poSQL.Add( '   ' + QStr( poQuery.FieldByName( SYS_OBJECT_NAME ).AsString ) + ',' );
      poSQL.Add( '   ' + QStr( poQuery.FieldByName( 'Index_Expression' ).AsString ) + ',' );
      poSQL.Add( '   ' + QStr( poQuery.FieldByName( 'Index_Condition' ).AsString ) + ',' );
      poSQL.Add( '   ' + poQuery.FieldByName( 'Index_Options' ).AsString + ',' );

      {* Retrieve the index page size from the parent index. *}
      poIndexFile := TAdsQuery.Create( nil );
      try

         poIndexFile.DatabaseName := poQuery.DatabaseName;
         poIndexFile.SQL.Add( 'SELECT * FROM '+SysQuery('system.indexfiles')+' WHERE Name = ' + QStr( poQuery.FieldByName( 'Index_File_Name' ).AsString ) );
         poIndexFile.Open;

         poSQL.Add( '   ' + poIndexFile.FieldByName( 'Index_File_PageSize' ).AsString  + ' );' );


      finally
         poIndexFile.Close;
         FreeAndNil( poIndexFile );
      end;

   end;

   if Trim(poQuery.FieldByName( 'Comment' ).AsString)<>'' then begin
     poSQL.Add( '' );
     poSQL.Add('EXECUTE PROCEDURE sp_ModifyIndexProperty( ');
     poSQL.Add( '   ' + QStr( poQuery.FieldByName( 'Parent' ).AsString ) + ',' );
     poSQL.Add( '   ' + QStr( poQuery.FieldByName( SYS_OBJECT_NAME ).AsString ) + ',' );
     poSQL.Add( '   ' + QStr( 'COMMENT') + ',' );
     poSQL.Add( '   ' + QStr( poQuery.FieldByName( 'Comment' ).AsString ) +' );');
   end;

   poSQL.Add( '' );

end;

//-------------------------------------------------------------------------------
function TCheckDictionary.CheckIndexTable(strTableName : String;
          var slDrop,slCreate : TStringList) : Boolean;
var
  QueryN, QueryC   : TAdsQuery;
  QueryNF, QueryCF : TAdsQuery;
  lReCreate : Boolean;
//  strTableName : String;
begin
//  strTableName := QueryCur.FieldByName('Name').AsString;
  Result := false;
  CreateSystemQuery(QueryC,QueryN,'SELECT * FROM '+SysQuery('SYSTEM.INDEXES')+' WHERE parent='+
                                  QStr(strTableName));
  QueryN.First;

  CreateSystemQuery(QueryCF,QueryNF,'SELECT * FROM '+SysQuery('SYSTEM.INDEXFILES')+' WHERE parent='+
                                  QStr(strTableName));
//                                  QueryN.FieldByName( 'Index_File_Name' ).AsString );

//  poSQL.Add( 'EXECUTE PROCEDURE sp_CreateIndex( ' );

//----- может нужно пересоздать весь индекс ---------------------------
  lReCreate := false;
  QueryCF.First;
  QueryNF.First;
  if QueryCF.FieldByName( 'Index_File_PageSize' ).AsString<>
     QueryNF.FieldByName( 'Index_File_PageSize' ).AsString  then begin
    lReCreate := true;
  end;
  FreeSystemQuery(QueryCF,QueryNF);
//---------------------------------------------------------------------
  if lReCreate then begin
    QueryC.First;
    while not QueryC.Eof do begin
      DropIndexStmt(slDrop, QueryC);
      QueryC.Next;
    end;
    QueryN.First;
    while not QueryN.Eof do begin
      CreateIndexStmt( slCreate, QueryN );
      QueryN.Next;
    end;
  end else begin
    QueryN.First;
    while not QueryN.Eof do begin
       // если индекс в старой базе существует
      if QueryC.Locate('Name',QueryN.FieldByName('Name').AsString,[loCaseInsensitive]) then begin
        if not CheckStruCurrentIndex(QueryC,QueryN,slCreate,slDrop) then begin
          Result := true;
        end;
      end else begin  // индекс в текущем словаре отсутствует
        CreateIndexStmt( slCreate, QueryN );
        Result := true;
      end;
      QueryN.Next;
    end;
    QueryC.First;
    while not QueryC.Eof do begin
      if not QueryN.Locate('Name',QueryC.FieldByName('Name').AsString,[loCaseInsensitive]) then begin
        DropIndexStmt(slDrop, QueryC);
        Result := true;
      end;
      QueryC.Next;
    end;
  end;
  FreeSystemQuery(QueryC,QueryN);
end;

//-----------------------------------------------------------------
procedure TCheckDictionary.CheckTable(QueryCur,QueryNew : TAdsQuery; n : Integer);
var
  QueryN, QueryC : TAdsQuery;
  QueryNInd, QueryCInd : TAdsQuery;
  ss : String;
  slExt : TStringList;
  slProp : TStringList;
  slChahgeColumn : TStringList;
  slDrop   : TStringList;
  slCreate : TStringList;
  strTableName : String;
  chTable : TCheckTable;
  i : Integer;
begin
  strTableName := QueryCur.FieldByName('Name').AsString;
  slDrop   := TStringList.Create;
  slCreate := TStringList.Create;
  slChahgeColumn := TStringList.Create;
  slExt:=TStringList.Create;
  slProp:=TStringList.Create;
  CreateSystemQuery(QueryCInd,QueryNInd,'SELECT * FROM '+SysQuery('SYSTEM.INDEXES')+' WHERE parent='+
                                   QStr(strTableName));
  CreateSystemQuery(QueryC,QueryN,'SELECT * FROM '+SysQuery('SYSTEM.COLUMNS')+' WHERE parent='+
                                   QStr(strTableName));
  QueryN.First;
  while not QueryN.Eof do begin
    if QueryC.Locate('Name',QueryN.FieldByName('Name').AsString,[loCaseInsensitive]) then begin
      ss := CheckStruCurrentColumn(QueryC,QueryN,slExt);
      if ss<>'' then begin
        slChahgeColumn.Add(ss);
      end;
    end else begin  // поле в текущем словаре отсутствует
      ss := CreatePropCurrentColumn(QueryN, slExt);
      slChahgeColumn.Add('  ADD COLUMN ' + ss);
    end;
    QueryN.Next;
  end;
  QueryC.First;
  while not QueryC.Eof do begin
    if not QueryN.Locate('Name',QueryC.FieldByName('Name').AsString,[loCaseInsensitive]) then begin
      slChahgeColumn.Add('  DROP COLUMN ' + QueryC.FieldByName('Name').AsString);
    end;
    QueryC.Next;
  end;
  chTable := TCheckTable(FListCheck.GetObject(n));
  ScriptForModifyTableProperty(QueryCur,QueryNew,slProp);
  if CheckIndexTable(strTableName,slDrop,slCreate) then begin
    ScriptForModifyTablePropertyIndex(QueryNew,slProp);
  end;
  for i:=0 to slDrop.Count-1 do begin
    chTable.MainCheck.Add(slDrop.Strings[i]);
  end;
  if (slChahgeColumn.Count>0) or (slExt.Count>0) then begin
    if slChahgeColumn.Count > 0 then begin
      chTable.MainCheck.Add('ALTER TABLE '+strTableName+' ');
      for i:=0 to slChahgeColumn.Count-1 do begin
        if i=slChahgeColumn.Count-1 then begin
          chTable.MainCheck.Add(slChahgeColumn.Strings[i]+';');
        end else begin
          chTable.MainCheck.Add(slChahgeColumn.Strings[i]);
        end;
      end;
    end;
    for i:=0 to slExt.Count-1 do begin
      chTable.MainCheck.Add(slExt.Strings[i]+';');
    end;
  end;
  for i:=0 to slCreate.Count-1 do begin
    chTable.MainCheck.Add(slCreate.Strings[i]);
  end;
  for i:=0 to slProp.Count-1 do begin
    chTable.MainCheck.Add(slProp.Strings[i]);
  end;
  FreeSystemQuery(QueryC,QueryN);
  FreeSystemQuery(QueryCInd,QueryNInd);
  slDrop.Free;
  slCreate.Free;
  slExt.Free;
  slProp.Free;
  slChahgeColumn.Free;
end;

function TCheckDictionary.GetValueAsString(fld: TField): String;
begin
  case fld.DataType of
    ftDate,ftDateTime  : Result := fld.AsString;
    ftBoolean          : if fld.AsBoolean then Result :='TRUE' else Result:='FALSE';
    ftString,ftMemo    : Result := fld.AsString;
    ftInteger,ftWord,
    ftFloat,ftCurrency : Result := fld.AsString;
  else
    Result := fld.AsString;
  end;
  Result := StringReplace(Result, #13, '', [rfReplaceAll]);
  Result := StringReplace(Result, #10, '', [rfReplaceAll]);
  Result := StringReplace(Result, #9, '', [rfReplaceAll]);
  Result := StringReplace(Result, ' ', '', [rfReplaceAll]);
end;

//---------------------------------------------------------
function TCheckDictionary.ValueAsString( fld : TField) : String;
begin
  case fld.DataType of
    ftDate,ftDateTime  : Result := fld.AsString;
    ftBoolean          : if fld.AsBoolean then Result :='TRUE' else Result:='FALSE';
    ftString,ftMemo    : Result := fld.AsString;
    ftInteger,ftWord,
    ftFloat,ftCurrency : Result := fld.AsString;
  else
    Result := fld.AsString;
  end;
  while Right(Result,2)=#13#10 do begin
    Result := Copy(Result,1,Length(Result)-2);
  end;
end;

//-----------------------------------------------------------------
function TCheckDictionary.ValueAsString( v : Variant) : String;
begin
  case varType(v) of
    varBoolean   : if v then Result := 'TRUE' else Result := 'FALSE';
    varSmallint,
    varInteger   : Result := VarToStr(v);
  else
    Result := VarToStr(v);
  end;
end;

//---------------------------------------------------------
procedure TCheckDictionary.ScriptForModifyTableProperty( QueryC,QueryN : TAdsQuery; poSQL : TStringList);
var
 strValue : String;
 strTable : String;
 i : Integer;
begin
  strTable := QueryC.FieldByName('NAME').AsString;
  for i:=Low(arrPropTable) to High(arrPropTable) do begin
    if GetValueAsString( QueryC.FieldByName(arrPropTable[i])) <>
       GetValueAsString( QueryN.FieldByName(arrPropTable[i])) then begin
      strValue := GetValueAsString(QueryN.FieldByName(arrPropTable[i]));
      strValue := GetValueAsString(QueryC.FieldByName(arrPropTable[i]));
      strValue := ValueAsString(QueryN.FieldByName(arrPropTable[i]));
      ModifyTableProperty( poSQL, strTable, arrPropTable[i], strValue);
    end;
  end;
end;

//-----------------------------------------------------------------------------------------
procedure TCheckDictionary.ScriptForModifyTablePropertyIndex( QueryN : TAdsQuery; poSQL : TStringList);
var
 strValue : String;
 strTable : String;
begin
  strTable := QueryN.FieldByName('NAME').AsString;
  strValue := ValueAsString(QueryN.FieldByName('TABLE_PRIMARY_KEY'));
  ModifyTableProperty( poSQL, strTable, 'TABLE_PRIMARY_KEY', strValue);
  strValue := ValueAsString(QueryN.FieldByName('TABLE_DEFAULT_INDEX'));
  ModifyTableProperty( poSQL, strTable, 'TABLE_DEFAULT_INDEX', strValue);
end;

//---------------------------------------------------------
procedure TCheckDictionary.ScriptForCreateTableProperty( QueryCur : TAdsQuery; poSQL : TStringList);
var
 strValue : String;
 strTable : String;
 i : Integer;
begin
  strTable := QueryCur.FieldByName('NAME').AsString;
  for i:=Low(arrPropTable) to High(arrPropTable) do begin
    if not QueryCur.FieldByName(arrPropTable[i]).IsNull then begin
      strValue := ValueAsString(QueryCur.FieldByName(arrPropTable[i]));
      if strValue <> '' then begin
        ModifyTableProperty( poSQL, strTable, arrPropTable[i], strValue);
      end;
    end;
  end;
end;

//---------------------------------------------------------------------------
procedure TCheckDictionary.ModifyTableProperty(poSQL : TStringList;
         strTable : string; strProperty : string; strValue : string);
begin
  poSQL.Add( 'EXECUTE PROCEDURE sp_ModifyTableProperty( ' + QuotedStr( strTable ) + ', ' );
  poSQL.Add( '   ' + QuotedStr( strProperty ) + ', ' );
  poSQL.Add( '   ' + QuotedStr( strValue ) + ', ''APPEND_FAIL'', ' + QuotedStr( strTable + 'fail' ) + ');' );
  poSQL.Add( '' );
end;

//----------------------------------------------------------------------------
// сформировать тип и значность пол€  [ Char(50)  Numeric(15,2) Date  ]
function TCheckDictionary.GetStruColumn(ds : TDataSet) : String;
var
  nType : Integer;
  sLen, sDec, s : String;
begin
  with ds do begin
    nType  := FieldByName('Field_Type').AsInteger;
    Result := ArrSootv[nType].Name;  // символьный тип пол€
    case ArrSootv[nType].Ads of
      AdsfldNUMERIC : begin
                        sLen := FieldByName('Field_Length').AsString;
                        sDec := FieldByName('Field_Decimal').AsString;
                        if sDec=''
                          then s := '(' + sLen + ')'
                          else s := '(' + sLen + ', ' + sDec + ')';
                        end;
      AdsfldSTRING,
      AdsfldCISTRING: begin
                         sLen := FieldByName('Field_Length').AsString;
                         s := '(' + sLen + ')';
                       end;
    else
      s := '';
    end;
  end;
  Result := Result + s;
end;
//-------------------------------------------------------------------------
function TCheckDictionary.CreatePropCurrentColumn(Query: TAdsQuery;
         var slExtProc : TStringList) : String;
var
  s, sTable, sField : String;
const
  c : String = ' CONSTRAINT ';
begin
  with Query do begin
    sTable := FieldByName('Parent').AsString;
    sField := FieldByName('Name').AsString;
    Result := sField + ' ' + GetStruColumn(Query) + ' ';
    s := FieldByName('Field_Min_Value').AsString;
    if s<>'' then Result := Result + c + 'MINIMUM ' + QStr(s);
    s := FieldByName('Field_Max_Value').AsString;
    if s<>'' then Result := Result + c + 'MAXIMUM ' + QStr(s);
    s := FieldByName('Field_Can_Be_Null').AsString;
    if (s<>'') and not FieldByName('Field_Can_Be_Null').AsBoolean then begin
      Result := Result + c + 'NOT NULL';
    end;
    s := FieldByName('Field_Default_Value').AsString;
    if (s<>'') then begin
      Result := Result + ' DEFAULT ' + QStr(s);
    end;
    s := FieldByName('Field_Validation_Msg').AsString;
    if (s<>'') then begin
      Result := Result + c + 'ERROR MESSAGE ' + QStr(s);
    end;
    s := FieldByName('Comment').AsString;
    if CheckCommentColumn and (s<>'') then begin
      slExtProc.Add( 'EXECUTE PROCEDURE sp_ModifyFieldProperty ('+QStr(sTable)+','+
                    QStr(sField)+','+QStr('Comment') + ',' + QStr(s) + ',' +
                    QStr('APPEND_FAIL') + ',' + QStr('fail') + ')');
    end;
//  User_Defined_Prop
  end;
end;

//-------------------------------------------------------------------------------------
function TCheckDictionary.CheckStruCurrentColumn(QueryC, QueryN: TAdsQuery;
         var slExtProc : TStringList): String;
var
  ttC,ttN : TAdsFieldTypes;
  nLenC,nLenN,nDecC,nDecN,n,i : Integer;
  s, sField, sTable : String;
  arrProp : TArrStrings;
  strTTC, strTTN : String;
begin
  sTable := QueryC.FieldByName('Parent').AsString;
  sField := QueryC.FieldByName('Name').AsString;
  Result := '  ALTER COLUMN '+sField+' '+
             QueryN.FieldByName('Name').AsString+' ';
  nDecC := 0;
  with QueryC do begin
    n := FieldByName('Field_Type').AsInteger;
    ttC := ArrSootv[n].Ads;
    strTTC := ArrSootv[n].Name;  // IMAGE & BINARY  -> BLOB
    nLenC := FieldByName('Field_Length').AsInteger;
    if ttC = AdsfldNUMERIC then begin
      s := FieldByName('Field_Decimal').AsString;
      if s=''
        then nDecC := 0
        else nDecC := StrToInt(s);
    end;
  end;
  nDecN := 0;
  with QueryN do begin
    n := FieldByName('Field_Type').AsInteger;
    ttN := ArrSootv[n].Ads;
    strTTN := ArrSootv[n].Name;  // IMAGE & BINARY  -> BLOB
    nLenN := FieldByName('Field_Length').AsInteger;
    if ttN = AdsfldNUMERIC then begin
      s := FieldByName('Field_Decimal').AsString;
      if s=''
        then nDecN := 0
        else nDecN := StrToInt(s);
    end;
  end;
  if (strTTC<>strTTN) or (nLenC<>nLenN) or (nDecC<>nDecN) then begin
    Result := Result + GetStruColumn(QueryN);
  end else begin
    Result := '';
  end;
  //-------- анализ дополнительных свойств пол€ ------------
  SetLength(arrProp,6);
  arrProp[0] := 'Field_Min_Value';
  arrProp[1] := 'Field_Max_Value';
  arrProp[2] := 'Field_Can_Be_Null';
  arrProp[3] := 'Comment';
  arrProp[4] := 'Field_Validation_Msg';
  arrProp[5] := 'Field_Default_Value';
  for i:=Low(arrProp) to High(arrProp) do begin
    if (arrProp[i]<>'Comment') or CheckCommentColumn then begin
      s := QueryN.FieldByName(arrProp[i]).AsString;
      // текущее свойство не равно новому
      if (QueryC.FieldByName(arrProp[i]).AsString<>s) then begin
        slExtProc.Add( 'EXECUTE PROCEDURE sp_ModifyFieldProperty ('+QStr(sTable)+','+
                      QStr(sField)+','+QStr(arrProp[i]) + ',' + QStr(s) + ',' +
                      QStr('APPEND_FAIL') + ',' + QStr('fail') + ')');
      end;
    end;
  end;
  //----------------------------------------------------------
end;

constructor TCheckDictionary.Create(NewDict, CurDict: TAdsDictionary);
begin
  inherited Create;
  ADS10:=true;
  TablesNotCheck:='';
  FOnly:=false;
  FCurDict := CurDict;
  FNewDict := NewDict;
  FListCheck := TListCheck.Create;
  FCheckCommentColumn := false;
  FEnableCloseCheck := false;
  EnabledCheckObjects := [coRI];
end;

destructor TCheckDictionary.Destroy;
begin
  FListCheck.Free;
  inherited;
end;

procedure TCheckDictionary.SetCurConnect(const Value: TAdsConnection);
begin
  FCurConnect := Value;
end;

procedure TCheckDictionary.SetNewConnect(const Value: TAdsConnection);
begin
  FNewConnect := Value;
end;


{ TCheckAny }

constructor TCheckObject.Create;
begin
  FMainCheck    := TStringList.Create;
  FExtCheck     := TStringList.Create;
  FBeforeCheck  := TStringList.Create;
  FAfterCheck   := TStringList.Create;
end;

destructor TCheckObject.Destroy;
begin
  FMainCheck.Free;
  FExtCheck.Free;
  FBeforeCheck.Free;
  FAfterCheck.Free;
  inherited;
end;

function TCheckDictionary.SeekRelation(strTableName,strIndexName: String): String;
var
  Query : TAdsQuery;
begin
  Query:= TAdsQuery.Create(nil);
  with Query do begin
    DatabaseName:=FNewConnect.Name;
    SQL.Text := ''; //strSQL;
    Open;
  end;

end;

procedure TCheckDictionary.CreateRelationStmp(poSQL: TStringList;
  poQuery: TAdsQuery);
begin
   poSQL.Add( 'EXECUTE PROCEDURE ' );
   poSQL.Add( '  sp_CreateReferentialIntegrity ( ' );

   poSQL.Add( '     ' + QStr( poQuery.FieldByName( 'Name' ).AsString ) + ',' );
   poSQL.Add( '     ' + QStr( poQuery.FieldByName( 'RI_PRIMARY_TABLE' ).AsString ) + ', ' );
   poSQL.Add( '     ' + QStr( poQuery.FieldByName( 'RI_FOREIGN_TABLE' ).AsString ) + ', ' );
   poSQL.Add( '     ' + QStr( poQuery.FieldByName( 'RI_Foreign_Index' ).AsString ) + ', ' );
   poSQL.Add( '     ' + poQuery.FieldByName( 'RI_UPDATERULE' ).AsString + ', ' );
   poSQL.Add( '     ' + poQuery.FieldByName( 'RI_DELETERULE' ).AsString + ', ' );
   poSQL.Add( '     NULL/* Enter Fail table path here. */,' );
   poSQL.Add( '     ' + QStr( poQuery.FieldByName( 'RI_No_PKey_Error' ).AsString ) + ', ' );
   poSQL.Add( '     ' + QStr( poQuery.FieldByName( 'RI_Cascade_Error' ).AsString ) + '); ' );
   poSQL.Add( '' );
end;

procedure TCheckDictionary.DropRelationStmp(poSQL: TStringList;
  poQuery: TAdsQuery);
begin
   poSQL.Add( 'EXECUTE PROCEDURE ' );
   poSQL.Add( '  sp_DropReferentialIntegrity ( ' + QStr( poQuery.FieldByName( 'Name' ).AsString ) + ');' );
   poSQL.Add( '' );
end;

procedure TCheckDictionary.SetCheckCommentColumn(const Value: Boolean);
begin
  FCheckCommentColumn := Value;
end;

procedure TCheckDictionary.ChangeShow( strNew : String);
begin
  if FShowCheck then begin
    ChangeMessage( strNew );
  end;
end;
procedure TCheckDictionary.SetShowCheck(const Value: Boolean);
begin
  FShowCheck := Value;
  if FShowCheck then begin
    if OpenMessage('  ѕроверка структуры таблиц  ','ѕодождите пожалуйста ...') then begin
      FEnableCloseCheck := true;
    end;
  end else begin
    if FEnableCloseCheck then begin
      CloseMessage;
    end;
  end;
end;

function TCheckDictionary.CheckDataBase: Boolean;
var
  chBase : TCheckDataBase;
  n : Integer;
begin
  Result := true;
  chBase := TCheckDataBase.Create;
  FListCheck.AddObject(chBase);
  n := FListCheck.CountObjects-1;
  CheckTables;
  ScriptForModifyDataBaseProperty( FListCheck.GetObject(n).FMainCheck );
  if coLinks in EnabledCheckObjects then begin
    CheckLinks;
  end;
  if coRI in EnabledCheckObjects then begin
    CheckRelations;
  end;
  if coScript in EnabledCheckObjects then begin
    CheckFunctions;
    CheckStoredProcedure;
  end;
end;

function TCheckDictionary.SysQuery(sText: String): String;
begin
  Result:=CheckSysView(sText,ADS10);
//  if ADS10
//    then Result:=StringReplace(sText, 'system.', 'system.ansi_',[rfReplaceAll,rfIgnoreCase])
//    else Result:=sText;
end;

{ TListCheck }

constructor TListCheck.Create;
begin
  FList:=TStringList.Create;
end;

destructor TListCheck.Destroy;
var
  i  : Integer;
begin
  for i:=0 to CountObjects-1 do begin
    DelObject(i);
  end;
  FList.Free;
  inherited;
end;

procedure TListCheck.AddObject(Check: TCheckObject);
begin
  FList.AddObject('',Check);
end;

procedure TListCheck.ClsObject(i: Integer);
begin
  FList.Strings[i]:='';
  FList.Objects[i]:=nil;
end;

procedure TListCheck.DelObject(i: Integer);
begin
  if FList.Objects[i]<>nil then begin
    TCheckObject(FList.Objects[i]).Free;
  end;
end;

function TListCheck.GetObject(i: Integer): TCheckObject;
begin
  Result := TCheckObject(FList.Objects[i]);
end;

procedure TListCheck.SetObject(i: Integer; Check: TCheckObject);
begin
  FList.Objects[i] := Check;
end;

function TListCheck.CountObjects: Integer;
begin
  Result := FList.Count;
end;

{
function TCheckDictionary.GetLinkPath(strName : String) : String;
var
   acBuffer      : array[0..ADS_DD_MAX_PROPERTY_LEN] of char;
   usPropertyLen : UNSIGNED16;
begin
   usPropertyLen := ADS_DD_MAX_PROPERTY_LEN;
   FNewDict.GetLinkProperty( strName,
                             ADS_DD_LINK_PATH,
                             @acBuffer,
                             usPropertyLen );
   Result := acBuffer;
end;
}
//------------------------------------------------------------------
procedure TCheckDictionary.CheckLinks;
var
  QueryC,QueryN : TAdsQuery;
  strDict,s,ss : String;
  strOldDict, strOldUserName, strUserName : String;
  iOldOptions : Integer;
  lStatic,lAuthent, lWrite : Boolean;
  chLinks : TCheckLinks;
  slAdd : TStringList;
  i, iOptions : Integer;
begin
  chLinks := TCheckLinks.Create;
  FListCheck.AddObject(chLinks);
  slAdd  := TStringList.Create;
  CreateSystemQuery(QueryC,QueryN,'SELECT * FROM '+SysQuery('SYSTEM.LINKS') );
  while not QueryC.Eof do begin
    if not QueryN.Locate('NAME', QueryC.FieldByName('NAME').AsString, []) then begin
      slAdd.Add('EXECUTE PROCEDURE sp_DropLink('+
                  QuotedStr(QueryC.FieldByName('NAME').AsString)+');')
    end;
    QueryC.Next;
  end;
  QueryN.First;
  while not QueryN.Eof do begin
    lWrite := true;
//    lGlobal  := true;
    //----------- новые значени€ дл€ линка ---------------------
    lStatic  := false;
    lAuthent := false;
    iOptions := QueryN.FieldByName('LINK_OPTIONS').AsInteger;
    strUserName := QueryN.FieldByName('LINK_USERNAME').AsString;
//    if (iOptions and ADS_LINK_GLOBAL)=ADS_LINK_GLOBAL then begin
//      lGlobal := true;
//    end;
    if (iOptions and ADS_LINK_AUTH_ACTIVE_USER)=ADS_LINK_AUTH_ACTIVE_USER then begin
      // если подключаемс€ текущим пользователем
      lAuthent := true;
      strUserName := '';
    end;
    if (iOptions and ADS_LINK_PATH_IS_STATIC)=ADS_LINK_PATH_IS_STATIC then begin
      lStatic := true;
    end;
    strDict := QueryN.FieldByName('LINK_PATH').AsString;
    if not lStatic then begin
      strDict := ExtractRelativePath(QueryN.AdsConnection.ConnectPath, strDict );
    end;
    //-----------------------------------------------------------------
    if QueryC.Locate('NAME', QueryN.FieldByName('NAME').AsString, []) then begin
      s  := 'EXECUTE PROCEDURE sp_ModifyLink(';
      ss := ', ';
      //------------ старые значени€ линка ------------------------
      iOldOptions := QueryC.FieldByName('LINK_OPTIONS').AsInteger;
      strOldDict  := QueryC.FieldByName('LINK_PATH').AsString;
      strOldUserName := QueryC.FieldByName('LINK_USERNAME').AsString;
      if (iOldOptions and ADS_LINK_PATH_IS_STATIC)=0 then begin // если путь относительный
        strOldDict := ExtractRelativePath(QueryC.AdsConnection.ConnectPath, strOldDict );
      end;
      if (iOptions and ADS_LINK_AUTH_ACTIVE_USER)=ADS_LINK_AUTH_ACTIVE_USER then begin
        // если подключаемс€ текущим пользователем
        strOldUserName := '';
      end;
      if (strOldDict=strDict) and (iOptions=iOldOptions) and
         (strOldUserName=strUserName) then begin
        lWrite := false;
      end;
      //-------------------------------------------------------------
    end else begin
      s := 'EXECUTE PROCEDURE sp_CreateLink(';
      ss := ', TRUE, ';
    end;
    if lWrite then begin
      slAdd.Add(s + QuotedStr(QueryN.FieldByName('NAME').AsString)+', '+
             QuotedStr(strDict) + ss + ValueAsString(lStatic)+','+
             ValueAsString(lAuthent) + ',' +
             QuotedStr(QueryN.AdsConnection.UserName) +','+
             QuotedStr(QueryN.AdsConnection.Password)+');');
    end;
    QueryN.Next;
  end;
  FreeSystemQuery(QueryC,QueryN);
  for i:=0 to slAdd.Count-1 do begin
    chLinks.FMainCheck.Add(slAdd.Strings[i]);
  end;
  slAdd.Free;
end;

//------------------------------------------------------------------
procedure TCheckDictionary.CheckRelations;
var
  QueryC,QueryN : TAdsQuery;
  chRI : TCheckRI;
  slAdd, slDel : TStringList;
  i : Integer;
begin
  chRI := TCheckRI.Create;
  FListCheck.AddObject(chRI);
  slAdd  := TStringList.Create;
  slDel  := TStringList.Create;
  CreateSystemQuery(QueryC,QueryN,'SELECT * FROM '+SysQuery('SYSTEM.RELATIONS') );
  while not QueryC.Eof do begin
    if not QueryN.Locate('NAME', QueryC.FieldByName('NAME').AsString, []) then begin
      DropRelationStmp(slDel, QueryC);
    end;
    QueryC.Next;
  end;
  QueryN.First;
  while not QueryN.Eof do begin
    if QueryC.Locate('NAME', QueryN.FieldByName('NAME').AsString, []) then begin
      if (QueryC.FieldByName('RI_Primary_Table').AsString<>QueryN.FieldByName('RI_Primary_Table').AsString) or
         (QueryC.FieldByName('RI_Primary_Index').AsString<>QueryN.FieldByName('RI_Primary_Index').AsString) or
         (QueryC.FieldByName('RI_Foreign_Table').AsString<>QueryN.FieldByName('RI_Foreign_Table').AsString) or
         (QueryC.FieldByName('RI_Foreign_Index').AsString<>QueryN.FieldByName('RI_Foreign_Index').AsString) or
         (QueryC.FieldByName('RI_UpdateRule').AsString<>QueryN.FieldByName('RI_UpdateRule').AsString) or
         (QueryC.FieldByName('RI_DeleteRule').AsString<>QueryN.FieldByName('RI_DeleteRule').AsString) or
         (QueryC.FieldByName('RI_No_PKey_Error').AsString<>QueryN.FieldByName('RI_No_PKey_Error').AsString) or
         (QueryC.FieldByName('RI_Cascade_Error').AsString<>QueryN.FieldByName('RI_Cascade_Error').AsString) then begin
        DropRelationStmp(slDel, QueryC);
        CreateRelationStmp(slAdd, QueryN);
      end;
    end else begin
      CreateRelationStmp(slAdd, QueryN);
    end;
    QueryN.Next;
  end;
  FreeSystemQuery(QueryC,QueryN);
  for i:=0 to slDel.Count-1 do begin
    chRI.FBeforeCheck.Add(slDel.Strings[i]);
  end;
  for i:=0 to slAdd.Count-1 do begin
    chRI.FAfterCheck.Add(slAdd.Strings[i]);
  end;
  slAdd.Free;
  slDel.Free;
end;

procedure TCheckDictionary.CheckTables;
var
  QueryC,QueryN : TAdsQuery;
  chTable : TCheckTable;
  n,m : Integer;
  lOk:Boolean;
  strSQL,s : String;
begin
  strSQL := 'SELECT * FROM '+SysQuery('SYSTEM.TABLES');
  QueryN := TAdsQuery.Create(nil);
  with QueryN do begin
    DatabaseName:=FNewConnect.Name;
    SQL.Text := strSQL;
    Open;
  end;
  QueryC := TAdsQuery.Create(nil);
  with QueryC do begin
    DatabaseName:=FCurConnect.Name;
    SQL.Text := strSQL;
    Open;
  end;
  if TablesNotCheck<>'' then s:=','+ANSIUpperCase(TablesNotCheck)+',' else s:='';
  while not QueryN.Eof do begin
    if (s<>'') then begin
      lOk:=false;
      m:=Pos(','+ANSIUpperCase(QueryN.FieldByName('Name').AsString)+',', s);
      if not FOnly and (m=0) then lOk:=true;   // если на исключение
      if FOnly and (m>0)     then lOk:=true;   // если на вхождение
    end else begin
      lOk:=true;
    end;
    if lOk then begin
      chTable := TCheckTable.Create;
      FListCheck.AddObject(chTable);
      n := FListCheck.CountObjects-1;
      if QueryC.Locate('Name',QueryN.FieldByName('Name').AsString,[loCaseInsensitive]) then begin
        ChangeShow('ѕроверка структуры таблицы;'+QueryN.FieldByName('Name').AsString);
        CheckTable(QueryC,QueryN, n);
      end else begin
        ChangeShow('—оздание структуры таблицы;'+QueryN.FieldByName('Name').AsString);
        ScriptForCreateTable(QueryN, n);
      end;
    end;
    QueryN.Next;
  end;
  QueryC.First;
  while not QueryC.Eof do begin
    if (s='') or (Pos(ANSIUpperCase(QueryC.FieldByName('Name').AsString)+',', s)=0) then begin
      chTable := TCheckTable.Create;
      FListCheck.AddObject(chTable);
      n := FListCheck.CountObjects-1;
      if not QueryN.Locate('Name',QueryC.FieldByName('Name').AsString,[loCaseInsensitive]) then begin
        ChangeShow('”даление структуры таблицы;'+QueryC.FieldByName('Name').AsString);
        ScriptForDropTable(QueryC, n);
      end;
    end;
    QueryC.Next;
  end;
end;

//------------------------------------------------------------------------------
procedure TCheckDictionary.CheckFunctions;
var
  QueryC,QueryN : TAdsQuery;
  chScript : TCheckScript;
  slAdd, slDel : TStringList;
  i : Integer;
begin
  chScript := TCheckScript.Create;
  FListCheck.AddObject(chScript);
  slAdd  := TStringList.Create;
  slDel  := TStringList.Create;
  CreateSystemQuery(QueryC,QueryN,'SELECT * FROM '+SysQuery('SYSTEM.FUNCTIONS') );
  ChangeShow('ѕроверка функций базы');
  while not QueryC.Eof do begin
    if not QueryN.Locate('NAME', QueryC.FieldByName('NAME').AsString, []) then begin
      ScriptForDropFunction(slDel, QueryC);
    end;
    QueryC.Next;
  end;
  QueryN.First;
  while not QueryN.Eof do begin
    if QueryC.Locate('NAME', QueryN.FieldByName('NAME').AsString, []) then begin

      if (QueryC.FieldByName('Package').AsString<>QueryN.FieldByName('Package').AsString) or
         (QueryC.FieldByName('Return Type').AsString<>QueryN.FieldByName('Return Type').AsString) or
         (QueryC.FieldByName('Input Parameters').AsString<>QueryN.FieldByName('Input Parameters').AsString) or
         (Trim(QueryC.FieldByName('Implementation').AsString)<>Trim(QueryN.FieldByName('Implementation').AsString)) or
         (QueryC.FieldByName('Comment').AsString<>QueryN.FieldByName('Comment').AsString) then begin
        ScriptForDropFunction(slDel, QueryC);
        ScriptForCreateFunction(slAdd, QueryN);
      end;
    end else begin
      ScriptForCreateFunction(slAdd, QueryN);
    end;
    QueryN.Next;
  end;
  FreeSystemQuery(QueryC,QueryN);
  for i:=0 to slDel.Count-1 do begin
    chScript.FBeforeCheck.Add(slDel.Strings[i]);
  end;
  for i:=0 to slAdd.Count-1 do begin
    chScript.FAfterCheck.Add(slAdd.Strings[i]);
  end;
  slAdd.Free;
  slDel.Free;
end;
//------------------------------------------------------------------------------
procedure TCheckDictionary.CheckStoredProcedure;
var
  QueryC,QueryN : TAdsQuery;
  chScript : TCheckScript;
  slAdd, slDel : TStringList;
  i : Integer;
begin
  chScript := TCheckScript.Create;
  FListCheck.AddObject(chScript);
  slAdd  := TStringList.Create;
  slDel  := TStringList.Create;
  CreateSystemQuery(QueryC,QueryN,'SELECT * FROM '+SysQuery('system.storedprocedures') );
  ChangeShow('ѕроверка процерур базы');
  while not QueryC.Eof do begin
    if not QueryN.Locate('NAME', QueryC.FieldByName('NAME').AsString, []) then begin
      ScriptForDropProcedure(slDel, QueryC);
    end;
    QueryC.Next;
  end;
  QueryN.First;
  while not QueryN.Eof do begin
    if QueryC.Locate('NAME', QueryN.FieldByName('NAME').AsString, []) then begin

      if (QueryC.FieldByName('Proc_OutPut').AsString<>QueryN.FieldByName('Proc_OutPut').AsString) or
         (QueryC.FieldByName('Proc_InPut').AsString<>QueryN.FieldByName('Proc_InPut').AsString) or
         (QueryC.FieldByName('Proc_DLL_Name').AsString<>QueryN.FieldByName('Proc_DLL_Name').AsString) or
         (QueryC.FieldByName('Proc_DLL_Function_Name').AsString<>QueryN.FieldByName('Proc_DLL_Function_Name').AsString) or
         (QueryC.FieldByName('Proc_Invoke_OPtion').AsInteger<>QueryN.FieldByName('Proc_Invoke_Option').AsInteger) or
         (Trim(QueryC.FieldByName('SQL_Script').AsString)<>Trim(QueryN.FieldByName('SQL_Script').AsString)) or
         (QueryC.FieldByName('Comment').AsString<>QueryN.FieldByName('Comment').AsString) then begin
        ScriptForDropProcedure(slDel, QueryC);
        ScriptForCreateProcedure(slAdd, QueryN);
      end;
    end else begin
      ScriptForCreateProcedure(slAdd, QueryN);
    end;
    QueryN.Next;
  end;
  FreeSystemQuery(QueryC,QueryN);
  for i:=0 to slDel.Count-1 do begin
    chScript.FBeforeCheck.Add(slDel.Strings[i]);
  end;
  for i:=0 to slAdd.Count-1 do begin
    chScript.FAfterCheck.Add(slAdd.Strings[i]);
  end;
  slAdd.Free;
  slDel.Free;
end;

//----------------------------------------------------------------------------
procedure TCheckDictionary.ScriptForCreateTable(QueryCur: TAdsQuery; n: Integer);
var
  Query : TAdsQuery;
  slColumns : TStringList;
  ss : String;
  slExt   : TStringList;
  slProp  : TStringList;
  slIndex : TStringList;
  strTableName : String;
  chTable : TCheckTable;
  i : Integer;
begin
  strTableName := QueryCur.FieldByName('Name').AsString;
  slIndex   := TStringList.Create;
  slColumns := TStringList.Create;
  slExt :=TStringList.Create;
  slProp:=TStringList.Create;
  Query := TAdsQuery.Create(nil);
  with Query do begin
    DatabaseName:=FNewConnect.Name;
    SQL.Text := 'SELECT * FROM '+SysQuery('SYSTEM.COLUMNS')+' WHERE parent='+
                QStr(strTableName);
    Open;
  end;
  Query.First;
  while not Query.Eof do begin
    ss := CreatePropCurrentColumn(Query, slExt);
    slColumns.Add(ss);
    Query.Next;
  end;
  chTable := TCheckTable(FListCheck.GetObject(n));
  if (slColumns.Count>0) then begin
    chTable.ListCreateTables.Add(strTableName);
    chTable.MainCheck.Add('CREATE TABLE '+strTableName+' (');
    for i:=0 to slColumns.Count-1 do begin
      if i=slColumns.Count-1 then begin
        chTable.MainCheck.Add('  '+slColumns.Strings[i]);
      end else begin
        chTable.MainCheck.Add('  '+slColumns.Strings[i]+',');
      end;
    end;
    chTable.MainCheck.Add('   );');

    ScriptForCreateIndex(QueryCur, slIndex);
    ScriptForCreateTableProperty( QueryCur, slProp);
    for i:=0 to slIndex.Count-1 do begin
      chTable.MainCheck.Add(slIndex.Strings[i]);
    end;
//    chTable.MainCheck.Add('');
    for i:=0 to slProp.Count-1 do begin
      chTable.MainCheck.Add(slProp.Strings[i]);
    end;
//    chTable.MainCheck.Add('');
    for i:=0 to slExt.Count-1 do begin
      chTable.MainCheck.Add(slExt.Strings[i]+';');
    end;

  end;
  Query.Free;
  slIndex.Free;
  slExt.Free;
  slColumns.Free;
  slProp.Free;
end;

//--------------------------------------------------------------------------
procedure TCheckDictionary.ScriptForDropTable(QueryCur: TAdsQuery;
         n: Integer);
var
  chTable : TCheckTable;
begin
  chTable := TCheckTable(FListCheck.GetObject(n));
  chTable.MainCheck.Add('DROP TABLE '+QueryCur.FieldByName('NAME').AsString+';');
end;

//---------------------------------------------------------------------------
procedure TCheckDictionary.ScriptForModifyDataBaseProperty( poSQL : TStringList );
var
  i : Integer;
  QueryC,QueryN : TAdsQuery;
begin
  // провер€ем свойства базы только если список исключений пуст
  if TablesNotCheck='' then begin
    CreateSystemQuery(QueryC,QueryN,'SELECT * FROM '+SysQuery('SYSTEM.DICTIONARY') );

    Def_FTS_NOISE_WORDS:=QueryN.FieldByName('FTS_NOISE_WORDS').AsString;
    Def_FTS_DELIMITERS:=QueryN.FieldByName('FTS_DELIMITERS').AsString;
    Def_FTS_DROP_CHARS:=QueryN.FieldByName('FTS_DROP_CHARS').AsString;
    Def_FTS_CONDITIONAL_CHARS:=QueryN.FieldByName('FTS_CONDITIONAL_CHARS').AsString;

    for i:=Low(arrPropDataBase) to High(arrPropDataBase) do begin
      if GetValueAsString( QueryC.FieldByName(arrPropdataBase[i])) <>
         GetValueAsString( QueryN.FieldByName(arrPropdataBase[i])) then begin
        poSQL.Add('EXECUTE PROCEDURE  sp_ModifyDatabase('+QuotedStr(arrPropdataBase[i])+
                ', '+QuotedStr(ValueAsString( QueryN.FieldByName(arrPropdataBase[i])))+');');
      end;
    end;
    FreeSystemQuery(QueryC,QueryN);
  end;
end;

//-------------------------------------------------------------------------------
procedure TCheckDictionary.ScriptForCreateIndex(QueryCur : TAdsQuery;
          var slCreate : TStringList);
var
  Query : TAdsQuery;
  strTableName : String;
begin
  strTableName := QueryCur.FieldByName('Name').AsString;
  Query := TAdsQuery.Create(nil);
  with Query do begin
    DatabaseName:=FNewConnect.Name;
    SQL.Text := 'SELECT * FROM '+SysQuery('SYSTEM.INDEXES')+' WHERE parent='+
                QStr(strTableName);
    Open;
  end;
  while not Query.Eof do begin
    CreateIndexStmt( slCreate, Query );
    Query.Next;
  end;
  Query.Free;
end;

//-------------------------------------------------------------------------------------
procedure TCheckDictionary.ScriptForDropFunction(poSQL: TStringList;
  poQuery: TAdsQuery);
begin
   if poQuery.FieldByName( 'package' ).AsString <> '' then
    poSQL.Add( 'DROP FUNCTION ' + poQuery.FieldByName( 'package' ).AsString  + '.' + poQuery.FieldByName( 'name' ).AsString + ';' )
   else
    poSQL.Add( 'DROP FUNCTION ' + poQuery.FieldByName( 'name' ).AsString + ';' );
   poSQL.Add( '' );
end;
//-------------------------------------------------------------------------------------
procedure TCheckDictionary.ScriptForCreateFunction(poSQL: TStringList; poQuery: TAdsQuery);
begin
   if poQuery.FieldByName('package').AsString <> ''
     then poSQL.Add( 'CREATE FUNCTION ' + poQuery.FieldByName( 'package' ).AsString  + '.' +  poQuery.FieldByName( 'name' ).AsString  + '(' +  poQuery.FieldByName( 'Input Parameters' ).AsString  + ') ')
     else poSQL.Add( 'CREATE FUNCTION ' + poQuery.FieldByName( 'name' ).AsString  + '(' +  poQuery.FieldByName( 'Input Parameters' ).AsString  + ') ');
   poSQL.Add( 'RETURNS ' +  poQuery.FieldByName( 'Return Type' ).AsString    );
   if poQuery.FieldByName( 'Comment' ).AsString<>'' then
     poSQL.Add( 'DESCRIPTION ' +  QStr( poQuery.FieldByName( 'Comment' ).AsString));
   poSQL.Add('BEGIN');
   poSQL.Add( TRIM(poQuery.FieldByName('Implementation').AsString) );
   poSQL.Add('END;');
   poSQL.Add( '' );
end;
//-------------------------------------------------------------------------------------
procedure TCheckDictionary.ScriptForDropProcedure(poSQL: TStringList;
  poQuery: TAdsQuery);
begin
   poSQL.Add( 'DROP PROCEDURE ' + poQuery.FieldByName( SYS_OBJECT_NAME ).AsString + ';' );
   poSQL.Add( '' );
end;
//-------------------------------------------------------------------------------------
procedure TCheckDictionary.ScriptForCreateProcedure( poSQL: TStringList; poQuery  : TAdsQuery);
var
   strParam    : string;
   iPosition   : integer;
   iProcType   : integer;
begin
   poSQL.Add( 'CREATE PROCEDURE ' );
   poSQL.Add( '     ' + poQuery.FieldByName( SYS_OBJECT_NAME ).AsString);
//   poSQL.Add( '     ' + QuotedIdentifier( poQuery.FieldByName( SYS_OBJECT_NAME ).AsString, poQuery.AdsConnection ) );
   poSQL.Add( '   ( ' );

   AddProcedureParameters( poSQL, poQuery.FieldByName( 'PROC_INPUT' ).AsString, False );
   AddProcedureParameters( poSQL, poQuery.FieldByName( 'PROC_OUTPUT' ).AsString, True );

   {* Remove the extra comma from the last parameter. *}
   strParam := poSQL.Strings[ poSQL.Count - 1];
   iPosition := LastDelimiter( ',', strParam );
   if ( iPosition <> 0 ) then begin
     Delete( strParam, iPosition, 1 );
     poSQL.Strings[ poSQL.Count - 1] := strParam;
   end;

   iProcType := poQuery.FieldByName( 'Proc_Invoke_Option' ).AsInteger;
   if ( iProcType = ADS_SCRIPT_PROC ) then
   begin
      poSQL.Add( '   ) ' );
      poSQL.Add( '   BEGIN ' );
      poSQL.Add( '      ' + poQuery.FieldByName( 'SQL_Script' ).AsString );
      poSQL.Add( '   END;' );
      poSQL.Add( '' );
   end
   else
   begin
      poSQL.Add( '   ) ' );
      poSQL.Add( '   FUNCTION ' );
      poSQL.Add( '     "' + poQuery.FieldByName( 'PROC_DLL_FUNCTION_NAME' ).AsString + '"' );
      if ( iProcType = ADS_COMSTORED_PROC ) then
      begin
         poSQL.Add( '   IN COMLIBRARY ' );
      end
      else
      begin
         poSQL.Add( '   IN LIBRARY ' );
      end;
      poSQL.Add( '     "' + poQuery.FieldByName( 'PROC_DLL_NAME' ).AsString + '";' );
      poSQL.Add( '' );
   end;
end;
//------------------------------------------------------------------------------------------------
procedure TCheckDictionary.AddProcedureParameters( poSQL: TStrings; strParameters : string; bOutput: boolean);
var
   iIndex      : integer;
   strParam    : string;
   strDataType : string;
begin

   if ( strParameters = '' ) then
      exit;

   {* Strings in Delphi start at 1. The length is in the zero position. *}
   iIndex := 1;
   while ( True ) do
   begin
      strParam := '';
      strDataType := '';

      {* Get the parameter name *}
      while ( strParameters[ iIndex ] <> ',' ) do
      begin
         strParam := strParam + strParameters[ iIndex ];

         Inc( iIndex );

         if ( iIndex > length( strParameters ) ) then
            exit;
      end;

      {* skip over the ',' *}
      Inc( iIndex );

      {* Now determine the parameter type *}
      while (( strParameters[ iIndex ] <> ',' ) and
             ( strParameters[ iIndex ] <> ';' ) and
             ( strParameters[ iIndex ] <> #10 ) and
             ( strParameters[ iIndex ] <> #13 ) and
             ( iIndex <= length( strParameters )) ) do
      begin
         strDataType := strDataType + strParameters[ iIndex ];
         Inc( iIndex );

         if ( iIndex > length( strParameters ) ) then
            break;

      end;

      {*
       * Due to a difference in the SQL Engine and the Create Table statement,
       * the temp type needs to be changed to BLOB rather than binary.
       *}
      if (( UpperCase( strDataType ) = 'BINARY' ) or ( UpperCase( strDataType ) = 'IMAGE' )) then
      begin
         strDataType := 'BLOB';
      end;

      if (( UpperCase( strDataType ) = 'SHORTINT' )) then
      begin
         strDataType := 'SHORT';
      end;

      if (( UpperCase( strDataType ) = 'CICHARACTER' )) then
      begin
         strDataType := 'CICHAR';
      end;

      if (( UpperCase( strDataType ) = 'CHARACTER' )) then
      begin
         strDataType := 'CHAR';
      end;

      if (( UpperCase( strDataType ) = 'CHARACTER' )) then
      begin
         strDataType := 'CHAR';
      end;

      if (( UpperCase( strDataType ) = 'BOOLEAN' )) then
      begin
         strDataType := 'LOGICAL';
      end;



      strParam := strParam + ' ' + strDataType;

      if ( ( UpperCase( strDataType ) = 'CHAR' ) or
           ( UpperCase( strDataType ) = 'CICHAR' ) or
           ( UpperCase( strDataType ) = 'VARCHAR' ) or
           ( UpperCase( strDataType ) = 'RAW' ) or
           ( UpperCase( strDataType ) = 'DECIMAL' ) or
           ( UpperCase( strDataType ) = 'DOUBLE' ) or
           ( UpperCase( strDataType ) = 'CURDOUBLE' ) or
           ( UpperCase( strDataType ) = 'NUMERIC' ) ) then
      begin

         strParam := strParam + ' ( ';

         {* skip over the ',' *}
         Inc( iIndex );

         while (( strParameters[ iIndex ] <> ';' ) and
                ( iIndex <= length( strParameters ) )) do
         begin
            strParam := strParam + strParameters[ iIndex ];
            Inc( iIndex );
         end;

         strParam := strParam + ' )';

      end;

      if ( bOutput ) then
      begin
         strParam := strParam + ' OUTPUT';
      end;

      {* Always add a comma, it will be cleaned up later. *}
      strParam := strParam + ',';

      poSQL.Add( '      ' + strParam );

      if ( iIndex = length( strParameters ) ) then
         break;

      {* Increment over any delimiter characters *}
      while ((( strParameters[ iIndex ] = ';' ) or
              ( strParameters[ iIndex ] = #10 ) or
              ( strParameters[ iIndex ] = #13 )) and
             ( iIndex <= length( strParameters )) ) do
      begin
         Inc( iIndex );
      end;

   end; {* while *}

end; {* TSQLWriter.AddProcedureParameters *}


function TCheckDictionary.GetScript(sl: TStringList): Boolean;
var
  i,j : Integer;
  cs  : TCheckScript;
  cri : TCheckRI;
  ch  : TCheckTable;
  cb  : TCheckDataBase;
  cl  : TCheckLinks;
begin
  Result:=true;
  //----------------------------------------------------------------------
  for i:=0 to FListCheck.CountObjects-1 do begin
    case FListCheck.GetObject(i).ObjectType of
     coRI : begin
              cri := TCheckRI(FListCheck.GetObject(i));
              for j:=0 to cri.BeforeCheck.Count-1 do begin
                sl.Add(cri.BeforeCheck.Strings[j]);
                if Right( Trim(sl.Strings[sl.Count-1]), 1)=';' then begin
                  sl.Add('-- /////');
                end;
              end;
            end;
     coScript :
            begin
              cs := TCheckScript(FListCheck.GetObject(i));
              for j:=0 to cs.BeforeCheck.Count-1 do begin
                sl.Add(cs.BeforeCheck.Strings[j]);
                if Right( Trim(sl.Strings[sl.Count-1]), 1)=';' then begin
                end;
              end;
              if cs.BeforeCheck.Count>0
                then sl.Add('-- /////');
            end;
    end;
  end;
  //--- скрипты дл€ таблиц ---------------------------------------------------------------
  for i:=0 to FListCheck.CountObjects-1 do begin
    if FListCheck.GetObject(i).ObjectType = coTable then begin
      ch := TCheckTable(FListCheck.GetObject(i));
      for j:=0 to ch.MainCheck.Count-1 do begin
        sl.Add(ch.MainCheck.Strings[j]);
        if Right( Trim(sl.Strings[sl.Count-1]), 1)=';' then begin
          sl.Add('-- /////');
        end;
      end;
    end;
  end;
  //---- скрипты дл€ свойств базы и линки -------------------------------------------------
  for i:=0 to FListCheck.CountObjects-1 do begin
    if FListCheck.GetObject(i).ObjectType = coDataBase then begin
      cb := TCheckDataBase(FListCheck.GetObject(i));
      for j:=0 to cb.MainCheck.Count-1 do begin
        sl.Add(cb.MainCheck.Strings[j]);
        if Right( Trim(sl.Strings[sl.Count-1]), 1)=';' then begin
          sl.Add('-- /////');
        end;
      end;
    end else if FListCheck.GetObject(i).ObjectType = coLinks then begin
      cl := TCheckLinks(FListCheck.GetObject(i));
      for j:=0 to cl.MainCheck.Count-1 do begin
        sl.Add(cl.MainCheck.Strings[j]);
        if Right( Trim(sl.Strings[sl.Count-1]), 1)=';' then begin
          sl.Add('-- /////');
        end;
      end;
    end;
  end;
  //----------------------------------------------------------------------
  for i:=0 to FListCheck.CountObjects-1 do begin
    case FListCheck.GetObject(i).ObjectType of
      coRI: begin
              cri := TCheckRI(FListCheck.GetObject(i));
              for j:=0 to cri.AfterCheck.Count-1 do begin
                sl.Add(cri.AfterCheck.Strings[j]);
                if Right( Trim(sl.Strings[sl.Count-1]), 1)=';' then begin
                  sl.Add('-- /////');
                end;
              end;
            end;
      coScript:
            begin
              cs := TCheckScript(FListCheck.GetObject(i));
              for j:=0 to cs.AfterCheck.Count-1 do begin
                sl.Add(cs.AfterCheck.Strings[j]);
                if Right( Trim(sl.Strings[sl.Count-1]), 1)=';' then begin
                end;
              end;
              if cs.AfterCheck.Count>0
                then sl.Add('-- /////');
            end;
    end;
  end;
end;

procedure TCheckDictionary.GetCreateTables(sl: TStringList);
var
  i,j : Integer;
  ch  : TCheckTable;
begin
  sl.Clear;
  for i:=0 to FListCheck.CountObjects-1 do begin
    if FListCheck.GetObject(i).ObjectType = coTable then begin
      ch := TCheckTable(FListCheck.GetObject(i));
      for j:=0 to ch.ListCreateTables.Count-1 do begin
        sl.Add(ch.ListCreateTables.Strings[j]);
      end;
    end;
  end;
end;

procedure TCheckObject.SetObjectType(const Value: TCheckObjectType);
begin
  FObjectType := Value;
end;

{ TCheckTable }

constructor TCheckTable.Create;
begin
  inherited Create;
  FObjectType := coTable;
  ListCreateTables := TStringList.Create;
end;

destructor TCheckTable.Destroy;
begin
  ListCreateTables.Free;
  inherited Destroy;
end;

{ TCheckDataBase }

constructor TCheckDataBase.Create;
begin
  inherited Create;
  FObjectType := coDataBase;
end;

{ TCheckLinks }

constructor TCheckLinks.Create;
begin
  inherited Create;
  FObjectType := coLinks;
end;

{ TCheckRI }

constructor TCheckRI.Create;
begin
  inherited Create;
  FObjectType := coRI;
end;


{ TCheckFunc }

constructor TCheckScript.Create;
begin
  inherited Create;
  FObjectType := coScript;
end;

end.
