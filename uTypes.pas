unit uTypes;

interface

{$I Task.inc}

uses Windows, Classes, Messages, SysUtils;

type
  ELichNomerInvalid = class(Exception);
  EMyError = class(Exception);

  TIsDirBase = procedure(sDir : String; nType : Integer) of object;

  TOneRecZah=record
    Error:String;
    Warning:Boolean;
    DateZah:TDateTime;
    sDateZah:String;
    Full:String;
    Tip:Integer;
    LichNomer:String;
    Familia:String;
    Name:String;
    Otch:String;
    Klad:String;
    Klad_GIS:String;
    Book:String;
    Sector:String;
    Rad:String;
    Uch:String;
    Mog:String;
    St_Klum:String;
    Klum:String;
    Stakan:String;
    Sklep:String;
  end;

  TATE=record
    Kod:String;
    ATE_PARENTID:Integer;
    ATE_ID:Integer;
    Name:String;
    Name_B:String;
    Category:Integer;
    NameC:String;
    NaneC_B:String;
    Front:Integer;
    FullName:String;
    Obl:String;
    Obl_B:String;
    Raion:String;
    Raion_B:String;
    RnGorod:String;
    RnGorod_B:String;
    SS:String;
    SS_B:String;
    Error:String;
    Active:Boolean;
    idObl:Integer;
    idRaion:Integer;
    idRaionG:Integer;
    idSS:Integer;
    idPunkt:Integer;
  end;
  TArrATE = array of TATE;
  TATEPath=record
    NP:Integer;
    SS:Integer;
    Raion:Integer;
    Obl:Integer;
  end;
  TTypeChoiceMen = ( cmAll, cmPresent, cmNotCanDelete);

  tPol = ( tpNone, tpM, tpG );

  TFamilyGet  = ( getChild, getFather, getMather, getHusband, getWife);
  TFamilyGets = set of TFamilyGet;

  TSoato=record
    Kod : String;
    Name : String;
    FullName : String;
    ATEID : Integer;
  end;

  TPassport = record
    Udost : String;
    UdostB: String;
    UdostKod : Integer;
    Seria : String;
    Nomer : String;
    Organ : String;
    OrganKod : String;
    Date  : TDateTime;
    Srok  : TDateTime;
    sDate : String;       // ���� ������ � ���� ������
    LichNomer : String;
  end;

  TRecSprGISUN=record
    Ok:Boolean;
    TypeSpr:Integer;
    ExtCode:String;
    Lex1:String;
    Lex2:String;
    Lex3:String;
  end;

var
  _WorkedThread_ : Boolean;   // �������� ��� ��� ����� ��������� �������� EnterWorkerThread
  //--- ��� FTP -------------
  DirFTP:String;
  TypeServerFTP:Integer;
  AverageSpeed: Double;
  AbortTransfer: Boolean;
  TransferrignData: Boolean;
  BytesToTransfer: LongWord;
  STime: TDateTime;
  BeginDateDelo1,BeginDateDelo2:TDateTime;   // ���� �������� ���� ��� �������������� ������
  //------------------------

