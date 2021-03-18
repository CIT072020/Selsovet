// �����
unit dBase;

interface

{$I Task.inc}

{$WARN UNIT_PLATFORM OFF}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ShellAPI, ace,uCheckKod,
  DataTask, adsset, adstable, Db, adsdata, adsfunc, adscnnct, Metatask, OpisEdit, uFindBase, frxClass, frxADSComponents,
  dbFunc, FuncPr, kbmMemTable, SasaIniFile, FileCtrl, adsdictionary, adsUtils, StrUtils, uProjectAll,
  {$IFDEF OBR_GRAG}  mDoc2Sel, {$ENDIF}
  {$IFDEF GISUN} uGisun, {$ENDIF}
  ifpii_dbfunc, uUtilFiles, uPadegFIO, uProject,fmChList, ZipForge, math, DateUtils, uTypes
 {$IFDEF VER150} ,Variants {$ENDIF}  ;


//const

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
    Komm     : String;
    Prich    : String;
    PrichKod : Integer;
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
    LookUpSoatoSovet: TAdsTable;
    SprStran: TAdsTable;
    SprNac: TAdsTable;
    SprTypeUl: TAdsTable;
    SprUL: TAdsTable;
    tbAllDokums: TAdsTable;
    SprWork: TAdsTable;
    SprDolg: TAdsTable;
    tbDelObj: TAdsTable;
    tbZapisOpeka: TAdsTable;
    LookupObl: TAdsTable;
    SvidSeria: TAdsTable;
    LookupRN: TAdsTable;
    LookupGorod: TAdsTable;
    LookupRnGor: TAdsTable;
    TypePunkt: TAdsTable;
    SprTypeDok: TAdsTable;
    SprVoenkom: TAdsTable;
    LookUpPunkt: TAdsQuery;
    LookupUL: TAdsQuery;
    SprRovd: TAdsTable;
    LockTypeObj: TAdsTable;
    WorkQueryS: TAdsQuery;
    tbAdres: TAdsTable;
    tbMens: TAdsTable;
    tbLich: TAdsTable;
    SprNames: TAdsTable;
    SprPunkt: TAdsTable;
    SprPerevod: TAdsTable;
    SprOtnosh: TAdsTable;
    SprUchZaved: TAdsTable;
    SprInternat: TAdsTable;
    SprChildPrich: TAdsTable;
    tbUpdObj: TAdsTable;
  private
    FLastDvigMen : TLastDvig;
    FCurDate : TDateTime;
    FMainBase:Integer;
    FDistributeBase:Boolean;
    FIdBase:Integer;
    FCountZnack:Integer;
  public
    //----- ��������� ������� ------------
      //�������
      DocMain: TAdsTable;
      DocLink: TAdsTable;
      DocWork: TAdsTable;
      DocFile: TAdsTable;
      //�����������
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

    // �������������� ������� ����������� �������
    SprGragd     : TAdsTable;
    SprFamily     : TAdsTable;

//    SprGES       : TAdsTable;
//    SprZAGS       : TAdsTable;

    SprNamesM    : TAdsTable;
    SprNamesG    : TAdsTable;
//    SprDokLic    : TAdsTable;
//    SprIzbUch    : TAdsTable;
//    SprIzbUch2   : TAdsTable;
//    SprKomiss    : TAdsTable;
    SprOsobOtm   : TAdsTable;
//    SprPropHouse : TAdsTable;
//    SprPerevod   : TAdsTable;
    SprAddBuild  : TAdsTable;
    ListP        : TAdsTable;

    ListSvid     : TAdsTable;

    tbSimpleProp : TAdsTable;
    tbSimplePropMemo : TAdsTable;
//    tbPasportViza : TAdsTable;
//    tbDokuments   : TAdsTable;
//    SprOwners     : TAdsTable;
//    tbHouseProps  : TAdsTable;
//    tbHouseOwners : TAdsTable;
//    tbHouseOwnersHist : TAdsTable;


    {$IFDEF OCHERED}
// !!!     SprGSK : TAdsTable;
    {$ENDIF}
    AteSys : TAdsTable;
    {$IFDEF GISUN}
      AllSprGISUN : TAdsTable;
      Log : TAdsTable;
    {$ENDIF}

    SprSklon      : TAdsTable;
    SprRodsName   : TAdsTable;
    RunSpr        : TAdsTable;
    RunSprUser    : TAdsTable;

    Shablon       : TAdsTable;
    tbHistoryZAGS : TAdsTable;

    {$IFDEF GISUN}
      MessageGISUN : TAdsTable;
    {$ENDIF}

    ArrHouseProp : TArrValuesProp;
    HouseProp_ID       : Integer;
    HouseProp_DateFiks : TDateTime;

    FLastAdresUpper:Boolean;
    FSeekID : Integer;

    Adres_Strana:String;
    Adres_Obl : String;
    Adres_Raion : String;
    Adres_PunktKod: Integer;  // ��� ���. ������
    Adres_PunktTN: String;   // ������������ ���� ��� ������
    Adres_PunktTK: Integer;  // ��� ���� ��� ������
    Adres_PunktN: String;    // ������������ ��� ���� ��� ������
    Adres_Punkt : String;    // ������������ � ����� ���. ������
    Adres_IsGorod : Boolean;
    Adres_Gorod : String;
    Adres_Selo  : String;
    Adres_UL    : String;
    Adres_UlKod : Integer;
    Adres_TypeUlKod : Integer;   // ��� ���� �����
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

    LastErrorDelete : String;  // ��������� ������ ��������� ��� �������� ���������

    SprMainBase : TStringList; // ����������� ������� ����
    function EnableEditSpr(strName : String) : Boolean;

    function CheckDeleteMen(DateFiks : TDateTime; nId : Integer; var strErr : String; strFIO:String) : Boolean;
    function DeleteFromBaseFilter:Boolean;
    function DeletePunkt(v : Variant; Conn:TAdsConnection; lFromSpr:Boolean; lDelFreeMen:Boolean) : Boolean;
    //----------- ��� ������� -----------
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

    function DeletePropSimpleDok(strID : String; nTypeDok : Integer) : Boolean;
//------------------------------------------------------------------------
   function ReadPropSimpleDok(nTypeObj : Integer; nKodObj : Integer; DateSave : TDateTime; strKodProp : String; ft : TFieldType ) : Variant;
   function WritePropSimpleDok(nTypeObj : Integer; nKodObj: Integer; DateSave: TDateTime; strKodProp : String; fld : TField; sVal:String=''): Boolean;
   function ErasePropSimpleDok(nTypeObj : Integer; nKodObj: Integer; strKodProp : String): Boolean;
//------------------------------------------------------------------------

    function GetDateCurrentSost : TDateTime;
//    function HouseOwners2(DateFiks: TDateTime; strIdAdres: String; nType : Integer; tbOwners:TDataSet) : String;
    function HouseOwners_old(DateFiks:TDateTime; strIdAdres:String; obj:TObject; nType:Integer) : String;
    function HouseOwners(DateFiks : TDateTime; strIdAdres : String; obj : TObject; nType : Integer; tbOwnersExternal:TDataSet; tbMens:TDataSet; slPar:TStringList) : String;

    function NameTableFromTypeObj(nTypeObj: Integer):String;

    function GetMenPasp(DateFiks: TDateTime; strID: String; nType:Integer): String;
    function GetMenPaspV(UdostKod:Integer; Seria,Nomer,Organ,LichNomer : String;  DateV : TDateTime; nType:Integer): String;

    procedure SaveGlobalAdres;
    procedure RestGlobalAdres;
    function GlobalAdresToRec:TAdres;
    procedure RecAdresToGlobal(adr:TAdres);
    procedure ClearGlobalAdres;
    function AdresFromID(DateFiks : TDateTime; strID : String; lNameIsNotDom:Boolean=true) : String;
    function AdresFromIDEx(DateFiks : TDateTime; strID : String; lNameIsNotDom:Boolean; lOnlyText:Boolean) : String;
//    function AdresLic(DateFiks : TDateTime; strID : String ) : TAdres;
    function AdresFromMensAdd(strID:String; var adr :TAdres; ds:TDataSet):Boolean;
    function SimpleAdresMen(strID: String; sType:String): String;
    function AdresMen(DateFiks : TDateTime; strID : String; var strName : String; lSet:Boolean=false; lCheckAdresPropis:Boolean=false ) : TAdres;
//    function AdresPropisMen(DateFiks: TDateTime; strID: String): String;
    function AdresPropisFromAdres(adr:TAdres; lAll:Boolean):String;
    function GetTailAdres(strType: String): String;  // ����� �������� ����� AdresPropisMen

    function getMenWork(DateFiks : TDateTime; strID : String) : String;
    function getMenDolg(DateFiks : TDateTime; strID : String) : String;
    function getMenStud(DateFiks : TDateTime; strID : String) : String;
    function getMenDvig(DateFiks : TDateTime; strID : String; strRazd:String) : String;

    function SostavSemToStr(strID: String; strType:String; strRazd:String) : String;
    function GetReshOch(nIDResh:Integer): TReshOchMen;
    function FillReshOch(resh:TReshOchMen; nIDResh:Integer): Boolean;
    function GetReshOch_(resh:TReshOchMen; nIDResh:Integer): Boolean;
    function GetLastReshOch(resh:TReshOchMen; nID:Integer; nOch:Integer; dDate:TDateTime): Boolean;
    function GetRealNomerOch(nBase:Integer; nTypeOchered:Integer; nID:Integer):Integer;
    function GetRealNomerOchEx(nBase:Integer; nTypeOchered:Integer; nID:Integer; dDecDate:TDateTime; dDecTime:TDateTime; nSimple:Integer; nOldNomer:Integer):Integer;

    function GetCountDeti(strID:String; strPol:String; Vozr1,Vozr2:Integer; lOnlyLic:Boolean; lNotPasport:Boolean):Integer;
    function GetDeti(dsDeti:TDataSet; strID:String; strPol:String; Vozr1,Vozr2:Integer; lOnlyLic:Boolean; lNotPasport:Boolean; nTypeAktRogd:Integer=0):Boolean;

    // ������� ������������ ������
    function CreateNameRaion( strRaion,strPadeg : String) : String;
    // ������� ������������ ������� �� ���� ������� � ������������
    function CreateNameObl(fldB, fldN : TField; strLang : String): String;
    function NameObl(strName : String; nType : Integer; strLang : String) : String;
    function IsAddTypeObl(strName : String) : Boolean;

    // ������� ����� �������� ��������(nTypeMest=0) ��� ������ ������(nTypeMest=1) �� ������� ������������ ��� �� ��������
    function GetMestoMen(nTypeMest:Integer; strID : String; lFull : Boolean; nOrder : Integer; dsMigr:TDataSet): String;
    function GetMestoFromFields(ds:TDataSet; strFields:String; lFull:Boolean;nOrder:Integer):String;
    function GetMestoFromFieldsEx(ds:TDataSet; strFields:String):TAdres;

    function getGrag(strSeek:String): String;
    function getNation(strSeek:String;strField:String): String;

    function CheckWriteOtkudaPrib(ds:TDataSet):Boolean;

    function IsAdsSys(strUser:String) : Boolean;

    function AdresOwner(DateFiks : TDateTime; strID : String; nType : Integer; var strName : String; var lPropis : Boolean) : String;

    function GetNamePasport(n : Integer; sLang:String='R') : String;
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

    function DeclareBrakToAkt(sl:TStringList; strSeriaSvid,strNomerSvid:String; nNomer:Integer; dDateZ:TDateTime; nLenSoato:Integer):Boolean;  // ��������� � ����� � �/�
    function DeclareRastToAkt(sl:TStringList; strSeriaSvid,strNomerSvid:String; nNomer:Integer; dDateZ:TDateTime; nLenSoato:Integer): Boolean;

    function TypeObjForMens(TypeObj:Integer):Boolean;
    function LastSvidPovtor(nTypeDok:Integer; strID:Integer; strFormat:String) : String;

    function CheckSprOtnosh(strName:String):Integer;
    function GetOtnoshMen(nID:Integer):String;
              
    function CheckRunMen(nTypeObj:Integer; nType:Integer; nID:Integer; var recID:TID; lSaveSost:Boolean=false): Boolean;

    function CheckSprAdmProc(sType:String):Boolean;
    procedure Event_CheckStringFilter(var sFilter:String);   // �������� �������� FILTER � OpisEdit  !!!

    function GetTypePunkt( strType : String; strLF : String; var strName : String ) : Integer;

    function LgotMen(dsLgot:TDataSet; DateFiks:TDateTime; strID:String; strDelim:String): String;  //������ ��������

    function getUL( ds : TDataSet ) : String; overload;
    function getUL( nKod : Integer) : String; overload;
    function getDom( ds : TDataSet; lNameIsNotDom:Boolean ) : String;  overload;
    function getDom( strDom, strKorp, strKv, strNameHouse : String; lNotDom:Boolean) : String; overload;

//    function GetDateDelo(nType:Integer; nDelo:Integer; var dBegin:TDateTime; var dEnd:TDateTime; var sText:String):Integer;

    function  CreateSeekAdres(DateFiks: TDateTime; nPunkt:Integer; strUL: String; strDom:String; strKorp:String; strKv: String):String;
    function FindAdres(DateFiks : TDateTime; nPunkt, nUL : Integer; strDom, strKorp, strKv : String; nID : Integer=-1) : Boolean;
    function TipBigHouseFromAdres(DateFiks: TDateTime; nPunkt, nUL: Integer; strDom, strKorp, strKv: String; var ID:Integer): Integer;
    function GetFindAdresID:Integer;
    // ������� �������� ���� �� ���� �������
    function InitHouseProp(DateFiks : TDateTime; nPunkt, nUL : Variant; strDom, strKorp : String; nID : Integer=-1) : Boolean;
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
    function LastDvigMenS( strID: String; sType:String ): String;

    procedure ClearIdBase;
    function GetIdBase(var nCountZnak:Integer) : Integer;
    function GetSysIdBase: String;
    function IsMainBase:Boolean;
    function IsDistributeBase: Boolean;  // ���� �������������� ?

    function GetNewID( TypeObj : Integer ) : Integer;
    function MaxID : Integer;  // ������� ������������ ID ������������ � ����
    function GetLastID : Integer;  // ��������� ��������� ID
    function _CalcID(nID,nIDBASE,nCountZn:integer) : Integer;    // ��������� ID � ������ ID_BASE

    function MainTableFromTypeObj(nTypeObj:Integer):TAdsTable;
    function DataSetFromTypeObj(nTypeObj: Integer): TDataSet;
    function _LockTypeObj(nTypeObj:Integer; strMessage:String):Boolean;
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
    function TypeObj_PasportTerr: Integer;  // ������� ����������
    function TypeObj_Sovet: Integer;  // ������ �����
    function TypeObj_Ochered : Integer;
    function TypeObj_VUS : Integer;
    function TypeObj_Organ : Integer;
    function TypeObj_Obrach: Integer;  // ��������� �������
    function TypeObj_Spr: Integer;
    function TypeObj_ZAGS_AddDok:Integer;          //
    function TypeObj_ZAGS_SprAkt:Integer;          // ������� � ������ ���� ��. ���������
    function TypeObj_ZAGS_SprOtsut:Integer;        // ������� �� ���������� ������� ������
    function TypeObj_ZAGS_IzvOtsut:Integer;        // ��������� �� ���������� ������� ������
    function TypeObj_ZAGS_ZaklChName:Integer;      // ���������� � �������� �����, �������
    function TypeObj_ZAGS_SprBrak:Integer;         // ������� � ������ ���� � �����
    function TypeObj_ZAGS_SprRogd:Integer;         // ������� � ������ ���� � ��������
    function TypeObj_ZAGS_SprSmert:Integer;        // ������� � ������ ���� � ������
    function TypeObj_ZAGS_SprChName:Integer;       //
    function TypeObj_ZAGS_SprRast:Integer;         //
    function TypeObj_ZAGS_ZaklIzmAkt:Integer;      //  ���������� � ��������� ������� ������


//    function TypeObj_Svid: Integer;

    {$IFDEF ZAGS}
//--------------------------------------------------------------------------------
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

    procedure GetListOrganZAGS(PickList:TStrings; KeyList:TStrings; nType:Integer);    // ��������� ������ ������� ����

    procedure WriteLogDeleteDok(ds: TDataSet; nTypeObj:Integer);
    function  DeleteDokument( ds : TDataSet; nTypeObj : Integer; lIgnoreCheck:Boolean=false) : Boolean;
    procedure DeleteFromList( tb : TAdsTable; DateFiks : TDateTime; ID : Integer);
    function GetDatePredZapis:TDateTime;
    procedure DateBrakToHist(nID:Integer; nNomer:Integer; dDateZ:TDateTime; dDateB:TDateTime; dTimeB:TDateTime);

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
    function WriteDataSetToMemo( ds : TDataSet; fldMemo : TField; lList : Boolean;
                   strFieldNames : String) : Boolean;
    function IsDirBase(strDir : String; nType : Integer) : Boolean; override;
    function ProcessDatabaseError : Boolean; override;
    function SetNameFileParamTask : Boolean; override;
    function CheckPathBase : Boolean;
    function GorodHaveRaion(strName : String) : Boolean;

    function LoadLichSchet( strSourceConnect : String ) : Boolean;

    function CountMens( DateFiks : TDateTime; strLicID : String): Integer;
    function CountMensEx( DateFiks : TDateTime; strLicID : String; strType : String; slPar:TStringList): Integer;

    function CountMens2Where( DateFiks : TDateTime; nType:Integer; strType : String; slPar:TStringList): String;
    function CountMensAdres( DateFiks : TDateTime; strAdresID : String; strType : String; slPar:TStringList): Integer;
    function CountMensAdresNotRegistred( DateFiks : TDateTime; strAdresID : String): Integer;

    function IDNewFirstMen( DateFiks : TDateTime; strLicID : String): Integer;
    function ChoiceMenLic( DateFiks : TDateTime; strLicID : String; TypeChoice : TTypeChoiceMen; strNotID : String; strCaption : String  ): Integer;

    function ReplaceTablesBase( strBaseName : String; sl : TStringList) : Boolean;
    function ReplaceOneTable( DictSource : TAdsDictionary; ConnectSource : TAdsConnection; strTableName : String) : Boolean;

    procedure CheckBelFamily(strFamilyR,strFamilyB : String);
    function  GetBelFamily(strFamilyR : String; strPadeg:String='') : String;

    procedure CheckLatFamily(strFamilyR,strFamilyL : String);
    function  GetLatFamily(strFamilyR : String) : String;

    function CheckNameBel( var Pol : TPol; strNameRus : String; strNameBel:String=''; strPadeg:String='') : String;
    function CheckNameLat( var Pol : TPol; strNameRus : String; strNameLat:String) : String;
    function CheckOtchBel( var Pol : TPol; strOtchRus : String; strPadeg:String='') : String;


    procedure CheckBelNazv(nType : Integer; lSelect : Boolean; strNazvR, strNazvB: String );
    function  GetBelNazv(nType : Integer; lSelect : Boolean; strNazvR: String): String;
    procedure CheckNazv(nType : Integer; lSelect : Boolean; strNazv : String );

    function PunktIsGorod( strValue : String; nType : Integer) : Boolean;
    function NamePunkt(strValue : String; nType : Integer; strLang : String): String;
    function GetFullNamePunkt(strValue : String; fldType : TField; strLang:String='R'): String;

    function GetPasportAkt(strDataSet, strParam: String; nType : Integer; dsDok:TDataSet=nil): TPassport;


    function GetRecord_DataSet(strDataSet : String) : TDataSet;

    function CheckBooleanField(ds : TDataset; s : String) : Integer;
    function AdresIsUpper:Boolean;
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
    function ChoiceATEPunkt(arrATE:TArrATE; lChoice:Boolean=true):TATE;
    function GetATEAkt(ds : TDataSet; strParam: String; lCheckRnGorod:Boolean; nType:Integer) : TATE;
    function GetATEAkt2(ds : TDataSet; strParam: String; lCheckRnGorod:Boolean; nType:Integer) : TATE;

    function GetNameAndTypePunkt(strValue : String; var sType,sName : String): Boolean;
    function _getATE(tbATE:TAdsTable; slATE:TStringList; sObl:String; sRaion:String; sSS:String; sPunkt:String; sTypePunkt:String) : Integer;
    function getATESys(slATE:TStringList; sObl:String; sRaion:String; sSS:String; sPunkt:String; sTypePunkt:String) : Integer;
    function getATE(slATE:TStringList; sObl:String; sRaion:String; sSS:String; sPunkt:String; sTypePunkt:String) : Integer;

    //-----------------------------
    function GetSQLForVozrast(strLastField, strFirstField : String) : String;
    function GetTypeZags : Integer;
    function OblArxivZAGS: Boolean;
    function OblBASE: Boolean;

    function GetNewNomerDok(nTypeObj:Integer; nYear:Integer): Integer;
    function GetNewNomerSvid(TypeSvid : Integer; tb : TAdsTable; var strNewNomer : String; var strNewSeria : String) : String;
    {$IFDEF ZAGS}
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

    function GetCurDate : TDateTime;
    procedure SetCurDate(const Value: TDateTime);

    function MaxValueField(strNameTable,strField:String) : Integer;  // ������� ������������ �������� ���� strField �� ������� strNameTable

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

    //------------- ������� ----------------------------
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

  end;

var
  dmBase: TdmBase;

const
  SYSTEM_PASSWORD = 'sysdba';
  SYSTEM_USER     = 'ADSSYS';

implementation

uses fMain, SelLibFR, fShablon, fWarning, fsimpleD, fChoiceAdres, fNotLoadPunkt;

{$R *.DFM}

//{$DEFINE DEBUG}

constructor TdmBase.Create(Owner: TComponent);
var
  Rel : TRelation;
//  strDir : String;
//  lExit  : Boolean;
begin

  SprMainBase := TStringList.Create; // ����������� ����������� ��� �������������

  FLastAdresUpper:=false;
  FIdBase:=-1;
  FDistributeBase:=false;
  FMainBase:=-1;
  FCountZnack:=-1;

  CreateSimple(Owner);

  SetCurDate(Date);   // ������� ����

  HouseProp_ID := 0;
  FirstDatePrixodSvidZAGS:=0;

  //------- ��������� ������� ----------------
  {$IFDEF OBR_GRAG}
    Doc2Sel.CreateDocTable;
  {$ENDIF}

  // ����������� ����
  SprDocOfficial:=CreateAddTable('SprDocOfficial','SprDocOfficial','AdsConnection');

  // �������� ��������� �������
  SprDocSubjG:=CreateAddTable('SprDocSubjG','SprDocSubjG','AdsConnection');

  // ������ ���� ����� ������ ���������� �� DataModule
  SprFamily   := CreateAddTable('SprFamily','','AdsConnection');
  SprNamesM   := CreateAddTable('SprNamesM','','AdsConnection');
  SprNamesG   := CreateAddTable('SprNamesG','','AdsConnection');
//  SprGES := CreateAddTable('SprGES','SprGES','AdsSharedConnection');

  Shablon     := CreateAddTable('Shablon','Shablon','AdsConnection');

  SprGragd    := CreateAddTable('��������','SprGragd','AdsSharedConnection');
  SprGragd.IndexName := 'NOMER_KEY';
//  SprGES := nil;
//  SprZags:= nil;

  {$IFDEF OCHERED}
//     SprGSK := CreateAddTable('SprGSK','SprGSK','AdsConnection');
  {$ELSE}
    {$IFDEF GKH}
//      SprGES := CreateAddTable('SprGES','SprGES','AdsSharedConnection');
    {$ELSE}
//      SprZAGS := CreateAddTable('SprZAGS','SprZAGS','AdsSharedConnection');
    {$ENDIF}
  {$ENDIF}

  {$IFDEF GISUN}
    MessageGISUN := CreateAddTable('MessageGISUN','','AdsConnection');
    AllSprGISUN:=CreateAddTable('GISUN_Class','GISUN_Class','AdsSharedConnection');
    AteSys:=CreateAddTable('Ate','AteSys','AdsSharedConnection');
    Log:=CreateAddTable('Log','Log','AdsConnection');
  {$ELSE}
    AteSys:=nil;
  {$ENDIF}

  SprSklon    := CreateAddTable('Sklonenie','SprSklon','AdsSharedConnection');
  SprRodsName := CreateAddTable('SprRodsName','SprRodsName','AdsSharedConnection');

  RunSpr     := CreateAddTable('RunSpr','RunSpr','AdsSharedConnection');
  RunSprUser := CreateAddTable('RunSprUser','RunSprUser','AdsConnection');

//  SprPerevod  := CreateAddTable('SprPerevod','','AdsConnection');
  ListP       := CreateAddTable('ListP','','AdsConnection');

//  SprOwners    := CreateAddTable('SprOwners','','AdsConnection');
  tbHistoryZAGS:= CreateAddTable('HistoryZAGS','','AdsConnection');

//  {$IFDEF ZAGS}
//    tbListRepeat := CreateAddTable('ListRepeat','','AdsConnection');
//  {$ELSE}
//    tbListRepeat := nil;
//  {$ENDIF}

//  SprDokLic  := CreateAddTable('SprDokLic','SprDokLic','AdsSharedConnection');

  tbSimpleProp:= CreateAddTable( 'BaseProp','tbSimpleProp','AdsConnection');
  tbSimplePropMemo := CreateAddTable('BaseTextProp','tbSimplePropMemo','AdsConnection');

//  tbPasportViza := CreateAddTable('PasportViza','tbPasportViza','AdsConnection');
//  tbDokuments   := CreateAddTable('Dokuments','tbDokuments','AdsConnection');

  dmTaskCreate(true);

  ReadGlobalPar(PathForSysParams);
  ReadParamsAllTables;

  ListTablesSost := TList.Create;
  Relations := TRelations.Create;
  
{$IFDEF ADD_MENS_PU}
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

  ListTablesSost.Add( tbHouseProps );      // �������������� �������� �������
  ListTablesSost.Add( tbHouseOwners );     // ��������� �����
