// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://agat-system.by:4569/gisun/common/ws?WSDL
//  >Import : http://agat-system.by:4569/gisun/common/ws?WSDL:0
//  >Import : http://agat-system.by:4569/gisun/common/swaRef.xsd
//  >Import : http://agat-system.by:4569/gisun/common/ws?WSDL:1
// Encoding : UTF-8
// Version  : 1.0
// (26.11.2008 18:12:04 - - $Rev: 10138 $)
// ************************************************************************ //

unit wsGisun;
interface
uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, OPConvert;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_ATTR = $0010;
  IS_TEXT = $0020;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:anyURI          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Lit][Gbl]
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:date            - "http://www.w3.org/2001/XMLSchema"[Gbl]

  LangValue            = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  Classifier           = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  Document             = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  ActData              = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  Address              = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  Death                = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  decease_place        = class;                 { "http://gisun.agatsystem.by/common/types/"[Cplx] }
  Family               = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  Citizenship          = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  birth_place          = class;                 { "http://gisun.agatsystem.by/common/types/"[Cplx] }
  MessageCover         = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  PersonRequest        = class;                 { "http://gisun.agatsystem.by/common/ws/"[GblCplx] }
  IdentifRequest       = class;                 { "http://gisun.agatsystem.by/common/ws/"[GblCplx] }
  WsError              = class;                 { "http://gisun.agatsystem.by/common/ws/"[GblCplx] }
  WsException          = class;                 { "http://gisun.agatsystem.by/common/ws/"[Flt][GblCplx] }
  ResponsePerson       = class;                 { "http://gisun.agatsystem.by/common/ws/"[GblCplx] }
  ResponseIdentif      = class;                 { "http://gisun.agatsystem.by/common/ws/"[GblCplx] }
  RegisterRequest      = class;                 { "http://gisun.agatsystem.by/common/ws/"[Lit][GblCplx] }
  RegisterResponse     = class;                 { "http://gisun.agatsystem.by/common/ws/"[Lit][GblCplx] }
  ClassifierInfo       = class;                 { "http://gisun.agatsystem.by/common/ws/"[GblCplx] }
  ClassifierChangeRequest = class;              { "http://gisun.agatsystem.by/common/ws/"[Lit][GblCplx] }
  LexemStatus          = class;                 { "http://gisun.agatsystem.by/common/ws/"[GblCplx] }
  exception            = class;                 { "http://gisun.agatsystem.by/common/ws/"[Flt][GblElm] }
  register_request     = class;                 { "http://gisun.agatsystem.by/common/ws/"[Lit][GblElm] }
  register_response    = class;                 { "http://gisun.agatsystem.by/common/ws/"[Lit][GblElm] }
  classifier_change_request = class;            { "http://gisun.agatsystem.by/common/ws/"[Lit][GblElm] }
  value                = class;                 { "http://gisun.agatsystem.by/common/types/"[Alias] }
  classifier2          = class;                 { "http://gisun.agatsystem.by/common/types/"[Alias] }
  document2            = class;                 { "http://gisun.agatsystem.by/common/types/"[Alias] }
  address2             = class;                 { "http://gisun.agatsystem.by/common/types/"[Alias] }
  death2               = class;                 { "http://gisun.agatsystem.by/common/types/"[Alias] }
  relationship         = class;                 { "http://gisun.agatsystem.by/common/types/"[Alias] }
  citizenship2         = class;                 { "http://gisun.agatsystem.by/common/types/"[Alias] }
  error                = class;                 { "http://gisun.agatsystem.by/common/ws/"[Alias] }
  classifierInfo2      = class;                 { "http://gisun.agatsystem.by/common/ws/"[Alias] }
  lexemStatus2         = class;                 { "http://gisun.agatsystem.by/common/ws/"[Alias] }
  PersonalData         = class;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  RequestData          = class;                 { "http://gisun.agatsystem.by/common/ws/"[GblCplx] }
  ResponseData         = class;                 { "http://gisun.agatsystem.by/common/ws/"[GblCplx] }

  ///Ссылка на вложение типа  swaRef MIME Attachments
  swaRef          =  type WideString;      { "http://ws-i.org/profiles/basic/1.1/xsd"[GblSmpl] }


  // ************************************************************************ //
  // XML       : LangValue, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Значение, зависящее от языка
  LangValue = class(TRemotable)
  private
    FText: WideString;
    ///Язык передаваемого значения
    Flang: WideString;
  published
    property Text: WideString  Index (IS_TEXT) read FText write FText;
    property lang: WideString  Index (IS_ATTR) read Flang write Flang;
  end;

  ///Список значений, зависящее от языка
  LangValueList = array of value;               { "http://gisun.agatsystem.by/common/types/"[GblCplx] }

  ///Список классификаторов
  ClassifierList = array of classifier2;        { "http://gisun.agatsystem.by/common/types/"[Lit][GblCplx] }


  // ************************************************************************ //
  // XML       : Classifier, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Классификатор
  Classifier = class(TRemotable)
  private
    ///Кодовое значение
    Fcode: WideString;
    Fcode_Specified: boolean;
    ///Тип классификатора
    Ftype_: Integer;
    Ftype__Specified: boolean;
    ///Список лексем
    Flexema: LangValueList;
    Flexema_Specified: boolean;
    ///Признак активности
    Factive: Boolean;
    Factive_Specified: boolean;
    ///Дата формирования
    Fbegin_date: TXSDateTime;
    Fbegin_date_Specified: boolean;
    ///Дата упразднения
    Fend_date: TXSDateTime;
    Fend_date_Specified: boolean;
    ///Список родительских классификаторов
    Fparents: ClassifierList;
    Fparents_Specified: boolean;
    procedure Setcode(Index: Integer; const AWideString: WideString);
    function  code_Specified(Index: Integer): boolean;
    procedure Settype_(Index: Integer; const AInteger: Integer);
    function  type__Specified(Index: Integer): boolean;
    procedure Setlexema(Index: Integer; const ALangValueList: LangValueList);
    function  lexema_Specified(Index: Integer): boolean;
    procedure Setactive(Index: Integer; const ABoolean: Boolean);
    function  active_Specified(Index: Integer): boolean;
    procedure Setbegin_date(Index: Integer; const ATXSDateTime: TXSDateTime);
    function  begin_date_Specified(Index: Integer): boolean;
    procedure Setend_date(Index: Integer; const ATXSDateTime: TXSDateTime);
    function  end_date_Specified(Index: Integer): boolean;
    procedure Setparents(Index: Integer; const AClassifierList: ClassifierList);
    function  parents_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property code:       WideString      Index (IS_OPTN) read Fcode write Setcode stored code_Specified;
    property type_:      Integer         Index (IS_OPTN) read Ftype_ write Settype_ stored type__Specified;
    property lexema:     LangValueList   Index (IS_OPTN) read Flexema write Setlexema stored lexema_Specified;
    property active:     Boolean         Index (IS_OPTN) read Factive write Setactive stored active_Specified;
    property begin_date: TXSDateTime     Index (IS_OPTN) read Fbegin_date write Setbegin_date stored begin_date_Specified;
    property end_date:   TXSDateTime     Index (IS_OPTN) read Fend_date write Setend_date stored end_date_Specified;
    property parents:    ClassifierList  Index (IS_OPTN) read Fparents write Setparents stored parents_Specified;
  end;



  // ************************************************************************ //
  // XML       : Document, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Документ, удостоверяющий личность
  Document = class(TRemotable)
  private
    ///Тип доступа
    Faccess: Classifier;
    Faccess_Specified: boolean;
    ///Тип документа
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
    ///Признак действительного документа
    Factive: Boolean;
    Factive_Specified: boolean;
    procedure Setaccess(Index: Integer; const AClassifier: Classifier);
    function  access_Specified(Index: Integer): boolean;
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
    procedure Setactive(Index: Integer; const ABoolean: Boolean);
    function  active_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property access:        Classifier  Index (IS_OPTN) read Faccess write Setaccess stored access_Specified;
    property document_type: Classifier  Index (IS_OPTN) read Fdocument_type write Setdocument_type stored document_type_Specified;
    property authority:     Classifier  Index (IS_OPTN) read Fauthority write Setauthority stored authority_Specified;
    property date_of_issue: TXSDate     Index (IS_OPTN) read Fdate_of_issue write Setdate_of_issue stored date_of_issue_Specified;
    property expire_date:   TXSDate     Index (IS_OPTN) read Fexpire_date write Setexpire_date stored expire_date_Specified;
    property series:        WideString  Index (IS_OPTN) read Fseries write Setseries stored series_Specified;
    property number:        WideString  Index (IS_OPTN) read Fnumber write Setnumber stored number_Specified;
    property act_data:      ActData     Index (IS_OPTN) read Fact_data write Setact_data stored act_data_Specified;
    property active:        Boolean     Index (IS_OPTN) read Factive write Setactive stored active_Specified;
  end;



  // ************************************************************************ //
  // XML       : ActData, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Информация об актовой записи
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

  ///Список документов
  DocumentList = array of document2;            { "http://gisun.agatsystem.by/common/types/"[GblCplx] }


  // ************************************************************************ //
  // XML       : Address, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Адрес
  Address = class(TRemotable)
  private
    ///Тип доступа
    Faccess: Classifier;
    Faccess_Specified: boolean;
    ///Страна
    Fcountry: Classifier;
    Fcountry_Specified: boolean;
    ///Область
    Farea: Classifier;
    Farea_Specified: boolean;
    ///Район
    Fregion: Classifier;
    Fregion_Specified: boolean;
    //Сельский совет
    Fsoviet: Classifier;
    Fsoviet_Specified: boolean;
    ///Тип населенного пункта
    Flocality_type: Classifier;
    Flocality_type_Specified: boolean;
    ///Населенный пункт
    Flocality: Classifier;
    Flocality_Specified: boolean;
    //Район города
    Fcity_region: Classifier;
    Fcity_region_Specified: boolean;
    ///Тип улицы
    Fstreet_type: Classifier;
    Fstreet_type_Specified: boolean;
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
    ///Признак действительного документа
    Factive: Boolean;
    Factive_Specified: boolean;
    procedure Setaccess(Index: Integer; const AClassifier: Classifier);
    function  access_Specified(Index: Integer): boolean;
    procedure Setcountry(Index: Integer; const AClassifier: Classifier);
    function  country_Specified(Index: Integer): boolean;
    procedure Setarea(Index: Integer; const AClassifier: Classifier);
    function  area_Specified(Index: Integer): boolean;
    procedure Setregion(Index: Integer; const AClassifier: Classifier);
    function  region_Specified(Index: Integer): boolean;
    procedure Setsoviet(Index: Integer; const AClassifier: Classifier);
    function  soviet_Specified(Index: Integer): boolean;
    procedure Setlocality_type(Index: Integer; const AClassifier: Classifier);
    function  locality_type_Specified(Index: Integer): boolean;
    procedure Setlocality(Index: Integer; const AClassifier: Classifier);
    function  locality_Specified(Index: Integer): boolean;
    procedure Setcity_region(Index: Integer; const AClassifier: Classifier);
    function  city_region_Specified(Index: Integer): boolean;
    procedure Setstreet_type(Index: Integer; const AClassifier: Classifier);
    function  street_type_Specified(Index: Integer): boolean;
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
    procedure Setactive(Index: Integer; const ABoolean: Boolean);
    function  active_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property access:        Classifier  Index (IS_OPTN) read Faccess write Setaccess stored access_Specified;
    property country:       Classifier  Index (IS_OPTN) read Fcountry write Setcountry stored country_Specified;
    property area:          Classifier  Index (IS_OPTN) read Farea write Setarea stored area_Specified;
    property region:        Classifier  Index (IS_OPTN) read Fregion write Setregion stored region_Specified;
    property soviet:        Classifier  Index (IS_OPTN) read Fsoviet write Setsoviet stored soviet_Specified;
    property locality_type: Classifier  Index (IS_OPTN) read Flocality_type write Setlocality_type stored locality_type_Specified;
    property locality:      Classifier  Index (IS_OPTN) read Flocality write Setlocality stored locality_Specified;
    property city_region:   Classifier  Index (IS_OPTN) read Fcity_region write Setcity_region stored city_region_Specified;
    property street_type:   Classifier  Index (IS_OPTN) read Fstreet_type write Setstreet_type stored street_type_Specified;
    property street:        Classifier  Index (IS_OPTN) read Fstreet write Setstreet stored street_Specified;
    property house:         WideString  Index (IS_OPTN) read Fhouse write Sethouse stored house_Specified;
    property building:      WideString  Index (IS_OPTN) read Fbuilding write Setbuilding stored building_Specified;
    property flat:          WideString  Index (IS_OPTN) read Fflat write Setflat stored flat_Specified;
    property reg_date:      TXSDate     Index (IS_OPTN) read Freg_date write Setreg_date stored reg_date_Specified;
    property active:        Boolean     Index (IS_OPTN) read Factive write Setactive stored active_Specified;
  end;

  ///Список адресов
  AddressList = array of address2;              { "http://gisun.agatsystem.by/common/types/"[GblCplx] }


  // ************************************************************************ //
  // XML       : Death, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Информация о смерти
  Death = class(TRemotable)
  private
    ///Тип доступа
    Faccess: Classifier;
    Faccess_Specified: boolean;
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
    ///Признак активности
    Factive: Boolean;
    Factive_Specified: boolean;
    procedure Setaccess(Index: Integer; const AClassifier: Classifier);
    function  access_Specified(Index: Integer): boolean;
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
    procedure Setactive(Index: Integer; const ABoolean: Boolean);
    function  active_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property access:        Classifier     Index (IS_OPTN) read Faccess write Setaccess stored access_Specified;
    property death_cause:   Classifier     Index (IS_OPTN) read Fdeath_cause write Setdeath_cause stored death_cause_Specified;
    property death_date:    WideString     Index (IS_OPTN) read Fdeath_date write Setdeath_date stored death_date_Specified;
    property decease_place: decease_place  Index (IS_OPTN) read Fdecease_place write Setdecease_place stored decease_place_Specified;
    property death_place:   WideString     Index (IS_OPTN) read Fdeath_place write Setdeath_place stored death_place_Specified;
    property burial_place:  WideString     Index (IS_OPTN) read Fburial_place write Setburial_place stored burial_place_Specified;
    property active:        Boolean        Index (IS_OPTN) read Factive write Setactive stored active_Specified;
  end;



  // ************************************************************************ //
  // XML       : decease_place, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Место смерти
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

  ///Список данных о смерти
  DeathList  = array of death2;                 { "http://gisun.agatsystem.by/common/types/"[GblCplx] }
  PersonalId      =  type WideString;      { "http://gisun.agatsystem.by/common/types/"[GblSmpl] }


  // ************************************************************************ //
  // XML       : Family, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  Family = class(TRemotable)
  private
    ///Тип доступа
    Faccess: Classifier;
    Faccess_Specified: boolean;
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
    ///Признак активности
    Factive: Boolean;
    Factive_Specified: boolean;
    procedure Setaccess(Index: Integer; const AClassifier: Classifier);
    function  access_Specified(Index: Integer): boolean;
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
    procedure Setactive(Index: Integer; const ABoolean: Boolean);
    function  active_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property access:       Classifier   Index (IS_OPTN) read Faccess write Setaccess stored access_Specified;
    property relationship: Classifier   Index (IS_OPTN) read Frelationship write Setrelationship stored relationship_Specified;
    property is_owner:     Boolean      Index (IS_OPTN) read Fis_owner write Setis_owner stored is_owner_Specified;
    property rel_id:       PersonalId   Index (IS_OPTN) read Frel_id write Setrel_id stored rel_id_Specified;
    property begin_date:   TXSDateTime  Index (IS_OPTN) read Fbegin_date write Setbegin_date stored begin_date_Specified;
    property end_date:     TXSDateTime  Index (IS_OPTN) read Fend_date write Setend_date stored end_date_Specified;
    property active:       Boolean      Index (IS_OPTN) read Factive write Setactive stored active_Specified;
  end;

  ///Список семейных связей
  FamilyList = array of relationship;           { "http://gisun.agatsystem.by/common/types/"[GblCplx] }


  // ************************************************************************ //
  // XML       : Citizenship, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Информация о гражданстве
  Citizenship = class(TRemotable)
  private
    ///Тип доступа
    Faccess: Classifier;
    Faccess_Specified: boolean;
    ///Основание изменения гражданства
    Fcitizenship_change: Classifier;
    Fcitizenship_change_Specified: boolean;
    ///Дата изменения гражданства
    Fdate_citizenship: TXSDateTime;
    Fdate_citizenship_Specified: boolean;
    ///Признак активности
    Factive: Boolean;
    Factive_Specified: boolean;
    procedure Setaccess(Index: Integer; const AClassifier: Classifier);
    function  access_Specified(Index: Integer): boolean;
    procedure Setcitizenship_change(Index: Integer; const AClassifier: Classifier);
    function  citizenship_change_Specified(Index: Integer): boolean;
    procedure Setdate_citizenship(Index: Integer; const ATXSDateTime: TXSDateTime);
    function  date_citizenship_Specified(Index: Integer): boolean;
    procedure Setactive(Index: Integer; const ABoolean: Boolean);
    function  active_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property access:             Classifier   Index (IS_OPTN) read Faccess write Setaccess stored access_Specified;
    property citizenship_change: Classifier   Index (IS_OPTN) read Fcitizenship_change write Setcitizenship_change stored citizenship_change_Specified;
    property date_citizenship:   TXSDateTime  Index (IS_OPTN) read Fdate_citizenship write Setdate_citizenship stored date_citizenship_Specified;
    property active:             Boolean      Index (IS_OPTN) read Factive write Setactive stored active_Specified;
  end;

  ///Список данных о гражданстве
  CitizenshipList = array of citizenship2;      { "http://gisun.agatsystem.by/common/types/"[GblCplx] }


  // ************************************************************************ //
  // XML       : birth_place, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Место рождения
  birth_place = class(TRemotable)
  private
    ///Страна рождения
    Fcountry_b: Classifier;
    Fcountry_b_Specified: boolean;
    ///Область рождения
    Farea_b: WideString;
    Farea_b_Specified: boolean;
    ///Область рождения
    Farea_b_bel: WideString;
    Farea_b_bel_Specified: boolean;
    ///Район рождения
    Fregion_b: WideString;
    Fregion_b_Specified: boolean;
    ///Район рождения
    Fregion_b_bel: WideString;
    Fregion_b_bel_Specified: boolean;
    ///Тип населённого пункта рождения
    Ftype_city_b: Classifier;
    Ftype_city_b_Specified: boolean;
    ///Населённый пункт рождения
    Fcity_b: WideString;
    Fcity_b_Specified: boolean;
    ///Населённый пункт рождения
    Fcity_b_bel: WideString;
    Fcity_b_bel_Specified: boolean;
    ///АТЕ рождения
    Fcity_b_ate: Classifier;
    Fcity_b_ate_Specified: boolean;

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

    procedure Setcity_b_ate(Index: Integer; const AClassifier: Classifier);
    function  city_b_ate_Specified(Index: Integer): boolean;
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
    // vadim  29.06.2012
    property city_b_ate:   Classifier  Index (IS_OPTN) read Fcity_b_ate write Setcity_b_ate stored city_b_ate_Specified;

  end;

  GUID            =  type WideString;      { "http://gisun.agatsystem.by/common/types/"[GblSmpl] }
  ///Внутренний идентификатор
  Id              =  type GUID;      { "http://gisun.agatsystem.by/common/types/"[GblSmpl] }


  // ************************************************************************ //
  // XML       : MessageCover, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Сопроводительная информация к сообщению
  MessageCover = class(TRemotable)
  private
    ///Идентификатор сообщения
    Fmessage_id: Id;
    ///Тип сообщения
    Fmessage_type: Classifier;
    ///Время отправки сообщения
    Fmessage_time: TXSDateTime;
    ///Источник сообщения
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



  // ************************************************************************ //
  // XML       : PersonRequest, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  ///Запрос на получение персональных данных
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



  // ************************************************************************ //
  // XML       : IdentifRequest, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  ///Запрос на получение идентификационного номера
  IdentifRequest = class(TRemotable)
  private
    ///Идентификатор запроса
    Frequest_id: Id;
    ///Пол
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



  // ************************************************************************ //
  // XML       : WsError, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  ///Информация об ошибке
  WsError = class(TRemotable)
  private
    ///Тип ошибки
    Ferror_code: Classifier;
    ///Место возникновения ошибки
    Ferror_place: WideString;
    Ferror_place_Specified: boolean;
    ///Неправильное значение
    Fwrong_value: WideString;
    Fwrong_value_Specified: boolean;
    ///Правильное значение
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

  ///Сведения об ошибках
  ErrorList  = array of error;                  { "http://gisun.agatsystem.by/common/ws/"[GblCplx] }


  // ************************************************************************ //
  // XML       : WsException, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // Info      : Fault
  // ************************************************************************ //
  ///Ошибка, возвращаемая сервисом
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



  // ************************************************************************ //
  // XML       : ResponsePerson, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  ///Персональные данные человека
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



  // ************************************************************************ //
  // XML       : ResponseIdentif, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  ///Сгенерированный идентификационный номер
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



  // ************************************************************************ //
  // XML       : RegisterRequest, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  ///Запрос на получение данных из ГИС РН
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
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  ///Ответ на запрос
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
  // XML       : ClassifierInfo, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  ///Данные классификатора
  ClassifierInfo = class(TRemotable)
  private
    ///Тип классификатора
    Ftype_: Integer;
    ///Дата последнего изменения
    Fdate: TXSDateTime;
  public
    destructor Destroy; override;
  published
    property type_: Integer      read Ftype_ write Ftype_;
    property date:  TXSDateTime  read Fdate write Fdate;
  end;

  ///Список данных классификатора
  ClassifierInfoList = array of classifierInfo2;   { "http://gisun.agatsystem.by/common/ws/"[Lit][GblCplx] }


  // ************************************************************************ //
  // XML       : ClassifierChangeRequest, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  ///Запрос изменений выбранного классификатора, произошедшие с указанной даты
  ClassifierChangeRequest = class(TRemotable)
  private
    ///Тип классификатора
    Ftype_: Integer;
    ///Дата начиная с которой будут возращены измениния
    Fdate: TXSDateTime;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property type_: Integer      read Ftype_ write Ftype_;
    property date:  TXSDateTime  read Fdate write Fdate;
  end;



  // ************************************************************************ //
  // XML       : LexemStatus, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  ///Список лексем с признаком активности
  LexemStatus = class(TRemotable)
  private
    ///Список лексем
    Flexema: LangValueList;
    Flexema_Specified: boolean;
    ///Признак активности
    Factive: Boolean;
    Factive_Specified: boolean;
    procedure Setlexema(Index: Integer; const ALangValueList: LangValueList);
    function  lexema_Specified(Index: Integer): boolean;
    procedure Setactive(Index: Integer; const ABoolean: Boolean);
    function  active_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property lexema: LangValueList  Index (IS_OPTN) read Flexema write Setlexema stored lexema_Specified;
    property active: Boolean        Index (IS_OPTN) read Factive write Setactive stored active_Specified;
  end;

  ///Список списков лексем с признаком активности
  LexemStatusList = array of lexemStatus2;      { "http://gisun.agatsystem.by/common/ws/"[Lit][GblCplx] }

  // ************************************************************************ //
  // XML       : exception, global, <element>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // Info      : Fault
  // ************************************************************************ //
  exception = class(WsException)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : register_request, global, <element>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // Info      : Wrapper
  // ************************************************************************ //
  register_request = class(RegisterRequest)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : register_response, global, <element>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // Info      : Wrapper
  // ************************************************************************ //
  register_response = class(RegisterResponse)
  private
  published
  end;

  classifier_info_list =  type ClassifierInfoList;      { "http://gisun.agatsystem.by/common/ws/"[Lit][GblElm] }

  lexem_status_list =  type LexemStatusList;      { "http://gisun.agatsystem.by/common/ws/"[Lit][GblElm] }


  // ************************************************************************ //
  // XML       : classifier_change_request, global, <element>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // Info      : Wrapper
  // ************************************************************************ //
  classifier_change_request = class(ClassifierChangeRequest)
  private
  published
  end;

  classifier_change_response =  type ClassifierList;      { "http://gisun.agatsystem.by/common/ws/"[Lit][GblElm] }

  select_classifier =  type Integer;      { "http://gisun.agatsystem.by/common/ws/"[Lit][GblElm] }


  // ************************************************************************ //
  // XML       : value, alias
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  value = class(LangValue)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : classifier, alias
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  classifier2 = class(Classifier)
  private
  published
  end;


  // ************************************************************************ //
  // XML       : document, alias
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  document2 = class(Document)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : address, alias
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  address2 = class(Address)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : death, alias
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  death2 = class(Death)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : relationship, alias
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  relationship = class(Family)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : citizenship, alias
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  citizenship2 = class(Citizenship)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : error, alias
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  error = class(WsError)
  private
  published
  end;

  // ************************************************************************ //
  // XML       : classifierInfo, alias
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  classifierInfo2 = class(ClassifierInfo)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : lexemStatus, alias
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  lexemStatus2 = class(LexemStatus)
  private
  published
  end;

  Array_Of_swaRef = array of swaRef;            { "http://ws-i.org/profiles/basic/1.1/xsd"[GblUbnd] }


  // ************************************************************************ //
  // XML       : PersonalData, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/types/
  // ************************************************************************ //
  ///Персональные данные
  PersonalData = class(TRemotable)
  private
    ///Тип доступа
    Faccess: Classifier;
    Faccess_Specified: boolean;
    ///Персональный номер
    Fidentif: PersonalId;
    Fidentif_Specified: boolean;
    ///Фамилия
    Flast_name: WideString;
    Flast_name_Specified: boolean;
    ///Фамилия белорусская
    Flast_name_bel: WideString;
    Flast_name_bel_Specified: boolean;
    ///Фамилия латинская
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
    Fstatus: Classifier;
    Fstatus_Specified: boolean;
    ///???
    Faddresses: AddressList;
    Faddresses_Specified: boolean;
    ///???
    Fdocuments: DocumentList;
    Fdocuments_Specified: boolean;
    ///???
    Ffamily: FamilyList;
    Ffamily_Specified: boolean;
    ///???
    Fdeaths: DeathList;
    Fdeaths_Specified: boolean;
    ///???
    Fcitizenships: CitizenshipList;
    Fcitizenships_Specified: boolean;
    ///???
    Fphotos: Array_Of_swaRef;
    Fphotos_Specified: boolean;
    procedure Setaccess(Index: Integer; const AClassifier: Classifier);
    function  access_Specified(Index: Integer): boolean;
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
    procedure Setdeaths(Index: Integer; const ADeathList: DeathList);
    function  deaths_Specified(Index: Integer): boolean;
    procedure Setcitizenships(Index: Integer; const ACitizenshipList: CitizenshipList);
    function  citizenships_Specified(Index: Integer): boolean;
    procedure Setphotos(Index: Integer; const AArray_Of_swaRef: Array_Of_swaRef);
    function  photos_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property access:         Classifier       Index (IS_OPTN) read Faccess write Setaccess stored access_Specified;
    property identif:        PersonalId       Index (IS_OPTN) read Fidentif write Setidentif stored identif_Specified;
    property last_name:      WideString       Index (IS_OPTN) read Flast_name write Setlast_name stored last_name_Specified;
    property last_name_bel:  WideString       Index (IS_OPTN) read Flast_name_bel write Setlast_name_bel stored last_name_bel_Specified;
    property last_name_lat:  WideString       Index (IS_OPTN) read Flast_name_lat write Setlast_name_lat stored last_name_lat_Specified;
    property name_:          WideString       Index (IS_OPTN) read Fname_ write Setname_ stored name__Specified;
    property name_bel:       WideString       Index (IS_OPTN) read Fname_bel write Setname_bel stored name_bel_Specified;
    property name_lat:       WideString       Index (IS_OPTN) read Fname_lat write Setname_lat stored name_lat_Specified;
    property patronymic:     WideString       Index (IS_OPTN) read Fpatronymic write Setpatronymic stored patronymic_Specified;
    property patronymic_bel: WideString       Index (IS_OPTN) read Fpatronymic_bel write Setpatronymic_bel stored patronymic_bel_Specified;
    property patronymic_lat: WideString       Index (IS_OPTN) read Fpatronymic_lat write Setpatronymic_lat stored patronymic_lat_Specified;
    property sex:            Classifier       Index (IS_OPTN) read Fsex write Setsex stored sex_Specified;
    property birth_day:      WideString       Index (IS_OPTN) read Fbirth_day write Setbirth_day stored birth_day_Specified;
    property birth_place:    birth_place      Index (IS_OPTN) read Fbirth_place write Setbirth_place stored birth_place_Specified;
    property citizenship:    Classifier       Index (IS_OPTN) read Fcitizenship write Setcitizenship stored citizenship_Specified;
    property status:         Classifier       Index (IS_OPTN) read Fstatus write Setstatus stored status_Specified;
    property addresses:      AddressList      Index (IS_OPTN) read Faddresses write Setaddresses stored addresses_Specified;
    property documents:      DocumentList     Index (IS_OPTN) read Fdocuments write Setdocuments stored documents_Specified;
    property family:         FamilyList       Index (IS_OPTN) read Ffamily write Setfamily stored family_Specified;
    property deaths:         DeathList        Index (IS_OPTN) read Fdeaths write Setdeaths stored deaths_Specified;
    property citizenships:   CitizenshipList  Index (IS_OPTN) read Fcitizenships write Setcitizenships stored citizenships_Specified;
    property photos:         Array_Of_swaRef  Index (IS_OPTN or IS_UNBD) read Fphotos write Setphotos stored photos_Specified;
  end;

  Array_Of_PersonRequest = array of PersonRequest;   { "http://gisun.agatsystem.by/common/ws/"[GblUbnd] }
  Array_Of_IdentifRequest = array of IdentifRequest;   { "http://gisun.agatsystem.by/common/ws/"[GblUbnd] }


  // ************************************************************************ //
  // XML       : RequestData, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  ///Список запросов в ГИС РН
  RequestData = class(TRemotable)
  private
    ///Запрос на генерацию нового идентификационного номера
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

  Array_Of_ResponsePerson = array of ResponsePerson;   { "http://gisun.agatsystem.by/common/ws/"[GblUbnd] }
  Array_Of_ResponseIdentif = array of ResponseIdentif;   { "http://gisun.agatsystem.by/common/ws/"[GblUbnd] }


  // ************************************************************************ //
  // XML       : ResponseData, global, <complexType>
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // ************************************************************************ //
  ///Список ответов из ГИС РН
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
  // Namespace : http://gisun.agatsystem.by/common/ws/
  // soapAction: urn:%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : GisunCommonBinding
  // service   : GisunCommonWs
  // port      : ws
  // URL       : http://agat-system.by:4569/gisun/common/ws
  // ************************************************************************ //
  GisunCommonWs = interface(IInvokable)
  ['{8376C465-EEE5-5C07-6122-E246CC192C2C}']
    function  getPersonalData(const registerRequest: register_request): register_response; stdcall;
    function  getClassifierEditDateList: classifier_info_list; stdcall;
    function  getLexemStatus(const lexemStatusRequest: select_classifier): lexem_status_list; stdcall;
    function  getClassifierChange(const classifierChangeRequest: classifier_change_request): classifier_change_response; stdcall;
  end;

