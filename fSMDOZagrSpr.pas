unit fSMDOZagrSpr;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dbt, ShellApi,EncdDecd, Variants,
  DBCtrlsEh, StdCtrls, Mask, Buttons, SasaIniFile, mVerInfo, ZipForge, Db, uProject, uProjectAll, Math,
  adsdata, adsfunc, adstable, adscnnct, MetaTask, FileCtrl, NativeXML, mPermit, kbmMemtable, ifpii_dbfunc,
  Types, wsSMDOClassifA, wsSMDOClassifH, SOAPHTTPClient, TypInfo, OpisEdit, 
  uUtilFiles, FuncPr;

type

  status_nci = (nciOK, nciFAIL, nciPROCESS);

  TfmSMDOZagrSpr = class(TForm)
    btOk: TBitBtn;
    btCancel: TBitBtn;
    Label1: TLabel;
    cbChoice: TDBCheckBoxEh;
    edDisk: TDBComboBoxEh;
    edPath: TDBEditEh;
    Zip: TZipForge;
    OpenDialog: TOpenDialog;
    cbWebService: TCheckBox;
    cbTypeSpr: TComboBox;
    cbTypeLoad: TComboBox;
    edDate1: TDBDateTimeEditEh;
    lbDate1: TLabel;
    lbDate2: TLabel;
    edDate2: TDBDateTimeEditEh;
    procedure FormCreate(Sender: TObject);
    procedure cbChoiceClick(Sender: TObject);
    procedure edPathEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure cbTypeLoadChange(Sender: TObject);
    procedure btOkClick(Sender: TObject);
  private
    FPath:String;
    FPathTmp:String;
    FProtokol:TStringList;
    FFields:TStringList;
    FDefPath : String;
    FDict:String;
    FActualDate:TDateTime;
    FLastDate:TDateTime;
    FTypeLoadSpr: Integer;
    function ExtractZIPFile(sFile:String; var sTmpPath:String):String;
    procedure AddProtokol(s:String);
    procedure SetTypeLoadSpr(const Value: Integer);
  public
    XML:TNativeXML;
    XMLResult:TNativeXML;
    RIO : THTTPRIO;
    FRun:Boolean;
    FFull:Boolean;
    DictServiceA : IActualDictionaryWebService;
    DictServiceH : IHistoryDictionaryWebService;
    FGuid:string;
    FStatus:String;
    FMessage:String;
    FTypeStep:Integer;
    property TypeLoadSpr:Integer read FTypeLoadSpr write SetTypeLoadSpr;
    function getValue(sNode:String):String;
    procedure CreateListDisk;
    function CopyBaseFiles(lWebService:Boolean; lShow:Boolean; var sSoob:String):Boolean;
    function CheckCreateDate(sSpr:String):Boolean;

    function ReadStruct(node:TXMLNode):Boolean;
    function LoadSpr(node_data:TXMLNode; sName:String; sTableName:String; nType:Integer; lChange:Boolean; lShow:Boolean):Boolean;
    function GetDateTime(ADate:String):TDateTime;

    procedure WMDEVICECHANGE(var Msg : TMessage); message WM_DEVICECHANGE;

    procedure RIOAfterExecute(const MethodName: string; SOAPResponse: TStream);
    procedure RIOBeforeExecute(const MethodName: string; var SOAPRequest: WideString);

    function getURL:String;
    function RunCharge(var sSoob:String):Boolean;
    function RunReceive(var sSoob:String):status_nci;
    function CheckParams(var sSoob:String):Boolean;

  end;

//  procedure CheckAndRunSprSMDO(sPath:String; sFile:String);
  function CheckAndRunSprSMDO_(sPath:String; sName:String; var sSoob:String):Boolean;
  function RunZagrSprSMDO2(nType:Integer; dFile:TDateTime; sFileName:String):Boolean;

  procedure RunZagrSprSMDO;
  function RunWebSprSMDO(lShowProcess:Boolean):Boolean;

var
  fmSMDOWebNCI : TfmSMDOZagrSpr;

implementation

uses fMain, dBase, StrUtils, {uSMDO2XML,} uSMDO, fMyNotify;

{$R *.DFM}

const
 CHARGE=1;
 RECEIVE=2;

//---------------------------------------------------------------------
procedure UpdateKeyList;
var
  Opis : TOpisEdit;
begin
  Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_DOC_KIND');
  if Opis<>nil then Opis.KeyListFromDataSet:=true;
end;
//---------------------------------------------------------------------
var
  lOpenMessage:Boolean;

//---------------------------------------------------------------------
{
procedure CheckAndRunSprSMDO(sPath:String; sFile:String);
var
  s,sFile:String;
  l:Boolean;
begin
  if (SMDO<>nil) and SMDOEnabled then begin
    lOpenMessage:=false;
    if SMDO.PathUpdateSpr<>'' then begin
      l:=CheckAndRunSprSMDO_(sPath, 'spr'+SMDO.NameTypeSpr(SMDO_SPR_ORG, '')+'.zip', s);
//      if l
//        then AddNotifyProg(fmMain, s, false, true);
//      l:=CheckAndRunSprSMDO_(SMDO.PathUpdateSpr, 'spr'+SMDO.NameTypeSpr(SMDO_SPR_VIDDOK, '')+'.zip', s);
//      if l
//        then AddNotifyProg(fmMain, s, false, true);
      if lOpenMessage
        then CloseMessage;
    end;
    lOpenMessage:=false;
  end;
end;
}
//---------------------------------------------------------------------
function CheckAndRunSprSMDO_(sPath:String; sName:String; var sSoob:String):Boolean;
var
  lOk : Boolean;
  SearchRec: TSearchRec;
  s,sFileName : String;
  f:TfmSMDOZagrSpr;
  n:Integer;
  dCur,dNew:TDateTime;