//  ListTablesSost.Add( SprOwners );         // ���������� ��������� ����������


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
  // ���� ����������� ����� �������, ��� ��� ����� ���� �������� � ������� tbHouseOwners, � ��� ������ �� �����
  Rel := Relations.AddNew( tbMens );
  Rel.Kod := 'MENS';
  Rel.AddTable( tbMensLgot );
  Rel.AddTable( tbMensDvig );
  Rel.AddTable( tbMensPr );
  Rel.AddTable( tbProp );
  Rel.AddTable( tbPropMemo );

  { TODO -c������������ : �������������� }
  Rel.AddSimpleTable( tbOchered );
  Rel.AddSimpleTable( tbSostavSem );
  Rel.AddSimpleTable( tbVUS );

  RelationMens := Rel;
{$ENDIF}

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
      if Problem(' ������� "'+strDir+'" �� �������� ��������� ����.'+#13+'���������� ����� �������������� ?') then begin
        if SelectDirectory('�������� ������� �������������� ����', '', strDir) then begin
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
//    FormMain.Caption := FormMain.Caption + ' [ ����: '+GlobalPar.ConnectPath+' ]';
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
{$IFDEF ADD_ZAGS}
var
  s:String;
begin
  s:=tbZapisRogd.IndexFieldNames;
  tbZapisRogd.IndexFieldNames:='NOMER;DATEZ';
  try
    if tbZapisRogd.FindKey([StrToInt(strNomerAkt),dDateAkt]) then begin
  //  if tbZapisRogd.Locate('DATEZ;NOMER', vKeyValues, []) then begin
      Result.Nomer := strNomerAkt;
      Result.Date  := dDateAkt;
      Result.Mesto := ANSIUpperCase(fmMain.NameOrg('K',''))+' '+
                      fmMain.NameRaion('�')+' '+fmMain.NameObl('�')+' ';
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
{$ELSE}
begin
end;
{$ENDIF}
function TdmBase.CreateNameRaion( strRaion,strPadeg : String) : String;
begin
  if Pos('.',strRAION)=0 then begin
    Result := GetPadegWord( strRAION, strPadeg) + ' ' + GetPadegWord( '�����', strPadeg );
  end else begin
    Result := GetPadegWord( strRAION, strPadeg);  // � �������� ������ ����� ��������� ����������
  end;
end;

function TdmBase.CreateNameObl(fldB, fldN : TField; strLang : String): String;
begin
  Result := NameObl(fldN.AsString, BooleanToInt(fldB), strLang);
end;

function TdmBase.NameObl(strName : String; nType : Integer; strLang : String) : String;
var
  s,ss,s1 : String;
  lKrat:Boolean;
begin
  if Pos('.',strLang)>0 
    then lKrat:=true 
    else lKrat:=false;
  strLang:=StringReplace(strLang, '.', '', []);
  strLang:=ANSIUpperCase(Copy(Trim(strLang),1,1));
  if (strLang='') or (strLang='R') or (strLang='�')
    then strLang:='R'
    else strLang:='B';
  if lKrat then begin
    if strLang='R' then begin
      s1:='���.';
    end else begin
      s1:='����.';
    end;
  end else begin
    if strLang='R' then begin
      s1:='�������';
    end else begin
      s1:='�����c��';
    end;
  end;
  s:=Trim(strName);
  Result:='';
  if (s<>'') then begin
    ss:='';
//    n := BooleanToInt(fldB);
    if (nType=-2) then begin  // ���� ���� �� ��������
      if Pos(s1, ANSILowerCase(s))=0 then begin
        ss := ' '+s1;
      end;
    end else if (nType=-1) then begin  // ���� ��� ������� �� ������
      if ((ANSIUpperCase(strName)='������') or (ANSIUpperCase(strName)='�������')) then begin
        ss:='*';
      end;
  //    ss := '';
    end else if (nType=1) then begin  // �������
      if Pos(s1, ANSILowerCase(s))=0 then begin
        ss := ' '+s1;
      end;
    end else if nType=0 then begin   // ����
      if Pos('����', ANSILowerCase(s))=0 then begin
        ss := ' ����';
      end;
    end;
    if ss='*'
      then Result:='�. '+s
      else Result:=s+ss;
  end;
end;

// ������� ����� �������� �������� �� ������� ������������ ��� ������ ������ ������������ ��� ������� ������ � ��������
function TdmBase.GetMestoMen(nTypeMest:Integer; strID : String; lFull : Boolean; nOrder : Integer; dsMigr:TDataSet): String;
begin
  Result:='';
end;

//---------------------------------------------------------------------------------------------------
function TdmBase.GetMestoFromFields(ds:TDataSet; strFields:String; lFull:Boolean;nOrder:Integer):String;
var
  arr,arrFld:TArrStrings;
  fldB_RESP,fldGOSUD,fldB_OBL,fldOBL,fldRAION,fldB_GOROD,fldGOROD:TField;
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
  if nOrder=0 then begin // � ������� �������
    for i:=0 to 3 do begin
      if arr[i]<>'' then begin
        Result:=Result+arr[i]+strDelim+' ';
      end;
    end;
  end else begin  // ������ ������ ���� ���. �����
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
  fldB_RESP,fldGOSUD,fldB_OBL,fldOBL,fldRAION,fldB_GOROD,fldGOROD:TField;
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
  Result.PunktN:=fldGOROD.AsString;        // ������������ ��� ������ ��� ����
  Result.PunktTK:=GetTypePunkt(fldB_GOROD.AsString,'R',s);
  Result.PunktTN:=s;
  if fldDom<>nil then begin
    Result.NDom:=fldDom.AsString;
    Result.Korp:=fldKorp.AsString;
    Result.Kv:=fldKv.AsString;
    Result.Dom:=getDOM(Result.NDom, Result.Korp, Result.Kv, '', false);
    Result.Dom2:=Result.Dom;
  end;
  //------- ������� ����� ---------------------
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
  if n=dmBase.SprTypeDok.FieldByName('ID').AsInteger then begin
    lOk:=true;
  end else begin
    lOk:=dmBase.SprTypeDok.Locate('ID', n, []);
  end;
  if lOk then begin
    if (Copy(sLang,1,1)='B') or (Copy(sLang,1,1)='�')
      then sField:='NAME_PRINT_B'
      else sField:='NAME_PRINT';
    Result := dmBase.SprTypeDok.FieldByName(sField).AsString;
  end;
end;

//-----------------------------------------------------------------------
function TdmBase.PasportToText(Pasport : TPassport; nType : Integer) : String;
var
  s : String;
  sU,sU2:String;
begin
  // ���� ��� ��������� ���������� ��� ��� ����� ����������� "��������"
  if (Pasport.UdostKod=0) or (Pasport.UdostKod=888) then begin
    if Pasport.Organ<>'' then begin
      Result:=Pasport.Organ;
    end else begin
      Result:='';
    end;
  end else if Pasport.UdostKod=999 then begin
    Result:=Pasport.Udost;  // '�������� �� �����������'
  end else begin
    if Trim(Pasport.Seria+Pasport.Nomer)='' then begin
      Result:='';
    end else begin
      Result:=Pasport.Udost;
      if nType<=1 then begin
        s:=' �����';
        case Pasport.UdostKod of
          // �������  �� ��� ������. ���������� ��� ��� �� ����������
          1,2,3,4 : begin
    //            Result:=Result+' ����� '+Pasport.Seria+Pasport.Nomer;
                      Result:=Result+' '+Pasport.Seria+Pasport.Nomer;
                    end;
          // ��� �� ����������
    //      2,3 : begin
    //            Result:=Result+' ����� '+Pasport.Seria+' ����� '+Pasport.Nomer;
    //            Result:=Result+' ����� '+Pasport.Seria+' ����� '+Pasport.Nomer;
    //          end;
          else begin
            Result:=Result+' ����� '+Pasport.Seria+' ����� '+Pasport.Nomer;
          end;
        end;
        if (Pasport.Organ<>'') or (Pasport.sDate<>'') then Result:=Result+s;
        if (Pasport.Organ<>'') then Result:=Result+' '+Pasport.Organ;
        if (Pasport.sDate<>'') then Result:=Result+' '+Pasport.sDate;
        if (nType=1) and (Pasport.LichNomer<>'') then Result:=Result+' ���.����� '+Pasport.LichNomer;
      end else if (nType=2) or (nType=3) then begin
        if Pasport.sDate<>'' then s:=DatePropis(Pasport.Date,1)+'�.' else s:='';
        if nType=3 then begin
          sU:='<u>';
          sU2:='</u>';
        end else begin
          sU:='';
          sU2:='';
        end;
        Result:=Result+' ����� '+sU+' '+Pasport.Seria+' '+sU2+'  � '+sU+' '+Pasport.Nomer+' '+sU2+' , �������� '+sU+s+sU2;
      end else if (nType=4) then begin
        Result:=Pasport.Organ;
      end else if (nType=5) then begin
        Result:=Result+' ����� '+Pasport.Seria+'  � '+Pasport.Nomer;
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
  Result.UdostB:= GetNamePasport(UdostKod,'�');
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
    // ������ �������� � ������� "���������"
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
    Result.UdostB:= GetNamePasport(n,'�');
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
      Result.sDate := FormatDateTime('dd.mm.yyyy',Result.Date)+'�.';
    end;
    s := dmBase.ReadOneProp( DateFiks, StrToInt(strID), 'PASP_VIDAN', ftMemo);
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
//  vKeyValues := VarArrayCreate( [0, 1], varOleStr );
//  vKeyValues[0] := DateFiks;
//  vKeyValues[1] := StrToInt(strID);
  try
    strBookMark := tbMens.Bookmark;
  except
    strBookMark := '';
  end;
  l := dbDisableControls(tbMens);
  // ������ �������� � ������� "���������"
  if strRazd='' then strRazd:=' ';
  if tbMens.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,strID]), []) then begin
    Result := tbMens.FieldByName('FAMILIA').AsString+strRazd+tbMens.FieldByName('NAME').AsString+strRazd+
              tbMens.FieldByName('OTCH').AsString ;
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
//  ������� ������ ��������������, ���� �������� �������� �������� (� ������ ��� ��������) �� ������
//  ������� ����, ��� ����, ����� �� ������� �� ������ �������, �� ��� ����� ID
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
          'UPDATE ����������������� SET id='+sIDCopyMen+' WHERE date_fiks='+QStr(DTOS(fmMain.DateFiks,tdAds))+' and id='+sIDSeek+';'+
          'UPDATE HistoryZAGS SET id='+sIDCopyMen+' WHERE typeobj=3 and id='+sIDSeek+';'+
          'UPDATE ������������ SET id='+sIDCopyMen+' WHERE id='+sIDSeek+';'+
          'UPDATE ������������������� SET id='+sIDCopyMen+' WHERE date_fiks='+QStr(DTOS(fmMain.DateFiks,tdAds))+' and typeobj=3 and id='+sIDSeek+';'+
          'UPDATE ��������� SET id='+sIDCopyMen+' WHERE date_fiks='+QStr(DTOS(fmMain.DateFiks,tdAds))+' and typeobj=3 and id='+sIDSeek+';';
  AdsConnection.Execute(strSQL);
  lFind := tbMens.Locate('DATE_FIKS;ID', VarArrayOf([fmMain.DateFiks,nIDSeek]), []);  // ������ ��������
  if lFind then begin
    nLicID:=tbMens.FieldByName('LIC_ID').AsInteger;     // ID ��� �������� ����
    lLic:=false;
    //--------- ���� ������� �� ������� ����� � �� ��� ����� ---------------------
    if (nLicID>0) and (tbMens.FieldByName('FIRST').AsBoolean=true) then begin
      if tbLich.Locate('DATE_FIKS;ID', VarArrayOf([fmMain.DateFiks,nLicID]), []) then begin // ������ ������� ����
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
{$IFDEF ADD_MENS_PU}
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
{$IFNDEF ADD_MENS_PU}
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
  //-------- ������ �������� ------------------
  if tbMens.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,nOldID]), []) then begin
    strLich:=tbMens.FieldByName('LIC_ID').AsString;
    lFirst:=tbMens.FieldByName('FIRST').AsBoolean;
    strOtnosh:=tbMens.FieldByName('OTNOSH').AsString;
    strBookMark:=tbMens.Bookmark;
    lOk:=true;
  end;

  if lOk then begin
    //-------- ������� �������, ���� �� ������� � �������� ��������� -----------------
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
  if (strNewLic=strLich) then begin  // ��� �� ����� ������� ����
    lOk:=false;
  end;
  dDatePrib:=0;
  if dDateUbit>0 then begin
    dDatePrib:=dDateUbit+1;
    // ����� �� ���� "exception" ��� ���������� ������ � ������ ��������
    if dmBase.tbMensDvig.Locate('DATE_FIKS;ID;DATE', VarArrayOf([DateFiks,nOldID,dDateUbit]),[]) then begin
      PutError('�� ���� ���� � �������� ����� ���� ������ ���� �����������.');
      lOk:=false;
    end;
  end;
  if lOk then begin
    Screen.Cursor := crHourGlass;
    //---------- ���� ���� ���� ������ ----------------------------
    if dDateUbit>0 then begin
      // ������� � ��������, ��� ������� ����
      with dmBase.tbMensDvig do begin
        Append;
        FieldByName('DATE_FIKS').AsDateTime := DateFiks;
        FieldByName('ID').AsInteger         := nOldID;
        FieldByName('TIP').AsString     := MIGR_UBIL; // ����
        FieldByName('CONTANT').AsInteger:= 1;  // ���������
        FieldByName('TALON').AsInteger  := 0;
        FieldByName('DATE').AsDateTime  := dDateUbit;
        FieldByName('PRICH').AsInteger  := 0;
        FieldByName('ORGAN').AsString   := '';
        Post;
      end;
    end;
    //-------------------------------------------------------------

    tbMens.Bookmark:=strBookMark;  // !!!   ��� ����� Locate

    GetCurrentRecord(tbMens, '', arrRec);        // ��������� ������ � �������� � ������
    nNewId := GetNewID( dmBase.TypeObj_Nasel );  // ������� ID ��� ������ ����� ���������

    //-- !!! ----------------------------
    //  nNewID  - ����� ID ��� ������ ("���������" ����� ��������) �� ������ ������� �����
    //  nOldID  - ���������� ������ � �������� �������� �� ������� ID �� ����� ������� �����
    //-----------------------------------

    // ������� ������ � �������� �� �����
    tbMens.CheckBrowseMode;
    tbMens.Edit;
    tbMens.FieldByName('LIC_ID').AsString:=strNewLic;
    tbMens.FieldByName('ADRES_ID').AsString:=strNewAdres;
    tbMens.FieldByName('FIRST').AsBoolean:=false;

    //---------- ���� ���� ���� ������ ----------------------------
    if dDateUbit>0 then begin
      tbMens.FieldByName('DATEP').AsDateTime:=dDatePrib;
    end;
    //-------------------------------------------------------------

    tbMens.FieldByName('OTNOSH').AsString:='';  // ����� ������� ?
    tbMens.Post;

    Result:=StrToInt(strNewLic);
  end;
  if lOk then begin
    if not tbLich.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,StrToInt(strLich)]), []) // ������ ������� ����
      then lOk:=false;
    if lOk then begin
      if nNewID > 0 then begin
        // ��������� �������� � ������ ����� ��������
        oldInd:=tbMensDvig.IndexName;
        tbMensDvig.IndexName := 'PR_KEY';
        tbMensDvig.SetRange([DateFiks,nOldID],[DateFiks,nOldID]);
        tbMensDvig.First;
        //------ � ����������� �������� � ����� ����� --------------------------
        if lSaveDvig then begin
          try
            n:=0;
            while not tbMensDvig.Eof and (tbMensDvig.FieldByName('ID').AsInteger=nOldID) do begin
              SetLength(arrDvig, n+1);
              GetCurrentRecord(tbMensDvig,'',arrDvig[n]);
              SetValueField(arrDvig[n],'ID',nNewID);   // ������� ID
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
          //------ ��� ���������� �������� � ����� ����� --------------------------
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
        //---------- ���� ���� ���� ������ ----------------------------
        if dDateUbit>0 then begin
          // ������� � ��������, ��� ������� ������ �� ����� ������� ����
          with dmBase.tbMensDvig do begin
            Append;
            FieldByName('DATE_FIKS').AsDateTime := DateFiks;
            FieldByName('ID').AsInteger         := nOldID;   // ID ���������� ����� ��������
            FieldByName('TIP').AsString     := MIGR_PRIB; // ������
            FieldByName('CONTANT').AsInteger:= 1;  // ���������
            FieldByName('TALON').AsInteger  := 0;
            FieldByName('DATE').AsDateTime  := dDatePrib;
            FieldByName('PRICH').AsInteger  := 0;
            FieldByName('ORGAN').AsString   := '';
            Post;
          end;
        end;
        //-------------------------------------------------------------
        // ������������ ������ ������ ����� � ������� ��� �������
        SetValueField(arrRec,'ID',nNewID);    // ������� ID � ������ �����
        SetValueField(arrRec,'FIRST',lFirst);
        SetValueField(arrRec,'ADRES_ID', tbLich.FieldByName('ADRES_ID').AsInteger );
        SetValueField(arrRec,'LIC_ID',StrToInt(strLich));
        SetValueField(arrRec,'NEW_ID',nOldID);           // ������ �� �����("������") ������������� ��������
        SetValueField(arrRec,'VUS',false);
        SetValueField(arrRec,'OCHERED',false);

        //---------- ���� ���� ���� ������ ----------------------------
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

        AddCurrentRecord(tbMens, arrRec);    // ������ ������ ����� �� ����

        //---------- ���� ���� ���� ������ ----------------------------
        if dDateUbit>0 then begin
          n:=CountMens(DateFiks, strLich);  // ����� ������ �� ��������
          if n=0 then begin                 // ����� ����������� ������� ����
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

function TdmBase.HouseOwners_old(DateFiks:TDateTime; strIdAdres:String; obj:TObject; nType:Integer) : String;
begin
 Result:=HouseOwners(DateFiks,strIdAdres,obj,nType,nil,nil,nil);
end;
// ���� nType=1  , �� �������� ����� ������ �������
// ���� nType=2  , �� ���������� '0'-����+���  '1'-���� ������ ������� ������������  '2'-������ �������.
//function TdmBase.HouseOwners(DateFiks: TDateTime; strIdAdres: String;
//             sl : TStringList; nType : Integer) : String;
function TdmBase.HouseOwners(DateFiks : TDateTime; strIdAdres : String; obj : TObject; nType : Integer; tbOwnersExternal:TDataSet; tbMens:TDataSet; slPar:TStringList) : String;
begin
  Result := '';
end;

// tbOwners ������� � ������� ��������� ���������
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
      if (strTail<>'') and (strTail<>'1') then strTail := '- ' + strTail + ' �����';
      strName:='';
      dDate:=0;
      if (strID<>'') and (nTypeM<>0) then begin
        if nTypeM = OWNER_NASEL then begin  // �������
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
{$IFDEF OPEKA}
function TdmBase.CheckSprOtnosh(strName:String):Integer;
begin Result:=0;  end;
//-----------------------------------------------------------------
function TdmBase.GetOtnoshMen(nID:Integer):String;
begin Result:=''; end;
{$ELSE}
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
{$ENDIF}

//-----------------------------------------------------------------
function TdmBase.GetTypePunkt( strType : String; strLF : String; var strName : String ) : Integer;
var
  lBel,lFull : Boolean;
begin
  Result:=0;
  strName:='';
  if strType<>'' then begin
    strLF:=ANSIUpperCase(strLF);
    if (Pos('�',strLF)>0) or (Pos('B',strLF)>0) then lBel:=true else lBel:=false;
    if (Pos('�',strLF)>0) or (Pos('F',strLF)>0) then lFull:=true else lFull:=false;
    // ������ ��� ��� ������
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
{$IFDEF ADD_MENS_PU}
var
  ds:TDataSet;
  nLicID:Integer;
  s1,s2,s3: TBookmarkStr;
begin
  Result:=false;
  if nType=CHECK_EN then begin   // �������� ����� �� ��������������
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
        // ���� ������� �� ��������� �� ������ �������� �����
        nLicID:=ds.FieldByName('LIC_ID').AsInteger;
        if nLicID>0 then begin
          if tbMensAdd.Locate('EN_LIC_ID', nLicID, []) then begin
            // ������� ���� �������� ����� �������� �����
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
{$ELSE}
begin
  Result:=false;
end;  
{$ENDIF}

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
        // �� ��������� �������
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
{$IFNDEF ADD_MENS_PU}
begin
  Result:=false;
end;
{$ELSE}
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

     if ((resh.FTip=OCH_RESH_POST) or (resh.FTip=OCH_RESH_VOST)) and (Resh.FDateSILA=0) then begin // ���� � ������� �� ��������� ���� ����������
       if tbOchered.Locate('OCHERED_ID;ID', VarArrayOf([Resh.FOchered_Id,resh.FIDMen]),[]) then begin
         if not tbOchered.FieldByName('DEC_DATE').IsNull then Resh.FDateSila:=tbOchered.FieldByName('DEC_DATE').AsDateTime;
       end;
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
  if nIDResh<0 then begin  // ������� ������� ������� (�� ������� �����)
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
{$IFDEF ADD_MENS_PU}
var
 s,sCur,sIDNotRead : String;
 lCheckOch,lIskl:Boolean;
 n,i:Integer;
 arr : TArrStrings;
 st : TSostTable;
begin
 // 'NPP;FIO;OTN;YEAR;DATE'      -nID1,nID2     ������ ID ������� �� ���� ������

  i:=Pos('+ALL',strType);
  if i>0 then lCheckOch:=false else lCheckOch:=true;     // �������� ��������� OCH-��������� � ������ ����� ����������
  strType:=StringReplace(strType,'+ALL','',[]);

  i:=Pos('-',strType);
  sIDNotRead:='';
  if i>0 then begin
    sIDNotRead:=Copy(strType,i+1,Length(strType));
    sIDNotRead:=StringReplace(sIDNotRead,';',',',[rfReplaceAll])+',';  // �� ������ ������ ������� ';' �� ','
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
                then sCur:=sCur+IntToStr(YearOf(tbSostavSem.FieldByName('DATER').AsDateTime))+'�.�. ';
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
             // � ������ ������ ������ �� ���������
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
{$ELSE}
begin
  Result:='';
end;
{$ENDIF}

//-------------------------------------------------------------------------------------------------------------------
// !nType = 0  ��� ���� �������� �����, ���������� �� PA_ID � MA_ID
// !nType = 1  ��� ���� � ������� ����������� PA_ID ��� MA_ID
// !nType = 2  ���� � �������� ����� � ������� ����������� PA_ID ��� MA_ID
function TdmBase.GetDeti(dsDeti:TDataSet; strID:String; strPol:String; Vozr1,Vozr2:Integer; lOnlyLic:Boolean; lNotPasport:Boolean; nTypeAktRogd:Integer):Boolean;
begin
  Result:=false;
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
    // ���� ������� ����� ������ � �������� �����
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

    if strPol='�'
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

//-------------------------------------------------------------
// ������� ����� ������ ��������������� �������� AdresPropisMen ��� AdresFromID
//-------------------------------------------------------------
function TdmBase.GetTailAdres(strType: String): String;
begin
  Result:='�����.���';
  strType:=UpperCase(strType);
  if (strType='OBL') or (Copy(strType,1,3)='���') then begin
    Result:=Adres_Obl;
  end else if (strType='RAION') or (strType='�����') then begin
    Result:=Adres_Raion;
  end else if (strType='PUNKT') or (Copy(strType,1,4)='����')  then begin
    Result:=Adres_Punkt;
  end else if strType='PUNKTKOD' then begin
    Result:=IntToStr(Adres_PunktKod);
  end else if strType='PUNKTTK' then begin
    Result:=IntToStr(Adres_PUNKTTK);
  end else if strType='PUNKTTN' then begin
    Result:=Adres_PUNKTTN;
  end else if strType='PUNKTN' then begin
    Result:=Adres_PUNKTN;
  end else if (strType='ULICA') or (strType='UL') or (Copy(strType,1,4)='����') then begin
    Result:=Adres_Ul;
  end else if (strType='PUNKTUL') or (strType='PUNKTULICA') or (strType='�����_�����') then begin
    if Adres_UL='' then Adres_PunktUl:=Adres_Punkt
                   else Adres_PunktUl:=Adres_Punkt+', '+Adres_UL;
    Result:=Adres_PunktUl;
  end else if (strType='ULICADOM') or (strType='ULDOM') or (strType='�����+���')  then begin
    Result:=Adres_UlDom;

//    Dom      // ����� ���� + ������ + �������� ��� ������������ ��������
//    Dom2     // ����� ���� + ������ + ��������, ���� ��� ������ ����, �� �� �������� ��� ��������
//    NDom     // ����� ����� ����

  end else if (strType='DOM') or (strType='���')  then begin
    Result:=Adres_Dom;
  end else if (strType='DOM2') or (strType='���2')  then begin
    Result:=Adres_Dom2;
  end else if strType='NOT_DOM' then begin
    if Adres_NotDom then Result:='1' else Result:='0';
  end else if (strType='NDOM') or (Copy(strType,1,4)='����') then begin
    Result:=Adres_NDOM;
  end else if (strType='KORP') or (Copy(strType,1,3)='���') then begin
    Result:=Adres_Korp;
  end else if (strType='KV') or (Copy(strType,1,2)='��') then begin
    Result:=Adres_Kv;
  end else if (strType='ETAG') or (strType='����') then begin
    Result:=Adres_Etag;
  end else if (strType='RNGOR') then begin
    Result:=IntToStr(Adres_RnGor);
  end else if (strType='RNGORNAME') or (strType='�����') then begin
    Result:=Adres_RnGorName;
  end else if (strType='KOL_ETAG') or (strType='���_����') then begin
    Result:=Adres_Kol_Etag;
  end else if (strType='PREDST') or (Copy(strType,1,4)='����') then begin
    Result:=Adres_Predst;
  end else if (strType='CONTROL') or (Copy(strType,1,5)='�����') then begin
    Result:=Adres_Control;
  end else if (strType='USE_GILFOND') or (Copy(strType,1,5)='�����') then begin
    Result:=Adres_UseGilfond;
  end else if (strType='PRIVATE') or (Copy(strType,1,5)='�����') then begin
    if Adres_Private
      then Result:='1'
      else Result:='0';
  end else if (strType='SPEC') or (Copy(strType,1,4)='����') then begin
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
begin
  Result:=false;
end;

//---------------------------------------------------------------------------
function TdmBase.AdresPropisFromAdres(adr:TAdres; lAll:Boolean):String;
var
  s:String;
begin
  Result:='';
  if (adr.AdresPropis<>'�� ��������') or lAll then begin
    s:='';
    if adr.Obl<>''   then s:=s+adr.Obl+' �������, ';
    if adr.Raion<>'' then s:=s+adr.Raion+' �����, ';
    if adr.Punkt<>'' then s:=s+adr.Punkt+', ';
    if adr.Ulica<>'' then s:=s+adr.Ulica+', ';
    if adr.NDom<>''  then s:=s+sokrDom+adr.NDom+', ';
    if adr.Korp<>''  then s:=s+sokrKorp+adr.Korp+', ';
    if adr.Kv<>''    then s:=s+sokrKv+adr.Kv+', ';
    s:=Trim(Copy(s,1,Length(s)-2));
    if s='' then s:='�� ��������';
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
    ShowStrings(sl,'�����');
    sl.Free;
  end;
end;
// uObjectScript.pas    !!! TAdresLic GetAdres !!!
//-----------------------------------------------------------------------------------------------
function TdmBase.AdresMen(DateFiks: TDateTime; strID: String; var strName : String; lSet:Boolean; lCheckAdresPropis:Boolean): TAdres;
var
  sLicID,sAdresID : String;
  ID,nAdresID,n : Integer;
  lOk,lLic:Boolean;
