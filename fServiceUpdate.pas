unit fServiceUpdate;

interface

{$I Task.inc}

{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, FileCtrl, fMultiChoice,
  Dialogs, ComCtrls, IdAntiFreezeBase, IdAntiFreeze, ZipForge, uUtilFiles, FuncPr, MetaTask, fWarning, RKP, SasaIniFile,
  IdException, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP, adscnnct, dbFunc, uTypes,
  ShellApi, StdCtrls, DB, adsdata, adsfunc, adstable, Mask, DBCtrlsEh;

type
  TfmServiceUpdate = class(TForm)
    IdFTP1: TIdFTP;
    Zip: TZipForge;
    pb: TProgressBar;
    SB: TStatusBar;
    btRun: TButton;
    cbType: TComboBox;
    lb: TLabel;
    cbServer: TComboBox;
    tbCh: TAdsTable;
    lbPath: TLabel;
    edPath: TDBEditEh;
    edDir: TDBEditEh;
    cbXML: TCheckBox;
    Query: TAdsQuery;
    btSetFiles: TButton;
    cbPart: TCheckBox;
    odFile: TOpenDialog;
    procedure IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;   const AWorkCount: Integer);
    procedure IdFTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;  const AWorkCountMax: Integer);
    procedure IdFTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure btRunClick(Sender: TObject);
    procedure cbTypeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edPathEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure ZipFileProgress(Sender: TObject; FileName: WideString;  Progress: Double; Operation: TZFProcessOperation;  ProgressPhase: TZFProgressPhase; var Cancel: Boolean);
    procedure edDirEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure btSetFilesClick(Sender: TObject);
    procedure cbPartClick(Sender: TObject);
  private
    { Private declarations }
  public
    FFileName:String;
    FPath:String;
    FIdBase:String;
    FIdProg:String;
    FRun:Boolean;
    FFiles:String;
    FError:String;
    //--- для FTP -------------
    AverageSpeed: Double;
    AbortTransfer: Boolean;
    TransferrignData: Boolean;
    BytesToTransfer: LongWord;
    STime: TDateTime;
    //------------------------
    function CopyListFiles(FDirSource,FDirDesc:String) : Boolean;
    function ReplaceFiles(FDirSource:String; FDirDesc:String) : Boolean;

    function OpenTablesDict( strNameDict : String ) : Boolean;
    function SysQuery_( sText : String ) : String;
    procedure CheckVisibleProgress(lVisible:Boolean; strCaption:String; strButton:String='Прервать');
    procedure CheckEnabledControl(lEnabled:Boolean);

    function PutFileFTP(lShow:Boolean; strFileName:String; strDir:String=''):Boolean;
    function GetFileFTP(lShow:Boolean; strFileName:String; strOutputDir:String):Boolean;
    function ConnectBase(var lErr:Boolean; lContinue:Boolean=true):Boolean;
    procedure BaseToArx;
    procedure BaseFromArx;
    procedure FileFromFTP;
    procedure FileToFTP;
    procedure BaseToFTP;
    procedure BaseFromFTP;
    procedure DownloadSetup(sFileName:String; sFolder:String);
    procedure DownloadLastUpdate(sFolder:String);
    procedure DownloadSysSpr(sFolder:String);

    procedure SetPropertyFPT(strTypeFile:String);
    function GetFileName:String;
    function GetTypeServer:Integer;

    procedure CheckPart;
    function IsFull:Boolean;


  end;

var
  fmServiceUpdate: TfmServiceUpdate;

implementation

uses dBaseConf, fMainConf, uProjectAll, uSynapseObj;

{$R *.dfm}

const
  PPP_CONST='bd3141f9aed34f62a74c8a093a0b2ba9';

//-------------------------------------------
function NAME_SETUP_PROG_:String;
var
  s:String;
begin
  s:=GlobalTask.GetWorkParam('TYPEBASE');
  result:='SetupLAIS.exe';
  if (s='ZAGS') then
    result:='SetupZAGS.exe'
  else if (s='ZAH') then
    result:='SetupZAH.exe'
  else if (s='ZKH') then
    result:='SetupGKH.exe'
  else if (s='OPEKA') then
    result:='SetupOpeka.exe'
  else if (s='LAISSMDO') or (s='POST') then
    result:='SetupLaisSmdo.exe'
  else if (s='OCHERED') then
    result:='SetupOchered.exe';
end;
//-------------------------------------------
function NAME_UPDATE_PROG_:String;
var
  s:String;
begin
  s:=GlobalTask.GetWorkParam('TYPEBASE');
  result:='UPDATELAIS';
  if (s='ZAGS') then
    result:='UPDATEZAGS'
  else if (s='ZAH') then
    result:='UPDATEZAH'
  else if (s='GKH') then
    result:='UPDATEGKH'
  else if (s='OPEKA') then
    result:='UPDATEOPEKA'
  else if (s='LAISSMDO') or (s='POST') then
    result:='UPDATELAISSMDO'
  else if (s='OCHERED') then
    result:='UPDATEOCHERED';
end;
//-------------------------------------------
function NAME_PATH_PROG_:String;
var
  s:String;
begin
  s:=GlobalTask.GetWorkParam('TYPEBASE');
  if (s='ZAGS') then
    result:='ZAGS'
  else if (s='ZAH') then
    result:='ZAH'
  else if (s='GKH') then
    result:='GKH'
  else if (s='OPEKA') then
    result:='OPEKA'
  else if (s='LAISSMDO') or (s='POST') then
    result:='LAISSMDO'
  else if (s='OCHERED') then
    result:='OCHERED'
  else
    result:='LAIS';
  result:='Path'+result+'.exe';
end;
//-------------------------------------------
function TfmServiceUpdate.GetTypeServer:Integer;
begin
  result:=SERVER_BREST;
  case cbServer.ItemIndex of
    0: result:=SERVER_BREST;   // 1-Брест
    1: result:=SERVER_NCES_UPD;
    2: result:=SERVER_NCES_UPD2;
  end;
end;
//-----------------------------------------------------------------------------------------------
function TfmServiceUpdate.GetFileName:String;
begin
  if IsFull
    then Result:='data_'+FIdBase+'.zip'
    else Result:='part_'+FIdBase+'.zip';
  {
  if nType=0 then begin
    if FFiles=''
      then Result:='data_'+FIdBase+'.zip'
      else Result:='part_'+FIdBase+'.zip';
  end else if nType=1 then begin
    Result:='data_'+FIdBase+'.zip'
  end else if nType=2 then begin
    Result:='part_'+FIdBase+'.zip';
  end;
  }
end;
//-----------------------------------------------------------------------------------------------
procedure TfmServiceUpdate.FormCreate(Sender: TObject);
var
  n:Integer;
  Ini:TSasaIniFile;
  s:String;        
begin
  FFileName:='';
  FFiles:='';
  FIdBase:=IntToStr(GlobalTask.ParamasInteger('ID'));
  FIdProg:=GlobalTask.ParamAsString('IDPROG');
  {
  sFile:='';
  if FIdProg<>'' then begin
    if (FIdProg='SELSOVET') or (FIdProg='LAIS') then begin
      sFile:='Население.adt';
    end else if FIdProg='ZAGS' then begin
      sFile:='АктыРождений.adt';
    end else if FIdProg='POST' then begin
      sFile:='SmdoPost.adt'
    end else if FIdProg='ZAH' then begin
      sFile:='AktZ.adt'
    end else if FIdProg='OPEKA' then begin
      sFile:='AktOpek.adt'
    end else if FIdProg='GKH' then begin
      sFile:='Население.adt';
    end else if FIdProg='OCHERED' then begin
      sFile:='Ochered.adt';
    end;
  end;
  if sFile<>''
    then tbCh.TableName:=sFile;
  }

