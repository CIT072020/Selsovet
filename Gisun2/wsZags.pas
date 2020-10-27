// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://agat-system.by:4569/gisun/zags/ws?WSDL
//  >Import : http://agat-system.by:4569/gisun/zags/ws?WSDL:0
//  >Import : http://agat-system.by:4569/gisun/zags/ws?WSDL:1
//  >Import : http://agat-system.by:4569/gisun/zags/ws?WSDL:2
// Encoding : UTF-8
// Version  : 1.0
// (26.11.2008 18:10:02 - - $Rev: 10138 $)
// ************************************************************************ //

unit wsZags;
interface
uses
   InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, OPConvert, wsGisun;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_ATTR = $0010;
  IS_TEXT = $0020;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:date            - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[Gbl]

  //-LangValue            = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  //-Classifier           = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  //-Document             = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  //-ActData              = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  //-Address              = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  //-Death                = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  //-decease_place        = class;                 { "http://gisun.agatsystem.by/common/types/"[Cplx] }
  //-Family               = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  //-PersonalData         = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  //-birth_place          = class;                 { "http://gisun.agatsystem.by/common/types/"[Cplx] }
  //-MessageCover         = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  //-PersonRequest        = class;                 { "http://gisun.agatsystem.by/common/ws/"[GblCplx] }
  //-IdentifRequest       = class;                 { "http://gisun.agatsystem.by/common/ws/"[GblCplx] }
  //-WsError              = class;                 { "http://gisun.agatsystem.by/common/ws/"[GblCplx] }
  WsReturnCode         = class;                 { "http://gisun.agatsystem.by/common/ws/"[Lit][GblCplx] }
  //-WsException          = class;                 { "http://gisun.agatsystem.by/common/ws/"[Flt][GblCplx] }
  //-ResponsePerson       = class;                 { "http://gisun.agatsystem.by/common/ws/"[GblCplx] }
  //-ResponseIdentif      = class;                 { "http://gisun.agatsystem.by/common/ws/"[GblCplx] }
  ActReason            = class;                 { "http://gisun.agatsystem.by/zags/types/"[GblCplx] }
  RegisterRequest      = class;                 { "http://gisun.agatsystem.by/zags/types/"[Lit][GblCplx] }
  RegisterResponse     = class;                 { "http://gisun.agatsystem.by/zags/types/"[Lit][GblCplx] }
  birth_act            = class;                 { "http://gisun.agatsystem.by/zags/types/"[Lit][GblElm] }
  birth_cert_data      = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }
  reconstructed_birth_act = class;              { "http://gisun.agatsystem.by/zags/types/"[Lit][GblElm] }
  rcn_birth_cert_data  = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }
  marriage_act         = class;                 { "http://gisun.agatsystem.by/zags/types/"[Lit][GblElm] }
  bride                = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }
  bridegroom           = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }
  divorce_act          = class;                 { "http://gisun.agatsystem.by/zags/types/"[Lit][GblElm] }
  wife                 = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }
  husband              = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }
  adoption_act         = class;                 { "http://gisun.agatsystem.by/zags/types/"[Lit][GblElm] }
  adp_cert_data        = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }
  adp_child            = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }
  before_adp_child     = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }
  after_adp_child      = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }
  marriage             = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }
  affiliation_act      = class;                 { "http://gisun.agatsystem.by/zags/types/"[Lit][GblElm] }
  aff_cert_data        = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }
  aff_person           = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }
  decease_act          = class;                 { "http://gisun.agatsystem.by/zags/types/"[Lit][GblElm] }
  dcs_cert_data        = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }
  name_change_act      = class;                 { "http://gisun.agatsystem.by/zags/types/"[Lit][GblElm] }
  person               = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }
  children             = class;                 { "http://gisun.agatsystem.by/zags/types/"[Alias] }
  exception            = class;                 { "http://gisun.agatsystem.by/zags/types/"[Flt][GblElm] }
  return_code          = class;                 { "http://gisun.agatsystem.by/zags/types/"[Lit][GblElm] }
  register_request     = class;                 { "http://gisun.agatsystem.by/zags/types/"[Lit][GblElm] }
  register_response    = class;                 { "http://gisun.agatsystem.by/zags/types/"[Lit][GblElm] }
  //-value                = class;                 { "http://gisun.agatsystem.by/common/types/"[Alias] }
  //-document2            = class;                 { "http://gisun.agatsystem.by/common/types/"[Alias] }
  //-address2             = class;                 { "http://gisun.agatsystem.by/common/types/"[Alias] }
  //-relationship         = class;                 { "http://gisun.agatsystem.by/common/types/"[Alias] }
  //-error                = class;                 { "http://gisun.agatsystem.by/common/ws/"[Alias] }
  RequestData          = class;                 { "http://gisun.agatsystem.by/zags/types/"[GblCplx] }
  ResponseData         = class;                 { "http://gisun.agatsystem.by/zags/types/"[GblCplx] }
  mrg_cert_data        = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }
  dvc_cert_data        = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }
  cng_cert_data        = class;                 { "http://gisun.agatsystem.by/zags/types/"[Cplx] }

  { "http://gisun.agatsystem.by/zags/types/"[GblSmpl] }
  ///Признак заключения брака
  MarrFlag = (
     ///Брак между усыновителями
     adoptiveParentsMarr,
     ///Брак между родителем и усыновителем
     parentAndAdoptiveMarr
  );

  { "http://gisun.agatsystem.by/zags/types/"[GblSmpl] }
  ///Записываются ли усыновители родителями ребёнка
  ParentsFlag = (
     ///Да
     yes,
     ///Нет
     no
  );

  // ************************************************************************ //
  // XML       : LangValue, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Значение, зависящее от языка (??? не совсем совпадает с интерфейсом)
  {-
  LangValue = class(TRemotable)
  private
    FText: WideString;
    ///Язык передаваемого значения
    Flang: WideString;
  published
    property Text: WideString  Index (IS_TEXT) read FText write FText;
    property lang: WideString  Index (IS_ATTR) read Flang write Flang;
  end;
  }

  ///Список значений, зависящее от языка (??? не одинаково описано)
  //-LangValueList = array of value;               { "http://gisun.agatsystem.by/common/types/"[GblCplx] }


  // ************************************************************************ //
  // XML       : Classifier, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Классификатор
  {-
  Classifier = class(TRemotable)
  private
    ///Кодовое значение
    Fcode: WideString;
    Fcode_Specified: boolean;
    ///Тип классификатора
    Ftype_: Integer;
    Ftype__Specified: boolean;
    ///Список лексем (??? что это такое)
    Flexema: LangValueList;
    Flexema_Specified: boolean;
    procedure Setcode(Index: Integer; const AWideString: WideString);
    function  code_Specified(Index: Integer): boolean;
    procedure Settype_(Index: Integer; const AInteger: Integer);
    function  type__Specified(Index: Integer): boolean;
    procedure Setlexema(Index: Integer; const ALangValueList: LangValueList);
    function  lexema_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property code:   WideString     Index (IS_OPTN) read Fcode write Setcode stored code_Specified;
    property type_:  Integer        Index (IS_OPTN) read Ftype_ write Settype_ stored type__Specified;
    property lexema: LangValueList  Index (IS_OPTN) read Flexema write Setlexema stored lexema_Specified;
  end;
  }


  // ************************************************************************ //
  // XML       : Document, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Документ, удостоверяющий личность
  {-
  Document = class(TRemotable)
  private
    ///Тип документа
    ///54100001 - ПАСПОРТ ГРАЖДАНИНА РБ
    ///54100005 - СВИДЕТЕЛЬСТВО О РОЖДЕНИИ
    ///54100006 - СВИДЕТЕЛЬСТВО О ЗАКЛЮЧЕНИИ БРАКА
    ///54100007 - СВИДЕТЕЛЬСТВО О РАСТОРЖЕНИИ БРАКА
    ///54100008 - СВИДЕТЕЛЬСТВО О ПЕРЕМЕНЕ ФАМИЛИИ/ИМЕНИ/ОТЧЕСТВА
    ///54100015 - ВИД НА ЖИТЕЛЬСТВО ЛИЦА БЕЗ ГРАЖДАНСТВА
    ///54100025 - СВИДЕТЕЛЬСТВО ОБ УСЫНОВЛЕНИИ (УДОЧЕРЕНИИ)
    ///54100029 - ВИД НА ЖИТЕЛЬСТВО ИНОСТРАННОГО ГРАЖДАНИНА
    ///54100030 - ПРОЕЗДНОЙ ДОКУМЕНТ
    Fdocument_type: Classifier;
    Fdocument_type_Specified: boolean;
    ///Гос. орган, выдавший документ
    Fauthority: Classifier;
    Fauthority_Specified: boolean;
    ///Дата выдачи документа
    Fdate_of_issue: TXSDate;
    Fdate_of_issue_Specified: boolean;
    ///Срок действия документа
    Fexpire_date: TXSDate;
    Fexpire_date_Specified: boolean;
    ///Серия документа
    Fseries: WideString;
    Fseries_Specified: boolean;
    ///Номер документа
    Fnumber: WideString;
    Fnumber_Specified: boolean;
    ///Информация по актовой записи
    Fact_data: ActData;
    Fact_data_Specified: boolean;
    procedure Setdocument_type(Index: Integer; const AClassifier: Classifier);
    function  document_type_Specified(Index: Integer): boolean;
    procedure Setauthority(Index: Integer; const AClassifier: Classifier);
    function  authority_Specified(Index: Integer): boolean;
    procedure Setdate_of_issue(Index: Integer; const ATXSDate: TXSDate);
    function  date_of_issue_Specified(Index: Integer): boolean;
    procedure Setexpire_date(Index: Integer; const ATXSDate: TXSDate);
    function  expire_date_Specified(Index: Integer): boolean;
    procedure Setseries(Index: Integer; const AWideString: WideString);
    function  series_Specified(Index: Integer): boolean;
    procedure Setnumber(Index: Integer; const AWideString: WideString);
    function  number_Specified(Index: Integer): boolean;
    procedure Setact_data(Index: Integer; const AActData: ActData);
    function  act_data_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property document_type: Classifier  Index (IS_OPTN) read Fdocument_type write Setdocument_type stored document_type_Specified;
    property authority:     Classifier  Index (IS_OPTN) read Fauthority write Setauthority stored authority_Specified;
    property date_of_issue: TXSDate     Index (IS_OPTN) read Fdate_of_issue write Setdate_of_issue stored date_of_issue_Specified;
    property expire_date:   TXSDate     Index (IS_OPTN) read Fexpire_date write Setexpire_date stored expire_date_Specified;
    property series:        WideString  Index (IS_OPTN) read Fseries write Setseries stored series_Specified;
    property number:        WideString  Index (IS_OPTN) read Fnumber write Setnumber stored number_Specified;
    property act_data:      ActData     Index (IS_OPTN) read Fact_data write Setact_data stored act_data_Specified;
  end;
  }



  // ************************************************************************ //
  // XML       : ActData, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Информация об актовой записи
  {-
  ActData = class(TRemotable)
  private
    ///Тип актовой записи
    Fact_type: Classifier;
    Fact_type_Specified: boolean;
    ///Гос. орган, осуществивший актовую запись (отдел ЗАГС)
    Fauthority: Classifier;
    Fauthority_Specified: boolean;
    ///Дата актовой записи
    Fdate: TXSDate;
    Fdate_Specified: boolean;
    ///Номер актовой записи
    Fnumber: WideString;
    Fnumber_Specified: boolean;
    procedure Setact_type(Index: Integer; const AClassifier: Classifier);
    function  act_type_Specified(Index: Integer): boolean;
    procedure Setauthority(Index: Integer; const AClassifier: Classifier);
    function  authority_Specified(Index: Integer): boolean;
    procedure Setdate(Index: Integer; const ATXSDate: TXSDate);
    function  date_Specified(Index: Integer): boolean;
    procedure Setnumber(Index: Integer; const AWideString: WideString);
    function  number_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property act_type:  Classifier  Index (IS_OPTN) read Fact_type write Setact_type stored act_type_Specified;
    property authority: Classifier  Index (IS_OPTN) read Fauthority write Setauthority stored authority_Specified;
    property date:      TXSDate     Index (IS_OPTN) read Fdate write Setdate stored date_Specified;
    property number:    WideString  Index (IS_OPTN) read Fnumber write Setnumber stored number_Specified;
  end;
  }

  ///Список документов
  //-DocumentList = array of document2;            { "http://gisun.agatsystem.by/common/types/"[GblCplx] }


  // ************************************************************************ //
  // XML       : Address, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Адрес
  {-
  Address = class(TRemotable)
  private
    ///Страна
    Fcountry: Classifier;
    Fcountry_Specified: boolean;
    ///Область
    Farea: Classifier;
    Farea_Specified: boolean;
    ///Район
    Fregion: Classifier;
    Fregion_Specified: boolean;
    ///Населенный пункт
    Flocality: Classifier;
    Flocality_Specified: boolean;
    ///Улица
    Fstreet: Classifier;
    Fstreet_Specified: boolean;
    ///Номер дома
    Fhouse: WideString;
    Fhouse_Specified: boolean;
    ///Корпус
    Fbuilding: WideString;
    Fbuilding_Specified: boolean;
    ///Квартира
    Fflat: WideString;
    Fflat_Specified: boolean;
    ///Дата регистрации
    Freg_date: TXSDate;
    Freg_date_Specified: boolean;
    procedure Setcountry(Index: Integer; const AClassifier: Classifier);
    function  country_Specified(Index: Integer): boolean;
    procedure Setarea(Index: Integer; const AClassifier: Classifier);
    function  area_Specified(Index: Integer): boolean;
    procedure Setregion(Index: Integer; const AClassifier: Classifier);
    function  region_Specified(Index: Integer): boolean;
    procedure Setlocality(Index: Integer; const AClassifier: Classifier);
    function  locality_Specified(Index: Integer): boolean;
    procedure Setstreet(Index: Integer; const AClassifier: Classifier);
    function  street_Specified(Index: Integer): boolean;
    procedure Sethouse(Index: Integer; const AWideString: WideString);
    function  house_Specified(Index: Integer): boolean;
    procedure Setbuilding(Index: Integer; const AWideString: WideString);
    function  building_Specified(Index: Integer): boolean;
    procedure Setflat(Index: Integer; const AWideString: WideString);
    function  flat_Specified(Index: Integer): boolean;
    procedure Setreg_date(Index: Integer; const ATXSDate: TXSDate);
    function  reg_date_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property country:  Classifier  Index (IS_OPTN) read Fcountry write Setcountry stored country_Specified;
    property area:     Classifier  Index (IS_OPTN) read Farea write Setarea stored area_Specified;
    property region:   Classifier  Index (IS_OPTN) read Fregion write Setregion stored region_Specified;
    property locality: Classifier  Index (IS_OPTN) read Flocality write Setlocality stored locality_Specified;
    property street:   Classifier  Index (IS_OPTN) read Fstreet write Setstreet stored street_Specified;
    property house:    WideString  Index (IS_OPTN) read Fhouse write Sethouse stored house_Specified;
    property building: WideString  Index (IS_OPTN) read Fbuilding write Setbuilding stored building_Specified;
    property flat:     WideString  Index (IS_OPTN) read Fflat write Setflat stored flat_Specified;
    property reg_date: TXSDate     Index (IS_OPTN) read Freg_date write Setreg_date stored reg_date_Specified;
  end;
  }

  ///Список адресов
  //-AddressList = array of address2;              { "http://gisun.agatsystem.by/common/types/"[GblCplx] }


  // ************************************************************************ //
  // XML       : Death, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Информация о смерти
  {-
  Death = class(TRemotable)
  private
    ///Причина смерти
    Fdeath_cause: Classifier;
    Fdeath_cause_Specified: boolean;
    ///Дата смерти
    Fdeath_date: WideString;
    Fdeath_date_Specified: boolean;
    ///Место смерти
    Fdecease_place: decease_place;
    Fdecease_place_Specified: boolean;
    ///Смерть последовала в
    Fdeath_place: WideString;
    Fdeath_place_Specified: boolean;
    ///Место захоронения
    Fburial_place: WideString;
    Fburial_place_Specified: boolean;
    procedure Setdeath_cause(Index: Integer; const AClassifier: Classifier);
    function  death_cause_Specified(Index: Integer): boolean;
    procedure Setdeath_date(Index: Integer; const AWideString: WideString);
    function  death_date_Specified(Index: Integer): boolean;
    procedure Setdecease_place(Index: Integer; const Adecease_place: decease_place);
    function  decease_place_Specified(Index: Integer): boolean;
    procedure Setdeath_place(Index: Integer; const AWideString: WideString);
    function  death_place_Specified(Index: Integer): boolean;
    procedure Setburial_place(Index: Integer; const AWideString: WideString);
    function  burial_place_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property death_cause:   Classifier     Index (IS_OPTN) read Fdeath_cause write Setdeath_cause stored death_cause_Specified;
    property death_date:    WideString     Index (IS_OPTN) read Fdeath_date write Setdeath_date stored death_date_Specified;
    property decease_place: decease_place  Index (IS_OPTN) read Fdecease_place write Setdecease_place stored decease_place_Specified;
    property death_place:   WideString     Index (IS_OPTN) read Fdeath_place write Setdeath_place stored death_place_Specified;
    property burial_place:  WideString     Index (IS_OPTN) read Fburial_place write Setburial_place stored burial_place_Specified;
  end;
  }


  // ************************************************************************ //
  // XML       : decease_place, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Место смерти
  {-
  decease_place = class(TRemotable)
  private
    ///Страна
    Fcountry_d: Classifier;
    Fcountry_d_Specified: boolean;
    ///Область
    Farea_d: WideString;
    Farea_d_Specified: boolean;
    ///Область
    Farea_d_bel: WideString;
    Farea_d_bel_Specified: boolean;
    ///Район
    Fregion_d: WideString;
    Fregion_d_Specified: boolean;
    ///Район
    Fregion_d_bel: WideString;
    Fregion_d_bel_Specified: boolean;
    ///Тип населённого пункта
    Ftype_city_d: Classifier;
    Ftype_city_d_Specified: boolean;
    ///Населённый пункт
    Fcity_d: WideString;
    Fcity_d_Specified: boolean;
    ///Населённый пункт
    Fcity_d_bel: WideString;
    Fcity_d_bel_Specified: boolean;
    procedure Setcountry_d(Index: Integer; const AClassifier: Classifier);
    function  country_d_Specified(Index: Integer): boolean;
    procedure Setarea_d(Index: Integer; const AWideString: WideString);
    function  area_d_Specified(Index: Integer): boolean;
    procedure Setarea_d_bel(Index: Integer; const AWideString: WideString);
    function  area_d_bel_Specified(Index: Integer): boolean;
    procedure Setregion_d(Index: Integer; const AWideString: WideString);
    function  region_d_Specified(Index: Integer): boolean;
    procedure Setregion_d_bel(Index: Integer; const AWideString: WideString);
    function  region_d_bel_Specified(Index: Integer): boolean;
    procedure Settype_city_d(Index: Integer; const AClassifier: Classifier);
    function  type_city_d_Specified(Index: Integer): boolean;
    procedure Setcity_d(Index: Integer; const AWideString: WideString);
    function  city_d_Specified(Index: Integer): boolean;
    procedure Setcity_d_bel(Index: Integer; const AWideString: WideString);
    function  city_d_bel_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property country_d:    Classifier  Index (IS_OPTN) read Fcountry_d write Setcountry_d stored country_d_Specified;
    property area_d:       WideString  Index (IS_OPTN) read Farea_d write Setarea_d stored area_d_Specified;
    property area_d_bel:   WideString  Index (IS_OPTN) read Farea_d_bel write Setarea_d_bel stored area_d_bel_Specified;
    property region_d:     WideString  Index (IS_OPTN) read Fregion_d write Setregion_d stored region_d_Specified;
    property region_d_bel: WideString  Index (IS_OPTN) read Fregion_d_bel write Setregion_d_bel stored region_d_bel_Specified;
    property type_city_d:  Classifier  Index (IS_OPTN) read Ftype_city_d write Settype_city_d stored type_city_d_Specified;
    property city_d:       WideString  Index (IS_OPTN) read Fcity_d write Setcity_d stored city_d_Specified;
    property city_d_bel:   WideString  Index (IS_OPTN) read Fcity_d_bel write Setcity_d_bel stored city_d_bel_Specified;
  end;
  }

  ///Персональный идентификационный номер
  //-PersonalId      =  type WideString;      { "http://gisun.agatsystem.by/common/types/"[GblSmpl] }


  // ************************************************************************ //
  // XML       : Family, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Информация о родственных связях
  {-
  Family = class(TRemotable)
  private
    ///Тип семейных связей
    Frelationship: Classifier;
    Frelationship_Specified: boolean;
    ///Владелец связи
    Fis_owner: Boolean;
    Fis_owner_Specified: boolean;
    ///Связь с лицом
    Frel_id: PersonalId;
    Frel_id_Specified: boolean;
    ///Дата определения связи
    Fbegin_date: TXSDateTime;
    Fbegin_date_Specified: boolean;
    ///Дата расторжения связи
    Fend_date: TXSDateTime;
    Fend_date_Specified: boolean;
    procedure Setrelationship(Index: Integer; const AClassifier: Classifier);
    function  relationship_Specified(Index: Integer): boolean;
    procedure Setis_owner(Index: Integer; const ABoolean: Boolean);
    function  is_owner_Specified(Index: Integer): boolean;
    procedure Setrel_id(Index: Integer; const APersonalId: PersonalId);
    function  rel_id_Specified(Index: Integer): boolean;
    procedure Setbegin_date(Index: Integer; const ATXSDateTime: TXSDateTime);
    function  begin_date_Specified(Index: Integer): boolean;
    procedure Setend_date(Index: Integer; const ATXSDateTime: TXSDateTime);
    function  end_date_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property relationship: Classifier   Index (IS_OPTN) read Frelationship write Setrelationship stored relationship_Specified;
    property is_owner:     Boolean      Index (IS_OPTN) read Fis_owner write Setis_owner stored is_owner_Specified;
    property rel_id:       PersonalId   Index (IS_OPTN) read Frel_id write Setrel_id stored rel_id_Specified;
    property begin_date:   TXSDateTime  Index (IS_OPTN) read Fbegin_date write Setbegin_date stored begin_date_Specified;
    property end_date:     TXSDateTime  Index (IS_OPTN) read Fend_date write Setend_date stored end_date_Specified;
  end;
  }

  ///Список семейных связей (??? не одинаково описаны списки)
  //-FamilyList = array of relationship;           { "http://gisun.agatsystem.by/common/types/"[GblCplx] }


  // ************************************************************************ //
  // XML       : PersonalData, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Персональные данные
  {-
  PersonalData = class(TRemotable)
  private
    ///Персональный номер
    Fidentif: PersonalId;
    Fidentif_Specified: boolean;
    ///Фамилия
    Flast_name: WideString;
    Flast_name_Specified: boolean;
    ///Фамилия белорусская
    Flast_name_bel: WideString;
    Flast_name_bel_Specified: boolean;
    ///Фамилия латинская (???)
    Flast_name_lat: WideString;
    Flast_name_lat_Specified: boolean;
    ///Имя
    Fname_: WideString;
    Fname__Specified: boolean;
    ///Имя белорусское
    Fname_bel: WideString;
    Fname_bel_Specified: boolean;
    ///Имя латинское
    Fname_lat: WideString;
    Fname_lat_Specified: boolean;
    ///Отчество
    Fpatronymic: WideString;
    Fpatronymic_Specified: boolean;
    ///Отчество белорусское
    Fpatronymic_bel: WideString;
    Fpatronymic_bel_Specified: boolean;
    ///Отчество латинское
    Fpatronymic_lat: WideString;
    Fpatronymic_lat_Specified: boolean;
    ///Пол
    ///F - ЖЕНСКИЙ
    ///M - МУЖСКОЙ
    Fsex: Classifier;
    Fsex_Specified: boolean;
    ///Дата рождения
    Fbirth_day: WideString;
    Fbirth_day_Specified: boolean;
    ///Место рождения
    Fbirth_place: birth_place;
    Fbirth_place_Specified: boolean;
    ///Гражданство
    Fcitizenship: Classifier;
    Fcitizenship_Specified: boolean;
    ///Статус лица
    ///1 - АКТИВЕН
    ///2 - УМЕР
    ///3 - ИСКЛЮЧЕН
    ///4 - ИНОСТРАНЕЦ
    ///5 - ФИКТИВНЫЙ
    Fstatus: Classifier;
    Fstatus_Specified: boolean;
    ///(??? комментарий)
    Faddresses: AddressList;
    Faddresses_Specified: boolean;
    ///(??? комментарий)
    Fdocuments: DocumentList;
    Fdocuments_Specified: boolean;
    ///(??? комментарий)
    Ffamily: FamilyList;
    Ffamily_Specified: boolean;
    procedure Setidentif(Index: Integer; const APersonalId: PersonalId);
    function  identif_Specified(Index: Integer): boolean;
    procedure Setlast_name(Index: Integer; const AWideString: WideString);
    function  last_name_Specified(Index: Integer): boolean;
    procedure Setlast_name_bel(Index: Integer; const AWideString: WideString);
    function  last_name_bel_Specified(Index: Integer): boolean;
    procedure Setlast_name_lat(Index: Integer; const AWideString: WideString);
    function  last_name_lat_Specified(Index: Integer): boolean;
    procedure Setname_(Index: Integer; const AWideString: WideString);
    function  name__Specified(Index: Integer): boolean;
    procedure Setname_bel(Index: Integer; const AWideString: WideString);
    function  name_bel_Specified(Index: Integer): boolean;
    procedure Setname_lat(Index: Integer; const AWideString: WideString);
    function  name_lat_Specified(Index: Integer): boolean;
    procedure Setpatronymic(Index: Integer; const AWideString: WideString);
    function  patronymic_Specified(Index: Integer): boolean;
    procedure Setpatronymic_bel(Index: Integer; const AWideString: WideString);
    function  patronymic_bel_Specified(Index: Integer): boolean;
    procedure Setpatronymic_lat(Index: Integer; const AWideString: WideString);
    function  patronymic_lat_Specified(Index: Integer): boolean;
    procedure Setsex(Index: Integer; const AClassifier: Classifier);
    function  sex_Specified(Index: Integer): boolean;
    procedure Setbirth_day(Index: Integer; const AWideString: WideString);
    function  birth_day_Specified(Index: Integer): boolean;
    procedure Setbirth_place(Index: Integer; const Abirth_place: birth_place);
    function  birth_place_Specified(Index: Integer): boolean;
    procedure Setcitizenship(Index: Integer; const AClassifier: Classifier);
    function  citizenship_Specified(Index: Integer): boolean;
    procedure Setstatus(Index: Integer; const AClassifier: Classifier);
    function  status_Specified(Index: Integer): boolean;
    procedure Setaddresses(Index: Integer; const AAddressList: AddressList);
    function  addresses_Specified(Index: Integer): boolean;
    procedure Setdocuments(Index: Integer; const ADocumentList: DocumentList);
    function  documents_Specified(Index: Integer): boolean;
    procedure Setfamily(Index: Integer; const AFamilyList: FamilyList);
    function  family_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property identif:        PersonalId    Index (IS_OPTN) read Fidentif write Setidentif stored identif_Specified;
    property last_name:      WideString    Index (IS_OPTN) read Flast_name write Setlast_name stored last_name_Specified;
    property last_name_bel:  WideString    Index (IS_OPTN) read Flast_name_bel write Setlast_name_bel stored last_name_bel_Specified;
    property last_name_lat:  WideString    Index (IS_OPTN) read Flast_name_lat write Setlast_name_lat stored last_name_lat_Specified;
    property name_:          WideString    Index (IS_OPTN) read Fname_ write Setname_ stored name__Specified;
    property name_bel:       WideString    Index (IS_OPTN) read Fname_bel write Setname_bel stored name_bel_Specified;
    property name_lat:       WideString    Index (IS_OPTN) read Fname_lat write Setname_lat stored name_lat_Specified;
    property patronymic:     WideString    Index (IS_OPTN) read Fpatronymic write Setpatronymic stored patronymic_Specified;
    property patronymic_bel: WideString    Index (IS_OPTN) read Fpatronymic_bel write Setpatronymic_bel stored patronymic_bel_Specified;
    property patronymic_lat: WideString    Index (IS_OPTN) read Fpatronymic_lat write Setpatronymic_lat stored patronymic_lat_Specified;
    property sex:            Classifier    Index (IS_OPTN) read Fsex write Setsex stored sex_Specified;
    property birth_day:      WideString    Index (IS_OPTN) read Fbirth_day write Setbirth_day stored birth_day_Specified;
    property birth_place:    birth_place   Index (IS_OPTN) read Fbirth_place write Setbirth_place stored birth_place_Specified;
    property citizenship:    Classifier    Index (IS_OPTN) read Fcitizenship write Setcitizenship stored citizenship_Specified;
    property status:         Classifier    Index (IS_OPTN) read Fstatus write Setstatus stored status_Specified;
    property addresses:      AddressList   Index (IS_OPTN) read Faddresses write Setaddresses stored addresses_Specified;
    property documents:      DocumentList  Index (IS_OPTN) read Fdocuments write Setdocuments stored documents_Specified;
    property family:         FamilyList    Index (IS_OPTN) read Ffamily write Setfamily stored family_Specified;
  end;
  }


  // ************************************************************************ //
  // XML       : birth_place, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Место рождения (??? в описании не выделено отдельным типом)
  {-
  birth_place = class(TRemotable)
  private
    ///Страна рождения
    Fcountry_b: Classifier;
    Fcountry_b_Specified: boolean;
    ///Область рождения
    Farea_b: WideString;
    Farea_b_Specified: boolean;
    ///Область рождения (??? комментарий)
    Farea_b_bel: WideString;
    Farea_b_bel_Specified: boolean;
    ///Район рождения
    Fregion_b: WideString;
    Fregion_b_Specified: boolean;
    ///Район рождения  (??? комментарий)
    Fregion_b_bel: WideString;
    Fregion_b_bel_Specified: boolean;
    ///Тип населённого пункта рождения
    ///111 - Столица Республики Беларусь
    ///112 - Город областного подчинения-АТЕ
    ///113 - Город районного подчинения-АТЕ
    ///121 - Поселок городского типа - городской поселок-АТЕ
    ///122 - Поселок городского типа - курортный поселок-АТЕ
    ///123 - Поселок городского типа - рабочий поселок-АТЕ
    ///213 - Город районного подчинения-ТЕ
    ///221 - Поселок городского типа - городской поселок-ТЕ
    ///222 - Поселок городского типа - курортный поселок-ТЕ
    ///223 - Поселок городского типа - рабочий поселок-ТЕ
    ///231 - Сельский населенный пункт - деревня
    ///232 - Сельский населенный пункт - поселок
    ///233 - Сельский населенный пункт - село
    ///234 - Сельский населенный пункт - хутор
    Ftype_city_b: Classifier;
    Ftype_city_b_Specified: boolean;
    ///Населённый пункт рождения
    Fcity_b: WideString;
    Fcity_b_Specified: boolean;
    ///Населённый пункт рождения (??? комментарий)
    Fcity_b_bel: WideString;
    Fcity_b_bel_Specified: boolean;
    procedure Setcountry_b(Index: Integer; const AClassifier: Classifier);
    function  country_b_Specified(Index: Integer): boolean;
    procedure Setarea_b(Index: Integer; const AWideString: WideString);
    function  area_b_Specified(Index: Integer): boolean;
    procedure Setarea_b_bel(Index: Integer; const AWideString: WideString);
    function  area_b_bel_Specified(Index: Integer): boolean;
    procedure Setregion_b(Index: Integer; const AWideString: WideString);
    function  region_b_Specified(Index: Integer): boolean;
    procedure Setregion_b_bel(Index: Integer; const AWideString: WideString);
    function  region_b_bel_Specified(Index: Integer): boolean;
    procedure Settype_city_b(Index: Integer; const AClassifier: Classifier);
    function  type_city_b_Specified(Index: Integer): boolean;
    procedure Setcity_b(Index: Integer; const AWideString: WideString);
    function  city_b_Specified(Index: Integer): boolean;
    procedure Setcity_b_bel(Index: Integer; const AWideString: WideString);
    function  city_b_bel_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property country_b:    Classifier  Index (IS_OPTN) read Fcountry_b write Setcountry_b stored country_b_Specified;
    property area_b:       WideString  Index (IS_OPTN) read Farea_b write Setarea_b stored area_b_Specified;
    property area_b_bel:   WideString  Index (IS_OPTN) read Farea_b_bel write Setarea_b_bel stored area_b_bel_Specified;
    property region_b:     WideString  Index (IS_OPTN) read Fregion_b write Setregion_b stored region_b_Specified;
    property region_b_bel: WideString  Index (IS_OPTN) read Fregion_b_bel write Setregion_b_bel stored region_b_bel_Specified;
    property type_city_b:  Classifier  Index (IS_OPTN) read Ftype_city_b write Settype_city_b stored type_city_b_Specified;
    property city_b:       WideString  Index (IS_OPTN) read Fcity_b write Setcity_b stored city_b_Specified;
    property city_b_bel:   WideString  Index (IS_OPTN) read Fcity_b_bel write Setcity_b_bel stored city_b_bel_Specified;
  end;
  }

  ///Представление GUID
  //-GUID            =  type WideString;      { "http://gisun.agatsystem.by/common/types/"[GblSmpl] }
  ///Внутренний идентификатор
  //-Id              =  type GUID;      { "http://gisun.agatsystem.by/common/types/"[GblSmpl] }

  // ************************************************************************ //
  // XML       : MessageCover, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Сопроводительная информация к сообщению
  {-
  MessageCover = class(TRemotable)
  private
    ///Идентификатор сообщения
    Fmessage_id: Id;
    ///Тип сообщения (??? зачем ведущие нули)
    ///0001 - запрос данных из ГИС РН
    ///0002 - результат запроса в  ГИС РН
    ///0003 - квитанция об успешном получений данных ГИС РН
    ///0004 - сообщение об ошибке
    ///0100 - регистрация рождения
    ///0200 - установление отцовства
    ///0300 - регистрация брака
    ///0400 - регистрация смерти
    ///0500 - расторжение брака
    ///0600 - усыновление
    ///0700 - перемена фамилии
    Fmessage_type: Classifier;
    ///Время отправки сообщения
    Fmessage_time: TXSDateTime;
    ///Источник сообщения
    ///17608125 - ВЕСЕЛОВСКИЙ С/С
    ///17608133 - ЛОШНИЦКИЙ С/С
    ///17608150 - ИЛЬЯНСКИЙ С/С
    ///17608155 - ОЛЬКОВИЧСКИЙ С/С
    ///17608189 - ФАНИПОЛЬСКИЙ С/С
    ///17608201 - СИНЯВСКИЙ С/С
    ///17608202 - ТУЧАНСКИЙ С/С
    ///17608214 - ПОТЕЙКОВСКИЙ С/С
    ///17608223 - КРУПСКИЙ С/С
    ///17608228 - УХВАЛЬСКИЙ С/С
    ///17608256 - СОСНОВСКИЙ С/С
    ///17608274 - САМОХВАЛОВИЧСКИЙ С/С
    ///17608276 - ХАТЕЖИНСКИЙ С/С
    ///17608289 - ОЛЕХНОВИЧСКИЙ С/С
    ///17608311 - ГОРОДЕЙСКИЙ С/С
    ///17608322 - СЕЙЛОВИЧСКИЙ С/С
    ///17608335 - МАРЬИНОГОРСКИЙ С/С
    ///17608351 - ВЕСЕЙСКИЙ С/С
    ///17608358 - ЛЕНИНСКИЙ С/С
    ///17608368 - ЗАБОЛОТСКИЙ С/С
    ///17608380 - ЮРЬЕВСКИЙ С/С
    ///17608389 - ОКТЯБРЬСКИЙ  С/С
    ///17608390 - ПЕРВОМАЙСКИЙ  С/С
    ///17608395 - ЧИЖЕВИЧСКИЙ С/С
    ///17608396 - ЯСКОВИЧСКИЙ С/С
    ///17608401 - ДРАЖНОВСКИЙ С/С
    ///17608403 - СТАРОДОРОЖСКИЙ С/С
    ///17608423 - ОЗЕРСКИЙ С/С
    ///17608430 - ЛЯДЕНСКИЙ С/С
    ///17608436 - КОЛОДЕЖСКИЙ С/С
    ///17608610 - РЕЧИЦКИЙ С/С
    ///17608656 - БАРАНОВИЧСКИЙ С/С
    ///17608774 - НОВОДВОРСКИЙ С/С
    Fmessage_source: Classifier;
    ///Идентификатор сообщения, для которого текущее является ответом
    Fparent_message_id: Id;
    Fparent_message_id_Specified: boolean;
    procedure Setparent_message_id(Index: Integer; const AId: Id);
    function  parent_message_id_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property message_id:        Id           read Fmessage_id write Fmessage_id;
    property message_type:      Classifier   read Fmessage_type write Fmessage_type;
    property message_time:      TXSDateTime  read Fmessage_time write Fmessage_time;
    property message_source:    Classifier   read Fmessage_source write Fmessage_source;
    property parent_message_id: Id           Index (IS_OPTN) read Fparent_message_id write Setparent_message_id stored parent_message_id_Specified;
  end;
  }


  // ************************************************************************ //
  // XML       : PersonRequest, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  ///Запрс на получение персональных данных
  {-
  PersonRequest = class(TRemotable)
  private
    ///Идентификатор запроса
    Frequest_id: Id;
    ///Идентификационный номер
    Fidentif_number: PersonalId;
    ///Данные паспорта
    Fdocument: Document;
  public
    destructor Destroy; override;
  published
    property request_id:     Id          read Frequest_id write Frequest_id;
    property identif_number: PersonalId  read Fidentif_number write Fidentif_number;
    property document:       Document    read Fdocument write Fdocument;
  end;
  }


  // ************************************************************************ //
  // XML       : IdentifRequest, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  ///Запрос на получение идентификационного номера
  {-
  IdentifRequest = class(TRemotable)
  private
    ///Идентификатор запроса
    Frequest_id: Id;
    ///Пол
    ///F - ЖЕНСКИЙ
    ///M - МУЖСКОЙ
    Fsex: Classifier;
    ///Дата рождения
    Fbirth_day: WideString;
  public
    destructor Destroy; override;
  published
    property request_id: Id          read Frequest_id write Frequest_id;
    property sex:        Classifier  read Fsex write Fsex;
    property birth_day:  WideString  read Fbirth_day write Fbirth_day;
  end;
  }


  // ************************************************************************ //
  // XML       : WsError, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  ///Информация об ошибке
  {-
  WsError = class(TRemotable)
  private
    ///Тип ошибки
    ///регламент:
    ///00 - обработка завершена успешно
    ///04 - обнаружена ошибка при проверке данных
    ///08 - обнаружена повторная попытка получить ИН, для человека уже имеющего ИН
    ///12 - ошибка электронной подписи
    ///16 - не найдено данных  по запрашиваемому субъекту
    ///(??? какие коды ошибок реальные)
    ///01 - Неизвестная ошибка
    ///02 - Ошибка проверки данных
    ///03 - Неверный формат даты
    ///04 - Значение классификатора не найдено
    ///05 - Данные по лицу не найдены
    Ferror_code: Classifier;
    ///Место возникновения ошибки
    ///регламент: место возникновения ошибки (ошибочный атрибут, реквизит(поле)
    Ferror_place: WideString;
    Ferror_place_Specified: boolean;
    ///Неправильное значение
    ///регламент: значение поля(реквизита), содержащее ошибку
    Fwrong_value: WideString;
    Fwrong_value_Specified: boolean;
    ///Правильное значение
    ///регламент: ожидаемое значение
    Fcorrect_value: WideString;
    Fcorrect_value_Specified: boolean;
    ///Название проверяемого элемента
    Fcheck_name: WideString;
    Fcheck_name_Specified: boolean;
    procedure Seterror_place(Index: Integer; const AWideString: WideString);
    function  error_place_Specified(Index: Integer): boolean;
    procedure Setwrong_value(Index: Integer; const AWideString: WideString);
    function  wrong_value_Specified(Index: Integer): boolean;
    procedure Setcorrect_value(Index: Integer; const AWideString: WideString);
    function  correct_value_Specified(Index: Integer): boolean;
    procedure Setcheck_name(Index: Integer; const AWideString: WideString);
    function  check_name_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property error_code:    Classifier  read Ferror_code write Ferror_code;
    property error_place:   WideString  Index (IS_OPTN) read Ferror_place write Seterror_place stored error_place_Specified;
    property wrong_value:   WideString  Index (IS_OPTN) read Fwrong_value write Setwrong_value stored wrong_value_Specified;
    property correct_value: WideString  Index (IS_OPTN) read Fcorrect_value write Setcorrect_value stored correct_value_Specified;
    property check_name:    WideString  Index (IS_OPTN) read Fcheck_name write Setcheck_name stored check_name_Specified;
  end;
  }

  ///Сведения об ошибках (??? не одинаково описание списков)
  //-ErrorList  = array of error;                  { "http://gisun.agatsystem.by/common/ws/"[GblCplx] }


  // ************************************************************************ //
  // XML       : WsReturnCode, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  ///Возвращаемые веб-сервисом данные
  WsReturnCode = class(TRemotable)
  private
    ///Системная информация
    Fcover: MessageCover;
    ///Сведения об ошибках
    Ferror_list: ErrorList;
    Ferror_list_Specified: boolean;
    procedure Seterror_list(Index: Integer; const AErrorList: ErrorList);
    function  error_list_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property cover:      MessageCover  read Fcover write Fcover;
    property error_list: ErrorList     Index (IS_OPTN) read Ferror_list write Seterror_list stored error_list_Specified;
  end;



  // ************************************************************************ //
  // XML       : WsException, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // Info      : Fault
  // ************************************************************************ //
  ///Ошибка, возвращаемая сервисом
  {-
  WsException = class(ERemotableException)
  private
    ///Системная информация
    Fcover: MessageCover;
    ///Сведения об ошибках
    Ferror_list: ErrorList;
    Ferror_list_Specified: boolean;
    procedure Seterror_list(Index: Integer; const AErrorList: ErrorList);
    function  error_list_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property cover:      MessageCover  read Fcover write Fcover;
    property error_list: ErrorList     Index (IS_OPTN) read Ferror_list write Seterror_list stored error_list_Specified;
  end;
  }


  // ************************************************************************ //
  // XML       : ResponsePerson, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  ///Персональные данные человека
  {-
  ResponsePerson = class(TRemotable)
  private
    ///Идентификатор запроса
    Frequest_id: Id;
    ///Персональные данные
    Fdata: PersonalData;
  public
    destructor Destroy; override;
  published
    property request_id: Id            read Frequest_id write Frequest_id;
    property data:       PersonalData  read Fdata write Fdata;
  end;
  }


  // ************************************************************************ //
  // XML       : ResponseIdentif, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  ///Сгенерированный идентификационный номер
  {-
  ResponseIdentif = class(TRemotable)
  private
    ///Идентификатор запроса
    Frequest_id: Id;
    ///Сгенерированный персональный номер
    Fdata: PersonalId;
  published
    property request_id: Id          read Frequest_id write Frequest_id;
    property data:       PersonalId  read Fdata write Fdata;
  end;
  }

  ///Список детей
  ChildList  = array of children;               { "http://gisun.agatsystem.by/zags/types/"[GblCplx] }


  // ************************************************************************ //
  // XML       : ActReason, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Основание записи акта
  ActReason = class(TRemotable)
  private
    ///Наименование суда
    Fcourt_name: WideString;
    Fcourt_name_Specified: boolean;
    ///Дата судебного решения
    Fcourt_decision_date: WideString;
    Fcourt_decision_date_Specified: boolean;
    ///Комментарий к основанию записи акта
    Fcomment: WideString;
    Fcomment_Specified: boolean;
    procedure Setcourt_name(Index: Integer; const AWideString: WideString);
    function  court_name_Specified(Index: Integer): boolean;
    procedure Setcourt_decision_date(Index: Integer; const AWideString: WideString);
    function  court_decision_date_Specified(Index: Integer): boolean;
    procedure Setcomment(Index: Integer; const AWideString: WideString);
    function  comment_Specified(Index: Integer): boolean;
  published
    property court_name:          WideString  Index (IS_OPTN) read Fcourt_name write Setcourt_name stored court_name_Specified;
    property court_decision_date: WideString  Index (IS_OPTN) read Fcourt_decision_date write Setcourt_decision_date stored court_decision_date_Specified;
    property comment:             WideString  Index (IS_OPTN) read Fcomment write Setcomment stored comment_Specified;
  end;



  // ************************************************************************ //
  // XML       : RegisterRequest, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  RegisterRequest = class(TRemotable)
  private
    ///Заголовок запроса
    Fcover: MessageCover;
    ///Тело запроса
    Frequest: RequestData;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property cover:   MessageCover  read Fcover write Fcover;
    property request: RequestData   read Frequest write Frequest;
  end;


  // ************************************************************************ //
  // XML       : RegisterResponse, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  RegisterResponse = class(TRemotable)
  private
    ///Заголовок ответа
    Fcover: MessageCover;
    ///Ответ на запрос
    Fresponse: ResponseData;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property cover:    MessageCover  read Fcover write Fcover;
    property response: ResponseData  read Fresponse write Fresponse;
  end;


  // ************************************************************************ //
  // XML       : birth_act, global, <element>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  ///Запись акта о рождении
  birth_act = class(TRemotable)
  private
    ///Системная информация
    Fcover: MessageCover;
    ///Акт о рождении
    Fbirth_cert_data: birth_cert_data;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property cover:           MessageCover     read Fcover write Fcover;
    property birth_cert_data: birth_cert_data  read Fbirth_cert_data write Fbirth_cert_data;
  end;



  // ************************************************************************ //
  // XML       : birth_cert_data, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  birth_cert_data = class(TRemotable)
  private
    ///Персональные данные ребёнка
    Fchild_data: PersonalData;
    ///Персональные данные матери
    Fmother_data: PersonalData;
    ///Персональные данные отца
    Ffather_data: PersonalData;
    ///Основание записи сведений об отце (свидетельство о заключении брака)
    Fmarriage_cert: ActData;
    Fmarriage_cert_Specified: boolean;
    ///Информация об актовой записи
    Fbirth_act_data: ActData;
    ///Информация о печатном документе
    Fbirth_certificate_data: Document;
    procedure Setmarriage_cert(Index: Integer; const AActData: ActData);
    function  marriage_cert_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property child_data:             PersonalData  read Fchild_data write Fchild_data;
    property mother_data:            PersonalData  read Fmother_data write Fmother_data;
    property father_data:            PersonalData  read Ffather_data write Ffather_data;
    property marriage_cert:          ActData       Index (IS_OPTN) read Fmarriage_cert write Setmarriage_cert stored marriage_cert_Specified;
    property birth_act_data:         ActData       read Fbirth_act_data write Fbirth_act_data;
    property birth_certificate_data: Document      read Fbirth_certificate_data write Fbirth_certificate_data;
  end;



  // ************************************************************************ //
  // XML       : reconstructed_birth_act, global, <element>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  ///Восстановленная запись акта о рождении
  reconstructed_birth_act = class(TRemotable)
  private
    ///Системная информация
    Fcover: MessageCover;
    ///Восстановленный акт о рождении
    Frcn_birth_cert_data: rcn_birth_cert_data;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property cover:               MessageCover         read Fcover write Fcover;
    property rcn_birth_cert_data: rcn_birth_cert_data  read Frcn_birth_cert_data write Frcn_birth_cert_data;
  end;



  // ************************************************************************ //
  // XML       : rcn_birth_cert_data, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Восстановленный акт о рождении
  rcn_birth_cert_data = class(TRemotable)
  private
    ///Персональные данные ребёнка
    Fchild_data: PersonalData;
    ///Персональные данные матери
    Fmother_data: PersonalData;
    ///Персональные данные отца
    Ffather_data: PersonalData;
    ///Основание восстановление записи - решение суда
    Fcourt_decision: ActReason;
    ///Информация об актовой записи
    Frcn_birth_act_data: ActData;
    ///Информация о печатном документе
    Frcn_birth_certificate_data: Document;
  public
    destructor Destroy; override;
  published
    property child_data:                 PersonalData  read Fchild_data write Fchild_data;
    property mother_data:                PersonalData  read Fmother_data write Fmother_data;
    property father_data:                PersonalData  read Ffather_data write Ffather_data;
    property court_decision:             ActReason     read Fcourt_decision write Fcourt_decision;
    property rcn_birth_act_data:         ActData       read Frcn_birth_act_data write Frcn_birth_act_data;
    property rcn_birth_certificate_data: Document      read Frcn_birth_certificate_data write Frcn_birth_certificate_data;
  end;



  // ************************************************************************ //
  // XML       : marriage_act, global, <element>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  ///Запись акта о заключении брака
  marriage_act = class(TRemotable)
  private
    ///Системная информация
    Fcover: MessageCover;
    ///Акт о заключении брака
    Fmrg_cert_data: mrg_cert_data;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property cover:         MessageCover   read Fcover write Fcover;
    property mrg_cert_data: mrg_cert_data  read Fmrg_cert_data write Fmrg_cert_data;
  end;



  // ************************************************************************ //
  // XML       : bride, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Информация о невесте
  bride = class(TRemotable)
  private
    ///Персональные данные невесты
    Fbride_data: PersonalData;
    ///Фамилия до заключения брака
    Fold_last_name: WideString;
  public
    destructor Destroy; override;
  published
    property bride_data:    PersonalData  read Fbride_data write Fbride_data;
    property old_last_name: WideString    read Fold_last_name write Fold_last_name;
  end;



  // ************************************************************************ //
  // XML       : bridegroom, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Информация о женихе
  bridegroom = class(TRemotable)
  private
    ///Персональные данные жениха
    Fbridegroom_data: PersonalData;
    ///Фамилия до заключения брака
    Fold_last_name: WideString;
  public
    destructor Destroy; override;
  published
    property bridegroom_data: PersonalData  read Fbridegroom_data write Fbridegroom_data;
    property old_last_name:   WideString    read Fold_last_name write Fold_last_name;
  end;


  // ************************************************************************ //
  // XML       : divorce_act, global, <element>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  ///Запись акта о расторжении брака
  divorce_act = class(TRemotable)
  private
    ///Системная информация
    Fcover: MessageCover;
    ///Акт о расторжении брака
    Fdvc_cert_data: dvc_cert_data;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property cover:         MessageCover   read Fcover write Fcover;
    property dvc_cert_data: dvc_cert_data  read Fdvc_cert_data write Fdvc_cert_data;
  end;



  // ************************************************************************ //
  // XML       : wife, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Информация о жене
  wife = class(TRemotable)
  private
    ///Персональные данные жены
    Fwife_data: PersonalData;
    ///Фамилия до расторжения брака
    Fold_last_name: WideString;
  public
    destructor Destroy; override;
  published
    property wife_data:     PersonalData  read Fwife_data write Fwife_data;
    property old_last_name: WideString    read Fold_last_name write Fold_last_name;
  end;



  // ************************************************************************ //
  // XML       : husband, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Информация о муже
  husband = class(TRemotable)
  private
    ///Персональные данные мужа
    Fhusband_data: PersonalData;
    ///Фамилия до расторжения брака
    Fold_last_name: WideString;
  public
    destructor Destroy; override;
  published
    property husband_data:  PersonalData  read Fhusband_data write Fhusband_data;
    property old_last_name: WideString    read Fold_last_name write Fold_last_name;
  end;



  // ************************************************************************ //
  // XML       : adoption_act, global, <element>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  ///Запись акта об усыновлении (удочерении)
  adoption_act = class(TRemotable)
  private
    ///Системная информация
    Fcover: MessageCover;
    ///Акт об усыновлении (удочерении)
    Fadp_cert_data: adp_cert_data;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property cover:         MessageCover   read Fcover write Fcover;
    property adp_cert_data: adp_cert_data  read Fadp_cert_data write Fadp_cert_data;
  end;



  // ************************************************************************ //
  // XML       : adp_cert_data, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Акт об усыновлении (удочерении)
  adp_cert_data = class(TRemotable)
  private
    ///Сведения об усыновляемом (??? нет комментария)
    Fadp_child: adp_child;
    ///Персональные данные матери
    Fmother_data: PersonalData;
    ///Персональные данные отца
    Ffather_data: PersonalData;
    ///Персональные данные усыновительницы
    Fadp_mother_data: PersonalData;
    Fadp_mother_data_Specified: boolean;
    ///Персональные данные усыновителя
    Fadp_father_data: PersonalData;
    Fadp_father_data_Specified: boolean;
    ///Сведения о регистрации заключения брака
    Fmarriage: marriage;
    Fmarriage_Specified: boolean;
    ///Основание записи акта об усыновлении (удочерении) - решение суда
    Fcourt_decision: ActReason;
    ///Записываются ли усыновители родителями ребёнка
    Fparents_flag: ParentsFlag;
    ///Информация об актовой записи
    Fadp_act_data: ActData;
    ///Информация о печатном документе
    Fadp_certificate_data: Document;
    procedure Setadp_mother_data(Index: Integer; const APersonalData: PersonalData);
    function  adp_mother_data_Specified(Index: Integer): boolean;
    procedure Setadp_father_data(Index: Integer; const APersonalData: PersonalData);
    function  adp_father_data_Specified(Index: Integer): boolean;
    procedure Setmarriage(Index: Integer; const Amarriage: marriage);
    function  marriage_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property adp_child:            adp_child     read Fadp_child write Fadp_child;
    property mother_data:          PersonalData  read Fmother_data write Fmother_data;
    property father_data:          PersonalData  read Ffather_data write Ffather_data;
    property adp_mother_data:      PersonalData  Index (IS_OPTN) read Fadp_mother_data write Setadp_mother_data stored adp_mother_data_Specified;
    property adp_father_data:      PersonalData  Index (IS_OPTN) read Fadp_father_data write Setadp_father_data stored adp_father_data_Specified;
    property marriage:             marriage      Index (IS_OPTN) read Fmarriage write Setmarriage stored marriage_Specified;
    property court_decision:       ActReason     read Fcourt_decision write Fcourt_decision;
    property parents_flag:         ParentsFlag   read Fparents_flag write Fparents_flag;
    property adp_act_data:         ActData       read Fadp_act_data write Fadp_act_data;
    property adp_certificate_data: Document      read Fadp_certificate_data write Fadp_certificate_data;
  end;



  // ************************************************************************ //
  // XML       : adp_child, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Сведения об усыновляемом
  adp_child = class(TRemotable)
  private
    ///Идентификационный номер усыновляемого
    Fidentif: PersonalId;
    ///Сведения об усыновляемом до усыновления
    Fbefore_adp_child: before_adp_child;
    ///Сведения об усыновляемом после усыновления
    Fafter_adp_child: after_adp_child;
  public
    destructor Destroy; override;
  published
    property identif:          PersonalId        read Fidentif write Fidentif;
    property before_adp_child: before_adp_child  read Fbefore_adp_child write Fbefore_adp_child;
    property after_adp_child:  after_adp_child   read Fafter_adp_child write Fafter_adp_child;
  end;



  // ************************************************************************ //
  // XML       : before_adp_child, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Сведения об усыновляемом до усыновления
  before_adp_child = class(TRemotable)
  private
    ///Персональные данные усыновляемого до усыновления
    Fbefore_adp_child_data: PersonalData;
    ///Информация об акте о рождении (до усыновления)
    Fbefore_adp_birth_act_data: ActData;
  public
    destructor Destroy; override;
  published
    property before_adp_child_data:     PersonalData  read Fbefore_adp_child_data write Fbefore_adp_child_data;
    property before_adp_birth_act_data: ActData       read Fbefore_adp_birth_act_data write Fbefore_adp_birth_act_data;
  end;



  // ************************************************************************ //
  // XML       : after_adp_child, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Сведения об усыновляемом после усыновления
  after_adp_child = class(TRemotable)
  private
    ///Персональные данные усыновляемого после усыновления
    Fafter_adp_child_data: PersonalData;
    ///Информация об акте о рождении (после усыновления)
    Fafter_adp_birth_act_data: ActData;
  public
    destructor Destroy; override;
  published
    property after_adp_child_data:     PersonalData  read Fafter_adp_child_data write Fafter_adp_child_data;
    property after_adp_birth_act_data: ActData       read Fafter_adp_birth_act_data write Fafter_adp_birth_act_data;
  end;



  // ************************************************************************ //
  // XML       : marriage, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Сведения о регистрации заключения брака
  marriage = class(TRemotable)
  private
    ///Признак заключения брака
    Fmrg_flag: MarrFlag;
    ///Информация об акте о заключении брака
    Fmrg_cert_data: ActData;
  public
    destructor Destroy; override;
  published
    property mrg_flag:      MarrFlag  read Fmrg_flag write Fmrg_flag;
    property mrg_cert_data: ActData   read Fmrg_cert_data write Fmrg_cert_data;
  end;



  // ************************************************************************ //
  // XML       : affiliation_act, global, <element>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  ///Запись акта об установлении отцовства
  affiliation_act = class(TRemotable)
  private
    ///Системная информация
    Fcover: MessageCover;
    ///Акт об установлении отцовства
    Faff_cert_data: aff_cert_data;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property cover:         MessageCover   read Fcover write Fcover;
    property aff_cert_data: aff_cert_data  read Faff_cert_data write Faff_cert_data;
  end;



  // ************************************************************************ //
  // XML       : aff_cert_data, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Акт об установлении отцовства
  aff_cert_data = class(TRemotable)
  private
    ///Сведения о лице, в отношении которого устанавливается отцовство
    Faff_person: aff_person;
    ///Персональные данные матери
    Fmother_data: PersonalData;
    ///Персональные данные отца
    Ffather_data: PersonalData;
    ///Основание записи акта об установлении отцовства - решение суда
    Fcourt_decision: ActReason;
    ///Информация об актовой записи
    Faff_act_data: ActData;
    ///Информация о печатном документе (свидетельство для матери)
    Faff_mother_certificate_data: Document;
    Faff_mother_certificate_data_Specified: boolean;
    ///Информация о печатном документе (свидетельство для отца)
    Faff_father_certificate_data: Document;
    Faff_father_certificate_data_Specified: boolean;
    procedure Setaff_mother_certificate_data(Index: Integer; const ADocument: Document);
    function  aff_mother_certificate_data_Specified(Index: Integer): boolean;
    procedure Setaff_father_certificate_data(Index: Integer; const ADocument: Document);
    function  aff_father_certificate_data_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property aff_person:                  aff_person    read Faff_person write Faff_person;
    property mother_data:                 PersonalData  read Fmother_data write Fmother_data;
    property father_data:                 PersonalData  read Ffather_data write Ffather_data;
    property court_decision:              ActReason     read Fcourt_decision write Fcourt_decision;
    property aff_act_data:                ActData       read Faff_act_data write Faff_act_data;
    property aff_mother_certificate_data: Document      Index (IS_OPTN) read Faff_mother_certificate_data write Setaff_mother_certificate_data stored aff_mother_certificate_data_Specified;
    property aff_father_certificate_data: Document      Index (IS_OPTN) read Faff_father_certificate_data write Setaff_father_certificate_data stored aff_father_certificate_data_Specified;
  end;



  // ************************************************************************ //
  // XML       : aff_person, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Сведения о лице, в отношении которого устанавливается отцовство
  aff_person = class(TRemotable)
  private
    ///Информация об акте о рождении
    Fbirth_act_data: ActData;
    ///Персональные данные лица до установления отцовства
    Fbefore_aff_person_data: PersonalData;
    ///Персональные данные лица после установления отцовства
    Fafter_aff_person_data: PersonalData;
  public
    destructor Destroy; override;
  published
    property birth_act_data:         ActData       read Fbirth_act_data write Fbirth_act_data;
    property before_aff_person_data: PersonalData  read Fbefore_aff_person_data write Fbefore_aff_person_data;
    property after_aff_person_data:  PersonalData  read Fafter_aff_person_data write Fafter_aff_person_data;
  end;



  // ************************************************************************ //
  // XML       : decease_act, global, <element>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  ///Запись акта о смерти
  decease_act = class(TRemotable)
  private
    ///Системная информация
    Fcover: MessageCover;
    ///Акт о смерти
    Fdcs_cert_data: dcs_cert_data;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property cover:         MessageCover   read Fcover write Fcover;
    property dcs_cert_data: dcs_cert_data  read Fdcs_cert_data write Fdcs_cert_data;
  end;



  // ************************************************************************ //
  // XML       : dcs_cert_data, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Акт о смерти
  dcs_cert_data = class(TRemotable)
  private
    ///Персональные данные умершего
    Fperson_data: PersonalData;
    ///Информация о смерти
    Fdecease_data: Death;
    ///Документ, подтверждающий факт смерти
    Freason: WideString;
    ///Информация об актовой записи
    Fdcs_act_data: ActData;
    ///Информация о печатном документе
    Fdcs_certificate_data: Document;
  public
    destructor Destroy; override;
  published
    property person_data:          PersonalData  read Fperson_data write Fperson_data;
    property decease_data:         Death         read Fdecease_data write Fdecease_data;
    property reason:               WideString    read Freason write Freason;
    property dcs_act_data:         ActData       read Fdcs_act_data write Fdcs_act_data;
    property dcs_certificate_data: Document      read Fdcs_certificate_data write Fdcs_certificate_data;
  end;



  // ************************************************************************ //
  // XML       : name_change_act, global, <element>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  ///Запись акта о перемене имени
  name_change_act = class(TRemotable)
  private
    ///Системная информация
    Fcover: MessageCover;
    ///Акт о перемене имени
    Fcng_cert_data: cng_cert_data;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property cover:         MessageCover   read Fcover write Fcover;
    property cng_cert_data: cng_cert_data  read Fcng_cert_data write Fcng_cert_data;
  end;



  // ************************************************************************ //
  // XML       : person, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Персональные данные лица
  person = class(TRemotable)
  private
    ///Персональные данные лица
    Fperson_data: PersonalData;
    ///Фамилия до перемены имени
    Fold_last_name: WideString;
    ///Имя до перемены имени
    Fold_name: WideString;
    ///Отчество до перемены имени
    Fold_patronymic: WideString;
    ///Информация об акте о рождении
    Fbirth_act_data: ActData;
  public
    destructor Destroy; override;
  published
    property person_data:    PersonalData  read Fperson_data write Fperson_data;
    property old_last_name:  WideString    read Fold_last_name write Fold_last_name;
    property old_name:       WideString    read Fold_name write Fold_name;
    property old_patronymic: WideString    read Fold_patronymic write Fold_patronymic;
    property birth_act_data: ActData       read Fbirth_act_data write Fbirth_act_data;
  end;



  // ************************************************************************ //
  // XML       : exception, global, <element>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // Info      : Fault
  // ************************************************************************ //
  exception = class(WsException)
  private
  published
  end;


  // ************************************************************************ //
  // XML       : return_code, global, <element>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // Info      : Wrapper
  // ************************************************************************ //
  return_code = class(WsReturnCode)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : register_request, global, <element>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // Info      : Wrapper
  // ************************************************************************ //
  ///Запрос данных из ГИС УН
  register_request = class(RegisterRequest)
  private
  published
  end;


  // ************************************************************************ //
  // XML       : register_response, global, <element>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // Info      : Wrapper
  // ************************************************************************ //
  ///Запрос данных из ГИС УН (??? комментарий)
  register_response = class(RegisterResponse)
  private
  published
  end;


  // ************************************************************************ //
  // XML       : value, alias
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  {-
  value = class(LangValue)
  private
  published
  end;
  }


  // ************************************************************************ //
  // XML       : document, alias
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  {-
  document2 = class(Document)
  private
  published
  end;
  }


  // ************************************************************************ //
  // XML       : address, alias
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  {-
  address2 = class(Address)
  private
  published
  end;
  }


  // ************************************************************************ //
  // XML       : relationship, alias
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  {-
  relationship = class(Family)
  private
  published
  end;
  }


  // ************************************************************************ //
  // XML       : error, alias
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  {-
  error = class(WsError)
  private
  published
  end;
  }


  // ************************************************************************ //
  // XML       : children, alias
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Информация о ребёнке
  children = class(PersonalData)
  private
  published
  end;

  //-Array_Of_PersonRequest = array of PersonRequest;   { "http://gisun.agatsystem.by/common/ws/"[GblUbnd] }
  //-Array_Of_IdentifRequest = array of IdentifRequest;   { "http://gisun.agatsystem.by/common/ws/"[GblUbnd] }


  // ************************************************************************ //
  // XML       : RequestData, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///
  RequestData = class(TRemotable)
  private
    ///Запрос на генерацию нового идентификационного номера (??? повтор комментария)
    Fperson_request: Array_Of_PersonRequest;
    Fperson_request_Specified: boolean;
    ///Запрос на генерацию нового идентификационного номера
    Fidentif_request: Array_Of_IdentifRequest;
    Fidentif_request_Specified: boolean;
    procedure Setperson_request(Index: Integer; const AArray_Of_PersonRequest: Array_Of_PersonRequest);
    function  person_request_Specified(Index: Integer): boolean;
    procedure Setidentif_request(Index: Integer; const AArray_Of_IdentifRequest: Array_Of_IdentifRequest);
    function  identif_request_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property person_request:  Array_Of_PersonRequest   Index (IS_OPTN or IS_UNBD) read Fperson_request write Setperson_request stored person_request_Specified;
    property identif_request: Array_Of_IdentifRequest  Index (IS_OPTN or IS_UNBD) read Fidentif_request write Setidentif_request stored identif_request_Specified;
  end;

  //-Array_Of_ResponsePerson = array of ResponsePerson;   { "http://gisun.agatsystem.by/common/ws/"[GblUbnd] }
  //-Array_Of_ResponseIdentif = array of ResponseIdentif;   { "http://gisun.agatsystem.by/common/ws/"[GblUbnd] }


  // ************************************************************************ //
  // XML       : ResponseData, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///
  ResponseData = class(TRemotable)
  private
    ///Персональные данные
    Fpersonal_data: Array_Of_ResponsePerson;
    Fpersonal_data_Specified: boolean;
    ///Сгенерированный персональный номер
    Fidentif_number: Array_Of_ResponseIdentif;
    Fidentif_number_Specified: boolean;
    procedure Setpersonal_data(Index: Integer; const AArray_Of_ResponsePerson: Array_Of_ResponsePerson);
    function  personal_data_Specified(Index: Integer): boolean;
    procedure Setidentif_number(Index: Integer; const AArray_Of_ResponseIdentif: Array_Of_ResponseIdentif);
    function  identif_number_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property personal_data:  Array_Of_ResponsePerson   Index (IS_OPTN or IS_UNBD) read Fpersonal_data write Setpersonal_data stored personal_data_Specified;
    property identif_number: Array_Of_ResponseIdentif  Index (IS_OPTN or IS_UNBD) read Fidentif_number write Setidentif_number stored identif_number_Specified;
  end;


  // ************************************************************************ //
  // XML       : mrg_cert_data, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Акт о заключении брака
  mrg_cert_data = class(TRemotable)
  private
    ///Информация о невесте
    Fbride: bride;
    ///Информация о женихе
    Fbridegroom: bridegroom;
    ///Сведения о совместных детях, не достигших 18 лет
    Fjoint_child: ChildList;
    Fjoint_child_Specified: boolean;
    ///Информация об актовой записи
    Fmrg_act_data: ActData;
    ///Информация о печатном документе
    Fmrg_certificate_data: Document;
    procedure Setjoint_child(Index: Integer; const AChildList: ChildList);
    function  joint_child_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property bride:                bride       read Fbride write Fbride;
    property bridegroom:           bridegroom  read Fbridegroom write Fbridegroom;
    property joint_child:          ChildList   Index (IS_OPTN) read Fjoint_child write Setjoint_child stored joint_child_Specified;
    property mrg_act_data:         ActData     read Fmrg_act_data write Fmrg_act_data;
    property mrg_certificate_data: Document    read Fmrg_certificate_data write Fmrg_certificate_data;
  end;

  // ************************************************************************ //
  // XML       : dvc_cert_data, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Акт о расторжении брака
  dvc_cert_data = class(TRemotable)
  private
    ///Информация о жене
    Fwife: wife;
    ///Информация о муже
    Fhusband: husband;
    ///Информация об акте о регистрации брака
    Fmrg_act_data: ActData;
    ///Сведения о совместных детях, не достигших 18 лет
    Fjoint_child: ChildList;
    Fjoint_child_Specified: boolean;
    ///Основание записи акта о расторжении брака  - решение суда
    Fcourt_decision: ActReason;
    ///Информация об актовой записи
    Fdvc_act_data: ActData;
    ///Информация о печатном документе (свидетельство для бывшей жены)
    Fdvc_wm_certificate_data: Document;
    ///Информация о печатном документе (свидетельство для бывшего мужа)
    Fdvc_mn_certificate_data: Document;
    procedure Setjoint_child(Index: Integer; const AChildList: ChildList);
    function  joint_child_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property wife:                    wife       read Fwife write Fwife;
    property husband:                 husband    read Fhusband write Fhusband;
    property mrg_act_data:            ActData    read Fmrg_act_data write Fmrg_act_data;
    property joint_child:             ChildList  Index (IS_OPTN) read Fjoint_child write Setjoint_child stored joint_child_Specified;
    property court_decision:          ActReason  read Fcourt_decision write Fcourt_decision;
    property dvc_act_data:            ActData    read Fdvc_act_data write Fdvc_act_data;
    property dvc_wm_certificate_data: Document   read Fdvc_wm_certificate_data write Fdvc_wm_certificate_data;
    property dvc_mn_certificate_data: Document   read Fdvc_mn_certificate_data write Fdvc_mn_certificate_data;
  end;


  // ************************************************************************ //
  // XML       : cng_cert_data, <complexType>
  // Namespace : http://gisun.agatsystem.by/zags/types/
  // ************************************************************************ //
  ///Акт о перемене имени
  cng_cert_data = class(TRemotable)
  private
    ///Персональные данные лица
    Fperson: person;
    ///Сведения о детях, не достигших 18 лет
    Fjoint_child: ChildList;
    Fjoint_child_Specified: boolean;
    ///Основание записи акта о перемене имени
    Freason: WideString;
    ///Информация об актовой записи
    Fcng_act_data: ActData;
    ///Информация о печатном документе
    Fcng_certificate_data: Document;
    procedure Setjoint_child(Index: Integer; const AChildList: ChildList);
    function  joint_child_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property person:               person      read Fperson write Fperson;
    property joint_child:          ChildList   Index (IS_OPTN) read Fjoint_child write Setjoint_child stored joint_child_Specified;
    property reason:               WideString  read Freason write Freason;
    property cng_act_data:         ActData     read Fcng_act_data write Fcng_act_data;
    property cng_certificate_data: Document    read Fcng_certificate_data write Fcng_certificate_data;
  end;


  // ************************************************************************ //
  // Namespace : http://gisun.agatsystem.by/zags/ws/
  // soapAction: urn:%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : ZagsSOAPBinding
  // service   : ZagsWs
  // port      : ws
  // URL       : http://agat-system.by:4569/gisun/zags/ws
  // ************************************************************************ //
  ZagsWS = interface(IInvokable)
  ['{01659ED2-D4AF-DBD4-24D1-FFBAF83FF81D}']
    function  getPersonalData(const registerRequest: register_request): register_response; stdcall;
    ///регистрация рождения
    function  postBirthCertificate(const birthActRequest: birth_act): return_code; stdcall;
    ///??? восстановление актовой записи о рождении
    function  postReconstBirthCertificate(const rcnBirthActRequest: reconstructed_birth_act): return_code; stdcall;
    ///регистрация брака
    function  postMarriageCertificate(const mrgActRequest: marriage_act): return_code; stdcall;
    ///расторжение брака
    function  postDivorceCertificate(const dvcActRequest: divorce_act): return_code; stdcall;
    ///усыновление
    function  postAdoptionCertificate(const adpActRequest: adoption_act): return_code; stdcall;
    ///установление отцовства
    function  postAffiliationCertificate(const affActRequest: affiliation_act): return_code; stdcall;
    ///умирание
    function  postDeceaseCertificate(const dcsActRequest: decease_act): return_code; stdcall;
    ///перемена имени
    function  postNameChangeCertificate(const cngActRequest: name_change_act): return_code; stdcall;
  end;

