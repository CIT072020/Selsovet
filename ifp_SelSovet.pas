
unit ifp_SelSovet;

{$I Task.inc}

{$IFDEF RO_SCRIPT}
  {$I PascalScript.inc}
{$ELSE}
  {$I ifps3_def.inc}
{$ENDIF}
interface

uses
 {$IFDEF VER150} Variants, {$ENDIF}
  Dialogs, Forms, Classes,fMain, dBase, MetaTask, uProjectAll, uPadegFIO, fWarning, SysUtils, db, funcPr, dbFunc, QStrings,
  {$IFDEF ADD_MENS_PU}
  fPrintSSS,
  {$ENDIF}
  fCheckMens,uProject, OpisEdit,
{$IFDEF RO_SCRIPT}
  uPSRunTime,uPSCompiler,uPSUtils,uPSComponent;
{$ELSE}
  ifps3, ifpscomp, ifps3utl
{$ENDIF}

{$IFDEF RO_SCRIPT}
type
  TIFPSPascalCompiler = TPSPascalCompiler;
  TIFPS3CompExec = TPSScript;
{$ENDIF}

  procedure SIRegister_SelSovet(Cl: TIFPSPascalCompiler);
  procedure RIRegister_SelSovet(Cl: TIFPSRuntimeClassImporter);

  procedure RegisterSelSovetLibrary_C(S: TIFPSPascalCompiler);
  procedure RegisterSelSovetLibrary_R(S: TIFPSExec);

  function NameBlankFromType(nType : Integer) : String;

implementation

uses SelLibFR, uObjectsScript, mPermit,
   {$IFDEF ADD_MENS_PU} fCreateReshOch, fGurnOchered, {$ENDIF}
    fGurnal;

//--------------------------------------
function IsSimpleVvod : Boolean;
begin
{$IFDEF ZAGS}
  Result:=fmMain.IsSimpleVvod;
{$ELSE}
  Result:=false;
{$ENDIF}
end;
//--------------------------------------
function Raion_Name( strP : String) : String;
begin
 Result := fmMain.NameRaion(strP);
end;
//--------------------------------------
function OnlyRaion_Name( strP : String) : String;
begin
 Result := fmMain.OnlyNameRaion(strP);
end;
//--------------------------------------
function Obl_Name( strP : String) : String;
begin
 Result := fmMain.NameObl(strP);
end;
//--------------------------------------
function GetPadeg( s1, s2 : String) : String;
begin
 Result := fmMain.GetPadeg(s1,s2);
end;
//--------------------------------------
function NameOrg( s1, s2 : String) : String;
begin
 Result := fmMain.NameOrg(s1,s2);
end;
//--------------------------------------
function IsGorSovetS : Boolean;
begin
 Result := fmMain.IsGorSovet;
end;                                                            
//--------------------------------------
function CurForm : TForm;
begin
  Result := fmMain.FormCurrentDok;
end;
//--------------------------------------
function IsSystemAdmin:Boolean;
begin
  Result:=Role.SystemAdmin;
end;
//--------------------------------------
function IsAdmin:Boolean;
begin
  Result:=(Role.SystemAdmin or (Role.Status=rsAdmin));
end;
//----------------------------------------------------------------------------------------
function IdProg : String;
begin
  Result := fmMain.IdProg;
end;
function IdProg1 : String;
begin
  Result := Copy(fmMain.IdProg,1,1);
end;
//----------------------------------------------------------------------------------------
function GetSQLVozrast( strLastField : String; strFirstField : String) : String;
begin
  Result := dmBase.GetSQLForVozrast(strLastField, strFirstField);
end;
//----------------------------------------------------------------------------------------
function GetAdresAkt( ds:TDataSet; strParam:String; nType:Integer; lPrintOblAll:Boolean) : String;
begin
  Result := dmBase.GetAdresAkt3(ds,strParam,nType,lPrintOblAll);
end;
//----------------------------------------------------------------------------------------
procedure RunPrintForm(strName : String);
begin
  strName := ANSIUpperCase(strName);
  if strName = 'FMPRINTSSS' then begin
  {$IFDEF ADD_MENS_PU}
    RunPrintSSS;
  {$ENDIF}
  end;
end;
//----------------------------------------------------------------------------------------
function RunForm(strName : String):Variant;
begin
  Result:=null;
  strName := ANSIUpperCase(strName);
  if strName = 'CREATERESHOCH' then begin
  {$IFDEF ADD_MENS_PU}
    Result:=Run_CREATERESHOCH(CurGurnal,'');
  {$ENDIF}
  end;
end;
function RunFormEx(strName : String; strParams:String):Variant;
begin
  Result:=null;
  strName := ANSIUpperCase(strName);
  if strName = 'CREATERESHOCH' then begin
  {$IFDEF ADD_MENS_PU}
    Result:=Run_CREATERESHOCH(CurGurnal,strParams);
  {$ENDIF}
  end;
end;
//----------------------------------------------------------------------------------------
function SeekValueSpr(strName: String; strKeyFields:String; strSeek : Variant; strField : String) : Variant;
begin
  if strSeek=null then begin
    Result:='';
  end else begin
    if Trim(VarToStr(strSeek))=''
      then Result := ''
      else Result := dmBase.SeekValueTable(strName,strKeyFields,varToStr(strSeek),strField);
  end;
end;
//----------------------------------------------------------------------------------------
function MainDateFiks : TDateTime;
begin
  Result := fmMain.DateFiks;
end;
//----------------------------------------------------------------------------------------
function NameBlankFromType(nType : Integer) : String;
begin
  if nType = dmBase.TypeObj_ZBrak then begin
    Result := 'О заключении брака';
  end else if nType = dmBase.TypeObj_ZRogd then begin
    Result := 'О рождении';
  end else if nType = dmBase.TypeObj_ZSmert then begin
    Result := 'О смерти';
  end else if nType = dmBase.TypeObj_ZUstOtc then begin
    Result := 'Об установлении отцовства';
  end else if nType = dmBase.TypeObj_ZUstMat then begin
    Result := 'Об установлении материнства';
  end else if nType = dmBase.TypeObj_ZAdopt then begin
    Result := 'Об усыновлении';
  end else if nType = dmBase.TypeObj_ZChName then begin
    Result := 'О перемене имени';
  end else if nType = dmBase.TypeObj_ZRast then begin
    Result := 'О расторжении брака';
  end;
end;

function IsGISUN : Boolean;
begin
{$IFDEF GISUN}
  Result:=true;
{$ELSE}
  Result:=false;
{$ENDIF}
end;

function GetSQLCurGurnal:String;
begin
  Result:=CurGurnal.Query.SQL.Text;
end;

function GetWhereCurGurnal:String;
begin
//  Result:=CurGurnal.FilterInterface.GetCurrentSQL;
  Result:=CurGurnal.GetCurrentWhere;
end;

function GetBookmarkCurGurnal(sl:TStringList):Boolean;
begin
  Result:=CurGurnal.GetBookmark(sl);
end;

function BookmarkCurGurnalToFilter(sField:String):Boolean;
begin
  Result:=CurGurnal.BookmarkToFilter(sField);
end;

function BookmarkCurGurnalToValues(sField:String; sDelim:String):String;
begin
  Result:=CurGurnal.BookmarkToValues(sField,sDelim);
end;

function GetFilterCurGurnal:String;
begin
//  Result:=CurGurnal.FilterInterface.GetCurrentSQL;
  Result:=CurGurnal.Query.Filter;
end;


procedure _FreeAndNil(o:TObject);
begin
  FreeAndNil(o);
end;

procedure RegisterSelSovetLibrary_C(S: TIFPSPascalCompiler);
begin

  s.AddConstantN('_TypeObj_Adres', 'Integer').Value.ts32 := 1;
  s.AddConstantN('_TypeObj_Lich', 'Integer').Value.ts32 := 2;
  s.AddConstantN('_TypeObj_Nasel', 'Integer').Value.ts32 := 3;
  s.AddConstantN('_TypeObj_Passport', 'Integer').Value.ts32 := 4;
  s.AddConstantN('_TypeObj_ZBrak', 'Integer').Value.ts32 := 5;
  s.AddConstantN('_TypeObj_ZRogd', 'Integer').Value.ts32 := 6;
  s.AddConstantN('_TypeObj_ZSmert', 'Integer').Value.ts32 := 7;
  s.AddConstantN('_TypeObj_ZUstOtc', 'Integer').Value.ts32 := 8;
  s.AddConstantN('_TypeObj_TalonPrib', 'Integer').Value.ts32 := 9;
  s.AddConstantN('_TypeObj_TalonUbit', 'Integer').Value.ts32 := 10;
  s.AddConstantN('_TypeObj_ZRast', 'Integer').Value.ts32 := 11;
  s.AddConstantN('_TypeObj_ZAdopt', 'Integer').Value.ts32 := 12;
  s.AddConstantN('_TypeObj_ZChName', 'Integer').Value.ts32 := 13;

  s.AddConstantN('_TypeObj_Owners', 'Integer').Value.ts32 := 15;
  s.AddConstantN('_TypeObj_DBrak', 'Integer').Value.ts32 := 16;
  s.AddConstantN('_TypeObj_BigHouse', 'Integer').Value.ts32 := 17;
  s.AddConstantN('_TypeObj_ZUstMat', 'Integer').Value.ts32 := 18;
  s.AddConstantN('_TypeObj_AktZAH', 'Integer').Value.ts32 := 62;
  s.AddConstantN('_TypeObj_Opeka', 'Integer').Value.ts32 := 63;

  s.AddConstantN('_TypeOper_ChoiceIN', 'Integer').Value.ts32 := 5000;
  s.AddConstantN('_TypeOper_Obrab', 'Integer').Value.ts32 := 5001;
  s.AddConstantN('_TypeOper_SMDO', 'Integer').Value.ts32 := 5002;

  {$IFDEF ADD_MENS_PU}
    s.AddConstantN('TYPESEEK_DELO', 'Integer').Value.ts32 := TYPESEEK_DELO;
    s.AddConstantN('TYPESEEK_LASTRESH', 'Integer').Value.ts32 := TYPESEEK_LASTRESH;
    s.AddConstantN('TYPESEEK_BTI', 'Integer').Value.ts32 := TYPESEEK_BTI;
  {$ELSE}
    s.AddConstantN('TYPESEEK_DELO', 'Integer').Value.ts32 := 3;
    s.AddConstantN('TYPESEEK_LASTRESH', 'Integer').Value.ts32 := 4;
    s.AddConstantN('TYPESEEK_BTI', 'Integer').Value.ts32 := 5;
  {$ENDIF}
  s.AddTypeS('TPassport', 'record Udost:String;UdostKod:Integer;Seria:String;Nomer:String;Organ:String;OrganKod:String;Date:TDateTime;sDate:String;end;');
  s.AddTypeS('TAdres', 'record AdresPropis:String;PunktKod:Integer;PunktTK:Integer;PunktTN:String;PunktN:String;Punkt:String;PunktUlica:String;Ulica:String;'+
            'UlicaInt:Integer;UlicaType:Integer;NotDom:Boolean;Dom:String;Dom2:String;NDom:String;Korp:String;Kv:String;NKv:String;UlicaDom:String;'+
            'AdresID:Integer;LicID:Integer;UchNomer:String;Obl:String;Raion:String;Strana:String;Propis:Boolean;SpecUch:Boolean;NameHouse:String;RnGor:Integer;'+
            'RnGorName:String;PrivateSect:Boolean;IsGorod : Boolean;Gorod : String;Selo:String;Etag:String;Kol_Etag:String;Predst:String;Control:String;UseGilfond:String;end;');
  s.AddTypeS('TATE', 'record Kod:String;ATE_PARENTID:Integer;ATE_ID:Integer;Name:String;Name_B:String;Category:Integer;NameC:String;NaneC_B:String;'+
                     'Front:Integer;FullName:String;Obl:String;Obl_B:String;Raion:String;Raion_B:String;RnGorod:String;SS:String;Error:String;'+
                     'Active:Boolean;idObl:Integer;idRaion:Integer;idRaionG:Integer;idSS:Integer;end;');
    
  s.AddDelphiFunction('function ZH_GetNamePunkt(sDS:String; sPar:String; sType:Integer):String;');

  s.AddDelphiFunction('function ReshIsPostanovka(nTip:Boolean):Boolean;');

