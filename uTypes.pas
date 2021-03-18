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
    sDate : String;       // дата выдачи в виде текста
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
  _WorkedThread_ : Boolean;   // работает или нет поток созданный функцией EnterWorkerThread
  //--- для FTP -------------
  DirFTP:String;
  TypeServerFTP:Integer;
  AverageSpeed: Double;
  AbortTransfer: Boolean;
  TransferrignData: Boolean;
  BytesToTransfer: LongWord;
  STime: TDateTime;
  BeginDateDelo1,BeginDateDelo2:TDateTime;   // даты выгрузки дела для ведомственного архива
  //------------------------

const
  // запись в лог GlobalTask.WriteToLogFile
  LOG_DEF=0;
  LOG_SQL=1;    // SQL запрос
  LOG_FILTER=2; // set filter
  LOG_COPY=3; // копирование файлов
  LOG_ADD=4;  // создание записи
  LOG_EDIT=5; // корректировка записи
  LOG_DEL=6;  // удаление записи

  TYPEDOK_ROWS=20;
  TYPEDOK_WIDTH=550;
{$IFDEF ADD_VEDOM_ARXIV}
  VEDOM_ARXIV=true;
{$ELSE}
  VEDOM_ARXIV=false;
{$ENDIF}

  Default_PixelsPerInch=96;

  UPDATEOBJ_ADD=1;          // создание документа
  UPDATEOBJ_CORR=2;         // ручная корректировка
  UPDATEOBJ_CORR_GRN=3;     // ручная корректировка реквизитов ГИС РН
  UPDATEOBJ_GISRN=4;        // отправка в регистр
  UPDATEOBJ_OBRAB=5;        // корректировка в результате обработки
  UPDATEOBJ_OBRAB_GRN=6;    // корректировка реквизитов ГИС РН в результате обработки

  RUN_CHECK=1;     // выполняется проверка обновления
  RUN_GETFILE=2;   // выполняется загрузка файла обновления

  STD_LEN=40;
  CRLF=#13#10;
  ADD_KOD_SHABLON=1000;    // см. OpisEdit.pas  LoadDS используктся число +1000

  //===========================================================
  //SMDO  СМДО
  SUBJ_IN=1;       // входящее сообщение
  SUBJ_OUT=2;      // исходящее сообщение

  MSG_TYPE_A=0;    // уведомление
  MSG_TYPE_D=1;    // осн. документ
  MSG_TYPE_DA=2;   // доп. к осн. документу
  MSG_TYPE_O=3;    // документ ответа
  MSG_TYPE_OA=4;   // доп. к документу ответа

                  //3895066946
  REFRESH_NOT_REQ=3895066949;   // обновление СОС не требуется

  TYPECHECK_NONE=0;
  TYPECHECK_COUNTMAIL=1;      // проверка наличия новой почты
  TYPECHECK_RECEIVEMAIL_G=2;  // из журнала почты
  TYPECHECK_RECEIVEMAIL=3;    // из главной формы
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

  OCH_PRICH_UNION=1111; // код причины снятия при объединении очереди
  // причина добавления в состав семьи очередника
  PRICH_ADD_SIMPLE=1;
  PRICH_ADD_UNION=2;

  // есть еще определение этих констант в скрипте
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

  OCH_OSN_FULL=1;   // полное наименование
  OCH_OSN_KRAT=2;   // краткое + наименование указа
  OCH_OSN_UKAZ=3;   // пункт + наименование указа
  OCH_OSN_POLOG=4;  // пункт + положение
  OCH_OSN_PUNKT=5;  // только номер пункта
  OCH_OSN_FULL2=6;   // полное наименование + наименование указа


  COUNT_OCHERED_MAX=10;  // максимальное количество записей в очередниках в demo версии
  OCHERED_SOCIAL=2;
  MAX_OCHERED=4;   //   максимальный номер типа очереди  3=участок

  TH_UCHASTOK=6;   //   KEY_TYPE_HOUSE_CONST

  //----- GISUN ---------------------------------------------
   //Типы классификаторов
   //-51 Статус авторизации
   //-50 Статус аутентификации
   //-40 Статус истории приема почты
   //-20 Ошибки в сообщениях вебсервисов
 ctSysDoc  =  -2; //Типы системных документов
 ctStatus  = -18;  //Статус лица
   //-17 Входные атрибуты запроса
   //-16 Состав запрашиваемых данных
   //-12 Сигналы пользователя
   //-11 Типы операций (репозитарий)
   //-10 Связи семьи
   //-5 Орган установки системы
   //-3 Уровни доступа
   //-1 Системные параметры
   //6 Типы изменения гражданства
   //35 Типы населенных пунктов
   //38 Типы улиц
   //81 Причины смерти

  ctObl      =  1;   // области
  ctNP       =  7;   // нас. пункты
  ctCountry  =  8;  //Страны
  ctMVD      = 24;  //Органы МВД
  ctRaion    = 29;  // районы
  ctPol      = 32;  //Пол
  ctUlic     = 34;  // Улицы
  ctTypeCityGit=35; // типы населенных пунктов(места жительства)

  ctDocType   =37;  // свидетельства загс
  ctSvidType  =37;
    DOK_SVID_USTOTC = '54100026';
    DOK_SVID_SMERT  = '54100009';
    DOK_SVID_RAST   = '54100007';
    DOK_SVID_BRAK   = '54100006';
    DOK_SVID_ROGD   = '54100005';

  ctDocTypeMen=39;  // Типы документов
  ctUlicType = 38;  // типы улиц
  ctSelsovet = 67;  // сельсоветы
  ctTypeCity = 68;  // типы населенных пунктов(места рождения)
  ctGorRaion = 69;  // районы городов

  ctZags    =  80;  //Органы ЗАГС
  TYPESOURCE_ZAGS=80;

  ctDeathCause=81;  //Причины смерти
  ctActType =  82;  //Типы актовых записей
    ctActType_ZRogd='0100';
    ctActType_ZUstOtc='0200';
    ctActType_ZBrak='0300';
    ctActType_ZSmert='0400';
    ctActType_ZRast='0500';
    ctActType_ZChName='0700';

  ctSud      = 88;  // суды
  ctVK       = 104; // военные комиссариаты
  //-------------------------
  ctTypeDokSud = 127; // типы покументов судов
  //-------------------------
  ctIspolcom = 131; // исполкомы (органы опеки)
  ctOpeka    = 131; // исполкомы (органы опеки)
  TYPESOURCE_OPEKA=131;
  //-------------------------
  ctTypeDoc  = 133; // типы документов  ???

  ctZah      = 134;   // места захоронений
  ctGKX      = 142;   // ОРГАНЫ ЖКХ
  TYPESOURCE_ZAH=142; // ОРГАНЫ ЖКХ

  SPEC_ROGD_PODKID = '2';  // подкидыш
  SPEC_ROGD_OTKAZ  = '3';  // отказник
  SPEC_ROGD_TRUP   = '4';  // найден труп ребенка
  SPEC_ROGD_UMER   = '5';  // умерший ребенок

