unit dDokument;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,DateUtils,
  DBCtrlsEh,DBLookupEh,
  Db, kbmMemTable, MetaTask, funcPr, AdsData, AdsTable, DbFunc, StdCtrls, uProject, uTypes,
  ifpii_vadfunc, FR_DSet, FR_DBSet, SasaIniFile
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

type

  TDokument = class;

  TdmDokument = class(TDataModule)
    mtDokument: TkbmMemTable;
    mtDokumentID: TIntegerField;
    mtDokumentNOMER: TStringField;
    tbDopProp: TkbmMemTable;
    mtDokumentDATE_FIKS: TDateField;
    tbPropertys: TkbmMemTable;
    tbPropertysNAME: TStringField;
    tbPropertysVALUE: TMemoField;
    tbPropertysTYPE: TIntegerField;
    tbHistory: TkbmMemTable;
    tbHistoryFieldName: TStringField;
    tbHistoryValue: TStringField;
    tbHistoryStringValue: TStringField;
    tbHistoryDateIzm: TDateTimeField;
    tbHistoryID: TIntegerField;
    mtDokumentNEWDOK: TBooleanField;
    tbHistoryTypeDate: TSmallintField;
    tbHistoryDatePropis: TSmallintField;
    tbHistoryInfo: TStringField;
    tbResh: TkbmMemTable;
    tbReshDATER: TDateField;
    tbReshNOMER: TIntegerField;
    tbReshTIP: TIntegerField;
    tbReshPRIM: TMemoField;
    tbReshID: TIntegerField;
    tbReshNVALUE: TFloatField;
    tbReshSROK: TDateField;
    tbReshPURPOSE: TIntegerField;
    tbReshWHAT: TSmallintField;
    tbReshDATEO: TDateField;
    tbReshMESTO: TStringField;
    tbReshADRES_ID: TIntegerField;
    tbReshID_OTM: TIntegerField;
    tbNalogi: TkbmMemTable;
    tbNalogiGOD: TSmallintField;
    tbNalogiNALOG: TSmallintField;
    tbNalogiPERIOD: TSmallintField;
    tbNalogiNOMER: TSmallintField;
    tbNalogiDATE_VIST: TDateField;
    tbNalogiDATE_SROK: TDateField;
    tbNalogiSUMMA_VIST: TFloatField;
    tbNalogiDATE_OPL: TDateField;
    tbNalogiSUMMA_OPL: TFloatField;
    tbNalogiNOMER_OPL: TStringField;
    tbNalogiNALOG_NAME: TStringField;
    tbNalogiDELTA: TFloatField;
    tbNalogiTYPEOBJ: TIntegerField;
    tbNalogiMEN_ID: TIntegerField;
    tbNalogiID: TIntegerField;
    procedure tbDopPropAfterOpen(DataSet: TDataSet);
    procedure tbNalogiCalcFields(DataSet: TDataSet);
    procedure tbNalogiAfterInsert(DataSet: TDataSet);
    procedure tbNalogiBeforePost(DataSet: TDataSet);
  private
    FNewNomer : Integer;    // выделенный номер для документа при автонумерации
    FLastError: String;
    FScriptDokument : TDokument;
    FOnAddWriteAllDokums: TNotifyEvent;
    FUserID: String;
    FDateFiks: TDateTime;
    procedure SetLastError(const Value: String);
    procedure SetOnAddWriteAllDokums(const Value: TNotifyEvent);
    procedure SetUserID(const Value: String);
    procedure SetDateFiks(const Value: TDateTime);
  public
    EnableRunScript:Boolean;  // работа происходит из скрипта
    FMainTable : TAdsTable;
    IsShowHistoryAsHint:Boolean;
    IsReadDokument : Boolean;
    ListDopRazdel : TStringList;
    FListPar:TStringList;
    FTypeObj:Integer;
    property DateFiks : TDateTime read FDateFiks write SetDateFiks;
    property UserID : String read FUserID write SetUserID;
    property ScriptDokument : TDokument read FScriptDokument write FScriptDokument;
    property  LastError : String read FLastError write SetLastError;
    property  OnAddWriteAllDokums : TNotifyEvent read FOnAddWriteAllDokums write SetOnAddWriteAllDokums;

    procedure OpenTableFactor;
    procedure DeleteAllFactor;
    procedure DeleteFactor(sName:String);
    function  SetFactor(sName:String; vValue:Variant):Boolean;
    function  GetFactor(sName:String):Variant;
    function  GetFactorEx(sName: String; vDefault:Variant): Variant;

    function  ReadDokument( ID : Integer; slPar : TStringList=nil) : Boolean; virtual; abstract;
    function  WriteDokument(f:TForm=nil) : Boolean; virtual; abstract;
    function  PostDokument : Boolean; virtual; abstract;
    function  CancelDokument : Boolean; virtual; abstract;
    function  CheckDokument(var strErr : String) : Boolean; virtual;

    procedure AfterCreateDokument; virtual;
    function  AfterReadDokument : Boolean; virtual;
    function  StdBeforeWrite : Boolean;
    procedure ClearDokument; virtual;
    procedure AddWrite(Sender : TObject); virtual;
    procedure ReadKodAndText( fldDescKod,fldDescText,fldSourKod,fldSourText : TField; tbSpr : TDataSet);
    function CreateNameOsnForEdit(sPunkt,sName,sUkaz:String):String;

//    function  WriteOneRecord(Data1, Data2 : TDataSet;arr : TArrSootv; l : Boolean) : Boolean;

//    function WriteSimpleList(ID : Integer; tbW: TAdsTable; tbR: TkbmMemTable; ArrFld: TArrSootv): Boolean;
//    function LoadSimpleList( ID : Integer; MemTable : TkbmMemTable; DBFTable : TAdsTable; Arr : TArrSootv; NameFldKey : String): Boolean;

    procedure ReadPropFields(nTypeObj,nRazdel : Integer; dDateFiks : TDateTime; nKodObj : Integer;
              ds : TDataSet; var lErr : Boolean);

    procedure WriteField(FldTo, FldFrom : TField; var lErr : Boolean);