begin
  Result:=false;
  sSoob:='';
  n:=FileAge(sFileName);
  if n>-1
    then dCur:=FileDateToDateTime(n)
    else dCur:=0;
  n:=FileAge(sPath+sName);
  if n>-1
    then dNew:=FileDateToDateTime(n)
    else dNew:=0;
  lOk:=false;
  if (dNew>0) and (dNew>dCur) then begin
    ForceDirectories(ExtractFilePath(Application.ExeName)+'Arxiv');
    if CopyFile(PChar(sPath+sName), PChar(sFileName), false) then begin
      lOk:=true;
    end else begin
      sSoob:='Ошибка копирования файла : '+sPath+sName+
                      #13+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')';
    end;
  end;
  if lOk then begin
    if not lOpenMessage then begin
      OpenMessage('Загрузка справочников СМДО ...');
      lOpenMessage:=true;
    end;
    f:=TfmSMDOZagrSpr.Create(nil);
    try
      f.TypeLoadSpr:=0;
      f.edPath.Text:=sFileName;
      Result:=f.CopyBaseFiles(false, false, sSoob);
      if sSoob<>''
        then AddNotifyProg(fmMain, sSoob, false, true,0,0);
      UpdateKeyList;
    finally
      f.Free;
    end;
  end;
end;
//---------------------------------------------------------------------
function RunZagrSprSMDO2(nType:Integer; dFile:TDateTime; sFileName:String):Boolean;
var
  f:TfmSMDOZagrSpr;
  s, sSoob:String;
begin
  Result:=false;
  f:=TfmSMDOZagrSpr.Create(nil);
  try
    f.TypeLoadSpr:=0;
    f.edPath.Text:=sFileName;
    Result:=f.CopyBaseFiles(false, true, sSoob);
    if Result then begin
      if nType=SMDO_SPR_VIDDOK
        then s:='LAST_UPDATE_SPRVIDDOK'
        else s:='LAST_UPDATE_SPRORG';
      GlobalTask.SetLastValueAsDate(s, dFile);
      DeleteFile(sFileName);
    end;
//    if sSoob<>''
//      then AddNotifyProg(fmMain, sSoob, false, true,0,0);
    UpdateKeyList;
  finally
    f.Free;
  end;
end;
//---------------------------------------------------------------------
procedure RunZagrSprSMDO;
var
  f:TfmSMDOZagrSpr;
  sSoob:String;
begin
  f := TfmSMDOZagrSpr.Create(nil);
  f.TypeLoadSpr:=0;
  try
    if f.ShowModal = mrOk then begin
      f.CopyBaseFiles(f.cbWebService.Checked, true, sSoob);
      UpdateKeyList;
    end;
  finally
    f.Free;
  end;
end;
//---------------------------------------------------------------
function RunWebSprSMDO(lShowProcess:Boolean):Boolean;
var
  sSoob,sFile:String;
  st:status_nci;
begin
  Result:=false;
  if fmSMDOWebNCI=nil then begin  // будем запрашивать справочник или изменения
    fmSMDOWebNCI:=TfmSMDOZagrSpr.Create(nil);
    fmSMDOWebNCI.FRun:=false;
    fmSMDOWebNCI.TypeLoadSpr:=1;
    fmSMDOWebNCI.Caption:='Обновление справочника СМДО (веб-сервис)';
    fmSMDOWebNCI.btOK.Caption:='Заказать';
    try
      Result:=fmSMDOWebNCI.CheckParams(sSoob);
      if Result then begin
        if fmSMDOWebNCI.ShowModal = mrOk then begin
          if Result then begin
            Result:=fmSMDOWebNCI.RunCharge(sSoob);
          end;
          if sSoob<>'' then ShowMessage(sSoob);
        end else begin
          Result:=false;
        end;
      end else begin
        PutError(sSoob);
      end;
    finally
      if not Result
        then FreeAndNil(fmSMDOWebNCI);
  //    f.Free;
    end;
    if Result then begin
      fmMain.TimerPKNCI.Enabled:=true;
    end;
  end else begin                  // будем скачивать справочник или изменения
    if fmSMDOWebNCI.FRun then exit;
    fmSMDOWebNCI.FRun:=true;
    st:=fmSMDOWebNCI.RunReceive(sSoob);
    try
      if st=nciOK then begin
        fmMain.TimerPKNCI.Enabled:=false;    // отключим таймер
        sFile:=Trim(fmSMDOWebNCI.edPath.Text);
        if (sFile='') or not FileExists(sFile) then begin
          PutError('Не найден файл для загрузки');
        end else begin
          Result:=fmSMDOWebNCI.CopyBaseFiles(false, true, sSoob);
          UpdateKeyList;
        end;
      end else if st=nciPROCESS then begin   // процесс еще идет таймер не отключаем
        Result:=true;
        if lShowProcess
          then ShowMessage(sSoob);
      end else if st=nciFAIL then begin
        fmMain.TimerPKNCI.Enabled:=false;    // отключим таймер
        PutError(sSoob);
      end;
    finally
      fmSMDOWebNCI.FRun:=false;
      if (st=nciOK) or (st=nciFAIL) then begin
        FreeAndNil(fmSMDOWebNCI);
      end;
    end;
  end;