//---------------------------------------------------------
  DATE_FULL     = 0;   // дата храниться как полная дата
  DATE_GOD      = 1;   // дата храниться как год
  DATE_GODMONTH = 2;   // дата храниться как год и месяц
//--------------------------------------------------------
  SVID_VIDANO   = 1;   // свидетельство выдано
  SVID_VIDANO_P = 2;   // свидетельство выдано повторно
  SVID_ISPOR    = 3;   // свидетельство испорчено
  SVID_UTER     = 4;   // свидетельство утеряно
  SVID_VOZVR    = 5;   // свидетельство возвращено в загс
  SVID_SS       = 6;   // свидетельство передано в сельисполком

  DATE_TO_GOD  = 0;
  DATE_TO_DATE = 1;
  DATE_TO_VOZR = 2;

  // тип документа: SysSpr.SprTypeDok
  UDOST_SVID_ROGD=6;  // свидетельство о рождении

  //  длина поля свидетельство
  SVID_LEN = 7; // !!! есть функция в ADS словаре исп. константу "7" !!!

  // размеры полей дом,корпус,квартира
  SIZE_FIELD_DOM=7;

  LEN_KNIGA_NOMER=8;
  LEN_KNIGA_STR=5;

  NATION_NOT_SVED=190;

  // тип собствениика население
  OWNER_NASEL  = 1;
  OWNER_NASEL_STR = '1';
  // тип собствениика организация
  OWNER_ORG = 2;
  OWNER_ORG_STR = '2';
  // виды налогов
  NALOG_ZEMLJA   = 1;
  NALOG_NEDVIG   = 2;
  NALOG_NEDOIMKA = 3;
  NALOG_PENJA    = 4;
  // типы документов   см.KEY_LIC_TYPEDOK
  DOK_IZVECH_NALOG = 1;    // извещение в налоговую
  DOK_SPRAV_PROD   = 2;    // справка о произведенной продукции
  DOK_SPRAV_SEM    = 3;    // справка о составе семьи

  DOGOVOR_NAIMA = 1;   // основание заселения: "договор найма"

