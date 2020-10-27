;!!!!!!!!!!!!!!!!!!!
#define GISUN4

#define ADS10
#define FULL
#define GISUN
[Setup]
OutputBaseFilename=SetupZAGS
Compression=lzma/max
;bzip/9
WizardImageFile=compiler:MY_WIZMODERNIMAGE.BMP
WizardSmallImageFile=compiler:MY_WIZMODERNSMALLIMAGE.BMP
AppName=ЗАГС
AppVerName=ЗАГС
AppPublisher=Государственное предприятие "ЦИТ Белстата" e-mail:vc_bous@brest.by
DefaultDirName={code:GetProgDir}\ЗАГС
DefaultGroupName=ЗАГС
DisableProgramGroupPage=yes
DirExistsWarning=yes
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
Source: "E:\Projects\Selsovet7\ZAGS.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\UpdateProg.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\DeleteIndex.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\CheckConnect.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\splash_zags.bmp"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\UpdateInd.ico"; DestDir: "{app}"; Flags: ignoreversion; Components: program
#ifdef GISUN
  Source: "E:\Projects\Selsovet7\Gisun.ico"; DestDir: "{app}"; Flags: ignoreversion; Components: program
#endif
Source: "E:\Projects\Selsovet7\Update.ico"; DestDir: "{app}"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Tools.ico"; DestDir: "{app}"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Gisun.ico"; DestDir: "{app}"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\LastUpdate.ico"; DestDir: "{app}"; Flags: ignoreversion;
Source: "E:\Projects\Selsovet7\busy.avi"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\lastuser_def"; DestDir: "{app}"; DestName: "lastuser"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\except.dic"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\padeg.dll"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Doc\Документация ЗАГС.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\Doc\Доработки ЗАГС.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\SysParams.ini"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\addkey.adt"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\shtamp.doc"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\empty_shtamp.doc"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\shtamp_gerb.doc"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\talon_dop.doc"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\libhunspell.dll"; DestDir: "{app}"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\Dict\*.*"; DestDir: "{app}\Dict"; Flags: ignoreversion; Components: program

Source: "E:\Projects\Selsovet7_Data\InstallDataZ\*.*"; DestDir: "{app}\Data"; Flags: ignoreversion uninsneveruninstall; Components: data
Source: "E:\Projects\Selsovet7\Spr\*.*"; DestDir: "{app}\Spr"; Flags: ignoreversion; Components: data
Source: "E:\Projects\Selsovet7\SQL\*.*"; DestDir: "{app}\SQL"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\Data\SelSovet.add"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SelSovet.am"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SelSovet.ai"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adm"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocSubj.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocSubj.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocFileList.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocFileList.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocGroup.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprDocGroup.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprPrichSm.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprPrichSm.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprPerevod.adt"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
Source: "E:\Projects\SelSovet7\Data\SprPerevod.adi"; DestDir: "{app}\NewData"; Flags: ignoreversion; Components: data
;Source: "E:\Projects\Selsovet7\RichEdit\*.*"; DestDir: "{app}\RichEdit"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Report\*.*"; DestDir: "{app}\Report"; Excludes: "reports.ini,reportsGKH.ini,reportsOchered.ini"; Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\Report3\*.*"; DestDir: "{app}\Report3"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Template\*.*"; DestDir: "{app}\Template"; Excludes: "Справка в налоговую*.doc,Справка на адресную пом*.doc,Справка о занимаемом*.doc,Справка о находящихся в собств*.doc,Справка о последнем месте ж*.doc,Справка о начисленной ж*.doc,Справка о нуждаемости в*.doc,РКК*.doc,Справка выписка из*.doc,Повестка ВУС*.doc,Справка фактической эксп*.doc,Справка с места ж*.doc,Справка о составе сем*.doc,Справка о месте ж*.doc,Акт обследования мат*.doc"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Template\Талон_приглашение.doc"; DestDir: "{app}\Template_";  Flags: ignoreversion; Components: program
Source: "E:\Projects\SelSovet7\Filters\АктыРождений\Год и месяц актовой записи.flt"; DestDir: "{app}\Filters\АктыРождений"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыРождений\Номер и год актовой записи.flt"; DestDir: "{app}\Filters\АктыРождений"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыРождений\Орган регистрации.flt"; DestDir: "{app}\Filters\АктыРождений"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыРождений\Записи актов за период.flt"; DestDir: "{app}\Filters\АктыРождений"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыРождений\Аннулированные.flt"; DestDir: "{app}\Filters\АктыРождений"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыРождений\Фамилия Имя Отчество (точное равенство).flt"; DestDir: "{app}\Filters\АктыРождений"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыРождений\Фамилия Имя Отчество (начинается с).flt"; DestDir: "{app}\Filters\АктыРождений"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыРождений\Не заполнен военкомат у отца.flt"; DestDir: "{app}\Filters\АктыРождений"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыРождений\Лишение родительских прав.flt"; DestDir: "{app}\Filters\АктыРождений"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыРождений\Статья 55 без установления отцовства (до 18).flt"; DestDir: "{app}\Filters\АктыРождений"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыСмертей\Год и месяц актовой записи.flt"; DestDir: "{app}\Filters\АктыСмертей"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыСмертей\Номер и год актовой записи.flt"; DestDir: "{app}\Filters\АктыСмертей"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыСмертей\Аннулированные.flt"; DestDir: "{app}\Filters\АктыСмертей"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыСмертей\Орган регистрации.flt"; DestDir: "{app}\Filters\АктыСмертей"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыСмертей\Фамилия Имя Отчество (точное равенство).flt"; DestDir: "{app}\Filters\АктыСмертей"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыСмертей\Записи актов за период.flt"; DestDir: "{app}\Filters\АктыСмертей"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыСмертей\Фамилия Имя Отчество (начинается с).flt"; DestDir: "{app}\Filters\АктыСмертей"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыУстОтцовства\Год и месяц актовой записи.flt"; DestDir: "{app}\Filters\АктыУстОтцовства"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыУстОтцовства\Номер и год актовой записи.flt"; DestDir: "{app}\Filters\АктыУстОтцовства"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыУстОтцовства\Аннулированные.flt"; DestDir: "{app}\Filters\АктыУстОтцовства"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыУстОтцовства\Орган регистрации.flt"; DestDir: "{app}\Filters\АктыУстОтцовства"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\ЗаключениеБраков\Год и месяц актовой записи.flt"; DestDir: "{app}\Filters\ЗаключениеБраков"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\ЗаключениеБраков\Номер и год актовой записи.flt"; DestDir: "{app}\Filters\ЗаключениеБраков"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\ЗаключениеБраков\Записи актов за период.flt"; DestDir: "{app}\Filters\ЗаключениеБраков"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\ЗаключениеБраков\Аннулированные.flt"; DestDir: "{app}\Filters\ЗаключениеБраков"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\ЗаключениеБраков\Орган регистрации.flt"; DestDir: "{app}\Filters\ЗаключениеБраков"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\РасторжениеБраков\Год и месяц актовой записи.flt"; DestDir: "{app}\Filters\РасторжениеБраков"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\РасторжениеБраков\Номер и год актовой записи.flt"; DestDir: "{app}\Filters\РасторжениеБраков"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\РасторжениеБраков\Аннулированные.flt"; DestDir: "{app}\Filters\РасторжениеБраков"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\РасторжениеБраков\Орган регистрации.flt"; DestDir: "{app}\Filters\РасторжениеБраков"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\DeclareMarriage\Дата заключения брака.flt"; DestDir: "{app}\Filters\DeclareMarriage"; Flags: ignoreversion;

