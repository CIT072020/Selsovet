unit uProjectAll;

interface

{$I Task.inc}

uses
  Windows, Db, Messages, SysUtils, StdCtrls, Classes, Graphics, ComCtrls, Controls, Forms, Dialogs, DsiWin32, ActnList, uTypes,
  mMD5, RKP, NativeXML,
  FuncPr, dbFunc, ifpii_dbfunc, fLogon, kbmMemTable, ToolCtrlsEh,
  ActiveX, ShlObj,  ace, ShellAPI,
  {uAvest,} NewDialogs, uPadegFIO, QStrings, SasaIniFile, MetaTask;

type

  TAdres = record
    AdresPropis : String;
    PunktKod : Integer;  // код нас пункта
    PunktTK  : Integer;  // код типа нас пункта
    PunktTN  : String;   // наименование типа нас пункта
    PunktN   : String;   // наименование нас пункта без типа
    Punkt    : String;   // наименование нас пункта вместе стипом
    PunktUlica: String;
    Ulica    : String;
    UlicaInt : Integer;  // код улицы
    UlicaType: Integer;  // код типа улицы
    NotDom   : Boolean;
    Dom      : String;   // номер дома + корпус + квартира или наименивание строения
    Dom2     : String;   // номер дома + корпус + квартира, если без номера дома, то не включаем имя строения
    NDom     : String;   // толко номер дома
    Korp     : String;
    Kv       : String;
    NKv      : String;
    UchNomer : String;
    UlicaDom : String;
    AdresID  : Integer;
    LicID    : Integer;
    Obl : String;
    Raion : String;
    Strana : String;
    Propis : Boolean;
    SpecUch : Boolean;
    NameHouse:String;
    RnGor:Integer;           // район города для Бреста
    RnGorName:String;
    PrivateSect:Boolean;   // частный сектор
    IsGorod : Boolean;
    Gorod : String;
    Selo  : String;
    Etag  : String;
    Kol_Etag : String;
    Predst : String;
    Control: String;
    UseGilfond: String;
    OnlyText:Boolean;
  end;

  TPropFTP=record
    Ok:Boolean;
    Port:Integer;
    Host:String;
    Username:String;
    Password:String;
    Dir:String;
    Passive:Boolean;
  end;

  function getWidthEhBt(lFlat:Boolean):Integer;

  function getTailUrlReg:String;
  function getTailUrlQuery:String; //   '/gisun/common/ws'

  function ValueFromParams(slPar:TStringList;sParam,sDefault: String): String;
  function ObjectFromParams(slPar:TStringList;sParam:String): TObject;

  function Def_SprDocSubj:String;

  function EmptyDate:TDateTime;
  function CalcMD5File(sFile:String):String;
  function CalcMD5String(s:String):String;

//  function PensVozrG:Integer;   // пенсионыый возраст женщин
//  function PensVozrM:Integer;   // пенсионный возраст мужчин
//  function TrudVozr:Integer;

  function SysQuery(sText: String): String;

  {$IFDEF UPDATEPROG}

  {$ELSE}
    function  Locate_AllSprGISUN(nTypeSpr:Integer; sCode: String): TRecSprGISUN;
    function getURLCOC:String;

    {$IFDEF ADD_ZAH}
    function  BookKlad_SetDataSet(nKlad:Integer; dsBook:TDataSet):TDataSet;  // обязательно вызывать ClearDataSetBookKlad
    procedure BookKlad_ClearDataSet;
    function  BookKlad_Date(nKlad,nBook:Integer):TDateTime;
    function LoadZah_SetDataSet:TDataSet;  // обязательно вызывать ClearDataSet
    procedure SimpleProp_ClearDataSet;
    function CreateTableBooks:TDataSet;
    procedure ReadListAllBooks(mtBooks:TDataSet; nKLad:Integer);
    function GetNumberBook(mtBooks:TDataSet; var Info:TOneRecZah; var sSoob:String):Integer;
    {$ENDIF}
  {$ENDIF}

  function GetFolderSize(sPath:String):Int64;
  function GetHeight(m:Integer):Integer;
  function CheckSpace(s:String):String;
  procedure WriteToDebug(arr:array of Variant);
  function RunFuncScript(strFuncName: String; ArrPar : array of Variant;var vResult : Variant; var lRun:Boolean): Boolean;

  function GetLocaleInformation(Flag: Integer): string;

  procedure Date2Field(fld:TField; v:Variant);

  function CheckNamePunkt(strValue:String) : String;
  function CheckNamePunktB(strValue:String) : String;
  function CreateNDelo(sDelo:String):Integer;

  function getFieldXML(strField:String; var strValue:String):String;
  function getFieldFromSL(sValue:String; sField:String; sType:String):Variant;
  function addToXMLField(fld:TField; sField:String; vValue:Variant; sType:String):Boolean;

  function GetNameFilePropertyFTP:String;
  function GetPropertyIniFTP(sSection:String):TPropFTP;
  function GetPropertyVCBrest(sType:String):TPropFTP;
  function GetPropertyFTP_ForWrite(TypeServer:Integer; sType:String):TPropFTP;
  function GetPropertyFTP(nTypeServerFTP:Integer; strTypeFile:String):TPropFTP;

  function GetNameServerFTP(nTypeServer:Integer):String;
  function GetOperValue(sValue:String; var sOper:String; var sKolvo:String; lShowError:Boolean; win:TWinControl):Boolean;

  function GetDateFromStr(s:String; var sNew:String):TDateTime;
  function StrScanPos(const s: String; Ch: Char; StartPos: Integer):Integer;
  procedure DelChars(var S: string; const CharsToRemove: string);
  function  DelCharsR(S: string; const CharsToRemove: string):String;
  procedure KeepChars(var S: string; const CharsToKeep: string);
  function KeepCharsR(S: string; const CharsToKeep: string):String;
  function GetNameDayWeek(nDay:Integer; lFull:Boolean):String;
  function NormDir(sPath:String):String;

  function LockOperation_(nTypeOper:Integer; strOper:String):Boolean;
  procedure UnLockOperation_(nTypeOper:Integer);
  function IsPrazdnik(dDate:TDateTime):Boolean;
  function PrintDeclDok(nTypeObj:Integer):Boolean;
  procedure SetPrintDeclDok(nTypeObj:Integer; lValue:Boolean);

  function SeekValueList(sName:String; sKey:String; lKrat:Boolean):String;
  function NameOtdOch(n:Integer; lKrat:Boolean):String;
  function CheckZnack(sText:String; sZ:String):String;
  function CheckZnackDel(sText:String; sZ:String):String;

  function GetNameFileClearBase:String;
  function TypeBrakToSem(nTypeBrak:Integer):Integer;

  function CheckFamilia_ON_ONA(sON,sONA:String):Boolean;
  function CheckFamilia_ON_ONA_Bel(sON,sONA:String):Boolean;

  function CreateFIO(ds:TDataSet; sPar:String):String;

  function FamiliaON2ONA(sON:String):String;
  function GetOtmetka(s:String; sl:TStringList):Integer;

  function MySameText(s1,s2:String):Boolean;

  procedure setControlsEnabled(gb:TWinControl; lSet:Boolean);
  function IntToStrSep(n:Integer; sep:Char):String;

  function GetGUID(lDel:Boolean):String;
  function ANSI2KOI8R(S: string): string;

  function SaveStringToFile(aFile: String; Const Str: AnsiString): boolean;
  function ReadFileToString(aFile: String; var sErr:String): AnsiString;

  function NodeFromStr(sNode:String; var s:String):String;
  function CountPos(const subtext: string; Text: string): Integer;
  function GetFolderMyDocument: string;
  function GetFolderExport: string;
  function IsFileFromBase(sFile:String):Boolean;  // файл принадлежит базе данных

  function EnabledCorr_SprDocSubjG:Boolean;

  function TestSign(lInvertSign:Boolean) : String;

  function FindServers:Boolean;
  function CheckSeriaSvid(sSeria:String):Boolean;
  function IsAllSimRim(s:String):Boolean;
  function IsAllSimRus(s:String; lAllUpper:Boolean):Boolean;

  procedure SetEnabledControls(arrControls: array of TVarRec; lSet:Boolean);
  procedure SetVisibleControls(arrControls: array of TVarRec; lSet:Boolean);

  function GetUpdatingObj(nTypeObj:Integer):Boolean;

  function Opeka_RequiredSendToGISRN:String;
  function ce_fio(s:String):String;
  function crlf_create(var s:String):Boolean;
  function crlf_delete(var s:String):Boolean;

  function SetPosForm(f:TForm; sPos:String):Boolean;
  function GetPosForm(f:TForm):String;

  function NameFileParams(sIdProg:String; nTypeFile:Integer):String;
  function Name_Tail:String;
  function getNameProgram:String;

  procedure FlashTrayApp;   // сделать мерцающей иконку приложения

var
  nLenP:Integer;
  ArrPrazd:TArrStrings;
  sNameTail:String;
//  ArrRadun:array of TDateTime;
  ArrPasxa:TArrStrings;