const
  // ������ � ��� GlobalTask.WriteToLogFile
  LOG_DEF=0;
  LOG_SQL=1;    // SQL ������
  LOG_FILTER=2; // set filter
  LOG_COPY=3; // ����������� ������
  LOG_ADD=4;  // �������� ������
  LOG_EDIT=5; // ������������� ������
  LOG_DEL=6;  // �������� ������

  TYPEDOK_ROWS=20;
  TYPEDOK_WIDTH=550;
{$IFDEF ADD_VEDOM_ARXIV}
  VEDOM_ARXIV=true;
{$ELSE}
  VEDOM_ARXIV=false;
{$ENDIF}

  Default_PixelsPerInch=96;

  UPDATEOBJ_ADD=1;          // �������� ���������
  UPDATEOBJ_CORR=2;         // ������ �������������
  UPDATEOBJ_CORR_GRN=3;     // ������ ������������� ���������� ��� ��
  UPDATEOBJ_GISRN=4;        // �������� � �������
  UPDATEOBJ_OBRAB=5;        // ������������� � ���������� ���������
  UPDATEOBJ_OBRAB_GRN=6;    // ������������� ���������� ��� �� � ���������� ���������

  RUN_CHECK=1;     // ����������� �������� ����������
  RUN_GETFILE=2;   // ����������� �������� ����� ����������

  STD_LEN=40;
  CRLF=#13#10;
  ADD_KOD_SHABLON=1000;    // ��. OpisEdit.pas  LoadDS ������������ ����� +1000

  //===========================================================
  //SMDO  ����
  SUBJ_IN=1;       // �������� ���������
  SUBJ_OUT=2;      // ��������� ���������

  MSG_TYPE_A=0;    // �����������
  MSG_TYPE_D=1;    // ���. ��������
  MSG_TYPE_DA=2;   // ���. � ���. ���������
  MSG_TYPE_O=3;    // �������� ������
  MSG_TYPE_OA=4;   // ���. � ��������� ������

                  //3895066946
  REFRESH_NOT_REQ=3895066949;   // ���������� ��� �� ���������

  TYPECHECK_NONE=0;
  TYPECHECK_COUNTMAIL=1;      // �������� ������� ����� �����
  TYPECHECK_RECEIVEMAIL_G=2;  // �� ������� �����
  TYPECHECK_RECEIVEMAIL=3;    // �� ������� �����
  //===========================================================

  WM_CHECKUPDATE=WM_USER+105;
  WM_VIGR_OCH=WM_USER+104;
  WM_REFRESH=WM_USER+103;
  WM_SEND_MAIL=WM_USER+102;
  WM_CLOSE_MRULIST=WM_USER+101;
  WM_REGISTER_AKT=WM_USER+100;

  SEEK_CATEGORY=1;
  SEEK_PARENT=2;
  SEEK_NAME=3;
  SEEK_ATEID=4;

  PSW_ZAGS2ZAH='zags2zah';
  {
  SEEK_LPX_DATE  =1;
  SEEK_LPX_PL    =2;
  SEEK_LPX_CHECK =3;
  }

  SHEDULE_VIGR_OCH=1;

  OCH_PRICH_UNION=1111; // ��� ������� ������ ��� ����������� �������
  // ������� ���������� � ������ ����� ����������
  PRICH_ADD_SIMPLE=1;
  PRICH_ADD_UNION=2;

  // ���� ��� ����������� ���� �������� � �������
  OCH_RESH_POST=1;
  OCH_RESH_VOST=2;
  OCH_RESH_RAZD=3;
  OCH_RESH_PERE=4;
  OCH_RESH_UNION=5;
  OCH_RESH_SN=9;
  OCH_RESH_ADDMEN=6;
  OCH_RESH_ISKMEN=7;
  OCH_RESH_PERENOS=8;

  OCH_TYPE_OBSH=0;
  OCH_TYPE_MNOGO=1;
  OCH_TYPE_SOCIAL=2;
  OCH_TYPE_VOEN=3;
  OCH_TYPE_UCH=4;

  OCH_OSN_FULL=1;   // ������ ������������
  OCH_OSN_KRAT=2;   // ������� + ������������ �����
  OCH_OSN_UKAZ=3;   // ����� + ������������ �����
  OCH_OSN_POLOG=4;  // ����� + ���������
  OCH_OSN_PUNKT=5;  // ������ ����� ������
  OCH_OSN_FULL2=6;   // ������ ������������ + ������������ �����


  COUNT_OCHERED_MAX=10;  // ������������ ���������� ������� � ����������� � demo ������
  OCHERED_SOCIAL=2;
  MAX_OCHERED=4;   //   ������������ ����� ���� �������  3=�������

  TH_UCHASTOK=6;   //   KEY_TYPE_HOUSE_CONST

  //----- GISUN ---------------------------------------------
   //���� ���������������
   //-51 ������ �����������
   //-50 ������ ��������������
   //-40 ������ ������� ������ �����
   //-20 ������ � ���������� �����������
 ctSysDoc  =  -2; //���� ��������� ����������
 ctStatus  = -18;  //������ ����
   //-17 ������� �������� �������
   //-16 ������ ������������� ������
   //-12 ������� ������������
   //-11 ���� �������� (�����������)
   //-10 ����� �����
   //-5 ����� ��������� �������
   //-3 ������ �������
   //-1 ��������� ���������
   //6 ���� ��������� �����������
   //35 ���� ���������� �������
   //38 ���� ����
   //81 ������� ������

  ctObl      =  1;   // �������
  ctNP       =  7;   // ���. ������
  ctCountry  =  8;  //������
  ctMVD      = 24;  //������ ���
  ctRaion    = 29;  // ������
  ctPol      = 32;  //���
  ctUlic     = 34;  // �����
  ctTypeCityGit=35; // ���� ���������� �������(����� ����������)

  ctDocType   =37;  // ������������� ����
  ctSvidType  =37;
    DOK_SVID_USTOTC = '54100026';
    DOK_SVID_SMERT  = '54100009';
    DOK_SVID_RAST   = '54100007';
    DOK_SVID_BRAK   = '54100006';
    DOK_SVID_ROGD   = '54100005';

  ctDocTypeMen=39;  // ���� ����������
  ctUlicType = 38;  // ���� ����
  ctSelsovet = 67;  // ����������
  ctTypeCity = 68;  // ���� ���������� �������(����� ��������)
  ctGorRaion = 69;  // ������ �������

  ctZags    =  80;  //������ ����
  TYPESOURCE_ZAGS=80;

  ctDeathCause=81;  //������� ������
  ctActType =  82;  //���� ������� �������
    ctActType_ZRogd='0100';
    ctActType_ZUstOtc='0200';
    ctActType_ZBrak='0300';
    ctActType_ZSmert='0400';
    ctActType_ZRast='0500';
    ctActType_ZChName='0700';

  ctSud      = 88;  // ����
  ctVK       = 104; // ������� ������������
  //-------------------------
  ctTypeDokSud = 127; // ���� ���������� �����
  //-------------------------
  ctIspolcom = 131; // ��������� (������ �����)
  ctOpeka    = 131; // ��������� (������ �����)
  TYPESOURCE_OPEKA=131;
  //-------------------------
  ctTypeDoc  = 133; // ���� ����������  ???

  ctZah      = 134;   // ����� �����������
  ctGKX      = 142;   // ������ ���
  TYPESOURCE_ZAH=142; // ������ ���

  SPEC_ROGD_PODKID = '2';  // ��������
  SPEC_ROGD_OTKAZ  = '3';  // ��������
  SPEC_ROGD_TRUP   = '4';  // ������ ���� �������
  SPEC_ROGD_UMER   = '5';  // ������� �������

