unit fMainGetATE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  FuncPr, DB, adsdata, adsfunc, adstable, StdCtrls, Mask, DBCtrlsEh, mClassif,
  adscnnct, Grids, DBGridEh, ComCtrls, ExtCtrls, iniFiles, InvokeRegistry,
  Rio, SOAPHTTPTrans, SOAPHTTPClient, ZipForge,uUtilFiles,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP;

type
  TfmMainGetATE = class(TForm)
    pnLoad: TPanel;
    Grid: TDBGridEh;
    AdsConnection: TAdsConnection;
    Panel2: TPanel;
    Label1: TLabel;
    edURL: TDBEditEh;
    Label2: TLabel;
    edProxy: TDBEditEh;
    btLoad: TButton;
    btClear: TButton;
    ate: TAdsTable;
    DataSource: TDataSource;
    Label3: TLabel;
    edOrgan: TDBEditEh;
    Label4: TLabel;
    edDate: TDBDateTimeEditEh;
    HTTPRIO: THTTPRIO;
    lbLoad: TLabel;
    Animate1: TAnimate;
    Zip: TZipForge;
    lbRead: TLabel;
    btFTP: TButton;
    IdFTP1: TIdFTP;
    pb: TProgressBar;
    sb: TStatusBar;
    edSize: TDBNumberEditEh;
    Label5: TLabel;
    lbMax: TLabel;
    lbTime: TLabel;
    procedure btLoadClick(Sender: TObject);
    procedure btClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HTTPRIOHTTPWebNode1ReceivingData(Read, Total: Integer);
    procedure btFTPClick(Sender: TObject);

    procedure IdFTP1Status(ASender: TObject; const AStatus: TIdStatus; const AStatusText: String);
    procedure IdFTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;  const AWorkCountMax: Integer);
    procedure IdFTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;   const AWorkCount: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    //--- для FTP -------------
    AverageSpeed: Double;
    AbortTransfer: Boolean;
    TransferrignData: Boolean;
    BytesToTransfer: LongWord;
    STime: TDateTime;
    //------------------------

    FCount:Integer;
    FRun:Boolean;
    FExit:Boolean;
    FPath:String;

    function  LoadFileFTP:Boolean;   // FTP
    function  ChoiceFileFTP:String;  // FTP
    function  PutFileToFTP(strFileName:String):Boolean;

  end;

var
  fmMainGetATE: TfmMainGetATE;

implementation

{$R *.dfm}

procedure TfmMainGetATE.btLoadClick(Sender: TObject);
var
  spr:TClassifInterface;
  nMax:Integer;
  nCur,nSize:Integer;
  nn:Integer;
begin
   lbLoad.Caption:='';
   lbRead.Caption:='';
   lbMax.Caption:='';
   lbTime.Caption:='';
   FCount:=0;
   FExit:=false;
   FRun:=true;
   Ate.Active:=true;
   Ate.AdsZapTable;
   Screen.Cursor:=crHourGlass;
   Application.ProcessMessages;
   Ate.DisableControls;
   Grid.DataSource:=nil;
   spr:=TClassifInterface.Create(HTTPRIO);
   spr.Url:=Trim(edUrl.text); //'http://todes.by:8084/gisun/class/ws';
   spr.Proxy:=Trim(edProxy.text); // '';
   spr.MessageSource:=edOrgan.text; //'19194';

   pnLoad.Visible:=true;         
   Animate1.Active:=true;
   nCur:=1;
   try
     nSize:=edSize.Value;
     if nSize<10 then nSize:=1000;
   except
     edSize.Value:=1000;
     nSize:=1000;
   end;
   try      
     nMax:=spr.RequestATEMaxID;
     lbMax.Caption:='Максимальный ID: '+IntToStr(nMax);
     lbRead.Caption:='Загружено ID: 0';
     Application.ProcessMessages;
     nn:=GetTickCount;
     while nCur<nMax do begin
       spr.RequestATEInterval(nCur,nCur+nSize-1,ate);
       lbRead.Caption:='Загружено ID: '+IntToStr(nCur+nSize-1);
       Application.ProcessMessages;
       nCur:=nCur+nSize;
       if nCur>nMax
         then nCur:=nMax;
       if FExit then begin
         break;
       end
     end;
