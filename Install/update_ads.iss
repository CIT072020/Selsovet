
;#define AppZAGS

[Setup]
Compression=lzma/max
;bzip/9
WizardImageFile=compiler:MY_WIZMODERNIMAGE.BMP
WizardSmallImageFile=compiler:MY_WIZMODERNSMALLIMAGE.BMP
AppName=Обновление "Сельский Совет" ADS
AppVerName=Обновление "Сельский Совет" ADS
AppPublisher=Вадим Чура
UsePreviousAppDir=yes
DefaultDirName={code:GetProgDir}
DisableDirPage=yes
DisableProgramGroupPage=yes
;DiskSliceSize=1400000
;DiskSpanning=yes
OutputBaseFilename=UpdateADS
AlwaysShowDirOnReadyPage=yes
Uninstallable=no

[Languages]
;Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "ru"; MessagesFile: "compiler:Russian.isl"

[Files]
Source: "F:\ADS\TDataSet\Redistribute\*.*"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "F:\Projects\SelSovet\CheckConnect.exe"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
;Source: "F:\ADS\ARC\arc32.exe"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion


[Code]
const
#ifdef AppZAGS
  NameExeProg = 'ZAGS.exe';
  REG_NAME = 'ZAGS';
  PROG_NAME = 'ЗАГС';
#else
  NameExeProg = 'SelSovet.exe';
  REG_NAME = 'SELSOVET';
  PROG_NAME = 'Сельский Совет';
#endif
var
  DataDir: String;
  strVer : String;
  ckBackup : TCheckBox;
  edPassword : TEdit;
  lb : TNewStaticText;
  ProgressPage: TOutputProgressWizardPage;
  strIni : String;
  lUpdateData : Boolean;
  lUpdateSpr  : Boolean;
  lUpdateParam : Boolean;
  lUpdateSysFiles : Boolean;
  ListDir : TStringList;
  strOldUpdate : String;
  lOkBackUp : Boolean;
  PathBackUp : String;
  PathUpdate : String;
  lMainComp  : Boolean;
//---------------------------------------------------
function NotCopy : Boolean;
begin
  Result := false;
end;
function IsMainComp : Boolean;
begin
  Result := lMainComp;
end;
//---------------------------------------------------
procedure PutError( strError : String);
begin
  MsgBox(strError, mbError, MB_OK); //CANCEL);
end;
//---------------------------------------------------
procedure ShowMessage( strSoob : String);
begin
  MsgBox( strSoob, mbInformation, MB_OK);
end;

function CopyDir(strDirSource, strDirDesc, strExclude : String) : Boolean;
var
  sr: TFindRec;
  FileAttrs: Integer;
  strFile : String;
begin
  Result := true;
  strDirSource := AddBackslash(strDirSource);
  strDirDesc   := AddBackslash(strDirDesc);
  strExclude   := UpperCase(strExclude);
  if FindFirst(strDirSource+'*', sr) then  begin
    if not ForceDirectories(strDirDesc) then begin
      PutError(' Ошибка создания пути:'+strDirDesc);
      Result := false;
    end;
    if Result then begin
      DelTree(strDirDesc+'*', false, true, false);
      strFile := sr.Name;
      while strFile<>'' do begin
        if (strFile<>'.') and (strFile<>'..') and
           (sr.Attributes and FILE_ATTRIBUTE_DIRECTORY = 0) then begin
          if Pos(ANSIUpperCase(strFile)+';', strExclude) = 0 then begin
            if not FileCopy(strDirSource+strFile,strDirDesc+strFile, false) then begin
              PutError('Ошибка копирования файла : '+strDirSource+strFile);
              Result := false;
            end else begin
//            if SysAdmin then Readme.Lines.Add('       '+strFile);
            end;
          end;
        end;
        if FindNext(sr)
          then strFile := sr.Name
          else strFile := '';
      end;
    end;
    FindClose(sr);
  end;
end;

procedure DeleteMaskFiles(strMask, strDir : String);
var
  sr: TFindRec;
  FileAttrs: Integer;
  strFile : String;
begin
  strDir := AddBackslash(strDir);
  if FindFirst(strDir+strMask, sr) then  begin
    strFile := sr.Name;
    while strFile<>'' do begin
      if (strFile<>'.') and (strFile<>'..') and
         (sr.Attributes and FILE_ATTRIBUTE_DIRECTORY = 0) then begin
        DeleteFile(strDir+strFile);
      end;
      if FindNext(sr)
        then strFile := sr.Name
        else strFile := '';
    end;
    FindClose(sr);
  end;
end;

//------------------------------
function RunRestore: Boolean;
var
  strPath : String;
  strDef,s : String;
  i,j,n,m : Integer;
  strDir, strNameDir : String;
begin
  Result := true;
  strPath    := AddBackslash( ExpandConstant('{app}') );
  PathBackUp := strPath+'Backup\';
  m:=1;
  n:=6;
  ProgressPage.SetText('Выполнение отката ...', 'Исполняемый модуль.');
  ProgressPage.SetProgress(m, n);
