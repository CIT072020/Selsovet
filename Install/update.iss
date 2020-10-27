;!!!!!!!!!!!!!!!!!!!   E:\Projects\Selsovet7\Install\update.iss
#define GISUN4   
;gisun_cur  !!!

;#define AppZAGS
;#define AppLAIS             
#define AppPost

;#define AppZAH
;#define AppOPEKA

;#define AppGKH
;#define AppOCH

;#define SELSOVET_TO_LAIS
#define ADS
#define ADS10

#ifdef AppPost
  #define SMDO
#endif
#ifdef AppZAGS
  #define ATE
  #define GISUN
  #define GISUN2
  #define GISUN3
  #define ZAGS_SMALL
  #define ZAGS_FULL
  #define BASE_SELSOVET
#endif
#ifdef AppLAIS
  #define ATE
  #define SMDO
  #define GISUN
  #define GISUN2
  #define GISUN3
  #define ZAGS_SMALL
  #define BASE_SELSOVET
#endif
#ifdef AppOCH
  #define BASE_SELSOVET
  #define ATE
#endif
#ifdef AppGKH
  #define BASE_SELSOVET
  #define ATE
#endif
#ifdef AppZAH
  #define ATE
  #define GISUN
  #define GISUN2
  #define GISUN3
#endif
#ifdef AppOPEKA
  #define GISUN
  #define GISUN2
  #define GISUN3
#endif

;#define CHECK_VER_ADS
[Setup]
Compression=lzma/max
;bzip/9
WizardImageFile=compiler:MY_WIZMODERNIMAGE.BMP
WizardSmallImageFile=compiler:MY_WIZMODERNSMALLIMAGE.BMP
;SetupLogging=yes
#ifdef AppGKH
  AppName=���������� "���"
  AppVerName=���������� "���" �147
  DefaultGroupName=���
  OutputBaseFilename=UpdateGKH147
#endif
#ifdef AppZAGS
  AppName=���������� "����"
  AppVerName=���������� "����" �184
  DefaultGroupName=����
  OutputBaseFilename=UpdateZAGS184
#endif
#ifdef AppOCH
  AppName=���������� "���� �����������"
  AppVerName=���������� "���� �����������" �166
  DefaultGroupName=����������
  OutputBaseFilename=UpdateOchered166
#endif
#ifdef AppZAH
  AppName=���������� "���� �����������"
  AppVerName=���������� "���� �����������" �26
  DefaultGroupName=���� �����������
  OutputBaseFilename=UpdateZAH26
#endif
#ifdef AppOPEKA
  AppName=���������� "����� � ��������������"
  AppVerName=���������� "����� � ��������������" �25
  DefaultGroupName=����� � ��������������
  OutputBaseFilename=UpdateOPEKA25
#endif
#ifdef AppPost
  AppName=���������� "����.����"
  AppVerName=���������� "����.����" �25
  DefaultGroupName=����.����
  OutputBaseFilename=UpdateLAISSMDO25
#endif
#ifdef AppLAIS
  AppName=���������� ����
  AppVerName=���������� ���� �191
  DefaultGroupName=����
  OutputBaseFilename=UpdateLAIS191
#endif
DefaultDirName={code:GetProgDir}
AppPublisher=��������������� ����������� "��� ��������" e-mail:vc_bous@brest.by
UsePreviousAppDir=yes
DisableDirPage=yes
DisableProgramGroupPage=yes
;DiskSliceSize=1400000
;DiskSpanning=yes
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
#endif
#ifdef AppZAGS
Source: "E:\Projects\SelSovet7\ZAGS.exe"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Copy\anynews"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
#endif
#ifdef AppOCH
Source: "E:\Projects\SelSovet7\Ochered.exe"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
#endif
#ifdef AppZAH
Source: "E:\Projects\SelSovet7\ZAH.exe"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Copy\anynews"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
#endif
#ifdef AppOPEKA
Source: "E:\Projects\SelSovet7\Opeka.exe"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Copy\anynews"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
#endif
#ifdef AppPost
Source: "E:\Projects\SelSovet7\LaisSmdo.exe"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Copy\anynews"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
#endif
#ifdef AppLAIS
Source: "E:\Projects\SelSovet7\Lais.exe"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Copy\anynews"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
#endif
Source: "E:\Projects\SelSovet7\busy.avi"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\CheckConnect.exe"; DestDir: "{code:GetProgDir}"; Flags: dontcopy
Source: "E:\Projects\SelSovet7\DeleteIndex.exe"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\LastUpdate.ico"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\UpdateInd.ico"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Update.ico"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\BMP\Tools.ico"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion; Check: IsMainComp
#ifdef GISUN
Source: "E:\Projects\SelSovet7\Gisun.ico"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion; Check: IsMainComp
#endif
Source: "E:\Projects\SelSovet7\UpdateProg.exe"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion;
#ifdef AppZAH
Source: "E:\Projects\SelSovet7\Data\Base.add"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\Base.am"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\Base.ai"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adm"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProcU.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProcU.adm"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProcU.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocSubj.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocSubj.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocFileList.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocFileList.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocGroup.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocGroup.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprPerevod.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprPerevod.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
#endif
#ifdef AppOpeka
Source: "E:\Projects\SelSovet7\Data\Base.add"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\Base.am"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\Base.ai"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adm"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProcU.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProcU.adm"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProcU.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocSubj.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocSubj.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocFileList.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocFileList.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
;Source: "E:\Projects\SelSovet7\Data\SprDocGroup.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
;Source: "E:\Projects\SelSovet7\Data\SprDocGroup.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprPerevod.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprPerevod.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprChildPrich.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprChildPrich.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
#endif
#ifdef AppPost
Source: "E:\Projects\SelSovet7\Data\Base.add"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\Base.am"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\Base.ai"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adm"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProcU.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProcU.adm"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProcU.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocSubj.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocSubj.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocFileList.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocFileList.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocGroup.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocGroup.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprPerevod.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprPerevod.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
#endif
#ifdef BASE_SELSOVET
Source: "E:\Projects\SelSovet7\Data\SelSovet.add"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SelSovet.am"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SelSovet.ai"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adm"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProc.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProcU.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProcU.adm"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocAdmProcU.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocSubj.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocSubj.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocFileList.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocFileList.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocGroup.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprDocGroup.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprPerevod.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SprPerevod.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Install\Default\Selsovet\SysParams.ini"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
#else
Source: "E:\Projects\SelSovet7\Install\Default\Base\SysParams.ini"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
#endif
#ifdef SMDO
Source: "E:\Projects\SelSovet7\Data\SMDOSprVidDok.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SMDOSprVidDok.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SMDOSprOrg.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\Data\SMDOSprOrg.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
#endif
;#ifdef GISUN
;#ifdef GISUN2
#ifdef ATE
;  Source: "E:\Projects\SelSovet7\Data\ATE.adt"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
;  Source: "E:\Projects\SelSovet7\Data\ATE.adi"; DestDir: "{code:GetProgDir}\NewData"; Flags: ignoreversion; Check: IsMainComp
#endif
;#endif
;#endif
;Source: "E:\Projects\SelSovet7\RichEdit\*.*"; DestDir: "{code:GetProgDir}\RichEdit"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Spr\*.*"; DestDir: "{code:GetProgDir}\Spr"; Flags: ignoreversion; Check: IsMainComp
Source: "E:\Projects\SelSovet7\SQL\*.*"; DestDir: "{code:GetProgDir}\SQL"; Flags: ignoreversion

#ifdef AppGKH
;!!!Source: "E:\Projects\SelSovet7\Filters\���������\�����������\*.flt"; DestDir: "{app}\Filters\���������\�����������"; Flags: ignoreversion;
;!!!Source: "E:\Projects\SelSovet7\Filters\�������C����\�����������\*.flt"; DestDir: "{app}\Filters\�������C����\�����������"; Flags: ignoreversion;
;!!!Source: "E:\Projects\SelSovet7\Filters\����\�����������\*.flt"; DestDir: "{app}\Filters\����\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\����������� ������������ ���.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\��������� ���.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
#endif
#ifdef AppZAGS
Source: "E:\Projects\SelSovet7\Doc\������������ ����.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\��������� ����.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
#endif
#ifdef AppOCH
Source: "E:\Projects\SelSovet7\Doc\����������� ������������ ����������.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\��������� ����������.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\����\������������� �������� ���������.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\����\�����������\*.flt"; DestDir: "{app}\Filters\����\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\������� �� �����\�����������\*.flt"; DestDir: "{app}\Filters\������� �� �����\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\������� �� �����\�����.flt"; DestDir: "{app}\Filters\������� �� �����"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\������� �� �����\�� ������ �����.flt"; DestDir: "{app}\Filters\������� �� �����"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\������� �� �����\��� � ����� �������.flt"; DestDir: "{app}\Filters\������� �� �����"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\������� �� �����\�������������� (����� �������).flt"; DestDir: "{app}\Filters\������� �� �����"; Flags: ignoreversion;
#endif
#ifdef AppZAH
Source: "E:\Projects\SelSovet7\Doc\����������� ������������ ���� �����������.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\��������� ���� �����������.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\AktZ\�����������\*.flt"; DestDir: "{app}\Filters\AktZ\�����������"; Flags: ignoreversion;
#endif
#ifdef AppOPEKA
Source: "E:\Projects\SelSovet7\Doc\����������� ������������ ����� � ��������������.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\��������� ����� � ��������������.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\AktOpek\�����������\*.flt"; DestDir: "{app}\Filters\AktOpek\�����������"; Flags: ignoreversion;
#endif
#ifdef AppPost
Source: "E:\Projects\SelSovet7\Doc\����������� ������������ ����.����.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\��������� ����.����.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\������ � ����� ��.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\SMDOPost\�����������\*.flt"; DestDir: "{app}\Filters\SMDOPost\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\��������\������������ �������������� ���������.flt"; DestDir: "{app}\Filters\��������"; Flags: ignoreversion;
#endif
#ifdef AppLAIS
Source: "E:\Projects\SelSovet7\Filters\���������\�����������\*.flt"; DestDir: "{app}\Filters\���������\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\�������C����\�����������\*.flt"; DestDir: "{app}\Filters\�������C����\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\���������\*.flt"; DestDir: "{app}\Filters\���������\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\����\�����������\*.flt"; DestDir: "{app}\Filters\����\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\������� �� �����\�����������\*.flt"; DestDir: "{app}\Filters\������� �� �����\�����������"; Excludes: "������ ����� ���� ��������� �����.flt"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\������� �� �����\�����.flt"; DestDir: "{app}\Filters\������� �� �����"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\������� �� �����\�� ������ �����.flt"; DestDir: "{app}\Filters\������� �� �����"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\SMDOPost\�����������\*.flt"; DestDir: "{app}\Filters\SMDOPost\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\AktZ\�����������\*.flt"; DestDir: "{app}\Filters\AktZ\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\��������\������������ �������������� ���������.flt"; DestDir: "{app}\Filters\��������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\AktOpek\�����������\*.flt"; DestDir: "{app}\Filters\AktOpek\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Group\���������\*.gfl"; DestDir: "{app}\Group\���������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\����������� ������������ ����.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\����������� �� ��������� ����.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\��������� ����.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\������ � ����� ��.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Doc\�� ����������� ���������������� �����.doc"; DestDir: "{app}\Doc"; Flags: ignoreversion;
#endif