//  strTypeBase:String;
const
  PPP_CONST='bd3141f9aed34f62a74c8a093a0b2ba9';

  _GIS_ = 'ГИС РН';
  // 1.1-163(10);  1.2-164(11)  1.25-169  1.27-173   1.28-177  1.31-182   1.36-192
  VERSION_SYSTEM_SMDO='версия 1.36';

  MAX_REC=20;

  def_space=#160;

  ATEID_BrObl=1;
  ATEID_VtObl=2464;
  ATEID_GoObl=9397;
  ATEID_GrObl=12380;
  ATEID_MoObl=22672;
  ATEID_MnObl=17041;
  ATEID_MnGor=17030;

{$IFDEF OPEKA}
  NAME_PROG='Опека и попечительство';
{$ENDIF}
{$IFDEF ZAH}
  NAME_PROG='Учет захоронений';
{$ENDIF}
{$IFDEF ZAGS}
  NAME_PROG='ЗАГС';
{$ENDIF}
{$IFDEF LAIS}
  NAME_PROG='ЛАИС';
{$ENDIF}
{$IFDEF GKH}
   NAME_PROG='ЖКХ';
{$ENDIF}
{$IFDEF OCHERED}
   NAME_PROG='Учет очередников';
{$ENDIF}
{$IFDEF POST}
   NAME_PROG='ЛАИС.СМДО';
{$ENDIF}

implementation

uses {$IFDEF UPDATEPROG}
       dBaseConf,
     {$ELSE}
       dBase,
     {$ENDIF}
     DateUtils, StrUtils, Variants, IniFiles;

{
var
  tz:TTimeZoneInformation;
  st:TSystemTime;
  t:TTime;
begin
//  d:=GetSystemTime();
  GetTimeZoneInformation(tz);
//  tz.Bias;  -180    +03:00
//  edit1.Text:=tz.StandardName;
  GetSystemTime(st); //  возвращает UTC время
  t:=EncodeTime(st.wHour,st.wMinute,st.wSecond,st.wMilliseconds);
  edit1.Text:=TimeToStr(t); // inttostr(integer(st.wHour))+':'+inttostr(integer(st.wMinute))+':'+inttostr(integer(st.wSecond));
//  tz.StandardBias;
  edit2.Text:=inttostr(tz.Bias)+':'+inttostr(tz.StandardBias);
//  tz.DaylightDate;
//  tz.DaylightBias;
end;
}

function GetUpdatingObj(nTypeObj:Integer):Boolean;
begin
  Result:=true;
end;

function getWidthEhBt(lFlat:Boolean):Integer;
begin
  if lFlat
    then Result:=FlatButtonWidth
    else Result:=GetSystemMetrics(SM_CXVSCROLL);
end;

procedure gbEnabled_(gb:TWinControl; lSet:Boolean);
var
  i:Integer;
//  l:Boolean;
begin
  gb.Enabled:=lSet;
  for i:=0 to gb.ControlCount-1 do begin
    gb.Controls[i].Enabled:=lSet;
    if gb.Controls[i] is TWinControl then begin
      gbEnabled_(TWinControl(gb.Controls[i]),lSet);
    end;
  end;
end;
procedure SetEnabledControls(arrControls: array of TVarRec; lSet:Boolean);
var
  i : Integer;
  wc:TWinControl;
begin
  for i:=Low(arrControls) to High(arrControls) do begin
    with arrControls[i] do begin
      wc:=TWinControl(VObject);
      wc.Enabled:=lSet;
      if wc is TGroupBox then begin
        if lSet then begin
          TGroupBox(wc).Font.Color:=clWindowText;
        end else begin
          TGroupBox(wc).Font.Color:=clGrayText;
        end;
        gbEnabled_(TGroupBox(wc), lSet);
      end;
    end;
  end;
end;
procedure SetVisibleControls(arrControls: array of TVarRec; lSet:Boolean);
var
  i : Integer;
  wc:TWinControl;
begin
  for i:=Low(arrControls) to High(arrControls) do begin
    with arrControls[i] do begin
      wc:=TWinControl(VObject);
      wc.Visible:=lSet;
    end;
  end;
end;
//-----------------------------------------------------------------
function TestSign(lInvertSign:Boolean) : String;
var
  c_sign: array[0..1023] of char;
  len_sign : LongWord;
  i,DLL:Integer;
  flasterror:String;
const
  FILL_CHAR=#0;
begin
  DLL:=100;
  if (DLL>0) then begin //and Assigned(Sign_) then begin
    FLastError:='';
    len_sign:=1024;
    FillChar(c_sign,1024,FILL_CHAR);
    i:=1;  
    try
      //i:=Sign_(nLenData,PChar(Data),SignAlg,@len_sign,@c_sign,PChar(PIN));
      //---- test-------
      len_sign:=10;
      for i:=0 to 9 do begin
        c_sign[i]:=Chr(48+i);
      end;
      c_sign[10]:='a'; inc(len_sign);
      c_sign[11]:='b'; inc(len_sign);
      c_sign[12]:='c'; inc(len_sign);
      c_sign[13]:='d'; inc(len_sign);
      c_sign[14]:='#'; inc(len_sign);
      i:=0;
      //--------------
    except
      on E: Exception do begin
        FLastError:=E.Message;
      end;
    end;
    if (FLastError='') then begin
      if i=0 then begin
        SetLength(Result,len_sign);
        if lInvertSign then begin
          for i:=len_sign-1 downto 0 do begin
            Result[len_sign-i]:=c_sign[i];
          end;
        end else begin
          for i:=0 to len_sign-1 do begin
            Result[i+1]:=c_sign[i];
          end;
        end;
      end else begin
        FLastError:='Ошибка вызова функции ZChannel Sign';
        Result:='';
      end;
    end;
  end else begin
    FLastError:='Ошибка вызова функции ZChannel Sign (библиотека не загружена)';
    Result:='';
  end;
end;

function Def_SprDocSubj:String;
begin
  if ((GlobalTask.ParamAsInteger('SP_SUBJ')=0) and (Date>STOD('20181231'))) or (GlobalTask.ParamAsInteger('SP_SUBJ')=1)
    then Result:='G'  // SP_SUBJG
    else Result:='';  // SP_SUBJ
end;
//--------------------------------------------------------------------
function EmptyDate:TDateTime;
begin
  Result:=STOD('18991230',tdClipper);
end;
//--------------------------------------------------------------------
function CalcMD5File(sFile:String):String;
begin
  {$IFDEF UPDATEPROG}
    Result:='';
  {$ELSE}
    if FileExists(sFile) then begin
      Result:=MD5Print( MD5File(sFile) );
    end else begin
      Result:='';
    end;
  {$ENDIF}
end;
//---------------------------------------------
function CalcMD5String(s:String):String;
begin
  Result:=MD5Print(MD5String(ANSIUppercase(s+'myfirstlove'+s)));
end;
//--------------------------------------------------------------------
function ValueFromParams(slPar:TStringList;sParam,sDefault: String): String;
begin
  Result:=sDefault;
  if (slPar<>nil) and (slPar.Count>0) then begin
    Result:=slPar.Values[sParam];
    if Result=''
      then Result:=sDefault;
  end;
end;
//--------------------------------------------------------------------
function ObjectFromParams(slPar:TStringList;sParam:String): TObject;
var
  i:Integer;
begin
  Result:=nil;
  if (slPar<>nil) and (slPar.Count>0) then begin
    i:=slPar.IndexOfName(sParam);
    if i=-1
      then i:=slPar.IndexOf(sParam);
    if i>-1
      then Result:=slPar.Objects[i];
  end;
end;
//--------------------------------------------------------------------
function GetFolderSize(sPath:String):Int64;
begin
  Result:=DSiGetFolderSize(sPath, true);
end;
//--------------------------------------------------------------------
function GetNameFileClearBase:String;
begin
  {$IFDEF ZAH}
    Result:='ClearBaseZAH';
  {$ELSE}
    Result:='ClearBase';
  {$ENDIF}
end;
//--------------------------------------------------------------------
function GetHeight(m:Integer):Integer;
begin
  Result:=MulDiv(m,screen.PixelsPerInch,96);
end;
//--------------------------------------------------------------
function CheckSpace(s:String):String;
begin
  Result:=StringReplace(s,' ',chr(160),[rfReplaceAll]);
end;
//--------------------------------------------------------------
function TypeBrakToSem(nTypeBrak:Integer):Integer;
begin
{[KEY_TYPE_BRAK]
1=состоит в браке (з/а о браке)
2=в браке не состоит
3=разведен (решение суда)
4=разведен (з/а о раст. брака)
5=вдова (вдовец) (з/а о браке)
[KEY_SEMF]
1=состоит в браке
2=в браке не состоял(а)
3=вдовец(а)
4=разведен(а)
9=сведения не представлены}
  Result:=0;
  case nTypeBrak of
    1  : Result:=1;
    2  : Result:=2;
    3,4: Result:=4;
    5  : Result:=3;
  end;
end;
//--------------------------------------------------------------
procedure WriteToDebug(arr:array of Variant);
var
 lRun:Boolean;
 v:Variant;
begin
  lRun:=false;
  RunFuncScript('WriteDebug_',arr,v,lRun);
end;
//-----------------------------------------------------------------------------
procedure Date2Field(fld:TField; v:Variant);
var
  d:TDateTime;
begin
  if v=null then begin
    fld.Value:=null;
  end else begin
    try
      d:=VarToDateTime(v);
    except
      d:=0;
    end;
    if d=0
      then fld.Value:=null
      else fld.AsDateTime:=d;
  end;
