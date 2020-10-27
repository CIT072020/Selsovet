unit fLoadZagsMinsk;

interface

//{$DEFINE TEST_MINSK}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, FileCtrl, Consts,
  NativeXML, db, funcPr, dbFunc, uCheckKod, uTypes, fWarning, uProject, uProjectAll, mPermit, MetaTask,
  StdCtrls, Mask, DBCtrlsEh, Dialogs, ExtCtrls, ComCtrls;

type
  TgetDate=record
    OnlyGod:Integer;
    Date:TDateTime;
    Text:String;
  end;
  THeaderAkt=record
    ID_ZAGS:Integer;
    ID_SOURCE:Integer;
    PODR:Integer;
    NOMER:Integer;
    DATEZ:TDateTime;
  end;

  TAdresZ=record
    Error:String;
    resp:Integer;
    obl:String;
    rn:String;
    np:String;
    npt:Integer;
    punkt:String;
    rng:String;
    ul:String;
    dom:String;
    korp:String;
    kv:String;
    year:Integer;
  end;
  TDokZ=record
    Error:String;
    full:String;
    typed:Integer;
    seria:String;
    num:String;
    date:TDateTime;
    org:String;
  end;
  TMenZ=record
    Error:String;
    Fam:String;
    Name:String;
    Otch:String;
    FamB:String;
    NameB:String;
    OtchB:String;
    Pol:String;
    LichNomer:String;
    Citizen:Integer;
    Nation:Integer;
    OnlyGodR:Integer;
    DateR:TDateTime;
    DateR_Text:String;
    TimeR:TTime;
    Sem:String;
    Obraz:String;
    Work:String;
    Brak:String;
    Dok:TDokZ;
    AdresR:TAdresZ;
    AdresRB:TAdresZ;
    AdresG:TAdresZ;
  end;

  TfmLoadZagsMinsk = class(TForm)
    pnFile: TPanel;
    ChFile: TOpenDialog;
    Label1: TLabel;
    edFile: TDBEditEh;
    pnDebug: TPanel;
    edDebug: TMemo;
    btLoad: TButton;
    cbSeria: TCheckBox;
    cbError: TCheckBox;
    lbCountAll: TLabel;
    lbCount: TLabel;
    Button1: TButton;
    Button2: TButton;
    cbTypePunkt: TCheckBox;
    btCopyToClipboard: TButton;
    Panel1: TPanel;
    pb: TProgressBar;
    lbCountFiles: TLabel;
    btUpdate: TButton;
    procedure edFileEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure btLoadClick(Sender: TObject);
    procedure edFileEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btCopyToClipboardClick(Sender: TObject);
    procedure btUpdateClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FSource:String;
    FCancel:Boolean;
    FLastError:String;
    FLoadError:String;
    FTest:Boolean;
    slTypePunkt:TStringList;
    slStran:TStringList;
    slStran2:TStringList;
    FCount:Integer;
    FCountAll:Integer;
  public
    { Public declarations }
    procedure LoadOneFile(sFile:String; lUpdate:Boolean);
    function CheckSource(nSource:Integer; var sName:String): Boolean;
    procedure AddProtokol(s:String);
    function CheckStrR(s:String; lEng:Boolean=false):String;
    function XMLToValue(sValue:String; ft:TFieldType; vDefault:Variant): Variant;
    function ReadTypeAct(s:String; var sName:String): Integer;
    function ReadMen(node:TXMLNode; sPol:String; nType:Integer=0):TMenZ;
    function ReadAdres(node: TXMLNode):TAdresZ;
    function ReadDok(node: TXMLNode):TDokZ;
    function ReadDateEx(sValue:String):TgetDate;
    function ReadDate(sValue:String; sName:String):TDateTime;
    function ReadStrana(s:String; var adr:TAdresZ; sName:String='citizen'):Integer;
    function ReadNation(s:String; sPol:String):Integer;
    function GetInt(s:String;sN:String):String;
    function ReadDateC(sDate:String):TDateTime;

    procedure FindFilesZags(sPath:String; slFile:TStringList);
    function LoadSvidPovtor(nType:Integer; nID:Integer; node:TXMLNode):Boolean;
    function LoadChildren(nType:Integer; nID:Integer; node:TXMLNode; var nCount:Integer):String;
    function LoadChildren2(nType:Integer; nID:Integer; node:TXMLNode; var nCount:Integer):String;

    procedure LoadAllFiles(lUpdate:Boolean);

    function UpdateOne_ZRogd(node:TXMLNode):Boolean;

    function LoadOne_ZSmert(node:TXMLNode):Boolean;
    function LoadOne_ZRogd(node:TXMLNode):Boolean;
    function LoadOne_ZUstOtc(node:TXMLNode):Boolean;
    function LoadOne_ZBrak(node:TXMLNode):Boolean;
    function LoadOne_ZRast(node:TXMLNode):Boolean;
    function LoadOne_ZChName(node:TXMLNode):Boolean;
    function LoadOne_ZAdopt(node:TXMLNode):Boolean;

    function getHeader(node:TXMLNode):THeaderAkt;

    function LoadOne_Header(ds:TDataSet; node:TXMLNode):Boolean;
    function LoadOne_WriteSvid(ds:TDataSet; nd:TXMLNode; sAdd:String=''):Boolean;
    function LoadOne_Add(ds:TDataSet; nd:TXMLNode; sFldOtm:String; nID:Integer; nType:Integer):Boolean;


    function CheckSvidSeria(sSeria:String):String;
    function CheckSvidNomer(sNomer:String):String;
    procedure WriteAdres(ds:TDataSet; adr:TAdresZ; nType:Integer; sDop:String);

  end;

  procedure LoadZagsMinsk;

implementation

uses dBase, StrUtils;

{$R *.dfm}

//------------------------------------------------
procedure LoadZagsMinsk;
var
  f:TfmLoadZagsMinsk;
  s:String;
  nZags:Integer;
begin
  f:=TfmLoadZagsMinsk.Create(nil);
  nZags:=GlobalTask.ParamAsInteger('ID');
  if f.CheckSource(nZags,s) or (nZags=50003) or (nZags=50004)
    then f.btUpdate.Visible:=true
    else f.btUpdate.Visible:=false;
  try
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure TfmLoadZagsMinsk.btCopyToClipboardClick(Sender: TObject);
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

//------------------------------------------------
procedure TfmLoadZagsMinsk.FormCreate(Sender: TObject);
begin
  slTypePunkt:=TStringList.Create;
  slStran:=TStringList.Create;
  // 9010 два раза   Карелия и Башкирская АССР
  slStran.CommaText:='"9001=Мордовская АССР","9002=Удмурдская АССР","9003=Дагестан","9004=Абхазия","9005=Якутия","9006=Бурято-Монгольская АССР","9007=Татарская АССР","9008=Чувашская АССР","9009=ГДР","9010=Карелия",'+
                     '"9011=Кабардино-Балкарская Республика","9012=Марийская АССР","9013=Республика Коми","9014=Чечено-Ингушская АССР","9015=Тивинская АССР","9016=Аджарская АССР"';
  slStran2:=TStringList.Create;
  slStran2.CommaText:='"900=905","901=920","902=914","903=900","904=915","905=913","906=916","907=917","908=918","909=919","910=921","911=906","912=922","913=923","914=924","915=925"';
  lbCount.Caption:='';
  lbCountAll.Caption:='';
end;
//------------------------------------------------
procedure TfmLoadZagsMinsk.FormDestroy(Sender: TObject);
begin
  slTypePunkt.Free;
  slStran.Free;
  slStran2.Free;
end;
//------------------------------------------------
procedure TfmLoadZagsMinsk.edFileEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if ChFile.Execute then begin
    edFile.Text:=ChFile.FileName;
//    s:=ExtractFileName(ChFile.FileName);
  end;
end;
//------------------------------------------------
procedure TfmLoadZagsMinsk.edFileEditButtons1Click(Sender: TObject; var Handled: Boolean);
var
  sDir:String;
begin
  if SelectDirectory('Выберите каталог с файлами для загрузки', '', sDir) then begin
    Handled:=true;
    edFile.Text:=sDir;
  end;
end;
//------------------------------------------------
procedure TfmLoadZagsMinsk.AddProtokol(s:String);
begin
  edDebug.Lines.Add(s);
  Application.ProcessMessages;
end;
//--------------------------------------------------------------
function TfmLoadZagsMinsk.CheckStrR(s:String; lEng:Boolean):String;
begin
  Result:=Utf8ToAnsi(s);
  if lEng then begin
//    Result:=StringReplace(Result,'H','Н', [rfReplaceAll]);  // английское H  на русское Н
    CheckEng(Result);
  end;
end;
//--------------------------------------------------------------
function TfmLoadZagsMinsk.XMLToValue(sValue:String; ft:TFieldType; vDefault:Variant): Variant;
begin
  Result:=null;
  if Trim(sValue)='' then begin
    if vDefault<>null then Result:=vDefault;
  end else begin
    case ft of
      ftString,ftMemo : Result:=CheckStrR(sValue);
      ftBoolean  : if (sValue='1') or (UpperCase(sValue)='TRUE') then Result:=true else Result:=false;
      ftDate     : Result:=STOD(sValue, tdAds);
      ftTime,ftTimeStamp
                 : Result:=STOT(sValue);
      ftFloat,ftCurrency
                 :  begin
                      Result:=StrToFloat(sValue);
                    end;
      ftLargeint : Result:=StrToInt(sValue);
      ftAutoInc,ftInteger,ftSmallint,ftWord,ftBytes
                 : begin
                     Result:=StrToInt(sValue);
                   end;
      ftBCD,ftFMTBCD : begin
                         Result:=StrToFloat(sValue);   // StrToFloatMy(sValue);
                       end;
    else
      AddProtokol('Неизвестный тип для значения '+svalue);
    end;
  end;
end;
//-----------------------------------------------------------
function TfmLoadZagsMinsk.ReadTypeAct(s:String; var sName:String): Integer;
begin
  Result:=0;
  sName:='Неизвестный тип записи: "'+s+'"';
  if s='' then exit;
  s:=ANSILowerCase(s);
  if s='death' then begin
    sName:='Записи актов о смерти';
    Result:=_TypeObj_ZSmert;
  end else if s='birth' then begin
    sName:='Записи актов о рождении';
    Result:=_TypeObj_ZRogd;
  end else if s='marriage' then begin
    sName:='Записи актов о заключении брака';
    Result:=_TypeObj_ZBrak;
  end else if s='divorce' then begin
    sName:='Записи актов о расторжении брака';
    Result:=_TypeObj_ZRast;
  end else if s='change' then begin
    sName:='Записи актов о перемене имени';
    Result:=_TypeObj_ZChName;
  end else if s='paternity' then begin
    sName:='Записи актов об установлении отцовства';
    Result:=_TypeObj_ZUstOtc;
  end else if s='adoption' then begin
    sName:='Записи актов об усыновлении (удочерении)';
    Result:=_TypeObj_ZAdopt;
  end;
end;
//--------------------------------------------------------------
function TfmLoadZagsMinsk.CheckSource(nSource:Integer; var sName:String): Boolean;
begin
  sName:='';
  case nSource of
    17110:  sName:='Дом бракосочетаний Мингорисполкома';
    50002:  sName:='Отдел загс Мингорисполкома';
    17111:  sName:='Отдел загс администрации Заводского района г. Минска';
    17112:  sName:='Отдел загс администрации Ленинского района г. Минска';
    17113:  sName:='Отдел загс администрации Московского района г. Минска';
    17114:  sName:='Отдел загс администрации Октябрьского района г. Минска';
    17115:  sName:='Отдел загс администрации Партизанского района г. Минска';
    17116:  sName:='Отдел загс администрации Первомайского района г. Минска';
    17117:  sName:='Отдел загс администрации Советского района г. Минска';
    17118:  sName:='Отдел загс администрации Фрунзенского района г. Минска';
    17119:  sName:='Отдел загс администрации Центрального района г. Минска';
    17109:  sName:='Сектор архива органов, регистрирующих акты гражданского состояния, главного управления юстиции Мингорисполкома';
  end;
  Result:=(sName<>'');
end;

//-----------------------------------------------------------
procedure TfmLoadZagsMinsk.LoadOneFile(sFile:String; lUpdate:Boolean);
var
  XMLDokument:TNativeXml;
  node,node_info, node_acts, node_act, node_row:TXMLNode;
  nType,nCount,nNew,i,j,n,m:Integer;
  dBegin, dEnd:TDateTime;
  lOk:Boolean;
  sName,sNameType,sNameExportFile:String;
  s, ss:String;
begin
  FCount:=0;
  FTest:=false; //cbTest.Checked;
  sNameExportFile:=sFile;
  XMLDokument:=TNativeXml.Create();
  XMLDokument.Clear;
  XMLDokument.Root.Name:='database';
  lOk:=true;
  try
    AddProtokol('Открытие файла '+sNameExportFile+' ... ');
    XMLDokument.LoadFromFile(sNameExportFile);
  except
    on E: Exception do begin
      AddProtokol('Ошибка: '+E.Message);
      lOk:=false;
    end;
  end;
  if lOk then begin
    node_info:=XMLDokument.Root.FindNode('info');
    node_acts:=XMLDokument.Root.FindNode('acts');
    if node_info=nil then begin
      lOk:=false;
      AddProtokol('Отсутствует тег <info>');
    end;
    if node_acts=nil then begin
      lOk:=false;
      AddProtokol('Отсутствует тег <acts>');
    end;
  end;
  if not lOk then begin
    XMLDokument.Free;
    exit;
  end;

  s:=CheckStrR( node_info.ReadString('date_begin',''));
  if s<>'' then begin
    dBegin:=XMLToValue(s,ftDate,0);
    AddProtokol('Начальная дата: '+DatePropis(dBegin, 3));
  end else begin
    AddProtokol('Неизвестна начальная дата');
    lOk:=false;
  end;
  s:=CheckStrR( node_info.ReadString('date_end',''));
  if s<>'' then begin
    dEnd:=XMLToValue(s,ftDate,0);
    AddProtokol('Конечная дата: '+DatePropis(dEnd, 3));
  end else begin
    AddProtokol('Неизвестна конечная дата');
    lOk:=false;
  end;
  s:=CheckStrR( node_info.ReadString('source',''));
  if (s<>'') and IsAllDigit(s) and CheckSource(StrToInt(s),sName) then begin
    AddProtokol('Источник: '+s+'('+sName+')   '+CheckStrR( node_info.ReadString('name','')));
    FSource:=s;
  end else begin
    FSource:='';
    AddProtokol('Неизвестный источник '+s);
    lOk:=false;
  end;
  if not lOk then begin
    XMLDokument.Free;
    exit;
  end;

  for i:=0 to node_acts.NodeCount-1 do begin