#ifdef ZAGS_SMALL
Source: "E:\Projects\SelSovet7\Filters\������������\��� � ����� ������� ������.flt"; DestDir: "{app}\Filters\������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\������������\����� � ��� ������� ������.flt"; DestDir: "{app}\Filters\������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\������������\����� �����������.flt"; DestDir: "{app}\Filters\������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\������������\������ ����� �� ������.flt"; DestDir: "{app}\Filters\������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\������������\��������������.flt"; DestDir: "{app}\Filters\������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\������������\������� ��� �������� (������ ���������).flt"; DestDir: "{app}\Filters\������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\������������\������� ��� �������� (���������� �).flt"; DestDir: "{app}\Filters\������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\������������\�� �������� ��������� � ����.flt"; DestDir: "{app}\Filters\������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\������������\������� ������������ ����.flt"; DestDir: "{app}\Filters\������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\������������\������ 55 ��� ������������ ��������� (�� 18).flt"; DestDir: "{app}\Filters\������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Group\������������\*.gfl"; DestDir: "{app}\Group\������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\�����������\��� � ����� ������� ������.flt"; DestDir: "{app}\Filters\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\�����������\����� � ��� ������� ������.flt"; DestDir: "{app}\Filters\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\�����������\��������������.flt"; DestDir: "{app}\Filters\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\�����������\����� �����������.flt"; DestDir: "{app}\Filters\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\�����������\������� ��� �������� (������ ���������).flt"; DestDir: "{app}\Filters\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\�����������\������ ����� �� ������.flt"; DestDir: "{app}\Filters\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\�����������\������� ��� �������� (���������� �).flt"; DestDir: "{app}\Filters\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\�����������\���������� ���������.flt"; DestDir: "{app}\Filters\�����������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\����������������\��� � ����� ������� ������.flt"; DestDir: "{app}\Filters\����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\����������������\����� � ��� ������� ������.flt"; DestDir: "{app}\Filters\����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\����������������\�� �������� ��������� � ����.flt"; DestDir: "{app}\Filters\����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\����������������\��������������.flt"; DestDir: "{app}\Filters\����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\����������������\����� �����������.flt"; DestDir: "{app}\Filters\����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\����������������\��� � ����� ������� ������.flt"; DestDir: "{app}\Filters\����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\����������������\����� � ��� ������� ������.flt"; DestDir: "{app}\Filters\����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\����������������\������ ����� �� ������.flt"; DestDir: "{app}\Filters\����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\����������������\��������������.flt"; DestDir: "{app}\Filters\����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\����������������\����� �����������.flt"; DestDir: "{app}\Filters\����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\����������������\�� �������� ��������� � ������.flt"; DestDir: "{app}\Filters\����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\����������������\�� �������� ���������� ��������.flt"; DestDir: "{app}\Filters\����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\����������������\��������� �����.flt"; DestDir: "{app}\Filters\����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\DeclareMarriage\���� ���������� �����.flt"; DestDir: "{app}\Filters\DeclareMarriage"; Flags: ignoreversion;
#endif
#ifdef ZAGS_FULL
Source: "E:\Projects\SelSovet7\Filters\�����������������\��� � ����� ������� ������.flt"; DestDir: "{app}\Filters\�����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\�����������������\����� � ��� ������� ������.flt"; DestDir: "{app}\Filters\�����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\�����������������\�� �������� ��������� � �������.flt"; DestDir: "{app}\Filters\�����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\�����������������\��������������.flt"; DestDir: "{app}\Filters\�����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\�����������������\����� �����������.flt"; DestDir: "{app}\Filters\�����������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\��������������\�������.flt"; DestDir: "{app}\Filters\��������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\DeclareTermMarriage\����� �� ����������� �����.flt"; DestDir: "{app}\Filters\DeclareTermMarriage"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\DeclareTermMarriage\���� ����������� �����.flt"; DestDir: "{app}\Filters\DeclareTermMarriage"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Filters\DeclareChName\��������� �� ������.flt"; DestDir: "{app}\Filters\DeclareChName"; Flags: ignoreversion;
#endif
Source: "E:\Projects\SelSovet7\shtamp.doc"; DestDir: "{app}"; Flags: onlyifdoesntexist;
Source: "E:\Projects\SelSovet7\empty_shtamp.doc"; DestDir: "{app}"; Flags: onlyifdoesntexist;
Source: "E:\Projects\SelSovet7\shtamp_gerb.doc"; DestDir: "{app}"; Flags: onlyifdoesntexist;
Source: "E:\Projects\SelSovet7\except.dic"; DestDir: "{app}"; Flags: onlyifdoesntexist;
Source: "E:\Projects\SelSovet7\padeg.dll"; DestDir: "{app}"; Flags: onlyifdoesntexist;
Source: "E:\Projects\SelSovet7\libhunspell.dll"; DestDir: "{app}"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\Dict\*.*"; DestDir: "{app}\Dict"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\addkey.adt"; DestDir: "{app}"; Flags: ignoreversion;
Source: "E:\Projects\Selsovet7\Install\Default\personal.pas"; DestDir: "{app}\Service";  Flags: onlyifdoesntexist; 

#ifdef AppGKH
Source: "E:\Projects\Selsovet7\Install\Default\minsk.pas"; DestDir: "{app}\Service";  Flags: ignoreversion; 
Source: "E:\Projects\Selsovet7\Install\Default\zags.pas"; DestDir: "{app}\Service";  Flags: ignoreversion; 
Source: "E:\Projects\SelSovet7\ServiceGKH\*.*"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion ; Excludes: "*.xml,smdo.ini,zags.pas,progo.pas,progz.pas,template_b.pas,personal.pas,minsk.pas,TaskParams.ini,GISUN*.ini,MRUList.ini,*.tsk"
Source: "E:\Projects\SelSovet7\ServiceGKH\NewParams.tsk"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
Source: "E:\Projects\Selsovet7\Install\Default\template_b.pas";DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\splash_ochered.bmp"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report\reportsGKH.ini"; DestDir: "{code:GetProgDir}\Report"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Template\*.*"; DestDir: "{code:GetProgDir}\Template"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report\*.*"; DestDir: "{code:GetProgDir}\Report"; Excludes: "��������� � �����������*.*,������������� �*.*,������ ��������� *.*,����_*.*,������ ���� *.*,��������� *.*,reports.ini,reportsGKH.ini,reportsOchered.ini,reportsZAGS.ini"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report3\*.*"; DestDir: "{code:GetProgDir}\Report3"; Excludes: "��������� � �����������*.*,������������� �*.*,������ ��������� *.*,����_*.*,������ ���� *.*,��������� *.*"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report3\��������� � ����������� �� �����*.*"; DestDir: "{code:GetProgDir}\Report3"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report\��������� � ����������� �� �����*.*"; DestDir: "{code:GetProgDir}\Report"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\TemplateExcel\*.*"; DestDir: "{code:GetProgDir}\TemplateExcel"; Flags: ignoreversion
#endif
#ifdef AppZAGS
Source: "E:\Projects\Selsovet7\Install\Default\minsk.pas";DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion;
Source: "E:\Projects\Selsovet7\Install\Default\pu.pas";DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion;
Source: "E:\Projects\Selsovet7\Install\Default\ochered.pas";DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\ServiceZAGS\*.*"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion ; Excludes: "doc_layout.ini,ConfForms.ini,*.xml,smdo*.ini,progo.pas,progp.pas,progz.pas,personal.pas,ochered.pas,minsk.pas,TaskParams.ini,GISUN*.ini,*OPEKA.*,*ZAH.*,*OCH.*,*GKH.*,*LAIS.*,MRUList.ini,*.tsk,"
Source: "E:\Projects\SelSovet7\ServiceZAGS\NewParams.tsk"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\splash_zags.bmp"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report\reportsZAGS.ini"; DestDir: "{code:GetProgDir}\Report"; Flags: ignoreversion;
Source: "E:\Projects\Selsovet7\Template\*.*"; DestDir: "{code:GetProgDir}\Template"; Excludes: "������� � ���������*.doc,������� �� �������� ���*.doc,������� � ����������*.doc,������� � ����������� � ������*.doc,������� � ��������� ����� �*.doc,������� � ����������� �*.doc,������� � ����������� �*.doc,���*.doc,������� ������� ��*.doc,�������� ���*.doc,������� ����������� ����*.doc,������� � ����� �*.doc,������� � ������� ���*.doc,������� � ����� �*.doc,��� ������������ ���*.doc"; Flags: ignoreversion;
Source: "E:\Projects\Selsovet7\Template\�����_�����������.doc"; DestDir: "{code:GetProgDir}\Template_";  Flags: onlyifdoesntexist; 
Source: "E:\Projects\SelSovet7\talon_dop.doc"; DestDir: "{app}"; Flags: onlyifdoesntexist;
; !!! ���� ������������ �� ������ �������� Source: "E:\Projects\SelSovet7\TemplateExcel\*.*"; DestDir: "{code:GetProgDir}\TemplateExcel"; Excludes:"*������*"; Flags: ignoreversion;