begin
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
    // ������ �������� � ������� "���������"
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
         // ��� ������������ �������
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
          if (Result.AdresPropis='') or (Pos('�� ��������',ANSILowerCase(Result.AdresPropis) )>0) then begin
            if dmBase.tbMensAdd.Locate('ID', ID, []) then begin
              Result.AdresPropis:=dmBase.tbMensAdd.FieldByName('TEXT_ADRES').AsString;
            end else begin
              Result.AdresPropis:='�� ��������';
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
    //-------- ���� ������� �� �������� � �� �� ������� ����� ----------------------
    if not lLic and not tbMens.FieldByName('PROPIS').IsNull and (tbMens.FieldByName('PROPIS').AsBoolean=false) then begin // �� �������� �� ��������� �/�
      ID:=StrToInt(strID);
      Result.AdresPropis := Trim(dmBase.ReadOneProp(DateFiks, ID, 'ADRES_PROP', ftMemo));
      Result.Propis:=false;
      if (Result.AdresPropis='') or (Pos('�� ��������',ANSILowerCase(Result.AdresPropis) )>0) then begin
        Result.AdresPropis:='�� ��������';
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
      Result.AdresPropis:='�� ��������';
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
  Result.PunktKod   :=Adres_PunktKod  ;  // ��� ���. ������
  Result.PunktTN    :=Adres_PunktTN   ;   // ������������ ���� ��� ������
  Result.PunktTK    :=Adres_PunktTK   ;    // ��� ���� ��� ������
  Result.PunktN     :=Adres_PunktN    ;    // ������������ ��� ���� ��� ������
  Result.Punkt      :=Adres_Punkt     ;     // ������������ � ����� ���. ������
  Result.IsGorod    :=Adres_IsGorod   ;
  Result.Gorod      :=Adres_Gorod     ;
  Result.Selo       :=Adres_Selo      ;
  Result.Ulica      :=Adres_UL        ;
  Result.UlicaInt   :=Adres_UlKod     ;
  Result.UlicaType  :=Adres_TypeUlKod ;   // ��� ���� �����
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
  Adres_PunktKod  :=adr.PunktKod;  // ��� ���. ������
  Adres_PunktTN   :=adr.PunktTN;   // ������������ ���� ��� ������
  Adres_PunktTK   :=adr.PunktTK;   // ��� ���� ��� ������
  Adres_PunktN    :=adr.PunktN;    // ������������ ��� ���� ��� ������
  Adres_Punkt     :=adr.Punkt;     // ������������ � ����� ���. ������
  Adres_IsGorod   :=adr.IsGorod;
  Adres_Gorod     :=adr.Gorod;
  Adres_Selo      :=adr.Selo;
  Adres_UL        :=adr.Ulica;
  Adres_UlKod     :=adr.UlicaInt;
  Adres_TypeUlKod :=adr.UlicaType;   // ��� ���� �����
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
  Adres_PunktKod:=0;  // ��� ���. ������
  Adres_PunktTN:='';   // ������������ ���� ��� ������
  Adres_PunktTK:=0;  // ��� ���� ��� ������
  Adres_PunktN:='';    // ������������ ��� ���� ��� ������
  Adres_Punkt:='';;    // ������������ � ����� ���. ������
  Adres_IsGorod:=true;
  Adres_Gorod:='';
  Adres_Selo:='';
  Adres_UL:='';
  Adres_UlKod:=0;
  Adres_TypeUlKod:=0;   // ��� ���� �����
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
begin
  Result:='';
end;

//  lNameIsNotDom   �������� ������������ �������� ���� ��� ������ ����
function TdmBase.AdresFromID(DateFiks : TDateTime; strID : String; lNameIsNotDom:Boolean): String;
{$IFDEF ADD_MENS_PU}
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
    Result:='������ ������:"'+strID+'"';
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
    Adres_Etag := tbAdres.FieldByName('ETAG').AsString;
    Adres_Kol_Etag := tbAdres.FieldByName('KOL_ETAG').AsString;
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
        if Adres_PunktTN<>'' then Adres_Punkt:=CheckSpace(Adres_PunktTN+' '+Adres_Punkt);
        // �����
        if not SprPunkt.FieldByName('GOROD').IsNull and
           SprPunkt.FieldByName('GOROD').AsBoolean then begin
          Adres_Gorod := Adres_Punkt;
          Adres_IsGorod := true;
        // �������
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
    s := getDom( tbAdres,lNameIsNotDom );
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

    // �������� ����� ������ (�������� ��� ������)
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
{$ELSE}
begin
  Result:='';
end;
{$ENDIF}
//------------------------------------------------------------------
function TdmBase.getUL( nKod: Integer): String;
var
  strTip : String;
begin
  Result := '';
  Adres_UlKod:=nKod;
  Adres_TypeUlKod:=0;
  if nKod > 0 then begin
    if SprUL.Locate('ID', nKod, []) then begin
      Result := SprUL.FieldByName('NAME').AsString;
      strTip := SprUL.FieldByName('TIP').AsString;
      Adres_TypeUlKod:=0;
      if strTip<>'' then begin
        Adres_TypeUlKod:=StrToInt(strTIP);
        if SprTypeUL.Locate('ID', strTip, []) then begin
          if SprTypeUL.FieldByName('NAME').AsString<>'-'
            then Result := SprTypeUL.FieldByName('NAME').AsString+chr(160)+Result;
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
// ���������� ������ ������������ ���� � ������  ���+����+�� ���
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
{$IFDEF ADD_MENS_PU}
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
  //------------------ ������ ������� ������ -------------------
  if ft = ftMemo then begin
    if lFind or tbPropMemo.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
      Result := tbPropMemo.FieldByName('VALUE').AsString;
    end else begin
      Result := '';
    end;
  end else if (ft = ftBlob) or (ft = ftGraphic) then begin  // ��� �������� �����������
    {DONE 3 : ������ BLOB (���� �� ������ ) }
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
            LastError := '������ ������ ��������� '+strKodProp+#13+E.Message;
            Result := null;
          end;
        end;
      end;
    end else begin
      Result := null;
    end;
  end;
end;
{$ELSE}
begin
  Result:=null;
end;
{$ENDIF}

//-------------------------------------------------------------------------------
function TdmBase.ReadAllProp(dDateFiks: TDateTime;  nKodObj: Integer; var lErr: Boolean): TCurrentRecord;
{$IFDEF ADD_MENS_PU}
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
          LastError := '������ ������ ��������� '+Result[nCur].FieldName+#13+E.Message;
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
{$ELSE}
begin
end;
{$ENDIF}
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

              // ������������ ��� ������
              fld.Tag   := nTypeObj;
              {TODO 1 : ��������� ������ ������ ��������}
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
//--------------------------------------------------------------------------------------
function TdmBase.IsAdsSys(strUser:String) : Boolean;
begin
  Result:=(ANSIUpperCase(strUser)=SYSTEM_USER)
end;
//----------------------------------------------------------------------------------------------
function TdmBase.WriteValueProp(strKodProp:String; Value:Variant; DateFiks:TDateTime; nKodObj: Integer;
                                nTypeObj:Integer; nDataType:TFieldType) : Boolean;
{$IFDEF ADD_MENS_PU}
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
    if VarToStr(Value)='' then begin  // ���� �������� ��� ������ ������
      // ���� ��� ����, �� ������ ���
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
          PutError('������ ������ � ���� ��������� �������.' +Chr(13) +
                   ' ��.: <'+IntToStr(nKodObj)+'>  ��������: <'+strKodProp+'>   '+
                   ' ��������: <'+VarToStr(Value)+'>'+Chr(13)+Chr(13)+E.Message);
          tbPropMemo.Cancel;
        end;
      end;
    end;
  end else if (nDataType = ftBlob) or (nDataType = ftGraphic ) then begin
      {DONE 3 : ������ BLOB (���� �� ����� ) }
  end else begin
    lDelEmptyNum := false;
    if VarIsNull(Value) or VarIsEmpty(Value) then begin  // ���� �������� ��� ������ ������
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
          PutError(' ����������� ��� ��������: <'+strKodProp+'>' );
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
          PutError('������ ������ � ���� �������.' +Chr(13) +
                   ' ��.: <'+IntToStr(nKodObj)+'>  ��������: <'+strKodProp+'>   '+
                   ' ��������: <'+VarToStr(Value)+'>'+Chr(13)+Chr(13)+E.Message);
          tbProp.Cancel;
        end;
      end;
      if Result then begin
        // ������ ������ �����
        if lDelEmptyNum then tbProp.Delete;
      end;
    end;
  end;
end;
{$ELSE}
begin
  Result:=false;
end;
{$ENDIF}
//----------------------------------------------------------------------------------------------
function TdmBase.WriteFieldProp(DateFiks : TDateTime; strKodProp : String; fld : TField;
                  nKodObj: Integer; nTypeObj : Integer; nDataType : TFieldType): Boolean;
{$IFDEF ADD_MENS_PU}
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
    if fld.AsString='' then begin  // ���� �������� ��� ������ ������
      // ���� ��� ����, �� ������ ���
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
          PutError('������ ������ � ���� ��������� �������.' +Chr(13) +
                   ' ��.: <'+IntToStr(nKodObj)+'>  ��������: <'+strKodProp+'>   '+
                   ' ��������: <'+fld.AsString+'>'+Chr(13)+Chr(13)+E.Message);
          tbPropMemo.Cancel;
        end;
      end;
    end;
  end else if (nDataType = ftBlob) or (nDataType = ftGraphic ) then begin
      {DONE 3 : ������ BLOB (���� �� ����� ) }
  end else begin
    lDelEmptyNum := false;
      if fld.IsNull or (fld.AsString='') then begin  // ���� �������� ��� ������ ������
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
              PutError(' ����������� ��� ��������: <'+strKodProp+'>' );
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
            PutError('������ ������ � ���� �������.' +Chr(13) +
                     ' ��.: <'+IntToStr(nKodObj)+'>  ��������: <'+strKodProp+'>   '+
                     ' ��������: <'+fld.AsString+'>'+Chr(13)+Chr(13)+E.Message);
            tbProp.Cancel;
          end;
        end;
        if Result then begin
          // ������ ������ �����
          if lDelEmptyNum then tbProp.Delete;
        end;
      end;
    end;
  end;
{$ELSE}
begin
  Result:=false;
end;
{$ENDIF}

function TdmBase.WriteProp(DateFiks: TDateTime; nKodObj: Integer;  dsSource : TDataSet; strKodProp : String; nTypeObj : Integer ): Boolean;
{$IFDEF ADD_MENS_PU}
var
  vKeyValues : Variant;
  i : Integer;
  fld : TField;
  lDelEmptyNum : Boolean;
  procedure WriteOne;
  begin
    vKeyValues[2] := strKodProp;
    if (fld.DataType = ftMemo) or ((fld.DataType = ftString) and (fld.Size>30)) then begin
      if fld.AsString='' then begin  // ���� �������� ��� ������ ������
        // ���� ��� ����, �� ������ ���
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
            PutError('������ ������ � ���� ��������� �������.' +Chr(13) +
                     ' ��.: <'+IntToStr(nKodObj)+'>  ��������: <'+strKodProp+'>   '+
                     ' ��������: <'+fld.AsString+'>'+Chr(13)+Chr(13)+E.Message);
            tbPropMemo.Cancel;
          end;
        end;
      end;
    end else if (fld.DataType = ftBlob) or (fld.DataType = ftGraphic ) then begin
      {DONE 3 : ������ BLOB (���� �� ����� ) }
    end else begin
      lDelEmptyNum := false;
      if fld.IsNull or (fld.AsString='') then begin  // ���� �������� ��� ������ ������
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
              PutError(' ����������� ��� ��������: <'+strKodProp+'>' );
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
            PutError('������ ������ � ���� �������.' +Chr(13) +
                     ' ��.: <'+IntToStr(nKodObj)+'>  ��������: <'+strKodProp+'>   '+
                     ' ��������: <'+fld.AsString+'>'+Chr(13)+Chr(13)+E.Message);
            tbProp.Cancel;
          end;
        end;
        if Result then begin
          // ������ ������ �����
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
      // ����� ������ ���� ������� ���� ��������� �� �����. ���� (��. ������)
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
{$ELSE}
begin
  Result:=false;
end;
{$ENDIF}

function TdmBase.DeleteProp(DateFiks: TDateTime; nKodObj: Integer; strKodProp : String; ft : TFieldType) : Boolean;
{$IFDEF ADD_MENS_PU}
var
  vKeyValues : Variant;
begin
  Result := false;
  if nKodObj = -1 then begin // �������� � ���� ��������

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
      {DONE 3 : ������ BLOB (���� �� ����� ) }
    end else begin
      if tbProp.Locate('DATE_FIKS;ID;POKAZ', vKeyValues, []) then begin
        tbProp.Delete;
        Result := true;
      end;
    end;
  end;
end;
{$ELSE}
begin
  Result:=false;
end;
{$ENDIF}

//------------------------------------------------------------------------
function TdmBase.ReadPropSimpleDok(nTypeObj : Integer; nKodObj : Integer; DateSave : TDateTime; strKodProp : String; ft : TFieldType ) : Variant;
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
  //------------------ ������ ������� ������ -------------------
  if (ft = ftMemo) then begin
    if lFind or tbSimplePropMemo.Locate('TYPEOBJ;ID;DATES;POKAZ', vKeyValues, []) then begin
      Result := tbSimplePropMemo.FieldByName('VALUE').AsString;
    end else begin
      Result := '';
    end;
  end else if (ft = ftBlob) or (ft = ftGraphic) then begin  // ��� �������� �����������
    {DONE 3 : ������ BLOB (���� �� ������ ) }
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
            LastError := '������ ������ ��������� '+strKodProp+#13+E.Message;
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
function TdmBase.WritePropSimpleDok(nTypeObj:Integer; nKodObj:Integer; DateSave:TDateTime; strKodProp:String; fld:TField; sVal:String): Boolean;
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
  if sVal<>'' then begin      // �������� �������� �������� ������ ����
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
    if (fld.DataType = ftMemo) or ((fld.DataType = ftString) and (fld.Size>30)) then begin
      if fld.AsString='' then begin  // ���� �������� ��� ������ ������
        // ���� ��� ����, �� ������ ���
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
      {DONE 3 : ������ BLOB (���� �� ����� ) }
    end else begin
      lDelEmptyNum := false;
      if fld.IsNull or (fld.AsString='') then begin  // ���� �������� ��� ������ ������
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
            LastError := '������ ������ ��������� '+strKodProp+#13+E.Message;
            Result := false;
          end;
        end;
        if Result then begin
          tbSimpleProp.Post;
          // ������ ������ �����
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
// ���� �������������� ?
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
begin
  if FIdBase=-1 then begin
    Result:=-1;
    WorkQuery.Close;
    WorkQuery.SQL.Text:='SELECT id_base, count_sim FROM global';
    try
      WorkQuery.Open;
      s := ANSILowerCase(Trim(WorkQuery.Fields[0].AsString));
      if (s='') or (s='0') then begin
        Result:=0;
      end else begin
        Result:=StrToInt(s);
      end;
      FIdBase:=Result;
      if Result=0 then begin
        {$IFDEF GKH}
          if IsMainBase and IsDistributeBase then begin
            s := ANSILowerCase(Trim(WorkQuery.Fields[1].AsString));
            if (s='') or (s='0') then begin
              nCountZnak:=3;
            end else begin
              nCountZnak:=StrToInt(s);
            end;
          end else begin
            nCountZnak:=0;
          end;
        {$ELSE}
          nCountZnak:=0;
        {$ENDIF}
      end else begin
        s := ANSILowerCase(Trim(WorkQuery.Fields[1].AsString));
        if (s='') or (s='0') then begin
          nCountZnak:=3;
        end else begin
          nCountZnak:=StrToInt(s);
        end;
      end;
      FCountZnack:=nCountZnak;
    finally
      WorkQuery.Close;
    end;
  end else begin
    nCountZnak:=FCountZnack;
    Result:=FIdBase;
  end;
end;

//-----------------------------------------------------------
function TdmBase._CalcID(nID,nIdBase,nCountZn:Integer) : Integer;
begin
  // ������� 1    Id ���� ���������� �������
//  s:=PadLStr(tbAllDokums.FieldByName('NEWID').AsString,10-nCountZnak,'0');
//  Result:=StrToInt(IntToStr(nIdBase)+s);

  // ������� 2    Id ���� ���������� �����
  Result:=StrToInt(IntToStr(nID)+PadLStr(IntToStr(nIdBase),nCountZn,'0'));
end;
//-----------------------------------------------------------
function TdmBase.MaxID : Integer;
var
  strSQL:String;
begin
  Result:=-1;
  {$IFDEF OPEKA}
    strSQL:='';
    Result:=0;
  {$ELSE}
    {$IFDEF GKH}
      // ���� ���� ������� � ��� ��������������
      if IsMainBase and IsDistributeBase then begin
        strSQL:=LoadSQLEx('MAX_ID_BASE');
        strSQL:=StringReplace(strSQL, '&ID_BASE&', '0',[rfReplaceAll,rfIgnoreCase]);
      end else begin
        strSQL:=LoadSQLEx('MAX_ID');
      end;
    {$ELSE}
      {$IFDEF ZAGS}
        strSQL:='SELECT MAX(id) FROM �������������';
  {      'SELECT MAX(id) FROM '+chr(13)+
        '  ( SELECT MAX(id) id FROM ���������'+chr(13)+
        '      union all'+chr(13)+
        '    SELECT MAX(id) id FROM ������������'+chr(13)+
        '      union all'+chr(13)+
        '    SELECT MAX(id) id FROM ���������'+chr(13)+
        '      union all'+chr(13)+
        '    SELECT MAX(id) id FROM �������������'+chr(13)+
        ' ) m ';}
      {$ELSE}
        strSQL:=LoadSQLEx('MAX_ID');
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
  if strSQL<>'' then begin
    WorkQuery.SQL.Text := strSQL;
    WorkQuery.Open;
    Result := WorkQuery.Fields[0].AsInteger;
    WorkQuery.Close;
  end;
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
      PutError(' ������ ����������� �������������� ����. ');
    end else if nIdBase=0 then begin
      if IsMainBase and IsDistributeBase then begin  // ��� ��� � ����������� ����
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
      PutError(' ������ ����������� �������������� ����. ');
    end else if nIdBase=0 then begin
      tbAllDokums.Append;
      tbAllDokums.FieldByName('DATE_ADD').AsDateTime := dmBase.getCurDate;
      tbAllDokums.FieldByName('TYPEOBJ').AsInteger   := TypeObj;
      tbAllDokums.FieldByName('USERID').AsString     := UserId;
      tbAllDokums.Post;
      if IsMainBase and IsDistributeBase then begin  // ��� ��� � ����������� ����
        Result:=_CalcID(tbAllDokums.FieldByName('NEWID').AsInteger,0,nCountZnak);
      end else begin
        Result := tbAllDokums.FieldByName('NEWID').AsInteger;
      end;
    end else begin
