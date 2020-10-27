unit uSMDO;

interface                                            

{$I Task.inc}                               

uses Windows, Messages, Classes,Forms, Controls, SysUtils, Variants, Contnrs, db, NativeXML, dbFunc, SasaIniFile, RKP, Math, mMD5,
     TasksEx, AsyncCalls,
     synacode, synachar, mimeinln, blcksock,   // Synapse
     mimemess, mimepart, {smtpsend, pop3send,} {ssl_openssl,} synautil,
     uAvest, EncdDecd, uUtilFiles, AvCryptMail,
     {$IFDEF EMAIL_INDY}
     //  IdMessage, IdSocks, IdMessageClient, IdSMTP, IdPOP3,
//       IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL,
//       IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdException,
       IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, IdSocks, IdSMTP, IdException,
       IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
       IdMessageClient, IdPOP3, IdCoder, IdCoder3to4, IdCoderMIME, IdHTTP,
     {$ENDIF}
     ComCtrls,
     kbmMemTable, adsdata, Dialogs, fWarning, uTypes, uProject, OpisEdit, uProjectAll, MetaTask, ifpii_dbfunc, mPermit,
     FuncPr, uDataSet2XML, fmProgress;

const
// Программный комплекс «ЛАИС.СМДО»
   SEDVALUE_LAIS='2ec937bf-b89a-4d01-b4d3-355e220e32ff';

   SEDNAME_DELO='Делопроизводство ЦИТ Нацстата';
   SEDVALUE_DELO='b3e3e697-d931-4a76-9edd-dafeda0c5526';

   // обновление СОС
   RF_COC_NOT=0;       // не обновлять
   RF_COC_RECEIVE=1;   // перед получением почты
   RF_COC_START=2;     // при старте пртограммы

   date_new_parser='2017-10-01';

   org_marsh='SMDO_DISPATCHER';   // МАРШРУТИЗАТОР
   org_pkinci='pkinci';           // ПК НСИ НЦЭУ СМДО    обрабатывать сообщения об обновлении справочников

   error_load_etsp='Библиотека для работы с ЭЦП не загружена';

   id_dict_org='bd3141f9-aed3-4f62-a74c-8a093a0b2ba9';
   id_dict_viddok='b774521b-c2db-44ea-8118-244cbc07ab00';
   SMDO_SPR_ORG=0;
   SMDO_SPR_VIDDOK=1;
//   VERSION_SYSTEM_SMDO='версия 1.0';

  // 'AB957A02-43D9-4674-9806-368412132F41';
  PPP_CONST='bd3141f9aed34f62a74c8a093a0b2ba9';

  DELIVER_KEY='РАССЫЛКА';
  NAME_NOT_REGISTER='Регистрации не подлежит'; // код 1
  NAME_NOT_OTKAZ   ='Отказ в регистрации';     // код 2
  NAME_NOT_ETSP    ='Нет доверия ЭЦП';         // код 3

  DOC_NOT_READ=1; // документ не прочитан

  DOC_CREATE=0;      // не отправлен, созан
  DOC_PRESENT=1;     // документ или уведомление: получен или отправлен
  DOC_DELIVER=2;     // документ доставлен (получена или отправлена квит. о доставке)
  DOC_REGISTER=3;    // зарегистрирован
  DOC_NOT_REGISTER=4;// не подл. рег.
  DOC_ERROR=5;       // ошибочный
  DOC_REFUSE=6;      // отказ в регистрации
  DOC_NOT_REGISTER_DEF=7;// не подл. рег. для создания значений по умолчанию
  DOC_CREATE_ADD=8;  // получены только дополнения к документу


{ SENT_DOC=1;     // документ или уведомление отправлено
  SENT_DOC_ACK=2; // документ доставлен и получена квитанция о доставке
  SENT_DOC_REG=3; // документ доставлен и получена квитанция о регистрации
}
  STORE_KIND_PATH=1;       // ссылка на файл по пути  PATH
  STORE_KIND_SPEC=2;       // заархивиров. в спец. папке
  STORE_KIND_VALUE=3;      // в поле VALUE в BASE64

{ 1=подписал(автор)
  2=утвердил (согласовал)
  3=исполнитель (составитель)
  4=исполнитель                                                      
  5=соисполнитель}
  MEN_RECEIVER=0;    // receiver
  MEN_AUTHOR=1;      // author     автор подписавший
  MEN_VALIDATOR=2;   // validator утвердивший согласовавший
  MEN_WRITER=3;      // writer    исполнитель составитель
  MEN_EXECUTOR=4;    // executor  исполнитель  (только один в списке!!!)
  MEN_EXECUTOR_S=5;  // executor  соисполнитель

  ACK_USER=4;         // пользовательское уведомление
  ACK_REZERV=3;       // зарезервировано
  ACK_REGISTER=2;     // уведомление о регистратции док.
  ACK_DELIVER=1;      // уведомление о получении док.

  ADD_TYPE_PRIL=0;   // ADD_TYPE=приложение к документу               см. KEY_ADD_TYPE
  ADD_TYPE_INFO=1;   // ADD_TYPE=материал информационного характера   см. KEY_ADD_TYPE
  ADD_TYPE_REF=2;    // ADD_TYPE=является ссылкой на др. документ     см. KEY_ADD_TYPE

  // DocParent  delivery_type
  DELIVERY_TYPE_NOTSMDO=0;
  DELIVERY_TYPE_SMDO=1;
  DELIVERY_TYPE_EMPTY=9;

type

  TReceiveMailEvent = procedure(nInd:Integer; nCount:Integer) of object;

  TErrorSMDO=record
    Code:Integer;
    Error:String;
  end;

  TSMDO=class(TObject)
  private
    FPathAvest:String;
    FXML : TNativeXML;
    FProtokol : TStringList;
    FLastError: String;
    FActiveAvest: Boolean;
    FBeforeCheckTCP:Boolean;
    FEnabled: Boolean;
    FLocalEnabled:Boolean;
    FAbout: String;
    FMyName:String;          // наименование в СМДО
    FMyEmail:String;         // EMAIL в СМДО
    FMyCode:String;          // smdocode в СМДО
    FMySystem:String;        // ID моего СЭД
    FMySystemName:String;    // название моего СЭД
    FCurText:String;
    FDemo: Boolean;
    // для прогрессбара
    FMsgCaption:string;
    FMsgText:string;
    FMsgSize:Integer;
    FCheckSIGN:Boolean;
    FVersionXML_IN: Integer;
    FVersionXML_OUT: Integer;
    FOnUpdateWinReceiceMail: TReceiveMailEvent;
    procedure SetActiveAvest(const Value: Boolean);
    procedure SetEnabled(const Value: Boolean);
    procedure SetAbout(const Value: String);
    procedure SetDemo(const Value: Boolean);
    procedure SetVersionXML_IN(const Value: Integer);
    procedure SetVersionXML_OUT(const Value: Integer);
    procedure SetOnUpdateWinReceiceMail(const Value: TReceiveMailEvent);
  public
    ds2xml:TDataSets2XML;
    FNameFileXML:String;
    FCheckCert:Integer;
    FAddDefaultReferred:Boolean;
    FCheckReferred:Boolean;
    FAutoWriteReferred:Boolean;  // автоматически дозаписывать доп. материалы к нужному сообщению
    FVersionXML_Date: TDateTime;
    FPostEnabled:Boolean;    // доступна отправка и получение почты
    FPathIni:String;
    FWriteToBaseError:Boolean;
    FCheckMyOrg:Boolean;
    FManual:Boolean;
    FCheckStart:Boolean;
    FAddTask:Boolean;
    FRun:Boolean;

    FRefreshCOC:Integer;       //   RF_COC_NOT=0  не обновлять  RF_COC_RECEIVE=1; перед получением почты  RF_COC_START=2;   при старте программы
    FCheckLoadCOC:Boolean;     //   пытаться скачивать предварительно один из файлов СОС
    FCheckSizeMail:Integer;    //   конторолировать размер почтового ящика перед получением писем (размер в МБ)
    FTypeRun:Integer;
    FLocalLog:TstringList;
    FTmpPath:String;          // путь для сохранения прикрепленных файлов письма
    FEnableTextLog:Boolean;
    FAutho:Boolean;           // SMTP с авторизацией
    FDeletingPost:Boolean;        // удалять письма с сервера после получения
    FCheckEngKey:Boolean;  // контроль ввода только латинских символов в некоторых параметрах
    FAutoCheck:Integer;
    FRouter:String;           // марштутизатор СМДО
    FSmtpServer:String;       // SMTP-сервер
    FSmtpPort:Integer;        // SMTP-порт
    FPopServer:String;        // POP-сервер
    FPopPort:Integer;         // POP-порт
    FUserName:String;         // имя пользователя (почтовый ящик)
    FCurPassword:String;      // текущий пароль
    FPassword:String;         // пароль
    FSaveEML:Boolean;         // сохранять письмо как EML
    FSaveEML_A:Boolean;
    FPKNCI:String;
    FAdresPKNCI:String;
    FFileLog:String;
    FSSL:Boolean;             // SSL
    FTimeAsGMT:Boolean;     // записывать Всемирное время
    //----- ЭЦП AVEST -----------------
    FPATHAVESTDLL:String;      //
    FBase64CRLF:Boolean;       // удалять переводы каретки из BASE64 при записи в ХМL
    //---------------------------------
    FCurMsgType:Integer;
    FDokIdNumber:String;
    FRefIdNumber:String;
    FCountAddFolder:Integer;   // кол-во доп. материалов для других сообщений
    FWriteAddFolder:Integer;   // кол-во доп. материалов записанных
    FUrlCOC:String;
    FAckResult:TStringList;
    FAckResultOk:TStringList;
    FFilesMail:TStringList;
    FMens:TDataSet;
    FDocTask:TDataSet;
    FFiles:TDataSet;
    FReferred:TDataSet;
    property OnUpdateWinReceiceMail : TReceiveMailEvent read FOnUpdateWinReceiceMail write SetOnUpdateWinReceiceMail;
    property VersionXML_IN:Integer read FVersionXML_IN write SetVersionXML_IN;
    property VersionXML_OUT:Integer read FVersionXML_OUT write SetVersionXML_OUT;
    property CheckSIGN : Boolean read FCheckSIGN;
    property Demo:Boolean read FDemo write SetDemo;
    property Enabled : Boolean read FEnabled write SetEnabled;
    property ActiveAvest : Boolean read FActiveAvest write SetActiveAvest;
    property About:String read FAbout write SetAbout;
    property XML : TNativeXML read FXML;
    function CheckStrW(s:String):String;
    function CheckStrR(s:String):String;
    function GetError(nType:Integer; sZone,sEl,sAtr:String; sText:String=''):String;
    function OrgIsOneWindow(sOrg:String):Boolean;
    procedure AckResultAdd(nType:Integer; sZone,sEl,sAtr:String; sText:String='');
    procedure AckResultXML(s:String; nKod:Integer=999);
    procedure Text2AckResult(sAck:string);
    function AckResult2Text(sDelim:String='';lAddCode:Boolean=true):String;
    function AckResult2XML(node:TXMLNode):Boolean;
    function Text2Text(sAck:string; sDelim:String; sl:TStringList=nil):String;
    function LastErrorSMDO:String;

    function CreateErrorConnect(sError:String):String;
    function EnabledCOC:Boolean;
    function RefreshCOC(lAllSoob:Boolean; var sErr:String; lShow:Boolean):DWORD;

    function UpdateSprWork(ds:TDataSet; lAdd:Boolean; sDeleteKod:String):Boolean;
    function CheckSprWork(sSmdoCode:String; sName:String; sSysID:String; sSysName:String; lUpdateSMDO:Boolean):Boolean;
    function MaxCount: Integer;
    function NameVersionXML:String;
    function Info(n:Integer=0):String;
    function AvestDLL:String;
    procedure AvestWriteLog(strText : String);

    procedure CheckEnabledPost;

    procedure RunLoadSysSpr;
    procedure WriteTextLog(sOper:String; lLocal:Boolean=true);
    procedure CheckSizeFileLog(nSizeMB:Integer);

    procedure EditParams;
    function SetParamsSMDO(strPathINI:String) : Boolean;
    function CheckParamsConnect:Boolean;
    procedure ShowError;
    procedure ShowLocalLog(lAddError:Boolean);

    procedure ClearDS;
    procedure BeginTransaction;
    procedure EndTransaction(lCommit:Boolean);
    function  WriteTransaction:Boolean;

    procedure AddMen(nTaskID:Integer; nTypeMen:Integer; nodeM:TXMLNode; nodeO:TXMLNode; sl:TStringList=nil);
    procedure AddReceivedFile(nTaskID:Integer; sNameFile:String; slSignInfo,slSign:TStringList);


    function ErrorToSMDO(sFrom:String; sOrgID:String; sSubject:String; sGUID:String; sError:String) : Boolean;// запись ошибочной ситуации в базу при получении почты
    procedure ClearTmpValues;
    function XMLtoSMDO(sFrom:String; sGUID:String) : Integer;
    function RefToSMDO(nodeOwner:TXMLNode; nIDRef:Integer; sSmdoCode:String; var sErr:String; var sOutIdNumbers:String):Boolean;

    function SMDOtoXML(nPostID:Integer):Boolean;
    function AttachFileToXML(node:TXMLNode; nPostID:Integer; var nFile:Integer):Boolean;
    function MenToXML(node:TXMLNode; nTip:Integer):Boolean;
    function RefToXML(nodeOwner:TXMLNode; nIDRef:Integer):Boolean;
    function WriteAddDataSet(nID:Integer; ds2xml:TDataSets2XML; lDel:Boolean):String;
    function ReadAddDataSet(nID:Integer; ds2xml:TDataSets2XML):String;

    function getEnvelopType:String;

    function CreateReceiver(nodeHeader:TXMLNode; nPostID:Integer; sName:string; sSmdoCode:String):Boolean;
    function NameTypeSpr(nTypeSpr: Integer; sTypeRet:String):String;
    procedure CheckErrorRun;
//    function ReceiveMailTest:Boolean;
    function CheckReceiveMail2:Boolean;

    function CheckReceiveMail(lVisible:Boolean):Integer;
    function ReceiveMail(slPar:TStringList; var nCount:Integer; var nCountErr:Integer; var nCountUvd:Integer; nPost:Integer):Boolean;
    function CheckSendMail(var sSoob:String):Integer;
    function SendMail(slMsg:TStringList; slPar:TStringList):Boolean;
    function GetMsgSize(slSoob:TStringList; idPop:TidPOP3; var sSoob:String):Integer;

    function CreateMsgList(idPop:TidPOP3; ds:TDataSet; var sSoob:String):Boolean;
    function DeleteMsgList(idPop:TidPOP3; ds:TDataSet; var sSoob:String):Boolean;

    function LoadEML(sFile:String):Boolean;

    // syna
    function LoadEML_syna(sFile:String):Boolean;
    procedure CheckPart(nSubLevel:Integer; part:TMimePart; sName:String);

    procedure CheckEnabledScreen(lSet:Boolean);
    function CheckTCP(sIP:String; nPort:Integer; lShow:Boolean):Boolean;
    procedure TCPClientStatus(ASender: TObject;  const AStatus: TIdStatus; const AStatusText: String);

    function SizeMessage(Msg:TidMessage):Integer;
    function WorkReq(nType:Integer; lSk:Boolean):String;
    function VerifySignFile(sFileName:String; sSignature:String; var sSignInfo: String; lDecodeSign:Boolean):Boolean;

    function DecodeMIME(s:String):String;
    function EncodeMIME(s:String):String;
    function GetPathEML:String;
    function GetPathXML(sAdd:String):String;
    function GetPathAttach(nType:Integer; nPostID:Integer): String;
    function DateTimeToStringXML(ADate: TDateTime; UseLocalBias: Boolean): UTF8String;
    function DateTimeFromString(const ADate: UTF8String; UseLocalBias: Boolean): TDateTime;

    function XMLToValue(sValue:String; ft:TFieldType; vDefault:Variant): Variant;
    function GetSystemID:String;
    function GetSystemName:String;
    function getPkNCI:String;
    function getAdresPkNCI:String;
    function GetKodSMDO:String;
    function getKodSMDO_MD5:String;
    function GetEmail:String;
    function GetRekvMyOrg(sRekv:String; sl:TStringList=nil):String;
    function getSubjSystem(sOrg:String):Integer;
    function ReadKey:String;
    procedure WriteKey(sKey:String);
    function IsMyOrg(sOrg:String):Boolean;
    function StrToFile(aFile: String; Const Str: AnsiString): boolean;
    function CreateAckResult(nDocStatus:Integer; nPostID:Integer; lErrorText:Boolean; nMsgType:Integer=-1; sAddAck:String=''):Integer;

    function CheckElDocument(node:TXMLNode; var sRegNumber:String; var dRegNumber:TDateTime; ds:TDataSet):Boolean;
    function CheckElTask(node:TXMLNode; nTask:Integer; sIdDocNumber:String; sSmdoCode:String):Boolean;
    function CheckElFolder(node:TXMLNode; nFolder:Integer; sIdDocNumber:String; sSmdoCode:String):Boolean;
    function CheckDocTransfer(node:TXMLNode; nID:Integer; lCheck:Boolean=true):Boolean;
    function RegDocInSED(nDocID:Integer; nPostID:Integer; sRegNumber:String; dRegDate:TDateTime):Boolean;
    function CodeAttestation(sName:String):String;

    procedure IdWork(Sender: TObject; AWorkMode: TWorkMode; const AWorkCount: Integer);
    procedure IdWorkBegin(Sender: TObject; AWorkMode: TWorkMode; const AWorkCountMax: Integer);
    procedure IdWorkEnd(Sender: TObject; AWorkMode: TWorkMode);

    procedure IdWork_MainForm(Sender: TObject; AWorkMode: TWorkMode; const AWorkCount: Integer);
    procedure IdWorkBegin_MainForm(Sender: TObject; AWorkMode: TWorkMode; const AWorkCountMax: Integer);
    procedure IdWorkEnd_MainForm(Sender: TObject; AWorkMode: TWorkMode);

    function NameMsgType(nMsgType:Integer; nType:Integer=0):String;
    function MsgIsDoc(nMsgType:Integer):Boolean;
    function MsgIsAck(nMsgType:Integer):Boolean;
    function MsgIsAddDoc(nMsgType:Integer):Boolean;

    function SeekUID(UID:String; lDel:Boolean=false):Boolean;
    function AddUID(UID:String):Boolean;
    function DateToString(d:TDateTime; lFull:Boolean; lAsText:Boolean):String;
    function PathUpdateSpr:String;
    function GetDefaultDate:TDateTime;

    function WriteReferredToOsnDoc(nPostID:Integer; sSmdoCode:String): Boolean;
    function WriteOneReferredToOsnDoc(nID:Integer): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  function SMDOEnabled:Boolean;
  function SMDOFullEnabled:Boolean;
  function GetMaxCreateDateSpr(sSpr:String):TDateTime;


var
  SMDO : TSMDO;

implementation

uses dBase, fMain, fParamsSMDO, fSMDOZagrSpr, IniFiles, StrUtils, fMyNotify;

const
  ceVID_ST=1;
  ceVER_ST=2;
  ceVID=3;
  ceRECEIVER=10;
  ceORG=11;
  ceNOT_ATR=12;
  ceNOT_ZONE=20;
  ceTYPE_ZONE=21;
  ceNNN_ZONE=22;
  ceEL_ZONE=30;
  ceVLOG_EL_ZONE=31;
  ceKRAT_EL_ZONE=32;
  ceTYPE_ATR_ZONE=33;
  ceTYPE_EL_ZONE=34;
  ceNOT_ATR_EL_ZONE=35;
  ceXML=-1;

  ceETSP=-21;
  ceNOT_ETSP=-22;
  ceSOK=-23;

// 2.1.1
//  ceNotReg=1;     // Документ относится к категории нерегистрируемых
//  ceRefUse=2;     // Документ отказ в регистрации
//  ceNOT_ETSP=3;   // нет доверия ЭЦП

//--------------------------------------------------------------
function SMDOEnabled:Boolean;
begin
  Result:=false;
  if (SMDO<>nil) and SMDO.Enabled and  SMDO.FLocalEnabled then begin
    if not Role.IsCheckSubSystem or (Role.CheckSubSystem(SS_SMDO)<>ptDeniedAccess)
      then Result:=true;
  end;
end;
//--------------------------------------------------------------
function SMDOFullEnabled:Boolean;
begin
  Result:=false;
  if SMDOEnabled and SMDO.CheckParamsConnect and (Role.CheckSubSystem(SS_SMDO)=ptFull) then begin
    if SMDO.ActiveAvest
      then Result:=true;
  end;
end;
//---------------------------------------------------------------
function GetMaxCreateDateSpr(sSpr:String):TDateTime;
begin
  Result:=0;
  if sSpr='' then sSpr:='SmdoSprOrg';
  try
    dmBase.WorkQuery.SQL.Text:='select max(cast(createdate as SQL_DATE)) from '+sSpr;
    dmBase.WorkQuery.Open;
    if not dmBase.WorkQuery.Fields[0].IsNull
      then Result:=dmBase.WorkQuery.Fields[0].AsDateTime;
    dmBase.WorkQuery.Close;
  except
  end;
end;
//--------------------------------------------------------------
// организация ПК "Одно окно"
function TSMDO.OrgIsOneWindow(sOrg:String):Boolean;
begin
  Result:=(ANSILowerCase(Trim(sOrg))='s_window');
end;
//--------------------------------------------------------------
function TSMDO.CheckStrW(s:String):String;
begin Result:=AnsiToUtf8(s); end;
//--------------------------------------------------------------
function TSMDO.CheckStrR(s:String):String;
begin Result:=Utf8ToAnsi(s); end;
//--------------------------------------------------------------
procedure TSMDO.Text2AckResult(sAck:string);
begin
  FAckResult.Clear;
  StrToStrings(sAck,FAckResult,chr(13)+chr(10),true);
end;
//--------------------------------------------------------------
function TSMDO.AckResult2Text(sDelim:String;lAddCode:Boolean):String;
var
  i,n:Integer;
  s:String;
begin
  Result:='';
  if sDelim='' then sDelim:=chr(13)+chr(10);
  for i:=0 to FAckResult.Count-1 do begin
    if lAddCode then begin
      Result:=Result+FAckResult.Strings[i]+sDelim;
    end else begin
      n:=Pos('=',FAckResult.Strings[i]);
      if n>0
        then s:=Copy(FAckResult.Strings[i],n+1,Length(FAckResult.Strings[i]))
        else s:=FAckResult.Strings[i];
      Result:=Result+s+sDelim;
    end;
  end;
  if Result<>'' then Result:=Copy(Result,1,Length(Result)-Length(sDelim));
end;
//--------------------------------------------------------------
function TSMDO.Text2Text(sAck:string; sDelim:String; sl:TStringList):String;
var
  i,n:Integer;
  s:String;
  l:Boolean;
begin
  Result:='';
  l:=false;
  if sl=nil then begin
    sl:=TStringList.Create;
    l:=true;
  end;
  StrToStrings(sAck,sl,chr(13)+chr(10),true);
  if sDelim='' then sDelim:=chr(13)+chr(10);
  for i:=0 to sl.Count-1 do begin
    n:=Pos('=',sl.Strings[i]);
    if n>0
      then s:=Copy(sl.Strings[i],n+1,Length(sl.Strings[i]))
      else s:=sl.Strings[i];
    Result:=Result+s+sDelim;
  end;
  if Result<>'' then Result:=Copy(Result,1,Length(Result)-Length(sDelim));
  if l then sl.Free;
end;
//--------------------------------------------------------------
function TSMDO.AckResult2XML(node:TXMLNode):Boolean;
var
  i,n:Integer;
  s:String;
  nodeA:TXMLNode;
begin
  Result:=false;
  for i:=0 to FAckResult.Count-1 do begin
    nodeA:=node.NodeNew('AckResult');
    s:=FAckResult.Strings[i];
    n:=Pos('=',s);
    Result:=true;
    if n>0 then begin
      nodeA.AttributeAdd('errorcode', Copy(s,1,n-1));
      nodeA.ValueAsString:=CheckStrW(Trim(Copy(s,n+1,Length(s))));
    end else begin
      nodeA.AttributeAdd('errorcode', '0');
      nodeA.ValueAsString:=CheckStrW(s);
    end;
  end;
end;
//--------------------------------------------------------------
procedure TSMDO.AckResultAdd(nType:Integer; sZone,sEl,sAtr:String; sText:String);
begin
  FAckResult.Add(IntToStr(nType)+'='+GetError(nType,sZone,sEl,sAtr,sText));
end;
//--------------------------------------------------------------
procedure TSMDO.AckResultXML(s:String; nKod:Integer);
begin
  if nKod=999
    then FAckResult.Add(IntToStr(ceXML)+'='+s)
    else FAckResult.Add(IntToStr(nKod)+'='+s);
end;
//--------------------------------------------------------------
function TSMDO.GetError(nType:Integer; sZone,sEl,sAtr:String;  sText:String):String;
begin
  Result:='';
  if sText<>'' then sText:=' ('+sText+')';
  // зоны сообщения: Envelop, Header, Document, Body, TaskList, AddDocuments, Expansion, Acknowlegment
  // ошибки (страница 19 документа)
  if nType=ceVID_ST then begin
    Result:=Format('Недопустимое значение атрибута %0:s в зоне сообщения (3аголовок)', [sAtr]);
  end else if nType=ceVER_ST then begin
    Result:=Format('Недопустимое значение атрибута %0:s в зоне сообщения (3аголовок)', [sAtr]);
  end else if nType=ceVID then begin
    Result:='Недопустимое значение атрибута (Вид сообщения) в зоне сообщения (Заголовок)';
  end else if nType=ceRECEIVER then begin
    Result:='В зоне сообщения (3аголовок) получатель не определен';
  end else if nType=ceORG then begin
    Result:='В зоне сообщения (3аголовок) получатель не является организацией, осуществившей прием сообщения';
  end else if nType=ceNOT_ATR then begin
    Result:=Format('В зоне сообщения (3аголовок) отсутствует обязательный атрибут %0:s', [sAtr]);
  end else if nType=ceNOT_ZONE then begin
    Result:=Format('В сообщении отсутствует зона сообщения %0:s', [sZone]);
  end else if nType=ceTYPE_ZONE then begin
    Result:=Format('В сообщении присутствует недопустимый тип зоны сообщения %0:s (элемент 1-rо уровня)', [sZone]);
  end else if nType=ceNNN_ZONE then begin
    Result:=Format('Наличие нескольких зон сообщения %0:s одного типа', [sZone]);
  end else if nType=ceEL_ZONE then begin
    Result:=Format('Зона сообщения %0:s содержит недопустимые элементы %1:s', [sZone, sEl]);
  end else if nType=ceVLOG_EL_ZONE then begin
    Result:=Format('Неправильная вложенность элементов в элементе %0:s зоны сообщения %1:s', [sEl,sZone]);
  end else if nType=ceKRAT_EL_ZONE then begin
    Result:=Format('Неверная кратность элемента %0:s зоны сообщения %1:s', [sEl,sZone]);
  end else if nType=ceTYPE_ATR_ZONE then begin
    if sEl=''
      then Result:=Format('Неверный тип данных атрибута %0:s зоны сообщения %1:s', [sAtr,sZone])+sText
      else Result:=Format('Неверный тип данных атрибута %0:s элемента %1:s зоны сообщения %2:s', [sAtr,sEl,sZone])+sText;
  end else if nType=ceTYPE_EL_ZONE then begin
    Result:=Format('Неверный тип данных содержания элемента %0:s зоны сообщения %1:s', [sEl,sZone])+sText;
  end else if nType=ceNOT_ATR_EL_ZONE then begin
    Result:=Format('Отсутствует обязательный атрибут %0:s элемента %1:s зоны сообщения %2:s', [sAtr,sEl,sZone]);
  //------- ошибки при некорретном XML и некорректной ЭЦП (страница 53 документа) -------------------------------------
  end else if nType=ceXML then begin
    Result:='Ошибка при разборе ХML-пакета: струкrура XML не соответствует форматy или повреждена '+sZone;
  end else if nType=ceETSP then begin
    Result:='ЭЦП не верна: нарушена целостность подписанного документа(ов) или не найден файл, на который существует ссылка '+sZone;
  end else if nType=ceNOT_ETSP then begin
    Result:='Отсутствует ЭЦП для одного или нескольких документов '+sZone;
  end else if nType=ceSOK then begin
    Result:='Нет доверия к сертификату '+sZone;
  end;
end;

//--------------------------------------------------------------
procedure TSMDO.AvestWriteLog(strText : String);
begin
  if strText<>'' then begin
    WriteTextLog(strText, false);
  end;
end;
//--------------------------------------------------------------
procedure TSMDO.CheckEnabledPost;
begin
  if Role.SystemAdmin or (Role.Status=rsAdmin) then begin
    if GlobalTask.ParamAsString('ENABLED_POST')='0'
      then FPostEnabled:=false
      else FPostEnabled:=true;
  end else begin
    if Role.CheckSubSystem(SS_SMDO)=ptFull then begin   // объект Role доступен только после его инициализации Role.Init(...) в xxx.dpr
      if GlobalTask.ParamAsString('ENABLED_POST')='0'
        then FPostEnabled:=false
        else FPostEnabled:=true;
    end else begin
      FPostEnabled:=false;
    end;
  end;
end;
//--------------------------------------------------------------
constructor TSMDO.Create;
var
  sErr,sPath,strFile,s:String;
  ini:TSasaIniFile;
  i:Integer;
//  tmp:TIdSSLContext;
begin
  FOnUpdateWinReceiceMail:=nil;
  FCheckMyOrg:=true;
  FRun:=false;
  FTypeRun:=3;
  FCheckStart:=true;
  FAutoWriteReferred:=true;
  FCheckReferred:=false;
  FPostEnabled:=true;
  FRefreshCOC:=1;
  FCheckLoadCOC:=true;

  FBeforeCheckTCP:=true;
  FManual:=false;
  FDemo:=true;
  FAddTask:=true;
  FWriteToBaseError:=false;
  FVersionXML_IN:=211;
  FVersionXML_OUT:=211;
  FVersionXML_Date:=STOD(date_new_parser,tdAds);
  FEnableTextLog:=false;
  FActiveAvest:=true;
  FAddDefaultReferred:=true;
  FCheckCert:=0;

  FEnabled:=true;
  s:=GlobalTask.ParamAsString('ENABLED_SMDO');
  if s='0'
    then FLocalEnabled:=false
    else FLocalEnabled:=true;
  FLastError:='';
  FPKNCI:='';
  FAdresPKNCI:='';
  FCheckSIGN:=true;
  FSaveEML:=true;
  FSaveEML_A:=false;
  FSSL:=false;
  FUrlCOC:='';
  FAbout:='';
  FCurMsgType:=-1;
  FDokIdNumber:='';
  FRefIdNumber:='';
  FAckResult:=TStringList.Create;
  FAckResultOk:=TStringList.Create;
  FFilesMail:=TStringList.Create;
  FLocalLog:=TStringList.Create;

  FXML:=TNativeXml.Create;
  FXML.XmlFormat:=xfReadable;
  FXML.Root.Name:='Envelop';
//  XMLDokument.ExternalEncoding:=seAnsi;
//  XMLDokument.EncodingString:='ANSI';
  FProtokol:=TStringList.Create;
//  dsOrg:=dbCreateMemTable('ID,Integer,0;NAME,Char,300;KNAME,Char,200','');
//  dsOrg.Open;
  FMens:=dbOpenSQL2MemTable('select TOP 1 * from '+dmBase.SMDOMens.TableName, '');  // создадим MemTable такой же структуры как SMDOMens
  if FMens<>nil then FMens.Name:='memMensSMDO';

  FDocTask:=dbOpenSQL2MemTable('select TOP 1 * from '+dmBase.SMDOTask.TableName, '');  // создадим MemTable такой же структуры как SMDOMens
  if FDocTask<>nil then FDocTask.Name:='memDocTaskSMDO';

  FFiles:=dbOpenSQL2MemTable('select TOP 1 * from '+dmBase.SMDOFile.TableName, '');  // создадим MemTable такой же структуры как SMDOMens
  if FFiles<>nil then FFiles.Name:='memFilesSMDO';

  ds2xml:=TDataSets2XML.Create;
  s:='PARENT_ID,Integer;IDNUMBER,Char,36;REGNUMBER,Char,30;REGDATE,Date,0;RETYPE,Integer';
  FReferred:=dbCreateMemTable(s,'');
  FReferred.Name:='tbReferred';
  FReferred.Open;
//  FReferred.Tag:=1;
  ds2xml.DS_Add(FReferred);

  ClearDS;

  //  dbEmptyMemTable(FMens);

  FPathINI:=GlobalTask.PathServiceMain;
  strFile:=FPathINI+'smdo.ini';
  if FileExists(strFile) then begin
    Ini:=TSasaIniFile.Create( strFile );
    // взять файл с настройками на локальном компьютере
    if ini.ReadString('ADMIN', 'LOCAL', '0')='1' then begin
      FPathINI:=GlobalTask.PathService;
      if not FileExists(FPathINI+'smdo.ini') then begin
        CopyFile(PChar(strFile), PChar(FPathINI+'smdo.ini'),false);
      end;
    end;
    ini.Free;
  end;
  SetParamsSMDO(FPathINI);
  //====  !!!!!!!! грузим ssleay32.dll и libeay32.dll ========================
//  if FSSL then begin
//   tmp:=TIdSSLContext.Create;
//   tmp.Destroy;
//  end;   //   LoadOpenSLLibrary; // IdSSLOpenSSLHeaders.Load;
  //============================
  if not FEnabled then WriteTextLog('СМДО недоступно');
  if not CheckParamsConnect then begin
    WriteTextLog('Параметры не установлены');
  end;
//  if FVersionXML_IN>=211
//    then WriteTextLog('Версия разбора XML 2.1.1')
//    else WriteTextLog('Версия разбора XML 1.0');

  sErr:='';
  FPathAvest:='';
//  Avest:=TAvest.Create; //('');
  if Avest=nil then begin   // может открыли уже для ГИС РН
    Avest:=TAvest.Create;
  end;
//  Avest.OnWriteLog:=
  if not Avest.IsActive then begin
    // грузить или нет библиотеку  AvCryptMail.dll
    sPath:=Trim(dmBase.IniSysParams.ReadString('PATH','AVEST',''));
    if sPath<>'0' then begin
      if sPath='1'
        then sPath:='';
      if (sPath<>'')
        then sPath:=CheckSleshN(sPath)+NAME_AVEST_DLL; //'AvCryptMail.dll';
      FPathAvest:=sPath;
      if FEnabled and FLocalEnabled then begin
        Avest.LoadDLL(sPath, sErr);
        for i:=0 to Avest.slLogLoad.Count-1 do WriteTextLog(Avest.slLogLoad[i]);
      end else begin
        WriteTextLog('Отказ от загрузки библиотеки ЭЦП Avest ('+NAME_AVEST_DLL+'): подсистема СМДО отключена');
      end;
    end else begin
      WriteTextLog('Отказ от загрузки библиотеки ЭЦП Avest ('+NAME_AVEST_DLL+'): параметр AVEST=0');
    end;
  end;  
  FActiveAvest:=Avest.IsActive;
  FAbout:=Info;

end;
//--------------------------------------------------------------
function TSMDO.AvestDLL:String;
begin
//  Result:='';
  if FActiveAvest and (Avest<>nil) then begin
    Result:=Avest.PathDLL+NAME_AVEST_DLL; //'AvCryptMail.dll';
  end else begin
    Result:=FPathAvest;
  end;
