unit uObjectsScript;

{$I Task.inc}

interface

uses classes, db,
     {$IFDEF ADD_MENS_PU} dLichSchet, dMen, dAdres, {$ENDIF}
     FuncPr, fSimpleD,kbmMemTable, SysUtils, uProject, uTypes, uPadegFIO,
     DateUtils, MetaTask, dbFunc,dBase, uProjectAll,OpisEdit, ReportTask
     {$IFDEF GISUN}  ,uGisun {$ENDIF}
     {$IFDEF VER150}  ,Variants {$ENDIF}
     {$IFDEF USE_FR3} ,frxClass {$ENDIF}  ;

type
  TRecordFirst=record
    FAMILIA : String;                              
    NAME : String;
    OTCH : String;
    DATER : TDateTime;
    DATEP : TDateTime;
    DATEV : TDateTime;
    DATE_SROK : TDateTime;
    DATES : TDateTime;
    PRESENT:Boolean;
    PROPIS:Boolean;
    CANDELETE:Boolean;
  end;

  TLicSchet = class;
  TMens = class;

  TAdresLic = class(TObject)
  private
    FLic : TLicSchet;
    FMen : TMens;
    FMyAdres : Boolean;
    FType:String;
    FOnlyAdres: Boolean;
    {$IFDEF ADD_MENS_PU}
      FdmAdres: TdmAdres;
      procedure SetdmAdres(const Value: TdmAdres);
    {$ELSE}
      FdmAdres: TObject;
      procedure SetdmAdres(const Value: TObject);
    {$ENDIF}
    procedure SetOnlyAdres(const Value: Boolean);
  public
    property OnlyAdres:Boolean read FOnlyAdres write SetOnlyAdres;  // обращение идет к адресу как самостоятельному объекту
    {$IFDEF ADD_MENS_PU}
     property dmAdres : TdmAdres read FdmAdres write SetdmAdres;
    {$ELSE}
     property dmAdres : TObject read FdmAdres write SetdmAdres;
    {$ENDIF}
    function HouseOwners : TDataSet;
    function HouseOwnersHist : TDataSet;
    function HouseProps : TDataSet;
    function LicSchet : TDataSet;
    function Mens : TMens;
    function ListLicSchet : String;
    function Fld( strFieldName : String) : TField;
    function Value( strFieldName : String) : Variant;
    function SetType(sType:String):String;
    function GetAdres_(lAddRn:Boolean;lAddObl:Boolean;sType:String): String;
    function GetAdres : String;
    function GetAdres2(lAddRn:Boolean;lAddObl:Boolean;sType:String) : String;
    function IsMyAdres : Boolean;
    function GetID  : Integer;
    function Punkt  : String;
    function PunktN : String;
    function Gorod  : String;
    function Selo  : String;
    function IsGorod: Boolean;
    function Ulica  : String;
    function PunktUlica : String;
    function FullName : String;
//    function TipUlica : String;
    function NotDom : Boolean;
    function NameHouse:String;
    function DomKv  : String;
    function Dom    : String;
    function Dom2   : String;
    function Korp   : String;
    function Kv     : String;
    function Etag   : String;
    function Kol_Etag : String;
    function Predst   : String;
    function ControlHouse:String;
    function UseGilfond:String;
    function PrivateSect:Boolean;
    function GetOwners(sl : TStringList; nType : Integer) : String;
    function OwnersType : Integer;

    constructor Create;
    constructor CreateWithMens;

//    function Owners : TOwners;
  end;

  TMens = class(TObject)
  private
    FLic : TLicSchet;
    FAdresMen : TAdresLic;
    FReshOchMen:TReshOchMen;
    FScript:Boolean;
  public
    {$IFDEF ADD_MENS_PU}
     FdmMen : TdmMen;
    {$ELSE}
     FdmMen : TObject;
    {$ENDIF}
    function DataSet : TDataSet;
    function DataSetAll : TDataSet;
    procedure First;
    procedure Last;
    procedure Next;
    procedure Prior;
    function Eof : Boolean;
    function Count : Integer;
    function Fld( strFieldName : String) : TField;
    function Value( strFieldName : String) : Variant;
    function Lgoti    : TDataSet;
    function GetLgoti : String;
    function GetLgotiEx(sDelim:String): String;
    function Priznaki : TDataSet;
    function Dvig     : TDataSet;
    function DvigToStr(strRazd:String) : String;
    function Ubyl(sType:String; sRazd: String): String;
    function SostavSem: TDataSet;
    function SostavSemToStr(strType:String; strRazd:String): String;
    function SostavSemPasportToStr(nType:Integer) : String;
    function GetVoenkom(nTypeDate:Integer; sDelim:String):String;
    function NomerOch(nOch:Integer; sPar:String): String;
    function DatePostOch(nOch:Integer): TDateTime;
    function OtdelnoOch: TDataSet;
    function ReshOch: TDataSet;
    function ReshOchAll: TDataSet;
    function GetReshOch_(resh:TReshOchMen;nTypeOch:Integer; nTypeResh:Integer):Boolean;
    function GetReshOch(nTypeOch:Integer; nTypeResh:Integer): TReshOchMen;

    function AllReshOch(sl:TStringList; dDateR:TDateTime; sNomer:String): Boolean;
    function FillReshOch(resh:TReshOchMen;nTypeOch:Integer; nTypeResh:Integer): Boolean;
    function Test: String;

    function FIOPadeg(sPadeg:String) : String;
    function FIO : String;
    function FAMILIA : String;
    function NAME : String;
    function OTCH : String;
    function POL : String;
    function DateR : TDateTime;
    function Pasport_Name  : String;
    function Pasport_Name_Bel : String;
    function Pasport_Seria : String;
    function Pasport_Nomer : String;
    function Pasport_Organ : String;
    function Pasport_Date(sFormat:String)  : String;
    function PasportToStr(nType:Integer) : String;
    function OtkudaPrib(lFull:Boolean; nOrder:Integer):String;
    function MestoRogd(lFull:Boolean; nOrder:Integer): String;
    function MestoReg(lFull:Boolean; nOrder:Integer): String;
    function LichNomer: String;
    function getDolg : String;
    function getWorkEx(sAdd:String): String;
    function getWork : String;
    function getOtnosh(IsPrintFirst:Boolean) : String;
    function getGrag(IsNullToDef:Boolean; lObozn:Boolean) : String;
    function IsKvartirant:Boolean;
    function Adres : TAdresLic;
    function TypeReg : Integer;
    function Read(nID:Integer):Boolean;      //  прочитать человека                     только для скрипта
    function ReadEx(nID:Integer;sPar:String):Boolean;    //  прочитать человека                     только для скрипта
    function Write:Boolean;                  //  записать человека                     только для скрипта
    function ReadLic(nID:Integer):Boolean;   //  прочитать людей лицевого счета         только для скрипта

    function GetFactor(sName:String):Variant;
    function GetFactorEx(sName:String;vDef:Variant):Variant;
    procedure SetFactor(sName:String;vValue:Variant);
    procedure DeleteFactor(sName:String);
    procedure DeleteAllFactor;

    constructor Create;
    constructor CreateForScript;

    destructor Destroy; override;
  end;

  TLicSchet = class(TObject)
  private
    FScript:Boolean;
    RFirst:TRecordFirst;
    FMen : TMens;
    FAdresLic : TAdresLic;
    {$IFDEF ADD_MENS_PU}
     FdmLichSchet: TdmLichSchet;
     procedure SetdmLichSchet(const Value: TdmLichSchet);
    {$ELSE}
     FdmLichSchet: TObject;
     procedure SetdmLichSchet(const Value: TObject);
    {$ENDIF}
  public
    {$IFDEF ADD_MENS_PU}
     property dmLichSchet : TdmLichSchet read FdmLichSchet write SetdmLichSchet;
    {$ELSE}
     property dmLichSchet : TObject read FdmLichSchet write SetdmLichSchet;
    {$ENDIF}
    function Fld( strFieldName : String) : TField;
    function Value( strFieldName : String) : Variant;
    function Lgoti    : TDataSet;
    function Priznaki : TDataSet;
    function HouseOwners   : TDataSet;
    function Mens : TMens;
    function Adres : TAdresLic;
    function ReadFirst:Boolean;
    function GetFirst(sField:String):Variant;

    function Osnov    : String;
    function TypeHouse: String;
    function PunktUlica: String;
    function Predst   : String;
    function ControlHouse:String;
    function UseGilfond:String;
    function PrivateSect:Boolean;
    function GetOwners(sl : TStringList; nType : Integer) : String;
    function OwnersType : Integer;
    function NanimOrOwners(sPar:String): String;

    function GetFactor(sName:String):Variant;
    function GetFactorEx(sName:String;vDef:Variant):Variant;
    procedure SetFactor(sName:String;vValue:Variant);
    procedure DeleteFactor(sName:String);
    procedure DeleteAllFactor;

    constructor Create;
    constructor CreateForScript;

    destructor Destroy; override;
  end;

  TDokZAGS = class(TObject)
  private
    FForm : TfmSimpleD;
//    FLastError : String;
    FTypePrintSvidRast : Integer;
    function GetFormDok: TfmSimpleD;
  public
    property FormDok:TfmSimpleD read GetFormDok;
    function IsNUll:Boolean;
    procedure SetCurDokZAGS( f : TfmSimpleD );
    procedure EditDokument;
    procedure PostDokument;
    function FIO(sPar:String):String;
    function FIO2(sPar:String;sPol:String;sPadeg:String):String;
    function Fld( strFieldName : String) : TField;
    function Value( strFieldName : String) : Variant;
    function FPlus( strFields : String; strRazd:String) : String;
    function Deti : TDataSet;
    function SvidPovtor : TDataSet;
    function GetTable(strName : String) : TDataSet;
    function GetTypeDok : String;
    function TypeObj:Integer;
    function OnlySvid : Boolean;
    function PrintSpecSvid  : Boolean;   // печать специалиста в свидетельстве
    function PrintSpecSprav : Integer;   // печать специалиста в справках  (1-да 0-нет 2-только ФИО)
    function GetHistValue(strFieldName: String; nType: Integer) : Variant;
    function NameZAGS(strType,strPadeg : String) : String;
    function NameZAGS2(strType,strPadeg : String) : String;
    function GetAdres(strParam : String; nType : Integer) : String;
    function GetAdres2(strParam : String; nType : Integer) : String;
    function GetPasport(strParam: String; nType: Integer): String;
    function GetPassport(strParam: String; nType: Integer): String;
    function getGrag(strFieldName, strRazd:String): String;
    function CheckSvid : Boolean;
    function IsporSvid : Boolean;
    function ProvSvid(nType : Integer; lShowQuery : Boolean)  : Boolean;
    function GetLastError : String;
    procedure setTypePrintSvidRast(n : Integer);    // печатается св-во о расторжении для "ОН","ОНА",оба
    function getTypePrintSvidRast: Integer;    // печатается св-во о расторжении для "ОН","ОНА",оба
    procedure SetLastError(strErr:String);

    function EmptyIzm : String;
    function GetIzm(sField:String): String;

    procedure ClearProtokol;
    procedure AddProtokol(s:String);

    function ActiveON : Boolean;
    function VozrastPropisON(nType:Integer) : String;
    function VozrastPropisONA(nType:Integer) : String;
    function CondIN(sFldIN:String):String;
  end;