function GetZagsWS(Addr, Proxy: string; RIO: THTTPRIO): ZagsWS;

implementation
  uses SysUtils;

function GetZagsWS(Addr, Proxy: string; RIO: THTTPRIO): ZagsWS;
begin
   Result := nil;
   if Addr<>'' then begin
      RIO.Converter.Options:=[soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soDocument, soDontSendEmptyNodes, soCacheMimeResponse, soLiteralParams, soUTF8EncodeXML];
      RIO.URL:=Addr;
      RIO.HTTPWebNode.Proxy:=Proxy;
      Result:=(RIO as ZagsWS);
   end;
end;

{-
destructor Classifier.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Flexema)-1 do
    FreeAndNil(Flexema[I]);
  SetLength(Flexema, 0);
  inherited Destroy;
end;

procedure Classifier.Setcode(Index: Integer; const AWideString: WideString);
begin
  Fcode := AWideString;
  Fcode_Specified := True;
end;

function Classifier.code_Specified(Index: Integer): boolean;
begin
  Result := Fcode_Specified;
end;

procedure Classifier.Settype_(Index: Integer; const AInteger: Integer);
begin
  Ftype_ := AInteger;
  Ftype__Specified := True;
end;

function Classifier.type__Specified(Index: Integer): boolean;
begin
  Result := Ftype__Specified;