//     spr.RequestChangeATE(edDate.Value,ate);
   finally
     lbTime.Caption:='Время загрузки: '+FormatFloat('#.#',(GetTickCount-nn)/1000)+'сек.';
     lbLoad.Caption:='Загружено записей: '+intToStr(ate.RecordCount);
     Animate1.Active:=false;
     pnLoad.Visible:=false;
     Screen.Cursor:=crDefault;
     Grid.DataSource:=DataSource;
     ate.EnableControls;
     FRun:=false;
   end;
end;

procedure TfmMainGetATE.btClearClick(Sender: TObject);
begin
  if FRun then begin
    FExit:=true;
  end else begin
    Close;
  end;
end;

procedure TfmMainGetATE.FormCreate(Sender: TObject);
var
  s:String;
  ini:TIniFile;
  n:Integer;
begin
  lbLoad.Caption:='';
  lbRead.Caption:='';
  lbTime.Caption:='';
  FExit:=false;
  FCount:=0;
  FRun:=false;
  edDate.Value:=EncodeDate(1900,1,1);
//  pnLoad.Visible:=false;
  FPath:=ExtractFilePath(Application.ExeName);
  AdsConnection.ConnectPath:=FPath;
  AdsConnection.Connect;
  ini:=TIniFile.Create(FPath+'SERVICE\GISUN.ini');
  s:=ini.ReadString('HTTP','GISUN_URL','');
  if s<>'' then begin
    n:=Pos(ANSIUpperCase('common/ws'),ANSIUpperCase(s));
    if n>0 then begin
      s:=Copy(s,1,n-1)+'class/ws';
      edURL.Text:=s;
    end;
  end;
  s:=ini.ReadString('HTTP','GISUN_PROXY','');
  if s<>'' then begin
    edProxy.Text:=s;
  end;
  ini.Free;
  if not FileExists(FPath+'ate.adt') then begin
    s:='CREATE TABLE ate ('+#13#10+
         'KOD      Char( 10 ), '+#13#10+
         'NAME     CIChar( 80 ), '+#13#10+
         'NAME_B   CIChar( 80 ), '+#13#10+
         'ATE_PARENTID Integer, '+#13#10+
         'ATE_ID   Integer, '+#13#10+
         'ID       Integer, '+#13#10+
         'DATEIN   Date, '+#13#10+
         'DATEOUT  Date, '+#13#10+
         'CATEGORY Integer, '+#13#10+
         'FNAMEC   CIChar( 60 ), '+#13#10+
         'FNAMEC_B CIChar( 60 ), '+#13#10+
         'NAMEC    CIChar( 10 ), '+#13#10+
         'NAMEC_B  CIChar( 10 ), '+#13#10+
         'FRONT    Integer '+#13#10+
         ' )';
    AdsConnection.Execute(s);
  end;
  ate.open;
  lbLoad.Caption:='Количество записей: '+intToStr(ate.RecordCount);

end;

procedure TfmMainGetATE.HTTPRIOHTTPWebNode1ReceivingData(Read,  Total: Integer);
begin
  FCount:=FCount+1;
//  memo.lines.add('ReceivingData read:'+IntToStr(Read)+'    total:'+IntToStr(Total));
//  LbRead.caption:='Прочитано блоков данных: '+IntToStr(FCount);
//  Application.ProcessMessages;
  if FExit then begin
    ate.close;
    AdsConnection.IsConnected:=false;
    Application.Terminate;
  end;

end;

procedure TfmMainGetATE.btFTPClick(Sender: TObject);
var
  n:Integer;
begin
//      ChangeMessage('Архивирование ...');
   if ate.Active then begin
     ate.Close;
     Zip.FileName := FPath+'ate_'+edOrgan.Text+'.zip';
     Zip.BaseDir  := FPath;
     Zip.OpenArchive(fmCreate);
     Zip.AddFiles('ate.adt');
     Zip.CloseArchive;
     // копируем на носитель
     n := GetFileSize(Zip.FileName);
     ate.Open;
     try
       pb.Visible:=true;
       btFTP.Enabled:=false;
       Application.ProcessMessages;
       PutFileToFTP(Zip.FileName);
     finally
       btFTP.Enabled:=true;
       pb.Visible:=false;
     end;
   end;

end;