function GetGisunWs(Addr, Proxy: string; RIO: THTTPRIO): GisunCommonWs;

implementation
  uses SysUtils;

function GetGisunWs(Addr, Proxy: string; RIO: THTTPRIO): GisunCommonWs;
begin
   Result := nil;
   if Addr<>'' then begin
      RIO.Converter.Options:=[soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soDocument, soDontSendEmptyNodes, soCacheMimeResponse, soLiteralParams, soUTF8EncodeXML];
      RIO.URL:=Addr;
      RIO.HTTPWebNode.Proxy:=Proxy;
      Result:=(RIO as GisunCommonWs);
   end;
end;

destructor Classifier.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Flexema)-1 do
    FreeAndNil(Flexema[I]);
  SetLength(Flexema, 0);
  for I := 0 to Length(Fparents)-1 do
    FreeAndNil(Fparents[I]);
  SetLength(Fparents, 0);
  FreeAndNil(Fbegin_date);
  FreeAndNil(Fend_date);
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

procedure Classifier.Setactive(Index: Integer; const ABoolean: Boolean);
begin
  Factive := ABoolean;
  Factive_Specified := True;
end;

function Classifier.active_Specified(Index: Integer): boolean;
begin
  Result := Factive_Specified;
end;

procedure Classifier.Setbegin_date(Index: Integer; const ATXSDateTime: TXSDateTime);
begin
  Fbegin_date := ATXSDateTime;
  Fbegin_date_Specified := True;