end;

procedure Classifier.Setlexema(Index: Integer; const ALangValueList: LangValueList);
begin
  Flexema := ALangValueList;
  Flexema_Specified := True;
end;

function Classifier.lexema_Specified(Index: Integer): boolean;
begin
  Result := Flexema_Specified;
end;
}

{-
destructor Document.Destroy;
begin
  FreeAndNil(Fdocument_type);
  FreeAndNil(Fauthority);
  FreeAndNil(Fdate_of_issue);
  FreeAndNil(Fexpire_date);
  FreeAndNil(Fact_data);
  inherited Destroy;
end;

procedure Document.Setdocument_type(Index: Integer; const AClassifier: Classifier);
begin
  Fdocument_type := AClassifier;
  Fdocument_type_Specified := True;
end;

function Document.document_type_Specified(Index: Integer): boolean;
begin
  Result := Fdocument_type_Specified;
end;

procedure Document.Setauthority(Index: Integer; const AClassifier: Classifier);
begin
  Fauthority := AClassifier;
  Fauthority_Specified := True;
end;

function Document.authority_Specified(Index: Integer): boolean;
begin
  Result := Fauthority_Specified;
end;

procedure Document.Setdate_of_issue(Index: Integer; const ATXSDate: TXSDate);
begin
  Fdate_of_issue := ATXSDate;
  Fdate_of_issue_Specified := True;
end;

function Document.date_of_issue_Specified(Index: Integer): boolean;
begin
  Result := Fdate_of_issue_Specified;
end;

procedure Document.Setexpire_date(Index: Integer; const ATXSDate: TXSDate);
begin
  Fexpire_date := ATXSDate;
  Fexpire_date_Specified := True;
end;

function Document.expire_date_Specified(Index: Integer): boolean;
begin
  Result := Fexpire_date_Specified;
end;

procedure Document.Setseries(Index: Integer; const AWideString: WideString);
begin
  Fseries := AWideString;
  Fseries_Specified := True;
end;

function Document.series_Specified(Index: Integer): boolean;
begin
  Result := Fseries_Specified;
end;

procedure Document.Setnumber(Index: Integer; const AWideString: WideString);
begin
  Fnumber := AWideString;
  Fnumber_Specified := True;
end;

function Document.number_Specified(Index: Integer): boolean;
begin
  Result := Fnumber_Specified;
end;

procedure Document.Setact_data(Index: Integer; const AActData: ActData);
begin
  Fact_data := AActData;
  Fact_data_Specified := True;
end;

function Document.act_data_Specified(Index: Integer): boolean;
begin
  Result := Fact_data_Specified;
end;
}

