unit DataTask;

{$I Task.inc}

interface

//{$DEFINE DEBUG}

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, Db,
  AdsData, AdsFunc, AdsTable, ADSCNNCT, AdsSet, ACE, DBGridEh, SasaDbGrid,
  SasaIniFile, FuncPr, fmProgress, IniFiles, FileCtrl, DbFunc, fmDosFileView,
  stdctrls, extctrls, fmParamsZ,
  {$IFNDEF UPDATEPROG}
  fmChoice,
  {$ENDIF}
  NewDialogs
  {$IFDEF VER150} ,Variants {$ENDIF}  ;


const
  MEMO_SIZE = 0;
  TASK_CONNECT  = 0;
  MULTI_CONNECT = 1;

  LOGIN_OFF           = 0;
  LOGIN_USER          = 1;
  LOGIN_USER_PSW      = 2;
  LOGIN_USER_PSW_DATE = 3;

type

  TGlobalPar = record
    Toch         : Integer;
    NameFileStru : String;
//    PathService  : String;
    ConnectPath  : String;
    SharedConnectPath  : String;
    CheckStru    : Boolean;
    AutoPack     : Boolean;
    AutoReindex  : Boolean;
    TableType    : TAdsTableTypes;
    CharType     : TAdsCharTypes;
    OnlyOpen     : Boolean;
    CheckIndex   : Boolean;
    ServerTypes  : TAdsServerTypes;
    CommunicationType : TAdsCommunicationType;
    Compression : TAdsCompressionTypes;
    PingBase : Boolean;
    RelConnectPath       : String;  // относительный путь коннекта
    RelSharedConnectPath : String;
  end;

  PStruField = ^TStruField;
  TStruField = record
    Name   : String;
    Tip    : String;
    KTip   : String;
    AdsTip : TAdsFieldTypes;
    Len    : Integer;
    Toch   : Byte;
    Komm   : String;
    Format : String;
  end;

  PStruIndex = ^TStruIndex;
  TStruIndex = record
    Tip       : Byte;
    Tag       : String;
    strKey    : String;
    strCond   : String;
    strWhile  : String;
    Options   : TIndexOptions;  //TAdsIndexOptions;
    Komm      : String;
    Contains  : Boolean;
    MinWord   : String;
    MaxWord   : String;
    NoiseWords: String;
    DropCharacters : String;
    Delimiters : String;
    CondDropCharacters : String;
  end;

  PTypeField = ^TTypeField;
  TTypeField = record
    Name : String;
    Ads  : TAdsFieldTypes;
  end;

  // тип соединения tcLocal  -для монополного исползования на текущей машине
  //                tcShared -для совместного
{  TConnectType = (tcLocal, tcShared);

  PParamTable = ^TParamTable
  TParamTable = record
    Connect : TConnectType;
  end;
}
  TMyAdsDataSet = class(TAdsDataSet);


  TdmTask = class(TDataModule)
    AdsConnection: TAdsConnection;
    AdsSharedConnection: TAdsConnection;
    WorkTable: TAdsTable;
    WorkQuery: TAdsQuery;
    AdsSettings: TAdsSettings;
    procedure dmTaskCreate(lOnlyCreate : Boolean);
    procedure dmTaskDestroy;

    procedure AdsBeforeInsert(DataSet: TDataSet;
                strIndexName : String; strFieldName : String);
    // работает только с TAdsTable
    procedure AdsAfterInsert(DataSet: TDataSet; strFieldName : String);
    procedure AdsBeforePost(DataSet: TDataSet; strFieldName : String);

  private
    FListConnects : TStringList;
    FListSharedConnects : TStringList;
    FFirstConnect    : Boolean;
    FTypeLogin       : Integer;
    FDefaultUser     : String;
    FDefaultPassword : String;

    FMainComp : Boolean; // программа запущена на основном компъютере
    FNewIden  : Double; //Integer;
    FIniStru  : TSasaIniFile;
    FNameIni  : String;
    FIniSysParams : TSasaIniFile;
    FListCheckTables   : TStringList;
    FListOpenTables   : TStringList;
    FListErrorOpen : TStringList;
    FNotCheckTables : Boolean;  // не проверять наличие таблиц вообще
    FListReadOnly : TStringList;
    FPathForSysParams: String;
    FPathForLocalParams: String;
    lCheckErrorOpen : Boolean;
    FDiskCheck : Integer;
    FNameFileGlobalParam : String;
    FNameFileLocalParam : String;
    FOnAfterOpen: TNotifyEvent;
    FOnAfterClose: TNotifyEvent;
    FOnBeforeClose: TNotifyEvent;
    FOnBeforeOpen: TNotifyEvent;
    FUserId: String;
    FBaseId: String;
    FUseBaseParam : Boolean;
    FLogActive:Boolean;
    FLogTypes:String;
    FLastError: String;
    FFirstConnent: Boolean;
    FCheckNewUser: Boolean;
    FCheckPassword: String;
    FCheckUser: String;
    FCreateAsSQL: Boolean;
    FShowFullError: Boolean;
    FNameConnect: String;
    FLastDatabaseError: Integer; // использовать специальную базу параметров
    procedure SetPathForLocalParams(const Value: String);
    procedure SetPathForSysParams(const Value: String);
    procedure SetOnAfterClose(const Value: TNotifyEvent);
    procedure SetOnAfterOpen(const Value: TNotifyEvent);
    procedure SetOnBeforeClose(const Value: TNotifyEvent);
    procedure SetOnBeforeOpen(const Value: TNotifyEvent);
    procedure SetBaseId(const Value: String);
    procedure SetUserId(const Value: String);
    procedure SetLastError(const Value: String);
    procedure SetFirstConnect(const Value: Boolean);
    procedure SetDefaultUser(const Value: String);
    procedure SetDefaultPassword(const Value: String);
    procedure SetCheckNewUser(const Value: Boolean);
    procedure SetCheckPassword(const Value: String);
    procedure SetCheckUser(const Value: String);
    procedure SetCreateAsSQL(const Value: Boolean);
    procedure SetShowFullError(const Value: Boolean);
    procedure SetNameConnect(const Value: String);
    procedure SetLastDatabaseError(const Value: Integer);  // список таблик для проверки
//    procedure SetIniSysParam(const Value: TSasaIniFile);   // файл с системными параметрами
  public
     FUseSharedConnect : Boolean;
    //------ для выполнения скриптов -------------------
     FCurConnect   : TAdsConnection;
     FShowDebug    : Boolean;
     FListProtokol : TStringList;
     FFileProtokol : String;
     FErrorExecute : Boolean;
     FStringErrorExecute : String;
    //--------------------------------------------------
    LogIni       : TIniFile;
    DataSetDeleting : TStringList; // DataSetы в которых были удаления
    CountTables : Integer;
    GlobalPar  : TGlobalPar;
    Parameters : TStringList;
    LocalParameters : TStringList;
    PathFiles  : TStringList;    // не используется
    tbLockBase : TAdsTable;
    property LastDatabaseError : Integer read FLastDatabaseError write SetLastDatabaseError;
    property NameConnect : String read FNameConnect write SetNameConnect;
    property ShowFullError : Boolean read FShowFullError write SetShowFullError;
    property CreateAsSQL : Boolean read FCreateAsSQL write SetCreateAsSQL;
    property CheckNewUser  : Boolean read FCheckNewUser write SetCheckNewUser;
    property CheckUser : String read FCheckUser write SetCheckUser;
    property CheckPassword : String read FCheckPassword write SetCheckPassword;
    property FirstConnect : Boolean read FFirstConnent write SetFirstConnect;
    property DefaultUser : String read FDefaultUser write SetDefaultUser;
    property DefaultPassword : String read FDefaultPassword write SetDefaultPassword;
    constructor Create( Owner : TComponent); override;
    constructor CreateSimple(Owner: TComponent);
    constructor CreateWithOutConnect(Owner: TComponent; OutConnect1,OutConnect2 : TAdsConnection);
    destructor  Destroy; override;
    procedure AddDeleting( DataSet : TDataSet);
    function  CheckDeleting( DataSet : TDataSet) : Boolean;
    procedure ClearDeleting;
    function  DeleteAllRecords( DataSet : TDataSet) : Boolean;
    function  IsMainComputer : Boolean;
    procedure OpenBaseParam;
    procedure CloseBaseParam;
    function LogActive:Boolean;
    function LogTypes:String;
    procedure SetLogTypes(sTypes:String);

    function  OpenOneTable(Table : TAdsTable) : Boolean;
    function  GetCommentTable(strName:String; IsEmptyToName:Boolean):String;

    function  OpenQuery(sSQL:String):TDataSet;
    procedure FreeQuery(ds:TDataSet);
    function  ChangeSQL(ds:TDataSet; sNewSQL:String) : Boolean;
    function  ExecuteSQL(sSQL:String; nLog:Integer) : Boolean;  overload;
    procedure DeleteRecordSprWork( Grid : TSasaDbGrid; var lDel : Boolean);

    function  CloseOneTable(Table : TAdsTable) : Boolean;
    function  OpenAllTables : Boolean;
    function  IsCheckTable( tb : TAdsTable) : Boolean;
    function  IsReadOnlyTable( strName : String) : Boolean;

    function  CheckAllTables : Boolean;
    // установить текущим первичный ключ PR_KEY
    function  SetPrKey(Table: TAdsTable) : Boolean;
    // найти сортировку по имени
    function  SeekSort(Table: TAdsTable; NameSort : String) : Integer;

    // установить параметры WorkQuery из Table
    procedure SetParamWorkQuery( Table : TAdstable );
    // открыть текущую таблицу без индексов и всяких прибамбасов
    function CreateWorkTable( Table : TAdstable; lExclusive : Boolean;
                               lOpen : Boolean; lShowError:Boolean=true ) : Boolean;
    procedure CloseWorkTable; // закрыть

    procedure CloseAllTables;
    function  CheckTable(Table : TAdsTable; lChangeProgr : Boolean; lFullCheck:Boolean=false; sSection:String='') : Boolean;
    function  CheckIndex(Table : TAdsTable; lChangeProgr : Boolean; lFullCheck:Boolean=false) : Boolean;
    procedure SetDefaultParam(DataSet : TAdsDataSet);

    //открыть ini-файл со структурой таблиц и индексов
    function OpenStru(FileName : String) : Boolean;
    procedure CloseStru;
    // вернуть описание поля таблицы из метаинформации
    function GetMetaStruField(Table : TAdsTable; FieldName : String) : TStruField;
    // вернуть описание всех полей таблицы из метаинформации
    function GetMetaStruTable(Table : TAdsTable; sSection:String) : TStringList;
    // очистить прочитанную ранее метаинформацию по таблице;
    procedure ClearMetaStruTable(var ListField : TStringList);

    // вернуть описание всех индексов таблицы из метаинформации
    function GetMetaIndexTable(Table : TAdsTable) : TStringList;
    // очистить прочитанную ранее метаинформацию по индексам таблице;
    procedure ClearMetaIndexTable(var ListIndex : TStringList);

    // вернуть структуру поля таблицы текущую
    function  GetStruField(Table : TAdsTable; FieldName : String) : TStruField; overload;
    function  GetStruField(Table : TAdsTable; FieldNum  : Integer): TStruField; overload;

    function CheckStruField( TableType : TAdsTableTypes; Stru1,Stru2 : PStruField) : Boolean;
    // вернуть полное название типа по краткому
    function  GetFullNameType( cType : String ) : String;
    // вернуть название типа поля по Ads-типу
    function  GetNameType( AdsType : TAdsFieldTypes ) : String;
    // вернуть Ads-тип по названию типа
    function  GetAdsType( cType : String) : TAdsFieldTypes;

    // полное имя индексного файла
    function  GetFullNameIndexFile( Table : TAdsTable) : String;
    procedure DropIndexFile( Table : TAdsTable);
    // удалить все индексные файлы базы
    procedure DropAllIndexFiles;
    // пересоздать все сортировки в базе
    function ReindexBase( lAll : Boolean=true ) : Boolean;
    // упаковать базу
    procedure PackBase( lCheck : Boolean; lAll : Boolean=true );
    // заблокировать базу
    function  LockBase : Boolean; virtual;
    // разблокировать базу
    procedure UnLockBase;  virtual;
//    function Restructure(tb : TAdsTable; cAddFields,cDelFields,cChFields : String) : Boolean;

    function GetStruForSQL(strTableName : String; ListTable: TStringList): String;
    // создать таблицу по ее описанию
    function CreateTable(Table: TAdsTable; ListTable : TStringList) : Boolean;

    function RelPath2Path(strRelPath:String) : String;

    // прочитать глобальные параметры задачи
    procedure ReadGlobalPar( strDir : String);
    procedure ReadWindowsProp;
    procedure SetMainComp;
    // вернуть новый уникальный номер записи
    function GetNewIden(Table : TAdsTable;
                        NameField : String;
                        NameSort  : String='ID_KEY') : Integer;

    function  GetNameSectionTable( Table : TAdsTable ) : String; overload; virtual;
    function  GetNameSectionTable( TableName : String) : String; overload; virtual;
    function  OpenCheck : Boolean;
    procedure CloseCheck;
    procedure DeleteCheck;
    function  ErrorCheck : Boolean;
    function  GetPropertyAds : TPropertyAds;
    // вернуть название таблицы для INI-файла (например: xxx.adt в xxx.dbf)
    function  GetNameForIni( Table : TAdsTable ) : String;
    // прочитать параметры одной таблицы коннект, тип таблицы, кодировка и др.
    function ReadParamsTable(Table: TAdsTable) : Boolean;
    function ReadParamsAllTables: Boolean;
    function CalcCountTables : Integer;
    function GetTableName( i : Integer ) : String;
    procedure CloseAllQuery;
    procedure OpenAllQuery;
    procedure OutPutStruTables;

    function  OpenConnect(var strErr : String) : Boolean;
    function SimpleConnect( var strErr : String ) : Boolean; virtual;
    procedure SimpleDisconnect;
    function  FullOpen(strNewPathData, strNewPathShared : String; lReloadPar : Boolean=true) : Boolean; virtual;
    function  ReOpen : Boolean; virtual;
    procedure FullClose;
    procedure ClearAllLists;
    function IsDirBase(strDir : String; nType : Integer) : Boolean; virtual;
    function ProcessDatabaseError : Boolean; virtual;
    function IsAdmin : Boolean; virtual;
    function GetField(strTableName : String; strFieldName : String) : TField;
    function GetBaseError( E : Exception) : String;
    property IniSysParams : TSasaIniFile read FIniSysParams;
    function SetNameFileParamTask : Boolean; virtual;
//                                         write SetIniSysParam;
    property PathForLocalParams : String read FPathForLocalParams write SetPathForLocalParams;
    property PathForSysParams : String read FPathForSysParams write SetPathForSysParams;
    function PathForBase(Conn : TAdsConnection) : String;
    property NotCheckTables : Boolean read FNotCheckTables write FNotCheckTables;
    function LParamCount : Integer;
    function ParamCount : Integer;
    function ParamAsString( strName : String ) : String;
    function LParamAsString( strName : String ) : String;
    function ParamAsInteger( strName : String ) : Integer;
    function LParamAsInteger( strName : String ) : Integer;
    function ParamAsBoolean( strName : String ) : Boolean;
    function LParamAsBoolean( strName : String ) : Boolean;
    function CreateQueryAsDataSet( strSQL : String ) : TDataSet;
    function CreateQuery( strSQL : String ) : TAdsQuery;
    procedure EditLocalParams;
    procedure EditParams;
    property  OnBeforeClose : TNotifyEvent read FOnBeforeClose write SetOnBeforeClose;
    property  OnAfterClose  : TNotifyEvent read FOnAfterClose write SetOnAfterClose;
    property  OnBeforeOpen  : TNotifyEvent read FOnBeforeOpen write SetOnBeforeOpen;
    property  OnAfterOpen   : TNotifyEvent read FOnAfterOpen write SetOnAfterOpen;
    property  BaseId : String read FBaseId write SetBaseId;
    property  UserId : String read FUserId write SetUserId;
    property  LastError : String read FLastError write SetLastError;
    function GetVersionBase( Connect : TAdsConnection ) : String; virtual;
    function GetEngineVersion : String; virtual;
    function SysQuery(sText: String): String;
    procedure SetDateFormat( ds : TDataSet );
    function IsConnected : Boolean; virtual;
    function GetDataSet( strName : String ) : TDataSet;
    function GetTable(strName: String): TAdsTable;
    function SeekValueTable(strName: String; strKeyFields:String; strSeek : String; strField : String; lSaveSeekRecno:Boolean=false) : Variant;
    function SeekValueTable2(ds:TDataSet; strKeyFields:String; strSeek : String; strField : String) : Variant;
    function CreateAddTable(strTableName,strName,strDataBase : String) : TAdsTable;
    function LoadSQL( strNameSQL : String; var strSQL : String) : Boolean;
    function GetSQLFromStr(strSQL: String; strSect : String): String;
    function CheckPath( strPath : String ) : String;
    function CheckSimPath( strPath : String ) : String;

    //------ для выполнения скриптов -------------------
    function   OpenExecute(Connect:TAdsConnection; strFile : String; lShow:Boolean) : Boolean;
    procedure  CloseExecute;
    function   GetErrorExecute(var strErr:String) : Boolean;
    procedure  SetErrorExecute(strErr:String);
    function   ExecuteSQL(strSQL:String; Conn:TAdsConnection=nil) : Boolean; overload;
    procedure  AddToProtokol(s:String);
    procedure  ShowProtokolExecute;
    //----- для работы с несколькими базами
    procedure LoadAddConnects;         // прочитать все коннекты из ALLCONNECTS и SHAREDCONNECTS
    function SeekConnect(strName : String) : Integer;
    function AddNewConnect(strName,strConnectPath,strSharedConnectPath : String) : Boolean;     // добавить новый коннект
    function EditPathConnect(strName, strConnectPath, strSharedConnectPath: String): Boolean;   // отредактировать коннект
    function CountConnects : Integer;                                    // количество коннектов
    function GetNameConnect( i : Integer) : String; overload;            // вернуть имя коннекта по номеру
    function GetNameConnect( strPath : String) : String; overload;       // вернуть имя коннекта по пути
    function GetPathConnect( i : Integer) : String;                      // вернуть путь к коннекту
    function GetPathSharedConnect(i: Integer): String;                   // вернуть путь к SHARED-конекту

    procedure DisableControls; virtual;
    procedure EnableControls; virtual;

    procedure ScriptForCreateTable(strTableName : String; slScript : TStringList; lTmp:Boolean=false);
    function  CreatePropCurrentColumn(Query: TAdsQuery; lWithConstraint : Boolean) : String;

    function ChoiceConnect(var strNewPathData : String; var strNewPathShared : String;
              var nConnect : Integer) : Boolean;

    function GetStrErrAds( nError : Integer ) : String;

    function NameTableToSQL(tb:TAdsTable) : String;

    function CheckPathBase(strNewPath : String) : Boolean;
    function CheckTypeServer(strDir : String) : Boolean;

    function ReplaceTableBase(strPath:String; strTableName: String): Boolean;

  end;


const
  ArrSootv : array[1..19] of TTypeField =
             (
               (Name:'Character'    ;  Ads:AdsfldSTRING      ),    // Char
               (Name:'Numeric'      ;  Ads:AdsfldNUMERIC     ),
               (Name:'Date'         ;  Ads:AdsfldDATE        ),
               (Name:'Logical'      ;  Ads:AdsfldLOGICAL     ),
               (Name:'Memo'         ;  Ads:AdsfldMEMO        ),
               (Name:'Double'       ;  Ads:AdsfldDOUBLE      ),
               (Name:'Integer'      ;  Ads:AdsfldINTEGER     ),
               (Name:'ShortDate'    ;  Ads:AdsfldCOMPACTDATE ),
               (Name:'ShortInt'     ;  Ads:AdsfldSHORTINT    ),
               (Name:'Time'         ;  Ads:AdsfldTIME        ),
               (Name:'TimeStamp'    ;  Ads:AdsfldTIMESTAMP   ),
               (Name:'AutoInc'      ;  Ads:AdsfldAUTOINC     ),
               (Name:'Raw'          ;  Ads:AdsfldRAW         ),
               (Name:'CurDouble'    ;  Ads:AdsfldCURDOUBLE   ),
               (Name:'Image'        ;  Ads:AdsfldIMAGE ),
               (Name:'Binary'       ;  Ads:AdsfldBINARY ),
               (Name:'VarChar'      ;  Ads:AdsfldVARCHAR     ),
               (Name:'Money'        ;  Ads:AdsfldMONEY       ),
               (Name:'CICharacter'  ;  Ads:AdsfldCISTRING    )    // CIChar
             );

  ArrSootvSQL : array[1..22] of TTypeField =
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

  procedure SetPosProgress(nLeft, nTop : Integer);