end;

function Classifier.begin_date_Specified(Index: Integer): boolean;
begin
  Result := Fbegin_date_Specified;
end;

procedure Classifier.Setend_date(Index: Integer; const ATXSDateTime: TXSDateTime);
begin
  Fend_date := ATXSDateTime;
  Fend_date_Specified := True;
end;

function Classifier.end_date_Specified(Index: Integer): boolean;
begin
  Result := Fend_date_Specified;
end;

procedure Classifier.Setparents(Index: Integer; const AClassifierList: ClassifierList);
begin
  Fparents := AClassifierList;
  Fparents_Specified := True;
end;

function Classifier.parents_Specified(Index: Integer): boolean;
begin
  Result := Fparents_Specified;
end;

destructor Document.Destroy;
begin
  FreeAndNil(Faccess);
  FreeAndNil(Fdocument_type);
  FreeAndNil(Fauthority);
  FreeAndNil(Fdate_of_issue);
  FreeAndNil(Fexpire_date);
  FreeAndNil(Fact_data);
  inherited Destroy;
end;

procedure Document.Setaccess(Index: Integer; const AClassifier: Classifier);
begin
  Faccess := AClassifier;
  Faccess_Specified := True;
end;

function Document.access_Specified(Index: Integer): boolean;
begin
  Result := Faccess_Specified;
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