{-
destructor ActData.Destroy;
begin
  FreeAndNil(Fact_type);
  FreeAndNil(Fauthority);
  FreeAndNil(Fdate);
  inherited Destroy;
end;

procedure ActData.Setact_type(Index: Integer; const AClassifier: Classifier);
begin
  Fact_type := AClassifier;
  Fact_type_Specified := True;
end;

function ActData.act_type_Specified(Index: Integer): boolean;
begin
  Result := Fact_type_Specified;
end;

procedure ActData.Setauthority(Index: Integer; const AClassifier: Classifier);
begin
  Fauthority := AClassifier;
  Fauthority_Specified := True;
end;

function ActData.authority_Specified(Index: Integer): boolean;
begin
  Result := Fauthority_Specified;
end;

procedure ActData.Setdate(Index: Integer; const ATXSDate: TXSDate);
begin
  Fdate := ATXSDate;
  Fdate_Specified := True;
end;

function ActData.date_Specified(Index: Integer): boolean;
begin
  Result := Fdate_Specified;
end;

procedure ActData.Setnumber(Index: Integer; const AWideString: WideString);
begin
  Fnumber := AWideString;
  Fnumber_Specified := True;
end;

function ActData.number_Specified(Index: Integer): boolean;
begin
  Result := Fnumber_Specified;
end;
}

