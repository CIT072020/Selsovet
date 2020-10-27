
#define AppZAGS
;#define AppLAIS

;#define AppGKH
;#define AppOCH
;#define SELSOVET_TO_LAIS
#define ADS

#define GISUN
#define GISUN2

;#define CHECK_VER_ADS
[Setup]
Compression=lzma/max
;bzip/9
WizardImageFile=compiler:MY_WIZMODERNIMAGE.BMP
WizardSmallImageFile=compiler:MY_WIZMODERNSMALLIMAGE.BMP
#ifdef AppGKH
  AppName=Обновление "ЖКХ"
  AppVerName=Обновление "ЖКХ" №135
#else
  #ifdef AppZAGS
    AppName=Обновление "ЗАГС"
    AppVerName=Обновление "ЗАГС" №136
  #else
    #ifdef AppOCH
      AppName=Обновление "Учет очередников"
      AppVerName=Обновление "Учет очередников" №132
    #else
      AppName=Обновление ЛАИС
      AppVerName=Обновление ЛАИС №135
    #endif
  #endif
#endif
AppPublisher=Государственное предприятие "ЦИТ Белстата" e-mail:vc_bous@brest.by
UsePreviousAppDir=yes
DefaultDirName={code:GetProgDir}
#ifdef AppGKH
  DefaultGroupName=ЖКХ
#else
  #ifdef AppZAGS
    DefaultGroupName=ЗАГС
  #else
    #ifdef AppOCH
      DefaultGroupName=Очередники
    #else
      DefaultGroupName=ЛАИС
    #endif
  #endif
#endif
DisableDirPage=yes
DisableProgramGroupPage=yes
;DiskSliceSize=1400000
;DiskSpanning=yes
#ifdef AppGKH
  OutputBaseFilename=UpdateGKH135
#else
  #ifdef AppZAGS
    OutputBaseFilename=UpdateZAGS136
  #else
    #ifdef AppOCH
      OutputBaseFilename=UpdateOchered132
    #else
      OutputBaseFilename=UpdateLAIS135
    #endif
  #endif
#endif
AlwaysShowDirOnReadyPage=yes
Uninstallable=no
PrivilegesRequired=none
;Password=20060709

[Languages]
;Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "ru"; MessagesFile: "compiler:Russian.isl"

[Files]
#ifdef AppGKH
Source: "E:\Projects\SelSovet7\GKH.exe"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
#else
#ifdef AppZAGS
Source: "E:\Projects\SelSovet7\ZAGS.exe"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Copy\anynews"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
#else
#ifdef AppOCH
Source: "E:\Projects\SelSovet7\Ochered.exe"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
#else
Source: "E:\Projects\SelSovet7\Lais.exe"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Copy\anynews"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
#endif
#endif
#endif
Source: "E:\Projects\SelSovet7\busy.avi"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\SysParams.ini"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\CheckConnect.exe"; DestDir: "{code:GetProgDir}"; Flags: dontcopy
Source: "E:\Projects\SelSovet7\DeleteIndex.exe"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\LastUpdate.ico"; DestDir: "{app}"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\UpdateInd.ico"; DestDir: "{app}"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Update.ico"; DestDir: "{app}"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\BMP\Tools.ico"; DestDir: "{app}"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Gisun.ico"; DestDir: "{app}"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\UpdateProg.exe"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Data\SelSovet.add"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SelSovet.am"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SelSovet.ai"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adm"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocSubj.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocSubj.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocFileList.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocFileList.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocGroup.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocGroup.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprPrichSm.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprPrichSm.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprPerevod.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprPerevod.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
#ifdef GISUN2
  Source: "E:\Projects\SelSovet7\Data\ATE.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
  Source: "E:\Projects\SelSovet7\Data\ATE.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