//------------------------------------------------------------------------
// есть такая же функция в template.pas
//------------------------------------------------------------------------
function AddMenToSprav(m : TMens; nID : Integer) : Boolean;
var
  LicSchet : TLicSchet;
  Men      : TMens;
  Adres    : TAdresLic;
  DokZAGS  : TDokZAGS;
  CurDok   : TDokZAGS;

implementation

uses fMain, fRegGISUN
     {$IFDEF ADD_MENS_PU}  ,dDokument  {$ENDIF}
     {$IFDEF USE_FR3} ,fs_iinterpreter {$ENDIF};

//------------------------------------------------------------------------
// есть такая же функция в template.pas
//------------------------------------------------------------------------
function AddMenToSprav(m : TMens; nID : Integer) : Boolean;
var
  sMens:String;
begin
  sMens:=GetBookmarkMen;      // есть люди отмеченные в гриде
  if sMens<>'' then begin
    if (m.Fld('ID_INTERNAL').AsInteger<>nID) and        // пропускаем хозяина справки
       (Pos(m.Fld('ID_INTERNAL').AsString+';',sMens)> 0)
      then Result:=true
      else Result:=false;
  end else begin
    if (m.Fld('ID_INTERNAL').AsInteger<>nID) and        // пропускаем хозяина справки
       (m.Fld('PROPIS').AsBoolean=true) and             // вкл. только прописанных
       ( (m.Fld('PRESENT').AsBoolean=true) or GlobalTask.ParamAsBoolean('SP_PRESENT') ) and
       (m.Fld('CANDELETE').AsBoolean=false) then begin
      Result:=true;
    end else begin
      Result:=false;
    end;
  end;
end;


{ TAdresLic }

function TAdresLic.DomKv: String;
begin
  Result := dmBase.Adres_Dom;
end;

function TAdresLic.Dom2: String;
begin
  Result := dmBase.Adres_Dom2;
end;

function TAdresLic.Dom: String;
begin
  Result := dmBase.Adres_NDom;
end;

function TAdresLic.Korp: String;
begin
  Result := dmBase.Adres_Korp;
end;

function TAdresLic.Kv: String;
begin
  Result := dmBase.Adres_Kv;
end;

function TAdresLic.Punkt: String;
begin
  Result := dmBase.Adres_Punkt;
end;
function TAdresLic.PunktN: String;
begin
  Result := dmBase.Adres_PunktN;
end;
function TAdresLic.IsGorod: Boolean;
begin
  Result := dmBase.Adres_IsGorod;
end;
function TAdresLic.Gorod: String;
begin
  Result := dmBase.Adres_Gorod;
end;
function TAdresLic.Selo: String;
begin
  Result := dmBase.Adres_Selo;
end;

function TAdresLic.Ulica: String;
begin
  Result := dmBase.Adres_UL;
end;

function TAdresLic.PunktUlica: String;
begin
//  Result:= Fld('PUNKT_NAME').AsString + IIFS(Fld('UL_NAME').AsString='', '', ', '+Fld('UL_NAME').AsString);
  Result := dmBase.Adres_PunktUL;
end;

function TAdresLic.FullName: String;
begin
  Result := dmBase.Adres_Result;
end;

function TAdresLic.Etag: String;
begin
  Result := dmBase.Adres_Etag;
end;

function TAdresLic.Kol_Etag: String;
begin
  Result := dmBase.Adres_Kol_Etag;
end;

function TAdresLic.NameHouse: String;
begin
  Result := dmBase.Adres_NameHouse;
end;

function TAdresLic.NotDom: Boolean;
begin
  Result := dmBase.Adres_NotDom;
end;


constructor TAdresLic.Create;
begin
  FOnlyAdres:=false;
  FdmAdres:=nil;
  FLic:=nil;
  FMen:=nil;
  FType:='БЕЗ_НАИМ;'; // без имени строения, если адрес без номера дома
end;

constructor TAdresLic.CreateWithMens;
begin
  FOnlyAdres:=false;
  FdmAdres:=nil;
  FLic:=nil;
  FMen := TMens.Create;
  FType:='БЕЗ_НАИМ;'; // без имени строения, если адрес без номера дома
end;

{$IFNDEF ADD_MENS_PU}
procedure TAdresLic.SetdmAdres(const Value: TObject);
begin
  FdmAdres := Value;
end;
{$ELSE}
procedure TAdresLic.SetdmAdres(const Value: TdmAdres);
begin
  FdmAdres := Value;
  if FMen<>nil then begin
    if Value=nil then begin
      FMen.FdmMen := nil;
    end else begin
      FMen.FdmMen := Value.dmMens;
    end;
  end;
end;
{$ENDIF}

function TAdresLic.GetID: Integer;
begin
{$IFNDEF ADD_MENS_PU}
  result:=0;
{$ELSE}
  if FMen<>nil then begin
    if FMen.FdmMen.mtDokumentADRES_ID.AsString<>'' then begin
      Result := FMen.FdmMen.mtDokumentADRES_ID.AsInteger;
    end else begin
      Result := 0;
    end;
  end else begin
    if FLic.dmLichSchet.mtDokumentADRES_ID.AsString<>'' then begin
      Result := FLic.FdmLichSchet.mtDokumentADRES_ID.AsInteger;
    end else begin
      Result := 0;
    end;
  end;
  if result=0 then FMyAdres:=false else FMyAdres:=true;
{$ENDIF}
end;

//---------------------------------------------------------------------------
function TAdresLic.GetAdres_(lAddRn:Boolean;lAddObl:Boolean;sType:String): String;
{$IFDEF ADD_MENS_PU}
var
  s:String;
  adr : TAdres;
  lNameNotDom,lID:Boolean;
{$ENDIF}
begin
{$IFNDEF ADD_MENS_PU}
  result:='';
{$ELSE}
  { потом реализовать  sType
    +CRLF     разделитель перевод каретки
    +PADEG=   в падеже
    +POST     почтовый адрест
  }
  dmBase.SaveGlobalAdres;  //!!!
  lID:=false;
  if Pos('БЕЗ_НАИМ',FType)>0  then lNameNotDom:=false  else lNameNotDom:=true;
  FMyAdres:=true;
  if FMen <> nil then begin
    if (FMen.FdmMen.mtDokumentADRES_ID.AsInteger=0) or (FMen.FdmMen.mtDokumentADRES_ID.AsString='') then begin
        //adr:=dmBase.AdresMen( FMen.FdmMen.DateFiks, FMen.FdmMen.mtDokumentID.AsString, s, true);
      if FMen.FdmMen.mtDokumentID_BASE.AsInteger>0 then begin
         // для объединенной очереди
        dmBase.AdresFromMensAdd(FMen.FdmMen.mtDokumentID.AsString, adr, FMen.FdmMen.mtDokument);
      end else begin
        adr:=FMen.FdmMen.GetAPROP;
      end;
      dmBase.RecAdresToGlobal(adr);
      Result:=adr.AdresPropis;
      FMyAdres:=false;
    end else begin
      Result := dmBase.AdresFromID( FMen.FdmMen.DateFiks, FMen.FdmMen.mtDokumentADRES_ID.AsString,lNameNotDom );
      lID:=true;
    end;
  end else begin
    if FLic.dmLichSchet.mtDokumentADRES_ID.AsString<>'' then begin
      Result := dmBase.AdresFromID( FLic.dmLichSchet.DateFiks, FLic.dmLichSchet.mtDokumentADRES_ID.AsString,lNameNotDom );
      lID:=true;
    end;
  end;
  if lID and (Result<>'') and (lAddObl or lAddRn) then begin
    s:='';
    if lAddObl and (Trim(fmMain.NameObl(''))<>'')  then s:=s+fmMain.NameObl('')+', ' ;
    if lAddRn and (Trim(fmMain.NameRaion(''))<>'') then s:=s+fmMain.NameRaion('')+', ';
    Result:=s+Result;
  end;
  dmbase.RestGlobalAdres;
{$ENDIF}
end;

//---------------------------------------------------------------------------
function TAdresLic.GetAdres: String;
begin
{$IFNDEF ADD_MENS_PU}
  result:='';
{$ELSE}
  Result:=GetAdres_(false,false,'');
{$ENDIF}
end;
//---------------------------------------------------------------------------
function TAdresLic.GetAdres2(lAddRn:Boolean;lAddObl:Boolean;sType:String) : String;
begin
  Result:=GetAdres_(lAddRn,lAddObl,sType);
end;

//---------------------------------------------------------------
function TAdresLic.GetOwners(sl : TStringList; nType : Integer): String;
var
  lFromLic:Boolean;
begin
{$IFNDEF ADD_MENS_PU}
  Result:='';
{$ELSE}
  lFromLic:=false;
  if OnlyAdres then begin
    Result := dmBase.HouseOwners( FMen.FdmMen.DateFiks, FMen.FdmMen.mtDokumentADRES_ID.AsString,
                                  sl, nType, dmAdres.tbHouseOwners, dmAdres.dmMens.mtDokument, nil);
  end else begin
    if FLic<>nil then begin  // лицевой счет прочитан
      if (FLic.dmLichSchet.tbHouseOwners.RecordCount>0) then begin
        lFromLic:=true;
      end;
    end;
    if lFromLic then begin
      Result := FLic.dmLichSchet.HouseOwners(sl, nType);
    end else begin
      if FMen <> nil then begin
        if FMen.FdmMen.mtDokumentADRES_ID.AsString<>'' then begin
          Result := dmBase.HouseOwners( FMen.FdmMen.DateFiks,
            FMen.FdmMen.mtDokumentADRES_ID.AsString, sl, nType, nil, nil, nil);
        end;
      end else begin
        if FLic.dmLichSchet.mtDokumentADRES_ID.AsString<>'' then begin
          Result := dmBase.HouseOwners( FLic.dmLichSchet.DateFiks,
            FLic.dmLichSchet.mtDokumentADRES_ID.AsString, sl, nType, nil, nil, nil );
        end;
      end;
    end;
  end;
{$ENDIF}
end;

//---------------------------------------------------------------
function TAdresLic.OwnersType: Integer;
var
  lFromLic:Boolean;
  s:String;
begin
{$IFNDEF ADD_MENS_PU}
  result:=0;
{$ELSE}
  lFromLic:=false;
  s:='0';
  if OnlyAdres then begin
    s := dmBase.HouseOwners( FMen.FdmMen.DateFiks, FMen.FdmMen.mtDokumentADRES_ID.AsString,
                                  nil, 2, dmAdres.tbHouseOwners, dmAdres.dmMens.mtDokument, nil);
  end else begin
    if FLic<>nil then begin  // лицевой счет прочитан
      if (FLic.dmLichSchet.tbHouseOwners.RecordCount>0) then begin
        lFromLic:=true;
      end;
    end;
    if lFromLic then begin
      s := FLic.dmLichSchet.HouseOwners(nil, 2);
    end else begin
      if FMen <> nil then begin
        if FMen.FdmMen.mtDokumentADRES_ID.AsString<>'' then begin
          s := dmBase.HouseOwners( FMen.FdmMen.DateFiks,
            FMen.FdmMen.mtDokumentADRES_ID.AsString, nil, 2, nil, nil, nil);
        end;
      end else begin
        if FLic.dmLichSchet.mtDokumentADRES_ID.AsString<>'' then begin
          s := dmBase.HouseOwners( FLic.dmLichSchet.DateFiks,
            FLic.dmLichSchet.mtDokumentADRES_ID.AsString, nil, 2, nil, nil, nil );
        end;
      end;
    end;
  end;
  Result:=StrToInt(s);
{$ENDIF}
end;