end;
//-----------------------------------------------------------------------------
function RunFuncScript(strFuncName: String; ArrPar : array of Variant;var vResult : Variant; var lRun:Boolean): Boolean;
begin
  Result:=false;
  if (GlobalTask.Script<>nil) and not lRun then begin
    lRun:=true;
    try
      Result := GlobalTask.Script.Run(strFuncName,ArrPar,vResult);
    finally
      lRun := false;
    end;
  end;
end;

//--------------------------------------------------------------------
function GetLocaleInformation(Flag: Integer): string;
var
  pcLCA: array [0..20] of Char;
begin
  if GetLocaleInfo(LOCALE_SYSTEM_DEFAULT, Flag, pcLCA, 19) <= 0 then
    pcLCA[0] := #0;
  Result := pcLCA;
end;
{
procedure SetDecimalSeparator(Ch: Char);
 var
   DefLCID: LCID;
   Buffer: LPSTR;
 begin
   Application.UpdateFormatSettings := True;
   StrPCopy(Buffer, Ch);
   DefLCID := GetThreadLocale;
   if SetLocaleInfo(DefLCID, LOCALE_SDecimal, Buffer) then
     DecimalSeparator := StrPas(Buffer)[1];
   Application.UpdateFormatSettings := False;
 end;
 }
//--------------------------------------------------------------------
function PrintDeclDok(nTypeObj:Integer):Boolean;
var
  s:String;
begin
  {
  if nTypeObj>0
    then s:='_'+IntToStr(nTypeObj)
    else s:='';
  }
  s:='';   // пока независимо от типа документа
  if GlobalTask.GetLastValueAsString('PRINT_DECLDOK'+s)='1'
    then Result:=true
    else Result:=false;
end;
//--------------------------------------------------------------------
procedure SetPrintDeclDok(nTypeObj:Integer; lValue:Boolean);
var
  s:String;
begin
  {
  if nTypeObj>0
    then s:='_'+IntToStr(nTypeObj)
    else s:='';
  }
  s:='';   // пока независимо от типа документа
  GlobalTask.SetLastValueAsBoolean('PRINT_DECLDOK'+s, lValue)
end;

//--------------------------------------------------------------------
function IsPrazdnik(dDate:TDateTime):Boolean;
var
  ini:TSasaIniFile;
  nY,nM,nD:Word;
  s:String;
  sl:TStringList;
  i:Integer;
  d:TDateTime;
begin
  Result:=false;
  if Length(ArrPrazd)=0 then begin
    sl:=TStringList.Create;
    ini:=Globaltask.iniFile('PRAZDNIKI');
    ini.ReadSectionValues('DAY',sl);
    SetLength(ArrPrazd,sl.Count);
    for i:=0 to sl.Count-1 do begin
      ArrPrazd[i]:=sl.Strings[i];
    end;
    ini.ReadSectionValues('PASXA',sl);
    SetLength(ArrPasxa,sl.Count);
    for i:=0 to sl.Count-1 do begin
      ArrPasxa[i]:=sl.Strings[i];
    end;
    sl.Free;
    nLenP:=length(ArrPasxa)-1;
  end;
  DecodeDate(dDate,nY,nM,nD);
  s:=inttostr(nM)+'-'+InttoStr(nD);
  for i:=0 to length(ArrPrazd)-1 do begin
    if ArrPrazd[i]=s then begin
      Result:=true;
    end;
  end;
  if not Result then begin
    s:=IntToStr(nY);
    for i:=0 to nLenP do begin
      if Copy(ArrPasxa[i],1,4)=s then begin  //ищем год
        d:=STOD(ArrPasxa[i],tdAds);
        d:=IncDay(d,9);
        if d=dDate then begin
          Result:=true;
        end;
        break;
      end;
    end;
  end;
end;
//----------------------------------------------------------
function NameOtdOch(n:Integer; lKrat:Boolean):String;
begin
  Result:=GlobalTask.CurrentOpisEdit.SeekValue('KEY_TYPEOCHERED_FULL', IntToStr(n), lKrat);
end;
//----------------------------------------------------------
function SeekValueList(sName:String; sKey:String; lKrat:Boolean):String;
begin
  Result:=GlobalTask.CurrentOpisEdit.SeekValue(sName, sKey, lKrat);
end;

// добавить знак, если нет
function CheckZnack(sText:String; sZ:String):String;
begin
  if (sText<>'') and (sZ<>'') then begin
    if RightStr(sText,1)=sZ
      then Result:=sText
      else Result:=sText+sZ;
  end else begin
    Result:=sText;
  end;
end;
// удалить знак, если есть
function CheckZnackDel(sText:String; sZ:String):String;
begin
  if (sText<>'') and (sZ<>'') then begin
    if RightStr(sText,1)=sZ
      then Result:=Copy(sText,1,Length(sText)-1)
      else Result:=sText;
  end else begin
    Result:=sText;
  end;
end;
{
function IsPrazdnik(dDate:TDateTime):Boolean;
var
  ini:TSasaIniFile;
  nY,nM,nD:Word;
  s:String;
  sl:TStringList;
  i:Integer;
//  d:TDateTime;
begin
  Result:=false;
  if Length(ArrPrazd)=0 then begin
    sl:=TStringList.Create;
    ini:=Globaltask.iniFile('PRAZDNIKI');
    ini.ReadSectionValues('DAY',sl);
    SetLength(ArrPrazd,sl.Count);
    for i:=0 to sl.Count-1 do begin
      ArrPrazd[i]:=sl.Strings[i];
    end;
    sl.Clear;
    ini.ReadSectionValues('PASXA',sl);
    SetLength(ArrRadun,sl.Count);
    for i:=0 to sl.Count-1 do begin
     // d:=;
     // d:=IncDay(d,9);
      ArrRadun[i]:=IncDay(STOD(sl.Strings[i],tdAds),9); //sl.Strings[i];
    end;
    sl.Free;
  end;
  DecodeDate(dDate,nY,nM,nD);
  s:=inttostr(nM)+'-'+InttoStr(nD);
  for i:=0 to length(ArrPrazd)-1 do begin
    if ArrPrazd[i]=s then begin
      Result:=true;
    end;
  end;
  if not Result then begin
    //s:=IntToStr(nY);
    for i:=0 to length(ArrRadun)-1 do begin
      if YearOf(dDate)=YearOf(ArrRadun[i]) then begin //Copy(ArrPasxa[i],1,4)=s then begin  //ищем год
       // d:=STOD(ArrPasxa[i],tdAds);
       // d:=IncDay(d,9);
        if ArrRadun[i]=dDate then begin
          Result:=true;
        end;
        break;
      end;
    end;
  end;
end;
}

//==  !!!  dmBaseConf  !!! ====================================================
{$IFDEF UPDATEPROG}
//--------------------------------------------------------------------
function SysQuery(sText: String): String;
var
  lAds10:Boolean;
begin
  if Copy(dmBaseConf.WorkTable.Version,1,1)='8'
    then lAds10:=false
    else lAds10:=true;
  Result:=CheckSysView(sText,lAds10);
end;
function LockOperation_(nTypeOper:Integer; strOper:String):Boolean;
begin
  Result:=true;
end;
function CheckAddParamOrg(sCode:String):Boolean;
begin
  Result:=true;
end;

procedure UnLockOperation_(nTypeOper:Integer);
begin
end;
{$ELSE}
//==  !!!  dmBase !!! ====================================================
//--------------------------------------
function getURLCOC:String;
begin
  Result:='avest';
end;
//--------------------------------------
function CheckAddParamOrg(sCode:String):Boolean;
begin
  Result:=true;
  dmbase.WorkQuery.SQL.Text:='select org from global';
  dmbase.WorkQuery.Open;
  dmbase.WorkQuery.Fields[0].AsString;
end;

//BEGIN ФУНКЦИИ РАБОТЫ С НОМЕРАМИ КНИГ ЗАХОРОНЕНИЙ
{$IFDEF ADD_ZAH}
function BookKlad_SetDataSet(nKlad:Integer; dsBook:TDataSet):TDataSet;  // обязательно вызывать ClearDataSetBookKlad
var
  n:Integer;
begin
  if dsBook=nil then begin
    dmBase.tbSimpleProp.IndexName:='PR_KEY'; //  'TYPEOBJ;ID;DATES;POKAZ'
    if nKlad=0
      then dmBase.tbSimpleProp.SetRange([_TypeObj_BookKlad],[_TypeObj_BookKlad])
      else dmBase.tbSimpleProp.SetRange([_TypeObj_BookKlad,nKlad],[_TypeObj_BookKlad,nKlad]);
    Result:=dmBase.tbSimpleProp;
  end else begin
    Result:=nil;
    dmBase.AdsConnection.Execute('DELETE FROM BaseProp WHERE typeobj='+IntToStr(_TypeObj_BookKlad)+' and id='+IntToStr(nKlad));
    dsBook.First;
    while not dsBook.Eof do begin
      dmBase.tbSimpleProp.Append;
      dmBase.tbSimpleProp.FieldByName('TYPEOBJ').AsInteger:=_TypeObj_BookKlad;
      dmBase.tbSimpleProp.FieldByName('ID').AsInteger:=nKlad;
      dmBase.tbSimpleProp.FieldByName('POKAZ').AsString:=dsBook.FieldByName('BOOK').AsString;
      dmBase.tbSimpleProp.FieldByName('DATES').AsDateTime:=dsBook.FieldByName('BOOK_DATE').AsDateTime;
      if dsBook.FieldByName('BOOK_DATE_END').IsNull
        then dmBase.tbSimpleProp.FieldByName('VALUE').AsString:=''
        else dmBase.tbSimpleProp.FieldByName('VALUE').AsString:=DTOS(dsBook.FieldByName('BOOK_DATE').AsDateTime,tdStd)+'-'+
                                                                DTOS(dsBook.FieldByName('BOOK_DATE_END').AsDateTime,tdStd);
      try
        n:=dsBook.FieldByName('ZH_TYPE').AsInteger;
      except
        n:=0;
      end;
      dmBase.tbSimpleProp.FieldByName('TYPESAVE').AsInteger:=n;
      dmBase.tbSimpleProp.Post;
      dsBook.Next;
    end;
    dsBook.First;
  end;