#endif
;Source: "E:\Projects\SelSovet7\RichEdit\*.*"; DestDir: "{code:GetProgDir}\RichEdit"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Spr\*.*"; DestDir: "{code:GetProgDir}\Spr"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\SQL\*.*"; DestDir: "{code:GetProgDir}\SQL"; Flags: ignoreversion
#ifdef AppGKH
Source: "E:\Projects\SelSovet7\Doc\Руководство пользователя ЖКХ.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\Доработки ЖКХ.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
#else
#ifdef AppZAGS
Source: "E:\Projects\SelSovet7\Doc\Документация ЗАГС.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\Доработки ЗАГС.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
#else
#ifdef AppOCH
Source: "E:\Projects\SelSovet7\Doc\Руководство пользователя Очередники.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\Доработки Очередники.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\ЛАИС\РЕГУЛИРОВАНИЕ ЖИЛИЩНЫХ ОТНОШЕНИЙ.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\Очередь на жилье\Стандартные\*.flt"; DestDir: "{app}\Filters\Очередь на жилье\Стандартные"; Flags: ignoreversion;
#else
Source: "E:\Projects\SelSovet7\Filters\Население\Стандартные\*.flt"; DestDir: "{app}\Filters\Население\Стандартные"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\ЛицевыеCчета\Стандартные\*.flt"; DestDir: "{app}\Filters\ЛицевыеCчета\Стандартные"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\Обращения\*.flt"; DestDir: "{app}\Filters\Обращения\Стандартные"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\Дома\Стандартные\*.flt"; DestDir: "{app}\Filters\Дома\Стандартные"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\Очередь на жилье\Стандартные\*.flt"; DestDir: "{app}\Filters\Очередь на жилье\Стандартные"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\Руководство пользователя ЛАИС.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\Руководство по установке ЛАИС.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\Доработки ЛАИС.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\Об организации похозяйственного учета.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
#endif
#endif
#endif
Source: "E:\Projects\SelSovet7\Filters\АктыРождений\Год и месяц актовой записи.flt"; DestDir: "{app}\Filters\АктыРождений"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыРождений\Номер и год актовой записи.flt"; DestDir: "{app}\Filters\АктыРождений"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыРождений\Орган регистрации.flt"; DestDir: "{app}\Filters\АктыРождений"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыСмертей\Год и месяц актовой записи.flt"; DestDir: "{app}\Filters\АктыСмертей"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыСмертей\Номер и год актовой записи.flt"; DestDir: "{app}\Filters\АктыСмертей"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыСмертей\Орган регистрации.flt"; DestDir: "{app}\Filters\АктыСмертей"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыУстОтцовства\Год и месяц актовой записи.flt"; DestDir: "{app}\Filters\АктыУстОтцовства"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыУстОтцовства\Номер и год актовой записи.flt"; DestDir: "{app}\Filters\АктыУстОтцовства"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\АктыУстОтцовства\Орган регистрации.flt"; DestDir: "{app}\Filters\АктыУстОтцовства"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\ЗаключениеБраков\Год и месяц актовой записи.flt"; DestDir: "{app}\Filters\ЗаключениеБраков"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\ЗаключениеБраков\Номер и год актовой записи.flt"; DestDir: "{app}\Filters\ЗаключениеБраков"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\ЗаключениеБраков\Орган регистрации.flt"; DestDir: "{app}\Filters\ЗаключениеБраков"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\РасторжениеБраков\Год и месяц актовой записи.flt"; DestDir: "{app}\Filters\РасторжениеБраков"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\РасторжениеБраков\Номер и год актовой записи.flt"; DestDir: "{app}\Filters\РасторжениеБраков"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\РасторжениеБраков\Орган регистрации.flt"; DestDir: "{app}\Filters\РасторжениеБраков"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\DeclareMarriage\Дата заключения брака.flt"; DestDir: "{app}\Filters\DeclareMarriage"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\shtamp.doc"; DestDir: "{app}"; Flags: onlyifdoesntexist;
Source: "E:\Projects\SelSovet7\shtamp_gerb.doc"; DestDir: "{app}"; Flags: onlyifdoesntexist;
Source: "E:\Projects\SelSovet7\except.dic"; DestDir: "{app}"; Flags: onlyifdoesntexist;
Source: "E:\Projects\SelSovet7\padeg.dll"; DestDir: "{app}"; Flags: onlyifdoesntexist;
Source: "E:\Projects\SelSovet7\addkey.adt"; DestDir: "{app}"; Flags: ignoreversion;
#ifdef AppGKH
Source: "E:\Projects\SelSovet7\ServiceGKH\*.*"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion ; Excludes: "GISUN*.ini,MRUList.ini,Parameters.tsk,ParamGKH.tsk,NewParams.tsk"
Source: "E:\Projects\SelSovet7\ServiceGKH\NewParams.tsk"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\splash_ochered.bmp"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report\reportsGKH.ini"; DestDir: "{code:GetProgDir}\Report"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Template\*.*"; DestDir: "{code:GetProgDir}\Template"; Flags: ignoreversion
#else
#ifdef AppZAGS
Source: "E:\Projects\Selsovet7\Install\Default\minsk.pas";DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\ServiceZAGS\*.*"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion ; Excludes: "minsk.pas,GISUN*.ini,MRUList.ini,Parameters.tsk,ParamZags.tsk,NewParams.tsk"
Source: "E:\Projects\SelSovet7\ServiceZAGS\NewParams.tsk"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\splash_zags.bmp"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report\reportsZAGS.ini"; DestDir: "{code:GetProgDir}\Report"; Flags: ignoreversion
Source: "E:\Projects\Selsovet7\Template\*.*"; DestDir: "{code:GetProgDir}\Template"; Excludes: "Справка в налоговую*.doc,Справка на адресную пом*.doc,Справка о занимаемом*.doc,Справка о находящихся в собств*.doc,Справка о последнем месте ж*.doc,Справка о начисленной ж*.doc,Справка о нуждаемости в*.doc,РКК*.doc,Справка выписка из*.doc,Повестка ВУС*.doc,Справка фактической эксп*.doc,Справка с места ж*.doc,Справка о составе сем*.doc,Справка о месте ж*.doc,Акт обследования мат*.doc"; Flags: ignoreversion;
#else
#ifdef AppOCH
Source: "E:\Projects\Selsovet7\Filters\ДополнительныйДокументы\По типу документа и фамилии.flt"; DestDir: "{app}\Filters\ДополнительныйДокументы"; Flags: ignoreversion;
Source: "E:\Projects\Selsovet7\Install\Default\minsk.pas";DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\ServiceOchered\*.*"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion ; Excludes: "minsk.pas,GISUN*.ini,MRUList.ini,Parameters.tsk,ParamZags.tsk,NewParams.tsk"
Source: "E:\Projects\SelSovet7\ServiceOchered\NewParams.tsk"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\splash_ochered.bmp"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report\reportsOchered.ini"; DestDir: "{code:GetProgDir}\Report"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Template\*.*"; DestDir: "{code:GetProgDir}\Template"; Flags: ignoreversion
#else
Source: "E:\Projects\SelSovet7\ServiceSelSovet\*.*"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion; Excludes: "GISUN*.ini,MRUList.ini,Parameters.tsk,ParamZags.tsk,NewParams.tsk"
Source: "E:\Projects\SelSovet7\ServiceSelSovet\NewParams.tsk"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\splash_lais.bmp"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report\reports.ini"; DestDir: "{code:GetProgDir}\Report"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Template\*.*"; DestDir: "{code:GetProgDir}\Template"; Flags: ignoreversion
#endif
#endif
#endif
Source: "E:\Projects\SelSovet7\Report\*.*"; DestDir: "{code:GetProgDir}\Report"; Excludes: "reports.ini,reportsGKH.ini,reportsOchered.ini,reportsZAGS.ini"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report3\*.*"; DestDir: "{code:GetProgDir}\Report3"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\TemplateExcel\*.*"; DestDir: "{code:GetProgDir}\TemplateExcel"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Update\update.ini"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Update\update.pas"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
#ifdef GISUN
  #ifdef GISUN2
    Source: "E:\Projects\SelSovet7\Gisun3\gisun.ini"; DestDir: "{code:GetProgDir}\Service"; Flags: onlyifdoesntexist; Check: IsMainComp
    Source: "E:\Projects\SelSovet7\Gisun3\gisun_input.ini"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion; Check: IsMainComp
    Source: "E:\Projects\SelSovet7\Gisun3\gisun_output.ini"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion; Check: IsMainComp
  #else
    Source: "E:\Projects\SelSovet7\Gisun\gisun.ini"; DestDir: "{code:GetProgDir}\Service"; Flags: onlyifdoesntexist; Check: IsMainComp
    Source: "E:\Projects\SelSovet7\Gisun\gisun_input.ini"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion; Check: IsMainComp
    Source: "E:\Projects\SelSovet7\Gisun\gisun_output.ini"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion; Check: IsMainComp
  #endif