//  		<act type="death" count="1">
    lOk:=true;
    if node_acts.Nodes[i].Name='act' then begin
      node_act:=node_acts.Nodes[i];
      try
        s:=CheckStrR(node_act.ReadAttributeString('type',''));
        nType:=ReadTypeAct(s , sNameType);
        nCount:=node_act.ReadAttributeInteger('count',0);
        if nType>0 then begin
          AddProtokol(sNameType+', количество: '+IntToStr(nCount));
        end else begin
          lOk:=false;
          AddProtokol('Неизвестный тип запими акта: "'+s+'"');
        end;
      except
        on E:Exception do begin
          lOk:=false;
          AddProtokol('Ошибка чтения данных: '+E.Message);
        end;
      end;
      Application.ProcessMessages;
      if lOk then begin
      {$IFDEF TEST_MINSK}
         m:=0;
         for j:=0 to node_act.NodeCount-1 do begin
           if node_act.Nodes[j].Name='row' then Inc(m,1);
//           if nType=_TypeObj_ZSmert then begin
//             LoadOne_ZSmert(node_act.Nodes[j]);
//           end;
         end;
         if nCount<>m then s:='  НЕСООТВЕТСТВИЕ' else s:='';
         AddProtokol('  реальное количество: '+IntToStr(m)+s);
      {$ELSE}
         m:=0;
         for j:=0 to node_act.NodeCount-1 do begin
           if node_act.Nodes[j].Name='row' then Inc(m,1);
           if lUpdate then begin
             if nType=_TypeObj_ZSmert then begin

             end else if nType=_TypeObj_ZRogd then begin
               UpdateOne_ZRogd(node_act.Nodes[j]);
             end;
           end else begin
             if nType=_TypeObj_ZSmert then begin
               LoadOne_ZSmert(node_act.Nodes[j]);
             end else if nType=_TypeObj_ZRogd then begin
               LoadOne_ZRogd(node_act.Nodes[j]);
             end else if nType=_TypeObj_ZUstOtc then begin
               LoadOne_ZUstOtc(node_act.Nodes[j]);
             end else if nType=_TypeObj_ZBrak then begin
               LoadOne_ZBrak(node_act.Nodes[j]);
             end else if nType=_TypeObj_ZRast then begin
               LoadOne_ZRast(node_act.Nodes[j]);
             end else if nType=_TypeObj_ZChName then begin
               LoadOne_ZChName(node_act.Nodes[j]);
             end else if nType=_TypeObj_ZAdopt then begin
               LoadOne_ZAdopt(node_act.Nodes[j]);
             end;
           end;
           Application.ProcessMessages;
           if FCancel then break;
         end;
         if nCount<>m then s:='  НЕСООТВЕТСТВИЕ' else s:='';
         AddProtokol('  реальное количество: '+IntToStr(m)+s);
      {$ENDIF}
      end;
      Application.ProcessMessages;
    end;
  end;

  XMLDokument.Free;
end;
//-----------------------------------------------------------
procedure TfmLoadZagsMinsk.FindFilesZags(sPath:String; slFile:TStringList);
var
//  n,i,j,t:Integer;
//  s,sFile:String;
  lOk:Boolean;
  SearchRec: TSearchRec;
begin
  sPath:=CheckSleshN(sPath);
  lOk:=FindFirst(CheckSleshN(sPath)+'*.*', faAnyFile, SearchRec) = 0;
  if lOk then begin
    repeat
      if (SearchRec.Name[1] <> '.') and
         (SearchRec.Attr and faVolumeID <> faVolumeID) and
         (SearchRec.Attr and faDirectory <> faDirectory) then begin
         if RightStr(SearchRec.Name,4)='.xml' then begin
           slFile.Add(sPath+SearchRec.Name);
         end;
      end else if (SearchRec.Name[1] <> '.') and (SearchRec.Attr and faDirectory = faDirectory) then begin
        FindFilesZags(sPath+SearchRec.Name, slFile);
      end;
    until FindNext(SearchRec) <> 0;
  end;
end;
//-----------------------------------------------------------
procedure TfmLoadZagsMinsk.btLoadClick(Sender: TObject);
begin
  if Problem('Выполнить загрузку данных ?')
    then LoadAllFiles(false);
end;
procedure TfmLoadZagsMinsk.btUpdateClick(Sender: TObject);
begin
  if Problem('Обновить данные о национальности отца и матери в рождениях ?')
    then LoadAllFiles(true);
end;
//-----------------------------------------------------------
procedure TfmLoadZagsMinsk.LoadAllFiles(lUpdate:Boolean);
var
  s,sPath:String;
  i,nCount,nCountAll:Integer;
  lOk,lErr:Boolean;
  slFile:TStringList;
  tt:TDateTime;
begin
  if (edFile.Text='') then begin
    PutError('Введите имя файла или папки загрузуи',self);
    exit;
  end;
  slFile:=TStringList.Create;
  slTypePunkt.Clear;
  lbCount.Caption:='';
  lbCountAll.Caption:='';
  FCount:=0;
  FCountAll:=0;
  if FileExists(edFile.Text) then begin
    slFile.Add(edFile.Text);
  end else begin
    if DirectoryExists(edFile.Text) then begin
      sPath:=CheckSleshN(edFile.Text);
      FindFilesZags(sPath, slFile);
      if slFile.Count=0 then begin
        AddProtokol('По пути "'+edFile.Text+'" не найдено ни одного файла для загрузки');
      end;
    end else begin
      AddProtokol('Файл "'+edFile.Text+'" не найден');
    end;
  end;
  if slFile.Count>0 then begin
    edDebug.Clear;
    for i:=0 to slFile.Count-1 do begin
      AddProtokol(slFile.Strings[i]);
    end;
    FCancel:=false;
    s:='ВНИМАНИЕ!'#13+
       'Будет произведена загрузка информации из '+IntToStr(slFile.Count)+' файлов'#13+
       'Рекомендуется сделать резервное копирование базы!'+#13+
       'Если Вы хотите продолжить, введите слово ДА в поле ввода'#13;
    if Role.SystemAdmin or OkWarning(s,nil) then begin
      tt:=Now;
      edDebug.Clear;
      if lUpdate
        then AddProtokol('НАЧАЛО ОБНОВЛЕНИЯ: '+FormatDateTime('hh:nn:ss',tt))
        else AddProtokol('НАЧАЛО ЗАГРУЗКИ: '+FormatDateTime('hh:nn:ss',tt));
      lErr:=false;
      pb.Min:=0;
      pb.Max:=slFile.Count-1;
      pb.Position:=0;
      pb.Visible:=true;
      lbCountFiles.Visible:=true;
      Application.ProcessMessages;
      Application.BringToFront;
      for i:=0 to slFile.Count-1 do begin
        pb.Position:=i+1;
        lbCountFiles.Caption:=IntToStr(i+1)+'/'+IntToStr(slFile.Count);
        Application.ProcessMessages;
        AddProtokol(StringOfChar('-',80));
        LoadOneFile(slFile.Strings[i], lUpdate);
        if FCancel then break;
      end;
      if lUpdate
        then AddProtokol('ОБНОВЛЕНИЕ ОКОНЧЕНО: '+FormatDateTime('hh:nn:ss',Now))
        else AddProtokol('ЗАГРУЗКА ОКОНЧЕНА: '+FormatDateTime('hh:nn:ss',Now));
      AddProtokol('ВРЕМЯ: '+FormatDateTime('hh:nn:ss',Now-tt));
      pb.Visible:=false;
      lbCountFiles.Visible:=false;

      Application.ProcessMessages;
    end;
  end;
  slFile.Free;
//  slTypePunkt.SaveToFile('E:\typepunkt');
end;

//---------------------------------------------------------------------------
function TfmLoadZagsMinsk.ReadStrana(s:String; var adr:TAdresZ; sName:String):Integer;
begin
  FLastError:='';
  Result:=0;
  if s='' then exit;
  {$IFDEF TEST_MINSK}

  {$ELSE}
    if IsAllDigit(s) then begin
      if dmBase.SprStran.Locate('ID',s,[]) then begin
        Result:=StrToInt(s);
      end else begin
        FLastError:=sName+':'+s;
      end;
    end else begin
      s:=ANSIUpperCase(s);
      if dmBase.SprStran.Locate('ALFA3',s,[]) then begin
        Result:=dmBase.SprStran.FieldByNAme('ID').AsInteger;
      end else begin
        if s='LYU' then begin
          Result:=440; // Литва
        end else if s='ROU' then begin
          Result:=642; // Румыния
        end else if s='YAG' then begin
          Result:=841; // Югославия
        end else if s='HUG' then begin
          Result:=348; // Венгрия
        end else if s='ЮАР' then begin
          Result:=710; //
        end else begin
          FLastError:=sName+':'+s;
        end;
      end;
    end;
  {$ENDIF}
end;
//---------------------------------------------------------------------------
function TfmLoadZagsMinsk.ReadNation(s:String; sPol:String):Integer;
var
  sField:String;
begin
  Result:=0;
  FLastError:='';
  if s='' then exit;
  {$IFDEF TEST_MINSK}

  {$ELSE}
    s:=ANSILowerCase(s);
    if (Copy(s,1,5)='докум') or  (Copy(s,1,3)='не ') or (Copy(s,1,5)='неизв') or (Pos('беларусь',s)>0) or (Pos('гр ',s)>0) or (Pos('гр-',s)>0) or (Pos('г-',s)>0) or (Pos('гр.',s)>0)
       or (Pos('бежен',s)>0) or (Pos('гражд',s)>0) or (Pos('не пред',s)>0)  or (Pos('непред',s)>0) or (Copy(s,1,1)='-') or (Pos('лбг',s)>0) or (Pos('прож',s)>0) then begin
      Result:=190;
    end else if Copy(s,1,4)='руск' then begin
      Result:=1;
    end else if Copy(s,1,4)='поль' then begin
      Result:=173;   // поляки
    end else if Copy(s,1,4)='мардв' then begin
      Result:=47;   // мордва
    end else if (Copy(s,1,5)='белор') or (Copy(s,1,5)='белар') or (Copy(s,1,5)='беоло') or (Copy(s,1,6)='белрус')  or (Copy(s,1,6)='беорус') then begin
      Result:=3;
    end else if Copy(s,1,5)='армен' then begin
      Result:=13;
    end else if (Copy(s,1,4)='азей') or (Copy(s,1,5)='адзер') or (Copy(s,1,5)='арзей') then begin
      Result:=7;
    end else if Copy(s,1,4)='инду' then begin
      Result:=964;
    end else if Copy(s,1,5)='лизги' then begin
      Result:=26;   // лезгин
    end else if (Pos('евре',s)>0) and (Pos('гор',s)>0) then begin
      Result:=103;
    end else if (Pos('ланки',s)>0) then begin
      Result:=374;
    end else if (Pos('украи',s)>0) then begin
      Result:=2;
    end else begin
      if sPol='Ж' then sField:='NAME_G' else sField:='NAME_M';
      if dmBase.SprNac.Locate(sField, s, []) then begin
        Result:=dmBase.SprNac.FieldByName('ID').AsInteger;
      end else begin
        dmBase.SprNac.Filter:='name='+QStr(Copy(s,1,4)+'*');
        dmBase.SprNac.Filtered:=true;
        try
          if dmBase.SprNac.FieldByName('ID').AsString<>'' then begin
            Result:=dmBase.SprNac.FieldByName('ID').AsInteger;
          end else begin
            FLastError:='национальность:'+s;
          end;
        finally
          dmBase.SprNac.Filtered:=false;
        end;
      end;
    end;
  {$ENDIF}
end;
//---------------------------------------------------------------------------
function TfmLoadZagsMinsk.GetInt(s:String;sN:String):String;
var
  n:Integer;
  ss:String;
begin
  DelChars(s,' -=.,*+');
  ss:=s;
  s:=ANSIUpperCase(s);
  s:=StringReplace(s,'У','V', []);  // русское "У" на англ. "V"
  s:=StringReplace(s,'ў','V', []);  // БЕЛОрусское "ў" на англ. "V"
  s:=StringReplace(s,'Х','X', []);  // русское "ха" на англ. "икс"
  if (Pos('I',s)>0) or (Pos('V',s)>0)  or (Pos('Y',s)>0) or (Pos('X',s)>0) then begin
    s:=StringReplace(s,'Х','X', []);  // русское "ха" на англ. "икс"
    s:=StringReplace(s,'Y','V', []);
    s:=StringReplace(s,'1','I', []);
    if (s='II') or (s='I1') then s:='2' else if s='I' then s:='1' else if s='III' then s:='3' else if s='IV' then s:='4' else if s='V' then s:='5';
    if s='VI' then s:='6' else if s='VII' then s:='7' else if s='VIII' then s:='8' else if s='IX' then s:='9' else if s='X' then s:='10';
    if s='XI' then s:='11' else if s='XII' then s:='12';
  end else if (Copy(s,1,1)='В') or (Copy(s,1,1)='П') then begin
    if (Copy(s,1,1)='В') then s:='2';
    if (Copy(s,1,1)='П') then s:='1';
  end else if (s='Ш') or (s='Щ') then begin
    s:='3';
  end else if (Copy(s,1,2)='НЕ') or (s='O') or (s='О')  or (s='ОО') or (s='OO') then begin
    s:='';
  end;
  Result:=Trim(s);
  if Result<>'' then begin
    try
      n:=StrToInt(s);
    except
      Result:='';
      FLoadError:=FLoadError+sN+':"'+ss+'", ';
    end;
    if n>32000 then begin
      Result:='';
      FLoadError:=FLoadError+sN+':"'+ss+'", ';
    end;
  end;
end;
//---------------------------------------------------------------------------
function TfmLoadZagsMinsk.ReadDateC(sDate:String):TDateTime;
var
  n1,n2,n:Integer;
  ss,sD,sM,sY:String;
begin
  FLastError:='';
  Result:=0;
  if sDate=''
    then exit;
  ss:='C="'+sDate+'", ';
  DelChars(sDate, 'гГ');
  n2:=0;
  n1:=PosEx('.',sDate);
  if n1>0 then begin
    n2:=PosEx('.',sDate,n1+1);
  end else begin
    n1:=PosEx('-',sDate);
    if n1>0 then n2:=PosEx('-',sDate,n1+1);
  end;
  if (n1=0) and (n2=0) then begin
    sDate:=StringReplace(sDate,' ','.', [rfReplaceAll]);
    n1:=PosEx('.',sDate);
    if n1>0 then n2:=PosEx('.',sDate,n1+1);
  end;
  if (n1>0) and (n2>0) then begin
    sD:=Copy(sDate,1,n1-1);
    sM:=Copy(sDate,n1+1, n2-n1-1);
    sY:=Copy(sDate,n2+1,10);
    try
      DelChars(sY,'.');
      n:=StrToInt(sY);
    except
      n:=-1;
    end;
    if n>-1 then begin
      if n<100 then begin
        if (n>20) and (n<=99)
          then n:=1900+n
          else n:=2000+n;
      end;
      sY:=IntToStr(n);
      try
        Result:=EncodeDate(n,StrToInt(sM),StrToInt(sD));
      except
        Result:=0;
        FLastError:=FLastError+ss;
      end;
    end else begin
      Result:=0;
      FLastError:=FLastError+ss;
    end;
  end else begin
    Result:=0;
    FLastError:=FLastError+ss;
  end;
end;
//---------------------------------------------------------------------------
function TfmLoadZagsMinsk.ReadDate(sValue:String; sName:String):TDateTime;
begin
  FLastError:='';
  if sValue<>'' then begin
    try
      Result:=STOD(sValue,tdAds);
    except
      FLastError:=sName+'="'+sValue+'"';
      Result:=0;
    end;
  end else begin
    Result:=0;
  end;