//---------------------------------------------------------
  DATE_FULL     = 0;   // ���� ��������� ��� ������ ����
  DATE_GOD      = 1;   // ���� ��������� ��� ���
  DATE_GODMONTH = 2;   // ���� ��������� ��� ��� � �����
//--------------------------------------------------------
  SVID_VIDANO   = 1;   // ������������� ������
  SVID_VIDANO_P = 2;   // ������������� ������ ��������
  SVID_ISPOR    = 3;   // ������������� ���������
  SVID_UTER     = 4;   // ������������� �������
  SVID_VOZVR    = 5;   // ������������� ���������� � ����
  SVID_SS       = 6;   // ������������� �������� � ������������

  DATE_TO_GOD  = 0;
  DATE_TO_DATE = 1;
  DATE_TO_VOZR = 2;

  // ��� ���������: SysSpr.SprTypeDok
  UDOST_SVID_ROGD=6;  // ������������� � ��������

  //  ����� ���� �������������
  SVID_LEN = 7; // !!! ���� ������� � ADS ������� ���. ��������� "7" !!!

  // ������� ����� ���,������,��������
  SIZE_FIELD_DOM=7;

  LEN_KNIGA_NOMER=8;
  LEN_KNIGA_STR=5;

  NATION_NOT_SVED=190;

  // ��� ������������ ���������
  OWNER_NASEL  = 1;
  OWNER_NASEL_STR = '1';
  // ��� ������������ �����������
  OWNER_ORG = 2;
  OWNER_ORG_STR = '2';
  // ���� �������
  NALOG_ZEMLJA   = 1;
  NALOG_NEDVIG   = 2;
  NALOG_NEDOIMKA = 3;
  NALOG_PENJA    = 4;
  // ���� ����������   ��.KEY_LIC_TYPEDOK
  DOK_IZVECH_NALOG = 1;    // ��������� � ���������
  DOK_SPRAV_PROD   = 2;    // ������� � ������������� ���������
  DOK_SPRAV_SEM    = 3;    // ������� � ������� �����

  DOGOVOR_NAIMA = 1;   // ��������� ���������: "������� �����"

