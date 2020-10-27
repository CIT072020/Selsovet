unit fMainConf;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  adscnnct, adsdictionary, dBaseConf, TB2Item, ActnList, ImgList, TB2Dock,
  FuncPr, uUtilFiles, SasaIniFile, ExtCtrls, StdCtrls,FileCtrl
  {$IFDEF VER150} ,Variants {$ENDIF}
  ,MetaTask,CheckDictionary,adsset, IdBaseComponent, IdAntiFreezeBase,
  IdAntiFreeze;

type
  TTypeChange = (chUpdate, chRestore);

  TUpdate = ( upExe, upSysFiles, upBase, upSysSpr, upDir, upParams, upScriptPas);
  TUpdates = set of TUpdate;

  TfmMainConf = class(TForm)
    pnMain: TPanel;
    btOk: TButton;
    btCancel: TButton;
    Readme: TMemo;
    IdAntiFreeze1: TIdAntiFreeze;
    procedure acRunUpdateExecute(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    ch : TCheckDictionary;
    FSystemPassword: String;
    FPathUpdate: String;
    FTypeChange: TTypeChange;
    FPathBackUp: String;
    FSysAdmin: Boolean;
    FScriptFile: String;
    FShowMessage : Boolean;
//    FError : Boolean;
    procedure SetSystemPassword(const Value: String);
    procedure SetPathUpdate(const Value: String);
    procedure SetTypeChange(const Value: TTypeChange);
    function SimpleConnectC( Conn : TAdsConnection ) : Boolean;
    function SimpleConnectD( Dict : TAdsDictionary ) : Boolean;
    procedure SetPathBackUp(const Value: String);
    function CheckExclusiveBase : Boolean;
    procedure SetSysAdmin(const Value: Boolean);
    procedure SetScriptFile(const Value: String);

  public
    Ini : TSasaIniFile;
    IDUpdate   : String;
    NameUpdate : String;
    DateUpdate : TDateTime;
    EnabledUpdate : TUpdates;
    ListDir : TStringList;
    UpdateFiles : TStringList;
    DeleteFiles : TStringList;
    property SysAdmin : Boolean read FSysAdmin write SetSysAdmin;
    property TypeChange : TTypeChange read FTypeChange write SetTypeChange;
    property PathUpdate : String read FPathUpdate write SetPathUpdate;
    property PathBackUp : String read FPathBackUp write SetPathBackUp;
    property SystemPassword : String read FSystemPassword write SetSystemPassword;
    property ScriptFile : String read FScriptFile write SetScriptFile;
    function OpenOneConnect( Conn : TAdsConnection; var strErr : String ) : Boolean;
    procedure CheckUpdate;
    procedure CreateReadme;
//    function RunBackUp : Boolean;
    function RunUpdate : Boolean;
    function RunUpdateBase : Boolean;
    function RunTest: Boolean;
//    function RunRestore : Boolean;
    function CopyDir(strDirSource, strDirDesc, strExclude : String) : Boolean;
    procedure UpdateObrabotkaINI;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
  end;

var
  fmMainConf: TfmMainConf;

implementation

{$R *.DFM}

{ TfmMainConf }

constructor TfmMainConf.Create(Owner: TComponent);
begin
  inherited;
  FSysAdmin := true;
  ListDir := TStringList.Create;
  UpdateFiles := TStringList.Create;
  DeleteFiles := TStringList.Create;
  FTypeChange := chUpdate;
  FShowMessage := true;
end;

destructor TfmMainConf.Destroy;
begin
  Ini.Free;
  ListDir.Free;
  UpdateFiles.Free;
  DeleteFiles.Free;
  inherited;
end;

function TfmMainConf.OpenOneConnect(Conn: TAdsConnection; var strErr : String): Boolean;
begin
  Result := true;
end;

procedure TfmMainConf.SetSystemPassword(const Value: String);
begin
  FSystemPassword := Value;
end;

procedure TfmMainConf.SetPathUpdate(const Value: String);
begin
  FPathUpdate := Value;
end;

//---------------------------------------------------
function TfmMainConf.CheckExclusiveBase : Boolean;
begin
  Result := true;
  dmBaseConf.AdsConnection.IsConnected:=true;
  with dmBaseConf.WorkTable do begin
    TableName := 'ЛицевыеСчета';
    Active    := false;
    Exclusive := true;
    try
      Active := true;
    except
      Result := false;
      PutError(' Невозможно монопольно подключиться к базе.'#13+
               'Возможно с базой работают пользователи');
    end;
    Active := false;
  end;
  dmBaseConf.AdsConnection.IsConnected:=false;
end;

procedure TfmMainConf.CheckUpdate;
var
  strPath,s,strDir : String;
  i,j : Integer;
  sl, slF : TStringList;
begin
  ScriptFile := '';
  dmBaseConf.SimpleDisconnect;
  strPath := CheckSleshN(ExtractFilePath(Application.ExeName));
//  strPath := CheckSleshN(dmBaseConf.AdsConnection.ConnectPath);
//  strPath := Copy(strPath,1,Length(strPath)-1);
//  i := LastPos('\',strPath);
//  strPath := Copy(strPath,1,i)+'Update\';
  PathUpdate := strPath+'Update\';
  PathBackUp := strPath+'BackUp\';
  // переменная из модуля FuncPr
  FuncPr.NameFileBusy := PathUpdate + 'busy.avi';

  if TypeChange = chUpdate then begin
    Ini := TSasaIniFile.Create(PathUpdate+'update.ini');
  end else begin
    Ini := TSasaIniFile.Create(PathBackUp+'update.ini');
  end;
  IDUpdate   := Ini.ReadString('MAIN','ID','');
  DateUpdate := STOD(Ini.ReadString('MAIN','DATE','1899-12-30'),tdAds);
  NameUpdate := Ini.ReadString('MAIN','NAME','Обновление');
  EnabledUpdate := [];
  ListDir.Clear;
  if dmBaseConf.IsMainComputer then begin
    if Ini.ReadBool('MAIN','Data',false) then begin
      EnabledUpdate := EnabledUpdate + [upBase];
    end;
    if Ini.ReadBool('MAIN','SysSpr',false) then begin
      EnabledUpdate := EnabledUpdate + [upSysSpr];
    end;
  end;
  if Ini.ReadBool('MAIN','Exe',false) then begin
    EnabledUpdate := EnabledUpdate + [upExe];
  end;
  if Ini.ReadBool('MAIN','Params',false) then begin
    EnabledUpdate := EnabledUpdate + [upParams];
  end;
  if Ini.ReadBool('MAIN','SysFiles',false) then begin
    EnabledUpdate := EnabledUpdate + [upSysFiles];
  end;
  s := Ini.ReadString('SCRIPTS','PAS','');
  if s <> '' then begin
    EnabledUpdate := EnabledUpdate + [upScriptPas];
    ScriptFile := PathUpdate + s;
  end;
  if Ini.ReadBool('MAIN','Dir',false) then begin
    EnabledUpdate := EnabledUpdate + [upDir];
    sl  := TStringList.Create;
    slF := TStringList.Create;
    Ini.ReadSectionValues('DIR', sl);
    for i:=0 to sl.Count-1 do begin
      if sl.Values[sl.Names[i]]='1' then begin
        strDir := sl.Names[i];
        ListDir.Add(strDir+'='+Ini.ReadString('DirName',strDir,strDir));
        slF.Clear;
        Ini.ReadSectionValues(strDir+'.Update',slF);
        s:='';
        for j:=0 to slF.Count-1 do begin
          s := s+slF.Strings[j]+';';
        end;
        if s<>''
          then UpdateFiles.Add(strDir+'='+s);
        slF.Clear;
        Ini.ReadSectionValues(strDir+'.Delete',slF);
        s:='';
        for j:=0 to slF.Count-1 do begin
          s := s+slF.Strings[j]+';';
        end;
        if s<>''
          then DeleteFiles.Add(strDir+'='+s);
      end;
    end;
    sl.Free;
    slF.Free;
  end;
end;

procedure TfmMainConf.CreateReadme;
var
  s,strDir,strNameDir : String;
  i : Integer;
begin
  Readme.Clear;
  Readme.ReadOnly:=false;
  if EnabledUpdate=[] then begin
    if TypeChange = chUpdate
      then Readme.Lines.Add(' Нет доступных обновлений. ')
      else Readme.Lines.Add(' Нет возможности отката. ');
    btOk.Enabled:=false;
    btCancel.Caption:='Выход';
//    cbBackup.Enabled:=false;
//    ActiveControl := btCancel;
  end else begin
//    ActiveControl := btOk;
    if TypeChange = chRestore then begin
      Readme.Lines.Add('Откат обновления. ');
      Readme.Lines.Add('');
    end;
    s := 'Дата обновления: '+DatePropis(DateUpdate,1);
    Readme.Lines.Add(s);
    if NameUpdate<>''
      then Readme.Lines.Add(NameUpdate);
    if upExe in EnabledUpdate then begin
      Readme.Lines.Add(' *  исполняемый модуль');
    end;
    if upSysFiles in EnabledUpdate then begin
      Readme.Lines.Add(' *  системные файлы');
    end;
    if upParams in EnabledUpdate then begin
      Readme.Lines.Add(' *  файл параметров');
    end;
    if upBase in EnabledUpdate then begin
      Readme.Lines.Add(' *  изменение структуры базы');
    end;
    if upSysSpr in EnabledUpdate then begin
      Readme.Lines.Add(' *  системные справочники');
    end;
    if upDir in EnabledUpdate then begin
      for i:=0 to ListDir.Count-1 do begin
        strDir     := ListDir.Names[i];
        strNameDir := ListDir.Values[strDir];
        Readme.Lines.Add(' *  '+strNameDir);
      end;
    end;
  end;
  Readme.ReadOnly:=true;
end;

//---------------------------------------------------
procedure TfmMainConf.acRunUpdateExecute(Sender: TObject);
begin
//  RunVigrOch(true);
end;
{
procedure TfmMainConf.acRunUpdateExecute(Sender: TObject);
begin
  if CheckExclusiveBase then begin
    if TypeChange = chUpdate then begin
//      if RunBackUp then begin
        if not RunUpdate then begin
          TypeChange := chRestore;
        end else begin
          btOk.Enabled := false;
//          cbBackup.Enabled := false;
          btCancel.Caption:='Выход';
          Readme.Lines.Add('');
          Readme.Lines.Add('Обновление установлено успешно.');
        end;
//      end;
    end else begin
      PutError('  Выполнение отката из данной программы невозможно. ');
    end;
    CloseMessage();
  end;
end;
}

procedure TfmMainConf.btCancelClick(Sender: TObject);
begin
  if btOk.Enabled and (TypeChange=chUpdate) then begin
    if Problem(' Вы хотите отказаться от установки обновления ? ') then begin
      Close;
    end;
  end else begin
    Close;
  end;
end;

//---------------------------------------------------
function TfmMainConf.CopyDir(strDirSource, strDirDesc, strExclude : String) : Boolean;
var
  sr: TSearchRec;
  FileAttrs: Integer;
  strFile : String;
begin
  Result := true;
  CheckSlesh(strDirSource);
  CheckSlesh(strDirDesc);
  FileAttrs := faReadOnly+faArchive+faHidden;//+faAnyFile;
  strExclude := ANSIUpperCase(strExclude);
  if SysAdmin then Readme.Lines.Add('Копирование: '+strDirSource+' -> '+strDirDesc);
  if FindFirst(strDirSource+'*', FileAttrs, sr) = 0 then  begin
    if not ForceDirectories(strDirDesc) then begin
      PutError(' Ошибка создания пути:'+strDirDesc);
      Result := false;
    end;
    if Result then begin
      strFile := sr.Name;
      while strFile<>'' do begin
        if Pos(ANSIUpperCase(strFile)+';', strExclude) = 0 then begin
          if not CopyFile(PChar(strDirSource+strFile),
                          PChar(strDirDesc+strFile), false) then begin
            PutError('Ошибка копирования файла : '+strDirSource+strFile+
                    #13+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
            Result := false;
          end else begin
            if SysAdmin then Readme.Lines.Add('       '+strFile);
          end;
        end;
        if FindNext(sr)=0
          then strFile := sr.Name
          else strFile := '';
      end;
    end;
    FindClose(sr);
  end;
end;

function TfmMainConf.SimpleConnectD( Dict : TAdsDictionary ) : Boolean;
begin
  Result := true;
end;

function TfmMainConf.SimpleConnectC( Conn : TAdsConnection ) : Boolean;
var
  strErr : String;
begin
  Result := true;
  strErr := '';
  try
    Conn.IsConnected := true;
  except
    on E:Exception do begin
      Result := false;
      if Pos('7078', E.Message) > 0 then begin
        strErr := ' Неправильное имя пользователя или пароль ! ';
      end else if Pos('6420', E.Message) > 0 then begin
        strErr := ' Ошибка подклюления к серверу базы данных ! ';
      end else begin
        strErr := E.Message;
      end;
    end;
  end;
  if not Result then begin
    PutError(strErr);
  end;
end;

function TfmMainConf.RunUpdateBase: Boolean;
var
  sl,slTb,slDebug : TStringList;
  strPassword, strUserName,s : String;
  ss : String;
  arr : TArrStrings;
  i : Integer;
  val : Variant;
begin
  Result:=true;
  slDebug:=TStringList.Create;
  with dmBaseConf do begin
    strPassword := AdsConnection.Password;
    strUserName := AdsConnection.UserName;

    if Result then begin
      NewConn.Password := strPassword;
      NewConn.UserName := strUserName;
      NewConn.AdsServerTypes := AdsConnection.AdsServerTypes;
//      NewConn.ConnectPath := dmBaseConf.GetPathNewConnect;
//      NewConn.ConnectPath := PathUpdate+'Data\'+NAME_DATA_DICT;
      Result := SimpleConnectC(NewConn);
    end;

    if Result then begin
      NewDict.Password := strPassword;
      NewDict.UserName := strUserName;
      NewDict.AdsServerTypes := AdsConnection.AdsServerTypes;
//      NewDict.ConnectPath := dmBaseConf.GetPathNewConnect;
//      Result := SimpleConnectD(NewDict);
    end;

    if Result then begin
      AdsDictionary.Password := strPassword;
      AdsDictionary.UserName := strUserName;
      AdsDictionary.ConnectPath := AdsConnection.ConnectPath;
      AdsDictionary.AdsServerTypes := AdsConnection.AdsServerTypes;

//      AdsDictionary.IsConnected := true;
//      Result := SimpleConnectD(AdsDictionary);
    end;
  end;

  if Result then begin
    sl   := TStringList.Create;
    slTb := TStringList.Create;
//    slDebug.Add('NEW:'+dmBaseConf.NewDict.ConnectPath);
//    slDebug.Add('CUR:'+dmBaseConf.AdsDictionary.ConnectPath);
    ch := TCheckDictionary.Create(dmBaseConf.NewDict,
                                  dmBaseConf.AdsDictionary);
    if Copy(dmBaseConf.WorkTable.Version,1,1)='8'
      then ch.ADS10:=false
      else ch.ADS10:=true;

    ch.CurConnect:=dmBaseConf.AdsConnection;
    ch.NewConnect:=dmBaseConf.NewConn;
//    showmessage(dmBaseConf.NewConn.ConnectPath+'  '+dmBaseConf.AdsConnection.ConnectPath);
    ch.EnabledCheckObjects:=[coScript];
    ch.ShowCheck:=true;
    ch.CheckDataBase;
    ch.GetScript( sl );
    ch.GetCreateTables( slTb );
    for i:=0 to slTb.Count-1 do begin
      // таблица сцществует, а мы будем пытаться ее создать
      // значит нужно ее сначала удалить
      if FileExists(dmBaseConf.GetCurPath + slTb.Strings[i] + '.adt') then begin
        DeleteFile(dmBaseConf.GetCurPath + slTb.Strings[i] + '.adt');
        DeleteFile(dmBaseConf.GetCurPath + slTb.Strings[i] + '.adi');
        DeleteFile(dmBaseConf.GetCurPath + slTb.Strings[i] + '.adm');
      end;
    end;
    if SysAdmin then begin
      Readme.Lines.Add('AdsConnection.ConnectPath='+dmBaseConf.AdsConnection.ConnectPath);
      Readme.Lines.Add('AdsDictionary.ConnectPath='+dmBaseConf.AdsDictionary.ConnectPath);
      Readme.Lines.Add('NewConn.ConnectPath='+dmBaseConf.NewConn.ConnectPath);
      Readme.Lines.Add('NewDicti.ConnectPath='+dmBaseConf.NewDict.ConnectPath);
      Readme.Lines.Add(InttoStr(sl.Count));
      for i:=0 to sl.Count-1 do begin
        Readme.Lines.Add(sl.Strings[i]);
      end;
      ss := '';
      for i:=0 to Readme.Lines.Count-1 do begin
        ss := ss + '"'+Readme.Lines[i]+'",';
      end;
      ShowStrings( Readme.Lines,'');
      Application.ProcessMessages;
    end;

    ss := sl.Text;
    StrToArr(ss,arr,'-- /////',true);

    for i:=Low(arr) to High(arr) do begin
//      ShowMessage(arr[i]);
      ChangeMessage('Изменение структуры базы'#13'  Шаг '+IntToStr(i+1)+
                   '  из  '+IntToStr(High(arr)+1));
      try
//        Readme.Clear;
//        Readme.Lines.Add(arr[i]);
        dmBaseConf.AdsConnection.Execute(arr[i]);
      except
        on E:Exception do begin
          Result := false;
          PutError(E.Message+#13+arr[i]);
          break;
        end;
      end;
    end;
//    Readme.Clear;
//    Readme.Lines.Assign(sl);

    ch.ShowCheck := false;
    ch.Free;
    sl.Free;
    slTb.Free;
    ch := nil;
  end;

  if (ScriptFile<>'') and Result then begin
    val := null;
    GlobalTask.Script.RunEx('AFTERUPDATE',[],val);
    if (val <> null) and (VarType(val)<>varEmpty) then begin
      if VarToStr(val) <> '0' then begin
        Result := false;
      end;
    end;
  end;

  with dmBaseConf do begin
    NewConn.IsConnected := false;
    NewDict.IsConnected := false;
    AdsDictionary.IsConnected := false;
    AdsConnection.IsConnected := false;
  end;
  slDebug.Free;
end;

function TfmMainConf.RunTest: Boolean;
var
  sl : TStringList;
  strPassword, strUserName : String;
  ss : String;
  arr : TArrStrings;
  i : Integer;
begin
  with dmBaseConf do begin
    strPassword := AdsConnection.Password;
    strUserName := AdsConnection.UserName;

    Result := SimpleConnectC(AdsConnection);

    if Result then begin
      NewConn.Password := strPassword;
      NewConn.UserName := strUserName;
//      NewConn.ConnectPath := dmBaseConf.GetPathNewConnect;
//      NewConn.ConnectPath := PathUpdate+'Data\'+NAME_DATA_DICT;
      Result := SimpleConnectC(NewConn);
    end;

    if Result then begin
      NewDict.Password := strPassword;
      NewDict.UserName := strUserName;
//      NewDict.ConnectPath := dmBaseConf.GetPathNewConnect;
      Result := SimpleConnectD(NewDict);
    end;

    if Result then begin
      AdsDictionary.Password := strPassword;
      AdsDictionary.UserName := strUserName;
      AdsDictionary.ConnectPath := AdsConnection.ConnectPath;
      AdsDictionary.IsConnected := true;
      Result := SimpleConnectD(AdsDictionary);
    end;
  end;
end;

//-----------------------------------------------------
function TfmMainConf.RunUpdate: Boolean;
var
  strPath : String;
  strDef : String;
//  i,j : Integer;
  strDir, strNameDir,
  s, strFile, strErr : String;
  arr : TArrStrings;
begin

  Result := true;
  if (TypeChange=chUpdate) then begin
    strPath := CheckSleshN(ExtractFilePath(Application.ExeName));
    strDef := ' Обновление файлов задачи.       ';
    if FShowMessage then
      OpenMessage(strDef+#13,'Подождите пожалуйста...');
    if Result then begin
      UpdateObrabotkaINI;
    end;
    if Result and (upParams in EnabledUpdate) then begin
      if not GlobalTask.UpdateParameters( PathUpdate + 'NewParams.tsk', true) then begin
      end;
    end;
    if Result and (upBase in EnabledUpdate) then begin
      if FShowMessage then
        ChangeMessage(strDef+#13'   База данных');
      Result := RunUpdateBase;
    end;
    CloseMessage();
  end;
end;

//-----------------------------------------------------
{
function TfmMainConf.RunBackUp: Boolean;
var
  strPath : String;
  strDef : String;
  i : Integer;
  strDir, strNameDir : String;
begin
  Result := true;
  if (TypeChange=chUpdate) and cbBackup.Checked then begin
    strPath := CheckSleshN(ExtractFilePath(Application.ExeName));
    strDef := ' Создание резервной копии изменяемых файлов.';
    OpenMessage(strDef+#13'Копируются файлы','Подождите пожалуйста...');
    ChangeMessage(strDef+#13'   Удаление предыдущей копии.');
    ClearDir(PathBackUp,true); // then begin
//      CloseMessage();
//      PutError('  Ошибка удаления. ');
//      Result := false;
//      exit;
//    end;
    ForceDirectories(PathBackUp);
    if not CopyFile(PChar(PathUpdate+'update.ini'),
                    PChar(PathBackUp+'update.ini'), false) then begin
      PutError('Ошибка копирования файла : '+PathUpdate+'update.ini'+
              #13+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
      Result := false;
    end;
    if Result and (upExe in EnabledUpdate) then begin
      ChangeMessage(strDef+#13'   SelSovet.exe');
      if not CopyFile(PChar(strPath+'SelSovet.exe'),
                      PChar(PathBackUp+'SelSovet.exe'), false) then begin
        PutError('Ошибка копирования файла : '+strPath+'SelSovet.exe'+
                #13+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
        Result := false;
      end;
    end;
    if Result and (upSysSpr in EnabledUpdate) then begin
      ChangeMessage(strDef+#13'   Системные справочники');
      Result := CopyDir(strPath+'Spr\',PathBackUp+'Spr\','');
    end;
    if Result and (upBase in EnabledUpdate) then begin
      ChangeMessage(strDef+#13'   База данных');
      Result := CopyDir( strPath+'Data\', PathBackUp+'Data\','');
    end;
    if Result and (upSysFiles in EnabledUpdate) then begin
      ChangeMessage(strDef+#13'   Системные файлы');
      Result := CopyDir(strPath, PathBackUp+'SysFiles\', 'SelSovet.exe;UpdateSelSovet.exe;');
    end;
    if Result and (upDir in EnabledUpdate) then begin
      for i:=0 to ListDir.Count-1 do begin
        strDir     := ListDir.Names[i];
        strNameDir := ListDir.Values[strDir];
        ChangeMessage(strDef+#13'   '+ANSIUpperCase(Copy(strNameDir,1,1))+ANSILowerCase(Copy(strNameDir,2,100)));
        Result := CopyDir(strPath+strDir+'\',PathBackUp+strDir+'\','');
        if not Result then begin
          break;
        end;
      end;
    end;
//    Result := false;
//    PutError(' Не удалось выполнить резервное копирование.');
  end;
end;
}
//-----------------------------------------------------
{
function TfmMainConf.RunRestore: Boolean;
var
  strPathS, strPathD : String;
  strDef : String;
  i : Integer;       
  strDir, strNameDir : String;
begin
  Result := true;
  strPathS := PathBackUp;
  strPathD := CheckSleshN(ExtractFilePath(Application.ExeName));

  strDef := ' Восстановление предыдущего состояния.';
  OpenMessage(strDef+#13'Копируются файлы','Подождите пожалуйста...');
//    ChangeMessage(strDef+#13'   Удаление предыдущей копии.');
//    ClearDir(strPath+'BackUp\',true); // then begin
  if Result and (upExe in EnabledUpdate) then begin
    ChangeMessage(strDef+#13'   SelSovet.exe');
    if not CopyFile(PChar(strPathS+'SelSovet.exe'),
                    PChar(strPathD+'SelSovet.exe'), false) then begin
      PutError('Ошибка копирования файла : '+strPathS+'SelSovet.exe'+
              #13+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
      Result := false;
    end;
  end;
  if Result and (upSysSpr in EnabledUpdate) then begin
    ChangeMessage(strDef+#13'   Системные справочники');
    if FileExists(strPathS+'Spr\SysSpr.add') then begin
      ClearDir(strPathD+'Spr\',false);
      Result := CopyDir(strPathS+'Spr\',strPathD+'Spr\','');
    end;
  end;
  if Result and (upBase in EnabledUpdate) then begin
    ChangeMessage(strDef+#13'   База данных');
    ClearDir(strPathD+'Data\',false);
    Result := CopyDir(strPathS+'Data\',strPathD+'Data\','');
  end;
  if Result and (upSysFiles in EnabledUpdate) then begin
    ChangeMessage(strDef+#13'   Системные файлы');
    Result := CopyDir(strPathS+'SysFiles\',strPathD, '');
  end;
  if Result and (upDir in EnabledUpdate) then begin
    for i:=0 to ListDir.Count-1 do begin
      strDir     := ListDir.Names[i];
      strNameDir := ListDir.Values[strDir];
      ChangeMessage(strDef+#13'   '+ANSIUpperCase(Copy(strNameDir,1,1))+ANSILowerCase(Copy(strNameDir,2,100)));
      ClearDir(strPathD+strDir,false);
      Result := CopyDir(strPathS+strDir+'\',strPathD+strDir+'\','');
      if not Result then begin
        break;
      end;
    end;
  end;
  if Result
    then ClearDir(PathBackUp,true);
end;
}
procedure TfmMainConf.SetTypeChange(const Value: TTypeChange);
begin
  FTypeChange := Value;
  if FTypeChange = chRestore then begin
    btOk.Caption := 'Выполнить';
    Caption := 'Выполнить отмену обновления задачи "Сельский Совет"';
//    cbBackup.Visible:=false;
  end;
end;

procedure TfmMainConf.SetPathBackUp(const Value: String);
begin
  FPathBackUp := Value;
end;

procedure TfmMainConf.SetSysAdmin(const Value: Boolean);
begin
  FSysAdmin := Value;
end;

procedure TfmMainConf.SetScriptFile(const Value: String);
begin
  FScriptFile := Value;
end;

procedure TfmMainConf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfmMainConf.UpdateObrabotkaINI;
var
  strFileObr : String;
  iniNew, iniOld : TSasaIniFile;
  slSections : TStringList;
  i : Integer;
  strVerNew, strVerOld, strCount : String;
  lUpdate : Boolean;
begin
  lUpdate := false;
  if strTypeBase='ZAGS' then begin
    strFileObr := 'ObrabotkaZags.ini';
  end else if strTypeBase='OCHERED' then begin
    strFileObr := 'ObrabotkaOchered.ini';
  end else if strTypeBase='GKH' then begin
    strFileObr := 'ObrabotkaGKH.ini';
  end else if strTypeBase='ZAH' then begin
    strFileObr := 'ObrabotkaZah.ini';
  end else if strTypeBase='OPEKA' then begin
    strFileObr := 'ObrabotkaOpeka.ini';
  end else begin
    strFileObr := 'Obrabotka.ini';
  end;
  // если есть копия старой версии файла
  if FileExists(PathUpdate+strFileObr) then begin
    slSections := TStringList.Create;
    iniNew := TSasaIniFile.Create(GlobalTask.PathService+strFileObr);
    iniOld := TSasaIniFile.Create(PathUpdate+strFileObr);
    iniNew.ReadSections(slSections);
    for i:=0 to slSections.Count-1 do begin      
      strVerNew := iniNew.ReadString(slSections.Strings[i],'VERSION','1');
      if iniOld.SectionExists(slSections.Strings[i]) then begin
        strVerOld := iniOld.ReadString(slSections.Strings[i],'VERSION','1');
        if strVerOld = strVerNew then begin
          strCount := iniOld.ReadString(slSections.Strings[i],'RUNCOUNT','0');
          iniNew.WriteString(slSections.Strings[i],'RUNCOUNT',strCount);
          lUpdate := true;
        end else begin
          iniNew.WriteString(slSections.Strings[i],'RUNCOUNT','0');
          lUpdate := true;
        end;
      end else begin
        iniNew.WriteString(slSections.Strings[i],'RUNCOUNT','0');
        lUpdate := true;
      end;
    end;
    if lUpdate then begin
      iniNew.UpdateFile;
    end;
    iniNew.Free;
    iniOld.Free;
    slSections.Free;
  end;
end;

end.