procedure Document.Setactive(Index: Integer; const ABoolean: Boolean);
begin
  Factive := ABoolean;
  Factive_Specified := True;
end;

function Document.active_Specified(Index: Integer): boolean;
begin
  Result := Factive_Specified;
end;

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

destructor Address.Destroy;
begin
  FreeAndNil(Faccess);
  FreeAndNil(Fcountry);
  FreeAndNil(Farea);
  FreeAndNil(Fregion);
  FreeAndNil(Fsoviet);
  FreeAndNil(Flocality_type);
  FreeAndNil(Fcity_region);
  FreeAndNil(Flocality);
  FreeAndNil(Fstreet_type);
  FreeAndNil(Fstreet);
  FreeAndNil(Freg_date);
  inherited Destroy;
end;

procedure Address.Setaccess(Index: Integer; const AClassifier: Classifier);
begin
  Faccess := AClassifier;
  Faccess_Specified := True;
end;

function Address.access_Specified(Index: Integer): boolean;
begin
  Result := Faccess_Specified;
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

procedure Address.Setsoviet(Index: Integer; const AClassifier: Classifier);
begin
  Fsoviet := AClassifier;
  Fsoviet_Specified := True;
end;

function Address.soviet_Specified(Index: Integer): boolean;
begin
  Result := Fsoviet_Specified;