{-
destructor Address.Destroy;
begin
  FreeAndNil(Fcountry);
  FreeAndNil(Farea);
  FreeAndNil(Fregion);
  FreeAndNil(Flocality);
  FreeAndNil(Fstreet);
  FreeAndNil(Freg_date);
  inherited Destroy;
end;

procedure Address.Setcountry(Index: Integer; const AClassifier: Classifier);
begin
  Fcountry := AClassifier;
  Fcountry_Specified := True;
end;

function Address.country_Specified(Index: Integer): boolean;
begin
  Result := Fcountry_Specified;
end;

procedure Address.Setarea(Index: Integer; const AClassifier: Classifier);
begin
  Farea := AClassifier;
  Farea_Specified := True;
end;

function Address.area_Specified(Index: Integer): boolean;
begin
  Result := Farea_Specified;
end;

procedure Address.Setregion(Index: Integer; const AClassifier: Classifier);
begin
  Fregion := AClassifier;
  Fregion_Specified := True;
end;

function Address.region_Specified(Index: Integer): boolean;
begin
  Result := Fregion_Specified;
end;

procedure Address.Setlocality(Index: Integer; const AClassifier: Classifier);
begin
  Flocality := AClassifier;
  Flocality_Specified := True;
end;

function Address.locality_Specified(Index: Integer): boolean;
begin
  Result := Flocality_Specified;
end;

procedure Address.Setstreet(Index: Integer; const AClassifier: Classifier);
begin
  Fstreet := AClassifier;
  Fstreet_Specified := True;
end;

function Address.street_Specified(Index: Integer): boolean;
begin
  Result := Fstreet_Specified;
end;

procedure Address.Sethouse(Index: Integer; const AWideString: WideString);
begin
  Fhouse := AWideString;
  Fhouse_Specified := True;
end;

function Address.house_Specified(Index: Integer): boolean;
begin
  Result := Fhouse_Specified;
end;

procedure Address.Setbuilding(Index: Integer; const AWideString: WideString);
begin
  Fbuilding := AWideString;
  Fbuilding_Specified := True;
end;

function Address.building_Specified(Index: Integer): boolean;
begin
  Result := Fbuilding_Specified;
end;

procedure Address.Setflat(Index: Integer; const AWideString: WideString);
begin
  Fflat := AWideString;
  Fflat_Specified := True;
end;

function Address.flat_Specified(Index: Integer): boolean;
begin
  Result := Fflat_Specified;
end;

procedure Address.Setreg_date(Index: Integer; const ATXSDate: TXSDate);
begin
  Freg_date := ATXSDate;
  Freg_date_Specified := True;
end;

function Address.reg_date_Specified(Index: Integer): boolean;
begin
  Result := Freg_date_Specified;
end;
}
{-
destructor Death.Destroy;
begin
  FreeAndNil(Fdeath_cause);
  FreeAndNil(Fdecease_place);
  inherited Destroy;
end;

procedure Death.Setdeath_cause(Index: Integer; const AClassifier: Classifier);
begin
  Fdeath_cause := AClassifier;
  Fdeath_cause_Specified := True;
end;

function Death.death_cause_Specified(Index: Integer): boolean;
begin
  Result := Fdeath_cause_Specified;
end;

procedure Death.Setdeath_date(Index: Integer; const AWideString: WideString);
begin
  Fdeath_date := AWideString;
  Fdeath_date_Specified := True;
end;

function Death.death_date_Specified(Index: Integer): boolean;
begin
  Result := Fdeath_date_Specified;
end;

procedure Death.Setdecease_place(Index: Integer; const Adecease_place: decease_place);
begin
  Fdecease_place := Adecease_place;
  Fdecease_place_Specified := True;
end;

function Death.decease_place_Specified(Index: Integer): boolean;
begin
  Result := Fdecease_place_Specified;
end;

procedure Death.Setdeath_place(Index: Integer; const AWideString: WideString);
begin
  Fdeath_place := AWideString;
  Fdeath_place_Specified := True;
end;

function Death.death_place_Specified(Index: Integer): boolean;
begin
  Result := Fdeath_place_Specified;
end;

procedure Death.Setburial_place(Index: Integer; const AWideString: WideString);
begin
  Fburial_place := AWideString;
  Fburial_place_Specified := True;
end;

function Death.burial_place_Specified(Index: Integer): boolean;
begin
  Result := Fburial_place_Specified;
end;
}
{-
destructor decease_place.Destroy;
begin
  FreeAndNil(Fcountry_d);
  FreeAndNil(Ftype_city_d);
  inherited Destroy;
end;

procedure decease_place.Setcountry_d(Index: Integer; const AClassifier: Classifier);
begin
  Fcountry_d := AClassifier;
  Fcountry_d_Specified := True;
end;

function decease_place.country_d_Specified(Index: Integer): boolean;
begin
  Result := Fcountry_d_Specified;
end;

procedure decease_place.Setarea_d(Index: Integer; const AWideString: WideString);
begin
  Farea_d := AWideString;
  Farea_d_Specified := True;
end;

function decease_place.area_d_Specified(Index: Integer): boolean;
begin
  Result := Farea_d_Specified;
end;

procedure decease_place.Setarea_d_bel(Index: Integer; const AWideString: WideString);
begin
  Farea_d_bel := AWideString;
  Farea_d_bel_Specified := True;
end;

function decease_place.area_d_bel_Specified(Index: Integer): boolean;
begin
  Result := Farea_d_bel_Specified;
end;

procedure decease_place.Setregion_d(Index: Integer; const AWideString: WideString);
begin
  Fregion_d := AWideString;
  Fregion_d_Specified := True;
end;

function decease_place.region_d_Specified(Index: Integer): boolean;
begin
  Result := Fregion_d_Specified;
end;

procedure decease_place.Setregion_d_bel(Index: Integer; const AWideString: WideString);
begin
  Fregion_d_bel := AWideString;
  Fregion_d_bel_Specified := True;
end;

function decease_place.region_d_bel_Specified(Index: Integer): boolean;
begin
  Result := Fregion_d_bel_Specified;
end;

procedure decease_place.Settype_city_d(Index: Integer; const AClassifier: Classifier);
begin
  Ftype_city_d := AClassifier;
  Ftype_city_d_Specified := True;
end;

function decease_place.type_city_d_Specified(Index: Integer): boolean;
begin
  Result := Ftype_city_d_Specified;
end;

procedure decease_place.Setcity_d(Index: Integer; const AWideString: WideString);
begin
  Fcity_d := AWideString;
  Fcity_d_Specified := True;
end;

function decease_place.city_d_Specified(Index: Integer): boolean;
begin
  Result := Fcity_d_Specified;
end;

procedure decease_place.Setcity_d_bel(Index: Integer; const AWideString: WideString);
begin
  Fcity_d_bel := AWideString;
  Fcity_d_bel_Specified := True;
end;

function decease_place.city_d_bel_Specified(Index: Integer): boolean;
begin
  Result := Fcity_d_bel_Specified;
end;
}