end;
//------------------------------------------------------------------------
function TfmSMDOZagrSpr.getURL:String;
begin
  Result:=Trim(SMDO.getAdresPkNCI);
  if Result<>'' then  begin
    if FFull
      then Result:=Result+'/ws/actualDictionaryWebService'
      else Result:=Result+'/ws/historyDictionaryWebService';
  end;
end;
//------------------------------------------------------------------------
function TfmSMDOZagrSpr.CheckParams(var sSoob:String):Boolean;
begin
  Result:=true;
  sSoob:='';
  if getUrl='' then begin
    sSoob:=sSoob+'Не установлен адрес для доступа к ПК НСИ'#13#10;
    Result:=false;
  end;
  if Trim(SMDO.getPkNCI)='' then begin
    sSoob:=sSoob+'Не установлен идентификатор для доступа к Web-сервисам ПК НСИ';
    Result:=false;
  end;
end;
//------------------------------------------------------------------------
function TfmSMDOZagrSpr.RunReceive(var sSoob:String):status_nci;
var
  rd:receiveActualDictionary;
  rdr:receiveActualDictionaryResponse;
  rdh:receiveHistoryDictionary;
  rdrh:receiveHistoryDictionaryResponse;
//  data:TByteDynArray;
  s:string;
  n:Integer;
begin
  edPath.Text:=FPathTmp+'data_spr.zip';
  Result:=nciFAIL;
  sSoob:='';
  XMLResult.Clear;        
  if FGuid='' then begin
    sSoob:='Незаполнен идентификатор запроса';
  end else begin
    DeleteFile(edPath.Text);
    if FFull then begin
      DictServiceA:=GetSMDOClassifAWs(getUrl, '', RIO);
      if (DictServiceA<>nil) then begin
        rd:=receiveActualDictionary.Create;
        rd.requestGuid:=FGuid;
        Result:=nciOK;
        rdr:=nil;
        try             
          FTypeStep:=RECEIVE;
          rdr:=DictServiceA.receiveActualDictionary(rd);
        except
          on E:Exception do begin
            sSoob:=E.Message;
            Result:=nciFAIL;
          end;
        end;
        rd.Free;
      end;
    end else begin
      DictServiceH:=GetSMDOClassifHWs(getUrl, '', RIO);
      if (DictServiceH<>nil) then begin
        rdh:=receiveHistoryDictionary.Create;
        rdh.requestGuid:=FGuid;
        Result:=nciOK;
        rdrh:=nil;
        try
          FTypeStep:=RECEIVE;
          rdrh:=DictServiceH.receiveHistoryDictionary(rdh);
        except
          on E:Exception do begin
            sSoob:=E.Message;
            Result:=nciFAIL;
          end;
        end;
        rdh.Free;
      end;
    end;
    if (Result=nciOK) and not XMLResult.IsEmpty then begin //(rdr<>nil) then begin
      FStatus:=getValue('status');
      FMessage:=getValue('message'); //'STATUS','');// cdr.message_;
      sSoob:=FMessage;
      if (FStatus='OK') then  begin
        s:=getValue('dictionaryData');
        if FFull then begin
          SaveStringToFile(edPath.Text,DecodeString(s));
        end else begin
          SaveStringToFile(edPath.Text,DecodeString(s));
        end;
      end else if (FStatus='PROCESS') then begin
        Result:=nciPROCESS;
      end else if (FStatus='FAIL') then begin
        Result:=nciFAIL;
      end;
    end;
  end;
  if (Result=nciFAIL) and (sSoob='') then sSoob:='Неизвестная ошибка';
end;

//------------------------------------------------------------------------
function TfmSMDOZagrSpr.RunCharge(var sSoob:String):Boolean;
var
  cd:chargeActualDictionary;
  cdr:chargeActualDictionaryResponse;
  cdh:chargeHistoryDictionary;
  cdrh:chargeHistoryDictionaryResponse;
  s:String;