#endif

#ifdef ADS
  #ifdef ADS10
    Source: "E:\Delphi7\CompSet\ADS10\TDataSet\Redistribute\*.*"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
  #else
    Source: "E:\Delphi7\CompSet\ADS8\TDataSet\Redistribute\*.*"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
  #endif
;Source: "E:\ADS\adtfix.exe"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
;Source: "E:\ADS\ARC\arc32.exe"; DestDir: "{code:GetProgDir}\Update\SysFiles"; Flags: ignoreversion
;Source: "E:\ADS\ARC\freeadt.exe"; DestDir: "{code:GetProgDir}\Update\SysFiles"; Flags: ignoreversion
;Source: "E:\ADS\ARC\win32env.exe"; DestDir: "{code:GetProgDir}\Update\SysFiles"; Flags: ignoreversion
#endif

[InstallDelete]
;Type: files; Name:"{app}\report\Empty.frf"

; было [__Icons__]
;Name: "{group}\Удаление индексных файлов "; Filename: "{app}\DeleteIndex.exe"; WorkingDir: "{app}"; IconFilename: "{app}\UpdateInd.ico"; Check: IsMainComp
;Name: "{group}\Переключение типа сервера "; Filename: "{app}\UpdateProg.exe"; Parameters:"/TYPESERVER"; WorkingDir: "{app}"; IconFilename: "{app}\Update.ico"; Check: IsMainComp
;#ifdef GISUN
;Name: "{group}\Параметры ГИСУН "; Filename: "{app}\UpdateProg.exe"; Parameters:"/GISUN"; WorkingDir: "{app}"; IconFilename: "{app}\Gisun.ico"; Check: IsMainComp
;#endif
;Name: "{group}\Последнее обновление "; Filename: "{app}\LastUpdate\LastUpdate.exe"; WorkingDir: "{app}"; IconFilename: "{app}\LastUpdate.ico"

[Icons]
#ifdef AppGKH
Name: "{group}\Переключение типа сервера"; Filename: "{app}\UpdateProg.exe"; Parameters:"/TYPESERVER"; WorkingDir: "{app}"; IconFilename: "{app}\Update.ico"; Check: IsMainComp
Name: "{group}\Последнее обновление"; Filename: "{app}\LastUpdate\LastUpdate.exe"; WorkingDir: "{app}"; IconFilename: "{app}\LastUpdate.ico"
#else
#ifdef AppZAGS
Name: "{group}\Переключение типа сервера"; Filename: "{app}\UpdateProg.exe"; Parameters:"/TYPESERVER"; WorkingDir: "{app}"; IconFilename: "{app}\Update.ico"; Check: IsMainComp
Name: "{group}\Последнее обновление"; Filename: "{app}\LastUpdate\LastUpdate.exe"; WorkingDir: "{app}"; IconFilename: "{app}\LastUpdate.ico"
  #ifdef GISUN
    Name: "{group}\Параметры ГИС РН"; Filename: "{app}\UpdateProg.exe"; Parameters:"/GISUN"; WorkingDir: "{app}"; IconFilename: "{app}\Gisun.ico"; Check: IsMainComp
  #endif
Name: "{group}\Сервис"; Filename: "{app}\UpdateProg.exe"; Parameters:"/SERVICE /ZAGS"; WorkingDir: "{app}"; IconFilename: "{app}\Tools.ico"; Check: IsMainComp
#else
#ifdef AppOCH