//      PutError(' ������������� ���� �� ��������������. ');
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
      PutError(' ������ �������� ��������������. '+#13+E.Message);
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
   _TypeObj_DRast          : Result:='DECL_RAST'    ;
   _TypeObj_Alfavit        : Result:='ALFAVIT'      ;
   _TypeObj_Owners         : Result:='OWNERS'       ;
   _TypeObj_PasportTerr    : Result:='PASP_TERR'    ;    //20
   _TypeObj_Sovet          : Result:='SOVET'        ;
   _TypeObj_Ochered        : Result:='OCHERED'      ;
   _TypeObj_VUS            : Result:='VUS'          ;
   _TypeObj_Organ          : Result:='SPRORGAN'     ;
   _TypeObj_Obrach         : Result:='OBRACH'       ;
   _TypeObj_Spr            : Result:='SPR'          ;
   _TypeObj_ZAGS_AddDok    : Result:='ZAGS_ADDDOK'  ;
   _TypeObj_ZAGS_SPRAKT    : Result:='SPR_AKT'      ;
   _TypeObj_ZAGS_SprOtsut  : Result:='SPR_OTSUT'    ;    // ������� �� ���������� ������� ������
   _TypeObj_ZAGS_IzvOtsut  : Result:='IZV_OTSUT'    ;    // ��������� �� ���������� ������� ������  30
   _TypeObj_ZAGS_ZaklChName: Result:='ZAKL_CHNAME'  ;    // ���������� � �������� �����, �������
   _TypeObj_ZAGS_SprBrak   : Result:='SPR_BRAK'     ;    // ������� � ������ ���� � �����
   _TypeObj_ZAGS_SprRogd   : Result:='SPR_ROGD'     ;    // ������� � ������ ���� � ��������
   _TypeObj_ZAGS_SprSmert  : Result:='SPR_SMER'     ;    // ������� � ������ ���� � ������
   _TypeObj_ZAGS_SprChName : Result:='SPR_CHNAME'   ;    //
   _TypeObj_ZAGS_SprRast   : Result:='SPR_RAST'     ;    //
   _TypeObj_ZAGS_ZaklIzmAkt: Result:='ZAKL_IZMAKT'  ;    //  ���������� � ��������� ������� ������    37
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

function TdmBase.TypeObj_Sovet: Integer;  // ������ �����
begin Result := 19; end;

function TdmBase.TypeObj_PasportTerr: Integer;  // ������� ����������
begin Result := 20; end;

function TdmBase.TypeObj_Ochered: Integer;
begin Result := 21; end;

function TdmBase.TypeObj_Organ: Integer;    // ���������� ����������� (�������������)
begin Result := 22; end;

function TdmBase.TypeObj_Obrach: Integer;  // ��������� �������
begin Result := 23; end;

function TdmBase.TypeObj_VUS: Integer;
begin Result := 24; end;

function TdmBase.TypeObj_DeclareRegistr: Integer;      // ��������� �� �����������
begin Result := 25; end;

function TdmBase.TypeObj_RasxNaklSvid: Integer;     // ��������� ��������� ������������� � ������������
begin Result:=26 end;
function TdmBase.TypeObj_AktSpisSvid : Integer;
begin Result:=27 end;
function TdmBase.TypeObj_AktNalichSvid : Integer;
begin Result:=28 end;
function TdmBase.TypeObj_VidGit: Integer;   // ��� �� ����������
begin Result := 29; end;

// 32 .. 49 ������

function TdmBase.TypeObj_ZAGS_AddDok: Integer;
begin begin Result:=50 end; end;
function TdmBase.TypeObj_ZAGS_SprAkt:Integer;          // ������� � ������ ���� ��. ���������
begin Result:=51 end;
function TdmBase.TypeObj_ZAGS_SprOtsut:Integer;        // ������� �� ���������� ������� ������
begin Result:=52 end;
function TdmBase.TypeObj_ZAGS_IzvOtsut:Integer;        // ��������� �� ���������� ������� ������
begin Result:=53 end;
function TdmBase.TypeObj_ZAGS_ZaklChName:Integer;      // ���������� � �������� �����, �������
begin Result:=54 end;
function TdmBase.TypeObj_ZAGS_SprBrak:Integer;         // ������� � ������ ���� � �����
begin Result:=55 end;
function TdmBase.TypeObj_ZAGS_SprRogd:Integer;         // ������� � ������ ���� � ��������
begin Result:=56 end;
function TdmBase.TypeObj_ZAGS_SprSmert:Integer;        // ������� � ������ ���� � ������
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
//---------------------------------------------------------------------------------------
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
//  strType[1]- ��������������
//     0 �������
//     1 ��������������
//     2 �������� �������������
//  strType[2]- ���� ��������
//     0 �������
//     1 ���������
//     2 ������
//  strType[3]- ��������������� �� ���������� ��������� ������
//     0 �������
//     1 ���������������
//     2 �� ���������������
//   ���� ���� ';'  �� ���� ����������� �� ��������
function TdmBase.CountMensEx( DateFiks : TDateTime; strLicID : String; strType : String; slPar:TStringList): Integer;
var
  c1,c2,c3 : Char;
  lOk1,lOk2,lOk3,lVozr,lOk : Boolean;
  i,j:Integer;
  nVozr1,nVozr2,nVozr:Integer;
  s,ss:String;
begin
  Result := 0;
  if strLicID<>'' then begin
    tbMens.CancelRange;
    tbMens.IndexName := 'LIC_KEY';
    try
      lVozr:=false;
      nVozr1:=-1;
      nVozr2:=-1;
      i:=Pos(';',strType);
      if i>0 then begin  // ������� �������: 000;0#18
        s:=Copy(strType,i+1,Length(strType));
        strType:=Copy(strType,1,i-1);
        if s<>'' then begin
          lVozr:=true;
          j:=Pos('#',s);
          if j=0 then begin
            nVozr1:=StrToInt(s);
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
                nVozr:=GetCountYear(GetCurDate,tbMens.FieldByName('DATER').AsDateTime);
                if nVozr1=-1 then begin
                  if (nVozr>=0) and (nVozr<=nVozr2) then lOk := true;
                end else if nVozr2=-1 then begin
                  if (nVozr>=nVozr1) then lOk := true;
                end else begin
                  if (nVozr>=nVozr1) and (nVozr<=nVozr2) then lOk := true;
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

//----------------------------------------------------------
function TdmBase.CountMens2Where(DateFiks : TDateTime; nType:Integer; strType : String; slPar:TStringList): String;
var
  c1,c2,c3 : Char;
  j,i,nVozr1,nVozr2:Integer;
  s,ss,sAl:String;
begin
  nVozr1:=-1;
  nVozr2:=-1;
  sAl:='';
  if nType=0 then begin // �� �������� �����
    c1:=strType[1];     //        present
    c2:=strType[2];     //        propis
    c3:='0';            //        datepropis
  end else begin        // �� ���������� �����
    c1:=strType[1];     //        present
    c2:=strType[3];     // !!!    propis
    c3:=strType[2];     // !!!    datepropis
  end;
  if slPar<>nil then begin
    for i:=0 to slPar.Count-1 do begin
      //------ ����������� �� �������� ------------------
      if slPar.Names[i]='VOZR' then begin
        s:=slPar.ValueFromIndex[i];
        j:=Pos('-',s);
        if j=0 then begin
          nVozr1:=StrToInt(s);
          nVozr2:=StrToInt(s);
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
    if (nVozr1=nVozr2) then begin
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
//  strType[1]- ��������������
//     0 �������
//     1 ��������������
//     2 �������� �������������
//  strType[2]- ���� ��������
//     0 �������
//     1 ���������
//     2 ������
function TdmBase.CountMensAdres( DateFiks : TDateTime; strAdresID : String; strType : String; slPar:TStringList): Integer;
var
  c1,c2 : Char;
  lOk1,lOk2,lOk : Boolean;
  nVozr,nVozr1,nVozr2:Integer;
  i,j:Integer;
  s:String;
begin
  Result := 0;
  if strAdresID<>'' then begin
    tbMens.CancelRange;
    tbMens.IndexName := 'ADRES_KEY';
    nVozr1:=-1;
    nVozr2:=-1;
    if slPar<>nil then begin
      for i:=0 to slPar.Count-1 do begin
        //------ ����������� �� �������� ------------------
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

// ������� �������� � �������� �����
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
  if strCaption='' then strCaption:='�������� ��������';
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
            s := s + ', ' + IntToStr(YearOf(tbMens.FieldByName('DATER').AsDateTime))+'�.�. ';
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
function TdmBase.CheckDeleteMen(DateFiks : TDateTime; nId : Integer; var strErr : String; strFIO:String) : Boolean;
begin
  Result:=true;
end;

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
      // ����
      0: lOk:=true;
      // ��������� ��������� �������
      1: lOk:=(dmBase.SprNames.FieldByName('HANDLED').IsNull or (dmBase.SprNames.FieldByName('HANDLED').AsBoolean=false));
      // ��������� ��������� ������� � ��� ����
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
begin
  if (ds.FindField('NOMER')<>nil) and (ds.FindField('DATEZ')<>nil) then
    GlobalTask.WriteToLogFile(FormatDateTime('dd.mm.yyyy hh:mm ',dmBase.getCurDate)+'�������� �/� '+GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_FULL').Naim(nTypeObj,false)+
        ' �'+ds.FieldByName('NOMER').AsString+' �� '+FormatDateTime('dd.mm.yyyy',ds.FieldByName('DATEZ').AsDateTime));
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

function TdmBase.InfoForDelete(ds:TDataSet; nTypeObj:Integer; lDokZags:Boolean):String;
var
  nIdOrg:Integer;
  s:String;
begin
  case nTypeObj of
    _TypeObj_Opeka  :  Result:=SeekValueList('KEY_OPEKA_VID', ds.FieldByName('VID').AsString, false)+' '+createFIO(ds,'')+
       '  ��:'+ds.FieldByName('IDENTIF').AsString+' ���.:'+DatePropis(ds.FieldByName('DATEZ').AsDateTime,3)+' ���.:'+DatePropis(ds.FieldByName('DATE_OTM').AsDateTime,3);
  end;
end;

//------------------------------------------------------------------------------
function TdmBase.DeleteDokument(ds: TDataSet; nTypeObj: Integer; lIgnoreCheck:Boolean) : Boolean;
var
  sKomm,sID:String;
  fldID:TField;
  function SeekID(tb:TDataSet):Boolean;
  begin
    if (sID=tb.FieldByName('ID').AsString) or tb.Locate('ID', sID, [])
      then Result:=true
      else Result:=false;
  end;
begin
  LastErrorDelete:='';
  Result := true;
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
  if nTypeObj = _TypeObj_Opeka then begin
    if SeekID(tbZapisOpeka) then begin
      sKomm:=InfoForDelete(tbZapisOpeka, _TypeObj_Opeka, false);
      tbZapisOpeka.Delete;
      DeletePropSimpleDok(sID, _TypeObj_Opeka);
      AppendToDelObjEx(_TypeObj_Opeka, sID, ds.FieldByName('DATEZ').AsDateTime, -1, sKomm);
    end;
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
    WorkQuery.SQL.Add('DELETE FROM ��������� WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
    WorkQuery.SQL.Add('DELETE FROM ������������������� WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
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
function TdmBase.DeletePropSimpleDok(strID : String; nTypeDok : Integer) : Boolean;
begin
  Result := true;
  if (strID<>'') and (nTypeDok > 0) then begin

    tbSimpleProp.IndexName := 'PR_KEY';
    tbSimpleProp.SetRange([nTypeDok,strID],[nTypeDok,strID]);
    tbSimpleProp.First;
    while not tbSimpleProp.Eof do begin
      tbSimpleProp.Delete;
    end;
    tbSimpleProp.CancelRange;

    tbSimplePropMemo.IndexName := 'PR_KEY';
    tbSimplePropMemo.SetRange([nTypeDok,strID],[nTypeDok,strID]);
    tbSimplePropMemo.First;
    while not tbSimplePropMemo.Eof do begin
      tbSimplePropMemo.Delete;
    end;
    tbSimplePropMemo.CancelRange;

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
//  tbBigHouse.Delete;
end;

//---------------------------------------------------------------------------
// �������� ������
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
      PutError('�� �������� ������ ���������� ������� ���� � '+tbLich.FieldByName('NOMER').AsString+' !');
    end;
    tbLich.IndexName:='PR_KEY';
    if Result then begin
      tbMens.IndexName:='ADRES_KEY';
      if tbMens.FindKey([DateFiks,strID]) then begin
        Result := false;
        s := Trim(tbMens.FieldByName('FAMILIA').AsString)+' '+Trim(tbMens.FieldByName('NAME').AsString)+' '+
             Trim(tbMens.FieldByName('OTCH').AsString);
        PutError('�� �������� ������ ���������: ' + s + ' !');
      end;
      tbMens.IndexName:='PR_KEY';
    end;
    {$IFDEF OBR_GRAG}
    if Result then begin
      if fmMain.DocRecord.CanDeleteAdr(StrToInt(strId),s) then begin
        PutError(s);
        Result:=false;
      end;
    end;
    {$ENDIF}
    if Result then begin
      tbAdres.IndexName:='PR_KEY';
      if tbAdres.FindKey([DateFiks,strID]) then begin
        adr := AdresForSeek(tbAdres);
      end;
      WorkQuery.Close;
      WorkQuery.SQL.Clear;
      WorkQuery.SQL.Add('DELETE FROM ��������� WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
      WorkQuery.SQL.Add('DELETE FROM HouseProps WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
      WorkQuery.SQL.Add('DELETE FROM HouseOwners WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
      WorkQuery.SQL.Add('DELETE FROM HouseOwnersHist WHERE id='+strID+';');
      try
        WorkQuery.ExecSQL;
        //------- ���� ������� ������ ��� �� ������ � ��� ---------------
        if not FindAdres(DateFiks, StrToInt(adr.Punkt), adr.UlicaInt, adr.Dom, adr.Korp, '{---}', -1) then begin
          if FindBigHouse(adr, DateFiks) then begin
             DeleteBigHouse;
          end;
        end;
        //------ ���� ���� ���. ����� �� ������ -----------
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
        //------ ���� ���� ���������  ������ -----------
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
// �������� �������� � ��������� �����
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
    WorkQuery.SQL.Add('UPDATE ��������� SET vus=false WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
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
      DeletePropSimpleDok(strID, TypeObj_VUS);
  end;
end;

//---------------------------------------------------------------------------
// �������� �������� �� �������
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
    WorkQuery.SQL.Add('UPDATE ��������� SET ochered=false WHERE date_fiks='+QStr(strDate)+' and id='+strID+';');
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
// �������� ��������
//---------------------------------------------------------------------------
function TdmBase.DeleteMen(DateFiks : TDateTime; strID : String; lCheckDel : Boolean; lIgnoreCheck:Boolean) : Boolean;
begin
  Result := false;
end;

//---------------------------------------------------------------------------
// �������� �������� �����
//---------------------------------------------------------------------------
function TdmBase.DeleteLich(DateFiks : TDateTime; strID : String) : Boolean;
begin
  Result := false;
end;

//---------------------------------------------------------------
procedure TdmBase.AppendToDelObj(DateFiks: TDateTime; strID: String; nTypeObj : Integer; ds:TDataSet; strKomm:String);
begin
  tbDelObj.Append;
  tbDelObj.FieldByName('TYPEOBJ').AsInteger    := nTypeObj;
  tbDelObj.FieldByName('DEL_ID').AsString      := strID;
  tbDelObj.FieldByName('DATE_FIKS').AsDateTime := DateFiks;
  tbDelObj.FieldByName('DATE_DEL').AsDateTime  := dmBase.getCurDate; //GlobalTask.CurrentDate;
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
// !!! ��� ������ ��� �������(���������,�����,���.�����) � �������� DateDok(DateFiks)=0 (31.12.1899) ����� ����������� �������� !!!
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
    GlobalTask.WriteToLogFile('������ ������ ���������� �� �������� ('+IntToStr(nTypeObj)+','+strID+')  '+strKomm);
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
    GlobalTask.WriteToLogFile('������ ������ ���������� � ������������� ('+IntToStr(nTypeObj)+','+InttoStr(nID)+')  '+strKomm);
  end;
end;
//---------------------------------------------------------------
procedure TdmBase.DeleteFromList(tb: TAdsTable; DateFiks: TDateTime; ID: Integer);
begin
  tb.IndexName:='PR_KEY';
  while tb.FindKey([DateFiks,ID]) do tb.Delete;
end;
//---------------------------------------------------------------
function TdmBase.NameSostFromDate(DateFiks: TDateTime): String;
begin
  if dateFiks = GetDateCurrentSost then begin
    Result := '������� ���������';
  end else begin
    Result := FormatDateTime('��������� �� dd.mm.yyyy �.',DateFiks);
  end;
end;

//---------------------------------------------------------------
// ������� ����� ��������� ���� �� ��������
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
{$IFNDEF ZAGS}
  Result := true;
  WorkQuery.Active := false;
  WorkQuery.DatabaseName := 'AdsConnection';
  if lCreateCur then begin  // ���������� ������� ��������� ���� �� �������
    strSQL := 'SELECT Count(*) kolvo FROM ������������'+
                  ' WHERE date_fiks='+QStr(DTOS(DateFiks, tdAds));
    WorkQuery.SQL.Text := strSQL;
    WorkQuery.Open;
    // ���� ��������� �������
    if WorkQuery.Fields[0].AsInteger > 0 then begin
      strDateCur := QStr( DTOS( DateFiks, tdAds ) );
      strDateNew := QStr( DTOS( GetDateCurrentSost, tdAds ) );
      lOk  := false;
      lDel := true;  // ���������� �������� ������� ��������� ����
//      if Problem(' ����������� ������� ��������� ���� �� ��������� �� 1 ������ '+
//                 Copy(DTOS(DateFiks,tdAds),1,4)+' ���� ? ') then begin
        if Problem('  �� ������� ?  ') then begin
          lOk := true;
        end;
//      end;
    end else begin
      lDel := false;
      ShowMessage(' ����������� ��������� ���� �� 1 ������ '+Copy(DTOS(DateFiks,tdAds),1,4)+' ����. ');
      lOk := false;
    end;
  end else begin            // ������� ����� ��������� �� ��������
    strDateCur := QStr( DTOS( GetDateCurrentSost, tdAds ) );
    strDateNew := QStr( DTOS( DateFiks, tdAds ) );
    strSQL := 'SELECT Count(*) kolvo FROM ������������'+
                  ' WHERE date_fiks='+QStr(DTOS(DateFiks, tdAds));
    WorkQuery.SQL.Text := strSQL;
    WorkQuery.Open;
    lOk  := true;
    lDel := false;
    // ���� ��������� ��� �������
    if WorkQuery.Fields[0].AsInteger > 0 then begin
      lOk  := false;
      lDel := true;
      if Problem(' ��������� ���� �� 1 ������ '+Copy(DTOS(DateFiks,tdAds),1,4)+' ����������. '+
          #13 + ' ������������ ? ') then begin
        if Problem('  �� ������� ?  ') then begin
          lOk := true;
        end;
      end;
    end;
  end;
  if lOk then begin
    WorkQuery.Active := false;
    {$IFNDEF DEBUG}
    if lCreateCur
      then GlobalTask.WriteToLogFile('�������� �������� ��������� ���� �� ��������� �� 1 ������ '+Copy(DTOS(DateFiks,tdAds),1,4)+' ����')
      else GlobalTask.WriteToLogFile('�������� ��������� ���� �� 1 ������ '+Copy(DTOS(DateFiks,tdAds),1,4)+' ����');
    if lCreateCur
      then OpenMessage( '�������� �������� ��������� ���� �� ��������� �� 1 ������ '+Copy(DTOS(DateFiks,tdAds),1,4)+' ����', '')
      else OpenMessage( '�������� ��������� ���� �� 1 ������ '+Copy(DTOS(DateFiks,tdAds),1,4)+' ����', '');
    {$ENDIF}
    try
      if not lCreateCur then begin
        if not lDel then begin // ���� ������ �� ����������
          strSQL := 'INSERT INTO ������������ (date_fiks) VALUES ('+strDateNew+')';
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
            PutError('������: '+E.Message);
            Result := false;
            break;
          end;
        end;
        WorkQuery.Active := false;
        Application.ProcessMessages;
      end;
      if Result and not lCreateCur then begin
        WorkQuery.Active := false;
        //-------- �� ������ ������ ������ ��������� ������� ---------------------------------------------------
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
        //----- ������ ������� ����� ������������� � ������� ������ ��� ������ ����� ������� ���� �������� ------
        strNotDropMens := 'select distinct id into #temp_mens from '+#13+
                          ' ( select distinct id as id from ��������� n '+#13+
                          '     where n.date_fiks='+strDateCur+' and n.candelete is not null and n.candelete=true '+#13+
                          '           and ( n.notdelete=true  or '+#13+
                          '                 (dates is not null and dates>='+strDateNew+') or '+#13+
                          '                 (datev is not null and datev>='+strDateNew+') ) '+#13+
                          '     union all  '+#13+
                          '   select id from vus '+#13+ // 'ubit_date is null or ubit_date<=' ������ ������� ��������� �� ����� ���
                          '     union all  '+#13+
                          '   select id from ochered '+#13+  // 'iskl is null or iskl=false or isk_date<='  ������ ������� ��������� � ������� �� ���������
                          '     union all  '+#13+
                          '   select distinct kod as id from houseowners h '+#13+
                          '   left join ��������� n on n.date_fiks='+strDateCur+' and n.id=h.kod '+#13+
                          '     where h.date_fiks='+strDateCur+' and '+#13+
                          '       ( h.datep is null or h.datep>='+strDateNew+') '+#13+     // (���� ��) ������ ��� ������ ��� ���� ��������� - ���� �� �������
                          ' ) aaa ';
// ����
//                          '   select distinct kod as id from houseowners h '+#13+
//                          '   left join ��������� n on n.date_fiks='+strDateCur+' and n.id=h.kod '+#13+
//                          '     where h.date_fiks='+strDateCur+' and '+#13+
//                          '       (n.dates is null or (h.datep is not null and h.datep>='+strDateNew+')) and '+#13+
//                          '           n.candelete is not null and n.candelete=true '+#13+
//                          ' ) aaa ';
        WorkQuery.SQL.Text := strNotDropMens;
        WorkQuery.VerifySQL;
        WorkQuery.ExecSQL;
        Application.ProcessMessages;
        //----- ������ ������� ������� ����� �� ������� ���� ����, ������� ������ ������� -----------------------
        strNotDropLic := ' select lic_id as id into #temp_lic from '+#13+
                         ' ( select distinct lic_id from ��������� n '+#13+
                         '    where id in (select id from #temp_mens) '+#13+
                         ' ) bbb ';
        WorkQuery.SQL.Text := strNotDropLic;
        WorkQuery.VerifySQL;
        WorkQuery.ExecSQL;
        Application.ProcessMessages;
        //-------------------------------------------------------------------------------------------------------

        for i:=0 to Relations.Count-1 do begin
          Rel := Relations.Item[i];
          WorkQuery.SQL.Text := 'DELETE FROM ���������';
          WorkQuery.ExecSQL;
          strSQL := 'INSERT INTO ��������� (ID) SELECT ID FROM "'+Rel.MainTable.TableName+'" WHERE '+
                    'date_fiks='+strDateCur+' and candelete is not null and candelete=true';
          if Rel.Kod='MENS' then begin
            strSQL := strSQL + ' and ID NOT IN (SELECT ID FROM #temp_mens)';
          end else if Rel.Kod='LICH' then begin
            strSQL := strSQL + ' and ID NOT IN (SELECT ID FROM #temp_lic)';
          end;
          WorkQuery.SQL.Text := strSQL;
          WorkQuery.ExecSQL;
          WorkQuery.Active := false;
          WorkQuery.SQL.Text := 'SELECT Count(*) FROM ���������';
          WorkQuery.Active := true;
          if WorkQuery.Fields[0].AsInteger>0 then begin
            WorkQuery.Active := false;
            for j:=0 to Rel.Count-1 do begin
              strSQL := 'DELETE FROM "'+Rel.Item[j].TableName+'" WHERE '+
                        'date_fiks='+strDateCur+' and ID IN (SELECT ID FROM ���������)';
              WorkQuery.SQL.Text := strSQL;
              WorkQuery.VerifySQL;
              WorkQuery.ExecSQL;
//              ShowMessage(Rel.MainTable.TableName+#13+strSQL);
            end;
            // ������ �� ������� ������: ��� ���� DATE_FIKS    (��� ��������: Ochered,SostavSem,VUS)
            { TODO -c������������ : �������������� }
            for j:=0 to Rel.CountSimpleTable-1 do begin
              strSQL := 'DELETE FROM "'+Rel.SimpleTable(i).TableName+'" WHERE ID IN (SELECT ID FROM ���������)';
              WorkQuery.SQL.Text := strSQL;
              WorkQuery.ExecSQL;
//              ShowMessage(Rel.MainTable.TableName+#13+strSQL);
            end;

            strSQL := 'DELETE FROM "'+Rel.MainTable.TableName+'" WHERE '+
                      'date_fiks='+strDateCur+' and ID IN (SELECT ID FROM ���������)';
            WorkQuery.SQL.Text := strSQL;
//            ShowMessage('�������� �� ������� ������: '+#13+strSQL);
            WorkQuery.VerifySQL;
            WorkQuery.ExecSQL;
//               WorkQuery.SQL.Text := strSQL;
//               WorkQuery.ExecSQL;
          end;
          Application.ProcessMessages;
          WorkQuery.Active   := false;
        end;
        //------ �������� �� ������ ���������� ����� ��������� � ������� "���������"------
        strSQL := 'delete from houseowners where kod in '+chr(13)+
                  ' ( select h.kod '+chr(13)+
                  '  from houseowners h '+chr(13)+
                  '  left join ��������� n on n.date_fiks='+strDateCur+' and n.id=h.kod '+chr(13)+
                  '  where h.date_fiks='+strDateCur+' and n.id is null and typekod=1)  ';
        WorkQuery.SQL.Text := strSQL;
        WorkQuery.VerifySQL;
        WorkQuery.ExecSQL;
        Application.ProcessMessages;
        //---------------------------------------------------------------------------------
      end;
      GlobalTask.WriteToLogFile('�������� ������� ���������.');
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
  strSQL := 'SELECT Count(*) kolvo FROM ������������'+
                ' WHERE date_fiks='+QStr(DTOS(DateFiks, tdAds));
  WorkQuery.SQL.Text := strSQL;
  WorkQuery.Open;
  lOk := true;
  // ���� ��������� ���
  if WorkQuery.Fields[0].AsInteger = 0 then begin
    lOk  := false;
    ShowMessage(' ��������� ���� �� 1 ������ '+Copy(DTOS(DateFiks,tdAds),1,4)+'���� �� ����������. ');
  end;
  WorkQuery.Active := false;
  if lOk then begin
    GlobalTask.WriteToLogFile('�������� ��������� ���� �� 1 ������ '+Copy(DTOS(DateFiks,tdAds),1,4)+' ����');
    OpenMessage( '�������� ��������� ���� �� 1 ������ '+Copy(DTOS(DateFiks,tdAds),1,4)+' ����', '');
    try
      WorkQuery.Active := false;
      strSQL := 'DELETE FROM ������������ WHERE date_fiks='+strDateDel;
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
            PutError('������: '+E.Message);
            Result := false;
          end;
        end;
        WorkQuery.Active := false;
        if not Result then break;
      end;
      if Result then begin
        //------ �������������� �������� �� �� ������������ ������ ----------------
        SetLength(arrSQL,1);
        arrSQL[0] := 'DELETE FROM ������������ WHERE id NOT IN (SELECT id FROM ��������� )';
        for i:=0 to Length(arrSQL)-1 do begin
          try
            WorkQuery.SQL.Text := arrSQL[i];
            WorkQuery.ExecSQL;
          except
            on E:Exception do begin
              PutError('������: '+E.Message);
              Result := false;
            end;
          end;
          if not Result then break;
        end;
      end;
      //-------------------------------------------------------------------------
      if Result then
        GlobalTask.WriteToLogFile('�������� ������� ���������.');
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
  strSQL := 'SELECT TOP 1 date_fiks FROM ������������'+
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
begin
  Result:='';
end;

//-----------------------------------------------------------------------------
function TdmBase.getMenDolg(DateFiks:TDateTime; strID:String): String;
begin
  Result:='';
end;

function TdmBase.getMenDvig(DateFiks: TDateTime; strID,  strRazd: String): String;
begin
  Result:='';
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
//    Result := '������� ';
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
      s := FormatDateTime('dd.mm.yyyy',VarToDateTime(v))+'�.';
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
    Result.UdostB:= GetNamePasport(n,'�');
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
begin
  Result := false;
end;

//-----------------------------------------------------------------------------
function TdmBase.VozvratMen(DateFiks: TDateTime; nIdMen: Integer; DateVozvrat : TDateTime; var strSoob:String) : Boolean;
begin
  Result := false;
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
// �������� ��� �������� �������
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
                  PutError(' ������ �������� ���������� �������: '+Table.TableName+
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

// ���� � �������� �� ���� �������� �� Result.TypeMigr=-1
function TdmBase.LastDvigMen(DateFiks: TDateTime;  strID: String): TLastDvig;
begin
  Result.MenID := '';
  Result.DateFiks := DateFiks;
  Result.TypeMigr := -1;
  FLastDvigMen := Result;
end;

//----------------------------------------------------------
function TdmBase.LastDvigMenS( strID: String; sType:String ): String;
begin
  Result := '';
end;
//--------------------------------------------------------------------------------------------------------
// ��� ������ ������� AddAdres � AddAdres2 ����������� ������������� adr.NotDom � adr.NameHouse !!!
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

  // ����� � ������
  sRnGor:='null';
  {$IFDEF GKH}
    if adr.RnGor>0 then begin
      sRnGor:=IntToStr(adr.RnGor);
    end;
  {$ENDIF}

  adr := AdresForSeek2(adr.PunktKod, adr.UlicaInt, strDom, strKorp, strKv, lNotDom);
  adr.NameHouse:=sNameHouse;

  // ���� ��� ���� � ���� BigHouse
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
      WorkQuery.SQL.Text := 'INSERT INTO ��������� (DATE_FIKS,ID,PUNKT,UL,DOM,KORP,KV,DOM1,DOM2,NOT_DOM,RAION)'+#13+
            ' VALUES ( '+
            ''''+DTOS(DateFiks,tdAds)+''''+','+    // Date_Fiks
            IntToStr(nNewId)+','+                     // Id
            IntToStr(adr.PunktKod)+','+ // Punkt
            strUL+','+        // �����
            strDOM+','+       // ���
            strKORP+','+      // ������
            strKV +','+       // ��������
            strDOM1+','+      // ���1
            strDOM2+','+      // ���2
            sNotDom+','+      // ��� ������ ����
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

//   0 - ��� Ok!
//   1 - ����� ��� ����������
//  -1 - ������ ��������
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

//   0  - ��� Ok!
//   1  - ����� ��� ����������
//   10 - ����� �� ����. �����
//  -1  - ������ ��������
//--------------------------------------------------------------------------------------------------------
function TdmBase.AddAdres(DateFiks : TDateTime; adr:TAdres;  var nNewID : Integer; var strErr : String) : Integer;
begin
  Result:=0;
  nNewID:=-1;
  Adres_SpecUch:=false;
  if EnableNotDom and adr.NotDom then begin  // ���� ��� ������ ����, �� � ������� ������
                      
  end else begin
    if FindAdres(DateFiks, adr.PunktKod, adr.UlicaInt, adr.Dom, adr.Korp, adr.Kv) then begin
      nNewID:=Adres_ID;
      strErr:='  ��������� ����� ��� ���������� !  ';
      Result:=1;
      if Adres_SpecUch then begin
        Result:=10;
        strErr:=' ��������� ����� ������� �� ����������� ����� ! ';
      end;
    end;
  end;
  if Result=0 then begin
    nNewId := GetNewID( dmBase.TypeObj_Adres );
    if nNewId <> -1 then begin
      if not AddAdres2(DateFiks,nNewID,adr,strErr) then Result:=-1;
    end else begin
      Result:=-1;
      strErr:='  ���������� ������� ����� �������������.  ';
    end;
  end;
end;

//--------------------------------------------------------------------------------------------------------
function TdmBase.ChangeAdres(DateFiks: TDateTime; nID : Integer; oldAdres,newAdres : TAdres; var strErr:String) : Boolean;
begin
  Result := false;
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
  Result := 'SELECT ID,TIP,IFNULL(SPEC_UCH,false) SPEC_UCH FROM ��������� '+#13+
       'WHERE '+
       'date_fiks=' + '''' + DTOS(DateFiks,tdAds) + '''' + ' and ' +
       'punkt=' + IntToStr(nPunkt) + ' and ' + strUL + ' and ' +
       strDOM +' and '+ strKorp + strKv;
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
      if WorkQuery.FieldByName('TIP').AsInteger=1 then begin  // �����
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
    if StrToInt(strUlica)<1 then begin  // ���� 0 ��� -1
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
    if StrToInt(strUlica)<1 then begin  // ���� 0 ��� -1
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
function TdmBase.InitHouseProp(DateFiks: TDateTime; nPunkt, nUL: Variant;
                strDom, strKorp : String; nID : Integer): Boolean;
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
  if strNameLat='' then begin  // ������ ��������
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
  end else begin             // ����� ��������
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
begin
  if FileExists(strDir) then begin
    Result := true;
  end else begin
    Result := false;
  end;
end;

function TdmBase.ProcessDatabaseError: Boolean;
var
  strDir, strPath : String;
begin
  Result := false;
  strPath := ANSIUpperCase(CheckSleshN(ExtractFilePath(Application.ExeName)));
  if LastDatabaseError = -1 then begin // AdsConnection.ConnectPath �� ������
    if Problem('  �� ������ ���� ����������� � ���� ������. ���������� ��� �������������� ? ') then begin
       if SelectDirectory('���� � ���� ������', '', strDir) then begin
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
  end else if  LastDatabaseError = -2 then begin // AdsSharedConnection.ConnectPath �� ������
    if Problem('  �� ������ ���� ����������� � ��������� ������������. ���������� ��� �������������� ? ') then begin
       if SelectDirectory('���� � ���� ������', '', strDir) then begin
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
  // �������� �������� ��� ����� ���������� � ������� CheckPathBase ��. ����
  Result := true;
//  GlobalTask.PathParam := CheckSleshN(CheckSleshN(ExtractFilePath(Application.ExeName))+'SERVICE');
  {$IFDEF ZAGS}
//    GlobalTask.NameFileTaskParameters := 'ParamZags.tsk';
  {$ELSE}
//    GlobalTask.NameFileTaskParameters := 'Parameters.tsk';
  {$ENDIF}
end;

//--------------------------------------------------------------------------------------
function TdmBase.CheckPathBase : Boolean;
var
 s,s0,s1,s2,ss,sss : String;
 lExit, lWrite, lLocal : Boolean;
 strPath, strDir : String;
 strMainVersion,strVErsion : String;
 MainINI, AdsINI : TSasaIniFile;
 strIP, strPORT, strNameComp : String;
 arr : TArrStrings;
 i,nVersion,nMainVersion : Integer;
begin
  Result := true;
  strPath := ANSIUpperCase(CheckSleshN(ExtractFilePath(Application.ExeName)));
  s := dmBase.IniSysParams.ReadString('ADMIN','MAINCOMP', '1');
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
        if SelectDirectory('�������� ����� � ���������� �� ������ ����������', '', strDir) then begin

          s0 := CheckSleshN(strDir) + 'Data\'+NAME_DICT;  // � ���� ���� �� ���

          s1 := CheckSleshN(strDir) + 'Spr\SysSpr.add';
          s2 := CheckSleshN(strDir) + 'Service';
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
            PutError(' ��������� ����� �� �������� ���������� ! ');
          end;
        end else begin
        {
          if Problem('����� ���� � ���� ?') then begin
            OpenMessage('��������� ����������...','',10);
            sl:=FindBase('', 'AutoBackup,Backup,AutoBackup2', true);
            if sl.Count=0 then begin
              PutError('������ �� �������.');
            end else begin
              i:=ChoiceFromList(sl,'�������� ����');
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
      i := LastPos('\Data\',strDir);
      strDir := Copy(strDir,1,i);
      //--- ������ ��������� � ��������� ���������� -----------------------------
      {$IFNDEF DEBUG}
      if FileExists(strDir+'version') then begin
        if MemoRead(strDir+'version', strMainVersion) then begin
          if strMainVersion<>'' then begin
            strVersion := GetVersionProgram(5);
            try
              nVersion     := StrToInt(StringReplace(strVersion,'.','',[rfReplaceAll]));
              nMainVersion := StrToInt(StringReplace(strMainVersion,'.','',[rfReplaceAll]));
            except
              nVersion     := 0;
              nMainVersion := 0;
            end;
            if nMainVersion>nVersion then begin
              PutError('��������: ���������� ��������� ����������!'+Chr(13)+
                       '������ ��������� <'+strVersion+'> �� ��������� � ������� <'+strMainVersion+'>'+Chr(13)+
                       '�� ������� ���������.');
              if FileExists(strDir+'LastUpdate\LastUpdate.exe') then begin
                if Problem('��������� ��������� ���������� � �������� ���������� ?') then begin
                  WinExec(PAnsiChar(strDir+'LastUpdate\LastUpdate.exe'),SW_NORMAL);
                end;
              end;
              Result := false;
            end else if nMainVersion<nVersion then begin
              PutError('��������: ���������� ��������� ���������� �� ������� ���������� !'+Chr(13)+
                       '������ ��������� <'+strVersion+'> �� ��������� � ������� <'+strMainVersion+'>'+Chr(13)+
                       '�� ������� ���������.');
              Result := false;
            end;
          end;
        end;
      end;
      {$ENDIF}
      //--- ��������� ��� ������� � ��������� ���������� -----------------------------
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
            if FileExists(strDir+'shtamp_gerb.doc') then begin
              CopyFile(PChar(strDir+'shtamp_gerb.doc'), PChar(NameFromExe('shtamp_gerb.doc')),false);
            end;
          end;

          MainINI := TSasaIniFile.Create(strDir+'SysParams.ini');
          ss  := MainINI.ReadString('ADMIN','SERVERTYPES', 'LOCAL');
          if Pos('LOCAL',ss)>0
            then lLocal:=true
            else lLocal:=false;
          sss := UpperCase(Copy(MainINI.ReadString('ADMIN','COMMUNICATION', 'DEFAULT'),1,3));
          strIP   := MainINI.ReadString('SERVER','LAN_IP', '');
          strPORT := MainINI.ReadString('SERVER','LAN_PORT', '');
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
          if strNameComp<>'' then begin
            // ������� ���� ads.ini
            AdsINI := TSasaIniFile.Create(NameFromExe('ads.ini'));
            lWrite := false;
            if (strIP<>'') and (strPORT<>'') and not lLocal then begin  // ���� �������� ������ (REMOTE)
              ss      := AdsINI.ReadString(strNameComp,'LAN_IP', '');
              sss     := AdsINI.ReadString(strNameComp,'LAN_PORT', '');;
              // ������� �������� �������� IP-������ (��-���������)
              if dmBase.IniSysParams.ReadString('ADMIN','CHECK_IP', '1')='1' then begin
                // �������� ����������
                if (strIP<>ss) or (strPort<>sss) then begin
                  AdsINI.WriteString(strNameComp,'LAN_IP',strIP);
                  AdsINI.WriteString(strNameComp,'LAN_PORT',strPort);
                  lWrite := true;
                  if Result then
                    ShowMessage('���������� ������������� ���������.')
                end;
              end else begin
                if (strPort<>sss) then begin
                  AdsINI.WriteString(strNameComp,'LAN_PORT',strPort);
                  lWrite := true;
                  if Result then
                    ShowMessage('���������� ������������� ���������.')
                end;
              end;
            end else begin  // ���� ��������� (Advantage Local) �����������
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
  if Result then begin
    GlobalTask.NameFileTaskParameters := NameFile_Params; //'ParamOpeka.tsk';
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
    PutError('  ������ ��������� ���� ���� � ���� !  ');
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
    PutError(' ������ ����������� � ����������� ����! ');
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
      PutError(' ������ ����� � ������� ���� �� ��������� ! ');
    end;
//    if not lErr then begin
//      if Connect.ConnectPath=AdsConnection.ConnectPath then begin
//        lErr := true;
//        Beep;
//        PutError(' �� ���������� ���� ����������� ������� ���� ! ');
//      end;
//    end;
  end;
  lDeleteDir := false;
  if not lErr and OkWarning('') then begin
    slTables := TStringList.Create;
    //-------- ����������� ������ --------------------------
    slTables.CommaText := '"���������������","������������","��������������������",'+
     '"Ochered","VUS","���������","������������","�����������������","�����������������","���������������","Dokuments","Nalogi",'+
     '"���������","���������","�������������������","HouseOwners","HouseProps",'+
//     '"SprKomiss","SprOsobOtm","SprOwners","SprPropHouse","�������������",'+
     '"SprKomiss","SprOsobOtm","SprPropHouse","�������������",'+
     '"������������","�������������","�������������������","���������������","�������������",'+
     '"�������������","������������","�������������","��������������","�������������",'+
     '"�������������","�����������","��������������","��������������","����������",'+
     '"�������������������","�������","��������������","SprPredst"';
    OpenMessage('����������� ���������� ...         ','����������� ����');
    {
    slTables.Clear;
    for i:=0 to slTables.Count-1 do begin
      ChangeMessage('������� '+slTables[i]+' ...');
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
    //-------- ������ ������ --------------------------
    lDeleteDir := true;
    ReplaceTablesBase( strSourceConnect, slTables);

    CloseMessage;
//    AdsConnection.Execute('EXECUTE PROCEDURE sp_DropLink('+QStr('RepBase')+', TRUE);');
//    WorkQuery.SQL.Text := 'INSERT INTO  EXECUTE PROCEDURE sp_ZapTable('+QStr('���������������')+')';
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
{$ENDIF}
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
    ChangeMessage('������� '+sl[i]+' ...');
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
    PutError('������ ����������� ����� : '+strPath+strTableName+'.adt'+
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
function TdmBase.AdresOwner(DateFiks: TDateTime; strID: String; nType: Integer;
         var strName : String; var lPropis : Boolean): String;
var
  adr : TAdres;
  s : String;
begin
  lPropis := true;
  if (strID <> '') and (nType <> 0) then begin
    Result := '�� ������';
    if nType = OWNER_NASEL then begin  // ��� �������
      adr := AdresMen(DateFiks, strID, s, false, true);
      Result := adr.Punkt+', '+adr.UlicaDom;
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
{
  strNazvR:=Trim(strNazvR);
  strNazvB:=Trim(strNazvB);
  if (strNazvR<>'') and (strNazvB<>'') then begin
    SprPerevod.IndexName := 'PR_KEY';
    strOboznR := '';
    strOboznB := '';
    s:=strNazvR;

//---------------------------------------------------------------------
//   �������� �����  �������  �����C��  ��� nType=1
//   �������� �����  �����    ����      ��� nType=2
    sr:=ANSIUpperCase(s);
    sb:=ANSIUpperCase(strNazvB);
    if nType=1 then begin
      n:=Pos(' �������', sr);
      m:=Pos(' ��������', sb);
      if (n>0) and (m>0) and (Length(sr)=n+7) and (Length(sb)=m+8) then begin
        s:=Copy(s,1,n-1);
        strNazvB:=Copy(strNazvB,1,m-1);
      end;
    end else if nType=2 then begin
      n:=Pos(' �����', sr);
      m:=Pos(' ����', sb);
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

      SetReloadMRUName(nType,false);  // ��. uProject.pas: GetMRUName()

      SprPerevod.Append;
      SprPerevod.FieldByName('TIP').AsInteger    := nType;
      SprPerevod.FieldByName('R_OBOZN').AsString := strOboznR;
      SprPerevod.FieldByName('R_NAME').AsString  := strFindR;
      SprPerevod.FieldByName('B_OBOZN').AsString := strOboznB;
      SprPerevod.FieldByName('B_NAME').AsString  := strFindB;
      SprPerevod.Post;
    end else begin;
      // ���� �� ��������� �������������� ����������
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
  }
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
//   �������� �����  �������  �����C��  ��� nType=1
//   �������� �����  �����    ����      ��� nType=2
    sr:=ANSIUpperCase(s);
    if nType=1 then begin
      n:=Pos(' �������', sr);
      if (n>0) and (Length(sr)=n+7) then begin
        s:=Copy(s,1,n-1);
      end;
    end else if nType=2 then begin
      n:=Pos(' �����', sr);
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

      SetReloadMRUName(nType,false);  // ��. uProject.pas: GetMRUName()

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
function TdmBase.GetBelNazv(nType : Integer; lSelect : Boolean; strNazvR: String): String;
var
  strFindR, strOboznR, s, oldInd : String;
begin
  Result := '';
  if (strNazvR<>'') then begin
    s := Trim(strNazvR);
    if lSelect then begin
      CheckObozn(s, strOboznR, strFindR);
    end else begin
      strFindR := s;
    end;

    if Result='' then begin
      SprPerevod.IndexName := 'PR_KEY';
      if SprPerevod.FindKey([nType, strFindR]) then begin
        Result := CheckBelI(SprPerevod.FieldByName('B_NAME').AsString);

        Result:=StringReplace(Result,'i','',[rfReplaceAll]);
        if lSelect then begin
          if SprPerevod.FieldByName('B_OBOZN').AsString<>'' then
            Result := Trim(SprPerevod.FieldByName('B_OBOZN').AsString) + ' '+ Result;
        end;
        // �������� ����� ��������� � ������� �������  (��������� ������ � ������� ��������)
        if not LastSimIsLower(strFindR) then begin
          Result:=ANSIUppercase(Result);
        end;
      end;
    end;

    //---- ����� � ��� ----------------------------------------------------------
    if (Result='') and GlobalTask.ParamAsBoolean('NAMEB_ATE') and AteSys.Active then  begin
      oldInd:=ATESys.IndexName;
      ATESys.IndexName:='KEY_NAME';
      try
        ATESys.SetRange([strFindR],[strFindR]);
        while not ATESys.Eof do begin
          if ATESys.FieldByName('NAME_B').AsString<>'' then begin
            Result:=CheckBelI(ATESys.FieldByName('NAME_B').AsString);
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
// ����� ����� ������
//--------------------------------------------------------------------------------------
function TdmBase.GorodHaveRaion(strName : String) : Boolean;
begin
  if Pos( ANSIUpperCase(Trim(strName))+';', '�����;�����;������;�������;�������;����˨�;������;��������;') > 0 then begin
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
  if nType>0 then begin // ���� ������� ��� ���� ������
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
      if Pos(s,'�;��;���;') >0 then begin
        Result := true;
      end;
    end;
  end;
end;

//--------------------------------------------------------------------------------------
// ������� ������ ������������ ���. ������ ���� ���:  <�.>  <�.>   � ������
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
    if Pos(s,'�;�;�;�;��;�;���;���;��;�;��;��;�\�;�\�;�/�;�/�;') >0 then begin
      lAdd := false;
    end;
  end;
  if lAdd  then begin
    if GetTypePunkt(IntToStr(nType),strLang,s) > 0 then begin
      if RightStr(s,1)='.'
        then Result := s+''+strValue
        else Result := s+' '+strValue;
    end;
  end;
end;

//--------------------------------------------------------------------------------------
// ������� ������ ������������ ���. ������ ���� ���:  <�.>  <�.>   � ������
// �������� ������ ��� �������� �����
//--------------------------------------------------------------------------------------
function TdmBase.GetFullNamePunkt(strValue : String; fldType : TField; strLang:String): String;
var
  lAdd : Boolean;
  i,j : Integer;
  s,sNameType : String;
  lKrat:Boolean;
begin
  if (strLang<>'') and (Pos('.',strLang)>0) then begin
    lKrat:=true;
    strLang:=StringReplace(strLang,'.','',[rfReplaceAll])
  end else begin
    lKrat:=false;
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
    if Pos(s,'�;�;�;�;��;�;���;���;��;�;��;��;�\�;�\�;�/�;�/�;') >0 then begin
      lAdd := false;
    end;
  end;
  if lAdd  then begin
    if fldType=nil then begin
      Result := '�.' + strValue
    end else begin
      if fldType.IsNull or (fldType.AsString='') then begin
        Result := strValue;
      end else if fldType.DataType=ftBoolean then begin
        if fldType.AsBoolean=true then begin
          Result := '�.' + strValue;
        end else begin
          Result := '�.' + strValue;
        end;
      end else begin  // ���� ��� ���. ������ ����
        i:=GetTypePunkt( fldType.AsString,  strLang, sNameType);
        if sNameType<>'' then begin
          if RightStr(sNameType,1)='.'
            then Result := sNameType+''+strValue
            else Result := sNameType+' '+strValue;
        end else begin
          Result:=strValue;
        end;
        {
        if TypePunkt.Locate('ID',fldType.AsInteger,[]) then begin
          Result := Trim(TypePunkt.FieldByName('NAME').AsString)+' '+strValue;
        end;
        }
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
          Result.UdostB:= GetNamePasport(Result.UdostKod,'�');
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
       // ��������  ???
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
  if i=0 then begin   // ���� �������� ������ ��� DataSet   "fmZapisBrak.Dokument"
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
  end else begin     // ���� �������� ��� DataSet � �������� ��� ������ "dmBase.tbZBrak;ID=3553" ��� "dmBase.tbZBrak;3553"
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
//   ��������� ����� ������� GetadresAkt ������ ��������� � ������� ��������
//--------------------------------------------------------------------------------------
function TdmBase.AdresIsUpper:Boolean;
begin
  Result:=FLastAdresUpper;
end;

//------------------------------------------------
function Get_DomKorpKv_FromAkt(sUL:String; ds:TDataSet; s:String; sDelim:String; sCheck:string):String;
var
  sDom,sKorp,sKv,ss,sss:String;
  fld:TField;
  lFirst:Boolean;
begin
  Result:=CheckSpace(Trim(sUL));
  if (s<>'') then begin
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
      ss:=Trim(fld.AsString);
      if ss<>'' then begin
        if IsAllDigit(Copy(ss,1,1))
          then ss:=sss+sokrDom+ss    // ���� ������ ������ �����
          else ss:=sss+ss;          // ���� ������ ������ �� �����
      end;
      if Result='' then Result:=ss else if ss<>'' then Result:=Result+sDelim+ss;
    end;
    fld:=ds.FindField(sKorp);
    if fld<>nil then begin
      ss:=Trim(fld.AsString);
      if ss<>'' then begin
        if IsAllDigit(Copy(ss,1,1))
          then ss:=sss+sokrKorp+ss   // ���� ������ ������ �����
          else ss:=sss+ss;           // ���� ������ ������ �� �����
      end;
      if Result='' then Result:=ss else if ss<>'' then Result:=Result+sDelim+ss;
    end;
    fld:=ds.FindField(sKv);
    if fld<>nil then begin
      ss:=Trim(fld.AsString);
      if ss<>'' then begin
        if IsAllDigit(Copy(ss,1,1))
          then ss:=sss+sokrKv+ss    // ���� ������ ������ �����
          else ss:=sss+ss           // ���� ������ ������ �� �����
      end;
      if Result='' then Result:=ss else if ss<>'' then Result:=Result+sDelim+ss;
    end;
    Result:=Trim(Result);
  end;
end;

//--------------------------------------------------------------------------------------
function TdmBase.GetAdresAkt(strDataSet, strParam: String; nType: Integer): String;
var
  f : TfmSimpleD;
  ds : TDataSet;
  arr,arrF : TArrStrings;
  n,i : Integer;
  ss, strRn, strDelim, sType, sHist, ResultRaion, strLang : String;
  lYesHist, lHaveRaion, lUpper : Boolean;
begin
  // ���� ����� ����� ����� ������
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
    lUpper:=CheckUpperParam(strParam);
    StrToArr(strParam,arr,';',false);
    for i:=0 to Length(arr)-1 do begin
      if Trim(arr[i])<>'' then begin
        StrToArr( arr[i], arrF, ',', false );
        SetLength(arrF, 3);
        case i of
          // ������
          0 : begin
                if (arrF[0]<>'') and (arrF[1]<>'') and
                   (ds.FieldByName(arrF[0]).AsString<>'') then begin
                  if nType>9 then sHist := f.GetHistValueField(arrF[0], 1) else sHist:='';
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
          // �������, ����
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
                      n:=CheckBooleanField(ds,arrF[1]);
                      sHist:=dmBase.NameObl(sHist,n,strLang);
                      Result := Result + sHist+strDelim;
                    end;
                  end;
                end;
              end;
          // �����
          2 : begin
                strRn  := '';
                if (arrF[1]<>'') then begin
                  if ds.FieldByName(arrF[1]).DataType=ftBoolean then begin  // ��� ����� "� ������" ��� ��� ����� � �������
                    if not ds.FieldByName(arrF[1]).IsNull and (ds.FieldByName(arrF[1]).AsBoolean=false) then begin
                      // ����� � ������
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
                  // �� �������� � ����� ��� ������ � ������
                  if arrF[2]='0' then begin
                    strRn:='';
                    lHaveRaion:=false;
                  end;
                end else begin
                  if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
                    strRn := TrimRight(ds.FieldByName(arrF[0]).AsString);
                  end;
                end;
                if nType>9
                  then sHist:=f.GetHistValueField(arrF[0], 1)
                  else sHist:='';
                ss := GetWordRAION(strRn,strLang); //' �����';       // ����� ����� ����� � �� �����������
                strRn:=Trim(strRn);
                //------------------------------
                if not LastSimIsLower(strRn)
                  then lUpper:=true;
                //------------------------------

                //---- ���� ����� �������� ������������ ������ -----
                if (ss='') and (strRn<>'') then Result:=Copy(Result,1,Length(Result)-Length(strDelim))+' ';  //!!!!   ������� ���������� �����������
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
                  if Copy(sHist,1,1)<>'-' then begin   // ���� �� ������ ��������
                    if lHaveRaion then begin
                      ResultRaion := sHist + ss + strDelim;
                    end else begin
                      Result := Result + sHist + ss + strDelim;
                    end;
                  end;
                end;
              end;
          // �����,�������
          3 : begin
                if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
                  ss := ds.FieldByName(arrF[0]).AsString;
                  ss := GetFullNamePunkt(ss, ds.FindField(arrF[1]), strLang );
                  //------------------------------
                  if not LastSimIsLower(ss)
                    then lUpper:=true;
                  //------------------------------
                  if nType>9
                    then sHist := GetFullNamePunkt(f.GetHistValueField(arrF[0],1), ds.FindField(arrF[1]), strLang)
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
          // ����� � ���������� ������
          4 : begin
                if (arrF[0]<>'') then begin
                  if nType>9 then begin  // �������
                    sHist:=f.GetHistValueField(arrF[0], 1);
                    if sHist<>'' then begin
                      lYesHist := true;
                      Result := Result + sHist + strDelim;
                    end else begin
                      Result := Result + Get_DomKorpKv_FromAkt( ds.FieldByName(arrF[0]).AsString, ds, arrF[1],',',Result) + strDelim;
                    end;
                  end else begin        // ������ ��������
                    Result := Result + Get_DomKorpKv_FromAkt( ds.FieldByName(arrF[0]).AsString, ds, arrF[1],',',Result) + strDelim;
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
// �� ���������� ����������� ���� ��������� �� ��������� �� ���������  (���� ��� "+" � ����� ����)
// �� ���������� ������� ���� ��������� �� ��������� �� ���������      (���� ��� "+" � ����� ����)
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
  // ���� ����� ����� ����� ������
  lHaveRaion  := false;
  ResultRaion := '';

  Result := '';
  sType := Copy(PadLInt(nType,2,'0'),2,1);
  lYesHist := false;
  if sType='0'
    then strDelim := Chr(13)+Chr(10)
    else strDelim := ', ';

  if nType=3 then strDelim:=', ';  // ��������� �������� �����
  SetLength(arrResult,5);               // ��� ������ ������������� �����������

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
          // ������
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
          // �������, ����
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
                      if Copy(sHist,1,1)<>'-' then Result := Result + sHist+''+strDelim; //??? �������
                    end;
                  end;
                end;
              end;
          // �����
          2 : begin
                arrResult[2]:='';
                strRn  := '';
                if (arrF[1]<>'') then begin
                  if ds.FieldByName(arrF[1]).DataType=ftBoolean then begin  // ���: "����� � ������" ��� "����� � �������"
                    if not ds.FieldByName(arrF[1]).IsNull and (ds.FieldByName(arrF[1]).AsBoolean=false) then begin
                      // ����� � ������
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
                  // �� �������� � ����� ��� ������ � ������
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
                ss := GetWordRAION(strRn,strLang); //' �����';
                strRn:=Trim(strRn);
                //------------------------------
                if not LastSimIsLower(strRn)
                  then lUpper:=true;
                //------------------------------

                //---- ���� ����� �������� ������������ ������ -----
                if (ss='') and (strRn<>'') then Result:=Copy(Result,1,Length(Result)-Length(strDelim))+' ';  //!!!!   ������� ���������� �����������
                //--------------------------------------------------

                if sHist='' then begin
                  if strRn<>'' then begin
                    if lHaveRaion then begin
                      ResultRaion := strRn + ss + strDelim;
                    end else begin
                      Result := Result + strRn + ss + strDelim;
                      if (ss='') and (strRn<>'')
                        then arrResult[1]:=arrResult[1]+' '+strRn   // ��������� � �������
                        else arrResult[2]:=strRn+ss;
                    end;
                  end;
                end else begin
                  lYesHist := true;
                  if Copy(sHist,1,1)<>'-' then begin   // ���� �� ������ ��������
                    if lHaveRaion then begin
                      ResultRaion := sHist + ss + strDelim;
                    end else begin
                      Result := Result + sHist + ss + strDelim;
                      if (ss='') and (strRn<>'')
                        then arrResult[1]:=arrResult[1]+' '+strRn   // ��������� � �������
                        else arrResult[2]:=sHist+ss;
                    end;
                  end;
                end;
              end;
          // �����,�������
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
          // ����� � ���������� ������
          4 : begin
                arrResult[4]:='';
                if (arrF[0]<>'') then begin //and (ds.FieldByName(arrF[0]).AsString<>'') then begin
                  if nType>9 then sHist := f.GetHistValueField(arrF[0], 1) else sHist:='';
                  if sHist='' then begin
                    ss:=Get_DomKorpKv_FromAkt( ds.FieldByName(arrF[0]).AsString, ds, arrF[1],',',Result);
                    Result := Result + ss + strDelim;
                    arrResult[4]:=ss;
                  end else begin
                    lYesHist := true;
                    Result := Result + sHist + strDelim;
                  end;
                end;
              end;
        end;
      end;
    end;
    if nType=3 then begin // ������� �������� �����
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
// ��� ����� �������
//--------------------------------------------------------------------------------------
function TdmBase.GetAdresAkt3(ds : TDataSet; strParam: String; nType: Integer; lPrintOblAll:Boolean): String;
var
  arr,arrF : TArrStrings;
  n,i : Integer;
  s,ss,sd, strRn, strDelim, sType, ResultRaion,strLang : String;
  lHaveRaion,lUpper : Boolean;
begin
  // ���� ����� ����� ����� ������
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
          // ������
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
          // �������, ����
          1 : begin
                if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
                  if lPrintOblAll or (ANSIUpperCase(GlobalTask.ParamAsString('OBL'))<>
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
          // �����
          2 : begin
                strRn  := '';
                if (arrF[1]<>'') then begin
                  if ds.FieldByName(arrF[1]).DataType=ftBoolean then begin  // ���: "����� � ������" ��� "����� � �������"
                    if not ds.FieldByName(arrF[1]).IsNull and (ds.FieldByName(arrF[1]).AsBoolean=false) then begin
                      // ����� � ������
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
                  // �� �������� � ����� ��� ������ � ������
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
                  ss := GetWordRAION(strRn,strLang); //' �����';
                  strRn:=Trim(strRn);

                  //---- ���� ����� �������� ������������ ������ -----
                  if (ss='') and (strRn<>'') then Result:=Copy(Result,1,Length(Result)-Length(strDelim))+' ';  //!!!!   ������� ���������� �����������
                  //--------------------------------------------------

                  if lHaveRaion then begin
                    ResultRaion := strRn + ss + strDelim;
                  end else begin
//                    if ss=''
                    Result := Result + strRn + ss + strDelim;
                  end;
                end;
              end;
          // �����,�������
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
          // ����� � ���������� ������
          4 : begin
                if (arrF[0]<>'') then begin
                  Result := Result + Get_DomKorpKv_FromAkt( ds.FieldByName(arrF[0]).AsString, ds, arrF[1],',',Result) + strDelim;
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
    Result:='�.�����';
    if lRnGor and (Length(strSOATO)>=4) then begin
      if SprSoato.FindKey([Copy(strSOATO,1,4)+'000000']) then begin
        Result:=Result+', '+SprSoato.FieldByName('NAME').AsString+' �-�';
      end;
    end;
  end else begin
    if Copy(strSOATO,2,1)='4' then begin  // ����� ���������� ����������
      if SprSoato.FindKey([Copy(strSOATO,1,4)+'000000']) then begin
        Result:='�.'+SprSoato.FieldByName('NAME').AsString;
        if lRnGor and (Length(strSOATO)>=7) and (Copy(strSOATO,5,3)<>'000') then begin

          if SprSoato.FindKey([Copy(strSOATO,1,7)+'000']) then begin
            if SprSOATO.FieldByName('TYPEPUNKT').AsInteger>3 then begin   // ���� ����������
              GetTypePunkt(SprSOATO.FieldByName('TYPEPUNKT').AsString,'R',ss);
              if ss=''
                then Result:=Result+', '+SprSoato.FieldByName('NAME').AsString
                else Result:=Result+', '+CheckSpace(ss+' '+SprSoato.FieldByName('NAME').AsString);
            end else begin
              Result:=Result+', '+SprSoato.FieldByName('NAME').AsString+' �-�';
            end;

          end;
        end;
      end;
    end else begin
      if s='1' then ss:='���������'
      else if s='2' then ss:='���������'
      else if s='3' then  ss:='����������'
      else if s='4' then  ss:='�����������'
      else if s='6' then  ss:='�������'
      else if s='7' then  ss:='����������';
      if ss<>'' then ss:=ss+' ���.';
      if Copy(strSOATO,2,3)='000' then begin  // ���������� ������ �������
        lObl:=true;
      end else begin
        if SprSoato.FindKey([Copy(strSOATO,1,4)+'000000']) then begin
          Result:=SprSoato.FieldByName('NAME').AsString+' �-�';
          if Copy(strSOATO,5,3)='002' then begin
            Result:=Result+' (���. ���������)';
          end else begin
            if Length(strSOATO)>4 then begin
              if Length(strSOATO)<10 then s:=PadRStr(strSOATO,10,'0')
                                     else s:=strSOATO;
              if Copy(s,5,6)='000000' then begin
                if lCheckPunkt
                  then Result:=Result+', ���.�. �� ���������';
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
// lCheckSel=��������������� �������� ��������� � '002'
// nType=0,10 ������ �����
// nType=1 ������ �������
// nType=4 ������ �����
// nType=7 �� ��������� ������
//--------------------------------------------------------------------------------------
function TdmBase.GetSoatoAkt(ds : TDataSet; strParam: String; lCheckSel:Boolean; nType:Integer) : TSoato;
var
  arr,arrF : TArrStrings;
  old,ss, sPunkt, sPunktBel,strObl,strRn, sType, sTypeRN, strKodRaion, strKodPunkt : String;
  lHaveRaion : Boolean;
  lOk,lGorod,lFind:Boolean;
  fld:TField;
begin
  old:=SprSoato.IndexFieldNames;
  lHaveRaion  := false;  // ���� ����� ����� ����� ������
  Result.Kod:='9';
  Result.Name:='';
  strObl:='0';
  strKodRaion:='';
  strKodPunkt:='';
  strRn:='';
  lGorod:=false;
  lOk :=true;   // ���� �������, ��� ��������
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
  //--- ������� -------------------------------------------------
  if lOk then begin
    StrToArr( arr[1], arrF, ',', false );
    SetLength(arrF, 3);
    if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
      ss:=ANSIUpperCase(ds.FieldByName(arrF[0]).AsString);
      if ss='���������' then strObl:='1'
      else if  ss='���������' then strObl:='2'
      else if  ss='����������' then strObl:='3'
      else if  ss='�����������' then strObl:='4'
      else if  ss='�������' then strObl:='6'
      else if  ss='�����' then strObl:='5'
      else if  ss='����˨�����' then strObl:='7'
      else if  ss='�����������' then strObl:='7';
    end;
    if strObl<>'0' then Result.Kod:=strObl;
  end;
  //--- ����� -------------------------------------------------
  if lOk then begin
    StrToArr( arr[2], arrF, ',', false );
    SetLength(arrF, 3);
    if (arrF[1]<>'') then begin
      if ds.FieldByName(arrF[1]).DataType=ftBoolean then begin  // ���: "����� � ������" ��� "����� � �������"
        if not ds.FieldByName(arrF[1]).IsNull and (ds.FieldByName(arrF[1]).AsBoolean=false) then begin
          // ����� � ������
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
    // ���� �������� ������ �� �����, � ��� �� ����� ������
    if (strRn<>'') and not lHaveRaion then begin
      if MySameText(strRn,'�����������') or MySameText(strRn,'����˨�����') then begin
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
      //--------- ���� �� ����� � ���� ����� � � ������������ -------------------------------------------
      if (strKodRaion='') and (Pos('�', ANSIUpperCase(strRn))>0) then begin
        strRn:=StringReplace(strRn,'�','�',[rfReplaceAll]);
        strRn:=StringReplace(strRn,'�','�',[rfReplaceAll]);
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
  //--- �����,������� -------------------------------------------------
  if lOk then begin
    StrToArr( arr[3], arrF, ',', false );
    SetLength(arrF, 3);
    if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
      sPunkt:=ds.FieldByName(arrF[0]).AsString;  // ���. �����

      if (Copy(sPunkt,1,2)='�.') or (Copy(sPunkt,1,2)='�.') or (Copy(sPunkt,1,2)='�.')
        then sPunkt:=Trim(Copy(sPunkt,3,Length(sPunkt)));
      fld:=ds.FindField(arrF[1]); // ���� ���������� �� ��� ���. ������
      sType:='';
      sTypeRN:='';   // ��� ���. ������ �� ��� ��
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
            fld:=ds.FindField('RN_'+arrF[1]); // ���� ���������� �� ��� ���. ������ �� ��� ��
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
      if MySameText(sPunkt,'�������') then begin
        sPunkt:='����˨�';
      end;
      //----- ����� ������� ����� ������ � ����� ������ ---
      if lHaveRaion and (strRn<>'') and (ANSIUpperCase(sPunkt)<>'����') and (ANSIUpperCase(sPunkt)<>'����������') then begin
        ss:=sPunkt; //ds.FieldByName(arrF[0]).AsString;
        SprSoato.IndexFieldNames:='NAME;TYPEPUNKT';
        SprSoato.SetRange([ss],[ss]);
        while not SprSoato.Eof do begin
               // � ������ �������� ������ �.�. 6 �����   ��� �����
          if ( (Copy(SprSoato.FieldByName('KOD').AsString,5,6)='000000') or
               ( (Copy(SprSoato.FieldByName('KOD').AsString,1,1)='5') and (Copy(SprSoato.FieldByName('KOD').AsString,8,3)='000'))) and
             (strObl='0') or (Copy(SprSoato.FieldByName('KOD').AsString,1,1)=strObl) then begin
//             ((strKodRaion='') or (Copy(SprSoato.FieldByName('KOD').AsString,1,4)=Copy(strKodRaion,1,4)))
            Result.Kod:=SprSoato.FieldByName('KOD').AsString;  // ��� ������ �������� ������
            strKodPunkt:=Result.Kod;
            break;
          end;
          SprSoato.Next;
        end;
        SprSoato.CancelRange;
        //---!!!----------
        if (strKodPunkt='') then begin
          if MySameText(ss,'�������') or MySameText(ss,'����˨�') then begin
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
              strKodRaion:=SprSoato.FieldByName('KOD').AsString;  // ��� ������ ������
              Result.Kod:=strKodRaion;
              break;
            end;
            SprSoato.Next;
          end;
          SprSoato.CancelRange;
        end;
      end else begin  // �� ����� ������
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

        //--------- ���� �� ����� � ���� ����� � � ������������ -------------------------------------------
        if not lFind then begin
          if MySameText(ss,'�������') or MySameText(ss,'����˨�') then begin
            Result.Kod:='7401000000';
          end;
        end;

        if not lFind and (Pos('�',ANSIUpperCase(ss))>0) then begin
          ss:=StringReplace(ss,'�','�',[rfReplaceAll]);
          ss:=StringReplace(ss,'�','�',[rfReplaceAll]);

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
  Result.Raion:='';
  Result.Raion_B:='';
  Result.RnGorod:='';
  Result.SS:='';
  Result.Error:='';
  Result.Active:=true;
end;
//---------------------------------------------------------
function TdmBase.ATEfromParentAndName(tbATE:TAdsTable; nType:Integer;nID:Integer; sName:String; sKateg: String; sNotKateg: String; sNameC:String) : TArrAte;
var
  i,n:Integer;
  sCurKateg:String;
  lOk,lSeek:Boolean;
  arr:TArrAte;
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
      if (nType<>SEEK_ATEID) and ((Pos('�',sName)>0) or (Pos('�',sName)>0)) then begin
        sName:=StringReplace(sName,'�','�',[rfReplaceAll]);
        sName:=StringReplace(sName,'�','�',[rfReplaceAll]);
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
  // ��� ���. ������ �� ������ � ����� ����� ������ ���. ������

  if (sNameC<>'') and (Length(Result)>1) then begin
    n:=Length(Result);
    lOk:=false;
    SetLength(arr, n);
    for i:=0 to n-1 do begin
      arr[i]:=Result[i];
      if arr[i].NameC=sNameC then begin  // ����� ���. ����� � �����. ����� ���� �� ����
        lOk:=true;
      end;
    end;
    if lOk then begin
      SetLength(Result, 0);
      for i:=0 to n-1 do begin
        arr[i]:=Result[i];
        if arr[i].NameC=sNameC then begin  // ����� ���. ����� � �����. ����� ���� �� ����
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
  arr_type : array[0..19] of String = ('��','�.�','���','�','�','�','�','�','��','�.�','���','���','���','��','��','��','�/�','�\�','���','�');

//--------------------------------------------------------------------------------------
function TdmBase.GetNameAndTypePunkt(strValue : String; var sType,sName : String): Boolean;
var
  lAdd : Boolean;
  i,j : Integer;
  s : String;
  lOk:Boolean;
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
      if Copy(sType,1,3)='�.�' then
        sType:='��'
      else if Copy(sType,1,3)='�oc' then
        sType:='�.'
      else if (Copy(sType,1,3)='���') or (Copy(sType,1,3)='�.�') then
        sType:='��.';
      sName:=Trim(Copy(strValue,length(arr_type[i])+2,length(strValue)));
      break;
    end;
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
  result:=_getATE(ATESys, slATE, sObl, sRaion, sSS, sPunkt, sTypePunkt);
end;
//--------------------------------------------------------------------------------------------
function TdmBase._getATE(tbATE:TAdsTable; slATE:TStringList; sObl:String; sRaion:String; sSS:String; sPunkt:String; sTypePunkt:String) : Integer;
var
  old,ss : String;
  idSS,idObl,idRn,idPunkt,idSS2,idRn2,idObl2,i,n,nParent:Integer;
  lHaveRaion,lChoice : Boolean;
  lOk,lGorod:Boolean;
  curATE:TATE;
  arrAte,arrATE2:TArrATE;
  nTypePunkt:Integer;
  rATE:TATE;
begin
  if slATE<>nil then slATE.Clear;

  old:=tbATE.IndexFieldNames;
  lHaveRaion  := false;  // ���� ����� ����� ����� ������
  rATE.ATE_ID:=0;
  rATE.Kod:='9';
  rATE.Name:='';
  rATE.NameC:='';
  rATE.Error:='';
  Result:=0;
  idObl:=0;
  idRn:=0;
  idSS:=0;
  idPunkt:=0;
  lGorod:=false;
  lOk :=true;   // ���� �������, ��� ��������
  nTypePunkt:=0;
  lChoice:=true;
  if Pos('#',sTypePunkt)>0 then begin // �� �������� ������ �� ����� ����������� ������ ���� ������� ������ 1
    lChoice:=false;
    CharDel(sTypePunkt, '#');
  end;
  //===========================================================
  //  �����,�������
  //===========================================================
  if (sPunkt<>'') then begin
    if (sTypePunkt<>'') then begin
      if IsAllDigit(sTypePunkt) then begin // ������� ��� ���� ����������� ������

      end else begin
        if Pos('+',sTypePunkt)>0 then begin// ��� ���. ������ ����� �� ��������
          if GetNameAndTypePunkt(sPunkt,sTypePunkt,ss)
            then sPunkt:=ss;
        end;
      end;                    
    end;
//    nTypePunkt:=ds.FieldByName(arrF[1]).AsInteger;  // ��� ���. �����
    arrATE:=ATEfromParentAndName(tbATE, SEEK_NAME, 0, sPunkt,'','101;102;103;MAX;', '');
    //------����� ��������� ���. ������� ------------------------------------------
    if Length(arrATE)>0 then begin        // ���� ���������� ���. ������� ������ ������
      //-------- ������� ------------
      if (sObl<>'') and (sObl<>'-') then begin
        arrATE2:=ATEfromParentAndName(tbATE, SEEK_CATEGORY, ATE_CATEG_OBL, sObl,'','');
        if Length(arrATE2)>0 then idOBL:=ArrATE2[0].ATE_ID;
      end;
      //--------- ����� ------------
//      if (sRNGorod<>'') and (sRNGorod<>'-') then lHaveRaion := true;  // ����� � ������
      // ���� �������� ������ �� �����, � ��� �� ����� ������
      if (sRaion<>'') and (sRaion<>'-') and not lHaveRaion and (idObl>0) then begin
        arrATE2:=ATEfromParentAndName(tbATE, SEEK_PARENT, idOBL, sRaion,'','');
        if Length(arrATE2)>0
          then idRn:=ArrATE2[0].ATE_ID;
      end;
      // ���� �������� cc �� �����
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
        idRn2:=0;       // �����
        idObl2:=0;      // �������
        arrATE[i].idObl:=0;
        arrATE[i].idRaion:=0;
        arrATE[i].idSS:=0;
        nParent:=arrATE[i].ATE_PARENTID;
        n:=1;
        while (nParent>0) and (n<10) do begin
          Inc(n,1);
          arrATE2:=ATEfromParentAndName(tbATE, SEEK_ATEID, nParent , '', '','');  // ������ ��������
          if Length(arrATE2)>0 then begin
            nParent:=arrATE2[0].ATE_PARENTID;
            if arrATE2[0].CATEGORY=101 then begin
              idObl2:=arrATE2[0].ATE_ID;      // �������
              arrATE[i].idObl:=idObl2;
              arrATE[i].Obl:=arrATE2[0].NAME;
              arrATE[i].Obl_B:=arrATE2[0].NAME_B;
            end;
            if arrATE2[0].CATEGORY=102 then begin
              idRn2:=arrATE2[0].ATE_ID;       // �����
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
          if (nTypePunkt=1) then begin  // �����
            if Gisun.Decode35_My_TypePunkt2(IntToStr(arrATE[i].Category))<>IntToStr(nTypePunkt) then begin
              arrATE[i].Active:=false;  // �������� ��� ���� � ��� ����� � � ��� �� �����
            end;
          end;
          {$ENDIF}
        end else begin            // �������� ��� ���� ����� ��� ������� �� ���������
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
      rATE:=ChoiceATEPunkt(arrATE, lChoice);
    //-----------------------------------------------------
    end else begin
      rATE.Error:='���. �����:"'+sPunkt+'" �� ������';
    end;
  end;
  tbATE.IndexFieldNames:=old;
  Result:=rATE.ate_id;
  if (slATE<>nil) and (Result>0) then begin
    slATE.Clear;
    if rATE.idObl>0 then slATE.Add('OBL='+InttoStr(rATE.idObl));
    if rATE.idRaion>0  then slATE.Add('RN='+InttoStr(rATE.idRaion));
    if rATE.idSS>0  then slATE.Add('SS='+InttoStr(rATE.idSS));
  end;
end;

//----------------------------------------------------------------------------------------------
//  ATE:=dmBase.GetSoatoAkt(Dokument,
//              'GOSUD,FName;OBL,B_OBL;RAION,RNGOROD;GOROD,B_GOROD',10);

function TdmBase.GetATEAkt(ds : TDataSet; strParam: String; lCheckRnGorod:Boolean; nType:Integer) : TATE;
var
  arr,arrF : TArrStrings;
  old,ss, strRn, strObl, sPunkt : String;
  idObl,idRn,idPunkt,idRn2,idObl2,i,n,nParent:Integer;
  lHaveRaion : Boolean;
  lOk,lGorod:Boolean;
//  fld:TField;
  curATE:TATE;
  arrAte,arrATE2:TArrATE;
  nTypePunkt:Integer;
begin
  old:=ATESys.IndexFieldNames;
  lHaveRaion  := false;  // ���� ����� ����� ����� ������
  Result.ATE_ID:=0;
  Result.Kod:='9';
  Result.Name:='';
  Result.NameC:='';
  Result.Error:='';
  idObl:=0;
  idRn:=0;
  idPunkt:=0;
  lGorod:=false;
  lOk :=true;   // ���� �������, ��� ��������
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
  if lOk then begin  // ���� ��������
    nTypePunkt:=0;
  //===========================================================
  //  �����,�������
  //===========================================================
    StrToArr( arr[3], arrF, ',', false );
    SetLength(arrF, 3);
    if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
      sPunkt:=Trim(ds.FieldByName(arrF[0]).AsString);  // ���. �����
      nTypePunkt:=ds.FieldByName(arrF[1]).AsInteger;  // ��� ���. �����
      arrATE:=ATEfromParentAndName(ATESys, SEEK_NAME, 0, sPunkt,'','101;102;103;MAX;');
      //------����� ��������� ���. ������� ------------------------------------------
      if Length(arrATE)>0 then begin        // ���� ���������� ���. ������� ������ ������
        //-------- ������� ------------
        StrToArr( arr[1], arrF, ',', false );
        SetLength(arrF, 3);
        ss:=Trim(ds.FieldByName(arrF[0]).AsString);
        if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
          arrATE2:=ATEfromParentAndName(ATESys, SEEK_CATEGORY, ATE_CATEG_OBL, ss,'','');
          if Length(arrATE2)>0 then idOBL:=ArrATE2[0].ATE_ID;
        end;
        //--------- ����� ------------
        StrToArr( arr[2], arrF, ',', false );
        SetLength(arrF, 3);
        strRn:='';
        if (arrF[1]='') then begin
          if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
            strRn := ds.FieldByName(arrF[0]).AsString;
          end;
        end else begin
          if ds.FieldByName(arrF[1]).DataType=ftBoolean then begin  // ���: "����� � ������" ��� "����� � �������"
            if not ds.FieldByName(arrF[1]).IsNull and (ds.FieldByName(arrF[1]).AsBoolean=false) then begin
              // ����� � ������
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
        // ���� �������� ������ �� �����, � ��� �� ����� ������
        if (strRn<>'') and not lHaveRaion and (idObl>0) then begin
          arrATE2:=ATEfromParentAndName(ATEsys, SEEK_PARENT, idOBL, strRn,'','');
          if Length(arrATE2)>0
            then idRn:=ArrATE2[0].ATE_ID;
        end;
        //------------------------------------------------
        for i:=0 to Length(arrATE)-1 do begin
          idRn2:=0;       // �����
          idObl2:=0;      // �������
          nParent:=arrATE[i].ATE_PARENTID;
          n:=1;
          while (nParent>0) or (n>100) do begin
            Inc(n,1);
            arrATE2:=ATEfromParentAndName(ATESys, SEEK_ATEID, nParent , '', '','');  // ������ ��������
            if Length(arrATE2)>0 then begin
              nParent:=arrATE2[0].ATE_PARENTID;
              if arrATE2[0].CATEGORY=101 then begin
                idObl2:=arrATE2[0].ATE_ID;      // �������
                arrATE[i].Obl:=arrATE2[0].NAME;
                arrATE[i].Obl_B:=arrATE2[0].NAME_B;
              end;
              if arrATE2[0].CATEGORY=102 then begin
                idRn2:=arrATE2[0].ATE_ID;       // �����
                arrATE[i].Raion:=arrATE2[0].NAME;
                arrATE[i].Raion_B:=arrATE2[0].NAME_B;
              end;
              if arrATE2[0].CATEGORY=103 then begin
                arrATE[i].SS:=arrATE2[0].NAME;     // ��
              end;
            end else begin
              nParent:=0;
            end;
          end;
          if ( (idRn=idRn2) or (idRn=0) ) and ( (idObl=idObl2) or (idObl=0) )then begin
            {$IFDEF GISUN}
            if (nTypePunkt=1) then begin  // �����
              if Gisun.Decode35_My_TypePunkt2(IntToStr(arrATE[i].Category))<>IntToStr(nTypePunkt) then begin
                arrATE[i].Active:=false;  // �������� ��� ���� � ��� ����� � � ��� �� �����
              end;
            end;
            {$ENDIF}
          end else begin            // �������� ��� ���� ����� ��� ������� �� ���������
            arrATE[i].Active:=false;
          end;
        end;
        Result:=ChoiceATEPunkt(arrATE);
      //-----------------------------------------------------
      end else begin
        Result.Error:='���. �����:"'+sPunkt+'" �� ������';
      end;
    end;
  end;
  ATESys.IndexFieldNames:=old;
end;
//----------------
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
  old:=ATESys.IndexFieldNames;
  lHaveRaion  := false;  // ���� ����� ����� ����� ������
  Result.ATE_ID:=0;
  Result.Kod:='9';
  Result.Name:='';
  Result.NameC:='';
  Result.Error:='';
  idObl:=0;
  idRn:=0;
  idPunkt:=0;
  lGorod:=false;
  lOk :=true;   // ���� �������, ��� ��������
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
  // �������
  //===========================================================
  if lOk then begin
    StrToArr( arr[1], arrF, ',', false );
    SetLength(arrF, 3);
    ss:=Trim(ds.FieldByName(arrF[0]).AsString);
    if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
      arrATE:=ATEfromParentAndName(ATESys, SEEK_CATEGORY, ATE_CATEG_OBL, ss,'','');
      if Length(arrATE)=0 then begin
        // ������
        Result.Error:='�� ������� �������: "'+ss+'"';
      end else begin
        idOBL:=ArrATE[0].ATE_ID;
      end;
    end;
  end;
  //===========================================================
  //    �����
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
      if ds.FieldByName(arrF[1]).DataType=ftBoolean then begin  // ���: "����� � ������" ��� "����� � �������"
        if not ds.FieldByName(arrF[1]).IsNull and (ds.FieldByName(arrF[1]).AsBoolean=false) then begin
          // ����� � ������
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
    // ���� �������� ������ �� �����, � ��� �� ����� ������
    if (strRn<>'') and not lHaveRaion and (idObl>0) then begin
      arrATE:=ATEfromParentAndName(ATESys, SEEK_PARENT, idOBL, strRn,'','');
      if Length(arrATE)=0 then begin
        // ������
        Result.Error:='�� ������ �����: "'+strRn+'"';
      end else begin
        idRn:=ArrATE[0].ATE_ID;
      end;
    end;
  end;

  //===========================================================
  //  �����,�������
  //===========================================================
  if lOk then begin
    StrToArr( arr[3], arrF, ',', false );
    SetLength(arrF, 3);
    if (arrF[0]<>'') and (ds.FieldByName(arrF[0]).AsString<>'') then begin
      sPunkt:=Trim(ds.FieldByName(arrF[0]).AsString);  // ���. �����
      // ���� ��������� �����
      if idRn>0 then begin
        arrATE:=ATEfromParentAndName(ATESys, SEEK_PARENT, idRn, sPunkt,'','');
      end else begin
        if idObl>0 then begin  //------ ���������� ������� -----------------------------
          arrATE:=ATEfromParentAndName(ATESys, SEEK_PARENT, idObl, sPunkt,'','');
          if Length(arrATE)=0 then begin  // �� parentid ������� �� �����
            // ������-�� ��� �� ������ ����
            arrATE:=ATEfromParentAndName(ATESys, SEEK_NAME, 0, sPunkt,'111;112;113;221,222,223;','');
          end;
        end else begin  //- ������� �� ����������, ����� �� ���������------------------------
          arrATE:=ATEfromParentAndName(ATESys, SEEK_NAME, 0, sPunkt,'111;112;113;','');
        end;
      end;
      if Length(arrATE)>1 then begin
        Result:=ChoiceATEPunkt(arrATE);
      end else if Length(ArrATE)=1 then begin
        Result:=arrATE[0];
      end else begin
        Result.Error:='���. �����:"'+sPunkt+'" �� ������';
      end;
//      fld:=ds.FindField(arrF[1]); // ���� ���������� �� ��� ���. ������
      // ���� ��� ������ ������
      {
      if lCheckRnGorod and lHaveRaion and (strRn<>'') then begin
        //----- ����� ������� ����� ������ � ����� ������ ---
      end else begin

      end;
      }
    end;
  end;
  ATESys.IndexFieldNames:=old;
end;
//----------------------------------------------------------------------------------------------
function TdmBase.IsAddTypeObl(strName : String) : Boolean;
var
  s:String;
begin
  s:=ANSIUpperCase(strName);
  if (Pos(' �������', s)=0) and (Pos(' ��������', s)=0) and (Pos(' ���.', s)=0)  and (Pos(' ����.', s)=0) and (Pos(' ����', s)=0)then begin
    Result:=true;
  end else begin
    Result:=false;
  end;
end;
//----------------------------------------------
function TdmBase.ChoiceATEPunkt(arrATE:TArrATE; lChoice:Boolean):TATE;
var
  i,n : Integer;
  List : TStringList;
  s:String;
begin
  Result.ATE_ID:=0;
  Result.ATE_PARENTID:=0;
  Result.error:='';
  Result.name:='';
  Result.fullname:='';
  Result.namec:='';

  List := TStringList.Create;
  for i:=0 to Length(arrATE)-1 do begin
    if ArrATE[i].Active then begin
      n:=i;
      s:=ArrATE[i].FullName;
      if ArrATE[i].SS<>''    then s:=ArrATE[i].SS+', '+s;
      if ArrATE[i].Raion<>'' then s:=ArrATE[i].Raion+' �-�, '+s;
      if ArrATE[i].Obl<>''   then s:=ArrATE[i].Obl+' ���., '+s;
      ArrATE[i].FullName:=s;
      List.AddObject(s, Pointer(i));
    end;
  end;
  i:=-1;

  if List.Count>1 then begin
    if lChoice then begin
      n:=ChoiceFromList(List,'�������� ���. �����', nil);
      if n>-1 then begin
        i:=Integer(List.Objects[n]);
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
//----------------
//-----------------------------------------------------------------------------------------------
function TdmBase.GetSQLForVozrast(strLastField, strFirstField : String): String;
begin
  // SQL ��������� ��� ���������� ��������
  Result := GlobalTask.ParamAsString('SQL_VOZRAST');
  if Trim(Result) = ''
    then Result := 'TRUNCATE(TIMESTAMPDIFF(SQL_TSI_MONTH,&FIRST&,&LAST&)/12,0)-IIF(month(&FIRST&)=month(&LAST&), IIF(dayofmonth(&FIRST&)-dayofmonth(&LAST&)>0,1,0),0)';
  Result := StringReplace(Result, '&FIRST&', strFirstField, [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&LAST&', strLastField, [rfReplaceAll, rfIgnoreCase]);
end;

function TdmBase.GetTypeZags: Integer;
begin
  {$IFDEF ZAGS}
    // 1000000000  ...  7000000000  ���� ��������
    if Copy(GlobalTask.ParamasString('KOD'),2,9)='000000000' then begin
//    if GlobalTask.ParamAsBoolean('ARXIV') then begin
      Result := ZAGS_OBL_ARXIV;
    end else begin
      Result := 0;
    end;
  {$ELSE}
    Result := 0;
  {$ENDIF}
end;

//--------------------------------------------------------------------------------------
function TdmBase.OblArxivZAGS: Boolean;
{$IFDEF ZAGS}
var
  s:String;
{$ENDIF}
begin
  Result := false;
  {$IFDEF ZAGS}
    s:=GlobalTask.ParamasString('ARXIV');
    if s='1' then Result:=true;
    {s:=GlobalTask.ParamasString('KOD');
    // 1000000000  ...  7000000000  ���� ��������
    if (Copy(s,2,9)='000000000') and (Copy(s,1,1)<'8') then begin
      Result := true;
    end; }
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
    // 1000000000  ...  7000000000  ���� ��������
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
begin
  Result:='';
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
  id2:=0;
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
    ListSvid.Filter := 'sost=0';  // �� ������
    ListSvid.Filtered := true;
    ListSvid.First;
    if ListSvid.Eof then begin
      Result := '  ����������� ������������� ! ';
    end else begin
      strNewNomerON := ListSvid.FieldByName('SVID_NOMER').AsString;
      strNewSeriaON := ListSvid.FieldByName('SVID_SERIA').AsString;
      ListSvid.Next;
      if ListSvid.Eof then begin
        Result := '  ����������� ������������� ! ';
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
          Result := '������ ��������� ���������� ������';
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
    WorkQuery.SQL.Text := 'SELECT MAX(nomer) FROM ������������ WHERE date_fiks='+QStr('1899-12-30')+
                          ' and nomer>='+IntToStr(GlobalTask.ParamAsInteger('MIN_TWO_NOMER'));
    WorkQuery.Open;
    s:=WorkQuery.Fields[0].AsString;
//    if Result=0
//      then Result:=GlobalTask.ParamAsInteger('MIN_TWO_NOMER');
  end else begin
    WorkQuery.SQL.Text := 'SELECT MAX(nomer) FROM ������������ WHERE date_fiks='+QStr('1899-12-30');
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
var
  st : TSostTable;
  s:String;
begin
{$IFDEF ZAGS}
  Result:=0;
{$ELSE}
  Result:=0;
  if GlobalTask.ParamAsInt64('MIN_TWO_NOMER')>0 then begin
    WorkQuery.SQL.Text := 'SELECT MAX(nomer) FROM ������������ WHERE date_fiks='+QStr('1899-12-30')+
                          ' and nomer<'+IntToStr(GlobalTask.ParamAsInt64('MIN_TWO_NOMER'));
    WorkQuery.Open;
    s:=WorkQuery.Fields[0].AsString;
    WorkQuery.Close;
    if s<>'' then begin
      Result:=StrToInt64(s);
    end;
    if Result >= GlobalTask.ParamAsInteger('MIN_TWO_NOMER') then begin
      Result:=GetLastNomerLic;
      PutError('�������� ����������� �����: '+IntToStr(GlobalTask.ParamAsInt64('MIN_TWO_NOMER')));
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
  vKeyValues : Variant;
  procedure AddLog;
  begin
    dsLog.Append;
    dsLog.FieldByName('TEXT').AsString := strNameAkt + ' �/� �'+strNomerAkt+' �� '+DatePropis(dDateAkt,0)+'�.       '+strSeria+'  �'+strNomer;
    dsLog.Post;
  end;
begin
  Result := true;
  if strNomer<>'' then begin
    if strSeria='' then begin
      AddLog;
    end else if dDateSvid=0 then begin
      AddLog;
    end else begin
      vKeyValues := VarArrayCreate( [0, 2], varOleStr );
      vKeyValues[0] := TypeSvid;
      vKeyValues[1] := strSeria;
      vKeyValues[2] := strNomer;

      if ListSvid.FieldByName('ID_ZAGS').AsInteger=Globaltask.ParamAsInteger('ID')  then begin  // ������ ������������� ���������� �� ����� �����
        if ListSvid.Locate('SVID_TYPE;SVID_SERIA;SVID_NOMER', vKeyValues,[]) then begin
          if ListSvid.FieldByName('DATEP').AsDateTime > dDateSvid then begin
            // � ���� ������������ ������� ������������� ��������� ����� ���� ��� ������
            AddLog;
          end else begin
            with ListSvid do begin
              try
                Edit;
                if lPovtor
                  then FieldByName('SOST').AsInteger := SVID_VIDANO_P
                  else FieldByName('SOST').AsInteger := SVID_VIDANO;
                FieldByName('DATER').AsDateTime    := dDateSvid;
                FieldByName('AKT_NOMER').AsString  := strNomerAkt;
                FieldByName('AKT_DATE').AsDateTime := dDateAkt;
  //              FieldByName('AKT_ID').AsInteger    := nAktID;
                Post;
              except
                PutError('������ ������� � ���� ������������ !');
                Result := false;
              end;
            end;
          end;
        end else begin
          AddLog;
        end;
      end;
    end;
  end;
end;

//--------------------------------------------------------------------------------------
procedure TdmBase.CheckAllSvid(dDate1, dDate2 : TDateTime );
begin
end;

//-----------------------------------------------------------
//  lLoad=true   ������ ���� ��� ��������
//  lLoad=false  ������ ���� ��� ��������
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
     if GetTypeZags = ZAGS_OBL_ARXIV then begin  // ��������� ����� ����
       i := Pos('{����_�',s);
     end else begin       // �������� ����
       if lLoad
         then i := Pos('{����_��',s)    // ��������� ���� �������� �������
         else i := Pos('{����_�',s);    // ��������� ��� ������� ������ � ��������� �����
     end;
    {$ELSE}
      i := Pos('{����_��',s);
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
      if nID = -1 then begin  // �����
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

//--------------------------------------------------------------------------------
function TdmBase.LastSvidPovtor(nTypeDok:Integer; strID:Integer; strFormat:String) : String;
begin
  Result:='';
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
  nTypeReindex : Integer;
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
        if nTypereindex=1 then begin   // ������ ����
          if (FormatDateTime('MMYYYY',dDateReindex) <> FormatDateTime('MMYYYY',dNow )) or
             (dNow > dDateReindex)
            then lOk := true
            else lOk := false;
        end else if nTypeReindex=2 then begin  // ������ ������
          if (FormatDateTime('MMYYYY',dDateReindex) <> FormatDateTime('MMYYYY',dNow )) or
             ((dNow-7) > dDateReindex)
            then lOk := true
            else lOk := false;
        end else if nTypeReindex=3 then begin  // ������ �����
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
    {$IFDEF OPEKA}
      try
        tbZapisOpeka.Exclusive:=true;
        tbZapisOpeka.Open;
      except
        lErr := true;
        PutError(' ���������� ������������� ���� ��� �������� ���������� ! ');
      end;
      tbZapisOpeka.Active:=false;
      tbZapisOpeka.Exclusive:=false;
    {$ELSE}
    {$IFDEF ZAGS}
      try
        tbZapisBrak.Exclusive:=true;
        tbZapisBrak.Open;
      except
        lErr := true;
        PutError(' ���������� ������������� ���� ��� �������� ���������� ! ');
      end;
      tbZapisBrak.Active:=false;
      tbZapisBrak.Exclusive:=false;
    {$ELSE}
      try
        tbMens.Exclusive:=true;
        tbMens.Open;
      except
        lErr := true;
        PutError(' ���������� ������������� ���� ��� �������� ���������� ! ');
      end;
      tbMens.Active:=false;
      tbMens.Exclusive:=false;
    {$ENDIF}
    {$ENDIF}
    if not lErr then begin
      DeleteFiles(CheckSleshN(GetPathConnect)+ '*.adi');
      GlobalTask.SetLastValueAsDate('DATE_AUTO_REINDEX',dNow);
    end;
  end;
end;

// ������� ����� ����������� � ����, �� ���� ������� ��� �� �������
procedure TdmBase.Event_BeforeOpen(Sender: TObject);
var
  arrTables : array of TAdsTable;
  i : Integer;
begin
  SetLength(arrTables,0);

  {$IFDEF GKH}
    SetLength(arrTables,9);
    arrTables[0] := tbZapisBrak;
    arrTables[1] := tbZapisRogd;
    arrTables[2] := tbZapisSmert;
    arrTables[3] := tbZapisUstOtc;
    arrTables[4] := tbZapisAdopt;
    arrTables[5] := tbZapisRast;
    arrTables[6] := tbZapisChName;
    arrTables[7] := tbZapisUstMat;
//    arrTables[8] := tbHistoryZAGS;
    arrTables[8] := ListSvid;
  {$ENDIF}

  {$IFDEF ZAGS}
    SetLength(arrTables,26);
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
//    arrTables[22]:= tbOcheredResh;
    arrTables[22]:= SprPostOch;
    arrTables[23]:= SprSnOch;
    arrTables[24]:= tbVUS;
    arrTables[25]:= DeclareRegistr;

  {$ENDIF}

  {$IFDEF OCHERED}
    SetLength(arrTables,26);
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
//    arrTables[10]:= tbZapisChName;
//    arrTables[11]:= tbZapisRast;
    arrTables[10]:= tbZapisUstOtc;
//    arrTables[13]:= tbZapisAdopt;
    arrTables[11]:= tbZapisSmert;
//    arrTables[15]:= tbZapisUstMat;

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
//    arrTables[30]:= SprPrichSm;
  {$ENDIF}

  // ������� � ������ ������ ������� �� �����������
  for i:=0 to Length(arrTables)-1 do begin
    arrTables[i].TableName:='';
  end;
  SetLength(arrTables,0);
  CheckAutoReindex;
end;

// ������� ����� �������� ����
procedure TdmBase.Event_AfterOpen(Sender: TObject);
begin
  {$IFDEF OBR_GRAG}
  //--------- ��������� ������� -------------
  if not fmMain.DocRecord.AfterOpen('AdsConnection') then begin
    // NB: ???
  end;
  {$ENDIF}
  CheckBaseAfterOpen;
end;

function TdmBase.StrTypeAsDataType( sType : String) : TFieldType;
begin
// C=������ I=����� ����� N=����� L=���������� D=���� M=�����
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
      // ���� �� ���������
      if FieldByName('VID').AsString<>'3' then begin
        sName := FieldByName('KOD').AsString;
        nDataType := StrTypeAsDataType( FieldByName('TIP').AsString );
        bRequired := false;
        iSize := 0;
        {TODO 1 : ������� ��������� ���������}
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
begin                      
  nMaxID:=MaxID();
  if nMaxID>-1 then begin
    lErr:=false;
    nMaxCreate := GetLastID;
//    tbAllDokums.Last;
//    nMaxCreate := tbAllDokums.FieldByName('NEWID').AsInteger;
    if nMaxID > nMaxCreate then begin
      OpenMessage('�������������� ������� "���������������"','',10);
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
      PutError('������ �������������� ������� "���������������"');
    end;
  end else begin
    PutError('�� ������ ������ "MAX ID.sql" ');
  end;

  {$IFDEF OCHERED}
  if dmBase.OblBASE then begin
    LoadOpisFromSoato('KEY_RN_OCH','','substr(kod,1,1)='+QStr(Copy(GlobalTask.ParamAsString('KOD'),1,1))+' and substr(kod,5,6)=''000000'' and substr(kod,2,3)<>''000'' ',1,4);
  end;
  {$ENDIF}

  {$IFNDEF ZAGS}

  LoadOpisControlHouse;    // ������� KEY_CONTROL_HOUSE

  {$ENDIF}

//-----------------------------------------------------
// ������������ � Lookup contols
  LookupObl.SetRange([1],[1]);        // ����������� �� ��������
  LookupRN.SetRange([2],[2]);         // ����������� �� �������
  LookupGorod.SetRange([3],[3]);
  LookupRnGor.SetRange([4],[4]);
//-----------------------------------------------------

  dmBase.LookUpPunkt.Close;
  if dmBase.LoadSQL('LookUpSprPunkt', strSQL) then begin
    nSort:=GlobalTask.ParamAsInteger('CH_ADRES');
//    ���� nSort=0 ���������� �� ����
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
  end else begin       // ��� �������������� ���� ���
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
procedure TdmBase.LoadHouseOwners(ID : Integer; d : TDateTime; tb,tbHist: TkbmMemTable);
begin
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
//---------------------------------------------------------
procedure TdmBase.SaveHouseOwners(ID : Integer; d : TDateTime; tb,tbHist: TkbmMemTable);
begin
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
begin
end;

procedure TdmBase.SaveBigHouseProp(adr : TAdres; d : TDateTime; tb: TkbmMemTable);
begin
end;

//----------------------------------------------------------------------------------
function TdmBase.AddBigHouse(adr : TAdres; d : TDateTime; lWriteName:Boolean; var strErr:String) : Boolean;
begin
  Result:=false;
end;

//----------------------------------------------------------------------------------
function TdmBase.FindBigHouse(adr : TAdres; d : TDateTime) : Boolean;
begin
  Result:=false;
end;

function TdmBase.NameBigHouse(adr: TAdres; d: TDateTime): String;
begin
  Result:='';
end;

function TdmBase.SaveNameBigHouse(strNameHouse: String; adr: TAdres;  d: TDateTime) : Boolean;
begin
  Result:=false;
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
  if lChoicePath then begin   // ������� ����� ��� ����������� ����������
    lOk := false;
    if SelectDirectory('�������� ����� ��� ����������� ��������������� �����', '', strDir) then begin
      CheckSlesh(strDir);
      lOk := true;
    end;
  end else if strDir<>'' then begin  // �������� ��� ����� ��� ����������� ����������
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
          // ���� ����� ADT ���� ����� ������������
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
        on E: Exception do PutError('������ ��������: '+E.Message);
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
      // ������ ����� �������� ���� ���� �������������
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
    // �������� �� ���� ���� ���� ���� ��� ����������� � ���� ������������� ��� ���� ������ ����
    if lRunExport and (lArx or (Length(arrTables)=1)) and lChoicePath then begin
      OpenMessage('����������� �� ����: '+strDir+' ...');
      ForceDirectories(strDir);
      {
      nFree := GetDiskFree(strDisk);
          if nFree < n then begin
            PutError(' �� ����� '+QStr(strDisk)+' �� ������� ����� ��� ���������� �����  !');
          end else begin
      }

      //----------------------    // ��� ����� ���������
      if lArx then begin
        strFileSource:=strPath+'\'+strNameArx;
      end else begin
        strFileSource:=strPath+'\'+strTableName; // !!! ��.���� ���������� �����, ��������� ������ ���� ���� �������
      end;
      //----------------------    // ��� ����� ����������
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

        if (sRunShell='') then begin   // ������� ��������� ���� �� ���� ��������� �����
          ShowMessage('�������� ������� ���������.'+#13+' ����: '+strFileDest);
        end;

      end else begin
        lOk:=false;
        CloseMessage();
        PutError('������ ����������� ����� : '+strFileSource+
                 #13+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');

      end;
      sAdd:='';
      if (sRunShell<>'') and lOk then begin
        if LowerCase(sRunShell)='riap' then begin  // �������� �� ������ RIAP
           {$IFDEF LAIS}
 //            TypeServerFTP:=;   // 1-�����  2-������ ����
             fmMain.SetPropertyFPT(SERVER_RIAP, 'vigr');
             fmMain.CheckVisibleProgress(true,'��������:');
             if fmMain.PutFileFTP(true, strDir+strNameArx) then begin
               sAdd:='(������� �� ������)';
             end;
             fmMain.CheckVisibleProgress(false,'');
           {$ENDIF}
        end else if LowerCase(sRunShell)='brest' then begin
           {$IFDEF LAIS}
//             TypeServerFTP:=SERVER_BREST;   // 1-�����  2-������ ����
             fmMain.SetPropertyFPT(SERVER_BREST, 'data');
             fmMain.CheckVisibleProgress(true,'��������:');
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
begin
  Result:='';
  if LoadSQL(strNameSQL, s) then begin
    Result := s;
    Result := CheckDateFiksSQL(Result,GetDateCurrentSost);
  end;
end;
//------------------------------------------------------------------------
function TdmBase.CreateBigHouse: Boolean;
begin
end;

//------------------------------------------------------------------------------------
// �������� ����� � �������
function TdmBase.GetRealNomerOch(nBase:Integer; nTypeOchered:Integer; nID:Integer):Integer;
begin
  Result:=0;
end;

//------------------------------------------------------------------------------------
// �������� ����� � �������  (� ��� ������������ ����������� � ����)
function TdmBase.GetRealNomerOchEx(nBase:Integer; nTypeOchered:Integer; nID:Integer; dDecDate:TDateTime; dDecTime:TDateTime; nSimple:Integer; nOldNomer:Integer):Integer;
begin
  Result:=0;
end;

//------------------------------------------------------------------------------------
//  ���� DataSet �������� ���� Date_Fiks, �� ���� �� TAdsTable, ����� ��� kbmMemTable
//------------------------------------------------------------------------------------
function TdmBase.LgotMen(dsLgot:TDataSet; DateFiks:TDateTime; strID:String; strDelim:String): String;
begin
  Result:='';
end;

//---------------------------------------------------------------------------
// ���������� ����� ����� � �������
function TdmBase.NewNomerOchered(nIdOch:Integer) : Integer;
begin
  Result:=1
end;

//------------------------------------------------------------------
// ��������� ����� ����
function TdmBase.Och_GetNextNDELO:Integer;
begin
  Result:=1;
end;

//---------------------------------------------------------------------------
function TdmBase.Check_AddMenToOchered_Sostav(nID: Integer): Boolean;
begin
end;

{
  MAX_OCHERED=4;   //   ������������ ����� ���� �������  3=��������������

  // ���� ��� ����������� ���� �������� � �������
  OCH_RESH_POST=1;
  OCH_RESH_VOST=2;
  OCH_RESH_RAZD=3;
  OCH_RESH_PERE=4;
  OCH_RESH_UNION=5;
  OCH_RESH_SN=9;
  OCH_TYPE_OBSH=0;
}
function TdmBase.SetIDLastReshOcheredMen(nID:Integer):Boolean;
begin
  Result:=false;
end;

function TdmBase.SetIDLastReshOchered_(dsOchered:TDataSet):Boolean;
begin
  Result:=false;
end;

function TdmBase.GetIDLastReshOchered_(nID:Integer; nType:Integer; lCheckPlan:Boolean;  var nIDLast:Integer; var nIDPost:Integer; var nIDSn:Integer):Boolean;
begin
  Result:=false;
end;

procedure TdmBase.SetIDLastReshOchered;
begin
end;
//---------------------------------------------------------------------------
function TdmBase.AddMenToOchered(nID: Integer; var lSeekMen : Boolean): Boolean;
begin
  Result:=false;
end;

//-------------------------------------------------------------------------------
function TdmBase.AddMenToVUS(nID: Integer; var lSeekMen : Boolean): Boolean;
begin
  Result:=false;
end;

//-----------------------------------------------------------
procedure TdmBase.SetCurDate(const Value: TDateTime);
begin
  FCurDate := Value;
  Globaltask.CurrentDate:=FCurDate;
end;

//-----------------------------------------------------------
function TdmBase.GetCurDate: TDateTime;
begin
  Result := FCurDate;
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
    ERR_MAX_ID   : Result:='������ ����������� ������������� �������������� � ����.';
    ERR_SPRPUNKT : Result:='������ ������������ ������������ ���������� �������.';
    ERR_LINK     : Result:='������ �������� ����� � ����������� �����.';
    ERR_CONN_LINK: Result:='������ ����������� � ����������� ����.';
    ERR_EXIT     : Result:='����� �� ����������.';
    ERR_MAINBASE : Result:='���������� �������� �� ������� ����.';
    ERR_BASE_EXISTS : Result:='����������� ���� ��� ���� ���������.';
    ERR_ORG_NOTFOUND : Result:='����������� � ����������� ���� �� ������� � �����������.';
    ERR_SCRIPT : Result:='������ ���������� ������� ����� ���������.';
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
    s := s + '��������!'#13; // + Chr(13)+
    s := s + '���������� �� ���� ����� �������� �������.'#13;
    s := s + '���� �� ������� � ������������� ���������� ��������,'#13;
    s := s + '������� ����� �� � ���� �����'#13;
    Result:=OkWarning(s);
    if Result then begin
      OpenMessage('�������� ���������� �� ���� ...','');
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
// ����������� ���
// strDirSource - ���� � ����������� ����
// lOnlyCurSost - ������ ������� ���������
// lAllPunkt    - ������� ��� ���������� ������ ������
// nNewNomerLic - �� ������� ����������� ����� �������� �����
// strAddNomerKniga - �������������� ����� � ������ �����
//---------------------------------------------------------------
function TdmBase.RunLoadBase(strDirSource:String; lOnlyCurSost:Boolean; lAllPunkt:Boolean; lZAGS:Boolean; nNewNomerLic:Integer; strAddNomerKniga:String; slCheckSpr:TStringList) : Integer;
begin
  Result:=0;
end;
{$ENDIF}
//******* end ochered *********************************


{$IFDEF GKH}
//***************** RunLoadBaseGES for GKH ******************************************

//---------------------------------------------------------------
// ����������� ���
// strDirSource - ���� � ����������� ����
// lOnlyCurSost - ������ ������� ���������
// lAllPunkt    - ������� ��� ���������� ������ ������
// nNewNomerLic - �� ������� ����������� ����� �������� �����
// strAddNomerKniga - �������������� ����� � ������ �����
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
  ChangeMessage('���������� ��������');

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
        // !!! ������� �������� ������� ���� � ������� !!!
        if not WorkQuery.FieldByName('main_base').IsNull and (WorkQuery.FieldByName('main_base').AsBoolean=true) then begin
          nErr:=ERR_MAINBASE;
        end;
        nIdBase:=WorkQuery.FieldByName('id_base').AsInteger;
        if nIdBase=0 then begin
          nErr:=ERR_MAINBASE;
        end;
        WorkQuery.Close;
      end else begin  // ������ ���� �� ��������� ����
        WorkQuery.Close;
        WorkQuery.SQL.Text:='SELECT id_base, main_base, count_sim from global';
        WorkQuery.Open;
        // ID ���� ����
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
        WorkQuery.SQL.Text:='SELECT TOP 1 id_base from ��������� where id_base='+strIdBase;
        WorkQuery.Open;
        if WorkQuery.FieldByName('id_base').AsInteger>0  then begin // ���� ��� �����������
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
    // ���� �� ��� ���������� ������ ������ ������ ������� � �������������
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
      ChangeMessage('��������� ����������� ���� ... ');
      if nErr=0 then begin
        DeletePunkt(strDelWhere, ConnectSource, false, true);
        if strPunkt<>'' then
          ExecuteSQL('DELETE FROM ������������� WHERE not ('+StringReplace(strPunkt,'punkt','id',[rfReplaceAll])+')',ConnectSource);
      end;
      ExecuteSQL('delete from VUS where id in (select v.id from VUS v left join ��������� n on n.id=v.id and n.date_fiks=''1899-12-30'' where n.id is null);',ConnectSource);
    end;

    if nErr=0 then begin
      AddToProtokol('��������: "'+strNameBase+'"');
      ChangeCaptionMessage(strNameBase);
      ConnectSource.CloseCachedTables;
      ConnectSource.IsConnected:=false;
      ConnectSource.IsConnected:=true;
      ExecuteSQL('DROP INDEX BigHouse.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX ���������.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX HouseOwners.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX ������������.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX ��������������������.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX ���������.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX VUS.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX OCHERED.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX OCHERED.MEN_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX ������������.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX �����������������.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX �����������������.PR_KEY',ConnectSource);

      // ������ �� ���� ������ �� ��������� ���� KOD, ������� ����������� � ����������� �������������
      ExecuteSQL('DELETE FROM ��������������� WHERE kod in (select distinct kod from ��������������� n left join ������������� s on n.kod=s.id where s.id is null)',ConnectSource);
      ExecuteSQL('DROP INDEX ���������������.PR_KEY',ConnectSource);

      ExecuteSQL('DROP INDEX �������������������.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX ���������.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX Nalogi.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX Dokuments.PR_KEY',ConnectSource);

      ConnectSource.IsConnected:=false;
    end;
    ConnectSource.Free;
  end;
  if nErr=0 then begin
    //-------------------------------------------------
    //-- ����������� ----------------------------------
    //-------------------------------------------------
    AddToProtokol('->����������� ������������');
    ChangeMessage('����������� ������������');

    lOk:=true;
    //------ ���������� ���������� �������
    lOk:=lOk and CheckSprPunkt;

    //------ ���������� ����� ����
    sl:=TStringList.Create;
    sl.AddObject('TIP=',dmBase.SprUL);
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprTypeUL,sl);
    sl.Clear;
    //------ ���������� ����
    CheckSprUL(strPunkt);

    sl.AddObject('OTNOSH='+strWhere,dmBase.tbMens);    //------ ��������� � ����� ���������
    sl.AddObject('OTNOSH=',dmBase.tbSostavSem);
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprOtnosh,sl);
    sl.Clear;
    sl.AddObject('PENS_TIP='+strWhere,dmBase.tbMens );    //------  ���� ������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprTypePens,sl);
    {
    sl.Clear;
    sl.AddObject('STUDENT='+strWhere,dmBase.tbMens );    //------  ��� ������� (�����,�������)
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprMestOb,sl);
    sl.Clear;
    sl.AddObject('STUDENT_TYPE='+strWhere,dmBase.tbMens );    //------  ����� ��������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprFormOb,sl);
    }
    sl.Clear;
    sl.AddObject('STUDENT_SPR='+strWhere,dmBase.tbMens );    //------  ������� ���������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprUchZaved,sl);
    sl.Clear;
    sl.AddObject('WORK_SPR='+strWhere,dmBase.tbMens );    //------  ����� ������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprWork,sl,TypeObj_Organ);
    sl.Clear;
    sl.AddObject('DOLG_SPR='+strWhere,dmBase.tbMens );    //------  ���������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprDolg,sl);
    sl.Clear;
    if dmBase.tbVUS.Active then begin
      sl.AddObject('KOMISS=',dmBase.tbVUS );    //------  ����������� ��������
      lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprKomiss,sl);
      sl.Clear;
      sl.AddObject('SPEC=',dmBase.tbVUS );    //------  ������� ���
      lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprOsobOtm,sl);
    end;
    sl.Clear;
    sl.AddObject('PRICH='+strWhere,dmBase.tbMensDvig );  //------ ���� ��������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprTypeMigr,sl);
    sl.Clear;
    sl.AddObject('KOD='+strWhere,dmBase.tbMensLgot );  //------ ��������� ����������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprLgot,sl);
    sl.Clear;
    sl.AddObject('KOD='+strWhere,dmBase.tbMensPr );    //------ �������� ���������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPrNasel,sl);
    sl.Clear;
    sl.AddObject('KOD='+strWhere,dmBase.tbLichPr );    //------ �������� ������� ������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPrLich,sl);
    sl.Clear;
    sl.AddObject('PREDST='+strWhere,dmBase.tbAdres );    //------ ��������� ������������ �����
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPredst,sl);
    sl.Clear;
    sl.AddObject('TYPEHOUSE='+strWhere,dmBase.tbLich );  //------ ��� ����������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprTypeHouse,sl);
    sl.Clear;
    sl.AddObject('PRICH_SOZD='+strWhere,dmBase.tbLich );  //------ ������� �������� ���. �����
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPrSozd,sl);
    sl.Clear;
    sl.AddObject('PRICH_LIKV='+strWhere,dmBase.tbLich );  //------ ������� ������. ���. �����
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPrLikv,sl);
    sl.Clear;
    sl.AddObject('VALUE;NVALUE=pokaz='+QStr('MAT_STEN'),dmBase.tbProp);  // �������� ����
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprMatSten,sl);
    sl.Clear;
    //---------------------------------------------------------------------------------------------
    sl.Free;

    //������������� ID
    try

      if lOk then begin
        AddToProtokol('->���������� ����������� ������');
        ChangeMessage('���������� ����������� ������');
      end;
      {
      nMaxID:=MaxID;
      if nMaxID=-1 then begin
        nErr:=ERR_MAX_ID;
        lOk:=false;
      end;
      }

      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.��������� SET id_base='+strIdBase+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.������������ SET id_base='+strIdBase+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.��������� SET id_base='+strIdBase+strWhere);

      lOk:=lOk and ExecuteSQL('delete from VUS where id in (select v.id from VUS v left join ��������� n on n.id=v.id and n.date_fiks=''1899-12-30'' where n.id is null);');

      if nNewNomerLic>0
        then lOk:=lOk and ExecuteSQL('UPDATE LoadBase.������������ SET nomer=nomer+'+IntToStr(nNewNomerLic)+' WHERE nomer is not null'+strAddWhere);
      if strAddNomerKniga<>''
        then lOk:=lOk and ExecuteSQL('UPDATE LoadBase.������������ SET kniga_nomer=trim(kniga_nomer)+'+QStr(strAddNomerKniga)+' WHERE kniga_nomer is not null'+strAddWhere);


      if lOk then begin
//        strTables:='���������,HouseOwners,SprOwners,������������,��������������������,���������,'+
        strTables:='���������,HouseOwners,������������,��������������������,���������,'+
                   '������������,�����������������,���������������,�����������������,'+
                   'VUS,Ochered,SostavSem,�������������������,���������,Nalogi,Dokuments';
        StrToArr(strTables,arrTables,',',true);
        for i:=Low(arrTables) to High(arrTables) do begin
          ChangeMessage('�������� ������� "'+arrTables[i]+'"');
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

  // ������������ �������: HouseProps
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
// ����������� ���
// strDirSource - ���� � ����������� ����
// lOnlyCurSost - ������ ������� ���������
// lAllPunkt    - ������� ��� ���������� ������ ������
// nNewNomerLic - �� ������� ����������� ����� �������� �����
// strAddNomerKniga - �������������� ����� � ������ �����
//---------------------------------------------------------------
function TdmBase.RunLoadBase(strDirSource:String; lOnlyCurSost:Boolean; lAllPunkt:Boolean; lZAGS:Boolean; nNewNomerLic:Integer; strAddNomerKniga:String; slCheckSpr:TStringList) : Integer;
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
  ChangeMessage('���������� ��������');

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

    // ���� �� ��� ���������� ������ ������ ������ ������� � �������������
    if not lAllPunkt then begin
      WorkQuery.SQL.Text:='SELECT s.ID PUNKT, Trim(tp.name)+'+QStr(' ')+'+s.name FULLNAME '+
                          'FROM LoadBase.������������� s LEFT JOIN SysSpr.TypePunkt tp ON typepunkt=tp.id';
      WorkQuery.Open;
      sl:=TStringList.Create;
      CloseMessage;
      if not NotLoadPunkts(WorkQuery, sl) then begin
        nErr:=ERR_EXIT;
      end;
      WorkQuery.Close;
      OpenMessage(Replicate('_',50),'',10);
      ChangeMessage('�������� �� �������� ���������� �������');
      if nErr=0 then begin
        for i:=0 to sl.Count-1 do begin
          DeletePunkt(StrToInt(sl.Strings[i]), ConnectSource, false, true);
        end;
      end;
      sl.Free;
    end;       

    if nErr=0 then begin
      ExecuteSQL('DROP INDEX BigHouse.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX ���������.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX HouseOwners.PR_KEY',ConnectSource);
//      ExecuteSQL('DROP INDEX SprOwners.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX ������������.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX ��������������������.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX ���������.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX VUS.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX OCHERED.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX OCHERED.MEN_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX SostavSem.PR_KEY',ConnectSource);

      ExecuteSQL('DROP INDEX ������������.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX �����������������.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX �����������������.PR_KEY',ConnectSource);

      // ������ �� ���� ������ �� ��������� ���� KOD, ������� ����������� � ����������� �������������
      ExecuteSQL('DELETE FROM ��������������� WHERE kod in (select distinct kod from ��������������� n left join ������������� s on n.kod=s.id where s.id is null)',ConnectSource);
      ExecuteSQL('DROP INDEX ���������������.PR_KEY',ConnectSource);

      ExecuteSQL('DROP INDEX �������������������.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX ���������.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX Nalogi.PR_KEY',ConnectSource);
      ExecuteSQL('DROP INDEX Dokuments.PR_KEY',ConnectSource);

      ConnectSource.IsConnected:=false;
    end;
    ConnectSource.Free;
  end;
  if nErr=0 then begin
    //-------------------------------------------------
    //-- ����������� ----------------------------------
    //-------------------------------------------------
    ChangeMessage('����������� ������������');

    lOk:=true;
    //------ ���������� ���������� �������
    lOk:=lOk and CheckSprPunkt;

    //------ ���������� ����� ����
    sl:=TStringList.Create;
    sl.AddObject('TIP=',dmBase.SprUL);
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprTypeUL,sl);
    sl.Clear;
    //------ ���������� ����
    CheckSprUL('');

    sl.AddObject('OTNOSH='+strWhere,dmBase.tbMens);    //------ ��������� � ����� ���������
    sl.AddObject('OTNOSH=',dmBase.tbSostavSem);
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprOtnosh,sl);
    sl.Clear;
    sl.AddObject('PENS_TIP='+strWhere,dmBase.tbMens );    //------  ���� ������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprTypePens,sl);
    {
    sl.Clear;
    sl.AddObject('STUDENT='+strWhere,dmBase.tbMens );    //------  ��� ������� (�����,�������)
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprMestOb,sl);
    sl.Clear;
    sl.AddObject('STUDENT_TYPE='+strWhere,dmBase.tbMens );    //------  ����� ��������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprFormOb,sl);
    }
    sl.Clear;
    sl.AddObject('STUDENT_SPR='+strWhere,dmBase.tbMens );    //------  ������� ���������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprUchZaved,sl);
    sl.Clear;
    sl.AddObject('WORK_SPR='+strWhere,dmBase.tbMens );    //------  ����� ������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprWork,sl,TypeObj_Organ);
    sl.Clear;
    sl.AddObject('DOLG_SPR='+strWhere,dmBase.tbMens );    //------  ���������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprDolg,sl);
    sl.Clear;
    if dmBase.tbVUS.Active then begin
      sl.AddObject('KOMISS=',dmBase.tbVUS );    //------  ����������� ��������
      lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprKomiss,sl);
      sl.Clear;
      sl.AddObject('SPEC=',dmBase.tbVUS );    //------  ������� ���
      lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprOsobOtm,sl);
    end;
    sl.Clear;
    sl.AddObject('PRICH='+strWhere,dmBase.tbMensDvig );  //------ ���� ��������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprTypeMigr,sl);
    sl.Clear;
    sl.AddObject('KOD='+strWhere,dmBase.tbMensLgot );  //------ ��������� ����������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprLgot,sl);
    sl.Clear;
    sl.AddObject('KOD='+strWhere,dmBase.tbMensPr );    //------ �������� ���������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPrNasel,sl);
    sl.Clear;
    sl.AddObject('KOD='+strWhere,dmBase.tbLichPr );    //------ �������� ������� ������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPrLich,sl);
    sl.Clear;
    sl.AddObject('PREDST='+strWhere,dmBase.tbAdres );    //------ ��������� ������������ �����
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPredst,sl);
    sl.Clear;
    sl.AddObject('TYPEHOUSE='+strWhere,dmBase.tbLich );  //------ ��� ����������
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprTypeHouse,sl);
    sl.Clear;
    sl.AddObject('PRICH_SOZD='+strWhere,dmBase.tbLich );  //------ ������� �������� ���. �����
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPrSozd,sl);
    sl.Clear;
    sl.AddObject('PRICH_LIKV='+strWhere,dmBase.tbLich );  //------ ������� ������. ���. �����
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprPrLikv,sl);
    sl.Clear;
    sl.AddObject('VALUE;NVALUE=pokaz='+QStr('MAT_STEN'),dmBase.tbProp);  // �������� ����
    lOk:=lOk and dmBase.CheckOneSprLoadBase(dmBase.SprMatSten,sl);
    sl.Clear;
    //---------------------------------------------------------------------------------------------
    sl.Free;

    //������������� ID
    try

      if lOk then
        ChangeMessage('���������� ����������� ������ �������');

      nMaxID:=MaxID;
      if nMaxID=-1 then begin
        nErr:=ERR_MAX_ID;
        lOk:=false;
      end;

      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.��������� SET id=id+'+IntToStr(nMaxID)+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.HouseOwners SET id=id+'+IntToStr(nMaxID)+', kod=kod+'+IntToStr(nMaxID)+strWhere);