end;
//---------------------------------------------------------------------------
function TfmLoadZagsMinsk.ReadDateEx(sValue:String):TgetDate;
var
  n:Integer;
begin
  FLastError:='';
// 0-Дата  1-Год  2-Месяц и год   3-Текст
  Result.Date:=0;
  if sValue='' then begin
    Result.OnlyGod:=0;
  end else begin
    try
      n:=CharCount('-', sValue);
      Result.OnlyGod:=-1;
      if n=0 then begin
        if IsAllDigit(sValue) and (Length(sValue)=4) then begin
          Result.OnlyGod:=1;
          Result.Date:=STOD(sValue+'-01-01',tdAds);
        end;
      end else if n=1 then begin
        if Length(sValue)=7 then begin
          Result.OnlyGod:=2;
          Result.Date:=STOD(sValue+'-01',tdAds);
        end;
      end else if n=2 then begin
        if Length(sValue)=10 then begin
          Result.OnlyGod:=0;
          Result.Date:=STOD(sValue,tdAds);
        end;
      end;
      if Result.OnlyGod=-1 then begin
        Result.OnlyGod:=3;
        Result.Text:=sValue;
      end;
    except
      on E: Exception do begin
        FLastError:=E.Message;
      end;
   end;
  end;
end;
//---------------------------------------------------------------------------
function TfmLoadZagsMinsk.ReadAdres(node: TXMLNode):TAdresZ;
var
  n,m:Integer;
  s:String;
begin
  Result.Error:='';
  try
    s:=CheckStrR(node.ReadAttributeString('resp',''));
    if s='КАССРУСЬ' then begin
      s:='9010';   // Карелия
    end else if s='КБАССРСЬ' then begin
      s:='9011';   // Кабардино-Балкарская АССР
    end;
    if Copy(s,1,1)='9' then begin
      if Pos(','+s+',', ',9001,9002,9003,9004,9005,9006,9007,9008,9009,9010,9011,9012,9013,9014,9015,9016,')>0 then begin
        if s='9004' then begin
          Result.resp:=904;  // Абхазия
        end else if s='9009' then begin        
          Result.resp:=901;  // ГДР
        end else begin
          Result.resp:=0;
          Result.obl:=slStran.Values[s];
        end;
      end else begin
        n:=slStran2.IndexOfName(s);
        if n<0 then begin
          Result.Error:=Result.Error+'resp:'+s+', ';
        end else begin
          Result.resp:=905;  // СССР
          Result.obl:=slStran2.ValueFromIndex[n];
        end;
      end;
    end else if s='КВЖД' then begin
      Result.resp:=905;  // СССР
      Result.obl:=s;
    end else begin
      Result.resp:=ReadStrana(s,result, 'resp');
      if FLastError<>'' then Result.Error:=Result.Error+FLastError+', ';
      Result.obl:=CheckStrR(node.ReadAttributeString('obl',''),true);
    end;
    Result.rn:=CheckStrR(node.ReadAttributeString('rn',''),true);
    Result.punkt:=Trim(CheckStrR(node.ReadAttributeString('punkt',''),true));
    if Result.punkt='' then begin
      s:=CheckStrR(node.ReadAttributeString('np',''));
      if s<>'' then begin
        Result.np:=s;
        Result.npt:=StrToInt(CheckStrR(node.ReadAttributeString('npt','0')));
        if (Result.npt<1) or (Result.npt>25) then begin
          Result.Error:='Неизвестный тип нас.пункта '+IntToStr(Result.npt)+'  '+Result.np
        end;
      end;
    end else begin
      n:=Pos(' ',Result.punkt);
      if n>0 then begin
        s:=ANSILowerCase(Copy(Result.punkt,1,n-1));
        if slTypePunkt.IndexOf(s)=-1
          then slTypePunkt.Add(s);
        if cbTypePunkt.Checked then begin
          m:=0;
          if s='город' then begin
            m:=1;
          end else if s='деревня' then begin
            m:=2;
          end else if s='поселок' then begin
            m:=8;
          end;
          if m>0 then begin
            Result.np:=Copy(Result.punkt,n+1,Length(Result.punkt));
            Result.npt:=m;
            Result.punkt:='';
          end;
        end;  
      end;
    end;
    Result.rng:=CheckStrR(node.ReadAttributeString('rng',''),true);
    s:=ANSILowerCase(Result.punkt);
    if (Result.rn<>'') then begin
      if (Pos('минск',s)>0) or (Pos('миhск',s)>0) or (Pos('брест',s)>0) or (Pos('гомель',s)>0)  or (Pos('витебск',s)>0) or (Pos('могилев',s)>0)
         or (Pos('гродно',s)>0)  or (Pos('бобруйск',s)>0) then begin
        Result.rng:=Result.rn;
        Result.rn:='';
      end;
    end;
    Result.ul:=CheckStrR(node.ReadAttributeString('ul',''),true);
    Result.dom:=CheckStrR(node.ReadAttributeString('dom',''));
    Result.korp:=CheckStrR(node.ReadAttributeString('korp',''));
    Result.kv:=CheckStrR(node.ReadAttributeString('kv',''));
  except
    on E: Exception do begin
      Result.Error:=E.Message;
    end;
  end;
  try
    Result.year:=StrToInt(CheckStrR(node.ReadAttributeString('year','0')));
  except
    Result.year:=0;
  end;
end;
//---------------------------------------------------------------------------
function TfmLoadZagsMinsk.ReadDok(node: TXMLNode): TDokZ;
var
  s:String;
begin
{
'1"	паспорт гражданина РБ "2"	вид на жительство РБ лица без гражданства "3"	вид на жительство РБ иностранного гражданина
"4"	паспорт иностранного гражданина "5"	удостоверение беженца "6"	свидетельство о рождении
}
  Result.Error:='';
  Result.full:=Trim(CheckStrR(node.ValueAsString));
  s:=CheckStrR(node.ReadAttributeString('org',''));
  if (Result.full='') and (s<>'') then begin
    Result.seria:=CheckStrR(node.ReadAttributeString('seria',''));
    Result.num:=CheckStrR(node.ReadAttributeString('num',''));
    Result.org:=s;
    Result.date:=ReadDate(node.ReadAttributeString('date',''),'date');
    if FLastError<>'' then Result.Error:=Result.Error+FLastError+', ';
    Result.typed:=node.ReadAttributeInteger('type',0);
    s:='паспорт';
    if (Result.typed<1) or (Result.typed>6) then begin
      Result.Error:='type="'+IntToStr(Result.typed)+'"';
      Result.typed:=0;
    end;
    if (Result.typed=2) or  (Result.typed=3) then s:='вид на жительство';
    if (Result.typed=5) then s:='удостоверение беженца';
    if (Result.typed=6) then s:='свидетельство о рождении';
    if Result.Error<>'' then begin
      Result.Error:='document ['+Result.Error+']';
    end;
    Result.full:=s+' '+Result.seria+Result.num+' выдан '+DatePropis(Result.date,3)+' '+Result.org;
  end;
end;
//---------------------------------------------------------------------------
function TfmLoadZagsMinsk.ReadMen(node: TXMLNode; sPol:String; nType:Integer): TMenZ;
var
  nd:TXMLNode;
  rec_date:TgetDate;
  s,s1,s2,ss:String;
  n:Integer;
  adr:TadresZ;
begin
{                         <on fam="Петров" name="Иван" otch="Петрович"
                         in="3456154A020PB6" dater="1987-08-04" nation="белорус" citizen="BLR"
                         educat="1" work="Локомотивное депо г. Брест, начальник поезда" fam_st="2">
                            <place_rg resp="BLR" obl="Минская" rn="Солигорский" punkt="г.Солигорск"/>
                            <adres_gt resp="BLR" obl="Брестская" rn="Брестский" np="Брест" npt="1" ul="ул. Ленина" dom="111" kv="32"/>
                            <document>паспорт АВ12136448 выдан Московским РОВД г.Бреста 27.04.2000</document>
                         </on>    }
  try
    Result.Error:='';
    if sPol=''
      then Result.Pol:=ANSIUpperCase(CheckStrR(node.ReadAttributeString('pol','')))
      else Result.Pol:=sPol;

     // читаем тольно национальность
    if nType=1 then  begin
      s:=CheckStrR(node.ReadAttributeString('nation',''));
      if s<>'' then begin
        Result.Nation:=ReadNation(s,Result.Pol);
        if FLastError<>'' then Result.Error:=Result.Error+FLastError+', ';
      end else begin
        Result.Nation:=0;
      end;
      exit;
    end;

    Result.Fam:=CheckStrR(node.ReadAttributeString('fam',''),true);
    Result.Name:=CheckStrR(node.ReadAttributeString('name',''),true);
    Result.Otch:=CheckStrR(node.ReadAttributeString('otch',''),true);
    Result.FamB:=CheckStrR(node.ReadAttributeString('fam_b',''),true);
    Result.NameB:=CheckStrR(node.ReadAttributeString('name_b',''),true);
    Result.OtchB:=CheckStrR(node.ReadAttributeString('otch_b',''),true);
    Result.LichNomer:=CheckStrR(node.ReadAttributeString('in',''));
    Result.OtchB:=CheckStrR(node.ReadAttributeString('otch_b',''),true);

    s:=CheckStrR(node.ReadAttributeString('citizen',''));
    if s<>'' then begin
      adr.obl:='*';  // !!!
      if s='9004' then begin
        Result.Citizen:=904;  // Абхазия
      end else begin
        Result.Citizen:=ReadStrana(s,adr);
      end;
      if FLastError<>'' then Result.Error:=Result.Error+FLastError+', ';
    end;
    s:=CheckStrR(node.ReadAttributeString('nation',''));
    if s<>'' then begin
      Result.Nation:=ReadNation(s,Result.Pol);
      if FLastError<>'' then Result.Error:=Result.Error+FLastError+', ';
    end else begin
      Result.Nation:=0;
    end;
    s:=CheckStrR(node.ReadAttributeString('fam_st',''));
    if (s<>'') then begin
      try
        n:=StrToInt(s);
      except
        n:=0;
      end;
      if n in [1,2,3,4,9]
        then s:=IntToStr(n)
        else s:='';
      if s='' then Result.Error:=Result.Error+'fam_st:'+s+', ';
    end;
    Result.Sem:=s;
    Result.Brak:=node.ReadAttributeString('brak','');
    Result.Work:=CheckStrR(node.ReadAttributeString('work',''));
    s:=CheckStrR(node.ReadAttributeString('educat',''));
    if (s<>'') then begin
      try
        n:=StrToInt(s);
        if (n>=20) and (n<29)   // из-за моей ошибки в описании старых типов образования  (20,22,23) ->  (21,23,24)   см. zags.dpr
          then n:=n+1;
      except
        n:=0;
      end;
      if n in [1,2,3,4,5,6,7,21,23,24,29]
        then s:=IntToStr(n)
        else s:='';
      if s='' then Result.Error:=Result.Error+'образование:'+s+'('+inttostr(n)+'), ';
    end;
    Result.Obraz:=s;
    rec_date:=ReadDateEx(Trim(node.ReadAttributeString('dater','')));
    if FLastError<>'' then Result.Error:=Result.Error+'дата рожд.:'+FLastError+', ';
    if rec_date.Date>0
      then Result.DateR:=rec_date.Date
      else Result.DateR:=0;
    Result.OnlyGodR:=rec_date.OnlyGod;
    Result.DateR_Text:=rec_date.Text;
    s:=CheckStrR(node.ReadAttributeString('timer',''));
    Result.TimeR:=0;
    if s<>'' then begin
      ss:=s;
      DelChars(s,'чм.,асовАСОВНнМм');
      s:=StringReplace(s,'З','3', [rfReplaceAll]);  // русская З на цифру три
      s:=StringReplace(s,'O','0', [rfReplaceAll]);  // английская O на ноль
      s:=StringReplace(s,'О','0', [rfReplaceAll]);  // русская О на ноль
      if s='24:00' then s:='00:00';
      n:=Pos(':',s);
      if n>0 then begin
        try
          s1:=Trim(Copy(s,1,n-1));
          if s1='' then s1:='0';
          s2:=Trim(Copy(s,n+1,10));
          if s2='' then s2:='0';
          Result.TimeR:=EncodeTime(StrToInt(s1),StrToInt(s2),0,0);
        except
          Result.TimeR:=0;
          Result.Error:=Result.Error+'время рожд.: "'+ss+'", ';
        end;
      end;
    end;
    nd:=node.FindNode('place_rg');
    if nd<>nil then begin
      Result.AdresR:=ReadAdres(nd);
      if Result.AdresR.Error<>'' then Result.Error:=Result.Error+Result.AdresR.Error+', ';
    end;
    nd:=node.FindNode('place_rg_b');
    if nd<>nil then begin
      Result.AdresRB:=ReadAdres(nd);
      if Result.AdresR.Error<>'' then Result.Error:=Result.Error+Result.AdresR.Error+', ';
    end;
    nd:=node.FindNode('adres_gt');
    if nd<>nil then begin
      Result.AdresG:=ReadAdres(nd);
      if Result.AdresR.Error<>'' then Result.Error:=Result.Error+Result.AdresR.Error+', ';
    end;
    nd:=node.FindNode('document');
    if nd<>nil then begin
      Result.Dok:=ReadDok(nd);
      if Result.Dok.Error<>'' then Result.Error:=Result.Error+Result.Dok.Error+', ';
    end;
  except
    on E: Exception do begin
      Result.Error:=E.Message;
    end;
  end;
end;
{
		    <row num="20" datez="2014-01-01" dates="2014-01-01"
                         doc_fact="Врачебное свидетельство о смерти № 123" follow="4" main_name="Дифтерия" main_kod="А36"
                         direct_name="Дифтерия" direct_kod="А36" spr_num="21" spr_date="2014-01-03"
                         mark_dok="паспорт ФА636363 выдан 20.10.2014" mark_vb="Сдан военный билет">
                       <cert date="2014-01-03" num="0264941" sr="I-АЛ"/>
                       <men fam="Иванов" name="Петр" otch="Петрович" fam_b="Іваноў" name_b="Пётр" otch_b="Пятровіч"
                            in="7895220A001PB0" citizen="BLR" nation="белорус" dater="1978-06-05"
                            fam_st="2" work="Брестская областная больница" educat="1">
                            <place_rg resp="BLR" obl="Гомельская" rn="Гомельский" punkt="г. Буда-Кошелево"/>
                            <adres_gt resp="BLR" obl="Брестская" rn="Брестский" np="Тельмы-2" npt="2" ul="ул. Васильковая" dom="7" kv="1"/>
                       </men>
                       <place_sm resp="BLR" obl="Брестская" rn="Брестский" punkt="д. Тельмы-2"/>
                       <decl fio="Иванова Анна Петровна" adres="д.Тельмы-2, пер.Днепробугский, 10">
                          <document>паспорт АВ12456478 выдан Московским РОВД г.Бреста 27.04.1999</document>
                       </decl>
                       <add  mark="иные отметки" changes="Изменения"
                          chief_dolg="Начальник отдела ЗАГС Брестского района" chief="И.А. Казакова"
                          spec_dolg="Специалист органа ЗАГС" spec="А.Н.Король"/>
                       <repeat_cert>
    		         <cert date="2016-01-12" num="1023" sr="I-АЛ"/>
                       </repeat_cert>
                    </row>
}
function TfmLoadZagsMinsk.LoadSvidPovtor(nType:Integer; nID:Integer; node:TXMLNode):Boolean;
var
  i:Integer;
  d:TDateTime;
  sNom,sDate:String;
