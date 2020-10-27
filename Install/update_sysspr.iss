
[Setup]
Compression=lzma/max
;bzip/9
WizardImageFile=compiler:MY_WIZMODERNIMAGE.BMP
WizardSmallImageFile=compiler:MY_WIZMODERNSMALLIMAGE.BMP
AppName="Обновление системных справочников"
AppVerName="Обновление системных справочников"
DisableDirPage=yes
DisableProgramGroupPage=yes
PrivilegesRequired=none
OutputBaseFilename=UpdateSysSpr
AlwaysShowDirOnReadyPage=yes
Uninstallable=no
AppPublisher=Государственное предприятие "ЦИТ Белстата" e-mail:vc_bous@brest.by
DefaultDirName={code:GetProgDir}

[Languages]
;Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "ru"; MessagesFile: "compiler:Russian.isl"

[Files]
Source: "E:\Projects\SelSovet7\Spr\*.*"; DestDir: "{code:GetProgDir}\Spr"; Flags: ignoreversion; Check: IsMainComp

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
//  i : Integer;
//  s,ss,
  strDir : String;
  strRegName:String;
begin
  REG_NAME:=UpperCase(Trim(ParamStr(ParamCount())));
  if Pos('/LA',REG_NAME)>0 then begin 
    REG_NAME:='LAIS';
  end else if Pos('/ZAGS',REG_NAME)>0 then begin 
    REG_NAME:='ZAGS';
  end else if Pos('/PO',REG_NAME)>0 then begin 
    REG_NAME:='POST';
  end else if Pos('/ZAH',REG_NAME)>0 then begin 
    REG_NAME:='ZAH';
  end else if Pos('/OC',REG_NAME)>0 then begin 
    REG_NAME:='Ochered';
  end else if Pos('/OP',REG_NAME)>0 then begin 
    REG_NAME:='Opeka';
  end else begin
    REG_NAME:='';
  end;
  Result := true;
  strDir  := 'C:\';
  DataDir := '';
  if REG_NAME='' then begin
    if not RegQueryStringValue(HKCU, 'Software\VCBOUS\LAIS', 'installpath', DataDir) then begin
      if not RegQueryStringValue(HKCU, 'Software\VCBOUS\POST', 'installpath', DataDir) then begin
        if not RegQueryStringValue(HKCU, 'Software\VCBOUS\ZAGS', 'installpath', DataDir) then begin
          if not RegQueryStringValue(HKCU, 'Software\VCBOUS\ZAH', 'installpath', DataDir) then begin
            if not RegQueryStringValue(HKCU, 'Software\VCBOUS\Ochered', 'installpath', DataDir) then begin
              if not RegQueryStringValue(HKCU, 'Software\VCBOUS\Opeka', 'installpath', DataDir) then begin
                Result := false;
              end;
            end;
          end;
        end;
      end;
    end;
  end else begin
    if not RegQueryStringValue(HKCU, 'Software\VCBOUS\'+Reg_Name, 'installpath', DataDir) then begin
      while BrowseForFolder('Выберите папку с программой', strDir, false) do begin
        if FileExists(strDir+'\SysParams.ini') then begin
          DataDir := strDir;
          Result  := true;
          //RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'installpath', DataDir)
          //RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'version', IDProg);
          //RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'update', '0');
          //RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'path', '0');
          break;
        end else begin
          MsgBox('Папка выбрана неверно !', mbError, MB_OK);
        end;
      end;
    end;
  end;
  //-------------------------------------------------------------------
  if Result then begin
    if DataDir<>'' then begin
      lMainComp := GetIniBool('ADMIN', 'MAINCOMP', true, AddBackSlash(DataDir)+'SysParams.ini');
      Result := true;
      if DataDir='' then begin
        MsgBox('Каталог для установки системных справочников не найден', mbError, MB_OK);
        Result := false;
      end else begin
//      if GetVersionNumbersString(DataDir+'\'+NameExeProg, strVer) then begin
//        MsgBox('Текущая версия программы:'+strVer, mbInformation, mb_Ok);
//      end;
      end;
    end else begin
      MsgBox('Каталог для установки системных справочников не найден', mbError, MB_OK);
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