// !!!vadim     lOk:=lOk and ExecuteSQL('UPDATE LoadBase.HouseResh SET id=id+'+IntToStr(nMaxID)+strWhere);
//      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.SprOwners SET id=id+'+IntToStr(nMaxID));
      if lOk then
        ChangeMessage('���������� ����������� ������ ������� ������');
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.������������ SET id=id+'+IntToStr(nMaxID)+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.������������ SET first=first+'+IntToStr(nMaxID)+' WHERE first is not null and first>0'+strAddWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.������������ SET adres_id=adres_id+'+IntToStr(nMaxID)+' WHERE adres_id is not null and adres_id>0'+strAddWhere);
      if nNewNomerLic>0
        then lOk:=lOk and ExecuteSQL('UPDATE LoadBase.������������ SET nomer=nomer+'+IntToStr(nNewNomerLic)+' WHERE nomer is not null'+strAddWhere);
      if strAddNomerKniga<>''
        then lOk:=lOk and ExecuteSQL('UPDATE LoadBase.������������ SET kniga_nomer=trim(kniga_nomer)+'+QStr(strAddNomerKniga)+' WHERE kniga_nomer is not null'+strAddWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.�������������������� SET id=id+'+IntToStr(nMaxID)+strWhere);
      if lOk then
        ChangeMessage('���������� ����������� ������ ���������');
          
      // ��������� ����� � ������� ����� �� �����
//      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.��������� SET id=id+'+IntToStr(nMaxID)+', ochered=false '+strWhere);

      // ��������� �������� ����� � �������
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.��������� SET id=id+'+IntToStr(nMaxID)+strWhere);

      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.��������� SET pa_id=pa_id+'+IntToStr(nMaxID)+' WHERE pa_id is not null and pa_id>0'+strAddWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.��������� SET ma_id=ma_id+'+IntToStr(nMaxID)+' WHERE ma_id is not null and ma_id>0'+strAddWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.��������� SET owner_id=owner_id+'+IntToStr(nMaxID)+' WHERE owner_id is not null and owner_id>0'+strAddWhere);

      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.��������� SET lic_id=lic_id+'+IntToStr(nMaxID)+' WHERE lic_id is not null and lic_id>0'+strAddWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.��������� SET adres_id=adres_id+'+IntToStr(nMaxID)+' WHERE adres_id is not null and adres_id>0'+strAddWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.��������� SET ADRES_ID_GIT=ADRES_ID_GIT+'+IntToStr(nMaxID)+' WHERE ADRES_ID_GIT is not null and ADRES_ID_GIT>0'+strAddWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.������������ SET id=id+'+IntToStr(nMaxID));
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.��������������� SET id=id+'+IntToStr(nMaxID));
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.����������������� SET id=id+'+IntToStr(nMaxID)+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.��������������� SET id=id+'+IntToStr(nMaxID)+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.����������������� SET id=id+'+IntToStr(nMaxID)+strWhere);
      // ���
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.VUS SET id=id+'+IntToStr(nMaxID));
      // �������
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.Ochered SET id=id+'+IntToStr(nMaxID));
      // !!! ���� AUTO_ID !!!
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.OcheredResh SET id=id+'+IntToStr(nMaxID));
      if lOk then begin
        lOk:=ExecuteSQL('UPDATE LoadBase.SostavSem SET id=id+'+IntToStr(nMaxID)+', member_id=member_id+'+IntToStr(nMaxID));
      end;

      if lOk then
        ChangeMessage('���������� ����������� �������������� ������');
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.BaseProp SET id=id+'+IntToStr(nMaxID)+' WHERE typeobj=1 or typeobj=2 or typeobj=3 ');
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.BaseTextProp SET id=id+'+IntToStr(nMaxID)+' WHERE typeobj=1 or typeobj=2 or typeobj=3 ');
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.������������������� SET id=id+'+IntToStr(nMaxID)+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.��������� SET id=id+'+IntToStr(nMaxID)+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.Nalogi SET id=id+'+IntToStr(nMaxID)+strWhere);
      lOk:=lOk and ExecuteSQL('UPDATE LoadBase.Dokuments SET id=id+'+IntToStr(nMaxID)+strWhere);

      lOk:=lOk and ExecuteSQL('DELETE FROM LoadBase.��������� WHERE new_id>0'+strAddWhere);

      if lOk then begin