//====== ����� � �������������� =================
 VID_OPEKA_DO14 =1; // ����� �� 14 ���
 VID_OPEKA_NOT  =2; // ����� ��� ��������������
 VID_POPECH_DO18=101; // �������. �� 18 ���
 VID_POPECH_NOT =102; // �������. ��� ��������������

 CHILD_SIROTA =1;   // ���  ������
 CHILD_POPECH =2;   // ���  ��� ���������

 FORMA_GOSUD=1;     // ���������������
 FORMA_OPEKA=2;     // ���������� �����
 FORMA_PRIEM=3;     // �������� �����
 FORMA_HOUSE=4;     // ������� ��� ��������� ����
 FORMA_DEREV=5;     // ������� �������
//===============================================
  {$IFDEF UPDATEPROG}
    NameFile_OBRABOTKA='Obrabotka.ini';
    NameFile_Params='Parameters.tsk';
    NAME_FILE_UPDATE='UPDATELAIS';
    NAME_FILE_PATH='PATHLAIS';
    DIR_UPDATE='lais';
    FILE_MESSAGES='messages';
    //NAME_SETUP_PROG='SetupLAIS.exe';
  {$ENDIF}

  {$IFDEF LAIS}
    NameFile_OBRABOTKA='Obrabotka.ini';
    NameFile_Params='Parameters.tsk';
    NAME_FILE_UPDATE='UPDATELAIS';
    NAME_FILE_PATH='PATHLAIS';
    DIR_UPDATE='lais';
    FILE_MESSAGES='messages';
    NAME_SETUP_PROG='SetupLAIS.exe';
  {$ENDIF}
  {$IFDEF ZAGS}
    NameFile_OBRABOTKA='ObrabotkaZags.ini';
    NameFile_Params='ParamZags.tsk';
    NAME_FILE_UPDATE='UPDATEZAGS';
    NAME_FILE_PATH='PATHZAGS';
    DIR_UPDATE='zags';
    FILE_MESSAGES='messages_zags';
    NAME_SETUP_PROG='SetupZAGS.exe';
  {$ENDIF}
  {$IFDEF OCHERED}
    NameFile_OBRABOTKA='ObrabotkaOchered.ini';
    NameFile_Params='ParamOchered.tsk';
    NAME_FILE_UPDATE='UPDATEOCHERED';
    NAME_FILE_PATH='PATHOCHERED';
    DIR_UPDATE='ochered';
    FILE_MESSAGES='messages_ochered';
    NAME_SETUP_PROG='SetupOchered.exe';
  {$ENDIF}
  {$IFDEF GKH}
    NameFile_OBRABOTKA='ObrabotkaGKH.ini';
    NameFile_Params='ParamGKH.tsk';
    NAME_FILE_UPDATE='UPDATEGKH';
    NAME_FILE_PATH='PATHGKH';
    DIR_UPDATE='zkh';
    FILE_MESSAGES='messages_zkh';
    NAME_SETUP_PROG='SetupGKH.exe';
  {$ENDIF}
  {$IFDEF ZAH}
    NameFile_OBRABOTKA='ObrabotkaZAH.ini';
    NameFile_Params='ParamZah.tsk';
    NAME_FILE_UPDATE='UPDATEZAH';
    NAME_FILE_PATH='PATHZAH';
    DIR_UPDATE='zah';
    FILE_MESSAGES='messages_zah';
    NAME_SETUP_PROG='SetupZAH.exe';
  {$ENDIF}
  {$IFDEF OPEKA}
    NameFile_OBRABOTKA='ObrabotkaOpeka.ini';
    NameFile_Params='ParamOpeka.tsk';
    NAME_FILE_UPDATE='UPDATEOPEKA';
    NAME_FILE_PATH='PATHOPEKA';
    DIR_UPDATE='opeka';
    FILE_MESSAGES='messages_opeka';
    NAME_SETUP_PROG='SetupOpeka.exe';
  {$ENDIF}
  {$IFDEF POST}
    NameFile_OBRABOTKA='ObrabotkaPost.ini';
    NameFile_Params='ParamPost.tsk';
    NAME_FILE_UPDATE='UPDATELAISSMDO';
    NAME_FILE_PATH='PATHLAISSMDO';
    DIR_UPDATE='laissmdo';
    FILE_MESSAGES='messages_laissmdo';
    NAME_SETUP_PROG='SetupLaisSmdo.exe';
  {$ENDIF}

  {$IFDEF OPEKA}
    NAME_DICT='Base.add';
    NameFile_EVENTS='UserEventsOpeka.ini';
    VersionVigrOpeka=2;
  {$ELSE}
    {$IFDEF ZAH}
      NAME_DICT='Base.add';
      NameFile_EVENTS='UserEventsZAH.ini';
    {$ELSE}
      {$IFDEF POST}
        NAME_DICT='Base.add';
        NameFile_EVENTS='UserEventsPost.ini';
      {$ELSE}
        NAME_DICT='SelSovet.add';
        NameFile_EVENTS='UserEvents.ini';
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}

  CURRENT_SOST = '1899-12-30';

  ZAGS_OBL_ARXIV = 1;

  HOUSE_GIL   = 1;  // �� ����� KeyList.ini  ������� ������ ����
  HOUSE_EMPTY = 2;  // �� ����� KeyList.ini  ������� ���������� ����

  CONTROL_PRIVATE = -1;
  CONTROL_DEFAULT = 0;

  MIGR_UBIL = '0';
  MIGR_PRIB = '1';
  MIGR_UBILN = 0;
  MIGR_PRIBN = 1;

  // �������� ��� ���� "kateg"
  LIC_REG     = 0; //  ������� �� ������� � ������������
  LIC_NOTREG  = 1; //  ������� �� ������� ��� �����������
  ADRES_NOTREG= 2; //  ������� ��� �������. � ��� ��������, �� ���������� ���������
  BEZ_ADRESA  = 3; //  ������� �� ��������� � �� ��������������� (�����)
  FIRST_NOTMY = 4; //  ����� ���. ����� �� ���  (��� �������� ������)
  // �������� ��� ������� TdmMen.TypeReg
  MESTO_GIT    = 1;
  MESTO_PREB   = 0;
  MESTO_NOTREG = 2; // �� ����������������

  HOUSE_EMPTY_DOM = '#';
  HOUSE_EMPTY_KORP = '#';
  LEN_IN=14;            // ������ ������ �������������
  MY_GRAG=112;          // ����������� ��
  MY_GRAG_STR='112';    // ����������� �� � ������
  MY_STRANA='���������� ��������';
  NOT_GRAG=999;         // ���� ��� �����������
  NOT_GRAG_STR='999';   // ���� ��� �����������
  IN_GRAG_STR='995';    // ����������� ���������
  SVED_GRAG_STR='998';  // �������� �� ����������� �� ������������
  PASP_GR_RB=1;         // ������� ���������� ��
  VIDG_GR_NO=2;         // ��� �� ���������� ���� ��� �����������
  VIDG_GR_IN=3;         // ��� �� ���������� ������. ����������
  PASP_IN=4;            // ������� ������������ ����������
  UDOS_BEG=5;           // ������������� �������
  SVID_ROG=6;           // ������������� � ��������
  NOT_DOK=999;          // �������� �� �����������
  PASP_ZMAT=1000;

  ATE_CATEG_OBL=101;
  ATE_CATEG_RN=102;
  ATE_CATEG_SS=103;

  SERVER_BREST=1;
  SERVER_RIAP=2;
  SERVER_FTP=2;
  SERVER_OCHERED=3;
  SERVER_ZAGS=4;
  SERVER_UPDATE=5;
  SERVER_ZAH=6;
  SERVER_OPEKA=7;
  SERVER_NCES_NSI=8;
  SERVER_NCES_UPD=9;
  SERVER_NCES_UPD2=11;

  NET_PATH=10;

  PSW_ADMIN_FTP='admin1106';

  SVED_BRAK   = '1';    // ���� ��������
  SVED_MATER  = '3';    // ��������� ������

  SEM_BRAK = 1;    // ������� � �����
  SEM_NOT  = 2;    // � ����� �� �������(�)
  SEM_DEATH= 3;    // ������(�)
  SEM_RAST = 4;    // ��������(�)

  // ��� ��������� �����������
  NUM_KLAD_BOOK=1;
  NUM_KLAD=2;
  NUM_KLAD_YEAR=3;

