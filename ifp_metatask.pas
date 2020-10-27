unit ifp_metatask;

{$I Task.inc}

{$IFDEF RO_SCRIPT}
  {$I PascalScript.inc}
{$ELSE}
  {$I ifps3_def.inc}
{$ENDIF}

interface

uses
  fParamQuest, MetaTask, Math, FuncPr, sysutils, uDate, OpisEdit, QStrings, NewDialogs,
{$IFDEF UPDATEPROG}
   dBaseConf, dbFunc, uProjectAll,
{$ELSE}
   dBase, uProject, uProjectAll, dbFunc,
{$ENDIF}
{$IFDEF RO_SCRIPT}
  uPSRunTime,uPSCompiler,uPSUtils,uPSComponent;
{$ELSE}
  ifps3, ifpscomp, ifps3utl;
{$ENDIF}

{$IFDEF RO_SCRIPT}
type
  TIFPSPascalCompiler = TPSPascalCompiler;
  TIFPS3CompExec = TPSScript;
{$ENDIF}

procedure SIRegister_MetaTask(Cl: TIFPSPascalCompiler);
procedure RIRegister_MetaTask(Cl: TIFPSRuntimeClassImporter);

procedure RegisterMetaTaskLibrary_C(S: TIFPSPascalCompiler);
procedure RegisterMetaTaskLibrary_R(S: TIFPSExec);

implementation

uses StrUtils;

//uses

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

function _CheckPathBase(s:String):String;
var
  n:Integer;