//        strTables:='���������,HouseOwners,SprOwners,������������,��������������������,���������,'+
        strTables:='���������,HouseOwners,HouseResh,������������,��������������������,���������,'+
                   '������������,���������������,�����������������,���������������,�����������������,'+
                   'VUS,Ochered,OcheredResh,SostavSem,�������������������,���������,Nalogi,Dokuments';
        StrToArr(strTables,arrTables,',',true);
        for i:=Low(arrTables) to High(arrTables) do begin
          ChangeMessage('����������� ������� "'+arrTables[i]+'"');
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

      // ��������� � ���� OcheredResh IS_LAST_RESH, ID_POST_RESH, ID_SN_RESH
      //----------------------------------------------------------
      if lOk then begin
        ChangeMessage('���������� ������� �����������');
        SetIDLastReshOchered;
      end;

    except
      on E : Exception do begin
        LastError:=E.Message;
      end;
    end;

  // ������������ �������: HouseProps
  //------------------------------------------------------------------------------------------------------
    if lOk then begin
      nMaxID:=MaxID;
      m:=GetLastID;
      if nMaxID > m then begin
        ChangeMessage('�������������� ������� "���������������"');
        while nMaxID > m do begin
          m:=getNewID(0);
        end;
      end;
    end;

  end;

  if lOk and lZAGS then begin
    strTables:='������������,����������������,�����������,����������������,DeclareMarriage';
    StrToArr(strTables,arrTables,',',true);
    for i:=Low(arrTables) to High(arrTables) do begin
      ChangeMessage('����������� ������� "'+arrTables[i]+'"');
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