begin
  FLastError:='';
  Result:=true;
  {$IFDEF TEST_MINSK}
    Result:=true;
  {$ELSE}
  with dmBase.SvidPovtor do begin
    try
      for i:=0 to node.NodeCount-1 do begin
        if node.Nodes[i].Name='cert' then begin
          sDate:=node.Nodes[i].ReadAttributeString('date');
          sNom:=CheckSvidNomer(CheckStrR(node.Nodes[i].ReadAttributeString('num','')));
          d:=ReadDate(sDate,'povtor.cert.date');
          if (d>0) and (sNom<>'') then begin
            Append;
            FieldByName('SVID_TYPE').AsInteger:=nType;
            FieldByName('AKT_ID').AsInteger:=nID;
            FieldByName('SVID_DATE').AsDateTime:=d;
            FieldByName('SVID_NOMER').AsString:=sNom;
            FieldByName('SVID_SERIA').AsString:=CheckSvidSeria( CheckStrR(node.Nodes[i].ReadAttributeString('sr','')) );
            FieldByName('FIRST').AsBoolean:=false;
            FieldByName('GISRN').AsInteger:=0;
            FieldByName('WHO_SVID').AsString:='';
            Post;
          end else begin
//            FLastError:=FLastError+'povtor.cert.date:'+sDate;
          end;
        end;
      end;
    except
      on E: Exception do begin
        Cancel;
//        if Pos('7057', E.Message) >0
//          then FLastError:='повт.свид.: type='+IntToStr(nType)+', date='+datepropis(d,3)+', nomer="'+sNom+'"'
//          else FLastError:=E.Message;
        if Pos('7057', E.Message)=0
          then FLastError:=E.Message;
      end;
    end;
  end;
  {$ENDIF}
end;
//-----------------------------------------------------------------------
function TfmLoadZagsMinsk.LoadChildren(nType:Integer; nID:Integer; node:TXMLNode; var nCount:Integer):String;
var
  i:Integer;
  sFam,sName,sOtch,sDate:String;
begin
{    <child fam="СУПРАНОВИЧ" name="ЮЛИЯ" otch="ВИТАЛЬЕВНА" dater="1990">  }
  FLastError:='';
  Result:='';
  nCount:=0;
  if node=nil
    then exit;
  for i:=0 to node.NodeCount-1 do begin
    if node.Nodes[i].Name='child' then begin
      sFam:=CheckStrR(node.Nodes[i].ReadAttributeString('fam'));
      sName:=CheckStrR(node.Nodes[i].ReadAttributeString('name'));
      sOtch:=CheckStrR(node.Nodes[i].ReadAttributeString('otch'));
      sDate:=CheckStrR(node.Nodes[i].ReadAttributeString('dater'));
      Result:=Result+ '"'+sFam+'",'+'"'+sNAME+'",'+'"'+sOtch+'",'+'"'+sDate+'"'+Chr(13);
      nCount:=nCount+1;
    end;
  end;
end;
//-----------------------------------------------------------------------
function TfmLoadZagsMinsk.LoadChildren2(nType:Integer; nID:Integer; node:TXMLNode; var nCount:Integer):String;
var
  i:Integer;
  sFam,sName,sOtch,sDate:String;
begin
{    <child fam="СУПРАНОВИЧ" name="ЮЛИЯ" otch="ВИТАЛЬЕВНА" dater="1990">  }
  FLastError:='';
  Result:='';
  nCount:=0;
  if node=nil
    then exit;
  for i:=0 to node.NodeCount-1 do begin
    if node.Nodes[i].Name='child' then begin
      sFam:=CheckStrR(node.Nodes[i].ReadAttributeString('fam'));
      sName:=CheckStrR(node.Nodes[i].ReadAttributeString('name'));
      sOtch:=CheckStrR(node.Nodes[i].ReadAttributeString('otch'));
      sDate:=CheckStrR(node.Nodes[i].ReadAttributeString('dater'));
      // "фамилия","имя","отчество","год роджения","орг.загс","номер записи","дата записи","дата рождения"
      Result:=Result+ '"'+sFam+'",'+'"'+sNAME+'",'+'"'+sOtch+'",'+'"'+sDate+'","","","",""'+Chr(13);
      nCount:=nCount+1;
    end;
  end;
end;
//---------------------------------------------------
function TfmLoadZagsMinsk.CheckSvidSeria(sSeria:String):String;
var
  n:Integer;
begin
  CharDel(sSeria,' ');
  if IsAllDigit(sSeria) or (Copy(sSeria,1,2)='НЕ') then begin

  end else begin
    sSeria:=StringReplace(sSeria,'DY','ВН', []);
    sSeria:=CheckEngI(sSeria);
    sSeria:=StringReplace(sSeria,'1','I', [rfReplaceAll]);
    sSeria:=StringReplace(sSeria,'"','-', []);
    sSeria:=StringReplace(sSeria,'=','-', []);
    sSeria:=StringReplace(sSeria,'--','-', []);
    sSeria:=StringReplace(sSeria,'B','В', []);
    sSeria:=StringReplace(sSeria,'H','Н', []);
    sSeria:=StringReplace(sSeria,'IВН','I-ВН', []);
    n:=Pos('ВН',sSeria);
    if n>0 then
      sSeria:=Copy(sSeria,1,n+1);
    sSeria:=StringReplace(sSeria,']','I', []);
    sSeria:=StringReplace(sSeria,'НВ','ВН', []);
    if (sSeria='ВН') or (sSeria='-ВН')
      then sSeria:='I-ВН';
    if (sSeria<>'') and cbSeria.Checked then begin
      if not dmBase.SvidSeria.Locate('SERIA', sSeria, []) then begin
        dmBase.SvidSeria.Append;
        dmBase.SvidSeria.FieldByName('SERIA').AsString:=sSeria;
        dmBase.SvidSeria.Post;
      end;
    end;
  end;
  Result:=sSeria;
end;
//---------------------------------------------------
function TfmLoadZagsMinsk.CheckSvidNomer(sNomer:String):String;
begin
  if sNomer=''
    then Result:=''
    else Result:=PadLStr(sNomer, 7, '0' );
end;
//---------------------------------------------------
procedure TfmLoadZagsMinsk.WriteAdres(ds:TDataSet; adr:TAdresZ; nType:Integer; sDop:String);
var
  s:String;
  sEnd:String;
  procedure addstr(ss:String; sadd:String);
  begin
    if ss<>'' then begin
      ss:=sadd+ss;
      if s=''
        then s:=ss
        else s:=s+', '+ss;
    end;
  end;
begin
  sEnd:='';
  if Copy(sDop,1,1)='-' then begin
    sEnd:=Copy(sDop,2,Length(sDop));
    sDop:='';
  end;
  ds.FieldByName(sDop+'GOSUD'+sEnd).AsInteger:=adr.resp;
  ds.FieldByName(sDop+'B_OBL'+sEnd).AsString:='';
  if Pos('область',adr.obl)>0 then begin
    ds.FieldByName(sDop+'B_OBL'+sEnd).AsString:='1';
    adr.obl:=StringReplace(adr.obl, 'область', '', []);
  end else if Pos('край',adr.obl)>0 then begin
    ds.FieldByName(sDop+'B_OBL'+sEnd).AsString:='0';
    adr.obl:=StringReplace(adr.obl, 'край', '', []);
  end;
  ds.FieldByName(sDop+'OBL'+sEnd).AsString:=adr.obl;
  ds.FieldByName(sDop+'RAION'+sEnd).AsString:=adr.rn;
  ds.FieldByName(sDop+'B_GOROD'+sEnd).AsString:='';
  if (adr.punkt='') and (adr.np<>'') then begin
    ds.FieldByName(sDop+'B_GOROD'+sEnd).AsInteger:=adr.npt;
    ds.FieldByName(sDop+'GOROD'+sEnd).AsString:=adr.np;
  end else begin
    ds.FieldByName(sDop+'GOROD'+sEnd).AsString:=adr.punkt;
  end;
  if nType=2 then begin
    if adr.rng='' then begin
      ds.FieldByName(sDop+'B_RN'+sEnd).AsBoolean:=true;  // обычный район
    end else begin
      ds.FieldByName(sDop+'RAION'+sEnd).AsString:=adr.rng;  // район города
      ds.FieldByName(sDop+'B_RN'+sEnd).AsBoolean:=false;
    end;
    ds.FieldByName(sDop+'GOROD_R'+sEnd).AsString:=adr.ul;
    ds.FieldByName(sDop+'DOM'+sEnd).AsString:=adr.dom;
    ds.FieldByName(sDop+'KORP'+sEnd).AsString:=adr.korp;
    ds.FieldByName(sDop+'KV'+sEnd).AsString:=adr.kv;
  end else if nType=3 then begin
    if adr.rng<>'' then s:=adr.rng+' район' else s:='';
    AddStr(adr.ul,'');
    AddStr(adr.dom,'дом ');
    AddStr(adr.korp,'корп ');
    AddStr(adr.kv,'кв. ');
    ds.FieldByName(sDop+'GOROD_R'+sEnd).AsString:=s;
  end;
end;
//-------------------------------------------------------------------
procedure TfmLoadZagsMinsk.Button1Click(Sender: TObject);
begin
  if Problem(PadCStr('Прервать загрузку ?',40,' ')) then
    FCancel:=true;
end;
//-------------------------------------------------------------------
procedure TfmLoadZagsMinsk.Button2Click(Sender: TObject);
var
  sl:TStringList;
  s,strSQL:String;
  i:Integer;
begin
  if not dmBase.LoadSQL('Удаление_записей_актов', strSQL) then begin
     PutError('Ошибка загрузки запроса на удаление');
     exit;
  end;
  if not  Problem(PadCStr('Удать всю ранее загруженную информацию ?',50,' '))
    then exit;

  sl:=TStringList.Create;
  sl.AddObject('АктыРождений', Pointer(_TypeObj_ZRogd));
  sl.AddObject('АктыСмертей', Pointer(_TypeObj_ZSmert));
  sl.AddObject('ЗаключениеБраков', Pointer(_TypeObj_ZBrak));
  sl.AddObject('AktTermMarriage', Pointer(_TypeObj_ZRast));
  sl.AddObject('АктыУстОтцовства', Pointer(_TypeObj_ZUstOtc));
  sl.AddObject('AktChangeName', Pointer(_TypeObj_ZChName));
  sl.AddObject('AktAdopt', Pointer(_TypeObj_ZAdopt));
  OpenMessage('Удаление записей актов из базы');
  try
    for i:=0 to sl.Count-1 do begin
      ChangeMessage(sl.Strings[i]+'  удаление');
      s:=strSQL;
      s:=StringReplace(s, '&ADD_WHERE&', 'podr=9', [rfReplaceAll, rfIgnoreCase]);
      s:=StringReplace(s, '&TABLE_NAME&', sl.Strings[i], [rfReplaceAll, rfIgnoreCase]);
      s:=StringReplace(s, '&TYPE_OBJ&', IntToStr(Integer(sl.Objects[i])), [rfReplaceAll, rfIgnoreCase]);
      try
        dmBase.AdsConnection.Execute(s);
      except
        on E: Exception do begin
          PutError('Таблица: '+sl.Strings[i]+Chr(13)+
                   'Ошибка удаления информации'+Chr(13)+
                   E.Message);
        end;
      end;
    end;
  finally
    sl.Free;
    CloseMessage;
  end;
end;

//---------------------------------------------------
function TfmLoadZagsMinsk.LoadOne_ZSmert(node:TXMLNode):Boolean;
var
  m:TMenZ;
  adrsm:TAdresZ;
  dok:TDokZ;
  d:TDateTime;
  nd,nd1:TXMLNode;
  n,nType,nID:Integer;
  s,ss:String;
  ds:TDataSet;
  rec_date:TgetDate;
begin
  Result:=true;
  FLoadError:='';
  {$IFDEF TEST_MINSK}
  {$ELSE}
  FCount:=FCount+1;
  FCountAll:=FCountAll+1;
  nType:=_TypeObj_ZSmert;
  ds:=dmBase.tbZapisSmert;
  ds.Append;

  LoadOne_Header(ds, node);
  {
  ds.FieldByName('ID_ZAGS').AsString:=FSource;
  ds.FieldByName('ID_SOURCE').AsString:=FSource;
  ds.FieldByName('PODR').AsInteger:=999;  // !!!

  ds.FieldByName('NOMER').AsString:=node.ReadAttributeString('num','');   // NOMER
  if ds.FieldByName('NOMER').AsString=''
    then FLoadError:=FLoadError+'№ записи пусто, ';

  d:=ReadDate(node.ReadAttributeString('datez',''),'datez');
  if d>0
    then  ds.FieldByName('DATEZ').AsDateTime:=d
    else  FLoadError:=FLoadError+'дата записи пусто, ';
  }

  rec_date:=ReadDateEx(node.ReadAttributeString('dates',''));
  case rec_date.OnlyGod of
    0,1,2: if rec_date.Date>0 then ds.FieldByName('DATES').AsDateTime:=rec_date.Date;
//    3    : dmBase.WriteValueProp('TEXT_DATES', rec_date.Text, dmBase.GetDateCurrentSost, nID, nType, ftString);
    3    : dmBase.WritePropSimpleDok(nType, nID, STOD('1899-12-30',tdAds), 'TEXT_DATES', nil, rec_date.Text, ftString);

  end;
  ds.FieldByName('ONLYGOD').AsInteger:=rec_date.OnlyGod;
  if d>0 then  ds.FieldByName('DATES').AsDateTime:=rec_date.Date;

  ds.FieldByName('DOKUMENT').AsString:=CheckStrR(node.ReadAttributeString('doc_fact',''));    // DOKUMENT
  ds.FieldByName('PR_OSN_NAME').AsString:=CheckStrR(node.ReadAttributeString('main_name',''));   // PR_OSN_NAME
  ds.FieldByName('PR_OSN').AsString:=CheckStrR(node.ReadAttributeString('main_kod',''));    // PR_OSN_KOD
  ds.FieldByName('PR_NEP_NAME').AsString:=CheckStrR(node.ReadAttributeString('direct_name','')); // PR_NEP_NAME
  ds.FieldByName('PR_NEP').AsString:=CheckStrR(node.ReadAttributeString('direct_kod',''));  // PR_NEP_KOD
  n:=node.ReadAttributeInteger('follow',0);  //  SMERT_POSL
  if n in [1,2,3,4,5,9,21]  then ds.FieldByName('SMERT_POSL').AsInteger:=n;
