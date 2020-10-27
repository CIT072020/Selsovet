// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://86.57.146.82:9080/spr/ws/historyDictionaryWebService?wsdl
//  >Import : http://86.57.146.82:9080/spr/ws/historyDictionaryWebService?wsdl=IHistoryDictionaryWebService.wsdl
//  >Import : http://86.57.146.82:9080/spr/ws/historyDictionaryWebService?wsdl=IHistoryDictionaryWebService.wsdl:0
// Encoding : UTF-8
// Version  : 1.0
// (11.08.2016 11:13:48 - - $Rev: 10138 $)
// ************************************************************************ //

unit wsSMDOClassifH;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, OPConvert;

const
  IS_OPTN = $0001;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"[Gbl]

  chargeHistoryDictionary = class;              { "http://spr.nvcm.net/HistoryDictionaryWebService"[GblElm] }
  chargeHistoryDictionaryResponse = class;      { "http://spr.nvcm.net/HistoryDictionaryWebService"[GblElm] }
  receiveHistoryDictionary = class;             { "http://spr.nvcm.net/HistoryDictionaryWebService"[GblElm] }
  receiveHistoryDictionaryResponse = class;     { "http://spr.nvcm.net/HistoryDictionaryWebService"[GblElm] }

  { "http://spr.nvcm.net/HistoryDictionaryWebService"[GblSmpl] }
  status = (OK, FAIL, PROCESS);



  // ************************************************************************ //
  // XML       : chargeHistoryDictionary, global, <element>
  // Namespace : http://spr.nvcm.net/HistoryDictionaryWebService
  // ************************************************************************ //
  chargeHistoryDictionary = class(TRemotable)
  private
    FcompanyId: WideString;
    FdictionaryId: WideString;
    FhistoryDateFrom: WideString;
    FhistoryDateTo: WideString;
    FhistoryDateTo_Specified: boolean;
    procedure SethistoryDateTo(Index: Integer; const AWideString: WideString);
    function  historyDateTo_Specified(Index: Integer): boolean;
  published
    property companyId:       WideString  read FcompanyId write FcompanyId;
    property dictionaryId:    WideString  read FdictionaryId write FdictionaryId;
    property historyDateFrom: WideString  read FhistoryDateFrom write FhistoryDateFrom;
    property historyDateTo:   WideString  Index (IS_OPTN) read FhistoryDateTo write SethistoryDateTo stored historyDateTo_Specified;
  end;



  // ************************************************************************ //
  // XML       : chargeHistoryDictionaryResponse, global, <element>
  // Namespace : http://spr.nvcm.net/HistoryDictionaryWebService
  // ************************************************************************ //
  chargeHistoryDictionaryResponse = class(TRemotable)
  private
    FrequestGuid: WideString;
    FrequestGuid_Specified: boolean;
    Fstatus: status;
    Fmessage_: WideString;
    procedure SetrequestGuid(Index: Integer; const AWideString: WideString);
    function  requestGuid_Specified(Index: Integer): boolean;
  published
    property requestGuid: WideString  Index (IS_OPTN) read FrequestGuid write SetrequestGuid stored requestGuid_Specified;
    property status:      status      read Fstatus write Fstatus;
    property message_:    WideString  read Fmessage_ write Fmessage_;
  end;



  // ************************************************************************ //
  // XML       : receiveHistoryDictionary, global, <element>
  // Namespace : http://spr.nvcm.net/HistoryDictionaryWebService
  // ************************************************************************ //
  receiveHistoryDictionary = class(TRemotable)
  private
    FrequestGuid: WideString;
  published
    property requestGuid: WideString  read FrequestGuid write FrequestGuid;
  end;



  // ************************************************************************ //
  // XML       : receiveHistoryDictionaryResponse, global, <element>
  // Namespace : http://spr.nvcm.net/HistoryDictionaryWebService
  // ************************************************************************ //
  receiveHistoryDictionaryResponse = class(TRemotable)
  private
    FrequestGuid: WideString;
    FrequestGuid_Specified: boolean;
    Fstatus: status;
    Fmessage_: WideString;
    FdictionaryData: TByteDynArray;
    FdictionaryData_Specified: boolean;
    procedure SetrequestGuid(Index: Integer; const AWideString: WideString);
    function  requestGuid_Specified(Index: Integer): boolean;
    procedure SetdictionaryData(Index: Integer; const ATByteDynArray: TByteDynArray);
    function  dictionaryData_Specified(Index: Integer): boolean;
  published
    property requestGuid:    WideString     Index (IS_OPTN) read FrequestGuid write SetrequestGuid stored requestGuid_Specified;
    property status:         status         read Fstatus write Fstatus;
    property message_:       WideString     read Fmessage_ write Fmessage_;
    property dictionaryData: TByteDynArray  Index (IS_OPTN) read FdictionaryData write SetdictionaryData stored dictionaryData_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://spr.nvcm.net/HistoryDictionaryWebService
  // binding   : historyDictionaryWebServiceSoapBinding
  // service   : historyDictionaryWebService
  // port      : historyDictionaryWebServicePort
  // URL       : http://86.57.146.82:9080/spr/ws/historyDictionaryWebService
  // ************************************************************************ //
  IHistoryDictionaryWebService = interface(IInvokable)
  ['{1501780A-0800-EFF5-06F1-D37F39BFE30B}']
    function  receiveHistoryDictionary(const receiveHistoryDictionary: receiveHistoryDictionary): receiveHistoryDictionaryResponse; stdcall;
    function  chargeHistoryDictionary(const chargeHistoryDictionary: chargeHistoryDictionary): chargeHistoryDictionaryResponse; stdcall;
  end;

