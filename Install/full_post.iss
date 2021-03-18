;!!!!!!!!!!!!!!!!!!!
;#define GISUN4

#define FULL
#define ADS10
;#define GISUN

[Setup]
OutputBaseFilename=SetupLaisSmdo
Compression=lzma/max
;bzip/9
WizardImageFile=compiler:MY_WIZMODERNIMAGE.BMP
WizardSmallImageFile=compiler:MY_WIZMODERNSMALLIMAGE.BMP

AppName=ЛАИС.СМДО
AppVerName=ЛАИС.СМДО
AppPublisher=Государственное предприятие "ЦИТ Белстата" e-mail:vc_bous@brest.by
DefaultDirName=D:\ЛАИС.СМДО
DefaultGroupName=ЛАИС.СМДО

DisableProgramGroupPage=yes
DirExistsWarning=no
UsePreviousAppDir=no
PrivilegesRequired=none
;DiskSliceSize=1400000
;DiskSpanning=yes

[Languages]
;Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "ru"; MessagesFile: "compiler:Russian.isl"

[Types]
Name: "full"; Description: "Полная установка"
Name: "compact"; Description: "Сетевая установка"

[Components]
Name: "program"; Description: "Програмные файлы"; Types: full compact; Flags: fixed
Name: "data"; Description: "База данных"; Types: full; Flags: fixed

[Tasks]
Name: "desktopicon"; Description: "Создать иконку на рабочем столе"; GroupDescription: "Дополнительные иконки:"

[Files]
Source: "E:\Projects\Selsovet7\LaisSmdo.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: program
#ifdef GISUN
  Source: "E:\Projects\Selsovet7\Gisun.ico"; DestDir: "{app}"; Flags: ignoreversion; Components: program
#endif
Source: "E:\Projects\Selsovet7\CheckConnect.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\DeleteIndex.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\UpdateProg.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\UpdateInd.ico"; DestDir: "{app}"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Update.ico"; DestDir: "{app}"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\BMP\Tools.ico"; DestDir: "{app}"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\LastUpdate.ico"; DestDir: "{app}"; Flags: ignoreversion;
Source: "E:\Projects\Selsovet7\splash_post.bmp"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Update.ico"; DestDir: "{app}"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\lastuser_def"; DestDir: "{app}"; DestName: "lastuser"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\busy.avi"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\except.dic"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\padeg.dll"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\addkey.adt"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\shtamp.doc"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\shtamp_gerb.doc"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\Doc\Доработки ЛАИС.СМДО.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\Doc\Письмо в ответ на.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Install\Default\Base\SysParams.ini"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7_Data\InstallDataSMDO\*.*"; DestDir: "{app}\Data"; Flags: ignoreversion uninsneveruninstall; Components: data
Source: "E:\Projects\Selsovet7\Spr\*.*"; DestDir: "{app}\Spr"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\SQL\*.*"; DestDir: "{app}\SQL"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\Data\Base.add"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\Base.am"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\Base.ai"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adm"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocSubj.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocSubj.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocFileList.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocFileList.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocGroup.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocGroup.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprPerevod.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprPerevod.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SMDOSprVidDok.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SMDOSprVidDok.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SMDOSprOrg.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SMDOSprOrg.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\Doc\Руководство пользователя ЛАИС.СМДО.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Report\ОГ *.*"; DestDir: "{app}\Report"; Excludes: "reports*.ini"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Report\reportsPost.ini"; DestDir: "{app}\Report"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Report3\СМДО*.*"; DestDir: "{app}\Report3"; Excludes: "reports*.ini"; Flags: ignoreversion; 
Source: "E:\Projects\Selsovet7\Report3\АДП*.*"; DestDir: "{app}\Report3"; Excludes: "reports*.ini"; Flags: ignoreversion; 
Source: "E:\Projects\Selsovet7\Report3\ДОК*.*"; DestDir: "{app}\Report3"; Excludes: "reports*.ini"; Flags: ignoreversion; 
;Source: "E:\Projects\Selsovet7\Report3\Захоронение_*.fr3"; DestDir: "{app}\Report3"; Flags: ignoreversion; Components: program
;Source: "E:\Projects\Selsovet7\Report3\report_stru3.ini"; DestDir: "{app}\Report3"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Template\РКК *.*"; DestDir: "{app}\Template"; Excludes: "Арх справка*.doc,Акт*.doc"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\Template\РКК исходящие.doc"; DestDir: "{app}\Template_"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\Template\РКК входящие.doc"; DestDir: "{app}\Template_"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\Filters\SMDOPost\Стандартные\*.flt"; DestDir: "{app}\Filters\SMDOPost\Стандартные"; Flags: ignoreversion;
Source: "E:\Projects\Selsovet7\Service\*.*"; DestDir: "{app}\Service"; Excludes: "smdo*.*,fmGurn*.ini,*.pas,OpisFilter*.ini,GISUN*.ini,UserEvents*.ini,Obrabotka*.ini,personal.pas,*ZAH.*,*Ochered.*,*ZAGS.*,*OPEKA.*,*OCH.*,*GKH.*,MRUList.ini,Actions.ini,Parameters.tsk,NewParams.tsk,*.bak"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Service\fmGurnSMDO.ini"; DestDir: "{app}\Service";  Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Service\ObrabotkaPost.ini"; DestDir: "{app}\Service";  Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Service\UserEventsPost.ini"; DestDir: "{app}\Service";  Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Service\progp.pas"; DestDir: "{app}\Service";  Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Service\load.pas"; DestDir: "{app}\Service";  Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Service\update.pas"; DestDir: "{app}\Service";  Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Install\Default\personal.pas"; DestDir: "{app}\Service"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Install\Default\smdo.ini"; DestDir: "{app}\Service"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\Install\Default\ads.ini"; DestDir: "{app}\"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\Work\ParamPost.loc"; DestDir: "{app}\Work"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Work\Local.ini"; DestDir: "{app}\Work";  Flags: ignoreversion; Components: program
#ifdef GISUN
  Source: "E:\Projects\SelSovet7\Gisun_Cur\gisun.ini"; DestDir: "{app}\Service"; Flags: ignoreversion; Components: data
  Source: "E:\Projects\SelSovet7\Gisun_Cur\gisun_input.ini"; DestDir: "{app}\Service"; Flags: ignoreversion; Components: program
  Source: "E:\Projects\SelSovet7\Gisun_Cur\gisun_output.ini"; DestDir: "{app}\Service"; Flags: ignoreversion; Components: program
  Source: "E:\Projects\SelSovet7\Service\ETSPError.txt"; DestDir: "{app}\Service"; Flags: ignoreversion
