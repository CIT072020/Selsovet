unit fCheckIN_Mens;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uProject, uCheckKod, uTypes,
  Dialogs, DB, adsdata, adsfunc, adstable, adscnnct, StdCtrls, Mask, funcPr, QStrings, Consts,
  DBCtrlsEh, ComObj, kbmMemTable, Grids, DBGrids, ToolEdit, ExtCtrls, Metatask,
  ComCtrls, ValEdit, DBLookupEh;

type
  TfmCheckIN_Mens = class(TForm)
    ChFile: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cbCheckExit: TCheckBox;
    Panel1: TPanel;
    Label1: TLabel;
    edFile: TDBEditEh;
    gbProtokol: TGroupBox;
    edDebug: TMemo;
    Panel2: TPanel;
    Button1: TButton;
    lbProv: TLabel;
    lbNotFound: TLabel;
    vlGrafs: TValueListEditor;
    edRow1: TDBNumberEditEh;
    Label4: TLabel;
    Label5: TLabel;
    edRow2: TDBNumberEditEh;
    Label6: TLabel;
    Label7: TLabel;
    edGraf1: TDBEditEh;
    edGraf2: TDBEditEh;
    Button2: TButton;
    Panel3: TPanel;
    btCopyToClipboard: TButton;
    Button3: TButton;
    cbShowExcel: TCheckBox;
    StaticText1: TStaticText;
    edPriznak: TDBLookupComboboxEh;
    DataSource1: TDataSource;
    btClearPr: TButton;
    Query: TAdsQuery;
    lbEmpty: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure edFileEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure vlGrafsValidate(Sender: TObject; ACol,  ARow: Integer; const KeyName, KeyValue: String);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btCopyToClipboardClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btClearPrClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    grNomer,grFam,grName,grOtch,grDateR,grIN,grKadastr,grAdres,grPlosh,grDest,grPravo,grTail,grDateRP,grDatePP,grPrim:Integer;
    sNomer,sFam,sName,sOtch,sDateR,sIN,sKadastr,sAdres,sPlosh,sDest,sPravo,sTail,sDateRP,sDatePP,sPrim:String;
    dDateR,dDateRP,dDatePP:TDateTime;
    FLoadAll:Boolean;
    sError:String;
    FExit:Boolean;
    FError:Boolean;
    XL:Variant;
    FCount:Integer;
    FListSeek:TStringList;
    Mens:TAdsTable;
    Ochered:TAdsTable;
    FDeleteMens:TStringList;
    procedure SetNomerGraf;
    function SeekMenFIO(var lSeek:Boolean):Boolean;
    function SeekMen(var lSeek:Boolean):Boolean;
    function GetDate(sDate:String; var dDate : TDateTime):Boolean;
    function LoadOne:Boolean;
    function WriteMenToBase(sMen:String):Boolean;
  end;

  procedure CheckIN_Mens;

implementation

uses fMain, dBase, DateUtils;

{$R *.dfm}

//-----------------------------------------------------------
procedure CheckIN_Mens;
var
  fmLoad: TfmCheckIN_Mens;
begin

  fmLoad:=TfmCheckIN_Mens.Create(nil);
  fmLoad.edPriznak.Value:=null;
  fmLoad.Mens:=dmBase.tbMens;
  fmLoad.Ochered:=dmBase.tbOchered;
  try
    fmLoad.ShowModal;
  finally
    fmLoad.Free;
  end;
end;

//-----------------------------------------------------------
procedure TfmCheckIN_Mens.FormCreate(Sender: TObject);
begin
  FListSeek:=TStringList.Create;
  FDeleteMens:=TStringList.Create;
end;

//-----------------------------------------------------------
procedure TfmCheckIN_Mens.FormDestroy(Sender: TObject);
begin
  FListSeek.Free;
  FDeleteMens.Free;
end;

//-----------------------------------------------------------
procedure TfmCheckIN_Mens.SetNomerGraf;
  function getN(i:Integer):Integer;
    begin result:=StrToInt(vlGrafs.Strings.ValueFromIndex[i]) end;