Source: "E:\Projects\Selsovet7\Filters\ДополнительныйДокументы\По типу документа и фамилии.flt"; DestDir: "{app}\Filters\ДополнительныйДокументы"; Flags: ignoreversion;
;Source: "E:\Projects\Selsovet7\ServiceZAGS\*.*"; DestDir: "{app}\Service"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Service\*.*"; DestDir: "{app}\Service"; Excludes: "*.xml,*smdo*.*,fmGurnNasel.*,fmGurnAdres.*,fmGurnPass*.*,fmGurnParen*.*,fmGurnAlfKn.*,fmGurnVUS.*,fmGurnTalon*.*,fmGurnAktZ.*,fmGurnOwners*.*,OpisFilter*.*,pu.pas,progo.pas,progz.pas,minsk.pas,GISUN*.ini,Obrabotka.ini,personal.pas,ochered.pas,*Och.*,*Ochered.*,*GKH.*,*ZAH.*,*Opeka.*,*Opek.*,MRUList.ini,Actions.ini,Parameters.tsk,NewParams.tsk,*.bak"; Flags: ignoreversion; Components: program
;Source: "E:\Projects\Selsovet7\Service\*.*"; DestDir: "{app}\Service"; Excludes: "progo.pas,progz.pas,GISUN*.ini,OpisFilter*.ini,personal.pas,MRUList.ini,*Ochered.*,*Och.*,*Opeka.*,*GKH.*,*ZAH.*,*Opek.*,*Zags.*,NewParams.tsk,*.bak"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Install\Default\personal.pas"; DestDir: "{app}\Service"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Install\Default\ochered.pas"; DestDir: "{app}\Service"; Flags: ignoreversion; Components: program
Source: "E:\Projects\Selsovet7\Install\Default\minsk.pas";DestDir: "{app}\Service"; Flags: ignoreversion;
Source: "E:\Projects\Selsovet7\Install\Default\pu.pas";DestDir: "{app}\Service"; Flags: ignoreversion;
Source: "E:\Projects\Selsovet7\Work\ParamZAGS.loc"; DestDir: "{app}\Work"; Flags: ignoreversion; Components: program
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
Name: "{app}\Work"
Name: "{app}\NewData"
Name: "{app}\SQL"
Name: "{app}\Arxiv"
Name: "{app}\Update"