{$IFDEF ZAGS}
function TdmBase.RunLoadBase(strDirSource:String; lOnlyCurSost:Boolean; lAllPunkt:Boolean; lZAGS:Boolean;
                             nNewNomerLic:Integer; strAddNomerKniga:String; slCheckSpr:TStringList) : Integer;
begin
  // ��� zags ��� �����������
end;
{$ENDIF}

{$IFDEF OPEKA}
function TdmBase.RunLoadBase(strDirSource:String; lOnlyCurSost:Boolean; lAllPunkt:Boolean; lZAGS:Boolean;
                             nNewNomerLic:Integer; strAddNomerKniga:String; slCheckSpr:TStringList) : Integer;
begin
  // ��� ����� ��� �����������
end;
{$ENDIF}

//----------------------------------------------------------
function TdmBase.CheckSprPunkt : Boolean;
begin
  Result:=true;
end;

//----------------------------------------------------------
function TdmBase.CheckSprUL(sPunkt:String) : Boolean;
var
  i:Integer;
  sl:TStringList;
  sCASE,s,ss:String;
begin
  AddToProtokol('----------------- ���������� ���� (BEGIN)------------------');
  s:=';';
  WorkQuery.Close;
  WorkQuery.SQL.Text := 'select distinct ul from LoadBase.��������� where ul is not null';
  WorkQuery.Open;
  while not WorkQuery.Eof do begin
    s:=s+WorkQuery.Fields[0].AsString+';';
    WorkQuery.Next;
  end;
  WorkQuery.Close;

  Result:=true;
  sl:=TStringList.Create;
  //----- �������������� ����� �� "tip+name" ------- ()
  WorkQuery.SQL.Text := 'select so.*, sn.id id_cur, sn.name name_cur, sn.tip tip_cur'+#13+
                ' from LoadBase.������� so'+#13+
                ' left join ������� sn on so.name=sn.name and so.tip=sn.tip '+#13+
                ' where sn.id is not null';
  WorkQuery.Open;
  AddToProtokol(WorkQuery.SQL.Text+' -> RecordCount:'+IntToStr(WorkQuery.RecordCount));
  while not WorkQuery.Eof do begin
    if WorkQuery.FieldByName('ID').AsInteger<>WorkQuery.FieldByName('ID_CUR').AsInteger then begin
      sl.Add( WorkQuery.FieldByName('ID').AsString+'='+WorkQuery.FieldByName('ID_CUR').AsString );
    end;
    WorkQuery.Next;
  end;
  //----- �� �������������� ����� -------
  WorkQuery.SQL.Text := 'select so.*, sn.id id_cur, sn.name name_cur, sn.tip tip_cur'+#13+
                ' from LoadBase.������� so'+#13+
                ' left join ������� sn on so.name=sn.name and so.tip=sn.tip '+#13+
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
      Result:=ExecuteSQL('UPDATE LoadBase.��������� SET '+sCase); // AdsConnection.Execute(sSQL);
      if Result
        then Result:=ExecuteSQL('UPDATE LoadBase.BigHouse SET '+sCase);
    end;
  end;
  sl.Free;
  AddToProtokol('----------------- ���������� ���������� ������� (END)------------------');