var
  dmTask: TdmTask;
  nLeftProgress, nTopProgress : Integer;

implementation

uses MetaTask, fWarning, uTypes;

{$R *.DFM}

procedure SetPosProgress(nLeft, nTop : Integer);
begin
  nLeftProgress :=nLeft;
  nTopProgress  :=nTop;
end;

//--------------------------------------------------------------
//  установить тип таблицы
//--------------------------------------------------------------
procedure SetTableType( Table : TAdsTable; strType : String);
begin
  if strType = 'CDX' then begin
    Table.TableType := ttAdsCDX;
  end else if strType = 'NTX' then begin
    Table.TableType := ttAdsNTX;
  end else if strType = 'VFP' then begin
    Table.TableType := ttAdsVFP;
  end else begin
    Table.TableType := ttAdsADT;
  end
end;

//--------------------------------------------------------------
//  установить кодовую страницу таблицы
//--------------------------------------------------------------
procedure SetTableCharSet( Table : TAdsTable; strCS : String);
begin
  if ANSIUpperCase(Trim(strCS)) = 'OEM' then begin
    Table.AdsTableOptions.AdsCharType := OEM;
  end else begin
    Table.AdsTableOptions.AdsCharType := ANSI;
  end;
end;

//---- производные таблицы для которых не нужно проверять их наличие ---------
function IsWorkTable(Table : TAdsTable) : Boolean;
begin
  if (Length(Table.TableName)=0) or
     (Copy(Table.Name,1,1)='#') or
     (UpperCase(Copy(Table.Name,1,6))='LOOKUP') or
     (UpperCase(Copy(Table.Name,1,4))='WORK') then  begin
    Result := true;
  end else begin
    Result := false;
  end;
end;

//---- производные запросы которые ненужно открывать
function IsWorkQuery(Query : TAdsQuery) : Boolean;
begin
  if (UpperCase(Copy(Query.Name,1,4)) = 'WORK') or
     (Length(Query.SQL.Text)=0) then begin
    Result := true;
  end else begin
    Result := false;
  end;
end;

//------------------------------------------------
constructor TdmTask.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  dmTaskCreate(false);
end;

//------------------------------------------------
constructor TdmTask.CreateSimple(Owner: TComponent);
begin
  inherited Create(Owner);
  FFileProtokol:='';
  FListConnects := nil;
  FListSharedConnects := nil;
  FIniSysParams := nil;
  FLogActive:=true;
  FLogTypes:='';
end;


constructor TdmTask.CreateWithOutConnect(Owner: TComponent; OutConnect1,OutConnect2 : TAdsConnection);
begin
  inherited Create(Owner);
  AdsConnection.Free;
  AdsSharedConnection.Free;
  AdsConnection:=OutConnect1;
  if OutConnect2=nil then begin
    AdsSharedConnection:=OutConnect1;
  end else begin
    AdsSharedConnection:=OutConnect2;
  end;
  dmTaskCreate(true);
end;

//--------------------------------------------------
destructor TdmTask.Destroy;
begin
  dmTaskDestroy;
  inherited Destroy;
end;

procedure TdmTask.AddDeleting(DataSet: TDataSet);
var
  i : integer;
  lFind : Boolean;
begin
  lFind := false;
  for i:=0 to DataSetDeleting.Count-1 do begin
    if DataSetDeleting.Objects[i] is TDataSet then begin
      if TDataSet(DataSetDeleting.Objects[i]).Name = DataSet.Name then begin
        lFind := true;
        break;
      end;
    end;
  end;
  if not lFind then begin
    DataSetDeleting.AddObject(DataSet.Name, DataSet);
  end;
end;

function TdmTask.CheckDeleting(DataSet: TDataSet): Boolean;
var
  i : integer;
begin
  Result := false;
  for i:=0 to DataSetDeleting.Count-1 do begin
    if DataSetDeleting.Objects[i] is TDataSet then begin
      if TDataSet(DataSetDeleting.Objects[i]).Name = DataSet.Name then begin
        Result := true;
        break;
      end;
    end;
  end;
end;

procedure TdmTask.ClearDeleting;
begin
  DataSetDeleting.Clear;
end;

// необходимо или нет создание таблицы в случае ее отсутствия
function TdmTask.IsCheckTable( tb : TAdsTable) : Boolean;
var
  i : Integer;
begin
  if FNotCheckTables or (FListCheckTables.Count > 0) then begin
    Result := false;
    for i:=0 to FListCheckTables.Count-1 do begin
      if ANSIUpperCase(FListCheckTables.Strings[i])=
         ANSIUpperCase(tb.TableName) then begin
        Result := true;
      end;
    end;
  end else begin
    Result := true;
  end;
end;
function TdmTask.CheckAllTables: Boolean;
var
 {$IFNDEF DEBUG}
  j : integer;
 {$ENDIF}
  i : integer;
  l : Boolean;
  cur : TCursor;
  Table : TAdsTable;
  strName : String;
begin
  cur := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := true;
//  strTables := FListCheckTables.CommaText+',';
  try
//  strFile := FIniSysParams.ReadString('FILE','LOCAL_PARAM', 'ParLocal.ini');
    {$IFNDEF DEBUG}
      j:=0;
      CreateProgress('Проверка таблиц базы','',CountTables,nLeftProgress,nTopProgress);
    {$ENDIF}
    // если прочитан список таблиц для проверки на их наличие
    // иначе просматриваем список компонентов
    if FListCheckTables.Count > 0 then begin
      for i:=0 to FListCheckTables.Count-1 do begin
        strName := FListCheckTables.Strings[i];
        Table := TAdsTable.Create(nil);
        Table.Name := 'tmpTable';
        Table.TableName := strName;
        if ReadParamsTable(Table) then begin
          {$IFNDEF DEBUG}
            Inc(j);
            ChangeProgress(j,LowerCase(Table.TableName));
          {$ENDIF}
          l := CheckTable(Table, true);
          if not l and Result then Result:=false;  // ошибка проверки
        end else begin
          PutError(' Не найдено описание таблицы "'+Table.TableName+'"');
          Result := false;
        end;
        Table.Free;
        if not Result then Break;
      end;
    end else begin
      for i:=0 to ComponentCount-1 do begin
        if (Components[i] is TAdsTable) then begin
          Table := TAdsTable(Components[i]);
          if not IsWorkTable(Table) then begin
            {$IFNDEF DEBUG}
              Inc(j);
              ChangeProgress(j,LowerCase(Table.TableName));
            {$ENDIF}
            l := CheckTable(Table, true);
            if not l and Result then Result:=false;  // ошибка проверки
          end;
        end;
        if not Result then Break;
      end;
    end;
  finally
    {$IFNDEF DEBUG}
      CloseProgress;
    {$ENDIF}
    Screen.Cursor := cur;
  end;
end;


function MyCallbackFunc( usPercent: Word;
                         ulCallbackID: Longint ): Longint; stdcall;
begin
  Result := 0;
  if ulCallbackID=1 then begin
    ChangeProgress2(usPercent);
  end;
end;

function TdmTask.CheckIndex(Table: TAdsTable; lChangeProgr : Boolean; lFullCheck:Boolean) : Boolean;
var
  ListIndex : TStringList;
  StruIndex : PStruIndex;
//  old_ms : TDataSource;
//  old_mf : String;
//  old_in : String;
  i,n,j : integer;
  s : string;
  opt : TAdsIndexOptions;
  sss : String;
  FTSInd : TStringList;
  lSeek : Boolean;