end;
//--------------------------------------------------------------
destructor TSMDO.Destroy;
begin
  if (FMens<>nil) and FMens.Active then FMens.Close;
  FreeAndNil(FMens);
  if (FDocTask<>nil) and FDocTask.Active then FDocTask.Close;
  FreeAndNil(FDocTask);
  if (FFiles<>nil) and FFiles.Active then FFiles.Close;
  FreeAndNil(FFiles);
  if (FReferred<>nil) and FReferred.Active then FReferred.Close;
  FreeAndNil(FReferred);
  FXML.Free;
  FProtokol.Free;
  FAckResult.Free;
  FAckResultOk.Free;

  FFilesMail.Free;
  FLocalLog.Free;
  ds2xml.Free;
  inherited;
end;
//----------------------------------------------------------
function TSMDO.NameVersionXML:String;
begin
  if FVersionXML_OUT=100 then begin
    Result:='1.0';
  end else begin                                                                             
    Result:='2.1.1';
  end;
end;
//----------------------------------------------------------
function TSMDO.Info(n:Integer):String;
var
  s,ss:String;
begin
  {$IFDEF POST}
  if Demo then s:='ЛАИС.СМДО(ДЕМО) (версия формата XML '+NameVersionXML+') '
          else s:='ЛАИС.СМДО (версия формата XML '+NameVersionXML+') ';
  {$ELSE}
  if Demo then s:='ЛАИС.СМДО(ДЕМО) '+VERSION_SYSTEM_SMDO+' (формат XML '+NameVersionXML+')'
          else s:='ЛАИС.СМДО '+VERSION_SYSTEM_SMDO+' (формат XML '+NameVersionXML+')';
  {$ENDIF}
  if FEnabled then begin
    s:=s+'активно ';
    if not FLocalEnabled
      then s:=s+'(отключено)';
  end else begin
    s:=s+'недоступно ';
  end;
  if Avest.IsActive then begin
    ss:='Авест ('+Avest.Version+')';
  end else begin
    ss:='Авест (не загружен)';
  end;
  if n=1 then begin
    ss:='';
  end else if n=2 then begin
    s:='';
  end else begin
    ss:=', '+ss;
  end;
  Result:=s+ss;
end;
//----------------------------------------------------------
function TSMDO.EnabledCOC:Boolean;
var
 IdHTTP: TIdHTTP;
 SStrm : TStringStream;
 sUrl,s:String;
 i,nErrCode:Integer;
begin
  Result:=true;
  if FCheckLoadCOC then begin
    if (FUrlCOC<>'') then begin
      i:=Pos(chr(13)+chr(10), FUrlCOC);
      if i=0
        then sUrl:=FUrlCOC
        else sUrl:=Copy(FUrlCOC,1,i-1);
      FLastError:='';
      Result:=true;
      if Pos('HTTP', ANSIUpperCase(sUrl))>0 then begin
        IdHTTP:=TIdHTTP.Create(nil);
//        IdHTTP.HandleRedirects:=true;
//        IdHTTP.RedirectMaximum:=10;
        SStrm:=TStringStream.Create('');
        try
          IdHTTP.Get(sURL, SStrm);
          s:=SStrm.DataString;
          if s='' then begin
            FLastError:='Точки распределения СОС недоступны';
          end;
        except
          on E:sysutils.Exception do begin
            if E is EIdHTTPProtocolException
              then nErrCode:=EIdHTTPProtocolException(E).ReplyErrorCode
              else nErrCode:=0;
            if ((nErrCode>=300) and (nErrCode<=399)) then begin   // файл переехал на другое место, типа все о`кей
              FLastError:='';
            end else begin
              FLastError:=sUrl+chr(13)+chr(10)+'  '+E.Message;
            end;
          end;
        end;
        FreeAndNil(SStrm);
        FreeAndNil(IdHTTP);
        if FLastError<>'' then  Result:=false;
      end;
    end else begin
      Result:=false;
      FLastError:='Не заполнен путь доступа к точкам распределения СОС';
    end;
  end;
end;
//----------------------------------------------------------
function TSMDO.RefreshCOC(lAllSoob:Boolean; var sErr:String; lShow:Boolean):DWORD;
var
  s:String;
  sE:String;