;Flags: onlyifdoesntexist;
Source: "E:\Projects\SelSovet7\Report\*.*"; DestDir: "{code:GetProgDir}\Report"; Excludes: "reports.ini,reportsGKH.ini,reportsOchered.ini,reportsZAGS.ini"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report3\*.*"; DestDir: "{code:GetProgDir}\Report3"; Flags: ignoreversion
#endif
#ifdef AppOCH
Source: "E:\Projects\Selsovet7\Install\Default\minsk.pas";DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion;
Source: "E:\Projects\Selsovet7\Install\Default\zags.pas"; DestDir: "{app}\Service";  Flags: ignoreversion; 
Source: "E:\Projects\Selsovet7\Install\Default\pu.pas"; DestDir: "{app}\Service";  Flags: ignoreversion; 
Source: "E:\Projects\Selsovet7\Install\Default\template_b.pas";DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\ServiceOchered\*.*"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion ; Excludes: "doc_layout.ini,ConfForms.ini,*.xml,*smdo*.*,pu.pas,zags.pas,progp.pas,progo.pas,progz.pas,template_b.pas,personal.pas,minsk.pas,TaskParams.ini,GISUN*.ini,MRUList.ini,*.tsk"
Source: "E:\Projects\SelSovet7\ServiceOchered\NewParams.tsk"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\splash_ochered.bmp"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report\reportsOchered.ini"; DestDir: "{code:GetProgDir}\Report"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Template\��� ���������.doc"; DestDir: "{code:GetProgDir}\Template_"; Flags: onlyifdoesntexist
Source: "E:\Projects\SelSovet7\Template\��� ��������.doc"; DestDir: "{code:GetProgDir}\Template_"; Flags: onlyifdoesntexist
Source: "E:\Projects\SelSovet7\Template\*.*"; DestDir: "{code:GetProgDir}\Template"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report\*.*"; DestDir: "{code:GetProgDir}\Report"; Excludes: "������*.*,������ ����*.*,������������� �*.*,����*.*,��������� *.*,������ ����*.*,���������� � ����*.*,reports.ini,reportsGKH.ini,reportsOchered.ini,reportsZAGS.ini"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report3\*.*"; DestDir: "{code:GetProgDir}\Report3"; Excludes: "������*.*,������ ����*.*,������������� �*.*,����*.*,��������� *.*,���������� � ����*.*"; Flags: ignoreversion
Source: "E:\Projects\Selsovet7\Filters\�����������������������\�� ���� ��������� � �������.flt"; DestDir: "{app}\Filters\�����������������������"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\TemplateExcel\*.*"; DestDir: "{code:GetProgDir}\TemplateExcel"; Flags: ignoreversion
#endif
#ifdef AppZAH
Source: "E:\Projects\SelSovet7\ServiceZAH\*.*"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion ; Excludes: "doc_layout.ini,ConfForms.ini,*.xml,smdo*.ini,pu.pas,zags.pas,progp.pas,progo.pas,prog.pas,template_b.pas,personal.pas,minsk.pas,TaskParams.ini,GISUN*.ini,MRUList.ini,*.tsk"
Source: "E:\Projects\SelSovet7\ServiceZAH\NewParams.tsk"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
;Source: "E:\Projects\Selsovet7\Install\Default\template_b.pas";DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\splash_zah.bmp"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report\reportsZAH.ini"; DestDir: "{code:GetProgDir}\Report"; Flags: ignoreversion
;Source: "E:\Projects\SelSovet7\Template\*.*"; DestDir: "{code:GetProgDir}\Template"; Flags: ignoreversion
;Source: "E:\Projects\SelSovet7\Report\*.*"; DestDir: "{code:GetProgDir}\Report"; Excludes: "������*.*,������ ����*.*,������������� �*.*,����*.*,��������� *.*,������ ����*.*,���������� � ����*.*,reports.ini,reportsGKH.ini,reportsOchered.ini,reportsZAGS.ini"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report3\�����������_*.*"; DestDir: "{code:GetProgDir}\Report3"; Flags: ignoreversion
;Source: "E:\Projects\SelSovet7\TemplateExcel\*.*"; DestDir: "{code:GetProgDir}\TemplateExcel"; Flags: ignoreversion
#endif
#ifdef AppOpeka
;Source: "E:\Projects\Selsovet7\Install\Default\minsk.pas";DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\ServiceOpeka\*.*"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion ; Excludes: "doc_layout.ini,ConfForms.ini,*.xml,smdo.ini,pu.pas,zags.pas,progz.pas,progp.pas,prog.pas,template_b.pas,personal.pas,minsk.pas,TaskParams.ini,GISUN*.ini,MRUList.ini,*.tsk"
Source: "E:\Projects\SelSovet7\ServiceOpeka\NewParams.tsk"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
;Source: "E:\Projects\Selsovet7\Install\Default\template_b.pas";DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\splash_opeka.bmp"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report\reportsOPEKA.ini"; DestDir: "{code:GetProgDir}\Report"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Template\������ ����������� �����.doc"; DestDir: "{code:GetProgDir}\Template"; Flags: ignoreversion
;Source: "E:\Projects\SelSovet7\Report\*.*"; DestDir: "{code:GetProgDir}\Report"; Excludes: "������*.*,������ ����*.*,������������� �*.*,����*.*,��������� *.*,������ ����*.*,���������� � ����*.*,reports.ini,reportsGKH.ini,reportsOchered.ini,reportsZAGS.ini"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report3\�����_*.*"; DestDir: "{code:GetProgDir}\Report3"; Flags: ignoreversion
;Source: "E:\Projects\SelSovet7\TemplateExcel\*.*"; DestDir: "{code:GetProgDir}\TemplateExcel"; Flags: ignoreversion
#endif
#ifdef AppPost
Source: "E:\Projects\SelSovet7\ServicePost\*.*"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion ; Excludes: "doc_layout.ini,ConfForms.ini,smdo.ini,pu.pas,zags.pas,progz.pas,progo.pas,prog.pas,template_b.pas,personal.pas,minsk.pas,TaskParams.ini,GISUN*.ini,MRUList.ini,*.tsk"
Source: "E:\Projects\SelSovet7\Install\Default\smdo.ini"; DestDir: "{code:GetProgDir}\Service"; Flags: onlyifdoesntexist; Check: IsMainComp
Source: "E:\Projects\SelSovet7\ServicePost\NewParams.tsk"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\splash_post.bmp"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\Selsovet7\Report\�� *.*"; DestDir: "{code:GetProgDir}\Report"; Excludes: "reports*.ini"; Flags: ignoreversion; 
;Source: "E:\Projects\Selsovet7\Report\���*.*"; DestDir: "{app}\Report3"; Excludes: "reports*.ini"; Flags: ignoreversion; 
;Source: "E:\Projects\Selsovet7\Report\����*.*"; DestDir: "{app}\Report"; Excludes: "reports*.ini"; Flags: ignoreversion; 
Source: "E:\Projects\Selsovet7\Report3\����*.*"; DestDir: "{code:GetProgDir}\Report3"; Excludes: "reports*.ini"; Flags: ignoreversion; 
Source: "E:\Projects\Selsovet7\Report3\���*.*"; DestDir: "{code:GetProgDir}\Report3"; Excludes: "reports*.ini"; Flags: ignoreversion; 
Source: "E:\Projects\Selsovet7\Report3\���*.*"; DestDir: "{code:GetProgDir}\Report3"; Excludes: "reports*.ini"; Flags: ignoreversion; 
Source: "E:\Projects\Selsovet7\Report\reportsPost.ini"; DestDir: "{code:GetProgDir}\Report"; Flags: ignoreversion; 
Source: "E:\Projects\Selsovet7\Template\��� *.*"; DestDir: "{code:GetProgDir}\Template"; Excludes: "��� �������*.doc,���*.doc"; Flags: ignoreversion; 
Source: "E:\Projects\SelSovet7\Template\��� ���������.doc"; DestDir: "{code:GetProgDir}\Template_"; Flags: onlyifdoesntexist
Source: "E:\Projects\SelSovet7\Template\��� ��������.doc"; DestDir: "{code:GetProgDir}\Template_"; Flags: onlyifdoesntexist
;Source: "E:\Projects\SelSovet7\Report\reportsOPEKA.ini"; DestDir: "{code:GetProgDir}\Report"; Flags: ignoreversion
;Source: "E:\Projects\SelSovet7\Template\*.*"; DestDir: "{code:GetProgDir}\Template"; Flags: ignoreversion
;Source: "E:\Projects\SelSovet7\Report\*.*"; DestDir: "{code:GetProgDir}\Report"; Excludes: "������*.*,������ ����*.*,������������� �*.*,����*.*,��������� *.*,������ ����*.*,���������� � ����*.*,reports.ini,reportsGKH.ini,reportsOchered.ini,reportsZAGS.ini"; Flags: ignoreversion
;Source: "E:\Projects\SelSovet7\Report3\�����_*.*"; DestDir: "{code:GetProgDir}\Report3"; Flags: ignoreversion
;Source: "E:\Projects\SelSovet7\TemplateExcel\*.*"; DestDir: "{code:GetProgDir}\TemplateExcel"; Flags: ignoreversion
#endif
#ifdef AppLAIS
Source: "E:\Projects\Selsovet7\Install\Default\zags.pas";DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion;
Source: "E:\Projects\SelSovet7\ServiceSelSovet\*.*"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion; Excludes: "doc_layout.ini,ConfForms.ini,smdo.ini,zags.pas,progo.pas,progz.pas,personal.pas,TaskParams.ini,GISUN*.ini,MRUList.ini,*.tsk"
Source: "E:\Projects\SelSovet7\Install\Default\smdo.ini"; DestDir: "{code:GetProgDir}\Service"; Flags: onlyifdoesntexist; Check: IsMainComp
Source: "E:\Projects\SelSovet7\ServiceSelSovet\NewParams.tsk"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\splash_lais.bmp"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report\reports.ini"; DestDir: "{code:GetProgDir}\Report"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Template\*.*"; DestDir: "{code:GetProgDir}\Template"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Template\��� ���������.doc"; DestDir: "{code:GetProgDir}\Template_"; Flags: onlyifdoesntexist
Source: "E:\Projects\SelSovet7\Template\��� ��������.doc"; DestDir: "{code:GetProgDir}\Template_"; Flags: onlyifdoesntexist
Source: "E:\Projects\SelSovet7\Report\*.*"; DestDir: "{code:GetProgDir}\Report"; Excludes: "reports.ini,reportsGKH.ini,reportsOchered.ini,reportsZAGS.ini"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Report3\*.*"; DestDir: "{code:GetProgDir}\Report3"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\TemplateExcel\*.*"; DestDir: "{code:GetProgDir}\TemplateExcel"; Flags: ignoreversion
#endif
Source: "E:\Projects\SelSovet7\Update\update.ini"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Update\update.pas"; DestDir: "{code:GetProgDir}\Update"; Flags: ignoreversion
Source: "E:\Projects\SelSovet7\Service\ConfForms.ini"; DestDir: "{code:GetProgDir}\Service"; Flags: onlyifdoesntexist;
Source: "E:\Projects\SelSovet7\Service\doc_layout.ini"; DestDir: "{code:GetProgDir}\Service"; Flags: onlyifdoesntexist;
Source: "E:\Projects\SelSovet7\Work\Local.ini"; DestDir: "{code:GetProgDir}\Work"; Flags: onlyifdoesntexist;
#ifdef GISUN
  Source: "E:\Projects\SelSovet7\Gisun_Cur\gisun.ini"; DestDir: "{code:GetProgDir}\Service"; Flags: onlyifdoesntexist; Check: IsMainComp
  Source: "E:\Projects\SelSovet7\Gisun_Cur\gisun_input.ini"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion; 
  Source: "E:\Projects\SelSovet7\Gisun_Cur\gisun_output.ini"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion; 
  Source: "E:\Projects\SelSovet7\Service\ETSPError.txt"; DestDir: "{code:GetProgDir}\Service"; Flags: ignoreversion