begin
  Result:=true;
  if not lFullCheck then begin
    if not GlobalPar.CheckIndex then exit;
    if FNotCheckTables then exit;
    if IsWorkTable(Table) then exit;
  end;
  ListIndex := GetMetaIndexTable(Table);
  if (ListIndex <> nil) and (ListIndex.Count>0) then begin
     //--- отладка ---
     {
     s:='['+Table.TableName+']'+chr(13)+chr(10);
     for i:=0 to ListIndex.Count-1 do begin
       StruIndex := PStruIndex(ListIndex.Objects[i]);
       s := s + Format('%s,%d,%s,%s',[StruIndex^.tag,StruIndex^.Tip,
                  StruIndex^.strKey,StruIndex^.strCond])+chr(13)+chr(10);
     end;
     showmessage(s);
    }
    //--------------
    CreateWorkTable(Table, false, true);
    WorkTable.IndexDefs.Update;
    FTSInd := TStringList.Create;
    WorkTable.GetFTSIndexNames(FTSInd);
    for i:=0 to ListIndex.Count-1 do begin
      if SeekSort(WorkTable, Trim(ListIndex.Strings[i])) = -1 then begin
        // может сортировка FTS
        lSeek:=false;
        for j:=0 to FTSInd.Count-1 do begin
          if FTSInd[j] = Trim(ListIndex.Strings[i]) then begin
            lSeek := true;
            break;
          end;
        end;
        if not lSeek then begin
          if lFullCheck or not GlobalPar.OnlyOpen then begin
            {$IFNDEF DEBUG}
              if lChangeProgr then begin
                ChangeProgress2(0, 'создание сортировки '+LowerCase(Trim(ListIndex.Strings[i]))+' ...');
              end;
            {$ENDIF}
            StruIndex := PStruIndex(ListIndex.Objects[i]);
            if StruIndex^.Tip = 0 then begin
              n := pos('.',WorkTable.TableName);
              if n > 0 then s := Copy(WorkTable.TableName,1,n-1)
                       else s := WorkTable.TableName;
              WorkQuery.DatabaseName := WorkTable.AdsConnection.Name;
              WorkQuery.SourceTableType := WorkTable.TableType;
              WorkQuery.AdsTableOptions.AdsCharType := WorkTable.AdsTableOptions.AdsCharType;
              WorkQuery.SQL.Clear;
              if [ixUnique] * StruIndex^.Options = [ixUnique]
                 then sss := 'CREATE UNIQUE INDEX '
                 else sss := 'CREATE INDEX ';
              WorkQuery.SQL.Add(sss+StruIndex^.Tag+' ON '+
                  s+' ('+StruIndex^.strKey+')');
              if StruIndex^.Contains then begin
  //              WorkQuery.SQL.Add(' CONTENT IN FILE fts_'+s+' ');
                WorkQuery.SQL.Add(' CONTENT ');
                if StruIndex^.MinWord<>'' then begin
                  WorkQuery.SQL.Add(' MIN WORD '+StruIndex^.MinWord+' ');
                end;
                if StruIndex^.MaxWord<>'' then begin
                  WorkQuery.SQL.Add(' MAX WORD '+StruIndex^.MaxWord+' ');
                end;
                if StruIndex^.NoiseWords<>'' then begin
                  WorkQuery.SQL.Add(' NEW NOISE '+QStr(StruIndex^.NoiseWords)+' ');
                end;
                if StruIndex^.DropCharacters<>'' then begin
                  WorkQuery.SQL.Add(' NEW DROPCHARS '+QStr(StruIndex^.DropCharacters)+' ');
                end;
                if StruIndex^.Delimiters<>'' then begin
                  WorkQuery.SQL.Add(' DELIMITERS '+QStr(StruIndex^.Delimiters)+' ');
                end;
              end;
              CloseWorkTable;
              {$IFNDEF DEBUG}
                if lChangeProgr then begin
                  WorkQuery.AdsRegisterCallbackFunction( @MyCallbackFunc, 1 );
                end;
              {$ENDIF}
              try
                WorkQuery.ExecSQL;
              except
                on E: Exception do begin
                  Result := false;
                  PutError(' Ошибка создания сортировки таблицы: '+Table.TableName+
                            #13+E.Message);
                  break;
                end;
              end;
              {$IFNDEF DEBUG}
                if lChangeProgr then begin
                  WorkQuery.AdsClearCallbackFunction;
                  ChangeProgress2(-1, '');
                end;
              {$ENDIF}
              WorkQuery.AdsCloseSQLStatement;  // tadsquery
              CreateWorkTable(Table, true, true);
      //        WorkTable.AddIndex(StruIndex^.Tag, StruIndex^.strKey, []);
            end else begin
    //          WorkTable.AddIndex(StruIndex^.Tag, StruIndex^.strKey, StruIndex^.Options);
              CloseWorkTable;
              CreateWorkTable(Table, true, true);
              try
                opt := [optCOMPOUND];
                if ixUnique in StruIndex^.Options then begin
                  opt := opt + [optUNIQUE];
                end;
                if ixDescending in StruIndex^.Options then begin
                  opt := opt + [optDescending];
                end;
                WorkTable.AdsCreateIndex('',StruIndex^.Tag,StruIndex^.strKey,
                      StruIndex^.strCond,StruIndex^.strWhile,opt); // optUNIQUE
              except
                on E: Exception do begin
                  Result := false;
                  PutError(' Ошибка создания сортировки таблицы: '+Table.TableName+
                            #13+E.Message);
                  break;
                end;
              end;
            end;
          end else begin
            Result := false;
            ShowMessage(' Невозможно создать сортировку таблицы: '+Table.TableName+
                        #13+'Требуется монопольное открытие.');
            break;
          end;
        end;
      end;
    end;
    FTSInd.Free;
    CloseWorkTable;
    ClearMetaIndexTable(ListIndex);
  end else begin
    ListIndex.Free;
    //Result := false;
    //ShowMessage(' Неизвестна структура таблицы: '+Table.TableName)
  end;
end;

function TdmTask.CheckTable(Table: TAdsTable; lChangeProgr : Boolean; lFullCheck:Boolean; sSection:String): Boolean;
var
  ListField    : TStringList;
  CurStruField : TStruField;
//  StruField    : PStruField;
  NewStruField : PStruField;
  i,j : integer;
  cDelFields,cChFields : String;
  cAddFields,s : String;
  lDel, lAdd : Boolean;
begin
  Result := true;
  if not lFullCheck then begin
    if IsWorkTable(Table) then begin
      exit;
    end;
  end;       
  if Length(Table.TableName) > 0 then begin
    ListField := GetMetaStruTable(Table,sSection);
    if (ListField <> nil) and (ListField.Count>0) then begin
       //--- отладка ---
       {
       s:='['+Table.TableName+']'+chr(13)+chr(10);
       for i:=0 to ListField.Count-1 do begin
         StruField := PStruField(ListField.Objects[i]);
         s := s + Format('%s,%s,%d,%d',[StruField^.name,StruField^.Tip,
                    StruField^.Len,StruField^.Toch])+chr(13)+chr(10);
       end;
       showmessage(s);
       }
      //--------------
      if not Table.Exists then begin
        {$IFNDEF DEBUG}
          if lChangeProgr then
            ChangeProgress2(-1, 'создание таблицы ');
        {$ENDIF}
        Result := CreateTable(Table,ListField);
      end else begin
        // собственно проверка
        if lFullCheck or GlobalPar.CheckStru then begin
          CreateWorkTable(Table, false, true);
          WorkTable.FieldDefs.Update;
          //---------- определим удаляемые поля --------------------
          cDelFields:='';
          cChFields:='';
          for i:=0 to WorkTable.FieldDefs.Count-1 do begin
            CurStruField := GetStruField(WorkTable, i+1);
            lDel:=true;
            for j:=0 to ListField.Count-1 do begin
              s := UpperCase(Trim(ListField.Strings[j]));
              if s = CurStruField.Name then begin
                //---- проверим, может надо сконвертировать поле -------
                NewStruField := PStruField(ListField.Objects[j]);
                if not CheckStruField(WorkTable.TableType, @CurStruField, NewStruField) then begin
                   cChFields := cChFields +
                    Format('%s,%s,%s,%d,%d;',
                     [s,s,NewStruField^.Tip,NewStruField^.Len,NewStruField^.Toch]);
                end;
                //------------------------------------------------------
                lDel:=false;
                break;
              end;
            end;
            if lDel then begin // поле надо удалять
              cDelFields := cDelFields + CurStruField.Name + ';'
            end;
          end;
          //------ определим добавляемые поля --------------------
          cAddFields := '';
          for i:=0 to ListField.Count-1 do begin
            s := UpperCase(Trim(ListField.Strings[i]));
            lAdd := true;
            for j:=0 to WorkTable.FieldDefs.Count-1 do begin
              CurStruField := GetStruField(WorkTable, j+1);
              if s = CurStruField.Name then begin // поле существует
                lAdd := false;
              end;
            end;
            if lAdd then begin
              NewStruField := PStruField(ListField.Objects[i]);
//              if NewStruField^.Tip = 'ShortInteger' then begin
//                NewStruField^.Tip := 'ShortInt';
//              end;
              cAddFields := cAddFields + s + ','+NewStruField^.Tip+','+
                         IntToStr(NewStruField^.Len)+','+
                         IntToStr(NewStruField^.Toch)+';';
            end;
          end;
          if (Length(cAddFields) > 0) or (Length(cDelFields) > 0) or
             (Length(cChFields) > 0) then begin
            s := '';
            if Length(cAddFields)>0 then begin
              s := s + 'Добавление:'+cAddFields+#13;
            end;
            if Length(cDelFields)>0 then begin
              s := s + 'Удаление:'+cDelFields+#13;
            end;
            if Length(cChFields)>0 then begin
              s := s + 'Изменение:'+cChFields+#13;
            end;
            if Problem(' Необходимо изменение структуры таблицы:'+WorkTable.TableName+#13+s+
                #13+'Произведем реорганизацию сейчас ?') then begin
//            ShowMessage(' Изменение структуры таблицы:'+WorkTable.TableName+'  '+#13+s);
              WorkTable.Close;
              WorkQuery.AdsCloseSQLStatement;
              AdsConnection.CloseCachedTables;
              DropIndexFile(WorkTable);
              {$IFNDEF DEBUG}
                if lChangeProgr then begin
                  ChangeProgress2(-1, 'реорганизация таблицы ...');
//                WorkTable.AdsRegisterCallbackFunction( @MyCallbackFunc, 1);
                end;
              {$ENDIF}
//              Restructure(WorkTable,cAddFields,cDelFields,cChFields);
              WorkTable.Restructure(cAddFields,cDelFields,cChFields);
              {$IFNDEF DEBUG}
                if lChangeProgr then begin
//                WorkTable.AdsClearCallbackFunction;
                  ChangeProgress2(-1, '');
                end;
              {$ENDIF}
            end else begin
              ClearMetaStruTable(ListField);
              Result := false;
              Exit;
            end;
          end;
        end;
      end;
      Result := CheckIndex(Table, lChangeProgr, lFullCheck);
    end else begin
      Result := false;
    end;
    ClearMetaStruTable(ListField);
  end;
end;

//------------------------------------------------------------------------------------
{
function TdmTask.Restructure(tb : TAdsTable; cAddFields,cDelFields,cChFields : String) : Boolean;
var
   hConnect : ADSHANDLE;
   strTableName : string;
   usTableType,usCharType : UNSIGNED16;
begin
   tb.Close;
   WorkQuery.AdsCloseSQLStatement;
   AdsConnection.CloseCachedTables;
   Result := true;
   hConnect := tb.AdsConnection.ConnectionHandle;
   strTableName := CheckSleshN(tb.AdsConnection.ConnectPath)+tb.TableName;
   if tb.TableType = ttAdsADT then begin
     usTableType := ADS_ADT;
   end else begin
     usTableType := ADS_CDX;
   end;
   if ( tb.AdsTableOptions.AdsCharType = ANSI ) then  begin
     usCharType := ADS_ANSI;
   end else begin
     usCharType := ADS_OEM;
   end;
   ACECheck( nil, ACE.AdsRestructureTable( hConnect,
                                           pChar( strTableName ),
                                           '',
                                           usTableType,
                                           usCharType,
                                           ADS_COMPATIBLE_LOCKING,
                                           ADS_IGNORERIGHTS, // ADS_CHECKRIGHTS,
                                           pChar( cAddFields ),
                                           pChar( cDelFields ),
                                           pChar( cChFields ) ) );

end;
}

//----------------------------------------------------------------
procedure TdmTask.ClearMetaIndexTable(var ListIndex: TStringList);
var
  i : Integer;
  StruIndex : PStruIndex;
begin
  for i:=0 to ListIndex.Count-1 do begin
    StruIndex := PStruIndex(ListIndex.Objects[i]);
    Dispose(StruIndex);
  end;
  ListIndex.Free;
  ListIndex:=nil;
end;

procedure TdmTask.ClearMetaStruTable(var ListField: TStringList);
var
  i : Integer;
  StruField : PStruField;
begin
  for i:=0 to ListField.Count-1 do begin
    StruField := PStruField(ListField.Objects[i]);
    Dispose(StruField);
  end;
  ListField.Free;
  ListField:=nil;
end;

procedure TdmTask.CloseAllTables;
var
  i : integer;
  Table : TAdsTable;
begin
  for i:=0 to ComponentCount-1 do begin
    if Components[i] is TAdsTable then begin
      Table := TAdstable(Components[i]);
      if Table.Active then begin
        CloseOneTable(Table);  //.Active := false;;
      end;
    end;
  end;
  SimpleDisconnect;
end;

function TdmTask.CloseOneTable(Table: TAdsTable): Boolean;
begin
  Table.Active := false;
  Result:=true;
end;

function TdmTask.GetStruForSQL(strTableName : String; ListTable: TStringList): String;
var
  i : Integer;
  StruField : PStruField;
  strFieldName,s,strTip : String;
//  strStru : String;
begin
  i := Pos('.',strTableName);
  if i>0
    then strTableName := Copy(strTableName,1,i-1);
  if Pos(' ',strTableName) > 0
    then strTableName := '['+strTableName+']';
  Result := 'CREATE TABLE '+strTableName+' (';
  for i:=0 to ListTable.Count-1 do begin
    strFieldName := UpperCase(Trim(ListTable.Strings[i]));
    StruField := PStruField(ListTable.Objects[i]);
    case StruField.AdsTip of
      AdsfldNUMERIC : begin
                        if StruField^.Toch=0
                          then s := '(' + IntToStr(StruField^.Len) + ',0)'
                          else s := '(' + IntToStr(StruField^.Len) + ', ' +
                                       IntToStr(StruField^.Toch) + ')';
                        end;
      AdsfldSTRING,
      AdsfldCISTRING:  s := '(' + IntToStr(StruField^.Len) + ')';
    else
      s := '';
    end;
    strTip := UpperCase(StruField^.Tip);
    if strTip = 'CHARACTER' then begin
      strTip := 'Char';
    end else if strTip = 'CICHARACTER' then begin
      strTip := 'CIChar';
    end else if strTip = 'SHORTINT' then begin
      strTip := 'Short';
    end else begin
      strTip := StruField^.Tip;
    end;
    Result := Result + '['+strFieldName+']' + ' ' + strTip + s;
    if i<>ListTable.Count-1
      then Result := Result + ', '#13;
  end;
  Result := Result + ')';
end;

//---------------------------------------------------------------------------
//  скрипт для создания таблицы подключенной к словарю
//---------------------------------------------------------------------------
procedure TdmTask.ScriptForCreateTable(strTableName:String; slScript:TStringList; lTmp:Boolean);
var
  Query : TAdsQuery;
  slColumns : TStringList;
  ss,sTmp : String;
  i : Integer;
begin
  slColumns := TStringList.Create;
  Query := TAdsQuery.Create(nil);
  Query.DatabaseName:=AdsConnection.Name;
  Query.SQL.Text := 'SELECT * FROM '+SysQuery('SYSTEM.COLUMNS')+' WHERE parent='+
                    QStr(strTableName);
  Query.Open;
  Query.First;
  while not Query.Eof do begin
    ss := CreatePropCurrentColumn(Query,false);
    slColumns.Add(ss);
    Query.Next;
  end;
  slScript.Clear;
  if (slColumns.Count>0) then begin
    if lTmp then sTmp:='#' else sTmp:='';
    slScript.Add('CREATE TABLE '+sTmp+strTableName+' (');
    for i:=0 to slColumns.Count-1 do begin
      if i=slColumns.Count-1 then begin
        slScript.Add('  '+slColumns.Strings[i]);
      end else begin
        slScript.Add('  '+slColumns.Strings[i]+',');
      end;
    end;
    slScript.Add('   );');
//    ScriptForCreateIndex(QueryCur, slIndex);
//    ScriptForCreateTableProperty( QueryCur, slProp);
  end;
  Query.Free;
  slColumns.Free;
end;

//-------------------------------------------------------------------------
function TdmTask.CreatePropCurrentColumn(Query: TAdsQuery; lWithConstraint : Boolean) : String;
var
  s, sTable, sField : String;
const
  c : String = ' CONSTRAINT ';

  function GetStruColumn : String;
  var
    nType : Integer;
    sLen, sDec, s : String;
  begin
    with Query do begin
      nType  := FieldByName('Field_Type').AsInteger;
      Result := ArrSootvSQL[nType].Name;  // символьный тип поля
      case ArrSootvSQL[nType].Ads of
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
begin
  with Query do begin
    sTable := FieldByName('Parent').AsString;
    sField := FieldByName('Name').AsString;
    Result := sField + ' ' + GetStruColumn + ' ';
    if lWithConstraint then begin
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
    end;
  end;
end;

function TdmTask.CreateTable(Table: TAdsTable; ListTable: TStringList): Boolean;
var
  i : Integer;
  StruField : PStruField;
  strFieldName : String;
  strStru : String;
  stDataSetOptions : TAdsDatasetOptions;
begin
  Result := true;
  if FCreateAsSQL then begin
    try
      stDataSetOptions.musAdsLockType := ADS_COMPATIBLE_LOCKING;
      if Table.AdsTableOptions.AdsCharType=ANSI
        then stDataSetOptions.musAdsCharType := ADS_ANSI
        else stDataSetOptions.musAdsCharType := ADS_OEM;
      stDataSetOptions.musAdsRightsCheck := ADS_IGNORERIGHTS;
      stDataSetOptions.musAdsTableType := TableType2Word(Table.TableType);
      Table.AdsConnection.Execute(stDataSetOptions,GetStruForSQL(Table.TableName, ListTable));
    except
      Result := false;
    end;
  end else begin
    CreateWorkTable( Table, true, false);
    strStru := '';
    for i:=0 to ListTable.Count-1 do begin
      strFieldName := UpperCase(Trim(ListTable.Strings[i]));
      StruField := PStruField(ListTable.Objects[i]);
      strStru := strStru + strFieldName+','+StruField^.Tip+','+
                 IntToStr(StruField^.Len)+','+IntToStr(StruField^.Toch)+';'
    end;
    try
      // при работе через ALIASNAME будет работать неверно
      WorkTable.AdsCreateTable(CheckSleshN(Table.AdsConnection.ConnectPath)
                +Table.TableName, Table.TableType,
                Table.AdsTableOptions.AdsCharType, MEMO_SIZE, strStru);
      Result := true;
    except
      Result := false;
    end;
  end;
end;

function TdmTask.CreateWorkTable(Table: TAdstable; lExclusive: Boolean;
                                  lOpen : Boolean; lShowError:Boolean) : Boolean;
begin
  Result:=true;
  WorkTable.Active:=false;
  WorkTable.TableName     := Table.TableName;
  WorkTable.TableType     := Table.TableType;
//  WorkTable.AdsConnection := Table.AdsConnection;
  WorkTable.DataBaseName := Table.AdsConnection.Name;
  WorkTable.AdsTableOptions.AdsCharType := Table.AdsTableOptions.AdsCharType;
  WorkTable.Exclusive := lExclusive;
  if lOpen then begin
    try
      Result:=false;
      WorkTable.Active := true;
      Result:=true;
    except
      on E : EADSDatabaseError do begin
        if lShowError then begin
          if lExclusive then begin
            PutError(' Ошибка монопольного открытия таблицы: '+Table.TableName+#13
                      +'Код ошибки ['+IntToStr(E.ACEErrorCode)+']');
          end else begin
            PutError(' Ошибка совместного открытия таблицы: '+Table.TableName+#13
                      +'Код ошибки ['+IntToStr(E.ACEErrorCode)+']');
          end;
        end;
      end;
    end;
  end;
end;

procedure TdmTask.CloseWorkTable;
begin
  WorkTable.Active:=false;
  WorkTable.TableName     := '';
  WorkTable.AdsConnection := nil;
end;

function TdmTask.CalcCountTables : Integer;
var
  j,i : Integer;
  Table : TAdsTable;
begin
  FListOpenTables.Clear;
  FIniStru.ReadSectionValues('OPEN_TABLES', FListOpenTables);
  FListCheckTables.Clear;
  FIniStru.ReadSectionValues('CHECK_TABLES', FListCheckTables);
  if FListCheckTables.Count > 0 then begin
    for i:=0 to FListCheckTables.Count-1 do begin
      FListCheckTables.Strings[i] := ANSIUpperCase(Trim(FListCheckTables.Strings[i]));
    end;
    Result := FListCheckTables.Count;
  end else begin
    j := 0;
    for i:=0 to ComponentCount-1 do begin
      if Components[i] is TAdsTable then begin
        Table := TAdsTable(Components[i]);
        if (Length(Table.TableName) > 0) and
           not IsWorkTable(Table) then begin
          Inc(j);
          FListCheckTables.Add( ANSIUpperCase(Trim(Table.TableName)) );
        end;
      end;
    end;
    Result := j;
  end;
end;

function TdmTask.GetTableName( I : Integer ) : String;
begin

end;

procedure TdmTask.dmTaskCreate(lOnlyCreate : Boolean);
begin
  FShowFullError := false;
  FCreateAsSQL  := true;
  FFirstConnect := true;
  FTypeLogin    := LOGIN_OFF;
  FUseSharedConnect := false;
  FBaseId:='MAIN';
  FUserId:='ADMIN';
  FIniStru:=nil;
  FOnBeforeOpen  := nil;
  FOnBeforeClose := nil;
  FOnAfterOpen   := nil;
  FOnAfterClose  := nil;
  FListCheckTables:=TStringList.Create;
  FListOpenTables:=TStringList.Create;
  FListErrorOpen:=TStringList.Create;
  FListReadOnly := TStringList.Create;
  LogIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\log.ini');
  DataSetDeleting := TStringList.Create;
  Parameters      := TStringList.Create;
  LocalParameters := TStringList.Create;
  PathFiles       := TStringList.Create;
  PathForLocalParams := strPathForLocalParams;
  PathForSysParams   := strPathForSysParams;
  NotCheckTables := false;
  if not lOnlyCreate then begin
    if not FullOpen('','') then begin
      Application.Terminate;
    end;
  end;
end;

procedure TdmTask.dmTaskDestroy;
begin
  CloseAllQuery;
  CloseAllTables;
  CloseStru;
  DataSetDeleting.Free;
  Parameters.Free;
  LocalParameters.Free;
  PathFiles.Free;
  FIniSysParams.UpdateFile;
  FIniSysParams.Free;
  FListConnects.Free;
  FListSharedConnects.Free;
  DeleteCheck;
  LogIni.Free;
  FListCheckTables.Clear;
  FListCheckTables.Free;
  FListOpenTables.Clear;
  FListOpenTables.Free;
  FListErrorOpen.Free;
  FListReadOnly.Free;
end;

procedure TdmTask.FullClose;
begin
  if Assigned(FOnBeforeClose) then begin
    FOnBeforeClose(Self);
  end;
  ClearAllLists;
  CloseAllTables;
  CloseAllQuery;
  DeleteCheck;
  if Assigned(FOnAfterClose) then begin
    FOnAfterClose(Self);
  end;
end;

procedure TdmTask.ClearAllLists;
begin
  FListCheckTables.Clear;
  FListOpenTables.Clear;
  FListReadOnly.Clear;
  FListErrorOpen.Clear;
  DataSetDeleting.Clear;
//  Parameters.Clear;           ???
//  LocalParameters.Clear;      ???
  PathFiles.Clear;
end;

function TdmTask.ReOpen : Boolean;
begin
  Result := FullOpen(GlobalPar.RelConnectPath, GlobalPar.RelSharedConnectPath);
end;
//-----------------------------------------------------------------------------------
function TdmTask.SimpleConnect( var strErr : String ) : Boolean;
var
  sCode:String;
begin             
  strErr:='';
  Result := true;
  FLastDatabaseError := 0;
  try
    if IsDirBase(AdsConnection.ConnectPath,0) then begin
      AdsConnection.IsConnected := true;
    end else begin
      FLastDatabaseError := -1;
      strErr:='База данных не найдена: "'+AdsConnection.ConnectPath+'"';
    end;
    if FLastDatabaseError = 0 then begin
      if FUseSharedConnect then begin
        if IsDirBase(AdsSharedConnection.ConnectPath,1) then begin
          AdsSharedConnection.IsConnected := true;
        end else begin
          FLastDatabaseError := -2;
          strErr:='Системные справочники не найдены: "'+AdsSharedConnection.ConnectPath+'"';
        end;
      end;
    end;
  except
    on E:Exception do begin
      Result := false;
      if ( E is EADSDatabaseError ) then begin
        FLastDatabaseError:=( E as EADSDatabaseError ).ACEErrorCode;
      end else begin
        FLastDatabaseError:=9999;
      end;
      if ShowFullError then begin
        if ( E is EADSDatabaseError ) then begin
          strErr := 'Код ошибки ['+IntToStr(( E as EADSDatabaseError ).ACEErrorCode)+']'+#13+
                    'Connection: '+AdsConnection.ConnectPath+#13+
                    'DataSetInstanceOwner: '+(E as EAdsDatabaseError).DataSetInstanceOwner + #13 +
                    'Databasename: '+(E as EADSDatabaseError).Databasename + #13 +
                    'TableName: '+(E as EADSDatabaseError).TableName + #13 +
                   E.message;
        end else begin
          strErr := E.Message;
        end;
      end else begin
        if ( E is EADSDatabaseError )
          then sCode:=#13+' Код ошибки ['+IntToStr(( E as EADSDatabaseError ).ACEErrorCode)+']'
          else sCode:='';
        if Pos('7078', E.Message) > 0 then begin
          strErr := ' Неверное имя пользователя или пароль. '+sCode;
        end else if (Pos('5004', E.Message) > 0) and AdsConnection.IsDictionaryConn then begin
          strErr := ' На найден словарь базы данных. '+sCode;
        end else if Pos('6420', E.Message) > 0 then begin
          strErr := ' Ошибка подключения к серверу базы данных. '+sCode;
        end else begin
          strErr := E.Message+sCode;
        end;
      end;
    end;
  end;
  if FLastDatabaseError <> 0 then begin
    Result := false;
  end;
end;
//-----------------------------------------------------------------------------------
procedure TdmTask.SimpleDisconnect;
begin
  if AdsConnection.IsConnected then
    AdsConnection.CloseCachedTables;
    AdsConnection.IsConnected := false;
  if AdsSharedConnection.IsConnected then
    AdsSharedConnection.CloseCachedTables;
    AdsSharedConnection.IsConnected := false;
end;
//---------------------------------------------------------------
function TdmTask.ChoiceConnect(var strNewPathData   : String;
                               var strNewPathShared : String;
                               var nConnect : Integer) : Boolean;
var
  s1,s2 : String;
  i : Integer;
begin
  Result := false;
  {$IFNDEF UPDATEPROG}
  s1:='';
  s2:='';
  for i:=0 to CountConnects-1 do begin
    s1 := s1 + GetNameConnect(i)+';';
    s2 := s2 + IntToStr(i)+';';
  end;
  s2 := s2+'/'+s1;
  s1 := CreateChoice( 'Выберите базу', s2);
  if s1<>'' then begin
    i := StrToInt(s1);
    nConnect := i;
    strNewPathData    := GetPathConnect(i);
    strNewPathShared  := GetPathSharedConnect(i);
    Result := true;
  end;
  {$ENDIF}
end;
//--------------------------------------------------------------------------
function TdmTask.OpenConnect(var strErr : String) : Boolean;
var
  lExit  : Boolean;
  strDir : String;
  strNewPathData,strNewPathShared : String;
  nConnect : Integer;
begin
  Result := false;
  SimpleDisconnect;

  AdsConnection.AdsServerTypes := GlobalPar.ServerTypes;
  AdsSharedConnection.AdsServerTypes := GlobalPar.ServerTypes;

  AdsConnection.CommunicationType := GlobalPar.CommunicationType;
  AdsSharedConnection.CommunicationType := GlobalPar.CommunicationType;

  AdsConnection.ConnectPath := GlobalPar.ConnectPath;
  AdsSharedConnection.ConnectPath := GlobalPar.SharedConnectPath;

  if AdsConnection.IsDictionaryConn then begin
    if Right(AdsConnection.ConnectPath,1)='\' then begin
      AdsConnection.ConnectPath:=Copy(AdsConnection.ConnectPath,1,
                       Length(AdsConnection.ConnectPath)-1);
    end;
    if Right(AdsSharedConnection.ConnectPath,1)='\' then begin
      AdsSharedConnection.ConnectPath:=Copy(AdsSharedConnection.ConnectPath,1,
                       Length(AdsSharedConnection.ConnectPath)-1);
    end;
  end;
  if FFirstConnect then begin
    if FDefaultUser <> '' then begin
      AdsConnection.UserName := FDefaultUser;
    end;
    if FDefaultPassword <> '' then begin
      AdsConnection.Password := FDefaultPassword;
    end;
    FFirstConnect := false;
  end;
  if FCheckNewUser then begin
    AdsConnection.UserName := FCheckUser;
    AdsConnection.Password := FCheckPassword;
  end;
  lExit := false;
  strDir := '';
  nConnect := -1;
{
  s:='';
  if stADS_REMOTE in AdsConnection.AdsServerTypes then begin
    s:=s+' REMOTE ';
  end;
  if stADS_LOCAL in AdsConnection.AdsServerTypes then begin
    s:=s+' LOCAL ';
  end;
  showmessage(s);
}
  while not lExit do begin
    Result:=SimpleConnect(strErr);
    if Result then begin
      // проверим доступен ли каталог для подключения, если подключаемся не к словарю
      if not AdsConnection.IsDictionaryConn then begin
        if not DirectoryExists(AdsConnection.ConnectPath) then begin
          strErr := 'Путь подключения к базе не найден !'+#13+
                       AdsConnection.ConnectPath;
          Result := false;
        end;
      end;
      lExit := true;
    end else begin
      if LastDatabaseError = -1 then begin // не каталог базы
        if CountConnects > 1 then begin
          PutError( 'Путь подключения к базе не найден !'+#13+AdsConnection.ConnectPath);
          if ChoiceConnect(strNewPathData, strNewPathShared, nConnect) then begin
            GlobalPar.RelConnectPath       := strNewPathData;
            GlobalPar.RelSharedConnectPath := strNewPathShared;
            GlobalPar.ConnectPath          := CheckSleshN(CheckSimPath(strNewPathData));
            GlobalPar.SharedConnectPath    := CheckSleshN(CheckSimPath(strNewPathShared));
            AdsConnection.ConnectPath := GlobalPar.ConnectPath;
            AdsSharedConnection.ConnectPath := GlobalPar.SharedConnectPath;
            if AdsConnection.IsDictionaryConn then begin
              if Right(AdsConnection.ConnectPath,1)='\' then begin
                AdsConnection.ConnectPath:=Copy(AdsConnection.ConnectPath,1,
                                 Length(AdsConnection.ConnectPath)-1);
              end;
              if Right(AdsSharedConnection.ConnectPath,1)='\' then begin
                AdsSharedConnection.ConnectPath:=Copy(AdsSharedConnection.ConnectPath,1,
                                 Length(AdsSharedConnection.ConnectPath)-1);
              end;
            end;
          end else begin
            strErr := 'Не выбрана ни одна база.';
            lExit := true;
          end;
        end else begin
          strErr := 'База по пути: <'+AdsConnection.ConnectPath+'> не найдена.';
          lExit  := true;
        end;
      end else begin
        if LastDatabaseError <> 0 then begin
          if not ProcessDatabaseError then begin
            lExit := true;
          end else begin

          end;
        end;
      end;
    end;
  end;
  if Result then begin
    if nConnect > -1 then begin
      NameConnect := GetNameConnect(nConnect);
    end;
    UserID := AdsConnection.UserName;
  end;
end;

//-----------------------------------------------------------------------------
function TdmTask.FullOpen(strNewPathData, strNewPathShared : String; lReloadPar : Boolean) : Boolean;
var
  strErr : String;
begin
  CloseCheck;
  ClearAllLists;
  if strNewPathData = '' then begin
    if lReloadPar then begin
      ReadGlobalPar(PathForSysParams);
      ReadParamsAllTables;
    end;
  end else begin
    GlobalPar.RelConnectPath       := strNewPathData;
    GlobalPar.ConnectPath          := RelPath2Path(strNewPathData);
    GlobalPar.RelSharedConnectPath := strNewPathShared;
    GlobalPar.SharedConnectPath    := RelPath2Path(strNewPathShared);
  end;

  CountTables := CalcCountTables;

  Result := OpenConnect(strErr);

  if not Result then begin
    Beep;
    PutError(strErr);
    exit;
  end;

  if Assigned(FOnBeforeOpen) then begin
    FOnBeforeOpen(Self);
  end;
  if Result then begin
    if not GlobalPar.OnlyOpen and not AdsConnection.IsDictionaryConn then begin
      if ErrorCheck and GlobalPar.AutoReindex then begin
        if Problem(' Предыдущий сеанс был завершен аварийно. '#13' Пересоздадим сортировки ?') then begin
          DropAllIndexFiles;
        end;
      end else begin
        if not OpenCheck then Result := false;;
      end;
      if Result then begin
        Result := CheckAllTables;
      end;
    end;
  end;
  if Result then begin
    Result := OpenAllTables;
  end;

  if not Result and lCheckErrorOpen then begin
    //Result := false;
  end else begin
    Application.ProcessMessages;
    OpenAllQuery;
    //------------------------------------------------------
    if not AdsConnection.IsDictionaryConn then begin
      if UpperCase(GlobalPar.ConnectPath) = UpperCase(CheckSleshN(ExtractFilePath(Application.ExeName)+'Data')) then begin
        IniSysParams.WriteString('PATH','CONNECT','');
      end else begin
        IniSysParams.WriteString('PATH','CONNECT',GlobalPar.RelConnectPath);
      end;
      if UpperCase(GlobalPar.SharedConnectPath) = UpperCase(CheckSleshN(ExtractFilePath(Application.ExeName)+'Spr')) then begin
        IniSysParams.WriteString('PATH','SHARED_CONNECT','');
      end else begin
        IniSysParams.WriteString('PATH','SHARED_CONNECT',GlobalPar.RelSharedConnectPath);
      end;
    end else begin
      IniSysParams.WriteString('PATH','CONNECT',GlobalPar.RelConnectPath);
      IniSysParams.WriteString('PATH','SHARED_CONNECT',GlobalPar.RelSharedConnectPath);
    end;
  end;
  CloseCheck;

  if Result and Assigned(FOnAfterOpen) then begin
    FOnAfterOpen(Self);
  end;
end;

//---- определение компьютер с базой или сетевой--------------
procedure TdmTask.SetMainComp;
var
  cDrive : String;
  iMainComp : Integer;
begin
  iMainComp := FIniSysParams.ReadInteger('ADMIN','MAINCOMP',-1);
  FMainComp := true;
  if iMainComp = -1 then begin
    cDrive := Copy(GlobalPar.ConnectPath,1,1);
    if (GetDriveType(PChar(cDrive + ':/'))=DRIVE_REMOTE) or
       (Pos('\\',GlobalPar.ConnectPath) > 0) then begin
      FMainComp := false;
    end else begin
      FMainComp := true;
    end;
  end else begin
    if iMainComp = 0 then begin
      FMainComp := false;
    end else begin
      FMainComp := true;
    end;
  end;
  if not FMainComp then begin
    GlobalPar.OnlyOpen:=true;    // спорный вопрос, но пока пусть будет
  end;
end;

procedure TdmTask.DropAllIndexFiles;
var
  i : integer;
begin
  if AdsConnection.IsDictionaryConn then Exit;
  for i:=0 to ComponentCount-1 do begin
    if Components[i] is TAdsTable then begin
      if Length(TAdsTable(Components[i]).TableName) > 0 then begin
        DropIndexFile( TAdsTable(Components[i]) )
      end;
    end;
  end;
end;

procedure TdmTask.DropIndexFile(Table: TAdsTable);
var
  cNameIndex : String;
begin
  if AdsConnection.IsDictionaryConn then Exit;
  if Table.Active then begin
    Table.Close;
  end;
  cNameIndex := GetFullNameIndexFile(Table);
  if FileExists(cNameIndex) then begin
    try
      DeleteFile(cNameIndex);
    finally
    end;
  end;
end;

function TdmTask.GetNameType(AdsType: TAdsFieldTypes): String;
var
  i : Integer;
//  lOk : Boolean;
begin
//  lOk := false;
  Result := '';
  for i:=Low(ArrSootv) to High(ArrSootv) do begin
    if ArrSootv[i].Ads = AdsType then begin
      Result := ArrSootv[i].Name;
//      lOk := true;
      break;
    end;
  end;
end;

function TdmTask.GetAdsType(cType: String): TAdsFieldTypes;
var
  i : Integer;
  lOk : Boolean;
begin
  cType := ANSIUpperCase(Trim(cType));
  lOk := false;
  Result := ArrSootv[Low(ArrSootv)].Ads;
  for i:=Low(ArrSootv) to High(ArrSootv) do begin
    if ANSIUpperCase(Trim(ArrSootv[i].Name)) = cType then begin
      Result := ArrSootv[i].Ads;
      lOk := true;
      break;
    end;
  end;
  if not lOk then begin
    PutError(' Не найдено соответствие для типа: <'+cType+'> ');
  end;
end;

function TdmTask.GetFullNameType(cType: String): String;
begin
  cType := ANSIUpperCase(Trim(cType));
  if (cType='C') or (Copy(cType,1,2)='CH') then begin
    Result := 'Character';
  end else if ( Copy(cType,1,2)='CI' ) then begin
    Result := 'CICharacter';
  end else if (cType='N') or (Copy(cType,1,2) = 'NU') then begin
    Result := 'Numeric';
  end else if (cType='D') or (Copy(cType,1,2) = 'DA') then begin
    Result := 'Date';
  end else if (cType='L') or (Copy(cType,1,5) = 'LOGIC') then begin
    Result := 'Logical';
  end else if (cType = 'M') or (cType='MEMO') then begin
    Result := 'Memo';
  end else if Copy(cType,1,3) = 'INT' then begin
    Result := 'Integer';
  end else if Copy(cType,1,2) = 'SH' then begin
    Result := 'ShortInt' //Integer';
  end else if Copy(cType,1,2) = 'TI' then begin
    Result := 'Time';
  end else if Copy(cType,1,1) = 'A' then begin
    Result := 'AutoInc';
  end else if Copy(cType,1,1) = 'V' then begin
    Result := 'VarChar';
  end else if Copy(cType,1,1) = 'R' then begin
    Result := 'Raw';
  end else if (Copy(cType,1,2) = 'DO') or (Copy(cType,1,2) = 'FL') then begin
    Result := 'Double';
  end else if Copy(cType,1,2) = 'CU' then begin
    Result := 'CurDouble';
  end else if Copy(cType,1,2) = 'MO' then begin
    Result := 'Money';
  end else if Copy(cType,1,2) = 'IM' then begin
    Result := 'Image';
  end else if Copy(cType,1,2) = 'BI' then begin
    Result := 'Binary';
  end else begin
//    PutError(' Тип: <'+cType+'> не поддерживается. ');
    Result := cType;
  end;
end;

function TdmTask.GetFullNameIndexFile(Table: TAdsTable): String;
var
  cExt, cName : String;
  i : integer;
begin
  if Table.TableType = ttAdsCDX then begin
    cExt := 'CDX';
  end else if Table.TableType = ttAdsNTX then begin
    cExt := 'NTX';
  end else if Table.TableType = ttAdsVFP then begin
    cExt := 'VFP';
  end else if Table.TableType = ttAdsADT then begin
    cExt := 'ADI';
  end;
  i := Pos('.', Table.TableName);
  if i > 0 then begin
    cName := Copy(Table.TableName, 1, i-1);
  end else begin
    cName := Table.TableName;
  end;
  Result := Table.AdsConnection.ConnectPath + cName + '.' + cExt;
end;


function TdmTask.GetMetaIndexTable(Table: TAdsTable): TStringList;
var
  c,s,cSection,cContSect : String;
  i, j, n  : Integer;
  ListIndex : TStringList;
  StruIndex : PStruIndex;
  lError : Boolean;
  aStr : TArrStrings;
  vResult : Variant;
begin
  ListIndex  := TStringList.Create;
  cSection := GetNameForIni(Table)+'->INDEX';
  FIniStru.ReadSectionValues(cSection, ListIndex);
  // если ссылка на другую таблицу
  if ListIndex.Count>0 then begin
    if Copy(ListIndex.Strings[0],1,1) = '&' then begin
      cSection := GetNameSectionTable(Copy(ListIndex.Strings[0],2,100))+'->INDEX';
      ListIndex.Clear;
      FIniStru.ReadSectionValues(cSection, ListIndex);
    end;
  end else begin
    // если секция для индекса не найдена попробуем через скрипт
    {$IFDEF USE_SCRIPT}
      if GlobalTask.Script<>nil then begin
        vResult := null;
        GlobalTask.Script.RunEx('SectionTableIndex',[cSection],vResult);
        if (vResult<>null) and (VarToStr(vResult)<>'') then begin
          cSection := VarToStr(vResult);
          ListIndex.Clear;
          FIniStru.ReadSectionValues(cSection, ListIndex);
        end;
      end;
    {$ENDIF}
  end;
  Result := TStringList.Create;
  for j:=0 to ListIndex.Count-1 do begin
    s := Trim(ListIndex.Names[j]);
    if (Length(s) > 0) and (Copy(s,1,2)<>'//') then begin
      New(StruIndex);
      StruIndex^.Tag := UpperCase(Trim(ListIndex.Names[j]));
      StruIndex^.Options  := [];
      StruIndex^.strKey   := '';
      StruIndex^.strCond  := '';
      StruIndex^.strWhile := '';
      StruIndex^.Komm     := '';
      StruIndex^.Contains := false;
      s := Trim(ListIndex.Values[ListIndex.Names[j]]);
      if Copy(s,1,1)='&' then begin
        StruIndex^.Tip := 1;   // индекс по расширению
        s := Copy(s,2,Length(s));
      end else begin
        StruIndex^.Tip := 0;
        if (Pos('+',s)>0) or (Pos('(',s)>0) then begin
          StruIndex^.Tip := 1;   // индекс по расширению
        end;
      end;
//      StruIndex^.Tip := 1;   // индекс по расширению
      i := Pos('//', s);
      if i > 0 then begin
        StruIndex^.Komm := Copy(s,i+2,Length(s));
        s := Copy(s,1,i-1);
      end;
      SetLength(aStr,0);
      aStr := StrToArr(s,'/');
      if Length(aStr)>0 then begin
        for i:=0 to Length(aStr)-1 do begin
          c := Trim(aStr[i]);
          if Length(c) > 0 then begin
            case i of
              0 : StruIndex^.strKey   := Trim(c);
            else
              begin
                n := Pos('=',c);
                if ((Copy(Trim(c),1,4)='COND') or (Copy(Trim(c),1,3)='FOR')) and (n>0) then begin
                  StruIndex^.strCond := Trim(Copy(c,n+1,Length(c)));
                end else if (Copy(Trim(c),1,2)='WH') and (n>0) then begin
                  StruIndex^.strWhile := Trim(Copy(c,n+1,Length(c)));
                end else if Copy(Trim(c),1,4)='DESC' then begin
                  StruIndex^.Options := StruIndex^.Options + [ixDescending];
                end else if Copy(Trim(c),1,6)='UNIQUE' then begin
                  StruIndex^.Options := StruIndex^.Options + [ixUnique];
                end else if Copy(Trim(c),1,4)='CONT' then begin
                  StruIndex^.Contains := true;
                  // ссылка на секцию с описанием опций индекса по словам
                  if n > 0 then begin
                    cContSect := Trim(Copy(c,n,50));
                  end else begin
                    cContSect := 'FTS_OPTIONS';
                  end;
                  StruIndex^.NoiseWords:= FIniStru.ReadString( cContSect, 'NOISEWORDS','');
                  StruIndex^.MinWord   := FIniStru.ReadString( cContSect, 'MINWORD','');
                  StruIndex^.MaxWord   := FIniStru.ReadString( cContSect, 'MAXWORD','');
                  StruIndex^.DropCharacters := FIniStru.ReadString( cContSect, 'DROPCHARACTERS','');
                  StruIndex^.Delimiters := FIniStru.ReadString( cContSect, 'DELIMITERS','')
                    // дописать потом
                end
              end;
            end;
          end;
        end
      end else begin
        //
      end;
      Result.AddObject(StruIndex^.Tag, TObject(StruIndex));
    end;
  end;
  ListIndex.Free;
  // контроль качества
  lError := false;
  for i:=0 to Result.Count-1 do begin
    StruIndex := PStruIndex(Result.Objects[i]);
    if (Length(StruIndex^.strKey)=0) then begin
      lError := true;
      break;
     end;
  end;
  if lError then begin
    ClearMetaIndexTable(Result);
    Result := nil;
  end;
end;

function TdmTask.GetMetaStruField(Table: TAdsTable; FieldName: String): TStruField;
begin
  ShowMessage('функция GetMetaStruField не работает');
end;

function TdmTask.IsReadOnlyTable( strName : String) : Boolean;
var
  i,j : Integer;
  s : String;
begin
  strName := ANSIUpperCase(Trim(strName));
  j:=Pos('.',strName);
  if j>0 then strName:=Copy(strName,1,j-1);
  Result := false;
  for i:=0 to FListReadOnly.Count-1 do begin
    s := ANSIUpperCase(Trim(FListReadOnly.Strings[i]));
    j:=Pos('\\',s);
    if j>0 then s:=Copy(s,1,j-1);
    if s<>'' then begin
      if strName = s then begin
        Result:=true;
        exit;
      end;
    end;
  end;
end;

function TdmTask.ReadParamsAllTables: Boolean;
var
  i : integer;
  l : Boolean;
  Table : TAdsTable;
begin
  Result := true;
  FIniStru.ReadSectionValues('READONLY', FListReadOnly);
  try
    for i:=0 to ComponentCount-1 do begin
      if Components[i] is TAdsTable then begin
        Table := TAdstable(Components[i]);
        if Length(Table.TableName)>0 then begin
          l := ReadParamsTable(TAdstable(Components[i]));
          if not l and Result then Result:=false;  // ошибка открытия
        end;
      end;
    end;
  except
    Result := false;
  end;
end;

// установить коннект, тип таблицы, кодирокку
function TdmTask.ReadParamsTable(Table: TAdsTable) : Boolean;
var
  s, c, cSection : String;
  i : Integer;
  List : TStringList;
  lReadTypeConnect : Boolean;
begin
  if not AdsConnection.IsDictionaryConn then begin
    SetDefaultParam(Table);
    lReadTypeConnect:=false;
    Table.Tag := 99; //TASK_CONNECT;   // по умолчанию коннект для одной задачи
    List := TStringList.Create;
    cSection := GetNameSectionTable(Table);
    FIniStru.ReadSectionValues(cSection+'->PARAM', List);
    if IsReadOnlyTable(Table.TableName)
      then Table.ReadOnly:=true;
    for i:=0 to List.Count-1 do begin
      s:=UpperCase(Trim(List.Names[i]));
      c:=UpperCase(Trim(List.Values[List.Names[i]]));
      if (s='CONNECT') then begin
        if (Copy(c,1,2)='SH') then begin // общий коннект
          Table.Tag := MULTI_CONNECT;
        end else begin
          Table.Tag := TASK_CONNECT;
        end;
        lReadTypeConnect:=true;
      end else if (s='TYPE_FILE') then begin         // TYPE_FILE
        SetTableType(Table, c);
      end else if (s='CHAR_SET') then begin          // CHAR_SET
        SetTableCharSet(Table, c);
      end else if (Copy(s,1,4)='READ') then begin    // READ_ONLY
        if (Copy(c,1,1)='T') or (Copy(c,1,1)='Y') then begin
          Table.ReadOnly := true;
        end else begin
          Table.ReadOnly := false;
        end;
      end else if (Copy(s,1,2)='EX') then begin      // EXLUSIVE
        if (Copy(c,1,1)='T') or (Copy(c,1,1)='Y') then begin
          Table.Exclusive := true;
        end else begin
          Table.Exclusive := false;
        end;
      end;
    end;
    i := Pos('.', Table.TableName);
    if Table.TableType = ttAdsADT then begin
      if i>0 then begin
        Table.TableName := Copy(Table.TableName,1,i) + 'ADT';
      end else begin
        Table.TableName := Table.TableName + '.ADT';
      end;
    end else begin
      if i>0 then begin
        Table.TableName := Copy(Table.TableName,1,i) + 'DBF';
      end else begin
        Table.TableName := Table.TableName + '.DBF';
      end;
    end;
    if lReadTypeConnect then begin
      if Table.Tag = TASK_CONNECT then begin
        Table.DataBaseName := AdsConnection.Name;
      end else begin
        Table.DataBaseName := AdsSharedConnection.Name;
      end;
    end else begin
      if Table.DataBaseName=''
        then Table.DataBaseName := AdsConnection.Name;
    end;
  end;
  Result := true;
end;

// прочитать описание полей таблицы
function TdmTask.GetMetaStruTable(Table: TAdsTable; sSection:String): TStringList;
var
  s, c : String;
  i, n, j, n1, n2 : Integer;
  ListField  : TStringList;
  ListDefine : TStringList;
  StruField : PStruField;
  lError : Boolean;
{$IFDEF USE_SCRIPT}
  vResult : Variant;
{$ENDIF}
begin
  // прочитаем DEFINE
  ListDefine := TStringList.Create;
  FIniStru.ReadSectionValues('DEFINE', ListDefine);

  ListField  := TStringList.Create;
  if sSection=''
    then sSection := GetNameSectionTable( Table );

  FIniStru.ReadSectionValues(sSection, ListField);
  if ListField.Count>0 then begin
    // если ссылка на другую таблицу
    if Copy(ListField.Strings[0],1,1) = '&' then begin
      sSection := GetNameSectionTable(Copy(ListField.Strings[0],2,100));
      ListField.Clear;
      FIniStru.ReadSectionValues(sSection, ListField);
    end;
  end else begin
    // если секция для таблицы не найдена попробуем через скрипт
    {$IFDEF USE_SCRIPT}
      if GlobalTask.Script<>nil then begin
        vResult := null;
        GlobalTask.Script.RunEx('SectionTableStru',[sSection],vResult);
        if (vResult<>null) and (VarToStr(vResult)<>'') then begin
          sSection := VarToStr(vResult);
          ListField.Clear;
          FIniStru.ReadSectionValues(sSection, ListField);
        end;
      end;
    {$ENDIF}
  end;
  Result := TStringList.Create;
  for j:=0 to ListField.Count-1 do begin
    s := Trim(ListField.Names[j]);
    if (Length(s) > 0) and (Copy(s,1,2)<>'//') then begin
      New(StruField);
      StruField^.Name := UpperCase(Trim(ListField.Names[j]));
      StruField^.Tip  := 'Character';
      StruField^.KTip := 'C';
      StruField^.Len  := 10;
      StruField^.Toch := 0;
      StruField^.Komm := '';
      StruField^.Format:= '';
      s := ListField.Values[ListField.Names[j]];
      n := 0;
      if Length(s)>0 then begin
        //------- может быть значение описано через DEFINE ----------
        n1 := Pos('[',s);
        if n1>0 then begin
          n2 := Pos(']',s);
          if n2 > 0 then begin
            c := Trim(Copy(s,n1+1,n2-n1-1));
            for i:=0 to ListDefine.Count-1 do begin
              if Pos(c,ListDefine.Names[i]) > 0 then begin
                s := ListDefine.Values[ListDefine.Names[i]];
                break;
              end;
            end;
          end;
        end;
        i:= Pos('//', s);
        if i > 0 then begin
          StruField^.Komm := Copy(s,i+2,Length(s));
          s:=Copy(s,1,i-1);
        end;
        //------------------------------------------------------------
        while (Length(s) > 0) and (n<4) do begin
          i := Pos(',', s);
          if i > 0 then begin
            c := Copy(s,1,i-1);
            s := Copy(s,i+1,Length(s));
          end else begin
            c := s;
            s := ''
          end;
          Inc(n);
          if Length(c)=0 then c:='0';
          case n of
            1 : begin
                  StruField^.Tip  := GetFullNameType(c);
                  StruField^.KTip := Trim(c);
                end;
            2 : StruField^.Len  := StrToInt(Trim(c));
            3 : StruField^.Toch := StrToInt(Trim(c));
            4 : StruField^.Format := Trim(c);
          end;
        end;
        if Table.TableType = ttAdsADT then begin
          if StruField^.KTip = 'N' then begin
            //----- ShortInteger
            if (StruField^.Len < 5) and (StruField^.Toch=0) then begin
              StruField^.KTip:='SH';
              StruField^.Len := 2;
              StruField^.Tip  := GetFullNameType(StruField^.KTip);
            //----- Integer
            end else if (StruField^.Len < 9) and (StruField^.Toch=0) then begin
              StruField^.KTip:='INT';
              StruField^.Len := 4;
              StruField^.Tip  := GetFullNameType(StruField^.KTip);
            //----- Double
            end else begin
              StruField^.KTip:='DO';
              StruField^.Len := 8;
              StruField^.Tip  := GetFullNameType(StruField^.KTip);
            end;
          end else if StruField^.Tip = 'AutoInc' then begin
            StruField^.KTip:='A';
            StruField^.Len := 4;
          end else if StruField^.Tip = 'Integer' then begin
            StruField^.KTip:='INT';
            StruField^.Len := 4;
          end else if StruField^.Tip = 'ShortInt' then begin
            StruField^.KTip:='SH';
            StruField^.Len := 2;
          end else if StruField^.Tip = 'Double' then begin
            StruField^.KTip:='DO';
            StruField^.Len := 8;
          end;
        end;
        StruField.AdsTip := GetAdsType(StruField.Tip);
      end else begin
        // ошибка
      end;
      Result.AddObject(StruField^.Name, TObject(StruField));
    end;
  end;
  ListField.Free;
  ListDefine.Free;
  // контроль качества
  lError := false;
  for i:=0 to Result.Count-1 do begin
    StruField := PStruField(Result.Objects[i]);
    if (StruField.Len=0) or (Length(StruField.Tip)=0) then begin
      lError := true;
      break;
     end;
  end;
  if lError then begin
    ClearMetaStruTable(Result);
    Result := nil;
  end;
end;

function TdmTask.GetNameSectionTable(Table: TAdsTable): String;
begin
  Result := GetNameSectionTable(Table.TableName)
end;

function TdmTask.GetNameSectionTable(TableName : String): String;
var
  i : Integer;
begin
  Result := UpperCase(TableName);
  i := Pos('.',Result);
  if i>0 then begin
    Result := Copy(Result,1,i)+'DBF';
  end else begin
    Result := Result+'.DBF';
  end;
end;

function TdmTask.GetNewIden(Table: TAdsTable; NameField, NameSort: String): Integer;
var
  SavePlace : TBookMark;
  CurIndex  : String;
  oldMasterSource : TDataSource;
  oldMasterFields  : String;
begin
  Table.DisableControls;
  oldMasterSource := nil;
  if Table.MasterSource <> nil then begin
    oldMasterSource := Table.MasterSource;
    oldMasterFields := Table.MasterFields;
    Table.MasterSource:=nil;
    Table.First;
  end;
  if Table.IsEmpty then begin
    Result := 1;
  end else begin
    SavePlace := Table.GetBookmark;
    CurIndex  := Table.IndexName;
    Table.IndexName := NameSort;
    Table.Last;
    Result := Table.FieldByName(NameField).AsInteger + 1;
    Table.IndexName := CurIndex;
    Table.GotoBookmark( SavePlace );
  end;
  if oldMasterSource <> nil then begin
    Table.MasterSource:=oldMasterSource;
    Table.MasterFields:=oldMasterFields;
  end;
  Table.EnableControls;
end;

function TdmTask.GetPropertyAds: TPropertyAds;
begin
  Result.DatabaseName := AdsConnection.Name;
  Result.SharedDataBaseName := AdsSharedConnection.Name;
  Result.Connection := AdsConnection;
  Result.SharedConnection := AdsSharedConnection;
  Result.AdsCharType := GlobalPar.CharType;
  Result.TableType   := GlobalPar.TableType;
end;

//-------------------------------------------------------
function TdmTask.GetStruField(Table     : TAdsTable;
                              FieldName : String) : TStruField;
begin
  Result.Name    := PChar(FieldName);
  Result.AdsTip  := Table.AdsGetFieldType(FieldName);
  Result.Tip     := GetNameType(Result.AdsTip);
  Result.Len     := Table.AdsGetFieldLength(FieldName);
  Result.Toch    := Table.AdsGetFieldDecimals(FieldName);
end;

//-------------------------------------------------------
function TdmTask.GetStruField(Table     : TAdsTable;
                              FieldNum  : Integer) : TStruField;
var
  FieldName : String;
begin
  FieldName := Table.AdsGetFieldName(FieldNum);
  Result.Name    := PChar(FieldName);
  Result.AdsTip  := Table.AdsGetFieldType(FieldName);
  Result.Tip     := GetNameType(Result.AdsTip);
  Result.Len     := Table.AdsGetFieldLength(FieldName);
  Result.Toch    := Table.AdsGetFieldDecimals(FieldName);
end;

function TdmTask.LockBase : Boolean;
begin
// потом дописать
 Result := true;
 if GlobalPar.OnlyOpen then begin
   Result := false;
 end;
end;
//----------------------------------------------------------
procedure TdmTask.UnLockBase;
begin
// потом дописать
end;

procedure TdmTask.OpenBaseParam;
begin
  if FUseBaseParam then begin

  end;
end;

procedure TdmTask.CloseBaseParam;
begin
  if FUseBaseParam then begin

  end;
end;

//----------------------------------------------------------
function TdmTask.GetCommentTable(strName:String; IsEmptyToName:Boolean):String;
var
  n : integer;
begin
  Result:='';
  if AdsConnection.IsDictionaryConn then begin
    WorkQuery.SQL.Text:='SELECT Comment FROM '+SysQuery('system.tables')+' WHERE name='+QStr(strName);
    WorkQuery.Open;
    if WorkQuery.Eof then begin
      WorkQuery.Close;                                          
      WorkQuery.AdsConnection:=AdsSharedConnection;
//      WorkQuery.DatabaseName:='AdsSharedConnection';
      WorkQuery.SQL.Text:='SELECT Comment FROM '+SysQuery('system.tables')+' WHERE name='+QStr(strName);
      WorkQuery.Open;
      if WorkQuery.Eof then begin
        if IsEmptyToName
          then Result:=FirstCharUpper(strName);
      end else begin
        Result:=WorkQuery.Fields[0].AsString;
      end;
    end else begin
      Result:=WorkQuery.Fields[0].AsString;
    end;
    n:=Pos('//',Result);
    if n>0  then Result:=Copy(Result,1,n-1);
    n:=Pos('.',Result);
    if n>0  then Result:=Copy(Result,n+1,Length(Result));
    WorkQuery.Close;
    WorkQuery.AdsConnection:=AdsConnection;
//    WorkQuery.DataBaseName:='AdsConnection';
  end;
end;
//--------------------------------------------------------------------------------
function TdmTask.OpenAllTables: Boolean;
var
  i,j,n,m : integer;
  l : Boolean;
  Table : TAdsTable;
  strErr, strName, strOpenName, strComment : String;
begin
  Result := SimpleConnect(strErr);
  j:=0;          
  {$IFNDEF DEBUG}
    CreateProgress('Открытие таблиц базы','',CountTables,nLeftProgress,nTopProgress);
  {$ENDIF}
  try
  FListErrorOpen.Clear;
  if FListOpenTables.Count > 0 then begin
    for m:=0 to FListOpenTables.Count-1 do begin
      strOpenName := ANSIUpperCase(FListOpenTables.Strings[m]);
      n := Pos('.',strOpenName);
      if n>0 then strOpenName := Copy(strOpenName,1,n-1);
      for i:=0 to ComponentCount-1 do begin
        //showmessage(components[i].name);
        l:=true;
        if Components[i] is TAdsTable then begin
          Table := TAdsTable(Components[i]);
          if Length(Table.TableName)>0 then begin
            Inc(j);
            strName := ANSIUpperCase(Table.TableName);
            n := Pos('.',strName);
            if n>0 then strName := Copy(strName, 1, n-1);
            if strName = strOpenName then begin
              {$IFNDEF DEBUG}
                ChangeProgress(j,LowerCase(Table.TableName));
              {$ENDIF}
              l := OpenOneTable(TAdstable(Components[i]));
              if not l and Result then Result:=false;  // ошибка открытия
            end;
          end;
        end;
      end;
      if not Result then break;
    end;
  end else begin
    for i:=0 to ComponentCount-1 do begin
      //showmessage(components[i].name);
      l:=true;
      if Components[i] is TAdsTable then begin
        Table := TAdstable(Components[i]);
        if Length(Table.TableName)>0 then begin
//          if Assigned(FOnBeforeOpenTAble) then begin
//            FOnBeforeOpenTable(Self);
//          end;
          Inc(j);
          {$IFNDEF DEBUG}
            strComment:=getCommentTable(Table.TableName, true);
            if strComment='' then begin
              strComment:=FirstCharUpper(Table.TableName);
            end;
            ChangeProgress(j,strComment);
          {$ENDIF}
          l := OpenOneTable(TAdstable(Components[i]));
          if not l and Result then Result:=false;  // ошибка открытия
        end;
      end;
      if not l then begin
//      n := QuestionPos(' Сохранить документ ? ',
//        'Да;Нет; Продолжить ;','',-1,-1,qtConfirmation, Self);
        if Problem(' Продолжить открытие базы ? ') then begin

        end else begin
          break;
        end;
      end;
    end;
  end;
  if FListErrorOpen.Count > 0 then begin
    strErr:='';
    for i:=0 to FListErrorOpen.Count-1 do begin
      strErr:=FListErrorOpen.Strings[i]+#13#10;
    end;
    MemoWrite(NameFromExe('open_error'),strErr);
  end else begin
    DeleteFile(NameFromExe('open_error'));
  end;
  OpenBaseParam;
  finally
    {$IFNDEF DEBUG}
      CloseProgress;
    {$ENDIF}
  end;
end;

function TdmTask.ErrorCheck: Boolean;
begin
  if AdsConnection.IsDictionaryConn then begin
    Result := true;
    Exit;
  end;
  if FileExists(CheckSleshN(AdsConnection.ConnectPath)+'check') then begin
    Result := true;
  end else begin
    Result := false;
  end;
end;

function TdmTask.OpenCheck : Boolean;
var
  lExit : Boolean;
begin
  FDiskCheck:=-1;
  Result := true;
  if AdsConnection.IsDictionaryConn then exit;
  lExit  := false;
  while not lExit do begin
    FDiskCheck := FileCreate(CheckSleshN(AdsConnection.ConnectPath)+'check');
    if FDiskCheck = -1 then begin
      if not Problem('  База занята другим пользователем. Повторить ? ') then begin
        lExit := true;
        Result := false;
      end;
    end else begin
      lExit:=true;
    end;
  end;
//  disc := FileCreate(NameFromExe('check'));
end;

procedure TdmTask.CloseCheck;
begin
  if AdsConnection.IsDictionaryConn then Exit;
  if FDiskCheck > -1 then begin
    FileClose(FDiskCheck);
  end;
  FDiskCheck:=-1;
end;

procedure TdmTask.DeleteCheck;
begin
  if AdsConnection.IsDictionaryConn then Exit;
  CloseCheck;
  DeleteFile(CheckSleshN(AdsConnection.ConnectPath)+'check');
end;

function TdmTask.OpenOneTable(Table: TAdsTable): Boolean;
var
  lErr : Boolean;
  nCountRun : Integer;
  strErr : String;
begin
  lErr := false;
  Result := true;
  if (Length(Table.TableName) > 0) and (Copy(Table.TableName,1,1)<>'#') then begin
    try
      if Table.Exists then begin
        if not Table.Active then begin
          if AdsConnection.IsDictionaryConn then begin
            nCountRun := 0;
            while nCountRun<2 do begin
              try
                Table.Active:=true;
                Result:=true;
                nCountRun:=2;
              except
                on E : EADSDatabaseError do begin
                  FLastDatabaseError:=( E as EADSDatabaseError ).ACEErrorCode;
                  strErr:=GetStrErrAds(FLastDatabaseError);
                  if strErr='' then strErr:=E.Message;
                  strErr:='['+IntToStr(FLastDatabaseError)+'] '+strErr;

                  {
                  n:=Question(Table.TableName+': '+strErr,
                   ' Продолжить ; Удалить таблицу ', 'Ошибка открытия таблицы', 0, 0, qtError, 0);
                  ShowMessage(inttostr(n));
                  }


//                  Result    := false;
//                  case EADSDatabaseError(E).ACEErrorCode of
//                    7108 : begin
//                             Inc(nCountRun,1);
//                             DeleteFile(
//                           end;
//                  else
                    Result    := false;
                    nCountRun := 2;
                    FListErrorOpen.Add(Table.TableName+' '+strErr);
                    PutError('Ошибка открытия таблицы: '+Table.TableName+Chr(13)+Chr(10)+strErr);
                    GlobalTask.WriteToLogFile('Ошибка открытия таблицы: '+Table.TableName+' '+strErr);
//                  end;
                end;
              end;
            end;
          end else begin
            Result := CheckIndex(Table, false);
            if Result then begin
              Table.IndexDefs.Clear;
              Table.Active := true;
              Table.IndexDefs.Update;
              SetPrKey(Table);
            end;
          end;
        end;
      end else begin
        // может таблица автоматически создается при подключении со словарем
        try
          Table.Open;
        except
          lErr := true;
        end;
        if lErr then begin
          GlobalTask.WriteToLogFile(' Не найдена таблица: '+ANSIUpperCase(Table.TableName));
          PutError(' Не найдена таблица: '+ANSIUpperCase(Table.TableName));
          if not GlobalPar.OnlyOpen and IsCheckTable(Table) then begin
            Result := CheckTable(Table, false);
          end else begin
            Result := false;
          end;
        end;
      end;
    except
      on E:Exception do begin
        GlobalTask.WriteToLogFile('Ошибка открытия таблицы: '+Table.TableName+' ('+E.Message+')');
        FListErrorOpen.Add(Table.TableName+' '+strErr);
        PutError('Ошибка открытия таблицы: '+Table.TableName+Chr(13)+Chr(10)+E.Message);
        Result:=false;
      end;
    end;
  end;
end;

function TdmTask.OpenStru(FileName: String): Boolean;
begin
  CloseStru;
  FNameIni := FileName;
  FIniStru := TSasaIniFile.Create(FNameIni);
  Result := true;
end;

procedure TdmTask.CloseStru;
begin
  FreeAndNil(FIniStru);
end;

procedure TdmTask.PackBase(lCheck, lAll: Boolean);
var
  i,j,n : integer;
  Table : TAdsTable;
  strErr,strComment : String;
//  lErr, lRet : Boolean;
begin
  if LockBase then begin
//    CloseAllTables;
//    CloseAllQuery;
    CreateProgress('Сжатие базы ...','',CountTables,nLeftProgress,nTopProgress);
    Application.ProcessMessages;
    FullClose;
    SimpleDisconnect;
    SimpleConnect(strErr);
    try
      j:=0;
      lAll:=false;
      for i:=0 to ComponentCount-1 do begin
        if Components[i] is TAdsTable then begin
          Table := TAdsTable(Components[i]);
          if (Length(Table.TableName) > 0) and
             not IsWorkTable(Table) then begin
//            lErr := false;
//            lRet := false;
            Inc(j);
            if lAll or (Table.AdsConnection<>AdsSharedConnection) then begin
              if not lCheck or CheckDeleting(Table) then begin
                strComment:=getCommentTable(Table.TableName, true);
                if strComment='' then begin
                  strComment:=FirstCharUpper(Table.TableName);
                end;
                ChangeProgress(j,strComment);
                if CreateWorkTable(Table, true, true, false) then begin
                  Worktable.PackTable;
                  CloseWorkTable;
                end;
              end;
            end;
          end;
        end;
      end;
    finally
      if lCheck then begin
        ClearDeleting;
      end;
      CloseProgress;
      if not FullOpen(GlobalPar.RelConnectPath,GlobalPar.RelSharedConnectPath) then begin
        PutError('  Ошибка установки базы !  ');
      end;
//      OpenAllTables;
//      OpenAllQuery;
      UnLockBase;
    end;
  end else begin;
    PutError('  Невозвожно заблокировать базу для операции сжатия');
  end;
end;

function GetNameFileSysParam : String;
begin
  Result := 'SysParams.ini';
end;

procedure TdmTask.ReadWindowsProp;
var
  s : String;
begin
  s:=Trim(FIniSysParams.ReadString('WINDOWS','DECIMALSEPARATOR','.'));
  if s<>'' then DECIMALSEPARATOR:=s[1];
  s:=FIniSysParams.ReadString('WINDOWS','THOUSANDSEPARATOR',' ');
  if s<>'' then THOUSANDSEPARATOR:=s[1];
end;

//---------------------------------------------------------------
// создает из относительного пути полный путь к базе, с учетом словаря
function TdmTask.RelPath2Path(strRelPath:String) : String;
var
  strPath:String;
  lDict:Boolean;
begin
  strPath := CheckSimPath(strRelPath);
  if Length(strPath)=0 then strPath:='DATA';
  lDict := false;
  if Pos('.ADD', ANSIUpperCase(strPath)) > 0 then begin
    lDict := true;
  end;
  if not IsFullPath(strPath) then begin
    if lDict then begin
      strPath := CheckSleshN(ExtractFilePath(Application.ExeName))+strPath;
    end else begin
      strPath := CheckSleshN(CheckSleshN(ExtractFilePath(Application.ExeName))+strPath);
    end;
  end else begin
    if not lDict then begin
      strPath := CheckSleshN(strPath);
    end;
  end;
  Result := strPath;
end;

// прочитать параметры
procedure TdmTask.ReadGlobalPar(strDir: String);
var
  strFile,s,strPath : String;
  Ini : TSasaIniFile;
  arr : TArrStrings;
  i : Integer;                
begin
  strFile := strDir + '\' + GetNameFileSysParam;
  if FIniSysParams<>nil then begin
    FListConnects.Free;
    FListSharedConnects.Free;
    FIniSysParams.Free;
  end;
  FListConnects := TStringList.Create;
  FListSharedConnects := TStringList.Create;
  FIniSysParams := TSasaIniFile.Create(strFile);
  ReadWindowsProp;
  s := ANSIUpperCase(Trim(FIniSysParams.ReadString('SYS_PAR_TABLE','TYPE_FILE','ADT')));
  if s = 'CDX' then begin
    GlobalPar.TableType := ttAdsCDX;
  end else if s = 'NTX' then begin
    GlobalPar.TableType := ttAdsNTX;
  end else if s = 'VFP' then begin
    GlobalPar.TableType := ttAdsVFP;
  end else begin
    GlobalPar.TableType := ttAdsADT;
  end;
  s := ANSIUpperCase(Trim(FIniSysParams.ReadString('SYS_PAR_TABLE','CHAR_SET','XXX')));
  if s = 'ANSI' then begin
    GlobalPar.CharType := ANSI;
  end else begin
    GlobalPar.CharType := OEM;
  end;
  FUseBaseParam := FIniSysParams.ReadBool('PARAM','USE_BASE_PARAM', false);
  FLogActive := FIniSysParams.ReadBool('PARAM','LOG_ACTIVE', true);
  FLogTypes  := StringReplace(FIniSysParams.ReadString('PARAM','LOG_TYPES', 'SQL'), ',', ';', [rfReplaceAll]);
  if FLogTypes<>''
    then FLogTypes:=FLogTypes+';';

  //----- усли ошибка открытия выходить из программы ---------------------------
  lCheckErrorOpen       := FIniSysParams.ReadBool('ADMIN','ERROROPEN', true);
  //----------------------------------------------------------------------------
  GlobalPar.AutoReindex := FIniSysParams.ReadBool('ADMIN','AUTOREINDEX', true);
  GlobalPar.AutoPack    := FIniSysParams.ReadBool('ADMIN','AUTOPACK', false);
  GlobalPar.CheckStru   := FIniSysParams.ReadBool('ADMIN','CHECKSTRU', false);
  GlobalPar.OnlyOpen    := FIniSysParams.ReadBool('ADMIN','ONLYOPEN', false);
  if GlobalPar.OnlyOpen then begin
    GlobalPar.CheckIndex := false;
  end else begin
    if GlobalPar.CheckStru then begin
      GlobalPar.CheckIndex := FIniSysParams.ReadBool('ADMIN','CHECKINDEX', true);
    end else begin
      GlobalPar.CheckIndex := FIniSysParams.ReadBool('ADMIN','CHECKINDEX', false);
    end;
  end;

  // создавать таблицы через SQL: CREATE TABLE  или вызов ф-ии AdsCreateTable
  FCreateAsSQL  := FIniSysParams.ReadBool('ADMIN','CREATE_AS_SQL', true);
  FShowFullError:= FIniSysParams.ReadBool('ADMIN','SHOW_FULL_ERROR', false);

  // тип логина при коннекте к базе
  // 0 - без логина
  // 1 - запрос имени пользователя
  // 2 - запрос имени пользователя и пароля
  // 3 - запрос имени пользователя, пароля и даты
  FTypeLogin       := FIniSysParams.ReadInteger('ADMIN','TYPELOGIN', LOGIN_OFF);
  FDefaultUser     := FIniSysParams.ReadString('ADMIN','USER', '');
  FDefaultPassword := FIniSysParams.ReadString('ADMIN','PASSWORD', '');
  FUseSharedConnect := FIniSysParams.ReadBool('ADMIN','USE_SHAREDCONNECT', false);

  GlobalPar.Toch := FIniSysParams.ReadInteger('OTHER','TOCH', 0);

  //-----------------------------------------------------------------------
  GlobalPar.ServerTypes:=[];
  s := FIniSysParams.ReadString('ADMIN','SERVERTYPES', 'LOCAL');
  StrToArr(s,arr,',',true);
  for i:=Low(arr) to High(arr) do begin
    s := ANSIUpperCase(Trim(arr[i]));
    if s = 'LOCAL' then begin
      GlobalPar.ServerTypes := GlobalPar.ServerTypes + [stADS_LOCAL];
    end else if s = 'REMOTE' then begin
      GlobalPar.ServerTypes := GlobalPar.ServerTypes + [stADS_REMOTE];
    end else if s = 'INTERNET' then begin
      GlobalPar.ServerTypes := GlobalPar.ServerTypes + [stADS_AIS];
    end;
  end;
  // в дополнение к проверке пути к базе проверять подключение к ней при типе сервера REMOTE
  s:=FIniSysParams.ReadString('ADMIN','PINGBASE', '0');
  if s='1'
   then GlobalPar.PingBase:=true
   else GlobalPar.PingBase:=false;
  GlobalPar.Compression:=ccAdsCompressionNotSet;
  s:=FIniSysParams.ReadString('ADMIN','COMPRESSION', '0');
  if (s='1') and (stADS_REMOTE in GlobalPar.ServerTypes) then begin
    GlobalPar.Compression:=ccAdsCompressAlways;
    AdsConnection.Compression:=GlobalPar.Compression;
    AdsSharedConnection.Compression:=GlobalPar.Compression;
    try
      GlobalTask.WriteToLogFile('Connection.Compression=ccAdsCompressAlways');
    except
    end;
  end;

  //-----------------------------------------------------------------------
  s := UpperCase(Copy(FIniSysParams.ReadString('ADMIN','COMMUNICATION', 'DEFAULT'),1,3));
  if s='DEF' then begin
    GlobalPar.CommunicationType := ctAdsDefault;
  end else if s='TCP' then begin
    GlobalPar.CommunicationType := ctAdsTCPIP;
  end else if s='UDP' then begin
    GlobalPar.CommunicationType := ctAdsUDPIP;
  end else if s='IPX' then begin
    GlobalPar.CommunicationType := ctAdsIPX;
  end else begin
    GlobalPar.CommunicationType := ctAdsDefault;
  end;

  //--------- прочитаем локальные параметры --------------------------------
  strFile := FIniSysParams.ReadString('FILE','LOCAL_PARAM', 'ParLocal.ini');
  strPath := FIniSysParams.ReadString('PATH','LOCAL_PARAM', '');
  if strPath='' then strPath:=PathForLocalParams;
  FNameFileLocalParam := CheckSleshN(strPath)+strFile;
  Ini := TSasaIniFile.Create( FNameFileLocalParam );
  Ini.ReadSectionValues('PARAM_VALUE', LocalParameters);
  Ini.Free;

  //--------- прочитаем глобальные параметры --------------------------------
  {
  strFile := FIniSysParams.ReadString('FILE','GLOBAL_PARAM', 'ParGlobal.ini');
  strPath := FIniSysParams.ReadString('PATH','GLOBAL_PARAM', '');
  if strPath='' then strPath:=PathForSysParams;
  FNameFileGlobalParam := CheckSleshN(strPath)+strFile;
  Ini := TSasaIniFile.Create( FNameFileGlobalParam );
  Ini.ReadSectionValues('PARAM_VALUE', Parameters);
  Ini.Free;
  }
  strPath := FIniSysParams.ReadString('PATH','SERVICE','SERVICE');
  if not IsFullPath(strPath) then begin
    strPath := CheckSleshN(CheckSleshN(ExtractFilePath(Application.ExeName))+strPath);
  end;

  SetMainComp;

  s := FIniSysParams.ReadString('PATH','GLOBAL_PARAM','SERVICE');
  if not IsFullPath(s) then begin
    s := CheckSleshN(CheckSleshN(ExtractFilePath(Application.ExeName))+s);
  end;
  GlobalTask.PathParam := s;
  GlobalTask.PathService := strPath;

  if not SetNameFileParamTask then begin
    strFile := FIniSysParams.ReadString('FILE','TASK_PARAM', 'Parameters.tsk');
    // !!! создается объект TTaskParameters c учетом пути в GlobalTask.PathService
    GlobalTask.NameFileTaskParameters := strFile;
  end;


  // установить путь к отчетам
  s := FIniSysParams.ReadString('PATH','REPORT','');
  GlobalTask.SetPathReport(s);

  // если бутет подключаться несколько баз по разным путям, такая
  // реализация не пойдет
  GlobalTask.CreateOpisEdit(GlobalTask.PathService+'KeyList.ini');

  GlobalPar.NameFileStru := GlobalTask.PathService + FIniSysParams.ReadString('FILE','STRU_DBF','StruDBF.ini');

// коннект по локальному пути
  FNameConnect := FIniSysParams.ReadString('ADMIN','NAME_CONNECT','Текущий');
  if FNameConnect=''
    then FNameConnect:='Текущий';

  strPath := FIniSysParams.ReadString('PATH','CONNECT','');

  GlobalPar.RelConnectPath := strPath;
  GlobalPar.ConnectPath := RelPath2Path(strPath);
// коннект по общему пути
  strPath := FIniSysParams.ReadString('PATH','SHARED_CONNECT','');
  GlobalPar.RelSharedConnectPath := strPath;
  GlobalPar.SharedConnectPath := RelPath2Path(strPath);

  //------ проверим существование каталогов для коннекта ------------------
  try
    if Pos('.ADD', ANSIUpperCase(GlobalPar.ConnectPath)) = 0 then begin
      ForceDirectories(GlobalPar.ConnectPath);
    end;
  except
    PutError('Ошибка создания директория: "'+GlobalPar.ConnectPath+'"');
  end;
  if FUseSharedConnect then begin
    try
      if Pos('.ADD', ANSIUpperCase(GlobalPar.SharedConnectPath)) = 0 then begin
        ForceDirectories(GlobalPar.SharedConnectPath);
      end;
    except
      PutError('Ошибка создания директория: "'+GlobalPar.SharedConnectPath+'"');
    end;
  end;
  LoadAddConnects;
  //------------------------------------------------------------------------
  OpenStru(GlobalPar.NameFileStru);
end;

function TdmTask.ReindexBase(lAll: Boolean) : Boolean;
begin
  if AdsConnection.IsDictionaryConn then begin
    result:=true;
    exit;
  end;
  Result := true;
  if LockBase then begin
    FullClose;
    DropAllIndexFiles;
    if not FullOpen(GlobalPar.RelConnectPath,GlobalPar.RelSharedConnectPath) then begin
      Result := false;
    end;
    UnLockBase;
  end else begin;
    PutError('  Невозвожно заблокировать базу для операции переиндексация');
  end;
end;

function TdmTask.SeekSort(Table: TAdsTable; NameSort: String): Integer;
var
  i : integer;
begin
  Result := -1;
  for i:=0 to Table.IndexDefs.Count-1 do begin
    if Table.IndexDefs.Items[i].Name = NameSort then begin
      Result := i;
    end;
  end;
end;

procedure TdmTask.SetDefaultParam(DataSet: TAdsDataSet);
begin
  if DataSet is TAdsTable then begin
    with TAdsTable(DataSet) do begin
      TableType := GlobalPar.TableType;
      AdsTableOptions.AdsCharType := GlobalPar.CharType;
//      if DataBaseName='' then begin
//        DataBaseName := AdsConnection.Name;
//      end;
    end;
  end else begin
    with TAdsQuery(DataSet) do begin
//      if DataBaseName='' then begin
//        DataBaseName := AdsConnection.Name;
//      end;  
      SourceTableType := GlobalPar.TableType;
      AdsTableOptions.AdsCharType := GlobalPar.CharType;
    end;
  end;
end;
{
procedure TdmTask.SetIniSysParam(const Value: TSasaIniFile);
begin

end;
}
procedure TdmTask.SetParamWorkQuery(Table: TAdsTable);
begin
  WorkQuery.Active:=false;
  WorkQuery.DatabaseName :=  Table.DatabaseName;
  WorkQuery.SourceTableType := Table.TableType;
  WorkQuery.AdsTableOptions.AdsCharType := Table.AdsTableOptions.AdsCharType;
end;

function TdmTask.SetPrKey(Table: TAdsTable): Boolean;
var
  i : integer;
begin
  Result := false;
  for i:=0 to Table.IndexDefs.Count-1 do begin
    if (Table.IndexDefs.Items[i].Name = 'PR_KEY') and
       (Table.IndexName <> 'PR_KEY') then begin
      Table.IndexName := 'PR_KEY';
      Result := true;
    end;
  end;
end;

procedure TdmTask.AdsAfterInsert(DataSet: TDataSet; strFieldName: String);
begin
  DataSet.FieldByName(strFieldName).AsFloat:=FNewIden;
end;

procedure TdmTask.AdsBeforeInsert(DataSet: TDataSet; strIndexName,
                                   strFieldName: String);
var
  SavePlace : TBookMarkStr;
  CurIndex  : String;
begin
  DataSet.DisableControls;
  if DataSet.IsEmpty then begin
    FNewIden := 1;
  end else begin
    SavePlace := DataSet.Bookmark;
    CurIndex  := TAdsTable(DataSet).IndexName;
    TAdsTable(DataSet).IndexName := strIndexName;
    DataSet.Last;
    FNewIden := DataSet.FieldByName(strFieldName).AsFloat + 1;
    TAdsTable(DataSet).IndexName := CurIndex;
    DataSet.Bookmark := SavePlace;
  end;
  DataSet.EnableControls;
end;

procedure TdmTask.AdsBeforePost(DataSet: TDataSet; strFieldName: String);
var
  i : integer;
  lPost : Boolean;
begin
  DataSet.DisableControls;
  lPost := False;
  strFieldName := ANSIUpperCase(strFieldName) + ',';
  for i:=0 to DataSet.FieldCount-1 do begin
    if Pos(DataSet.Fields[i].FieldName, strFieldName) > 0 then begin
      if not DataSet.Fields[i].IsNull then begin
        lPost := True;
        break;
      end;
    end;
  end;
  if not lPost then begin
    Dataset.Cancel;
  end;
  DataSet.EnableControls;
end;

function TdmTask.GetNameForIni(Table: TAdsTable): String;
var
  i : Integer;
  cName : String;
begin
  i := Pos('.', Table.TableName);
  if i > 0 then begin
    cName := Copy(Table.TableName, 1, i-1);
  end else begin
    cName := Table.TableName;
  end;
  Result := ANSIUpperCase(cName) + '.DBF';
end;

procedure TdmTask.CloseAllQuery;
var
  i : Integer;
  Query : TAdsQuery;
begin
  for i:=0 to ComponentCount-1 do begin
    if Components[i] is TAdsQuery then begin
      Query := TAdsQuery(Components[i]);
      if not IsWorkQuery(Query) then begin
        Query.Active:=false;
      end;
    end;
  end;
end;

procedure TdmTask.OpenAllQuery;
var
  i : Integer;
  Query : TAdsQuery;
begin
  for i:=0 to ComponentCount-1 do begin
    if Components[i] is TAdsQuery then begin
      Query := TAdsQuery(Components[i]);
      Query.SourceTableType := GlobalPar.TableType;
      Query.AdsTableOptions.AdsCharType := GlobalPar.CharType;
      if not IsWorkQuery(Query) then begin
        Query.Active:=false;
        try
          Query.Open;
        except
          on E:Exception do begin
            GlobalTask.WriteToLogFile('Ошибка открытия запроса: '+Query.SQL.Text+' ('+E.Message+')');
            PutError('Ошибка открытия запроса: '+E.Message+chr(13)+chr(10)+Query.SQL.Text);
          end;
        end;
      end;
    end;
  end;
end;

procedure TdmTask.OutPutStruTables;
var
  i : Integer;
  Form : TForm;
  ListStr : TListBox;
  Panel : TPanel;
  B : TButton;
  c : String;
  a : array of Integer;
  Table : TadsTable;
  ListField : TStringList;
  StruField : PStruField;
begin
  Form := TForm.Create(nil);
  Form.Left := 20;
  Form.Top  := 100;
  Form.Width := 300;
  Form.Height := 400;
  Form.Caption := 'Список таблиц';
  Panel := TPanel.Create(Form);
  Panel.Parent := Form;
  Panel.Height := 40;
  Panel.Align  := alBottom;
  Panel.BevelInner := bvNone;
  Panel.BevelOuter := bvNone;
  B := TButton.Create(Form);
  B.Parent := Panel;
  B.Left:=10;
  B.Top:=5;
  B.Caption := 'Вывод';
  B.ModalResult := mrOk;
  B := TButton.Create(Form);
  B.Parent := Panel;
  B.Left:=100;
  B.Top:=5;
  B.Caption := 'Отказ';
  B.ModalResult := mrCancel;
  ListStr := TListBox.Create(Form);
  ListStr.Parent := Form;
  ListStr.Align  := alClient;
  c:='';
  SetLength(a,0);
  for i:=0 to ComponentCount-1 do begin
    if Components[i] is TAdsTable then begin
      if Length(TAdstable(Components[i]).TableName)>0 then begin
       c := c + TAdstable(Components[i]).TableName + ',';
       SetLength(a,Length(a)+1);
       a[Length(a)-1]:=i;
      end;
    end;
  end;
  ListStr.Items.CommaText := c;
  ListStr.ItemIndex:=0;
  if (Form.ShowModal = mrOk) then begin
    Table := TAdsTable(Components[a[ListStr.ItemIndex]]);
    c:='';
    ListField := GetMetaStruTable(Table,'');
    if (ListField <> nil) and (ListField.Count>0) then begin
       c:='';
       for i:=0 to ListField.Count-1 do begin
         StruField := PStruField(ListField.Objects[i]);
         c := c + Format('%s#%s#%d#%d#%s',[StruField^.name,StruField^.KTip,
                    StruField^.Len,StruField^.Toch,StruField^.Komm])+chr(13)+chr(10);
       end;
    end;
    ClearMetaStruTable(ListField);
    MemoWrite(NameFromExe(Table.TableName+'.!!!'),c);
  end;
  Form.Free;
end;

function TdmTask.CheckStruField(TableType: TAdsTableTypes; Stru1,
                                    Stru2: PStruField): Boolean;
begin
  Result := true;
  if Stru1^.AdsTip = Stru2^.AdsTip then begin
    if TableType = ttAdsADT then begin
      if (Stru1^.AdsTip=AdsfldSTRING) or (Stru1^.AdsTip=AdsfldCISTRING) then begin
        Result := (Stru1^.Len = Stru2^.Len);
      end;
    end else begin
      if (Stru1^.AdsTip=AdsfldSTRING) or
         (Stru1^.AdsTip=AdsfldNUMERIC) then begin
        Result := ((Stru1^.Len = Stru2^.Len) and (Stru1^.Toch = Stru2^.Toch));
      end;
    end;
  end else begin
    Result := false;
  end;
end;

function TdmTask.IsMainComputer: Boolean;
begin
  Result := FMainComp;
end;

procedure TdmTask.SetPathForLocalParams(const Value: String);
begin
  FPathForLocalParams := Trim(Value);
  if Length(FPathForLocalParams) = 0 then begin
    FPathForLocalParams := ExtractFilePath(Application.ExeName);
  end;
  CheckSlesh(FPathForLocalParams);
end;

procedure TdmTask.SetPathForSysParams(const Value: String);
begin
  FPathForSysParams := Value;
  if Length(FPathForSysParams) = 0 then begin
    FPathForSysParams := ExtractFilePath(Application.ExeName);
  end;
  CheckSlesh(FPathForSysParams);
end;

//-------------------------------------------------------------------
// Вернуть TField по имени таблицы без расширения и имени поля
function TdmTask.GetField(strTableName, strFieldName: String): TField;
var
  i,j,n : Integer;
begin
  Result := nil;
  strTableName := ANSIUpperCase(Trim(strTableName));
  n := Length(strTableName);
  strFieldName := ANSIUpperCase(Trim(strFieldName));
  for i:=0 to ComponentCount-1 do begin
    if Components[i] is TAdsTable then begin
      with TAdsTable(Components[i]) do begin
        if Active and (Copy(TableName,1,n) = strTableName) then begin
          for j:=0 to FieldCount-1 do begin
            if Fields[j].FieldName = strFieldName then begin
              Result := Fields[j];
            end;
          end;
        end;
      end;
    end;
  end;
end;

function FindParam( l : TStringList; strName : String) : String;
var
  i,j : Integer;
begin
  Result:='';
  strName:=ANSIUpperCase(Trim(strName));
  for i:=0 to l.Count-1 do begin
    if Trim(l.Names[i]) = strName then begin
      j:=Pos('=',l.Strings[i]);
      Result := Copy(l.Strings[i],j+1,Length(l.Strings[i]));
    end;
  end;
end;

function TdmTask.LParamAsBoolean(strName: String): Boolean;
var
  s : String;
begin
  s := UpperCase(FindParam(LocalParameters,strName));
  if s<>'' then Result:= (Copy(s,1,1)='T') or (Copy(s,1,1)='Y')
           else Result:= false;
end;

function TdmTask.LParamAsInteger(strName: String): Integer;
begin
  try
    Result := StrToInt(FindParam(LocalParameters,strName));
  except
    Result := 0;
  end;
end;

function TdmTask.LParamAsString(strName: String): String;
begin
  Result := FindParam(LocalParameters,strName);
end;

function TdmTask.LParamCount : Integer;
begin
 Result := LocalParameters.Count;
end;

function TdmTask.ParamCount : Integer;
begin
 Result := Parameters.Count;
end;

function TdmTask.ParamAsBoolean(strName: String): Boolean;
var
  s : String;
begin
  s := UpperCase(FindParam(Parameters,strName));
  if s<>'' then Result:= (Copy(s,1,1)='T') or (Copy(s,1,1)='Y')
           else Result:= false;
end;

function TdmTask.ParamAsInteger(strName: String): Integer;
begin
  try
    Result := StrToInt(FindParam(Parameters,strName));
  except
    Result := 0;
  end;
end;

function TdmTask.ParamAsString(strName: String): String;
begin
  Result := FindParam(Parameters,strName);
end;

procedure TdmTask.EditLocalParams;
begin
  ExecuteParamsZ(LocalParameters, FNameFileLocalParam);
  GlobalTask.ClearLoadsParam;
end;

procedure TdmTask.EditParams;
begin
  ExecuteParamsZ(Parameters, FNameFileGlobalParam);
  GlobalTask.ClearLoadsParam;
end;

function TdmTask.DeleteAllRecords(DataSet: TDataSet): Boolean;
var
 tb : TAdsTable;
begin
  Result:=false;
  if DataSet is TAdsTable then begin
    tb := TAdsTable(DataSet);
    if not tb.Exclusive then begin
      tb.Close;
      tb.Exclusive:=true;
      try
        tb.Open;
        tb.AdsZapTable;
        Result:=true;
      except
        on E:Exception do begin
          PutError(E.Message);
        end;
      end;
      tb.Close;
      tb.Exclusive:=false;
      tb.Open;
    end else begin
      try
        tb.AdsZapTable;
        Result := true;
      except
        on E:Exception do begin
          PutError(E.Message);
        end;
      end;
    end;
  end;
end;

procedure TdmTask.SetOnAfterClose(const Value: TNotifyEvent);
begin
  FOnAfterClose := Value;
end;

procedure TdmTask.SetOnAfterOpen(const Value: TNotifyEvent);
begin
  FOnAfterOpen := Value;
end;

procedure TdmTask.SetOnBeforeClose(const Value: TNotifyEvent);
begin
  FOnBeforeClose := Value;
end;

procedure TdmTask.SetOnBeforeOpen(const Value: TNotifyEvent);
begin
  FOnBeforeOpen := Value;
end;

procedure TdmTask.SetBaseId(const Value: String);
begin
  FBaseId := Value;
end;

procedure TdmTask.SetUserId(const Value: String);
begin
  FUserId := Value;
end;

function TdmTask.GetBaseError(E : Exception) : String; //EADSDatabaseError): String;
var
  strNameKey,strNameTable : String;
  i : Integer;
begin
  Result:='';
  if EADSDatabaseError(E).ACEErrorCode=7057 then begin  // UNIQUE Index
    i:=Pos('is not unique',LowerCase(E.Message));
    if i>0 then begin
      strNameTable := GetNameSectionTable(EADSDatabaseError(E).TableName);
      strNameKey   := GetPrevWordFromPos(E.Message, i-1);
      Result := FIniStru.ReadString('ERROR',strNameTable+'+'+strNameKey,'');
    end;
  end;
end;

function TdmTask.CreateQueryAsDataSet(strSQL: String): TDataSet;
var
  Query : TAdsQuery;
begin
  Query := TAdsQuery.Create(nil);
  Query.DatabaseName := AdsConnection.Name;
  Query.SourceTableType := GlobalPar.TableType;
  Query.AdsTableOptions.AdsCharType := GlobalPar.CharType;
  Query.SQL.Text := strSQL;
  Query.Open;
  Result := Query;
end;

function TdmTask.CreateQuery(strSQL: String): TAdsQuery;
var
  Query : TAdsQuery;
begin
  Query := TAdsQuery.Create(nil);
  Query.DatabaseName := AdsConnection.Name;
  Query.SourceTableType := GlobalPar.TableType;
  Query.AdsTableOptions.AdsCharType := GlobalPar.CharType;
  Query.SQL.Text := strSQL;
  if strSQL<>'' then begin
    Query.Open;
  end;
  Result := Query;
end;

procedure TdmTask.SetLastError(const Value: String);
begin
  FLastError := Value;
end;

//-------------------------------------------------------------------
function TdmTask.GetVersionBase( Connect : TAdsConnection ) : String;
var
  oldBase : String;
begin
  Result := '';
  if Connect=nil then begin
    Connect:=AdsConnection;
  end;
  try
    if Connect.IsConnected and Connect.IsDictionaryConn  then begin
      oldBase:=WorkQuery.DataBaseName;
      WorkQuery.Close;
      WorkQuery.AdsCloseSQLStatement;
      WorkQuery.SQL.Text := 'SELECT Version_Major, Version_Minor FROM '+SysQuery('system.dictionary');
      WorkQuery.DatabaseName := Connect.Name;
      WorkQuery.Open;
      Result := Trim(WorkQuery.FieldByName('Version_Major').AsString+'.'+WorkQuery.FieldByName('Version_Minor').AsString);
      WorkQuery.Close;
      WorkQuery.AdsCloseSQLStatement;
      WorkQuery.DatabaseName := oldBase;
    end else begin
      Result := 'нет подключения';
    end;
  except
    on E:Exception do begin
      Result:=E.Message;
    end;
  end;
end;
//-------------------------------------------------------------------
function TdmTask.SysQuery(sText: String): String;
begin
  if Copy(WorkTable.Version,1,1)='8'
    then Result:=sText
    else Result:=StringReplace(sText, 'system.', 'system.ansi_',[rfReplaceAll,rfIgnoreCase]);
end;
//-------------------------------------------------------------------
function TdmTask.GetEngineVersion: String;
var
  s:String;
  n:Integer;
begin
  Result := '';
  s:='';
  if AdsConnection.DataSetCount > 0 then begin
    s:=TAdsDataSet(AdsConnection.DataSets[0]).Version;
  end;
  if stADS_LOCAL in AdsConnection.AdsServerTypes then begin
    Result:='Advantage Local Server '+s;
  end else begin
    Result:='Advantage Database Server ';
    WorkQuery.SQL.Text:='execute procedure sp_mgGetInstallInfo()';
    try
      try
        WorkQuery.Open;
        n:=Pos('(',s);
        if n>0 then begin
          s:=Copy(s,n,100);
        end else begin
          s:='('+s+')';
        end;
        Result := Result + WorkQuery.FieldByName('Version').AsString+' '+s;
      except
        Result := Result + s;
      end;
    finally
      if WorkQuery.Active
        then WorkQuery.Close;
    end;
  end;
end;

procedure TdmTask.SetFirstConnect(const Value: Boolean);
begin
  FFirstConnent := Value;
end;

procedure TdmTask.SetDefaultUser(const Value: String);
begin
  FDefaultUser := Value;
end;

procedure TdmTask.SetDefaultPassword(const Value: String);
begin
  FDefaultPassword := Value;
end;

procedure TdmTask.SetCheckNewUser(const Value: Boolean);
begin
  FCheckNewUser := Value;
end;

procedure TdmTask.SetCheckPassword(const Value: String);
begin
  FCheckPassword := Value;
end;

procedure TdmTask.SetCheckUser(const Value: String);
begin
  FCheckUser := Value;
end;

procedure TdmTask.SetDateFormat(ds: TDataSet);
var
  i : Integer;
begin
  for i:=0 to ds.FieldCount-1 do begin
    if ds.Fields[i].DataType = ftDate then begin
      ds.Fields[i].EditMask := '!99/99/0000;1;_';
    end;
  end;
end;

function TdmTask.IsAdmin: Boolean;
begin
  Result := true;
end;

function TdmTask.IsConnected: Boolean;
begin
  Result := AdsConnection.IsConnected;
end;

function TdmTask.GetDataSet(strName: String): TDataSet;
var
  i,j : Integer;
  strNameTable,s : String;
begin
  Result := nil;
  strName := Trim(ANSIUpperCase(strName));
  for i:=0 to ComponentCount-1 do begin
    if Components[i] is TDataSet and
       (strName = ANSIUpperCase(Components[i].Name)) then begin
      Result := TDataSet(Components[i]);
      break;
    end;
  end;
  if Result=nil then begin
    i := Pos('.',strName);
    if i > 0 then strNameTable:=Copy(strName,1,i-1) else strNameTable:=strName;
    for i:=0 to ComponentCount-1 do begin
      if Components[i] is TAdsTable then begin
        j := Pos('.', TAdsTable(Components[i]).TableName );
        if j > 0 then s := ANSIUpperCase(Copy(TAdsTable(Components[i]).TableName,1,j-1))
                 else s := ANSIUpperCase(TAdsTable(Components[i]).TableName);
        if s=strNameTable then begin
          Result := TDataSet(Components[i]);
          break;
        end;
      end;
    end;
  end;
end;

function TdmTask.GetTable(strName: String): TAdsTable;
var
  i,j : Integer;
  strTableName : String;
begin
  Result := nil;
  strName := Trim(ANSIUpperCase(strName));
  for i:=0 to ComponentCount-1 do begin
    if Components[i] is TAdsTable then begin
      strTableName := ANSIUpperCase(TAdsTable(Components[i]).TableName);
      j:=Pos('.',strTableName);
      if j>0 then strTableName := Copy(strTableName,1,j-1);
      if (strName=ANSIUpperCase(Components[i].Name)) or (strName=strTableName) then begin
        Result := TAdsTable(Components[i]);
        break;
      end;
    end;
  end;
end;

// lSeekRecno - после поиска остаться на старой записи ( по умолчанию false);
function TdmTask.SeekValueTable(strName: String; strKeyFields:String; strSeek : String; strField : String; lSaveSeekRecno:Boolean) : Variant;
var
  tb : TDataSet;
  fld : TField;
  st:TSostTable;
begin
  Result := null;
  tb := getTable(strName);
  if tb=nil then begin
    tb:=GetDataSet(strName);
  end;
  if tb<>nil then begin
    fld := tb.FindField(strField);
    if fld<>nil then begin
      Result := GetEmptyFieldValue(fld);
      if strSeek<>'' then begin
        if not lSaveSeekRecno then begin
          st:=SaveSostDataSet(tb,true);
        end;
        if tb.Locate(strKeyFields,strSeek,[]) then begin
          Result := fld.Value;
          if Result=null then begin
            Result := GetEmptyFieldValue(fld);
          end;
        end;
        if not lSaveSeekRecno then begin
          RestSostDataSet(tb,st);
        end;
      end;
    end;
  end;
end;

function TdmTask.SeekValueTable2(ds:TDataSet; strKeyFields:String; strSeek : String; strField : String) : Variant;
var
  fld : TField;
begin
  fld := ds.FindField(strField);
  if fld<>nil then begin
    Result := GetEmptyFieldValue(fld);
    if strSeek<>'' then begin
      if ds.Locate(strKeyFields,strSeek,[]) then begin
        Result := fld.Value;
        if Result=null then begin
          Result := GetEmptyFieldValue(fld);
        end;
      end;
    end;
  end;
end;

function TdmTask.PathForBase(Conn : TAdsConnection): String;
var
  i : Integer;
begin
  if Conn.IsDictionaryConn then begin
    Result := Conn.ConnectPath;
    i := LastPos('\',Result);
    Result := Copy(Result,1,i);
  end else begin
    Result := CheckSleshN(Conn.ConnectPath);
  end;
end;

procedure TdmTask.SetCreateAsSQL(const Value: Boolean);
begin
  FCreateAsSQL := Value;
end;

procedure TdmTask.SetShowFullError(const Value: Boolean);
begin
  FShowFullError := Value;
end;

function TdmTask.CreateAddTable(strTableName, strName, strDataBase: String): TAdsTable;
var
  tb : TAdsTable;
begin
  tb := TAdsTable.Create(Self);
  tb.DataBaseName := strDataBase;
  if strName = '' then strName := strTableName;
  tb.Name := strName;
  tb.TableName := strTableName;
  Result := tb;
end;

function TdmTask.CheckPath( strPath : String ) : String;
begin
  Result := CheckSimPath(strPath);
  if not IsFullPath(strPath) then begin
    Result := CheckSleshN(CheckSleshN(ExtractFilePath(Application.ExeName))+Result);
  end;
end;

function TdmTask.CheckSimPath( strPath : String ) : String;
var
  s,ss : String;
  i : Integer;
begin
  if Copy(strPath,1,1)='&' then begin  // добавляем путь к exe-файлу
    s := ExtractFilePath(Application.ExeName);
    if Copy(strPath,2,1)='\'
      then s := Copy(s,1,Length(s)-1);
    strPath := s+Copy(strPath,2,Length(strPath)-1);
  end else if UpperCase(Copy(strPath,1,6))='(FLASH' then begin
    i:=Pos(')',strPath);
    if i>0 then begin
      strPath := Copy(strPath,i+1,200);
      s := GetFlashDrive;
      if s <> '' then begin
        ss := UpperCase(FIniSysParams.ReadString('ADMIN','NUMFLASH',''));
        if (ss='') or (ss='L') then begin
          s:=Right(s,1);
        end else if (ss='F') then begin
          s:=Copy(s,1,1);
        end else begin
          try
            s:=Copy(s,StrToInt(ss),1);
          except
            s:=Right(s,1);
          end;
        end;
      end;
      strPath := s + strPath;
    end;
  end;
  Result := strPath;
end;

procedure TdmTask.LoadAddConnects;
var
  sl : TStringList;
  i : Integer;
  strName, strPath : String;
begin
  FListConnects.Clear;
  FListSharedConnects.Clear;
  sl := TStringList.Create;
  IniSysParams.ReadSectionValues('ALLCONNECTS', sl);
  for i:=0 to sl.Count-1 do begin
    strName := Trim(sl.Names[i]);
    strPath := Trim(sl.Values[sl.Names[i]]);
//    strPath := CheckSimPath(Trim(sl.Values[sl.Names[i]]));
    FListConnects.Add(strName+'='+strPath);
  end;
  sl.Clear;
  IniSysParams.ReadSectionValues('SHAREDCONNECTS', sl);
  for i:=0 to sl.Count-1 do begin
    strName := Trim(sl.Names[i]);
    strPath := Trim(sl.Values[sl.Names[i]]);
//    strPath := CheckSimPath(Trim(sl.Values[sl.Names[i]]));
    FListSharedConnects.Add(strName+'='+strPath);
  end;
  sl.Free;
end;

function TdmTask.CountConnects: Integer;
begin
  Result := FListConnects.Count;
end;

function TdmTask.GetNameConnect(i: Integer): String;
begin
  Result := FListConnects.Names[i];
end;

function TdmTask.GetNameConnect( strPath : String) : String;
var
  i : Integer;
  s : String;
begin
  Result := '';
  strPath :=  ANSIUpperCase(CheckSleshN(strPath));
  for i:=0 to CountConnects-1 do begin
    s := ANSIUpperCase(CheckSleshN(GetPathConnect(i)));
    if s=strPath then begin
      Result := GetNameConnect(i);
      exit;
    end;
  end;
end;

function TdmTask.GetPathConnect(i: Integer): String;
begin
  Result := FListConnects.Values[FListConnects.Names[i]];
end;

function TdmTask.GetPathSharedConnect(i: Integer): String;
begin
  Result := FListSharedConnects.Values[FListConnects.Names[i]];
end;

procedure TdmTask.SetNameConnect(const Value: String);
begin
  FNameConnect := Value;
  FIniSysParams.WriteString('ADMIN','NAME_CONNECT', FNameConnect);
end;

//-------------------------------------------------------------
function TdmTask.SeekConnect(strName : String) : Integer;
var
  i : Integer;
  s : String;
begin
  Result := -1;;
  s := ANSIUpperCase(Trim(strName));
  for i:=0 to FListConnects.Count-1 do begin
    if ANSIUpperCase((FListConnects.Names[i]))=s then begin
      Result := i;
      break;
    end;
  end;
end;

//--------------------------------------------------------------------------
function TdmTask.AddNewConnect(strName, strConnectPath, strSharedConnectPath: String): Boolean;
begin
  Result := true;
  if SeekConnect(strName) = -1 then begin
    FListConnects.Add(strName+'='+strConnectPath);
    FListSharedConnects.Add(strName+'='+strSharedConnectPath);
    IniSysParams.WriteString('ALLCONNECTS', strName, strConnectPath);
    IniSysParams.WriteString('SHAREDCONNECTS', strName, strSharedConnectPath);
    IniSysParams.UpdateFile;
  end else begin
    Result := false;
//    PutError('База с именем:' + strName + ' уже существует ! ');
  end;
end;

//--------------------------------------------------------------------------
function TdmTask.EditPathConnect(strName, strConnectPath, strSharedConnectPath: String): Boolean;
var
  i : Integer;
begin
  Result := false;
  i:=SeekConnect(strName);
  if i>-1 then begin
    FListConnects.Strings[i]:=strName+'='+strConnectPath;
    FListSharedConnects.Strings[i]:=strName+'='+strSharedConnectPath;
    IniSysParams.WriteString('ALLCONNECTS', strName, strConnectPath);
    IniSysParams.WriteString('SHAREDCONNECTS', strName, strSharedConnectPath);
    IniSysParams.UpdateFile;
    Result:=true
  end;
end;

procedure TdmTask.DisableControls;
begin
//
end;

procedure TdmTask.EnableControls;
begin
//
end;

function TdmTask.LoadSQL(strNameSQL: String; var strSQL : String): Boolean;
var
  strFile,strSect : String;
  i,n,nBegin,nEnd:Integer;
  sl:TStringList;
begin
  Result := false;
  n:=Pos('|',strNameSQL);
  if n>0 then begin
    strSect:=Copy(strNameSQL,n+1,Length(strNameSQL));
    strNameSQL:=Copy(strNameSQL,1,n-1);
  end else begin
    strSect:='';
  end;
  strFile := CheckSleshN(CheckPath(GlobalTask.PathSQLFiles))+
             strNameSQL + '.sql';
  MemoRead( strFile, strSQL );
  if strSQL<>'' then begin
    if strSect='' then begin
      Result := true;
    end else begin
      sl:=TStringList.Create;
      sl.Text:=strSQL;
      strSQL:='';
      nBegin:=-1;
      nEnd:=-1;
      for i:=0 to sl.Count-1 do begin
        if nBegin>0 then begin
          if Pos('====',sl.Strings[i])>0 then begin
            nEnd:=i-1;
          end;
        end;
        if (Pos(strSect,sl.Strings[i])>0) and (Pos('====',sl.Strings[i])>0) then begin
          nBegin:=i+1;
        end;
        if (nBegin>-1) and (nEnd>-1) then break;
      end;
      if (nBegin>-1) and (nEnd>-1) then begin
        for i:=nBegin to nEnd do begin
          strSQL:=strSQL+sl.Strings[i]+chr(13)+chr(10);
        end;
      end;
      if strSQL<>'' then Result:=true;
      sl.Free;
    end;
  end;
end;

function TdmTask.GetSQLFromStr(strSQL: String; strSect : String): String;
var
  i,n,nBegin,nEnd:Integer;
  sl:TStringList;
begin
  Result := '';
  if (strSQL<>'') and (strSect<>'') then begin
    sl:=TStringList.Create;
    sl.Text:=strSQL;
    strSQL:='';
    nBegin:=-1;
    nEnd:=-1;
    for i:=0 to sl.Count-1 do begin
      if nBegin>0 then begin
        if Pos('====',sl.Strings[i])>0 then begin
          nEnd:=i-1;
        end;
      end;
      if (Pos(strSect,sl.Strings[i])>0) and (Pos('====',sl.Strings[i])>0) then begin
        nBegin:=i+1;
      end;
      if (nBegin>-1) and (nEnd>-1) then break;
    end;
    if (nBegin>-1) and (nEnd>-1) then begin
      for i:=nBegin to nEnd do begin
        strSQL:=strSQL+sl.Strings[i]+chr(13)+chr(10);
      end;
    end;
    if strSQL<>''
      then Result:=strSQL;
    sl.Free;
  end;
end;

procedure TdmTask.SetLastDatabaseError(const Value: Integer);
begin
  FLastDatabaseError := Value;
end;

function TdmTask.IsDirBase(strDir: String; nType : Integer): Boolean;
begin
  Result := true;
end;

function TdmTask.ProcessDatabaseError : Boolean;
begin
  Result := false;
end;

function TdmTask.SetNameFileParamTask : Boolean;
begin
  Result := false;
end;

function TdmTask.GetStrErrAds( nError : Integer ) : String;
var
  ini : TSasaIniFile;
begin
  ini := Globaltask.iniFile('METATASK');
  if ini=nil
    then Result := ''
    else Result := ini.ReadString('ADS', IntToStr(nError), '');
end;

//------------------------------------------------------------------------
function TdmTask.CheckPathBase(strNewPath : String) : Boolean;
var
 s,s0,s1,s2 : String;
 lExit : Boolean;
 strPath, strDir : String;
begin
  Result := true;
  strPath := ANSIUpperCase(CheckSleshN(ExtractFilePath(Application.ExeName)));
  s := IniSysParams.ReadString('ADMIN','MAINCOMP', '1');
  // компьютер не главный
  if s<>'1' then begin
    if not IsDirBase(strNewPath , 0 ) then begin
      lExit := false;
      while not lExit do begin
        if SelectDirectory('Выберите папку с программой на главном компьютере', '', strDir) then begin
          s0:=CheckSleshN(strDir)+'Data';
          s1:=CheckSleshN(strDir)+'Spr';
          s2:=CheckSleshN(strDir)+'Service';
          if IsDirBase(s0, 0) then begin
            if Pos(strPath, ANSIUpperCase(s0) ) > 0 then begin
              GlobalPar.RelConnectPath       := Copy(s0,Length(strPath)+1,Length(s0) );
              GlobalPar.RelSharedConnectPath := Copy(s1,Length(strPath)+1,Length(s1) );
              GlobalTask.PathParam := Copy(s2,Length(strPath)+1,Length(s2) );
            end else begin
              GlobalPar.RelConnectPath := s0;
              GlobalPar.RelSharedConnectPath := s1;
              GlobalTask.PathParam := s2;
            end;
            IniSysParams.WriteString('PATH','CONNECT', GlobalPar.RelConnectPath);
            IniSysParams.WriteString('PATH','SHARED_CONNECT', GlobalPar.RelSharedConnectPath);
            IniSysParams.WriteString('PATH','GLOBAL_PARAM', GlobalTask.PathParam);
            IniSysParams.UpdateFile;
            GlobalPar.ConnectPath := s0;
            GlobalPar.SharedConnectPath := s1;
            AdsConnection.ConnectPath := GlobalPar.ConnectPath;
            AdsSharedConnection.ConnectPath := GlobalPar.SharedConnectPath;
            //----
            EditPathConnect( FNameConnect, GlobalPar.RelConnectPath,GlobalPar.RelSharedConnectPath);
            //----
            lExit := true;
          end else begin
            PutError(' Выбранная папка не является програмной ! ');
          end;
        end else begin
          Result := false;
          lExit := true;
        end;
      end;
    end;
  end;
end;

//-------------------------------------------------------------------------------
// функция возвращает true если необходимо перезапустить программу
//-------------------------------------------------------------------------------
function TdmTask.CheckTypeServer(strDir : String) : Boolean;
var
 s,ss,sss : String;
 lWrite : Boolean;
 strPath  : String;
 MainINI, AdsINI : TSasaIniFile;
 strIP, strPORT, strNameComp : String;
 arr : TArrStrings;
 i : Integer;
begin
  Result := false;
  strPath := ANSIUpperCase(CheckSleshN(ExtractFilePath(Application.ExeName)));
  s := IniSysParams.ReadString('ADMIN','MAINCOMP', '1');
  // если компьютер не главный
  if s<>'1' then begin
    strDir := CheckSleshN(strDir); // GlobalPar.ConnectPath считаем что коннект корректно указавает на другой компьютер
    if IsDirBase( strDir, 0 ) then begin
      try
        //--- прочитаем тип сервера с головного компьютера -----------------------------
        i := LastPos('\Data\',strDir);
        strDir := Copy(strDir,1,i);
        strNameComp := GetNameComp(strDir);
        MainINI := TSasaIniFile.Create(strDir+'SysParams.ini');
        ss  := MainINI.ReadString('ADMIN','SERVERTYPES', 'LOCAL');
        sss := UpperCase(Copy(MainINI.ReadString('ADMIN','COMMUNICATION', 'DEFAULT'),1,3));
        strIP   := MainINI.ReadString('SERVER','LAN_IP', '');
        strPORT := MainINI.ReadString('SERVER','LAN_PORT', '');
        MainINI.Free;
        GlobalPar.ServerTypes:=[];
        SetLength(arr,0);
        StrToArr(ss,arr,',',true);
        for i:=Low(arr) to High(arr) do begin
          s := ANSIUpperCase(Trim(arr[i]));
          if s = 'LOCAL' then begin
            GlobalPar.ServerTypes := GlobalPar.ServerTypes + [stADS_LOCAL];
          end else if s = 'REMOTE' then begin
            GlobalPar.ServerTypes := GlobalPar.ServerTypes + [stADS_REMOTE];
          end else if s = 'INTERNET' then begin
            GlobalPar.ServerTypes := GlobalPar.ServerTypes + [stADS_AIS];
          end;
        end;
        s := sss;
        if s='TCP' then begin
          GlobalPar.CommunicationType := ctAdsTCPIP;
          s := 'TCPIP';
        end else if s='UDP' then begin
          GlobalPar.CommunicationType := ctAdsUDPIP;
          s := 'UDPIP';
        end else if s='IPX' then begin
          GlobalPar.CommunicationType := ctAdsIPX;
          s := 'IPX';
        end else begin
          GlobalPar.CommunicationType := ctAdsDefault;
          s := 'DEFAULT';
        end;
        IniSysParams.WriteString('ADMIN','SERVERTYPES', ss);
        IniSysParams.WriteString('ADMIN','COMMUNICATION', s);
        IniSysParams.UpdateFile;
        if strNameComp<>'' then begin
          // откроем файл ads.ini
          AdsINI := TSasaIniFile.Create(NameFromExe('ads.ini'));
          lWrite := false;
          if (strIP<>'') and (strPORT<>'') then begin
            ss      := AdsINI.ReadString(strNameComp,'LAN_IP', '');
            sss     := AdsINI.ReadString(strNameComp,'LAN_PORT', '');;
            // включен контроль проверки IP-адреса
            if IniSysParams.ReadString('ADMIN','CHECK_IP', '1')='1' then begin
              // значения изменились
              if (strIP<>ss) or (strPort<>sss) then begin
                AdsINI.WriteString(strNameComp,'LAN_IP',strIP);
                AdsINI.WriteString(strNameComp,'LAN_PORT',strPort);
                lWrite := true;
                Result := true;   // <-------- Необходимо перезапустить программу
              end;
            end else begin
              if (strPort<>sss) then begin
                AdsINI.WriteString(strNameComp,'LAN_PORT',strPort);
                lWrite := true;
                Result := true;   // <-------- Необходимо перезапустить программу
              end;
            end;
          end else begin
            AdsINI.EraseSection(strNameComp);
            lWrite := true;
          end;
          if lWrite then begin
            AdsINI.UpdateFile;
          end;
          AdsINI.Free;
          // если IP пустой, то удаляем на локальном компьютере файл ads.ini
          if strIP='' then begin
            DeleteFile(NameFromExe('ads.ini'));
          end;
        end else begin
          DeleteFile(NameFromExe('ads.ini'));
        end;
      except

      end;
      //--------------------------------
    end;
  end;
end;

function TdmTask.NameTableToSQL(tb:TAdsTable): String;
var
  i:Integer;
begin
  Result := tb.TableName;
  i := Pos('.',Result);
  if i>0
    then Result := Copy(Result,1,i-1);
  if Pos(' ',Result) > 0
    then Result := '['+Result+']';
end;

//-------------- выполнение sql с протоколом ----------------
function TdmTask.OpenExecute(Connect:TAdsConnection; strFile: String; lShow:Boolean): Boolean;
begin
  FErrorExecute:=false;
  FStringErrorExecute:='';
  FCurConnect:=Connect;
  if FCurConnect=nil
    then FCurConnect:=AdsConnection;
  FShowDebug:=lShow;
  FFileProtokol:=strFile;
  FListProtokol:=TStringList.Create;
  Result:=true;
end;

procedure TdmTask.CloseExecute;
begin
  FListProtokol.SaveToFile(FFileProtokol);
  FreeAndNil(FListProtokol);
end;

procedure TdmTask.AddToProtokol(s:String);
begin
  if FListProtokol<>nil
    then FListProtokol.Add(s);
end;

procedure TdmTask.SetErrorExecute(strErr:String);
begin
  if not FErrorExecute then begin
    FErrorExecute:=true;
    FStringErrorExecute:=strErr;
  end;
end;

function TdmTask.GetErrorExecute(var strErr:String) : Boolean;
begin
  Result:= FErrorExecute;
  strErr:=FStringErrorExecute;
end;

function TdmTask.ExecuteSQL(strSQL:String; Conn:TAdsConnection): Boolean;
var
  i,ii : Word;
begin
  Result := true;
  i:=0; ii:=0;
  try
    AddToProtokol(strSQL);
    i:=GetTickCount;
    if Conn=nil
      then FCurConnect.Execute(strSQL)
      else Conn.Execute(strSQL);
    ii:=GetTickCount;
  except
    on E:Exception do begin
      Result := false;
      if ( E is EADSDatabaseError ) then begin
        FLastDatabaseError := ( E as EADSDatabaseError ).ACEErrorCode;
      end;
      FLastError:=E.Message;
      SetErrorExecute(FLastError);
      AddToProtokol('ОШИБКА-> '+FLastError);
    end;
  end;
  if Result
    then AddToProtokol('Выполнялось:'+FloatToStr(ii-i));
end;

procedure TdmTask.ShowProtokolExecute;
begin
  if FFileProtokol=''
    then FFileProtokol:=NameFromExe('protokol.txt');
  ViewDOSFileEx( FFileProtokol, false, 'Просмотр Log-файла объединения баз' );
end;

function TdmTask.LogActive:Boolean;
begin
  Result:=FLogActive;
end;
function TdmTask.LogTypes:String;
begin
  Result:=FLogTypes;
end;
procedure TdmTask.SetLogTypes(sTypes:String);
begin
  FLogTypes:=sTypes;
end;

//--------------------------------------------------------------------------------------
function TdmTask.ReplaceTableBase(strPath:String; strTableName: String): Boolean;
var
  i : Integer;
//  dsColumns : TDataSet;
  strAutoCreate,strPrimaryKey,strDefaultIndex,
  strPermissionLevel,strMemoBlockSize,strComment,strCurPath : String;
  lAuto:Boolean;
begin
  Result:=false;
  strPath:=CheckSleshN(strPath);
  if not AdsConnection.IsConnected then begin
    LastError:='Нет соединения с базой';
    exit;
  end;
  LastError:='';
//  strPath := Copy(ConnectSource.ConnectPath, 1, i);
  i:=LastPos('\', AdsConnection.ConnectPath);
  strCurPath:=Copy(AdsConnection.ConnectPath, 1, i);
  try
    WorkQuery.AdsConnection:=AdsConnection;
    WorkQuery.SQL.Text := 'select * from '+SysQuery('system.tables')+' where name='+QStr(strTableName);
    WorkQuery.Open;
  except
    on E:Exception do begin
      LastError:='Ошибка открытия таблицы %s '+E.Message;
    end;
  end;
  if LastError='' then begin
    if WorkQuery.FieldByName('NAME').AsString='' then begin
      WorkQuery.Close;
      LastError:='Описание таблицы "%s" не найдено';
    end else begin
      lAuto:=WorkQuery.FieldByName('Table_Auto_Create').AsBoolean;
      if lAuto then strAutoCreate:=QStr('True') else strAutoCreate:=QStr('False');
      strPrimaryKey := WorkQuery.FieldByName('Table_Primary_Key').AsString;
      strDefaultIndex := WorkQuery.FieldByName('Table_Default_Index').AsString;
    //  strEncryption   := WorkQuery.FieldByName('Table_Encryption').AsString;
    //  if strEncryption='1' then strEncryption:='True' else strEncryption:='False';
      strPermissionLevel := WorkQuery.FieldByName('Table_Permission_Level').AsString;
      strMemoBlockSize   := WorkQuery.FieldByName('Table_Memo_Block_Size').AsString;
      strComment := WorkQuery.FieldByName('Comment').AsString;
      WorkQuery.Close;
      if lAuto then begin  // если Auto Create Table
        if FileExists(strCurPath+strTableName+'.adt') then begin
          if not DeleteFile(strCurPath+strTableName+'.adt') then begin
            LastError:='Ошибка удаления таблицы %s';
          end;
        end;
        if LastError='' then begin
          try
            WorkTable.AdsConnection:=AdsConnection;
            WorkTable.TableName:=strTableName;
            WorkTable.Open;
            WorkTable.Close;
          except
            on E:Exception do begin
              LastError:='Ошибка открытия таблицы %s '+E.Message;
           end;
          end;
        end;
      end;
      AdsConnection.CloseCachedTables;
      if LastError='' then begin
        try
          AdsConnection.Execute('DROP TABLE '+strTableName);   // удаляем текущую твблицу из базы
        except
          on E:Exception do begin
            LastError:='Ошибка удаления таблицы %s из базы: '+E.Message;
          end;
        end;
        //--------------------- заменяем таблицу -------------------
        if LastError='' then begin
          if not CopyFile(PChar(strPath+strTableName+'.adt'), PChar(strCurPath+strTableName+'.adt'), true) then begin
            LastError:='Ошибка копирования файла : '+strPath+strTableName+'.adt '+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')';
          end;
        end;
        if LastError='' then begin
          Result:=true;
          try
            if FileExists(strPath+strTableName+'.adi') then CopyFile(PChar(strPath+strTableName+'.adi'), PChar(strCurPath+strTableName+'.adi'), true);
            if FileExists(strPath+strTableName+'.adm') then CopyFile(PChar(strPath+strTableName+'.adm'), PChar(strCurPath+strTableName+'.adm'), true);
            AdsConnection.Execute('EXECUTE PROCEDURE sp_AddTableToDatabase('+QStr(strTableName)+','+QStr(strTableName+'.adt')+',3,1,'+QStr('')+',NULL)');
            AdsConnection.Execute('EXECUTE PROCEDURE sp_ModifyTableProperty('+QStr(strTableName)+','+QStr('Table_Auto_Create')+','+strAutoCreate+','+QStr('APPEND_FAIL')+','+QStr(strTableName+'fail')+')');
            if strPrimaryKey<>'' then
              AdsConnection.Execute('EXECUTE PROCEDURE sp_ModifyTableProperty('+QStr(strTableName)+','+QStr('Table_Primary_Key')+','+QStr(strPrimaryKey)+','+QStr('APPEND_FAIL')+','+QStr(strTableName+'fail')+')');
            if strDefaultIndex<>'' then
              AdsConnection.Execute('EXECUTE PROCEDURE sp_ModifyTableProperty('+QStr(strTableName)+','+QStr('Table_Default_Index')+','+QStr(strDefaultIndex)+','+QStr('APPEND_FAIL')+','+QStr(strTableName+'fail')+')');
            if strPermissionLevel<>'' then
              AdsConnection.Execute('EXECUTE PROCEDURE sp_ModifyTableProperty('+QStr(strTableName)+','+QStr('Table_Permission_Level')+','+QStr(strPermissionLevel)+','+QStr('APPEND_FAIL')+','+QStr(strTableName+'fail')+')');
            if strMemoBlockSize<>'' then
              AdsConnection.Execute('EXECUTE PROCEDURE sp_ModifyTableProperty('+QStr(strTableName)+','+QStr('Table_Memo_Block_Size')+','+QStr(strMemoBlockSize)+','+QStr('APPEND_FAIL')+','+QStr(strTableName+'fail')+')');
            if strComment<>'' then
              AdsConnection.Execute('EXECUTE PROCEDURE sp_ModifyTableProperty('+QStr(strTableName)+','+QStr('Comment')+','+QStr(strComment)+','+QStr('APPEND_FAIL')+','+QStr(strTableName+'fail')+')');
          except
            on E:Exception do begin
              Result:=false;
              LastError:='Ошибка (%s): '+E.Message;
            end;
          end;
        end;
      end;
    end;
  end;
  if LastError<>''
    then LastError:=Format(LastError, [strTableName]);
end;
//--------------------------------------------------------
function TdmTask.OpenQuery(sSQL:String):TDataSet;
Var
  Query: TAdsQuery;
begin
  Result:=nil;
  LastError := '';
  Query:=TAdsQuery.Create(nil);
  try
    Query.AdsConnection:=AdsConnection;
    Query.SQL.Text:=sSQL;
    Query.Active:=True;
    Result:=Query;
  except
    on E:Exception do begin
      sSQL:=StringReplace(sSQL, #13#10, ' ', [rfReplaceAll]);
      LastError:='Ошибка открытия запроса: '+sSQL+chr(13)+chr(10)+'    >>'+E.Message;
      GlobalTask.WriteToLogFile(LastError);
    end;
  end;
end;
//---------------------------------------------------------------------
procedure TdmTask.FreeQuery(ds:TDataSet);
begin
  if ds<>nil then begin
    if ds.Active then ds.Close;
    ds.Free;
    ds:=nil;
  end;
end;
//---------------------------------------------------------------------
function TdmTask.ChangeSQL(ds:TDataSet; sNewSQL:String) : Boolean;
begin
  Result:=false;
  if (ds<>nil) and (ds is TAdsQuery) then begin
    if ds.Active then ds.Active:=false;
    TAdsQuery(ds).SQL.Text:=sNewSQL;
    try
      TAdsQuery(ds).Open;
      Result:=true;
    except
      on E:Exception do begin
        sNewSQL:=StringReplace(sNewSQL, #13#10, ' ', [rfReplaceAll]);
        LastError:='ERROR ChangeSQL: '+sNewSQL+chr(13)+chr(10)+'    >>'+E.Message;
        GlobalTask.WriteToLogFile(LastError);
      end;
    end;
  end;
end;
//--------------------------------------------------------------------------------------
function TdmTask.ExecuteSQL(sSQL:String; nLog:Integer) : Boolean;
begin
  Result:=true;
  try
    AdsConnection.Execute(sSQL);
  except
    on E:Exception do begin
      Result:=false;
      sSQL:=StringReplace(sSQL, #13#10, ' ', [rfReplaceAll]);
      LastError:='ERROR ExecuteSQL: '+sSQL+chr(13)+chr(10)+'    >>'+E.Message;
    end;
  end;
  if (nLog=1) or ((Result=false) and (nLog=2))
    then GlobalTask.WriteToLogFile(LastError);
end;

//--------------------------------------------------------------------------------------------
procedure TdmTask.DeleteRecordSprWork( Grid : TSasaDbGrid; var lDel : Boolean);
var
  s,ss,sID:String;
  n,nCount:Integer;
  lFind:Boolean;                                        
begin                  
  sID:=Trim(Grid.DataSource.DataSet.FieldByName('ID').AsString);
  if (sID='0') or (sID='') then begin
    lDel:=true;
    exit;
  end;  
  WorkQuery.SQL.Text:='';
  {$IFDEF POST}
    WorkQuery.SQL.Text:=' select count(*) from DocMain where sign_org='+sID;
  {$ELSE}
    {$IF Defined(LAIS) or Defined(GKH) or Defined(OCHERED)}
      WorkQuery.SQL.Text:=
        ' select count(*) from DocMain where sign_org='+sID+
        ' union all  '+
        ' select count(*) from houseowners where typekod='+OWNER_ORG_STR+' and kod='+sID+
        ' union all  '+
        ' select count(*) from houseowners where date_fiks=''1899-12-30'' and kod='+sID+
        ' union all  '+
        ' select count(*) from houseownershist where kod='+sID+
        ' union all  '+
        ' select count(*) from Население where work_spr='+sID+' and date_fiks=''1899-12-30'' ';
    {$IFEND}
  {$ENDIF}
  if WorkQuery.SQL.Text<>'' then begin
    OpenMessage('Проверка организации ...','');
    try
      WorkQuery.Open;
    finally
      CloseMessage;
    end;
    s:='';
    ss:='';
    n:=1;
    lFind:=false;
    while not WorkQuery.Eof do begin
      nCount:=WorkQuery.Fields[0].AsInteger;
      if nCount>0 then begin
        lFind:=true;
        if ss='' then ss:='Организация присутствует:'+#13#10;
        case n of
          1: s:=s+'таблица вх.,исх.,адм.проц. (корреспондент) : '+IntToStr(nCount)+#13#10;
          2: s:=s+'таблица собственников (полное) : '+IntToStr(nCount)+#13#10;
          3: s:=s+'таблица собственников (текущее сост.) : '+IntToStr(nCount)+#13#10;
          4: s:=s+'таблица истории собственников : '+IntToStr(nCount)+#13#10;
          5: s:=s+'таблица населения (место работы) : '+IntToStr(nCount)+#13#10;
        end;
      end;
      WorkQuery.Next;
      Inc(n,1);
    end;
    WorkQuery.Close;
    if lFind then begin
      s := ss+s+'Если Вы хотите удалить организацию из базы,'#13#10+'введите слово ДА в поле ввода';
      lDel:=OkWarning(s);
    end;
  end else  begin
    lDel:=true;
  end;
end;

initialization
  nLeftProgress:=0;
  nTopProgress :=0;
end.
