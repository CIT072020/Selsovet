
;#define AppZAGS

[Setup]
Compression=lzma/max
;bzip/9
WizardImageFile=compiler:MY_WIZMODERNIMAGE.BMP
WizardSmallImageFile=compiler:MY_WIZMODERNSMALLIMAGE.BMP
#ifdef AppZAGS
  AppName=Заплатка "ЗАГС"
  AppVerName=Заплатка "ЗАГС"
#else
  AppName=Заплатка "ЛАИС"
  AppVerName=Заплатка "ЛАИС" для обновления 135
#endif
AppPublisher=Государственное предприятие "ЦИТ Белстата" e-mail:vc_bous@brest.by
UsePreviousAppDir=yes
DefaultDirName={code:GetProgDir}
#ifdef AppZAGS
  DefaultGroupName=ЗАГС
#else
  DefaultGroupName=ЛАИС
#endif
DisableDirPage=yes
DisableProgramGroupPage=yes
;DiskSliceSize=1400000
;DiskSpanning=yes
#ifdef AppZAGS
OutputBaseFilename=PathZAGS134-1
#else
OutputBaseFilename=PathLAIS135-1
#endif
AlwaysShowDirOnReadyPage=yes
Uninstallable=no

[Languages]
;Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "ru"; MessagesFile: "compiler:Russian.isl"

[Files]
Source: "E:\Projects\SelSovet7\Update_Params\*.*"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion;

[InstallDelete]
;Type: files; Name:"{app}\report\Empty.frf"


[Registry]
;root:HKCU;subkey:"Software\VCBOUS\SELSOVET";valuetype:string;valuename:"update";valuedata:"1"; Flags: uninsdeletevalue

[Run]
;Filename: "{app}\Doc\Описание расчета паспорта.doc"; Description: "Посмотреть описание расчета паспорта"; Flags: postinstall shellexec skipifsilent

[Code]
const
  IDPath = '1';
  IDProg   = '5.6.0';
#ifdef AppZAGS
  NameExeProg = 'ZAGS.exe';
  REG_NAME = 'ZAGS';
  PROG_NAME = 'ЗАГС';
#else
  NameExeProg = 'LAIS.exe';
  REG_NAME = 'LAIS';
  PROG_NAME = 'ЛАИС';
#endif
var
  DataDir: String;
  strCurVer : String;
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
function InitializeSetup(): Boolean;
var
//  i : Integer;
//  s,ss,
  strDir : String;
begin
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
        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'version', IDProg);
        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'update', '0');
        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'path', '0');
        break;
      end else begin
        MsgBox('Папка выбрана неверно !', mbError, MB_OK);
      end;
    end;
  end;
  //-------- определение необходимости установки заплатки --------
  if RegQueryStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'version', strCurVer) then begin
    try
      if strCurVer <> IDProg then begin
        MsgBox(' Заплатка предназначена для версии программы <'+IDProg+'> ! ', mbInformation, MB_OK);
        Result := false;
      end;
    except
    end;
  end;
  //-------------------------------------------------------------------
  if Result then begin
    if DataDir<>'' then begin
      lMainComp := GetIniBool('ADMIN', 'MAINCOMP', true, AddBackSlash(DataDir)+'SysParams.ini');
      Result := true;
      if DataDir='' then begin
        #ifdef AppZAGS
          MsgBox('Каталог для установки заплатки программы "ЗАГС" не найден', mbError, MB_OK);
        #else
          MsgBox('Каталог для установки заплатки программы "ЛАИС" не найден', mbError, MB_OK);
        #endif
        Result := false;
      end else begin
//      if GetVersionNumbersString(DataDir+'\'+NameExeProg, strVer) then begin
//        MsgBox('Текущая версия программы:'+strVer, mbInformation, mb_Ok);
//      end;
      end;
    end else begin
      #ifdef AppZAGS
        MsgBox('Каталог для установки заплатки программы "ЗАГС" не найден', mbError, MB_OK);
      #else
        MsgBox('Каталог для установки заплатки программы "ЛАИС" не найден', mbError, MB_OK);
      #endif
      Result := false;
    end;
  end;
end;

function GetProgDir(DefaultVal : String) :String;
begin
  Result := DataDir;
end;

procedure InitializeWizard();
begin
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  ResultCode: Integer;
//  i : Integer;
  ss : String;
begin
  if CurStep = ssInstall then begin
  end else if CurStep = ssPostInstall then begin
    ss := ExpandConstant('{app}\UpdateProg.exe');
    if Exec(ss,'/USR:ADSSYS /PSW:sysdba'+' /'+REG_NAME, '', SW_SHOW, ewWaitUntilTerminated, ResultCode) then begin
      if ResultCode <> 0 then begin
        MsgBox('Ошибка установки обновления: '+IntToStr(ResultCode), mbInformation, mb_Ok);
      end;
    end else begin
      ResultCode := 1;
      MsgBox('UpdateProg.exe :'+SysErrorMessage(ResultCode), mbInformation, mb_Ok);
    end;
  end;
end;

function NextButtonClick(CurPage: Integer): Boolean;
begin
  Result := True;
  if CurPage = wpWelcome then begin

  end;
end;

[Run]
;Filename: "{app}\SelSovet.exe"; Description: "Сельский Совет"; Flags: nowait postinstall skipifsilent
;Filename: "{app}\UpdateProg.exe"; Flags: nowait postinstall skipifsilent; Check: IsRunUpdateBase;
;Filename: "{app}\INIT.EXE"; Parameters: "/x"