#endif

#ifdef ADS
  #ifdef ADS10
    Source: "E:\Delphi7\CompSet\ADS10\TDataSet\Redistribute\*.*"; DestDir: "{code:GetProgDir}"; Flags: ignoreversion; 
    ;Excludes: adscollate.*,aicu32.dll,icudt40l.dat
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

; ���� [__Icons__]
;Name: "{group}\�������� ��������� ������ "; Filename: "{app}\DeleteIndex.exe"; WorkingDir: "{app}"; IconFilename: "{app}\UpdateInd.ico"; Check: IsMainComp
;Name: "{group}\������������ ���� ������� "; Filename: "{app}\UpdateProg.exe"; Parameters:"/TYPESERVER"; WorkingDir: "{app}"; IconFilename: "{app}\Update.ico"; Check: IsMainComp
;#ifdef GISUN
;Name: "{group}\��������� ����� "; Filename: "{app}\UpdateProg.exe"; Parameters:"/GISUN"; WorkingDir: "{app}"; IconFilename: "{app}\Gisun.ico"; Check: IsMainComp
;#endif
;Name: "{group}\��������� ���������� "; Filename: "{app}\LastUpdate\LastUpdate.exe"; WorkingDir: "{app}"; IconFilename: "{app}\LastUpdate.ico"

[Icons]
;-----------------------------------------
#ifdef AppGKH
Name: "{group}\������������ ���� �������"; Filename: "{app}\UpdateProg.exe"; Parameters:"/TYPESERVER"; WorkingDir: "{app}"; IconFilename: "{app}\Update.ico"; Check: IsMainComp
Name: "{group}\��������� ����������"; Filename: "{app}\LastUpdate\LastUpdate.exe"; WorkingDir: "{app}"; IconFilename: "{app}\LastUpdate.ico"
#endif
;-----------------------------------------
#ifdef AppOchered
Name: "{group}\����������"; Filename: "{app}\Ochered.exe"; WorkingDir: "{app}"
Name: "{group}\������������"; Filename: "{app}\Doc\����������� ������������ ����������.doc"; WorkingDir: "{app}"
Name: "{group}\������������ ���� �������"; Filename: "{app}\UpdateProg.exe"; Parameters:"/TYPESERVER"; WorkingDir: "{app}"; IconFilename: "{app}\Update.ico"; Check: IsMainComp
Name: "{group}\�������� ��������� ������"; Filename: "{app}\DeleteIndex.exe"; WorkingDir: "{app}"; IconFilename: "{app}\UpdateInd.ico"; Check: IsMainComp
Name: "{group}\��������� ����������"; Filename: "{app}\LastUpdate\LastUpdate.exe"; WorkingDir: "{app}"; IconFilename: "{app}\LastUpdate.ico"
Name: "{userdesktop}\����������"; Filename: "{app}\Ochered.exe"; Tasks: desktopicon; WorkingDir: "{app}"
Name: "{userdesktop}\������������ ����������"; Filename: "{app}\Doc\����������� ������������ ����������.doc"; Tasks: desktopicon; WorkingDir: "{app}"
#endif
;-----------------------------------------
#ifdef AppZAGS
Name: "{group}\����"; Filename: "{app}\ZAGS.exe"; WorkingDir: "{app}"
Name: "{group}\������������"; Filename: "{app}\Doc\������������ ����.doc"; WorkingDir: "{app}"
Name: "{group}\�������� ��������� ������"; Filename: "{app}\DeleteIndex.exe"; WorkingDir: "{app}"; IconFilename: "{app}\UpdateInd.ico"; Check: IsMainComp
Name: "{group}\������������ ���� �������"; Filename: "{app}\UpdateProg.exe"; Parameters:"/TYPESERVER"; WorkingDir: "{app}"; IconFilename: "{app}\Update.ico"; Check: IsMainComp
Name: "{group}\������"; Filename: "{app}\UpdateProg.exe"; Parameters:"/SERVICE /ZAGS"; WorkingDir: "{app}"; IconFilename: "{app}\Tools.ico"; Check: IsMainComp
#ifdef GISUN
  Name: "{group}\��������� ��� ��"; Filename: "{app}\UpdateProg.exe"; Parameters:"/GISUN /ZAGS"; WorkingDir: "{app}"; IconFilename: "{app}\Gisun.ico"; Check: IsMainComp
#endif
Name: "{userdesktop}\����"; Filename: "{app}\ZAGS.exe"; WorkingDir: "{app}"
Name: "{userdesktop}\������������ ����"; Filename: "{app}\Doc\������������ ����.doc"; WorkingDir: "{app}"
#endif
;-----------------------------------------
#ifdef AppZAH
Name: "{group}\���� �����������"; Filename: "{app}\ZAH.exe"; WorkingDir: "{app}"
#ifdef GISUN
  Name: "{group}\��������� ��� ��"; Filename: "{app}\UpdateProg.exe"; Parameters:"/GISUN /ZAH"; WorkingDir: "{app}"; IconFilename: "{app}\Gisun.ico"; Check: IsMainComp
#endif
Name: "{group}\������������"; Filename: "{app}\Doc\����������� ������������ ���� �����������.doc"; WorkingDir: "{app}"
Name: "{group}\������������ ���� �������"; Filename: "{app}\UpdateProg.exe"; Parameters:"/TYPESERVER"; WorkingDir: "{app}"; IconFilename: "{app}\Update.ico"; Check: IsMainComp
Name: "{group}\�������� ��������� ������"; Filename: "{app}\DeleteIndex.exe"; WorkingDir: "{app}"; IconFilename: "{app}\UpdateInd.ico"; Check: IsMainComp
Name: "{group}\������"; Filename: "{app}\UpdateProg.exe"; Parameters:"/SERVICE /ZAH"; WorkingDir: "{app}"; IconFilename: "{app}\Tools.ico"; Check: IsMainComp
Name: "{userdesktop}\���� �����������"; Filename: "{app}\ZAH.exe"; WorkingDir: "{app}"
Name: "{userdesktop}\������������ ���� �����������"; Filename: "{app}\Doc\����������� ������������ ���� �����������.doc"; WorkingDir: "{app}"
#endif
;-----------------------------------------
#ifdef AppLAIS
Name: "{group}\����"; Filename: "{app}\Lais.exe"; WorkingDir: "{app}"
Name: "{group}\������������"; Filename: "{app}\Doc\����������� ������������ ����.doc"; WorkingDir: "{app}"
Name: "{group}\������������ ���� �������"; Filename: "{app}\UpdateProg.exe"; Parameters:"/TYPESERVER"; WorkingDir: "{app}"; IconFilename: "{app}\Update.ico"; Check: IsMainComp
Name: "{group}\�������� ��������� ������"; Filename: "{app}\DeleteIndex.exe"; WorkingDir: "{app}"; IconFilename: "{app}\UpdateInd.ico"; Check: IsMainComp
Name: "{group}\��������� ����������"; Filename: "{app}\LastUpdate\LastUpdate.exe"; WorkingDir: "{app}"; IconFilename: "{app}\LastUpdate.ico"
Name: "{group}\������"; Filename: "{app}\UpdateProg.exe"; Parameters:"/SERVICE /LAIS"; WorkingDir: "{app}"; IconFilename: "{app}\Tools.ico"; Check: IsMainComp
  #ifdef GISUN
    Name: "{group}\��������� ��� ��"; Filename: "{app}\UpdateProg.exe"; Parameters:"/GISUN /LAIS"; WorkingDir: "{app}"; IconFilename: "{app}\Gisun.ico"; Check: IsMainComp
  #endif
Name: "{userdesktop}\����"; Filename: "{app}\LAIS.exe"; WorkingDir: "{app}"
Name: "{userdesktop}\������������ ����"; Filename: "{app}\Doc\����������� ������������ ����.doc"; WorkingDir: "{app}"
#endif
;-----------------------------------------
#ifdef AppOPEKA
Name: "{group}\����� � ��������������"; Filename: "{app}\Opeka.exe"; WorkingDir: "{app}"
Name: "{group}\������������"; Filename: "{app}\Doc\����������� ������������ ����� � ��������������.doc"; WorkingDir: "{app}"
Name: "{group}\������������ ���� �������"; Filename: "{app}\UpdateProg.exe"; Parameters:"/TYPESERVER"; WorkingDir: "{app}"; IconFilename: "{app}\Update.ico"; Check: IsMainComp
Name: "{group}\�������� ��������� ������"; Filename: "{app}\DeleteIndex.exe"; WorkingDir: "{app}"; IconFilename: "{app}\UpdateInd.ico"; Check: IsMainComp
Name: "{group}\��������� ����������"; Filename: "{app}\LastUpdate\LastUpdate.exe"; WorkingDir: "{app}"; IconFilename: "{app}\LastUpdate.ico"
Name: "{group}\������"; Filename: "{app}\UpdateProg.exe"; Parameters:"/SERVICE /OPEKA"; WorkingDir: "{app}"; IconFilename: "{app}\Tools.ico"; Check: IsMainComp
  #ifdef GISUN
    Name: "{group}\��������� ��� ��"; Filename: "{app}\UpdateProg.exe"; Parameters:"/GISUN /OPEKA"; WorkingDir: "{app}"; IconFilename: "{app}\Gisun.ico"; Check: IsMainComp
  #endif
Name: "{userdesktop}\����� � ��������������"; Filename: "{app}\Opeka.exe"; WorkingDir: "{app}"
Name: "{userdesktop}\������������ ����� � ��������������"; Filename: "{app}\Doc\����������� ������������ ����� � ��������������.doc"; WorkingDir: "{app}"
#endif
;-----------------------------------------
#ifdef AppPost
Name: "{group}\����.����"; Filename: "{app}\LaisSmdo.exe"; WorkingDir: "{app}"
Name: "{group}\������������"; Filename: "{app}\Doc\����������� ������������ ����.����.doc"; WorkingDir: "{app}"
Name: "{group}\������������ ���� �������"; Filename: "{app}\UpdateProg.exe"; Parameters:"/TYPESERVER"; WorkingDir: "{app}"; IconFilename: "{app}\Update.ico"; Check: IsMainComp
Name: "{group}\�������� ��������� ������"; Filename: "{app}\DeleteIndex.exe"; WorkingDir: "{app}"; IconFilename: "{app}\UpdateInd.ico"; Check: IsMainComp
Name: "{group}\��������� ����������"; Filename: "{app}\LastUpdate\LastUpdate.exe"; WorkingDir: "{app}"; IconFilename: "{app}\LastUpdate.ico"
Name: "{group}\������"; Filename: "{app}\UpdateProg.exe"; Parameters:"/SERVICE /POST"; WorkingDir: "{app}"; IconFilename: "{app}\Tools.ico"; Check: IsMainComp
Name: "{userdesktop}\����.����"; Filename: "{app}\LaisSmdo.exe"; WorkingDir: "{app}"
Name: "{userdesktop}\������������ ����.����"; Filename: "{app}\Doc\����������� ������������ ����.����.doc"; WorkingDir: "{app}"
#endif