//  s.AddDelphiFunction('function PensVozrG:Integer;');
//  s.AddDelphiFunction('function PensVozrM:Integer;');
  s.AddDelphiFunction('function Trud(dDateC:TDateTime; dDateR:TDateTime; sPol:String): Integer;');

  s.AddDelphiFunction('function NameOtdOch(n:Integer; lKrat:Boolean):String;');
  s.AddDelphiFunction('function CheckZnack(sText:String; sZ:String):String;');
  s.AddDelphiFunction('function CheckZnackDel(sText:String; sZ:String):String;');

  // создать файл work_shamp.doc из  nType=1 -> shtamp.doc  или  nType=2 -> shtamp_gerb.doc
  s.AddDelphiFunction('function CreateWorkShtamp(nType:Integer):Boolean;');

  s.AddDelphiFunction('function GetSQLCurGurnal:String;');    //   SQL   текущего журнала
  s.AddDelphiFunction('function GetWhereCurGurnal:String;');  //   WHERE текущего журнала
  s.AddDelphiFunction('function GetFilterCurGurnal:String;');  //   FILTER текущего журнала
  s.AddDelphiFunction('function GetBookmarkCurGurnal(sl:TStringList):Boolean;');  // отмеченные записи текущего журнала
  s.AddDelphiFunction('function BookmarkCurGurnalToFilter(sField:String):Boolean;');
  s.AddDelphiFunction('function BookmarkCurGurnalToValues(sField:String; sDelim:String):String;'); // отмеченные записи текущего журнала в список значений поля sField
  s.AddDelphiFunction('function PropCurGurnal(sName:String; vDef:Variant):Variant;');

  s.AddDelphiFunction('function Def_SprDocSubj:String;');

  s.AddDelphiFunction('function IsPrazdnik(dDate:TDateTime):Boolean;');

  s.AddDelphiFunction('function PrintDeclDok(nTypeObj:Integer):Boolean;');

  s.AddDelphiFunction('function GetFileExcel(sName:String):String;');
  s.AddDelphiFunction('function GetFolderMyDocument:String;');
  s.AddDelphiFunction('function GetFolderExport:String;');

  s.AddDelphiFunction('function GetFileExcelReport(sName:String):String;');
  s.AddDelphiFunction('procedure FreeAndNil(o:TObject);');
  s.AddDelphiFunction('function MainDateFiks : TDateTime;');
  s.AddDelphiFunction('function GetDateFiksReport : TDateTime;');
  s.AddDelphiFunction('function Raion_Name(s : string) : String;');
  s.AddDelphiFunction('function OnlyRaion_Name(s : string) : String;');
  s.AddDelphiFunction('function Obl_Name(s : string) : String;');
  s.AddDelphiFunction('function GetPadeg(s1 : string; s2 : string) : String;');
  s.AddDelphiFunction('function NameOrg(s1 : string; s2 : string) : String;');
  s.AddDelphiFunction('function IsSimpleVvod : Boolean;');
  s.AddDelphiFunction('function IsLoadPadegDLL : Boolean;');
  s.AddDelphiFunction('function GetPadegFIO( strFIO : String; cPol : String; cPadeg : String) : String');
  s.AddDelphiFunction('function GetPadegIF( strFirstName, strLastName : String; cPol : String; cPadeg : String) : String;');
  s.AddDelphiFunction('function GetPadegFIO3( strFamilia,strFirstName, strLastName : String; cPol : String; cPadeg : String) : String;');
  s.AddDelphiFunction('function GetPadegNominative( strFIO : String) : String;');
//  s.AddDelphiFunction('function AdresFromID(DateFiks : TDateTime; strID : String) : String;');
//  s.AddDelphiFunction('function AdresPropisMen(DateFiks : TDateTime; strID : String) : String;');
  s.AddDelphiFunction('function IdProg : String;');
  s.AddDelphiFunction('function IdProg1: String;');
  s.AddDelphiFunction('function Name_Tail: String;');
  s.AddDelphiFunction('function IsSystemAdmin: Boolean;');
  s.AddDelphiFunction('function IsAdmin: Boolean;');
  s.AddDelphiFunction('function OkWarning( s : String) : Boolean;');
  s.AddDelphiFunction('function GetSQLVozrast( strLastField : String; strFirstField : String) : String;');
  s.AddDelphiFunction('function GetWherePunktUlDom(nUch : Integer; strValues,strFieldName,strValues2,strFieldName2: String; ds : TDataSet; lCheckKorp:Boolean) : String;');
  s.AddDelphiFunction('function IsGorSovet : Boolean;');
  s.AddDelphiFunction('function GetOtmetka(s:String; sl:TStringList) : Integer;');
  s.AddDelphiFunction('procedure RunPrintForm(strName : String);');
  s.AddDelphiFunction('function RunForm(strName : String) : Variant;');
  s.AddDelphiFunction('function RunFormEx(strName : String; strParams : String) : Variant;');
  s.AddDelphiFunction('function NameBlankFromType(nType : Integer) : String;');
  s.AddDelphiFunction('function CheckChetNomer(strDom : String) : Integer;');
  s.AddDelphiFunction('function SeekValueSpr(strName: String; strKeyFields:String; strSeek : Variant; strField : String) : Variant;');
  s.AddDelphiFunction('function IsGISUN : Boolean;');
  s.AddDelphiFunction('function InitListStr(strMemo :String) : Integer;');
  s.AddDelphiFunction('function GetStr(nLine:Integer) : String;');
  s.AddDelphiFunction('function GetAllStr(strType:String;strRazd:string) : String;');
  s.AddDelphiFunction('function GetAdresAkt( ds:TDataSet; strPatam:String; nType:Integer; lPrintOblAll:Boolean) : String;');
  s.AddDelphiFunction('function GetMestoZah( ds:TDataSet; strPatam:String; nType:Integer) : String;');
  s.AddDelphiFunction('function GetVoenkomMen(strID:String; nTypeDate:Integer; sDelim:String):String;');
  s.AddDelphiFunction('function ReadDeti(strID:String; strPol:String; Vozr1,Vozr2:Integer; lOnlyLic:Boolean):TDataSet;');
  s.AddDelphiFunction('function ReadDetiLic(strID:String;Vozr1,Vozr2:Integer):TDataSet;');
  s.AddDelphiFunction('function CheckMens(ds:TDataSet; lAddOntosh:Boolean; nTypeDate:Integer):Boolean;');
  s.AddDelphiFunction('function CheckMens2(ds:TDataSet; lClearCheck:Boolean; sIsklID:String; lAddOntosh:Boolean; nTypeDate:Integer):Boolean;');
  s.AddDelphiFunction('function GetOtnosh(nIDKomu:Integer; sOtnoshKomu:String; nIDCur:Integer; sOtnosh:String; sPol:String):String;');

  s.AddDelphiFunction('function IsAccountRnGor:Boolean);');   // ведеетя учет по районам города

  s.AddDelphiFunction('function Podpis_Init(vKod:Variant):Integer;');
  s.AddDelphiFunction('function Podpis_Dolg(n:Integer):String;');
  s.AddDelphiFunction('function Podpis_FIO(n:Integer):String;');
  s.AddDelphiFunction('function Podpis_Perenos:Boolean;');
  s.AddDelphiFunction('function Podpis_Shtamp:Integer;');
  s.AddDelphiFunction('function ExecOneReport(vKod:Variant; lAll:Boolean; IDMen:String; f:TForm):Boolean;');

  s.AddDelphiFunction('function PolFromName(strName:String):String;');
  s.AddDelphiFunction('function PolFrom(strName:String;strOtch:String):String;');
  s.AddDelphiFunction('function RunTemplate(strName:String):Boolean;');
  s.AddDelphiFunction('function RunTemplate2(strName:String; strPath:String; lShow:Boolean):Boolean;');
  s.AddDelphiFunction('function GetNomerSvid(sNomer:String):Integer;');
  s.AddDelphiFunction('function GetBookmarkMen:String;');
  s.AddDelphiFunction('function GetBookmarkMen2(sDelim:String):String;');

  s.AddDelphiFunction('procedure SetWorkDataSet(ds:TDataSet; sName:String);');
  s.AddDelphiFunction('function GetWorkDataSet(sName:String):TDataSet;');

  s.AddDelphiFunction('function IsMyID(nMyID:Integer; nCurID:Integer):Boolean;');
  s.AddDelphiFunction('function MyID:Integer;');
  s.AddDelphiFunction('function SoatoFromID(nID:Integer):String;');

  s.AddDelphiFunction('procedure SetGlobalFilterPunkt(sValue:String);');
  s.AddDelphiFunction('function GetGlobalFilterPunkt:String;');

  s.AddDelphiFunction('function CurForm:TForm;');
  s.AddDelphiFunction('function getResource(sKod:String; nType:Integer):String;');
  s.AddDelphiFunction('function getPril(nType:Integer; sKod:String; nNomer:Integer):String;');
  s.AddDelphiFunction('function getPril2(nType:Integer; sKod:String; nNomer:Integer; nSup:Integer):String;');
  s.AddDelphiFunction('function getFieldFromSL(sValue:String; sField:String; sType:String):Variant;');

  s.AddDelphiFunction('function sokrKv:String;');
  s.AddDelphiFunction('function sokrDom:String;');
  s.AddDelphiFunction('function sokrKorp:String;');

  s.AddDelphiFunction('function FullNameSOATO(sSoato:String; nType:Integer; sRazd:String):String;');
  s.AddDelphiFunction('function FullNameATE(ateID:Integer; nType:Integer; sRazd:String):String;);');