#endif
#ifdef ADS10
  Source: "E:\Delphi7\CompSet\ADS10\TDataSet\Redistribute\*.*"; DestDir: "{app}"; Flags: ignoreversion; Components: program
#else
  Source: "E:\Delphi7\CompSet\ADS8\TDataSet\Redistribute\*.*"; DestDir: "{app}"; Excludes: "adsoledb.dll"; Flags: ignoreversion; Components: program
#endif

#ifdef FULL
  #ifdef ADS10
    Source: "E:\Delphi7\CompSet\ADS10\HELP\Advantage.chm"; DestDir: "{app}"; Flags: ignoreversion; Components: data
    Source: "E:\Delphi7\CompSet\ADS10\ARC\arc32.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: data
    Source: "E:\Delphi7\CompSet\ADS10\adtfix.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: data
  #else
    Source: "E:\Program Files\Arc32\ARC\Advantage.chm"; DestDir: "{app}"; Flags: ignoreversion; Components: data
    Source: "E:\Program Files\Arc32\ARC\arc32.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: data
    Source: "E:\Program Files\Arc32\ARC\adtfix.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: data
  #endif
#endif

[Dirs]
Name: "{app}\LastUpdate"
Name: "{app}\Filters"
Name: "{app}\NewData"
Name: "{app}\Work"
Name: "{app}\Arxiv"
Name: "{app}\Template"
Name: "{app}\TemplateExcel"
Name: "{app}\Report"
Name: "{app}\Report3"
Name: "{app}\Update"
Name: "{app}\Doc"

[Icons]
Name: "{group}\ЛАИС.СМДО"; Filename: "{app}\LaisSmdo.exe"; WorkingDir: "{app}"
#ifdef GISUN
  Name: "{group}\Параметры ГИС РН"; Filename: "{app}\UpdateProg.exe"; Parameters:"/GISUN /POST"; WorkingDir: "{app}"; IconFilename: "{app}\Gisun.ico"; Components: data
#endif
Name: "{group}\Документация"; Filename: "{app}\Doc\Руководство пользователя ЛАИС.СМДО.doc"; WorkingDir: "{app}"
Name: "{group}\Переключение типа сервера"; Filename: "{app}\UpdateProg.exe"; Parameters:"/TYPESERVER"; WorkingDir: "{app}"; IconFilename: "{app}\Update.ico"; Components: data
Name: "{group}\Удаление индексных файлов"; Filename: "{app}\DeleteIndex.exe"; WorkingDir: "{app}"; IconFilename: "{app}\UpdateInd.ico"; Components: data
Name: "{group}\Удалить программу"; Filename: "{uninstallexe}";
Name: "{userdesktop}\ЛАИС.СМДО"; Filename: "{app}\LaisSMDO.exe"; Tasks: desktopicon; WorkingDir: "{app}"
Name: "{userdesktop}\Документация ЛАИС.СМДО"; Filename: "{app}\Doc\Руководство пользователя ЛАИС.СМДО.doc"; Tasks: desktopicon; WorkingDir: "{app}"

[Run]
Filename: "{app}\LaisSMDO.exe"; Description: "ЛАИС.СМДО"; Flags: nowait postinstall skipifsilent