[Registry]
root:HKCU;subkey:"Software\VCBOUS"; Flags: uninsdeletekeyifempty
#ifdef AppGKH
root:HKCU;subkey:"Software\VCBOUS\GKH"; Flags: uninsdeletekey
root:HKCU;subkey:"Software\VCBOUS\GKH";valuetype:string;valuename:"installpath";valuedata:"{app}"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\GKH";valuetype:string;valuename:"version";valuedata:"9.0.0"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\GKH";valuetype:string;valuename:"update";valuedata:"147"; Flags: uninsdeletevalue
#endif
#ifdef AppZAGS
root:HKCU;subkey:"Software\VCBOUS\ZAGS"; Flags: uninsdeletekey
root:HKCU;subkey:"Software\VCBOUS\ZAGS";valuetype:string;valuename:"installpath";valuedata:"{app}"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\ZAGS";valuetype:string;valuename:"version";valuedata:"9.2.0"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\ZAGS";valuetype:string;valuename:"update";valuedata:"184"; Flags: uninsdeletevalue
#endif
#ifdef AppOCH
root:HKCU;subkey:"Software\VCBOUS\Ochered"; Flags: uninsdeletekey
root:HKCU;subkey:"Software\VCBOUS\Ochered";valuetype:string;valuename:"installpath";valuedata:"{app}"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\Ochered";valuetype:string;valuename:"version";valuedata:"8.3.0"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\Ochered";valuetype:string;valuename:"update";valuedata:"166"; Flags: uninsdeletevalue
#endif
#ifdef AppZAH
root:HKCU;subkey:"Software\VCBOUS\ZAH"; Flags: uninsdeletekey
root:HKCU;subkey:"Software\VCBOUS\ZAH";valuetype:string;valuename:"installpath";valuedata:"{app}"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\ZAH";valuetype:string;valuename:"version";valuedata:"5.0.0"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\ZAH";valuetype:string;valuename:"update";valuedata:"26"; Flags: uninsdeletevalue
#endif
#ifdef AppOPEKA
root:HKCU;subkey:"Software\VCBOUS\OPEKA"; Flags: uninsdeletekey
root:HKCU;subkey:"Software\VCBOUS\OPEKA";valuetype:string;valuename:"installpath";valuedata:"{app}"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\OPEKA";valuetype:string;valuename:"version";valuedata:"5.0.0"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\OPEKA";valuetype:string;valuename:"update";valuedata:"25"; Flags: uninsdeletevalue
#endif
#ifdef AppPost
root:HKCU;subkey:"Software\VCBOUS\POST"; Flags: uninsdeletekey
root:HKCU;subkey:"Software\VCBOUS\POST";valuetype:string;valuename:"installpath";valuedata:"{app}"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\POST";valuetype:string;valuename:"version";valuedata:"1.3.5"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\POST";valuetype:string;valuename:"update";valuedata:"25"; Flags: uninsdeletevalue
#endif
#ifdef AppLAIS
root:HKCU;subkey:"Software\VCBOUS\LAIS"; Flags: uninsdeletekey
root:HKCU;subkey:"Software\VCBOUS\LAIS";valuetype:string;valuename:"installpath";valuedata:"{app}"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\LAIS";valuetype:string;valuename:"version";valuedata:"12.3.0"; Flags: uninsdeletevalue
root:HKCU;subkey:"Software\VCBOUS\LAIS";valuetype:string;valuename:"update";valuedata:"191"; Flags: uninsdeletevalue
#endif

[Code]
const

#ifdef AppPost
  NAME_DICT = 'Base.add';
#else
  #ifdef AppZAH
    NAME_DICT = 'Base.add';
  #else
    #ifdef AppOPEKA
      NAME_DICT = 'Base.add';
    #else
      NAME_DICT = 'Selsovet.add';
    #endif
  #endif
#endif
  REG_NAME_SS = 'SELSOVET';
  NameExeProg_SS = 'SelSovet.exe';
  NameExeProg_LAIS = 'LAIS.exe';
#ifdef AppGKH
  IS_POST=false;
  IDUpdate = '147';
  IDProg   = '9.0.0';
  NameExeProg = 'GKH.exe';
  REG_NAME = 'GKH';
  PROG_NAME = '���';
  OBRAB_NAME = 'ObrabotkaGKH.ini';
#endif
#ifdef AppZAGS
  IS_POST=false;
  IDUpdate = '184';
  IDProg   = '9.2.0';
  NameExeProg = 'ZAGS.exe';
  REG_NAME = 'ZAGS';
  PROG_NAME = '����';
  OBRAB_NAME = 'ObrabotkaZAGS.ini';
#endif
#ifdef AppOCH
  IS_POST=false;
  IDUpdate = '166';
  IDProg   = '8.3.0';
  NameExeProg = 'Ochered.exe';
  REG_NAME = 'OCHERED';
  PROG_NAME = '����������';
  OBRAB_NAME = 'ObrabotkaOchered.ini';
#endif
#ifdef AppZAH
  IS_POST=false;
  IDUpdate = '26';
  IDProg   = '5.0.0';
  NameExeProg = 'ZAH.exe';
  REG_NAME = 'ZAH';
  PROG_NAME = '���� �����������';
  OBRAB_NAME = 'ObrabotkaZAH.ini';
#endif
#ifdef AppOPEKA
  IS_POST=false;
  IDUpdate = '25';
  IDProg   = '5.0.0';
  NameExeProg = 'Opeka.exe';
  REG_NAME = 'OPEKA';
  PROG_NAME = '����� � ��������������';
  OBRAB_NAME = 'ObrabotkaOpeka.ini';
#endif
#ifdef AppPost
  IS_POST=true;
  IDUpdate = '25';
  IDProg   = '1.3.5';
  NameExeProg = 'LaisSmdo.exe';
  REG_NAME = 'POST';
  PROG_NAME = '����.����';
  OBRAB_NAME = 'ObrabotkaPost.ini';
#endif
#ifdef AppLAIS
  IS_POST=true;
  IDUpdate = '191';
  IDProg   = '12.3.0';
  NameExeProg = 'LAIS.exe';
  REG_NAME = 'LAIS';
  PROG_NAME = '����';
  OBRAB_NAME = 'Obrabotka.ini';
#endif