//  ERROR                          else
  ds.FieldByName('SDAN_DOK').AsString:=CheckStrR(node.ReadAttributeString('mark_dok',''));  // SDAN_DOK
  ds.FieldByName('SDAN_VB').AsString:=CheckStrR(node.ReadAttributeString('mark_vb',''));   // SDAN_VB

  ds.FieldByName('SPRAV_NOMER').AsString:=CheckStrR(node.ReadAttributeString('spr_num',''));   //SPRAV_NOMER
  d:=ReadDate(node.ReadAttributeString('spr_date',''),'spr_date'); if d>0 then ds.FieldByName('SPRAV_DATE').AsDateTime:=d;

  m:=ReadMen(node.FindNode('men'),'');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('FAMILIA').AsString:=m.Fam;
  ds.FieldByName('NAME').AsString:=m.Name;
  ds.FieldByName('OTCH').AsString:=m.Otch;
  ds.FieldByName('FAMILIA_B').AsString:=m.FamB;
  ds.FieldByName('NAME_B').AsString:=m.NameB;
  ds.FieldByName('OTCH_B').AsString:=m.OtchB;
  case m.OnlyGodR of
    0,1,2: if m.DateR>0 then ds.FieldByName('DATER').AsDateTime:=m.DateR;
//    3    : dmBase.WriteValueProp('TEXT_VOZR', m.DateR_Text, dmBase.GetDateCurrentSost, nID, nType, ftString);
    3    : dmBase.WritePropSimpleDok(nType, nID, STOD('1899-12-30',tdAds), 'TEXT_VOZR', nil, m.DateR_Text, ftString);
  end;
  ds.FieldByName('ONLYGOD_R').AsInteger:=m.OnlyGodR;
  ds.FieldByName('POL').AsString:=m.Pol;
  ds.FieldByName('GRAG').AsInteger:=m.Citizen;
  ds.FieldByName('LICH_NOMER').AsString:=m.LichNomer;
//  m.Nation;
  ds.FieldByName('SEM').AsString:=m.Sem;
  ds.FieldByName('OBRAZ').AsString:=m.Obraz;
  ds.FieldByName('WORK_NAME').AsString:=m.Work;
  ds.FieldByName('SDAN_DOK').AsString:=m.Dok.full;
  WriteAdres(ds,m.AdresR,1,'RG_');
  WriteAdres(ds,m.AdresG,2,'GT_');
  adrsm:=ReadAdres(node.FindNode('place_sm'));
  if adrsm.Error<>'' then FLoadError:=FLoadError+adrsm.Error+', ';
  WriteAdres(ds,adrsm,1,'SM_');

  nd:=node.FindNode('cert');
  if nd<>nil then begin
    s:=CheckStrR(nd.ReadAttributeString('num',''));
    if s<>'' then begin
      s:=CheckSvidNomer( CheckStrR(nd.ReadAttributeString('num','')) );
      if (s<>'') and (s<>'0000000') then begin
        d:=ReadDate(nd.ReadAttributeString('date',''),'cert.date'); if d>0 then ds.FieldByName('DATESV').AsDateTime:=d;
        ds.FieldByName('SVID_NOMER').AsString:=s;
        ds.FieldByName('SVID_SERIA').AsString:=CheckSvidSeria( CheckStrR(nd.ReadAttributeString('sr','')) );
      end;
    end;
  end;
  nd:=node.FindNode('decl');
  if nd<>nil then begin
    s:=CheckStrR(nd.ReadAttributeString('fio',''));     //DECL  fio+','+adres
    ss:=CheckStrR(nd.ReadAttributeString('adres',''));  //
    ds.FieldByName('DECL').AsString:=s+', '+ss;
    nd1:=nd.FindNode('doc');        //
    if nd1<>nil then begin
      dok:=ReadDok(nd1);
      if dok.full<>''
        then ds.FieldByName('DECL_DOK').AsString:=dok.full;
    end;
  end;
  if FTest then begin
    ds.Cancel;
  end else begin
    ds.Post;
    nID:=ds.FieldByName('ID').AsInteger;  // !!!  определим nID  !!!
//    nd:=;
//    if nd<>nil then begin
//      EditDataSet(ds);
    LoadOne_Add(ds, node.FindNode('add'), 'ZAMETKA', nID, nType);
      {
      ds.FieldByName('RUKOV').AsString:=CheckStrR(nd.ReadAttributeString('chief',''));
      ds.FieldByName('SPEC').AsString:=CheckStrR(nd.ReadAttributeString('spec',''));
      ds.FieldByName('ZAMETKA').AsString:=CheckStrR(nd.ReadAttributeString('mark',''));
      s:=CheckStrR(nd.ReadAttributeString('changes',''));
      if s<>'' then dmBase.WriteValueProp('IZMEN', s, dmBase.GetDateCurrentSost, nID, nType, ftMemo);
      //----- в свойство OTHER записываются значения должностей руководителя и специалиста
      ss:='';
      s:=CheckStrR(nd.ReadAttributeString('chief_dolg',''));
      if s<>'' then ss:='RUKOV_D='+s+#13#10;
      s:=CheckStrR(nd.ReadAttributeString('spec_dolg',''));
      if s<>'' then ss:=ss+'SPEC_D='+s+#13#10;
      if ss<>'' then dmBase.WriteValueProp('OTHER', ss, dmBase.GetDateCurrentSost, nID, nType, ftMemo);
      //-----------------------------------------------------------------------------------
      PostDataSet(ds);
      }
//    end;
    nd:=node.FindNode('repeat_cert');
    if nd<>nil
      then LoadSvidPovtor(nType, nID, nd);
    if FLastError<>'' then FLoadError:=FLoadError+FLastError+', ';
  end;
  if cbError.Checked and (FLoadError<>'') then begin
    AddProtokol(ds.FieldByName('NOMER').AsString+') '+Copy(FLoadError,1,Length(FLoadError)-2));
  end;
  lbCountAll.Caption:=IntToStr(FCountAll);
  lbCount.Caption:=IntToStr(FCount);
  Application.ProcessMessages
  {$ENDIF}
end;
//---------------------------------------------------
function TfmLoadZagsMinsk.LoadOne_Header(ds:TDataSet; node:TXMLNode):Boolean;
var
  d:TDateTime;
  fld:TField;
  s:String;
begin
  Result:=true;
  ds.FieldByName('ID_ZAGS').AsString:=FSource;
  ds.FieldByName('ID_SOURCE').AsString:=FSource;

//  s:=node.ReadAttributeString('podr','');   // PODR подразделение
//  if (s='') or (s='0') then begin
    ds.FieldByName('PODR').AsInteger:=9; //99;  // !!!
//  end else begin
//    ds.FieldByName('PODR').AsInteger:=StrToIntDef(s,9); //  // !!!
//  end;

  fld:=ds.FindField('VOSSTAN');
  if fld<>nil
    then fld.AsBoolean:=false;

  ds.FieldByName('NOMER').AsString:=node.ReadAttributeString('num','');   // NOMER
  if ds.FieldByName('NOMER').AsString=''
    then FLoadError:=FLoadError+'№ записи пусто, ';

  d:=ReadDate(node.ReadAttributeString('datez',''),'datez');
  if d>0
    then  ds.FieldByName('DATEZ').AsDateTime:=d
    else  FLoadError:=FLoadError+'дата записи пусто, ';
end;
//---------------------------------------------------
function TfmLoadZagsMinsk.getHeader(node:TXMLNode):THeaderAkt;
var
  d:TDateTime;
  s:String;
begin
  Result.ID_ZAGS:=StrToInt(FSource);
  Result.ID_SOURCE:=StrToInt(FSource);
  Result.PODR:=9;
  Result.NOMER:=StrToIntDef( node.ReadAttributeString('num',''), 0);
  d:=ReadDate(node.ReadAttributeString('datez',''),'datez');
  if d>0
    then  Result.DATEZ:=d
    else  Result.DATEZ:=0;
end;

//---------------------------------------------------
function TfmLoadZagsMinsk.LoadOne_WriteSvid(ds:TDataSet; nd:TXMLNode; sAdd:String):Boolean;
var
  d:TDateTime;
  s:String;
begin
  if nd<>nil then begin
    s:=CheckStrR(nd.ReadAttributeString('num',''));
    if s<>'' then begin
      s:=CheckSvidNomer( CheckStrR(nd.ReadAttributeString('num','')) );
      if (s<>'') and (s<>'0000000') then begin
        ds.FieldByName(sAdd+'SVID_NOMER').AsString:=s;
        ds.FieldByName(sAdd+'SVID_SERIA').AsString:=CheckSvidSeria( CheckStrR(nd.ReadAttributeString('sr','')) );
        d:=ReadDate(nd.ReadAttributeString('date',''),sAdd+'cert.date');
        if d>0 then begin
          if sAdd=''
            then ds.FieldByName('DATESV').AsDateTime:=d
            else ds.FieldByName(sAdd+'SVID_DATE').AsDateTime:=d;
        end;
      end;
    end;
  end;
end;
//---------------------------------------------------
function TfmLoadZagsMinsk.LoadOne_Add(ds:TDataSet; nd:TXMLNode; sFldOtm:String; nID:Integer; nType:Integer):Boolean;
var
  s,ss:String;
begin
  if nd<>nil then begin
    EditDataSet(ds);
    ds.FieldByName('RUKOV').AsString:=CheckStrR(nd.ReadAttributeString('chief',''));
    ds.FieldByName('SPEC').AsString:=CheckStrR(nd.ReadAttributeString('spec',''));
    if sFldOtm<>''
      then ds.FieldByName(sFldOtm).AsString:=CheckStrR(nd.ReadAttributeString('mark',''));
    s:=CheckStrR(nd.ReadAttributeString('changes',''));
//    if s<>'' then dmBase.WriteValueProp('IZMEN', s, dmBase.GetDateCurrentSost, nID, nType, ftMemo);
    if s<>'' then dmBase.WritePropSimpleDok(nType, nID, STOD('1899-12-30',tdAds), 'IZMEN', nil, s, ftMemo);

    //----- в свойство OTHER записываются значения должностей руководителя и специалиста
    ss:='';
    s:=CheckStrR(nd.ReadAttributeString('chief_dolg',''));
    if s<>'' then ss:='RUKOV_D='+s+#13#10;
    s:=CheckStrR(nd.ReadAttributeString('spec_dolg',''));
    if s<>'' then ss:=ss+'SPEC_D='+s+#13#10;
//    if ss<>'' then dmBase.WriteValueProp('OTHER', ss, dmBase.GetDateCurrentSost, nID, nType, ftMemo);
    if ss<>'' then dmBase.WritePropSimpleDok(nType, nID, STOD('1899-12-30',tdAds), 'OTHER', nil, ss, ftMemo);
    //-----------------------------------------------------------------------------------
    PostDataSet(ds);
  end;
end;
//-----------------------------------------------------
function TfmLoadZagsMinsk.UpdateOne_ZRogd(node:TXMLNode):Boolean;
var
  m:TMenZ;
  adrsm:TAdresZ;
  dok:TDokZ;
  d:TDateTime;
  nd,nd1:TXMLNode;
  n,nType,nID:Integer;
  s,ss:String;
  ds:TDataSet;
  rec_date:TgetDate;
  recHeader:THeaderAkt;
  lOk:Boolean;
begin
  Result:=true;
  FLoadError:='';
  FCountAll:=FCountAll+1;
  nType:=_TypeObj_ZRogd;
  ds:=dmBase.tbZapisRogd;
//<row num="2" datez="1998-01-06" live="1" type="1" massa="3400" dlina="55" schet="1"
//     ostat="" dates="" doc_fact="" spr_num="" spr_date="" basis_father="1">
//  <sp A="2" B="1" C="18-03-97" D="269" E="269" F="" G="" H="1" I="" J="6-08-89" K="4" />
  recHeader:=getHeader(node);
  if (recHeader.NOMER>0) and (recHeader.DATEZ>0) then begin
    dmBase.tbZapisRogd.IndexName:='NOMER';
    dmBase.tbZapisRogd.SetRange([recHeader.NOMER, recHeader.DATEZ], [recHeader.NOMER, recHeader.DATEZ]);
    lOk:=false;
    while not ds.Eof do begin
      if ds.FieldByName('PODR').AsInteger=recHeader.PODR then  begin
        FCount:=FCount+1;
        ds.Edit;
        //===== father =======================
        m:=ReadMen(node.FindNode('father'),'М', 1);
        if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
        if m.Nation>0
          then ds.FieldByName('ON_NATION').AsInteger:=m.Nation
          else ds.FieldByName('ON_NATION').AsString:='';
        //===== mother =======================
        m:=ReadMen(node.FindNode('mother'),'Ж', 1);
        if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
        if m.Nation>0
          then ds.FieldByName('ONA_NATION').AsInteger:=m.Nation
          else ds.FieldByName('ONA_NATION').AsString:='';
//        ds.FieldByName('DLINA').AsString:=GetInt(CheckStrR(node.ReadAttributeString('dlina','')),'длина');
//        ds.FieldByName('SCHET').AsString:=GetInt(CheckStrR(node.ReadAttributeString('schet','')),'по счету');
        ds.Post;
        lOk:=true;
      end;
      ds.Next;
    end;
    dmBase.tbZapisRogd.CancelRange;
    if not lOk then begin
      FLoadError:=IntToStr(recHeader.NOMER)+', '+DatePropis(recHeader.DATEZ,3)+' запись акта не найдена';
    end;
  end else begin
    FLoadError:=' пустое значение: '+IntToStr(recHeader.NOMER)+', '+DatePropis(recHeader.DATEZ,3);
  end;
  if cbError.Checked and (FLoadError<>'') then begin
    AddProtokol(IntToStr(recHeader.NOMER)+') '+FLoadError);
  end;
  lbCountAll.Caption:=IntToStr(FCountAll);
  lbCount.Caption:=IntToStr(FCount);
  Application.ProcessMessages
end;
//-----------------------------------------------------------------
procedure TfmLoadZagsMinsk.Button3Click(Sender: TObject);
begin
end;
//---------------------------------------------------
function TfmLoadZagsMinsk.LoadOne_ZRogd(node:TXMLNode):Boolean;
var
  m:TMenZ;
  adrsm:TAdresZ;
  dok:TDokZ;
  d:TDateTime;
  nd,nd1:TXMLNode;
  n,nType,nID:Integer;
  s,ss:String;
  ds:TDataSet;
  rec_date:TgetDate;
begin
  Result:=true;
  FLoadError:='';
  FCount:=FCount+1;
  FCountAll:=FCountAll+1;
  nType:=_TypeObj_ZRogd;
  ds:=dmBase.tbZapisRogd;
  ds.Append;
  LoadOne_Header(ds, node);