begin
  grIN:=getN(0);
  grFam:=getN(1);
  grName:=getN(2);
  grOtch:=getN(3);
  grDateR:=getN(4);
  {
  grKadastr:=getN(6);
  grAdres:=getN(7);
  grPlosh:=getN(8);
  grDest:=getN(9);
  grPravo:=getN(10);
  grTail:=getN(11);
  grDateRP:=getN(12);
  grDatePP:=getN(13);
  grPrim:=getN(14);
  }
end;

//-----------------------------------------------------------
procedure TfmCheckIN_Mens.Button1Click(Sender: TObject);
var
  arr,v:Variant;
  n,i,j,t,nn,nProp,nProv,nNotFound:Integer;
  sID,c,old,s:String;
  lErr,lDel:Boolean;
  sl:TstringList;
begin
  FLoadAll:=true;
  if (edFile.Text='') then begin
    PutError('Введите имя файла загрузуи',self);
    exit;
  end;
  if edPriznak.Text='' then begin
    PutError('Выберите признак',self);
    exit;
  end;
  if not FileExists(edFile.Text) then begin
    PutError('Файл '+edFile.Text+' не найден',self);
    exit;
  end;

  try
    try XL := GetActiveOleObject('Excel.Application');
    except XL := CreateOleObject('Excel.Application');
  end;
    except
      raise Exception.Create('Hе могy запyстить Excel');
  end;
  edDebug.Clear;
  FDeleteMens.Clear;

  try
    xl.Workbooks.Add(edFile.Text);
  except
    on E: Exception do begin
      PutError('Ошибка открытия файла'+#13#10+E.Message,self);
      lErr:=true;
      edDebug.Lines.Add(E.Message);
    end;
  end;

  if cbShowExcel.Checked
    then xl.Visible:=true;
  lErr:=false;
  try
    arr:=XL.Range[Trim(edGraf1.Text)+Trim(edRow1.Text)+':'+Trim(edGraf2.Text)+Trim(edRow2.Text)].value;
  except
    on E: Exception do begin
      lErr:=true;
      edDebug.Lines.Add(E.Message);
    end;
  end;
  if lErr then exit;

  n := VarArrayDimCount(arr);
  if n <> 2 then begin
    lErr:=true;
  end;
  if lErr then exit;
  GlobalTask.LogFile.WriteToLogFile('Начало проверки списка ИН.');

  SetNomerGraf;
  sl:=TStringList.Create;
  OpenMessage('Загрузка Excel ...', '');
  try
  for i:=VarArrayLowBound(arr,1) to VarArrayHighBound(arr,1) do begin
    sIN:='';
    for j:=VarArrayLowBound(arr,2) to VarArrayHighBound(arr,2) do begin
      t := VarType(arr[i,j]);
      if (t=VarNull) or (t=VarEmpty) then begin
        v:=null;
      end else begin
        v:=arr[i,j];
      end;
      if (v=null) or (trim(vartostr(v))='') then begin
        v:='';
      end else begin
        v:=Trim(VarToStr(arr[i,j]));
        if (v<>'') and (j=grIN) then            //1
          sIN:=CheckRus2(v);
      end;
    end;
    if sIN<>''
      then sl.Add(sIN);
  end;
  finally
  closeMessage;
  end;
  lbProv.Caption:='Проверено 0     ';
  lbNotFound.Caption:='Не найдено 0     ';
  lbEmpty.Caption:='Пустых 0     ';
  Application.ProcessMessages;
  Application.BringToFront;
  nProv:=0;
  nProp:=0;
  nNotFound:=0;
  FExit:=false;
  nn:=0;
  old:=dmbase.tbOchered.IndexFieldNames;
  dmbase.tbOchered.IndexFieldNames:='ID;OCHERED_ID';

  Query.SQL.Text:= 'select distinct id, lich_nomer from ( '+
     'select o.id, n.lich_nomer from ochered o '+
     'left join население n on o.id=n.id and date_fiks=''1899-12-30'' ) aaa';
  Query.Open;
  try
    while not Query.Eof do begin
      sIN:=Query.FieldByName('LICH_NOMER').AsString;
      sID:=Query.FieldByName('ID').AsString;
      nProv:=nProv+1;
      if sIN='' then begin
        nprop:=nprop+1;
      end else begin
        nProv:=nProv+1;
        if sl.IndexOf(sIN)>-1 then begin
          // нашли
        end else begin
          nNotFound:=nNotFound+1;
          if not dmBase.tbMensPr.Locate('DATE_FIKS;ID;KOD', VarArrayOf([STOD('1899-12-30',tdAds), sID, edPriznak.Value]), []) then begin
            dmBase.tbMensPr.append;
            dmBase.tbMensPr.FieldByName('DATE_FIKS').AsDateTime:=STOD('1899-12-30',tdAds);
            dmBase.tbMensPr.FieldByName('ID').AsString:=sID;
            dmBase.tbMensPr.FieldByName('KOD').Value:=edPriznak.Value;
            dmBase.tbMensPr.post;
          end;
  //        0=общая 1=многодетная семья 2=социальное жилье 3=военнослужащие 4=очередь на участок
          s:='(';
          dmbase.tbOchered.SetRange([sID],[sID]);
          while not dmbase.tbOchered.Eof do begin
            case dmbase.tbOchered.FieldByName('OCHERED_ID').AsInteger of
             0:if not dmbase.tbOchered.FieldByName('ONLY').AsBoolean
                 then s:=s+'общая; ';
             1:s:=s+'многодетная семья; ';
             2:s:=s+'социальное жилье; ';
             3:s:=s+'военнослужащие; ';
             4:s:=s+'очередь на участок; ';
            end;
            dmbase.tbOchered.Next;
          end;
          s:=s+')';
          dmbase.tbOchered.CancelRange;
          edDebug.Lines.Add(sIN+'  '+dmbase.FIOMen(STOD('1899-12-30',tdAds), sID)+' '+s);
        end;
      end;
      nn:=nn+1;
      if nn>100 then begin
        lbProv.Caption:='Проверено '+IntToStr(nProv);
        lbNotFound.Caption:='Не найдено '+IntToStr(nNotFound);
        lbEmpty.Caption:='Пустых '+IntToStr(nProp);
        Application.ProcessMessages;
        nn:=0;
      end;
      Query.Next;
    end;
  finally
    old:=dmbase.tbOchered.IndexFieldNames;
    Query.Close;
    lbProv.Caption:='Проверено '+IntToStr(nProv);
    lbNotFound.Caption:='Не найдено '+IntToStr(nNotFound);
    lbEmpty.Caption:='Пустых '+IntToStr(nProp);
    Application.ProcessMessages;
    GlobalTask.LogFile.WriteToLogFile('Окончание зпроверки.');
    xl:=null;
    sl.Free;
  end;
end;

//------------------------------------------------------------------------------------
function TfmCheckIN_Mens.SeekMenFIO(var lSeek:Boolean):Boolean;
var
  sID:String;
  lAdd:Boolean;
begin
  Result:=false;
  FListSeek.Clear;
  Mens.IndexFieldNames:='FAMILIA;NAME;OTCH';     // FIO_KEY
  Mens.SetRange([sFam,sName,sOtch], [sFam,sName,sOtch]);
  lSeek:=false;
  while not Mens.Eof do begin
    lAdd:=false;
    {$IFDEF OCHERED}
      if Mens.FieldByName('ID_BASE').AsInteger=0 then begin
        sID:=Mens.FieldByName('ID').AsString;
        lAdd:=true;
      end;
    {$ELSE}
       sID:=Mens.FieldByName('ID').AsString;
       if Mens.FieldByName('OCHERED').AsBoolean or FLoadAll then begin
         lAdd:=true;
       end else begin
         if dmBase.tbSostavSem.Locate('MEMBER_ID', sID, []) then begin
           lAdd:=true;
         end;
       end;
    {$ENDIF}
    if lAdd then begin
    end;
    if lAdd then begin
      lSeek:=true;
      FListSeek.Add(sID);
    end;
    Mens.Next;
  end;
  Mens.CancelRange;
  if FListSeek.Count>0
    then Result:=true;
end;
//---------------------------------------------------------------------------
function TfmCheckIN_Mens.SeekMen(var lSeek:Boolean):Boolean;
begin
  Result:=false;
  lSeek:=false;
  FListSeek.Clear;
  if sIN=''
    then exit;
  Mens.IndexFieldNames:='DATE_FIKS;LICH_NOMER';    // IN_KEY
  Mens.SetRange([dmBase.GetDateCurrentSost,sIN],[dmBase.GetDateCurrentSost,sIN]);
  while not Mens.Eof do begin
    {$IFDEF OCHERED}
      if Mens.FieldByName('ID_BASE').AsInteger=0 then begin
        lSeek:=true;
        FListSeek.Add(Mens.FieldByName('ID').AsString);
      end;
    {$ELSE}
      lSeek:=true;
      if Mens.FieldByName('OCHERED').AsBoolean or FLoadAll then begin
        FListSeek.Add(Mens.FieldByName('ID').AsString);
      end else begin
        if dmBase.tbSostavSem.Locate('MEMBER_ID', Mens.FieldByName('ID').AsInteger, []) then begin
          FListSeek.Add(Mens.FieldByName('ID').AsString);
        end;
      end;
    {$ENDIF}
    Mens.Next;
  end;
  Mens.CancelRange;
  if FListSeek.Count>0
    then Result:=true;
end;

//------------------------------------------------------------------------------------
function TfmCheckIN_Mens.GetDate(sDate:String; var dDate : TDateTime):Boolean;
begin
  Result:=false;
  if (sDate<>'') and IsAllDigit(Copy(sDate,1,2)) then begin
    try
      dDate:=EncodeDate(StrToInt(copy(sDate,7,4)),StrToInt(copy(sDate,4,2)),StrToInt(copy(sDate,1,2)));
      Result:=true;
    except
      dDate:=0;
       // ???
    end;
  end else begin
    dDate:=0;
  end;
end;
//-----------------------------------------------------------
function TfmCheckIN_Mens.WriteMenToBase(sMen:String):Boolean;
var
  i:Integer;
  nID:Integer;
  lIN, lDateR:Boolean;
  s:String;
begin
  Result:=false;
  for i:=0 to FListSeek.Count-1 do begin
    lIN:=false;
    lDateR:=false;
    s:='';
    nID:=StrToInt(FListSeek.Strings[i]);
    if Mens.Locate('DATE_FIKS;ID', VarArrayOf([dmBase.GetDateCurrentSost,nID]),[]) then begin

      if (sIN<>'') then begin
        if (Mens.FieldByName('LICH_NOMER').AsString='') then begin
        end;
      end;

      {$IFDEF LAIS}
      if Mens.FieldByName('DATE_FIKS').AsDateTime=dmBase.GetDateCurrentSost then begin
      {$ENDIF}
        if lIN or lDateR then begin
          if lIN then s:=' ИН';
          if lDateR then s:=s+' дата рождения';
          edDebug.Lines.Add(sMen+' записано:'+s);
        end;
      {$IFDEF LAIS}
      end;
      {$ENDIF}
    end;
  end;
end;
{
function TForm1.GetLocaleInformation(Flag: Integer): string;
var
  pcLCA: array [0..20] of Char;
begin
  if GetLocaleInfo(LOCALE_SYSTEM_DEFAULT, Flag, pcLCA, 19) <= 0 then
    pcLCA[0] := #0;
  Result := pcLCA;
end;
}
{
в базе данных информации не найдено
не указан идентификационный номер!
ошибка в поле "Идентификационный номер": идентификационный номер должен иметь размер 14 символов!
не указана дата рождения!
ошибка: в поле "Фамилия" содержится недопустимый символ! (запрос на добрачную фамилию должен оформляться отдельной строкой)
}
{  sNomer sFam sNAME sOTCH sDATER sIN sKADASTR sADRES sPLOSH sDEST sPRAVO sTAIL sDATERP sDATEPP sPRIM }
//-----------------------------------------------------------
function TfmCheckIN_Mens.LoadOne:Boolean;
var
  d:TDateTime;
  s:String;
  lSeek:Boolean;
begin
  sError:='';
  Result:=false;
  FListSeek.Clear;
  FError:=false;

  // контроль конца данных
  if cbCheckExit.Checked then begin
    if (sFam='') and (sOtch='') then begin
      FExit:=true;
      exit;
    end;
  end;

  s:=sFam+' '+sName+' '+sOtch+' '+sDateR+' '+sIN+' ';

  if GetDate(sDateR , d)  then dDateR:=d   else dDateR:=0;

  if SeekMen(lSeek) then begin
    if lSeek then Result:=WriteMenToBase(s);
  end else begin
    if SeekMenFIO(lSeek) then begin
      if lSeek then Result:=WriteMenToBase(s);
    end;
  end;

end;

//-----------------------------------------------------------
procedure TfmCheckIN_Mens.edFileEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if ChFile.Execute then begin
    edFile.Text:=ChFile.FileName;
//    s:=ExtractFileName(ChFile.FileName);
  end;
end;

//-----------------------------------------------------------
procedure TfmCheckIN_Mens.vlGrafsValidate(Sender: TObject; ACol, ARow: Integer; const KeyName, KeyValue: String);
var
  n:Integer;
begin
  try
    n:=StrToInt(KeyValue);
  except
    n:=0
  end;
  if (n<=0) or (n>30) then begin
    raise EMyError.Create('Неверное значение <'+KeyValue+'>');
  end;
end;

//-----------------------------------------------------------
procedure TfmCheckIN_Mens.Button2Click(Sender: TObject);
begin
  SetNomerGraf;
end;

//-----------------------------------------------------------
procedure TfmCheckIN_Mens.btCopyToClipboardClick(Sender: TObject);
var
  Data: THandle;
  DataPtr: Pointer;
  text:String;
begin
  ActivateRUSKeyboard;
  Application.ProcessMessages;
  text:=edDebug.Lines.Text;
  if OpenClipBoard(0) then
  begin
    try
      Data := GlobalAlloc(GMEM_MOVEABLE+GMEM_DDESHARE, Length(text) + 1);
      try
        DataPtr := GlobalLock(Data);
        try
          Move(PChar(Text)^, DataPtr^, Length(Text) + 1);
          EmptyClipBoard;
          SetClipboardData(CF_TEXT, Data);
        finally
          GlobalUnlock(Data);
        end;
      except
        GlobalFree(Data);
        raise;
      end;
    finally
      CloseClipBoard;
    end;
  end
  else
    raise Exception.CreateRes(@SCannotOpenClipboard);
end;


procedure TfmCheckIN_Mens.Button3Click(Sender: TObject);
begin
  Label4.Enabled:=true;
  Label5.Enabled:=true;
  Label6.Enabled:=true;
  Label7.Enabled:=true;
  edGraf1.Enabled:=true;
  edGraf2.Enabled:=true;
  edRow1.Enabled:=true;
  edRow2.Enabled:=true;
  cbCheckExit.Enabled:=true;
  vlGrafs.Enabled:=true;
end;
//-------------------------------------------------------------------
procedure TfmCheckIN_Mens.btClearPrClick(Sender: TObject);
var
  sErr:string;
begin
  if (edPriznak.Text<>'') and (VarToStr(edPriznak.Value)<>'') then begin
    if Problem('Очистить признак "'+edPriznak.Text+'" в базе ?') then begin
      dmBase.WorkQuery.SQL.Text:='DELETE FROM НаселениеПризнаки WHERE KOD='+VarToStr(edPriznak.Value);
      OpenMessage('Удаление признака ...','');
      try
        dmBase.WorkQuery.ExecSQL;
      except
        on E:Exception do begin
          sErr:=E.Message;
        end;
      end;
      CloseMessage;
      if sErr<>'' then PutError(sErr);
    end;
  end else begin
    PutError('Выберите признак');
  end;
end;

end.