end;

//----------------------------------------------------------
// tbSpr - ������� ����������
// slTables - ������ ������ � ����� � ��� ��� ��������
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
  AddToProtokol('---------- ���������� '+sName+' (BEGIN) -----------------');
  q := TAdsQuery.Create(nil);
  with q do begin
    SourceTableType := ttAdsADT;
    AdsTableOptions.AdsCharType := ANSI;
    DataBaseName := 'AdsConnection';
    Name := 'qTmp';
  end;
// ID NAME
  //------ ������ � ����������� �����������, ������� ��� ������������ � ������� ----------
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
  // ������� ����������� ������
  while not q.Eof do begin
    tbSpr.Append;
    s:='';
    for i:=0 to tbSpr.FieldCount-1 do begin
      if tbSpr.Fields[i].FieldName='ID' then begin
        if not lAutoInc then begin
          if nTypeObj>0 then begin
            n:=GetNewID(nTypeObj);   // ����������� ����� ID
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
        PutError('����������:'+sName+#13#10+s+#13#10+E.Message);
      end;
    end;
    if not Result then break;
    q.Next;
  end;
  if Result then begin
    //------ ��������� ������ � ����������� �����������, ������� ����� �������������� � ����������� ���� ----------
    q.SQL.Text := 'select so.id id_load, so.name name_load, sn.id id_cur, sn.name name_cur'+#13+
                  ' from LoadBase.'+sName+' so'+#13+
                  ' left join '+sName+' sn on so.name=sn.name'+#13+
                  ' where so.id<>sn.id ';

    q.Open;
    AddToProtokol(q.SQL.Text+' -> RecordCount:'+IntToStr(q.RecordCount) );

    if q.RecordCount>0 then begin
      // ������� �� ���� ��������
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
    AddToProtokol('----------------- ���������� '+sName+' (END) ------------------');
  end else begin
    AddToProtokol('������ �������� �����������: '+sName);
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
// ������ �������� ����������� ������ �� ���� !!!
//-------------------------------------------------------------
function TdmBase.DeletePunkt(v: Variant; Conn:TAdsConnection; lFromSpr:Boolean; lDelFreeMen:Boolean): Boolean;
begin
  Result := false;
end;

//---------------------------------------------------------------------
function TdmBase.CheckWriteOtkudaPrib(ds: TDataSet): Boolean;
begin
  Result:=true;
           // ����������� ������� � ��� �� ��������
  if (not ds.FieldByName('OP_GOSUD').IsNull and (ds.FieldByName('OP_GOSUD').AsInteger<>MY_GRAG)) or
     (ds.FieldByName('OP_OBL').AsString<>'') or (ds.FieldByName('OP_RAION').AsString<>'')
     or (ds.FieldByName('OP_GOROD').AsString<>'') then begin  // ������� ������� ��� ����� ��� ���.�����
    Result:=false;   // ���������� �� ����
  end;
end;

//---------------------------------------------------------------------
// ��� ����� �� ���� ������
function TdmBase.NameDirFromTypeObj(nTypeObj:Integer; sAddDir1,sAddDir2:String; lFull:Boolean):String;
var
  strDir,s:String;
  n:Integer;
begin
  strDir:='';
  {
  if nTypeObj = dmBase.TypeObj_Lich then begin
    strDir := '�������C����';
  end else if nTypeObj = dmBase.TypeObj_Nasel then begin
    strDir := '���������';
  end else if nTypeObj = dmBase.TypeObj_Adres then begin
    strDir := '����';
  end else if nTypeObj = dmBase.TypeObj_ZBrak then begin
    strDir := '����������������';
  end else if nTypeObj = dmBase.TypeObj_ZRogd then begin
    strDir := '������������';
  end else if nTypeObj = dmBase.TypeObj_ZSmert then begin
    strDir := '�����������';
  end else if nTypeObj = dmBase.TypeObj_ZUstOtc then begin
    strDir := '����������������';
  end else if nTypeObj = dmBase.TypeObj_ZUstMat then begin
    strDir := '������������������';
  end else if nTypeObj = dmBase.TypeObj_ZAdopt then begin
    strDir := '���������������';
  end else if nTypeObj = dmBase.TypeObj_ZRast then begin
    strDir := '�����������������';
  end else if nTypeObj = dmBase.TypeObj_ZChName then begin
    strDir := '��������������';
  end else if nTypeObj = dmBase.TypeObj_Passport then begin
    strDir := '�������';
  end else if nTypeObj = dmBase.TypeObj_TalonPrib then begin
    strDir := '��������������';
  end else if nTypeObj = dmBase.TypeObj_TalonUbit then begin
    strDir := '������������';
  end else if nTypeObj = dmBase.TypeObj_DeclareRegistr then begin
    strDir := '�������������������';
  end else if nTypeObj = dmBase.TypeObj_ZAGS_AddDok then begin
    strDir := '�����������������������';
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
   end else if nTypeObj=_TypeObj_Opeka then begin
     Result:=tbZapisOpeka;
   end;
   {
   TypeObj_BigHouse : Result:= Integer;
   TypeObj_Adres : Integer;
   TypeObj_Lich  : Integer;
   TypeObj_Nasel : Integer;
   TypeObj_Passport : Integer;
   TypeObj_DeclareRegistr :
   TypeObj_TalonPrib: Integer;
   TypeObj_TalonUbit: Integer;
   TypeObj_PassportViza: Integer;
   TypeObj_Owners: Integer;
   TypeObj_PasportTerr: Integer;  // ������� ����������
   TypeObj_Sovet: Integer;  // ������ �����
   TypeObj_Ochered : Integer;
   TypeObj_VUS : Integer;
   TypeObj_Organ : Integer;
   TypeObj_Obrach: Integer;  // ��������� �������
   TypeObj_Spr: Integer;
   TypeObj_ZAGS_AddDok:Integer;          //
   TypeObj_ZAGS_SprAkt:Integer;          // ������� � ������ ���� ��. ���������
   TypeObj_ZAGS_SprOtsut:Integer;        // ������� �� ���������� ������� ������
   TypeObj_ZAGS_IzvOtsut:Integer;        // ��������� �� ���������� ������� ������
   TypeObj_ZAGS_ZaklChName:Integer;      // ���������� � �������� �����, �������
   TypeObj_ZAGS_SprBrak:Integer;         // ������� � ������ ���� � �����
   TypeObj_ZAGS_SprRogd:Integer;         // ������� � ������ ���� � ��������
   TypeObj_ZAGS_SprSmert:Integer;        // ������� � ������ ���� � ������
   TypeObj_ZAGS_SprChName:Integer;       //
   TypeObj_ZAGS_SprRast:Integer;         //
   TypeObj_ZAGS_ZaklIzmAkt:Integer;      //  ���������� � ��������� ������� ������
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

//-------------------------------------------------------------------
function TdmBase.TypeObjForMens(TypeObj:Integer):Boolean;
begin
  if (TypeObj=_TypeObj_Nasel) or (TypeObj=_TypeObj_Adres) or (TypeObj=_TypeObj_Lich) then begin
    Result:=true;
  end else begin
    Result:=false;
  end;
end;

//----------------------------------------------------------------
function TdmBase._LockTypeObj(nTypeObj:Integer; strMessage:String):Boolean;
var
  lOpenMessage,lMessage:Boolean;
begin
  if strMessage='' then strMessage:='������ ������������ ��������� �������� ... ';
  Result:=true;
  if not dmBase.LockTypeObj.Locate('TYPEOBJ', nTypeObj, []) then begin
    dmBase.LockTypeObj.Append;
    dmBase.LockTypeObj.FieldByName('TYPEOBJ').AsInteger:=nTypeObj;
    dmBase.LockTypeObj.Post;
  end;
  Result:=false;
  lOpenMessage:=false;
  lMessage:=false;
  while not Result do begin
    if lOpenMessage and not lMessage then begin
      OpenMessageEx(strMessage,'��������� ����������',10,'  ��������  ');
      lMessage:=true;
    end;
    try
      dmBase.LockTypeObj.Edit;                                         // ������ �����������
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
end;
//----------------------------------------------------------------
procedure TdmBase._UnLockTypeObj(nTypeObj:Integer);
begin
  if LockTypeObj.State=dsEdit then begin
    LockTypeObj.Cancel;
  end;
end;

// ���������� ������ BOOKMARK ��������� �������
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
      tb.IndexFieldNames:='NOMER;DATEZ';
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
      if sBookMark<>'' then begin  // ������� �� ������ ��������� ��������
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
  fDok:TfmSimpleD;
  fldVosstan:TField;
begin
  strErr:='';
  Result:=true;
  lErr:=false;
  if FormDok=nil then begin
    fDok:=nil;
  end else begin
    fDok:=TfmSimpleD(FormDok);
  end;
  lSeek:=false;
  {
  if fDok<>nil then begin
    if fDok.FOnlySvid then begin
      Result:=false;
      lSeek:=true;        // ������ ����� ������� ������
      nIDAkt:=-1;
//      lCheckVosstan:=false;
    end;
  end;
  }
  sBookMark:='';
  n:=Globaltask.ParamAsInteger('KONT_NOMERAKT');   // 0-�� ��������������  1-������� ��������  2-�������� � ��������
  if ((n>0) or lSeek) and (nNomer>0) and (dDate>0) then begin
    tb:=MainTableFromTypeObj(nTypeObj);

    if tb<>nil then begin
      st:=SaveSostTable(tb,true,true);
      if (nTypeObj=TypeObj_ZBrak) or (nTypeObj=TypeObj_ZRogd) or (nTypeObj=TypeObj_ZSmert) then begin
//        lCheckVosstan:=true;           // ��������� <����������.>  <�� ����������.> ������� ������
        fldVosstan:=tb.FindField('VOSSTAN');
      end else begin
//        lCheckVosstan:=false;
        fldVosstan:=nil;
      end;
      {$IFNDEF ZAGS}
        fldVosstan:=nil;
//        lCheckVosstan:=false;
      {$ENDIF}
      tb.IndexFieldNames:='NOMER;DATEZ';
      d1:=STOD(IntToStr(YearOf(dDate))+'0101',tdClipper);
      d2:=STOD(IntToStr(YearOf(dDate))+'1231',tdClipper);
      tb.SetRange([nNomer,d1],[nNomer,d2]);
      while not tb.Eof do begin
        if (tb.FieldByName('ID_ZAGS').AsInteger=nIDZags) and ((fldVosstan=nil) or (fldVosstan.AsBoolean=lVosstan)) then begin
          if (nIDAkt<1) then begin  // ����� ������� ������
            if tb.FieldByName('NOMER').AsInteger=nNomer then begin
              if lSeek then begin  // ������ ����� ����� ������ �� ������, ���� � ID �����
                sBookMark:=tb.Bookmark;
                Result:=true;
              end else begin
                lErr:=true;
              end;
            end;
          end else begin            // ������� ������ ��� ����������
            // ���� �� ���� ����� ������ � ����� ����������
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
          strErr:='������';
          if (fldVosstan<>nil) and lVosstan
            then strErr:='��������������� ������� ������';
          strErr:=strErr+' � �������: '+IntToStr(nNomer)+' ��� ����������.'+#13+'��������: '+FormatDateTime('dd.mm.yyyy',tb.FieldByName('DATEZ').AsDateTime)+'�.'+#13+sName;
          if n=2 then begin
            if Problem(strErr+#13+'���������� ������?') then begin
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
      // ���������� ������ �������� � �����
      if lSeek and (sBookMark<>'') then begin
        tb.Bookmark:=sBookMark;
      end;
    end;
  end;
end;

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
  i,nID:Integer;
begin
  s := '';
  s := s + '��������!'#13; // + Chr(13)+
  s := s + '����� ���������� �������� ���������� � ���� ����� ����������.'#13;
  s := s + '���� �� ������� � ������������� ���������� ��������,'#13;
  s := s + '������� ����� �� � ���� �����'#13;
  if OkWarning(s) then begin
     OpenMessage('������� ���� ...');
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
             PutError('������ ������� ����:'+Chr(13)+Chr(10)+E.Message+Chr(13)+Chr(10)+s);
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
  p:=PasportFromValues(UdostKod,Seria,Nomer,Organ,LichNomer,vDateV);
  Result:=PasportToText(p, nType);
end;
//--------------------------------------------------------------------------------
function TdmBase.DeclareBrakToAkt(sl:TStringList; strSeriaSvid,strNomerSvid:String; nNomer:Integer; dDateZ:TDateTime; nLenSoato:Integer): Boolean;
begin
  Result:=false;
end;

//--------------------------------------------------------------------------------
function TdmBase.DeclareRastToAkt(sl:TStringList; strSeriaSvid,strNomerSvid:String; nNomer:Integer; dDateZ:TDateTime; nLenSoato:Integer): Boolean;
begin
  Result:=false;
end;
function TdmBase.TypeObj_UZRogd: Integer;
begin
  Result:=_TypeObj_UZRogd;
end;

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
    ss:='��� ��.)'
  end;
  OpenMessage('���������� ���������������� ��������'+ss+' ...');
  try
    MemoWrite('last.sql',s);
    AdsConnection.Execute(s);
  except
    on E: Exception do begin
      CloseMessage;
      Result:=false;
      PutError('������:'+E.Message);
    end;
  end;
  if Result then CloseMessage;
end;

//---------------------------------------------------------
procedure TdmBase.Event_CheckStringFilter(var sFilter:String);   // �������� �������� FILTER � OpisEdit  !!!
begin
  sFilter:=CheckTypeShablon(sFilter);   // fShablon.pas
end;
{
//--------------------------------------------------------------
function TdmBase.GetDateDelo(nType:Integer; nDelo:Integer; var dBegin:TDateTime; var dEnd:TDateTime; var sText:String):Integer;
var
  fldBegin, fldEnd:TField;
  sB:String;
begin
  Result:=0;
  dBegin:=0;
  dEnd:=0;
  with SprDocFileList do begin
    sB:=Bookmark;
    fldBegin:=FieldByName('DATE_BEGIN');
    fldEnd:=FieldByName('DATE_END');
    while nDelo>0 do begin
      if Locate('ID', nDelo, []) then begin
        nDelo:=FieldByName('PARENT_ID').AsInteger;
        if not fldBegin.IsNull and ((dBegin=0) or (fldBegin.AsDateTime>dBegin))
          then dBegin:=fldBegin.AsDateTime;
        if not fldEnd.IsNull and ((dEnd=0) or (fldEnd.AsDateTime<dEnd))
          then dEnd:=fldEnd.AsDateTime;
      end else begin
        nDelo:=0;
      end;
      Bookmark:=sB;
    end;
  end;
  if dBegin>0 then Inc(Result,1);
  if dEnd>0   then Inc(Result,1);
  sText:='';
  if (nType>0) and (Result>0) then begin
    if nType=1 then begin
      if (dEnd>0) then begin
//        if dBegin=0
//          then sText:=' (��'
//          else sText:=' (� '+DatePropis(dBegin,3)+' ��';
//        sText:=sText+' '+DatePropis(dEnd,3)+')';
        sText:=' ('+DatePropis(dEnd,3)+')';
      end;
    end;
  end;
end;
}
end.