begin
  Result:=false;
  sSoob:='';
  FGuid:='';
  AddProtokol(StringOfChar('-',40));
  if FFull then begin
    AddProtokol('Запрос актуального состояния справочника: '+ cbTypeSpr.Text);
    DictServiceA:=GetSMDOClassifAWs(getUrl, '', RIO);
    if DictServiceA<>nil then begin
      cd:=chargeActualDictionary.Create;
      cd.companyId:=SMDO.getPkNCI;
      cd.actualDate:='01.01.2001';
      cd.dictionaryId:=SMDO.NameTypeSpr(cbTypeSpr.ItemIndex,'GUID');
      Result:=true;
      cdr:=nil;
      XMLResult.Clear;
      try
        FTypeStep:=CHARGE;
        cdr:=DictServiceA.chargeActualDictionary(cd);
      except
        on E:Exception do begin
          sSoob:=E.Message;
          Result:=false;
        end;
      end;
      cd.Free;
    end;
  end else begin
    AddProtokol('Запрос изменений справочника: '+ cbTypeSpr.Text+'  '+FormatDateTime('dd.mm.yyyy',edDate1.Value)+'-'+FormatDateTime('dd.mm.yyyy',edDate2.Value));
    DictServiceH:=GetSMDOClassifHWs(getUrl, '', RIO);
    if DictServiceH<>nil then begin
      cdh:=chargeHistoryDictionary.Create;
      cdh.companyId:=SMDO.getPkNCI;
      cdh.dictionaryId:=SMDO.NameTypeSpr(cbTypeSpr.ItemIndex,'GUID');
      cdh.historyDateFrom:='01.01.2001';
      cdh.historyDateTo:='01.01.2001';
      Result:=true;
      cdrh:=nil;
      XMLResult.Clear;
      try
        FTypeStep:=CHARGE;
        cdrh:=DictServiceH.chargeHistoryDictionary(cdh);
      except
        on E:Exception do begin
          Result:=false;
          sSoob:=E.Message;
        end;
      end;
      cdh.Free;
    end;
  end;
  if Result and not XMLResult.IsEmpty then begin //(cdr<>nil) then begin
    FStatus:=getValue('status');
    FMessage:=getValue('message'); //'STATUS','');// cdr.message_;
    sSoob:=FMessage;
    if ((FStatus='OK') or (FStatus='PROCESS')) then  begin
      FGuid:=getValue('requestGuid');
    end else begin
      Result:=false;
    end;
  end;
  if not Result and (sSoob='') then sSoob:='Неизвестная ошибка';
  AddProtokol(sSoob);
end;

//---------------------------------------------------------------
procedure TfmSMDOZagrSpr.SetTypeLoadSpr(const Value: Integer);
begin
  FTypeLoadSpr := Value;
  if FTypeLoadSpr=0 then begin
    cbTypeSpr.Visible:=false;
    cbTypeLoad.Visible:=false;
    edDate1.Visible:=false;
    lbDate1.Visible:=false;
    edDate2.Visible:=false;
    lbDate2.Visible:=false;

    Label1.Visible:=true;
    edPath.Visible:=true;
    cbWebService.Visible:=Role.SystemAdmin;
  end else begin
    cbTypeSpr.Left:=Label1.left;
    cbTypeSpr.Visible:=true;
    cbTypeLoad.Visible:=true;
    edDate1.Visible:=true;
    edDate1.Enabled:=false;
    lbDate1.Visible:=true;
    edDate2.Visible:=true;
    edDate2.Enabled:=false;
    lbDate2.Visible:=true;
    Label1.Visible:=false;
    edPath.Visible:=false;
    cbWebService.Visible:=false;
  end;
end;
//---------------------------------------------------------------
function TfmSMDOZagrSpr.ExtractZIPFile(sFile:String; var sTmpPath:String):String;
var
  sFind:String;
  lErr,lOk:Boolean;
  SearchRec: TSearchRec;
begin
  Result:='';
  lOk:=true;
  sTmpPath:=CreateTmpPath(0);
  Zip.FileName:=sFile;
  Zip.BaseDir:=sTmpPath;
  try
    Zip.OpenArchive;
    Zip.ExtractFiles('*.xml'); //(sExtractFile);
  except
    lOk:=false;
    AddProtokol('Ошибка распаковки файла: '+Zip.FileName);
    Zip.CloseArchive;
  end;
  if lOk then begin
    lOk:=FindFirst(CheckSleshN(sTmpPath)+'*.xml', faAnyFile, SearchRec) = 0;
    if lOk then begin
      // считаем что в архиве был один файл
      repeat
        if (SearchRec.Name[1] <> '.') and (SearchRec.Attr and faVolumeID <> faVolumeID) and (SearchRec.Attr and faDirectory <> faDirectory) then begin
          Result:=CheckSleshN(sTmpPath)+SearchRec.Name;
          break;
        end;
      until FindNext(SearchRec) <> 0;
    end;
    FindClose(SearchRec);
    if Result='' then begin
      AddProtokol('В архиве '+Zip.FileName+' отсутствует файл с данными');
    end;
  end;
end;
//---------------------------------------------------------------
function TfmSMDOZagrSpr.ReadStruct(node:TXMLNode):Boolean;
var
  i:Integer;
begin
  Result:=true;
  FFields.Clear;
  for i:=0 to node.NodeCount-1 do begin
    FFields.Add(node.Nodes[i].ReadString('name'));
  end;
  if FFields.Count=0 then Result:=false;
end;
//---------------------------------------------------------------
function TfmSMDOZagrSpr.GetDateTime(ADate:String):TDateTime;
var
  AYear, AMonth, ADay, AHour, AMin, ASec: word;
begin
  if ADate='' then Result:=0;
  try
    AYear  := StrToInt(copy(ADate, 7, 4));
    AMonth := StrToInt(copy(ADate, 4, 2));
    ADay   := StrToInt(copy(ADate, 1, 2));
    if Length(ADate) > 12 then begin
      AHour := StrToInt(string(copy(ADate, 12, 2)));
      AMin  := StrToInt(string(copy(ADate, 15, 2)));
      ASec  := StrToIntDef(string(copy(ADate, 18, 2)), 0);
    end else begin
      AHour := 0;
      AMin  := 0;
      ASec  := 0;
    end;
    Result := EncodeDate(AYear, AMonth, ADay) + EncodeTime(AHour, AMin, ASec, 0);
  except
    Result:=0;
  end;