[Icons]
Name: "{group}\ЗАГС"; Filename: "{app}\ZAGS.exe"; WorkingDir: "{app}"
Name: "{group}\Документация"; Filename: "{app}\Doc\Документация ЗАГС.doc"; WorkingDir: "{app}"
Name: "{group}\Удаление индексных файлов"; Filename: "{app}\DeleteIndex.exe"; WorkingDir: "{app}"; IconFilename: "{app}\UpdateInd.ico"; Components: data
Name: "{group}\Переключение типа сервера"; Filename: "{app}\UpdateProg.exe"; Parameters:"/TYPESERVER"; WorkingDir: "{app}"; IconFilename: "{app}\Update.ico"; Components: data
#ifdef GISUN
  Name: "{group}\Параметры ГИС РН"; Filename: "{app}\UpdateProg.exe"; Parameters:"/GISUN"; WorkingDir: "{app}"; IconFilename: "{app}\Gisun.ico"; Components: data
#endif
Name: "{group}\Удалить программу"; Filename: "{uninstallexe}";
Name: "{userdesktop}\ЗАГС"; Filename: "{app}\ZAGS.exe"; Tasks: desktopicon; WorkingDir: "{app}"
Name: "{userdesktop}\Документация ЗАГС"; Filename: "{app}\Doc\Документация ЗАГС.doc"; Tasks: desktopicon; WorkingDir: "{app}"

[Run]
Filename: "{app}\ZAGS.exe"; Description: "ЗАГС"; Flags: nowait postinstall skipifsilent

[Registry]
root:HKCU;subkey:"Software\VCBOUS"; Flags: uninsdeletekeyifempty
root:HKCU;subkey:"Software\VCBOUS\ZAGS"; Flags: uninsdeletekey
root:HKCU;subkey:"Software\VCBOUS\ZAGS";valuetype:string;valuename:"installpath";valuedata:"{app}"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\ZAGS";valuetype:string;valuename:"version";valuedata:"9.1.0"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\ZAGS";valuetype:string;valuename:"update";valuedata:"184"; Flags: uninsdeletevalue

[UninstallDelete]
Type: filesandordirs; Name: "{app}\LastUpdate"
Type: filesandordirs; Name: "{app}\Work"
Type: filesandordirs; Name: "{app}\BackUp"
Type: filesandordirs; Name: "{app}\Update"
Type: filesandordirs; Name: "{app}\Export"
Type: filesandordirs; Name: "{app}\DocArxiv"
Type: filesandordirs; Name: "{app}\NewData"
Type: filesandordirs; Name: "{app}\SQL"
Type: filesandordirs; Name: "{app}\Report"
Type: filesandordirs; Name: "{app}\Template"
Type: filesandordirs; Name: "{app}\Service"
Type: filesandordirs; Name: "{app}\SaveDok"
Type: filesandordirs; Name: "{app}\Filters"
Type: filesandordirs; Name: "{app}\Arxiv"
;Type: filesandordirs; Name: "{app}\Data"
Type: filesandordirs; Name: "{app}\Spr"
Type: filesandordirs; Name: "{app}\Tmp"
Type: filesandordirs; Name: "{app}\Doc"
;Type: filesandordirs; Name: "{app}\AutoBackup"
;Type: filesandordirs; Name: "{app}\AutoBackup2"
Type: files; Name: "{app}\*.csv"
Type: files; Name: "{app}\*.xml"
Type: files; Name: "{app}\*.txt"
Type: files; Name: "{app}\lastuser"
Type: files; Name: "{app}\version"
Type: files; Name: "{app}\current_organ"
Type: files; Name: "{app}\key"
Type: files; Name: "{app}\UpdateInd.ico"
Type: files; Name: "{app}\LastUpdate.ico"
Type: files; Name: "{app}\Gisun.ico"
Type: files; Name: "{app}\shtamp.doc"
Type: files; Name: "{app}\shtamp_gerb.doc"

[Code]
//const
//var
//  DataDir: String;

function GetProgDir(DefaultVal : String):String;
begin
  Result:=ExpandConstant('{sd}');
end;

function NextButtonClick(CurPage: Integer): Boolean;
var
  ResultCode : Integer;
  s : String;
//  FreeMB, TotalMB:Cardinal;
begin
  
  //s := ExpandConstant('{pf}');
  //if GetSpaceOnDisk('s:', True, FreeMB, TotalMB) then
  //begin
//    MsgBox('There are ' + IntToStr(FreeMB) + ' megabytes free on '
    //, mbInformation, MB_OK);
  //end
  //else begin
//    MsgBox('Error', mbInformation, MB_OK);
//  end;

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
    RegWriteStringValue(HKCU, 'Software\VCBOUS\ZAGS', 'maincomp', s);
  end;
end;