end;

procedure Address.Setlocality_type(Index: Integer; const AClassifier: Classifier);
begin
  Flocality_type := AClassifier;
  Flocality_type_Specified := True;
end;

function Address.locality_type_Specified(Index: Integer): boolean;
begin
  Result := Flocality_type_Specified;
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

procedure Address.Setcity_region(Index: Integer; const AClassifier: Classifier);
begin
  Fcity_region := AClassifier;
  Fcity_region_Specified := True;
end;

function Address.city_region_Specified(Index: Integer): boolean;
begin
  Result := Fcity_region_Specified;
end;

procedure Address.Setstreet_type(Index: Integer; const AClassifier: Classifier);
begin
  Fstreet_type := AClassifier;
  Fstreet_type_Specified := True;
end;

function Address.street_type_Specified(Index: Integer): boolean;
begin
  Result := Fstreet_type_Specified;
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

procedure Address.Setactive(Index: Integer; const ABoolean: Boolean);
begin
  Factive := ABoolean;
  Factive_Specified := True;
end;

function Address.active_Specified(Index: Integer): boolean;
begin
  Result := Factive_Specified;
end;

destructor Death.Destroy;
begin
  FreeAndNil(Faccess);
  FreeAndNil(Fdeath_cause);
  FreeAndNil(Fdecease_place);
  inherited Destroy;