//  s.AddDelphiFunction('function Q_StrTok1(var S: string; Delimiters: string): string;');

  //  s.AddDelphiFunction('function GetCurrentMen : TDataSet;');
//  s.AddDelphiFunction('function GetCurrentLichSchet : TDataSet;');
//  s.AddDelphiFunction('function TypeObj_LichSchet : String;');
end;


procedure RegisterSelSovetLibrary_R(S: TIFPSExec);
begin
  s.RegisterDelphiFunction(@ReshIsPostanovka, 'RESHISPOSTANOVKA', cdRegister);
//  s.RegisterDelphiFunction(@PensVozrG, 'PENSVOZRG', cdRegister);
//  s.RegisterDelphiFunction(@PensVozrM, 'PENSVOZRM', cdRegister);
  s.RegisterDelphiFunction(@Trud, 'TRUD', cdRegister);

  s.RegisterDelphiFunction(@ZH_GetNamePunkt, 'ZH_GETNAMEPUNKT', cdRegister);
  s.RegisterDelphiFunction(@NameOtdOch, 'NAMEOTDOCH', cdRegister);
  s.RegisterDelphiFunction(@CheckZnack, 'CHECKZNACK', cdRegister);
  s.RegisterDelphiFunction(@CheckZnackDel, 'CHECKZNACKDEL', cdRegister);
  s.RegisterDelphiFunction(@CreateWorkShtamp, 'CREATEWORKSHTAMP', cdRegister);

  s.RegisterDelphiFunction(@GetSQLCurGurnal, 'GETSQLCURGURNAL', cdRegister);
  s.RegisterDelphiFunction(@GetWhereCurGurnal, 'GETWHERECURGURNAL', cdRegister);
  s.RegisterDelphiFunction(@GetFilterCurGurnal, 'GETFILTERCURGURNAL', cdRegister);
  s.RegisterDelphiFunction(@GetBookmarkCurGurnal,'GETBOOKMARKCURGURNAL', cdRegister);
  s.RegisterDelphiFunction(@BookmarkCurGurnalToFilter,'BOOKMARKCURGURNALTOFILTER', cdRegister);
  s.RegisterDelphiFunction(@BookmarkCurGurnalToValues,'BOOKMARKCURGURNALTOVALUES', cdRegister);
  s.RegisterDelphiFunction(@PropCurGurnal, 'PROPCURGURNAL', cdRegister);

  s.RegisterDelphiFunction(@Def_SprDocSubj, 'DEF_SPRDOCSUBJ', cdRegister);
  s.RegisterDelphiFunction(@IsPrazdnik, 'ISPRAZDNIK', cdRegister);
  s.RegisterDelphiFunction(@PrintDeclDok, 'PRINTDECLDOK', cdRegister);

  s.RegisterDelphiFunction(@GetFileExcel, 'GETFILEEXCEL', cdRegister);
  s.RegisterDelphiFunction(@GetFolderMyDocument, 'GETFOLDERMYDOCUMENT', cdRegister);
  s.RegisterDelphiFunction(@GetFolderExport, 'GETFOLDEREXPORT', cdRegister);

  s.RegisterDelphiFunction(@GetFileExcelReport, 'GETFILEEXCELREPORT', cdRegister);
  s.RegisterDelphiFunction(@_FreeAndNil, 'FREEANDNIL', cdRegister);
  s.RegisterDelphiFunction(@MainDateFiks, 'MAINDATEFIKS', cdRegister);
  s.RegisterDelphiFunction(@GetDateFiksReport, 'GETDATEFIKSREPORT', cdRegister);
  s.RegisterDelphiFunction(@Raion_Name, 'RAION_NAME', cdRegister);
  s.RegisterDelphiFunction(@OnlyRaion_Name, 'ONLYRAION_NAME', cdRegister);
  s.RegisterDelphiFunction(@Obl_Name, 'OBL_NAME', cdRegister);
  s.RegisterDelphiFunction(@GetPadeg, 'GETPADEG', cdRegister);
  s.RegisterDelphiFunction(@NameOrg, 'NAMEORG', cdRegister);
  s.RegisterDelphiFunction(@IsSimpleVvod, 'ISSIMPLEVVOD', cdRegister);

  s.RegisterDelphiFunction(@IsLoadPadegDLL, 'ISLOADPADEGDLL', cdRegister);
  s.RegisterDelphiFunction(@GetPadegFIO, 'GETPADEGFIO', cdRegister);
  s.RegisterDelphiFunction(@GetPadegIF, 'GETPADEGIF', cdRegister);
  s.RegisterDelphiFunction(@GetPadegFIO3, 'GETPADEGFIO3', cdRegister);
  s.RegisterDelphiFunction(@GetPadegNominative, 'GETPADEGNOMINATIVE', cdRegister);
//  s.RegisterDelphiFunction(@AdresFromID, 'ADRESFROMID', cdRegister);
//  s.RegisterDelphiFunction(@AdresPropisMen, 'ADRESPROPISMEN', cdRegister);
  s.RegisterDelphiFunction(@IdProg, 'IDPROG', cdRegister);
  s.RegisterDelphiFunction(@IdProg1, 'IDPROG1', cdRegister);
  s.RegisterDelphiFunction(@Name_Tail, 'NAME_TAIL', cdRegister);
  s.RegisterDelphiFunction(@IsSystemAdmin, 'ISSYSTEMADMIN', cdRegister);
  s.RegisterDelphiFunction(@IsAdmin, 'ISADMIN', cdRegister);
  s.RegisterDelphiFunction(@OkWarningScript, 'OKWARNING', cdRegister);
  s.RegisterDelphiFunction(@GetSQLVozrast, 'GETSQLVOZRAST', cdRegister);
  s.RegisterDelphiFunction(@GetWherePunktUlDom, 'GETWHEREPUNKTULDOM', cdRegister);
  s.RegisterDelphiFunction(@IsGorSovetS, 'ISGORSOVET', cdRegister);
  s.RegisterDelphiFunction(@GetOtmetka, 'GETOTMETKA', cdRegister);
  s.RegisterDelphiFunction(@RunPrintForm, 'RUNPRINTFORM', cdRegister);
  s.RegisterDelphiFunction(@RunForm, 'RUNFORM', cdRegister);
  s.RegisterDelphiFunction(@RunFormEx, 'RUNFORMEX', cdRegister);
  s.RegisterDelphiFunction(@NameBlankFromType, 'NAMEBLANKFROMTYPE', cdRegister);
  s.RegisterDelphiFunction(@CheckChetNomer, 'CHECKCHETNOMER', cdRegister);
  s.RegisterDelphiFunction(@SeekValueSpr, 'SEEKVALUESPR', cdRegister);
  s.RegisterDelphiFunction(@IsGISUN, 'ISGISUN', cdRegister);
  s.RegisterDelphiFunction(@INITLISTSTR, 'INITLISTSTR', cdRegister);
  s.RegisterDelphiFunction(@GETSTR, 'GETSTR', cdRegister);
  s.RegisterDelphiFunction(@GETALLSTR, 'GETALLSTR', cdRegister);
  s.RegisterDelphiFunction(@GETADRESAKT, 'GETADRESAKT', cdRegister);
  s.RegisterDelphiFunction(@GETMESTOZAH, 'GETMESTOZAH', cdRegister);

  s.RegisterDelphiFunction(@GetVoenkomMen, 'GETVOENKOMMEN', cdRegister);
  s.RegisterDelphiFunction(@ReadDeti, 'READDETI', cdRegister);
  s.RegisterDelphiFunction(@ReadDetiLic, 'READDETILIC', cdRegister);
  s.RegisterDelphiFunction(@CheckMens, 'CHECKMENS', cdRegister);
  s.RegisterDelphiFunction(@CheckMens2, 'CHECKMENS2', cdRegister);
  s.RegisterDelphiFunction(@GetOtnosh, 'GETOTNOSH', cdRegister);

  s.RegisterDelphiFunction(@IsAccountRnGor, 'ISACCOUNTRNGOR', cdRegister);

  s.RegisterDelphiFunction(@Podpis_Init, 'PODPIS_INIT', cdRegister);
  s.RegisterDelphiFunction(@Podpis_Dolg, 'PODPIS_DOLG', cdRegister);
  s.RegisterDelphiFunction(@Podpis_FIO, 'PODPIS_FIO', cdRegister);
  s.RegisterDelphiFunction(@Podpis_Perenos, 'PODPIS_PERENOS', cdRegister);
  s.RegisterDelphiFunction(@Podpis_Shtamp, 'PODPIS_SHTAMP', cdRegister);
  s.RegisterDelphiFunction(@ExecOneReport, 'EXECONEREPORT', cdRegister);

  s.RegisterDelphiFunction(@PolFromName, 'POLFROMNAME', cdRegister);
  s.RegisterDelphiFunction(@PolFrom, 'POLFROM', cdRegister);
  s.RegisterDelphiFunction(@RunTemplate, 'RUNTEMPLATE', cdRegister);
  s.RegisterDelphiFunction(@RunTemplate2, 'RUNTEMPLATE2', cdRegister);
  s.RegisterDelphiFunction(@GetNomerSvid, 'GETNOMERSVID', cdRegister);
  s.RegisterDelphiFunction(@GetBookmarkMen, 'GETBOOKMARKMEN', cdRegister);
  s.RegisterDelphiFunction(@GetBookmarkMen2, 'GETBOOKMARKMEN2', cdRegister);
 
  s.RegisterDelphiFunction(@SetWorkDataSet, 'SETWORKDATASET', cdRegister);
  s.RegisterDelphiFunction(@GetWorkDataSet, 'GETWORKDATASET', cdRegister);

  s.RegisterDelphiFunction(@IsMyID, 'ISMYID', cdRegister);
  s.RegisterDelphiFunction(@MyID, 'MYID', cdRegister);
  s.RegisterDelphiFunction(@SoatoFromID, 'SOATOFROMID', cdRegister);
  s.RegisterDelphiFunction(@SetGlobalFilterPunkt, 'SETGLOBALFILTERPUNKT', cdRegister);
  s.RegisterDelphiFunction(@GetGlobalFilterPunkt, 'GETGLOBALFILTERPUNKT', cdRegister);

  s.RegisterDelphiFunction(@CurForm, 'CURFORM', cdRegister);
  s.RegisterDelphiFunction(@getResource, 'GETRESOURCE', cdRegister);
  s.RegisterDelphiFunction(@getPril, 'GETPRIL', cdRegister);
  s.RegisterDelphiFunction(@getPril2, 'GETPRIL2', cdRegister);
  s.RegisterDelphiFunction(@getFieldFromSL, 'GETFIELDFROMSL', cdRegister);

  s.RegisterDelphiFunction(@sokrKv, 'SOKRKV', cdRegister);
  s.RegisterDelphiFunction(@sokrDom, 'SOKRDOM', cdRegister);
  s.RegisterDelphiFunction(@sokrKorp, 'SOKRKORP', cdRegister);

  s.RegisterDelphiFunction(@FullNameSOATO, 'FULLNAMESOATO', cdRegister);
  s.RegisterDelphiFunction(@FullNameATE, 'FULLNAMEATE', cdRegister);

  //  s.RegisterDelphiFunction(@GetCurrentMen, 'GETCURRENTMEN', cdRegister);
