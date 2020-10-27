unit uProject;

interface

{$I Task.inc}

uses
  Windows, Classes, Messages, Dialogs,SysUtils, Forms, OpisEdit, funcPr, funcEh, dbFunc, MetaTask,mPermit, NativeXML,StdCtrls,
  {$IFDEF USE_TEMPLATE} mTempl, mTplInt, {$ENDIF}
  fShowErrorGISUN,fmChList, uSaveMemTable, kbmMemCSVStreamFormat, uUtilFiles, iniFiles, uCheckKod, TypInfo, DBCtrls,
  uJSON, DateUtils, ShellApi, uTypes, uProjectAll, fLogon, fMyNotify, Math, ExtCtrls,
  TasksEx, AsyncCalls,
  adscnnct,
  IdFTP, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, IdSocks, IdSMTP, IdException,
  IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdPOP3, IdCoder, IdCoder3to4, IdCoderMIME,
  ifpii_dbfunc,fCheckMens,DBCtrlsEh,dbGridEh,Controls, uDataSet2XML, uPadegFIO, fShowPokaz,
  {$IFDEF USE_FR3} frxClass, frxDBSet, ReportTask, {$ENDIF}
  {$IFDEF HUNSPELL} HunSpell, HunSpellDbMemo, HunSpellMemo, HunSpellDialog, HunSpellApi, {$ENDIF}
  mVerInfo, registry, ShlObj, ComObj, DsiWin32, kbmMemTable, db,TB2Toolbar,TB2Item,Graphics,Variants, SasaIniFile;

const
// Bit values for the access permissions.  ACCESS_ALL is a handy
// way to specify maximum permissions.  These are used in
// acl_access field of access_list structures.

  {$EXTERNALSYM ACCESS_READ}
  ACCESS_READ      = $01;
  {$EXTERNALSYM ACCESS_WRITE}
  ACCESS_WRITE     = $02;
  {$EXTERNALSYM ACCESS_CREATE}
  ACCESS_CREATE    = $04;
  {$EXTERNALSYM ACCESS_EXEC}
  ACCESS_EXEC      = $08;
  {$EXTERNALSYM ACCESS_DELETE}
  ACCESS_DELETE    = $10;
  {$EXTERNALSYM ACCESS_ATRIB}
  ACCESS_ATRIB     = $20;
  {$EXTERNALSYM ACCESS_PERM}
  ACCESS_PERM      = $40;
  {$EXTERNALSYM ACCESS_FINDFIRST}
  ACCESS_FINDFIRST = $80;

  {$EXTERNALSYM ACCESS_GROUP}
  ACCESS_GROUP     = $8000;

  {$EXTERNALSYM ACCESS_NONE}
  ACCESS_NONE = 0;
  {$EXTERNALSYM ACCESS_ALL}
  ACCESS_ALL = ACCESS_READ or ACCESS_WRITE or ACCESS_CREATE or ACCESS_EXEC or
               ACCESS_DELETE or ACCESS_ATRIB or ACCESS_PERM or ACCESS_FINDFIRST;

  SHTAMP_CH3=1;   // 3 значения
  SHTAMP_CH2=2;   // 2 значения

  CHECK_EN=1;

  RUN_REPORT=1;
  RUN_SOOB=2;

  CATEGORY_OBL   = 1;
  CATEGORY_RAION = 2;
  CATEGORY_SS    = 3;
  CATEGORY_PUNKT = 4;
  CATEGORY_RNGOROD=5;
type

  TGetHistoryValue = procedure(Sender : TObject; var strValue : String) of object;
  TCheckEventsGrid = procedure(Sender : TObject; var strValue : String) of object;

  TArrWinControl = array of TWinControl;

  TAddControl=class(TObject)
  public
    EControl   : TWinControl;
    ValueTrue  : String;
    ValueFalse : String;
    ValueNull  : String;
    FirstWord  : Boolean;
    ConstStr   : String;
    ArrControl : TArrWinControl;
    FGetHistory: TGetHistoryValue;
    constructor Create( w : TWinControl); overload;
    constructor Create( c : String); overload;
    destructor Destroy; override;
  end;


  TTypeEnabledSystem = ( tesFull, tesViewOnly, tesNone );

  TID=record
    Lic : Integer;
    Men : Integer;
    Adres : Integer;
    Obj : Integer;
    TypeDok:Integer;
  end;

  TTypeProg = record
    Name : String;
    Kod  : String;
    ID   : Integer;
    Full : Boolean;
    View : Boolean;
  end;

  TSystemProg = class(TObject)
  private
//    FListSystem : array of TTypeProg;
    FrecID:TID;
    FCurTypeObj:Integer;

    FCurProcedure:Variant;
    FCurTypeProcedure:Integer;
    FSoob:String;
  public
//    function Count : Integer;
//    function GetProgByNomer(iNomer : Integer) : TTypeProg;
//    function GetProgByKod(sKod: String): TTypeProg;
//    function EnableFull(ProgSystem : String) : Boolean;
//    function EnableView(ProgSystem : String) : Boolean;
//    function EnableOchered : Boolean;
//    function EnableVUS : Boolean;
    procedure SetRunMenReport(recID:TID; vKod:Variant);
    procedure SetCurObj(nTypeObj:Integer; recID:TID);
    procedure SetRunProcedure(nTypeProc:Integer; vKod:Variant; strSoob:String='');
    function CheckRunProcedure : Boolean;

    procedure EventExcel(Sender: TObject);
    {$IFDEF ZAGS}
    function CheckKodZAGS_to_GISRN(var sID:String):Boolean;
    function CheckKodGISRN_to_ZAGS(var sGISRN:String):Boolean;
    {$ENDIF}
    function MessageSourceGISUN(meta:TMetaTask) : String;

    constructor Create;
    destructor Destroy; override;
  end;

  // есть такое же определение в ifp_SelSovet.pas
  TReshOchMen=class(TObject)
  public
    FIDMen:Integer;
    FAutoID:Integer;
    FOchered_ID:Integer;
    FOtkaz:Boolean;
    FTip:Integer;
    FDateR:TDateTime;
    FDateSila:TDateTime;
    FNomer:String;
    FOsnov:Integer;
    FOsnovText:String;
    FOsnov2:Integer;
    FOsnovText2:String;
    FID1:Integer;
    FID2:Integer;
    FTextResh:String;
    FTextVipis:String;
    FAddInfo:String;
    FProv:Boolean;
    FBookmark:String;
    FRazdel:Boolean;
    FPlan:Boolean;

    function MenID:Integer;
    function AutoID:Integer;
    function Ochered_ID:Integer;
    function Otkaz:Boolean;
    function Tip:Integer;
    function DateR:TDateTime;
    procedure SetDateR(d:TDateTime);
    procedure SetDateSila(d:TDateTime);
    procedure SetNomer(s:String);
    function DateSila:TDateTime;
    function DateSilaResh:TDateTime;
    function Nomer:String;
    function Osnov:Integer;
    function OsnovText:String;
    function Osnov2:Integer;
    function OsnovText2:String;
    function GetTextOsnov(nTypeResult:Integer; lAddInfo:Boolean):String;
    function ID1:Integer;
    function ID2:Integer;
    function CheckFieldsInText(sText:String;nTypeDatePropis:Integer):String;
    function TextResh:String;
    function TextVipis:String;
    function Text(lVipis:Boolean):String;
    function AddInfo:String;
    function NameList(nType:Integer; sPadeg:String):String;
    function NameOch(nType:Integer; sPadeg:String):String;
    function Prov:Boolean;
    function Plan:Boolean;
    function Razdel:Boolean;
    function Clear:Boolean;
    constructor Create;
  end;

  //---- ATE ------------------------------------------------
  function IsEmptySoato(sSOATO:String):Boolean;
  function QuerySoato(lQuery:Boolean):Boolean;
  function GetATESS(nIdSS:Integer):Integer;
  function SeekATEFromSoato(sSOATO:String):Integer;
  function SeekATE(Value:Integer):TDataSet;
  function Category2TypePunkt(sTypeRN:String):Integer;
  function CategoryType(nType:Integer):Integer;
  function FullNameFromATE(var ate:TATE; nType:Integer; sRazd:String):String;
  function FullNameATE(ateID:Integer; nType:Integer; sRazd:String):String;
  function FullNameSOATO(sSoato:String; nType:Integer; sRazd:String):String;
  //---------------------------------------------------------

  function ZH_GetNamePunkt(sDS:String; sPar:String; nType:Integer):String;  // название насел. пункта места захоронения в зависимости от парамерта sPar
  function getDataSetFromStr(strDataSet:String):TDataSet;    // TDataSet из строки '','CurDok','fmZapisBrak.Dokument','Query' и т.п.

  function ReceiveMailTest2:Boolean;

  procedure SetHunSpell(ed:TComponent);
  function CreateHunSpell:Boolean;
  procedure DestroyHunSpell;

  function GetNomerUpdateProg:Integer;

  function AktToOtm(sNomer:String; dDate:TDateTime):String;
  function DateToSQL(dDate:TDateTime):String;

  function NameFormFromTypeObj(nTypeObj:Integer):String;

  function fnCheckParamsSQL(strSQL: String) : String;
  procedure AddString(var S: string; AddS, AddS2, Delimeter: string);

  function _GetNameUser:String;
  function _GetNameComp:String;

  function GetNameReportVid(getVid:String): String;
  function GetVidFromTypeObj(nTypeObj:Integer): String;
  function GetMestoZAH(ds:TDataSet; sFields:String; nType:Integer):String;

  function IsMID(meta:TMetaTask=nil) : Boolean;

  function MaxCountIN:Integer;

  procedure SetGlobalFilterPunkt(sValue:String);
  function GetGlobalFilterPunkt:String;

  function GetIcomFromExtFile(AExt: string; lSmall:Boolean): HICON;

  procedure GetATECheck;
  function CheckIsClearATE(nType:Integer; sGorod:String; nTypeGorod:Integer; sName:String):Boolean;

  function GetSP_J(strSP:String; dateSP:TDateTime):String;

  procedure CreateKeyYearsTemp(sYears:String);

  function SprChName_EmptyIzm: String;
  function SprRogd_EmptyIzm: String;
  function SprBrak_EmptyIzm: String;
  function SprSmert_EmptyIzm: String;
  function SprRast_EmptyIzm: String;

  function DeleteAllSpace(s:String):String;

  function GetPadegWord( strWord : String; Padeg : String) : String;
  function GetPadegWords( strWords : String; Padeg : String) : String;
  function EnabledRnGorod : Boolean;

  function CheckEE(sNew:String;sCur:String):String;

  //выполнить Template
  function RunTemplate( strName : String ) : Boolean;
  function RunTemplate2(strName:String; strPath:String; lShow:Boolean) : Boolean;

  function IOFamilia(sFamilia,sName,sOtch:String):String;
  function FIOForAdresat(sFamilia,sName,sOtch:String):String;

  // вернуть движение человека в строку lTmp=true включая по месту пребывания
  function DvigMen( dPropis:TDateTime; tbMigr:TDataSet; strRazd:String ): String;
  function VibitMen( tbMigr:TDataSet; strType:String; strRazd:String): String;
  function CreateTmpPath(nType:Integer=0):String;

  function NameFile_Partitions:String;
  function NameFile_Propertys:String;

  procedure CheckToolBar(tb : TTBToolBar; lEnableWrite:Boolean);
  function EnableNameHouse : Boolean;         // доступность ввода наименования строения при вводе адреса
  function EnableNotDom : Boolean;            // доступность ввода без номера дома при вводе адреса
  function EnableLoadOch : Boolean;           // доступность загрузки очередников

  procedure DisableMainForm;
  procedure EnableMainForm;
  function GetVersionProgram(nType:Integer) : String;
  procedure EnabledAllForms( f : TForm; value : Boolean);
  procedure CheckRegistry( lMainComp : Boolean );

  procedure CheckErrorDate(val:Variant; nType:Integer; dVal1,dVal2:TDateTime);

  function GetNomerSvid(sNomer:String): Integer;  // преобразовать номер свид: 0001234 в число 1234

  function CheckChetNomer(strDom : String) : Integer;
  // разделить номер дома на две части
  procedure RazdNomerDom(strDom : String; var strDom1,strDom2 : String);

  function getLenSoato:Integer;   // размер поля СОАТО для расчета в актовых записях

  // последнее решение исполкома
  function GetLastReshIsp(var nResh: Integer; var dDate: TDateTime): Boolean;
  function InitListStr(strMemo :String) : Integer;
  function GetStr(nLine:Integer) : String;
  function GetAllStr(strType:String;strRazd:string) : String;
  procedure EmptyMemTable( tb : TkbmMemTable);
  function GetNameSharedFolder(var sPath : String) : String;
//  function FromListAsString( sl : TStringList; sPar : String; sDefault : String ) : String;

  procedure CheckDecl(var arr:TArrStrings; sDecl:String; sDok:String='');
  function ID2Str(nID:Integer; nSize:Integer; var s1,s2:String) : Boolean;
  function FloatToStrMy(Value : Extended) : String;
  function StrToFloatMy(sValue : String; cSep:Char='.') : Extended;

  function GetStr2Res:TStringList;
  function getResource(sKod:String; nType:Integer):String;
  function getHelp(sKod:String):String;
  procedure ShowHelp(sKod:String; slPar:TStringList; nWidth:Integer=800);

  function getPril_(nType:Integer; sKod:String; nNomer:Integer; nSup:Integer):String;
  function getPril(nType:Integer; sKod:String; nNomer:Integer):String;
  function getPril2(nType:Integer; sKod:String; nNomer:Integer; nSup:Integer):String;

  Function GetMRUList_NameM(lReload:Boolean):TStringList;
  Function GetMRUList_NameG(lReload:Boolean):TStringList;
  Function GetMRUList_OtchM(lReload:Boolean):TStringList;
  Function GetMRUList_OtchG(lReload:Boolean):TStringList;

  function LimitMRUList(nType:Integer):Integer;
  procedure SetReloadMRUName(nType:Integer;lBel:Boolean);
  procedure SetReloadAllMRUName;
  Function GetMRUName_Punkt(lBel:Boolean;lReload:Boolean):TStringList;
  Function GetMRUName(nType:Integer;lAll:Boolean;lReload:Boolean;lBel:Boolean=false):TStringList;

  function GetMRU_MKB10(lReload:Boolean):TStringList;

  procedure CreatefrxDbDataSet(Owner:TComponent; ds:TDataSet; sUserName,sDesc:String);

  function CheckRegisterAkt(nType:Integer):Boolean;

  function ColorMenContantUbil : TColor;
  function ColorMenCopy     : TColor;
  function ColorMenTempUbil : TColor;
  function ColorMenTempPrib : TColor;
  function ColorMenPribSrok : TColor;
  function DefaultFontColor : TColor;
  procedure SetColorRowGridMen(AFont: TFont; var Background: TColor; ds:TDataSet);

  function ChoiceFromLookupSpr2( strNameOpis : String; fld:TField; lString : Boolean):Variant;

//  function  RunFuncScript(strFuncName: String; ArrPar : array of Variant;
//                          var vResult : Variant; var lRun:Boolean): Boolean;

  function CheckRegisterText(nType:Integer; s:String; lApost:Boolean=true):String;

  function RukovZAGS_Dolg : String;
  function RukovZAGS_FIO : String;

  function DolgRukov : String;
  function FIORukov : String;
  function DolgSecretar : String;
  function FIOSecretar : String;
  function DolgGlBux : String;
  function FIOGlBux : String;
  function DolgSpec : String;
  function FIOSpec : String;

  function getDomKorpKv(adr:TAdres):String;
  function sokrDOM:String;
  function sokrKORP:String;
  function sokrKV:String;
  function sokrObl:String;
  function sokrObl_B:String;

  function sokrRn:String;
  function CreateNomerDKK(sType:String; ss:String):String;

  function EM_NomerSvid:String;                   // editmask для номера свидетельства
  function EM_NomerIdentif(lPB:Boolean):String;   // editmask для номера идентификации

  function GetControlColor:TColor;      // цвет по умолчанию
  function GetNotActualColor:TColor;
  function GetDisableColorGIS:TColor;   // цвет данных полученных из регистра
  function GetDisableColor:TColor;      // цвет недоступного элемента
  function GetNoTransferColor:TColor;   // цвет поля значение которого не передавалось в регистр
  function GetColorProp(Sender:TObject):TColor;
  procedure SetColorControls(arrControls: array of TVarRec; c : TColor);

  function IsAccountRnGor:Boolean;   // ведеетя учет по районам города

  function GetLocalIP: String;
  function GetDocArxivFolder(var strErr:String; nType:Integer=0): String;
  function PathInBase(sPath:String):Boolean;

  function GetVoenkomMen(strID:String;nTypeDate:Integer;sDelim:String):String;
  function getGrag(sGrag:String; IsEmptyToDef:Boolean; lObozn:Boolean): String;

  function dbCreateListOwners : TDataSet;
  function dbCreateListDeti : TDataSet;

  function ReadDeti(strID:String; strPol:String; Vozr1,Vozr2:Integer; lOnlyLic:Boolean; lNotPasport:Boolean):TDataSet;
  function ReadDetiLic(strID:String;Vozr1,Vozr2:Integer;lNotPasport:Boolean):TDataSet;

  function GetOtnoshID(nIDKomu:Integer; sOtnoshKomu:String; nIDCur:Integer; sOtnosh:String; sPol:String):String;
  function GetOtnosh(nIDKomu:Integer; sOtnoshKomu:String; nIDCur:Integer; sOtnosh:String; sPol:String):String;
  function GetOtnoshForChild(sPOL:String; sOtnosh:String):Integer;

  function BuildExcelMenu(Menu:TTBSubmenuItem; strKod:String; lClear:Boolean):Boolean;
  function GetFileExcel(sName:String):String;
  function GetFileExcelReport(sName:String):string;
  procedure CheckPersonalPath;
  {$IFDEF ZAGS}
  procedure LoadRnMyGor(strOpis:String; sSOATO:String; strFilter:String);
  {$ENDIF}
  procedure LoadComboboxFromOpis( ed : TDbComboboxEh; strOpis:String );
  procedure LoadOpisFromSOATO(strOpis:String; sSOATO:String; strFilter:String; nPos:Integer=5; nCount:Integer=3);
  procedure LoadOpisControlHouse;        // загрузить описание KEY_CONTROL_HOUSE  из справочника организаций + два постоянных значения
  procedure ClearOpis(strOpis:String);
 procedure LoadOpis(strOpis:String; slItems:TStringList; slKeyItems:TStringList);

  function readSprDolg(sl1,sl2:TStringList; lAll:Boolean):Boolean;
  function getDolgAndFIOFromSpr(sID:String; var sDolg:String; var sFIO:String):Boolean;

  function ExecOneReport(vKod:Variant; lAll:Boolean; IDMen:String; f:TForm):Boolean;
  function Podpis_Init(vKod:Variant):Integer;
  function Podpis_Dolg(n:Integer):String;
  function Podpis_FIO(n:Integer):String;
  function Podpis_Perenos:Boolean;
  function Podpis_Shtamp:Integer;

  function PolFromName(strName:String):String;
  function PolFrom(strName,strOtch:String):String;
  procedure SetOptionsGrid(g:TDbGridEh; f:TForm; lGurnal:Boolean);

  function GetWordRAION(strName:String; strLang:String):String;
  function LastSimIsLower(strName:String; lFirstWord:Boolean=true):Boolean;
  procedure ShowXMLError(strFile:String);

  function ReshIsPostanovka(nTip:Integer):Boolean;

  procedure RefreshGurnal(strName:String);
  procedure RefreshGurnalSMDO;
  procedure RefreshGurnalAktZ;

//--------------------------------------------------------------------------------------
  function CheckParam(strCheck:String; var strParam: String):Boolean;
  function CheckLangParam(var strParam: String):String;
  function CheckUpperParam(var strParam: String):Boolean;
  function CheckPadegParam(var strParam: String):String;
  function CheckKratParam(var strParam: String):Boolean;
//--------------------------------------------------------------------------------------

  procedure SetFlatEhComp(Form:TForm; lFlat : Boolean; nCharCase:Integer=-1; lCheckSVID:Boolean=false);
  function AddFilter_FAMILIA_NAME(strFilter,strFamilia:String):String;
  function GetEditMaskIN(lPB:Boolean):String;
  function IsRequireIN(n:Integer):Boolean;
  function IsLichNomer(sTypeDok:String; sGrag:String):Boolean;
  function Grag_Dok(sGrag:String; sTypeDok:String; var sErr:String):Boolean;
  function SetGragFromTypeDok(sGrag:String; sTypeDok:String; var sNewGrag:String):Boolean;

  function ChoiceSpecID(cont:TWinControl):Integer;
  function ChoiceSpec(var sDolg,sFIO,sFIO_B:String; cont:TWinControl):Boolean;  // выбрать специалиста
  function ChoiceSpec2(var sDolg,sDolg_B,sFIO,sFIO_B:String; cont:TWinControl; lBel:Boolean):Boolean;
  function ChoiceSpec3(var sFIO,sDolg,sTel,sTelM:String; cont:TWinControl):Boolean;
  function ChoiceSpec4(var sDolg,sDolg_B,sFIO,sFIO_B:String; x,y:Integer; lBel:Boolean):Boolean;

  function LoadDokumentFromFile(arrDS:array of TDataSet; sFile:String; var strErr:String; LoadFormat: TkbmCSVStreamFormat): Boolean;

  function GetBookmarkMen:String;
  function GetBookmarkMen2(sDelim:String):String;
  function GetBookmarkMen_(sDelim:String):String;

  function RegSvidFIO(v:Variant;nTypeObj:Integer):Variant;
  function TypeRegSvidFIO(nTypeObj:Integer):Integer;

  function RegSvid(v:Variant;nTypeObj:Integer):Variant;
  function TypeRegSvid(nTypeObj:Integer):Integer;
  function SvidInPadeg(nTypeObj:Integer):Boolean;  // свидетельство в падеже

  procedure SetWorkDataSet(ds:TDataSet; sName:String);
  function GetWorkDataSet(sName:String):TDataSet;

  function MyID:Integer;
  function SoatoFromID(nID:Integer):String;
  function MyNAME:String;
  function MyKNAME:String;
  function IsMyID(nMyID,nCurID:Integer):Boolean;

  function CheckBelI(s:String):String;
  function CheckEngI(s:String):String;

  function DSiShareFolderMy(const folder, shareName, comment: string; type_access:DWORD): boolean;

  function GetWherePunktUlDom(nUch : Integer; strValues,strFieldName,strValues2,strFieldName2: String; ds : TDataSet; lCheckKorp:Boolean) : String;

  function CreateWorkShtamp(nType:Integer):Boolean;

  function GetNameKodAndText(sKod,sText:String; tbSpr : TDataSet):String;
  function GetNameOsnOch(sKod,sText:String; nType:Integer; nTypeResult:Integer):String;
  function SeekOsnOch(nKod:Integer):TDataSet;
  function GetDataSetSprOsnOch(nType:Integer):TDataSet;

//  function GetPropertyFTP(nTypeServerFTP:Integer; strTypeFile:String):TPropFTP;
  function SetPropertyFPT(IdFTP:TIdFTP;nTypeServerFTP:Integer; strTypeFile:String):Boolean;
  function GetFileFTP(IdFTP:TIdFTP; lShow:Boolean; lCheck:Boolean; strFileName:String; strOutputDir:String; lDeleteFile:Boolean):Boolean;
  procedure CheckMessagesProg(sMessages:String);

  procedure CheckSystemAdmin;

  {$IFDEF GKH}
    //
  {$ELSE}
    function CheckUpdate(IdFTP:TIdFTP; lRun:Boolean; lShow:Boolean; nTypeServer:Integer; lCheck:Boolean; var strMessages:String; var lPath:Boolean):String;
  {$ENDIF}

  {$IFDEF UPDATE_SYNA}
    function CheckUpdateSyna(pn:TPanel):Boolean;
    procedure RunUpdateSyna(pn:TPanel);
    procedure RunUpdateEx(pn:TPanel; nAfter:Integer; slPar:TStringList);
    procedure RunLoadSysSpr(pn:TPanel);
    procedure RunLoadSetupProg(pn:TPanel);
    {$IFDEF SMDO}
    procedure RunLoadSprSMDO(pn:TPanel);
    {$ENDIF}
  {$ENDIF}


var
  MessagesProg:String;

  RunFTP:Boolean;
  LastErrorFTP:String;
  Global_TimeOut_BeforePost:Integer;

  CurRecDok:TCurrentRecord;

  {$IFDEF HUNSPELL}
    HunSpell:THunSpell;
    HunSpellDialog:THunSpellDialog;
  {$ENDIF}

  IDLastDok:Integer;
  FGlobalFilterPunkt:String;
  slWorkDataSet:TStringList;

  IsActiveGISUN:Boolean;
  IsActiveWorkATE:Boolean;
  IsActiveSubMenuGISUN:Boolean;


  CurGridMens : TDbGridEh;

  CurListOwners:TDataSet;
  CurListDeti:TDataSet;
  arrReloadMRUNameR : array[1..4] of Boolean;

  EnableReport : Boolean;
  SystemProg : TSystemProg;
  NameCurGurnal : String;

  strRes : TStringList;

  MRUList_NameM : TStringList;
  MRUList_OtchM : TStringList;
  MRUList_NameG : TStringList;
  MRUList_OtchG : TStringList;

  MRUName_Punkt : TStringList;
  MRUName_PunktB: TStringList;
  MRU_MKB10     : TStringList;

  MRUName_Obl : TStringList;
  MRUName_Rn  : TStringList;
  MRUName_NP  : TStringList;
  MRUName_RnGor: TStringList;

  MRUName_Obl_B : TStringList;
  MRUName_Rn_B  : TStringList;
  MRUName_NP_B  : TStringList;

//  IniExcel : TSasaIniFile;
//  IniUserExcel : TSasaIniFile;
  slExcelReport : TStringList;
  slCheckATEObl : TStringList;   // используется проверки заполнения области исходя из названия города
  slCheckATERn  : TStringList;   // используется проверки заполнения района исходя из названия города

const
  {$IFDEF DEBUG}
    NAME_UPDATE_PROG='zags';
    Tables_Fields='TablesFields';
  {$ELSE}
    {$IFDEF ZAGS}
      NAME_UPDATE_PROG='zags';
      Tables_Fields='TablesFields';
    {$ENDIF}
    {$IFDEF LAIS}
      NAME_UPDATE_PROG='lais';
      Tables_Fields='TablesFields';
    {$ENDIF}
    {$IFDEF GKH}
      NAME_UPDATE_PROG='gkh';
      Tables_Fields='TablesFields';
    {$ENDIF}
    {$IFDEF OCHERED}
      NAME_UPDATE_PROG='ochered';
      Tables_Fields='TablesFieldsOch';
    {$ENDIF}
    {$IFDEF ZAH}
      NAME_UPDATE_PROG='zah';
      Tables_Fields='TablesFields';
    {$ENDIF}
    {$IFDEF OPEKA}
      NAME_UPDATE_PROG='opeka';
      Tables_Fields='TablesFields';
    {$ENDIF}
    {$IFDEF POST}
      NAME_UPDATE_PROG='post';
      Tables_Fields='TablesFields';
    {$ENDIF}

  {$ENDIF}

  GOROD_WITH_RN = '1401,2401,3401,4401,7401,7410,';
  EC_NORMAL = 0;
  EC_FIRST  = 1;
  EC_UPPER  = 2;

  BT_CREATE_OK='Создать';
  BT_CREATE_CANCEL='Отказ';
  BT_WRITE_OK='Сохранить';
  BT_WRITE_CANCEL='Отказ';

  CONTROL_STEP=26;

  COLOR_HIST = $00F9F7D0; //clYellow;
  COLOR_NORM = clWindow;
  COLOR_VOSSTAN = clBlue;

  colorError   = $009595FF;
  colorWarning = $00C5FFB0;

  //----- подсистемы ------------------------
  SS_HOZ_UCHET = 10; // похозяйственный учет
  SS_VUS       = 20; // ВУС
  SS_PASP      = 30; // паспортный стол
  SS_ZAGS      = 40; // ЗАГС
  SS_OBRACH    = 50; // Обращения граждан
  SS_OCHERED   = 60; // Очередь на жилье
  SS_ZAH       = 70; // Захоронения
  SS_SMDO      = 80; // СМДО
  SS_SMDO_RUN  = 82; // СМДО отправка и получение почты
  SS_OPEKA     = 90; // Опека и попечительство
  SS_SPR       =100; // Справочники
  SS_PAR       =110; // Параметры
  SS_LOCALPAR  =112; // Локальные параметры
  SS_OTCHET    =120; // Отчеты
  SS_ADMIN     =990; //
  SS_SYSDBA    =999; //

implementation

uses fMain, dBase, fGurnal, SelLibFr, fSimpleD, QStrings, WinSock, ace, fChoiceAdres, fChoiceAdresS, uSynapseObj, fEditMemoR, fEditMemo,
     {$IFDEF SMDO}
      uSMDO, fSmdoZagrSpr,
     {$ENDIF}
     fAddAdres,
     {$IFDEF ADD_MENS_PU} dMen, {$ENDIF}
     StrUtils;

var
  lRun:Boolean;
  v:Variant;


{
procedure LoadChangeATE(d:TDateTime);
var
  spr:TClassifInterface;
begin
   s:='KOD,Char,10;NAME,Char,80;NAME_B,Char,80;ATE_PARENTID,Integer,0;ATE_ID,Integer,0;ID,Integer,0;'+
       DATEIN,Date,0;DATEOUT,Date,0;CATEGORY,Integer,0;FNAMEC,Char,60;FNAMEC_B,Char,60;NAMEC,Char,10;NAMEC_B,Char,10;FRONT,Integer,0';
   ds:=dbCreateMemTable(s,'');
   Screen.Cursor:=crHourGlass;
   Application.ProcessMessages;

   spr:=TClassifInterface.Create(nil); //(HTTPRIO);
   spr.Url:=Trim(edUrl.text); //'http://todes.by:8084/gisun/class/ws';
   spr.Proxy:=Trim(edProxy.text); // '';
   spr.MessageSource:=edOrgan.text; //'19194';

   try
     spr.RequestChangeATE(d,ds);
   finally
//     lbLoad.Caption:='Загружено записей: '+intToStr(ds.RecordCount);
//     Animate1.Active:=false;
//     pnLoad.Visible:=false;
     Screen.Cursor:=crDefault;
   end;
end;
}

{ TAddControl }

constructor TAddControl.Create( w : TWinControl);
begin
  SetLength(ArrControl,0);
  EControl  := w;
  ValueTrue := 'область';
  ValueFalse:= 'край';
  ValueNull := '';
  FirstWord := false;
  ConstStr  := '';
  FGetHistory:=nil;
end;

constructor TAddControl.Create(c: String);
begin
  SetLength(ArrControl,0);
  EControl  := nil;
  ValueTrue := '';
  ValueFalse:= '';
  ValueNull := '';
  FirstWord := false;
  ConstStr  := c;
  FGetHistory:=nil;
end;

destructor TAddControl.Destroy;
begin
  SetLength(ArrControl,0);
  inherited;
end;

//--------------------------------------
function TReshOchMen.Otkaz:Boolean;
begin
  Result:=FOtkaz;
end;
//--------------------------------------
function TReshOchMen.Ochered_ID:Integer;
begin
  Result:=FOchered_ID;
end;
function TReshOchMen.AutoID:Integer;
begin
  Result:=FAutoID;
end;
function TReshOchMen.MenID:Integer;
begin
  Result:=FIDMen;
end;
//--------------------------------------
function TReshOchMen.Tip:Integer;
begin
  Result:=FTip;
end;
//--------------------------------------
function TReshOchMen.DateR:TDateTime;
begin
  Result:=FDateR;
end;
//--------------------------------------
function TReshOchMen.DateSila:TDateTime;
begin
  Result:=FDateSila;
end;
//--------------------------------------
function TReshOchMen.DateSilaResh:TDateTime;
begin                 
  Result:=0;
  if FDateR>0 then begin
    if FDateSila>0
      then Result:=FDateSila
      else Result:=FDateR;
  end;