[Registry]
root:HKCU;subkey:"Software\VCBOUS"; Flags: uninsdeletekeyifempty
root:HKCU;subkey:"Software\VCBOUS\POST"; Flags: uninsdeletekey
root:HKCU;subkey:"Software\VCBOUS\POST";valuetype:string;valuename:"installpath";valuedata:"{app}"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\POST";valuetype:string;valuename:"version";valuedata:"1.3.6"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\POST";valuetype:string;valuename:"update";valuedata:"26"; Flags: uninsdeletevalue

[UninstallDelete]
Type: filesandordirs; Name: "{app}\LastUpdate"
Type: filesandordirs; Name: "{app}\Backup"
Type: filesandordirs; Name: "{app}\Work"
Type: filesandordirs; Name: "{app}\Export"
;Type: filesandordirs; Name: "{app}\DocArxiv"
Type: filesandordirs; Name: "{app}\Update"
Type: filesandordirs; Name: "{app}\SQL"
Type: filesandordirs; Name: "{app}\NewData"
Type: filesandordirs; Name: "{app}\Report"
Type: filesandordirs; Name: "{app}\Report3"
Type: filesandordirs; Name: "{app}\Service"
Type: filesandordirs; Name: "{app}\Filters"
Type: filesandordirs; Name: "{app}\Arxiv"
Type: filesandordirs; Name: "{app}\Personal"
Type: filesandordirs; Name: "{app}\Template"
Type: filesandordirs; Name: "{app}\TemplateExcel"
;Type: filesandordirs; Name: "{app}\Data"
Type: filesandordirs; Name: "{app}\Spr"
Type: filesandordirs; Name: "{app}\Tmp"
Type: filesandordirs; Name: "{app}\Doc"
;Type: filesandordirs; Name: "{app}\AutoBackup"
;Type: filesandordirs; Name: "{app}\AutoBackup2"
Type: filesandordirs; Name: "{app}\Doc"
Type: files; Name: "{app}\lastuser"
Type: files; Name: "{app}\version"
Type: files; Name: "{app}\current_organ"
Type: files; Name: "{app}\addkey.adt"
Type: files; Name: "{app}\shtamp.doc"
Type: files; Name: "{app}\shtamp_gerb.doc"
Type: files; Name: "{app}\key"
Type: files; Name: "{app}\UpdateInd.ico"
Type: files; Name: "{app}\LastUpdate.ico"
Type: files; Name: "{app}\Gisun.ico"

[Code]
//const
//var
//  DataDir: String;

function NextButtonClick(CurPage: Integer): Boolean;
var
  ResultCode,i : Integer;
  s,sp : String;
  arr : array[1..3] of string;
  lCheck:Boolean;
begin
 // MsgBox(IntToStr(CurPage), mbConfirmation, MB_OK);
//  if MsgBox('По выбранному пути существует папка с данными. Установка невозможна.', mbConfirmation, MB_YESNO) = IDYES then begin
  Result := True;
  if CurPage = wpSelectDir then begin
    sp:=ExpandConstant('{app}')+'\';
    arr[1]:=ExpandConstant('{pf}')+'\';
    arr[2]:=ExpandConstant('{pf32}'+'\');
    if IsWin64 
      then arr[3]:=ExpandConstant('{pf64}'+'\')
      else arr[3]:='';
    lCheck:=false;
    for i:=1 to 3 do begin
      if not lCheck and (arr[i]<>'') and (copy(sp,1,length(arr[i]))=arr[i]) then begin
        lCheck:=true;
        if not (MsgBox('При установке в "'+arr[i]+'" Вы должны обладать правами на запись в данную папку. Продолжить?', mbConfirmation, MB_YESNO) = IDYES) 
          then Result:=false;
      end;
    end;
    if Result then begin
      s:=AddBackslash(ExpandConstant('{app}'));
      if FileExists(s+'Data\Base.add') then begin
        MsgBox('По выбранному пути существует папка с данными. Установка невозможна.', mbError, MB_OK);
        Result := false;
      end;
    end;
  end else if CurPage = wpInstalling then begin
//    s := AddBackslash( ExpandConstant('{app}') );
//    if FileExists(s+'Data\SelSovet.add') then begin
//      MsgBox('По выбранному пути существует папка с данными. Установка невозможна.', mbError, MB_OK);
//      Result := false;
//    end;
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  s : String;
begin
  if CurStep = ssInstall then begin

  end else if CurStep = ssPostInstall then begin
    if IsComponentSelected('data') then begin // полная инсталяция
      s := '1';
    end else begin
      s := '0';
    end;
    SetIniString('ADMIN', 'MAINCOMP', s, AddBackslash(ExpandConstant('{app}'))+'SysParams.ini');
    RegWriteStringValue(HKCU, 'Software\VCBOUS\POST', 'maincomp', s);
  end;
end;