#else
Name: "{group}\ЛАИС"; Filename: "{app}\Lais.exe"; WorkingDir: "{app}"
Name: "{group}\Документация"; Filename: "{app}\Doc\Руководство пользователя ЛАИС.doc"; WorkingDir: "{app}"
Name: "{group}\Переключение типа сервера"; Filename: "{app}\UpdateProg.exe"; Parameters:"/TYPESERVER"; WorkingDir: "{app}"; IconFilename: "{app}\Update.ico"; Check: IsMainComp
Name: "{group}\Удаление индексных файлов"; Filename: "{app}\DeleteIndex.exe"; WorkingDir: "{app}"; IconFilename: "{app}\UpdateInd.ico"; Check: IsMainComp
Name: "{group}\Последнее обновление"; Filename: "{app}\LastUpdate\LastUpdate.exe"; WorkingDir: "{app}"; IconFilename: "{app}\LastUpdate.ico"
Name: "{group}\Сервис"; Filename: "{app}\UpdateProg.exe"; Parameters:"/SERVICE /LAIS"; WorkingDir: "{app}"; IconFilename: "{app}\Tools.ico"; Check: IsMainComp
  #ifdef GISUN
    Name: "{group}\Параметры ГИС РН"; Filename: "{app}\UpdateProg.exe"; Parameters:"/GISUN"; WorkingDir: "{app}"; IconFilename: "{app}\Gisun.ico"; Check: IsMainComp
  #endif
Name: "{userdesktop}\ЛАИС"; Filename: "{app}\LAIS.exe"; WorkingDir: "{app}"
Name: "{userdesktop}\Документация ЛАИС"; Filename: "{app}\Doc\Руководство пользователя ЛАИС.doc"; WorkingDir: "{app}"
#endif
#endif
#endif

[Registry]
root:HKCU;subkey:"Software\VCBOUS"; Flags: uninsdeletekeyifempty
#ifdef AppGKH
root:HKCU;subkey:"Software\VCBOUS\GKH"; Flags: uninsdeletekey
root:HKCU;subkey:"Software\VCBOUS\GKH";valuetype:string;valuename:"installpath";valuedata:"{app}"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\GKH";valuetype:string;valuename:"version";valuedata:"5.6.0"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\GKH";valuetype:string;valuename:"update";valuedata:"135"; Flags: uninsdeletevalue
#else
#ifdef AppZAGS
root:HKCU;subkey:"Software\VCBOUS\ZAGS"; Flags: uninsdeletekey
root:HKCU;subkey:"Software\VCBOUS\ZAGS";valuetype:string;valuename:"installpath";valuedata:"{app}"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\ZAGS";valuetype:string;valuename:"version";valuedata:"5.6.1"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\ZAGS";valuetype:string;valuename:"update";valuedata:"136"; Flags: uninsdeletevalue
#else
#ifdef AppOCH
root:HKCU;subkey:"Software\VCBOUS\Ochered"; Flags: uninsdeletekey
root:HKCU;subkey:"Software\VCBOUS\Ochered";valuetype:string;valuename:"installpath";valuedata:"{app}"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\Ochered";valuetype:string;valuename:"version";valuedata:"5.4.4"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\Ochered";valuetype:string;valuename:"update";valuedata:"132"; Flags: uninsdeletevalue
#else
root:HKCU;subkey:"Software\VCBOUS\LAIS"; Flags: uninsdeletekey
root:HKCU;subkey:"Software\VCBOUS\LAIS";valuetype:string;valuename:"installpath";valuedata:"{app}"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\LAIS";valuetype:string;valuename:"version";valuedata:"5.6.0"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\LAIS";valuetype:string;valuename:"update";valuedata:"135"; Flags: uninsdeletevalue
#endif
#endif
#endif

[Code]
const
#ifdef AppZAGS
  IDUpdate = '136';
  IDProg   = '5.6.1';
#else
  #ifdef AppOCH
    IDUpdate = '132';
    IDProg   = '5.4.4';
  #else
    IDUpdate = '135';
    IDProg   = '5.6.0';
  #endif
#endif

  NAME_DICT = 'SelSovet.add';
  REG_NAME_SS = 'SELSOVET';
  NameExeProg_SS = 'SelSovet.exe';
  NameExeProg_LAIS = 'LAIS.exe';
#ifdef AppGKH
  NameExeProg = 'GKH.exe';
  REG_NAME = 'GKH';
  PROG_NAME = 'ЖКХ';
#else
#ifdef AppZAGS
  NameExeProg = 'ZAGS.exe';
  REG_NAME = 'ZAGS';
  PROG_NAME = 'ЗАГС';
#else
#ifdef AppOCH
  NameExeProg = 'Ochered.exe';
  REG_NAME = 'OCHERED';
  PROG_NAME = 'Очередники';
#else
  NameExeProg = 'LAIS.exe';
  REG_NAME = 'LAIS';
  PROG_NAME = 'ЛАИС';
#endif
#endif
#endif
var
  DataDir: String;
  strVer : String;
  strUser : String;
  ckBackup : TCheckBox;
  edPassword : TEdit;
  lb : TNewStaticText;
  ProgressPage: TOutputProgressWizardPage;
  strIni, strSysIni : String;
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
  strFileUpdate : String;
  lSelSovetToLAIS:Boolean;