{-
destructor Family.Destroy;
begin
  FreeAndNil(Frelationship);
  FreeAndNil(Fbegin_date);
  FreeAndNil(Fend_date);
  inherited Destroy;
end;

procedure Family.Setrelationship(Index: Integer; const AClassifier: Classifier);
begin
  Frelationship := AClassifier;
  Frelationship_Specified := True;
end;

function Family.relationship_Specified(Index: Integer): boolean;
begin
  Result := Frelationship_Specified;
end;

procedure Family.Setis_owner(Index: Integer; const ABoolean: Boolean);
begin
  Fis_owner := ABoolean;
  Fis_owner_Specified := True;
end;

function Family.is_owner_Specified(Index: Integer): boolean;
begin
  Result := Fis_owner_Specified;
end;

procedure Family.Setrel_id(Index: Integer; const APersonalId: PersonalId);
begin
  Frel_id := APersonalId;
  Frel_id_Specified := True;
end;

function Family.rel_id_Specified(Index: Integer): boolean;
begin
  Result := Frel_id_Specified;
end;

procedure Family.Setbegin_date(Index: Integer; const ATXSDateTime: TXSDateTime);
begin
  Fbegin_date := ATXSDateTime;
  Fbegin_date_Specified := True;
end;

function Family.begin_date_Specified(Index: Integer): boolean;
begin
  Result := Fbegin_date_Specified;
end;

procedure Family.Setend_date(Index: Integer; const ATXSDateTime: TXSDateTime);
begin
  Fend_date := ATXSDateTime;
  Fend_date_Specified := True;
end;

function Family.end_date_Specified(Index: Integer): boolean;
begin
  Result := Fend_date_Specified;
end;
}

{-
destructor PersonalData.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Faddresses)-1 do
    FreeAndNil(Faddresses[I]);
  SetLength(Faddresses, 0);
  for I := 0 to Length(Fdocuments)-1 do
    FreeAndNil(Fdocuments[I]);
  SetLength(Fdocuments, 0);
  for I := 0 to Length(Ffamily)-1 do
    FreeAndNil(Ffamily[I]);
  SetLength(Ffamily, 0);
  FreeAndNil(Fsex);
  FreeAndNil(Fbirth_place);
  FreeAndNil(Fcitizenship);
  FreeAndNil(Fstatus);
  inherited Destroy;
end;

procedure PersonalData.Setidentif(Index: Integer; const APersonalId: PersonalId);
begin
  Fidentif := APersonalId;
  Fidentif_Specified := True;
end;

function PersonalData.identif_Specified(Index: Integer): boolean;
begin
  Result := Fidentif_Specified;
end;

procedure PersonalData.Setlast_name(Index: Integer; const AWideString: WideString);
begin
  Flast_name := AWideString;
  Flast_name_Specified := True;
end;

function PersonalData.last_name_Specified(Index: Integer): boolean;
begin
  Result := Flast_name_Specified;
end;

procedure PersonalData.Setlast_name_bel(Index: Integer; const AWideString: WideString);
begin
  Flast_name_bel := AWideString;
  Flast_name_bel_Specified := True;
end;

function PersonalData.last_name_bel_Specified(Index: Integer): boolean;
begin
  Result := Flast_name_bel_Specified;
end;

procedure PersonalData.Setlast_name_lat(Index: Integer; const AWideString: WideString);
begin
  Flast_name_lat := AWideString;
  Flast_name_lat_Specified := True;
end;

function PersonalData.last_name_lat_Specified(Index: Integer): boolean;
begin
  Result := Flast_name_lat_Specified;
end;

procedure PersonalData.Setname_(Index: Integer; const AWideString: WideString);
begin
  Fname_ := AWideString;
  Fname__Specified := True;
end;

function PersonalData.name__Specified(Index: Integer): boolean;
begin
  Result := Fname__Specified;
end;

procedure PersonalData.Setname_bel(Index: Integer; const AWideString: WideString);
begin
  Fname_bel := AWideString;
  Fname_bel_Specified := True;
end;

function PersonalData.name_bel_Specified(Index: Integer): boolean;
begin
  Result := Fname_bel_Specified;
end;

procedure PersonalData.Setname_lat(Index: Integer; const AWideString: WideString);
begin
  Fname_lat := AWideString;
  Fname_lat_Specified := True;
end;

function PersonalData.name_lat_Specified(Index: Integer): boolean;
begin
  Result := Fname_lat_Specified;
end;

procedure PersonalData.Setpatronymic(Index: Integer; const AWideString: WideString);
begin
  Fpatronymic := AWideString;
  Fpatronymic_Specified := True;
end;

function PersonalData.patronymic_Specified(Index: Integer): boolean;
begin
  Result := Fpatronymic_Specified;
end;

procedure PersonalData.Setpatronymic_bel(Index: Integer; const AWideString: WideString);
begin
  Fpatronymic_bel := AWideString;
  Fpatronymic_bel_Specified := True;
end;

function PersonalData.patronymic_bel_Specified(Index: Integer): boolean;
begin
  Result := Fpatronymic_bel_Specified;
end;

procedure PersonalData.Setpatronymic_lat(Index: Integer; const AWideString: WideString);
begin
  Fpatronymic_lat := AWideString;
  Fpatronymic_lat_Specified := True;
end;

function PersonalData.patronymic_lat_Specified(Index: Integer): boolean;
begin
  Result := Fpatronymic_lat_Specified;
end;

procedure PersonalData.Setsex(Index: Integer; const AClassifier: Classifier);
begin
  Fsex := AClassifier;
  Fsex_Specified := True;
end;

function PersonalData.sex_Specified(Index: Integer): boolean;
begin
  Result := Fsex_Specified;
end;

procedure PersonalData.Setbirth_day(Index: Integer; const AWideString: WideString);
begin
  Fbirth_day := AWideString;
  Fbirth_day_Specified := True;
end;

function PersonalData.birth_day_Specified(Index: Integer): boolean;
begin
  Result := Fbirth_day_Specified;
end;

procedure PersonalData.Setbirth_place(Index: Integer; const Abirth_place: birth_place);
begin
  Fbirth_place := Abirth_place;
  Fbirth_place_Specified := True;
end;

function PersonalData.birth_place_Specified(Index: Integer): boolean;
begin
  Result := Fbirth_place_Specified;
end;

procedure PersonalData.Setcitizenship(Index: Integer; const AClassifier: Classifier);
begin
  Fcitizenship := AClassifier;
  Fcitizenship_Specified := True;
end;

function PersonalData.citizenship_Specified(Index: Integer): boolean;
begin
  Result := Fcitizenship_Specified;
end;