function TAdresLic.IsMyAdres: Boolean;
begin
  Result := FMyAdres;
end;

function TAdresLic.SetType(sType: String):String;
begin
  Result:=FType;
  FType:=sType;
end;

function TAdresLic.Mens: TMens;
begin
  Result:=FMen;
end;

function TAdresLic.Fld(strFieldName: String): TField;
begin
{$IFNDEF ADD_MENS_PU}
  result:=nil;
{$ELSE}
  if FdmAdres=nil then begin
    Result:=nil;
  end else begin
    Result := FdmAdres.mtDokument.FindField(strFieldName);
    if Result = nil then begin
      Result := FdmAdres.tbDopProp.FindField(strFieldName);
    end;
    if Result = nil then begin
      Result := FdmAdres.mtBigHouse.FindField(strFieldName);
    end;
  end;
{$ENDIF}
end;

function TAdresLic.Value(strFieldName: String): Variant;
var
  fld:TField;
begin
{$IFNDEF ADD_MENS_PU}
  Result:=null;
{$ELSE}
  Result:=null;
  fld := self.Fld(strFieldName);
  if fld<>nil then begin
    Result:=CheckNull(fld);
  end;
{$ENDIF}
end;

function TAdresLic.ListLicSchet: String;
var
  strBookmark:String;
begin
{$IFNDEF ADD_MENS_PU}
  result:=''
{$ELSE}
  Result:='';
  if FMen<>nil then begin
    strBookmark:=FMen.FdmMen.mtDokument.Bookmark;
//    l:=dbDisableControls(FMen.FdmMen.mtDokument);
    FMen.FdmMen.mtDokument.First;
    while not FMen.FdmMen.mtDokument.Eof do begin
      if Pos(FMen.FdmMen.mtDokumentNOMER.AsString+',',Result)=0 then begin
        Result:=Result+FMen.FdmMen.mtDokumentNOMER.AsString+',';
      end;
      FMen.FdmMen.mtDokument.Next;
    end;
    if Result<>'' then begin
      Result:=Copy(Result,1,Length(Result)-1);
    end;
    FMen.FdmMen.mtDokument.Bookmark:=strBookmark;
  end;
{$ENDIF}
end;

function TAdresLic.HouseOwners: TDataSet;
begin
{$IFNDEF ADD_MENS_PU}
  REsult:=nil;
{$ELSE}
  Result := FdmAdres.tbHouseOwners;
{$ENDIF}
end;

function TAdresLic.HouseOwnersHist: TDataSet;
begin
{$IFNDEF ADD_MENS_PU}
  Result:=nil;
{$ELSE}
  Result := FdmAdres.tbHouseOwnersHist;
{$ENDIF}
end;

function TAdresLic.HouseProps: TDataSet;
begin
{$IFNDEF ADD_MENS_PU}
  Result:=nil;
{$ELSE}
  Result := FdmAdres.tbHouseProps;
{$ENDIF}
end;

function TAdresLic.LicSchet: TDataSet;
begin
{$IFNDEF ADD_MENS_PU}
  Result:=nil;
{$ELSE}
  Result := FdmAdres.mtLichSchet;
{$ENDIF}
end;

function TAdresLic.Predst: String;
begin
{$IFDEF ADD_MENS_PU}
  if FdmAdres=nil then begin
    Result:=dmBase.Adres_Predst;
  end else begin
    Result:=dmBase.SeekValueTable2(dmBAse.SprPredst,'ID',Fld('PREDST').AsString,'NAME');
  end;
{$ELSE}
  Result := '';
{$ENDIF}
end;

function TAdresLic.ControlHouse: String;
var
  Opis:TOpisEdit;
begin
  if FdmAdres=nil then begin
    Result:=dmBase.Adres_Control;
  end else begin
    if Fld('CONTROL').AsString='' then begin
      Result:='';
    end else begin
      Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_CONTROL_HOUSE');
      Result := Opis.Naim(Fld('CONTROL').AsString, false);
    end;
  end;
end;

function TAdresLic.UseGilfond: String;
var
  Opis:TOpisEdit;
begin
  if FdmAdres=nil then begin
    Result:=dmBase.Adres_UseGilfond;
  end else begin
    if Fld('USE_GILFOND').AsString='' then begin
      Result:='';
    end else begin
      Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_USE_GILFOND');
      Result := Opis.Naim(Fld('USE_GILFOND').AsString, false);
    end;
  end;
end;

function TAdresLic.PrivateSect: Boolean;
begin
  if FdmAdres=nil then begin
    Result:=dmBase.Adres_Private;
  end else begin
    if Fld('CONTROL').AsInteger=CONTROL_PRIVATE
      then Result:=true
      else Result:=false;
  end;
end;

procedure TAdresLic.SetOnlyAdres(const Value: Boolean);
begin
  FOnlyAdres := Value;
end;


{ TMens }

function TMens.Count: Integer;
begin
{$IFNDEF ADD_MENS_PU}
  Result:=0;
{$ELSE}
  Result := FdmMen.mtDokument.RecordCount;
{$ENDIF}
end;

function TMens.Dvig: TDataSet;
begin
{$IFNDEF ADD_MENS_PU}
  Result:=nil;
{$ELSE}
  Result := FdmMen.tbMigr;
{$ENDIF}
end;

function TMens.NomerOch(nOch:Integer; sPar:String): String;
{$IFDEF ADD_MENS_PU}
var
  l:Boolean;
{$ENDIF}
begin
{$IFNDEF ADD_MENS_PU}
  Result:='';
{$ELSE}
  if sPar=''
    then l:=true
    else l:=Globaltask.ParamAsBoolean(sPar);
  Result:='';
  if l then begin
    if nOch<=0 then begin
      Result:=FdmMen.mtDokumentNOMER_OCH.AsString;
    end else begin
      if FdmMen.tbOcheredLgot.Locate('OCHERED_ID', nOch, []) then begin
        Result:=FdmMen.tbOcheredLgotNOMER_OCH.AsString;
      end;
    end;
    if Result='0' then Result:='';
  end;
{$ENDIF}
end;

function TMens.DatePostOch(nOch:Integer): TDateTime;
begin
{$IFNDEF ADD_MENS_PU}
  Result:=0;
{$ELSE}
  Result:=0;
  if nOch<=0 then begin
    if not FdmMen.mtDokumentDEC_DATE.IsNull
      then Result:=FdmMen.mtDokumentDEC_DATE.AsDateTime;
  end else begin
    if FdmMen.tbOcheredLgot.Locate('OCHERED_ID', nOch, []) then begin
      if not FdmMen.tbOcheredLgotDEC_DATE.IsNull
        then Result:=FdmMen.tbOcheredLgotDEC_DATE.AsDateTime;
    end;
  end;
{$ENDIF}
end;

function TMens.OtdelnoOch: TDataSet;
begin
{$IFNDEF ADD_MENS_PU}
  Result:=nil;
{$ELSE}
  Result := FdmMen.tbOcheredLgot;
{$ENDIF}
end;

function TMens.ReshOch: TDataSet;
begin
{$IFNDEF ADD_MENS_PU}
  Result:=nil;
{$ELSE}
  Result := FdmMen.tbOcheredResh;
{$ENDIF}
end;

function TMens.ReshOchAll: TDataSet;
begin
{$IFNDEF ADD_MENS_PU}
  Result:=nil;
{$ELSE}
  if not FdmMen.tbOcheredReshA.Active
    then FdmMen.tbOcheredReshA.Active:=true;
  FdmMen.tbOcheredReshA.Refresh;
  Result := FdmMen.tbOcheredReshA;
{$ENDIF}
end;

function TMens.Test: String;
begin
  Result:='!!!';
end;

function TMens.AllReshOch(sl:TStringList; dDateR:TDateTime; sNomer:String): Boolean;
{$IFNDEF ADD_MENS_PU}
begin
  Result:=false;
end;
{$ELSE}
begin
  Result:=FdmMen.AllReshOch(sl, dDateR, sNomer);
end;
{$ENDIF}

//---------------------------------------------------------------------------------------
function TMens.FillReshOch(resh:TReshOchMen;nTypeOch:Integer; nTypeResh:Integer): Boolean;
begin
  Result:=true;
  GetReshOch_(resh,nTypeOch,nTypeResh);
  if resh.Tip=-1 then Result:=false;
end;
//---------------------------------------------------------------------------------------
function TMens.GetReshOch(nTypeOch:Integer; nTypeResh:Integer): TReshOchMen;
begin
  if FReshOchMen=nil then begin
    FReshOchMen:=TReshOchMen.Create;
  end;
  GetReshOch_(FReshOchMen,nTypeOch,nTypeResh);
  Result:=FReshOchMen;
end;
//---------------------------------------------------------------------------------------
function TMens.GetReshOch_(resh:TReshOchMen;nTypeOch:Integer; nTypeResh:Integer): Boolean;
{$IFNDEF ADD_MENS_PU}
begin
  Result:=false;
end;
{$ELSE}
begin
  Result:=FdmMen.GetReshOch(resh,nTypeOch,nTypeResh);
end;
{$ENDIF}

function TMens.SostavSem: TDataSet;
begin
{$IFNDEF ADD_MENS_PU}
  Result:=nil;
{$ELSE}
  Result := FdmMen.tbSostavSem;
{$ENDIF}
end;

// ЕСТЬ ТАКАЯ ЖЕ ФУНКЦИЯ В dmBase
function TMens.SostavSemToStr(strType:String; strRazd:String): String;
begin
{$IFNDEF ADD_MENS_PU}
  Result:='';
{$ELSE}
  Result:=FdmMen.SostavSemToStr(strType,strRazd);
{$ENDIF}
end;

function TMens.Eof: Boolean;
begin
{$IFNDEF ADD_MENS_PU}
  Result:=true;
{$ELSE}
  Result := FdmMen.mtDokument.Eof;
{$ENDIF}
end;

procedure TMens.First;
begin
{$IFNDEF ADD_MENS_PU}
{$ELSE}
  FdmMen.mtDokument.First;
{$ENDIF}
end;

function TMens.Fld(strFieldName: String): TField;
begin
{$IFNDEF ADD_MENS_PU}
  Result:=nil;
{$ELSE}
  Result := FdmMen.mtDokument.FindField(strFieldName);
  if Result = nil then begin
    Result := FdmMen.tbDopProp.FindField(strFieldName);
  end;
{$ENDIF}
end;

function TMens.Value(strFieldName: String): Variant;
var
  fld:TField;
begin
{$IFNDEF ADD_MENS_PU}
  Result:=null;
{$ELSE}
  Result:=null;
  fld := self.Fld(strFieldName);
  if fld<>nil then begin
    Result:=CheckNull(fld);
  end;
{$ENDIF}
end;