end;

//---------------------------------------------------------------
function TfmSMDOZagrSpr.LoadSpr(node_data:TXMLNode; sName:String; sTableName:String; nType:Integer; lChange:Boolean; lShow:Boolean):Boolean;
var
  i,nCount:Integer;
  fld:TField;
  sDeleteKod,rowID,s,ss:String;
  node,node_row:TXMLNode;
  ds:TDataSet;
  dsWeb:TkbmMemtable;
  dMax,dCreate, dDelete:TDateTime;
  lEdit:Boolean;
  procedure WriteNodeToRecord(dsw_:TDataSet);
  var
    j:Integer;
  begin
    if dCreate>0 then dsw_.FieldByName('createDate').AsDateTime:=dCreate;
    if dDelete>0 then dsw_.FieldByName('terminateDate').AsDateTime:=dDelete;
    for j:=0 to node.NodeCount-1 do begin
      s:=UTF8toANSI(node.Nodes[j].ValueAsString);
      if s<>'' then begin
        fld:=dsw_.FindField(FFields.Strings[j]);
        if (fld<>nil) then fld.AsString:=s;
      end;
    end;
  end;
begin     
  Result:=true;
  if lChange then begin
    ss:='Загрузка изменений справочника '+sName+' ... ';
    if lShow then OpenMessage(PadCStr(ss,50,' '));
    GlobalTask.LogFile.WriteToLogFile('СМДО: загрузка изменений справочника ' +sName);
  end else begin
    ss:='Подготовка к загрузке справочника '+sName+' ... ';
    if lShow then OpenMessage(PadCStr(ss,50,' '));
    ss:='Загрузка справочника '+sName+' ... ';
    GlobalTask.LogFile.WriteToLogFile('СМДО: загрузка справочника ' +sName);
    dmBase.AdsConnection.Execute('DELETE FROM '+sTableName);
  end;
  Application.ProcessMessages;
  ds:=dmBase.GetDataSet(sTableName);
  node_data:=node_data.FindNode('rows');
  dsWeb:=TkbmMemTable(dbOpenSQL2MemTable('SELECT TOP 0 * FROM '+sTableName, ''));  // создадим MemTable такой же структуры
  dbEmptyMemTable(dsWeb);
  for i:=0 to node_data.NodeCount-1 do begin
    node_row:=node_data.Nodes[i];
    rowId:=node_row.ReadString('rowID');
    node:=node_row.FindNode('columns');
    dCreate:=GetDateTime(node_row.ReadString('createDate',''));
    s:=Trim(node_row.ReadString('terminateDate',''));
    if s<>'' then dDelete:=GetDateTime(s) else dDelete:=0;
    dMax:=Max(dCreate,dDelete);
    if dMax>FLastDate
      then FLastDate:=dMax;
    dsWeb.Append;
    dsWeb.FieldByName('rowID').AsString:=rowId;
    WriteNodeToRecord(dsWeb);
    dsWeb.Post;
    if RightStr(inttostr(i),2)='00'    // один раз на 100 записей
      then Application.ProcessMessages;
  end;
  dsWeb.SortFields:='createDate';  // !!!
  dsWeb.CommaTextFormat:=fmmain.kbmCSVStreamFormat1;
  dsWeb.DefaultFormat:=fmmain.kbmCSVStreamFormat1;
  dsWeb.SortDefault;
  dsWeb.First;
//  dsWeb.SaveToFile('111.txt');
  ds:=dmBase.GetDataSet(sTableName);
  nCount:=0;
  if lShow then ChangeMessage(PadCStr(ss,50,' '));
  try
    while not dsWeb.Eof do begin
      sDeleteKod:='';
      dDelete:=0;
      lEdit:=false;
      rowId:=dsWeb.FieldByName('rowID').AsString;
      if lChange then begin
        //===========================================================
        // только изменения
        //===========================================================
        if dsWeb.FieldByName('createDate').IsNull    then dCreate:=0 else dCreate:=dsWeb.FieldByName('createDate').AsDateTime;
        if dsWeb.FieldByName('terminateDate').IsNull then dDelete:=0 else dDelete:=dsWeb.FieldByName('terminateDate').AsDateTime;
        if ds.Locate('rowID', rowID, []) then begin
          if dDelete>0 then begin
            sDeleteKod:=ds.FieldByName('smdocode').AsString;
            GlobalTask.LogFile.WriteToLogFile('удаление: '+rowID+' '+ds.FieldByName('smdocode').AsString+' '+ds.FieldByName('SHORTNAME').AsString);
            ds.Delete;
          end else begin
            lEdit:=true;
            ds.Edit;
            for i:=0 to ds.FieldCount-1 do begin
              if not dsWeb.Fields[i].IsNull
                then ds.Fields[i].Value:=dsWeb.Fields[i].Value;
            end;
            ds.Post;
          end;
        end else begin
          if dDelete=0 then begin
            lEdit:=true;
            ds.Append;
            for i:=0 to ds.FieldCount-1 do begin
              if not dsWeb.Fields[i].IsNull
                then ds.Fields[i].Value:=dsWeb.Fields[i].Value;
            end;
            ds.Post;
          end;
        end;
      end else begin
        //===========================================================
        // полностью
        //===========================================================
        lEdit:=true;
        ds.Append;
        for i:=0 to ds.FieldCount-1 do begin
          if not dsWeb.Fields[i].IsNull
            then ds.Fields[i].Value:=dsWeb.Fields[i].Value;
        end;
        ds.Post;
      end;
      if (nType=1) and lEdit then begin  // попытаемся обновить локальный справочник организаций
        SMDO.UpdateSprWork(ds, false, sDeleteKod);
      end;
      nCount:=nCount+1;
      if RightStr(inttostr(nCount),2)='00' then begin      // один раз на 100 записей
        if lShow then ChangeMessage(ss+inttostr(nCount));
        Application.ProcessMessages;
      end;  
      dsWeb.Next;
    end;
  except
    on E: Exception do begin
      AddProtokol('Ошибка загрузки справочника '+sName+': '+E.Message);
    end;
  end;
  dsWeb.Free;
  if lShow then CloseMessage;