//  lRunChange:Boolean;
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
    ProgressPage.SetText('Выполнение отката ...', 'Исполняемый модуль.');
    ProgressPage.SetProgress(m, n);
    m:=m+1;
    #ifdef SELSOVET_TO_LAIS
    if lSelsovetToLAIS then begin
      if not FileCopy(PathBackUp+NameExeProg_SS, strPath+NameExeProg_SS, false) then begin
        PutError('Ошибка копирования файла : '+PathBackUp+NameExeProg_SS);
        Result := false;
      end;
      DeleteFile(strPath+NameExeProg_LAIS);
    end else begin
      if not FileCopy(PathBackUp+NameExeProg, strPath+NameExeProg, false) then begin
        PutError('Ошибка копирования файла : '+PathBackUp+NameExeProg);
        Result := false;
      end;
    end;
    #else
    if not FileCopy(PathBackUp+NameExeProg, strPath+NameExeProg, false) then begin
      PutError('Ошибка копирования файла : '+PathBackUp+NameExeProg);
      Result := false;
    end;
    #endif
    if Result and lMainComp then begin
      if not FileCopy(PathBackUp+'UpdateProg.exe', strPath+'UpdateProg.exe', false) then begin
        PutError('Ошибка копирования файла : '+PathBackUp+'UpdateProg.exe');
        Result := false;
      end;
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
  n:=6;
  if Result then begin
    if lUpdateSpr then begin
      if Result then begin
        ProgressPage.SetText('Выполнение...', 'Системные справочники.');
        ProgressPage.SetProgress(m, n);
        m:=m+1;
        Result := CopyDir(strPath+'Spr\',PathBackUp+'Spr\','');
      end;
    end;
    if lUpdateData then begin
      if Result then begin
        ProgressPage.SetText('Выполнение...', 'База данных.');
        ProgressPage.SetProgress(m, n);
        m:=m+1;
        Result := CopyDir( strPath+'Data\', PathBackUp+'Data\','');
      end;
    end;
    if lUpdateSysFiles then begin
      if Result then begin
        ProgressPage.SetText('Выполнение...', 'Системные файлы.');
        ProgressPage.SetProgress(m, n);
        m:=m+1;
        Result := CopyDir(strPath, PathBackUp+'SysFiles\', NameExeProg+';UpdateProg.exe;');
      end;
    end;
    if Result then begin
      ProgressPage.SetText('Выполнение...', 'Исполняемый модуль.');
      ProgressPage.SetProgress(m, n);
      m:=m+1;
      #ifdef SELSOVET_TO_LAIS
      if lSelsovetToLAIS then begin
        if not FileCopy(strPath+NameExeProg_SS,PathBackUp+NameExeProg_SS, false) then begin
          PutError('Ошибка копирования файла : '+strPath+NameExeProg_SS);
          Result := false;
        end;
      end else begin
        if not FileCopy(strPath+NameExeProg,PathBackUp+NameExeProg, false) then begin
          PutError('Ошибка копирования файла : '+strPath+NameExeProg);
          Result := false;
        end;
      end;
      #else
      if not FileCopy(strPath+NameExeProg,PathBackUp+NameExeProg, false) then begin
        PutError('Ошибка копирования файла : '+strPath+NameExeProg);
        Result := false;
      end;
      #endif
      if Result and lMainComp then begin
        if not FileCopy(strPath+'UpdateProg.exe',PathBackUp+'UpdateProg.exe', false) then begin
          PutError('Ошибка копирования файла : '+strPath+'UpdateProg.exe');
          Result := false;
        end;
      end;
    end;
    if Result then begin
      for i:=0 to ListDir.Count-1 do begin
        s := ListDir.Strings[i];
        j:=Pos('=',s);
        strDir     := Copy(s,1,j-1);
        strNameDir := Copy(s,j+1,100);
        ProgressPage.SetText('Выполнение...', strNameDir+'.');
        ProgressPage.SetProgress(m, n);
        m:=m+1;
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
function InitializeSetup(): Boolean;
var
  i : Integer;
  s,ss,strDir : String;
  lOk,lCheckBase:Boolean;
begin
  lOkBackUp := false;
  ListDir := TStringList.Create;

//  ExtractTemporaryFile('CopyLastUpdate.exe');
//  strFileUpdate := ExpandConstant('{tmp}\CopyLastUpdate.exe');

  ExtractTemporaryFile('update.ini');
  strIni := ExpandConstant('{tmp}\update.ini');

  ExtractTemporaryFile('SysParams.ini');
  strSysIni := ExpandConstant('{tmp}\SysParams.ini');

  strDir  := 'C:\';
  DataDir := '';

  Result:=RegQueryStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'installpath', DataDir);
  if Result then begin
    lOk:=RegQueryStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'update', strOldUpdate);
    if not lOk then strOldUpdate:='0';
  end;

  lSelSovetToLAIS:=false;
  
  #ifdef SELSOVET_TO_LAIS
  if not Result then begin  //
    // попробуем поставить обновление на Сельский Совет
    Result:=RegQueryStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME_SS, 'installpath', DataDir);
    if Result then begin  // если нет ЛАИС и есть Сельский Совет
      lOk:=RegQueryStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME_SS, 'update', strOldUpdate);
      if not lOk then strOldUpdate:='0';
      lSelSovetToLAIS:=true;
    end;
  end;
  #endif
  
  if Result then begin
    // на главном компьтере проверяем наличие базы, в остальных случаях exe-файла
    if GetIniString('ADMIN', 'MAINCOMP', '0', AddBackSlash(DataDir)+'SysParams.ini')='1' then begin
      lCheckBase:=true;
    end else begin
      lCheckBase:=false;
    end;
    if lCheckBase then begin  // на главном компьютере ищем словарь
      lOk:=FileExists(DataDir+'\Data\'+Name_Dict);
    end else begin           // на сетевом компьютере ищем exe-файл
      if lSelSovetToLAIS
        then lOk:=FileExists(DataDir+'\'+NameExeProg_SS)
        else lOk:=FileExists(DataDir+'\'+NameExeProg);
    end;
    Result:=lOk;
  end;
  #ifdef SELSOVET_TO_LAIS
  if Result and lSelSovetToLAIS then begin
//    RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'installpath', DataDir)
//    RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'version', IDProg);
//    RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'update', '0');
  end;
  #endif
  if not Result then begin
    while BrowseForFolder('Выберите папку с программой '+PROG_NAME, strDir, false) do begin
      // на главном компьтере проверяем наличие базы, в остальных случаях exe-файла
      if GetIniString('ADMIN', 'MAINCOMP', '0', AddBackSlash(strDir)+'SysParams.ini')='1' then begin
        lCheckBase:=true;
      end else begin
        lCheckBase:=false;
      end;
      if lCheckBase then begin  // на главном компьютере ищем словарь
        lOk:=FileExists(strDir+'\Data\'+Name_Dict);
      end else begin           // на сетевом компьютере ищем exe-файл
        if lSelSovetToLAIS then begin
          lOk:=FileExists(strDir+'\'+NameExeProg_SS)
        end else begin
          lOk:=FileExists(strDir+'\'+NameExeProg);
          if not lOk then begin  // вдруг антивирус удалил exe-файл
            if FileExists(strDir+'\Service\prog.pas') or FileExists(strDir+'\SysParams.ini') then begin
              lOk:=true;
            end;
          end;
        end;
      end;
      if lOk then begin
        DataDir := strDir;
        Result  := true;
        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'installpath', DataDir)
        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'version', IDProg);
        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'update', '0');
        break;
      end else begin
        MsgBox('Папка выбрана неверно !', mbError, MB_OK);
      end;
    end;
  end;
  
  if Result then begin
  
  if not IniKeyExists('MAIN', 'ID', strIni) then begin
    MsgBox(' Не найден файл инициализации ! ', mbError, MB_OK);
    Result := false;
  end else begin
    //-------- определение необходимости установки обновления --------
    try
      if StrToInt(strOldUpdate) > StrToInt(IDUpdate) then begin
        MsgBox(' Установка обновления <'+IDUpdate+'> не требуется ! ', mbInformation, MB_OK);
        Result := false;
      end;
      if StrToInt(strOldUpdate) = StrToInt(IDUpdate) then begin
        if MsgBox(' Обновление <'+IDUpdate+'> уже устанавливалось. Хотите установить повторно ? ', mbConfirmation, MB_YESNO) = IDNO then begin
          Result := false;
        end;
      end;
    except
    end;
    //-------------------------------------------------------------------
    if Result then begin
      #ifdef CHECK_VER_ADS
      if DataDir<>'' then begin
        if LoadStringFromFile(DataDir+'\ace32.dll', s) then begin
          if Pos('8.1',s) = 0 then begin
            MsgBox('Предварительно необходимо обновить версию СУБД.', mbError, MB_OK);
            Result := false;
          end;
        end else begin
          MsgBox('Невозможно определить версию СУБД.', mbError, MB_OK);
          Result := false;
        end;
        s:='';
      end;
      #endif
      if DataDir<>'' then begin
        // перед установкой создадим необходимые папки
        ForceDirectories(AddBackSlash(DataDir)+'DocArxiv');
        // перед установкой удалим стандартные отборы
        DelTree(AddBackSlash(DataDir)+'Filters\Население\Стандартные', False, True, True);
        DelTree(AddBackSlash(DataDir)+'Filters\ЛицевыеCчета\Стандартные', False, True, True);
        DelTree(AddBackSlash(DataDir)+'Filters\Дома\Стандартные', False, True, True);
        
        if DirExists(AddBackSlash(DataDir)+'Filters\Население\Призывники.flt') then begin
          DelTree(AddBackSlash(DataDir)+'Filters\Население\Призывники.flt', True, True, True);
        end;
        // скопируем файл со старым описанием обработки
        #ifdef AppZAGS
          if FileExists(AddBackSlash(DataDir)+'Service\ObrabotkaZAGS.ini') then begin
            FileCopy(AddBackSlash(DataDir)+'Service\ObrabotkaZAGS.ini',AddBackSlash(DataDir)+'Update\ObrabotkaZAGS.ini', false);
          end;
        #else
          if FileExists(AddBackSlash(DataDir)+'Service\obrabotka.ini') then begin
            FileCopy(AddBackSlash(DataDir)+'Service\obrabotka.ini',AddBackSlash(DataDir)+'Update\obrabotka.ini', false);
          end;
        #endif
        
        // считаем что файл SysParam.ini запорчен
        if (GetIniString('ADMIN', 'MAINCOMP', '', AddBackSlash(DataDir)+'SysParams.ini')='') or
           (GetIniString('SYS_PAR_QUERY', 'CHAR_SET', '', AddBackSlash(DataDir)+'SysParams.ini')='') then begin
          if FileExists(strSysIni) then begin
            FileCopy( strSysIni, AddBackslash(DataDir)+'SysParams.ini', false);
  //          MsgBox('Файл системных параметров разрушен. '+Chr(13)+'Будет произведено его восстановление.', mbError, MB_OK);
            if MsgBox(' Компьютер является основным (с базой данных) ? ', mbConfirmation, MB_YESNO) = IDYES
              then s := '1' else s := '0';
            SetIniString('ADMIN', 'MAINCOMP', s, AddBackslash(DataDir)+'SysParams.ini');
            RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'maincomp', s);
          end;
        end;
        
        lMainComp := GetIniBool('ADMIN', 'MAINCOMP', true, AddBackSlash(DataDir)+'SysParams.ini');
        if lMainComp then begin
//          ShowMessage(' Main Computer ');
          lUpdateData := GetIniBool('MAIN', 'DATA', false, strIni);
          lUpdateSpr  := GetIniBool('MAIN', 'SYSSPR', false, strIni);
          lUpdateParam:= GetIniBool('MAIN', 'PARAMS', false, strIni);
        end else begin
//          ShowMessage(' Not Main Computer ');
          lUpdateData := false;
          lUpdateSpr  := false;
          lUpdateParam:= false;
        end;
        lUpdateSysFiles:= GetIniBool('MAIN', 'SYSFILES', false, strIni);
        // дополнительные каталоги  (например Report,Service)
        if GetIniBool('MAIN', 'DIR', false, strIni) then begin
          for i:=1 to 20 do begin
            s := GetIniString('DIR', IntToStr(i), '', strIni);
            if s <> '' then begin
              ss := GetIniString('DIRNAME', s, s, strIni);
              ListDir.Add(s+'='+ss);
//            MsgBox(s+'='+ss, mbError, MB_OK);
            end;
          end;
        end;
        Result := true;
        if DataDir='' then begin
          MsgBox('Каталог для установки обновления программы "'+PROG_NAME+'" не найден', mbError, MB_OK);
          Result := false;
        end else begin
//        if GetVersionNumbersString(DataDir+'\'+NameExeProg, strVer) then begin
//          MsgBox('Текущая версия программы:'+strVer, mbInformation, mb_Ok);
//        end;
        end;
      end else begin
        MsgBox('Каталог для установки обновления программы "'+PROG_NAME+'" не найден', mbError, MB_OK);
        Result := false;
      end;
    end;
  end;
  
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
  l:Boolean;
begin
  ProgressPage := CreateOutputProgressPage('Резервное копирование', '');
  ALeft  := WizardForm.WelcomeLabel2.Left;
  TopInc := WizardForm.CancelButton.Height + 8;
//  ATop   := WizardForm.WelcomeLabel2.Top + WizardForm.WelcomeLabel2.Height - 4*TopInc;
  ATop   := WizardForm.WelcomeLabel2.Top + 180;
  ckBackup := TCheckBox.Create(WizardForm);
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
  #ifdef SELSOVET_TO_LAIS
    if lSelSovetToLAIS then begin
      lb := TNewStaticText.Create(WizardForm);
      with lb do begin
        Left    := ALeft;
        Top     := ATop+27;
        Width   := 150;
        AutoSize:=true;
        Caption := 'ВНИМАНИЕ: Будет выполнена реорганизация'+chr(13)+'АС "Сельский Совет" в ЛАИС';
        Parent  := WizardForm.WelcomePage;
        Font.Color:=clBlue;
        WordWrap:=true;
      end;
    end;
  #endif

  if lMainComp then begin
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
end;
procedure CurStepChanged(CurStep: TSetupStep);
var
  ResultCode: Integer;
  i : Integer;
  ss : String;
begin
  if CurStep = ssInstall then begin

//    if IsComponentSelected('data') then begin
//      s := '1';
//    end else begin
//      s := '0';
//    end;
//    SetIniString('ADMIN', 'MAINCOMP', s, AddBackslash(ExpandConstant('{app}'))+'SysParams.ini');
//    RegWriteStringValue(HKCU, 'Software\VCBOUS\SELSOVET', 'maincomp', s);

  
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
#ifdef AppLAIS
  #ifdef GISUN2  
    if lMainComp and (IDUpdate='129') then begin
      SetIniString('ADMIN', 'ACTIVE', '0', AddBackslash(DataDir)+'Service\Gisun.ini');
      SetIniString('ADMIN', 'SUBMENU', '0', AddBackslash(DataDir)+'Service\Gisun.ini');
      SetIniString('ADMIN', 'MESSAGESOURCE', '', AddBackslash(DataDir)+'Service\Gisun.ini');
    end;
  #endif
#endif
    if IsRunUpdateBase and lMainComp then begin
      ss := ExpandConstant('{app}\UpdateProg.exe');
      if Exec(ss,'/USR:'+strUser+' /PSW:'+edPassword.Text+' /'+REG_NAME, '', SW_SHOW, ewWaitUntilTerminated, ResultCode) then begin
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
      RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'update', IDUpdate);
      RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'version', IDProg);
      #ifdef SELSOVET_TO_LAIS
      if lSelSovetToLAIS then begin
        RegDeleteKeyIncludingSubkeys(HKCU, 'Software\VCBOUS\'+REG_NAME_SS);
        RegWriteStringValue(HKLM, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\Сельский Совет_is1', 'DisplayName', 'ЛАИС');
        RegWriteStringValue(HKLM, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\Сельский Совет_is1', 'Inno Setup: Icon Group', 'ЛАИС');
        DeleteFile(AddBackslash( ExpandConstant('{app}') )+NameExeProg_SS);
        DeleteFile(AddBackslash( ExpandConstant('{app}') )+'unins000.exe');
        DeleteFile(AddBackslash( ExpandConstant('{app}') )+'Doc\Доработки СС.doc');
        DeleteFile(AddBackslash( ExpandConstant('{app}') )+'Doc\Документация Сельсовет.doc');
        DeleteFile(AddBackslash(ExpandConstant('{userdesktop}'))+'Сельский Совет.lnk');
        DeleteFile(AddBackslash(ExpandConstant('{userdesktop}'))+'Документация Сельский Совет.lnk');
        ss:=ExpandConstant('{group}');
        StringChange(ss, '\ЛАИС', '\Сельский Совет');
        DelTree(ss,true,true,true );
//        CreateShellLink( ExpandConstant('{userdesktop}')+'\ЛАИС.lnk',
//                        'ЛАИС',
//                        ExpandConstant('{app}')+'\LAIS.exe',
//                        '',
//                        ExpandConstant('{app}'),'',
//                        0,SW_SHOWNORMAL);
      end;
      #endif
      if Pos('LASTUPDATE.EXE',ANSIUpperCase(ExpandConstant('{srcexe}')))=0 then begin
        // полный путь и имя файла обновления
        RegWriteStringValue(HKCU, 'Software\VCBOUS', 'namelastupdate', ExpandConstant('{srcexe}'));
        RegWriteStringValue(HKCU, 'Software\VCBOUS', 'typelastupdate', REG_NAME);
      end else begin
        RegWriteStringValue(HKCU, 'Software\VCBOUS', 'namelastupdate', '');
        RegWriteStringValue(HKCU, 'Software\VCBOUS', 'typelastupdate', '');
      end;
      DeleteFile(AddBackslash(ExpandConstant('{app}'))+'version');
      SaveStringToFile(AddBackslash(ExpandConstant('{app}'))+'version', IDProg, false);
    end else begin
      #ifdef SELSOVET_TO_LAIS
      // если возникла ошибка при установке обновления
      if lSelSovetToLAIS then begin
        RegDeleteKeyIncludingSubkeys(HKCU, 'Software\VCBOUS\'+REG_NAME);        // Регистр
        DeleteFile(AddBackslash( ExpandConstant('{app}') )+'Doc\Доработки ЛАИС.doc');
        DeleteFile(AddBackslash( ExpandConstant('{app}') )+'Doc\Руководство пользователя ЛАИС.doc');
        DeleteFile(AddBackslash(ExpandConstant('{userdesktop}'))+'ЛАИС.lnk');               // Рабочий стол
        DeleteFile(AddBackslash(ExpandConstant('{userdesktop}'))+'Документация ЛАИС.lnk');
        DelTree(ExpandConstant('{group}'),true,true,true );   // программы (Все программы)
      end;
      #endif
      RegWriteStringValue(HKCU, 'Software\VCBOUS', 'typelastupdate', '');
      RegWriteStringValue(HKCU, 'Software\VCBOUS', 'namelastupdate', '');
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
    if lMainComp then begin
      if edPassword.Text='sysdba' then strUser := 'ADSSYS' else strUser:='АДМИНИСТРАТОР';
      ExtractTemporaryFile('CheckConnect.exe');
      ss := ExpandConstant('{tmp}\CheckConnect.exe');
      if FileCopy(ss, DataDir + '\CheckConnect.exe', false) then begin
//        MsgBox(ss+'  ->   '+DataDir + '\CheckConnect.exe', mbInformation, mb_Ok);
        ss := DataDir + '\CheckConnect.exe';
        //if Exec(ss,strUser+' '+Trim(edPassword.Text)+' ЛицевыеСчета', '',  SW_HIDE, ewWaitUntilTerminated, ResultCode) then begin
        if ShellExec('', ss, strUser+' '+Trim(edPassword.Text)+' ЛицевыеСчета', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then begin
//             MsgBox(IntToStr(ResultCode), mbInformation, mb_Ok);
          if ResultCode <> 0 then begin
            Result := false;
            if ResultCode = 9999 then begin
              MsgBox('Невозможно монопольно подключиться к базе данных.', mbError, mb_Ok);
            end else begin
              MsgBox('Ошибка подключения к базе данных: '+IntToStr(ResultCode), mbError, mb_Ok);
            end;
          end;
        end else begin
          MsgBox('CheckConnect.exe :'+SysErrorMessage(ResultCode), mbError, mb_Ok);
          Result := false;
        end;
      end;
    end else begin
      strUser:='АДМИНИСТРАТОР';
    end;
    #ifdef SELSOVET_TO_LAIS
      if Result and lSelSovetToLAIS then begin
//        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'installpath', DataDir)
//        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'version', IDProg);
//        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'update', '0');
//        if MsgBox('После установки программа "Сельский Совет"  будет недоступна. Вы согласны ?', mbConfirmation, MB_YESNO) = IDNO then begin
//          Result:=false;
//          RegDeleteKeyIncludingSubkeys(HKCU, 'Software\VCBOUS\'+REG_NAME);
//        end;
      end;
    #endif
  end;
end;

[Dirs]
Name: "{app}\LastUpdate"

[Run]
Filename: "{app}\UpdateProg.exe"; Parameters:"/LASTUPDATE"; Description: "Сохранить обновление"; WorkingDir: "{app}"; Flags: nowait postinstall skipifsilent
;Filename: "{app}\CheckConnect.exe"; Parameters:'/LASTUPDATE'; Description: "Сохранить последнее обновление"; Flags: nowait postinstall skipifsilent
;Filename: "{app}\SelSovet.exe"; Description: "Сельский Совет"; Flags: nowait postinstall skipifsilent
;Filename: "{app}\UpdateProg.exe"; Flags: nowait postinstall skipifsilent; Check: IsRunUpdateBase;
;Filename: "{app}\INIT.EXE"; Parameters: "/x"

[UninstallDelete]
Type: filesandordirs; Name: "{app}\LastUpdate"
Type: files; Name: "{app}\lastuser"
Type: files; Name: "{app}\version"
Type: files; Name: "{app}\current_organ"
Type: files; Name: "{app}\addkey.adt"
Type: files; Name: "{app}\shtamp.doc"
Type: files; Name: "{app}\shtamp_gerb.doc"
Type: files; Name: "{app}\key"
Type: files; Name: "{app}\UpdateInd.ico"
Type: files; Name: "{app}\GISUN.ico"
Type: files; Name: "{app}\LastUpdate.ico"