function TMens.MestoRogd(lFull:Boolean; nOrder:Integer): String;
begin
{$IFNDEF ADD_MENS_PU}
  Result:='';
{$ELSE}
  Result:=dmBase.GetMestoFromFields(FdmMen.mtDokument,';MR_GOSUD;MR_B_OBL;MR_OBL;MR_RAION;MR_B_GOROD;MR_GOROD',lFull,nOrder);
{$ENDIF}
end;

function TMens.MestoReg(lFull:Boolean; nOrder:Integer): String;
begin
{$IFNDEF ADD_MENS_PU}
  Result:='';
{$ELSE}
// !!! ПЕРЕПИСАТЬ !!!
  result:='';
  if FdmMen.mtDokumentADRES_ID.AsInteger>0 then begin
    result:=dmBase.Adres_Result;
  end;
  if result='' then begin
    result:=FdmMen.mtDokumentTEXT_ADRES.AsString;
    if result='' then begin
      result:=FdmMen.mtDokumentADRES_PROP.AsString;
    end;
  end;
{$ENDIF}
end;

function TMens.OtkudaPrib(lFull:Boolean; nOrder:Integer): String;
begin
{$IFNDEF ADD_MENS_PU}
  Result:='';
{$ELSE}
  Result:=dmBase.GetMestoFromFields(FdmMen.mtDokument,';OP_GOSUD;OP_B_OBL;OP_OBL;OP_RAION;OP_B_GOROD;OP_GOROD',lFull,nOrder);
{$ENDIF}
end;

function TMens.Pasport_Name: String;
begin
{$IFNDEF ADD_MENS_PU}
  Result:='';
{$ELSE}
  Result:=dmBase.GetNamePasport(FdmMen.mtDokumentPASP_UDOST.AsInteger);
{$ENDIF}
end;

function TMens.Pasport_Name_Bel: String;
begin
{$IFNDEF ADD_MENS_PU}
  Result:='';
{$ELSE}
  Result:=dmBase.GetNamePasport(FdmMen.mtDokumentPASP_UDOST.AsInteger,'Б')
{$ENDIF}
end;

function TMens.Pasport_Seria: String;
begin
{$IFNDEF ADD_MENS_PU}
  Result:='';
{$ELSE}
  Result:=FdmMen.mtDokumentPASP_SERIA.AsString;
{$ENDIF}
end;

function TMens.Pasport_Nomer: String;
begin
{$IFNDEF ADD_MENS_PU}
  Result:='';
{$ELSE}
  Result:=FdmMen.mtDokumentPASP_NOMER.AsString;
{$ENDIF}
end;

function TMens.Pasport_Organ: String;
begin
{$IFNDEF ADD_MENS_PU}
  Result:='';
{$ELSE}
  Result:=FdmMen.mtDokumentPASP_VIDAN.AsString;
{$ENDIF}
end;

function TMens.Pasport_Date(sFormat:String): String;
begin
{$IFNDEF ADD_MENS_PU}
  Result:='';
{$ELSE}
  if FdmMen.mtDokumentPASP_Date.IsNull then begin
    Result:='';
  end else begin
    if sFormat='' then sFormat:='dd.mm.yyyy';
    try
      Result:=FormatDateTime(sFormat,FdmMen.mtDokumentPASP_Date.AsDateTime);
    except
      Result:='';
    end;
  end;
{$ENDIF}
end;

//-------------------------------------------------------------------
{
function TMens.Pasport : TPassport;
begin
 Result.UdostKod:=-1;
 Result.Seria:='';
 Result.Nomer:='';
 Result.LichNomer:='';
 Result.Organ:='';
 Result.Date:=0;
 Result.sDate:='';
 try
   with FdmMen do begin
     if mtDokumentPASP_UDOST.AsInteger>0 then begin
       Result:=dmBase.PasportFromValues(mtDokumentPASP_UDOST.AsInteger, mtDokumentPASP_SERIA.AsString,
                                        mtDokumentPASP_NOMER.AsString,  mtDokumentPASP_VIDAN.AsString,
                                        mtDokumentLICH_NOMER.AsString,  mtDokumentPASP_Date.AsDateTime);
     end;
   end;
 except

 end;
end;
}
//-----------------------------------------------------------------
function TMens.SostavSemPasportToStr(nType:Integer) : String;
var
  Pasport : TPassport;
  d:TDateTime;
begin
{$IFNDEF ADD_MENS_PU}
  Result:='';
{$ELSE}
 try
   if FdmMen.tbSostavSemPASP_DATE.IsNull
       then d:=0
       else d:=FdmMen.tbSostavSemPASP_Date.AsDateTime;
   Pasport:=dmBase.PasportFromValues(FdmMen.tbSostavSemPASP_UDOST.AsInteger, FdmMen.tbSostavSemPASP_SERIA.AsString,
                                     FdmMen.tbSostavSemPASP_NOMER.AsString,  FdmMen.tbSostavSemPASP_VIDAN.AsString,
                                     FdmMen.tbSostavSemLICH_NOMER.AsString, d);
   Result:=dmBase.PasportToText(Pasport,nType);
 except
   Result:='';
 end;
// if (FdmMen.mtDokumentPASP_SERIA.AsString<>'')
//   then Result := Result+' серия '+FdmMen.mtDokumentPASP_SERIA.AsString;
// if (FdmMen.mtDokumentPASP_NOMER.AsString<>'')
//   then Result := Result+' номер '+FdmMen.mtDokumentPASP_NOMER.AsString;
// if (FdmMen.mtDokumentPASP_VIDAN.AsString<>'')
//   then Result := Result+' выдан '+FdmMen.mtDokumentPASP_VIDAN.AsString;
// if (FdmMen.mtDokumentPASP_DATE.AsString<>'')
//   then Result := Result+' '+DatePropis(FdmMen.mtDokumentPASP_Date.AsDateTime,2);
{$ENDIF}
end;

//-------------------------------------------------------------------
function TMens.PasportToStr(nType:Integer) : String;
var
  Pasport : TPassport;
  d:TDateTime;
begin
{$IFNDEF ADD_MENS_PU}
  Result:='';
{$ELSE}
 try
   with FdmMen do begin
     if FdmMen.mtDokumentPASP_Date.IsNull
       then d:=0
       else d:=FdmMen.mtDokumentPASP_Date.AsDateTime;
     Pasport:=dmBase.PasportFromValues(FdmMen.mtDokumentPASP_UDOST.AsInteger, FdmMen.mtDokumentPASP_SERIA.AsString,
                                      FdmMen.mtDokumentPASP_NOMER.AsString,  FdmMen.mtDokumentPASP_VIDAN.AsString,
                                      FdmMen.mtDokumentLICH_NOMER.AsString, d);
     Result:=dmBase.PasportToText(Pasport,nType);
   end;
 except
   Result:='';
 end;
// if (FdmMen.mtDokumentPASP_SERIA.AsString<>'')
//   then Result := Result+' серия '+FdmMen.mtDokumentPASP_SERIA.AsString;
// if (FdmMen.mtDokumentPASP_NOMER.AsString<>'')
//   then Result := Result+' номер '+FdmMen.mtDokumentPASP_NOMER.AsString;
// if (FdmMen.mtDokumentPASP_VIDAN.AsString<>'')
//   then Result := Result+' выдан '+FdmMen.mtDokumentPASP_VIDAN.AsString;
// if (FdmMen.mtDokumentPASP_DATE.AsString<>'')
//   then Result := Result+' '+DatePropis(FdmMen.mtDokumentPASP_Date.AsDateTime,2);
{$ENDIF}
end;

{$IFNDEF ADD_MENS_PU}

function TMens.LichNomer : String;
begin Result := ''; end;

procedure TMens.Last;
begin end;

function TMens.Lgoti: TDataSet;
begin Result:=nil; end;

function TMens.GetLgoti: String;
begin Result:=''; end;

function TMens.GetLgotiEx(sDelim:String): String;
begin  Result:=''; end;

procedure TMens.Next;
begin end;

procedure TMens.Prior;
begin end;

function TMens.Priznaki: TDataSet;
begin Result:=nil; end;

constructor TMens.Create;
begin
  FScript:=false;
  FAdresMen   := nil;
  FReshOchMen := nil;
end;

function TMens.Read(nID:Integer):Boolean;
begin Result:=false; end;

function TMens.ReadEx(nID:Integer;sPar:String):Boolean;
begin Result:=false; end;

function TMens.Write:Boolean;
begin Result:=false; end;

function TMens.ReadLic(nID:Integer):Boolean;
begin Result:=false; end;

constructor TMens.CreateForScript;
begin end;

destructor TMens.Destroy;
begin
  inherited;
end;

function TMens.Adres: TAdresLic;
begin Result := nil; end;

function TMens.TypeReg: Integer;
begin Result :=0; end;

function TMens.GetVoenkom(nTypeDate: Integer; sDelim: String): String;
begin Result:=''; end;

function TMens.GetFactor(sName: String): Variant;
begin Result:=''; end;

function TMens.GetFactorEx(sName: String; vDef:Variant): Variant;
begin Result:=''; end;

procedure TMens.SetFactor(sName: String; vValue: Variant);
begin end;

procedure TMens.DeleteAllFactor;
begin end;

procedure TMens.DeleteFactor(sName: String);
begin end;

function TMens.FIO: String;
begin Result:=''; end;

function TMens.FIOPadeg(sPadeg:String): String;
begin Result:=''; end;

function TMens.Name: String;
begin Result:=''; end;

function TMens.Familia: String;
begin Result:=''; end;

function TMens.Otch: String;
begin Result:=''; end;

function TMens.Pol: String;
begin Result:='М'; end;

function TMens.DateR: TDateTime;
begin Result:=0; end;

//-------------------------------------------------------
function TMens.DvigToStr(strRazd: String): String;
begin
  Result:='';
end;

//-------------------------------------------------------
function TMens.Ubyl(sType:String; sRazd: String): String;
begin
  Result:='';
end;

function TMens.getDolg: String;
begin
 Result := '';
end;

function TMens.getWork: String;
begin
  Result:='';
end;
function TMens.getWorkEx(sAdd:String): String;
begin
  Result:='';
end;

function TMens.getOtnosh(IsPrintFirst:Boolean): String;
begin
  Result := '';
end;

function TMens.getGrag(IsNullToDef:Boolean; lObozn:Boolean): String;
begin
  Result:='';
end;

function TMens.IsKvartirant: Boolean;
begin
  Result:=false;
end;

function TMens.DataSet: TDataSet;
begin
  Result := nil;
end;
function TMens.DataSetAll: TDataSet;
begin
  Result := nil;
end;



//========================================


{$ELSE}
function TMens.LichNomer : String;
begin
 Result := '';
 if (FdmMen.mtDokumentLICH_NOMER.AsString<>'')
   then Result := ' ном.иден. '+FdmMen.mtDokumentLICH_NOMER.AsString;
end;

procedure TMens.Last;
begin
  FdmMen.mtDokument.Last;
end;

function TMens.Lgoti: TDataSet;
begin
  Result := FdmMen.tbLgot;
end;

function TMens.GetLgoti: String;
begin
  Result:=dmBase.LgotMen(FdmMen.tbLgot, 0, '0', ', ');