end;
//---------------------------------------------------------------
function TfmSMDOZagrSpr.CheckCreateDate(sSpr:String):Boolean;
begin
  Result:=true;
  if FActualDate>0 then begin
    try
      dmBase.WorkQuery.SQL.Text:='select max(cast(createdate as SQL_DATE)) from '+sSpr;
      dmBase.WorkQuery.Open;
      if not dmBase.WorkQuery.Fields[0].IsNull and (FActualDate<=dmBase.WorkQuery.Fields[0].AsDateTime) then begin
        Result:=false;  //  у меня в базе более актуальная информация
      end;
      dmBase.WorkQuery.Close;
    except
    end;
  end;
end;
//---------------------------------------------------------------
function TfmSMDOZagrSpr.CopyBaseFiles(lWebService:Boolean; lShow:Boolean; var sSoob:String):Boolean;
var
  node_data, node_model, node_header, node:TXMLNode;
  l, lOk,lArxiv,lErr,lChange : Boolean;
  SearchRec: TSearchRec;
  ss,s,sFile,sTmpPath : String;
  i,n:Integer;
begin
  Result:=false;
  sFile:=Trim(edPath.Text);
  if (sFile='') or not FileExists(sFile) then exit;
  sSoob:='';
  FDict:='';
  FActualDate:=0;
  FLastDate:=0;
  FProtokol.Clear;
  lOk := true;
  XML.Clear;
  if lWebService then begin
    try
      XML.LoadFromFile(sFile);
    except
      lOk:=false;
      AddProtokol('Ошибка чтения файла: '+sFile);
    end;
    if lOk then begin
      if XML.Root.FindNode('status').ValueAsString='OK' then begin
        try
          node_Data:=XML.Root.FindNode('dictionaryData');
          s:=DecodeString(node_Data.ValueAsString);
          sFile:=CheckSleshN(ExtractFilePath(sFile))+'spr.zip';
          SaveStringToFile(sFile,s);
        except
          AddProtokol('Ошибка структуры файла '+sFile);
          sFile:='';
        end;
      end;
    end;
  end;
  if (sFile<>'') and lOk then begin
    if MySameText( RightStr(sFile,4), '.zip') then begin  // архив
      if lShow then l:=OpenMessage(PadCStr('Извлечение из архива ...',50,' '), '', 0);
      try
        sFile:=ExtractZIPFile(sFile,sTmpPath);
      except
        lOk:=false;
      end;
      if lShow then CloseMessageEx(l);
      if (sFile='') or not lOk then begin
        AddProtokol('Ошибка извлечения справочника из архива '+sFile);
        lOk:=false;
      end;
    end;
  end;
  if lOk then begin
    if lShow then l:=OpenMessage(PadCStr('Чтение файла ...',50,' '), '', 0);
    try
      XML.LoadFromFile(sFile);
//      XML.Root.Name:='dictionaryData';
//      ShowMessage(XML.Root.Name);
    except
      lOk:=false;
      AddProtokol('Ошибка чтения файла: '+sFile);
    end;
    if lShow then CloseMessageEx(l);
  end;
  if lOk then begin
    node_data:=XML.Root.FindNode('data');
    node_model:=XML.Root.FindNode('model');
    if node_model<>nil
      then node_header:=node_model.FindNode('header') else node_header:=nil;
    if (XML.Root=nil) or (node_model=nil) or (node_data=nil)  or (node_header=nil) then begin
      AddProtokol('Не найдены служебные элементы файла загрузки');
      lOk:=false;
    end else begin
      FDict:=node_model.ReadString('dictionaryId');
      FActualDate:=GetDateTime(node_model.ReadString('actualDate'));
      lOk:=ReadStruct(node_header);
      if not lOk then AddProtokol('Ошибка чтения структуры справочника');
    end;
  end;
  ss:='';
  if lOk then begin
    if FDict<>'' then begin
      if XML.Root.Name='historyDictionaryData'
        then lChange:=true     // только изменения в справочнике
        else lChange:=false;   // полный справочник
      if MySameText(FDict, id_dict_org) then begin
        ss:='организаций';
        lOk:=CheckCreateDate('smdosprorg');
        if lOk
          then lOk:=LoadSpr(node_data,ss, dmBase.SMDOSprOrg.TableName,1,lChange,lShow)
          else AddProtokol('Текущий справочник организаций более новый');
      end else if MySameText(FDict, id_dict_viddok) then begin
        ss:='видов документов';
        lOk:=CheckCreateDate('smdosprviddok');
        if lOk
          then lOk:=LoadSpr(node_data,ss, dmBase.SMDOSprVidDok.TableName,0,lChange,lShow)
          else AddProtokol('Текущий справочник видов документов более новый');
      end else begin
        lOk:=false;
        AddProtokol('Неизвестный справочник');
      end;
      try
        XML.SaveToFile(NameFromExe(XML.Root.Name+'.xml'));
      except
      end;
    end else begin
      lOk:=false;
      AddProtokol('Неизвестный справочник');
    end;
  end;
  if lOk and (FProtokol.Count=0) then begin
    Result:=true;
    if lChange then sSoob:='Изменения справочника '+ss+' успешно загружены'+#13#10'Последнее изменение: '+DatePropis(FLastDate,3)
               else sSoob:='Справочник '+ss+' успешно загружен '#13#10'Актуальная дата: '+DatePropis(FActualDate,3)+#13#10'Последнее изменение: '+DatePropis(FLastDate,3);
