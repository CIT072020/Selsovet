
#define FULL
#define ADS10

[Setup]
OutputBaseFilename=SetupOchered
Compression=lzma/max
;bzip/9
WizardImageFile=compiler:MY_WIZMODERNIMAGE.BMP
WizardSmallImageFile=compiler:MY_WIZMODERNSMALLIMAGE.BMP

AppName=Очередники
AppVerName=Очередники
AppPublisher=Государственное предприятие "ЦИТ Белстата" e-mail:vc_bous@brest.by
DefaultDirName=C:\Очередники
DefaultGroupName=Очередники
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
Source: "E:\Projects\Selsovet7\Ochered.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: program

Source: "E:\Projects\Selsovet7\CheckConnect.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\DeleteIndex.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\UpdateProg.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\UpdateInd.ico"; DestDir: "{app}"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\splash_ochered.bmp"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Update.ico"; DestDir: "{app}"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\lastuser_def"; DestDir: "{app}"; DestName: "lastuser"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\busy.avi"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\except.dic"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\padeg.dll"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\addkey.adt"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\shtamp.doc"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\shtamp_gerb.doc"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\empty_shtamp.doc"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\sstut.*"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\SysParams.ini"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7_Data\InstallDataO\*.*"; DestDir: "{app}\Data"; Flags: ignoreversion uninsneveruninstall; Components: data
Source: "E:\Projects\Selsovet7\Spr\*.*"; DestDir: "{app}\Spr"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\SQL\*.*"; DestDir: "{app}\SQL"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7_Data\InstallDataO\SelSovet.add"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7_Data\InstallDataO\SelSovet.am"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7_Data\InstallDataO\SelSovet.ai"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7_Data\InstallDataO\SprDocAdmProc.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7_Data\InstallDataO\SprDocAdmProc.adm"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7_Data\InstallDataO\SprDocAdmProc.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7_Data\InstallDataO\SprDocSubj.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7_Data\InstallDataO\SprDocSubj.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7_Data\InstallDataO\SprDocFileList.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7_Data\InstallDataO\SprDocFileList.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7_Data\InstallDataO\SprDocGroup.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7_Data\InstallDataO\SprDocGroup.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7_Data\InstallDataO\SprPerevod.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7_Data\InstallDataO\SprPerevod.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\Doc\Руководство пользователя Очередники.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion; Components: program
Source: "E:\ЛАИС\РЕГУЛИРОВАНИЕ ЖИЛИЩНЫХ ОТНОШЕНИЙ.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\Doc\Доработки Очередники.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion; Components: program
;Source: "E:\Projects\Selsovet7\Filters\Население\Стандартные\*.flt"; DestDir: "{app}\Filters\Население\Стандартные"; Flags: ignoreversion; Components: program
;Source: "E:\Projects\Selsovet7\Filters\ЛицевыеCчета\Стандартные\*.flt"; DestDir: "{app}\Filters\ЛицевыеCчета\Стандартные"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\Filters\Дома\Стандартные\*.flt"; DestDir: "{app}\Filters\Дома\Стандартные"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\Filters\Очередь на жилье\Стандартные\*.flt"; DestDir: "{app}\Filters\Очередь на жилье\Стандартные"; Components: program
Source: "E:\Projects\SelSovet7\Filters\Очередь на жилье\Адрес.flt"; DestDir: "{app}\Filters\Очередь на жилье"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\Filters\Очередь на жилье\Не выбран адрес.flt"; DestDir: "{app}\Filters\Очередь на жилье"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\Filters\Очередь на жилье\Год и номер решения.flt"; DestDir: "{app}\Filters\Очередь на жилье"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\Filters\Очередь на жилье\Первоочередное (общая очередь).flt"; DestDir: "{app}\Filters\Очередь на жилье"; Flags: ignoreversion; Components: program
;Source: "E:\Projects\Selsovet7\Report\*.*"; DestDir: "{app}\Report"; Excludes: "Свидет*.frf,Запись акта*.frf,Восстановленная за*.frf,reports.ini,reportsGKH.ini,reportsZAGS.ini"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Report\reportsOchered.ini"; DestDir: "{app}\Report"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Report\Empty.frf"; DestDir: "{app}\Report"; Flags: ignoreversion; Components: program
;Source: "E:\Projects\Selsovet7\Report3\*.*"; DestDir: "{app}\Report3"; Excludes: "ЗАГС_*.fr3,Листок*.fr3,ЗАГС_*.fr3,Свидет*.fr3,Запись акта*.fr3,Восстановленная за*.fr3"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Report3\Дублирование очередников.fr3"; DestDir: "{app}\Report3"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Report3\Карточка очередника.fr3"; DestDir: "{app}\Report3"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Report3\Справка о состоянии на учете нуждающихся.fr3"; DestDir: "{app}\Report3"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Report3\Очередь_Список.fr3"; DestDir: "{app}\Report3"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Template\*.*"; DestDir: "{app}\Template"; Excludes: "Арх справка*.doc,Акт*.doc"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\TemplateExcel\*.*"; DestDir: "{app}\TemplateExcel"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Service\*.*"; DestDir: "{app}\Service"; Excludes: "smdo*.ini,zags.pas,pu.pas,progz.pas,progo.pas,gisun*.ini,TaskParams.ini,OpisFilter*.ini,fmGurn*.ini,minsk.pas,TablesFields.mtb,personal.pas,MRUList.ini,*GKH.*,*Zags.*,*ZAH.*,*Opeka.*,Actions.ini,Obrabotka.ini,NewParams.tsk,Parameters.tsk,*.bak"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Service\fmGurnOchered.ini"; DestDir: "{app}\Service"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Service\fmGurnalAdres.ini"; DestDir: "{app}\Service"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Service\fmGurnNasel.ini"; DestDir: "{app}\Service"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Install\Default\personal.pas"; DestDir: "{app}\Service"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Install\Default\minsk.pas"; DestDir: "{app}\Service"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Install\Default\pu.pas";DestDir: "{app}\Service"; Flags: ignoreversion;
Source: "E:\Projects\Selsovet7\Install\Default\zags.pas";DestDir: "{app}\Service"; Flags: ignoreversion;
Source: "E:\Projects\Selsovet7\Work\ParamOchered.loc"; DestDir: "{app}\Work"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Work\Local.ini"; DestDir: "{app}\Work"; Flags: ignoreversion; Components: program
#ifdef ADS10
  Source: "E:\Delphi7\CompSet\ADS10\TDataSet\Redistribute\*.*"; DestDir: "{app}"; Flags: ignoreversion