//====== опека и попечительство =================
 VID_OPEKA_DO14 =1; // опека до 14 лет
 VID_OPEKA_NOT  =2; // опека над недееспособным
 VID_POPECH_DO18=101; // попечит. до 18 лет
 VID_POPECH_NOT =102; // попечит. над недееспособным

 CHILD_SIROTA =1;   // тип  сирота
 CHILD_POPECH =2;   // тип  без попечения

 FORMA_GOSUD=1;     // государственная
 FORMA_OPEKA=2;     // опекунская семья
 FORMA_PRIEM=3;     // приемная семья
 FORMA_HOUSE=4;     // детский дом семейного типа
 FORMA_DEREV=5;     // детская деревня
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

  HOUSE_GIL   = 1;  // из файла KeyList.ini  признак жилого дома
  HOUSE_EMPTY = 2;  // из файла KeyList.ini  признак пустующего дома

  CONTROL_PRIVATE = -1;
  CONTROL_DEFAULT = 0;

  MIGR_UBIL = '0';
  MIGR_PRIB = '1';
  MIGR_UBILN = 0;
  MIGR_PRIBN = 1;

  // значения для поля "kateg"
  LIC_REG     = 0; //  человек на лицевом с регистрацией
  LIC_NOTREG  = 1; //  человек на лицевом без регистрации
  ADRES_NOTREG= 2; //  человек без регистр. и без лицевого, но фактически проживает
  BEZ_ADRESA  = 3; //  человек не проживает и не зарегистрирован (чужой)
  FIRST_NOTMY = 4; //  глава лиц. счета не мой  (для Минского района)
  // значения для функции TdmMen.TypeReg
  MESTO_GIT    = 1;
  MESTO_PREB   = 0;
  MESTO_NOTREG = 2; // не зарегистрировани

  HOUSE_EMPTY_DOM = '#';
  HOUSE_EMPTY_KORP = '#';
  LEN_IN=14;            // размер номера идентификации
  MY_GRAG=112;          // гражданство РБ
  MY_GRAG_STR='112';    // гражданство РБ в строке
  MY_STRANA='Республика Беларусь';
  NOT_GRAG=999;         // лицо без гражданства
  NOT_GRAG_STR='999';   // лицо без гражданства
  IN_GRAG_STR='995';    // иностранный гражданин
  SVED_GRAG_STR='998';  // сведения по гражданству не представлены
  PASP_GR_RB=1;         // паспорт гражданина РБ
  VIDG_GR_NO=2;         // вид на жительство лица без гражданства
  VIDG_GR_IN=3;         // вид на жительство иностр. гражданина
  PASP_IN=4;            // паспорт иностранного гражданина
  UDOS_BEG=5;           // удостоверение беженца
  SVID_ROG=6;           // свидетельство о рождении
  NOT_DOK=999;          // документ не представлен
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

  SVED_BRAK   = '1';    // брак заключен
  SVED_MATER  = '3';    // заявление матери

  SEM_BRAK = 1;    // состоит в браке
  SEM_NOT  = 2;    // в браке не состоял(а)
  SEM_DEATH= 3;    // вдовец(а)
  SEM_RAST = 4;    // разведен(а)

  // тип нумерации захоронений
  NUM_KLAD_BOOK=1;
  NUM_KLAD=2;
  NUM_KLAD_YEAR=3;