//    GlobalTask.LogFile.WriteToLogFile(sSoob);
    AddProtokol(StringReplace(sSoob,#13#10,', ',[rfReplaceAll]));
    if lShow then begin
      AddNotifyProg(fmMain {Screen.ActiveForm}, sSoob, false, true,0,0);
//      ShowMessage(sSoob);
      Application.ProcessMessages;
    end;
  end else begin
    Result:=false;
    sSoob:=FProtokol.Text;
    if RightStr(sSoob,2)=#13#10
      then sSoob:=Copy(sSoob,1,Length(sSoob)-2);
    if lShow then begin
      PutError(sSoob);
      Application.ProcessMessages;
    end;
//    GlobalTask.LogFile.WriteToLogFile(FProtokol.Text);
  end;
  if sTmpPath<>''
    then ClearDir(sTmpPath,true);
end;

procedure TfmSMDOZagrSpr.WMDEVICECHANGE(var Msg: TMessage);
begin
{Заголовок сообщения}
  if Msg.Msg = WM_DEVICECHANGE then
    if ((TWMDeviceChange(Msg).Event = DBT_DEVICEARRIVAL) or
      (TWMDeviceChange(Msg).Event = DBT_DEVICEREMOVECOMPLETE)) and
      (PDevBroadcastVolume(TWMDeviceChange(Msg).dwData)^.dbcv_devicetype = DBT_DEVTYP_VOLUME) then
      CreateListDisk;
end;

//----------------------------------------------
procedure TfmSMDOZagrSpr.CreateListDisk;
  var
  c : Char;
  d : DWORD;
  s : String;
  n,i : Integer;
begin
  if edDisk.Visible then begin
    edDisk.Enabled:=true;
    d := GetLogicalDrives;
    edDisk.ItemIndex:=-1;
    edDisk.Items.Clear;
    edDisk.KeyItems.Clear;
    i:=1;
    for c:='A' to 'Z' do begin
      if (d and 1)<>0 then begin
        n := GetDriveType(PChar(c + ':/'));
        if n=DRIVE_REMOVABLE then begin
          edDisk.Items.Add(c);
          edDisk.KeyItems.Add(IntToStr(i));
        end;
      end;
      d := d shr 1;
      Inc(i,1);
    end;
    if edDisk.Items.Count > 0 then begin
  //    s := GlobalTask.GetLastValueAsString('DISK_ZAGR_ZAGS');
      edDisk.ItemIndex := 0;
      n := edDisk.Items.IndexOf(s);
      if n > -1 then begin
        edDisk.ItemIndex := n;
      end;
    end else begin
      edDisk.Enabled := false;
    end;
    if not edDisk.Enabled then begin
      edPath.Enabled := true;
      if edPath.Text = '' then begin
        edPath.Text := FDefPath;
      end;
      cbChoice.Checked:=true;
    end;
  end;
end;

procedure TfmSMDOZagrSpr.FormCreate(Sender: TObject);
var
  s:String;
begin
  FGuid:='111';
  FFull:=true;
  FPath:=GlobalTask.PathService;
  FPathTmp:=GlobalTask.PathWorkDir;
  RIO:=THTTPRIO.Create(nil);
  RIO.OnAfterExecute:=RIOAfterExecute;
  RIO.OnBeforeExecute:=RIOBeforeExecute;
  XMLResult:=TNativeXML.Create;

  XML:=TNativeXML.Create;
  FProtokol:=TStringList.Create;
  FFields:=TStringList.Create;
//  FDefPath:=Trim(GlobalTask.GetLastValueAsString('LAST_PATH_ZAGR_OCH'));
//  s:=Trim(Globaltask.ParamAsString('PATH_LOAD_OCH'));
  FDefPath:='';
  s:='';
  CreateListDisk;
  if s<>'' then begin
    FDefPath:=s;
    edPath.Text:=s;
    cbChoice.Checked:=true;
  end;
  edPath.Enabled:=true;
  cbTypeLoadChange(nil);
end;
//-------------------------------------------------------------------------
procedure TfmSMDOZagrSpr.FormDestroy(Sender: TObject);
begin
  XMLResult.Free;
  XML.Free;
  FProtokol.Free;
  FFields.Free;
//  FreeAndNil(Zip);
end;
//-------------------------------------------------------------------------
procedure TfmSMDOZagrSpr.cbChoiceClick(Sender: TObject);
begin
  if cbChoice.Checked then begin
    edPath.Enabled := true;
    if edPath.Text = '' then begin
      edPath.Text := FDefPath;
    end;
  end else begin
    edPath.Enabled := false;
  end;
end;
//------------------------------------------------------------------------------------
procedure TfmSMDOZagrSpr.edPathEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  Handled := true;
  if OpenDialog.Execute then begin
    edPath.Text := OpenDialog.FileName;
  end;
end;
//-------------------------------------------------------------------------
procedure TfmSMDOZagrSpr.AddProtokol(s:String);
begin
  FProtokol.Add(s);
  SMDO.WriteTextLog('[SPR_SMDO]:'+s);
end;
//-------------------------------------------------------------------------
procedure TfmSMDOZagrSpr.RIOAfterExecute(const MethodName: string;  SOAPResponse: TStream);
var
  fs:TStringStream;
begin
   XMLResult.Clear;
   fs:=TStringStream.Create('');
   fs.CopyFrom(SOAPResponse, 0);
   XMLResult.ReadFromString(fs.DataString);
   fs.Free;
   XMLResult.VersionString:='1.0';
   XMLResult.EncodingString:='UTF-8';
   XMLResult.SaveToFile(ExtractFilePath(Application.ExeName)+'SOAPResponse.xml');
end;
//-------------------------------------------------------------------------
procedure TfmSMDOZagrSpr.RIOBeforeExecute(const MethodName: string; var SOAPRequest: WideString);
var
   XMLDoc:TNativeXML;
   S: Utf8String;
   lNodes:TList;
   node:TXMLNode;
   ss:String;                       
begin
   S:=Utf8Encode(SOAPRequest);
   SaveStringToFile(ExtractFilePath(Application.ExeName)+'SOAPRequest.xml', S);
   XMLDoc:=TNativeXML.Create;
   XMLDoc.XmlFormat:=xfReadable;
   if FTypeStep=CHARGE then begin
     if FFull
       then XMLDoc.LoadFromFile(FPath+'chargeActualDictionary.xml')
       else XMLDoc.LoadFromFile(FPath+'chargeHistoryDictionary.xml');
     node:=XMLDoc.Root.FindNode('companyId');
     if node<>nil then node.ValueAsString:=SMDO.getPkNCI;
     node:=XMLDoc.Root.FindNode('dictionaryId');
     if node<>nil then node.ValueAsString:=SMDO.NameTypeSpr(cbTypeSpr.ItemIndex,'GUID');
     if FFull then begin
       node:=XMLDoc.Root.FindNode('actualDate');
       if node<>nil then node.ValueAsString:=FormatDateTime('dd.mm.yyyy', Date);
     end else begin
       node:=XMLDoc.Root.FindNode('historyDateFrom');
       if node<>nil then node.ValueAsString:=FormatDateTime('dd.mm.yyyy', edDate1.Value);
       node:=XMLDoc.Root.FindNode('historyDateTo');
       if node<>nil then node.ValueAsString:=FormatDateTime('dd.mm.yyyy', edDate2.Value);
      end;
   end else begin
     if FFull
       then XMLDoc.LoadFromFile(FPath+'receiveActualDictionary.xml')
       else XMLDoc.LoadFromFile(FPath+'receiveHistoryDictionary.xml');
     node:=XMLDoc.Root.FindNode('requestGuid');
     if node<>nil then node.ValueAsString:=FGuid;
   end;
   SOAPRequest:=UTF8Decode(XMLDoc.WriteToString);
   S:=Utf8Encode(SOAPRequest);
   SaveStringToFile(ExtractFilePath(Application.ExeName)+'SOAPRequest_new.xml', S);
   XMLDoc.Free;
end;
//-------------------------------------------------------------------------
function TfmSMDOZagrSpr.getValue(sNode: String): String;
var
 s:String;
begin
  try
    s:=XMLResult.Root.FindNode(sNode).ValueAsString;
  except
    s:='';
  end;
  Result:=sdUtf8ToAnsi(s); // Utf8ToAnsi(s);
end;

procedure TfmSMDOZagrSpr.cbTypeLoadChange(Sender: TObject);
begin
  FFull:=cbTypeLoad.ItemIndex=0;
  edDate1.Enabled:=not FFull;
  edDate2.Enabled:=not FFull;
  lbDate1.Enabled:=not FFull;
  lbDate2.Enabled:=not FFull;
end;

procedure TfmSMDOZagrSpr.btOkClick(Sender: TObject);
begin
  if FTypeLoadSpr=0 then begin
    ModalResult:=mrOk;
  end else begin
    if FFull then begin
      ModalResult:=mrOk;
    end else begin
      if (edDate1.Value=null) or (edDate2.Value=null) then begin
        PutError('Заполните даты');
      end else begin
        if edDate1.Value>edDate2.Value then begin
          PutError('Начальная дата должна быть меньше конечной');
        end else begin
          ModalResult:=mrOk;
        end;
      end;
    end;
  end;
end;

initialization
  fmSMDOWebNCI:=nil;
finalization
  FreeAndNil(fmSMDOWebNCI);
end.