//    function WriteAllDokums(ds : TDataSet) : Boolean;

    function GetVid : String; virtual;
    function CreateNewID : Integer;
    function RunProcScript( strNameProc : String; var vResult : Variant) : Boolean;

    function IsNewDok : Boolean;

    function GetNextNumber : String;
    procedure SetNextNumber( strCurNomer : String);
    procedure Post;
    procedure First;

    procedure DisableControls;
    procedure EnableControls;

    function ParAsString(sl : TStringList; sPar:String) : String;

    procedure ReadHistory( nID,nIDNew : Integer; nTypeObj : Integer; lClear:Boolean);
    function GetHistValueField(strFieldName: String; nType: Integer): Variant;
    procedure WriteHistory( nID,nIDNew : Integer; nTypeObj : Integer);

    procedure WriteReshObj( nID,nIDNew : Integer; nTypeObj : Integer);
    procedure ReadReshObj( nID,nIDNew : Integer; nTypeObj : Integer; lClear:Boolean);

    procedure ReadAddData(sValues:String; dsDok:TDataSet);
    function PrepareAddData(dsDok:TDataSet; sFields:String):String;

    procedure ReadNalogi(nTypeObj:Integer; nLicID:Integer; nAdresID:Integer; slMens:TStringList; slLich:TStringList);
    procedure WriteNalogi(nTypeObj:Integer; ID:Integer);

    constructor Create( Owner : TComponent); override;
    destructor Destroy; override;
  end;

  //---------- объект для скрипта ------------------
  TDokument = class(TObject)
  private
    FDokument: TdmDokument;
    procedure SetDokument(const Value: TdmDokument);
  public
    property Dokument : TdmDokument read FDokument write SetDokument;
    function Fld(strFieldName : String) : TField;
    function ReadDokument( ID : Integer; slPar : TStringList) : Boolean;
    function WriteDokument : Boolean;
    procedure NewDok; virtual;
  end;
  //------------------------------------------------

  TdmDokumentClass = class of TdmDokument;
  {
  TVidDokument = record
    Name  : String;
    Alias : String;
    TypeClass : TdmDokumentClass;
    NameClass : String;
    Caption : String;
    Form      : TForm;
    MainTable : String;
  end;
  TArrVidDokument = array of TVidDokument;
  }

var
  dmDokument: TdmDokument;

implementation

uses dBase, fMain;

{$R *.DFM}

{ TdmDokument }