end;
function TMens.GetLgotiEx(sDelim:String): String;
begin
  Result:=dmBase.LgotMen(FdmMen.tbLgot, 0, '0', sDelim);
end;

procedure TMens.Next;
begin
  FdmMen.mtDokument.Next;
end;

procedure TMens.Prior;
begin
  FdmMen.mtDokument.Prior;
end;

function TMens.Priznaki: TDataSet;
begin
  Result := FdmMen.tbPriznaki;
end;

constructor TMens.Create;
begin
  FScript:=false;
  FAdresMen := TAdresLic.Create;
  FAdresMen.FMen := Self;
  FReshOchMen := nil;
end;

function TMens.Read(nID:Integer):Boolean;
begin
  Result:=false;
  if FScript then begin
    Result:=FdmMen.ReadDokument(nID, nil);
  end;
end;

function TMens.ReadEx(nID:Integer; sPar:String):Boolean;
var
  slPar:TStringList;
begin
  Result:=false;
  if FScript then begin
    if sPar='' then begin
      slPar:=nil;
    end else begin
      slPar:=TStringList.Create;
      slPar.CommaText:=sPar;
    end;
    Result:=FdmMen.ReadDokument(nID, slPar);
    if slPar<>nil then begin
      FreeAndNil(slPar);
    end;
  end;
end;

function TMens.Write:Boolean;
begin
  Result:=false;
  if FScript then begin
    Result:=FdmMen.WriteDokumentForScript;
  end;
end;

function TMens.ReadLic(nID:Integer):Boolean;
begin
  Result:=false;
  if FScript then begin
    Result:=FdmMen.ReadAllMens(nID,0,nil);
  end;
end;

constructor TMens.CreateForScript;
begin
  FScript:=true;
  FdmMen:=TdmMen.Create(nil);
  FdmMen.EnableRunScript:=false;   // недоступен автоматический вызов скриптов
  FAdresMen := TAdresLic.Create;
  FAdresMen.FMen := Self;
end;

destructor TMens.Destroy;
begin
  if FScript then begin
    FreeAndNil(FdmMen);
  end;
  FAdresMen.Free;
  inherited;
end;

function TMens.Adres: TAdresLic;
begin
  Result := FAdresMen;
end;

function TMens.TypeReg: Integer;
begin Result := FdmMen.TypeReg; end;

function TMens.GetVoenkom(nTypeDate: Integer; sDelim: String): String;
begin Result:=FdmMen.GetVoenkom(nTypeDate,sDelim); end;

function TMens.GetFactor(sName: String): Variant;
begin Result:=FdmMen.GetFactor(sName); end;

function TMens.GetFactorEx(sName: String; vDef:Variant): Variant;
begin Result:=FdmMen.GetFactorEx(sName,vDef); end;

procedure TMens.SetFactor(sName: String; vValue: Variant);
begin FdmMen.SetFactor(sName,vValue); end;

procedure TMens.DeleteAllFactor;
begin FdmMen.DeleteAllFactor; end;

procedure TMens.DeleteFactor(sName: String);
begin FdmMen.DeleteFactor(sName); end;

function TMens.FIOPadeg(sPadeg:String): String;
begin
  Result:=GetPadegFIO3(Familia,Name,Otch,Fld('POL').AsString,sPadeg);
end;
function TMens.FIO: String;
begin
  Result:=FdmMen.mtDokumentFAMILIA.AsString+' '+FdmMen.mtDokumentNAME.AsString+' '+FdmMen.mtDokumentOTCH.AsString;
end;
function TMens.Familia: String;
begin
  Result:=FdmMen.mtDokumentFAMILIA.AsString;
end;
function TMens.Name: String;
begin
  Result:=FdmMen.mtDokumentNAME.AsString;
end;
function TMens.Otch: String;
begin
  Result:=FdmMen.mtDokumentOTCH.AsString;
end;
function TMens.Pol: String;
begin
  Result:=FdmMen.mtDokumentPOL.AsString;
end;
function TMens.DateR: TDateTime;
begin
  Result:=FdmMen.mtDokumentDateR.AsDateTime;
end;

//-------------------------------------------------------
function TMens.DvigToStr(strRazd: String): String;
var
  dPropis:TDateTime;
begin
  if Fld('DATEP').IsNull
    then dPropis:=0
    else dPropis:=Fld('DATEP').AsDateTime;
  Result:=DvigMen(dPropis,Dvig,strRazd);
end;

//-------------------------------------------------------
function TMens.Ubyl(sType:String; sRazd: String): String;
begin
  Result:=VibitMen(Dvig,sType,sRazd);
end;

function TMens.getDolg: String;
begin
  if not Fld('DOLG_SPR').IsNull then begin
    if dmBase.SprDolg.Locate('ID',Fld('DOLG_SPR').AsInteger,[]) then begin
      Result := dmBase.SprDolg.FieldByName('NAME').AsString;
    end;
  end else begin
    Result := Fld('DOLG_NAME').AsString;
  end;
end;

function TMens.getWorkEx(sAdd:String): String;
var
  s:String;
begin
  if not Fld('WORK_SPR').IsNull then begin
    if dmBase.SprWork.Locate('ID',Fld('WORK_SPR').AsInteger,[]) then begin
      Result := dmBase.SprWork.FieldByName('NAME').AsString;
      if Pos('ADRES', ANSIUpperCase(sAdd))>0 then begin
        s:=Trim(dmBase.SprWork.FieldByName('ADRES').AsString);
        if s<>'' then Result:=Result+', '+s;
      end;
    end;
  end else begin
    Result := Fld('WORK_NAME').AsString;
  end;
end;

function TMens.getWork: String;
begin
  Result := getWorkEx('');
end;

function TMens.getOtnosh(IsPrintFirst:Boolean): String;
begin
  if not Fld('OTNOSH').IsNull then begin //and (Fld('FIRST').AsBoolean=false) then begin
    if dmBase.SprOtnosh.Locate('ID',Fld('OTNOSH').AsInteger,[]) then begin
      Result := dmBase.SprOtnosh.FieldByName('NAME').AsString;
    end;
  end else begin
    Result := '';
  end;
end;

function TMens.getGrag(IsNullToDef:Boolean; lObozn:Boolean): String;
var
  n:Integer;
begin
  if Fld('CITIZEN').IsNull then begin
    if IsNullToDef
      then n:=MY_GRAG
      else n:=0;
  end else begin
    n:=Fld('CITIZEN').AsInteger;
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

function TMens.IsKvartirant: Boolean;
begin
  Result:=FdmMen.IsKvartirant;
end;

function TMens.DataSet: TDataSet;
begin
  Result := FdmMen.mtDokument;
end;

function TMens.DataSetAll: TDataSet;
begin
  Result := FdmMen.mtDokumentA;
end;

{$ENDIF}


{ TLicSchet }

{$IFNDEF ADD_MENS_PU}

function TLicSchet.Adres: TAdresLic;
begin
  Result := nil;
end;

constructor TLicSchet.Create;
begin
end;

constructor TLicSchet.CreateForScript;
begin
end;

destructor TLicSchet.Destroy;
begin
  inherited;
end;

//--------------------------------------------------------------
function TLicSchet.Fld(strFieldName: String): TField;
begin
  Result:=nil;
end;

//--------------------------------------------------------------
function TLicSchet.Lgoti: TDataSet;
begin Result := nil; end;

function TLicSchet.Mens: TMens;
begin
  Result := FMen;
end;

function TLicSchet.HouseOwners: TDataSet;
begin
  Result := nil;
end;

function TLicSchet.Priznaki: TDataSet;
begin
  Result := nil;
end;

procedure TLicSchet.SetdmLichSchet(const Value: TObject);
begin
  FdmLichSchet := Value;
end;

function TLicSchet.GetFactor(sName: String): Variant;
begin Result:=''; end;

function TLicSchet.GetFactorEx(sName: String; vDef:Variant): Variant;
begin Result:=''; end;

procedure TLicSchet.SetFactor(sName: String; vValue: Variant);
begin
end;

procedure TLicSchet.DeleteAllFactor;
begin
end;

procedure TLicSchet.DeleteFactor(sName: String);
begin
end;

//----------------------------------------------------------------
function TLicSchet.Predst: String;
begin
  Result:='';
end;

//----------------------------------------------------------------
function TLicSchet.ControlHouse: String;
begin
  Result:=''
end;

//----------------------------------------------------------------
function TLicSchet.UseGilfond: String;
begin
    Result:='';
end;

//----------------------------------------------------------------
function TLicSchet.TypeHouse: String;
begin
    Result:='';
end;
//----------------------------------------------------------------
function TLicSchet.PunktUlica: String;
begin
  Result:='';
end;
//----------------------------------------------------------------
function TLicSchet.Osnov: String;
begin
    Result:='';
end;


function TLicSchet.PrivateSect: Boolean;
begin
 Result:=true
end;

function TLicSchet.GetOwners(sl: TStringList; nType: Integer): String;
begin
  Result := '';
end;

function TLicSchet.OwnersType: Integer;
begin
  Result :=0;
end;

function TLicSchet.ReadFirst:Boolean;
begin
  Result:=false;
end;

function TLicSchet.GetFirst(sField:String):Variant;
begin
  Result:='';
end;

function TLicSchet.Value(strFieldName: String): Variant;
begin
  Result:=null;
end;

function TLicSchet.NanimOrOwners(sPar:String): String;
begin
  Result:='';
end;

{$ELSE}
//>>>>>>>>>>>>>>>>>>>>>>>> LAIS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
function TLicSchet.Adres: TAdresLic;
begin
  Result := FAdresLic;
end;

constructor TLicSchet.Create;
begin
  FScript:=false;
  FMen := TMens.Create;
  FAdresLic := TAdresLic.Create;
  FMen.FLic := Self;
  FAdresLic.FLic := Self;
end;

constructor TLicSchet.CreateForScript;
begin
  FScript:=true;
  FMen := TMens.CreateForScript;
  FdmLichSchet:=TdmLichSchet.Create(nil);
  FAdresLic := TAdresLic.Create;
  FMen.FLic := Self;
  FAdresLic.FLic := Self;
end;

destructor TLicSchet.Destroy;
begin
  if FScript then begin
    FdmLichSchet.Free;
  end;
  FMen.Free;
  FAdresLic.Free;
  inherited;
end;

//--------------------------------------------------------------
function TLicSchet.Fld(strFieldName: String): TField;
var
 sField:String;