begin
  Result:=0;
  FLastError:='';
  if Avest.IsActive then begin
    sErr:='';
    sE:='';
    s:=FUrlCOC;
    DelChars(s,' '#13#10#9);
    if s<>'' then begin
//      GlobalTask.SetLastValueAsBoolean('RUN_CHECK_COC',true);
      if lShow then OpenMessage(PadCStr('Контроль точек распределения СОС ...',40,' '));
      try
        if EnabledCOC then begin
//          if lCheck  заменен на lAllSoob
//            then Result:=Avest.SMDOGetCOC(FUrlCOC)          // с проверкой необходимости обновления
//            else Result:=Avest.SMDORefreshCOC(FUrlCOC);     // без проверки
          Result:=Avest.SMDORefreshCOC2(FUrlCOC,sE,lAllSoob);     // раздельно по каждому URL
        end else begin
          sErr:=FLastError;
        end;
      finally
        if lShow then CloseMessage;
      end;
      if Result>0 then begin
        if sE<>''
          then sErr:=sE
          else sErr:=DelCharsR( Avest.ErrorInfo(Result), chr(0) );
      end;
//      GlobalTask.SetLastValueAsBoolean('RUN_CHECK_COC',false);
    end else begin
      sErr:='Не заполнен путь доступа к точкам распределения СОС';
    end;
  end else begin
    sErr:=error_load_etsp; //'Библиотека для работы с ЭЦП не загружена';
  end;
end;

//--------------------------------------------------------------
procedure TSMDO.SetActiveAvest(const Value: Boolean);
begin FActiveAvest := Value; end;
//--------------------------------------------------------------
procedure TSMDO.SetEnabled(const Value: Boolean);
begin
  FEnabled:=Value;
  fmMain.SMDOCheckEnabled(FEnabled and FLocalEnabled);
end;
//--------------------------------------------------------------
function TSMDO.UpdateSprWork(ds: TDataSet; lAdd:Boolean; sDeleteKod:String):Boolean;
var
  nID:Integer;
  s,ss,sCode:String;
begin
  Result:=false;
  if sDeleteKod<>'' then begin
    if dmBase.SprWork.Locate('smdocode', sDeleteKod, []) then begin
      dmBase.SprWork.Edit;
      dmBase.SprWork.FieldByName('SMDOCODE').AsString:='';
      dmBase.SprWork.Post;
      Result:=true;
    end;
  end else begin
    sCode:=ds.FieldByName('smdocode').AsString;
    if dmBase.SprWork.Locate('smdocode', sCode, []) then begin
      Result:=true;
    end else begin
      if lAdd then begin
        nID := dmBase.GetNewID(dmBase.TypeObj_Organ);
        if nID>-1 then begin
          dmBase.SprWork.Append;
          dmBase.SprWork.FieldByName('ID').AsInteger:=nID;
          dmBase.SprWork.FieldByName('SMDOCODE').AsString:=sCode;
          dmBase.SprWork.Post;
          Result:=true;
        end;
      end;
    end;
    if Result then begin
      with dmBase.SprWork do begin
        Edit;
        FieldByName('IS_KORR').AsBoolean:=true;
        FieldByName('FNAME').AsString:=ds.FieldByName('name').AsString;
        FieldByName('NAME').AsString:=ds.FieldByName('shortname').AsString;
        FieldByName('TELEFON').AsString:=ds.FieldByName('phone').AsString;
        FieldByName('EMAIL').AsString:=ds.FieldByName('email').AsString;
        FieldByName('FAX').AsString:=ds.FieldByName('fax').AsString;
        FieldByName('ABONENTBOX').AsString:=ds.FieldByName('abonentbox').AsString;
        FieldByName('POSTINDEX').AsString:=ds.FieldByName('postindex').AsString;
        FieldByName('SOATO').AsString:=ds.FieldByName('soato').AsString;
        FieldByName('ADRES').AsString:=ds.FieldByName('street').AsString;
  //???            FieldByName('OKOPF').AsString:=ds.FieldByName('okopfvalue').AsString;
        s:=ds.FieldByName('home').AsString;
        if s<>'' then s:=', д.'+s;
        ss:=ds.FieldByName('corpus').AsString;
        if ss<>'' then s:=s+', корп.'+ss;
        if s<>'' then  FieldByName('ADRES').AsString:=FieldByName('ADRES').AsString+s;
        Post;
      end;
    end;
  end;
end;
//--------------------------------------------------------------
function TSMDO.CheckSprWork(sSmdoCode:String; sName:String; sSysID:String; sSysName:String; lUpdateSMDO:Boolean):Boolean;
var
  nID:Integer;
begin
  Result:=false;
  if MySameText(sSmdoCode,org_marsh) or MySameText(sSmdoCode,org_pkinci)
    then exit;  // !!!

  if dmBase.SprWork.Locate('smdocode',sSmdoCode,[]) then begin
    Result:=true;
  end else begin
    nID := dmBase.GetNewID(dmBase.TypeObj_Organ);
    if nID>-1 then begin
      dmBase.SprWork.Append;
      dmBase.SprWork.FieldByName('ID').AsInteger:=nID;
      dmBase.SprWork.FieldByName('SMDOCODE').AsString:=sSmdoCode;
      dmBase.SprWork.FieldByName('IS_KORR').AsBoolean:=true;
      dmBase.SprWork.Post;
      Result:=true;
    end;
  end;
  if Result then begin
    with dmBase.SprWork do begin
      Edit;
      FieldByName('FNAME').AsString:=sName;
      FieldByName('NAME').AsString:=sName;
      FieldByName('IS_KORR').AsBoolean:=true;
      Post;
    end;
    if lUpdateSMDO then begin
      if not dmBase.SMDOSprOrg.Locate('smdocode',sSmdoCode,[]) then begin
        dmBase.SMDOSprOrg.Append;
        dmBase.SMDOSprOrg.FieldByName('smdocode').AsString:=sSmdoCode;
        dmBase.SMDOSprOrg.FieldByName('name').AsString:=sName;
        dmBase.SMDOSprOrg.FieldByName('shortname').AsString:=sName;
        dmBase.SMDOSprOrg.FieldByName('typesedvalue').AsString:=sSysName;
        dmBase.SMDOSprOrg.FieldByName('typesedrowid').AsString:=sSysID;
        dmBase.SMDOSprOrg.Post;
        Result:=true;
      end;
    end;
  end;
end;
//----------------------------------------------------
procedure TSMDO.RunLoadSysSPR;
begin
  RunZagrSprSMDO;
end;
//-------------------------------------------------------------------------------------
procedure TSMDO.WriteTextLog(sOper:String; lLocal:Boolean);
begin
  if lLocal
    then FLocalLog.Add(sOper);
  if FEnableTextLog then begin
    try
      WriteStringLog(sOper,FFileLog);
    except
    end;
  end;
end;
//-------------------------------------------------------------------------------------
function TSMDO.LastErrorSMDO:String;
begin
  Result:=FLastError;
end;
//-------------------------------------------------------------------------------------
procedure TSMDO.CheckSizeFileLog(nSizeMB:Integer);
begin
  if FEnableTextLog then begin
    CheckSizeLog(FFileLog,nSizeMB);
  end;
end;

//----------------------------------------------------
function TSMDO.SetParamsSMDO(strPathINI:String) : Boolean;
var
  ini : TSasaIniFile;
  i:Integer;
  sl:TStringList;
  s:String;
  lCheckDateParser:Boolean;
begin
  Result:=true;
  if strPathIni='' then begin
    strPathIni:=FPathIni;
  end else begin
    FPathIni:=strPathIni;
  end;
  // файл с настройками для подключения к ГИС РН должен храниться на главном компьютере или на локальном
  Ini:=TSasaIniFile.Create(strPathINI+'smdo.ini');
 //   uProject

//  Enabled:=true; //GlobalTask.ParamAsBoolean('SMDO'); //Ini.ReadBool('ADMIN','ENABLED', true);
  Enabled:=Ini.ReadBool('ADMIN','ENABLED', true);

  FPKNCI:=Ini.ReadString('ADMIN', 'PK_NCI', '');
  FAdresPKNCI:=Ini.ReadString('ADMIN', 'ADRES_PK_NCI', '');
  FCheckSIGN:=Ini.ReadBool('ADMIN', 'CHECK_SIGN', true);
  FAddDefaultReferred:=Ini.ReadBool('ADMIN', 'DEFAULT_REFERRED', true);
  FCheckCert:=Ini.ReadInteger('ADMIN', 'CHECK_CERT', CHECK_CERT_DATE);
  FBeforeCheckTCP:=Ini.ReadBool('ADMIN', 'CHECK_TCP', true);

  FEnableTextLog:=Ini.ReadBool('ADMIN','LOG', true);
  FSaveEML:=Ini.ReadBool('ADMIN', 'SAVE_EML', true);
  FSaveEML_A:=Ini.ReadBool('ADMIN', 'SAVE_EML_A', false);
  FFileLog:=NameFromExe('smdo.log');
  FWriteToBaseError:=Ini.ReadBool('ADMIN', 'WRITE_ERROR', false);
  FCheckEngKey:=Ini.ReadBool('ADMIN', 'CHECK_ENG', true);

//  i:=GlobalTask.ParamasInteger('SMDO_PARSER');
//  if i=0 then FVersionXML_OUT:=100 else FVersionXML_OUT:=i;
//  FVersionXML_OUT:=211;
//  i:=Ini.ReadInteger('ADMIN', 'SMDO_PARSER', 211);
//  if i=100
//    then FVersionXML_OUT:=100
  FVersionXML_OUT:=211;
  FVersionXML_Date:=STOD(date_new_parser, tdAds);
  lCheckDateParser:=FVersionXML_OUT=100;
  if Ini.ReadInteger('ADMIN', 'SMDO_PARSER_DATE_CHECK', 0)=1 then begin  // уже переключали автоматически
    lCheckDateParser:=false;
  end;
  try
    s:=Trim(Ini.ReadString('ADMIN', 'SMDO_PARSER_DATE', ''));
    if s=''
      then s:=date_new_parser;
    FVersionXML_Date:=STOD(s, tdAds);
  except
    FVersionXML_Date:=STOD(date_new_parser, tdAds);
  end;
  if lCheckDateParser and (Date>=FVersionXML_Date) then begin
    FVersionXML_OUT:=211;
    Ini.WriteInteger('ADMIN', 'SMDO_PARSER', 211);
    Ini.WriteInteger('ADMIN', 'SMDO_PARSER_DATE_CHECK', 1);
    Ini.UpdateFile;  // !!!
    ShowMessage('Почта СМДО переведена на версию 2.1.1');
//    AddNotifyProg(fmMain, 'Почта СМДО переведена на версию 2.1.1', false, true);
  end;

  CheckSizeFileLog(4);
  //----- для ЭЦП ---------------------------------------------
  FBase64CRLF:= Ini.ReadBool('ADMIN', 'BASE64CRLF', false);   // удалять переводы каретки из BASE64

//  if GlobalTask.GetLastValueAsBoolean('NOT_SMDO') then begin
//    Enabled:=false;
//    ActiveAvest:=false;
//  end;
//PATH_AVESTDLL
  //----------------------------------------------------------------------
  FAutho:=Ini.ReadBool('POST', 'AUTHORIZATION', true);
  FSSL:=Ini.ReadBool('POST', 'SSL', false);
  FDeletingPost:= Ini.ReadBool('POST', 'DELETING', true);
  FCheckSizeMail:= Ini.ReadInteger('POST', 'CHECK_SIZE_MAIL', 0);

  FAutoCheck:=Ini.ReadInteger('POST', 'AUTOCHECK', 0);
  if (FAutoCheck>0) and (FAutoCheck<10)
    then FAutoCheck:=10;
  FRouter:= Trim(Ini.ReadString('POST', 'ROUTER', ''));
  FSmtpServer:= Trim(Ini.ReadString('POST', 'SMTP_SERVER', ''));
  FSmtpPort  := Ini.ReadInteger('POST', 'SMTP_PORT', 25);
  FPopServer := Trim(Ini.ReadString('POST', 'POP_SERVER', ''));
  FPopPort   := Ini.ReadInteger('POST', 'POP_PORT', 110);
  FUserName  := Trim(Ini.ReadString('POST', 'USERNAME', ''));
  FPassword  := Trim(Ini.ReadString('POST', 'PASSWORD', ''));
  FCheckStart:=Ini.ReadBool('POST', 'CHECK_START', true);
  FAutoWriteReferred:=Ini.ReadBool('POST', 'AUTO_REFERRED', true);

//   RF_COC_NOT=0;     не обновлять
//   RF_COC_RECEIVE=1; перед получением почты
//   RF_COC_START=2;   при старте программы
  FRefreshCOC:=Ini.ReadInteger('POST', 'CHECK_COC', -1);
  if (FRefreshCOC=-1) or  (FRefreshCOC>2) then begin
    FRefreshCOC:=0;
  end;
  FCheckLoadCOC:=Ini.ReadBool('POST', 'CHECK_LOAD_COC', true);

  FAddTask   :=Ini.ReadBool('POST', 'ADDTASK', true);
  FManual    :=Ini.ReadBool('POST', 'MANUAL', false);

  FTimeAsGMT:=Ini.ReadBool('POST', 'TIME_AS_GMT', false);  // записывать Всемирное время или месное

  FMyEmail:= Trim(Ini.ReadString('POST', 'EMAIL', ''));
  FMyCode := Trim(Ini.ReadString('POST', 'SMDOCODE', ''));
  FMyName := Trim(Ini.ReadString('POST', 'SMDONAME', ''));
  FMySystem:= Trim(Ini.ReadString('POST', 'SEDID', ''));
  FMySystemName:= Trim(Ini.ReadString('POST', 'SEDNAME', ''));

  if FPassword<>'' then FPassword:=Trim(XorDecode(PPP_CONST, FPassword));
  if FPassword<>'' then FCurPassword:=FPassword;
  //-----------------------------------------------------------------------

  sl:=TStringList.Create;
  FUrlCOC:='';
  Ini.ReadSectionValues('URL_CRL',sl );
  for i:=0 to sl.Count-1 do begin
    FUrlCOC:=FUrlCOC+sl.ValueFromIndex[i]+chr(13)+chr(10);
  end;
//???  if FUrlCOC<>'' then FUrlCOC:=Copy(FUrlCOC,1,Length(FUrlCOC)-2);

  FreeAndNil(Ini);
end;
//-----------------------------------------------------------------------
function TSMDO.CheckParamsConnect:Boolean;
begin
  Result:=true;
  if (FSmtpServer='') or (FPopServer='') or (FRouter='')  or (FUserName='') or  (FPassword='')
     or (FMyEmail='') or (FMyCode='') or (GetSystemID='')  or (FMySystemName='') then begin
    FLastError:='Заполните парамтры СМДО';
    Result:=false;
  end;
end;
//-----------------------------------------------------------------------
procedure TSMDO.ShowError;
begin
  if FLastError<>'' then PutError(FLastError);
end;
//-----------------------------------------------------------------------
procedure TSMDO.ShowLocalLog(lAddError:Boolean);
begin
  if lAddError and (FLastError<>'') then begin
    FLocalLog.Add('ОШИБКА: '+FLastError);
  end;
  ShowStrings(FLocalLog,'ЛОГ работы');
end;
//-----------------------------------------------------------------------
procedure TSMDO.ClearDS;
begin
  if FMens=nil then exit;

  TkbmMemTable(FMens).CheckBrowseMode;
  if FMens<>nil then
    TkbmMemTable(FMens).EmptyTable;
  TkbmMemTable(FDocTask).CheckBrowseMode;
  if FDocTask<>nil then
    TkbmMemTable(FDocTask).EmptyTable;
  TkbmMemTable(FFiles).CheckBrowseMode;
  if FFiles<>nil then
    TkbmMemTable(FFiles).EmptyTable;
  if FReferred<>nil then
    TkbmMemTable(FReferred).EmptyTable;
end;
//-----------------------------------------------------------------------
procedure TSMDO.BeginTransaction;
begin
  with TkbmMemTable(FMens) do begin
    EnableVersioning:=true;
    VersioningMode:=mtvmAllSinceCheckPoint;
    StartTransaction;
  end;
  with TkbmMemTable(FDocTask) do begin
    EnableVersioning:=true;
    VersioningMode:=mtvmAllSinceCheckPoint;
    StartTransaction;
  end;
  with TkbmMemTable(FFiles) do begin
    EnableVersioning:=true;
    VersioningMode:=mtvmAllSinceCheckPoint;
    StartTransaction;
  end;
  with TkbmMemTable(FReferred) do begin
    EnableVersioning:=true;
    VersioningMode:=mtvmAllSinceCheckPoint;
    StartTransaction;
  end;
end;
//-----------------------------------------------------------------------
procedure TSMDO.EndTransaction(lCommit:Boolean);
begin
  if lCommit then begin
    TkbmMemTable(FMens).Commit;
    TkbmMemTable(FDocTask).Commit;
    TkbmMemTable(FFiles).Commit;
    TkbmMemTable(FReferred).Commit;
  end else begin
    TkbmMemTable(FMens).Rollback;
    TkbmMemTable(FDocTask).Rollback;
    TkbmMemTable(FFiles).Rollback;
    TkbmMemTable(FReferred).Rollback;
  end;
end;
//-----------------------------------------------------------------------
function TSMDO.WriteTransaction:Boolean;
begin
 // запись GetDocArxivFolder +'SMDO\'+id   папка для сохранения вложения
  Result:=true;
end;
//-----------------------------------------------------------------------
procedure TSMDO.AddMen(nTaskID:Integer; nTypeMen:Integer; nodeM:TXMLNode; nodeO:TXMLNode; sl:TStringList);
var
//  node:TXMLNode;
  i:Integer;
  sAtr,sNode,sVal:String;
  fld:TField;
begin
  FMens.Append;
  FMens.FieldByName('PARENT_ID').AsInteger:=nTaskID;
  FMens.FieldByName('TIP').AsInteger:=nTypeMen;
  if nodeO<>nil then begin
    FMens.FieldByName('ORG').AsString:=XMLToValue( nodeO.ReadAttributeString('organization_string'), ftString, '');
  end;
  if sl<>nil then begin
    for i:=0 to sl.Count-1 do begin
      fld:=FMens.FindField(sl.Names[i]);
      if fld<>nil then
        fld.AsString:=sl.ValueFromIndex[i];
    end;
  end;
  for i:=0 to nodeM.NodeCount-1 do begin
    sNode:=ANSILowerCase(nodeM.Nodes[i].Name);
    sVal:=Trim(nodeM.Nodes[i].ValueAsString);
    if sVal<>'' then begin
      if sNode='name' then begin
        FMens.FieldByName('FIO').AsString:=XMLToValue(sVal,ftString,'');
      end else if sNode='official' then begin
        if FMens.FieldByName('OFFICIAL').AsString=''
          then FMens.FieldByName('OFFICIAL').AsString:=XMLToValue(sVal,ftString,'')
          else FMens.FieldByName('OFFICIAL').AsString:=FMens.FieldByName('OFFICIAL').AsString+', '+XMLToValue(sVal,ftString,'');
      end else if sNode='rank' then begin
        if FMens.FieldByName('RANK').AsString=''
          then FMens.FieldByName('RANK').AsString:=XMLToValue(sVal,ftString,'')
          else FMens.FieldByName('RANK').AsString:=FMens.FieldByName('RANK').AsString+', '+XMLToValue(sVal,ftString,'');
      end else if sNode='econtact' then begin
        sAtr:=XMLtoVALUE(ANSILowerCase(nodeM.Nodes[i].ReadAttributeString('type')), ftString, '');
        if sAtr='1' then begin
          FMens.FieldByName('TEL_WORK').AsString:=XMLToValue(sVal,ftString,'');
        end else if sAtr='3' then begin
          FMens.FieldByName('TEL_MOB').AsString:=XMLToValue(sVal,ftString,'');
        end else if sAtr='5' then begin
          FMens.FieldByName('EMAIL').AsString:=XMLToValue(sVal,ftString,'');
        end;
      end else if sNode='address' then begin
        FMens.FieldByName('ADRES').AsString:=XMLToValue(sVal,ftString,'');
      end else if sNode='signdate' then begin
        FMens.FieldByName('SIGNDATE').AsDateTime:=XMLToValue(sVal,ftDate,0);
      end;
    end;
  end;
  FMens.Post;
end;
//-----------------------------------------------------------------------
procedure TSMDO.AddReceivedFile(nTaskID:Integer; sNameFile:String; slSignInfo,slSign:TStringList);
var
  i:Integer;
  s,ss:String;
begin
  FFiles.Append;
  FFiles.FieldByName('PARENT_ID').AsInteger:=nTaskID;
  FFiles.FieldByName('STORE_KIND').AsInteger:=STORE_KIND_PATH;
  FFiles.FieldByName('NAME').AsString:=sNameFile;
  s:='';
  if slSignInfo<>nil then begin
    for i:=0 to slSignInfo.Count-1 do begin
     //!!! удаление переводов каретки CRLF !!!
      ss:=DelCharsR(slSignInfo.Strings[i], chr(13)+chr(10) );
      s:=s+ss+chr(13)+chr(10);
//      s:=s+slSignInfo.Strings[i]+chr(13)+chr(10);
    end;
  end;
  FFiles.FieldByName('SIGNINFO').AsString:=s;
  s:='';
  if slSign<>nil then begin
    for i:=0 to slSign.Count-1 do begin
     //!!! удаление переводов каретки CRLF !!!
      ss:=DelCharsR(slSign.Strings[i], chr(13)+chr(10) );
      s:=s+ss+chr(13)+chr(10);
//      s:=s+slSign.Strings[i]+chr(13)+chr(10);
    end;
  end;
  FFiles.FieldByName('SIGNATURE').AsString:=s;
  FFiles.Post;
end;
//-----------------------------------------------------
function TSMDO.CheckReceiveMail2:Boolean;
var
  idPOP:TidPOP3;
  Msg:TidMessage;
  IdSocksInfo:TIdSocksInfo;
  IdSSLIOHandlerSocket:TIdSSLIOHandlerSocket;
  nCount,i,n:Integer;
  sUD,sFile:String;
  sl:TStringList;
  SearchRec:TSearchRec;
  lDel:Boolean;
begin
  if not CheckParamsConnect then begin
    Result:=false;
    ShowError;
    exit;
  end;
  sl:=TStringList.Create;
  IdSocksInfo:=nil;
  idPOP:=TidPOP3.Create(nil);
  Msg:=TidMessage.Create(nil);
  if FSSL then begin
//    { !!!
    IdSocksInfo:=TIdSocksInfo.Create(nil);
    IdSSLIOHandlerSocket:=TIdSSLIOHandlerSocket.Create(nil);
    IdSocksInfo.Authentication:= saNoAuthentication;
    IdSocksInfo.Port:=FPopPort;
    IdSocksInfo.Version:=svNoSocks;
    IdSSLIOHandlerSocket.SocksInfo:=IdSocksInfo;
    IdSSLIOHandlerSocket.SSLOptions.Method:=sslvTLSv1;
    IdPOP.IOHandler:=IdSSLIOHandlerSocket; //}
  end else begin
    IdPOP.IOHandler:=nil;
  end;
  IdPOP.Host:=FPopServer;
  IdPOP.Port:=FPopPort;
  IdPOP.Username:=FUserName;
  IdPOP.Password:=FCurPassword;
  Result:=true;
  OpenMessage(PadCStr('Подключение ...',40,' '));
  try
    IdPOP.Connect(15000);
  except
    on E:Exception do begin
      Result:=false;
      FLastError:=CreateErrorConnect(E.Message);
    end;
  end;
  CloseMessage;
  if Result then begin
    nCount:=idPOP.CheckMessages; //проверяем общее кол-во писем в папке ВХОДЯЩИЕ
//    Memo1.Lines.add('кол-во писем: '+Inttostr(i));
    IdPOP.UIDL(sl,-1);   // список сообщений в почтовом ящике
    sl.SaveToFile(GetPathEML+'uidl.txt');
    //---------------------------------------
    // обработка списка сообщений
    //---------------------------------------
    for i:=0 to sl.Count-1 do begin
      n:=Pos(' ',sl.Strings[i]); //  '3 4646464'
      sUD:=Trim(Copy(sl.Strings[i], n, 100));           // уникальный ID сообщения
      n:=StrToInt(Trim(Copy(sl.Strings[i], 1, n-1)));   // номер сообщения для чтения
      Msg.Clear;
      IdPOP.Retrieve(n,Msg);                       // запрашиваем письмо
      Msg.SaveToFile(GetPathEML+sUD+'.eml'); //сохраняем письмо в файл с соответствующим порядковым номером
    end;
  end;
  sl.Free;
  Msg.Free;
  if IdSocksInfo<>nil then begin
    IdSocksInfo.Free;
    IdSSLIOHandlerSocket.Free;
  end;
  idPOP.Free;
end;

//-----------------------------------------------------------------------
{
function TSMDO.ReceiveMailTest:Boolean;
var
  idPOP:TidPOP3;
  Msg:TidMessage;
  lOk:Boolean;
  IdSocksInfo:TIdSocksInfo;
  IdSSLIOHandlerSocket:TIdSSLIOHandlerSocket;
  nCount,i,j,n,m:Integer;
  s,sUD,sGUID,sFile:String;
  sl:TStringList;
  SearchRec:TSearchRec;
  lDel:Boolean;
begin
  if not CheckParamsConnect then begin
    Result:=false;
    ShowError;
    exit;
  end;
  sl:=TStringList.Create;
  IdSocksInfo:=nil;
  idPOP:=TidPOP3.Create(nil);
  Msg:=TidMessage.Create(nil);
  if FSSL then begin
//     !!!
//    IdSocksInfo:=TIdSocksInfo.Create(nil);
//    IdSSLIOHandlerSocket:=TIdSSLIOHandlerSocket.Create(nil);
//    IdSocksInfo.Authentication:= saNoAuthentication;
//    IdSocksInfo.Port:=FPopPort;
//    IdSocksInfo.Version:=svNoSocks;
//    IdSSLIOHandlerSocket.SocksInfo:=IdSocksInfo;
//    IdSSLIOHandlerSocket.SSLOptions.Method:=sslvTLSv1;
//    IdPOP.IOHandler:=IdSSLIOHandlerSocket; //
  end else begin
    IdPOP.IOHandler:=nil;
  end;
  IdPOP.Host:=FPopServer;
  IdPOP.Port:=FPopPort;
  IdPOP.Username:=FUserName;
  IdPOP.Password:=FCurPassword;
  Result:=true;
  OpenMessage(PadCStr('Подключение ...',40,' '));
  try
    IdPOP.Connect(15000);
  except
    on E:Exception do begin
      Result:=false;
      FLastError:=CreateErrorConnect(E.Message);
    end;
  end;
  CloseMessage;
  if Result then begin
    nCount:=idPOP.CheckMessages; //проверяем общее кол-во писем в папке ВХОДЯЩИЕ
//    Memo1.Lines.add('кол-во писем: '+Inttostr(i));
    IdPOP.UIDL(sl,-1);   // список сообщений в почтовом ящике
    sl.SaveToFile(GetPathEML+'uidl.txt');
    //---------------------------------------
    // обработка списка сообщений
    //---------------------------------------
    for i:=0 to sl.Count-1 do begin
      n:=Pos(' ',sl.Strings[i]); //  '3 4646464'
      sUD:=Trim(Copy(sl.Strings[i], n, 100));           // уникальный ID сообщения
      n:=StrToInt(Trim(Copy(sl.Strings[i], 1, n-1)));   // номер сообщения для чтения
      Msg.Clear;
      IdPOP.Retrieve(n,Msg);                       // запрашиваем письмо
      Msg.SaveToFile(GetPathEML+sUD+'.eml'); //сохраняем письмо в файл с соответствующим порядковым номером
    end;
  end;
  sl.Free;
  Msg.Free;
  if IdSocksInfo<>nil then begin
    IdSocksInfo.Free;
    IdSSLIOHandlerSocket.Free;
  end;
  idPOP.Free;
end;
}
//-----------------------------------------------------------------------
// проверить необходимость получения почты
function TSMDO.CheckReceiveMail(lVisible:Boolean):Integer;
var
  idPOP:TidPOP3;
  Msg:TidMessage;
  IdSocksInfo:TIdSocksInfo;
  IdSSLIOHandlerSocket:TIdSSLIOHandlerSocket;
  att:TIdAttachment;
  i,n:Integer;
  sl,sl1:TStringList;
  sUD,sErr:String;
begin
  Result:=0;
  FLastError:='';
  if not CheckParamsConnect then begin
    FLastError:='Заполните параметры СМДО';
    Result:=-1;
    exit;
  end;
  // предварительно проверить подключение IP+порт
  if FBeforeCheckTCP then begin
    if not CheckTCP(FPopServer, FPopPort, lVisible) then begin
      Result:=-1;
      exit;
    end;
  end;

  sl:=TStringList.Create;
  sl1:=TStringList.Create;
  idPOP:=TidPOP3.Create(nil);
  Msg:=TidMessage.Create(nil);
  IdSocksInfo:=nil;
  if FSSL then begin
//    { !!!
    IdSocksInfo:=TIdSocksInfo.Create(nil);
    IdSSLIOHandlerSocket:=TIdSSLIOHandlerSocket.Create(nil);
    IdSocksInfo.Authentication:= saNoAuthentication;
    IdSocksInfo.Port:=FPopPort;
    IdSocksInfo.Version:=svNoSocks;
    IdSSLIOHandlerSocket.SocksInfo:=IdSocksInfo;
    IdSSLIOHandlerSocket.SSLOptions.Method:=sslvTLSv1;
    IdPOP.IOHandler:=IdSSLIOHandlerSocket; //}
  end else begin
    IdPOP.IOHandler:=nil;
  end;
  if lVisible
    then OpenMessage(PadCStr('Подключение ...',40,' '));
  IdPOP.Host:=FPopServer;
  IdPOP.Port:=FPopPort;
  IdPOP.Username:=FUserName;
  IdPOP.Password:=FCurPassword;
  try
    IdPOP.Connect();
  except
    on E:Exception do begin
      if lVisible
       then CloseMessage;
      Result:=-1;
      FLastError:=CreateErrorConnect(E.Message);
    end;
  end;
  if Result>-1 then begin
    if lVisible
      then CloseMessage;
    IdPOP.UIDL(sl1,-1);   // список сообщений в почтовом ящике
    for i:=0 to sl1.Count-1 do begin
      n:=Pos(' ',sl1.Strings[i]); //  '3 4646464'
      sUD:=Trim(Copy(sl1.Strings[i], n, 100));   // уникальный ID сообщения
      if not SeekUID(sUD) then begin
        sl.Add(sl1.Strings[i]);
      end;
    end;
    Result:=sl.Count;
//-----------------------
    if (Result>0) and lVisible and (FCheckSizeMail>0) then begin
      n:=GetMsgSize(sl, idPop, sErr);
      if (sErr<>'') then begin
        FLastError:=sErr;
        Result:=-1;
      end else begin
        if Int((n/1024)/1024)>=FCheckSizeMail then begin
          if not Problem('Общий размер получаемых сообщений '+FormatFloat('### ###.#',(n/1024)/1024)+'МБ. Получить почту ?',mtConfirmation,nil) then begin
            sl.Clear;
            FLastError:='Отказ от получения почты';
            Result:=-2;
          end;
        end;
      end;
    end;
//-----------------------
    idPop.Disconnect;
  end;
  sl1.Free;
  sl.Free;
  FreeAndNil(idPop);
  FreeAndNil(Msg);
  if IdSocksInfo<>nil then begin
    IdSocksInfo.Free;
    IdSSLIOHandlerSocket.Free;
  end;
end;
//-----------------------------------------------------------------------
function TSMDO.DecodeMIME(s:String):String;
var
  CP: TMimeChar;
begin
// function InlineDecode(const Value: string; CP: TMimeChar): string;      mimeinln.pas
// function InlineCodeEx(const Value: string; FromCP: TMimeChar): string;  mimeinln.pas
  Result:=Trim(s);
  CP:=CP1251;
  Result:=InlineDecode(Result,CP )
  {
  if Copy(sFile,1,2)='=?' then begin
    if ANSIUpperCase(Copy(sFile,1,10))='=?UTF-8?B?' then begin
      n:=Pos('?=',sFile);
      if n>0 then begin
        Result:=Utf8ToAnsi( DecodeBase64(Copy(sFile,11,n-11)) );
        sFile:=Trim(Copy(sFile,n+2,Length(sFile)));
        s:=DecodeFileName(sFile);
        Result:=Result+s;
      end;
    end;
  end;
  }
end;
//-----------------------------------------------------------------------
function TSMDO.EncodeMIME(s:String):String;
begin
  Result:=InlineEncode(s, CP1251, UTF_8);
end;
//-----------------------------------------------------------------------
procedure TSMDO.CheckErrorRun;
begin
//  PutError('!!!!!!!!!!!!!!!!!!!!11');
end;
//-----------------------------------------------------------------------
function TSMDO.CreateErrorConnect(sError:String):String;
begin
  Result:='Ошибка подключения к почте СМДО:'#13#10+sError;
end;
//----------------------------------------------------------
procedure TSMDO.TCPClientStatus(ASender: TObject;  const AStatus: TIdStatus; const AStatusText: String);
begin
  Application.ProcessMessages;
end;

{
function PortAvailable(Port:STring):boolean;
var
  svr : TTCPBlockSocket;
begin
  svr := TTCPBlockSocket.Create;
  try
    svr.Bind('0.0.0.0',Port);
    svr.Listen;
    result := svr.LastError = 0;
    Svr.CloseSocket;
  finally
    svr.Free;
  end;
end;
}
//-----------------------------------------------------------------------
function TSMDO.CheckTCP(sIP:String; nPort:Integer; lShow:Boolean):Boolean;
var
  s:String;
  TCPClient:TIdTCPClient;
  sock: TTCPBlockSocket;  // SYNAPSE    uses->blcksock
begin
  Result:=false;
  FLastError:='';
  if lShow then OpenMessage(PadCStr('Проверка подключения ...',40,' '));

  sock := TTCPBlockSocket.create;
  try
    sock.Connect(sIP, inttostr(nPort));
    if sock.lasterror=0 then  begin
//      ShowMessage('Ok!');
      Result:=true;
    end else begin
      FLastError:='# '+inttostr(sock.LastError)+' '+sock.LastErrorDesc;
//      PutError('#'+inttostr(sock.LastError)+' '+sock.LastErrorDesc); // GetErrorDescEx);
    end;
    sock.closesocket;
  finally
    sock.free;
  end;
  {
  TCPClient:=TIdTCPClient.Create(nil);
  TCPClient.OnStatus:=TCPClientStatus;
  TCPClient.Host:=sIP;
  TCPClient.Port:=nPort;
  try
    TCPClient.Connect;
    Result:=true;
  except
    on E: EIdException do begin
      if E is EIdConnClosedGracefully then begin   // Соединение элегантно закрыто
        Result:=true;
      end else begin
        if Pos('# 11001',E.Message) > 0 then begin
          FLastError:='Адрес "'+TCPClient.Host+'" не найден.';
        end else if Pos('# 10060',E.Message) > 0 then begin
         FLastError:='Время ожидания "'+IntToStr(TCPClient.Port)+'" истекло.';
        end else begin
          FLastError:=E.Message;
        end;
      end;
    end;
  end;
//  Result:=TCPClient.Connected;
  try
    if TCPClient.Connected then
      TCPClient.Disconnect;
  except
  end;
  TCPClient.Free;
  }
  if lShow then CloseMessage;
end;
//-----------------------------------------------------------------------
function TSMDO.GetMsgSize(slSoob:TStringList; idPop:TidPOP3; var sSoob:String):Integer;
var
  Msg:TidMessage;
  i,n,nMsgSize:Integer;
  s,sUD:String;
  lCreate:Boolean;
begin
  sSoob:='';
  Result:=0;
  Msg:=TidMessage.Create(nil);
//  OpenMessage(PadCStr('Сбор статистики ...',40,' '));
  n:=0;
  sUD:='';
  lCreate:=false;
  try
  //  WriteTextLog('>>> '+StringReplace(FLastError, #13#10, ' ', [rfReplaceAll]));
    try
      if slSoob=nil then begin
        lCreate:=true;
        slSoob:=TStringList.Create;
        IdPOP.UIDL(slSoob,-1);   // список сообщений в почтовом ящике
      end;
//      s:='>>> Статистика ящика. Количество сообщений в ящике всего: '+IntToStr(sl1.Count);
//      Result:=slSoob.Count;
      for i:=0 to slSoob.Count-1 do begin
        Msg.Clear;
        n:=Pos(' ',slSoob.Strings[i]);                //  '3 4646464'
        sUD:=Trim(Copy(slSoob.Strings[i], n, 100));   // уникальный ID сообщения
        n:=StrToInt(Trim(Copy(slSoob.Strings[i], 1, n-1)));   // номер сообщения для чтения
        nMsgSize:=IdPOP.RetrieveMsgSize(n);               // запрашиваем размер письма
        Result:=Result+nMsgSize;
      end;
      WriteTextLog('размер сообщений в почтовом ящике: '+IntToStr(Result));
    except
      on E:Exception do begin
        Result:=0;
        sSoob:='Ошибка определения размера письма'#13#10+E.Message;
        WriteTextLog('ошибка определения размера письма ('+IntToStr(n)+') '+sUD+' '+E.Message);
      end;
    end;
  finally
    CloseMessage;
    Msg.Free;
    if lCreate
      then slSoob.Free;
  end
end;
//-----------------------------------------------------------------------
function TSMDO.CreateMsgList(idPop:TidPOP3; ds:TDataSet; var sSoob:String):Boolean;
var
  sl1:TStringList;
  Msg:TidMessage;
  i,n,nMsgSize:Integer;
  s,sUD:String;
begin
  sSoob:='';
  Result:=false;
  sl1:=TStringList.Create;
  Msg:=TidMessage.Create(nil);
  OpenMessage(PadCStr('Сбор статистики ...',40,' '));
  n:=0;
  sUD:='';
  try
  //  WriteTextLog('>>> '+StringReplace(FLastError, #13#10, ' ', [rfReplaceAll]));
    try
      IdPOP.UIDL(sl1,-1);   // список сообщений в почтовом ящике
      s:='>>> Статистика ящика. Количество сообщений в ящике всего: '+IntToStr(sl1.Count);
      for i:=0 to sl1.Count-1 do begin
        Msg.Clear;
        n:=Pos(' ',sl1.Strings[i]);                //  '3 4646464'
        sUD:=Trim(Copy(sl1.Strings[i], n, 100));   // уникальный ID сообщения
        n:=StrToInt(Trim(Copy(sl1.Strings[i], 1, n-1)));   // номер сообщения для чтения
        nMsgSize:=IdPOP.RetrieveMsgSize(n);               // запрашиваем размер письма
        IdPop.RetrieveHeader(n,Msg);
        ds.Append;
        ds.FieldByName('NOMER').AsInteger:=i+1;
        ds.FieldByName('RUN').AsInteger:=0;
        ds.FieldByName('SIZE').AsInteger:=nMsgSize;
        ds.FieldByName('DATE').AsDateTime:=Msg.Date;
        if SeekUID(sUD)
          then ds.FieldByName('STATUS').AsInteger:=1  // получено
          else ds.FieldByName('STATUS').AsInteger:=0; // новое
        ds.FieldByName('FROM').AsString:=Msg.From.Address;
        ds.FieldByName('SUBJECT').AsString:=DecodeMIME(Msg.Subject);
        ds.FieldByName('UID').AsString:=sUD;
        ds.Post;
        Application.ProcessMessages;
      end;
      Result:=true;
    except
      on E:Exception do begin
        sSoob:='Ошибка сбора статистики'#13#10+E.Message;
        Result:=false;
        WriteTextLog('ошибка сбора статистики письма ('+inttostr(n)+') '+sUD+' '+E.Message);
      end;
    end;
  finally
    CloseMessage;
    sl1.Free;
    Msg.Free;
  end
end;
//-----------------------------------------------------------------------
function TSMDO.DeleteMsgList(idPop:TidPOP3; ds:TDataSet; var sSoob:String):Boolean;
var
  sl1:TStringList;
  Msg:TidMessage;
  i,n,nMsgSize:Integer;
  s,sUD:String;
begin
  sSoob:='';
  Result:=false;
  sl1:=TStringList.Create;
  Msg:=TidMessage.Create(nil);
  OpenMessage(PadCStr('Удаление сообщений ...',40,' '));
  n:=0;
  sUD:='';
  try
    try
      IdPOP.UIDL(sl1,-1);   // список сообщений в почтовом ящике
      s:='>>> Удаление сообщений из ящика. Количество сообщений в ящике всего: '+IntToStr(sl1.Count);
      ds.First;
      while not ds.Eof do begin
        sUD:=ds.FieldByName('UID').AsString;
        if (ds.FieldByName('RUN').AsInteger=2) and (sUD<>'') then begin  // удаление
          for i:=0 to sl1.Count-1 do begin
            n:=Pos(' ',sl1.Strings[i]);                 //  '3 4646464'
            if sUD=Trim(Copy(sl1.Strings[i], n, 100)) then begin // уникальный ID сообщения
              n:=StrToInt(Trim(Copy(sl1.Strings[i], 1, n-1)));   // номер сообщения
              WriteTextLog('удаление собщения UID="'+sUD+'", "'+ds.FieldByName('SUBJECT').AsString+'" из ящика');
              idPOP.Delete(n);
              break;
            end;
          end;
        end;
        ds.Next;
        Application.ProcessMessages;
      end;
      Result:=true;
    except
      on E:Exception do begin
        sSoob:='Ошибка удаления сообщений'#13#10+E.Message;
        Result:=false;
        WriteTextLog('ошибка удаления письма ('+inttostr(n)+') '+sUD+' '+E.Message);
      end;
    end;
  finally
    CloseMessage;
    sl1.Free;
    Msg.Free;
  end
end;
//-----------------------------------------------------------------------
// получение почты
//-----------------------------------------------------------------------
function TSMDO.ReceiveMail(slPar:TStringList; var nCount:Integer; var nCountErr:Integer; var nCountUvd:Integer; nPost:Integer):Boolean;
var
  idPOP:TidPOP3;
  Msg:TidMessage;
  lUvd,lOk:Boolean;
  IdSocksInfo:TIdSocksInfo;
  IdSSLIOHandlerSocket:TIdSSLIOHandlerSocket;
  att:TIdAttachment;
  nID,i,j,n,m, nTypeRun:Integer;
  sSubject,sShow,s,sUD,sGUID,sFile,sSoob:String;
  sl,sl1,slUID:TStringList;
  SearchRec:TSearchRec;
  lResult, lHeaders, lDelete, lShow,lErr,lLoadPost, lVisible, lReceive, lDel:Boolean;
  dsMsgList:TDataSet;
  obj:TObject;
//  IdSSLIOHandlerSocket:TIdSSLIOHandlerSocket;
begin
  Result:=false;
  nCount:=0;
  nCountUvd:=0;
  nCountErr:=0;
  FCountAddFolder:=0;  // кол-во доп. материалов для других сообщений
  FWriteAddFolder:=0;  // кол-во доп. материалов успешно записанных
  FLastError:='';
  if not FPostEnabled then exit;
  //-----------------------------------------------------------------------------------------------
  lResult:=false;
  lDelete:=false;
  // !!! будем читать ТОЛЬКО заголовки всех писем и их размеры !!!
  lHeaders:=ValueFromParams(slPar,'HEADERS','0')='1';
  if lHeaders then begin
    obj:=ObjectFromParams(slPar,'HEADERS');
    if obj<>nil then dsMsgList:=TDataSet(obj) else dsMsgList:=nil;
  end else begin
    // !!! будем ТОЛЬКО удалять писма из dsMsgList по полю RUN=2 и UID !!!
    lDelete:=ValueFromParams(slPar,'DELETE','0')='1';
    if lDelete then begin
      obj:=ObjectFromParams(slPar,'DELETE');
      if obj<>nil then dsMsgList:=TDataSet(obj) else dsMsgList:=nil;
    end;
  end;
  //-----------------------------------------------------------------------------------------------
  if ValueFromParams(slPar,'CLEAR_LOG','1')='1'
    then FLocalLog.Clear;
  sShow:=ValueFromParams(slPar,'SHOWERROR','0');

  FTypeRun:=Globaltask.ParamAsInteger('SMDO_RUN');
  if FTypeRun=0 then FTypeRun:=3;
  nTypeRun:=StrToInt(ValueFromParams(slPar,'TYPERUN','-1'));
  if nTypeRun<0 then nTypeRun:=FTypeRun;
  if nTypeRun=10 then begin
    lVisible:=false;  // получаем почту тихо без показа
    sShow:='0';
  end else begin
    lVisible:=true;
  end;
  lLoadPost:=false;
  if sShow='0' then lShow:=false else lShow:=true;

  if FRun then begin
    FLastError:='Операция временно недоступна';
    if sShow='1' then ShowError;
    exit;
  end;
  if not CheckParamsConnect then begin
    if lShow then ShowError;
    exit;
  end;
  // предварительно проверить подключение IP+порт
  if FBeforeCheckTCP then begin
    if not CheckTCP(FPopServer, FPopPort, lVisible) then begin
      if lShow then ShowError;
      exit;
    end;
  end;

  FRun:=true;

  try

  if dmBase._LockTypeObj(_TypeObj_SMDOPost, 'Другой пользователь получает (отправляет) почту ...',lVisible) then begin
    try
      Result:=true;
      sl:=TStringList.Create;
      sl1:=TStringList.Create;
      slUID:=TStringList.Create;
      IdSocksInfo:=nil;
      idPOP:=TidPOP3.Create(nil);
      IdPOP.Host:=FPopServer;
      IdPOP.Port:=FPopPort;
      IdPOP.Username:=FUserName;
      IdPOP.Password:=FCurPassword;
      Msg:=TidMessage.Create(nil);
      IdSocksInfo:=nil;
      if FSSL then begin
//        { !!!
        IdSocksInfo:=TIdSocksInfo.Create(nil);
        IdSocksInfo.Authentication:= saNoAuthentication;
        IdSocksInfo.Port:=FPopPort;
        IdSocksInfo.Version:=svNoSocks;
        IdSSLIOHandlerSocket:=TIdSSLIOHandlerSocket.Create(nil);
        IdSSLIOHandlerSocket.SocksInfo:=IdSocksInfo;
        IdSSLIOHandlerSocket.SSLOptions.Method:=sslvTLSv1;
        IdPOP.IOHandler:=IdSSLIOHandlerSocket; //}
      end else begin
        IdPOP.IOHandler:=nil;
      end;
      if lVisible then OpenMessage(PadCStr('Подключение ...',40,' '));
      Result:=true;
      FFilesMail.CaseSensitive:=false;
      FTmpPath:=CheckSleshN(CreateTmpPath(0));
      try
        IdPOP.Connect();
      except
        on E:Exception do begin
          if lVisible then CloseMessage;
          Result:=false;
          FLastError:=CreateErrorConnect(E.Message);
          WriteTextLog('>>> '+StringReplace(FLastError, #13#10, ' ', [rfReplaceAll]));
        end;
      end;
      //==============================================
      if lHeaders and Result then begin
        RESULT:=FALSE; // !!!
        if lVisible then CloseMessage;
        lResult:=CreateMsgList(IdPop, TDataSet(obj), s);
        idPop.Disconnect;
        FLastError:=s;
      end;
      if lDelete and Result then begin
        RESULT:=FALSE; // !!!
        if lVisible then CloseMessage;
        lResult:=DeleteMsgList(idPop, TDataSet(obj), s);
        idPop.Disconnect;
        FLastError:=s;
      end;
      //==============================================
      // получение почты
      if Result then begin
        if lVisible then CloseMessage;
    //    nCount:=idPOP.CheckMessages; //проверяем общее кол-во писем в папке ВХОДЯЩИЕ
    //    Memo1.Lines.add('кол-во писем: '+Inttostr(i));
        IdPOP.UIDL(sl1,-1);   // список сообщений в почтовом ящике
//        s:='>>> '+StringOfChar('=',40);
        s:='>>> Получения почты. Количество сообщений в ящике всего: '+IntToStr(sl1.Count);
        for i:=0 to sl1.Count-1 do begin
          n:=Pos(' ',sl1.Strings[i]); //  '3 4646464'
          sUD:=Trim(Copy(sl1.Strings[i], n, 100));   // уникальный ID сообщения
          if nPost>1 then begin // хочу получить конкретное сообщение
            m:=StrToInt(Trim(Copy(sl1.Strings[i], 1, n-1)));   // номер сообщения для чтения
            if nPost=m then begin
              sl.Add(sl1.Strings[i]);
              break;
            end;
          end else begin
            if not SeekUID(sUD) then begin
              sl.Add(sl1.Strings[i]);
            end;
          end;
        end;
        if (sl.Count>0)
          then lLoadPost:=true;   // будем забирать почту
        if (sl.Count>0) or (sl1.Count>0)
          then WriteTextLog(s+', новых: '+IntToStr(sl.Count) );

        {  см. CheckReceiveMail(lVisible) !!!
        if lLoadPost and lVisible and (FCheckSizeMail>0) then begin
          n:=GetMsgSize(sl, idPop, s);
          if Int((n/1024)/1024)>=FCheckSizeMail then begin
            if not Problem('Общий размер получаемых сообщений '+FormatFloat('### ###.#',(n/1024)/1024)+'МБ. Получить почту ?',mtConfirmation,nil) then begin
              sl.Clear;
              lLoadPost:=false;
              nCount:=-1; // !!!
            end;
          end;
        end;
        }
    //    sl1.SaveToFile(GetPathEML+'uidl.txt');
        //---------------------------------------
        // обработка списка сообщений
        //---------------------------------------
        if lVisible and lLoadPost then begin
          if nTypeRun=1 then begin
//            fmMain.CheckVisibleGIF(true,'Получение почты',false);
            _WorkedThread_:=true;
            fmMain.CheckVisibleProgress(true,'Получение почты',false);
            EnterWorkerThread;
            idPop.OnWork:=IdWork_MainForm;
            idPop.OnWorkBegin:=IdWorkBegin_MainForm;
            idPop.OnWorkEnd:=IdWorkEnd_MainForm;
          end else if nTypeRun=2 then begin
            OpenMessage(' Получение почты ................');
          end else if nTypeRun=3 then begin
            idPop.OnWork:=IdWork;
            idPop.OnWorkBegin:=IdWorkBegin;
            idPop.OnWorkEnd:=IdWorkEnd;
            CreateProgress('Получение почты', sSoob, 100, 0,0);
            CheckEnabledScreen(false);
          end;
        end;

        try
          FMsgSize:=0;
          //---------------------------------------------------------------------
          // обработка списка сообщений
          //---------------------------------------------------------------------
          for i:=0 to sl.Count-1 do begin
            if lVisible then begin
              sSoob:=' Получение почты '+intToStr(i+1)+'/'+intToStr(sl.Count);
              if nTypeRun=1 then begin
                EnterMainThread;
                try
                  fmMain.SetCaptionPanel0(sSoob);
                finally
                  LeaveMainThread;
                end;
              end else if (nTypeRun=2) or (nTypeRun=3) then begin
                ChangeMessage(sSoob);
              end;
            end;
            sGUID:='';
            sSubject:='';

            ClearTmpValues;

            XML.Clear;
            FNameFileXML:='';
            n:=Pos(' ',sl.Strings[i]); //  '3 4646464'
            sUD:=Trim(Copy(sl.Strings[i], n, 100));           // уникальный ID сообщения
            n:=StrToInt(Trim(Copy(sl.Strings[i], 1, n-1)));   // номер сообщения для чтения

            Msg.Clear;
//            FreeAndNil(Msg);
//            Msg:=TidMessage.Create(nil);

            WriteTextLog(StringOfChar('-',50));
            WriteTextLog('получение письма UID: '+sUD);
            lUvd:=false;
            lDel:=false;
            lReceive:=false;
            lErr:=false;
            try
              FMsgSize:=IdPOP.RetrieveMsgSize(n);               // запрашиваем размер письма
            except
              on E:Exception do begin
                WriteTextLog('ошибка определения размера письма ('+inttostr(n)+') '+sUD+' '+E.Message);
                FMsgSize:=100;
              end;
            end;
            if nTypeRun=3 then begin
              InitProgress(FMsgSize,sSoob+chr(13)+Chr(10)+'Размер сообщения '+IntToStrSep(FMsgSize,','));
            end else if nTypeRun=10 then begin
              if Assigned(FOnUpdateWinReceiceMail) then begin
                EnterMainThread;
                try
                  FOnUpdateWinReceiceMail(i+1,sl.Count);
                finally
                  LeaveMainThread;
                end;
              end;
            end;
    //    Sz:=idPOP.RetrieveMsgSize(5); // Возвращает приблизительный размер указанного письма. Для этого отсылает команду: LIST 5.
                                     //Точный размер письма заранее определить невозможно, поскольку POP3-сервер может скорректировать его заголовки в процессе загрузки.
    //    Sz:=idPOP.RetrieveMailBoxSize; 	Возвращает общий размер писем в почтовом ящике.
                       //а затем последовательно суммирует размер каждого из писем. Обычно в данной функции нет необходимости,
                       //поскольку все равно приходится перебирать все письма и для каждого определять размер с помощью RetrieveMsgSize.
            lOk:=false;
            try
              lOk:=IdPOP.Retrieve(n,Msg);                       // запрашиваем письмо
              lReceive:=lOk;     // письмо получено
            except
              on E:Exception do begin
                WriteTextLog('ошибка получения письма ('+inttostr(n)+') '+sUD+' '+E.Message);
                lOK:=false;
              end;
            end;
            if lOk then begin
              sSubject:=DecodeMIME(Msg.Subject);
              WriteTextLog('сообщение от '+Msg.From.Address+' получено '+sSubject );
      //!!! берем из входного xml       sGUID:=GetGUID(true);
              ClearDir(FTmpPath,false);
              //---- сохраним вложения -----------------
              for j:=0 to Msg.MessageParts.Count-1 do begin
        //      if IdMessage1.MessageParts.Items[i] is TIdTExt then
                if Msg.MessageParts.Items[j] is TIdAttachment then begin   // прикрепленный файл
                  att:=TIdAttachment(Msg.MessageParts.Items[j]);
                  try
                    sFile:=DecodeMIME(att.FileName);
                    if Copy(sFile,1,2)<>'=?' then begin
                      if FileExists(FTmpPath+sFile) then DeleteFile(FTmpPath+sFile);
                      att.SaveToFile(FTmpPath+sFile);
                      FFilesMail.Add(sFile);
                    end;
                  except
                    on E:Exception do begin
                      s:='ошибка сохранение вложения: '+FTmpPath+sFile+'  '+E.Message+' ('+
                                 IntToStr(GetLastError)+' '+SysErrorMessage(GetLastError)+')';

                      //PutError(s);
                      WriteTextLog(s);
                      AckResultAdd(ceXML,'','','');
                      lOk:=false;
                      ErrorToSMDO('', '', sSubject, '', s);  // запишем в почту
                    end;
                  end;
                end;
              end;
              //-----------------------------------------
            end else begin
              WriteTextLog('письмо не получено');
            end;
            sl1.Clear;
            //---письмо полностью получено------------------------------
            if lOk then begin
              lOk:=FindFirst(FTmpPath+'*.xml', faAnyFile, SearchRec) = 0;
              if lOk then begin
                repeat
                  if (SearchRec.Name[1] <> '.') and (SearchRec.Attr and faVolumeID <> faVolumeID) and (SearchRec.Attr and faDirectory <> faDirectory) then begin
                    if (Pos('_data',ANSILowerCase(SearchRec.Name))>0) or (Pos('_ack',ANSILowerCase(SearchRec.Name))>0) then begin
                      sl1.Add(SearchRec.Name);
                      if Pos('_ack',ANSILowerCase(SearchRec.Name))>0
                        then lUvd:=true;
                    end;
                  end;
                until FindNext(SearchRec) <> 0;
              end;
              FindClose(SearchRec);
              if sl1.Count=0 then begin
                s:='В сообщении не найден XML-файл';
                WriteTextLog(s);
                AckResultXML(s);
                lOk:=false;
                ErrorToSMDO('', '', sSubject, '', s);  // запишем в почту
              end else begin
                for j:=0 to sl1.Count-1 do begin
                  try
                    XML.Clear;
                    FNameFileXML:=sl1.Strings[j];
                    XML.LoadFromFile(FTmpPath+FNameFileXML);
                    m:=FFilesMail.IndexOf(FNameFileXML);
                    if m>-1 then FFilesMail.Delete(m);      // удалим XML файл из списка файлов вложений
                    if (XML.Root.ReadAttributeString('type')<>'') and (XML.Root.ReadAttributeString('msg_id')<>'') then begin // мой XML
                      try
                        // сохраним полученный XML с специальную папаку
                        CopyFile(PChar(FTmpPath+FNameFileXML), PChar(GetPathXML('')+FNameFileXML), false);
                      except
                      end;
                      sGUID:=XMLtoVALUE(XML.Root.ReadAttributeString('msg_id'),ftString,'');
                      break;
                    end;
                  except
                    on E:Exception do begin
                      lOk:=false;
                      WriteTextLog(E.Message);
                      AckResultXML(E.Message);
                      ErrorToSMDO('', '', sSubject, '', 'Ошибка чтения XML-файла '+sl1.Strings[j]+' : '+E.Message);  // запишем в почту
                    end;
                  end;
                end;
              end;
              if not lOk then begin  // письмо совсем некорректное
                Msg.SaveToFile(GetPathEML+'IN_UID_'+sUD+'.eml');    // сохраняем письмо в файл
                lErr:=true;
              end;
              //------нет физических ошибок и есть наш файл XML -------------------
              nID:=-2;
              if (FAckResult.Count=0) and not XML.IsEmpty then begin
                if FSaveEML then begin
                  if not lUvd or FSaveEML_A then begin     // если документ или сохранять и уведомления
                    try
                      Msg.SaveToFile(GetPathEML+'IN_'+sGUID+'.eml');    // сохраняем письмо в файл
                      WriteTextLog('сохранение собщения в файл: '+GetPathEML+'IN_'+sGUID+'.eml');
                    except
                      on E:Exception do begin
                        WriteTextLog('ошибка сохранения собщения '+GetPathEML+'IN_'+sGUID+'.eml:'+E.Message);
                      end;
                    end;
                  end;
                end;
                nID:=XMLtoSMDO(Msg.From.Address, sGUID);
                if (nID=-1) or (nID=0) then begin
                  lDel:=true;
                end;
//!!!    см. ниже            AddUID(sUD);
                slUID.Add(sUD);
//                nCount:=nCount+1;
//                if lUvd
//                  then nCountUvd:=nCountUvd+1;
              end else begin
                lDel:=true;
              end;
              // !!! если сообщение явно ошибочное удалим его из ящика
              if lDel then begin
                WriteTextLog('собщение "'+sUD+'" ошибочное '+(inttostr(nID))+' и будет удалено, без записи в базу');
                lErr:=true;
              end;
              if FDeletingPost or lDel then begin
                WriteTextLog('удаление собщения "'+sUD+'" из ящика');
                idPOP.Delete(n);
              end;
            end else begin
              lErr:=true;
            end;
            if lReceive then begin // если письмо получено
              nCount:=nCount+1;
              if lErr then begin   // есть ошибки
                Inc(nCountErr,1);
              end else if lUvd then begin
                Inc(nCountUvd,1);
              end;
            end;
            //------- !!! получаем только одно сообщение !!! ---------------------------
            if nPost>0 then begin
              break;
            end;
            //-------------------------------------------------------------------

          end;
          //---------------------------------------
          // конец обработки списка сообщений
          //---------------------------------------

        finally
          if lVisible and lLoadPost then begin
            if nTypeRun=1 then begin
              EnterMainThread;
              try
                fmMain.CheckVisibleProgress(false,'', false);
              finally
                LeaveMainThread;
              end;
              LeaveWorkerThread;
              _WorkedThread_:=false;
//              fmMain.CheckVisibleGIF(false,'');
              idPop.OnWork:=nil;
              idPop.OnWorkBegin:=nil;
              idPop.OnWorkEnd:=nil;
            end else if nTypeRun=2 then begin
              CloseMessage;
            end else if nTypeRun=3 then begin
              CheckEnabledScreen(true);
              idPop.OnWork:=nil;
              idPop.OnWorkBegin:=nil;
              idPop.OnWorkEnd:=nil;
              CloseProgress;
            end;
          end;
          idPop.Disconnect;
          //----- фиксируем, что сообщения прочитаны только после Disconnect ------------
          for i:=0 to slUID.Count-1 do begin
            AddUID(slUID.Strings[i]);
          end;
          //-----------------------------------------------------------------------------
          if lLoadPost
            then WriteTextLog('<<< Отключение после получения почты');
        end;
      end;
      // end получение почты
      //==============================================
      sl1.Free;
      sl.Free;
      slUID.Free;
      FreeAndNil(idPop);
      FreeAndNil(Msg);
      if IdSocksInfo<>nil then begin
        IdSocksInfo.Free;
        IdSSLIOHandlerSocket.Free;
      end;
      ClearDir(FTmpPath,false);
    finally
      dmBase._UnLockTypeObj(_TypeObj_SMDOPost);
    end;
  end else begin
    FLastError:='Отказ';
    Result:=false;
  end;

  finally
    FRun:=false;
  end;
  // !!! ==============================================
  if lHeaders or lDelete then begin
    Result:=lResult;
  end;
  //===================================================

//  ShowLocalLog(false);

//  FreeAndNil(IdSSLIOHandlerSocket);
end;

//-----------------------------------------------------------------------
// запись ошибочной ситуации в базу при получении почты
function TSMDO.ErrorToSMDO(sFrom:String; sOrgID:String; sSubject:String; sGUID:String; sError:String) : Boolean;
begin
  Result:=true;
  if FWriteToBaseError then begin
    if sGUID='' then sGUID:=GetGUID(false);
    with dmBase.SMDOPost do begin
      // ID, DOC_ID
      // ack_type  msg_id regnumber regdate  incnumber incdate
      FieldByName('ID').AsInteger:=dmBase.GetNewID(_TypeObj_SMDOPost);
      FieldByName('MSG_ID').AsString:=sGUID;
      FieldByName('MSG_TYPE').AsInteger:=MSG_TYPE_D;
      FieldByName('MSG_ACKNOW').AsInteger:=0; //nMsgAckNow;
      FieldByName('SUBJ_ADRESAT').AsString:=sFrom;
      FieldByName('SUBJECT').AsString:=sSubject;
      FieldByName('SUBJ_SYSTEM').AsInteger:=0;
      FieldByName('SUBJ_ERROR').AsBoolean:=true;
      FieldByName('MY_REGNUMBER').AsString:='';
      FieldByName('DTSTAMP').AsDateTime:=Now;
      FieldByName('COUNT_POST').AsInteger:=0;
      FieldByName('SMDOCODE').AsString:=sOrgID;
      if sOrgID<>'' then begin
        if dmBase.SMDOSprOrg.Locate('smdocode',sOrgID,[]) then begin
          FieldByName('NAME').AsString:=dmBase.SMDOSprOrg.FieldByName('NAME').AsString;
        end;
      end;
      FieldByName('ACK_MSG_ID').AsString:='';
      FieldByName('ACK_TYPE').AsInteger:=0;
      FieldByName('SUBJ_TYPE').AsInteger:=1;
      FieldByName('DATEPOST').AsDateTime:=Now;  // дата и время получения
      FieldByName('TEXT').AsString:='';
      if sError=''
        then FieldByName('ERROR_TEXT').AsString:=AckResult2Text
        else FieldByName('ERROR_TEXT').AsString:=sError;
      Post;
    end;
  end;
end;
//-----------------------------------------------------------------------
procedure TSMDO.ClearTmpValues;
begin
  FAckResult.Clear;
  FAckResultOk.Clear;
  FFilesMail.Clear;
  FCurMsgType:=-1;
  FDokIdNumber:='';
  FRefIdNumber:='';
  FCheckReferred:=false;
end;
//-----------------------------------------------------------------------
function TSMDO.XMLtoSMDO(sFrom:String; sGUID:String) : Integer;
var
  sIdNumber,sTempID,sss,s,s1,s2,s3,s4,sSysID,sSystem,sSystemDetails,sMsgID,sSubject,sNode,sOrgID,sOrgName:String;
  lSender,lMyReceiver,lReceiver:Boolean;
  dDtStamp, dRegNumber, dIncNumber:TDateTime;
  sl:TStringList;
  node_var, node_exp, node_receiver, node_task,node_folder,node_doc,node,node1,node_header,node_body:TXMLNode;
  nCountPost, nPostID,nTaskID,i,j,n,nMsgAckNow, nAckType, nErrDoc:Integer;
  sErr, sType,sPath,sRegNumber, sIncNumber, sBM, sAckMsgID:String;
  lOk,lFind:Boolean;
  ListTask,ListFolder:TList;
  function getUser:String;
  begin result:=Role.User; end;
begin
//  sFrom:=sFrom;    // адрес отправителя
  ClearDS;
  //=======================
  RESULT:=-1;  // !!!
  //=======================
  nPostID:=0;
  FCurMsgType:=-1;
  FDokIdNumber:='';
  FRefIdNumber:='';
  FCheckReferred:=false;
  sOrgID:='';
  sOrgName:='';
  FCurText:='';
  sType:=XML.Root.ReadAttributeString('type');  //   SDIP-1.0; SDIP-2.1.1

  FVersionXML_IN:=100;
  if sType='SDIP-1.0' then begin
    FVersionXML_IN:=100;
  end else if sType='SDIP-2.1.1' then begin
    FVersionXML_IN:=211;
  end;

  sMsgID:=XML.Root.ReadAttributeString('msg_id');
  dDtStamp:=XMLToValue(XML.Root.ReadAttributeString('dtstamp'),ftTimeStamp,0);
  if dDtStamp=0
    then AckResultAdd(ceTYPE_ATR_ZONE,'dtstamp','','Envelop');
  sSubject:=XMLToValue(XML.Root.ReadAttributeString('subject'),ftString,'');

  node_header:=nil;
  node_body:=nil;
  node_exp:=nil;
  //------- КОНТРОЛЬ ---------------------
  for i:=0 to XML.Root.NodeCount-1 do begin
    sNode:=ANSILowerCase(XML.Root.Nodes[i].Name);
    if sNode='header' then begin
      if node_header=nil
        then node_header:=XML.Root.Nodes[i]
        else AckResultAdd(ceNNN_ZONE,'header','','');
    end;
    if sNode='body' then begin
      if node_body=nil
        then node_body:=XML.Root.Nodes[i]
        else AckResultAdd(ceNNN_ZONE,'body','','');
    end;
  end;
  if node_body=nil then AckResultAdd(ceNOT_ZONE,'body','','');
  if node_header=nil then AckResultAdd(ceNOT_ZONE,'header','','');

  if FAckResult.Count>0 then begin
    WriteTextLog(AckResult2Text(';'));
    EXIT;  // !!!
  end;

  s:=XMLToValue(node_header.ReadAttributeString('msg_type'),ftString,'-1');
  FCurMsgType:=StrToIntDef(s,-1);
  if (FCurMsgType<0) or (FCurMsgType>4) then AckResultAdd(ceVID,'','','');
  nMsgAckNow:=StrToInt(XMLToValue(node_header.ReadAttributeString('msg_acknow'),ftString,'2'));
//  ceNOT_ATR_EL_ZONE ('Отсутствует обязательный атрибут %0:s элемента %0:s зоны сообщения %0:s', [sAtr,sEl,sZone]);

  lMyReceiver:=false;
  lReceiver:=false;
  lSender:=false;
  node_receiver:=nil;
//  FMens.E slReceiverPerson:=TStringList.Create;
  for i:=0 to node_header.NodeCount-1 do begin
    sNode:=ANSILowerCase(node_header.Nodes[i].Name);
    node:=node_header.Nodes[i]; //node_header.FindNode('sender');
    if sNode='sender' then begin    // отправитель
      lSender:=true;
      sOrgID:=XMLToValue(node.ReadAttributeString('id'),ftString,'');
      if sOrgID='' then AckResultAdd(ceNOT_ATR_EL_ZONE,'header','sender','id');
      sOrgName:=XMLToValue(node.ReadAttributeString('name'),ftString,'');
      if sOrgName='' then AckResultAdd(ceNOT_ATR_EL_ZONE,'header','sender','name');

      sSysID:=XMLToValue(node.ReadAttributeString('sys_id'),ftString,'');
      if sSysID='' then AckResultAdd(ceNOT_ATR_EL_ZONE,'header','sender','sys_id');
      //----- BEGIN VERSION -----------------------------------------------------
      sSystem:=XMLToValue(node.ReadAttributeString('system'),ftString,'');
      if (sSystem='') and (FVersionXML_IN>=211)
        then AckResultAdd(ceNOT_ATR_EL_ZONE,'header','sender','systеm');
      sSystemDetails:=XMLToValue(node.ReadAttributeString('system_details'),ftString,'');
      if (sSystemDetails='') and (FVersionXML_IN>=211)
        then AckResultAdd(ceNOT_ATR_EL_ZONE,'header','sender','system_details');
      //----- END VERSION -----------------------------------------------------
      CheckSprWork(sOrgID,sOrgName,sSysID,sSystem,true);
    end else if sNode='receiver' then begin    // получатель
      lReceiver:=true;
      s:=XMLToValue(node.ReadAttributeString('id'),ftString,'');
      if not FCheckMyOrg or IsMyOrg(s) then begin  // в получателях есть моя организация или не контролируем
        node_receiver:=node;  // !!!
        lMyReceiver:=true;
        node1:=node.FindNode('organization');
        if node1<>nil then begin
          for j:=0 to node1.NodeCount-1 do begin
            sNode:=ANSILowerCase(node1.Nodes[j].Name);
            if sNode='officialperson' then begin
              AddMen(0, MEN_RECEIVER, node1.Nodes[j], node1);
            end;
          end;
        end;
//        node1:=node.FindNode('privateperson');
//        if node1<>nil then begin
//          AddMen(-1, 0,node1.Nodes[i], nil);
//        end;
      end;
    end;
  end;
  if not lSender then begin
    AckResultXML('Отсутствует элемент sender');
    WriteTextLog(AckResult2Text(';'));
    EXIT;
  end;
  //=======================
  RESULT:=0;   // !!!
  //=======================

  if not lReceiver   then AckResultAdd(ceRECEIVER,'','','');   // нет получателя
  if not lMyReceiver then AckResultAdd(ceORG,'','','');        // нет моей орг. в получателях

  sRegNumber:='';
  sIncNumber:='';
  dRegNumber:=0;
  dIncNumber:=0;
  nAckType:=0;
  if FAckResult.Count>0 then begin
    WriteTextLog(AckResult2Text(';'));
  end else begin
    if node_receiver<>nil then begin
      if not RefToSMDO(node_receiver, 0, sOrgID, sErr, sss) then begin // разберем из Receiver его Referred
        AckResultXML(sErr);
      end else begin
        FRefIdNumber:=sss;
      end;
    end;

    nCountPost:=1;
    if dmBase.SMDOPost.Locate('MSG_ID', sMsgID, []) then begin
      n:=dmBase.SMDOPost.FieldByName('COUNT_POST').AsInteger;
      if n<=0 then n:=1;
      nCountPost:=n+1;
      WriteTextLog('Сообщение с msg_id '+sMsgID+' уже было получено ранее, будет перезаписано');
      dmBase.DeleteDokument(dmBase.SMDOPost, _TypeObj_SMDOPost, false );  // удаление дубликата !!!
    end;
    sl:=TStringList.Create;
    //--------------------------------------------------------------------
    //-------- УВЕДОМЛЕНИЕ -----------------------------------------------
    //--------------------------------------------------------------------
    if FCurMsgType=MSG_TYPE_A then begin
      WriteTextLog('Получено уведомление ('+sType+')');
      nErrDoc:=0;
      node:=node_body.FindNode('Acknowledgement');
      if node=nil then begin
        AckResultXML('В уведомлении отсутствует элемент Acknowledgement');
      end else begin
        sAckMsgID:=XMLtoValue(node.ReadAttributeString('msg_id',''),ftString,'');
        { 1-о доставке   2-о регистрации   3-зарезервировано  4-пользовательское
          100-при успешной доставке в ядро,         101-при успешной отправке адресату
          102-(нет) 103-доставке в ядро с ошибками  104-у получателя заблокирован доступ к СМДО
          105-пакет сформировани по старому формату
        }
        nAckType:=XMLtoValue(node.ReadAttributeString('ack_type',''),ftInteger,0);
        if (sAckMsgID='') or (nAckType=0) then begin
          AckResultXML('В уведомлении отсутствуют атрибуты (msg_id или ack_type) в элементе Acknowledgement');
        end else begin
          for i:=0 to node.NodeCount-1 do begin
            sNode:=ANSILowerCase(node.Nodes[i].Name);
            if sNode='ackresult' then begin
              s:=Trim(XMLtoValue(node.Nodes[i].ReadAttributeString('errorcode',''),ftString,''));
              if s='' then s:='0';
              try
                n:=StrToInt(s);
              except
                n:=0;
              end;
              if (nErrDoc=0) and (n<>0)   // !!! мой документ был ошибочный или не подлежит регистрации !!!
                then nErrDoc:=n;
              sl.Add(s+'='+XMLtoValue(node.Nodes[i].ValueAsString,ftString,''));
            end else if sNode='regnumber' then begin
              sRegNumber:=XMLtoValue(node.Nodes[i].ValueAsString,ftString,'');
              dRegNumber:=XMLtoValue(node.Nodes[i].ReadAttributeString('regdate',''),ftDate,0);
            end else if sNode='incnumber' then begin
              sIncNumber:=Trim(XMLtoValue(node.Nodes[i].ValueAsString,ftString,''));
              dIncNumber:=XMLtoValue(node.Nodes[i].ReadAttributeString('regdate',''),ftDate,0);
            end;
          end;
          // nErrDoc=0 1,2,3  то документ относиться к категории нерегистрируемых, отказ в регистрации, нет доверия ЭЦП
          if (nAckType=ACK_REGISTER) and (nErrDoc=0) and ((sIncNumber='') or (dIncNumber=0)) then begin
            AckResultXML('В уведомлении отсутствуетют элемент incnumber или атрибут regdate у элемента incnumber в элементе Acknowledgement');
          end;
        end;
      end;
      if FAckResult.Count=0 then begin
        with dmBase.SMDOPost do begin
          Append;
          // ID, DOC_ID
          // ack_type  msg_id regnumber regdate  incnumber incdate
          // ЗАПИШЕМ УВЕДОМЛЕНИЕ О ПОЛУЧЕНИИ МОЕГО СООБЩЕНИЯ
          FieldByName('USER_CREATE').AsString:=getUser; // см.выше
          FieldByName('SUBJ_ERROR').AsBoolean:=false;
          FieldByName('SUBJ_SYSTEM').AsInteger:=getSubjSystem(sOrgID);
          FieldByName('ID').AsInteger:=dmBase.GetNewID(_TypeObj_SMDOPost);
          FieldByName('MSG_ID').AsString:=sMsgID;
          FieldByName('MSG_TYPE').AsInteger:=FCurMsgType;
          FieldByName('MSG_ACKNOW').AsInteger:=nMsgAckNow;
          FieldByName('SUBJ_ADRESAT').AsString:=sFrom;
          FieldByName('SUBJECT').AsString:=sSubject;
          FieldByName('DTSTAMP').AsDateTime:=dDtStamp;
          FieldByName('SMDOCODE').AsString:=sOrgID;
          FieldByName('NAME').AsString:=sOrgName;
          FieldByName('ACK_MSG_ID').AsString:=sAckMsgID;
          FieldByName('ACK_TYPE').AsInteger:=nAckType;
          FieldByName('SUBJ_TYPE').AsInteger:=1;   // входящий
          FieldByName('COUNT_POST').AsInteger:=nCountPost;

  //        FieldByName('SUBJ_STAT').AsInteger:=SUBJ_STAT_UVD;
//          FieldByName('DOC_STATUS').AsInteger:=DOC_PRESENT; // CREATE;

          FieldByName('MY_REGNUMBER').AsString:=sRegNumber;    // мой документ который был зарегистрирован
          if dRegNumber>0 then begin
            Date2Field(FieldByName('MY_REGDATE'), dRegNumber);
          end;
          FieldByName('ADR_REGNUMBER').AsString:=sIncNumber;
          if dIncNumber>0
            then Date2Field(FieldByName('ADR_REGDATE'),dIncNumber);
          s:='';
          for i:=0 to sl.Count-1 do begin
            s:=s+sl.Strings[i]+chr(13)+chr(10);
          end;
          if s<>''
            then s:=Copy(s,1,Length(s)-2);
          FieldByName('TEXT').AsString:=s;
          FCurText:=s;
          FieldByName('DATEPOST').AsDateTime:=Now;  // дата и время получения
          Post;
          //=======================================
          RESULT:=FieldByName('ID').AsInteger;   // !!!
          //=======================================

          sBM:=BookMark;
          //========================================================================================
          //========================= поищем наше отправленное сообщение ===========================
          //========================================================================================
          lFind:=false;
          if Locate('MSG_ID', sAckMsgID, []) then begin
            lFind:=true;
            {
                Можно проверить sRegNumber  и  SMDOPost.FieldByName('MY_REGNUMBER').AsString, должны быть равны !!!
            }
            Edit;
            WriteTextLog('найден документ "'+sAckMsgID+'"  №'+FieldByName('MY_REGNUMBER').AsString);

  { категория документов не относящихся к регистрации и присланных для сведения (повестки, планы, программы и тд.), которые определены принимающей
    стороной как неподлежащие регистрации, должнЫ быть оформлены в соответствии с общими требованиями (квитантирование о доставке и регистрации
    документа должно остаться, допустимо формирование квитанции о регистрации с примерным содержанием:
    (документ принят в работу, регистрации не подлежит), в качестве Incumbеr возвращать к примеру <Регистрации не подлежит> }
            //---- о регистрации -------------------------------------------------------------------------
            if nAckType=ACK_REGISTER then begin  // ACK_TYPE=2
              FieldByName('ACK_TYPE').AsInteger:=nAckType;
              if nErrDoc=1 then begin  // получена квитанция о нерегистрируеммом документе
                FieldByName('ADR_REGNUMBER').AsString:=NAME_NOT_REGISTER;
                WriteTextLog('записан ACK_TYPE='+Inttostr(nAckType)+' документ не подлежит регистрации');
              end else if nErrDoc=2 then begin  // отказ в регистрации
                FieldByName('ADR_REGNUMBER').AsString:=NAME_NOT_OTKAZ;
                WriteTextLog('записан ACK_TYPE='+Inttostr(nAckType)+' документ отказ в регистрации');
              end else if nErrDoc=3 then begin  // нет доверия ЭЦП
                FieldByName('ADR_REGNUMBER').AsString:=NAME_NOT_ETSP;
                WriteTextLog('записан ACK_TYPE='+Inttostr(nAckType)+' документ нет доверия ЭЦП');
              end else begin
//                FieldByName('DOC_STATUS').AsInteger:=DOC_REGISTER;      // получена квитанция о рег. документа
                // дата и рег. номер у получателя сообщения
                if sIncNumber<>'' then begin
                  FieldByName('ADR_REGNUMBER').AsString:=sIncNumber;
                  if dIncNumber>0
                    then Date2Field(FieldByName('ADR_REGDATE'),dIncNumber);
                end;
                WriteTextLog('записан ACK_TYPE='+Inttostr(nAckType)+' документ зарегистрирован');
              end;
            //---- о доставке -------------------------------------------------------------------------
            end else if nAckType=ACK_DELIVER then begin // ACK_TYPE=1
              if FieldByName('ACK_TYPE').AsInteger>1 then begin // ACK_REGISTER  уведомление о регистрации было получено раньше уведомления о доставке
                WriteTextLog('не записан ACK_TYPE='+Inttostr(nAckType)+'(доставка) так как документ уже зарегистрирован');

              end else begin
                FieldByName('ACK_TYPE').AsInteger:=nAckType;
                if nErrDoc=0 then begin
                  FieldByName('SUBJ_ERROR').AsBoolean:=false;
                  WriteTextLog('записан ACK_TYPE='+Inttostr(nAckType)+' документ доставлен');
                end else begin
                  FieldByName('SUBJ_ERROR').AsBoolean:=true;   // получена квитанция о том что докумен ошибочный
                  FieldByName('ERROR_TEXT').AsString:=FCurText;
                  WriteTextLog('записан ACK_TYPE='+Inttostr(nAckType)+' документ ошибочный '+FCurText);
                end;
              end;
            end else if nAckType=3 then begin      // зарезервировано

            end else if nAckType=4 then begin      // ползовательский

            end else if nAckType>=100 then begin   // системный

            end else begin                         // ошибка
               // неизвестное уведомление
            end;
            Post;
          end;
          //-----------------------------------------------------------------------
          Bookmark:=sBM;
          if not lFind then begin  // документ не найден
            WriteTextLog('Для прикрепления квитанции "'+sMsgID+'" сообщение "'+sAckMsgID+'" не найдено');
            Edit;
            FieldByName('SUBJ_ERROR').AsBoolean:=true;
            FieldByName('ERROR_TEXT').AsString:='Сообщение "'+sAckMsgID+'" не найдено';
            Post;
          end;
        end;
      end;
    end else begin
    //----------------------------------------------
    //------ ДОКУМЕНТ ------------------------------
    //----------------------------------------------
      node:=node_body.FindNode('Datadir');
      if node=nil then begin
        WriteTextLog('Получено сообщение ('+sType+') : '+NameMsgType(FCurMsgType));
        lOk:=true;
        ListTask:=TList.Create;
        ListFolder:=TList.Create;
        node_doc:=node_body.FindNode('Document');
        node_exp:=node_body.FindNode('Expansion');  // !!!

        //  если не документ и тэг <Document> отсутствует
        if not MsgIsAddDoc(FCurMsgType) and (node_doc=nil) then begin
          AckResultXML('Отсутствует элемент document');
          lOk:=false;
        end;
        node_task:=node_body.FindNode('TaskList');
        if lOk and (node_task<>nil) then begin
          node_task.FindNodes('task',ListTask);
          if ListTask.Count=0 then begin
            AckResultXML('Отсутствуют элементы task в элементе tasklist');
            lOk:=false;
          end;
        end;
        node:=node_body.FindNode('AddDocuments');
        if lOk and (node<>nil) then begin
          node.FindNodes('folder',ListFolder);
        end;
        // в дополнении к основному документу нет "Задания" или  "Дополнительные материалы"
        if (FCurMsgType=MSG_TYPE_DA) and (ListTask.Count=0) and (ListFolder.Count=0) then begin
          AckResultXML('Отсутствуют обязательные элементы Task в зоне Tasklist или элемент Folder в зоне AddDocuments');
          lOk:=false;
        // в дополнении к документу ответа нет "Дополнительные материалы"
        end else if (FCurMsgType=MSG_TYPE_OA) and (ListFolder.Count=0) then begin
          AckResultXML('Отсутствует обязательный элемент Folder в зоне AddDocuments');
          lOk:=false;
        end;
        if lOk then begin
          lOk:=false;
          dmBase.SMDOPost.Append;
    //    BeginTransaction;
          if node_doc=nil
            then lOk:=true
            else lOk:=CheckElDocument(node_doc, sRegNumber, dRegNumber, dmbase.SMDOPost);
          if lOk
            then FDokIdNumber:=dmBase.SMDOPost.FieldByName('IDNUMBER').AsString  // !!!   id документа в системе отправителя(1)
            else FDokIdNumber:='';
          if lOk and (ListTask.Count>0) then begin
            for i:=0 to ListTask.Count-1 do begin
              lOk:=CheckElTask(TXMLNode(ListTask[i]), i+1, FDokIdNumber, sOrgID );
            end;
          end;
          if lOk and (ListFolder.Count>0) then begin
            for i:=0 to ListFolder.Count-1 do begin
              lOk:=CheckElFolder(TXMLNode(ListFolder[i]), i+1, FDokIdNumber, sOrgID);
            end;
          end;
          if MsgIsAddDoc(FCurMsgType) then begin
            // если дополнение, то должна быть хотя бы одна ссылка
            if (FReferred.RecordCount=0) then begin
              AckResultXML('В сообщении отсутствует хотя бы обна зона <Referred>');
              sRegNumber:='без номера';
              dRegNumber:=0;
            end else begin
              FReferred.First;
              sRegNumber:=FReferred.FieldByName('REGNUMBER').AsString;
              if FReferred.FieldByName('REGDATE').IsNull
                then dRegNumber:=0
                else dRegNumber:=FReferred.FieldByName('REGDATE').AsDateTime;
            end;
          end;

          //          if lOk then begin                  !!! !!!
            with dmBase.SMDOPost do begin
              // ID, DOC_ID
              // ack_type  msg_id regnumber regdate  incnumber incdate
              FieldByName('USER_CREATE').AsString:=getUser; // см.выше
              FieldByName('ID').AsInteger:=dmBase.GetNewID(_TypeObj_SMDOPost);
              FieldByName('MSG_ID').AsString:=sMsgID;
              FieldByName('MSG_TYPE').AsInteger:=FCurMsgType;
              FieldByName('MSG_ACKNOW').AsInteger:=nMsgAckNow;
              FieldByName('SUBJ_ADRESAT').AsString:=sFrom;
              FieldByName('SUBJECT').AsString:=sSubject;
              FieldByName('SUBJ_SYSTEM').AsInteger:=getSubjSystem(sOrgID);
              if MsgIsAddDoc(FCurMsgType) and (FieldByName('ADR_REGNUMBER').AsString='') then begin
                FieldByName('ADR_REGNUMBER').AsString:=sRegNumber;
                if dRegNumber>0
                  then FieldByName('ADR_REGDATE').AsDateTime:=dRegNumber;
              end;
              FieldByName('MY_REGNUMBER').AsString:='';    // !!! заполняется при регистрации документа в системе !!!
              FieldByName('DTSTAMP').AsDateTime:=dDtStamp;
              FieldByName('SMDOCODE').AsString:=sOrgID;
              FieldByName('COUNT_POST').AsInteger:=nCountPost;
  //              FieldByName('REGNUMBER').AsString:=sRegNumber;
  //              if dRegNumber>0 then FieldByName('REGDATE').AsDateTime:=dRegNumber;
              FieldByName('NAME').AsString:=sOrgName;
              FieldByName('ACK_MSG_ID').AsString:='';
              FieldByName('ACK_TYPE').AsInteger:=0;
              FieldByName('SUBJ_TYPE').AsInteger:=1;
  //            FieldByName('DOC_STATUS').AsInteger:=DOC_PRESENT; // CREATE;
              FieldByName('DATEPOST').AsDateTime:=Now;  // дата и время получения
              FieldByName('SUBJ_ERROR').AsBoolean:=not lOk;
              FieldByName('COUNT_TASK').AsInteger:=ListTask.Count;
              FieldByName('COUNT_FOLDER').AsInteger:=ListFolder.Count;
              FieldByName('SDIP').AsString:=sType;

              //--- по просьбе ЗЕЛЬВА Центр социального обслуживания ---------------------
              if node_exp<>nil then begin
                node_var:=node_body.FindNode('Varset');  // !!!
                if node_var<>nil then begin
                  try
                    s:=XMLtoValue(node_var.ReadAttributeString('notes',''),ftString,'');
                    if s<>''
                      then FieldByName('ACK_ADD_TEXT').AsString:='<ADD_TEXT>'+s+'</ADD_TEXT>';
                  except
                  end;
                end;
              end;
              //--------------------------------------------------------------------------
              // для дополнения к основному док. без основного документа заполним сразу "Регистрации не подлежит"
              // + сформируем уведомление о регистрации см.ниже   CreateAckResult(DOC_NOT_REGISTER_DEF, RESULT, false, FCurMsgType);
              if lOk and MsgIsAddDoc(FCurMsgType) and (node_doc=nil) then begin
                FieldByName('MY_REGNUMBER').AsString:=NAME_NOT_REGISTER;
                FieldByName('MY_REGDATE').AsDateTime:=GetDefaultDate;
              end;

              Post;

              nPostID:=FieldByName('ID').AsInteger;
              //=======================================
              RESULT:=nPostID;   // !!!
              s:=BookMark;
              //=======================================
              if lOk then begin
                if MsgIsAddDoc(FCurMsgType) and (node_doc=nil)
                  then CreateAckResult(DOC_CREATE_ADD, RESULT, false, FCurMsgType)  // получены только дополнения к документу
                  else CreateAckResult(DOC_CREATE, RESULT, false, FCurMsgType);
                if MsgIsAddDoc(FCurMsgType) and (node_doc=nil)
                  then  CreateAckResult(DOC_NOT_REGISTER_DEF, RESULT, false, FCurMsgType);
              end else begin
                CreateAckResult(DOC_ERROR, RESULT, false, FCurMsgType);
              end;
              BookMark:=s;
            end;

            sPath:=GetPathAttach(0,nPostID); //   папка для сохранения вложения
            ClearDir(sPath,false);
            ForceDirectories(sPath);
            FDocTask.First;
            if not FDocTask.Eof and Role.SystemAdmin then begin
              sl.Clear;
              FMens.Filter:='';
              FMens.Filtered:=false;
              FMens.First;
              sl.Add(Inttostr(FMens.RecordCount));
              while not FMens.Eof do begin
                s:='';
                for i:=0 to FMens.FieldCount-1 do begin
                  if (FMens.Fields[i].AsString<>'') and (FMens.Fields[i].FieldName<>'ORG')
                    then s:=s+FMens.Fields[i].FieldName+'='+FMens.Fields[i].AsString+'; '
                end;
                sl.Add(s);
                FMens.Next;
              end;
              sl.SaveToFile('_mens');
              sl.Clear;
              FFiles.Filter:='';
              FFiles.Filtered:=false;
              FFiles.First;
              sl.Add(Inttostr(FFiles.RecordCount));
              while not FFiles.Eof do begin
                s:='';
                for i:=0 to FFiles.FieldCount-1 do begin
                  if (FFiles.Fields[i].AsString<>'') and (FFiles.Fields[i].FieldName<>'SIGNINFO')
                    then s:=s+FFiles.Fields[i].FieldName+'='+FFiles.Fields[i].AsString+'; '
                end;
                sl.Add(s);
                FFiles.Next;
              end;
              sl.SaveToFile('_files');
            end;
            sl.Clear;
            sl.Add('0=0');

            while not FDocTask.Eof do begin
              s:=FDocTask.FieldByName('TASK_ID').AsString;
              dmBase.SMDOTask.Append;  // пишем задания и дополнительные материалы
              for i:=0 to dmBase.SMDOTask.FieldCount-1 do begin
                if not (dmBase.SMDOTask.Fields[i].DataType=ftAutoInc)	then begin
                  if MySameText(dmBase.SMDOTask.Fields[i].FieldName,'POST_ID') then begin
                    dmBase.SMDOTask.Fields[i].AsInteger:=nPostID;
                  end else begin
                    if not FDocTask.Fields[i].IsNull then dmBase.SMDOTask.Fields[i].Value:=FDocTask.Fields[i].Value;
                  end;
                end;
              end;
              dmBase.SMDOTask.FieldByName('TASK_ID').AsInteger:=dmBase.GetNewID(_TypeObj_SMDOPost);
              dmBase.SMDOTask.Post;
              //-----!!! изменим на реальный ID из базы !!!-----
              FDocTask.Edit;
              FDocTask.FieldByName('TASK_ID').AsInteger:=dmBase.SMDOTask.FieldByName('TASK_ID').AsInteger;
              FDocTask.Post;
              //----------------------------------------------------
              sl.Add(s+'='+dmBase.SMDOTask.FieldByName('TASK_ID').AsString);   // !!!  псевдо + реальный ID
              FDocTask.Next;
            end;

            //------ запишем Referred ---------------------------
            FReferred.Filtered:=false;
            FReferred.First;
            while not FReferred.Eof do begin
              // ссылки для заданий и доп. материалов
              nTaskID:=FReferred.FieldByName('PARENT_ID').AsInteger;
              if nTaskID>0 then begin
                i:=sl.IndexOfName(IntToStr(nTaskID));
                if i>-1 then begin
                  FReferred.Edit;
                  FReferred.FieldByName('PARENT_ID').AsString:=sl.ValueFromIndex[i]; // заменим на реальный TASK_ID
                  FReferred.Post;
                end;
              end;
              FReferred.Next;
            end;
            FReferred.First;
            WriteAddDataSet(nPostID,ds2xml,false);

            //----------------------------------------------------
            // sl список псевдо и реальных ID  "1=2323"
            for i:=0 to sl.Count-1 do begin
              nTaskID:=StrToInt(sl.ValueFromIndex[i]);  // реальный ID  или 0
              sTempID:=sl.Names[i];                     // псевдо ID
//  !!! будем проверять при переборе по записям, т.к. будем записывать parent_id для FFiles
//              FFiles.Filter:='parent_id='+sTempID;
//              FFiles.Filtered:=true;
              FMens.Filter:='parent_id='+sTempID;   // !!!
              FMens.Filtered:=true;
              n:=1;

              //----------------------------------------------------------------------------------
              while not FMens.Eof do begin
                dmBase.SMDOMens.Append;
                for j:=0 to dmBase.SMDOMens.FieldCount-1 do begin
                  if not (dmBase.SMDOMens.Fields[j].DataType=ftAutoInc)	then begin
                    if MySameText(dmBase.SMDOMens.Fields[j].FieldName,'POST_ID') then begin
                      dmBase.SMDOMens.Fields[j].AsInteger:=nPostID;
                    end else if MySameText(dmBase.SMDOMens.Fields[j].FieldName,'PARENT_ID') then begin
                      if nTaskID=0
                        then dmBase.SMDOMens.Fields[j].AsInteger:=nPostID
                        else dmBase.SMDOMens.Fields[j].AsInteger:=nTaskID;
                    end else begin
                      if not FMens.Fields[j].IsNull then dmBase.SMDOMens.Fields[j].Value:=FMens.Fields[j].Value;
                    end;
                  end;
                end;
                dmBase.SMDOMens.FieldByName('NOMER').AsInteger:=n;
                Inc(n,1);
                dmBase.SMDOMens.Post;
                FMens.Next;
              end;
              //----------------------------------------------------------------------------------
              //скопируем xml-файл папку для хранения прикрепленных файлов
              try
                if CopyFile(PChar(FTmpPath+FNameFileXML), PChar(sPath+FNameFileXML), false)
                  then DeleteFile(FTmpPath+FNameFileXML);
              except
              end;

              //----------------------------------------------------------------------------------
              FFiles.First;
              while not FFiles.Eof do begin
                if sTempID=FFiles.FieldByName('PARENT_ID').AsString then begin
                  dmBase.SMDOFile.Append;
                  for j:=0 to dmBase.SMDOFile.FieldCount-1 do begin
                    if not (dmBase.SMDOFile.Fields[j].DataType=ftAutoInc)	then begin
                      if MySameText(dmBase.SMDOFile.Fields[j].FieldName,'POST_ID') then begin
                        dmBase.SMDOFile.Fields[j].AsInteger:=nPostID;
                      end else if MySameText(dmBase.SMDOFile.Fields[j].FieldName,'PARENT_ID') then begin
                        if nTaskID=0
                          then dmBase.SMDOFile.Fields[j].AsInteger:=nPostID
                          else dmBase.SMDOFile.Fields[j].AsInteger:=nTaskID;
                      end else begin
                        if not FFiles.Fields[j].IsNull then dmBase.SMDOFile.Fields[j].Value:=FFiles.Fields[j].Value;
                      end;
                    end;
                  end;
                  s:=dmBase.SMDOFile.FieldByName('NAME').AsString;

                  dmBase.SMDOFile.FieldByName('ADD_FILE').AsInteger:=0;
                  // может файл предназначен для другого сообщения
                  if FReferred.Locate('PARENT_ID',nTaskID,[]) then begin
                    sIdNumber:=FReferred.FieldByName('IDNUMBER').AsString;
                    if (sIdNumber<>'') and (sIdNumber<>FDokIdNumber) then begin   // файл для другого сообщения
                      dmBase.SMDOFile.FieldByName('ADD_FILE').AsInteger:=1;
                    end;
                  end;

                  //--- !!! ---------------------------------------------------------------------------
                  // $$$ заменить на dmBase.AddFileToSMDO(SMDO,sFileName,nPostID)
                  if CopyFile(PChar(FTmpPath+s), PChar(sPath+s), false) then begin
                    dmBase.SMDOFile.FieldByName('PATH').AsString:=GetPathAttach(1,nPostID);   // относительный путь '&BASE&\DocArxiv'
                  end else begin
                    // ??? что делать ???
                    PutError('Ошибка копирования файла : '+#13+
                            'откуда :'+FTmpPath+s+#13+
                            'куда   :'+sPath+s+#13+
                            IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
                  end;
                  //--- !!! ---------------------------------------------------------------------------
                  dmBase.SMDOFile.Post;
                  // !!! запишем реальные значения в FFiles !!!
                  FFiles.Edit;
                  FFiles.FieldByName('PARENT_ID').AsString:=dmBase.SMDOFile.FieldByName('PARENT_ID').AsString;
                  FFiles.FieldByName('PATH').AsString:=dmBase.SMDOFile.FieldByName('PATH').AsString;
                  FFiles.Post;
                end;
                FFiles.Next;
              end;
              //----------------------------------------------------------------------------------

              FMens.Filtered:=false;
              FFiles.Filtered:=false;
              FMens.First;
              FFiles.First;
            end;

            if FCheckReferred and FAutoWriteReferred then begin
              WriteReferredToOsnDoc(nPostID, sOrgID);
            end;

    //        EndTransaction(false);;
//          end else begin             !!! !!!
    //        EndTransaction(true);;
//            dmBase.SMDOPost.Cancel;  !!! !!!
//          end;     lOk               !!! !!!
        end;
        ClearDS;
        FreeAndNil(ListTask);
        FreeAndNil(ListFolder);
      end else begin
        //======== сообщение о справочниках Datadir ==================================
        s1:=XMLtoValue(node.ReadAttributeString('type',''),ftString,'');  // д.б. 'acknowledgement'
        if MySameText(s1,'acknowledgement') then begin
          s2:=XMLToValue( node.ValueAsString, ftString,'');   // справочник для обновления
          with dmBase.SMDOPost do begin
            Append;
            FieldByName('TEXT').AsString:=s2;
            i:=Pos('[', s2);
            if i>0 then begin
              s2:=Copy(s2,i+1,Length(s2));
              i:=Pos(']', s2);
              if i>0 then begin
                s2:=Copy(s2,1,i-1);
                FieldByName('ACK_MSG_ID').AsString:=s2;   // код обновляемого справочника
              end;
            end;
            FieldByName('USER_CREATE').AsString:=getUser; // см.выше
            FieldByName('SUBJ_SYSTEM').AsInteger:=getSubjSystem(sOrgID);
            FieldByName('SUBJ_ERROR').AsBoolean:=false;
            FieldByName('ID').AsInteger:=dmBase.GetNewID(_TypeObj_SMDOPost);
            FieldByName('MSG_ID').AsString:=sMsgID;
            FieldByName('MSG_TYPE').AsInteger:=FCurMsgType;
            FieldByName('MSG_ACKNOW').AsInteger:=0;
            FieldByName('SUBJ_ADRESAT').AsString:=sFrom;
            FieldByName('SUBJECT').AsString:=sSubject;
            FieldByName('DTSTAMP').AsDateTime:=dDtStamp;
            FieldByName('SMDOCODE').AsString:=sOrgID;
            FieldByName('NAME').AsString:=sOrgName;
            FieldByName('ACK_TYPE').AsInteger:=0;
            FieldByName('SUBJ_TYPE').AsInteger:=1;   // входящий
            FieldByName('COUNT_POST').AsInteger:=nCountPost;
            FieldByName('DATEPOST').AsDateTime:=Now;  // дата и время получения
            Post;
            //=======================================
            RESULT:=FieldByName('ID').AsInteger;   // !!!
            //=======================================
          end;
        end;
        //======== end сообщения о справочниках ==================================
      end;
    //----------------------------------------------
    //------ END ДОКУМЕНТ ------------------------------
    //----------------------------------------------
    end;
    sl.Free;
  end;
  //============================
  if (FCurMsgType<0) or (FCurMsgType>4) then FCurMsgType:=1;
  // небыло записи в базу почты
  if (RESULT=0) then begin
    with dmBase.SMDOPost do begin
      if not Locate('MSG_ID', sMsgID, []) then begin
        Append;
        FieldByName('USER_CREATE').AsString:=getUser; // см.выше
        FieldByName('ID').AsInteger:=dmBase.GetNewID(_TypeObj_SMDOPost);
        FieldByName('MSG_ID').AsString:=sMsgID;
        FieldByName('MSG_TYPE').AsInteger:=FCurMsgType;
        FieldByName('SUBJ_SYSTEM').AsInteger:=0;
        FieldByName('SUBJ_ERROR').AsBoolean:=true;
        FieldByName('MSG_ACKNOW').AsInteger:=0;
        FieldByName('SUBJ_ADRESAT').AsString:=sFrom;
        FieldByName('SUBJECT').AsString:=sSubject;
        FieldByName('DTSTAMP').AsDateTime:=dDtStamp;
        FieldByName('SMDOCODE').AsString:=sOrgID;
        FieldByName('NAME').AsString:=sOrgName;
        if FCurMsgType=MSG_TYPE_A then begin
          FieldByName('MY_REGNUMBER').AsString:=sRegNumber;    // мой документ который был зарегистрирован
          if dRegNumber>0 then  Date2Field(FieldByName('MY_REGDATE'), dRegNumber);
          FieldByName('ADR_REGNUMBER').AsString:=sIncNumber;
          if dIncNumber>0 then Date2Field(FieldByName('ADR_REGDATE'),dIncNumber);
        end else begin
          FieldByName('ADR_REGNUMBER').AsString:=sRegNumber;
          if dRegNumber>0 then Date2Field(FieldByName('ADR_REGDATE'),dRegNumber);
        end;
        FieldByName('ACK_MSG_ID').AsString:='';
        FieldByName('ACK_TYPE').AsInteger:=0;
        FieldByName('SUBJ_TYPE').AsInteger:=1;
//        FieldByName('DOC_STATUS').AsInteger:=DOC_ERROR;
        FieldByName('DATEPOST').AsDateTime:=Now;  // дата и время получения
        FieldByName('TEXT').AsString:=FCurText;
        if (FCurMsgType<>MSG_TYPE_A) then begin
          FieldByName('ERROR_TEXT').AsString:=AckResult2Text;
        end;
        Post;
        nPostID:=FieldByName('ID').AsInteger;
        RESULT:=nPostID;
        if (FCurMsgType<>MSG_TYPE_A) then begin
          CreateAckResult(DOC_ERROR, RESULT, false, FCurMsgType);
        end;
      end;
    end;
  end;
end;
//---------------------------------------------------------------
function TSMDO.ReadAddDataSet(nID:Integer; ds2xml:TDataSets2XML):String;
begin
  if dmBase.tbSimplePropMemo.Locate('TYPEOBJ;ID', VarArrayOf([_TypeObj_SMDOPost,nID]), []) then begin
    ds2xml.StringToXML(dmBase.tbSimplePropMemo.FieldByName('VALUE').AsString);
    ds2xml.XMLToData;
  end;
end;
//---------------------------------------------------------------
function TSMDO.WriteAddDataSet(nID:Integer; ds2xml:TDataSets2XML; lDel:Boolean):String;
begin
  Result:='';
  // запишем таблицу tbReferred в BaseTextProp  в виде XML
  if not lDel then begin
    if ds2xml.DataToXML then begin
      with dmBase.tbSimplePropMemo do begin
        if Locate('TYPEOBJ;ID', VarArrayOf([_TypeObj_SMDOPost,nID]), []) then begin
          Edit;
        end else begin
          Append;
          FieldByName('TYPEOBJ').AsInteger:=_TypeObj_SMDOPost;
          FieldByName('ID').AsInteger:=nID;
          FieldByName('DATES').AsDateTime:=STOD('1899-12-31', tdAds);
          FieldByName('POKAZ').AsString:='REFERRED';
        end;
        FieldByName('VALUE').AsString:=ds2xml.XMLToString;
        Post;
      end;
    end else begin
      Result:=ds2xml.LastError;
    end;
  end else begin
    if dmBase.tbSimplePropMemo.Locate('TYPEOBJ;ID', VarArrayOf([_TypeObj_SMDOPost,nID]), []) then begin
      dmBase.tbSimplePropMemo.Delete;
    end;
  end;
end;
//-----------------------------------------------------
function TSMDO.GetDefaultDate:TDateTime;
begin
  Result:=Date;
end;
//-----------------------------------------------------
function TSMDO.CreateAckResult(nDocStatus:Integer; nPostID:Integer; lErrorText:Boolean; nMsgType:Integer; sAddAck:String):Integer;
var
  sBM,sMsgID,sAdresat,sAdrRegNumber,sMyRegNumber,s,sdAdrRegNumber:String;
  sAdd,sOrgID,sOrgName,sError:String;
  dAdrRegNumber, dMyRegNumber:TDateTime;
  dPost:TDateTime;
  i:Integer;
begin
  Result:=0;
  sBM:='';
  with dmBase.SMDOPost do begin
    if FieldByName('ID').AsInteger<>nPostID then begin
      if not Locate('ID', nPostID, []) then begin
        Bookmark:=sBM;
        exit;
      end;
    end;

    dPost:=Now;  //   изменение 14.11.2016
// было   dPost:=FieldByName('DATEPOST').AsDateTime;

    sMsgID:=FieldByName('MSG_ID').AsString;

//    s:=FieldByName('ACK_ADD_TEXT').AsString;
    // дополнительная информация для уведомления о регистрации или отказе в регистрации
//    sAckAdd:=StringReplace(NodeFromStr('ADD_ACK', s), #13#10, ' ', [rfReplaceAll]);
//    if sAckAdd<>'' then sAckAdd:=', '+sAckAdd;

    sAdrRegNumber:=Trim(FieldByName('ADR_REGNUMBER').AsString);
    if FieldByName('ADR_REGDATE').IsNull then dAdrRegNumber:=0 else dAdrRegNumber:=FieldByName('ADR_REGDATE').AsDateTime;

    sMyRegNumber:=Trim(FieldByName('MY_REGNUMBER').AsString);
    if FieldByName('MY_REGDATE').IsNull then dMyRegNumber:=0 else dMyRegNumber:=FieldByName('MY_REGDATE').AsDateTime;

    sOrgID:=FieldByName('SMDOCODE').AsString;
    sOrgName:=FieldByName('NAME').AsString;
    sAdresat:=FieldByName('SUBJ_ADRESAT').AsString;
    if lErrorText then begin
      sError:=FieldByName('TEXT').AsString;
    end else begin
      sError:=AckResult2Text;
    end;
    Append;
    FieldByName('ID').AsInteger:=dmBase.GetNewID(_TypeObj_SMDOPost);
    FieldByName('MSG_TYPE').AsInteger:=MSG_TYPE_A;
    FieldByName('SUBJ_SYSTEM').AsInteger:=0;
    FieldByName('SUBJ_ERROR').AsBoolean:=false;
    FieldByName('MSG_ACKNOW').AsInteger:=0;  // отправка уведомления не требуется
    FieldByName('SUBJ_ADRESAT').AsString:=sAdresat;
    FieldByName('SUBJ_TYPE').AsInteger:=2;   // исходящий
    FieldByName('MSG_ID').AsString:=GetGUID(false);

    FieldByName('DTSTAMP').AsDateTime:=dPost;

    FieldByName('SMDOCODE').AsString:=sOrgID;
    FieldByName('NAME').AsString:=sOrgName;
    FieldByName('ACK_MSG_ID').AsString:=sMsgID;  // сообщение для которого создается ответ
//    FieldByName('DOC_STATUS').AsInteger:=DOC_CREATE;  // (заполнять при отправке)
    FieldByName('SENT').AsInteger:=0;                 // (заполнять при отправке)
    FieldByName('DATEPOST').AsString:='';  // дата и время отправки (заполнять при отправке)

    FieldByName('ADR_REGNUMBER').AsString:=sAdrRegNumber;
    if dAdrRegNumber>0 then begin
      FieldByName('ADR_REGDATE').AsDateTime:=dAdrRegNumber;
      sdAdrRegNumber:=' от '+DateToString(dAdrRegNumber,false,true);
    end else begin
      sdAdrRegNumber:='';
    end;

    sAdd:='';
    if (nMsgType>-1) and MsgIsAddDoc(nMsgType) then begin
      if (nMsgType=MSG_TYPE_DA) or (nMsgType=MSG_TYPE_OA) then begin
        sAdd:=NameMsgType(nMsgType,1);
//      MSG_TYPE_DA : Result:='дополнения к основному документу';
//      MSG_TYPE_OA : Result:='дополнения к документу-ответа';
      end;
    end;
//====== ДОКУМЕНТ ЗАРЕГИСТРИРОВАН В НАШЕЙ СИСТЕМЕ ==========================================
    if nDocStatus=DOC_REGISTER then begin
// subject="Уведомление о регистрации документа №01-05/33 от 21.03.2016 00:00">   ack_type="2"
// <AckResult errorcode="0">Документ зарегистрирован №1819 от 21.03.2016 17:01</AckResult>
// <IncNumber regdate="2016-03-21">1819</IncNumber>
// <RegNumber regdate="2016-03-21">01-05/33</RegNumber>
      if sAdd='' then sAdd:='документа';
      FieldByName('ACK_TYPE').AsInteger:=ACK_REGISTER;  // зарегистрирован
      FieldByName('SUBJECT').AsString:='Уведомление о регистрации '+sAdd+' №'+sAdrRegNumber+sdAdrRegNumber;

      FieldByName('MY_REGNUMBER').AsString:=sMyRegNumber;
      if dMyRegNumber>0 then FieldByName('MY_REGDATE').AsDateTime:=dMyRegNumber;

      FieldByName('TEXT').AsString:='0=Документ зарегистрирован №'+sMyRegNumber+'  '+DateToString(dMyRegNumber,false,true);
      if sAddAck<>'' then
        FieldByName('TEXT').AsString:=FieldByName('TEXT').AsString+', '+sAddAck;

//======== ДОКУМЕНТ ДОСТАВЛЕН В НАШУ СИСТЕМУ =================================================
    end else if (nDocStatus=DOC_CREATE)  then begin
// subject="Уведомление о получении документа №01-05/33 от 21.03.2016 00:00">
// <AckResult errorcode="0">Уведомление о получении документа №01-05/33 от 21.03.2016 00:00</AckResult>
      if sAdd='' then sAdd:='документа';
      FieldByName('ACK_TYPE').AsInteger:=ACK_DELIVER;
      FieldByName('SUBJECT').AsString:='Уведомление о доставке '+sAdd+' №'+sAdrRegNumber+sdAdrRegNumber;
      FieldByName('TEXT').AsString:='0=Уведомление о доставке '+sAdd+' №'+sAdrRegNumber+sdAdrRegNumber;
      if FAckResultOk.Count>0 then begin
        for i:=0 to FAckResultOk.Count-1 do begin
          FieldByName('TEXT').AsString:=FieldByName('TEXT').AsString+CRLF+'0='+FAckResultOk.Strings[i];
        end;
      end;
//======== ДОПОЛНЕНИЯ К ДОКУМЕНТУ ДОСТАВЛЕНЫ В НАШУ СИСТЕМУ =================================================
    end else if (nDocStatus=DOC_CREATE_ADD)  then begin
// subject="Уведомление о получении дополнений к документу">
// <AckResult errorcode="0">Уведомление о доставке получении документа №01-05/33 от 21.03.2016 00:00</AckResult>
      if sAdd='' then sAdd:='документа';
      FieldByName('ACK_TYPE').AsInteger:=ACK_DELIVER;
      FieldByName('SUBJECT').AsString:='Уведомление о доставке дополнений к документу';
      s:='';
      if FAckResultOk.Count>0 then begin
        for i:=0 to FAckResultOk.Count-1 do begin
          s:=s+'0='+FAckResultOk.Strings[i]+CRLF;
        end;
        s:=Copy(s,1,Length(s)-2);
      end;
      FieldByName('TEXT').AsString:=s;
      
//======== ДОКУМЕНТ НЕ ПОДЛЕЖИТ РЕГИСТРАЦИИ С ПАРАМЕТРАМИ ПО УМОЛЧАНИЮ ===================================================
    end else if nDocStatus=DOC_NOT_REGISTER_DEF then begin
      FieldByName('ACK_TYPE').AsInteger:=ACK_REGISTER; // зарегистрирован или относится к кат. нерегистриркемых
      FieldByName('SUBJECT').AsString:='Уведомление об отказе в регистрации дополнения к документу';
      FieldByName('MY_REGNUMBER').AsString:=NAME_NOT_REGISTER;
      FieldByName('MY_REGDATE').AsDateTime:=GetDefaultDate;
      FieldByName('TEXT').AsString:='1=Документ относится к категории нерегистрируемых';

//======== ДОКУМЕНТ НЕ ПОДЛЕЖИТ РЕГИСТРАЦИИ ===================================================
    end else if nDocStatus=DOC_NOT_REGISTER then begin
//      subject="уведомление об отказе в регистрации исх. №01-05/31 от 21.03.2016">    ack_type="2"
// <AckResult errorcode="1">Документ относится к категории нерегистрируемых (1324-вн)</AckResult>
      if sAdd='' then sAdd:='документа';
      FieldByName('ACK_TYPE').AsInteger:=ACK_REGISTER; // зарегистрирован или относится к кат. нерегистриркемых
      FieldByName('SUBJECT').AsString:='Уведомление об отказе в регистрации '+sAdd+' №'+sAdrRegNumber+sdAdrRegNumber;
      FieldByName('MY_REGNUMBER').AsString:=sMyRegNumber; // NAME_NOT_REGISTER или NAME_NOT_OTKAZ или NAME_NOT_ETSP
      if dMyRegNumber>0
        then FieldByName('MY_REGDATE').AsDateTime:=dMyRegNumber
        else FieldByName('MY_REGDATE').AsDateTime:=GetDefaultDate;

      if MySametext( sMyRegNumber, NAME_NOT_REGISTER) then begin
         FieldByName('TEXT').AsString:='1=Документ относится к категории нерегистрируемых';
      end else if MySametext( sMyRegNumber, NAME_NOT_OTKAZ) then begin
        FieldByName('TEXT').AsString:='2=Документ отказ в регистрации';
      end else if MySametext( sMyRegNumber,NAME_NOT_ETSP) then begin
        FieldByName('TEXT').AsString:='3=Документ отказ в регистрации-нет доверия ЭЦП';
      end;
      if sAddAck<>'' then
        FieldByName('TEXT').AsString:=FieldByName('TEXT').AsString+', '+sAddAck;

//====== ОШИБКИ ПРИ РАЗБОРЕ ДОКУМЕНТА =====================================================================
    end else if nDocStatus=DOC_ERROR then begin
//    subject="Уведомление об ошибке при доставке исх. №41 от 01.11.2016">
// <AckResult errorcode="23">Документ отклонен. 1-документооборот Гомельский облисполком 2015.doc: Подпись Кличковская Елена Владимировна: Сертификат издателя не найден.</AckResult>
      FieldByName('ACK_TYPE').AsInteger:=ACK_DELIVER;
      if sAdrRegNumber=''
        then s:='сообщения '+sMsgId
        else s:='документа №'+sAdrRegNumber+sdAdrRegNumber;
      FieldByName('SUBJECT').AsString:='Уведомление об ошибке при доставке '+s;
      if sError='' then sError:=IntToStr(ceXML)+'=Неизвестная ошибка';
      FieldByName('TEXT').AsString:=sError;
    end;
    Post;
    Result:=FieldByName('ID').AsInteger;
    if sBM<>'' then BookMark:=sBM;
  end;
end;
//-----------------------------------------------------
function TSMDO.StrToFile(aFile: String; Const Str: AnsiString): boolean;
var
   hFile :THANDLE;
   dwWriten: DWORD;
//   FileStream: TFileStream;
Begin
  Result := False;
  hFile := CreateFile(PChar(aFile), GENERIC_WRITE, 0, Nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  if (hFile = INVALID_HANDLE_VALUE) then
     Exit;

  if not WriteFile(hFile, Str[1], Length(Str), dwWriten, Nil) Then
     Exit;
  CloseHandle(hFile);
  result := True;
End;
//---------------------------------------
function TSMDO.CodeAttestation(sName:String):String;
begin
//    [KEY_ATTESTATION]  1=согласовано  2=утверждено  3=согласовано с замечаниями  4=отклонено
  sName:=Trim(ANSILowerCase(sName));
  Result:='';
  if Pos('замеч', sName)>0 then begin           // 3=согласовано с замечаниями
    Result:='3';
  end else if Copy(sName,1,4)='согл' then begin         // 1=согласовано
    Result:='1';
  end else if Copy(sName,1,3)='утв' then begin  // 2=утверждено
    Result:='2';
  end else if Copy(sName,1,3)='отк' then begin  // 4=отклонено
    Result:='4';
  end;
end;
//---------------------------------------
function TSMDO.CheckElDocument(node:TXMLNode; var sRegNumber:String; var dRegNumber:TDateTime; ds:TDataSet):Boolean;
var
  sType,s,sNameFile,sNameRef:String;
  node1,node2:TXMLNode;
  d:TDateTime;
  List:TList;
  i,n,j,nTask:Integer;
  sl:TStringList;
  nErr:DWORD;
  lErr:Boolean;
begin
  n:=FAckResult.Count;  // количество записей в списке ошибок
  // в документе может быть только refered если это дополнение а к документу  !!!
  // Зона сообщения (Документ) содержит только ссылочную информацию о ранее переданном документе, к которому передаваемая информация !!!
  Result:=true;
//  FDocTask.Append;
  sRegNumber:='';
  dRegNumber:=0;

  ds.FieldByName('text').AsString:=XMLtoValue(node.ReadAttributeString('title',''),ftString,'');
  FCurText:=ds.FieldByName('text').AsString;
  ds.FieldByName('komm').AsString:=XMLtoValue(node.ReadAttributeString('annotation',''),ftString,'');
  nTask:=0;
//  FDocTask.FieldByName('task_id').AsInteger:=nTask;   // в базе это autoinc
//  FDocTask.FieldByName('nomer').AsInteger:=nTask;
  // annotation, collection

  s:=XMLtoValue(node.ReadAttributeString('idnumber',''),ftString,'');
  if s='' then AckResultAdd(ceNOT_ATR_EL_ZONE, 'body', 'document', 'idnumber')
          else ds.FieldByName('idnumber').AsString:=s;

  s:=XMLtoValue(node.ReadAttributeString('type',''),ftString,'');
  if s='' then AckResultAdd(ceNOT_ATR_EL_ZONE, 'body', 'document', 'type')
          else ds.FieldByName('doc_type').AsString:=s;

  //----- BEGIN VERSION -----------------------------------------------------
  ds.FieldByName('kind').AsString:='';
  s:=Trim(XMLtoValue(node.ReadAttributeString('kind',''),ftString,''));
  if (FVersionXML_IN>=211) then begin
    if (s='') then begin
      AckResultAdd(ceNOT_ATR_EL_ZONE, 'body', 'document', 'kind')
    end else begin
      if dmBase.SMDOSprVidDok.Locate('NAME',s,[]) then begin
        ds.FieldByName('kind').AsString:=s;
      end else begin
        AckResultXML('значение элемента kind="'+s+'" отсутствует в классификаторе виды документов');
      end;
    end;
  end;
  ds.FieldByName('kind').AsString:=s;

  s:=Trim(XMLtoValue(node.ReadAttributeString('pages',''),ftString,''));
  if (s='') and (FVersionXML_IN>=211) then begin
    AckResultAdd(ceNOT_ATR_EL_ZONE, 'body', 'document', 'pages')
  end else begin
    if (s='0') or (s='-') then s:='';
    if s<>''
      then KeepChars(s,'0123456789');   // оставить только цифры
    try
      ds.FieldByName('pages').AsString:=s;
    except
      AckResultAdd(ceTYPE_ATR_ZONE,'body', 'document', 'pages', s);
    end;
  end;
  //----- END VERSION -----------------------------------------------------

  node1:=node.FindNode('regnumber');
  if node1=nil then begin
    AckResultXML('Отсутствует элемент regnumber в элементе document зоны body');
  end else begin
    d:=XMLtoValue(node1.ReadAttributeString('regdate'),ftDate,0);
    if d=0 then begin
      AckResultAdd(ceNOT_ATR_EL_ZONE, 'body', 'document', 'regdate');
    end else begin
      sRegNumber:=XMLToValue( node1.ValueAsString, ftString,'');
      dRegNumber:=d;
//      FDocTask.FieldByName('TASKDATE').AsDateTime:=dRegNumber;
//      FDocTask.FieldByName('TASKNUMBER').AsString:=sRegNumber;
      ds.FieldByName('ADR_REGDATE').AsDateTime:=dRegNumber;
      ds.FieldByName('ADR_REGNUMBER').AsString:=sRegNumber;
    end;
  end;
  node1:=node.FindNode('DocParent');   // !!!
  if node1<>nil then begin
    sType:=Trim(XMLtoValue(node1.ReadAttributeString('delivery_type'),ftString,''));
    if sType='' then AckResultAdd(ceNOT_ATR_EL_ZONE, 'Document', 'DocParent', 'delivery_type')
                else ds.FieldByName('par_delivery_type').AsString:=sType;
    // sType=0 для документов, поступивших не по СМДО
    // sType=1 для документов, поступивших по СМДО
    if sType<>'' then begin
      s:=XMLtoValue(node1.ReadAttributeString('idnumber'),ftString,'');
      if (s='') and (sType='1') then AckResultAdd(ceNOT_ATR_EL_ZONE, 'Document', 'DocParent', 'idnumber')
                                else ds.FieldByName('par_idnumber').AsString:=s;
      s:=XMLtoValue(node1.ReadAttributeString('lastmsg_id'),ftString,'');
      if (s='') and (sType='1') then AckResultAdd(ceNOT_ATR_EL_ZONE, 'Document', 'DocParent', 'lastmsg_id')
                                 else ds.FieldByName('par_lastmsg').AsString:=s;
      s:=XMLtoValue(node1.ReadAttributeString('parmsg_id'),ftString,'');
      if (s='') and (sType='1') then AckResultAdd(ceNOT_ATR_EL_ZONE, 'Document', 'DocParent', 'parmsg_id')
                                else ds.FieldByName('par_parmsg').AsString:=s;
      s:=XMLtoValue(node1.ReadAttributeString('parorg_id'),ftString,'');
      if (s='') and (sType='1') then AckResultAdd(ceNOT_ATR_EL_ZONE, 'Document', 'DocParent', 'parorg_id')
                                else ds.FieldByName('par_parorg').AsString:=s;
      node1:=node1.FindNode('Regnumber');
      if node1<>nil then begin
        d:=XMLtoValue(node1.ReadAttributeString('regdate'),ftDate,0);
        if d=0 then begin
          AckResultAdd(ceNOT_ATR_EL_ZONE, 'Document', 'DocParent', 'regdate');
        end else begin
          ds.FieldByName('par_regnumber').AsString:=XMLToValue( node1.ValueAsString, ftString,'');
          ds.FieldByName('par_regdate').AsDateTime:=d;
        end;
      end else begin
        AckResultAdd(ceNOT_ATR_EL_ZONE, 'Document', 'DocParent', 'Regnumber');
      end;
    end;
  end;
  node1:=node.FindNode('confident');
  if node1=nil then begin
    AckResultXML('Отсутствует элемент confident в элементе document зоны body');
  end else begin
    s:=XMLtoValue(node1.ReadAttributeString('flag'),ftString,'');
    if s='' then AckResultAdd(ceNOT_ATR_EL_ZONE, 'body', 'confident', 'flag')
            else ds.FieldByName('flag').AsString:=s;
    ds.FieldByName('numcopy').AsString:=XMLtoValue(node1.ReadAttributeString('numcopy'),ftString,'');
    ds.FieldByName('confident').AsString:=XMLToValue( node1.ValueAsString, ftString,'');
  end;

  CheckDocTransfer(node, nTask);
  List:=TList.Create;
  //----- Author ----------------------------------------------------------------
  node.FindNodes('Author', List);
  if List.Count>0 then begin
    for i:=0 to List.Count-1 do begin
      node1:=TXMLNode(List[i]).FindNode('OrganizationWithSign');
      if node1=nil then begin
        // error
      end else begin
        node2:=node1.FindNode('OfficialPersonWithSign');
        if node2<>nil then begin
          AddMen(nTask, MEN_AUTHOR, node2, node1);
        end else begin
         // если есть  OrganizationWithSign то д.б. OfficialPersonWithSign !!!
          AckResultXML('Отсутствует элемент OfficialPersonWithSign в элементе OrganizationWithSign в зоне Author');
        end;
      end;
      node1:=TXMLNode(List[i]).FindNode('PrivatePersonWithSign');
      if node1<>nil then AddMen(nTask, MEN_AUTHOR, node1, nil);
    end;
  end else begin
    AckResultXML('Отсутствует элемент Author в зоне body');
  end;
  sl:=TStringList.Create;
  //----- Validator ----------------------------------------------------------------
  sl.Clear;
  node.FindNodes('Validator', List);
  if List.Count>0 then begin
    for i:=0 to List.Count-1 do begin
      s:=XMLtoValue(TXMLNode(List[i]).ReadAttributeString('attestation'), ftString, '');
      if s<>'' then sl.Add('attestation='+CodeAttestation(s));
      node1:=TXMLNode(List[i]).FindNode('OrganizationWithSign');
      if node1=nil then begin
        // error
      end else begin
        node2:=node1.FindNode('OfficialPersonWithSign');
        if node2<>nil then AddMen(nTask, MEN_VALIDATOR , node2, node1, sl);
      end;
      node1:=TXMLNode(List[i]).FindNode('PrivatePersonWithSign');
      if node1<>nil then AddMen(nTask, MEN_VALIDATOR, node1, nil, sl);
    end;
  end;
  //----- Writer ----------------------------------------------------------------
//  sl.Clear;
  node.FindNodes('Writer', List);
  if List.Count>0 then begin
    for i:=0 to List.Count-1 do begin
//      s:=XMLtoValue(TXMLNode(List[i]).ReadAttributeString('attestation'), ftString, '');
//      if s<>'' then sl.Add('attestation='+CodeAttestation(s));
      node1:=TXMLNode(List[i]).FindNode('OrganizationWithSign');
      if node1=nil then begin
        // error
      end else begin
        node2:=node1.FindNode('OfficialPersonWithSign');
        if node2<>nil then AddMen(nTask, MEN_WRITER, node2, node1, nil); //sl);
      end;
      node1:=TXMLNode(List[i]).FindNode('PrivatePersonWithSign');
      if node1<>nil then AddMen(nTask, MEN_WRITER, node1, nil);
    end;
  end;
  sl.Free;
  List.Free;

  if (FAckResult.Count-n)=0  // количество ошибок не изменилось
    then Result:=true
    else Result:=false;

//  if Result
//    then FDocTask.Post
//    else FDocTask.Cancel;
end;
//---------------------------------------
function TSMDO.CheckElTask(node:TXMLNode; nTask:Integer; sIdDocNumber:String; sSmdoCode:String):Boolean;
var
  sss, sErr,s,sNode,sNameFile,sIdNumber,sNameRef:String;
  node1,node2:TXMLNode;
  d:TDateTime;
  List:TList;
  i,n,j,nTypeMen:Integer;
//  sl:TStringList;
  nErr:DWORD;
begin
  n:=FAckResult.Count;  // количество записей в списке ошибок
  FDocTask.Append;
  FDocTask.FieldByName('task_id').AsInteger:=nTask;
  FDocTask.FieldByName('nomer').AsInteger:=nTask;

  s:=XMLtoValue(node.ReadAttributeString('task_text',''),ftString,'');
  if s='' then AckResultAdd(ceNOT_ATR_EL_ZONE, 'body', 'task', 'task_text')
          else FDocTask.FieldByName('text').AsString:=s;

  s:=XMLtoValue(node.ReadAttributeString('idnumber',''),ftString,'');
  if s='' then AckResultAdd(ceNOT_ATR_EL_ZONE, 'body', 'task', 'idnumber')
          else FDocTask.FieldByName('idnumber').AsString:=s;

  s:=XMLtoValue(node.ReadAttributeString('task_reg',''),ftString,'');
  if s='' then AckResultAdd(ceNOT_ATR_EL_ZONE, 'body', 'task', 'task_reg')
          else if s='1' then FDocTask.FieldByName('task_reg').AsBoolean:=true else FDocTask.FieldByName('task_reg').AsBoolean:=false;

  s:=XMLtoValue(node.ReadAttributeString('task_copy',''),ftString,'');
  if s='' then AckResultAdd(ceNOT_ATR_EL_ZONE, 'body', 'task', 'task_copy')
          else if s='1' then FDocTask.FieldByName('task_copy').AsBoolean:=true else FDocTask.FieldByName('task_copy').AsBoolean:=false;

  d:=XMLtoValue(node.ReadAttributeString('deadline',''),ftDate,0);
  if d=0  then AckResultAdd(ceNOT_ATR_EL_ZONE, 'body', 'task', 'deadline')
          else FDocTask.FieldByName('deadline').AsDateTime:=d;

  FDocTask.FieldByName('kind').AsString:=XMLtoValue(node.ReadAttributeString('kind',''),ftString,'');

  node1:=node.FindNode('TaskNumber');
  if node1=nil then begin
    AckResultXML('Отсутствует элемент tasknumber в элементе task зоны body');
  end else begin
    d:=XMLtoValue(node1.ReadAttributeString('TaskDate'),ftDate,0);
    if d=0 then begin
      AckResultAdd(ceNOT_ATR_EL_ZONE, 'body', 'task', 'taskdate');
    end else begin
      FDocTask.FieldByName('TASKDATE').AsDateTime:=d;
      FDocTask.FieldByName('TASKNUMBER').AsString:=XMLToValue( node1.ValueAsString, ftString,'');
    end;
  end;
  node1:=node.FindNode('confident');
  if node1=nil then begin
    AckResultXML('Отсутствует элемент confident в элементе task зоны body');
  end else begin
    s:=XMLtoValue(node1.ReadAttributeString('flag'),ftString,'');
    if s='' then AckResultAdd(ceNOT_ATR_EL_ZONE, 'body', 'confident', 'flag')
            else FDocTask.FieldByName('flag').AsString:=s;
    FDocTask.FieldByName('numcopy').AsString:=XMLtoValue(node1.ReadAttributeString('numcopy'),ftString,'');
    FDocTask.FieldByName('confident').AsString:=XMLToValue( node1.ValueAsString, ftString,'');
  end;

  sIdNumber:='';
  for i:=0 to node.NodeCount-1 do begin
    sNode:=ANSILowerCase(node.Nodes[i].Name);
    if sNode='referred' then begin
      sIdNumber:=node.Nodes[i].ReadAttributeString('idnumber','');
    end;
  end;

  if (sIdNumber='') or (sIdDocNumber<>sIdNumber) then begin
    AckResultAdd(ceNOT_ATR_EL_ZONE, 'Referred' , 'task', 'body' );
  end;

  CheckDocTransfer(node,nTask);
  List:=TList.Create;
  //----- Author ----------------------------------------------------------------
  node.FindNodes('AuthorOrganization', List);
  if List.Count>0 then begin
    for i:=0 to List.Count-1 do begin
      node1:=TXMLNode(List[i]).FindNode('OrganizationWithSign');
      if node1=nil then begin
        // error
      end else begin
        node2:=node1.FindNode('OfficialPersonWithSign');
        if node2<>nil then AddMen(nTask, MEN_AUTHOR, node2, node1);
      end;
      node1:=TXMLNode(List[i]).FindNode('PrivatePersonWithSign');
      if node1<>nil then AddMen(nTask, MEN_AUTHOR, node1, nil);
    end;
  end else begin
    AckResultXML('Отсутствует элемент AuthorOrganization в элементе Task зоны body');
  end;
  //----- Executor ----------------------------------------------------------------
  List.Clear;
  node.FindNodes('Executor', List);
  if List.Count>0 then begin
    for i:=0 to List.Count-1 do begin
      s:=XMLtoValue(TXMLNode(List[i]).ReadAttributeString('responsible'), ftString, '');
      if s='0' then nTypeMen:=MEN_EXECUTOR_S else nTypeMen:=MEN_EXECUTOR;  // соисполнитель или исполнитель
      node1:=TXMLNode(List[i]).FindNode('Organization');
      if node1=nil then begin
        // error
      end else begin
        node2:=node1.FindNode('OfficialPerson');
        if node2<>nil then AddMen(nTask, nTypeMen, node2, node1, nil);
      end;
    end;
  end;

  sErr:='';
  if not RefToSMDO(node, nTask, sSmdoCode, sErr, sss)
    then AckResultXML(sErr);

  List.Free;
  if (FAckResult.Count-n)=0  // количество ошибок не изменилось
    then Result:=true
    else Result:=false;

  if Result
    then FDocTask.Post
    else FDocTask.Cancel;

end;
//-----------------------------------------------------------------------
function TSMDO.CheckElFolder(node:TXMLNode; nFolder:Integer; sIdDocNumber:String; sSmdoCode:String):Boolean;
var
  sOutIdNumbers, sErr,s,sNameFile,sNameRef:String;
  node1,node2:TXMLNode;
  d:TDateTime;
  List:TList;
  i,n,j:Integer;
  slSign,sl:TStringList;
  nErr:DWORD;
begin
  nFolder:=nFolder+1000; //!!!
  n:=FAckResult.Count;  // количество записей в списке ошибок
  FDocTask.Append;
  FDocTask.FieldByName('task_id').AsInteger:=nFolder;
  FDocTask.FieldByName('nomer').AsInteger:=nFolder;

  s:=XMLtoValue(node.ReadAttributeString('contents',''),ftString,'');
  if s='' then AckResultAdd(ceNOT_ATR_EL_ZONE, 'body', 'folder', 'contents')
          else FDocTask.FieldByName('contents').AsString:=s;

  s:=XMLtoValue(node.ReadAttributeString('add_type',''),ftString,'');
  if s='' then AckResultAdd(ceNOT_ATR_EL_ZONE, 'body', 'folder', 'add_type')
          else FDocTask.FieldByName('add_type').AsString:=s;

  List:=TList.Create;
  node.FindNodes('note', List);
  s:='';
  for i:=0 to List.Count-1 do begin
    s:=s+CheckStrR(TXMLNode(List[i]).ValueAsString)+chr(13)+chr(10);
  end;
  FDocTask.FieldByName('text').AsString:=s;
  List.Free;

  CheckDocTransfer(node,nFolder,false);
  sErr:='';
  if not RefToSMDO(node, nFolder, sSmdoCode, sErr, sOutIdNumbers)
    then AckResultXML(sErr);

  if (FAckResult.Count-n)=0  // количество ошибок не изменилось
    then Result:=true
    else Result:=false;

  if Result then begin
    FDocTask.Post;
  end else begin
    FDocTask.Cancel;
  end;

end;
//-----------------------------------------------------------------------
function TSMDO.CheckDocTransfer(node:TXMLNode; nID:Integer; lCheck:Boolean):Boolean;
var
  List,ListS:TList;
  slSign,slInfo:TStringList;
  i,j,m:Integer;
  s:String;
  node_transfer,node_data:TXMLNode;
  sErr, sNameFile,sNameRef, sFile:String;
  nErr:DWORD;
begin
  List:=TList.Create;
  ListS:=TList.Create;
  slSign:=TStringList.Create;
  //----- BEGIN  DocTransfer ----------------------------------------------------------------
  node.FindNodes('DocTransfer', List);
  if List.Count=0 then begin
    if lCheck
      then AckResultXML('Отсутствует элемент DocTransfer в элементе '+node.name);
  end else begin
    for i:=0 to List.Count-1 do begin
      node_transfer:=TXMLNode(List[i]);
      ListS.Clear;     // список Node с ЭЦП
      slSign.Clear;    // список с ЭЦП
      sNameFile:=XMLtoValue(node_transfer.ReadAttributeString('name',''),ftString,'');
//    try
//      nOrder:=node_transfer.ReadAttributeInteger('ordernum',0);    ПОРЯДКОВЫЙ НОМЕР ФАЙЛА (МОЖЕТ ПОТОМ ДОДЕЛАТЬ  03.10.2017)
//    except
//      nOrder:=0;
//    end;
      if sNameFile='' then begin
        AckResultAdd(ceNOT_ATR_EL_ZONE, 'body', 'doctransfer', 'name');
      end else begin
        node_data:=node_transfer.FindNode('data');
        if node_data=nil then begin
          AckResultXML('Отсутствует элемент Data в элементе DocTransfer зоны body');
        end else begin
          node_transfer.FindNodes('Signature', ListS);     // список Node с ЭЦП
          for j:=0 to ListS.Count-1 do begin
            s:=Trim(XMLtoValue( TXMLNode(ListS[j]).ValueAsString, ftString, ''));
            if s<>'' then slSign.Add(s);
          end;
          if slSign.Count=0 then begin
            AckResultAdd(ceNOT_ETSP, sNameFile, '','');
          end else begin
            sNameRef:=XMLtoValue(node_data.ReadAttributeString('referenceid',''),ftString,'');
            // -----файл внутри письма в кодировке BASE64----
            if sNameRef='' then begin
              s:=DecodeString( XMLtoValue(node_data.ValueAsString, ftString,'') );
              if s='' then begin
                AckResultXML('Отсутствует элемент Data в элементе DocTransfer зоны body');
              end else begin
                if StrToFile(FTmpPath+sNameFile,s) then begin
                  FFilesMail.Add(sNameFile);   // добавляем в список файлов
                end else begin
                  try
                    s:=IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')';
                  except
                    s:='';
                  end;
                  AckResultXML('Ошибка сохранения элемента Data в файл '+sNameFile+' '+s);
                end;
              end;
            end else begin
            //------- файл отдельно во вложении к письму ------------------
              if FileExists(FTmpPath+sNameRef) then begin
                if not MySameText(sNameRef,sNameFile) then begin // имена ссылки и файла отличаются
                  if not RenameFile(FTmpPath+sNameRef,FTmpPath+sNameFile) then begin // переименовываем файл
                     AckResultXML('Ошибка переименования файла '+sNameRef+' в '+sNameFile);
                  end;
                end;
              end else begin
                AckResultXML('Не найден файл вложения '+sNameRef);
              end;
            end;
//            m:=FFilesMail.IndexOf(sNameFile);  !!!  в FFilesMail содержатся имена sNameRef  !!!
//            if m=-1 then begin
//              AckResultXML('В сообщении отсутствует файл '+sNameFile);
//            end else begin
              if FileExists(FTmpPath+sNameFile) then begin
  //              sFile:=FTmpPath+sNameFile;
  //              nErr:=Avest.SMDOVerify(sFile, slSign, true);
                sFile:=ReadFileToString(FTmpPath+sNameFile, sErr);
                if (sErr='') then begin
                  nErr:=Avest.SMDOVerify(sFile, slSign, false, FCheckCert);
                  slInfo:=TStringList.Create;
                  for j:=0 to slSign.Count-1 do begin  // информация по всем ЭЦП
                    sErr:=Avest.GetAttrSign(j,'error');
                    s:=Trim(Avest.GetAttrSign(j,'fio')+', '+Avest.GetAttrSign(j,'signdate')+', '+Avest.GetAttrSign(j,'org'));
                    if DelCharsR(s, ', ')='' then s:='';
                    if sErr<>'' then begin
                      if s=''
                        then s:=sErr
                        else s:=s+' (ошибка: '+sErr+' )';
                    end;
                    if DelCharsR(s, ', ')=''
                      then slInfo.Add('ошибка разбора ЭЦП')
                      else slInfo.Add(s);
                  end;
                  AddReceivedFile(nID, sNameFile, slInfo, slSign);
                  slInfo.Free;
                  if (nErr<>0) then begin
                    if FCheckSIGN // если включен контроль ЭЦП пишем в ошибки
                      then AckResultXML('файл '+sNameFile+'; '+DelCharsR( Avest.FullErrorInfo(nErr), chr(0)), ceSOK);
                    WriteTextLog('Ошибка проверки ЭЦП(1) файла '+sNameFile+': ['+IntToStr(nErr)+'/'+IntToStr(nErr-AVCMR_BASE)+']'+DelCharsR(Avest.FullErrorInfo(nErr),chr(0)));
                  end;
                end else begin
                  AddReceivedFile(nID, sNameFile, nil, nil);
                  WriteTextLog('Ошибка проверки ЭЦП(2) файла '+sNameFile+': '+sErr);
                end;
              end else begin
                AckResultXML('Не найден файл вложения '+sNameFile);
              end;
//            end; !!!
          end;
        end;
      end;
    end;
  end;
  //----- END  DocTransfer ----------------------------------------------------------------
  List.Free;
  ListS.Free;
  slSign.Free;
  Result:=true;
end;
//----------------------------------------------------------
function TSMDO.VerifySignFile(sFileName:String; sSignature:String; var sSignInfo: String; lDecodeSign:Boolean):Boolean;
var
  s,sErr,sFile:String;
  nErr:Integer;
  slInfo,slSign:TStringList;
  j:Integer;
  l:Boolean;
begin
  Result:=false;
  if ActiveAvest and FileExists(sFileName) then begin
    Result:=true;
    slInfo:=TStringList.Create;
//  StrToStrings(sSignInfo, slInfo, chr(13)+chr(10), false);
    slSign:=TStringList.Create;
    StrToStrings(sSignature, slSign, chr(13)+chr(10), false);
    sFile:=ReadFileToString(sFileName, sErr);
    if sErr='' then begin
      l:=Avest.FBase64;            // !!!
      Avest.FBase64:=lDecodeSign;  // !!!
      nErr:=Avest.SMDOVerify(sFile, slSign, false, FCheckCert);
      Avest.FBase64:=l;            // !!!
      // Нет доверия сертификату  const AVCMR_CERT_NOT_TRUSTED
      for j:=0 to slSign.Count-1 do begin  // информация по всем ЭЦП
        sErr:=Avest.GetAttrSign(j,'error');
        s:=Trim(Avest.GetAttrSign(j,'fio')+', '+Avest.GetAttrSign(j,'signdate')+', '+Avest.GetAttrSign(j,'org'));
        if DelCharsR(s, ', ')='' then s:='';
        if sErr<>'' then begin
          if s=''
            then s:=sErr
            else s:=s+' (ошибка: '+sErr+' )';
          Result:=false;
        end;
        if DelCharsR(s, ', ')=''
          then slInfo.Add('ошибка разбора ЭЦП')
          else slInfo.Add(s);
      end;
      if (nErr<>0) then begin
        Result:=false;
        sErr:=DelCharsR( Avest.ErrorInfo(nErr), chr(0));
      end;
    end else begin
      Result:=false;
    end;
    //if Result then begin
      sSignInfo:='';
      for j:=0 to slInfo.Count-1 do begin
        sSignInfo:=sSignInfo+slInfo.Strings[j]+chr(13)+chr(10);
      end;
    //end;
    slInfo.Free;
    slSign.Free;
  end;
end;
//-----------------------------------------------------------------------
// требуется обработка сообщений
function TSMDO.WorkReq(nType:Integer; lSk:Boolean):String;
var
  n,m:Integer;
  s:String;
  d:TDateTime;
begin
  if nType=0 then begin
    // исходящие: неотправленные + неполученные уведомления о регистрации
    // входящие : не ошибочные и не зарегистрированные
    Result:='(smd.subj_type=2 and (smd.sent=0 or (smd.msg_type>0 and not smd.subj_error and smd.ack_type<>'+IntToStr(ACK_REGISTER)+' )) ) or '+
            '(smd.subj_type=1 and (smd.msg_type=1 or smd.msg_type=3) and not smd.subj_error and smd.subj_system=0 and smd.ack_type<>'+IntToStr(ACK_REGISTER)+')';
  end else if nType=SUBJ_OUT then begin
    Result:='smd.subj_type=2 and smd.sent=0';  // исходящие, с пустой датой отправки и sent=0
  end else if nType=SUBJ_IN then begin
    n:=GlobalTask.ParamAsInteger('SMDO_CPERIOD');  // период для контроля ответа
    s:='';
    if (n>0) and (n<4) then begin
      case n of
        1: m:=-1;
        2: m:=-6;
        3: m:=-12;
      end;
      s:='smd.datepost>'+QStr(DTOS(IncMonth(Date,m),tdAds)+' 00:00:00')+' and ';
    end;
    Result:=s+'smd.subj_type=1 and (smd.msg_type=1 or smd.msg_type=3) and not smd.subj_error and smd.subj_system=0 and smd.ack_type<>'+IntToStr(ACK_REGISTER); // входящие докум. незарег. (без уведомления)
  end;
  if lSk then Result:='('+Result+')';
end;
//-----------------------------------------------------------------------
// количество писем на отправку
function TSMDO.CheckSendMail(var sSoob:String):Integer;
var
  n,m:Integer;
begin
  Result:=0;
  sSoob:='';
  n:=0;
  m:=0;
  if SMDOEnabled then begin
    // исходящие, с пустой датой отправки и sent=0
    OpenMessage(PadCStr('Контроль СМДО ...',40,' '));
    try
    dmBase.WorkQuery.SQL.Text:='select count(*) from smdopost smd where '+WorkReq(SUBJ_OUT,false)+
    ' union all '+
    'select count(*) from smdopost smd where '+WorkReq(SUBJ_IN,false);
    try
      dmBase.WorkQuery.Open;
      if dmBase.WorkQuery.Active then begin
        dmBase.WorkQuery.First;
        n:=dmBase.WorkQuery.Fields[0].AsInteger;
        dmBase.WorkQuery.Next;
        m:=dmBase.WorkQuery.Fields[0].AsInteger;
        dmBase.WorkQuery.Close;
        dmBase.WorkQuery.AdsCloseSQLStatement;
      end;
    except
      //
    end;
    finally
      CloseMessage;
    end;
  end;
  if n>0 then begin
    sSoob:='Неотправленные исходящие сообщения:  '+IntToStr(n)+#13;
  end;
  if m>0 then begin
    sSoob:=sSoob+'Необработанные входящие сообщения:  '+IntToStr(m)+#13;
  end;
  if sSoob<>'' then sSoob:='СМДО:'#13+sSoob;
  Result:=n+m; 
end;
//-----------------------------------------------------------------------
procedure TSMDO.CheckEnabledScreen(lSet:Boolean);
var
  I:Integer;
begin
  for I:=0 to Pred(Screen.FormCount) do begin
    if (Screen.Forms[I]<>FormProgress) and (Screen.Forms[I]<>MessageForm) then begin
      Screen.Forms[I].Enabled:=lSet;
    end;
  end;
end;
//-----------------------------------------------------------------------
function TSMDO.SendMail(slMsg:TStringList; slPar:TStringList):Boolean;
var
  idSMTP:TidSMTP;
  Msg:TidMessage;
  lUvd,lSoob,lOk,lMsgCreate:Boolean;
  IdSocksInfo:TIdSocksInfo;
  IdSSLIOHandlerSocket:TIdSSLIOHandlerSocket;
  att:TIdAttachment;
  nSize,nCount,i,j,n,m,nTypeRun:Integer;
  sMsgDoc,sSoob,sUved,sShow,s,sUD,sMsgID,sFile:String;
  nAckType,nCheckCount:Integer;
  sl,sl1:TStringList;
  SearchRec:TSearchRec;
  lVisible,lDel:Boolean;
//  IdSSLIOHandlerSocket:TIdSSLIOHandlerSocket;
begin
  Result:=false;
  FLastError:='';
  if not FPostEnabled then exit;

  if ValueFromParams(slPar,'CLEAR_LOG','1')='1'
    then FLocalLog.Clear;

  sShow:=ValueFromParams(slPar,'SHOWERROR','0');
  FTypeRun:=Globaltask.ParamAsInteger('SMDO_RUN');
  if FTypeRun=0 then FTypeRun:=3;
  nTypeRun:=StrToInt(ValueFromParams(slPar,'TYPERUN','-1'));
  if nTypeRun<0 then nTypeRun:=FTypeRun;
  if nTypeRun=10 then begin
    lVisible:=false;  // отправляем почту тихо без показа
    sShow:='0';
  end else begin
    lVisible:=true;
  end;

  sUved:=ValueFromParams(slPar,'ONLY_ACK','0');
  nCheckCount:=StrToInt(ValueFromParams(slPar,'CHECKCOUNT','1'));
  sSoob:=ValueFromParams(slPar,'SOOB','');
  lSoob:=(sSoob<>'');
  if FRun then begin
    FLastError:='Операция временно недоступна';
    if sShow='1' then ShowError;
    exit;
  end;
  if not CheckParamsConnect then begin
    if sShow='1' then ShowError;
    exit;
  end;
  lMsgCreate:=false;
  if slMsg=nil then begin
    lMsgCreate:=true;
    slMsg:=TStringList.Create;
    s:=ValueFromParams(slPar,'POST_ID','');
    if s<>'' then begin
      slMsg.Add(s);
    end else begin
      // исходящие, с пустой датой отправки и sent=0
      try
        dmBase.WorkQuery.SQL.Text:='select id from smdopost where subj_type=2 and sent=0 ';
        if sUved<>'0'
          then dmBase.WorkQuery.SQL.Text:=dmBase.WorkQuery.SQL.Text+Format(' and msg_type=%d', [MSG_TYPE_A]);
        dmBase.WorkQuery.SQL.Text:=dmBase.WorkQuery.SQL.Text+' order by id ';  // в порядке их создания
//        showmessage(dmBase.WorkQuery.SQL.Text);
        dmBase.WorkQuery.Open;
        while not dmBase.WorkQuery.Eof do begin
          slMsg.Add(dmBase.WorkQuery.Fields[0].AsString);
          dmBase.WorkQuery.Next;
        end;
        dmBase.WorkQuery.Close;
        dmBase.WorkQuery.AdsCloseSQLStatement;
      except
      end;
    end;
  end;
  if slMsg.Count=0 then begin
    if nCheckCount=1 then  begin
      FLastError:='Нет сообщений для отправки';
      if sShow='1' then ShowError;
    end else begin
      Result:=true;
    end;
    exit;
  end;

  FRun:=true;
  try
  if dmBase._LockTypeObj(_TypeObj_SMDOPost, 'Другой пользователь получает (отправляет) почту ...',lVisible) then begin
    Result:=true;
    try
      sl:=TStringList.Create;
      sl1:=TStringList.Create;
      IdSocksInfo:=nil;
      idSMTP:=TidSMTP.Create(nil);
      Msg:=TidMessage.Create(nil);
      IdSocksInfo:=nil;
      if FSSL then begin
//        { !!!
        IdSocksInfo:=TIdSocksInfo.Create(nil);
        IdSocksInfo.Authentication:=saNoAuthentication;
        IdSocksInfo.Port:=FPopPort;
        IdSocksInfo.Version:=svNoSocks;
        IdSSLIOHandlerSocket:=TIdSSLIOHandlerSocket.Create(nil);
        IdSSLIOHandlerSocket.SocksInfo:=IdSocksInfo;
        IdSSLIOHandlerSocket.SSLOptions.Method:=sslvTLSv1;
        idSmtp.IOHandler:= IdSSLIOHandlerSocket; //}
      end else begin
        IdSMTP.IOHandler:=nil;
      end;
      if FAutho
        then idSmtp.AuthenticationType:=atLogin
        else idSmtp.AuthenticationType:=atNone;
      IdSMTP.Host:=FSmtpServer;
      IdSMTP.Port:=FSmtpPort;
      IdSMTP.Username:=FUserName;
      IdSMTP.Password:=FCurPassword;
      Result:=true;

      if lVisible then OpenMessage(PadCStr('Подключение ...',40,' '));
      WriteTextLog(StringOfChar('=',50));
      WriteTextLog('Подключение для отправки почты.');
      try
        IdSMTP.Connect; //(15000);
      except
        on E:Exception do begin
          if lVisible then CloseMessage;
          Result:=false;
          FLastError:=CreateErrorConnect(E.Message);
          WriteTextLog(StringReplace(FLastError, #13#10, ' ', [rfReplaceAll]));
        end;
      end;

      if Result and not IdSMTP.Connected   // !!!   изменение 14.11.2016
        then Result:=false;                // !!!

      FTmpPath:=CheckSleshN(CreateTmpPath(0));
      if Result then begin
        if lVisible then CloseMessage;
        FMsgSize:=0;
        if lVisible then begin
          if nTypeRun=1 then begin           // <<<<<<<<<<<<<<<<<<<<<<<<<
//            fmMain.CheckVisibleGIF(true,'Отправка почты',false);
            _WorkedThread_:=true;
            fmMain.CheckVisibleProgress(true,'Отправка почты',false);
            idSmtp.OnWork:=IdWork_MainForm;
            idSmtp.OnWorkBegin:=IdWorkBegin_MainForm;
            idSmtp.OnWorkEnd:=IdWorkEnd_MainForm;
            EnterWorkerThread;
          end else if nTypeRun=2 then begin  // <<<<<<<<<<<<<<<<<<<<<<<<<
            if lSoob
              then OpenMessage(sSoob)
              else OpenMessage(' Отправка почты .....................');
          end else if nTypeRun=3 then begin  // <<<<<<<<<<<<<<<<<<<<<<<<<
            idSmtp.OnWork:=IdWork;
            idSmtp.OnWorkBegin:=IdWorkBegin;
            idSmtp.OnWorkEnd:=IdWorkEnd;
            CreateProgress('Отправка почты', sSoob, 100, 0,0);
            CheckEnabledScreen(false);
          end;
        end;
        try
          m:=0;
          for i:=0 to slMsg.Count-1 do begin
            if lVisible then begin
              if not lSoob
                then sSoob:='Отправка почты '+intToStr(i+1)+'/'+intToStr(slMsg.Count);
              if nTypeRun=1 then begin
                EnterMainThread;
                try
                  fmMain.SetCaptionPanel0(sSoob);
                finally
                  LeaveMainThread;
                end;
              end else if nTypeRun=2 then begin
                ChangeMessage(sSoob);
              end;
            end;
            if dmBase.SMDOPost.Locate('ID', slMsg.Strings[i], []) then begin
              sMsgID:=dmBase.SMDOPost.FieldByName('MSG_ID').AsString;
              WriteTextLog(StringOfChar('-',50));
              WriteTextLog('кому:"'+dmBase.SMDOPost.FieldByName('NAME').AsString+', письмо:"' +dmBase.SMDOPost.FieldByName('SUBJECT').AsString+'", MSG_ID= '+sMsgID+
                           ' ID='+dmBase.SMDOPost.FieldByName('ID').AsString);
              if dmBase.SMDOPost.FieldByName('MSG_TYPE').AsInteger=MSG_TYPE_A then lUvd:=true else lUvd:=false;
              if SMDOtoXML(dmBase.SMDOPost.FieldByName('ID').AsInteger) then begin
                lOk:=true;
                Msg.Clear;
                Msg.UID:=sMsgID;
                Msg.MsgId:=sMsgID;
                Msg.Subject:=EncodeMIME(dmBase.SMDOPost.FieldByName('SUBJECT').AsString);
                Msg.Body.Text:='';
                Msg.From.Text:=getEmail;
                Msg.Organization:=getKodSMDO;
                Msg.Recipients.EMailAddresses:=FRouter;
      //    att:=TIdAttachment.Create(idMessage1.MessageParts,'C:\1.txt');
                for n:=0 to FFilesMail.Count-1 do begin
                  TIdAttachment.Create(Msg.MessageParts, Trim(FFilesMail.Strings[n]));
                end;
                FMsgSize:=SizeMessage(Msg);
                if nTypeRun=3 then begin
                  InitProgress(FMsgSize,sSoob);
                end;
                try
                  idSmtp.Send(Msg);
                except
                  on E: EIdProtocolReplyError do begin
                   WriteTextLog('ОШИБКА '+InttoStr(EIdProtocolReplyError(E).ReplyErrorCode)+' >>> '+E.Message);
                   lOk:=false;
                  end;
                  on E:Exception do begin
                    lOk:=false;
                    WriteTextLog('ОШИБКА '+E.Message);
                  end;
                end;
                if lOk then begin
                  if FSaveEML then begin
                    if not lUvd or FSaveEML_A then begin     // если документ или сохранять и уведомления
                      try
                        Msg.SaveToFile(GetPathEML+'OUT_'+sMsgID+'.eml');    // сохраняем письмо в файл
                        WriteTextLog('сохранение собщения в файл: '+GetPathEML+'OUT_'+sMsgID+'.eml');
                      except
                        on E:Exception do begin
                          WriteTextLog('ошибка сохранения собщения '+GetPathEML+'OUT_'+sMsgID+'.eml:'+E.Message);
                        end;
                      end;
                    end;
                  end;
                  Inc(m,1);
                  if dmBase.SMDOPost.Locate('ID', slMsg.Strings[i], []) then begin
                    dmBase.SMDOPost.Edit;
                    dmBase.SMDOPost.FieldByName('SENT').AsInteger:=1;
                    dmBase.SMDOPost.FieldByName('DATEPOST').AsDateTime:=Now;
//                  dmBase.SMDOPost.FieldByName('DOC_STATUS').AsInteger:=DOC_PRESENT;
                    dmBase.SMDOPost.Post;
                  end;
                  WriteTextLog('отправлено');
                  // было отправлено уведомление для документа, изменим статус документа
                  if dmBase.SMDOPost.FieldByName('MSG_TYPE').AsInteger=MSG_TYPE_A then  begin
                    sMsgDoc:=dmBase.SMDOPost.FieldByName('ACK_MSG_ID').AsString;  // GUID документа для которого сформировано уведомление
                    nAckType:=dmBase.SMDOPost.FieldByName('ACK_TYPE').AsInteger;
                    if dmBase.SMDOPost.Locate('MSG_ID', sMsgDoc, []) then begin
                      if (nAckType=ACK_DELIVER) and (dmBase.SMDOPost.FieldByName('ACK_TYPE').AsInteger>ACK_DELIVER) then begin
                         // может в ACK_TYPE уже записано значение ACK_REGISTER
                        WriteTextLog('для документа "'+sMsgDoc+'" невозможно записать ACK_TYPE='+Inttostr(nAckType)+' т.к. ACK_TYPE='+dmBase.SMDOPost.FieldByName('ACK_TYPE').AsString);
                      end else begin
                        dmBase.SMDOPost.Edit;
                        dmBase.SMDOPost.FieldByName('ACK_TYPE').AsInteger:=nAckType;
                        dmBase.SMDOPost.Post;
                        WriteTextLog('для документа "'+sMsgDoc+'" записан ACK_TYPE='+Inttostr(nAckType));
                      end;
                    end else begin
                      WriteTextLog('документ "'+sMsgDoc+'" для записи ACK_TYPE='+IntToStr(nAckType)+' не найден');
                    end;
                  end;
                end else begin
                  WriteTextLog('не отправлено');
                end;
              end else begin
                WriteTextLog('ОШИБКА подготовки');
              end;
            end;
            ClearDir(FTmpPath,false);
          end;

        finally
          if lVisible then begin
            if nTypeRun=1 then begin
              EnterMainThread;
              try
                fmMain.CheckVisibleProgress(false,'', false);
              finally
                LeaveMainThread;
              end;
              LeaveWorkerThread;
              _WorkedThread_:=false;
//              fmMain.CheckVisibleGIF(false,'');
              idSmtp.OnWork:=nil;
              idSmtp.OnWorkBegin:=nil;
              idSmtp.OnWorkEnd:=nil;
            end else if nTypeRun=2 then begin
              CloseMessage;
            end else if nTypeRun=3 then begin
              CheckEnabledScreen(true);
              idSmtp.OnWork:=nil;
              idSmtp.OnWorkBegin:=nil;
              idSmtp.OnWorkEnd:=nil;
              CloseProgress;
            end;
          end;
        end;
        if slMsg.Count>m then begin
          FLastError:='Неотправлено сообщений: '+IntToStr(slMsg.Count-m)+' !';
          Result:=false;
        end;
      end;
      if idSMTP.Connected
        then idSMTP.Disconnect;
      if lMsgCreate then slMsg.Free;
      sl1.Free;
      sl.Free;
      FreeAndNil(idSMTP);
      FreeAndNil(Msg);
      if IdSocksInfo<>nil then begin
        IdSocksInfo.Free;
        IdSSLIOHandlerSocket.Free;
      end;
      ClearDir(FTmpPath,false);
    finally
      dmBase._UnLockTypeObj(_TypeObj_SMDOPost);
    end;
  end else begin
    FLastError:='Отказ';
    Result:=false;
  end;

  finally
    FRun:=false;
  end;

//  FreeAndNil(IdSSLIOHandlerSocket);

end;
//-----------------------------------------------------
function TSMDO.SizeMessage(Msg:TidMessage):Integer;
var
 S: TMemoryStream;
begin
  Result:=0;
  S := TMemoryStream.Create;
  try
  // получаем размер всего сообщения
    Msg.SaveToStream(S, False);
    Result:=S.Size;
  // вычитаем заголовок
    S.Clear;
    Msg.SaveToStream(S, True);
    Result:=Result-S.Size;
  finally
     S.Free;
  end;
end;

//-----------------------------------------------------
function TSMDO.CreateReceiver(nodeHeader:TXMLNode; nPostID:Integer; sName:string; sSmdoCode:String):Boolean;
var
  nodeR,nodeOrg, nodeMen, node:TXMLNode;
  sl:TStringList;
  i:Integer;
  s:String;
begin
  Result:=false;
  // обработка рассылки
  if (sSmdoCode=DELIVER_KEY) then begin
  {
    dmBase.tbSimplePropMemo.IndexName:='PR_KEY';   // TYPEOBJ;ID;DATES;POKAZ
    if dmBase.tbSimplePropMemo.FindKey([_TypeObj_SMDOPost,nPostID,EmptyDate,DELIVER_KEY]) then begin
      sl:=TStringList.Create;
      s:=dmBase.tbSimplePropMemo.FieldByName('VALUE').AsString;
      }
    sl:=TStringList.Create;
    StrToStrings(sName,sl,',',true);
    for i:=0 to sl.Count-1 do begin
      sName:='';
      sSmdoCode:=Trim(sl.Strings[i]);
      if dmBase.SMDOSprOrg.Locate('smdocode',sSmdoCode,[]) then begin
        sName:=dmBase.SMDOSprOrg.FieldByName('NAME').AsString;
      end;
      Result:=true;
      nodeR:=nodeHeader.NodeNew('Receiver');
      nodeR.AttributeAdd('name', CheckStrW(sName));
      nodeR.AttributeAdd('id', CheckStrW(sSmdoCode));
      nodeOrg:=nodeR.NodeNew('Organization');
      nodeOrg.AttributeAdd('organization_string', CheckStrW(sName));
    end;
    sl.Free;
  end else begin
    Result:=true;
    nodeR:=nodeHeader.NodeNew('Receiver');
    nodeR.AttributeAdd('name', CheckStrW(sName));
    nodeR.AttributeAdd('id', CheckStrW(sSmdoCode));
    with dmBase.SMDOMens do begin
      IndexName:='POST_KEY';
      SetRange([nPostID,nPostID,MEN_RECEIVER],[nPostID,nPostID,MEN_RECEIVER]);
      try
        if not Eof then begin
          nodeOrg:=nodeR.NodeNew('Organization');
          nodeOrg.AttributeAdd('organization_string', CheckStrW(sName));
          while not Eof do begin
            nodeMen:=nodeOrg.NodeNew('OfficialPerson');
            if FieldByName('FIO').AsString='' then begin
              Result:=false;
            end else begin
              node:=nodeMen.NodeNew('Name');
              node.ValueAsString:=CheckStrW(FieldByName('FIO').AsString);
            end;
            if FieldByName('OFFICIAL').AsString<>'' then begin
              node:=nodeMen.NodeNew('Official');
              node.ValueAsString:=CheckStrW(FieldByName('OFFICIAL').AsString);
            end;
            Next;
          end;
        end else begin
          nodeOrg:=nodeR.NodeNew('Organization');
          nodeOrg.AttributeAdd('organization_string', CheckStrW(sName));
        end;
      finally
        CancelRange;
      end;
    end;
    RefToXML(nodeR,0);
  end;                
end;
//-----------------------------------------------------
function TSMDO.AttachFileToXML(node:TXMLNode; nPostID:Integer; var nFile:Integer):Boolean;
var
  sMD5_1, sMD5_2,s,sFileR,sFile,sPathReal,sPath:String;
  node1:TXMLNode;
  sl:TStringList;
  i:Integer;
begin
  Result:=true;
  sl:=TStringList.Create;
  Inc(nFile,1);
  sFileR:='attach'+IntToStr(nFile);
  sFile:=Trim(dmBase.SMDOFile.FieldByName('NAME').AsString);
  try
    sMD5_1:=Trim(dmBase.SMDOFile.FieldByName('MD5').AsString);
  except
    sMD5_1:='';
  end;
  //--- !!! ---------------------------------------------------------------------------
  // $$$ заменить на dmBase.getFileSMDO(FILE_ID)
  sPathReal:=GetPathAttach(0, nPostID);
  if not FileExists(sPathReal+sFile) then begin
    sPathReal:=NormDir(Trim(dmBase.SMDOFile.FieldByName('PATH').AsString));
  end;
  if FileExists(sPathReal+sFile) then begin
    //-------- проверка хеш кода файла и ранее сохраненного ---------------------
    {   $$$
    sMD5_2:=CalcMD5File(sPathReal+sFile);
    if (sMD5_1<>'') and (sMD5_2<>'') then begin
      if (sMD5_1<>sMD5_2) then begin
        WriteTextLog('ОШИБКА хеш-код MD5 файла '+sFile+' не соответствует ранее сохраненному ('+sMD5_2+'<>'+sMD5_1+')');
        Result:=false;
      end;
    end; }
    //----------------------------------------------------------------------------
    if Result then begin
      if not CopyFile(PChar(sPathReal+sFile), PChar(FTmpPath+sFileR), true) then begin
        WriteTextLog('ОШИБКА создания прикрепленного файла: '+sPathReal+sFile+' -> '+FTmpPath+sFileR+' ('+SysErrorMessage(GetLastError)+') ');
        Result:=false;
      end else begin
        FFilesMail.Add(FTmpPath+sFileR);
        node.AttributeAdd('name', CheckStrW(sFile));
        node1:=node.NodeNew('Data');
        node1.AttributeAdd('referenceid', CheckStrW(sFileR));
        s:=dmBase.SMDOFile.FieldByName('SIGNATURE').AsString;
        StrToStrings(s,sl,chr(13)+chr(10),true);
        for i:=0 to sl.Count-1 do begin
          node1:=node.NodeNew('Signature');
          node1.ValueAsString:=sl.Strings[i];
        end;
      end;
    end;
  end else begin
    WriteTextLog('ОШИБКА не найден фалй на отправку: '+sPathReal+sFile);
    Result:=false;
  end;
  sl.Free;
end;
//-----------------------------------------------------
function TSMDO.MenToXML(node:TXMLNode; nTip:Integer):Boolean;
var
  sAdd,s,sNameOrg:String;
  nn, node1,nodeOrg,nodeMen:TXMLNode;
  n:Integer;
  procedure AddIsNotEmpty(n:TXMLNode; sNode:String; fld:TField; sA:String='');
  begin
    if Trim(fld.AsString)<>'' then begin
      nn:=n.NodeNew(sNode);
      nn.ValueAsString:=CheckStrW(Trim(fld.AsString));
      if sA<>'' then nn.AttributeAdd('type', CheckStrW(sA));
    end;
  end;
begin
  Result:=true;
  with dmBase.SMDOMens do begin
    if (node.Name='Executor') and ((nTip=MEN_EXECUTOR) or (nTip=MEN_EXECUTOR_S)) then begin
      node.AttributeAdd( 'responsible', IntToStr(IfThen(nTip=MEN_EXECUTOR_S,0,1)));
//      if Trim(FieldByName('TEXT').AsString)<>'' then node.AttributeAdd('task_specified', CheckStrW(Trim(FieldByName('TEXT').AsString)) );
      if not FieldByName('SROK').IsNull  then node.AttributeAdd('deadline', CheckStrW(DateToString(FieldByName('SROK').AsDateTime,false,false)) );
    end;
    sNameOrg:=Trim(FieldByName('ORG').AsString);
    if sNameOrg=''
      then sNameOrg:=SMDO.GetRekvMyOrg('NAME');
    if (Copy(node.Name,1,6)='Author') or (node.Name='Validator')
      then sAdd:='WithSign'
      else sAdd:='';
    if (node.Name='Validator') then begin
//    [KEY_ATTESTATION]  1=согласовано  2=утверждено  3=согласовано с замечаниями  4=отклонено
      s:=GlobalTask.CurrentOpisEdit.SeekValue('KEY_ATTESTATION', FieldByName('attestation').AsString,false);
      if s='' then s:='Согласовано';
      node.AttributeAdd('attestation', CheckStrW(s));
    end;
    nodeOrg:=node.NodeNew('Organization'+sAdd);
    nodeOrg.AttributeAdd('organization_string', CheckStrW(sNameOrg));
//    nodeOrg.AttributeAdd('fullname', CheckStrW(sNameOrg));
    nodeMen:=nodeOrg.NodeNew('OfficialPerson'+sAdd);
    node1:=nodeMen.NodeNew('Name');
    node1.ValueAsString:=CheckStrW(FieldByName('FIO').AsString);
    AddIsNotEmpty(nodeMen, 'Adres', FieldByName('ADRES'));
    AddIsNotEmpty(nodeMen, 'Official', FieldByName('OFFICIAL'));
    AddIsNotEmpty(nodeMen, 'Econtact', FieldByName('TEL_WORK'), '1');
    AddIsNotEmpty(nodeMen, 'Econtact', FieldByName('TEL_MOB'), '3');
    AddIsNotEmpty(nodeMen, 'Econtact', FieldByName('EMAIL'), '5');
    // ..WithSign только для Author, AuthorOrganization, Validatoor
    if (sAdd<>'') and not FieldByName('SIGNDATE').IsNull and (FieldByName('SIGNDATE').AsDateTime>0) then begin
      node1:=nodeMen.NodeNew('SignDate');
      node1.ValueAsString:=CheckStrW(DateToString(FieldByName('SIGNDATE').AsDateTime,false,false));
    end;
    if Trim(FieldByName('FIO').AsString)='' then begin
      WriteTextLog('ОШИБКА. Отсутствует ФИО для "'+node.Name+'.Organization'+sAdd+'.Name"');
      Result:=false;
    end;
  end;
  if sNameOrg='' then begin
    WriteTextLog('ОШИБКА. Отсутствует название организации для "'+node.Name+'.Organization'+sAdd+'"');
    Result:=false;
  end;
end;
//-----------------------------------------------------
function TSMDO.getEnvelopType:String;
begin
  if VersionXML_OUT=211
    then Result:='SDIP-2.1.1'
    else Result:='SDIP-1.0';
end;
//------------------------------------------------------
function TSMDO.RefToSMDO(nodeOwner:TXMLNode; nIDRef:Integer; sSmdoCode:String; var sErr:String; var sOutIdNumbers:String):Boolean;
var
  i,nRetype:Integer;
  node:TXMLNode;
  s,sIdNumber,sAtrDate,sRegNumber:String;
  dRegNumber:TDateTime;
  lFind,lOk:Boolean;
begin
  Result:=true;
  sErr:='';
  sOutIdNumbers:='';
{        <Referred idnumber="ссылка на докум. пришедший в зоне Document или Task" retype="1-ссылка на док. 2-ссылка на задание" >
          <Regnumber regdate="YYYY-MM-DD" >регистрационный номер</Regnumber>  <!-- 0-1 или -->
          <TaskNumber taskdate="YYYY-MM-DD" >номер задания</TaskNumber>       <!-- 0-1 -->
        </Referred> }
  for i:=0 to nodeOwner.NodeCount-1 do begin
    if ANSILowerCase(nodeOwner.Nodes[i].Name)='referred' then begin
      lOk:=false;
      lFind:=false;
      sIdNumber:=XMLtoValue(nodeOwner.Nodes[i].ReadAttributeString('idnumber'),ftString,'');
      if (sIdNumber='') and (FRefIdNumber<>'')    // если idnumber в Folder не заполнено, но заполнен idnumber в  <Receiver> <Referred>
        then sIdNumber:=FRefIdNumber;

      if nodeOwner.Nodes[i].ReadAttributeString('retype')='2' then begin  // ссылка на задание
        nRetype:=2;
        node:=nodeOwner.Nodes[i].FindNode('Tasknumber');
        sAtrDate:='taskdate';
      end else begin
        nRetype:=1;
        node:=nodeOwner.Nodes[i].FindNode('Regnumber');
        sAtrDate:='regdate';
      end;
      if (node<>nil) and (node.ValueAsString<>'') then begin
        FReferred.Append;
        FReferred.FieldByName('PARENT_ID').AsInteger:=nIDRef;
        FReferred.FieldByName('RETYPE').AsInteger:=nRetype;
        FReferred.FieldByName('IDNUMBER').AsString:=sIdNumber;
        FReferred.FieldByName('REGNUMBER').AsString:=XMLtoValue(node.ValueAsString,ftString,'');
        FReferred.FieldByName('REGDATE').AsDateTime:=XMLtoValue(node.ReadAttributeString(sAtrDate,''),ftDate,0);
        FReferred.Post;
        lOk:=true;
      end;
      if (sIdNumber<>'') and (sIdNumber<>FDokIdNumber) then begin
        // поищем по коду организации и idnumber документа
        dmBase.WorkQuery.SQL.Text:='select ADR_REGNUMBER, ADR_REGDATE from SMDOPost where smdocode='+QStr(sSmdoCode)+' and idnumber='+QStr(sIdNumber);
        dmBase.WorkQuery.Open;
        try
          if dmBase.WorkQuery.Fields[0].AsString<>'' then begin
            if lOk then begin
              FReferred.Edit;
            end else begin
              FReferred.Append;
              FReferred.FieldByName('PARENT_ID').AsInteger:=nIDRef;
              FReferred.FieldByName('RETYPE').AsInteger:=nRetype;
              FReferred.FieldByName('IDNUMBER').AsString:=sIdNumber;
            end;
            FReferred.FieldByName('REGNUMBER').AsString:=dmBase.WorkQuery.Fields[0].AsString;
            if not dmBase.WorkQuery.Fields[1].IsNull
              then FReferred.FieldByName('REGDATE').AsDateTime:=dmBase.WorkQuery.Fields[1].AsDateTime;
            FReferred.Post;
            lFind:=true;
            lOk:=true;
          end;
        finally
          dmBase.WorkQuery.Close;
        end;
      end;
      if lOk then begin
        if sIdNumber<>FDokIdNumber then begin
          FCheckReferred:=true;  // есть доп. материал к другим сообщениям
          if Pos(sIdNumber+';',sOutIdNumbers)=0 then begin
            FCountAddFolder:=FCountAddFolder+1;
            sOutIdNumbers:=sOutIdNumbers+sIdNumber+';';
            if not lFind then s:=', документ в базе не найден' else s:='';
            FAckResultOk.Add('Получен дополнительный материал к документу №'+FReferred.FieldByName('REGNUMBER').AsString+' от '+
                             DatePropis(FReferred.FieldByName('REGDATE').AsDateTime,3)+', idnumber='+sIdNumber+s);
          end;
        end;
      end;
    end;
  end;
end;
//-----------------------------------------------------
// result=true если ссылка добавлена
function TSMDO.RefToXML(nodeOwner:TXMLNode; nIDRef:Integer):Boolean;
var
  node,node1:TXMLNode;
begin
  Result:=false;
  FReferred.Filter:='parent_id='+IntToStr(nIDRef);
  FReferred.Filtered:=true;
  while not FReferred.Eof do begin
    Result:=true;
    node:=nodeOwner.NodeNew('Referred');
    node.AttributeAdd('idnumber', FReferred.FieldByName('IDNUMBER').AsString);
    node.AttributeAdd('retype', FReferred.FieldByName('RETYPE').AsString);
    if FReferred.FieldByName('RETYPE').AsString='2' then begin
      node1:=node.NodeNew('TaskNumber');
      node1.AttributeAdd('taskdate', CheckStrW(DateToString(FReferred.FieldByName('REGDATE').AsDateTime,false,false)));
      node1.ValueAsString:=CheckStrW(FReferred.FieldByName('REGNUMBER').AsString);
    end else begin
      node1:=node.NodeNew('RegNumber');
      node1.AttributeAdd('regdate', CheckStrW(DateToString(FReferred.FieldByName('REGDATE').AsDateTime,false,false)));
      node1.ValueAsString:=CheckStrW(FReferred.FieldByName('REGNUMBER').AsString);
    end;
    FReferred.Next;
  end;
  FReferred.Filtered:=false;
  FReferred.Filter:='';
end;
//-----------------------------------------------------
function TSMDO.SMDOtoXML(nPostID:Integer):Boolean;
var
  sFileXML,sBM,sMsgID, s,ss:String;
  sNode,sFile,sFileR,sMyRegNumber,sPathReal:String;
  lFile,lErr:Boolean;
  node, node1, nodeList, nodeFolder,nodeTask, nodeHeader, nodeBody, nodeDoc, nodeAck:TXMLNode;
  sl:TStringList;
  nMsgType,nTaskID, nTask,i,nKey,nFile:Integer;
  dMyRegNumber:TDateTime;
  procedure AddIsNotEmpty(n:TXMLNode; sAttr:String; fld:TField);
  begin if Trim(fld.AsString)<>'' then n.AttributeAdd(sAttr, CheckStrW(Trim(fld.AsString))); end;
begin
  ClearDS;
  try
  Result:=true;
  lErr:=false;
  FFilesMail.Clear;
  sl:=TStringList.Create;
  sBM:='';
  sMyRegNumber:='';
  dMyRegNumber:=0;
  with dmBase.SMDOPost do begin
    if FieldByName('ID').AsInteger<>nPostID then begin
      sBM:=Bookmark;
      if not Locate('ID', nPostID, []) then Result:=false;
    end;
    if Result then begin
      XML.Clear;
      FXML.XmlFormat:=xfReadable;
      FXML.Root.Name:='Envelop';
      sMsgID:=FieldByName('MSG_ID').AsString;
      XML.Root.AttributeAdd('msg_id', CheckStrW(sMsgID));
      XML.Root.AttributeAdd('subject', CheckStrW(FieldByName('SUBJECT').AsString));
      XML.Root.AttributeAdd('type', CheckStrW(getEnvelopType));

//      XML.Root.AttributeAdd('dtstamp', CheckStrW(DateToString(FieldByName('DTSTAMP').AsDateTime,true,false))); // !!! Now ???
      XML.Root.AttributeAdd('dtstamp', CheckStrW(DateToString(Now,true,false)));   // изменение  14.11.2016

      nMsgType:=FieldByName('MSG_TYPE').AsInteger;
      nodeHeader:=XML.Root.NodeNew('Header');
      nodeHeader.AttributeAdd('msg_type', IntToStr(nMsgType));
      nodeHeader.AttributeAdd('msg_acknow', FieldByName('MSG_ACKNOW').AsString);

      node:=nodeHeader.NodeNew('Sender');
      node.AttributeAdd('id', CheckStrW(getKodSMDO));
      s:=getKodSMDO_MD5; // MD5Print(MD5String(ANSIUppercase(s+'myfirstlove'+s)));
      ss:=dmBase.IniSysParams.ReadString('PARAM','ADD','');
      if s<>ss then begin
        try
          dmBase.IniSysParams.WriteString('PARAM','ADD',s);
          dmBase.IniSysParams.UpdateFile;
          dmBase.AdsConnection.Execute('UPDATE global set org='+QStr(s)+';');
        except
        end;
      end;
      node.AttributeAdd('name', CheckStrW(GetRekvMyOrg('NAME')));
      if GetSystemID=SEDVALUE_DELO then begin
        node.AttributeAdd('sys_id', CheckStrW(SEDVALUE_DELO));
        node.AttributeAdd('system', CheckStrW(SEDNAME_DELO));
        node.AttributeAdd('system_details', CheckStrW('версия 1.0'));
      end else begin
        node.AttributeAdd('sys_id', CheckStrW(GetSystemID));
        node.AttributeAdd('system', CheckStrW(GetSystemName));
        node.AttributeAdd('system_details', CheckStrW(VERSION_SYSTEM_SMDO));
      end;
      //--------- прочитаем Referred ------------------------------
      ReadAddDataSet(nPostID,ds2xml);

      CreateReceiver(nodeHeader, nPostID, FieldByName('NAME').AsString, FieldByName('SMDOCODE').AsString);
      nodeBody:=XML.Root.NodeNew('Body');
      //================================================================
      // УВЕДОМЛНЕНИЕ
      //===============================================================
      if nMsgType=MSG_TYPE_A then  begin
        sFileXML:=sMsgID+'_ack.xml';
        WriteTextLog('Создание файла '+sFileXML);
        nodeAck:=nodeBody.NodeNew('Acknowledgement');
        nodeAck.AttributeAdd('msg_id', CheckStrW(FieldByName('ACK_MSG_ID').AsString));
        nodeAck.AttributeAdd('ack_type', CheckStrW(FieldByName('ACK_TYPE').AsString));
        node:=nodeAck.NodeNew('RegNumber');
        if not FieldByName('ADR_REGDATE').IsNUll
          then node.AttributeAdd('regdate', CheckStrW(dateToString(FieldByName('ADR_REGDATE').AsDateTime,false,false)));
        node.ValueAsString:=CheckStrW(FieldByName('ADR_REGNUMBER').AsString);
        if FieldByName('MY_REGNUMBER').AsString<>'' then begin
          node:=nodeAck.NodeNew('IncNumber');
          if not FieldByName('MY_REGDATE').IsNull
            then node.AttributeAdd('regdate', CheckStrW(dateToString(FieldByName('MY_REGDATE').AsDateTime,false,false)))
            else node.AttributeAdd('regdate', CheckStrW(dateToString(GetDefaultDate,false,false)));
          node.ValueAsString:=CheckStrW(FieldByName('MY_REGNUMBER').AsString);
        end;
        Text2AckResult(FieldByName('TEXT').AsString);
        AckResult2XML(nodeAck);
      end else begin
      //================================================================
      // ДОКУМЕНТ
      //===============================================================
        sFileXML:=sMsgID+'_data.xml';
        WriteTextLog('Создание файла '+sFileXML);
        if not MsgIsAddDoc(nMsgType) then begin   // <<<<<<<<<<<<<<<<<<
          nodeDoc:=nodeBody.NodeNew('Document');
          nodeDoc.AttributeAdd('idnumber', CheckStrW(IntToStr(nPostID)));
          nodeDoc.AttributeAdd('type', CheckStrW(FieldByName('DOC_TYPE').AsString));
          nodeDoc.AttributeAdd('kind', CheckStrW(FieldByName('KIND').AsString));
          nodeDoc.AttributeAdd('pages', CheckStrW(IntToStr(FieldByName('PAGES').AsInteger)));
          AddIsNotEmpty(nodeDoc, 'title', FindField('TEXT') );
          AddIsNotEmpty(nodeDoc, 'annotation', FindField('KOMM') );
          sMyRegNumber:=Trim(FieldByName('MY_REGNUMBER').AsString);
          dMyRegNumber:=FieldByName('MY_REGDATE').AsDateTime;
          node:=nodeDoc.NodeNew('RegNumber');
          node.AttributeAdd('regdate', CheckStrW(DateToString(dMyRegNumber,false,false)));
          node.ValueAsString:=CheckStrW(sMyRegNumber); // <-- пишется дата ???

          if FieldByName('PAR_REGNUMBER').AsString<>'' then begin  // в ответ на
            node:=nodeDoc.NodeNew('DocParent');
            if FieldByName('PAR_DELIVERY_TYPE').AsInteger=DELIVERY_TYPE_SMDO then begin
              node.AttributeAdd('idnumber', CheckStrW(FieldByName('PAR_IDNUMBER').AsString));
              node.AttributeAdd('lastmsg_id', CheckStrW(FieldByName('PAR_LASTMSG').AsString));
              if Trim(FieldByName('PAR_PARMSG').AsString)=''
                then node.AttributeAdd('parmsg_id', FieldByName('PAR_LASTMSG').AsString)
                else node.AttributeAdd('parmsg_id', CheckStrW(FieldByName('PAR_PARMSG').AsString));
            end else begin
              node.AttributeAdd('idnumber', '');
              node.AttributeAdd('lastmsg_id', '');
              node.AttributeAdd('parmsg_id', '');
            end;
            node.AttributeAdd('delivery_type', CheckStrW(FieldByName('PAR_DELIVERY_TYPE').AsString));
            node.AttributeAdd('parorg_id', CheckStrW(FieldByName('PAR_PARORG').AsString));

            node:=node.NodeNew('RegNumber');
            node.AttributeAdd('regdate', CheckStrW(DateToString(FieldByName('PAR_REGDATE').AsDateTime,false,false)));
            node.ValueAsString:=CheckStrW(FieldByName('PAR_REGNUMBER').AsString);
          end;

          node:=nodeDoc.NodeNew('Confident');
          node.AttributeAdd('flag', CheckStrW(IntToStr(FieldByName('FLAG').AsInteger)));
          AddIsNotEmpty(node, 'numcopy', FindField('NUMCOPY') );
          node.ValueAsString:=CheckStrW(FieldByName('CONFIDENT').AsString);
          // <Referred>, <docnumber>
          nFile:=0;
          //======= ФАЙЛЫ ДОКУМЕНТА ===========================================================================
          dmBase.SMDOFile.IndexName:='POST_KEY';   //POST_ID;PARENT_ID
          dmBase.SMDOFile.SetRange([nPostID,nPostID],[nPostID,nPostID]);
          try
            while not dmBase.SMDOFile.Eof do begin
              node:=nodeDoc.NodeNew('DocTransfer');
              if not AttachFileToXML(node, nPostID, nFile)
                then Result:=false;
              dmBase.SMDOFile.Next;
            end;
          finally
            dmBase.SMDOFile.CancelRange;
          end;
          //======= ЛЮДИ ДОКУМЕНТА ======================================================================================
          sl.Clear;
          sl.Add('Author='+IntToStr(MEN_AUTHOR));
          sl.Add('Validator='+IntToStr(MEN_VALIDATOR));
          sl.Add('Writer='+IntToStr(MEN_WRITER));
          dmBase.SMDOMens.IndexName:='POST_KEY';
          for i:=0 to sl.Count-1 do begin
            sNode:=sl.Names[i];
            nKey:=StrToInt(sl.ValueFromIndex[i]);
            dmBase.SMDOMens.SetRange([nPostID,nPostID,nKey],[nPostID,nPostID,nKey]);
            try
              while not dmBase.SMDOMens.Eof do begin
                node:=nodeDoc.NodeNew(sNode);
                if not MenToXML(node,nKey)
                  then Result:=false;
                dmBase.SMDOMens.Next;
              end;
            finally
              dmBase.SMDOMens.CancelRange;
            end;
          end;
        end;                                    // end <<<<<<<<<<<<<<<<<<
        //=========================================================================================
        //===== TASK (ЗАДАНИЯ) ====================================================================
        node:=nil;
        dmBase.SMDOTask.IndexName:='PR_KEY';   //POST_ID;NOMER
        dmBase.SMDOTask.SetRange([nPostID,1],[nPostID,100]);   // 1..100
        dmBase.SMDOTask.First;
        if not dmBase.SMDOTask.Eof then begin
          nodeList:=nodeBody.NodeNew('TaskList');
          nTask:=1;
          try
            while not dmBase.SMDOTask.Eof do begin
              nTaskID:=dmBase.SMDOTask.FieldByName('TASK_ID').AsInteger;
              nodeTask:=nodeList.NodeNew('Task');
              nodeTask.AttributeAdd('idnumber', nTaskID);
              if dmBase.SMDOTask.FieldByName('TASK_REG').AsBoolean then s:='1' else s:='0';
              nodeTask.AttributeAdd('task_reg', s);
              if dmBase.SMDOTask.FieldByName('TASK_COPY').AsBoolean then s:='1' else s:='0';
              nodeTask.AttributeAdd('task_copy', s);
              nodeTask.AttributeAdd('task_text', CheckStrW(dmBase.SMDOTask.FieldByName('TEXT').AsString));
              if dmBase.SMDOTask.FieldByName('KIND').AsString<>''
                then nodeTask.AttributeAdd('kind', CheckStrW(dmBase.SMDOTask.FieldByName('KIND').AsString));
              nodeTask.AttributeAdd('deadline', CheckStrW(DateToString(dmBase.SMDOTask.FieldByName('DEADLINE').AsDateTime,false,false)));

              node:=nodeTask.NodeNew('TaskNumber');
              node.AttributeAdd('TaskDate', CheckStrW(DateToString(dmBase.SMDOTask.FieldByName('TASKDATE').AsDateTime,false,false)));
              node.ValueAsInteger:=nTask;

              node:=nodeTask.NodeNew('Confident');
              node.AttributeAdd('flag', dmBase.SMDOTask.FieldByName('FLAG').AsInteger);
              AddIsNotEmpty(node, 'numcopy', dmBase.SMDOTask.FieldByName('NUMCOPY') );
              node.ValueAsString:=CheckStrW(dmBase.SMDOTask.FieldByName('CONFIDENT').AsString);

              //---- Referred ----------------------------------------------
              if not RefToXML(nodeTask,nTaskID) then begin
                if FAddDefaultReferred and not MsgIsAddDoc(nMsgType) then begin
                  node:=nodeTask.NodeNew('Referred');
                  node.AttributeAdd('idnumber', nPostID);
                  node.AttributeAdd('retype', 1);
                  node1:=node.NodeNew('RegNumber');
                  node1.AttributeAdd('regdate', CheckStrW(DateToString(dMyRegNumber,false,false)));
                  node1.ValueAsString:=CheckStrW(sMyRegNumber);
                end;
              end;
              //------------------------------------------------------------

              //======= ФАЙЛЫ ЗАДАНИЯ ===========================================================================
              dmBase.SMDOFile.IndexName:='POST_KEY';   //POST_ID;PARENT_ID
              dmBase.SMDOFile.SetRange([nPostID,nTaskID],[nPostID,nTaskID]);
              try
                while not dmBase.SMDOFile.Eof do begin
                  node:=nodeTask.NodeNew('DocTransfer');
                  if not AttachFileToXML(node, nPostID, nFile)
                    then Result:=false;
                  dmBase.SMDOFile.Next;
                end;
              finally
                dmBase.SMDOFile.CancelRange;
              end;
              //======= ЛЮДИ ЗАДАНИЯ =============================================
              sl.Clear;
              sl.Add('AuthorOrganization='+IntToStr(MEN_AUTHOR));
              sl.Add('Executor='+IntToStr(MEN_EXECUTOR));
              sl.Add('Executor='+IntToStr(MEN_EXECUTOR_S));
              dmBase.SMDOMens.IndexName:='POST_KEY';
              for i:=0 to sl.Count-1 do begin
                sNode:=sl.Names[i];
                nKey:=StrToInt(sl.ValueFromIndex[i]);
                dmBase.SMDOMens.SetRange([nPostID,nTaskID,nKey],[nPostID,nTaskID,nKey]);
                try
                  while not dmBase.SMDOMens.Eof do begin
                    node:=nodeTask.NodeNew(sNode);
                    if not MenToXML(node, nKey)
                      then Result:=false;
                    dmBase.SMDOMens.Next;
                  end;
                finally
                  dmBase.SMDOMens.CancelRange;
                end;
              end;
              //================================

              Inc(nTask,1);
              dmBase.SMDOTask.Next;
            end;
          finally
            dmBase.SMDOTask.CancelRange;
          end;
        end;
        //===== END TASK (ЗАДАНИЯ) =================================================================
        //======
        //===== FOLDER (ПАПКИ) AddDocuments ====================================================================
        dmBase.SMDOTask.IndexName:='PR_KEY';   //POST_ID;NOMER
        dmBase.SMDOTask.SetRange([nPostID,1000],[nPostID,1100]);   // 1000..1100
        dmBase.SMDOTask.First;
        node:=nil;
        if not dmBase.SMDOTask.Eof then begin
          nodeList:=nodeBody.NodeNew('AddDocuments');
          nTask:=1;
          try
            while not dmBase.SMDOTask.Eof do begin
              nTaskID:=dmBase.SMDOTask.FieldByName('TASK_ID').AsInteger;
              nodeFolder:=nodeList.NodeNew('Folder');
              AddIsNotEmpty(nodeFolder, 'contents', dmBase.SMDOTask.FieldByName('CONTENTS') );
              AddIsNotEmpty(nodeFolder, 'add_type', dmBase.SMDOTask.FieldByName('ADD_TYPE') );

              //---- DocTransfer -----------------------------------------------------------
              //== ФАЙЛЫ папки ===========================================================================
              dmBase.SMDOFile.IndexName:='POST_KEY';   //POST_ID;PARENT_ID
              dmBase.SMDOFile.SetRange([nPostID,nTaskID],[nPostID,nTaskID]);
              try
                while not dmBase.SMDOFile.Eof do begin
                  node:=nodeFolder.NodeNew('DocTransfer');
                  if not AttachFileToXML(node, nPostID, nFile)
                    then Result:=false;
                  dmBase.SMDOFile.Next;
                end;
              finally
                dmBase.SMDOFile.CancelRange;
              end;

              //---- Note -----------------------------------------------------
              s:=Trim(dmBase.SMDOTask.FieldByName('text').AsString);
              StrToStrings(s,sl,chr(13)+chr(10),true);
              for i:=0 to sl.Count-1 do begin
                node1:=nodeFolder.NodeNew('Note');
                node1.ValueAsString:=CheckStrW(sl.Strings[i]);
              end;

              //---- Referred ----------------------------------------------
              if not RefToXML(nodeFolder,nTaskID) then begin
                if FAddDefaultReferred and not MsgIsAddDoc(nMsgType) then begin
                  node:=nodeFolder.NodeNew('Referred');
                  node.AttributeAdd('idnumber', nPostID);
                  node.AttributeAdd('retype', 1);
                  node1:=node.NodeNew('RegNumber');
                  node1.AttributeAdd('regdate', CheckStrW(DateToString(dMyRegNumber,false,false)));
                  node1.ValueAsString:=CheckStrW(sMyRegNumber);
                end;
              end;
              //------------------------------------------------------------

              Inc(nTask,1);
              dmBase.SMDOTask.Next;
            end;
          finally
            dmBase.SMDOTask.CancelRange;
          end;
        end;
        //=====END TASK (ЗАДАНИЯ) =================================================================
      end;
      XML.SaveToFile(FTmpPath+sFileXML);
      try
        // сохраним отправляемый XML с специальную папаку
        CopyFile(PChar(FTmpPath+sFileXML), PChar(GetPathXML('')+sFileXML), false);
      except
      end;
      FFilesMail.Add(FTmpPath+sFileXML);
    end;
    if sBM<>'' then Bookmark:=sBM;
  end;
  sl.Free;
  except
    on E:Exception do begin
      WriteTextLog('Ошибка формирования письма >>> '+E.Message);
      Result:=false;
    end;
  end;
//  i := Q_StrSpn(s,'1234567890',1);     // i - номер позиции не цифры  для разбота поля TEXT   "0 Уведомление доставлено"
end;
//-----------------------------------------------------------------------
function TSMDO.SeekUID(UID:String; lDel:Boolean):Boolean;
var
  old:String;
begin
  Result:=false;
  old:=dmBase.tbSimpleProp.IndexFieldNames;
  dmBase.tbSimpleProp.IndexFieldNames:='TYPEOBJ;POKAZ;VALUE';
  if dmBase.tbSimpleProp.FindKey([_TypeObj_UID,'UID',UID]) then begin
    Result:=true;
    if lDel then begin
      dmBase.tbSimpleProp.Delete;
    end;
  end;
  dmBase.tbSimpleProp.IndexFieldNames:=old;
end;
//-------------------------------------------------
function TSMDO.AddUID(UID:String):Boolean;
var
  nID:Integer;
  d:TDateTime;
  old:String;
begin
  Result:=true;
  with dmBase.tbSimpleProp do begin
    old:=IndexFieldNames;
    IndexFieldNames:='TYPEOBJ;ID;DATES;POKAZ';
    SetRange([_TypeObj_UID],[_TypeObj_UID]);
    try
      Last;
      nID:=FieldByName('ID').AsInteger+1;
    finally
      CancelRange;
    end;
    d:=dmBase.getCurDate;
    IndexFieldNames:='TYPEOBJ;POKAZ;VALUE';
    try
      if not FindKey([_TypeObj_UID,'UID',UID]) then begin
        Result:=true;
        Append;
        FieldByName('TYPEOBJ').AsInteger:=_TypeObj_UID;
        FieldByName('ID').AsInteger:=nID;
        FieldByName('POKAZ').AsString:='UID';
        FieldByName('DATES').AsDateTime:=d;
        FieldByName('VALUE').AsString:=UID;
        Post;
      end;
    except
      on E:Exception do begin
        Cancel;
        WriteTextLog('Ошибка записи в базу прочитанных сообщений UID='+UID+' ID='+IntToStr(nID)+'; '+E.Message);
        Result:=false;
      end;
    end;
    IndexFieldNames:=old;
  end;
end;
//-----------------------------------------------------------------------
procedure TSMDO.EditParams;
var
 f:TfmParamsSMDO;
 ini:TSasaIniFile;
 sErr,strFile:String;
 i:Integer;
 arr:TArrStrings;
begin
 f:=TfmParamsSMDO.Create(nil);
 f.edMarsh.Text:=FRouter;
 f.edSMTP.Text:=FSmtpServer;
 f.edSMTP_Port.Value:=FSmtpPort;
 f.edPOP.Text:=FPOPServer;
 f.edPOP_Port.Value:=FPOPPort;
 f.edUser.Text:=FUserName;
 f.edPassword.Text:=FPassword;
// f.cbAuto.Checked:=FAutho;
// f.cbDeletePost.Checked:=FDeletingPost;
 f.edAutoCheck.Value:=FAutoCheck;
 f.SetSizeChecked(FCheckSizeMail);
 f.edEmail.Text:=FMyEmail;
 f.edSmdoKod.Text:=FMyCode;
 f.edSmdoName.Text:=FMyName;
 f.edSEDid.Text:=FMySystem;
 f.edSEDName.Text:=FMySystemName;
 f.cbStartSMDO.Checked:=FCheckStart;
 f.cbAddTask.Checked:=FAddTask;

 f.cbCheckCert.Itemindex:=FCheckCert;
 if not Role.SystemAdmin then begin
   f.cbCheckCert.Visible:=false;
   f.lbCheckCert.Visible:=false;
 end;

 f.cbCOC.ItemIndex:=FRefreshCOC;

 f.cbManual.Checked:=FManual;
 f.edCOC.Lines.Text:=FUrlCOC;
 f.cbEnabled.Checked:=FEnabled;
 f.cbGMT.Checked:=FTimeAsGMT;
 f.cbCheckTCP.Checked:=FBeforeCheckTCP;
 f.edPKNCI.Text:=FPKNCI;
 f.edAdresPKNCI.Text:=FAdresPKNCI;

 if FVersionXML_OUT=100
   then f.cbVersion.ItemIndex:=-1
   else f.cbVersion.ItemIndex:=0;

 f.setEnabledVvod(FEnabled);
 f.setCheckVvod(FCheckEngKey);
 if f.ShowModal = mrOk then begin
   FRouter:=f.edMarsh.Text;
   FSmtpServer:=f.edSMTP.Text;
   FSmtpPort:=f.edSMTP_Port.Value;
   FPOPServer:=f.edPOP.Text;
   FPOPPort:=f.edPOP_Port.Value;
   FUserName:=f.edUser.Text;
   FPassword:=f.edPassword.Text;
//   FAutho:=f.cbAuto.Checked;
//   FDeletingPost:=f.cbDeletePost.Checked;
   try
     FAutoCheck:=f.edAutoCheck.Value;
   except
     FAutoCheck:=0;
   end;
   if FAutoCheck<0  then FAutoCheck:=0;
   if (FAutoCheck>0) and (FAutoCheck<10) then FAutoCheck:=10;
   FMyEmail:=f.edEmail.Text;
   FMyCode:=f.edSmdoKod.Text;
   FMyName:=f.edSmdoName.Text;
   FMySystem:=f.edSEDid.Text;
   FMySystemName:=f.edSEDName.Text;
   FCheckStart:=f.cbStartSMDO.Checked;
   FAddTask:=f.cbAddTask.Checked;

   FRefreshCOC:=f.cbCOC.ItemIndex;

   FManual:=f.cbManual.Checked;
   FUrlCOC:=f.edCOC.Lines.Text;
   Enabled:=f.cbEnabled.Checked;
   FPKNCI:=f.edPKNCI.Text;
   FAdresPKNCI:=f.edAdresPKNCI.Text;
   FCheckSizeMail:=f.GetSizeChecked;

   FTimeAsGMT:=f.cbGMT.Checked;
   FBeforeCheckTCP:=f.cbCheckTCP.Checked;
   FCheckCert:=f.cbCheckCert.ItemIndex;
   if f.cbVersion.ItemIndex<0
     then FVersionXML_OUT:=100
     else FVersionXML_OUT:=211;

   strFile:=FPathINI+'smdo.ini';
   Ini:=TSasaIniFile.Create( strFile );
//   Ini.WriteBool('POST', 'AUTHORIZATION', FAutho);
   Ini.WriteBool('ADMIN', 'ENABLED', FEnabled);
   Ini.WriteString('ADMIN', 'PK_NCI', FPKNCI);
   Ini.WriteString('ADMIN', 'ADRES_PK_NCI', FAdresPKNCI);
   Ini.WriteInteger('ADMIN', 'SMDO_PARSER', FVersionXML_OUT);
   Ini.WriteBool('ADMIN', 'CHECK_TCP', FBeforeCheckTCP);
   Ini.WriteInteger('ADMIN', 'CHECK_CERT', FCheckCert);

   //   Ini.WriteBool('POST', 'DELETING', FDeletingPost);
   Ini.WriteInteger('POST', 'AUTOCHECK', FAutoCheck);
   Ini.WriteInteger('POST', 'CHECK_SIZE_MAIL', FCheckSizeMail);

   Ini.WriteString('POST', 'ROUTER', FRouter);
   Ini.WriteString('POST', 'SMTP_SERVER', FSmtpServer);
   Ini.WriteInteger('POST', 'SMTP_PORT', FSmtpPort);
   Ini.WriteString('POST', 'POP_SERVER', FPopServer);
   Ini.WriteInteger('POST', 'POP_PORT', FPopPort);
   Ini.WriteString('POST', 'USERNAME', FUserName);
   Ini.WriteString('POST', 'PASSWORD', XorEncode(PPP_CONST,FPassword));
   Ini.WriteBool('POST', 'CHECK_START', FCheckStart);
   Ini.WriteBool('POST', 'AUTO_REFERRED', FAutoWriteReferred);

//   Ini.WriteBool('POST', 'CHECK_COC_RECEIVE', FRefreshCOCReceive);
   Ini.WriteInteger('POST', 'CHECK_COC', FRefreshCOC);

   Ini.WriteBool('POST', 'ADDTASK', FAddTask);
   Ini.WriteBool('POST', 'MANUAL', FManual);
   Ini.WriteBool('POST', 'TIME_AS_GMT', FTimeAsGMT);

   Ini.WriteString('POST', 'EMAIL', FMyEmail);
   Ini.WriteString('POST', 'SMDOCODE', FMyCode);
   Ini.WriteString('POST', 'SMDONAME', FMyName);
   Ini.WriteString('POST', 'SEDID', FMySystem);
   Ini.WriteString('POST', 'SEDNAME', FMySystemName);

   Ini.EraseSection('URL_CRL');
   StrToArr(FUrlCOC,arr, #13#10,true);
   for i:=low(arr) to high(arr) do begin
     Ini.WriteString('URL_CRL', 'URL'+IntToStr(i+1), Trim(arr[i]));
   end;

   Ini.UpdateFile;
   Ini.Free;
   if FPassword<>'' then FCurPassword:=FPassword;
   if FEnabled and FLocalEnabled and not Avest.ISACTIVE then begin
     Avest.LoadDLL(FPathAvest, sErr);
     FActiveAvest:=Avest.IsActive;
     for i:=0 to Avest.slLogLoad.Count-1 do WriteTextLog(Avest.slLogLoad[i]);
   end;
   if sErr<>''
     then PutError('Ошибка загрузки библиотеки ЭЦП Avest:'#13#10+sErr);
 end;
 f.Free;
end;
//-------------------------------------------------
function TSMDO.GetPathEML: String;        // !!!  переписать
var
 sErr:String;
begin
  Result:=GetDocArxivFolder(sErr,0)+'EML\'; //  CheckSleshN(ExtractFilePath(Application.ExeName))+'\EML\';
  ForceDirectories(Result);
end;
//-------------------------------------------------
function TSMDO.GetPathXML(sAdd:String): String;
var
 sErr:String;
begin
  Result:=GetDocArxivFolder(sErr,0)+'XML\'+sAdd; //  CheckSleshN(ExtractFilePath(Application.ExeName))+'\EML\';
  ForceDirectories(Result);
end;
//-------------------------------------------------
function TSMDO.GetPathAttach(nType:Integer; nPostID:Integer): String;
var
 sErr:String;
begin
  Result:=GetDocArxivFolder(sErr,nType)+'SMDO\'+IntToStr(nPostID)+'\';
  if nType=0 then  // реальный путь
    ForceDirectories(Result);
end;

//--------------------------------------------------------------
function TSMDO.XMLToValue(sValue:String; ft:TFieldType; vDefault:Variant): Variant;
begin
  Result:=null;
  if Trim(sValue)='' then begin
    if vDefault<>null then Result:=vDefault;
  end else begin
    case ft of
      ftString,ftMemo : Result:=Utf8ToAnsi(sValue);
      ftBoolean  : if (sValue='1') or (UpperCase(sValue)='TRUE') then Result:=true else Result:=false;
      ftDate     : begin
                     try
                       Result:=DateTimeFromString(sValue, false); //StrToDate(sValue);
//                       Result:=sdDateTimeFromString(sValue, false); //StrToDate(sValue);
                     except
                       Result:=null;
                     end;
                   end;
      ftTime     : Result:=STOT(sValue);
      ftTimeStamp: begin
                     try
//                       if RightStr(sValue,1)='Z'
//                         then Result:=sdDateTimeFromString(sValue, false)
//                       Result:=sdDateTimeFromString(sValue, true);
                       Result:=DateTimeFromString(sValue, true); ;
                     except
                       Result:=null;
                     end;
                   end;
      ftFloat,ftCurrency
                 :  begin
                      Result:=StrToFloatMy(sValue);
                    end;
      ftLargeint : Result:=StrToInt(sValue);
      ftAutoInc,ftInteger,ftSmallint,ftWord,ftBytes
                 : begin
                     Result:=StrToInt(sValue);
                   end;
      ftBCD,ftFMTBCD : begin
                         Result:=StrToFloatMy(sValue);
                       end;
    else
//      Protokol.Add('Неизвестный тип для значения '+svalue);
    end;
  end;
  if Result=null then Result:=vDefault;
end;
//---------------------------------------------
// код SMDO моей организации
function TSMDO.getKodSMDO:String;
begin
  Result:=FMyCode; //'Org1466'
end;
//---------------------------------------------
function TSMDO.getKodSMDO_MD5:String;
begin
  Result:=getKodSMDO;
  Result:=CalcMD5String(Result);
//  Result:=MD5Print(MD5String(ANSIUppercase(Result+'myfirstlove'+Result)));
end;
//---------------------------------------------
// код EMAIL в SMDO моей организации
function TSMDO.getEmail:String;
begin
  Result:=FMyEmail;
end;
{
    FMyEmail:String;         // EMAIL в СМДО
    FMyCode:String;          // smdocode в СМДО
    FMySystem:String;        // ID моего СЭД
    FMySystemName:String;    // название моего СЭД
}
//---------------------------------------------
// название SMDO моей организации
function TSMDO.getRekvMyOrg(sRekv:String; sl:TStringList):String;
var
  slRekv:TStringList;
  i:Integer;
begin
  Result:='';
  if sl<>nil then sl.Clear;
  if (sRekv='NAME') and (Trim(FMyName)<>'') then begin
    Result:=FMyName;
    if sl<>nil then sl.Add('NAME='+Result);
    exit;
  end else if sRekv='PKNCI' then begin

  end;
  if Pos(';', sRekv)=0 then begin
    if dmBase.SMDOSprOrg.Locate('smdocode', getKodSMDO, []) then begin
      Result:=dmBase.SMDOSprOrg.FieldByName(sRekv).AsString;
      if sl<>nil then sl.Add(sRekv+'='+Result);
    end;
  end else begin
    slRekv:=TStringList.Create;
    StrToStrings(sRekv,slRekv,';',true);
    if dmBase.SMDOSprOrg.Locate('smdocode', getKodSMDO, []) then begin
      Result:=dmBase.SMDOSprOrg.FieldByName(slRekv.Strings[0]).AsString;
      for i:=0 to slRekv.Count-1 do begin
        sl.Add(ANSIUpperCase(slRekv.Strings[i])+'='+dmBase.SMDOSprOrg.FieldByName(slRekv.Strings[i]).AsString);
      end;
    end;
  end;
end;
//---------------------------------------------
function TSMDO.IsMyOrg(sOrg:String):Boolean;
begin
  Result:=MySameText(sOrg,getKodSMDO);
end;
//---------------------------------------------
// ID моей системы
function TSMDO.GetSystemID:String;
var
  s:String;
begin
  s:=FMySystem; //'b3e3e697-d931-4a76-9edd-dafeda0c5526';
  CharDel(s,' ');
  CharDel(s,'-');
  if s=''                           
    then Result:=''
    else Result:=Trim(FMySystem); //'b3e3e697-d931-4a76-9edd-dafeda0c5526';
end;
//---------------------------------------------
// название моей системы
function TSMDO.getSystemName:String;
begin
  Result:=FMySystemName; //'Делопроизводство ЦИТ Нацстата';
end;
//---------------------------------------------
// GUID для доступа к WebServive справочников
function TSMDO.getPkNCI:String;
var
  s:String;
begin
  s:=FPKNCI; //
  CharDel(s,' ');
  CharDel(s,'-');
  if s=''
    then Result:=''
    else Result:=Trim(FPKNCI); //
end;
//---------------------------------------------
// URL для доступа к WebServive справочников
function TSMDO.getAdresPkNCI:String;
begin
  Result:=Trim(FAdresPKNCI); //
end;
//-----------------------------------------
function GetTimeZoneBias: Integer;
// uses windows unit, func GetTimeZoneInformation
var
  TimeZoneInfo: TTimeZoneInformation;
begin
  case GetTimeZoneInformation(TimeZoneInfo) of
    TIME_ZONE_ID_UNKNOWN: Result := TimeZoneInfo.Bias;
    TIME_ZONE_ID_STANDARD: Result := TimeZoneInfo.Bias + TimeZoneInfo.StandardBias;
    TIME_ZONE_ID_DAYLIGHT: Result := TimeZoneInfo.Bias + TimeZoneInfo.DaylightBias;
  else
    Result := 0;
  end;
end;
//--------------------------------------------------------------------------------------------
function TSMDO.DateTimeFromString(const ADate: UTF8String; UseLocalBias: Boolean): TDateTime;
// Convert the string ADate to a TDateTime according to the W3C date/time specification
// as found here: http://www.w3.org/TR/NOTE-datetime
// contributor: Stefan Glienke
var
  AYear, AMonth, ADay, AHour, AMin, ASec, AMSec: word;
  n,nn,ALocalBias, ABias: Integer;
  s,ss:String;
  lTime:Boolean;
begin
// 2016-01-01T06:08:45Z         время по гринвичу
// 2016-01-01T09:08:45+03:00    местное время
  AYear  := StrToInt(string(copy(ADate, 1, 4)));
  AMonth := StrToInt(string(copy(ADate, 6, 2)));
  ADay   := StrToInt(string(copy(ADate, 9, 2)));
  lTime:=false;
  if Length(ADate) > 16 then   // если есть время
  begin
    lTime:=true;
    AHour := StrToInt(string(copy(ADate, 12, 2)));
    AMin  := StrToInt(string(copy(ADate, 15, 2)));
    ASec  := StrToIntDef(string(copy(ADate, 18, 2)), 0); // They might be omitted, so default to 0
//    AMSec := StrToIntDef(string(copy(ADate, 21, 3)), 0); // They might be omitted, so default to 0
    AMSec := 0;
  end else
  begin
    AHour := 0;
    AMin  := 0;
    ASec  := 0;
    AMSec := 0;
  end;
  Result :=
    EncodeDate(AYear, AMonth, ADay) +
    EncodeTime(AHour, AMin, ASec, AMSec);

  ALocalBias := GetTimeZoneBias;

  if UseLocalBias and lTime then begin
    s:=Copy(string(ADate),12,20);  // все что за буквой 'T'
    n:=Pos('+',s);
    ss:='+';
    if n=0 then begin
      n:=Pos('-',s);
      ss:='-';
    end;
    if (n>0) then begin
      try           //      03                          :     00
        ABias := StrToInt(Copy(s,n+1, 2)) * MinsPerHour + StrToInt(Copy(s, n+4, 2));
        if ss = '+' then
          ABias := ABias * -1;
        Result := Result + ABias / MinsPerDay;
      except
        PutError('Некорректная дата:'+string(ADate));
      end;
    end;
    Result := Result - ALocalBias / MinsPerDay;
  end;
end;

//-----------------------------------------
function TSMDO.DateTimeToStringXML(ADate: TDateTime; UseLocalBias: Boolean): UTF8String;
// Convert the TDateTime ADate to a string according to the W3C date/time specification
// as found here: http://www.w3.org/TR/NOTE-datetime
// contributor: Stefan Glienke
var
  AYear, AMonth, ADay, AHour, AMin, ASec, AMSec: word;
  ABias: Integer;
const
  Neg: array[Boolean] of string = ('+', '-');
begin
  ABias := GetTimeZoneBias;    
  if not UseLocalBias and (ABias <> 0) then begin  // писать время по гринвичу
    ADate:=ADate + ABias/MinsPerDay;
  end;
  DecodeDate(ADate, AYear, AMonth, ADay);
  DecodeTime(ADate, AHour, AMin, ASec, AMSec);
  if frac(ADate) = 0 then
    Result := UTF8String(Format('%.4d-%.2d-%.2d', [AYear, AMonth, ADay]))
  else begin
    ABias := GetTimeZoneBias;
    if UseLocalBias and (ABias <> 0) then
//      Result := UTF8String(Format('%.4d-%.2d-%.2dT%.2d:%.2d:%.2d.%.3d%s%.2d:%.2d',
      Result := UTF8String(Format('%.4d-%.2d-%.2dT%.2d:%.2d:%.2d%s%.2d:%.2d',
//        [AYear, AMonth, ADay, AHour, AMin, ASec, AMSec,
        [AYear, AMonth, ADay, AHour, AMin, ASec,
        Neg[ABias > 0], Abs(ABias) div MinsPerHour, Abs(ABias) mod MinsPerHour]))
    else
      Result := UTF8String(Format('%.4d-%.2d-%.2dT%.2d:%.2d:%.2dZ',
        [AYear, AMonth, ADay, AHour, AMin, ASec]));
  end;
end;

//---------------------------------------------
function TSMDO.DateToString(d: TDateTime; lFull: Boolean; lAsText:Boolean): String;
begin
  if lAsText then begin
    Result:=Formatdatetime('dd.mm.yyyy',d);
    if lFull
      then Result:=Result+' '+FormatDateTime('hh:nn',d);
  end else begin
    if lFull then begin
      try
        Result:=DateTimeToStringXML(d, not FTimeAsGMT);
      except
        Result:=Formatdatetime('yyyy-mm-dd',d)+'T'+FormatDateTime('hh:nn:ss',d)+'+03:00';
      end;
    end else begin
      Result:=Formatdatetime('yyyy-mm-dd',d);
    end;
//      then Result:=Result+'T'+FormatDateTime('hh:nn:ss',d)+'Z';
  end;
end;
//---------------------------------------------
procedure TSMDO.SetAbout(const Value: String);
begin
  FAbout := Value;
end;
//---------------------------------------------
function TSMDO.RegDocInSED(nDocID:Integer; nPostID:Integer; sRegNumber:String; dRegDate:TDateTime):Boolean;
var
  sBM:String;
  slPar:TStringList;
  lOk:Boolean;
  nAckID:Integer;
begin
  Result:=true;
  sBM:='';
  with dmBase.SMDOPost do begin
    if FieldByName('ID').AsInteger<>nPostID then begin
      sBM:=Bookmark;
      if not Locate('ID', nPostID, []) then Result:=false;
    end;
    if Result then begin
      try
        Edit;
        FieldByName('DOC_ID').AsInteger:=nDocID;
        FieldByName('MY_REGNUMBER').AsString:=sRegNumber;
        FieldByName('MY_REGDATE').AsDateTime:=dRegDate;
//        FieldByName('DOC_STATUS').AsInteger:=DOC_REGISTER;
        Post;
      except
        Cancel;
        Result:=false;
      end;
    end;
    if sBM<>'' then Bookmark:=sBM;
  end;
  if Result then begin
    nAckID:=CreateAckResult(DOC_REGISTER, nPostID, false);
    if nAckID>0 then begin  // будут проблемы если не будет создано уведомление
      slPar:=TStringList.Create;
      slPar.Add('SHOWERROR=0');
      slPar.Add('TYPERUN=2');
      slPar.Add('POST_ID='+inttostr(nAckID));
      slPar.Add('SOOB=Отправка уведомления о регистрации ... ');
      lOk:=SendMail(nil,slPar);
      FreeAndNil(slPar);
      if not lOk then SMDO.ShowError;
    end else begin
      Result:=false;
    end;
  end;
end;
//-------------------------------------------------------------------
function TSMDO.MaxCount: Integer;
begin
  Result:=10;
end;

procedure TSMDO.SetDemo(const Value: Boolean);
begin
  FDemo := Value;
end;

function TSMDO.ReadKey: String;
var
  ini : TSasaIniFile;
begin
  Ini:=TSasaIniFile.Create(FPathINI+'smdo.ini');
  Result:=Ini.ReadString('ADMIN','KEY','');
  Ini.Free;
end;

procedure TSMDO.WriteKey(sKey: String);
var
  ini : TSasaIniFile;
begin
  Ini:=TSasaIniFile.Create(FPathINI+'smdo.ini');
  Ini.WriteString('ADMIN','KEY',sKey);
  Ini.UpdateFile;
  Ini.Free;
end;
//--------------------------------------------------------------------------------------------------
procedure TSMDO.IdWorkBegin(Sender: TObject; AWorkMode: TWorkMode;  const AWorkCountMax: Integer);
begin
  InitProgress(FMsgSize,FMsgText);
end;

procedure TSMDO.IdWork(Sender: TObject; AWorkMode: TWorkMode;  const AWorkCount: Integer);
begin
  if (AWorkMode = wmWrite) or (AWorkMode = wmRead)
    then ChangeProgress(AWorkCount,'');
end;

procedure TSMDO.IdWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  if (AWorkMode = wmWrite) or (AWorkMode = wmRead)
    then ChangeProgress(FMsgSize,'');
end;
//--------------------------------------------------------------------------------------------------
procedure TSMDO.IdWorkBegin_MainForm(Sender: TObject; AWorkMode: TWorkMode;  const AWorkCountMax: Integer);
begin
  EnterMainThread;
  try
    fmMain.pb.Position:=0;
    fmMain.pb.Max:=FMsgSize;
    Application.ProcessMessages;
  finally
    LeaveMainThread;       
  end;
end;

procedure TSMDO.IdWork_MainForm(Sender: TObject; AWorkMode: TWorkMode;  const AWorkCount: Integer);
begin
  EnterMainThread;
  try
    if (AWorkMode = wmWrite) or (AWorkMode = wmRead) then begin
      fmMain.pb.Position:=AWorkCount;
      Application.ProcessMessages;
    end;
  finally
    LeaveMainThread;
  end;
end;

procedure TSMDO.IdWorkEnd_MainForm(Sender: TObject; AWorkMode: TWorkMode);
begin
  EnterMainThread;
  try
    if (AWorkMode = wmWrite) or (AWorkMode = wmRead) then begin
      fmMain.pb.Position:=FMsgSize;
      Application.ProcessMessages;
    end;
  finally
    LeaveMainThread;
  end;
end;

//--------------------------------------------------------------------------
// из какой подсистемы пришло уведомление
//--------------------------------------------------------------------------
function TSMDO.getSubjSystem(sOrg: String): Integer;
begin
  if MySameText(sOrg,org_marsh) then begin             // МАРШАЛИНГ
    Result:=1;
  end else if MySameText(sOrg,org_pkinci) then begin   // ПК НСИ
    Result:=2;
  end else begin                                       // организация
    Result:=0;
  end;
end;
//-----------------------------------------------------------------------------
// вернуть GUID или символьный код справочника
function TSMDO.NameTypeSpr(nTypeSpr: Integer; sTypeRet:String): String;
begin
  Result:='';
  if sTypeRet='GUID' then begin
    case nTypeSpr of
      SMDO_SPR_ORG    : Result:=id_dict_org;
      SMDO_SPR_VIDDOK : Result:=id_dict_viddok;
    end;
  end else begin
    case nTypeSpr of
      SMDO_SPR_ORG    : Result:='org';
      SMDO_SPR_VIDDOK : Result:='viddok';
    end;
  end;
end;
//---------------------------------------------------------
function TSMDO.NameMsgType(nMsgType:Integer; nType:Integer):String;
begin
  if nType=1 then begin  // в родительном падеже
    case nMsgType of
      MSG_TYPE_A  : Result:='уведомления';
      MSG_TYPE_D  : Result:='основного документа';
      MSG_TYPE_DA : Result:='дополнения к основному документу';
      MSG_TYPE_O  : Result:='документа-ответа';
      MSG_TYPE_OA : Result:='дополнения к документу-ответа';
    end;
  end else begin
    case nMsgType of
      MSG_TYPE_A  : Result:='уведомление';
      MSG_TYPE_D  : Result:='основной документ';
      MSG_TYPE_DA : Result:='дополнение к основному документу';
      MSG_TYPE_O  : Result:='документ-ответ';
      MSG_TYPE_OA : Result:='дополнение к документу-ответу';
    end;
  end;
end;
//-----------------------------------------------------
function TSMDO.MsgIsDoc(nMsgType:Integer):Boolean;
begin
  if nMsgType=MSG_TYPE_A
    then Result:=false
    else Result:=true;
end;
// доп. к осн. документу  или  доп. к документу ответа
function TSMDO.MsgIsAddDoc(nMsgType:Integer):Boolean;
begin
  if (nMsgType=MSG_TYPE_DA) or (nMsgType=MSG_TYPE_OA)
    then Result:=true
    else Result:=false;
end;
//-----------------------------------------------------
function TSMDO.MsgIsAck(nMsgType:Integer):Boolean;
begin
  if nMsgType=MSG_TYPE_A
    then Result:=true
    else Result:=false;
end;
//-----------------------------------------------------
procedure TSMDO.SetVersionXML_IN(const Value: Integer);
begin
  FVersionXML_IN := Value;
end;
//-----------------------------------------------------
procedure TSMDO.SetVersionXML_OUT(const Value: Integer);
begin
  FVersionXML_OUT := Value;
end;
//--------------------------------------------------------------
function TSMDO.LoadEML(sFile:String):Boolean;
var
  Msg,Msg2:TidMessage;
  lOk:Boolean;
  att:TIdAttachment;
  nCount,i,j,n,m :Integer;
  s,sGUID,sss:String;
  sl,sl1:TStringList;
  SearchRec:TSearchRec;
begin
  FCountAddFolder:=0;  // кол-во доп. материалов для других сообщений
  FWriteAddFolder:=0;  // кол-во доп. материалов успешно записанных
  FLastError:='';
  FLocalLog.Clear;
  Result:=false;
  Msg:=TidMessage.Create(nil);
  Msg2:=TidMessage.Create(nil);
  Msg.LoadFromFile(sFile);
  FTmpPath:=CheckSleshN(CreateTmpPath(0));
  sGUID:='';
  XML.Clear;
  FNameFileXML:='';
  sl1:=TStringList.Create;
  FCheckMyOrg:=false;
  ClearDir(FTmpPath,false);
  s:=DecodeMIME(Msg.Subject);
  ShowMessage(Msg.From.Text +'  '+s);
  ShowStrings( Msg.Body, '' );

  ClearTmpValues;

  //---- сохраним вложения -----------------
  for j:=0 to Msg.MessageParts.Count-1 do begin
 //  if IdMessage1.MessageParts.Items[i] is TIdTExt then
    if Msg.MessageParts.Items[j] is TIdAttachment then begin   // прикрепленный файл
      att:=TIdAttachment(Msg.MessageParts.Items[j]);
      try
        sFile:=DecodeMIME(att.FileName);
        if Copy(sFile,1,2)<>'=?' then begin
          if FileExists(FTmpPath+sFile) then DeleteFile(FTmpPath+sFile);
          att.SaveToFile(FTmpPath+sFile);
          FFilesMail.Add(sFile);
        end;
      except
        on E:Exception do begin
          s:='ошибка сохранение вложения: '+FTmpPath+sFile+'  '+E.Message;
          AckResultAdd(ceXML,'','','');
          lOk:=false;
          Result:=false;
        end;
      end;
    end;
  end;
  sl1.Clear;
  lOk:=FindFirst(FTmpPath+'*.xml', faAnyFile, SearchRec) = 0;
  if lOk then begin
    repeat
      if (SearchRec.Name[1] <> '.') and (SearchRec.Attr and faVolumeID <> faVolumeID) and (SearchRec.Attr and faDirectory <> faDirectory) then begin
        if (Pos('_data',ANSILowerCase(SearchRec.Name))>0) or (Pos('_ack',ANSILowerCase(SearchRec.Name))>0) then
          sl1.Add(SearchRec.Name);
      end;
    until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
    if sl1.Count=0 then begin
      AckResultAdd(ceXML,'','','');
    end else begin
      for j:=0 to sl1.Count-1 do begin
        try
          XML.Clear;
          FNameFileXML:=sl1.Strings[j];
          XML.LoadFromFile(FTmpPath+FNameFileXML);
          m:=FFilesMail.IndexOf(FNameFileXML);
          if m>-1 then FFilesMail.Delete(m);      // удалим XML файл из списка файлов вложений
          if (XML.Root.ReadAttributeString('type')<>'') and (XML.Root.ReadAttributeString('msg_id')<>'') then begin // мой XML
            sGUID:=XMLtoVALUE(XML.Root.ReadAttributeString('msg_id'),ftString,'');
            break;
          end;
        except
          on E:Exception do begin
            AckResultAdd(ceXML,'','','');
          end;
        end;
      end;
    end;
    XMLtoSMDO(Msg.From.Address, sGUID);
    s:='';
    if SMDO.FCountAddFolder>0 then begin
      s:=s+' Дополнительных материалов : '+Inttostr(SMDO.FCountAddFolder);
      s:=s+#13#10'    записано        : '+Inttostr(SMDO.FWriteAddFolder);
    end;
    if SMDO.FAckResult.Count>0 then begin
      s:=s+#13#10+SMDO.AckResult2Text(#13#10,false);

    end;
    if s<>''
      then ShowMessage(s);
  end;
  sl1.Free;
  FreeAndNil(Msg);
  ClearDir(FTmpPath,false);
  FCheckMyOrg:=true;
  ClearTmpValues;
end;
//--------------------------------------------------------------
function TSMDO.LoadEML_syna(sFile:String):Boolean;
var
  Mess:TMimeMess;
  sl,sl1:TStringList;
  part:TMimePart;
  s,sGUID:String;
  lOk:Boolean;
  nCount,i,j,n,m :Integer;
  SearchRec:TSearchRec;
begin
  FCountAddFolder:=0;  // кол-во доп. материалов для других сообщений
  FWriteAddFolder:=0;  // кол-во доп. материалов успешно записанных
  FLastError:='';
  FLocalLog.Clear;
  Result:=false;
  FTmpPath:=CheckSleshN(CreateTmpPath(0));
  sGUID:='';
  XML.Clear;
  FNameFileXML:='';
  FCheckMyOrg:=false;
  ClearDir(FTmpPath,false);

  ClearTmpValues;

  sl1:=TStringList.Create;
  sl:=TStringList.Create;

  Mess:=TMimeMess.Create;//создали объект
  sl.LoadFromFile(sFile);
  Mess.Lines.Assign(sl);//записали всю полученную от сервера информацию
  Mess.DecodeMessage;//декодировали сообщение
  {
  memLog.Lines.Add('Charset: '+Mess.MessagePart.Charset); // Assign(sl);
  memLog.Lines.Add('Encoding: '+Mess.MessagePart.Encoding);
  memLog.Lines.Add('======================');
  memLog.Lines.Add('Headers: '+Mess.MessagePart.Headers.Text);
  memLog.Lines.Add('======================');
  mess.MessagePart.DecodePartHeader;
  memLog.Lines.Add('Headers: '+Mess.MessagePart.Headers.Text);
  memLog.Lines.Add('======================');
  memLog.Lines.Add('Primary:'+Mess.MessagePart.Primary);
  memLog.Lines.Add('Primary code:'+GetEnumName(TypeInfo(TMimePrimary),Integer(Mess.MessagePart.PrimaryCode)));
  memLog.Lines.Add('SubLevel:'+Inttostr(Mess.MessagePart.SubLevel));
  memLog.Lines.Add('Count Part:'+Inttostr(mess.MessagePart.GetSubPartCount));
  }
  for i:=0 to mess.MessagePart.GetSubPartCount-1 do begin
    part:=mess.MessagePart.GetSubPart(i);
    CheckPart(5, part, inttostr(i));
  end;
    //TMimePrimary = (MP_TEXT, MP_MULTIPART, MP_MESSAGE, MP_BINARY);
  Mess.DecodeMessage;//декодировали сообщение

  sl1.Clear;
  lOk:=FindFirst(FTmpPath+'*.xml', faAnyFile, SearchRec) = 0;
  if lOk then begin
    repeat
      if (SearchRec.Name[1] <> '.') and (SearchRec.Attr and faVolumeID <> faVolumeID) and (SearchRec.Attr and faDirectory <> faDirectory) then begin
        if (Pos('_data',ANSILowerCase(SearchRec.Name))>0) or (Pos('_ack',ANSILowerCase(SearchRec.Name))>0) then
          sl1.Add(SearchRec.Name);
      end;
    until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
    if sl1.Count=0 then begin
      AckResultAdd(ceXML,'','','');
    end else begin
      for j:=0 to sl1.Count-1 do begin
        try
          XML.Clear;
          FNameFileXML:=sl1.Strings[j];
          XML.LoadFromFile(FTmpPath+FNameFileXML);
          m:=FFilesMail.IndexOf(FNameFileXML);
          if m>-1 then FFilesMail.Delete(m);      // удалим XML файл из списка файлов вложений
          if (XML.Root.ReadAttributeString('type')<>'') and (XML.Root.ReadAttributeString('msg_id')<>'') then begin // мой XML
            sGUID:=XMLtoVALUE(XML.Root.ReadAttributeString('msg_id'),ftString,'');
            break;
          end;
        except
          on E:Exception do begin
            AckResultAdd(ceXML,'','','');
          end;
        end;
      end;
    end;
    XMLtoSMDO('test adres', sGUID);
    s:='';
    if SMDO.FCountAddFolder>0 then begin
      s:=s+' Дополнительных материалов : '+Inttostr(SMDO.FCountAddFolder);
      s:=s+#13#10'    записано        : '+Inttostr(SMDO.FWriteAddFolder);
    end;
    if SMDO.FAckResult.Count>0 then begin
      s:=s+#13#10+SMDO.AckResult2Text(#13#10,false);
    end;
    if s<>'' then ShowMessage(s);
  end;

  sl.Free;
  sl1.Free;
  Mess.Free;
//  ClearDir(FTmpPath,false);
  FCheckMyOrg:=true;
  ClearTmpValues;
end;
//-----------------------------------------------------------
procedure TSMDO.CheckPart(nSubLevel:Integer; part:TMimePart; sName:String);
var
  s,sBody,sPath:String;
  i:Integer;
begin
{
  s:=StringofChar(' ',nsublevel);
  memLog.Lines.Add(s+'Part ('+sName+') ----------------------------------------------------');
  memLog.Lines.Add(s+'Encoding: '+Part.Encoding);
  memLog.Lines.Add(s+'Encoding code:'+GetEnumName(TypeInfo(TMimeEncoding),Integer(part.EncodingCode)));
  memLog.Lines.Add(s+'Headers: '+Part.Headers.Text);
  memLog.Lines.Add(s+'SubLevel:'+Inttostr(Part.SubLevel));
  memLog.Lines.Add(s+'Count Part:'+Inttostr(Part.GetSubPartCount));
  memLog.Lines.Add(s+'Primary:'+part.Primary);
  memLog.Lines.Add(s+'Primary code:'+GetEnumName(TypeInfo(TMimePrimary),Integer(part.PrimaryCode)));
  memLog.Lines.Add('  Disposition:'+Part.Disposition);
  memLog.Lines.Add('  FileName:'+Part.FileName);  }
  sPath:=FTmpPath;
  ForceDirectories(sPath);
  if part.PrimaryCode=MP_TEXT then begin
//    memLog.Lines.Add('  Text:"'+ part.PartBody.text+'"');
  end else if part.PrimaryCode=MP_BINARY then begin
    sBody:=DecodeBase64(part.PartBody.Text);
    MemoWrite(sPath+'\'+Part.FileName, sBody);
  end else if part.PrimaryCode=MP_MULTIPART then begin
//    CheckPart(nSubLevel+10, decodebase64(part:TMimePart; sName:String);
    for i:=0 to part.GetSubPartCount-1 do begin
      CheckPart(nSubLevel+10, Part.GetSubPart(i), inttostr(i));
    end;
  end else if part.PrimaryCode=MP_MESSAGE then begin

  end;
end;
//------------------------------------------------------------------
function TSMDO.PathUpdateSpr: String;
begin
  Result:=Trim(GlobalTask.ParamAsString('SMDO_NSI_PATH'));
end;


//-----------------------------------------------------------------------------------
// записать материалы с ссылками на другие документы
function TSMDO.WriteReferredToOsnDoc(nPostID:Integer; sSmdoCode:String) : Boolean;
var
  s,sIdNumber,sRegNumber, sBMPost, sBMTask:String;
  dDate:TDateTime;
  nTaskID,nID, nType:Integer;
  ISWRITE_REF,lErr:Boolean;
begin
  Result:=false;
  // [KEY_FOLDER_UPDATE]  1=по запросу   2=автоматически  3=никогда
  lErr:=false;
  if dmBase.SMDOPost.FieldByName('ID').AsInteger<>nPostID then begin
    if not dmBase.SMDOPost.Locate('ID', nPostID, [])
      then exit;
  end;
  sBMPost:=dmBase.SMDOPost.BookMark;  // !!!
  sBMTask:=dmBase.SMDOTask.BookMark;  // !!!
  FReferred.First;
  FDocTask.First;
  while not FDocTask.Eof do begin
    if FDocTask.FieldByName('NOMER').AsInteger>=1000 then begin  // Folder  (<1000 Task)
      nTaskID:=FDocTask.FieldByName('TASK_ID').AsInteger;
      if FReferred.Locate('PARENT_ID', nTaskID,[]) then begin
        sIdNumber:=FReferred.FieldByName('IDNUMBER').AsString;
        if (sIdNumber<>'') and (sIdNumber<>FDokIdNumber) then begin
          WriteTextLog('Обработка ссылки для SMDOCODE='+sSmdoCode+' IDNUMBER='+sIdNumber);
          if dmBase.SMDOPost.Locate('SMDOCODE;IDNUMBER', VarArrayOf([sSmdoCode, sIdNumber]), []) then begin
            nID:=dmBase.SMDOPost.FieldByName('ID').AsInteger;   // ID сообщения в которое нужно записать
            if (dmBase.SMDOPost.FieldByName('ADR_REGNUMBER').AsString=FReferred.FieldByName('REGNUMBER').AsString) then begin
              if WriteOneReferredToOsnDoc(nID) then begin
                FWriteAddFolder:=FWriteAddFolder+1;  // кол-во доп. материалов записанных
                WriteTextLog('дополнительные материалы добавлены к сообщению №'+FReferred.FieldByName('REGNUMBER').AsString+' от '+
                             DatePropis(FReferred.FieldByName('REGDATE').AsDateTime,3) );
                ISWRITE_REF:=true;
                try                 
                  EditDataSet(dmBase.SMDOPost);
                  dmBase.SMDOPost.FieldByName('COUNT_FOLDER').AsInteger:=dmBase.SMDOPost.FieldByName('COUNT_FOLDER').AsInteger+1;
                  dmBase.SMDOPost.FieldByName('DOC_STATUS').AsInteger:=DOC_NOT_READ;
                  PostDataSet(dmBase.SMDOPost);
                except
                end;
              end;
            end else begin
              WriteTextLog('регистарционные номера не совпадают: '+FReferred.FieldByName('REGNUMBER').AsString+', '+dmBase.SMDOPost.FieldByName('ADR_REGNUMBER').AsString);
              lErr:=true;
            end;
          end else begin
            // !!!  не найден IDNUMBER
            WriteTextLog('не найдено сообщение для записи');
            lErr:=true;
          end;
        end;
      end;
    end;
    FDocTask.Next;
  end;
  dmBase.SMDOPost.BookMark:=sBMPost;
  dmBase.SMDOTask.BookMark:=sBMTask;
  if ISWRITE_REF then begin
    dmBase.SMDOPost.Edit;
    dmBase.SMDOPost.FieldByName('ISWRITE_REF').AsBoolean:=true;
    dmBase.SMDOPost.Post;
  end;
end;
//-----------------------------------------------------------------------------------
// nID идентифиакатор сообщения к которому необходимо прикрепить ссылку
function TSMDO.WriteOneReferredToOsnDoc(nID:Integer): Boolean;
var
  n,nDocID,nFolderID,nCurFolderID :Integer;
  sPath, sCurFile:String;
  lOk:Boolean;
begin
  Result:=false;
  try
    dmBase.WorkQuery.SQL.Text:='select max(nomer) from SmdoTask where post_id='+InttoStr(nID);
    dmBase.WorkQuery.Open;
    n:=dmBase.WorkQuery.Fields[0].AsInteger;
    dmBase.WorkQuery.Close;
    if n=0 then n:=1001 else n:=n+1;
    nCurFolderID:=FDocTask.FieldByName('TASK_ID').AsInteger;
    with dmBase.SMDOTask do begin
      Append;
      FieldByName('POST_ID').AsInteger:=nID;
      nFolderID:=dmBase.GetNewID(_TypeObj_SMDOPost);
      FieldByName('TASK_ID').AsInteger:=nFolderID;
      FieldByName('TASK_ID_SOURCE').AsInteger:=nCurFolderID;
      FieldByName('NOMER').AsInteger:=n;
      FieldByName('ADD_TYPE').AsInteger:=ADD_TYPE_PRIL;
      FieldByName('IDNUMBER').AsString:=FDocTask.FieldByName('IDNUMBER').AsString;
      FieldByName('KIND').AsString:=FDocTask.FieldByName('KIND').AsString;
      FieldByName('TEXT').AsString:=FDocTask.FieldByName('TEXT').AsString;
      FieldByName('CONTENTS').AsString:=FDocTask.FieldByName('CONTENTS').AsString;
      Post;
      Result:=true;
    end;
    sPath:=SMDO.GetPathAttach(0, nID);   // реальный путь текущих файлов
    FFiles.Filter:='parent_id='+IntToStr(nCurFolderID);
    FFiles.Filtered:=true;
    FFiles.First;
    while not FFiles.Eof do begin
      lOk:=true;
      if FFiles.FieldByName('STORE_KIND').AsInteger<>STORE_KIND_VALUE then begin   // не в поле VALUE в BASE64
        sCurFile:=CheckSleshN(NormDir(FFiles.FieldByName('PATH').AsString))+FFiles.FieldByName('NAME').AsString;
        //--- !!! ---------------------------------------------------------------------------
        // $$$ заменить на dmBase.AddFileToSMDO(SMDO,sFileName,nPostID)
        // скопируем файл в сообщение ссылку
        if CopyFile(PChar(sCurFile), PChar(sPath+FFiles.FieldByName('NAME').AsString), false) then begin
        end else begin
          // ??? что делать ???
          lOk:=false;
          WriteTextLog('Ошибка копирования файла : '+sCurFile+' в '+sPath+FFiles.FieldByName('NAME').AsString+' '+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
        end;
      end;
      //--- !!! ---------------------------------------------------------------------------
      with dmBase.SMDOFile do begin
        if lOk then begin
          Append;
          FieldByName('POST_ID').AsInteger:=nID;
          FieldByName('PARENT_ID').AsInteger:=nFolderID;
          //FieldByName('FILE_ID').AsInteger:=tbFilesFILE_ID.AsInteger; autoinc
          FieldByName('FILE_ID_SOURCE').AsInteger:=FFiles.FieldByName('FILE_ID').AsInteger;
          FieldByName('STORE_KIND').AsInteger:=FFiles.FieldByName('STORE_KIND').AsInteger;
          FieldByName('NAME').AsString:=FFiles.FieldByName('NAME').AsString;
//          tbFilesFILE_TYPE.AsString:=Trim(Copy(ANSIUpperCase(ExtractFileExt(tbFilesNAME.AsString)),2,100));
          FieldByName('PATH').AsString:=SMDO.GetPathAttach(1,nID);   // относительный путь '&BASE&\DocArxiv'
          FieldByName('VALUE').AsString:=FFiles.FieldByName('VALUE').AsString;
          FieldByName('KOMM').AsString:=FFiles.FieldByName('KOMM').AsString;
          FieldByName('SIGNATURE').AsString:=FFiles.FieldByName('SIGNATURE').AsString;
          FieldByName('SIGNINFO').AsString:=FFiles.FieldByName('SIGNINFO').AsString;
          FieldByName('MD5').AsString:=FFiles.FieldByName('MD5').AsString;
          WriteDateField( FieldByName('DATEM'), FFiles.FieldByName('DATEM'));
          WriteDateField( FieldByName('DATEC'), FFiles.FieldByName('DATEC'));
          Post;
        end;

        //---- подсистема входящие DocMain и DocFile -------------------------
        dmBase.WorkQuery.SQL.Text:='select DOC_ID from DocMain where post_id='+InttoStr(nID);
        dmBase.WorkQuery.Open;
        nDocID:=dmBase.WorkQuery.Fields[0].AsInteger;
//        sRowID:=dmBase.WorkQuery.Fields[1].AsString;
        dmBase.WorkQuery.Close;
        if nDocID>0 then begin // во входящих нашли запись
          dmBase.AdsConnection.Execute('update DocMain set DOC_STATUS=1 where DOC_ID='+InttoStr(nDocID));  //  cdIzm=1 константа в mDRecInt.pas
          dmBase.WorkQuery.SQL.Text:='select max(n_order) from DocFile where DOC_ID='+InttoStr(nDocID);
          dmBase.WorkQuery.Open;
          n:=dmBase.WorkQuery.Fields[0].AsInteger+1;
          dmBase.AdsConnection.Execute(Format('INSERT INTO DocFile (DOC_ID,N_ORDER,STORE_KIND,DIR_YEAR,DIR_MONTH,DIR_NAME,NAME,PATH,READ_ONLY) '+
             ' VALUES (%d,%d,%d,''%s'',''%s'',''%s'',''%s'',''%s'',1)',
          [nDocID,n,1,FormatDateTime('YYYY', Date),FormatDateTime('MM', Date),FormatDateTime('yyyymmdd_hhnnss_zzz', Now)+'.zip',
           FFiles.FieldByName('NAME').AsString, SMDO.GetPathAttach(1,nID), 1]));
        end;
        //-----------------------------

      end;
      FFiles.Next;
    end;
  finally
    FFiles.Filter:='';
    FFiles.Filtered:=false;
  end;
end;

procedure TSMDO.SetOnUpdateWinReceiceMail(const Value: TReceiveMailEvent);
begin
  FOnUpdateWinReceiceMail := Value;
end;

initialization
  SMDO:=nil;
finalization
  FreeAndNil(SMDO);
end.