procedure PersonalData.Setstatus(Index: Integer; const AClassifier: Classifier);
begin
  Fstatus := AClassifier;
  Fstatus_Specified := True;
end;

function PersonalData.status_Specified(Index: Integer): boolean;
begin
  Result := Fstatus_Specified;
end;

procedure PersonalData.Setaddresses(Index: Integer; const AAddressList: AddressList);
begin
  Faddresses := AAddressList;
  Faddresses_Specified := True;
end;

function PersonalData.addresses_Specified(Index: Integer): boolean;
begin
  Result := Faddresses_Specified;
end;

procedure PersonalData.Setdocuments(Index: Integer; const ADocumentList: DocumentList);
begin
  Fdocuments := ADocumentList;
  Fdocuments_Specified := True;
end;

function PersonalData.documents_Specified(Index: Integer): boolean;
begin
  Result := Fdocuments_Specified;
end;

procedure PersonalData.Setfamily(Index: Integer; const AFamilyList: FamilyList);
begin
  Ffamily := AFamilyList;
  Ffamily_Specified := True;
end;

function PersonalData.family_Specified(Index: Integer): boolean;
begin
  Result := Ffamily_Specified;
end;
}

{-
destructor birth_place.Destroy;
begin
  FreeAndNil(Fcountry_b);
  FreeAndNil(Ftype_city_b);
  inherited Destroy;
end;

procedure birth_place.Setcountry_b(Index: Integer; const AClassifier: Classifier);
begin
  Fcountry_b := AClassifier;
  Fcountry_b_Specified := True;
end;

function birth_place.country_b_Specified(Index: Integer): boolean;
begin
  Result := Fcountry_b_Specified;
end;

procedure birth_place.Setarea_b(Index: Integer; const AWideString: WideString);
begin
  Farea_b := AWideString;
  Farea_b_Specified := True;
end;

function birth_place.area_b_Specified(Index: Integer): boolean;
begin
  Result := Farea_b_Specified;
end;

procedure birth_place.Setarea_b_bel(Index: Integer; const AWideString: WideString);
begin
  Farea_b_bel := AWideString;
  Farea_b_bel_Specified := True;
end;

function birth_place.area_b_bel_Specified(Index: Integer): boolean;
begin
  Result := Farea_b_bel_Specified;
end;

procedure birth_place.Setregion_b(Index: Integer; const AWideString: WideString);
begin
  Fregion_b := AWideString;
  Fregion_b_Specified := True;
end;

function birth_place.region_b_Specified(Index: Integer): boolean;
begin
  Result := Fregion_b_Specified;
end;

procedure birth_place.Setregion_b_bel(Index: Integer; const AWideString: WideString);
begin
  Fregion_b_bel := AWideString;
  Fregion_b_bel_Specified := True;
end;

function birth_place.region_b_bel_Specified(Index: Integer): boolean;
begin
  Result := Fregion_b_bel_Specified;
end;

procedure birth_place.Settype_city_b(Index: Integer; const AClassifier: Classifier);
begin
  Ftype_city_b := AClassifier;
  Ftype_city_b_Specified := True;
end;

function birth_place.type_city_b_Specified(Index: Integer): boolean;
begin
  Result := Ftype_city_b_Specified;
end;

procedure birth_place.Setcity_b(Index: Integer; const AWideString: WideString);
begin
  Fcity_b := AWideString;
  Fcity_b_Specified := True;
end;

function birth_place.city_b_Specified(Index: Integer): boolean;
begin
  Result := Fcity_b_Specified;
end;

procedure birth_place.Setcity_b_bel(Index: Integer; const AWideString: WideString);
begin
  Fcity_b_bel := AWideString;
  Fcity_b_bel_Specified := True;
end;

function birth_place.city_b_bel_Specified(Index: Integer): boolean;
begin
  Result := Fcity_b_bel_Specified;
end;
}

{-
destructor MessageCover.Destroy;
begin
  FreeAndNil(Fmessage_type);
  FreeAndNil(Fmessage_time);
  FreeAndNil(Fmessage_source);
  inherited Destroy;
end;

procedure MessageCover.Setparent_message_id(Index: Integer; const AId: Id);
begin
  Fparent_message_id := AId;
  Fparent_message_id_Specified := True;
end;

function MessageCover.parent_message_id_Specified(Index: Integer): boolean;
begin
  Result := Fparent_message_id_Specified;
end;
}

{-
destructor PersonRequest.Destroy;
begin
  FreeAndNil(Fdocument);
  inherited Destroy;
end;
}

{-
destructor IdentifRequest.Destroy;
begin
  FreeAndNil(Fsex);
  inherited Destroy;
end;
}

{-
destructor WsError.Destroy;
begin
  FreeAndNil(Ferror_code);
  inherited Destroy;
end;

procedure WsError.Seterror_place(Index: Integer; const AWideString: WideString);
begin
  Ferror_place := AWideString;
  Ferror_place_Specified := True;
end;

function WsError.error_place_Specified(Index: Integer): boolean;
begin
  Result := Ferror_place_Specified;
end;

procedure WsError.Setwrong_value(Index: Integer; const AWideString: WideString);
begin
  Fwrong_value := AWideString;
  Fwrong_value_Specified := True;
end;

function WsError.wrong_value_Specified(Index: Integer): boolean;
begin
  Result := Fwrong_value_Specified;
end;

procedure WsError.Setcorrect_value(Index: Integer; const AWideString: WideString);
begin
  Fcorrect_value := AWideString;
  Fcorrect_value_Specified := True;
end;

function WsError.correct_value_Specified(Index: Integer): boolean;
begin
  Result := Fcorrect_value_Specified;
end;

procedure WsError.Setcheck_name(Index: Integer; const AWideString: WideString);
begin
  Fcheck_name := AWideString;
  Fcheck_name_Specified := True;
end;

function WsError.check_name_Specified(Index: Integer): boolean;
begin
  Result := Fcheck_name_Specified;
end;
}
constructor WsReturnCode.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor WsReturnCode.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Ferror_list)-1 do
    FreeAndNil(Ferror_list[I]);
  SetLength(Ferror_list, 0);
  FreeAndNil(Fcover);
  inherited Destroy;
end;

procedure WsReturnCode.Seterror_list(Index: Integer; const AErrorList: ErrorList);
begin
  Ferror_list := AErrorList;
  Ferror_list_Specified := True;
end;

function WsReturnCode.error_list_Specified(Index: Integer): boolean;
begin
  Result := Ferror_list_Specified;
end;

{-
destructor WsException.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Ferror_list)-1 do
    FreeAndNil(Ferror_list[I]);
  SetLength(Ferror_list, 0);
  FreeAndNil(Fcover);
  inherited Destroy;
end;

procedure WsException.Seterror_list(Index: Integer; const AErrorList: ErrorList);
begin
  Ferror_list := AErrorList;
  Ferror_list_Specified := True;
end;

function WsException.error_list_Specified(Index: Integer): boolean;
begin
  Result := Ferror_list_Specified;
end;
}
{-
destructor ResponsePerson.Destroy;
begin
  FreeAndNil(Fdata);
  inherited Destroy;
end;
}
procedure ActReason.Setcourt_name(Index: Integer; const AWideString: WideString);
begin
  Fcourt_name := AWideString;
  Fcourt_name_Specified := True;
end;

function ActReason.court_name_Specified(Index: Integer): boolean;
begin
  Result := Fcourt_name_Specified;
end;

procedure ActReason.Setcourt_decision_date(Index: Integer; const AWideString: WideString);
begin
  Fcourt_decision_date := AWideString;
  Fcourt_decision_date_Specified := True;
end;

function ActReason.court_decision_date_Specified(Index: Integer): boolean;
begin
  Result := Fcourt_decision_date_Specified;
end;

procedure ActReason.Setcomment(Index: Integer; const AWideString: WideString);
begin
  Fcomment := AWideString;
  Fcomment_Specified := True;
end;

function ActReason.comment_Specified(Index: Integer): boolean;
begin
  Result := Fcomment_Specified;
end;

constructor RegisterRequest.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor RegisterRequest.Destroy;
begin
  FreeAndNil(Fcover);
  FreeAndNil(Frequest);
  inherited Destroy;
end;

constructor RegisterResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor RegisterResponse.Destroy;
begin
  FreeAndNil(Fcover);
  FreeAndNil(Fresponse);
  inherited Destroy;
end;

constructor birth_act.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor birth_act.Destroy;
begin
  FreeAndNil(Fcover);
  FreeAndNil(Fbirth_cert_data);
  inherited Destroy;
end;

destructor birth_cert_data.Destroy;
begin
  FreeAndNil(Fchild_data);
  FreeAndNil(Fmother_data);
  FreeAndNil(Ffather_data);
  FreeAndNil(Fmarriage_cert);
  FreeAndNil(Fbirth_act_data);
  FreeAndNil(Fbirth_certificate_data);
  inherited Destroy;
end;

procedure birth_cert_data.Setmarriage_cert(Index: Integer; const AActData: ActData);
begin
  Fmarriage_cert := AActData;
  Fmarriage_cert_Specified := True;
end;

function birth_cert_data.marriage_cert_Specified(Index: Integer): boolean;
begin
  Result := Fmarriage_cert_Specified;
end;

constructor reconstructed_birth_act.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor reconstructed_birth_act.Destroy;
begin
  FreeAndNil(Fcover);
  FreeAndNil(Frcn_birth_cert_data);
  inherited Destroy;
end;

destructor rcn_birth_cert_data.Destroy;
begin
  FreeAndNil(Fchild_data);
  FreeAndNil(Fmother_data);
  FreeAndNil(Ffather_data);
  FreeAndNil(Fcourt_decision);
  FreeAndNil(Frcn_birth_act_data);
  FreeAndNil(Frcn_birth_certificate_data);
  inherited Destroy;
end;

constructor marriage_act.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor marriage_act.Destroy;
begin
  FreeAndNil(Fcover);
  FreeAndNil(Fmrg_cert_data);
  inherited Destroy;
end;

destructor bride.Destroy;
begin
  FreeAndNil(Fbride_data);
  inherited Destroy;
end;

destructor bridegroom.Destroy;
begin
  FreeAndNil(Fbridegroom_data);
  inherited Destroy;
end;

constructor divorce_act.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor divorce_act.Destroy;
begin
  FreeAndNil(Fcover);
  FreeAndNil(Fdvc_cert_data);
  inherited Destroy;
end;

destructor wife.Destroy;
begin
  FreeAndNil(Fwife_data);
  inherited Destroy;
end;

destructor husband.Destroy;
begin
  FreeAndNil(Fhusband_data);
  inherited Destroy;
end;

constructor adoption_act.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor adoption_act.Destroy;
begin
  FreeAndNil(Fcover);
  FreeAndNil(Fadp_cert_data);
  inherited Destroy;
end;

destructor adp_cert_data.Destroy;
begin
  FreeAndNil(Fadp_child);
  FreeAndNil(Fmother_data);
  FreeAndNil(Ffather_data);
  FreeAndNil(Fadp_mother_data);
  FreeAndNil(Fadp_father_data);
  FreeAndNil(Fmarriage);
  FreeAndNil(Fcourt_decision);
  FreeAndNil(Fadp_act_data);
  FreeAndNil(Fadp_certificate_data);
  inherited Destroy;
end;

procedure adp_cert_data.Setadp_mother_data(Index: Integer; const APersonalData: PersonalData);
begin
  Fadp_mother_data := APersonalData;
  Fadp_mother_data_Specified := True;
end;

function adp_cert_data.adp_mother_data_Specified(Index: Integer): boolean;
begin
  Result := Fadp_mother_data_Specified;
end;

procedure adp_cert_data.Setadp_father_data(Index: Integer; const APersonalData: PersonalData);
begin
  Fadp_father_data := APersonalData;
  Fadp_father_data_Specified := True;
end;

function adp_cert_data.adp_father_data_Specified(Index: Integer): boolean;
begin
  Result := Fadp_father_data_Specified;
end;

procedure adp_cert_data.Setmarriage(Index: Integer; const Amarriage: marriage);
begin
  Fmarriage := Amarriage;
  Fmarriage_Specified := True;
end;

function adp_cert_data.marriage_Specified(Index: Integer): boolean;
begin
  Result := Fmarriage_Specified;
end;

destructor adp_child.Destroy;
begin
  FreeAndNil(Fbefore_adp_child);
  FreeAndNil(Fafter_adp_child);
  inherited Destroy;
end;

destructor before_adp_child.Destroy;
begin
  FreeAndNil(Fbefore_adp_child_data);
  FreeAndNil(Fbefore_adp_birth_act_data);
  inherited Destroy;
end;

destructor after_adp_child.Destroy;
begin
  FreeAndNil(Fafter_adp_child_data);
  FreeAndNil(Fafter_adp_birth_act_data);
  inherited Destroy;
end;

destructor marriage.Destroy;
begin
  FreeAndNil(Fmrg_cert_data);
  inherited Destroy;
end;

constructor affiliation_act.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor affiliation_act.Destroy;
begin
  FreeAndNil(Fcover);
  FreeAndNil(Faff_cert_data);
  inherited Destroy;
end;

destructor aff_cert_data.Destroy;
begin
  FreeAndNil(Faff_person);
  FreeAndNil(Fmother_data);
  FreeAndNil(Ffather_data);
  FreeAndNil(Fcourt_decision);
  FreeAndNil(Faff_act_data);
  FreeAndNil(Faff_mother_certificate_data);
          FreeAndNil(Faff_father_certificate_data);
  inherited Destroy;
end;

procedure aff_cert_data.Setaff_mother_certificate_data(Index: Integer; const ADocument: Document);
begin
  Faff_mother_certificate_data := ADocument;
  Faff_mother_certificate_data_Specified := True;
end;

function aff_cert_data.aff_mother_certificate_data_Specified(Index: Integer): boolean;
begin
  Result := Faff_mother_certificate_data_Specified;
end;

procedure aff_cert_data.Setaff_father_certificate_data(Index: Integer; const ADocument: Document);
begin
  Faff_father_certificate_data := ADocument;
  Faff_father_certificate_data_Specified := True;
end;

function aff_cert_data.aff_father_certificate_data_Specified(Index: Integer): boolean;
begin
  Result := Faff_father_certificate_data_Specified;
end;

destructor aff_person.Destroy;
begin
  FreeAndNil(Fbirth_act_data);
  FreeAndNil(Fbefore_aff_person_data);
  FreeAndNil(Fafter_aff_person_data);
  inherited Destroy;
end;

constructor decease_act.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor decease_act.Destroy;
begin
  FreeAndNil(Fcover);
  FreeAndNil(Fdcs_cert_data);
  inherited Destroy;
end;

destructor dcs_cert_data.Destroy;
begin
  FreeAndNil(Fperson_data);
  FreeAndNil(Fdecease_data);
  FreeAndNil(Fdcs_act_data);
  FreeAndNil(Fdcs_certificate_data);
  inherited Destroy;
end;

constructor name_change_act.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor name_change_act.Destroy;
begin
  FreeAndNil(Fcover);
  FreeAndNil(Fcng_cert_data);
  inherited Destroy;
end;

destructor person.Destroy;
begin
  FreeAndNil(Fperson_data);
  FreeAndNil(Fbirth_act_data);
  inherited Destroy;
end;