end;

procedure Death.Setaccess(Index: Integer; const AClassifier: Classifier);
begin
  Faccess := AClassifier;
  Faccess_Specified := True;
end;

function Death.access_Specified(Index: Integer): boolean;
begin
  Result := Faccess_Specified;
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

procedure Death.Setactive(Index: Integer; const ABoolean: Boolean);
begin
  Factive := ABoolean;
  Factive_Specified := True;
end;

function Death.active_Specified(Index: Integer): boolean;
begin
  Result := Factive_Specified;
end;

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

destructor Family.Destroy;
begin
  FreeAndNil(Faccess);
  FreeAndNil(Frelationship);
  FreeAndNil(Fbegin_date);
  FreeAndNil(Fend_date);
  inherited Destroy;
end;

procedure Family.Setaccess(Index: Integer; const AClassifier: Classifier);
begin
  Faccess := AClassifier;
  Faccess_Specified := True;
end;

function Family.access_Specified(Index: Integer): boolean;
begin
  Result := Faccess_Specified;
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

procedure Family.Setactive(Index: Integer; const ABoolean: Boolean);
begin
  Factive := ABoolean;
  Factive_Specified := True;
end;

function Family.active_Specified(Index: Integer): boolean;
begin
  Result := Factive_Specified;
end;

destructor Citizenship.Destroy;
begin
  FreeAndNil(Faccess);
  FreeAndNil(Fcitizenship_change);
  FreeAndNil(Fdate_citizenship);
  inherited Destroy;
end;

procedure Citizenship.Setaccess(Index: Integer; const AClassifier: Classifier);
begin
  Faccess := AClassifier;
  Faccess_Specified := True;
end;

function Citizenship.access_Specified(Index: Integer): boolean;
begin
  Result := Faccess_Specified;
end;

procedure Citizenship.Setcitizenship_change(Index: Integer; const AClassifier: Classifier);
begin
  Fcitizenship_change := AClassifier;
  Fcitizenship_change_Specified := True;
end;

function Citizenship.citizenship_change_Specified(Index: Integer): boolean;
begin
  Result := Fcitizenship_change_Specified;
end;

procedure Citizenship.Setdate_citizenship(Index: Integer; const ATXSDateTime: TXSDateTime);
begin
  Fdate_citizenship := ATXSDateTime;
  Fdate_citizenship_Specified := True;
end;

function Citizenship.date_citizenship_Specified(Index: Integer): boolean;
begin
  Result := Fdate_citizenship_Specified;