begin
  if Lowercase(RightStr(s,4))='.add' then begin
    n:=Max(LastPos('\',s),LastPos('/',s));
    s:=Copy(s,1,n);
  end;
  Result:=CheckSleshN(s);
end;

{$IFDEF UPDATEPROG}

function LoadSQLFromFile(strName:String):String;
begin
  Result:=dmBaseConf.LoadSQLEx(strName);
end;

function GetPathConnect:String;
begin
  Result:=_CheckPathBase(dmBaseConf.GlobalPar.ConnectPath); // AdsConnection.ConnectPath
end;
function GetPathSharedConnect:String;
begin
  Result:=_CheckPathBase(dmBaseConf.GlobalPar.SharedConnectPath); // AdsConnection.ConnectPath
end;

//---------------------------------------------------------------------
function CheckNamePunkt(strValue:String) : String;
var
  i,j : Integer;
  s,ss : String;
const
  arrt : array[1..25] of string=('г','д','с','гп','пгт','рп','кп','п','нп','х','м','рзд','ст','ж\д','сан','в/ч','аг','урочище','аул','сл','станица','порт','снп','вг','оп');
begin
  Result := '';
  strValue:=Trim(strValue);
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
  arrt : array[1..18] of string=('г','в','с','гп','пгт','пп','кп','п','нп','х','м','рзд','ст','ч\с','сан','в/ч','аг','урочище');
begin
  Result := '';
  strValue:=Trim(strValue);
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

function SysQuery(sText: String): String;
var
  lAds10:Boolean;
begin
  if Copy(dmBaseConf.WorkTable.Version,1,1)='8'
    then lAds10:=false
    else lAds10:=true;
  Result:=CheckSysView(sText,lAds10);
//    then Result:=sText
//    else Result:=StringReplace(sText, 'system.', 'system.ansi_',[rfReplaceAll,rfIgnoreCase]);
end;


{$ELSE}

function LoadSQLFromFile(strName:String):String;
begin
  Result:=dmBase.LoadSQLEx(strName);
end;

function GetPathConnect:String;
begin
  Result:=_CheckPathBase(dmBase.GlobalPar.ConnectPath); // AdsConnection.ConnectPath
end;
function GetPathSharedConnect:String;
begin
  Result:=_CheckPathBase(dmBase.GlobalPar.SharedConnectPath); // AdsConnection.ConnectPath
end;

{$ENDIF}

function ValueFromKey( NameList : String; strKey : String; strType : String; lPlusValue : Boolean) : String;
var
  ListOpis : TListOpisEdit;
  lKrat : Boolean;
begin
  Result := '';
  ListOpis := GlobalTask.CurrentOpisEdit;
  if (Trim(strKey)<>'') and (ListOpis<>nil) then begin
    if (Copy(strType,1,1)='К') or (Copy(strType,1,1)='K')
      then lKrat:=true
      else lKrat:=false;
    Result := ListOpis.SeekValue(NameList, strKey, lKrat);
    if lPlusValue and (Result<>'') then begin
      Result := strKey+' - '+Result;
    end;
  end;
end;

procedure SIRegisterGlobalTask(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TOBJECT'), 'TMETATASK') do
  begin
//    RegisterProperty('ALLOWALLUP', 'BOOLEAN', iptrw);
//    RegisterProperty('ONCLICK', 'TNotifyEvent', iptrw);
//    RegisterMethod('constructor CREATENEW(AOWNER:TCOMPONENT; Dummy: Longint)');
    RegisterMethod('function GetPathService:STRING');
    RegisterMethod('function GetPathServiceMain:STRING');
    RegisterMethod('procedure SAVEPARAMETERS');
    RegisterMethod('function WRITEPARAMASSTRING( strName : STRING; strValue:STRING):BOOLEAN');
    RegisterMethod('function WRITEPARAMASDATE( strName : STRING; dDate:TDateTime):BOOLEAN');
    RegisterMethod('function PARAMASSTRING( strName : STRING):STRING');
    RegisterMethod('function PARAMASINTEGER( strName : STRING):INTEGER');
    RegisterMethod('function PARAMASFLOAT( strName : STRING):EXTENDED');
    RegisterMethod('function PARAMASBOOLEAN( strName : STRING):BOOLEAN');
    RegisterMethod('function PARAMASNAME( strName : STRING; lKrat : BOOLEAN):STRING');
    RegisterMethod('function PARAMASDATE( strName : STRING):TDATETIME');
    RegisterProperty('CURRENTDATE', 'TDATETIME', iptrw);

    RegisterMethod('function GETVALSTR( strName : STRING):STRING');
    RegisterMethod('procedure SETVALSTR( strName : STRING; strVal : String);');

    RegisterMethod('function GETLASTVALUEASSTRING( strName : STRING):STRING');
    RegisterMethod('procedure SETLASTVALUEASSTRING( strName : STRING; strVal : String);');
    RegisterMethod('function GETLASTVALUEASINTEGER( strName : STRING):Integer');
    RegisterMethod('procedure SETLASTVALUEASINTEGER( strName : STRING; strVal : Integer);');
    RegisterMethod('function GETLASTVALUEASDATE( strName : STRING):TDateTime');
    RegisterMethod('procedure SETLASTVALUEASDATE( strName : STRING; strVal : TDateTime);');
    RegisterMethod('function GETLASTVALUEASBOOLEAN( strName : STRING):Boolean');
    RegisterMethod('procedure SETLASTVALUEASBOOLEAN( strName : STRING; strVal : Boolean);');
    RegisterMethod('procedure PREVIEWREPORT( strName : STRING);');
    RegisterMethod('procedure DesignTailReport( strName : STRING);');
    RegisterMethod('procedure PRINTREPORT( strName : STRING);');
    RegisterMethod('procedure WorkReport(lDesign:Boolean; strName : STRING);');
    RegisterMethod('procedure SETWORKPARAM( strName : STRING; vVal : Variant);');
    RegisterMethod('function  GETWORKPARAM( strName : STRING) : Variant');
    RegisterMethod('function  GETNOMEREKZ : Integer');
    RegisterMethod('procedure REPORT_SETCOUNTEKZ( n : Integer)');
    RegisterMethod('procedure REPORT_SETDUPLEXMODE( sMode : String)');

    RegisterMethod('function GetMainParam(sSect,sName:String; sType:String; vDef:Variant): Variant;');
    RegisterMethod('function SetMainParam(sSect,sName,sType:String; vVal:Variant): Boolean;');
    RegisterMethod('procedure WriteToLogFile(sSoob:String; slPar:TStringList);');

    RegisterMethod('function GetReportID: Integer;');
    RegisterMethod('procedure SetReportID(nID: Integer);');

    {$IFNDEF UPDATEPROG}
    RegisterMethod('procedure SetCurIdBase(n:Integer)');
    RegisterMethod('function GetCurIdBase:Integer');
    RegisterMethod('function AddWhereCurIdBase(sWhere:String; cAl:String):String');
    {$ENDIF}
  end;
end;

procedure SIRegisterfmParamQuest(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TFORM'), 'TFMPARAMQUEST') do
  begin
    RegisterMethod('procedure ADDPARAMEX( Value : Variant; strCaption : String; strKod : String; strParam : String);');
    RegisterMethod('procedure ADDPARAM(strKod : String; strCaption : String; strParam : String);');
    RegisterMethod('procedure ADDBUTTONS( strButtons : String; nESC : Integer);');
    RegisterMethod('procedure SETVALUE( strKod : String; Value : Variant);');
    RegisterMethod('function GETVALUE( strKod : String; strType : String) : Variant);');
    RegisterMethod('function GETVALUEASTEXT(strKod : String) : String);');
    RegisterMethod('procedure SETVALUEN( n : Integer; Value : Variant);');
    RegisterMethod('function GETVALUEN( n : Integer) : Variant);');
    RegisterMethod('function PARAMCOUNT : Integer);');
    RegisterMethod('function SHOWQUEST : Integer;');
    RegisterProperty('STEPY', 'INTEGER', iptrw);
    RegisterProperty('FLAT', 'BOOLEAN', iptrw);
    RegisterProperty('ALLREQUIRED', 'BOOLEAN', iptrw);
  end;
end;

procedure SIRegister_MetaTask(Cl: TIFPSPascalCompiler);
begin
//  Cl.Se.AddTypeS('TButtonStyle', '(bsAutoDetect, bsWin31, bsNew)');
//  Cl.Se.AddTypeS('TBitBtnKind', '(bkCustom, bkOK, bkCancel, bkHelp, bkYes, bkNo, bkClose, bkAbort, bkRetry, bkIgnore, bkAll)');
//  cl.se.AddConstantN('crNo', 'Integer')^.Value.ts32 := -18;
//  cl.se.AddTypeS('TKeyEvent', 'procedure(Sender: TObject; var Key: Word; Shift: Byte);');
  SIRegisterGlobalTask(Cl);
  SIRegisterfmParamQuest(Cl);
end;

procedure METATASK_CURRENTDATE_W(Self : TMetaTask; d : TDateTime); begin Self.CurrentDate:=d; end;
procedure METATASK_CURRENTDATE_R(Self : TMetaTask; var d : TDateTime); begin d:=Self.CurrentDate; end;

procedure RIRegisterGlobalTask(Cl: TIFPSRuntimeClassImporter);
begin
  with Cl.Add(TMetaTask) do
  begin

    RegisterMethod(@TMetaTask.GetPathService, 'GETPATHSERVICE');
    RegisterMethod(@TMetaTask.GetPathServiceMain, 'GETPATHSERVICEMAIN');

    RegisterMethod(@TMetaTask.SaveParameters, 'SAVEPARAMETERS');
    RegisterMethod(@TMetaTask.WriteParamAsString, 'WRITEPARAMASSTRING');
    RegisterMethod(@TMetaTask.WriteParamAsDate, 'WRITEPARAMASDATE');

    RegisterMethod(@TMetaTask.ParamAsString, 'PARAMASSTRING');
    RegisterMethod(@TMetaTask.ParamAsInteger, 'PARAMASINTEGER');
    RegisterMethod(@TMetaTask.ParamAsBoolean, 'PARAMASBOOLEAN');
    RegisterMethod(@TMetaTask.ParamAsName, 'PARAMASNAME');
    RegisterMethod(@TMetaTask.ParamAsDate, 'PARAMASDATE');
    RegisterMethod(@TMetaTask.ParamAsFloat, 'PARAMASFLOAT');

    RegisterMethod(@TMetaTask.GetLastValueAsString, 'GETVALSTR');
    RegisterMethod(@TMetaTask.SetLastValueAsString, 'SETVALSTR');

    RegisterMethod(@TMetaTask.GetLastValueAsString, 'GETLASTVALUEASSTRING');
    RegisterMethod(@TMetaTask.SetLastValueAsString, 'SETLASTVALUEASSTRING');
    RegisterMethod(@TMetaTask.GetLastValueAsInteger, 'GETLASTVALUEASINTEGER');
    RegisterMethod(@TMetaTask.SetLastValueAsInteger, 'SETLASTVALUEASINTEGER');
    RegisterMethod(@TMetaTask.GetLastValueAsDate, 'GETLASTVALUEASDATE');
    RegisterMethod(@TMetaTask.SetLastValueAsDate, 'SETLASTVALUEASDATE');
    RegisterMethod(@TMetaTask.GetLastValueAsBoolean, 'GETLASTVALUEASBOOLEAN');
    RegisterMethod(@TMetaTask.SetLastValueAsBoolean, 'SETLASTVALUEASBOOLEAN');

    RegisterMethod(@TMetaTask.SetWorkParam, 'SETWORKPARAM');
    RegisterMethod(@TMetaTask.GetWorkParam, 'GETWORKPARAM');

    RegisterMethod(@TMetaTask.SetMainParam, 'SETMAINPARAM');
    RegisterMethod(@TMetaTask.GetMainParam, 'GETMAINPARAM');

    RegisterMethod(@TMetaTask.WriteToLogFile,'WRITETOLOGFILE');

    RegisterMethod(@TMetaTask.GetReportID, 'GETREPORTID');
    RegisterMethod(@TMetaTask.SetReportID, 'SETREPORTID');

    RegisterMethod(@TMetaTask.Report_SetCountEkz, 'REPORT_SETCOUNTEKZ');
    RegisterMethod(@TMetaTask.Report_SetDuplexMode, 'REPORT_SETDUPLEXMODE');
    RegisterMethod(@TMetaTask.GetNomerEkz, 'GETNOMEREKZ');

    RegisterMethod(@TMetaTask.PreviewReport, 'PREVIEWREPORT');
    RegisterMethod(@TMetaTask.DesignTailReport, 'DESIGNTAILREPORT');
    RegisterMethod(@TMetaTask.WorkReport, 'WORKREPORT');
    RegisterMethod(@TMetaTask.PrintReport, 'PRINTREPORT');

    RegisterPropertyHelper(@METATASK_CURRENTDATE_R, @METATASK_CURRENTDATE_W, 'CURRENTDATE');
    {$IFNDEF UPDATEPROG}
    RegisterMethod(@TMetaTask.SetCurIdBase, 'SETCURIDBASE');
    RegisterMethod(@TMetaTask.GetCurIdBase, 'GETCURIDBASE');
    RegisterMethod(@TMetaTask.AddWhereCurIdBase, 'ADDWHERECURIDBASE');
    {$ENDIF}

  end;
end;

procedure FMPARAMQUEST_STEPY_W(Self: TfmParamQuest; T: INTEGER); begin Self.StepY := T; end;
procedure FMPARAMQUEST_STEPY_R(Self: TfmParamQuest; var T: INTEGER); begin T := Self.StepY; end;

procedure FMPARAMQUEST_FLAT_W(Self: TfmParamQuest; T: Boolean); begin Self.Flat := T; end;
procedure FMPARAMQUEST_FLAT_R(Self: TfmParamQuest; var T: Boolean); begin T := Self.Flat; end;

procedure FMPARAMQUEST_ALLREQUIRED_W(Self: TfmParamQuest; T: Boolean); begin Self.ALLREQUIRED := T; end;
procedure FMPARAMQUEST_ALLREQUIRED_R(Self: TfmParamQuest; var T: Boolean); begin T := Self.ALLREQUIRED; end;

procedure RIRegisterfmParamQuest(Cl: TIFPSRuntimeClassImporter);
begin
  with Cl.Add(TfmParamQuest) do
  begin
    RegisterMethod(@TfmParamQuest.AddParamEx, 'ADDPARAMEX');
    RegisterMethod(@TfmParamQuest.AddParam, 'ADDPARAM');
    RegisterMethod(@TfmParamQuest.AddButtons, 'ADDBUTTONS');
    RegisterMethod(@TfmParamQuest.ParamCount, 'PARAMCOUNT');
    RegisterMethod(@TfmParamQuest.SetValue, 'SETVALUE');
    RegisterMethod(@TfmParamQuest.GetValue, 'GETVALUE');
    RegisterMethod(@TfmParamQuest.GetValueAsText, 'GETVALUEASTEXT');
    RegisterMethod(@TfmParamQuest.SetValueN, 'SETVALUEN');
    RegisterMethod(@TfmParamQuest.GetValueN, 'GETVALUEN');
    RegisterMethod(@TfmParamQuest.ShowQuest, 'SHOWQUEST');
    RegisterPropertyHelper(@FMPARAMQUEST_STEPY_R, @FMPARAMQUEST_STEPY_W, 'STEPY');
    RegisterPropertyHelper(@FMPARAMQUEST_FLAT_R, @FMPARAMQUEST_FLAT_W, 'FLAT');
    RegisterPropertyHelper(@FMPARAMQUEST_ALLREQUIRED_R, @FMPARAMQUEST_ALLREQUIRED_W, 'ALLREQUIRED');
  end;
end;

procedure RIRegister_MetaTask(Cl: TIFPSRuntimeClassImporter);
begin
  RIRegisterGlobalTask(Cl);
  RIRegisterfmParamQuest(Cl);
end;


procedure RegisterMetaTaskLibrary_C(S: TIFPSPascalCompiler);
begin
  S.AddTypeS('TQDlgType', '(qtWarning, qtError, qtInformation, qtConfirmation, qtCustom)');
  s.AddDelphiFunction('function Question( Msg : string; const strButtons : String;'+
      'strCaption : String; nDefaultButton : Integer; nCancelButton : Integer;'+
      ' DlgType : TQDlgType; HelpCtx: Longint) : Integer;');

  s.AddDelphiFunction('function GetVozrast(nCount : Integer; lShowEmpty : Boolean) : String;');
  s.AddDelphiFunction('function GetCountYear( d1 : TDateTime; d2 : TDateTime) : Integer;');
  s.AddDelphiFunction('function GetDaysPropis( d : TDateTime; strLang : String ) : String;');
  s.AddDelphiFunction('function GetMonthPropis( d : TDateTime; strLang : String ) : String;');
  s.AddDelphiFunction('function GetYearPropis( d : TDateTime; strLang : String ) : String;');

  s.AddDelphiFunction('function CheckNamePunkt(strValue:String) : String;');
  s.AddDelphiFunction('function CheckNamePunktB(strValue:String) : String;');
  s.AddDelphiFunction('function SysQuery(sText:String) : String;');
  s.AddDelphiFunction('function LockOperation_(nTypeOper:Integer; strOper:String):Boolean;');
  s.AddDelphiFunction('procedure UnLockOperation_(nTypeOper:Integer);');

  s.AddDelphiFunction('function ValueFromKey(NameList:String; strKey:String; strType:String; lPlusValue:Boolean) : String;');
  s.AddDelphiFunction('function SubDateYear(d2,d1 : TDateTime) : Integer;');
  s.AddDelphiFunction('function SubDateMonth(d2,d1 : TDateTime) : Integer;');
  s.AddDelphiFunction('function SubDateDay(d2,d1 : TDateTime) : Integer;');

  s.AddDelphiFunction('function Int2DataSet(n:Integer) : TDataSet;');
  s.AddDelphiFunction('function Int2Form(n:Integer) : TForm;');

  s.AddDelphiFunction('function GetPathConnect : String;');
  s.AddDelphiFunction('function GetPathSharedConnect : String;');

  s.AddDelphiFunction('function LoadSQLFromFile(strName:String):String;');

  s.AddDelphiFunction('function Q_GetWordN(OrdN:Integer; S:String; Delimiters:string): string;');
  s.AddDelphiFunction('function Q_DelChars(S: string; Chars: string):String;');
  s.AddDelphiFunction('function Q_KeepChars(S: string; Chars: string):String;');

  s.AddDelphiFunction('function addToXMLField(fld:TField; sField:String; vValue:Variant; sType:String):Boolean;');

end;

function Q_DelChars2(S: string; Chars: string):String;
begin
  Q_DelChars(S, Chars);
  Result:=S;
end;
function Q_KeepChars2(S: string; Chars: string):String;
begin
  Q_KeepChars(S, Chars);
  Result:=S;
end;

procedure RegisterMetaTaskLibrary_R(S: TIFPSExec);
begin
  s.RegisterDelphiFunction(@Question, 'QUESTION', cdRegister);
  s.RegisterDelphiFunction(@GetVozrast, 'GETVOZRAST', cdRegister);
  s.RegisterDelphiFunction(@GetCountYear, 'GETCOUNTYEAR', cdRegister);
  s.RegisterDelphiFunction(@GetDaysPropis, 'GETDAYSPROPIS', cdRegister);
  s.RegisterDelphiFunction(@GetMonthPropis, 'GETMONTHPROPIS', cdRegister);
  s.RegisterDelphiFunction(@GetYearPropis, 'GETYEARPROPIS', cdRegister);

  s.RegisterDelphiFunction(@CheckNamePunkt, 'CHECKNAMEPUNKT', cdRegister);
  s.RegisterDelphiFunction(@CheckNamePunktB, 'CHECKNAMEPUNKTB', cdRegister);
  s.RegisterDelphiFunction(@SysQuery, 'SYSQUERY', cdRegister);
  s.RegisterDelphiFunction(@LockOperation_, 'LOCKOPERATION_', cdRegister);
  s.RegisterDelphiFunction(@UnLockOperation_, 'UNLOCKOPERATION_', cdRegister);

  s.RegisterDelphiFunction(@ValueFromKey, 'VALUEFROMKEY', cdRegister);
  s.RegisterDelphiFunction(@SubDateYear, 'SUBDATEYEAR', cdRegister);
  s.RegisterDelphiFunction(@SubDateMonth, 'SUBDATEMONTH', cdRegister);
  s.RegisterDelphiFunction(@SubDateDay, 'SUBDATEDAY', cdRegister);

  s.RegisterDelphiFunction(@Int2DataSet, 'INT2DATASET', cdRegister);
  s.RegisterDelphiFunction(@Int2Form, 'INT2FORM', cdRegister);

  s.RegisterDelphiFunction(@GetPathConnect, 'GETPATHCONNECT', cdRegister);
  s.RegisterDelphiFunction(@GetPathSharedConnect, 'GETPATHSHAREDCONNECT', cdRegister);
  s.RegisterDelphiFunction(@LoadSQLFromFile, 'LOADSQLFROMFILE', cdRegister);

  s.RegisterDelphiFunction(@Q_GetWordN,'Q_GETWORDN', cdRegister);
  s.RegisterDelphiFunction(@Q_DelChars2,'Q_DELCHARS', cdRegister);
  s.RegisterDelphiFunction(@Q_KeepChars2,'Q_KEEPCHARS', cdRegister);

  s.RegisterDelphiFunction(@addToXMLField, 'ADDTOXMLFIELD', cdRegister);
end;

end.