function GetSMDOClassifHWs(Addr, Proxy: string; RIO: THTTPRIO): IHistoryDictionaryWebService;
function GetIHistoryDictionaryWebService(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IHistoryDictionaryWebService;


implementation
  uses SysUtils;

const
  defWSDL = 'http://10.30.254.30:8080/spr/ws/historyDictionaryWebService?wsdl';
  defURL  = 'http://10.30.254.30:8080/spr/ws/historyDictionaryWebService';
  defSvc  = 'historyDictionaryWebService';
  defPrt  = 'historyDictionaryWebServicePort';

//------------------------------------------------------------------------------
function GetSMDOClassifHWs(Addr, Proxy: string; RIO: THTTPRIO): IHistoryDictionaryWebService;
begin
   Result := nil;
   if Addr='' then begin
     Addr:=defUrl;
   end;
    if RIO = nil then
      RIO := THTTPRIO.Create(nil);
//   RIO.Converter.Options:=[soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soDocument, soDontSendEmptyNodes, soCacheMimeResponse, soLiteralParams, soUTF8EncodeXML];
   RIO.Converter.Options:=[soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soLiteralParams, soUTF8EncodeXML];
   RIO.URL:=Addr;
   RIO.HTTPWebNode.Proxy:=Proxy;
   Result:=(RIO as IHistoryDictionaryWebService);
end;

function GetIHistoryDictionaryWebService(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IHistoryDictionaryWebService;
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as IHistoryDictionaryWebService);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


procedure chargeHistoryDictionary.SethistoryDateTo(Index: Integer; const AWideString: WideString);
begin
  FhistoryDateTo := AWideString;
  FhistoryDateTo_Specified := True;
end;

function chargeHistoryDictionary.historyDateTo_Specified(Index: Integer): boolean;
begin
  Result := FhistoryDateTo_Specified;
end;

procedure chargeHistoryDictionaryResponse.SetrequestGuid(Index: Integer; const AWideString: WideString);
begin
  FrequestGuid := AWideString;
  FrequestGuid_Specified := True;
end;

function chargeHistoryDictionaryResponse.requestGuid_Specified(Index: Integer): boolean;
begin
  Result := FrequestGuid_Specified;
end;

procedure receiveHistoryDictionaryResponse.SetrequestGuid(Index: Integer; const AWideString: WideString);
begin
  FrequestGuid := AWideString;
  FrequestGuid_Specified := True;
end;

function receiveHistoryDictionaryResponse.requestGuid_Specified(Index: Integer): boolean;
begin
  Result := FrequestGuid_Specified;
end;

procedure receiveHistoryDictionaryResponse.SetdictionaryData(Index: Integer; const ATByteDynArray: TByteDynArray);
begin
  FdictionaryData := ATByteDynArray;
  FdictionaryData_Specified := True;
end;

function receiveHistoryDictionaryResponse.dictionaryData_Specified(Index: Integer): boolean;
begin
  Result := FdictionaryData_Specified;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(IHistoryDictionaryWebService), 'http://spr.nvcm.net/HistoryDictionaryWebService', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IHistoryDictionaryWebService), '');
  RemClassRegistry.RegisterXSInfo(TypeInfo(status), 'http://spr.nvcm.net/HistoryDictionaryWebService', 'status');
  RemClassRegistry.RegisterXSClass(chargeHistoryDictionary, 'http://spr.nvcm.net/HistoryDictionaryWebService', 'chargeHistoryDictionary');
  RemClassRegistry.RegisterXSClass(chargeHistoryDictionaryResponse, 'http://spr.nvcm.net/HistoryDictionaryWebService', 'chargeHistoryDictionaryResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(chargeHistoryDictionaryResponse), 'message_', 'message');
  RemClassRegistry.RegisterXSClass(receiveHistoryDictionary, 'http://spr.nvcm.net/HistoryDictionaryWebService', 'receiveHistoryDictionary');
  RemClassRegistry.RegisterXSClass(receiveHistoryDictionaryResponse, 'http://spr.nvcm.net/HistoryDictionaryWebService', 'receiveHistoryDictionaryResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(receiveHistoryDictionaryResponse), 'message_', 'message');

end.