procedure TdmDokument.WriteField(FldTo, FldFrom : TField; var lErr : Boolean);
begin
  try
    if FldFrom.IsNull then begin
      FldTo.AsString:='';
    end else if FldTo.DataType = ftDate then begin
      FldTo.AsString := FldFrom.AsString;
    end else if (FldTo.DataType = ftFloat) or (FldTo.DataType = ftCurrency) then begin
      FldTo.AsFloat := FldFrom.AsFloat;
    end else if (FldTo.DataType = ftSmallInt) or (FldTo.DataType = ftInteger) or (FldTo.DataType = ftWord) then begin
      FldTo.AsInteger := FldFrom.AsInteger;
    end else if (FldTo.DataType = ftBoolean) then begin
      FldTo.AsBoolean := FldFrom.AsBoolean;
    end else begin
      FldTo.AsString := FldFrom.AsString;
    end;
  except
    on E:Exception do begin
      lErr := true;
      PutError(' Ошибка записи из "'+FldFrom.FieldName+'" в "'+FldTo.FieldName+'"'+
               #13+E.Message);
    end;
  end;
end;
//-------------------------------------------------------------------------------
procedure TdmDokument.ReadPropFields(nTypeObj,nRazdel : Integer;  dDateFiks : TDateTime; nKodObj : Integer;  ds : TDataSet; var lErr : Boolean);
var
  vKeyValues : Variant;
  nID : Integer;
  fld : TField;
begin
  lErr := false;
  vKeyValues := VarArrayCreate( [0, 1], varOleStr );
  vKeyValues[0] := nTypeObj;
  vKeyValues[1] := nRazdel;
  if dmBase.SprRazdel.Locate('TYPEOBJ;NOMER', vKeyValues, []) then begin
    if dmBase.SprRazdel.FieldByName('VISIBLE').AsBoolean then begin
      nID := dmBase.SprRazdel.FieldByName('ID').AsInteger;
      dmBase.SprProperty.IndexName := 'KEY_VIEW';
      dmBase.SprProperty.SetRange([nTypeObj,nID],[nTypeObj,nID]);
      with dmBase.SprProperty do begin
        while not Eof do begin
          if FieldByName('VISIBLE').AsBoolean then begin
            fld := ds.FindField( FieldByName('KOD').AsString );
            if fld<>nil then begin
              fld.Value := dmBase.ReadOneProp(dDateFiks,nKodObj, fld.FieldName, fld.DataType);
              {TODO 1 : Обработка ошибки чтения свойства}
              if dmBase.LastError <> '' then begin
                 PutError(dmBase.LastError);
                 lErr := true;
              end;
            end;
          end;
          if lErr then begin
            break;
          end;
          Next;
        end;
      end;
      dmBase.SprProperty.CancelRange;
    end;
  end;
end;

{
function TdmDokument.WriteSimpleList(ID : Integer; tbW: TAdsTable;
             tbR: TkbmMemTable; ArrFld: TArrSootv): Boolean;
var
  I : integer;
  fieldID : TField;
  lDel : Boolean;
begin
  Result := true;
  tbR.First;     // установим MemTable на первую запись
  tbW.IndexName:='PR_KEY';

  while tbW.FindKey([ID]) do tbW.Delete;  // удалим все сначала

  fieldID := tbW.FieldByName('DokumId');
  while not tbR.Eof do begin
    CreateNewRecord(dmBase.AdsSettings,tbW);
    fieldID.AsInteger := ID;
    for i:=0 to Length(ArrFld)-1 do begin
      WriteField(ArrFld[i].FldDBF, ArrFld[i].FldMem);
    end;
    tbW.Post;
    tbR.Next;
  end;
end;
}
{
//-----------------------------------------------------------------------------
function TdmDokument.LoadSimpleList( ID : Integer; MemTable : TkbmMemTable;
    DBFTable : TAdsTable; Arr : TArrSootv; NameFldKey : String): Boolean;
var
  iMax,i : Integer;
  fld  : TField;
begin
  MemTable.EmptyTable;
  iMax:=0;
  Result := true;
  // определим соответствие полей для чтения
  if CreateSootv( Arr, MemTable, DbfTable, MemTable.Name, DbfTable.TableName) then begin
    with DbfTable do begin
      fld := FieldByName(NameFldKey);
      IndexName:='PR_KEY';
      SetRange([ID],[ID]);
      First;
      while not Eof do begin
        iMax:=fld.AsInteger;
        Memtable.Append;
        for i:=Low(Arr) to High(Arr) do begin
          WriteField(Arr[i].FldMem, Arr[i].FldDbf);
//          WriteField(MemTable.FieldByName(Arr[i].NameMem),
//                     MemTable.FieldByName(Arr[i].NameDbf));
        end;
        MemTable.Post;
        Next;
      end;
      MemTable.First;
      CancelRange;
    end;
  end else begin
    Result := false;
  end;
  MemTable.AutoIncMinValue:=iMax+1;
  MemTable.ResetAutoInc;
end;
}
constructor TdmDokument.Create(Owner: TComponent);
begin
  inherited;
  FTypeObj:=0;
  EnableRunScript:=true;
  FMainTable:=nil;
  FListPar:=nil;
  IsShowHistoryAsHint:=false;
  IsReadDokument:=false;
  FDateFiks := dmBase.GetDateCurrentSost;   // дата для текущего состояния
  mtDokument.Active:=false;
  mtDokument.Active:=true;
  mtDokument.Append;
  mtDokument.Post;
  FScriptDokument := TDokument.Create;
  FScriptDokument.FDokument := Self;
  FOnAddWriteAllDokums := AddWrite;
  ListDopRazdel := TStringList.Create;
end;

destructor TdmDokument.Destroy;
begin
  ListDopRazdel.Free;
  FScriptDokument.Free;
  inherited;
end;

procedure TdmDokument.SetLastError(const Value: String);
begin
  FLastError := Value;
end;

{
function TdmDokument.WriteAllDokums(ds : TDataSet) : Boolean;
var
  i : Integer;
  fld : TField;
  lErr : Boolean;
begin
  if dmBase.tbAllDokums.FieldByName('ID').AsInteger<>ds.FieldByName('ID').AsInteger then begin
    if dmBase.tbAllDokums.Locate('ID',ds.FieldByName('ID').AsInteger,[]) then begin
      Result:=true;
    end else begin
      Result:=false;
    end;
  end else begin
    Result:=true;
  end;
  if not Result then begin
    PutError('Не найден документ для записи в общей базе.');
  end else begin
    dmBase.tbAllDokums.Edit;
    for i:=0 to dmBase.tbAllDokums.FieldCount-1 do begin
      fld := ds.FindField(dmBase.tbAllDokums.Fields[i].FieldName);
      if fld<>nil then begin
        WriteField(dmBase.tbAllDokums.Fields[i],fld,lErr);
      end;
    end;
    fld := dmBase.tbAllDokums.FindField('NETID');
    if fld <> nil then begin
      if fld.IsNull or (fld.AsInteger=0) then begin
        // затем сделать возможность для настройки значения
        dmBase.tbAllDokums.FieldByName('NETID').AsInteger:=1;
      end;
    end;
    if Assigned(FOnAddWriteAllDokums) then begin
      FOnAddWriteAllDokums( TObject(ds) );
    end;
    dmBase.tbAllDokums.Post;
  end;
end;
}

{
function TdmDokument.WriteOneRecord(Data1, Data2: TDataSet;
  Arr : TArrSootv; l: Boolean): Boolean;
var
  i : Integer;
begin
  Data2.Edit;
  if l then begin
    for i:=Low(Arr) to High(Arr) do begin
      Data2.FieldByName(Arr[i].NameMem).Value := Data1.FieldByName(Arr[i].NameDbf).Value;
    end;
  end else begin
    for i:=Low(Arr) to High(Arr) do begin
      Data2.FieldByName(Arr[i].NameDBF).Value := Data1.FieldByName(Arr[i].NameMem).Value;
    end;
  end;
  Data2.Post;
  Result:=true;
end;
}

procedure TdmDokument.Post;
var
  j : Integer;
begin
  for j:=0 to ComponentCount-1 do begin
    if (Components[j] is TDataSet) then begin
      PostDataSet(TDataSet(Components[j]));
    end;
  end;
end;

procedure TdmDokument.First;
var
  j : Integer;
begin
  for j:=0 to ComponentCount-1 do begin
    if (Components[j] is TDataSet) then begin
      if TDataSet(Components[j]).Active then begin
        PostDataSet(TDataSet(Components[j]));
        TDataSet(Components[j]).First;
      end;
    end;
  end;
end;

function TdmDokument.GetVid: String;
begin
  Result:='ABSTRACT';
end;

procedure TdmDokument.ClearDokument;
begin
//
end;

function TdmDokument.RunProcScript(strNameProc: String;
           var vResult: Variant) : Boolean;
begin
  Result:=false;
  if EnableRunScript then begin
    if (GlobalTask.Script<>nil) then begin
      try
        Result := GlobalTask.Script.RunEx(strNameProc,[],vResult);
      finally
      end;
    end;
  end;
end;

function TdmDokument.CreateNewID: Integer;
begin
  dmBase.tbAllDokums.Append;
  dmBase.tbAllDokums.Post;    // создадим запись с уникальным ключом
  Result := dmBase.tbAllDokums.FieldByName('ID').AsInteger;
//  dmBase. WorkQuery.SQL.Text := 'INSERT INTO trade (id) VALUES ('+IntToStr(id)+')';
//  dmBase.WorkQuery.ExecSQL;
end;

//----------------------------------------------------------
function TdmDokument.StdBeforeWrite: Boolean;
var
//  iddok : Integer;
  v : Variant;
begin
  Result := true;
  LastError := '';
  PostDataSet(mtDokument);
//  if mtDokumentDataV.AsString='' then begin
//    Result:=false;
//    LastError := ' Не заполнена дата выписки документа !';
//    exit;
//  end;
  v := true;
  RunProcScript(GetVid+'_BEFOREWRITE', v);
  if not v then begin //GetGlobalVar('Result') then begin
    Result:=false;
    exit;
  end;
  if mtDokumentID.AsInteger = -1 then begin
//    iddok := CreateNewID;
{
    MainDataSet.Append;
    MainDataSet.FieldByName('ID').AsInteger:=iddok;
    MainDataSet.Post;
}
    mtDokument.Edit;
//    mtDokumentID.AsInteger:=MainDataSet.FieldByName('ID').AsInteger;
    mtDokument.Post;
    SetNextNumber( mtDokumentNomer.AsString );  // для нового документа проверим автонумерацию
  end else begin
  {
    if not MainDataSet.Locate('ID',mtDokumentID.AsInteger,[]) then begin
      LastError := 'Ошибка записи: В базе не найден документ с ID равным '+mtDokumentID.AsString;
      Result := false;
    end else begin
      if Result and not dmBase.tbAllDokums.Locate('ID',mtDokumentID.AsInteger,[]) then begin
        LastError := 'Ошибка записи: В реестре документов не найден документ с ID равным '+mtDokumentID.AsString;
        Result := false;
      end;
    end
    }
  end;
  if Result then begin
  {
    MainDataSet.Edit;
    }
  end;
end;

//---------------------------------------------------------------
// после создания несуществующего документа
procedure TdmDokument.AfterCreateDokument;
var
  v : Variant;
begin
  v := null;
  UserID := GlobalTask.UserID;  // пользователь создавший док.
  mtDokumentNEWDOK.AsBoolean:=true;
  mtDokumentNomer.AsString:=GetNextNumber;    // выдать номер документа
  RunProcScript(GetVid+'_AFTERCREATE', v);
end;

//--------------------------------------------------------
// после чтения документа с диска
function TdmDokument.AfterReadDokument: Boolean;
var
  v : Variant;
begin
  Result := true;
  if (mtDokument.State=dsEdit) or (mtDokument.State=dsInsert) then begin

  end else begin
    mtDokument.Edit;
  end;
  mtDokumentNEWDOK.AsBoolean:=false;
  RunProcScript(GetVid+'_AFTERREAD', v);
  // пользователь прочитавший док., чтобы при записи записать имя ползователя
  // который корректировал документ
  UserID := GlobalTask.UserID;
  //mtDokument.Post;
end;

function TdmDokument.IsNewDok: Boolean;
begin
 Result := (mtDokument.FieldByName('ID').AsInteger=-1);
end;

procedure TdmDokument.SetOnAddWriteAllDokums(const Value: TNotifyEvent);
begin
  FOnAddWriteAllDokums := Value;
end;

procedure TdmDokument.AddWrite(Sender: TObject);
begin
// ничего здесь не писать !!!
end;

// выдать следующий номер документа
function TdmDokument.GetNextNumber: String;
//var
//  nn,j,i1,i2 : Integer;
//  lErrLock : Boolean;
//  lNew : Boolean;
//  ss : String;
begin
  Result := '';
  FNewNomer := 0;
  {
  with dmBase.tbDokumType do begin
    if Locate('ID',GetTypeDok,[]) then begin
      if not FieldByName('AUTONUMBER').IsNull and FieldByName('AUTONUMBER').AsBoolean then begin
        lErrLock := true;
        j:=0;
        while lErrLock and (j<10) do begin
          try
            Edit;
            lErrLock := false;
          except
            lErrLock := true;
          end;
          if lErrLock then begin
            Sleep(50);
            Inc(j);
          end;
        end;
        if not lErrLock then begin
          lNew := false;
          // если нумерация а пределах года
          if not FieldByName('TYPENUMBER').IsNull
             and (FieldByName('TYPENUMBER').AsInteger=1)  then begin
            if not FieldByName('DATENUMBER').IsNull then begin
              i1 := StrToInt(FormatDateTime('YYYY', FieldByName('DATENUMBER').AsDateTime));
              i2 := StrToInt(FormatDateTime('YYYY', dmBase.GetNOW));
              if i2<>i1 then begin
                lNew := true;
              end;
            end;
          end;
          if lNew or (FieldByName('CURNUMBER').AsString='') or
                     (FieldByName('CURNUMBER').AsString='0') then begin
            Result := '1';
          end else begin
            ss := FieldByName('CURNUMBER').AsString;
            try
              nn := StrToInt(ss)+1;
            except
              nn := 1;
            end;
            Result := IntToStr(nn);
          end;
          FNewNomer := StrToInt(Result);
          FieldByName('CURNUMBER').AsString  := Result;
          FieldByName('DATENUMBER').AsDateTime := dmBase.GetNOW;
          Post;
        end else begin
          Result := '';
        end;
      end else begin
        Result := '';
      end;
    end else begin
      Result := '';
    end;
  end;
  }
end;

//---------------------------------------------------------------------
// сохранить номер документа, может пользователь изменил его вручную
// если strCurNomer='' , то пользователь отказался от ввода документа
procedure TdmDokument.SetNextNumber(strCurNomer: String);
//var
//  j, nNew, nCur : Integer;
//  lErrLock : Boolean;
//  lNew : Boolean;
begin
{
  with dmBase.tbDokumType do begin
    if Locate('ID',GetTypeDok,[]) then begin
      if not FieldByName('AUTONUMBER').IsNull and FieldByName('AUTONUMBER').AsBoolean then begin
        lErrLock := true;
        j:=0;
        while lErrLock and (j<10) do begin
          try
            Edit;
            lErrLock := false;
          except
            lErrLock := true;
          end;
          if lErrLock then begin
            Sleep(50);
            Inc(j);
          end;
        end;
        if not lErrLock then begin
          if (FieldByName('CURNUMBER').AsString='') or
             (FieldByName('CURNUMBER').AsString='0') then begin
            nCur := 0;
          end else begin
            nCur := FieldByName('CURNUMBER').AsInteger;
          end;
          if strCurNomer='' then begin // отказ от ввода документа
            // если никто не брал новый номер (работа в сети)
            if FNewNomer = nCur then begin
              // вернем обратно на единицу
              FieldByName('CURNUMBER').AsInteger := nCur-1;
              FieldByName('DATENUMBER').AsDateTime := dmBase.GetNOW;
            end;
          end else begin
            nNew := StrToInt(DropAllChar(strCurNomer));
            if FNewNomer = nCur then begin
              FieldByName('CURNUMBER').AsInteger := nNew;
              FieldByName('DATENUMBER').AsDateTime := dmBase.GetNOW;
            end;
          end;
          Post;
        end else begin

        end;
      end else begin
      end;
    end else begin
    end;
  end;
  }
end;

procedure TdmDokument.SetUserID(const Value: String);
begin
  FUserID := Value;
end;

procedure TdmDokument.SetDateFiks(const Value: TDateTime);
begin
  FDateFiks := Value;
end;

function TdmDokument.CheckDokument(var strErr: String): Boolean;
var
  v : Variant;
begin
  Result := true;
  strErr := '';
  v := true;
  RunProcScript(GetVid+'_CHECK', v);
  if not v then begin //GetGlobalVar('Result') then begin
    Result:=false;
  end;
end;

procedure TdmDokument.DisableControls;
var
  i : Integer;
begin
  for i:=0 to ComponentCount-1 do begin
    if Components[i] is TDataSet then begin
      TDataSet(Components[i]).DisableControls;
    end;
  end;
end;

procedure TdmDokument.EnableControls;
var
  i : Integer;
begin
  for i:=0 to ComponentCount-1 do begin
    if Components[i] is TDataSet then begin
      TDataSet(Components[i]).EnableControls;
    end;
  end;
end;

function TdmDokument.ParAsString(sl: TStringList; sPar: String): String;
begin
  Result:='';
  if (sl<>nil) and (sl.Count>0) then begin
    Result:=Trim(sl.Values[sPar]);
  end;
end;
//----------------------------------------------------------------------------------------
function TdmDokument.CreateNameOsnForEdit(sPunkt,sName,sUkaz:String):String;
begin
  if sUKAZ='ЖК' then begin
    if sPUNKT=''
      then Result:=sName
      else Result:=sPUNKT+' Жилищного кодекса РБ';
  end else begin
    if sPUNKT=''
      then Result:=sName
      else Result:='п'+sPUNKT+' положения указа №'+sUKAZ;
  end;
end;
//----------------------------------------------------------------------------------------
procedure TdmDokument.ReadKodAndText(fldDescKod,fldDescText,fldSourKod,fldSourText : TField; tbSpr : TDataSet);
begin
  fldDescKod.AsString := fldSourKod.AsString;
  if (fldDescKod.AsString<>'') and (fldDescKod.AsString<>'0') then begin
    if tbSpr.Locate('ID', fldDescKod.AsString, []) then begin
      fldDescText.AsString :=CreateNameOsnForEdit(tbSpr.FieldByName('PUNKT').AsString,
                                                  tbSpr.FieldByName('NAME').AsString,
                                                  tbSpr.FieldByName('UKAZ').AsString); //tbSpr.FieldByName('NAME').AsString;
    end else begin
      fldDescText.AsString := '';
    end;
  end else begin
    fldDescText.AsString := fldSourText.AsString;
  end;
end;
//----------------------------------------------------------------------------------------
procedure TdmDokument.OpenTableFactor;
begin
  tbPropertys.Active:=true;
end;

procedure TdmDokument.DeleteAllFactor;
begin
  tbPropertys.EmptyTable;
end;

procedure TdmDokument.DeleteFactor(sName: String);
begin
  if tbPropertys.Locate('NAME',ANSIUpperCase(sName),[]) then begin
    tbPropertys.Delete;
  end;
end;

function TdmDokument.GetFactorEx(sName: String; vDefault:Variant): Variant;
begin
  Result:=GetFactor(sName);
  if Result=null then begin
    Result:=vDefault;
  end;
end;

function TdmDokument.GetFactor(sName: String): Variant;
var
  vType:TVarType;
begin
  Result:=null;
  if tbPropertys.Locate('NAME',ANSIUpperCase(sName),[]) then begin
    vType:=TVarType(tbPropertysTYPE.AsInteger);
    case vType of
      varString  :  Result:=tbPropertysVALUE.AsString;
      varBoolean :  Result:=IIFB(tbPropertysVALUE.AsString='1',true,false);
      varDate    :  Result:=STOD(tbPropertysVALUE.AsString,tdClipper);
      varInteger,varSmallint,varShortInt,varByte,varWord,varLongWord : Result:=StrToInt(tbPropertysVALUE.AsString);
      varInt64 : Result:=StrToInt64(tbPropertysVALUE.AsString);
      varSingle,varDouble,varCurrency : Result:=StrToFloat(tbPropertysVALUE.AsString);
    end;
  end;
end;

function TdmDokument.SetFactor(sName: String;  vValue: Variant): Boolean;
var
  vType:TVarType;
begin
  if tbPropertys.Locate('NAME',ANSIUpperCase(sName),[]) then begin
    tbPropertys.Edit;
  end else begin
    tbPropertys.Append;
    tbPropertysNAME.AsString:=ANSIUpperCase(sName);
  end;
  vType:=VarType(vValue);
  tbPropertysTYPE.AsInteger:=Integer(vType);
  case vType of
    varString  : tbPropertysVALUE.AsString:=vValue;
    varBoolean : tbPropertysVALUE.AsString:=IIFC(vValue=true,'1','0');
    varDate    : tbPropertysVALUE.AsString:=DTOS(vValue,tdClipper);
    varInteger,varSmallint,varShortInt,varByte,varWord,varLongWord
               : tbPropertysVALUE.AsString:=IntToStr(vValue);
    varInt64   : tbPropertysVALUE.AsString:=IntToStr(vValue);
    varSingle,varDouble,varCurrency : tbPropertysVALUE.AsString:=FloatToStr(vValue);
  end;
  tbPropertys.Post;
  Result:=true;
end;

//------------------------------------------------------------------------------
function TdmDokument.GetHistValueField(strFieldName: String; nType: Integer): Variant;
var
  fld : TField;
begin
  Result := null;
  fld := mtDokument.FindField(strFieldName);
  if fld<>nil then begin
    case nType of
      // вернуть текущее значение
      0 : Result := fld.Value;
      // вернуть все исторические значения
      1 : begin
            Result := '';
            if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
              if tbHistory.RecordCount > 0 then begin
                tbHistory.Filter   := 'FIELDNAME='+QStr(UpperCase(strFieldName));
                tbHistory.Filtered := true;
                while not tbHistory.Eof do begin
                  Result := Result + Trim(tbHistoryStringValue.AsString)+'  ';
                  tbHistory.Next;
                end;
                tbHistory.Filtered:=false;
                tbHistory.Filter:='';
                Result := Trim(Result);
              end;
            end;
          end;
      // вернуть первое историческое значения
      2 : begin
            Result := '';
            if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
              if tbHistory.RecordCount > 0 then begin
                tbHistory.Filter   := 'FIELDNAME='+QStr(UpperCase(strFieldName));
                tbHistory.Filtered := true;
                tbHistory.First;
                if not tbHistory.Eof then begin
                  Result := tbHistoryStringValue.AsString;
                end;
                tbHistory.Filtered:=false;
                tbHistory.Filter:='';
              end;
            end;
          end;
    end;
  end;
end;

//-----------------------------------------------------------------------------------
//----------- Решения ------------------------------------------
procedure TdmDokument.ReadReshObj( nID,nIDNew : Integer; nTypeObj : Integer; lClear:Boolean);
begin
{
  if tbResh.Active then begin
    if lClear then tbResh.EmptyTable;
    dmBase.tbResh.IndexName := 'PR_KEY';
    dmBase.tbResh.SetRange([nTypeObj,nID],[nTypeObj,nID]);
    if nIDNew<=0 then nIDNew:=nID;
    while not dmBase.tbResh.Eof do begin
      tbResh.Append;
      tbReshTIP.AsString   := dmBase.tbResh.FieldByName('TIP').AsString;
      tbReshDATER.Value    := dmBase.tbResh.FieldByName('DATER').Value;
      tbReshNOMER.AsString := dmBase.tbResh.FieldByName('NOMER').AsString;
      tbReshPRIM.AsString  := dmBase.tbResh.FieldByName('PRIM').AsString;
      tbResh.Post;
      dmBase.tbResh.Next;
    end;
    dmBase.tbResh.CancelRange;
  end;
  }
end;
//-----------------------------------------------------------------------------------
procedure TdmDokument.WriteReshObj( nID,nIDNew : Integer; nTypeObj : Integer);
begin
end;

//-----------------------------------------------------------------------------------
procedure TdmDokument.ReadHistory( nID,nIDNew : Integer; nTypeObj : Integer; lClear:Boolean);
var
  i : Integer;
  strFieldName,strHint : String;
  p : TPersistent;
  fld : TField;
begin
  if tbHistory.Active then begin
    p := nil;
    if lClear then
      tbHistory.EmptyTable;
    dmBase.tbHistoryZAGS.IndexName := 'PR_KEY';
    dmBase.tbHistoryZAGS.SetRange([nTypeObj,nID],[nTypeObj,nID]);
    if nIDNew<=0 then nIDNew:=nID;
    try
      strFieldName := '###';
      strHint      := '';
      while not dmBase.tbHistoryZAGS.Eof do begin
        tbHistory.Append;
        tbHistoryID.AsInteger := nIDNew;
        tbHistoryFieldName.AsString   := UpperCase(dmBase.tbHistoryZAGS.FieldByName('FIELDNAME').AsString);
        if strFieldName<>tbHistoryFieldName.AsString then begin
          if IsShowHistoryAsHint and (p<>nil) and (strHint<>'') then begin
            SetPropertyObject( p, 'Hint', Copy(strHint,3,200) );
          end;
          strHint := '';
          strFieldName:=tbHistoryFieldName.AsString;
{
          for i:=0 to ComponentCount-1 do begin
            if Components[i] is TCustomDbEditEh then begin
              if UpperCase(TCustomDbEditEh(Components[i]).Field.FieldName) = tbHistoryFieldName.AsString then begin
                p := Components[i];
                SetPropertyObject( Components[i], 'Color', COLOR_HIST);
                break;
              end;
            end;
          end;
}
        end;
        fld := mtDokument.FindField(strFieldName);

        tbHistoryInfo.AsString:=dmBase.tbHistoryZAGS.FieldByName('INFO').AsString;
        tbHistoryTypeDate.AsString:=dmBase.tbHistoryZAGS.FieldByName('TYPEDATE').AsString;
        tbHistoryDatePropis.AsString:=dmBase.tbHistoryZAGS.FieldByName('DATEPROPIS').AsString;

        tbHistoryValue.AsString:=dmBase.tbHistoryZAGS.FieldByName('VALUE').AsString;
        tbHistoryStringValue.AsString:=tbHistoryValue.AsString;
        if fld.DataType=ftDate then begin
          tbHistoryStringValue.AsString:=DatePropis(STOD( tbHistoryValue.AsString, tdAds),1);
        end else if fld.DataType=ftTime then begin
          tbHistoryStringValue.AsString:=FormatDateTime('hh час nn мин', STOT( tbHistoryValue.AsString ));
        end else if (p<>nil) and (p is TDBLookupComboboxEh ) then begin
          if TDBLookupComboboxEh(p).ListSource.DataSet.Locate(TDBLookupComboboxEh(p).KeyField,
                   tbHistoryValue.AsString, [])
            then tbHistoryStringValue.AsString:=TDBLookupComboboxEh(p).ListSource.DataSet.FieldByName(TDBLookupComboboxEh(p).ListField).AsString;
        end else if (p<>nil) and (p is TDBComboBoxEh ) then begin
          i := TDBComboBoxEh(p).KeyItems.IndexOf(tbHistoryValue.AsString);
          if i > -1 then begin
            tbHistoryStringValue.AsString:=TDBComboBoxEh(p).Items.Strings[i];
          end;
        end;
        WriteDateField( tbHistoryDateIzm, dmBase.tbHistoryZAGS.FieldByName('DATEIZM'));
        tbHistory.Post;
        if IsShowHistoryAsHint then begin
          strHint := strHint + ', '+ tbHistoryStringValue.AsString;
        end;
        dmBase.tbHistoryZAGS.Next;
      end;
      if IsShowHistoryAsHint and (p<>nil) and (strHint<>'') then begin
        SetPropertyObject( p, 'Hint', Copy(strHint,3,200));
      end;
    finally
      dmBase.tbHistoryZAGS.CancelRange;
    end;
  end;
end;

//-----------------------------------------------------------------------------------
procedure TdmDokument.WriteHistory( nID,nIDNew : Integer; nTypeObj : Integer);
begin
  if tbHistory.Active then begin
    dmBase.tbHistoryZAGS.IndexName := 'PR_KEY';
    dmBase.tbHistoryZAGS.SetRange([nTypeObj,nID],[nTypeObj,nID]);
    while not dmBase.tbHistoryZAGS.Eof do dmBase.tbHistoryZAGS.Delete;
    dmBase.tbHistoryZAGS.CancelRange;
    tbHistory.First;
    while not tbHistory.Eof do begin
      if tbHistoryID.AsInteger=nIDNew then begin
        dmBase.tbHistoryZAGS.Append;
        dmBase.tbHistoryZAGS.FieldByName('TYPEOBJ').AsInteger := nTypeObj;
        dmBase.tbHistoryZAGS.FieldByName('ID').AsInteger := nID;
        dmBase.tbHistoryZAGS.FieldByName('FIELDNAME').AsString := UpperCase(tbHistoryFieldName.AsString);
        dmBase.tbHistoryZAGS.FieldByName('VALUE').AsString := tbHistoryValue.AsString;
        dmBase.tbHistoryZAGS.FieldByName('DATEIZM').AsDateTime := tbHistoryDateIzm.AsDateTime;
        dmBase.tbHistoryZAGS.FieldByName('DATEZ').AsDateTime:=dmBase.GetCurDate;

        dmBase.tbHistoryZAGS.FieldByName('TYPEDATE').AsInteger := tbHistoryTypeDate.AsInteger;
        dmBase.tbHistoryZAGS.FieldByName('DATEPROPIS').AsString := tbHistoryDatePropis.AsString;
        dmBase.tbHistoryZAGS.FieldByName('INFO').AsString := tbHistoryInfo.AsString;

        dmBase.tbHistoryZAGS.Post;
      end;
      tbHistory.Next;
    end;
    tbHistory.First;
  end;
end;

{ TDokument }

function TDokument.Fld(strFieldName: String): TField;
begin
  Result := Dokument.mtDokument.FieldByName(strFieldName);
end;

procedure TDokument.NewDok;
begin
//
end;

function TDokument.ReadDokument(ID: Integer; slPar : TStringList): Boolean;
begin
  Result := FDokument.ReadDokument(ID,slPar);
end;

procedure TDokument.SetDokument(const Value: TdmDokument);
begin
  FDokument := Value;
end;

function TDokument.WriteDokument: Boolean;
begin
  Result:=FDokument.WriteDokument;
end;

procedure TdmDokument.tbDopPropAfterOpen(DataSet: TDataSet);
//var
//  i,n:Integer;
begin
{
  for i:=0 to tbDopProp.FieldDefs.Count-1 do begin
    n:=Pos('_TYPEOBJ_',tbDopProp.FieldDefs.Items[i].DisplayName);
    if n>0 then begin
      tbDopProp.Fields[i].Tag:=StrtoInt(tbDopProp.FieldDefs.Items[i].DisplayName);
    end else begin

    end;
  end;
  }
end;

//----------------------------------------------------------------------------------
// прочитать данные из строки sValues (fieldname=value ...) в соответствующие поля dsDok
procedure TdmDokument.ReadAddData(sValues:String; dsDok:TDataSet);
var
  fldVal:TField;
  i,n:Integer;
  arrVal:TArrStrings;
  sVal:String;
  AYear,AMonth,ADay,AHour,AMin,ASec:Word;
begin
  StrToArr(sValues, arrVal,CRLF, true);
  for i:=0 to Length(arrVal)-1 do begin
    n:=Pos('=', arrVal[i]);
    if n>0 then begin
      fldVal:=dsDok.FindField(Copy(arrVal[i],1,n-1));
      sVal:=Trim(Copy(arrVal[i],n+1,Length(arrVal[i])));
      if (fldVal<>nil) and (sVal<>'') then begin
        if (fldVal.DataType=ftDateTime) or (fldVal.DataType=ftDate) then begin
          try
            AYear  :=StrToInt(string(copy(sVal, 1, 4)));
            AMonth :=StrToInt(string(copy(sVal, 6, 2)));
            ADay   :=StrToInt(string(copy(sVal, 9, 2)));
            if Length(sVal)>16 then begin
              AHour:=StrToInt(string(copy(sVal, 12, 2)));
              AMin :=StrToInt(string(copy(sVal, 15, 2)));
              ASec :=StrToIntDef(string(copy(sVal, 18, 2)), 0);
            end else begin
              AHour:=0;
              AMin :=0;
              ASec :=0;
            end;
            fldVal.AsDateTime:=EncodeDateTime(AYear,AMonth,ADay,AHour,AMin,ASec,0);
          except
            fldVal.AsString:='';
          end;
        end else begin
          fldVal.AsString:=Copy(arrVal[i],n+1,Length(arrVal[i]));
          if Pos('<CRLF>', fldVal.AsString)>0
            then fldVal.AsString:=StringReplace(fldVal.AsString, '<CRLF>', CRLF, [rfReplaceAll, rfIgnoreCase]);
        end;
      end;
    end;
  end;
end;
//----------------------------------------------------------------------------------
// выгрузить поля sFields из dsDok в стороку для последующей записи в Memo-поле
function TdmDokument.PrepareAddData(dsDok:TDataSet; sFields:String):String;
var
  fld:TField;
  i:Integer;
  arr:TArrStrings;
  s,sFmt,sVal:String;
begin
  Result:='';
  StrToArr(sFields, arr, ';', true);
  for i:=0 to Length(arr)-1 do begin
    fld:=dsDok.FindField(arr[i]);
    if (fld<>nil) and (fld.AsString<>'') then begin
      if (fld.DataType=ftDateTime) or (fld.DataType=ftDate) then begin
        if fld.AsDateTime>0 then begin
          if fld.DataType=ftDate then sFmt:='yyyy-mm-dd' else sFmt:='yyyy-mm-dd hh:nn:ss';
          s:=FormatDateTime(sFmt, fld.AsDateTime);
          Result:=Result+fld.FieldName+'='+s+CRLF;
        end;
      end else begin
        s:=fld.AsString;
        s:=StringReplace(s,CRLF, '<CRLF>', [rfReplaceAll, rfIgnoreCase]);
        Result:=Result+fld.FieldName+'='+s+CRLF;
      end;
    end;
  end;
end;

procedure TdmDokument.tbNalogiCalcFields(DataSet: TDataSet);
var
  nSumNal, nSumOpl : Extended;
begin
  if tbNalogiSUMMA_VIST.AsString='' then begin
    nSumNal := 0;
  end else begin
    nSumNal := tbNalogiSUMMA_VIST.AsFloat;
  end;
  if tbNalogiSUMMA_OPL.AsString='' then begin
    nSumOpl := 0;
  end else begin
    nSumOpl := tbNalogiSUMMA_OPL.AsFloat;
  end;
  tbNalogiDELTA.AsFloat := nSumOpl - nSumNal;
end;
//------------------------------------
procedure TdmDokument.tbNalogiAfterInsert(DataSet: TDataSet);
begin
//  tbNalogiTYPEOBJ.AsInteger:=FTypeObj; // !!!
end;
procedure TdmDokument.tbNalogiBeforePost(DataSet: TDataSet);
begin
  tbNalogiTYPEOBJ.AsInteger:=FTypeObj; // !!!
end;
//------------------------------------
procedure TdmDokument.ReadNalogi(nTypeObj:Integer; nLicID:Integer; nAdresID:Integer; slMens:TStringList; slLich:TStringList);
var
  ID, nType, i:Integer;
  slSeek:TStringList;
begin
  slSeek:=TStringList.Create;
  if nLicID>0 then  slSeek.Add(IntToStr(_TypeObj_Lich)+'='+IntToStr(nLicID));
  if nAdresID>0 then  slSeek.Add(IntToStr(_TypeObj_Adres)+'='+IntToStr(nAdresID));
  if (slMens<>nil) and (slMens.Count>0) then begin
    for i:=0 to slMens.Count-1 do begin
      slSeek.Add(IntToStr(_TypeObj_Nasel)+'='+slMens.Strings[i]);
    end;
  end;
  if (slLich<>nil) and (slLich.Count>0) then begin
    for i:=0 to slLich.Count-1 do begin
      slSeek.Add(IntToStr(_TypeObj_Lich)+'='+slLich.Strings[i]);
    end;
  end;
  tbNalogi.EmptyTable;
  tbNalogi.BeforePost:=nil;  // ВАЖНО !!!
  with dmBase.tbNalogi do begin
    IndexName := 'PR_KEY';  // 'DATE_FIKS;TYPEOBJ;ID ... '
    for i:=0 to slSeek.Count-1 do begin
      nType:=StrToInt(slSeek.Names[i]);
      ID:=StrToInt(slSeek.ValueFromIndex[i]);
      SetRange([DateFiks,nType,ID],[DateFiks,nType,ID]);
      while not Eof do begin
        tbNalogi.Append;
        tbNalogiID.AsString:=FieldByName('ID').AsString;
        tbNalogiTYPEOBJ.AsInteger:= nType;
        tbNalogiGOD.AsString    := FieldByName('GOD').AsString;
        tbNalogiNALOG.AsString  := FieldByName('NALOG').AsString;
        tbNalogiPERIOD.AsString := FieldByName('PERIOD').AsString;
        tbNalogiNOMER.AsString  := FieldByName('NOMER').AsString;
        WriteDateField( tbNalogiDATE_VIST, FieldByName('DATE_VIST'));
  //            tbNalogiDATE_VIST.AsDateTime := FieldByName('DATE_VIST').AsDateTime;
        tbNalogiSUMMA_VIST.AsString  := FieldByName('SUMMA_VIST').AsString;
        WriteDateField( tbNalogiDATE_OPL, FieldByName('DATE_OPL'));
  //            tbNalogiDATE_OPL.AsDateTime  := FieldByName('DATE_OPL').AsDateTime;
        tbNalogiSUMMA_OPL.AsString   := FieldByName('SUMMA_OPL').AsString;
        tbNalogiNOMER_OPL.AsString   := FieldByName('NOMER_OPL').AsString;
        tbNalogiMEN_ID.AsString:=FieldByName('MEN_ID').AsString;
        WriteDateField( tbNalogiDATE_SROK, FieldByName('DATE_SROK'));
        tbNalogi.Post;
        Next;
      end;
      CancelRange;
    end;
  end;
  tbNalogi.BeforePost:=tbNalogiBeforePost; // ВАЖНО !!!     заполнятся TYPEOBJ
  slSeek.Free;
end;

//------------------------------------
procedure TdmDokument.WriteNalogi(nTypeObj:Integer; ID:Integer);
begin
  dmBase.DeleteFromListEx('Nalogi', DateFiks, nTypeObj, ID);
  tbNalogi.First;
  with dmBase.tbNalogi do begin
    while not tbNalogi.Eof do begin
      // !!! пишем налоги только для соответствующего типа объекта !!!
      if not tbNalogiGOD.IsNull and not tbNalogiNALOG.IsNull and (tbNalogiTYPEOBJ.AsInteger=nTypeObj) then begin
        Append;
        FieldByName('DATE_FIKS').Value := DateFiks;
        FieldByName('ID').Value        := ID;
        FieldByName('TYPEOBJ').Value   := nTypeObj;
        FieldByName('GOD').AsString    := tbNalogiGOD.AsString;
        FieldByName('NALOG').AsString  := tbNalogiNALOG.AsString;
        FieldByName('PERIOD').AsString := tbNalogiPERIOD.AsString;
        FieldByName('NOMER').AsString  := tbNalogiNOMER.AsString;
        WriteDateField( FieldByName('DATE_VIST'), tbNalogiDATE_VIST);
        FieldByName('SUMMA_VIST').AsString  := tbNalogiSUMMA_VIST.AsString;
        WriteDateField( FieldByName('DATE_OPL'), tbNalogiDATE_OPL);
        FieldByName('SUMMA_OPL').AsString   := tbNalogiSUMMA_OPL.AsString;
        FieldByName('NOMER_OPL').AsString   := tbNalogiNOMER_OPL.AsString;
        FieldByName('MEN_ID').AsString:=tbNalogiMEN_ID.AsString;
        WriteDateField( FieldByName('DATE_SROK'), tbNalogiDATE_SROK);
        try
          Post;
        except
          Cancel;
        end;
      end;
      tbNalogi.Next;
    end;
    tbNalogi.First;
  end;
end;

initialization
finalization
end.