begin
  Result:=nil;
  if Copy(strFieldName,1,1)='@' then begin
    sField:=ANSIUpperCase(Copy(strFieldName,2,Length(strFieldName)));
    if (sField='PLOSH_ALL') or (sField='TAIL_HOUSE') then begin   // занимаемая общая площадь
      if Trim(dmLichSchet.mtDokumentTAIL_HOUSE.AsString)=''
        then Result:=dmLichSchet.tbDopProp.FindField('PLOSH_ALL')
        else Result:=dmLichSchet.mtDokumentTAIL_HOUSE;
    end else if (sField='PLOSH_GIL') or (sField='PL_ZANIM') then begin   // занимаемая жилая площадь
      if Trim(dmLichSchet.mtDokumentPL_ZANIM.AsString)=''
        then Result:=dmLichSchet.tbDopProp.FindField('PLOSH_GIL')
        else Result:=dmLichSchet.mtDokumentPL_ZANIM;
    end else if (sField='KOL_KOMN') or (sField='KOM_ZANIM') then begin   // занимаемая количество комнат
      if Trim(dmLichSchet.mtDokumentKOM_ZANIM.AsString)=''
        then Result:=dmLichSchet.tbDopProp.FindField('KOL_KOMN')
        else Result:=dmLichSchet.mtDokumentKOM_ZANIM;
    end;
  end;
  if Result=nil then Result:=dmLichSchet.mtDokument.FindField(strFieldName);
  if Result=nil then Result:=dmLichSchet.tbDopProp.FindField(strFieldName);
end;

function TLicSchet.Value(strFieldName: String): Variant;
var
  fld:TField;
begin
  Result:=null;
  fld := self.Fld(strFieldName);
  if fld<>nil then begin
    Result:=CheckNull(fld);
  end;
end;

//--------------------------------------------------------------
function TLicSchet.Lgoti: TDataSet;
begin Result := nil; end;

function TLicSchet.Mens: TMens;
begin
  Result := FMen;
end;

function TLicSchet.HouseOwners: TDataSet;
begin
  Result := FdmLichSchet.tbHouseOwners;
end;

function TLicSchet.Priznaki: TDataSet;
begin
  Result := FdmLichSchet.tbPriznaki;
end;

procedure TLicSchet.SetdmLichSchet(const Value: TdmLichSchet);
begin
  FdmLichSchet   := Value;
  FMen.FLic      := Self;
  FMen.FdmMen    := Value.dmMens;
  FAdresLic.FLic := Self;
end;

function TLicSchet.GetFactor(sName: String): Variant;
begin Result:=FdmLichSchet.GetFactor(sName); end;

function TLicSchet.GetFactorEx(sName: String; vDef:Variant): Variant;
begin Result:=FdmLichSchet.GetFactorEx(sName,vDef); end;

procedure TLicSchet.SetFactor(sName: String; vValue: Variant);
begin FdmLichSchet.SetFactor(sName,vValue); end;

procedure TLicSchet.DeleteAllFactor;
begin FdmLichSchet.DeleteAllFactor; end;

procedure TLicSchet.DeleteFactor(sName: String);
begin FdmLichSchet.DeleteFactor(sName); end;

//----------------------------------------------------------------
function TLicSchet.Predst: String;
begin
  if Fld('PREDST').AsString='' then begin
    Result:='';
  end else begin
    Result:=dmBase.SeekValueTable2(dmBAse.SprPredst,'ID',Fld('PREDST').AsString,'NAME');
  end;
end;

//----------------------------------------------------------------
function TLicSchet.ControlHouse: String;
var
  Opis:TOpisEdit;
begin
  if Fld('CONTROL').AsString='' then begin
    Result:='';
  end else begin
    Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_CONTROL_HOUSE');
    Result := Opis.Naim(Fld('CONTROL').AsString, false);
  end;
end;

//----------------------------------------------------------------
function TLicSchet.UseGilfond: String;
var
  Opis:TOpisEdit;
begin
  if Fld('USE_GILFOND').AsString='' then begin
    Result:='';
  end else begin
    Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_USE_GILFOND');
    Result := Opis.Naim(Fld('USE_GILFOND').AsString, false);
  end;
end;
//----------------------------------------------------------------
function TLicSchet.PunktUlica: String;
begin
  Result:=Fld('PUNKT_NAME').AsString + IIFS(Fld('UL_NAME').AsString='', '', ', '+Fld('UL_NAME').AsString);
end;
//----------------------------------------------------------------
function TLicSchet.TypeHouse: String;
//var
//  Opis:TOpisEdit;
begin
  if Fld('TYPEHOUSE').AsString='' then begin
    Result:='';
  end else begin
    Result:=dmBase.SeekValueTable2(dmBase.SprTypeHouse,'ID',Fld('TYPEHOUSE').AsString,'NAME');
  end;
end;
//----------------------------------------------------------------
function TLicSchet.Osnov: String;
var
  s:String;
  Opis:TOpisEdit;
begin
  s:=Fld('DOGOVOR').AsString;
  if Fld('OSNOV_ID').AsInteger=0 then begin
    Result:=s;
  end else begin
    Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_OSNOV_ZASEL');
    Result:=Opis.Naim(Fld('OSNOV_ID').AsString, false);
    if not Fld('OSNOV_DATE').IsNull
      then Result:=Result+' от '+DatePropis(Fld('OSNOV_DATE').AsDateTime,3);
    Result:=Result+', '+s;
  end;
  if Fld('OSNOV_NOMER').AsString<>'' then begin
    Result:=Result+' № '+Fld('OSNOV_NOMER').AsString;
  end;
end;


function TLicSchet.PrivateSect: Boolean;
begin
  if Fld('CONTROL').AsInteger=CONTROL_PRIVATE
    then Result:=true
    else Result:=false;
end;

function TLicSchet.GetOwners(sl: TStringList; nType: Integer): String;
begin
  Result := FdmLichSchet.HouseOwners(sl, nType);
end;

function TLicSchet.NanimOrOwners(sPar:String): String;
begin
  Result := FdmLichSchet.NanimOrOwners(sPar);
end;

function TLicSchet.OwnersType: Integer;
begin
  Result := StrToInt(FdmLichSchet.HouseOwners(nil, 2));
end;

function TLicSchet.ReadFirst:Boolean;
var
  st:TSostTable;
begin
  RFirst.FAMILIA:='';
  RFirst.NAME:='';
  RFirst.OTCH:='';
  RFirst.DATER:=0;
  RFirst.DATEP:=0;
  RFirst.DATEV:=0;
  RFirst.DATE_SROK:=0;
  RFirst.DATES:=0;
  RFirst.PRESENT:=false;
  RFirst.PROPIS:=false;
  RFirst.CANDELETE:=false;
  Result:=false;
  if (FMen<>nil) and (FMen.FdmMen<>nil) then begin
    st:=SaveSostDataSet(FMen.FdmMen.mtDokument, true);
    if FMen.FdmMen.mtDokument.Locate('ID_INTERNAL', FdmLichSchet.mtDokumentFIRST.AsInteger, []) then begin
      RFirst.FAMILIA:=FMen.FdmMen.mtDokumentFAMILIA.AsString;
      RFirst.NAME:=FMen.FdmMen.mtDokumentNAME.AsString;
      RFirst.OTCH:=FMen.FdmMen.mtDokumentOTCH.AsString;
      RFirst.DATER:=FMen.FdmMen.mtDokumentDATER.AsDateTime;
      RFirst.DATEP:=FMen.FdmMen.mtDokumentDATEP.AsDateTime;
      RFirst.DATEV:=FMen.FdmMen.mtDokumentDATEV.AsDateTime;
      RFirst.DATE_SROK:=FMen.FdmMen.mtDokumentDATE_SROK.AsDateTime;
      RFirst.DATES:=FMen.FdmMen.mtDokumentDATES.AsDateTime;
      RFirst.PRESENT:=FMen.FdmMen.mtDokumentPRESENT.AsBoolean;
      RFirst.PROPIS:=FMen.FdmMen.mtDokumentPROPIS.AsBoolean;
      RFirst.CANDELETE:=FMen.FdmMen.mtDokumentCANDELETE.AsBoolean;
      Result:=true;
    end;
    RestSostDataSet(FMen.FdmMen.mtDokument, st);
  end;
end;

function TLicSchet.GetFirst(sField:String):Variant;
begin
  sField:=UpperCase(sField);
  if sField='FIO' then begin
    Result:=RFirst.FAMILIA+' '+RFirst.NAME+' '+RFirst.OTCH;
  end else if sField='FAMILIA' then begin
    Result:=RFirst.FAMILIA;
  end else if sField='NAME' then begin
    Result:=RFirst.NAME;
  end else if sField='OTCH' then begin
    Result:=RFirst.OTCH;
  end else if sField='DATER' then begin
    Result:=RFirst.DATER;
  end else if sField='DATES' then begin
    Result:=RFirst.DATES;
  end else if sField='DATEP' then begin
    Result:=RFirst.DATEP;
  end else if sField='DATEV' then begin
    Result:=RFirst.DATEV;
  end else if sField='DATE_SROK' then begin
    Result:=RFirst.DATE_SROK;
  end else if sField='PRESENT' then begin
    Result:=RFirst.PRESENT;
  end else if sField='PROPIS' then begin
    Result:=RFirst.PROPIS;
  end else if sField='CANDELETE' then begin
    Result:=RFirst.CANDELETE;
  end else begin
    Result:=sField;
  end;
end;

{$ENDIF}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

{ TDokZAGS }

function TDokZAGS.GetTable(strName: String): TDataSet;
var
  i : Integer;
  s : String;
begin
  Result := nil;
  if FForm<>nil then begin
    s := ANSIUpperCase(strName);
    for i:=0 to FForm.ComponentCount-1 do begin
      if FForm.Components[i] is TkbmMemTable then begin
        if ANSIUpperCase(TkbmMemTable(FForm.Components[i]).Name)=s then begin
          Result := TDataSet(FForm.Components[i]);
          exit;
        end;
      end;
    end;
  end;
end;

function TDokZAGS.Deti: TDataSet;
begin
  Result := GetTable('tbDeti');
end;

function TDokZAGS.SvidPovtor: TDataSet;
begin
  Result := GetTable('SvidPovtor');
end;
//-------------------------------------------------------
function TDokZAGS.FIO(sPar:String):String;
begin
  if FForm<>nil then begin
    Result:=CreateFIO(FForm.Dokument, sPar);
  end else begin
    Result:='';
  end;
end;
//-------------------------------------------------------
function TDokZAGS.FIO2(sPar:String;sPol:String;sPadeg:String):String;
begin
  if FForm<>nil then begin
    Result:=CreateFIO(FForm.Dokument, sPar+'#'+sPol+sPadeg);
  end else begin
    Result:='';
  end;
end;
//-------------------------------------------------------
function TDokZAGS.Fld(strFieldName: String): TField;
begin
  if FForm<>nil then begin
    Result := FForm.Dokument.FindField(strFieldName);
  end else begin
    Result := nil;
  end;
end;

function TDokZAGS.Value(strFieldName: String): Variant;
var
  fld:TField;
begin
//{$IFDEF ZAGS}
//  Result:=null;
//{$ELSE}
  Result:=null;
  fld := self.Fld(strFieldName);
  if fld<>nil then begin
    Result:=CheckNull(fld);
  end;
//{$ENDIF}
end;

//-------------------------------------------------------
function TDokZAGS.GetTypeDok: String;
begin
  Result:='';
  if FForm<>nil then begin
    Result := FForm.Name;
  end;
end;

//-------------------------------------------------------
function TDokZAGS.IsNUll: Boolean;
begin
  if FForm=nil
    then Result:=true
    else Result:=false;
end;

procedure TDokZAGS.SetCurDokZAGS(f: TfmSimpleD);
begin
  FForm := f;
  FTypePrintSvidRast:=3;
//  FLastError := '';
  if f<>nil then begin
    FForm.FLastError:='';
  end;
