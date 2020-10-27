unit SelLibFR;

interface

{$I Task.inc}

 uses {$IFDEF USE_FR2}FR_Class, {$ENDIF}
      Classes, fMain, dBase, SysUtils, db, MetaTask, FuncPr, FuncEh, dbFunc, uTypes,
      {$IFDEF ADD_MENS_PU} fLichSchet, fMen, dMen, {$ENDIF}
      StrUtils, Dialogs, //fCurDokFR,
       uDate, fSimpleD, uProjectAll, uPadegFIO, uObjectsScript
      {$IFDEF USE_FR3},frxClass {$ENDIF}
      {$IFDEF VER150} ,Variants {$ENDIF}  ;

 const
   {$IFDEF ZAGS}
   NAME_LIB = 'Zags';
   {$ELSE}
   NAME_LIB = 'SelSovet';
   {$ENDIF}
   NAME_LIB_ADRES = '_Адрес';
   NAME_LIB_HOUSE = '_Дом';
   NAME_LIB_MEN = '_Человек';

 type

{$IFDEF USE_FR2}
 TSelFunctionLibrary = class(TfrFunctionLibrary)
 public
   constructor Create; override;
   procedure DoFunction(FNo: Integer; p1, p2, p3: Variant;
                       var val: Variant); override;
 end;
{$ENDIF}

{$IFDEF USE_FR3}
  TScriptObjectsFR3=class(TObject)
  public