end;
//--------------------------------------
function TReshOchMen.Nomer:String;
begin
  Result:=FNomer;
end;
//--------------------------------------
function TReshOchMen.Osnov:Integer;
begin
  Result:=FOsnov;
end;
//--------------------------------------
function TReshOchMen.OsnovText:String;
begin
  Result:=FOsnovText;
end;
//--------------------------------------
function TReshOchMen.Osnov2:Integer;
begin
  Result:=FOsnov2;
end;
//--------------------------------------
function TReshOchMen.OsnovText2:String;
begin
  Result:=FOsnovText2;
end;
//--------------------------------------
function TReshOchMen.ID1:Integer;
begin
  Result:=FID1;
end;
//--------------------------------------
function TReshOchMen.ID2:Integer;
begin
  Result:=FID2;
end;
//--------------------------------------
function TReshOchMen.CheckFieldsInText(sText:String;nTypeDatePropis:Integer):String;
var
  s:String;
begin
  if DateSilaResh=0
    then s:=' "___" _______________ '
    else s:=DatePropis(DateSilaResh,nTypeDatePropis);
  Result:=StringReplace(sText,'#DATEPOST&',s,[rfReplaceAll, rfIgnoreCase]);
  Result:=StringReplace(Result,'#A&',chr(13)+chr(10)+chr(9),[rfReplaceAll, rfIgnoreCase]);  // абзац
  if RightStr(Result,2)='..'
    then Result:=Copy(Result,1,Length(Result)-1);
end;
//--------------------------------------
function TReshOchMen.TextResh:String;
begin
  Result:=FTextResh;
  if Result='' then Result:=FTextVipis;
end;
//--------------------------------------
function TReshOchMen.TextVipis:String;
begin
  Result:=FTextVipis;
  if Result='' then Result:=FTextResh;
end;
//--------------------------------------
function TReshOchMen.Text(lVipis:Boolean):String;
begin
  if lVipis then begin
    if FTextVipis='' then Result:=FTextResh else Result:=FTextVipis;
  end else begin
    if FTextResh=''  then Result:=FTextVipis else Result:=FTextResh;
  end;
end;

//--------------------------------------
function TReshOchMen.GetTextOsnov(nTypeResult:Integer; lAddInfo:Boolean):String;
var
  s1,s2:String;
  nTypeSpr,n:Integer;
  lrun:Boolean;
  v:Variant;
begin
  Result:='';
  if TIP=OCH_RESH_SN then nTypeSpr:=2 else nTypeSpr:=1; // (Copy(sTypeSpr,1,1)='P') or (Copy(sTypeSpr,1,1)='П')  then nTypeSpr:=1 else nTypeSpr:=2;
  s1:='';    
  s2:='';
  n:=Osnov;
  if Osnov=0 then begin
    s1:=OsnovText;
  end else begin
    // см. load.pas скрипта
    v:=null;
    RunFuncScript('GetOsnovOchered_',[nTypeSpr,IntToStr(n),nTypeResult],v,lrun);
    if v<>null then s1:=VarToStr(v);
  end;
  n:=Osnov2;
  if n=0 then begin
    s2:=OsnovText2;
  end else begin
    // см. load.pas скрипта
    v:=null;
    RunFuncScript('GetOsnovOchered_',[nTypeSpr,IntToStr(Osnov2),nTypeResult],v,lrun);
    if v<>null then s2:=VarToStr(v);
  end;
  if s1<>''
    then Result:=s1;
  if (s2<>'') then begin
    if Result=''
     then Result:=s2
     else Result:=Result+', '+s2;
  end;
  if lAddInfo and (AddInfo<>'') then begin
    if Result=''
      then Result:=AddInfo
      else Result:=Result+', '+AddInfo
  end;
end;

//--------------------------------------
function TReshOchMen.AddInfo:String;
begin
  Result:=FAddInfo;
end;
//--------------------------------------
function TReshOchMen.NameList(nType:Integer; sPadeg:String):String;
begin
  if Ochered_ID=0 then begin
    result:='общий';
  end else begin
    result:='отдельный';
  end;
  if nType>0 then begin             
    result:=result+' список';
  end;
  if (sPadeg<>'') and (sPadeg<>'И')
    then Result:=GetPadegWords(Result,sPadeg);
  if (nType=2) and (Ochered_ID>0) then begin
    result:=result+' ('+NameOtdOch(Ochered_ID,false)+')';
  end;
end;
//--------------------------------------
function TReshOchMen.NameOch(nType:Integer; sPadeg:String):String;
begin
  if Ochered_ID=0 then begin
    result:='общая';
  end else begin
    result:='отдельная';
  end;
  if nType>0 then begin
    result:=result+' очередь';
  end;
  if (sPadeg<>'') and (sPadeg<>'И')
    then Result:=GetPadegWords(Result,sPadeg);
  if (nType=2) and (Ochered_ID>0) then begin
    result:=result+' ('+NameOtdOch(Ochered_ID,false)+')';
  end;
end;
//--------------------------------------
function TReshOchMen.Prov:Boolean;
begin
  Result:=FProv;
end;
//--------------------------------------
function TReshOchMen.Plan:Boolean;
begin
  Result:=FPlan;
end;
//--------------------------------------
function TReshOchMen.Razdel:Boolean;
begin
  Result:=FRazdel;
end;
//--------------------------------------
constructor TReshOchMen.Create;
begin
  inherited Create;
  FTip:=-1;
end;

//------------------------------------------------------------
function GetIcomFromExtFile(AExt: string; lSmall:Boolean): HICON;
var
   Info: SHFileInfo;
   uFlags:Cardinal;
begin
   if lSmall
     then uFlags:=SHGFI_ICON or SHGFI_SMALLICON or SHGFI_USEFILEATTRIBUTES
     else uFlags:=SHGFI_ICON or SHGFI_LARGEICON or SHGFI_USEFILEATTRIBUTES;
   SHGetFileInfo(PChar('*.'+AExt),
      FILE_ATTRIBUTE_NORMAL,
      Info,
      SizeOf(Info), uFlags);
   Result:=Info.hIcon;
end;

//------------------------------------------------------------
function AktToOtm(sNomer:String; dDate:TDateTime):String;
begin
  Result:='з/а №'+sNomer+' от '+DatePropis(dDate,3);
end;

//------------------------------------------------------------
function NameFormFromTypeObj(nTypeObj:Integer):String;
begin
  Result:='?';
  case nTypeObj of
    _TypeObj_ZBrak  : Result:='fmZapisBrak';
    _TypeObj_ZRast  : Result:='fmRastBrak';
    _TypeObj_ZRogd  : Result:='fmZapisRogd';
    _TypeObj_ZSmert : Result:='fmZapisSmert';
    _TypeObj_ZUstOtc: Result:='fmZapisUstOtc';
    _TypeObj_ZUstMat: Result:='fmZapisUstMat';
    _TypeObj_ZChName: Result:='fmZapisChName';
    _TypeObj_Opeka  : Result:='fmZapisOpeka';
    _TypeObj_AktZAH : Result:='fmAktZ';
    _TypeObj_SMDOPost: Result:='fmSMDOPost';
  end;
end;
//--------------------------------------------------------------------------------------
function fnCheckParamsSQL(strSQL: String) : String;
begin
  if Pos('&', strSQL)>0 then begin
    Result := StringReplace(strSQL, '&typeobj_lic&', intToStr(_TypeObj_Lich), [rfReplaceAll, rfIgnoreCase]);
    Result := StringReplace(Result, '&typeobj_nasel&', intToStr(_TypeObj_Nasel), [rfReplaceAll, rfIgnoreCase]);
    Result := StringReplace(Result, '&typeobj_adres&', intToStr(_TypeObj_Adres), [rfReplaceAll, rfIgnoreCase]);
  end else begin
    Result := strSQL;
  end;
end;
//--------------------------------------------------------------------------------------
procedure AddString(var S: string; AddS, AddS2, Delimeter: string);
begin
   if S='' then begin
      S:=AddS;
   end
   else if AddS<>'' then begin
      S:=S+Delimeter+Trim(AddS+' '+AddS2);
   end;
end;
//------------------------------------------------
function _GetNameUser:String;
begin
  Result:=DSiGetUserNameEx;
end;

//------------------------------------------------
function _GetNameComp:String;
begin
  Result:=DSiGetComputerName;
end;

//------------------------------------------------
function RukovZAGS_Dolg : String;
begin
  Result:=GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
end;

//------------------------------------------------
function RukovZAGS_FIO : String;
begin
  Result:=GlobalTask.ParamAsString('РУК_ЗАГС');
end;

//------------------------------------------------
function DolgRukov : String;
begin
  v:=''; lRun:=false;
  RunFuncScript('DolgRukov',[],v,lRun);
  if (v<>null) and not VarIsEmpty(v) and (VarToStr(v)<>'') then Result:=VarToStr(v);
end;

function FIORukov : String;
begin
  v:=''; lRun:=false;
  RunFuncScript('FIORukov',[],v,lRun);
  if (v<>null) and not VarIsEmpty(v) and (VarToStr(v)<>'') then Result:=VarToStr(v);
end;

function DolgSecretar : String;
begin
  v:=''; lRun:=false;
  RunFuncScript('DolgSecretar',[],v,lRun);
  if (v<>null) and not VarIsEmpty(v) and (VarToStr(v)<>'') then Result:=VarToStr(v);
end;
function FIOSecretar : String;
begin
  v:=''; lRun:=false;
  RunFuncScript('FIOSecretar',[],v,lRun);
  if (v<>null) and not VarIsEmpty(v) and (VarToStr(v)<>'') then Result:=VarToStr(v);
end;
function DolgGlBux : String;
begin
  v:=''; lRun:=false;
  RunFuncScript('DolgGlBux',[],v,lRun);
  if (v<>null) and not VarIsEmpty(v) and (VarToStr(v)<>'') then Result:=VarToStr(v);
end;
function FIOGlBux : String;
begin
  v:=''; lRun:=false;
  RunFuncScript('FIOGlBux',[],v,lRun);
  if (v<>null) and not VarIsEmpty(v) and (VarToStr(v)<>'') then Result:=VarToStr(v);
end;
function DolgSpec : String;
begin
  v:=''; lRun:=false;
  RunFuncScript('DolgSpec',[],v,lRun);
  if (v<>null) and not VarIsEmpty(v) and (VarToStr(v)<>'') then Result:=VarToStr(v);
end;
function FIOSpec : String;
begin
  v:=''; lRun:=false;
  RunFuncScript('FIOSpec',[],v,lRun);
  if (v<>null) and not VarIsEmpty(v) and (VarToStr(v)<>'') then Result:=VarToStr(v);
end;

//-------------------------------------------------------------
function NameFile_Partitions:String;
begin
  Result:='Partitions.mtb';
end;

//-------------------------------------------------------------
function CheckRegisterText(nType:Integer; s:String; lApost:Boolean):String;
var
  n:Integer;
  ss:String;