end;

function TDokZAGS.GetHistValue(strFieldName: String; nType: Integer) : Variant;
begin
  Result := FForm.GetHistValueField(strFieldName,nType);
end;

function TDokZAGS.GetAdres(strParam: String; nType: Integer): String;
begin
  Result := dmBase.GetAdresAkt(FForm.Name+'.Dokument',strParam,nType);
end;

function TDokZAGS.GetAdres2(strParam: String; nType: Integer): String;
begin
  Result := dmBase.GetAdresAkt2(FForm.Name+'.Dokument',strParam,nType);
end;

function TDokZAGS.GetPasport(strParam: String; nType: Integer): String;
var
  p : TPassport;
begin
  p:=dmBase.GetPasportAkt(FForm.Name+'.Dokument',strParam,0);
  Result:=dmBase.PasportToText(p,nType);
end;

function TDokZAGS.GetPassport(strParam: String; nType: Integer): String;
begin
  Result:=GetPasport(strParam,nType);
end;

function TDokZAGS.NameZAGS(strType, strPadeg : String): String;
begin
  Result := fmMain.SprNameOrg(FForm.Dokument.FieldByName('ID_ZAGS').AsInteger,
            strType, strPadeg );
end;

function TDokZAGS.NameZAGS2(strType, strPadeg : String): String;
begin
  Result := fmMain.SprNameOrg2(FForm.Dokument.FieldByName('ID_ZAGS').AsInteger,
            strType, strPadeg );
end;

function TDokZags.CheckSvid : Boolean;
begin
  Result := ProvSvid(SVID_VIDANO, false);
end;

function TDokZags.IsporSvid : Boolean;
begin
  Result := ProvSvid(SVID_ISPOR, true);
end;
//---------------------------------------------------------------------------------
function TDokZags.ProvSvid(nType : Integer; lShowQuery : Boolean) : Boolean;
var
  TypeSvid,i,nAktNomer  : Integer;
  dDateSvid,dDateSvid2,d,dAktDate : TDateTime;
  strSeria,strNomer : String;
  strSeria2,strNomer2, strAdd : String;
  strFieldSeria,strFieldDate,strFieldNomer, strErr,s1,s2 : String;
  vKeyValues : Variant;
  lPovtor, lTwoNotPovtor, lOk : Boolean;
  fldNomer, fld1, fld2 : TField;
  {$IFDEF GISUN}
    lPovtorSvid : Boolean;
    nPoleGRN:Integer;
  {$ENDIF}
begin
  FForm.FLastError := '';
  Result := true;
  if GlobalTask.ParamAsBoolean('CHECK_SVID') then begin
    strErr := '';
    dDateSvid := 0;
    strSeria  := '';
    strNomer  := '';
    dDateSvid2:= 0;
    strSeria2 := '';
    strNomer2 := '';
    strFieldSeria := 'SVID_SERIA';
    strFieldNomer := 'SVID_NOMER';
    strFieldDate  := 'DATESV';
    TypeSvid := FForm.TypeObj;
    lPovtor := false;
    strAdd:= '';
    lTwoNotPovtor := false;  // расторжение брака не повторное
    if (FForm.Dokument.FieldByName('NOMER').AsString='') or
       FForm.Dokument.FieldByName('DATEZ').IsNull then begin
      Result := false;
      FForm.FLastError := 'Введите номер и дату актовой записи';
      EXIT;
    end;

    nAktNomer := FForm.Dokument.FieldByName('NOMER').AsInteger;
    dAktDate  := FForm.Dokument.FieldByName('DATEZ').AsDateTime;
    fld1:=nil;
    fld2:=nil;
    {$IFDEF ZAGS}
      SvidPovtor.CheckBrowseMode;

      // не проводим первичное не выписанное в своём загсе
      if not FForm.DokumentPOVTOR.AsBoolean and
         (FForm.Dokument.FieldByName('ID_ZAGS').AsString<>'') and
         (FForm.Dokument.FieldByName('ID_ZAGS').AsString<>GlobalTask.ParamAsString('ID')) then begin
        EXIT;
      end;

      if (TypeSvid=dmBase.TypeObj_ZRast) and not FForm.DokumentPOVTOR.AsBoolean then begin
        if FTypePrintSvidRast=1 then begin   // свид-во выдается мужчине
          lTwoNotPovtor := false;
          strSeria  := Trim(FForm.Dokument.FieldByName('ON_SVID_SERIA').AsString);
          strNomer  := Trim(FForm.Dokument.FieldByName('ON_SVID_NOMER').AsString);
          fldNomer  := FForm.Dokument.FieldByName('ON_SVID_NOMER');
          if not FForm.Dokument.FieldByName('ON_SVID_DATE').IsNull
            then dDateSvid := FForm.Dokument.FieldByName('ON_SVID_DATE').AsDateTime;
        end else if FTypePrintSvidRast=2 then begin    // свид-во выдается женщине
          lTwoNotPovtor := false;
          strSeria  := Trim(FForm.Dokument.FieldByName('ONA_SVID_SERIA').AsString);
          strNomer  := Trim(FForm.Dokument.FieldByName('ONA_SVID_NOMER').AsString);
          fldNomer  := FForm.Dokument.FieldByName('ONA_SVID_NOMER');
          if not FForm.Dokument.FieldByName('ONA_SVID_DATE').IsNull
            then dDateSvid := FForm.Dokument.FieldByName('ONA_SVID_DATE').AsDateTime;
        end else if FTypePrintSvidRast=3 then begin      // свид-во выдается обоим
          lTwoNotPovtor := true;
          strSeria  := Trim(FForm.Dokument.FieldByName('ON_SVID_SERIA').AsString);
          strNomer  := Trim(FForm.Dokument.FieldByName('ON_SVID_NOMER').AsString);
          fld1 := FForm.Dokument.FieldByName('ON_SVID_NOMER');
          if not FForm.Dokument.FieldByName('ON_SVID_DATE').IsNull then begin
            dDateSvid := FForm.Dokument.FieldByName('ON_SVID_DATE').AsDateTime;
          end;
          strSeria2 := Trim(FForm.Dokument.FieldByName('ONA_SVID_SERIA').AsString);
          strNomer2 := Trim(FForm.Dokument.FieldByName('ONA_SVID_NOMER').AsString);
          fld2 := FForm.Dokument.FieldByName('ONA_SVID_NOMER');
          fldNomer := nil;
          if not FForm.Dokument.FieldByName('ONA_SVID_DATE').IsNull then begin
            dDateSvid2 := FForm.Dokument.FieldByName('ONA_SVID_DATE').AsDateTime;
          end;
        end;
      end else begin
        if FForm.DokumentPOVTOR.AsBoolean then begin
          lPovtor := true;
          strAdd := ' повторного';
          if FForm.FOnlySvid then begin  // открат ввод на форме только загладки свидетельства
            strSeria  := Trim(FForm.Dokument.FieldByName(strFieldSeria).AsString);
            strNomer  := Trim(FForm.Dokument.FieldByName(strFieldNomer).AsString);
            fldNomer  := FForm.Dokument.FieldByName(strFieldNomer);
            if not FForm.Dokument.FieldByName(strFieldDate).IsNull then begin
              dDateSvid := FForm.Dokument.FieldByName(strFieldDate).AsDateTime;
            end;
          end else begin
            FForm.SvidPovtor.Last;
            if FForm.SvidPovtor.RecordCount>0 then begin
              if not FForm.SvidPovtorSVID_DATE.IsNull then begin
                dDateSvid := FForm.SvidPovtorSVID_DATE.AsDateTime;
              end;
              strSeria := Trim(FForm.SvidPovtorSVID_SERIA.AsString);
              strNomer := Trim(FForm.SvidPovtorSVID_NOMER.AsString);
              fldNomer := FForm.SvidPovtorSVID_NOMER;
              lPovtor := not FForm.SvidPovtorFIRST.AsBoolean;
              if not lPovtor then strAdd := '';
            end else begin
              fldNomer := nil;
            end;
          end;
        end else begin
          strSeria  := Trim(FForm.Dokument.FieldByName(strFieldSeria).AsString);
          strNomer  := Trim(FForm.Dokument.FieldByName(strFieldNomer).AsString);
          fldNomer  := FForm.Dokument.FieldByName(strFieldNomer);
          if not FForm.Dokument.FieldByName(strFieldDate).IsNull then begin
            dDateSvid := FForm.Dokument.FieldByName(strFieldDate).AsDateTime;
          end;
        end;
      end;
    {$ELSE}
      strSeria  := Trim(FForm.Dokument.FieldByName(strFieldSeria).AsString);
      strNomer  := Trim(FForm.Dokument.FieldByName(strFieldNomer).AsString);
      fldNomer  := FForm.Dokument.FieldByName(strFieldNomer);
      if not FForm.Dokument.FieldByName(strFieldDate).IsNull then begin
        dDateSvid := FForm.Dokument.FieldByName(strFieldDate).AsDateTime;
      end;
    {$ENDIF}
    //--------- для установления отцовства может быть два свидетельства ----------------
    if not lTwoNotPovtor and (FForm.TypeObj=dmBase.TypeObj_ZUstOtc) and not FForm.DokumentPOVTOR.AsBoolean then begin
      if FForm.Dokument.FieldByName('TWO_SVID').AsBoolean then begin
        lTwoNotPovtor := true;
        fld1 := FForm.Dokument.FieldByName('SVID_NOMER');
        strSeria2 := Trim(FForm.Dokument.FieldByName('SVID_SERIA2').AsString);
        strNomer2 := Trim(FForm.Dokument.FieldByName('SVID_NOMER2').AsString);
        fld2 := FForm.Dokument.FieldByName('SVID_NOMER2');
        fldNomer := nil;
        if not FForm.Dokument.FieldByName('DATESV2').IsNull then begin
          dDateSvid2 := FForm.Dokument.FieldByName('DATESV2').AsDateTime;
        end;
      end;
    end;
    //----------------------------------------------------------------------------------
    if lTwoNotPovtor then begin
      for i:=1 to 2 do begin
        if i=1 then begin
          d  := dDateSvid;
          s1 := strSeria;
          s2 := strNomer;
          fldNomer := fld1;
        end else begin
          d  := dDateSvid2;
          s1 := strSeria2;
          s2 := strNomer2;
          fldNomer := fld2;
        end;
        if (s1<>'') and (s2<>'') and (d>0) then begin
          lOk := true;
          if lShowQuery then begin
            lOk := Problem('Свидетельство: '+s1+' '+s2+' от '+FormatDateTime('dd.mm.yyyy',d)+'г. провести как испорченное ?');
          end;
          if lOk then begin
          vKeyValues := VarArrayCreate( [0, 2], varOleStr );
          vKeyValues[0] := TypeSvid;
          vKeyValues[1] := s1;
          vKeyValues[2] := s2;
          if dmBase.ListSvid.Locate('SVID_TYPE;SVID_SERIA;SVID_NOMER', vKeyValues,[]) then begin
            {
            // если со свидетельством были манипуляции
            if (FieldByName('SOST').AsString<>'') and (FieldByName('SOST').AsInteger>0) then begin
              // если со свидетельство уже выдавалось

              if (dmBase.ListSvid.FieldByName('AKT_NOMER').AsString<>'') and not dmBase.ListSvid.FieldByName('AKT_DATE').IsNull then begin
                if (dmBase.ListSvid.FieldByName('AKT_NOMER').AsInteger<>nAktNomer) or
                   (dmBase.ListSvid.FieldByName('AKT_DATE').AsDateTime<>nAktDate)
                  if Problem('Свидетельство уже выдавалось с актовой записью '+
                      dmBase.ListSvid.FieldByName('AKT_NOMER').AsString) then begin

                  end;
                end;
              end;
            end;
            }
            with dmBase.ListSvid do begin
              // свидетельство поступило позже даты его выдачи
              if FieldByName('DATEP').AsDateTime > d then begin
                strErr := strErr + 'В базе свидетельств свидетельство '+s2+' поступило позже даты его выдачи'+#13#10;
              end else begin
                try
                  Edit;
                  if nType = SVID_VIDANO then begin  // выдано
                    if lPovtor then begin
                      FieldByName('SOST').AsInteger := SVID_VIDANO_P;
                    end else begin
                      FieldByName('SOST').AsInteger := SVID_VIDANO;
                    end;
                    FieldByName('DATER').AsDateTime    := d;
                    FieldByName('AKT_NOMER').AsInteger := nAktNomer;
                    FieldByName('AKT_DATE').AsDateTime := dAktDate;
                    FieldByName('AKT_ID').AsString := '';
                    FieldByName('ID_ZAGS').AsString := FForm.Dokument.FieldByName('ID_ZAGS').AsString;
                  end else if nType = SVID_ISPOR then begin   // испорчено
                    FieldByName('SOST').AsInteger := SVID_ISPOR;
                    FieldByName('DATER').AsDateTime := dDateSvid;
                    FieldByName('AKT_NOMER').AsString := '';
                    FieldByName('AKT_DATE').AsString  := '';
                    FieldByName('AKT_ID').AsString := '';
                    FieldByName('ID_ZAGS').AsString := FForm.Dokument.FieldByName('ID_ZAGS').AsString;
                    EditDataSet(fldNomer.DataSet);
                    fldNomer.AsString := '';
                    fldNomer.DataSet.Post;
                  end;
                  Post;
                except
                  on E:Exception do begin
                    Cancel;
                    PutError('Ошибка доступа к базе свидетельств !'+Chr(13)+E.Message);
                  end;
                end;
              end;
            end;
          end else begin
            strErr := strErr+'В базе свидетельств не найдено значение ' + s1 + ' № ' + s2+#13#10;
          end;
          end;
        end;
      end;
    end else begin
      if strNomer='' then begin
        strErr := 'Не заполнен номер'+strAdd+' свидетельства';
      end else if strSeria='' then begin
        strErr := 'Не заполнена серия'+strAdd+' свидетельства';
      end else if dDateSvid=0 then begin
        strErr := 'Не заполнена дата свидетельства';
      end;
      if (strErr='') and (dDateSvid>0) then begin
        lOk := true;
        if lShowQuery then begin
          lOk := Problem('Свидетельство: '+strSeria+' '+strNomer+' от '+FormatDateTime('dd.mm.yyyy',dDateSvid)+'г. провести как испорченное ?');
        end;
        if lOk then begin
          vKeyValues := VarArrayCreate( [0, 2], varOleStr );
          vKeyValues[0] := TypeSvid;
          vKeyValues[1] := strSeria;
          vKeyValues[2] := strNomer;
          if dmBase.ListSvid.Locate('SVID_TYPE;SVID_SERIA;SVID_NOMER', vKeyValues,[]) then begin
            with dmBase.ListSvid do begin
              // свидетельство поступило позже даты его выдачи
              if FieldByName('DATEP').AsDateTime > dDateSvid then begin
                strErr := 'В базе свидетельств текущее свидетельство поступило позже даты его выдачи';
              end else begin
                try
                  Edit;
                  if nType = SVID_VIDANO then begin  // выдано
                    if lPovtor then begin
                      FieldByName('SOST').AsInteger := SVID_VIDANO_P;
                    end else begin
                      FieldByName('SOST').AsInteger := SVID_VIDANO;
                    end;
                    FieldByName('DATER').AsDateTime    := dDateSvid;
                    FieldByName('AKT_NOMER').AsInteger := nAktNomer;
                    FieldByName('AKT_DATE').AsDateTime := dAktDate;
                  end else if nType = SVID_ISPOR then begin   // испорчено
                    FieldByName('SOST').AsInteger := SVID_ISPOR;
                    FieldByName('DATER').AsDateTime := dDateSvid;
                    FieldByName('AKT_NOMER').AsString := '';
                    FieldByName('AKT_DATE').AsString  := '';
                    EditDataSet(fldNomer.DataSet);
                    fldNomer.AsString := '';
                    fldNomer.DataSet.Post;
                  end;
                  Post;
                except
                  PutError('Ошибка доступа к базе свидетельств !');
                end;
              end;
            end;
          end else begin
            strErr := 'В базе свидетельств не найдено значение ' + strSeria + ' № ' + strNomer;
          end;
        end;
      end;
    end;
    if strErr<>'' then begin
      Result := false;