//  MsgBox(' Откат  ', mbInformation, MB_OK);

  m:=m+1;
  if not FileCopy(PathBackUp+NameExeProg, strPath+NameExeProg, false) then begin
    PutError('Ошибка копирования файла : '+PathBackUp+NameExeProg);
    Result := false;
  end;
  if lUpdateSpr then begin
    if Result then begin
      ProgressPage.SetText('Выполнение отката ...', 'Системные справочники.');
      ProgressPage.SetProgress(m, n);
      m:=m+1;
      Result := CopyDir(PathBackUp+'Spr\',strPath+'Spr\', '');
    end;
  end;
  if lUpdateData then begin
    if Result then begin
      ProgressPage.SetText('Выполнение отката ...', 'База данных.');
      ProgressPage.SetProgress(m, n);
      m:=m+1;
      Result := CopyDir( PathBackUp+'Data\', strPath+'Data\', '');
    end;
  end;
  if lUpdateSysFiles then begin
    if Result then begin
      ProgressPage.SetText('Выполнение отката ...', 'Системные файлы.');
      ProgressPage.SetProgress(m, n);
      m:=m+1;
      Result := CopyDir(PathBackUp+'SysFiles\', strPath, NameExeProg+';UpdateProg.exe;');
    end;
  end;
  if Result then begin
    for i:=0 to ListDir.Count-1 do begin
      s := ListDir.Strings[i];
      j:=Pos('=',s);
      strDir     := Copy(s,1,j-1);
      strNameDir := Copy(s,j+1,100);
      ProgressPage.SetText('Выполнение отката ...', strNameDir+'.');
      ProgressPage.SetProgress(m, n);
      m:=m+1;
      Result := CopyDir( PathBackUp+strDir+'\', strPath+strDir+'\', '');
      if not Result then begin
        break;
      end;
    end;
  end;
  if not Result then begin
    PutError(' Не удалось выполнить отмену обновления. ');
  end;
end;
//------------------------------
function RunBackUp: Boolean;
var
  strPath : String;
  strDef,s : String;
  PathBackUp : String;
  i,j,n,m : Integer;
  strDir, strNameDir : String;
begin
  Result := true;
  strPath    := AddBackslash( ExpandConstant('{app}') );
  PathBackUp := strPath+'Backup\';
  DelTree(strPath+'Backup\', true, true, true);
  ForceDirectories(strPath+'Backup\');
  m:=1;
  n:=1;
  if Result then begin
    ProgressPage.SetText('Выполнение...', 'Системные файлы.');
    ProgressPage.SetProgress(m, n);
    m:=m+1;
    Result := CopyDir(strPath, PathBackUp+'SysFiles\', NameExeProg+';UpdateProg.exe;');
  end;
end;
function InitializeSetup(): Boolean;
var
  i : Integer;
  s,ss,strDir : String;
begin
  lOkBackUp := false;
  ListDir := TStringList.Create;
//  ExtractTemporaryFile('update.ini');
//  strIni := ExpandConstant('{tmp}\update.ini');
//  strIni := ExpandConstant('{src}')+'\update'+IDUpdate+'.ini';
  Result := true;
  strDir  := 'C:\';
  DataDir := '';
  if not RegQueryStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'installpath', DataDir) then begin
    Result := false;
    while BrowseForFolder('Выберите папку с программой '+PROG_NAME, strDir, false) do begin
      if FileExists(strDir+'\'+NameExeProg) then begin
        DataDir := strDir;
        Result  := true;
        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'installpath', DataDir)
        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'version', '');
        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'update', '0');
        break;
      end else begin
        MsgBox('Папка выбрана неверно !', mbError, MB_OK);
      end;
    end;
  end;
  //-------------------------------------------------------------------
  lUpdateSysFiles:= true;
  if DataDir='' then begin
    #ifdef AppZAGS
      MsgBox('Каталог для установки обновления программы "ЗАГС" не найден', mbError, MB_OK);
    #else
      MsgBox('Каталог для установки обновления программы "Сельский Совет" не найден', mbError, MB_OK);
    #endif
    Result := false;
  end;
end;

function GetProgDir(DefaultVal : String) :String;
begin
  Result := DataDir;
end;
//---------- необходим или нет запуск программы по обновлению базы или параметров
function IsRunUpdateBase : Boolean;
begin Result := lUpdateData or lUpdateParam; end;
//----------------------------------------
procedure InitializeWizard();
var
  ALeft, ATop, TopInc: Integer;
begin
  ProgressPage := CreateOutputProgressPage('Резервное копирование', '');
  ALeft  := WizardForm.WelcomeLabel2.Left;
  TopInc := WizardForm.CancelButton.Height + 8;
//  ATop   := WizardForm.WelcomeLabel2.Top + WizardForm.WelcomeLabel2.Height - 4*TopInc;
  ATop   := WizardForm.WelcomeLabel2.Top + 180;
  ckBackup := TCheckBox.Create(WizardForm)
  with ckBackup do begin
    Left    := ALeft;
    Top     := ATop;
    Checked := true;
    Width   := WizardForm.ClientWidth; //WizardForm.CancelButton.Width;
//    Height := WizardForm.CancelButton.Height;
    Caption := 'Выполнить резервное копирование';
//    OnClick := ANotifyEvent;
    Parent := WizardForm.WelcomePage;
  end;
  lb := TNewStaticText.Create(WizardForm);
  with lb do begin
    Left    := ALeft;
    Top     := ATop-27;
    Width   := 150;
    Caption := 'Пароль';
    Parent  := WizardForm.WelcomePage;
  end;
  edPassword := TEdit.Create(WizardForm);
  with edPassword do begin
    Left    := ALeft+50;
    Top     := ATop-30;
    PasswordChar := '*';
    Width   := 50; //WizardForm.CancelButton.Width;
//    Height := WizardForm.CancelButton.Height;
    Text := '';
//    OnClick := ANotifyEvent;
    Parent := WizardForm.WelcomePage;
  end;
end;
procedure CurStepChanged(CurStep: TSetupStep);
var
  ResultCode: Integer;
  i : Integer;
  ss : String;
begin
  if CurStep = ssInstall then begin
    if ckBackup.Checked then begin
      ProgressPage.SetProgress(0, 0);
      ProgressPage.Show;
      try
        if RunBackUp then lOkBackUp:=true;
      finally
        ProgressPage.Hide;
      end;
    end;
  end else if CurStep = ssPostInstall then begin
//    if true then begin
    ResultCode := 0;
    if IsRunUpdateBase and lMainComp then begin
      ss := ExpandConstant('{app}\UpdateProg.exe');
      if Exec(ss,'/USR:АДМИНИСТРАТОР /PSW:'+edPassword.Text+' /'+REG_NAME, '', SW_SHOW, ewWaitUntilTerminated, ResultCode) then begin
        if ResultCode <> 0 then begin
          MsgBox('Ошибка установки обновления: '+IntToStr(ResultCode), mbInformation, mb_Ok);
        end;
      end else begin
        ResultCode := 1;
        MsgBox('UpdateProg.exe :'+SysErrorMessage(ResultCode), mbInformation, mb_Ok);
      end;
//      ResultCode:=1;
      if ResultCode<>0 then begin
        if ckBackup.Checked and lOkBackUp then begin
//          WizardForm.FINISHEDHEADINGLABEL := '###########';
          ProgressPage.Caption := 'Восстановление из резервной копии';
          ProgressPage.SetProgress(0, 0);
          ProgressPage.Show;
          try
            RunRestore;
          finally
            ProgressPage.Hide;
          end;
        end;
      end;
    end;
    if ResultCode=0 then begin
      PathUpdate := AddBackslash( ExpandConstant('{app}') )+'Update\';
      DelTree(PathUpdate+'*', False, True, True);
      DeleteMaskFiles('OpisFilter*.ini',AddBackslash(ExpandConstant('{app}'))+'Service\');
      if lMainComp then begin
        DeleteMaskFiles('*.bak',AddBackslash(ExpandConstant('{app}'))+'Data\');
      end;
      RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'update', '');
      RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'version', '');
    end;
  end;
end;
function NextButtonClick(CurPage: Integer): Boolean;
var
  ResultCode : Integer;
  ss : String;
begin
  Result := True;
  if CurPage = wpWelcome then begin
    ExtractTemporaryFile('CheckConnect.exe');
    ss := ExpandConstant('{tmp}\CheckConnect.exe');
    if FileCopy(ss, DataDir + '\CheckConnect.exe', false) then begin
      ss := DataDir + '\CheckConnect.exe';
//      MsgBox(ss + ' АДМИНИСТРАТОР '+edPassword.Text+' ЛицевыеСчета show', mbInformation, mb_Ok);
      if Exec(ss,'АДМИНИСТРАТОР '+Trim(edPassword.Text)+' ЛицевыеСчета', '',
         SW_HIDE, ewWaitUntilTerminated, ResultCode) then begin
//      MsgBox(IntToStr(ResultCode), mbInformation, mb_Ok);
        if ResultCode <> 0 then begin
          Result := false;
          if ResultCode = 9999 then begin
            MsgBox('Невозможно монопольно подключиться к базе данных.', mbError, mb_Ok);
          end else begin
            MsgBox('Ошибка подключения к базе данных.', mbError, mb_Ok);
          end;
        end;
      end else begin
        MsgBox('CheckConnect.exe :'+SysErrorMessage(ResultCode), mbError, mb_Ok);
        Result := false;
      end;
    end;
  end;
end;

[Run]
;Filename: "{app}\SelSovet.exe"; Description: "Сельский Совет"; Flags: nowait postinstall skipifsilent
;Filename: "{app}\UpdateProg.exe"; Flags: nowait postinstall skipifsilent; Check: IsRunUpdateBase;
;Filename: "{app}\INIT.EXE"; Parameters: "/x"