end;
procedure BookKlad_ClearDataSet;
begin
  dmBase.tbSimpleProp.CancelRange;
end;
//------------------------------------------------
function CreateTableBooks:TDataSet;
begin
  Result:=dbCreateMemTable('KLAD,Integer;BOOK,Integer;BOOK_DATE,Date;BOOK_DATE_END,Date;ZH_TYPE,Integer','KLAD;BOOK_DATE');
  Result.Open;
//  ShowMessage(TkbmMemTable(Result).IndexFieldNames);
end;
//------------------------------------------------
procedure ReadListAllBooks(mtBooks:TDataSet; nKlad:Integer);
var
  dsBook:TDataSet;
  n,nID:Integer;
  s:String;
  d:TDateTime;
begin
  dsBook:=BookKlad_SetDataSet(nKlad, nil);
  try     
    //ShowMessage(TkbmMemTable(mtBooks).IndexFieldNames);

    while not dsBook.Eof do begin      // tbSimpleProp
      mtBooks.Append;
      mtBooks.FieldByName('KLAD').AsInteger:=dsBook.FieldByName('ID').AsInteger;
      mtBooks.FieldByName('BOOK').AsInteger:=StrToInt(dsBook.FieldByName('POKAZ').AsString);
      mtBooks.FieldByName('BOOK_DATE').AsDateTime:=dsBook.FieldByName('DATES').AsDateTime;
      s:=dsBook.FieldByName('VALUE').AsString;
      n:=Pos('-',s);
      d:=0;
      try
        if n>0
          then d:=STOD(Copy(s,n+1,Length(s)),tdStd);
      except
      end;
      if d>0
        then mtBooks.FieldByName('BOOK_DATE_END').AsDateTime:=d;
      mtBooks.FieldByName('ZH_TYPE').AsInteger:=dsBook.FieldByName('TYPESAVE').AsInteger;
      mtBooks.Post;
      dsBook.Next;
    end;
  finally
    BookKlad_ClearDataSet;
  end;
  mtBooks.First;
end;
//------------------------------------------------
function GetNumberBook(mtBooks:TDataSet; var Info:TOneRecZah; var sSoob:String):Integer;
var
  dsBook:TDataSet;
  nID:Integer;
begin               
  sSoob:='';
  Result:=0;
  if (Info.DateZah>0) then begin
    mtBooks.Filter:='klad='+Info.Klad;
    mtBooks.Filtered:=true;
    //---- ищем по типу захоронения -------
    if Info.Tip>0 then begin
      mtBooks.Last;
      while not mtBooks.Bof do begin
        if Info.Tip=mtBooks.FieldByName('ZH_TYPE').AsInteger then begin
          if Info.DateZah>=mtBooks.FieldByName('BOOK_DATE').AsDateTime then begin
            if mtBooks.FieldByName('BOOK_DATE_END').IsNull then begin
              Result:=mtBooks.FieldByName('BOOK').AsInteger;
            end else begin
              if Info.DateZah<=mtBooks.FieldByName('BOOK_DATE_END').AsDateTime then begin
                Result:=mtBooks.FieldByName('BOOK').AsInteger;
              end;
            end;
          end;
        end;
        if Result>0 then break;
        mtBooks.Prior;
      end;
    end;
    //---- ищем по общим книгам ---------
    if Result=0 then begin
      mtBooks.Last;
      while not mtBooks.Bof do begin
        if mtBooks.FieldByName('ZH_TYPE').AsInteger=0 then begin
          if Info.DateZah>=mtBooks.FieldByName('BOOK_DATE').AsDateTime then begin
            if mtBooks.FieldByName('BOOK_DATE_END').IsNull then begin
              Result:=mtBooks.FieldByName('BOOK').AsInteger;
            end else begin
              if Info.DateZah<=mtBooks.FieldByName('BOOK_DATE_END').AsDateTime then begin
                Result:=mtBooks.FieldByName('BOOK').AsInteger;
              end;
            end;
          end;
        end;
        if Result>0 then break;
        mtBooks.Prior;
      end;
    end;
    //-----------------------------------
    mtBooks.Filtered:=false;
    if Result=0 then begin
      sSoob:='№ книги не определен';
    end else begin
      sSoob:='книга № '+IntToStr(Result);
    end;
  end else begin
    sSoob:='№ книги не определен, нет даты';
  end;
end;
//-----------------------------------------------
function BookKlad_Date(nKlad,nBook:Integer):TDateTime; // вернуть дату создания книги
begin
  Result:=0;
  if dmBase.tbSimpleProp.Locate('TYPEOBJ;ID;POKAZ', VarArrayOf([_TypeObj_BookKlad,nKlad,IntToStr(nBook)]), [] ) then begin
    Result:=dmBase.tbSimpleProp.FieldByName('DATES').AsDateTime;
  end;
end;
//END   ФУНКЦИИ РАБОТЫ С НОМЕРАМИ КНИГ ЗАХОРОНЕНИЙ

//BEGIN  ФУНКЦИИ РАБОТЫ С НОМЕРАМИ ЗАГРУЗОК В КНИГУ ЗАХОРОНЕНИЙ
function LoadZah_SetDataSet:TDataSet;  // обязательно вызывать ClearDataSet
begin
  dmBase.tbSimpleProp.IndexName:='PR_KEY'; //  'TYPEOBJ;ID;DATES;POKAZ'
  dmBase.tbSimpleProp.SetRange([_TypeObj_LoadZah],[_TypeObj_LoadZah]);
  dmBase.tbSimpleProp.First;
  Result:=dmBase.tbSimpleProp;
end;
procedure SimpleProp_ClearDataSet;
begin
  dmBase.tbSimpleProp.CancelRange;
end;
//END
{$ENDIF}       //  ADD_ZAH

//------------------------------------------------------------------------
function Locate_AllSprGISUN(nTypeSpr:Integer; sCode: String): TRecSprGISUN;
begin
  Result.TypeSpr:=nTypeSpr;
  Result.ExtCode:=sCode;
  Result.Ok:=false;
  Result.Lex1:='';
  {$IFDEF GISUN}
  if dmBase.AllSprGISUN.Locate('TYPESPR;EXTCODE', VarArrayOf([nTypeSpr, sCode]),[]) then begin
    Result.Ok:=true;
    Result.Lex1:=dmBase.AllSprGISUN.FieldByName('LEX1').AsString;
    Result.Lex2:=dmBase.AllSprGISUN.FieldByName('LEX2').AsString;
    Result.Lex3:=dmBase.AllSprGISUN.FieldByName('LEX3').AsString;
  end;
  {$ENDIF}
end;
//--------------------------------------------
function SysQuery(sText: String): String;
var
  lAds10:Boolean;
begin
  if Copy(dmBase.WorkTable.Version,1,1)='8'
    then lAds10:=false
    else lAds10:=true;
  Result:=CheckSysView(sText,lAds10);
end;
//----------------------------------------------------------------
function LockOperation_(nTypeOper:Integer; strOper:String):Boolean;
var
  lOpenMessage,lMessage:Boolean;
begin
  lMessage:=false;
  if strOper='' then strOper:='выполняет данную операцию';
  if not dmBase.LockTypeObj.Locate('TYPEOBJ', nTypeOper, []) then begin
    dmBase.LockTypeObj.Append;
    dmBase.LockTypeObj.FieldByName('TYPEOBJ').AsInteger:=nTypeOper;
    dmBase.LockTypeObj.Post;
  end;
  Result:=false;
  lOpenMessage:=false;
  while not Result do begin
    if lOpenMessage and not lMessage then begin
      OpenMessageEx('Другой пользователь '+strOper+' ... ','Подождите пожалуйста',10,'  Прервать  ');
      lMessage:=true;
    end;
    try
      dmBase.LockTypeObj.Edit;                                         // запись блокируется
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
procedure UnLockOperation_(nTypeOper:Integer);
begin
  if dmBase.LockTypeObj.State=dsEdit then begin
    dmBase.LockTypeObj.Cancel;
  end;
end;
{$ENDIF}

//----------------------------------------------------------------
function StrScanPos(const s: string; Ch: Char; StartPos: Integer):Integer;
begin
  Result:=Q_StrScan(s,ch,StartPos);
end;
procedure DelChars(var S: string; const CharsToRemove: string);
begin
  Q_DelChars(S,CharsToRemove);