//  Label1.Caption:=FIdProg+' '+sFile;
  if FIdProg=''
    then FIdProg:='SELSOVET';
  if FIdProg='POST' then begin
    try
      Ini:=TSasaIniFile.Create(ExtractFilePath(Application.ExeName)+'Service\smdo.ini');
      s:=Ini.ReadString('POST','SMDOCODE','');
      Ini.Free;
      if s<>''
        then  FIdBase:=s;
    except

    end;
  end;

  edPath.Text:=ExtractFilePath(dmBaseConf.GetPathConnect);
  FPath:=edPath.Text;
  FRun:=false;
  edDir.Top:=cbServer.Top;
  n := GetDriveType(PChar('D:/'));
  if (n=DRIVE_FIXED) then begin
    edDir.Text:='D:\';
  end;
//DRIVE_REMOVABLE – 2 : тип устройства определяется как съемный (дискета, флешка и т.д.)
//DRIVE_FIXED – 3 : тип устройства – фиксированный диск (жесткий диск)
//DRIVE_REMOTE – 4 : тип устройства – удаленный(сетевой) диск
//DRIVE_CDROM – 5 : это устройство CD-ROM
  cbType.ItemIndex:=0;
  cbTypeChange(nil);
end;
//-----------------------------------------------------------------------------------------------
procedure TfmServiceUpdate.edDirEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  strDir:String;
begin
  strDir:=edDir.Text;
  if SelectDirectory('Куда скопировать архив', '', strDir) and (strDir<>'') then begin
    edDir.Text:=strDir;
  end;