var
  ListOrg:String;
  strOrg:String;
  strMD5:String;
  DataDir: String;
  strVer : String;
  strUser : String;
  ckBackup : TCheckBox;
  //ckSaveUpdate : TCheckBox;
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
  strOldVersion: String;
  lOkBackUp : Boolean;
  PathBackUp : String;
  PathUpdate : String;
  lMainComp  : Boolean;
  strFileUpdate : String;
  lSelSovetToLAIS:Boolean;
  lExtractCheck:Boolean;
  arr_ads : array[1..10] of String; //=('adscollate.adm','adscollate.adt','ace32.dll','adsloc32.dll','adslocal.cfg','aicu32.dll','ansi.chr','axcws32.dll','extend.chr','icudt40l.dat');
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
      PutError(' ������ �������� ����:'+strDirDesc);
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
      ProgressPage.SetText('���������� ������ ...', '��������� �����������.');
      ProgressPage.SetProgress(m, n);
      m:=m+1;
      Result := CopyDir(PathBackUp+'Spr\',strPath+'Spr\', '');
    end;
  end;
  if lUpdateData then begin
    if Result then begin
      ProgressPage.SetText('���������� ������ ...', '���� ������.');
      ProgressPage.SetProgress(m, n);
      m:=m+1;
      Result := CopyDir( PathBackUp+'Data\', strPath+'Data\', '');
    end;
  end;
  if lUpdateSysFiles then begin
    if Result then begin
      ProgressPage.SetText('���������� ������ ...', '��������� �����.');
      ProgressPage.SetProgress(m, n);
      m:=m+1;
      Result := CopyDir(PathBackUp+'SysFiles\', strPath, NameExeProg+';UpdateProg.exe;');
    end;
  end;
  if Result then begin
    ProgressPage.SetText('���������� ������ ...', '����������� ������.');
    ProgressPage.SetProgress(m, n);
    m:=m+1;
    #ifdef SELSOVET_TO_LAIS
    if lSelsovetToLAIS then begin
      if not FileCopy(PathBackUp+NameExeProg_SS, strPath+NameExeProg_SS, false) then begin
        PutError('������ ����������� ����� : '+PathBackUp+NameExeProg_SS);
        Result := false;
      end;
      DeleteFile(strPath+NameExeProg_LAIS);
    end else begin
      if not FileCopy(PathBackUp+NameExeProg, strPath+NameExeProg, false) then begin
        PutError('������ ����������� ����� : '+PathBackUp+NameExeProg);
        Result := false;
      end;
    end;
    #else
    if not FileCopy(PathBackUp+NameExeProg, strPath+NameExeProg, false) then begin
      PutError('������ ����������� ����� : '+PathBackUp+NameExeProg);
      Result := false;
    end;
    #endif
    if Result and lMainComp then begin
      if not FileCopy(PathBackUp+'UpdateProg.exe', strPath+'UpdateProg.exe', false) then begin
        PutError('������ ����������� ����� : '+PathBackUp+'UpdateProg.exe');
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
      ProgressPage.SetText('���������� ������ ...', strNameDir+'.');
      ProgressPage.SetProgress(m, n);
      m:=m+1;
      Result := CopyDir( PathBackUp+strDir+'\', strPath+strDir+'\', '');
      if not Result then begin
        break;
      end;
    end;
  end;
  if not Result then begin
    PutError(' �� ������� ��������� ������ ����������. ');
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
        ProgressPage.SetText('����������...', '��������� �����������.');
        ProgressPage.SetProgress(m, n);
        m:=m+1;
        Result := CopyDir(strPath+'Spr\',PathBackUp+'Spr\','');
      end;
    end;
    if lUpdateData then begin
      if Result then begin
        ProgressPage.SetText('����������...', '���� ������.');
        ProgressPage.SetProgress(m, n);
        m:=m+1;
        Result := CopyDir( strPath+'Data\', PathBackUp+'Data\','');
      end;
    end;
    if lUpdateSysFiles then begin
      if Result then begin
        ProgressPage.SetText('����������...', '��������� �����.');
        ProgressPage.SetProgress(m, n);
        m:=m+1;
        Result := CopyDir(strPath, PathBackUp+'SysFiles\', NameExeProg+';UpdateProg.exe;');
      end;
    end;
    if Result then begin
      ProgressPage.SetText('����������...', '����������� ������.');
      ProgressPage.SetProgress(m, n);
      m:=m+1;
      #ifdef SELSOVET_TO_LAIS
      if lSelsovetToLAIS then begin
        if not FileCopy(strPath+NameExeProg_SS,PathBackUp+NameExeProg_SS, false) then begin
          PutError('������ ����������� ����� : '+strPath+NameExeProg_SS);
          Result := false;
        end;
      end else begin
        if not FileCopy(strPath+NameExeProg,PathBackUp+NameExeProg, false) then begin
          PutError('������ ����������� ����� : '+strPath+NameExeProg);
          Result := false;
        end;
      end;
      #else
      if not FileCopy(strPath+NameExeProg,PathBackUp+NameExeProg, false) then begin
        PutError('������ ����������� ����� : '+strPath+NameExeProg);
        Result := false;
      end;
      #endif
      if Result and lMainComp then begin
        if not FileCopy(strPath+'UpdateProg.exe',PathBackUp+'UpdateProg.exe', false) then begin
          PutError('������ ����������� ����� : '+strPath+'UpdateProg.exe');
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
        ProgressPage.SetText('����������...', strNameDir+'.');
        ProgressPage.SetProgress(m, n);
        m:=m+1;
        Result := CopyDir(strPath+strDir+'\',PathBackUp+strDir+'\','');
        if not Result then begin
          break;
        end;
      end;
    end;
//    Result := false;
//    PutError(' �� ������� ��������� ��������� �����������.');
  end;
end;
function InitializeSetup(): Boolean;
var
  i,n : Integer;
  s,ss,strDir : String;
  lOk,lCheckBase:Boolean;
  sl:TStringList;
begin
  #ifdef AppPost
ListOrg:=',Org6548,Org6833,Org9661,Org6298,Org6971,Org11616,Org7316,Org9600,Org12337,Org12338,Org12339,Org12340,Org12322,Org12324,'+
'Org12316,Org12317,Org9408,Org9409,Org9410,Org9411,Org9412,Org9413,Org9421,Org9420,Org9414,Org9415,Org9416,Org9417,Org9419,'+
'Org7581,Org9282,Org11481,Org7801,Org10941,Org7231,Org7802,Org11035,Org11034,Org11030,Org11033,Org8173,Org12959,Org11814,Org9814,'+
'Org6199,Org10452,Org10188,Org10190,Org10191,Org10194,Org10195,Org9114,Org10196,Org10197,Org10186,'+
'Org10189,Org10201,Org10202,Org10192,Org10193,Org10200,Org10936,Org7833,Org10553,Org10664,Org9150,Org7409,Org2255,Org10937,'+
'Org10291,Org10361,Org10676,Org10675,Org10378,Org13803,Org11928,Org12590,Org2559,Org12833,Org13258,'+
'Org12600,Org11429,Org11131,Org11261,Org11448,Org10668,Org11403,Org8949,Org5085,Org11582,'+
'Org7666,Org10592,Org11451,Org11450,Org11452,Org11454,Org11453,Org7469,Org12243,Org10455,Org11922,'+
'Org13291,Org11625,Org13260,Org12084,Org6086,Org7526,Org7318,Org7587,Org6167,Org5497,Org11471,Org11253,Org8957,'+
'Org4178,Org13393,Org10391,Org10009,Org5132,Org7875,Org7871,Org6173,Org11510,Org11640,'+
'Org8712,Org11091,Org11092,Org11111,Org11081,Org11100,Org11082,Org11099,Org11096,Org11094,Org11095,Org11112,Org8623,Org7688,'+
'Org9952,Org9703,Org7560,Org8682,Org9109,Org7203,Org13682,'+
'Org4221,Org8798,Org8244,Org10064,Org9159,Org6183,Org7624,Org7395,Org7752,Org8011,Org8560,Org8493,Org8169,Org9626,Org8648,Org9424,Org9267,Org12598,'+   // +�������
'Org10042,Org10327,Org13827,Org8494,Org12321,Org14257,Org7586,Org9714,Org13622,Org12323,Org12388,Org10757,Org12642,Org13592,'+
'Org13503,Org8890,Org9503,Org10008,Org10456,Org9161,Org7684,Org10259,Org9698,Org10293,Org9911,Org10239,Org10448,Org9699,Org12674,Org12795,Org10011,'+
'Org9993,Org10843,Org10304,Org10299,Org10910,Org10437,Org11607,Org10565,Org10478,Org10370,Org10357,Org10713,Org11229,Org12278,Org12911,'+
'Org12904,Org12947,Org13376,Org10327,';
  #else
    ListOrg:='';
  #endif

  strOrg:='*';
  lExtractCheck:=false;
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
    RegQueryStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'version', strOldVersion);
    if not lOk then strOldVersion:='0';
  end;

  lSelSovetToLAIS:=false;
  
  #ifdef SELSOVET_TO_LAIS
  if not Result then begin  //
    // ��������� ��������� ���������� �� �������� �����
    Result:=RegQueryStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME_SS, 'installpath', DataDir);
    if Result then begin  // ���� ��� ���� � ���� �������� �����
      lOk:=RegQueryStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME_SS, 'update', strOldUpdate);
      if not lOk then strOldUpdate:='0';
      lSelSovetToLAIS:=true;
    end;
  end;
  #endif
  
  if Result then begin
    // �� ������� ��������� ��������� ������� ����, � ��������� ������� exe-�����
    if GetIniString('ADMIN', 'MAINCOMP', '0', AddBackSlash(DataDir)+'SysParams.ini')='1' then begin
      lCheckBase:=true;
    end else begin
      lCheckBase:=false;
    end;
    if lCheckBase then begin  // �� ������� ���������� ���� �������
      lOk:=FileExists(DataDir+'\Data\'+Name_Dict);
    end else begin           // �� ������� ���������� ���� exe-����
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
    while BrowseForFolder('�������� ����� � ���������� '+PROG_NAME, strDir, false) do begin
      // �� ������� ��������� ��������� ������� ����, � ��������� ������� exe-�����
      if GetIniString('ADMIN', 'MAINCOMP', '0', AddBackSlash(strDir)+'SysParams.ini')='1' then begin
        lCheckBase:=true;
      end else begin
        lCheckBase:=false;
      end;
      if lCheckBase then begin  // �� ������� ���������� ���� �������
        lOk:=FileExists(strDir+'\Data\'+Name_Dict);
      end else begin           // �� ������� ���������� ���� exe-����
        if lSelSovetToLAIS then begin
          lOk:=FileExists(strDir+'\'+NameExeProg_SS)
        end else begin
//          lOk:=FileExists(strDir+'\'+NameExeProg);   ���� exe-����� ���
          lOk:=FileExists(strDir+'\SysParams.ini'); 
          if not lOk then begin  // ����� ��������� ������ exe-����
            #ifdef AppPost
              if FileExists(strDir+'\Service\progp.pas') or FileExists(strDir+'\SysParams.ini') then begin
                lOk:=true;
              end;
            #else
              #ifdef AppZAH
                if FileExists(strDir+'\Service\progz.pas') or FileExists(strDir+'\SysParams.ini') then begin
                  lOk:=true;
                end;
              #else
                #ifdef AppOPEKA
                  if FileExists(strDir+'\Service\progo.pas') or FileExists(strDir+'\SysParams.ini') then begin
                    lOk:=true;
                  end;
                #else
                  if FileExists(strDir+'\Service\prog.pas') or FileExists(strDir+'\SysParams.ini') then begin
                    lOk:=true;
                  end;
                #endif
              #endif
            #endif
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
        MsgBox('����� ������� ������� !', mbError, MB_OK);
      end;
    end;
  end;
  
  if Result then begin
  
  if not IniKeyExists('MAIN', 'ID', strIni) then begin
    MsgBox(' �� ������ ���� ������������� ! ', mbError, MB_OK);
    Result := false;
  end else begin
    //-------- ����������� ������������� ��������� ���������� --------
    try
      if StrToInt(strOldUpdate) > StrToInt(IDUpdate) then begin
        MsgBox(' ��������� ���������� <'+IDUpdate+'> �� ��������� ! ', mbInformation, MB_OK);
        Result := false;
      end;
      if StrToInt(strOldUpdate) = StrToInt(IDUpdate) then begin
        if strOldVersion = IDProg then begin
          if MsgBox(' ���������� <'+IDUpdate+'> ��� ���������������. ������ ���������� �������� ? ', mbConfirmation, MB_YESNO) = IDNO then begin
            Result := false;
          end;
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
            MsgBox('�������������� ���������� �������� ������ ����.', mbError, MB_OK);
            Result := false;
          end;
        end else begin
          MsgBox('���������� ���������� ������ ����.', mbError, MB_OK);
          Result := false;
        end;
        s:='';
      end;
      #endif
      if DataDir<>'' then begin
        // ����� ���������� �������� ����������� �����
        ForceDirectories(AddBackSlash(DataDir)+'DocArxiv');
        // ����� ���������� ������ ����������� ������
        DelTree(AddBackSlash(DataDir)+'Filters\���������\�����������', False, True, True);
        DelTree(AddBackSlash(DataDir)+'Filters\�������C����\�����������', False, True, True);
        DelTree(AddBackSlash(DataDir)+'Filters\����\�����������', False, True, True);
        
        if DirExists(AddBackSlash(DataDir)+'Filters\���������\����������.flt') then begin
          DelTree(AddBackSlash(DataDir)+'Filters\���������\����������.flt', True, True, True);
        end;
        // ��������� ���� �� ������ ��������� ���������
        if FileExists(AddBackSlash(DataDir)+'Service\'+OBRAB_NAME) then begin
          FileCopy(AddBackSlash(DataDir)+'Service\'+OBRAB_NAME,AddBackSlash(DataDir)+'Update\'+OBRAB_NAME, false);
        end;
        // ������� ��� ���� SysParam.ini ��������
        if (GetIniString('ADMIN', 'MAINCOMP', '', AddBackSlash(DataDir)+'SysParams.ini')='') or
           (GetIniString('ADMIN', 'SERVERTYPES', '', AddBackSlash(DataDir)+'SysParams.ini')='') then begin
          if FileExists(strSysIni) then begin
            FileCopy( strSysIni, AddBackslash(DataDir)+'SysParams.ini', false);
  //          MsgBox('���� ��������� ���������� ��������. '+Chr(13)+'����� ����������� ��� ��������������.', mbError, MB_OK);
            if MsgBox(' ��������� �������� �������� (� ����� ������) ? ', mbConfirmation, MB_YESNO) = IDYES
              then s := '1' else s := '0';
            SetIniString('ADMIN', 'MAINCOMP', s, AddBackslash(DataDir)+'SysParams.ini');
            RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'maincomp', s);
            if MsgBox(' ������������ Advantage Database Server ? ', mbConfirmation, MB_YESNO or MB_DEFBUTTON2) = IDYES
              then s := 'REMOTE' else s := 'LOCAL';
            SetIniString('ADMIN', 'SERVERTYPES', s, AddBackslash(DataDir)+'SysParams.ini');
          end;
        end;
        lMainComp := GetIniBool('ADMIN', 'MAINCOMP', true, AddBackSlash(DataDir)+'SysParams.ini');
        if lMainComp then begin
//          ShowMessage(' Main Computer ');
          lUpdateData := GetIniBool('MAIN', 'DATA', false, strIni);
          lUpdateSpr  := GetIniBool('MAIN', 'SYSSPR', false, strIni);
          lUpdateParam:= GetIniBool('MAIN', 'PARAMS', false, strIni);
          #ifdef AppPost
            strOrg:=AnsiUpperCase(GetIniString('POST', 'SMDOCODE', '', AddBackSlash(DataDir)+'\Service\smdo.ini'));
            {
            if strOrg<>'' then begin
              strMD5:=AnsiUpperCase(GetIniString('PARAM', 'ADD', '', AddBackSlash(DataDir)+'\SysParams.ini'));
              if strMD5='' then begin
                strOrg:='?';
              end else begin
                if GetMD5OfString(ANSIUppercase(strOrg+'myfirstlove'+strOrg))<>strMD5 then begin
                  strOrg:='?';
                end;
              end;
            end;
            }
//  SaveStringToFile('md5',GetMD5OfString(ANSIUppercase('Org8949'+'myfirstlove'+'Org8949')),false);
//  ShowMessage(GetMD5OfString(ANSIUppercase('Org8949'+'myfirstlove'+'Org8949')));
          #endif
        end else begin
//          ShowMessage(' Not Main Computer ');
          lUpdateData := false;
          lUpdateSpr  := false;
          lUpdateParam:= false;
        end;
        lUpdateSysFiles:= GetIniBool('MAIN', 'SYSFILES', false, strIni);
        // �������������� ��������  (�������� Report,Service)
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
          MsgBox('������� ��� ��������� ���������� ��������� "'+PROG_NAME+'" �� ������', mbError, MB_OK);
          Result := false;
        end else begin
//        if GetVersionNumbersString(DataDir+'\'+NameExeProg, strVer) then begin
//          MsgBox('������� ������ ���������:'+strVer, mbInformation, mb_Ok);
//        end;
        end;
      end else begin
        MsgBox('������� ��� ��������� ���������� ��������� "'+PROG_NAME+'" �� ������', mbError, MB_OK);
        Result := false;
      end;
    end;
  end;

  if Result then begin
    #ifdef AppZAH
    s:=AddBackSlash(DataDir)+'Service\ParamZAH.tsk';
    if FileExists(s) then begin
      sl:=TStringList.Create;
      sl.LoadFromFile(s);
      // ���� ������� ������������    '"ID","�����������","100135770"'
      if Pos('"ID","�����������","100135770"', sl.Text)>0 
        then Result:=false;
      sl.Free;
      if Result then begin
        if (GetIniString('ADMIN', 'MESSAGESOURCE', '', AddBackSlash(DataDir)+'Service\gisun.ini')='100135770') 
          then Result:=false;
      end;
    end;
    if not Result
      then MsgBox('��������� ���������� ����������. ���������� � ������ ���������.', mbError, MB_OK);
    #endif
    if ListOrg<>'' then begin
    //  ShowMessage('check');
      if strOrg='' then begin
        #ifdef AppPost
          MsgBox('��������� ���������� ����������. ��������� ��������� ����.', mbError, MB_OK);
          Result := false;
        #endif
      end else begin
        if Pos(','+strOrg+',', ANSIUpperCase(ListOrg))>0 then begin
          MsgBox('��������� ���������� ����������. ���������� � ������ ���������.', mbError, MB_OK);
          Result := false;
        end;
      end;
    end;
  end;

  end;
end;
//--------------------------------------------------
function GetProgDir(DefaultVal : String) :String;
begin
  Result := DataDir;
end;
//--------------------------------------------------
procedure CheckGisunURL(sUrl:String; sFile:String);
var
  s:String;
begin
  s:=GetIniString('HTTP', sUrl, '', sFile);
  if s<>'' then begin 
    StringChangeEx(s,'/gisun/','/gisun-inf/',true);
    SetIniString('HTTP', sUrl, s, sFile);
  end;
end;
//--------------------------------------------------
procedure CheckGisunURLOld(sUrl:String; sFile:String);
var
  s:String;
begin
  s:=GetIniString('HTTP', sUrl, '', sFile);
  if s<>'' then begin 
    StringChangeEx(s,'/gisun-inf/','/gisun/',true);
    SetIniString('HTTP', sUrl, s, sFile);
  end;
end;
//---------- ��������� ��� ��� ������ ��������� �� ���������� ���� ��� ����������
function IsRunUpdateBase : Boolean;
begin Result := lUpdateData or lUpdateParam; end;
//----------------------------------------
procedure InitializeWizard();
var
  ALeft, ATop, TopInc: Integer;
  l:Boolean;
begin
  ProgressPage := CreateOutputProgressPage('��������� �����������', '');
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
    Caption := '��������� ��������� �����������';
//    OnClick := ANotifyEvent;
    Parent := WizardForm.WelcomePage;
  end;
  //ckSaveUpdate := TCheckBox.Create(WizardForm);
{  with ckSaveUpdate do begin
    Left    := ALeft;
    Top     := ATop+20;
    Checked := true;
    Width   := WizardForm.ClientWidth; //WizardForm.CancelButton.Width;
    Caption := '��������� ����������';
    Parent := WizardForm.WelcomePage;
  end; }

  #ifdef SELSOVET_TO_LAIS
    if lSelSovetToLAIS then begin
      lb := TNewStaticText.Create(WizardForm);
      with lb do begin
        Left    := ALeft;
        Top     := ATop+27;
        Width   := 150;
        AutoSize:=true;
        Caption := '��������: ����� ��������� �������������'+chr(13)+'�� "�������� �����" � ����';
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
//      Top     := ATop-27;
      Top     := ATop-45;
      Width   := 400; //150;
      Caption := '������ ������������ ��������������';
      Parent  := WizardForm.WelcomePage;
    end;
    edPassword := TEdit.Create(WizardForm);
    with edPassword do begin
//    Left    := ALeft+50;
//    Top     := ATop-30;
      Left    := ALeft;
      Top     := ATop-30;
      PasswordChar := '*';
      Width   := 100; //WizardForm.CancelButton.Width;
//    Height := WizardForm.CancelButton.Height;
      Text := '';
//    OnClick := ANotifyEvent;
      Parent := WizardForm.WelcomePage;
    end;
  end;
end;
procedure CurPageChanged(curPageID:Integer);
begin
  if curPageID=wpWelcome then begin
    if lMainComp then begin
      WizardForm.ActiveControl:=edPassword;
    end;
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  ResultCode: Integer;
  i : Integer;
  s,ss,sFile : String;
begin
  if CurStep = ssInstall then begin
//  MsgBox(ExpandConstant('{app}'), mbError, MB_OK);

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
    SetIniString('ADMIN', 'SETUP_PATH', '0', AddBackslash(ExpandConstant('{app}'))+'SysParams.ini');
    //---- �������� �������� �� �������� ������� ��������� �����, ������� �������� 10�� ---------------------------------------------------------
    if (REG_NAME='POST') or (REG_NAME='LAIS') then begin
      s:=Trim(GetIniString('POST', 'CHECK_SIZE_MAIL', '', AddBackSlash(DataDir)+'\Service\smdo.ini'));
      if s='' 
        then SetIniString('POST', 'CHECK_SIZE_MAIL', '10', AddBackSlash(DataDir)+'\Service\smdo.ini');
    end;
    sFile:=AddBackslash(DataDir)+'Service\Gisun.ini';
#ifdef GISUN
#ifdef GISUN3
    if lMainComp then begin
      if GetIniString('ADMIN', 'ETSP_ACTIVE', '', sFile)='' then begin
        SetIniString('ADMIN', 'ETSP_ACTIVE', '0', sFile);
        SetIniString('ADMIN', 'ETSP_NAMELIB', '', sFile);
        SetIniString('ADMIN', 'ETSP_URL_SEP', '0', sFile);
        SetIniString('ADMIN', 'ETSP_ALG_HASH', '', sFile);
        SetIniString('ADMIN', 'ETSP_ALG_SOK', '', sFile);
        SetIniString('ADMIN', 'ETSP_ALG_SIGN', '', sFile);
        SetIniString('ADMIN', 'ETSP_ENV', '', sFile);
        SetIniString('ADMIN', 'ETSP_PIN', '', sFile);
      end;
      //--- ��������� �������� USB ������������� !!! -------------------------
      SetIniString('ADMIN', 'CHECK_USB', '1', sFile);
      //----------------------------------------------------------------------
      if GetIniString('ADMIN', 'CHECK_CUR_DATE', '', sFile)='' then begin
        SetIniString('ADMIN', 'CHECK_CUR_DATE', '1', sFile);
      end;
      if GetIniString('ADMIN', 'ORGANZAGS_AS_MESSAGESOURCE', '', sFile)='' then begin
        SetIniString('ADMIN', 'ORGANZAGS_AS_MESSAGESOURCE', '0', sFile);
      end;
      if GetIniString('ADMIN', 'LOG', '', sFile)='' then begin
        SetIniString('ADMIN', 'LOG', '1', sFile);
      end;
      #ifdef AppOPEKA
        if GetIniString('ADMIN', 'MESSAGESOURCE', '', sFile)<>'' 
          then SetIniString('ADMIN', 'MESSAGESOURCE', '', sFile);
        if GetIniString('ADMIN', 'TYPEMESSAGESOURCE', '', sFile)<>'' 
          then SetIniString('ADMIN', 'TYPEMESSAGESOURCE', '', sFile);
      #endif
#ifdef GISUN4
      SetIniString('ADMIN', 'VERSION', '4', sFile);
      CheckGisunURL('GISUN_URL', sFile);
      CheckGisunURL('ZAGS_URL', sFile);
      CheckGisunURL('CLASSIF_URL', sFile);
      CheckGisunURL('GISUN_URL1', sFile);
      CheckGisunURL('ZAGS_URL1', sFile);
#else
      SetIniString('ADMIN', 'VERSION', '3', sFile);
      CheckGisunURLOld('GISUN_URL', sFile);
      CheckGisunURLOld('ZAGS_URL', sFile);
      CheckGisunURLOld('GISUN_URL1', sFile);
      CheckGisunURLOld('ZAGS_URL1', sFile);
      CheckGisunURLOld('CLASSIF_URL', sFile);
#endif
      #ifdef AppLAIS
      //---- �������� �������� �� ������������ ������ ������ �� �������� ��� ����� ����������� � ����� ---------------------------------------------------------
      s:=Trim(GetIniString('ADMIN', 'CHECK_ZAPROS_ZAH', '', sFile));
      if s='' then SetIniString('ADMIN', 'CHECK_ZAPROS_ZAH', '1', sFile);
      #endif
    end;
#endif
#endif
    if IsRunUpdateBase and lMainComp then begin
      ss := ExpandConstant('{app}\UpdateProg.exe');
//      msgbox('������ UpdateProg /USR:'+strUser+' /PSW:'+edPassword.Text+' /'+REG_NAME, mbInformation, mb_Ok);
      if ShellExec('', ss,'/USR:'+strUser+' /PSW:'+edPassword.Text+' /'+REG_NAME, '', SW_SHOW, ewWaitUntilTerminated, ResultCode) then begin

//      if Exec(ss,'/USR:'+strUser+' /PSW:'+edPassword.Text+' /'+REG_NAME, '', SW_SHOW, ewWaitUntilTerminated, ResultCode) then begin
        if ResultCode <> 0 then begin
          MsgBox('������ ��������� ����������: '+IntToStr(ResultCode), mbInformation, mb_Ok);
        end;
      end else begin
        MsgBox('UpdateProg.exe :'+SysErrorMessage(ResultCode), mbInformation, mb_Ok);
        ResultCode := 1;
      end;
//      ResultCode:=1;
      if ResultCode<>0 then begin
        if ckBackup.Checked and lOkBackUp then begin
//          WizardForm.FINISHEDHEADINGLABEL := '###########';
          ProgressPage.Caption := '�������������� �� ��������� �����';
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
      if IS_POST then begin
        DeleteMaskFiles('*.eml',AddBackslash(ExpandConstant('{app}'))+'DocArxiv\EML\');
      end;
    //  if ckSaveUpdate.Checked then begin
    //    ss:=AddBackslash(ExpandConstant('{app}'))+'LastUpdate';
    //    ForceDirectories(ss);
    //    DeleteFile(ss+'\'+'LastUpdate.exe');
    //    if FileCopy(ExpandConstant('{srcexe}'), 'D:\LastUpdate.exe', false)
    //      then ShowMessage('Ok!')
    //    if FileCopy(ExpandConstant('{srcexe}'), ss+'\'+'LastUpdate.exe', false)
    //      then ShowMessage('Ok!')
    //      else ShowMessage('Error: "'+ExpandConstant('{srcexe}')+'" ->  "'+ss+'\'+'LastUpdate.exe'+'"');
    //  end;  

      if lMainComp then begin
        DeleteMaskFiles('*.bak',AddBackslash(ExpandConstant('{app}'))+'Data\');
      end;
      RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'update', IDUpdate);
      RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'version', IDProg);
      #ifdef SELSOVET_TO_LAIS
      if lSelSovetToLAIS then begin
        RegDeleteKeyIncludingSubkeys(HKCU, 'Software\VCBOUS\'+REG_NAME_SS);
        RegWriteStringValue(HKLM, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\�������� �����_is1', 'DisplayName', '����');
        RegWriteStringValue(HKLM, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\�������� �����_is1', 'Inno Setup: Icon Group', '����');
        DeleteFile(AddBackslash( ExpandConstant('{app}') )+NameExeProg_SS);
        DeleteFile(AddBackslash( ExpandConstant('{app}') )+'unins000.exe');
        DeleteFile(AddBackslash( ExpandConstant('{app}') )+'Doc\��������� ��.doc');
        DeleteFile(AddBackslash( ExpandConstant('{app}') )+'Doc\������������ ���������.doc');
        DeleteFile(AddBackslash(ExpandConstant('{userdesktop}'))+'�������� �����.lnk');
        DeleteFile(AddBackslash(ExpandConstant('{userdesktop}'))+'������������ �������� �����.lnk');
        ss:=ExpandConstant('{group}');
        StringChange(ss, '\����', '\�������� �����');
        DelTree(ss,true,true,true );
//        CreateShellLink( ExpandConstant('{userdesktop}')+'\����.lnk',
//                        '����',
//                        ExpandConstant('{app}')+'\LAIS.exe',
//                        '',
//                        ExpandConstant('{app}'),'',
//                        0,SW_SHOWNORMAL);
      end;
      #endif
      if Pos('LASTUPDATE.EXE',ANSIUpperCase(ExpandConstant('{srcexe}')))=0 then begin
        // ������ ���� � ��� ����� ����������
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
      // ���� �������� ������ ��� ��������� ����������
      if lSelSovetToLAIS then begin
        RegDeleteKeyIncludingSubkeys(HKCU, 'Software\VCBOUS\'+REG_NAME);        // �������
        DeleteFile(AddBackslash( ExpandConstant('{app}') )+'Doc\��������� ����.doc');
        DeleteFile(AddBackslash( ExpandConstant('{app}') )+'Doc\����������� ������������ ����.doc');
        DeleteFile(AddBackslash(ExpandConstant('{userdesktop}'))+'����.lnk');               // ������� ����
        DeleteFile(AddBackslash(ExpandConstant('{userdesktop}'))+'������������ ����.lnk');
        DelTree(ExpandConstant('{group}'),true,true,true );   // ��������� (��� ���������)
      end;
      #endif
      RegWriteStringValue(HKCU, 'Software\VCBOUS', 'typelastupdate', '');
      RegWriteStringValue(HKCU, 'Software\VCBOUS', 'namelastupdate', '');
      RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'update', strOldUpdate);
      RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'version', strOldVersion);
    end;
  end;
end;
function NextButtonClick(CurPage: Integer): Boolean;
var
  ResultCode,i : Integer;
  ss : String;
  lOk:Boolean;
begin
  Result := True;
  if CurPage = wpWelcome then begin
    if lMainComp then begin
      if edPassword.Text='sysdba' then strUser := 'ADSSYS' else strUser:='�������������';
      if not lExtractCheck then begin
        ExtractTemporaryFile('CheckConnect.exe');
        ss := ExpandConstant('{tmp}\CheckConnect.exe');
        lOk:=FileCopy(ss, DataDir + '\CheckConnect.exe', false);
        if lOk then lExtractCheck:=true;
      end else begin
        lOk:=true;
      end;
      if lOk then begin
        // adscollate.adm  adscollate.adt  ace32.dll adsloc32.dll adslocal.cfg aicu32.dll ansi.chr axcws32.dll extend.chr icudt40l.dat       
        ss:=ExpandConstant('{tmp}\');
        arr_ads[1]:='adscollate.adm';
        arr_ads[2]:='adscollate.adt';
        arr_ads[3]:='ace32.dll';
        arr_ads[4]:='adsloc32.dll';
        arr_ads[5]:='adslocal.cfg';
        arr_ads[6]:='aicu32.dll';
        arr_ads[7]:='ansi.chr';
        arr_ads[8]:='axcws32.dll';
        arr_ads[9]:='extend.chr';
        arr_ads[10]:='icudt40l.dat';
        for i:=1 to 10 do begin
          ExtractTemporaryFile(arr_ads[i]);
          FileCopy(ss+arr_ads[i], DataDir+'\'+arr_ads[i], false);
        end;
      //        MsgBox(ss+'  ->   '+DataDir + '\CheckConnect.exe', mbInformation, mb_Ok);
        ss := DataDir + '\CheckConnect.exe';
        //if Exec(ss,strUser+' '+Trim(edPassword.Text)+' ������������', '',  SW_HIDE, ewWaitUntilTerminated, ResultCode) then begin
        #ifdef AppPost
          if ShellExec('', ss, strUser+' '+Trim(edPassword.Text)+' SMDOPost', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then begin
        #else
          #ifdef AppZAGS
            if ShellExec('', ss, strUser+' '+Trim(edPassword.Text)+' ������������', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then begin
          #else
            #ifdef AppZAH
              if ShellExec('', ss, strUser+' '+Trim(edPassword.Text)+' AktZ', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then begin
            #else
              #ifdef AppOPEKA
                if ShellExec('', ss, strUser+' '+Trim(edPassword.Text)+' AktOpek', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then begin
              #else
                if ShellExec('', ss, strUser+' '+Trim(edPassword.Text)+' ���������', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then begin
              #endif
            #endif
          #endif
        #endif

//             MsgBox(IntToStr(ResultCode), mbInformation, mb_Ok);
          if ResultCode <> 0 then begin
            Result := false;
            if ResultCode = 9999 then begin
              MsgBox('���������� ���������� ������������ � ���� ������.', mbError, mb_Ok);
            end else begin
              MsgBox('������ ����������� � ���� ������: '+IntToStr(ResultCode), mbError, mb_Ok);
            end;
          end;
        end else begin
          MsgBox('CheckConnect.exe :'+SysErrorMessage(ResultCode), mbError, mb_Ok);
          Result := false;
        end;
      end;
    end else begin
      strUser:='�������������';
    end;
    #ifdef SELSOVET_TO_LAIS
      if Result and lSelSovetToLAIS then begin
//        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'installpath', DataDir)
//        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'version', IDProg);
//        RegWriteStringValue(HKCU, 'Software\VCBOUS\'+REG_NAME, 'update', '0');
//        if MsgBox('����� ��������� ��������� "�������� �����"  ����� ����������. �� �������� ?', mbConfirmation, MB_YESNO) = IDNO then begin
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
Filename: "{app}\UpdateProg.exe"; Parameters:"/LASTUPDATE"; Description: "��������� ����������"; WorkingDir: "{app}"; Flags: nowait postinstall skipifsilent runascurrentuser
;Filename: "{app}\CheckConnect.exe"; Parameters:'/LASTUPDATE'; Description: "��������� ��������� ����������"; Flags: nowait postinstall skipifsilent
;Filename: "{app}\SelSovet.exe"; Description: "�������� �����"; Flags: nowait postinstall skipifsilent
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


