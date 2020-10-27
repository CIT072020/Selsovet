
[Setup]
Compression=lzma/max
;bzip/9
WizardImageFile=compiler:MY_WIZMODERNIMAGE.BMP
WizardSmallImageFile=compiler:MY_WIZMODERNSMALLIMAGE.BMP
AppName="Path SChannel"
AppVerName="Path SChannel"
DisableDirPage=yes
DisableProgramGroupPage=yes
PrivilegesRequired=none
OutputBaseFilename=PathSchannel
AlwaysShowDirOnReadyPage=yes
Uninstallable=no
;AppPublisher=Государственное предприятие "ЦИТ Белстата" e-mail:vc_bous@brest.by
DefaultDirName={code:GetProgDir}

[Languages]
;Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "ru"; MessagesFile: "compiler:Russian.isl"

[Files]
Source: "E:\_AVEST_\schannel_patch\*.*"; DestDir: "{code:GetProgDir}\"; Flags: ignoreversion;
Source: "E:\_AVEST_\schannel_add\*.*"; DestDir: "{code:GetProgDir}\"; Flags: onlyifdoesntexist;

[InstallDelete]
;Type: files; Name:"{app}\report\Empty.frf"


[Registry]
;root:HKCU;subkey:"Software\VCBOUS\SELSOVET";valuetype:string;valuename:"update";valuedata:"1"; Flags: uninsdeletevalue

[Code]
const
IDUpdate = '0';
IDProg   = '0';
var
  DataDir: String;
  strCurVer : String;
  lMainComp  : Boolean;
  REG_NAME :String;
  NameExeProg:String;
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
  lOk:Boolean;
  strDir:String;
begin
  Result:=false;
  strDir :='C:\';
  //RegQueryStringValue(HKCU, 'Software\VCBOUS\LAIS', 'installpath', DataDir) then begin
  DataDir:=GetEnv('OPENSSL_ENGINES');
  if DataDir<>'' then begin
    if FileExists(AddBackSlash(DataDir)+'tzi.dll') then begin
      Result:=true;
    end else begin
      DataDir:='';
    end;
  end;
  if (DataDir='') or not Result then begin
    PutError('Папка для установки не найдена');
    while BrowseForFolder('Выберите папку с программой Schannel', strDir, false) do begin
      Result:=FileExists(AddBackSlash(strDir)+'tzi.dll');
      if Result then begin
        DataDir := strDir;
        break;
      end else begin
        MsgBox('Папка выбрана неверно !', mbError, MB_OK);
      end;
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
//var
//  ResultCode: Integer;
//  i : Integer;
//  ss : String;
begin
  if CurStep = ssInstall then begin
  end else if CurStep = ssPostInstall then begin
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