end;

procedure Citizenship.Setactive(Index: Integer; const ABoolean: Boolean);
begin
  Factive := ABoolean;
  Factive_Specified := True;
end;

function Citizenship.active_Specified(Index: Integer): boolean;
begin
  Result := Factive_Specified;
end;

destructor birth_place.Destroy;
begin
  FreeAndNil(Fcountry_b);
  FreeAndNil(Ftype_city_b);
  FreeAndNil(Fcity_b_ate);
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

procedure birth_place.Setcity_b_ate(Index: Integer; const AClassifier: Classifier);
begin
  Fcity_b_ate := AClassifier;
  Fcity_b_ate_Specified := True;
end;

function birth_place.city_b_ate_Specified(Index: Integer): boolean;
begin
  Result := Fcity_b_ate_Specified;
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

destructor PersonRequest.Destroy;
begin
  FreeAndNil(Fdocument);
  inherited Destroy;
end;

destructor IdentifRequest.Destroy;
begin
  FreeAndNil(Fsex);
  inherited Destroy;
end;

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

destructor ResponsePerson.Destroy;
begin
  FreeAndNil(Fdata);
  inherited Destroy;
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
destructor ClassifierInfo.Destroy;
begin
  FreeAndNil(Fdate);
  inherited Destroy;
end;

constructor ClassifierChangeRequest.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor ClassifierChangeRequest.Destroy;
begin
  FreeAndNil(Fdate);
  inherited Destroy;
end;

destructor LexemStatus.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Flexema)-1 do
    FreeAndNil(Flexema[I]);
  SetLength(Flexema, 0);
  inherited Destroy;
end;

procedure LexemStatus.Setlexema(Index: Integer; const ALangValueList: LangValueList);
begin
  Flexema := ALangValueList;
  Flexema_Specified := True;
end;

function LexemStatus.lexema_Specified(Index: Integer): boolean;
begin
  Result := Flexema_Specified;
end;

procedure LexemStatus.Setactive(Index: Integer; const ABoolean: Boolean);
begin
  Factive := ABoolean;
  Factive_Specified := True;
end;

function LexemStatus.active_Specified(Index: Integer): boolean;
begin
  Result := Factive_Specified;
end;


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
  for I := 0 to Length(Fdeaths)-1 do
    FreeAndNil(Fdeaths[I]);
  SetLength(Fdeaths, 0);
  for I := 0 to Length(Fcitizenships)-1 do
    FreeAndNil(Fcitizenships[I]);
  SetLength(Fcitizenships, 0);
  FreeAndNil(Faccess);
  FreeAndNil(Fsex);
  FreeAndNil(Fbirth_place);
  FreeAndNil(Fcitizenship);
  FreeAndNil(Fstatus);
  inherited Destroy;
end;

procedure PersonalData.Setaccess(Index: Integer; const AClassifier: Classifier);
begin
  Faccess := AClassifier;
  Faccess_Specified := True;
end;

function PersonalData.access_Specified(Index: Integer): boolean;
begin
  Result := Faccess_Specified;
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

procedure PersonalData.Setdeaths(Index: Integer; const ADeathList: DeathList);
begin
  Fdeaths := ADeathList;
  Fdeaths_Specified := True;
end;

function PersonalData.deaths_Specified(Index: Integer): boolean;
begin
  Result := Fdeaths_Specified;
end;

procedure PersonalData.Setcitizenships(Index: Integer; const ACitizenshipList: CitizenshipList);
begin
  Fcitizenships := ACitizenshipList;
  Fcitizenships_Specified := True;
end;

function PersonalData.citizenships_Specified(Index: Integer): boolean;
begin
  Result := Fcitizenships_Specified;
end;

procedure PersonalData.Setphotos(Index: Integer; const AArray_Of_swaRef: Array_Of_swaRef);
begin
  Fphotos := AArray_Of_swaRef;
  Fphotos_Specified := True;
end;

function PersonalData.photos_Specified(Index: Integer): boolean;
begin
  Result := Fphotos_Specified;
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