//<row num="2" datez="1998-01-06" live="1" type="1" massa="3400" dlina="55" schet="1"
//     ostat="" dates="" doc_fact="" spr_num="" spr_date="" basis_father="1">
//  <sp A="2" B="1" C="18-03-97" D="269" E="269" F="" G="" H="1" I="" J="6-08-89" K="4" />
  ds.FieldByName('GIVOROGD').AsString:=node.ReadAttributeString('live','1');
  ds.FieldByName('TYPEROD').AsString:=node.ReadAttributeString('type','1');
  ds.FieldByName('MASSA').AsString:=GetInt(CheckStrR(node.ReadAttributeString('massa','')),'масса');
  ds.FieldByName('DLINA').AsString:=GetInt(CheckStrR(node.ReadAttributeString('dlina','')),'длина');
  ds.FieldByName('SCHET').AsString:=GetInt(CheckStrR(node.ReadAttributeString('schet','')),'по счету');
  ds.FieldByName('OSTAT').AsString:=CheckStrR(node.ReadAttributeString('ostat',''));
  if ds.FieldByName('OSTAT').AsString='0'
    then ds.FieldByName('OSTAT').AsString:='';
  ds.FieldByName('DOKUMENT').AsString:=CheckStrR(node.ReadAttributeString('doc_fact',''));
  d:=ReadDate(node.ReadAttributeString('dates',''),'dates'); if d>0 then ds.FieldByName('DATES').AsDateTime:=d;
  nd:=node.FindNode('sp');
  if nd<>nil then begin
    ds.FieldByName('SP_A').AsString:=GetInt(CheckStrR(nd.ReadAttributeString('A','')),'A');
    ds.FieldByName('SP_B').AsString:=GetInt(CheckStrR(nd.ReadAttributeString('B','')),'B');
    d:=ReadDateC(CheckStrR(nd.ReadAttributeString('C','')));
    if d>0 then ds.FieldByName('SP_C').AsDateTime:=d
           else if FLoadError<>'' then FLoadError:=FLoadError+FLastError+', ';
    ds.FieldByName('SP_D').AsString:=GetInt(CheckStrR(nd.ReadAttributeString('D','')),'D');
    ds.FieldByName('SP_E').AsString:=GetInt(CheckStrR(nd.ReadAttributeString('E','')),'E');
    ds.FieldByName('SP_F').AsString:=GetInt(CheckStrR(nd.ReadAttributeString('F','')),'F');
    ds.FieldByName('SP_G').AsString:=GetInt(CheckStrR(nd.ReadAttributeString('G','')),'G');
    ds.FieldByName('SP_H').AsString:=GetInt(CheckStrR(nd.ReadAttributeString('H','')),'H');
    ds.FieldByName('SP_I').AsString:=GetInt(CheckStrR(nd.ReadAttributeString('I','')),'I');
    ds.FieldByName('SP_J_GOD').AsString:=CheckStrR(nd.ReadAttributeString('J',''));
    ds.FieldByName('SP_K').AsString:=GetInt(CheckStrR(nd.ReadAttributeString('K','')),'K');
  end;
  ds.FieldByName('SVED').AsString:=node.ReadAttributeString('basis_father','3');
  if ds.FieldByName('SVED').AsString='1' then begin  // брак зарегистрирован
    nd:=node.FindNode('act_marriage');
    if nd<>nil then begin
      d:=ReadDate(nd.ReadAttributeString('date',''),'act_marriage'); if d>0 then ds.FieldByName('SVED_DATEB').AsDateTime:=d;
      ds.FieldByName('SVED_AKT').AsString:=nd.ReadAttributeString('num','');
      ds.FieldByName('SVED_SVID').AsString:=CheckStrR(nd.ReadAttributeString('org',''));
    end;
  end else begin
    ds.FieldByName('SVED').AsInteger:=3;  // заявление матери
    d:=ReadDate(node.ReadAttributeString('decl_date',''),''); if d>0 then ds.FieldByName('SVED_SVID').AsString:=DatePropis(d,3);
  end;
  ds.FieldByName('SPRAV_NOMER').AsString:=node.ReadAttributeString('spr_num','');
  d:=ReadDate(node.ReadAttributeString('spr_date',''),''); if d>0 then ds.FieldByName('SPRAV_DATE').AsDateTime:=d;
  //===== child =======================
  m:=ReadMen(node.FindNode('child'),'');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('FAMILIA').AsString:=m.Fam;
  ds.FieldByName('NAME').AsString:=m.Name;
  ds.FieldByName('OTCH').AsString:=m.Otch;
  ds.FieldByName('FAMILIA_B').AsString:=m.FamB;
  ds.FieldByName('NAME_B').AsString:=m.NameB;
  ds.FieldByName('OTCH_B').AsString:=m.OtchB;
  if m.DateR>0 then ds.FieldByName('DATER').AsDateTime:=m.DateR;
  if m.TimeR>0 then ds.FieldByName('TIMER').AsDateTime:=m.TimeR;
  ds.FieldByName('POL').AsString:=m.Pol;
  ds.FieldByName('IDENTIF').AsString:=m.LichNomer;
  WriteAdres(ds,m.AdresR,1,'');
  //===== father =======================
  m:=ReadMen(node.FindNode('father'),'М');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('ON_FAMILIA').AsString:=m.Fam;
  ds.FieldByName('ON_NAME').AsString:=m.Name;
  ds.FieldByName('ON_OTCH').AsString:=m.Otch;
  ds.FieldByName('ON_FAMILIA_B').AsString:=m.FamB;
  ds.FieldByName('ON_NAME_B').AsString:=m.NameB;
  ds.FieldByName('ON_OTCH_B').AsString:=m.OtchB;
  if m.DateR>0 then ds.FieldByName('ON_DATER').AsDateTime:=m.DateR;
  ds.FieldByName('ON_IDENTIF').AsString:=m.LichNomer;
  WriteAdres(ds,m.AdresR,1,'ON_M_');
  WriteAdres(ds,m.AdresG,2,'ON_');
  if m.Nation>0  then ds.FieldByName('ON_NATION').AsInteger:=m.Nation;
  if m.Citizen>0 then ds.FieldByName('ON_GRAG').AsInteger:=m.Citizen;
  ds.FieldByName('ON_OBRAZ').AsString:=m.Obraz;
  ds.FieldByName('ON_WORK').AsString:=m.Work;
  ds.FieldByName('ON_DOKUMENT').AsString:=m.Dok.full;
  //===== mother =======================
  m:=ReadMen(node.FindNode('mother'),'Ж');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('ONA_FAMILIA').AsString:=m.Fam;
  ds.FieldByName('ONA_NAME').AsString:=m.Name;
  ds.FieldByName('ONA_OTCH').AsString:=m.Otch;
  ds.FieldByName('ONA_FAMILIA_B').AsString:=m.FamB;
  ds.FieldByName('ONA_NAME_B').AsString:=m.NameB;
  ds.FieldByName('ONA_OTCH_B').AsString:=m.OtchB;
  if m.DateR>0 then ds.FieldByName('ONA_DATER').AsDateTime:=m.DateR;
  ds.FieldByName('ONA_IDENTIF').AsString:=m.LichNomer;
  WriteAdres(ds,m.AdresR,1,'ONA_M_');
  WriteAdres(ds,m.AdresG,2,'ONA_');
  if m.Nation>0  then ds.FieldByName('ONA_NATION').AsInteger:=m.Nation;
  if m.Citizen>0 then ds.FieldByName('ONA_GRAG').AsInteger:=m.Citizen;
  ds.FieldByName('ONA_OBRAZ').AsString:=m.Obraz;
  ds.FieldByName('ONA_WORK').AsString:=m.Work;
  ds.FieldByName('ONA_DOKUMENT').AsString:=m.Dok.full;

  LoadOne_WriteSvid(ds, node.FindNode('cert'));

  nd:=node.FindNode('decl');
  if nd<>nil then begin
    ds.FieldByName('DECL').AsString:=CheckStrR(nd.ReadAttributeString('fio',''));
    s:=CheckStrR(nd.ReadAttributeString('adres',''));  //
    if s<>''
      then ds.FieldByName('DECL').AsString:=ds.FieldByName('DECL').AsString+#13#10+s;
    nd1:=nd.FindNode('doc');        //
    if nd1<>nil then begin
      dok:=ReadDok(nd1);
      if dok.full<>''
        then ds.FieldByName('DECL').AsString:=ds.FieldByName('DECL').AsString+#13#10+s;
    end;
  end;
  if FTest then begin
    ds.Cancel;
  end else begin
    ds.Post;
    nID:=ds.FieldByName('ID').AsInteger;  // !!!  определим nID  !!!
    LoadOne_Add(ds, node.FindNode('add'), 'OTMETKA', nID, nType);
    nd:=node.FindNode('repeat_cert');
    if nd<>nil
      then LoadSvidPovtor(nType, nID, nd);
    if FLastError<>'' then FLoadError:=FLoadError+FLastError+', ';
  end;
  if cbError.Checked and (FLoadError<>'') then begin
    AddProtokol(ds.FieldByName('NOMER').AsString+') '+Copy(FLoadError,1,Length(FLoadError)-2));
  end;
  lbCountAll.Caption:=IntToStr(FCountAll);
  lbCount.Caption:=IntToStr(FCount);
  Application.ProcessMessages
end;
//------------------------------------------------------------------------
function TfmLoadZagsMinsk.LoadOne_ZUstOtc(node:TXMLNode):Boolean;
var
  m:TMenZ;
  adrsm:TAdresZ;
  dok:TDokZ;
  d:TDateTime;
  nd,nd1:TXMLNode;
  n,nType,nID:Integer;
  s,ss,sResh,sOnaObr,sOnaWork:String;
  ds:TDataSet;
  rec_date:TgetDate;
begin
  Result:=true;
  FLoadError:='';
  FCount:=FCount+1;
  FCountAll:=FCountAll+1;
  nType:=_TypeObj_ZUstOtc;
  ds:=dmBase.tbZapisUstOtc;
  ds.Append;
  LoadOne_Header(ds, node);
  sResh:='';
  ds.FieldByName('OSNOV').AsString:=node.ReadAttributeString('type','1');
  if ds.FieldByName('OSNOV').AsString='1' then begin  // совместное заявление
      d:=ReadDate(node.ReadAttributeString('date',''),''); if d>0 then ds.FieldByName('DateDecl').AsDateTime:=d;
  end else begin    // решение суда
    nd:=node.FindNode('resh_sud');
    if nd<>nil then begin  //  date num org dates
      d:=ReadDate(nd.ReadAttributeString('date',''),'resh_sud'); if d>0 then ds.FieldByName('DateDecl').AsDateTime:=d;
      d:=ReadDate(nd.ReadAttributeString('dates',''),'resh_sud'); if d>0 then ds.FieldByName('Date_Vst').AsDateTime:=d;
      sResh:=CheckStrR(nd.ReadAttributeString('org',''));   //  !!! см. ниже запись в базу свойств !!!
    end;
  end;
  //===== child =======================
  m:=ReadMen(node.FindNode('child_before'),'');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('FAMILIADO').AsString:=m.Fam;
  ds.FieldByName('NAMEDO').AsString:=m.Name;
  ds.FieldByName('OTCHDO').AsString:=m.Otch;
  ds.FieldByName('FAMILIADO_B').AsString:=m.FamB;
  ds.FieldByName('NAMEDO_B').AsString:=m.NameB;
  ds.FieldByName('OTCHDO_B').AsString:=m.OtchB;
  if m.DateR>0 then ds.FieldByName('DATER').AsDateTime:=m.DateR;
  ds.FieldByName('POL').AsString:=m.Pol;
  ds.FieldByName('IDENTIF').AsString:=m.LichNomer;
  WriteAdres(ds,m.AdresR,1,'');
  //-----------------
  m:=ReadMen(node.FindNode('child_after'),'');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('FAMILIAPOSLE').AsString:=m.Fam;
  ds.FieldByName('NAMEPOSLE').AsString:=m.Name;
  ds.FieldByName('OTCHPOSLE').AsString:=m.Otch;
  ds.FieldByName('FAMILIAPOSLE_B').AsString:=m.FamB;
  ds.FieldByName('NAMEPOSLE_B').AsString:=m.NameB;
  ds.FieldByName('OTCHPOSLE_B').AsString:=m.OtchB;
  //===== father =======================
  m:=ReadMen(node.FindNode('father'),'М');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('ON_FAMILIA').AsString:=m.Fam;
  ds.FieldByName('ON_NAME').AsString:=m.Name;
  ds.FieldByName('ON_OTCH').AsString:=m.Otch;
  ds.FieldByName('ON_FAMILIA_B').AsString:=m.FamB;
  ds.FieldByName('ON_NAME_B').AsString:=m.NameB;
  ds.FieldByName('ON_OTCH_B').AsString:=m.OtchB;
  if m.DateR>0 then ds.FieldByName('ON_DATER').AsDateTime:=m.DateR;
  ds.FieldByName('ON_IDENTIF').AsString:=m.LichNomer;
  WriteAdres(ds,m.AdresR,1,'ON_M_');
  WriteAdres(ds,m.AdresG,2,'ON_');
  if m.Nation>0  then ds.FieldByName('ON_NATION').AsInteger:=m.Nation;
  if m.Citizen>0 then ds.FieldByName('ON_GRAG').AsInteger:=m.Citizen;
  ds.FieldByName('ON_OBRAZ').AsString:=m.Obraz;
  ds.FieldByName('ON_WORK').AsString:=m.Work;
  ds.FieldByName('ON_DOKUMENT').AsString:=m.Dok.full;
  //===== mother =======================
  m:=ReadMen(node.FindNode('mother'),'Ж');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('ONA_FAMILIA').AsString:=m.Fam;
  ds.FieldByName('ONA_NAME').AsString:=m.Name;
  ds.FieldByName('ONA_OTCH').AsString:=m.Otch;
  ds.FieldByName('ONA_FAMILIA_B').AsString:=m.FamB;
  ds.FieldByName('ONA_NAME_B').AsString:=m.NameB;
  ds.FieldByName('ONA_OTCH_B').AsString:=m.OtchB;
  if m.DateR>0 then ds.FieldByName('ONA_DATER').AsDateTime:=m.DateR;
  ds.FieldByName('ONA_IDENTIF').AsString:=m.LichNomer;
  WriteAdres(ds,m.AdresR,1,'ONA_M_');
  WriteAdres(ds,m.AdresG,2,'ONA_');
  if m.Nation>0  then ds.FieldByName('ONA_NATION').AsInteger:=m.Nation;
  if m.Citizen>0 then ds.FieldByName('ONA_GRAG').AsInteger:=m.Citizen;
  {  !!! см. ниже запись в базу свойств !!!
  ds.FieldByName('ONA_OBRAZ').AsString:=;
  ds.FieldByName('ONA_WORK').AsString:=m.Work;
  }
  sOnaObr:=m.Obraz;
  sOnaWork:=m.Work;
  ds.FieldByName('ONA_DOKUMENT').AsString:=m.Dok.full;

