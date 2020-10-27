
;#define AppZAGS
#define AppLAIS
;#define AppGKX
;#define AppOpeka
;#define AppLAIS
;#define AppOchered

[Setup]
Compression=lzma/max
;bzip/9
WizardImageFile=compiler:MY_WIZMODERNIMAGE.BMP
WizardSmallImageFile=compiler:MY_WIZMODERNSMALLIMAGE.BMP
#ifdef AppZAGS
  AppName=�������� "����"
  AppVerName=�������� "����"
#endif
#ifdef AppOpeka
  AppName=�������� "����� � ��������������"
  AppVerName=�������� "����� � ��������������"
#endif
#ifdef AppLAIS
  AppName=�������� "����"
  AppVerName=�������� "����"
#endif
#ifdef AppOchered
  AppName=�������� "����������"
  AppVerName=�������� "����������"
#endif
#ifdef AppGKX
  AppName=�������� "���"
  AppVerName=�������� "���"
#endif
AppPublisher=��������������� ����������� "��� ��������" e-mail:vc_bous@brest.by
UsePreviousAppDir=yes
DefaultDirName={code:GetProgDir}
#ifdef AppZAGS
  DefaultGroupName=����
#endif
#ifdef AppLAIS
  DefaultGroupName=����
#endif
#ifdef AppOpeka
  DefaultGroupName=�����
#endif
#ifdef AppOchered
  DefaultGroupName=�������
#endif
#ifdef AppGKX
  DefaultGroupName=���
#endif
DisableDirPage=yes
DisableProgramGroupPage=yes
;DiskSliceSize=1400000
;DiskSpanning=yes
#ifdef AppZAGS
OutputBaseFilename=PathZAGS
;154-1
#endif
#ifdef AppLAIS
OutputBaseFilename=PathLAIS
#endif
#ifdef AppOpeka
OutputBaseFilename=PathOpeka
#endif
#ifdef AppOchered
OutputBaseFilename=PathOchered
#endif
#ifdef AppGKX
OutputBaseFilename=PathGKX
#endif
AlwaysShowDirOnReadyPage=yes
Uninstallable=no

[Languages]
;Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "ru"; MessagesFile: "compiler:Russian.isl"

[Files]
;Source: "E:\Projects\SelSovet\SQL\*.*"; DestDir: "{code:GetProgDir}\SQL"; Flags: ignoreversion
;Source: "E:\Projects\SelSovet7\_path\Report3\*.*"; DestDir: "{code:GetProgDir}\Report3"; Flags: ignoreversion;
;Source: "E:\Projects\SelSovet7\_path\Report\*.*"; DestDir: "{code:GetProgDir}\Report"; Flags: ignoreversion;
;Source: "E:\Projects\SelSovet7\_path\SQL\*.*"; DestDir: "{code:GetProgDir}\SQL"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\_path\Service\*.*"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion;
;Source: "E:\Projects\SelSovet7\Service\pu.pas"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion
;Source: "E:\Projects\SelSovet7\Service\UserEvents.ini"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion
;Source: "E:\Projects\SelSovet7\_path\Template\*.*"; DestDir: "{code:GetProgDir}\Template"; Flags: ignoreversion;
;Source: "E:\Projects\SelSovet7\_path\TemplateExcel\*.*"; DestDir: "{code:GetProgDir}\TemplateExcel"; Flags: ignoreversion;
;Source: "E:\Projects\SelSovet7\Service\export.pas"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion
;Source: "E:\Projects\SelSovet7\_path\Report\*.*" ; DestDir: "{code:GetProgDir}\Report"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\_path\Report3\*.fr3" ; DestDir: "{code:GetProgDir}\Report3"; Flags: ignoreversion
;Source: "E:\Projects\SelSovet7\Service\StruDBF.ini"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion
;Source: "E:\Projects\SelSovet7\Spr\*.*"; DestDir: "{code:GetProgDir}\Spr"; Flags: ignoreversion;
;Source: "E:\Projects\SelSovet7\Report\reports.ini"; DestDir: "{code:GetProgDir}\Report"; Flags: ignoreversion
;Source: "E:\Projects\SelSovet7\ServiceSelSovet\NewParams.tsk"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion

[InstallDelete]
;Type: files; Name:"{app}\report\Empty.frf"

[Registry]
;root:HKCU;subkey:"Software\VCBOUS\SELSOVET";valuetype:string;valuename:"update";valuedata:"1"; Flags: uninsdeletevalue