initialization
  InvRegistry.RegisterInterface(TypeInfo(GisunCommonWs), 'http://gisun.agatsystem.by/common/ws/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(GisunCommonWs), 'urn:%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(GisunCommonWs), ioDocument);
  InvRegistry.RegisterInvokeOptions(TypeInfo(GisunCommonWs), ioLiteral);
  RemClassRegistry.RegisterXSInfo(TypeInfo(swaRef), 'http://ws-i.org/profiles/basic/1.1/xsd', 'swaRef');
  RemClassRegistry.RegisterXSClass(LangValue, 'http://gisun.agatsystem.by/common/types/', 'LangValue');
  RemClassRegistry.RegisterXSInfo(TypeInfo(LangValueList), 'http://gisun.agatsystem.by/common/types/', 'LangValueList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ClassifierList), 'http://gisun.agatsystem.by/common/types/', 'ClassifierList');
  RemClassRegistry.RegisterSerializeOptions(TypeInfo(ClassifierList), [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(Classifier, 'http://gisun.agatsystem.by/common/types/', 'Classifier');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(Classifier), 'type_', 'type');
  RemClassRegistry.RegisterXSClass(Document, 'http://gisun.agatsystem.by/common/types/', 'Document');
  RemClassRegistry.RegisterXSClass(ActData, 'http://gisun.agatsystem.by/common/types/', 'ActData');
  RemClassRegistry.RegisterXSInfo(TypeInfo(DocumentList), 'http://gisun.agatsystem.by/common/types/', 'DocumentList');
  RemClassRegistry.RegisterXSClass(Address, 'http://gisun.agatsystem.by/common/types/', 'Address');
  RemClassRegistry.RegisterXSInfo(TypeInfo(AddressList), 'http://gisun.agatsystem.by/common/types/', 'AddressList');
  RemClassRegistry.RegisterXSClass(Death, 'http://gisun.agatsystem.by/common/types/', 'Death');
  RemClassRegistry.RegisterXSClass(decease_place, 'http://gisun.agatsystem.by/common/types/', 'decease_place');
  RemClassRegistry.RegisterXSInfo(TypeInfo(DeathList), 'http://gisun.agatsystem.by/common/types/', 'DeathList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(PersonalId), 'http://gisun.agatsystem.by/common/types/', 'PersonalId');
  RemClassRegistry.RegisterXSClass(Family, 'http://gisun.agatsystem.by/common/types/', 'Family');
  RemClassRegistry.RegisterXSInfo(TypeInfo(FamilyList), 'http://gisun.agatsystem.by/common/types/', 'FamilyList');
  RemClassRegistry.RegisterXSClass(Citizenship, 'http://gisun.agatsystem.by/common/types/', 'Citizenship');
  RemClassRegistry.RegisterXSInfo(TypeInfo(CitizenshipList), 'http://gisun.agatsystem.by/common/types/', 'CitizenshipList');
  RemClassRegistry.RegisterXSClass(birth_place, 'http://gisun.agatsystem.by/common/types/', 'birth_place');
  RemClassRegistry.RegisterXSInfo(TypeInfo(GUID), 'http://gisun.agatsystem.by/common/types/', 'GUID');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Id), 'http://gisun.agatsystem.by/common/types/', 'Id');
  RemClassRegistry.RegisterXSClass(MessageCover, 'http://gisun.agatsystem.by/common/types/', 'MessageCover');
  RemClassRegistry.RegisterXSClass(PersonRequest, 'http://gisun.agatsystem.by/common/ws/', 'PersonRequest');
  RemClassRegistry.RegisterXSClass(IdentifRequest, 'http://gisun.agatsystem.by/common/ws/', 'IdentifRequest');
  RemClassRegistry.RegisterXSClass(WsError, 'http://gisun.agatsystem.by/common/ws/', 'WsError');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ErrorList), 'http://gisun.agatsystem.by/common/ws/', 'ErrorList');
  RemClassRegistry.RegisterXSClass(WsException, 'http://gisun.agatsystem.by/common/ws/', 'WsException');
  RemClassRegistry.RegisterXSClass(ResponsePerson, 'http://gisun.agatsystem.by/common/ws/', 'ResponsePerson');
  RemClassRegistry.RegisterXSClass(ResponseIdentif, 'http://gisun.agatsystem.by/common/ws/', 'ResponseIdentif');
  RemClassRegistry.RegisterXSClass(RegisterRequest, 'http://gisun.agatsystem.by/common/ws/', 'RegisterRequest');
  RemClassRegistry.RegisterSerializeOptions(RegisterRequest, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(RegisterResponse, 'http://gisun.agatsystem.by/common/ws/', 'RegisterResponse');
  RemClassRegistry.RegisterSerializeOptions(RegisterResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(ClassifierInfo, 'http://gisun.agatsystem.by/common/ws/', 'ClassifierInfo');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ClassifierInfo), 'type_', 'type');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ClassifierInfoList), 'http://gisun.agatsystem.by/common/ws/', 'ClassifierInfoList');
  RemClassRegistry.RegisterSerializeOptions(TypeInfo(ClassifierInfoList), [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(ClassifierChangeRequest, 'http://gisun.agatsystem.by/common/ws/', 'ClassifierChangeRequest');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ClassifierChangeRequest), 'type_', 'type');
  RemClassRegistry.RegisterSerializeOptions(ClassifierChangeRequest, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(LexemStatus, 'http://gisun.agatsystem.by/common/ws/', 'LexemStatus');
  RemClassRegistry.RegisterXSInfo(TypeInfo(LexemStatusList), 'http://gisun.agatsystem.by/common/ws/', 'LexemStatusList');
  RemClassRegistry.RegisterSerializeOptions(TypeInfo(LexemStatusList), [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(exception, 'http://gisun.agatsystem.by/common/ws/', 'exception');
  RemClassRegistry.RegisterXSClass(register_request, 'http://gisun.agatsystem.by/common/ws/', 'register_request');
  RemClassRegistry.RegisterXSClass(register_response, 'http://gisun.agatsystem.by/common/ws/', 'register_response');
  RemClassRegistry.RegisterXSInfo(TypeInfo(classifier_info_list), 'http://gisun.agatsystem.by/common/ws/', 'classifier_info_list');
  RemClassRegistry.RegisterXSInfo(TypeInfo(lexem_status_list), 'http://gisun.agatsystem.by/common/ws/', 'lexem_status_list');
  RemClassRegistry.RegisterXSClass(classifier_change_request, 'http://gisun.agatsystem.by/common/ws/', 'classifier_change_request');
  RemClassRegistry.RegisterXSInfo(TypeInfo(classifier_change_response), 'http://gisun.agatsystem.by/common/ws/', 'classifier_change_response');
  RemClassRegistry.RegisterXSInfo(TypeInfo(select_classifier), 'http://gisun.agatsystem.by/common/ws/', 'select_classifier');
  RemClassRegistry.RegisterXSClass(value, 'http://gisun.agatsystem.by/common/types/', 'value');
  RemClassRegistry.RegisterXSClass(classifier2, 'http://gisun.agatsystem.by/common/types/', 'classifier2', 'classifier');
  RemClassRegistry.RegisterXSClass(document2, 'http://gisun.agatsystem.by/common/types/', 'document2', 'document');
  RemClassRegistry.RegisterXSClass(address2, 'http://gisun.agatsystem.by/common/types/', 'address2', 'address');
  RemClassRegistry.RegisterXSClass(death2, 'http://gisun.agatsystem.by/common/types/', 'death2', 'death');
  RemClassRegistry.RegisterXSClass(relationship, 'http://gisun.agatsystem.by/common/types/', 'relationship');
  RemClassRegistry.RegisterXSClass(citizenship2, 'http://gisun.agatsystem.by/common/types/', 'citizenship2', 'citizenship');
  RemClassRegistry.RegisterXSClass(error, 'http://gisun.agatsystem.by/common/ws/', 'error');
  RemClassRegistry.RegisterXSClass(classifierInfo2, 'http://gisun.agatsystem.by/common/ws/', 'classifierInfo2', 'classifierInfo');
  RemClassRegistry.RegisterXSClass(lexemStatus2, 'http://gisun.agatsystem.by/common/ws/', 'lexemStatus2', 'lexemStatus');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_swaRef), 'http://ws-i.org/profiles/basic/1.1/xsd', 'Array_Of_swaRef');
  RemClassRegistry.RegisterXSClass(PersonalData, 'http://gisun.agatsystem.by/common/types/', 'PersonalData');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(PersonalData), 'name_', 'name');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_PersonRequest), 'http://gisun.agatsystem.by/common/ws/', 'Array_Of_PersonRequest');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_IdentifRequest), 'http://gisun.agatsystem.by/common/ws/', 'Array_Of_IdentifRequest');
  RemClassRegistry.RegisterXSClass(RequestData, 'http://gisun.agatsystem.by/common/ws/', 'RequestData');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_ResponsePerson), 'http://gisun.agatsystem.by/common/ws/', 'Array_Of_ResponsePerson');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_ResponseIdentif), 'http://gisun.agatsystem.by/common/ws/', 'Array_Of_ResponseIdentif');
  RemClassRegistry.RegisterXSClass(ResponseData, 'http://gisun.agatsystem.by/common/ws/', 'ResponseData');

end.