{    SetAddProperty(16, 'RESHSUD', '', ftMemo);
  SetAddProperty(19, 'ONA_WORK', '', ftMemo);   // ОНА место работы
  SetAddProperty(20, 'ONA_OBRAZ', '', ftInteger);   // ОНА образование  }

  LoadOne_WriteSvid(ds, node.FindNode('cert'));

  if FTest then begin
    ds.Cancel;
  end else begin
    ds.Post;
    nID:=ds.FieldByName('ID').AsInteger;  // !!!  определим nID  !!!
    LoadOne_Add(ds, node.FindNode('add'), 'ZAMETKA', nID, nType);
    if sOnaObr<>''
      then dmBase.WritePropSimpleDok(nType, nID, STOD('1899-12-30',tdAds), 'ONA_OBRAZ', nil, sOnaObr, ftInteger);
    if sOnaWork<>''
      then dmBase.WritePropSimpleDok(nType, nID, STOD('1899-12-30',tdAds), 'ONA_WORK', nil, sOnaWork, ftMemo);
    if sResh<>''
      then dmBase.WritePropSimpleDok(nType, nID, STOD('1899-12-30',tdAds), 'RESHSUD', nil, sResh, ftMemo);
        
    nd:=node.FindNode('repeat_cert');          
    if nd<>nil
      then LoadSvidPovtor(nType, nID, nd);
    if FLastError<>'' then FLoadError:=FLoadError+FLastError+', ';
  end;
  if cbError.Checked and (FLoadError<>'') then begin
    AddProtokol(ds.FieldByName('NOMER').AsString+') '+Copy(FLoadError,1,Length(FLoadError)-2));
  end;
  lbCountAll.Caption:=IntToStr(FCountAll);
  lbCount.Caption:=IntToStr(FCount);
  Application.ProcessMessages
end;

//------------------------------------------------------------------------
function TfmLoadZagsMinsk.LoadOne_ZBrak(node:TXMLNode):Boolean;
var
  m:TMenZ;
  adrsm:TAdresZ;
  dok:TDokZ;
  d:TDateTime;
  nd,nd1:TXMLNode;
  n,nType,nID:Integer;
  s,ss,sResh,sOnaObr,sOnaWork:String;
  ds:TDataSet;
  rec_date:TgetDate;
begin
  Result:=true;
  FLoadError:='';
  FCount:=FCount+1;
  FCountAll:=FCountAll+1;
  nType:=_TypeObj_ZBrak;
  ds:=dmBase.tbZapisBrak;
  ds.Append;
  LoadOne_Header(ds, node);

  ds.FieldByName('ON_FAMILIAP').AsString:=CheckStrR(node.ReadAttributeString('on_famp',''));
  ds.FieldByName('ON_FAMILIAP_B').AsString:=CheckStrR(node.ReadAttributeString('on_famp_b',''));
  ds.FieldByName('ONA_FAMILIAP').AsString:=CheckStrR(node.ReadAttributeString('ona_famp',''));
  ds.FieldByName('ONA_FAMILIAP_B').AsString:=CheckStrR(node.ReadAttributeString('ona_famp_b',''));
  ds.FieldByName('ON_SVID').AsString:=CheckStrR(node.ReadAttributeString('on_svid',''));
  ds.FieldByName('ONA_SVID').AsString:=CheckStrR(node.ReadAttributeString('ona_svid',''));

  //===== ON =======================
  m:=ReadMen(node.FindNode('on'),'М');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('ON_FAMILIA').AsString:=m.Fam;
  ds.FieldByName('ON_NAME').AsString:=m.Name;
  ds.FieldByName('ON_OTCH').AsString:=m.Otch;
  ds.FieldByName('ON_FAMILIA_B').AsString:=m.FamB;
  ds.FieldByName('ON_NAME_B').AsString:=m.NameB;
  ds.FieldByName('ON_OTCH_B').AsString:=m.OtchB;
  if m.DateR>0 then ds.FieldByName('ON_DATER').AsDateTime:=m.DateR;
  ds.FieldByName('ON_IDENTIF').AsString:=m.LichNomer;
  WriteAdres(ds,m.AdresR,1,'ON_');
  WriteAdres(ds,m.AdresG,2,'ON_M_');
  if m.Nation>0  then ds.FieldByName('ON_NATION').AsInteger:=m.Nation;
  if m.Citizen>0 then ds.FieldByName('ON_GRAG').AsInteger:=m.Citizen;
  ds.FieldByName('ON_OBRAZ').AsString:=m.Obraz;
  ds.FieldByName('ON_WORK').AsString:=m.Work;
  ds.FieldByName('ON_SEM').AsString:=m.Sem;
  ds.FieldByName('ON_DOKUMENT').AsString:=m.Dok.full;
  //===== ONA =======================
  m:=ReadMen(node.FindNode('ona'),'Ж');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('ONA_FAMILIA').AsString:=m.Fam;
  ds.FieldByName('ONA_NAME').AsString:=m.Name;
  ds.FieldByName('ONA_OTCH').AsString:=m.Otch;
  ds.FieldByName('ONA_FAMILIA_B').AsString:=m.FamB;
  ds.FieldByName('ONA_NAME_B').AsString:=m.NameB;
  ds.FieldByName('ONA_OTCH_B').AsString:=m.OtchB;
  if m.DateR>0 then ds.FieldByName('ONA_DATER').AsDateTime:=m.DateR;
  ds.FieldByName('ONA_IDENTIF').AsString:=m.LichNomer;
  WriteAdres(ds,m.AdresR,1,'ONA_');
  WriteAdres(ds,m.AdresG,2,'ONA_M_');
  if m.Nation>0  then ds.FieldByName('ONA_NATION').AsInteger:=m.Nation;
  if m.Citizen>0 then ds.FieldByName('ONA_GRAG').AsInteger:=m.Citizen;
  ds.FieldByName('ONA_OBRAZ').AsString:=m.Obraz;
  ds.FieldByName('ONA_WORK').AsString:=m.Work;
  ds.FieldByName('ONA_SEM').AsString:=m.Sem;
  ds.FieldByName('ONA_DOKUMENT').AsString:=m.Dok.full;

  ds.FieldByName('DETI').AsString:=LoadChildren(nType, nID, node.FindNode('children'), n);
  ds.FieldByName('DETI_COUNT').AsInteger:=n;

  LoadOne_WriteSvid(ds, node.FindNode('cert'));

  if FTest then begin
    ds.Cancel;
  end else begin
    ds.Post;
    nID:=ds.FieldByName('ID').AsInteger;  // !!!  определим nID  !!!
    LoadOne_Add(ds, node.FindNode('add'), 'OTMETKA', nID, nType);
    nd:=node.FindNode('repeat_cert');
    if nd<>nil
      then LoadSvidPovtor(nType, nID, nd);
    if FLastError<>'' then FLoadError:=FLoadError+FLastError+', ';
  end;
  if cbError.Checked and (FLoadError<>'') then begin
    AddProtokol(ds.FieldByName('NOMER').AsString+') '+Copy(FLoadError,1,Length(FLoadError)-2));
  end;
  lbCountAll.Caption:=IntToStr(FCountAll);
  lbCount.Caption:=IntToStr(FCount);
  Application.ProcessMessages
end;

//------------------------------------------------------------------------
function TfmLoadZagsMinsk.LoadOne_ZRast(node:TXMLNode):Boolean;
var
  m:TMenZ;
  adrsm:TAdresZ;
  dok:TDokZ;
  d:TDateTime;
  nd,nd1:TXMLNode;
  n,nType,nID:Integer;
  s,ss,sResh,sOnaObr,sOnaWork:String;
  ds:TDataSet;
  rec_date:TgetDate;
begin
  Result:=true;
  FLoadError:='';
  FCount:=FCount+1;
  FCountAll:=FCountAll+1;
  nType:=_TypeObj_ZRast;
  ds:=dmBase.tbZapisRast;
  ds.Append;
  LoadOne_Header(ds, node);

  ds.FieldByName('ON_FAMILIAP').AsString:=CheckStrR(node.ReadAttributeString('on_famp',''));
  ds.FieldByName('ON_FAMILIAP_B').AsString:=CheckStrR(node.ReadAttributeString('on_famp_b',''));
  ds.FieldByName('ONA_FAMILIAP').AsString:=CheckStrR(node.ReadAttributeString('ona_famp',''));
  ds.FieldByName('ONA_FAMILIAP_B').AsString:=CheckStrR(node.ReadAttributeString('ona_famp_b',''));
  s:=CheckStrR(node.ReadAttributeString('type','2'));
  if s='2' then begin
{  <resh_sud date="1995-09-07" num="" org="ФРУНЗЕНСКОГО района г. МИHСК pеспублики БЕЛАРУСЬ" dates="" /> }
{[KEY_TYPE_RAST]
0=Решение суда о раст. брака
1=По взаимному согласию  }
    ds.FieldByName('TYPE_RAST').AsString:='0';
    nd:=node.FindNode('resh_sud');
    if nd<>nil then begin
      ds.FieldByName('SUD_NAME').AsString:=CheckStrR(nd.ReadAttributeString('org',''));
      d:=ReadDate(nd.ReadAttributeString('date',''),'resh_sud'); if d>0 then ds.FieldByName('SUD_DATE').AsDateTime:=d;
    end;
  end else begin
    ds.FieldByName('TYPE_RAST').AsString:='1';
  end;
{  <act_marriage date="1987-06-26" num="1070" org="ФРУНЗЕНСКОМ О/ЗАГС Г.МИНСКА" /> }
  nd:=node.FindNode('act_marriage');
  if nd<>nil then begin
    ds.FieldByName('BRAK_ZAKL').AsString:=CheckStrR(nd.ReadAttributeString('org',''));
    ds.FieldByName('BRAK_NOMER').AsString:=CheckStrR(nd.ReadAttributeString('num',''));
    d:=ReadDate(nd.ReadAttributeString('date',''),'act_marriage'); if d>0 then ds.FieldByName('BRAK_DATE').AsDateTime:=d;
  end;

  //===== ON =======================
  m:=ReadMen(node.FindNode('on'),'М');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('ON_FAMILIA').AsString:=m.Fam;
  ds.FieldByName('ON_NAME').AsString:=m.Name;
  ds.FieldByName('ON_OTCH').AsString:=m.Otch;
  ds.FieldByName('ON_FAMILIA_B').AsString:=m.FamB;
  ds.FieldByName('ON_NAME_B').AsString:=m.NameB;
  ds.FieldByName('ON_OTCH_B').AsString:=m.OtchB;
  if m.DateR>0 then ds.FieldByName('ON_DATER').AsDateTime:=m.DateR;
  ds.FieldByName('ON_IDENTIF').AsString:=m.LichNomer;
  WriteAdres(ds,m.AdresR,1,'ON_');
  WriteAdres(ds,m.AdresG,2,'ON_M_');
  if m.Nation>0  then ds.FieldByName('ON_NATION').AsInteger:=m.Nation;
  if m.Citizen>0 then ds.FieldByName('ON_GRAG').AsInteger:=m.Citizen;
  ds.FieldByName('ON_OBRAZ').AsString:=m.Obraz;
  ds.FieldByName('ON_WORK').AsString:=m.Work;
  ds.FieldByName('ON_SEM').AsString:=m.Sem;
  ds.FieldByName('ON_DOKUMENT').AsString:=m.Dok.full;
  //===== ONA =======================
  m:=ReadMen(node.FindNode('ona'),'Ж');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('ONA_FAMILIA').AsString:=m.Fam;
  ds.FieldByName('ONA_NAME').AsString:=m.Name;
  ds.FieldByName('ONA_OTCH').AsString:=m.Otch;
  ds.FieldByName('ONA_FAMILIA_B').AsString:=m.FamB;
  ds.FieldByName('ONA_NAME_B').AsString:=m.NameB;
  ds.FieldByName('ONA_OTCH_B').AsString:=m.OtchB;
  if m.DateR>0 then ds.FieldByName('ONA_DATER').AsDateTime:=m.DateR;
  ds.FieldByName('ONA_IDENTIF').AsString:=m.LichNomer;
  WriteAdres(ds,m.AdresR,1,'ONA_');
  WriteAdres(ds,m.AdresG,2,'ONA_M_');
  if m.Nation>0  then ds.FieldByName('ONA_NATION').AsInteger:=m.Nation;
  if m.Citizen>0 then ds.FieldByName('ONA_GRAG').AsInteger:=m.Citizen;
  ds.FieldByName('ONA_OBRAZ').AsString:=m.Obraz;
  ds.FieldByName('ONA_WORK').AsString:=m.Work;
  ds.FieldByName('ONA_SEM').AsString:=m.Sem;
  ds.FieldByName('ONA_DOKUMENT').AsString:=m.Dok.full;

  ds.FieldByName('DETI').AsString:=LoadChildren(nType, nID, node.FindNode('children'), n);
  ds.FieldByName('DETI_COUNT').AsInteger:=n;

  LoadOne_WriteSvid(ds, node.FindNode('on_cert'), 'ON_');
  LoadOne_WriteSvid(ds, node.FindNode('ona_cert'), 'ONA_');

  if FTest then begin
    ds.Cancel;
  end else begin
    ds.Post;
    nID:=ds.FieldByName('ID').AsInteger;  // !!!  определим nID  !!!
    LoadOne_Add(ds, node.FindNode('add'), 'OTMETKA', nID, nType);
    nd:=node.FindNode('repeat_cert');
    if nd<>nil
      then LoadSvidPovtor(nType, nID, nd);
    if FLastError<>'' then FLoadError:=FLoadError+FLastError+', ';
  end;
  if cbError.Checked and (FLoadError<>'') then begin
    AddProtokol(ds.FieldByName('NOMER').AsString+') '+Copy(FLoadError,1,Length(FLoadError)-2));
  end;
  lbCountAll.Caption:=IntToStr(FCountAll);
  lbCount.Caption:=IntToStr(FCount);
  Application.ProcessMessages
end;

//---------------------------------------------------
function TfmLoadZagsMinsk.LoadOne_ZChName(node:TXMLNode):Boolean;
var
  m:TMenZ;
  adrsm:TAdresZ;
  dok:TDokZ;
  d:TDateTime;
  nd,nd1:TXMLNode;
  n,nType,nID:Integer;
  s,ss:String;
  ds:TDataSet;
  rec_date:TgetDate;
begin                 
  Result:=true;
  FLoadError:='';
  FCount:=FCount+1;
  FCountAll:=FCountAll+1;
  nType:=_TypeObj_ZChName;
  ds:=dmBase.tbZapisChName;
  ds.Append;

  LoadOne_Header(ds, node);
  ds.FieldByName('OSNOV').AsString:=CheckStrR(node.ReadAttributeString('record_basis',''));
{  <act_birth date="1979-05-15" num="872" org="ПАРТИЗАНСКИЙ О/ЗАГС Г.МИНСКА" />  }
  nd:=node.FindNode('act_birth');
  if nd<>nil then begin
    d:=ReadDate(nd.ReadAttributeString('date',''),'act_birth'); if d>0 then ds.FieldByName('REG_DATE').AsDateTime:=d;
    ds.FieldByName('REG_NOMER').AsString:=nd.ReadAttributeString('num','');
    ds.FieldByName('REG_ZAGS').AsString:=CheckStrR(nd.ReadAttributeString('org',''));
  end;

  m:=ReadMen(node.FindNode('men_before'),'');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('FAMILIADO').AsString:=m.Fam;
  ds.FieldByName('NAMEDO').AsString:=m.Name;
  ds.FieldByName('OTCHDO').AsString:=m.Otch;
  ds.FieldByName('FAMILIADO_B').AsString:=m.FamB;
  ds.FieldByName('NAMEDO_B').AsString:=m.NameB;
  ds.FieldByName('OTCHDO_B').AsString:=m.OtchB;
  ds.FieldByName('POL').AsString:=m.Pol;
  ds.FieldByName('GRAG').AsInteger:=m.Citizen;
  ds.FieldByName('IDENTIF').AsString:=m.LichNomer;
  if m.Nation>0  then ds.FieldByName('NATION').AsInteger:=m.Nation;
  if m.DateR>0 then ds.FieldByName('DATER').AsDateTime:=m.DateR;
//  if m.Citizen>0 then ds.FieldByName('ONA_GRAG').AsInteger:=m.Citizen;
  ds.FieldByName('SEM').AsString:=m.Sem;
//  ds.FieldByName('OBRAZ').AsString:=m.Obraz;
//  ds.FieldByName('WORK_NAME').AsString:=m.Work;
  ds.FieldByName('DOKUMENT').AsString:=m.Dok.full;
  WriteAdres(ds,m.AdresR,1,'');
  WriteAdres(ds,m.AdresG,3,'M_');

  m:=ReadMen(node.FindNode('men_after'),'');
  ds.FieldByName('FAMILIAPOSLE').AsString:=m.Fam;
  ds.FieldByName('NAMEPOSLE').AsString:=m.Name;
  ds.FieldByName('OTCHPOSLE').AsString:=m.Otch;
  ds.FieldByName('FAMILIAPOSLE_B').AsString:=m.FamB;
  ds.FieldByName('NAMEPOSLE_B').AsString:=m.NameB;
  ds.FieldByName('OTCHPOSLE_B').AsString:=m.OtchB;

  ds.FieldByName('DETI').AsString:=LoadChildren2(nType, nID, node.FindNode('children'), n);

  LoadOne_WriteSvid(ds, node.FindNode('cert'), '');

  if FTest then begin
    ds.Cancel;
  end else begin
    ds.Post;
    nID:=ds.FieldByName('ID').AsInteger;  // !!!  определим nID  !!!
    LoadOne_Add(ds, node.FindNode('add'), 'OTMETKA', nID, nType);
    nd:=node.FindNode('repeat_cert');
    if nd<>nil
      then LoadSvidPovtor(nType, nID, nd);
    if FLastError<>'' then FLoadError:=FLoadError+FLastError+', ';
  end;
  if cbError.Checked and (FLoadError<>'') then begin
    AddProtokol(ds.FieldByName('NOMER').AsString+') '+Copy(FLoadError,1,Length(FLoadError)-2));
  end;
  lbCountAll.Caption:=IntToStr(FCountAll);
  lbCount.Caption:=IntToStr(FCount);
  Application.ProcessMessages
end;
//----------------------------------------------------------------------------
function TfmLoadZagsMinsk.LoadOne_ZAdopt(node:TXMLNode):Boolean;
var
  m:TMenZ;
  adrsm:TAdresZ;
  dok:TDokZ;
  d:TDateTime;
  nd,nd1:TXMLNode;
  n,nType,nID:Integer;
  sOtm,s,ss,sResh,sOnaObr,sOnaWork:String;
  ds:TDataSet;
  rec_date:TgetDate;
  lBrakM:Boolean;
begin
  Result:=true;
  FLoadError:='';
  FCount:=FCount+1;
  FCountAll:=FCountAll+1;
  nType:=_TypeObj_ZAdopt;
  ds:=dmBase.tbZapisAdopt;
  ds.Append;
  LoadOne_Header(ds, node);

  s:=CheckStrR(node.ReadAttributeString('is_parents','1'));
  if s='1'
    then ds.FieldByName('ISRODIT').AsString:='1'
    else ds.FieldByName('ISRODIT').AsString:='0';
  sOtm:='';
  nd:=node.FindNode('resh_sud');
  if nd<>nil then begin
{  <resh_sud date="" num="" org="суда ОКТЯБРЬСКОГО p-на  г.МИНСКА от29 12 2005Г.                    вступившего в"
    dates="Удочерение зарегистрировано по заявлению удочерительницы ОТ 14 01 2006Г." />  }
    ds.FieldByName('SUD_NAME').AsString:=CheckStrR(nd.ReadAttributeString('org',''));
    d:=ReadDate(CheckStrR(nd.ReadAttributeString('date','')),'resh_sud.date');  if d>0 then ds.FieldByName('SUD_DATE').AsDateTime:=d;
    s:=CheckStrR(nd.ReadAttributeString('dates',''));
    d:=ReadDate(s,'resh_sud.dates'); if d>0 then ds.FieldByName('SUD_DATEV').AsDateTime:=d;
    if FLastError<>'' then begin
//      FLoadError:=FLoadError+FLastError+', ';
      sOtm:=s;  // !!!
    end;
  end;

{ <act_birth_before date="2010-03-23" num="1065" org="" />
  <act_birth_after date="2011-03-23" num="1065" org="" />   }
  nd:=node.FindNode('act_birth_before');
  if nd<>nil then begin
    ds.FieldByName('REG_MESTO_DO').AsString:=CheckStrR(nd.ReadAttributeString('org',''));
    ds.FieldByName('REG_NOMER_DO').AsString:=CheckStrR(nd.ReadAttributeString('num',''));
    d:=ReadDate(CheckStrR(nd.ReadAttributeString('date','')),'act_birth_before'); if d>0 then ds.FieldByName('REG_DATE_DO').AsDateTime:=d;
    if FLastError<>'' then FLoadError:=FLoadError+FLastError+', ';
  end;
  nd:=node.FindNode('act_birth_after');
  if nd<>nil then begin
    ds.FieldByName('REG_MESTO_POSLE').AsString:=CheckStrR(nd.ReadAttributeString('org',''));
    ds.FieldByName('REG_NOMER_POSLE').AsString:=CheckStrR(nd.ReadAttributeString('num',''));
    d:=ReadDate(CheckStrR(nd.ReadAttributeString('date','')),'act_birth_after'); if d>0 then ds.FieldByName('REG_DATE_POSLE').AsDateTime:=d;
    if FLastError<>'' then FLoadError:=FLoadError+FLastError+', ';
  end;
  nd:=node.FindNode('act_adopt');  // брак между усыновителем и родителем
  if nd<>nil then begin
    if (nd.ReadAttributeString('num','')<>'') and (nd.ReadAttributeString('num','')<>'0') then begin
//      lbadopt.Caption:=InttoStr(StrToIntDef(lbadopt.Caption,0)+1);
      lBrakM:=false;
    end else begin
      nd:=nil;
    end;
  end;
  if nd=nil then begin
    nd:=node.FindNode('act_parents');  // брак между усыновителями
    if (nd<>nil) and (nd.ReadAttributeString('num','')<>'') and (nd.ReadAttributeString('num','')<>'0') then begin
//      lbparents.Caption:=InttoStr(StrToIntDef(lbparents.Caption,0)+1);
      lBrakM:=true;
//      AddProtokol('parents ->'+ds.FieldByName('NOMER').AsString+') '+nd.ReadAttributeString('num',''));
    end;
  end;
  if nd<>nil then begin
    ds.FieldByName('BRAK_M').AsBoolean:=lBrakM;
    ds.FieldByName('BRAK_NAME').AsString:=CheckStrR(nd.ReadAttributeString('org',''));
    ds.FieldByName('BRAK_NOMER').AsString:=CheckStrR(nd.ReadAttributeString('num',''));
    d:=ReadDate(CheckStrR(nd.ReadAttributeString('date','')),'act_adopt'); if d>0 then ds.FieldByName('BRAK_DATE').AsDateTime:=d;
    if FLastError<>'' then FLoadError:=FLoadError+FLastError+', ';
  end;
{  nd:=node.FindNode('act_notice');   // запись акта
  if nd<>nil then begin
    ds.FieldByName('REG_MESTO_POSLE').AsString:=CheckStrR(nd.ReadAttributeString('org',''));
    ds.FieldByName('REG_NOMER_POSLE').AsString:=CheckStrR(nd.ReadAttributeString('num',''));
    d:=ReadDate(nd.ReadAttributeString('date',''),'act_birth_after'); if d>0 then ds.FieldByName('REG_DATE_POSLE').AsDateTime:=d;
  end;}

  //===== ребенок до усыновления =======================
  m:=ReadMen(node.FindNode('child_before'),'');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('FAMILIADO').AsString:=m.Fam;
  ds.FieldByName('NAMEDO').AsString:=m.Name;
  ds.FieldByName('OTCHDO').AsString:=m.Otch;
  ds.FieldByName('FAMILIADO_B').AsString:=m.FamB;
  ds.FieldByName('NAMEDO_B').AsString:=m.NameB;
  ds.FieldByName('OTCHDO_B').AsString:=m.OtchB;
  if m.DateR>0 then ds.FieldByName('DATER_DO').AsDateTime:=m.DateR;
  ds.FieldByName('POL').AsString:=m.Pol;
  ds.FieldByName('IDENTIF_DO').AsString:=m.LichNomer;
  WriteAdres(ds,m.AdresR,1,'-_DO');
  //===== ребенок после усыновления =======================
  m:=ReadMen(node.FindNode('child_after'),'');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('FAMILIAPOSLE').AsString:=m.Fam;
  ds.FieldByName('NAMEPOSLE').AsString:=m.Name;
  ds.FieldByName('OTCHPOSLE').AsString:=m.Otch;
  ds.FieldByName('FAMILIAPOSLE_B').AsString:=m.FamB;
  ds.FieldByName('NAMEPOSLE_B').AsString:=m.NameB;
  ds.FieldByName('OTCHPOSLE_B').AsString:=m.OtchB;
  if m.DateR>0 then ds.FieldByName('DATER_POSLE').AsDateTime:=m.DateR;
  if m.LichNomer=''
    then ds.FieldByName('IDENTIF_POSLE').AsString:=ds.FieldByName('IDENTIF_DO').AsString
    else ds.FieldByName('IDENTIF_POSLE').AsString:=m.LichNomer;
  WriteAdres(ds,m.AdresR,1,'-_POSLE');
  //===== ОТЕЦ =======================
  m:=ReadMen(node.FindNode('father'),'М');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('OTEC_FAMILIA').AsString:=m.Fam;
  ds.FieldByName('OTEC_NAME').AsString:=m.Name;
  ds.FieldByName('OTEC_OTCH').AsString:=m.Otch;
  if m.DateR>0 then ds.FieldByName('OTEC_DATER').AsDateTime:=m.DateR;
  ds.FieldByName('OTEC_IDENTIF').AsString:=m.LichNomer;
  WriteAdres(ds,m.AdresR,1,'OTEC_M_');
  WriteAdres(ds,m.AdresG,3,'OTEC_');
  if m.Nation>0  then ds.FieldByName('OTEC_NATION').AsInteger:=m.Nation;
  if m.Citizen>0 then ds.FieldByName('OTEC_GRAG').AsInteger:=m.Citizen;
  //===== МАТЬ =======================
  m:=ReadMen(node.FindNode('mother'),'Ж');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('MAT_FAMILIA').AsString:=m.Fam;
  ds.FieldByName('MAT_NAME').AsString:=m.Name;
  ds.FieldByName('MAT_OTCH').AsString:=m.Otch;
  if m.DateR>0 then ds.FieldByName('MAT_DATER').AsDateTime:=m.DateR;
  ds.FieldByName('MAT_IDENTIF').AsString:=m.LichNomer;
  WriteAdres(ds,m.AdresR,1,'MAT_M_');
  WriteAdres(ds,m.AdresG,3,'MAT_');
  if m.Nation>0  then ds.FieldByName('MAT_NATION').AsInteger:=m.Nation;
  if m.Citizen>0 then ds.FieldByName('MAT_GRAG').AsInteger:=m.Citizen;
  //===== УСЫНОВИТЕЛЬ =======================
  m:=ReadMen(node.FindNode('adopt_father'),'М');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('ON_FAMILIA').AsString:=m.Fam;
  ds.FieldByName('ON_NAME').AsString:=m.Name;
  ds.FieldByName('ON_OTCH').AsString:=m.Otch;
  ds.FieldByName('ON_FAMILIA_B').AsString:=m.FamB;
  ds.FieldByName('ON_NAME_B').AsString:=m.NameB;
  ds.FieldByName('ON_OTCH_B').AsString:=m.OtchB;
  if m.DateR>0 then ds.FieldByName('ON_DATER').AsDateTime:=m.DateR;
  ds.FieldByName('ON_IDENTIF').AsString:=m.LichNomer;
  WriteAdres(ds,m.AdresR,1,'ON_M_');
  WriteAdres(ds,m.AdresG,3,'ON_');
  if m.Nation>0  then ds.FieldByName('ON_NATION').AsInteger:=m.Nation;
  if m.Citizen>0 then ds.FieldByName('ON_GRAG').AsInteger:=m.Citizen;
  ds.FieldByName('ON_OBRAZ').AsString:=m.Obraz;
  ds.FieldByName('ON_WORK').AsString:=m.Work;
  //===== УСЫНОВИТЕЛЬНИЦА =======================
  m:=ReadMen(node.FindNode('adopt_mother'),'Ж');
  if m.Error<>'' then FLoadError:=FLoadError+m.Error+', ';
  ds.FieldByName('ONA_FAMILIA').AsString:=m.Fam;
  ds.FieldByName('ONA_NAME').AsString:=m.Name;
  ds.FieldByName('ONA_OTCH').AsString:=m.Otch;
  ds.FieldByName('ONA_FAMILIA_B').AsString:=m.FamB;
  ds.FieldByName('ONA_NAME_B').AsString:=m.NameB;
  ds.FieldByName('ONA_OTCH_B').AsString:=m.OtchB;
  if m.DateR>0 then ds.FieldByName('ONA_DATER').AsDateTime:=m.DateR;
  ds.FieldByName('ONA_IDENTIF').AsString:=m.LichNomer;
  WriteAdres(ds,m.AdresR,1,'ONA_M_');
  WriteAdres(ds,m.AdresG,3,'ONA_');
  if m.Nation>0  then ds.FieldByName('ONA_NATION').AsInteger:=m.Nation;
  if m.Citizen>0 then ds.FieldByName('ONA_GRAG').AsInteger:=m.Citizen;
  ds.FieldByName('ONA_OBRAZ').AsString:=m.Obraz;
  ds.FieldByName('ONA_WORK').AsString:=m.Work;

  LoadOne_WriteSvid(ds, node.FindNode('cert'), '');

  if FTest then begin
    ds.Cancel;
  end else begin
    ds.Post;
    nID:=ds.FieldByName('ID').AsInteger;  // !!!  определим nID  !!!
    LoadOne_Add(ds, node.FindNode('add'), 'OTMETKA', nID, nType);
    // допишем в отметки
    EditDataSet(ds);
    if sOtm<>'' then
      if ds.FieldByName('OTMETKA').AsString=''
        then ds.FieldByName('OTMETKA').AsString:=sOtm
        else ds.FieldByName('OTMETKA').AsString:=ds.FieldByName('OTMETKA').AsString+#13#10+sOtm;
    PostDataSet(ds);

    nd:=node.FindNode('repeat_cert');
    if nd<>nil
      then LoadSvidPovtor(nType, nID, nd);
    if FLastError<>'' then FLoadError:=FLoadError+FLastError+', ';
  end;
  if cbError.Checked and (FLoadError<>'') then begin
    AddProtokol(ds.FieldByName('NOMER').AsString+') '+Copy(FLoadError,1,Length(FLoadError)-2));
  end;
  lbCountAll.Caption:=IntToStr(FCountAll);
  lbCount.Caption:=IntToStr(FCount);
  Application.ProcessMessages
end;


end.