//    constructor Create;
    procedure AddScriptClass(frxReport:TfrxReport);
    function CallMethod(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
  end;
{$ENDIF}

  function GetDateFiksReport : TDateTime;
  procedure SetDateFiksReport( d : TDateTime );

{$IFDEF ADD_MENS_PU}
  procedure SetCurFormLich( f : TfmLichSchet );
  function  GetCurFormLich : TfmLichSchet;
  procedure SetCurFormMen( f : TfmMen );
  function  GetCurFormMen : TfmMen;
{$ENDIF}
  procedure SetCurDok( f : TfmSimpleD );
  function  GetCurDok : TfmSimpleD;


implementation

uses ifp_SelSovet,
     {$IFDEF USE_FR3} fs_iinterpreter, {$ENDIF}
     uProject, fGurnal,
     fCheckMens,
     DataTask;

var
  DateFiksReport : TDateTime;
  {$IFDEF ADD_MENS_PU}
  fCurMen : TfmMen;
  fCurLic : TfmLichSchet;
  {$ENDIF}
  fCurDok : TfmSimpleD;

{$IFDEF ADD_MENS_PU}
//--------------------------------------------
procedure SetCurFormLich( f : TfmLichSchet );
begin
  fCurLic := f;
end;
function GetCurFormLich : TfmLichSchet;
begin
  Result:=fCurLic;
end;
//---------------------------------------------
procedure SetCurFormMen( f : TfmMen );
begin
  fCurMen := f;
end;

//---------------------------------------------
function GetCurFormMen : TfmMen;
begin
  Result:=fCurMen;
end;
{$ENDIF}
//--------------------------------------------
function GetCurDok : TfmSimpleD;
begin
  Result := fCurDok;
end;

//--------------------------------------------
procedure SetCurDok( f : TfmSimpleD );
begin
  fCurDok:=f;
  DokZAGS.SetCurDokZAGS( f );
  fmMain.FormCurrentDok:=f;
  if f=nil then begin
    fmMain.SetCurrentDokument(nil);
//    fmCurDokFR.frDBDataSet1:=nil;
//    fmCurDokFR.frDBDataSet2:=nil;
//    fmCurDokFR.frDBDataSet3:=nil;
  end else begin
    fmMain.SetCurrentDokument(f.Dokument);
    fCurDok.TypeObj:=f.TypeObj;   // устанавливается переменная в GlobalTask.FKodCurDok, нужна для смещения в FastReport
//    fmCurDokFR.Dokument:=f.Dokument;
//    fmCurDokFR.frDBDataSet1.DataSet:=fmCurDokFR.Dokument;
    {
    fmCurDokFR.SvidPovtor:=f.SvidPovtor;
    fmCurDokFR.HistZAGS:=f.HistZAGS;
    fmCurDokFR.frDBDataSet1.DataSet:=fmCurDokFR.Dokument;
    fmCurDokFR.frDBDataSet2.DataSet:=fmCurDokFR.SvidPovtor;
    fmCurDokFR.frDBDataSet3.DataSet:=fmCurDokFR.HistZAGS;
    }
//    fmCurDokFR.frDBDataSet4.DataSet:=fmCurDokFR.tbDeti;
  end;
end;

//--------------------------------------------
function GetNameRukZAGS : String;
begin
  Result := fCurDok._getNameRukZAGS;
end;
//--------------------------------------------
function GetNameSpecZAGS : String;
begin
  Result := fCurDok._getNameSpecZAGS;
end;

//-------------------------------------------------
function GetDateFiksReport : TDateTime;
begin
  Result := DateFiksReport;
end;

procedure SetDateFiksReport( d : TDateTime );
begin
  DateFiksReport := d;
end;

//-----------------------------------------------------------------------
function VozrastBel(nCount : Integer; l : Boolean) : String;
var
  s : String;
  i : Integer;
begin
  if (nCount=0) and not l then begin
    Result := '';
    exit;
  end;
  s := IntToStr(nCount);
  if (nCount>4) and (nCount<21) then begin
    Result := s + ' гадоў';
  end else begin
    i := StrToInt(Copy(s,Length(s),1));
    case i of
      1     : Result := s + ' год';
      2,3,4 : Result := s + ' гады';
      0,5,6,7,8,9 : Result := s + ' гадоў';
    end;
  end;
end;

//------------------------------------------------------------
function _RunFuncScript( s : String; p1, p2 : Variant) : Variant;
var
  v : Variant;
  arr : array of Variant;
begin
  v := null;
  if p1 = null then begin
    Globaltask.Script.RunEx(s, [], v);
  end else if p2 = null then begin
    SetLength(arr,1);
    arr[Low(arr)] := p1;
    Globaltask.Script.Run(s, arr, v);
  end else begin  // переданы оба параметра
    SetLength(arr,2);
    arr[0] := p1;
    arr[1] := p2;
    Globaltask.Script.Run(s, arr, v);
  end;
  Result := v;
end;

function SubDateYear(d2,d1 : TDateTime) : Integer;
var
  nYear,nMonth,nDay : Integer;
begin
  SubDate(d2,d1,nYear,nMonth,nDay);
  Result := nYear;
end;
function SubDateMonth(d2,d1 : TDateTime) : Integer;
var
  nYear,nMonth,nDay : Integer;
begin
  SubDate(d2,d1,nYear,nMonth,nDay);
  Result := nMonth;
end;
function SubDateDay(d2,d1 : TDateTime) : Integer;
var
  nYear,nMonth,nDay : Integer;
begin
  SubDate(d2,d1,nYear,nMonth,nDay);
  Result := nDay;
end;

function getUL(nID : Variant) : String;
begin
  if VarIsNull(nID) or (VarToStr(nID)='') or (VarToStr(nID)='0') then begin
    Result := '';
  end else begin
    Result := dmBase.getUL(nID);
  end;
end;

function Men_MestoRogd(lFull:Boolean;nOrder:Integer):String;
begin
 {$IFDEF ADD_MENS_PU}
   Result:=dmBase.GetMestoFromFields(TdmMen(fCurMen.Dokument).mtDokument,';MR_GOSUD;MR_B_OBL;MR_OBL;MR_RAION;MR_B_GOROD;MR_GOROD',lFull,nOrder);
 {$ELSE}
   Result:='';
 {$ENDIF}
end;

function Men_MestoOtkuda(lFull:Boolean;nOrder:Integer):String;
begin
 {$IFDEF ADD_MENS_PU}
   Result:=dmBase.GetMestoFromFields(TdmMen(fCurMen.Dokument).mtDokument,';OP_GOSUD;OP_B_OBL;OP_OBL;OP_RAION;OP_B_GOROD;OP_GOROD',lFull,nOrder);
 {$ELSE}
   Result:='';
 {$ENDIF}
end;

{$IFDEF USE_FR3}

//----------------------------------------------
//     USE   FastReport 4.6
//----------------------------------------------

function CommentFunc(strNameFunc : String) : String;
begin
  if strNameFunc = 'SPRNAMEORG' then
    Result:='Вернуть наименование организации'
  else if strNameFunc = 'SPRNAMEORGR' then
    Result:='Вернуть реальное наименование организации'
  else if strNameFunc = 'NAMEORGR' then
    Result:='Наименование организации'
  else if strNameFunc = 'NAMEORGREX' then
    Result:='Наименование организации'
  else if strNameFunc = 'ONLYRAION_NAME' then
    Result:='Вернуть только наименование района в падеже'
  else if strNameFunc = 'CONCAT_IF2' then
    Result:='Объеденить две строки, если вторая не пусто'
  else if strNameFunc = 'CONCAT_IF1' then
    Result:='Объеденить две строки, если первая не пусто'
  else if strNameFunc = 'CURRENTDATE' then
    Result:='Текущая дата'
  else if strNameFunc = 'MEN_ADRESANDTELEFON' then
    Result:='Адрес и телефон текущего человека'
  else if strNameFunc = 'GETTAILADRES' then
    Result:='Вернуть часть адреса после вызова AdresFromID: OBL,RAION,PUNKT,PUNKTN,PUNKTUL,UL,DOM,DOM2,NDOM,KORP,KV,ETAG,KOL_ETAG,PREDST'
  else if strNameFunc = 'HIST' then
    Result:='История всех значений для поля'
  else if strNameFunc = 'SUBDATEPROPIS' then
    Result:='Разность дат прописью 0-полная,1-только лет,2-только месяцев,3-только дней'
  else if strNameFunc = 'SUBDATEPROPISB' then
    Result:='Разность дат прописью по белорусски 0-полная,1-только лет,2-только месяцев,3-только дней'
  else if strNameFunc = 'SUBDATEYEAR' then
    Result:='В разности дат количество лет'
  else if strNameFunc = 'SUBDATEMONTH' then
    Result:='В разности дат количество месяцев'
  else if strNameFunc = 'SUBDATEDAY' then
    Result:='В разности дат количество дней'
  else if strNameFunc = 'IDPROG' then
    Result:='"SELSOVET","ZAGS","GKH","OCHERED"'
  else if strNameFunc = 'IDPROG1' then
    Result:='"S","Z","G","O"';
end;

type

  TSelSovetFunctions = class(TfsRTTIModule)
  private
    function CallMethod(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
    function CallMethod2(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
    function CallMethod_Lic(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
    function CallMethod_Adres(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
    function CallMethod_Men(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
    function CallMethod_ReshOchMen(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
  public
    constructor Create(AScript: TfsScript); override;
  end;


{ TSelSovetFunctions }
constructor TSelSovetFunctions.Create;
var
 fsMen,fsLic,fsAdres,fsReshOchMen:TfsClassVariable;
begin
{
    AddConst('crFormat', 'Integer', crFormat);
    AddEnum('TfrxStretchMode', 'smDontStretch, smActualHeight, smMaxHeight');
    AddEnumSet('TfrxFrameTypes', 'ftLeft, ftRight, ftTop, ftBottom');
}
  inherited Create(AScript);

  AScript.AddConst('OCH_RESH_POST', 'Integer', OCH_RESH_POST);
  AScript.AddConst('OCH_RESH_SN', 'Integer', OCH_RESH_SN);
  AScript.AddConst('OCH_RESH_RAZD', 'Integer', OCH_RESH_RAZD);
  AScript.AddConst('OCH_RESH_UNION', 'Integer', OCH_RESH_UNION);
  AScript.AddConst('OCH_RESH_PERE', 'Integer', OCH_RESH_PERE);

  AScript.AddConst('OCH_TYPE_OBSH', 'Integer', OCH_TYPE_OBSH);

  AScript.AddConst('OCH_OSN_FULL', 'Integer', OCH_OSN_FULL);
  AScript.AddConst('OCH_OSN_KRAT', 'Integer', OCH_OSN_KRAT);
  AScript.AddConst('OCH_OSN_UKAZ', 'Integer', OCH_OSN_UKAZ);
  AScript.AddConst('OCH_OSN_POLOG', 'Integer', OCH_OSN_POLOG);
  AScript.AddConst('OCH_OSN_PUNKT', 'Integer', OCH_OSN_PUNKT);

  AScript.AddConst('OWNER_NASEL', 'Integer', OWNER_NASEL);
  AScript.AddConst('OWNER_ORG', 'Integer', OWNER_ORG);

  with AScript do begin
    AddConst('_TypeObj_Nasel', 'Integer', _TypeObj_Nasel);
    AddConst('_TypeObj_Lich', 'Integer', _TypeObj_Lich);
    AddConst('_TypeObj_Adres', 'Integer', _TypeObj_Adres);
    AddConst('_TypeObj_Passport', 'Integer',_TypeObj_Passport);
    AddConst('_TypeObj_Owners', 'Integer',_TypeObj_Owners);
    AddConst('_TypeObj_BigHouse', 'Integer',_TypeObj_BigHouse);
    AddConst('_TypeObj_TalonPrib', 'Integer',_TypeObj_TalonPrib);
    AddConst('_TypeObj_TalonUbit', 'Integer',_TypeObj_TalonUbit);

    AddConst('_TypeObj_ZRogd', 'Integer', _TypeObj_ZRogd);
    AddConst('_TypeObj_ZBrak', 'Integer', _TypeObj_ZBrak);
    AddConst('_TypeObj_ZSmert', 'Integer', _TypeObj_ZSmert);
    AddConst('_TypeObj_ZUstOtc', 'Integer', _TypeObj_ZUstOtc);
    AddConst('_TypeObj_ZUstMat', 'Integer', _TypeObj_ZUstMat);
    AddConst('_TypeObj_ZChName', 'Integer', _TypeObj_ZChName);
    AddConst('_TypeObj_ZRast', 'Integer', _TypeObj_ZRast);
    AddConst('_TypeObj_ZAdopt', 'Integer', _TypeObj_ZAdopt);
    AddConst('_TypeObj_DBrak', 'Integer', _TypeObj_DBrak);
    AddConst('_TypeObj_DRast', 'Integer', _TypeObj_DRast);

    AddConst('_TypeObj_AktZah', 'Integer', _TypeObj_AktZAH);
    AddConst('_TypeObj_Opeka', 'Integer', _TypeObj_Opeka);
    AddConst('_TypeObj_SMDOPost', 'Integer', _TypeObj_SMDOPost);
  end;
  //  OCH_TYPE_ANY_OTD=1000; // любая отдельная

  fsReshOchMen:=AScript.AddClass(TReshOchMen,'TReshOchMen');

  with fsReshOchMen do begin
    AddMethod('procedure Clear;', CallMethod_ReshOchMen);
    AddMethod('function MenID:Integer;', CallMethod_ReshOchMen);
    AddMethod('function AutoID:Integer;', CallMethod_ReshOchMen);
    AddMethod('function NameList(nType:Integer; sPadeg:String):String;', CallMethod_ReshOchMen);
    AddMethod('function NameOch(nType:Integer; sPadeg:String):String;', CallMethod_ReshOchMen);
    AddMethod('function Ochered_ID:Integer;', CallMethod_ReshOchMen);
    AddMethod('function Otkaz:Boolean;', CallMethod_ReshOchMen);
    AddMethod('function Tip:Integer;', CallMethod_ReshOchMen);
    AddMethod('function Prov:Boolean;', CallMethod_ReshOchMen);
    AddMethod('function Razdel:Boolean;', CallMethod_ReshOchMen);
    AddMethod('function DateR:TDateTime;', CallMethod_ReshOchMen);
    AddMethod('function DateSila:TDateTime;', CallMethod_ReshOchMen);
    AddMethod('function DateSilaResh:TDateTime;', CallMethod_ReshOchMen);
    AddMethod('procedure SetDateR(d:TDateTime);', CallMethod_ReshOchMen);
    AddMethod('procedure SetDateSila(d:TDateTime);', CallMethod_ReshOchMen);
    AddMethod('procedure SetNomer(s:String);', CallMethod_ReshOchMen);
    AddMethod('function Nomer:String;', CallMethod_ReshOchMen);
    AddMethod('function Osnov:Integer;', CallMethod_ReshOchMen);
    AddMethod('function OsnovText:String;', CallMethod_ReshOchMen);
    AddMethod('function Osnov2:Integer;', CallMethod_ReshOchMen);
    AddMethod('function OsnovText2:String;', CallMethod_ReshOchMen);
    AddMethod('function GetTextOsnov(nTypeResult:Integer;lAddInfo:Boolean):String;', CallMethod_ReshOchMen);
    AddMethod('function ID1:Integer;', CallMethod_ReshOchMen);
    AddMethod('function ID2:Integer;', CallMethod_ReshOchMen);
    AddMethod('function TextResh:String;', CallMethod_ReshOchMen);
    AddMethod('function TextVipis:String;', CallMethod_ReshOchMen);
    AddMethod('function Text(lVipis:Boolean):String;', CallMethod_ReshOchMen);
    AddMethod('function CheckFieldsInText(sText:String;nTypeDatePropis:Integer):String;', CallMethod_ReshOchMen);
    AddMethod('function AddInfo:String;', CallMethod_ReshOchMen);
  end;

  with AScript do begin

    AddMethod('function ReshIsPostanovka(nTip:Integer):Boolean;', CallMethod, NAME_LIB, 'Тип решение "ТИПА" постановка');
//    AddMethod('function PensVozrG:Integer;', CallMethod, NAME_LIB, 'Пенсионный возраст женщин');
//    AddMethod('function PensVozrM:Integer;', CallMethod, NAME_LIB, 'Пенсионный возраст женщин');
    AddMethod('function Trud(DateC:TDateTime; DateR:TDateTime; sPOL:String): Integer;', CallMethod, NAME_LIB, 'Человек пенсионер ? (пол, возраст)');

    AddMethod('function ZH_GetNamePunkt(sDS:String; sPar:String; nType:Integer):String;', CallMethod, NAME_LIB, 'Вернуть название нас.пункта захоронения');

    AddMethod('function NameOtdOch(n:Integer; lKrat:Boolean):String;', CallMethod, NAME_LIB, 'Навание очереди');

    AddMethod('function PropCurGurnal(sName:String; vDef:Variant):Variant;', CallMethod, NAME_LIB, 'Вернуть свойство текущего журнала ');
    AddMethod('function LoadSQL(sSQL:String):String', CallMethod, NAME_LIB, 'Загрузить SQL из файла папки SQL м.б.: name_sql или name_sql|section ');
    AddMethod('function GetSQLFromStr(strSQL:String; strSect):String', CallMethod, NAME_LIB, 'Загрузить часть SQL (strSect) из строки strSQL');
    AddMethod('function NameTableFromTypeObj(nTypeObj:Integer):String', CallMethod, NAME_LIB, '');
    AddMethod('function CheckDateFiksSQL(sSQL:String; d:TDateTime):String', CallMethod, NAME_LIB, 'заменить &datefiks& на дату');
    AddMethod('function CheckParamsSQL(sSQL:String):String', CallMethod, NAME_LIB, 'заменить &typeobj_lic&,&typeobj_nasel&,&typeobj_adres&,&pensm&,&pensg& на реальные значения');
    AddMethod('function ListMensLic(strLicID:String; nIDFirst:Integer; strType:String; strParAdd:String; strDelim:String):String',CallMethod, NAME_LIB, 'сформировать список людей лицевого счета');
//    AddMethod('function LgotMen(strID:String; strDelim:String): String;',CallMethod, NAME_LIB, 'сформировать строку со льготами человека');

    AddMethod('function CountMens(strLicID:String; strType:String; slPar:TStringList): Integer;', CallMethod, NAME_LIB, '');
    AddMethod('function LastSvidPovtor(nTypeDok:Integer; strID:Integer; strFormat:String) : String;', CallMethod, NAME_LIB, 'последнее выданное повторное свидетельство');

    AddMethod('function GetNomerDom(strDom : String; nType:Integer) : String;', CallMethod, NAME_LIB, 'вернуть преобразованный номер дома');
    AddMethod('function GetNomerDomEx(strDom : String; nType:Integer) : String;', CallMethod, NAME_LIB, 'вернуть преобразованный номер дома');

    AddMethod('function IsPrazdnik(dDate:TDateTime):Boolean', CallMethod, NAME_LIB, 'Дата - праздничный день ');

    AddMethod('function PrintDeclDok(nTypeObj:Integer):Boolean;', CallMethod, NAME_LIB, 'Печать в заявлении документа заявителя');

    AddMethod('procedure SetDateFiks(dDate:TDateTime)', CallMethod, NAME_LIB, 'Установить DateFiks для отчета');
    AddMethod('function GetDateFiks:TDateTime', CallMethod, NAME_LIB, 'Вернуть DateFiks для отчета');
    AddMethod('function AdresFromId(nID:Integer;lNameNotDom:Boolean):String', CallMethod, NAME_LIB_ADRES, 'Адрес из Id');
    AddMethod('function AdresFromIDEx(DateFiks : TDateTime; strID : String; lNameIsNotDom:Boolean; lOnlyText:Boolean) : String;', CallMethod, NAME_LIB_ADRES, 'Адрес из Id');

    AddMethod('function Name_Tail:String', CallMethod, NAME_LIB_ADRES, 'Название для части(доли) владения');


    AddMethod('function HouseLic(nIDAdres:Integer):String', CallMethod, NAME_LIB_ADRES, 'Список лицевых счетов на адресе');
    AddMethod('function HouseOwners(nIDAdres:Integer; nType:Integer):String', CallMethod, NAME_LIB_ADRES, 'Список собственников адреса');

    AddMethod('function ReadProperty(nID:Integer;sProp:String):String', CallMethod, NAME_LIB, 'Прочитать свойство объекта');
    AddMethod('function dbGetMen(DateFiks:TDateTime; strID:String): TDataSet', CallMethod, NAME_LIB, 'Вернуть DataSet человека');
    AddMethod('function CurrentSost:TDateTime', CallMethod, NAME_LIB, 'Вернуть дату 30.12.1899');

    AddMethod('function RunFuncScript(sNameFunc:String):Variant', CallMethod, NAME_LIB, 'Выполнить функцию скрипта');  // 5
    AddMethod('function RunFuncScriptEx(sNameFunc:String; p:array of Variant):Variant', CallMethod, NAME_LIB, 'Выполнить функцию скрипта с параметрами');  // 5

    AddMethod('function DateFiksReal:TDateTime', CallMethod, NAME_LIB, 'Вернуть дату фиксации рельную');
    AddMethod('function GetCountYear(d1,d2:TDateTime):Integer', CallMethod, NAME_LIB, 'Вернуть количество полных лет');
    AddMethod('function Raion_Name(sPader:String):String', CallMethod, NAME_LIB, 'Вернуть наименование района в падеже');
    AddMethod('function Obl_Name(sPader:String):String', CallMethod, NAME_LIB, 'Вернуть наименование области в падеже');
    AddMethod('function GetNameTerr(strSOATO:String; lObl:Boolean; lRnGor:Boolean; lCheckPunkt:Boolean) : String', CallMethod, NAME_LIB, '');
    AddMethod('function GetVozrast(iCount:Integer):String', CallMethod, NAME_LIB, 'Возраст в строку');        // 10
    AddMethod('function GetVozrastEx(iCount:Integer;lShowEmpty:Boolean):String', CallMethod, NAME_LIB, 'Возраст в строку');        // 10
    AddMethod('function GetHistory(nTypeObj:Integer;nID:Integer;sField:String;nType:Integer;sRazd:String):String', CallMethod, NAME_LIB, 'Вернуть историю из базы');        // 10
    AddMethod('function GetPadeg(sStr,sPadeg:String):String', CallMethod, NAME_LIB, 'Вернуть строку в падеже');
    AddMethod('function Adres_Punkt:String', CallMethod, NAME_LIB_ADRES, 'Вернуть назв.пункта после AdresFromID');
    AddMethod('function Adres_UL:String', CallMethod, NAME_LIB_ADRES, 'Вернуть назв.улицы после AdresFromID');
    AddMethod('function Adres_Dom:String', CallMethod, NAME_LIB_ADRES, 'Вернуть дом после AdresFromID');
    AddMethod('function Adres_NDom:String', CallMethod, NAME_LIB_ADRES, 'Вернуть дом после AdresFromID');
    AddMethod('function Adres_Korp:String', CallMethod, NAME_LIB_ADRES, 'Вернуть корпус после AdresFromID');              // 15
    AddMethod('function Adres_Kv:String', CallMethod, NAME_LIB_ADRES, 'Вернуть квартиру после AdresFromID');  // 16
    AddMethod('function Adres_NameHouse:String', CallMethod, NAME_LIB_ADRES, 'Вернуть название строения после AdresFromID');
    AddMethod('function Adres_NotDom:Boolean', CallMethod, NAME_LIB_ADRES, 'Адрес без номера дома после AdresFromID');
    AddMethod('function Adres_Result:String', CallMethod, NAME_LIB_ADRES, 'Полный адрес после AdresFromID');  // 16
    AddMethod('function Adres_PunktUl:String', CallMethod, NAME_LIB_ADRES, ' после AdresFromID');  // 16

    AddMethod('function Adres_Control:String', CallMethod, NAME_LIB_ADRES, 'Находиться в ведении после AdresFromID');
    AddMethod('function Adres_UseGilfond:String', CallMethod, NAME_LIB_ADRES, 'Эксплуат. жилфонд после AdresFromID');

//    Add('GETTAILADRES');
//    Add('ADRESPROPISMEN');

    AddMethod('function dbLastDvigMen(idMen:Integer; sType:String):String', CallMethod, NAME_LIB_MEN, '(из базы)Последнее значение списка движений sType="Д-дата М-место П-причина"');
    AddMethod('function dbGetMenPasp( DateFiks : TDateTime; strID : String; nType:Integer): String', CallMethod, NAME_LIB_MEN, '(из базы)Паспортные данные человека');
    AddMethod('function dbGetMenPaspV(UdostKod:Integer; Seria,Nomer,Organ,LichNomer : String;  DateV : TDateTime; nType:Integer): String', CallMethod, NAME_LIB_MEN, 'Собрать паспортные данные');

    AddMethod('function LastDvigMen(idMen:Integer):String', CallMethod, NAME_LIB_MEN, 'Последнее значение списка движений');
    AddMethod('function DvigMenToStr(strRazd:String):String', CallMethod, NAME_LIB_MEN, 'Миграцию человека в строку с разделителем strRazd');
    AddMethod('function NameOrg():String', CallMethod, NAME_LIB, CommentFunc('NAMEORG') );
    AddMethod('function NameOrgEx(sPar1,sPar2:String):String', CallMethod, NAME_LIB, CommentFunc('NAMEORGEX') );
    AddMethod('function SprNameOrg(nID:Integer; sType:String; sPadeg:String):String', CallMethod, NAME_LIB, CommentFunc('SPRNAMEORG') );
    AddMethod('function SprNameOrgR( nID:Integer; sType:String; sPadeg:String ) : String', CallMethod, NAME_LIB, CommentFunc('SPRNAMEORGR') );

    AddMethod('function GetNomerEkz : Integer', CallMethod, NAME_LIB, CommentFunc('GETNOMEREKZ') );
    AddMethod('procedure Report_SetCountEkz(nCount:Ineteger)', CallMethod, NAME_LIB, CommentFunc('REPORT_SETCOUNTEKZ') );
    AddMethod('procedure Report_SetDuplexMode(sMode:String)', CallMethod, NAME_LIB, CommentFunc('REPORT_SETDUPLEXMODE') );

    AddMethod('function GetReportID:Integer', CallMethod, NAME_LIB, '' );
    AddMethod('procedure SetReportID(nID:Integer)', CallMethod, NAME_LIB, '' );

    AddMethod('function SostavSemToStr(nID:Integer; strType:String; strRazd:String): String;', CallMethod, NAME_LIB, '' );
    AddMethod('function GetReshOch(nIDResh:Integer): TReshOchMen;', CallMethod, NAME_LIB, '' );

    AddMethod('function OnlyRaion_Name : String', CallMethod, NAME_LIB, CommentFunc('ONLYRAION_NAME') );
    AddMethod('function Concat_IF2(s1,s2 : String) : String', CallMethod, NAME_LIB, CommentFunc('CONCAT_IF2'));
    AddMethod('function Concat_IF1(s1,s2 : String) : String', CallMethod, NAME_LIB, CommentFunc('CONCAT_IF1'));
    AddMethod('function CurrentDate:TDateTime', CallMethod, NAME_LIB, CommentFunc('CURRENTDATE'));
    AddMethod('function Men_AdresAndTelefon : String', CallMethod, NAME_LIB_MEN, CommentFunc('MEN_ADRESANDTELEFON'));
    AddMethod('function GetTailAdres(sType:String) : String', CallMethod, NAME_LIB_ADRES, CommentFunc('GETTAILADRES'));

    AddMethod('function ActiveON:Boolean', CallMethod, NAME_LIB, 'стоим на поле ON_');
    AddMethod('function OnlySvid:Boolean', CallMethod, NAME_LIB, 'текущий документ в режиме выписки "только свидетельство" ');
    AddMethod('function CondIN(sFldIN:String):String', CallMethod, NAME_LIB, 'вернуть ИН или пусто учитывая значение поля TYPEMESSAGE');

    AddMethod('function Men_MestoRogd(lFull:Boolean;nOrder:Integer):String', CallMethod, NAME_LIB, '');
    AddMethod('function Men_MestoOtkuda(lFull:Boolean;nOrder:Integer):String', CallMethod, NAME_LIB, '');

    AddMethod('function Hist(sNameField:String):String', CallMethod, NAME_LIB, CommentFunc('HIST'));
    AddMethod('function HistEx(sNameField:String;strAddStr:String):String', CallMethod, NAME_LIB, CommentFunc('HIST'));
    AddMethod('function GetDaysPropis( dDate:TDateTime; sLang:String ): String', CallMethod, NAME_LIB, 'Количество дней прописью');
    AddMethod('function GetMonthPropis(dDate:TDateTime; sLang:String): String', CallMethod, NAME_LIB, 'Месяц прописью');  // 20
    AddMethod('function GetYearPropis(dDate:TDateTime; sLang:String): String', CallMethod, NAME_LIB, 'Год прописью');
    AddMethod('function SubDatePropis(dDate1, dDate2:TDateTime; nType:Integer): String', CallMethod, NAME_LIB, CommentFunc('SUBDATEPROPIS'));

    AddMethod('function SubDateYear(dDate1,dDate2:TDateTime):Integer', CallMethod, NAME_LIB, CommentFunc('SUBDATEYEAR'));   // 31
    AddMethod('function SubDateMonth(dDate1,dDate2:TDateTime):String', CallMethod, NAME_LIB, CommentFunc('SUBDATEMONTH'));
    AddMethod('function SubDateDay(dDate1,dDate2:TDateTime):String', CallMethod, NAME_LIB, CommentFunc('SUBDATEDAY'));
    AddMethod('function IdProg:String', CallMethod, NAME_LIB, CommentFunc('IDPROG'));
    AddMethod('function IdProg1:String', CallMethod, NAME_LIB, CommentFunc('IDPROG1'));
    AddMethod('function IsGorSovet:Boolean', CallMethod, NAME_LIB, 'Городской совет или нет');
    AddMethod('function GetOtmetka(s:String; sl:TStringList):Integer', CallMethod, NAME_LIB, 'Вернуть поле разобранное через символ "#"');
    AddMethod('function TypeRS(nTypeObj:Integer):Integer', CallMethod, NAME_LIB, 'Параметр регистра свидетельств 1-не изменять,2-верхний рег.,3-нижний рег.');
    AddMethod('function RS(v:Variant;nTypeObj:Integer):Variant', CallMethod, NAME_LIB, 'Перевести строку в соот. с параметром регистра свидетельств');

    AddMethod('function TypeRSF(nTypeObj:Integer):Integer', CallMethod, NAME_LIB, 'Параметр регистра свидетельств для ФИО 1-не изменять,2-верхний рег.,3-нижний рег.');
    AddMethod('function RSF(v:Variant;nTypeObj:Integer):Variant', CallMethod, NAME_LIB, 'Перевести строку в соот. с параметром регистра свидетельств для ФИО ');
    AddMethod('function AddWhereCurIdBase(sWhere:String; cAl:String):String', CallMethod, NAME_LIB, 'обработать WHERE с учетом значения ID_BASE');

    AddMethod('function GetGrag(sField:String; sRazd:String):String', CallMethod, NAME_LIB_ADRES, 'Вернуть гражданство');
    AddMethod('function GetNation(sField:String; sFieldName:String):String', CallMethod, NAME_LIB_ADRES, 'Вернуть для sField национальность sFieldName');
    AddMethod('function GetBelNazv(nType:Integer;lSelect:Boolean;sNameR:String):String', CallMethod, NAME_LIB, 'Перевести название на белорусский: 1-обл,2-р-н,3-пункт');
    AddMethod('function GetMestoZAH(ds:TDataSet; sParam:String; nType:Integer):String', CallMethod, NAME_LIB_ADRES, 'Место захоронения (кладбище,участок,ряд,могила)');
    AddMethod('function GetMestoZAH2(sDataSet,sParam:String;nType:Integer):String', CallMethod, NAME_LIB_ADRES, 'Место захоронения (кладбище,участок,ряд,могила)');
    AddMethod('function AdresIsUpper:Boolean', CallMethod, NAME_LIB_ADRES, 'Последний адрес из GetAdresAkt в верхнем регистре');
    AddMethod('function GetAdresAkt(sDataSet,sParam:String;nType:Integer):String', CallMethod, NAME_LIB_ADRES, 'Создать адрес для реквизитов актовой записи');
    AddMethod('function GetAdresAkt2(sDataSet, sParam: String; nType: Integer):String', CallMethod, NAME_LIB_ADRES, 'Создать адрес для реквизитов актовой записи (сокращенный)');
    AddMethod('function GetAdresCurDok(sParam:String;nType:Integer):String', CallMethod, NAME_LIB_ADRES, 'Создать адрес для реквизитов текущего документа записи (с печатью страны и области)');
    AddMethod('function GetAdresCurDok2(sParam: String; nType: Integer):String', CallMethod, NAME_LIB_ADRES, 'Создать адрес для реквизитов текущего документа (страна и область в зависимости от текущих параметров');
    AddMethod('function GetSOATOAkt(sDataSet,sParam:String;lCheckSel:Boolean,nType:Integer) : String;', CallMethod, NAME_LIB, 'Сформировать код СОАТО (сокращенный)');

    AddMethod('function UP(s:String):String', CallMethod, NAME_LIB_ADRES, 'Перевод в верхний регистр в зависимомти от параметра');
    AddMethod('function UPF(s:String):String', CallMethod, NAME_LIB_ADRES, 'Перевод в верхний регистр ФИО в зависимомти от параметра');
    AddMethod('function FU(s:String):String', CallMethod, NAME_LIB_MEN, 'только первый символ вверх');      //

    AddMethod('function CE(sValue:String):String', CallMethod, NAME_LIB, 'Если выражение пустое то вернуть параметр: "Пустое значение для актовой записи"');
    AddMethod('function CEE(sValue:String):String', CallMethod, NAME_LIB, 'Если выражение условнр пустое (CE) то вернуть пусто');
    AddMethod('function GetSQLVozrast(sLastField,sFirstField:String):String', CallMethod, NAME_LIB, 'Вернуть SQL выражение для расчета возраста');        // 40

    AddMethod('function GetPadegFIO(sFIO,sPol,sPadeg:String):String', CallMethod, NAME_LIB_MEN, 'Вернуть ФИО в падеже');      // 41
    AddMethod('function GetPadegFIO3(sF,sI,sO,sPol,sPadeg:String):String', CallMethod, NAME_LIB_MEN, 'Вернуть ФИО в падеже');      // 41

    AddMethod('function FirstCharUpper(s:String):String', CallMethod, NAME_LIB_MEN, 'первую символ строки в верхний регистр');
    AddMethod('function FirstUpper(s:String):String', CallMethod, NAME_LIB_MEN, 'первую букву каждого слова в верхний регистр');

    AddMethod('function GetFieldAkt(sFieldName:String;vIsNull:Variant):Variant', CallMethod, NAME_LIB, 'Вернуть значение поля акта');
    AddMethod('function NameBlankFromType(nType:Integer):String', CallMethod, NAME_LIB, 'Символьное значение типа бланка для ЗАГС');
    AddMethod('function Dolg_Ruk_Zags:String', CallMethod, NAME_LIB, 'Должность руководителя ЗАГС');
    AddMethod('function Dolg_Spec_Zags:String', CallMethod, NAME_LIB, 'Должность специлиста ЗАГС');                // 45
    AddMethod('function GetSP_J(strSP:String; dateSP:TDateTime):String', CallMethod, NAME_LIB, 'Вернуть специальноы сведения J');

    AddMethod('function SubDatePropisB(dDate1, dDate2:TDateTime; nType:Integer) : String', CallMethod, NAME_LIB, CommentFunc('SUBDATEPROPISB'));
    AddMethod('function Adres_Gorod : String', CallMethod, NAME_LIB_ADRES, 'Вернуть назв.города после AdresFromID');
    AddMethod('function Adres_Selo : String', CallMethod, NAME_LIB_ADRES, 'Вернуть назв.села после AdresFromID');
    AddMethod('function Adres_IsGorod : Boolean', CallMethod, NAME_LIB_ADRES, 'Если назв.пункта - город, после AdresFromID');
    AddMethod('function GetHistPrSmert : String', CallMethod, NAME_LIB_ADRES, 'Историческое значение причины смерти');
    AddMethod('function GetHistPrSmertEx(strParam:String) : String', CallMethod, NAME_LIB_ADRES, 'Историческое значение причины смерти');
    AddMethod('function GetPrSmert(lAddKod:Boolean) : String', CallMethod, NAME_LIB, 'Вернуть название причины смерти');
    AddMethod('function GetPrSmertEx(lAddKod:Boolean;strParam:String) : String', CallMethod, NAME_LIB, 'Вернуть название причины смерти');
    AddMethod('function GetAddProp(sProp:String) : Variant', CallMethod, NAME_LIB, 'Вернуть значение специального свойства формы');
    AddMethod('function InitHouseProp(nPunkt,nUL: Variant; strDom,strKorp: String) : Boolean', CallMethod, NAME_LIB_HOUSE, 'Найти дом для последующего чтения его свойств');
    AddMethod('function GetHouseProp(sPropName,sType: String) : Variant', CallMethod, NAME_LIB_HOUSE, 'Вернуть свойство дома после инициализации sType:"","C","I" ');
    AddMethod('function GetDatePropis(dDate: TDateTime; sLang: String; nType : Integer): String', CallMethod, NAME_LIB, 'Дата прописью на Bel или Rus, nType= 0-полная, 1-год, 2-год+месяц');
    AddMethod('function GetUL(vID: Variant): String', CallMethod, NAME_LIB_ADRES, 'Название улицы');
    AddMethod('function CheckChetNomer(sDom,sKorp : String): Integer', CallMethod, NAME_LIB, '0-не опред,1-нечет,2-чет');
    AddMethod('procedure setTypePrintSvidRast(nType: Integer): Integer', CallMethod, NAME_LIB, 'печатается св-во о расторжении для 1-"ОН",2-"ОНА",3-оба');
    AddMethod('function MainDateFiks: TDateTime', CallMethod, NAME_LIB, 'вернуть текущую дату состояния базы');
    AddMethod('function MainYearFiks: Integer', CallMethod, NAME_LIB, 'вернуть текущий год фиксации');
    AddMethod('function CurYearFiks: Integer', CallMethod, NAME_LIB, 'вернуть текущий год фиксации');

    AddMethod('function GetCurDok:TDataSet', CallMethod, NAME_LIB, '');

    AddMethod('function GetDokumentAkt(sDataSet,sParams: String): String', CallMethod, NAME_LIB, 'Собрать строку документа(паспорта): DOC=ON_DOKUMENT; TYPE=ON_DOK_TYPE; SERIA=ON_DOK_SERIA; NOMER=ON_DOK_NOMER; DATE=ON_DOK_DATE; LICH=ON_IDENTIF');
    AddMethod('function GetDokumentAktEx(sDataSet,sParams: String; nType:Integer): String', CallMethod, NAME_LIB, 'Собрать строку документа(паспорта): DOC=ON_DOKUMENT; TYPE=ON_DOK_TYPE; SERIA=ON_DOK_SERIA; NOMER=ON_DOK_NOMER; DATE=ON_DOK_DATE; LICH=ON_IDENTIF  nType=0,1,2,3,4');
    AddMethod('function GetDokumentCurDok(sParams: String): String', CallMethod, NAME_LIB, 'Собрать строку документа(паспорта): DOC=ON_DOKUMENT; TYPE=ON_DOK_TYPE; SERIA=ON_DOK_SERIA; NOMER=ON_DOK_NOMER; DATE=ON_DOK_DATE; LICH=ON_IDENTIF');
    AddMethod('function GetDokumentCurDokEx(sParams: String; nType:Integer): String', CallMethod, NAME_LIB, 'Собрать строку документа(паспорта): DOC=ON_DOKUMENT; TYPE=ON_DOK_TYPE; SERIA=ON_DOK_SERIA; NOMER=ON_DOK_NOMER; DATE=ON_DOK_DATE; LICH=ON_IDENTIF  nType=0,1,2,3,4');
    AddMethod('function GetDokumentCurDokArr(sParams: String;nTypeDate:Integer): array of String', CallMethod, NAME_LIB, 'Собрать массив [пасторт,серия,номер,орган,дата]: DOC=ON_DOKUMENT; TYPE=ON_DOK_TYPE; SERIA=ON_DOK_SERIA; NOMER=ON_DOK_NOMER; DATE=ON_DOK_DATE');

    AddMethod('function ShtampOrg(nID:Integer): String', CallMethod, NAME_LIB, 'штамп ЗАГС');
    AddMethod('function NamePunkt(sPunkt:String, nTypePunkt:Integer, sLang:String): String', CallMethod, NAME_LIB, 'собрать наименование нас. пункта');
    AddMethod('function PunktIsGorod(sPunkt:String, nTypePunkt:Integer): Boolean', CallMethod, NAME_LIB, 'Населенный пунк город ?');
    AddMethod('function NameObl(sObl,sfldType,sLang: String): String', CallMethod, NAME_LIB_ADRES, 'Собрать наименование области, sfldType - имя поля с типом');
    AddMethod('function NameObl2(sObl:String;vType:Variant;sLang:String): String', CallMethod, NAME_LIB_ADRES, 'Собрать наименование области, sType - значение поля с типом (область/край)');
    AddMethod('function VozrastBel(nCount: Integer, lShowEmpty: Boolean): String', CallMethod, NAME_LIB, 'Возраст по белорусски');
    AddMethod('function SeekValueSpr(strName: String; strKeyFields:String; strSeek : String; strField : String):Variant', CallMethod, NAME_LIB, 'Поиск значения в справочнике');

    AddMethod('function GetVoenkomMen(strID:String; nTypeDate:Integer; sDelim:String):String;', CallMethod, NAME_LIB_MEN, 'Вернуть отношение к воинской службе человека');
    AddMethod('function ReadDeti(strID:String; strPol:String; Vozr1,Vozr2:Integer; lOnlyLic:Boolean; lNotPasport:Boolean):TDataSet;', CallMethod, NAME_LIB, 'Прочитать детей');
    AddMethod('function ReadDetiLic(strID:String;Vozr1,Vozr2:Integer;lNotPassport:Boolean):TDataSet;', CallMethod, NAME_LIB_MEN, 'Прочитать детей при из лицевого счета (толко без паспорта или всех)');
    AddMethod('function CheckMens(ds:TDataSet; lAddOntosh:Boolean; nTypeDate:Integer):Boolean;', CallMethod, NAME_LIB_MEN, 'Отметить поле "CHECK" в переданном DataSet');
    AddMethod('function CheckMens2(ds:TDataSet; lClearCheck:Boolean; sIsklID:String; lAddOntosh:Boolean; nTypeDate:Integer):Boolean;', CallMethod, NAME_LIB_MEN, 'Отметить поле "CHECK" в переданном DataSet');
    AddMethod('function GetOtnosh(nIDKomu:Integer; sOtnoshKomu:String; nIDCur:Integer; sOtnosh:String; sPol:String):String;', CallMethod, NAME_LIB_MEN, 'Преобразовать отношение к главе хоз-ва к отношению для кого выдается справка');

    AddMethod('function GetWherePunktUlDom(nUch : Integer; strValues,strFieldName,strValues2,strFieldName2: String; ds : TDataSet; lCheckKorp:Boolean) : String;', CallMethod, NAME_LIB_MEN, '');

    AddMethod('function IsAccountRnGor:Boolean);', CallMethod, NAME_LIB, 'Ведется учет по районам города');   // ведеетя учет по районам города

    AddMethod('function Podpis_Init(vKod:Variant):Integer;', CallMethod, NAME_LIB, 'Инициализация подписи в справках, возвращает количество подписей');
    AddMethod('function Podpis_Dolg(n:Integer):String;', CallMethod, NAME_LIB, 'Должность для подписи под номером n=1..3');
    AddMethod('function Podpis_FIO(n:Integer):String;', CallMethod, NAME_LIB, 'ФИО для подписи под номером n=1..3');
    AddMethod('function Podpis_Perenos:Boolean;', CallMethod, NAME_LIB, 'Печать должностей на всех листах');

    AddMethod('function PolFromName(strName:String):String;', CallMethod, NAME_LIB, 'Определить пол человека по имени');
    AddMethod('function PolFrom(strName:String;strOtch:String):String;', CallMethod, NAME_LIB, 'Определить пол человека по имени,отчеству');
    AddMethod('function GetNameAsPol(sName:String;sPol:String):String;', CallMethod, NAME_LIB, 'Значение слова в зависимомти от пола');

    AddMethod('function EmptyIzm:String;', CallMethod, NAME_LIB, 'пустые изменения для текущей актовой записи');
    AddMethod('function GetIzm(s:String):String;', CallMethod, NAME_LIB, 'вернуть значение или пустые изменения для текущей актовой записи');

    AddMethod('function RunTemplate(strName:String):Boolean;', CallMethod, NAME_LIB, 'Выполнить шаблон');
    AddMethod('function GetNomerSvid(sNomer:String):Integer;', CallMethod, NAME_LIB, 'Вернуть номер свидетельства в виде числа');

    AddMethod('function GetBookmarkMen:String;', CallMethod, NAME_LIB, 'Вернуть ID_INTERNAL отмеченных людей в гриде через ";" ');
    AddMethod('function GetBookmarkMen2(sDelim:String):String;', CallMethod, NAME_LIB, 'Вернуть ID_INTERNAL отмеченных людей в гриде через sDelim ');

    AddMethod('function GetWorkDataSet(sName:String):TDataSet;', CallMethod, NAME_LIB, ' ');
    AddMethod('function IsMyID(nMyID:Integer; nCurID:Integer):Boolean;', CallMethod, NAME_LIB, ' ');
    AddMethod('function MyID:Integer;', CallMethod, NAME_LIB, ' ');

    AddMethod('procedure SetGlobalFilterPunkt(sValue:String);', CallMethod, NAME_LIB, ' ');
    AddMethod('function GetGlobalFilterPunkt:String);', CallMethod, NAME_LIB, ' ');

    AddMethod('procedure SetRepeatReport(lSet:Boolean)', CallMethod, NAME_LIB, 'повторить еще раз отчет');

    AddMethod('function getResource(sKod:String; nType:Integer):String;', CallMethod, NAME_LIB, 'выдать строку в зависимомти от языка (strRes.ini)');
    AddMethod('function getPril(nType:Integer; sKod:String; nNomer:Integer):String;', CallMethod, NAME_LIB, 'выдать приложение к постановлению (strRes.ini)');
    AddMethod('function getPril2(nType:Integer; sKod:String; nNomer:Integer; nSup:Integer):String;', CallMethod, NAME_LIB, 'выдать приложение к постановлению (strRes.ini)');

    AddMethod('function getFieldFromSL(sValue:String; sField:String; sType:String):Variant;', CallMethod2, NAME_LIB, 'значение поля из строки разд #13#10 <FIELD>=<VALUE>');

    AddMethod('function sokrKv:String;', CallMethod2, NAME_LIB, '');
    AddMethod('function sokrDom:String;', CallMethod2, NAME_LIB, '');
    AddMethod('function sokrKorp:String;', CallMethod2, NAME_LIB, '');

  end;

  fsLic:=AScript.AddClass(TLicSchet ,'TLicSchet');
  fsAdres:=AScript.AddClass(TAdresLic,'TAdres');
  fsMen:=AScript.AddClass(TMens,'TMens');

  with fsMen do begin
    AddMethod('function DataSet;', CallMethod_Men);
    AddMethod('procedure First;', CallMethod_Men);
    AddMethod('procedure Last;', CallMethod_Men);
    AddMethod('procedure Next;', CallMethod_Men);
    AddMethod('procedure Prior;', CallMethod_Men);
    AddMethod('function Eof : Boolean;', CallMethod_Men);
    AddMethod('function Count : Integer;', CallMethod_Men);
    AddMethod('function Fld( strFieldName : String) : TField;', CallMethod_Men);
    AddMethod('function Value(sFieldName:String):Variant;', CallMethod_Men);
    AddMethod('function Lgoti    : TDataSet;', CallMethod_Men);
    AddMethod('function GetLgoti : String;', CallMethod_Men);
    AddMethod('function GetLgotiEx(sDelim:String) : String;', CallMethod_Men);
    AddMethod('function Priznaki : TDataSet;', CallMethod_Men);
    AddMethod('function Dvig     : TDataSet;', CallMethod_Men);
    AddMethod('function DvigToStr(strRazd:String) : String;', CallMethod_Men);
    AddMethod('function Ubyl(sType:String; sRazd: String): String;', CallMethod_Men);
    AddMethod('function SostavSem: TDataSet;', CallMethod_Men);
    AddMethod('function SostavSemToStr(strType:String; strRazd:String): String;', CallMethod_Men);
    AddMethod('function GetVoenkom(nTypeDate:Integer; sDelim:String):String;', CallMethod_Men);
    AddMethod('function OtdelnoOch: TDataSet;', CallMethod_Men);
    AddMethod('function ReshOch: TDataSet;', CallMethod_Men);
    AddMethod('function ReshOchAll: TDataSet;', CallMethod_Men);
    AddMethod('function GetReshOch(nTypeOch:Integer; nTypeResh:Integer): TReshOchMen;', CallMethod_Men);
    AddMethod('function FillReshOch(resh:TReshOchMen;nTypeOch:Integer; nTypeResh:Integer): Boolean;', CallMethod_Men);
    AddMethod('function AllReshOch(sl:TStringList; dDateR:TDateTime; sNomer:String): Boolean;', CallMethod_Men);
    AddMethod('function NomerOch(nOch:Integer; sPar:String): String;', CallMethod_Men);
    AddMethod('function DatePostOch(nOch:Integer): TDateTime;', CallMethod_Men);
    AddMethod('function FIO : String;', CallMethod_Men);
    AddMethod('function FAMILIA : String;', CallMethod_Men);
    AddMethod('function OTCH : String;', CallMethod_Men);
    AddMethod('function NAME : String;', CallMethod_Men);
    AddMethod('function POL : String;', CallMethod_Men);
    AddMethod('function DateR : TDateTime;', CallMethod_Men);
    AddMethod('function Pasport_Name  : String;', CallMethod_Men);
    AddMethod('function Pasport_Seria : String;', CallMethod_Men);
    AddMethod('function Pasport_Nomer : String;', CallMethod_Men);
    AddMethod('function Pasport_Organ : String;', CallMethod_Men);
    AddMethod('function Pasport_Date(sFormat:String) : String;', CallMethod_Men);
    AddMethod('function PasportToStr(nType:Integer) : String;', CallMethod_Men);
    AddMethod('function SostavSemPasportToStr(nType:Integer) : String', CallMethod_Men);
    AddMethod('function OtkudaPrib(lFull:Boolean; nOrder:Integer):String;', CallMethod_Men);
    AddMethod('function MestoRogd(lFull:Boolean; nOrder:Integer): String;', CallMethod_Men);
    AddMethod('function MestoReg(lFull:Boolean; nOrder:Integer): String;', CallMethod_Men);
    AddMethod('function LichNomer: String;', CallMethod_Men);
    AddMethod('function getDolg : String;', CallMethod_Men);
    AddMethod('function getWork : String;', CallMethod_Men);
    AddMethod('function getWorkEx(sAdd:String) : String;', CallMethod_Men);
    AddMethod('function getOtnosh(IsPrintFirst:Boolean) : String;', CallMethod_Men);
    AddMethod('function getGrag(IsNullToDef:Boolean; lObozn:Boolean) : String;', CallMethod_Men);
    AddMethod('function IsKvartirant : Boolean;', CallMethod_Men);
    AddMethod('function Adres : TAdresLic;', CallMethod_Men);
    AddMethod('function TypeReg : Integer;', CallMethod_Men);
    AddMethod('function Read(nID:Integer):Boolean;', CallMethod_Men);
    AddMethod('function ReadEx(nID:Integer; sPar:String):Boolean;', CallMethod_Men);
    AddMethod('function ReadLic(nID:Integer):Boolean;', CallMethod_Men);

    AddMethod('function GetFactor(sName:String):Variant;', CallMethod_Men);
    AddMethod('function GetFactorEx(sName:String;vDef:Variant):Variant;', CallMethod_Men);
    AddMethod('procedure SetFactor(sName:String;vValue:Variant);', CallMethod_Men);
    AddMethod('procedure DeleteFactor(sName:String);', CallMethod_Men);
    AddMethod('procedure DeleteAllFactor;', CallMethod_Men);
    AddMethod('constructor Create;', CallMethod_Men);
  end;

  with fsAdres do begin
    AddMethod('function Mens : TMens;', CallMethod_Adres);
    AddMethod('function HouseOwners : TDataSet;', CallMethod_Adres);
    AddMethod('function HouseOwnersHist : TDataSet;', CallMethod_Adres);
    AddMethod('function HouseProps : TDataSet;', CallMethod_Adres);
    AddMethod('function LicSchet : TDataSet;', CallMethod_Adres);
    AddMethod('function ListLicSchet : String;', CallMethod_Adres);
    AddMethod('function Fld( strFieldName : String) : TField;', CallMethod_Adres);
    AddMethod('function Value(sFieldName:String):Variant;', CallMethod_Adres);
    AddMethod('function SetType(sType:String):String;', CallMethod_Adres);
    AddMethod('function GetAdres : String;', CallMethod_Adres);
    AddMethod('function IsMyAdres : Boolean;', CallMethod_Adres);
    AddMethod('function GetID  : Integer;', CallMethod_Adres);
    AddMethod('function Punkt  : String;', CallMethod_Adres);
    AddMethod('function Gorod  : String;', CallMethod_Adres);
    AddMethod('function Selo  : String;', CallMethod_Adres);
    AddMethod('function IsGorod: Boolean;', CallMethod_Adres);
    AddMethod('function Ulica  : String;', CallMethod_Adres);
    AddMethod('function PunktUlica : String;', CallMethod_Adres);
    AddMethod('function NotDom : Boolean;', CallMethod_Adres);
    AddMethod('function NameHouse:String;', CallMethod_Adres);
    AddMethod('function DomKv  : String;', CallMethod_Adres);
    AddMethod('function Dom    : String;', CallMethod_Adres);
    AddMethod('function Dom2   : String;', CallMethod_Adres);
    AddMethod('function Korp   : String;', CallMethod_Adres);
    AddMethod('function Kv     : String;', CallMethod_Adres);
    AddMethod('function Etag   : String;', CallMethod_Adres);
    AddMethod('function Kol_Etag : String;', CallMethod_Adres);
    AddMethod('function Predst   : String;', CallMethod_Adres);
    AddMethod('function ControlHouse:String;', CallMethod_Adres);
    AddMethod('function UseGilfond:String;', CallMethod_Adres);
    AddMethod('function PrivateSect:Boolean;', CallMethod_Adres);

    AddMethod('function GetOwners(sl : TStringList; nType : Integer) : String;', CallMethod_Adres);
    AddMethod('constructor Create;',CallMethod_Adres);
  end;

  with fsLic do begin
    AddMethod('function Fld( strFieldName : String) : TField;',CallMethod_Lic);
    AddMethod('function ReadFirst : Boolean', CallMethod_Lic);
    AddMethod('function GetFirst(sField:String) : Variant', CallMethod_Lic);
    AddMethod('function Lgoti    : TDataSet;',CallMethod_Lic);
    AddMethod('function Priznaki : TDataSet;',CallMethod_Lic);
    AddMethod('function HouseOwners   : TDataSet;',CallMethod_Lic);
    AddMethod('function Mens : TMens;',CallMethod_Lic);
    AddMethod('function Adres : TAdresLic;',CallMethod_Lic);
    AddMethod('function Predst : String;', CallMethod_Lic);
    AddMethod('function Osnov : String;', CallMethod_Lic);
    AddMethod('function UseGilFond : String;', CallMethod_Lic);
    AddMethod('function TypeHouse : String;', CallMethod_Lic);
    AddMethod('function PunktUlica : String;', CallMethod_Lic);
    AddMethod('function Value(sFieldName:String):Variant;', CallMethod_Lic);
    AddMethod('function GetOwners(sl : TStringList; nType : Integer) : String;', CallMethod_Lic);
    AddMethod('function NanimOrOwners(sPar:String) : String;', CallMethod_Lic);
    AddMethod('function ControlHouse : String;', CallMethod_Lic);
    AddMethod('function PrivateSect : Boolean;', CallMethod_Lic);
    AddMethod('function GetFactor(sName:String) : Variant;',CallMethod_Lic);
    AddMethod('function GetFactorEx(sName:String;vDef:Variant):Variant;',CallMethod_Lic);
    AddMethod('procedure SetFactor(sName:String;vValue:Variant);',CallMethod_Lic);
    AddMethod('procedure DeleteFactor(sName:String);',CallMethod_Lic);
    AddMethod('procedure DeleteAllFactor;',CallMethod_Lic);
    AddMethod('constructor Create;',CallMethod_Lic);
  end;

  AScript.AddObject('Men',Men);
//  AScript.AddObject('Mens',Men);
  AScript.AddObject('Adres',Adres);
  AScript.AddObject('LicSchet',LicSchet);



//  fsGlobalunit.AddObject('Men', Men);
//  fsGlobalunit.AddClass(TLicSchet,'TLicSchet');
end;

function TSelSovetFunctions.CallMethod_Lic(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
var
  l:TLicSchet;
begin
  Result := 0;
  l:=TLicSchet(Instance);
  if MethodName='MENS' then begin
    Result:=Integer(l.Mens);
  end else if MethodName='ADRES' then begin
    Result:=Integer(l.Adres);
  end else if MethodName='READFIRST' then begin
    Result:=l.ReadFirst;
  end else if MethodName='GETFIRST' then begin
    Result:=l.GetFirst(Params[0]);
  end else if MethodName='PREDST' then begin
    Result:=l.Predst;
  end else if MethodName='OSNOV' then begin
    Result:=l.Osnov;
  end else if MethodName='TYPEHOUSE' then begin
    Result:=l.TypeHouse;
  end else if MethodName='CONTROLHOUSE' then begin
    Result:=l.ControlHouse;
  end else if MethodName='PRIVATESECT' then begin
    Result:=l.PrivateSect;
  end else if MethodName='USEGILFOND' then begin
    Result:=l.UseGilfond;
  end else if MethodName='PUNKTULICA' then begin
    Result:=l.PunktUlica;
  end else if MethodName='GETOWNERS' then begin
    Result:=l.GetOwners(TStringList(Integer(Params[0])),Params[1]);
  end else if MethodName='NANIMOROWNERS' then begin
    Result:=l.NanimOrOwners(Params[0]);
  end else if MethodName='HOUSEOWNERS' then begin
    Result:=Integer(l.HouseOwners);
  end else if MethodName='FLD' then begin
    Result:=Integer(l.Fld(Params[0]));
  end else if MethodName='VALUE' then begin
    Result:=l.Value(Params[0]);
  end else if MethodName='LGOTI' then begin
    Result:=Integer(l.Lgoti);
  end else if MethodName='PRIZNAKI' then begin
    Result:=Integer(l.Priznaki);
  end else if MethodName='GETFACTOR' then begin
    Result:=l.GetFactor(Params[0]);
  end else if MethodName='GETFACTOREX' then begin
    Result:=l.GetFactorEx(Params[0],Params[1]);
  end else if MethodName='SETFACTOR' then begin
    l.SetFactor(Params[0], Params[1]);
  end else if MethodName='DELETEFACTOR' then begin
    l.DeleteFactor(Params[0]);
  end else if MethodName='DELETEALLFACTOR' then begin
    l.DeleteAllFactor;
  end else if MethodName='CREATE' then begin
    l:=TLicSchet.CreateForScript;
    Result:=Integer(l);
  end else begin
    PutError('Неизвестный вызов для TLicSchet: "'+MethodName+'"');
  end;
end;

function TSelSovetFunctions.CallMethod_Adres(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
var
  a:TAdresLic;
begin
  Result := 0;
  a:=TAdresLic(Instance);
  if MethodName='MENS' then begin
    Result:=Integer(a.Mens);
  end else if MethodName='FLD' then begin
    Result:=Integer(a.Fld(Params[0]));
  end else if MethodName='VALUE' then begin
    Result:=a.Value(Params[0]);
  end else if MethodName='HOUSEOWNERS' then begin
    Result:=Integer(a.HouseOwners);
  end else if MethodName='HOUSEOWNERSHIST' then begin
    Result:=Integer(a.HouseOwnersHist);
  end else if MethodName='HOUSEPROPS' then begin
    Result:=Integer(a.HouseProps);
  end else if MethodName='LICSCHET' then begin
    Result:=Integer(a.LicSchet);
  end else if MethodName='LISTLICSCHET' then begin
    Result:=a.ListLicSchet;
  end else if MethodName='SETTYPE' then begin
    Result:=a.SetType(Params[0]);
  end else if MethodName='GETADRES' then begin
    Result:=a.GetAdres;
  end else if MethodName='ISMYADRES' then begin
    Result:=a.IsMyAdres;
  end else if MethodName='GETID' then begin
    Result:=a.GetID;
  end else if MethodName='PUNKT' then begin
    Result:=a.Punkt;
  end else if MethodName='GOROD' then begin
    Result:=a.Gorod;
  end else if MethodName='SELO' then begin
    Result:=a.Selo;
  end else if MethodName='ISGOROD' then begin
    Result:=a.IsGorod;
  end else if MethodName='ULICA' then begin
    Result:=a.Ulica;
  end else if MethodName='PUNKTULICA' then begin
    Result:=a.PunktUlica;
  end else if MethodName='NOTDOM' then begin
    Result:=a.NotDom;
  end else if MethodName='NAMEHOUSE' then begin
    Result:=a.NameHouse;
  end else if MethodName='DOMKV' then begin
    Result:=a.DomKv;
  end else if MethodName='DOM' then begin
    Result:=a.Dom;
  end else if MethodName='DOM2' then begin
    Result:=a.Dom2;
  end else if MethodName='KORP' then begin
    Result:=a.Korp;
  end else if MethodName='KV' then begin
    Result:=a.Kv;
  end else if MethodName='ETAG' then begin
    Result:=a.ETAG;
  end else if MethodName='KOL_ETAG' then begin
    Result:=a.Kol_ETAG;
  end else if MethodName='PREDST' then begin
    Result:=a.Predst;
  end else if MethodName='CONTROLHOUSE' then begin
    Result:=a.ControlHouse;
  end else if MethodName='USEGILFOND' then begin
    Result:=a.UseGilfond;
  end else if MethodName='PRIVATESECT' then begin
    Result:=a.PrivateSect;
  end else if MethodName='GETOWNERS' then begin
    Result:=a.GetOwners(TStringList(Integer(Params[0])),Params[1]);
  end else if MethodName='CREATE' then begin
//    a:=TAdresLic.Create ForScript;
//    Result:=Integer(m);
  end else begin
    PutError('Неизвестный вызов для TAdres: "'+MethodName+'"');
  end;

end;

function TSelSovetFunctions.CallMethod_ReshOchMen(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
var
  r:TReshOchMen;
begin
  Result := 0;
  //---------------------------------------------------------------------------
  // TMens
  //---------------------------------------------------------------------------
  if ClassType=TReshOchMen then begin
//    if MethodName = 'ADD' then begin
//     преобразуем параметр типа Variant к типу Pointer и вызовем с ним метод Add
//      TList(Instance).Add(Pointer(Integer(Params[0])));
//    end else if MethodName = 'CLEAR' then begin
//      TList(Instance).Clear
//    end;
{
}
    r:=TReshOchMen(Instance);
    if MethodName='OCHERED_ID' then begin
      result:=r.Ochered_ID;
    end else if MethodName='CLEAR' then begin
      result:=r.Clear;
    end else if MethodName='MENID' then begin
      result:=r.MenID;
    end else if MethodName='AUTOID' then begin
      result:=r.AutoID;
    end else if MethodName='NAMELIST' then begin
      result:=r.NameList(Params[0],Params[1]);
    end else if MethodName='NAMEOCH' then begin
      result:=r.NameOch(Params[0], Params[1]);
    end else if MethodName='OTKAZ' then begin
      result:=r.Otkaz;
    end else if MethodName='TIP' then begin
      result:=r.TIP;
    end else if MethodName='PROV' then begin
      result:=r.PROV;
    end else if MethodName='RAZDEL' then begin
      result:=r.Razdel;
    end else if MethodName='DATER' then begin
      result:=r.DateR;
    end else if MethodName='DATESILA' then begin
      result:=r.DateSila;
    end else if MethodName='DATESILARESH' then begin
      result:=r.DateSilaResh;
    end else if MethodName='SETDATER' then begin
      r.SetDateR(Params[0]);
    end else if MethodName='SETDATESILA' then begin
      r.SetDateSila(Params[0]);
    end else if MethodName='SETNOMER' then begin
      r.setNOMER(Params[0]);
    end else if MethodName='NOMER' then begin
      result:=r.NOMER;
    end else if MethodName='OSNOV' then begin
      result:=r.Osnov;
    end else if MethodName='OSNOVTEXT' then begin
      result:=r.OsnovText;
    end else if MethodName='OSNOV2' then begin
      result:=r.Osnov2;
    end else if MethodName='OSNOVTEXT2' then begin
      result:=r.OsnovText2;
    end else if MethodName='GETTEXTOSNOV' then begin
      result:=r.GetTextOsnov(Params[0],Params[1]);
    end else if MethodName='ID1' then begin
      result:=r.ID1;
    end else if MethodName='ID2' then begin
      result:=r.ID2;
    end else if MethodName='TEXTRESH' then begin
      result:=r.TEXTRESH;
    end else if MethodName='TEXTVIPIS' then begin
      result:=r.TEXTVIPIS;
    end else if MethodName='TEXT' then begin
      result:=r.TEXT(Params[0]);
    end else if MethodName='CHECKFIELDSINTEXT' then begin
      result:=r.CHECKFIELDSINTEXT(Params[0],Params[1]);
    end else if MethodName='ADDINFO' then begin
      result:=r.ADDINFO;
    end;
  end;
end;


function TSelSovetFunctions.CallMethod_Men(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
var
  m:TMens;
begin
  Result := 0;
  //---------------------------------------------------------------------------
  // TMens
  //---------------------------------------------------------------------------
  if ClassType=TMens then begin
//    if MethodName = 'ADD' then begin
//     преобразуем параметр типа Variant к типу Pointer и вызовем с ним метод Add
//      TList(Instance).Add(Pointer(Integer(Params[0])));
//    end else if MethodName = 'CLEAR' then begin
//      TList(Instance).Clear
//    end;
    m:=TMens(Instance);
    if MethodName='FIRST' then begin
      m.First;
    end else if MethodName='LAST' then begin
      m.Last;
    end else if MethodName='NEXT' then begin
      m.Next;
    end else if MethodName='PRIOR' then begin
      m.Prior;
    end else if MethodName='EOF' then begin
      Result:=m.Eof;
    end else if MethodName='COUNT' then begin
      Result:=m.COUNT;
    end else if MethodName='FLD' then begin
      Result:=Integer(m.Fld(Params[0]));
    end else if MethodName='VALUE' then begin
      Result:=m.Value(Params[0]);
    end else if MethodName='LGOTI' then begin
      Result:=Integer(m.Lgoti);
    end else if MethodName='GETLGOTI' then begin
      Result:=m.GetLgoti;
    end else if MethodName='GETLGOTIEX' then begin
      Result:=m.GetLgotiEx(Params[0]);
    end else if MethodName='PRIZNAKI' then begin
      Result:=Integer(m.Priznaki);
    end else if MethodName='DVIG' then begin
      Result:=Integer(m.Dvig);
    end else if MethodName='DATASET' then begin
      Result:=Integer(m.DataSet);
    end else if MethodName='DVIGTOSTR' then begin
      Result:=m.DvigToStr(Params[0]);
    end else if MethodName='UBYL' then begin
      Result:=m.Ubyl(Params[0],Params[1]);
    end else if MethodName='SOSTAVSEM' then begin
      Result:=Integer(m.SostavSem);
    end else if MethodName='SOSTAVSEMTOSTR' then begin
      Result:=m.SostavSemToStr(Params[0],Params[1]);
    end else if MethodName='GETVOENKOM' then begin
      Result:=m.GetVoenkom(Params[0],Params[1]);
    end else if MethodName='OTDELNOOCH' then begin
      Result:=Integer(m.OtdelnoOch);
    end else if MethodName='RESHOCH' then begin
      Result:=Integer(m.ReshOch);
    end else if MethodName='RESHOCHALL' then begin
      Result:=Integer(m.ReshOchAll);
    end else if MethodName='GETRESHOCH' then begin
      Result:=Integer(m.GetReshOch(Params[0],Params[1]));
    end else if MethodName='FILLRESHOCH' then begin
      Result:=Integer(m.FillReshOch(TReshOchMen(Integer(Params[0])),Params[1],Params[2]));
    end else if MethodName='ALLRESHOCH' then begin
      Result:=m.AllReshOch(TStringList(Integer(Params[0])),Params[1],Params[2]);
    end else if MethodName='NOMEROCH' then begin
      Result:=m.NomerOch(Params[0], Params[1]);
    end else if MethodName='DATEPOSTOCH' then begin
      Result:=m.DatePostOch(Params[0]);
    end else if MethodName='FIO' then begin
      Result:=m.FIO;
    end else if MethodName='FAMILIA' then begin
      Result:=m.Familia;
    end else if MethodName='NAME' then begin
      Result:=m.Name;
    end else if MethodName='OTCH' then begin
      Result:=m.Otch;
    end else if MethodName='POL' then begin
      Result:=m.POL;
    end else if MethodName='DATER' then begin
      Result:=m.DateR;
//    end else if MethodName='PASPORT' then begin
//    function Pasport : TPassport;
    end else if MethodName='PASPORT_NAME' then begin
      Result:=m.Pasport_Name;
    end else if MethodName='PASPORT_SERIA' then begin
      Result:=m.Pasport_Seria;
    end else if MethodName='PASPORT_NOMER' then begin
      Result:=m.Pasport_Nomer;
    end else if MethodName='PASPORT_ORGAN' then begin
      Result:=m.Pasport_Organ;
    end else if MethodName='PASPORT_DATE' then begin
      Result:=m.Pasport_Date(Params[0]);
    end else if MethodName='PASPORTTOSTR' then begin
      Result:=m.PasportToStr(Params[0]);
    end else if MethodName='SOSTAVSEMPASPORTTOSTR' then begin
      Result:=m.SOSTAVSEMPasportToStr(Params[0]);
    end else if MethodName='OTKUDAPRIB' then begin
      Result:=m.OtkudaPrib(Params[0],Params[1]);
    end else if MethodName='MESTOROGD' then begin
      Result:=m.MestoRogd(Params[0],Params[1]);
    end else if MethodName='MESTOREG' then begin
      Result:=m.MestoReg(Params[0],Params[1]);
    end else if MethodName='LICHNOMER' then begin
      Result:=m.LichNomer;
    end else if MethodName='GETDOLG' then begin
      Result:=m.getDolg;
    end else if MethodName='GETWORK' then begin
      Result:=m.getWork;
    end else if MethodName='GETWORKEX' then begin
      Result:=m.getWorkEx(Params[0]);
    end else if MethodName='GETOTNOSH' then begin
      Result:=m.getOtnosh(Params[0]);
    end else if MethodName='ISKVARTIRANT' then begin
      Result:=m.IsKvartirant;
    end else if MethodName='GETGRAG' then begin
      Result:=m.getGrag(Params[0],Params[1]);
    end else if MethodName='ADRES' then begin
      Result:=Integer(m.Adres);
    end else if MethodName='TYPEREG' then begin
      Result:=m.TypeReg;
    end else if MethodName='READ' then begin
      Result:=m.Read(Params[0]);
    end else if MethodName='READEX' then begin
      Result:=m.ReadEx(Params[0],Params[1]);
    end else if MethodName='READLIC' then begin
      Result:=m.ReadLic(Params[0]);
    end else if MethodName='GETFACTOR' then begin
      Result:=m.GetFactor(Params[0]);
    end else if MethodName='GETFACTOREX' then begin
      Result:=m.GetFactorEx(Params[0],Params[1]);
    end else if MethodName='SETFACTOR' then begin
      m.SetFactor(Params[0], Params[1]);
    end else if MethodName='DELETEFACTOR' then begin
      m.DeleteFactor(Params[0]);
    end else if MethodName='DELETEALLFACTOR' then begin
      m.DeleteAllFactor;
    end else if MethodName='CREATE' then begin
      m:=TMens.CreateForScript;
      Result:=Integer(m);
    end else begin
      PutError('Неизвестный вызов для TMens: "'+MethodName+'"');
    end;
  end;
end;

function TSelSovetFunctions.CallMethod2(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
begin
  if MethodName = 'GETFIELDFROMSL' then begin
    Result:=getFieldFromSL(Params[0],Params[1],Params[2]);
  end else if MethodName = 'SOKRKV' then begin
    Result:=sokrKv;
  end else if MethodName = 'SOKRDOM' then begin
    Result:=sokrDom;
  end else if MethodName = 'SOKRKORP' then begin
    Result:=sokrKorp;
  end;
end;

function TSelSovetFunctions.CallMethod(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
var
  v1:Variant;
  p : TPassport;
  ds:TdataSet;
  SOATO:TSOATO;
  n,n1,n2:Integer;
  s:String;
  f:TfmSimpleD;
  arrV:array of Variant;
  lRun:Boolean;
begin
  if MethodName = 'SETDATEFIKS' then begin
    SetDateFiksReport(Params[0]);
  end else if MethodName = 'LOADSQL' then begin
    Result := dmBase.LoadSQLEx(Params[0]);
  end else if MethodName = 'GETSQLFROMSTR' then begin
    Result := dmBase.GetSQLFromStr(Params[0],Params[1]);
  end else if MethodName = 'NAMETABLEFROMTYPEOBJ' then begin
    Result := dmBase.NameTableFromTypeObj(Params[0]);
  end else if MethodName = 'LISTMENSLIC' then begin
    {$IFNDEF OPEKA}
    Result := dmBase.ListMensLic(Params[0], Params[1], Params[2], Params[3], Params[4], nil);
    {$ENDIF}
//  end else if MethodName = 'LGOTMEN' then begin
//    Result := dmBase.LgotMen2(Params[0], Params[1]);
  end else if MethodName = 'COUNTMENS' then begin
    Result := dmBase.CountMensEx( fmMain.DateFiks, Params[0], Params[1], TStringList(Integer(Params[2])) );
  end else if MethodName = 'CHECKDATEFIKSSQL' then begin
    Result := dmBase.CheckDateFiksSQL(Params[0],Params[1]);
  end else if MethodName = 'GETNOMERDOM' then begin
    Result:=dmBase.GetNomerDom(Params[0], Params[1]);
  end else if MethodName = 'GETNOMERDOMEX' then begin
    Result:=dmBase.GetNomerDomEx(Params[0], Params[1]);
  end else if MethodName = 'CHECKPARAMSSQL' then begin
    Result := dmBase.CheckParamsSQL(Params[0]);
  end else if MethodName = 'LASTSVIDPOVTOR' then begin
    Result:= dmBase.LastSvidPovtor(Params[0], Params[1], Params[2]);
  end else if MethodName = 'ISPRAZDNIK' then begin
    Result := IsPrazdnik(Params[0]);
  end else if MethodName = 'PRINTDECLDOK' then begin
    Result := PrintDeclDok(Params[0]);
  end else if MethodName = 'NAMEOTDOCH' then begin
    Result:=NameOtdOch(Params[0], Params[1]);
//  end else if MethodName = 'PENSVOZRG' then begin
//    Result:=PensVozrG;
//  end else if MethodName = 'PENSVOZRM' then begin
//    Result:=PensVozrM;
  end else if MethodName = 'RESHISPOSTANOVKA' then begin
    Result:=ReshIsPostanovka(Params[0]);
  end else if MethodName = 'TRUD' then begin
    Result:=Trud(Params[0], Params[1], Params[2]);
  end else if MethodName = 'ZH_GETNAMEPUNKT' then begin
    Result:=ZH_GetNamePunkt(Params[0], Params[1], Params[2]);
  end else if MethodName = 'PROPCURGURNAL' then begin
    Result:=PropCurGurnal(Params[0], Params[1]);
  end else if MethodName = 'GETDATEFIKS' then begin
    Result := GetDateFiksReport;
  end else if MethodName = 'ADRESFROMID' then begin
    Result := dmBase.AdresFromID( DateFiksReport, IntToStr(Params[0]), Params[1]);
  end else if MethodName = 'ADRESFROMIDEX' then begin
    Result := dmBase.AdresFromIDEx( DateFiksReport, IntToStr(Params[0]), Params[1], Params[2]);
  end else if MethodName = 'NAME_TAIL' then begin
    Result := Name_Tail;
  end else if MethodName = 'HOUSELIC' then begin
    {$IFDEF ADD_MENS_PU}
    Result:=dmBase.HouseLic(DateFiksReport, Params[0]);
    {$ELSE}
    Result:='';
    {$ENDIF}
  end else if MethodName = 'HOUSEOWNERS' then begin
    Result := dmBase.HouseOwners(DateFiksReport,IntToStr(Params[0]),nil, Params[1], nil, nil, nil);
  end else if MethodName = 'READPROPERTY' then begin
    Result := dmBase.ReadOneProp(DateFiksReport,Params[0],Params[1],ftUnknown);
  end else if MethodName = 'RUNFUNCSCRIPT' then begin       // 5
    v1:=null;                                 
    RunFuncScript(Params[0], [], v1, lRun);
    Result:=v1;
//    Result := _RunFuncScript(Params[0],Params[1],Params[2]);
  end else if MethodName = 'RUNFUNCSCRIPTEX' then begin       // 5
    v1:=Params[1];
    n1:=VarArrayLowBound(v1,1);
    n2:=VarArrayHighBound(v1,1);
    SetLength(arrV,n2-n1+1);
    for n:=n1 to n2 do begin
      arrV[n]:=v1[n];
    end;
    v1:=null;
    RunFuncScript(Params[0], ArrV, v1, lRun);
    Result:=v1;
  end else if MethodName = 'DATEFIKSREAL' then begin
    if GetDateFiksReport = dmBase.GetDateCurrentSost then begin
      Result := dmBase.getCurDate;
    end else begin
      Result := GetDateFiksReport;
    end;
  end else if MethodName = 'GETCOUNTYEAR' then begin
    Result := GetCountYear(Params[0],Params[1]);
  end else if MethodName = 'GETVOZRAST' then begin
    Result := GetVozrast(Params[0],true);
  end else if MethodName = 'GETVOZRASTEX' then begin
    Result := GetVozrast(Params[0],Params[1]);
  end else if MethodName = 'GETHISTORY' then begin
    Result := dmBase.GetHistory(Params[0],Params[1],Params[2],Params[3],Params[4]);
  end else if MethodName = 'RAION_NAME' then begin
    Result := fmMain.NameRaion(Params[0]);
  end else if MethodName = 'OBL_NAME' then begin      // 10
    Result := fmMain.NameObl(Params[0]);
  end else if MethodName = 'GETPADEG' then begin
    Result := fmMain.GetPadeg(Params[0],Params[1]);
  end else if MethodName = 'ADRES_CONTROL' then begin
    Result := dmBase.Adres_Control;
  end else if MethodName = 'ADRES_USEGILFOND' then begin
    Result := dmBase.Adres_UseGilfond;
  end else if MethodName = 'ADRES_PUNKT' then begin
    Result := dmBase.Adres_Punkt;
  end else if MethodName = 'ADRES_UL' then begin
    Result := dmBase.Adres_Ul;
  end else if MethodName = 'ADRES_DOM' then begin
    Result := dmBase.Adres_Dom;
  end else if MethodName = 'ADRES_NDOM' then begin
    Result := dmBase.Adres_NDom;
  end else if MethodName = 'ADRES_KORP' then begin   // 15
    Result := dmBase.Adres_Korp;
  end else if MethodName = 'ADRES_KV' then begin
    Result := dmBase.Adres_Kv;
  end else if MethodName = 'ADRES_NAMEHOUSE' then begin
    Result := dmBase.Adres_NameHouse;
  end else if MethodName = 'ADRES_NOTDOM' then begin
    Result := dmBase.Adres_NotDom;
  end else if MethodName = 'GETTAILADRES' then begin
    Result := dmBase.GetTailAdres(Params[0]);
  end else if MethodName = 'GETNAMETERR' then begin
    Result := dmBase.GetNameTerr(Params[0], Params[1], Params[2], Params[3]);
  end else if MethodName = 'DBLASTDVIGMEN' then begin
    Result := dmBase.LastDvigMenS( IntToStr(Params[0]), Params[1] );
  end else if MethodName = 'LASTDVIGMEN' then begin
    Result:=Men.DvigToStr(Params[0]);
  end else if MethodName = 'DBGETMENPASP' then begin
    Result:=dmBase.GetMenPasp(Params[0], Params[1], Params[2] );
  end else if MethodName = 'DBGETMENPASPV' then begin
    Result:=dmBase.GetMenPaspV(Params[0], Params[1], Params[2], Params[3], Params[4], Params[5], Params[6] );
  end else if MethodName = 'VIBITMEN' then begin
    Result:=Men.Ubyl(Params[0],Params[1]);
  end else if MethodName = 'GETDAYSPROPIS' then begin
    Result := GetDaysPropis(Params[0],Params[1]);
  end else if MethodName = 'GETMONTHPROPIS' then begin     // 20
    Result := GetMonthPropis(Params[0],Params[1]);
  end else if MethodName = 'GETYEARPROPIS' then begin     // 21
    Result := GetYearPropis(Params[0],Params[1]);
  end else if MethodName = 'SPRNAMEORG' then begin
    Result := fmMain.SprNameOrg2(Params[0],Params[1],Params[2]);
  end else if MethodName = 'NAMEORG' then begin
    Result := fmMain.NameOrg('','');
  end else if MethodName = 'NAMEORGEX' then begin
    Result := fmMain.NameOrg(Params[0],Params[1]);
  end else if MethodName = 'SPRNAMEORGR' then begin
    Result := fmMain.SprNameOrg(Params[0],Params[1],Params[2]);
  end else if MethodName = 'GETNOMEREKZ' then begin
    Result := GlobalTask.GetNomerEkz;
  end else if MethodName = 'REPORT_SETCOUNTEKZ' then begin
    GlobalTask.Report_SetCountEkz(Params[0]);
  end else if MethodName = 'REPORT_SETDUPLEXMODE' then begin
    GlobalTask.Report_SetDuplexMode(Params[0]);
  end else if MethodName = 'GETREPORTID' then begin
    Result:=GlobalTask.GetReportId;
  end else if MethodName = 'SETREPORTID' then begin
    GlobalTask.SetReportId(Params[0]);
  end else if MethodName = 'SOSTAVSEMTOSTR' then begin
    Result:=dmBase.SostavSemToStr(Params[0],Params[1],Params[2]);
  end else if MethodName = 'GETRESHOCH' then begin
    Result:=Integer(dmBase.GetReshOch(Params[0]));
  end else if MethodName = 'ONLYRAION_NAME' then begin
    Result := fmMain.OnlyNameRaion(Params[0]);
  end else if MethodName = 'CONCAT_IF2' then begin
    Result := Concat_IF2(Params[0],Params[1]);
  end else if MethodName = 'CONCAT_IF1' then begin
    Result := Concat_IF1(Params[0],Params[1]);
  end else if MethodName = 'CURRENTDATE' then begin
    Result := dmBase.getCurDate;
  end else if MethodName = 'MEN_ADRESANDTELEFON' then begin
    {$IFDEF ADD_MENS_PU}
      Result := TdmMen(fCurMen.Dokument).GetAdresAndTelefon;
    {$ELSE}
      Result:='';
    {$ENDIF}
  end else if MethodName = 'ACTIVEON' then begin
    Result := fCurDok.FActiveControlON;
  end else if MethodName = 'CONDIN' then begin
    Result := fCurDok.CondIN(Params[0]);
  end else if MethodName = 'MEN_MESTOROGD' then begin
    Result:=Men_MestoRogd(Params[0], Params[1]);
  end else if MethodName = 'MEN_MESTOOTKUDA' then begin
    Result:=Men_MestoOtkuda(Params[0], Params[1]);
  end else if MethodName = 'HIST' then begin
    Result := fCurDok.GetHistValueField(Params[0],1,'  ');
  end else if MethodName = 'ONLYSVID' then begin
    Result := fCurDok.FOnlySvid;
  end else if MethodName = 'GETGRAG' then begin
    Result := fCurDok.GetGrag(Params[0],Params[1]);
  end else if MethodName = 'GETNATION' then begin
    Result := fCurDok.GetNation(Params[0],Params[1]);
  end else if MethodName = 'HISTEX' then begin
    Result := fCurDok.GetHistValueField(Params[0],1,Params[1]);
  end else if MethodName = 'SUBDATEPROPIS' then begin
    Result := SubDatePropis( Params[0],Params[1],Params[2] );
  end else if MethodName = 'SUBDATEYEAR' then begin                 // 31
    Result := SubDateYear( Params[0],Params[1] );
  end else if MethodName = 'SUBDATEMONTH' then begin
    Result := SubDateMonth( Params[0],Params[1] );
  end else if MethodName = 'SUBDATEDAY' then begin
    Result := SubDateDay( Params[0],Params[1] );
  end else if MethodName = 'IDPROG' then begin
    Result := fmMain.IdProg;
  end else if MethodName = 'IDPROG1' then begin
    Result := Copy(fmMain.IdProg,1,1);
  end else if MethodName = 'GETBELNAZV' then begin          // 35
    Result := dmBase.GetBelNazv(Params[0],Params[1],Params[2]);
  end else if MethodName = 'ADRESISUPPER' then begin
    Result := dmBase.AdresIsUpper;
  end else if MethodName = 'GETADRESAKT' then begin
    Result := dmBase.GetAdresAkt(Params[0],Params[1],Params[2]);
  end else if MethodName = 'GETMESTOZAH' then begin
    Result := GetMestoZAH(TDataSet(Integer(Params[0])),Params[1],Params[2]);
  end else if MethodName = 'GETMESTOZAH2' then begin
    Result := GetMestoZAH(dmBase.getDataSet(Params[0]),Params[1],Params[2]);
  end else if MethodName = 'TYPERS' then begin
    Result := TypeRegSvid(Params[0]);
  end else if MethodName = 'RS' then begin
    Result := RegSvid(Params[0],Params[1]);
  end else if MethodName = 'TYPERSF' then begin
    Result := TypeRegSvidFIO(Params[0]);
  end else if MethodName = 'ADDWHERECURIDBASE' then begin
    Result := GlobalTask.AddWhereCurIdBase(Params[0],Params[1]);
  end else if MethodName = 'RSF' then begin
    Result := RegSvidFIO(Params[0],Params[1]);
  end else if MethodName = 'GETADRESAKT2' then begin
    Result := dmBase.GetAdresAkt2(Params[0],Params[1],Params[2]);
  end else if MethodName = 'GETADRESCURDOK' then begin
    f:=GetCurDok;
    if f=nil
      then Result:=''
      else Result := dmBase.GetAdresAkt(f.Name+'.'+ f.Dokument.Name,Params[0],Params[1]);
  end else if MethodName = 'GETADRESCURDOK2' then begin
    f:=GetCurDok;
    if f=nil                                      
      then Result:=''
      else Result:=dmBase.GetAdresAkt2(f.Name+'.'+ f.Dokument.Name,Params[0],Params[1]);
  end else if MethodName = 'GETSOATOAKT' then begin
    ds:=GlobalSeekDataSet(Params[0],sdsCompName);
    SOATO := dmBase.GetSoatoAkt(ds,Params[1],Params[2],Params[3]);
    result:=SOATO.kod;
  end else if MethodName = 'GETWHEREPUNKTULDOM' then begin
    Result:=GetWherePunktUlDom(Params[0], Params[1], Params[2], Params[3], Params[4], TDataSet(Integer(Params[5])), Params[6]);
  end else if MethodName = 'UP' then begin
    if GlobalTask.ParamAsBoolean('AKT_UPPER') then begin
      Result:=ANSIUpperCase(Params[0]);
    end else begin
      Result:=Params[0];
    end;
  end else if MethodName = 'UPF' then begin
    if GlobalTask.ParamAsBoolean('AKT_UPPER_FIO') then begin
      Result:=ANSIUpperCase(Params[0]);
    end else begin
      Result:=Params[0];
    end;
  end else if MethodName = 'FU' then begin
    Result:=ANSIUpperCase(Copy(Params[0],1,1))+Copy(Params[0],2,Length(Params[0]));
  end else if MethodName = 'CE' then begin
    v1:=Params[0];
    if (VarToStr(v1)='') or (VarToStr(v1)='-')
      then Result:=GlobalTask.ParamAsString('EMPTY_FLD_AKT')
      else Result:=v1;
  end else if MethodName = 'CEE' then begin
    v1:=Params[0];
    if (VarToStr(v1)='') or (VarToStr(v1)='-')
      then Result:=''
      else Result:=v1;
  end else if MethodName = 'GETSQLVOZRAST' then begin
    Result := dmBase.GetSQLForVozrast(Params[0],Params[1]);
  end else if MethodName = 'GETPADEGFIO' then begin
    Result := GetPadegFIO(Params[0],Params[1],Params[2]);
  end else if MethodName = 'GETPADEGFIO3' then begin
    Result := GetPadegFIO3(Params[0],Params[1],Params[2],Params[3],Params[4]);
  end else if MethodName = 'FIRSTUPPER' then begin
    Result := FirstUpper(Params[0]);
  end else if MethodName = 'FIRSTCHARUPPER' then begin
    Result := FirstCharUpper(Params[0]);
  end else if MethodName = 'ISGORSOVET' then begin                  // 41
    Result := fmMain.IsGorSovet;
  end else if MethodName = 'GETOTMETKA' then begin
    Result:=GetOtmetka(Params[0],TStringList(Integer(Params[1])));
  end else if MethodName = 'GETFIELDAKT' then begin
    Result := null;
    if fCurDok<>nil then begin
      try
        Result := fCurDok.Dokument.FieldByName(Params[0]).Value;
        if (Result=null) and (Params[1]<>null) then Result:=Params[1];
      except
      end;
    end;
  end else if MethodName = 'GETCURDOK' then begin
    Result:=Integer(fCurDok.Dokument);
  end else if MethodName = 'DBGETMEN' then begin
    Result:=Integer(dmBase.GetMen(Params[0], Params[1]));
  end else if MethodName = 'CURRENTSOST' then begin
    Result:=dmBase.GetDateCurrentSost;
  end else if MethodName = 'NAMEBLANKFROMTYPE' then begin
    Result := NameBlankFromType(Params[0]);
  end else if MethodName = 'DOLG_RUK_ZAGS' then begin
    Result := GetNameRukZAGS;
  end else if MethodName = 'DOLG_SPEC_ZAGS' then begin          // 45
    Result := GetNameSpecZAGS;
  end else if MethodName = 'GETSP_J' then begin          // 45
    Result := GetSP_J(Params[0],Params[1]);
  end else if MethodName = 'SUBDATEPROPISB' then begin
    Result := SubDatePropisB(Params[0],Params[1],Params[2]);
  end else if MethodName = 'ADRES_GOROD' then begin
    Result := dmBase.Adres_Gorod;
  end else if MethodName = 'ADRES_SELO' then begin
    Result := dmBase.Adres_Selo;
  end else if MethodName = 'ADRES_ISGOROD' then begin
    Result := dmBase.Adres_IsGorod;
  end else if MethodName = 'GETHISTPRSMERT' then begin    // 50
    Result := fCurDok.GetHistPrSmert('');
  end else if MethodName = 'GETHISTPRSMERTEX' then begin    // 50
    Result := fCurDok.GetHistPrSmert(Params[0]);
  end else if MethodName = 'GETPRSMERT' then begin
    Result := fCurDok.GetPrSmert(Params[0]);
  end else if MethodName = 'GETPRSMERTEX' then begin
    Result := fCurDok.GetPrSmert(Params[0],Params[1]);
  end else if MethodName = 'GETADDPROP' then begin
    Result := fCurDok.GetAddPROP(Params[0]);
  end else if MethodName = 'GETDATEPROPIS' then begin
    Result := GetDatePropis(Params[0],Params[1],Params[2]);
  end else if MethodName = 'INITHOUSEPROP' then begin
    //--- отличается от старой версии -----
    Result := dmBase.InitHouseProp(GetDateFiksReport,Params[0],Params[1],Params[2],Params[3],-1);
  end else if MethodName = 'GETHOUSEPROP' then begin
    Result := dmBase.GetHouseProp(Params[0],Params[1]);
  end else if MethodName = 'GETUL' then begin        // 55
    Result := getUL(Params[0]);
  end else if MethodName = 'CHECKCHETNOMER' then begin
    Result := CheckChetNomer(Params[0]);
  end else if MethodName = 'SETTYPEPRINTSVIDRAST' then begin
    DokZAGS.setTypePrintSvidRast(Params[0]);
  end else if MethodName = 'MAINDATEFIKS' then begin
    Result := fmMain.DateFiks;
  end else if MethodName = 'MAINYEARFIKS' then begin
    {$IFDEF ZAGS}
      Result:=fmMain.YearFiks;
    {$ELSE}
      Result:=0;
    {$ENDIF}
  end else if MethodName = 'CURYEARFIKS' then begin
    {$IFDEF ZAGS}
      Result:=fmMain.YearFiks;
    {$ELSE}
      Result:=0;
    {$ENDIF}
  end else if MethodName = 'GETDOKUMENTAKT' then begin
    p:=dmBase.GetPasportAkt(Params[0],Params[1],0);
    Result:=dmBase.PasportToText(p,0);
  end else if MethodName = 'GETDOKUMENTAKTEX' then begin
    p:=dmBase.GetPasportAkt(Params[0],Params[1],0);
    Result:=dmBase.PasportToText(p,Params[2]);
  end else if MethodName = 'GETDOKUMENTCURDOK' then begin
    f:=GetCurDok;
    if f=nil then begin
      Result:=''
    end else begin
      p:=dmBase.GetPasportAkt(f.Name+'.'+ f.Dokument.Name,Params[0],0);
      Result:=dmBase.PasportToText(p,0);
    end;
  end else if MethodName = 'GETDOKUMENTCURDOKARR' then begin
    f:=GetCurDok;
    Result:=VarArrayOf(['','','','','']);
    if f=nil then begin

    end else begin
      p:=dmBase.GetPasportAkt(f.Name+'.'+ f.Dokument.Name,Params[0],0);
      if (P.UdostKod=0) or (P.UdostKod=888) then begin
         if P.Organ<>'' then Result[0]:=P.Organ;
      end else if P.UdostKod=999 then begin
         Result[0]:=P.Udost;  // 'документ не представлен'
      end else begin
        if Trim(P.Seria+P.Nomer)<>'' then begin
          Result[0]:=P.Udost;
          Result[1]:=P.Seria;
          Result[2]:=P.Nomer;
          Result[3]:=P.Organ;
          if P.sDate='' then Result[4]:='' else Result[4]:=DatePropis(p.Date,Params[1]);
        end;
      end;
    end;
  end else if MethodName = 'GETDOKUMENTCURDOKEX' then begin
    f:=GetCurDok;
    if f=nil then begin
      Result:=''
    end else begin
      p:=dmBase.GetPasportAkt(f.Name+'.'+ f.Dokument.Name,Params[0],0);
      Result:=dmBase.PasportToText(p,Params[1]);
    end;
  end else if MethodName = 'SHTAMPORG' then begin         // 60
    Result:=fmMain.ShtampOrg(Params[0]);
  end else if MethodName = 'NAMEPUNKT' then begin
    Result:=dmBase.NamePunkt(Params[0],Params[1],Params[2]);
  end else if MethodName = 'PUNKTISGOROD' then begin
    Result:=dmBase.PunktIsGorod(Params[0],Params[1]);
  end else if MethodName = 'NAMEOBL' then begin
    // в params[1] передано имя поля
    if (VarType(Params[1])=varString) or (VarType(Params[1])=varOLEStr) then begin
      Result:=dmBase.NameObl(Params[0], BooleanToInt(fCurDok.Dokument.FindField(Params[1])), Params[2]);
//    fld:=fCurDok.Dokument.FindField(Params[1]);
//    Result:=dmBase.NameObl(Params[0], BooleanToInt(fld), Params[2]);
    end else begin
     // в params[1] передано BOOLEAN значение для типа область/край
      n:=Params[1];
      Result:=dmBase.NameObl(Params[0], n, Params[2]);
    end;
  end else if MethodName = 'NAMEOBL2' then begin
    n:=Params[1];
    Result:=dmBase.NameObl(Params[0], n, Params[2]);
  end else if MethodName = 'VOZRASTBEL' then begin        // 64
    Result:=VozrastBel(Params[0],Params[1]);
  end else if MethodName = 'SEEKVALUESPR' then begin        // 65
    if VarIsNull(Params[2]) or VarIsEmpty(Params[2]) or (Trim(VarToStr(Params[2]))='')
      then Result := ''
      else Result := dmBase.SeekValueTable(Params[0],Params[1],Params[2],Params[3]);
  end else if MethodName = 'READDETI' then begin        // 66
    Result:=Integer(ReadDeti(Params[0],Params[1],Params[2],Params[3],Params[4],Params[5]));
  end else if MethodName = 'READDETILIC' then begin        // 67
    Result:=Integer(ReadDetiLic(Params[0],Params[1],Params[2],Params[3]));
  end else if MethodName = 'CHECKMENS' then begin        // 68
    Result:=CheckMens(TDataSet(Integer(Params[0])), Params[1], Params[2]);
  end else if MethodName = 'CHECKMENS2' then begin        // 68
    Result:=CheckMens2(TDataSet(Integer(Params[0])), Params[1], Params[2], Params[3], Params[4]);
  end else if MethodName = 'GETVOENKOMMEN' then begin        // 69
    Result:=GetVoenkomMen(Params[0],Params[1],Params[2]);
  end else if MethodName = 'GETOTNOSH' then begin        // 70
    Result:=GetOtnosh(Params[0],Params[1],Params[2],Params[3],Params[4]);
  end else if MethodName = 'ISACCOUNTRNGOR' then begin        // 71
    Result:=IsAccountRnGor;
  end else if MethodName = 'PODPIS_INIT' then begin        // 72
    Result:=Podpis_Init(Params[0]);
  end else if MethodName = 'PODPIS_DOLG' then begin        // 73
    Result:=Podpis_Dolg(Params[0]);
  end else if MethodName = 'PODPIS_FIO' then begin        // 74
    Result:=Podpis_FIO(Params[0]);
  end else if MethodName = 'PODPIS_PERENOS' then begin        // 75
    Result:=Podpis_Perenos;
  end else if MethodName = 'POLFROMNAME' then begin        // 76
    Result:=PolFromName(Params[0]);
  end else if MethodName = 'POLFROM' then begin        // 76
    Result:=PolFrom(Params[0],Params[1]);
  end else if MethodName = 'GETNAMEASPOL' then begin        //
    v1:=null;
    RunFuncScript('GETNAMEASPOL', [Params[0],Params[1]], v1, lRun);
    Result:=v1;
  end else if MethodName = 'EMPTYIZM' then begin          //
    Result := fCurDok.EmptyIzm;
  end else if MethodName = 'GETIZM' then begin            //
    if Trim(VarToStr(Params[0]))=''
      then Result:=fCurDok.EmptyIzm+'.'
      else Result:=VarToStr(Params[0]);
  end else if MethodName = 'RUNTEMPLATE' then begin        //
    Result:=RunTemplate(Params[0]);
  end else if MethodName = 'GETNOMERSVID' then begin        //
    Result:=GetNomerSvid(Params[0]);
  end else if MethodName = 'GETBOOKMARKMEN' then begin        //
    Result:=GetBookmarkMen;
  end else if MethodName = 'GETBOOKMARKMEN2' then begin        //
    Result:=GetBookmarkMen2(Params[0]);
  end else if MethodName = 'GETWORKDATASET' then begin        //
    Result:=Integer(GetWorkDataSet(Params[0]));
  end else if MethodName = 'ISMYID' then begin        //
    Result:=IsMyID(Params[0],Params[1]);
  end else if MethodName = 'MYID' then begin        //
    Result:=MyID
  end else if MethodName = 'SETREPEATREPORT' then begin        //
    SetRepeatReport(Params[0])                             
  end else if MethodName = 'GETRESOURCE' then begin        //
    Result:=getResource(Params[0],Params[1]);
  end else if MethodName = 'GETPRIL' then begin        //
    Result:=getPril(Params[0],Params[1],Params[2]);
  end else if MethodName = 'GETPRIL2' then begin        //
    Result:=getPril2(Params[0],Params[1],Params[2],Params[3]);
  end else if MethodName = 'SETGLOBALFILTERPUNKT' then begin        //
    SetGlobalFilterPunkt(Params[0])
  end else if MethodName = 'GETGLOBALFILTERPUNKT' then begin        //
    Result:=GetGlobalFilterPunkt;

//    AddMethod('function ReadDeti(strID:String; strPol:String; Vozr1,Vozr2:Integer; lOnlyLic:Boolean):TDataSet;', CallMethod, NAME_LIB, 'Прочитать детей');
//    AddMethod('function CheckMens(ds:TDataSet; lAddOntosh:Boolean; nTypeDate:Integer):Boolean;', CallMethod, NAME_LIB, 'Отметить поле "CHECK" в переданном DataSet');

 end;
end;

{$ENDIF}

//----------------------------------------------
//   USE FR2.5
//----------------------------------------------
constructor TSelFunctionLibrary.Create;
begin
  inherited Create;
  with List do begin
    Add('SETDATEFIKS');     //0
    Add('GETDATEFIKS');     //1
    Add('ADRESFROMID');     //2
    Add('READPROPERTY');    //3
    Add('RUNFUNCSCRIPT');   //4
    Add('NAMEORG');         //5
    Add('DateFiksReal');   //6
    Add('GETCOUNTYEAR');   //7
    Add('GETVOZRAST');     //8
    Add('RAION_NAME');     //9
    Add('OBL_NAME');       //10
    Add('GETPADEG');       //11
    Add('ADRES_PUNKT');    //12
    Add('ADRES_UL');       //13
    Add('ADRES_DOM');      //14
    Add('ADRES_KORP');     //15
    Add('ADRES_KV');       //16
    Add('DBLASTDVIGMEN');  //17
    Add('LASTDVIGMEN');    //18
    Add('GETDAYSPROPIS');  //19
    Add('GETMONTHPROPIS');  //20
    Add('GETYEARPROPIS');  //21
    Add('SPRNAMEORG');     //22
    Add('ONLYRAION_NAME');     //23
    Add('CONCAT_IF2');     //24
    Add('CONCAT_IF1');     //25
    Add('CURRENTDATE');     //26
    Add('MEN_ADRESANDTELEFON');     //27
    Add('HIST');     // 28
    Add('SUBDATEPROPIS'); // 29
    Add('SUBDATEYEAR');   // 30
    Add('SUBDATEMONTH');  // 31
    Add('SUBDATEDAY');    // 32
    Add('IDPROG');    // 33
    Add('SPRNAMEORGR');     //34
    Add('GETBELNAZV');      //35
    Add('GETADRESAKT');     //36
    Add('CE');     //37
    Add('GETSQLVOZRAST');   //38
    Add('GETPADEGFIO');     //39
    Add('ISGORSOVET');      //40
    Add('GETADRESAKT2');    //41
    Add('GETFIELDAKT');    //42
    Add('NAMEBLANKFROMTYPE');    //43
    Add('DOLG_RUK_ZAGS');
    Add('DOLG_SPEC_ZAGS');
    Add('SUBDATEPROPISB'); // 46
    Add('ADRES_GOROD');    //47
    Add('ADRES_SELO');     //48
    Add('ADRES_ISGOROD');  //49
    Add('GETHISTPRSMERT');  //50
    Add('GETPRSMERT');      //51
    Add('GETDATEPROPIS');  //52
    Add('INITHOUSEPROP');  //53
    Add('GETHOUSEPROP');  //54
    Add('GETUL');  //55
    Add('CHECKCHETNOMER');  //56
    Add('SETTYPEPRINTSVIDRAST');  //57
    Add('MAINDATEFIKS');  //58
    Add('GETDOKUMENTAKT');  //59
    Add('SHTAMPORG');  // 60
    Add('NAMEPUNKT');  // 61
    Add('PUNKTISGOROD');  // 62
    Add('NAMEOBL');  // 63
    Add('VOZRASTBEL');     //64
    Add('ADRESPROPISMEN');       //65
    Add('GETTAILADRES');      //66
    Add('GETLISTVALUES');      //67
    Add('ADRES_NDOM');         //68

    Add('PODPIS_INIT');       // 69
    Add('PODPIS_DOLG');       // 70
    Add('PODPIS_FIO');       // 71
    Add('PODPIS_PERENOS');   // 72
    Add('VIBITMEN');   // 73
    Add('ADRESISUPPER');   // 74
    Add('GETADDPROP');      //75
    Add('CURVALUE');      //76
    Add('EMPTYIZM');      //77
    Add('GETIZM');      //78
    Add('RS');      //79
    Add('TYPERS');      //80
    Add('GETSP_J');        // 81
    Add('ONLYSVID');     // 82
    Add('GETPADEGFIO3');    //83
    Add('SETREPEATREPORT');  // 84
    Add('RSF');      //85
    Add('TYPERSF');      //86
    Add('ADDWHERECURIDBASE'); //87
    Add('GETGRAG');  // 88
    Add('GETRESOURCE');  // 89
    Add('GETPRIL');  // 90
    Add('GETREPORTID');  // 91
    Add('SETREPORTID');  // 92
    Add('PENSVOZRG');   //93
    Add('PENSVOZRM');   //94
    Add('CHECKDATEFIKSSQL');   //95
    Add('CHECKPARAMSSQL');   //96
    Add('LASTSVIDPOVTOR'); //97
    Add('MEN_MESTOROGD');  // 98
    Add('MEN_MESTOOTKUDA');  // 99
    Add('CONDIN');  // 100
    Add('MAINYEARFIKS');  //101
    Add('CEE');  //102
  end;
end;

//-------------------------------------------------
procedure TSelFunctionLibrary.DoFunction(FNo: Integer; p1, p2, p3: Variant;  var val: Variant);
var
  s1,s2 : String;
  i,j : Integer;
  fld : TField;
//  pr : TPropertyAds;
  v1,v2 : Variant;
  d,dd : TDateTime;
  nYear, nMonth, nDay : Word;
  l : Boolean;
  p : TPassport;
  adr:TAdres;
  arr:TArrStrings;
begin
  val := 0;
  case FNo of
    // SetDateFiks
    0  : begin
           d := frParser.Calc(p1);
           SetDateFiksReport(d);
         end;
    // GetDateFiks
    1  : begin
           val := GetDateFiksReport;
         end;
    // AdresFromID
    2  : begin
          if (p2<>'') then l:=frParser.Calc(p2) else l:=false;
          val := dmBase.AdresFromID( DateFiksReport, IntToStr(frParser.Calc(p1)),l);
         end;
    // ReadProperty
    3  : begin
           val := dmBase.ReadOneProp(DateFiksReport, frParser.Calc(p1),
                                     frParser.Calc(p2), ftUnknown );
         end;
    // RunFuncScript
    4 : begin
          s1 := frParser.Calc(p1);
          v1:=null;
          v2:=null;
          if (p2<>'') then begin
            v1 := frParser.Calc(p2);
            if (p3<>'') then v2 := frParser.Calc(p3);
          end;
          val := _RunFuncScript(s1,v1,v2);
        end;
    // NameOrg
    5 : begin
          if p1='' then begin
            val := fmMain.NameOrg('', '');
          end else begin
            if p2 = '' then begin
              val := fmMain.NameOrg(frParser.Calc(p1), '');
            end else begin
              val := fmMain.NameOrg(frParser.Calc(p1), frParser.Calc(p2));
            end;
          end;
        end;
    // DateFiksReal
    6 : begin
          i:=0;
          if p1<>null then begin
            i := frParser.Calc(p1);
          end;
          if GetDateFiksReport = dmBase.GetDateCurrentSost then begin
            val := dmBase.getCurDate;
          end else begin
            val := GetDateFiksReport;
            if i > 0 then begin
              DecodeDate(val, nYear, nMonth, nDay);
              val := EncodeDate(nYear, i, nDay);
            end;
          end;
        end;
    // GetCountYear
    7 : begin
          dd := frParser.Calc(p1);
          d  := frParser.Calc(p2);
          i  := GetCountYear(dd,d);
          val := i;
        end;
    // GetVozrast
    8 : begin
          i   := frParser.Calc(p1);
          if (p2='') then begin
            val := GetVozrast(i,true);
          end else begin
            val := GetVozrast(i,frParser.Calc(p2));
          end;
        end;
    // Raion_Name
    9 : val := fmMain.NameRaion(frParser.Calc(p1));
    // Obl_Name
    10: val := fmMain.NameObl(frParser.Calc(p1));
    // GetPadeg
    11: val := fmMain.GetPadeg(frParser.Calc(p1),frParser.Calc(p2));
    // Adres_Punkt
    12: val := dmBase.Adres_Punkt;
    // Adres_UL
    13: val := dmBase.Adres_UL;
    // Adres_Dom
    14: val := dmBase.Adres_Dom;
    // Adres_Korp
    15: val := dmBase.Adres_Korp;
    // Adres_Kv
    16: val := dmBase.Adres_Kv;
    // dbLastDvigMen
    17: val := dmBase.LastDvigMenS( IntToStr(frParser.Calc(p1)), '' );
    // LastDvigMen
    {$IFDEF ADD_MENS_PU}
    18: val := TdmMen(fCurMen.Dokument).LastDvigMenS( IntToStr(frParser.Calc(p1)) );
    {$ELSE}
    18: val:='';
    {$ENDIF}
    19: val := GetDaysPropis(frParser.Calc(p1),frParser.Calc(p2));
    20: val := GetMonthPropis(frParser.Calc(p1),frParser.Calc(p2));
    21: val := GetYearPropis(frParser.Calc(p1),frParser.Calc(p2));
    // SprNameOrg
    22 : val := fmMain.SprNameOrg2(frParser.Calc(p1), frParser.Calc(p2), frParser.Calc(p3));
    // OnlyRaion_Name
    23 : val := fmMain.OnlyNameRaion(frParser.Calc(p1));
    // Concat_IF2
    24 : val := Concat_IF2(frParser.Calc(p1),frParser.Calc(p2));
    // Concat_IF1
    25 : val := Concat_IF1(frParser.Calc(p1),frParser.Calc(p2));
    // CurrentDate
    26 : val := GlobalTask.CurrentDate;
    // Men_AdresAndTelefon
    {$IFDEF ADD_MENS_PU}
    27 : val := TdmMen(fCurMen.Dokument).GetAdresAndTelefon;
    {$ELSE}
    27 : val:='';
    {$ENDIF}
    // Hist
    28 : begin
           if (p2='') then begin
             i := 1;
           end else begin
             i := frParser.Calc(p2);
           end;
           if (p3='') then begin
             s1 := '';
           end else begin
             s1 := frParser.Calc(p3);
           end;
           val := fCurDok.GetHistValueField(frParser.Calc(p1),i,s1);
         end;
    // SubDatePropis
    29 : val := SubDatePropis( frParser.Calc(p1), frParser.Calc(p2),
                               frParser.Calc(p3) );
    // SubDateYear
    30 : val := SubDateYear( frParser.Calc(p1), frParser.Calc(p2) );
    // SubDateMonth
    31 : val := SubDateMonth( frParser.Calc(p1), frParser.Calc(p2) );
    // SubDateDay
    32 : val := SubDateDay( frParser.Calc(p1), frParser.Calc(p2) );
    // IdProg
    33 : val := fmMain.IdProg;
    // SprNameOrgR
    34 : val := fmMain.SprNameOrg(frParser.Calc(p1), frParser.Calc(p2), frParser.Calc(p3));
    // GetBelNazv
    35 : val := dmBase.GetBelNazv(frParser.Calc(p1), frParser.Calc(p2), frParser.Calc(p3));
    // GetAdresAkt
    36 : val := dmBase.GetAdresAkt(frParser.Calc(p1), frParser.Calc(p2), frParser.Calc(p3));
    // CE
    37 : begin
           v1 := frParser.Calc(p1);
           if (VarToStr(v1)='') or (VarToStr(v1)='-')
             then val := GlobalTask.ParamAsString('EMPTY_FLD_AKT')
             else val := v1;
         end;
    // GetSQLVozrast
    38 : val := dmBase.GetSQLForVozrast(frParser.Calc(p1), frParser.Calc(p2) );
    // GetPadegFIO
    39 : val := GetPadegFIO(frParser.Calc(p1), frParser.Calc(p2), frParser.Calc(p3) );
    // IsGorSovet
    40 : val := fmMain.IsGorSovet;
    // GetAdresAkt2
    41 : val := dmBase.GetAdresAkt2(frParser.Calc(p1), frParser.Calc(p2), frParser.Calc(p3));
    // GetFieldAkt
    42 : begin
           val := '';
           if p2='' then l:= true
                    else l:= frParser.Calc(p2);
           if fCurDok<>nil then begin
             fld := fCurDok.Dokument.FindField(frParser.Calc(p1));
             if fld = nil then begin
               if l then PutError('Поле '+frParser.Calc(p1)+' не найдено. ' );
               val := '';
             end else begin
               if fld.IsNull
                 then val := ''
                 else val := fld.Value;
             end;
           end;
         end;
    43 : val := NameBlankFromType(frParser.Calc(p1));
    //  DOLG_RUK_ZAGS
    44 : val := GetNameRukZAGS;
    // DOLG_SPEC_ZAGS
    45 : val := GetNameSpecZAGS;

    // SubDatePropisB
    46 : val := SubDatePropisB( frParser.Calc(p1), frParser.Calc(p2),
                               frParser.Calc(p3) );
    // Adres_Gorod
    47: val := dmBase.Adres_Gorod;
    // Adres_Selo
    48: val := dmBase.Adres_Selo;
    // Adres_IsGorod
    49: val := dmBase.Adres_IsGorod;
    // GetHistPrSmert
    50 : val := fCurDok.GetHistPrSmert('');
    // GetPrSmert
    51 : val := fCurDok.GetPrSmert(frParser.Calc(p1));
    // GetDatePropis
    52 : val := GetDatePropis(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3));
    // InitHouseProp
    53 : begin
           s1 := frParser.Calc(p3);     // дом
           s2 := '';                    // корпус
           if Copy(s1,1,1)='+'
           then begin
             s2:=Copy(s1,2,Length(s1)); // корпус
             s1:='';                    // дом
           end;
           val := dmBase.InitHouseProp(GetDateFiksReport,frParser.Calc(p1),
                                      frParser.Calc(p2),s1,s2,-1);
         end;
    // GetHouseProp
    54 : begin
           if p2='' then s1:=''
                    else s1:=frParser.Calc(p2);
           val := dmBase.GetHouseProp(frParser.Calc(p1), s1);
         end;
    // GetUL
    55 : val := getUL(frParser.Calc(p1));
    // CheckChetNomer
    56 : val := CheckChetNomer(frParser.Calc(p1));
    //setTypePrintSvidRast
    57 : DokZAGS.setTypePrintSvidRast( frParser.Calc(p1) );
    //MainDateFiks
    58 : val := fmMain.DateFiks;
    // GetDokumentAkt
    59 : begin
           if p3=null then i:=0 else i:=frParser.Calc(p3);
           p:=dmBase.GetPasportAkt(frParser.Calc(p1), frParser.Calc(p2), i);
           val:=dmBase.PasportToText(p,0);
         end;
    // ShtampOrg
    60 : begin
           if p1=null then i:=0
                      else i:=frParser.Calc(p1);
           val := fmMain.ShtampOrg(i);
         end;
    // NamePunkt
    61 : begin
           // p1 название нас. пункта
           // тип населенного пункта
           try
             if p2=null then i:=0
                        else i:=frParser.Calc(p2);
           except
             i:=0;
           end;
           // на каком языке
           if p3=null then s1:='R'
                      else s1:=frParser.Calc(p3);
           val:=dmBase.NamePunkt(frParser.Calc(p1), i, s1);
         end;
    // PunktIsGorod
    62 : begin
           // p1 название нас. пункта
           // тип населенного пункта
           try
             if p2=null then i:=0
                        else i:=frParser.Calc(p2);
           except
             i:=0;
           end;
           val:=dmBase.PunktIsGorod(frParser.Calc(p1), i);
         end;
    // NameObl
    63 : begin
           // p1 название области(края)
           // тип
           if (p2=null) or (p2='') then begin  // значение для вычисления не передано
             fld:=nil;
           end else begin
             j:=Pos('"',p2);    // передано не только имя поля, а типа: [fmTalonPrib.Dokument."B_OBL_R"]
             // нужно выделить имя поля
             if j>0 then begin
               i:=PosEx('"',p2,j+1);
               if i>0 then p2:=Copy(p2,j+1,i-j-1);
             end;
             p2:=StringReplace(p2,'''','',[rfReplaceAll]);
             fld := fCurDok.Dokument.FindField(p2);
           end;
           // на каком языке
           if p3=null then s1:='R'
                      else s1:=frParser.Calc(p3);
           val:=dmBase.NameObl(frParser.Calc(p1), BooleanToInt(fld), s1);
         end;
    // VozrastBel
    64 : begin
          i   := frParser.Calc(p1);
          if (p2='') then begin
            val := VozrastBel(i,true);
          end else begin
            val := VozrastBel(i,frParser.Calc(p2));
          end;
        end;
    // AdresPropisMen
    65: begin
          adr:=dmBase.AdresMen( DateFiksReport, IntToStr(frParser.Calc(p1)), s1, true);
          val:=s1;
        end;
    // GetTailAdres
    66: begin
          val:=dmBase.GetTailAdres(frParser.Calc(p1));
        end;
    // GetListValues
    67: begin
          val:=dmBase.GetListValues(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3));
        end;
    // Adres_NDom
    68: begin
          val:=dmBase.Adres_NDom;
        end;
    // Podpis_Init
    69: begin
          val:=Podpis_Init(frParser.Calc(p1));
        end;
    // Podpis_Dolg
    70: begin
          val:=Podpis_Dolg(frParser.Calc(p1));
        end;
    // Podpis_FIO
    71: begin
          val:=Podpis_FIO(frParser.Calc(p1));
        end;
    // Podpis_Perenos
    72: begin
          val:=Podpis_Perenos;
        end;
    // VibitMen
    {$IFDEF ADD_MENS_PU}
    73: val := VibitMen(TdmMen(fCurMen.Dokument).tbMigr,frParser.Calc(p1),frParser.Calc(p2));
    {$ELSE}
    73: val:='';
    {$ENDIF}
    // AdresIsUpper
    74: val := dmBase.AdresIsUpper;
    // GetAddProp
    75 : val := fCurDok.GetAddProp(frParser.Calc(p1));
    // CurValue
    76 : val := fCurDok.Dokument.fieldByName(frParser.Calc(p1)).Value;
    // EmptyIzm
    77 : begin
           val:=fCurDok.EmptyIzm;
         end;
    // GetIzm
    78: begin
          s1:=frParser.Calc(p1);
          if trim(s1)=''
            then val:=fCurDok.EmptyIzm+'.'
            else val:=s1;
        end;
    // RS
    79: begin
          val:=RegSvid(frParser.Calc(p1),frParser.Calc(p2));
        end;
    // TypeRS
    80: begin
          val:=TypeRegSvid(frParser.Calc(p1));
        end;
    // GetSP_J
    81: begin
          if (p2='')
            then d:=0
            else d:=frParser.Calc(p2);
          val:=GetSP_J(frParser.Calc(p1), d);
        end;
    // OnlySvid
    82: begin
          val:=fCurDok.FOnlySvid;
        end;
    // GetPadegFIO3
    83: begin
          s1:=frParser.Calc(p1);
          StrToArr(s1,arr,'~');
          SetLength(arr,3);
          val:=GetPadegFIO3(arr[0],arr[1],arr[2],frParser.Calc(p2),frParser.Calc(p3));
        end;
    // SetRepeatReport
    84: begin
          SetRepeatReport(frParser.Calc(p1));
        end;
    // RSF
    85: begin
          val:=RegSvidFIO(frParser.Calc(p1),frParser.Calc(p2));
        end;
    // TypeRSF
    86: begin
          val:=TypeRegSvidFIO(frParser.Calc(p1));
        end;
    // AddWhereCurIdBase(sWhere:String; cAl:String):String
    87: begin
          val:=Globaltask.AddWhereCurIdBase(frParser.Calc(p1),frParser.Calc(p2));
        end;
    // GetGrag
    88 : val := fCurDok.GetGrag(frParser.Calc(p1),frParser.Calc(p2));
    // getResource
    89 : val := getResource(frParser.Calc(p1),frParser.Calc(p2));
    // getPril
    90 : val := getPril(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3));
    // getReportID
    91 : val := GlobalTask.GetReportId;
    // setReportID
    92 : GlobalTask.SetReportId( frParser.Calc(p1) );
    93 : val:=0; //PensVozrG;
    94 : val:=0; //PensVozrM;
    95 : val:=dmBase.CheckDateFiksSQL(frParser.Calc(p1), frParser.Calc(p2) );
    96 : val:=dmBase.CheckParamsSQL(frParser.Calc(p1) );
    97 : val:=dmBase.LastSvidPovtor(frParser.Calc(p1), frParser.Calc(p2), frParser.Calc(p3));
    // MEN_MESTOROGD
    98 : val:=MEN_MESTOROGD(frParser.Calc(p1), frParser.Calc(p2));
    99 : val:=MEN_MESTOOTKUDA(frParser.Calc(p1), frParser.Calc(p2));
    // CondIN
    100 : val := fCurDok.CondIN(frParser.Calc(p1));
    // MainYearFiks
    101 : begin
           {$IFDEF ZAGS}
             val:=fmMain.YearFiks;
           {$ELSE}
             val:=0;
           {$ENDIF}
          end;
    // CEE
    102 : begin
           v1 := frParser.Calc(p1);
           if (VarToStr(v1)='') or (VarToStr(v1)='-')
             then val := ''
             else val := v1;
         end;
  end;
end;


{$IFDEF USE_FR3}

{ TScriptObjectsFR3 }

procedure TScriptObjectsFR3.AddScriptClass(frxReport: TfrxReport);
begin
  with frxReport.Script.AddClass( TdmBase, 'TObject') do begin
    AddMethod('function GetDataSet(strNameDS:String):TDataSet', CallMethod);
  end;
end;

function TScriptObjectsFR3.CallMethod(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
var
  m:TMens;
begin
  Result := 0;
  if MethodName = 'GETDATASET' then begin
    Result:=Integer(TdmBase(Instance).GetDataSet(Params[0]))
  end else if MethodName = 'CLEAR' then begin
  end;
end;

{$ENDIF}

initialization
{$IFDEF ADD_MENS_PU}
  fCurMen := nil;
  fCurLic := nil;
{$ENDIF}
  fCurDok := nil;

{$IFDEF USE_FR3}
//----------------------------------------------
//     USE   FastReport 4.6
//----------------------------------------------
  fsRTTIModules.Add(TSelSovetFunctions);
{$ENDIF}

{$IFDEF USE_FR2}
  frRegisterFunctionLibrary(TSelFunctionLibrary);

  frAddFunctionDesc(nil, 'SETDATEFIKS', NAME_LIB,
   'SetDateFiks(<дата>)/Установить текущию дату фиксации для отчета');

  frAddFunctionDesc(nil, 'GETDATEFIKS', NAME_LIB,
   'GetDateFiks()/Вернуть текущию дату фиксации для отчета');

  frAddFunctionDesc(nil, 'ADRESFROMID', NAME_LIB,
   'AdresFromId(<Id>)/Адрес из Id');

  frAddFunctionDesc(nil, 'READPROPERTY', NAME_LIB,
   'ReadProperty(<nId>,<strProp>)/Прочитать свойство объекта');

  frAddFunctionDesc(nil, 'RUNFUNCSCRIPT', NAME_LIB,
   'RunFuncScript(<strNameFunc>,<Par1>,<Par2>)/Выполнить функцию скрипта');

  frAddFunctionDesc(nil, 'NAMEORG', NAME_LIB,
   'NameOrg/Вернуть наименование организации');

  frAddFunctionDesc(nil, 'DATEFIKSREAL', NAME_LIB,
   'DateFiksReal(<nMonth>)/Вернуть дату фиксации рельную');

  frAddFunctionDesc(nil, 'GETCOUNTYEAR', NAME_LIB,
   'GetCountYear(<dDate2>,<dDate1>)/Вернуть количество полных лет');

  frAddFunctionDesc(nil, 'GETVOZRAST', NAME_LIB,
   'GetVozrast(<iCount>,<lShowEmpty>)/Возраст в строку');

  frAddFunctionDesc(nil, 'VOZRASTBEL', NAME_LIB,
   'VozrastBel(<iCount>,<lShowEmpty>)/Возраст в строку (по-белорусски)');

  frAddFunctionDesc(nil, 'ONLYRAION_NAME', NAME_LIB,
   'OnlyRaion_Name(<strPadeg>)/Вернуть только наименование района в падеже');

  frAddFunctionDesc(nil, 'RAION_NAME', NAME_LIB,
   'Raion_Name(<strPadeg>)/Вернуть наименование района в падеже');
  frAddFunctionDesc(nil, 'OBL_NAME', NAME_LIB,
   'Obl_Name(<strPadeg>)/Вернуть наименование области в падеже');
  frAddFunctionDesc(nil, 'GETPADEG', NAME_LIB,
   'GetPadeg(<strPadeg>)/Вернуть строку в падеже');

  frAddFunctionDesc(nil, 'GETPADEGFIO', NAME_LIB,
   'GetPadegFIO(<strFIO>,<strPol>,<strPadeg>)/Вернуть ФИО в падеже');

  frAddFunctionDesc(nil, 'GETPADEGFIO3', NAME_LIB,
   'GetPadegFIO3(<sF>,<sI>,<sO>,<strPol>,<strPadeg>)/Вернуть ФИО в падеже');

  frAddFunctionDesc(nil, 'ADRES_PUNKT', NAME_LIB,
   'Adres_Punkt/Вернуть назв.пункта после AdresFromID/AdresPropisMen');

  frAddFunctionDesc(nil, 'ADRES_ISGOROD', NAME_LIB,
   'Adres_IsGorod/если назв.пункта - город, после AdresFromID');
  frAddFunctionDesc(nil, 'ADRES_GOROD', NAME_LIB,
   'Adres_Gorod/Вернуть назв.города после AdresFromID');
  frAddFunctionDesc(nil, 'ADRES_SELO', NAME_LIB,
   'Adres_SELO/Вернуть назв.села после AdresFromID');

  frAddFunctionDesc(nil, 'ADRES_UL', NAME_LIB,
   'Adres_UL/Вернуть назв.улицы после AdresFromID/AdresPropisMen');
  frAddFunctionDesc(nil, 'ADRES_DOM', NAME_LIB,
   'Adres_Dom/Вернуть дом после AdresFromID/AdresPropisMen');
  frAddFunctionDesc(nil, 'ADRES_KORP', NAME_LIB,
   'Adres_Korp/Вернуть корпус после AdresFromID/AdresPropisMen');
  frAddFunctionDesc(nil, 'ADRES_KV', NAME_LIB,
   'Adres_Kv/Вернуть квартиру после AdresFromID/AdresPropisMen');

  frAddFunctionDesc(nil, 'DBLASTDVIGMEN', NAME_LIB,
   'dbLastDvigMen(<idMen>)/(из базы)Последнее значение списка движений');
  frAddFunctionDesc(nil, 'LASTDVIGMEN', NAME_LIB,
   'LastDvigMen(<idInternalMen>)/Последнее значение списка движений');

  frAddFunctionDesc(nil, 'GETDAYSPROPIS', NAME_LIB,
   'GetDaysPropis(<dDate>,<strLang>)/Дней прописью на Bel или Rus');
  frAddFunctionDesc(nil, 'GETMONTHPROPIS', NAME_LIB,
   'GetMonthPropis(<dDate>,<strLang>)/Месяц прописью на Bel или Rus');
  frAddFunctionDesc(nil, 'GETYEARPROPIS', NAME_LIB,
   'GetYearPropis(<dDate>,<strLang>)/Год прописью на Bel или Rus');
  frAddFunctionDesc(nil, 'GETDATEPROPIS', NAME_LIB,
   'GetDatePropis(<dDate>,<strLang>,<nTypeDate(0,1,2)>)/Дата прописью на Bel или Rus');

  frAddFunctionDesc(nil, 'SPRNAMEORG', NAME_LIB,
   'SprNameOrg(<>,<>,<>)/Вернуть наименование организации');
  frAddFunctionDesc(nil, 'SPRNAMEORGR', NAME_LIB,
   'SprNameOrgR(<>,<>,<>)/Вернуть реальное наименование организации');

  frAddFunctionDesc(nil, 'CONCAT_IF2', NAME_LIB,
   'Concat_IF2(<s1>,<s2>)/Объеденить две строки, если вторая не пусто');

  frAddFunctionDesc(nil, 'CONCAT_IF1', NAME_LIB,
   'Concat_IF1(<s1>,<s2>)/Объеденить две строки, если первая не пусто');

  frAddFunctionDesc(nil, 'CURRENTDATE', NAME_LIB,
   'CurrentDate  / Текущая дата');

  frAddFunctionDesc(nil, 'MEN_ADRESANDTELEFON', NAME_LIB,
   'Men_AdresAndTelefon / Адрес и телефон текущего человека');

  frAddFunctionDesc(nil, 'HIST', NAME_LIB,
   'Hist(<strField>,<nType>) / Значение поля текущего документа 0-значение,1-вся история,2-первая история');

  frAddFunctionDesc(nil, 'ONLYSVID', NAME_LIB,
   'OnlySvid / текущий документ в режите "только свидетельство"');

  frAddFunctionDesc(nil, 'GETHISTPRSMERT', NAME_LIB,
   'GetHistPrSmert() / Историческое значение причины смерти');

  frAddFunctionDesc(nil, 'GETPRSMERT', NAME_LIB,
   'GetPrSmert(<lKod>) / Вернуть название причины смерти');

  frAddFunctionDesc(nil, 'GETADDPROP', NAME_LIB,
   'GetAddProp(<sProp>) / Вернуть значение специального свойства формы');

  frAddFunctionDesc(nil, 'SUBDATEPROPIS', NAME_LIB,
   'SubDatePropis(<d1>,<d2>,<nType-0,1,2,3>) / разность дат прописью');
  frAddFunctionDesc(nil, 'SUBDATEPROPISB', NAME_LIB,
   'SubDatePropisB(<d1>,<d2>,<nType-0,1,2,3>) / разность дат прописью по-белорусски');
  frAddFunctionDesc(nil, 'SUBDATEYEAR', NAME_LIB,
   'SubDateYear(<d1>,<d2>) / в разности дат количество лет');
  frAddFunctionDesc(nil, 'SUBDATEMONTH', NAME_LIB,
   'SubDateMonth(<d1>,<d2>) / в разности дат количество месяцев');
  frAddFunctionDesc(nil, 'SUBDATEDAY', NAME_LIB,
   'SubDateDay(<d1>,<d2>) / в разности дат количество дней');
  frAddFunctionDesc(nil, 'IDPROG', NAME_LIB,
   'IdProg() / SELSOVET или ZAGS');

  frAddFunctionDesc(nil, 'ISGORSOVET', NAME_LIB,
   'IsGorSovet() / Городской совет или нет');

  frAddFunctionDesc(nil, 'GETBELNAZV', NAME_LIB,
   'GetBelNazv(nType,lSelect,strNameR) / перевести название на белорусский 1 обл 2 р-н 3 пункт');

  frAddFunctionDesc(nil, 'ADRESISUPPER', NAME_LIB,
   'AdresIsUpper / последний адрес в верх. регистре');

  frAddFunctionDesc(nil, 'GETADRESAKT', NAME_LIB,
   'GetAdresAkt(DataSet,Param,Type) / создать адрес');

  frAddFunctionDesc(nil, 'GETADRESAKT2', NAME_LIB,
   'GetAdresAkt2(DataSet,Param,Type) / создать адрес(сокращенный)');

  frAddFunctionDesc(nil, 'GETDOKUMENTAKT', NAME_LIB,
   'GetDokumentAkt(DataSet,Param) / создать строку документа');

  frAddFunctionDesc(nil, 'CE', NAME_LIB,
   'CE(Exp) / проверить на пустоту');

  frAddFunctionDesc(nil, 'GETSQLVOZRAST', NAME_LIB,
   'GetSQLVozrast(strLastField,strFirstField) / вернуть SQL выражение для расчета возраста');

  frAddFunctionDesc(nil, 'GETFIELDAKT', NAME_LIB,
   'GetFieldAkt(<strField>,[lShowErr]) / значение поля акта,если lShowErr - сообщ. об отсут. поля');

  frAddFunctionDesc(nil, 'NAMEBLANKFROMTYPE', NAME_LIB,
   'NameBlankFromType(<nType>) / символьное значение типа бланка для ЗАГС');

  frAddFunctionDesc(nil, 'DOLG_RUK_ZAGS', NAME_LIB,
   'DOLG_RUK_ZAGS / должность руководителя ЗАГС');

  frAddFunctionDesc(nil, 'DOLG_SPEC_ZAGS', NAME_LIB,
   'DOLG_SPEC_ZAGS / должность специалиста ЗАГС');

  frAddFunctionDesc(nil, 'INITHOUSEPROP', NAME_LIB,
   'InitHouseProp(nPunkt,nUl,sDom_+Korp ) / инициализировать свойства дома');
  frAddFunctionDesc(nil, 'GETHOUSEPROP', NAME_LIB,
   'GetHouseProp(strProp) / вернуть свойство дома после инициализации');
  frAddFunctionDesc(nil, 'GETUL', NAME_LIB,
   'GetUL(vID) / название улицы');

  frAddFunctionDesc(nil, 'CHECKCHETNOMER', NAME_LIB,
   'CheckChetNomer(strDom,strKorp) / 0-не опред,1-нечет,2-чет');

  frAddFunctionDesc(nil, 'MAINDATEFIKS', NAME_LIB,
   'MainDateFiks / вернуть текущую дату состояния');

  frAddFunctionDesc(nil, 'SHTAMPORG', NAME_LIB,
   'ShtampOrg(nID) / штамп ЗАГС');
  frAddFunctionDesc(nil, 'NAMEPUNKT', NAME_LIB,
   'NamePunkt(sPunkt,nType,sLang) / собрать наименование нас. пункта');
  frAddFunctionDesc(nil, 'PUNKTISGOROD', NAME_LIB,
   'PunktIsGorod(sPunkt,nType) / нас. пунк город ?');
  frAddFunctionDesc(nil, 'NAMEOBL', NAME_LIB,
   'NameObl(sObl,sfldType,sLang) / собрать наименование области, sfldType - имя поля с типом');
  frAddFunctionDesc(nil, 'ADRESPROPISMEN', NAME_LIB,
   'AdresPropisMen(strID) / создать адрес прописки человека для GetTailAdres');
  frAddFunctionDesc(nil, 'GETTAILADRES', NAME_LIB,
   'GetTailAdres(strType)/Вернуть часть адреса после AdresPropisMen');
  frAddFunctionDesc(nil, 'GETLISTVALUES', NAME_LIB,
   'GetListValues(sTable,sField,sWhere)/Список значений поля sField в таблице sTable, по условию sWhere');
  frAddFunctionDesc(nil, 'VIBITMEN', NAME_LIB,
   'VibitMen(strType,strRazd)/ strType=''111'' дата+куда+срок');

{$ENDIF}

finalization
{$IFDEF USE_FR2}
  frUnRegisterFunctionLibrary(TSelFunctionLibrary);
{$ENDIF}
end.