[Run]
;Filename: "{app}\Doc\�������� ������� ��������.doc"; Description: "���������� �������� ������� ��������"; Flags: postinstall shellexec skipifsilent

[Code]
const
  IDPath = '1';
#ifdef AppZAGS
  IDProg   = '6.5.4';
  NameExeProg = 'ZAGS.exe';
  REG_NAME = 'ZAGS';
  PROG_NAME = '����';
#endif
#ifdef AppOpeka
  IDProg   = '4.1.5';
  NameExeProg = 'Opeka.exe';
  REG_NAME = 'OPEKA';
  PROG_NAME = '����� � ��������������';
#endif
#ifdef AppLAIS
  IDProg   = '8.0.0';
  NameExeProg = 'LAIS.exe';
  REG_NAME = 'LAIS';
  PROG_NAME = '����';
#endif
#ifdef AppOchered
  IDProg   = '6.3.1';
  NameExeProg = 'Ochered.exe';
  REG_NAME = 'OCHERED';
  PROG_NAME = '�������';
#endif
#ifdef AppGKX
  IDProg   = '8.2.0';
  NameExeProg = 'GKH.exe';
  REG_NAME = 'GKH';
  PROG_NAME = '���';
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
      PutError(' ������ �������� ����:'+strDirDesc);
      Result := false;
    end;
    if Result then begin
      strFile := sr.Name;
      while strFile<>'' do begin
        if (strFile<>'.') and (strFile<>'..') and
           (sr.Attributes and FILE_ATTRIBUTE_DIRECTORY = 0) then begin
          if Pos(ANSIUpperCase(strFile)+';', strExclude) = 0 then begin
            if not FileCopy(strDirSource+strFile,strDirDesc+strFile, false) then begin
              PutError('������ ����������� ����� : '+strDirSource+strFile);
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
    while BrowseForFolder('�������� ����� � ���������� '+PROG_NAME, strDir, false) do begin
      if FileExists(strDir+'\'+NameExeProg) then begin
        DataDir := strDir;
        Result  := true;
        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'installpath', DataDir)
        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'version', IDProg);
        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'update', '0');
        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'path', '0');
        break;
      end else begin
        MsgBox('����� ������� ������� !', mbError, MB_OK);
      end;
    end;
  end;
  //-------- ����������� ������������� ��������� �������� --------
  if RegQueryStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'version', strCurVer) then begin
    try
      if Copy(strCurVer,1,3) <> Copy(IDProg,1,3) then begin
 //       MsgBox(' �������� ������������� ��� ������ ��������� <'+Copy(IDProg,1,3)+'> ! ', mbInformation, MB_OK);
 //       Result := false;
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
          MsgBox('������� ��� ��������� �������� ��������� "����" �� ������', mbError, MB_OK);
        #endif
        #ifdef AppLAIS
          MsgBox('������� ��� ��������� �������� ��������� "����" �� ������', mbError, MB_OK);
        #endif
        #ifdef AppOchered
          MsgBox('������� ��� ��������� �������� ��������� "����������" �� ������', mbError, MB_OK);
        #endif
        Result := false;
      end else begin
//      if GetVersionNumbersString(DataDir+'\'+NameExeProg, strVer) then begin
//        MsgBox('������� ������ ���������:'+strVer, mbInformation, mb_Ok);
//      end;
      end;
    end else begin
      #ifdef AppZAGS
        MsgBox('������� ��� ��������� �������� ��������� "����" �� ������', mbError, MB_OK);
      #endif
      #ifdef AppLAIS
        MsgBox('������� ��� ��������� �������� ��������� "����" �� ������', mbError, MB_OK);
      #endif
      #ifdef AppOchered
        MsgBox('������� ��� ��������� �������� ��������� "����������" �� ������', mbError, MB_OK);
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
//var
//  ResultCode: Integer;
//  i : Integer;
//  ss : String;
begin
  if CurStep = ssInstall then begin

  end else if CurStep = ssPostInstall then begin
    SetIniString('ADMIN', 'SETUP_PATH', IdPath, AddBackSlash(DataDir)+'SysParams.ini' );
  end;
end;

function NextButtonClick(CurPage: Integer): Boolean;
begin
  Result := True;
  if CurPage = wpWelcome then begin
  end;
end;

[Run]
;Filename: "{app}\SelSovet.exe"; Description: "�������� �����"; Flags: nowait postinstall skipifsilent
;Filename: "{app}\UpdateProg.exe"; Flags: nowait postinstall skipifsilent; Check: IsRunUpdateBase;
;Filename: "{app}\INIT.EXE"; Parameters: "/x"