end;
function DelCharsR(S: string; const CharsToRemove: string):String;
begin
  Q_DelChars(S,CharsToRemove);
  Result:=s;
end;
procedure KeepChars(var S: string; const CharsToKeep: string);
begin
  Q_KeepChars(S,CharsToKeep);
end;
function KeepCharsR(S: string; const CharsToKeep: string):String;
begin
  Q_KeepChars(S,CharsToKeep);
  Result:=s;
end;
//------------------------------------------------
function UlicaUpdate(sUl:String):String;
const
  arr : array[1..18] of String=('Ул.','Пер.','Пр-т','Пр.','Пл.','Проезд','Ш.','Шоссе','Улица','Проспект',
                               'Переулок','Проезд','Полощадь','Б-р','Бульвар','П-т','Ул ','Пер ');
var
  i:Integer;
begin
  if Q_CharCount(sUl,' ')<=2 then begin   // состоит максимум из двух слов
    sUl:=FirstUpperEx(sUl,' .,');
    for i:=low(arr) to High(arr) do begin
      if Copy(sUl,1,Length(arr[i]))=arr[i]
        then sUl:=Trim(ANSILowerCase(arr[i]))+' '+Copy(sUl,Length(arr[i])+1,Length(sUl));
    end;
  end;
  Result:=sUl;
end;
//------------------------------------------------
function GetDateFromStr(s:String; var sNew:String):TDateTime;
var
  nDay,nMonth,nYear:Word;
//  lErr:Boolean;
begin
  Result:=0;
  if Q_CharCount(s,'.')=2 then begin   // типа дата
//    lErr:=false;
    try
      nDay:=StrToInt(Q_GetWordN(1,s,'.'));
      nMonth:=StrToInt(Q_GetWordN(2,s,'.'));
      nYear:=StrToInt(Q_GetWordN(3,s,'.'));
      Result:=EncodeDate(nYear,nMonth,nDay);
    except

    end;
  end;
end;
//-------------------------------------------------------------
function GetNameDayWeek(nDay:Integer; lFull:Boolean):String;
begin
//  Q_WeekDays: array[1..7] of string =    ('Воскресенье','Понедельник','Вторник','Среда','Четверг','Пятница','Суббота');
//  Q_SWeekDays2: array[1..7] of string =  ('Вс','Пн','Вт','Ср','Чт','Пт','Сб');
  if nDay=7 then nDay:=1 else nDay:=nDay+1;
  if lFull then result:=Q_WeekDays[nDay]
           else result:=Q_SWeekDays2[nDay];
end;
//-------------------------------------------------------------
function NormDir(sPath:String):String;
var
  s:String;