destructor RequestData.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Fperson_request)-1 do
    FreeAndNil(Fperson_request[I]);
  SetLength(Fperson_request, 0);
  for I := 0 to Length(Fidentif_request)-1 do
    FreeAndNil(Fidentif_request[I]);
  SetLength(Fidentif_request, 0);
  inherited Destroy;
end;

procedure RequestData.Setperson_request(Index: Integer; const AArray_Of_PersonRequest: Array_Of_PersonRequest);
begin
  Fperson_request := AArray_Of_PersonRequest;
  Fperson_request_Specified := True;
end;

function RequestData.person_request_Specified(Index: Integer): boolean;
begin
  Result := Fperson_request_Specified;
end;

procedure RequestData.Setidentif_request(Index: Integer; const AArray_Of_IdentifRequest: Array_Of_IdentifRequest);
begin
  Fidentif_request := AArray_Of_IdentifRequest;
  Fidentif_request_Specified := True;
end;

function RequestData.identif_request_Specified(Index: Integer): boolean;
begin
  Result := Fidentif_request_Specified;
end;

destructor ResponseData.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Fpersonal_data)-1 do
    FreeAndNil(Fpersonal_data[I]);
  SetLength(Fpersonal_data, 0);
  for I := 0 to Length(Fidentif_number)-1 do
    FreeAndNil(Fidentif_number[I]);
  SetLength(Fidentif_number, 0);
  inherited Destroy;
end;

procedure ResponseData.Setpersonal_data(Index: Integer; const AArray_Of_ResponsePerson: Array_Of_ResponsePerson);
begin
  Fpersonal_data := AArray_Of_ResponsePerson;
  Fpersonal_data_Specified := True;
end;

function ResponseData.personal_data_Specified(Index: Integer): boolean;
begin
  Result := Fpersonal_data_Specified;
end;

procedure ResponseData.Setidentif_number(Index: Integer; const AArray_Of_ResponseIdentif: Array_Of_ResponseIdentif);
begin
  Fidentif_number := AArray_Of_ResponseIdentif;
  Fidentif_number_Specified := True;
end;

function ResponseData.identif_number_Specified(Index: Integer): boolean;
begin
  Result := Fidentif_number_Specified;
end;

destructor mrg_cert_data.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Fjoint_child)-1 do
    FreeAndNil(Fjoint_child[I]);
  SetLength(Fjoint_child, 0);
  FreeAndNil(Fbride);
  FreeAndNil(Fbridegroom);
  FreeAndNil(Fmrg_act_data);
  FreeAndNil(Fmrg_certificate_data);
  inherited Destroy;
end;

procedure mrg_cert_data.Setjoint_child(Index: Integer; const AChildList: ChildList);
begin
  Fjoint_child := AChildList;
  Fjoint_child_Specified := True;
end;

function mrg_cert_data.joint_child_Specified(Index: Integer): boolean;
begin
  Result := Fjoint_child_Specified;
end;

destructor dvc_cert_data.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Fjoint_child)-1 do
    FreeAndNil(Fjoint_child[I]);
  SetLength(Fjoint_child, 0);
  FreeAndNil(Fwife);
  FreeAndNil(Fhusband);
  FreeAndNil(Fmrg_act_data);
  FreeAndNil(Fcourt_decision);
  FreeAndNil(Fdvc_act_data);
  FreeAndNil(Fdvc_wm_certificate_data);
  FreeAndNil(Fdvc_mn_certificate_data);
  inherited Destroy;
end;

procedure dvc_cert_data.Setjoint_child(Index: Integer; const AChildList: ChildList);
begin
  Fjoint_child := AChildList;
  Fjoint_child_Specified := True;
end;

function dvc_cert_data.joint_child_Specified(Index: Integer): boolean;
begin
  Result := Fjoint_child_Specified;
end;

destructor cng_cert_data.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Fjoint_child)-1 do
    FreeAndNil(Fjoint_child[I]);
  SetLength(Fjoint_child, 0);
  FreeAndNil(Fperson);
  FreeAndNil(Fcng_act_data);
  FreeAndNil(Fcng_certificate_data);
  inherited Destroy;
end;

procedure cng_cert_data.Setjoint_child(Index: Integer; const AChildList: ChildList);
begin
  Fjoint_child := AChildList;
  Fjoint_child_Specified := True;
end;

function cng_cert_data.joint_child_Specified(Index: Integer): boolean;
begin
  Result := Fjoint_child_Specified;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(ZagsWS), 'http://gisun.agatsystem.by/zags/ws/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ZagsWS), 'urn:%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(ZagsWS), ioDocument);
  InvRegistry.RegisterInvokeOptions(TypeInfo(ZagsWS), ioLiteral);
  //-RemClassRegistry.RegisterXSClass(LangValue, 'http://gisun.agatsystem.by/common/types/', 'LangValue');
  //-RemClassRegistry.RegisterXSInfo(TypeInfo(LangValueList), 'http://gisun.agatsystem.by/common/types/', 'LangValueList');
  //-RemClassRegistry.RegisterXSClass(Classifier, 'http://gisun.agatsystem.by/common/types/', 'Classifier');
  //-RemClassRegistry.RegisterExternalPropName(TypeInfo(Classifier), 'type_', 'type');
  //-RemClassRegistry.RegisterXSClass(Document, 'http://gisun.agatsystem.by/common/types/', 'Document');
  //-RemClassRegistry.RegisterXSClass(ActData, 'http://gisun.agatsystem.by/common/types/', 'ActData');
  //-RemClassRegistry.RegisterXSInfo(TypeInfo(DocumentList), 'http://gisun.agatsystem.by/common/types/', 'DocumentList');
  //-RemClassRegistry.RegisterXSClass(Address, 'http://gisun.agatsystem.by/common/types/', 'Address');
  //-RemClassRegistry.RegisterXSInfo(TypeInfo(AddressList), 'http://gisun.agatsystem.by/common/types/', 'AddressList');
  //-RemClassRegistry.RegisterXSClass(Death, 'http://gisun.agatsystem.by/common/types/', 'Death');
  //-RemClassRegistry.RegisterXSClass(decease_place, 'http://gisun.agatsystem.by/common/types/', 'decease_place');
  //-RemClassRegistry.RegisterXSInfo(TypeInfo(PersonalId), 'http://gisun.agatsystem.by/common/types/', 'PersonalId');
  //-RemClassRegistry.RegisterXSClass(Family, 'http://gisun.agatsystem.by/common/types/', 'Family');
  //-RemClassRegistry.RegisterXSInfo(TypeInfo(FamilyList), 'http://gisun.agatsystem.by/common/types/', 'FamilyList');
  //-RemClassRegistry.RegisterXSClass(PersonalData, 'http://gisun.agatsystem.by/common/types/', 'PersonalData');
  //-RemClassRegistry.RegisterExternalPropName(TypeInfo(PersonalData), 'name_', 'name');
  //-RemClassRegistry.RegisterXSClass(birth_place, 'http://gisun.agatsystem.by/common/types/', 'birth_place');
  //-RemClassRegistry.RegisterXSInfo(TypeInfo(GUID), 'http://gisun.agatsystem.by/common/types/', 'GUID');
  //-RemClassRegistry.RegisterXSInfo(TypeInfo(Id), 'http://gisun.agatsystem.by/common/types/', 'Id');
  //-RemClassRegistry.RegisterXSClass(MessageCover, 'http://gisun.agatsystem.by/common/types/', 'MessageCover');
  //-RemClassRegistry.RegisterXSClass(PersonRequest, 'http://gisun.agatsystem.by/common/ws/', 'PersonRequest');
  //-RemClassRegistry.RegisterXSClass(IdentifRequest, 'http://gisun.agatsystem.by/common/ws/', 'IdentifRequest');
  //-RemClassRegistry.RegisterXSClass(WsError, 'http://gisun.agatsystem.by/common/ws/', 'WsError');
  //-RemClassRegistry.RegisterXSInfo(TypeInfo(ErrorList), 'http://gisun.agatsystem.by/common/ws/', 'ErrorList');
  RemClassRegistry.RegisterXSClass(WsReturnCode, 'http://gisun.agatsystem.by/common/ws/', 'WsReturnCode');
  RemClassRegistry.RegisterSerializeOptions(WsReturnCode, [xoLiteralParam]);
  //-RemClassRegistry.RegisterXSClass(WsException, 'http://gisun.agatsystem.by/common/ws/', 'WsException');
  //-RemClassRegistry.RegisterXSClass(ResponsePerson, 'http://gisun.agatsystem.by/common/ws/', 'ResponsePerson');
  //-RemClassRegistry.RegisterXSClass(ResponseIdentif, 'http://gisun.agatsystem.by/common/ws/', 'ResponseIdentif');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ChildList), 'http://gisun.agatsystem.by/zags/types/', 'ChildList');
  RemClassRegistry.RegisterXSClass(ActReason, 'http://gisun.agatsystem.by/zags/types/', 'ActReason');
  RemClassRegistry.RegisterXSClass(RegisterRequest, 'http://gisun.agatsystem.by/zags/types/', 'RegisterRequest');
  RemClassRegistry.RegisterSerializeOptions(RegisterRequest, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(RegisterResponse, 'http://gisun.agatsystem.by/zags/types/', 'RegisterResponse');
  RemClassRegistry.RegisterSerializeOptions(RegisterResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(MarrFlag), 'http://gisun.agatsystem.by/zags/types/', 'MarrFlag');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ParentsFlag), 'http://gisun.agatsystem.by/zags/types/', 'ParentsFlag');
  RemClassRegistry.RegisterXSClass(birth_act, 'http://gisun.agatsystem.by/zags/types/', 'birth_act');
  RemClassRegistry.RegisterSerializeOptions(birth_act, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(birth_cert_data, 'http://gisun.agatsystem.by/zags/types/', 'birth_cert_data');
  RemClassRegistry.RegisterXSClass(reconstructed_birth_act, 'http://gisun.agatsystem.by/zags/types/', 'reconstructed_birth_act');
  RemClassRegistry.RegisterSerializeOptions(reconstructed_birth_act, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(rcn_birth_cert_data, 'http://gisun.agatsystem.by/zags/types/', 'rcn_birth_cert_data');
  RemClassRegistry.RegisterXSClass(marriage_act, 'http://gisun.agatsystem.by/zags/types/', 'marriage_act');
  RemClassRegistry.RegisterSerializeOptions(marriage_act, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(bride, 'http://gisun.agatsystem.by/zags/types/', 'bride');
  RemClassRegistry.RegisterXSClass(bridegroom, 'http://gisun.agatsystem.by/zags/types/', 'bridegroom');
  RemClassRegistry.RegisterXSClass(divorce_act, 'http://gisun.agatsystem.by/zags/types/', 'divorce_act');
  RemClassRegistry.RegisterSerializeOptions(divorce_act, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(wife, 'http://gisun.agatsystem.by/zags/types/', 'wife');
  RemClassRegistry.RegisterXSClass(husband, 'http://gisun.agatsystem.by/zags/types/', 'husband');
  RemClassRegistry.RegisterXSClass(adoption_act, 'http://gisun.agatsystem.by/zags/types/', 'adoption_act');
  RemClassRegistry.RegisterSerializeOptions(adoption_act, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(adp_cert_data, 'http://gisun.agatsystem.by/zags/types/', 'adp_cert_data');
  RemClassRegistry.RegisterXSClass(adp_child, 'http://gisun.agatsystem.by/zags/types/', 'adp_child');
  RemClassRegistry.RegisterXSClass(before_adp_child, 'http://gisun.agatsystem.by/zags/types/', 'before_adp_child');
  RemClassRegistry.RegisterXSClass(after_adp_child, 'http://gisun.agatsystem.by/zags/types/', 'after_adp_child');
  RemClassRegistry.RegisterXSClass(marriage, 'http://gisun.agatsystem.by/zags/types/', 'marriage');
  RemClassRegistry.RegisterXSClass(affiliation_act, 'http://gisun.agatsystem.by/zags/types/', 'affiliation_act');
  RemClassRegistry.RegisterSerializeOptions(affiliation_act, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(aff_cert_data, 'http://gisun.agatsystem.by/zags/types/', 'aff_cert_data');
  RemClassRegistry.RegisterXSClass(aff_person, 'http://gisun.agatsystem.by/zags/types/', 'aff_person');
  RemClassRegistry.RegisterXSClass(decease_act, 'http://gisun.agatsystem.by/zags/types/', 'decease_act');
  RemClassRegistry.RegisterSerializeOptions(decease_act, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(dcs_cert_data, 'http://gisun.agatsystem.by/zags/types/', 'dcs_cert_data');
  RemClassRegistry.RegisterXSClass(name_change_act, 'http://gisun.agatsystem.by/zags/types/', 'name_change_act');
  RemClassRegistry.RegisterSerializeOptions(name_change_act, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(person, 'http://gisun.agatsystem.by/zags/types/', 'person');
  RemClassRegistry.RegisterXSClass(exception, 'http://gisun.agatsystem.by/zags/types/', 'exception');
  RemClassRegistry.RegisterXSClass(return_code, 'http://gisun.agatsystem.by/zags/types/', 'return_code');
  RemClassRegistry.RegisterXSClass(register_request, 'http://gisun.agatsystem.by/zags/types/', 'register_request');
  RemClassRegistry.RegisterXSClass(register_response, 'http://gisun.agatsystem.by/zags/types/', 'register_response');
  //-RemClassRegistry.RegisterXSClass(value, 'http://gisun.agatsystem.by/common/types/', 'value');
  //-RemClassRegistry.RegisterXSClass(document2, 'http://gisun.agatsystem.by/common/types/', 'document2', 'document');
  //-RemClassRegistry.RegisterXSClass(address2, 'http://gisun.agatsystem.by/common/types/', 'address2', 'address');
  //-RemClassRegistry.RegisterXSClass(relationship, 'http://gisun.agatsystem.by/common/types/', 'relationship');
  //-RemClassRegistry.RegisterXSClass(error, 'http://gisun.agatsystem.by/common/ws/', 'error');
  RemClassRegistry.RegisterXSClass(children, 'http://gisun.agatsystem.by/zags/types/', 'children');
  //-RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_PersonRequest), 'http://gisun.agatsystem.by/common/ws/', 'Array_Of_PersonRequest');
  //-RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_IdentifRequest), 'http://gisun.agatsystem.by/common/ws/', 'Array_Of_IdentifRequest');
  RemClassRegistry.RegisterXSClass(RequestData, 'http://gisun.agatsystem.by/zags/types/', 'RequestData');
  //-RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_ResponsePerson), 'http://gisun.agatsystem.by/common/ws/', 'Array_Of_ResponsePerson');
  //-RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_ResponseIdentif), 'http://gisun.agatsystem.by/common/ws/', 'Array_Of_ResponseIdentif');
  RemClassRegistry.RegisterXSClass(ResponseData, 'http://gisun.agatsystem.by/zags/types/', 'ResponseData');
  RemClassRegistry.RegisterXSClass(mrg_cert_data, 'http://gisun.agatsystem.by/zags/types/', 'mrg_cert_data');
  RemClassRegistry.RegisterXSClass(dvc_cert_data, 'http://gisun.agatsystem.by/zags/types/', 'dvc_cert_data');
  RemClassRegistry.RegisterXSClass(cng_cert_data, 'http://gisun.agatsystem.by/zags/types/', 'cng_cert_data');

end.