//      PutError(strErr);
      FForm.FLastError := strErr;
    end;
  end else begin
//    GlobalTask.LogFile.WriteToLogFile('печать свидельства '++'без проведения.');
  end;
  if Result then begin
    {$IFDEF GISUN}
       // если выдано не повторное свидетельство
       if (nType=SVID_VIDANO) and FForm.IsSvidToGISUN(false) then begin
         if IsActiveGISUN and Gisun.IsEnabled and Gisun.IsEnableTypeAkt(FForm.TypeObj,FForm.IsAktVosstan) then begin
           nPoleGRN:=Gisun.GetPoleGrn(FForm.Dokument);
           if nPoleGRN=rPost
             then lPovtor:=true  // повторная регистрация (для исправления ошибки)
             else lPovtor:=false;
           lPovtorSvid:=FForm.FOnlySvid or FForm.DokumentPOVTOR.AsBoolean;
           if (FForm.TypeObj=_TypeObj_ZRogd)
             then lOk:=FForm.IsChildGivorogd  // ребенок живорожденный
             else lOk:=true;
           if lOk then begin
             {$IFDEF ZAGS}
               // для ЗАГС не отправляем в регистр сразу свидетельство для браков и расторжения брака
               if ((FForm.TypeObj=_TypeObj_ZBrak) or (FForm.TypeObj=_TypeObj_ZRast)) and not lPovtor and not lPovtorSvid then begin

               end else begin
                 fmRegGISUN:=TfmRegGISUN.Create(nil);
                 fmRegGISUN.Povtor:=lPovtor;
                 fmRegGISUN.PovtorSvid:=lPovtorSvid;
                 fmRegGISUN.Show;
               end;
             {$ELSE}
               // для ЛАИС любое свидетельство сразу отправляем в ГИС РН
               fmRegGISUN:=TfmRegGISUN.Create(nil);
               fmRegGISUN.Povtor:=lPovtor;
               fmRegGISUN.PovtorSvid:=lPovtorSvid;
               fmRegGISUN.Show;
             {$ENDIF}
           end;
//           SetTagReports(Integer(FForm));
         end;
       end;
    {$ENDIF}
  end;
end;

function TDokZAGS.GetLastError: String;
begin
  Result := FForm.FLastError;
end;

function TDokZAGS.getTypePrintSvidRast: Integer;
begin
  Result := FTypePrintSvidRast;
end;

procedure TDokZAGS.setTypePrintSvidRast(n: Integer);
begin
  FTypePrintSvidRast:=n;
end;

function TDokZAGS.ActiveON: Boolean;
begin
  Result := FForm.FActiveControlON;
end;

function TDokZAGS.VozrastPropisON(nType:Integer): String;
begin
  if nType=0
    then Result := FForm.FVozrastPropisON
    else Result := FForm.Fdo18ON;
end;

function TDokZAGS.VozrastPropisONA(nType:Integer): String;
begin
  if nType=0
    then Result := FForm.FVozrastPropisONA
    else Result := FForm.Fdo18ONA;
end;

function TDokZAGS.PrintSpecSvid: Boolean;
begin
  Result:=FForm.FPrintSpecSvid;
end;

function TDokZAGS.PrintSpecSprav: Integer;
begin
  Result:=FForm.FPrintSpecSprav;
end;

procedure TDokZAGS.EditDokument;
begin
  FForm.EditDokument;
end;

procedure TDokZAGS.PostDokument;
begin
  FForm.PostDokument;
end;

function TDokZAGS.FPlus(strFields: String; strRazd:String): String;
var
  arr:TArrStrings;
  i:Integer;
  f:TField;
begin
  if strFields='' then begin
    Result:=Fld('FAMILIA').AsString+strRazd+Fld('NAME').AsString+strRazd+Fld('OTCH').AsString;
  end else begin
    Result:='';
    StrToArr(strFields,arr,';',true);
    for i:=Low(arr) to High(arr) do begin
      f:=Fld(arr[i]);
      if f<>nil then begin
        if Result=''
          then Result:=f.AsString
          else Result:=Result+strRazd+f.AsString;
      end;
    end;
    Result:=Trim(Result);
  end;
end;

function TDokZAGS.GetFormDok: TfmSimpleD;
begin
  Result:=FForm;
end;

function TDokZAGS.EmptyIzm: String;
begin
  Result:=FForm.EmptyIzm;
end;

function TDokZAGS.GetIzm(sField:String): String;
var
  f:TField;
begin
  if sField='' then sField:='IZMEN';
  f:=Fld(sField);
  if f<>nil then begin
    if f.AsString=''
      then Result:=EmptyIzm
      else Result:=f.AsString;
  end else begin
    Result:=EmptyIzm;
  end;
end;

function TDokZAGS.TypeObj: Integer;
begin
  Result:=FForm.TypeObj;
end;

function TDokZAGS.OnlySvid: Boolean;
begin
  Result:=FForm.FOnlySvid;
end;

function TDokZAGS.getGrag(strFieldName, strRazd: String): String;
begin
  Result:=FForm.getGrag(strFieldName, strRazd);
end;

// в зависимости от значения поля sFldIN+'_GIS' возвращать или ИН
function TDokZAGS.CondIN(sFldIN:String):String;
begin
  Result:=FForm.CondIN(sFldIN);
end;

procedure TDokZAGS.SetLastError(strErr: String);
begin
  if FForm<>nil then begin
    FForm.FLastError:=strErr;
  end;
end;

procedure TDokZAGS.AddProtokol(s: String);
begin
  if FForm<>nil then begin
    FForm.FProtokol.Add(s);
  end;
end;

procedure TDokZAGS.ClearProtokol;
begin
  if FForm<>nil then begin
    FForm.FProtokol.Clear;
  end;
end;

initialization
  LicSchet := TLicSchet.Create;;
  Men := TMens.Create;
  Adres := TAdresLic.CreateWithMens;
  DokZAGS := TDokZAGS.Create;
  CurDok:=DokZAGS;
finalization

  LicSchet.Free;
  Men.Free;
  Adres.Free;
  CurDok:=nil;
  FreeAndNil(DokZAGS);
end.