begin
  n:=Pos(',', s);
  if n>0 then begin
    ss:=Copy(s,n,Length(s));
    s:=Copy(s,1,n-1);
  end else begin
    ss:='';
  end;
  if nType=EC_NORMAL then begin //(ed.CharCase=ecNormal) then begin
    // ничего не трогаем
  end else if nType=EC_FIRST then begin //(ed.CharCase=ecNormal) then begin
    if lApost then begin  // контроль наличия апострофа
      if (Pos('`',s)=0) and (Pos('''',s)=0)
        then s:=FirstUpper(s);
    end else begin
      s:=FirstUpper(s);
    end;
//    if (Pos('-',s)=0) and (Pos(' ',s)=0) and (Pos(',',s)=0) then begin
//      s := ANSIUpperCase(Copy(s,1,1))+ANSILowerCase(Copy(s,2,Length(s)-1));
//    end;
  end else if nType=EC_UPPER then begin //(ed.CharCase=ecUpperCase) then begin
    s := ANSIUpperCase(s);
  end;
  Result:=s+ss;
end;

//-------------------------------------------------------------
function NameFile_Propertys:String;
begin
  {$IFDEF GKH}
    Result:='PropertysGKH.mtb';
  {$ELSE}
    Result:='Propertys.mtb';
  {$ENDIF}
end;

const
  REG_MG    = 1;    //  регистрация по месту жительства
  REG_MP    = 2;    //  регистрация по месту пребывания
  SN_REG    = 3;    //  снятие с регистрации
  SN_REG_WR = 4;    //  снятие с регистрации временно,  м.б. только после REG_MG, при обработке пропускаем

  SN_REG_MG = 5;    //  снятие с регистрации по месту жительства
  SN_REG_MP = 6;    //  снятие с регистрации по мемту пребывания


//-----------------------------------------------------------------------------
// замена английской i,I  на  белорусскую і,І
function CheckBelI(s:String):String;
begin
  Result:=StringReplace( StringReplace(s,'i','і',[rfReplaceAll]) , 'I', 'І', [rfReplaceAll]);
end;
//-----------------------------------------------------------------------------
// замена белорусской і,І  на  английскую i,I
function CheckEngI(s:String):String;
begin
  Result:=StringReplace( StringReplace(s,'і','i',[rfReplaceAll]), 'І' , 'I', [rfReplaceAll]);
end;
//-----------------------------------------------------------------------------
function IOFamilia(sFamilia,sName,sOtch:String):String;
begin
  Result:=Copy(sName,1,1)+'. '+Copy(sOtch,1,1)+'. '+sFamilia;
end;

function FIOForAdresat(sFamilia,sName,sOtch:String):String;
begin
  Result:=Trim(sFamilia)+' '+Trim(sName)+' '+Trim(sOtch);
end;

//-----------------------------------------------------------------------------
function DvigMen( dPropis:TDateTime; tbMigr:TDataSet; strRazd:String ): String;
var
  lDisable,lAdd,lOne : Boolean;
  sOkon,s,sPr,sSn,sWrPr,sWrSn,sF,sOne:String;
  d1,d2:TDateTime;
  nPred,nCur,m, nCount:Integer;

begin
//--------- завести параметры ---------------
  sPr:='зарег.';
  sSn:='снят с рег.';
  sWrPr:='зарег. по м/преб.';
  sWrSn:='снят с рег. по м/преб.';
//-------------------------------------------
  sF:='dd.mm.yyyy';
  lDisable := false;
  if not tbMigr.ControlsDisabled then begin
    tbMigr.DisableControls;
    lDisable := true;
  end;
//  old := tbMigr.IndexFieldNames;
//  tbMigr.IndexFieldNames:='ID_INTERNAL;DATE';
//  tbMigr.SetRange([strID],[strID]);
  Result:='';
  sOkon:='';
  tbMigr.First;
  nPred:=0;
  nCount:=0;
  lOne:=true;
  sOne:='';
  if tbMigr.Eof then begin
    if dPropis>0 then
      Result:=FormatDateTime(sF,dPropis);
  end else begin
    if (dPropis>0) then begin
      tbMigr.Last;
      d2:=tbMigr.FieldByName('DATE').AsDateTime;
      tbMigr.First;
      d1:=tbMigr.FieldByName('DATE').AsDateTime;
      if (dPropis>=d1) and (dPropis<=d2) then begin
//        dPropis:=0; // ничего не будем делать, все соберется при прохождении списка
      end else begin
        if dPropis<d1 then begin
          Result:=sPr+' '+FormatDateTime(sF,dPropis)+strRazd;
          nPred:=REG_MG;
          sOne:=FormatDateTime(sF,dPropis);
        end else begin
          sOkon:=sPr+' '+FormatDateTime(sF,dPropis);
        end;
        nCount:=nCount+1;
        sOne:=FormatDateTime(sF,dPropis);
      end;
    end;
    tbMigr.First;
    while not tbMigr.Eof do begin
      if not tbMigr.FieldByName('DATE').IsNull and not tbMigr.FieldByName('TIP').IsNull then begin
        lAdd:=false;
        //------ определим текущюю миграцию ----------------
        if tbMigr.FieldByName('TIP').AsString = MIGR_PRIB then begin
          if tbMigr.FieldByName('CONTANT').AsString='1'
            then nCur:=REG_MG
            else nCur:=REG_MP;
        end else begin
          if tbMigr.FieldByName('CONTANT').AsString='1'
            then nCur:=SN_REG
            else nCur:=SN_REG_WR;
        end;
        //---------------------------------------------------
        case nPred of
          0         : if (nCur=REG_MG) or (nCur=SN_REG) or (nCur=REG_MP) then  lAdd:=true;
          REG_MG    : if (nCur=SN_REG) then lAdd:=true;
          SN_REG    : if (nCur=REG_MG) or (nCur=REG_MP) then  lAdd:=true;
          REG_MP    : if (nCur=REG_MG) or (nCur=SN_REG) then  lAdd:=true;
          SN_REG_WR : lAdd:=false;   // временный отъезд пропускаем

        end;
        if lAdd then begin
          nCount:=nCount+1;
          if nCount>1 then begin
            lOne:=false;
            sOne:='';
          end;
          m:=nCur;
          if (nCur=SN_REG) then begin    // если текущее значение снятие с регистрации
            if nPred=REG_MP
              then m:=SN_REG_MP     // если бала регистр. по месту пребывания, то тогда закрытие временной регистрации
              else m:=SN_REG_MG     // иначе закрытие регистрации по месту жительства
          end;
          nPred:=nCur;  // если добавляем значение в список, то предыд. значению даём текущее
          s:=FormatDateTime(sF, tbMigr.FieldByName('DATE').AsDateTime);
          if lOne and (m=REG_MG) then begin
            sOne:=s;
          end;
          case m of
            REG_MG    : begin
                          if nCount=1
                            then Result := Result + s
                            else Result := Result + sPr+' '+s;
                        end;
            REG_MP    : Result := Result + sWrPr+' '+s;
            SN_REG_MG : Result := Result + sSn+' '+s;
            SN_REG_MP : Result := Result + sWrSn+' '+s;
          end;
        end;
      end;
      tbMigr.Next;
      if (Result<>'') and not tbMigr.Eof
        then Result:=Result+strRazd;
    end;
    if (nCount=1) and (sOne<>'') then begin
      Result:=sOne;
    end;
  end;
  tbMigr.First;
  Result:=trim(Result+' '+sOkon);
//  tbMigr.IndexFieldNames:=old;
//  tbMigr.CancelRange;
  if lDisable then begin
    tbMigr.EnableControls;
  end;
end;

//-----------------------------------------------------------------------------
// выбытие человека
// stype=111   дата+куда+срок
// stype=010   куда
// stype=100   дата
// stype=001   срок
function VibitMen( tbMigr:TDataSet; strType:String; strRazd:String): String;
var
  lDisable,lDate,lKuda,lSrok : Boolean;
  nCur : Integer;
  sF,s:String;
begin
  sF:='dd.mm.yyyy';
  if strType='' then strType:='110';
  strType:=PadRStr(strType,3,'0');
  if Copy(strType,1,1)='1' then lDate:=true else lDate:=false;
  if Copy(strType,2,1)='1' then lKuda:=true else lKuda:=false;
  if Copy(strType,3,1)='1' then lSrok:=true else lSrok:=false;
  lDisable := false;
  if not tbMigr.ControlsDisabled then begin
    tbMigr.DisableControls;
    lDisable := true;
  end;
  Result:='';
  tbMigr.Last;
  if tbMigr.RecordCount>0 then begin
    if not tbMigr.FieldByName('DATE').IsNull and not tbMigr.FieldByName('TIP').IsNull then begin
      //------ определим текущюю миграцию ----------------
      if tbMigr.FieldByName('TIP').AsString = MIGR_PRIB then begin
        if tbMigr.FieldByName('CONTANT').AsString='1'
          then nCur:=REG_MG
          else nCur:=REG_MP;
      end else begin
        if tbMigr.FieldByName('CONTANT').AsString='1'
          then nCur:=SN_REG
          else nCur:=SN_REG_WR;
      end;
      if (nCur=SN_REG) or (nCur=SN_REG_WR) then begin
        if lDate
          then Result:=Result+FormatDateTime(sF, tbMigr.FieldByName('DATE').AsDateTime);
        if Result='' then s:='' else s:=strRazd;
        if lKuda
          then Result:=Result+s+dmBase.GetMestoMen(0,'',false,0, tbMigr);
        if lSrok and (nCur=SN_REG_WR) and not tbMigr.FieldByName('DATE_SROK').IsNull then begin
          if Result='' then s:='' else s:=strRazd+'до ';
          Result:=Result+s+FormatDateTime(sF, tbMigr.FieldByName('DATE_SROK').AsDateTime);
        end;
      end;
    end;
  end;
  tbMigr.First;
  if lDisable then begin
    tbMigr.EnableControls;
  end;
end;

//-------------------------------------------------------------
function GetSP_J(strSP:String; dateSP:TDateTime):String;
begin
  strSP:=Trim(strSP);
  if strSP=''  then begin
    Result:=DatePropis(dateSP,3);
  end else begin
    if Copy(strSP,1,3)='00.' then
       strSP:=Copy(strSP,4,100);
    if Copy(strSP,1,3)='00.' then
       strSP:=Copy(strSP,4,100);
    Result:=Trim(strSP);
  end;
end;

//-------------------------------------------------------------
function GetDocArxivFolder(var strErr:String; nType:Integer): String;
var
  s:String;
begin
  strErr:='';
  Result:='';
  if nType=1 then begin // вернуть относительно базы
    Result:='&BASE&\DocArxiv\';
  end else begin
    if dmBase.IsMainComputer then begin
      Result := ExtractFilePath(Application.ExeName)+'DocArxiv';
      if not ForceDirectories(Result) then begin
        strErr:='Ошибка создания папки: "'+Result+'"';
        Result:='';
      end else begin
        Result := Result+'\';
      end;
    end else begin
      s := dmBase.AdsConnection.ConnectPath;
      if Pos(UpperCase('Data\'+NAME_DICT),ANSIUpperCase(s))>0 then begin
        s := Copy(s,1,Length(s)-Length('Data\'+NAME_DICT)-1);
      end;
      Result:=s+'\DocArxiv\';
    end;
  end;
end;
//-------------------------------------------------------------
function PathInBase(sPath:String):Boolean;
begin
  if Pos('&BASE&',sPath)>0
    then Result:=true
    else Result:=false;
end;
//-------------------------------------------------------------
function GetLocalIP: String;
const WSVer = $101;
var
  wsaData: TWSAData;
  P: PHostEnt;
  Buf: array [0..127] of Char;
begin
  Result := '';
  if WSAStartup(WSVer, wsaData) = 0 then begin
    if GetHostName(@Buf, 128) = 0 then begin
      P := GetHostByName(@Buf);
      if P <> nil then Result := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
    end;
    WSACleanup;
  end;
end;

//------------------------------------------------------------
procedure CreateKeyYearsTemp(sYears:String);
var
  Opis:TOpisEdit;
  i,n,nBegin,nCount:Integer;
  arr:TArrStrings;
begin
  Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_YEARS_TEMP');
  Opis.Items.Clear;
  Opis.KeyList.Clear;
  n:=Pos('#',sYears);
  if n=0 then begin
    StrToArr(sYears,arr,';',true);
    for i:=0 to Length(arr)-1 do begin
      Opis.Items.Add(Trim(arr[i]));
      Opis.KeyList.Add(Trim(arr[i]));
    end;
  end else begin
    nBegin:=YearOf(Now)+StrToInt(Copy(sYears,1,n-1));
    nCount:=StrToInt(Copy(sYears,n+1,10));
    for i:=0 to nCount-1 do begin
      Opis.Items.Add(IntToStr(nBegin+i));
      Opis.KeyList.Add(IntToStr(nBegin+i));
    end;
  end;
end;
//------------------------------------------------------------
function ChoiceFromLookupSpr2( strNameOpis : String; fld:TField; lString : Boolean):Variant;
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
begin
  SetLength(arrRec,1);
  Result:=null;
  v := null;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA(strNameOpis);
  if Opis <> nil then begin
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      if v <> null then begin
        if fld=nil then begin
          if lString
            then Result:=VarToStr(v)
            else Result:=v;
        end else begin
          if (fld.DataSet.State<>dsEdit) or (fld.DataSet.State<>dsInsert)
            then fld.DataSet.Edit;
          if lString
           then fld.AsString  := v
           else fld.AsInteger := v;
        end;
      end;
    end;
  end;
end;

//------------------------------------------------------
function ColorMenContantUbil : TColor;
begin Result:=clRed; end;
//------------------------------------------------------
function ColorMenCopy : TColor;
begin Result:=clFuchsia; end;

function ColorMenTempUbil : TColor;
begin Result:=clBlue; end;

function ColorMenTempPrib : TColor;
begin Result:=$00319D31; end;

function ColorMenPribSrok : TColor;
begin Result:=clMaroon; end;

function DefaultFontColor : TColor;
begin Result:=fmMain.TBToolbarMain.Font.Color; end;

//----------------------------------------------------------------------------------------
function GetNameKodAndText(sKod,sText:String; tbSpr : TDataSet):String;
begin
  if (sKod<>'') and (sKod<>'0') then begin
    if tbSpr.Locate('ID', sKod, []) then begin
      Result:=tbSpr.FieldByName('NAME').AsString;
    end else begin
      Result:='';
    end;
  end else begin
    Result:=sText;
  end;
end;

//------------------------------------------
//  OCH_OSN_FULL=1;   полное наименование
//  OCH_OSN_FULL2=6;  полное наименование + наименование указа
//  OCH_OSN_KRAT=2;   краткое + наименование указа
//  OCH_OSN_UKAZ=3;   пункт + наименование указа
//  OCH_OSN_POLOG=4;  пункт + положение
//  OCH_OSN_PUNKT=5;  только номер пункта

//----------------------------------------------------------------------------------------
function GetNameOsnOch(sKod,sText:String; nType:Integer; nTypeResult:Integer):String;
var
  nTypeSpr:Integer;
//  tbSpr:TDataSet;
begin
  Result:='';
  if (sKod<>'') and (sKod<>'0') then begin
    v:=null;
    if nType=OCH_RESH_SN then nTypeSpr:=2 else nTypeSpr:=1;
    RunFuncScript('GetOsnovOchered_',[nTypeSpr,sKod,nTypeResult],v,lrun);
    if v<>null
      then Result:=VarToStr(v);
  end else begin
    Result:=sText;
  end;
{
  if nType=OCH_RESH_SN
    then tbSpr:=dmBase.SprSnOch
    else tbSpr:=dmBase.SprPostOch;
  if (sKod<>'') and (sKod<>'0') then begin
    if tbSpr.Locate('ID', sKod, []) then begin
      Result:= tbSpr.FieldByName('NAME').AsString+' положения указа №'+tbSpr.FieldByName('UKAZ').AsString;
    end else begin
      Result:='';
    end;
  end else begin
    Result:=sText;
  end;
}  
end;

{$IFDEF ADD_OCH}
//----------------------------------------------------------------------------------------
function SeekOsnOch(nKod:Integer):TDataSet;
var
  tbSpr:TDataSet;
begin
  Result:=nil;
  if nKod>1000
    then tbSpr:=dmBase.SprSnOch
    else tbSpr:=dmBase.SprPostOch;
  if (nKod>0) then begin
    if tbSpr.Locate('ID', nKod, []) then begin
      Result:=tbSpr;
    end;
  end;
end;

//----------------------------------------------------------------------------------------
function GetDataSetSprOsnOch(nType:Integer):TDataSet;
begin
  if nType=OCH_RESH_SN
    then Result:=dmBase.SprSnOch
    else Result:=dmBase.SprPostOch;
end;
{$ELSE}
function SeekOsnOch(nKod:Integer):TDataSet;
begin Result:=nil; end;
function GetDataSetSprOsnOch(nType:Integer):TDataSet;
begin Result:=nil; end;
{$ENDIF}

//-----------------------------------------------------------------------------------------------------
procedure SetColorRowGridMen(AFont: TFont; var Background: TColor; ds:TDataSet);
var
  lPropis,lPresent:Boolean;
begin
  {$IFDEF OCHERED}
  if ds.Active then begin
    if (ds.FieldByName('ID_BASE').AsInteger=0) and (ds.FieldByName('ADRES_ID').AsInteger<=0)  then begin
      AFont.Color := ColorMenTempUbil; // Grid.Color2; ;
    end;
    if ds.FieldByName('NOMER_SEM').AsInteger>0 then begin
      AFont.Style := AFont.Style + [fsUnderline];
    end;
    if ds.FieldByName('ONLY').AsBoolean then begin
      Background:=clInfoBk;
    end;
    {
    if not ds.FieldByName('CANDELETE').IsNull and ds.FieldByName('CANDELETE').AsBoolean then begin
      AFont.Color := ColorMenContantUbil; //  clRed;
    end else begin
      if not ds.FieldByName('PROPIS').IsNull and (ds.FieldByName('PROPIS').AsBoolean=false) then begin
        AFont.Color := ColorMenTempPrib; //Grid.Color1; // clMaroon; //clGreen; //Grid.NewRowColor;
      end else if not ds.FieldByName('PRESENT').IsNull and (ds.FieldByName('PRESENT').AsBoolean=false) then begin
        AFont.Color := ColorMenTempUbil; // Grid.Color2; ;
      end;
    end;
    }
  end;
  {$ELSE}
  if ds.Active then begin
    if not ds.FieldByName('CANDELETE').IsNull and ds.FieldByName('CANDELETE').AsBoolean then begin
      if ds.FieldByName('NEW_ID').AsInteger>0
        then AFont.Color := ColorMenCopy
        else AFont.Color := ColorMenContantUbil; //  clRed;
    end else begin
      if ds.FieldByName('PROPIS').IsNull  then lPropis:=true
                                          else lPropis:=ds.FieldByName('PROPIS').AsBoolean;
      if ds.FieldByName('PRESENT').IsNull then lPresent:=true
                                             else lPresent:=ds.FieldByName('PRESENT').AsBoolean;
      if lPresent and lPropis then begin   // зарегистрирован и присутствует
        if not ds.FieldByName('DATE_SROK_DN').IsNull then begin
//          AFont.Color := ColorMenPribSrok;   // зарегистрировани по месту жительства по договору на срок
          AFont.Style := AFont.Style + [fsUnderline];
        end;
      end else if not lPresent and not lPropis then begin   // не зарегистрирован и отсутствует
//        AFont.Color:=ColorMenTempPrib; //$00319D31;
        Background:=clInfoBk;
      end else begin
        if not lPropis then begin                  // временно прибывший
          AFont.Color := ColorMenTempPrib; //$00319D31;
        end else begin
          if not lPresent then begin        // временно отсутствует (зарегистрирован)
            AFont.Color := ColorMenTempUbil; // Grid.Color2;
          end;
        end;
      end;
    end;
//    if not ds.FieldByName('FIRST').IsNull and ds.FieldByName('FIRST').AsBoolean then begin
//      AFont.Style := AFont.Style + [fsBold];
//    end;
    if not ds.FieldByName('SPEC_UCH').IsNull and ds.FieldByName('SPEC_UCH').AsBoolean then begin
      AFont.Style := AFont.Style + [fsBold];
    end;
  end;
  {$ENDIF}
end;

//------------------------------------------------------
procedure CreatefrxDbDataSet(Owner:TComponent; ds:TDataSet; sUserName,sDesc:String);
{$IFDEF USE_FR3}
var
  frx:TfrxDBDataSet;
  i:Integer;
  lSeek:Boolean;
{$ENDIF}
begin
{$IFDEF USE_FR3}
  lSeek:=false;
  for i:=0 to Owner.ComponentCount-1 do begin
    if Owner.Components[i] is TfrxDBDataset then begin
      if (TfrxDBDataset(Owner.Components[i]).DataSet.Name=ds.Name) then begin
        if (TfrxDBDataset(Owner.Components[i]).DataSet.Owner.Name=ds.Owner.Name)  then begin
          lSeek:=true;
          break;
        end;
      end;
    end;
  end;
  if not lSeek then begin
    frx:=TfrxDBDataset.Create(Owner);
    frx.Name:='frx_'+ds.Owner.Name+'_'+ds.Name;
    frx.DataSet:=ds;
    if sUserName<>'' then frx.UserName:=sUserName;
    if sDesc<>'' then frx.Description:=sDesc;
  end;
{$ENDIF}
end;

function FloatToStrMy(Value : Extended) : String;
var
  fs:TFormatSettings;
begin
  GetLocaleFormatSettings(1049,fs);
  fs.DecimalSeparator:='.';
//  fs.ThousandSeparator:='';
  Result:=FloatToStr(Value,fs);
  CharDel(Result,' ');
end;

//--------------------------------------------------------------
function StrToFloatMy(sValue : String; cSep:Char) : Extended;
var
  fs:TFormatSettings;
begin
  GetLocaleFormatSettings(1049,fs);
  fs.DecimalSeparator:=cSep;
//  fs.ThousandSeparator:='';
  Result:=StrToFloat(sValue,fs);
end;

//--------------------------------------------------------------
procedure CheckDecl(var arr:TArrStrings; sDecl:String; sDok:String);
var
  a:TArrStrings;
  i:Integer;
  lOk:Boolean;
  procedure SSSS;
  begin
    lOk:=true;
    arr[1]:=Trim(Copy(sDecl,1,i-1));
    arr[2]:=Trim(Copy(sDecl,i,Length(sDecl)));
  end;
begin
  SetLength(arr,3);
  if Pos(chr(13)+chr(10),sDecl)>0 then begin
    StrToArr(sDecl,a,chr(13)+chr(10),false);
    SetLength(a,3);
    arr[0]:=GetPadegFIO(a[0],'М','И');
    arr[1]:=a[1];
    arr[2]:=a[2];
  end else begin
    if sDok='' then begin
      i:=Pos(',',sDecl);
      if i>0 then begin
        arr[0]:=GetPadegFIO(Copy(sDecl,1,i-1),'М','И');
        sDecl:=Copy(sDecl,i+1,Length(sDecl));
        lOk:=false;
        i:=Pos('паспорт',sDecl);
        if i>0 then begin
          SSSS;
        end else begin
          i:=Pos('вид на ж',sDecl);
          if i>0 then begin
            SSSS;
          end else begin
            i:=Pos('удостоверение',sDecl);
            if i>0 then begin
              SSSS;
            end else begin
              i:=Pos('свидетельство',sDecl);
              if i>0 then begin
                SSSS;
              end;
            end;
          end;
        end;
        if lOk then begin
          if RightStr(arr[1],1)=','
            then arr[1]:=Copy(arr[1],1,Length(arr[1])-1);
        end else begin
          arr[1]:=sDecl;
          arr[2]:='';
        end;
      end else begin
        arr[0]:=sDecl;
        arr[1]:='';
        arr[2]:='';
      end;
    end else begin         // если передан документ удост. личность
      i:=Pos(',',sDecl);
      if i>0 then begin
        arr[0]:=GetPadegFIO(Copy(sDecl,1,i-1),'М','И');
        arr[1]:=Copy(sDecl,i+1,Length(sDecl));
      end else begin
        arr[0]:=sDecl;
        arr[1]:='';
      end;
      arr[2]:=sDok;
    end;
  end;
end;

//--------------------------------------------------------------
function ID2Str(nID:Integer; nSize:Integer; var s1,s2:String) : Boolean;
var
  s : String;
begin
  s:=IntToStr(nID);
  s:=PadLStr(s,2*nSize,'0');
  s1:=Copy(s,1,nSIZE);
  s2:=Copy(s,nSIZE+1,nSIZE);
  Result:=true;
end;

//-----------------------------------------------------------------
// отключим недоступный Item в Toolbar
procedure CheckToolBar(tb : TTBToolBar; lEnableWrite:Boolean);
var
  i : Integer;
begin
  //-- для администраторов доступно все --
  if (Role.Status=rsAdmin) or Role.SystemAdmin
    then exit;
//  HelpContext=1  !!!
  for i:=0 to tb.Items.Count-1 do begin
    if (tb.Items[i].HelpContext=1) and not lEnableWrite then begin
      tb.Items[i].Visible:=false;
      tb.Items[i].Enabled:=false;
    end;
  end;
end;

function ChoiceAdresEx(nType:Integer; nCurID:Integer; var nLicID:Integer):Integer;
var
  adr : TAdres;
  strErr,sAdr : String;
  n : Integer;
  lChoiceLic:Boolean;
begin
  if nLicID>=0
    then lChoiceLic:=true
    else lChoiceLic:=false;
  nLicID:=0;
  Result:=0;
  if nType=-1 then
    nType:=GlobalTask.ParamAsInteger('SIMPLE_ADRES');
  if nType=0 then begin
    if fmChoiceAdres= nil then fmChoiceAdres := TfmChoiceAdres.Create(nil);
    fmChoiceAdres.DateFiks := dmBase.GetDateCurrentSost;
    fmChoiceAdres.ChoiceLich := lChoiceLic;
    if fmChoiceAdres.ShowModal = mrOk then begin
      Result:=fmChoiceAdres.IDAdres;
      if lChoiceLic
        then nLicID:=fmChoiceAdres.IDLich;
    end;
  end else if nType=1 then begin
    if fmChoiceAdresS= nil then fmChoiceAdresS:=TfmChoiceAdresS.Create(nil);
    fmChoiceAdresS.DateFiks := dmBase.GetDateCurrentSost;
    if fmChoiceAdresS.EditAdres then begin
      Result:=fmChoiceAdresS.IDAdres;
      if lChoiceLic
        then nLicID:=fmChoiceAdresS.IDLich;
    end;
  end else begin
    sAdr:=IntToStr(nCurID);
    adr:=dmBase.AdresAsRecord(dmBase.GetDateCurrentSost, sAdr, false, true);
    adr.NotDom:=false;
    adr.NameHouse:='';
    n:=AddNewAdres2(dmBase.GetDateCurrentSost,adr,strErr,false,'Адрес;Выбрать');
    if (n=0) or (n=1) then begin
      Result:=adr.AdresID;
    end;
  end;
end;

//--------------------------------------------------------------
function EnableNotDom : Boolean;
begin
  Result:=GlobalTask.ParamAsBoolean('NOT_DOM');
end;
//--------------------------------------------------------------
function EnableLoadOch : Boolean;
begin
  {$IFDEF OCHERED}
    Result:=GlobalTask.ParamAsBoolean('EN_LOAD_OCH')
  {$ELSE}
    Result:=false;
  {$ENDIF}
end;
//--------------------------------------------------------------
function EnableNameHouse : Boolean;
begin
  Result:=GlobalTask.ParamAsBoolean('ENABLE_HOUSE');
end;

//-----------------------------------------------------------------------
function GetNameSharedFolder(var sPath : String) : String;
var
  i:Integer;
begin
  sPath:=ExtractFilePath(Application.ExeName);
  sPath:=Copy(sPath,1,Length(sPath)-1);
  i:=LastPos('\',sPath);
  try
    Result:=Copy(sPath,i+1,Length(sPath));
  except
    Result:='СельскийСовет';
  end;
end;

//-----------------------------------------------------------------------
function GetLastReshIsp(var nResh: Integer; var dDate: TDateTime): Boolean;
begin
  if GlobalTask.GetLastValueAsString('LAST_RESH_ISP')<>'' then begin
    nResh:=GlobalTask.GetLastValueAsInteger('LAST_RESH_ISP_NOMER');
    dDate:=GlobalTask.GetLastValueAsDate('LAST_RESH_ISP_DATE');
    Result:=true;
  end else begin
    nResh:=-1;
    dDate:=0;
    Result:=false;
  end;
end;
//-----------------------------------------------------------------
function GetNomerSvid(sNomer:String): Integer;
var
  s : String;
begin
  Result:=0;
  try
    s := Trim(sNomer);
    if s='' then begin
      Result:=0;
    end else begin
      while Copy(s,1,1)='0' do s:=Copy(s,2,SVID_LEN);
      Result := StrToInt(s);
    end;
  except
  end;
end;

// четный(2) или нет(1) номер дома или ошибка определения (0)
function CheckChetNomer(strDom : String) : Integer;
var
  s : String;
  n,i : Integer;
begin
  Result:=0;
  s:=Trim(strDom);
  try
    // первая позиция цифры
    i:=Q_StrCSpn(s, '1234567890', 1);
    if i > 0 then begin
      if i>1 then s:=copy(s,i,Length(s));  // уберем первые не цыфры
      i := Q_StrSpn(s,'1234567890',1);     // i - номер позиции не цифры
      if (i=0) or (i=1) then begin         // если все цифры
        n := StrToInt(s);
      end else begin
        s := copy(s,1,i-1);
        n := StrToInt(s);
      end;
    end else begin
      n:=0;       // в номере отсутствуют цифры
    end;
  except
    n:=0;     // ошибка преобразования функции StrToInt
  end;
  if n>0 then begin
    try
      if Odd(n) then Result:=1 else Result:=2;
    except
      Result:=0;
    end;
  end;
end;

procedure EmptyMemTable( tb : TkbmMemTable);
begin
  tb.EmptyTable;
  if (tb.State=dsEdit) or (tb.State=dsInsert)
    then tb.Cancel;
end;

// разбить номер дома на две части
procedure RazdNomerDom(strDom : String; var strDom1,strDom2 : String);
var
  s,ss : String;
  i : Integer;
begin
  s:=Trim(strDom);
  // первая позиция цифры
  i:=Q_StrCSpn(s, '1234567890', 1);
  if i > 0 then begin
    ss:='';
    if i>1 then begin
      ss:=copy(s,1,i-1);  // соберем первые не цифры
      s:=copy(s,i,Length(s));
    end;
    i := Q_StrSpn(s,'1234567890',1);     // i - номер позиции не цифры
    if (i=0) then begin         // если все цифры
      strDom1:=Trim(strDom);
      strDom2:='';
    end else begin
      strDom1 := ss + Copy(s,1,i-1);
      strDom2 := copy(s,i,Length(s));
    end;
  end else begin       
    strDom1:=''; //strDom;   // в номере отсутствуют цифры
    strDom2:=Trim(strDom);
  end;
  if (strDom1<>'') and (Q_StrSpn(strDom1,'1234567890',1)>0) then begin   // если не цифры
    strDom1:='';
  end;
          
end;                

procedure CheckRegistry(lMainComp : Boolean );
var
  Reg    : TRegistry;
  strKey,strPath,strRealPath : String;
  strErr : String;
  VerInfo: TVerInfo;
  strVersion,strUpdate,sName : String;
begin
  if GlobalTask.ParamAsBoolean('CHECK_INSTALL') then begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      {$IFDEF ZAGS}
        strKey := '\Software\VCBOUS\ZAGS\';
      {$ELSE}
        {$IFDEF LAIS}
          strKey := '\Software\VCBOUS\LAIS\';
        {$ELSE}
          {$IFDEF GKH}
            strKey := '\Software\VCBOUS\GKH\';
          {$ELSE}
            strKey := '\Software\VCBOUS\SELSOVET\';
          {$ENDIF}
          {$IFDEF OCHERED}
            strKey := '\Software\VCBOUS\OCHERED\';
          {$ENDIF}
          {$IFDEF ZAH}
            strKey := '\Software\VCBOUS\ZAH\';
          {$ENDIF}
          {$IFDEF OPEKA}
            strKey := '\Software\VCBOUS\OPEKA\';
          {$ENDIF}
          {$IFDEF POST}
            strKey := '\Software\VCBOUS\POST\';
          {$ENDIF}
        {$ENDIF}
      {$ENDIF}
      strErr := '';
      strRealPath := DeleteSlesh(ExtractFilePath(Application.ExeName));
      if Reg.OpenKey(strKey, false) then begin
        strPath := DeleteSlesh(Reg.ReadString('installpath'));
        if ANSIUpperCase(strRealPath)<>ANSIUpperCase(strPath) then begin
          if strPath='' then strPath:='<отсутствует путь установки>';
          strErr := 'Папка запуска программы:'+#13+
                    strRealPath+#13+
                    'не соответствует пути по которому она была установлена:'+#13+
                    strPath;
        end;
      end else begin
        strErr := 'Папка запуска программы:'+#13+
                  strRealPath+#13+
                  'не соответствует пути по которому она была установлена:'+#13+
                  '<отсутствует путь установки>';
      end;
      if strErr<>'' then begin
        if Problem(strErr+#13#13+'Устранить несоответствие ?') then begin
          if Reg.OpenKey(strKey, true) then begin
            VerInfo:=TVerInfo.Create(Application.ExeName);
            strVersion := VerInfo.MajorVersion+'.'+VerInfo.MinorVersion+'.'+VerInfo.Release;
            strUpdate  := VerInfo.Build;
            VerInfo.Free;
            Reg.WriteString('installpath',strRealPath);
            if lMainComp
              then Reg.WriteString('maincomp','1')
              else Reg.WriteString('maincomp','0');
            Reg.WriteString('version',strVersion);
            Reg.WriteString('update',strUpdate);
          end else begin
            PutError('Ошибка записи в реестр');
          end;
          sName := NAME_PROG;
//          DSiDeleteShortcut(sName, CSIDL_DESKTOPDIRECTORY);
          DSiCreateShortcut(Application.ExeName, sName,'' ,CSIDL_DESKTOPDIRECTORY,strRealPath);
//          DSiCreateShortcut(Application.ExeName, sName+'\'+sName, CSIDL_COMMON_PROGRAMS,strRealPath);
        end;     
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
end;

procedure EnabledAllForms( f : TForm; value : Boolean);
var
  i : Integer;
begin
  for i:=0 to Screen.FormCount-1 do begin
    if (f=nil) or (f.Name<>Screen.Forms[i].Name) then begin
      Screen.Forms[i].Enabled := value;
    end;
  end;
end;

function GetVersionProgram(nType:Integer) : String;
var
  VerInfo: TVerInfo;
begin
  VerInfo:=TVerInfo.Create(Application.ExeName);
  try
    Result:=VerInfo.MajorVersion;
    if nType>1
      then Result:=Result+'.'+VerInfo.MinorVersion;
    if nType>2
      then Result:=Result+'.'+VerInfo.Release;
  finally
    VerInfo.Free;
  end;
end;

//-------------------------------------------------------------------
procedure CheckErrorDate(val:Variant; nType:Integer; dVal1,dVal2:TDateTime);
var
  s:String;
begin
    if (Val<>null) and (nType<9999) then begin
      if dVal1=0 then dVal1:=STOD('18900101',tdClipper);
      if dVal2=0 then begin
        case nType of
         _TypeObj_TalonPrib : dVal2:=IncYear(Date,1);
         -1                 : dVal2:=IncYear(Date,50);
        else
          dVal2:=Date; // текущая дата
        end;
      end;
      if (Val<dVal1) or (Val>dVal2) then begin
        case nType of
          _TypeObj_ZRogd     : s:='рождения';
          _TypeObj_ZSmert    : s:='смерти';
          _TypeObj_TalonPrib : s:='прибытия';
          _TypeObj_TalonUbit : s:='убытия';
        else
          s:='';
        end;
        raise EMyError.Create('Неверная дата '+s+': '+DatePropis(Val,0));
      end;
    end;
end;
//----------------------------------------------
procedure RefreshGurnal(strName:String);
var
  i : Integer;
  Gurnal : TfmGurnal;
begin
  strName := ANSIUpperCase(Trim(strName));
  for i:=0 to ListGurnal.Count-1 do begin
    if ListGurnal.Objects[i] is TfmGurnal and
       (ListGurnal.Strings[i] = strName) then begin
      Gurnal:=TfmGurnal(ListGurnal.Objects[i]);
      PostMessage(Gurnal.Handle,WM_REFRESH,0,0);
      break;
    end;
  end;
end;
//----------------------------------------------
procedure RefreshGurnalSMDO;
begin
  RefreshGurnal('fmGurnSMDO');
end;
//----------------------------------------------
procedure RefreshGurnalAktZ;
begin
  RefreshGurnal('fmGurnAktZ');
end;
//----------------------------------------------
procedure DisableMainForm;
begin
  if fmMain.Enabled then begin
    fmMain.Enabled := false;
  end;
end;
//----------------------------------------------
procedure EnableMainForm;
begin
  if not fmMain.Enabled then begin
    fmMain.Enabled := true;
  end;
end;
//----------------------------------------------
var
  arrLines : TArrStrings;

function InitListStr(strMemo :String) : Integer;
begin
  SetLength(arrLines,0);
  strMemo:=StringReplace(strMemo,chr(10),'',[rfReplaceAll]);
  StrToArr(strMemo,arrLines,Chr(13),true);
  Result:=Length(arrLines);
end;

function GetStr(nLine:Integer) : String;
begin
  try
    Result:=arrLines[nLine];
  except
    Result:='';
  end;
end;

function GetAllStr(strType:String;strRazd:string) : String;
var
  i,j:Integer;
  arr : TArrStrings;
  s : String;
begin
  Result:='';
  if strType='' then strType:='VAL';
  StrToArr(UpperCase(strType),arr,';',true);
  for i:=0 to Length(arrLines)-1 do begin
    s:='';
    for j:=0 to Length(arr)-1 do begin
      if arr[j]='NPP' then begin
        s:=s+IntToStr(i+1)+'. ';
      end else if Copy(arr[j],1,3)='VAL' then begin
        s:=s+arrLines[i];
      end;
    end;
    Result:=Result+s+strRazd;
  end;
end;

{ TSystemProg }

constructor TSystemProg.Create;
begin
  FrecID.Obj:=0;
  FrecID.Men:=0;
  FrecID.Lic:=0;
  FrecID.Adres:=0;
  FCurTypeObj:=0;
  FCurProcedure:=null;
  FCurTypeProcedure:=0;
end;

destructor TSystemProg.Destroy;
begin
  inherited;
end;
//-------------------------------------------------------------------
function TSystemProg.CheckRunProcedure: Boolean;
var
  sss:String;
begin
  Result:=false;
  if (FCurTypeProcedure=RUN_REPORT) then begin  // получить отчет
    if (FCurProcedure<>null) and (FRecID.Obj>0)  and (FCurTypeObj>0) then begin
      Result:=true;
      sss:=FSoob;  // при вызове ExecOneReport значение FSoob почиститься
      ExecOneReport(FCurProcedure, false, IntToStr(FRecID.Obj), nil);
      if sss<>'' then begin
        ShowMessage(sss);
      end;
    end;
  end else if (FCurTypeProcedure=RUN_SOOB) then begin  // только выдать сообщение
    if FSoob<>'' then begin
      Result:=true;
      ShowMessage(FSoob);
    end;
  end;
end;
//-------------------------------------------------------------------
procedure TSystemProg.SetRunMenReport(recID:TID; vKod:Variant);
var
  s:String;
begin
  s:='';
  if VarToStr(vKod)='2' then begin
    s:='Сформирована справка о составе семьи для электросетей.';
  end;
  SystemProg.SetCurObj(_TypeObj_Nasel, recID);
  SystemProg.SetRunProcedure(RUN_REPORT, vKod, s);
end;
//-------------------------------------------------------------------
procedure TSystemProg.SetCurObj(nTypeObj: Integer; recID:TID);
begin
  FCurTypeObj:=nTypeObj;
  if FCurTypeObj=0 then begin
    FRecID.Obj:=0;
    FRecID.Lic:=0;
    FRecID.Men:=0;
    FRecID.Adres:=0;
  end else begin
    FRecID:=recID;
  end;
end;

procedure TSystemProg.SetRunProcedure(nTypeProc: Integer; vKod: Variant; strSoob:String);
begin
  FCurProcedure:=vKod;
  FCurTypeProcedure:=nTypeProc;
  FSoob:=strSoob;
end;

procedure TSystemProg.EventExcel(Sender: TObject);
var
  sProc:String;
  v:Variant;
begin
  if Pos('TBITEM_EXCEL_',TComponent(Sender).Name)>0 then begin
    sProc:=Trim(Copy(TComponent(Sender).Name,14,100));
    if GlobalTask.Script<>nil then begin
      GlobalTask.Script.RunEx(sProc,[],v);
    end;
  end else begin
    PutError('Ошибка!');
  end;
end;

function TSystemProg.MessageSourceGISUN(meta:TMetaTask): String;
begin
  {$IFDEF ZAGS}
    Result:=meta.ParamAsString('ID');  // '17608656';
    CheckKodZAGS_to_GISRN(Result);
  {$ELSE}
    Result:=meta.ParamAsString('ID');  // '17608656';
  {$ENDIF}
end;

{$IFDEF ZAGS}
function TSystemProg.CheckKodZAGS_to_GISRN(var sID:String):Boolean;
begin
  // если поле GISRN не пустое то код ГИС РН берем из него
  Result:=false;
  if (sID<>'') and dmBase.SprZags.Locate('ID', sID, []) then begin
    if dmBase.SprZags.FieldByName('GISRN').AsString<>'' then begin
      sID:=dmBase.SprZags.FieldByName('GISRN').AsString;
      Result:=true;
    end;
  end;
end;
function TSystemProg.CheckKodGISRN_to_ZAGS(var sGISRN:String):Boolean;
begin
  // ищем по полю GISRN и возвращаем поле ID
  Result:=false;
  if (sGISRN<>'') and dmBase.SprZags.Locate('GISRN', sGISRN, []) then begin
    if dmBase.SprZags.FieldByName('ID').AsString<>'' then begin
      sGISRN:=dmBase.SprZags.FieldByName('ID').AsString;
      Result:=true;
    end;
  end;
end;
{$ENDIF}

function CheckAddStr(s:String):Boolean;
begin
  Result:=( (Pos(' ',s)=0) and (Length(s)>2) );
end;
//--------------------------------------------------
function GetStr2Res:TStringList;
begin
  if strRes=nil then strRes:=TStringList.Create;
  if strRes.Count=0 then begin
    if FileExists(GlobalTask.PathService+'\strRes.ini') then begin
      strRes.LoadFromFile(GlobalTask.PathService+'\strRes.ini');
    end;
  end;
  Result:=strRes;
end;
function getHelp(sKod:String):String;
begin
  dmBase.WorkQueryS.SQL.Text:='SELECT TEXT FROM Help WHERE kod='+QStr(sKod);
  dmBase.WorkQueryS.Open;
  Result:=dmBase.WorkQueryS.Fields[0].AsString;
  dmBase.WorkQueryS.Close;
end;
function getResource(sKod:String; nType:Integer):String;
var
  s:String;
  n:Integer;
  sl:TStringList;
begin
  Result:='';
  sl:=GetStr2Res;
  if sl<>nil then begin
    s:=sKod;  // nType=-1
    case nType of
       0 : s:=sKod+'_RUS';
       1 : s:=sKod+'_BLR';
       2 : s:=sKod+'_ENG';
    end;
    n:=sl.IndexOfName(s);
    if (n=-1) and (nType>-1) then begin
      n:=sl.IndexOfName(sKod);
    end;
    if n>-1 then begin
      if sl.ValueFromIndex[n]='HELP' then begin
        Result:=getHelp(s);
      end else begin
        Result:=StringReplace(sl.ValueFromIndex[n], '#13', chr(13)+chr(10), [rfReplaceAll]);
      end;
    end;
  end;
end;
//------------------------------
procedure ShowHelp(sKod:String; slPar:TStringList; nWidth:Integer);
var
  s:String;
begin
//  s:='<READONLY>'+getResource(sKod, -1);
  s:='<READONLY>'+getHelp(sKod);
  if nWidth<=0 then nWidth:=800;
//  EditMemoR(s, 'Описание', nil, nWidth);
  EditMemo(s, 'Описание', nil, nWidth);
end;
//--------------------------------------------------
function getPril_(nType:Integer; sKod:String; nNomer:Integer; nSup:Integer):String;
var
  s,ss:String;
  n,i:Integer;
begin
  if nType=-1 then
    n:=GlobalTask.ParamAsInteger('PRINT_PRIL')
  else if nType<-1 then
    n:=GlobalTask.ParamAsInteger('PRINT_PRIL'+inttostr(abs(nType)))
  else
    n:=nType;
  if n=0 then begin
    Result:=''
  end else begin
//    s:=StringReplace(getResource(sKod,-1), '#13', chr(13)+chr(10), [rfReplaceAll]);  //#13
    s:=getResource(sKod,-1);   // замена #13 см. getResource
    if nNomer>0 then begin
      ss:=IntToStr(nNomer);
      if nSup>0 then begin
        ss:=ss+'<sup>'+IntToStr(nSup)+'</sup>'
      end;
    end else begin
      ss:='';
    end;
    s:=StringReplace(s, '<N>', ss, [rfReplaceAll]);
    if n=1 then begin   // без редакции
      i:=Pos('(в ред', s);
      if i>0 then begin
        s:=Copy(s,1,i-1);
      end;
    end;
    Result:=s;
  end;
end;
//--------------------------------------------------
function getPril(nType:Integer; sKod:String; nNomer:Integer):String;
begin
  Result:=getPril_(nType, sKod, nNomer, 0);
end;
//--------------------------------------------------
function getPril2(nType:Integer; sKod:String; nNomer:Integer; nSup:Integer):String;
begin
  Result:=getPril_(nType, sKod, nNomer, nSup);
end;

//--------------------------------------------------
function GetMRUList_NameM(lReload:Boolean):TStringList;
var
  strSQL,s:String;
begin
  if MRUList_NameM=nil   then MRUList_NameM:=TStringList.Create;
  if GlobalTask.ParamAsBoolean('MRU_NAME') then begin
    if lReload then MRUList_NameM.Clear;
    if MRUList_NameM.Count=0 then begin
      if lReload then begin
        strSQL:=dmBase.LoadSQLEx('ЗАГС_МужскиеИмена');
        if strSQL<>'' then begin
          dmBase.WorkQuery.SQL.Text:=strSQL;
          dmBase.WorkQuery.Open;
          while not dmBase.WorkQuery.Eof do begin
            s:=Trim(dmBase.WorkQuery.Fields[0].AsString);
            if CheckAddStr(s) then begin
              s:=FirstCharUpper(s);
              MRUList_NameM.Add(s);
            end;
            dmBase.WorkQuery.Next;
          end;
          dmBase.WorkQuery.Close;;
        end;
        Globaltask.WriteMRUList(MRUList_NameM,'NAMES_MEN_ZAGS');
      end;
      Globaltask.ReadMRUList(MRUList_NameM,'NAMES_MEN_ZAGS');
    end;
  end else begin
    MRUList_NameM.Clear;
  end;
  Result := MRUList_NameM;
end;

Function GetMRUList_NameG(lReload:Boolean):TStringList;
var
  strSQL,s:String;
begin
  if MRUList_NameG=nil   then MRUList_NameG:=TStringList.Create;
  if GlobalTask.ParamAsBoolean('MRU_NAME') then begin
    if lReload             then MRUList_NameG.Clear;
    if MRUList_NameG.Count=0 then begin
      if lReload then begin
        strSQL:=dmBase.LoadSQLEx('ЗАГС_ЖенскиеИмена');
        if strSQL<>'' then begin
          dmBase.WorkQuery.SQL.Text:=strSQL;
          dmBase.WorkQuery.Open;
          while not dmBase.WorkQuery.Eof do begin
            s:=Trim(dmBase.WorkQuery.Fields[0].AsString);
            if CheckAddStr(s) then begin
              s:=FirstCharUpper(s);
              MRUList_NameG.Add(s);
            end;
            dmBase.WorkQuery.Next;
          end;
          dmBase.WorkQuery.Close;;
        end;
        Globaltask.WriteMRUList(MRUList_NameG,'NAMES_WOMEN_ZAGS');
      end;
      Globaltask.ReadMRUList(MRUList_NameG,'NAMES_WOMEN_ZAGS');
    end;
  end else begin
    MRUList_NameG.Clear;
  end;
  Result := MRUList_NameG;
end;

function GetMRUList_OtchM(lReload:Boolean):TStringList;
var
  strSQL,s:String;
begin
  if MRUList_OtchM=nil   then MRUList_OtchM:=TStringList.Create;
  if GlobalTask.ParamAsBoolean('MRU_NAME') then begin
    if lReload             then MRUList_OtchM.Clear;
    if MRUList_OtchM.Count=0 then begin
      if lReload then begin
        strSQL:=dmBase.LoadSQLEx('ЗАГС_МужскиеОтчества');
        if strSQL<>'' then begin
          dmBase.WorkQuery.SQL.Text:=strSQL;
          dmBase.WorkQuery.Open;
          while not dmBase.WorkQuery.Eof do begin
            s:=Trim(dmBase.WorkQuery.Fields[0].AsString);
            if CheckAddStr(s) then begin
              s:=FirstCharUpper(s);
              MRUList_OtchM.Add(s);
            end;
            dmBase.WorkQuery.Next;
          end;
          dmBase.WorkQuery.Close;;
        end;
        Globaltask.WriteMRUList(MRUList_OtchM,'OTCH_MEN_ZAGS');
      end;
      Globaltask.ReadMRUList(MRUList_OtchM,'OTCH_MEN_ZAGS');
    end;
  end else begin
    MRUList_OtchM.Clear;
  end;
  Result := MRUList_OtchM;
end;

function GetMRUList_OtchG(lReload:Boolean):TStringList;
var
  strSQL,s:String;
begin
  if MRUList_OtchG=nil   then MRUList_OtchG:=TStringList.Create;
  if GlobalTask.ParamAsBoolean('MRU_NAME') then begin
    if lReload             then MRUList_OtchG.Clear;
    if MRUList_OtchG.Count=0 then begin
      if lReload then begin
        strSQL:=dmBase.LoadSQLEx('ЗАГС_ЖенскиеОтчества');
        if strSQL<>'' then begin
          dmBase.WorkQuery.SQL.Text:=strSQL;
          dmBase.WorkQuery.Open;
          while not dmBase.WorkQuery.Eof do begin
            s:=Trim(dmBase.WorkQuery.Fields[0].AsString);
            if CheckAddStr(s) then begin
              s:=FirstCharUpper(s);
              MRUList_OtchG.Add(s);
            end;
            dmBase.WorkQuery.Next;
          end;
          dmBase.WorkQuery.Close;;
        end;
        Globaltask.WriteMRUList(MRUList_OtchG,'OTCH_WOMEN_ZAGS');
      end;
      Globaltask.ReadMRUList(MRUList_OtchG,'OTCH_WOMEN_ZAGS');
    end;
  end else begin
    MRUList_OtchG.Clear;
  end;
  Result := MRUList_OtchG;
end;

function LimitMRUList(nType:Integer):Integer;
begin
  Result:=0;
  {
  case nType of
    1:Result:=400;
    2:Result:=1000;
    3:Result:=3000;
  end;
  }
end;

//------------------------------------------------------------------------
function GetMRUName_Punkt(lBel:Boolean; lReload:Boolean):TStringList;
var
  s:String;
  sl:TStringList;
begin
  if lBel then begin
    if MRUName_PunktB=nil then MRUName_PunktB:=TStringList.Create;
    sl:=MRUName_PunktB;
  end else begin
    if MRUName_Punkt=nil then MRUName_Punkt:=TStringList.Create;
    sl:=MRUName_Punkt;
  end;
  if lReload then sl.Clear;
  if sl.Count=0 then begin
    dmBase.SprPunkt.First;
    while not dmBase.SprPunkt.Eof do begin
      if lBel then s:=dmBase.SprPunkt.FieldByName('NAME_B').AsString
              else s:=dmBase.SprPunkt.FieldByName('NAME').AsString;
      if s<>'' then begin
        sl.Add(s);
      end;
      dmBase.SprPunkt.Next;
    end;
    dmBase.SprPunkt.First;
  end;
  Result := sl;
end;
//------------------------------------------------------------------------
function GetMRU_MKB10(lReload:Boolean):TStringList;
{$IFDEF ADD_MKB10}
var
  s:String;
  sl:TStringList;
begin
  if MRU_MKB10=nil then MRU_MKB10:=TStringList.Create;
  sl:=MRU_MKB10;

  if lReload then sl.Clear;
  if sl.Count=0 then begin
    dmBase.SprMKB10.First;
    while not dmBase.SprMKB10.Eof do begin
      s:=dmBase.SprMKB10.FieldByName('KOD').AsString;
      if s<>'' then begin
        sl.Add(s);
      end;
      dmBase.SprMKB10.Next;
    end;
    dmBase.SprMKB10.First;
  end;
  Result:=sl;
end;
{$ELSE}
begin
end;
{$ENDIF}

procedure SetReloadMRUName(nType:Integer;lBel:Boolean);
begin
  if lBel then begin

  end else begin
    if (nType>0) and (nType<5) then begin
      arrReloadMRUNameR[nType]:=true;
    end;
  end;
end;

procedure SetReloadAllMRUName;
begin
  arrReloadMRUNameR[1]:=true;
  arrReloadMRUNameR[2]:=true;
  arrReloadMRUNameR[3]:=true;
end;

function GetMRUName(nType:Integer;lAll:Boolean;lReload:Boolean;lBel:Boolean):TStringList;
var
  s:String;
  sl:TStringList;
  fld:TField;
begin
  sl:=nil;
  if lBel then begin
    case nType of
     1 : begin if MRUName_Obl_B=nil   then MRUName_Obl_B:=TStringList.Create; sl:=MRUName_Obl_B;  end;
     2 : begin if MRUName_Rn_B=nil    then MRUName_Rn_B:=TStringList.Create; sl:=MRUName_Rn_B; end;
     3 : begin if MRUName_NP_B=nil    then MRUName_NP_B:=TStringList.Create; sl:=MRUName_NP_B; end;
    end;
  end else begin
    case nType of
     1 : begin if MRUName_Obl=nil   then MRUName_Obl:=TStringList.Create; sl:=MRUName_Obl;  end;
     2 : begin if MRUName_Rn=nil    then MRUName_Rn:=TStringList.Create; sl:=MRUName_Rn; end;
     3 : begin if MRUName_NP=nil    then MRUName_NP:=TStringList.Create; sl:=MRUName_NP; end;
     4 : begin if MRUName_RnGor=nil then MRUName_RnGor:=TStringList.Create; sl:=MRUName_RnGor; end;
    end;
  end;
  if sl<>nil then begin
    if lReload or (not lBel and arrReloadMRUNameR[nType]) then begin
      sl.Clear;
    end;
    if sl.Count=0 then begin
      dmBase.SprPerevod.IndexName:='PR_KEY';
      dmBase.SprPerevod.SetRange([nType],[nType]);
      if lBel
        then fld:=dmBase.SprPerevod.FieldByName('B_NAME')
        else fld:=dmBase.SprPerevod.FieldByName('R_NAME');
      while not dmBase.SprPerevod.Eof do begin
        s:=fld.AsString;
        if s<>'' then begin
          sl.Add(s);
        end;
        dmBase.SprPerevod.Next;
      end;
      dmBase.SprPerevod.CancelRange;
      if not lBel then begin
        arrReloadMRUNameR[nType]:=false;
      end;
    end;
  end;
  Result:=sl;
end;

//--------------------------------------------------------------------------
function GetVoenkomMen(strID:String;nTypeDate:Integer;sDelim:String):String;
{$IFDEF ADD_MENS_PU}
var
  strBookmark:String;
{$ENDIF}
begin
  Result:='';
  {$IFDEF ADD_MENS_PU}
   // нужно идти по списку людей лицевого счета
  strBookmark:=fmMain.dmMen.mtDokument.Bookmark;
  if fmMain.dmMen.mtDokument.Locate('ID', strID,[]) then begin
    Result:=fmMain.dmMen.GetVoenkom(nTypeDate,sDelim);
  end;
  fmMain.dmMen.mtDokument.Bookmark:=strBookmark;
  {$ENDIF}
end;

//--------------------------------------------------------------------------
function dbCreateListOwners : TDataSet;
begin
  Result := dbCreateMemTable('ACTIVE,Logical,0;TYPEKOD,Integer;ID,Integer;LIC_ID,Integer;ADRES_ID,Integer;NAME,Char,200;POL,Char,1;'+
                             'NOMER,Char,20;AGE,Integer,0;DATES,Date,0;;DATEP,Date,0;DATER,Date,0;OTNOSH,Integer,0;OTNOSH_NAME,Char,30;TAIL,Char,1;','');
  if Result<>nil then begin
    Result.Active:=true;
  end;
end;
//--------------------------------------------------------------------------
function ReadOwners(strID:String; tbOwnersExternal:TDataSet):TDataSet;
{$IFDEF ADD_MENS_PU}
{
var
  s, strName,sBookmark : String;
  lPropis,l2, lMen,lOrg : Boolean;
  lOk:Boolean;
  d,dCur : TDateTime;
  tbOwners:TDataSet;
}
{$ENDIF}
begin
  Result:=nil;
{$IFDEF ADD_MENS_PU}
{
  ds:=dbCreateListOwners;
  Result:=ds;
  if strIdAdres='' then exit;
  if tbOwnersExternal=nil then begin   // идем по базе
    dmBase.tbHouseOwners.IndexName := 'VIEW_KEY';
    dmBase.tbHouseOwners.SetRange([GetDateCurrentSost,strId],[GetDateCurrentSost,strId]);
    tbOwners:=dmBase.tbHouseOwners;
  end else begin
    tbOwners:=tbOwnersExternal;       // идем по переданному Dataset`у
    tbOwners.First;
  end;
  d:=dmBase.GetCurDate;
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
      strName:='';
        if strName='' then begin
          s := AdresOwner(DateFiks, tbOwners.FieldByName('KOD').AsString,
                 tbOwners.FieldByName('TYPEKOD').AsInteger, strName, lPropis);
        end;
        if nType=1 then begin
          if sl<>nil then begin
            sl.Add(strName + ' ' + tbOwners.FieldByName('TAIL').AsString);
          end;
          if tb<>nil then begin
          end;
          s := tbOwners.FieldByName('TAIL').AsString;
          if (s<>'') and (s<>'1') then s := '-' + s + ' часть';
          Result := Result + strName + s + ', ';
        end;
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
      Result := Copy(Result,1,Length(Result)-2);
    end;
  end;
  if tbOwnersExternal=nil then begin   // идем по базе
    tbHouseOwners.CancelRange;
  end;
  }
{$ELSE}

{$ENDIF}
end;

//--------------------------------------------------------------------------
function dbCreateListDeti : TDataSet;
begin
  Result := dbCreateMemTable('OWNER,Integer,0;CHECK,Logical,0;FAMILIA,Char,100;NAME,Char,50;OTCH,Char,60;POL,Char,1;'+
                             'AGE,Integer,0;DATER,Date,0;OTNOSH,Integer,0;OTNOSH_NAME,Char,30;AKT_ROGD,Char,200','');
  if Result<>nil then begin
    Result.Active:=true;
  end;
end;
//--------------------------------------------------------------------------
function ReadDeti(strID:String; strPol:String; Vozr1,Vozr2:Integer; lOnlyLic:Boolean; lNotPasport:Boolean):TDataSet;
begin
  dmBase.GetDeti(CurListDeti,strID,strPol,Vozr1,Vozr2,lOnlyLic,lNotPasport);
  Result:=CurListDeti;
end;

// lNotPasport - только без паспорта
//--------------------------------------------------------------------------
function ReadDetiLic(strID:String;Vozr1,Vozr2:Integer;lNotPasport:Boolean):TDataSet;
{$IFDEF ADD_MENS_PU}
var
  tbMens:TDataset;
  nVozr:Integer;
  strBookmark,strPol:String;
  lOk:Boolean;
{$ENDIF}
begin
  {$IFDEF ADD_MENS_PU}
  TkbmMemTable(CurListDeti).EmptyTable;
  if fmMain.FOpenLic then begin
    // нужно идти по списку людей лицевого счета
    tbMens:=fmMain.dmMen.mtDokument;
    strBookmark:=tbMens.Bookmark;
    if tbMens.Locate('ID', strID,[]) then begin
      strPol:=tbMens.FieldByName('POL').AsString;
      tbMens.First;
      while not tbMens.Eof do begin
        if (tbMens.FieldByName('ID').AsString<>strID) and
           ( ((strPol='М') and (strID=tbMens.FieldByName('PA_ID').AsString)) or
             ((strPol='Ж') and (strID=tbMens.FieldByName('MA_ID').AsString)) )
        then begin
          nVozr:=dbGetCountYear(tbMens.FieldByName('DATER'), dmBase.GetCurDate);
          if (nVozr>=Vozr1) and (nVozr<=Vozr2) then begin
            lOk := true;
            if lNotPasport then begin
              if (tbMens.FieldByName('PASP_NOMER').AsString<>'') and not tbMens.FieldByName('PASP_DATE').IsNull and
                 (tbMens.FieldByName('PASP_UDOST').AsInteger<>UDOST_SVID_ROGD) then begin
                lOk:=false;
              end;
            end;
//            if not lok
//              then Showmessage('not OK  '+tbMens.FieldByName('PASP_UDOST').AsString)
//              else Showmessage('OK      '+tbMens.FieldByName('PASP_UDOST').AsString);
            if lOk then begin
              CurListDeti.Append;
              CurListDeti.FieldByName('OWNER').AsString:=tbMens.FieldByName('OWNER_ID').AsString;
              CurListDeti.FieldByName('FAMILIA').AsString:=tbMens.FieldByName('FAMILIA').AsString;
              CurListDeti.FieldByName('NAME').AsString:=tbMens.FieldByName('NAME').AsString;
              CurListDeti.FieldByName('OTCH').AsString:=tbMens.FieldByName('OTCH').AsString;
              CurListDeti.FieldByName('POL').AsString:=tbMens.FieldByName('POL').AsString;
              if CurListDeti.FieldByName('POL').AsString='М'
                then CurListDeti.FieldByName('OTNOSH_NAME').AsString:='сын'
                else CurListDeti.FieldByName('OTNOSH_NAME').AsString:='дочь';
              CurListDeti.FieldByName('OTNOSH').AsInteger:=tbMens.FieldByName('OTNOSH').AsInteger;
              if tbMens.FieldByName('DATER').IsNull then begin
                CurListDeti.FieldByName('DATER').AsString:='';
              end else begin
                CurListDeti.FieldByName('DATER').AsDateTime:=tbMens.FieldByName('DATER').AsDateTime;
              end;
              CurListDeti.FieldByName('AGE').AsInteger:=nVozr;


              CurListDeti.Post;
            end;
          end;
        end;
        tbMens.Next;
      end;
    end;
    tbMens.Bookmark:=strBookmark;
  end else begin
    dmBase.GetDeti(CurListDeti,strID,'',Vozr1,Vozr2,true,lNotPasport);
  end;
  CurListDeti.First;
  Result:=CurListDeti;
  {$ELSE}
  Result:=nil;
  {$ENDIF}
end;

//---------------------------------------------------------------------
procedure LoadComboboxFromOpis( ed : TDbComboboxEh; strOpis:String );
var
  Opis : TOpisEdit;
  i : Integer;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA(strOpis);
  if Opis<>nil then begin
    ed.Items.Clear;
    ed.KeyItems.Clear;
    for i:=0 to Opis.Items.Count-1 do begin
      ed.Items.Add(Opis.Items[i]);
      ed.KeyItems.Add(Opis.KeyList[i]);
    end;
  end;
end;

//---------------------------------------------------------------------
procedure LoadOpis(strOpis:String; slItems:TStringList; slKeyItems:TStringList);
var
  Opis : TOpisEdit;
  i : Integer;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA(strOpis);
  if Opis<>nil then begin
    ClearOpis(strOpis);
    if slKeyItems=nil then begin
      for i:=0 to slItems.Count-1 do begin
        Opis.Items.Add(slItems.ValueFromIndex[i]);
        Opis.KeyList.Add(slItems.Names[i]);
      end;
    end else begin
      for i:=0 to slItems.Count-1 do begin
        Opis.Items.Add(slItems.Strings[i]);
        Opis.KeyList.Add(slKeyItems.Strings[i]);
      end;
    end;
  end;
end;

//---------------------------------------------------------------------
// ведется учет с по районам города
function IsAccountRnGor:Boolean;
var
  Opis : TOpisEdit;
begin
  Result:=false;
  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_RNGOR');
  if Opis<>nil then begin
    if Opis.Items.Count>0 then Result:=true;
  end;
end;

//---------------------------------------------------------------------
{$IFDEF ZAGS}
procedure LoadRnMyGor(strOpis:String; sSOATO:String; strFilter:String);
var
  Opis:TOpisEdit;
//  i : Integer;
  st:TSostTable;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA(strOpis);
  if dmBase.SprSoato.Active then begin
      st:=SaveSostTable(dmBase.SprSoato,false);
      dmBase.SprSoato.IndexFIELDNames:='KOD';
    //  dmBase.SprSoato.SetRange([sSOATO],[sSOATO]);
      dmBase.SprSoato.ScopeBegin:=sSOATO;
      dmBase.SprSoato.ScopeEnd:=sSOATO;
      dmBase.SprSoato.Scoped:=true;
      if strFilter<>'' then begin
        dmBase.SprSoato.Filter:=strFilter;  // 'substr(kod,5,3)<>'000' and substr(kod,7,1)<>'0' '
        dmBase.SprSoato.Filtered:=true;
      end;
      if not fmMain.tbRnGor.Active then fmMain.tbRnGor.Active:=true;
      fmMain.tbRnGor.EmptyTable;

      Opis.Items.Clear;
      Opis.KeyList.Clear;
      while not dmBase.SprSoato.Eof do begin
        fmmain.tbRnGor.Append;
        fmmain.tbRnGorID.AsString:=dmBase.SprSoato.FieldByName('ID').AsString;
        fmmain.tbRnGorKOD.AsString:=dmBase.SprSoato.FieldByName('KOD').AsString;
        fmmain.tbRnGorNAME.AsString:=dmBase.SprSoato.FieldByName('NAME').AsString;
        fmmain.tbRnGor.Post;
        dmBase.SprSoato.Next;
      end;
      dmBase.SprSoato.Filtered:=false;
      dmBase.SprSoato.Filter:='';
      dmBase.SprSoato.Scoped:=false;
      RestSostTable(dmBase.SprSoato,st);
  end else begin

  end;
end;
{$ENDIF}

procedure LoadOpisFromSOATO(strOpis:String; sSOATO:String; strFilter:String; nPos:Integer; nCount:Integer);
var
  Opis : TOpisEdit;
//  i : Integer;
  st:TSostTable;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA(strOpis); //'KEY_RNGOR');
  if (Opis<>nil) and dmBase.SprSoato.Active then begin
    st:=SaveSostTable(dmBase.SprSoato,false);
    if sSoato<>'' then begin
      dmBase.SprSoato.IndexFIELDNames:='KOD';
  //  dmBase.SprSoato.SetRange([sSOATO],[sSOATO]);
      dmBase.SprSoato.ScopeBegin:=sSOATO;
      dmBase.SprSoato.ScopeEnd:=sSOATO;
      dmBase.SprSoato.Scoped:=true;
    end;
    if strFilter<>'' then begin
      dmBase.SprSoato.Filter:=strFilter;  // 'substr(kod,5,3)<>'000' and substr(kod,7,1)<>'0' '
      dmBase.SprSoato.Filtered:=true;
    end;
    Opis.Items.Clear;
    Opis.KeyList.Clear;
    while not dmBase.SprSoato.Eof do begin
      Opis.Items.Add(dmBase.SprSoato.FieldByName('NAME').AsString);
      Opis.KeyList.Add(Copy(dmBase.SprSoato.FieldByName('KOD').AsString,nPos,nCount));
      dmBase.SprSoato.Next;
    end;
    dmBase.SprSoato.Filtered:=false;
    dmBase.SprSoato.Filter:='';
    dmBase.SprSoato.Scoped:=false;
    RestSostTable(dmBase.SprSoato,st);
  end;
end;

//---------------------------------------------------------------------
procedure LoadOpisControlHouse;
var
  Opis : TOpisEdit;
//  i : Integer;
  st:TSostTable;
  s:String;
begin
//- 1. KEY_CONTROL_HOUSE -----------------------------------------------------------
  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_CONTROL_HOUSE');
  if Opis=nil then begin

  end else begin
    st:=SaveSostTable(dmBase.SprWork,false);
    dmBase.SprWork.Filter:='is_control=.t.';
    dmBase.SprWork.Filtered:=true;
    Opis.Items.Clear;
    Opis.KeyList.Clear;
    while not dmBase.SprWork.Eof do begin
      //---------------------------------
      Opis.Items.Add(dmBase.SprWork.FieldByName('NAME').AsString);
      Opis.KeyList.Add(dmBase.SprWork.FieldByName('ID').AsString);
      //---------------------------------
      dmBase.SprWork.Next;
    end;
    dmBase.SprWork.Filtered:=false;
    dmBase.SprWork.Filter:='';
    dmBase.SprWork.Scoped:=false;
    RestSostTable(dmBase.SprWork,st);
    //---------------------------------
    s:=Globaltask.ParamAsString('CONTROL_HOUSE');
    if s='' then s:='по умолчанию';
    Opis.Items.Add(s);
    Opis.KeyList.Add(IntToStr(CONTROL_DEFAULT));
    //---------------------------------
    Opis.Items.Add('в частной собственности');
    Opis.KeyList.Add(IntToStr(CONTROL_PRIVATE));
    //---------------------------------
  end;

//- 2. KEY_USE_GILFOND ------------------------------------------------------------------
  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_USE_GILFOND');
  if Opis=nil then begin

  end else begin
    st:=SaveSostTable(dmBase.SprWork,false);
    dmBase.SprWork.Filter:='is_gilfond=.t.';
    dmBase.SprWork.Filtered:=true;
    Opis.Items.Clear;
    Opis.KeyList.Clear;
    while not dmBase.SprWork.Eof do begin
      //---------------------------------
      Opis.Items.Add(dmBase.SprWork.FieldByName('NAME').AsString);
      Opis.KeyList.Add(dmBase.SprWork.FieldByName('ID').AsString);
      //---------------------------------
      dmBase.SprWork.Next;
    end;
    dmBase.SprWork.Filtered:=false;
    dmBase.SprWork.Filter:='';
    dmBase.SprWork.Scoped:=false;
    RestSostTable(dmBase.SprWork,st);
    //---------------------------------
    s:=Globaltask.ParamAsString('DEFAULT_GES');
    if s='' then s:='по умолчанию';
    Opis.Items.Add(s);
    Opis.KeyList.Add(IntToStr(CONTROL_DEFAULT));   // 0
    //---------------------------------
//    Opis.Items.Add('в частной собственности');   // -1
//    Opis.KeyList.Add(IntToStr(CONTROL_PRIVATE));
    //---------------------------------
  end;

end;

//---------------------------------------------------------------------
procedure ClearOpis(strOpis:String);
var
  Opis : TOpisEdit;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA(strOpis); //'KEY_RNGOR');
  if Opis<>nil then begin
    Opis.Items.Clear;
    Opis.KeyList.Clear;
  end;
end;

//--------------------------------------------------------
// nIDKomu     - ID кому выдается справка
// sOtnoshKomu - КОД отношения к главе хоз-ва кому выдается справка
// nIDCur      - ID текущего человека
// sOthosh     - КОД отношения к главе хоз-ва для текущего человека
const
  name_glava='Глава';

{$IFDEF ZAH}
function GetOtnosh(nIDKomu:Integer; sOtnoshKomu:String; nIDCur:Integer; sOtnosh:String; sPol:String):String;
begin Result:=''; end;
function GetOtnoshID(nIDKomu:Integer; sOtnoshKomu:String; nIDCur:Integer; sOtnosh:String; sPol:String):String;
begin  Result:=''; end;
function GetOtnoshForChild(sPOL:String; sOtnosh:String):Integer;
begin  Result:=0; end;
{$ELSE}
function GetOtnosh(nIDKomu:Integer; sOtnoshKomu:String; nIDCur:Integer; sOtnosh:String; sPol:String):String;
var
  sName,sNameKomu:String;
//  dsPerexod:TDataSet;
begin
  if nIDKomu=nIDCur then begin
    Result:='';
    exit;
  end;

  sNameKomu:='';
  if (sOtnoshKomu='') or (sOtnoshKomu='0') then begin

  end else begin
    if dmBase.SprOtnosh.Locate('ID', sOtnoshKomu, []) then begin
      sNameKomu:=dmBase.SprOtnosh.FieldByName('NAME').AsString;
    end;
  end;

  sName:='';
  if (sOtnosh='') or (sOtnosh='0') then begin

  end else begin
    if dmBase.SprOtnosh.Locate('ID', sOtnosh, []) then begin
      sName:=dmBase.SprOtnosh.FieldByName('NAME').AsString;
    end;
  end;

  if (sNameKomu='') and (sName='') then begin
    Result:='';
  end else if (sNameKomu='') or MySameText(sNameKomu,'собственник') or MySameText(sNameKomu,'наниматель') then begin
    Result:=sName;
  end else begin
    if sName='' then sName:=name_glava;
    if sName=name_glava then begin
      if dmBase.SprRodsName.Locate('KOMU_NAME;OLD_NAME;POL', VarArrayOf([sNameKomu,sName,sPol]), [loCaseInsensitive]) then begin
        Result:=dmBase.SprRodsName.FieldByName('NEW_NAME').AsString;
      end else begin
        Result:='';
      end;
    end else begin
      if dmBase.SprRodsName.Locate('KOMU_NAME;OLD_NAME', VarArrayOf([sNameKomu,sName]), [loCaseInsensitive]) then begin
        Result:=dmBase.SprRodsName.FieldByName('NEW_NAME').AsString;
      end else begin
        Result:='';
      end;
    end;
  end;
end;
//------------------------------------
function GetOtnoshID(nIDKomu:Integer; sOtnoshKomu:String; nIDCur:Integer; sOtnosh:String; sPol:String):String;
var
  s:String;
begin
  Result:='';
  s:=GetOtnosh(nIDKomu,sOtnoshKomu,nIDCur,sOtnosh,sPol);
  if s<>'' then begin
    if dmBase.SprOtnosh.Locate('NAME', s, []) then begin
      Result:=dmBase.SprOtnosh.FieldByName('ID').AsString;
    end;
  end;
end;
//--------------------------------------------------------------------------------------------------------------
// сформировать отношение для ребенка при записи актовой записи о рождении если родители не глава лицевого счета
// sOtnosh - код отношения одного из родителей к главе лицевого счета
function GetOtnoshForChild(sPOL:String; sOtnosh:String):Integer;
var
  sNameOtnosh,sName:String;
begin
  Result:=-1;
  if dmBase.SprOtnosh.Locate('ID', sOtnosh, []) then begin
    sNameOtnosh:=dmBase.SprOtnosh.FieldByName('NAME').AsString;  // отношение мамы или папы к главе
    if sPOL='Ж' then sName:='дочь' else sName:='сын';
    dmBase.SprRodsName.Filter:='OLD_NAME<>'+QStr(name_glava);
    dmBase.SprRodsName.Filtered:=true;
    if dmBase.SprRodsName.Locate('KOMU_NAME;NEW_NAME', VarArrayOf([sNameOtnosh,sName]), [loCaseInsensitive]) then begin
      sName:=dmBase.SprRodsName.FieldByName('OLD_NAME').AsString;
      if dmBase.SprOtnosh.Locate('NAME', sName, []) then begin
        Result:=dmBase.SprOtnosh.FieldByName('ID').AsInteger;
      end;
    end;
    dmBase.SprRodsName.Filtered:=false;
  end;
end;
{$ENDIF}

//----------------------------------------------------------------------------------
procedure CheckPersonalPath;
begin
end;

//----------------------------------------------------------------------------------
function GetFileExcelReport(sName:String):String;
begin
  Result:=NameFromExe('TemplateExcel\'+sName);
end;

//----------------------------------------------------------------------------------
function GetFileExcel(sName:String):String;
begin
  Result:=CheckSleshN(GetFolderMyDocument)+sName;
end;
//----------------------------------------------------------------------------------
function BuildExcelMenu(Menu:TTBSubmenuItem; strKod:String;lClear:Boolean):Boolean;
var
 it:TTBItem;
 i:Integer;
 v:Variant;
begin
  slExcelReport.Clear;
  Result:=false;
  if (GlobalTask.Script<>nil) then begin
    v:=null;
    GlobalTask.Script.RunEx(strKod+'_EXCELREPORT',[],v);
    // может есть пользовательский в файле personal.pas
    GlobalTask.Script.RunEx('USER_'+strKod+'_EXCELREPORT',[],v);
  end;
//  if IniExcel=nil then begin
//    IniExcel:=TSasaIniFile.Create(GlobalTask.PathService+'ExcelReport.ini');
//  end;
  if slExcelReport.Count>0 then begin
    Result:=true;
    if lClear then Menu.Clear;
    for i:=0 to slExcelReport.Count-1 do begin
      if Copy(slExcelReport.Strings[i],1,5)='-----' then begin
        Menu.Add(TTbSeparatorItem.Create(Menu));
      end else begin
        it := TTbItem.Create(Menu);
        it.Caption:=slExcelReport.Names[i];
        it.OnClick:=SystemProg.EventExcel;
        try
          it.Name:='TBITEM_EXCEL_'+slExcelReport.ValueFromIndex[i];
        except
          it.Name:='TBITEM_EXCEL_'+IntToStr(i);
        end;
        Menu.Add(it);
      end;  
    end;
  end;
  slExcelReport.Clear;
end;

//-----------------------------------------------------------------
function ExecOneReport(vKod:Variant; lAll:Boolean; IDMen:String; f:TForm):Boolean;
var
  slPar : TStringList;
  Template : TTemplate;
  ds : TDataSet;
  lSet,l : Boolean;
  fg:TfmGurnal;
  s:String;
  sField:String;
begin
  if IsAllDigit(VarToStr(vKod)) then begin
    sField:='ID';
  end else begin
    sField:='KOD';
  end;
  Result:=false;
  if dmBase.RunSpr.Locate(sField,vKod,[loCaseInsensitive]) then begin
    with dmBase.RunSpr do begin
      lSet:=false;
      ds:=nil;           
      l:=false;
      if (FieldByName('TYPEOBJ').AsInteger=0) then begin   // форму открывать не надо
        if FieldByName('TYPEREPORT').AsString='DOC' then begin
          Template:=fmMain.TemplateInterface.GetTemplate(FieldByName('NAMEREPORT').AsString);
          if Template=nil then begin
            PutError('Не найден Word-шаблон.');
          end else begin
            fmMain.OnTemplateMenuClick(Template);
            Result:=true;
          end;
        end;
      end else begin
        slPar:=TStringList.Create;
        slPar.Add('NAME_REPORT='+FieldByName('NAMEREPORT').AsString);
        slPar.Add('NAME_REPORT_ALL='+FieldByName('NAMEREPORT_ALL').AsString);
        slPar.Add('TYPE_REPORT='+FieldByName('TYPEREPORT').AsString);
        slPar.Add('ID_REPORT='+FieldByName('ID').AsString);
        slPar.Add('KOD_REPORT='+FieldByName('KOD').AsString);
        slPar.Add('CAPTION_REPORT='+FieldByName('NAME').AsString);
        if lAll then begin
          if (f<>nil) and (f is TfmGurnal) then begin
            fg:=TfmGurnal(f);
            ds:=fg.Grid.DataSource.DataSet;
            s:=ds.Bookmark;
            l:=dbDisableControls(ds);
            lSet:=fg.BookmarkToFilter('ID');
            slPar.Add('DATASET='+IntToStr(Integer(ds)));
            slPar.Add('ALL=1');
          end;
        end;
        try
          Result:=fmMain.RunReport(FieldByName('TYPEOBJ').AsInteger,slPar,IDMen);
        finally
          if ds<>nil then begin
            if lSet then begin
              ds.Filtered:=false;
              ds.Filter:='';
            end;
            ds.Bookmark:=s;
            dbEnableControls(ds,l);
          end;
          FreeAndNil(slPar);
        end;
      end;
    end;
  end;
end;

var
  arrPodpisDolg : array[1..3] of String;
  arrPodpisFIO  : array[1..3] of String;
  PodpisShtamp:Integer;
  lDolgAllList:Boolean;

function Podpis_Init(vKod:Variant):Integer;
var
  lOk:Boolean;
  sField:String;
  sDolg,sFIO:String;
  nShtampChoice:Integer;
  procedure getDolg_and_FIO(ss:String);
  begin
    sDolg:='';
    sFIO:='';
    if IsAllDigit(ss) then begin // ID из мправочника должностных лиц
      getDolgAndFIOFromSpr(ss,sDolg,sFIO);
    end else begin
      if ss='RUKV' then begin
        sDolg:=DolgRukov;
        sFIO:=FIORukov;
      end else if ss='SEKR' then begin
        sDolg:=DolgSecretar;
        sFIO:=FIOSecretar;
      end else if ss='SPEC' then begin
        sDolg:=DolgSpec;
        sFIO:=FIOSpec;
      end else if ss='BUXG' then begin
        sDolg:=DolgGlBux;
        sFIO:=FIOGlBux;
      end;
    end;
  end;
begin    
  Result:=0;
  arrPodpisDolg[1]:='';
  arrPodpisDolg[2]:='';
  arrPodpisDolg[3]:='';
  arrPodpisFIO[1]:='';
  arrPodpisFIO[2]:='';
  arrPodpisFIO[3]:='';
  PodpisShtamp:=-1;        // не делать никах телодвижений со штампами
  lDolgAllList:=false;
  if VarIsEmpty(vKod) or VarIsNull(vKod) then exit;
  if IsAllDigit(VarToStr(vKod)) then begin
    sField:='ID';
  end else begin
    sField:='KOD';
  end;
//  if IsAllDigit(strKod) then sField:='ID' else sField:='KOD';
  lOk:=false;
//  if vKod<>'' then begin
    if dmBase.RunSpr.Locate(sField,vKod,[loCaseInsensitive]) then begin
      nShtampChoice:=0;
      if dmBase.RunSpr.FieldByName('SHTAMP_CHOICE').AsInteger>0 then begin
        nShtampChoice:=dmBase.RunSpr.FieldByName('SHTAMP_CHOICE').AsInteger;
        PodpisShtamp:=dmBase.RunSpr.FieldByName('SHTAMP_CUR').AsInteger;
      end;
      if dmBase.RunSprUser.Locate(sField,vKod,[loCaseInsensitive, loPartialKey]) then begin
        if nShtampChoice>0 then begin
          PodpisShtamp:=dmBase.RunSprUser.FieldByName('SHTAMP_CUR').AsInteger;
        end;
        if not dmBase.RunSpr.FieldByName('USER_PODP').IsNull and dmBase.RunSpr.FieldByName('USER_PODP').AsBoolean then begin
          lOk:=true;
          Result:=1;
          getDolg_and_FIO(dmBase.RunSprUser.FieldByName('DOLG_PODP1').AsString);
          arrPodpisDolg[1]:=sDolg;
          arrPodpisFIO[1]:=sFIO;
          if not dmBase.RunSprUser.FieldByName('PODP2').IsNull and dmBase.RunSprUser.FieldByName('PODP2').AsBoolean then begin
            Result:=2;
            getDolg_and_FIO(dmBase.RunSprUser.FieldByName('DOLG_PODP2').AsString);
            arrPodpisDolg[2]:=sDolg;
            arrPodpisFIO[2]:=sFIO;
          end;
          if not dmBase.RunSprUser.FieldByName('PODP3').IsNull and dmBase.RunSprUser.FieldByName('PODP3').AsBoolean then begin
            Result:=3;
            getDolg_and_FIO(dmBase.RunSprUser.FieldByName('DOLG_PODP3').AsString);
            arrPodpisDolg[3]:=sDolg;
            arrPodpisFIO[3]:=sFIO;
          end;
          lDolgAllList:=dmBase.RunSprUser.FieldByName('DOLG_ALL_LIST').AsBoolean;
        end;
      end;
                                        
      if not lOk then begin
        Result:=1;
        getDolg_and_FIO(dmBase.RunSpr.FieldByName('DOLG_PODP1').AsString);
        arrPodpisDolg[1]:=sDolg;
        arrPodpisFIO[1]:=sFIO;
        if not dmBase.RunSpr.FieldByName('PODP2').IsNull and dmBase.RunSpr.FieldByName('PODP2').AsBoolean then begin
          Result:=2;
          getDolg_and_FIO(dmBase.RunSpr.FieldByName('DOLG_PODP2').AsString);
          arrPodpisDolg[2]:=sDolg;
          arrPodpisFIO[2]:=sFIO;
        end;
        if not dmBase.RunSpr.FieldByName('PODP3').IsNull and dmBase.RunSpr.FieldByName('PODP3').AsBoolean then begin
          Result:=3;
          getDolg_and_FIO(dmBase.RunSpr.FieldByName('DOLG_PODP3').AsString);
          arrPodpisDolg[3]:=sDolg;
          arrPodpisFIO[3]:=sFIO;
        end;
        lDolgAllList:=false; //dmBase.RunSprUser.FieldByName('DOLG_ALL_LIST').AsBoolean;
      end;

    end;
//  end;
end;

function Podpis_Dolg(n:Integer):String;
begin result:=arrPodpisDolg[n]; end;

function Podpis_FIO(n:Integer):String;
begin result:=arrPodpisFIO[n]; end;

function Podpis_Perenos:Boolean;
begin result:=lDolgAllList; end;

function Podpis_Shtamp:Integer;
begin result:=PodpisShtamp; end;
//--------------------------------------------------------
function ReadSprDolg(sl1,sl2:TStringList; lAll:Boolean):Boolean;
var
//  nID : Integer;
//  List : TStringList;
  Opis:TOpisEdit;
begin
  Result:=false;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_PERSONAL');
  if Opis<>nil then begin
    Result:=true;
    Opis.DataSet.First;
    while not Opis.DataSet.Eof do begin
      if lAll or Opis.DataSet.FieldByName('IS_SPEC').AsBoolean then begin
         sl2.Add(Opis.DataSet.FieldByName('ID').AsString);
         sl1.Add(Opis.DataSet.FieldByName('FIO').AsString+' - '+Opis.DataSet.FieldByName('POST').AsString);
      end;
      Opis.DataSet.Next;
    end;
    if sl1.Count=0 then Result:=false;
  end;
end;
//--------------------------------------------------------
function getDolgAndFIOFromSpr(sID:String; var sDolg:String; var sFIO:String):Boolean;
var
  lCheckFull:Boolean;
begin
  if sFIO='+'   // проверять наличие полного фио
    then lCheckFull:=true
    else lCheckFull:=false;
  sFIO:='';
  if sID='' then begin
    Result:=false;
    sDolg:='';
  end else begin
    if dmBase.SprDocOfficial.Locate('ID', sID, []) then begin
      Result:=true;
      sDolg:=dmBase.SprDocOfficial.FieldByName('POST').AsString;
      if lCheckFull
        then sFIO:=Trim(dmBase.SprDocOfficial.FieldByName('FIOF').AsString);
      if sFIO=''
        then sFIO:=dmBase.SprDocOfficial.FieldByName('FIO').AsString;
    end else begin
      Result:=false;
      sDolg:='';
      sFIO:='';
    end;
  end;
end;

//--------------------------------------------------------
function PolFrom(strName,strOtch:String):String;
begin
  Result:='';
  if strOtch<>'' then begin
    if (RightStr(strOtch,1)='А') or (RightStr(strOtch,1)='а')
      then Result:='Ж';
    if (RightStr(strOtch,1)='Ч') or (RightStr(strOtch,1)='ч')
      then Result:='М';
  end;
  if (Result='') and (strName<>'')
    then Result:=PolFromName(strName);
end;

//--------------------------------------------------------
function PolFromName(strName:String):String;
var
  Pol:TPol;
begin
  Result:='';
  if Trim(strName)<>'' then begin
    Pol:=tpNone;
    dmBase.CheckNameBel(Pol,strName,'');
    if Pol=tpM then begin
      Result:='М';
    end else if Pol=tpG then begin
      Result:='Ж';
    end;
  end;
end;
//-----------------------------------------------------------------
procedure SetOptionsGrid(g:TDbGridEh; f:TForm; lGurnal:Boolean);
var
 s:String;
begin
 if lGurnal then begin
   s:=GlobalTask.ParamAsString('GRID_GURN');
   if s=''
     then s:=GlobalTask.ParamAsString('GRID');
 end else begin
   s:=GlobalTask.ParamAsString('GRID');
 end;
 if s='' then s:='1';
 if s='2' then begin
   g.Flat := true;
   g.OptionsEh:=g.OptionsEh-[dghFixed3D];
 end else if s='3' then begin
   g.Flat := false;
   g.OptionsEh:=g.OptionsEh-[dghFixed3D];
 end else begin  // default
   g.Flat := true;
   g.OptionsEh:=g.OptionsEh+[dghFixed3D];
 end;

 if lGurnal then begin
   if GlobalTask.ParamAsInteger('FONT_SIZE_GURN')>0 then begin
     g.Font.Size:=GlobalTask.ParamAsInteger('FONT_SIZE_GURN');
   end;
   if GlobalTask.ParamAsString('FONT_NAME_GURN')<>'' then begin
     g.Font.Name:=GlobalTask.ParamAsString('FONT_NAME_GURN');
   end;
 end else begin
   if GlobalFontSizeG>8 then begin
     g.Font.Size:=GlobalFontSizeG;
   end;
   if GlobalFontNameG<>'' then begin
     g.Font.Name:=GlobalFontNameG;
   end;
 end;

end;

//-------------------------------------------------------------------
function GetWordRAION(strName:String; strLang:String):String;
var
  lKrat:Boolean;
const
  sss='ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮЁ';
begin
  strLang:=Trim(strLang);
  if Trim(strName)='' then begin
    Result:='';
  end else begin
    if Copy(strName,1,1)=' ' then begin  // для случая когда название района явл-ся продолжением области "Ханты-мансийский автономный округ-Югра"
      Result:='';
    end else begin
      if (strLang<>'') and (Pos('.',strLang)>0) then begin
        lKrat:=true;
        strLang:=StringReplace(strLang,'.','',[rfReplaceAll])
      end else begin
        lKrat:=false;
      end;
      if lKrat then begin
        // если последняя буква маленькая в названии района
        if LastSimIsLower(strName,true) then begin
          Result:=' р-н';
        end else begin
          Result:=' Р-Н';
        end;
      end else begin
        // если последняя буква маленькая в названии района
        if LastSimIsLower(strName,true) then begin
          if (strLang='Б') or (strLang='B') then begin
            Result:=' раён';
          end else begin
            Result:=' район';
          end;
        end else begin
          if (strLang='Б') or (strLang='B') then begin
            Result:=' РАЁН';
          end else begin
            Result:=' РАЙОН';
          end;
        end;
      end;
      if (Result<>'') and (strLang<>'') and (Pos(',',strLang)>0) then begin
        Result:=Result+', ';
      end;
    end;
  end;
end;

//-------------------------------------------------------------------
// последний символ в нижнем регистре
function LastSimIsLower(strName:String; lFirstWord:Boolean):Boolean;
const
  sss='ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮЁQWERTYUIOPASDFGHJKLZXCVBNM';
var
  n:Integer;
begin
  if Trim(strName)='' then begin
    Result:=true;
  end else begin
    n:=Pos(' ',strName);
    if (n=0) or not lFirstWord then begin
      if Pos(RightStr(strName,1),sss)=0
        then Result:=true
        else Result:=false;
    end else begin
      if Pos(RightStr(Copy(strName,1,n-1),1),sss)=0
        then Result:=true
        else Result:=false;
    end;
  end;
end;
//-----------------------------------------------------------------------------------
procedure CheckSystemAdmin;
begin
  if not Role.SystemAdmin then begin
    fmMain.acDesignReport.Visible:=false;
    fmMain.acDesignReport3.Visible:=false;
    fmMain.TBSubmenuAdmin.Visible:=false;
  end;
end;

//-----------------------------------------------------------------------------------
function RunTemplate_(strName : String; strPath : String; lShow:Boolean) : Boolean;
var
  i,nIndex:integer;
  s,ss,sFunc,sOldPath:String;
  Template:TTemplate;
  v:Variant;
  lOldShow, lRun:Boolean;
begin
  Result:=false;
  nIndex:=-1;
  ss:=UpperCase(strName);
  sOldPath:=fmMain.TemplateInterface.OutputDir;
  lOldShow:=fmMain.TemplateInterface.ShowResult;
  if strPath<>''
    then fmMain.TemplateInterface.OutputDir:=CheckSleshN(strPath);
  fmMain.TemplateInterface.ShowResult:=lShow;
  for i:=0 to fmMain.TemplateInterface.Engine.TemplateList.Count-1 do begin
    s:=ANSIUpperCase(fmMain.TemplateInterface.Engine.TemplateList[i].FullName);
    if ss=s then begin
      nIndex:=i;
    end;
  end;
  if nIndex>-1 then begin
    Result:=true;
    Template:=fmMain.TemplateInterface.Engine.TemplateList[nIndex];
    sFunc:=Template.ScriptName+'_UserForm';
    v:=true;
    RunFuncScript(sFunc,[],v,lRun);
    if (v=true) then begin
      fmMain.TemplateInterface.SetParams(fmMain.DateFiks,0,0);
      fmMain.TemplateInterface.SetSimpleTemplate(Template.FullName);
    end;
  end;
  if strPath<>''
    then fmMain.TemplateInterface.OutputDir:=sOldPath;
  fmMain.TemplateInterface.ShowResult:=lOldShow;
end;
//-----------------------------------------------------------------------------------
function RunTemplate( strName : String ) : Boolean;
begin
  Result:=RunTemplate_(strName, '', true);
end;
//-----------------------------------------------------------------------------------
function RunTemplate2( strName:String; strPath:String; lShow:Boolean ) : Boolean;
begin
  Result:=RunTemplate_(strName, strPath, lShow);
end;

//---------------------------------------------------------------
function FindNodeXML(x:TXMLNode; strFind:String):TXMLNode;
var
  n,m:Integer;
  xx,xxx:TXMLNode;
begin
  Result:=nil;
  for n:=0 to x.NodeCount-1 do begin
    xx:=x.Nodes[n];
    if Pos(strFind,LowerCase(Utf8ToAnsi(xx.Name))) >0 then begin
      Result:=xx;
    end else begin
      for m:=0 to xx.NodeCount-1 do begin
        xxx:=xx.Nodes[m];
        if Pos(strFind,LowerCase(Utf8ToAnsi(xxx.name))) >0 then begin
          Result:=xxx;
          break;
        end else begin
          xxx:=FindNodeXML(xx.Nodes[m],strFind);
          if xxx<>nil then begin
            Result:=xxx;
            break;
          end;
        end;
      end;
    end;
    if Result<>nil then break;
  end;
end;

//--------------------------------------------------------------------------
function SprChName_EmptyIzm: String;
begin
  Result:='Изменения, исправления, дополнения в запись акта о перемене фамилии, собственного имени, отчества не вносились';
end;
//--------------------------------------------------------------------------
function SprRogd_EmptyIzm: String;
begin
  Result:='Изменения, исправления, дополнения в запись акта о рождении не вносились';
end;
//--------------------------------------------------------------------------
function SprBrak_EmptyIzm: String;
begin
  Result:='Изменения, исправления, дополнения в запись акта о заключении брака не вносились';
end;
//--------------------------------------------------------------------------
function SprSmert_EmptyIzm: String;
begin
  Result:='Изменения, исправления, дополнения в запись акта о смерти не вносились';
end;
//--------------------------------------------------------------------------
function SprRast_EmptyIzm: String;
begin
  Result:='Изменения, исправления, дополнения в запись акта о расторжении брака не вносились';
end;

//--------------------------------------------------------------------------
procedure ShowXMLError(strFile:String);
var
  dsErr:TDataSet;
  i,j:Integer;
  XMLDoc:TNativeXML;
  s1,s2,s3,ss:String;
  XMLNode,XMLNodeErr,nd:TXMLNode;
  f : TfmShowErrorGISUN;
begin
  dsErr := dbCreateMemTable('ERROR_CODE,Char,10;ERROR_TEXT,Char,250;ERROR_PLACE,Char,250;WRONG_VALUE,Char,250;'+
                            'CORRECT_VALUE,Char,250;CHECK_NAME,Char,250;DESCRIPTION,Char,500;IDENTIF,Char,50','');
  dsErr.Open;
  XMLDoc:=TNativeXML.Create;
  XMLDoc.LoadFromFile(strFile);
  //XMLDoc.ReadFromString(AnsiToUtf8(strFaultDetail));

  XMLNode:=FindNodeXML(XMLDoc.Root,'error_list');

  if XMLNode<>nil then begin
    for i:=0 to XMLNode.NodeCount-1 do begin
      XMLNodeErr:=XMLNode.Nodes[i];
      s1:=Utf8ToAnsi(XMLNodeErr.Name);   //  типа: 'ns2:error'
      j:=Pos(':error',s1);
      ss:=Copy(s1,1,j);  // типа 'ns2:'
      //------------------
      try
        s1:=Utf8ToAnsi(XMLNodeErr.FindNode(AnsiToUtf8('code')).ValueAsString);
      except
        nd:=FindNodeXML(XMLNodeErr,':code');
        if nd<>nil then begin
          s1:=Utf8ToANSI(nd.ValueAsString);
        end else begin
          s1:='';
        end;
      end;
      //------------------
      try
        s2:=Utf8ToANSI(XMLNodeErr.FindNode(AnsiToUtf8('lexema')).FindNode('value').ValueAsString);
      except
        nd:=FindNodeXML(XMLNodeErr,':lexema');
        if nd<>nil then begin
          nd:=FindNodeXML(nd,':value');
          if nd<>nil then begin
            s2:=Utf8ToANSI(nd.ValueAsString);
          end else begin
            s2:='ОШИБКА';
          end;
        end else begin
          s2:='ОШИБКА';
        end;
      end;
      //------------------
      try
        s3:=Utf8ToANSI(XMLNodeErr.FindNode(AnsiToUtf8('wrong_value')).ValueAsString);
      except
        nd:=FindNodeXML(XMLNodeErr,':wrong_value');
        if nd<>nil then begin
          s3:=Utf8ToANSI(nd.ValueAsString);
        end else begin
          s3:='';
        end;
      end;

      dsErr.AppendRecord([s1,s2,'',s3,'','']);
      {
      'ERROR_CODE',    Integer(ftString),    10,  //Тип ошибки
      'ERROR_TEXT',    Integer(ftString),   250,  //Текст ошибки
      'ERROR_PLACE',   Integer(ftString),   250,  //Место возникновения ошибки
      'WRONG_VALUE',   Integer(ftString),   250,  //Неправильное значение
      'CORRECT_VALUE', Integer(ftString),   250,  //Правильное значение
      'CHECK_NAME',    Integer(ftString),   250   //Название проверяемого элемента
      'DESCRIPTION',   Integer(ftString),   500,
      'IDENTIF',       Integer(ftString),   50
      }
    end;
  end else begin
    dsErr.AppendRecord(['--','Неизвестная ошибка','','','','']);
  end;
  XMLDoc.Free;
  f := TfmShowErrorGISUN.Create(nil);
  try
    f.DataSource.DataSet:=dsErr;
    f.ShowModal;
  finally
    f.Free;
  end;
  dbClose(dsErr);
end;

//--------------------------------------------------------------------------------
function XOREncrypt(Text,Key: string):string;
var
  i: integer;   // Счетчик
  LKey: string; // Длинный ключ
  Word: char;   // Шифрованная буква
begin
  // В цикле добиваем наш ключ, до размеров сообщения для шифрования
  for i := 0 to (Length(Text) div length(Key))  do
    LKey := LKey + Key;
  //Каждую букву из сообщения XOR'им с буквой из длинного ключа.
  for i := 1 to length(Text) do begin
    Word := chr((ord(Text[i]) XOR ord(LKey[i])));
    Result := Result + Word;
  end;
end;

//--------------------------------------------------------------------------------
function GetControlColor:TColor;
begin
//  Result:=$00F0F0F0;  // серый
//  Result:=$00FAF0E7;  // голубой
  Result:=clWindow;
end;

//--------------------------------------------------------------------------------
function GetNotActualColor:TColor;
begin
//  Result:=$00F0F0F0;  // серый
  Result:=$00FED9AF
//  Result:=$00FAF0E7;  // голубой
//  Result:=clWindow;
end;

//--------------------------------------------------------------------------------
function GetNoTransferColor:TColor;
begin
  Result:=$00CFFECD;
end;

//--------------------------------------------------------------------------------
function GetDisableColor:TColor;
begin
 {$IFDEF ZAH}
   Result:=$00F0F0F0;  // серый
 {$ELSE}
   Result:=clInfoBk;
 {$ENDIF}
end;

//--------------------------------------------------------------------------------
function GetDisableColorGIS:TColor;
begin
//    Result:=$00F0F0F0;  // серый
   Result:=clInfoBk;
//  Result:=clInactiveCaption;
end;
//--------------------------------------------------------------------------------
function GetColorProp(Sender:TObject):TColor;
var
  PropInfo : PPropInfo;
begin
  PropInfo := GetPropInfo(Sender.ClassInfo, 'Color');
  if PropInfo = nil then begin
    Result:=0;
  end else begin
    Result:=TColor(GetOrdProp(Sender, PropInfo));
  end;
end;
//--------------------------------------------------------------------------------
procedure SetColorControls(arrControls: array of TVarRec; c : TColor);
var
  i : Integer;
  wc:TWinControl;
begin
  for i:=Low(arrControls) to High(arrControls) do begin
    with arrControls[i] do begin
      wc:=TWinControl(VObject);
      SetPropertyObject(wc, 'Color', c);
    end;
  end;
end;
//--------------------------------------------------------------------------------
// SetFontSize   FONT_SIZE
//
procedure SetFlatEhComp(Form:TForm; lFlat : Boolean; nCharCase:Integer; lCheckSVID:Boolean);
var
  i : Integer;
  {$IFNDEF TEST_GISUN}
//  ed : TDbEditEh;
  {$ENDIF}
  fn : TFont;
//  colEdit:TColor;
  lFontBold:Boolean;
  ed:TDbEditEh;
  s:String;
//  n:Integer;
begin
//  n:=GetTickCount;
  lFontBold:=GlobalTask.ParamAsBoolean('FONT_BOLD');
  for i:=0 to Form.ComponentCount-1 do begin
//    fn := GetFont(Components[i],'Font');
//    if fn=nil then begin
//      ShowMessage(Components[i].ClassName);
//    end;
    if (Form.Components[i] is TCustomDbEditEh) or (Form.Components[i] is TDbCheckBoxEh) then begin
      if TCustomDbEditEh(Form.Components[i]).Flat<>lFlat
        then TCustomDbEditEh(Form.Components[i]).Flat:=lFlat;
      s:=ANSIUppercase(Form.Components[i].Name);
//      TWinControl(Form.Components[i]).DragCursor:=crNo;
      if (s='CBBELORUS') or (Copy(s,1,4)='N_F_') or (s='CBPROVDVIG') or
         (lCheckSVID and (RightStr(s,3)='_SV')) then begin
        if (RightStr(s,3)='_SV') and (GlobalFontNameE<>'') then begin
          fn := GetFont(Form.Components[i],'Font');
          if (fn.Name<>GlobalFontNameE)
            then fn.Name:=GlobalFontNameE;
        end;
      end else begin

        fn := GetFont(Form.Components[i],'Font');
        if fn.Size<>GlobalFontSizeE
          then fn.Size:=GlobalFontSizeE;
        if (GlobalFontNameE<>'') and  (fn.Name<>GlobalFontNameE)
          then fn.Name:=GlobalFontNameE;

        //---!!!---------------------------------------------------------
        if lFontBold
          then fn.Style:=[fsBold];

        //---!!!----------------------------------------------------------
        {  менять цвет только для элементов без измененного цвета !!!
        colEdit:=GetControlColor;  //$00EBECE8;
        if (Form.Components[i] is TCustomDbEditEh) then begin
          SetPropertyObject( Form.Components[i], 'Color', colEdit);
        end;
        }
        //-------------------------------------------------------------

      end;
      if (nCharCase>-1) and (Form.Components[i] is TDbEditEh) then begin
        ed:=TDbEditEh(Form.Components[i]);
        // TEditCharCase = (ecNormal, ecUpperCase, ecLowerCase);
        ed.CharCase:=TEditCharCase(nCharCase);
      end;
    end else if (Form.Components[i] is TDbMemo) then begin     // !!! TDBMEVO  !!!
      with TDbMemo(Form.Components[i]) do begin
//        CharCase:=TEditCharCase(nCharCase);
        if Font.Size<>GlobalFontSizeE
          then Font.Size:=GlobalFontSizeE;
        if (GlobalFontNameE<>'') and  (Font.Name<>GlobalFontNameE)
          then Font.Name:=GlobalFontNameE;

        //---!!!---------------------------------------------------------
        if lFontBold
          then Font.Style:=[fsBold];
      end;
    end else if (Form.Components[i] is TDbGridEh) then begin
      SetOptionsGrid(TDbGridEh(Form.Components[i]),Form,false);
//      if TDbGridEh(Components[i]).ReadOnly=true then begin
//        s:=s+TCustomDbEditEh(Components[i]).Name+',';
//      end;
    end;
    {$IFNDEF TEST_GISUN}
    {
    if Form.Components[i] is TDbEditEh then begin
      ed:=TDbEditEh(Form.Components[i]);
      if (Pos('IDENTIF',ed.DataField)>0) or (Pos('IDENTIF',UpperCase(ed.Name))>0) then begin
        ed.MRUList.Items.Clear;
      end;
    end;
    }
    {$ENDIF}
  end;
//  ShowMessage(IntToStr(GetTickCount-n));
//if s<>'' then showmessage(s);

//    SetPropertyObject( Components[i], 'Flat', lFlat);
end;

//-------------------------------------------------------------------
function AddFilter_FAMILIA_NAME(strFilter,strFamilia:String):String;
var
  s:String;
  n:Integer;
begin
  if (Trim(strFamilia) <> '') then begin
    s:=Trim(strFamilia);
//    nLen:=Length(s);
    n:=Pos(' ',s);
    if n>0 then begin
      s := 'FAMILIA='+QStr(Copy(s,1,n-1)+'*')+
                      'and NAME='+QStr(Copy(s,n+1,20)+'*');
    end else begin
      s := 'FAMILIA='+QStr(s+'*');
    end;
    if strFilter=''
      then Result:=s
      else Result:=strFilter+' and '+s;
  end else begin
    Result:=strFilter;
  end;
end;

//-------------------------------------------------
function GetEditMaskIN(lPB:Boolean):String;
begin
//  Result:='AAAAAAAAAAAAAA';
  Result:='aaaaaaaaaaaaaa';
end;

function EM_NomerIdentif(lPB:Boolean):String;
begin
  REsult:=GetEditMaskIN(lPB);
end;

//----------------------------------------------------------------------
// по типу документа требуется ИН или нет
function IsRequireIN(n:Integer):Boolean;
begin
  if (n=PASP_GR_RB) or (n=VIDG_GR_NO) or (n=VIDG_GR_IN) or (n=0)
    then Result:=true
    else Result:=false;
end;

//-----------------------------------------------------------------------
// требуется личный номер
function IsLichNomer(sTypeDok:String; sGrag:String):Boolean;
var
  nTypeDok:Integer;
begin
  Result:=false;
  if sTypeDok='' then sTypeDok:='0';
  try
    nTypeDok:=StrToInt(sTypeDok);
  except
    nTypeDok:=0;
  end;
  if (sGrag=MY_GRAG_STR) or (nTypeDok=PASP_GR_RB) or (nTypeDok=VIDG_GR_NO) or (nTypeDok=VIDG_GR_IN) then begin
    Result:=true;
  end;
end;

//-----------------------------------------------------------------------
// контроль соответствия гражданства и типа документа
function Grag_Dok(sGrag:String; sTypeDok:String; var sErr:String):Boolean;
var
  nTypeDok:Integer;
begin
  Result:=true;
  if sTypeDok='' then sTypeDok:='0';
  nTypeDok:=StrToIntDef(sTypeDok,0);
  if (sGrag='') or (sGrag='0') then begin
    if (nTypeDok=PASP_GR_RB) then begin
      sErr:='"пустое гражданство"  ->  '+'"'+GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_UDOST').Naim(nTypeDok,false)+'"';
      Result:=false;
    end;
  end else if (sGrag=MY_GRAG_STR) then begin
    if (nTypeDok=VIDG_GR_NO) or (nTypeDok=VIDG_GR_IN) or (nTypeDok=UDOS_BEG) or (nTypeDok=PASP_IN) then begin
      sErr:='"гражданство '+getGrag(sGrag, false, false)+'"  ->  '+'"'+GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_UDOST').Naim(nTypeDok,false)+'"';
      Result:=false;
    end;
  end else begin // иностранный гражданин
    if (nTypeDok=PASP_GR_RB) then begin
      sErr:='"гражданство '+getGrag(sGrag, false, false)+'"  ->  '+'"'+GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_UDOST').Naim(nTypeDok,false)+'"';
      Result:=false;
    end;
  end;
end;

//-----------------------------------------------------------------------
// изменить гражданство исходя из типа документа
// если изменено, то функция возвратит "true"
function SetGragFromTypeDok(sGrag:String; sTypeDok:String; var sNewGrag:String):Boolean;
var
  nTypeDok:Integer;
begin
  Result:=false;
  sNewGrag:='';
  if sTypeDok='' then sTypeDok:='0';
  try
    nTypeDok:=StrToInt(sTypeDok);
  except
    nTypeDok:=0;
  end;
  if (nTypeDok=NOT_DOK) or (nTypeDok=0) then begin  // документ не представлен
    sNewGrag:='';
    Result:=true;
  end else if (nTypeDok=PASP_GR_RB) or (nTypeDok=SVID_ROG) then begin
    if sGrag<>MY_GRAG_STR then begin
      sNewGrag:=MY_GRAG_STR;
      Result:=true;
    end;
  end else if (nTypeDok=VIDG_GR_NO) then begin
    if sGrag<>NOT_GRAG_STR then begin
      sNewGrag:=NOT_GRAG_STR;
      Result:=true;
    end;
  end else if (nTypeDok=VIDG_GR_IN) or (nTypeDok=PASP_IN)  or (nTypeDok=UDOS_BEG)then begin
    if sGrag=MY_GRAG_STR then begin
      sNewGrag:=SVED_GRAG_STR;   // сведения не представлены
      Result:=true;
    end;
  end;
end;

//--------------------------------------------------------------------------
function CheckCharFIO(var s:String):Boolean;
const
  sEng : String = 'ABCEHKMOPTXabcehkmoptxiI';
  sRus : String = 'АВСЕНКМОРТХавсенкмортхіІ';   // последние 2 символа на белорусском
var
  i,j  : Integer;
begin
  Result:=false;
  for i:=1 to Length(s) do begin
    j:=Pos( s[i], sEng);
    if j>0 then begin
      s[i]:=sRus[j];
      Result:=true;
    end;
  end;
//  Q_KeepChars(s,'ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ');  оставить
  Q_DelChars(s,'0123456789_()*&~@|\?><');                 // удалить
end;

//--------------------------------------------------------------------------
function getGrag(sGrag:String; IsEmptyToDef:Boolean; lObozn:Boolean): String;
var
  n:Integer;
begin
  if (sGrag='') or (sGrag='0') then begin
    if IsEmptyToDef
      then n:=MY_GRAG
      else n:=0;
  end else begin
    n:=StrToInt(sGrag);
  end;
  if n>0 then begin
    if dmBase.SprGragd.Locate('ID',n,[]) then begin
      if lObozn then begin
        Result:=dmBase.SprGragd.FieldByName('OBOZN').AsString;
        if Result=''
          then Result:=dmBase.SprGragd.FieldByName('GNAME').AsString;
      end else begin
        Result:=dmBase.SprGragd.FieldByName('GNAME').AsString;
      end;
    end;
  end else begin
    Result:='';
  end;
end;

//--------------------------------------------------------------------
function GetPadegWords( strWords : String; Padeg : String) : String;
var
  arr : TArrStrings;
  i : Integer;
begin
  Result:='';
  StrToArr(Trim(strWords), arr, ' ', true);
  for i:=Low(arr) to High(arr) do begin
    Result := Result + GetPadegWord( arr[i], Padeg) + ' ';
  end;
  Result := Trim(Result);
end;

//--------------------------------------------------------------------
function GetPadegWord( strWord : String; Padeg : String) : String;
var
  j : Integer;
  okon, osnova, sUP, sBegin : String;
  lLastUpper:Boolean;
const
  sog = 'ЦКНГШЩЗХЪФВПРЛДЖЧСМТБ';
begin
  if (Padeg='') then begin
    Result := strWord;
    exit;
  end;
  //------ если в слове последняя точка то не склоняется
  if Right(strWord,1)='.' then begin
    Result := strWord;
    exit;
  end;
  //------ если длина слова 1 или последняя цифра
  if (Length(strWord)=1) or IsAllDigit(RightStr(strWord,1)) then begin
    Result:=strWord;
    exit;
  end;
  // если есть точка и она не последняя, то что до точки не склоняется
  j:=Pos('.',strWord);
  sBegin:='';
  if j>0 then begin
    sBegin:=Copy(strWord,1,j);
    strWord:=Copy(strWord,j+1,Length(strWord));
  end;

  if dmBase.SprSklon.FindKey([strWord]) then begin
    if dmBase.SprSklon.FieldByName('PADEG').AsBoolean then begin
      if (Padeg = 'И') or (Padeg = 'В') or (Padeg = '') then begin
        Result := strWord;
      end else if (Padeg = 'Р') then begin  // чего
        Result := dmBase.SprSklon.FieldByName('PADEG_R').AsString;
      end else if (Padeg = 'Т') then begin  // чем
        Result := dmBase.SprSklon.FieldByName('PADEG_T').AsString;
      end else if (Padeg = 'Д') then begin  // чему
        Result := dmBase.SprSklon.FieldByName('PADEG_D').AsString;
      end else if (Padeg = 'П') then begin  // где, в чём, в ком
        Result := dmBase.SprSklon.FieldByName('PADEG_P').AsString;
      end;
    end else begin  // слово не склоняется
      Result := strWord;
    end;
    if sBegin<>'' then Result:=sBegin+Result;
    exit;
  end;
  if ANSIUpperCase(Right(strWord,3))='ОГО' then begin  // кобринскОГО  слонимскОГО
    Result := strWord;
    if sBegin<>'' then Result:=sBegin+Result;
    exit;
  end;
  okon := '';
  lLastUpper:= not LastSimIsLower(strWord,false);
  sUP:=ANSIUpperCase(strWord);
  for j:=Length(strWord) downto 1 do begin
    if Pos(sUP[j],sog) > 0 then begin
      okon   := Copy(sUP,j+1,100);
      osnova := Copy(strWord,1,j);
      break;
    end;
  end;
  if (Padeg = 'И') or (Padeg = 'В') or (Padeg = '') then begin
    Result := strWord;
  end else if (Padeg = 'Р') then begin  // чего
    if okon = '' then begin
      Result := strWord + 'а'
    end else if okon='А' then begin
      if RightStr(sUP,2)='КА'   // украинка
         then Result := osnova + 'и'   // украинки
         else Result := osnova + 'ы'
    end else if okon='Ь' then begin
      Result := osnova + 'и'
    end else if (okon='ИЙ') or (okon='ЫЙ') or (okon='ОЕ') then begin
      Result := osnova + 'ого'
    end else if (okon='ОЙ') then begin
      Result := osnova + 'ого'
    end else if okon='АЙ' then begin  // край
      Result := osnova + 'ая'
    end else if okon='АЯ' then begin
      Result := osnova + 'ой'
    end else begin
      Result := strWord
    end;
  end else if (Padeg = 'Д') then begin  // чему
    if okon = '' then begin
      Result := strWord + 'у'
    end else if okon='А' then begin
      Result := osnova + 'е'
    end else if okon='ЕЙ' then begin
      Result := osnova + 'ею'
    end else if okon='Ь' then begin
      Result := osnova + 'и'
    end else if (okon='ИЙ') or (okon='ЫЙ') or (okon='ОЕ') then begin
      Result := osnova + 'ому'
    end else if okon='ОЙ' then begin
      Result := osnova + 'ому'
    end else if okon='АЙ' then begin
      Result := osnova + 'аю'
    end else if okon='АЯ' then begin
      Result := osnova + 'ой'
    end else begin
      Result := strWord;
    end;
  end else if (Padeg = 'Т') then begin  // чем
    if okon = '' then begin
      Result := strWord + 'ом'
    end else if okon='А' then begin
      Result := osnova + 'ой'
    end else if okon='Ь' then begin
      Result := osnova + 'ю'
    end else if (okon='ИЙ') or (okon='ОЕ') then begin
      Result := osnova + 'им'
    end else if (okon='ЫЙ') then begin
      Result := osnova + 'ым'
    end else if (okon='ОЙ') then begin
      Result := osnova + 'им'
    end else if okon='АЙ' then begin
      Result := osnova + 'ем'
    end else if okon='АЯ' then begin
      Result := osnova + 'ой'
    end else begin
      Result := strWord;
    end;
  end else if (Padeg = 'П') then begin  // в чём, где
    if okon = '' then begin     // отдел -> отделе
      Result := strWord + 'е'
    end else if okon='А' then begin
      Result := osnova + 'ой'
    end else if okon='Ь' then begin
      Result := osnova + 'и'
    end else if (okon='ИЙ') or (okon='ОЕ') then begin
      Result := osnova + 'ом'
    end else if (okon='ЫЙ') then begin
      Result := osnova + 'ым'
    end else if (okon='ОЙ') then begin
      Result := osnova + 'ом'
    end else begin
      Result := strWord;
//    end else if okon='АЙ' then begin
//      Result := osnova + 'ем'
//    end else if okon='АЯ' then begin
//      Result := osnova + 'ой'
    end;
  end else begin
    Result := strWord;
  end;
  if Result = '' then begin
    Result := strWord;
  end else begin
    if lLastUpper  // если последний символ в верхнем регистре
      then Result:=ANSIUppercase(Result);
  end;
  if sBegin<>'' then Result:=sBegin+Result;
end;

function getLenSoato:Integer;
begin
  Result:=10;
end;

//-----------------------------------------------------------------------
function EM_NomerSvid:String;
begin
  Result:=StringOfChar('9',SVID_LEN)+';0;_'
//  Result:='9999999;1;_';
end;

//-----------------------------------------------------------------------
function ChoiceSpecID_(cont:TWinControl):Integer;
var
  i : Integer;
  List : TStringList;
  Opis:TOpisEdit;
  s:String;
begin
  Result:=0;     
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_PERSONAL');
  if Opis<>nil then begin
    List := TStringList.Create;
    Opis.DataSet.First;
    while not Opis.DataSet.Eof do begin
      if Opis.DataSet.FieldByName('IS_ACTUAL').AsBoolean then begin
//      if Opis.DataSet.FieldByName('IS_SPEC').AsBoolean then begin
         if Opis.DataSet.FieldByName('FIO'+s).AsString<>''
           then  List.AddObject(Opis.DataSet.FieldByName('FIO'+s).AsString+' - '+Opis.DataSet.FieldByName('POST'+s).AsString,
                                Pointer(Opis.DataSet.FieldByName('ID').AsInteger) );
      end;
      Opis.DataSet.Next;
    end;
    if List.Count=0 then begin
      PutError('В справочнике должностных лиц не найдено ни одного специалиста.');
    end else begin
      i := ChoiceFromList(List,'Выберите специалиста', cont);
      if (i>-1)  then begin
        Result:=Integer(List.Objects[i]);
      end;
    end;
    FreeAndNil(List);
  end;
end;
//-----------------------------------------------------------------------
function ChoiceSpecID(cont:TWinControl):Integer;
begin
  Result:=ChoiceSpecID_(cont);
end;

//-----------------------------------------------------------------------
function ChoiceSpec_(var sDolg,sDolg_B,sFIO,sFIO_B:String; cont:TWinControl; x,y:Integer; lBel:Boolean):Boolean;
var
  i,nID : Integer;
  List : TStringList;
  Opis:TOpisEdit;
  s:String;
begin
  Result:=false;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_PERSONAL');
  if Opis<>nil then begin
    List := TStringList.Create;
    Opis.DataSet.First;
    if lBel then s:='_B' else s:='';
    while not Opis.DataSet.Eof do begin
      if Opis.DataSet.FieldByName('IS_ACTUAL').AsBoolean then begin
//      if Opis.DataSet.FieldByName('IS_SPEC').AsBoolean then begin
         if Opis.DataSet.FieldByName('FIO'+s).AsString<>''
           then  List.AddObject(Opis.DataSet.FieldByName('FIO'+s).AsString+' - '+Opis.DataSet.FieldByName('POST'+s).AsString,
                                Pointer(Opis.DataSet.FieldByName('ID').AsInteger) );
      end;
      Opis.DataSet.Next;
    end;
    if List.Count=0 then begin

      PutError('В справочнике должностных лиц не найдено ни одного человека.');
    end else begin
      // для общего случая надо использовать ClientToScreen
//      y:=Top+(Self.Height-Self.ClientHeight)+TBDock2.Top+TBDock2.Height+2;
//      x:=Left+(Self.Width-Self.ClientWidth)+TBToolWindowSpec.Left;
//      i := ChoiceFromList(List,'Выберите специалиста', x, y);
      if (cont=nil) and (x>0) and (y>0) then begin   //  считаем что в Tag находиться координата по X !!!
        i:=ChoiceFromListInPos(List,'Выберите должностное лицо', x, y);
      end else begin
        i:=ChoiceFromList(List,'Выберите должностное лицо', cont);
      end;
      if (i>-1)  then begin
        nID := Integer(List.Objects[i]);
        if Opis.DataSet.Locate('ID',nID,[]) then begin
          if sDolg_B='@' then begin  // ChoiceSpec_(sDolg,sTel(sDolg_B),sFIO,sTelM(sFIO_B),cont,false);
            sDolg:=Opis.DataSet.FieldByName('POST').AsString;
            sFIO:=Opis.DataSet.FieldByName('FIOF').AsString;
            if sFIO='' then sFIO:=Opis.DataSet.FieldByName('FIO').AsString;
            sFIO_B:=Opis.DataSet.FieldByName('TEL_MOB').AsString;
            sDolg_B:=Opis.DataSet.FieldByName('TELEFON').AsString;
          end else begin
            sFIO:=Opis.DataSet.FieldByName('FIO').AsString;
            if Opis.DataSet.FindField('FIO_B')<>nil
              then sFIO_B:=Opis.DataSet.FieldByName('FIO_B').AsString
              else sFIO_B:='';
            sDolg:=Opis.DataSet.FieldByName('POST').AsString;
            if Opis.DataSet.FindField('POST_B')<>nil
              then sDolg_B:=Opis.DataSet.FieldByName('POST_B').AsString
              else sDolg_B:='';
          end;
          Result:=true;
        end;
      end;
    end;
    FreeAndNil(List);
  end;
end;
function ChoiceSpec(var sDolg,sFIO,sFIO_B:String; cont:TWinControl):Boolean;
var
  sDolg_B:String;
begin
  Result:=ChoiceSpec_(sDolg,sDolg_B,sFIO,sFIO_B,cont,0,0,false);
end;
function ChoiceSpec2(var sDolg,sDolg_B,sFIO,sFIO_B:String; cont:TWinControl; lBel:Boolean):Boolean;
begin
  Result:=ChoiceSpec_(sDolg,sDolg_B,sFIO,sFIO_B,cont,0,0,lBel);
end;
function ChoiceSpec3(var sFIO,sDolg,sTel,sTelM:String; cont:TWinControl):Boolean;
begin
  sTel:='@';
  Result:=ChoiceSpec_(sDolg,sTel,sFIO,sTelM,cont,0,0,false);
end;
function ChoiceSpec4(var sDolg,sDolg_B,sFIO,sFIO_B:String; x,y:Integer; lBel:Boolean):Boolean;
begin
  Result:=ChoiceSpec_(sDolg,sDolg_B,sFIO,sFIO_B,nil,x,y,lBel);
end;


// nType=1 для области   sName-название области
// nType=2 для района    sName-название района
//---------------------------------------------------------------------------
function CheckIsClearATE(nType:Integer; sGorod:String; nTypeGorod:Integer; sName:String):Boolean;
var
  i:Integer;
  sl:TStringList;
begin
  Result:=false;
  // ищем только для города или г.п.
  if (nTypeGorod=1) or (nTypeGorod=4) then begin        // !!!    1-город   4-г.п.
    if nType=1
      then sl:=slCheckATEObl
      else sl:=slCheckATERn;

    sGorod:=ANSIUpperCase(Trim(sGorod));
    sName:=ANSIUpperCase(Trim(sName));
    for i:=0 to sl.Count-1 do begin
      if sl.Names[i]=sGorod then begin
        if sl.Values[sl.Names[i]]=sName then begin
          Result:=true;
        end;
        break;
      end;
    end;
  end;
end;
//---------------------------------------------------------------
procedure GetATECheck;
var
  Ini:TSasaIniFile;
  I:Integer;
begin
  if (slCheckATEObl.Count=0) and (slCheckATERn.Count=0) then begin
//    slCheckATEObl.Clear;
//    slCheckATERn.Clear;
    Ini:=TSasaIniFile.Create(GlobalTask.PathService+'Check_ATE.ini');
    Ini.ReadSectionValues('GOROD_OBL', slCheckATEObl);
    for i:=0 to slCheckATEObl.Count-1 do slCheckATEObl.Strings[i]:=Trim(slCheckATEObl.Strings[i]);
    Ini.ReadSectionValues('GOROD_RAION', slCheckATERn);
    for i:=0 to slCheckATERn.Count-1 do slCheckATERn.Strings[i]:=Trim(slCheckATERn.Strings[i]);
    Ini.Free;
  end;
end;

//-----------------------------------------------------------------------
function LoadDokumentFromFile(arrDS:array of TDataSet; sFile:String; var strErr:String; LoadFormat: TkbmCSVStreamFormat): Boolean;
var
  s,sRazd:String;
  i,j:Integer;
  arr : array of TVarRec;
//  arrD: array of Boolean;
  sl:TStringList;
begin
  strErr:='';
  Result:=true;

  SetLength(arr, 0);
  for i:=0 to Length(arrDS)-1 do begin
    SetLength(arr, Length(arr)+2);
    j:=Length(arr)-2;
    arr[j].VType  := vtANSIString;
    string(arr[j].VANSIString):=arrDS[i].Name; // Components[i].Name;
    arr[j+1].VType    := vtObject;
    arr[j+1].VObject  := arrDS[i]; //Components[i];
  end;

  if Pos('.SAV', ANSIUpperCase(sFile))>0  then begin
    try
      MemoRead(sFile,s);
    except
      strErr:='Ошибка чтения файла';
      Result:=false;
    end;
  end else begin
    Result:=false;
  end;
  if Result and (s='') then begin
    strErr:='Нет данных';
    Result:=false;
  end;
  if Result then begin
    i:=Pos('[CONFIG]',s);
    j:=Pos('END'+Chr(13)+Chr(10),s);
    if (i>0) and (j>0) then  begin
      sl:=TStringList.Create;
      sl.Text:=Copy(s,i+10,j-(i+10));
      i:=PosEx('[',s,j+5);
      if i>0 then begin
        s:=#13#10+Copy(s,i,Length(s));
      end else begin
        strErr:='Не обнаружены данные';
        Result:=false;
      end;
      sRazd:=sl.Values['RAZD'];
      sl.Free;
    end else begin
      strErr:='Не обнаружено описание документа';
      Result:=false;
    end;
  end;

  if Result then begin
//    Dokument.EmptyTable;
//    Dokument.LoadFromFile(sFile);
    if LoadMemTableFromStr(s, arr, sRazd, LoadFormat) then begin

    end;

  end;
end;

//--------------------------------------------------------------------------------------------------------------------------------
function CreateTmpPath(nType:Integer):String;
begin
  Result:='';          
  if nType=0 then begin
    Result:=CheckSleshN(ExtractFilePath(Application.ExeName))+'Tmp';
  end else if nType=1 then begin
    Result:=CheckSleshN(ExtractFilePath(Application.ExeName))+'TestPost';
  end else if nType=2 then begin
    Result:=CheckSleshN(ExtractFilePath(Application.ExeName))+'$temp$';
  end;
  if Result<>'' then begin
    ClearDir(Result,true);
    ForceDirectories(Result);
  end;
end;

//--------------------------------------------
function GetBookmarkMen:String;
begin
  Result:=GetBookmarkMen_(';');
end;
//--------------------------------------------
function GetBookmarkMen2(sDelim:String):String;
begin
  Result:=GetBookmarkMen_(sDelim);
end;
//--------------------------------------------
function GetBookmarkMen_(sDelim:String):String;
var
  ArrBookmark:TArrStrings;
  i:Integer;
  s:String;
begin
  Result:='';
  if CurGridMens<>nil then begin
    SetLength(ArrBookmark,0);
    SelectionToArr(CurGridMens,ArrBookmark);
    s:=CurGridMens.DataSource.DataSet.Bookmark;
    if Length(ArrBookmark)>0 then begin
      for i:=0 to Length(ArrBookmark)-1 do begin
        CurGridMens.DataSource.DataSet.Bookmark:=ArrBookmark[i];
        Result:=Result+CurGridMens.DataSource.DataSet.FieldByName('ID_INTERNAL').AsString+sDelim;
      end;
    end;
    CurGridMens.DataSource.DataSet.Bookmark:=s;
  end;
end;

//--------------------------------------------------------------------------------------------------------------------------------
function SvidInPadeg(nTypeObj:Integer):Boolean;  // свидетельство в падеже
begin
  Result:=GlobalTask.ParamAsBoolean('SKL_SVID');
end;
//--------------------------------------------------------------------------------------------------------------------------------
function TypeRegSvid(nTypeObj:Integer):Integer;
begin
{ [KEY_REG_SVID]    1=не изменять   2=верхний регистр  3=нижний регистр  }
  try
//    if nTypeObj=_TypeObj_ZBrak then begin
      Result:=GlobalTask.ParamAsInteger('REG_SVID');
      if (Result<=0) or (Result>3)
        then Result:=1;  // 1-не изменять
//    end else if nTypeObj=_TypeObj_ZSmert then begin
//      Result:=GlobalTask.ParamAsInteger('REG_SVID_SMERT');
//      if Result<=0
//        then Result:=1;  // 1-не изменять
//    end else begin
//      Result:=1;
//    end;
  except
    Result:=1;
  end;
end;
//--------------------------------------------------------------------------------------------------------------------------------
function RegSvid(v:Variant;nTypeObj:Integer):Variant;
var
  n:Integer;
begin
  Result:=v;
  if v<>null then begin
    n:=TypeRegSvid(nTypeObj);
    if n=2 then begin  // 2=верхний регистр
      Result:=ANSIUpperCase(VarToStr(v));
    end else if n=3 then begin  // 3=нижний регистр
      Result:=ANSILowerCase(VarToStr(v));
    end;
  end;
end;
//--------------------------------------------------------------------------------------------------------------------------------
function TypeRegSvidFIO(nTypeObj:Integer):Integer;
begin
{ [KEY_REG_SVID]    1=не изменять   2=верхний регистр  3=нижний регистр  }
  try
    Result:=GlobalTask.ParamAsInteger('REG_SVID_FIO');
    if (Result<=0) or (Result>3)
      then Result:=2;
  except
    Result:=2;   
  end;
end;
//--------------------------------------------------------------------------------------------------------------------------------
function RegSvidFIO(v:Variant;nTypeObj:Integer):Variant;
var
  n:Integer;
begin
  Result:=v;
  if v<>null then begin
    n:=TypeRegSvidFIO(nTypeObj);
    if n=2 then begin  // 2=верхний регистр
      Result:=ANSIUpperCase(VarToStr(v));
    end else if n=3 then begin  // 3=нижний регистр
      Result:=ANSILowerCase(VarToStr(v));
    end;
  end;
end;
//--------------------------------------------------------------
procedure SetWorkDataSet(ds:TDataSet; sName:String);
var
  i:Integer;
begin
  sName:=Trim(ANSIUpperCase(sName));
  i:=slWorkDataSet.IndexOf(sName);
  if i>-1 then begin
    slWorkDataSet.Objects[i]:=ds;
  end else begin
    slWorkDataSet.AddObject(sName,ds);
  end;
end;
//--------------------------------------------------------------
function GetWorkDataSet(sName:String):TDataSet;
var
  i:Integer;
begin
  Result:=nil;
  sName:=Trim(ANSIUpperCase(sName));
  i:=slWorkDataSet.IndexOf(sName);
  if i>-1 then begin
    Result:=TDataSet(slWorkDataSet.Objects[i]);
  end;
end;
//--------------------------------------------------------------------------------------------------------------------------------
function MaxCountIN:Integer;
begin
  {$IFDEF ZAGS}
     Result:=100;
  {$ELSE}
     Result:=20;
  {$ENDIF}
end;

//--------------------------------------------------------------------------------------------------------------------------------
function IsMID(meta:TMetaTask) : Boolean;
begin
  if meta=nil then meta:=GlobalTask;
  Result:=Copy(meta.ParamAsString('KOD'),1,1)='8';
end;

//--------------------------------------------------------------------------------------------------------------------------------
function MyID:Integer;
begin
  Result:=GlobalTask.ParamAsInteger('ID');
end;
//-----------------------------------------------------------------------------------------
function SoatoFromID(nID:Integer):String;
begin
  Result:='';
  {$IFDEF ZAH}
    if dmBase.sprGES.Locate('ID', nID, []) then begin
       Result:=dmBase.sprGES.FieldByName('SOATO').AsString;
    end;
  {$ENDIF}
  {$IFDEF ZAGS}
    if dmBase.sprZAGS.Locate('ID', nID, []) then begin
       Result:=dmBase.sprZAGS.FieldByName('SOATO').AsString;
    end;
  {$ENDIF}
  {$IFDEF LAIS}
    if dmBase.sprSoato.Locate('ID', nID, []) then begin
       Result:=dmBase.sprZAGS.FieldByName('KOD').AsString;
    end;
  {$ENDIF}
end;
//-------------------------------------------------------------------------------------------
function MyName:String;
begin
  Result:=GlobalTask.ParamAsString('NAME');
end;
//-----------------------------------------------------------------------------------------
function MyKName:String;
begin
  Result:=GlobalTask.ParamAsString('KNAME');
end;
//-----------------------------------------------------------------------------------------
function EnabledRnGorod : Boolean;
begin
  Result:=true;
//  Result:=GlobalTask.ParamAsBoolean('ENABLE_RN_GOROD');
end;
//--------------------------------------------------------------------------------------------------------------------------------
function IsMyID(nMyID,nCurID:Integer):Boolean;
begin
  {$IFDEF LAIS}
    Result:=true
  {$ELSE}
    if nMyID=nCurID
      then Result:=true
      else Result:=false;
  {$ENDIF}
end;

procedure SetGlobalFilterPunkt(sValue:String);
begin
  FGlobalFilterPunkt:=sValue;
end;

function GetGlobalFilterPunkt:String;
begin
  Result:=FGlobalFilterPunkt;
end;

//--------------------------------------------------------------------------------------------------------------------------------
// если значения при замене 'ё' на 'е' равны, то возвращаем текущее значение
function CheckEE(sNew:String;sCur:String):String;
begin
  if Trim(sCur)='' then begin
    Result:=sNew;
  end else begin
    if Trim(StringReplace(sNew,'ё','е',[rfReplaceAll, rfIgnoreCase]))=Trim(StringReplace(sCur,'ё','е',[rfReplaceAll, rfIgnoreCase]))
      then Result:=sCur
      else Result:=sNew;
  end;
end;

//--------------------------------------------------------------------------------------------------------------------------------
function DeleteAllSpace(s:String):String;
begin
  Result:=Q_SpaceCompress(s);
end;

//--------------------------------------------------------------------------------------
function CheckParam(strCheck:String; var strParam: String):Boolean;
var
  n:Integer;
begin
  Result:=false;
  n:=Pos(strCheck,strParam);
  if (n>0) then begin
    Result:=true;
    strParam:=StringReplace(strParam, strCheck, '', []);
  end;
end;
//--------------------------------------------------------------------------------------
function CheckLangParam(var strParam: String):String;
var
  n,m:Integer;
begin
  Result:='R';

  n:=Pos('<Б>',strParam);
  m:=Pos('<B>',strParam);
  if (n>0) or (m>0) then begin
    Result:='B';
    strParam:=StringReplace(strParam,'<Б>','',[]);
    strParam:=StringReplace(strParam,'<B>','',[]);
  end;
  {
  n:=Pos('Б',strParam);
  m:=Pos('B',strParam);
  if (n>0) or (m>0) then begin
    Result:='B';
    strParam:=StringReplace(strParam,'Б','',[]);
    strParam:=StringReplace(strParam,'B','',[]);
  end;
  }
  n:=Pos('<Р>',strParam);
  m:=Pos('<R>',strParam);
  if (n>0) or (m>0) then begin
    Result:='R';
    strParam:=StringReplace(strParam,'<Р>','',[]);
    strParam:=StringReplace(strParam,'<R>','',[]);
  end;
 {
  n:=Pos('<Р>',strParam);
  m:=Pos('<R>',strParam);
  if (n>0) or (m>0) then begin
    Result:='R';
    strParam:=StringReplace(strParam,'<Р>','',[]);
    strParam:=StringReplace(strParam,'<R>','',[]);
  end;
 }
  if Pos('<.>',strParam)>0 then begin
    Result:=Result+'.';
    strParam:=StringReplace(strParam,'<.>','',[]);
  end;
end;
//--------------------------------------------------------------------------------------
function CheckUpperParam(var strParam: String):Boolean;
var
  n:Integer;
begin
  Result:=false;
  n:=Pos('<UPPER>',strParam);
  if (n>0) then begin
    Result:=true;
    strParam:=StringReplace(strParam,'<UPPER>','',[]);
  end else begin
    n:=Pos('<U>',strParam);
    if (n>0) then begin
      Result:=true;
      strParam:=StringReplace(strParam,'<U>','',[]);
    end;
  end;
end;
//--------------------------------------------------------------------------------------
function CheckPadegParam(var strParam: String):String;
var
  n:Integer;
begin
  Result:='';
  n:=Pos('<P:',strParam);
  if (n>0) and (Copy(strParam,n+4,1)='>') then begin
    Result:=Copy(strParam,n+3,1);
    strParam:=StringReplace(strParam,'<P:'+Result+'>','',[]);
    Result:=ANSIUpperCase(Result);
  end;
end;
//--------------------------------------------------------------------------------------
function CheckKratParam(var strParam: String):Boolean;
var
  n:Integer;
begin
  Result:=false;
  n:=Pos('<SOKR>',strParam);
  if (n>0) then begin
    Result:=true;
    strParam:=StringReplace(strParam,'<SOKR>','',[]);
  end;
end;
//-----------------------------------------------------
function GetNomerUpdateProg:Integer;
var
  VerInfo:TVerInfo;
begin
  try
    VerInfo:=TVerInfo.Create(Application.ExeName);
    Result:=StrToInt(VerInfo.Build);
    VerInfo.Free;
  except
    Result:=0;
  end;
end;

//--------------------------------------------------
function GetMestoZAH(ds:TDataSet; sFields:String; nType:Integer):String;
begin
  {$IFDEF ADD_ZAH}
    
    Result:='';
  {$ELSE}
    Result:='';
  {$ENDIF}
end;

//--------------------------------------------------
function GetVidFromTypeObj(nTypeObj:Integer): String;
begin
  Result:='';
   if nTypeObj=_TypeObj_ZBrak then begin
     Result:='ZBrak';
   end else if nTypeObj=_TypeObj_ZRast then begin
     Result:='ZRast';
   end else if nTypeObj=_TypeObj_ZRogd then begin
     Result:='ZRogd';
   end else if nTypeObj=_TypeObj_ZSmert then begin
     Result:='ZSmert';
   end else if nTypeObj=_TypeObj_ZUstOtc then begin
     Result:='ZUstOtc';
   end else if nTypeObj=_TypeObj_ZAdopt then begin
     Result:='ZAdopt';
   end else if nTypeObj=_TypeObj_ZChName then begin
     Result:='ZChName';
   end else if nTypeObj=_TypeObj_DBrak then begin
     Result:='DBrak';
   end else if nTypeObj=_TypeObj_DChName then begin
     Result:='DChName';
   end else if nTypeObj=_TypeObj_DIzm then begin
     Result:='DIzm';
   end else if nTypeObj=_TypeObj_DRast then begin
     Result:='DRast';
   end else if nTypeObj=_TypeObj_ZUstMat then begin
     Result:='ZUstMat';
   end else if nTypeObj=_TypeObj_AktZAH then begin
     Result:='AktZAH';
   end else if nTypeObj=_TypeObj_SMDOPost then begin
     Result:='SMDOPost';
   end else if nTypeObj=_TypeObj_SMDOPostDoc then begin
     Result:='SMDODoc';
   end else if nTypeObj=_TypeObj_SMDOPostUvd then begin
     Result:='SMDOUvd';
   end else if nTypeObj=_TypeObj_Opeka then begin
     Result:='ZOpeka';
   end else if nTypeObj=_TypeObj_QueryGis then begin
     Result:='QueryGis';
   end else if (nTypeObj>=_TypeObj_UZRogd) and (nTypeObj<=_TypeObj_UZ_Max) then begin
     Result:='' // ??? GurnalRegistr;
   end;
   if Result=''
     then PutError('GetVidFromTypeObj('+IntToStr(nTypeObj)+') :Неизвестный вид документа');
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

//--------------------------------------------------
function GetNameReportVid(getVid:String): String;
var
  v : Variant;
begin
  if (GlobalTask.Script<>nil) then begin
    v:=null;
    SetGlobalVar('Result','');
    v:='';
    ClearReports;
    GlobalTask.Script.RunEx(GetVid+'_REPORT',[],v);
    if v = '' then
      v := GetGlobalVar('Result');
    if (v<>null) and (VarToStr(v)<>'') then begin
      Result := v;
    end else begin
      Result := '';
    end;
  end;
end;

//------------------------------------------------------------------------------
function DSiShareFolderMy(const folder, shareName, comment: string; type_access:DWORD): boolean;
var
  ntComment   : WideString;
  ntFolder    : WideString;
  ntShareName : WideString;
  paramError  : integer;
  shareInfo9x : SHARE_INFO_50_9x;
  shareInfoNT : SHARE_INFO_2_NT;
  w9xShareName: string;
begin
  if folder = '' then
    raise Exception.Create('DSiShareFolder: empty folder');
  if shareName = '' then
    raise Exception.Create('DSiShareFolder: empty share name');
  if DSiIsWinNT then begin
    ntFolder := folder;
    ntShareName := shareName;
    ntComment := comment;
    with ShareInfoNT do begin
      shi2_NetName := PWideChar(ntShareName);
      shi2_Type := STYPE_DISKTREE;
      shi2_Remark := PWideChar(ntComment);
      shi2_Permissions := type_access;
      shi2_Max_Uses := -1;
      shi2_Current_Uses := 0;
      shi2_Path := PWideChar(ntFolder);
      shi2_Passwd := nil;
    end;
    ParamError := 0;
    Result := (DSiNTNetShareAdd(nil, 2, @ShareInfoNT, paramError) = 0);
  end
  else begin
    with ShareInfo9x do begin
      FillChar(shi50_NetName, 13, 0);
      w9xShareName := Copy(shareName, 1, 13);
      Move(w9xShareName[1], shi50_NetName[1], Length(w9xShareName));
      shi50_Type := STYPE_DISKTREE;
      shi50_Remark := PChar(comment);
      shi50_rw_password[1] := #0;
      shi50_ro_password[1] := #0;
      shi50_flags := SHI50F_FULL;
      shi50_Path := PChar(ANSIUpperCase(folder));
    end;
    Result := (DSi9xNetShareAdd(nil, 50, @ShareInfo9x, SizeOf(SHARE_INFO_50_9x)) = 0);
  end;
end; { DSiShareFolder }


//--------------------------------------------------------------------------------------------------------------------------------
function getDomKorpKv(adr:TAdres):String;
begin
  Result:='';
  if adr.NDom<>''  then Result:=Result + SokrDom + adr.NDom;
  if adr.Korp<>'' then Result:=Result+', ' + SokrKorp + adr.Korp;
  if adr.Kv<>''   then Result:=Result+', ' + SokrKv + adr.Kv;
  if Copy(Result,1,1)=','
    then  Result:=Trim(Copy(Result,2,Length(Result)));
end;
//--------------------------------------------------------------------------------------------------------------------------------
function sokrObl:String;
begin
//  Result:=GlobalTask.GetMainParam('SOKR','OBL','C','обл.');
  Result:='обл.';
end;
function sokrObl_B:String;
begin
//  Result:=GlobalTask.GetMainParam('SOKR_B','OBL','C','вобл.');
  Result:='вобл.';
end;
//--------------------------------------------------------------------------------------------------------------------------------
function sokrRn:String;
begin
//  Result:=GlobalTask.GetMainParam('SOKR','RN','C','р-н');
  Result:='р-н';
end;
//--------------------------------------------------------------------------------------------------------------------------------
function sokrDOM:String;
begin  
  Result:=GlobalTask.GetMainParam('SOKR','DOM','C','д.');
  Result:=Result+#160;
end;
function sokrKORP:String;
begin
//  Result:=GlobalTask.GetMainParam('SOKR','KORP','C','корп.');
//  Result:=Result+#160;
  Result:='корп.'#160;
end;
function sokrKV:String;
begin
//  Result:=GlobalTask.GetMainParam('SOKR','KV','C','кв.');
//  Result:=Result+#160;
  Result:='кв.'#160;
end;
//--------------------------------------------------------------------------------------------------------------------------------
function CreateNomerDKK(sType:String; ss:String):String;
var
  s:String;
begin
  Result:='';
  if ss<>'' then begin
    s:='';
    if Copy(sType,1,1)='D' then begin
      s:=sokrDOM;
    end else if Copy(sType,1,2)='KV' then begin
      s:=sokrKV;
    end else if Copy(sType,1,2)='KO' then begin
      s:=sokrKorp;
    end;
    if IsAllDigit(Copy(ss,1,1))
      then Result:=s+ss    // если первый символ цифра
      else Result:=ss;     // если первый символ не цифра
  end;
end;
//----------------------------------------------------------------------------------------
function GetWherePunktUlDom(nUch : Integer; strValues,strFieldName,strValues2,strFieldName2: String; ds : TDataSet; lCheckKorp:Boolean) : String;
var
  i,j,n,m : Integer;
  arr,arr2,arr3 : TArrStrings;
  s,ss,sss : String;
  arrDom, arrKorp : TArrStrings;
  vKeyValues : Variant;
  strDom, strAl : String;
begin

  if lCheckKorp then begin
    dmBase.WorkQuery.SQL.Text:='select punkt,ul,dom from '+
    ' (select distinct punkt,ifnull(ul,0) ul,trim(dom) dom,trim(korp) korp from базаДомов where date_fiks='+QStr(CURRENT_SOST)+') aaa '+
    ' group by 1,2,3 '+
    ' having count(*)>1 ';
    dmBase.WorkQuery.Open;
  end;

  Result := '';
  i := Pos('.', strFieldName2);
  strAl:='';
  if i>0 then strAl:=Copy(strFieldName2,1,i);
  StrToArr(strValues,arr,',',true);
  StrToArr(strValues2,arr2,';',false);
  SetLength(arr2, Length(arr) );
  vKeyValues := VarArrayCreate( [0, 2], varOleStr );

  for i:=0 to Length(arr)-1 do begin
    s  := strFieldName + '=' + arr[i];
    ss := '';
    if Trim(arr2[i])<>'' then begin
      StrToArr(arr2[i], arr3, ',', true);
      for j:=0 to Length(arr3)-1 do begin
        if arr3[j]='0'
         then sss:=strFieldName2 + ' is null'
         else sss:=strFieldName2 + '=' + arr3[j];
        vKeyValues[0] := nUch;
        vKeyValues[1] := arr[i];
        vKeyValues[2] := arr3[j];
        if (ds<>nil) and ds.Locate('ID;PUNKT;UL', vKeyValues, []) then begin
          StrToArr(ds.FieldByName('DOM').Asstring, arrDom, ',', true);
          SetLength(arrKorp,Length(arrDom));
          for n:=Low(arrDom) to High(arrDom) do begin
            m:=Pos('~',arrDom[n]);
            if m=0 then begin
              arrKorp[n]:='';
              arrDom[n]:=Trim(arrDom[n]);
            end else begin
              arrKorp[n]:=Trim(Copy(arrDom[n],m+1,Length(arrDom[n])));
              arrDom[n]:=Trim(Copy(arrDom[n],1,m-1));
            end;
          end;

          strDom :='';
          for n:=0 to Length(arrDom)-1 do begin
            if not lCheckKorp or dmBase.WorkQuery.Locate('PUNKT;UL;DOM',VarArrayOf([vKeyValues[1],vKeyValues[2],arrDom[n]]),[]) then begin
              if arrDom[n]<>''  then strDom:=strDom+'('+strAl+'dom=' + QStr(dmBase.GetNomerDom(arrDom[n]))+' '
                                else strDom:=strDom+'('+strAl+'dom is null ';
              if arrKorp[n]<>'' then strDom:=strDom+' and '+strAl+'korp=' + QStr(dmBase.GetNomerDom(arrKorp[n]))+') '
                                else strDom:=strDom+' and '+strAl+'korp is null) ';
            end else begin
              if arrDom[n]<>''  then strDom:=strDom+strAl+'dom=' + QStr(dmBase.GetNomerDom(arrDom[n]))+' '
                                else strDom:=strDom+strAl+'dom is null ';
            end;
            if n<>(Length(arrDom)-1) then strDom := strDom+' or '
          end;
          if (strDom<>'') then sss := '('+sss + ' and ('+strDom+'))';

        end;
        ss  := ss + sss;
        if j<> Length(arr3)-1
          then ss := ss + ' or ';
      end;
    end;
    if ss <> '' then begin
      s := '(' + s + ' and ('+ss+') )'
    end;
    Result := Result + s;
    if i<> Length(arr)-1
      then Result := Result + ' or ';
  end;
end;

//-----------------------------------------
procedure SetHunSpell(ed:TComponent);
{$IFDEF HUNSPELL}
begin
  if ed is THunSpellDbMemo then begin
    THunSpellDbMemo(ed).HunSpell:=HunSpell;
  end else if ed is THunSpellMemo then begin
    THunSpellMemo(ed).HunSpell:=HunSpell;
  end;
end;
{$ELSE}
begin
end;
{$ENDIF}

//-----------------------------------------
function CreateHunSpell:Boolean;
{$IFDEF HUNSPELL}
begin
  Result:=false;
  HunSpell:=nil;
  try
    if HunSpellApi.LoadLib then begin
      HunSpell:=THunSpell.Create(nil);
      HunSpell.DictDir:=ExtractFilePath(Application.Exename)+'\Dict';
      HunSpell.Dict:='russian';
      HunSpell.IgnoreWordsWithNumbers:=true;
  // ?   HunSpell.IgnoreAllCaps:=true;
      Result:=true;
    end;
  except
    on E:Exception do begin
      Result := false;
      PutError('Ошибка загрузка библиотеки проверки орфографии.'+Chr(13)+Chr(10)+E.Message);
    end;
  end;
end;
{$ELSE}
begin
end;
{$ENDIF}

procedure DestroyHunSpell;
{$IFDEF HUNSPELL}
begin
  if HunSpell<>nil
    then  FreeAndNil(HunSpell);
end;
{$ELSE}
begin
end;
{$ENDIF}
//-------------------------------------------------------------
function DateToSQL(dDate:TDateTime):String;
begin
  Result:=QStr(FormatDateTime('yyyy-mm-dd',dDate));
end;
//-------------------------------------------------------------
function CheckRegisterAkt(nType:Integer):Boolean;
var
  f:TfmShowPokaz;
  i,nTypeObj:Integer;
  slOpis:TStringList;
  sWhere,sCaption:String;
  lOk:Boolean;                                  
begin    
  slOpis := TStringList.Create;
  {$IFDEF ADD_ZAH}
    slOpis.Add('Захоронения='+IntToStr(_TypeObj_AktZAH));
    sCaption:='Непроведенные акты за ';
  {$ENDIF}
  {$IFDEF ADD_ZAGS}
    slOpis.Add('Рождения='+IntToStr(dmBase.TypeObj_ZRogd));
    slOpis.Add('Смерти='+IntToStr(dmBase.TypeObj_ZSmert));
    slOpis.Add('Установления отцовства='+IntToStr(dmBase.TypeObj_ZUstOtc));
    slOpis.Add('Заключения браков='+IntToStr(dmBase.TypeObj_ZBrak));
    {$IFDEF ZAGS}
      slOpis.Add('Расторжения браков='+IntToStr(dmBase.TypeObj_ZRast));
      slOpis.Add('Усыновления='+IntToStr(dmBase.TypeObj_ZAdopt));
      slOpis.Add('Перемена имени='+IntToStr(dmBase.TypeObj_ZChName));
      slOpis.Add('Установления материнства='+IntToStr(dmBase.TypeObj_ZUstMat));
    {$ENDIF}
    sCaption:='Непроведенные документы за ';
  {$ENDIF}
  OpenMessage('Контроль проведения ...','',10);
  try
  for i:=0 to slOpis.Count-1 do begin
    nTypeObj:=StrToInt(slOpis.ValueFromIndex[i]);

    if nType<=1 then begin   // за текущую дату
      sWhere:='datez='+datetoSQL(Now);
      sCaption:=sCaption+DatePropis(Now,3);
    end else if nType=2 then begin   // с начала недели
    end else if nType=4 then begin   // с начала месяца
    end;

    dmBase.WorkQuery.SQL.Text:='SELECT count(*) FROM '+ dmBase.MainTableFromTypeObj(nTypeObj).TableName+
    ' WHERE '+sWhere+' and (pole_grn is null or pole_grn<3000) ';
    if nTypeObj=_TypeObj_ZRogd then begin
      dmBase.WorkQuery.SQL.Text:=dmBase.WorkQuery.SQL.Text+' and givorogd=true ';
    end;
    try
      dmBase.WorkQuery.Open;
      if dmBase.WorkQuery.Eof
        then slOpis.Strings[i]:=slOpis.Names[i]+'=0'
        else slOpis.Strings[i]:=slOpis.Names[i]+'='+dmBase.WorkQuery.Fields[0].AsString;
      dmBase.WorkQuery.Close;
    except
      slOpis.Strings[i]:=slOpis.Names[i]+'=0'
    end;
  end;
  finally
    CloseMessage();
  end;
  lOk:=true;
  while lOk do begin
    lOk:=false;
    for i:=0 to slOpis.Count-1 do begin
      if slOpis.ValueFromIndex[i]='0' then begin
        lOk:=true;
        slOpis.Delete(i);
        break;
      end;
    end;
  end;
  Result:=false;
  if slOpis.Count=0 then begin
    Result:=true;
  end else begin
    f:=TfmShowPokaz.Create(nil);
    f.Caption:=sCaption;
    {$IFDEF ZAH}
      f.ListPokaz.Columns[0].Caption:='Тип документа';
    {$ELSE}
      f.ListPokaz.Columns[0].Caption:='Тип записи акта';
    {$ENDIF}
    f.ListPokaz.Columns[1].Caption:='Количество';
    for i:=0 to slOpis.count-1 do begin
      with f.ListPokaz.Items.Add do
      begin
        Caption := slOpis.Names[i];
        SubItems.Add(slOpis.ValueFromIndex[i]);
      end;
    end;
    f.ShowModal;
    if Problem('  Выйти из программы ?  ') then begin
      Result:=true;
    end;
    f.Free;
  end;
  slOpis.Free;
end;

//--------------------------------------------------------------
function CreateWorkShtamp(nType:Integer):Boolean;
var
  sFile1,sFile2:String;
begin
  Result:=false;
  if nType>-1 then begin
    sFile2:=NameFromExe('work_shtamp.doc');
    if FileExists(sFile2) then DeleteFile(sFile2);

    case nType of
      0 : sFile1:=NameFromExe('empty_shtamp.doc');
      1 : sFile1:=NameFromExe('shtamp.doc');
      2 : sFile1:=NameFromExe('shtamp_gerb.doc');
      3 : sFile1:=NameFromExe('shtamp-bel.doc');
    end;

    if CopyFile(PChar(sFile1), PChar(sFile2), false) then begin
      Result:=true;
    end else begin
      Result:=true;
      PutError('Ошибка копирования файла : '+sFile1+
              #13+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
    end;
  end;
end;

//--------------------------------------------------------------------------------------------------------------------------------
function ZH_GetNamePunkt(sDS:String; sPar:String; nType:Integer):String;
var
  ds:TDataSet;
  nTypePrint:Integer;
begin
  ds:=getDataSetFromStr(sDS);
  nTypePrint:=GlobalTask.ParamAsInteger('TYPE_NP_ZH');
  if ds<>nil then begin
    case nTypePrint of
      0: begin  // район + город
           if (sPar='') or (Length(sPar)<5) // если передано SPR или AKT
             then sPar:=';;ZH_RAION;ZH_GOROD,ZH_B_GOROD;;';
           Result:=dmBase.GetAdresAkt3(ds,sPar,nType,false);
         end;
      1: begin  // полностью
           Result:=dmBase.GetAdresAkt3(ds,'ZH_GOSUD,NAME;ZH_OBL,ZH_B_OBL;ZH_RAION;ZH_GOROD,ZH_B_GOROD;;',nType,true);
         end;
      2: begin  // только нас. пункт
           Result:=dmBase.GetAdresAkt3(ds,';;;ZH_GOROD,ZH_B_GOROD;;',1,false);
         end
    end;
  end;
end;

//--------------------------------------------------------------------------------------------------------------------------------
function getDataSetFromStr(strDataSet:String):TDataSet;
var
  f : TfmSimpleD;
begin
  f := GetCurDok;
  if (strDataSet='') or (AnsiUpperCase(strDataSet)='CURDOK') then begin
    Result:=f.Dokument;
  end else begin
    Result:=dmBase.GetRecord_DataSet(strDataSet); //GlobalSeekDataSet(strDataSet);
  end;
end;

//--------------------------------------------------------------------------------------------------------------------------------
procedure CheckNewVerDataSet(strPrKeyField:String; strNotChangeFields:String; dsNew:TDataSet; dsOld:TDataSet; lDelMissing:Boolean);
{
var
  s:String;
}
begin
{
  s:=strKeyFields;                          !!!
  dsNew.First;
  while not dsNew.Eof do begin
    if dsOld.Locate(strPrKeyField, dsNew.FieldByName(strPrKeyField).AsString,[loCaseInsensitive]) then begin
      strValue := dsOld.FieldByName('ValueText').AsString;
      dsOld.Edit;     // изменим описание, за исключением ключевого поля
      if strNotChangeFields='' then begin
        for i:=0 to dsNew.FieldCount-1 do begin
          if dsNew.Fields[i].FieldName<>strPrKeyField then begin
            dsOld.Fields[i].Value := dsNew.Fields[i].Value;
          end;
        end;
      end else begin
        for i:=0 to dsNew.FieldCount-1 do begin
          if (dsNew.Fields[i].FieldName<>strPrKeyField) and Pos(ANSIUpperCase(dsNew.Fields[i].FieldName)+';',strNotChangeFields)=0 then begin
            dsOld.Fields[i].Value := dsNew.Fields[i].Value;
          end;
        end;
      end;
      dsOld.Post;
    end else begin // добавим несуществующие параметры
      dsOld.Append;
      for i:=0 to dsNew.FieldCount-1 do begin
        dsOld.Fields[i].Value := dsNew.Fields[i].Value;
      end;
      dsOld.Post;
    end;
    dsNew.Next;
  end;
  dsOld.First;
  if lDelMissing then begin
    while not dsOld.Eof do begin
      if not dsNew.Locate('KOD',dsOld.FieldByName('KOD').AsString,[loCaseInsensitive]) then begin
        dsOld.Delete;
      end else begin
        dsOld.Next;
      end;
    end;
  end;
}
end;

{
procedure TForm1.Button1Click(Sender: TObject);
begin
  IdThreadComponent1.Start;
end;
//////////////
procedure TForm1.Button2Click(Sender: TObject);
begin
  IdThreadComponent1.Stop;
end;
//////////////
procedure TForm1.CallTerminate;
begin
  ShowMessage('Terminate');
end;
//////////////
procedure TForm1.FormCreate(Sender: TObject);
begin
  IdThreadComponent1.OnRun := IdThreadComponent1Run;
  IdThreadComponent1.OnAfterExecute := IdThreadComponent1AfterExecute;
end;
//////////////
procedure TForm1.IdThreadComponent1AfterExecute(Sender: TIdCustomThreadComponent);
begin
  Sender.Synchronize(CallTerminate);
end;
//////////////
procedure TForm1.IdThreadComponent1Run(Sender: TIdCustomThreadComponent);
var
  I: Integer;
begin
  I := 0;
  while not Sender.Terminated do
    Inc(I);
end;
}

procedure TReshOchMen.SetDateR(d: TDateTime);
begin
  FDateR:=d;
end;
procedure TReshOchMen.SetDateSila(d: TDateTime);
begin
  FDateSila:=d;
end;
procedure TReshOchMen.SetNomer(s: String);
begin
  FNomer:=s;
end;

function TReshOchMen.Clear: Boolean;
begin
  FTip:=-1;
  FOchered_ID:=-1;
  Result:=true;
end;

//---------------------------------------------------------------------------------
// CATEGORY из ATE в TYPEPUNKT
function Category2TypePunkt(sTypeRN:String):Integer;
begin
  Result:=0;
  if sTypeRN<>'' then begin  // если тип нас. пункта из "ГИС РН" не пустой
    if (sTypeRN='111') or (sTypeRN='112') or (sTypeRN='113') or (sTypeRN='212') or (sTypeRN='213') then begin
      Result:=1 // город
    end else if (sTypeRN='121') or (sTypeRN='221') then begin
      Result:=4 // гп.
    end else if (sTypeRN='122') or (sTypeRN='222') then begin
      Result:=7 // кп.
    end else if (sTypeRN='123') or (sTypeRN='223') then begin
      Result:=6 // рп.
    end else if (sTypeRN='231') then begin
      Result:=2 // деревня
    end else if (sTypeRN='232') then begin
      Result:=8 // поселок
    end else if (sTypeRN='233') then begin
      Result:=3 // село
    end else if (sTypeRN='234') then begin
      Result:=10 // хутор
    end else if (sTypeRN='235') then begin
      Result:=17 // агрогородок
    end else if (sTypeRN='239') then begin
      Result:=23 // снп
    end;
  end;
end;
// тип категории из АТЕ: 1-область  2-район  3-c/c  4-населенный пункт
function CategoryType(nType:Integer):Integer;
begin
  Result:=0;
  if nType=101 then begin
    Result:=CATEGORY_OBL;
  end else if nType=102 then begin
    Result:=CATEGORY_RAION;
  end else if nType=202 then begin
    Result:=CATEGORY_RNGOROD;
  end else if nType=103 then begin
    Result:=CATEGORY_SS;
  end else if nType>110 then begin
    Result:=CATEGORY_PUNKT;
  end;
end;

//-------------------------------------------------
// ATE
//-------------------------------------------------
//-------------------------------------------------
function GetATESS(nIdSS:Integer):Integer;
begin
{$IFDEF LAIS}
  if dmBase.SprSoato.Active and dmBase.AteSys.Active and dmBase.SprSoato.Locate('ID', nIdSS,[]) then begin
    Result:=dmBase.SprSoato.FieldByName('ATE_ID').AsInteger;
    if not dmBase.AteSys.Locate('ATE_ID', Result,[])
      then Result:=0;
  end else begin
    Result:=0;
  end;
{$ELSE}
  Result:=0;
{$ENDIF}
end;
//-----------------------------------
function IsEmptySoato(sSOATO:String):Boolean;
var
  s:String;
begin
  s:=copy(sSOATO,1,1);                          // '1204000000'
  if (s='') or (s='0') or (s='9') or (Copy(sSoato,5,6)='000000')
    then Result:=true
    else Result:=false;
end;
//-----------------------------------
function QuerySoato(lQuery:Boolean):Boolean;
begin
  if lQuery
    then Result:=Problem('Пересчитать значение кода территории ?')
    else Result:=true;
end;
//----------------------------------
function SeekATEFromSoato(sSOATO:String):Integer;
begin
  Result:=0;
  if dmBase.ATESys.Locate('KOD', sSOATO, []) then begin
    Result:=dmBase.ATESys.FieldByName('ATE_ID').AsInteger;
  end;
end;
//-------------------------------------------------
function SeekATE(Value:Integer):TDataSet;
begin
  Result:=nil;
  if dmBase.AteSys=nil then begin
    {
    if dmBase.ATE.IndexFieldNames<>'ATE_ID;DATEIN'
      then dmBase.ATE.IndexFieldNames:='ATE_ID;DATEIN';
    dmBase.ATE.SetRange([Value],[Value]);
    try
      dmBase.ATE.Last;   // встанем на последнюю запись с максимальным DATEIN
      if dmBase.ATE.FieldByName('ATE_ID').AsInteger=Value
        then Result:=dmBase.ATE;
    finally
      dmBase.ATE.CancelRange;
    end;
    }
  end else begin
    if dmBase.ATESys.IndexFieldNames<>'ATE_ID;DATEIN'
      then dmBase.ATESys.IndexFieldNames:='ATE_ID;DATEIN';
    dmBase.ATESys.SetRange([Value],[Value]);
    try
      dmBase.ATESys.Last;   // встанем на последнюю запись с максимальным DATEIN
      if dmBase.ATESys.FieldByName('ATE_ID').AsInteger=Value
        then Result:=dmBase.ATESys;
    finally
      dmBase.ATESys.CancelRange;
    end;
  end;
end;
//------------------------------------------------------
function FullNameSOATO(sSoato:String; nType:Integer; sRazd:String):String;
var
  ate:TATE;
begin
  Result:='';
  if sSoato='' then exit;
  ate.ATE_ID:=0;
  ate.KOD:=sSoato;
  Result:=FullNameFromATE(ate, nType, sRazd);
end;
//------------------------------------------------------
function FullNameATE(ateID:Integer; nType:Integer; sRazd:String):String;
var
  ate:TATE;
begin
  Result:='';
  if ateID<=0 then exit;
  ate.ATE_ID:=ateID;
  ate.KOD:='';
  Result:=FullNameFromATE(ate, nType, sRazd);
end;
//------------------------------------------------------
function FullNameFromATE(var ate:TATE; nType:Integer; sRazd:String):String;
var
 arrN:array[1..10] of String;
 n,m,i,nCat,id:Integer;
 ds:TDataSet;
 sField,sName:String;
 lOk,lPost,lObl,lRn,lSS:Boolean;
begin
  Result:='';
  if (ate.ATE_ID<=0) and (ate.KOD<>'')
    then ate.ATE_ID:=SeekATEFromSoato(ate.KOD);
  if (ate.ATE_ID>0) then begin
    lObl:=true;
    lRn:=true;
    lSS:=true;
    lPost:=false;
    if nType>0 then begin
      if ate.obl='-' then lObl:=false;
      if ate.raion='-'  then lRn:=false;
      if ate.ss='-'  then lSS:=false;
      if ate.category=1 then lPost:=true;
    end;
    ate.obl:='';
    ate.raion:='';
    ate.name:='';
    ate.category:=0;
    ate.SS:='';
    ate.RnGorod:='';
    ate.idObl:=0;
    ate.idRaion:=0;
    ate.idRaionG:=0;
    ate.idSS:=0;
    ate.idPunkt:=0;
    if sRazd='' then sRazd:=', ';
    n:=ate.ATE_ID;
    for m:=1 to 10 do arrN[m]:='';
    m:=10;
    sField:='NAMEC';
    while n>0 do begin
      ds:=SeekATE(n);
      if ds<>nil then begin
        nCat:=CategoryType(ds.FieldByName('CATEGORY').AsInteger);
        sName:=ds.FieldByName('NAME').AsString;
        id:=ds.FieldByName('ATE_ID').AsInteger;
        lOk:=true;
        if nCat=CATEGORY_OBL then begin
          ate.Obl:=sName;
          ate.idObl:=id;
          lOk:=lObl;
        end else if nCat=CATEGORY_RAION then begin
          ate.Raion:=sName;
          ate.idRaion:=id;
          lOk:=lRn;
        end else if nCat=CATEGORY_RNGOROD then begin
          ate.RnGorod:=sName;
          ate.idRaionG:=id;
        end else if nCat=CATEGORY_SS then begin
          ate.SS:=sName;
          ate.idSS:=id;
          lOk:=lSS;
        end else if nCat=CATEGORY_PUNKT then begin
          ate.Name:=sName;
          ate.Category:=ds.FieldByName('CATEGORY').AsInteger;
          ate.idPunkt:=id;
        end;
        if lOk then begin
          if ds.FieldByName('FRONT').AsInteger=1
            then arrN[m]:=ds.FieldByName(sField).AsString+' '+sName
            else arrN[m]:=sName+' '+ds.FieldByName(sField).AsString;
        end;
        if ds.FieldByName('ATE_PARENTID').Asinteger>0 then begin
          m:=m-1;
          n:=ds.FieldByName('ATE_PARENTID').Asinteger;
        end else begin
          n:=0;
        end;
      end else begin
        n:=0;
      end;
    end;
    if lPost then begin
      for i:=10 downto m do begin
        if arrN[i]<>'' then
          Result:=Result+arrN[i]+sRazd;
      end;
    end else begin
      for i:=m to 10 do begin
        if arrN[i]<>'' then
          Result:=Result+arrN[i]+sRazd;
      end;
    end;
    if Result<>'' then Result:=Copy(Result,1,Length(Result)-Length(sRazd));
  end;
end;
//---------------------------------------------------------
// тип решения равнозначен постановке
function ReshIsPostanovka(nTip:Integer):Boolean;
begin
  if (nTip=OCH_RESH_POST) or (nTip=OCH_RESH_VOST) or (nTip=OCH_RESH_PERENOS)
    then Result:=true
    else Result:=false
end;


//-----------------------------------------------------
function ReceiveMailTest2:Boolean;
var
  i:Integer;
  IdSocksInfo:TIdSocksInfo;
  IdSSLIOHandlerSocket:TIdSSLIOHandlerSocket;
  IdPOP3:TIdPOP3;
  fport:Integer;
  IdMessage1:TIdMessage;
begin
  Result:=false;
  IdMessage1:=TIdMessage.Create(nil);
  FPort:=995;
  IdPOP3:=TIdPOP3.Create(nil);
  IdPOP3.IOHandler:=nil;
  IdPOP3.Host:='pop.mail.ru'; // для доменов inbox, list, bk подставляем нужный домен, но вроде как должно работать, даже если для всех доменов прописывать pop.mail.ru
  IdPOP3.Port:=FPort; // порт POP3
  IdPOP3.Username:='vchura'; //@brest.by'; //для mail.ru в поле LOGIN для POP3 подключения используется полное имя почтового ящика
  IdPOP3.Password:='65vvvqqssS28'; //'room903'; //пароль от аккаунта
            
  IdSocksInfo:=TIdSocksInfo.Create(nil);
  IdSocksInfo.Authentication:= saNoAuthentication;
  IdSocksInfo.Port:=FPort;
  IdSocksInfo.Version:=svNoSocks;
  IdSSLIOHandlerSocket:=TIdSSLIOHandlerSocket.Create(nil);
  IdSSLIOHandlerSocket.SocksInfo:=IdSocksInfo;
  IdSSLIOHandlerSocket.SSLOptions.Method:=sslvTLSv1;
  IdPOP3.IOHandler:=IdSSLIOHandlerSocket;

  IdPOP3.Connect(15000);
  i:=IdPOP3.CheckMessages(); //проверяем общее кол-во писем в папке ВХОДЯЩИЕ
  ShowMessage(IntToStr(i));
  if i>0 then begin
    IdPOP3.Retrieve(i,IdMessage1); //запрашиваем письмо с наибольшим порядковым номером - это самое новое письмо
//    Label1.Caption:=IdMessage1.From.Address; //показываем адрес отправителя
//    Label2.Caption:=IdMessage1.Subject; //показываем тему письма
//    Memo1.Text:=IdMessage1.Body.Text; //показываем содержание письма, если доступно
    IdMessage1.SaveToFile('eml'+IntToStr(i)+'.eml'); //сохраняем письмо в файл с соответствующим порядковым номером
  end;
  IdPOP3.Disconnect; // закрываем соединение
  IdPOP3.Free;
  IdMessage1.Free;
  IdSocksInfo.Free;
  IdSSLIOHandlerSocket.Free;

end;

//---------------------------------------------------------------------
function GetFileFTP(IdFTP:TIdFTP; lShow:Boolean; lCheck:Boolean; strFileName:String; strOutputDir:String; lDeleteFile:Boolean):Boolean;
var
  cur:TCursor;
  LS:TStringList;
  s,sErr:String;
  mmm,n,nTask,nErrCode:Integer;
  lErr:Boolean;
begin
  RunFTP:=true;
  LastErrorFTP:='';
  Result:=false;
  s:=GetNameServerFTP(TypeServerFTP);
  if s='' then s:=IdFTP.Host;
  sErr:='';
//  IdAntiFreeze1.Active:=false;
  if lShow
    then OpenMessage('Подключение к серверу '+s,'',10);
  n:=1;
  nErrCode:=0;
  while n=1 do begin
    if (nErrCode=421) then n:=2;  //  по второму разу
    lErr:=false;
    nErrCode:=0;
    sErr:='';
    mmm:=GetTickcount;
    with IdFTP do begin
      try
        if not Connected
          then Connect;
      except
        on E: EIdProtocolReplyError do begin
          nErrCode:=EIdProtocolReplyError(E).ReplyErrorCode; // 421
         // sErr:=StringReplace(E.Message, chr(13)+chr(10), ', ', [rfReplaceAll]);
          sErr:='Слишком много подключений. Попробуйте позже.';
          if RightStr(sErr,2)=', ' then sErr:=Copy(sErr,1,Length(sErr)-2);
          lErr:=true;
        end;
        on E: EIdSocketError do begin
          nErrCode:=EIdSocketError(E).LastError;
          sErr:=E.Message;
          lErr:=true;
        end;
        on E: Exception do begin          // # 11001 Host not found
          sErr:=E.Message;
          lErr:=true;
        end;
      end;
      if (nErrCode=421) and (n=1) then begin
        Sleep(2000);  // подожмем 2 секунды
      end else begin
        n:=2;
      end;
    end;
    if lErr then begin
      LastErrorFTP:='Ошибка подключения к серверу обновлений ['+IntToStr(nErrCode)+'] '+IdFTP.Host+' ('+inttostr(trunc((gettickcount-mmm)/1000))+'сек.) '+#13#10+sErr;
      GlobalTask.LogFile.WriteToLogFile(StringReplace(LastErrorFTP, #13#10, ' ', [rfReplaceAll]));
    end;
  end;

  if lShow
    then CloseMessage;
  if (sErr<>'') and lCheck then begin
//    if (nErrCode<>421) and lCheck then begin
    cur:=Screen.Cursor;
    Screen.Cursor:=crDefault;
    PutError(s+chr(13)+chr(10)+'['+IntToStr(nErrCode)+'] '+sErr);
    Screen.Cursor:=cur;
//    end;
  end;

  if not IdFTP.Connected then begin
    RunFTP:=false;
    exit;
  end;

  try
    if DirFTP<>'' then begin  // глобальная переменная
      try
        IdFTP.ChangeDir(DirFTP);
      except
        on E: Exception do begin
//          if lCheck then begin
            cur:=Screen.Cursor;
            Screen.Cursor:=crDefault;
            PutError(s+chr(13)+chr(10)+E.Message);
            Screen.Cursor:=cur;
//          end;
          if IdFTP.Connected
            then IdFTP.Disconnect;
          exit;
        end;
      end;
    end;
  //  IdFTP1.TransferType := ftASCII;
    LS:=TStringList.Create;
    IdFTP.List(LS);
    LS.Free;

    //IdFTP1.TransferType := ftBinary;
    if strFileName='' then begin   // запрошен список файлов
      Result:=true;
    end else begin
      BytesToTransfer:=IdFTP.Size(strFileName);     // глобальная переменная
      if strOutputDir<>'' then begin
        ForceDirectories(strOutputDir);
        strOutPutDir:=CheckSleshN(strOutPutDir);
      end;
      if FileExists(strOutPutDir+strFileName) then begin
        DeleteFile(strOutPutDir+strFileName);
      end;
      try
//        IdAntiFreeze1.Active:=true;
        nTask:=EnterWorkerThread;
        try
          IdFTP.Get(strFileName, strOutPutDir+strFileName, false);
//          EnterMainThread;
//          try
//            fmMain.CheckVisibleGIF(false,'');
//          finally
//            LeaveMainThread;
//          end;
        finally
          LeaveWorkerThread;
        end;
        if FileExists(strOutPutDir+strFileName) then begin
          if lDeleteFile
            then IdFTP.Delete(strFileName);
          Result:=true;
        end;
      except
        on E: EIdNotConnected do begin
          cur:=Screen.Cursor;
          Screen.Cursor:=crDefault;
          ShowMessage('Загрузка прервана.');
          Screen.Cursor:=cur;
        end;
        on E:Exception do begin
          cur:=Screen.Cursor;
          Screen.Cursor:=crDefault;
          PutError(E.Message);
          Screen.Cursor:=cur;
        end;
      end;
    end;
  finally
//    IdAntiFreeze1.Active:=false;
    RunFTP:=false;
    if IdFTP.Connected
      then IdFTP.Disconnect;
  end;

end;
//---------------------------------------------------------
{
function GetPropertyFTP(nTypeServerFTP:Integer; strTypeFile:String):TPropFTP;
var
  s:String;
  strUser, strPassword, strCaption:String;
  n:Integer;
  ftpp:TPropFTP;
  function getDirFtp:String;
  begin
    if (strTypeFile='') or (strTypeFile='update') then begin
      Result:=DIR_UPDATE;
    end else if Copy(strTypeFile,1,4)='data' then begin
      Result:='/bases';
    end else if Copy(strTypeFile,1,5)='setup' then begin
      Result:='/setup';
    end;
  end;
begin
 Result.Ok:=true;
 Result.Port:=21;
 DirFTP:='';
 TypeServerFTP:=0;
 strTypeFile:=LowerCase(strTypeFile);
 //------ ВЦ БОУС ------------------------------
 if nTypeServerFTP=SERVER_BREST then begin             // uProjects.pas
   Result.Ok:=true;
   ftpp:=GetPropertyVCBrest(strTypeFile);
   Result.Username:=ftpp.Username;  // 'vc';
   Result.Password:=ftpp.Password;  //  PSW_ADMIN_FTP; //'admin1106';
   Result.Passive:=true;
   Result.Host:=ftpp.Host; // 'vc.brest.by';
   Result.Dir:=ftpp.Dir;   // '/www/vc.brest.by/download'

   s:=Trim(GlobalTask.ParamAsString('IP_UPDATE_V'));
   if (s<>'') and (strTypeFile='update') then begin
     n:=Pos(';',s);
     if n=0 then begin
       Result.Host:=s;
     end else begin
       Result.Host:=Copy(s,1,n-1);
       Result.Dir:=Copy(s,n+1,Length(s));
     end;
   end;
 //------  FTP сервер НЦЕУ новый -----------
 end else if nTypeServerFTP=SERVER_NCES_UPD then begin
   Result.Ok:=true;
   Result.Username:='anonymous';
   Result.Password:='vc_bous@brest.by';
   Result.Passive:=true;
   Result.Host:='10.30.251.170';
   Result.Dir:=getDirFtp; // DIR_UPDATE  uTypes.pas
   s:=Trim(GlobalTask.ParamAsString('IP_UPDATE_N'));   // IP адрес нашего виртуального сервера НЦЭУ
   if s<>'' then begin
     n:=Pos(';',s);
     if n=0 then begin
       Result.Host:=s;
     end else begin
       Result.Host:=Copy(s,1,n-1);
       Result.Dir:=Copy(s,n+1,Length(s));
     end;
   end;
//   IdFTP.Username:='admin';
//   IdFTP.Password:='cit411bel';
//   DirFTP:='/var/ftpd/pub/'+DIR_UPDATE;  // uTypes.pas
 //------  FTP сурвер НЦЕУ -----------
 end else if nTypeServerFTP=SERVER_NCES_UPD2 then begin
   Result.Host:='10.30.254.20';
   Result.Username:='belstatftpreader'; //'belstatftp';
   Result.Password:='123o!@#';          //'L0df4!B';
   Result.Dir:=getDirFTP; //DIR_UPDATE   uTypes.pas
   Result.Passive:=true;
   s:=Trim(GlobalTask.ParamAsString('IP_UPDATE_N2'));   // IP адрес FTP сервера НЦЭУ
   if s<>'' then begin
     n:=Pos(';',s);
     if n=0 then begin
       Result.Host:=s;
     end else begin
       Result.Host:=Copy(s,1,n-1);
       Result.Dir:=Copy(s,n+1,Length(s));
     end;
   end;
 //------  портал АИС Месные Советы -----------
 end else if nTypeServerFTP=SERVER_RIAP then begin
   if LowerCase(Copy(strTypeFile,1,3))='upd'
     then s:='UPDATE'
     else s:='RIAP_DATA';
   Result:=GetPropertyIniFTP(s);
   if not Result.Ok then begin
     Result.Ok:=true;
     Result.Host:='10.101.1.108';   // msd.by
     Result.Port:=21;
     if LowerCase(Copy(strTypeFile,1,3))='upd' then begin
       Result.Username:='update';
       Result.Password:='zs34@M5';
       Result.Dir:='';                           // uProjects.pas
     end else begin
       Result.Username:='data';
       Result.Password:='up98!zte';
       if Copy(strTypeFile,1,4)='data' then Result.Dir:='/bases' else if Copy(strTypeFile,1,5)='setup' then Result.Dir:='/setup';
     end;
   end;
 end else if nTypeServerFTP=SERVER_OCHERED then begin
   Result:=GetPropertyIniFTP('OCHERED');
 end else if nTypeServerFTP=SERVER_ZAGS then begin
   Result:=GetPropertyIniFTP('ZAGS');
 end;
 if Result.Ok then begin
   TypeServerFTP:=nTypeServerFTP;
   DirFTP:=Result.Dir;
   if (Result.Password='') then begin
     strCaption:='Передача данных';
     strUser:=Result.Username;
     strPassword:='';
     if ShowLogon( strUser, strPassword, strCaption, -1,-1, 3, nil) then begin
       Result.Username:=strUser;
       Result.Password:=strPassword;
     end else begin
       Result.Ok:=false;
     end;
   end else begin
     if (Result.Password='*')
       then Result.Password:='';
   end;
 end;
end;
}
//---------------------------------------------------------
function SetPropertyFPT(IdFTP:TIdFTP;nTypeServerFTP:Integer; strTypeFile:String):Boolean;
var
  rFTP:TPropFTP;
  s:String;
  strUser, strPassword, strCaption:String;
begin
 Result:=true;
 IdFTP.Disconnect;
 IdFTP.Port:=21;
// if (TypeServerFTP<>SERVER_BREST) and (TypeServerFTP<>SERVER_RIAP)
//   then TypeServerFTP:=SERVER_BREST;
 rFTP.Ok:=false;     
 //------ ВЦ БОУС ------------------------------
 if nTypeServerFTP=SERVER_BREST then begin             // uProjects.pas
   IdFTP.Host:='vc.brest.by';
   IdFTP.Username:='vc';
   IdFTP.Password:=PSW_ADMIN_FTP; //'admin1106';
   if LowerCase(strTypeFile)='update'
     then DirFTP:='/www/vc.brest.by/download'  // uProjects.pas
     else DirFTP:='/www/vc.brest.by/bases';    //'/WWW/bases';
 //------  FTP сурвер НЦЕУ новый -----------
 end else if nTypeServerFTP=SERVER_NCES_UPD then begin
   IdFTP.Host:='10.30.251.170';
   IdFTP.Username:='anonymous';
   IdFTP.Password:='vc_bous@brest.by';
   DirFTP:=DIR_UPDATE;  // uTypes.pas
//   IdFTP.Username:='admin';
//   IdFTP.Password:='cit411bel';
//   DirFTP:='/var/ftpd/pub/'+DIR_UPDATE;  // uTypes.pas
 //------  FTP сурвер НЦЕУ -----------
 end else if nTypeServerFTP=SERVER_NCES_UPD2 then begin
   IdFTP.Host:='10.30.254.20';
   IdFTP.Username:='belstatftpreader'; //'belstatftp';
   IdFTP.Password:='123o!@#';          //'L0df4!B';
   DirFTP:=DIR_UPDATE;  // uTypes.pas
 //------  портал АИС Месные Советы -----------
 end else if nTypeServerFTP=SERVER_RIAP then begin
   if LowerCase(Copy(strTypeFile,1,3))='upd'
     then s:='UPDATE'
     else s:='RIAP_DATA';
   rFTP:=GetPropertyIniFTP(s);
   if not rFTP.Ok then begin
     rFTP.Ok:=true;
     rFTP.Host:='10.101.1.108';   // msd.by
     rFTP.Port:=21;
     if LowerCase(Copy(strTypeFile,1,3))='upd' then begin
       rFTP.Username:='update';
       rFTP.Password:='zs34@M5';
       rFTP.Dir:='';                           // uProjects.pas
     end else begin
       rFTP.Username:='data';
       rFTP.Password:='up98!zte';
       if LowerCase(Copy(strTypeFile,1,4))='data' then rFTP.Dir:='/bases';
     end;
   end;
 end else if nTypeServerFTP=SERVER_OCHERED then begin
   rFTP:=GetPropertyIniFTP('OCHERED');
   Result:=rFTP.Ok;
 end else if nTypeServerFTP=SERVER_ZAGS then begin
   rFTP:=GetPropertyIniFTP('ZAGS');
   Result:=rFTP.Ok;
 end;
 if rFTP.Ok then begin
   TypeServerFTP:=nTypeServerFTP;
   IdFTP.Port:=rFTP.Port;
   IdFTP.Host:=rFTP.Host;
   IdFTP.Username:=rFTP.Username;
   IdFTP.Passive:=rFTP.Passive;
   if (rFTP.Password='') then begin
     strCaption:='Передача данных';
     strUser:=rFTP.Username;
     strPassword:='';
     if ShowLogon( strUser, strPassword, strCaption, -1,-1, 3, nil) then begin
       IdFTP.Username:=strUser;
       IdFTP.Password:=strPassword;
     end else begin
       Result:=false;
     end;
   end else begin
     if (rFTP.Password='*')
       then IdFTP.Password:=''
       else IdFTP.Password:=rFTP.Password;
   end;
   DirFTP:=rFTP.Dir;
 end;
end;
{$IFDEF GKH}
  // CheckUpdate
{$ELSE}
//---------------------------------------------------------
{$IFDEF UPDATE_SYNA}
function CheckUpdateSyna(pn:TPanel):Boolean;
var
  dMax:TDateTime;
begin
  Result:=true;
  oUpdate:=TSynapseObj.Create(pn);
  oUpdate.FCheckMessages:=true;
  oUpdate.FCheckSpr:=Globaltask.ParamAsBoolean('SMDO_SPR_CHECK');
  oUpdate.FThread:=true;
  if oUpdate.CheckUpdate then begin
    AddNotifyProg(fmMain, 'Доступно обновление программы № '+IntToStr(oUpdate.FUpdate)+#13#10+'(Сервис->Дополнительно->Скачать обновление программы)', false, true,0,0);
  end;
  {$IFDEF SMDO}
  if oUpdate.FDateSprOrgSMDO>0 then begin
    dMax:=getMaxCreateDateSpr('smdosprorg'); // default 'smdosprorg'
    dMax:=Max(dMax, GlobalTask.GetLastValueAsDate('LAST_UPDATE_SPRORG',false));
    if oUpdate.FDateSprOrgSMDO>dMax then
      AddNotifyProg(fmMain, 'Доступно обновление справочника организаций СМДО от '+FormatDateTime('dd.mm.yyyy г.',oUpdate.FDateSprOrgSMDO), false, true,0,0);
  end;
  if oUpdate.FDateSprVidDokSMDO>0 then begin
    dMax:=getMaxCreateDateSpr('smdosprviddok'); // default 'smdosprorg'
    dMax:=Max(dMax, GlobalTask.GetLastValueAsDate('LAST_UPDATE_SPRVIDDOK',false));
    if oUpdate.FDateSprVidDokSMDO>dMax then
      AddNotifyProg(fmMain, 'Доступно обновление справочника видов документов СМДО от '+FormatDateTime('dd.mm.yyyy г.',oUpdate.FDateSprVidDokSMDO), false, true,0,0);
  end;
  {$ENDIF}
  if oUpdate.FMessages<>''
    then CheckMessagesProg(oUpdate.FMessages);
end;

//---------------------------------------------------------
procedure RunUpdateSyna(pn:TPanel);
var
  strMessages:String;
  lPath:Boolean;
begin
  if oUpdate=nil
    then oUpdate:=TSynapseObj.Create(pn);
  if oUpdate.FRun>0 then begin // идет процесс !!!
    if oUpdate.FRun=RUN_GETFILE then
      PutError('Выполняется загрузка обновления')
    else if oUpdate.FRun=RUN_CHECK then
      PutError('Выполняется проверка обновления');
    exit;
  end;

  oUpdate.FMessages:='';

  if oUpdate.FUpdate=0 then  begin // не определяли наличие обновления
    oUpdate.FTypeServer:=0;
    oUpdate.FThread:=false;
    oUpdate.FCheckMessages:=true;
    if oUpdate.CheckUpdate then begin
      if Problem('Доступно обновление программы № '+IntToStr(oUpdate.FUpdate)+'. Загрузить?') then begin  //Доступно обновление
        oUpdate.FThread:=true;
        if oUpdate.GetFileFTP(true) then begin
          oUpdate.RunFileFTP;
        end else begin
          if oUpdate.FError<>''
            then PutError(oUpdate.FError);
        end;
      end;
    end else begin
      if oUpdate.FError=''
        then ShowMessage(PADCStr('Обновление не найдено.',40,' '))
        else PutError(oUpdate.FError);
    end;
  end else begin
    oUpdate.FTypeServer:=0;
    if oUpdate.GetFileFTP(true) then begin
      oUpdate.RunFileFTP;
    end else begin
      if oUpdate.FError<>''
        then PutError(oUpdate.FError);
    end;
  end;
  if oUpdate.FMessages<>''
    then CheckMessagesProg(oUpdate.FMessages);
end;
//---------------------------------------------------------
{$IFDEF SMDO}
procedure RunLoadSprSMDO(pn:TPanel);
var
  s,sSoob,sFile:String;
  lUpdate:Boolean;
  slPar:TStringList;
  dMax:TDateTime;
begin
  if oUpdate=nil
    then oUpdate:=TSynapseObj.Create(pn);
  oUpdate.FMessages:='';
  slPar:=TStringList.Create;
  lUpdate:=false;
  if oUpdate.FDateSprOrgSMDO=0 then  begin // не определяли наличие обновления
    oUpdate.FTypeServer:=0;
    oUpdate.FThread:=false;
    oUpdate.FCheckMessages:=false;
    oUpdate.FCheckSpr:=true;
//    oUpdate.FCheckSpr:=Globaltask.ParamAsBoolean('CHECK_SMDO_SPR');
    oUpdate.CheckUpdate;
  end;
  sSoob:='';
  if oUpdate.FDateSprOrgSMDO>0 then begin
    slPar.Clear;
    dMax:=getMaxCreateDateSpr('smdosprorg'); // default 'smdosprorg'
    dMax:=Max(dMax, GlobalTask.GetLastValueAsDate('LAST_UPDATE_SPRORG',false));
    if oUpdate.FDateSprOrgSMDO>dMax then begin
      lUpdate:=true;
    end;
    if lUpdate then begin
      if Problem('Скачать справочник организаций СМДО ?') then begin
        slPar.Add('FILE='+oUpdate.FFileSprOrg);
        oUpdate.FThread:=true;
  //      oUpdate.FThread:=false;
        oUpdate.GetFileFTP(true,slPar);
        sFile:=CheckSleshN(oUpdate.FOutputDir)+oUpdate.FFileSprOrg;
        if sFile<>'' then begin
          RunZagrSprSMDO2(SMDO_SPR_ORG, oUpdate.FDateSprOrgSMDO, sFile);
        end;
      end;
    end else begin
      sSoob:=sSoob+'Обновление справочника организаций СМДО не требуется.'#13#10;
    end;
  end else begin
    sSoob:=sSoob+'Обновление справочника организаций СМДО не найдено.'#13#10;
  end;
  if oUpdate.FDateSprVidDokSMDO>0 then begin
    slPar.Clear;
    dMax:=getMaxCreateDateSpr('smdosprviddok'); // default 'smdosprorg'
    dMax:=Max(dMax, GlobalTask.GetLastValueAsDate('LAST_UPDATE_SPRVIDDOK',false));
    if oUpdate.FDateSprVidDokSMDO>dMax then begin
      slPar.Add('FILE='+oUpdate.FFileSprVidDok);
      oUpdate.FThread:=true;
//      oUpdate.FThread:=false;
      oUpdate.GetFileFTP(true,slPar);
      sFile:=CheckSleshN(oUpdate.FOutputDir)+oUpdate.FFileSprVidDok;
      if sFile<>'' then begin
        RunZagrSprSMDO2(SMDO_SPR_VIDDOK, oUpdate.FDateSprVidDokSMDO, sFile);
//      SMDO.RunLoadSysSpr;
      end;
    end else begin
      sSoob:=sSoob+'Обновление справочника видов документов СМДО не требуется.'#13#10;
    end;
  end else begin
    sSoob:=sSoob+'Обновление справочника видов документов СМДО не найдено.'#13#10;
  end;
  slPar.Free;
  if sSoob<>''
    then AddNotifyProg(fmMain, sSoob, false, true,0,0);
end;
{$ENDIF}

//---------------------------------------------------------
procedure RunUpdateEx(pn:TPanel; nAfter:Integer; slPar:TStringList);
var
  strMessages:String;
  lPath:Boolean;
begin
  if oUpdate=nil
    then oUpdate:=TSynapseObj.Create(pn);
  if oUpdate.FRun>0 then begin // идет процесс !!!
    if oUpdate.FRun=RUN_GETFILE then
      PutError('Выполняется загрузка обновления')
    else if oUpdate.FRun=RUN_CHECK then
      PutError('Выполняется проверка обновления');
    exit;
  end;
  oUpdate.FMessages:='';
  oUpdate.FTypeServer:=0;
  oUpdate.FThread:=false;
  oUpdate.FCheckMessages:=false;
  if oUpdate.GetFileFTP(true, slPar) then begin
    oUpdate.RunFileFTP(nAfter);
  end else begin
    if oUpdate.FError<>''
      then PutError(oUpdate.FError);
  end;
  if oUpdate.FMessages<>''
    then CheckMessagesProg(oUpdate.FMessages);
end;
//---------------------------------------------
procedure RunLoadSysSpr(pn:TPanel);
var
  slPar:TStringList;
begin
  if Problem('Скачать обновление системных справочников ?') then begin
    slPar:=TStringList.Create;
    slPar.Add('FILE=UpdateSysSpr.exe');
    slPar.Add('TYPE=setup');
    RunUpdateEx(pn, 1, slPar);
    slPar.Free;
  end;
end;
//---------------------------------------------
procedure RunLoadSetupProg(pn:TPanel);
var
  slPar:TStringList;
begin
  if Problem('Скачать установку программы ?') then begin
    slPar:=TStringList.Create;
    slPar.Add('FILE='+NAME_SETUP_PROG);
    slPar.Add('TYPE=setup');
    RunUpdateEx(pn, 2, slPar);
    slPar.Free;
  end;
end;

{$ENDIF}

//---------------------------------------------------------
function CheckUpdate(IdFTP:TIdFTP; lRun:Boolean; lShow:Boolean; nTypeServer:Integer; lCheck:Boolean; var strMessages:String; var lPath:Boolean):String;
// !!! переделать strFileUpdate на strMessages  для чтения сообщений для пользователя !!!
var
  n,n1,n2,m,nn,nCurUpdate,FileAttrs,nUpdate,nCur:Integer;
  strFile,s,ss,strDir,strDirUpdate,strFileUpdate:String;
  VerInfo:TVerInfo;
  sr:TSearchRec;
  lCheckMessages, lMessages, lOk:Boolean;
begin
  Result:='';
  lMessages:=false;
  lCheckMessages:=(strMessages='?');   // проверять сообщения для пользователя
  strMessages:='';
  strFileUpdate:='';
  nUpdate:=0;
  lPath:=false;
  if RunFTP then begin
    PutError('Идет процесс... Повторите позже.');
    exit;
  end;
  if GlobalTask.ParamAsBoolean('CHECK_UPDATE') or lCheck then begin
    try
      VerInfo:=TVerInfo.Create(Application.ExeName);
      nCurUpdate:=StrToIntDef(VerInfo.Build,0);
      VerInfo.Free;
    except
      nCurUpdate:=0;
    end;
//    lShow:=true;       //для проверки
//    nCurUpdate:=9;   //для проверки

    if nTypeServer=0 then begin
      TypeServerFTP:=GlobalTask.ParamAsInteger('TYPE_UPDATE');   // 1-Брест  2-FTP  10-сетевой путь
    end else begin
      TypeServerFTP:=nTypeServer;   // 1-Брест  2-FTP
    end;
    if TypeServerFTP=0
      then TypeServerFTP:=SERVER_BREST;

    if TypeServerFTP=NET_PATH then begin
      strDir:=Trim(GlobalTask.ParamAsString('PATH_SEEK_UP'));
      if strDir<>'' then begin
        FileAttrs := SysUtils.faReadOnly+SysUtils.faArchive+SysUtils.faAnyFile;	//faDirectory;
        strDir:=CheckSleshN(strDir);
        // NAME_FILE_UPDATE    uTypes.pas
        if FindFirst( strDir+NAME_FILE_UPDATE+'*.exe', FileAttrs, sr) = 0 then begin
          nn:=Length(NAME_FILE_UPDATE)+1;
          ss:=sr.Name;
          while ss<>'' do begin
            m:=LastPos('.',ss);
            if m>0 then begin
              s:=Copy(ss,nn,m-nn);
              try
                nCur:=StrToIntDef(s,0);
              except
                nCur:=0;
              end;
              if (nCurUpdate>0) and (nCur>nCurUpdate) and (nCur>nUpdate) then begin
                nUpdate:=nCur;
                Result:=s;
                strFileUpdate:=ss;
              end;
            end;
            if FindNext(sr)=0  then ss:=sr.Name
                               else ss:='';
          end;
          FindClose(sr);
        end;
      end;
    end else begin
      SetPropertyFPT(IdFTP, TypeServerFTP,'update');
      if not lRun and not lShow and not lCheck then begin
        EnterWorkerThread;
      end;
      try
        if GetFileFTP(IdFTP, lShow, lCheck, '','', false) then begin
          for n:=0 to idFTP.DirectoryListing.Count-1 do begin
            strFile:=idFTP.DirectoryListing.Items[n].FileName;
            ss:=NAME_FILE_UPDATE; //'UPDATELAIS';
            nn:=Length(ss)+1;
            if lCheckMessages and (strFile=FILE_MESSAGES) then begin
              lMessages:=true;
            end;
            if Pos(ss,UpperCase(strFile))>0 then begin
              m:=LastPos('.',strFile);
              if m>0 then begin
                s:=Copy(strFile,nn,m-nn);
                try
                  nUpdate:=StrToIntDef(s,0);
                except
                  nUpdate:=0;
                end;
                if (nCurUpdate>0) and (nUpdate>nCurUpdate) then begin
                  Result:=s;
                  strFileUpdate:=strFile;
                end;
              end;
            end;
          end;
          if lMessages then begin   // может надо прочитать файл с сообщениями
            ss:=NameFromExe(FILE_MESSAGES);
            DeleteFile(ss);
            if GetFileFTP(IdFTP, false, false, FILE_MESSAGES, ExtractFilePath(Application.ExeName), false) then begin
              if FileExists(ss) then begin
                MemoRead(NameFromExe(FILE_MESSAGES), strMessages);
              end;
            end;
          end;

          {
          if Result='' then begin  // обновление не нашли может есть заплатка
            for n:=0 to idFTP.DirectoryListing.Count-1 do begin
              strFile:=idFTP.DirectoryListing.Items[n].FileName;
              ss:=NAME_FILE_PATH; //'PATHLAIS';
              nn:=Length(ss)+1;
              if Pos(ss,UpperCase(strFile))>0 then begin
                m:=LastPos('.',strFile);
                if m>0 then begin
                  s:=Copy(strFile,nn,m-nn);
                  n1:=Pos('-', s);  // для обновлений NNN-MMM (PathLais162-163.exe)
                  try
                    if n1=0 then begin
                      n2:=0;
                      n1:=StrToInt(s);
                    end else begin
                      n2:=StrToInt(copy(s,n1+1,length(s)));
                      n1:=StrToInt(copy(s,1,n1-1));
                    end;
                  except
                    n1:=0;
                    n2:=0;
                  end;
                  if (nCurUpdate>0) and ((n2=0) and (n1=nCurUpdate)) or ((nCurUpdate>=n1) and (nCurUpdate<=n2)) then begin
                    Result:=s;
                    strFileUpdate:=strFile;
                    lPath:=true;
                  end;
                end;
              end;
            end;
          end;
          }
        end else begin
          nUpdate:=-1;
        end;
      finally
        if not lRun and not lShow and not lCheck then begin
          LeaveWorkerThread;
        end;
      end;

    end;
  end;

  //---- выполнить загрузку обновления -----------------------------------------
  if lRun then begin
    if (Result='')  then begin
      if (nUpdate<>-1) and lCheck then begin
        ShowMessage(' Обновление не найдено. ');
      end;
    end else if (Result<>'') then begin
      if lPath then begin
        s:='Доступна заплатка';
        ss:='заплатки';
      end else begin
        s:='Доступно обновление';
        ss:='обновления';
      end;
//      strDirUpdate:=CheckSleshN(GetFolderMyDocument)+'Обновления\';    // CreateTmpPath(0);
      strDirUpdate:=CheckSleshN(ExtractFilePath(Application.ExeName))+'Обновление\';    // CreateTmpPath(0);
      ForceDirectories(strDirUpdate);
      ClearDir(strDirUpdate,false);
      if Problem(s+' № '+Result+'. Загрузить?') then begin  //Доступно обновление
        if TypeServerFTP=NET_PATH then begin
          lOk:=CopyFile(PChar(strDir+strFileUpdate), PChar(strDirUpdate+strFileUpdate), false);
          if not lOk then begin
            PutError('Ошибка копирования файла : '+#13+
                     'откуда :'+strDir+strFileUpdate+#13+
                     'куда   :'+strDirUpdate+strFileUpdate+#13+
                     IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
          end;
        end else begin
          fmMain.CheckVisibleProgress(true,'Загрузка '+ss+':');
          DeleteFile(strDirUpdate+strFileUpdate);
          lOk:=GetFileFTP(IdFTP, false, lCheck, strFileUpdate, strDirUpdate, false);
//          lOk:=GetFileFTP(false, lCheck, strFileUpdate, strDirUpdate, false);
          fmMain.CheckVisibleProgress(false,'');
        end;
        if lOk then begin
          if Problem('Загрузка завершена. Установить? ') then begin
            WinExec(PChar(strDirUpdate+strFileUpdate), SW_SHOWNORMAL);
            if lPath
              then ShowMessage('Изменение вступят в силу после перезапуска программы !')
              else Application.Terminate;
          end else begin
            ShellExecute(Application.Handle, PChar('explore'), PChar(strDirUpdate), nil, nil, SW_SHOWNORMAL);
          end;
        end;
      end;
    end;
  end;
end;
{$ENDIF}

//--------------------------------------------------
procedure CheckMessagesProg(sMessages:String);
var
  arr,arrS,arrT:TArrStrings;
  i,j,m, nID:Integer;
  nWidth, nHeight:Integer;
  sADD,sText,sOrg,sPar,sName:String;
  lSQL,lAdd,lOrg,l:Boolean;
  sl:TStringList;
begin
  if sMessages=''
    then sMessages:=MessagesProg;
  if sMessages<>'' then begin
    nWidth:=0;
    nHeight:=0;
    sl:=TStringList.Create;
    StrToArr(sMessages,arr,#13#10,true);
    for i:=0 to Length(arr)-1 do begin
      if Copy(arr[i],1,3)='MSG' then begin
        StrToArr(arr[i],arrS,'~',true);
        sPar:='';
        lSQL:=false;
        lOrg:=true;
        lAdd:=false;
        sAdd:='';
        nID:=0;
        for j:=0 to Length(arrS)-1 do begin
          if Copy(arrS[j],1,4)='MSG=' then begin
            nID:=StrToIntDef(Copy(arrS[j],5,100),0);
            if dmBase.tbSimplePropMemo.Active and (nID>0) then begin
              if not dmBase.tbSimplePropMemo.Locate('TYPEOBJ;ID', VarArrayOf([_TypeObj_Messages, nID]),[]) then begin
                lAdd:=true;
              end else begin
                nID:=0;
              end;
            end else begin
              nID:=0;
            end;
          end else if Copy(arrS[j],1,2)='W=' then begin
            nWidth:=Max(nWidth, Max(StrToIntDef(Copy(arrS[j],3,10),0),MIN_WIDTH_NOTIFY));
          end else if Copy(arrS[j],1,2)='H=' then begin
            nHeight:=Max(nHeight, Max(StrToIntDef(Copy(arrS[j],3,10),0),MIN_HEIGHT_NOTIFY));
          end else if Copy(arrS[j],1,4)='ORG=' then begin
            {$IFDEF SMDO}
              if SMDO=nil then begin
                lOrg:=false;
              end else begin
                sOrg:=Copy(arrS[j],5,100);
                if (sOrg<>'') and not MySameText(sOrg, SMDO.getKodSMDO) then begin
                  lOrg:=false;
                end;
              end;
           {$ENDIF}
          end else if Copy(arrS[j],1,4)='PAR=' then begin
            sPar:=Trim(Copy(arrS[j],5,20));
            sAdd:='PAR_';
          end else if Copy(arrS[j],1,4)='SQL=' then begin
            lSQL:=true; //
            sName:=Copy(arrS[j],5,200);
            sAdd:='SQL_';
          end else begin
            sText:=Trim(arrS[j]);
          end;
        end;
        if lOrg and (nID>0) and (sText<>'') then begin
          if sPar<>'' then begin // корректируем параметр
            GlobalTask.WriteParamAsString(sPar,sText);
            GlobalTask.SaveParameters;
          end else if lSQL then begin // выполняем SQL
            OpenMessage(sName+' ...  ','');
            l:=false;
            try
//              sleep(3000);
              dmBase.AdsConnection.Execute(sText);
            except
              on E:Exception do begin
                l:=true;
                CloseMessage;
                PutError('Ошибка выроднения SQL:'+Chr(13)+Chr(10)+E.Message);
              end;
            end;
            if not l then CloseMessage;
          end else begin
            StrToArr(sText,arrT,'#13#10',true);
            for m:=0 to Length(arrT)-1 do begin
              sl.Add(arrT[m]);
            end;
          end;
          if lAdd then begin
            with dmBase.tbSimplePropMemo do begin
              Append;
              FieldByName('TYPEOBJ').AsInteger:=_TypeObj_Messages;
              FieldByName('ID').AsInteger:=nID;
              FieldByName('DATES').AsDateTime:=Date;
              FieldByName('POKAZ').AsString:=sAdd+'MESSAGE';
              FieldByName('VALUE').AsString:=sText;
              Post;
            end;
          end;
        end;
      end else begin
        StrToArr(arr[i],arrS,'#13#10',true);
        for j:=0 to Length(arrS)-1 do begin
          sl.Add(arrS[j]);
        end;
      end;
    end;
    if sl.Count>0 then begin
      for i:=0 to sl.Count-1 do begin
        AddNotifyProg(fmMain, sl.Strings[i], false, true, nWidth, nHeight);
      end;
    end;
    sl.Free;
  end;
end;

//--------------------------------------------------
initialization
  MessagesProg:='';
  LastErrorFTP:='';
  Global_TimeOut_BeforePost:=0;
  SetLength(CurRecDok,0);

  {$IFDEF HUNSPELL}
    HunSpell:=nil;
    HunSpellDialog:=nil;
  {$ENDIF}

  slWorkDataSet:=TStringList.Create;

  IsActiveGISUN:=false;
  IsActiveWorkATE:=false;
  IsActiveSubMenuGISUN:=true;

  CurGridMens:=nil;

  FGlobalFilterPunkt:='';

  EnableReport := false;
  SystemProg := TSystemProg.Create;
  NameCurGurnal:='';
  strRes:=nil;
  MRUList_NameM := nil;
  MRUList_OtchM := nil;
  MRUList_NameG := nil;
  MRUList_OtchG := nil;
  MRUName_Punkt := nil;
  MRUName_PunktB:= nil;
  MRU_MKB10:=nil;
  MRUName_Obl := nil;
  MRUName_Rn  := nil;
  MRUName_NP  := nil;
  MRUName_RnGor:= nil;
  MRUName_Obl_B := nil;
  MRUName_Rn_B  := nil;
  MRUName_NP_B  := nil;
  CurListDeti:=dbCreateListDeti;
  CurListDeti.Name:='CurListDeti';
  arrReloadMRUNameR[1]:=true;
  arrReloadMRUNameR[2]:=true;
  arrReloadMRUNameR[3]:=true;
  arrReloadMRUNameR[4]:=true;

//  IniExcel:=nil;
//  IniUserExcel:=nil;
  slExcelReport:=TStringList.Create;

  slCheckATEObl:=TStringList.Create;
  slCheckATERn :=TStringList.Create;

finalization
{$IFDEF HUNSPELL}
  DestroyHunSpell;
{$ENDIF}

  slWorkDataSet.Free;
  FreeAndNil(MRUList_NameM);
  FreeAndNil(MRUList_OtchM);
  FreeAndNil(MRUList_NameG);
  FreeAndNil(MRUList_OtchG);
  FreeAndNil(MRUName_Punkt);
  FreeAndNil(MRUName_PunktB);
  FreeAndNil(MRU_MKB10);
  FreeAndNil(MRUName_Obl);
  FreeAndNil(MRUName_Rn);
  FreeAndNil(MRUName_NP);
  FreeAndNil(MRUName_RnGor);
  FreeAndNil(MRUName_Obl_B);
  FreeAndNil(MRUName_Rn_B);
  FreeAndNil(MRUName_NP_B);
  SystemProg.Free;
  SetLength(arrLines,0);
  FreeAndNil(TkbmMemTable(CurListDeti));
  FreeAndNil(slExcelReport);
  FreeAndNil(slCheckATEObl);
  FreeAndNil(slCheckATERn);
  FreeAndNil(strRes);

//  if IniExcel<>nil
//    then FreeAndNil(IniExcel);
//  if IniUserExcel<>nil
//    then FreeAndNil(IniUserExcel);
end.