//------- типы объектов в базе -------- см. также функции <TypeObj_ ...>
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

 _TypesObj_ZapisAkt='5;6;7;8;11;12;13;18';       // объекты записей актов
 _TypesObj_GurnZv='16;30;38;70;71;74;75;77';     // объекты заявлений для загс

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

 _TypeObj_RasxNaklSvid=26;    // расходная накладная свидетельства в сельисполком
 _TypeObj_AktSpisSvid=27;     // акт списания свидетельств
 _TypeObj_AktNalichSvid=28;   // акт наличия бланков свидетельств

 _TypeObj_Sovet=19;
 _TypeObj_PasportTerr=20;  // паспорт территории
 _TypeObj_Ochered=21;
 _TypeObj_Organ=22;    // справочник организаций (СпрМестРаботы)
 _TypeObj_Obrach=23;  // обращения граждан
 _TypeObj_VUS=24;
 _TypeObj_DeclareRegistr=25;      // заявление на регистрацию
 _TypeObj_VidGit=29;      // вид на жительство
 _TypeObj_DRast=30;      // заявление на расторжение брака
 _TypeObj_Alfavit=31;    // алфавитная книга
 _TypeObj_IN=32;    // идентификационный номер
 _TypeObj_PredZapis_=33;  // предварительная запись на регистрацию брака
 _TypeObj_UID=34;
 _TypeObj_SMDOPost=35;
 _TypeObj_SMDOPostUvd=36;
 _TypeObj_SMDOPostDoc=37;
 _TypeObj_DChName=38;    // заявление о перемене ФИО
 _TypeObj_BookKlad=39;   // списки книг для для справочника мест захоронений
 _TypeObj_Shedule=40;    // задания на выполнение
 _TypeObj_Messages=41;   // сообщения для пользователя из файла messages на сайте НЦЭУ
 _TypeObj_LoadZah=42;    // список загрузок

 _TypeObj_AddDokZAGS_Min=43;    // минимальный номер доп. док. ЗАГС
 // 43 .. 48 резерв
 _TypeObj_ZAGS_DeclSvid=49;        // заявление о выдаче повторного свидетельства
 _TypeObj_ZAGS_AddDok=50;
 _TypeObj_ZAGS_SprAkt=51;          // справка о записи акта гр. состояния
 _TypeObj_ZAGS_SprOtsut=52;        // справка об отсутствии актовой записи
 _TypeObj_ZAGS_IzvOtsut=53;        // извещение об отсутствии актовой записи
 _TypeObj_ZAGS_ZaklChName=54;      // заключение о перемене имени, фамилии
 _TypeObj_ZAGS_SprBrak=55;         // справка о записи акта о браке
 _TypeObj_ZAGS_SprRogd=56;         // справка о записи акта о рождении
 _TypeObj_ZAGS_SprSmert=57;        // справка о записи акта о смерти
 _TypeObj_ZAGS_SprChName=58;       //
 _TypeObj_ZAGS_SprRast=59;         //
 _TypeObj_ZAGS_ZaklIzmAkt=60;
 _TypeObj_ZAGS_ZaklAddIN=61;
 _TypeObj_AddDokZAGS_Max=61;    // максимальный номер доп. док. ЗАГС

 _TypeObj_AktZAH=62;               // акты захоронений
 _TypeObj_Opeka=63;                // опека
 _TypeObj_DIzm=64;              // заявление о внесении изменений в з/а    ЗАГС

 // 65 .. 69 резерв
 _TypeObj_UZRogd=70;
 _TypeObj_UZSmert=71;
 _TypeObj_UZBrak=72;
 _TypeObj_UZRast=73;
 _TypeObj_UZUstOtc=74;
 _TypeObj_UZUstMat=75;
 _TypeObj_UZChName=76;
 _TypeObj_UZAdopt=77;

 _TypeObj_UZ_Max=80;   // !!! пока так  !!

 _TypeObj_Spr=100;
 _TypeObj_SprDocSubjG_=101;
 _TypeObj_QueryGIS=102;   // запрос в регистр персональных данных
 _TypeObj_RegDogN=103;    // регистрация договоров найма граждан
 _TypeObj_RegDogN2=104;   // регистрация договоров найма юр. лиц
 _TypeObj_AteEva=105;     // соответствие спр. улиц программы и классифокатора ЭВА

 ERR_REG_GIS='Нельзя запросить данные для зарегистрированной записи.';

 ETSP_NIITZI=1;
 ETSP_AVEST=2;
 ETSP_MAX=2;

implementation

initialization
  _WorkedThread_:=false;
  BeginDateDelo1:=0;    // даты выгрузки дела для ведомственного архива
  BeginDateDelo2:=0;

end.