begin
  if Pos('&BASE&',sPath)>0 then begin
    {$IFDEF UPDATEPROG}
      s:=dmBaseConf.AdsConnection.ConnectPath;
    {$ELSE}
      s:=dmBase.AdsConnection.ConnectPath;
    {$ENDIF}
    if Pos(UpperCase('Data\'+NAME_DICT),ANSIUpperCase(s))>0 then begin
      s := Copy(s,1,Length(s)-Length('Data\'+NAME_DICT)-1);
    end;
    if RightStr(s,1)='\' then s:=Copy(s,1,Length(s)-1);
    Result:=StringReplace(sPath, '&BASE&', s, []);
  end else begin
    Result:=sPath;
  end;
end;
//-------------------------------------------------------------
function GetOperValue(sValue:String; var sOper:String; var sKolvo:String; lShowError:Boolean; win:TWinControl):Boolean;
var
  n:Integer;
  s:String;
begin
  Result:=false;
  if Trim(sValue)='' then exit;
  sOper:='=';
  sKolvo:='';
  n:=Q_StrCSpn(sValue, '1234567890', 1);
  if n > 1 then begin   // есть операция, цифра не с первой позиции
    sOper:=Copy(sValue,1,n-1);
    s:=Copy(sValue,n,Length(sValue));
  end else begin
    s:=sValue;
  end;
  try
    n:=StrToInt(s);
    sKolvo:=IntToStr(n);
    Result:=true;
  except
  end;
  if not Result and lShowError then begin
    PutError('Ошибка в параметрах поиска: "'+sValue+'"',win);
  end;
end;
//------------------------------------------------------------------------------
function GetNameFilePropertyFTP:String;
begin Result:=GlobalTask.PathServiceMain+'ftp.ini'; end;
//-------------------------------------------------------------------------------
function GetNameServerFTP(nTypeServer:Integer):String;
begin
  Result:='';
  case nTypeServer of
    SERVER_BREST   : Result:='"ЦИТ Белстата (Internet)"';
    SERVER_NCES_UPD: Result:='"ЦИТ Белстата (НЦЕУ)"';
    SERVER_NCES_UPD2: Result:='"ЦИТ Белстата (НЦЕУ доп)"';
    SERVER_RIAP    : Result:='"FTP"'; //'"РИАП"';
    SERVER_UPDATE  : Result:='обновлений';
    SERVER_OCHERED : Result:='';
    SERVER_ZAGS    : Result:='';
//    SERVER_AUTO    : Result:='';
  end;
end;
//--------------------------------------------------------------------------------
function GetPropertyIniFTP(sSection:String):TPropFTP;
var
  Ini:TSasaIniFile;
begin
  Result.Ok:=false;
  ini:=TSasaIniFile.Create(GetNameFilePropertyFTP);
  try
    if ini.SectionExists(sSection) then begin
      Result.Ok:=true;
      Result.Port:=ini.ReadInteger(sSection,'PORT',21);
      Result.Host:=ini.ReadString(sSection,'HOST','');
      Result.Username:=ini.ReadString(sSection,'USERNAME','');
      Result.Password:=ini.ReadString(sSection,'PASSWORD','*');
      Result.Dir:=ini.ReadString(sSection,'DIR','');
      Result.Passive:=ini.ReadBool(sSection,'PASSIVE',true);
      if (Result.Host='') or (Result.UserName='')
        then Result.Ok:=false;
    end;
  finally
    ini.Free;
  end;
end;
//---------------------------------------------------------------------
function GetFieldXML(strField:String; var strValue:String):String;
var
 k,n,m : Integer;
begin
  k:=Length(strField);
  n:=Pos('<'+strField+'>',strValue);
  m:=Pos('</'+strField+'>',strValue);
  if (n>0) and (m>0) then begin
    Result:=Copy(strValue,n+k+2,m-n-k-2);
    Result:=STRINGREPLACE( Result, char(38)+'apos;', '''', []);
    Result:=STRINGREPLACE( Result, char(38)+'quot;', '"', []);
  end else begin
    Result:='';
  end;
end;
//---------------------------------------------------------------------
function GetPropertyVCBrest(sType:String):TPropFTP;
begin
  sType:=LowerCase(sType);
  Result.Ok:=true;
  Result.Port:=21;
  Result.Host:='vc.brest.by'; //cpanel3.datacenter.by';
  Result.Passive:=true;
  if (sType='update') or (sType='setup') then begin
    Result.Username:='update@vc.brest.by';
    Result.Password:='903update^';
    Result.Dir:='/';
  end else begin
    Result.Username:='bases@vc.brest.by';
    Result.Password:='903bases^';
    Result.Dir:='/';
  end;
  {
  if (sType='update') or (sType='setup')
    then Result.Dir:='/public_html/download'
    else Result.Dir:='/public_html/bases';
  }
  {
  Result.Host:='vc.brest.by';
  Result.Username:='vc';
  Result.Password:='admin1106';
  if LowerCase(sType)='update'
    then Result.Dir:='/www/vc.brest.by/download'
    else Result.Dir:='/www/vc.brest.by/bases';
  }
end;

//-------------------------------------------
function DIR_UPDATE_:String;
{$IFDEF UPDATEPROG}
var
  s:String;
begin
  s:=GlobalTask.GetWorkParam('TYPEBASE');
  result:='lais';
  if (s='ZAGS') then
    result:='zags'
  else if (s='ZAH') then
    result:='zah'
  else if (s='ZKH') then
    result:='zkh'
  else if (s='OPEKA') then
    result:='opeka'
  else if (s='LAISSMDO') or (s='POST') then
    result:='laissmdo'
  else if (s='OCHERED') then
    result:='ochered';
end;
{$ELSE}
begin
  result:=DIR_UPDATE;
end;
{$ENDIF}
//-----------------------------------------------------------------------------------
function GetPropertyFTP_ForWrite(TypeServer:Integer; sType:String):TPropFTP;
  function getDirFtp:String;
  begin
    if (sType='') or (sType='update') then begin
      Result:=DIR_UPDATE_;
    end else if (Copy(sType,1,4)='data') or (Copy(sType,1,4)='base') then begin
      Result:='bases';
    end else if Copy(sType,1,5)='setup' then begin
      Result:='setup';
    end;
  end;
begin
  sType:=LowerCase(sType);
  if TypeServer=0
    then TypeServer:=GlobalTask.ParamAsInteger('TYPE_UPDATE');
  if (TypeServer<>SERVER_BREST) and (TypeServer<>SERVER_NCES_UPD) and (TypeServer<>SERVER_NCES_UPD2)
    then TypeServer:=SERVER_BREST;
  TypeServerFTP:=TypeServer; // !!!
  Result.Ok:=false;
  if TypeServer=SERVER_BREST then begin             // uProjects.pas
    Result:=GetPropertyVCBrest(sType);
  //------  сервер НЦЭУ -----------
  end else if TypeServerFTP=SERVER_NCES_UPD then begin
    Result.Ok:=true;
    Result.Port:=21;
    Result.Host:='10.30.251.170';
    Result.Username:='admin';
    Result.Password:=XorDecode(PPP_CONST, '010d47050500045c0d');  //'cit411bel';
    Result.Passive:=true;
    Result.Dir:='/var/ftpd/pub/'+getDirFTP;
    {
    if LowerCase(sType)='update'
      then Result.Dir:='/var/ftpd/pub/'+DIR_UPDATE_
      else Result.Dir:='/var/ftpd/pub/bases';
    }
  end else if TypeServerFTP=SERVER_NCES_UPD2 then begin
    Result.Ok:=true;
    Result.Port:=21;
    Result.Host:='10.30.254.20';
    Result.Username:='belstatftp';
    Result.Password:=XorDecode(PPP_CONST, '2e545757001024');  //'L0df4!B'
    Result.Passive:=true;
    Result.Dir:='/'+getDirFTP;
    {
    if LowerCase(sType)='update'
      then Result.Dir:='/'+DIR_UPDATE_
      else Result.Dir:='/bases';
    }
  end;
end;
//--------------------------------------------------------
function GetPropertyFTP(nTypeServerFTP:Integer; strTypeFile:String):TPropFTP;
var
  s:String;
  strUser, strPassword, strCaption:String;
  n:Integer;
  ftpp:TPropFTP;
  function getDirFtp:String;
  begin
    if (strTypeFile='') or (strTypeFile='update') then begin
      Result:=DIR_UPDATE_;
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
//---------------------------------------------------------------------
function CheckNamePunkt(strValue:String) : String;
var
  i,j : Integer;
  s,ss : String;
const
  arr  : array[1..3]  of string=('г.п.','р.п.','к.п.');
  arri : array[1..3]  of string=('4','6','7');
  arrt : array[1..25] of string=('г','д','с','гп','пгт','рп','кп','п','нп','х','м','рзд','ст','ж\д','сан','в/ч','аг','урочище','аул','сл','станица','порт','снп','вг','оп');
begin
  Result := '';
  strValue:=Trim(strValue);
  for i:=1 to 3 do begin
    j:=Pos(arr[i], strValue);
    if j>0 then begin
      Result:=arri[i]+';'+Trim(Copy(strValue,i+1,200));
      exit;
    end;
  end;
  i:=Pos('.',strValue);
  j:=Pos(' ',strValue);
  if i=0 then i:=j
         else if (j<i) and (j>0) then i:=j;
  if i>0 then begin
    s:=Trim(Copy(strValue,1,i-1));
    ss:=Copy(strValue,i+1,200);
    if s<>'' then begin
      for i:=1 to 18 do begin
        if arrt[i]=s then begin
          Result := IntToStr(i)+';'+ss;
          exit;
        end;
      end;
    end;
  end;
end;
function CheckNamePunktB(strValue:String) : String;
var
  i,j : Integer;
  s,ss : String;
const
  arri : array[1..3]  of string=('4','6','7');
  arr  : array[1..3]  of string=('г.п.','р.п.','к.п.');
  arrt : array[1..18] of string=('г','в','с','гп','пгт','пп','кп','п','нп','х','м','рзд','ст','ч\с','сан','в/ч','аг','урочище');
begin
  Result := '';
  strValue:=Trim(strValue);
  for i:=1 to 3 do begin
    j:=Pos(arr[i], strValue);
    if j>0 then begin
      Result:=arri[i]+';'+Trim(Copy(strValue,i+1,200));
      exit;
    end;
  end;
  i:=Pos('.',strValue);
  j:=Pos(' ',strValue);
  if i=0 then i:=j
         else if (j<i) and (j>0) then i:=j;
  if i>0 then begin
    s:=Trim(Copy(strValue,1,i-1));
    ss:=Copy(strValue,i+1,200);
    if s<>'' then begin
      for i:=1 to 18 do begin
        if arrt[i]=s then begin
          Result := IntToStr(i)+';'+ss;
          exit;
        end;
      end;
    end;
  end;
end;

//---------------------------------------------------------------------
function CreateNDelo(sDelo:String):Integer;
begin
  Result:=0;
  // запишем числовой номер дела
  try
    if sDelo='' then begin
      Result:=0;
    end else begin
      if IsAllDigit(sDelo) then begin
        Result:=StrToInt(sDelo);
      end else begin
        sDelo:=Trim(Q_GetWordN(1,sDelo,'./-()*'));
        if IsAllDigit(sDelo)
          then Result:=StrToInt(sDelo)
          else Result:=0;
      end;
    end;
  except
  end;
end;
//------------------------------------------------------------
function CheckFamilia_ON_ONA(sON,sONA:String):Boolean;
var
  i,n:Integer;
  s:String;
begin
  n:=0;
  Result:=true;
  for i:=1 to Length(sON) do begin
    if Copy(sON,i,1)=Copy(sONA,i,1) then begin
      Inc(n,1);
    end else begin
      Result:=false;
      break;
    end;
  end;
  if Result then begin
    s:=ANSILowerCase(Copy(sONA,n+1,length(sONA)));
    if (s<>'') and (s<>'а')
      then Result:=false;
  end else begin
    s:=ANSILowerCase(Copy(sON,n+1,length(sON)));  // окончание фамилии
    if ((s='ый') or (s='ий')) and (ANSILowerCase(Copy(sONA,n+1,length(sONA)))='ая') then begin
      Result:=true;
    end;
  end;
end;
//------------------------------------------------------------
function CheckFamilia_ON_ONA_Bel(sON,sONA:String):Boolean;
var
  i,n:Integer;
  s:String;
begin
  n:=0;
  Result:=true;
  for i:=1 to Length(sON) do begin
    if Copy(sON,i,1)=Copy(sONA,i,1) then begin
      Inc(n,1);
    end else begin
      Result:=false;
      break;
    end;
  end;
  if Result then begin
    s:=ANSILowerCase(Copy(sONA,n+1,length(sONA)));
    if (s<>'') and (s<>'а')
      then Result:=false;
  end else begin
    s:=ANSILowerCase(Copy(sON,n+1,length(sON)));  // окончание фамилии
    if ( ((s='і') or (s='ы')) and (ANSILowerCase(Copy(sONA,n+1,length(sONA)))='ая') ) or
       ( (s='ў') and (ANSILowerCase(Copy(sONA,n+1,length(sONA)))='ва') )  then begin
      Result:=true;
    end;
  end;
end;
//------------------------------------------------------------
// типа создать фамилию невесты из фамилии жениха
function FamiliaON2ONA(sON:String):String;
var
  i:Integer;
begin
  Result:='';
  for i:=1 to Length(sON) do begin
  end;
end;

function GetOtmetka(s:String; sl:TStringList):Integer;
var
  i:Integer;
  arr:TArrStrings;
begin
  sl.Clear;
  i:=CharCount('#',s)+1;
  StrToArr(s,arr,'#',false);
  SetLength(arr,i);
  if i=1 then begin
    sl.Add(s);
  end else if i=2 then begin
    sl.Add(arr[0]);
    sl.Add(arr[1]);
  end else begin
    sl.Add(arr[0]);
    sl.Add(arr[1]);
    sl.Add(arr[2]);
  end;
  Result:=sl.Count;           
end;
//-----------------------------------------------------------------------
function MySameText(s1,s2:String):Boolean;
begin
  Result:=AnsiSameText(s1,s2);
end;

//-------------------------
procedure setControlsEnabled(gb:TWinControl; lSet:Boolean);
var
  i:Integer;
begin
  gb.Enabled:=lSet;
  for i:=0 to gb.ControlCount-1 do begin
    gb.Controls[i].Enabled:=lSet;
    if gb.Controls[i] is TWinControl then begin
      setControlsEnabled(TWinControl(gb.Controls[i]),lSet);
    end;
  end;
end;
//-------------------------
function IntToStrSep(n:Integer; sep:Char):String;
var
  old:Char;
begin
  old:=ThousandSeparator;
  ThousandSeparator:=sep;
  Result:=FormatFloat(',#',n);
  ThousandSeparator:=old;
end;
//-------------------------
function getTailUrlReg:String;
begin
  {$IF Defined(ZAH) or Defined(OPEKA) }
    Result:='/gisun-inf/local/ws';
  {$ELSE}
    Result:='/gisun-inf/zags/ws';
  {$IFEND}
end;
function getTailUrlQuery:String;
begin
  Result:='/gisun-inf/common/ws';
end;
//---------------------------------
function GetGUID(lDel:Boolean):String;
var
  Guid:TGUID;
begin
  CreateGUID(Guid);
  Result:=GUIDToString(GUID);
  if Copy(Result,1,1)='{' then begin
    Result:=Copy(Result,2,Length(Result)-2);
  end;
  if lDel then begin
    Result:=StringReplace(Result,'-','',[rfReplaceAll]);
  end;
end;
//---------------------------------
function ANSI2KOI8R(S: string): string;
var
  Ansi_CODE, KOI8_CODE: string;
  i: integer;
begin
  KOI8_CODE := 'бвчздецъйклмнопртуфхжигюыэящшьасБВЧЗДЕЦЪЙКЛМНОПРТУФХЖИГЮЫЭЯЩШЬАС—Ј';
  ANSI_CODE := 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюя№ё';
  Result := S;
  for i := 1 to Length(Result) do
    if Pos(Result[i], ANSI_CODE) > 0 then
      Result[i] := KOI8_CODE[Pos(Result[i], ANSI_CODE)];
end;

//-----------------------------------------------------
function SaveStringToFile(aFile: String; Const Str: AnsiString): boolean;
var
  hFile :THANDLE;
  dwWriten: DWORD;
//   FileStream: TFileStream;
begin
  Result := False;
  hFile := CreateFile(PChar(aFile), GENERIC_WRITE, 0, Nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  if (hFile = INVALID_HANDLE_VALUE) then
     Exit;

  if not WriteFile(hFile, Str[1], Length(Str), dwWriten, Nil) Then
     Exit;
  CloseHandle(hFile);
  result := True;
end;
//-----------------------------------------------------
Function ReadFileToString(aFile: String; var sErr:String): AnsiString;
var
  FileRead: TFileStream;
Begin
  sErr:='';
  FileRead:=nil;
  try
    FileRead:=TFileStream.Create(aFile, fmOpenRead or fmShareDenyNone);
  except
    on E:Exception do begin
      sErr:=E.message;
    end;
  end;
  if (FileRead<>nil) and (sErr='') then begin
    SetLength(Result, FileRead.Size);
    FileRead.ReadBuffer(Result[1], FileRead.Size);
    FileRead.Free;
  end;
End;

//------------------------------------------------------------------------------------------
function NodeFromStr(sNode:String; var s:String):String;
var
  sBegin,sEnd:String;
  n1,n2:Integer;
begin
  sBegin:='<'+sNode+'>';
  sEnd:='</'+sNode+'>';
  n1:=Pos(sBegin, s);
  n2:=PosEx(sEnd, s, n1+3);
  if (n1>0) and (n2>0) then begin
    n1:=n1+Length(sBegin);
    Result:=Copy(s,n1,n2-n1);
    if RightStr(Result,2)=#13#10
      then Result:=Copy(Result,1,Length(Result)-2);
  end else begin
    Result:='';
  end;
end;
//-----------------------------
function CountPos(const subtext: string; Text: string): Integer;
begin
  if (Length(subtext) = 0) or (Length(Text) = 0) or (Pos(subtext, Text) = 0) then
    Result := 0
  else
    Result := (Length(Text) - Length(StringReplace(Text, subtext, '', [rfReplaceAll]))) div
      Length(subtext);
end;
//--------------------------------------------
function GetFolderExport: string;
begin
  Result:=NameFromExe('Export');
end;
//--------------------------------------------
function GetFolderMyDocument: string;
var
   ShellMalloc: IMalloc;
   ppidl: PItemIdList;
   sPath,S: string;
   n:Integer;
begin                                         
  ppidl:=nil;
  S:='';
  n:=GlobalTask.ParamAsInteger('FOLDER_MYDOK');
  sPath:=Trim(GlobalTask.ParamAsString('PATH_MYDOK'));
  if (n=0) or (n=1) or (sPath='') then begin
    if n=1 then  begin
      S:=CheckSleshN(ExtractFilePath(Application.ExeName))+'Doc';
      ForceDirectories(S);
    end else begin
      try
        if SHGetMalloc(ShellMalloc)=NOERROR then begin
          SHGetSpecialFolderLocation(0, CSIDL_PERSONAL, ppidl);
          SetLength(S, MAX_PATH);
          if not SHGetPathFromIDList(ppidl, PChar(S)) then begin
            S:='';
          end else begin
            SetLength(S, LStrLen(PChar(S)));
          end;
        end;
      finally
        if ppidl <> nil then begin
          ShellMalloc.Free(ppidl);
        end;
      end;
    end;
  end else begin
    S:=sPath;
    ForceDirectories(S);
  end;
  Result:=S;
end;
//--------------------------------------------------------------
// файл принадлежит базе данных
function IsFileFromBase(sFile:String):Boolean;
var
  sExt:String;
begin
  sExt:=ANSILowerCase(ExtractFileExt(sFile));
  if (sExt='.adt') or (sExt='.adi') or (sExt='.adm') or (sExt='.ai') or (sExt='.am') or (sExt='.add')
    then Result:=true
    else Result:=false;
end;
//--------------------------------------------------------------
function CreateFIO(ds:TDataSet; sPar:String):String;
var
 sAdd,sB,sE,sName,sOtch,sFam:String;
 arr:TArrStrings;
 n:Integer;
begin
  if ds<>nil then begin
    sName:='NAME';
    sOtch:='OTCH';
    sFam:='FAMILIA';
    if sPar<>'' then begin
      sB:='';
      sE:='';
      sAdd:='';
      n:=Pos('#',sPar);
      if n>0 then begin
        sAdd:=Copy(sPar,n+1,Length(sPar));
        sPar:=Copy(sPar,1,n-1);
      end;
      if Pos(';',sPar)>0 then begin
        strToArr(sPar,arr,';',false);
        if Length(arr)=4 then begin // !!!   'ON_;B;DO;E'
          if SameText(arr[1],'B') then begin
            sB:=arr[0];
            sE:=arr[2];
          end else begin
            sB:=arr[2];
            sE:=arr[0];
          end;
        end else begin             // !!!   'ON_;B'(или 'ON_')  или  'POSLE;E'
          SetLength(arr,2);
          if SameText(arr[1],'E') then begin
            sB:='';
            sE:=arr[0];
          end else begin
            sB:=arr[0];
            sE:='';
          end;
        end;
      end else begin
        sB:=sPar;
        sE:='';
      end;
      sName:=sB+'NAME'+sE;
      sOtch:=sB+'OTCH'+sE;
      sFam :=sB+'FAMILIA'+sE;
    end;
    if sAdd='' then begin
      Result:=Trim(ds.FieldbyName(sFam).AsString)+' '+Trim(ds.FieldbyName(sName).AsString)+' '+
              Trim(ds.FieldbyName(sOtch).AsString);
    end else begin
      Result:=GetPadegFIO3(Trim(ds.FieldbyName(sFam).AsString),Trim(ds.FieldbyName(sName).AsString),Trim(ds.FieldbyName(sOtch).AsString),
                           Copy(sAdd,1,1){POL},Copy(sAdd,2,1){PADEG});
    end;
  end else begin
    Result:='';
  end;
end;

function EnabledCorr_SprDocSubjG:Boolean;
begin
  Result:=GlobalTask.ParamAsBoolean('CORR_DOCSUBJG');
end;


function FindServers:Boolean;
var
  hTable,hConn:ADSHANDLE;
  ulRet : UNSIGNED32;
  usIsEOF: UNSIGNED16;
  ulLen : UNSIGNED32;
  pcField : PAnsiChar;
  s,ss:String;
  n:Integer;
  port:SmallInt;
begin
  Result:=true;
//ADS_FS_MULTICAST_ONLY (0x01): Perform only the initial portion of the enumeration process. The list of servers is gathered via multicast over UDP. The only information returned is the IP address and port number. If the server is v10 or greater, the server name will also be returned.
//ADS_FS_CONNECT_ALL (0x02):  Attempt to connect to all server addresses discovered by the multicast operation. This may include addresses that are not reachable through a normal connect call (e.g., an address that is local to the machine and cannot be reached from the network). If there are a large number of addresses returned, this may result in very slow performance from the API due to timeout delays on each connect attempt.
//If no options are provided (e.g., ADS_DEFAULT or 0 is specified), the default behavior is to attempt to connect to addresses that are the same as the multicast response address. One situation in which this might not gather all desired information is if, for example, Advantage Database Server is bound to one address on a multihomed machine and the multicast response is returned from a different address. In this situation, it would be necessary to use the ADS_FS_CONNECT_ALL option.
  ulRet := AdsFindServers( ADS_DEFAULT, @hTable );
  if (ulRet=AE_SUCCESS ) then begin
      ss:='';
    AdsGotoTop( hTable );
    AdsAtEof( hTable, @usIsEOF );
    n:=0;
    while usIsEOF=0 do begin
//        StrPLCopy( 'Multicast Addr', AnsiString( strFieldName ), ADS_MAX_FIELD_NAME );
      //utilStrPLCopy( acFieldName, AnsiString( strFieldName ), ADS_MAX_FIELD_NAME );
//      AdsGetShort  AdsGetLong    AdsGetField
       AdsGetShort(hTable,'Port',@port);
       AdsGetDataLength( hTable, 'Multicast Addr', ADS_BYTE_LENGTH, @ulLen );
       pcField:=PAnsiChar( StrAlloc( ulLen ) );
       AdsGetString( hTable, 'Multicast Addr', pcField, @ulLen, ADS_NONE);
       s:=StrPas(pcField);
       ss:=ss+' | '+trim(s)+'('+inttostr(port)+')';

      inc(n,1);
      AdsSkip(hTable,1);
      AdsAtEof( hTable, @usIsEOF );
    end;
    showmessage(inttostr(n)+'  '+ss);

    // connect to current working directory
    ulRet := AdsConnect60( '.', ADS_LOCAL_SERVER, nil, nil,
                          ADS_DEFAULT, @hConn );
    if ( ulRet = AE_SUCCESS ) then begin
      ulRet := AdsCopyTable( hTable, ADS_IGNOREFILTERS,'findads.adt' );
      AdsDisconnect( hConn );
    end;
  end;
  ulRet := AdsCloseTable( hTable );
end;
//----------------------------------------------------
function CheckSeriaSvid(sSeria:String):Boolean;
var
  n:Integer;
begin
  Result:=false;
  n:=Pos('-',sSeria);
  if n>0 then begin
    if IsAllSimRim(Copy(sSeria,1,n-1)) and
       IsAllSimRus(Copy(sSeria,n+1,Length(sSeria)), true)
      then Result:=true;
  end;
end;
//----------------------------------------------------
function IsAllSimRim(s:String):Boolean;
var
  i:Integer;
begin
  Result:=true;
  for i:=1 to Length(s) do begin
    if Pos( s[i], 'IXVLCDM')=0 then begin
      Result:=false;
    end;
  end;
end;
//----------------------------------------------------
function IsAllSimRus(s:String; lAllUpper:Boolean):Boolean;
var
  i:Integer;
  ss:String;
const
  Rus_CODE='АБВГДЕЖЗИКЛМНОПРСТУФХЦЧШЩЭЮЯ'; // ЫЁЪЬЙ  белорусская I ???
begin
  Result:=true;
  if lAllUpper then begin
    for i:=1 to Length(s) do begin
      if Pos( s[i], Rus_CODE)=0 then begin
        Result:=false;
        break;
      end;
    end;
  end else begin
    ss:=ANSILowerCase(Rus_CODE);
    for i:=1 to Length(s) do begin
      if (Pos(s[i], Rus_CODE)=0) and (Pos(s[i], ss)=0) then begin
        Result:=false;
        break;
      end;
    end;
  end;
end;
//----------------------------------------------------------
function addToXMLField(fld:TField; sField:String; vValue:Variant; sType:String):Boolean;
var
  s:String;
  XMLDoc:TNativeXML;
  nd,ndnew:TXMLNode;
const
  sZag='<?xml version="1.0" encoding="UTF-8"?>'#13#10'<DATASETS VERSION="1">'#13#10'  <DOKUMENT ONE_RECORD="1" RECORD_COUNT="1">'#13#10;
  sEnd='  </DOKUMENT>'#13#10'</DATASETS>';
begin
  Result:=true;
  s:=fld.AsString;
  if s='' then begin
    fld.AsString:=sZag+'    <'+sField+'>'+VartoStr(vValue)+'</'+sField+'>'#13#10+sEnd;
  end else begin
    XMLDoc:=TNativeXML.Create;
    XMLDoc.ReadFromString(AnsiToUtf8(s));
    XMLDoc.Root.Name:='DATASETS';
    XMLDoc.XmlFormat:=xfReadable;
    nd:=XMLDoc.Root.FindNode('DOKUMENT');
    if nd<>nil then begin
      ndnew:=nd.FindNode(AnsiToUtf8(sField));
      if ndnew=nil
        then ndnew:=nd.NodeNew(AnsiToUtf8(sField));
//            case fld.DataType of
//              ftString   : node.ValueAsString:=AnsiToUtf8(fld.AsString);
      ndnew.ValueAsString:=AnsiToUtf8(VarToStr(vValue));
      fld.AsString:=Utf8ToAnsi(XMLDoc.WriteToString);
    end else begin
      Result:=false;
    end;
    XMLDoc.Free;
  end;
end;
//----------------------------------------------------------
function getFieldFromSL(sValue:String; sField:String; sType:String):Variant;
var
 k,n,m: Integer;  
begin
  k:=Length(Trim(sField));
  n:=Pos(Trim(sField)+'=',sValue);
  if n>0 then begin
    m:=PosEx(#13#10,sValue,n);
    if m>0
     then Result:=Copy(sValue,n+k+1,m-n-k-1)
     else Result:=Copy(sValue,n+k+1,Length(sValue));
  end else begin
    Result:='';
  end;
  if (sType<>'') and (sType<>'S') and (sType<>'C') then begin
    if sType='D' then begin
      try
        Result:=STOD(Result,tdAds)
      except
        Result:=0;
      end;
    end else if sType='DC' then begin
      Result:=STOD(Result,tdClipper)
    end else if (sType='L') or (sType='B') then begin
      if Result='1'
        then Result:=true
        else Result:=false;
    end else if (sType='I') or (sType='N') then begin
      Result:=StrToIntDef(Result,0);
    end else if (sType='F') or (sType='N') then begin
      Result:=StrToFloatDef(Result,0);
    end;
  end;
end;
// требуется отправка опеки в регистр  исп-ся:  fGurnZOpeka, fChVigrOpeka
function Opeka_RequiredSendToGISRN:String;
begin
  Result:='date_edit_gis>date_post_gis or pole_grn<1000 or Empty(pole_grn) or (pole_grn>=2000 and pole_grn<3000)';
end;
//-----------------------------------------------
function ce_fio(s:String):String;
begin
  if (s='-') or (s='--') or (s='---')
    then Result:=''
    else Result:=ANSIUpperCase(s);
end;
// замена <CRLF>  на #13#10
function crlf_create(var s:String):Boolean;
begin
  if Pos('<CRLF>',s) > 0 then begin
    Result:=true;
    s:=StringReplace(s,'<CRLF>',CRLF,[rfReplaceAll, rfIgnoreCase]);
  end else begin
    Result:=false;
  end;
end;
// замена #13#10 на <CRLF>
function crlf_delete(var s:String):Boolean;
begin
  if Pos(CRLF,s) > 0 then begin
    Result:=true;
    s:=StringReplace(s,CRLF,'<CRLF>',[rfReplaceAll, rfIgnoreCase]);
  end else begin
    Result:=false;
  end;
end;

function SetPosForm(f:TForm; sPos:String):Boolean;
var
  i:Integer;
  arr:TArrStrings;
  arrInt: array[0..4] of Integer;
begin
  Result:=false;
  if sPos<>'' then begin
    StrToArr(sPos,arr,',',false);
    if Length(arr)=5 then begin
      for i:=0 to 4 do begin
        arrInt[i]:=StrToIntDef(arr[i],0);
        if arrInt[i]=0 then
      end;
      if (arrInt[0]>0) and (arrInt[3]>0) and (arrInt[4]>0)
        then Result:=true;
      if Result then begin
        if arrInt[0]=2
          then f.WindowState:=wsMaximized
          else f.WindowState:=wsNormal;
        if f.WindowState=wsNormal then begin
          f.Left:=arrInt[1];
          f.Top:=arrInt[2];
          f.Width:=arrInt[3];
          f.Height:=arrInt[4];
        end;
      end;
    end;
  end;
end;

function GetPosForm(f:TForm):String;
begin
  if f.WindowState=wsMaximized
    then Result:='2,'
    else Result:='1,';
  Result:=Result+IntToStr(f.Left)+','+IntToStr(f.Top)+','+IntToStr(f.Width)+','+IntToStr(f.Height);
end;
//-------------------------------------
function NameFileParams(sIdProg:String; nTypeFile:Integer):String;
begin
  Result:='';
  if (sIdProg='SELSOVET') or (sIdProg='LAIS') then begin
    Result:='Parameters.tsk';
  end else if sIdProg='ZAGS' then begin
    Result:='ParamZags.tsk';
  end else if sIdProg='POST' then begin
    Result:='ParamPost.tsk'
  end else if sIdProg='ZAH' then begin
    Result:='ParamZah.tsk'
  end else if sIdProg='OPEKA' then begin
    Result:='ParamOpeka.tsk'
  end else if sIdProg='GKH' then begin
    Result:='ParamGKH.tsk';
  end else if sIdProg='OCHERED' then begin
    Result:='ParamOchered.tsk';
  end;
end;
//-------------------------------------
procedure FlashTrayApp;
var
  fl : FLASHWINFO;
begin
  fl.cbSize := sizeof(FLASHWINFO);
  fl.dwTimeout := 400;
  fl.hwnd :=  Application.Handle;
  fl.uCount := 0;
  fl.dwFlags:= FLASHW_TRAY+FLASHW_TIMERNOFG;
  FlashWindowEx(fl);
end;
//-------------------------------------
function Name_Tail:String;
begin
  if sNameTail='' then begin
    sNameTail:=GlobalTask.ParamAsString('NAME_TAIL');
  end;
  if sNameTail='' then begin
    sNameTail:='доля';
  end;
  Result:=sNameTail;
end;
//-------------------------------------
function getNameProgram:String;
begin
  {$IFDEF ZAGS}
    Result:='ЗАГС';
  {$ENDIF}
  {$IFDEF OCHERED}
    Result:='Очередники';
  {$ENDIF}
  {$IFDEF LAIS}
    Result:='ЛАИС+';
  {$ENDIF}
  {$IFDEF GKH}
    Result:='ЖКХ';
  {$ENDIF}
  {$IFDEF POST}
    Result:='ЛАИС.СМДО';
  {$ENDIF}
end;

initialization
  sNameTail:='';
  DirFTP:='';
  TypeServerFTP:=SERVER_BREST;  // vc.brest.by
  SetLength(ArrPrazd,0);
  SetLength(ArrPasxa,0);
//  strTypeBase:='';

end.