#else
  Source: "E:\Delphi7\CompSet\ADS8\TDataSet\Redistribute\*.*"; DestDir: "{app}"; Flags: ignoreversion
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
Name: "{app}\Update"
Name: "{app}\Doc"

[Icons]
Name: "{group}\Очередники"; Filename: "{app}\Ochered.exe"; WorkingDir: "{app}"
Name: "{group}\Документация"; Filename: "{app}\Doc\Руководство пользователя Очередники.doc"; WorkingDir: "{app}"
Name: "{group}\Переключение типа сервера "; Filename: "{app}\UpdateProg.exe"; Parameters:"/TYPESERVER"; WorkingDir: "{app}"; IconFilename: "{app}\Update.ico"; Components: data
Name: "{group}\Удаление индексных файлов "; Filename: "{app}\DeleteIndex.exe"; WorkingDir: "{app}"; IconFilename: "{app}\UpdateInd.ico"; Components: data
;Name: "{group}\Удалить программу "; Filename: "{uninstallexe}";
Name: "{group}\Последнее обновление"; Filename: "{app}\LastUpdate\LastUpdate.exe"; WorkingDir: "{app}"; IconFilename: "{app}\LastUpdate.ico"
Name: "{group}\Что нового"; Filename: "{app}\Doc\Доработки Очередники.doc"; Tasks: desktopicon; WorkingDir: "{app}"

Name: "{userdesktop}\Очередники"; Filename: "{app}\Ochered.exe"; Tasks: desktopicon; WorkingDir: "{app}"
Name: "{userdesktop}\Документация Очередники"; Filename: "{app}\Doc\Руководство пользователя Очередники.doc"; Tasks: desktopicon; WorkingDir: "{app}"

[Run]
Filename: "{app}\Ochered.exe"; Description: "Очередники"; Flags: nowait postinstall skipifsilent

[Registry]
root:HKCU;subkey:"Software\VCBOUS"; Flags: uninsdeletekeyifempty
root:HKCU;subkey:"Software\VCBOUS\Ochered"; Flags: uninsdeletekey
root:HKCU;subkey:"Software\VCBOUS\Ochered";valuetype:string;valuename:"installpath";valuedata:"{app}"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\Ochered";valuetype:string;valuename:"version";valuedata:"8.3.0"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\Ochered";valuetype:string;valuename:"update";valuedata:"166"; Flags: uninsdeletevalue

[UninstallDelete]
Type: filesandordirs; Name: "{app}\LastUpdate"
Type: filesandordirs; Name: "{app}\Backup"
Type: filesandordirs; Name: "{app}\Work"
Type: filesandordirs; Name: "{app}\DocArxiv"
Type: filesandordirs; Name: "{app}\Export"
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
Type: files; Name: "{app}\empty_shtamp.doc"
Type: files; Name: "{app}\work_shtamp.doc"
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
  ResultCode : Integer;
  s : String;
begin
 // MsgBox(IntToStr(CurPage), mbConfirmation, MB_OK);
//  if MsgBox('По выбранному пути существует папка с данными. Установка невозможна.', mbConfirmation, MB_YESNO) = IDYES then begin
  Result := True;
  if CurPage = wpSelectDir then begin
    s := AddBackslash( ExpandConstant('{app}') );
    if FileExists(s+'Data\SelSovet.add') then begin
      MsgBox('По выбранному пути существует папка с данными. Установка невозможна.', mbError, MB_OK);
      Result := false;
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
    RegWriteStringValue(HKCU, 'Software\VCBOUS\Ochered', 'maincomp', s);
  end;
end;