end;
//-----------------------------------------------------------------------------------
function TfmServiceUpdate.ConnectBase(var lErr:Boolean; lContinue:Boolean):Boolean;
begin
  Result:=true;
  dmBaseConf.AdsConnection.DisConnect;
  dmBaseConf.AdsConnection.ConnectPath:=CheckSleshN(FPath)+NameDict;
  dmBaseConf.AdsConnection.Username:='ADSSYS';
  dmBaseConf.AdsConnection.Password:=fmMainConf.SystemPassword;
  try
    dmBaseConf.AdsConnection.Connect;
  except
    on E:Exception do begin
      Result:=false;
      lErr:=true;
      PutError('Ошибка подключения к базе.'+#13+E.Message);
      if lContinue and Problem('   Продолжить ?   ') then begin
        Result:=true;
      end;
    end;
  end;
  if Result and not lErr then begin
    try
      tbCh.Active:=true;
    except
      on E:Exception do begin
        PutError('Ошибка блокировки базы. Таблица "'+tbCh.TableName+'"'+#13+E.Message);
//        if Problem('   Продолжить ?   ') then begin
        Result:=false;
        lErr:=true;
//        end;
      end;
    end;
    if tbCh.Active
      then tbCh.Active:=false;
  end;
end;
//-----------------------------------------------------------------------------------------------
function TfmServiceUpdate.IsFull:Boolean;
begin
  if cbPart.Checked // and (FFiles<>'')
    then Result:=false
    else Result:=true;
end;
//-----------------------------------------------------------------------------------------------
// БАЗУ В АРХИВ
//-----------------------------------------------------------------------------------
procedure TfmServiceUpdate.BaseToArx;
var
  s,ss,strPath,strDir,sFile,strFile1,strFile2:String;
  lOk,lErr:Boolean;
  i:Integer;
  arr:TarrStrings;
begin
  FRun:=true;
  btRun.Enabled:=false;
  strDir:=Trim(edDir.Text);
  Application.ProcessMessages;
//  lOk:=true;
  lErr:=false;
  lOk:=ConnectBase(lErr);
  {
  dmBaseConf.AdsConnection.DisConnect;
  dmBaseConf.AdsConnection.ConnectPath:=CheckSleshN(FPath)+NameDict;
  dmBaseConf.AdsConnection.Username:='ADSSYS';
  dmBaseConf.AdsConnection.Password:=fmMainConf.SystemPassword;
  try
    dmBaseConf.AdsConnection.Connect;
  except
    on E:Exception do begin
      lOk:=false;
      lErr:=true;
      PutError('Ошибка подключения к базе.'+#13+E.Message);
      if Problem('   Продолжить ?   ') then begin
        lOk:=true;
      end;
    end;
  end;
  if lOk and not lErr then begin
    try
      tbCh.Active:=true;
    except
      on E:Exception do begin
        PutError('Ошибка блокировки базы. Таблица "'+tbCh.TableName+'"'+#13+E.Message);
        lOk:=false;
      end;
    end;
  end;
  }
  if lOk and not IsFull then begin
    if not Problem('Вы хотите архивировать часть базы ?') then begin
      lOk:=false;
    end;
  end;
  if lOk then begin //dmBaseConf.LockBase then begin
    CheckEnabledControl(false);
    tbCh.Active:=false;
    dmBaseConf.AdsConnection.DisConnect;
//    cur:=Screen.Cursor;
//    Screen.Cursor:=crHourGlass;
    sb.Visible:=true;
    sb.Panels[0].Text:='  Архивирование...';
    Application.ProcessMessages;

    strPath := ExtractFilePath(Application.ExeName)+'Export\';
    ForceDirectories(strPath);
    ClearDir(strPath,false);
    try
      Zip.FileName := strPath+getFileName;
      Zip.BaseDir  := FPath;
      Zip.OpenArchive(fmCreate);
      Zip.BeginUpdate;
      if IsFull then begin
        Zip.AddFiles('*.*');
      end else begin
        StrToArr(FFiles,arr,',',true);
        for i:=0 to Length(arr)-1 do begin
          if FileExists(FPath+arr[i]+'.adt')  then Zip.AddFiles(arr[i]+'.adt');
          if FileExists(FPath+arr[i]+'.adi')  then Zip.AddFiles(arr[i]+'.adi');
          if FileExists(FPath+arr[i]+'.adm')  then Zip.AddFiles(arr[i]+'.adm');
        end;
      end;
      s:='';
      if ((FIdProg='SELSOVET') or (FIdProg='POST')) and IsFull then begin
        s:=ExtractFilePath(Application.ExeName)+'Tmp\';
        ForceDirectories(s);
        ClearDir(s,false);
        ForceDirectories(s+'SysArxiv\');
        ss:=ExtractFilePath(Application.ExeName)+'Service\';
        if FileExists(ss+'smdo.ini')  then CopyFile(PChar(ss+'smdo.ini'), PChar(s+'SysArxiv\smdo.ini'), false);
        if FileExists(ss+'gisun.ini') then CopyFile(PChar(ss+'gisun.ini'), PChar(s+'SysArxiv\gisun.ini'), false);
        sFile:=NameFileParams(FIdProg,0);
        if sFile<>'' then begin
          if FileExists(ss+sFile) then CopyFile(PChar(ss+sFile), PChar(s+'SysArxiv\'+sFile), false);
        end;
        ss:=ExtractFilePath(Application.ExeName);
        if FileExists(ss+'smdo.log')  then CopyFile(PChar(ss+'smdo.log'), PChar(s+'SysArxiv\smdo.log'), false);
        Zip.BaseDir:=s;
        Zip.AddFiles('*.*');
        {
        Zip.AddFiles('gisun.ini');
        Zip.BaseDir:=ExtractFilePath(Application.ExeName);
        Zip.AddFiles('smdo.log');
        }
        if cbXML.Checked then begin
          Zip.BaseDir:=ExtractFilePath(Application.ExeName)+'DocArxiv\SMDO\';
          Zip.AddFiles('*.xml');
        end;
      end;
      Zip.EndUpdate;
      Zip.CloseArchive;
      if s<>'' then
        ClearDir(s,true);
    except
      on E:Exception do begin
        PutError(E.Message);
        lOk:=false;
      end;
    end;
    sb.Panels[1].Text:='';
    Application.ProcessMessages;

  //  n := GetFileSize(Zip.FileName);

    if lOk then begin
      sb.Panels[0].Text:='  Копирование ...';
      strDir:=CheckSleshN(strDir);
      strFile1:=Zip.FileName;
      strFile2:=strDir+ExtractFileName(strFile1);
      if not CopyFile(PChar(strFile1), PChar(strFile2), false) then begin
         PutError('Ошибка копирования файла : '+#13+
                  'откуда :'+strFile1+#13+
                  'куда   :'+strFile2+#13+
                  IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
         lOk:=false;
      end;
      ClearDir(strPath,false);
      Application.ProcessMessages;
    end;
  end;
  CheckVisibleProgress(false, '');
  CheckEnabledControl(true);

  dmBaseConf.AdsConnection.DisConnect;
  FRun:=false;
  btRun.Enabled:=true;
  if lOk then begin
    ShowMessage('База помещена в архив и скопирована:'+#13+strFile2);
  end;
end;
//-----------------------------------------------------------------------------------
// БАЗУ ИЗ АРХИВА
//-----------------------------------------------------------------------------------
procedure TfmServiceUpdate.BaseFromArx;
var
  strPath,s,ss,strFile,strDirTmp:String;
  lErr,lOk:Boolean;
begin
  if IsFull then begin
    if not ConnectBase(lErr) then exit;
  end else begin   // если частичное восстановление, то не должно быть ошибки
    lErr:=false;
    if not ConnectBase(lErr) then exit;
    if lErr then exit;
  end;
  strFile:=CheckSleshN(edDir.Text)+getFileName;
  if not FileExists(strFile) then begin
    PutError('Файл для загрузки не найден ('+strFile+')');
    exit;
  end;

  FRun:=true;
  btRun.Enabled:=false;
  strDirTmp := ExtractFilePath(Application.ExeName)+'Tmp';
  strPath   := ExtractFilePath(Application.ExeName)+'Export\';
  ForceDirectories(strPath);
  ClearDir(strPath,false);

  lOk:=true;
  sb.Visible:=true;
  sb.Panels[0].Text:='  Извлечение файлов...';
  sb.Panels[1].Text:='';
  sb.Panels[2].Text:='';
  Application.ProcessMessages;
  pb.Visible:=false;
  Application.ProcessMessages;
  try
    Zip.FileName := strFile;
    if FileExists(Zip.FileName) then begin
      ClearDir(strDirTmp,true);
      ForceDirectories(strDirTmp);
      Zip.BaseDir  := strDirTmp;
      Zip.OpenArchive(fmOpenRead);
      Zip.ExtractFiles('*.*');
      Zip.CloseArchive;
    end;
  except
    on E:Exception do begin
      lOk:=false;
      PutError('Ошибка распаковки базы.'+#13+E.Message);
    end;
  end;
  CheckEnabledControl(false);

  sb.Panels[1].Text:='';
  Application.ProcessMessages;

  ClearDir(strPath,false);
  Application.ProcessMessages;

  if lOk and (strFile<>'') then begin
    if IsFull then begin
      ss:='';
      sb.Panels[0].Text:='  Тестовое открытие...';
      Application.ProcessMessages;
      lOk:=OpenTablesDict( strDirTmp+'\'+NameDict );
    end else begin
      lOk:=true;
      ss:=' частично ';
    end;
    if lOk then begin
      s := '';
      s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
      s := s + 'После выполнения восстановления текущая информация'#13;
      s := s + 'в базе будет '+ss+'уничтожена.'#13;
      s := s + 'Если Вы уверены в необходимости проведения операции,'#13;
      s := s + 'введите слово ДА в поле ввода'#13;
      if not OkWarning(s) then begin
        lOk:=false;
      end;
      if lOk then begin
        if IsFull then  begin
          GlobalTask.WriteToLogFile('Копирование базы из резервного архива.');
          sb.Panels[0].Text:='  Копирование файлов...';
          Application.ProcessMessages;
          lOk:=CopyListFiles(CheckSleshN(strDirTmp), CheckSleshN(FPath) );
          if lOk then begin
            GlobalTask.WriteToLogFile('Успешное завершение копирования из резервного архива.');
          end else begin
            GlobalTask.WriteToLogFile('ОШИБКА копирования базы из резервного архива.');
            PutError('Ошибка копирования файлов.');
          end;
        end else begin  // частичная замена файлов из архива part_XXXX.zip
//          GlobalTask.WriteToLogFile('Замена файлов базы из архива.');
          sb.Panels[0].Text:='  Замена файлов...';
          Application.ProcessMessages;
//        FPath = ExtractFilePath(dmBaseConf.GetPathConnect);
          lOk:=ReplaceFiles(CheckSleshN(strDirTmp), CheckSleshN(FPath) );
          if lOk then begin
            GlobalTask.WriteToLogFile('Успешное завершение замены файлов из архива.');
          end else begin
            GlobalTask.WriteToLogFile('ОШИБКА замены файлов из архива.');
            PutError('Ошибка замены файлов (см. лог-файл)');
          end;
        end;
      end;
    end else begin
      PutError('Ошибка тестового открытия.');
    end;
  end;
  ClearDir(strDirTmp,true);
  CheckVisibleProgress(false, '');
  CheckEnabledControl(true);

  FRun:=false;
  btRun.Enabled:=true;
  if lOk then begin
    ShowMessage('Операция выполнена успешно.');
  end;
end;
//-----------------------------------------------------------------------------------------------
// ЗАБРАТЬ ФАЙЛ ПО FTP
//-----------------------------------------------------------------------------------
procedure TfmServiceUpdate.FileFromFTP;
var
  slPar:TStringList;
  sErr:String;
begin
  if not InputQuery('Скачать', 'Имя файла', FFileName) or (Trim(FFileName)='')
    then exit;
  FFileName:=ANSILowerCase(Trim(FFileName));
  slPar:=TStringList.Create;
  slPar.Add('FILE='+FFileName);
  slPar.Add('TYPE=data');
  btRun.Enabled:=false;
  CheckEnabledControl(false);
  oUpdate:=TSynapseObj.Create(sb);
  try
    oUpdate.FMessages:='';
    oUpdate.FTypeServer:=GetTypeServer;
    oUpdate.FThread:=false;
    oUpdate.FCheckMessages:=false;
    oUpdate.FOutputDir:=ExtractFilePath(Application.ExeName)+'Tmp\';
    if oUpdate.GetFileFTP(true, slPar) then begin
      oUpdate.RunFileFTP(2);
    end else begin
      if oUpdate.FError='' then begin
        sErr:='Ошибка загрузки файла '+FFileName;
      end else begin
        if Pos(FFileName,oUpdate.FError)=0
          then sErr:=FFileName+':  '+oUpdate.FError
          else sErr:=oUpdate.FError;
      end;
      PutError(sErr);
    end;
  finally
    btRun.Enabled:=true;
    CheckEnabledControl(true);
    slPar.Free;
    FreeAndNil(oUpdate);
  end;
end;
//-----------------------------------------------------------------------------------------------
// ПЕРЕДАТЬ ФАЙЛ ПО FTP
//-----------------------------------------------------------------------------------
procedure TfmServiceUpdate.FileToFTP;
var
  sFileName:String;
  lOk:Boolean;
begin
  if odFile.Execute and FileExists(odFile.FileName) and Problem('Передать файл "'+odFile.FileName+'" ?')
    then sFileName:=odFile.FileName
    else exit;
  sb.Panels[1].Text:='';
  Application.ProcessMessages;
  //  n := GetFileSize(Zip.FileName);
  CheckVisibleProgress(true, '');
  sb.Panels[0].Text:='  Передача файла...';
  Application.ProcessMessages;
  TypeServerFTP:=GetTypeServer;
  {
  case cbServer.ItemIndex of
    0: TypeServerFTP:=SERVER_BREST;   // 1-Брест  9-НЦЭУ   11-НЦЭУ доп
    1: TypeServerFTP:=SERVER_NCES_UPD;
    2: TypeServerFTP:=SERVER_NCES_UPD2;
  end;
  }
  SetPropertyFPT('data');
  lOk:=false;
  try
    CheckEnabledControl(false);
    if PutFileFTP(true, sFileName) then begin
      lOk:=true;
    end;
  finally
    pb.Visible:=false;
    Application.ProcessMessages;
    CheckVisibleProgress(false, '');
  end;
  CheckEnabledControl(true);
  if lOk then begin
    ShowMessage('Передача завершена.');
  end;
  FRun:=false;
end;
//-----------------------------------------------------------------------------------------------
// ПЕРЕДАТЬ БАЗУ ПО FTP
//-----------------------------------------------------------------------------------
procedure TfmServiceUpdate.BaseToFTP;
var
  strPath:String;
  lOk,lErr:Boolean;
  i:Integer;
  arr:TArrStrings;
begin
//  lOk:=true;
  lErr:=false;
  lOk:=ConnectBase(lErr);
  if lOk and not IsFull then begin
    if not Problem('Вы хотите передать часть базы ?') then begin
      lOk:=false;
    end;
  end;
  if lOk then begin //dmBaseConf.LockBase then begin
    tbCh.Active:=false;
    dmBaseConf.AdsConnection.DisConnect;
//    cur:=Screen.Cursor;
//    Screen.Cursor:=crHourGlass;
    sb.Visible:=true;
    sb.Panels[0].Text:='  Архивирование...';
    Application.ProcessMessages;

    strPath := ExtractFilePath(Application.ExeName)+'Export\';
    ForceDirectories(strPath);
    ClearDir(strPath,false);
    CheckEnabledControl(false);
    try
      Zip.FileName := strPath+GetFileName;
      Zip.BaseDir  := FPath;
      Zip.OpenArchive(fmCreate);
      Zip.BeginUpdate;
      if IsFull then begin
        Zip.AddFiles('*.*');
      end else begin
        StrToArr(FFiles,arr,',',true);
        for i:=0 to Length(arr)-1 do begin
          if FileExists(FPath+arr[i]+'.adt')  then Zip.AddFiles(arr[i]+'.adt');
          if FileExists(FPath+arr[i]+'.adi')  then Zip.AddFiles(arr[i]+'.adi');
          if FileExists(FPath+arr[i]+'.adm')  then Zip.AddFiles(arr[i]+'.adm');
        end;
      end;
  //    Zip.AddFiles('*.*');
      Zip.EndUpdate;
      Zip.CloseArchive;
    except
      on E:Exception do begin
        PutError(E.Message);
        lOk:=false;
      end;
    end;
    sb.Panels[1].Text:='';
    Application.ProcessMessages;

  //  n := GetFileSize(Zip.FileName);

    if lOk then begin
      lOk:=false;
      CheckVisibleProgress(true, '');
      sb.Panels[0].Text:='  Передача файла...';
      Application.ProcessMessages;
      TypeServerFTP:=GetTypeServer;
      SetPropertyFPT('data');
      try
        if PutFileFTP(true, Zip.FileName) then begin
          lOk:=true;
        end;
      finally
        pb.Visible:=false;
        Application.ProcessMessages;
        if lOk then begin
          ClearDir(strPath,false);
        end;
        Application.ProcessMessages;
//        Screen.Cursor:=cur;
        CheckVisibleProgress(false, '');
      end;
    end;
    CheckEnabledControl(true);
    if lOk then begin
      ShowMessage('Передача завершена.');
    end;
  end;
  dmBaseConf.AdsConnection.DisConnect;
  FRun:=false;
end;
//-----------------------------------------------------------------------------------
// ЗАБРАТЬ БАЗУ ПО FTP
//-----------------------------------------------------------------------------------
procedure TfmServiceUpdate.BaseFromFTP;
var
  strPath,s,ss,strFile,strDirTmp:String;
  lErr,lOk:Boolean;
  n:Integer;
begin
  lErr:=false;
  if IsFull then begin
    if not ConnectBase(lErr) then exit;
  end else begin   // если частичное восстановление, то не должно быть ошибки
    if not ConnectBase(lErr) then exit;
    if lErr then exit;
  end;
  strDirTmp := ExtractFilePath(Application.ExeName)+'Tmp';
  strPath   := ExtractFilePath(Application.ExeName)+'Export\';
  ForceDirectories(strPath);
  ClearDir(strPath,false);
  CheckEnabledControl(false);
  TypeServerFTP:=GetTypeServer;
  SetPropertyFPT('data');

  strFile:='';
  lOk:=false;
  if getFileFTP(true, '','') then begin
    ss:=UpperCase(getFileName);   // data_XXXX.zip или part_XXXX.zip
    for n:=0 to idFTP1.DirectoryListing.Count-1 do begin
      strFile:=idFTP1.DirectoryListing.Items[n].FileName;
      if (UpperCase(strFile)=ss) then begin
        lOk:=true;
        break;
      end;
    end;
  end;

  if lOk and (strFile<>'') then begin
    CheckVisibleProgress(true, '');
    sb.Panels[0].Text:='  Получение файла...';
    Application.ProcessMessages;

    if GetFileFTP(true, strFile, strPath) then begin
      pb.Visible:=false;
      sb.Panels[0].Text:='  Извлечение файлов...';
      sb.Panels[1].Text:='';
      sb.Panels[2].Text:='';
      Application.ProcessMessages;
      try
        Zip.FileName := strPath+strFile;
        if FileExists(Zip.FileName) then begin
          ClearDir(strDirTmp,true);
          ForceDirectories(strDirTmp);
          Zip.BaseDir  := strDirTmp;
          Zip.OpenArchive(fmOpenRead);
          Zip.ExtractFiles('*.*');
          Zip.CloseArchive;
        end;
      except
        on E:Exception do begin
          lOk:=false;
          PutError('Ошибка распаковки базы.'+#13+E.Message);
        end;
      end;

      sb.Panels[1].Text:='';
      Application.ProcessMessages;

      ClearDir(strPath,false);
      Application.ProcessMessages;

    end else begin
      lOk:=false;
      PutError('Ошибка загрузки файла.');
    end;
  end else begin
    PutError('Файл для загрузки не найден ('+getFileName+')');
  end;
  if lOk then begin
    if IsFull then begin
      ss:='';
      sb.Panels[0].Text:='  Тестовое открытие...';
      Application.ProcessMessages;
      lOk:=OpenTablesDict( strDirTmp+'\'+NameDict );
    end else begin
      lOk:=true;
      ss:=' частично ';
    end;
    if lOk then begin
      if lOk then begin
        s := '';
        s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
        s := s + 'После выполнения восстановления текущая информация'#13;
        s := s + 'в базе будет '+ss+'уничтожена.'#13;
        s := s + 'Если Вы уверены в необходимости проведения операции,'#13;
        s := s + 'введите слово ДА в поле ввода'#13;
        if not OkWarning(s) then begin
          lOk:=false;
        end;
      end;
      if lOk then begin
        if IsFull then begin
          GlobalTask.WriteToLogFile('Копирование базы из резервного архива.');
          sb.Panels[0].Text:='  Копирование файлов...';
          Application.ProcessMessages;
          lOk:=CopyListFiles(CheckSleshN(strDirTmp), CheckSleshN(FPath) );
          if lOk then begin
            GlobalTask.WriteToLogFile('Успешное завершение копирования из резервного архива.');
          end else begin
            GlobalTask.WriteToLogFile('ОШИБКА копирования базы из резервного архива.');
            PutError('Ошибка копирования файлов.');
          end;
        end else begin  // частичная замена файлов из архива part_XXXX.zip
          sb.Panels[0].Text:='  Замена файлов...';
          Application.ProcessMessages;
//        FPath = ExtractFilePath(dmBaseConf.GetPathConnect);
          lOk:=ReplaceFiles(CheckSleshN(strDirTmp), CheckSleshN(FPath) );
          if lOk then begin
            GlobalTask.WriteToLogFile('Успешное завершение замены файлов из архива.');
          end else begin
            GlobalTask.WriteToLogFile('ОШИБКА замены файлов из архива.');
            PutError('Ошибка замены файлов.');
          end;
        end;
      end;
    end else begin
      PutError('Ошибка тестового открытия.');
    end;
  end;
  ClearDir(strDirTmp,true);
  CheckVisibleProgress(false, '');
  CheckEnabledControl(true);

  FRun:=false;
  if lOk then begin
    ShowMessage('Операция выполнена успешно.');
  end;
end;

//-----------------------------------------------------------------------------------
// Скачать установку программы
//-----------------------------------------------------------------------------------
//---------------------------------------------------------
//procedure RunUpdateEx(pn:TPanel; nAfter:Integer; slPar:TStringList);
procedure TfmServiceUpdate.DownloadSetup(sFileName:String; sFolder:String);
var
  slPar:TStringList;
  sErr:String;
begin
  slPar:=TStringList.Create;
  slPar.Add('FILE='+sFileName);
  slPar.Add('TYPE=setup');
  btRun.Enabled:=false;
  CheckEnabledControl(false);
  oUpdate:=TSynapseObj.Create(sb);
  try
    oUpdate.FMessages:='';
    oUpdate.FTypeServer:=GetTypeServer;
    oUpdate.FThread:=false;
    oUpdate.FCheckMessages:=false;
    oUpdate.FOutputDir:=ExtractFilePath(Application.ExeName)+sFolder;
    if oUpdate.GetFileFTP(true, slPar) then begin
      oUpdate.RunFileFTP(2);
    end else begin
      if oUpdate.FError='' then begin
        sErr:='Ошибка загрузки файла '+sFileName;
      end else begin
        if Pos(sFileName,oUpdate.FError)=0
          then sErr:=sFileName+':  '+oUpdate.FError
          else sErr:=oUpdate.FError;
      end;
      PutError(sErr);
    end;
  finally
    btRun.Enabled:=true;
    CheckEnabledControl(true);
    slPar.Free;
    FreeAndNil(oUpdate);
  end;
end;
procedure TfmServiceUpdate.DownloadSysSpr(sFolder:String);
begin
  DownloadSetup('UpdateSysSpr.exe', sFolder);
end;
procedure TfmServiceUpdate.DownloadLastUpdate(sFolder:String);
begin
  btRun.Enabled:=false;
  CheckEnabledControl(false);
  oUpdate:=TSynapseObj.Create(sb);
  try
    oUpdate.FMessages:='';
    oUpdate.FTypeServer:=GetTypeServer;
    oUpdate.FCurUpdate:=1; // !!!
    oUpdate.FThread:=false;
    oUpdate.FCheckMessages:=false;
    oUpdate.FOutputDir:=ExtractFilePath(Application.ExeName)+sFolder;
    if oUpdate.CheckUpdate(NAME_UPDATE_PROG_) then begin
      if Problem('Доступно обновление программы № '+IntToStr(oUpdate.FUpdate)+'. Загрузить?') then begin  //Доступно обновление
        if oUpdate.GetFileFTP(true) then begin
          oUpdate.RunFileFTP(2);
        end else begin
          if oUpdate.FError<>''
            then PutError(oUpdate.FError);
        end;
      end;
    end else begin
      if oUpdate.FError=''
        then ShowMessage(PADCStr('Обновление не найдено.',40,' '))
        else PutError(oUpdate.FError);
    end;
  finally
    btRun.Enabled:=true;
    CheckEnabledControl(true);
    FreeAndNil(oUpdate);
  end;
end;
{
procedure TfmServiceUpdate.DownloadSetup(sFileName:String; sFolder:String);
var
  strPath,s,ss,strFile,strDirTmp:String;
  lErr,lOk:Boolean;
  n:Integer;
begin
  lErr:=false;
  strDirTmp := ExtractFilePath(Application.ExeName)+'Tmp';
  strPath   := ExtractFilePath(Application.ExeName)+sFolder+'\';
  ForceDirectories(strPath);
  ClearDir(strPath,false);
  TypeServerFTP:=GetTypeServer;
  SetPropertyFPT('setup');

  strFile:='';
  lOk:=false;
  if getFileFTP(true, '','') then begin
    ss:=UpperCase(sFileName);   // имя файла setup
    for n:=0 to idFTP1.DirectoryListing.Count-1 do begin
      strFile:=idFTP1.DirectoryListing.Items[n].FileName;
      if (UpperCase(strFile)=ss) then begin
        lOk:=true;
        break;
      end;
    end;
  end;

  if lOk and (strFile<>'') then begin
    CheckVisibleProgress(true, '');
    CheckEnabledControl(false);

    sb.Panels[0].Text:='  Получение файла...';
    Application.ProcessMessages;

    if GetFileFTP(true, strFile, strPath) then begin
      sb.Panels[1].Text:='';
      Application.ProcessMessages;
      ClearDir(strPath,false);
      Application.ProcessMessages;
      ShellExecute(Application.Handle, PChar('explore'), PChar(strPath), nil, nil, SW_SHOWNORMAL);
    end else begin
      lOk:=false;
      PutError('Ошибка загрузки файла.');
    end;
  end else begin
    PutError('Файл для загрузки не найден ('+sFileName+')');
  end;
  ClearDir(strDirTmp,true);
  CheckVisibleProgress(false, '');
  CheckEnabledControl(true);
  FRun:=false;
end;
}
//------------------------------------------------------------------------
function TfmServiceUpdate.ReplaceFiles(FDirSource:String; FDirDesc:String) : Boolean;
var
  lOk:Boolean;
  sr: TSearchRec;
  strName,sFile:String;
  sl:TStringList;
  i,n:Integer;
begin
  FError:='';
  FDirSource:=CheckSleshN(FDirSource);
  FDirDesc:=CheckSleshN(FDirDesc);
  lOk:=true;
  dmBaseConf.AdsConnection.DisConnect;
  dmBaseConf.AdsConnection.ConnectPath:=FDirDesc+NameDict;
  dmBaseConf.AdsConnection.Username:='ADSSYS';
  dmBaseConf.AdsConnection.Password:=fmMainConf.SystemPassword;
  try
    dmBaseConf.AdsConnection.Connect;
  except
    on E:Exception do begin
      lOk:=false;
      FError:='Ошибка подключения к базе: '+E.Message;
    end;
  end;
  if lOk then begin
    sl:=TStringList.Create;
    if FindFirst( FDirSource+'*.adt', faAnyFile, sr) = 0 then begin
      strName:=sr.Name;
      while strName<>'' do begin
        sl.Add(strName);
        if FindNext(sr)=0  then strName:=sr.Name
                           else strName:='';
      end;
      FindClose(sr);
    end;
    if sl.Count>0 then begin
      GlobalTask.WriteToLogFile('Замена файлов базы из архива: '+sl.CommaText);
      for i:=0 to sl.Count-1 do begin
        n:=Pos('.', sl.Strings[i]);
        sFile:=Copy(sl.Strings[i],1,n-1);
        if dmBaseConf.ReplaceTableBase(FDirSource,sFile) then begin
          GlobalTask.WriteToLogFile('Замена файла в базе: '+sFile+' +');
        end else begin
          GlobalTask.WriteToLogFile('ОШИБКА замены файла: '+sFile+' '+dmBaseConf.LastError);
          lOk:=false;
          break;
        end;
      end;
    end else begin
      FError:='Не найдены таблицы для замены';
    end;
    sl.Free;
  end;
  Result:=lOk;
end;
//------------------------------------------------------------------------
function TfmServiceUpdate.CopyListFiles(FDirSource,FDirDesc:String) : Boolean;
var
  i : Integer;
  FileAttrs : Integer;
  strPathS, strName : String;
  sr :  TSearchRec;
  FListSource:TStringList;
begin
  FListSource:=TStringList.Create;
  Result := true;
//-------------
  FListSource.Clear;
  strPathS := CheckSleshN(FDirSource);
  if FileExists(strPathS+NAMEDICT) then begin
    FileAttrs := SysUtils.faReadOnly+SysUtils.faArchive+SysUtils.faAnyFile;	//faDirectory;
    if FindFirst( strPathS+'*.*', FileAttrs, sr) = 0 then begin
      strName := sr.Name;
      while strName<>'' do begin
        if (ANSIUpperCase(Right(strName,3))<>'BAK') and (ANSIUpperCase(Right(strName,3))<>'TMP') then begin
          FListSource.Add(strName);
        end;
        if FindNext(sr) = 0  then strName:=sr.Name
                             else strName:='';
      end;
      FindClose(sr);
    end;
  end;
//-------------
  if FListSource.Count = 0 then begin
    PutError('Не найдены файлы для копирования по пути: '+#13+FDirSource);
    Result := false;
  end else begin
    ClearDir(FDirDesc,false);
    for i:=0 to FListSource.Count-1 do begin
      Application.ProcessMessages;
      if FileExists(FDirSource+FListSource.Strings[i]) then begin
        if not CopyFile(PChar(FDirSource+FListSource.Strings[i]),
                      PChar(FDirDesc+FListSource.Strings[i]), false) then begin
          PutError('Ошибка копирования файла : '+#13+
                  'откуда :'+FDirSource+FListSource.Strings[i]+#13+
                  'куда   :'+FDirDesc+FListSource.Strings[i]+#13+
                  IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
          Result := false;
          if Problem(' Прервать копирование ? ') then begin
            break;
          end;
        end else begin
          FileAttrs := FileGetAttr(FDirDesc+FListSource.Strings[i]);
          if FileAttrs and SysUtils.faReadOnly <> 0 then begin
            if FileSetAttr(FDirDesc+FListSource.Strings[i], FileAttrs-SysUtils.faReadOnly)=-1 then begin
              PutError(' Ошибка снятия атрибута "только для чтения" с файла: '+FListSource.Strings[i]);
              Result := false;
              break;
            end;
          end;
        end;
      end;
    end;
  end;
  FListSource.Free;
end;


//------------------------------------------------------------------------
function TfmServiceUpdate.SysQuery_( sText : String ) : String;
var
  lAds10:Boolean;
begin
  if Copy(tbCh.Version,1,1)='8'
    then lAds10:=false
    else lAds10:=true;
  Result:=CheckSysView(sText,lAds10);
end;

//------------------------------------------------------------------------
function TfmServiceUpdate.OpenTablesDict( strNameDict : String ) : Boolean;
var
  TestConn : TAdsConnection;
  q  : TAdsQuery;
  tb : TAdsTable;
begin
  Result := true;
  TestConn := TAdsConnection.Create(Self);
  with TestConn do begin
    AdsServerTypes := dmBaseConf.AdsConnection.AdsServerTypes;
    ConnectPath := strNameDict;
    UserName := 'ADSSYS';
    Password := fmMainConf.SystemPassword;
    LoginPrompt := false;
    Name := 'TestConn';
  end;
  tb := TAdsTable.Create(nil);
  with tb do begin
    TableType := ttAdsADT;
    AdsTableOptions.AdsCharType := ANSI;
    DataBaseName := 'TestConn';
    Name := 'tbTmpConn';
  end;
  q := TAdsQuery.Create(nil);
  with q do begin
    SourceTableType := ttAdsADT;
    AdsTableOptions.AdsCharType := ANSI;
    DataBaseName := 'TestConn';
    Name := 'qTmpConn';
  end;
  try
    TestConn.Connect;
  except
    on E:Exception do begin
      Result := false;
      PutError('Ошибка тестового открытия резервной копии.'+Chr(13)+Chr(10)+E.Message);
    end;
  end;
  if result then begin
    q.SQL.Text := 'SELECT name FROM '+SysQuery_('system.tables');
    q.Open;
    while not q.Eof do begin
      tb.Close;
      tb.TableName := q.Fields[0].AsString;
      try
        tb.Open;
        Application.ProcessMessages;
      except
        on E:Exception do begin
          Result := false;
          PutError('Ошибка тестового открытия резервной копии.'+Chr(13)+Chr(10)+'Таблица: "'+tb.TableName+'"'+Chr(13)+Chr(10)+E.Message);
        end;
      end;
      q.Next;
    end;
    tb.Close;
    q.Close;
  end;
  TestConn.Disconnect;
  q.Free;
  tb.Free;
  TestConn.Free;
end;

//-----------------------------------------------------------------------------------------------
procedure TfmServiceUpdate.CheckVisibleProgress(lVisible: Boolean; strCaption: String; strButton:String);
begin
  if lVisible then begin
    if strButton<>'' then begin
      btRun.Caption:=strButton;
    end;
    FRun:=true;
    pb.parent:=sb;
    pb.Left:=sb.Panels[0].Width+10;
    pb.Top:=2;
    pb.Visible:=true;
    {
    btCancel.Parent:=sb;
    btCancel.Left:=pb.Left+pb.Width+10;
    btCancel.Top:=2;
    }
//    btCancel.Visible:=true;

    sb.Panels[0].Text:=strCaption;
    sb.Panels[2].Text:='';
    sb.Visible:=true;
    Application.ProcessMessages;
  end else begin
    btRun.Caption:='Выполнить';
    FRun:=false;
//    btCancel.Visible:=false;
    sb.Visible:=false;
    pb.Visible:=false;
    sb.Panels[0].Text:='';
    sb.Panels[2].Text:='';
    Application.ProcessMessages;
  end;
//  btRun.Enabled:=not lVisible;
end;
//-----------------------------------------------------------------------------------------------
procedure TfmServiceUpdate.CheckEnabledControl(lEnabled:Boolean);
begin
  edPath.Enabled:=lEnabled;
  cbType.Enabled:=lEnabled;
  cbServer.Enabled:=lEnabled;
  edDir.Enabled:=lEnabled;
  cbPart.Enabled:=lEnabled;
  btSetFiles.Enabled:=lEnabled;
  lbPath.Enabled:=lEnabled;
  lb.Enabled:=lEnabled;
  cbXML.Enabled:=lEnabled;
  cbPart.Enabled:=lEnabled;
  btSetFiles.Enabled:=lEnabled;
end;

//-----------------------------------------------------------------------------------------------
function TfmServiceUpdate.GetFileFTP(lShow: Boolean; strFileName, strOutputDir: String): Boolean;
var
  cur:TCursor;
  LS:TStringList;
  s:String;
begin
  Result:=false;
  if TypeServerFTP=SERVER_BREST
    then s:='"ЦИТ Белстат (Internet)"'
    else s:='"ЦИТ Белстат (НЦЭУ)"';

  //IdAntiFreeze1.Active:=false;
  with IdFTP1 do begin
    try
      if lShow then OpenMessage('Подключение к серверу '+s,'',10);
      Connect;
      if lShow then CloseMessage;
    except
      on E: Exception do begin          // # 11001 Host not found
        if lShow then CloseMessage;
        cur:=Screen.Cursor;
        Screen.Cursor:=crDefault;
        PutError(E.Message);
        Screen.Cursor:=cur;
      end;
    end;
  end;
  //IdAntiFreeze1.Active:=true;

  if not IdFTP1.Connected then exit;

  try
    LS:=TStringList.Create;
    if DirFTP<>'' then begin
      IdFTP1.ChangeDir(DirFTP);
    end;
  //  IdFTP1.TransferType := ftASCII;
    IdFTP1.List(LS);

    //IdFTP1.TransferType := ftBinary;
    if strFileName='' then begin   // запрошен список файлов
      Result:=true;
    end else begin
      BytesToTransfer := IdFTP1.Size(strFileName);
//      strOutPutDir:='E:\';
      if strOutputDir<>'' then begin
        ForceDirectories(strOutputDir);
        strOutPutDir:=CheckSleshN(strOutPutDir);
      end;
      if FileExists(strOutPutDir+strFileName) then begin
        DeleteFile(strOutPutDir+strFileName);
      end;
      try
        IdFTP1.Get(strFileName, strOutPutDir+strFileName, true, true);
        if FileExists(strOutPutDir+strFileName) then begin
          Result:=true;
        end;
      except
        on E: EIdNotConnected do begin
          cur:=Screen.Cursor;
          Screen.Cursor:=crDefault;
          ShowMessage('Загрузка прервана.');
          Screen.Cursor:=cur;
        end;
        on E: EIdProtocolReplyError do begin
          cur:=Screen.Cursor;
          Screen.Cursor:=crDefault;
          ShowMessage('Загрузка прервана.');
          Screen.Cursor:=cur;
        end;
        on E:Exception do begin
          cur:=Screen.Cursor;
          Screen.Cursor:=crDefault;
          PutError(E.Message);
          Screen.Cursor:=cur;
        end;
      end;
    end;
  finally
    if IdFTP1.Connected
      then IdFTP1.Disconnect;
  end;

end;
//-----------------------------------------------------------------------------------------------
function TfmServiceUpdate.PutFileFTP(lShow: Boolean; strFileName,  strDir: String): Boolean;
var
  s:String;
  cur:TCursor;
begin
  Result:=false;
  if strDir='' then begin
    strDir:=DirFTP; //'/WWW/bases';
  end;
  if TypeServerFTP=SERVER_BREST
    then s:='"ЦИТ Белстат (Internet)"'
    else s:='"ЦИТ Белстат (НЦЭУ)"';
  with IdFTP1 do begin
    try
      if lShow then OpenMessage('Подключение к серверу '+s,'',10);
      Connect;
      if lShow then CloseMessage;
    except
      on E: Exception do begin          // # 11001 Host not found
        if lShow then CloseMessage;
        cur:=Screen.Cursor;
        Screen.Cursor:=crDefault;
        s:=E.Message;
        PutError(s);
        Screen.Cursor:=cur;
      end;
    end;
  end;

  if not IdFTP1.Connected then exit;

  try
    if strDir<>'' then IdFTP1.ChangeDir(strDir);
    IdFTP1.Put( strFileName, ExtractFileName(strFileName) );
    Result:=true;
  except
    on E: EIdNotConnected do begin
      cur:=Screen.Cursor;
      Screen.Cursor:=crDefault;
      ShowMessage('Загрузка прервана.');
      Screen.Cursor:=cur;
    end;
    on E:Exception do begin
      cur:=Screen.Cursor;
      Screen.Cursor:=crDefault;
      PutError(E.Message);
      Screen.Cursor:=cur;
    end;
  end;
  if IdFTP1.Connected then IdFTP1.Disconnect;
end;
//-----------------------------------------------------------------------------------------------
procedure TfmServiceUpdate.IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;  const AWorkCount: Integer);
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
    AverageSpeed := {(AverageSpeed + } (AWorkCount / 1024) / DLTime {) / 2};

  if AverageSpeed > 0 then begin
    Sec := Trunc(((PB.Max - AWorkCount) / 1024) / AverageSpeed);

    S := Format('%2d:%2d:%2d', [Sec div 3600, (Sec div 60) mod 60, Sec mod 60]);

    S := 'время ' + S;
  end
  else S := '';

//  S := FormatFloat('0.00 КБ/сек', AverageSpeed) + '; ' + S;
  S := FormatFloat('0.00 КБ/сек', AverageSpeed);
  {
  case AWorkMode of
    wmRead: SB.Panels[1].Text := '------------------------------------- Скорость загрузки ' + S;
    wmWrite: SB.Panels[1].Text := '---------------------------------------- Скорость загрузки ' + S;
  end;
  }
  SB.Panels[2].Text := S;
  Application.ProcessMessages;

  if AbortTransfer then begin
//    IdFTP1.Disconnect;
    IdFTP1.Abort;
  end;

  PB.Position := AWorkCount;
  AbortTransfer := false;
end;
//-----------------------------------------------------------------------------------------------
procedure TfmServiceUpdate.IdFTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode; const AWorkCountMax: Integer);
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
//-----------------------------------------------------------------------------------------------
procedure TfmServiceUpdate.IdFTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  BytesToTransfer := 0;
  TransferrignData := false;
  pb.Position := 0;
  AverageSpeed := 0;
end;

//-----------------------------------------------------------------------------------------------
procedure TfmServiceUpdate.SetPropertyFPT(strTypeFile: String);
var
  ftpp:TPropFTP;
begin
 IdFTP1.Disconnect;
 IdFTP1.Port:=21;
 if (TypeServerFTP<>SERVER_BREST) and (TypeServerFTP<>SERVER_NCES_UPD) and (TypeServerFTP<>SERVER_NCES_UPD2)
   then TypeServerFTP:=SERVER_BREST;
 ftpp:=GetPropertyFTP_ForWrite(TypeServerFTP, strTypeFile);
 IdFTP1.Host:=ftpp.Host; // 'vc.brest.by';
 IdFTP1.Username:=ftpp.Username;  // 'vc';
 IdFTP1.Password:=ftpp.Password;  //  PSW_ADMIN_FTP; //'admin1106';
 IdFTP1.Passive:=ftpp.Passive;
 DirFTP:=ftpp.Dir;   // '/www/vc.brest.by/download'
 {
 //------ ВЦ БОУС ------------------------------
 if TypeServerFTP=SERVER_BREST then begin             // uProjects.pas
   ftpp:=GetPropertyVCBrest(strTypeFile);
   IdFTP1.Host:=ftpp.Host; // 'vc.brest.by';
   IdFTP1.Username:=ftpp.Username;  // 'vc';
   IdFTP1.Password:=ftpp.Password;  //  PSW_ADMIN_FTP; //'admin1106';
   IdFTP1.Passive:=true;
   DirFTP:=ftpp.Dir;   // '/www/vc.brest.by/download'
 //------  сервер НЦЭУ -----------
 end else if TypeServerFTP=SERVER_NCES_UPD then begin
   IdFTP1.Host:='10.30.251.170';
   IdFTP1.Username:='admin';
   IdFTP1.Password:=XorDecode(PPP_CONST, '010d47050500045c0d');  //'cit411bel';
   DirFTP:='/var/ftpd/pub/bases';
 end else if TypeServerFTP=SERVER_NCES_UPD2 then begin
   IdFTP1.Host:='10.30.254.20';
   IdFTP1.Username:='belstatftp';
   IdFTP1.Password:=XorDecode(PPP_CONST, '2e545757001024');  //'L0df4!B'
   DirFTP:='/bases';
 end;
 }
end;

const
  BASE_TO_ARX     = 0;
  BASE_FROM_ARX   = 1;
  BASE_TO_FTP     = 2;
  BASE_FROM_FTP   = 3;
  DOWNLOAD_SETUP  = 4;
  DOWNLOAD_UPDATE = 5;
  DOWNLOAD_SYSSPR = 6;
  DOWNLOAD_PATH   = 7;
  FILE_TO_FTP     = 8;
  FILE_FROM_FTP   = 9;

//-------------------------------------------------------------------------------------------------------------------------
procedure TfmServiceUpdate.btRunClick(Sender: TObject);
begin
  if FRun then begin
    AbortTransfer:=true;
  end else begin
    if not FRun then begin
      if cbPart.Checked and ((cbType.ItemIndex=BASE_TO_ARX) or (cbType.ItemIndex=BASE_TO_FTP)) and (FFiles='') then begin
        PutError('Для частичного копирования необходимо выбрать файлы.');
        exit;
      end;
      case cbType.ItemIndex of
        BASE_TO_ARX    : BaseToArx;
        BASE_FROM_ARX  : BaseFromArx;
        BASE_TO_FTP    : BaseToFTP;
        BASE_FROM_FTP  : BaseFromFTP;
        DOWNLOAD_SETUP  : DownloadSetup(NAME_SETUP_PROG_, 'Установка');
        DOWNLOAD_UPDATE : DownloadLastUpdate('Обновление');
        DOWNLOAD_SYSSPR : DownloadSysSpr('Обновление');
        DOWNLOAD_PATH   : DownloadSetup(NAME_PATH_PROG_, 'Обновление');
        FILE_TO_FTP     : FileToFTP;
        FILE_FROM_FTP   : FileFromFTP;
      end;
    end;
  end;
end;

//-------------------------------------------------------------------------------------------------------------------------
procedure TfmServiceUpdate.cbTypeChange(Sender: TObject);
begin
  if cbType.ItemIndex<2 then begin
    cbServer.Visible:=false;
    edDir.Visible:=true;
  end else begin
    cbServer.Visible:=true;
    edDir.Visible:=false;
  end;
  case cbType.ItemIndex of
    BASE_TO_ARX,
    BASE_TO_FTP,
    FILE_TO_FTP : lb.Caption:='куда';
  else
    lb.Caption:='откуда';
  end;
  if (cbType.ItemIndex=BASE_TO_ARX) or (cbType.ItemIndex=BASE_TO_FTP) or
     (cbType.ItemIndex=BASE_FROM_ARX) or (cbType.ItemIndex=BASE_FROM_FTP) then begin
    if ((FIdProg='SELSOVET') or (FIdProg='POST')) then begin
      cbXML.Visible:=true;
    end else begin
      cbXML.Visible:=false;
    end;
    cbPart.Visible:=true;
  end else begin
    cbXML.Visible:=false;
    cbPart.Visible:=false;
  end;
  CheckPart;
end;
//-------------------------------------------------------------------------------------------------------------------------
procedure TfmServiceUpdate.cbPartClick(Sender: TObject);
begin
  CheckPart;
end;
//-------------------------------------------------------------------------------------------------------------------------
procedure TfmServiceUpdate.CheckPart;
begin
  if cbPart.Checked then begin
    if (cbType.ItemIndex=BASE_TO_ARX) or (cbType.ItemIndex=BASE_TO_FTP)
      then btSetFiles.Visible:=true
      else btSetFiles.Visible:=false;
  end else begin
    btSetFiles.Visible:=false;
  end;  
end;
//-------------------------------------------------------------------------------------------------------------------------
procedure TfmServiceUpdate.edPathEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  strDir:String;
begin
  strDir:='';
  if SelectDirectory('Путь к базе данных', '', strDir) then begin
    if FileExists(CheckSleshN(strDir) + NameDict) then begin
      edPath.Text:=strDir;
      FPath:=strDir;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------------------------
procedure TfmServiceUpdate.ZipFileProgress(Sender: TObject; FileName: WideString; Progress: Double; Operation: TZFProcessOperation; ProgressPhase: TZFProgressPhase; var Cancel: Boolean);
begin
  SB.Panels[1].Text := ExtractFileName(Filename);
  Application.ProcessMessages;
end;
//-------------------------------------------------------------------------------------------------------------------------
procedure TfmServiceUpdate.btSetFilesClick(Sender: TObject);
var
  f:TfmMultiChoice;
  lErr,lOk:Boolean;
  sFile,s,sVal:String;
  i,n:Integer;
  arr:TArrStrings;
begin
  lOk:=ConnectBase(lErr);
  if lOk then begin
    Query.DatabaseName:=dmBaseConf.AdsConnection.Name;
    Query.SQL.Text:='SELECT * FROM '+SysQuery('SYSTEM.TABLES')+' ORDER BY NAME';
    Query.Open;
    f := TfmMultiChoice.Create(Self);
    while not Query.Eof do begin
//      if  Query.fieldbyName('COMMENT').AsString=''
//        then s:=Query.fieldbyName('NAME').AsString
//        else s:=Query.fieldbyName('COMMENT').AsString;
      s:=Query.fieldbyName('NAME').AsString;
      n:=Pos('//',s);
      if n>0 then s:=Copy(s,1,n-1);
      f.AddValue(Query.fieldbyName('NAME').AsString,s);
      Query.Next;
    end;
    Query.Close;
    f.btOk.Caption:='Установить';
    f.FFieldName:='';
    f.Height:=600;
    f.Caption:='Выберите файлы для копирования';
    sFile:=NameFromExe('open_error');
    if (FFiles='') and FileExists(sFile) then begin
      sVal:='';
      if Problem('Загрузить из списка ошибок открытия ?') then begin
        MemoRead(sFile,s);
        strToArr(s,arr,CRLF,true);
        if Length(arr)>0 then begin
          for i:=Low(arr) to High(arr) do begin
            n:=Pos(' ',arr[i]);
            if n>0
              then s:=Copy(arr[i],1,n-1)
              else s:=arr[i];
            n:=Pos('.',s);
            if n>0 then s:=Copy(s,1,n-1);
            sVal:=sVal+s+',';
          end;
        end;
      end;
    end else begin
      sVal:=FFiles;
    end;
    f.SetValues(sVal, ',');
    if f.ShowModal=mrOk then begin
      FFiles:=f.GetValues;
    end;
    f.Free;
  end;
end;

end.