//------- ���� �������� � ���� -------- ��. ����� ������� <TypeObj_ ...>
 _TypeOper_ChoiceIN=5000;
 _TypeOper_Obrab=5001;
 _TypeOper_SMDO=5002;

 _TypeObj_Adres=1;
 _TypeObj_Lich=2;
 _TypeObj_Nasel=3;
 _TypeObj_Passport=4;
 _TypeObj_PassportViza=14;
 _TypeObj_Owners=15;
 _TypeObj_BigHouse=17;

 _TypesObj_ZapisAkt='5;6;7;8;11;12;13;18';       // ������� ������� �����
 _TypesObj_GurnZv='16;30;38;70;71;74;75;77';     // ������� ��������� ��� ����

 _TypeObj_ZBrak=5;
 _TypeObj_ZRogd=6;
 _TypeObj_ZSmert=7;
 _TypeObj_ZUstOtc=8;
 _TypeObj_TalonPrib=9;
 _TypeObj_TalonUbit=10;
 _TypeObj_ZRast=11;
 _TypeObj_ZAdopt=12;
 _TypeObj_ZChName=13;
 _TypeObj_ZUstMat=18;
 _TypeObj_DBrak=16;

 _TypeObj_RasxNaklSvid=26;    // ��������� ��������� ������������� � ������������
 _TypeObj_AktSpisSvid=27;     // ��� �������� ������������
 _TypeObj_AktNalichSvid=28;   // ��� ������� ������� ������������

 _TypeObj_Sovet=19;
 _TypeObj_PasportTerr=20;  // ������� ����������
 _TypeObj_Ochered=21;
 _TypeObj_Organ=22;    // ���������� ����������� (�������������)
 _TypeObj_Obrach=23;  // ��������� �������
 _TypeObj_VUS=24;
 _TypeObj_DeclareRegistr=25;      // ��������� �� �����������
 _TypeObj_VidGit=29;      // ��� �� ����������
 _TypeObj_DRast=30;      // ��������� �� ����������� �����
 _TypeObj_Alfavit=31;    // ���������� �����
 _TypeObj_IN=32;    // ����������������� �����
 _TypeObj_PredZapis_=33;  // ��������������� ������ �� ����������� �����
 _TypeObj_UID=34;
 _TypeObj_SMDOPost=35;
 _TypeObj_SMDOPostUvd=36;
 _TypeObj_SMDOPostDoc=37;
 _TypeObj_DChName=38;    // ��������� � �������� ���
 _TypeObj_BookKlad=39;   // ������ ���� ��� ��� ����������� ���� �����������
 _TypeObj_Shedule=40;    // ������� �� ����������
 _TypeObj_Messages=41;   // ��������� ��� ������������ �� ����� messages �� ����� ����
 _TypeObj_LoadZah=42;    // ������ ��������

 _TypeObj_AddDokZAGS_Min=43;    // ����������� ����� ���. ���. ����
 // 43 .. 48 ������
 _TypeObj_ZAGS_DeclSvid=49;        // ��������� � ������ ���������� �������������
 _TypeObj_ZAGS_AddDok=50;
 _TypeObj_ZAGS_SprAkt=51;          // ������� � ������ ���� ��. ���������
 _TypeObj_ZAGS_SprOtsut=52;        // ������� �� ���������� ������� ������
 _TypeObj_ZAGS_IzvOtsut=53;        // ��������� �� ���������� ������� ������
 _TypeObj_ZAGS_ZaklChName=54;      // ���������� � �������� �����, �������
 _TypeObj_ZAGS_SprBrak=55;         // ������� � ������ ���� � �����
 _TypeObj_ZAGS_SprRogd=56;         // ������� � ������ ���� � ��������
 _TypeObj_ZAGS_SprSmert=57;        // ������� � ������ ���� � ������
 _TypeObj_ZAGS_SprChName=58;       //
 _TypeObj_ZAGS_SprRast=59;         //
 _TypeObj_ZAGS_ZaklIzmAkt=60;
 _TypeObj_ZAGS_ZaklAddIN=61;
 _TypeObj_AddDokZAGS_Max=61;    // ������������ ����� ���. ���. ����

 _TypeObj_AktZAH=62;               // ���� �����������
 _TypeObj_Opeka=63;                // �����
 _TypeObj_DIzm=64;              // ��������� � �������� ��������� � �/�    ����

 // 65 .. 69 ������
 _TypeObj_UZRogd=70;
 _TypeObj_UZSmert=71;
 _TypeObj_UZBrak=72;
 _TypeObj_UZRast=73;
 _TypeObj_UZUstOtc=74;
 _TypeObj_UZUstMat=75;
 _TypeObj_UZChName=76;
 _TypeObj_UZAdopt=77;

 _TypeObj_UZ_Max=80;   // !!! ���� ���  !!

 _TypeObj_Spr=100;
 _TypeObj_SprDocSubjG_=101;
 _TypeObj_QueryGIS=102;   // ������ � ������� ������������ ������
 _TypeObj_RegDogN=103;    // ����������� ��������� ����� �������
 _TypeObj_RegDogN2=104;   // ����������� ��������� ����� ��. ���
 _TypeObj_AteEva=105;     // ������������ ���. ���� ��������� � �������������� ���

 ERR_REG_GIS='������ ��������� ������ ��� ������������������ ������.';

 ETSP_NIITZI=1;
 ETSP_AVEST=2;
 ETSP_MAX=2;

implementation

initialization
  _WorkedThread_:=false;
  BeginDateDelo1:=0;    // ���� �������� ���� ��� �������������� ������
  BeginDateDelo2:=0;

end.
