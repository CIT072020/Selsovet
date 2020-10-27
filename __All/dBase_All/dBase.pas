// ALL      LAIS/ZAGS/OCHERED/GKH/LAIS.SMDO
unit dBase;

interface

{$I Task.inc}

{$WARN UNIT_PLATFORM OFF}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ShellAPI, ace,uCheckKod,
  DataTask, adsset, adstable, Db, adsdata, adsfunc, adscnnct, Metatask, OpisEdit, uFindBase, frxClass, frxADSComponents,
  {$IFDEF SMDO}
    uSMDO,
  {$ENDIF}
  ROPasScript, dbFunc, FuncPr, kbmMemTable, SasaIniFile, FileCtrl, adsdictionary, adsUtils, StrUtils, uTypes,
  {$IFDEF OBR_GRAG}  mDoc2Sel, {$ENDIF}
  {$IFDEF GISUN} uGisun, {$ENDIF}
  ifpii_dbfunc, uUtilFiles, uPadegFIO, uProject, uProjectAll, fmChList, ZipForge, math, DateUtils
 {$IFDEF VER150} ,Variants {$ENDIF}  ;


type

  TLich = record
    ID       : Integer;
    Nomer    : String;
    FirstFIO : String;
    FirstID  : Integer;
    AdresID  : Integer;
    Present  : Boolean;
    CanDelete: Boolean;
  end;
  TArrLich = array of TLich;

  TAktRogd = record
    Nomer  : String;
    Date   : TDateTime;
    Mesto  : String;
    SOATO  : String;
    Gosud  : String;
    Obl    : String;
    Raion  : String;
    Gorod  : String;
    Gorod_R : String;
    B_RESP   : Boolean;
    B_OBL    : Boolean;
    B_Gorod  : String;
    ONA_Familia  : String;
    ONA_Name     : String;
    ONA_Otch     : String;
    ONA_SOATO    : String;
    ONA_Gosud    : String;
    ONA_Obl      : String;
    ONA_Raion    : String;
    ONA_Gorod    : String;
    ONA_Gorod_R   : String;
    ONA_DateR    : String;
    ONA_Nation   : String;
    ONA_Obraz    : String;
    ONA_Grag     : String;
    ONA_Dokument : String;
    ONA_B_RESP   : Boolean;
    ONA_B_OBL    : Boolean;
    ONA_B_Gorod  : String;
  end;
  TLastDvig = record
    MenID    : String;
    DateFiks : TDateTime;
    Date     : TDateTime;
    TypeMigr : Integer;
    Contant  : Boolean;
    DateSrok : TDateTime;
    Prich    : String;
    PrichKod : Integer;
    Komm     : String;
    B_Obl : Boolean;
    Obl   : String;
    Rn    : String;
    B_Punkt : Integer;
    Punkt : String;
  end;

  TValueProp = record
    Name  : String;
    Value : Variant;
  end;
  TArrValuesProp = array of TValueProp;

  TRelation = class(TObject)
    FList : TList;
    FList2: TList;
  private
    function GetCount: Integer;
    function GetItem(I: Integer): TAdsTAble;
  public
    Kod : String;
    MainTable : TAdsTable;
    procedure AddTable( tb : TAdsTable );
    property Count: Integer read GetCount;
    property Item[I: Integer]: TAdsTAble read GetItem; default;

    procedure AddSimpleTable( tb : TAdsTable );
    function SimpleTable(i:Integer): TAdsTable;
    function CountSimpleTable:Integer;

    constructor Create( tb : TAdsTable);
    destructor Destroy; override;                      
  end;
  TRelations = class(TObject)
    FList : TList;
  private
    function GetCount: Integer;
    function GetItem(I: Integer): TRelation;
  public
    function AddNew( tb : TAdsTable ) : TRelation;
    property Count: Integer read GetCount;
    property Item[I: Integer]: TRelation read GetItem; default;
    constructor Create;
    destructor Destroy; override;
  end;

  TdmBase = class(TdmTask)
    SprSoato: TAdsTable;
    SprPunkt: TAdsTable;
    LookUpSoatoSovet: TAdsTable;
    SprStran: TAdsTable;
    SprNac: TAdsTable;
    SprLgot: TAdsTable;
    SprTypeUl: TAdsTable;
    SprUL: TAdsTable;
    tbLich: TAdsTable;
    tbAdres: TAdsTable;
    tbMens: TAdsTable;
    tbMensDvig: TAdsTable;
    tbAllDokums: TAdsTable;
    sprEdIzm: TAdsTable;
    tbPropMemo: TAdsTable;
    tbProp: TAdsTable;
    SprPrNasel: TAdsTable;
    SprPrLich: TAdsTable;
    tbMensPr: TAdsTable;
    tbMensLgot: TAdsTable;
    tbLichPr: TAdsTable;
    SprOtnosh: TAdsTable;
    SprUchZaved: TAdsTable;
    SprWork: TAdsTable;
    SprDolg: TAdsTable;
    SprTypePens: TAdsTable;
    SprTypeMigr: TAdsTable;
    SprMatSten: TAdsTable;
    SprPrSozd: TAdsTable;
    SprPrLikv: TAdsTable;
    SprTypeHouse: TAdsTable;
    tbDelObj: TAdsTable;
    tbPassports: TAdsTable;
    tbPaspChildren: TAdsTable;
    tbPaspOsnov: TAdsTable;
    tbZapisBrak: TAdsTable;
    tbZapisRogd: TAdsTable;
    tbZapisSmert: TAdsTable;
    tbZapisUstOtc: TAdsTable;
    tbTalonPrib: TAdsTable;
    tbTalonPribDeti: TAdsTable;
    SprIst: TAdsTable;
    tbTalonUbit: TAdsTable;
    tbTalonUbitDeti: TAdsTable;
    tbNalogi: TAdsTable;
    SprNalogi: TAdsTable;
    SprNames: TAdsTable;
    LookUpCitizen: TAdsTable;
    LookupObl: TAdsTable;
    SvidPovtor: TAdsTable;
    SvidSeria: TAdsTable;
    LookupRN: TAdsTable;
    SprPredst: TAdsTable;
    LookupGorod: TAdsTable;
    LookupRnGor: TAdsTable;
    tbDeclBrak: TAdsTable;
    tbBigHouse: TAdsTable;
    TypePunkt: TAdsTable;
    SprTypeDok: TAdsTable;
    SprVoenkom: TAdsTable;
    LookUpPunkt: TAdsQuery;
    LookupUL: TAdsQuery;
    SprRovd: TAdsTable;
    tbOchered: TAdsTable;
    tbSostavSem: TAdsTable;
    SprPostOch: TAdsTable;
    SprSnOch: TAdsTable;
    tbVUS: TAdsTable;
    LockTypeObj: TAdsTable;
    tbDokuments: TAdsTable;
    WorkQueryS: TAdsQuery;
    SprMKB10: TAdsTable;
    LookUpDocMain: TAdsQuery;
    LookUpSMDOCode: TAdsQuery;
    tbUpdObj: TAdsTable;
  private
    FLastDvigMen : TLastDvig;
    FCurDate : TDateTime;
    FMainBase:Integer;
    FDistributeBase:Boolean;
    FIdBase:Integer;
    FCountZnack:Integer;
  public
    //----- обращения граждан ------------
      //таблицы
      DocMain: TAdsTable;
      DocLink: TAdsTable;
      DocWork: TAdsTable;
      DocFile: TAdsTable;
      //справочники
      SprDocFileList: TAdsTable;
      SprDocFolder: TAdsTable;
      SprDocManGroup: TAdsTable;
      SprDocOfficial: TAdsTable;
      SprDocSubj: TAdsTable;
      SprDocSubjG: TAdsTable;
      SprDocGroup: TAdsTable;
      SprDocAdmProc: TAdsTable;{+}
      SprDocAdmProcU: TAdsTable;{+}

    //-------------------------------------

    // дополнительные таблицы создаваемые вручную
    SprGragd     : TAdsTable;
    SprNamesM    : TAdsTable;
    SprNamesG    : TAdsTable;
    SprPrichSm   : TAdsTable;
//    SprDokLic    : TAdsTable;
    SprIzbUch    : TAdsTable;
    SprIzbUch2   : TAdsTable;
    SprKomiss    : TAdsTable;
    SprOsobOtm   : TAdsTable;
    SprPropHouse : TAdsTable;
    SprPerevod   : TAdsTable;
    SprAddBuild  : TAdsTable;
    ListP        : TAdsTable;

    ListSvid     : TAdsTable;

    tbSimpleProp : TAdsTable;
    tbSimplePropMemo : TAdsTable;
//    tbPasportViza : TAdsTable;
//    tbDokuments   : TAdsTable;
//    SprOwners     : TAdsTable;
    tbHouseProps  : TAdsTable;
    tbHouseOwners : TAdsTable;
    tbHouseOwnersHist : TAdsTable;

    {$IFDEF GKH}
      SprGES   : TAdsTable;
      tbResh : TAdsTable;
    {$ENDIF}
    {$IFDEF LAIS}
      tbResh : TAdsTable;
    {$ENDIF}

    {$IFDEF ADD_ZAH}
      AktZ : TAdsTable;
      SprZAH : TAdsTable;
      SysSprZAH : TAdsTable;
      SprRazmer: TAdsTable;
    {$ENDIF}

    {$IFDEF ADD_OPEKA}
      tbZapisOpeka:TAdsTable;
    {$ENDIF}

    {$IFDEF ZAGS}
      PredZapis:TAdsTable;
      DeclareTermMarriage : TAdsTable;
      tbZapisRast: TAdsTable;
      tbZapisAdopt: TAdsTable;
      tbZapisChName: TAdsTable;
      tbZapisUstMat: TAdsTable;

      AlfavitZAGS   : TAdsTable;
      AddDokZAGS : TAdsTable;
      SprRnGorod : TAdsTable;
      tbDeclChName :TAdsTable;
      tbDeclIzm :TAdsTable;
    {$ENDIF}

    {$IF Defined(ZAGS) or Defined(LAIS) }
      GurnalRegistr : TAdsTable;
      SprWriteDecl : TAdsTable;
    {$IFEND}

    {$IFNDEF ZAGS}
      tbOcheredResh : TAdsTable;
      tbMensSobst : TAdsTable;
      SprLgotOch : TAdsTable;
    {$ENDIF}
    {$IFDEF OCHERED}
      tbJurnOper:TAdsTable;
// !!!     SprGSK : TAdsTable;
    {$ENDIF}
    AteSys : TAdsTable;
    {$IFDEF GISUN}
      AllSprGISUN : TAdsTable;
      Log : TAdsTable;
    {$ENDIF}

    {$IFDEF SMDO}
      SMDOPost: TAdsTable;
      SMDOTask: TAdsTable;
      SMDOMens: TAdsTable;
      SMDOFile: TAdsTable;
      SMDOSprOrg: TAdsTable;
      SMDOSprVidDok : TAdsTable;
    {$ENDIF}

    DeclareRegistr : TAdsTable;

    SprZAGS       : TAdsTable;

    SprSklon      : TAdsTable;
    SprRodsName   : TAdsTable;
    RunSpr        : TAdsTable;
    RunSprUser    : TAdsTable;

    Shablon       : TAdsTable;
    SprFamily     : TAdsTable;
    tbHistoryZAGS : TAdsTable;
    tbMensAdd     : TAdsTable;

    {$IFDEF GISUN}
      MessageGISUN : TAdsTable;
    {$ENDIF}

    ArrHouseProp : TArrValuesProp;
    HouseProp_ID       : Integer;
    HouseProp_DateFiks : TDateTime;

    FLastAdresUpper:Boolean;
    FSeekID : Integer;
    FAteSS:Integer;
    FCheckEmptySoato:Boolean;

    Adres_Strana:String;
    Adres_Obl : String;
    Adres_Raion : String;
    Adres_PunktKod: Integer;  // код нас. пункта
    Adres_PunktTN: String;   // наименование типа нас пункта
    Adres_PunktTK: Integer;  // код типа нас пункта
    Adres_PunktN: String;    // наименование без типа нас пункта
    Adres_Punkt : String;    // наименование с типом нас. пункта
    Adres_IsGorod : Boolean;
    Adres_Gorod : String;
    Adres_Selo  : String;
    Adres_UL    : String;
    Adres_UlKod : Integer;
    Adres_TypeUlKod : Integer;   // код типа улицы
    Adres_PunktUl: String;
    Adres_NotDom: Boolean;
    Adres_NDom  : String;
    Adres_Dom   : String;
    Adres_Dom2  : String;
    Adres_UlDom : String;
    Adres_Korp  : String;
    Adres_NKv   : String;
    Adres_Kv    : String;
    Adres_Etag  : String;
    Adres_Kol_Etag : String;
    Adres_Predst : String;
    Adres_Control: String;
    Adres_UseGilfond: String;
    Adres_ID     : Integer;
    Adres_LicID  : Integer;
    Adres_NameHouse:String;
    Adres_RnGor:Integer;
    Adres_RnGorName:String;
    Adres_Private:Boolean;
    Adres_SpecUch:Boolean;
    Adres_Propis:Boolean;
    Adres_Result:String;
    Adres_OnlyText:Boolean;

    SavedAdres:TAdres;

    RelationMens  : TRelation;
    RelationLich  : TRelation;
    RelationAdres : TRelation;

    ListTablesSost : TList;
    SprRazdel   : TkbmMemTable;
    SprProperty : TkbmMemTable;
    Relations   : TRelations;
    FirstDatePrixodSvidZAGS : TDateTime;

    LastErrorDelete : String;  // последняя ошибка возникшая при удалении документа

    SprMainBase : TStringList; // справочники главной базы
    function EnableEditSpr(strName : String) : Boolean;

    function CheckDeleteMen(DateFiks : TDateTime; nId : Integer; var strErr : String; strFIO:String) : Boolean;
    function DeleteFromBaseFilter:Boolean;
    function DeletePunkt(v : Variant; Conn:TAdsConnection; lFromSpr:Boolean; lDelFreeMen:Boolean) : Boolean;
    //----------- для скрипта -----------
    function ReadPropAsFloat(DateFiks : TDateTime; nKodObj : Integer;
                                    strKodProp : String) : Extended;
    function ReadPropAsString(DateFiks : TDateTime; nKodObj : Integer;
                                    strKodProp : String) : String;
    function ReadPropAsText(DateFiks : TDateTime; nKodObj : Integer;
                                    strKodProp : String) : String;
    function ReadPropAsInteger(DateFiks : TDateTime; nKodObj : Integer;
                                    strKodProp : String) : Integer;
    function ReadPropAsBoolean(DateFiks : TDateTime; nKodObj : Integer;
                                    strKodProp : String; ldef : Boolean) : Boolean;
    function ReadPropAsDate(DateFiks : TDateTime; nKodObj : Integer;
                                    strKodProp : String) : TDateTime;
    //-----------------------------------
    function ReadOneProp(DateFiks : TDateTime; nKodObj : Integer;  strKodProp : String; ft : TFieldType ) : Variant;
    procedure ReadPropFields(nTypeObj : Integer; strRazdel : String; dDateFiks : TDateTime; nKodObj : Integer; ds : TDataSet; var lErr : Boolean);

    function ReadAllProp(dDateFiks:TDateTime; nKodObj:Integer; var lErr:Boolean) : TCurrentRecord;


    function WriteValueProp(strKodProp:String; Value:Variant; DateFiks:TDateTime; nKodObj:Integer;
                            nTypeObj:Integer; nDataType:TFieldType) : Boolean;

    function WriteFieldProp(DateFiks : TDateTime; strKodProp : String; fld : TField;
                  nKodObj: Integer; nTypeObj : Integer; nDataType : TFieldType): Boolean;
    function WriteProp(DateFiks : TDateTime; nKodObj : Integer; //+scr
                      dsSource : TDataSet; strKodProp : String;
                      nTypeObj : Integer) : Boolean;
    function DeleteProp(DateFiks: TDateTime; nKodObj: Integer;
                      strKodProp : String; ft : TFieldType) : Boolean;

    function DeletePropSimpleDok(strID : String; nTypeDok : Integer; sPokaz:String='') : Boolean;
//------------------------------------------------------------------------
   function ReadPropSimpleDok(nTypeObj : Integer; nKodObj : Integer; DateSave : TDateTime; strKodProp : String; ft : TFieldType ) : Variant;
   function WritePropSimpleDok(nTypeObj : Integer; nKodObj: Integer; DateSave: TDateTime; strKodProp : String; fld : TField; sVal:String=''; nDataType:TFieldType=ftUnknown): Boolean;
   function ErasePropSimpleDok(nTypeObj : Integer; nKodObj: Integer; strKodProp : String): Boolean;

//------------------------------------------------------------------------
    function LastSvidPovtor(nTypeDok:Integer; strID:Integer; strFormat:String) : String;

    function GetDateCurrentSost : TDateTime;
    function HouseLic(DateFiks:TDateTime; IdAdres:Integer) : String;
//    function HouseOwners2(DateFiks: TDateTime; strIdAdres: String; nType : Integer; tbOwners:TDataSet) : String;
    function HouseOwners_old(DateFiks:TDateTime; strIdAdres:String; obj:TObject; nType:Integer) : String;
    function HouseOwners(DateFiks : TDateTime; strIdAdres : String; obj : TObject; nType : Integer; tbOwnersExternal:TDataSet; tbMens:TDataSet; slPar:TStringList) : String;

    procedure SaveGlobalAdres;
    procedure RestGlobalAdres;
    function GlobalAdresToRec:TAdres;
    procedure RecAdresToGlobal(adr:TAdres);
    procedure ClearGlobalAdres;
    function AdresAsRecord(DateFiks : TDateTime; strID : String; lNameIsNotDom:Boolean; lOnlyAdres:Boolean): TAdres;
    function AdresFromID(DateFiks : TDateTime; strID : String; lNameIsNotDom:Boolean=true) : String;
    function AdresFromIDEx(DateFiks : TDateTime; strID : String; lNameIsNotDom:Boolean; lOnlyText:Boolean) : String;
//    function AdresLic(DateFiks : TDateTime; strID : String ) : TAdres;
    function AdresFromMensAdd(strID:String; var adr :TAdres; ds:TDataSet):Boolean;
    function SimpleAdresMen(strID: String; sType:String): String;
    function AdresMen(DateFiks : TDateTime; strID : String; var strName : String; lSet:Boolean=false; lCheckAdresPropis:Boolean=false ) : TAdres;
//    function AdresPropisMen(DateFiks: TDateTime; strID: String): String;
    function AdresPropisFromAdres(adr:TAdres; lAll:Boolean):String;
    function GetTailAdres(strType: String): String;  // можно вызывать после AdresPropisMen

    function getMenWork(DateFiks : TDateTime; strID : String) : String;
    function getMenDolg(DateFiks : TDateTime; strID : String) : String;
    function getMenStud(DateFiks : TDateTime; strID : String) : String;
    function getMenDvig(DateFiks : TDateTime; strID : String; strRazd:String) : String;
    function GetMenFields( DateFiks : TDateTime; strID : String; strParams:String; var arrRec: TCurrentRecord):Boolean;

    function SostavSemToStr(strID: String; strType:String; strRazd:String) : String;
    function GetReshOch(nIDResh:Integer): TReshOchMen;
    function FillReshOch(resh:TReshOchMen; nIDResh:Integer): Boolean;
    function GetReshOch_(resh:TReshOchMen; nIDResh:Integer): Boolean;
    function GetLastReshOch(resh:TReshOchMen; nID:Integer; nOch:Integer; dDate:TDateTime): Boolean;
    function GetRealNomerOch(nBase:Integer; nTypeOchered:Integer; nID:Integer):Integer;
    function GetRealNomerOchEx(nBase:Integer; nTypeOchered:Integer; nID:Integer; dDecDate:TDateTime; dDecTime:TDateTime; nSimple:Integer; nOldNomer:Integer):Integer;

    function GetCountDeti(strID:String; strPol:String; Vozr1,Vozr2:Integer; lOnlyLic:Boolean; lNotPasport:Boolean):Integer;
    function GetDeti(dsDeti:TDataSet; strID:String; strPol:String; Vozr1,Vozr2:Integer; lOnlyLic:Boolean; lNotPasport:Boolean; nTypeAktRogd:Integer=0):Boolean;
    function LicOsnov(nID:Integer): String;
    function CheckCloseLic(nIDLic:Integer; nIDMen:Integer; dDateLikv:TDateTime; var sSoob:String): Boolean;


    // создать наименование района
    function CreateNameRaion( strRaion,strPadeg : String) : String;
    // создать наименование области из типа области и наименования
    function CreateNameObl(fldB, fldN : TField; strLang : String): String;
    function NameObl(strName : String; nType : Integer; strLang : String) : String;
    function IsAddTypeObl(strName : String) : Boolean;

    // вернуть место рождения человека(nTypeMest=0) или откуда прибыл(nTypeMest=1) из таблицы НаселениеДоп или из миграции
    function GetMestoMen(nTypeMest:Integer; strID : String; lFull : Boolean; nOrder : Integer; dsMigr:TDataSet): String;
    function GetMestoFromFields(ds:TDataSet; strFields:String; lFull:Boolean;nOrder:Integer):String;
    function GetMestoFromFieldsEx(ds:TDataSet; strFields:String):TAdres;

    function getGrag(strSeek:String): String;
    function getNation(strSeek:String;strField:String): String;

    function CheckWriteOtkudaPrib(ds:TDataSet):Boolean;

    function AdresOwner(DateFiks : TDateTime; strID : String; nType : Integer; var strName : String; var lPropis : Boolean) : String;

    function GetNamePasport(n : Integer; sLang:String='R') : String;
    function GetMenPasp(DateFiks: TDateTime; strID: String; nType:Integer): String;
    function GetMenPaspV(UdostKod:Integer; Seria,Nomer,Organ,LichNomer : String;  DateV : TDateTime; nType:Integer): String;
    function PasportToText(Pasport : TPassport; nType : Integer=0) : String;
    function PasportFromValues(UdostKod:Integer; Seria,Nomer,Organ,LichNomer : String;
                               DateV : Variant): TPassport;
    function PasportMen(DateFiks: TDateTime; strID: String): TPassport;
    function FIOMen(DateFiks: TDateTime; strID: String; strRazd:String=' '): String;
    function ReadFamiliaHistoty(strID: String; strRazd:String): String;
    function WriteFamiliaHistoty(strID: String; strFamilia,strNewFamilia:String; dDate:TDateTime; strGruppa:String): Boolean;
    function GetHistory(nTypeObj:Integer;nID:Integer;sField:String;nType:Integer;sRazd:String):String;
    function CopyMen(DateFiks: TDateTime; strID: String;  strNewLic: String; strNewAdres:String; dDateUbit:TDateTime; lSaveDvig:Boolean) : Integer;
    function AktRogdMen(strNomerAkt: String; dDateAkt : TDateTime) : TAktRogd;

    function DeclareBrakToAkt(sl:TStringList; strSeriaSvid,strNomerSvid:String; nNomer:Integer; dDateZ:TDateTime; nLenSoato:Integer; nIdRukov,nIdSpec:Integer):Boolean;  // заявление о браке в а/з
    function DeclareRastToAkt(sl:TStringList; strSeriaSvid,strNomerSvid:String; nNomer:Integer; dDateZ:TDateTime; nLenSoato:Integer; nIdRukov,nIdSpec:Integer): Boolean;

    function CheckSprOtnosh(strName:String):Integer;
    function GetOtnoshMen(nID:Integer):String;

    function CheckRunMen(nTypeObj:Integer; nType:Integer; nID:Integer; var recID:TID; lSaveSost:Boolean=false): Boolean;

    function CheckSprAdmProc(sType:String):Boolean;
    function CheckSprTematic(sType:String):Boolean;

    function GetTypePunkt( strType : String; strLF : String; var strName : String ) : Integer;

    function LgotMen(dsLgot:TDataSet; DateFiks:TDateTime; strID:String; strDelim:String): String;  //льготы человека
    function LgotMen2(strID:String; strDelim:String): String;  //льготы человека

    function getUL( ds : TDataSet ) : String; overload;
    function getUL( nKod : Integer; sLang:String='') : String; overload;
    function getDom( ds : TDataSet; lNameIsNotDom:Boolean ) : String;  overload;
    function getDom( strDom, strKorp, strKv, strNameHouse : String; lNotDom:Boolean) : String; overload;

    function TypeObjForMens(TypeObj:Integer):Boolean;

    function CreateSeekAdres(DateFiks: TDateTime; nPunkt:Integer; strUL: String; strDom:String; strKorp:String; strKv: String):String;
    function FindAdres(DateFiks : TDateTime; nPunkt, nUL : Integer; strDom, strKorp, strKv : String; nID : Integer=-1) : Boolean;
    function TipBigHouseFromAdres(DateFiks: TDateTime; nPunkt, nUL: Integer; strDom, strKorp, strKv: String; var ID:Integer): Integer;
    function GetFindAdresID:Integer;
    // вернуть свойство дома из базы свойств
    function InitHouseProp(DateFiks : TDateTime; nPunkt, nUL : Variant; strDom, strKorp : String;  nID : Integer=-1) : Boolean;
    function GetHouseProp(strProp : String; strType : String) : Variant;

    function AdresForSeek(ds : TDataSet)  : TAdres;
    function AdresForSeek2(nPunkt,nUL : Integer; strDom,strKorp : String; strKv:String=''; lNotDom:Boolean=false) : TAdres;

    function AddAdres2(DateFiks : TDateTime; nNewID:Integer; adr:TAdres; var strErr : String) : Boolean;
    function AddAdres(DateFiks : TDateTime; adr:TAdres; var nNewID : Integer; var strErr : String) : Integer;
    function AddAdresOld(DateFiks : TDateTime; nPunkt,nUl:Integer; strDom, strKorp, strKv: String;  var nNewID : Integer; var strErr : String) : Integer;

    function UlicaAsStringForAdres( strUlica : String; lSQL : Boolean) : String;
    function UlicaAsStringForBigHouse( strUlica : String; lSQL : Boolean) : String;

    function ChangeAdres(DateFiks: TDateTime; nID : Integer;oldAdres,newAdres : TAdres; var strErr:String) : Boolean;

    function LastDvigMen(DateFiks : TDateTime; strID : String) : TLastDvig;
    function LastDvigMenS( strID : String; sType:String) : String;

    procedure ClearIdBase;
    function GetIdBase(var nCountZnak:Integer) : Integer;
    function GetOrgMD5 : String;
    function GetSysIdBase: String;
    function IsMainBase:Boolean;
    function IsDistributeBase: Boolean;  // база распределенная ?

    function GetNewID( TypeObj : Integer ) : Integer;
    function MaxID : Integer;  // вернуть максимальный ID используемый в базе
    function GetLastID : Integer;  // последний созданный ID
    function _CalcID(nID,nIDBASE,nCountZn:integer) : Integer;    // вычисляет ID с учетом ID_BASE

    function MainTableFromTypeObj(nTypeObj:Integer):TAdsTable;
    function NameTableFromTypeObj(nTypeObj: Integer):String;

    function DataSetFromTypeObj(nTypeObj: Integer): TDataSet;
    function _LockTypeObj(nTypeObj:Integer; strMessage:String; lVisible:Boolean=true):Boolean;
    procedure _UnLockTypeObj(nTypeObj:Integer);
    function NameDirFromTypeObj(nTypeObj:Integer; sAddDir1,sAddDir2:String; lFull:Boolean):String;
    function TypeObj2Str(nTypeObj:Integer): String;
    function TypeObj_BigHouse : Integer;
    function TypeObj_Adres : Integer;
    function TypeObj_Lich  : Integer;
    function TypeObj_Nasel : Integer;
    function TypeObj_Passport : Integer;
    function TypeObj_ZBrak : Integer;
    function TypeObj_ZRast : Integer;
    function TypeObj_ZRogd : Integer;
    function TypeObj_ZSmert: Integer;
    function TypeObj_ZUstOtc: Integer;
    function TypeObj_ZAdopt: Integer;
    function TypeObj_ZChName: Integer;
    function TypeObj_DeclareRegistr: Integer;
    function TypeObj_UZRogd: Integer;
    function TypeObj_VidGit: Integer;
    function TypeObj_RasxNaklSvid: Integer;
    function TypeObj_AktSpisSvid : Integer;
    function TypeObj_AktNalichSvid : Integer;
    function TypeObj_TalonPrib: Integer;
    function TypeObj_TalonUbit: Integer;
    function TypeObj_PassportViza: Integer;
    function TypeObj_Owners: Integer;
    function TypeObj_DBrak : Integer;
    function TypeObj_DRast : Integer;
    function TypeObj_ZUstMat: Integer;
    function TypeObj_PasportTerr: Integer;  // паспорт территории
    function TypeObj_Sovet: Integer;  // месный совет
    function TypeObj_Ochered : Integer;
    function TypeObj_VUS : Integer;
    function TypeObj_Organ : Integer;
    function TypeObj_Obrach: Integer;  // обращения граждан
    function TypeObj_Spr: Integer;
    function TypeObj_ZAGS_AddDok:Integer;          //
    function TypeObj_ZAGS_SprAkt:Integer;          // справка о записи акта гр. состояния
    function TypeObj_ZAGS_SprOtsut:Integer;        // справка об отсутствии актовой записи
    function TypeObj_ZAGS_IzvOtsut:Integer;        // извещение об отсутствии актовой записи
    function TypeObj_ZAGS_ZaklChName:Integer;      // заключение о перемене имени, фамилии
    function TypeObj_ZAGS_SprBrak:Integer;         // справка о записи акта о браке
    function TypeObj_ZAGS_SprRogd:Integer;         // справка о записи акта о рождении
    function TypeObj_ZAGS_SprSmert:Integer;        // справка о записи акта о смерти
    function TypeObj_ZAGS_SprChName:Integer;       //
    function TypeObj_ZAGS_SprRast:Integer;         //
    function TypeObj_ZAGS_ZaklIzmAkt:Integer;      //  заключение о изменении актовой записи


//    function TypeObj_Svid: Integer;

    {$IFDEF ZAGS}
//--------------------------------------------------------------------------------
       function  ZapisToAlfavit(nTypeObj:Integer; tb:TDataSet; lNew:Boolean) : Boolean;
       procedure Alfavit_AppendRecordForAll(nTypeObj:Integer; tb : TDataSet; lAppend : Boolean=true);
       procedure Alfavit_WriteHistory(nTypeObj:Integer; tb:TDataSet; hist:TDataSet; arr:array of TVarRec);
       procedure Alfavit_LoadRecord_ZAdopt(tb: TDataSet; hist:TDataSet);
       procedure Alfavit_LoadRecord_ZUstOtc(tb: TDataSet; hist:TDataSet);
       procedure Alfavit_LoadRecord_ZUstMat(tb: TDataSet; hist:TDataSet);
       procedure Alfavit_LoadRecord_ZChName(tb: TDataSet; hist:TDataSet);
       procedure Alfavit_LoadRecord_ZSmert(tb: TDataSet; hist:TDataSet);
       procedure Alfavit_LoadRecord_ZRogd(tb: TDataSet; hist:TDataSet);
       procedure Alfavit_LoadRecord_RBrak(tb: TDataSet; hist:TDataSet);
       procedure Alfavit_LoadRecord_ZBrak( tb : TDataSet; hist:TDataSet );

    {$ENDIF}
    procedure ClearBase;

    function CheckNomerLich(DateFiks : TDateTime; nID : Integer; sNomer : String) : Boolean;

    function GetLichSchet( DateFiks : TDateTime; strID : String) : TDataSet;
    function GetLichSchetFromAdres2( DateFiks : TDateTime; strIDAdres : String; lAddDelete : Boolean): TArrLich;
    function GetLichSchetFromAdres( DateFiks : TDateTime; strIDAdres : String): TDataSet;
    function GetIDLichSchetFromAdres( DateFiks : TDateTime; strIDAdres : String): String;
    function GetMen( DateFiks : TDateTime; strID : String): TDataSet;
    function GetMenIN( DateFiks : TDateTime; strIN : String): TDataSet;

    procedure GetListOrganZAGS(PickList:TStrings; KeyList:TStrings; nType:Integer);    // заполнить список органов ЗАГС

    procedure WriteLogDeleteDok(ds: TDataSet; nTypeObj:Integer);
    function  DeleteDokument( ds : TDataSet; nTypeObj : Integer; lIgnoreCheck:Boolean=false) : Boolean;
    procedure DeleteFromList( tb : TAdsTable; DateFiks : TDateTime; ID : Integer);
    procedure DeleteFromListEx(sTableName:String; DateFiks: TDateTime; nTypeObj:Integer; ID: Integer);

    function GetDatePredZapis:TDateTime;
    procedure DateBrakToHist(nID:Integer; nNomer:Integer; dDateZ:TDateTime; dDateB:TDateTime; dTimeB:TDateTime);
    procedure DateRastToHist(nID:Integer; nNomer:Integer; dDateZ:TDateTime; dDateB:TDateTime; dTimeB:TDateTime);
    procedure ValueToHistory(nID:Integer; nTypeObj:Integer; sField:String; vValue:Variant);

    procedure AppendToDelObj(DateFiks: TDateTime; strID: String; nTypeObj : Integer; ds:TDataSet=nil; strKomm:String='');
    procedure AppendToDelObjEx(nTypeObj:Integer; strID:String; DateDok:TDateTime; DateDok2: TDateTime; strKomm:String);
    procedure WriteUpdateObj(nOper:Integer; nTypeObj:Integer; nID:Integer; nValueGrn:Integer; strKomm:String);
    procedure DeleteUpdating(nTypeObj : Integer; strID: String);
    function InfoForDelete(ds:TDataSet; nTypeObj:Integer; lDokZags:Boolean):String;

    function DeleteForAll(DateFiks : TDateTime; strID : String) : Boolean;
    function DeleteLich(DateFiks : TDateTime; strID : String) : Boolean;
    function DeleteMen(DateFiks : TDateTime; strID : String; lCheckDel : Boolean; lIgnoreCheck:Boolean=false) : Boolean;
    function DeleteAdres(DateFiks : TDateTime; strID : String) : Boolean;
    function DeleteVUS(DateFiks : TDateTime; strID : String) : Boolean;
    function DeleteOch(DateFiks : TDateTime; strID : String) : Boolean;
    function VipisMen(DateFiks: TDateTime; nIdMen: Integer; DateVipis : TDateTime; var strSoob:String) : Boolean;
    function VozvratMen(DateFiks: TDateTime; nIdMen: Integer; DateVozvrat : TDateTime; var strSoob:String) : Boolean;

    function ChangeLicMen( DateFiks : TDateTime; nIdMen: Integer; nIdLic : Integer) : Boolean;
    function ChangeIDCopyMen( nIDSeek,nIDCopyMen : Integer): Boolean;

    function NameSostFromDate( DateFiks : TDateTime ) : String;
    function CreateNewSostBase( DateFiks : TDateTime; lCreateCur : Boolean ) : Boolean;
    function DeleteSostBase( DateFiks : TDateTime ) : Boolean;
    function LastDateSost : TDateTime;
    function GetWork( nID : Integer; arrRec : TCurrentRecord) : String;
    function GetDolg( nID : Integer; arrRec : TCurrentRecord) : String;
    function GetPasport( nID : Integer; arrRec : TCurrentRecord; strDelim : String='') : String;
    function GetRecPasport( nID : Integer; arrRec : TCurrentRecord) : TPassport;
    function CreateSeek( d : TDateTime; nID : Integer) : Variant;
    procedure CloseBase;
    function OpenBase( strPath : String = '') : Boolean;
    function ClearOpenTables(strPath: String): Boolean;
    function GetPathConnect : String;

    function ReadDataSetFromMemo( ds : TDataSet; fldMemo : TField; lList : Boolean) : Boolean;
    function WriteDataSetToMemo( ds : TDataSet; fldMemo : TField; lList : Boolean; strFieldNames : String) : Boolean;
    function IsDirBase(strDir : String; nType : Integer) : Boolean; override;
    function ProcessDatabaseError : Boolean; override;
    function SetNameFileParamTask : Boolean; override;

    function SelectDirMainComp(sProg:String; var strDir:String) : Boolean;
    function CheckPathBase : Boolean;
    function GorodHaveRaion(strName : String) : Boolean;

    function LoadLichSchet( strSourceConnect : String ) : Boolean;

    function CountMens( DateFiks : TDateTime; strLicID : String): Integer;
    function CountMensEx( DateFiks : TDateTime; strLicID : String; strType : String; slPar:TStringList): Integer;
    function ListMensLic(strLicID:String; nIDFirst:Integer; strType:String;  strParAdd:String;  strDelim:String; dsList:TDataSet):String;

    function CountMens2Where( DateFiks : TDateTime; nType:Integer; strType : String; slPar:TStringList): String;
    function CountMensAdres( DateFiks : TDateTime; strAdresID : String; strType : String; slPar:TStringList): Integer;
    function CountMensAdresNotRegistred( DateFiks : TDateTime; strAdresID : String): Integer;

    function IDNewFirstMen( DateFiks : TDateTime; strLicID : String): Integer;
    function ChoiceMenLic( DateFiks : TDateTime; strLicID : String; TypeChoice : TTypeChoiceMen; strNotID : String; strCaption : String  ): Integer;

    function ReplaceTablesBase( strBaseName : String; sl : TStringList) : Boolean;
    function ReplaceOneTable( DictSource : TAdsDictionary; ConnectSource : TAdsConnection; strTableName : String) : Boolean;
    function IsAdsSys(strUser:String) : Boolean;

    procedure CheckBelFamily(strFamilyR,strFamilyB : String);
    function  GetBelFamily(strFamilyR : String; strPadeg:String='') : String;

    procedure CheckLatFamily(strFamilyR,strFamilyL : String);
    function  GetLatFamily(strFamilyR : String) : String;

    function CheckNameBel( var Pol : TPol; strNameRus : String; strNameBel:String=''; strPadeg:String='') : String;
    function CheckNameLat( var Pol : TPol; strNameRus : String; strNameLat:String) : String;
    function CheckOtchBel( var Pol : TPol; strOtchRus : String; strPadeg:String='') : String;


    procedure CheckBelNazv(nType : Integer; lSelect : Boolean; strNazvR, strNazvB: String );
    function  GetBelNazv(nType : Integer; lSelect : Boolean; strNazvR: String): String;
    function  GetRusNazv(nType : Integer; lSelect : Boolean; strNazvB: String): String;
    function  GetLangNazv(nType : Integer; lSelect : Boolean; strNazv: String; sLang:String; lSeekAte:Boolean): String;

    procedure CheckNazv(nType : Integer; lSelect : Boolean; strNazv : String );

    function PunktIsGorod( strValue : String; nType : Integer) : Boolean;
    function NamePunkt(strValue : String; nType : Integer; strLang : String): String;
    function GetFullNamePunkt(strValue : String; fldType : TField; strLang:String='R'): String;

    function GetPasportAkt(strDataSet, strParam: String; nType : Integer; dsDok:TDataSet=nil): TPassport;


    function GetRecord_DataSet(strDataSet : String) : TDataSet;

    function CheckBooleanField(ds : TDataset; s : String) : Integer;
    function AdresIsUpper:Boolean;
    function Get_DomKorpKv_FromAkt(sUL:String; ds:TDataSet; s:String; sDelim:String; sCheck:string; lHist:Boolean):String;
    function GetAdresAkt(strDataSet : String; strParam : String; nType : Integer) : String;
    function GetAdresAkt2(strDataSet, strParam: String; nType: Integer): String;
    function GetAdresAkt3(ds : TDataSet; strParam: String; nType: Integer; lPrintOblAll:Boolean=false): String;
    function CheckNomerAkt(nTypeObj: Integer; nIDZags:Integer; nIDAkt:Integer; nNomer:Integer; dDate:TDateTime; lVosstan:Boolean=false; FormDok:TForm=nil):Boolean;
    function SeekAkt(nTypeObj: Integer; nIDZags:Integer; nNomer: Integer; dDate: TDateTime; lVosstan:Boolean): TArrStrings;
    function GetNameTerr(strSOATO:String; lObl:Boolean; lRnGor:Boolean; lCheckPunkt:Boolean=true) : String;
    function GetSoatoAkt(ds : TDataSet; strParam: String; lCheckSel:Boolean; nType:Integer) : TSoato;
    function GetKodSoatoAkt(ds : TDataSet; strParam: String; lCheckSel:Boolean; nType:Integer) : String;
    function VoenkomFromSOATO(strSOATO:String):Integer;

    //--- ATE ---------------------
    function ATE2Record(ds:TDataSet):TAte;
    function ATEfromParentAndName(tbATE:TAdsTable; nType:Integer;nID:Integer; sName:String; sKateg: String; sNotKateg: String; sNameC:String='' ) : TArrAte;
    function ChoiceATEPunkt(arrATE:TArrATE; lChoice:Boolean; lCheckAteSS:Boolean):TATE;
    function GetATEAkt(ds : TDataSet; strFields:String; strParam: String) : TATE;
//    function GetATEAkt2(ds : TDataSet; strParam: String; lCheckRnGorod:Boolean; nType:Integer) : TATE;
    function _getATE(tbATE:TAdsTable; slATE:TStringList; sObl:String; sRaion:String; sSS:String; sPunkt:String; sTypePunkt:String) : Integer;
    function getATESys(slATE:TStringList; sObl:String; sRaion:String; sSS:String; sPunkt:String; sTypePunkt:String) : Integer;
    function getATE(slATE:TStringList; sObl:String; sRaion:String; sSS:String; sPunkt:String; sTypePunkt:String) : Integer;
    function NameFromATE(nAteID:Integer; sLang:String) : String;

    function GetNameAndTypePunkt(strValue : String; var sType,sName : String): Boolean;

    //-----------------------------
    function GetSQLForVozrast(strLastField, strFirstField : String) : String;
    function GetTypeZags : Integer;
    function OblArxivZAGS: Boolean;
    function OblBASE: Boolean;

    function GetNewNomerDok(nTypeObj:Integer; nYear:Integer): Integer;
    function GetNewNomerSvid(TypeSvid : Integer; tb : TAdsTable; var strNewNomer : String; var strNewSeria : String) : String;
    {$IFDEF ZAGS}
    procedure CheckDublZapis(slTypes:TStringList; slPar:TStringList; nIDZags:Integer; lRun:Boolean; lSvid:Boolean; lProtokol:Boolean; dDate1:TDateTime; dDate2:TDateTime);
    function GetNewNomerSvidR(var strNewNomerON : String; var strNewSeriaON : String;
                              var strNewNomerONA : String; var strNewSeriaONA : String) : String;
    {$ENDIF}
    function ProvOneSvid(TypeSvid : Integer; dsLog : TDataSet; strNameAkt,strNomerAkt : String; dDateAkt : TDateTime;
                              strSeria,strNomer : String; dDateSvid : TDateTime; lPovtor : Boolean ) : Boolean;
    function GetLastNomerLic : Int64;
    function GetLastNomerLicFirst : Int64;
    procedure FlushBufferTableLich;
    function LockBase : Boolean; override;
    procedure UnLockBase; override;
    procedure CheckAllSvid(dDate1, dDate2 : TDateTime );
    function GetVersionZAGS(lLoad : Boolean) : String;
    function GetTypeBase : Integer;

    function CheckDateFiksSQL( strSQL : String; DateFiks : TDateTime) : String;
    function CheckParamsSQL( strSQL : String ) : String;
    procedure CheckAutoReindex;
    procedure Event_BeforeOpen(Sender : TObject);
    procedure Event_AfterOpen(Sender: TObject);
    procedure Event_AfterClose(Sender: TObject);

    procedure Event_CheckStringFilter(var sFilter:String);

    function GetCountIN : Integer;   // количество зарезервированных ИН

    function StrTypeAsDataType( sType : String) : TFieldType;
    function CreateTableDopProps(tbProp : TkbmMemTable; TypeObj : Integer; strRazdel : String ) : Boolean;
    procedure AddFieldsTableDopProps(tbProp : TkbmMemTable);
    function GetNomerDom(strDom : String; nType:Integer=0) : String;
    function GetNomerDomEx(strDom : String; nType:Integer=0) : String;

    procedure LoadHouseOwners(ID : Integer; d : TDateTime; tb,tbHist : TkbmMemTable);
    procedure SaveHouseOwners(ID : Integer; d : TDateTime; tb,tbHist : TkbmMemTable);

    procedure LoadBigHouseProp(adr : TAdres; d : TDateTime; tb: TkbmMemTable);
    procedure SaveBigHouseProp(adr : TAdres; d : TDateTime; tb: TkbmMemTable);
    function AddBigHouse(adr : TAdres; d : TDateTime; lWriteName:Boolean; var strErr:String) : Boolean;
    function FindBigHouse(adr : TAdres; d : TDateTime) : Boolean;
    function NameBigHouse(adr : TAdres; d : TDateTime) : String;
    function SaveNameBigHouse(strNameHouse:String; adr:TAdres; d:TDateTime):Boolean;
    procedure DeleteBigHouse;

    procedure CheckBaseAfterOpen;

    function WriteJurnOper(nID:Integer;nResult:Integer;sResult:String):Boolean;
    function AnyExport(strCaption,strNameExp : String; lArx : Boolean; lChoicePath:Boolean; strDir:String; sRunShell:String):Boolean;

    function  GetNameSectionTable( TableName : String) : String; overload; override;
    function CreateBigHouse : Boolean;
    function LoadSQLEx(strNameSQL : String) : String;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;

    function GetCurDate(lDate:Boolean=false) : TDateTime;
    procedure SetCurDate(const Value: TDateTime);

    function MaxValueField(strNameTable,strField:String) : Integer;  // вернуть максимальное значение поля strField из таблицы strNameTable

    {$IFDEF GKH}
      function RunLoadBaseGES(lClearTAbles:Boolean; strDirSource:String; lOnlyCurSost:Boolean; lAllPunkt:Boolean;
                           nNewNomerLic:Integer; strAddNomerKniga:String; slPar:TStringList) : Integer;
    {$ELSE}
      function RunLoadBase(strDirSource:String; lOnlyCurSost:Boolean; lAllPunkt:Boolean; lZAGS:Boolean;
                           nNewNomerLic:Integer; strAddNomerKniga:String; slCheckSpr:TstringList) : Integer;
    {$ENDIF}

    function CheckSprPunkt : Boolean;
    function CheckSprUL(sPunkt:String) : Boolean;
    function GetListFieldsTable(strTable:String) : String;
    function GetErrorLoadBase(nErr:Integer):String;
    function CheckOneSprLoadBase(tbSpr:TAdsTable;slTables:TStringList; nTypeObj:Integer=0) : Boolean;
    function GetVersionZAH(lLoad : Boolean) : String;

    function GetTypeZah: Integer;

    //------------- очередь ----------------------------
    function Och_GetNextNDELO:Integer;
    function NewNomerOchered(nIdOch:Integer) : Integer;

    function SetIDLastReshOcheredMen(nID:Integer):Boolean;
    function GetIDLastReshOchered_(nID:Integer; nType:Integer; lCheckPlan:Boolean; var nIDLast:Integer; var nIDPost:Integer; var nIDSn:Integer):Boolean;
    function SetIDLastReshOchered_(dsOchered:TDataSet):Boolean;
    procedure SetIDLastReshOchered;

    function AddMenToOchered(nID : Integer; var lSeekMen : Boolean) : Boolean;
    function Check_AddMenToOchered_Sostav(nID: Integer): Boolean;

    function AddMenToVUS(nID: Integer; var lSeekMen : Boolean): Boolean;

    //--------------------------------------------------
    function GetListValues(strTable,strField,strWhere:String) : String;

    procedure CheckSysSprPrichSm;

  end;

var
  dmBase: TdmBase;

const
  SYSTEM_PASSWORD = 'sysdba';
  SYSTEM_USER     = 'ADSSYS';

implementation

uses fMain, SelLibFR, fWarning, fsimpleD, fChoiceAdres, fNotLoadPunkt, fShablon, fChDir;

{$R *.DFM}

//{$DEFINE DEBUG}

constructor TdmBase.Create(Owner: TComponent);
var
  Rel : TRelation;
//  strDir : String;
//  lExit  : Boolean;
begin

  SprMainBase := TStringList.Create; // справочники недоступные для корректировки

  FAteSS:=0;
  FCheckEmptySoato:=true;
  FLastAdresUpper:=false;
  FIdBase:=-1;
  FDistributeBase:=false;
  FMainBase:=-1;
  FCountZnack:=-1;

  CreateSimple(Owner);

  SetCurDate(Date);   // текущая дата

  HouseProp_ID := 0;
  FirstDatePrixodSvidZAGS:=0;

  //------- обращения граждан ----------------
  {$IFDEF OBR_GRAG}
    Doc2Sel.CreateDocTable;
  {$ENDIF}

  // Должностные лица
  SprDocOfficial:=CreateAddTable('SprDocOfficial','SprDocOfficial','AdsConnection');

  // тематики обращений граждан
  SprDocSubjG:=CreateAddTable('SprDocSubjG','SprDocSubjG','AdsConnection');

  // вместо того чтобы ложить компоненты на DataModule
  SprFamily   := CreateAddTable('SprFamily','','AdsConnection');
  SprNamesM   := CreateAddTable('SprNamesM','','AdsConnection');
  SprNamesG   := CreateAddTable('SprNamesG','','AdsConnection');

  SprPrichSm:=CreateAddTable('SprPrichSm','','AdsConnection');

  Shablon     := CreateAddTable('Shablon','Shablon','AdsConnection');

  SprGragd    := CreateAddTable('СпрСтран','SprGragd','AdsSharedConnection');
  SprGragd.IndexName := 'NOMER_KEY';

  {$IFDEF OCHERED}
     tbJurnOper:=CreateAddTable('JurnOper','tbJurnOper','AdsConnection');
  {$ELSE}
    {$IFDEF GKH}
      SprGES := CreateAddTable('SprGES','SprGES','AdsSharedConnection');
    {$ELSE}
      SprZAGS := CreateAddTable('SprZAGS','SprZAGS','AdsSharedConnection');
    {$ENDIF}
  {$ENDIF}

  {$IFDEF ZAGS}
    PredZapis := CreateAddTable('PredZapis','','AdsConnection');
    DeclareTermMarriage := CreateAddTable('DeclareTermMarriage','DeclareTermMarriage','AdsConnection');
    tbZapisRast   := CreateAddTable('AktTermMarriage','tbZapisRast','AdsConnection');
    tbZapisAdopt  := CreateAddTable('AktAdopt','tbZapisAdopt','AdsConnection');
    tbZapisChName := CreateAddTable('AktChangeName','tbZapisChName','AdsConnection');
    tbZapisUstMat := CreateAddTable('АктыУстМатеринства','tbZapisUstMat','AdsConnection');
    AlfavitZAGS := CreateAddTable('AlfavitZAGS' ,'AlfavitZAGS','AdsConnection');
    AddDokZAGS := CreateAddTable('AddDokZAGS','AddDokZAGS','AdsConnection');
    SprRnGorod := CreateAddTable('SprRnGorod','SprRnGorod','AdsConnection');
    tbDeclChName := CreateAddTable('DeclareChName','tbDeclChName','AdsConnection');
    tbDeclIzm := CreateAddTable('DeclareIzm','tbDeclIzm','AdsConnection');
  {$ELSE}
    tbOcheredResh := CreateAddTable('OcheredResh','tbOcheredResh','AdsConnection');
    SprLgotOch := CreateAddTable('SprLgotOch','SprLgotOch','AdsSharedConnection');
    tbMensSobst:= CreateAddTable('НаселениеСобств','tbMensSobst','AdsConnection');
  {$ENDIF}

  {$IF Defined(ZAGS) or Defined(LAIS) }
    GurnalRegistr := CreateAddTable('GurnalRegistr','GurnalRegistr','AdsConnection');
    SprWriteDecl := CreateAddTable('SprWriteDecl','SprWriteDecl','AdsConnection');
  {$IFEND}

  {$IF Defined(GKH) or Defined(LAIS) }
    tbResh:= CreateAddTable('Resh','tbResh','AdsConnection');
  {$IFEND}

  {$IFDEF ADD_ZAH}
    AktZ:= CreateAddTable('AktZ','AktZ','AdsConnection');
    SprZAH:= CreateAddTable('SprZAH','SprZAH','AdsConnection');
    SysSprZAH:= CreateAddTable('Gisun_SprZAH','SysSprZAH','AdsSharedConnection');
    SprRazmer:= CreateAddTable('SprRazmer','SprRazmer','AdsConnection');
  {$ENDIF}

  {$IFDEF ADD_OPEKA}
    tbZapisOpeka:= CreateAddTable('AktOpek','tbZapisOpeka','AdsConnection');
  {$ENDIF}

  SprPerevod  := CreateAddTable('SprPerevod','','AdsConnection');
  SprSklon    := CreateAddTable('Sklonenie','SprSklon','AdsSharedConnection');
  SprRodsName := CreateAddTable('SprRodsName','SprRodsName','AdsSharedConnection');
  RunSpr     := CreateAddTable('RunSpr','RunSpr','AdsSharedConnection');
  RunSprUser := CreateAddTable('RunSprUser','RunSprUser','AdsConnection');
  ListP       := CreateAddTable('ListP','','AdsConnection');
           
  {$IFNDEF POST}
    SprIzbUch   := CreateAddTable('SprIzbUch','','AdsConnection');
    SprIzbUch2  := CreateAddTable('SprIzbUch2','','AdsConnection');
    SprKomiss   := CreateAddTable('SprKomiss','','AdsConnection');
    SprOsobOtm  := CreateAddTable('SprOsobOtm','','AdsConnection');
    SprPropHouse:= CreateAddTable('SprPropHouse','','AdsConnection');
    SprAddBuild := CreateAddTable('SprAddBuild','','AdsConnection');

    tbHouseProps := CreateAddTable('HouseProps','','AdsConnection');
    tbHouseOwners:= CreateAddTable('HouseOwners','','AdsConnection');
    tbHouseOwnersHist:= CreateAddTable('HouseOwnersHist','','AdsConnection');
    DeclareRegistr := CreateAddTable('DeclareRegistr','DeclareRegistr','AdsConnection');
    ListSvid    := CreateAddTable('ListSvid','','AdsConnection');
  {$ENDIF}

  tbMensAdd    := CreateAddTable('НаселениеДоп','tbMensAdd','AdsConnection');  // дополнительные сведения о людях которые не могут меняться

  tbHistoryZAGS:= CreateAddTable('HistoryZAGS','','AdsConnection');

  tbSimpleProp:= CreateAddTable( 'BaseProp','tbSimpleProp','AdsConnection');
  tbSimplePropMemo := CreateAddTable('BaseTextProp','tbSimplePropMemo','AdsConnection');

  {$IFDEF SMDO}
    SMDOPost:=CreateAddTable('SMDOPost','SMDOPost','AdsConnection');
    SMDOTask:=CreateAddTable('SMDOTask','SMDOTask','AdsConnection');
    SMDOMens:=CreateAddTable('SMDOMens','SMDOMens','AdsConnection');
    SMDOFile:=CreateAddTable('SMDOFile','SMDOFile','AdsConnection');

    SMDOSprOrg:=CreateAddTable('SMDOSprOrg','SMDOSprOrg','AdsConnection');
    SMDOSprVidDok:=CreateAddTable('SMDOSprVidDok','SMDOSprVidDok','AdsConnection');
  {$ENDIF}

  AteSys:=CreateAddTable('Ate','AteSys','AdsSharedConnection');
  {$IFDEF GISUN}
    MessageGISUN := CreateAddTable('MessageGISUN','','AdsConnection');
    AllSprGISUN:=CreateAddTable('GISUN_Class','GISUN_Class','AdsSharedConnection');
    Log:=CreateAddTable('Log','Log','AdsConnection');
  {$ELSE}

  {$ENDIF}

  dmTaskCreate(true);

  ReadGlobalPar(PathForSysParams);
  ReadParamsAllTables;

  ListTablesSost := TList.Create;
  ListTablesSost.Add( tbLich );
  ListTablesSost.Add( tbLichPr );
  ListTablesSost.Add( tbNalogi );
  ListTablesSost.Add( tbDokuments );
  ListTablesSost.Add( tbAdres );
  ListTablesSost.Add( tbBigHouse );
  ListTablesSost.Add( tbMens );
  ListTablesSost.Add( tbMensDvig );
  ListTablesSost.Add( tbMensLgot );
  ListTablesSost.Add( tbMensPr );
  ListTablesSost.Add( tbProp );
  ListTablesSost.Add( tbPropMemo );

  ListTablesSost.Add( tbHouseProps );      // дополнительный признаки адресов
  ListTablesSost.Add( tbHouseOwners );     // владельцы домов
//  ListTablesSost.Add( SprOwners );         // справочник сторонних владельцев

  Relations := TRelations.Create;

  Rel := Relations.AddNew( tbLich );
  Rel.Kod := 'LICH';
  Rel.AddTable( tbLichPr );
  Rel.AddTable( tbProp );
  Rel.AddTable( tbPropMemo );
  Rel.AddTable( tbNalogi );
  Rel.AddTable( tbDokuments );
  RelationLich := Rel;

  Rel := Relations.AddNew( tbAdres );
  Rel.Kod := 'ADRES';
  Rel.AddTable( tbProp );
  Rel.AddTable( tbPropMemo );
  Rel.AddTable( tbHouseProps );
  Rel.AddTable( tbHouseOwners );
  RelationAdres := Rel;
  // люди обязательно после адресов, так как могут быть удаления в таблице tbHouseOwners, а там ссылки на людей
  Rel := Relations.AddNew( tbMens );
  Rel.Kod := 'MENS';
  Rel.AddTable( tbMensLgot );
  Rel.AddTable( tbMensDvig );
  Rel.AddTable( tbMensPr );
  Rel.AddTable( tbProp );
  Rel.AddTable( tbPropMemo );

  { TODO -cтестирование : Протестировать }
  Rel.AddSimpleTable( tbOchered );
  Rel.AddSimpleTable( tbSostavSem );
  Rel.AddSimpleTable( tbVUS );

  RelationMens := Rel;

  OnBeforeOpen := Event_BeforeOpen;
  OnAfterOpen  := Event_AfterOpen;
  OnAfterClose := Event_AfterClose;

end;

destructor TdmBase.Destroy;
begin
  SprMainBase.Free;
  ListTablesSost.Free;
  Relations.Free;
  inherited;
end;

//
  {
  if not IsDirBase(GlobalPar.ConnectPath) then begin
    strDir := GlobalPar.ConnectPath;
    lExit  := false;
    while not lExit do begin
      if Problem(' Каталог "'+strDir+'" не является каталогом базы.'+#13+'Попробуете найти самостоятельно ?') then begin
        if SelectDirectory('Выберите каталог информационной базы', '', strDir) then begin
           if IsDirBase(strDir) then begin
             lExit := true;
             GlobalPar.ConnectPath       := CheckSleshN(strDir);
             GlobalPar.SharedConnectPath := CheckSleshN(strDir);
           end;
        end;
      end else begin
        lExit := true;
        FormMain.CancelApp:=true;
      end;
    end;
  end;
  if not FormMain.CancelApp then begin
    if FullOpen(GlobalPar.ConnectPath, GlobalPar.SharedConnectPath ) then begin
      IniSysParams.UpdateFile;
      FormMain.SetCaption;
//    FormMain.Caption := FormMain.Caption + ' [ Путь: '+GlobalPar.ConnectPath+' ]';
      CurDate := 2Now;
      NomComputer := '00';
//      LastNomer   := -1;
    end else begin
      FormMain.CancelApp:=true;
      Application.Terminate;
    end;
  end;
  }

function TdmBase.CreateSeek( d : TDateTime; nID : Integer) : Variant;
begin
  Result := VarArrayCreate( [0, 1], varOleStr );
  Result[0] := d;
  Result[1] := nID;
end;

function TdmBase.AktRogdMen(strNomerAkt: String; dDateAkt : TDateTime): TAktRogd;
var
//  vKeyValues : Variant;
  s:String;
begin
//  vKeyValues := VarArrayCreate( [0, 1], varOleStr );
//  vKeyValues[0] := dDateAkt;
//  vKeyValues[1] := StrToInt(strNomerAkt);
  s:=tbZapisRogd.IndexFieldNames;
//  tbZapisRogd.IndexFieldNames:='NOMER;DATEZ';   было до 18.07.2018
  tbZapisRogd.IndexName:='NOMER';  // 'NOMER;DATEZ;ID_ZAGS'
  try
    if tbZapisRogd.FindKey([StrToInt(strNomerAkt),dDateAkt]) then begin
  //  if tbZapisRogd.Locate('DATEZ;NOMER', vKeyValues, []) then begin
      Result.Nomer := strNomerAkt;
      Result.Date  := dDateAkt;
      Result.Mesto := ANSIUpperCase(fmMain.NameOrg('K',''))+' '+
                      fmMain.NameRaion('Р')+' '+fmMain.NameObl('Р')+' ';
      Result.SOATO := '';
      Result.GOSUD := tbZapisRogd.FieldByName('GOSUD').AsString;
      Result.OBL   := tbZapisRogd.FieldByName('OBL').AsString;
      Result.RAION := tbZapisRogd.FieldByName('RAION').AsString;
      Result.GOROD := tbZapisRogd.FieldByName('GOROD').AsString;
      Result.B_RESP   := tbZapisRogd.FieldByName('B_RESP').AsBoolean;
      Result.B_OBL    := tbZapisRogd.FieldByName('B_OBL').AsBoolean;
      Result.B_Gorod  := tbZapisRogd.FieldByName('B_GOROD').AsString;
      Result.ONA_Familia  := tbZapisRogd.FieldByName('ONA_Familia').AsString;
      Result.ONA_Name     := tbZapisRogd.FieldByName('ONA_Name').AsString;
      Result.ONA_Otch     := tbZapisRogd.FieldByName('ONA_Otch').AsString;

      Result.ONA_SOATO    := tbZapisRogd.FieldByName('ONA_SOATO').AsString;
      Result.ONA_Gosud    := tbZapisRogd.FieldByName('ONA_GOSUD').AsString;
      Result.ONA_Obl      := tbZapisRogd.FieldByName('ONA_OBL').AsString;
      Result.ONA_Raion    := tbZapisRogd.FieldByName('ONA_RAION').AsString;
      Result.ONA_Gorod    := tbZapisRogd.FieldByName('ONA_GOROD').AsString;
      Result.ONA_Gorod_R   := tbZapisRogd.FieldByName('ONA_GOROD_R').AsString;
      Result.ONA_DateR    := tbZapisRogd.FieldByName('ONA_DATER').AsString;
      Result.ONA_Nation   := tbZapisRogd.FieldByName('ONA_NATION').AsString;
      Result.ONA_Obraz    := tbZapisRogd.FieldByName('ONA_OBRAZ').AsString;
      Result.ONA_Grag     := tbZapisRogd.FieldByName('ONA_GRAG').AsString;
      Result.ONA_Dokument := tbZapisRogd.FieldByName('ONA_DOKUMENT').AsString;
      Result.ONA_B_RESP   := tbZapisRogd.FieldByName('ONA_B_RESP').AsBoolean;
      Result.ONA_B_OBL    := tbZapisRogd.FieldByName('ONA_B_OBL').AsBoolean;
      Result.ONA_B_Gorod  := tbZapisRogd.FieldByName('ONA_B_GOROD').AsString;
    end;
  finally
    tbZapisRogd.IndexFieldNames:=s;
  end;
end;
//----------------------------------------------------------------------------------------------
function TdmBase.CreateNameRaion( strRaion,strPadeg : String) : String;
begin
  if Pos('.',strRAION)=0 then begin
    Result := GetPadegWord( strRAION, strPadeg) + ' ' + GetPadegWord( 'район', strPadeg );
  end else begin
    Result := GetPadegWord( strRAION, strPadeg);  // в качестве района город обласного подчинения
  end;
end;
//----------------------------------------------------------------------------------------------
function TdmBase.CreateNameObl(fldB, fldN : TField; strLang : String): String;
begin
  Result := NameObl(fldN.AsString, BooleanToInt(fldB), strLang);
end;
//----------------------------------------------------------------------------------------------
function TdmBase.IsAddTypeObl(strName : String) : Boolean;
var
  s:String;
begin
  s:=ANSIUpperCase(strName);
  if (Pos(' ОБЛАСТЬ', s)=0) and (Pos(' ВОБЛАСЦЬ', s)=0) and (Pos(' ОБЛ.', s)=0)  and (Pos(' ВОБЛ.', s)=0) and (Pos(' КРАЙ', s)=0)then begin
    Result:=true;
  end else begin
    Result:=false;
  end;
end;
//----------------------------------------------------------------------------------------------
function TdmBase.NameObl(strName : String; nType : Integer; strLang : String) : String;
var
  s,ss,s1 : String;
  lKrat:Boolean;
begin
  if CheckParam('C', strLang) then begin
    if not IsAddTypeObl(strName)
      then exit;     // не надо добавлять область,вобласць,край
  end;
  if Pos('.',strLang)>0
    then lKrat:=true
    else lKrat:=false;
  strLang:=StringReplace(strLang, '.', '', []);
  strLang:=ANSIUpperCase(Copy(Trim(strLang),1,1));
  if (strLang='') or (strLang='R') or (strLang='Р')
    then strLang:='R'
    else strLang:='B';
  if lKrat then begin
    if strLang='R' then begin
      s1:=sokrObl; //'обл.';
    end else begin
      s1:=sokrObl_B; //'вобл.';
    end;
  end else begin
    if strLang='R' then begin
      s1:='область';
    end else begin
      s1:='вобласць';
    end;
  end;
  s:=Trim(strName);
  Result:='';
  if (s<>'') then begin
    ss:='';
//    n := BooleanToInt(fldB);
    if (nType=-2) then begin  // если поле не передано
      if Pos(s1, ANSILowerCase(s))=0 then begin
        ss := ' '+s1;
      end;
    end else if (nType=-1) then begin  // если тип области не введен
      if ((ANSIUpperCase(strName)='ГОМЕЛЬ') or (ANSIUpperCase(strName)='ВИТЕБСК')) then begin
        ss:='*';
      end;
  //    ss := '';
    end else if (nType=1) then begin  // область
      if Pos(s1, ANSILowerCase(s))=0 then begin
        ss := ' '+s1;
      end;
    end else if nType=0 then begin   // край
      if Pos('край', ANSILowerCase(s))=0 then begin
        ss := ' край';
      end;
    end;
    if ss='*'
      then Result:='г. '+s
      else Result:=s+ss;
  end;
end;

// вернуть место рождения человека из таблицы НаселениеДоп или откуда прибыл НаселениеДоп или текущая запись в миграции
function TdmBase.GetMestoMen(nTypeMest:Integer; strID : String; lFull : Boolean; nOrder : Integer; dsMigr:TDataSet): String;
var
  sF : String;
//  arr : TArrStrings;
  lOk : Boolean;
  ds:TDataSet;
begin
  if dsMigr=nil then begin
    ds:=tbMensAdd; // из таблицы НаселениеДоп
    case nTypeMest of
      0: begin
           sF:='MR';  // место рождения
         end;
      1: begin
           sF:='OP';   // откуда прибыл
         end;
    end;
    if strID=''
      then exit;
  end else begin
    sF:='OP'; // откуда прибыл
    ds:=dsMigr; // из таблицы миграция
  end;
  Result:='';
  if (strID='') or (strID=ds.FieldByName('ID').AsString) then begin
    lOk := true;
  end else begin
    lOk := ds.Locate('ID', strID, []);
  end;
  if lOk then begin
    Result:=GetMestoFromFields(ds,';'+sF+'_GOSUD;'+sF+'_B_OBL;'+sF+'_OBL;'+sF+'_RAION;'+sF+'_B_GOROD;'+sF+'_GOROD',lFull,nOrder);
  end;
{
  if lOk then begin
    SetLength(Arr,4);
    strDelim:=',';
    s := ds.FieldByName(sF+'_GOSUD').AsString;
    arr[0]:='';
    if (s<>'') and (lFull or (GlobalTask.ParamAsString('GOSUD')<>s)) then begin
      if SprStran.Locate('ID',s,[]) then begin
        arr[0] := SprStran.FieldByName('NAME').AsString;
      end;
    end;
    s := ds.FieldByName(sF+'_OBL').AsString;
    arr[1]:='';
    if (s<>'') and (lFull or (ANSIUpperCase(GlobalTask.ParamAsString('OBL'))<>ANSIUpperCase(s))) then begin
      arr[1]:=CreateNameObl(ds.FieldByName(sF+'_B_OBL'),ds.FieldByName(sF+'_OBL'),'R');
    end;
    arr[2] := ds.FieldByName(sF+'_RAION').AsString;
    if arr[2]<>'' then arr[2]:=CreateNameRaion(arr[2],'');
    arr[3] := GetFullNamePunkt(ds.FieldByName(sF+'_GOROD').AsString, ds.FieldByName(sF+'_B_GOROD'));
    if nOrder=0 then begin // в обычном порядке
      for i:=0 to 3 do begin
        if arr[i]<>'' then begin
          Result:=Result+arr[i]+strDelim+' ';
        end;
      end;
    end else begin  // первым должет быть нас. пункт
      for i:=3 downto 0 do begin
        if arr[i]<>'' then begin
          Result:=Result+arr[i]+strDelim+' ';
        end;
      end;
    end;
    Result:=Trim(Result);
    if Right(Result,Length(strDelim))=strDelim then begin
      Result:=Copy(Result,1,Length(Result)-Length(strDelim));
    end;
  end;
}
end;

//---------------------------------------------------------------------------------------------------
function TdmBase.GetMestoFromFields(ds:TDataSet; strFields:String; lFull:Boolean;nOrder:Integer):String;
var
  arr,arrFld:TArrStrings;
  fldGOSUD,fldB_OBL,fldOBL,fldRAION,fldB_GOROD,fldGOROD:TField;
  s,strDelim:String;
  i:Integer;
begin
  StrToArr(strFields,arrFld,';',false);
  SetLength(arrFld,7);
//  if arrFld[0]<>'' then fldB_RESP:=ds.FindField(arrFld[0]) else fldB_RESP:=nil;
  if arrFld[1]<>'' then fldGOSUD:=ds.FindField(arrFld[1]) else fldGOSUD:=nil;
  if arrFld[2]<>'' then fldB_OBL:=ds.FindField(arrFld[2]) else fldB_OBL:=nil;
  if arrFld[3]<>'' then fldOBL:=ds.FindField(arrFld[3]) else fldOBL:=nil;
  if arrFld[4]<>'' then fldRAION:=ds.FindField(arrFld[4]) else fldRAION:=nil;
  if arrFld[5]<>'' then fldB_GOROD:=ds.FindField(arrFld[5]) else fldB_GOROD:=nil;
  if arrFld[6]<>'' then fldGOROD:=ds.FindField(arrFld[6]) else fldGOROD:=nil;
  SetLength(Arr,4);   
  strDelim:=',';
  if fldGOSUD=nil then s:='' else s:=fldGOSUD.AsString;
  arr[0]:='';
  if (s<>'') and (lFull or (GlobalTask.ParamAsString('GOSUD')<>s)) then begin
    if SprStran.Locate('ID',s,[]) then begin
      arr[0] := SprStran.FieldByName('FNAME').AsString;
    end;
  end;
  s := fldOBL.AsString;
  arr[1]:='';
  if (s<>'') and (lFull or (ANSIUpperCase(GlobalTask.ParamAsString('OBL'))<>ANSIUpperCase(s))) then begin
    arr[1]:=CreateNameObl(fldB_OBL,fldOBL,'R');
  end;
  arr[2] := fldRAION.AsString;
  if arr[2]<>'' then arr[2]:=CreateNameRaion(arr[2],'');
  arr[3] := GetFullNamePunkt(fldGOROD.AsString, fldB_GOROD);
  if nOrder=0 then begin // в обычном порядке
    for i:=0 to 3 do begin
      if arr[i]<>'' then begin
        Result:=Result+arr[i]+strDelim+' ';
      end;
    end;
  end else begin  // первым должет быть нас. пункт
    for i:=3 downto 0 do begin
      if arr[i]<>'' then begin
        Result:=Result+arr[i]+strDelim+' ';
      end;
    end;
  end;
  Result:=Trim(Result);
  if Right(Result,Length(strDelim))=strDelim then begin
    Result:=Copy(Result,1,Length(Result)-Length(strDelim));
  end;
end;

//---------------------------------------------------------------------------------------------------
function TdmBase.GetMestoFromFieldsEx(ds:TDataSet; strFields:String):TAdres;
var
  arr,arrFld:TArrStrings;
  fldGOSUD,fldB_OBL,fldOBL,fldRAION,fldB_GOROD,fldGOROD:TField;
  fldTypeUL,fldUL,fldDom,fldKorp,fldKv,fldRN_GOROD:TField;
  s,strDelim:String;
//  i:Integer;
begin
  StrToArr(strFields,arrFld,';',false);
  SetLength(arrFld,13);
//  if arrFld[0]<>'' then fldB_RESP:=ds.FindField(arrFld[0]) else fldB_RESP:=nil;
  if arrFld[1]<>'' then fldGOSUD:=ds.FindField(arrFld[1]) else fldGOSUD:=nil;
  if arrFld[2]<>'' then fldB_OBL:=ds.FindField(arrFld[2]) else fldB_OBL:=nil;
  if arrFld[3]<>'' then fldOBL:=ds.FindField(arrFld[3]) else fldOBL:=nil;
  if arrFld[4]<>'' then fldRAION:=ds.FindField(arrFld[4]) else fldRAION:=nil;
  if arrFld[5]<>'' then fldB_GOROD:=ds.FindField(arrFld[5]) else fldB_GOROD:=nil;
  if arrFld[6]<>'' then fldGOROD:=ds.FindField(arrFld[6]) else fldGOROD:=nil;
  if arrFld[7]<>'' then fldRN_GOROD:=ds.FindField(arrFld[7]) else fldRN_GOROD:=nil;
  if arrFld[8]<>'' then fldTypeUL:=ds.FindField(arrFld[8]) else fldTypeUL:=nil;
  if arrFld[9]<>'' then fldUL:=ds.FindField(arrFld[8]) else fldUL:=nil;
  if arrFld[10]<>'' then fldDom:=ds.FindField(arrFld[10]) else fldDom:=nil;
  if arrFld[11]<>'' then fldKorp:=ds.FindField(arrFld[11]) else fldKorp:=nil;
  if arrFld[12]<>'' then fldKv:=ds.FindField(arrFld[12]) else fldKv:=nil;
  SetLength(Arr,4);
  strDelim:=',';
  if fldGOSUD=nil then s:='' else s:=fldGOSUD.AsString;
  Result.Strana:='';
  if (s<>'') then begin
    if SprStran.Locate('ID',s,[]) then begin
      Result.Strana := SprStran.FieldByName('FNAME').AsString;
    end;
  end;
  s := fldOBL.AsString;
  Result.Obl:='';
  if (s<>'') then begin
    Result.Obl:=CreateNameObl(fldB_OBL,fldOBL,'R');
  end;
  Result.Raion := fldRAION.AsString;
  if Result.Raion<>'' then Result.Raion:=CreateNameRaion(Result.Raion,'');

  Result.Punkt:=GetFullNamePunkt(fldGOROD.AsString, fldB_GOROD);
  Result.PunktN:=fldGOROD.AsString;        // наименование нас пункта без типа
  Result.PunktTK:=GetTypePunkt(fldB_GOROD.AsString,'R',s);
  Result.PunktTN:=s;
  if fldDom<>nil then begin
    Result.NDom:=fldDom.AsString;
    Result.Korp:=fldKorp.AsString;
    Result.Kv:=fldKv.AsString;
    Result.Dom:=getDOM(Result.NDom, Result.Korp, Result.Kv, '', false);
    Result.Dom2:=Result.Dom;
  end;
  //------- соберем улицу ---------------------
  s:='';
  if fldTypeUL<>nil then begin
    s:=fldTypeUL.AsString;
    if s<>'' then begin
      if IsAllDigit(s) then begin
        if SprTypeUL.Locate('ID', s, []) then begin
          s:=SprTypeUL.FieldByName('NAME').AsString;
          if s='-' then s:='';
        end;
      end;
    end;
  end;
  Result.Ulica:='';
  if fldUL<>nil then begin
    Result.Ulica:=CheckSpace(Trim(s+' '+fldUL.AsString));
  end;
  //-------------------------------------
  if Result.Ulica='' then Result.PunktUlica:=Result.Punkt
                     else Result.PunktUlica:=Result.Punkt+', '+Result.Ulica;
  if fldRN_GOROD<>nil then begin
    Result.RnGorName:=fldRN_GOROD.AsString;
  end;
end;

//-----------------------------------------------------------------------
function TdmBase.GetNamePasport( n : Integer; sLang:String ) : String;
var
  lOk:Boolean;
  sField:String;
begin
  Result:='';
  if n=SprTypeDok.FieldByName('ID').AsInteger then begin
    lOk:=true;
  end else begin
    lOk:=SprTypeDok.Locate('ID', n, []);
  end;
  if lOk then begin
    if (Copy(sLang,1,1)='B') or (Copy(sLang,1,1)='Б')
      then sField:='NAME_PRINT_B'
      else sField:='NAME_PRINT';
    Result := SprTypeDok.FieldByName(sField).AsString;
  end;
end;
//-----------------------------------------------------------------------
function TdmBase.GetMenPasp(DateFiks: TDateTime; strID: String; nType:Integer): String;
var
  p:TPassport;
begin
  if DateFiks<=0 then DateFiks:=GetDateCurrentSost;
  p:=dmBase.PasportMen(DateFiks, strID);
  Result:=PasportToText(p, nType);
end;
//-----------------------------------------------------------------------
function TdmBase.GetMenPaspV(UdostKod:Integer; Seria,Nomer,Organ,LichNomer : String;  DateV : TDateTime; nType:Integer): String;
var
  p:TPassport;
  vDateV:Variant;
begin
  if DateV=0 then vDateV:=null else vDateV:=DateV;
  if (vDateV=null) and (Seria='') and (Nomer='') then begin
    Result:=Organ;
    if (nType=1) and (LichNomer<>'')
     then Result:=Trim(Result+' инд.номер '+LichNomer);
  end else begin
    p:=PasportFromValues(UdostKod,Seria,Nomer,Organ,LichNomer,vDateV);
    Result:=PasportToText(p, nType);
  end;
end;
//-----------------------------------------------------------------------
function TdmBase.PasportToText(Pasport : TPassport; nType : Integer) : String;
var
  s : String;
  sU,sU2:String;
begin
  // если тип документа неизвестен или тип равен абстрактный "документ"
  if (Pasport.UdostKod=0) or (Pasport.UdostKod=888) then begin
    if Pasport.Organ<>'' then begin
      Result:=Pasport.Organ;
    end else begin
      Result:='';
    end;
  end else if Pasport.UdostKod=999 then begin
    Result:=Pasport.Udost;  // 'документ не представлен'
  end else begin
    if Trim(Pasport.Seria+Pasport.Nomer)='' then begin
      Result:='';
    end else begin
      Result:=Pasport.Udost;
      if nType<=1 then begin
        s:=' выдан';
        case Pasport.UdostKod of
          // паспорт  РБ или иностр. гражданина или вид на жительство
          1,2,3,4 : begin
    //            Result:=Result+' номер '+Pasport.Seria+Pasport.Nomer;
                      Result:=Result+' '+Pasport.Seria+Pasport.Nomer;
                    end;
          // вид на жительство
    //      2,3 : begin
    //            Result:=Result+' серия '+Pasport.Seria+' номер '+Pasport.Nomer;
    //            Result:=Result+' серия '+Pasport.Seria+' номер '+Pasport.Nomer;
    //          end;
          else begin
            Result:=Result+' серия '+Pasport.Seria+' номер '+Pasport.Nomer;
          end;
        end;
        if (Pasport.Organ<>'') or (Pasport.sDate<>'') then Result:=Result+s;
        if (Pasport.Organ<>'') then Result:=Result+' '+Pasport.Organ;
        if (Pasport.sDate<>'') then Result:=Result+' '+Pasport.sDate;
        if (nType=1) and (Pasport.LichNomer<>'') then Result:=Result+' инд.номер '+Pasport.LichNomer;
      end else if (nType=2) or (nType=3) then begin
        if Pasport.sDate<>'' then s:=DatePropis(Pasport.Date,1)+'г.' else s:='';
        if nType=3 then begin
          sU:='<u>';
          sU2:='</u>';
        end else begin
          sU:='';
          sU2:='';
        end;
        Result:=Result+' серия '+sU+' '+Pasport.Seria+' '+sU2+'  № '+sU+' '+Pasport.Nomer+' '+sU2+' , выданный '+sU+s+sU2;
      end else if (nType=4) then begin
        Result:=Pasport.Organ;
      end else if (nType=5) then begin
        Result:=Result+' серия '+Pasport.Seria+'  № '+Pasport.Nomer;
      end;
    end;
  end;
end;

//-----------------------------------------------------------------------
function TdmBase.PasportFromValues(UdostKod:Integer; Seria,Nomer,Organ,LichNomer : String;  DateV : Variant): TPassport;
begin
  if VarIsNull(DateV) or VarIsEmpty(DateV) then begin
    Result.Date :=0;
    Result.sDate:='';
  end else begin
    try
      Result.Date  := VarToDateTime(DateV);
      Result.sDate := FormatDateTime('dd.mm.yyyy',Result.Date);
    except
      Result.Date :=0;
      Result.sDate:='';
    end;
  end;
  if UdostKod<1 then UdostKod:=1;
  Result.UdostKod := UdostKod;
  Result.Udost := GetNamePasport(UdostKod);
  Result.UdostB:= GetNamePasport(UdostKod,'Б');
  Result.Seria := Seria;
  Result.Nomer := Nomer;
  Result.LichNomer := LichNomer;
  Result.Organ := Organ;
end;

//-----------------------------------------------------------------------
function TdmBase.PasportMen(DateFiks: TDateTime; strID: String): TPassport;
var
  s : String;
  n : Integer;
  lOk : Boolean;
begin
  Result.Seria:='';
  Result.Nomer:='';
  Result.Date :=0;
  Result.Srok :=0;
  Result.sDate:='';
  Result.Organ:='';
  Result.LichNomer:='';
  if strID='' then begin
    exit;
  end;
  lOk:=true;
  if tbMens.FieldByName('ID').AsString<>strID then begin
    // найдем человека в таблице "Население"
    if tbMens.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,StrToInt(strID)]), []) then begin
      lOk:=true;
    end else begin
      lOk:=false;
    end;
  end;
  if lOk then begin
    if tbMens.FieldByName('PASP_UDOST').AsString=''
      then n := 1
      else n := tbMens.FieldByName('PASP_UDOST').AsInteger;
    Result.UdostKod := n;
    Result.Udost := GetNamePasport(n);
    Result.UdostB:= GetNamePasport(n,'Б');
    Result.Seria := tbMens.FieldByName('PASP_SERIA').AsString;
    Result.Nomer := tbMens.FieldByName('PASP_NOMER').AsString;
    Result.LichNomer := CheckRus2(tbMens.FieldByName('LICH_NOMER').AsString);
    Result.Date  := 0;
    Result.sDate := '';
    if not tbMens.FieldByName('PASP_DATE').IsNull
      then Result.Date := tbMens.FieldByName('PASP_DATE').AsDateTime;
    if not tbMens.FieldByName('PASP_SROK').IsNull
      then Result.Srok := tbMens.FieldByName('PASP_SROK').AsDateTime;
    if Result.Date>0 then begin
      Result.sDate := FormatDateTime('dd.mm.yyyy',Result.Date)+'г.';
    end;
    s := ReadOneProp( DateFiks, StrToInt(strID), 'PASP_VIDAN', ftMemo);
    if s<>'' then Result.Organ := s;
  end;
end;

//-----------------------------------------------------------------------
function TdmBase.FIOMen(DateFiks: TDateTime; strID: String; strRazd:String): String;
var
//  vKeyValues : Variant;
  strBookMark : String;
  l : Boolean;
begin
  Result:='';
  if strID='' then exit;
  try
    strBookMark := tbMens.Bookmark;
  except
    strBookMark := '';
  end;
  l := dbDisableControls(tbMens);
  // найдем человека в таблице "Население"
  if strRazd='' then strRazd:=' ';
  if tbMens.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,strID]), []) then begin
    Result:=Trim(tbMens.FieldByName('FAMILIA').AsString+strRazd+tbMens.FieldByName('NAME').AsString+strRazd+tbMens.FieldByName('OTCH').AsString);
  end;
  if strBookMark<>'' then
    tbMens.Bookmark := strBookMark;
  dbEnableControls(tbMens,l);
end;
//-------------------------------
function TdmBase.GetMenFields(DateFiks:TDateTime; strID:String; strParams:String; var arrRec: TCurrentRecord):Boolean;
var
//  vKeyValues : Variant;
  strBookMark : String;
  l : Boolean;
begin
  Result:=false;
  if (strID='') or (strID='0') then exit;
  try
    strBookMark := tbMens.Bookmark;
  except
    strBookMark := '';
  end;
  l:=dbDisableControls(tbMens);
  // найдем человека в таблице "Население"
  if tbMens.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,strID]), []) then begin
    Result:=true;
    GetCurrentRecord(tbMens, '', arrRec);        // прочитаем данные о человеке в массив
    SetLength(arrRec, Length(arrRec)+1);
    arrRec[Length(arrRec)-1].FieldName:='FIO';
    arrRec[Length(arrRec)-1].Value:=Trim(tbMens.FieldByName('FAMILIA').AsString+' '+tbMens.FieldByName('NAME').AsString+' '+tbMens.FieldByName('OTCH').AsString);
  end;
  if strBookMark<>'' then
    tbMens.Bookmark := strBookMark;
  dbEnableControls(tbMens,l);
end;
//-----------------------------------------------------------------------------------------------
function TdmBase.WriteFamiliaHistoty(strID: String; strFamilia,strNewFamilia:String; dDate:TDateTime; strGruppa:String): Boolean;
var
  lWrite:Boolean;
begin
  Result:=false;
  strFamilia:=Trim(strFamilia);
  strNewFamilia:=Trim(strNewFamilia);
  if (strNewFamilia<>'') and (strFamilia<>'') and (ANSIUpperCase(strNewFamilia)<>ANSIUpperCase(strFamilia)) then begin
    tbHistoryZAGS.IndexName := 'PR_KEY';
    tbHistoryZAGS.SetRange([TypeObj_Nasel,strID,'FAMILIA'],[TypeObj_Nasel,strID,'FAMILIA']);
    lWrite:=true;
    try
      tbHistoryZAGS.First;
      while not tbHistoryZAGS.Eof do begin
        if (ANSIUpperCase(tbHistoryZAGS.FieldByName('VALUE').AsString)=ANSIUpperCase(strNewFamilia)) and
           (tbHistoryZAGS.FieldByName('DATEIZM').AsDateTime=dDate) then begin
          lWrite:=false;
          break;
        end;
        tbHistoryZAGS.Next;
      end;
    finally
      tbHistoryZAGS.CancelRange;
    end;
    if lWrite then begin
      tbHistoryZAGS.Append;
      tbHistoryZAGS.FieldByName('TYPEOBJ').AsInteger := TypeObj_Nasel;
      tbHistoryZAGS.FieldByName('ID').AsString := strID;
      tbHistoryZAGS.FieldByName('FIELDNAME').AsString := 'FAMILIA';
      tbHistoryZAGS.FieldByName('VALUE').AsString := strFamilia;
      tbHistoryZAGS.FieldByName('DATEIZM').AsDateTime := dDate;
      tbHistoryZAGS.FieldByName('DATEZ').AsDateTime:=dDate;
      tbHistoryZAGS.FieldByName('TYPEDATE').AsInteger := 0;
      tbHistoryZAGS.FieldByName('DATEPROPIS').AsString := '';
      tbHistoryZAGS.FieldByName('INFO').AsString := '';
      tbHistoryZAGS.Post;
    end;
  end;
end;

//-----------------------------------------------------------------------------------------------
function TdmBase.ReadFamiliaHistoty(strID: String; strRazd:String): String;
begin
  Result:='';
  tbHistoryZAGS.IndexName := 'PR_KEY';
  tbHistoryZAGS.SetRange([TypeObj_Nasel,strID,'FAMILIA'],[TypeObj_Nasel,strID,'FAMILIA']);
  tbHistoryZAGS.First;
  while not tbHistoryZAGS.Eof do begin
    Result:=Result+tbHistoryZAGS.FieldByName('VALUE').AsString+strRazd;
    tbHistoryZAGS.Next;
  end;
  if Result<>'' then begin
    Result:=Copy(Result,1,Length(Result)-Length(strRazd));
  end;
  tbHistoryZAGS.CancelRange;
end;

//-----------------------------------------------------------------------------------------------------
function TdmBase.GetHistory(nTypeObj:Integer;nID:Integer;sField:String;nType:Integer;sRazd:String):String;
begin
  Result:='';
  if sRazd='' then sRazd:='  ';
  tbHistoryZAGS.IndexName := 'PR_KEY';
  tbHistoryZAGS.SetRange([nTypeObj,nID,sField],[nTypeObj,nID,sField]);
  tbHistoryZAGS.First;
  while not tbHistoryZAGS.Eof do begin
    Result:=Result+tbHistoryZAGS.FieldByName('VALUE').AsString+sRazd;
    tbHistoryZAGS.Next;
  end;
  if Result<>'' then begin
    Result:=Copy(Result,1,Length(Result)-Length(sRazd));
  end;
  tbHistoryZAGS.CancelRange;
end;

//-----------------------------------------------------------------------------------------------------
//  функция должна использоваться, если убывшего человека выбирают (и читают без миграции) на другой
//  лицевой счет, для того, чтобы он остался на старом лицевом, но под новым ID
//-----------------------------------------------------------------------------------------------------
function TdmBase.ChangeIDCopyMen( nIDSeek,nIDCopyMen : Integer): Boolean;
{$IFNDEF ZAGS}
var
  lFind,lLic : Boolean;
  sIDCopyMen,sIDSeek,strSQL:String;
  nLicID:Integer;
{$ENDIF}
begin
{$IFDEF ZAGS}
  Result:=false;
{$ELSE}
  Result:=false;
  sIDCopyMen:=IntToStr(nIDCopyMen);
  sIDSeek:=IntToStr(nIDSeek);
  strSQL:='UPDATE BaseProp SET id='+sIDCopyMen+' WHERE typeobj=3 and id='+sIDSeek+';'+
          'UPDATE BaseTextProp SET id='+sIDCopyMen+' WHERE typeobj=3 and id='+sIDSeek+';'+
          'UPDATE НаселениеДвижение SET id='+sIDCopyMen+' WHERE date_fiks='+QStr(DTOS(fmMain.DateFiks,tdAds))+' and id='+sIDSeek+';'+
          'UPDATE HistoryZAGS SET id='+sIDCopyMen+' WHERE typeobj=3 and id='+sIDSeek+';'+
          'UPDATE НаселениеДоп SET id='+sIDCopyMen+' WHERE id='+sIDSeek+';'+
          'UPDATE БазаСвойствОбъектов SET id='+sIDCopyMen+' WHERE date_fiks='+QStr(DTOS(fmMain.DateFiks,tdAds))+' and typeobj=3 and id='+sIDSeek+';'+
          'UPDATE БазаСтрок SET id='+sIDCopyMen+' WHERE date_fiks='+QStr(DTOS(fmMain.DateFiks,tdAds))+' and typeobj=3 and id='+sIDSeek+';';
  AdsConnection.Execute(strSQL);
  lFind := tbMens.Locate('DATE_FIKS;ID', VarArrayOf([fmMain.DateFiks,nIDSeek]), []);  // найдем человека
  if lFind then begin
    nLicID:=tbMens.FieldByName('LIC_ID').AsInteger;     // ID его лицевого сета
    lLic:=false;
    //--------- если человек на лицевом счете м он его глава ---------------------
    if (nLicID>0) and (tbMens.FieldByName('FIRST').AsBoolean=true) then begin
      if tbLich.Locate('DATE_FIKS;ID', VarArrayOf([fmMain.DateFiks,nLicID]), []) then begin // найдем лицевой счет
        if tbLich.FieldByName('FIRST').AsInteger=nIDSeek then begin
          tbLich.Edit;
          tbLich.FieldByName('FIRST').AsInteger:=nIDCopyMen;
          tbLich.Post;
        end;
      end;
    end;
    //----------------------------------------------------------------------------
    tbMens.Edit;
    tbMens.FieldByName('ID').AsInteger:=nIDCopyMen;
    tbMens.FieldByName('NEW_ID').AsInteger:=nIDSeek;
    tbMens.FieldByName('VUS').AsBoolean:=false;
    tbMens.FieldByName('OCHERED').AsBoolean:=false;
    tbMens.Post;
    Result:=true;
  end;
{$ENDIF}
end;

//---------------------------------------------------------------------------------------------
function TdmBase.CopyMen(DateFiks: TDateTime; strID:String; strNewLic: String; strNewAdres:String; dDateUbit:TDateTime; lSaveDvig:Boolean): Integer;
{$IFNDEF ZAGS}
var
  arrRec : TCurrentRecord;
  arrDvig : array of TCurrentRecord;
  lOk,lFirst : Boolean;
  nNewID,n,nOldID : Integer;
  Opis : TOpisEdit;
  v : Variant;
  old : TCursor;
  strLich,oldInd,strOtnosh,strBookMark:String;
  dDatePrib : TDateTime;
{$ENDIF}
begin
{$IFDEF ZAGS}
  Result:=0;
{$ELSE}
  Result:=0;
//  d:=dmBase.GetCurDate;
//  if dDateUbit=0 then dDateUbit:=d;
  old := Screen.Cursor;
  nOldID:=StrToInt(strID);
  lOk:=false;
  nNewID:=0;
  lFirst:=false;
  //-------- найдем человека ------------------
  if tbMens.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,nOldID]), []) then begin
    strLich:=tbMens.FieldByName('LIC_ID').AsString;
    lFirst:=tbMens.FieldByName('FIRST').AsBoolean;
    strOtnosh:=tbMens.FieldByName('OTNOSH').AsString;
    strBookMark:=tbMens.Bookmark;
    lOk:=true;
  end;

  if lOk then begin
    //-------- выберем лицевой, если не передан в качестве параметра -----------------
    if (strNewLic='') or (strNewAdres='') then begin
      Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_LIC');
      SetLength(arrRec,1);
      v := null;
      if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
        strNewLic   := VarToStr(GetValueField(arrRec, 'ID'));
        strNewAdres := VarToStr(GetValueField(arrRec, 'ADRES_ID'));
      end else begin
        // AddLic(); ???
      end;
      lOk := false;
      if (strNewLic<>'') then begin
        lOk := true;
      end;
    end;
  end;
  if (strNewLic=strLich) then begin  // тот же самый лицевой счет
    lOk:=false;
  end;
  dDatePrib:=0;
  if dDateUbit>0 then begin
    dDatePrib:=dDateUbit+1;
    // чтобы не было "exception" при добавлении записи в список движения
    if tbMensDvig.Locate('DATE_FIKS;ID;DATE', VarArrayOf([DateFiks,nOldID,dDateUbit]),[]) then begin
      PutError('За одну дату у человека может быть только одно перемещение.');
      lOk:=false;
    end;
  end;
  if lOk then begin
    Screen.Cursor := crHourGlass;
    //---------- если есть Дата Убытия ----------------------------
    if dDateUbit>0 then begin
      // добавим в движение, что человек убыл
      with tbMensDvig do begin
        Append;
        FieldByName('DATE_FIKS').AsDateTime := DateFiks;
        FieldByName('ID').AsInteger         := nOldID;
        FieldByName('TIP').AsString     := MIGR_UBIL; // убыл
        FieldByName('CONTANT').AsInteger:= 1;  // постоянно
        FieldByName('TALON').AsInteger  := 0;
        FieldByName('DATE').AsDateTime  := dDateUbit;
        FieldByName('PRICH').AsInteger  := 0;
        FieldByName('ORGAN').AsString   := '';
        Post;
      end;
    end;
    //-------------------------------------------------------------

    tbMens.Bookmark:=strBookMark;  // !!!   был ранее Locate

    GetCurrentRecord(tbMens, '', arrRec);        // прочитаем данные о человеке в массив
    nNewId := GetNewID( TypeObj_Nasel );  // получим ID для старой копии человеека

    //-- !!! ----------------------------
    //  nNewID  - новый ID для старой ("брошенной" копии человека) на старом лицевом счете
    //  nOldID  - актуальные данные о человеке остаются по старому ID на новом лицевом счете
    //-----------------------------------

    // изменим данные о человеке на новые
    tbMens.CheckBrowseMode;
    tbMens.Edit;
    tbMens.FieldByName('LIC_ID').AsString:=strNewLic;
    tbMens.FieldByName('ADRES_ID').AsString:=strNewAdres;
    tbMens.FieldByName('FIRST').AsBoolean:=false;

    //---------- если есть Дата Убытия ----------------------------
    if dDateUbit>0 then begin
      tbMens.FieldByName('DATEP').AsDateTime:=dDatePrib;
    end;
    //-------------------------------------------------------------

    tbMens.FieldByName('OTNOSH').AsString:='';  // может выбрать ?
    tbMens.Post;

    Result:=StrToInt(strNewLic);
  end;
  if lOk then begin
    if not tbLich.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,StrToInt(strLich)]), []) // найдем лицевой счет
      then lOk:=false;
    if lOk then begin
      if nNewID > 0 then begin
        // перенесем движение в старую копию человека
        oldInd:=tbMensDvig.IndexName;
        tbMensDvig.IndexName := 'PR_KEY';
        tbMensDvig.SetRange([DateFiks,nOldID],[DateFiks,nOldID]);
        tbMensDvig.First;
        //------ с сохранением движения в новой копии --------------------------
        if lSaveDvig then begin
          try
            n:=0;
            while not tbMensDvig.Eof and (tbMensDvig.FieldByName('ID').AsInteger=nOldID) do begin
              SetLength(arrDvig, n+1);
              GetCurrentRecord(tbMensDvig,'',arrDvig[n]);
              SetValueField(arrDvig[n],'ID',nNewID);   // изменим ID
              Inc(n,1);
              tbMensDvig.Next;
            end;
          finally
            tbMensDvig.CancelRange;
            tbMensDvig.IndexName:=oldInd;
          end;
          for n:=0 to Length(arrDvig)-1 do begin
            AddCurrentRecord(tbMensDvig,arrDvig[n]);
          end;
        end else begin
          //------ без сохранения движения в новой копии --------------------------
          try
            while (tbMensDvig.FieldByName('ID').AsInteger=nOldID) do begin
              tbMensDvig.Edit;
              tbMensDvig.FieldByName('ID').AsInteger:=nNewID;
              tbMensDvig.Post;
              tbMensDvig.First;
            end;
          finally
            tbMensDvig.CancelRange;
            tbMensDvig.IndexName:=oldInd;
          end;
          //-----------------------------------------------------------------
        end;
        //---------- если есть Дата Убытия ----------------------------
        if dDateUbit>0 then begin
          // добавим в движение, что человек прибыл на новый лицевой счет
          with tbMensDvig do begin
            Append;
            FieldByName('DATE_FIKS').AsDateTime := DateFiks;
            FieldByName('ID').AsInteger         := nOldID;   // ID актуальной копии человека
            FieldByName('TIP').AsString     := MIGR_PRIB; // прибыл
            FieldByName('CONTANT').AsInteger:= 1;  // постоянно
            FieldByName('TALON').AsInteger  := 0;
            FieldByName('DATE').AsDateTime  := dDatePrib;
            FieldByName('PRICH').AsInteger  := 0;
            FieldByName('ORGAN').AsString   := '';
            Post;
          end;
        end;
        //-------------------------------------------------------------
        // скоректируем данные старой копии и запишем без списков
        SetValueField(arrRec,'ID',nNewID);    // изменим ID в старой копии
        SetValueField(arrRec,'FIRST',lFirst);
        SetValueField(arrRec,'ADRES_ID', tbLich.FieldByName('ADRES_ID').AsInteger );
        SetValueField(arrRec,'LIC_ID',StrToInt(strLich));
        SetValueField(arrRec,'NEW_ID',nOldID);           // ссылка на новый("старый") идентификатор человека
        SetValueField(arrRec,'VUS',false);
        SetValueField(arrRec,'OCHERED',false);

        //---------- если есть Дата Убытия ----------------------------
        if dDateUbit>0 then begin
          SetValueField(arrRec,'DATEV', dDateUbit);
          SetValueField(arrRec,'CANDELETE', true);
        end;
        //-------------------------------------------------------------

        if lFirst then begin
          tbLich.Edit;
          tbLich.FieldByName('FIRST').AsInteger := nNewID;
          tbLich.Post;
        end;
        if strOtnosh<>'' then SetValueField(arrRec,'OTNOSH',strOtnosh);

        AddCurrentRecord(tbMens, arrRec);    // запись старой копии на диск

        //---------- если есть Дата Убытия ----------------------------
        if dDateUbit>0 then begin
          n:=CountMens(DateFiks, strLich);  // может никого не осталось
          if n=0 then begin                 // тогда ликвидируем лицевой счет
            tbLich.Edit;
            tbLich.FieldByName('CANDELETE').AsBoolean:=true;
            tbLich.FieldByName('DATE_LIKV').AsDateTime:=dDateUbit;
            tbLich.Post;
          end;
        end;
        //-------------------------------------------------------------

      end;
    end;
  end;
  Screen.Cursor := old;
{$ENDIF}
end;
//------- список лицевых счетов по адресу ---------------------------------
function TdmBase.HouseLic(DateFiks:TDateTime; IdAdres:Integer) : String;
begin
  Result:='';
  WorkQuery.SQL.Text:='SELECT nomer FROM ЛицевыеСчета WHERE date_fiks='+DateToSQL(DateFiks)+' and adres_id='+IntToStr(IdAdres);
  WorkQuery.Open;
  while not WorkQuery.Eof do begin
    Result:=Result+WorkQuery.Fields[0].AsString+', ';
    WorkQuery.Next;
  end;
  WorkQuery.Close;
  if Result<>''
    then Result:=Copy(Result,1,Length(Result)-2);
end;
//--------------------------------
function TdmBase.HouseOwners_old(DateFiks:TDateTime; strIdAdres:String; obj:TObject; nType:Integer) : String;
begin
 Result:=HouseOwners(DateFiks,strIdAdres,obj,nType,nil,nil, nil);
end;
// nType=1, добавить какой частью владеет
// nType=3, добавить адрес собственника
// nType=4, добавить какой частью владеет+адрес собственника
// nType=2, то возвращаем '0'-част+огр  '1'-если только частные собственники  '2'-только организ.
// по умолчанию: slPar.Values['MEN_ID']=0   slPar.Values['DELIM']=', '
function TdmBase.HouseOwners(DateFiks:TDateTime; strIdAdres:String; obj:TObject; nType:Integer;
                             tbOwnersExternal:TDataSet; tbMens:TDataSet; slPar:TStringList) : String;
var
  s, sDelimT, sDelim, strAdres, strName,sBookmark : String;
  lPropis,l2, lMen,lOrg : Boolean;
  lOk:Boolean;
  d : TDateTime;
  sl:TStringList;
  tb:TDataSet;
  tbOwners:TDataSet;
  nIDMen:Integer;
begin
  Result := '';
  sl:=nil;
  tb:=nil;
  if obj<> nil then begin
    if obj is TStringList then sl:=TStringList(obj);
    if obj is TDataSet    then tb:=TDataSet(obj);
  end;
  if sl<>nil then sl.Clear;
  if strIdAdres='' then begin
    Result := '';
    exit;
  end;
  if tbOwnersExternal=nil then begin   // идем по базе
    tbHouseOwners.IndexName := 'VIEW_KEY';
    tbHouseOwners.SetRange([DateFiks,strIdAdres],[DateFiks,strIdAdres]);
    tbOwners:=tbHouseOwners;
  end else begin
    tbOwners:=tbOwnersExternal;       // идем по переданному Dataset`у
    tbOwners.First;
  end;
  if DateFiks=GetDateCurrentSost then begin
    d := GetCurDate;
  end else begin
    d := DateFiks;
  end;
  nIDMen:=0;
  sDelim:=', ';
  sDelimT:='-';
  if slPar<>nil then begin
    nIDMen:=StrToIntDef(slPar.Values['MEN_ID'],0);
    sDelim:=ValueFromParams(slPar,'DELIM',', ');
    sDelimT:=ValueFromParams(slPar,'TAIL','-');
  end;
  lMen:=false;
  lOrg:=false;
  while not tbOwners.Eof do begin
    //----------------------------------------
    lOk:=false;
    if tbOwners.FieldByName('DATES').IsNull and tbOwners.FieldByName('DATEP').IsNull then begin
      lOk:=true;
    end else if not tbOwners.FieldByName('DATES').IsNull and not tbOwners.FieldByName('DATEP').IsNull then begin
      if (tbOwners.FieldByName('DATES').AsDateTime<=d) and (d<=tbOwners.FieldByName('DATEP').AsDateTime) then begin
        lOk:=true;
      end;
    end else if tbOwners.FieldByName('DATES').IsNull then begin
      if (d<=tbOwners.FieldByName('DATEP').AsDateTime) then begin
        lOk:=true;
      end;
    end else if tbOwners.FieldByName('DATEP').IsNull then begin
      if (tbOwners.FieldByName('DATES').AsDateTime<=d) then begin
        lOk:=true;
      end;
    end;
    //----------------------------------------
    if lOk then begin
      // ПРОВЕРИТЬ:  переданный в качестве параметра человек является-ли собственником
      if (tbOwners.FieldByName('TYPEKOD').AsInteger=OWNER_NASEL) and (nIDMen>0) then begin
        if tbOwners.FieldByName('KOD').AsInteger=nIDMen then begin
          slPar.Add('MEN_ID_FIND=1');
        end;
      end;
      strName:='';
      strAdres:='';
      if nType=2 then begin
        if (tbOwners.FieldByName('TYPEKOD').AsInteger=OWNER_NASEL) then begin  // человек
          lMen:=true;
        end else begin
          lOrg:=true;
        end;
      end else begin
        if (tbMens<>nil) and (tbOwners.FieldByName('TYPEKOD').AsInteger=OWNER_NASEL) then begin  // человек
          // поищем в текущем списке людей
          l2:=dbDisableControls(tbMens);
          sBookmark:=tbMens.Bookmark;
          tbMens.First;
          while not tbMens.Eof do begin
            if tbOwners.FieldByName('KOD').AsInteger=tbMens.FieldByName('ID').AsInteger then begin
              strName:=tbMens.FieldByName('FAMILIA').AsString+' '+tbMens.FieldByName('NAME').AsString+' '+tbMens.FieldByName('OTCH').AsString;
              break;
            end;
            tbMens.Next;
          end;
          tbMens.Bookmark:=sBookmark;
          dbEnableControls(tbMens,l2);
        end;
        if (strName='') or (nType=3) or (nType=4) then begin
          strAdres := AdresOwner(DateFiks, tbOwners.FieldByName('KOD').AsString,
                                 tbOwners.FieldByName('TYPEKOD').AsInteger, strName, lPropis);
        end;
        if sl<>nil then begin
          sl.Add(strName + ' ' + tbOwners.FieldByName('TAIL').AsString);
        end;
        //----- добавим часть ----------------
        if (nType=1) or (nType=4)then begin
//          if tb<>nil then begin
//          end;
          s := tbOwners.FieldByName('TAIL').AsString;
          if (s<>'') and (s<>'1') then s := sDelimT + s + ' '+NAME_TAIL; //' часть';
          strName:=strName + s;
        end;
        //---- добавим адрес -------------
        if (nType=3) or (nType=4)then begin
          if strAdres<>''
            then strName:=strName + sDelimT + strAdres;
        end;
        Result := Result + strName + sDelim;
      end;
    end;
    tbOwners.Next;
  end;
  if nType=2 then begin
    if lMen and lOrg then begin
      Result:='0';
    end else if lOrg then begin
      Result:='2';
    end else begin
      Result:='1';
    end;
  end else begin
    if nType=1 then begin
      Result := Copy(Result,1,Length(Result)-Length(sDelim));
    end;
  end;
  if tbOwnersExternal=nil then begin   // идем по базе
    tbHouseOwners.CancelRange;
  end;
end;

// tbOwners таблица в которую поместить результат
{
function TdmBase.HouseOwners2(DateFiks: TDateTime; strIdAdres: String; nType : Integer; tbOwners:TDataSet) : String;
var
  strName,strID,strTail : String;
  nTypeM  : Integer;
  lOk:Boolean;
  d,dDate : TDateTime;
  fld:TField;
  ds:TDataSet;
begin
  Result := '';
  if strIdAdres='' then exit;
  tbHouseOwners.IndexName := 'VIEW_KEY';
  tbHouseOwners.SetRange([DateFiks,strIdAdres],[DateFiks,strIdAdres]);
  if DateFiks=GetDateCurrentSost then begin
    d := GetCurDate;
  end else begin
    d := DateFiks;
  end;
  while not tbHouseOwners.Eof do begin
//    AdresOwner(DateFiks, tbHouseOwners.FieldByName('KOD').AsString,
//               tbHouseOwners.FieldByName('TYPEKOD').AsInteger, strName, lPropis);
    //----------------------------------------
    lOk:=false;
    if tbHouseOwners.FieldByName('DATES').IsNull and tbHouseOwners.FieldByName('DATEP').IsNull then begin
      lOk:=true;
    end else if not tbHouseOwners.FieldByName('DATES').IsNull and not tbHouseOwners.FieldByName('DATEP').IsNull then begin
      if (tbHouseOwners.FieldByName('DATES').AsDateTime<=d) and (d<=tbHouseOwners.FieldByName('DATEP').AsDateTime) then begin
        lOk:=true;
      end;
    end else if tbHouseOwners.FieldByName('DATES').IsNull then begin
      if (d<=tbHouseOwners.FieldByName('DATEP').AsDateTime) then begin
        lOk:=true;
      end;
    end else if tbHouseOwners.FieldByName('DATEP').IsNull then begin
      if (tbHouseOwners.FieldByName('DATES').AsDateTime<=d) then begin
        lOk:=true;
      end;
    end;
    //----------------------------------------
    if lOk then begin
      strID   := tbHouseOwners.FieldByName('KOD').AsString;
      nTypeM  := tbHouseOwners.FieldByName('TYPEKOD').AsInteger;
      strTail := Trim(tbHouseOwners.FieldByName('TAIL').AsString);
      if (strTail<>'') and (strTail<>'1') then strTail := '- ' + strTail + ' часть';
      strName:='';
      dDate:=0;
      if (strID<>'') and (nTypeM<>0) then begin
        if nTypeM = OWNER_NASEL then begin  // человек
          ds:=GetMen(DateFiks, strID);
          if ds<>nil then begin
            strName := ds.FieldByName('FAMILIA').AsString+' '+ds.FieldByName('NAME').AsString+' '+ds.FieldByName('OTCH').AsString;
            if not ds.FieldByName('DATER').IsNull then dDate := ds.FieldByName('DATER').AsDateTime;
          end;
        end else begin
          if SprWork.Locate('ID',strID,[]) then begin
            strName := SprWork.FieldByName('NAME').AsString;
          end;
        end;
        if (tbOwners<>nil) and (strName<>'') then begin
          tbOwners.Append;
          tbOwners.FieldByName('NAME').AsString:=strName;
          fld:=tbOwners.FindField('TAIL');
          if fld<>nil then tbOwners.FieldByName('TAIL').AsString:=strTail;
          fld:=tbOwners.FindField('DATER');
          if (fld<>nil) and (dDate>0) then tbOwners.FieldByName('DATER').AsDateTime:=dDate;
          tbOwners.Post;
        end;
        if nType<>1    then strTail:='';
        if strName<>'' then Result := Result + strName + strTail + ', ';
      end;
    end;
    tbHouseOwners.Next;
  end;
  if Result<>''
    then Result := Copy(Result,1,Length(Result)-2);
  tbHouseOwners.CancelRange;
end;
}
//-----------------------------------------------------------------
function TdmBase.CheckSprOtnosh(strName:String):Integer;
begin
  if not SprOtnosh.Locate('NAME',strName,[loCaseInsensitive]) then begin
    sprOtnosh.Append;
    SprOtnosh.FieldByName('NAME').AsString:=strName;
    SprOtnosh.Post;
  end;
  Result:=SprOtnosh.FieldByName('ID').AsInteger;
end;
//-----------------------------------------------------------------
function TdmBase.GetOtnoshMen(nID:Integer):String;
begin
  if nID=0 then begin
    Result:='';
  end else if SprOtnosh.Locate('ID',nID,[]) then begin
    Result:=LowerCase(SprOtnosh.FieldByName('NAME').AsString);
  end else begin
    Result:='';
  end;
end;

//-----------------------------------------------------------------
function TdmBase.GetTypePunkt( strType : String; strLF : String; var strName : String ) : Integer;
var
  lBel,lFull : Boolean;
begin
  Result:=0;
  strName:='';
  if strType<>'' then begin
    strLF:=ANSIUpperCase(strLF);
    if (Pos('Б',strLF)>0) or (Pos('B',strLF)>0) then lBel:=true else lBel:=false;
    if (Pos('П',strLF)>0) or (Pos('F',strLF)>0) then lFull:=true else lFull:=false;
    // найдем тип нас пункта
    if TypePunkt.Locate('ID',strType,[]) then begin
      if lFull then begin
        strName := Trim(TypePunkt.FieldByName('FNAME').AsString);
      end else begin
        if lBel
          then strName := Trim(TypePunkt.FieldByName('NAME_B').AsString)
          else strName := Trim(TypePunkt.FieldByName('NAME').AsString);
      end;
      if strName='-' then strName:='';
      Result := TypePunkt.FieldByName('ID').AsInteger;
    end;
  end;
end;

//-------------------------------------------------------------------------------------
//
function TdmBase.CheckRunMen(nTypeObj:Integer; nType:Integer; nID:Integer; var recID:TID; lSaveSost:Boolean): Boolean;
var
  ds:TDataSet;
  nLicID:Integer;
  s1,s2,s3: TBookmarkStr;
begin
  Result:=false;
  if nType=CHECK_EN then begin   // контроль льоты по электроэнегрии
    if Globaltask.ParamAsBoolean('AUTO_LGOT_EN') then begin
      if lSaveSost then begin
        dmBase.tbMens.CheckBrowseMode;
        dmBase.tbMensAdd.CheckBrowseMode;
        dmBase.tbLich.CheckBrowseMode;
        s1:=dmBase.tbMens.Bookmark;
        s2:=dmBase.tbMensAdd.Bookmark;
        s3:=dmBase.tbLich.Bookmark;
      end;
      if tbMens.FieldByName('ID').AsInteger<>nID
        then ds:=GetMen(GetDateCurrentSost,IntToStr(nID))
        else ds:=tbMens;
      if ds<>nil then begin
        // если человек со льготного по адресу лицевого счета
        nLicID:=ds.FieldByName('LIC_ID').AsInteger;
        if nLicID>0 then begin
          if tbMensAdd.Locate('EN_LIC_ID', nLicID, []) then begin
            // справку надо выдавать главе личевого счета
            if tbLich.Locate('DATE_FIKS;ID', VarArrayOf([GetDateCurrentSost,nLicID]), []) then begin
              recID.Lic:=nLicID;
              recID.Men:=tbLich.FieldByName('FIRST').AsInteger;
              recID.Obj:=recID.Men;
              recID.Adres:=tbLich.FieldByName('ADRES_ID').AsInteger;
              Result:=true;
//              Result:=tbLich.FieldByName('FIRST').AsInteger;
            end;
          end;
        end;
      end;
      if lSaveSost then begin
        dmBase.tbMens.Bookmark:=s1;
        dmBase.tbMensAdd.Bookmark:=s2;
        dmBase.tbLich.Bookmark:=s3;
      end;
    end;
  end;
end;

//-------------------------------------------------------------------------------------
{
function TdmBase.WriteSostavSem1(nID,nMemberID:Integer; SostavSem:TDataMen) : Boolean;
var
  lAdd:Boolean;
  st:TSostTable;
begin
  Result:=true;
  st:=SaveSostTable(tbSostavSem,false,false);
  lAdd:=false;
  if nMemberID>0 then begin
    if (tbSostavSem.FieldByName('ID').AsInteger<>nID) or (tbSostavSem.FieldByName('MEMBER_ID').AsInteger<>nMemberID) then begin
      tbSostavSem.IndexName:='FIND_KEY';
      if not tbSostavSem.FindKey([nID,nMemberID]) then begin
        lAdd:=true;
      end;
    end;
  end else begin
    lAdd:=true;
  end;
  try
    if lAdd then begin
      tbSostavsem.Append;
    end else begin
      tbSostavsem.Edit;
    end;
    if SostavSem.MEN_ID>-1 then dmBase.tbSostavSem.FieldByName('ID').AsInteger:=SostavSem.MEN_ID;
    if SostavSem.NOMER>-1  then dmBase.tbSostavSem.FieldByName('NOMER').AsInteger:=SostavSem.NOMER;
    if SostavSem.OTNOSH>-1 then dmBase.tbSostavSem.FieldByName('OTNOSH').AsInteger:=SostavSem.OTNOSH;
    dmBase.tbSostavSem.FieldByName('MEMBER_ID').AsInteger:=SostavSem.MEMBER_ID;
    dmBase.tbSostavSem.FieldByName('FAMILIA').AsString:=SostavSem.FAMILIA;
    dmBase.tbSostavSem.FieldByName('NAME').AsString:=SostavSem.NAME;
    dmBase.tbSostavSem.FieldByName('OTCH').AsString:=SostavSem.OTCH;
    dmBase.tbSostavSem.FieldByName('POL').AsString:=SostavSem.POL;
    if SostavSem.DATER>0 then  dmBase.tbSostavSem.FieldByName('DATER').AsDateTime:=SostavSem.DATER;
    dmBase.tbSostavSem.Post;
  except
    on E: Exception do begin
      Result:=false;
      dmBase.tbSostavSem.Cancel;
      PutError(E.Message);
    end;
  end;
  RestSostTable(tbSostavSem,st);
end;
}
//--------------------------------------------------------------
function TdmBase.GetLastReshOch(resh:TReshOchMen; nID:Integer; nOch:Integer; dDate:TDateTime): Boolean;
//var
//  n:integer;
begin
  Result:=false;
{
  n:=0;

  lPlan:=false;
  with dmBase.tbOcheredResh do begin
    IndexName := 'PR_KEY';
    SetRange([nID,nOch],[nID,nOch]);
    if not Eof then begin
      while not Eof do begin
        // не проектные решения
        if not FieldByName('PLAN').IsNull and not FieldByName('PLAN').AsBoolean then begin
          if FieldByName('DATER').IsNull
        end;
          lPlan:=true;
        end else begin
          Inc(n,1);
        end;
        Next;
      end;
    end;
    CancelRange;
  end;
  if lPlan then begin
    if n>0
      then Result:=true
      else Result:=false;
  end else begin
    Result:=true;
  end;
//  if not Result  then ShowMessage(IntToStr(nID));
}
end;
//-----------------------------------------------------------------
function TdmBase.FillReshOch(resh:TReshOchMen; nIDResh:Integer): Boolean;
begin
  Result:=GetReshOch_(resh,nIDResh);
end;
//-----------------------------------------------------------------
function TdmBase.GetReshOch(nIDResh:Integer): TReshOchMen;
var
  resh:TReshOchMen;
begin
  resh:=TReshOchMen.Create;
  GetReshOch_(resh,nIDResh);
  Result:=resh;
end;
//-----------------------------------------------------------------
function TdmBase.GetReshOch_(resh:TReshOchMen; nIDResh:Integer): Boolean;
{$IFDEF ZAGS}
begin
  Result:=false;
end;
{$ELSE}
var
 strBM:String;

 procedure ClearResh_;
 begin
   Resh.FIDMen:=0;
   Resh.FTip:=-1;
   Resh.FAutoID:=-1;
   Resh.FOchered_Id:=0;
   Resh.FNomer:='';
   Resh.FOtkaz:=false;
   Resh.FDateR:=0;
   Resh.FDateSila:=0;
   Resh.FOsnov:=0;
   Resh.FOsnov2:=0;
   Resh.FOsnovText:='';
   Resh.FOsnovText2:='';
   Resh.FId1:=0;
   Resh.FId2:=0;
   Resh.FTextResh:='';
   Resh.FTextVipis:='';
   Resh.FAddInfo:='';
   Resh.FProv:=true;
   Resh.FPlan:=false;
   Resh.FRazdel:=false;
   Resh.FBookmark:='';
 end;
 procedure GetResh_;
 begin
   with tbOcheredResh do begin
     Resh.FIDMen:=FieldByName('ID').AsInteger ;
     Resh.FTip:=FieldByName('TIP').AsInteger ;
     Resh.FAutoID:=FieldByName('Auto_ID').AsInteger ;
     Resh.FOchered_Id:=FieldByName('OCHERED_ID').AsInteger;
     if FieldByName('OTKAZ').IsNull
       then Resh.FOtkaz:=false
       else Resh.FOtkaz:=FieldByName('OTKAZ').AsBoolean;
     Resh.FNomer:=FieldByName('NOMER').AsString;
     if FieldByName('DATER').IsNull     then Resh.FDateR:=0     else Resh.FDateR:=FieldByName('DATER').AsDateTime;
     if FieldByName('DATE_SILA').IsNull then Resh.FDateSila:=0  else Resh.FDateSila:=FieldByName('DATE_SILA').AsDateTime;

     if ReshIsPostanovka(resh.FTip) and (Resh.FDateSILA=0) then begin // если в решении не заполнена дата постановки
       strBM:=tbOchered.Bookmark;
       if tbOchered.Locate('OCHERED_ID;ID', VarArrayOf([Resh.FOchered_Id,resh.FIDMen]),[]) then begin
         if not tbOchered.FieldByName('DEC_DATE').IsNull then Resh.FDateSila:=tbOchered.FieldByName('DEC_DATE').AsDateTime;
       end;
       tbOchered.Bookmark:=strBM;
     end;

     Resh.FOsnov:=FieldByName('OSNOV').AsInteger;
     Resh.FOsnov2:=FieldByName('OSNOV2').AsInteger;
     Resh.FOsnovText:=FieldByName('OSNOV_TEXT').AsString;
     Resh.FOsnovText2:=FieldByName('OSNOV_TEXT2').AsString;
     Resh.FId1:=FieldByName('ID1').AsInteger;
     Resh.FId2:=FieldByName('ID2').AsInteger;
     Resh.FTextResh:=FieldByName('TEXTRESH').AsString;
     Resh.FTextVipis:=FieldByName('TEXTVIPIS').AsString;
     Resh.FAddInfo:=FieldByName('ADDINFO').AsString;
     if FieldByName('PROV').IsNull
       then Resh.FProv:=true
       else Resh.FProv:=FieldByName('PROV').AsBoolean;
     if FieldByName('PLAN').IsNull
       then Resh.FPlan:=false
       else Resh.FPlan:=FieldByName('PLAN').AsBoolean;
     if FieldByName('RAZD').IsNull
       then Resh.FRazdel:=false
       else Resh.FRazdel:=FieldByName('RAZD').AsBoolean;
     Resh.FBookmark:=Bookmark;
   end;
 end;
begin
  result:=false;
  if nIDResh<0 then begin  // вернуть текущее решение (на котором стоим)
    getResh_;
    if resh.Tip>-1 then result:=true;
    exit;
  end;
  clearResh_;
  if tbOcheredResh.Locate('AUTO_ID',nIDResh,[]) then begin
    getResh_;
  end;
  if resh.Tip>-1 then result:=true;
end;
{$ENDIF}

function TdmBase.SostavSemToStr(strID:String; strType:String; strRazd:String) : String;
var
 s,sCur,sIDNotRead : String;
 lCheckOch,lIskl:Boolean;
 n,i:Integer;
 arr : TArrStrings;
 st : TSostTable;
begin
 // 'NPP;FIO;OTN;YEAR;DATE'      -nID1,nID2     список ID которые не надо читать

  i:=Pos('+ALL',strType);
  if i>0 then lCheckOch:=false else lCheckOch:=true;     // контроль реквизита OCH-вхождение в состав семьи очередника
  strType:=StringReplace(strType,'+ALL','',[]);

  i:=Pos('-',strType);
  sIDNotRead:='';
  if i>0 then begin
    sIDNotRead:=Copy(strType,i+1,Length(strType));
    sIDNotRead:=StringReplace(sIDNotRead,';',',',[rfReplaceAll])+',';  // на всякий случай заменим ';' на ','
    strType:=Copy(strType,1,i-1);
  end;

  StrToArr(UpperCase(strType),arr,';',true);
  Result:='';
//  if (Pos('13',strRazd)>0) then strRazd:=Chr(13)+Chr(10);
  if strRazd='' then strRazd:=', ';
  st:=SaveSostTable(tbSostavSem,true,false);
  tbSostavSem.IndexName:='PR_KEY';
  tbSostavSem.SetRange([strID],[strID]);
  try
    n:=1;
    while not tbSostavSem.Eof do begin
      sCur:='';
      if tbSostavSem.FieldByName('ISKL').IsNull
        then lIskl:=false
        else lIskl:=tbSostavSem.FieldByName('ISKL').AsBoolean;
      if ( (sIDNotRead='') or (Pos(tbSostavSem.FieldByName('MEMBER_ID').AsString+',',sIDNotRead)=0) ) and
         ( (lCheckOch=false) or (lIskl=false) ) then begin
        for i:=0 to Length(arr)-1 do begin
          try
            if arr[i]='NPP' then begin
              sCur:=sCur+IntToStr(n)+'. ';
            end else if arr[i]='FIO' then begin
              sCur:=sCur+Trim(tbSostavSem.FieldByName('FAMILIA').AsString+' '+tbSostavSem.FieldByName('NAME').AsString+' '+
                              tbSostavSem.FieldByName('OTCH').AsString)+' ';
            end else if Copy(arr[i],1,3)='OTN' then begin
              s:=tbSostavSem.FieldByName('OTNOSH').AsString;
              if s<>'' then begin
                if SprOtnosh.Locate('ID', s, []) then begin
                  s:=ANSILowerCase(SprOtnosh.FieldByName('NAME').AsString);
                end;
                sCur:=sCur+s+' ';
              end;
            end else if Copy(arr[i],1,3)='YEA' then begin
              if not tbSostavSem.FieldByName('DATER').IsNull
                then sCur:=sCur+IntToStr(YearOf(tbSostavSem.FieldByName('DATER').AsDateTime))+'г.р. ';
            end else if Copy(arr[i],1,3)='DAT' then begin
              if not tbSostavSem.FieldByName('DATER').IsNull then begin
                if Right(arr[i],1)='R' then begin
                  n:=6;
                end else begin
                  try
                    n:=StrToInt(Right(arr[i],1));
                  except
                    n:=6;
                  end;
                end;
                sCur:=sCur+DatePropis(tbSostavSem.FieldByName('DATER').AsDateTime,n)+' ';
              end;
            end;
          except
             // в случае ошибки ничего не добавляем
          end;
        end;
      end;
      if sCur<>'' then begin
        Result:=Result+Trim(sCur);
        Inc(n);
      end;
      tbSostavSem.Next;
      if (sCur<>'') then begin
        if not tbSostavSem.Eof then Result:=Result+strRazd;
      end;
    end;
    if RightStr(Result,Length(strRazd))=strRazd then begin
      Result:=Copy(Result,1,Length(Result)-Length(strRazd));
    end;
  finally
    tbSostavSem.CancelRange;
    RestSostTable(tbSostavSem,st);
  end;
end;
//-------------------------------------------------------------------------------------------------------------------
// !nType = 0  все дети лицевого счета, независимо от PA_ID и MA_ID
// !nType = 1  все дети у которых установлено PA_ID или MA_ID
// !nType = 2  дети с лицевого счета у которых установлено PA_ID или MA_ID
function TdmBase.GetDeti(dsDeti:TDataSet; strID:String; strPol:String; Vozr1,Vozr2:Integer; lOnlyLic:Boolean; lNotPasport:Boolean; nTypeAktRogd:Integer):Boolean;
var
  nVozr : Integer;
  strLicID,oldInd,s,ss:String;
  ds:TDataSet;
  lOk:Boolean;
begin
  Result:=true;
//  if (nType=0) or (nType=2) then begin
//    lOnlyLic:=true;
//  end;
//  SetLength(Result,0);
  tbMens.CancelRange;
  try
    strLicID:='';
    // если собрать детей только с лицевого счета
    if lOnlyLic then begin
      ds:=getMen(fmMain.DateFiks,strId);
      if ds<>nil then begin
        if strPol=''
          then strPol:=ds.FieldByName('POL').AsString;
        if ds.FieldByName('LIC_ID').AsInteger>0 then begin
          strLicID:=ds.FieldByName('LIC_ID').AsString;
        end;
      end;
    end;
    oldInd:=tbMens.IndexFieldNames;

    // tbMens.IndexFieldNames := 'DATE_FIKS;ID';

    if strPol='М'
      then tbMens.IndexFieldNames := 'DATE_FIKS;PA_ID'
      else tbMens.IndexFieldNames := 'DATE_FIKS;MA_ID';
    tbMens.SetRange([fmMain.DateFiks,strId],[fmMain.DateFiks,strId]);

//    i:=0;
    while not tbMens.Eof do begin
      if (strLicID='') or (tbMens.FieldByName('LIC_ID').AsString=strLicID) then begin
        if tbMens.FieldByName('DATER').IsNull then begin
          nVozr:=0;
        end else begin
          nVozr:=GetCountYear(GetCurDate,tbMens.FieldByName('DATER').AsDateTime);
        end;
        if (nVozr>=Vozr1) and (nVozr<=Vozr2) then begin
          lOk := true;
          if lNotPasport then begin
            if (tbMens.FieldByName('PASP_NOMER').AsString<>'') and not tbMens.FieldByName('PASP_DATE').IsNull then begin
              lOk:=false;
            end;
          end;
          if lOk then begin
            dsDeti.Append;
            dsDeti.FieldByName('OWNER').AsString:=tbMens.FieldByName('OWNER_ID').AsString;
            dsDeti.FieldByName('FAMILIA').AsString:=tbMens.FieldByName('FAMILIA').AsString;
            dsDeti.FieldByName('NAME').AsString:=tbMens.FieldByName('NAME').AsString;
            dsDeti.FieldByName('OTCH').AsString:=tbMens.FieldByName('OTCH').AsString;
            dsDeti.FieldByName('POL').AsString:=tbMens.FieldByName('POL').AsString;
            if dsDeti.FieldByName('POL').AsString='М'
              then dsDeti.FieldByName('OTNOSH_NAME').AsString:='сын'
              else dsDeti.FieldByName('OTNOSH_NAME').AsString:='дочь';
            dsDeti.FieldByName('OTNOSH').AsInteger:=tbMens.FieldByName('OTNOSH').AsInteger;
            if tbMens.FieldByName('DATER').IsNull then begin
              dsDeti.FieldByName('DATER').AsString:='';
            end else begin
              dsDeti.FieldByName('DATER').AsDateTime:=tbMens.FieldByName('DATER').AsDateTime;
            end;
            dsDeti.FieldByName('AGE').AsInteger:=nVozr;
            // соберем акт о рождении
            s:='';
            if (tbMens.FieldByName('AKT_ROGD_NOMER').AsString<>'') and not tbMens.FieldByName('AKT_ROGD_DATE').IsNull then begin
              s:='з/а о рождении №'+tbMens.FieldByName('AKT_ROGD_NOMER').AsString+' от '+DatePropis(tbMens.FieldByName('AKT_ROGD_DATE').AsDateTime,3);
            end;
            if (s<>'') and tbMensAdd.Locate('ID',tbMens.FieldByName('ID').AsString,[]) and (tbMensAdd.FieldByName('AKT_ROGD_ORGAN').AsString<>'') then begin
              if nTypeAktRogd=0 then begin
                s:=s+', '+tbMensAdd.FieldByName('AKT_ROGD_ORGAN').AsString;
              end else begin
                ss:=fmMain.GetPadeg(tbMensAdd.FieldByName('AKT_ROGD_ORGAN').AsString,'Т');
                if ss<>'' then s:=s+' составлена '+ss;
              end;
            end;
            dsDeti.FieldByName('AKT_ROGD').AsString:=s;

            dsDeti.Post;
//            Inc(i,1);
          end;
        end;
      end;
      tbMens.Next;
    end;
  finally
    tbMens.CancelRange;
    tbMens.IndexFieldNames:=oldInd;
  end;
  dsDeti.First;
end;

//----------------------------------------------------------------------------------------------------------------------
function TdmBase.GetCountDeti(strID:String; strPol:String; Vozr1,Vozr2:Integer; lOnlyLic:Boolean; lNotPasport:Boolean):Integer;
var
  nVozr : Integer;
  strLicID,oldInd:String;
  ds:TDataSet;
  lOk:Boolean;
begin
  Result:=0;
  tbMens.CancelRange;
  try
    strLicID:='';
    // если собрать детей только с лицевого счета
    if lOnlyLic then begin
      ds:=getMen(fmMain.DateFiks,strId);
      if ds<>nil then begin
        if strPol=''
          then strPol:=ds.FieldByName('POL').AsString;
        if ds.FieldByName('LIC_ID').AsInteger>0 then begin
          strLicID:=ds.FieldByName('LIC_ID').AsString;
        end;
      end;
    end;
    oldInd:=tbMens.IndexFieldNames;

    // tbMens.IndexFieldNames := 'DATE_FIKS;ID';

    if strPol='М'
      then tbMens.IndexFieldNames := 'DATE_FIKS;PA_ID'
      else tbMens.IndexFieldNames := 'DATE_FIKS;MA_ID';
    tbMens.SetRange([fmMain.DateFiks,strId],[fmMain.DateFiks,strId]);

    while not tbMens.Eof do begin
      if (strLicID='') or (tbMens.FieldByName('LIC_ID').AsString=strLicID) then begin
        if tbMens.FieldByName('DATER').IsNull then begin
          nVozr:=0;
        end else begin
          nVozr:=GetCountYear(GetCurDate,tbMens.FieldByName('DATER').AsDateTime);
        end;
        if (nVozr>=Vozr1) and (nVozr<=Vozr2) then begin
          lOk := true;
          if lNotPasport then begin
            if (tbMens.FieldByName('PASP_NOMER').AsString<>'') and not tbMens.FieldByName('PASP_DATE').IsNull then begin
              lOk:=false;
            end;
          end;
          if lOk then begin
            Result:=Result+1;
          end;
        end;
      end;
      tbMens.Next;
    end;
  finally
    tbMens.CancelRange;
    tbMens.IndexFieldNames:=oldInd;
  end;
end;

//----------------------------------------------------------------
function TdmBase.LicOsnov(nID:Integer): String;
var
  s:String;
  Opis:TOpisEdit;
begin
  Result:='';
  if tbLich.Locate('DATE_FIKS;ID', VarArrayOf([fmMain.DateFiks,nID]), []) then begin // найдем лицевой счет
    s:=ReadOneProp(fmMain.DateFiks, nID, 'DOGOVOR', ftMemo);
    if tbLich.FieldByName('OSNOV_ID').AsInteger=0 then begin
      Result:=s;
    end else begin
      Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_OSNOV_ZASEL');
      Result:=Opis.Naim(tbLich.FieldByName('OSNOV_ID').AsString, false);
      if not tbLich.FieldByName('OSNOV_DATE').IsNull
        then Result:=Result+' от '+DatePropis(tbLich.FieldByName('OSNOV_DATE').AsDateTime,3);
      if s<>''
        then Result:=Result+', '+s;
    end;
    if tbLich.FieldByName('OSNOV_NOMER').AsString<>'' then begin
      Result:=Result+' № '+tbLich.FieldByName('OSNOV_NOMER').AsString;
    end;
  end;
end;

//----------------------------------------------------------------
function TdmBase.CheckCloseLic(nIDLic:Integer; nIDMen:Integer; dDateLikv:TDateTime; var sSoob:String): Boolean;
var
  d:TDateTime;
  strLich:String;
  nIdFirst:Integer;
  lShow:Boolean;
begin
  Result:=false;
  d:=GetDateCurrentSost;
  if (nIDLic<=0) or (nIDMen<=0) or (fmMain.DateFiks<>d)
    then exit;
  if sSoob='*'
    then lShow:=true        
    else lShow:=false;
  sSoob:='';
  if CountMens(d, IntToStr(nIDLic))=0
    then Result:=true
    else Result:=false;
  //------------------------------------------------
  if tbLich.Locate('DATE_FIKS;ID', VarArrayOf([d,nIDLic]), []) then begin
    strLich :=tbLich.FieldByName('NOMER').AsString;
    nIdFirst:=tbLich.FieldByName('FIRST').AsInteger;
    if Result then begin
      tbLich.Edit;
      tbLich.FieldByName('CANDELETE').AsBoolean:=true;
      if dDateLikv<=0 then dDateLikv:=Date;
      tbLich.FieldByName('DATE_LIKV').AsDateTime:=dDateLikv;
      tbLich.Post;
      sSoob:=' C лицевого счета <'+strLich+'> убыл последний человек ! '#13'Лицевой счет ликвидирован.';
    end else begin
      //------- если убыл глава хозяйства, то изменять главу на следующего -------------
      if (nIdFirst=nIDMen) and GlobalTask.ParamAsBoolean('SMERT_CH_FIRST') then begin   // вкл. параметр на автомат. изменение
        sSoob:=' С лицевого счета <'+strLich+'> убыл глава хозяйства ! ';
        nIDFirst:=IDNewFirstMen( d, IntToStr(nIDLic));
        if nIDFirst>0 then begin
          tbLich.Edit;
          tbLich.FieldByName('FIRST').AsInteger:=nIDFirst;
          tbLich.Post;
          if tbMens.Locate('DATE_FIKS;ID', VarArrayOf([d,nIDFirst]), []) then begin
            tbMens.Edit;
            tbMens.FieldByName('FIRST').AsBoolean:=true;
            tbMens.Post;
          end;
          sSoob:=sSoob+chr(13)+'Глава хозяйства изменен.';
        end;
      end;
    end;
  end;
  if lShow and (sSoob<>'')
    then ShowMessage(sSoob);
end;
//-------------------------------------------------------------
// вернуть часть адреса сформированного функцией AdresPropisMen или AdresFromID
//-------------------------------------------------------------
function TdmBase.GetTailAdres(strType: String): String;
begin
  Result:='неизв.тип';
  strType:=UpperCase(strType);
  if (strType='OBL') or (Copy(strType,1,3)='ОБЛ') then begin
    Result:=Adres_Obl;
  end else if (strType='RAION') or (strType='РАЙОН') then begin
    Result:=Adres_Raion;
  end else if (strType='PUNKT') or (Copy(strType,1,4)='ПУНК')  then begin
    Result:=Adres_Punkt;
  end else if strType='PUNKTKOD' then begin
    Result:=IntToStr(Adres_PunktKod);
  end else if strType='PUNKTTK' then begin
    Result:=IntToStr(Adres_PUNKTTK);
  end else if strType='PUNKTTN' then begin
    Result:=Adres_PUNKTTN;
  end else if strType='PUNKTN' then begin
    Result:=Adres_PUNKTN;
  end else if (strType='ULICA') or (strType='UL') or (Copy(strType,1,4)='УЛИЦ') then begin
    Result:=Adres_Ul;
  end else if (strType='PUNKTUL') or (strType='PUNKTULICA') or (strType='ПУНКТ_УЛИЦА') then begin
    if Adres_UL='' then Adres_PunktUl:=Adres_Punkt
                   else Adres_PunktUl:=Adres_Punkt+', '+Adres_UL;
    Result:=Adres_PunktUl;
  end else if (strType='ULICADOM') or (strType='ULDOM') or (strType='УЛИЦА+ДОМ')  then begin
    Result:=Adres_UlDom;

//    Dom      // номер дома + корпус + квартира или наименивание строения
//    Dom2     // номер дома + корпус + квартира, если без номера дома, то не включаем имя строения
//    NDom     // толко номер дома

  end else if (strType='DOM') or (strType='ДОМ')  then begin
    Result:=Adres_Dom;
  end else if (strType='DOM2') or (strType='ДОМ2')  then begin
    Result:=Adres_Dom2;
  end else if strType='NOT_DOM' then begin
    if Adres_NotDom then Result:='1' else Result:='0';
  end else if (strType='NDOM') or (Copy(strType,1,4)='№ДОМ') then begin
    Result:=Adres_NDOM;
  end else if (strType='KORP') or (Copy(strType,1,3)='КОР') then begin
    Result:=Adres_Korp;
  end else if (strType='KV') or (Copy(strType,1,2)='КВ') then begin
    Result:=Adres_Kv;
  end else if (strType='ETAG') or (strType='ЭТАЖ') then begin
    Result:=Adres_Etag;
  end else if (strType='RNGOR') then begin
    Result:=IntToStr(Adres_RnGor);
  end else if (strType='RNGORNAME') or (strType='РАЙОН') then begin
    Result:=Adres_RnGorName;
  end else if (strType='KOL_ETAG') or (strType='КОЛ_ЭТАЖ') then begin
    Result:=Adres_Kol_Etag;
  end else if (strType='PREDST') or (Copy(strType,1,4)='ПРЕД') then begin
    Result:=Adres_Predst;
  end else if (strType='CONTROL') or (Copy(strType,1,5)='КОНТР') then begin
    Result:=Adres_Control;
  end else if (strType='USE_GILFOND') or (Copy(strType,1,5)='ЭКСПЛ') then begin
    Result:=Adres_UseGilfond;
  end else if (strType='PRIVATE') or (Copy(strType,1,5)='ЧАСТН') then begin
    if Adres_Private
      then Result:='1'
      else Result:='0';
  end else if (strType='SPEC') or (Copy(strType,1,4)='СПЕЦ') then begin
    if Adres_SpecUch
      then Result:='1'
      else Result:='0';
  end;
//    Adres_Gorod    := '';
//    Adres_Selo     := '';
//    Adres_IsGorod := false;
//    Adres_Etag := '';
//    Adres_Kol_Etag := '';
//    Adres_Predst := '';
end;
{
//-----------------------------------------------------------------------------------------------
function TdmBase.AdresPropisMen(DateFiks: TDateTime; strID: String): String;
var
  strName : String;
  adr:TAdres;
begin
  adr:=AdresMen(DateFiks, strID, strName, true, true);
  Result:=strName;
end;
}
function TdmBase.AdresFromMensAdd(strID:String; var adr :TAdres; ds:TDataSet):Boolean;
var
  lSeek:Boolean;
begin
  Result:=false;
  if ds=nil then begin
    lSeek:=false;
    ds:=dmBase.tbMensAdd;
    if dmBase.tbMensAdd.Locate('ID', strID, []) then begin
      lSeek:=true;
    end;
  end else begin
    lSeek:=true;
  end;
  if lSeek then begin
    with ds do begin
      adr.Obl:='';
      adr.Raion:='';
      adr.AdresPropis:=FieldByName('TEXT_ADRES').AsString;
      if adr.AdresPropis='' then begin
//        WriteField( FieldByName('MR_B_RESP') ,mtDokumentMR_B_RESP  , lErr);
//        WriteField( FieldByName('MR_GOSUD')  ,mtDokumentMR_GOSUD   , lErr);
        adr.Obl:=FieldByName('MR_OBL').AsString;
        adr.Raion:=FieldByName('MR_RAION').AsString;
        adr.PunktTK:=FieldByName('MR_B_GOROD').AsInteger;
        if TypePunkt.Locate('ID',adr.PunktTK,[])
          then adr.PunktTN:=Trim(TypePunkt.FieldByName('NAME').AsString)
          else adr.PunktTN:='';
        if adr.PunktTN='-' then adr.PunktTN:='';
        adr.PunktN:=FieldByName('MR_GOROD').AsString;
        adr.Punkt:=CheckSpace(Trim(adr.PunktTN+' '+adr.PunktN));
        adr.RnGorName:=FieldByName('MR_GOROD_RN').AsString;
        adr.Ulica:=CheckSpace(FieldByName('MR_ULICA').AsString);
        adr.NDom:=FieldByName('MR_DOM').AsString;
        adr.Korp:=FieldByName('MR_KORP').AsString;
        adr.Kv:=FieldByName('MR_KV').AsString;
        adr.Dom:=getDom(adr.NDom, adr.Korp, adr.Kv, '', false);
        adr.Dom2:=adr.Dom;
        adr.AdresPropis:=AdresPropisFromAdres(adr, true);
      end;
      Result:=true;
    end;
  end;
end;

//---------------------------------------------------------------------------
function TdmBase.AdresPropisFromAdres(adr:TAdres; lAll:Boolean):String;
var
  s:String;
begin
  Result:='';
  if (adr.AdresPropis<>'не известен') or lAll then begin
    s:='';
    if adr.Obl<>''   then s:=s+adr.Obl+' область, ';
    if adr.Raion<>'' then s:=s+adr.Raion+' район, ';
    if adr.Punkt<>'' then s:=s+adr.Punkt+', ';
    if adr.Ulica<>'' then s:=s+adr.Ulica+', ';
    if adr.NDom<>''  then s:=s+sokrDom+adr.NDom+', ';
    if adr.Korp<>''  then s:=s+sokrKorp+adr.Korp+', ';
    if adr.Kv<>''    then s:=s+sokrKv+adr.Kv+', ';
    s:=Trim(Copy(s,1,Length(s)-2));
    if s='' then s:='не известен';
//    adr.AdresPropis:=s;
    Result:=s;
  end;
end;

//-----------------------------------------------------------------------------------------------
function TdmBase.SimpleAdresMen(strID: String; sType:String): String;
var
  adr:TAdres;
  s:String;
  lSet,lShow:Boolean;
  sl:TStringList;
begin
  lSet:=Pos('+SET',sType)>0;
  lShow:=Pos('+SHOW',sType)>0;
  adr:=AdresMen( STOD(CURRENT_SOST,tdAds), strID, s, lSet, true);
  Result:=adr.AdresPropis;
  if lShow then begin
    sl:=TStringList.Create;
    sl.Add('AdresPropis='+adr.AdresPropis);
    sl.Add('obl='+adr.Obl);
    sl.Add('raion='+adr.Raion);
    sl.Add('punktTN='+adr.PunktTN);
    sl.Add('punktN='+adr.PunktN);
    sl.Add('punkt='+adr.Punkt);
    sl.Add('ulica='+adr.Ulica);
    sl.Add('dom='+adr.Dom);
    sl.Add('NDom='+adr.NDom);
    sl.Add('namehouse='+adr.NameHouse);
    sl.Add('rnGorName='+adr.rnGorName);
    ShowStrings(sl,'Адрес');
    sl.Free;
  end;
end;
// uObjectScript.pas    !!! TAdresLic GetAdres !!!
//-----------------------------------------------------------------------------------------------
function TdmBase.AdresMen(DateFiks: TDateTime; strID: String; var strName : String; lSet:Boolean; lCheckAdresPropis:Boolean): TAdres;
var
  sLicID,sAdresID : String;
  ID,nAdresID : Integer;
  lOk,lLic:Boolean;
  save_adr:TAdres;
begin
  save_adr:=GlobalAdresToRec; // !!!  сохраним значения глобальных переменных
  strName := '';
  Result.Obl := Globaltask.ParamAsString('OBL');
  Result.Raion := Globaltask.ParamAsString('RAION');
  Result.AdresPropis:='';
  Result.Punkt:='';
  Result.PunktKod:=0;
  Result.PunktTK:=0;
  Result.PunktTN:='';
  Result.PunktN:='';
  Result.Ulica:='';
  Result.Dom:='';
  Result.NotDom:=false;
  Result.NDom:='';
  Result.NameHouse:='';
  Result.AdresID:=0;
  Result.LicID:=0;
  Result.Propis:=false;
  Result.RnGor:=0;
  Result.RnGorName:='';
  Result.SpecUch:=false;
  Result.OnlyText:=false;
  {$IFDEF GKH}
    Result.PrivateSect:=false;
  {$ELSE}
    Result.PrivateSect:=true;
  {$ENDIF}
  if strID='' then begin
    exit;
  end;
  lOk:=true;
  if tbMens.FieldByName('ID').AsString<>strID then begin
    // найдем человека в таблице "Население"
    if tbMens.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,StrToInt(strID)]), []) then begin
      lOk:=true;
    end else begin
      lOk:=false;
    end;
  end;
  if lOk then begin
    sLicID := tbMens.FieldByName('LIC_ID').AsString;
    sAdresID := tbMens.FieldByName('ADRES_ID').AsString;
    strName := tbMens.FieldByName('FAMILIA').AsString+' '+
               tbMens.FieldByName('NAME').AsString+' '+
               tbMens.FieldByName('OTCH').AsString;
    {$IFDEF OCHERED}
      if tbMens.FieldByName('ID_BASE').AsInteger>0 then begin
         // для объединенной очереди
        AdresFromMensAdd(strID,Result,nil);
      end else begin
        nAdresID:=0;
        if (sAdresID<>'') and (sAdresID<>'0') then begin
          nAdresID:=StrToInt(sAdresID);
        end;
        if nAdresID>0 then begin
          AdresFromID(DateFiks, IntToStr(nAdresID), true);
          Result:=GlobalAdresToRec;
          Result.Propis:=true;
        end else begin
          ID:=StrToInt(strID);
          Result.AdresPropis := Trim(dmBase.ReadOneProp(DateFiks, ID, 'ADRES_PROP', ftMemo));
          Result.Propis:=false;
          if (Result.AdresPropis='') or (Pos('не известен',ANSILowerCase(Result.AdresPropis) )>0) then begin
            if dmBase.tbMensAdd.Locate('ID', ID, []) then begin
              Result.AdresPropis:=dmBase.tbMensAdd.FieldByName('TEXT_ADRES').AsString;
            end else begin
              Result.AdresPropis:='не известен';
            end;
            Result.OnlyText:=true;
          end else begin
            Result.Obl:=dmBase.ReadOneProp(DateFiks, ID, 'APROP_OBL', ftMemo);
            Result.Raion:=dmBase.ReadOneProp(DateFiks, ID, 'APROP_RN', ftMemo);
            Result.Punkt := dmBase.ReadOneProp(DateFiks, ID, 'APROP_PN', ftMemo);
            Result.PunktN := Result.Punkt;
            n:=Pos('.',Result.PunktN);
            if n>0 then begin
              Result.PunktN:=Copy(Result.PunktN,n+1,Length(Result.PunktN));
            end;
            Result.Ulica := dmBase.ReadOneProp(DateFiks, ID, 'APROP_UL', ftMemo);
            if Result.Ulica=''
              then Result.PunktUlica:=Result.Punkt
              else Result.PunktUlica:=Result.Punkt+', '+Result.Ulica;
            Result.NDom  := dmBase.ReadPropAsString(DateFiks, ID, 'APROP_DOM');
            Result.Korp  := dmBase.ReadPropAsString(DateFiks, ID, 'APROP_KORP');
            Result.Kv    := dmBase.ReadPropAsString(DateFiks, ID, 'APROP_KV');
            Result.Dom := getDom(Result.NDom,Result.Korp,Result.Kv,'',false);
            Result.Dom2:= Result.Dom;
          end;
        end;
      end;
    {$ELSE}
    Result.Propis:=true;
    nAdresID:=0;
    lLic:=false;
    if (sAdresID<>'') and (sAdresID<>'0') then begin
      nAdresID:=StrToInt(sAdresID);
      if (sLicID<>'') and (sLicID<>'0') then begin
        lLic:=true;
      end;
    end else if (sLicID<>'') and (sLicID<>'0') then begin
      if tbLich.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,sLicID]), []) then begin
        sAdresID:=tbLich.FieldByName('ADRES_ID').AsString;
        if (sAdresID<>'') and (sAdresID<>'0') then begin
          nAdresID:=StrToInt(sAdresID);
          lLic:=true;
        end;
      end;
    end;
    //-------- если человек не прописан и не на лицевом счете ----------------------
    if (not lLic or lCheckAdresPropis) and (tbMens.FieldByName('PROPIS').AsBoolean=false) then begin // не прописан на територии с/с
//было    if not lLic and (tbMens.FieldByName('PROPIS').AsBoolean=false) then begin // не прописан на територии с/с
      ID:=StrToInt(strID);
      Result.AdresPropis := Trim(dmBase.ReadOneProp(DateFiks, ID, 'ADRES_PROP', ftMemo));
      Result.Propis:=false;
      if (Result.AdresPropis='') or (Pos('не известен',ANSILowerCase(Result.AdresPropis) )>0) then begin
        Result.AdresPropis:='не известен';
        Result.OnlyText:=true;
      end else begin
        Result.Obl:=dmBase.ReadOneProp(DateFiks, ID, 'APROP_OBL', ftMemo);
        Result.Raion:=dmBase.ReadOneProp(DateFiks, ID, 'APROP_RN', ftMemo);
        Result.Punkt := dmBase.ReadOneProp(DateFiks, ID, 'APROP_PN', ftMemo);
        Result.PunktN := Result.Punkt;
        Result.Ulica := dmBase.ReadOneProp(DateFiks, ID, 'APROP_UL', ftMemo);
        if Result.Ulica=''
          then Result.PunktUlica:=Result.Punkt
          else Result.PunktUlica:=Result.Punkt+', '+Result.Ulica;
        Result.NDom  := dmBase.ReadPropAsString(DateFiks, ID, 'APROP_DOM');
        Result.Korp  := dmBase.ReadPropAsString(DateFiks, ID, 'APROP_KORP');
        Result.Kv    := dmBase.ReadPropAsString(DateFiks, ID, 'APROP_KV');
        Result.Dom := getDom(Result.NDom,Result.Korp,Result.Kv,'',false);
        Result.Dom2:= Result.Dom;
        if (Result.Dom='') and (Result.Punkt='') and (Result.Obl='') and (Result.Raion='')
          then Result.OnlyText:=true;
      end;
    end else if nAdresID>0 then begin
//     SaveGlobalAdres;
      AdresFromID(DateFiks, IntToStr(nAdresID), true);
      Result:=GlobalAdresToRec;
      Result.Propis:=true;
//      RestGlobalAdres;
    end else begin
      Result.AdresPropis:='не известен';
      Result.OnlyText:=true;
    end;
    //------ !!! -----------------------------------
    if Result.OnlyText and (nAdresID>0) then begin
      AdresFromID(DateFiks, IntToStr(nAdresID), true);
      Result:=GlobalAdresToRec;
    end;
    if lLic
      then Result.LicID:=StrToInt(sLicID);
    //-----------------------------------------------
    {$ENDIF}

  end;
  if lSet then begin
    RecAdresToGlobal(Result);
  end else begin
    RecAdresToGlobal(save_adr);
  end;
end;
//-------------------------------------------------------------------------
procedure TdmBase.SaveGlobalAdres;
begin
  SavedAdres:=GlobalAdresToRec;
end;
//-------------------------------------------------------------------------
procedure TdmBase.RestGlobalAdres;
begin
  RecAdresToGlobal(SavedAdres);
end;
//-------------------------------------------------------------------------
function TdmBase.GlobalAdresToRec:TAdres;
begin
  Result.Strana     :=Adres_Strana    ;
  Result.Obl        :=Adres_Obl       ;
  Result.Raion      :=Adres_Raion     ;
  Result.PunktKod   :=Adres_PunktKod  ;  // код нас. пункта
  Result.PunktTN    :=Adres_PunktTN   ;   // наименование типа нас пункта
  Result.PunktTK    :=Adres_PunktTK   ;    // код типа нас пункта
  Result.PunktN     :=Adres_PunktN    ;    // наименование без типа нас пункта
  Result.Punkt      :=Adres_Punkt     ;     // наименование с типом нас. пункта
  Result.IsGorod    :=Adres_IsGorod   ;
  Result.Gorod      :=Adres_Gorod     ;
  Result.Selo       :=Adres_Selo      ;
  Result.Ulica      :=Adres_UL        ;
  Result.UlicaInt   :=Adres_UlKod     ;
  Result.UlicaType  :=Adres_TypeUlKod ;   // код типа улицы
  Result.PunktUlica :=Adres_PunktUl   ;
  Result.NotDom     :=Adres_NotDom    ;
  Result.NDom       :=Adres_NDom      ;
  Result.Dom        :=Adres_Dom       ;
  Result.Dom2       :=Adres_Dom2      ;
  Result.UlicaDom   :=Adres_UlDom     ;
  Result.Korp       :=Adres_Korp      ;
  Result.NKv        :=Adres_NKv       ;
  Result.Kv         :=Adres_Kv        ;
  Result.Etag       :=Adres_Etag      ;
  Result.Kol_Etag   :=Adres_Kol_Etag  ;
  Result.Predst     :=Adres_Predst    ;
  Result.Control    :=Adres_Control   ;
  Result.UseGilfond :=Adres_UseGilfond;
  Result.AdresID    :=Adres_ID        ;
  Result.LicID      :=Adres_LicID     ;
  Result.NameHouse  :=Adres_NameHouse ;
  Result.RnGor      :=Adres_RnGor     ;
  Result.RnGorName  :=Adres_RnGorName ;
  Result.PrivateSect:=Adres_Private   ;
  Result.SpecUch    :=Adres_SpecUch   ;
  Result.Propis     :=Adres_Propis    ;
  Result.AdresPropis:=Adres_Result    ;
  Result.OnlyText   :=Adres_OnlyText  ;
end;
//-------------------------------------------------------------------------
procedure TdmBase.RecAdresToGlobal(adr:TAdres);
begin
  Adres_Strana    :=adr.Strana;
  Adres_Obl       :=adr.Obl;
  Adres_Raion     :=adr.Raion;
  Adres_PunktKod  :=adr.PunktKod;  // код нас. пункта
  Adres_PunktTN   :=adr.PunktTN;   // наименование типа нас пункта
  Adres_PunktTK   :=adr.PunktTK;   // код типа нас пункта
  Adres_PunktN    :=adr.PunktN;    // наименование без типа нас пункта
  Adres_Punkt     :=adr.Punkt;     // наименование с типом нас. пункта
  Adres_IsGorod   :=adr.IsGorod;
  Adres_Gorod     :=adr.Gorod;
  Adres_Selo      :=adr.Selo;
  Adres_UL        :=adr.Ulica;
  Adres_UlKod     :=adr.UlicaInt;
  Adres_TypeUlKod :=adr.UlicaType;   // код типа улицы
  Adres_PunktUl   :=adr.PunktUlica;
  Adres_NotDom    :=adr.NotDom;
  Adres_NDom      :=adr.NDom;
  Adres_Dom       :=adr.Dom;
  Adres_Dom2      :=adr.Dom2;
  Adres_UlDom     :=adr.UlicaDom;
  Adres_Korp      :=adr.Korp;
  Adres_NKv       :=adr.NKv;
  Adres_Kv        :=adr.Kv;
  Adres_Etag      :=adr.Etag;
  Adres_Kol_Etag  :=adr.Kol_Etag;
  Adres_Predst    :=adr.Predst;
  Adres_Control   :=adr.Control;
  Adres_UseGilfond:=adr.UseGilfond;
  Adres_ID        :=adr.AdresID;
  Adres_LicID     :=adr.LicID;
  Adres_NameHouse :=adr.NameHouse;
  Adres_RnGor     :=adr.RnGor;
  Adres_RnGorName :=adr.RnGorName;
  Adres_Private   :=adr.PrivateSect;
  Adres_SpecUch   :=adr.SpecUch;
  Adres_Propis    :=adr.Propis;
  Adres_Result    :=adr.AdresPropis;
  Adres_OnlyText  :=adr.OnlyText;
end;

//-------------------------------------------------------------------------
procedure TdmBase.ClearGlobalAdres;
begin
  Adres_Strana:='';
  Adres_Obl:='';
  Adres_Raion:='';
  Adres_PunktKod:=0;  // код нас. пункта
  Adres_PunktTN:='';   // наименование типа нас пункта
  Adres_PunktTK:=0;  // код типа нас пункта
  Adres_PunktN:='';    // наименование без типа нас пункта
  Adres_Punkt:='';;    // наименование с типом нас. пункта
  Adres_IsGorod:=true;
  Adres_Gorod:='';
  Adres_Selo:='';
  Adres_UL:='';
  Adres_UlKod:=0;
  Adres_TypeUlKod:=0;   // код типа улицы
  Adres_PunktUl:='';
  Adres_NotDom:=false;
  Adres_NDom:='';
  Adres_Dom   :='';
  Adres_Dom2  :='';
  Adres_UlDom :='';
  Adres_Korp  :='';
  Adres_NKv   :='';
  Adres_Kv    :='';
  Adres_Etag  :='';
  Adres_Kol_Etag :='';
  Adres_Predst :='';
  Adres_Control:='';
  Adres_UseGilfond:='';
  Adres_ID     :=0;
  Adres_LicID  :=0;
  Adres_NameHouse:='';
  Adres_RnGor:=0;
  Adres_RnGorName:='';
  {$IFDEF GKH}
    Adres_Private:=false;
  {$ELSE}
    Adres_Private:=true;
  {$ENDIF}
  Adres_SpecUch:=false;
  Adres_Propis:=false;
  Adres_OnlyText:=false;
  Adres_Result:='';
end;
//-------------------------------
function TdmBase.AdresFromIDEx(DateFiks : TDateTime; strID : String; lNameIsNotDom:Boolean; lOnlyText:Boolean) : String;
var
  adr:TAdres;
begin
  if lOnlyText  then adr:=GlobalAdresToRec;
  try
    Result:=AdresFromID(DateFiks, strID, lNameIsNotDom);
  finally
    if lOnlyText  then RecAdresToGlobal(adr);
  end;
end;
//-------------------------------
//  lNameIsNotDom   включать наименование строения если без номера дома
function TdmBase.AdresFromID(DateFiks : TDateTime; strID : String; lNameIsNotDom:Boolean): String;
var
//  vKeyValues : Variant;
  s : String;
  Opis:TOpisEdit;
  nID:Integer;
begin
  if strID='' then begin
    Result := '';
    exit;
  end;
  try
    nID:=StrToInt(strID);
  except
    Result:='ошибка адреса:"'+strID+'"';
    exit;
  end;
//  vKeyValues := VarArrayCreate( [0, 1], varOleStr );
//  vKeyValues[0] := DateFiks;
//  vKeyValues[1] := nID;
  ClearGlobalAdres;
  Adres_ID   := nID;
  Adres_Obl  := Globaltask.ParamAsString('OBL');
  Adres_Raion:= Globaltask.ParamAsString('RAION');

  if tbAdres.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,nID]), []) then begin
    Adres_Etag:=tbAdres.FieldByName('ETAG').AsString;
    Adres_Kol_Etag:=tbAdres.FieldByName('KOL_ETAG').AsString;
    Adres_Predst := '';
    if tbAdres.FieldByName('PREDST').AsString<>'' then begin
      if SprPredst.Locate('ID',tbAdres.FieldByName('PREDST').AsString,[]) then begin
        Adres_Predst := SprPredst.FieldByName('NAME').AsString;
      end;
    end;
    Adres_Control := '';
    if tbAdres.FieldByName('CONTROL').AsString<>'' then begin
      Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_CONTROL_HOUSE');
      Adres_Control := Opis.Naim(tbAdres.FieldByName('CONTROL').AsString, false);
    end;
    Adres_UseGilfond := '';
    if tbAdres.FieldByName('USE_GILFOND').AsString<>'' then begin
      Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_USE_GILFOND');
      Adres_UseGilfond := Opis.Naim(tbAdres.FieldByName('USE_GILFOND').AsString, false);
    end;
    Result := '';
    s := tbAdres.FieldByName('PUNKT').AsString;

    if not tbAdres.FieldByName('PRIVATE_SECT').IsNull then begin
      Adres_Private:=tbAdres.FieldByName('PRIVATE_SECT').AsBoolean;
    end;

    if not tbAdres.FieldByName('SPEC_UCH').IsNull
      then Adres_SpecUch:=tbAdres.FieldByName('SPEC_UCH').AsBoolean;

    if tbAdres.FieldByName('NOT_DOM').IsNull
      then Adres_NotDom := false
      else Adres_NotDom := tbAdres.FieldByName('NOT_DOM').AsBoolean;

    if s <> '' then begin
      Adres_PunktKod:=StrToInt(s);
      if SprPunkt.Locate('ID', s, []) then begin
        Adres_PunktTK:= GetTypePunkt(SprPunkt.FieldByName('TYPEPUNKT').AsString,'R',Adres_PunktTN);
        Adres_PunktN := SprPunkt.FieldByName('NAME').AsString;
        Adres_Punkt  := Adres_PunktN;
        if Adres_PunktTN<>''
          then Adres_Punkt:=CheckSpace(Adres_PunktTN+' '+Adres_Punkt);
        // город
        if not SprPunkt.FieldByName('GOROD').IsNull and
           SprPunkt.FieldByName('GOROD').AsBoolean then begin
          Adres_Gorod := Adres_Punkt;
          Adres_IsGorod := true;
        // деревня
        end else begin
          Adres_Selo  := Adres_Punkt;
        end;
        Result := Result + Adres_Punkt;
      end;
    end;
    s := getUL( tbAdres );
    if s <> '' then begin
      Adres_UL := s;
      if Result = '' then begin
        Result := s;
      end else begin
        Result := Result + ', ' + s;
      end;
    end;
    s := getDom( tbAdres,lNameIsNotDom );  // заполняется Adres_Dom2
    if s <> '' then begin
      if Result = '' then begin
        Result := s;
      end else begin
        Result := Result + ', ' + s;
     end;
    end;
    if Adres_Ul = '' then begin
      Adres_UlDom := Adres_NDom;
    end else begin
      Adres_UlDom := Adres_Ul+', '+Adres_NDom;
    end;
    if Adres_UL='' then Adres_PunktUl:=Adres_Punkt
                   else Adres_PunktUl:=Adres_Punkt+', '+Adres_UL;

    // заполним район города (например для Бреста)
    if not tbAdres.FieldByName('RAION').IsNull then begin
      s := tbAdres.FieldByName('RAION').AsString;
      if (s<>'') and (s<>'0') then begin
         Adres_RnGor:=StrToInt(s);
         Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_RNGOR');
         if Opis<>nil then begin
           Adres_RnGorName := Opis.Naim(s);
         end;
      end;
    end;
    Adres_Result:=Result;
    Adres_OnlyText:=false;
  end else begin
    Result := '';
  end;
end;
//-------------------------------
//  lNameIsNotDom   включать наименование строения если без номера дома
function TdmBase.AdresAsRecord(DateFiks : TDateTime; strID : String; lNameIsNotDom:Boolean; lOnlyAdres:Boolean): TAdres;
var
//  vKeyValues : Variant;
  s,sResult,sDom : String;
  nID:Integer;
  adr:TAdres;
  Opis:TOpisEdit;
  procedure AddVal(var ss:String; sAdd:String; sokr:String);
  begin
    if sokr<>'' then sokr:=chr(160)+sokr;
    if sAdd<>'' then if ss='' then ss:=sokr+sAdd else ss:=ss+', '+sokr+sAdd;
  end;
begin
  Result.AdresID:=StrToIntDef(strID,0);
  if (strID='') or (Result.AdresID=0)
    then exit;
  Result.Obl:=Globaltask.ParamAsString('OBL');
  Result.Raion:=Globaltask.ParamAsString('RAION');
  WorkQuery.SQL.Text:='select b.not_dom, b.id, b.punkt, trim(isnull(tp.name,'''')) tp_name, trim(p.name) punkt_name, iif(p.name is null, '''', trim(isnull(tp.name,''''))+char(160)+trim(p.name)) punkt_fullname, '+
  '       u.id ul, trim(u.name) ul_name, iif(u.name is null,'''',trim(isnull(tu.name,''''))+char(160)+trim(u.name)) ul_fullname, '+
  '       trim(isnull(b.dom,'''')) dom, trim(isnull(b.korp,'''')) korp, trim(isnull(b.kv,'''')) kv, '+
  ' isnull(p.gorod,false) isgorod, etag, kol_etag, raion '+
  ' from БазаДомов b '+
  ' left join СпрНасПунктов p on p.id=b.punkt '+
  ' left join SysSpr.TypePunkt tp on tp.id=p.typepunkt'+
  ' left join СпрУлиц u on u.id=b.ul '+
  ' left join СпрТипУлиц tu on tu.id=u.tip '+
  ' where b.id='+strID+' and date_fiks='+DateToSQL(DateFiks);
//  WriteToDebug([WorkQuery.SQL.Text]);
  try
    WorkQuery.Open;
    with WorkQuery do begin
      Result.PunktKod:=FieldByName('PUNKT').AsInteger;
      Result.PunktN:=FieldByName('PUNKT_NAME').AsString;
      Result.Punkt:=FieldByName('PUNKT_FULLNAME').AsString;
      sResult:=sResult+Result.Punkt;
      Result.IsGorod:=FieldByName('ISGOROD').AsBoolean;
      if Result.IsGorod
        then Result.Gorod:=Result.Punkt
        else Result.Selo:=Result.Punkt;
      sResult:=Result.Punkt;
      Result.UlicaInt:=FieldByName('UL').AsInteger;
      if Result.UlicaInt>0 then begin
        Result.Ulica:=FieldByName('UL_FULLNAME').AsString;
        if Copy(Result.Ulica,1,1)='-'
          then Result.Ulica:=Copy(Result.Ulica,3,Length(Result.Ulica));
        sResult:=sResult+', '+Result.Ulica;   // result  +улица
      end;
  //    Result.UlicaDom:=;
  //    Result.UlicaType:=;
      if FieldByName('NOT_DOM').IsNull
        then Result.NotDom := false
        else Result.NotDom := FieldByName('NOT_DOM').AsBoolean;
      if Result.NotDom and lNameIsNotDom then begin
        adr:=AdresForSeek(WorkQuery);
        Result.NameHouse:=NameBigHouse(adr,DateFiks);
  //      Result.Dom2:=getDOM(Adres_NDom, Adres_Korp, Adres_Kv, '', Adres_NotDom);
      end;
  //    Result.Dom2:=
      sDom:='';
      Result.Kv:=FieldByName('KV').AsString;
      if Result.NameHouse<>'' then begin
        sDom:=Result.NameHouse;
        Result.Dom:=sDom;
        Result.NDom:='';
      end else begin
        Result.Dom:=FieldByName('DOM').AsString;
        Result.NDom:=Result.Dom;
        Result.Korp:=FieldByName('KORP').AsString;
        AddVal(sDom, Result.Dom, sokrDOM);
        AddVal(sDom, Result.Korp, sokrKorp);
      end;
      AddVal(sDom, Result.Kv, sokrKv);
      sResult:=sResult+', '+sDom;      // result  +дом корпус квартира
      //-----------------------------------------
      Result.AdresPropis:=sResult;  // !!!  сформированыый адрес в виде строки !!!
      //-----------------------------------------
      if Result.Ulica=''
        then Result.UlicaDom:=sDom
        else Result.UlicaDom:=Result.Ulica+', '+sDom;
      if not lOnlyAdres then begin
        Result.Etag:=FieldByName('ETAG').AsString;
        Result.Kol_Etag:=FieldByName('KOL_ETAG').AsString;
        if (FieldByName('PREDST').AsString<>'') and SprPredst.Locate('ID',FieldByName('PREDST').AsString,[])
          then Result.Predst := SprPredst.FieldByName('NAME').AsString;
        if FieldByName('CONTROL').AsString<>'' then begin
          Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_CONTROL_HOUSE');
            Result.Control:=Opis.Naim(tbAdres.FieldByName('CONTROL').AsString, false);
          end;
        if FieldByName('USE_GILFOND').AsString<>'' then begin
          Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_USE_GILFOND');
          Result.UseGilfond:=Opis.Naim(FieldByName('USE_GILFOND').AsString, false);
        end;
        if not FieldByName('PRIVATE_SECT').IsNull then Result.PrivateSect:=FieldByName('PRIVATE_SECT').AsBoolean;
        if not FieldByName('SPEC_UCH').IsNull then Result.SpecUch:=FieldByName('SPEC_UCH').AsBoolean;
      end;
      {$IFDEF GKH}
      if not FieldByName('RAION').IsNull then begin
        Result.RnGor:=FieldByName('RAION').AsInteger;
        if Result.RnGor>0 then begin
          Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_RNGOR');
          if Opis<>nil
            then Result.RnGorName := Opis.Naim(InttoStr(Result.RnGor));
        end;
      end;
      {$ENDIF}
    end;
  finally
    WorkQuery.Close;
  end;
end;
//------------------------------------------------------------------
function TdmBase.getUL( nKod: Integer; sLang:String): String;
var
  strTip, sFld, sType : String;
begin
  Result := '';
  Adres_UlKod:=nKod;
  Adres_TypeUlKod:=0;
  {$IFDEF ADD_MENS_PU}
    if (sLang='') or (sLang='R') or (sLang='Р')
      then sFld:='NAME'
      else sFld:='NAME_B';  // !!!   на белорусском пока только для похоз. учета
  {$ELSE}
     sFld:='NAME';
  {$ENDIF}
  if nKod > 0 then begin
    if SprUL.Locate('ID', nKod, []) then begin
      Result := SprUL.FieldByName(sFld).AsString;
      if Result=''
        then exit;
      strTip := SprUL.FieldByName('TIP').AsString;
      Adres_TypeUlKod:=0;
      if strTip<>'' then begin
        Adres_TypeUlKod:=StrToInt(strTIP);
        if SprTypeUL.Locate('ID', strTip, []) then begin
          sType:=SprTypeUL.FieldByName(sFld).AsString;
          if (sType='') and (sFld='NAME_B')
            then sType:=SprTypeUL.FieldByName('NAME').AsString;
          if sType<>'-'
            then Result := sType+chr(160)+Result;
        end;
      end;
    end;
  end;
end;

//-----------------------------------------------------------------
function TdmBase.getUL( ds : TDataSet) : String;
var
  s : String;
begin
  Result := '';
  s := ds.FieldByName('UL').AsString;
  if s <> '' then begin
    Result := getUL(StrToInt(s));
  end;
end;

//-----------------------------------------------------------------
function TdmBase.getDom( strDom, strKorp, strKv, strNameHouse : String; lNotDom:Boolean) : String;
begin
  if lNotDom or (strNameHouse<>'') then begin
    Result:=strNameHouse;
    Adres_Dom:=Result;
    if lNotDom then begin
      Adres_NDom:='';
      Adres_Korp:='';
    end;
  end else begin
    Result := '';
    if strDom <> '' then begin
      Result := sokrDom+Trim(strDom);
      Adres_Dom := Trim(strDom);
      Adres_NDom:= Trim(strDom);
    end;
    if strKorp <> '' then begin
      Adres_Korp := Trim(strKorp);
      if Result = '' then begin
        Result := sokrKorp+Trim(strKorp);
      end else begin
        Result := Result + ', '+sokrKorp + Trim(strKorp);
      end;
    end;
  end;
  if strKv <> '' then begin
    Adres_Kv := Trim(strKv);
    if Result = '' then begin
      Result := sokrKv+Trim(strKv);
    end else begin
      Result := Result + ', '+sokrKv + Trim(strKv);
    end;
  end;
end;

//---------------------------------------------------------------
// возвращает полное наименование дома в строку  дом+корп+кв или
//-----------------------------------------------------------------
function TdmBase.getDom( ds : TDataSet; lNameIsNotDom:Boolean) : String;
var
  adr : TAdres;
  fldKv,fld:TField;
begin
  if ds.Eof then begin
    Adres_Dom:='';
    Adres_Dom2:='';
    Adres_NDom:='';
    Adres_Kv:='';
    Adres_Korp:='';
    Adres_NotDom:=false;
    Adres_NameHouse:='';
  end else begin
    Adres_Dom := Trim(ds.FieldByName('DOM').AsString);
    Adres_NDom:= Adres_Dom;
    Adres_Korp:= Trim(ds.FieldByName('KORP').AsString);
    fldKv:=ds.FindField('KV');
    if fldKv=nil
      then Adres_Kv:=''
      else Adres_Kv:=Trim(fldKv.AsString);
    fld:=ds.FindField('NOT_DOM');
    if fld=nil
      then Adres_NotDom:=false
      else Adres_NotDom:=ds.FieldByName('NOT_DOM').AsBoolean;
    adr := AdresForSeek(ds);
    Adres_NameHouse:=NameBigHouse(adr,fmMain.DateFiks);

    Adres_Dom2:=getDOM(Adres_NDom, Adres_Korp, Adres_Kv, '', Adres_NotDom);

    if Adres_NotDom then begin
      if lNameIsNotDom
        then Result := getDOM(Adres_NDom, Adres_Korp, Adres_Kv, Adres_NameHouse, Adres_NotDom)
        else Result := Adres_Dom2;
    end else begin
      Result := getDOM(Adres_NDom, Adres_Korp, Adres_Kv, Adres_NameHouse, Adres_NotDom);
    end;
    Adres_Dom:=Result;
  end;
end;

//-------------------------------------------------------------------------------
function TdmBase.getGrag(strSeek:String): String;
begin
  Result := '';
  if strSeek<>'' then begin
    if SprStran.Locate('ID', strSeek, []) then begin
      Result := SprStran.FieldByName('GNAME').AsString;
    end;
  end;
end;

//-------------------------------------------------------------------------------
function TdmBase.getNation(strSeek:String;strField:String): String;
begin
  Result := '';
  if strSeek<>'' then begin
    if SprNac.Locate('ID', strSeek, []) then begin
      Result := SprNac.FieldByName(strField).AsString;
    end;
  end;
end;

//-------------------------------------------------------------------------------
function TdmBase.GetDateCurrentSost: TDateTime;
begin
  Result := STOD('1899-12-30', tdAds);
end;

function TdmBase.ReadPropAsFloat(DateFiks : TDateTime; nKodObj : Integer;
                             strKodProp : String) : Extended;
var
  v : Variant;
begin
  v := ReadOneProp(DateFiks,nKodObj,strKodProp,ftFloat);
  if v = null
    then Result := 0
    else Result := v;
end;

function TdmBase.ReadPropAsText(DateFiks : TDateTime; nKodObj : Integer;
                             strKodProp : String) : String;
var
  v : Variant;
begin
  v := ReadOneProp(DateFiks,nKodObj,strKodProp,ftMemo);
  if v = null
    then Result := ''
    else Result := v;
end;

function TdmBase.ReadPropAsString(DateFiks : TDateTime; nKodObj : Integer;
                             strKodProp : String) : String;
var
  v : Variant;
begin
  v := ReadOneProp(DateFiks,nKodObj,strKodProp,ftString);
  if v = null
    then Result := ''
    else Result := v;
end;

function TdmBase.ReadPropAsInteger(DateFiks : TDateTime; nKodObj : Integer;
                             strKodProp : String) : Integer;
var
  v : Variant;
begin
  v := ReadOneProp(DateFiks,nKodObj,strKodProp,ftInteger);
  if v = null
    then Result := 0
    else Result := v;
end;

function TdmBase.ReadPropAsDate(DateFiks : TDateTime; nKodObj : Integer;
                             strKodProp : String) : TDateTime;
var
  v : Variant;
begin
  v := ReadOneProp(DateFiks,nKodObj,strKodProp,ftDate);
  if v = null
    then Result := STOD('1899-12-30',tdAds)
    else Result := v;
end;

function TdmBase.ReadPropAsBoolean(DateFiks : TDateTime; nKodObj : Integer;
                             strKodProp : String; lDef : Boolean) : Boolean;
var
  v : Variant;
begin
  v := ReadOneProp(DateFiks,nKodObj,strKodProp,ftBoolean);
  if v = null
    then Result := lDef
    else Result := v;
end;

function TdmBase.ReadOneProp(DateFiks : TDateTime; nKodObj : Integer; strKodProp : String; ft : TFieldType ) : Variant;
var
  vKeyValues : Variant;
  lFind : Boolean;
  sType : String;
begin
  LastError := '';
  vKeyValues := VarArrayCreate( [0, 2], varOleStr );
  vKeyValues[0] := DateFiks;
  vKeyValues[1] := nKodObj;
  vKeyValues[2] := strKodProp;
  lFind := false;
  if ft = ftUnknown then begin
    if tbProp.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
      lFind := true;
      sType := tbProp.FieldByName('TYPESAVE').AsString;
      if (sType='') then begin
        ft := ftString;
      end else begin
        ft := TFieldType(StrToInt(sType));
      end;
    end else if tbPropMemo.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
      lFind := true;
      ft := ftMemo;
    end else begin
      Result := null;
      exit;
    end;
  end;
  //------------------ читаем длинные строки -------------------
  if ft = ftMemo then begin
    if lFind or tbPropMemo.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
      Result := tbPropMemo.FieldByName('VALUE').AsString;
    end else begin
      Result := '';
    end;
  end else if (ft = ftBlob) or (ft = ftGraphic) then begin  // для хранения изображений
    {DONE 3 : чтение BLOB (пока не читаем ) }
    Result := null;
  end else begin
//                 0          1          2           3        4         5
//TFieldType = (ftUnknown, ftString, ftSmallint, ftInteger, ftWord, ftBoolean,
//     6         7         8      9       10       11         12         13
//  ftFloat, ftCurrency, ftBCD, ftDate, ftTime, ftDateTime, ftBytes, ftVarBytes,
//      14       15      16       17         18         19
//  ftAutoInc, ftBlob, ftMemo, ftGraphic, ftFmtMemo, ftParadoxOle,
//     20            21           22         23             24         25
//  ftDBaseOle, ftTypedBinary, ftCursor, ftFixedChar, ftWideString, ftLargeint,
//  ftADT, ftArray, ftReference, ftDataSet, ftOraBlob, ftOraClob, ftVariant,
//  ftInterface, ftIDispatch, ftGuid)
    if lFind or tbProp.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
      if tbProp.FieldByName('VALUE').IsNull then begin
        Result := null;
      end else begin
        try
          case ft of
            ftDate,ftTime,ftDateTime :   //9,10,11
                  Result := STOD(tbProp.FieldByName('VALUE').AsString, tdAds);
            ftInteger,ftWord,ftSmallint :   //2,3,4
                  Result := tbProp.FieldByName('NVALUE').AsInteger;
            ftFloat,ftCurrency :    //6,7
                  Result := tbProp.FieldByName('NVALUE').AsFloat;
            ftString :    //1
                  Result := tbProp.FieldByName('VALUE').AsString;
            ftBoolean :   //5
                  Result := tbProp.FieldByName('VALUE').AsString='1';
          else
            Result := tbProp.FieldByName('VALUE').AsString;
          end;
        except
          on E:Exception do begin
            LastError := 'ОШИБКА чтения реквизита '+strKodProp+#13+E.Message;
            Result := null;
          end;
        end;
      end;
    end else begin
      Result := null;
    end;
  end;
end;

//-------------------------------------------------------------------------------
function TdmBase.ReadAllProp(dDateFiks: TDateTime;  nKodObj: Integer; var lErr: Boolean): TCurrentRecord;
var
  nCur,nLen:Integer;
  ft : TFieldType;
  sType : String;
begin
  LastError := '';
  tbProp.IndexName:='PR_KEY';
  tbProp.SetRange([dDateFiks,nKodObj],[dDateFiks,nKodObj]);
  Setlength(Result,100);
  nLen:=100;
  nCur:=0;
  while not tbProp.Eof do begin
    if nCur>nLen then begin
      SetLength(Result,nLen+20);
      nLen:=Length(Result);
    end;
    Result[nCur].FieldName:=tbProp.FieldByName('POKAZ').AsString;
    if tbProp.FieldByName('VALUE').IsNull then begin
      Result[nCur].Value:=null;
    end else begin
      sType := tbProp.FieldByName('TYPESAVE').AsString;
      if (sType='') then begin
        ft := ftString;
      end else begin
        ft := TFieldType(StrToInt(sType));
      end;
      try
        case ft of
          ftDate,ftTime,ftDateTime :   //9,10,11
             Result[nCur].Value := STOD(tbProp.FieldByName('VALUE').AsString, tdAds);
          ftInteger,ftWord,ftSmallint :   //2,3,4
             Result[nCur].Value := tbProp.FieldByName('NVALUE').AsInteger;
          ftFloat,ftCurrency :    //6,7
             Result[nCur].Value := tbProp.FieldByName('NVALUE').AsFloat;
          ftString :    //1
             Result[nCur].Value := tbProp.FieldByName('VALUE').AsString;
          ftBoolean :   //5
             Result[nCur].Value := tbProp.FieldByName('VALUE').AsString='1';
        else
          Result[nCur].Value := tbProp.FieldByName('VALUE').AsString;
        end;
      except
        on E:Exception do begin
          LastError := 'ОШИБКА чтения реквизита '+Result[nCur].FieldName+#13+E.Message;
          Result[nCur].Value:=null;
        end;
      end;
    end;
    tbProp.Next;
  end;
  tbPropMemo.IndexName:='PR_KEY';
  tbPropMemo.SetRange([dDateFiks,nKodObj],[dDateFiks,nKodObj]);
  while not tbPropMemo.Eof do begin
    if nCur>nLen then begin
      SetLength(Result,nLen+20);
      nLen:=Length(Result);
    end;
    Result[nCur].FieldName:=tbPropMemo.FieldByName('POKAZ').AsString;
    if tbPropMemo.FieldByName('VALUE').IsNull then begin
      Result[nCur].Value:='';
    end else begin
      Result[nCur].Value:=tbPropMemo.FieldByName('VALUE').AsString;
    end;
    tbPropMemo.Next;
  end;
end;

//-------------------------------------------------------------------------------
procedure TdmBase.ReadPropFields(nTypeObj : Integer; strRazdel : String; dDateFiks : TDateTime; nKodObj : Integer;
                                 ds : TDataSet; var lErr : Boolean);
var
  vKeyValues : Variant;
  nID : Integer;
  fld : TField;
  fldType : TFieldType;
begin
  lErr := false;
  vKeyValues := VarArrayCreate( [0, 1], varOleStr );
  vKeyValues[0] := nTypeObj;
  vKeyValues[1] := StrToInt(strRazdel);
  if SprRazdel.Locate('TYPEOBJ;NOMER', vKeyValues, []) then begin
    if SprRazdel.FieldByName('VISIBLE').AsBoolean then begin
      nID := SprRazdel.FieldByName('ID').AsInteger;
      SprProperty.IndexName := 'KEY_VIEW';
      SprProperty.SetRange([nTypeObj,nID],[nTypeObj,nID]);
      with SprProperty do begin
        while not Eof do begin
          if FieldByName('VISIBLE').AsBoolean then begin
            fld := ds.FindField( FieldByName('KOD').AsString );
            if fld<>nil then begin
              if (fld.DataType=ftString) and (fld.Size>30) then begin
                fldType := ftMemo;
              end else begin
                fldType := fld.DataType;
              end;
              fld.Value := ReadOneProp(dDateFiks,nKodObj, fld.FieldName, fldType);

              // используется при записи
              fld.Tag   := nTypeObj;
              {TODO 1 : Обработка ошибки чтения свойства}
              if LastError <> '' then begin
                 PutError(LastError);
                 lErr := true;
              end;
            end;
          end;
          if lErr then begin
            break;
          end;
          Next;
        end;
      end;
      SprProperty.CancelRange;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------
function TdmBase.WriteValueProp(strKodProp:String; Value:Variant; DateFiks:TDateTime; nKodObj: Integer;
                                nTypeObj:Integer; nDataType:TFieldType) : Boolean;
var
  vKeyValues:Variant;
  lDelEmptyNum:Boolean;
begin
  Result := true;
  vKeyValues := VarArrayCreate( [0, 2], varOleStr );
  vKeyValues[0] := DateFiks;
  vKeyValues[1] := nKodObj;
  vKeyValues[2] := strKodProp;
  if (nDataType = ftMemo) then begin
    if VarToStr(Value)='' then begin  // если значение для записи пустое
      // если оно было, то удалим его
      if tbPropMemo.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
        tbPropMemo.Delete;
      end;
    end else begin
      if not tbPropMemo.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
        tbPropMemo.Append;
        tbPropMemo.FieldByName('DATE_FIKS').AsDateTime := DateFiks;
        tbPropMemo.FieldByName('ID').AsInteger := nKodObj;
        tbPropMemo.FieldByName('POKAZ').AsString := strKodProp;
      end else begin
        tbPropMemo.Edit;
      end;
      tbPropMemo.FieldByName('TYPEOBJ').AsInteger := nTypeObj;
      tbPropMemo.FieldByName('VALUE').AsString := VarToStr(Value);
      try
        tbPropMemo.Post;
      except
        on E: Exception do begin
          PutError('Ошибка записи в базу текстовых свойств.' +Chr(13) +
                   ' Ид.: <'+IntToStr(nKodObj)+'>  Свойство: <'+strKodProp+'>   '+
                   ' Значение: <'+VarToStr(Value)+'>'+Chr(13)+Chr(13)+E.Message);
          tbPropMemo.Cancel;
        end;
      end;
    end;
  end else if (nDataType = ftBlob) or (nDataType = ftGraphic ) then begin
      {DONE 3 : запись BLOB (пока не пишем ) }
  end else begin
    lDelEmptyNum := false;
    if VarIsNull(Value) or VarIsEmpty(Value) then begin  // если значение для записи пустое
      if tbProp.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
        tbProp.Delete;
      end;
    end else begin
      if not tbProp.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
        tbProp.Append;
        tbProp.FieldByName('DATE_FIKS').AsDateTime := DateFiks;
        tbProp.FieldByName('ID').AsInteger := nKodObj;
        tbProp.FieldByName('POKAZ').AsString := strKodProp;
      end else begin
        tbProp.Edit;
      end;
      try
        tbProp.FieldByName('TYPEOBJ').AsInteger  := nTypeObj;
        tbProp.FieldByName('TYPESAVE').AsInteger := Integer(nDataType);
        case nDataType of
          ftDate,ftTime,ftDateTime :
            tbProp.FieldByName('VALUE').AsString := DTOS(Value,tdAds);
          ftInteger,ftWord,ftSmallint :
            begin
              tbProp.FieldByName('NVALUE').AsInteger := Value;
              tbProp.FieldByName('VALUE').AsString   := VarToStr(Value);
            end;
          ftFloat,ftCurrency :
            begin
              tbProp.FieldByName('VALUE').AsString   := FloatToStrMy(Value);
//              tbProp.FieldByName('VALUE').AsString := VarToStr(Value);
              tbProp.FieldByName('NVALUE').AsFloat := Value;
            end;
          ftString :
            tbProp.FieldByName('VALUE').AsString := VarToStr(Value);
          ftBoolean :
            if Value=true
              then tbProp.FieldByName('VALUE').AsString:='1'
              else tbProp.FieldByName('VALUE').AsString:='0';
        else
          PutError(' Неизвестный тип свойства: <'+strKodProp+'>' );
          tbProp.FieldByName('VALUE').AsString := VarToStr(Value);
        end;
        if (tbProp.FieldByName('VALUE').AsString='0') and
           (nDataType in [ftInteger,ftWord,ftSmallint,ftFloat,ftCurrency]) then begin
          lDelEmptyNum := true;
        end;
        tbProp.Post;
      except
        on E: Exception do begin
          Result := false;
          PutError('Ошибка записи в базу свойств.' +Chr(13) +
                   ' Ид.: <'+IntToStr(nKodObj)+'>  Свойство: <'+strKodProp+'>   '+
                   ' Значение: <'+VarToStr(Value)+'>'+Chr(13)+Chr(13)+E.Message);
          tbProp.Cancel;
        end;
      end;
      if Result then begin
        // удалим пустое число
        if lDelEmptyNum then tbProp.Delete;
      end;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------
function TdmBase.WriteFieldProp(DateFiks : TDateTime; strKodProp : String; fld : TField; nKodObj: Integer; nTypeObj : Integer; nDataType : TFieldType): Boolean;
var
  vKeyValues : Variant;
  lDelEmptyNum : Boolean;
begin
  Result := true;
  vKeyValues := VarArrayCreate( [0, 2], varOleStr );
  vKeyValues[0] := DateFiks;
  vKeyValues[1] := nKodObj;
  vKeyValues[2] := strKodProp;
  if (nDataType = ftMemo) or ((nDataType = ftString) and (fld.Size>30)) then begin
    if fld.AsString='' then begin  // если значение для записи пустое
      // если оно было, то удалим его
      if tbPropMemo.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
        tbPropMemo.Delete;
      end;
    end else begin
      if not tbPropMemo.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
        tbPropMemo.Append;
        tbPropMemo.FieldByName('DATE_FIKS').AsDateTime := DateFiks;
        tbPropMemo.FieldByName('ID').AsInteger := nKodObj;
        tbPropMemo.FieldByName('POKAZ').AsString := strKodProp;
      end else begin
        tbPropMemo.Edit;
      end;
      tbPropMemo.FieldByName('TYPEOBJ').AsInteger := nTypeObj;
      tbPropMemo.FieldByName('VALUE').AsString := fld.AsString;
      try
        tbPropMemo.Post;
      except
        on E: Exception do begin
          PutError('Ошибка записи в базу текстовых свойств.' +Chr(13) +
                   ' Ид.: <'+IntToStr(nKodObj)+'>  Свойство: <'+strKodProp+'>   '+
                   ' Значение: <'+fld.AsString+'>'+Chr(13)+Chr(13)+E.Message);
          tbPropMemo.Cancel;
        end;
      end;
    end;
  end else if (nDataType = ftBlob) or (nDataType = ftGraphic ) then begin
      {DONE 3 : запись BLOB (пока не пишем ) }
  end else begin
    lDelEmptyNum := false;
      if fld.IsNull or (fld.AsString='') then begin  // если значение для записи пустое
        if tbProp.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
          tbProp.Delete;
        end;
      end else begin
        if not tbProp.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
          tbProp.Append;
          tbProp.FieldByName('DATE_FIKS').AsDateTime := DateFiks;
          tbProp.FieldByName('ID').AsInteger := nKodObj;
          tbProp.FieldByName('POKAZ').AsString := strKodProp;
        end else begin
          tbProp.Edit;
        end;
        try
          tbProp.FieldByName('TYPEOBJ').AsInteger  := nTypeObj;
          tbProp.FieldByName('TYPESAVE').AsInteger := Integer(nDataType);
          if fld.IsNull then begin
            tbProp.FieldByName('VALUE').AsString := '';
          end else begin
            case nDataType of
              ftDate,ftTime,ftDateTime :
                tbProp.FieldByName('VALUE').AsString := DTOS(fld.AsDateTime,tdAds);
              ftInteger,ftWord,ftSmallint :
                begin
                  tbProp.FieldByName('VALUE').AsString   := fld.AsString;
                  tbProp.FieldByName('NVALUE').AsInteger := fld.AsInteger;
                end;
              ftFloat,ftCurrency :
                begin
                  tbProp.FieldByName('VALUE').AsString   := FloatToStrMy(fld.AsFloat);
//                  tbProp.FieldByName('VALUE').AsString := fld.AsString;
                  tbProp.FieldByName('NVALUE').AsFloat := fld.AsFloat;
                end;
              ftString :
                tbProp.FieldByName('VALUE').AsString := fld.AsString;
              ftBoolean :
                begin
                  if fld.DataType=ftBoolean then begin
                    if fld.AsBoolean
                      then tbProp.FieldByName('VALUE').AsString:='1'
                      else tbProp.FieldByName('VALUE').AsString:='0';
                  end else begin
                    tbProp.FieldByName('VALUE').AsString:=fld.AsString;
                  end;
                end;
            else
              PutError(' Неизвестный тип свойства: <'+strKodProp+'>' );
              tbProp.FieldByName('VALUE').AsString := fld.AsString;
            end;
            if (tbProp.FieldByName('VALUE').AsString='0') and
               (nDataType in [ftInteger,ftWord,ftSmallint,ftFloat,ftCurrency]) then begin
              lDelEmptyNum := true;
            end;
          end;
          tbProp.Post;
        except
          on E: Exception do begin
            Result := false;
            PutError('Ошибка записи в базу свойств.' +Chr(13) +
                     ' Ид.: <'+IntToStr(nKodObj)+'>  Свойство: <'+strKodProp+'>   '+
                     ' Значение: <'+fld.AsString+'>'+Chr(13)+Chr(13)+E.Message);
            tbProp.Cancel;
          end;
        end;
        if Result then begin
          // удалим пустое число
          if lDelEmptyNum then tbProp.Delete;
        end;
      end;
    end;
  end;

function TdmBase.WriteProp(DateFiks: TDateTime; nKodObj: Integer;  dsSource : TDataSet; strKodProp : String; nTypeObj : Integer ): Boolean;
var
  vKeyValues : Variant;
  i : Integer;
  fld : TField;
  lDelEmptyNum : Boolean;
  procedure WriteOne;
  begin
    vKeyValues[2] := strKodProp;
    if (fld.DataType = ftMemo) or ((fld.DataType = ftString) and (fld.Size>30)) then begin
      if fld.AsString='' then begin  // если значение для записи пустое
        // если оно было, то удалим его
        if tbPropMemo.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
          tbPropMemo.Delete;
        end;
      end else begin
        if not tbPropMemo.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
          tbPropMemo.Append;
          tbPropMemo.FieldByName('DATE_FIKS').AsDateTime := DateFiks;
          tbPropMemo.FieldByName('ID').AsInteger := nKodObj;
          tbPropMemo.FieldByName('POKAZ').AsString := strKodProp;
        end else begin
          tbPropMemo.Edit;
        end;
        tbPropMemo.FieldByName('TYPEOBJ').AsInteger := nTypeObj;
        tbPropMemo.FieldByName('VALUE').AsString := fld.AsString;
        try
          tbPropMemo.Post;
        except
          on E: Exception do begin
            PutError('Ошибка записи в базу текстовых свойств.' +Chr(13) +
                     ' Ид.: <'+IntToStr(nKodObj)+'>  Свойство: <'+strKodProp+'>   '+
                     ' Значение: <'+fld.AsString+'>'+Chr(13)+Chr(13)+E.Message);
            tbPropMemo.Cancel;
          end;
        end;
      end;
    end else if (fld.DataType = ftBlob) or (fld.DataType = ftGraphic ) then begin
      {DONE 3 : запись BLOB (пока не пишем ) }
    end else begin
      lDelEmptyNum := false;
      if fld.IsNull or (fld.AsString='') then begin  // если значение для записи пустое
        if tbProp.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
          tbProp.Delete;
        end;
      end else begin
        if not tbProp.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
          tbProp.Append;
          tbProp.FieldByName('DATE_FIKS').AsDateTime := DateFiks;
          tbProp.FieldByName('ID').AsInteger := nKodObj;
          tbProp.FieldByName('POKAZ').AsString := strKodProp;
        end else begin
          tbProp.Edit;
        end;
        try
          tbProp.FieldByName('TYPEOBJ').AsInteger  := nTypeObj;
          tbProp.FieldByName('TYPESAVE').AsInteger := Integer(fld.DataType);
          if fld.IsNull then begin
            tbProp.FieldByName('VALUE').AsString := '';
          end else begin
            case fld.DataType of
              ftDate,ftTime,ftDateTime :
                tbProp.FieldByName('VALUE').AsString := DTOS(fld.AsDateTime,tdAds);
              ftInteger,ftWord,ftSmallint :
                begin
                  tbProp.FieldByName('VALUE').AsString   := fld.AsString;
                  tbProp.FieldByName('NVALUE').AsInteger := fld.AsInteger;
                end;
              ftFloat,ftCurrency :
                begin
                  tbProp.FieldByName('VALUE').AsString   := FloatToStrMy(fld.AsFloat);
//                  tbProp.FieldByName('VALUE').AsString := fld.AsString;
                  tbProp.FieldByName('NVALUE').AsFloat := fld.AsFloat;
                end;
              ftString :
                tbProp.FieldByName('VALUE').AsString := fld.AsString;
              ftBoolean :
                begin
                  if fld.AsBoolean
                    then tbProp.FieldByName('VALUE').AsString:='1'
                    else tbProp.FieldByName('VALUE').AsString:='0';
                end;
            else
              PutError(' Неизвестный тип свойства: <'+strKodProp+'>' );
              tbProp.FieldByName('VALUE').AsString := fld.AsString;
            end;
            if (tbProp.FieldByName('VALUE').AsString='0') and
               (fld.DataType in [ftInteger,ftWord,ftSmallint,ftFloat,ftCurrency]) then begin
              lDelEmptyNum := true;
            end;
          end;
          tbProp.Post;
        except
          on E: Exception do begin
            Result := false;
            PutError('Ошибка записи в базу свойств.' +Chr(13) +
                     ' Ид.: <'+IntToStr(nKodObj)+'>  Свойство: <'+strKodProp+'>   '+
                     ' Значение: <'+fld.AsString+'>'+Chr(13)+Chr(13)+E.Message);
            tbProp.Cancel;
          end;
        end;
        if Result then begin
          // удалим пустое число
          if lDelEmptyNum then tbProp.Delete;
        end;
      end;
    end;
  end;
begin
  Result := true;
  vKeyValues := VarArrayCreate( [0, 2], varOleStr );
  vKeyValues[0] := DateFiks;
  vKeyValues[1] := nKodObj;
  if strKodProp='' then begin
    for i:=0 to dsSource.FieldCount-1 do begin
      strKodProp := dsSource.Fields[i].FieldName;
      fld := dsSource.Fields[i];
      // пишем только поля которые были прочитаны из соотв. типа (см. чтение)
      if fld.Tag = nTypeObj then begin
        WriteOne;
      end;
    end;
  end else begin
    fld := dsSource.FindField(strKodProp);
    if fld <> nil then begin
      WriteOne;
    end;
  end;
end;

function TdmBase.DeleteProp(DateFiks: TDateTime; nKodObj: Integer; strKodProp : String; ft : TFieldType) : Boolean;
var
  vKeyValues : Variant;
begin
  Result := false;
  if nKodObj = -1 then begin // удаление у всех объектов

  end else begin
    vKeyValues := VarArrayCreate( [0, 2], varOleStr );
    vKeyValues[0] := DateFiks;
    vKeyValues[1] := nKodObj;
    vKeyValues[2] := strKodProp;
    if ft = ftUnknown then begin
      if tbPropMemo.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
        tbPropMemo.Delete;
        Result := true;
      end;
      if tbProp.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
        tbProp.Delete;
        Result := true;
      end;
    end else if (ft = ftMemo) then begin
      if tbPropMemo.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
        tbPropMemo.Delete;
        Result := true;
      end;
    end else if (ft = ftBlob) or (ft = ftGraphic ) then begin
      {DONE 3 : запись BLOB (пока не пишем ) }
    end else begin
      if tbProp.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
        tbProp.Delete;
        Result := true;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------
function TdmBase.ReadPropSimpleDok(nTypeObj:Integer; nKodObj:Integer; DateSave:TDateTime; strKodProp:String; ft:TFieldType ) : Variant;
var
  vKeyValues : Variant;
  lFind : Boolean;
  sType : String;
begin
  LastError := '';
//  TYPEOBJ;ID;DATES;POKAZ
  vKeyValues := VarArrayCreate( [0, 3], varOleStr );
  vKeyValues[0] := nTypeObj;
  vKeyValues[1] := nKodObj;
  vKeyValues[2] := DateSave;
  vKeyValues[3] := strKodProp;
  lFind := false;
  if ft = ftUnknown then begin
    if tbSimpleProp.Locate('TYPEOBJ;ID;DATES;POKAZ', vKeyValues, []) then begin
      lFind := true;
      sType := tbSimpleProp.FieldByName('TYPESAVE').AsString;
      if (sType='') then begin
        ft := ftString;
      end else begin
        ft := TFieldType(StrToInt(sType));
      end;
    end else if tbSimplePropMemo.Locate('TYPEOBJ;ID;DATES;POKAZ', vKeyValues, []) then begin
      lFind := true;
      ft := ftMemo;
    end else begin
      Result := null;
      exit;
    end;
  end;
  //------------------ читаем длинные строки -------------------
  if (ft = ftMemo) then begin
    if lFind or tbSimplePropMemo.Locate('TYPEOBJ;ID;DATES;POKAZ', vKeyValues, []) then begin
      Result := tbSimplePropMemo.FieldByName('VALUE').AsString;
    end else begin
      Result := '';
    end;
  end else if (ft = ftBlob) or (ft = ftGraphic) then begin  // для хранения изображений
    {DONE 3 : чтение BLOB (пока не читаем ) }
    Result := null;
  end else begin
    if lFind or tbSimpleProp.Locate('TYPEOBJ;ID;DATES;POKAZ', vKeyValues, []) then begin
      if tbSimpleProp.FieldByName('VALUE').IsNull then begin
        Result := null;
      end else begin
        try
          case ft of
            ftDate,ftTime,ftDateTime :
                  Result := STOD(tbSimpleProp.FieldByName('VALUE').AsString, tdAds);
            ftInteger,ftWord,ftSmallint :
                  Result := StrToInt(tbSimpleProp.FieldByName('VALUE').AsString);
            ftFloat,ftCurrency :
                  Result := StrToFloatMy(tbSimpleProp.FieldByName('VALUE').AsString);
//                  Result := StrToFloat(tbSimpleProp.FieldByName('VALUE').AsString);
            ftString :
                  Result := tbSimpleProp.FieldByName('VALUE').AsString;
            ftBoolean :
                  Result := tbSimpleProp.FieldByName('VALUE').AsString='1';
          else
            Result := tbSimpleProp.FieldByName('VALUE').AsString;
          end;
        except
          on E:Exception do begin
            LastError := 'ОШИБКА чтения реквизита '+strKodProp+#13+E.Message;
            Result := null;
          end;
        end;
      end;
    end else begin
      Result := null;
    end;
  end;
  if (Result=null) and ((ft=ftString) or (ft=ftMemo)) then begin
    Result:='';
  end;
end;

//-----------------------------------------------------------------------
function TdmBase.WritePropSimpleDok(nTypeObj:Integer; nKodObj:Integer; DateSave:TDateTime; strKodProp:String; fld:TField; sVal:String; nDataType:TFieldType): Boolean;
var
  vKeyValues : Variant;
  lDelEmptyNum : Boolean;
begin
  Result := true;
//  TYPEOBJ;ID;DATES;POKAZ
  if strKodProp='' then begin
    strKodProp := fld.FieldName;
  end;
  if DateSave<=0 then begin
    DateSave:=STOD(CURRENT_SOST,tdAds);
  end;
  vKeyValues := VarArrayCreate( [0, 3], varOleStr );
  vKeyValues[0] := nTypeObj;
  vKeyValues[1] := nKodObj;
  vKeyValues[2] := DateSave;
  vKeyValues[3] := strKodProp;
  if sVal<>'' then begin      // передано например название органа ЗАГС
    if (nDataType=ftUnknown) or (nDataType=ftMemo) or ((nDataType=ftString) and (Length(sVal)>30)) then begin
      if not tbSimplePropMemo.Locate('TYPEOBJ;ID;DATES;POKAZ', vKeyValues, []) then begin
        tbSimplePropMemo.Append;
        tbSimplePropMemo.FieldByName('DATES').AsDateTime := DateSave;
        tbSimplePropMemo.FieldByName('ID').AsInteger     := nKodObj;
        tbSimplePropMemo.FieldByName('POKAZ').AsString   := strKodProp;
        tbSimplePropMemo.FieldByName('TYPEOBJ').AsInteger:= nTypeObj;
      end else begin
        tbSimplePropMemo.Edit;
      end;
      tbSimplePropMemo.FieldByName('VALUE').AsString := sVal;
      tbSimplePropMemo.Post;
    end else begin
      if not tbSimpleProp.Locate('TYPEOBJ;ID;DATES;POKAZ', vKeyValues, []) then begin
        tbSimpleProp.Append;
        tbSimpleProp.FieldByName('DATES').AsDateTime := DateSave;
        tbSimpleProp.FieldByName('ID').AsInteger     := nKodObj;
        tbSimpleProp.FieldByName('POKAZ').AsString   := strKodProp;
        tbSimpleProp.FieldByName('TYPEOBJ').AsInteger:= nTypeObj;
        tbSimpleProp.FieldByName('TYPESAVE').AsInteger := Integer(nDataType);
      end else begin
        tbSimpleProp.Edit;
      end;
      tbSimpleProp.FieldByName('VALUE').AsString:=sVal;
      tbSimpleProp.Post;
    end;
  end else begin
    if (fld.DataType = ftMemo) or ((fld.DataType = ftString) and (fld.Size>30)) then begin
      if fld.AsString='' then begin  // если значение для записи пустое
        // если оно было, то удалим его
        if tbSimplePropMemo.Locate('TYPEOBJ;ID;DATES;POKAZ', vKeyValues, []) then begin
          tbSimplePropMemo.Delete;
        end;
      end else begin
        if not tbSimplePropMemo.Locate('TYPEOBJ;ID;DATES;POKAZ', vKeyValues, []) then begin
          tbSimplePropMemo.Append;
          tbSimplePropMemo.FieldByName('DATES').AsDateTime := DateSave;
          tbSimplePropMemo.FieldByName('ID').AsInteger     := nKodObj;
          tbSimplePropMemo.FieldByName('POKAZ').AsString   := strKodProp;
          tbSimplePropMemo.FieldByName('TYPEOBJ').AsInteger:= nTypeObj;
        end else begin
          tbSimplePropMemo.Edit;
        end;
        tbSimplePropMemo.FieldByName('VALUE').AsString := fld.AsString;
        tbSimplePropMemo.Post;
      end;
    end else if (fld.DataType = ftBlob) or (fld.DataType = ftGraphic ) then begin
      {DONE 3 : запись BLOB (пока не пишем ) }
    end else begin
      lDelEmptyNum := false;
      if fld.IsNull or (fld.AsString='') then begin  // если значение для записи пустое
        if tbSimpleProp.Locate('TYPEOBJ;ID;DATES;POKAZ', vKeyValues, []) then begin
          tbSimpleProp.Delete;
        end;
      end else begin
        if not tbSimpleProp.Locate('TYPEOBJ;ID;DATES;POKAZ', vKeyValues, []) then begin
          tbSimpleProp.Append;
          tbSimpleProp.FieldByName('DATES').AsDateTime := DateSave;
          tbSimpleProp.FieldByName('ID').AsInteger     := nKodObj;
          tbSimpleProp.FieldByName('POKAZ').AsString   := strKodProp;
          tbSimpleProp.FieldByName('TYPEOBJ').AsInteger:= nTypeObj;
        end else begin
          tbSimpleProp.Edit;
        end;
        try
          tbSimpleProp.FieldByName('TYPESAVE').AsInteger := Integer(fld.DataType);
          if fld.IsNull then begin
            tbSimpleProp.FieldByName('VALUE').AsString := '';
          end else begin
            case fld.DataType of
              ftDate,ftTime,ftDateTime :
                tbSimpleProp.FieldByName('VALUE').AsString := DTOS(fld.AsDateTime,tdAds);
              ftInteger,ftWord,ftSmallint :
                tbSimpleProp.FieldByName('VALUE').AsString := fld.AsString;
              ftFloat,ftCurrency :
//                tbSimpleProp.FieldByName('VALUE').AsString := fld.AsString;
                tbSimpleProp.FieldByName('VALUE').AsString := FloatToStrMy(fld.AsFloat);
              ftString :
                tbSimpleProp.FieldByName('VALUE').AsString := fld.AsString;
              ftBoolean :
                begin
                  if fld.AsBoolean
                    then tbSimpleProp.FieldByName('VALUE').AsString:='1'
                    else tbSimpleProp.FieldByName('VALUE').AsString:='0';
                end;
            else
              tbSimpleProp.FieldByName('VALUE').AsString := fld.AsString;
            end;
            if (tbSimpleProp.FieldByName('VALUE').AsString='0') and
               (fld.DataType in [ftInteger,ftWord,ftSmallint,ftFloat,ftCurrency]) then begin
              lDelEmptyNum := true;
            end;
          end;
        except
          on E:Exception do begin
            LastError := 'ОШИБКА записи реквизита '+strKodProp+#13+E.Message;
            Result := false;
          end;
        end;
        if Result then begin
          tbSimpleProp.Post;
          // удалим пустое число
          if lDelEmptyNum then tbSimpleProp.Delete;
        end else begin
          tbSimpleProp.Cancel;
        end;
      end;
    end;
  end;
end;

//-----------------------------------------------------------------------
function TdmBase.ErasePropSimpleDok(nTypeObj : Integer; nKodObj: Integer; strKodProp : String): Boolean;
var
  vKeyValues : Variant;
begin
  Result := true;
  vKeyValues := VarArrayCreate( [0, 3], varOleStr );
  vKeyValues[0] := nTypeObj;
  vKeyValues[1] := nKodObj;
  vKeyValues[2] := getdateCurrentSost;
  vKeyValues[3] := strKodProp;
//  TYPEOBJ;ID;DATES;POKAZ
 if tbSimplePropMemo.Locate('TYPEOBJ;ID;DATES;POKAZ', vKeyValues, []) then begin
   tbSimplePropMemo.Delete;
 end;
 if tbSimpleProp.Locate('TYPEOBJ;ID;DATES;POKAZ', vKeyValues, []) then begin
   tbSimpleProp.Delete;
 end;
end;
//----------------------------------------------------------------
procedure TdmBase.ClearIdBase;
begin
  FIdBase:=-1;
  FMainBase:=-1;
  FDistributeBase:=false;
  FCountZnack:=0;
end;

//----------------------------------------------------------------
// база распределенная ?
function TdmBase.IsDistributeBase: Boolean;
begin
{$IFDEF GKH}
  if FMainBase=-1 then begin
    IsMainBase;
  end;
  Result:=FDistributeBase;
{$ELSE}
  Result:=false;
{$ENDIF}
end;

//----------------------------------------------------------------
function TdmBase.IsMainBase: Boolean;
begin
{$IFDEF GKH}
  if FMainBase=-1 then begin
    WorkQuery.Close;
    WorkQuery.SQL.Text:='SELECT main_base FROM global';
    WorkQuery.Open;
    if WorkQuery.Eof or WorkQuery.Fields[0].IsNull then begin
      Result:=true;
      FMainBase:=1;
      FDistributeBase:=false;
    end else if (WorkQuery.Fields[0].AsBoolean=true) then begin
      Result:=true;
      FMainBase:=1;
      FDistributeBase:=true;
    end else if (WorkQuery.Fields[0].AsBoolean=false) then begin
      Result:=false;
      FMainBase:=0;
      FDistributeBase:=true;
    end;
  end else begin
    if FMainBase=1 then begin
      Result:=true;
    end else begin
      Result:=false;
    end;
  end;
{$ELSE}
  Result:=true;
  FMainBase:=1;
  FDistributeBase:=false;
{$ENDIF}
end;
//----------------------------------------------------------------
function TdmBase.GetIdBase(var nCountZnak:Integer) : Integer;
var
  s : String;
  lOpen:Boolean;
begin
  if FIdBase=-1 then begin
    s:='';
    lOpen:=false;
    WorkQuery.Close;
    WorkQuery.SQL.Text:='SELECT id_base, count_sim FROM global';
    try
      WorkQuery.Open;
      lOpen:=true;
      Result:=StrToIntDef(Trim(WorkQuery.Fields[0].AsString),0);
      s:=ANSILowerCase(Trim(WorkQuery.Fields[1].AsString))
    except
      Result:=0;
    end;

    FIdBase:=Result;
    if Result=0 then begin
      {$IFDEF GKH}
        if IsMainBase and IsDistributeBase then begin
          nCountZnak:=StrToIntDef(s,3);
        end else begin
          nCountZnak:=0;
        end;
      {$ELSE}
        nCountZnak:=0;
      {$ENDIF}
    end else begin
      nCountZnak:=StrToIntDef(s,3);
    end;
    FCountZnack:=nCountZnak;
    if lOpen
      then  WorkQuery.Close;
  end else begin
    nCountZnak:=FCountZnack;
    Result:=FIdBase;
  end;
end;
//----------------------------------------------------------------
function TdmBase.GetOrgMD5 : String;
begin
  WorkQuery.Close;
  WorkQuery.SQL.Text:='SELECT org FROM global';
  try
    WorkQuery.Open;
    Result:=WorkQuery.Fields[0].AsString;
    WorkQuery.Close;
  except
    Result:='';
  end;
end;
//----------------------------------------------------------------
function TdmBase.GetSysIdBase: String;
begin
  Result:='';
  if AdsConnection.IsConnected then begin
    WorkQuery.Close;
    WorkQuery.SQL.Text:='SELECT sysid FROM global';
    try
      WorkQuery.Open;
      Result:=Trim(WorkQuery.Fields[0].AsString);
      WorkQuery.Close;
      if Result='' then begin
//        AdsConnection.Execute('UPDATE global set sysid=Replace(NewIDString(),''-'','''')');
        AdsConnection.Execute('UPDATE global set sysid=NewIDString()');
        Result:=GetSysIdBase;
      end;
    except
    end;
  end;
end;
//-----------------------------------------------------------
function TdmBase._CalcID(nID,nIdBase,nCountZn:Integer) : Integer;
begin
  // вариант 1    Id базы добаляется спереди
//  s:=PadLStr(tbAllDokums.FieldByName('NEWID').AsString,10-nCountZnak,'0');
//  Result:=StrToInt(IntToStr(nIdBase)+s);

  // вариант 2    Id базы добаляется сзади
  Result:=StrToInt(IntToStr(nID)+PadLStr(IntToStr(nIdBase),nCountZn,'0'));
end;
//-----------------------------------------------------------
function TdmBase.MaxID : Integer;
var
  strSQL:String;
  sl:TStringList;
  i:Integer;
begin
  sl:=TStringList.Create;
  Result:=-1;
  {$IFDEF GKH}
    // если база главная и она распределенная
    if IsMainBase and IsDistributeBase then begin
      strSQL:=LoadSQLEx('MAX_ID_BASE');
      strSQL:=StringReplace(strSQL, '&ID_BASE&', '0',[rfReplaceAll,rfIgnoreCase]);
    end else begin
      strSQL:=LoadSQLEx('MAX_ID');
    end;
  {$ELSE}
    {$IFDEF ZAGS}
       sl.Add('MAX(id) id FROM СпрМестРаботы');
    {$ELSE}
      {$IFDEF POST}
         sl.Add('MAX(id) id FROM Население');
         sl.Add('MAX(id) id FROM БазаДомов');
         sl.Add('MAX(id) id FROM СпрМестРаботы');
      {$ELSE}
         sl.Add('MAX(id) id FROM Население');
         sl.Add('MAX(id) id FROM ЛицевыеСчета');
         sl.Add('MAX(id) id FROM БазаДомов');
         sl.Add('MAX(id) id FROM СпрМестРаботы');
      {$ENDIF}
    {$ENDIF}
    {$IFDEF SMDO}
      sl.Add('MAX(id) id FROM SMDOPost');
      sl.Add('MAX(task_id) id FROM SMDOTask');
    {$ENDIF}
    strSQL:='SELECT MAX(id) FROM ( ';
    for i:=0 to sl.Count-1 do begin
      strSQL:=strSQL+' SELECT '+sl.Strings[i];
      if i=sl.Count-1
        then strSQL:=strSQL+' ) m'
        else strSQL:=strSQL+' union all ';
    end;
  {$ENDIF}
  if strSQL<>'' then begin
    WorkQuery.SQL.Text := strSQL;
    WorkQuery.Open;
    Result := WorkQuery.Fields[0].AsInteger;
    WorkQuery.Close;       
//    showmessage(strsql);
  end;
  sl.Free;
end;
//-----------------------------------------------------------
function TdmBase.GetLastID : Integer;
var
  n,nIdBase:Integer;
begin
  try
    tbAllDokums.Last;
    Result := tbAllDokums.FieldByName('NEWID').AsInteger;
  except
    Result:=0;
  end;
  if Result>0 then begin
    nIdBase:=getIdBase(n);
    if nIdBase=-1 then begin
      PutError(' Ошибка определения идентификатора базы. ');
    end else if nIdBase=0 then begin
      if IsMainBase and IsDistributeBase then begin  // для ЖКН в центральной базе
        Result:=_CalcID(Result,0,n);
      end;
    end else if nIdBase>0 then begin
      Result:=_CalcID(Result,nIdBase,n);
    end;
  end;
end;

//----------------------------------------------------------------
function TdmBase.GetNewID( TypeObj : Integer ) : Integer;
var
  nIdBase,nCountZnak:Integer;
begin
  Result := -1;
  try            
    nIdBase:=getIdBase(nCountZnak);
    if nIdBase=-1 then begin
      PutError(' Ошибка определения идентификатора базы. ');
    end else if nIdBase=0 then begin
      tbAllDokums.Append;
      tbAllDokums.FieldByName('DATE_ADD').AsDateTime := dmBase.getCurDate;
      tbAllDokums.FieldByName('TYPEOBJ').AsInteger   := TypeObj;
      tbAllDokums.FieldByName('USERID').AsString     := UserId;
      tbAllDokums.Post;
      if IsMainBase and IsDistributeBase then begin  // для ЖКН в центральной базе
        Result:=_CalcID(tbAllDokums.FieldByName('NEWID').AsInteger,0,nCountZnak);
      end else begin
        Result := tbAllDokums.FieldByName('NEWID').AsInteger;
      end;
    end else begin
//      PutError(' Идентификатор базы не поддерживается. ');
    // 2147483 647            
//      PadRStr()nIdBase()
//      Result := IntToStr(tbAllDokums.FieldByName('NEWID').AsInteger);
      tbAllDokums.Append;
      tbAllDokums.FieldByName('DATE_ADD').AsDateTime := dmBase.getCurDate;
      tbAllDokums.FieldByName('TYPEOBJ').AsInteger   := TypeObj;
      tbAllDokums.FieldByName('USERID').AsString     := UserId;
      tbAllDokums.Post;

      Result:=_CalcID(tbAllDokums.FieldByName('NEWID').AsInteger,nIdBase,nCountZnak);
    end;
  except
    on E:Exception do begin
      Result:=-1;
      PutError(' Ошибка создания идентификатора. '+#13+E.Message);
    end;
  end;
end;
//--------------------------------------------------------
function TdmBase.TypeObj2Str(nTypeObj:Integer): String;
begin
  Result:='NONE';
  case nTypeObj of
   _TypeObj_BigHouse       : Result:='BIGHOUSE'     ;    //1
   _TypeObj_Adres          : Result:='ADRES'        ;
   _TypeObj_Lich           : Result:='LICH'         ;
   _TypeObj_Nasel          : Result:='NASEL'        ;
   _TypeObj_Passport       : Result:='PASSPORT'     ;
   _TypeObj_ZBrak          : Result:='AKT_BRAK'     ;
   _TypeObj_ZRast          : Result:='AKT_RAST'     ;
   _TypeObj_ZRogd          : Result:='AKT_ROGD'     ;
   _TypeObj_ZSmert         : Result:='AKT_SMERT'    ;
   _TypeObj_ZUstOtc        : Result:='AKT_USTOTC'   ;    //10
   _TypeObj_ZUstMat        : Result:='AKT_USTMAT'   ;
   _TypeObj_ZAdopt         : Result:='AKT_ADOPT'    ;
   _TypeObj_ZChName        : Result:='AKT_CHNAME'   ;
   _TypeObj_DeclareRegistr : Result:='DECL_REGISTR' ;
   _TypeObj_RasxNaklSvid   : Result:='NAKL_SVID'    ;
   _TypeObj_AktSpisSvid    : Result:='AKT_SPIS_SVID';
   _TypeObj_AktNalichSvid  : Result:='AKT_NAL_SVID' ;
   _TypeObj_TalonPrib      : Result:='TALONPRIB'    ;
   _TypeObj_TalonUbit      : Result:='TALONUBIT'    ;
   _TypeObj_DBrak          : Result:='DECL_BRAK'    ;
   _TypeObj_DChName        : Result:='DECL_CHNAME'  ;
   _TypeObj_DIzm           : Result:='DECL_IZM'     ;
   _TypeObj_DRast          : Result:='DECL_RAST'    ;
   _TypeObj_Alfavit        : Result:='ALFAVIT'      ;
   _TypeObj_Owners         : Result:='OWNERS'       ;
   _TypeObj_AktZAH         : Result:='AKT_ZAH'      ;
   _TypeObj_Opeka          : Result:='AKT_OPEKA'    ;
   _TypeObj_PasportTerr    : Result:='PASP_TERR'    ;    //20
   _TypeObj_Sovet          : Result:='SOVET'        ;
   _TypeObj_Ochered        : Result:='OCHERED'      ;
   _TypeObj_VUS            : Result:='VUS'          ;
   _TypeObj_Organ          : Result:='SPRORGAN'     ;
   _TypeObj_Obrach         : Result:='OBRACH'       ;
   _TypeObj_Spr            : Result:='SPR'          ;
   _TypeObj_ZAGS_AddDok    : Result:='ZAGS_ADDDOK'  ;
   _TypeObj_ZAGS_SPRAKT    : Result:='SPR_AKT'      ;
   _TypeObj_ZAGS_SprOtsut  : Result:='SPR_OTSUT'    ;    // справка об отсутствии актовой записи
   _TypeObj_ZAGS_IzvOtsut  : Result:='IZV_OTSUT'    ;    // извещение об отсутствии актовой записи  30
   _TypeObj_ZAGS_ZaklChName: Result:='ZAKL_CHNAME'  ;    // заключение о перемене имени, фамилии
   _TypeObj_ZAGS_SprBrak   : Result:='SPR_BRAK'     ;    // справка о записи акта о браке
   _TypeObj_ZAGS_SprRogd   : Result:='SPR_ROGD'     ;    // справка о записи акта о рождении
   _TypeObj_ZAGS_SprSmert  : Result:='SPR_SMER'     ;    // справка о записи акта о смерти
   _TypeObj_ZAGS_SprChName : Result:='SPR_CHNAME'   ;    //
   _TypeObj_ZAGS_SprRast   : Result:='SPR_RAST'     ;    //
   _TypeObj_ZAGS_ZaklIzmAkt: Result:='ZAKL_IZMAKT'  ;    //  заключение о изменении актовой записи    37
  end;
end;

function TdmBase.TypeObj_Adres: Integer;
begin Result := 1; end;

function TdmBase.TypeObj_Lich: Integer;
begin Result := 2; end;

function TdmBase.TypeObj_Nasel: Integer;
begin Result := 3; end;

function TdmBase.TypeObj_Passport: Integer;
begin Result := 4; end;

function TdmBase.TypeObj_ZBrak: Integer;
begin Result := 5; end;

function TdmBase.TypeObj_ZRogd: Integer;
begin Result := 6; end;

function TdmBase.TypeObj_ZSmert: Integer;
begin Result := 7; end;

function TdmBase.TypeObj_ZUstOtc: Integer;
begin Result := 8; end;

function TdmBase.TypeObj_TalonPrib: Integer;
begin Result := 9; end;

function TdmBase.TypeObj_TalonUbit: Integer;
begin Result := 10; end;

function TdmBase.TypeObj_ZRast: Integer;
begin Result := 11; end;

function TdmBase.TypeObj_ZAdopt: Integer;
begin Result := 12; end;

function TdmBase.TypeObj_ZChName: Integer;
begin Result := 13; end;

function TdmBase.TypeObj_PassportViza: Integer;
begin Result := 14; end;

function TdmBase.TypeObj_Owners: Integer;
begin Result := 15; end;

function TdmBase.TypeObj_DBrak: Integer;
begin Result := 16; end;

function TdmBase.TypeObj_DRast: Integer;
begin Result := 30; end;

function TdmBase.TypeObj_BigHouse: Integer;
begin Result := 17; end;

function TdmBase.TypeObj_ZUstMat: Integer;
begin Result := 18; end;

function TdmBase.TypeObj_Sovet: Integer;  // месный совет
begin Result := 19; end;

function TdmBase.TypeObj_PasportTerr: Integer;  // паспорт территории
begin Result := 20; end;

function TdmBase.TypeObj_Ochered: Integer;
begin Result := 21; end;

function TdmBase.TypeObj_Organ: Integer;    // справочник организаций (СпрМестРаботы)
begin Result := 22; end;

function TdmBase.TypeObj_Obrach: Integer;  // обращения граждан
begin Result := 23; end;

function TdmBase.TypeObj_VUS: Integer;
begin Result := 24; end;

function TdmBase.TypeObj_DeclareRegistr: Integer;      // заявление на регистрацию
begin Result := 25; end;

function TdmBase.TypeObj_RasxNaklSvid: Integer;     // расходная накладная свидетельства в сельисполком
begin Result:=26 end;
function TdmBase.TypeObj_AktSpisSvid : Integer;
begin Result:=27 end;
function TdmBase.TypeObj_AktNalichSvid : Integer;
begin Result:=28 end;
function TdmBase.TypeObj_VidGit: Integer;   // Вид на жительство
begin Result := 29; end;

// 32 .. 49 резерв

function TdmBase.TypeObj_ZAGS_AddDok: Integer;
begin begin Result:=50 end; end;
function TdmBase.TypeObj_ZAGS_SprAkt:Integer;          // справка о записи акта гр. состояния
begin Result:=51 end;
function TdmBase.TypeObj_ZAGS_SprOtsut:Integer;        // справка об отсутствии актовой записи
begin Result:=52 end;
function TdmBase.TypeObj_ZAGS_IzvOtsut:Integer;        // извещение об отсутствии актовой записи
begin Result:=53 end;
function TdmBase.TypeObj_ZAGS_ZaklChName:Integer;      // заключение о перемене имени, фамилии
begin Result:=54 end;
function TdmBase.TypeObj_ZAGS_SprBrak:Integer;         // справка о записи акта о браке
begin Result:=55 end;
function TdmBase.TypeObj_ZAGS_SprRogd:Integer;         // справка о записи акта о рождении
begin Result:=56 end;
function TdmBase.TypeObj_ZAGS_SprSmert:Integer;        // справка о записи акта о смерти
begin Result:=57 end;
function TdmBase.TypeObj_ZAGS_SprChName:Integer;        //
begin Result:=58 end;
function TdmBase.TypeObj_ZAGS_SprRast:Integer;        //
begin Result:=59 end;
function TdmBase.TypeObj_ZAGS_ZaklIzmAkt: Integer;
begin Result:=60 end;


function TdmBase.TypeObj_Spr: Integer;
begin Result := 100; end;

function TdmBase.GetLichSchet( DateFiks : TDateTime; strID : String): TDataSet;
var
  vKeyValues : Variant;
begin
  Result := nil;
  if strID<>'' then begin
    vKeyValues := VarArrayCreate( [0, 1], varOleStr );
    vKeyValues[0] := DateFiks;
    vKeyValues[1] := StrToInt(strID);
    if tbLich.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
      Result := tbLich;
    end;
  end;
end;

function TdmBase.GetLichSchetFromAdres( DateFiks : TDateTime; strIDAdres : String): TDataSet;
var
  vKeyValues : Variant;
begin
  Result := nil;
  if strIDAdres<>'' then begin
    vKeyValues := VarArrayCreate( [0, 1], varOleStr );
    vKeyValues[0] := DateFiks;
    vKeyValues[1] := StrToInt(strIDAdres);
    if tbLich.Locate('DATE_FIKS;ADRES_ID', vKeyValues, []) then begin
      Result := tbLich;
    end;
  end;
end;

function TdmBase.GetLichSchetFromAdres2( DateFiks : TDateTime; strIDAdres : String; lAddDelete : Boolean): TArrLich;
var
  n : Integer;
begin
  SetLength(Result,0);
  if strIDAdres<>'' then begin
    tbLich.IndexFieldNames:='DATE_FIKS;ADRES_ID';
    tbLich.SetRange([DateFiks,strIDAdres],[DateFiks,strIDAdres]);
    try
      while not tbLich.Eof do begin
        if lAddDelete or (tbLich.FieldByName('CANDELETE').IsNull or not tbLich.FieldByName('CANDELETE').AsBoolean) then begin
          SetLength(Result,Length(Result)+1);
          n := Length(Result)-1;
          Result[n].ID    := tbLich.FieldByName('ID').AsInteger;
          Result[n].Nomer := tbLich.FieldByName('NOMER').AsString;
          Result[n].CanDelete := tbLich.FieldByName('CANDELETE').AsBoolean;
          Result[n].Present := tbLich.FieldByName('PRESENT').AsBoolean;
          if tbLich.FieldByName('FIRST').AsString='' then begin
            Result[n].FirstID := 0;
          end else begin
            Result[n].FirstID := tbLich.FieldByName('FIRST').AsInteger;
          end;
          Result[n].AdresID := StrToInt(strIDAdres);
        end;
        tbLich.Next;
      end;
    finally
      tbLich.CancelRange;
    end;
  end;
end;

function TdmBase.GetIDLichSchetFromAdres( DateFiks : TDateTime; strIDAdres : String): String;
var
  vKeyValues : Variant;
begin
  Result := '';
  if strIDAdres<>'' then begin
    vKeyValues := VarArrayCreate( [0, 1], varOleStr );
    vKeyValues[0] := DateFiks;
    vKeyValues[1] := StrToInt(strIDAdres);
    if tbLich.Locate('DATE_FIKS;ADRES_ID', vKeyValues, []) then begin
      Result := tbLich.FieldByName('ID').AsString;
    end;
  end;
end;
//-----------------------------------------------------------------------
function TdmBase.GetMen( DateFiks : TDateTime; strID : String): TDataSet;
begin
  Result := nil;
  if strID<>'' then begin
    if (tbMens.FieldByName('DATE_FIKS').AsDateTime=DateFiks) and
       (tbMens.FieldByName('ID').AsString=strID) then begin
       Result:=tbMens;
    end else begin
      tbMens.CancelRange;
      if tbMens.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,StrToInt(strID)]), []) then begin
        Result := tbMens;
      end;
    end;
  end;
end;
//-----------------------------------------------------------------------
function TdmBase.GetMenIN( DateFiks : TDateTime; strIN : String): TDataSet;
begin
  Result := nil;
  if strIN<>'' then begin
    if tbMens.Locate('DATE_FIKS;LICH_NOMER', VarArrayOf([DateFiks,strIN]), []) then begin
      Result:=tbMens;
    end;
  end;
end;
//------------------------------------------------------------------------
function TdmBase.CountMens( DateFiks : TDateTime; strLicID : String): Integer;
begin
  Result := 0;
  if strLicID<>'' then begin
    tbMens.CancelRange;
    tbMens.IndexName := 'LIC_KEY';
    try
      tbMens.SetRange([DateFiks,strLicID],[DateFiks,strLicID]);
      while not tbMens.Eof do begin
        if ( tbMens.FieldByName('CANDELETE').IsNull or
             not tbMens.FieldByName('CANDELETE').AsBoolean) then begin
          Inc(Result,1);
        end;
        tbMens.Next;
      end;
    finally
      tbMens.CancelRange;
    end;
  end;
end;

//----------------------------------------------------------
//  strType[1]- Присутствующие
//     0 Неважно
//     1 Присутствующие
//     2 Временно отсутствующие
//  strType[2]- Дата прописки
//     0 Неважно
//     1 Заполнена
//     2 Пустая
//  strType[3]- Зарегистрирован на территории сельского совета
//     0 Неважно
//     1 Зарегистрирован
//     2 Не зарегистрирован
//   если есть ';'  то есть ограничение по возрасту
function TdmBase.CountMensEx( DateFiks : TDateTime; strLicID : String; strType : String; slPar:TStringList): Integer;
var
  c1,c2,c3 : Char;
  lOk1,lOk2,lOk3,lVozr,lOk : Boolean;
  n,i,j:Integer;
  nTrud,nVozr1,nVozr2,nVozr:Integer;
  strIDAdres,s,ss:String;
  slParOwners:TStringList;
begin
  Result := 0;
  if strLicID<>'' then begin
    lVozr:=false;
    nVozr1:=-1;
    nVozr2:=-1;
    nTrud:=-1;      
    strIdAdres:='';
    if slPar<>nil then begin
      for i:=0 to slPar.Count-1 do begin
        if Copy(slPar.Names[i],1,5)='ADRES' then begin
          strIdAdres:=slPar.ValueFromIndex[i];
        end;
      end;
    end;
    tbMens.CancelRange;
    tbMens.IndexName := 'LIC_KEY';
    try
      i:=Pos(';',strType);
      if i>0 then begin  // передан возраст: 000;0#18
        s:=Copy(strType,i+1,Length(strType));
        strType:=Copy(strType,1,i-1);
        if s<>'' then begin
          lVozr:=true;
          j:=Pos('#',s);
          if j=0 then begin
            if Copy(s,1,4)='TRUD' then begin    //   0-младше труд  1-труд  2-старше труд  3-не трудосп
              nTrud:=StrToIntDef(Copy(s,5,1),2);
              nVozr1:=999;
            end else begin
              nVozr1:=StrToInt(s);
            end;
          end else begin
            ss:=Trim(Copy(s,1,j-1));
            if ss<>''
              then nVozr1:=StrToInt(ss);
            ss:=Trim(Copy(s,j+1,100));
            if ss<>''
              then nVozr2:=StrToInt(ss);
          end;
        end;
      end;
      c1 := strType[1];
      c2 := strType[2];
      c3 := strType[3];
      tbMens.SetRange([DateFiks,strLicID],[DateFiks,strLicID]);
      while not tbMens.Eof do begin
        if ( tbMens.FieldByName('CANDELETE').IsNull or
             not tbMens.FieldByName('CANDELETE').AsBoolean) then begin

          //---------------------------------------------------------
          // проверить зарегистрирован-ли собственник на лицевом счете
          if strIDAdres<>'' then begin
            slParOwners:=TStringList.Create;
            slParOwners.Add('MEN_ID='+tbMens.FieldByName('ID').AsString);
            HouseOwners(DateFiks, strIdAdres, nil, 2, nil, nil, slParOwners);
            if slParOwners.IndexOf('MEN_ID_FIND=1')>-1
              then slPar.Add('SOBSTV=1');
            slParOwners.Free;
          end;
          //---------------------------------------------------------

          lOk1 := false;
          lOk2 := false;
          lOk3 := false;
          if (c1='0') or
             ((c1='1') and tbMens.FieldByName('PRESENT').AsBoolean) or
             ((c1='2') and not tbMens.FieldByName('PRESENT').AsBoolean)
            then lOk1 := true;
          if (c2='0') or
             ((c2='1') and (tbMens.FieldByName('DATEP').AsString<>'') ) or
             ((c2='2') and (tbMens.FieldByName('DATEP').AsString='') )
            then lOk2 := true;
          if (c3='0') or
             ((c3='1') and (tbMens.FieldByName('PROPIS').AsBoolean=true) ) or
             ((c3='2') and (tbMens.FieldByName('PROPIS').AsBoolean=false) )
            then lOk3 := true;
          if lOk1 and lOk2 and lOk3 then begin
            if lVozr then begin
              lOk:=false;
              if not tbMens.FieldByName('DATER').IsNull then begin
                if nTrud>-1 then begin
                  n:=Trud(GetCurDate,tbMens.FieldByName('DATER').AsDateTime, tbMens.FieldByName('POL').AsString);
                  if nTrud=3 then begin
                    lOk:=((n=0) or (n=2));    // нетрудоспособ.
                  end else begin
                    lOk:=(n=nTrud);
                  end;
                end else begin
                  nVozr:=GetCountYear(GetCurDate,tbMens.FieldByName('DATER').AsDateTime);
                  if nVozr1=-1 then begin
                    if (nVozr>=0) and (nVozr<=nVozr2) then lOk := true;
                  end else if nVozr2=-1 then begin
                    if (nVozr>=nVozr1) then lOk := true;
                  end else begin
                    if (nVozr>=nVozr1) and (nVozr<=nVozr2) then lOk := true;
                  end;
                end;
                if lOk then begin
                  Inc(Result,1);
                end;
              end;
            end else begin
              Inc(Result,1);
            end;
          end;
        end;
        tbMens.Next;
      end;
    finally
      tbMens.CancelRange;
    end;
  end;
end;

// strType    см. выше  CountMensEx
// strParAdd ';ALL;FIRST;OTN;;DATER;DATEP;IN;PASP;LGOT;'
//------------------------------------------------------------------------------------------------------------
function TdmBase.ListMensLic(strLicID:String; nIDFirst:Integer; strType:String; strParAdd:String; strDelim:String; dsList:TDataSet):String;
var
  c1,c2,c3 : Char;
  lOk1,lOk2,lOk3,lOk,lVozr : Boolean;
  n,nTrud,nVozr,nVozr1,nVozr2,i,j:Integer;
  s,ss : String;
  p:TPassport;
begin
  s:='';
  if strLicID<>'' then begin
    tbMens.CancelRange;
    tbMens.IndexName := 'LIC_KEY';
    try
      c1 := strType[1];
      c2 := strType[2];
      c3 := strType[3];

      lVozr:=false;
      nVozr1:=-1;
      nVozr2:=-1;
      nTrud:=-1;
      i:=Pos(';',strType);
      if i>0 then begin  // передан возраст:  000;0#18  или  000;TRUD0(1,2,3)
        s:=Copy(strType,i+1,Length(strType));
        strType:=Copy(strType,1,i-1);
        if s<>'' then begin
          lVozr:=true;
          j:=Pos('#',s);
          if j=0 then begin
            if Copy(s,1,4)='TRUD' then begin    //   0-младше труд  1-труд  2-старше труд  3-не трудосп
              nTrud:=StrToIntDef(Copy(s,5,1),2);
              nVozr1:=999;
            end else begin
              nVozr1:=StrToInt(s);
            end;
          end else begin
            ss:=Trim(Copy(s,1,j-1));
            if ss<>''
              then nVozr1:=StrToInt(ss);
            ss:=Trim(Copy(s,j+1,100));
            if ss<>''
              then nVozr2:=StrToInt(ss);
          end;
        end;
      end;
      s:='';
      // !!! будет включать в список людей всех !!!
      if Pos(';ALL;', strParAdd)>0
        then lVozr:=false;
      //-------------------------------------------
//        lOk:=false;
      tbMens.SetRange([fmMain.DateFiks,strLicID],[fmMain.DateFiks,strLicID]);
      while not tbMens.Eof do begin
        if (tbMens.FieldByName('CANDELETE').IsNull or not tbMens.FieldByName('CANDELETE').AsBoolean) and
           ( (Pos(';FIRST;', strParAdd)>0) or (nIDFirst<>tbMens.FieldByName('ID').AsInteger)) then begin
          lOk :=false;
          lOk1:=false;
          lOk2:=false;
          lOk3:=false;

          if (c1='0') or ((c1='1') and tbMens.FieldByName('PRESENT').AsBoolean) or
             ((c1='2') and not tbMens.FieldByName('PRESENT').AsBoolean)
            then lOk1 := true;

          if (c2='0') or ((c2='1') and (tbMens.FieldByName('DATEP').AsString<>'')) or
             ((c2='2') and (tbMens.FieldByName('DATEP').AsString=''))
            then lOk2 := true;

          if (c3='0') or ((c3='1') and (tbMens.FieldByName('PROPIS').AsBoolean=true)) or
             ((c3='2') and (tbMens.FieldByName('PROPIS').AsBoolean=false))
            then lOk3 := true;

          if lOk1 and lOk2 and lOk3 then begin
            if lVozr then begin
              lOk:=false;
              if not tbMens.FieldByName('DATER').IsNull then begin
                if nTrud>-1 then begin
                  n:=Trud(GetCurDate,tbMens.FieldByName('DATER').AsDateTime, tbMens.FieldByName('POL').AsString);
                  if nTrud=3 then begin
                    lOk:=((n=0) or (n=2));    // нетрудоспособ.
                  end else begin
                    lOk:=(n=nTrud);
                  end;
                end else begin
                  nVozr:=GetCountYear(GetCurDate,tbMens.FieldByName('DATER').AsDateTime);
                  if nVozr1=-1 then begin
                    if (nVozr>=0) and (nVozr<=nVozr2) then lOk := true;
                  end else if nVozr2=-1 then begin
                    if (nVozr>=nVozr1) then lOk := true;
                  end else begin
                    if (nVozr>=nVozr1) and (nVozr<=nVozr2) then lOk := true;
                  end;
                end;
              end;
            end else begin
              lOk:=true;
            end;
          end;
          if lOk then begin
            if (Pos(';OTN;', strParAdd)>0) and (tbMens.FieldByName('OTNOSH').AsString<>'') then begin
              if SprOtnosh.Locate('ID', tbMens.FieldByName('OTNOSH').AsString,[])
                then ss := ANSILowerCase(SprOtnosh.FieldByName('NAME').AsString)+' '
                else ss := '';
            end else begin
              ss := '';
            end;
            s := s + ss+tbMens.FieldByName('FAMILIA').AsString+' '+
                     tbMens.FieldByName('NAME').AsString+' '+
                     tbMens.FieldByName('OTCH').AsString;//', ';
            if (Pos(';DATER;', strParAdd)>0) and (tbMens.FieldByName('DATER').AsString<>'') then begin
               s := s + ' ' + FormatDateTime('dd.mm.yyyy',tbMens.FieldByName('DATER').AsDateTime)+'';
            end;
            if (Pos(';YEARR;', strParAdd)>0) and (tbMens.FieldByName('DATER').AsString<>'') then begin
               s := s + ' ' + FormatDateTime('yyyy',tbMens.FieldByName('DATER').AsDateTime)+'г.р.';
            end;
            if (Pos(';DATEP;', strParAdd)>0) and (tbMens.FieldByName('DATEP').AsString<>'') then begin
               s := s + ' ' + FormatDateTime('dd.mm.yyyy',tbMens.FieldByName('DATEP').AsDateTime);
            end;
            if (Pos(';IN;', strParAdd)>0) and (tbMens.FieldByName('LICH_NOMER').AsString<>'') then begin
               s := s + ' ' + tbMens.FieldByName('LICH_NOMER').AsString;
            end;
            if (Pos(';PASP;', strParAdd)>0) and (tbMens.FieldByName('PASP_NOMER').AsString<>'') then begin
               p:=PasportMen(tbMens.FieldByName('DATE_FIKS').AsDateTime,tbMens.FieldByName('ID').AsString);
               s:=s+' '+PasportToText(p,0);
            end;
            if (Pos(';LGOT;', strParAdd)>0) then begin
               s := s+ ' ' + LgotMen(dmBase.tbMensLgot, fmMain.DateFiks, tbMens.FieldByName('ID').AsString, ', ');
            end;
            s:=s+strDelim;
          end;
        end;
        tbMens.Next;
      end;
    finally
      tbMens.CancelRange;
    end;
  end;
  if s<>'' then s:=Copy(s,1,Length(s)-Length(strDelim));
  Result:=s;
end;
//----------------------------------------------------------
function TdmBase.CountMens2Where(DateFiks : TDateTime; nType:Integer; strType : String; slPar:TStringList): String;
var
  c1,c2,c3 : Char;
  nTrud,j,i,nVozr1,nVozr2:Integer;
  s,ss,sAl:String;
begin
  nVozr1:=-1;
  nVozr2:=-1;
  nTrud:=-1;
  sAl:='';
  if nType=0 then begin // из адресной книги
    c1:=strType[1];     //        present
    c2:=strType[2];     //        propis
    c3:='0';            //        datepropis
  end else begin        // из алфавитной книги
    c1:=strType[1];     //        present
    c2:=strType[3];     // !!!    propis
    c3:=strType[2];     // !!!    datepropis
  end;                 
  if slPar<>nil then begin
    for i:=0 to slPar.Count-1 do begin
      //------ ограничение по возрасту ------------------
      if slPar.Names[i]='VOZR' then begin
        s:=slPar.ValueFromIndex[i];
        j:=Pos('-',s);
        if j=0 then begin
          if Copy(s,1,4)='TRUD' then begin    //   0-младше труд  1-труд  2-старше труд  3-не трудосп
            nTrud:=StrToIntDef(Copy(s,5,1),2);
            nVozr1:=999;
          end else begin
            nVozr1:=StrToInt(s);
            nVozr2:=StrToInt(s);
          end;
        end else begin
          ss:=Copy(s,1,j-1);
          if ss<>'' then nVozr1:=StrToInt(ss);
          ss:=Copy(s,j+1,100);
          if ss<>'' then nVozr2:=StrToInt(ss);
        end;
      end else if slPar.Names[i]='ALIAS' then begin
        sAl:=slPar.ValueFromIndex[i]+'.';
      end;
    end;
  end;
  if nVozr2=9999
    then nVozr2:=0;
  Result:=sAl+'date_fiks='+QStr(DTOS(DateFiks,tdAds))+' and '+sAl+'candelete=false';
  if c1<>'0' then begin
    if c1='1' then Result:=Result+' and '+sAl+'present=true'
              else Result:=Result+' and '+sAl+'present=false';
  end;
  if c2<>'0' then begin
    if c2='1' then Result:=Result+' and '+sAl+'propis=true'
              else Result:=Result+' and '+sAl+'propis=false';
  end;
  if c3<>'0' then begin
    if c3='1' then Result:=Result+' and '+sAl+'datep is not null'
              else Result:=Result+' and '+sAl+'datep is null';
  end;
  if (nVozr1>-1) or (nVozr2>-1) then begin
    if nTrud>-1 then begin
      if nTrud<3 then begin
        Result:=Result+' and trud(CURDATE(),'+sAl+'dater,'+sAl+'pol)='+IntToStr(nTrud);
      end else begin
        Result:=Result+' and trud(CURDATE(),'+sAl+'dater,'+sAl+'pol)=0 or trud(CURDATE(),'+sAl+'dater,'+sAl+'pol)=2';  // нетрудоспособный возраст
      end;
    end else if (nVozr1=nVozr2) then begin
      Result:=Result+' and getVozrast(CURDATE(),'+sAl+'dater)='+IntToStr(nVozr1);
    end else if (nVozr1>-1) and (nVozr2>-1) and (nVozr1<=nVozr2) then begin
      Result:=Result+' and (getVozrast(CURDATE(),'+sAl+'dater)>='+IntToStr(nVozr1)+' and getVozrast(CURDATE(),'+sAl+'dater)<='+IntToStr(nVozr2)+')';
    end else if (nVozr1>-1) then begin
      Result:=Result+' and getVozrast(CURDATE(),'+sAl+'dater)>='+IntToStr(nVozr1);
    end else begin
      Result:=Result+' and getVozrast(CURDATE(),'+sAl+'dater)<='+IntToStr(nVozr2);
    end;
  end;
end;

//----------------------------------------------------------
//  strType[1]- Присутствующие
//     0 Неважно
//     1 Присутствующие
//     2 Временно отсутствующие
//  strType[2]- Дата прописки
//     0 Неважно
//     1 Заполнена
//     2 Пустая
function TdmBase.CountMensAdres( DateFiks : TDateTime; strAdresID : String; strType : String; slPar:TStringList): Integer;
var
  c1,c2 : Char;
  lOk1,lOk2,lOk : Boolean;
  nVozr,nVozr1,nVozr2:Integer;
  i,j:Integer;
  s:String;
begin
  Result := 0;
//  lIsSobst:=false;
  if strAdresID<>'' then begin
    tbMens.CancelRange;
    tbMens.IndexName := 'ADRES_KEY';
    nVozr1:=-1;
    nVozr2:=-1;
    if slPar<>nil then begin
      for i:=0 to slPar.Count-1 do begin
        //------ ограничение по возрасту ------------------
        if slPar.Names[i]='VOZR' then begin
          s:=slPar.ValueFromIndex[i];
          j:=Pos('-',s);
          if j=0 then begin
            nVozr1:=StrToInt(s);
            nVozr2:=StrToInt(s);
          end else begin
            nVozr1:=StrToInt(Copy(s,1,j-1));
            nVozr2:=StrToInt(Copy(s,j+1,100));
          end;
        end else if Copy(slPar.Names[i],1,4)='SOBS' then begin
//          lIsSobst:=true;

        end;
      end;
    end;
    try
      c1 := strType[1];
      c2 := strType[2];
      tbMens.SetRange([DateFiks,strAdresID],[DateFiks,strAdresID]);
      while not tbMens.Eof do begin
        if ( tbMens.FieldByName('CANDELETE').IsNull or
             not tbMens.FieldByName('CANDELETE').AsBoolean) then begin
          lOk1 := false;
          lOk2 := false;
          if (c1='0') or
             ((c1='1') and tbMens.FieldByName('PRESENT').AsBoolean) or
             ((c1='2') and not tbMens.FieldByName('PRESENT').AsBoolean)
            then lOk1 := true;
          if (c2='0') or
             ((c2='1') and (tbMens.FieldByName('DATEP').AsString<>'') ) or
             ((c1='2') and (tbMens.FieldByName('DATEP').AsString='') )
            then lOk2 := true;
          if lOk1 and lOk2 then begin
            lOk:=false;
            if nVozr1>-1 then begin
              nVozr:=GetCountYearEx(dmBase.GetCurDate,tbMens.FieldByName('DATER'),99);
              if (nVozr>=nVozr1) and (nVozr<=nVozr2) then begin
                lOk:=true;
              end;
            end else begin
              lOk:=true;
            end;
            if lOk then
              Inc(Result,1);
          end;
        end;
        tbMens.Next;
      end;
    finally
      tbMens.CancelRange;
    end;
  end;
end;

function TdmBase.CountMensAdresNotRegistred( DateFiks : TDateTime; strAdresID : String): Integer;
begin
  Result := 0;
  if strAdresID<>'' then begin
    tbMens.CancelRange;
    tbMens.IndexName := 'ADRES_KEY';
    try
      tbMens.SetRange([DateFiks,strAdresID],[DateFiks,strAdresID]);
      while not tbMens.Eof do begin
        if ( tbMens.FieldByName('CANDELETE').IsNull or
           not tbMens.FieldByName('CANDELETE').AsBoolean) then begin
             if tbMens.FieldByName('PRESENT').AsBoolean and
                not tbMens.FieldByName('PROPIS').AsBoolean
               then Inc(Result,1);
        end;
        tbMens.Next;
      end;
    finally
      tbMens.CancelRange;
    end;
  end;
end;

function TdmBase.IDNewFirstMen( DateFiks : TDateTime; strLicID : String): Integer;
begin
  Result := 0;
  if strLicID<>'' then begin
    tbMens.CancelRange;
    tbMens.IndexName := 'LIC_KEY';
    try
      tbMens.SetRange([DateFiks,strLicID],[DateFiks,strLicID]);
      while not tbMens.Eof do begin
        if (tbMens.FieldByName('CANDELETE').IsNull or not tbMens.FieldByName('CANDELETE').AsBoolean) and
           (tbMens.FieldByName('NOMER_SEM').IsNull or (tbMens.FieldByName('NOMER_SEM').AsInteger=0)) then begin
          Result := tbMens.FieldByName('ID').AsInteger;
          break;
        end;
        tbMens.Next;
      end;
    finally
      tbMens.CancelRange;
    end;
  end;
end;

// выбрать человека с лицевого счета
function TdmBase.ChoiceMenLic(DateFiks : TDateTime; strLicID : String; TypeChoice : TTypeChoiceMen; strNotID : String; strCaption : String ): Integer;
var
  d : TDateTime;
  i : Integer;
  s,ss : String;
  sl : TStringList;
  slID : TStringList;
  st : TSostTable;
begin
  if strNotID='' then strNotID:='-;' else strNotID:=strNotID+';';
  if strCaption='' then strCaption:='Выберите человека';
  Result := 0;
  d := DateFiks;
  i := StrToInt(strLicID);
  st := SaveSostTable(tbMens,true,true);
  tbMens.CancelRange;
  try
    tbMens.IndexFieldNames := 'DATE_FIKS;LIC_ID;NSTR';
    tbMens.SetRange([d,i],[d,i]);
    if not tbMens.Eof then begin
      sl   := TStringList.Create;
      slID := TStringList.Create;
      while not tbMens.Eof do begin
//      cmAll, cmPresent
        if (Pos(tbMens.FieldByName('ID').AsString+';', strNotID)=0) and
           (
           (TypeChoice=cmAll) or
           ((tbMens.FieldByName('PRESENT').AsBoolean=true) and (TypeChoice=cmPresent)) or
           ((tbMens.FieldByName('CANDELETE').AsBoolean=false) and (TypeChoice=cmNotCanDelete))
           ) then begin
          s  := Trim(tbMens.FieldByName('FAMILIA').AsString);
          ss := Trim(tbMens.FieldByName('NAME').AsString);
          if ss<>'' then s := s + ' ' + ss;
          ss := Trim(tbMens.FieldByName('OTCH').AsString);
          if ss<>'' then s := s + ' ' + ss;
          if not tbMens.FieldByName('DATER').IsNull then begin
            s := s + ', ' + IntToStr(YearOf(tbMens.FieldByName('DATER').AsDateTime))+'г.р. ';
          end;
          sl.Add(' '+s);
          slID.Add(tbMens.FieldByName('ID').AsString);
        end;
        tbMens.Next;
      end;
      if sl.Count=0 then begin
        Result := 0;
//      end else if sl.Count=1 then begin
//        Result := StrToInt(slID.Strings[0]);
      end else begin
        i:=ChoiceFromList(sl, strCaption);
        if i>-1 then Result := StrToInt(slID.Strings[i]);
      end;
      sl.Free;
      slID.Free;
    end;
  finally
    tbMens.CancelRange;
    RestSostTable(tbMens,st);
  end;
end;

//------------------------------------------------------------------------------
{$IFDEF OCHERED}
function TdmBase.CheckDeleteMen(DateFiks : TDateTime; nId : Integer; var strErr : String; strFIO:String) : Boolean;
begin
  Result:=true;
end;
{$ELSE}
function TdmBase.CheckDeleteMen(DateFiks : TDateTime; nId : Integer; var strErr : String; strFIO:String) : Boolean;
begin
  strErr:='';
  Result:=true;
  if tbVUS.Active then begin
    if tbVUS.Locate('ID', nId,[]) then begin
      strErr:=strErr+'состоит на учете ВУС'+Chr(13);
    end;
  end;
  if Result then begin
    if tbOchered.Locate('ID', nId,[]) then begin
      strErr:=strErr+'присутствует в очереди на жилье'+chr(13);
    end;
  end;
  if Result then begin
    if tbSostavSem.Locate('MEMBER_ID', nId,[]) then begin
      strErr:=strErr+'присутствует в составе семьи стоящего в очереди'+chr(13);
    end;
  end;
  if Result then begin
    if tbHouseOwners.Locate('DATE_FIKS;KOD', VarArrayOf([DateFiks,nID]),[]) then begin
      strErr:=strErr+'владеет собственностью'+chr(13);
    end;
  end;
  if strErr<>'' then begin
    if strFIO='' then strFIO:=FIOMen(DateFiks, IntToStr(nID));
    strErr:=strFIO+#13+strErr;
    Result:=false;
  end;

//  {$IFDEF OBR_GRAG}
{
  if Result then begin
    if fmMain.DocRecord.CanDeleteMan(nId,strErr) then begin
      Result:=false;
    end;
  end;
 }
//  {$ENDIF}
end;
{$ENDIF}

procedure TdmBase.GetListOrganZAGS(PickList:TStrings; KeyList:TStrings; nType:Integer);
var
  lOk:Boolean;
  nID:Integer;
begin
  nID:=GlobalTask.ParamAsInteger('ID');
  PickList.Clear;
  KeyList.Clear;
  SprNames.First;
  lOk:=false;
  while not dmBase.SprNames.Eof do begin
    case nType of
      // всех
      0: lOk:=true;
      // исключить введенных вручную
      1: lOk:=(dmBase.SprNames.FieldByName('HANDLED').IsNull or (dmBase.SprNames.FieldByName('HANDLED').AsBoolean=false));
      // исключить введенных вручную и мой ЗАГС
      2: lOk:=(dmBase.SprNames.FieldByName('HANDLED').IsNull or (dmBase.SprNames.FieldByName('HANDLED').AsBoolean=false)) and (dmBase.SprNames.FieldByName('ID').AsInteger<>nID);
    end;
    if lOk then begin
      PickList.Add( dmBase.SprNames.FieldByName('NAME').AsString );
      KeyList.Add( dmBase.SprNames.FieldByName('ID').AsString );
    end;
    SprNames.Next;
  end;
  SprNames.First;
end;

//------------------------------------------------------------------------------
procedure TdmBase.WriteLogDeleteDok(ds: TDataSet; nTypeObj:Integer);
var
  s:String;
begin
  if nTypeObj=_TypeObj_AktZAH then begin
    GlobalTask.LogFile.WriteToLogFile('Удаление информации о захоронении: книга '+ds.FieldByName('BOOK').AsString+' запись №'+ds.FieldByName('NOMER').AsString+' от '+
    FormatDateTime('dd.mm.yyyy',ds.FieldByName('DATEZ').AsDateTime)+'  ИН:'+ds.FieldByName('LICH_NOMER').AsString);
  end else begin
    if (ds.FindField('NOMER')<>nil) and (ds.FindField('DATEZ')<>nil) then begin
      s:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_FULL').Naim(nTypeObj,false);
      if s='' then begin
        s:=' документ('+TypeObj2Str(nTypeObj)+')';
      end else begin
        s:=' з/а '+s;
      end;
      GlobalTask.LogFile.WriteToLogFile('Удаление '+s+' №'+ds.FieldByName('NOMER').AsString+' от '+FormatDateTime('dd.mm.yyyy',ds.FieldByName('DATEZ').AsDateTime));
    end;
  end;
end;

//------------------------------------------------------------------------------
function TdmBase.GetDatePredZapis:TDateTime;
begin
  Result:=0;
  {$IFDEF ZAGS}
  if PredZapis.Active then begin
    with PredZapis do begin
      try
        Result:=STOD( FieldByName('GOD').AsString+PadLStr(FieldByName('MONTH').AsString,2,' ')+PadLStr(FieldByName('DAY').AsString,2,' '),tdClipper);
      except
        Result:=0;
      end;
    end;
  end;
  {$ENDIF}
end;
//-----------------------------------------------------------------------
procedure TdmBase.DateBrakToHist(nID:Integer; nNomer:Integer; dDateZ:TDateTime; dDateB:TDateTime; dTimeB:TDateTime);
begin
  tbHistoryZAGS.Append;
  tbHistoryZAGS.FieldByName('TYPEOBJ').AsInteger :=_TypeObj_DBrak;
  tbHistoryZAGS.FieldByName('ID').AsInteger := nID;
  tbHistoryZAGS.FieldByName('FIELDNAME').AsString := 'DATEB';     // 10.06.2013 12:30
  tbHistoryZAGS.FieldByName('VALUE').AsString := FormatDateTime('dd.mm.yyyy',dDateB)+' '+FormatDateTime('HH:NN',dTimeB);
  tbHistoryZAGS.FieldByName('DATEIZM').AsDateTime := Now;
  tbHistoryZAGS.FieldByName('NOMER').AsInteger := nNomer;
  tbHistoryZAGS.FieldByName('DATEZ').AsDateTime:=dDateZ;
  tbHistoryZAGS.FieldByName('TYPEDATE').AsInteger := 999;
  tbHistoryZAGS.FieldByName('DATEPROPIS').AsString := '3';
  tbHistoryZAGS.FieldByName('INFO').AsString := '';
  tbHistoryZAGS.Post;
end;
//-----------------------------------------------------------------------
procedure TdmBase.DateRastToHist(nID:Integer; nNomer:Integer; dDateZ:TDateTime; dDateB:TDateTime; dTimeB:TDateTime);
begin
  tbHistoryZAGS.Append;
  tbHistoryZAGS.FieldByName('TYPEOBJ').AsInteger :=_TypeObj_DRast;
  tbHistoryZAGS.FieldByName('ID').AsInteger := nID;
  tbHistoryZAGS.FieldByName('FIELDNAME').AsString := 'DATEB';     // 10.06.2013 12:30
  tbHistoryZAGS.FieldByName('VALUE').AsString := FormatDateTime('dd.mm.yyyy',dDateB)+' '+FormatDateTime('HH:NN',dTimeB);
  tbHistoryZAGS.FieldByName('DATEIZM').AsDateTime := Now;
  tbHistoryZAGS.FieldByName('NOMER').AsInteger := nNomer;
  tbHistoryZAGS.FieldByName('DATEZ').AsDateTime:=dDateZ;
  tbHistoryZAGS.FieldByName('TYPEDATE').AsInteger := 999;
  tbHistoryZAGS.FieldByName('DATEPROPIS').AsString := '3';
  tbHistoryZAGS.FieldByName('INFO').AsString := '';
  tbHistoryZAGS.Post;
end;
//-----------------------------------------------------------------------
procedure TdmBase.ValueToHistory(nID:Integer; nTypeObj:Integer; sField:String; vValue:Variant);
begin
  tbHistoryZAGS.Append;
  tbHistoryZAGS.FieldByName('TYPEOBJ').AsInteger:=nTypeObj;
  tbHistoryZAGS.FieldByName('ID').AsInteger:=nID;
  tbHistoryZAGS.FieldByName('FIELDNAME').AsString:=sField;
  tbHistoryZAGS.FieldByName('VALUE').AsString:=VarToStr(vValue);
  tbHistoryZAGS.FieldByName('DATEIZM').AsDateTime:=Now;
  tbHistoryZAGS.FieldByName('NOMER').AsInteger:=1;
  tbHistoryZAGS.FieldByName('DATEZ').AsDateTime:=Now;
  tbHistoryZAGS.FieldByName('TYPEDATE').AsInteger:=0;
  tbHistoryZAGS.FieldByName('DATEPROPIS').AsString:='';
  tbHistoryZAGS.FieldByName('INFO').AsString:='';
  tbHistoryZAGS.Post;
end;
//---------------------------------------------
function TdmBase.InfoForDelete(ds:TDataSet; nTypeObj:Integer; lDokZags:Boolean):String;
var
  nIdOrg:Integer;
  s:String;
begin
  if lDokZags
    then Result:='з/а №'+ds.FieldByName('NOMER').AsString+' от '+DatePropis(ds.FieldByName('DATEZ').AsDateTime,3);

  case nTypeObj of
    _TypeObj_ZRogd,
    _TypeObj_ZSmert  : Result:=Result+' '+createFIO(ds,'');
    _TypeObj_ZBrak,
    _TypeObj_ZRast   : Result:=Result+', '+createFIO(ds,'ON_')+', '+createFIO(ds,'ONA_');
    _TypeObj_ZUstOtc,
    _TypeObj_ZUstMat,
    _TypeObj_ZAdopt,
    _TypeObj_ZChName : Result:=Result+', '+createFIO(ds,'DO;E')+'-> '+createFIO(ds,'POSLE;E');

    _TypeObj_AktZAH  :  Result:='книга '+ds.FieldByName('BOOK').AsString+' запись №'+ds.FieldByName('NOMER').AsString+' от '+
       DatePropis(ds.FieldByName('DATEZ').AsDateTime,3)+'  ИН:'+ds.FieldByName('LICH_NOMER').AsString+
      ' дата захор. '+DatePropis(ds.FieldByName('DATEZH').AsDateTime,3);

    _TypeObj_Opeka  :  Result:=SeekValueList('KEY_OPEKA_VID', ds.FieldByName('VID').AsString, false)+' '+createFIO(ds,'')+
       '  ИН:'+ds.FieldByName('IDENTIF').AsString+' уст.:'+DatePropis(ds.FieldByName('DATEZ').AsDateTime,3)+' отм.:'+DatePropis(ds.FieldByName('DATE_OTM').AsDateTime,3);
  end;
  {$IFDEF ZAGS}
  if lDokZags then begin
    nIdOrg:=ds.FieldByName('ID_ZAGS').AsInteger;
    if SprNames.Locate('ID', nIdOrg, [])
      then s:=SprNames.FieldByName('NAME').AsString+' ('+IntToStr(nIdOrg)+')'
      else s:='орган ЗАГС:'+IntToStr(nIdOrg);
    Result:=Result+', '+s;
  end;
  {$ENDIF}
end;
//------------------------------------------------------------------------------
function TdmBase.DeleteDokument(ds: TDataSet; nTypeObj: Integer; lIgnoreCheck:Boolean) : Boolean;
var
  sKomm,sID:String;
  dFiks:TDateTime;
  {$IFDEF SMDO}
    sAdd,sMsgID:String;
  {$ENDIF}
//  nIDZags:Integer;
  fldID:TField;
  function SeekID(tb:TDataSet):Boolean;
  begin
    if (sID=tb.FieldByName('ID').AsString) or tb.Locate('ID', sID, [])
      then Result:=true
      else Result:=false;
  end;
begin
  LastErrorDelete:='';
  Result:=true;
  fldID:=ds.FindField('ID');
  if fldID<>nil
    then sID:=fldID.AsString
    else sID:='';
  //------- !!! ----------------------
  if sID='' then begin
    Result:=false;
    exit;
  end;
  //------- !!! ----------------------
  if nTypeObj = TypeObj_Lich then begin
    Result:=DeleteLich( ds.FieldByName('DATE_FIKS').AsDateTime, sID);
  end else if nTypeObj = TypeObj_Nasel then begin
    if ds.FindField('GURNAL_OCH')<>nil then begin   // из журнала "Очередь"
      {$IFDEF OCHERED}
        // для программы "очередники" необходимо полностью удалять человека
        Result:=DeleteMen( ds.FieldByName('DATE_FIKS').AsDateTime, sID, true);
      {$ELSE}
        Result:=DeleteOch( ds.FieldByName('DATE_FIKS').AsDateTime, sID);
      {$ENDIF}
    end else if  ds.FindField('GURNAL_VUS')<>nil then begin   // из журнала "ВУС"
      Result:=DeleteVUS( ds.FieldByName('DATE_FIKS').AsDateTime, sID);
    end else begin
      Result:=DeleteMen( ds.FieldByName('DATE_FIKS').AsDateTime, sID, true, lIgnoreCheck);
    end;
  end else if nTypeObj = TypeObj_Adres then begin
    Result:=DeleteAdres( ds.FieldByName('DATE_FIKS').AsDateTime, sID);
  end else if nTypeObj = TypeObj_Passport then begin
    dFiks:=ds.FieldByName('DATE_ZAPOLN').AsDateTime;
    while tbPaspChildren.Locate('ID', sID, []) do
      tbPaspChildren.Delete;
    while tbPaspOsnov.Locate('ID', sID, []) do
      tbPaspOsnov.Delete;
    if tbPassports.Locate('ID', sID, []) then
      tbPassports.Delete;
    AppendToDelObj(dFiks, sID, TypeObj_Passport);
  end else if (nTypeObj=_TypeObj_SMDOPost) or (nTypeObj=_TypeObj_SMDOPostDoc) or (nTypeObj=_TypeObj_SMDOPostUvd) then begin
    {$IFDEF SMDO}
      sMsgID:=Trim(ds.FieldByName('MSG_ID').AsString);
      dFiks:=ds.FieldByName('DATEPOST').AsDateTime;
      // SUBJ_TYPE(1-вх.,2)  SMDOCODE   SUBJECT   ADR_REGNUMBER ADR_REGDATE MY_REGNUMBER MY_REGDATE

      if ds.FieldByName('SUBJ_TYPE').AsInteger=SUBJ_IN
        then sKomm:='Вх. № '+ds.FieldByName('ADR_REGNUMBER').AsString+' '+DatePropis(ds.FieldByName('ADR_REGDATE').AsDateTime,3)+' от '
        else sKomm:='Исх. № '+ds.FieldByName('MY_REGNUMBER').AsString+' '+DatePropis(ds.FieldByName('MY_REGDATE').AsDateTime,3)+' на ';
      sKomm:=sKomm+ds.FieldByName('SMDOCODE').AsString;

      if sMsgID='' then begin
        sAdd:='DELETE FROM SMDOPost WHERE id='+sID+';';
      end else begin
        sAdd:='DELETE FROM SMDOPost WHERE id='+sID+';'+
              'DELETE FROM SMDOPost WHERE ack_msg_id='+QStr(sMsgID)+' and msg_type=0;'  // !!! + все уведомления сообщения !!!
      end;
      try
        AdsConnection.Execute(
          'DELETE FROM SMDOTask WHERE post_id='+sID+';'+
          'DELETE FROM SMDOMens WHERE post_id='+sID+';'+
          'DELETE FROM SMDOFile WHERE post_id='+sID+';'+
          'DELETE FROM BaseProp WHERE typeobj='+IntToStr(nTypeObj)+' and id='+sID+';'+
          'DELETE FROM BaseTextProp WHERE typeobj='+IntToStr(nTypeObj)+' and id='+sID+';'+
          sAdd
        );
      except
        on E:Exception do begin
          Result := false;
          sKomm:='Ошибка удаления сообщения:'+sKomm+' >>'+E.Message;
          GlobalTask.LogFile.WriteToLogFile(sKomm);
        end;
      end;
      AppendToDelObjEx(_TypeObj_SMDOPost, sID, dFiks, -1, sKomm);
//        SMDO.WriteTextLog('Удаление сообщения "'+sMsgID+'" '+ds.FieldByName('SUBJECT').AsString+', дата получения(отправки) '+FormatDateTime('dd.mm.yyyy hh:nn',ds.FieldByName('DATEPOST').AsDateTime));
//          'UPDATE DocMain SET POST_ID=0 WHERE POST_ID='+sID+';'+ // !!! почистим ссылки на сообщение в подсистеме входящих (исходящих)
//        DeletePropSimpleDok(sID, _TypeObj_SMDOPost);

      // удаляем прикрепленные файлы если нет ссылок на подсистему "входящих документов"
      if Result and not DocMain.Locate('POST_ID', StrToInt(sID), []) then begin
        ClearDir(SMDO.GetPathAttach(0,StrToInt(sID)),true);  // ??? !!!  удалять или нет прикрепленные файлы !!!
      end;
    {$ENDIF SMDO}
        {
        AdsConnection.Execute(
          'DELETE FROM Временная;'+
          'INSERT INTO Временная (ID) SELECT TASK_ID FROM SMDOTask WHERE post_id='+sID+';'+
          'DELETE FROM SMDOTask WHERE post_id='+sID+';'+
          'DELETE FROM SMDOMens WHERE task_id in (SELECT id FROM Временная);'+
          'DELETE FROM SMDOFile WHERE task_id in (SELECT id FROM Временная);'+
          'DELETE FROM SMDOPost WHERE id='+sID+';'
        );
        }
  end else if nTypeObj = TypeObj_VidGit then begin
    dFiks:=ds.FieldByName('DATE_ZAPOLN').AsDateTime;
    while tbPaspChildren.Locate('ID', sID, []) do
      tbPaspChildren.Delete;
    while tbPaspOsnov.Locate('ID', sID, []) do
      tbPaspOsnov.Delete;
    if tbPassports.Locate('ID', sID, []) then
      tbPassports.Delete;
    AppendToDelObj(dFiks, sID, TypeObj_VidGit);
  end else if nTypeObj = TypeObj_PassportViza then begin
//      if tbPasportViza.Locate('ID', ds.FieldByName('ID').AsInteger, []) then
//        tbPasportViza.Delete;
  end else if nTypeObj = _TypeObj_AktZAH then begin
    {$IFDEF ADD_ZAH}
      if SeekID(AktZ) then begin
        dFiks:=ds.FieldByName('DATEZ').AsDateTime;
        sKomm:=InfoForDelete(AktZ, _TypeObj_AktZAH, false);
        AktZ.Delete;
        DeletePropSimpleDok(sID, _TypeObj_AktZAH);
        AppendToDelObjEx(_TypeObj_AktZAH, sID, dFiks, -1, sKomm);
      end;
    {$ENDIF}
  end else if nTypeObj = _TypeObj_Opeka then begin
    {$IFDEF ADD_OPEKA}
      if SeekID(tbZapisOpeka) then begin
        dFiks:=tbZapisOpeka.FieldByName('DATEZ').AsDateTime;
        sKomm:=InfoForDelete(tbZapisOpeka, _TypeObj_Opeka, false);
        tbZapisOpeka.Delete;
        DeletePropSimpleDok(sID, _TypeObj_Opeka);
        AppendToDelObjEx(_TypeObj_Opeka, sID, dFiks, -1, sKomm);
      end;
    {$ENDIF}
  end else if nTypeObj = TypeObj_DBrak then begin
    {$IFDEF ZAGS}
    if PredZapis.Active and PredZapis.Locate('TYPEOBJ;DECL_ID', VarArrayOf([_TypeObj_ZBrak, ds.FieldByName('ID').AsInteger]), []) then begin
      if not dmBase.PredZapis.FieldByName('OTKAZ').AsBoolean then begin
        dmBase.PredZapis.Delete;
//          ShowMessage('В графике предварительной записи время освобождено.');
//          dmBase.PredZapis.Edit;
//          dmBase.PredZapis.FieldByName('OTKAZ').AsBoolean:=true;
//          dmBase.PredZapis.FieldByName('DECL_ID').AsString:='';
//          dmBase.PredZapis.Post;
      end;
    end;
    {$ENDIF}
    if Result then begin
      if tbDeclBrak.Locate('ID', ds.FieldByName('ID').AsInteger, []) then
        tbDeclBrak.Delete;
      DeletePropSimpleDok(sID, TypeObj_DBrak);
      AppendToDelObj(ds.FieldByName('DATEZ').AsDateTime, sID, TypeObj_DBrak);
    end;
  end else if nTypeObj = TypeObj_DRast then begin
    {$IFDEF ZAGS}
      if PredZapis.Active and PredZapis.Locate('TYPEOBJ;DECL_ID', VarArrayOf([_TypeObj_ZRast, StrToInt(sID)]), []) then begin
        if not dmBase.PredZapis.FieldByName('OTKAZ').AsBoolean then begin
          dmBase.PredZapis.Delete;
//          ShowMessage('В графике предварительной записи время освобождено.');
//          dmBase.PredZapis.Edit;
//          dmBase.PredZapis.FieldByName('OTKAZ').AsBoolean:=true;
//          dmBase.PredZapis.FieldByName('DECL_ID').AsString:='';
//          dmBase.PredZapis.Post;
        end;
      end;
      if DeclareTermMarriage.Locate('ID', StrToInt(sID), [])
        then DeclareTermMarriage.Delete;
      DeletePropSimpleDok(sID, TypeObj_DRast);
      AppendToDelObj(ds.FieldByName('DATEZ').AsDateTime,sID, TypeObj_DRast);
    {$ENDIF}
  end else if nTypeObj = TypeObj_ZBrak then begin
    if SeekID(tbZapisBrak) then begin
      sKomm:=InfoForDelete(tbZapisBrak, _TypeObj_ZBrak, true);
      tbZapisBrak.Delete;
      DeletePropSimpleDok(sID, _TypeObj_ZBrak);
      AppendToDelObjEx(_TypeObj_ZBrak, sID, ds.FieldByName('DATEZ').AsDateTime, -1, sKomm);
    end;
  end else if nTypeObj = TypeObj_ZRogd then begin
    if SeekID(tbZapisRogd) then begin
      sKomm:=InfoForDelete(tbZapisRogd, _TypeObj_ZRogd, true);
      tbZapisRogd.Delete;
      DeletePropSimpleDok(sID, TypeObj_ZRogd);
      AppendToDelObjEx(_TypeObj_ZRogd, sID, ds.FieldByName('DATEZ').AsDateTime, -1, sKomm);
    end;
  end else if nTypeObj = TypeObj_ZSmert then begin
    if SeekID(tbZapisSmert) then begin
      sKomm:=InfoForDelete(tbZapisSmert, _TypeObj_ZSmert, true);
      tbZapisSmert.Delete;
      DeletePropSimpleDok(sID, TypeObj_ZSmert);
      AppendToDelObjEx(_TypeObj_ZSmert, sID, ds.FieldByName('DATEZ').AsDateTime, -1, sKomm);
    end;
  end else if nTypeObj = TypeObj_ZUstOtc then begin
    if SeekID(tbZapisUstOtc) then begin
      sKomm:=InfoForDelete(tbZapisUstOtc, _TypeObj_ZUstOtc, true);
      tbZapisUstOtc.Delete;
      DeletePropSimpleDok(sID, TypeObj_ZUstOtc);
      AppendToDelObjEx(_TypeObj_ZUstOtc, sID, ds.FieldByName('DATEZ').AsDateTime, -1, sKomm);
    end;
  end else if nTypeObj = TypeObj_ZUstMat then begin
    {$IFDEF ZAGS}
      if SeekID(tbZapisUstMat) then begin
        sKomm:=InfoForDelete(tbZapisUstMat, _TypeObj_ZUstMat, true);
        tbZapisUstMat.Delete;
        DeletePropSimpleDok(sID, _TypeObj_ZUstMat);
        AppendToDelObjEx(_TypeObj_ZUstMat, sID, ds.FieldByName('DATEZ').AsDateTime, -1, sKomm);
      end;
    {$ENDIF}
  end else if nTypeObj = TypeObj_ZAdopt then begin
    {$IFDEF ZAGS}
      if SeekID(tbZapisAdopt) then begin
        sKomm:=InfoForDelete(tbZapisAdopt, _TypeObj_ZAdopt, true);
        tbZapisAdopt.Delete;
        DeletePropSimpleDok(sID, TypeObj_ZAdopt);
        AppendToDelObjEx(_TypeObj_ZAdopt, sID, ds.FieldByName('DATEZ').AsDateTime, -1, sKomm);
      end;
    {$ENDIF}
  end else if nTypeObj = TypeObj_ZRast then begin
    {$IFDEF ZAGS}
      if SeekID(tbZapisRast) then begin
        sKomm:=InfoForDelete(tbZapisRast, _TypeObj_ZRast, true);
        tbZapisRast.Delete;
        DeletePropSimpleDok(sID, TypeObj_ZRast);
        AppendToDelObjEx(_TypeObj_ZRast, sID, ds.FieldByName('DATEZ').AsDateTime, -1, sKomm);
      end;
    {$ENDIF}
  end else if nTypeObj = TypeObj_ZChName then begin
    {$IFDEF ZAGS}
      if SeekID(tbZapisChName) then begin
        sKomm:=InfoForDelete(tbZapisChName, _TypeObj_ZChName, true);
        tbZapisChName.Delete;
        DeletePropSimpleDok(sID, TypeObj_ZChName);
        AppendToDelObjEx(_TypeObj_ZChName, sID, ds.FieldByName('DATEZ').AsDateTime, -1, sKomm);
      end;
    {$ENDIF}
  end else if nTypeObj = _TypeObj_DChName then begin
    {$IFDEF ZAGS}
      if tbDeclChName.Locate('ID', ds.FieldByName('ID').AsInteger, [])
        then tbDeclChName.Delete;
      DeletePropSimpleDok(sID, _TypeObj_DChName);
      AppendToDelObj(ds.FieldByName('DATEZ').AsDateTime,sID, _TypeObj_DChName, ds);
    {$ENDIF}
  end else if nTypeObj = _TypeObj_DIzm then begin
    {$IFDEF ZAGS}
      if tbDeclIzm.Locate('ID', StrToInt(sID), [])
        then tbDeclIzm.Delete;
      DeletePropSimpleDok(sID, _TypeObj_DIzm);
      AppendToDelObj(ds.FieldByName('DATEZ').AsDateTime, sID, _TypeObj_DIzm, ds);
    {$ENDIF}
  end else if nTypeObj = TypeObj_TalonPrib then begin
    if SeekID(tbTalonPrib) then begin
      tbTalonPrib.Delete;
      while tbTalonPribDeti.Locate('ID', StrToInt(sID), []) do
        tbTalonPribDeti.Delete;
      AppendToDelObj(ds.FieldByName('DATEZ').AsDateTime,sID, TypeObj_TalonPrib);
    end;
  end else if nTypeObj = TypeObj_TalonUbit then begin
    if SeekID(tbTalonUbit) then begin
      tbTalonUbit.Delete;
      while tbTalonUbitDeti.Locate('ID', StrToInt(sID), []) do
        tbTalonUbitDeti.Delete;
      AppendToDelObj(ds.FieldByName('DATEZ').AsDateTime,sID, TypeObj_TalonUbit);
    end;
  end else if nTypeObj = TypeObj_DeclareRegistr then begin
    if DeclareRegistr.Locate('ID', ds.FieldByName('ID').AsInteger, [])
      then DeclareRegistr.Delete;
    AppendToDelObj(ds.FieldByName('DATEZ').AsDateTime,sID, TypeObj_DeclareRegistr);
  end else if (nTypeObj>=_TypeObj_AddDokZAGS_Min) and (nTypeObj<=_TypeObj_AddDokZAGS_Max) then begin
   {$IFDEF ZAGS}
      if AddDokZAGS.Locate('ID', ds.FieldByName('ID').AsInteger, [])
        then AddDokZAGS.Delete;
      AppendToDelObj(ds.FieldByName('DATEZ').AsDateTime,sID, nTypeObj);
   {$ENDIF}
  end else if (nTypeObj>=_TypeObj_UZRogd) and (nTypeObj<=_TypeObj_UZ_Max) then begin
   {$IF Defined(ZAGS) or Defined(LAIS) }
      if GurnalRegistr.Locate('ID', ds.FieldByName('ID').AsInteger, [])
        then GurnalRegistr.Delete;
      AppendToDelObj(ds.FieldByName('DATEZ').AsDateTime,sID, nTypeObj);
   {$IFEND}
  end else if nTypeObj = TypeObj_RasxNaklSvid then begin
      // проверка доступности удаления
    AdsConnection.Execute('UPDATE ListSvid SET ID_NAKL=null WHERE ID_NAKL='+sID);
    if tbDokuments.Locate('ID', StrToInt(sID), [])
      then tbDokuments.Delete;
    AppendToDelObj(ds.FieldByName('DATE_DOK').AsDateTime, sID, TypeObj_RasxNaklSvid);
{  end else if nTypeObj = TypeObj_Svid then begin
    if not (ds.FieldByName('ID').AsString='') then begin
      while SvidDokList.Locate('ID', ds.FieldByName('ID').AsInteger, []) do
        SvidDokList.Delete;
      if SvidDok.Locate('ID', ds.FieldByName('ID').AsInteger, []) then
        SvidDok.Delete;
      AppendToDelObj(ds.FieldByName('DATEZ').AsDateTime,
                     ds.FieldByName('ID').AsString, TypeObj_Svid);
    end;
    }
  end;
end;

function TdmBase.DeleteForAll(DateFiks : TDateTime; strID : String) : Boolean;
var
  strDate : String;
begin
  Result := true;
  strDate := DTOS(DateFiks,tdAds);
  if (strID<>'') and (strDate<>'') then begin
    WorkQuery.Close;
    WorkQuery.SQL.Clear;
    WorkQuery.SQL.Add('DELETE FROM БазаСтрок WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
    WorkQuery.SQL.Add('DELETE FROM БазаСвойствОбъектов WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
    try
      WorkQuery.ExecSQL;
    except
      on E:Exception do begin
        Result := false;
        PutError(E.Message);
      end;
    end;
  end;
end;

//--------------------------------------------------------------------------------
function TdmBase.LastSvidPovtor(nTypeDok:Integer; strID:Integer; strFormat:String) : String;
var
  n,i:Integer;
begin
  Result:='';
  if SvidPovtor.Active then begin
    i:=Pos(';',strFormat);
    if i>0 then begin
      n:=StrToInt(Copy(strFormat, i+1, 5));
      strFormat:=Copy(strFormat, 1, i-1);
    end else begin
      n:=0;
    end;
    with SvidPovtor do begin
      IndexName := 'PR_KEY';
      try
        SetRange([nTypeDok,strID],[nTypeDok,strID]);
     // 'повторное св-во серия %0:s номер %1:s выдано %3:s'
        Last;
        if not FieldByName('SVID_DATE').IsNull then begin
          Result:=Format(strFormat,[FieldByName('SVID_SERIA').AsString, FieldByName('SVID_NOMER').AsString, DatePropis(FieldByName('SVID_DATE').AsDateTime,n)]);
        end;
      finally
        CancelRange;
      end;
    end;
  end;
end;

//--------------------------------------------------------------------------------
function TdmBase.DeletePropSimpleDok(strID : String; nTypeDok : Integer; sPokaz:String) : Boolean;
var
  sAdd:String;
begin        
  Result := true;
//  при изменеии функции добавить условие в файл:
//  "Удаление_записей_актов.sql"
  if (strID<>'') and (nTypeDok > 0) then begin
    if sPokaz<>''
      then sAdd:=' and pokaz='+QStr(sPokaz)
      else sAdd:='';
    AdsConnection.Execute('DELETE FROM BaseProp WHERE typeobj='+IntToStr(nTypeDok)+' and id='+strID+sAdd+';');
    {
    tbSimpleProp.IndexName := 'PR_KEY';
    tbSimpleProp.SetRange([nTypeDok,strID],[nTypeDok,strID]);
    tbSimpleProp.First;
    while not tbSimpleProp.Eof do begin
      tbSimpleProp.Delete;
    end;
    tbSimpleProp.CancelRange;
    }
    AdsConnection.Execute('DELETE FROM BaseTextProp WHERE typeobj='+IntToStr(nTypeDok)+' and id='+strID+sAdd+';');
    {
    tbSimplePropMemo.IndexName := 'PR_KEY';
    tbSimplePropMemo.SetRange([nTypeDok,strID],[nTypeDok,strID]);
    tbSimplePropMemo.First;
    while not tbSimplePropMemo.Eof do begin
      tbSimplePropMemo.Delete;
    end;
    tbSimplePropMemo.CancelRange;
    }

    // удаление из списка историй реквизитов ЗАГС
    if tbHistoryZAGS.Active and (sPokaz='') then begin

//      tbHistoryZAGS:= CreateAddTable('HistoryZAGS','','AdsConnection');
      AdsConnection.Execute('DELETE FROM HistoryZAGS WHERE typeobj='+IntToStr(nTypeDok)+' and id='+strID+';');
      {
      with tbHistoryZAGS do begin
        IndexName := 'PR_KEY';
        SetRange([nTypeDok,strID],[nTypeDok,strID]);
        First;
        while not Eof do Delete;
        CancelRange;
      end;
      }
    end;
    // удаление из списка повторных свидетельств
    if SvidPovtor.Active and (sPokaz='') then begin
      AdsConnection.Execute('DELETE FROM SvidPovtor WHERE svid_type='+IntToStr(nTypeDok)+' and akt_id='+strID+';');
      {
      with SvidPovtor do begin
        IndexName := 'PR_KEY';
        SetRange([nTypeDok,strID],[nTypeDok,strID]);
        First;
        while not Eof do Delete;
        CancelRange;
      end;
      }
    end;
  end;
end;

function TdmBase.AdresForSeek(ds : TDataSet) : TAdres;
var
  fld : TField;
begin
  Result.Punkt:=ds.FieldByName('PUNKT').AsString;
  Result.PunktKod:=StrToInt(ds.FieldByName('PUNKT').AsString);
  Result.Ulica:=Trim(ds.FieldByName('UL').AsString);
  if Result.Ulica=''
    then Result.UlicaInt:=0
    else Result.UlicaInt:=StrToInt(Result.Ulica);
  if Trim(ds.FieldByName('DOM').AsString)=''
    then Result.Dom:=''
    else Result.Dom:=GetNomerDom(ds.FieldByName('DOM').AsString);
  if Trim(ds.FieldByName('KORP').AsString)=''
    then Result.Korp:=''
    else Result.Korp:=GetNomerDom(ds.FieldByName('KORP').AsString);

  if ds.FieldByName('NOT_DOM').IsNull
    then Result.NotDom:=false
    else Result.NotDom:=ds.FieldByName('NOT_DOM').AsBoolean;

  fld:=ds.FindField('KV');
  if fld<>nil then begin
    Result.Kv:=ds.FieldByName('KV').AsString;
    if Trim(Result.Kv)=''
      then Result.Kv:=''
      else Result.Kv:=GetNomerDom(Trim(Result.Kv));
  end;
end;

function TdmBase.AdresForSeek2(nPunkt, nUL: Integer; strDom, strKorp: String; strKv:String; lNotDom:Boolean): TAdres;
begin
  Result.Punkt:=IntToStr(nPunkt);
  Result.PunktKod:=nPunkt;
  if nUL<1 then begin
    Result.Ulica:='';
    Result.UlicaInt:=0;
  end else begin
    Result.Ulica:=IntToStr(nUL);
    Result.UlicaInt:=StrToInt(Result.Ulica);
  end;
  if Trim(strDom)=''
    then Result.Dom:=''
    else Result.Dom:=GetNomerDom(strDom);
  if Trim(strKorp)=''
    then Result.Korp:=''
    else Result.Korp:=GetNomerDom(strKorp);

  Result.NotDom:=lNotDom;

  if Trim(strKv)=''
    then Result.Kv:=''
    else Result.Kv:=GetNomerDom(Trim(Result.Kv));
end;

procedure TdmBase.DeleteBigHouse;
begin
  tbBigHouse.Delete;
end;

//---------------------------------------------------------------------------
// удаление адреса
//---------------------------------------------------------------------------
function TdmBase.DeleteAdres(DateFiks : TDateTime; strID : String) : Boolean;
var
  strDate,s : String;
  adr : TAdres;
begin
  Result := true;
  strDate := DTOS(DateFiks,tdAds);
  if (strID<>'') and (strDate<>'') then begin
    tbLich.IndexName:='ADRES_KEY';
    if tbLich.FindKey([DateFiks,strID]) then begin
      Result := false;
      PutError('По текущему адресу существует лицевой счет № '+tbLich.FieldByName('NOMER').AsString+' !');
    end;
    tbLich.IndexName:='PR_KEY';
    if Result then begin
      tbMens.IndexName:='ADRES_KEY';
      if tbMens.FindKey([DateFiks,strID]) then begin
        Result := false;
        s := Trim(tbMens.FieldByName('FAMILIA').AsString)+' '+Trim(tbMens.FieldByName('NAME').AsString)+' '+
             Trim(tbMens.FieldByName('OTCH').AsString);
        PutError('По текущему адресу проживает: ' + s + ' !');
      end;
      tbMens.IndexName:='PR_KEY';
    end;
//    {$IFDEF OBR_GRAG}      не контролируем   (чистим см. ниже)
//    if Result then begin
//      if fmMain.DocRecord.CanDeleteAdr(StrToInt(strId),s) then begin
//        PutError(s);
//        Result:=false;
//      end;
//    end;
//    {$ENDIF}
    if Result then begin
      tbAdres.IndexName:='PR_KEY';
      if tbAdres.FindKey([DateFiks,strID]) then begin
        adr := AdresForSeek(tbAdres);
      end;
      WorkQuery.Close;
      WorkQuery.SQL.Clear;
      // не контролируем
      WorkQuery.SQL.Add('UPDATE DocMain SET ADR_ID=-1 WHERE adr_id='+strID+';');

      WorkQuery.SQL.Add('DELETE FROM БазаДомов WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
      WorkQuery.SQL.Add('DELETE FROM HouseProps WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
      WorkQuery.SQL.Add('DELETE FROM HouseOwners WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
      WorkQuery.SQL.Add('DELETE FROM HouseOwnersHist WHERE id='+strID+';');
      try
        WorkQuery.ExecSQL;
        //------- если адресов больше нет то удалим и дом ---------------
        if not FindAdres(DateFiks, StrToInt(adr.Punkt), adr.UlicaInt, adr.Dom, adr.Korp, '{---}', -1) then begin
          if FindBigHouse(adr, DateFiks) then begin
             DeleteBigHouse;
          end;
        end;
        //------ если были лиц. счета по адресу -----------
        tbLich.IndexName:='ADRES_KEY';
        while tbLich.FindKey([DateFiks,strID]) do begin
          tbLich.Edit;
          tbLich.FieldByName('ADRES_ID').AsString := '';
          if tbLich.FieldByName('OWN_HOUSE').AsBoolean then begin
            tbLich.FieldByName('OWN_HOUSE').AsBoolean := false;
            tbLich.FieldByName('TYPEHOUSE').AsString := '';
          end;
          tbLich.Post;
        end;
        tbLich.IndexName:='PR_KEY';
        //------ если люди проживали  адресу -----------
        tbMens.IndexName:='ADRES_KEY';
        while tbMens.FindKey([DateFiks,strID]) do begin
          tbMens.Edit;
          tbMens.FieldByName('ADRES_ID').AsString := '';
          tbMens.Post;
        end;
        tbMens.IndexName:='PR_KEY';
        //-----------------------------------------------
      except
        on E:Exception do begin
          Result := false;
          PutError(E.Message);
        end;
      end;
      WorkQuery.Close;
    end;
    if Result then begin
      AppendToDelObj(DateFiks, strID, TypeObj_Adres);
      Result := DeleteForAll(DateFiks, strID);
    end;
  end;
end;

//---------------------------------------------------------------------------
// удаление человека с воинского учета
//---------------------------------------------------------------------------
function TdmBase.DeleteVUS(DateFiks : TDateTime; strID : String) : Boolean;
var
  strDate : String;
begin
  Result := true;
  strDate := DTOS(DateFiks,tdAds);
  if (strID<>'') and (strDate<>'') then begin
    WorkQuery.Close;
    WorkQuery.SQL.Clear;
    WorkQuery.SQL.Add('DELETE FROM VUS WHERE id='+strID+';');
    WorkQuery.SQL.Add('UPDATE Население SET vus=false WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
    try
      WorkQuery.ExecSQL;
    except
      on E:Exception do begin
        Result := false;
        PutError(E.Message);
      end;
    end;
    WorkQuery.Close;
    if Result then
      DeletePropSimpleDok(strID, _TypeObj_Nasel, 'SVERKI');
  end;
end;

//---------------------------------------------------------------------------
// удаление человека из очереди
//---------------------------------------------------------------------------
function TdmBase.DeleteOch(DateFiks : TDateTime; strID : String) : Boolean;
var
  strDate : String;
begin
  Result := true;
  strDate := DTOS(DateFiks,tdAds);
  if (strID<>'') and (strDate<>'') then begin
    WorkQuery.Close;
    WorkQuery.SQL.Clear;
    WorkQuery.SQL.Add('DELETE FROM Ochered WHERE id='+strID+';');
    WorkQuery.SQL.Add('DELETE FROM OcheredResh WHERE id='+strID+';');
    WorkQuery.SQL.Add('DELETE FROM SostavSem WHERE id='+strID+';');
    WorkQuery.SQL.Add('UPDATE Население SET ochered=false WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
    try
      WorkQuery.ExecSQL;
    except
      on E:Exception do begin
        Result := false;
        PutError(E.Message);
      end;
    end;
    WorkQuery.Close;
    if Result then
      DeletePropSimpleDok(strID, TypeObj_Ochered);
  end;
end;

//---------------------------------------------------------------------------
// удаление человека
//---------------------------------------------------------------------------
function TdmBase.DeleteMen(DateFiks : TDateTime; strID : String; lCheckDel : Boolean; lIgnoreCheck:Boolean) : Boolean;
var
  strDate,strErr : String;
begin
  Result := true;
  if (strID='') or (strID='-1')
    then exit;
  if lCheckDel then begin
    LastErrorDelete:='';
    Result:=CheckDeleteMen(DateFiks, StrToInt(strId), strErr,'');
    if not Result then begin
      if lIgnoreCheck then begin
        if not Problem(strErr+#13+'Удалить человека ?') then begin
          LastErrorDelete:=strErr;
          exit;          //  <--------------------!!!!!!!!!!!!!!!!!!!!!!!!!!!
        end;
      end else begin
        LastErrorDelete:=strErr;
        exit;          //  <--------------------!!!!!!!!!!!!!!!!!!!!!!!!!!!
      end;
    end;
  end;
  strDate := DTOS(DateFiks,tdAds);
  if (strDate<>'') then begin
    WorkQuery.Close;
    WorkQuery.SQL.Clear;
    WorkQuery.SQL.Add('DELETE FROM Население WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
    {$IFDEF OCHERED}
      //удалять из "населения" тех кто в составе семьи
      WorkQuery.SQL.Add('DELETE FROM Население WHERE date_fiks='+QStr(strDate)+' and id in (Select member_id from SostavSem where id='+strID+');');
    {$ENDIF}

    //------------- очистим ID в обращениях граждан --------------------------------
    // в CheckDeleteMen теперь DocMain не контролируем
    WorkQuery.SQL.Add('UPDATE DocMain SET SIGN_MAN=-1 WHERE sign_man='+strID+';');

    WorkQuery.SQL.Add('DELETE FROM НаселениеДвижение WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
    WorkQuery.SQL.Add('DELETE FROM НаселениеЛьготы WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
    WorkQuery.SQL.Add('DELETE FROM НаселениеПризнаки WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
    WorkQuery.SQL.Add('DELETE FROM HouseOwners WHERE date_fiks='+QStr(strDate)+' and kod='+strID+' and typekod='+OWNER_NASEL_STR+';');

    if GetDateCurrentSost=DateFiks then begin
      WorkQuery.SQL.Add('DELETE FROM Ochered WHERE id='+strID+';');
      WorkQuery.SQL.Add('DELETE FROM OcheredResh WHERE id='+strID+';');
      WorkQuery.SQL.Add('DELETE FROM SostavSem WHERE id='+strID+';');
      WorkQuery.SQL.Add('DELETE FROM VUS WHERE id='+strID+';');
      DeletePropSimpleDok(strID, _TypeObj_Ochered);
    end;
    try
      WorkQuery.ExecSQL;
    except
      on E:Exception do begin
        Result := false;
        PutError(E.Message);
      end;
    end;
    WorkQuery.Close;
    if Result then begin
      // если ID человека больше нет в таблице Население, то удалим человека из не исторических таблиц
      if not tbMens.Locate('ID',strID,[]) then begin
        //----- НаселениеДоп ----------
        if tbMensAdd.Locate('ID',strID,[]) then begin
          tbMensAdd.Delete;
        end;
        //----------------------------
      end;

      DeletePropSimpleDok(strID, _TypeObj_Nasel);  // !!!

      AppendToDelObj(DateFiks, strID, TypeObj_Nasel);
      Result := DeleteForAll(DateFiks, strID);
    end;
  end;
end;

//---------------------------------------------------------------------------
// удаление лицевого счета
//---------------------------------------------------------------------------
function TdmBase.DeleteLich(DateFiks : TDateTime; strID : String) : Boolean;
var
  strDate, strErr, s : String;
  slAdd : TStringList;
  i : Integer;
begin
  Result := true;
  strDate := DTOS(DateFiks,tdAds);
  if (strID<>'') and (strDate<>'') then begin
    slAdd := TStringList.Create;
    WorkQuery.Close;
    WorkQuery.SQL.Clear;
    //------- соберем людей которых будем удалять -------------------------
    WorkQuery.SQL.Add('SELECT ID FROM Население WHERE date_fiks='+QStr(strDate)+' and lic_id='+strID);
    WorkQuery.Open;
    while not WorkQuery.Eof do begin
      slAdd.Add(WorkQuery.FieldByName('ID').AsString);
      WorkQuery.Next;
    end;
    WorkQuery.Close;

    //-------- имею ли я право удалять людей  -------------------
    s:='';
    for i:=0 to slAdd.Count-1 do begin
      if not CheckDeleteMen(DateFiks, StrToInt(slAdd.Strings[i]), strErr,'') then begin
        s:=s+#13+strErr;
      end;
    end;
    if s<>'' then begin
      Result:=false;
      LastErrorDelete:=s;
      exit;    // <----------------!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    end;

    //-------- удалим людей -------------------
    for i:=0 to slAdd.Count-1 do begin
      DeleteMen(DateFiks, slAdd.Strings[i],false);
    end;

    slAdd.Free;
    WorkQuery.Close;
    WorkQuery.SQL.Clear;
    WorkQuery.SQL.Add('DELETE FROM ЛицевыеСчета WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
    WorkQuery.SQL.Add('DELETE FROM ЛицевыеСчетаПризнаки WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
    WorkQuery.SQL.Add('DELETE FROM Nalogi WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
    WorkQuery.SQL.Add('DELETE FROM Dokuments WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
    try
      WorkQuery.ExecSQL;
    except
      on E:Exception do begin
        Result := false;
        PutError(E.Message);
      end;
    end;
    WorkQuery.Close;
    if Result then begin
      DeleteForAll(DateFiks, strID);
      AppendToDelObj(DateFiks, strID, TypeObj_Lich);
    end;
  end;
end;
//---------------------------------------------------------------
procedure TdmBase.AppendToDelObj(DateFiks: TDateTime; strID: String; nTypeObj : Integer; ds:TDataSet; strKomm:String);
begin
  tbDelObj.Append;
  tbDelObj.FieldByName('TYPEOBJ').AsInteger    := nTypeObj;
  tbDelObj.FieldByName('DEL_ID').AsString      := strID;
  tbDelObj.FieldByName('DATE_DEL').AsDateTime  := dmBase.getCurDate; //GlobalTask.CurrentDate;
  tbDelObj.FieldByName('DATE_FIKS').AsDateTime := DateFiks;
  tbDelObj.FieldByName('USERID').AsString      := UserId;
  if strKomm<>''
    then tbDelObj.FieldByName('KOMM').AsString:=strKomm;
  tbDelObj.Post;
  DeleteUpdating(nTypeObj, strID);
  if ds<>nil then WriteLogDeleteDok(ds, nTypeObj);
end;
//---------------------------------------------------------------
procedure TdmBase.AppendToDelObjEx(nTypeObj:Integer; strID:String; DateDok:TDateTime; DateDok2: TDateTime; strKomm:String);
begin
// !!! при вызове для таблицы(население,адрес,лиц.счета) с реальным DateDok(DateFiks)=0 (31.12.1899) будет неправильно работать !!!
  try
    tbDelObj.Append;
    tbDelObj.FieldByName('TYPEOBJ').AsInteger     := nTypeObj;
    tbDelObj.FieldByName('DEL_ID').AsString       := strID;
    if DateDok>0
      then tbDelObj.FieldByName('DATE_FIKS').AsDateTime:=DateDok;
    tbDelObj.FieldByName('DATE_DEL').AsDateTime   := dmBase.getCurDate;
    tbDelObj.FieldByName('USERID').AsString       := UserId;
    if DateDok2>0
      then tbDelObj.FieldByName('DATE_FIKS2').AsDateTime:=DateDok2;
    if strKomm<>''
      then tbDelObj.FieldByName('KOMM').AsString:=strKomm;
    tbDelObj.Post;
    DeleteUpdating(nTypeObj, strID);
  except
    GlobalTask.LogFile.WriteToLogFile('Ошибка записи информации об удалении ('+IntToStr(nTypeObj)+','+strID+')  '+strKomm);
  end;
end;
//---------------------------------------------------------------
procedure TdmBase.DeleteUpdating(nTypeObj : Integer; strID: String);
begin
  AdsConnection.Execute(Format('DELETE FROM UpdatingObj WHERE typeobj=%d and id=%s',[nTypeObj, strID]));
end;
//--------------------------------------------
procedure TdmBase.WriteUpdateObj(nOper:Integer; nTypeObj:Integer; nID:Integer; nValueGrn:Integer; strKomm:String);
begin
  try
    AdsConnection.Execute(
    Format('MERGE UpdatingObj ON (typeobj=%d and id=%d and oper=%d and userid=''%s'') '+
           'WHEN MATCHED THEN '+
           'UPDATE SET date_corr=CURRENT_TIMESTAMP(0),pole_grn=%d,komm=''%s'' '+
           'WHEN NOT MATCHED THEN '+
           'INSERT (typeobj,id,oper,userid,date_corr,pole_grn,komm) '+
           'VALUES (%d,%d,%d,''%s'',CURRENT_TIMESTAMP(0),%d,''%s'');',
      [nTypeObj,nID,nOper,UserID,nValueGrn,strKomm,
       nTypeObj,nID,nOper,UserID,nValueGrn,strKomm]));
//    AdsConnection.Execute(
//      'INSERT INTO UpdatingObj (id,typeobj,new_obj,date_corr,userid,before_grn,pole_grn,komm) VALUES('+
//       Format('%s,%d,%s,CURRENT_TIMESTAMP(0),''%s'',%s,%d,''%s'')',[strID,nTypeObj, IIFS(lNewObj,'true','false'),UserID,
//                                                              IIFS(lBeforeGrn,'true','false'),nValueGrn,strKomm]));
  except
    GlobalTask.LogFile.WriteToLogFile('Ошибка записи информации о корректировке ('+IntToStr(nTypeObj)+','+InttoStr(nID)+')  '+strKomm);
  end;
end;

//---------------------------------------------------------------
procedure TdmBase.DeleteFromList(tb: TAdsTable; DateFiks: TDateTime; ID: Integer);
begin
  tb.IndexName:='PR_KEY';
  while tb.FindKey([DateFiks,ID]) do tb.Delete;
end;
//---------------------------------------------------------------
procedure TdmBase.DeleteFromListEx(sTableName:String; DateFiks: TDateTime; nTypeObj:Integer; ID: Integer);
begin
  AdsConnection.Execute('DELETE FROM '+sTableName+' WHERE date_fiks='+DateToSQL(DateFiks)+' and typeobj='+IntToStr(nTypeObj)+' and id='+IntToStr(ID));
end;
//---------------------------------------------------------------
function TdmBase.NameSostFromDate(DateFiks: TDateTime): String;
begin
  if dateFiks = GetDateCurrentSost then begin
    Result := 'Текущее состояние';
  end else begin
    Result := FormatDateTime('Состояние на dd.mm.yyyy г.',DateFiks);
  end;
end;

//---------------------------------------------------------------
// Создать новое состояние базы из текущего
function TdmBase.CreateNewSostBase(DateFiks: TDateTime; lCreateCur : Boolean): Boolean;
{$IFNDEF ZAGS}
var
  i,j : Integer;
  strFields : String;
  strDateCur : String;
  strDateNew : String;
  strSQL,sTable : String;
  lOk,lDel : Boolean;
  tb : TAdsTable;
  strTableName,strNotDropMens,strNotDropLic : String;
  Rel : TRelation;
{$ENDIF}
begin
  Result := true;
{$IFNDEF ZAGS}
  WorkQuery.Active := false;
  WorkQuery.DatabaseName := 'AdsConnection';
  if lCreateCur then begin  // воссоздать текущее состояние базы из другого
    strSQL := 'SELECT Count(*) kolvo FROM ДатыФиксации'+
                  ' WHERE date_fiks='+QStr(DTOS(DateFiks, tdAds));
    WorkQuery.SQL.Text := strSQL;
    WorkQuery.Open;
    // если состояние создано
    if WorkQuery.Fields[0].AsInteger > 0 then begin
      strDateCur := QStr( DTOS( DateFiks, tdAds ) );
      strDateNew := QStr( DTOS( GetDateCurrentSost, tdAds ) );
      lOk  := false;
      lDel := true;  // необходимо очистить текущее состояние базы
//      if Problem(' Востановить текущее состояние базы из состояния на 1 января '+
//                 Copy(DTOS(DateFiks,tdAds),1,4)+' года ? ') then begin
        if Problem('  Вы уверены ?  ') then begin
          lOk := true;
        end;
//      end;
    end else begin
      lDel := false;
      ShowMessage(' Отсутствует состояние базы на 1 января '+Copy(DTOS(DateFiks,tdAds),1,4)+' года. ');
      lOk := false;
    end;
  end else begin            // создать новое состояние из текущего
    strDateCur := QStr( DTOS( GetDateCurrentSost, tdAds ) );
    strDateNew := QStr( DTOS( DateFiks, tdAds ) );
    strSQL := 'SELECT Count(*) kolvo FROM ДатыФиксации'+
                  ' WHERE date_fiks='+QStr(DTOS(DateFiks, tdAds));
    WorkQuery.SQL.Text := strSQL;
    WorkQuery.Open;
    lOk  := true;
    lDel := false;
    // если состояние уже создано
    if WorkQuery.Fields[0].AsInteger > 0 then begin
      lOk  := false;
      lDel := true;
      if Problem(' Состояние базы на 1 января '+Copy(DTOS(DateFiks,tdAds),1,4)+' существует. '+
          #13 + ' Перезаписать ? ') then begin
        if Problem('  Вы уверены ?  ') then begin
          lOk := true;
        end;
      end;
    end;
  end;
  if lOk then begin
    WorkQuery.Active := false;
    {$IFNDEF DEBUG}
    if lCreateCur
      then GlobalTask.LogFile.WriteToLogFile('Создание текущего состояния базы из состояния на 1 января '+Copy(DTOS(DateFiks,tdAds),1,4)+' года')
      else GlobalTask.LogFile.WriteToLogFile('Создание состояния базы на 1 января '+Copy(DTOS(DateFiks,tdAds),1,4)+' года');
    if lCreateCur
      then OpenMessage( 'Создание текущего состояния базы из состояния на 1 января '+Copy(DTOS(DateFiks,tdAds),1,4)+' года', '')
      else OpenMessage( 'Создание состояния базы на 1 января '+Copy(DTOS(DateFiks,tdAds),1,4)+' года', '');
    {$ENDIF}
    try
      if not lCreateCur then begin
        if not lDel then begin // если запись не существует
          strSQL := 'INSERT INTO ДатыФиксации (date_fiks) VALUES ('+strDateNew+')';
          WorkQuery.SQL.Text := strSQL;
          WorkQuery.ExecSQL;
          WorkQuery.Active := false;
        end;
      end;
      Application.ProcessMessages;
      for j:=0 to ListTablesSost.Count-1 do begin
        tb := ListTablesSost.Items[j];
        strFields := '';
        for i:=0 to tb.FieldCount-1 do begin
          if (ANSIUpperCase(tb.Fields[i].FieldName)<>'DATE_FIKS') and
             (tb.Fields[i].DataType<>ftAutoInc) then begin
            strFields:=strFields+tb.Fields[i].FieldName+', ';
          end;
        end;
        strFields:=Copy(strFields,1,Length(strFields)-2);
        
        strTableName := '"'+tb.TableName+'"';
        strSQL := 'INSERT INTO '+strTableName+#13+'  (date_fiks, '+strFields+') '+#13+'SELECT '+
              strDateNew+', '+strFields + #13 +
              'FROM '+strTableName+' WHERE date_fiks='+strDateCur;
        WorkQuery.Active := false;
        if lDel then begin
          strSQL := 'DELETE FROM '+strTableName+' WHERE date_fiks='+strDateNew+';'+#13+
                    strSQL+#13;
        end;
//        if tb.FindField('CANDELETE') <> nil then begin
//          ShowMessage(strSQL);
//        end;
        WorkQuery.SQL.Text := strSQL;
        try
          WorkQuery.ExecSQL;
        except
          on E:Exception do begin
            PutError('ОШИБКА: '+E.Message);
            Result := false;
            break;
          end;
        end;
        WorkQuery.Active := false;
        Application.ProcessMessages;
      end;
      if Result and not lCreateCur then begin
        WorkQuery.Active := false;
        //-------- на всякий случай удалим временные таблицы ---------------------------------------------------
        try
          WorkQuery.SQL.Text := 'DROP TABLE #temp_mens';
          WorkQuery.VerifySQL;
          WorkQuery.ExecSQL;
        except
        end;
        try
          WorkQuery.SQL.Text := 'DROP TABLE #temp_lic';
          WorkQuery.VerifySQL;
          WorkQuery.ExecSQL;
        except
        end;
        Application.ProcessMessages;
        //----- нельзя удалять людей собственников и которые уехали или умерли после времени даты фиксации ------
        strNotDropMens := 'select distinct id into #temp_mens from '+#13+
                          ' ( select distinct id as id from население n '+#13+
                          '     where n.date_fiks='+strDateCur+' and n.candelete is not null and n.candelete=true '+#13+
                          '           and ( n.notdelete=true  or '+#13+
                          '                 (dates is not null and dates>='+strDateNew+') or '+#13+
                          '                 (datev is not null and datev>='+strDateNew+') ) '+#13+
                          '     union all  '+#13+
                          '   select id from vus '+#13+ // 'ubit_date is null or ubit_date<=' нельзя удалять состоящих на учете вус
                          '     union all  '+#13+
                          '   select id from ochered '+#13+  // 'iskl is null or iskl=false or isk_date<='  нельзя удалять состоящих в очереди на улучшение
                          '     union all  '+#13+
                          '   select distinct kod as id from houseowners h '+#13+
                          '   left join население n on n.date_fiks='+strDateCur+' and n.id=h.kod '+#13+
                          '     where h.date_fiks='+strDateCur+' and '+#13+
                          '       ( h.datep is null or h.datep>='+strDateNew+') '+#13+     // (дата по) пустая или больше чем дата состояния - этих не удаляем
                          ' ) aaa ';
// было
//                          '   select distinct kod as id from houseowners h '+#13+
//                          '   left join население n on n.date_fiks='+strDateCur+' and n.id=h.kod '+#13+
//                          '     where h.date_fiks='+strDateCur+' and '+#13+
//                          '       (n.dates is null or (h.datep is not null and h.datep>='+strDateNew+')) and '+#13+
//                          '           n.candelete is not null and n.candelete=true '+#13+
//                          ' ) aaa ';
        WorkQuery.SQL.Text := strNotDropMens;
        WorkQuery.VerifySQL;
        WorkQuery.ExecSQL;
        Application.ProcessMessages;
        //----- нельзя удалять лицевые счета на которых есть люди, которых нельзя удалять -----------------------
        strNotDropLic := ' select lic_id as id into #temp_lic from '+#13+
                         ' ( select distinct lic_id from население n '+#13+
                         '    where id in (select id from #temp_mens) '+#13+
                         ' ) bbb ';
        WorkQuery.SQL.Text := strNotDropLic;
        WorkQuery.VerifySQL;
        WorkQuery.ExecSQL;
        Application.ProcessMessages;
        //-------------------------------------------------------------------------------------------------------

        for i:=0 to Relations.Count-1 do begin
          Rel := Relations.Item[i];
          WorkQuery.SQL.Text := 'DELETE FROM Временная';
          WorkQuery.ExecSQL;
          strSQL := 'INSERT INTO Временная (ID) SELECT ID FROM "'+Rel.MainTable.TableName+'" WHERE '+
                    'date_fiks='+strDateCur+' and candelete is not null and candelete=true';
          if Rel.Kod='MENS' then begin
            strSQL := strSQL + ' and ID NOT IN (SELECT ID FROM #temp_mens)';
          end else if Rel.Kod='LICH' then begin
            strSQL := strSQL + ' and ID NOT IN (SELECT ID FROM #temp_lic)';
          end;
          WorkQuery.SQL.Text := strSQL;
          WorkQuery.ExecSQL;
          WorkQuery.Active := false;
          WorkQuery.SQL.Text := 'SELECT Count(*) FROM Временная';
          WorkQuery.Active := true;
          if WorkQuery.Fields[0].AsInteger>0 then begin
            WorkQuery.Active := false;
            for j:=0 to Rel.Count-1 do begin
              strSQL := 'DELETE FROM "'+Rel.Item[j].TableName+'" WHERE '+
                        'date_fiks='+strDateCur+' and ID IN (SELECT ID FROM Временная)';
              WorkQuery.SQL.Text := strSQL;
              WorkQuery.VerifySQL;
              WorkQuery.ExecSQL;
//              ShowMessage(Rel.MainTable.TableName+#13+strSQL);
            end;
            // удалим из простых таблиц: без поля DATE_FIKS    (для человека: Ochered,SostavSem,VUS)
            { TODO -cтестирование : Протестировать }
            for j:=0 to Rel.CountSimpleTable-1 do begin
              strSQL := 'DELETE FROM "'+Rel.SimpleTable(i).TableName+'" WHERE ID IN (SELECT ID FROM Временная)';
              WorkQuery.SQL.Text := strSQL;
              WorkQuery.ExecSQL;
//              ShowMessage(Rel.MainTable.TableName+#13+strSQL);
            end;

            strSQL := 'DELETE FROM "'+Rel.MainTable.TableName+'" WHERE '+
                      'date_fiks='+strDateCur+' and ID IN (SELECT ID FROM Временная)';
            WorkQuery.SQL.Text := strSQL;
//            ShowMessage('Удпление из главной талицы: '+#13+strSQL);
            WorkQuery.VerifySQL;
            WorkQuery.ExecSQL;
//               WorkQuery.SQL.Text := strSQL;
//               WorkQuery.ExecSQL;
          end;
          Application.ProcessMessages;
          WorkQuery.Active   := false;
        end;
        //------ удаление из списка владельцов домов удаленных в таблице "Население"------
        strSQL := 'delete from houseowners where kod in '+chr(13)+
                  ' ( select h.kod '+chr(13)+
                  '  from houseowners h '+chr(13)+
                  '  left join население n on n.date_fiks='+strDateCur+' and n.id=h.kod '+chr(13)+
                  '  where h.date_fiks='+strDateCur+' and n.id is null and typekod=1)  ';
        WorkQuery.SQL.Text := strSQL;
        WorkQuery.VerifySQL;
        WorkQuery.ExecSQL;
        Application.ProcessMessages;
        //---------------------------------------------------------------------------------
      end;
      GlobalTask.LogFile.WriteToLogFile('Создание успешно завершено.');
    finally
      {$IFNDEF DEBUG}
      CloseMessage;
      {$ENDIF}
    end;
  end;
{$ENDIF}
end;

//------------------------------------------------------------
function TdmBase.DeleteSostBase(DateFiks: TDateTime): Boolean;
var
  j,i : Integer;
  strDateDel : String;
  strSQL : String;
  lOk : Boolean;
  tb  : TAdsTable;
  strTableName : String;
  arrSQL : TArrStrings;
begin
  Result := true;
  WorkQuery.Active := false;
  WorkQuery.DatabaseName := 'AdsConnection';
  strDateDel := QStr( DTOS( DateFiks, tdAds ) );
  strSQL := 'SELECT Count(*) kolvo FROM ДатыФиксации'+
                ' WHERE date_fiks='+QStr(DTOS(DateFiks, tdAds));
  WorkQuery.SQL.Text := strSQL;
  WorkQuery.Open;
  lOk := true;
  // если состояния нет
  if WorkQuery.Fields[0].AsInteger = 0 then begin
    lOk  := false;
    ShowMessage(' Состояние базы на 1 января '+Copy(DTOS(DateFiks,tdAds),1,4)+'года не существует. ');
  end;
  WorkQuery.Active := false;
  if lOk then begin
    GlobalTask.LogFile.WriteToLogFile('Удаление состояния базы на 1 января '+Copy(DTOS(DateFiks,tdAds),1,4)+' года');
    OpenMessage( 'Удаление состояния базы на 1 января '+Copy(DTOS(DateFiks,tdAds),1,4)+' года', '');
    try
      WorkQuery.Active := false;
      strSQL := 'DELETE FROM ДатыФиксации WHERE date_fiks='+strDateDel;
      WorkQuery.SQL.Text := strSQL;
      WorkQuery.ExecSQL;
      WorkQuery.Active := false;
      for j:=0 to ListTablesSost.Count-1 do begin
        tb := ListTablesSost.Items[j];
        strTableName := '"'+tb.TableName+'"';
        strSQL := 'DELETE FROM '+strTableName+' WHERE date_fiks='+strDateDel;
        WorkQuery.SQL.Text := strSQL;
        try
          WorkQuery.ExecSQL;
        except
          on E:Exception do begin
            PutError('ОШИБКА: '+E.Message);
            Result := false;
          end;
        end;
        WorkQuery.Active := false;
        if not Result then break;
      end;
      if Result then begin
        //------ дополнительное удаление из не исторических таблиц ----------------
        SetLength(arrSQL,1);
        arrSQL[0] := 'DELETE FROM НаселениеДоп WHERE id NOT IN (SELECT id FROM Население )';
        for i:=0 to Length(arrSQL)-1 do begin
          try
            WorkQuery.SQL.Text := arrSQL[i];
            WorkQuery.ExecSQL;
          except
            on E:Exception do begin
              PutError('ОШИБКА: '+E.Message);
              Result := false;
            end;
          end;
          if not Result then break;
        end;
      end;
      //-------------------------------------------------------------------------
      if Result then
        GlobalTask.LogFile.WriteToLogFile('Удаление успешно завершено.');
    finally
      CloseMessage;
    end;
  end;
end;

{ TRelation }

constructor TRelation.Create(tb: TAdsTable);
begin
  MainTable := tb;
  FList := TList.Create;
  FList2 := TList.Create;
end;

destructor TRelation.Destroy;
begin
  FList.Free;
  FList2.Free;
  inherited;
end;

procedure TRelation.AddTable(tb: TAdsTable);
begin
  FList.Add(tb);
end;

function TRelation.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TRelation.GetItem(I: Integer): TAdsTAble;
begin
  Result := TAdsTable(FList.Items[I]);
end;

procedure TRelation.AddSimpleTable(tb: TAdsTable);
begin
  FList2.Add(tb);
end;

function TRelation.CountSimpleTable: Integer;
begin
  Result := FList2.Count;
end;

function TRelation.SimpleTable(i: Integer): TAdsTable;
begin
  Result := TAdsTable(FList2.Items[I]);
end;

{ TRelations }

function TRelations.AddNew(tb: TAdsTable): TRelation;
begin
  Result := TRelation.Create(tb);
  FList.Add( Result );
end;

constructor TRelations.Create;
begin
  FList := TList.Create;
end;

destructor TRelations.Destroy;
var
  i : Integer;
begin
  for i:=0 to FList.Count-1 do begin
    TRelation(FList.Items[i]).Free;
  end;
  FList.Free;
  inherited;
end;

//-----------------------------------------------------------------------------
function TRelations.GetCount: Integer;
begin
  Result := FList.Count;
end;

//-----------------------------------------------------------------------------
function TRelations.GetItem(I: Integer): TRelation;
begin
  Result := TRelation(FList.Items[i]);
end;

//-----------------------------------------------------------------------------
function TdmBase.LastDateSost: TDateTime;
var
  strSQL : String;
begin
  WorkQuery.Active := false;
  WorkQuery.DatabaseName := 'AdsConnection';
  strSQL := 'SELECT TOP 1 date_fiks FROM ДатыФиксации'+
            ' ORDER BY date_fiks DESC';
  WorkQuery.SQL.Text := strSQL;
  WorkQuery.Open;
  if not WorkQuery.Eof then begin
    Result := WorkQuery.Fields[0].AsDateTime;
  end else begin
    Result := dmBase.GetDateCurrentSost;
  end;
  WorkQuery.Close;
end;

//-----------------------------------------------------------------------------
function TdmBase.getMenWork(DateFiks:TDateTime; strID:String): String;
var
  ds:TDataSet;
begin
  Result := '';
  ds:=GetMen(DateFiks,strID);
  if ds<>nil then begin
    if not ds.FieldByName('WORK_SPR').IsNull then begin
      if SprWork.Locate('ID',ds.FieldByName('WORK_SPR').AsInteger,[]) then begin
        Result := SprWork.FieldByName('NAME').AsString;
      end;
    end else begin
      Result := ReadOneProp( dateFiks, StrToInt(strID), 'WORK_NAME', ftMemo);
    end;
  end;
end;

//-----------------------------------------------------------------------------
function TdmBase.getMenStud(DateFiks:TDateTime; strID:String): String;
var
  ds:TDataSet;
begin
  Result := '';
  ds:=GetMen(DateFiks,strID);
  if ds<>nil then begin
    if not ds.FieldByName('STUDENT_SPR').IsNull then begin
      if SprUchZaved.Locate('ID',ds.FieldByName('STUDENT_SPR').AsInteger,[]) then begin
        Result := SprUchZaved.FieldByName('NAME').AsString;
      end;
    end else begin
      Result := ReadOneProp( dateFiks, StrToInt(strID), 'STUD_PLACE', ftMemo);
    end;
  end;
end;

//-----------------------------------------------------------------------------
function TdmBase.getMenDolg(DateFiks:TDateTime; strID:String): String;
var
  ds:TDataSet;
begin
  Result := '';
  ds:=GetMen(DateFiks,strID);
  if ds<>nil then begin
    if not ds.FieldByName('DOLG_SPR').IsNull then begin
      if dmBase.SprDolg.Locate('ID',ds.FieldByName('DOLG_SPR').AsInteger,[]) then begin
        Result := dmBase.SprDolg.FieldByName('NAME').AsString;
      end;
    end else begin
      Result := ds.FieldByName('DOLG_NAME').AsString;
    end;
  end;
end;

function TdmBase.getMenDvig(DateFiks: TDateTime; strID,  strRazd: String): String;
var
  ds:TDataSet;
  dPropis:TDateTime;
  st:TSostTable;
begin
  Result := '';
  ds:=GetMen(DateFiks,strID);
  if ds<>nil then begin
    if ds.FieldByName('DATEP').IsNull
     then dPropis:=0
     else dPropis:=ds.FieldByName('DATEP').AsDateTime;
    st:=SaveSostTable(tbMensDvig,true,false);
    tbMensDvig.IndexName := 'PR_KEY';
    tbMensDvig.SetRange([DateFiks,StrToInt(strID)],[DateFiks,StrToInt(strID)]);
    try
      Result:=DvigMen(dPropis,tbMensDvig,strRazd);
    finally
      tbMensDvig.CancelRange;
      RestSostTable(tbMensDvig,st);
    end;
  end;
end;

//-----------------------------------------------------------------------------
function TdmBase.GetWork(nID: Integer; arrRec: TCurrentRecord): String;
var
  v : Variant;
begin
  Result := '';
  v := GetValueField(arrRec, 'WORK_SPR');
  if v <> null then begin
    if SprWork.Locate('ID',v,[]) then begin
      Result := SprWork.FieldByName('NAME').AsString;
    end;
  end else begin
    Result := ReadOneProp( dmBase.GetDateCurrentSost, nID, 'WORK_NAME', ftMemo);
  end;
end;

//-----------------------------------------------------------------------------
function TdmBase.GetDolg(nID: Integer; arrRec: TCurrentRecord): String;
var
  v : Variant;
begin
  Result := '';
  v := GetValueField(arrRec, 'DOLG_SPR');
  if v <> null then begin
    if dmBase.SprDolg.Locate('ID',v,[]) then begin
      Result := dmBase.SprDolg.FieldByName('NAME').AsString;
    end;
  end else begin
    v := GetValueField(arrRec, 'DOLG_NAME');;
    if v<>null then Result := v;
  end;
end;

//-----------------------------------------------------------------------------
function TdmBase.GetPasport(nID: Integer; arrRec: TCurrentRecord; strDelim : String): String;
var
  v : Variant;
  s : String;
  n : Integer;
begin
  Result := '';
  if strDelim=''
    then strDelim := #13#10;
  v := GetValueField(arrRec, 'PASP_NOMER');
  if v <> null then begin
    s := VarToStr(v);
    v := GetValueField(arrRec, 'PASP_UDOST');
    if v=null then n:=1 else n:=v;
    Result := GetNamePasport(n)+' ';
//    Result := 'ПАСПОРТ ';
    v := GetValueField(arrRec, 'PASP_SERIA');
    if v <> null then begin
      Result := Result + VarToStr(v)+' ' + s;
    end else begin
      Result := Result + s;
    end;
    s := dmBase.ReadOneProp( dmBase.GetDateCurrentSost, nID, 'PASP_VIDAN', ftMemo);
    if s<>''
      then Result := Result + strDelim + s;
    v := GetValueField(arrRec, 'PASP_DATE');
    if v <> null then begin
      s := FormatDateTime('dd.mm.yyyy',VarToDateTime(v))+'г.';
      Result := Result + strDelim + s;
    end;
  end;
end;

//-----------------------------------------------------------------------------
function TdmBase.GetRecPasport(nID: Integer; arrRec: TCurrentRecord): TPassport;
var
  v : Variant;
  s : String;
  n : Integer;
begin
  Result.Nomer:='';
  Result.Seria:='';
  Result.Date := 0;
  Result.Srok := 0;
  v := GetValueField(arrRec, 'PASP_NOMER');                       
  if v <> null then begin
    Result.Nomer := VarToStr(v);
    v := GetValueField(arrRec, 'PASP_UDOST');
    if v=null then n:=1 else n:=v;
    Result.UdostKod := n;
    Result.Udost := GetNamePasport(n);
    Result.UdostB:= GetNamePasport(n,'Б');
    v := GetValueField(arrRec, 'PASP_SERIA');
    if v <> null then Result.Seria := VarToStr(v);
    s := dmBase.ReadOneProp( dmBase.GetDateCurrentSost, nID, 'PASP_VIDAN', ftMemo);
    if s<>'' then Result.Organ := s;
    v := GetValueField(arrRec, 'PASP_DATE');
    if v <> null then Result.Date := VarToDateTime(v);
    v := GetValueField(arrRec, 'PASP_SROK');
    if v <> null then Result.Srok := VarToDateTime(v);
    v := GetValueField(arrRec, 'LICH_NOMER');
    if v <> null then Result.LichNomer := CheckRus2(v);
  end;
end;

//-----------------------------------------------------------------------------
function TdmBase.ChangeLicMen(DateFiks: TDateTime; nIdMen: Integer; nIdLic : Integer): Boolean;
var
  vKeyValues : Variant;
begin
  Result := true;
  vKeyValues := CreateSeek(DateFiks, nIdMen );
  if tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
    EditDataSet(tbMens);
    tbMens.FieldByName('LIC_ID').AsInteger := nIdLic;
    PostDataSet(tbMens);
  end else begin
    Result := false;
  end;
end;

//-----------------------------------------------------------------------------
function TdmBase.VipisMen(DateFiks: TDateTime; nIdMen: Integer; DateVipis : TDateTime; var strSoob:String) : Boolean;
var
  vKeyValues : Variant;
  nLicID:Integer;
begin
  Result := true;
  vKeyValues := CreateSeek(DateFiks, nIdMen );
  if tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
    if DateVipis=0 then DateVipis:=tbMens.FieldByName('DATE_SROK').AsDateTime;
    EditDataSet(tbMens);
    tbMens.FieldByName('DATEV').AsDateTime    := DateVipis;
    tbMens.FieldByName('DATE_SROK').AsString  := '';
    tbMens.FieldByName('PRESENT').AsBoolean   := false;
    tbMens.FieldByName('PROPIS').AsBoolean    := false;
    tbMens.FieldByName('CANDELETE').AsBoolean := true;
    nLicID := tbMens.FieldByName('LIC_ID').AsInteger;

    with tbMens do begin
      strSoob := FieldByName('FAMILIA').AsString+' '+FieldByName('NAME').AsString+' '+FieldByName('OTCH').AsString+' '+
                 AdresFromIDEx(DateFiks, FieldByName('ADRES_ID').AsString, true, true);
    end;

    //tbMens.FieldByName('KATEG').AsInteger     := LIC_REG;     // ???   категорию не трогаем

    PostDataSet(tbMens);

    try
      tbMensDvig.Append;
      tbMensDvig.FieldByName('DATE_FIKS').AsDateTime := dmBase.GetDateCurrentSost;
      tbMensDvig.FieldByName('ID').AsInteger         := nIdMen;
      tbMensDvig.FieldByName('TIP').AsString     := MIGR_UBIL;  // убыл
      tbMensDvig.FieldByName('CONTANT').AsInteger:= 1;  // постоянно
      tbMensDvig.FieldByName('TALON').AsInteger  := 0;
      tbMensDvig.FieldByName('DATE').AsDateTime  := DateVipis;
      tbMensDvig.FieldByName('PRICH').AsInteger  := 0;
//    tbMensDvig.FieldByName('PRICH').AsInteger  := GlobalTask.ParamAsInteger('PRICH_VOZVR');
      tbMensDvig.FieldByName('ORGAN').AsString   := '';
      tbMensDvig.Post;
    except
      on E: Exception do begin
        Result:=false;
        tbMensDvig.Cancel;
        strSoob:='ОШИБКА : '+strSoob+'  '+E.Message;
      end;
    end;
    if nLicID>0 then begin
      if CountMens(DateFiks, IntToStr(nLicID))=0 then begin
        if tbLich.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,nLicID]), []) then begin
          tbLich.Edit;
          tbLich.FieldByName('CANDELETE').AsBoolean  := true;
          tbLich.FieldByName('DATE_LIKV').AsDateTime := DateVipis;
          tbLich.Post;
        end;
      end;
    end;

  end else begin
    Result := false;
  end;
end;

//-----------------------------------------------------------------------------
function TdmBase.VozvratMen(DateFiks: TDateTime; nIdMen: Integer; DateVozvrat : TDateTime; var strSoob:String) : Boolean;
var
  vKeyValues : Variant;
begin
  Result := true;
  vKeyValues := CreateSeek(DateFiks, nIdMen );
  if tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
    if DateVozvrat=0
      then DateVozvrat:=tbMens.FieldByName('DATE_SROK').AsDateTime;
    EditDataSet(tbMens);
    tbMens.FieldByName('DATEV').AsString      := '';   // дата выписки д.б. пуста
    tbMens.FieldByName('DATE_SROK').AsString  := '';
    tbMens.FieldByName('PRESENT').AsBoolean   := true;
    tbMens.FieldByName('PROPIS').AsBoolean    := true;
    tbMens.FieldByName('KATEG').AsInteger     := LIC_REG;
    tbMens.FieldByName('CANDELETE').AsBoolean := false;
    PostDataSet(tbMens);

    with tbMens do begin
      strSoob := FieldByName('FAMILIA').AsString+' '+FieldByName('NAME').AsString+' '+FieldByName('OTCH').AsString+' '+
                 AdresFromIDEx(DateFiks, FieldByName('ADRES_ID').AsString, true, true);
    end;

    try
      tbMensDvig.Append;
      tbMensDvig.FieldByName('DATE_FIKS').AsDateTime := DateFiks;
      tbMensDvig.FieldByName('ID').AsInteger         := nIdMen;
      tbMensDvig.FieldByName('TIP').AsString     := MIGR_PRIB;  // прибыл
      tbMensDvig.FieldByName('CONTANT').AsInteger:= 1;  // постоянно
      tbMensDvig.FieldByName('TALON').AsInteger  := 0;
      tbMensDvig.FieldByName('DATE').AsDateTime  := DateVozvrat;
      tbMensDvig.FieldByName('PRICH').AsInteger  := GlobalTask.ParamAsInteger('PRICH_VOZVR');
      tbMensDvig.FieldByName('ORGAN').AsString   := '';
      tbMensDvig.Post;
    except
      on E: Exception do begin
        Result:=false;
        tbMensDvig.Cancel;
        strSoob:='ОШИБКА : '+strSoob+'  '+E.Message;
      end;
    end;
  end else begin
    Result := false;
  end;
end;

procedure TdmBase.CloseBase;
var
  old : TCursor;
begin
  old := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    FullClose;
    SimpleDisconnect;
  finally
    Screen.Cursor := old;
  end;
end;

function TdmBase.OpenBase(strPath: String): Boolean;
var
  strErr : String;
begin
  strErr:='';
  ClearIdBase;
  SimpleConnect(strErr);
  Result := FullOpen('','');
  if strErr <> '' then begin
    PutError(strErr);
  end;
end;

//------------------------------------------------------------
// очистить все открытые таблицы
function TdmBase.ClearOpenTables(strPath: String): Boolean;
begin
  Result:=false;
end;

function TdmBase.GetPathConnect : String;
var
  i : Integer;
begin
 if AdsConnection.IsDictionaryConn  then begin
   i := LastPos('\', AdsConnection.ConnectPath);
   Result := Copy(AdsConnection.ConnectPath,1,i);
 end else begin
   Result := AdsConnection.ConnectPath;
 end;
end;

{
function MyCallbackFunc( usPercent: Word;
                         ulCallbackID: Longint ): Longint; stdcall;
begin
  Result := 0;
  if ulCallbackID=1 then begin
    ChangeProgress2(usPercent);
  end;
end;

procedure TdmBase.PackBase;
begin
  WorkTable.AdsRegisterCallbackFunction( @MyCallbackFunc, 1 );
  AdsPackTable(
       try
                WorkQuery.ExecSQL;
              except
                on E: Exception do begin
                  Result := false;
                  PutError(' Ошибка создания сортировки таблицы: '+Table.TableName+
                            #13+E.Message);
                  break;
                end;
              end;
                if lChangeProgr then begin
                  WorkQuery.AdsClearCallbackFunction;
                  ChangeProgress2(-1, '');
                end;

end;
}

// если у человека не было движения то Result.TypeMigr=-1
function TdmBase.LastDvigMen(DateFiks: TDateTime;  strID: String): TLastDvig;
var
  vKeyValues : Variant;
  old : String;
begin
  Result.MenID := strID;
  Result.DateFiks := DateFiks;
  Result.TypeMigr := -1;
  Result.Contant  := false;
  Result.Komm     := '';
  if strID='' then begin
    exit;
  end;
  vKeyValues := VarArrayCreate( [0, 1], varOleStr );
  vKeyValues[0] := DateFiks;
  vKeyValues[1] := StrToInt(strID);
  // найдем человека в таблице "Население"
  if tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
    old := tbMensDvig.IndexName;
    tbMensDvig.IndexName := 'PR_KEY';
    tbMensDvig.SetRange([DateFiks,StrToInt(strID)],[DateFiks,StrToInt(strID)]);
    try
      if not tbMensDvig.Eof then begin
        tbMensDvig.Last;
        if not tbMensDvig.FieldByName('TIP').IsNull then begin
          Result.Date     := tbMensDvig.FieldByName('DATE').AsDateTime;
          Result.TypeMigr := tbMensDvig.FieldByName('TIP').AsInteger;
          Result.Komm     := tbMensDvig.FieldByName('KOMM').AsString;
          Result.PrichKod := tbMensDvig.FieldByName('PRICH').AsInteger;
          if tbMensDvig.FieldByName('DATE_SROK').IsNUll
            then Result.DateSrok:=0
            else Result.DateSrok:=tbMensDvig.FieldByName('DATE_SROK').AsDateTime;
          if SprTypeMigr.Locate('ID', Result.PrichKod, []) then begin
            Result.Prich := SprTypeMigr.FieldByName('NAME').AsString;
          end else begin
            Result.Prich := ''; //'причина:'+IntToStr(Result.PrichKod);
          end;
          if tbMensDvig.FieldByName('CONTANT').AsInteger = 1
            then Result.Contant := true
            else Result.Contant := false;
          Result.B_Obl := tbMensDvig.FieldByName('OP_B_OBL').AsBoolean;
          Result.Obl   := tbMensDvig.FieldByName('OP_OBL').AsString;
          Result.Rn    := tbMensDvig.FieldByName('OP_RAION').AsString;
          Result.B_Punkt:= tbMensDvig.FieldByName('OP_B_GOROD').AsInteger;
          Result.Punkt := tbMensDvig.FieldByName('OP_GOROD').AsString;
        end;
      end;
    finally
      tbMensDvig.CancelRange;
      tbMensDvig.IndexName := old;
    end;
  end;
  FLastDvigMen := Result;
end;

//----------------------------------------------------------
function TdmBase.LastDvigMenS( strID: String; sType:String ): String;
var
  ld : TLastDvig;
  s1,s2,s3,sn,sss1 : String;
//  l:Boolean;
begin
  Result := '';
  sType:=ANSIUpperCase(Trim(sType));
  ld := LastDvigMen(GetDateFiksReport, strID);
  if Ld.TypeMigr>-1 then begin
//    l:=false;
    if not ld.Contant then begin  // временно
//      l:=true;
      if ld.DateSrok>0 then begin
        sss1:='до '+FormatDateTime('dd.mm.yyyy',ld.DateSrok)+' ';
      end else begin
        sss1:='временно ';
      end;
    end;
    if Ld.TypeMigr = 1 then begin
      sn:=sss1+'прибыл ';
    end else begin
      sn:=sss1+'убыл ';
    end;
    if (sType='') or (Pos('Д',sType)>0) or  ((Pos('В',sType)>0) and not ld.Contant)
      then s1:=sn + FormatDateTime('dd.mm.yyyy',ld.Date)
      else s1:='';
    if (sType='') or (Pos('М',sType)>0)
      then s2:=ld.Komm else s2:='';
    if (sType='') or (Pos('П',sType)>0)
      then s3:=ld.Prich else s3:='';
    Result:=s1;
    if s2<>'' then Result:=Result+' '+s2;
    if s3<>'' then Result:=Result+', '+s3;
  end;
end;

//--------------------------------------------------------------------------------------------------------
// при вызове функций AddAdres и AddAdres2 обязательно устанавливать adr.NotDom и adr.NameHouse !!!
//--------------------------------------------------------------------------------------------------------
function TdmBase.AddAdres2(DateFiks : TDateTime; nNewID:Integer; adr:TAdres; var strErr : String) : Boolean;
var
  old : TCursor;
  strUL,strDom1,strDom2,s1,s2 : String;
  lNotDom:Boolean;
  sRnGor,sNameHouse,sNotDom,strDom,strKorp,strKv:String;
begin
  Result:=true;

  sNameHouse:=Trim(adr.NameHouse);
  lNotDom:=adr.NotDom;
  if lNotDom then sNotDom:='true' else sNotDom:='false';

  old := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  if lNotDom then begin
    if ID2Str(nNewID,SIZE_FIELD_DOM,s1,s2) then begin
      adr.Dom :=s2;
      adr.Korp:=s1;
    end;
  end;

  strDom:=adr.Dom;
  strKorp:=adr.Korp;
  strKv:=adr.Kv;

  // район в городе
  sRnGor:='null';
  {$IFDEF GKH}
    if adr.RnGor>0 then begin
      sRnGor:=IntToStr(adr.RnGor);
    end;
  {$ENDIF}

  adr := AdresForSeek2(adr.PunktKod, adr.UlicaInt, strDom, strKorp, strKv, lNotDom);
  adr.NameHouse:=sNameHouse;

  // если нет дома в базе BigHouse
  if not FindBigHouse(adr,DateFiks) then begin
    Result:=AddBigHouse(adr,DateFiks,true,strErr);
  end;
  if Result then begin
    RazdNomerDom(adr.Dom,strDom1,strDom2);
    //----------------------------------
//    strDom1 := QStr(dmBase.GetNomerDomEx(strDom1));
//    strDom2 := QStr(dmBase.GetNomerDomEx(strDom2));
    if strDom1=''
      then strDom1 := 'null'
      else strDom1 := ''''+GetNomerDom(strDom1)+'''';
    if strDom2=''
      then strDom2 := 'null'
      else strDom2 := ''''+GetNomerDom(strDom2)+'''';
    //----------------------------------
    if adr.UlicaInt < 1
      then strUL:='null'
      else strUL:=IntToStr(adr.UlicaInt);
    if strDom=''
      then strDom := 'null'
      else strDom := ''''+GetNomerDom(strDom)+'''';
    if strKorp=''
      then strKorp := 'null'
      else strKorp := ''''+GetNomerDom(strKorp)+'''';
    if strKv=''
      then strKv := 'null'
      else strKv := ''''+GetNomerDom(strKv)+'''';
    try
      WorkQuery.SQL.Text := 'INSERT INTO БазаДомов (DATE_FIKS,ID,PUNKT,UL,DOM,KORP,KV,DOM1,DOM2,NOT_DOM,RAION)'+#13+
            ' VALUES ( '+
            ''''+DTOS(DateFiks,tdAds)+''''+','+    // Date_Fiks
            IntToStr(nNewId)+','+                     // Id
            IntToStr(adr.PunktKod)+','+ // Punkt
            strUL+','+        // улица
            strDOM+','+       // дом
            strKORP+','+      // корпус
            strKV +','+       // квартира
            strDOM1+','+      // дом1
            strDOM2+','+      // дом2
            sNotDom+','+      // без номера дома
            sRnGor+
              ')';
      try
        WorkQuery.ExecSQL;
        Result := true;
      except
        on E: Exception do strErr := E.Message;
      end;
      Application.ProcessMessages;
    finally
      Screen.Cursor := old;
    end;
  end;
end;

//   0 - все Ok!
//   1 - адрес уже существует
//  -1 - ошибка создания
//--------------------------------------------------------------------------------------------------------
function TdmBase.AddAdresOld(DateFiks : TDateTime; nPunkt,nUl:Integer; strDom, strKorp, strKv: String;  var nNewID : Integer; var strErr : String) : Integer;
var
 adr:TAdres;
begin
 adr.NotDom:=false;
 adr.PunktKod:=nPunkt;
 adr.UlicaInt:=nUL;
 adr.Dom:=strDom;
 adr.Korp:=strKorp;
 adr.Kv:=strKv;
 adr.NameHouse:='';
 adr.RnGor:=0;
 Result:=AddAdres(DateFiks,adr,nNewID,strErr);
end;

//   0  - все Ok!
//   1  - адрес уже существует
//   10 - адрес на спец. учете
//  -1  - ошибка создания
//--------------------------------------------------------------------------------------------------------
function TdmBase.AddAdres(DateFiks : TDateTime; adr:TAdres;  var nNewID : Integer; var strErr : String) : Integer;
begin
  Result:=0;
  nNewID:=-1;
  Adres_SpecUch:=false;
  if EnableNotDom and adr.NotDom then begin  // если без номера дома, то и незачем искать
                      
  end else begin
    if FindAdres(DateFiks, adr.PunktKod, adr.UlicaInt, adr.Dom, adr.Korp, adr.Kv) then begin
      nNewID:=Adres_ID;
      strErr:='  Введенный адрес уже существует !  ';
      Result:=1;
      if Adres_SpecUch then begin
        Result:=10;
        strErr:=' Введенный адрес состоит на специальном учете ! ';
      end;
    end;
  end;
  if Result=0 then begin
    nNewId := GetNewID( dmBase.TypeObj_Adres );
    if nNewId <> -1 then begin
      if not AddAdres2(DateFiks,nNewID,adr,strErr) then Result:=-1;
    end else begin
      Result:=-1;
      strErr:='  Невозможно создать новый идентификатор.  ';
    end;
  end;
end;

//--------------------------------------------------------------------------------------------------------
function TdmBase.ChangeAdres(DateFiks: TDateTime; nID : Integer; oldAdres,newAdres : TAdres; var strErr:String) : Boolean;
var
  vKeyValues : Variant;
  strDom1,strDom2 : String;
//  strDom,strKorp,
  strBookMark,s : String;
begin
  Result := false;
  if FindAdres(DateFiks, StrToInt(newAdres.Punkt), newAdres.UlicaInt,
               newAdres.Dom, newAdres.Korp, newAdres.Kv) then begin
    strErr := ' Введенный адрес уже существует ! ';
  end else begin
    vKeyValues := VarArrayCreate( [0, 1], varOleStr );
    vKeyValues[0] := DateFiks;
    vKeyValues[1] := nID;
    if tbAdres.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
      Result := true;
      if FindBigHouse(oldAdres, DateFiks) then begin
        strBookMark := tbBigHouse.BookMark;
        // если еще нет дома с новым адресом
        if not FindBigHouse(newAdres, DateFiks) then begin
          tbBigHouse.BookMark := strBookMark;
          tbBigHouse.Edit;
          tbBigHouse.FieldByName('PUNKT').asString:=newAdres.Punkt;
          tbBigHouse.FieldByName('UL').AsInteger:=newAdres.UlicaInt;
          tbBigHouse.FieldByName('DOM').AsString:=GetNomerDomEx(newAdres.Dom);
          if tbBigHouse.FieldByName('DOM').AsString='' then tbBigHouse.FieldByName('DOM').AsString:=HOUSE_EMPTY_DOM;
          tbBigHouse.FieldByName('KORP').AsString:=GetNomerDomEx(newAdres.Korp);
          if tbBigHouse.FieldByName('KORP').AsString='' then tbBigHouse.FieldByName('KORP').AsString:=HOUSE_EMPTY_KORP;
          tbBigHouse.Post;
        end;
      end else begin
        AddBigHouse(newAdres,DateFiks,false,strErr);
      end;
      tbAdres.Edit;
      RazdNomerDom(newAdres.Dom,strDom1,strDom2);
      tbAdres.FieldByName('PUNKT').AsString := newAdres.Punkt;
      tbAdres.FieldByName('UL').AsString    := UlicaAsStringForAdres(newAdres.Ulica,false);
      tbAdres.FieldByName('DOM').AsString   := GetNomerDomEx(newAdres.Dom);
      tbAdres.FieldByName('KORP').AsString  := GetNomerDomEx(newAdres.Korp);
      tbAdres.FieldByName('KV').AsString    := GetNomerDomEx(newAdres.Kv);
      if Trim(strDom1)=''
        then tbAdres.FieldByName('DOM1').value := null
        else tbAdres.FieldByName('DOM1').AsString := GetNomerDomEx(strDom1);
      if Trim(strDom2)=''
        then tbAdres.FieldByName('DOM2').value := null
        else tbAdres.FieldByName('DOM2').AsString := GetNomerDomEx(strDom2);

//      tbAdres.FieldByName('DOM1').AsString   := GetNomerDomEx(strDom1);
//      tbAdres.FieldByName('DOM2').AsString   := GetNomerDomEx(strDom2);

      tbAdres.FieldByName('NOT_DOM').AsBoolean:= newAdres.NotDom;

      if newAdres.RnGor<=0
        then s:=''
        else s:=IntToStr(newAdres.RnGor);
      tbAdres.FieldByName('RAION').AsString:= s;

      tbAdres.Post;
      // если остались адреса со старым значением дома
      if FindAdres(DateFiks, StrToInt(oldAdres.Punkt), oldAdres.UlicaInt, oldAdres.Dom, oldAdres.Korp, '{---}', -1) then begin
        // если нет дома со старым значением ( в случае многоквартирного дома )
        if not FindBigHouse(oldAdres, DateFiks) then begin
          AddBigHouse(oldAdres,DateFiks,false,strErr);
        end;
      end else begin
       // если нет больше адресов со старым значением а дом есть
        if FindBigHouse(oldAdres, DateFiks) then begin
          DeleteBigHouse;
        end;
      end;
    end else begin
      strErr := ' Адрес не найден ! ';
    end
  end;
end;

function TdmBase.GetFindAdresID:Integer;
begin
  Result:=Adres_ID;
end;

//-------------------------------------------------------------------
function TdmBase.CreateSeekAdres(DateFiks: TDateTime; nPunkt:Integer; strUL: String; strDom:String; strKorp:String; strKv: String):String;
begin
  if Trim(strDom)=''
    then strDom := '(dom='''' or dom is null)'
    else strDom := 'dom='+''''+GetNomerDom(strDom)+'''';
  if Trim(strKorp)=''
    then strKorp := '(korp='''' or korp is null)'
    else strKorp := 'korp='+''''+GetNomerDom(strKorp)+'''';
  if strKv='{---}' then begin
    strKv:='';
  end else begin
    if Trim(strKv)=''
      then strKv := ' and (kv='''' or kv is null)'
      else strKv := ' and kv='+''''+GetNomerDom(strKv)+'''';
  end;
  if StrToInt(strUL)<1
    then strUL:='ul is null'
    else strUL:='ul='+strUL;
  Result := 'SELECT ID,TIP,IFNULL(SPEC_UCH,false) SPEC_UCH FROM БазаДомов '+#13+
       'WHERE '+
       'date_fiks=' + '''' + DTOS(DateFiks,tdAds) + '''' + ' and ' +
       'punkt=' + IntToStr(nPunkt) + ' and ' + strUL + ' and ' +
       strDOM +' and '+ strKorp + strKv;
end;

//-------------------------------------------------------------------
function TdmBase.TypeObjForMens(TypeObj:Integer):Boolean;
begin
  if (TypeObj=_TypeObj_Nasel) or (TypeObj=_TypeObj_Adres) or (TypeObj=_TypeObj_Lich) then begin
    Result:=true;
  end else begin
    Result:=false;
  end;
end;

//-------------------------------------------------------------------
function TdmBase.FindAdres(DateFiks: TDateTime; nPunkt, nUL: Integer; strDom, strKorp, strKv: String; nID : Integer): Boolean;
var
  strSQL : String;
  old : TCursor;
begin     
  Adres_ID := 0;
  old := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  strSQL:=CreateSeekAdres(DateFiks,nPunkt,IntToStr(nUl),strDom,strKorp,strKv);
  try
    WorkQuery.Close;
    WorkQuery.SQL.Text := strSQL;
    WorkQuery.Open;
    if nId = -1 then begin
      Result := not WorkQuery.Eof;
      if Result then
        Adres_ID := WorkQuery.Fields[0].AsInteger;
        Adres_SpecUch := WorkQuery.FieldbyName('SPEC_UCH').AsBoolean;
    end else begin
      if WorkQuery.Eof then begin
        Result := false;
      end else begin
        Result := false;
        while not WorkQuery.Eof do begin
          if WorkQuery.Fields[0].AsInteger<>nID then begin
            Result := true;
            break;
          end;
          WorkQuery.Next;
        end;
      end;
    end;
    WorkQuery.Close;
  finally
    Screen.Cursor := old;
  end;
end;

//-------------------------------------------------------------------
function TdmBase.TipBigHouseFromAdres(DateFiks: TDateTime; nPunkt, nUL: Integer; strDom, strKorp, strKv: String; var ID:Integer): Integer;
var
  strSQL : String;
  old : TCursor;
  nTip:Integer;
begin
  ID:=0;
  Result:=-1;
  nTip:=-1;
  old := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  strSQL:=CreateSeekAdres(DateFiks,nPunkt,IntToStr(nUl),strDom,strKorp,strKv);
  try
    WorkQuery.Close;
    WorkQuery.SQL.Text:=strSQL;
    WorkQuery.Open;
    while not WorkQuery.Eof do begin
      ID:=WorkQuery.FieldByName('ID').AsInteger;
      if WorkQuery.FieldByName('TIP').AsInteger=1 then begin  // жилой
        Result:=1;
        break;
      end else begin
        nTip:=WorkQuery.FieldByName('TIP').AsInteger;
      end;
      WorkQuery.Next;
    end;
  finally
    WorkQuery.Close;
    Screen.Cursor := old;
  end;
  if (Result=-1) and (nTip>-1)
    then Result:=nTip;
  if (Result=-1)
    then Result:=1;
end;

//------------------------------------------------------------------------------
function TdmBase.UlicaAsStringForAdres( strUlica : String; lSQL : Boolean) : String;
begin
  strUlica := Trim(strUlica);
  if strUlica<>'' then begin
    if StrToInt(strUlica)<1 then begin  // если 0 или -1
      strUlica:='';
    end;
  end;
  if lSQL then begin
    if strUlica=''
      then Result:='null'
      else Result:=strUlica;
  end else begin
    Result:=strUlica;
  end;
end;
//------------------------------------------------------------------------------
function TdmBase.UlicaAsStringForBigHouse( strUlica : String; lSQL : Boolean) : String;
begin
  strUlica := Trim(strUlica);
  if strUlica<>'' then begin
    if StrToInt(strUlica)<1 then begin  // если 0 или -1
      strUlica:='0';
    end;
  end;
  if lSQL then begin
    if strUlica=''
      then Result:='0'
      else Result:=strUlica;
  end else begin
    Result:=strUlica;
  end;
end;

//-------------------------------------------------------------------
function TdmBase.InitHouseProp(DateFiks: TDateTime; nPunkt, nUL: Variant; strDom, strKorp : String; nID : Integer): Boolean;
begin
//  v := VarArrayCreate( [0, 4], varVariant );
  Result := false;
  HouseProp_ID := 0;
  SetLength(ArrHouseProp,0);
  if VarIsNull(nUL) or (VarToStr(nUL)='') or (VarToStr(nUL)='0')
    then nUL:=0;
  if VarIsNull(strDom) or (VarToStr(strDom)='')
    then strDom:='';
  if VarIsNull(strKorp) or (VarToStr(strKorp)='')
    then strKorp:='';
  if strKorp='' then begin
    if nUL=0 then nUL:=null;
    dmBase.tbAdres.IndexFieldNames:='DATE_FIKS;PUNKT;UL;DOM;KORP;KV';
    try
      dmBase.tbAdres.SetRange([DateFiks,nPunkt,nUL,strDom],[DateFiks,nPunkt,nUL,strDom]);
      if not dmBase.tbAdres.Eof then begin
        Result := true;
        HouseProp_ID       := dmBase.tbAdres.FieldByName('ID').AsInteger;
        HouseProp_DateFiks := DateFiks;
      end;
    finally
      dmBase.tbAdres.CancelRange;
    end;
  end else begin
    Result := dmBase.FindAdres(DateFiks, nPunkt, nUL, strDom, strKorp, '{---}', -1);
    if Result then begin
      HouseProp_ID       := Adres_ID;
      HouseProp_DateFiks := DateFiks;
    end;
  end;
end;

//-------------------------------------------------------------------
function TdmBase.GetHouseProp(strProp : String; strType : String) : Variant;
begin
  Result:=null;
  if strType='' then strType:='V';
  if HouseProp_ID > 0 then begin
    Result:=dmBase.ReadOneProp(HouseProp_DateFiks,HouseProp_ID,strProp,ftUnknown);
  end;
  if (strType='C') or (strType='S') then begin
    if VarIsNull(Result) then Result:=''
                         else Result:=VarToStr(Result);
  end else if (strType='I') then begin
    if VarIsNull(Result) or (VarToStr(Result)='') then begin
      Result:=0
    end else begin
      try
        Result:=StrToInt(VarToStr(Result));
      except
        Result:=0;
      end;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------
function TdmBase.CheckNameBel(var Pol : TPol; strNameRus: String; strNameBel:String; strPadeg:String): String;
var
  ds:TDataSet;
  sField:String;
begin
  Result := '';
  if strNameBel='' then begin
    if strPadeg=''
      then sField:='NAME_B'
      else sField:='NAME_B'+strPadeg;
    if (Pol=tpNone) or (Pol=tpM) then begin
      if dmBase.SprNamesM.Locate('NAME',strNameRus,[]) then begin
        Result := CheckBelI(dmBase.SprNamesM.FieldByName(sField).AsString);
        Pol := tpM;
      end;
    end;
    if (Pol=tpNone) or (Pol=tpG) then begin
      if dmBase.SprNamesG.Locate('NAME',strNameRus,[]) then begin
        Result := CheckBelI(dmBase.SprNamesG.FieldByName(sField).AsString);
        Pol := tpG;
      end;
    end;
    if LastSimIsLower(strNameRus) then begin
      Result:=CheckRegisterText(EC_FIRST,Result);
    end else begin
      Result:=ANSIUpperCase(Result);
    end;
  end else begin
    if (Pol=tpNone) then begin

    end else begin
      if (Pol=tpM)
        then ds:=dmBase.SprNamesM
        else ds:=dmBase.SprNamesG;
      if not ds.Locate('NAME',strNameRus,[]) then begin
        ds.Append;
        ds.FieldByName('NAME').AsString:=Trim(strNameRus);
      end else begin
        ds.Edit;
      end;
      ds.FieldByName('NAME_B').AsString:=strNameBel;
      ds.Post;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------
function TdmBase.CheckNameLat(var Pol : TPol; strNameRus: String; strNameLat:String): String;
var
  ds:TDataSet;
begin
  Result := '';
  if strNameLat='' then begin  // читаем значение
    if (Pol=tpNone) or (Pol=tpM) then begin
      if dmBase.SprNamesM.Locate('NAME',strNameRus,[]) then begin
        Result := dmBase.SprNamesM.FieldByName('NAME_E').AsString;
        Pol := tpM;
      end;
    end;
    if (Pol=tpNone) or (Pol=tpG) then begin
      if dmBase.SprNamesG.Locate('NAME',strNameRus,[]) then begin
        Result := dmBase.SprNamesG.FieldByName('NAME_E').AsString;
        Pol := tpG;
      end;
    end;
  end else begin             // пишем значение
    if (Pol=tpNone) then begin

    end else begin
      if (Pol=tpM)
        then ds:=dmBase.SprNamesM
        else ds:=dmBase.SprNamesG;
      if not ds.Locate('NAME',strNameRus,[]) then begin
        ds.Append;
        ds.FieldByName('NAME').AsString:=Trim(strNameRus);
      end else begin
        ds.Edit;
      end;
      ds.FieldByName('NAME_E').AsString:=strNameLat;
      ds.Post;
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------------
function TdmBase.CheckOtchBel(var Pol : TPol; strOtchRus: String; strPadeg:String): String;
begin
  Result := '';
  if (Pol=tpNone) or (Pol=tpM) then begin
    if dmBase.SprNamesM.Locate('SUBNAME_M',strOtchRus,[]) then begin
      Result := CheckBelI(dmBase.SprNamesM.FieldByName('SUBNAME_M_B').AsString);
      Pol := tpM;
    end;
  end;
  if (Pol=tpNone) or (Pol=tpG) then begin
    if dmBase.SprNamesM.Locate('SUBNAME_G',strOtchRus,[]) then begin
      Result := CheckBelI(dmBase.SprNamesM.FieldByName('SUBNAME_G_B').AsString);
      Pol := tpG;
    end;
  end;
  if LastSimIsLower(strOtchRus) then begin
    Result:=CheckRegisterText(EC_FIRST,Result);
  end else begin
    Result:=ANSIUpperCase(Result);
  end;
end;
//-------------------------------------------------------------------------------------------------------
function TdmBase.ReadDataSetFromMemo(ds: TDataSet; fldMemo: TField; lList : Boolean): Boolean;
var
  arr : TArrStrings;
  i,j : Integer;
  fld : TField;
  strValue : String;
begin
  Result := true;
  StrToArr(fldMemo.AsString, arr, Chr(13), true );
  if (ds.State<>dsEdit) and (ds.State<>dsInsert) then begin
    ds.Edit;
  end;
  for i:=Low(arr) to High(arr) do begin
    j := Pos('=', arr[i]);
    if j>0 then begin
      fld := ds.FindField(Trim(Copy(arr[i],1,j-1)));
      if fld<>nil then begin
        try
          strValue := Trim(Copy(arr[i],j+1,Length(arr[i])));
          if strValue<>'' then begin
            case fld.DataType of
              ftDate,ftTime,ftDateTime :
                 fld.AsDateTime := STOD(strValue, tdAds);
              ftInteger,ftWord,ftSmallint :
                 fld.AsInteger  := StrToInt(strValue);
              ftFloat,ftCurrency :
                 fld.AsFloat    := StrToFloat(strValue);
              ftBoolean :
                 fld.AsBoolean  := (strValue='1');
            else
              fld.AsString := strValue;
            end;
          end;
        except
//          fld.AsString := '';
        end;
      end;
    end;
  end;
  ds.Post;
end;

function TdmBase.WriteDataSetToMemo(ds: TDataSet; fldMemo: TField; lList : Boolean;
                strFieldNames : String): Boolean;
var
  i : Integer;
  strValue,s : String;
begin
  Result := true;
  strValue := '';
  for i:=0 to ds.FieldCount-1 do begin
    case ds.Fields[i].DataType of
      ftDate,ftTime,ftDateTime :
        s := DTOS(ds.Fields[i].AsDateTime, tdAds);
      ftBoolean :
        if ds.Fields[i].AsBoolean then s:='1' else s:='0';
    else
      s := ds.Fields[i].AsString;
    end;
    strValue := strValue + ds.Fields[i].FieldName + '=' + s + #13;
  end;
  fldMemo.AsString := strValue;
end;

function TdmBase.IsDirBase(strDir: String; nType: Integer): Boolean;
var
  Connect:TAdsConnection;
  sErr:String;
begin
  if FileExists(strDir) then begin
    Result := true;
  end else begin
    Result:=false;
    try
      GlobalTask.LogFile.WriteToLogFile('IsDirBase: Папка с базой  '+strDir+' недоступна');
    except
    end;
    if GlobalPar.PingBase and (stADS_REMOTE in GlobalPar.ServerTypes) then begin
      OpenMessage('Проверка подключения к базе ... ');
      Connect := TAdsConnection.Create(nil);
      sErr:='';
      try
        Connect.Name := 'TestConnectBaseTmp';
        Connect.ConnectPath := strDir;
        Connect.AdsServerTypes := GlobalPar.ServerTypes;
        Connect.CommunicationType := GlobalPar.CommunicationType;
        Connect.Password := SYSTEM_PASSWORD;
        Connect.Username := SYSTEM_USER;
        Connect.LoginPrompt := false;
        Result:=true;
        try
          Connect.IsConnected:=true;
        except
          on E: Exception do begin
            Result:=false;
            sErr:=E.Message;
          end;
        end;
      finally
        CloseMessage;
        if Connect.IsConnected then Connect.IsConnected:=false;
        Connect.Free;
      end;
      try
       if Result
         then GlobalTask.LogFile.WriteToLogFile('IsDirBase: Папка с базой  '+strDir+' соединение установлено')
         else GlobalTask.LogFile.WriteToLogFile('IsDirBase: Папка с базой  '+strDir+' ошибка соединения '+sErr);
      except
      end;
    end;
  {
    Result := true;
    try
      try
        AdsConnection.ConnectPath:=strDir;
        AdsConnection.IsConnected:=true;
      except
        Result:=false;
      end;
    finally
      if AdsConnection.IsConnected
        then AdsConnection.IsConnected:=false;
    end;
    }
  end;
end;

function TdmBase.ProcessDatabaseError: Boolean;
var
  strDir, strPath : String;
begin
  Result := false;
  strPath := ANSIUpperCase(CheckSleshN(ExtractFilePath(Application.ExeName)));
  if LastDatabaseError = -1 then begin // AdsConnection.ConnectPath не найден
    if Problem('  Не найден путь подключения к базе данных. Установите его самостоятельно ? ') then begin
       if SelectDirectory('Путь к базе данных', '', strDir) then begin
         GlobalPar.ConnectPath     := CheckSleshN(strDir) + NAME_DICT;
         AdsConnection.ConnectPath := GlobalPar.ConnectPath;
         if Pos(strPath, ANSIUpperCase(GlobalPar.ConnectPath)) > 0 then begin
           GlobalPar.RelConnectPath  := Copy(GlobalPar.ConnectPath,Length(strPath)+1,Length(GlobalPar.ConnectPath));
         end else begin
           GlobalPar.RelConnectPath  := GlobalPar.ConnectPath;
         end;
         Result := true;
       end;
    end;
  end else if  LastDatabaseError = -2 then begin // AdsSharedConnection.ConnectPath не найден
    if Problem('  Не найден путь подключения к системным справочникам. Установите его самостоятельно ? ') then begin
       if SelectDirectory('Путь к базе данных', '', strDir) then begin
         GlobalPar.SharedConnectPath     := CheckSleshN(strDir) + 'SysSpr.add';
         AdsSharedConnection.ConnectPath := GlobalPar.SharedConnectPath;
         if Pos(strPath, ANSIUpperCase(GlobalPar.SharedConnectPath)) > 0 then begin
           GlobalPar.RelSharedConnectPath  := Copy(GlobalPar.SharedConnectPath,Length(strPath)+1,Length(GlobalPar.SharedConnectPath));
         end else begin
           GlobalPar.RelSharedConnectPath  := GlobalPar.SharedConnectPath;
         end;
         Result := true;
       end;
    end;
  end;
end;

function TdmBase.SetNameFileParamTask: Boolean;
begin
  // присвоим значение для файла параметров в функции CheckPathBase см. ниже
  Result := true;
//  GlobalTask.PathParam := CheckSleshN(CheckSleshN(ExtractFilePath(Application.ExeName))+'SERVICE');
  {$IFDEF ZAGS}
//    GlobalTask.NameFileTaskParameters := 'ParamZags.tsk';
  {$ELSE}
//    GlobalTask.NameFileTaskParameters := 'Parameters.tsk';
  {$ENDIF}
end;
//--------------------------------------------------------------------------------------
function TdmBase.SelectDirMainComp(sProg:String; var strDir:String) : Boolean;
var
  f:TfmChDir;
begin
  Result:=false;
//  strDir:='';
  {
  if SelectDirectory('Выберите папку с программой "'+sProg+'" на главном компьютере', '', strDir) then begin
    Result:=true;
  end;
  }
  f:=TfmChDir.Create(nil);
  f.SetParams(strDir, sProg, 0, '', nil);
  if f.ShowModal=mrOk then begin
    strDir:=f.GetValue;
    Result:=true;
  end;
  f.Free;
end;
//--------------------------------------------------------------------------------------
function TdmBase.CheckPathBase : Boolean;
var
 s,s0,s1,s2,ss,sss : String;
 lExit, lWrite, lReadIP, lLocal : Boolean;
 strPath, strDir : String;
 strMainVersion,strVErsion, sFile : String;
 MainINI, AdsINI : TSasaIniFile;
 strIP, strPORT, strNameComp : String;
 arr : TArrStrings;
 i,nVersion,nMainVersion : Integer;
begin
  Result := true;
  strPath := ANSIUpperCase(CheckSleshN(ExtractFilePath(Application.ExeName)));
  s:=dmBase.IniSysParams.ReadString('ADMIN','MAINCOMP', '1');
  if s='1' then begin
    if not dmBase.IsDirBase( dmBase.GlobalPar.ConnectPath, 0 ) then begin
      s0 := 'Data\'+NAME_DICT;
      s1 := 'Spr\SysSpr.add';
      s2 := 'Service';
      GlobalPar.RelConnectPath := s0;
      GlobalPar.RelSharedConnectPath := s1;
      GlobalTask.PathParam := s2;
      dmBase.IniSysParams.WriteString('PATH','CONNECT', GlobalPar.RelConnectPath);
      dmBase.IniSysParams.WriteString('PATH','SHARED_CONNECT', GlobalPar.RelSharedConnectPath);
      dmBase.IniSysParams.WriteString('PATH','GLOBAL_PARAM', GlobalTask.PathParam);
      dmBase.IniSysParams.UpdateFile;
      GlobalPar.ConnectPath := s0;
      GlobalPar.SharedConnectPath := s1;
      AdsConnection.ConnectPath := GlobalPar.ConnectPath;
      AdsSharedConnection.ConnectPath := GlobalPar.SharedConnectPath;
    end;
  end else begin
    if not dmBase.IsDirBase( dmBase.GlobalPar.ConnectPath, 0 ) then begin
      lExit := false;
      while not lExit do begin
        {$IFDEF ZAGS}
          s:='ЗАГС';
        {$ENDIF}
        {$IFDEF OCHERED}
          s:='Очередники';
        {$ENDIF}
        {$IFDEF LAIS}
          s:='ЛАИС+';
        {$ENDIF}
        {$IFDEF GKH}
          s:='ЖКХ';
        {$ENDIF}
        {$IFDEF POST}
          s:='ЛАИС.СМДО';
        {$ENDIF}

        strDir:=ExtractFilePath(dmBase.GlobalPar.ConnectPath);
        if SelectDirMainComp(s, strDir) then begin
//        if SelectDirectory('Выберите папку с программой "'+s+'" на главном компьютере', '', strDir) then begin
          strDir:=CheckSleshN(strDir);
          s0 := strDir + 'Data\'+NAME_DICT;  // а если база не там
          s1 := strDir + 'Spr\SysSpr.add';
          s2 := strDir + 'Service';
          if dmBase.IsDirBase( s0, 0 ) then begin
            if Pos(strPath, ANSIUpperCase(s0) ) > 0 then begin
              GlobalPar.RelConnectPath       := Copy(s0,Length(strPath)+1,Length(s0) );
              GlobalPar.RelSharedConnectPath := Copy(s1,Length(strPath)+1,Length(s1) );
              GlobalTask.PathParam := Copy(s2,Length(strPath)+1,Length(s2) );
            end else begin
              GlobalPar.RelConnectPath := s0;
              GlobalPar.RelSharedConnectPath := s1;
              GlobalTask.PathParam := s2;
            end;
            dmBase.IniSysParams.WriteString('PATH','CONNECT', GlobalPar.RelConnectPath);
            dmBase.IniSysParams.WriteString('PATH','SHARED_CONNECT', GlobalPar.RelSharedConnectPath);
            dmBase.IniSysParams.WriteString('PATH','GLOBAL_PARAM', GlobalTask.PathParam);
            dmBase.IniSysParams.UpdateFile;
            GlobalPar.ConnectPath := s0;
            GlobalPar.SharedConnectPath := s1;
            AdsConnection.ConnectPath := GlobalPar.ConnectPath;
            AdsSharedConnection.ConnectPath := GlobalPar.SharedConnectPath;
            lExit := true;
          end else begin
            PutError(' Выбранная папка не является програмной ! ');
          end;
        end else begin
        {
          if Problem('Найти базы в сети ?') then begin
            OpenMessage('Подождите пожалуйста...','',10);
            sl:=FindBase('', 'AutoBackup,Backup,AutoBackup2', true);
            if sl.Count=0 then begin
              PutError('Ничего не найдено.');
            end else begin
              i:=ChoiceFromList(sl,'Выберите базу');
            end;
            sl.Free;
          end else begin
        }
            Result := false;
            lExit := true;
//          end;
        end;
      end;
    end;
    if Result then begin
      strDir := GlobalPar.ConnectPath;
      //--- версию программы с головного компьютера -----------------------------
      if FileExists(strDir)  then begin  // !!! доступен по сети файл словаря главного компьютера !!!
        i := LastPos('\Data\',strDir);
        strDir := Copy(strDir,1,i);
        {$IFNDEF DEBUG}
        if FileExists(strDir+'version') then begin
          if MemoRead(strDir+'version', strMainVersion) then begin
            if strMainVersion<>'' then begin
              strVersion := GetVersionProgram;
              try
                nVersion     := StrToInt(StringReplace(strVersion,'.','',[rfReplaceAll]));
                nMainVersion := StrToInt(StringReplace(strMainVersion,'.','',[rfReplaceAll]));
              except
                nVersion     := 0;
                nMainVersion := 0;
              end;
              if nMainVersion>nVersion then begin
                PutError('ВНИМАНИЕ: Необходима установка обновления!'+Chr(13)+
                         'Версия программы <'+strVersion+'> не совпадает с версией <'+strMainVersion+'>'+Chr(13)+
                         'на главном комьютере.');
                if FileExists(strDir+'LastUpdate\LastUpdate.exe') then begin
                  if Problem('Запустить установку обновления с главного компьютера ?') then begin
                    WinExec(PAnsiChar(strDir+'LastUpdate\LastUpdate.exe'),SW_NORMAL);
                  end;
                end;
                Result := false;
              end else if nMainVersion<nVersion then begin
                PutError('ВНИМАНИЕ: Необходима установка обновления на ГЛАВНОМ компьютере !'+Chr(13)+
                         'Версия программы <'+strVersion+'> не совпадает с версией <'+strMainVersion+'>'+Chr(13)+
                         'на главном комьютере.');
                Result := false;
              end;
            end;
          end;
        end;
        {$ENDIF}
        //--- прочитаем тип сервера с головного компьютера -----------------------------
        if Result then begin
          try
            strNameComp := GetNameComp(strDir);

            s:=Trim(dmBase.IniSysParams.ReadString('ADMIN','COPY_SHABLON', ''));
            if (s='') or (s='1') then begin
              {$IFDEF ZAGS}
              if FileExists(strDir+'talon_dop.doc') then begin
                CopyFile(PChar(strDir+'talon_dop.doc'), PChar(NameFromExe('talon_dop.doc')),false);
              end;
              {$ENDIF}
              if FileExists(strDir+'shtamp.doc') then begin
                CopyFile(PChar(strDir+'shtamp.doc'), PChar(NameFromExe('shtamp.doc')),false);
              end;
              if FileExists(strDir+'shtamp-bel.doc') then begin
                CopyFile(PChar(strDir+'shtamp-bel.doc'), PChar(NameFromExe('shtamp-bel.doc')),false);
              end;
              if FileExists(strDir+'shtamp_gerb.doc') then begin
                CopyFile(PChar(strDir+'shtamp_gerb.doc'), PChar(NameFromExe('shtamp_gerb.doc')),false);
              end;
            end;
            sFile:=strDir+'SysParams.ini';
            if not FileExists(sFile) then begin
              ss:='Невозможно прочитать файл системных параметров '+sFile;
              GlobalTask.WriteToLogFile(ss);
              PutError(ss);
            end;
            MainINI:=TSasaIniFile.Create(sFile);
            ss:=MainINI.ReadString('ADMIN','SERVERTYPES', 'LOCAL');
            if Pos('LOCAL',ss)>0
              then lLocal:=true
              else lLocal:=false;
            sss := UpperCase(Copy(MainINI.ReadString('ADMIN','COMMUNICATION', 'DEFAULT'),1,3));
            strIP   := MainINI.ReadString('SERVER','LAN_IP', '');
            strPORT := MainINI.ReadString('SERVER','LAN_PORT', '');
            lReadIP := MainINI.ReadBool('ADMIN','READ_IP', true);   // читать IP сервера с главного компьютера
            MainINI.Free;
            GlobalPar.ServerTypes:=[];
            StrToArr(ss,arr,',',true);
            for i:=Low(arr) to High(arr) do begin
              s := ANSIUpperCase(Trim(arr[i]));
              if s = 'LOCAL' then begin
                GlobalPar.ServerTypes := GlobalPar.ServerTypes + [stADS_LOCAL];
              end else if s = 'REMOTE' then begin
                GlobalPar.ServerTypes := GlobalPar.ServerTypes + [stADS_REMOTE];
              end else if s = 'INTERNET' then begin
                GlobalPar.ServerTypes := GlobalPar.ServerTypes + [stADS_AIS];
              end;
            end;
            s := sss;
            if s='DEF' then begin
              GlobalPar.CommunicationType := ctAdsDefault;
              s := 'DEFAULT';
            end else if s='TCP' then begin
              GlobalPar.CommunicationType := ctAdsTCPIP;
              s := 'TCPIP';
            end else if s='UDP' then begin
              GlobalPar.CommunicationType := ctAdsUDPIP;
              s := 'UDPIP';
            end else if s='IPX' then begin
              GlobalPar.CommunicationType := ctAdsIPX;
              s := 'IPX';
            end else begin
              GlobalPar.CommunicationType := ctAdsDefault;
              s := 'DEFAULT';
            end;
     
            dmBase.IniSysParams.WriteString('ADMIN','SERVERTYPES', ss);
            dmBase.IniSysParams.WriteString('ADMIN','COMMUNICATION', s);
            dmBase.IniSysParams.UpdateFile;
    //        if (strNameComp='') then begin
    //        end;
     
            if not lReadIP then DeleteFile(NameFromExe('ads.ini'));  // работаем без статического IP

            if (strNameComp<>'') and lReadIP then begin
              // откроем файл ads.ini
              AdsINI := TSasaIniFile.Create(NameFromExe('ads.ini'));
              lWrite := false;
              if (strIP<>'') and (strPORT<>'') and not lLocal then begin  // если работает сервер (REMOTE)
                ss      := AdsINI.ReadString(strNameComp,'LAN_IP', '');
                sss     := AdsINI.ReadString(strNameComp,'LAN_PORT', '');;
                // включен контроль проверки IP-адреса (по-умолчанию)
                if dmBase.IniSysParams.ReadString('ADMIN','CHECK_IP', '1')='1' then begin
                  // значения изменились
                  if (strIP<>ss) or (strPort<>sss) then begin
                    AdsINI.WriteString(strNameComp,'LAN_IP',strIP);
                    AdsINI.WriteString(strNameComp,'LAN_PORT',strPort);
                    lWrite := true;
                    if Result then
                      ShowMessage('Необходимо перезапустить программу.')
                  end;
                end else begin
                  if (strPort<>sss) then begin
                    AdsINI.WriteString(strNameComp,'LAN_PORT',strPort);
                    lWrite := true;
                    if Result then
                      ShowMessage('Необходимо перезапустить программу.')
                  end;
                end;
              end else begin  // если локальное (Advantage Local) подключение
                AdsINI.EraseSection(strNameComp);
                lWrite := true;
              end;
              if lWrite then begin
                AdsINI.UpdateFile;
              end;
              AdsINI.Free;
            end;
          except
          end;
        end;
        //--------------------------------
      end;
    end;
  end;
  if Result then begin
    GlobalTask.NameFileTaskParameters := NameFile_Params;   // define uTypes.pas
  end;
end;

//--------------------------------------------------------------------------------------
function TdmBase.LoadLichSchet(strSourceConnect: String): Boolean;
{$IFNDEF ZAGS}
var
  Connect : TAdsConnection;
  tb : TAdsTable;
  q : TAdsQuery;
  lErr,lDeleteDir,lCloseBase : Boolean;
  slTables : TStringList;
  strCurVer, strNewVer, strPath : String;
  i : Integer;
{$ENDIF}
begin
{$IFNDEF ZAGS}
  if not IsFullPath(AdsConnection.ConnectPath) then begin
    strPath := CheckSleshN(ExtractFilePath(Application.ExeName))+AdsConnection.ConnectPath;
  end;
  if ANSIUpperCase(strPath)=ANSIUpperCase(strSourceConnect) then begin
    Result := false;
    PutError('  Нельзя загрузить базу саму в себя !  ');
    exit;
  end;
  lCloseBase:=false;
  lErr := false;
  Connect := TAdsConnection.Create(nil);
  Connect.Name := 'RepConnect';
  Connect.ConnectPath := strSourceConnect;
  Connect.AdsServerTypes := AdsConnection.AdsServerTypes;
  Connect.CommunicationType := AdsConnection.CommunicationType;

  Connect.Password := SYSTEM_PASSWORD;
  Connect.Username := SYSTEM_USER;

  Connect.LoginPrompt := false;
  tb := TAdsTable.Create(nil);
  tb.DatabaseName := 'RepConnect';
  tb.AdsTableOptions.AdsCharType := dmBase.tbLich.AdsTableOptions.AdsCharType;
  tb.TableType := dmBase.tbLich.TableType;
  q := TAdsQuery.Create(nil);
  q.DatabaseName := 'RepConnect';
  q.AdsTableOptions.AdsCharType := dmBase.tbLich.AdsTableOptions.AdsCharType;
  q.SourceTableType := dmBase.tbLich.TableType;
  if not lErr then begin
    try
      Connect.Connect;
    except
      lErr := true;
    end;
  end;
  if lErr then begin
    PutError(' Ошибка подключения к загружаемой базе! ');
  end else begin
    AdsConnection.CloseCachedTables;
    dmBase.CloseBase;
    lCloseBase:=true;
    AdsConnection.UserName := SYSTEM_USER;
    AdsConnection.Password := SYSTEM_PASSWORD;
    AdsConnection.Connect;
    dmBase.WorkQuery.SQL.Text := 'SELECT Trim(CONVERT(Version_Major,SQL_CHAR))+'+
          QStr('.')+'+Trim(CONVERT(Version_Minor,SQL_CHAR)) FROM '+SysQuery('system.dictionary');
    WorkQuery.Open;
    strCurVer := WorkQuery.Fields[0].AsString;
    WorkQuery.Close;
    q.SQL.Text := 'SELECT Trim(CONVERT(Version_Major,SQL_CHAR))+'+
                  QStr('.')+'+Trim(CONVERT(Version_Minor,SQL_CHAR)) FROM '+SysQuery('system.dictionary');
    q.Open;
    strNewVer := q.Fields[0].AsString;
    q.Close;
    if strCurVer<>strNewVer then begin
      lErr := true;
      Beep;
      PutError(' Версии новой и текущей базы не совпадают ! ');
    end;
//    if not lErr then begin
//      if Connect.ConnectPath=AdsConnection.ConnectPath then begin
//        lErr := true;
//        Beep;
//        PutError(' По выбранному пути расположена текущая база ! ');
//      end;
//    end;
  end;
  lDeleteDir := false;
  if not lErr and OkWarning('') then begin
    slTables := TStringList.Create;
    //-------- копирование файлов --------------------------
    slTables.CommaText := '"СозданиеОбъекта","ЛицевыеСчета","ЛицевыеСчетаПризнаки",'+
     '"Ochered","VUS","Население","НаселениеДоп","НаселениеПризнаки","НаселениеДвижение","НаселениеЛьготы","Dokuments","Nalogi",'+
     '"БазаДомов","БазаСтрок","БазаСвойствОбъектов","HouseOwners","HouseProps",'+
//     '"SprKomiss","SprOsobOtm","SprOwners","SprPropHouse","СпрЛьготников",'+
     '"SprKomiss","SprOsobOtm","SprPropHouse","СпрЛьготников",'+
     '"СпрГдеУчится","СпрДолжностей","СпрИстСуществования","СпрМатериалСтен","СпрМестРаботы",'+
     '"СпрНасПунктов","СпрОтношений","СпрПрЛицСчета","СпрПрНаселения","СпрПричинЛикв",'+
     '"СпрПричинСозд","СпрТипЖилья","СпрТипМиграции","СпрТипОбучения","СпрТипУлиц",'+
     '"СпрТиповПенсионеров","СпрУлиц","СпрУчЗаведений","SprPredst"';
    OpenMessage('Копирование информации ...         ','Копирование базы');
    {
    slTables.Clear;
    for i:=0 to slTables.Count-1 do begin
      ChangeMessage('Таблица '+slTables[i]+' ...');
      tb.Active := false;
      tb.TableName := slTables[i];
      tb.Active := true;
      WorkTable.Active    := false;
      WorkTable.TableName := slTables[i];
      WorkTable.Exclusive := true;
      WorkTable.Active    := true;
      WorkTable.EmptyTable;
      tb.AdsCopyTableContents( WorkTable );
      WorkTable.Close;
      WorkTable.Exclusive := false;
    end;
    }
    //-------- замена файлов --------------------------
    lDeleteDir := true;
    ReplaceTablesBase( strSourceConnect, slTables);

    CloseMessage;
//    AdsConnection.Execute('EXECUTE PROCEDURE sp_DropLink('+QStr('RepBase')+', TRUE);');
//    WorkQuery.SQL.Text := 'INSERT INTO  EXECUTE PROCEDURE sp_ZapTable('+QStr('СозданиеОбъекта')+')';
//    try
//      WorkQuery.ExecSQL;
//    except
//    end;
    slTables.Free;
    AdsConnection.Disconnect;
    Connect.DisConnect;
    tb.Active := false;
  end;
  if lCloseBase
    then dmBase.OpenBase;
  tb.Active := false;
  tb.Free;
  q.Active := false;
  q.Free;
  Connect.Free;
  if lDeleteDir then begin
    i := LastPos('\', strSourceConnect);
    strPath := Copy(strSourceConnect, 1, i);
    ClearDir(strPath,true);
  end;
  Result := not lErr;
{$ELSE}
  Result:=false;
{$ENDIF}
end;
//--------------------------------------------------------------------------------------
function TdmBase.IsAdsSys(strUser:String) : Boolean;
begin
  Result:=(ANSIUpperCase(strUser)=SYSTEM_USER)
end;
//--------------------------------------------------------------------------------------
function TdmBase.ReplaceTablesBase( strBaseName : String; sl : TStringList) : Boolean;
var
  DictSource    : TAdsDictionary;
  ConnectSource : TAdsConnection;
  i : Integer;
begin
  Result := true;
  DictSource := TAdsDictionary.Create(nil);
  with DictSource do begin
    AdsServerTypes := AdsConnection.AdsServerTypes;
    CommunicationType := AdsConnection.CommunicationType;
    ConnectPath := strBaseName;
    UserName := SYSTEM_USER;
    Password := SYSTEM_PASSWORD;
    LoginPrompt := false;
    IsConnected := true;
  end;
  ConnectSource := TAdsConnection.Create(nil);
  with ConnectSource do begin
    AdsServerTypes := AdsConnection.AdsServerTypes;
    CommunicationType := AdsConnection.CommunicationType;
    ConnectPath := strBaseName;
    UserName := SYSTEM_USER;
    Password := SYSTEM_PASSWORD;
    LoginPrompt := false;
    IsConnected := true;
  end;
  for i:=0 to sl.Count-1 do begin
    ChangeMessage('Таблица '+sl[i]+' ...');
    ReplaceOneTable(DictSource, ConnectSource, sl[i]);
  end;
  DictSource.Disconnect;
  ConnectSource.Disconnect;
  DictSource.Free;
  ConnectSource.Free;
end;

//--------------------------------------------------------------------------------------
function TdmBase.ReplaceOneTable(DictSource : TAdsDictionary; ConnectSource : TAdsConnection; strTableName: String): Boolean;
var
  i : Integer;
//  dsColumns : TDataSet;
  strAutoCreate,strPrimaryKey,strDefaultIndex,
  strPermissionLevel,strMemoBlockSize,
  strComment, strPath, strCurPath : String;
begin
  Result := true;
  i := LastPos('\', ConnectSource.ConnectPath);
  strPath := Copy(ConnectSource.ConnectPath, 1, i);
  i := LastPos('\', AdsConnection.ConnectPath);
  strCurPath := Copy(AdsConnection.ConnectPath, 1, i);
  {
  dsColumns := dbCreateMemTable('Name,Char,200;Field_Min_Value,Char,100;Field_Max_Value,Char,100;'+
            'Field_Can_Be_Null,Logical;Field_Default_Value,Char,100;Comment,Memo','');
  dsColumns.Open;
  WorkQuery.SQL.Text := 'select * from system.columns where parent='+QStr(strTableName);
  WorkQuery.Open;
  while not WorkQuery.Eof do begin
    dsColumns.Append;
    dsColumns.FieldByName('NAME').AsString := WorkQuery.FieldByName('NAME').AsString;
    dsColumns.FieldByName('Field_Min_Value').AsString := WorkQuery.FieldByName('Field_Min_Value').AsString;
    dsColumns.FieldByName('Field_Max_Value').AsString := WorkQuery.FieldByName('Field_Max_Value').AsString;
    dsColumns.FieldByName('Field_Can_Be_Null').AsString := WorkQuery.FieldByName('Field_Can_Be_Null').AsString;
    dsColumns.FieldByName('Field_Default_Value').AsString := WorkQuery.FieldByName('Field_Default_Value').AsString;
    dsColumns.FieldByName('Comment').AsString := WorkQuery.FieldByName('Comment').AsString;
    dsColumns.Post;
    WorkQuery.Next;
  end;
  }
  WorkQuery.SQL.Text := 'select * from '+SysQuery('system.tables')+' where name='+QStr(strTableName);
  WorkQuery.Open;
  strAutoCreate := WorkQuery.FieldByName('Table_Auto_Create').AsString;
  if strAutoCreate='1' then strAutoCreate:=QStr('True') else strAutoCreate:=QStr('False');
  strPrimaryKey := WorkQuery.FieldByName('Table_Primary_Key').AsString;
  strDefaultIndex := WorkQuery.FieldByName('Table_Default_Index').AsString;
//  strEncryption   := WorkQuery.FieldByName('Table_Encryption').AsString;
//  if strEncryption='1' then strEncryption:='True' else strEncryption:='False';
  strPermissionLevel := WorkQuery.FieldByName('Table_Permission_Level').AsString;
  strMemoBlockSize   := WorkQuery.FieldByName('Table_Memo_Block_Size').AsString;
  strComment := WorkQuery.FieldByName('Comment').AsString;
  WorkQuery.Close;
 // dsColumns.Free;

  AdsConnection.Execute('DROP TABLE '+strTableName);
  DictSource.RemoveTable(strTableName, false);
  if not CopyFile(PChar(strPath+strTableName+'.adt'), PChar(strCurPath+strTableName+'.adt'), true) then begin
    PutError('Ошибка копирования файла : '+strPath+strTableName+'.adt'+
        #13+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
  end;
  if FileExists(strPath+strTableName+'.adi') then begin
    CopyFile(PChar(strPath+strTableName+'.adi'), PChar(strCurPath+strTableName+'.adi'), true);
  end;
  if FileExists(strPath+strTableName+'.adm') then begin
    CopyFile(PChar(strPath+strTableName+'.adm'), PChar(strCurPath+strTableName+'.adm'), true);
  end;
  AdsConnection.Execute('EXECUTE PROCEDURE sp_AddTableToDatabase('+QStr(strTableName)+','+QStr(strTableName+'.adt')+',3,1,'+QStr('')+',NULL)');
  AdsConnection.Execute('EXECUTE PROCEDURE sp_ModifyTableProperty('+QStr(strTableName)+','+QStr('Table_Auto_Create')+','+strAutoCreate+','+QStr('APPEND_FAIL')+','+QStr(strTableName+'fail')+')');
  if strPrimaryKey<>'' then
    AdsConnection.Execute('EXECUTE PROCEDURE sp_ModifyTableProperty('+QStr(strTableName)+','+QStr('Table_Primary_Key')+','+QStr(strPrimaryKey)+','+QStr('APPEND_FAIL')+','+QStr(strTableName+'fail')+')');
  if strDefaultIndex<>'' then
    AdsConnection.Execute('EXECUTE PROCEDURE sp_ModifyTableProperty('+QStr(strTableName)+','+QStr('Table_Default_Index')+','+QStr(strDefaultIndex)+','+QStr('APPEND_FAIL')+','+QStr(strTableName+'fail')+')');
  if strPermissionLevel<>'' then
    AdsConnection.Execute('EXECUTE PROCEDURE sp_ModifyTableProperty('+QStr(strTableName)+','+QStr('Table_Permission_Level')+','+QStr(strPermissionLevel)+','+QStr('APPEND_FAIL')+','+QStr(strTableName+'fail')+')');
  if strMemoBlockSize<>'' then
    AdsConnection.Execute('EXECUTE PROCEDURE sp_ModifyTableProperty('+QStr(strTableName)+','+QStr('Table_Memo_Block_Size')+','+QStr(strMemoBlockSize)+','+QStr('APPEND_FAIL')+','+QStr(strTableName+'fail')+')');
  if strComment<>'' then
    AdsConnection.Execute('EXECUTE PROCEDURE sp_ModifyTableProperty('+QStr(strTableName)+','+QStr('Comment')+','+QStr(strComment)+','+QStr('APPEND_FAIL')+','+QStr(strTableName+'fail')+')');
end;

//--------------------------------------------------------------------------------------
function TdmBase.AdresOwner(DateFiks: TDateTime; strID: String; nType: Integer;  var strName : String; var lPropis : Boolean): String;
var
  adr : TAdres;
  s,ss : String;
begin
  lPropis := true;
  if (strID <> '') and (nType <> 0) then begin
    Result := 'не найден';
    if nType = OWNER_NASEL then begin  // мой человек
      adr := AdresMen(DateFiks, strID, s, false, true);
      Result := adr.PunktUlica;
      ss:=getDomKorpKv(adr);
      if ss<>'' then Result:=Result+', '+ss;
      strName := s;
      if not adr.Propis then begin
        lPropis := false;
        Result  := adr.AdresPropis;
      end;
    end else begin
      lPropis := false;
      if SprWork.Locate('ID',strID,[]) then begin
        Result  := SprWork.FieldByName('ADRES').AsString;
        strName := SprWork.FieldByName('NAME').AsString;
      end;
    end;
  end;
end;

//--------------------------------------------------------------------------------------
procedure TdmBase.CheckBelFamily(strFamilyR, strFamilyB: String);
begin
  if (strFamilyR<>'') and (strFamilyB<>'') then begin
    try
      SprFamily.IndexName := 'PR_KEY';
      strFamilyB:=CheckBelI(strFamilyB);
      if not SprFamily.FindKey([Trim(strFamilyR)]) then begin
        SprFamily.Append;
        SprFamily.FieldByName('FAMILIA_R').AsString := Trim(strFamilyR);
        SprFamily.FieldByName('FAMILIA_B').AsString := strFamilyB;
        SprFamily.Post;
      end else begin;
        if SprFamily.FieldByName('FAMILIA_B').AsString <> strFamilyB then begin
          SprFamily.Edit;
          SprFamily.FieldByName('FAMILIA_B').AsString := strFamilyB;
          SprFamily.Post;
        end;
      end;
    except
      on E:Exception do GlobalTask.LogFile.WriteToLogFile(FormatDateTime('dd.mm.yyyy hh:mm ',dmBase.getCurDate)+E.Message);
    end;
  end;
end;

//--------------------------------------------------------------------------------------
procedure TdmBase.CheckLatFamily(strFamilyR, strFamilyL: String);
begin
  if (strFamilyR<>'') and (strFamilyL<>'') then begin
    SprFamily.IndexName := 'PR_KEY';
    if not SprFamily.FindKey([Trim(strFamilyR)]) then begin
      SprFamily.Append;
      SprFamily.FieldByName('FAMILIA_R').AsString := Trim(strFamilyR);
      SprFamily.FieldByName('FAMILIA_E').AsString := strFamilyL;
      SprFamily.Post;
    end else begin;
      if SprFamily.FieldByName('FAMILIA_E').AsString <> strFamilyL then begin
        SprFamily.Edit;
        SprFamily.FieldByName('FAMILIA_E').AsString := strFamilyL;
        SprFamily.Post;
      end;
    end;
  end;
end;

//--------------------------------------------------------------------------------------
function TdmBase.GetBelFamily(strFamilyR: String; strPadeg:String): String;
begin
  Result := '';
  if (strFamilyR<>'') then begin
    SprFamily.IndexName := 'PR_KEY';
    if SprFamily.FindKey([Trim(strFamilyR)]) then begin
      Result := CheckBelI(SprFamily.FieldByName('FAMILIA_B'+strPadeg).AsString);
      if LastSimIsLower(strFamilyR) then begin
        Result:=CheckRegisterText(EC_FIRST,Result);
      end else begin
        Result:=ANSIUpperCase(Result);
      end;
    end;
  end;
end;

//--------------------------------------------------------------------------------------
function TdmBase.GetLatFamily(strFamilyR: String): String;
begin
  Result := '';
  if (strFamilyR<>'') then begin
    SprFamily.IndexName := 'PR_KEY';
    if SprFamily.FindKey([Trim(strFamilyR)]) then begin
      Result := SprFamily.FieldByName('FAMILIA_E').AsString;
    end;
  end;
end;

//--------------------------------------------------------------------------------------
procedure TdmBase.CheckBelNazv(nType : Integer; lSelect : Boolean; strNazvR, strNazvB: String );
var
  strFindR, strFindB : String;
  strOboznR, strOboznB, s, sr, sb : String;
  n,m:Integer;
begin
  strNazvR:=Trim(strNazvR);
  strNazvB:=Trim(strNazvB);
  if (strNazvR<>'') and (strNazvB<>'') then begin
    SprPerevod.IndexName := 'PR_KEY';
    strOboznR := '';
    strOboznB := '';
    s:=strNazvR;

//---------------------------------------------------------------------
//   контроль слова  ОБЛАСТЬ  ВОБЛАСЦЬ  для nType=1
//   контроль слова  РАЙОН    РАЁН      для nType=2
    sr:=ANSIUpperCase(s);
    sb:=ANSIUpperCase(strNazvB);
    if nType=1 then begin
      n:=Pos(' ОБЛАСТЬ', sr);
      m:=Pos(' ВОБЛАСЦЬ', sb);
      if (n>0) and (m>0) and (Length(sr)=n+7) and (Length(sb)=m+8) then begin
        s:=Copy(s,1,n-1);
        strNazvB:=Copy(strNazvB,1,m-1);
      end;
    end else if nType=2 then begin
      n:=Pos(' РАЙОН', sr);
      m:=Pos(' РАЁН', sb);
      if (n>0) and (m>0) and (Length(sr)=n+5) and (Length(sb)=m+4) then begin
        s:=Copy(s,1,n-1);
        strNazvB:=Copy(strNazvB,1,m-1);
      end;
    end;
//---------------------------------------------------------------------

    if lSelect then begin
      CheckObozn(s, strOboznR, strFindR);
      strFindB := Trim(strNazvB);
//      CheckObozn(Trim(strNazvB), strOboznB, strFindB);
    end else begin
      strFindR := s;
      strFindB := Trim(strNazvB);
    end;
    if not SprPerevod.FindKey([nType,strFindR]) then begin

      SetReloadMRUName(nType,false);  // см. uProject.pas: GetMRUName()

      SprPerevod.Append;
      SprPerevod.FieldByName('TIP').AsInteger    := nType;
      SprPerevod.FieldByName('R_OBOZN').AsString := strOboznR;
      SprPerevod.FieldByName('R_NAME').AsString  := strFindR;
      SprPerevod.FieldByName('B_OBOZN').AsString := strOboznB;
      SprPerevod.FieldByName('B_NAME').AsString  := strFindB;
      SprPerevod.Post;
    end else begin;
      // если не отключено автоматическое обновление
      if SprPerevod.FieldByName('NOTCHANGE').IsNull or (SprPerevod.FieldByName('NOTCHANGE').AsBoolean=false) then begin
        if SprPerevod.FieldByName('B_NAME').AsString <> strNazvB then begin
          SprPerevod.Edit;
          SprPerevod.FieldByName('B_OBOZN').AsString := strOboznB;
          SprPerevod.FieldByName('B_NAME').AsString  := strFindB;
          SprPerevod.Post;
        end;
      end;
    end;
  end;
end;

//--------------------------------------------------------------------------------------
procedure TdmBase.CheckNazv(nType : Integer; lSelect : Boolean; strNazv : String );
var
  strFindR, strOboznR, s, sr: String;
  n:Integer;
begin
  if (Trim(strNazv)<>'') then begin
    s := Trim(strNazv);

//---------------------------------------------------------------------
//   контроль слова  ОБЛАСТЬ  ВОБЛАСЦЬ  для nType=1
//   контроль слова  РАЙОН    РАЁН      для nType=2
    sr:=ANSIUpperCase(s);
    if nType=1 then begin
      n:=Pos(' ОБЛАСТЬ', sr);
      if (n>0) and (Length(sr)=n+7) then begin
        s:=Copy(s,1,n-1);
      end;
    end else if nType=2 then begin
      n:=Pos(' РАЙОН', sr);
      if (n>0) and (Length(sr)=n+5) then begin
        s:=Copy(s,1,n-1);
      end;
    end;
//---------------------------------------------------------------------

    SprPerevod.IndexName := 'PR_KEY';
    strOboznR := '';
    if lSelect then begin
      CheckObozn(s, strOboznR, strFindR);
    end else begin
      strFindR := s;
    end;
    if not SprPerevod.FindKey([nType,strFindR]) then begin

      SetReloadMRUName(nType,false);  // см. uProject.pas: GetMRUName()

      SprPerevod.Append;
      SprPerevod.FieldByName('TIP').AsInteger    := nType;
      SprPerevod.FieldByName('R_OBOZN').AsString := strOboznR;
      SprPerevod.FieldByName('R_NAME').AsString  := strFindR;
      SprPerevod.FieldByName('B_OBOZN').AsString := '';
      SprPerevod.FieldByName('B_NAME').AsString  := '';
      SprPerevod.Post;
    end;
  end;
end;

//--------------------------------------------------------------------------------------
function TdmBase.GetRusNazv(nType : Integer; lSelect : Boolean; strNazvB: String): String;
begin
  Result:=GetLangNazv(nType, lSelect, strNazvB, 'B', true);
end;
//--------------------------------------------------------------------------------------
function TdmBase.GetBelNazv(nType : Integer; lSelect : Boolean; strNazvR: String): String;
begin
  Result:=GetLangNazv(nType, lSelect, strNazvR, '', true);
end;
//--------------------------------------------------------------------------------------
function TdmBase.GetLangNazv(nType : Integer; lSelect : Boolean; strNazv: String; sLang:String; lSeekAte:Boolean): String;
var
  sOb, sget, sGetATE, sKey, sKeyATE, strFindR, strOboznR, s, oldInd : String;
begin     
  Result := '';
  if (strNazv<>'') then begin
    s := Trim(strNazv);
    if lSelect then begin
      CheckObozn(s, strOboznR, strFindR);
    end else begin
      strFindR := s;
    end;
    if (sLang='B') or (sLang='Б') then begin
      sOb:='OBOZN';
      sGet:='R_NAME';
      sKey:='BEL_KEY';
      sKeyATE:='KEY_NAMEB';
      sGetATE:='NAME';
    end else begin
      sOb:='B_OBOZN';
      sGet:='B_NAME';
      sKey:='PR_KEY';
      sKeyATE:='KEY_NAME';
      sGetATE:='NAME_B';
    end;                            
    if Result='' then begin
      SprPerevod.IndexName := sKey;
      if SprPerevod.FindKey([nType, strFindR]) then begin
        Result:=SprPerevod.FieldByName(sGet).AsString;
        if sGet='B_NAME' then Result:=CheckBelI(Result);
        if lSelect then begin
          if SprPerevod.FieldByName(sOb).AsString<>'' then
            Result := Trim(SprPerevod.FieldByName(sOb).AsString) + ' '+ Result;
        end;
        // возможно нужно перевести в верхний регистр  (последний символ в верхнем регистре)
        if not LastSimIsLower(strFindR) then begin
          Result:=ANSIUppercase(Result);
        end;
      end;
    end;

    //---- поиск в АТЕ ----------------------------------------------------------
    if lSeekATE and (Result='') and GlobalTask.ParamAsBoolean('NAMEB_ATE') and ATESys.Active then  begin
      oldInd:=ATESys.IndexName;
      ATESys.IndexName:=sKeyATE;
      try
        ATESys.SetRange([strFindR],[strFindR]);
        while not ATESys.Eof do begin
          if ATESys.FieldByName(sGetATE).AsString<>'' then begin
            Result:=CheckBelI(ATESys.FieldByName(sGetATE).AsString);
            if not LastSimIsLower(strFindR) then begin
              Result:=ANSIUppercase(Result);
            end;
            break;
          end;
          ATESys.Next;
        end;
      finally
        ATESys.CancelRange;
        ATESys.IndexName:=oldInd;
      end;
    end;
    //---------------------------------------------------------------------

  end;
end;

//-----------------------------------------------------------
// город имеет районы
//--------------------------------------------------------------------------------------
function TdmBase.GorodHaveRaion(strName : String) : Boolean;
begin
  if Pos( ANSIUpperCase(Trim(strName))+';', 'БРЕСТ;МИНСК;ГОМЕЛЬ;ВИТЕБСК;МОГИЛЕВ;МОГИЛЁВ;ГРОДНО;БОБРУЙСК;') > 0 then begin
    Result := true;
  end else begin
    Result := false;
  end;
end;

//--------------------------------------------------------------------------------------
function TdmBase.PunktIsGorod( strValue : String; nType : Integer) : Boolean;
var
  i,j : Integer;
  s : String;
begin
  Result:=false;
  if nType>0 then begin // если передан тип насю пункта
    if TypePunkt.Locate('ID',nType,[]) then begin
      try
        Result := TypePunkt.FieldByName('ISGOROD').AsBoolean
      except
      end;
    end;
  end else begin
    i:=Pos('.',strValue);
    j:=Pos(' ',strValue);
    if (j<i) and (j>0) then i:=j;
    j:=Pos(',',strValue);
    if (j<i) and (j>0) then i:=j;
    s:='';
    if i>0 then s:=Trim(Copy(strValue,1,i-1));
    if s<>'' then begin
      s:=s+';';
      if Pos(s,'г;гп;пгт;') >0 then begin
        Result := true;
      end;
    end;
  end;
end;

//--------------------------------------------------------------------------------------
// вернуть полное наименование нас. пункта если нет:  <г.>  <д.>   и прочее
//--------------------------------------------------------------------------------------
function TdmBase.NamePunkt(strValue : String; nType : Integer; strLang : String): String;
var
  lAdd : Boolean;
  i,j : Integer;
  s : String;
begin
  strValue:=Trim(strValue);
  Result := strValue;
  if nType=0 then begin
    exit;
  end;
  if strValue='' then begin
    exit;
  end;
  lAdd:=true;
  i:=Pos('.',strValue);
  j:=Pos(' ',strValue);
  if (j<i) and (j>0) then i:=j;
  j:=Pos(',',strValue);
  if (j<i) and (j>0) then i:=j;
  s:='';
  if i>0 then s:=Trim(Copy(strValue,1,i-1));
  if s<>'' then begin
    s:=s+';';
    if Pos(s,'д;г;х;п;гп;с;пгт;сан;кп;в;пп;нп;в\ч;ж\с;в/ч;ж/с;') >0 then begin
      lAdd := false;
    end;
  end;
  if lAdd  then begin
    if GetTypePunkt(IntToStr(nType),strLang,s) > 0 then begin
      Result:=s+' '+strValue;
//      if RightStr(s,1)='.'
//        then Result := s+''+strValue
//        else Result := s+' '+strValue;
    end;
  end;
end;

//--------------------------------------------------------------------------------------
// вернуть полное наименование нас. пункта если нет:  <г.>  <д.>   и прочее
// работает только для русского языка
//--------------------------------------------------------------------------------------
function TdmBase.GetFullNamePunkt(strValue : String; fldType : TField; strLang:String): String;
var
  lAdd : Boolean;
  i,j : Integer;
  s,sNameType : String;
//  lKrat:Boolean;
begin
  if (strLang<>'') and (Pos('.',strLang)>0) then begin
//    lKrat:=true;
    strLang:=StringReplace(strLang,'.','',[rfReplaceAll])
  end else begin
//    lKrat:=false;
  end;

  strValue:=Trim(strValue);
  Result := strValue;
  if fldType<>nil then begin
    if fldType.AsString='' then begin
      exit;
    end;
  end;
  if strValue='' then begin
    exit;
  end;
  lAdd:=true;
  i:=Pos('.',strValue);
  j:=Pos(' ',strValue);
  if i=0 then i:=j
         else if (j<i) and (j>0) then i:=j;
  j:=Pos(',',strValue);
  if i=0 then i:=j
         else if (j<i) and (j>0) then i:=j;
  s:='';
  if i>0 then s:=Trim(Copy(strValue,1,i-1));
  if s<>'' then begin
    s:=s+';';
    if Pos(s,'д;г;х;п;гп;с;аг;пгт;снп;раз;урочище;аул;порт;о.п;сан;кп;вг;сл;ст-ца;ст;в;пп;нп;в\ч;ж\с;в/ч;ж/с;') >0 then begin
      lAdd := false;
    end;
  end;
  if lAdd  then begin
    if fldType=nil then begin
      Result := 'г.'+chr(160)+strValue
    end else begin
      if fldType.IsNull or (fldType.AsString='') then begin
        Result := strValue;
      end else if fldType.DataType=ftBoolean then begin
        if fldType.AsBoolean=true then begin
          Result := 'г.'+chr(160)+strValue;
        end else begin
          Result := 'д.'+chr(160)+strValue;
        end;
      end else begin  // если тип нас. пункта чило
        GetTypePunkt( fldType.AsString,  strLang, sNameType);
        if sNameType<>'' then begin
          Result:=sNameType+chr(160)+strValue;
        end else begin
          Result:=strValue;
        end;
      end;
    end;
  end;
  Result:=CheckSpace(Result);
end;

//---------------------------------------------------------------------------------------------------------
//  DOC=ON_DOKUMENT;TYPE=ON_DOK_TYPE;SERIA=ON_DOK_SERIA;NOMER=ON_DOK_NOMER;DATE=ON_DOK_DATE;LICH=ON_IDENTIF;
//---------------------------------------------------------------------------------------------------------
function TdmBase.GetPasportAkt(strDataSet, strParam: String; nType : Integer; dsDok:TDataSet): TPassport;
var
  f : TfmSimpleD;
  ds : TDataSet;
  arr : TArrStrings;
  n,i : Integer;
  sType,sValue : String;
  lName : Boolean;
  lYesHist : Boolean;
  sHist : String;
begin
  f:=nil;
  if dsDok=nil then begin
    if (strDataSet='') or (AnsiUpperCase(strDataSet)='CURDOK') then begin
      f:=GetCurDok;
      ds:=f.Dokument;
    end else begin
      ds:=GetRecord_DataSet(strDataSet);
    end;
  end else begin
    ds:=dsDok;
  end;
  Result.UdostKod:=0;
  Result.Srok:=0;
  Result.Udost:='';
  if ds<>nil then begin
    lYesHist:=false;
    lName:=false;
    StrToArr(strParam,arr,';',false);
    for i:=0 to Length(arr)-1 do begin
      n:=Pos('=',arr[i]);
      if n>0 then begin
        sType:=ANSIUpperCase(Copy(arr[i],1,n-1));
        sValue:=Copy(arr[i],n+1,Length(arr[i]));
        if (nType>0) and (f<>nil) then begin
          sHist := f.GetHistValueField(sValue, 1);
          if sHist<>'' then lYesHist:=true;
        end else begin
          sHist:='';
        end;
        if sType='TYPE' then begin
          Result.UdostKod:=StrToIntDef(ds.FieldByName(sValue).AsString,0);
          Result.Udost:=GetNamePasport(Result.UdostKod);
          Result.UdostB:= GetNamePasport(Result.UdostKod,'Б');
        end else if sType='ORGAN_KOD' then begin
          Result.OrganKod:=ds.FieldByName(sValue).AsString;
        end else if (sType='ORGAN_NAME') or (Copy(sType,1,3)='DOC') or (Copy(sType,1,3)='DOK') then begin
          lName:=true;
          if sHist='' then Result.Organ:=ds.FieldByName(sValue).AsString
                      else Result.Organ:=sHist;
        end else if sType='SERIA' then begin
          if sHist='' then Result.Seria:=ds.FieldByName(sValue).AsString
                      else Result.Seria:=sHist;
        end else if sType='NOMER' then begin
          if sHist='' then Result.Nomer:=ds.FieldByName(sValue).AsString
                      else Result.Nomer:=sHist;
        end else if Copy(sType,1,3)='LIC' then begin
          if sHist='' then Result.LichNomer:=ds.FieldByName(sValue).AsString
                      else Result.LichNomer:=sHist;
        end else if sType='DATE' then begin
          if sHist<>'' then begin
            Result.Date:=0;
            Result.sDate:=sHist;
          end else begin
            if ds.FieldByName(sValue).IsNull then begin
              Result.Date:=0;
              Result.sDate:='';
            end else begin
              Result.Date:=ds.FieldByName(sValue).AsDateTime;
              Result.sDate:=FormatDateTime('dd.mm.yyyy', Result.Date );
            end;
          end;
        end;
      end;
    end;
    if (nType>0) and not lYesHist then begin
      Result.Udost:='';
      Result.UdostKod:=0;
      Result.Nomer:='';
      Result.Seria:='';
      Result.Organ:='';
      Result.LichNomer:='';
      Result.Date:=0;
      Result.sDate:='';
    end;
    if not lName and (Result.OrganKod<>'') then begin
       // дописать  ???
    end;
  end;
end;

//--------------------------------------------------------------------------------------
function TdmBase.GetRecord_DataSet(strDataSet : String) : TDataSet;
var
  s,sField,sValue : String;
  i,j : Integer;
  frxDataSet : TfrxDataSet;
begin
  sField:='';
  i:=Pos(';',strDataSet);
  if i=0 then begin   // если передано только имя DataSet   "fmZapisBrak.Dokument"
    if (UpperCase(Copy(strDataSet,1,4))='FRX.') then begin
      result:=nil;
      strDataSet:=Copy(strDataSet,5,Length(strDataSet));
    end else begin
      result:=GlobalSeekDataSet(strDataSet);
    end;
    if (result=nil) then begin
      frxDataSet:=fmMain.frxReport.GetDataset(strDataSet);
      if frxDataSet<>nil then begin
        if frxDataSet is TfrxADSQuery then begin
          Result:=TfrxADSQuery(frxDataSet).Query;
        end else if frxDataSet is TfrxADSTable then begin
          Result:=TfrxADSTable(frxDataSet).Table;
        end;
      end;
    end;
  end else begin     // если передано имя DataSet и значение для поиска "dmBase.tbZBrak;ID=3553" или "dmBase.tbZBrak;3553"
    s := Copy(strDataSet,i+1,Length(strDataSet));
    j:=Pos('=',s);
    if j=0 then begin
      sField:='ID';
      sValue:=s;
    end else begin
      sField:=Copy(s,1,j-1);
      sValue:=Copy(s,j+1,Length(s));
    end;
    Result := GlobalSeekDataSet(Copy(strDataSet,1,i-1));
  end;
  if Result<>nil then begin
    if sField<>'' then begin
      if not Result.Locate(sField,sValue,[]) then begin
        Result:=nil;
      end;
    end;
  end;
end;

//--------------------------------------------------------------------------------------
function TdmBase.CheckBooleanField(ds : TDataset; s : String) : Integer;
var
  fld : TField;
begin
  if s='' then begin
    Result := -2;
  end else begin
    fld := ds.FindField(s);
    if fld=nil then begin
      Result := -2;
    end else begin
      if fld.IsNull then begin
        Result := -1;
      end else if fld.AsBoolean then begin
        Result := 1;
      end else begin
        Result := 0;
      end;
    end;
  end;
end;

//--------------------------------------------------------------------------------------
//   последний вызов функции GetadresAkt вернул результат в верхнем регистре
//--------------------------------------------------------------------------------------
function TdmBase.AdresIsUpper:Boolean;
begin
  Result:=FLastAdresUpper;
end;

//------------------------------------------------
function TdmBase.Get_DomKorpKv_FromAkt(sUL:String; ds:TDataSet; s:String; sDelim:String; sCheck:string; lHist:Boolean):String;
var
  f : TfmSimpleD;
  sDom,sKorp,sKv,ss,sss:String;
  fld:TField;
  lFirst:Boolean;
begin
  if (s<>'') then begin
    f:=GetCurDok;
    Result:=CheckSpace(Trim(sUL));
    if Trim(sCheck)='' then sss:='' else sss:=' ';
    lFirst:=true;
    if (Length(s)>1) and (Copy(s,1,1)='*')
      then lFirst:=false;
    CharDel(s,'*');
    if lFirst then begin
      sDom:=s+'DOM';
      sKorp:=s+'KORP';
      sKv:=s+'KV';
    end else begin
      sDom:='DOM'+s;
      sKorp:='KORP'+s;
      sKv:='KV'+s;
    end;
    fld:=ds.FindField(sDom);
    if fld<>nil then begin
      if lHist then begin
        ss:=f.GetHistValueField(fld.FieldName,1);
      end else begin
        ss:=Trim(fld.AsString);
      end;
      if ss<>'' then begin
        if IsAllDigit(Copy(ss,1,1))
          then ss:=sss+sokrDom+ss    // если первый символ цифра
          else ss:=sss+ss;          // если первый символ не цифра
      end;
      if Result='' then Result:=ss else if ss<>'' then Result:=Result+sDelim+ss;
    end;
    fld:=ds.FindField(sKorp);
    if fld<>nil then begin
      if lHist then begin
        ss:=f.GetHistValueField(fld.FieldName,1);
      end else begin
        ss:=Trim(fld.AsString);
      end;
      if ss<>'' then begin
        if IsAllDigit(Copy(ss,1,1))
          then ss:=sss+sokrKorp+ss   // если первый символ цифра
          else ss:=sss+ss;           // если первый символ не цифра
      end;
      if Result='' then Result:=ss else if ss<>'' then Result:=Result+sDelim+ss;
    end;
    fld:=ds.FindField(sKv);
    if fld<>nil then begin
      if lHist then begin
        ss:=f.GetHistValueField(fld.FieldName,1);
      end else begin
        ss:=Trim(fld.AsString);
      end;
      if ss<>'' then begin
        if IsAllDigit(Copy(ss,1,1))
          then ss:=sss+sokrKv+ss    // если первый символ цифра
          else ss:=sss+ss           // если первый символ не цифра
      end;
      if Result='' then Result:=ss else if ss<>'' then Result:=Result+sDelim+ss;
    end;
    Result:=Trim(Result);
  end else begin
    Result:=Trim(sUL);
  end;
end;

//--------------------------------------------------------------------------------------
function TdmBase.GetAdresAkt(strDataSet, strParam: String; nType: Integer): String;
var
  f : TfmSimpleD;
  ds : TDataSet;
  arr,arrF : TArrStrings;
  n,i : Integer;
  strPar, ss, sss, strRn, strDelim, sType, sHist, ResultRaion, strLang : String;
  lYesHist, lHaveRaion, lUpper : Boolean;
begin
  // если город будет иметь районы
  lHaveRaion  := false;
  ResultRaion := '';

  Result := '';
  sType := Copy(PadLInt(nType,2,'0'),2,1);
  lYesHist := false;
  if sType='0'
    then strDelim := Chr(13)+Chr(10)
    else strDelim := ', ';
  f := GetCurDok;
  if (strDataSet='') or (AnsiUpperCase(strDataSet)='CURDOK') then begin
    ds:=f.Dokument;
  end else begin
    ds := GetRecord_DataSet(strDataSet);  //GlobalSeekDataSet(strDataSet);
  end;
  if ds<>nil then begin
    strLang:=CheckLangParam(strParam);
    if strLang='B'
      then strPar:='<B>'
      else strPar:='<R>';
    lUpper:=CheckUpperParam(strParam);
    StrToArr(strParam,arr,';',false);
    for i:=0 to Length(arr)-1 do begin
      sHist:='';
      if Trim(arr[i])<>'' then begin
        StrToArr( arr[i], arrF, ',', false );
        SetLength(arrF, 3);
        case i of
          // страна
          0 : begin
                if (arrF[0]<>'') and (arrF[1]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
                  if nType>9 then sHist := f.GetHistValueField(arrF[0], 1, strPar) else sHist:='';
                  if sHist='' then begin
                    if SprStran.Locate('ID',ds.FieldByName(arrF[0]).AsString,[]) then begin
                      Result := Result + SprStran.FieldByName(arrF[1]).AsString+strDelim;
                    end;
                  end else begin
                    lYesHist := true;
                    Result := Result + sHist+strDelim;
                  end;
                end;
              end;
          // область, край
          1 : begin
                if (arrF[0]<>'') then begin
                  ss:=Trim(ds.FieldByName(arrF[0]).AsString);
                  //------------------------------
                  if not LastSimIsLower(ss)
                    then lUpper:=true;
                  //------------------------------
                  if nType>9
                    then sHist:=f.GetHistValueField(arrF[0], 1)
                    else sHist:='';
                  if sHist='' then begin
                    if ss<>'' then begin
                      n:=CheckBooleanField(ds,arrF[1]);
                      ss:=dmBase.NameObl(ss,n,strLang);
                      Result := Result + ss + strDelim;
                    end;
                  end else begin
                    lYesHist := true;
                    if Copy(sHist,1,1)<>'-' then begin
                      if IsAddTypeObl(sHist) then begin  // !!!  проверка на необходимость добавления область,вобластць,край
                        n:=CheckBooleanField(ds,arrF[1]);
                        sHist:=dmBase.NameObl(sHist,n,strLang);
                      end;
                      Result := Result + sHist+strDelim;
                    end;
                  end;
                end;
              end;
          // район
          2 : begin
                strRn:='';
                sHist:='';
                if (arrF[1]<>'') then begin
                  if ds.FieldByName(arrF[1]).DataType=ftBoolean then begin  // тип райна "в городе" или как район в области
                    if not ds.FieldByName(arrF[1]).IsNull and (ds.FieldByName(arrF[1]).AsBoolean=false) then begin
                      // район в городе
                      lHaveRaion := true;
                    end;
                    strRn := TrimRight(ds.FieldByName(arrF[0]).AsString);
                  end else begin
                    strRn := TrimRight(ds.FieldByName(arrF[1]).AsString);
                    if strRn<>''
                      then lHaveRaion := true
                      else strRn := ds.FieldByName(arrF[0]).AsString;
                  end;
                end;
                if lHaveRaion then begin
                  // не включать в адрес имя района в городе
                  if arrF[2]='0' then begin
                    strRn:='';
                    lHaveRaion:=false;
                  end;
                end else begin
                  if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
                    strRn := TrimRight(ds.FieldByName(arrF[0]).AsString);
                  end;
                end;
                sss:=strRn;
                if nType>9 then begin
                  sHist:=f.GetHistValueField(arrF[0], 1);
                  if not LastSimIsLower(sHist) then lUpper:=true;
                  if sHist<>'' then sss:=sHist;
                end else begin
                  strRn:=Trim(strRn);
                  if not LastSimIsLower(strRn) then lUpper:=true;
                end;
                ss:=GetWordRAION(sss,strLang); //' район';       // слово район может и не добавляться
                //---- если район является продолжением облати -----
                if (ss='') and (strRn<>'') then Result:=Copy(Result,1,Length(Result)-Length(strDelim))+' ';  //!!!!   удаляем предыдущий разделитель
                //--------------------------------------------------

                if sHist='' then begin
                  if strRn<>'' then begin
                    if lHaveRaion then begin
                      ResultRaion := strRn + ss + strDelim;
                    end else begin
                      Result := Result + strRn + ss + strDelim;
                    end;
                  end;
                end else begin
                  lYesHist := true;
                  if Copy(sHist,1,1)<>'-' then begin   // типа не пустое значение
                    if lHaveRaion then begin
                      ResultRaion := sHist + ss + strDelim;
                    end else begin
                      Result := Result + sHist + ss + strDelim;
                    end;
                  end;
                end;
              end;
          // город,селение
          3 : begin
                if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
                  {  например для:  SM_GOROD;SM_B_GOROD;SM_TEXT  !!!
                  if (arrF[2]<>'') and (ds.FindField(arrF[1]).AsInteger=100)  then begin  =>  SM_TEXT<>'' and SM_B_GOROD=100
                    ss:=ds.FieldByName(arrF[2]).AsString;
                    if ss<>'' then begin
                      дописать
                    end;
                  end;
                  }
                  ss := ds.FieldByName(arrF[0]).AsString;
                  ss := GetFullNamePunkt(ss, ds.FindField(arrF[1]), strLang );
                  //------------------------------
                  if not LastSimIsLower(ss)
                    then lUpper:=true;
                  //------------------------------
                  if nType>9
// было                    then sHist := GetFullNamePunkt(f.GetHistValueField(arrF[0],1), ds.FindField(arrF[1]), strLang)
                    then sHist:=f.GetHistValueField(arrF[0],1)
                    else sHist:='';
                  if sHist='' then begin
                    Result := Result + ss + strDelim;
                  end else begin
                    lYesHist := true;
                    Result := Result + sHist + strDelim;
                  end;
                  if lHaveRaion and (ResultRaion<>'') then begin
                    if sHist='' then begin
                      Result := Result + ResultRaion;
                    end else begin
                      lYesHist := true;
                      Result := Result + ResultRaion;
                    end;
                  end;
                end;
              end;
          // место в населенном пункте
          4 : begin
                if (arrF[0]<>'') then begin
                  if nType>9 then begin  // история
                    sHist:=f.GetHistValueField(arrF[0], 1);
                    sHist:=Get_DomKorpKv_FromAkt(sHist, ds, arrF[1],',',Result, true);
                    if sHist<>'' then begin
                      lYesHist := true;
                      Result := Result + sHist + strDelim;
                    end else begin
                      Result := Result + Get_DomKorpKv_FromAkt( ds.FieldByName(arrF[0]).AsString, ds, arrF[1],',',Result, true) + strDelim;
                    end;
                  end else begin        // просто значение
                    ss:=Get_DomKorpKv_FromAkt( ds.FieldByName(arrF[0]).AsString, ds, arrF[1],',',Result, false);
                    if ss<>'' then
                      Result := Result + ss + strDelim;
                  end;
                end;
              end;
        end;
      end;
    end;
    if (nType>9) and not lYesHist then Result := '';
    FLastAdresUpper:=lUpper;
    if Result <> '' then begin
      if lUpper then Result:=ANSIUpperCase(Result);
      Result := Trim(Result);
      if Right(Result,1)=',' then begin
        Result := Copy(Result,1,Length(Result)-1);
      end;
      Result := StringReplace(Result, ';', strDelim, [rfReplaceAll]);
    end;
  end;
end;

//--------------------------------------------------------------------------------------
// не печатается государство если совпадает со значением из параметра  (если нет "+" в имени поля)
// не печатается область если совпадает со значением из параметра      (если нет "+" в имени поля)
//--------------------------------------------------------------------------------------
function TdmBase.GetAdresAkt2(strDataSet, strParam: String; nType: Integer): String;
var
  f : TfmSimpleD;
  ds : TDataSet;
  arr,arrF,arrResult : TArrStrings;
  n,i : Integer;
  ss, strRn, strDelim, sType, sHist, ResultRaion, strLang : String;
  lYesHist, lHaveRaion, lUpper, lAdd : Boolean;
begin
  // если город будет иметь районы
  lHaveRaion  := false;
  ResultRaion := '';

  Result := '';
  sType := Copy(PadLInt(nType,2,'0'),2,1);
  lYesHist := false;
  if sType='0'
    then strDelim := Chr(13)+Chr(10)
    else strDelim := ', ';

  if nType=3 then strDelim:=', ';  // формируем почтовый адрес
  SetLength(arrResult,5);               // для записи промежуточных результатов

  f := GetCurDok;
  if (strDataSet='') or (AnsiUpperCase(strDataSet)='CURDOK') then begin
    ds:=f.Dokument;
  end else begin
    ds := GetRecord_DataSet(strDataSet); //GlobalSeekDataSet(strDataSet);
  end;
  if ds<>nil then begin
    strLang:=CheckLangParam(strParam);
    lUpper:=CheckUpperParam(strParam);
    StrToArr(strParam,arr,';',false);
    for i:=0 to Length(arr)-1 do begin
      if Trim(arr[i])<>'' then begin
        StrToArr( arr[i], arrF, ',', false );
        SetLength(arrF, 3);
        case i of
          // страна
          0 : begin
                arrResult[0]:='';
                if Copy(arrF[0],1,1)='+' then begin
                  lAdd:=true;
                  arrF[0]:=Copy(arrF[0],2,Length(arrF[0]));
                end else begin
                  lAdd:=false;
                end;
                if (arrF[0]<>'') and (arrF[1]<>'') and
                   (ds.FieldByName(arrF[0]).AsString<>'') then begin
                  if lAdd or (GlobalTask.ParamAsString('GOSUD')<>ds.FieldByName(arrF[0]).AsString) then begin
                    if nType>9 then sHist := f.GetHistValueField(arrF[0], 1) else sHist:='';
                    if sHist='' then begin
                      if SprStran.Locate('ID',ds.FieldByName(arrF[0]).AsString,[]) then begin
                        Result := Result + SprStran.FieldByName(arrF[1]).AsString+strDelim;
                      end;
                      arrResult[0]:=SprStran.FieldByName(arrF[1]).AsString;
                    end else begin
                      lYesHist := true;
                      Result := Result + sHist+strDelim;
                    end;
                  end;
                end;
              end;
          // область, край
          1 : begin
                arrResult[1]:='';
                if (arrF[0]<>'') then begin
                  if Copy(arrF[0],1,1)='+' then begin
                    lAdd:=true;
                    arrF[0]:=Copy(arrF[0],2,Length(arrF[0]));
                  end else begin
                    lAdd:=false;
                  end;
                  if lAdd or (ANSIUpperCase(GlobalTask.ParamAsString('OBL'))<>ANSIUpperCase(ds.FieldByName(arrF[0]).AsString)) then begin
                    ss:=Trim(ds.FieldByName(arrF[0]).AsString);
                    //------------------------------
                    if not LastSimIsLower(ss)
                      then lUpper:=true;
                    //------------------------------
                    if nType>9
                      then sHist:=f.GetHistValueField(arrF[0], 1)
                      else sHist:='';
                    if sHist='' then begin
                      if ss<>'' then begin
                        n:=CheckBooleanField(ds,arrF[1]);
                        ss:=dmBase.NameObl(ss,n,strLang);
                        Result := Result + ss + strDelim;
                        arrResult[1]:=ss;
                      end;
                    end else begin
                      lYesHist := true;
                      if Copy(sHist,1,1)<>'-' then Result := Result + sHist+''+strDelim; //??? область
                    end;
                  end;
                end;
              end;
          // район
          2 : begin
                arrResult[2]:='';
                strRn  := '';
                if (arrF[1]<>'') then begin
                  if ds.FieldByName(arrF[1]).DataType=ftBoolean then begin  // тип: "район в городе" или "район в области"
                    if not ds.FieldByName(arrF[1]).IsNull and (ds.FieldByName(arrF[1]).AsBoolean=false) then begin
                      // район в городе
                      lHaveRaion := true;
                    end;
                    strRn := TrimRight(ds.FieldByName(arrF[0]).AsString);
                  end else begin
                    strRn := TrimRight(ds.FieldByName(arrF[1]).AsString);
                    if strRn<>''
                      then lHaveRaion := true
                      else strRn := TrimRight(ds.FieldByName(arrF[0]).AsString);
                  end;
                end;
                if lHaveRaion then begin
                  // не включать в адрес имя района в городе
                  if arrF[2]='0' then begin
                    strRn:='';
                    lHaveRaion:=false;
                  end;
                end else begin
                  if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
                    strRn := ds.FieldByName(arrF[0]).AsString;
                  end;
                end;
                if nType>9
                  then sHist:=f.GetHistValueField(arrF[0], 1)
                  else sHist:='';
                ss := GetWordRAION(strRn,strLang); //' район';
                strRn:=Trim(strRn);
                //------------------------------
                if not LastSimIsLower(strRn)
                  then lUpper:=true;
                //------------------------------

                //---- если район является продолжением облати -----
                if (ss='') and (strRn<>'') then Result:=Copy(Result,1,Length(Result)-Length(strDelim))+' ';  //!!!!   удаляем предыдущий разделитель
                //--------------------------------------------------

                if sHist='' then begin
                  if strRn<>'' then begin
                    if lHaveRaion then begin
                      ResultRaion := strRn + ss + strDelim;
                    end else begin
                      Result := Result + strRn + ss + strDelim;
                      if (ss='') and (strRn<>'')
                        then arrResult[1]:=arrResult[1]+' '+strRn   // добавляем к области
                        else arrResult[2]:=strRn+ss;
                    end;
                  end;
                end else begin
                  lYesHist := true;
                  if Copy(sHist,1,1)<>'-' then begin   // типа не пустое значение
                    if lHaveRaion then begin
                      ResultRaion := sHist + ss + strDelim;
                    end else begin
                      Result := Result + sHist + ss + strDelim;
                      if (ss='') and (strRn<>'')
                        then arrResult[1]:=arrResult[1]+' '+strRn   // добавляем к области
                        else arrResult[2]:=sHist+ss;
                    end;
                  end;
                end;
              end;
          // город,селение
          3 : begin
                arrResult[3]:='';
                if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
                  ss := ds.FieldByName(arrF[0]).AsString;
                  ss := GetFullNamePunkt(ss, ds.FindField(arrF[1]), strLang );
                  //------------------------------
                  if not LastSimIsLower(ss)
                    then lUpper:=true;
                  //------------------------------
                  if nType>9 then sHist := GetFullNamePunkt(f.GetHistValueField(arrF[0], 1),nil) else sHist:='';
                  if sHist='' then begin
                    Result := Result + ss + strDelim;
                    arrResult[3]:=ss;
                  end else begin
                    lYesHist := true;
                    Result := Result + sHist + strDelim;
                  end;
                  if lHaveRaion and (ResultRaion<>'') then begin
                    if sHist='' then begin
                      Result := Result + ResultRaion;
                    end else begin
                      lYesHist := true;
                      Result := Result + ResultRaion;
                    end;
                  end;
                end;
              end;
          // место в населенном пункте
          4 : begin
                arrResult[4]:='';
                if (arrF[0]<>'') then begin //and (ds.FieldByName(arrF[0]).AsString<>'') then begin
                  if nType>9 then begin
                    sHist:=f.GetHistValueField(arrF[0], 1);
                    sHist:=Get_DomKorpKv_FromAkt( sHist, ds, arrF[1],',','', false);
                    if sHist<>'' then begin
                      lYesHist:=true;
                      Result:=Result + sHist + strDelim;
                      arrResult[4]:=sHist;
                    end;
                  end else begin
                    ss:=Get_DomKorpKv_FromAkt( ds.FieldByName(arrF[0]).AsString, ds, arrF[1],',',Result, false);
                    if ss<>'' then
                      Result := Result + ss + strDelim;
                    arrResult[4]:=ss;
                  end;
                end;
              end;
        end;
      end;
    end;
    if nType=3 then begin // собрать почтовый адрес
      Result:='';
      for i:=4 downto 0 do begin
        if arrResult[i]<>'' then begin
          Result:=Result+arrResult[i]+', ';
        end;
      end;
      Result:=Trim(Result);
      Result:=Copy(Result,1,Length(Result)-1);
    end else begin
      if (nType>9) and not lYesHist then Result := '';
      if Result <> '' then begin
        Result := Trim(Result);
        if Right(Result,1)=',' then begin
          Result := Copy(Result,1,Length(Result)-1);
        end;
      end;
    end;
    FLastAdresUpper:=lUpper;
    if lUpper then Result:=ANSIUpperCase(Result);
  end;
end;

//--------------------------------------------------------------------------------------
// без учета истории
//--------------------------------------------------------------------------------------
function TdmBase.GetAdresAkt3(ds : TDataSet; strParam: String; nType: Integer; lPrintOblAll:Boolean): String;
var
  arr,arrF : TArrStrings;
  n,i : Integer;
  ss,strRn, strDelim, sType, ResultRaion,strLang : String;
  lAdd, lHaveRaion,lUpper : Boolean;
begin
  // если город будет иметь районы
  lHaveRaion  := false;
  ResultRaion := '';
                           
  Result := '';
  sType := Copy(PadLInt(nType,2,'0'),2,1);
  if sType='0'
    then strDelim := Chr(13)+Chr(10)
    else strDelim := ', ';
  strLang:=CheckLangParam(strParam);
  lUpper:=CheckUpperParam(strParam);
  StrToArr(strParam,arr,';',false);
  for i:=0 to Length(arr)-1 do begin
    if Trim(arr[i])<>'' then begin
      StrToArr( arr[i], arrF, ',', false );
      SetLength(arrF, 3);
      case i of
          // страна
        0 : begin
              if (arrF[0]<>'') and (arrF[1]<>'') and
                 (ds.FieldByName(arrF[0]).AsString<>'') then begin
                if lPrintOblAll or (GlobalTask.ParamAsString('GOSUD')<>ds.FieldByName(arrF[0]).AsString) then begin
                  if SprStran.Locate('ID',ds.FieldByName(arrF[0]).AsString,[]) then begin
                    Result := Result + SprStran.FieldByName(arrF[1]).AsString+strDelim;
                  end;
                end;
              end;
            end;
          // область, край
          1 : begin
                if (arrF[0]<>'') and (Copy(arrF[0],1,1)='+') then begin
                  lAdd:=true;
                  arrF[0]:=Copy(arrF[0],2,Length(arrF[0]));
                end else begin
                  lAdd:=false;
                end;
                if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
                  if lAdd or lPrintOblAll or (ANSIUpperCase(GlobalTask.ParamAsString('OBL'))<>
                     ANSIUpperCase(ds.FieldByName(arrF[0]).AsString)) then begin
                    ss := '';
                    n := CheckBooleanField(ds,arrF[1]);
                    //------------------------------
                    if not LastSimIsLower(ds.FieldByName(arrF[0]).AsString)
                      then lUpper:=true;
                    //------------------------------
                    ss:= dmBase.NameObl(ds.FieldByName(arrF[0]).AsString,n,strLang);
                    Result := Result + ss + strDelim;
                  end;
                end;
              end;
          // район
          2 : begin
                strRn  := '';
                if (arrF[1]<>'') then begin
                  if ds.FieldByName(arrF[1]).DataType=ftBoolean then begin  // тип: "район в городе" или "район в области"
                    if not ds.FieldByName(arrF[1]).IsNull and (ds.FieldByName(arrF[1]).AsBoolean=false) then begin
                      // район в городе
                      lHaveRaion := true;
                    end;
                    strRn := ds.FieldByName(arrF[0]).AsString;
                  end else begin
                    strRn := ds.FieldByName(arrF[1]).AsString;
                    if strRn<>''
                      then lHaveRaion := true
                      else strRn := ds.FieldByName(arrF[0]).AsString;
                  end;
                end;
                if lHaveRaion then begin
                  // не включать в адрес имя района в городе
                  if arrF[2]='0' then begin
                    strRn:='';
                    lHaveRaion:=false;
                  end;
                end else begin
                  if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
                    strRn := ds.FieldByName(arrF[0]).AsString;
                  end;
                end;
                if strRn<>'' then begin
                  //------------------------------
                  if not LastSimIsLower(strRn)
                    then lUpper:=true;
                  //------------------------------
                  ss := GetWordRAION(strRn,strLang); //' район';
                  strRn:=Trim(strRn);

                  //---- если район является продолжением облати -----
                  if (ss='') and (strRn<>'') then Result:=Copy(Result,1,Length(Result)-Length(strDelim))+' ';  //!!!!   удаляем предыдущий разделитель
                  //--------------------------------------------------

                  if lHaveRaion then begin
                    ResultRaion := strRn + ss + strDelim;
                  end else begin
//                    if ss=''
                    Result := Result + strRn + ss + strDelim;
                  end;
                end;
              end;
          // город,селение
          3 : begin
                if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
                  ss := ds.FieldByName(arrF[0]).AsString;
                  ss := GetFullNamePunkt(ss, ds.FindField(arrF[1]), strLang );
                  //------------------------------
                  if not LastSimIsLower(ss)
                    then lUpper:=true;
                  //------------------------------
                  Result := Result + ss + strDelim;
                  if lHaveRaion and (ResultRaion<>'') then begin
                    Result := Result + ResultRaion;
                  end;
                end;
              end;
          // место в населенном пункте
          4 : begin
                if (arrF[0]<>'') then begin
                  ss:=Get_DomKorpKv_FromAkt( ds.FieldByName(arrF[0]).AsString, ds, arrF[1],',',Result, false);
                  if ss<>'' then
                    Result := Result + ss + strDelim;
                end;
              end;
        end;
      end;
    end;
    if Result <> '' then begin
      FLastAdresUpper:=lUpper;
      if lUpper then Result:=ANSIUpperCase(Result);
      Result := Trim(Result);
      if Right(Result,1)=',' then begin
        Result := Copy(Result,1,Length(Result)-1);
      end;
    end;
end;

//--------------------------------------------------------------------------------------
function TdmBase.GetNameTerr(strSOATO:String; lObl:Boolean; lRnGor:Boolean; lCheckPunkt:Boolean) : String;
var
 s,ss,old:String;
begin
  Result:='';
  ss:='';
  s:=Copy(strSOATO,1,1);
  if (strSOATO='') or (s<'1') or (s>'7') then begin
    exit;
  end;
  old:=SprSoato.IndexFieldNames;
  SprSoato.IndexFieldNames:='KOD';
  if s='5' then begin
    Result:='г.Минск';
    if lRnGor and (Length(strSOATO)>=4) then begin
      if SprSoato.FindKey([Copy(strSOATO,1,4)+'000000']) then begin
        Result:=Result+', '+SprSoato.FieldByName('NAME').AsString+' р-н';
      end;
    end;
  end else begin
    if Copy(strSOATO,2,1)='4' then begin  // город областного подчинения
      if SprSoato.FindKey([Copy(strSOATO,1,4)+'000000']) then begin
        Result:='г.'+SprSoato.FieldByName('NAME').AsString;
        if lRnGor and (Length(strSOATO)>=7) and (Copy(strSOATO,5,3)<>'000') then begin

          if SprSoato.FindKey([Copy(strSOATO,1,7)+'000']) then begin
            if SprSOATO.FieldByName('TYPEPUNKT').AsInteger>3 then begin   // Руба Костюковка
              GetTypePunkt(SprSOATO.FieldByName('TYPEPUNKT').AsString,'R',ss);
              if ss=''
                then Result:=Result+', '+SprSoato.FieldByName('NAME').AsString
                else Result:=Result+', '+CheckSpace(ss+' '+SprSoato.FieldByName('NAME').AsString);
            end else begin
              Result:=Result+', '+SprSoato.FieldByName('NAME').AsString+' р-н';
            end;

          end;
        end;
      end;
    end else begin
      if s='1' then ss:='Брестская'
      else if s='2' then ss:='Витебская'
      else if s='3' then  ss:='Гомельская'
      else if s='4' then  ss:='Гродненская'
      else if s='6' then  ss:='Минская'
      else if s='7' then  ss:='Могилёвская';
      if ss<>'' then ss:=ss+' обл.';
      if Copy(strSOATO,2,3)='000' then begin  // определена только область
        lObl:=true;
      end else begin
        if SprSoato.FindKey([Copy(strSOATO,1,4)+'000000']) then begin
          Result:=SprSoato.FieldByName('NAME').AsString+' р-н';
          if Copy(strSOATO,5,3)='002' then begin
            Result:=Result+' (сел. население)';
          end else begin
            if Length(strSOATO)>4 then begin
              if Length(strSOATO)<10 then s:=PadRStr(strSOATO,10,'0')
                                     else s:=strSOATO;
              if Copy(s,5,6)='000000' then begin
                if lCheckPunkt
                  then Result:=Result+', нас.п. не определен';
              end else begin
                if SprSoato.FindKey([s]) then begin
                  s:=SprSoato.FieldByName('TYPEPUNKT').AsString;
                  if s<>'' then begin
                    if TypePunkt.Locate('ID',s,[])
                      then s:=Trim(TypePunkt.FieldByName('NAME').AsString)
                      else s:='';
                  end;
                  Result:=Result+', '+s+SprSoato.FieldByName('NAME').AsString;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
    if lObl then begin
      if ss<>'' then begin
        if Result=''
          then Result:=ss
          else Result:=ss+', '+Result;
      end;
    end;
  end;
  SprSoato.IndexFieldNames:=old;
end;

//--------------------------------------------------------------------------------------
// lCheckSel=преобразовывать сельское население к '002'
// nType=0,10 полный соато
// nType=1 только область
// nType=4 только район
// nType=7 до сельского совета
//--------------------------------------------------------------------------------------
function TdmBase.GetSoatoAkt(ds : TDataSet; strParam: String; lCheckSel:Boolean; nType:Integer) : TSoato;
var
  arr,arrF : TArrStrings;
  sFullName, old,ss, sPunkt, sPunktBel,strObl,strRn, sType, sTypeRN, strKodRaion, strKodPunkt : String;
  lHaveRaion : Boolean;
  lOk,lGorod,lFind:Boolean;
  fld:TField;
  procedure AddFullName(sn:String);
  begin
    if sFullName='' then sFullName:=sn else sFullName:=sFullName+', '+sn;
  end;
begin
  old:=SprSoato.IndexFieldNames;
  lHaveRaion  := false;  // если город будет иметь районы
  Result.Kod:='9';
  Result.Name:='';
  strObl:='0';
  strKodRaion:='';
  strKodPunkt:='';
  strRn:='';
  sFullName:='';
  lGorod:=false;
  lOk :=true;   // пока считаем, что Беларусь
  StrToArr(strParam,arr,';',false);
  SetLength(arr,4);
  if Trim(arr[0])<>'' then begin
    StrToArr( arr[0], arrF, ',', false );
    SetLength(arrF, 3);
    if (arrF[0]<>'') and (arrF[1]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
      if GlobalTask.ParamAsString('GOSUD')=ds.FieldByName(arrF[0]).AsString then begin
        lOk:=true;
      end else begin
        lOk:=false;
      end;
    end;
  end;
  //--- область -------------------------------------------------
  if lOk then begin
    StrToArr( arr[1], arrF, ',', false );
    SetLength(arrF, 3);
    if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
      ss:=ANSIUpperCase(ds.FieldByName(arrF[0]).AsString);
      if ss='БРЕСТСКАЯ' then strObl:='1'
      else if  ss='ВИТЕБСКАЯ' then strObl:='2'
      else if  ss='ГОМЕЛЬСКАЯ' then strObl:='3'
      else if  ss='ГРОДНЕНСКАЯ' then strObl:='4'
      else if  ss='МИНСКАЯ' then strObl:='6'
      else if  ss='МИНСК' then strObl:='5'
      else if  ss='МОГИЛЁВСКАЯ' then strObl:='7'
      else if  ss='МОГИЛЕВСКАЯ' then strObl:='7';
    end;
    if strObl<>'0' then begin
      Result.Kod:=strObl;
      AddFullName(FirstUpper(strObl));
    end;
  end;
  //--- район -------------------------------------------------
  if lOk then begin
    StrToArr( arr[2], arrF, ',', false );
    SetLength(arrF, 3);
    if (arrF[1]<>'') then begin
      if ds.FieldByName(arrF[1]).DataType=ftBoolean then begin  // тип: "район в городе" или "район в области"
        if not ds.FieldByName(arrF[1]).IsNull and (ds.FieldByName(arrF[1]).AsBoolean=false) then begin
          // район в городе
          lHaveRaion := true;
        end;
        strRn := ds.FieldByName(arrF[0]).AsString;
      end else begin
        strRn := Trim(ds.FieldByName(arrF[0]).AsString);
        if strRn='' then begin
          strRn := ds.FieldByName(arrF[1]).AsString;
          if strRn<>'' then lHaveRaion := true
        end;
      end;
    end;
    if not lHaveRaion then begin
      if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
        strRn := ds.FieldByName(arrF[0]).AsString;
      end;
    end;
    // если название района не пусто, и это не район города
    if (strRn<>'') and not lHaveRaion then begin
      if MySameText(strRn,'МОГИЛЕВСКИЙ') or MySameText(strRn,'МОГИЛЁВСКИЙ') then begin
        strKodRaion:='7244000000';
        Result.Kod:=strKodRaion;
      end else begin
        SprSoato.IndexFieldNames:='NAME;TYPEPUNKT';
        SprSoato.SetRange([strRn],[strRn]);
        while not SprSoato.Eof do begin
          if (strObl='0') or (Copy(SprSoato.FieldByName('KOD').AsString,1,1)=strObl) then begin
            strKodRaion:=SprSoato.FieldByName('KOD').AsString;
            Result.Kod:=strKodRaion;
            break;
          end;
          SprSoato.Next;
        end;
        SprSoato.CancelRange;
      end;
      //--------- если не нашли и есть буква Ё в наименовании -------------------------------------------
      if (strKodRaion='') and (Pos('Ё', ANSIUpperCase(strRn))>0) then begin
        strRn:=StringReplace(strRn,'ё','е',[rfReplaceAll]);
        strRn:=StringReplace(strRn,'Ё','Е',[rfReplaceAll]);
        SprSoato.SetRange([strRn],[strRn]);
        while not SprSoato.Eof do begin
          if (strObl='0') or (Copy(SprSoato.FieldByName('KOD').AsString,1,1)=strObl) then begin
            strKodRaion:=SprSoato.FieldByName('KOD').AsString;
            Result.Kod:=strKodRaion;
            break;
          end;
          SprSoato.Next;
        end;
        SprSoato.CancelRange;
      end;
      //-------------------------------------------------------------------------------------------------
    end;
  end;
  //--- город,селение -------------------------------------------------
  if lOk then begin
    StrToArr( arr[3], arrF, ',', false );
    SetLength(arrF, 3);
    if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
      sPunkt:=ds.FieldByName(arrF[0]).AsString;  // нас. пункт

      if (Copy(sPunkt,1,2)='г.') or (Copy(sPunkt,1,2)='д.') or (Copy(sPunkt,1,2)='с.')
        then sPunkt:=Trim(Copy(sPunkt,3,Length(sPunkt)));
      fld:=ds.FindField(arrF[1]); // поле отвечающее за тип нас. пункта
      sType:='';
      sTypeRN:='';   // тип нас. пункта из ГИС РН
      if fld<>nil then begin
        sType:=fld.AsString;
        if sType<>'' then begin
          if TypePunkt.Locate('ID',sType,[]) then begin
            if TypePunkt.FieldByName('ISGOROD').AsBoolean then begin
              lGorod:=true;
            end;
          end;
        end else begin
          {$IFDEF GISUN}
          if IsActiveGISUN and Gisun.IsEnabled then begin
            fld:=ds.FindField('RN_'+arrF[1]); // поле отвечающее за тип нас. пункта из ГИС РН
            if fld<>nil then begin
              sTypeRN:=fld.AsString;
              sPunktBel:='';
              Gisun.Decode35_My_TypePunkt(sTypeRN,sType,sPunkt,sPunktBel,lGorod);
            end;
          end;
          {$ENDIF}
        end;
      end;
      lFind:=false;
      //--!!!--------
      if MySameText(sPunkt,'МОГИЛЕВ') then begin
        sPunkt:='МОГИЛЁВ';
      end;
      //----- город который имеет районы и район введен ---
      if lHaveRaion and (strRn<>'') and (ANSIUpperCase(sPunkt)<>'РУБА') and (ANSIUpperCase(sPunkt)<>'КОСТЮКОВКА') then begin
        ss:=sPunkt; //ds.FieldByName(arrF[0]).AsString;
        SprSoato.IndexFieldNames:='NAME;TYPEPUNKT';
        SprSoato.SetRange([ss],[ss]);
        while not SprSoato.Eof do begin
               // у города имеющего районы д.б. 6 нулей   или Минск
          if ( (Copy(SprSoato.FieldByName('KOD').AsString,5,6)='000000') or
               ( (Copy(SprSoato.FieldByName('KOD').AsString,1,1)='5') and (Copy(SprSoato.FieldByName('KOD').AsString,8,3)='000'))) and
             (strObl='0') or (Copy(SprSoato.FieldByName('KOD').AsString,1,1)=strObl) then begin
//             ((strKodRaion='') or (Copy(SprSoato.FieldByName('KOD').AsString,1,4)=Copy(strKodRaion,1,4)))
            Result.Kod:=SprSoato.FieldByName('KOD').AsString;  // код города имеющего районы
            strKodPunkt:=Result.Kod;
            break;
          end;
          SprSoato.Next;
        end;
        SprSoato.CancelRange;
        //---!!!----------
        if (strKodPunkt='') then begin
          if MySameText(ss,'МОГИЛЕВ') or MySameText(ss,'МОГИЛЁВ') then begin
            strKodPunkt:='7401000000';
            Result.Kod:=strKodPunkt;
          end;
        end;
        if strKodPunkt<>'' then begin
          SprSoato.SetRange([strRn],[strRn]);
          while not SprSoato.Eof do begin
            if ( (Copy(SprSoato.FieldByName('KOD').AsString,5,3)<>'000') or
                 ( (Copy(SprSoato.FieldByName('KOD').AsString,1,1)='5') and (Copy(SprSoato.FieldByName('KOD').AsString,2,3)<>'000'))
               ) and
               ( (Copy(SprSoato.FieldByName('KOD').AsString,1,4)=Copy(strKodPunkt,1,4)) or
                 ((Copy(SprSoato.FieldByName('KOD').AsString,1,1)='5') and (Copy(strKodPunkt,1,1)='5'))
               ) then begin
              strKodRaion:=SprSoato.FieldByName('KOD').AsString;  // код района города
              Result.Kod:=strKodRaion;
              break;
            end;
            SprSoato.Next;
          end;
          SprSoato.CancelRange;
        end;
      end else begin  // не район города
        ss:=sPunkt; //ds.FieldByName(arrF[0]).AsString;

        if sType<>'' then begin
          SprSoato.IndexFieldNames:='NAME;TYPEPUNKT';
          SprSoato.SetRange([ss,sType],[ss,sType]);
          while not SprSoato.Eof do begin
            if ((strObl='0') or (Copy(SprSoato.FieldByName('KOD').AsString,1,1)=strObl)) and
               (lHaveRaion or (strKodRaion='') or (Copy(SprSoato.FieldByName('KOD').AsString,1,4)=Copy(strKodRaion,1,4))) then begin
              Result.Kod:=SprSoato.FieldByName('KOD').AsString;
              lFind:=true;
              break;
            end;
            SprSoato.Next;
          end;
          SprSoato.CancelRange;
        end;
        if not lFind then begin
          SprSoato.IndexFieldNames:='NAME;TYPEPUNKT';
          SprSoato.SetRange([ss],[ss]);
          while not SprSoato.Eof do begin
            if ((strObl='0') or (Copy(SprSoato.FieldByName('KOD').AsString,1,1)=strObl)) and
               (lHaveRaion or (strKodRaion='') or (Copy(SprSoato.FieldByName('KOD').AsString,1,4)=Copy(strKodRaion,1,4))) then begin
              Result.Kod:=SprSoato.FieldByName('KOD').AsString;
              lFind:=true;
              break;
            end;
            SprSoato.Next;
          end;
          SprSoato.CancelRange;
        end;

        //--------- если не нашли и есть буква Ё в наименовании -------------------------------------------
        if not lFind then begin
          if MySameText(ss,'МОГИЛЕВ') or MySameText(ss,'МОГИЛЁВ') then begin
            Result.Kod:='7401000000';
          end;
        end;

        if not lFind and (Pos('Ё',ANSIUpperCase(ss))>0) then begin
          ss:=StringReplace(ss,'ё','е',[rfReplaceAll]);
          ss:=StringReplace(ss,'Ё','Е',[rfReplaceAll]);

          if sType<>'' then begin
            SprSoato.IndexFieldNames:='NAME;TYPEPUNKT';
            SprSoato.SetRange([ss,sType],[ss,sType]);
            while not SprSoato.Eof do begin
              if ((strObl='0') or (Copy(SprSoato.FieldByName('KOD').AsString,1,1)=strObl)) and
                 (lHaveRaion or (strKodRaion='') or (Copy(SprSoato.FieldByName('KOD').AsString,1,4)=Copy(strKodRaion,1,4))) then begin
                Result.Kod:=SprSoato.FieldByName('KOD').AsString;
                lFind:=true;
                break;
              end;
              SprSoato.Next;
            end;
            SprSoato.CancelRange;
          end;
          if not lFind then begin
            SprSoato.IndexFieldNames:='NAME;TYPEPUNKT';
            SprSoato.SetRange([ss],[ss]);
            while not SprSoato.Eof do begin
              if ((strObl='0') or (Copy(SprSoato.FieldByName('KOD').AsString,1,1)=strObl)) and
                 (lHaveRaion or (strKodRaion='') or (Copy(SprSoato.FieldByName('KOD').AsString,1,4)=Copy(strKodRaion,1,4))) then begin
                Result.Kod:=SprSoato.FieldByName('KOD').AsString;
//                lFind:=true;
                break;
              end;
              SprSoato.Next;
            end;
            SprSoato.CancelRange;
          end;
        end;
        //----------------------------------------------------------------------------------------------------
      end;
    end;
  end;
  SprSoato.IndexFieldNames:=old;
  if nType=0 then nType:=10;
  if lCheckSel and (nType=7) and (Length(Result.Kod)=10) then begin
    if (Copy(Result.Kod,8,3)<>'000') or not lGorod then begin
      Result.Kod:=Copy(Result.Kod,1,4)+'002';
    end;
  end;
  Result.Kod:=Copy(Result.Kod,1,nType);
  Result.Kod:=PadRStr(Result.Kod,nType,'0');
end;
//----------------------------------------------------------------------------------------------
function TdmBase.GetKodSoatoAkt(ds : TDataSet; strParam: String; lCheckSel:Boolean; nType:Integer) : String;
var
  soato:TSOATO;
begin
  soato:=GetSoatoAkt(ds,strParam,lCheckSel,nType);
  Result:=Soato.Kod;
end;
//----------------------------------------------------------------------------------------------
function TdmBase.ATE2Record(ds:TDataSet):TAte;
begin
  Result.Kod:=ds.FieldByName('KOD').AsString;
  Result.ATE_PARENTID:=ds.FieldByName('ATE_PARENTID').AsInteger;
  Result.ATE_ID:=ds.FieldByName('ATE_ID').AsInteger;
  Result.Name:=ds.FieldByName('NAME').AsString;
  Result.Name_B:=ds.FieldByName('NAME_B').AsString;
  Result.Category:=ds.FieldByName('CATEGORY').AsInteger;
  Result.NameC:=ds.FieldByName('NAMEC').AsString;
  Result.NaneC_B:=ds.FieldByName('NAMEC_B').AsString;
  Result.Front:=ds.FieldByName('FRONT').AsInteger;
  if Result.Front=1
    then Result.FullName:=Result.NameC+' '+Result.Name
    else Result.FullName:=Result.Name+' '+Result.NameC;
  Result.Obl:='';
  Result.Obl_B:='';
  Result.idObl:=0;
  Result.Raion:='';
  Result.Raion_B:='';
  Result.idRaion:=0;
  Result.RnGorod:='';
  Result.idRaionG:=0;
  Result.SS:='';
  Result.idSS:=0;
  Result.Error:='';
  Result.Active:=true;
end;
//---------------------------------------------------------
function TdmBase.ATEfromParentAndName(tbATE:TAdsTable; nType:Integer;nID:Integer; sName:String; sKateg: String; sNotKateg: String; sNameC:String) : TArrAte;
var
  i:Integer;
  sCurKateg:String;
  lOk,lSeek:Boolean;
//  arr:TArrAte;
begin
  SetLength(Result,0);
  lSeek:=false;
  if nType=SEEK_CATEGORY then begin
    tbATE.IndexFieldNames:='CATEGORY;NAME';
  end else if nType=SEEK_PARENT then begin
    tbATE.IndexFieldNames:='ATE_PARENTID;NAME';
  end else if nType=SEEK_NAME then begin
    tbATE.IndexFieldNames:='NAME';
  end else begin
    tbATE.IndexFieldNames:='ATE_ID';
  end;    
  for i:=1 to 2 do begin
    if i=1 then begin
      lSeek:=true;
    end else if i=2 then begin
      if (nType<>SEEK_ATEID) and ((Pos('ё',sName)>0) or (Pos('Ё',sName)>0)) then begin
        sName:=StringReplace(sName,'ё','е',[rfReplaceAll]);
        sName:=StringReplace(sName,'Ё','Е',[rfReplaceAll]);
        lSeek:=true;
      end else begin
        lSeek:=false;
      end;
    end;
    if lSeek then begin
      if (nType=SEEK_CATEGORY) or (nType=SEEK_PARENT) then begin
        tbATE.SetRange([nID,sName],[nID,sName])
      end else if nType=SEEK_NAME then begin
        tbATE.SetRange([sName],[sName])
      end else begin
        tbATE.SetRange([nID],[nID])
      end;
      try
        while not tbATE.Eof do begin
          if tbATE.FieldByName('DATEOUT').IsNull then begin
            sCurKateg:=tbATE.FieldByName('CATEGORY').AsString+';';
            if (sKateg='') then begin
              lOk:=true;
            end else begin
              if Pos(sCurKateg, sKateg)>0 then lOk:=true else lOk:=false;
            end;
            if lOk then begin
              if (sNotKateg='') then begin
                //
              end else begin
                if Pos(sCurKateg, sNotKateg)>0 then lOk:=false else lOk:=true;
                if lOk and (Pos('MAX',sNotKateg)>0) then begin
                  if tbATE.FieldByName('CATEGORY').AsInteger>240 then begin  // MAX_KAT=240
                    lOk:=false;
                  end;
                end;
              end;
            end;
            if lOk then begin
              SetLength(Result,Length(Result)+1);
              Result[Length(Result)-1]:=ATE2Record(tbAte);
            end;
          end;
          tbATE.Next;
        end;
      finally
        tbATE.CancelRange;
      end;
    end;
  end;
  {
  // тип нас. пункта не пустой и нашли более одного нас. пункта

  if (sNameC<>'') and (Length(Result)>1) then begin
    n:=Length(Result);
    lOk:=false;
    SetLength(arr, n);
    for i:=0 to n-1 do begin
      arr[i]:=Result[i];
      if arr[i].NameC=sNameC then begin  // нашли нас. пункт с ссотв. типом хотя бы один
        lOk:=true;
      end;
    end;
    if lOk then begin
      SetLength(Result, 0);
      for i:=0 to n-1 do begin
        arr[i]:=Result[i];
        if arr[i].NameC=sNameC then begin  // нашли нас. пункт с ссотв. типом хотя бы один
          SetLength(Result,Length(Result)+1);
          Result[Length(Result)-1]:=arr[i];
        end;
      end;
    end;
    SetLength(arr, 0);
  end;
  }
end;

const
  arr_type : array[0..19] of String = ('аг','а.г','агр','д','г','х','с','п','гп','г.п','пос','пгт','сан','кп','рп','нп','в/ч','в\ч','снп','в');

//--------------------------------------------------------------------------------------
function TdmBase.GetNameAndTypePunkt(strValue : String; var sType,sName : String): Boolean;
var
//  lAdd : Boolean;
  i : Integer;
  s : String;
//  lOk:Boolean;
begin
  Result:=false;
  strValue:=Trim(strValue);
  sType:='';
  sName:=strValue;
  if strValue='' then begin
    exit;
  end;
  s:=AnsiLowerCase(strValue);
  for i:=Low(arr_type) to High(arr_type) do begin
    if Copy(s,1,length(arr_type[i])+1)=arr_type[i]+'.' then begin
      Result:=true;
    end else if Copy(s,1,length(arr_type[i])+1)=arr_type[i]+' ' then begin
      Result:=true;
    end;
    if Result then begin
      sType:=Trim(Copy(s,1,length(arr_type[i])+1));
      if Copy(sType,1,3)='г.п' then
        sType:='гп'
      else if Copy(sType,1,3)='пoc' then
        sType:='п.'
      else if (Copy(sType,1,3)='агр') or (Copy(sType,1,3)='а.г') then
        sType:='аг.';
      sName:=Trim(Copy(strValue,length(arr_type[i])+2,length(strValue)));
      break;
    end;
  end;
end;
//--------------------------------------------------------------------------------------------
function TdmBase.NameFromATE(nAteID:Integer; sLang:String) : String;
var
  s,ss:String;
begin
  Result:='';
  if (AteSys<>nil) and AteSys.Locate('ATE_ID', nAteID, []) then begin
    if (sLang='') or (sLang='R') or (sLang='Р')
      then sLang:=''
      else sLang:='_B';
    s:=AteSys.FieldByName('NAME'+sLang).AsString;
    ss:=AteSys.FieldByName('NAMEC'+sLang).AsString;
    if AteSys.FieldByName('FRONT').AsInteger=1
      then Result:=ss+chr(160)+s
      else Result:=s+chr(160)+ss;
  end;
end;
//--------------------------------------------------------------------------------------------
function TdmBase.getATESys(slATE:TStringList; sObl:String; sRaion:String; sSS:String; sPunkt:String; sTypePunkt:String) : Integer;
begin
  if AteSys<>nil
    then result:=_getATE(AteSys, slATE, sObl, sRaion, sSS, sPunkt, sTypePunkt)
    else result:=0;
//    else result:=_getATE(Ate, slATE, sObl, sRaion, sSS, sPunkt, sTypePunkt);
end;
function TdmBase.getATE(slATE:TStringList; sObl:String; sRaion:String; sSS:String; sPunkt:String; sTypePunkt:String) : Integer;
begin
  if AteSys<>nil
    then result:=_getATE(ATESys, slATE, sObl, sRaion, sSS, sPunkt, sTypePunkt)
    else result:=0;
//  result:=_getATE(ATE, slATE, sObl, sRaion, sSS, sPunkt, sTypePunkt);
end;
//--------------------------------------------------------------------------------------------
function TdmBase._getATE(tbATE:TAdsTable; slATE:TStringList; sObl:String; sRaion:String; sSS:String; sPunkt:String; sTypePunkt:String) : Integer;
var
  sKateg,old,ss : String;
  idSS,idObl,idRn,idSS2,idRn2,idObl2,i,n,nParent:Integer;
  lHaveRaion,lChoice : Boolean;
//  lGorod:Boolean;
//  curATE:TATE;
  arrAte,arrATE2:TArrATE;
  nTypePunkt:Integer;
  rATE:TATE;
begin
  if slATE<>nil then slATE.Clear;

  old:=tbATE.IndexFieldNames;
  lHaveRaion  := false;  // если город будет иметь районы
  rATE.ATE_ID:=0;
  rATE.Kod:='9';
  rATE.Name:='';
  rATE.NameC:='';
  rATE.Error:='';
//  Result:=0;
  idObl:=0;
  idRn:=0;
  idSS:=0;
//  idPunkt:=0;
//  lGorod:=false;
//  lOk :=true;   // пока считаем, что Беларусь
  nTypePunkt:=0;
  lChoice:=true;
  if Pos('#',sTypePunkt)>0 then begin // не выдавать запрос на выбор населенного пункта если найдено больше 1
    lChoice:=false;
    CharDel(sTypePunkt, '#');
  end;
  //===========================================================
  //  город,селение
  //===========================================================
  if (sPunkt<>'') then begin
    if (sTypePunkt<>'') then begin
      if IsAllDigit(sTypePunkt) then begin // передан код типа наседенного пункта

      end else begin
        if Pos('+',sTypePunkt)>0 then begin// тип нас. пункта взять из названия
          if GetNameAndTypePunkt(sPunkt,sTypePunkt,ss)
            then sPunkt:=ss;
        end;
      end;
    end;
  //  sTypePunkt //!!! переделать на меньшую зависимость от типа нас. пункта
    if GorodHaveRaion(sPunkt) and (sRaion<>'') and ((sTypePunkt='') or (sTypePunkt='1')) then begin
      lHaveRaion:=true;
      sKateg:='111;112;113;212;213;';  // значит обязательно д.б. город  !!!
    end else begin
      if sTypePunkt='1'
        then sKateg:='111;112;113;212;213;'
        else sKateg:='';
    end;
    arrATE:=ATEfromParentAndName(tbATE, SEEK_NAME, 0, sPunkt,sKateg,'101;102;103;MAX;', '');
    if (Length(arrATE)=0) and (sTypePunkt='1') then begin   // если не нашли, но был установлен тип нас. пункта (город=1)
      arrATE:=ATEfromParentAndName(tbATE, SEEK_NAME, 0, sPunkt, '','101;102;103;MAX;', '');
    end;
    //------------------------------------------------
    if Length(arrATE)>0 then begin        // если нашли нас. пункт(ы)
      //-------- область ------------
      if (sObl<>'') and (sObl<>'-') then begin
        arrATE2:=ATEfromParentAndName(tbATE, SEEK_CATEGORY, ATE_CATEG_OBL, sObl,'','');
        if Length(arrATE2)>0 then idOBL:=ArrATE2[0].ATE_ID;
      end;
      //=====================================
      if lHaveRaion then begin
        arrATE2:=ATEfromParentAndName(tbATE, SEEK_PARENT, arrAte[0].ATE_ID, sRaion,'202;','');
        rATE.idObl:=idOBL;
        if Length(arrATE2)>0 then begin  // если нашли район города в ATE
          rATE.Kod:=ArrATE2[0].Kod;
          rATE.ATE_ID:=ArrATE2[0].ATE_ID;
        end else begin                  // если не нашли район города в ATE
          rAte.Kod:=arrATE[0].Kod;
          rAte.ate_id:=arrATE[0].ate_id;
        end;
      //=====================================
      end else begin
        //--------- район ------------
        // если название района не пусто
        if (sRaion<>'') and (sRaion<>'-') then begin
          if not lHaveRaion and (idObl>0) then begin  // это не район города
            arrATE2:=ATEfromParentAndName(tbATE, SEEK_PARENT, idOBL, sRaion,'','');
            if Length(arrATE2)>0
              then idRn:=ArrATE2[0].ATE_ID;
          end;
        end;
        // если название cc не пусто
        if (sSS<>'') and (sSS<>'-') and (idRn>0) then begin
          n:=Pos(' ',sSS);
          if n>0 then sSS:=Copy(sSS,1,n-1);
          arrATE2:=ATEfromParentAndName(tbATE, SEEK_PARENT, idRn, Trim(sSS), '', '');
          if Length(arrATE2)>0
            then idSS:=ArrATE2[0].ATE_ID;
        end;
        //------------------------------------------------
        for i:=0 to Length(arrATE)-1 do begin
          idSS2:=0;       // cc
          idRn2:=0;       // район
          idObl2:=0;      // область
          arrATE[i].idObl:=0;
          arrATE[i].idRaion:=0;
          arrATE[i].idSS:=0;
          nParent:=arrATE[i].ATE_PARENTID;
          n:=1;
          while (nParent>0) and (n<10) do begin
            Inc(n,1);
            arrATE2:=ATEfromParentAndName(tbATE, SEEK_ATEID, nParent , '', '','');  // найдем родителя
            if Length(arrATE2)>0 then begin
              nParent:=arrATE2[0].ATE_PARENTID;
              if arrATE2[0].CATEGORY=101 then begin
                idObl2:=arrATE2[0].ATE_ID;      // область
                arrATE[i].idObl:=idObl2;
                arrATE[i].Obl:=arrATE2[0].NAME;
                arrATE[i].Obl_B:=arrATE2[0].NAME_B;
              end;
              if arrATE2[0].CATEGORY=102 then begin
                idRn2:=arrATE2[0].ATE_ID;       // район
                arrATE[i].idRaion:=idRn2;
                arrATE[i].Raion:=arrATE2[0].NAME;
                arrATE[i].Raion_B:=arrATE2[0].NAME_B;
              end;
              if arrATE2[0].CATEGORY=103 then begin
                idSS2:=arrATE2[0].ATE_ID;          // cc
                arrATE[i].idSS:=idSS2;
                arrATE[i].SS:=arrATE2[0].NAME;
              end;
            end else begin
              nParent:=0;
            end;
          end;
          if ( (idSS=idSS2) or (idSS=0) ) and ( (idRn=idRn2) or (idRn=0) ) and ( (idObl=idObl2) or (idObl=0) )then begin
            {$IFDEF GISUN}
            if (nTypePunkt=1) then begin  // город
              if Gisun.Decode35_My_TypePunkt2(IntToStr(arrATE[i].Category))<>IntToStr(nTypePunkt) then begin
                arrATE[i].Active:=false;  // отключим АТЕ если у нас город и в АТЕ не город
              end;
            end;
            {$ENDIF}
          end else begin            // отключим АТЕ если район или область не совпадают
            arrATE[i].Active:=false;
          end;
        end;
        n:=0;
        for i:=0 to Length(arrATE)-1 do
          if arrATE[i].Active then n:=n+1;
        if n>1 then begin
          n:=0;
          for i:=0 to Length(arrATE)-1 do begin
            if arrATE[i].Active then begin
              if arrATE[i].NameC=sTypePunkt then begin
                n:=1;
                break;
              end;
            end;
          end;
          if n=1 then begin
            for i:=0 to Length(arrATE)-1 do begin
              if arrATE[i].Active then begin
                if arrATE[i].NameC=sTypePunkt then begin

                end else begin
                  arrATE[i].Active:=false;
                end;
              end;
            end;
          end;
        end;
        rATE:=ChoiceATEPunkt(arrATE, lChoice, false);
      end;
      //=====================================
    //-----------------------------------------------------
    end else begin
      rATE.Error:='Нас. пункт:"'+sPunkt+'" не найден';
    end;
  end;
  tbATE.IndexFieldNames:=old;
  Result:=rATE.ate_id;
  if (slATE<>nil) and (Result>0) then begin
    slATE.Clear;
    if rATE.idObl>0 then slATE.Add('OBL='+InttoStr(rATE.idObl));
    if rATE.idRaion>0  then slATE.Add('RN='+InttoStr(rATE.idRaion));
    if rATE.idSS>0  then slATE.Add('SS='+InttoStr(rATE.idSS));
    if rATE.Kod<>''  then slATE.Add('SOATO='+rATE.Kod);
  end;
end;
//----------------------------------------------------------------------------------------------
//  ATE:=dmBase.GetSoatoAkt(Dokument,
//              'GOSUD,FName;OBL,B_OBL;RAION,RNGOROD;GOROD,B_GOROD',10);

// {NOT_RNGOR}  - не учитывать район города
// {CHOICE}     - открывать выбор если найдено несколько значений
// {SS}         - учитывать код моего с/с если найдено несколько нас. пунктов
// {OBL_RN}     - возвращать область или район если не найден нас. пункт
// '{NOT_RNGOR}{SS}{CHOICE}'
function TdmBase.GetATEAkt(ds:TDataSet; strFields:String; strParam:String) : TATE;
var
  arr,arrF : TArrStrings;
  strErr,sObl, old,ss, strRn, sPunkt : String;
  idObl,idRn,idRn2,idObl2,i,n,nParent:Integer;
  lHaveRaion : Boolean;
  lChoice,lOk:Boolean;
  lCheckEmpty,lCheckRnGorod,lCheckAteSS:Boolean;
//  fld:TField;
//  curATE:TATE;
  arrAte,arrATE2:TArrATE;
  nTypePunkt:Integer;
  tbAte:TAdsTable;
begin
  if Pos('{NOT', strParam)>0 then lCheckRnGorod:=false else lCheckRnGorod:=true; // !!!
  if Pos('{CH', strParam)>0 then lChoice:=true else lChoice:=false;
  if Pos('{SS', strParam)>0 then lCheckAteSS:=true else lCheckAteSS:=false;
  lCheckEmpty:=FCheckEmptySoato;
  if Pos('{OBL_RN', strParam)>0  then lCheckEmpty:=true;
  if Pos('{-OBL_RN', strParam)>0 then lCheckEmpty:=false;
  tbATE:=AteSys;
//  tbATE:=Ate;
  old:=tbATE.IndexFieldNames;
  lHaveRaion  := false;  // если город будет иметь районы
  Result.ATE_ID:=0;
  Result.Kod:='9000000000';
  Result.Name:='';
  Result.NameC:='';
  Result.Error:='';
  strErr:='';
  idObl:=0;
  sObl:='';
  idRn:=0;
//  idPunkt:=0;
//  lGorod:=false;
  lOk :=true;   // пока считаем, что Беларусь
  StrToArr(strFields,arr,';',false);
  SetLength(arr,4);
  //    0          1          2              3
  //'GOSUD,FName; OBL,B_OBL; RAION,RNGOROD; GOROD,B_GOROD'
  if Trim(arr[0])<>'' then begin
    StrToArr( arr[0], arrF, ',', false );
    SetLength(arrF, 3);
    if (arrF[0]<>'') and (arrF[1]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
      if GlobalTask.ParamAsString('GOSUD')=ds.FieldByName(arrF[0]).AsString then begin
        lOk:=true;
      end else begin
        lOk:=false;
      end;
    end;
  end;
  if lOk then begin  // если Беларусь
  //*********************
  //-------- область ------------
  StrToArr( arr[1], arrF, ',', false );
  SetLength(arrF, 3);
  ss:=Trim(ds.FieldByName(arrF[0]).AsString);
  if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
    arrATE2:=ATEfromParentAndName(tbATE, SEEK_CATEGORY, ATE_CATEG_OBL, ss,'','');
    if Length(arrATE2)>0 then begin
      idOBL:=ArrATE2[0].ATE_ID;
      sOBL:=ArrATE2[0].FullName;
    end;
    SetLength(arrATE2,0);
  end;
  //--------- район ------------
  StrToArr( arr[2], arrF, ',', false );
  SetLength(arrF, 3);
  strRn:='';
  if (arrF[1]='') then begin
    if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
      strRn := ds.FieldByName(arrF[0]).AsString;
    end;
  end else begin
    if ds.FieldByName(arrF[1]).DataType=ftBoolean then begin  // тип: "район в городе" или "район в области"
      if not ds.FieldByName(arrF[1]).IsNull and (ds.FieldByName(arrF[1]).AsBoolean=false) then begin
        // район в городе
        lHaveRaion := true;
      end;
      strRn := ds.FieldByName(arrF[0]).AsString;
    end else begin
      strRn := ds.FieldByName(arrF[1]).AsString;
      if strRn<>''
        then lHaveRaion := true
        else strRn := ds.FieldByName(arrF[0]).AsString;
    end;
  end;
  // если название района не пусто, и это не район города
  if (strRn<>'') and not lHaveRaion and (idObl>0) then begin
    arrATE2:=ATEfromParentAndName(tbATE, SEEK_PARENT, idOBL, strRn,'','');
    if Length(arrATE2)>0
      then idRn:=ArrATE2[0].ATE_ID;
    SetLength(arrATE2,0);
  end;
  //*********************
  //    nTypePunkt:=0;
  //===========================================================
  //  город,селение
  //===========================================================
    StrToArr( arr[3], arrF, ',', false );
    SetLength(arrF, 3);
    if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
      sPunkt:=Trim(ds.FieldByName(arrF[0]).AsString);  // нас. пункт
      nTypePunkt:=ds.FieldByName(arrF[1]).AsInteger;  // тип нас. пункт
      arrATE:=ATEfromParentAndName(tbATE, SEEK_NAME, 0, sPunkt,'','101;102;103;MAX;');
      //------------------------------------------------
      if Length(arrATE)>0 then begin        // если количество нас. пунктов больше нуля
        //============================================
        if lCheckRnGorod and lHaveRaion then begin   // если большой город с районами
          for i:=0 to Length(arrATE)-1 do begin
            arrATE2:=ATEfromParentAndName(tbATE, SEEK_PARENT, arrATE[i].ATE_ID, strRn,'','');
            if (Length(arrATE2)>0) then begin // and (idObl=0) or (idObl=arrATE2[0].idObl) ) then begin
              arrATE[i].FullName:=arrATE[i].FullName+', '+arrATE2[0].FullName;
              arrATE[i].Name:=arrATE2[0].Name;
              arrATE[i].Kod:=arrATE2[0].Kod;
              arrATE[i].idPunkt:=arrATE[i].ATE_ID;
              arrATE[i].ATE_ID:=arrATE2[0].ATE_ID;
              arrATE[i].idObl:=arrATE[i].ATE_PARENTID;
            end else begin
              arrATE[i].Active:=false;
            end;
            SetLength(arrATE2,0);
          end;
        end else begin
          for i:=0 to Length(arrATE)-1 do begin
            idRn2:=0;       // район
            idObl2:=0;      // область
            nParent:=arrATE[i].ATE_PARENTID;
            n:=1;
            while (nParent>0) or (n>100) do begin
              Inc(n,1);
              arrATE2:=ATEfromParentAndName(tbATE, SEEK_ATEID, nParent , '', '','');  // найдем родителя
              if Length(arrATE2)>0 then begin
                nParent:=arrATE2[0].ATE_PARENTID;
                if arrATE2[0].CATEGORY=101 then begin
                  idObl2:=arrATE2[0].ATE_ID;      // область
                  arrATE[i].Obl:=arrATE2[0].NAME;
                  arrATE[i].Obl_B:=arrATE2[0].NAME_B;
                  arrATE[i].idObl:=arrATE2[0].ATE_ID;
                end;
                if arrATE2[0].CATEGORY=102 then begin
                  idRn2:=arrATE2[0].ATE_ID;       // район
                  arrATE[i].Raion:=arrATE2[0].NAME;
                  arrATE[i].Raion_B:=arrATE2[0].NAME_B;
                  arrATE[i].idRaion:=arrATE2[0].ATE_ID;
                end;
                if arrATE2[0].CATEGORY=103 then begin
                  arrATE[i].SS:=arrATE2[0].NAME;     // сс
                  arrATE[i].idSS:=arrATE2[0].ATE_ID;
                end;
              end else begin
                nParent:=0;
              end;
            end;
            if ( (idRn=idRn2) or (idRn=0) ) and ( (idObl=idObl2) or (idObl=0) ) then begin
              if (nTypePunkt=1) then begin  // город
                if Category2TypePunkt(IntToStr(arrATE[i].Category))<>nTypePunkt then begin
                  arrATE[i].Active:=false;  // отключим АТЕ если у нас город и в АТЕ не город
                end;
              end;
            end else begin            // отключим АТЕ если район или область не совпадают
              arrATE[i].Active:=false;
            end;
          end;
        end;
        SetLength(arrATE2,0);
        Result:=ChoiceATEPunkt(arrATE,lChoice,lCheckAteSS);
        SetLength(arrATE,0);
      //-----------------------------------------------------
      end else begin
        strErr:='Нас. пункт:"'+sPunkt+'" не найден';
      end;
    end;
    if (Result.ATE_ID=0) and lCheckEmpty then begin
      if idRn>0 then begin
        arrATE:=ATEfromParentAndName(tbATE, SEEK_ATEID, idRn, '', '','');
        if Length(arrATE)>0 then Result:=arrATE[0];
      end else if idObl>0 then begin
        arrATE:=ATEfromParentAndName(tbATE, SEEK_ATEID, idObl, '', '','');
        if Length(arrATE)>0 then Result:=arrATE[0];
      end;
    end;
    Result.Error:=strErr;
  end;
  tbATE.IndexFieldNames:=old;
end;
//----------------
{
function TdmBase.GetATEAkt2(ds : TDataSet; strParam: String; lCheckRnGorod:Boolean; nType:Integer) : TATE;
var
  arr,arrF : TArrStrings;
  old,ss, strRn, sPunkt, sPunktBel, sType, sTypeRN : String;
  idObl,idRn,idPunkt:Integer;
  lHaveRaion : Boolean;
  lOk,lGorod,lFind:Boolean;
  fld:TField;
  arrAte:TArrATE;
begin
  old:=ATE.IndexFieldNames;
  lHaveRaion  := false;  // если город будет иметь районы
  Result.ATE_ID:=0;
  Result.Kod:='9';
  Result.Name:='';
  Result.NameC:='';
  Result.Error:='';
  idObl:=0;
  idRn:=0;
  idPunkt:=0;
  lGorod:=false;
  lOk :=true;   // пока считаем, что Беларусь
  StrToArr(strParam,arr,';',false);
  SetLength(arr,4);
  //    0          1          2              3
  //'GOSUD,FName; OBL,B_OBL; RAION,RNGOROD; GOROD,B_GOROD'
  if Trim(arr[0])<>'' then begin
    StrToArr( arr[0], arrF, ',', false );
    SetLength(arrF, 3);
    if (arrF[0]<>'') and (arrF[1]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
      if GlobalTask.ParamAsString('GOSUD')=ds.FieldByName(arrF[0]).AsString then begin
        lOk:=true;
      end else begin
        lOk:=false;
      end;
    end;
  end;
  //===========================================================
  // область
  //===========================================================
  if lOk then begin
    StrToArr( arr[1], arrF, ',', false );
    SetLength(arrF, 3);
    ss:=Trim(ds.FieldByName(arrF[0]).AsString);
    if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
      arrATE:=ATEfromParentAndName(ATE, SEEK_CATEGORY, ATE_CATEG_OBL, ss,'','');
      if Length(arrATE)=0 then begin
        // Ошибка
        Result.Error:='Не найдена область: "'+ss+'"';
      end else begin
        idOBL:=ArrATE[0].ATE_ID;
      end;
    end;
  end;
  //===========================================================
  //    район
  //===========================================================
  if lOk then begin
    StrToArr( arr[2], arrF, ',', false );
    SetLength(arrF, 3);
    strRn:='';
    if (arrF[1]='') then begin
      if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
        strRn := ds.FieldByName(arrF[0]).AsString;
      end;
    end else begin
      if ds.FieldByName(arrF[1]).DataType=ftBoolean then begin  // тип: "район в городе" или "район в области"
        if not ds.FieldByName(arrF[1]).IsNull and (ds.FieldByName(arrF[1]).AsBoolean=false) then begin
          // район в городе
          lHaveRaion := true;
        end;
        strRn := ds.FieldByName(arrF[0]).AsString;
      end else begin
        strRn := ds.FieldByName(arrF[1]).AsString;
        if strRn<>''
          then lHaveRaion := true
          else strRn := ds.FieldByName(arrF[0]).AsString;
      end;
    end;
    // если название района не пусто, и это не район города
    if (strRn<>'') and not lHaveRaion and (idObl>0) then begin
      arrATE:=ATEfromParentAndName(ATE, SEEK_PARENT, idOBL, strRn,'','');
      if Length(arrATE)=0 then begin
        // Ошибка
        Result.Error:='Не найден район: "'+strRn+'"';
      end else begin
        idRn:=ArrATE[0].ATE_ID;
      end;
    end;
  end;

  //===========================================================
  //  город,селение
  //===========================================================
  if lOk then begin
    StrToArr( arr[3], arrF, ',', false );
    SetLength(arrF, 3);
    if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
      sPunkt:=Trim(ds.FieldByName(arrF[0]).AsString);  // нас. пункт
      // если определен район
      if idRn>0 then begin
        arrATE:=ATEfromParentAndName(ATE, SEEK_PARENT, idRn, sPunkt,'','');
      end else begin
        if idObl>0 then begin  //------ определена область -----------------------------
          arrATE:=ATEfromParentAndName(ATE, SEEK_PARENT, idObl, sPunkt,'','');
          if Length(arrATE)=0 then begin  // по parentid области не нашел
            // вообще-то так не должно быть
            arrATE:=ATEfromParentAndName(ATE, SEEK_NAME, 0, sPunkt,'111;112;113;221,222,223;','');
          end;
        end else begin  //- область не определена, район не определен------------------------
          arrATE:=ATEfromParentAndName(ATE, SEEK_NAME, 0, sPunkt,'111;112;113;','');
        end;
      end;
      if Length(arrATE)>1 then begin
        Result:=ChoiceATEPunkt(arrATE);
      end else if Length(ArrATE)=1 then begin
        Result:=arrATE[0];
      end else begin
        Result.Error:='Нас. пункт:"'+sPunkt+'" не найден';
      end;
//      fld:=ds.FindField(arrF[1]); // поле отвечающее за тип нас. пункта
      // пока без района города
    end;
  end;
  ATE.IndexFieldNames:=old;
end;
}
//----------------------------------------------
function TdmBase.ChoiceATEPunkt(arrATE:TArrATE; lChoice:Boolean; lCheckAteSS:Boolean):TATE;
var
  i,n,nMy,m : Integer;
  List : TStringList;
  s:String;
  lOk:Boolean;
begin
  Result.ATE_ID:=0;
  Result.ATE_PARENTID:=0;
  Result.error:='';
  Result.name:='';
  Result.fullname:='';
  Result.namec:='';
  nMy:=-1;
  m:=0;
  List := TStringList.Create;
  for i:=0 to Length(arrATE)-1 do begin
    if ArrATE[i].Active then begin
//      n:=i;
      lOk:=true;
      if lCheckAteSS and (FAteSS>0) and (ArrATE[i].idSS>0) and (FAteSS=ArrATE[i].idSS) then begin  // нас. пункт из моего с/с
        nMy:=i;
        Inc(m,1);
      end;
      s:=ArrATE[i].FullName;
      if ArrATE[i].SS<>''    then s:=ArrATE[i].SS+' c/c, '+s;
      if ArrATE[i].Raion<>'' then s:=ArrATE[i].Raion+' р-н, '+s;
      if ArrATE[i].Obl<>''   then s:=ArrATE[i].Obl+' обл., '+s;
      ArrATE[i].FullName:=s;
      List.AddObject(s, Pointer(i));
    end;
  end;
  i:=-1;

  if List.Count>1 then begin
    if (m=1) and (nMy>-1) then begin   // если есть нас. пункт из моего с/с  и он один
      i:=nMy; // !!!  без выбора берем из моего с/с
    end else begin
      if lChoice then begin
        n:=ChoiceFromList(List,'Выберите нас. пункт', nil);
        if n>-1 then begin
         i:=Integer(List.Objects[n]);
        end;
      end;
    end;
  end else begin
    if List.Count>0 then begin
      i:=Integer(List.Objects[0]);
    end;
  end;
  if (i>-1)  then begin
    Result:=ArrATE[i];
  end;
  FreeAndNil(List);
end;
//-----------------------------------------------------------------------------------------------
function TdmBase.GetSQLForVozrast(strLastField, strFirstField : String): String;
begin
  // SQL выражение для вычисления возраста
  Result := GlobalTask.ParamAsString('SQL_VOZRAST');
  if Trim(Result) = ''
    then Result := 'TRUNCATE(TIMESTAMPDIFF(SQL_TSI_MONTH,&FIRST&,&LAST&)/12,0)-IIF(month(&FIRST&)=month(&LAST&), IIF(dayofmonth(&FIRST&)-dayofmonth(&LAST&)>0,1,0),0)';
  Result := StringReplace(Result, '&FIRST&', strFirstField, [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&LAST&', strLastField, [rfReplaceAll, rfIgnoreCase]);
end;
//--------------------------------------------------------------------------------------
function TdmBase.GetTypeZags: Integer;
{$IFDEF ZAGS}
var
  n:Integer;
{$ENDIF}
begin
  {$IFDEF ZAGS}
    try
      n:=StrToInt(Copy(GlobalTask.ParamasString('KOD'),1,1));
    except
      n:=0;
    end;
    // 1000000000  ...  7000000000  коды областей
    if ( (Copy(GlobalTask.ParamasString('KOD'),2,9)='000000000') and (n<8) )
       or (GlobalTask.ParamasString('ARXIV')='1') then begin
//    if (GlobalTask.ParamasString('ARXIV')='1') then begin
      Result:=ZAGS_OBL_ARXIV;
    end else begin
      Result:=0;
    end;
  {$ELSE}
    Result:=0;
  {$ENDIF}
end;
//--------------------------------------------------------------------------------------
function TdmBase.OblArxivZAGS: Boolean;
{$IFDEF ZAGS}
var
  n:Integer;
{$ENDIF}
begin
  Result:=false;
  {$IFDEF ZAGS}
    n:=GetTypeZags;
    if n=ZAGS_OBL_ARXIV
      then Result:=true;
  {$ENDIF}
end;
//--------------------------------------------------------------------------------------
function TdmBase.OblBASE: Boolean;
{$IFDEF OCHERED}
var
  s:String;
{$ENDIF}
begin
  Result := false;
  {$IFDEF OCHERED}
    s:=GlobalTask.ParamasString('KOD');
    // 1000000000  ...  7000000000  коды областей
    if (Copy(s,2,9)='000000000') and (Copy(s,1,1)<'8') then begin
      Result := true;
    end;
  {$ENDIF}
end;

//--------------------------------------------------------------------------------------
function TdmBase.LockBase: Boolean;
begin
  Result:=true;
  tbDelObj.Close;
  tbDelObj.Exclusive:=true;
  try
    tbDelObj.Open;
  except
    Result:=false;
  end;
  if not Result then begin
    tbDelObj.Exclusive:=false;
    tbDelObj.Open;
  end;
end;

//--------------------------------------------------------------------------------------
procedure TdmBase.UnLockBase;
begin
  tbDelObj.Close;
  tbDelObj.Exclusive:=false;
  tbDelObj.Open;
end;

//--------------------------------------------------------------------------------------
function TdmBase.GetNewNomerSvid(TypeSvid : Integer; tb: TAdsTable; var strNewNomer : String; var strNewSeria : String): String;
var
  st : TSostTable;
  d1,d2 : TDateTime;
  strSeria,strSeria1,strSeria2,strNomer,strNomer1, strNomer2 : String;
  n1,n2, id1,id2 : Integer;
  lNext : Boolean;
  nIDZags:Integer;
  {$IFDEF ZAGS}
  cur : TCursor;
  fldZags : TField;
  {$ENDIF}
begin
  FSeekID:=0;
  id1:=0;
//  id2:=0;
  Result := '';
  strNewNomer := '';
  strNewSeria := '';
  lNext := true;
  {
  if GlobalTask.ParamAsBoolean('CHECK_SVID') then begin
    st := SaveSostTable(ListSvid,true,true);
    ListSvid.IndexFieldNames := 'SVID_TYPE;SVID_SERIA;SVID_NOMER';
    ListSvid.SetRange([TypeSvid],[TypeSvid]);
    ListSvid.Filter := 'sost=0';  // не выдано
    ListSvid.Filtered := true;
    ListSvid.First;
    if ListSvid.Eof then begin
      Result := '  Закончились свидетельства ! ';
    end else begin
      strNewNomer := ListSvid.FieldByName('SVID_NOMER').AsString;
      strNewSeria := ListSvid.FieldByName('SVID_SERIA').AsString;
    end;
    ListSvid.Filtered := false;
    ListSvid.Filter := '';
    ListSvid.CancelRange;
    RestSostTable(ListSvid,st);
    lNext := false;
  end;
  }      
  if lNext then begin
//    nn:=GetTickCount;
    st := SaveSostTable(tb,true,true);
    tb.IndexFieldNames := 'ID';
    tb.Last;
    strNomer1 := Trim(tb.FieldByName('SVID_NOMER').AsString);
    strSeria1 := Trim(tb.FieldByName('SVID_SERIA').AsString);
    if tb.FieldByName('DATESV').IsNull
      then d1 := 0  else d1 := tb.FieldByName('DATESV').AsDateTime;
    {$IFDEF ZAGS}
    cur := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    fldZags := tb.FindField('ID_ZAGS');
    strNomer1 := '';
    strSeria1 := '';
    strNomer2:='';
    strSeria2:='';
//    d2:=0;

 {  tb.IndexFieldNames := 'ID_ZAGS;ID';
    tb.SetRange([GlobalTask.ParamAsInteger('ID')],[GlobalTask.ParamAsInteger('ID')]);
    tb.Last;  }
{
    WorkQuery.SQL.Text:='select max(id) from '+tb.TableName+' where id_zags='+GlobalTask.ParamAsString('ID')+' and svid_nomer<>'''' ';
    WorkQuery.Open;
    n:=WorkQuery.Fields[0].AsInteger;
    WorkQuery.Close;
    if tb.Locate('ID',n,[]) and (n>0) then begin
}
    // !!! может долго работать !!!
    nIDZags:=GlobalTask.ParamAsInteger('ID');
    while (fldZags.AsInteger<>nIDZags) or (tb.FieldByName('SVID_NOMER').AsString='') do begin
      tb.Prior;
      if tb.Bof then break;
    end;

    if not tb.Bof and (fldZags.AsInteger=nIDZags) then begin
      id1:=tb.FieldByName('ID').AsInteger;
      strNomer1 := Trim(tb.FieldByName('SVID_NOMER').AsString);
      strSeria1 := Trim(tb.FieldByName('SVID_SERIA').AsString);
      if tb.FieldByName('DATESV').IsNull
        then d1 := 0  else d1 := tb.FieldByName('DATESV').AsDateTime;
      //-------- для установления отцовства ---------------------
      if tb.FindField('TWO_SVID')<>nil then begin
        if tb.FindField('TWO_SVID').AsBoolean then begin
          strNomer2 := Trim(tb.FieldByName('SVID_NOMER2').AsString);
          strSeria2 := Trim(tb.FieldByName('SVID_SERIA2').AsString);
          if tb.FieldByName('DATESV2').IsNull
            then d2 := 0  else d2 := tb.FieldByName('DATESV2').AsDateTime;
          if strNomer2<>'' then begin
            try
              if StrToInt(strNomer2)>StrToInt(strNomer1) then begin
                strNomer1:=strNomer2;
                strSeria1:=strSeria2;
                d1:=d2;
              end;
            except
            end;
          end;
        end;
        strNomer2:='';
        strSeria2:='';
//        d2:=0;
      end;
      //----------------------------------------------------------
    end;
//    end;
    tb.CancelRange;
    Screen.Cursor := cur;
    {$ENDIF}
    while Copy(strNomer1,1,1)='0' do strNomer1:=Copy(strNomer1,2,SVID_LEN);
    n1 := Length(strNomer1);
    SvidPovtor.IndexFieldNames := 'SVID_TYPE;SVID_DATE';
    SvidPovtor.SetRange([TypeSvid],[TypeSvid]);
    SvidPovtor.Last;
    strNomer2 := Trim(SvidPovtor.FieldByName('SVID_NOMER').AsString);
    strSeria2 := Trim(SvidPovtor.FieldByName('SVID_SERIA').AsString);
    id2:=SvidPovtor.FieldByName('AKT_ID').AsInteger;
    if SvidPovtor.FieldByName('SVID_DATE').IsNull
      then d2 := 0
      else d2 := SvidPovtor.FieldByName('SVID_DATE').AsDateTime;
    SvidPovtor.CancelRange;
    while Copy(strNomer2,1,1)='0' do strNomer2:=Copy(strNomer2,2,SVID_LEN);
    n2 := Length(strNomer2);
    if ((n1=0) and (n2=0)) or ((d1=0) and (d2=0)) then begin
      Result := '';
    end else begin
      if (strNomer1='') then begin
        strNomer:=strNomer2;
        strSeria:=strSeria2;
        FSeekID:=id2;
      end else if (strNomer2='') then begin
        strNomer:=strNomer1;
        strSeria:=strSeria1;
        FSeekID:=id1;
      end else if d2>d1 then begin
        strNomer:=strNomer2;
        strSeria:=strSeria2;
        FSeekID:=id2;
      end else if d2=d1 then begin
        try
          if StrToInt(strNomer2)>StrToInt(strNomer1) then begin
            strNomer:=strNomer2;
            strSeria:=strSeria2;
            FSeekID:=id2;
          end else begin
            strNomer:=strNomer1;
            strSeria:=strSeria1;
            FSeekID:=id1;
          end;
        except

        end;
      end else begin
        strNomer:=strNomer1;
        strSeria:=strSeria1;
        FSeekID:=id1;
      end;
      try
        if strNomer='' then begin
          strNewNomer := '';
          strNewSeria := '';
        end else begin
          strNewNomer := PadLInt(StrToInt(strNomer)+1,SVID_LEN,'0');
          strNewSeria := strSeria;
        end;
      except
        Result := 'Ошибка получения следующего номера';
      end;
    end;
    RestSostTable(tb,st);
//    showMessage(IntToStr(GetTickCount-nn));
  end;
end;
{$IFDEF ZAGS}
//--------------------------------------------------------------------------------------
function TdmBase.GetNewNomerSvidR(var strNewNomerON : String; var strNewSeriaON : String;
                                  var strNewNomerONA : String; var strNewSeriaONA : String) : String;
var
  st : TSostTable;
  strNomerPovtor, strNomer : String;
  strSeria, strSeriaPovtor, strField : String;
  id1,id2,n1,n2 : Integer;
  tb : TAdsTable;
  d1,d2 : TDateTime;
  lNext : Boolean;
begin
  FSeekID:=0;
  id1:=0;
//  id2:=0;
  Result := '';
  strNewNomerON  := '';
  strNewNomerONA := '';
  strNewSeriaON  := '';
  strNewSeriaONA := '';
  lNext := true;
  {
  if GlobalTask.ParamAsBoolean('CHECK_SVID') then begin
    st := SaveSostTable(ListSvid,true,true);
    ListSvid.IndexFieldNames := 'SVID_TYPE;SVID_SERIA;SVID_NOMER';
    ListSvid.SetRange([TypeObj_ZRast],[TypeObj_ZRast]);
    ListSvid.Filter := 'sost=0';  // не выдано
    ListSvid.Filtered := true;
    ListSvid.First;
    if ListSvid.Eof then begin
      Result := '  Закончились свидетельства ! ';
    end else begin
      strNewNomerON := ListSvid.FieldByName('SVID_NOMER').AsString;
      strNewSeriaON := ListSvid.FieldByName('SVID_SERIA').AsString;
      ListSvid.Next;
      if ListSvid.Eof then begin
        Result := '  Закончились свидетельства ! ';
        strNewNomerON := '';
        strNewSeriaON := '';
      end else begin
        strNewNomerONA := ListSvid.FieldByName('SVID_NOMER').AsString;
        strNewSeriaONA := ListSvid.FieldByName('SVID_SERIA').AsString;
      end;
    end;
    ListSvid.Filtered := false;
    ListSvid.Filter := '';
    ListSvid.CancelRange;
    RestSostTable(ListSvid,st);
    lNext := false;
  end;
  }
  if lNext then begin
    tb := tbZapisRast;
    st := SaveSostTable(tb,true,true);
    tb.IndexFieldNames := 'ID';
    tb.Last;
    strField := '';
    if tb.FieldByName('ON_SVID_DATE').IsNull and tb.FieldByName('ONA_SVID_DATE').IsNull then begin
      d1 := 0;
    end else begin
      if not tb.FieldByName('ON_SVID_DATE').IsNull and not tb.FieldByName('ONA_SVID_DATE').IsNull then begin
        if tb.FieldByName('ON_SVID_DATE').AsDateTime=tb.FieldByName('ONA_SVID_DATE').AsDateTime then begin
          try
            n1:=StrToInt(tb.FieldByName('ON_SVID_NOMER').AsString);
          except
            n1:=0;
          end;
          try
            n2:=StrToInt(tb.FieldByName('ONA_SVID_NOMER').AsString);
          except
            n2:=0;
          end;
          if n1>n2  then strField:='ON' else strField:='ONA';
        end else if tb.FieldByName('ON_SVID_DATE').AsDateTime > tb.FieldByName('ONA_SVID_DATE').AsDateTime then begin
          strField:='ON';
        end else begin
          strField:='ONA';
        end;
      end else if tb.FieldByName('ON_SVID_DATE').IsNull then begin
        strField:='ONA';
      end else begin
        strField:='ON';
      end;
      strNomer := Trim(tb.FieldByName(strField+'_SVID_NOMER').AsString);
      strSeria := Trim(tb.FieldByName(strField+'_SVID_SERIA').AsString);
      id1:=tb.FieldByName('ID').AsInteger;
      d1 := tb.FieldByName(strField+'_SVID_DATE').AsDateTime;
    end;

    SvidPovtor.IndexFieldNames := 'SVID_TYPE;SVID_DATE';
    SvidPovtor.SetRange([TypeObj_ZRast],[TypeObj_ZRast]);
    SvidPovtor.Last;
    strNomerPovtor := Trim(SvidPovtor.FieldByName('SVID_NOMER').AsString);
    strSeriaPovtor := Trim(SvidPovtor.FieldByName('SVID_SERIA').AsString);
    id2:=SvidPovtor.FieldByName('AKT_ID').AsInteger;
    if SvidPovtor.FieldByName('SVID_DATE').IsNull
      then d2 := 0 else d2 := SvidPovtor.FieldByName('SVID_DATE').AsDateTime;
    SvidPovtor.CancelRange;
    if (d1=0) and (d2=0) then begin
      Result := '';
    end else begin
      FSeekID:=id1;
      if strNomerPovtor='' then begin

      end else if strNomer='' then begin
        strNomer := strNomerPovtor;
        strSeria := strSeriaPovtor;
        FSeekID:=id2;
      end else if d2 > d1 then begin
        strNomer := strNomerPovtor;
        strSeria := strSeriaPovtor;
        FSeekID:=id2;
      end;
      while Copy(strNomer,1,1)='0'  do strNomer:=Copy(strNomer,2,SVID_LEN);
      if Length(strNomer)=0 then begin
        Result := '';
        FSeekID:=0;
      end else begin
        try
          strNewNomerON  := PadLInt(StrToInt(strNomer)+1,SVID_LEN,'0');
          strNewSeriaON  := strSeria;
          strNewNomerONA := PadLInt(StrToInt(strNomer)+2,SVID_LEN,'0');
          strNewSeriaONA := strSeria;
        except
          Result := 'Ошибка получения следующего номера';
        end;
      end;
    end;
    RestSostTable(tb,st);
  end;
end;
{$ENDIF}
//--------------------------------------------------------------------------------------
procedure TdmBase.FlushBufferTableLich;
begin
  if not Globaltask.ParamAsBoolean('QUICK_WRITE') then begin
    tbLich.AdsFlushFileBuffers;
    tbLichPr.AdsFlushFileBuffers;
    tbAdres.AdsFlushFileBuffers;
    tbMens.AdsFlushFileBuffers;
    tbMensDvig.AdsFlushFileBuffers;
    tbMensPr.AdsFlushFileBuffers;
    tbMensLgot.AdsFlushFileBuffers;
    tbNalogi.AdsFlushFileBuffers;
    tbPropMemo.AdsFlushFileBuffers;
    tbProp.AdsFlushFileBuffers;
    tbHouseProps.AdsFlushFileBuffers;
    tbHouseOwners.AdsFlushFileBuffers;
    tbAllDokums.AdsFlushFileBuffers;
  end;
end;

//--------------------------------------------------------------------------------------
function TdmBase.GetLastNomerLic: Int64;
var
  s:String;
begin
  Result:=0;
  s:='';
  if GlobalTask.ParamAsInteger('MIN_TWO_NOMER')>0 then begin
    WorkQuery.SQL.Text := 'SELECT MAX(nomer) FROM ЛицевыеСчета WHERE date_fiks='+QStr('1899-12-30')+
                          ' and nomer>='+IntToStr(GlobalTask.ParamAsInteger('MIN_TWO_NOMER'));
    WorkQuery.Open;
    s:=WorkQuery.Fields[0].AsString;
//    if Result=0
//      then Result:=GlobalTask.ParamAsInteger('MIN_TWO_NOMER');
  end else begin
    WorkQuery.SQL.Text := 'SELECT MAX(nomer) FROM ЛицевыеСчета WHERE date_fiks='+QStr('1899-12-30');
    WorkQuery.Open;
    s:=WorkQuery.Fields[0].AsString;
  end;
  WorkQuery.Close;
  if s<>'' then begin
    Result:=StrToInt64(s);
  end;
end;

//--------------------------------------------------------------------------------------
function TdmBase.GetLastNomerLicFirst: Int64;
{$IFNDEF ZAGS}
var
  st : TSostTable;
  s:String;
{$ENDIF}
begin
{$IFDEF ZAGS}
  Result:=0;
{$ELSE}
  Result:=0;
  if GlobalTask.ParamAsInt64('MIN_TWO_NOMER')>0 then begin
    WorkQuery.SQL.Text := 'SELECT MAX(nomer) FROM ЛицевыеСчета WHERE date_fiks='+QStr('1899-12-30')+
                          ' and nomer<'+IntToStr(GlobalTask.ParamAsInt64('MIN_TWO_NOMER'));
    WorkQuery.Open;
    s:=WorkQuery.Fields[0].AsString;
    WorkQuery.Close;
    if s<>'' then begin
      Result:=StrToInt64(s);
    end;
    if Result >= GlobalTask.ParamAsInteger('MIN_TWO_NOMER') then begin
      Result:=GetLastNomerLic;
      PutError('Превышен максимальнй номер: '+IntToStr(GlobalTask.ParamAsInt64('MIN_TWO_NOMER')));
    end;
  end else begin
    Result:=GetLastNomerLic;
  end;
{$ENDIF}
end;

//--------------------------------------------------------------------------------------
function TdmBase.ProvOneSvid(TypeSvid : Integer; dsLog : TDataSet; strNameAkt,strNomerAkt : String; dDateAkt : TDateTime;
                              strSeria,strNomer : String; dDateSvid : TDateTime; lPovtor : Boolean ) : Boolean;
var
//  lOk:Boolean;
  vKeyValues : Variant;
  s:String;
  nSost:Integer;
  procedure AddLog(sss:String);
  begin
    dsLog.Append;
    dsLog.FieldByName('TEXT').AsString := strNameAkt + ' а/з №'+strNomerAkt+' от '+DatePropis(dDateAkt,0)+'г.       '+strSeria+'  №'+strNomer+sss;
    dsLog.Post;
  end;
begin
  Result := true;
  if strNomer<>'' then begin
    if strSeria='' then begin
      AddLog(' пустая серия');
    end else if dDateSvid=0 then begin
      AddLog(' пустая дата выдачи св-ва');
    end else begin
      vKeyValues := VarArrayCreate( [0, 2], varOleStr );
      vKeyValues[0] := TypeSvid;
      vKeyValues[1] := strSeria;
      vKeyValues[2] := strNomer;
      if ListSvid.Locate('SVID_TYPE;SVID_SERIA;SVID_NOMER', vKeyValues,[]) then begin
        {$IFDEF ZAGS}
//          lOk:=ListSvid.FieldByName('ID_ZAGS').AsInteger=Globaltask.ParamAsInteger('ID'); // только свидетельства выписанные от моего имени
        {$ELSE}
//          lOk:=true;
        {$ENDIF}
        if (ListSvid.FieldByName('DATEP').AsDateTime > dDateSvid) then begin
          // В базе свидетельств текущее свидетельство поступило позже даты его выдачи
          AddLog(' дата прихода');
        end else begin
          with ListSvid do begin
            try
              nSost:=FieldByName('SOST').AsInteger;
              if (nSOST>=3) and (nSost<=6) then begin
               // 3 свидетельство испорчено;  4 свидетельство утеряно; 5 свидетельство возвращено в загс; 6 свидетельство передано в сельисполком
                s:=GlobalTask.CurrentOpisEdit.SeekValue('KEY_SOST_SVID_Z', IntToStr(nSost), false);
                AddLog(' '+s);
              end else begin
                Edit;
                if lPovtor
                  then FieldByName('SOST').AsInteger := SVID_VIDANO_P
                  else FieldByName('SOST').AsInteger := SVID_VIDANO;
                FieldByName('DATER').AsDateTime    := dDateSvid;
                FieldByName('AKT_NOMER').AsString  := strNomerAkt;
                FieldByName('AKT_DATE').AsDateTime := dDateAkt;
  //              FieldByName('AKT_ID').AsInteger    := nAktID;
                Post;
              end;
            except
              PutError('Ошибка доступа к базе свидетельств !');
              Result := false;
            end;
          end;
        end;
      end else begin
        AddLog(' не найдено');
      end;
    end;
  end;
end;

//--------------------------------------------------------------------------------------
procedure TdmBase.CheckAllSvid(dDate1, dDate2 : TDateTime );
var
  slOpis,slType : TStringList;
  i,j,m : Integer;
  strFilter, strSeria, strNomer, curInd : String;
  tb : TAdsTable;
  dDateSvid : TDateTime;
  TypeSvid : Integer;
  lOk : Boolean;
  dsLog : TDataSet;
  strNameAkt, strNomerAkt : String;
  dDateAkt : TDateTime;
begin
  slOpis := TStringList.Create;
  slType := TStringList.Create;
  slOpis.AddObject('Акты рождений', dmBase.tbZapisRogd);
  slOpis.AddObject('Акты смертей', dmBase.tbZapisSmert);
  slOpis.AddObject('Акты заключения браков', dmBase.tbZapisBrak);
  slOpis.AddObject('Акты установления отцовства', dmBase.tbZapisUstOtc);
  slType.Add( IntToStr(dmBase.TypeObj_ZRogd) );
  slType.Add( IntToStr(dmBase.TypeObj_ZSmert) );
  slType.Add( IntToStr(dmBase.TypeObj_ZBrak) );
  slType.Add( IntToStr(dmBase.TypeObj_ZUstOtc) );
  {$IFDEF ZAGS}
    slOpis.AddObject('Акты разводов', dmBase.tbZapisRast);
    slOpis.AddObject('Акты усыновления', dmBase.tbZapisAdopt);
    slOpis.AddObject('Акты перемены ФИО', dmBase.tbZapisChName);
    slOpis.AddObject('Акты установления материнства', dmBase.tbZapisUstMat);
    slType.Add( IntToStr(dmBase.TypeObj_ZRast) );
    slType.Add( IntToStr(dmBase.TypeObj_ZAdopt) );
    slType.Add( IntToStr(dmBase.TypeObj_ZChName) );
    slType.Add( IntToStr(dmBase.TypeObj_ZUstMat) );
  {$ENDIF}
  dsLog := GlobalTask.FindReportTable('LOGFILE');
  dbZap(dsLog);
  strFilter := 'datez>=stod('+QStr(DTOS(dDate1))+') and '+'datez<=stod('+QStr(DTOS(dDate2))+')';
  OpenMessage('Проведение свидетельств ... '+'-----------------------------------');
  try
    for i:=0 to slOpis.Count-1 do begin
      ChangeMessage('Проведение свидетельств ... '+slOpis.Strings[i]);
      TypeSvid := StrToInt(slType.Strings[i]);
      tb := TAdsTable(slOpis.Objects[i]);
      strNameAkt := slOpis.Strings[i];
      curInd := tb.IndexName;
      tb.IndexName := 'DATEZ';
      tb.Filter   := strFilter;
      tb.Filtered := true;
      tb.First;
      while not tb.Eof do begin
        lOk := true;
        dDateSvid := 0;
        strSeria  := '';
        strNomer  := '';
        if tb.Name = 'tbZapisRast'
          then m:=2
          else m:=1;
        for j:=1 to m do begin
        if tb.Name = 'tbZapisRast' then begin
          if j=1 then begin
            strSeria  := Trim(tb.FieldByName('ON_SVID_SERIA').AsString);
            strNomer  := Trim(tb.FieldByName('ON_SVID_NOMER').AsString);
            if not tb.FieldByName('ON_SVID_DATE').IsNull then dDateSvid := tb.FieldByName('ON_SVID_DATE').AsDateTime;
          end else begin
            strSeria  := Trim(tb.FieldByName('ONA_SVID_SERIA').AsString);
            strNomer  := Trim(tb.FieldByName('ONA_SVID_NOMER').AsString);
            if not tb.FieldByName('ONA_SVID_DATE').IsNull then dDateSvid := tb.FieldByName('ONA_SVID_DATE').AsDateTime;
          end;
        end else begin
          strSeria  := Trim(tb.FieldByName('SVID_SERIA').AsString);
          strNomer  := Trim(tb.FieldByName('SVID_NOMER').AsString);
          if not tb.FieldByName('DATESV').IsNull then dDateSvid := tb.FieldByName('DATESV').AsDateTime;
        end;

        strNomerAkt := tb.FieldByName('NOMER').AsString;
        dDateAkt    := tb.FieldByName('DATEZ').AsDateTime;
        ProvOneSvid(TypeSvid, dsLog, strNameAkt, strNomerAkt, dDateAkt,
                    strSeria,strNomer, dDateSvid, false);
        end;
        if not lOk then break;
        tb.Next;
      end;
      tb.Filter:='';
      tb.Filtered := false;
      tb.IndexName := curInd;
      {$IFDEF ZAGS}
        SvidPovtor.IndexFieldNames := 'SVID_TYPE;SVID_DATE';
        SvidPovtor.SetRange([TypeSvid,dDate1],[TypeSvid,dDate2]);
        SvidPovtor.First;
        while not SvidPovtor.Eof do begin
          if tb.Locate('ID', SvidPovtor.FieldByName('AKT_ID').AsInteger, [] ) then begin
            strNomerAkt := tb.FieldByName('NOMER').AsString;
            dDateAkt    := tb.FieldByName('DATEZ').AsDateTime;
          end else begin
            strNomerAkt := '0';
            dDateAkt    := 0;
          end;
          dDateSvid := 0;

          strSeria  := Trim(SvidPovtor.FieldByName('SVID_SERIA').AsString);
          strNomer  := Trim(SvidPovtor.FieldByName('SVID_NOMER').AsString);
          if not SvidPovtor.FieldByName('SVID_DATE').IsNull
            then dDateSvid := SvidPovtor.FieldByName('SVID_DATE').AsDateTime;
          ProvOneSvid(TypeSvid, dsLog, strNameAkt, strNomerAkt, dDateAkt,
                      strSeria,strNomer, dDateSvid, true);

          SvidPovtor.Next;
        end;
        SvidPovtor.CancelRange;
      {$ENDIF}
    end;
  finally
    CloseMessage;
  end;
  if dsLog.RecordCount>0 then begin
    GlobalTask.PreViewReport('&Список непроведенных свидетельств.frf');
  end;
end;

//-----------------------------------------------------------
//  lLoad=true   версия базы для загрузки
//  lLoad=false  версия базы для выгрузки
//-----------------------------------------------------------
function TdmBase.GetVersionZAGS(lLoad : Boolean) : String;
var
  s : String;
  i : Integer;
begin
  Result := '';
  WorkQuery.Close;
  WorkQuery.SQL.Clear;
  WorkQuery.SQL.Add('SELECT comment FROM '+SysQuery('system.dictionary'));
  try
    WorkQuery.Open;
    s := ANSILowerCase(Trim(WorkQuery.Fields[0].AsString));
    {$IFDEF ZAGS}
     if GetTypeZags = ZAGS_OBL_ARXIV then begin  // областной архив ЗАГС
       i := Pos('{загс_з',s);
     end else begin       // районный загс
       if lLoad
         then i := Pos('{загс_сс',s)    // загружает базы сельских советов
         else i := Pos('{загс_з',s);    // выгружает все актовые записи в областной архив
     end;
    {$ELSE}
      i := Pos('{загс_сс',s);
    {$ENDIF}
    if i>0 then begin
      s:=Copy(s,i+8,20);
      i:=Pos('}',s);
      if i>0 then begin
        s := Copy(s,1,i-1);
        Result := Trim(s);
      end;
    end;
  except
    on E:Exception do begin
      Result := '';
    end;
  end;
  WorkQuery.Close;
end;

//-----------------------------------------------------------
function TdmBase.GetTypeBase : Integer;
var
  s : String;
  i : Integer;
begin
  Result:=_TypeObj_Nasel;
  WorkQuery.Close;
  WorkQuery.SQL.Clear;
  WorkQuery.SQL.Add('SELECT comment FROM '+SysQuery('system.dictionary'));
  try
    WorkQuery.Open;
    s := ANSILowerCase(Trim(WorkQuery.Fields[0].AsString));
    i := Pos('{ochered',s);
    if i>0 then begin
      Result:=_TypeObj_Ochered;
    end else begin
      i := Pos('{zags',s);
      if i>0 then begin
        Result:=_TypeObj_ZRogd;
      end else begin
        i := Pos('{lais',s);
        if i>0 then begin
          Result:=_TypeObj_Nasel;
        end else begin
          i := Pos('{zah',s);
          if i>0 then begin
            Result:=_TypeObj_AktZah;
          end else begin
            i := Pos('{opeka',s);
            if i>0 then begin
              Result:=_TypeObj_Opeka;
            end else begin
              i := Pos('{post',s);
              if i>0 then begin
                Result:=_TypeObj_SMDOPost;
              end;
            end;
          end;
        end;
      end;
    end;
  except
    on E:Exception do begin
      Result:=0;
    end;
  end;
  WorkQuery.Close;
end;

//------------------------------------------------------------------
function TdmBase.CheckNomerLich(DateFiks : TDateTime; nID:Integer; sNomer: String): Boolean;
var
  old : String;
begin
  Result := true;
  if GlobalTask.ParamAsBoolean('CHECK_N_LIC') then begin
    old := tbLich.IndexFieldNames;
    tbLich.IndexFieldNames:='DATE_FIKS;NOMER';
    tbLich.SetRange([DateFiks,sNomer],[DateFiks,sNomer]);
    try
      if nID = -1 then begin  // новый
        if not tbLich.Eof then Result := false;
      end else begin
        if not tbLich.Eof then begin
          while not tbLich.Eof do begin
            if tbLich.FieldByName('ID').AsInteger<>nID then begin
              Result := false;
            end;
            tbLich.Next;
          end;
        end;
      end;
    finally
      tbLich.CancelRange;
      tbLich.IndexFieldNames:=old;
    end;
  end;
end;
//--- количество зарезервированных ИН-----------------------------------------------------------------------------------
function TdmBase.GetCountIN : Integer;
begin
  try
    dmBase.WorkQuery.Active:=false;
    dmBase.WorkQuery.SQL.Text:='select count(*) from BaseProp where typeobj='+IntToStr(_TypeObj_IN);
    dmBase.WorkQuery.Open;
    Result:=dmBase.WorkQuery.Fields[0].AsInteger;
    dmBase.WorkQuery.Active:=false;
  except
    Result:=0;
  end;
end;
//--------------------------------------------------------------------------------------
function TdmBase.CheckDateFiksSQL(strSQL: String; DateFiks: TDateTime) : String;
begin
  strSQL := StringReplace(strSQL, '1899-12-30', DTOS(DateFiks,tdAds), [rfReplaceAll, rfIgnoreCase]);
  strSQL := StringReplace(strSQL, '&DATE_FIKS&', QStr(DTOS(DateFiks,tdAds)), [rfReplaceAll, rfIgnoreCase]);
  Result := strSQL;
end;

//--------------------------------------------------------------------------------------
function TdmBase.CheckParamsSQL(strSQL: String) : String;
begin
  Result:=fnCheckParamsSQL(strSQL);
end;
//--------------------------------------------------------------------------------------
procedure TdmBase.CheckAutoReindex;
var
  nErrCode, nTypeReindex : Integer;
  dNow, dDateReindex : TDateTime;
  lOk, lErr  : Boolean;
begin
  lOk  := true;
  dNow := Date;
  if IsMainComputer then begin
    nTypeReindex := GlobalTask.ParamAsInteger('AUTO_REINDEX');
    if nTypeReindex > 0 then begin
      if GlobalTask.GetLastValueAsString('DATE_AUTO_REINDEX') = ''
        then dDateReindex := 0
        else dDateReindex := GlobalTask.GetLastValueAsDate('DATE_AUTO_REINDEX');
      if dDateReindex<>0 then begin
        if nTypereindex=1 then begin   // каждый день
          if (FormatDateTime('MMYYYY',dDateReindex) <> FormatDateTime('MMYYYY',dNow )) or
             (dNow > dDateReindex)
            then lOk := true
            else lOk := false;
        end else if nTypeReindex=2 then begin  // каждую неделю
          if (FormatDateTime('MMYYYY',dDateReindex) <> FormatDateTime('MMYYYY',dNow )) or
             ((dNow-7) > dDateReindex)
            then lOk := true
            else lOk := false;
        end else if nTypeReindex=3 then begin  // каждый месяц
          if ( FormatDateTime('MMYYYY',dDateReindex) <> FormatDateTime('MMYYYY',dNow ) )
            then lOk := true
            else lOk := false;
        end;
      end;
    end else begin
      lOk := false;
    end;
  end else begin
    lOk := false;
  end;
  if lOk then begin
    lErr := false;
    {$IFDEF ZAGS}
      try
        tbZapisBrak.Exclusive:=true;
        tbZapisBrak.Open;
      except
        on E:Exception do begin
          lErr := true;
          nErrCode:=0;
          if ( E is EADSDatabaseError ) then begin
            nErrCode := (E as EADSDatabaseError).ACEErrorCode;
          end;
          PutError(' Невозможно заблокировать базу для операции индексации ! ('+IntToStr(nErrCode)+')');
        end;
      end;
      tbZapisBrak.Active:=false;
      tbZapisBrak.Exclusive:=false;
    {$ELSE}
      try
        tbMens.Exclusive:=true;
        tbMens.Open;
      except
        on E:Exception do begin
          lErr := true;
          nErrCode:=0;
          if ( E is EADSDatabaseError ) then begin
            nErrCode := (E as EADSDatabaseError).ACEErrorCode;
          end;
          PutError(' Невозможно заблокировать базу для операции индексации ! ('+IntToStr(nErrCode)+')');
        end;
      end;
      tbMens.Active:=false;
      tbMens.Exclusive:=false;
    {$ENDIF}
    if not lErr then begin
      DeleteFiles(CheckSleshN(GetPathConnect)+ '*.adi');
      GlobalTask.SetLastValueAsDate('DATE_AUTO_REINDEX',dNow);
    end;
  end;
end;

// событие после подключения к базе, ни одна таблица еще не открыта
procedure TdmBase.Event_BeforeOpen(Sender: TObject);
var
  arrTables : array of TAdsTable;
  i : Integer;
begin           
  SetLength(arrTables,0);

  {$IFDEF GKH}
    SetLength(arrTables,5);
    i:=0;
    arrTables[i] := tbZapisBrak;  Inc(i,1);
    arrTables[i] := tbZapisRogd;  Inc(i,1);
    arrTables[i] := tbZapisSmert; Inc(i,1);
    arrTables[i] := tbZapisUstOtc; Inc(i,1);
//    arrTables[4] := tbZapisAdopt;
//    arrTables[4] := tbZapisRast;
//    arrTables[i] := tbZapisChName;  Inc(i,1);
//    arrTables[i] := tbZapisUstMat;  Inc(i,1);
//    arrTables[8] := tbHistoryZAGS;
    arrTables[i] := ListSvid;       Inc(i,1);
  {$ENDIF}

  {$IFDEF ZAGS}
    SetLength(arrTables,39);
    arrTables[0] := tbTalonPrib;
    arrTables[1] := tbTalonPribDeti;
    arrTables[2] := tbTalonUbit;
    arrTables[3] := tbTalonUbitDeti;
    arrTables[4] := tbNalogi;
    arrTables[5] := tbLich;
    arrTables[6] := tbLichPr;
    arrTables[7] := tbBigHouse;
    arrTables[8] := SprIzbUch;
    arrTables[9] := SprIzbUch2;
    arrTables[10]:= SprPropHouse;
    arrTables[11]:= SprAddBuild ;
//    arrTables[12]:= SprOwners;
    arrTables[12]:= tbAdres;
    arrTables[13]:= tbHouseProps;
    arrTables[14]:= tbHouseOwners;
    arrTables[15]:= tbMens;
    arrTables[16]:= tbMensPr;
    arrTables[17]:= tbMensLgot;
    arrTables[18]:= tbMensDvig;
    arrTables[19]:= tbMensAdd;

    arrTables[20]:= tbOchered;
    arrTables[21]:= tbSostavSem;
    arrTables[22]:= SprPostOch;
    arrTables[23]:= SprSnOch;
    arrTables[24]:= tbVUS;
    arrTables[25]:= DeclareRegistr;
    arrTables[26]:= SprPrNasel;
    arrTables[27]:= SprPrLich;
    arrTables[28]:=SprTypePens;
    arrTables[29]:=SprTypeMigr;
    arrTables[30]:=SprMatSten;
    arrTables[31]:=SprPrSozd;
    arrTables[32]:=SprPrLikv;
    arrTables[33]:=SprTypeHouse;
    arrTables[34]:=tbPassports;
    arrTables[35]:=tbPaspChildren;
    arrTables[36]:=tbPaspOsnov;
    arrTables[37]:=SprPredst;
    arrTables[38]:=tbHouseOwnersHist;

  {$ENDIF}

  {$IFDEF OCHERED}
    SetLength(arrTables,27);
    arrTables[0] := tbTalonPrib;
    arrTables[1] := tbTalonPribDeti;
    arrTables[2] := tbTalonUbit;
    arrTables[3] := tbTalonUbitDeti;
    arrTables[4] := tbNalogi;
//    arrTables[5] := tbLich;
//    arrTables[6] := tbLichPr;
    arrTables[5] := SprIzbUch;
    arrTables[6] := SprIzbUch2;
    arrTables[7] := tbVUS;
    arrTables[8] := tbZapisBrak;
    arrTables[9] := tbZapisRogd;
    arrTables[10]:= tbZapisUstOtc;
    arrTables[11]:= tbZapisSmert;

    arrTables[12]:= SprPrichSm;
    arrTables[13]:= SprPrLich;
    arrTables[14]:= SprPrSozd;
    arrTables[15]:= SprPrLikv;

    arrTables[16]:= tbPassports;
    arrTables[17]:= tbPaspChildren;
    arrTables[18]:= tbPaspOsnov;
    arrTables[19]:= SprVoenkom;
    arrTables[20]:= SprRovd;

    arrTables[21]:= SvidPovtor;
    arrTables[22]:= SvidSeria;
    arrTables[23]:= SprKomiss;
    arrTables[24]:= SprOsobOtm;
    arrTables[25]:= DeclareRegistr;

    arrTables[26]:= tbDeclBrak;
    //    arrTables[30]:= SprPrichSm;
  {$ENDIF}

  {$IFDEF POST}
    SetLength(arrTables,46);  i:=0;
    arrTables[i] := tbMensDvig;      inc(i);
    arrTables[i] := tbMensPr;        inc(i);
    arrTables[i] := tbMensLgot;      inc(i);
    arrTables[i] := tbProp;          inc(i);
    arrTables[i] := tbPropMemo;      inc(i);
    arrTables[i] := SprTypePens;     inc(i);
    arrTables[i] := SprMatSten;      inc(i);
    arrTables[i] := SprTypeHouse;    inc(i);
    arrTables[i] := SprMKB10;        inc(i);
    arrTables[i] := tbBigHouse;      inc(i);
    arrTables[i] := SprIst;          inc(i);
    arrTables[i] := SprPredst;       inc(i);
    arrTables[i] := tbSostavSem;     inc(i);
    arrTables[i] := tbDeclBrak;      inc(i);
    arrTables[i] := SprTypeMigr;     inc(i);
    arrTables[i] := tbDokuments;     inc(i);
    arrTables[i] := tbTalonPrib;     inc(i);
    arrTables[i] := tbTalonPribDeti; inc(i);
    arrTables[i] := tbTalonUbit;     inc(i);

    arrTables[i] := tbTalonUbitDeti; inc(i);
    arrTables[i] := tbNalogi;        inc(i);
    arrTables[i] := tbLich;          inc(i);
    arrTables[i] := tbLichPr;        inc(i);
    arrTables[i] := tbVUS;           inc(i);
    arrTables[i] := tbZapisBrak;     inc(i);
    arrTables[i] := tbZapisRogd;     inc(i);
    arrTables[i]:= tbZapisUstOtc;    inc(i);
    arrTables[i]:= tbZapisSmert;     inc(i);
    arrTables[i]:= SprPrichSm;       inc(i);
    arrTables[i]:= SprPrLich;        inc(i);
    arrTables[i]:= SprPrSozd;        inc(i);
    arrTables[i]:= SprPrLikv;        inc(i);
    arrTables[i]:= tbPassports;      inc(i);
    arrTables[i]:= tbPaspChildren;   inc(i);
    arrTables[i]:= tbPaspOsnov;      inc(i);
    arrTables[i]:= SprVoenkom;       inc(i);
    arrTables[i]:= SprPostOch;       inc(i);
    arrTables[i]:= SprSnOch;         inc(i);
    arrTables[i]:= SprRovd;          inc(i);

    arrTables[i]:= SvidPovtor;       inc(i);
    arrTables[i]:= SvidSeria;        inc(i);
    arrTables[i]:= SprPrichSm;       inc(i);
    arrTables[i]:= SprPrNasel;       inc(i);
    arrTables[i]:= tbOchered;        inc(i);
    arrTables[i]:= tbOcheredResh;    inc(i);
    arrTables[i]:= tbMensSobst;      inc(i);

  {$ENDIF}

  // таблицы с пустым именем таблицы не открываются
  for i:=0 to Length(arrTables)-1 do begin
    arrTables[i].TableName:='';
  end;
  SetLength(arrTables,0);
  CheckAutoReindex;
end;

// событие после открытия базы
procedure TdmBase.Event_AfterOpen(Sender: TObject);
begin
  {$IFDEF OBR_GRAG}
  //--------- обращения граждан -------------
  if not fmMain.DocRecord.AfterOpen('AdsConnection') then begin
    // NB: ???
  end;
  {$ENDIF}
  CheckBaseAfterOpen;
end;

function TdmBase.StrTypeAsDataType( sType : String) : TFieldType;
begin
// C=Строка I=Целое число N=Число L=Логический D=Дата M=Текст
  Result := ftString;
  if sType = 'I' then begin
    Result := ftInteger;
  end else if sType = 'N' then begin
    Result := ftFloat;
  end else if sType = 'L' then begin
    Result := ftBoolean;
  end else if sType = 'D' then begin
    Result := ftDate;
  end else if sType = 'M' then begin
    Result := ftMemo;
  end;
end;

{
        EditDataSet(tbDopProp);
        for i:=0 to ListDopRazdel.Count-1 do begin
          dmBase.ReadPropFields( dmBase.TypeObj_Lich, ListDopRazdel.Strings[i] , DateFiks, ID, tbDopProp, lErr);
        end;

        ReadPropAdres(lErr);

        PostDataSet(tbDopProp);
}

function TdmBase.CreateTableDopProps(tbProp : TkbmMemTable; TypeObj : Integer; strRazdel : String ) : Boolean;
var
  i,idRazdel : Integer;
  vKeyValues : Variant;
  arr : TArrStrings;
begin
  Result := true;
  tbProp.Close;
  tbProp.FieldDefs.Clear;
  StrToArr(strRazdel, arr, ',', true);
  for i:=Low(arr) to High(arr) do begin
    vKeyValues := VarArrayCreate( [0, 1], varOleStr );
    vKeyValues[0] := TypeObj;
    vKeyValues[1] := StrToInt(arr[i]);
    if SprRazdel.Locate('TYPEOBJ;NOMER', vKeyValues, []) then begin
      idRazdel := SprRazdel.FieldByName('ID').AsInteger;
      SprProperty.IndexName := 'KEY_VIEW';
      SprProperty.SetRange([TypeObj,idRazdel],[TypeObj,idRazdel]);
      try
        AddFieldsTableDopProps(tbProp);
      finally
        SprProperty.CancelRange;
      end;
    end;
  end;
  if tbProp.FieldDefs.Count=0 then begin
    Result:=false;
  end;
end;

procedure TdmBase.AddFieldsTableDopProps(tbProp : TkbmMemTable);
var
//  tb : TkbmMemTable;
  sName, sRazdel : String;
  nDataType  : TFieldType;
  iSize     : Integer;
  bRequired : Boolean;
  fldDef : TFieldDef;
begin
  sRazdel := SprRazdel.FieldByName('NOMER').AsString;
  SprProperty.First;
  with SprProperty do begin
//    tb := TkbmMemTable.Create(Dokument);
//    tb.Name := Dokument.Name + sRazdel;
    while not Eof do begin
      // если не константа
      if FieldByName('VID').AsString<>'3' then begin
        sName := FieldByName('KOD').AsString;
        nDataType := StrTypeAsDataType( FieldByName('TIP').AsString );
        bRequired := false;
        iSize := 0;
        {TODO 1 : Сделать изменение значности}
        if nDataType = ftString then begin
          iSize := 30;
        end;
        fldDef := tbProp.FieldDefs.AddFieldDef;
        fldDef.Name := sName;
        fldDef.DataType := nDataType;
        fldDef.Size := iSize;
        fldDef.Required := bRequired;
      end;
      Next;
    end;
  end;
end;

//----------------------------------------------------------------------
procedure TdmBase.CheckBaseAfterOpen;
var
  nMaxID, nMaxCreate, nSort : Integer;
  strSQL : String;
  lErr:Boolean;
  {$IFDEF SMDO}
    s,ss:String;
  {$ENDIF}
begin
  nMaxID:=MaxID();
  if nMaxID>-1 then begin
    lErr:=false;
    nMaxCreate := GetLastID;
//    tbAllDokums.Last;
//    nMaxCreate := tbAllDokums.FieldByName('NEWID').AsInteger;
    if nMaxID > nMaxCreate then begin
      OpenMessage('Восстановление таблицы "СозданиеОбъекта"','',10);
      while nMaxID > nMaxCreate do begin
        nMaxCreate:=GetNewID(0);
        if nMaxCreate=-1 then begin
          lErr:=true;
          break;
        end;
      end;
      CloseMessage;
    end;
    if lErr then begin
      PutError('Ошибка восстановления таблицы "СозданиеОбъекта"');
    end;
  end else begin
    PutError('Не найден скрипт "MAX ID.sql" ');
  end;

  {$IFDEF OCHERED}
  if dmBase.OblBASE then begin
    LoadOpisFromSoato('KEY_RN_OCH','','substr(kod,1,1)='+QStr(Copy(GlobalTask.ParamAsString('KOD'),1,1))+' and substr(kod,5,6)=''000000'' and substr(kod,2,3)<>''000'' ',1,4);
  end;
  {$ENDIF}

  {$IFNDEF ZAGS}
  if (dmBase.tbBigHouse<>nil) and (dmBase.tbBigHouse.TableName<>'') then begin
    dmBase.tbAdres.First;
    dmBase.tbBigHouse.First;
    if not dmBase.tbAdres.Eof and dmBase.tbBigHouse.Eof then begin
      OpenMessage('  Формирование базы домов ... ', '', 10);
      try
        dmBase.CreateBigHouse;
      finally
        CloseMessage;
      end;
    end;
  end;

  LoadOpisControlHouse;    // создаем KEY_CONTROL_HOUSE

  {$ENDIF}

//-----------------------------------------------------
// используется в Lookup contols
  LookupObl.SetRange([1],[1]);        // ограничение по областям
  LookupRN.SetRange([2],[2]);         // ограничение по районам
  LookupGorod.SetRange([3],[3]);
  LookupRnGor.SetRange([4],[4]);
//-----------------------------------------------------

  dmBase.LookUpPunkt.Close;
  if dmBase.LoadSQL('LookUpSprPunkt', strSQL) then begin
    nSort:=GlobalTask.ParamAsInteger('CH_ADRES');
//    если nSort=0 сортировка по коду
    if nSort=1 then begin
      strSQL:=ChangeOrderBy(strSQL,'s.nomer');
    end;
    dmBase.LookUpPunkt.SQL.Text := strSQL;
    dmBase.LookUpPunkt.Open;
  end;

  dmBase.LookUpUL.Close;
  if dmBase.LoadSQL('LookUpSprUL', strSQL) then begin
    dmBase.LookUpUL.SQL.Text := strSQL;
    dmBase.LookUpUL.Open;
  end;

  {$IFDEF SMDO}
    try
      LookUpDocMain.Active:=false;
      if LoadSQL('LookUpDocMain', strSQL) then begin
        LookUpDocMain.SQL.Text := strSQL;
        LookUpDocMain.Open;
      end;
    except
    end;
    try
      LookUpSMDOCode.Active:=false;
      if LoadSQL('LookUpSmdocode', strSQL) then begin
        LookUpSMDOCode.SQL.Text := strSQL;
        LookUpSMDOCode.Open;
      end;
    except
    end;
    s:=GetOrgMD5;
    if s<>'' then begin
      ss:=IniSysParams.ReadString('PARAM','ADD','');
      if s<>ss then begin
        IniSysParams.WriteString('PARAM','ADD',s);
        IniSysParams.UpdateFile;
      end;
    end;
  {$ENDIF}
//    LookupDocMain.SQL.Text:='SELECT DOC_ID, REG_IND, REG_DATE, DOC_TYPE, DELIV_KIND FROM DocMain '+
//       'WHERE doc_type=4 '+ // исходящие документы
//       'ORDER BY REG_DATE Desc, REG_NUM Desc';


  {$IFDEF ZAGS}
  {
  dmBase.LookUpSocZachita.Close;
  if dmBase.LoadSQL('LookUpSocZachita', strSQL) then begin
    dmBase.LookUpSocZachita.SQL.Text := strSQL;
    dmBase.LookUpSocZachita.Open;
  end;
  }
  {$ENDIF}

  {$IFDEF GKH}
//     dmBase.WorkQuery.AdsConnection:=dmBase.AdsSharedConnection;
     WorkQuery.SQL.Text:='SELECT * FROM sysspr.PropertysObj WHERE TYPEOBJ=100 and ENABLE=false';
     WorkQuery.Open;
     while not WorkQuery.Eof do begin
       SprMainBase.Add(ANSIUpperCase(WorkQuery.FieldByName('NAME').AsString));
       WorkQuery.Next;
     end;
     WorkQuery.Close;
  {$ENDIF}

  if IsMainComputer and (GlobalTask.ParamAsInteger('SAVE_DOK')>0) then begin
    if ForceDirectories(GlobalTask.PathService+'\') then begin
    end;
  end;

end;
//-------------------------------------------------------------
function TdmBase.EnableEditSpr(strName: String): Boolean;
var
  s:String;
  i:Integer;
begin
  if IsMainBase then begin
    Result:=true;
  end else begin       // при распределенной базе ЖКХ
    Result:=true;
    s:=ANSIUpperCase(strName);
    for i:=0 to SprMainBase.Count-1 do begin
      if s=SprMainBase.Strings[i] then begin
        Result:=false;
      end;
    end;
  end;
end;
//-------------------------------------------------------------
procedure TdmBase.Event_AfterClose(Sender: TObject);
begin
  {$IFDEF OBR_GRAG}
    fmMain.DocRecord.BeforeClose;
  {$ENDIF}
  dmBase.LookUpPunkt.Close;
  dmBase.LookUpPunkt.SQL.Text := '';
  dmBase.LookUpUL.Close;
  dmBase.LookUpUL.SQL.Text := '';
end;
//---------------------------------------------------------
procedure TdmBase.Event_CheckStringFilter(var sFilter:String);   // контроль значения FILTER в OpisEdit  !!!
begin
  sFilter:=CheckTypeShablon(sFilter);   // fShablon.pas
end;
//---------------------------------------------------------
procedure TdmBase.LoadHouseOwners(ID : Integer; d : TDateTime; tb,tbHist: TkbmMemTable);
var
  strName : String;
  lPropis : Boolean;
begin                           
  tb.EmptyTable;
  tbHouseOwners.IndexName := 'VIEW_KEY';
  try
  tbHouseOwners.SetRange([d,ID],[d,ID]);
  while not tbHouseOwners.Eof do begin
    tb.Append;
    tb.FieldByName('NOMER').AsString  := tbHouseOwners.FieldByName('NOMER').AsString;
    tb.FieldByName('TYPEKOD').AsString:= tbHouseOwners.FieldByName('TYPEKOD').AsString;
    tb.FieldByName('KOD').AsString    := tbHouseOwners.FieldByName('KOD').AsString;
    tb.FieldByName('TAIL').AsString   := tbHouseOwners.FieldByName('TAIL').AsString;
    tb.FieldByName('PRIM').AsString   := tbHouseOwners.FieldByName('PRIM').AsString;

    WriteDateField(tb.FieldByName('DATES'), tbHouseOwners.FieldByName('DATES'));
    WriteDateField(tb.FieldByName('DATEP'), tbHouseOwners.FieldByName('DATEP'));
    tb.FieldByName('ADRES').AsString := dmBase.AdresOwner(d,tb.FieldByName('KOD').AsString,
                                   tb.FieldByName('TYPEKOD').AsInteger, strName, lPropis);
    tb.FieldByName('NAME').AsString    := strName;
    tb.FieldByName('PROPIS').AsBoolean := lPropis;
    if strName='не найден' then begin
      tb.FieldByName('ADRES').AsString := '';
    end;
    tb.Post;
    tbHouseOwners.Next;
  end;
  finally
    tbHouseOwners.CancelRange;
  end;
  tb.First;
  if tbHist<>nil then begin
    tbHist.EmptyTable;
    tbHouseOwnersHist.IndexName := 'PR_KEY';
    try
    tbHouseOwnersHist.SetRange([ID],[ID]);
    while not tbHouseOwnersHist.Eof do begin
      tbHist.Append;
      tbHist.FieldByName('NOMER').AsString  := tbHouseOwnersHist.FieldByName('NOMER').AsString;
      tbHist.FieldByName('TYPEKOD').AsString:= tbHouseOwnersHist.FieldByName('TYPEKOD').AsString;
      tbHist.FieldByName('KOD').AsString    := tbHouseOwnersHist.FieldByName('KOD').AsString;
      tbHist.FieldByName('TAIL').AsString   := tbHouseOwnersHist.FieldByName('TAIL').AsString;
      tbHist.FieldByName('PRIM').AsString   := tbHouseOwnersHist.FieldByName('PRIM').AsString;
      WriteDateField(tbHist.FieldByName('DATES'), tbHouseOwnersHist.FieldByName('DATES'));
      WriteDateField(tbHist.FieldByName('DATEP'), tbHouseOwnersHist.FieldByName('DATEP'));
      WriteDateField(tbHist.FieldByName('DATE_ROGD'), tbHouseOwnersHist.FieldByName('DATE_ROGD'));
      WriteDateField(tbHist.FieldByName('DATE_SMER'), tbHouseOwnersHist.FieldByName('DATE_SMER'));
      tbHist.FieldByName('ADRES').AsString := tbHouseOwnersHist.FieldByName('ADRES').AsString;
      tbHist.FieldByName('NAME').AsString  := tbHouseOwnersHist.FieldByName('NAME').AsString;
      tbHist.FieldByName('NAME_MEN').AsString  := tbHouseOwnersHist.FieldByName('NAME_MEN').AsString;
      tbHist.FieldByName('OTCH_MEN').AsString  := tbHouseOwnersHist.FieldByName('OTCH_MEN').AsString;
      tbHist.FieldByName('LICH_NOMER').AsString  := tbHouseOwnersHist.FieldByName('LICH_NOMER').AsString;
      tbHist.FieldByName('UNP').AsString  := tbHouseOwnersHist.FieldByName('UNP').AsString;
      tbHist.FieldByName('TELEFON').AsString  := tbHouseOwnersHist.FieldByName('TELEFON').AsString;
      tbHist.FieldByName('PASSPORT').AsString  := tbHouseOwnersHist.FieldByName('PASSPORT').AsString;
      tbHist.Post;
      tbHouseOwnersHist.Next;
    end;
    finally
      tbHouseOwnersHist.CancelRange;
    end;
    tbHist.First;
  end;
end;

//---------------------------------------------------------
procedure TdmBase.SaveHouseOwners(ID : Integer; d : TDateTime; tb,tbHist: TkbmMemTable);
var
  n:Integer;
begin
  //----- Владельцы ------------------------------------------------------
  dmBase.DeleteFromList( tbHouseOwners, d, ID);
  tb.First;
  n := 1;
  while not tb.Eof do begin
    if not tb.FieldByName('KOD').IsNull and not tb.FieldByName('TYPEKOD').IsNull then begin
      tbHouseOwners.Append;
      tbHouseOwners.FieldByName('DATE_FIKS').Value := d;
      tbHouseOwners.FieldByName('ID').Value        := ID;

      tbHouseOwners.FieldByName('TYPEKOD').AsString := tb.FieldByName('TYPEKOD').AsString;
      tbHouseOwners.FieldByName('KOD').AsString     := tb.FieldByName('KOD').AsString;
      tbHouseOwners.FieldByName('TAIL').AsString    := tb.FieldByName('TAIL').AsString;
      tbHouseOwners.FieldByName('PRIM').AsString    := tb.FieldByName('PRIM').AsString;
      tbHouseOwners.FieldByName('NOMER').AsInteger  := n;
      Inc(n,1);
      WriteDateField( tbHouseOwners.FieldByName('DATES'), tb.FieldByName('DATES') );
      WriteDateField( tbHouseOwners.FieldByName('DATEP'), tb.FieldByName('DATEP') );
      try
        tbHouseOwners.Post;
      except
        tbHouseOwners.Cancel;
      end;
    end;
    tb.Next;
  end;
  tb.First;

  //----- История владельцев ------------------------------------------------------
  if tbHist<>nil then begin
    tbHouseOwnersHist.IndexName:='PR_KEY';
    while tbHouseOwnersHist.FindKey([ID]) do tbHouseOwnersHist.Delete;
    tbHist.First;
    n := 1;
    while not tbHist.Eof do begin
      tbHouseOwnersHist.Append;
      tbHouseOwnersHist.FieldByName('ID').Value:= ID;
      tbHouseOwnersHist.FieldByName('NOMER').AsInteger:=n;
      Inc(n,1);
      tbHouseOwnersHist.FieldByName('TYPEKOD').AsString:=tbHist.FieldByName('TYPEKOD').AsString;
      tbHouseOwnersHist.FieldByName('KOD').AsString:=tbHist.FieldByName('KOD').AsString;
      tbHouseOwnersHist.FieldByName('TAIL').AsString:=tbHist.FieldByName('TAIL').AsString;
      tbHouseOwnersHist.FieldByName('PRIM').AsString:=tbHist.FieldByName('PRIM').AsString;
      WriteDateField(tbHouseOwnersHist.FieldByName('DATES'),tbHist.FieldByName('DATES'));
      WriteDateField(tbHouseOwnersHist.FieldByName('DATEP'),tbHist.FieldByName('DATEP'));
      WriteDateField(tbHouseOwnersHist.FieldByName('DATE_ROGD'),tbHist.FieldByName('DATE_ROGD'));
      WriteDateField(tbHouseOwnersHist.FieldByName('DATE_SMER'),tbHist.FieldByName('DATE_SMER'));
      tbHouseOwnersHist.FieldByName('ADRES').AsString:=tbHist.FieldByName('ADRES').AsString;
      tbHouseOwnersHist.FieldByName('NAME').AsString:=tbHist.FieldByName('NAME').AsString;
      tbHouseOwnersHist.FieldByName('NAME_MEN').AsString:=tbHist.FieldByName('NAME_MEN').AsString;
      tbHouseOwnersHist.FieldByName('OTCH_MEN').AsString:=tbHist.FieldByName('OTCH_MEN').AsString;
      tbHouseOwnersHist.FieldByName('LICH_NOMER').AsString:=tbHist.FieldByName('LICH_NOMER').AsString;
      tbHouseOwnersHist.FieldByName('UNP').AsString:=tbHist.FieldByName('UNP').AsString;
      tbHouseOwnersHist.FieldByName('TELEFON').AsString:=tbHist.FieldByName('TELEFON').AsString;
      tbHouseOwnersHist.FieldByName('PASSPORT').AsString:=tbHist.FieldByName('PASSPORT').AsString;
      try
        tbHouseOwnersHist.Post;
      except
        tbHouseOwnersHist.Cancel;
      end;
      tbHist.Next;
    end;
    tbHist.First;
  end;
end;

function TdmBase.GetNomerDom(strDom : String; nType:Integer) : String;
begin
  Result := PadLStr(Trim(strDom),SIZE_FIELD_DOM,' ');
end;

function TdmBase.GetNomerDomEx(strDom : String; nType:Integer) : String;
begin
  if Trim(strDom)=''
    then Result := ''
    else Result := PadLStr(Trim(strDom),SIZE_FIELD_DOM,' ');
end;
//---------------------------------------------------------------------------------------------
procedure TdmBase.LoadBigHouseProp(adr : TAdres; d : TDateTime; tb: TkbmMemTable);
var
  nPunkt,nUL : Integer;
  strDom, strKorp : String;
begin
  tb.EmptyTable;
  tbBigHouse.IndexFieldNames := 'DATE_FIKS;PUNKT;UL;DOM;KORP';
  nPunkt := StrToInt(adr.Punkt);
  if Trim(adr.Ulica)=''
    then nUL:=0
    else nUL:=StrToInt(adr.Ulica);
  strDom := getNomerDom(adr.Dom);
  if Trim(strDom)='' then strDom:=HOUSE_EMPTY_DOM;
  strKorp:= getNomerDom(adr.Korp);
  if Trim(strKorp)='' then strKorp:=HOUSE_EMPTY_KORP;
  tbBigHouse.IndexName:='PR_KEY';
  tb.Append;
  if tbBigHouse.FindKey([d,nPunkt,nUL,strDom,strKorp]) then begin
    tb.FieldByName('PUNKT').AsInteger:=nPunkt;
    tb.FieldByName('UL').AsInteger:=nUL;
    tb.FieldByName('DOM').AsString:=strDom;
    tb.FieldByName('KORP').AsString:=strKorp;

    tb.FieldByName('CHET').AsBoolean:=tbBigHouse.FieldByName('CHET').AsBoolean;
    tb.FieldByName('OTDELNO').AsBoolean:=tbBigHouse.FieldByName('OTDELNO').AsBoolean;
    tb.FieldByName('GILOE').AsBoolean:=tbBigHouse.FieldByName('GILOE').AsBoolean;
    if tbBigHouse.FieldByName('KOL_KV').AsInteger>0
      then tb.FieldByName('KOL_KV').AsInteger:=tbBigHouse.FieldByName('KOL_KV').AsInteger;
    if tbBigHouse.FieldByName('KOL_ETAG').AsInteger>0
      then  tb.FieldByName('KOL_ETAG').AsInteger:=tbBigHouse.FieldByName('KOL_ETAG').AsInteger;
    tb.FieldByName('NAME').AsString:=tbBigHouse.FieldByName('NAME').AsString;
    tb.FieldByName('GOD_VOZV').AsString:=tbBigHouse.FieldByName('GOD_VOZV').AsString;
    tb.FieldByName('TYPE_VOZV').AsString:=tbBigHouse.FieldByName('TYPE_VOZV').AsString;
    //    боровляны
    //if tbBigHouse.FieldByName('PLOSH_ZDAN').AsString<>''
    //  then tb.FieldByName('PLOSH_ZDAN').AsFloat:=tbBigHouse.FieldByName('PLOSH_ZDAN').AsFloat;
    //
    tb.FieldByName('MAT_STEN').AsString:=tbBigHouse.FieldByName('MAT_STEN').AsString;
//    tb.FieldByName('TIP').AsString:=tbBigHouse.FieldByName('TIP').AsString;

    if tbBigHouse.FieldByName('PRIVATE_SECT').IsNull then begin
      {$IFDEF GKH}
        tb.FieldByName('PRIVATE_SECT').AsBoolean:=false;
      {$ELSE}
        tb.FieldByName('PRIVATE_SECT').AsBoolean:=true;
      {$ENDIF}
    end else begin
      tb.FieldByName('PRIVATE_SECT').AsBoolean:=tbBigHouse.FieldByName('PRIVATE_SECT').AsBoolean;
    end;
    tb.FieldByName('CONTROL').AsString:=tbBigHouse.FieldByName('CONTROL').AsString;
    tb.FieldByName('USE_GILFOND').AsString:=tbBigHouse.FieldByName('USE_GILFOND').AsString;

    {$IFDEF GKH}
      if tbBigHouse.FieldByName('KANALIZ').AsString<>'' then tb.FieldByName('KANALIZ').AsBoolean:=tbBigHouse.FieldByName('KANALIZ').AsBoolean;
      if tbBigHouse.FieldByName('CENT_OTOP').AsString<>'' then tb.FieldByName('CENT_OTOP').AsBoolean:=tbBigHouse.FieldByName('CENT_OTOP').AsBoolean;
      if tbBigHouse.FieldByName('GOR_VODA').AsString<>'' then tb.FieldByName('GOR_VODA').AsBoolean:=tbBigHouse.FieldByName('GOR_VODA').AsBoolean;
      if tbBigHouse.FieldByName('VODOPROV').AsString<>'' then tb.FieldByName('VODOPROV').AsBoolean:=tbBigHouse.FieldByName('VODOPROV').AsBoolean;
      if tbBigHouse.FieldByName('GAZ').AsString<>'' then tb.FieldByName('GAZ').AsBoolean:=tbBigHouse.FieldByName('GAZ').AsBoolean;
      if tbBigHouse.FieldByName('LIFT').AsString<>'' then tb.FieldByName('LIFT').AsBoolean:=tbBigHouse.FieldByName('LIFT').AsBoolean;
      if tbBigHouse.FieldByName('MUSOROPR').AsString<>'' then tb.FieldByName('MUSOROPR').AsBoolean:=tbBigHouse.FieldByName('MUSOROPR').AsBoolean;
    {$ENDIF}

  end;
  tb.Post;
end;

procedure TdmBase.SaveBigHouseProp(adr : TAdres; d : TDateTime; tb: TkbmMemTable);
var
  nPunkt,nUL,nTip,nID : Integer;
  strDom,strKorp : String;
begin
  nPunkt := StrToInt(adr.Punkt);
  if Trim(adr.Ulica)=''
    then nUL:=0                       
    else nUL:=StrToInt(adr.ULica);
  strDom := getNomerDom(adr.Dom);
  if Trim(strDom)='' then strDom:=HOUSE_EMPTY_DOM;
  strKorp:= getNomerDom(adr.Korp);
  if Trim(strKorp)='' then strKorp:=HOUSE_EMPTY_KORP;
  tbBigHouse.IndexName:='PR_KEY';
  if not tbBigHouse.FindKey([d,nPunkt,nUL,strDom,strKorp]) then begin
    tbBigHouse.Append;
    tbBigHouse.FieldByName('DATE_FIKS').AsDateTime:=d;
    tbBigHouse.FieldByName('PUNKT').AsInteger:=nPunkt;
    tbBigHouse.FieldByName('UL').AsInteger:=nUL;
    tbBigHouse.FieldByName('DOM').AsString:=strDom;
    tbBigHouse.FieldByName('KORP').AsString:=strKorp;
  end else begin
    tbBigHouse.Edit;
  end;
  tbBigHouse.FieldByName('CHET').AsBoolean:=tb.FieldByName('CHET').AsBoolean;
  tbBigHouse.FieldByName('OTDELNO').AsBoolean:=tb.FieldByName('OTDELNO').AsBoolean;
  tbBigHouse.FieldByName('GILOE').AsBoolean:=tb.FieldByName('GILOE').AsBoolean;
  tbBigHouse.FieldByName('KOL_KV').AsInteger:=tb.FieldByName('KOL_KV').AsInteger;
  tbBigHouse.FieldByName('NAME').AsString:=tb.FieldByName('NAME').AsString;
  //
  tbBigHouse.FieldByName('KOL_ETAG').Asstring:=tb.FieldByName('KOL_ETAG').AsString;
  tbBigHouse.FieldByName('GOD_VOZV').AsString:=tb.FieldByName('GOD_VOZV').AsString;
  tbBigHouse.FieldByName('TYPE_VOZV').AsString:=tb.FieldByName('TYPE_VOZV').AsString;
//    боровляны
//  if tb.FieldByName('PLOSH_ZDAN').AsFloat>0
//    then tbBigHouse.FieldByName('PLOSH_ZDAN').AsFloat:=tb.FieldByName('PLOSH_ZDAN').AsFloat
//    else tbBigHouse.FieldByName('PLOSH_ZDAN').AsString:='';
//
  tbBigHouse.FieldByName('MAT_STEN').AsString:=tb.FieldByName('MAT_STEN').AsString;

  // сменился тип проживания  (может быть нескольеко адресов в доме, приоритет имеет тип "жилой=1")
  if tbBigHouse.FieldByName('TIP').AsString<>tb.FieldByName('TIP').AsString then begin
   nTip:=TipBigHouseFromAdres(d, StrToInt(adr.Punkt), nUL, adr.Dom, adr.Korp, '{---}', nID);
   tbBigHouse.FieldByName('TIP').AsInteger:=nTip;
  end;

  tbBigHouse.FieldByName('PRIVATE_SECT').AsBoolean:=tb.FieldByName('PRIVATE_SECT').AsBoolean;
  tbBigHouse.FieldByName('CONTROL').AsString:=tb.FieldByName('CONTROL').AsString;
  tbBigHouse.FieldByName('USE_GILFOND').AsString:=tb.FieldByName('USE_GILFOND').AsString;

  {$IFDEF GKH}
    tbBigHouse.FieldByName('KANALIZ').AsBoolean:=tb.FieldByName('KANALIZ').AsBoolean;
    tbBigHouse.FieldByName('CENT_OTOP').AsBoolean:=tb.FieldByName('CENT_OTOP').AsBoolean;
    tbBigHouse.FieldByName('GOR_VODA').AsBoolean:=tb.FieldByName('GOR_VODA').AsBoolean;
    tbBigHouse.FieldByName('VODOPROV').AsBoolean:=tb.FieldByName('VODOPROV').AsBoolean;
    tbBigHouse.FieldByName('GAZ').AsBoolean:=tb.FieldByName('GAZ').AsBoolean;
    tbBigHouse.FieldByName('LIFT').AsBoolean:=tb.FieldByName('LIFT').AsBoolean;
    tbBigHouse.FieldByName('MUSOROPR').AsBoolean:=tb.FieldByName('MUSOROPR').AsBoolean;
  {$ENDIF}

  tbBigHouse.Post;
end;

//----------------------------------------------------------------------------------
function TdmBase.AddBigHouse(adr : TAdres; d : TDateTime; lWriteName:Boolean; var strErr:String) : Boolean;
var
  nChet:Integer;
  strChet,strName:String;
begin
  if lWriteName
    then strName:=adr.NameHouse
    else strName:='';
  nChet := CheckChetNomer(Trim(adr.Dom));
  if (nChet=0) or (nChet=1)
    then strChet:='false'
    else strChet:='true';
  if Trim(adr.Dom)=''  then adr.Dom:=HOUSE_EMPTY_DOM;
  if Trim(adr.Korp)='' then adr.Korp:=HOUSE_EMPTY_KORP;
  WorkQuery.SQL.Text := 'INSERT INTO BigHouse (DATE_FIKS,PUNKT,UL,DOM,KORP,CHET,GILOE,OTDELNO,NAME)'+#13+
        ' VALUES ( '+
        QStr(DTOS(d,tdAds))+','+    // Date_Fiks
        adr.Punkt+','+                 // нас.пункт
        IntToStr(adr.UlicaInt)+','+    // улица
        QStr(adr.Dom)+','+             // дом
        QStr(adr.Korp)+','+            // корпус
        strChet+','+
        'true'+','+
        'false'+','+
        QStr(strName)+
          ')';
  Result:=false;
  try
    WorkQuery.ExecSQL;
    Result:=true;
  except
    on E: Exception do strErr:=E.Message;
  end;
end;

//----------------------------------------------------------------------------------
function TdmBase.FindBigHouse(adr : TAdres; d : TDateTime) : Boolean;
var
  nPunkt : Integer;
  strDom,strKorp : String;
begin
  nPunkt := StrToInt(adr.Punkt);
  strDom := getNomerDom(adr.Dom);
  if Trim(strDom)='' then strDom:=HOUSE_EMPTY_DOM;
  strKorp:= getNomerDom(adr.Korp);
  if Trim(strKorp)='' then strKorp:=HOUSE_EMPTY_KORP;
  tbBigHouse.IndexName:='PR_KEY';
  if tbBigHouse.FindKey([d,nPunkt,adr.UlicaInt,strDom,strKorp])
    then Result:=true
    else Result:=false;
end;

function TdmBase.NameBigHouse(adr: TAdres; d: TDateTime): String;
begin
  Result:='';
  if FindBigHouse(adr, d) then begin
    Result := tbBigHouse.FieldByName('NAME').AsString;
  end;
end;

function TdmBase.SaveNameBigHouse(strNameHouse: String; adr: TAdres;  d: TDateTime) : Boolean;
var
  strErr:String;
begin
  Result:=false;
  if FindBigHouse(adr, d) then begin
    try
      tbBigHouse.Edit;
      tbBigHouse.FieldByName('NAME').AsString:=strNameHouse;
      tbBigHouse.Post;
      Result:=true;
    except

    end;
  end else begin
    adr.NameHouse:=strNameHouse;
    Result:=AddBigHouse(adr,d,true,strErr);
  end;
end;

function TdmBase.WriteJurnOper(nID:Integer;nResult:Integer;sResult:String):Boolean;
var
  tb:TAdsTable;
begin
  Result:=true;
  tb := TAdsTable.Create(Self);
  tb.AdsConnection := dmBase.AdsConnection;
  tb.Name:='tbJurnOper';
  tb.TableName:='JurnOper';
  try
    tb.Open;
    tb.Append;
    tb.FieldByName('ID').AsInteger:=nID;
    tb.FieldByName('DATEOPER').AsDateTime:=Date;
    tb.FieldByName('TIMEOPER').AsDateTime:=Time;
    tb.FieldByName('RESULT_TYPE').AsInteger:=nResult;
    tb.FieldByName('RESULT_OPIS').AsString:=sResult;
    tb.Post;
    tb.Close;
  except
    Result:=false;
  end;
  tb.Free;
end;

function TdmBase.AnyExport(strCaption,strNameExp : String; lArx : Boolean; lChoicePath : Boolean; strDir:String; sRunShell:String):Boolean;
var
  i : Integer;
  strPath,s,strNameProc,strSection,sAdd : String;
  tb : TAdsTable;
  arrTables,arrPar : TArrStrings;
  vResult : Variant;
  List : TStringList;
  Zip : TZipForge;
  lRunExport,lAddID : Boolean;
  strPar,strNameArx,strTableName,strFileSource,strFileDest : String;
  lOk,lWrite : Boolean;
begin
  Result:=false;
  SetLength(arrPar,0);
  lOk := true;
  strPar:='';
  lWrite:=false;
  if (strDir<>'') then begin
    if (Copy(strDir,1,1)='&') then begin
      strPar:=Copy(strDir,2,Length(strDir));
      strDir:=GlobalTask.GetMainParam('EXPORT',strPar,'C','');
      lWrite:=true;
    end else if (Copy(strDir,1,1)='#') then begin
      strPar:=Copy(strDir,2,Length(strDir));
      strDir:=Trim(GlobalTask.ParamAsString(strPar));
    end;
    if strDir=''
      then lChoicePath:=true
      else lChoicePath:=false;
  end;
  if lChoicePath then begin   // выбрать папку для копирования результата
    lOk := false;
    if SelectDirectory('Выберите папку для копирования результирующего файла', '', strDir) then begin
      CheckSlesh(strDir);
      lOk := true;
    end;
  end else if strDir<>'' then begin  // передано имя папки для копирования результата
    CheckSlesh(strDir);
    lChoicePath:=true;
  end;
  if lOk then begin
    strPath := ExtractFilePath(Application.ExeName)+'Export';
    ForceDirectories(strPath);
    ClearDir(strPath,false);
    fmMain.ConnectExp.ConnectPath:=strPath;
    fmMain.ConnectExp.Connect;
    strNameProc:='';
    if Copy(strNameExp,1,1)='&' then begin
      strNameProc:=Copy(strNameExp,2,100);
      vResult:=null;
      GlobalTask.Script.RunEx(strNameProc+'_Tables',[],vResult);
      if vResult<>null then begin
        strNameExp := VarToStr(vResult);
      end;
    end;
    StrToArr(strNameExp,arrTables,';',true);
    List := TStringList.Create;
    lRunExport:=false;
    strTableName:='';     // !!!
    if Length(arrTables)>0 then begin
      if strNameProc='' then begin
        strNameProc:=arrTables[0];
      end;
      strNameArx:=strNameProc+'_'+Globaltask.ParamAsString('ID')+'.zip';
      try
        for i:=0 to Length(arrTables)-1 do begin
          s := arrTables[i];
          tb := TAdsTable.Create(fmMain);
          tb.TableType := ttAdsCDX;
          tb.AdsTableOptions.AdsCharType := ANSI;
          tb.AdsConnection := fmMain.ConnectExp;
          tb.Name := 'exp'+s;
          vResult:=null;
          GlobalTask.Script.RunEx(strNameProc+'_Prop',[],vResult);
          if vResult<>null then begin
            arrpar := ArrParamAdsFromStr(VarToStr(vResult));
            SetParamAdsTable(tb,arrpar);
          end;
          // если будет ADT надо будет переделывать
          lAddID:=GetElAsBoolean( arrPar, 'ADD_ID', true);
          if lAddID
            then tb.TableName:=s+'_'+Globaltask.ParamAsString('ID')+'.dbf'
            else tb.TableName:=s+'.dbf';
          //-------------------------------
          strSection:=s+'.dbf';           // !!!
          strTableName:=tb.TableName;     // !!!
          //-------------------------------

          if FileExists(strPath+'\'+tb.TableName) then begin
            DeleteFile(strPath+'\'+tb.TableName);
          end;
          List.AddObject(tb.TableName,tb);
          CheckTable(tb,false,false,strSection);
          tb.Open;
        end;
        lRunExport:=true;
      except
        on E: Exception do PutError('Ошибка экспорта: '+E.Message);
      end;
    end;
    vResult:=null;
    try
      if lRunExport then begin
        OpenMessage(strCaption,'',10);
        try
          GlobalTask.Script.RunEx(strNameProc,[strPath],vResult);
          lRunExport:=vResult;
//          Result:=lRunExport;
        finally
          CloseMessage;
        end;
      end;
    finally
      for i:=0 to List.Count-1 do begin
        TAdsTable(List.Objects[i]).Active:=false;
        List.Objects[i].Free;
      end;
      List.Free;
      fmMain.ConnectExp.Disconnect;
    end;
//    nFileSize:=0;
    if lRunExport and lArx then begin
      Zip := TZipForge.Create(fmMain);
      Zip.FileName := strPath+'\'+strNameArx;
      Zip.BaseDir  := strPath;
      Zip.OpenArchive(fmCreate);
      Zip.AddFiles('*.*');
      Zip.CloseArchive;
//      nFileSize := GetFileSize(Zip.FileName);
      Zip.Free;
      // удалим файлы экспорта если было архивирование
      DeleteFiles(strPath+'\*.xml');
      DeleteFiles(strPath+'\*.ini');
      DeleteFiles(strPath+'\*.dbf');
      DeleteFiles(strPath+'\*.fpt');
      DeleteFiles(strPath+'\*.cdx');
      DeleteFiles(strPath+'\*.dbt');
      DeleteFiles(strPath+'\*.ntx');
      DeleteFiles(strPath+'\*.adt');
      DeleteFiles(strPath+'\*.adi');
      DeleteFiles(strPath+'\*.adm');
    end;
    // 1   !!! ================================
    if lRunExport and (lArx or (Length(arrTables)=1)) and (strDir='') then begin
      if (sRunShell<>'') then begin
        if LowerCase(sRunShell)='nil'
          then ShellExecute(Application.Handle, nil, PChar(strFileDest), nil, nil, SW_SHOWNORMAL)
          else ShellExecute(Application.Handle, PChar(sRunShell), PChar(strDir), nil, nil, SW_SHOWNORMAL);
      end;
    end;

    // 2   !!! ==========================
    // копируем по пути если есть путь для копирования и было архивирование или файл только один
    if lRunExport and (lArx or (Length(arrTables)=1)) and lChoicePath then begin
      OpenMessage('Копирование по пути: '+strDir+' ...');
      ForceDirectories(strDir);
      {
      nFree := GetDiskFree(strDisk);
          if nFree < n then begin
            PutError(' На диске '+QStr(strDisk)+' не хватает места для размещения файла  !');
          end else begin
      }

      //----------------------    // имя файла источника
      if lArx then begin
        strFileSource:=strPath+'\'+strNameArx;
      end else begin
        strFileSource:=strPath+'\'+strTableName; // !!! см.выше присвоение имени, корректно только если одна таблица
      end;
      //----------------------    // имя файла результата
      vResult:=null;
      GlobalTask.Script.RunEx(strNameProc+'_ResultFile',[],vResult);
      CheckSlesh(strDir);
      if vResult<>null then begin
        s:=VarToStr(vResult);
        strFileDest:=strDir+s;
      end else begin
        if lArx then begin
          strFileDest:=strDir+strNameArx;
        end else begin
          strFileDest:=strDir+strTableName;
        end;
      end;
      //----------------------
      if CopyFile(PChar(strFileSource), PChar(strFileDest), false) then begin
        lOk:=true;
        CloseMessage();

        if (sRunShell='') then begin   // выдадим сообщение если не надо открывать папку
          ShowMessage('Выгрузка успешно завершена.'+#13+' Файл: '+strFileDest);
        end;

      end else begin
        lOk:=false;
        CloseMessage();
        PutError('Ошибка копирования файла : '+strFileSource+
                 #13+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');

      end;
      sAdd:='';
      if (sRunShell<>'') and lOk then begin
        if LowerCase(sRunShell)='riap' then begin  // передать на портал RIAP
           {$IFDEF LAIS}
 //            TypeServerFTP:=;   // 1-Брест  2-портал РИАП
             SetPropertyFPT(fmMain.IdFTP1, SERVER_RIAP, 'vigr');
             fmMain.CheckVisibleProgress(true,'Передача:');
             if fmMain.PutFileFTP(true, strDir+strNameArx) then begin
               sAdd:='(передан на портал)';
             end;
             fmMain.CheckVisibleProgress(false,'');
           {$ENDIF}
        end else if LowerCase(sRunShell)='brest' then begin
           {$IFDEF LAIS}
//             TypeServerFTP:=SERVER_BREST;   // 1-Брест  2-портал РИАП
             SetPropertyFPT(fmMain.IdFTP1, SERVER_BREST, 'data');
             fmMain.CheckVisibleProgress(true,'Передача:');
             fmMain.PutFileFTP(true,strDir+strNameArx);
             fmMain.CheckVisibleProgress(false,'');
           {$ENDIF}
        end else begin
          if LowerCase(sRunShell)='nil'
            then ShellExecute(Application.Handle, nil, PChar(strFileDest), nil, nil, SW_SHOWNORMAL)
            else ShellExecute(Application.Handle, PChar(sRunShell), PChar(strDir), nil, nil, SW_SHOWNORMAL);
        end;
      end;
      if lOk and (UpperCase(strNameProc)='VIGR_LAIS') then begin
        WriteJurnOper(1,1,strDir+strNameArx+sAdd);
      end;

    end;
    if lOk and lRunExport then begin
      if lWrite then begin
        GlobalTask.SetMainParam('EXPORT', strPar, 'C', DeleteSlesh(strDir));
      end;
      Result:=true;
    end;
  end;  // lOk
end;

function TdmBase.GetNameSectionTable(TableName: String): String;
begin
  if ANSIUpperCase(Copy(TableName,1,9))='VIB_OBSL_' then begin
    Result:='VIB_OBSL.DBF';
  end else if ANSIUpperCase(Copy(TableName,1,7))='ZAGS13_' then begin
    Result:='ZAGS13.DBF';
  end else begin
    Result:=inherited GetNameSectionTable(TableName);
  end;
end;

function TdmBase.LoadSQLEx(strNameSQL: String): String;
var
  s : String;
//  sl:TStringList;
begin
  Result:='';
  if LoadSQL(strNameSQL, s) then begin
//    strtoarr(
//    sl:=TStringList.Create;
//    sl.Comatext
    Result := s;
    Result := CheckDateFiksSQL(Result,GetDateCurrentSost);
    Result := CheckParamsSQL(Result);
  end;
end;
//------------------------------------------------------------------------
{$IF Defined(ZAGS) or Defined(POST) }
function TdmBase.CreateBigHouse: Boolean;
begin
  Result:=true;
end;
{$ELSE}
function TdmBase.CreateBigHouse: Boolean;
var
  vKeyValues,v : Variant;
  strSQL : String;
  lErr : Boolean;
  n,k,i,nIDAdr:Integer;
  m : Extended;
  strDom,strKorp,strD1,strD2 : String;
  d : TDateTime;
begin
  Result := true;
//  'update население set adres_id=l.adres_id ' +
//  '  from лицевыесчета l  '+
//  '  where l.date_fiks=население.date_fiks and население.lic_id=l.id;';
  dmBase.WorkQuery.Close;
  dmBase.WorkQuery.AdsConnection := dmBase.AdsConnection;
  dmBase.AdsConnection.Execute('DELETE FROM BigHouse');
  strSQL := LoadSQLEx('Создание_базы_домов');
  lErr:=true;
  i:=0;
  try
    dmBase.AdsConnection.Execute(strSQL);
    lErr:=false;
  except
    on E: Exception do PutError(' Ошибка формирования базы домов. '+#13+E.Message);
  end;
  if not lErr then begin
    tbBigHouse.First;
    vKeyValues := VarArrayCreate( [0, 1], varOleStr );
    while not tbBigHouse.Eof do begin
      if i>100 then begin
        Application.ProcessMessages;
        i:=0;
      end else begin
        Inc(i,1);
      end;
      strDom := tbBigHouse.FieldByName('DOM').AsString;
      if strDom=HOUSE_EMPTY_DOM then strDom:='';
      strKorp:= tbBigHouse.FieldByName('KORP').AsString;
      if strKorp=HOUSE_EMPTY_KORP then strKorp:='';
      d := tbBigHouse.FieldByName('DATE_FIKS').AsDateTime;
      n:=CheckChetNomer(Trim(strDom));
      nIDAdr:=0;
      if FindAdres(d,tbBigHouse.FieldByNAme('PUNKT').AsInteger,
                     tbBigHouse.FieldByNAme('UL').AsInteger,strDom,strKorp,'{---}',-1) then begin
        vKeyValues[0] := d;
        vKeyValues[1] := Adres_ID;
        if tbAdres.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
          nIDAdr := Adres_ID;
        end;
      end;
      dmBase.tbBigHouse.Edit;
      if nIDAdr>0 then begin
        if tbAdres.FieldByName('KOL_ETAG').AsInteger>0
          then dmBase.tbBigHouse.FieldByNAme('KOL_ETAG').AsInteger:=tbAdres.FieldByName('KOL_ETAG').AsInteger;

//        dmBase.tbBigHouse.FieldByNAme('TIP').AsString:=tbAdres.FieldByName('TIP').AsString;
        dmBase.tbBigHouse.FieldByNAme('CONTROL').AsString:=tbAdres.FieldByName('CONTROL').AsString;
        dmBase.tbBigHouse.FieldByNAme('USE_GILFOND').AsString:=tbAdres.FieldByName('USE_GILFOND').AsString;

        try
          // вдруг число больше чем 32000
          k:=ReadPropAsInteger(d,nIDAdr,'GOD_VOZV');
          if k>0 then dmBase.tbBigHouse.FieldByName('GOD_VOZV').AsInteger:=k;
        except
        end;
        try
          k:=ReadPropAsInteger(d,nIDAdr,'TYPE_VOZV');
          if k<=0 then k:=1;
          dmBase.tbBigHouse.FieldByName('TYPE_VOZV').AsInteger:=k;
        except
        end;

//        m:=ReadPropAsFloat(d,nIDAdr,'PLOSH_ZDAN');
//        if Ceil(m)>0 then dmBase.tbBigHouse.FieldByNAme('PLOSH_ZDAN').AsFloat:=m;

        k:=ReadPropAsInteger(d,nIDAdr,'MAT_STEN');
        if k>0 then dmBase.tbBigHouse.FieldByName('MAT_STEN').AsInteger:=k;

        {$IFDEF GKH}
          v:=ReadOneProp(d,nIDAdr,'LIFT',ftBoolean);
          if v<>null then dmBase.tbBigHouse.FieldByName('LIFT').AsBoolean:=v;

          v:=ReadOneProp(d,nIDAdr,'MUSOROPR',ftBoolean);
          if v<>null then dmBase.tbBigHouse.FieldByName('MUSOROPR').AsBoolean:=v;

//          v:=ReadOneProp(d,nIDAdr,'VODOPROV',ftBoolean);
//          if v<>null then dmBase.tbBigHouse.FieldByName('VODOPROV').AsBoolean:=v;

          v:=ReadOneProp(d,nIDAdr,'KANALIZ',ftBoolean);
          if v<>null then dmBase.tbBigHouse.FieldByName('KANALIZ').AsBoolean:=v;

          v:=ReadOneProp(d,nIDAdr,'VODOPROV',ftBoolean);
          if v<>null then dmBase.tbBigHouse.FieldByName('VODOPROV').AsBoolean:=v;

          v:=ReadOneProp(d,nIDAdr,'CENT_OTOP',ftBoolean);
          if v<>null then dmBase.tbBigHouse.FieldByName('CENT_OTOP').AsBoolean:=v;

          v:=ReadOneProp(d,nIDAdr,'GOR_VODA',ftBoolean);
          if v<>null then dmBase.tbBigHouse.FieldByName('GOR_VODA').AsBoolean:=v;

          dmBase.tbBigHouse.FieldByNAme('PRIVATE_SECT').AsBoolean:=false;
        {$ELSE}
          dmBase.tbBigHouse.FieldByNAme('PRIVATE_SECT').AsBoolean:=true;
        {$ENDIF}
      end;
      case n of
        0,1: dmBase.tbBigHouse.FieldByName('CHET').AsBoolean:=false;
        2  : dmBase.tbBigHouse.FieldByName('CHET').AsBoolean:=true;
      end;
      dmBase.tbBigHouse.Post;
      dmBase.tbBigHouse.Next;
    end;
    dmBase.tbAdres.First;
    while not tbAdres.Eof do begin
      if i>100 then begin
        Application.ProcessMessages;
        i:=0;
      end else begin
        Inc(i,1);
      end;
      dmBase.tbAdres.Edit;
      RazdNomerDom(dmBase.tbAdres.FieldByName('DOM').AsString,strD1,strD2);

//      dmBase.tbAdres.FieldByName('DOM1').AsString:=dmBase.GetNomerDom(strD1);
//      if dmBase.tbAdres.FieldByName('DOM1').IsNull then dmBase.tbAdres.FieldByName('DOM1').AsString:=' ';
//      dmBase.tbAdres.FieldByName('DOM2').AsString:=dmBase.GetNomerDom(strD2);
//      if dmBase.tbAdres.FieldByName('DOM2').IsNull then dmBase.tbAdres.FieldByName('DOM2').AsString:=' ';
      if Trim(strD1)=''
        then dmBase.tbAdres.FieldByName('DOM1').Value:=null
        else dmBase.tbAdres.FieldByName('DOM1').AsString:=dmBase.GetNomerDom(strD1);
      if Trim(strD2)=''
        then dmBase.tbAdres.FieldByName('DOM2').Value:=null
        else dmBase.tbAdres.FieldByName('DOM2').AsString:=dmBase.GetNomerDom(strD2);
      dmBase.tbAdres.Post;
      dmBase.tbAdres.Next;
    end;
  end;
  dmBase.tbAdres.First;
  dmBase.tbBigHouse.First;
end;
{$IFEND}

//------------------------------------------------------------------------------------
// реальный номер в очереди
function TdmBase.GetRealNomerOch(nBase:Integer; nTypeOchered:Integer; nID:Integer):Integer;
begin
  WorkQuery.SQL.Text:='SELECT GetRealNomer('+IntToStr(nBase)+','+IntToStr(nTypeOchered)+','+InttoStr(nID)+') FROM system.iota';
  try
    try
      WorkQuery.Open;
      Result:=dmBase.WorkQuery.Fields[0].AsInteger;
    except
      Result:=0;
    end;
  finally
    WorkQuery.Close;
  end;
end;

//------------------------------------------------------------------------------------
// реальный номер в очереди  (с без необходимоти присутствия в базе)
function TdmBase.GetRealNomerOchEx(nBase:Integer; nTypeOchered:Integer; nID:Integer; dDecDate:TDateTime; dDecTime:TDateTime; nSimple:Integer; nOldNomer:Integer):Integer;
var
  n,m:Integer;
  sTime,s:String;
begin
  sTime:=FormatDateTime('HH:NN',dDecTime);
  if sTime='00:00'
    then sTime:='null'
    else sTime:=QStr(sTime);
  if nOldNomer=0
    then s:='convert(null,SQL_INTEGER)'
    else s:=IntToStr(nOldNomer);
  WorkQuery.SQL.Text:='SELECT ID, SIMPLE, DEC_DATE, DEC_TIME, OLD_NOMER, ONLY FROM ochered  WHERE ochered_id='+IntToStr(nTypeOchered)+#13#10+
                      ' and id_base='+IntToStr(nBase)+' and iskl=false and id<>'+IntToStr(nID)+#13#10+
                      '     union all  '#13#10+
                      'SELECT '+IntToStr(nID)+', '+IntToStr(nSimple)+', convert('+DateToSQL(dDecDate)+',SQL_DATE) dec_date, convert('+sTime+',SQL_TIME) dec_time, '+s+', false FROM system.iota'#13#10+
                      ' ORDER BY SIMPLE,DEC_DATE,DEC_TIME,OLD_NOMER ';
//  ShowMemo(WorkQuery.SQL,'','');
//  MemoWrite('last.sql', WorkQuery.SQL.Text);
  try
    WorkQuery.Open;
    n:=0;
    m:=0;
    dmBase.AdsConnection.Execute('execute procedure sp_ZapTable('+QStr('Временная')+');');
    while not WorkQuery.Eof do begin
      if (nTypeOchered=0) and WorkQuery.FieldByName('ONLY').AsBoolean then begin

      end else begin
        n:=n+1;
        dmBase.AdsConnection.Execute('insert into Временная (date_fiks,id,nomer) values ('+
           DateToSQL(WorkQuery.FieldByName('DEC_DATE').AsDateTime)+','+ WorkQuery.FieldByName('ID').AsString+','+
                     IntToStr(n)+')');
        if WorkQuery.FieldByName('ID').AsInteger=nID then begin
          m:=n;
          break;
        end;
      end;
      WorkQuery.Next;
    end;
    Result:=m;
  finally
    WorkQuery.Close;
  end;
{
  WorkQuery.SQL.Text:='SELECT GetRealNomerEx('+IntToStr(nBase)+','+IntToStr(nTypeOchered)+','+InttoStr(nID)+
                      ','+DateToSQL(dDecDate)+','+InttoStr(nSimple)+') FROM system.iota';
//  MemoWrite('last1.sql', WorkQuery.SQL.Text);
  try
    WorkQuery.Open;
    Result:=dmBase.WorkQuery.Fields[0].AsInteger;
  finally
    WorkQuery.Close;
  end;
 }
//  ShowMessage(inttostr(result));
end;

//------------------------------------------------------------------------------------
//  если DataSet содержит поле Date_Fiks, то ищем по TAdsTable, иначе это kbmMemTable
//------------------------------------------------------------------------------------
function TdmBase.LgotMen(dsLgot:TDataSet; DateFiks:TDateTime; strID:String; strDelim:String): String;
var
  iID : Integer;
  lAdsTable, lKr : Boolean;
  s:String;
  fld:TField;
begin
  Result:='';
  if Pos('<К>', strDelim)>0 then begin
    lKr:=true;
    strDelim:=StringReplace(strDelim,'<К>','',[]);
  end else begin
    lKr:=false;
  end;
  lAdsTable:=false;
  try
    iID:=StrToInt(strID);
  except
    iID:=0;
  end;
  if (dsLgot is TAdsTable) and (dsLgot.FindField('DATE_FIKS')<>nil) then begin
    if iID=0 then exit;
    TAdsTable(dsLgot).IndexFieldNames := 'DATE_FIKS;ID;KOD';
    TAdsTable(dsLgot).SetRange([DateFiks,iID],[DateFiks,iID]);
    lAdsTable:=true;
  end;
  try
    fld:=dmBase.SprLgot.FindField('KNAME');
    dsLgot.First;
    while not dsLgot.Eof do begin
      if dmBase.SprLgot.Locate('ID',dsLgot.FieldByName('KOD').AsString,[]) then begin
        if lKr and (fld<>nil) and (fld.AsString<>'')
          then s:=fld.AsString
          else s:=dmBase.SprLgot.FieldByName('NAME').AsString;
        Result := Result + s + strDelim;
      end;
      dsLgot.Next;
    end;
    if Result<>'' then
      Result:=Copy(Result,1,Length(Result)-Length(strDelim));
  finally
    if lAdsTable
      then TAdsTable(dsLgot).CancelRange;
  end;
end;
function TdmBase.LgotMen2(strID:String; strDelim:String): String;
begin
  Result:=LgotMen(tbMensLgot, fmMain.DateFiks, strID, strDelim);
end;
//---------------------------------------------------------------------------
// сформируем новый номер в очереди
function TdmBase.NewNomerOchered(nIdOch:Integer) : Integer;
var
 oldInd,s : String;
begin
  oldInd:=tbOchered.IndexName;
  tbOchered.IndexName:='NOMER_KEY';
  tbOchered.SetRange([nIdOch],[nIdOch]);
  tbOchered.Last;
  s:=tbOchered.FieldByName('NOMER_OCH').AsString;
  if Trim(s)=''
    then Result:=1
    else Result:=StrToInt(s)+1;
  tbOchered.IndexName:=oldInd;
end;

//------------------------------------------------------------------
// следующий номер дела
function TdmBase.Och_GetNextNDELO:Integer;
var
  st:TSostTable;
begin
  st:=SaveSostTable(tbOchered,true);
  tbOchered.IndexName:='NDELO_KEY';
  tbOchered.Last;
  Result:=tbOchered.FieldByName('N_DELO').AsInteger;
  if Result>0 then begin
    Result:=Result+1;
  end;
  RestSostTable(tbOchered,st);
end;

//---------------------------------------------------------------------------
function TdmBase.Check_AddMenToOchered_Sostav(nID: Integer): Boolean;
var
 old,s,ss : String;
 n : Integer;
 lSeek:Boolean;
begin
  Result:=true;
  //--- контроль присутствия в составе семьи стоящих на учете --------------
  if GlobalTask.ParamAsBoolean('CHECK_SOSTAV') then begin
    old:=dmBase.tbSostavSem.IndexName;
    dmBase.tbSostavSem.IndexName:='MEMBER_ID';
    dmBase.tbSostavSem.SetRange([nID],[nID]);
    try
      while not dmBase.tbSostavSem.Eof do begin
        if not dmBase.tbSostavSem.FieldByName('ISKL').AsBoolean then begin
          n:=dmBase.tbSostavSem.FieldByName('ID').AsInteger;
          lSeek:=dmBase.tbOchered.Locate('OCHERED_ID;ID',VarArrayOf([0,n]),[]);
          if lSeek then begin
            if dmBase.tbOchered.FieldByName('ISKL').AsBoolean then begin
              lSeek:=false;
            end;
          end;
          if lSeek then begin
            s:=dmBase.FIOMen(dmBase.GetDateCurrentSost,IntToStr(n));      // ФИО у кого человек в составе семьи стоит в очереди
            ss:=dmBase.FIOMen(dmBase.GetDateCurrentSost,IntToStr(nID));   // ФИО того кто становиться на очередь
            if s<>'' then begin
              PutError(ss+' состоит в составе семьи у '+s);
              Result:=false;
            end;
          end;
        end;
        dmBase.tbSostavSem.Next;
      end;
    finally
      dmBase.tbSostavSem.CancelRange;
      dmBase.tbSostavSem.IndexName:=old;
    end;
  end;
end;

{
  MAX_OCHERED=4;   //   максимальный номер типа очереди  3=военнослужащие

  // есть еще определение этих констант в скрипте
  OCH_RESH_POST=1;
  OCH_RESH_VOST=2;
  OCH_RESH_RAZD=3;
  OCH_RESH_PERE=4;
  OCH_RESH_UNION=5;
  OCH_RESH_SN=9;
}
function TdmBase.SetIDLastReshOcheredMen(nID:Integer):Boolean;
var
  i:Integer;
begin
  Result:=false;
  for i:=0 to MAX_OCHERED do begin
    if tbOchered.Locate('ID;OCHERED_ID', VarArrayOf([nID,i]), []) then begin
      SetIDLastReshOchered_(tbOchered);
      Result:=true;
    end;
  end;
end;

function TdmBase.SetIDLastReshOchered_(dsOchered:TDataSet):Boolean;
{$IFNDEF ZAGS}
var
  m,n,nID,nType,nIDPost,nIDSn,nIDLast:Integer;
  lCheck:Boolean;
{$ENDIF}
begin
  Result:=true;
{$IFNDEF ZAGS}
  nIDPost:=0; nIDSn:=0; nIDLast:=0;
  nID:=dsOchered.FieldByName('ID').AsInteger;
  nType:=dsOchered.FieldByName('OCHERED_ID').AsInteger;
  Result:=GetIDLastReshOchered_(nID, nType, false, nIDLast, nIDPost, nIDSn);
  dsOchered.Edit;
  dsOchered.FieldByName('ID_LAST_RESH').AsInteger:=nIDLast;
  dsOchered.FieldByName('ID_POST_RESH').AsInteger:=nIDPost;
  dsOchered.FieldByName('ID_SN_RESH').AsInteger:=nIDSn;
  dsOchered.Post;
{$ENDIF}
end;
function TdmBase.GetIDLastReshOchered_(nID:Integer; nType:Integer; lCheckPlan:Boolean;
                                       var nIDLast:Integer; var nIDPost:Integer; var nIDSn:Integer):Boolean;
{$IFNDEF ZAGS}
var
  m,n:Integer;
  lCheck:Boolean;
{$ENDIF}
begin
{$IFNDEF ZAGS}
  lCheck:=false;
  Result:=false;
  nIDPost:=0; nIDSn:=0; nIDLast:=0;
  tbOcheredResh.IndexName:='PR_KEY';
  tbOcheredResh.SetRange([nID,nType],[nID,nType]);
  while not tbOcheredResh.Eof do begin
    if not lCheckPlan or not tbOcheredResh.FieldByName('PLAN').AsBoolean then begin
      m:=tbOcheredResh.FieldByName('AUTO_ID').AsInteger;
      n:=tbOcheredResh.FieldByName('TIP').AsInteger;
      if nIDLast=0 then nIDLast:=m;
      if ReshIsPostanovka(n) then begin
        if nIDPost=0 then nIDPost:=m;
      end else if n=OCH_RESH_SN then begin
        if nIDSn=0 then nIDSn:=m;
      end;
{      case n of
        OCH_RESH_POST,OCH_RESH_VOST: if nIDPost=0 then nIDPost:=m;
        OCH_RESH_SN: if nIDSn=0 then nIDSn:=m;
      end;}
      if not lCheck and ((nIDSn>0) or (nIDPost>0)) then begin
        if nIDSn>0
          then Result:=true      // если самое верхнее решение о снятии, то типа человек исключен из очереди
          else Result:=false;
        lCheck:=true;
      end;
    end;
    tbOcheredResh.Next;
  end;
  tbOcheredResh.CancelRange;
{$ELSE}
  Result:=false;
{$ENDIF}
end;

procedure TdmBase.SetIDLastReshOchered;
{$IFNDEF ZAGS}
var
  st:TSostTable;
  i:Integer;
{$ENDIF}
begin
{$IFNDEF ZAGS}
  st:=SaveSostTable(tbOchered, true, true);
  tbOchered.First;
  i:=0;
  while not tbOchered.Eof do begin
    if i>50 then begin
      Application.ProcessMessages;
      i:=0;
    end else begin
      Inc(i,1);
    end;
    SetIDLastReshOchered_(tbOchered);
    tbOchered.Next;
  end;
  RestSostTable( tbOchered, st);
{$ENDIF}
end;
//---------------------------------------------------------------------------
function TdmBase.AddMenToOchered(nID: Integer; var lSeekMen : Boolean): Boolean;
var
 nNewNomer,n,nAdresID : Integer;
begin
  lSeekMen:=false;       
  Result:=true;
  if tbMens.Locate('DATE_FIKS;ID', VarArrayOf([GetDateCurrentSost,nID]),[]) then begin
    nAdresID:=tbMens.FieldByName('ADRES_ID').AsInteger;
    if Result then begin
      if not tbOchered.Locate('OCHERED_ID;ID',VarArrayOf([0,nID]),[]) then begin
        //--- контроль присутствия в составе семьи стоящих на учете --------------
        Result:=Check_AddMenToOchered_Sostav(nID);
        //-------------------------------------------------------------------------------------------------
        if Result then begin
          try
            //-------- сформируем новый номер ----------------
            nNewNomer:=NewNomerOchered(0);
            n:=0;
            if GlobalTask.ParamAsBoolean('AUTO_DELO') then n:=dmBase.Och_GetNextNDELO;
            //------------------------------------------------
            tbOchered.Append;
            tbOchered.FieldByName('OCHERED_ID').AsInteger:=0;
            tbOchered.FieldByName('ID').AsInteger:=nID;
            tbOchered.FieldByName('NOMER_OCH').AsInteger:=nNewNomer;
            if n>0 then tbOchered.FieldByName('DELO').AsString:=IntToStr(n);
            tbOchered.FieldByName('KOLVO_SOSTAV').AsInteger:=1;
            tbOchered.FieldByName('OTKAZ').AsBoolean:=false;
            tbOchered.FieldByName('ISKL').AsBoolean:=false;
            if nAdresID>0 then begin
              tbOchered.FieldByName('PLOSH_ALL').AsFloat:=ReadPropAsFloat(fmMain.DateFiks, nAdresID, 'PLOSH_ALL');
              tbOchered.FieldByName('KOLVO_KOMN_PR').AsInteger:=ReadPropAsInteger(fmMain.DateFiks, nAdresID, 'KOL_KOMN');
            end;
            tbOchered.Post;
          except
            on E: Exception do begin
              PutError(E.Message);
              Result:=false;
            end;
          end;
          if Result then begin
            try
              tbMens.Edit;
              tbMens.FieldByName('OCHERED').AsBoolean:=true;
              tbMens.Post;
            except
              on E: Exception do begin
                PutError(E.Message);
                Result:=false;
              end;
            end;
          end;
        end;
      end else begin
         // для исправления ошибочной ситуации, когда OCHERED_ID не null ,а  OCHERED=false
        if tbMens.FieldByName('OCHERED').IsNull or (tbMens.FieldByName('OCHERED').AsBoolean=false) then begin
          try
            tbMens.Edit;
            tbMens.FieldByName('OCHERED').AsBoolean:=true;
            tbMens.Post;
          except
            on E: Exception do begin
              PutError(E.Message);
              Result:=false;
            end;
          end;
        end else begin
          PutError(Trim(tbMens.FieldByName('FAMILIA').AsString)+' '+
                   Trim(tbMens.FieldByName('NAME').AsString)+' '+
                   Trim(tbMens.FieldByName('OTCH').AsString)+' уже существует в очереди.');
          Result:=false;
        end;
        lSeekMen:=true;
      end;
    end;
  end else begin
    Result:=false;
  end;
end;

//-------------------------------------------------------------------------------
function TdmBase.AddMenToVUS(nID: Integer; var lSeekMen : Boolean): Boolean;
begin
  lSeekMen:=false;
  Result:=true;
  if tbMens.Locate('DATE_FIKS;ID', VarArrayOf([GetDateCurrentSost,nID]),[]) then begin
    if not tbVUS.Locate('ID', nID,[]) then begin
      try
        tbVUS.Append;
        tbVUS.FieldByName('ID').AsInteger:=nID;
        tbVUS.FieldByName('PRIZ').AsBoolean:=false;
        tbVUS.Post;
        tbMens.Edit;
        tbMens.FieldByName('VUS').AsBoolean:=true;
        tbMens.Post;
      except
        on E: Exception do begin
          PutError(E.Message);
          Result:=false;
        end;
      end;
    end else begin
      PutError(Trim(tbMens.FieldByName('FAMILIA').AsString)+' '+
               Trim(tbMens.FieldByName('NAME').AsString)+' '+
               Trim(tbMens.FieldByName('OTCH').AsString)+' уже учтен.');
      Result:=false;
      lSeekMen:=true;
    end;
  end else begin
    Result:=false;
  end;
end;

//-----------------------------------------------------------
procedure TdmBase.SetCurDate(const Value: TDateTime);
begin
  FCurDate := Value;
  Globaltask.CurrentDate:=FCurDate;
end;

//-----------------------------------------------------------
function TdmBase.GetCurDate(lDate:Boolean): TDateTime;
begin
  if lDate
    then Result:=Date
    else Result:=Now; //!!! FCurDate;  09.11.2018
end;

//-----------------------------------------------------------
function TdmBase.MaxValueField(strNameTable,strField:String) : Integer;
begin
  WorkQuery.SQL.Text := 'SELECT MAX('+strField+') FROM '+strNameTable;
  WorkQuery.Open;
  Result := WorkQuery.Fields[0].AsInteger;
  WorkQuery.Close;
end;

const
  ERR_ADS       = 1;
  ERR_MAX_ID    = 2;
  ERR_SPRPUNKT  = 3;
  ERR_LINK      = 4;
  ERR_CONN_LINK = 5;
  ERR_EXIT      = 6;
  ERR_MAINBASE  = 7;
  ERR_BASE_EXISTS = 8;
  ERR_ORG_NOTFOUND = 9;
  ERR_SCRIPT = 10;

//-----------------------------------------------------------
function TdmBase.GetListFieldsTable(strTable:String) : String;
begin
  Result:='';
  WorkQuery.SQL.Text := 'select name from '+SysQuery('system.columns')+' where parent='+QStr(strTable)+' and Field_Type<>'+IntToStr(ADS_AUTOINC);
  WorkQuery.Open;
  while not WorkQuery.Eof do begin
    Result:=Result+WorkQuery.Fields[0].AsString+',';
    WorkQuery.Next;
  end;
  WorkQuery.Close;
  Result:=Copy(Result,1,Length(Result)-1);
end;

//-----------------------------------------------------------
function TdmBase.GetErrorLoadBase(nErr:Integer):String;
begin
  case nErr of
    ERR_ADS      : Result:=LastError;
    ERR_MAX_ID   : Result:='Ошибка определения максимального идентификатора в базе.';
    ERR_SPRPUNKT : Result:='Ошибка соответствия справочников населенных пунктов.';
    ERR_LINK     : Result:='Ошибка создания связи с загружаемой базой.';
    ERR_CONN_LINK: Result:='Ошибка подключения к загружаемой базе.';
    ERR_EXIT     : Result:='Отказ от выполнения.';
    ERR_MAINBASE : Result:='Невозможна загрузки из главной базы.';
    ERR_BASE_EXISTS : Result:='Загружаемая база уже была загружена.';
    ERR_ORG_NOTFOUND : Result:='Организация в загружаемой базе не найдена в справочнике.';
    ERR_SCRIPT : Result:='Ошибка выполнения скрипта перед загрузкой.';
  end;
end;
//---------------------------------------------------------------------------
function TdmBase.DeleteFromBaseFilter:Boolean;
var
  strDelWhere,strPunkt,s:String;
begin
  Result:=false;
  if ChoiceLoadedAdres(strDelWhere, strPunkt, AdsConnection, nil) then begin
    if strDelWhere<>''
      then Result:=true;
  end;
  if Result then begin
    s := '';
    s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
    s := s + 'Информация из базы будет частично удалена.'#13;
    s := s + 'Если Вы уверены в необходимости проведения операции,'#13;
    s := s + 'введите слово ДА в поле ввода'#13;
    Result:=OkWarning(s);
    if Result then begin
      OpenMessage('Удаление информации из базы ...','');
      try
        DeletePunkt(strDelWhere, AdsConnection, false, false);
      finally
        CloseMessage;
      end;
    end;
  end;
end;

{$IFDEF OCHERED}
//***************** RunLoadBase for OCHERED ******************************************

//---------------------------------------------------------------
// объединение баз
// strDirSource - путь к загружаемой базе
// lOnlyCurSost - только текущее состояние
// lAllPunkt    - грузить все населенные пункты совета
// nNewNomerLic - на сколько увеличивать номер лицевого счета
// strAddNomerKniga - дополнительный номер к номеру книги
//---------------------------------------------------------------
function TdmBase.RunLoadBase(strDirSource:String; lOnlyCurSost:Boolean; lAllPunkt:Boolean; lZAGS:Boolean;
         nNewNomerLic:Integer; strAddNomerKniga:String; slCheckSpr:TStringList) : Integer;
begin
  Result:=0;
end;
{$ENDIF}
//******* end ochered *********************************


{$IFDEF GKH}
//***************** RunLoadBaseGES for GKH ******************************************

//---------------------------------------------------------------
// объединение баз
// strDirSource - путь к загружаемой базе
// lOnlyCurSost - только текущее состояние
// lAllPunkt    - грузить все населенные пункты совета
// nNewNomerLic - на сколько увеличивать номер лицевого счета
// strAddNomerKniga - дополнительный номер к номеру книги
//---------------------------------------------------------------
function TdmBase.RunLoadBaseGES(lClearTAbles:Boolean; strDirSource:String; lOnlyCurSost:Boolean; lAllPunkt:Boolean;
                             nNewNomerLic:Integer; strAddNomerKniga:String; slPar:TStringList) : Integer;
var
  strSQL:String;
  i,m,nErr,nMaxID, nIdBase:Integer;
  ConnectSource : TAdsConnection;
  strWhere,strPunkt,strAddWhere, strDelWhere : String;
  strTables,strSpr,strFields,strSet,strIdBase,strNameBase:String;
  arrTables:TArrStrings;
  sl:TStringList;
  lOk,lRun,lMainBase:Boolean;
  vResult:Variant;
  tb:TAdsTAble;
begin
  lOk:=true;
  lMainBase:=IsMainBase;

  OpenMessage(Replicate('_',50),'',10);
  ChangeMessage('Подготовка загрузки');

  WorkQuery.AdsCloseSQLStatement;
  AdsConnection.CloseCachedTables;

  if lClearTables then begin //--------------------------------
  end;   //--------- lClearTables ------------------

  OpenExecute(AdsConnection, NameFromExe('protokol.txt'), false);

  LastError:='';

  if lOnlyCurSost then begin
    strWhere:=' WHERE date_fiks='+QStr(CURRENT_SOST);
    strAddWhere:=' and date_fiks='+QStr(CURRENT_SOST);
  end else begin
    strWhere:='';
    strAddWhere:='';
  end;
  try
    strSQL := 'EXECUTE PROCEDURE sp_CreateLink('+QStr('LoadBase')+','+QStr(strDirSource+NAME_DICT)+', TRUE, TRUE, FALSE, '+
               QStr(SYSTEM_USER)+', '+QStr(SYSTEM_PASSWORD)+');';
    AdsConnection.Execute(strSQL);
  except

  end;

  nErr:=0;
  nMaxID:=MaxID;
  if nMaxID=-1 then begin
    nErr:=ERR_MAX_ID;
  end;

  if nErr=0 then begin
    WorkQuery.Close;
    WorkQuery.SQL.Text:='select name from '+SysQuery('system.links')+' where name='+QStr('loadbase');
    WorkQuery.Open;
    if WorkQuery.RecordCount=0 then begin
      nErr:=ERR_LINK;
    end;
    WorkQuery.Close;
  end;

  if nErr=0 then begin
    nIdBase:=0;

    ConnectSource := TAdsConnection.Create(nil);
    with ConnectSource do begin
      AdsServerTypes := AdsConnection.AdsServerTypes;
      CommunicationType := AdsConnection.CommunicationType;
      ConnectPath := strDirSource+NAME_DICT;
      UserName := SYSTEM_USER;
      Password := SYSTEM_PASSWORD;
      LoginPrompt := false;
      try
        IsConnected := true;
      except
        nErr:=ERR_CONN_LINK;
      end;
    end;

    if nErr=0 then begin
      if lMainBase then begin
        WorkQuery.Close;
        WorkQuery.SQL.Text:='SELECT id_base, main_base, count_sim from LoadBase.global';
        WorkQuery.Open;
        // !!! попытка закрузки главной базы в главную !!!
        if not WorkQuery.FieldByName('main_base').IsNull and (WorkQuery.FieldByName('main_base').AsBoolean=true) then begin
          nErr:=ERR_MAINBASE;
        end;
        nIdBase:=WorkQuery.FieldByName('id_base').AsInteger;
        if nIdBase=0 then begin
          nErr:=ERR_MAINBASE;
        end;
        WorkQuery.Close;
      end else begin  // грузим базу из соседнего жеса
        WorkQuery.Close;
        WorkQuery.SQL.Text:='SELECT id_base, main_base, count_sim from global';
        WorkQuery.Open;
        // ID моей базы
        nIdBase:=WorkQuery.FieldByName('id_base').AsInteger;
        if nIdBase=0 then begin
          nErr:=ERR_MAINBASE;
        end;
        WorkQuery.Close;
      end;
    end;

    if nErr=0 then begin
      strNameBase:='';
      strIdBase:=IntToStr(nIdBase);

      if lMainBase then begin
        WorkQuery.Close;
        WorkQuery.SQL.Text:='SELECT TOP 1 id_base from Население where id_base='+strIdBase;
        WorkQuery.Open;
        if WorkQuery.FieldByName('id_base').AsInteger>0  then begin // база уже загружалась
          nErr:=ERR_BASE_EXISTS;
        end;
        if nErr=0 then begin
          if SprGES.Locate('PARENT;ID_BASE',VarArrayOf([GlobalTask.ParamAsInteger('ID'),nIdBase]),[]) then begin
            strNameBase:=SprGES.FieldByName('NAME').AsString;
          end else begin
           nErr:=ERR_ORG_NOTFOUND;
          end;
        end;
      end;

    end;

    vResult:=true;
    lRun:=false;
    RunFuncScript('BEFORELOADGES',[nIdBase],vResult,lRun);
    if (vResult<>null) and not vResult then begin
      nErr:=ERR_SCRIPT;
    end;
    strPunkt:='';
    // если не все населенные пункты пускай снимут отметки с незагружаемых
    if (nErr=0) and not lAllPunkt then begin
      if ChoiceLoadedAdres(strDelWhere, strPunkt, ConnectSource, nil) then begin
        if strDelWhere=''
          then nErr:=ERR_EXIT
          else strDelWhere:='not ('+strDelWhere+')';
      end else begin
        nErr:=ERR_EXIT;
      end;
      WorkQuery.Close;
      OpenMessage(Replicate('_',50),'',10);
      ChangeMessage('Обработка загружаемой базы ... ');
      if nErr=0 then begin
        DeletePunkt(strDelWhere, ConnectSource, false, true);
        if strPunkt<>'' then
          ExecuteSQL('DELETE FROM СпрНасПунктов WHERE not ('+StringReplace(strPunkt,'punkt','id',[rfReplaceAll])+')',ConnectSource);
      end;
      ExecuteSQL('delete from VUS where id in (select v.id from VUS v left join Население n on n.id=v.id and n.date_fiks=''1899-12-30'' where n.id is null);',ConnectSource);
    end;

    if nErr=0 then begin
      AddToProtokol('Загрузка: "'+strNameBase+'"');
      ChangeCaptionMessage(strNameBase);
      ConnectSource.CloseCachedTables;
      ConnectSource.IsConnected:=false;
      ConnectSource.IsConnected:=true;
      ExecuteSQL('DROP INDEX BigHouse.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX БазаДомов.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX HouseOwners.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX ЛицевыеСчета.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX ЛицевыеСчетаПризнаки.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX Население.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX VUS.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX OCHERED.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX OCHERED.MEN_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX НаселениеДоп.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX НаселениеПризнаки.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX НаселениеДвижение.PR_KEY',ConnectSource);

      // удалим из базы строки со значением поля KOD, которое отсутствует в справочнике СпрЛьготников
      ExecuteSQL('DELETE FROM НаселениеЛьготы WHERE kod in (select distinct kod from населениельготы n left join спрльготников s on n.kod=s.id where s.id is null)',ConnectSource);
      ExecuteSQL('DROP INDEX НаселениеЛьготы.PR_KEY',ConnectSource);

      ExecuteSQL('DROP INDEX БазаСвойствОбъектов.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX БазаСтрок.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX Nalogi.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX Dokuments.PR_KEY',ConnectSource);

      ConnectSource.IsConnected:=false;
    end;
    ConnectSource.Free;
  end;
  if nErr=0 then begin
    //-------------------------------------------------
    //-- СПРАВОЧНИКИ ----------------------------------
    //-------------------------------------------------
    AddToProtokol('->Объединение справочников');
    ChangeMessage('Объединение справочников');

    lOk:=true;
    //------ справочник населенных пунктов
    lOk:=lOk and CheckSprPunkt;

    //------ справочник типов улиц
    sl:=TStringList.Create;
    sl.AddObject('TIP=',dmBase.SprUL);
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprTypeUL,sl);
    sl.Clear;
    //------ справочник улиц
    CheckSprUL(strPunkt);

    sl.AddObject('OTNOSH='+strWhere,dmBase.tbMens);    //------ отношение к главе хозяйства
    sl.AddObject('OTNOSH=',dmBase.tbSostavSem);
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprOtnosh,sl);
    sl.Clear;
    sl.AddObject('PENS_TIP='+strWhere,dmBase.tbMens );    //------  типы пенсий
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprTypePens,sl);
    {
    sl.Clear;
    sl.AddObject('STUDENT='+strWhere,dmBase.tbMens );    //------  где учиться (школа,училище)
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprMestOb,sl);
    sl.Clear;
    sl.AddObject('STUDENT_TYPE='+strWhere,dmBase.tbMens );    //------  формы обучения
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprFormOb,sl);
    }
    sl.Clear;
    sl.AddObject('STUDENT_SPR='+strWhere,dmBase.tbMens );    //------  учебные заведения
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprUchZaved,sl);
    sl.Clear;
    sl.AddObject('WORK_SPR='+strWhere,dmBase.tbMens );    //------  места работы
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprWork,sl,TypeObj_Organ);
    sl.Clear;
    sl.AddObject('DOLG_SPR='+strWhere,dmBase.tbMens );    //------  должности
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprDolg,sl);
    sl.Clear;
    if dmBase.tbVUS.Active then begin
      sl.AddObject('KOMISS=',dmBase.tbVUS );    //------  медицинские комиссии
      lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprKomiss,sl);
      sl.Clear;
      sl.AddObject('SPEC=',dmBase.tbVUS );    //------  отметки ВУС
      lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprOsobOtm,sl);
    end;
    sl.Clear;
    sl.AddObject('PRICH='+strWhere,dmBase.tbMensDvig );  //------ типы миграции
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprTypeMigr,sl);
    sl.Clear;
    sl.AddObject('KOD='+strWhere,dmBase.tbMensLgot );  //------ категории льготников
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprLgot,sl);
    sl.Clear;
    sl.AddObject('KOD='+strWhere,dmBase.tbMensPr );    //------ признаки населения
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPrNasel,sl);
    sl.Clear;
    sl.AddObject('KOD='+strWhere,dmBase.tbLichPr );    //------ признаки лицевых счетов
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPrLich,sl);
    sl.Clear;
    sl.AddObject('PREDST='+strWhere,dmBase.tbAdres );    //------ помещение представляет собой
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPredst,sl);
    sl.Clear;
    sl.AddObject('TYPEHOUSE='+strWhere,dmBase.tbLich );  //------ тип проживания
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprTypeHouse,sl);
    sl.Clear;
    sl.AddObject('PRICH_SOZD='+strWhere,dmBase.tbLich );  //------ причина создания лиц. счета
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPrSozd,sl);
    sl.Clear;
    sl.AddObject('PRICH_LIKV='+strWhere,dmBase.tbLich );  //------ причина ликвид. лиц. счета
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPrLikv,sl);
    sl.Clear;
    sl.AddObject('VALUE;NVALUE=pokaz='+QStr('MAT_STEN'),dmBase.tbProp);  // материал стен
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprMatSten,sl);
    sl.Clear;
    //---------------------------------------------------------------------------------------------
    sl.Free;

    //перекодировка ID
    try

      if lOk then begin
        AddToProtokol('->Обновление загружаемых таблиц');
        ChangeMessage('Обновление загружаемых таблиц');
      end;
      {
      nMaxID:=MaxID;
      if nMaxID=-1 then begin
        nErr:=ERR_MAX_ID;
        lOk:=false;
      end;
      }

      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.БазаДомов SET id_base='+strIdBase+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.ЛицевыеСчета SET id_base='+strIdBase+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.Население SET id_base='+strIdBase+strWhere);

      lOk:=lOk and ExecuteSQL('delete from VUS where id in (select v.id from VUS v left join Население n on n.id=v.id and n.date_fiks=''1899-12-30'' where n.id is null);');

      if nNewNomerLic>0
        then lOk:=lOk and ExecuteSQL('UPDATE LoadBase.ЛицевыеСчета SET nomer=nomer+'+IntToStr(nNewNomerLic)+' WHERE nomer is not null'+strAddWhere);
      if strAddNomerKniga<>''
        then lOk:=lOk and ExecuteSQL('UPDATE LoadBase.ЛицевыеСчета SET kniga_nomer=trim(kniga_nomer)+'+QStr(strAddNomerKniga)+' WHERE kniga_nomer is not null'+strAddWhere);


      if lOk then begin
//        strTables:='БазаДомов,HouseOwners,SprOwners,ЛицевыеСчета,ЛицевыеСчетаПризнаки,Население,'+
        strTables:='БазаДомов,HouseOwners,ЛицевыеСчета,ЛицевыеСчетаПризнаки,Население,'+
                   'НаселениеДоп,НаселениеПризнаки,НаселениеЛьготы,НаселениеДвижение,'+
                   'VUS,Ochered,SostavSem,БазаСвойствОбъектов,БазаСтрок,Nalogi,Dokuments';
        StrToArr(strTables,arrTables,',',true);
        for i:=Low(arrTables) to High(arrTables) do begin
          ChangeMessage('Загрузка таблицы "'+arrTables[i]+'"');
          strFields:=GetListFieldsTable(arrTables[i]);
          if lOnlyCurSost and (Pos('date_fiks',LowerCase(strFields))>0)
            then strSQL:='INSERT INTO '+arrTables[i]+' ('+strFields+') SELECT '+strFields+' FROM LoadBase.'+arrTables[i]+strWhere
            else strSQL:='INSERT INTO '+arrTables[i]+' ('+strFields+') SELECT '+strFields+' FROM LoadBase.'+arrTables[i];
          lOk:=lOk and ExecuteSQL(strSQL);
          if not lOk then begin
            break;
          end;
        end;
        strFields:=GetListFieldsTable('BaseProp');
        strSQL:='INSERT INTO BaseProp ('+strFields+') SELECT '+strFields+' FROM LoadBase.BaseProp WHERE typeobj=1 or typeobj=2 or typeobj=3';
        lOk:=lOk and ExecuteSQL(strSQL);
        strFields:=GetListFieldsTable('BaseTextProp');
        strSQL:='INSERT INTO BaseTextProp ('+strFields+') SELECT '+strFields+' FROM LoadBase.BaseTextProp WHERE typeobj=1 or typeobj=2 or typeobj=3';
        lOk:=lOk and ExecuteSQL(strSQL);
      end;

    except
      on E : Exception do begin
        LastError:=E.Message;
      end;
    end;

  // некопируемые таблицы: HouseProps
  //------------------------------------------------------------------------------------------------------

  end;

  WorkQuery.Close;
  WorkQuery.AdsCloseSQLStatement;
  AdsConnection.CloseCachedTables;
  try
    ExecuteSQL('EXECUTE PROCEDURE sp_DropLink('+QStr('LoadBase')+', TRUE);');
  except
  end;

  CloseExecute;
  CloseMessage;
  if (nErr=0) and not lOk then begin
    nErr:=ERR_ADS;
  end;
  Result:=nErr;

end;
{$ENDIF}
//***************** end RunLoadBase for GKH ******************************************

{$IFDEF LAIS}
//***************** RunLoadBase for LAIS ******************************************

//---------------------------------------------------------------
// объединение баз
// strDirSource - путь к загружаемой базе
// lOnlyCurSost - только текущее состояние
// lAllPunkt    - грузить все населенные пункты совета
// nNewNomerLic - на сколько увеличивать номер лицевого счета
// strAddNomerKniga - дополнительный номер к номеру книги
//---------------------------------------------------------------
function TdmBase.RunLoadBase(strDirSource:String; lOnlyCurSost:Boolean; lAllPunkt:Boolean; lZAGS:Boolean;
         nNewNomerLic:Integer; strAddNomerKniga:String; slCheckSpr:TStringList) : Integer;
var
  strSQL:String;
  i,m,nErr,nMaxID:Integer;
  ConnectSource : TAdsConnection;
  strWhere,strAddWhere : String;
  strTables,strFields,strSet:String;
  arrTables:TArrStrings;
  sl:TStringList;
  lOk:Boolean;
begin
  lOk:=true;
  OpenMessage(Replicate('_',50),'',10);
  ChangeMessage('Подготовка загрузки');

  OpenExecute(AdsConnection, NameFromExe('protokol.txt'), false);

  LastError:='';

  if lOnlyCurSost then begin
    strWhere:=' WHERE date_fiks='+QStr(CURRENT_SOST);
    strAddWhere:=' and date_fiks='+QStr(CURRENT_SOST);
  end else begin
    strWhere:='';
    strAddWhere:='';
  end;
  try
    strSQL := 'EXECUTE PROCEDURE sp_CreateLink('+QStr('LoadBase')+','+QStr(strDirSource+NAME_DICT)+', TRUE, TRUE, FALSE, '+
               QStr(SYSTEM_USER)+', '+QStr(SYSTEM_PASSWORD)+');';
    AdsConnection.Execute(strSQL);
  except
  end;
  nErr:=0;
  nMaxID:=MaxID;
  if nMaxID=-1 then begin
    nErr:=ERR_MAX_ID;
  end;
  if nErr=0 then begin
    WorkQuery.SQL.Text:='select name from '+SysQuery('system.links')+' where name='+QStr('loadbase');
    WorkQuery.Open;
    if WorkQuery.RecordCount=0 then begin
      nErr:=ERR_LINK;
    end;
    WorkQuery.Close;
  end;

  if nErr=0 then begin
    ConnectSource := TAdsConnection.Create(nil);
    with ConnectSource do begin
      AdsServerTypes := AdsConnection.AdsServerTypes;
      CommunicationType := AdsConnection.CommunicationType;
      ConnectPath := strDirSource+NAME_DICT;
      UserName := SYSTEM_USER;
      Password := SYSTEM_PASSWORD;
      LoginPrompt := false;
      try
        IsConnected := true;
      except
        nErr:=ERR_CONN_LINK;
      end;
    end;

    // если не все населенные пункты пускай снимут отметки с незагружаемых
    if not lAllPunkt then begin
      WorkQuery.SQL.Text:='SELECT s.ID PUNKT, Trim(tp.name)+'+QStr(' ')+'+s.name FULLNAME '+
                          'FROM LoadBase.СпрНасПунктов s LEFT JOIN SysSpr.TypePunkt tp ON typepunkt=tp.id';
      WorkQuery.Open;
      sl:=TStringList.Create;
      CloseMessage;
      if not NotLoadPunkts(WorkQuery, sl) then begin
        nErr:=ERR_EXIT;
      end;
      WorkQuery.Close;
      OpenMessage(Replicate('_',50),'',10);
      ChangeMessage('Удаление из загрузки населенных пунктов');
      if nErr=0 then begin
        for i:=0 to sl.Count-1 do begin
          DeletePunkt(StrToInt(sl.Strings[i]), ConnectSource, false, true);
        end;
      end;
      sl.Free;
    end;       

    if nErr=0 then begin
      ExecuteSQL('DROP INDEX BigHouse.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX БазаДомов.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX HouseOwners.PR_KEY',ConnectSource);
//      ExecuteSQL('DROP INDEX SprOwners.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX ЛицевыеСчета.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX ЛицевыеСчетаПризнаки.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX Население.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX VUS.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX OCHERED.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX OCHERED.MEN_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX SostavSem.PR_KEY',ConnectSource);

      ExecuteSQL('DROP INDEX НаселениеДоп.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX НаселениеПризнаки.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX НаселениеДвижение.PR_KEY',ConnectSource);

      // удалим из базы строки со значением поля KOD, которое отсутствует в справочнике СпрЛьготников
      ExecuteSQL('DELETE FROM НаселениеЛьготы WHERE kod in (select distinct kod from населениельготы n left join спрльготников s on n.kod=s.id where s.id is null)',ConnectSource);
      ExecuteSQL('DROP INDEX НаселениеЛьготы.PR_KEY',ConnectSource);

      ExecuteSQL('DROP INDEX БазаСвойствОбъектов.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX БазаСтрок.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX Nalogi.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX Dokuments.PR_KEY',ConnectSource);

      ConnectSource.IsConnected:=false;
    end;
    ConnectSource.Free;
  end;
  if nErr=0 then begin
    //-------------------------------------------------
    //-- СПРАВОЧНИКИ ----------------------------------
    //-------------------------------------------------
    ChangeMessage('Объединение справочников');

    lOk:=true;
    //------ справочник населенных пунктов
    lOk:=lOk and CheckSprPunkt;

    //------ справочник типов улиц
    sl:=TStringList.Create;
    sl.AddObject('TIP=',dmBase.SprUL);
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprTypeUL,sl);
    sl.Clear;
    //------ справочник улиц
    CheckSprUL('');

    sl.AddObject('OTNOSH='+strWhere,dmBase.tbMens);    //------ отношение к главе хозяйства
    sl.AddObject('OTNOSH=',dmBase.tbSostavSem);
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprOtnosh,sl);
    sl.Clear;
    sl.AddObject('PENS_TIP='+strWhere,dmBase.tbMens );    //------  типы пенсий
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprTypePens,sl);
    {
    sl.Clear;
    sl.AddObject('STUDENT='+strWhere,dmBase.tbMens );    //------  где учиться (школа,училище)
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprMestOb,sl);
    sl.Clear;
    sl.AddObject('STUDENT_TYPE='+strWhere,dmBase.tbMens );    //------  формы обучения
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprFormOb,sl);
    }
    sl.Clear;
    sl.AddObject('STUDENT_SPR='+strWhere,dmBase.tbMens );    //------  учебные заведения
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprUchZaved,sl);
    sl.Clear;
    sl.AddObject('WORK_SPR='+strWhere,dmBase.tbMens );    //------  места работы
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprWork,sl,TypeObj_Organ);
    sl.Clear;
    sl.AddObject('DOLG_SPR='+strWhere,dmBase.tbMens );    //------  должности
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprDolg,sl);
    sl.Clear;
    if dmBase.tbVUS.Active then begin
      sl.AddObject('KOMISS=',dmBase.tbVUS );    //------  медицинские комиссии
      lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprKomiss,sl);
      sl.Clear;
      sl.AddObject('SPEC=',dmBase.tbVUS );    //------  отметки ВУС
      lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprOsobOtm,sl);
    end;
    sl.Clear;
    sl.AddObject('PRICH='+strWhere,dmBase.tbMensDvig );  //------ типы миграции
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprTypeMigr,sl);
    sl.Clear;
    sl.AddObject('KOD='+strWhere,dmBase.tbMensLgot );  //------ категории льготников
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprLgot,sl);
    sl.Clear;
    sl.AddObject('KOD='+strWhere,dmBase.tbMensPr );    //------ признаки населения
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPrNasel,sl);
    sl.Clear;
    sl.AddObject('KOD='+strWhere,dmBase.tbLichPr );    //------ признаки лицевых счетов
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPrLich,sl);
    sl.Clear;
    sl.AddObject('PREDST='+strWhere,dmBase.tbAdres );    //------ помещение представляет собой
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPredst,sl);
    sl.Clear;
    sl.AddObject('TYPEHOUSE='+strWhere,dmBase.tbLich );  //------ тип проживания
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprTypeHouse,sl);
    sl.Clear;
    sl.AddObject('PRICH_SOZD='+strWhere,dmBase.tbLich );  //------ причина создания лиц. счета
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPrSozd,sl);
    sl.Clear;
    sl.AddObject('PRICH_LIKV='+strWhere,dmBase.tbLich );  //------ причина ликвид. лиц. счета
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPrLikv,sl);
    sl.Clear;
    sl.AddObject('VALUE;NVALUE=pokaz='+QStr('MAT_STEN'),dmBase.tbProp);  // материал стен
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprMatSten,sl);
    sl.Clear;
    //---------------------------------------------------------------------------------------------
    sl.Free;

    //перекодировка ID
    try

      if lOk then
        ChangeMessage('Обновление загружаемых таблиц адресов');

      nMaxID:=MaxID;
      if nMaxID=-1 then begin
        nErr:=ERR_MAX_ID;
        lOk:=false;
      end;

      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.БазаДомов SET id=id+'+IntToStr(nMaxID)+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.HouseOwners SET id=id+'+IntToStr(nMaxID)+', kod=kod+'+IntToStr(nMaxID)+strWhere);
// !!!vadim     lOk:=lOk and ExecuteSQL('UPDATE LoadBase.Resh SET id=id+'+IntToStr(nMaxID)+strWhere);
//      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.SprOwners SET id=id+'+IntToStr(nMaxID));
      if lOk then
        ChangeMessage('Обновление загружаемых таблиц лицевых счетов');
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.ЛицевыеСчета SET id=id+'+IntToStr(nMaxID)+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.ЛицевыеСчета SET first=first+'+IntToStr(nMaxID)+' WHERE first is not null and first>0'+strAddWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.ЛицевыеСчета SET adres_id=adres_id+'+IntToStr(nMaxID)+' WHERE adres_id is not null and adres_id>0'+strAddWhere);
      if nNewNomerLic>0
        then lOk:=lOk and ExecuteSQL('UPDATE LoadBase.ЛицевыеСчета SET nomer=nomer+'+IntToStr(nNewNomerLic)+' WHERE nomer is not null'+strAddWhere);
      if strAddNomerKniga<>''
        then lOk:=lOk and ExecuteSQL('UPDATE LoadBase.ЛицевыеСчета SET kniga_nomer=trim(kniga_nomer)+'+QStr(strAddNomerKniga)+' WHERE kniga_nomer is not null'+strAddWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.ЛицевыеСчетаПризнаки SET id=id+'+IntToStr(nMaxID)+strWhere);
      if lOk then
        ChangeMessage('Обновление загружаемых таблиц населения');
          
      // добавлять людей в очередь потом по новой
//      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.Население SET id=id+'+IntToStr(nMaxID)+', ochered=false '+strWhere);

      // попробуем осталять людей в очереди
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.Население SET id=id+'+IntToStr(nMaxID)+strWhere);

      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.Население SET pa_id=pa_id+'+IntToStr(nMaxID)+' WHERE pa_id is not null and pa_id>0'+strAddWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.Население SET ma_id=ma_id+'+IntToStr(nMaxID)+' WHERE ma_id is not null and ma_id>0'+strAddWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.Население SET owner_id=owner_id+'+IntToStr(nMaxID)+' WHERE owner_id is not null and owner_id>0'+strAddWhere);

      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.Население SET lic_id=lic_id+'+IntToStr(nMaxID)+' WHERE lic_id is not null and lic_id>0'+strAddWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.Население SET adres_id=adres_id+'+IntToStr(nMaxID)+' WHERE adres_id is not null and adres_id>0'+strAddWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.Население SET ADRES_ID_GIT=ADRES_ID_GIT+'+IntToStr(nMaxID)+' WHERE ADRES_ID_GIT is not null and ADRES_ID_GIT>0'+strAddWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.НаселениеДоп SET id=id+'+IntToStr(nMaxID));
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.НаселениеСобств SET id=id+'+IntToStr(nMaxID));
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.НаселениеПризнаки SET id=id+'+IntToStr(nMaxID)+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.НаселениеЛьготы SET id=id+'+IntToStr(nMaxID)+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.НаселениеДвижение SET id=id+'+IntToStr(nMaxID)+strWhere);
      // ВУС
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.VUS SET id=id+'+IntToStr(nMaxID));
      // Очередь
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.Ochered SET id=id+'+IntToStr(nMaxID));
      // !!! поле AUTO_ID !!!
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.OcheredResh SET id=id+'+IntToStr(nMaxID));
      if lOk then begin
        lOk:=ExecuteSQL('UPDATE LoadBase.SostavSem SET id=id+'+IntToStr(nMaxID)+', member_id=member_id+'+IntToStr(nMaxID));
      end;

      if lOk then
        ChangeMessage('Обновление загружаемых дополнительных таблиц');
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.BaseProp SET id=id+'+IntToStr(nMaxID)+' WHERE typeobj=1 or typeobj=2 or typeobj=3 ');
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.BaseTextProp SET id=id+'+IntToStr(nMaxID)+' WHERE typeobj=1 or typeobj=2 or typeobj=3 ');
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.БазаСвойствОбъектов SET id=id+'+IntToStr(nMaxID)+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.БазаСтрок SET id=id+'+IntToStr(nMaxID)+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.Nalogi SET id=id+'+IntToStr(nMaxID)+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.Dokuments SET id=id+'+IntToStr(nMaxID)+strWhere);

      lOk:=lOk and ExecuteSQL('DELETE FROM LoadBase.Население WHERE new_id>0'+strAddWhere);

      if lOk then begin
//        strTables:='БазаДомов,HouseOwners,SprOwners,ЛицевыеСчета,ЛицевыеСчетаПризнаки,Население,'+
        strTables:='БазаДомов,HouseOwners,Resh,ЛицевыеСчета,ЛицевыеСчетаПризнаки,Население,'+
                   'НаселениеДоп,НаселениеСобств,НаселениеПризнаки,НаселениеЛьготы,НаселениеДвижение,'+
                   'VUS,Ochered,OcheredResh,SostavSem,БазаСвойствОбъектов,БазаСтрок,Nalogi,Dokuments';
        StrToArr(strTables,arrTables,',',true);
        for i:=Low(arrTables) to High(arrTables) do begin
          ChangeMessage('Копирование таблицы "'+arrTables[i]+'"');
          strFields:=GetListFieldsTable(arrTables[i]);
          if lOnlyCurSost and (Pos('date_fiks',LowerCase(strFields))>0)
            then strSQL:='INSERT INTO '+arrTables[i]+' ('+strFields+') SELECT '+strFields+' FROM LoadBase.'+arrTables[i]+strWhere
            else strSQL:='INSERT INTO '+arrTables[i]+' ('+strFields+') SELECT '+strFields+' FROM LoadBase.'+arrTables[i];
          lOk:=lOk and ExecuteSQL(strSQL);
          if not lOk then begin
            break;
          end;
        end;
        strFields:=GetListFieldsTable('BaseProp');
        strSQL:='INSERT INTO BaseProp ('+strFields+') SELECT '+strFields+' FROM LoadBase.BaseProp WHERE typeobj=1 or typeobj=2 or typeobj=3';
        lOk:=lOk and ExecuteSQL(strSQL);
        strFields:=GetListFieldsTable('BaseTextProp');
        strSQL:='INSERT INTO BaseTextProp ('+strFields+') SELECT '+strFields+' FROM LoadBase.BaseTextProp WHERE typeobj=1 or typeobj=2 or typeobj=3';
        lOk:=lOk and ExecuteSQL(strSQL);
      end;

      // проставим в база OcheredResh IS_LAST_RESH, ID_POST_RESH, ID_SN_RESH
      //----------------------------------------------------------
      if lOk then begin
        ChangeMessage('Обновление решений очередников');
        SetIDLastReshOchered;
      end;

    except
      on E : Exception do begin
        LastError:=E.Message;
      end;
    end;

  // некопируемые таблицы: HouseProps
  //------------------------------------------------------------------------------------------------------
    if lOk then begin
      nMaxID:=MaxID;
      m:=GetLastID;
      if nMaxID > m then begin
        ChangeMessage('Корректировака таблицы "СозданиеОбъекта"');
        while nMaxID > m do begin
          m:=getNewID(0);
        end;
      end;
    end;

  end;

  if lOk and lZAGS then begin
    strTables:='АктыРождений,ЗаключениеБраков,АктыСмертей,АктыУстОтцовства,DeclareMarriage';
    StrToArr(strTables,arrTables,',',true);
    for i:=Low(arrTables) to High(arrTables) do begin
      ChangeMessage('Копирование таблицы "'+arrTables[i]+'"');
      strFields:=','+UpperCase(GetListFieldsTable(arrTables[i]))+',';
      strFields:=StringReplace(strFields,',ID,','',[]);
      if Copy(strFields,1,1)=','
        then strFields:=Copy(strFields,2,Length(strFields));
      if RightStr(strFields,1)=','
        then strFields:=Copy(strFields,1,Length(strFields)-1);
      strSet:=' id_zags='+GlobalTask.ParamAsString('ID')+',id_source='+GlobalTask.ParamAsString('ID');
      if Pos('ON_ID,',strFields)>0 then strSet:=strSet+', on_id=null';
      if Pos('ONA_ID,',strFields)>0 then strSet:=strSet+', ona_id=null';
      if Pos('DECL_ID,',strFields)>0 then strSet:=strSet+', decl_id=null';
      if Pos('MEN_ID,',strFields)>0 then strSet:=strSet+', men_id=null';
      if Pos('LICH_ID,',strFields)>0 then strSet:=strSet+', lich_id=null';
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.'+arrTables[i]+' SET '+strSet);
      lOk:=lOk and ExecuteSQL('INSERT INTO '+arrTables[i]+' ('+strFields+') SELECT '+strFields+' FROM LoadBase.'+arrTables[i]);
      if not lOk
        then break;
    end;
  end;

  WorkQuery.AdsCloseSQLStatement;
  AdsConnection.CloseCachedTables;
  try
    ExecuteSQL('EXECUTE PROCEDURE sp_DropLink('+QStr('LoadBase')+', TRUE);');
  except
  end;

  CloseExecute;
  CloseMessage;
  if (nErr=0) and not lOk then begin
    nErr:=ERR_ADS;
  end;
  Result:=nErr;

end;
{$ENDIF}
//***************** end RunLoadBase for LAIS ******************************************

{$IF Defined(ZAGS) or Defined(POST) }
function TdmBase.RunLoadBase(strDirSource:String; lOnlyCurSost:Boolean; lAllPunkt:Boolean; lZAGS:Boolean;
                             nNewNomerLic:Integer; strAddNomerKniga:String; slCheckSpr:TStringList) : Integer;
begin
  // для zags и post нет объединения
  Result:=0;
end;
{$IFEND}

//----------------------------------------------------------
function TdmBase.CheckSprPunkt : Boolean;
var
  i:Integer;
  sl:TStringList;
  sCASE:String;
begin
  AddToProtokol('----------------- СПРАВОЧНИК НАСЕЛЕННЫХ ПУНКТОВ (BEGIN)------------------');
  Result:=true;
  sl:=TStringList.Create;
  //----- пересекающиеся нас.пункты по "typepunkt+name" ------- (Ружаны-Ружаны)
  WorkQuery.SQL.Text := 'select so.*, sn.id id_cur, sn.name name_cur, sn.typepunkt typepunkt_cur'+#13+
                ' from LoadBase.СпрНасПунктов so'+#13+
                ' left join СпрНасПунктов sn on so.name=sn.name and so.typepunkt=sn.typepunkt '+#13+
                ' where sn.id is not null';
  WorkQuery.Open;
  AddToProtokol(WorkQuery.SQL.Text+' -> RecordCount:'+IntToStr(WorkQuery.RecordCount));
  while not WorkQuery.Eof do begin
    if WorkQuery.FieldByName('ID').AsInteger<>WorkQuery.FieldByName('ID_CUR').AsInteger then begin
      sl.Add( WorkQuery.FieldByName('ID').AsString+'='+WorkQuery.FieldByName('ID_CUR').AsString );
    end;
    WorkQuery.Next;
  end;
  //----- НЕ пересекающиеся нас.пункты по "typepunkt+name" -------
  WorkQuery.SQL.Text := 'select so.*, sn.id id_cur, sn.name name_cur, sn.typepunkt typepunkt_cur'+#13+
                ' from LoadBase.СпрНасПунктов so'+#13+
                ' left join СпрНасПунктов sn on so.name=sn.name and so.typepunkt=sn.typepunkt '+#13+
                ' where sn.id is null';
  WorkQuery.Open;
  AddToProtokol(WorkQuery.SQL.Text+' -> RecordCount:'+IntToStr(WorkQuery.RecordCount));
  while not WorkQuery.Eof do begin
    SprPunkt.Append;
    SprPunkt.FieldByName('TYPEPUNKT').AsInteger:=WorkQuery.FieldByName('TYPEPUNKT').AsInteger;
    SprPunkt.FieldByName('NAME').AsString:=WorkQuery.FieldByName('NAME').AsString;
    SprPunkt.FieldByName('NAME_B').AsString:=WorkQuery.FieldByName('NAME_B').AsString;
    SprPunkt.FieldByName('SOATO').AsString:=WorkQuery.FieldByName('SOATO').AsString;
    if not WorkQuery.FieldByName('DATE_DEATH').IsNull
      then SprPunkt.FieldByName('DATE_DEATH').AsDateTime:=WorkQuery.FieldByName('DATE_DEATH').AsDateTime;
    if not WorkQuery.FieldByName('DATE_BIRTH').IsNull
      then SprPunkt.FieldByName('DATE_BIRTH').AsDateTime:=WorkQuery.FieldByName('DATE_BIRTH').AsDateTime;
    SprPunkt.FieldByName('KOD').AsString:=WorkQuery.FieldByName('KOD').AsString;
    SprPunkt.FieldByName('VXOD').AsString:=WorkQuery.FieldByName('VXOD').AsString;
    SprPunkt.FieldByName('GOROD').AsBoolean:=WorkQuery.FieldByName('GOROD').AsBoolean;
    SprPunkt.FieldByName('NOT_STAT').AsBoolean:=WorkQuery.FieldByName('NOT_STAT').AsBoolean;
    SprPunkt.FieldByName('CHERN').AsBoolean:=WorkQuery.FieldByName('CHERN').AsBoolean;
    SprPunkt.Post;
    sl.Add( WorkQuery.FieldByName('ID').AsString+'='+SprPunkt.FieldByName('ID').AsString );
    WorkQuery.Next;
  end;
  WorkQuery.Close;
  if sl.Count>0 then begin
    sCase:='punkt=case punkt';
    for i:=0 to sl.Count-1 do begin
      sCase:=sCase+' when '+sl.Names[i]+' then '+sl.ValueFromIndex[i];
    end;
    sCase:=sCase+' else punkt end';
    Result:=ExecuteSQL('UPDATE LoadBase.БазаДомов SET '+sCase); // AdsConnection.Execute(sSQL);
    if Result
      then Result:=ExecuteSQL('UPDATE LoadBase.BigHouse SET '+sCase);
  end;
  sl.Free;
  AddToProtokol('----------------- СПРАВОЧНИК НАСЕЛЕННЫХ ПУНКТОВ (END)------------------');
end;

//----------------------------------------------------------
function TdmBase.CheckSprUL(sPunkt:String) : Boolean;
var
  i:Integer;
  sl:TStringList;
  sCASE,s,ss:String;
begin
  AddToProtokol('----------------- СПРАВОЧНИК УЛИЦ (BEGIN)------------------');
  s:=';';
  WorkQuery.Close;
  WorkQuery.SQL.Text := 'select distinct ul from LoadBase.БазаДомов where ul is not null';
  WorkQuery.Open;
  while not WorkQuery.Eof do begin
    s:=s+WorkQuery.Fields[0].AsString+';';
    WorkQuery.Next;
  end;
  WorkQuery.Close;

  Result:=true;
  sl:=TStringList.Create;
  //----- пересекающиеся улицы по "tip+name" ------- ()
  WorkQuery.SQL.Text := 'select so.*, sn.id id_cur, sn.name name_cur, sn.tip tip_cur'+#13+
                ' from LoadBase.СпрУлиц so'+#13+
                ' left join СпрУлиц sn on so.name=sn.name and so.tip=sn.tip '+#13+
                ' where sn.id is not null';
  WorkQuery.Open;
  AddToProtokol(WorkQuery.SQL.Text+' -> RecordCount:'+IntToStr(WorkQuery.RecordCount));
  while not WorkQuery.Eof do begin
    if WorkQuery.FieldByName('ID').AsInteger<>WorkQuery.FieldByName('ID_CUR').AsInteger then begin
      sl.Add( WorkQuery.FieldByName('ID').AsString+'='+WorkQuery.FieldByName('ID_CUR').AsString );
    end;
    WorkQuery.Next;
  end;
  //----- НЕ пересекающиеся улицы -------
  WorkQuery.SQL.Text := 'select so.*, sn.id id_cur, sn.name name_cur, sn.tip tip_cur'+#13+
                ' from LoadBase.СпрУлиц so'+#13+
                ' left join СпрУлиц sn on so.name=sn.name and so.tip=sn.tip '+#13+
                ' where sn.id is null';
  WorkQuery.Open;
  AddToProtokol(WorkQuery.SQL.Text+' -> RecordCount:'+IntToStr(WorkQuery.RecordCount));
  while not WorkQuery.Eof do begin
    if Pos(';'+WorkQuery.FieldByName('ID').AsString+';',s)>0 then begin
      SprUL.Append;
      SprUL.FieldByName('TIP').AsInteger:=WorkQuery.FieldByName('TIP').AsInteger;
      SprUL.FieldByName('NAME').AsString:=WorkQuery.FieldByName('NAME').AsString;
      SprUL.Post;
      sl.Add( WorkQuery.FieldByName('ID').AsString+'='+SprUL.FieldByName('ID').AsString );
    end;  
    WorkQuery.Next;
  end;

  if sl.Count>0 then begin
    ss:='';
    for i:=0 to sl.Count-1 do begin
      if (Pos(';'+sl.Names[i]+';',s)>0) and (sl.Names[i]<>sl.ValueFromIndex[i])
        then ss:=ss+' when '+sl.Names[i]+' then '+sl.ValueFromIndex[i];
    end;
    if ss<>'' then begin
      sCase:='ul=case ul '+ss+' else ul end';
      Result:=ExecuteSQL('UPDATE LoadBase.БазаДомов SET '+sCase); // AdsConnection.Execute(sSQL);
      if Result
        then Result:=ExecuteSQL('UPDATE LoadBase.BigHouse SET '+sCase);
    end;
  end;
  sl.Free;
  AddToProtokol('----------------- СПРАВОЧНИК НАСЕЛЕННЫХ ПУНКТОВ (END)------------------');
end;

//----------------------------------------------------------
// tbSpr - текущий справочник
// slTables - список таблиц и полей в них для проверки
function TdmBase.CheckOneSprLoadBase(tbSpr:TAdsTable;slTables:TStringList; nTypeObj:Integer) : Boolean;
var
  q:TAdsQuery;
  tb:TAdsTable;
  sName,sCase,sWhere,sSQL,s:String;
  n,i,j:Integer;
  lAutoInc,lString:Boolean;
  arrFields:TArrStrings;
  fld:TField;
begin
  Result:=true;
  sName:=NameTableToSQL(tbSpr);
  AddToProtokol('---------- СПРАВОЧНИК '+sName+' (BEGIN) -----------------');
  q := TAdsQuery.Create(nil);
  with q do begin
    SourceTableType := ttAdsADT;
    AdsTableOptions.AdsCharType := ANSI;
    DataBaseName := 'AdsConnection';
    Name := 'qTmp';
  end;
// ID NAME
  //------ записи в загружаемом справочнике, которым нет соответствия в текущем ----------
  s:='Upper(Replace(Replace( Replace(so.name, '' '','''') ,''-'',''''),'','','''') )=Upper( Replace(Replace( Replace(sn.name, '' '','''') ,''-'',''''),'','','''') )';
  q.SQL.Text := 'select so.*, sn.id id_cur,sn.name name_cur'+#13+
                ' from LoadBase.'+sName+' so'+#13+
                ' left join '+sName+' sn on '+s+#13+
                ' where sn.name is null';
  if tbSpr.FieldByName('ID').DataType=ftAutoInc then lAutoInc:=true else lAutoInc:=false;
  s:='';
  q.Open;
  AddToProtokol(q.SQL.Text+' -> RecordCount:'+IntToStr(q.RecordCount) );

  tbSpr.IndexFieldNames:='ID';
  tbSpr.Last;
  n:=tbSpr.FieldByName('ID').AsInteger;
  Inc(n,1);
  // добавим недостающие записи
  while not q.Eof do begin
    tbSpr.Append;
    s:='';
    for i:=0 to tbSpr.FieldCount-1 do begin
      if tbSpr.Fields[i].FieldName='ID' then begin
        if not lAutoInc then begin
          if nTypeObj>0 then begin
            n:=GetNewID(nTypeObj);   // сгенерируем новый ID
          end;
          tbSpr.FieldByName('ID').AsInteger:=n;
          Inc(n,1);
        end;
      end else begin
        try
          fld:=q.FindField(tbSpr.Fields[i].FieldName);
          if fld=nil then begin
            s:=s+tbSpr.Fields[i].FieldName+'=(none),';
          end else begin
            s:=s+tbSpr.Fields[i].FieldName+'="'+fld.AsString+'",';
          end;
          if not fld.IsNull then begin
            tbSpr.Fields[i].Value:=fld.Value;
          end;
        except
        end;
      end;
    end;
    try
      tbSpr.Post;
    except
      on E: Exception do begin
        Result:=false;
        PutError('Справочник:'+sName+#13#10+s+#13#10+E.Message);
      end;
    end;
    if not Result then break;
    q.Next;
  end;
  if Result then begin
    //------ определим записи в загружаемом справочнике, которые нужно перекодировать в загружаемой базе ----------
    q.SQL.Text := 'select so.id id_load, so.name name_load, sn.id id_cur, sn.name name_cur'+#13+
                  ' from LoadBase.'+sName+' so'+#13+
                  ' left join '+sName+' sn on so.name=sn.name'+#13+
                  ' where so.id<>sn.id ';

    q.Open;
    AddToProtokol(q.SQL.Text+' -> RecordCount:'+IntToStr(q.RecordCount) );

    if q.RecordCount>0 then begin
      // пройдем по всем таблицам
      for i:=0 to slTables.Count-1 do begin
        tb := TAdsTable(slTables.Objects[i]);
        // slTables.strings[i] = FIELD1;FIELD2=date_fiks='1899-12-30'
        sWhere:=slTables.ValueFromIndex[i];
        if (sWhere<>'') and (Pos('WHERE',UpperCase(sWhere))=0) then sWhere:=' where '+sWhere;
        StrToArr(slTables.Names[i],arrFields,';',true);
        sSQL:='update LoadBase.'+NameTableToSQL(tb)+' set '+#13#10;
        for j:=0 to Length(arrFields)-1 do begin
          if tb.FieldByName(arrFields[j]).DataType=ftString then lString:=true else lString:=false;
          q.First;
          sCase:=arrFields[j]+'=case '+arrFields[j];
          while not q.Eof do begin
            if lString
              then sCase:=sCase+' when '+QStr(q.FieldByName('ID_LOAD').AsString)+' then '+QStr(q.FieldByName('ID_CUR').AsString)
              else sCase:=sCase+' when '+q.FieldByName('ID_LOAD').AsString+' then '+q.FieldByName('ID_CUR').AsString;
            q.Next;
          end;
          sCase:=sCase+' else '+arrFields[j]+' end';
          if j<Length(arrFields)-1 then sCase:=sCase+','+#13#10;
          sSQL:=sSQL+sCase;
        end;
        sSQL:=sSQL+sWhere;

        Result:=ExecuteSQL(sSQL); // AdsConnection.Execute(sSQL);
        if not Result
          then break;
      end;
    end;
    q.Close;
    q.Free;
    AddToProtokol('----------------- СПРАВОЧНИК '+sName+' (END) ------------------');
  end else begin
    AddToProtokol('ОШИБКА ЗАГРУЗКИ СПРАВОЧНИКА: '+sName);
    q.Close;
    q.Free;
  end;
end;
//--------------------------------------------------------------------------------
function TdmBase.GetListValues(strTable, strField, strWhere: String): String;
var
  s:String;
begin
  WorkQuery.Close;
  WorkQuery.SQL.Clear;
  WorkQuery.SQL.Add('SELECT '+strField+' FROM '+strTable+' WHERE '+strWhere+' ORDER BY '+strField);
  WorkQuery.Open;
  Result:='';
  s:=WorkQuery.Fields[0].AsString;
  if s<>'' then begin
    WorkQuery.Last;
    if s<>WorkQuery.Fields[0].AsString
      then Result:=s+'-'+WorkQuery.Fields[0].AsString
      else Result:=s;
  end;
  WorkQuery.Close;
end;

//-------------------------------------------------------------
// полное удаление населенного пункта из базы !!!
//-------------------------------------------------------------
function TdmBase.DeletePunkt(v: Variant; Conn:TAdsConnection; lFromSpr:Boolean; lDelFreeMen:Boolean): Boolean;
var
//  lOk:Boolean;
  s,sName : String;
  strSQL:String;
//  i:Integer;
//  Params:TParams;
  nID:Integer;
  sWhere,sAddMen:String;
begin
  Result:=true;
  if (VarType(v)=varString) then begin
    sWhere:=VarToStr(v);
    nID:=0;
  end else begin
    sWhere:='punkt='+VarToStr(v);
    nID:=v;
  end;
  // удалять людей проживающих на другой территории
  if lDelFreeMen
    then sAddMen:=' or adres_id is null or adres_id=0'
    else sAddMen:=' or 1=2';

  if lFromSpr and (nID>0) then begin
    if SprPunkt.FieldByName('ID').AsInteger<>nID then begin
      if not SprPunkt.Locate('ID', nID, []) then begin
        Result:=false;
      end;
    end;
    if not Result then exit;

    GetTypePunkt(SprPunkt.FieldByName('TYPEPUNKT').AsString,'R',s);
    sName:=Trim(s+' '+SprPunkt.FieldByName('NAME').AsString);

    GlobalTask.LogFile.WriteToLogFile('Начало удаления из базы: '+sName);
    OpenMessage('Полное удаление '+sName+' из базы ...','',10);
  end;

//  s:=LoadSQLEx('Удаление_врем_таблиц');
//  try
//    Conn.Execute(s);
//  except
//  end;
  strSQL:=LoadSQLEx('Удаление_по_условию_на_адрес');
//  strSQL:=LoadSQLEx('Удаление_по_ID_НасПункта');
  if strSQL='' then begin
    PutError('не найден SQL скрипт: <Удаление_по_условию_на_адрес>');
    Result := false;
    exit;
  end else begin
    strSQL:=StringReplace(strSQL, '&ADD_WHERE&', sWhere, [rfReplaceAll, rfIgnoreCase]);
    strSQL:=StringReplace(strSQL, '&ADD_MEN&', sAddMen, [rfReplaceAll, rfIgnoreCase]);
  end;
{
  Params := TParams.create();
  Params.CreateParam( ftInteger, 'ppp1', ptInput );
  Params[0].Value := nID;
  Params.CreateParam( ftInteger, 'ppp2', ptInput );
  Params[1].Value := nID;
  Params.CreateParam( ftInteger, 'ppp3', ptInput );
  Params[2].Value := nID;
  Params.CreateParam( ftInteger, 'ppp4', ptInput );
  Params[3].Value := nID;}
  try
//    Conn.Execute(strSQL,params);
    memowrite('del.sql',strSQL);
    Conn.Execute(strSQL ,nil);
    if not lFromSpr and (nID>0) then begin  // при объединении баз  если передан ID нас. пункта
      Conn.Execute('DELETE FROM СпрНасПунктов WHERE id='+IntToStr(nID));
    end;
  except
    on E:Exception do begin
      if lFromSpr then begin
        GlobalTask.LogFile.WriteToLogFile('ОШИБКА удаления из базы: '+sName);
        PutError('ОШИБКА удаления из базы: '+#13#10+sName);
        Result := false;
      end else begin // при объединении баз
        AddToProtokol('ОШИБКА -> '+E.Message);
        Result := false;
      end;
    end;
  end;
  {
  Params.Free;
  try
    Conn.Execute(s);
  except
  end;
  }
  if lFromSpr then begin
    CloseMessage;
    if Result then GlobalTask.LogFile.WriteToLogFile('Успешное завершения удаления из базы: '+sName);
    LookUpPunkt.Close;
    LookUpPunkt.AdsCloseSQLStatement;
    LookUpPunkt.Open;
  end;
end;

//---------------------------------------------------------------------
function TdmBase.CheckWriteOtkudaPrib(ds: TDataSet): Boolean;
begin
  Result:=true;
           // государство введено и оно не Беларусь
  if (not ds.FieldByName('OP_GOSUD').IsNull and (ds.FieldByName('OP_GOSUD').AsInteger<>MY_GRAG)) or
     (ds.FieldByName('OP_OBL').AsString<>'') or (ds.FieldByName('OP_RAION').AsString<>'')
     or (ds.FieldByName('OP_GOROD').AsString<>'') then begin  // введена область или район или нас.пункт
    Result:=false;   // записывать не надо
  end;
end;

procedure TdmBase.CheckSysSprPrichSm;
//var
//  lErr:Boolean;
//  Opis:TOpisEdit;
begin
{
  if GlobalTask.ParamAsBoolean('SMERT_SYSSPR') then begin
    if SprPrichSm.Active then begin
      lErr:=false;
      SprPrichSm.Active:=false;
      SprPrichSm.DataBaseName :='AdsSharedConnection';
      SprPrichSm.ReadOnly:=true;
      SprPrichSm.TableName:='SprMKB10.adt';
      try
        SprPrichSm.Active:=true;

      except
        lErr:=true;
      end;
      if lErr then begin
        SprPrichSm.ReadOnly:=false;
        SprPrichSm.TableName:='SprPrichSm.adt';
        SprPrichSm.DataBaseName :='AdsConnection';
        SprPrichSm.Active:=true;
      end;
    end;
  end;
  }
end;

//---------------------------------------------------------------------
// имя папки по типу объета
function TdmBase.NameDirFromTypeObj(nTypeObj:Integer; sAddDir1,sAddDir2:String; lFull:Boolean):String;
var
  strDir,s:String;
  n:Integer;
begin
  strDir:='';
  {
  if nTypeObj = dmBase.TypeObj_Lich then begin
    strDir := 'ЛицевыеCчета';
  end else if nTypeObj = dmBase.TypeObj_Nasel then begin
    strDir := 'Население';
  end else if nTypeObj = dmBase.TypeObj_Adres then begin
    strDir := 'Дома';
  end else if nTypeObj = dmBase.TypeObj_ZBrak then begin
    strDir := 'ЗаключениеБраков';
  end else if nTypeObj = dmBase.TypeObj_ZRogd then begin
    strDir := 'АктыРождений';
  end else if nTypeObj = dmBase.TypeObj_ZSmert then begin
    strDir := 'АктыСмертей';
  end else if nTypeObj = dmBase.TypeObj_ZUstOtc then begin
    strDir := 'АктыУстОтцовства';
  end else if nTypeObj = dmBase.TypeObj_ZUstMat then begin
    strDir := 'АктыУстМатеринства';
  end else if nTypeObj = dmBase.TypeObj_ZAdopt then begin
    strDir := 'АктыУсыновления';
  end else if nTypeObj = dmBase.TypeObj_ZRast then begin
    strDir := 'РасторжениеБраков';
  end else if nTypeObj = dmBase.TypeObj_ZChName then begin
    strDir := 'ИзменениеИмени';
  end else if nTypeObj = dmBase.TypeObj_Passport then begin
    strDir := 'Паспорт';
  end else if nTypeObj = dmBase.TypeObj_TalonPrib then begin
    strDir := 'ТалоныПрибытия';
  end else if nTypeObj = dmBase.TypeObj_TalonUbit then begin
    strDir := 'ТалоныУбытия';
  end else if nTypeObj = dmBase.TypeObj_DeclareRegistr then begin
    strDir := 'ЗаявленияРегисрации';
  end else if nTypeObj = dmBase.TypeObj_ZAGS_AddDok then begin
    strDir := 'ДополнительныйДокументы';
  end;
  }
    if sAddDir1<>''
      then strDir:=CheckSleshN(sAddDir1)+strDir;
    if sAddDir2<>''
      then strDir:=CheckSleshN(strDir)+sAddDir2;
    if lFull then begin
      s:=Globaltask.PathServiceMain;
      if RightStr(s,1)='\' then s:=Copy(s,1,Length(s)-1);
      n:=LastPos('\',s);
      s:=Copy(s,1,n);
      Result:=s+CheckSleshN(strDir);
    end else begin
      Result:=CheckSleshN(strDir);
    end;
//  end else begin
//    Result:='';
//  end;
end;

//---------------------------------------------------------------------------------
function TdmBase.DataSetFromTypeObj(nTypeObj: Integer): TDataSet;
begin
  Result:=MainTableFromTypeObj(nTypeObj);
end;
//---------------------------------------------------------------------------------
function TdmBase.MainTableFromTypeObj(nTypeObj: Integer): TAdsTable;
begin
  Result:=nil;
   if nTypeObj=TypeObj_Nasel then begin
     Result:=tbMens;
   end else if nTypeObj=TypeObj_Adres then begin
     Result:=tbAdres;
   end else if nTypeObj=TypeObj_Lich then begin
     Result:=tbLich;
   end else if nTypeObj=TypeObj_DeclareRegistr then begin

   end else if nTypeObj=TypeObj_TalonPrib then begin

   end else if nTypeObj=TypeObj_TalonUbit then begin

   end else if (nTypeObj=_TypeObj_SMDOPost) or (nTypeObj=_TypeObj_SMDOPostUvd) or (nTypeObj=_TypeObj_SMDOPostDoc) then begin
     {$IFDEF SMDO}
     Result:=SMDOPost;
     {$ELSE}
     Result:=nil;
     {$ENDIF}
   end else if nTypeObj=_TypeObj_AktZAH then begin
     {$IFDEF ADD_ZAH}
     Result:=AktZ;
     {$ENDIF}
   end else if nTypeObj=_TypeObj_Opeka then begin
     {$IFDEF ADD_OPEKA}
     Result:=tbZapisOpeka;
     {$ENDIF}
   end else if nTypeObj=TypeObj_ZBrak then begin
     Result:=tbZapisBrak;
   end else if nTypeObj=TypeObj_ZRast then begin
     {$IFDEF ZAGS}
     Result:=tbZapisRast;
     {$ELSE}
     Result:=nil;
     {$ENDIF}
   end else if nTypeObj=TypeObj_ZRogd then begin
     Result:=tbZapisRogd;
   end else if nTypeObj=TypeObj_ZSmert then begin
     Result:=tbZapisSmert;
   end else if nTypeObj=TypeObj_ZUstOtc then begin
     Result:=tbZapisUstOtc;
   end else if nTypeObj=TypeObj_ZAdopt then begin
     {$IFDEF ZAGS}
     Result:=tbZapisAdopt;
     {$ELSE}
     Result:=nil;
     {$ENDIF}
   end else if nTypeObj=TypeObj_ZChName then begin
     {$IFDEF ZAGS}
     Result:=tbZapisChName;
     {$ELSE}
     Result:=nil;
     {$ENDIF}
   end else if nTypeObj=TypeObj_DBrak then begin
     Result:=tbDeclBrak;
   end else if nTypeObj=_TypeObj_DChName then begin
     {$IFDEF ZAGS}
       Result:=tbDeclChName;
     {$ENDIF}
   end else if nTypeObj=_TypeObj_DIzm then begin
     {$IFDEF ZAGS}
       Result:=tbDeclIzm;
     {$ENDIF}
   end else if nTypeObj=TypeObj_DRast then begin
     {$IFDEF ZAGS}
       Result:=DeclareTermMarriage;
     {$ENDIF}
   end else if nTypeObj=TypeObj_ZUstMat then begin
     {$IFDEF ZAGS}
     Result:=tbZapisUstMat;
     {$ELSE}
     Result:=nil;
     {$ENDIF}
   end else if (nTypeObj>=_TypeObj_UZRogd) and (nTypeObj<=_TypeObj_UZ_Max) then begin
     {$IF Defined(ZAGS) or Defined(LAIS) }
       Result:=GurnalRegistr;
     {$IFEND}
   end;
   {
   TypeObj_BigHouse : Result:= Integer;
   TypeObj_Passport : Integer;
   TypeObj_DeclareRegistr :
   TypeObj_TalonPrib: Integer;
   TypeObj_TalonUbit: Integer;
   TypeObj_PassportViza: Integer;
   TypeObj_Owners: Integer;
   TypeObj_PasportTerr: Integer;  // паспорт территории
   TypeObj_Sovet: Integer;  // месный совет
   TypeObj_Ochered : Integer;
   TypeObj_VUS : Integer;
   TypeObj_Organ : Integer;
   TypeObj_Obrach: Integer;  // обращения граждан
   TypeObj_Spr: Integer;
   TypeObj_ZAGS_AddDok:Integer;          //
   TypeObj_ZAGS_SprAkt:Integer;          // справка о записи акта гр. состояния
   TypeObj_ZAGS_SprOtsut:Integer;        // справка об отсутствии актовой записи
   TypeObj_ZAGS_IzvOtsut:Integer;        // извещение об отсутствии актовой записи
   TypeObj_ZAGS_ZaklChName:Integer;      // заключение о перемене имени, фамилии
   TypeObj_ZAGS_SprBrak:Integer;         // справка о записи акта о браке
   TypeObj_ZAGS_SprRogd:Integer;         // справка о записи акта о рождении
   TypeObj_ZAGS_SprSmert:Integer;        // справка о записи акта о смерти
   TypeObj_ZAGS_SprChName:Integer;       //
   TypeObj_ZAGS_SprRast:Integer;         //
   TypeObj_ZAGS_ZaklIzmAkt:Integer;      //  заключение о изменении актовой записи
   }
end;
//---------------------------------------------------------------------------------
function TdmBase.NameTableFromTypeObj(nTypeObj: Integer):String;
var
  tb:TadsTable;
begin
  tb:=MainTableFromTypeObj(nTypeObj);
  if tb<>nil
    then Result:=tb.TableName
    else Result:='';
end;
//----------------------------------------------------------------
function TdmBase._LockTypeObj(nTypeObj:Integer; strMessage:String; lVisible:Boolean):Boolean;
var
  lOpenMessage,lMessage:Boolean;
begin
  if strMessage='' then strMessage:='Другой пользователь выполняет операцию ... ';
  if not dmBase.LockTypeObj.Locate('TYPEOBJ', nTypeObj, []) then begin
    dmBase.LockTypeObj.Append;
    dmBase.LockTypeObj.FieldByName('TYPEOBJ').AsInteger:=nTypeObj;
    dmBase.LockTypeObj.Post;
  end;
  Result:=false;
  lOpenMessage:=false;
  lMessage:=false;
  if lVisible then begin
    while not Result do begin
      if lOpenMessage and not lMessage then begin
        OpenMessageEx(strMessage,'Подождите пожалуйста',10,'  Прервать  ');
        lMessage:=true;
      end;
      try
        dmBase.LockTypeObj.Edit;  // запись блокируется
        Result:=true;
      except
        lOpenMessage:=true;
      end;
      Application.ProcessMessages;
      if lMessage and (GetResultMessage=0) then begin
        break;
      end;
    end;
    CloseMessage;
  end else begin
    try
      dmBase.LockTypeObj.Edit;   // запись блокируется
      Result:=true;
    except
    end;
  end;
end;
//----------------------------------------------------------------
procedure TdmBase._UnLockTypeObj(nTypeObj:Integer);
begin
  if LockTypeObj.State=dsEdit then begin
    LockTypeObj.Cancel;
  end;
end;

// возвращает массив BOOKMARK найденных записей
//-----------------------------------------------------------------------------------------------------
function TdmBase.SeekAkt(nTypeObj: Integer; nIDZags:Integer; nNomer: Integer; dDate: TDateTime; lVosstan:Boolean): TArrStrings;
var
  tb:TAdsTable;
  st:TSostTable;
  sBookMark:String;
  n:Integer;
  fldVosstan:TField;
begin
  SetLength(Result,0);
  sBookMark:='';
  if (nNomer>0) and (dDate>0) then begin
    tb:=MainTableFromTypeObj(nTypeObj);
    if tb<>nil then begin
      st:=SaveSostTable(tb,true,true);
      {$IFNDEF ZAGS}
        fldVosstan:=nil;
      {$ELSE}
        if (nTypeObj=TypeObj_ZBrak) or (nTypeObj=TypeObj_ZRogd) or (nTypeObj=TypeObj_ZSmert) then begin
          fldVosstan:=tb.FindField('VOSSTAN');
        end else begin
          fldVosstan:=nil;
        end;
      {$ENDIF}
//      tb.IndexFieldNames:='NOMER;DATEZ';    было до 18.07.2018
      tb.IndexName:='NOMER'; //'NOMER;DATEZ;ID_ZAGS'
//      d1:=STOD(IntToStr(YearOf(dDate))+'0101',tdClipper);
//      d2:=STOD(IntToStr(YearOf(dDate))+'1231',tdClipper);
      tb.SetRange([nNomer,dDate],[nNomer,dDate]);
      n:=0;
      while not tb.Eof do begin
        if ((nIDZags=0) or (tb.FieldByName('ID_ZAGS').AsInteger=nIDZags)) and ((fldVosstan=nil) or (fldVosstan.AsBoolean=lVosstan)) then begin
          if sBookMark=''
            then sBookMark:=tb.Bookmark;
          SetLength(Result,n+1);
          Result[n]:=tb.Bookmark;
          n:=n+1;
        end;
        tb.Next;
      end;
      RestSostTable(tb,st);
      if sBookMark<>'' then begin  // встанем на первую найденную закладку
        tb.Bookmark:=sBookMark;
      end;
    end;
  end;
end;

//-----------------------------------------------------------
function TdmBase.CheckNomerAkt(nTypeObj: Integer; nIDZags:Integer; nIDAkt:Integer; nNomer: Integer; dDate: TDateTime; lVosstan:Boolean; FormDok:TForm): Boolean;
var
  tb:TAdsTable;
  st:TSostTable;
  d1,d2:TDateTime;
  sName,sBookMark:String;
  n:Integer;
  lErr,lSeek:Boolean;
  strErr:String;
//  fDok:TfmSimpleD;
  fldVosstan:TField;
begin
  strErr:='';
  Result:=true;
  lErr:=false;
  lSeek:=false;
  {
  if FormDok=nil then begin
    fDok:=nil;
  end else begin
    fDok:=TfmSimpleD(FormDok);
  end;
  if fDok<>nil then begin
    if fDok.FOnlySvid then begin
      Result:=false;
      lSeek:=true;        // просто найти актовую запись
      nIDAkt:=-1;
//      lCheckVosstan:=false;
    end;
  end;
  }
  sBookMark:='';
  n:=Globaltask.ParamAsInteger('KONT_NOMERAKT');   // 0-не контролировать  1-жесткий контроль  2-контроль с запросом
  if ((n>0) or lSeek) and (nNomer>0) and (dDate>0) then begin
    tb:=MainTableFromTypeObj(nTypeObj);

    if tb<>nil then begin
      st:=SaveSostTable(tb,true,true);
      if (nTypeObj=TypeObj_ZBrak) or (nTypeObj=TypeObj_ZRogd) or (nTypeObj=TypeObj_ZSmert) then begin
//        lCheckVosstan:=true;           // учитывать <восстановл.>  <не восстановл.> актовая запись
        fldVosstan:=tb.FindField('VOSSTAN');
      end else begin
//        lCheckVosstan:=false;
        fldVosstan:=nil;
      end;
      {$IFNDEF ZAGS}
        fldVosstan:=nil;          
//        lCheckVosstan:=false;
      {$ENDIF}
//      tb.IndexFieldNames:='NOMER;DATEZ'; !!! было до 18.07.2018
      tb.IndexName:='NOMER';  // 'NOMER;DATEZ;ID_ZAGS'
      d1:=STOD(IntToStr(YearOf(dDate))+'0101',tdClipper);
      d2:=STOD(IntToStr(YearOf(dDate))+'1231',tdClipper);
      tb.SetRange([nNomer,d1],[nNomer,d2]);
// не работает   tb.SetRange([nNomer,d1,nIDZags],[nNomer,d2,nIDZags]);
      while not tb.Eof do begin
        if (tb.FieldByName('ID_ZAGS').AsInteger=nIDZags) and ((fldVosstan=nil) or (fldVosstan.AsBoolean=lVosstan)) then begin
// не работает if ((fldVosstan=nil) or (fldVosstan.AsBoolean=lVosstan)) then begin
          if (nIDAkt<1) then begin  // новая актовая запись
            if tb.FieldByName('NOMER').AsInteger=nNomer then begin
              if lSeek then begin  // просто хотим найти запись по номеру, дате и ID загса
                sBookMark:=tb.Bookmark;
                Result:=true;
              end else begin
                lErr:=true;
              end;
            end;
          end else begin            // актовая запись уже существует
            // если не таже самая запись и номер существует
            if (tb.FieldByName('ID').AsInteger<>nIDAkt) and (tb.FieldByName('NOMER').AsInteger=nNomer) then begin
              lErr:=true;
            end;
          end;
        end;
        {$IFDEF ZAGS}
          sName:=fmMain.SprNameOrg(nIDZags,'','',Trim(tb.FieldByName('NAME_ZAGS').AsString));
        {$ELSE}
          sName:='';
        {$ENDIF}
        if lErr then begin
          strErr:='Запись';
          if (fldVosstan<>nil) and lVosstan
            then strErr:='Восстановленная актовая запись';
          strErr:=strErr+' с номером: '+IntToStr(nNomer)+' уже существует.'+#13+'Выписана: '+FormatDateTime('dd.mm.yyyy',tb.FieldByName('DATEZ').AsDateTime)+'г.'+#13+sName;
          if n=2 then begin
            if Problem(strErr+#13+'Продолжить запись?') then begin
              Result:=true;
            end else begin
              Result:=false;
            end;
            strErr:='';
          end else begin  // n=1
            PutError(strErr);
            Result:=false;
          end;
          break;
        end;
        tb.Next;
      end;
      RestSostTable(tb,st);
      // собирались просто поискать и нашли
      if lSeek and (sBookMark<>'') then begin
        tb.Bookmark:=sBookMark;
      end;
    end;
  end;
end;

{$IFDEF ZAGS}
//----------------------------------------------------------------------------
// slTypes - список типов актовых записей
// nIdZAGD  [-1]-без учета органа ЗАГС  [0]-в разрезе органов ЗАГС   [NNN]-для конкретного ЗАГС
// lRun проверка с удалением дубликатов
// lSvid  объединение свидетельств, если включено lRun
// lProtokol вывести окно протокола работы
procedure TdmBase.CheckDublZapis(slTypes:TStringList; slPar:TStringList; nIDZags:Integer; lRun:Boolean; lSvid:Boolean; lProtokol:Boolean; dDate1:TDateTime; dDate2:TDateTime);
var
  dsDubl,dsAkt,dsSvid : TdataSet;
  ss,sID,s,s1,s2,s3,sName,sNameType,sNameZags,sWhere,sSQL:String;
  d:TDateTime;
  nCountFld,j,nType,m,k,nAkt:Integer;
  sl,slSvid:TStringList;
  arrKey:TArrVariant;
  lV,lAdd,lCheckFields:Boolean;
//  Opis : TOpisEdit;
begin
  lCheckFields:=true;         // проверять поля на заполненность
  if slPar<>nil then begin
    lCheckFields:=(ValueFromParams(slPar, 'COUNT_FIELDS', '1')='1');
  end;
  if lProtokol then
    // !!!  включить запрос на закрытие откна отладки  !!!
    CreateDebugWin('Процесс выполнения');   // DebugWin_QueryClose:=true

  if nIDZags>0 then begin
    sWhere:='id_zags='+IntToStr(nIDZAGS)+' ';
    if lProtokol and SprNames.Locate('ID', nIDZAGS, []) then
      WriteDebug('ЗАГС: '+inttostr(nIDZAGS)+' '+SprNames.FieldByName('NAME').AsString);
  end else begin
    sWhere:='id_zags is not null ';
    if lProtokol and (nIDZags=-1) then
      WriteDebug('БЕЗ УЧЕТА ОРГАНА ЗАГС');
  end;
  if (dDate1>0) and (dDate2>0) then begin
    s:='datez>='+DateToSQL(dDate1)+' and datez<='+DateToSQL(dDate2);
    if sWhere=''
      then sWhere:=s else sWhere:=sWhere+' and '+s;
    if lProtokol then
      WriteDebug('ПЕРИОД: '+DatePropis(dDate1,3)+' - '+DatePropis(dDate2,3));
  end;
  if sWhere<>'' then sWhere:=' WHERE '+sWhere;
  sl:=TStringList.Create;
  slSvid:=TStringList.Create;
//  Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_FULL');
  if lProtokol then
    WriteDebug('НАЧАЛО ОБРАБОТКИ  '+FormatDateTime('dd.mm.yyyy hh:nn:ss', Now));
  for m:=0 to slTypes.Count-1 do begin
//    sleep(1000);
    nType:=StrToInt(slTypes.Strings[m]);
    sNameType:='з/а '+GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_FULL').Naim(nType,false);
    if lProtokol then
      WriteDebug(#13#10+IntToStr(m+1)+') '+sNameType);
    sName:=NameTableFromTypeObj(nType);
    dsAkt:=MainTableFromTypeObj(nType);
    if (nIDZAGS>-1) and (nType=_TypeObj_ZBrak) or (nType=_TypeObj_ZRogd) or (nType=_TypeObj_ZSmert)
      then lV:=true
      else lV:=false;
    if lV then begin               
      s1:=' VOSSTAN,';
      s2:=', 3';
      s3:=', 4';
    end else begin
      s1:='';
      s2:='';
      s3:='';
    end;
    if nIDZAGS>0 then begin   // для конкретного органа ЗАГС
      sSQL:='SELECT DATEZ, NOMER,'+s1+' COUNT(*) KOLVO FROM '+sName+sWhere+' GROUP BY 1,2'+s2+' HAVING Count(*)>1';
    end else if nIDZAGS=0 then begin  // в разрезе органов ЗАГС
      sSQL:='SELECT DATEZ, NOMER, ID_ZAGS,'+s1+' COUNT(*) KOLVO FROM '+sName+sWhere+' GROUP BY 1,2,3'+s3+' HAVING Count(*)>1';
    end else begin // nIDZAGS=-1   без учета ЗАГС
      sSQL:='SELECT DATEZ, NOMER,'+s1+' COUNT(*) KOLVO FROM '+sName+sWhere+' GROUP BY 1,2'+s2+' HAVING Count(*)>1';
    end;
    MemoWrite('last.sql', sSQL);
    dsDubl:=dbOpenSQL(sSQL,'');
    dsSvid:=dbOpenSQL('SELECT TOP 1 * FROM SvidPovtor','');
//    i:=1;
    dbSetIndex(dsAkt,'NOMER');
    dmBase.SvidPovtor.IndexName:='PR_KEY';  //SVID_TYPE;AKT_ID;SVID_DATE;SVID_NOMER
//  dbSetIndex(dsApp,'PR_KEY');
    if dsDubl.Eof and lProtokol then
      WriteDebug('  дубликаты не найдены');
    while not dsDubl.Eof do begin
      SetLength(arrKey,3);  // !!!
      arrKey[0]:=dsDubl.FieldByName('NOMER').AsInteger;
      arrKey[1]:=dsDubl.FieldByName('DATEZ').AsDateTime;
      if nIDZAGS=-1 then begin        // без учета ЗАГС
        SetLength(arrKey,2);  // !!!
        sNameZags:='';
      end else if nIDZAGS=0 then begin  // в разрезе ЗАГС
        arrKey[2]:=dsDubl.FieldByName('ID_ZAGS').AsInteger;
        if SprNames.Locate('ID', arrKey[2], [])
          then sNameZags:=SprNames.FieldByName('NAME').AsString
          else sNameZags:='ЗАГС код:'+VarToStr(arrKey[2]);
      end else begin      // для конкретного ЗАГС
        arrKey[2]:=nIDZAGS;
        sNameZags:='';
      end;
      if lV then begin
        SetLength(arrKey,Length(arrKey)+1);  // !!!
        arrKey[Length(arrKey)-1]:=dsDubl.FieldByName('VOSSTAN').AsBoolean;
      end;
      dbSetRange(dsAkt,arrKey);
      if lV and dsDubl.FieldByName('VOSSTAN').AsBoolean
        then s:='восстановленная'
        else s:='';
      if lProtokol then
        WriteDebug('   '+s+' з/а №'+VarToStr(arrKey[0])+' от '+DatePropis(VarToDateTime(arrKey[1]),3)+' '+sNameZags);
      s:='';
      sl.Clear;
      slSvid.Clear;
      sID:='';
      nCountFld:=0;
      while not dsAkt.Eof do begin
        //------ соберем все свидетельства  ---------------------------------------------
        if nType<>_TypeObj_ZRast then begin  // первичные раст. пропускаем  ON_SVID_SERIA ONA_SVID_SERIA
          if (Trim(dsAkt.FieldByName('SVID_NOMER').AsString)<>'') and not dsAkt.FieldByName('DATESV').IsNUll then begin
            ss:=DTOS(dsAkt.FieldByName('DATESV').AsDateTime,tdClipper)+PadLStr(Trim(dsAkt.FieldByName('SVID_NOMER').AsString),10,' ')+PadLStr(Trim(dsAkt.FieldByName('SVID_SERIA').AsString),10,' ');
            if slSvid.IndexOf(ss)=-1
              then slSvid.Add(ss);
          end;
        end;
        dbChangeSQL(dsSvid, 'SELECT * FROM SvidPovtor WHERE SVID_TYPE='+InttoStr(nType)+' and AKT_ID='+dsAkt.FieldByName('ID').AsString, true);
        while not dsSvid.Eof do begin
          if (Trim(dsSvid.FieldByName('SVID_NOMER').AsString)<>'') and not dsSvid.FieldByName('SVID_DATE').IsNUll then begin
            ss:=DTOS(dsSvid.FieldByName('SVID_DATE').AsDateTime,tdClipper)+PadLStr(Trim(dsSvid.FieldByName('SVID_NOMER').AsString),10,' ')+PadLStr(Trim(dsSvid.FieldByName('SVID_SERIA').AsString),10,' ');
            if slSvid.IndexOf(ss)=-1
              then slSvid.Add(ss);
          end;
          dsSvid.Next;
        end;
        //------------------------------------------------
        if lCheckFields then begin
          k:=0;
          for j:=0 to dsAkt.FieldCount-1 do begin
            if not dsAkt.Fields[j].IsNull and (dsAkt.Fields[j].AsString<>'') then Inc(k,1);
          end;
          if k>nCountFld then begin
            nCountFld:=k;
            sID:=dsAkt.FieldByName('ID').AsString;  // берем ID максимально заполненной записи
          end;
        end else begin
          if sID=''  then sID:=dsAkt.FieldByName('ID').AsString;  // берем ID первой записи
        end;
//        if dsAkt.FieldByName('PODR').AsInteger=9 then begin   загруженная запись имела преимущество
//          sID:=dsAkt.FieldByName('ID').AsString;
//        end;
        sl.Add(dsAkt.FieldByName('ID').AsString);
        s:=s+dsAkt.FieldByName('ID').AsString+',';
        dsAkt.Next;
        if lProtokol and ( (DebugWin=nil) or (DebugWin.Tag=DEBUG_STOP) )
          then break;
      end;
      dbCancelRange(dsAkt);
      if lProtokol then begin
        writeDebug('    количество записей: '+IntToStr(sl.Count));
        if slSvid.Count>0 then begin
          s:='';
          for j:=0 to slSvid.Count-1 do begin
            s:=s+Trim(copy(slSvid.Strings[j],19,10))+' '+Trim(copy(slSvid.Strings[j],9,10))+', ';
          end;
          s:=Copy(s,1,Length(s)-2);
          writeDebug('    свидетельства ('+IntToStr(slSvid.Count)+'): '+s);
        end;
//        writeDebug(inttostr(i)+'  '+dsDubl.FieldByName('NOMER').AsString+'  '+dsDubl.FieldByName('DATEZ').AsString+' === '+s+' === '+slSvid.CommaText);
      end;
      //--------- удаление ----------------------------------------
      if lRun and (sl.Count>0) then begin
        nAkt:=0;
        for j:=0 to sl.Count-1 do begin
          ss:=sl.Strings[j];
          if ss<>sID then begin
            if dsAkt.Locate('ID',ss,[]) then begin
//              if lProtokol then
//                WriteToDebug('удаление акта '+ss);
              dmBase.DeleteDokument(dsAkt,nType,true);
              nAkt:=nAkt+1;
            end else begin
//              WriteDebug('???????????????????');
            end;
          end;
        end;
        if lProtokol then
          WriteDebug('удалено записей актов '+IntToStr(nAkt));
      end;

    //------------- добавление свид.  ----------------
      if lRun and lSvid and dsAkt.Locate('ID',sID,[]) then begin
        if slSvid.Count>0 then begin
          for j:=0 to slSvid.Count-1 do begin
            d:=STOD(copy(slSvid.Strings[j],1,8),tdClipper);
            s:=Trim(copy(slSvid.Strings[j],9,10));
            ss:=Trim(copy(slSvid.Strings[j],19,10));
            if (nType=_TypeObj_ZRast)
              then lAdd:=true
              else lAdd:=((dsAkt.FieldByName('SVID_NOMER').AsString='') or (dsAkt.FieldByName('SVID_NOMER').AsString<>s));
            if lAdd and not dmBase.SvidPovtor.Locate('SVID_TYPE;AKT_ID;SVID_NOMER;SVID_DATE', VarArrayOf([nType,sID,s,d]), []) then begin
              if lProtokol then
                writeDebug('    добавление свидетельства  '+ss+' '+s+' '+DatePropis(d,3));
              with dmBase.SvidPovtor do begin
                try
                  Append;
                  FieldByName('SVID_TYPE').AsInteger:=nType;
                  FieldByName('AKT_ID').AsString:=sID;
                  FieldByName('SVID_SERIA').AsString:=ss;
                  FieldByName('SVID_NOMER').AsString:=s;
                  FieldByName('SVID_DATE').AsDateTime:=d;
                  Post;
                except
                  Cancel;
                  if lProtokol then
                    writeDebug('ошибка добавления '+ss+' '+s+' '+DatePropis(d,3));
                end;
              end;
            end else begin
             //  writeDebug(['FIND APPEND '+sID+ '   '+ss+' '+s+' '+DatePropis(d,3)]);
            end;
          end;
        end;
      end else begin
      //  WriteToDebug('APPEND ???????????????????');
      end;
      //---------------------------------------------
      dsDubl.Next;
      if lProtokol and ( (DebugWin=nil) or (DebugWin.Tag=DEBUG_STOP) )
        then break;
//      i:=i+1;
    end;
    dbClose(dsDubl);
    dbClose(dsSvid);
    if lProtokol and ( (DebugWin=nil) or (DebugWin.Tag=DEBUG_STOP) )
      then break;  // !!!
  end;
  sl.Free;
  slSvid.Free;
  if lProtokol then
    WriteDebug(#13#10+'ОКОНЧАНИЕ ОБРАБОТКИ  '+FormatDateTime('dd.mm.yyyy hh:nn:ss', Now));
  DebugWin_QueryClose:=false;   // отключить запрос на закрытие откна отладки
//  if DebugWin=nil then
//    Showmessage('EXIT')
//    else Showmessage('ALL RUN');
end;
{$ENDIF}
//-------------------------------------------------------------------------------
function TdmBase.VoenkomFromSOATO(strSOATO: String): Integer;
var
  st:TSostTable;
begin
  Result:=0;
  if (strSOATO<>'') and (Length(strSOATO)>=4) then begin
    strSOATO:=Copy(strSOATO,1,4)+'000000';
    st:=SaveSostTable(sprVoenkom,true,false);
    SprVoenkom.IndexFieldNames:='SOATO';
    if SprVoenkom.FindKey([strSOATO]) then begin
      Result:=SprVoenkom.FieldByName('ID').AsInteger;
    end else begin
      SprVoenkom.IndexFieldNames:='SOATO_RN';
      if SprVoenkom.FindKey([strSOATO]) then begin
        Result:=SprVoenkom.FieldByName('ID').AsInteger;
      end;
    end;
    RestSostTable(sprVoenkom,st);
  end;
end;

//---------------------------------------------------------
function TdmBase.GetNewNomerDok(nTypeObj:Integer; nYear:Integer): Integer;
var
  lFind:Boolean;
  tb:TAdsTable;
  nIDZAGS:Integer;
  fldZags:TField;
  cur:TCursor;
  s:String;
begin
  Result:=0;
  tb:=MainTableFromTypeObj(nTypeObj);
  tb.IndexName := 'KEY_VIEW';
  tb.First;
  fldZags:=tb.FindField('ID_ZAGS');
  nIDZAGS:=GlobalTask.ParamAsInteger('ID');
  cur := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  lFind:=true;
  if (nTypeObj=dmBase.TypeObj_ZBrak) or (nTypeObj=dmBase.TypeObj_ZRogd) or (nTypeObj=dmBase.TypeObj_ZSmert) then begin
    while (fldZags.AsInteger<>nIdZAGS) or (tb.FieldByName('VOSSTAN').AsBoolean=true) do begin
      tb.Next;
      if tb.Eof or (YearOf(tb.FieldByName('DATEZ').AsdateTime)<>nYear) then begin
        lFind:=false;
        break;
      end;
    end;
  end else begin
    while fldZags.AsInteger<>nIdZAGS do begin
      tb.Next;
      if tb.Eof or (YearOf(tb.FieldByName('DATEZ').AsdateTime)<>nYear)  then begin
        lFind:=false;
        break;
      end;
    end;
  end;
  if lFind and not tb.Eof and (fldZags.AsInteger=nIDZags) then begin
    s := tb.FieldByName('NOMER').AsString;
    if s <> '' then begin
      try
        Result:=StrToInt(s)+1;
      except
      end;
    end;
  end;
  Screen.Cursor := cur;
end;
//---------------------------------------------------------------------------------------------
procedure TdmBase.ClearBase;
var
  s:String;
  arr:TArrStrings;
  i:Integer;
  {$IFDEF OCHERED}
  nID:Integer;
  {$ENDIF}

begin
  s := '';
  s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
  s := s + 'После выполнения операции информация в базе будет уничтожена.'#13;
  s := s + 'Если Вы уверены в необходимости проведения операции,'#13;
  s := s + 'введите слово ДА в поле ввода'#13;
  if OkWarning(s) then begin
     OpenMessage('Очистка базы ...');
     try
       AdsConnection.CloseCachedTables;
       CloseBase;
       Application.ProcessMessages;
       Sleep(100);
       Application.ProcessMessages;
       s:=LoadSQLEx(GetNameFileClearBase);
       s:=StringReplace(s,Chr(13),'',[rfReplaceAll, rfIgnoreCase]);
       s:=StringReplace(s,Chr(10),'',[rfReplaceAll, rfIgnoreCase]);
       Application.ProcessMessages;
       if s<>'' then begin
         strToArr(s,arr,';',true);
         AdsConnection.IsConnected:=false;
         AdsSharedConnection.IsConnected:=false;
         s:='';                                         
//         dmBase.AdsConnection.IsConnected:=true;
         try
           for i:=0 to Length(arr)-1 do begin
             AdsConnection.IsConnected:=true;
             AdsConnection.Execute(arr[i]);
             AdsConnection.CloseCachedTables;
//             WorkQuery.SQL.Text:=arr[i];
             s:=arr[i];
//             WorkQuery.ExecSQL;
             AdsConnection.IsConnected:=false;

//             dmBase.WorkQuery.AdsCloseSQLStatement;
//             dmBase.AdsConnection.CloseCachedTables;
             Sleep(100);
             Application.ProcessMessages;
           end;
         except
           on E:Exception do begin
             CloseMessage;
             PutError('Ошибка очистки базы:'+Chr(13)+Chr(10)+E.Message+Chr(13)+Chr(10)+s);
           end;
         end;
         AdsConnection.IsConnected:=false;
         Application.ProcessMessages;
       end;
     finally
       CloseMessage;
     end;
     OpenBase;
     {$IFDEF OCHERED}
       if dmBase.SprNames.Active and dmBase.SprSoato.Active then begin
         nID:=GlobalTask.ParamAsInteger('ID');
         if not dmBase.SprNames.Locate('ID', nID, []) then begin
           dmBase.SprNames.Append;
         end else begin
           dmBase.SprNames.Edit;
         end;
         dmBase.SprSoato.Locate('ID', nID, []);
         with  dmBase.SprNames do begin
           FieldByName('SOATO').AsString   := dmBase.SprSoato.FieldByName('KOD').AsString;
           FieldByName('ID').AsInteger     := nID;
           FieldByName('SHTAMP').AsString  := GlobalTask.ParamAsString('SHTAMP_ZAGS');
           FieldByName('NAME').AsString    := GlobalTask.ParamAsString('NAME');
           FieldByName('NAME_B').AsString  := GlobalTask.ParamAsString('NAME_B');
           FieldByName('KNAME').AsString   := GlobalTask.ParamAsString('KNAME');
           FieldByName('KNAME_B').AsString := GlobalTask.ParamAsString('KNAME_B');
         end;
         dmBase.SprNames.Post;
       end;
     {$ENDIF}
  end;
end;

//--------------------------------------------------------------------------------
function TdmBase.DeclareBrakToAkt(sl:TStringList; strSeriaSvid,strNomerSvid:String; nNomer:Integer; dDateZ:TDateTime; nLenSoato:Integer; nIdRukov,nIdSpec:Integer): Boolean;
var
  st:TSostTable;
  i,j,nIDZags,nID:Integer;
  fld:TField;
  lErr:Boolean;
  sON,sONA,strNewNomer,strNewSeria,strErr:String;
  sDolgRuk,sDolgSpec,sRuk,sSpec,sRukB,sSpecB,sPosh,s:String;
  nSum:Extended;
  SOATO:TSOATO;
begin
  Result:=true;
  nIDZags:=GlobalTask.ParamAsInteger('ID');

  if (nIdRukov>0) and SprDocOfficial.Locate('ID', nIdRukov, []) then begin
    with SprDocOfficial do begin
      sRuk:=FieldByName('FIO').AsString;
      sRukB:=FieldByName('FIO_B').AsString;
      sDolgRuk:=FieldByName('POST').AsString;
    end;
  end else begin
    sRuk  := GlobalTask.ParamAsString('РУК_ЗАГС');
    sRukB := GlobalTask.ParamAsString('РУК_ЗАГС_Б');
    sDolgRuk:=GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
  end;

  if (nIdSpec>0) and SprDocOfficial.Locate('ID', nIdSpec, []) then begin
    with SprDocOfficial do begin
      sSpec := FieldByName('FIO').AsString;
      sSpecB:= FieldByName('FIO_B').AsString;
      sDolgSpec:=FieldByName('POST').AsString;
    end;
  end else begin
    sSpec := GlobalTask.ParamAsString('СПЕЦ_ЗАГС');
    sSpecB:= GlobalTask.ParamAsString('СПЕЦ_ЗАГС_Б');
    sDolgSpec:=GlobalTask.ParamAsString('DOLG_SPEC');
  end;

  sPosh := GlobalTask.ParamAsString('POSHLINA');
  nSum := GlobalTask.ParamAsFloat('SUM_POSHLINA');
//  if strNomerSvid='' then begin
//    strErr:=dmBase.GetNewNomerSvid(TypeObj_ZBrak, tbZapisBrak, strNewNomer, strNewSeria);  // !!!
//  end else begin
  strNewNomer:=strNomerSvid;
  strNewSeria:=strSeriaSvid;
//  end;
  st:=SaveSostTable(tbDeclBrak,false,false);
  for i:=0 to sl.Count-1 do begin
    if tbDeclBrak.Locate('ID', sl.Strings[i], []) then begin
      nID:=tbDeclBrak.FieldByName('ID').AsInteger;
      lErr:=false;
      try
        tbZapisBrak.Append;
        for j:=0 to tbDeclBrak.FieldCount-1 do begin
          fld:=tbZapisBrak.FindField(tbDeclBrak.Fields[j].FieldName);
          if (fld<>nil) and (fld.DataType<>ftAutoinc) and not tbDeclBrak.Fields[j].IsNull then begin
            fld.Value:=tbDeclBrak.Fields[j].Value;
          end;
        end;
        tbZapisBrak.FieldByName('ID_ZAGS').AsInteger:=nIDZags;
        tbZapisBrak.FieldByName('NOMER').AsInteger:=nNomer;
        if dDateZ=0
          then tbZapisBrak.FieldByName('DATEZ').AsDateTime:=tbDeclBrak.FieldByName('DATEB').AsDateTime
          else tbZapisBrak.FieldByName('DATEZ').AsDateTime:=dDateZ;
        tbZapisBrak.FieldByName('DATESV').AsDateTime:=tbZapisBrak.FieldByName('DATEZ').AsDateTime;
        tbZapisBrak.FieldByName('DATEB').AsString:='';

        if tbZapisBrak.FieldByName('SUM_POSHLINA').AsString='' then begin   // если в заявлении сумма пошлины не была заполнена
          if nSum > 0
            then tbZapisBrak.FieldByName('SUM_POSHLINA').AsFloat := nSum;
          tbZapisBrak.FieldByName('POSHLINA').AsString := sPosh;
        end;

        if (strErr='') then begin
          if strNewNomer<>''
            then tbZapisBrak.FieldByName('SVID_NOMER').AsString := strNewNomer;
          tbZapisBrak.FieldByName('SVID_SERIA').AsString := strNewSeria;
        end;

        nNomer:=nNomer+1;
        if strNewNomer<>'' then
          strNewNomer  := PadLInt(StrToInt(strNewNomer)+1,SVID_LEN,'0');

        tbZapisBrak.FieldByName('RUKOV').AsString  := sRuk;
        tbZapisBrak.FieldByName('RUKOV_B').AsString:= sRukB;
        tbZapisBrak.FieldByName('SPEC').AsString   := sSpec;
        tbZapisBrak.FieldByName('SPEC_B').AsString := sSpecB;

        //----------- для заполнения пункта 18.Отметка -----------------
        sON:='';
        sONA:='';

        if Trim(tbDeclBrak.FieldByName('ON_NATION_DOK').AsString)<>'' then
          sON:=tbDeclBrak.FieldByName('ON_NATION_DOK').AsString;

        if Trim(tbDeclBrak.FieldByName('ONA_NATION_DOK').AsString)<>'' then
          sONA:=tbDeclBrak.FieldByName('ONA_NATION_DOK').AsString;

        if (tbDeclBrak.FieldByName('ON_SEM').AsInteger=3) or (tbDeclBrak.FieldByName('ON_SEM').AsInteger=4) then begin
          s:=ReadPropSimpleDok(dmBase.TypeObj_DBrak, nID, STOD('1899-12-30',tdAds), 'ON_SEM_DOK', ftMemo);
          if s<>'' then
            if sON='' then sON:=s else sON:=sON+', '+s;
        end;
        {
        s:=ReadPropSimpleDok(dmBase.TypeObj_DBrak, nID, STOD('1899-12-30',tdAds),'ON_DOK_OTM', ftMemo);
        if s<>'' then
          if sON='' then sON:=s else sON:=sON+', '+s;
        }
        if (tbDeclBrak.FieldByName('ONA_SEM').AsInteger=3) or (tbDeclBrak.FieldByName('ONA_SEM').AsInteger=4) then begin
          s:=ReadPropSimpleDok(dmBase.TypeObj_DBrak, nID, STOD('1899-12-30',tdAds), 'ONA_SEM_DOK', ftMemo);
          if s<>'' then
            if sONA='' then sONA:=s else sONA:=sONA+', '+s;
        end;
        {
        s:=ReadPropSimpleDok(dmBase.TypeObj_DBrak, nID, STOD('1899-12-30',tdAds),'ONA_DOK_OTM', ftMemo);
        if s<>'' then
          if sONA='' then sONA:=s else sONA:=sONA+', '+s;
        }
        if sONA='' then begin
          tbZapisBrak.FieldByName('OTMETKA').AsString:=sON;
        end else begin
          if sON=''
            then tbZapisBrak.FieldByName('OTMETKA').AsString:=sONA
            else tbZapisBrak.FieldByName('OTMETKA').AsString:=sON+Chr(13)+Chr(10)+'#'+sONA;
        end;

        // перепишем поле с XML данными
        tbZapisBrak.FieldByName('SUD_BRAK').AsString:=tbDeclBrak.FieldByName('SUD_BRAK').AsString;

        //----------------------------------------------------------------
        tbZapisBrak.Post;  // для фикскации ID
        tbZapisBrak.Edit;
        sON:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_DBrak, nID, STOD('1899-12-30',tdAds), 'ON_GRAG_ADD', ftMemo);
        if sON<>'' then begin
          dmBase.WritePropSimpleDok(_TypeObj_ZBrak, tbZapisBrak.FieldByName('ID').AsInteger, STOD('1899-12-30',tdAds),
                                     'ON_GRAG_ADD',nil,sON);
        end;
        sONA:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_DBrak, nID, STOD('1899-12-30',tdAds), 'ONA_GRAG_ADD', ftMemo);
        if sONA<>'' then begin
          dmBase.WritePropSimpleDok(_TypeObj_ZBrak, tbZapisBrak.FieldByName('ID').AsInteger, STOD('1899-12-30',tdAds),
                                     'ONA_GRAG_ADD',nil,sONA);
        end;
        dmBase.WritePropSimpleDok(_TypeObj_ZBrak, tbZapisBrak.FieldByName('ID').AsInteger, STOD('1899-12-30',tdAds),
                                     'OTHER',nil,'RUKOV_D='+sDolgRuk+#13#10+'SPEC_D='+sDolgSpec+#13#10);

        SOATO:=dmBase.GetSoatoAkt(tbZapisBrak,
               'ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_B_RN;ON_M_GOROD,ON_M_B_GOROD',true,nLenSoato);
        tbZapisBrak.FieldByName('ON_SOATO').AsString:=SOATO.Kod;

        SOATO:=dmBase.GetSoatoAkt(tbZapisBrak,
               'ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_B_RN;ONA_M_GOROD,ONA_M_B_GOROD',true,nLenSoato);
        tbZapisBrak.FieldByName('ONA_SOATO').AsString:=SOATO.Kod;


        tbZapisBrak.Post;


      except
        on E: Exception do begin
          lErr:=true;
          PutError(E.Message);
        end;
      end;
      if lErr then begin
        tbZapisBrak.Cancel;
      end else begin
        tbDeclBrak.Edit;
        tbDeclBrak.FieldByName('BRAK_ID').AsInteger:=tbZapisBrak.FieldByName('ID').AsInteger;
        tbDeclBrak.FieldByName('OTMETKA_ISP').AsString:=AktToOtm(tbZapisBrak.FieldByName('NOMER').AsString,
                                               tbZapisBrak.FieldByName('DATEZ').AsDateTime);
        tbDeclBrak.Post;
      end;
    end;
  end;
  RestSostTable(tbDeclBrak,st);
end;

//--------------------------------------------------------------------------------
function TdmBase.DeclareRastToAkt(sl:TStringList; strSeriaSvid,strNomerSvid:String; nNomer:Integer; dDateZ:TDateTime; nLenSoato:Integer; nIdRukov,nIdSpec:Integer): Boolean;
{$IFDEF ZAGS}
var
  st:TSostTable;
  i,j,nIDZags:Integer;
  fld:TField;
  lErr:Boolean;
  d:TDateTime;
  sON,sONA,strNewNomer,strNewSeria:String;
  sDolgRuk,sDolgSpec,sRuk,sSpec,sRukB,sSpecB:String;
//  nSum:Extended;
  SOATO:TSOATO;
{$ENDIF}
begin
  Result:=true;
  {$IFDEF ZAGS}
  nIDZags:=GlobalTask.ParamAsInteger('ID');

  if (nIdRukov>0) and SprDocOfficial.Locate('ID', nIdRukov, []) then begin
    with SprDocOfficial do begin
      sRuk:=FieldByName('FIO').AsString;
      sRukB:=FieldByName('FIO_B').AsString;
      sDolgRuk:=FieldByName('POST').AsString;
    end;
  end else begin
    sRuk  := GlobalTask.ParamAsString('РУК_ЗАГС');
    sRukB := GlobalTask.ParamAsString('РУК_ЗАГС_Б');
    sDolgRuk:=GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
  end;

  if (nIdSpec>0) and SprDocOfficial.Locate('ID', nIdSpec, []) then begin
    with SprDocOfficial do begin
      sSpec := FieldByName('FIO').AsString;
      sSpecB:= FieldByName('FIO_B').AsString;
      sDolgSpec:=FieldByName('POST').AsString;
    end;
  end else begin
    sSpec := GlobalTask.ParamAsString('СПЕЦ_ЗАГС');
    sSpecB:= GlobalTask.ParamAsString('СПЕЦ_ЗАГС_Б');
    sDolgSpec:=GlobalTask.ParamAsString('DOLG_SPEC');
  end;

//  sPosh := GlobalTask.ParamAsString('POSHLINA');
//  nSum := GlobalTask.ParamAsFloat('SUM_POSHLINA');
//  if strNomerSvid='' then begin
//    strErr:=dmBase.GetNewNomerSvid(TypeObj_ZBrak, tbZapisBrak, strNewNomer, strNewSeria);  // !!!
//  end else begin
  strNewNomer:=strNomerSvid;
  strNewSeria:=strSeriaSvid;
//  end;
  st:=SaveSostTable(DeclareTermMarriage,false,false);
  for i:=0 to sl.Count-1 do begin
    if DeclareTermMarriage.Locate('ID', sl.Strings[i], []) then begin
      lErr:=false;
      try
        tbZapisRast.Append;
        for j:=0 to DeclareTermMarriage.FieldCount-1 do begin
          fld:=tbZapisRast.FindField(DeclareTermMarriage.Fields[j].FieldName);
          if (fld<>nil) and (fld.DataType<>ftAutoinc) and not DeclareTermMarriage.Fields[j].IsNull then begin
            fld.Value:=DeclareTermMarriage.Fields[j].Value;
          end;
        end;
        tbZapisRast.FieldByName('ID_ZAGS').AsInteger:=nIDZags;
        tbZapisRast.FieldByName('NOMER').AsInteger:=nNomer;
        tbZapisRast.FieldByName('TYPE_RAST').AsString:=DeclareTermMarriage.FieldByName('TYPE_RAST').AsString;
        nNomer:=nNomer+1;
        if dDateZ=0 then begin   // дата записи акта не передана
          if (tbZapisRast.FieldByName('TYPE_RAST').AsString='1') and
              not DeclareTermMarriage.FieldByName('DATEB').IsNull   // по взаимному согласию и дата расторжения не пустая
            then d:=DeclareTermMarriage.FieldByName('DATEB').AsDateTime
            else d:=Date;
        end else begin
          d:=dDateZ;
        end;
        tbZapisRast.FieldByName('DATEZ').AsDateTime:=d;
        if tbZapisRast.FieldByName('TYPE_RAST').AsString='1' then begin  // по взаимному согласию
          WriteDateField(tbZapisRast.FieldByName('SUD_DATE'), DeclareTermMarriage.FieldByName('DATEZ') );
          tbZapisRast.FieldByName('SUD_NAME').AsString:='';
          tbZapisRast.FieldByName('SUD_SILA').AsString:='';
        end else begin
          tbZapisRast.FieldByName('SUD_NAME').AsString:=DeclareTermMarriage.FieldByName('SUD_NAME').AsString;
          WriteDateField(tbZapisRast.FieldByName('SUD_DATE'), DeclareTermMarriage.FieldByName('SUD_DATE') );
          WriteDateField(tbZapisRast.FieldByName('SUD_SILA'), DeclareTermMarriage.FieldByName('SUD_SILA') );
        end;
        if DeclareTermMarriage.FieldByName('ON_SVID').AsBoolean then begin
          tbZapisRast.FieldByName('ON_SVID_DATE').AsDateTime:=tbZapisRast.FieldByName('DATEZ').AsDateTime;
          if strNewNomer<>'' then begin
            tbZapisRast.FieldByName('ON_SVID_SERIA').AsString := strNewSeria;
            tbZapisRast.FieldByName('ON_SVID_NOMER').AsString := strNewNomer;
            strNewNomer  := PadLInt(StrToInt(strNewNomer)+1,SVID_LEN,'0');
          end;
        end;
        if DeclareTermMarriage.FieldByName('ONA_SVID').AsBoolean then begin
          tbZapisRast.FieldByName('ONA_SVID_DATE').AsDateTime:=tbZapisRast.FieldByName('DATEZ').AsDateTime;
          if strNewNomer<>'' then begin
            tbZapisRast.FieldByName('ONA_SVID_SERIA').AsString := strNewSeria;
            tbZapisRast.FieldByName('ONA_SVID_NOMER').AsString := strNewNomer;
            strNewNomer  := PadLInt(StrToInt(strNewNomer)+1,SVID_LEN,'0');
          end;
        end;

        tbZapisRast.FieldByName('RUKOV').AsString := sRuk;
        tbZapisRast.FieldByName('RUKOV_B').AsString := sRukB;
        tbZapisRast.FieldByName('SPEC').AsString := sSpec;
        tbZapisRast.FieldByName('SPEC_B').AsString := sSpecB;
        //----------- для заполнения пункта 18.Отметка -----------------
        sON:=DeclareTermMarriage.FieldByName('ON_NATION_DOK').AsString;
        sONA:=DeclareTermMarriage.FieldByName('ONA_NATION_DOK').AsString;
        if sONA=''
          then tbZapisRast.FieldByName('OTMETKA').AsString:=sON+'#'
          else tbZapisRast.FieldByName('OTMETKA').AsString:=sON+Chr(13)+Chr(10)+'#'+sONA;
        //----------------------------------------------------------------

        SOATO:=dmBase.GetSoatoAkt(tbZapisRast,
               'ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_B_RN;ON_M_GOROD,ON_M_B_GOROD',true,nLenSoato);
        tbZapisRast.FieldByName('ON_SOATO').AsString:=SOATO.Kod;

        SOATO:=dmBase.GetSoatoAkt(tbZapisRast,
               'ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_B_RN;ONA_M_GOROD,ONA_M_B_GOROD',true,nLenSoato);
        tbZapisRast.FieldByName('ONA_SOATO').AsString:=SOATO.Kod;

        tbZapisRast.Post;

        dmBase.WritePropSimpleDok(_TypeObj_ZRast, tbZapisRast.FieldByName('ID').AsInteger, STOD('1899-12-30',tdAds),
                                     'OTHER',nil,'RUKOV_D='+sDolgRuk+#13#10+'SPEC_D='+sDolgSpec+#13#10);
      except
        on E: Exception do begin
          lErr:=true;
          PutError(E.Message);
        end;
      end;
      if lErr then begin
        tbZapisRast.Cancel;
      end else begin
        DeclareTermMarriage.Edit;
        DeclareTermMarriage.FieldByName('RAST_ID').AsInteger:=tbZapisRast.FieldByName('ID').AsInteger;
        DeclareTermMarriage.FieldByName('OTMETKA_ISP').AsString:=AktToOtm(tbZapisRast.FieldByName('NOMER').AsString,
                                                      tbZapisRast.FieldByName('DATEZ').AsDateTime);
        DeclareTermMarriage.Post;
      end;
    end;
  end;
  RestSostTable(DeclareTermMarriage,st);
  {$ENDIF}
end;
function TdmBase.TypeObj_UZRogd: Integer;
begin
  Result:=_TypeObj_UZRogd;
end;

{$IFDEF ZAGS}

//-------------------------------------------------------------------------------------------------
function TdmBase.ZapisToAlfavit(nTypeObj : Integer; tb : TDataSet; lNew:Boolean):Boolean;
begin
//  FOR_SEEK=AKT_TYPE;YEARZ;MONTHZ;DAYZ;NOMER
//  FOR_AKT=AKT_TYPE;AKT_ID    !!! создать индекс !!!
  Result:=false;
  LastError := '';

end;
//-------------------------------------------------------------------------------------------------
procedure TdmBase.Alfavit_AppendRecordForAll(nTypeObj : Integer;  tb : TDataSet; lAppend : Boolean);
var
  fld : TField;
begin
  if lAppend
    then AlfavitZAGS.Append
    else AlfavitZAGS.Edit;
  with AlfavitZAGS do begin
    FieldByName('HANDLED').AsBoolean  := false;
    FieldByName('AKT_TYPE').AsInteger := nTypeObj;
    FieldByName('AKT_ID').AsInteger   := tb.FieldByName('ID').AsInteger;
    FieldByName('AKT_DATEIZM').AsDateTime := tb.FieldByName('DATEIZM').AsDateTime;
    FieldByName('ID_SOURCE').AsInteger:= tb.FieldByName('ID_SOURCE').AsInteger;
    FieldByName('NOMER').AsString     := tb.FieldByName('NOMER').AsString;

    FieldByName('YEARZ').AsString    := FormatDateTime('YYYY',tb.FieldByName('DATEZ').AsDateTime);
    FieldByName('MONTHZ').AsString   := FormatDateTime('MM',tb.FieldByName('DATEZ').AsDateTime);
    FieldByName('DAYZ').AsString     := FormatDateTime('DD',tb.FieldByName('DATEZ').AsDateTime);

    FieldByName('ID_ZAGS').AsInteger := tb.FieldByName('ID_ZAGS').AsInteger;
    FieldByName('NAME_ZAGS').AsString:= tb.FieldByName('NAME_ZAGS').AsString;
    FieldByName('PODR').AsString     := tb.FieldByName('PODR').AsString;
    fld := tb.FindField('VOSSTAN');
    if fld=nil then begin
      FieldByName('VOSSTAN').AsBoolean := false;
    end else begin
      FieldByName('VOSSTAN').AsBoolean := fld.AsBoolean;
    end;
  end;

end;

//----------------------------------------------------------------
procedure TdmBase.Alfavit_WriteHistory(nTypeObj:Integer; tb:TDataSet; hist:TDataSet; arr:array of TVarRec);
//var
//  i:Integer;
//  sName:String;
begin
  if hist<>nil then begin
    if hist.RecordCount>0 then begin
    {
      for i:=Low(arr) to High(arr) do begin
        try
          hist.Filter:='fieldname='+''''+String(arr[i].VAnsiString)+'''';
          hist.Filtered:=true;
          while not hist.eof do begin
            Alfavit_AppendRecordForAll(nTypeObj,tb,true);

            hist.Next;
          end;
        finally
          hist.Filtered:=false;
          hist.Filter:='';
        end;
      end;
    }
    end;
  end;
end;

//----------------------------------------------------------------
procedure TdmBase.Alfavit_LoadRecord_ZAdopt(tb: TDataSet; hist:TDataSet);
begin
  Alfavit_AppendRecordForAll(dmBase.TypeObj_ZAdopt,tb);
  with AlfavitZAGS do begin
    FieldByName('FAMILIA').AsString   := tb.FieldByName('FAMILIADO').AsString;
    FieldByName('NAME').AsString      := tb.FieldByName('NAMEDO').AsString;
    FieldByName('OTCH').AsString      := tb.FieldByName('OTCHDO').AsString;
    FieldByName('POL').AsString       := tb.FieldByName('POL').AsString;
    Post;
    if (tb.FieldByName('FAMILIADO').AsString<>tb.FieldByName('FAMILIAPOSLE').AsString) or
       (tb.FieldByName('NAMEDO').AsString<>tb.FieldByName('NAMEPOSLE').AsString) or
       (tb.FieldByName('OTCHDO').AsString<>tb.FieldByName('OTCHPOSLE').AsString) then begin
      Alfavit_AppendRecordForAll(dmBase.TypeObj_ZAdopt, tb);
      FieldByName('FAMILIA').AsString   := tb.FieldByName('FAMILIAPOSLE').AsString;
      FieldByName('NAME').AsString      := tb.FieldByName('NAMEPOSLE').AsString;
      FieldByName('OTCH').AsString      := tb.FieldByName('OTCHPOSLE').AsString;
      FieldByName('POL').AsString       := tb.FieldByName('POL').AsString;
      Post;
    end;
  end;
end;

procedure TdmBase.Alfavit_LoadRecord_ZChName(tb: TDataSet; hist:TDataSet);
begin
  Alfavit_AppendRecordForAll(dmBase.TypeObj_ZChName,tb);
  with AlfavitZAGS do begin
    FieldByName('FAMILIA').AsString   := Trim(tb.FieldByName('FAMILIADO').AsString);
    FieldByName('NAME').AsString      := tb.FieldByName('NAMEDO').AsString;
    FieldByName('OTCH').AsString      := tb.FieldByName('OTCHDO').AsString;
    FieldByName('POL').AsString       := tb.FieldByName('POL').AsString;
    Post;
    if (tb.FieldByName('FAMILIADO').AsString<>tb.FieldByName('FAMILIAPOSLE').AsString) or
       (tb.FieldByName('NAMEDO').AsString<>tb.FieldByName('NAMEPOSLE').AsString) or
       (tb.FieldByName('OTCHDO').AsString<>tb.FieldByName('OTCHPOSLE').AsString) then begin
      Alfavit_AppendRecordForAll(dmBase.TypeObj_ZChName,tb);
      FieldByName('FAMILIA').AsString   := Trim(tb.FieldByName('FAMILIAPOSLE').AsString);
      FieldByName('NAME').AsString      := tb.FieldByName('NAMEPOSLE').AsString;
      FieldByName('OTCH').AsString      := tb.FieldByName('OTCHPOSLE').AsString;
      FieldByName('POL').AsString       := tb.FieldByName('POL').AsString;
      Post;
    end;
  end;
end;

procedure TdmBase.Alfavit_LoadRecord_ZUstOtc(tb: TDataSet; hist:TDataSet);
begin
  Alfavit_AppendRecordForAll(dmBase.TypeObj_ZUstOtc,tb);
  with AlfavitZAGS do begin
    FieldByName('FAMILIA').AsString   := Trim(tb.FieldByName('FAMILIADO').AsString);
    FieldByName('NAME').AsString      := tb.FieldByName('NAMEDO').AsString;
    FieldByName('OTCH').AsString      := tb.FieldByName('OTCHDO').AsString;
    FieldByName('POL').AsString       := tb.FieldByName('POL').AsString;
    Post;
    if (tb.FieldByName('FAMILIADO').AsString<>tb.FieldByName('FAMILIAPOSLE').AsString) or
       (tb.FieldByName('NAMEDO').AsString<>tb.FieldByName('NAMEPOSLE').AsString) or
       (tb.FieldByName('OTCHDO').AsString<>tb.FieldByName('OTCHPOSLE').AsString) then begin
      Alfavit_AppendRecordForAll(dmBase.TypeObj_ZUstOtc,tb);
      FieldByName('FAMILIA').AsString   := Trim(tb.FieldByName('FAMILIAPOSLE').AsString);
      FieldByName('NAME').AsString      := tb.FieldByName('NAMEPOSLE').AsString;
      FieldByName('OTCH').AsString      := tb.FieldByName('OTCHPOSLE').AsString;
      FieldByName('POL').AsString       := tb.FieldByName('POL').AsString;
      Post;
    end;
  end;
end;

procedure TdmBase.Alfavit_LoadRecord_ZUstMat(tb: TDataSet; hist:TDataSet);
begin
  Alfavit_AppendRecordForAll(dmBase.TypeObj_ZUstMat,tb);
  with AlfavitZAGS do begin
    FieldByName('FAMILIA').AsString   := Trim(tb.FieldByName('FAMILIADO').AsString);
    FieldByName('NAME').AsString      := tb.FieldByName('NAMEDO').AsString;
    FieldByName('OTCH').AsString      := tb.FieldByName('OTCHDO').AsString;
    FieldByName('POL').AsString       := tb.FieldByName('POL').AsString;
    Post;
    if (tb.FieldByName('FAMILIADO').AsString<>tb.FieldByName('FAMILIAPOSLE').AsString) or
       (tb.FieldByName('NAMEDO').AsString<>tb.FieldByName('NAMEPOSLE').AsString) or
       (tb.FieldByName('OTCHDO').AsString<>tb.FieldByName('OTCHPOSLE').AsString) then begin
      Alfavit_AppendRecordForAll(dmBase.TypeObj_ZUstMat,tb);
      FieldByName('FAMILIA').AsString   := Trim(tb.FieldByName('FAMILIAPOSLE').AsString);
      FieldByName('NAME').AsString      := tb.FieldByName('NAMEPOSLE').AsString;
      FieldByName('OTCH').AsString      := tb.FieldByName('OTCHPOSLE').AsString;
      FieldByName('POL').AsString       := tb.FieldByName('POL').AsString;
      Post;
    end;
  end;
end;

procedure TdmBase.Alfavit_LoadRecord_ZRogd(tb: TDataSet; hist:TDataSet);
begin
  Alfavit_AppendRecordForAll(dmBase.TypeObj_ZRogd,tb);
  with AlfavitZAGS do begin
    FieldByName('FAMILIA').AsString   := Trim(tb.FieldByName('FAMILIA').AsString);
    FieldByName('NAME').AsString      := tb.FieldByName('NAME').AsString;
    FieldByName('OTCH').AsString      := tb.FieldByName('OTCH').AsString;
    FieldByName('POL').AsString       := tb.FieldByName('POL').AsString;
    Post;
  end;
end;

procedure TdmBase.Alfavit_LoadRecord_ZSmert(tb: TDataSet; hist:TDataSet);
begin
  Alfavit_AppendRecordForAll(dmBase.TypeObj_ZSmert,tb);
  with AlfavitZAGS do begin
    FieldByName('FAMILIA').AsString   := Trim(tb.FieldByName('FAMILIA').AsString);
    FieldByName('NAME').AsString      := tb.FieldByName('NAME').AsString;
    FieldByName('OTCH').AsString      := tb.FieldByName('OTCH').AsString;
    FieldByName('POL').AsString       := tb.FieldByName('POL').AsString;
    Post;
  end;
end;

procedure TdmBase.Alfavit_LoadRecord_ZBrak( tb : TDataSet; hist:TDataSet );
begin
  Alfavit_AppendRecordForAll(dmBase.TypeObj_ZBrak,tb);
  with AlfavitZAGS do begin
    FieldByName('FAMILIA').AsString   := Trim(tb.FieldByName('ON_FAMILIA').AsString);
    FieldByName('NAME').AsString      := tb.FieldByName('ON_NAME').AsString;
    FieldByName('OTCH').AsString      := tb.FieldByName('ON_OTCH').AsString;
    FieldByName('POL').AsString       := 'М';
    Post;
    if tb.FieldByName('ON_FAMILIA').AsString<>tb.FieldByName('ON_FAMILIAP').AsString then begin
      Alfavit_AppendRecordForAll(dmBase.TypeObj_ZBrak,tb);
      FieldByName('FAMILIA').AsString   := Trim(tb.FieldByName('ON_FAMILIAP').AsString);
      FieldByName('NAME').AsString      := tb.FieldByName('ON_NAME').AsString;
      FieldByName('OTCH').AsString      := tb.FieldByName('ON_OTCH').AsString;
      FieldByName('POL').AsString       := 'М';
      Post;
    end;
    Alfavit_AppendRecordForAll(dmBase.TypeObj_ZBrak,tb);
    FieldByName('FAMILIA').AsString   := Trim(tb.FieldByName('ONA_FAMILIA').AsString);
    FieldByName('NAME').AsString      := tb.FieldByName('ONA_NAME').AsString;
    FieldByName('OTCH').AsString      := tb.FieldByName('ONA_OTCH').AsString;
    FieldByName('POL').AsString       := 'Ж';
    Post;
    if tb.FieldByName('ONA_FAMILIA').AsString<>tb.FieldByName('ONA_FAMILIAP').AsString then begin
      Alfavit_AppendRecordForAll(dmBase.TypeObj_ZBrak,tb);
      FieldByName('FAMILIA').AsString   := Trim(tb.FieldByName('ONA_FAMILIAP').AsString);
      FieldByName('NAME').AsString      := tb.FieldByName('ONA_NAME').AsString;
      FieldByName('OTCH').AsString      := tb.FieldByName('ONA_OTCH').AsString;
      FieldByName('POL').AsString       := 'Ж';
      Post;
    end;
  end;
end;

procedure TdmBase.Alfavit_LoadRecord_RBrak( tb : TDataSet; hist:TDataSet );
begin
  Alfavit_AppendRecordForAll(dmBase.TypeObj_ZRast,tb);
  with AlfavitZAGS do begin
    FieldByName('FAMILIA').AsString   := Trim(tb.FieldByName('ON_FAMILIA').AsString);
    FieldByName('NAME').AsString      := tb.FieldByName('ON_NAME').AsString;
    FieldByName('OTCH').AsString      := tb.FieldByName('ON_OTCH').AsString;
    FieldByName('POL').AsString       := 'М';
    Post;
    if tb.FieldByName('ON_FAMILIA').AsString<>tb.FieldByName('ON_FAMILIAP').AsString then begin
      Alfavit_AppendRecordForAll(dmBase.TypeObj_ZRast,tb);
      FieldByName('FAMILIA').AsString   := Trim(tb.FieldByName('ON_FAMILIAP').AsString);
      FieldByName('NAME').AsString      := tb.FieldByName('ON_NAME').AsString;
      FieldByName('OTCH').AsString      := tb.FieldByName('ON_OTCH').AsString;
      FieldByName('POL').AsString       := 'М';
      Post;
    end;
    Alfavit_AppendRecordForAll(dmBase.TypeObj_ZRast,tb);
    FieldByName('FAMILIA').AsString   := Trim(tb.FieldByName('ONA_FAMILIA').AsString);
    FieldByName('NAME').AsString      := tb.FieldByName('ONA_NAME').AsString;
    FieldByName('OTCH').AsString      := tb.FieldByName('ONA_OTCH').AsString;
    FieldByName('POL').AsString       := 'Ж';
    Post;
    if tb.FieldByName('ONA_FAMILIA').AsString<>tb.FieldByName('ONA_FAMILIAP').AsString then begin
      Alfavit_AppendRecordForAll(dmBase.TypeObj_ZRast,tb);
      FieldByName('FAMILIA').AsString   := Trim(tb.FieldByName('ONA_FAMILIAP').AsString);
      FieldByName('NAME').AsString      := tb.FieldByName('ONA_NAME').AsString;
      FieldByName('OTCH').AsString      := tb.FieldByName('ONA_OTCH').AsString;
      FieldByName('POL').AsString       := 'Ж';
      Post;
    end;
  end;
end;

{$ENDIF}


//---------------------------------------
function TdmBase.CheckSprAdmProc(sType:String):Boolean;
var
  s,ss:String;
begin
  Result:=true;
  s:='DELETE FROM sprdocadmproc WHERE ID NOT IN (SELECT ID FROM SysSpr.sprdocadmproc);'#13#10+
     'UPDATE sprdocadmproc '#13#10+
     'SET sprdocadmproc.HI_CODE=n.HI_CODE, sprdocadmproc.PARENT_ID=n.PARENT_ID, sprdocadmproc.IS_NODE=n.IS_NODE, '#13#10+
     '  sprdocadmproc.HI_LEVEL=n.HI_LEVEL, sprdocadmproc.PROC_NO=n.PROC_NO, '#13#10+
     '  sprdocadmproc.NAME=n.NAME, sprdocadmproc.FULL_NAME=n.FULL_NAME, '#13#10+
     '  sprdocadmproc.NEED_REQ=n.NEED_REQ ,sprdocadmproc.PROC_RES=n.PROC_RES, sprdocadmproc.EXCL_DATE=n.EXCL_DATE '#13#10+
     'FROM sprdocadmproc INNER JOIN SysSpr.sprdocadmproc n ON sprdocadmproc.ID=n.ID;'#13#10+
     'INSERT INTO sprdocadmproc select * from SysSpr.sprdocadmproc WHERE ID NOT IN (SELECT ID FROM sprdocadmproc);';
  ss:='';
  if sType='U' then begin
    s:=StringReplace(s,'sprdocadmproc','sprdocadmprocU',[rfReplaceAll, rfIgnoreCase]);
    ss:='для юр.лиц';
  end;
  OpenMessage('Обновление административных процедур'+ss+' ...');
  try
    MemoWrite('last.sql',s);
    AdsConnection.Execute(s);
  except
    on E: Exception do begin
      CloseMessage;
      Result:=false;
      PutError('ОШИБКА:'+E.Message);
    end;
  end;
  if Result then CloseMessage;
end;
//---------------------------------------
function TdmBase.CheckSprTematic(sType:String):Boolean;
var
  s:String;
  dDate,dDateSys:TDateTime;
begin     
  Result:=true;
  OpenMessage('Обновление тематик обращений граждан ...');
  dDate:=0;
  dDateSys:=0;
  try
    WorkQuery.SQL.Text:='SELECT max(dateizm) from SprDocSubjG WHERE handled=false';
    WorkQuery.Open;
    dDate:=WorkQuery.Fields[0].AsDateTime;
    WorkQuery.Close;

    WorkQueryS.SQL.Text:='SELECT max(dateizm) from SprDocSubj where handled=false';
    WorkQueryS.Open;
    dDateSys:=WorkQueryS.Fields[0].AsDateTime;
    WorkQueryS.Close;
  except                                  
    on E: Exception do begin
      CloseMessage;
      Result:=false;
      PutError('ОШИБКА:'+E.Message);
    end;
  end;
  if Result and ((dDateSys > dDate) or (sType='1')) then begin
    try
      s:='DELETE FROM sprDocSubjG WHERE handled=false;'#13#10+
         'TRY'#13#10+
         '  DROP TABLE #tmp;'#13#10+
         'CATCH ALL'#13#10+
         'END TRY;'#13#10+
         'SELECT code as cur_code INTO #tmp FROM sprDocSubjG;'#13#10+
         'INSERT INTO sprDocSubjG SELECT * FROM sysspr.sprDocSubj WHERE handled=false and code not in (select cur_code from #tmp);';
//      s:='DELETE FROM sprDocSubjG WHERE handled=false;'#13#10+
//         'INSERT INTO sprDocSubjG SELECT * FROM sysspr.sprDocSubj WHERE handled=false;'#13#10;
      AdsConnection.Execute(s);
    except
      on E: Exception do begin
        CloseMessage;
        Result:=false;
        PutError('ОШИБКА:'+E.Message);
      end;
    end;
  end;
  if Result then CloseMessage;
end;

function TdmBase.GetVersionZAH(lLoad : Boolean) : String;
var
  s : String;
  i : Integer;
begin
//  Result := '2';
  WorkQuery.Close;
  WorkQuery.SQL.Clear;
  WorkQuery.SQL.Add('SELECT comment FROM '+SysQuery('system.dictionary'));
  try
    WorkQuery.Open;
    s := ANSILowerCase(Trim(WorkQuery.Fields[0].AsString));
    i := Pos('{zah',s);
    if i>0 then begin
      s:=Trim(Copy(s,i+4,20));
      i:=Pos('}',s);
      if i>0 then begin
        s := Copy(s,1,i-1);
        Result := Trim(s);
      end;
    end;
  except
    on E:Exception do begin
      Result := '1';
    end;
  end;
  WorkQuery.Close;
end;


function TdmBase.GetTypeZah: Integer;
begin
  Result := 0;
end;

end.