//----------------------------------------------------------------------------------
//         FTP
//----------------------------------------------------------------------------------
function TfmMainGetATE.ChoiceFileFTP:String;
begin
  IdFTP1.Connect;
  // ...    выбор файла
end;

function TfmMainGetATE.PutFileToFTP(strFileName:String):Boolean;
var
  s:String;
begin
  with IdFTP1 do begin
    Username := 'vc';
    Password := 'IOlnelxy';
    Host := 'vc.brest.by';
    try
      Connect;
    except
      on E: Exception do begin          // # 11001 Host not found
        s:=E.Message;
        PutError(s);
      end;
    end;
  end;

  if not IdFTP1.Connected then exit;

//  try
    IdFTP1.ChangeDir('/WWW/from_zags');

    IdFTP1.Put( strFileName, ExtractFileName(strFileName) );
    IdFTP1.Disconnect;;
//  except

//  end;
end;

//----------------------------------------------------------------
function TfmMainGetATE.LoadFileFTP:Boolean;
var
  strFilename:String;
  LS: TStringList;
begin
  strFileName:=ChoiceFileFTP;
  if strFileName='' then exit;

  if not IdFTP1.Connected then exit;

  LS := TStringList.Create;
  try
    IdFTP1.ChangeDir('/WWW/download');
//    IdFTP1.TransferType := ftASCII;
    IdFTP1.List(LS);
//    if DirectoryListBox.Items.Count > 0 then
//      if AnsiPos('total', DirectoryListBox.Items[0]) > 0 then DirectoryListBox.Items.Delete(0);
  finally
    LS.Free;
  end;


//  Name := IdFTP1.DirectoryListing.Items[DirectoryListBox.ItemIndex].FileName;

//  IdFTP1.TransferType := ftBinary;
  BytesToTransfer := IdFTP1.Size(strFileName);
  IdFTP1.Get(strFileName, 'F:\'+strFileName, false);
end;

procedure TfmMainGetATE.IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;  const AStatusText: String);
begin
//  DebugListBox.ItemIndex := DebugListBox.Items.Add(asStatusText);
//  StatusBar1.Panels[1].Text := asStatusText;
end;

procedure TfmMainGetATE.IdFTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
  TransferrignData := true;
//  AbortButton.Visible := true;
  AbortTransfer := false;
  STime := Now;
  if AWorkCountMax > 0
    then pb.Max := AWorkCountMax
    else pb.Max := BytesToTransfer;
  AverageSpeed := 0;
end;

procedure TfmMainGetATE.IdFTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
//  AbortButton.Visible := false;
  SB.Panels[1].Text := 'Загрузка окончена.';
  BytesToTransfer := 0;
  TransferrignData := false;
  pb.Position := 0;
  AverageSpeed := 0;
end;

procedure TfmMainGetATE.IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;  const AWorkCount: Integer);
Var
  S: String;
  TotalTime: TDateTime;
//  RemainingTime: TDateTime;
  H, M, Sec, MS: Word;
  DLTime: Double;
begin
  TotalTime :=  Now - STime;
  DecodeTime(TotalTime, H, M, Sec, MS);
  Sec := Sec + M * 60 + H * 3600;
  DLTime := Sec + MS / 1000;
  if DLTime > 0 then
    AverageSpeed := {/*(AverageSpeed + */} (AWorkCount / 1024) / DLTime {/*) / 2*/};

  if AverageSpeed > 0 then begin
    Sec := Trunc(((PB.Max - AWorkCount) / 1024) / AverageSpeed);

    S := Format('%2d:%2d:%2d', [Sec div 3600, (Sec div 60) mod 60, Sec mod 60]);

    S := 'Time remaining ' + S;
  end
  else S := '';

  S := FormatFloat('0.00 КБ/сек', AverageSpeed) + '; ' + S;
  case AWorkMode of
    wmRead: SB.Panels[1].Text := 'Скорость загрузки ' + S;
    wmWrite: SB.Panels[1].Text := 'Uploade speed ' + S;
  end;

  if AbortTransfer then IdFTP1.Abort;

  PB.Position := AWorkCount;
  AbortTransfer := false;
end;
//----------------------------------------------------------------------------------
//         FTP  (END)
//----------------------------------------------------------------------------------

procedure TfmMainGetATE.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  SB.Panels[1].Text := '';
end;

end.