//  s.RegisterDelphiFunction(@GetCurrentLichSchet, 'GETCURRENTLICHSCHET', cdRegister);
end;


procedure SIRegisterfmMain(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TFORM'), 'TFMMAIN') do
  begin
    RegisterMethod('procedure acSprPunktExecute(Sender: TObject)');
    RegisterMethod('function GetCurrentDokument : TDataSet;');
    RegisterMethod('function SprNameOrg(nID:Integer; sType:String; sPadeg:String):String');
    RegisterMethod('function SprNameOrgR(nID:Integer; sType:String; sPadeg:String ):String');
    RegisterMethod('function NameOrg(sPar1:String; sPar2:String):String');
    RegisterMethod('function GetPadeg(sPar1:String; sPar2:String):String');

  //    RegisterMethod('procedure ADDPARAMEX( Value : Variant; strCaption : String; strKod : String; strParam : String);');
//    RegisterMethod('function GETVALUEN( n : Integer) : Variant);');
//    RegisterProperty('STEPY', 'INTEGER', iptrw);
  end;
end;

procedure RIRegisterfmMain(Cl: TIFPSRuntimeClassImporter);
begin
  with Cl.Add(TfmMain) do
  begin
    RegisterMethod(@TfmMain.acSprPunktExecute,'ACSPRPUNKTEXECUTE');
    RegisterMethod(@TfmMain.GetCurrentDokument,'GETCURRENTDOKUMENT');
    RegisterMethod(@TfmMain.SprNameOrg2,'SPRNAMEORG');
    RegisterMethod(@TfmMain.SprNameOrg,'SPRNAMEORGR');
    RegisterMethod(@TfmMain.NameOrg,'NAMEORG');
    RegisterMethod(@TfmMain.GetPadeg,'GETPADEG');
//    RegisterMethod(@TfmParamQuest.AddParamEx, 'ADDPARAMEX');
//    RegisterPropertyHelper(@FMPARAMQUEST_STEPY_R, @FMPARAMQUEST_STEPY_W, 'STEPY');
  end;
end;

procedure SIRegisterdmBase(Cl: TIFPSPascalCompiler);
begin
  cl.AddTypeS('TSoato', 'record Kod:String; Name:String; FullName:String; ATEID:Integer; end;');

  with Cl.AddClassN( cl.FindClass('TOBJECT') , 'TRESHOCHMEN') do
  begin
    RegisterMethod('constructor Create;');
    RegisterMethod('procedure Clear;');
    RegisterMethod('function MenID:Integer;');
    RegisterMethod('function AutoID:Integer;');
    RegisterMethod('function Ochered_ID:Integer;');
    RegisterMethod('function NameList(nType:Integer; sPadeg:String):String;');
    RegisterMethod('function NameOch(nType:Integer; sPadeg:String):String;');
    RegisterMethod('function Otkaz:Boolean;');
    RegisterMethod('function Tip:Integer;');
    RegisterMethod('function Prov:Boolean;');
    RegisterMethod('function Plan:Boolean;');
    RegisterMethod('function Razdel:Boolean;');
    RegisterMethod('function DateR:TDateTime;');
    RegisterMethod('function DateSila:TDateTime;');
    RegisterMethod('function DateSilaResh:TDateTime;');
    RegisterMethod('procedure SetDateR(d:TDateTime);');
    RegisterMethod('procedure SetDateSila(d:TDateTime);');
    RegisterMethod('procedure SetNomer(s:String);');
    RegisterMethod('function Nomer:String;');
    RegisterMethod('function Osnov:Integer;');
    RegisterMethod('function OsnovText:String;');
    RegisterMethod('function Osnov2:Integer;');
    RegisterMethod('function OsnovText2:String;');
    RegisterMethod('function GetTextOsnov(nTypeResult:Integer;lAddInfo:Boolean):String;');
    RegisterMethod('function ID1:Integer;');
    RegisterMethod('function ID2:Integer;');
    RegisterMethod('function TextResh:String;');
    RegisterMethod('function TextVipis:String;');
    RegisterMethod('function Text(lVipis:Boolean):String;');
    RegisterMethod('function CheckFieldsInText(sText:String;nTypeDatePropis:Integer):String;');
    RegisterMethod('function AddInfo:String;');
  end;

  with Cl.AddClassN(cl.FindClass('TOBJECT'), 'TDMBASE') do
  begin
    RegisterMethod('function AnyExport(strCaption:String; strNameExp:String; lArx:Boolean; lChoicePath:Boolean; strDir:String; sRunShell:String):Boolean;');
    RegisterMethod('function ReadPropAsFloat(DateFiks : TDateTime; nKodObj : Integer; strKodProp : String) : Extended;');
    RegisterMethod('function ReadPropAsText(DateFiks : TDateTime; nKodObj : Integer; strKodProp : String) : String;');
    RegisterMethod('function ReadPropAsString(DateFiks : TDateTime; nKodObj : Integer; strKodProp : String) : String;');
    RegisterMethod('function ReadPropAsInteger(DateFiks : TDateTime; nKodObj : Integer; strKodProp : String) : Integer;');
    RegisterMethod('function ReadPropAsDate(DateFiks : TDateTime; nKodObj : Integer; strKodProp : String) : TDateTime;');
    RegisterMethod('function ReadPropAsBoolean(DateFiks : TDateTime; nKodObj : Integer; strKodProp : String; lDef : Boolean) : Boolean;');

    RegisterMethod('function ReadOneProp(DateFiks : TDateTime; nKodObj : Integer; strKodProp : String; ft : TFieldType ) : Variant;');

    RegisterMethod('function WriteValueProp(strKodProp:String; Value:Variant; DateFiks:TDateTime; nKodObj:Integer; nTypeObj:Integer; nDataType:TFieldType) : Boolean;');
    RegisterMethod('function WriteFieldProp(DateFiks : TDateTime; strKodProp : String; fld : TField; nKodObj: Integer; nTypeObj : Integer; nDataType : TFieldType): Boolean;');
    RegisterMethod('function WriteProp(DateFiks : TDateTime; nKodObj : Integer; dsSource : TDataSet; strKodProp : String; nTypeObj : Integer) : Boolean;');

    RegisterMethod('function GetLichSchet( DateFiks : TDateTime; strID : String) : TDataSet;');
    RegisterMethod('function GetLichSchetFromAdres( DateFiks : TDateTime; strIDAdres : String): TDataSet;');
    RegisterMethod('function GetIDLichSchetFromAdres( DateFiks : TDateTime; strIDAdres : String): String;');
    RegisterMethod('function GetMen( DateFiks : TDateTime; strID : String): TDataSet;');

    RegisterMethod('function GetNomerDom(strDom : String; nType:Integer) : String;');
    RegisterMethod('function GetNomerDomEx(strDom : String; nType:Integer) : String;');

    RegisterMethod('function GetMenWork( DateFiks : TDateTime; strID : String): String;');
    RegisterMethod('function GetMenDolg( DateFiks : TDateTime; strID : String): String;');
    RegisterMethod('function GetMenStud( DateFiks : TDateTime; strID : String): String;');
    RegisterMethod('function GetMenDvig( DateFiks : TDateTime; strID : String; strRazd:String): String;');
    RegisterMethod('function GetMenPasp( DateFiks : TDateTime; strID : String; nType:Integer): String;');
    RegisterMethod('function GetMenPaspV(UdostKod:Integer; Seria,Nomer,Organ,LichNomer : String;  DateV : TDateTime; nType:Integer): String;');

    RegisterMethod('function GetDataSet( strName : String) : TDataSet;');
    RegisterMethod('function AdresFromID(DateFiks:TDateTime; strID:String; lNameIsNotDom:Boolean) : String;');
    RegisterMethod('function AdresFromIDEx(DateFiks : TDateTime; strID : String; lNameIsNotDom:Boolean; lOnlyText:Boolean) : String;');

    RegisterMethod('function AdresMen(strID:String; sType:String) : String;');
//    RegisterMethod('function AdresPropisMen(DateFiks : TDateTime; strID : String) : String;');
    RegisterMethod('function GetTailAdres(strType:String) : String;');
    RegisterMethod('function SostavSemToStr(strID : String; strType:String; strRazd:String) : String;');
    RegisterMethod('function GetReshOch(nIDResh:Integer) : TReshOchMen;');
    RegisterMethod('function FillReshOch(resh:TReshOchMen;nIDResh:Integer) : Boolean;');
    RegisterMethod('function HouseOwners(DateFiks: TDateTime; strIdAdres: String; obj:TObject; nType:Integer):String;');

    RegisterMethod('function GetATE(slATE:TStringList; sObl:String; sRaion:String; sSS:String; sPunkt:String; sTypePunkt:String) : Integer;');
    RegisterMethod('function GetATESys(slATE:TStringList; sObl:String; sRaion:String; sSS:String; sPunkt:String; sTypePunkt:String) : Integer;');
    RegisterMethod('function GetSOATOAkt(ds:TDataSet;strParam:String;lCheckSel:Boolean;nType:Integer):TSoato;');
    RegisterMethod('function GetKodSOATOAkt(ds:TDataSet;strParam:String;lCheckSel:Boolean;nType:Integer):String;');
    RegisterMethod('function GetNameTerr(strSOATO:String; lObl:Boolean; lRnGor:Boolean; lCheckPunkt:Boolean):String;');
    RegisterMethod('function VoenkomFromSOATO(strSOATO:String):Integer;');
    RegisterMethod('function DataSetFromTypeObj(nTypeObj: Integer): TDataSet;');
    RegisterMethod('function SetIDLastReshOcheredMen(nID:Integer):Boolean;');
    RegisterMethod('function TypeObj_Adres: Integer;');
    RegisterMethod('function TypeObj_Lich: Integer;');
    RegisterMethod('function TypeObj_Nasel: Integer;');
    RegisterMethod('function TypeObj_Passport: Integer;');
    RegisterMethod('function TypeObj_ZBrak: Integer;');
    RegisterMethod('function TypeObj_DBrak: Integer;');
    RegisterMethod('function TypeObj_ZRogd: Integer;');
    RegisterMethod('function TypeObj_ZSmert: Integer;');
    RegisterMethod('function TypeObj_ZUstOtc: Integer;');
    RegisterMethod('function TypeObj_ZUstMat: Integer;');
    RegisterMethod('function TypeObj_TalonPrib: Integer;');
    RegisterMethod('function TypeObj_TalonUbit: Integer;');
    RegisterMethod('function TypeObj_Ochered: Integer;');
    RegisterMethod('function TypeObj_Organ: Integer;');
    RegisterMethod('function TypeObj_Owners: Integer;');
    RegisterMethod('function TypeObj_PasportTerr: Integer;');

    RegisterMethod('function GetBelNazv(nType : Integer; lSelect : Boolean; strNameR : String) : String;');
    RegisterMethod('function GetNewID( TypeObj : Integer ) : Integer;');
    RegisterMethod('function GetSysIdBase : String;');
    RegisterMethod('function DeleteDokument( ds : TDataSet; nTypeObj : Integer; lIgnoreCheck:Boolean) : Boolean;');
    RegisterMethod('procedure AppendToDelObjEx(nTypeObj:Integer; strID:String; DateFiks:TDateTime; DateFiks2: TDateTime; sKomm:String);');

    RegisterMethod('function FindAdres(DateFiks: TDateTime; nPunkt, nUL: Integer; strDom, strKorp, strKv: String; nID : Integer): Boolean;');
    RegisterMethod('function GetFindAdresID:Integer;');
    RegisterMethod('function AddAdres(DateFiks: TDateTime; nPunkt, nUL: Integer; strDom, strKorp, strKv: String; var NewID : Integer; var strErr : String): Boolean;');
    RegisterMethod('function GetDateCurrentSost: TDateTime;');
    RegisterMethod('function CountMensEx( DateFiks:TDateTime; strLicID:String; strType:String; slPar:TStringList): Integer;)');
    RegisterMethod('function CountMensAdres( DateFiks : TDateTime; strAdresID : String; strType : String; slPar:TStringList): Integer;');
    RegisterMethod('function ListMensLic(strLicID:String; nIDFirst:Integer; strType:String; strParAdd:String; strDelim:String; dsList:TDataSet):String;');
    RegisterMethod('function LgotMen(strID:String; strDelim:String): String;');

    RegisterMethod('function NameTableFromTypeObj(nTypeObj:Integer):String;');
    RegisterMethod('function LoadSQLEx(strNameSQL: String): String;');
    RegisterMethod('function GetSQLFromStr(strSQL:String; strSect:String): String;');
    RegisterMethod('function CheckDateFiksSQL(strSQL: String; DateFiks : TDateTime): String;');
    RegisterMethod('function CheckParamsSQL(strSQL: String): String;');
    RegisterMethod('function LastSvidPovtor(nTypeDok:Integer; strID:Integer; strFormat:String) : String;');
    RegisterMethod('function CreateBigHouse : Boolean;');

    RegisterMethod('function GetCurDate : TDateTime;');
    RegisterMethod('procedure SetCurDate( d : TDateTime);');

  //    RegisterMethod('procedure ADDPARAMEX( Value : Variant; strCaption : String; strKod : String; strParam : String);');
//    RegisterMethod('function GETVALUEN( n : Integer) : Variant);');
//    RegisterProperty('STEPY', 'INTEGER', iptrw);
  end;
end;

procedure RIRegisterdmBase(Cl: TIFPSRuntimeClassImporter);
begin

  with Cl.Add(TReshOchMen) do
  begin
    RegisterConstructor(@TReshOchMen.Create,'CREATE');
    RegisterMethod(@TReshOchMen.Clear, 'CLEAR');
    RegisterMethod(@TReshOchMen.MenID, 'MENID');
    RegisterMethod(@TReshOchMen.AutoID, 'AUTOID');
    RegisterMethod(@TReshOchMen.Ochered_ID, 'OCHERED_ID');
    RegisterMethod(@TReshOchMen.NameList, 'NAMELIST');
    RegisterMethod(@TReshOchMen.NameOch, 'NAMEOCH');
    RegisterMethod(@TReshOchMen.Otkaz, 'OTKAZ');
    RegisterMethod(@TReshOchMen.Tip, 'TIP');
    RegisterMethod(@TReshOchMen.Prov, 'PROV');
    RegisterMethod(@TReshOchMen.Plan, 'PLAN');
    RegisterMethod(@TReshOchMen.Razdel, 'RAZDEL');
    RegisterMethod(@TReshOchMen.DateR, 'DATER');
    RegisterMethod(@TReshOchMen.DateSila, 'DATESILA');
    RegisterMethod(@TReshOchMen.DateSilaResh, 'DATESILARESH');
    RegisterMethod(@TReshOchMen.SetDateR, 'SETDATER');
    RegisterMethod(@TReshOchMen.SetDateSila, 'SETDATESILA');
    RegisterMethod(@TReshOchMen.SetNOMER, 'SETNOMER');
    RegisterMethod(@TReshOchMen.NOMER, 'NOMER');
    RegisterMethod(@TReshOchMen.Osnov, 'OSNOV');
    RegisterMethod(@TReshOchMen.OsnovText, 'OSNOVTEXT');
    RegisterMethod(@TReshOchMen.Osnov2, 'OSNOV2');
    RegisterMethod(@TReshOchMen.OsnovText2, 'OSNOVTEXT2');
    RegisterMethod(@TReshOchMen.GetTextOsnov, 'GETTEXTOSNOV');
    RegisterMethod(@TReshOchMen.ID1, 'ID1');
    RegisterMethod(@TReshOchMen.ID2, 'ID2');
    RegisterMethod(@TReshOchMen.TextResh, 'TEXTRESH');
    RegisterMethod(@TReshOchMen.TextVipis, 'TEXTVIPIS');
    RegisterMethod(@TReshOchMen.CheckFieldsInText, 'CHECKFIELDSINTEXT');
    RegisterMethod(@TReshOchMen.Text, 'TEXT');
    RegisterMethod(@TReshOchMen.AddInfo, 'ADDINFO');
  end;

  with Cl.Add(TdmBase) do
  begin
    RegisterMethod(@TdmBase.AnyExport,'ANYEXPORT');
    RegisterMethod(@TdmBase.ReadPropAsFloat,'READPROPASFLOAT');
    RegisterMethod(@TdmBase.ReadPropAsText,'READPROPASTEXT');
    RegisterMethod(@TdmBase.ReadPropAsString,'READPROPASSTRING');
    RegisterMethod(@TdmBase.ReadPropAsInteger,'READPROPASINTEGER');
    RegisterMethod(@TdmBase.ReadPropAsBoolean,'READPROPASBOOLEAN');
    RegisterMethod(@TdmBase.ReadPropAsDate,'READPROPASDATE');

    RegisterMethod(@TdmBase.ReadOneProp,'READONEPROP');
    RegisterMethod(@TdmBase.WriteValueProp,'WRITEVALUEPROP');
    RegisterMethod(@TdmBase.WriteFieldProp,'WRITEFIELDPROP');
    RegisterMethod(@TdmBase.WriteProp,'WRITEPROP');
    RegisterMethod(@TdmBase.GetLichSchet,'GETLICHSCHET');
    RegisterMethod(@TdmBase.GetLichSchetFromAdres,'GETLICHSCHETFROMADRES');
    RegisterMethod(@TdmBase.GetIDLichSchetFromAdres,'GETIDLICHSCHETFROMADRES');
    RegisterMethod(@TdmBase.GetMen,'GETMEN');
    RegisterMethod(@TdmBase.GetMenWork ,'GETMENWORK');
    RegisterMethod(@TdmBase.GetMenDOLG ,'GETMENDOLG');
    RegisterMethod(@TdmBase.GetMenSTUD ,'GETMENSTUD');
    RegisterMethod(@TdmBase.GetMenDvig ,'GETMENDVIG');
    RegisterMethod(@TdmBase.GetMenPasp ,'GETMENPASP');
    RegisterMethod(@TdmBase.GetMenPaspV ,'GETMENPASPV');

    RegisterMethod(@TdmBase.GetNomerDom, 'GETNOMERDOM');
    RegisterMethod(@TdmBase.GetNomerDomEx, 'GETNOMERDOMEX');

    RegisterMethod(@TdmBase.GetDataSet,'GETDATASET');
    RegisterMethod(@TdmBase.AdresFromID,'ADRESFROMID');
    RegisterMethod(@TdmBase.AdresFromIDEx,'ADRESFROMIDEX');
    RegisterMethod(@TdmBase.SimpleAdresMen,'ADRESMEN');

//    RegisterMethod(@TdmBase.AdresPropisMen,'ADRESPROPISMEN');
    RegisterMethod(@TdmBase.GetTailAdres,'GETTAILADRES');
    RegisterMethod(@TdmBase.SostavSemToStr,'SOSTAVSEMTOSTR');
    RegisterMethod(@TdmBase.GetReshOch,'GETRESHOCH');
    RegisterMethod(@TdmBase.FillReshOch,'FILLRESHOCH');
    RegisterMethod(@TdmBase.HouseOwners_Old,'HOUSEOWNERS');

    RegisterMethod(@TdmBase.GetAte,'GETATE');
    RegisterMethod(@TdmBase.GetAteSys,'GETATESYS');
    RegisterMethod(@TdmBase.GetSOATOAkt,'GETSOATOAKT');
    RegisterMethod(@TdmBase.GetKodSOATOAkt,'GETKODSOATOAKT');
    RegisterMethod(@TdmBase.GetNameTerr,'GETNAMETERR');
    RegisterMethod(@TdmBase.VoenkomFromSoato,'VOENKOMFROMSOATO');
    RegisterMethod(@TdmBase.DataSetFromTypeObj,'DATASETFROMTYPEOBJ');
    RegisterMethod(@TdmBase.SetIDLastReshOcheredMen,'SETIDLASTRESHOCHEREDMEN');

    RegisterMethod(@TdmBase.TypeObj_Adres,'TYPEOBJ_ADRES');
    RegisterMethod(@TdmBase.TypeObj_Lich,'TYPEOBJ_LICH');
    RegisterMethod(@TdmBase.TypeObj_Nasel,'TYPEOBJ_NASEL');
    RegisterMethod(@TdmBase.TypeObj_Passport,'TYPEOBJ_PASSPORT');
    RegisterMethod(@TdmBase.TypeObj_ZBrak,'TYPEOBJ_ZBRAK');
    RegisterMethod(@TdmBase.TypeObj_DBrak,'TYPEOBJ_DBRAK');
    RegisterMethod(@TdmBase.TypeObj_ZRogd,'TYPEOBJ_ZROGD');
    RegisterMethod(@TdmBase.TypeObj_ZSmert,'TYPEOBJ_ZSMERT');
    RegisterMethod(@TdmBase.TypeObj_ZUstOtc,'TYPEOBJ_ZUSTOTC');
    RegisterMethod(@TdmBase.TypeObj_ZUstMat,'TYPEOBJ_ZUSTMAT');
    RegisterMethod(@TdmBase.TypeObj_TalonPrib,'TYPEOBJ_TALONPRIB');
    RegisterMethod(@TdmBase.TypeObj_TalonUbit,'TYPEOBJ_TALONUBIT');
    RegisterMethod(@TdmBase.TypeObj_Ochered,'TYPEOBJ_OCHERED');
    RegisterMethod(@TdmBase.TypeObj_Organ,'TYPEOBJ_ORGAN');
    RegisterMethod(@TdmBase.TypeObj_Owners,'TYPEOBJ_OWNERS');
    RegisterMethod(@TdmBase.TypeObj_PasportTerr,'TYPEOBJ_PASPORTTERR');

    RegisterMethod(@TdmBase.GetBelNazv,'GETBELNAZV');
    RegisterMethod(@TdmBase.GetNewID,'GETNEWID');
    RegisterMethod(@TdmBase.GetSysIdBase,'GETSYSIDBASE');
    RegisterMethod(@TdmBase.FindAdres,'FINDADRES');
    RegisterMethod(@TdmBase.GetFindAdresID,'GETFINDADRESID');
    RegisterMethod(@TdmBase.DeleteDokument,'DELETEDOKUMENT');
    RegisterMethod(@TdmBase.AppendToDelObjEx,'APPENDTODELOBJEX');
    RegisterMethod(@TdmBase.AddAdresOld,'ADDADRES');
    RegisterMethod(@TdmBase.GetDateCurrentSost,'GETDATECURRENTSOST');
    RegisterMethod(@TdmBase.CountMensEx,'COUNTMENSEX');
    {$IFNDEF OPEKA}
    RegisterMethod(@TdmBase.ListMensLic,'LISTMENSLIC');
    RegisterMethod(@TdmBase.LgotMen2,'LGOTMEN');
    {$ENDIF}
    RegisterMethod(@TdmBase.CountMensAdres,'COUNTMENSADRES');
    RegisterMethod(@TdmBase.LoadSQLEx,'LOADSQLEX');
    RegisterMethod(@TdmBase.GetSQLFromStr,'GETSQLFROMSTR');
    RegisterMethod(@TdmBase.NameTableFromTypeObj,'NAMETABLEFROMTYPEOBJ');
    RegisterMethod(@TdmBase.CheckDateFiksSQL,'CHECKDATEFIKSSQL');
    RegisterMethod(@TdmBase.CheckParamsSQL,'CHECKPARAMSSQL');
    RegisterMethod(@TdmBase.LastSvidPovtor,'LASTSVIDPOVTOR');
    RegisterMethod(@TdmBase.CreateBigHouse,'CREATEBIGHOUSE');
    RegisterMethod(@TdmBase.GetCurDate,'GETCURDATE');
    RegisterMethod(@TdmBase.SetCurDate,'SETCURDATE');

  //    RegisterMethod(@TdmBase.acSprPunktExecute,'ACSPRPUNKTEXECUTE');
//    RegisterMethod(@TfmParamQuest.AddParamEx, 'ADDPARAMEX');
//    RegisterPropertyHelper(@FMPARAMQUEST_STEPY_R, @FMPARAMQUEST_STEPY_W, 'STEPY');
  end;
end;

procedure SIRegisterLicSchet(Cl: TIFPSPascalCompiler);
var
  cr: TPSCompileTimeClass;
begin

  cr:=Cl.AddClassN(cl.FindClass('TOBJECT'), 'TADRESLIC');
//  with Cl.AddClassN(cl.FindClass('TMENS'), 'TMENS') do
  with Cl.AddClassN( cl.FindClass('TOBJECT') , 'TMENS') do
  begin
    RegisterMethod('function DataSet:TDataSet;');
    RegisterMethod('procedure First;');
    RegisterMethod('procedure Last;');
    RegisterMethod('procedure Next;');
    RegisterMethod('procedure Prior;');
    RegisterMethod('function Eof : Boolean;');
    RegisterMethod('function Count : Integer');
    RegisterMethod('function Fld(strName:String) : TField;');
    RegisterMethod('function Value(strName:String) : Variant;');
    RegisterMethod('function Lgoti : TDataSet');
    RegisterMethod('function GetLgoti : String');
    RegisterMethod('function GetLgotiEx(sDelim:String) : String');
    RegisterMethod('function Priznaki : TDataSet');
    RegisterMethod('function Dvig : TDataSet');
    RegisterMethod('function DvigToStr(strRazd: String): String');
    RegisterMethod('function Ubyl(sType:String; sRazd:String): String');
    RegisterMethod('function Pasport_Name  : String;');
    RegisterMethod('function Pasport_Seria : String;');
    RegisterMethod('function Pasport_Nomer : String;');
    RegisterMethod('function Pasport_Organ : String;');
    RegisterMethod('function Pasport_Date(sFormat:String) : String;');
    RegisterMethod('function PasportToStr(nType:Integer) : String');
    RegisterMethod('function SostavSemPasportToStr(nType:Integer) : String');
    RegisterMethod('function MestoRogd(lFull:Boolean; nOrder:Integer): String;');
    RegisterMethod('function MestoReg(lFull:Boolean; nOrder:Integer): String;');
    RegisterMethod('function OtkudaPrib(lFull:Boolean; nOrder:Integer): String;');
    RegisterMethod('function LichNomer : String');
    RegisterMethod('function getDolg : String');
    RegisterMethod('function getWork : String');
    RegisterMethod('function getWorkEx(sAdd:String) : String');
    RegisterMethod('function getOtnosh(IsPrintFirst:Boolean) : String');
    RegisterMethod('function getGrag(IsNullToDef:Boolean; lObozn:Boolean) : String');
    RegisterMethod('function IsKvartirant : Boolean');
    RegisterMethod('function Adres : TAdresLic;');
    RegisterMethod('function OtdelnoOch : TDataSet');
    RegisterMethod('function ReshOch : TDataSet');
    RegisterMethod('function ReshOchAll : TDataSet');
    RegisterMethod('function Test : String');
    RegisterMethod('function NomerOch(nOch:Integer; sPar:String): String;');
    RegisterMethod('function DatePostOch(nOch:Integer): TDateTime;');
    RegisterMethod('function GetReshOch(nTypeOch:Integer; nTypeResh:Integer): TReshOchMen');
    RegisterMethod('function FillReshOch(resh:TReshOchMen;nTypeOch:Integer; nTypeResh:Integer):Boolean');
    RegisterMethod('function AllReshOch(sl:TStringList; dDateR:TDateTime; sNomer:String): Boolean;');
    RegisterMethod('function SostavSem : TDataSet');
    RegisterMethod('function SostavSemToStr(strType:String; strRazd:String) : String');
    RegisterMethod('function GetVoenkom(nTypeDate:Integer; sDelim:String):String;');
    RegisterMethod('function FIO:String;');
    RegisterMethod('function Familia:String;');
    RegisterMethod('function Name:String;');
    RegisterMethod('function Otch:String;');
    RegisterMethod('function Pol:String;');
    RegisterMethod('function DateR:TDateTime;');
    RegisterMethod('procedure SetFactor(sName:String; v:Variant);');
    RegisterMethod('function GetFactor(sName:String):Variant;');
    RegisterMethod('function GetFactorEx(sName:String;vDef:Variant):Variant;');
    RegisterMethod('function TypeReg : Integer');

    RegisterMethod('function Read(nID:Integer):Boolean;');
    RegisterMethod('function ReadEx(nID:Integer;sPar:String):Boolean;');
    RegisterMethod('function Write:Boolean;');
    RegisterMethod('function ReadLic(nID:Integer):Boolean;');

    RegisterMethod('constructor Create;');
//    RegisterMethod('destructor Destroy;');
  end;

  with cr do
  begin
    RegisterMethod('function Mens : TMens;');
    RegisterMethod('function HouseOwners : TDataSet;');
    RegisterMethod('function HouseOwnersHist : TDataSet;');
    RegisterMethod('function HouseProps : TDataSet;');
    RegisterMethod('function LicSchet : TDataSet;');
    RegisterMethod('function ListLicSchet : String;');
    RegisterMethod('function Fld(strName:String) : TField;');
    RegisterMethod('function Value(strName:String) : Variant;');
    RegisterMethod('function SetType(sType:String):String;');
    RegisterMethod('function GetAdres : String');
    RegisterMethod('function GetAdres2(lAddRn:Boolean;lAddObl:Boolean;sType:String) : String;');
    RegisterMethod('function IsMyAdres : Boolean');
    RegisterMethod('function NotDom : Boolean');
    RegisterMethod('function GetID : Integer;');
    RegisterMethod('function NameHouse : String');
    RegisterMethod('function Punkt : String;');
    RegisterMethod('function PunktN : String;');
    RegisterMethod('function IsGorod : Boolean;');
    RegisterMethod('function Gorod : String;');
    RegisterMethod('function Selo  : String;');
    RegisterMethod('function Ulica : String;');
    RegisterMethod('function PunktUlica : String;');
    RegisterMethod('function DomKv : String;');
    RegisterMethod('function Dom : String;');
    RegisterMethod('function Dom2: String;');
    RegisterMethod('function Korp : String;');
    RegisterMethod('function Kv : String;');
    RegisterMethod('function Etag : String;');
    RegisterMethod('function Kol_Etag : String;');
    RegisterMethod('function Predst   : String;');
    RegisterMethod('function ControlHouse:String;');
    RegisterMethod('function UseGilfond:String;');
    RegisterMethod('function PrivateSect:Boolean;');
    RegisterMethod('function GetOwners(sl : TStringList; nType : Integer) : String;');
    RegisterMethod('function OwnersType:Integer;');
//    RegisterProperty('STEPY', 'INTEGER', iptrw);
  end;

  with Cl.AddClassN(cl.FindClass('TLICSCHET'), 'TLICSCHET') do
  begin
    RegisterMethod('function Fld(strName:String) : TField;');
    RegisterMethod('function Value(strName:String) : Variant;');
    RegisterMethod('function ReadFirst : Boolean;');
    RegisterMethod('function GetFirst(sField:String) : Variant;');
    RegisterMethod('function Lgoti : TDataSet;');
    RegisterMethod('function Priznaki : TDataSet;');
    RegisterMethod('function HouseOwners : TDataSet;');
    RegisterMethod('function Mens : TMens;');
    RegisterMethod('procedure SetFactor(sName:String; v:Variant);');
    RegisterMethod('function GetFactor(sName:String):Variant;');
    RegisterMethod('function GetFactorEx(sName:String;vDef:Variant):Variant;');
    RegisterMethod('function Adres : TAdresLic;');
    RegisterMethod('function Predst : String;');
    RegisterMethod('function Osnov : String;');
    RegisterMethod('function ControlHouse:String;');
    RegisterMethod('function UseGilfond:String;');
    RegisterMethod('function PrivateSect:Boolean;');
    RegisterMethod('function GetOwners(sl : TStringList; nType : Integer) : String;');
    RegisterMethod('function OwnersType:Integer;');
    RegisterMethod('function NanimOrOwners(sPar:String):String;');
  end;
end;

procedure RIRegisterLicSchet(Cl: TIFPSRuntimeClassImporter);
begin

  with Cl.Add(TMens) do
  begin
    RegisterMethod(@TMens.DataSet,'DATASET');
    RegisterMethod(@TMens.First,'FIRST');
    RegisterMethod(@TMens.Last,'LAST');
    RegisterMethod(@TMens.Next,'NEXT');
    RegisterMethod(@TMens.Prior,'PRIOR');
    RegisterMethod(@TMens.Eof,'EOF');
    RegisterMethod(@TMens.Fld,'FLD');
    RegisterMethod(@TMens.Value,'VALUE');
    RegisterMethod(@TMens.Count,'COUNT');
    RegisterMethod(@TMens.Lgoti,'LGOTI');
    RegisterMethod(@TMens.GetLgoti,'GETLGOTI');
    RegisterMethod(@TMens.GetLgotiEx,'GETLGOTIEX');
    RegisterMethod(@TMens.Priznaki,'PRIZNAKI');
    RegisterMethod(@TMens.Dvig,'DVIG');
    RegisterMethod(@TMens.DvigToStr,'DVIGTOSTR');
    RegisterMethod(@TMens.Ubyl,'UBYL');
    RegisterMethod(@TMens.Pasport_Name,'PASPORT_NAME');
    RegisterMethod(@TMens.Pasport_Seria,'PASPORT_SERIA');
    RegisterMethod(@TMens.Pasport_Nomer,'PASPORT_NOMER');
    RegisterMethod(@TMens.Pasport_Organ,'PASPORT_ORGAN');
    RegisterMethod(@TMens.Pasport_Date,'PASPORT_DATE');
    RegisterMethod(@TMens.PasportToStr,'PASPORTTOSTR');
    RegisterMethod(@TMens.SostavSemPasportToStr,'SOSTAVSEMPASPORTTOSTR');
    RegisterMethod(@TMens.MestoRogd,'MESTOROGD');
    RegisterMethod(@TMens.MestoReg,'MESTOREG');
    RegisterMethod(@TMens.OtkudaPrib,'OTKUDAPRIB');
    RegisterMethod(@TMens.LichNomer,'LICHNOMER');
    RegisterMethod(@TMens.getDolg,'GETDOLG');
    RegisterMethod(@TMens.getWork,'GETWORK');
    RegisterMethod(@TMens.getWorkEx,'GETWORKEX');
    RegisterMethod(@TMens.getOtnosh,'GETOTNOSH');
    RegisterMethod(@TMens.getGrag,'GETGRAG');
    RegisterMethod(@TMens.IsKvartirant,'ISKVARTIRANT');
    RegisterMethod(@TMens.Adres,'ADRES');
    RegisterMethod(@TMens.OtdelnoOch,'OTDELNOOCH');
    RegisterMethod(@TMens.Test,'TEST');
    RegisterMethod(@TMens.GetReshOch,'GETRESHOCH');
    RegisterMethod(@TMens.FillReshOch,'FILLRESHOCH');
    RegisterMethod(@TMens.AllReshOch,'ALLRESHOCH');
    RegisterMethod(@TMens.NomerOch,'NOMEROCH');
    RegisterMethod(@TMens.DatePostOch,'DATEPOSTOCH');
    RegisterMethod(@TMens.ReshOch,'RESHOCH');
    RegisterMethod(@TMens.ReshOchAll,'RESHOCHALL');
    RegisterMethod(@TMens.SostavSem,'SOSTAVSEM');
    RegisterMethod(@TMens.SostavSemToStr,'SOSTAVSEMTOSTR');
    RegisterMethod(@TMens.GetVoenkom,'GETVOENKOM');
    RegisterMethod(@TMens.FIO,'FIO');
    RegisterMethod(@TMens.Familia,'FAMILIA');
    RegisterMethod(@TMens.Name,'NAME');
    RegisterMethod(@TMens.Otch,'OTCH');
    RegisterMethod(@TMens.POL,'POL');
    RegisterMethod(@TMens.DateR,'DateR');

    RegisterMethod(@TMens.GetFactor,'GETFACTOR');
    RegisterMethod(@TMens.GetFactorEx,'GETFACTOREX');
    RegisterMethod(@TMens.SetFactor,'SETFACTOR');

    RegisterMethod(@TMens.TypeReg,'TYPEREG');

    RegisterMethod(@TMens.Read,'READ');
    RegisterMethod(@TMens.ReadEx,'READEX');
    RegisterMethod(@TMens.Write,'WRITE');
    RegisterMethod(@TMens.ReadLic,'READLIC');

    RegisterConstructor(@TMens.CreateForScript ,'CREATE');
//    RegisterMethod(@TMens.Destroy,'DESTROY');
//    RegisterPropertyHelper(@FMPARAMQUEST_STEPY_R, @FMPARAMQUEST_STEPY_W, 'STEPY');
  end;
  with Cl.Add(TAdresLic) do
  begin
    RegisterMethod(@TAdresLic.Mens,'MENS');
    RegisterMethod(@TAdresLic.Fld,'FLD');
    RegisterMethod(@TAdresLic.Value,'VALUE');
    RegisterMethod(@TAdresLic.HouseOwners ,'HOUSEOWNERS');
    RegisterMethod(@TAdresLic.HouseOwnersHist ,'HOUSEOWNERSHIST');
    RegisterMethod(@TAdresLic.HouseProps ,'HOUSEPROPS');
    RegisterMethod(@TAdresLic.LicSchet ,'LICSCHET');
    RegisterMethod(@TAdresLic.ListLicSchet ,'LISTLICSCHET');
    RegisterMethod(@TAdresLic.SetType,'SETTYPE');
    RegisterMethod(@TAdresLic.NotDom,'NOTDOM');
    RegisterMethod(@TAdresLic.NameHouse,'NAMEHOUSE');
    RegisterMethod(@TAdresLic.getAdres,'GETADRES');
    RegisterMethod(@TAdresLic.getAdres2,'GETADRES2');
    RegisterMethod(@TAdresLic.IsMyAdres,'ISMYADRES');
    RegisterMethod(@TAdresLic.getID,'GETID');
    RegisterMethod(@TAdresLic.Punkt,'PUNKT');
    RegisterMethod(@TAdresLic.PunktN,'PUNKTN');
    RegisterMethod(@TAdresLic.IsGorod,'ISGOROD');
    RegisterMethod(@TAdresLic.Gorod,'GOROD');
    RegisterMethod(@TAdresLic.Selo,'SELO');
    RegisterMethod(@TAdresLic.Ulica,'ULICA');
    RegisterMethod(@TAdresLic.PunktUlica,'PUNKTULICA');
    RegisterMethod(@TAdresLic.DomKv,'DOMKV');
    RegisterMethod(@TAdresLic.Dom,'DOM');
    RegisterMethod(@TAdresLic.Dom2,'DOM2');
    RegisterMethod(@TAdresLic.Korp,'KORP');
    RegisterMethod(@TAdresLic.Kv,'KV');
    RegisterMethod(@TAdresLic.Etag,'ETAG');
    RegisterMethod(@TAdresLic.Kol_Etag,'KOL_ETAG');
    RegisterMethod(@TAdresLic.Predst,'PREDST');
    RegisterMethod(@TAdresLic.ControlHouse,'CONTROLHOUSE');
    RegisterMethod(@TAdresLic.UseGilfond,'USEGILFOND');
    RegisterMethod(@TAdresLic.PrivateSect,'PRIVATESECT');
    RegisterMethod(@TAdresLic.GetOwners, 'GETOWNERS');
    RegisterMethod(@TAdresLic.OwnersType, 'OWNERSTYPE');
  end;
  with Cl.Add(TLicSchet) do
  begin
    RegisterMethod(@TLicSchet.Fld,'FLD');
    RegisterMethod(@TLicSchet.Value,'VALUE');
    RegisterMethod(@TLicSchet.ReadFirst,'READFIRST');
    RegisterMethod(@TLicSchet.getFirst,'GETFIRST');
    RegisterMethod(@TLicSchet.Lgoti,'LGOTI');
    RegisterMethod(@TLicSchet.PRIZNAKI,'PRIZNAKI');
    RegisterMethod(@TLicSchet.HouseOwners,'HOUSEOWNERS');
    RegisterMethod(@TLicSchet.GetFactor,'GETFACTOR');
    RegisterMethod(@TLicSchet.GetFactorEx,'GETFACTOREX');
    RegisterMethod(@TLicSchet.SetFactor,'SETFACTOR');
    RegisterMethod(@TLicSchet.Mens,'MENS');
    RegisterMethod(@TLicSchet.Adres,'ADRES');
    RegisterMethod(@TLicSchet.Predst,'PREDST');
    RegisterMethod(@TLicSchet.Osnov,'OSNOV');
    RegisterMethod(@TLicSchet.ControlHouse,'CONTROLHOUSE');
    RegisterMethod(@TLicSchet.UseGilFond,'USEGILFOND');
    RegisterMethod(@TLicSchet.PrivateSect,'PRIVATESECT');
    RegisterMethod(@TLicSchet.GetOwners, 'GETOWNERS');
    RegisterMethod(@TLicSchet.OwnersType, 'OWNERSTYPE');
    RegisterMethod(@TLicSchet.NanimOrOwners, 'NANIMOROWNERS');
  end;
end;

procedure SIRegisterZAGS(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN( cl.FindClass('TOBJECT'), 'TDOKZAGS') do
  begin
    RegisterMethod('function IsNull : Boolean;');
    RegisterMethod('function GetTypeDok : String;');
    RegisterMethod('function Fld(strName:String) : TField;');
    RegisterMethod('function FIO(strPar:String) : String;');
    RegisterMethod('function FIO2(strPar:String;strPol:String;strPadeg:String) : String;');
    RegisterMethod('function Value(strName:String) : Variant;');
    RegisterMethod('function FPlus(strFields: String; strRazd:String): String;');
    RegisterMethod('function OnlySvid : Boolean;');
    RegisterMethod('function GetTable(strName:String) : TDataSet;');
    RegisterMethod('function Deti : TDataSet;');
    RegisterMethod('function SvidPovtor : TDataSet;');
    RegisterMethod('function NameZAGS(strType:String;strPadeg:String) : String;');
    RegisterMethod('function NameZAGS2(strType:String;strPadeg:String) : String;');
    RegisterMethod('function GetGrag(sField:String; sRazd:String) : String;');
    RegisterMethod('function GetAdres(strParam:String; nType:Integer) : String;');
    RegisterMethod('function GetAdres2(strParam:String; nType:Integer) : String;');
    RegisterMethod('function GetPasport(strParam:String; nType:Integer) : String;');
    RegisterMethod('function GetPassport(strParam:String; nType:Integer) : String;');
    RegisterMethod('function GetHistValue(strNameField : String; nType : Integer) : Variant;');
    RegisterMethod('function CheckSvid : Boolean;');
    RegisterMethod('function IsporSvid : Boolean;');
    RegisterMethod('function GetLastError : String;');
    RegisterMethod('procedure SetLastError(strErr : String);');
    RegisterMethod('procedure ClearProtokol;');
    RegisterMethod('procedure AddProtokol(s: String);');
    RegisterMethod('function ActiveON : Boolean;');
    RegisterMethod('function VozrastPropisON(nType:Integer) : String;');
    RegisterMethod('function VozrastPropisONA(nType:Integer) : String;');
    RegisterMethod('function PrintSpecSvid : Boolean;');
    RegisterMethod('function PrintSpecSprav : Integer;');
    RegisterMethod('function EmptyIzm : String;');
    RegisterMethod('function GetIzm(sField:String) : String;');
    RegisterMethod('function TypeObj:Integer;');
    RegisterMethod('procedure PostDokument;');
    RegisterMethod('procedure EditDokument;');
    RegisterMethod('function CondIN(sFldIN:String):String;');
  end;
end;

procedure RIRegisterZAGS(Cl: TIFPSRuntimeClassImporter);
begin
  with Cl.Add(TDokZAGS) do
  begin
    RegisterMethod(@TDokZAGS.Fld,'FLD');
    RegisterMethod(@TDokZAGS.FIO,'FIO');
    RegisterMethod(@TDokZAGS.FIO2,'FIO2');
    RegisterMethod(@TDokZAGS.Value,'VALUE');
    RegisterMethod(@TDokZAGS.FPlus,'FPLUS');
    RegisterMethod(@TDokZAGS.IsNull,'ISNULL');
    RegisterMethod(@TDokZAGS.GetTypeDok,'GETTYPEDOK');
    RegisterMethod(@TDokZAGS.Deti,'DETI');
    RegisterMethod(@TDokZAGS.SvidPovtor,'SVIDPOVTOR');
    RegisterMethod(@TDokZAGS.OnlySvid,'ONLYSVID');
    RegisterMethod(@TDokZAGS.GetTable,'GETTABLE');
    RegisterMethod(@TDokZAGS.NameZAGS,'NAMEZAGS');
    RegisterMethod(@TDokZAGS.NameZAGS2,'NAMEZAGS2');
    RegisterMethod(@TDokZAGS.GetGrag,'GETGRAG');
    RegisterMethod(@TDokZAGS.GetAdres,'GETADRES');
    RegisterMethod(@TDokZAGS.GetAdres2,'GETADRES2');
    RegisterMethod(@TDokZAGS.GetPasport,'GETPASPORT');
    RegisterMethod(@TDokZAGS.GetPassport,'GETPASSPORT');
    RegisterMethod(@TDokZAGS.GetHistValue,'GETHISTVALUE');
    RegisterMethod(@TDokZAGS.CheckSvid,'CHECKSVID');
    RegisterMethod(@TDokZAGS.IsporSvid,'ISPORSVID');
    RegisterMethod(@TDokZAGS.GetLastError,'GETLASTERROR');
    RegisterMethod(@TDokZAGS.SetLastError,'SETLASTERROR');
    RegisterMethod(@TDokZAGS.ClearProtokol,'CLEARPROTOKOL');
    RegisterMethod(@TDokZAGS.AddProtokol,'ADDPROTOKOL');
    RegisterMethod(@TDokZAGS.ActiveON,'ACTIVEON');
    RegisterMethod(@TDokZAGS.VozrastPropisON ,'VOZRASTPROPISON');
    RegisterMethod(@TDokZAGS.VozrastPropisONA ,'VOZRASTPROPISONA');
    RegisterMethod(@TDokZAGS.PrintSpecSvid ,'PRINTSPECSVID');
    RegisterMethod(@TDokZAGS.PrintSpecSprav ,'PRINTSPECSPRAV');
    RegisterMethod(@TDokZAGS.EmptyIzm ,'EMPTYIZM');
    RegisterMethod(@TDokZAGS.GetIzm ,'GETIZM');
    RegisterMethod(@TDokZAGS.TypeObj,'TYPEOBJ');
    RegisterMethod(@TDokZAGS.PostDokument ,'POSTDOKUMENT');
    RegisterMethod(@TDokZAGS.EditDokument ,'EDITDOKUMENT');
    RegisterMethod(@TDokZAGS.CondIN,'CONDIN');
  end;
end;

procedure SIRegister_SelSovet(Cl: TIFPSPascalCompiler);
begin
  SIRegisterfmMain(Cl);
  SIRegisterdmBase(Cl);
  SIRegisterLicSchet(Cl);
  SIRegisterZAGS(Cl);
end;

procedure RIRegister_SelSovet(Cl: TIFPSRuntimeClassImporter);
begin
  RIRegisterfmMain(Cl);
  RIRegisterdmBase(Cl);
  RIRegisterLicSchet(Cl);
  RIRegisterZAGS(Cl);
end;

end.




