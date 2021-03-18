unit MetaTask;

{$I Task.inc}


interface

uses Windows, Classes, SysUtils, DataTask, FuncPr, FuncEh, DbFunc, FileCtrl,Graphics, Dialogs, IniFiles,
     {$IFDEF VER150} Variants, {$ENDIF}
     OpisEdit, fEditSpr, TaskParam,
     ToolCtrlsEh, db, tb2Item, Controls,
     SasaIniFile, Forms, kbmMemTable, SasaDbGrid,
     {$IFNDEF NOT_USE_REPORT}
       ReportTask, FR_Class, FR_DBSet, FR_View,
       {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
     {$ENDIF}
     {$IFDEF USE_LOGFILE} uLogToFile, {$ENDIF}
     {$IFDEF DATASET_AS_ADS} AdsData, AdsTable, AdsCnnct {$ENDIF}
     {$IFDEF USE_SCRIPT}
       ,Script,
       {$IFDEF RO_SCRIPT}
           ROPasScript,
       {$ELSE}
           PasScript,
       {$ENDIF}
       fEditScript
     {$ENDIF};

type

  TTypeWin = ( twModal, twNormal, twMDI );

  TMetatask = class;

  TUpdateParamsEvent = procedure(Meta : TMetaTask; const strName : String) of object;
  TUpdateParamsEvent2 = procedure(Meta : TMetaTask; var lOk : Boolean) of object;

  TMetaTask=class(TObject)
  private
    //----------------------------------
    FIniFile       : TSasaIniFile;
    FIniFileSpr    : TSasaIniFile;
    FIniFileLookUp : TSasaIniFile;
    FIniFileForms  : TSasaIniFile;
    FIniFilePrazdn : TSasaIniFile;
    FIniFileMainForm : TSasaIniFile;
    FIniFileReport : TSasaIniFile;
    FIniFileGurnal : TSasaIniFile;
    FIniFileLocal  : TSasaIniFile;
    FIniFileChoice : TSasaIniFile;
    FIniFileMeta   : TSasaIniFile;
    FMRUIniFile    : TSasaIniFile;
    FReSizeFields  : TSasaIniFile;
    FIniMainParams : TIniFile;

    FLastValues : TStringList;

    FArrHoliday : TArrStrings;  // массив дат праздников

    FTaskParam     : TTaskParameters;   // параметра задачи
    FNameFileTaskParameters: String;    // имя файла параметров задачи
    //----------------------------------
    FListData : TList;
    FListOpisEdit : TList;
    FArrNameParam : TArrStrings;
    FArrValueParam : TArrVariant;
    FPathService: String;
    {$IFNDEF NOT_USE_REPORT}
      FfrReport: TfrReport;
      {$IFDEF USE_FR3}
        FfrxReport : TfrxReport;
      {$ENDIF}
    {$ENDIF}
    FRound: Integer;
    FUchetValut : Integer;
    FCurrentDate: TDateTime;
    FTypeWinEditSpr: TTypeWin;

    arrGlobName : TArrStrings;
    arrGlobVar  : TArrVariant;

    {$IFDEF USE_SCRIPT}
      FScript: TScript;
    {$ELSE}
      FScript: TObject;
    {$ENDIF}
    FKodCurDok:String;
    FOnUpdateParams: TUpdateParamsEvent;
    FOnCheckStringFilter: TCheckStringFilter;
    FPathWorkDir: String;
    FPathPersonal: String;
    FNameFileMainScript : String;
    FNameFileReportsIni : String;
    FLastError: String;
    FPathParam: String;
    FOnAfterEditParams: TUpdateParamsEvent;  // не используется
    FOnAfterSaveParams: TUpdateParamsEvent;
    FOnBeforeEditParams: TUpdateParamsEvent2;
    FOnBeforeSaveParams: TUpdateParamsEvent2;
    FPathSQLFiles: String;
    FDemoVersion : Boolean;
    FEnabledSaveParams : Boolean;
    FOnlyLocalParams:Boolean; // доступно сохранение только локальных параметров !!!
//----------------------------------------------------------------------------------
    FCurIdBase:Integer;
//----------------------------------------------------------------------------------

//    FidMetaCurDok : String;
    function GetCountDataTask: Integer;
    function GetDataTask(Index: Integer): TdmTask;
    procedure SetDataTask(Index: Integer; const Value: TdmTask);
    function SeekIndexDataTask( strName : String) : Integer;
    function GetCountOpisEdit: Integer;
    function GetOpisEdit(Index: Integer): TListOpisEdit;
    procedure SetOpisEdit(Index: Integer; const Value: TListOpisEdit);
    procedure SetOnCheckStringFilter(const Value: TCheckStringFilter);
    function  GetUserID: String;
    procedure SetPathService(const Value: String);
    {$IFNDEF NOT_USE_REPORT}
      procedure SetfrReport(const Value: TfrReport);
      {$IFDEF USE_FR3}
        procedure SetfrxReport(const Value: TfrxReport);
      {$ENDIF}
    {$ENDIF}
    procedure SetRound(const Value: Integer);
    function  GetRound: Integer;
    function  GetUchetValut: Boolean;
    procedure SetUschetValut(const Value: Boolean);
    procedure SetCurrentDate(const Value: TDateTime);
    function GetCurrentDate: TDateTime;

    procedure SetTypeWinEditSpr(const Value: TTypeWin);
    procedure SetTypeSaveLookUpSpr(const Value: Integer);
    function  GetTypeSaveLookUpSpr : Integer;
    procedure SetNameFileTaskParameters(const Value: String);
    procedure SetNameFileReportsIni(const Value: String);
    procedure SetOnUpdateParams(const Value: TUpdateParamsEvent);

    procedure LoadLastValues;
    procedure SaveLastValues;
    procedure SetPathWorkDir(const Value: String);
    {$IFDEF USE_LOGFILE}
      function GetLogFile: TLogToFile;
    {$ENDIF}

    procedure SetLastError(const Value: String);
    procedure SetPathParam(const Value: String);
    procedure SetOnAfterSaveParams(const Value: TUpdateParamsEvent);
    procedure SetOnAfterEditParams(const Value: TUpdateParamsEvent);
    procedure SetOnBeforeSaveParams(const Value: TUpdateParamsEvent2);
    procedure SetOnBeforeEditParams(const Value: TUpdateParamsEvent2);
    procedure SetPathSQLFiles(const Value: String);
    procedure SetPathPersonal(const Value: String);
    procedure SetDemoVersion( Value : Boolean);
  public
//    property idMetaCurDok : String read FidMetaCurDok write SetidMetaCurDok;
    FLogTypes:String;
    property EnabledSaveParams : Boolean read FEnabledSaveParams write FEnabledSaveParams;
    property OnlyLocalParams : Boolean read FOnlyLocalParams write FOnlyLocalParams;
    procedure WriteToLogFile(sSoob:String; slPar:TStringList=nil; nTypeLog:Integer=0);
    property LastError : String read FLastError write SetLastError;
    property DemoVersion : Boolean read FDemoVersion write SetDemoVersion;
    function GetPathService:String;
    function GetLastValueAsBoolean( strName : String ) : Boolean;
    function GetLastValueAsString( strName : String ) : String;
    function GetLastValueAsInteger( strName : String ) : Integer;
    function GetLastValueAsDate( strName : String; lDefNow:Boolean=true) : TDateTime;
    procedure SetLastValueAsBoolean( strName : String; Value : Boolean );
    procedure SetLastValueAsString( strName : String; Value : String );
    procedure SetLastValueAsInteger( strName : String; Value : Integer );
    procedure SetLastValueAsDate( strName : String; Value : TDateTime );

    procedure SetKodCurDok(sKod:String);
    function  GetKodCurDok:String;

    function  GetParamFieldFromKod(sKod: String): TField;
    function  GetParamEditFromKod(sKod: String): TControl;
    property  OnAfterEditParams : TUpdateParamsEvent read FOnAfterEditParams write SetOnAfterEditParams;
    property  OnBeforeSaveParams : TUpdateParamsEvent2 read FOnBeforeSaveParams write SetOnBeforeSaveParams;
    property  OnBeforeEditParams : TUpdateParamsEvent2 read FOnBeforeEditParams write SetOnBeforeEditParams;
    property  OnAfterSaveParams : TUpdateParamsEvent read FOnAfterSaveParams write SetOnAfterSaveParams;
    property  OnUpdateParams : TUpdateParamsEvent read FOnUpdateParams write SetOnUpdateParams;
    property  OnCheckStringFilter : TCheckStringFilter read FOnCheckStringFilter write SetOnCheckStringFilter;

    property  CurrentDate : TDateTime read GetCurrentDate write SetCurrentDate;

    {$IFNDEF NOT_USE_REPORT}
    property  frReport : TfrReport read FfrReport write SetfrReport;
    {$IFDEF USE_FR3}
      property  frxReport : TfrxReport read FfrxReport write SetfrxReport;
    {$ENDIF}

    {$ENDIF}
    procedure SetEnablePrintReport(lSet : Boolean);

    {$IFDEF USE_SCRIPT}
    property  Script   : TScript read FScript;
    {$ENDIF}
    function  NameFileMainScript : String;
    procedure SetNameFileMainScript( strNameFile : String );
    function  CompileMainScript : Boolean;
    function  CreateMainScript : Boolean;
    function  EditScript : Boolean;

    procedure ClearWorkParam;
    procedure SetWorkParam( strName : String; Value : Variant);
    function  GetWorkParam( strName : String) : Variant;
    function  PathMainData : String;
    function  PathTemplate : String;

    function  PathServiceMain : String;      //  две одінаковые функціі
    function  GetPathServiceMain : String;   //  две одінаковые функціі

    function  MainDataBaseName : String;
    function  MainConnect : TAdsConnection;
    function  MainDataTask: TdmTask;
    function  GlobalPar : TGlobalPar;
    property  PathParam : String read FPathParam write SetPathParam;
    property  PathService : String read GetPathService write SetPathService;
    property  PathWorkDir : String read FPathWorkDir write SetPathWorkDir;
    property  PathSQLFiles: String read FPathSQLFiles write SetPathSQLFiles;
    property  PathPersonal : String  read FPathPersonal write SetPathPersonal;
    property  NameFileTaskParameters : String read FNameFileTaskParameters write SetNameFileTaskParameters;
    property  NameFileReportsIni :String read FNameFileReportsIni write SetNameFileReportsIni;
    function  NameFileLocalParameters : String;
    function  ExecuteSQL(strSQL : String; lCloseSQL : Boolean) : String;
    function  getCommentTable(strTableName:String; lSetName:Boolean) : String;

    procedure EditParameters;
    procedure ViewParameters;
    procedure AdminParameters;
    procedure SetEditEventParameter(strName : String; vEvent : TButtonClickEventEh; vEventText : TFieldGetTextEvent; vEventUpdate : TUpdateDataEventEh);
    procedure SetEventParameter(strName : String; vEvent : TNotifyEvent);
    function UpdateParameters( strFileName : String; lDelMissing : Boolean ) : Boolean;
    function RestoreParameters( strFileName,strFileNameL : String ) : Boolean;
//    function  ParamCount : Integer;
    procedure SaveParameters;
    function  WriteParamAsString( strName : String; strValue : String) : Boolean;
    function  WriteParamAsDate( strName : String; dDate:TDateTime) : Boolean;
    function  ParamAsStringDef(strName: String; sDef:String): String;
    function  ParamAsString( strName : String) : String;
    function  ParamAsFloat( strName : String) : Extended;
    function  ParamAsInteger( strName : String) : Integer;
    function  ParamAsInt64( strName : String) : Int64;
    function  ParamAsBoolean( strName : String) : Boolean;
    function  ParamAsDate(strName: String): TDateTime;
    function  ParamAsName(strName: String; lKrat : Boolean): String;
    function  GetMainParam(sSect,sName:String; sType:String; vDef:Variant): Variant;
    function  SetMainParam(sSect,sName,sType:String; vVal:Variant): Boolean;
    procedure ErrorIfNotFoundParam( lSet : Boolean );
    function  SeekDataTask( strName : String) : TdmTask;
    function  AddDataTask( dmNew : TdmTask) : Boolean;
    function  DelDataTask( dmNew : TdmTask) : Boolean;
    property  DataTaskCount : Integer read GetCountDataTask;
    property  DataTask[Index : Integer] : TdmTask read GetDataTask write SetDataTask;
    function  SeekIndexOpisEdit(strName: String): Integer;
    function  CreateOpisEdit( FileName : String): Boolean;
    function  CurrentOpisEdit : TListOpisEdit;
    function  AddOpisEdit( Opis : TListOpisEdit) : Boolean;
    function  DelOpisEdit( Opis : TListOpisEdit) : Boolean;
    property  OpisEditCount : Integer read GetCountOpisEdit;
    property  OpisEdit[Index : Integer] : TListOpisEdit read GetOpisEdit write SetOpisEdit;
    function  CreateIniFileWork(strFileName: String): TSasaIniFile;
    function  CreateMainIniFile(strFileName: String): TIniFile;
    function  CreateIniFile(strFileName: String): TSasaIniFile;
    function  IniFile( strName : String; lCrear:Boolean=false) : TSasaIniFile;
    function  ClearIniFile(strName: String): TSasaIniFile;

    property  UserID : String read GetUserID;
    property  Round : Integer read GetRound write SetRound;
    property  UchetValut : Boolean read GetUchetValut write SetUschetValut;
    procedure FreeIni;
    procedure UpdateIni;
    procedure TaskException(Sender: TObject; E: Exception);
    function  PropForm : String;
    procedure ClearLoadsParam;
    function OpenDataSetAsTable( strCompName : String; strTableName : String;
                     lEnableEdit : Boolean; var strErr : String) : TAdsTable;
    function OpenDataSetAsQuery( strCompName : String; strSQL : String;
                     lEnableEdit : Boolean; var strErr : String) : TAdsQuery;
    //-----------------------------------------------------------------
    property TypeWinEditSpr : TTypeWin read FTypeWinEditSpr write SetTypeWinEditSpr; // тип окна для редактирование справочника
    function EditSpr( strNameOpis : String; Param : TParamsEditSpr):Boolean;
    // тип сохранения параметров грида в форма fLookUp.pas
    property  TypeSaveLookUpSpr : Integer read GetTypeSaveLookUpSpr write SetTypeSaveLookUpSpr;
    function  CheckDeleteSpr(OpisEdit:TOpisEdit):Boolean;

    //----------------------------
    procedure SetEnabledDuplex( lSet:Boolean );
    procedure WorkReport(lDesign:Boolean; strNameReport : String );
    procedure DesignTailReport( strNameReport : String );
    procedure DesignAllReports;
    procedure DesignAllReports3;
    procedure DesignReport;
    procedure SetPathReport(strPath : String);
    procedure ReadOffsetReport;
    function  MenuReport(strId: String):String;
    procedure PreViewReport(strId: String);
    procedure PrintReport(strId: String);
    procedure FastPrintReport(strId: String);
    function  CountReport(strId: String) : Integer;
    procedure ListReport(strId: String; slReports : TStringList);
    function  GetReportId:Integer;
    procedure SetReportId(nID:Integer);

    procedure Report_SetCountEkz(n:Integer);
    procedure Report_SetDuplexMode(s:String);
    function  GetNomerEkz:Integer;

    function CreateMenuReport( Sub : TTBSubmenuItem; slReports : TStringList;lCreateSub : Boolean) : Boolean;

    //----------------------------
    procedure ReadMRUList(sl:TStringList; cSect:String);
    procedure WriteMRUList(sl:TStringList; cSect:String);
    procedure SetMRUListForm( Form : TForm );
    procedure SaveMRUListForm( Form : TForm );
    function MFO3( strKod : String) : String;
    function MFO9( strKod : String) : String;

    {$IFDEF USE_LOGFILE}
    property LogFile : TLogToFile read GetLogFile;
    {$ENDIF}

    function IsOffDay( vYear, vMonth, vDay : Variant) : Boolean; // выходной или праздничный день


    function CreateReportTable(strNameTable : String; lFRDataSet : Boolean) : Boolean;
    function FindReportTable(strNameTable: String): TDataSet;
    function FreeReportTable(strNameTable : String) : Boolean;
    procedure FreeReportTables;

//--------------------------------------------------------------------------
    procedure SetCurIdBase(n:Integer);
    function GetCurIdBase:Integer;
    function GetCurIdBase2Field:Integer;
    function AddWhereCurIdBase(sWhere:String; cAl:String):String;
//--------------------------------------------------------------------------
    constructor Create;
    destructor Destroy; override;
  end;

  TGlobalEditSpr=class(TObject)
  private
    FOnExportSpr: TNotifyEvent;
    procedure SetOnExportSpr(const Value: TNotifyEvent);
  public
    EnablePopupMenu : Boolean;
    OnlyRead : Boolean;
    property OnExportSpr : TNotifyEvent read FOnExportSpr write SetOnExportSpr;
    constructor Create;
    destructor Destroy; override;
  end;


  procedure RegisterDataTask( Data : TdmTask);
  procedure RegisterOpisEdit( Opis : TListOpisEdit);
  procedure UnRegisterOpisEdit( Opis : TListOpisEdit);



var
  GlobalTask : TMetaTask;
  GlobalEditSpr : TGlobalEditSpr;

implementation

uses {$IFNDEF NOT_USE_REPORT} fEditAllReports,
       {$IFDEF USE_FR3} fEditAllReports3, {$ENDIF}
     {$ENDIF}
     DBCtrlsEh, DBGridEh, uTypes;

procedure RegisterDataTask( Data : TDMTask);
begin
  GlobalTask.AddDataTask(Data);
end;

procedure RegisterOpisEdit( Opis : TListOpisEdit);
begin
  GlobalTask.AddOpisEdit(Opis);
end;

procedure UnRegisterOpisEdit( Opis : TListOpisEdit);
begin
  GlobalTask.DelOpisEdit(Opis);
end;


{ TMetaTask }

constructor TMetaTask.Create;
begin
  inherited Create;
  FOnCheckStringFilter:=nil;
  FEnabledSaveParams:=true;
  FOnlyLocalParams:=false;
  FKodCurDok:='';
  FDemoVersion := false;
  FNameFileMainScript := 'prog.pas';
  FNameFileReportsIni:='reports.ini';
  FLogTypes:='';
  FPathParam   := '';
  FPathSQLFiles:= 'SQL';
  FIniMainParams :=nil;
  FIniFile       :=nil;
  FIniFileSpr    :=nil;
  FIniFileLookUp :=nil;
  FIniFileForms  :=nil;
  FIniFilePrazdn :=nil;
  FIniFileReport :=nil;
  FIniFileGurnal :=nil;
  FIniFileLocal  :=nil;
  FIniFileChoice :=nil;
  FIniFileMeta   :=nil;
  FMRUIniFile    :=nil;
  FReSizeFields  := nil;
  FLastValues := TStringList.Create;
  FScript:=nil;
  FListData := TList.Create;
  FListOpisEdit := TList.Create;
  PathService := CheckSleshN(ExtractFilePath(Application.ExeName))+'SERVICE\';
//  PathSaveDok := CheckSleshN(ExtractFilePath(Application.ExeName))+'SAVEDOK\';
  PathWorkDir := CheckSleshN(ExtractFilePath(Application.ExeName))+'Work\';
  PathPersonal:= CheckSleshN(ExtractFilePath(Application.ExeName))+'PERSONAL\';
  FCurrentDate := Now;
  ClearWorkParam;
  ClearLoadsParam;
  SetLength(arrGlobName,0);
  SetLength(arrGlobVar,0);
  FOnUpdateParams := nil;
  FOnAfterEditParams := nil;
  FOnAfterSaveParams := nil;
  FOnBeforeSaveParams := nil;
  FOnBeforeEditParams := nil;
  SetLength(FArrHoliday,0);
  FCurIdBase:=-1;
  Application.OnException := TaskException;

  //  strFile := strMainPath+'SERVICE\KeyList.ini';
//  ListOpisEdit := TListOpisEdit.Create(strFile);
end;

destructor TMetaTask.Destroy;
var
  i : Integer;
begin
  ClearWorkParam;
  FListData.Free;
  for i:=0 to OpisEditCount-1 do begin
    if OpisEdit[i]<>nil then begin
      try
      if (OpisEdit[i].Owner<>nil) and (OpisEdit[i].Owner=Self) then begin
        OpisEdit[i].Free;   
      end;
      except       
      end;
    end;
  end;
  FListOpisEdit.Free;
//  UpdateIni;    !!!   необходимо вызывать вручную
  FreeIni;
  SetLength(arrGlobName,0);
  SetLength(arrGlobVar,0);
  SaveLastValues;
  FLastValues.Free;
  inherited Destroy;
end;

procedure TMetaTask.FreeIni;
begin
  FIniMainParams.Free;
  FIniFile.Free;
  FIniFileSpr.Free;
  FIniFileLookUp.Free;
  FIniFileForms.Free;
  FIniFilePrazdn.Free;
  FIniFileMainForm.Free;
  FIniFileReport.Free;
  FIniFileGurnal.Free;
  FIniFileLocal.Free;
  FIniFileChoice.Free;
  FIniFileMeta.Free;
  FMRUIniFile.Free;
  FReSizeFields.Free;
end;

procedure TMetaTask.UpdateIni;
begin
  if FIniFile<>nil then FIniFile.UpdateFile;
  if FIniFileSpr<>nil then FIniFileSpr.UpdateFile;
  if FIniFileLookUp<>nil then FIniFileLookUp.UpdateFile;
  if FIniFileForms<>nil then FIniFileForms.UpdateFile;
  if FIniFileMainForm<>nil then FIniFileMainForm.UpdateFile;
  if FIniFileReport<>nil then FIniFileReport.UpdateFile;
  if FIniFileGurnal<>nil then FIniFileGurnal.UpdateFile;
  if FIniFileLocal<>nil then FIniFileLocal.UpdateFile;
  if FIniFileChoice<>nil then FIniFileChoice.UpdateFile;
  if FIniFileMeta<>nil then FIniFileMeta.UpdateFile;
  if FMRUIniFile<>nil then FMRUIniFile.UpdateFile;
  if FReSizeFields<>nil then FReSizeFields.UpdateFile;
end;

function TMetaTask.GetCountDataTask: Integer;
begin
  Result := FListData.Count;
end;

function TMetaTask.GetDataTask(Index: Integer): TdmTask;
begin
  if (Index>=0) and (Index < DataTaskCount) then begin
    Result := TdmTask(FListData.Items[Index]);
  end else begin
    Result := nil;
  end;
end;

procedure TMetaTask.SetDataTask(Index: Integer; const Value: TdmTask);
begin
  if (Index>=0) and (Index < DataTaskCount) then begin
    FListData.Items[Index] := Value;
  end;
end;

procedure TMetaTask.SetDemoVersion( Value : Boolean);
begin
  FDemoVersion := Value;
end;

function TMetaTask.GetPathService:String;
begin
  Result:=FPathService;
end;

function TMetaTask.SeekIndexDataTask(strName: String): Integer;
var
  i : Integer;
begin
  Result:=-1;
  strName:=ANSIUpperCase(Trim(strName));
  for i:=0 to DataTaskCount-1 do begin
    if ANSIUpperCase(DataTask[i].Name)=strName then begin
      Result := i;
      exit;
    end;
  end;
end;

function TMetaTask.SeekDataTask(strName: String): TdmTask;
var
  i : Integer;
begin
  Result:=nil;
  i := SeekIndexDataTask(strName);
  if i > -1 then begin
    Result := DataTask[i];
  end;
end;

function TMetaTask.AddDataTask(dmNew: TdmTask): Boolean;
var
  i : Integer;
begin
  i := SeekIndexDataTask(dmNew.Name);
  Result := false;
  if i = -1 then begin
    if DataTaskCount = 0 then begin
      SetDataModuleForTables(dmNew);
    end;
    FListData.Add(dmNew);
    Result:=true;
  end else begin
    if DataTaskCount = 1 then begin
      SetDataModuleForTables(dmNew);
    end;
    FListData.Items[i]:=dmNew;
  end;
end;

function TMetaTask.DelDataTask(dmNew: TdmTask): Boolean;
var
  i : Integer;
begin
  i := SeekIndexDataTask(dmNew.Name);
  Result := false;
  if i > -1 then begin
    FListData.Delete(i);
    Result:=true;
  end;
end;

//-----------------------------------------------------------------------------------
// для доступа в режиме открытой формы редактирования параметров
//-----------------------------------------------------------------------------------
function TMetaTask.GetParamFieldFromKod(sKod: String): TField;
begin
  if FTaskParam=nil then begin
    Result:=nil;
  end else begin
    Result := FTaskParam.GetFieldFromKod(sKod);
  end;
end;
function TMetaTask.GetParamEditFromKod(sKod: String): TControl;
begin
  if FTaskParam=nil then begin
    Result:=nil;
  end else begin
    Result := FTaskParam.GetEditFromKod(sKod);
  end;
end;

function TMetaTask.ParamAsStringDef(strName: String; sDef:String): String;
begin
  Result:=ParamAsString(strName);
  if Result=''
    then Result:=sDef;
end;

function TMetaTask.ParamAsString(strName: String): String;
var
  i : Integer;
  lOk : Boolean;
begin
  Result:='';
  lOk:=false;
  if FTaskParam<>nil then begin
    Result := FTaskParam.ParamAsString(strName);
    if Result<>'' then lOk:=true;
  end;
  if not lOk then begin
    for i:=0 to DataTaskCount-1 do begin
      Result := DataTask[i].ParamAsString(strName);
      if Result <> '' then break;
    end;
    if Result<>'' then begin
      if Pos('<CRLF>',Result) > 0 then begin
        Result := StringReplace(Result,'<CRLF>',#13#10,[rfReplaceAll, rfIgnoreCase]);
      end;
    end;
  end;
end;

function TMetaTask.ParamAsName(strName: String; lKrat: Boolean): String;
begin
  Result:='';
  if FTaskParam<>nil then begin
    Result := FTaskParam.ParamAsName(strName, lKrat);
  end;
end;

function TMetaTask.ParamAsDate(strName: String): TDateTime;
//var
//  i : Integer;
//  s : String;
begin
  Result:=Now;
  if FTaskParam<>nil then begin
    Result := FTaskParam.ParamAsDate(strName);
  end;
end;

function TMetaTask.ParamAsBoolean(strName: String): Boolean;
//var
//  i : Integer;
//  s : String;
begin
  Result:=false;
  if FTaskParam<>nil then begin
    Result := FTaskParam.ParamAsBoolean(strName);
  end;
{  for i:=0 to DataTaskCount-1 do begin
    s := ANSIUpperCase(Trim(DataTask[i].ParamAsString(strName)));
    if (s='TRUE') or (s='1') or (s='ДА') then begin
      Result := true;
      exit;
    end;
  end;   }
end;

function TMetaTask.ParamAsFloat(strName: String): Extended;
begin
  Result:=0;
  if FTaskParam<>nil then begin
    Result := FTaskParam.ParamAsFloat(strName);
  end;
end;

function TMetaTask.ParamAsInteger(strName: String): Integer;
begin
  Result:=0;
  if FTaskParam<>nil then begin
    Result := FTaskParam.ParamAsInteger(strName);
  end;
end;

function TMetaTask.ParamAsInt64(strName: String): Int64;
begin
  Result:=0;
  if FTaskParam<>nil then begin
    Result := FTaskParam.ParamAsInt64(strName);
  end;
end;

{
function TMetaTask.ParamCount: Integer;
var
  i : Integer;
begin
  Result:=0;
  for i:=0 to DataTaskCount-1 do begin
    Result := Result + DataTask[i].ParamCount;
  end;
end;
}
function TMetaTask.GlobalPar: TGlobalPar;
begin
  Result := MainDataTask.GlobalPar;
end;

function TMetaTask.MainDataTask: TdmTask;
var
  i : Integer;
begin
  Result:=nil;
  for i:=0 to DataTaskCount-1 do begin
    if DataTask[i].AdsConnection<>nil then begin
      Result := DataTask[i];
      exit;
    end;
  end;
end;

//----------------------------------------------------
function TMetaTask.MainConnect: TAdsConnection;
begin
  Result:=MainDataTask.AdsConnection;
end;

//----------------------------------------------------
function TMetaTask.PathTemplate : String;
begin
  Result := ExtractFilePath(Application.ExeName)+'Template';
end;

//------ путь к папке service на главном компьютере  -------
function TMetaTask.PathServiceMain : String;
var
  s:String;
begin
  if FPathParam=''
    then s := FPathService
    else s := FPathParam;
  Result:=CheckSleshN(s);
end;
function TMetaTask.GetPathServiceMain : String;
begin
  Result:=PathServiceMain;
end;

//----------------------------------------------------
function TMetaTask.PathMainData: String;
var
  j : Integer;
  s : String;
begin
  Result:=MainDataTask.AdsConnection.ConnectPath;
  if Result <> '' then begin
    j:=Pos('.add',Result);
    if j = 0 then begin // работаем не со словарем
      Result := CheckSleshN(Result);
    end else begin
      s := Copy(Result,1,j-1);
      j := LastPos('\',s);
      Result := Copy(s,1,j);
    end;
  end;
end;

//----------------------------------------------------
function TMetaTask.MainDataBaseName : String;
begin
  Result:=MainDataTask.AdsConnection.Name;
end;

function TMetaTask.ExecuteSQL(strSQL : String; lCloseSQL : Boolean) : String;
begin
  Result:='Неизвестена база данных';
  if DataTaskCount > 0 then begin
    try
      with DataTask[0] do begin
        WorkQuery.Active:=false;
        if lCloseSQL then WorkQuery.AdsCloseSQLStatement;
        WorkQuery.SQL.Text := strSQL;
        WorkQuery.ExecSQL;
        WorkQuery.Active:=false;
        if lCloseSQL then WorkQuery.AdsCloseSQLStatement;
        Result:='';
      end;
    except
      on E:Exception do begin
        Result:=E.Message;
      end;
    end;
  end;
end;

function TMetaTask.getCommentTable(strTableName:String; lSetName:Boolean) : String;
begin
  Result:='';
  if DataTaskCount > 0 then begin
    Result:=DataTask[0].GetCommentTable(strTableName,true);
  end;
  if (Result='') and lSetName
    then Result:=FirstCharUpper(strTableName);
end;

function TMetaTask.SeekIndexOpisEdit(strName: String): Integer;
var
  i : Integer;
begin
  Result:=-1;
  strName:=ANSIUpperCase(Trim(strName));
  for i:=0 to OpisEditCount-1 do begin
    if ANSIUpperCase(OpisEdit[i].Name)=strName then begin
      Result := i;
      exit;
    end;
  end;
end;

function TMetaTask.CreateOpisEdit( FileName : String): Boolean;
var
  Opis: TListOpisEdit;
begin
  Opis := TListOpisEdit.Create(FileName);
  Opis.Owner:=Self;
  if OpisEditCount = 0 then begin
    SetGlobalListOpis(Opis);
  end;
  FListOpisEdit.Add(Opis);
  Result:=true;
end;

function TMetaTask.AddOpisEdit(Opis: TListOpisEdit): Boolean;
var
  i : Integer;
begin
  i := SeekIndexOpisEdit(Opis.Name);
  Result := false;
  if i = -1 then begin
    if OpisEditCount = 0 then begin
      SetGlobalListOpis(Opis);
    end;
    FListOpisEdit.Add(Opis);
    Result:=true;
  end;
end;

function TMetaTask.DelOpisEdit(Opis: TListOpisEdit): Boolean;
var
  i : Integer;
begin
  i := SeekIndexOpisEdit(Opis.Name);
  Result := false;
  if i > -1 then begin
    FListOpisEdit.Delete(i);
    if (Opis.Owner<>nil) and (Opis.Owner=Self) then begin
      FreeAndNil(Opis);
    end;
    Result:=true;
  end;
end;

function TMetaTask.GetCountOpisEdit: Integer;
begin
  Result := FListOpisEdit.Count;
end;

function TMetaTask.GetOpisEdit(Index: Integer): TListOpisEdit;
begin
  if (Index>=0) and (Index < OpisEditCount) then begin
    Result := TListOpisEdit(FListOpisEdit.Items[Index]);
  end else begin
    Result := nil;
  end;
end;

function TMetaTask.CurrentOpisEdit : TListOpisEdit;
begin
  if (OpisEditCount>0) then begin
    Result := TListOpisEdit(FListOpisEdit.Items[0]);
  end else begin
    Result := nil;
  end;
end;

procedure TMetaTask.SetOpisEdit(Index: Integer; const Value: TListOpisEdit);
begin
  if (Index>=0) and (Index < OpisEditCount) then begin
    FListOpisEdit.Items[Index] := Value;
  end;
end;


procedure TMetaTask.ClearWorkParam;
begin
  SetLength(FArrNameParam,0);
  SetLength(FArrValueParam,0);
end;

function TMetaTask.GetWorkParam(strName: String): Variant;
var
  i : Integer;
begin
  strName:=ANSIUpperCase(Trim(strName));
  Result:=null;
  for i:=Low(FArrNameParam) to High(FArrNameParam) do begin
    if FArrNameParam[i]=strName then begin
      Result:=FArrValueParam[i];
    end;
  end;
end;


procedure TMetaTask.SetWorkParam(strName: String; Value: Variant);
var
  i : Integer;
  lFind : Boolean;
begin
  strName:=ANSIUpperCase(Trim(strName));
  lFind:=false;
  for i:=Low(FArrNameParam) to High(FArrNameParam) do begin
    if FArrNameParam[i]=strName then begin
      lFind:=true;
      FArrValueParam[i] := Value;
    end;
  end;
  if not lFind then begin
    i:=Length(FArrNameParam);
    SetLength(FArrNameParam, i+1);
    FArrNameParam[i]:=strName;
    SetLength(FArrValueParam, i+1);
    FArrValueParam[i]:=Value;
  end;
end;

function TMetaTask.CreateIniFile(strFileName: String): TSasaIniFile;
var
  s, strPath : String;
begin
  s:='';
//  if UserID='' then s:=''
//               else s:=UserID+'\';
  strPath := PathService+s;
  ForceDirectories(strPath);
  Result := TSasaIniFile.Create(strPath+strFileName);
end;

function TMetaTask.CreateIniFileWork(strFileName: String): TSasaIniFile;
var
  s, strPath : String;
begin
  s:='';
//  if UserID='' then s:=''
//               else s:=UserID+'\';
  strPath := PathWorkDir+s;
  ForceDirectories(strPath);
  Result := TSasaIniFile.Create(strPath+strFileName);
end;

function TMetaTask.CreateMainIniFile(strFileName: String): TIniFile;
var
  strPath : String;
begin
  strPath := PathServiceMain;
  ForceDirectories(strPath);
  Result := TIniFile.Create(strPath+strFileName);
end;

function TMetaTask.ClearIniFile(strName: String): TSasaIniFile;
var
  s:String;
begin
  Result:=nil;
  if strName='LOCAL' then begin  // !!! пока только для LOCAL !!!
    iniFile(strName);
    s:=FIniFileLocal.FileName;
    FreeAndNil(FIniFileLocal);
    DeleteFile(s);
    FIniFileLocal:=CreateiniFileWork('Local.ini');
    Result:=FIniFileLocal;
  end else if strName='FORMCHOICE' then begin
    iniFile(strName);
    s:=FIniFileChoice.FileName;
    FreeAndNil(FIniFileChoice);
    DeleteFile(s);
    FIniFileChoice:=CreateiniFileWork('FormChoice.ini');
    Result:=FIniFileChoice;
  end else begin
    PutError('Ошибка вызова ClearIniFile("'+strName+'"');
  end;
end;

function TMetaTask.iniFile(strName: String; lCrear:Boolean): TSasaIniFile;
var
  strFile,strPath : String;
begin
  strName := UpperCase(Trim(strName));
  if strName = 'SPR' then begin
    if FIniFileSpr=nil then begin
      FIniFileSpr := CreateiniFile('ConfSpr.ini')
    end;
    Result := FIniFileSpr;
  end else if strName = 'METATASK' then begin
    if FIniFileMeta=nil then begin
      FIniFileMeta := CreateiniFile('ConfMeta.ini')
    end;
    Result := FIniFileMeta;
  end else if strName = 'FORM' then begin
    if FIniFileForms=nil then begin
      FIniFileForms := CreateiniFile('ConfForms.ini')
    end;
    Result := FIniFileForms;
  end else if Copy(strName,1,4) = 'PRAZ' then begin
    if FIniFilePrazdn=nil then begin
      FIniFilePrazdn := CreateiniFile('Prazdniki.ini')
    end;
    Result := FIniFilePrazdn;
  end else if strName = 'GURNAL' then begin
    if FIniFileGurnal=nil then begin
      FIniFileGurnal := CreateiniFile('ConfGurnal.ini')
    end;
    Result := FIniFileGurnal;
  end else if strName = 'LOCAL' then begin
    if FIniFileLocal=nil then begin
      FIniFileLocal := CreateiniFileWork('Local.ini')
    end;
    Result := FIniFileLocal;
  end else if strName = 'FORMCHOICE' then begin
    if FIniFileChoice=nil then begin
      FIniFileChoice := CreateiniFileWork('FormChoice.ini')
    end;
    Result := FIniFileChoice;
  end else if strName = 'MAINFORM' then begin
    if FIniFileMainForm=nil then begin
      FIniFileMainForm := CreateiniFile('ConfMainForm.ini')
    end;
    Result := FIniFileMainForm;
  end else if strName = 'LOOKUP' then begin
    if FIniFileLookUp=nil then begin
      FIniFileLookUp := CreateiniFile('ConfLookUp.ini')
    end;
    Result := FIniFileLookUp;
  end else if strName = 'REPORT' then begin
    if FIniFileReport=nil then begin
      strPath := CheckSleshN(ExtractFilePath(Application.ExeName))+'REPORT\';
      ForceDirectories(strPath);
      FIniFileReport := TSasaIniFile.Create(strPath+'Reports.ini');
    end;
    Result := FIniFileReport;
  end else if strName = 'MRULIST' then begin
    if FMRUIniFile=nil then begin
      FMRUIniFile := CreateiniFile(strPath+'MRUList.ini');
    end;
    Result := FMRUIniFile;
  end else if strName = 'RESIZE_FIELDS' then begin
    if FReSizeFields=nil then begin
      FReSizeFields := CreateiniFile(strPath+'ReSizeFields.ini');
    end;
    Result := FReSizeFields;
  end else begin
    if FIniFile=nil then begin
      FIniFile := CreateiniFile('Conf.ini')
    end;
    Result := FIniFile;
  end;
end;

function TMetaTask.GetUserID: String;
var
  i : Integer;
begin
  for i:=0 to DataTaskCount-1 do begin
    Result := DataTask[i].UserID;
    if Result <> '' then exit;
  end;
end;

procedure TMetaTask.TaskException(Sender: TObject; E: Exception);
var
  strErr : String;
begin
  if (E is EADSDatabaseError) then begin
    if (DataTaskCount>0) then begin
      strErr := DataTask[0].GetBaseError(E);
      if strErr <> ''
        then PutError(strErr)
        else Application.ShowException(E);
    end else begin
      Application.ShowException(E);
    end;
  end else begin
    Application.ShowException(E);
  end;
end;

procedure TMetaTask.SetPathService(const Value: String);
begin
  FPathService := Value;
end;


function TMetaTask.PropForm: String;
begin
  Result := ',Left,Top,Width,Height,WindowState,';
end;

procedure TMetaTask.DesignReport;
begin
  {$IFNDEF NOT_USE_REPORT}
  ReportTask.DesignReport;
  {$ENDIF}
end;

procedure TMetaTask.DesignAllReports;
begin
  {$IFNDEF NOT_USE_REPORT}
  fEditAllReports.DesignAllReports;
  {$ENDIF}
end;

procedure TMetaTask.DesignAllReports3;
begin
  {$IFNDEF NOT_USE_REPORT}
  {$IFDEF USE_FR3}
  fEditAllReports3.DesignAllReports3(FfrxReport);
  {$ENDIF}
  {$ENDIF}
end;

procedure TMetaTask.SetEnablePrintReport(lSet : Boolean);
begin
  {$IFNDEF NOT_USE_REPORT}
    if lSet then begin
      {$IFDEF USE_FR3}
      if not (frxClass.pbPrint in frxReport.PreviewOptions.Buttons)
        then frxReport.PreviewOptions.Buttons:=frxReport.PreviewOptions.Buttons+[frxClass.pbPrint];
      if not (frxClass.pbSave in frxReport.PreviewOptions.Buttons)
        then frxReport.PreviewOptions.Buttons:=frxReport.PreviewOptions.Buttons+[frxClass.pbSave];
      if not (frxClass.pbLoad in frxReport.PreviewOptions.Buttons)
        then frxReport.PreviewOptions.Buttons:=frxReport.PreviewOptions.Buttons+[frxClass.pbLoad];
      {$ENDIF}

      if not (fr_view.pbPrint in frReport.PreviewButtons) then begin
        frReport.PreviewButtons :=  frReport.PreviewButtons + [fr_view.pbPrint];
      end;
      if not (fr_view.pbSave in frReport.PreviewButtons) then begin
        frReport.PreviewButtons :=  frReport.PreviewButtons + [fr_view.pbSave];
      end;
      if not (fr_view.pbLoad in frReport.PreviewButtons) then begin
        frReport.PreviewButtons :=  frReport.PreviewButtons + [fr_view.pbLoad];
      end;
    end else begin
      {$IFDEF USE_FR3}
      if (frxClass.pbPrint in frxReport.PreviewOptions.Buttons)
        then frxReport.PreviewOptions.Buttons:=frxReport.PreviewOptions.Buttons-[frxClass.pbPrint];
      if (frxClass.pbSave in frxReport.PreviewOptions.Buttons)
        then frxReport.PreviewOptions.Buttons:=frxReport.PreviewOptions.Buttons-[frxClass.pbSave];
      if (frxClass.pbLoad in frxReport.PreviewOptions.Buttons)
        then frxReport.PreviewOptions.Buttons:=frxReport.PreviewOptions.Buttons-[frxClass.pbLoad];
      {$ENDIF}

      if fr_view.pbPrint in frReport.PreviewButtons then begin
        frReport.PreviewButtons :=  frReport.PreviewButtons - [fr_view.pbPrint];
      end;
      if fr_view.pbSave in frReport.PreviewButtons then begin
        frReport.PreviewButtons :=  frReport.PreviewButtons - [fr_view.pbSave];
      end;
      if fr_view.pbLoad in frReport.PreviewButtons then begin
        frReport.PreviewButtons :=  frReport.PreviewButtons - [fr_view.pbLoad];
      end;
    end;
  {$ENDIF}
end;

procedure TMetaTask.WorkReport(lDesign:Boolean; strNameReport : String );
begin
  if lDesign
    then DesignTailReport(strNameReport)
    else PreviewReport(strNameReport);
end;

procedure TMetaTask.DesignTailReport( strNameReport : String );
begin
  {$IFNDEF NOT_USE_REPORT}

  {$IFDEF USE_FR3}
    ReportTask.SetfrReport3(FfrxReport);
  {$ENDIF}

  ReportTask.DesignTailReport( strNameReport, FScript) ;
  {$ENDIF}
end;

procedure TMetaTask.SetPathReport(strPath: String);
begin
  {$IFNDEF NOT_USE_REPORT}
  ReportTask.SetPathForReports(strPath,FNameFileReportsIni);
  {$ENDIF}
end;

procedure TMetaTask.Report_SetCountEkz(n:Integer);
begin
  {$IFNDEF NOT_USE_REPORT}
  ReportTask.Report_SetCountEkz(n);
  {$ENDIF}
end;

procedure TMetaTask.Report_SetDuplexMode(s:String);
begin
  {$IFNDEF NOT_USE_REPORT}
  ReportTask.Report_SetDuplexMode(s);
  {$ENDIF}
end;

function  TMetaTask.GetNomerEkz:Integer;
begin
  {$IFNDEF NOT_USE_REPORT}
  Result:=ReportTask.GetNomerEkz;
  {$ELSE}
  Result:=1;
  {$ENDIF}
end;

//-----------------------------------------------
procedure TMetaTask.ReadOffsetReport;
var
  x,y : Integer;
begin
  if ParamAsBoolean('RAZDEL_OFFSET') and (FKodCurDok<>'') then begin
    x := ParamAsInteger('OFFSET_X'+FKodCurDok);
    y := ParamAsInteger('OFFSET_Y'+FKodCurDok);
  end else begin
    x := ParamAsInteger('OFFSET_REPORT_X');
    y := ParamAsInteger('OFFSET_REPORT_Y');
  end;
  {$IFNDEF NOT_USE_REPORT}
  ReportTask.SetOffsetReport(x,y);
  {$ENDIF}
end;

function TMetaTask.MenuReport(strId: String):String;
begin
  {$IFNDEF NOT_USE_REPORT}
  Result:=ReportTask.MenuReport(strID, FScript);
  {$ENDIF}
end;

procedure TMetaTask.PreViewReport(strId: String);
begin
  {$IFNDEF NOT_USE_REPORT}
  ReadOffsetReport;
  ReportTask.SetfrReport2(FfrReport);
  {$IFDEF USE_FR3}
    ReportTask.SetfrReport3(FfrxReport);
  {$ENDIF}
  ReportTask.PreViewReport(strId, FScript);
  {$ENDIF}
end;

procedure TMetaTask.PrintReport(strId: String);
begin
  {$IFNDEF NOT_USE_REPORT}
  ReadOffsetReport;
  ReportTask.SetfrReport2(FfrReport);
  {$IFDEF USE_FR3}
    ReportTask.SetfrReport3(FfrxReport);
  {$ENDIF}
  ReportTask.PrintReport(strId, FScript);
  {$ENDIF}
end;

procedure TMetaTask.FastPrintReport(strId: String);
begin
  {$IFNDEF NOT_USE_REPORT}
  ReadOffsetReport;
  ReportTask.SetfrReport2(FfrReport);
  {$IFDEF USE_FR3}
    ReportTask.SetfrReport3(FfrxReport);
  {$ENDIF}
  ReportTask.FastPrintReport(strId, FScript);
  {$ENDIF}
end;

function TMetaTask.CountReport(strId: String) : Integer;
begin
  {$IFNDEF NOT_USE_REPORT}
  Result := ReportTask.IDCountReport(strId);
  {$ENDIF}
end;

procedure TMetaTask.ListReport(strId: String; slReports : TStringList);
begin
  {$IFNDEF NOT_USE_REPORT}
  ReportTask.IDListReport(strId,slReports,FScript);
  {$ENDIF}
end;

function TMetaTask.GetReportId:Integer;
begin
  {$IFNDEF NOT_USE_REPORT}
  Result:=ReportTask.GetCurReportID;
  {$ELSE}
  Result:=0;
  {$ENDIF}
end;

procedure TMetaTask.SetReportId(nID:Integer);
begin
  {$IFNDEF NOT_USE_REPORT}
  ReportTask.SetCurReportID(nID);
  {$ENDIF}
end;

{$IFNDEF NOT_USE_REPORT}
procedure TMetaTask.SetfrReport(const Value: TfrReport);
begin
  FfrReport := Value;
end;
{$IFDEF USE_FR3}
procedure TMetaTask.SetfrxReport(const Value: TfrxReport);
begin
  FfrxReport := Value;
end;

{$ENDIF}

{$ENDIF}

function TMetaTask.NameFileMainScript : String;
begin
  if IsFullPath(FNameFileMainScript) then begin
    Result := FNameFileMainScript;
  end else begin
    Result := PathService+FNameFileMainScript;
  end;
end;

function TMetaTask.CreateMainScript : Boolean;
var
  lErr : Boolean;
  v : Variant;
begin
  lErr:=false;
  {$IFDEF USE_SCRIPT}
    if FScript<>nil then begin
      DestroyScript(FScript);
      FScript:=nil;
    end;
    FScript := CreateScript;
    with FScript do begin
      if not AddCode('&'+NameFileMainScript) then begin
        ShowMessage(MessageError(LastError));
        lErr := true;
      end;
      if not lErr then begin
        if not Compile then begin
          ShowMessage(MessageError(LastError));
          lErr := true;
        end;
      end;
    end;
    if lErr then begin
      DestroyScript(FScript);               
      FScript:=nil;
    end;
    Result := not lErr;
    if Result then begin
      FScript.MainFileScript := NameFileMainScript;
      FScript.RunEx('!MAIN',[],v);
      FScript.RunEx('INITSCRIPT',[],v);
    end;
  {$ELSE}
    FScript := nil;
    Result  := false;
  {$ENDIF}
end;

//---------------------------------------------------
function TMetaTask.CompileMainScript : Boolean;
var
  lErr : Boolean;
begin
  lErr:=false;
  {$IFDEF USE_SCRIPT}
    if FScript<>nil then begin
      DestroyScript(FScript);
      FScript:=nil;
    end;
    FScript := CreateScript;
    with FScript do begin
      if not AddModule('MAIN','&'+NameFileMainScript) then begin
        ShowMessage(MessageError(LastError));
        lErr := true;
      end;
      if not lErr then begin
        if not CreateTextFromModules then begin
          lErr := true;
        end;
      end;
      if not lErr then begin
        if not Compile then begin
          lErr:=true;
        end;
      end;
    end;
    if lErr then begin
      DestroyScript(FScript);
      FScript:=nil;
    end;
    Result := not lErr;
  {$ELSE}
    FScript := nil;
    Result  := false;
  {$ENDIF}
end;

procedure TMetaTask.SetRound(const Value: Integer);
begin
  FRound := Value;
end;

procedure TMetaTask.ClearLoadsParam;
begin
  FRound      := 999999;
  FUchetValut := 999999;
end;

function TMetaTask.GetRound: Integer;
var
 s : String;
begin
  if FRound=999999 then begin
    s := ParamAsString('ROUND');
    if s='' then begin
      Result:=0
    end else begin
      try
        Result:=StrToInt(s);
      except
        Result:=0;
      end;
    end;
  end else begin
    Result:=FRound;
  end;
end;

function TMetaTask.GetUchetValut: Boolean;
var
 s : String;
begin
  if FUchetValut=999999 then begin
    s := ParamAsString('UCHET_VALUT');
    if s='' then begin
      Result:=false
    end else begin
      if s='1'
        then Result:=true
        else Result:=false;
      FUchetValut:=StrToInt(s);
    end;
  end else begin
    if FUchetValut=1 then begin
      Result:=true;
    end else begin
      Result:=false;
    end;
  end;
end;

procedure TMetaTask.SetUschetValut(const Value: Boolean);
begin
  if Value
    then FUchetValut := 1
    else FUchetValut := 0;
end;
//--------------------------------------
procedure TMetaTask.SetCurrentDate(const Value: TDateTime);
begin
  FCurrentDate := Value;
end;
//--------------------------------------
function TMetaTask.GetCurrentDate: TDateTime;
begin
  Result:=Now;
end;
//--------------------------------------
function  TMetaTask.CheckDeleteSpr(OpisEdit:TOpisEdit):Boolean;
var
  s:String;
begin
  s:=ParamAsString('DELETE_SPR');  // возможность удаления значения из справочника при наличии значения в базе
  if (s='') or (s='0')
    then Result:=false
    else Result:=true;
end;
//--------------------------------------
function TMetaTask.EditSpr(strNameOpis: String; Param: TParamsEditSpr):Boolean;
var
  ID,i : Integer;
  fmEditSpr : TfmEditSpr;
//  strSection : String;
  lErr : Boolean;
  Opis : TOpisEdit;
begin
 Result:=false;
 try
  Opis := CurrentOpisEdit.GetSprOpisA(strNameOpis);
  if Opis=nil then begin
    PutError(' Не обнаружено описание с кодом '+strNameOpis);
    exit;
  end;
  if Opis.Caption='' then begin
    PutError(' У описания ' + strNameOpis + ' отсутствует Caption. ');
    exit;
  end;
  //------- может окно уже открыто
  ID := -1;
  for i:=0 to Screen.FormCount-1 do begin
    if Screen.Forms[i].Caption = Opis.Caption then begin
      ID := i;
      break;
    end;
  end;
  //------------------------------
  if ID = -1 then begin
    if (TypeWinEditSpr=twNormal) or (TypeWinEditSpr=twModal) then begin
      fmEditSpr := TfmEditSpr.Create(Application.MainForm);
    end else begin
      fmEditSpr := TfmEditSpr.CreateChild(Application.MainForm);
    end;
    fmEditSpr.FRun:=true;
    if Param<>nil then begin
      fmEditSpr.ParamsEditSpr := Param;
    end;
    lErr := false;
    if Opis.DataSet=nil then begin
      PutError(' Источник данных неизвестен. ');
      lErr:=true;
    end else begin
      fmEditSpr.OpisEdit := Opis;
      CurrentOpisEdit.SetKeyForm(fmEditSpr, nil);
      fmEditSpr.LoadFromIni(iniFile('SPR'),'');
      fmEditSpr.LoadParams;
    end;
    if lErr then begin
      fmEditSpr.Free;
    end else begin
      fmEditSpr.EnableEdit := Opis.EnableEditSpr;
      if fmEditSpr.TBSubItemRun.Visible
        then fmEditSpr.TBSubItemRun.Visible:=fmEditSpr.EnableEdit;

      if not fmEditSpr.EnableEdit then begin
        for i:=0 to fmEditSpr.Grid.Columns.Count-1 do begin
          fmEditSpr.Grid.Columns[i].Color:=clInfoBk;
        end;
        fmEditSpr.Grid.Color:=clInfoBk;
      end;
      fmEditSpr.FRun:=false;
      if (TypeWinEditSpr=twModal) then begin
        fmEditSpr.ShowModal;
        Result:=fmEditSpr.Modify;
        fmEditSpr.Free;
      end else begin
        fmEditSpr.Show;
        fmEditSpr.ActiveControl := fmEditSpr.Grid;
        Application.ProcessMessages;
      end;
    end;
  end else begin
    {  доделать если будет немодальное окно
    fmEditSpr.FRun:=true;
    fmEditSpr := TfmEditSpr(Screen.Forms[i]);
    fmEditSpr.Grid.Refresh;
    fmEditSpr.SetFocus;
    fmEditSpr.BringToFront;
    fmEditSpr.ActiveControl := fmEditSpr.Grid;
    fmEditSpr.FRun:=false;
    }
  end;
 finally
//  LockWindowUpdate(0);
 end;
end;

procedure TMetaTask.SetTypeWinEditSpr(const Value: TTypeWin);
begin
  FTypeWinEditSpr := Value;
end;

function TMetaTask.OpenDataSetAsQuery(strCompName : String; strSQL: String; lEnableEdit : Boolean; var strErr: String): TAdsQuery;
{$IFDEF DATASET_AS_ADS}
var
  Query  : TAdsQuery;
  iCount,i : Integer;
  v : Variant;
//  strName : String;
begin
  Query := TAdsQuery.Create(nil); //(MainDataTask);
  Query.Name := strCompName;
  MainDataTask.SetDefaultParam(Query);
  try
    Query.RequestLive:=lEnableEdit;
    Query.SQL.Text := strSQL;

    iCount := Query.ParamCount;
    if iCount > 0 then begin
      for i:=0 to iCount-1 do begin
        v := GetWorkParam(Query.Params[i].Name);
        if v <> null then begin
          Query.Params[i].Value := v;
        end;
      end;
    end;

    Query.DataBaseName:=MainDataBaseName;
    Query.Open;
  except
    on E: Exception do begin
      Query.Free;
      Query := nil;
      strErr := E.Message;
    end;
  end;
  Result := Query;
end;
{$ENDIF}

function TMetaTask.OpenDataSetAsTable(strCompName : String; strTableName: String;
             lEnableEdit : Boolean; var strErr: String): TAdsTable;
{$IFDEF DATASET_AS_ADS}
var
  Tb : TAdsTable;
begin
  Tb := TAdsTable.Create(nil);//(MainDataTask);
  Tb.Name := strCompName;
  Tb.TableName := strTableName;
  MainDataTask.ReadParamsTable(Tb);
  try
    Tb.ReadOnly:=not lEnableEdit;
    Tb.DataBaseName:=MainDataBaseName;
    Tb.Open;
  except
    on E: Exception do begin
      Tb.Free;
      Tb := nil;;
      strErr := E.Message;
    end;
  end;
  Result := Tb;
end;
{$ENDIF}

function TMetaTask.EditScript: Boolean;
begin
  Result:=false;
  {$IFDEF USE_SCRIPT}
  fmEditScript:=TfmEditScript.Create(nil);
  try
    fmEditScript.LoadProg('');
    fmEditScript.ShowModal;
    if fmEditScript.ChangeProg
      then Result:=true;
  finally
    fmEditScript.Free;
  end;
  {$ENDIF}
end;

function TMetaTask.MFO3(strKod: String): String;
begin
  if Length(strKod)>3
    then Result := Right(strKod,3)
    else Result := strKod;
end;

function TMetaTask.MFO9(strKod: String): String;
begin
  if Length(strKod)>3
    then Result := strKod
    else Result := ParamAsString('LEFT_MFO')+strKod;
end;

procedure TMetaTask.SetTypeSaveLookUpSpr(const Value: Integer);
begin
  // переменная определена в модуле FuncPr.pas
  TypeSaveGridLookUp := Value;
end;

function TMetaTask.GetTypeSaveLookUpSpr: Integer;
begin
  // переменная определена в модуле FuncPr.pas
  Result := TypeSaveGridLookUp;
end;

procedure TMetaTask.AdminParameters;
begin
  if FTaskParam <> nil then begin
    FTaskParam.AdminEdit;
    if Assigned(OnUpdateParams) then begin
      OnUpdateParams(self,'');
    end;
  end else begin
    PutError(' Не создан объект параметров задачи ! ');
  end;
end;

procedure TMetaTask.EditParameters;
var
  lOk:Boolean;
begin
  if FTaskParam <> nil then begin
    if Assigned(OnBeforeEditParams) then begin
      OnBeforeEditParams(self,lOk);
    end;
    if FTaskParam.Edit then begin
      lOk:=true;
      if Assigned(OnBeforeSaveParams) then begin
        OnBeforeSaveParams(self,lOk);
      end;
      if lOk and FEnabledSaveParams then begin
        // <----
        if Assigned(OnUpdateParams) then begin
          OnUpdateParams(self,'');
        end;
        FTaskParam.Save;    // <----
        if Assigned(OnAfterSaveParams) then begin
          OnAfterSaveParams(self,'EDIT');
        end;
      end;
    end;
  end else begin
    PutError(' Не создан объект параметров задачи ! ');
  end;
end;

procedure TMetaTask.ViewParameters;
begin
  if FTaskParam <> nil then begin
    FTaskParam.View;
  end else begin
    PutError(' Не создан объект параметров задачи ! ');
  end;
end;

procedure TMetaTask.SetEditEventParameter(strName : String; vEvent : TButtonClickEventEh; vEventText : TFieldGetTextEvent; vEventUpdate : TUpdateDataEventEh);
begin
  FTaskParam.SetEventEdit(strName,vEvent,vEventText,vEventUpdate);
end;

procedure TMetaTask.SetEventParameter(strName : String; vEvent : TNotifyEvent);
begin
  FTaskParam.SetEvent(strName,vEvent);
end;

//---------------------------------------------------------------------------
procedure TMetaTask.SetNameFileReportsIni(const Value: String);
begin
  FNameFileReportsIni:=Value;
end;

procedure TMetaTask.SetNameFileTaskParameters(const Value: String);
var
  strPath : String;
begin
  FNameFileTaskParameters := Value;
  if FTaskParam<>nil then begin
    FTaskParam.Save;
    FTaskParam.Free;
  end;
  if FPathParam=''
    then strPath := FPathService
    else strPath := FPathParam;
  FTaskParam := TTaskParameters.Create(CheckSleshN(strPath) + FNameFileTaskParameters);
  if Assigned(OnUpdateParams) then begin
    OnUpdateParams(self,'');
  end;
end;

function TMetaTask.NameFileLocalParameters : String;
begin
  Result := FTaskParam.FileNameLocal;
end;

function TMetaTask.UpdateParameters(strFileName: String; lDelMissing: Boolean) : Boolean;
begin
  Result := false;
  LastError := '';
  if FTaskParam.Update( strFileName, lDelMissing) then begin
    Result := true;
    FTaskParam.Save;
    if Assigned(OnUpdateParams) then begin
      OnUpdateParams(self,'');
    end;
  end else begin
    LastError := FTaskParam.LastError;
  end;
end;

function TMetaTask.RestoreParameters(strFileName,strFileNameL: String) : Boolean;
begin
  Result := false;
  LastError := '';
  if FTaskParam.Restore( strFileName,strFileNameL ) then begin
    Result := true;
    FTaskParam.Save;
    if Assigned(OnUpdateParams) then begin
      OnUpdateParams(self,'');
    end;
  end else begin
    LastError := FTaskParam.LastError;
  end;
end;

procedure TMetaTask.SetOnCheckStringFilter(const Value: TCheckStringFilter);
begin
  FOnCheckStringFilter := Value;
end;

procedure TMetaTask.SetOnUpdateParams(const Value: TUpdateParamsEvent);
begin
  FOnUpdateParams := Value;
end;

procedure TMetaTask.SetPathWorkDir(const Value: String);
begin
  FPathWorkDir := Value;
  try
    ForceDirectories(FPathWorkDir);
    LoadLastValues;
  except
  end;
end;

procedure TMetaTask.LoadLastValues;
begin
  FLastValues.LoadFromFile(FPathWorkDir+'LastValues.txt');
end;

procedure TMetaTask.SaveLastValues;
begin
  FLastValues.SaveToFile(FPathWorkDir+'LastValues.txt');
end;

function TMetaTask.GetLastValueAsString(strName: String): String;
var
  i : Integer;
  s : String;
begin
  Result := '';
  i := FLastValues.IndexOfName(ANSIUpperCase(strName));
  if i > -1 then begin
    s := FLastValues.Strings[i];
    i := Pos('=',s);
    if i > 0 then begin
      Result := Copy(s,i+1,Length(s));
    end;
  end;
  Result := StringReplace(Result,'<CRLF>',chr(13)+chr(10),[rfReplaceAll]);
end;

function TMetaTask.GetLastValueAsDate(strName: String; lDefNow:Boolean): TDateTime;
var
 s : String;
begin
  s := GetLastValueAsString(strName);
  if s = '' then begin
    if lDefNow  then Result:=Date else Result:=0;
  end else begin
    try
      Result := STOD(s,tdAds);
    except
      if lDefNow  then Result:=Date else Result:=0;
    end;
  end;
end;

function TMetaTask.GetLastValueAsInteger(strName: String): Integer;
var
 s : String;
begin
  s := GetLastValueAsString(strName);
  if s = '' then begin
    Result := 0;
  end else begin
    try
      Result := StrToInt(s);
    except
      Result := 0;
    end;
  end;
end;

function TMetaTask.GetLastValueAsBoolean(strName: String): Boolean;
begin
  if Trim(GetLastValueAsString(strName))='1' then Result:=true else Result:=false;
end;

procedure TMetaTask.SetLastValueAsString(strName, Value: String);
var
  i : Integer;
begin
  strName := ANSIUpperCase(Trim(strName));
  i := FLastValues.IndexOfName(strName);
  if Pos(chr(13)+chr(10),Value) > 0
    then Value := StringReplace(Value,chr(13)+chr(10),'<CRLF>',[rfReplaceAll]);
  if i > -1 then begin
    FLastValues.Strings[i] := strName + '=' + Value;
  end else begin
    FLastValues.Add(strName + '=' + Value);
  end;
end;

procedure TMetaTask.SetLastValueAsDate(strName: String; Value: TDateTime);
var
  s : String;
begin
  s := DTOS(Value,tdAds);
  SetLastValueAsString(strName, s);
end;

procedure TMetaTask.SetLastValueAsInteger(strName: String; Value: Integer);
var
  s : String;
begin
  s := IntToStr(Value);
  SetLastValueAsString(strName, s);
end;

procedure TMetaTask.SetLastValueAsBoolean(strName: String; Value: Boolean);
var
  s : String;
begin
  if Value then s:='1' else s:='0';
  SetLastValueAsString(strName, s);
end;

const
  NAME_MAIN_PARAMS='TaskParams.ini';
//--------------------------------------------------------
function TMetaTask.GetMainParam(sSect,sName:String; sType:String; vDef:Variant): Variant;
var
  s:String;
begin
  try
    if FIniMainParams=nil then FIniMainParams:=CreateMainIniFile(NAME_MAIN_PARAMS);
    Result:=true;
    s:=FIniMainParams.ReadString(sSect,sName,'');
    if s='' then begin
      Result:=vDef;
    end else if (sType='N') or (sType='I') then begin
      Result:=StrToIntDef(s,vDef);
    end else if (sType='L') or (sType='B') then begin
      if s='1' then Result:=true else Result:=false;
    end else if (sType='D') then begin
      try
        Result:=STOD(s, tdAds);
      except
        Result:=vDef;
      end;
    end else begin
      Result:=s;
    end;
  except
    Result:=vDef;
  end;
end;

//--------------------------------------------------------
function TMetaTask.SetMainParam(sSect,sName,sType:String; vVal:Variant): Boolean;
var
  s:String;
begin
  try
    if FIniMainParams=nil then FIniMainParams:=CreateMainIniFile(NAME_MAIN_PARAMS);
    Result:=true;
    if (sType='N') or (sType='I') then begin
      s:=VarToStr(vVal);
    end else if (sType='L') or (sType='B') then begin
      if vVal=true then s:='1' else s:='0';
    end else if (sType='D') then begin
      s:=DTOS(vVal, tdAds);
    end else begin
      s:=vVal;
    end;
    FIniMainParams.WriteString(sSect,sName,s);
  except
    Result:=false;
  end;
end;

//--------------------------------------------------------
procedure TMetaTask.ReadMRUList(sl:TStringList; cSect:String);
var
  ini : TSasaIniFile;
  n,j : Integer;
begin
  sl.Clear;
  ini := iniFile('MRULIST');
  if ini <> nil then begin
    ini.ReadSectionValues('MRU.'+cSect, sl);
    for n:=0 to sl.Count-1 do begin
      j := Pos('=', sl.Strings[n]);
      if j > 0 then begin
        sl.Strings[n] := Copy(sl.Strings[n],j+1,200);
      end;
    end;
  end;
end;
//--------------------------------------------------------
procedure TMetaTask.WriteMRUList(sl:TStringList; cSect:String);
var
  ini : TSasaIniFile;
  n : Integer;
begin
  ini := iniFile('MRULIST');
  if ini <> nil then begin
    for n:=0 to sl.Count-1 do begin
      ini.WriteString('MRU.'+cSect, IntToStr(n), sl.Strings[n]);
    end;
    ini.UpdateFile;
  end;
end;

//--------------------------------------------------------
procedure TMetaTask.SetMRUListForm(Form: TForm);
var
  ini : TSasaIniFile;
  i,j,n : Integer;
  cSect, cSectMRU : String;
begin
  ini := iniFile('MRULIST');
  if ini <> nil then begin
    for i:=0 to Form.ComponentCount-1 do begin
      if Form.Components[i] is TDbEditEh then begin
        cSect := Form.ClassName + '.' + Form.Components[i].Name;
        with TDbEditEh(Form.Components[i]) do begin
          cSectMRU := ini.ReadString(cSect,'ITEMS', '');
          if cSectMRU <> '' then begin
            MRUList.Active := ini.ReadBool(cSect,'ACTIVE', false);
            MRUList.Limit  := ini.ReadInteger(cSect,'LIMIT', 10);
            n := ini.ReadInteger(cSect,'ROWS', 0);
            if n > 0 then begin
              MRUList.Rows := n;
            end;
            if MRUList.Active then begin
              ini.ReadSectionValues('MRU.'+cSectMRU, MRUList.Items);
              for n:=0 to MRUList.Items.Count-1 do begin
                j := Pos('=', MRUList.Items.Strings[n]);
                if j > 0 then begin
                  MRUList.Items.Strings[n] := Copy(MRUList.Items.Strings[n],j+1,200);
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TMetaTask.SaveMRUListForm(Form: TForm);
var
  ini : TSasaIniFile;
  i,n : Integer;
  cSect, cSectMRU : String;
begin
  ini := iniFile('MRULIST');
  if ini <> nil then begin
    for i:=0 to Form.ComponentCount-1 do begin
      if Form.Components[i] is TDbEditEh then begin
        with TDbEditEh(Form.Components[i]) do begin
          if MRUList.Active then begin
            cSect := Form.ClassName + '.' + Form.Components[i].Name;
            cSectMRU := ini.ReadString(cSect,'ITEMS', '');
            if cSectMRU <> '' then begin
              for n:=0 to MRUList.Items.Count-1 do begin
                ini.WriteString('MRU.'+cSectMRU, IntToStr(n), MRUList.Items.Strings[n]);
              end;
            end;
            ini.UpdateFile;
          end;
        end;
      end;
    end;
  end;
end;

procedure TMetaTask.SetNameFileMainScript(strNameFile: String);
begin
  FNameFileMainScript := strNameFile;
end;

function TMetaTask.CreateMenuReport( Sub : TTBSubmenuItem; slReports : TStringList; lCreateSub : Boolean) : Boolean;
var
  i,j : Integer;
//  it : TTbItem;
//  ss : TTBSubMenuItem;
  strName, strMenu, strSub : String;
begin
  Result := true;
  Sub.Clear;
  for i:=0 to slReports.Count-1 do begin
    strName := slReports.Names[i];
    j := Pos('.', strName);
    if (j = 0) or not lCreateSub then begin
      strSub  := '';
      strMenu := strName;
    end else begin
      strSub  := Copy(strName,1,j-1);
      strMenu := Copy(strName,j+1,100);
    end;
  end;
end;

{
function CreateMenuReport( strNameReport : String; Sub : TTBSubmenuItem; sl : TStringList) : Boolean;
var
  i : Integer;
  it : TTbItem;
  ss : TTBSubMenuItem;
  c : Char;
begin
  Result := true;
  Sub.Tag := Integer(sl);
  for i:=1 to 5 do begin
    if i=1 then begin
      ss := TTBSubMenuItem.Create(Sub);
      ss.Name := 'sssss1';
      ss.caption := 'SSS';

      it := TTbItem.Create(Sub);
      it.Name:='TBItemDetail11_'+IntToStr(i);
      sl.Add( 'SSSsssssssssssss' );
      it.Caption := 'ssssssssssss';
      it.OnClick := Form1.TBItem1Click;
      ss.Add(it);

      it := TTbItem.Create(Sub);
      it.Name:='TBItemDetail22_'+IntToStr(i);
      sl.Add( 'WWWwwwwwwwwwwwwww' );
      it.Caption := 'wwwwwwwwww';
      it.OnClick := Form1.TBItem1Click;
      ss.Add(it);

      Sub.Add(ss);
    end else begin
      it := TTbItem.Create(Sub);
      it.Name:='TBItemDetail_'+IntToStr(i);
      c := Copy(IntToStr(i),1,1)[1];
      sl.Add( StringOfChar(c,10) );
      it.Caption := StringOfChar(c,10);
      it.OnClick := Form1.TBItem1Click;
      Sub.Add(it);
    end;
  end;
end;

procedure TForm1.TBItem1Click(Sender: TObject);
var
  sub,sss : TTBSubmenuItem;
  i : Integer;
  s : String;
begin
  sub := TTBSubmenuItem(TTbItem(Sender).Owner);
  sss := TTBSubmenuItem(TTbItem(Sender).Parent);
  Showmessage( sub.name + '  ' + sss.Name);
  i := sss.indexof( TTbItem(Sender) );
  s := TStringList(TObject(subMenu.tag)).Strings[i];
  Showmessage( IntToStr(i) + '  ' + s);
end;
}

{$IFDEF USE_LOGFILE}
function TMetaTask.GetLogFile: TLogToFile;
begin
  Result := uLogToFile.LogToFile;
end;
{$ENDIF}

procedure TMetaTask.WriteToLogFile(sSoob:String; slPar:TStringList; nTypeLog:Integer);
var
  nSpaceB,nSpaceA:Integer;
  lFree,lKeepOpen:Boolean;
  s,sTag,sFile,sOld:String;
begin
  if LogFile<>nil then begin
    try
      lKeepOpen:=false;
      nSpaceB:=0;
      nSpaceA:=0;
      sTag:='ALL';
      sFile:='';
      lFree:=true;
      if slPar<>nil then begin
        s:=slPar.Values['BEFORE'];  if s<>'' then nSpaceB:=StrToInt(s);
        s:=slPar.Values['AFTER'];   if s<>'' then nSpaceA:=StrToInt(s);
        s:=slPar.Values['KEEP'];    if s<>'' then if s='1' then lKeepOpen:=true;
        s:=slPar.Values['TAG'];     if s<>'' then sTag:=s;
        s:=slPar.Values['FILE'];    if s<>'' then sFile:=s;
        s:=slPar.Values['FREE'];    if s<>'' then if s='0' then lFree:=false;
      end;
      if (nTypeLog=LOG_SQL) then begin
        if (Pos('SQL;', FLogTypes)>0) then begin
          sOld:=LogFile.LogFileName;
          if sFile='' then LogFile.LogFileName:=CheckSleshN(PathWorkDir)+'LogSql.txt';
          sSoob:=StringReplace(sSoob, #13#10, ' ', [rfReplaceAll]);
          LogFile.WriteToLogFile(sSoob,nSpaceB,nSpaceA,lKeepOpen,sTag,sFile);
          LogFile.LogFileName:=sOld;
        end;
      end else begin
        LogFile.WriteToLogFile(sSoob,nSpaceB,nSpaceA,lKeepOpen,sTag,sFile);
      end;
      if (slPar<>nil) and lFree then FreeAndNil(slPar);
    except
    end;
  end;
end;

procedure TMetaTask.SetLastError(const Value: String);
begin
  FLastError := Value;
end;

procedure TMetaTask.SetPathParam(const Value: String);
begin
  FPathParam := Value;
end;

function TMetaTask.CreateReportTable(strNameTable: String; lFRDataSet : Boolean): Boolean;
{$IFNDEF NOT_USE_REPORT}
var
  ini : TSasaIniFile;
  sl : TStringList;
  strName, strValues : String;
  strField, strFields, strDescFields : String;
  arr : TArrStrings;
  i,j, nSize, n : Integer;
  fldType : TFieldType;
  fldDef : TFieldDef;
  f : TForm;
  mt  : TkbmMemTable;
  frt : TfrDbDataSet;
  {$IFDEF USE_FR3}
  frt3 : TfrxDbDataSet;
  s:String;
  {$ENDIF}
  o : TComponent;
begin
  Result := true;
  mt := nil;
  frt3:=nil;
  f  := Application.MainForm;
  sl := TStringList.Create;
  ini := TSasaIniFile.Create(PathService+'ReportTables.ini');
  ini.ReadSectionValues(strNameTable, sl);
  if sl.Count > 0 then begin
    o := f.FindComponent('rt_' + strNameTable);
    if o = nil then begin
      mt := TkbmMemTable.Create(f);
      mt.Name := 'rt_' + strNameTable;
      mt.Tag := 1991;
      if lFRDataSet then begin
        frt := TfrDbDataSet.Create(f);
        frt.Name := 'fr_DB' + strNameTable;
        frt.DataSet := mt;
        {$IFDEF USE_FR3}
          frt3 := TfrxDbDataSet.Create(f);
          frt3.Name := 'fr3_DB' + strNameTable;
          frt3.DataSet := mt;
          s:=ini.ReadString( strNameTable+'->META', 'USERNAME', '');
          if s<>'' then  frt3.UserName:=s;
          s:=ini.ReadString( strNameTable+'->META', 'DESCRIPTION', '');
          if s<>'' then  frt3.Description:=s;
        {$ENDIF}
      end;
      for i:=0 to sl.Count-1 do begin
        strName   := sl.Names[i];
        strValues := sl.Values[strName];
        StrToArr(strValues, arr,',',false);
        SetLength(arr,2);
        nSize := 0;
        if StringToFieldType( arr[0], fldType) then begin
          if arr[1]='' then begin
            nSize := 0;
          end else begin
            nSize := StrToInt(arr[1]);
          end;
        end;
        fldDef := mt.FieldDefs.AddFieldDef;
        fldDef.Name     := Trim(strName);
        fldDef.DataType := fldType;
        fldDef.Size     := nSize;
        fldDef.Required := false;
//      mtReport.FieldDefs.Add(Trim(strName), fldType, nSize, false);
      end;
      sl.Clear;
      ini.ReadSectionValues(strNameTable+'->INDEX', sl);
      mt.IndexDefs.Clear;
      if sl.Count > 0 then begin
        for i:=0 to sl.Count-1 do begin
          strFields := '';
          strDescFields := '';
          strName   := sl.Names[i];
          strValues := sl.Values[strName];
          StrToArr(strValues, arr,',',false);
          for j:=Low(arr) to High(arr) do begin
            n := Pos(' ', arr[j]);
            if n > 0 then begin
              strField := Trim(Copy(arr[j],1,n-1));
              if ANSIUpperCase(Trim(Copy(arr[j],n+1,100)))='DESC' then begin
                strDescFields := strDescFields + strField + ';';
              end;
            end else begin
              strField := Trim(arr[j]);
            end;
            strFields := strFields + strField + ';';
          end;
          with mt.IndexDefs do begin
            with AddIndexDef do begin
              Name := strName;
              Fields := strFields;
              Options := [];
              DescFields := strDescFields;
            end;
          end;
        end;
      end;
      {$IFDEF USE_FR3}
        if frt3<>nil then begin
          sl.Clear;
          ini.ReadSectionValues(strNameTable+'->FIELDALIASES', sl);
          if sl.Count > 0 then begin
            for i:=0 to sl.Count-1 do begin
              frt3.FieldAliases.Add(sl.Strings[i]);
            end;
          end;
        end;
      {$ENDIF}
    end else begin
      mt := TkbmMemTable(o);
    end;
  end else begin
    PutError('Неизвестна структура таблицы '+strNameTable);
    Result := false;
  end;
  if Result then begin
    mt.Active := true;
    mt.EmptyTable;
  end;
  sl.Free;
  ini.Free;
end;
{$ELSE}
begin
end;
{$ENDIF}

function TMetaTask.FreeReportTable(strNameTable: String): Boolean;
{$IFNDEF NOT_USE_REPORT}
var
  f : TForm;
  o : TComponent;
begin
  Result := true;
  f  := Application.MainForm;
  o := f.FindComponent('rt_' + strNameTable);
  if (o <> nil) and (o is TkbmMemTable) then begin
    o.Free;
    o := f.FindComponent('fr_DB' + strNameTable);
    if (o<>nil) then begin
      o.Free;
    end;
    o := f.FindComponent('fr3_DB' + strNameTable);
    if (o<>nil) then begin
      o.Free;
    end;
  end else begin
    Result := false;
  end;
end;
{$ELSE}
begin
end;
{$ENDIF}

function TMetaTask.FindReportTable(strNameTable: String): TDataSet;
{$IFNDEF NOT_USE_REPORT}
var
  f : TForm;
  o : TComponent;
begin
  Result := nil;
  f  := Application.MainForm;
  o := f.FindComponent('rt_' + strNameTable);
  if (o <> nil) and (o is TkbmMemTable) then begin
    Result := TDataSet(o);
  end;
end;
{$ELSE}
begin
end;
{$ENDIF}

procedure TMetaTask.FreeReportTables;
{$IFNDEF NOT_USE_REPORT}
var
  f : TForm;
  mt : TkbmMemTable;
  i : Integer;
begin
  f  := Application.MainForm;
  for i:=0 to f.ComponentCount-1 do begin
    if (f.Components[i] is TkbmMemTable) and
        (UpperCase(Copy(f.Components[i].Name,1,3))='RT_') then begin
      mt := TkbmMemTable(f.Components[i]);
      mt.Free;
    end else if (f.Components[i] is TfrDBDataSet) and
        (UpperCase(Copy(f.Components[i].Name,1,5))='FR_DB') then begin
      f.Components[i].Free;
    end;
    {$IFDEF USE_FR3}
    if (f.Components[i] is TfrxDBDataSet) and
       (UpperCase(Copy(f.Components[i].Name,1,6))='FR3_DB') then begin
      f.Components[i].Free;
    end;
    {$ENDIF}
  end;
end;
{$ELSE}
begin
end;
{$ENDIF}

procedure TMetaTask.SetOnAfterEditParams(const Value: TUpdateParamsEvent);
begin
  FOnAfterEditParams := Value;
end;

procedure TMetaTask.SetOnAfterSaveParams(const Value: TUpdateParamsEvent);
begin
  FOnAfterSaveParams := Value;
end;

procedure TMetaTask.ErrorIfNotFoundParam(lSet: Boolean);
begin
  FTaskParam.RunError := lSet;
end;

procedure TMetaTask.SaveParameters;
begin
  if FTaskParam <> nil then begin
    FTaskParam.Save;
  end;
end;

function TMetaTask.WriteParamAsString(strName, strValue: String): Boolean;
begin
  Result := true;
  if FTaskParam <> nil then begin
    Result := FTaskParam.WriteParamAsString(strName, strValue);
  end;
end;

function TMetaTask.WriteParamAsDate( strName : String; dDate:TDateTime) : Boolean;
begin
  Result := true;
  if FTaskParam <> nil then begin
    Result := FTaskParam.WriteParamAsDate(strName, dDate);
  end;
end;

procedure TMetaTask.SetOnBeforeSaveParams(const Value: TUpdateParamsEvent2);
begin
  FOnBeforeSaveParams := Value;
end;

procedure TMetaTask.SetOnBeforeEditParams(const Value: TUpdateParamsEvent2);
begin
  FOnBeforeEditParams := Value;
end;

//procedure TMetaTask.SetidMetaCurDok(const Value: String);
//begin
//  FidMetaCurDok:=Value;
//end;

procedure TMetaTask.SetPathSQLFiles(const Value: String);
begin
  FPathSQLFiles := Value;
end;

procedure TMetaTask.SetPathPersonal(const Value: String);
begin
  FPathPersonal := Value;
end;

procedure TMetaTask.SetEnabledDuplex( lSet:Boolean );
begin
  {$IFNDEF NOT_USE_REPORT}
    ReportTask.DuplexEnabled:=lSet;
  {$ENDIF}
end;

procedure TMetaTask.SetKodCurDok(sKod:String);
begin
  FKodCurDok:=sKod;
end;

function  TMetaTask.GetKodCurDok:String;
begin
  Result:=FKodCurDok;
end;

// выходной или праздничный день
function TMetaTask.IsOffDay( vYear, vMonth, vDay : Variant) : Boolean;
var
  sYear, sMonth, sDay, s : String;
  n,i : Integer;
  dDate : TDateTime;
  ini : TSasaIniFile;
  sl : TStringList;
begin
  Result := false;
  sYear  := VarToStr(vYear);
  if Pos('-', sYear) > 0 then begin // передана строка в виде даты YYYY-MM-DD
    dDate := STOD(sYear,tdAds);
  end else begin
    sMonth := PadLStr(Trim(VarToStr(vMonth)), 2, '0');
    sDay   := PadLStr(Trim(VarToStr(vDay)), 2, '0');
    dDate  := STOD(sYear+sMonth+sDay,tdClipper);
  end;
  n := DayOfWeek( dDate ); // 1-воскресенье
  if (n=1) or (n=7) then begin
    Result := true;
  end else begin // а может праздничный день ?
    if Length(FArrHoliday)=0 then begin
      sl := TStringList.Create;
      ini := CreateIniFile('Kalendar.ini');
      ini.ReadSectionValues('HOLIDAY', sl);
      SetLength(FArrHoliday, sl.Count);
      for i:=0 to sl.Count-1 do begin
        FArrHoliday[i] := Copy(sl.Strings[i],4,2)+'-'+Copy(sl.Strings[i],1,2);
      end;
      sl.Free;
      ini.Free;
    end;
    s := Copy(DTOS(dDate, tdAds),6,5);
    for i:=0 to Length(FArrHoliday)-1 do begin
      if FArrHoliday[i] = s then begin
        Result := true;
        break;
      end;
    end;
  end;
end;
//==================================================================
procedure TMetaTask.SetCurIdBase(n:Integer);
begin
  FCurIdBase:=n;
end;
//-------------------------------------
function TMetaTask.GetCurIdBase:Integer;
begin
  Result:=FCurIdBase;
end;
//-------------------------------------
// вернуть Id для записи в поле ID_BASE
function TMetaTask.GetCurIdBase2Field:Integer;
begin
  if FCurIdBase=-1
    then Result:=0
    else Result:=FCurIdBase;
end;
//-------------------------------------
function TMetaTask.AddWhereCurIdBase(sWhere:String; cAl:String):String;
begin
  Result:=Trim(sWhere);
  if cAl<>'' then cAl:=cAl+'.';
  if FCurIdBase>-1 then begin
    if Result=''
      then Result:=cAl+'id_base='+IntToStr(FCurIdBase)
      else Result:='('+sWhere+') and '+cAl+'id_base='+IntToStr(FCurIdBase);
  end;
end;
//===================================================================

{ TGlobalEditSpr }
constructor TGlobalEditSpr.Create;
begin
  inherited Create;
  EnablePopupMenu:=true;
  OnlyRead:=false;
  FOnExportSpr:=nil;
end;

destructor TGlobalEditSpr.Destroy;
begin
  inherited Destroy;
end;

procedure TGlobalEditSpr.SetOnExportSpr(const Value: TNotifyEvent);
begin
  FOnExportSpr := Value;
end;

initialization
  GlobalTask:=TMetaTask.Create;
  GlobalEditSpr:=TGlobalEditSpr.Create;
finalization
  FreeAndNil(GlobalTask);
  FreeAndNil(GlobalEditSpr);
end.                                






