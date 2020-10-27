// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://10.30.254.30:8080/spr/ws/actualDictionaryWebService?wsdl
//  >Import : http://10.30.254.30:8080/spr/ws/actualDictionaryWebService?wsdl=IActualDictionaryWebService.wsdl
//  >Import : http://10.30.254.30:8080/spr/ws/actualDictionaryWebService?wsdl=IActualDictionaryWebService.wsdl:0
// Encoding : UTF-8
// Version  : 1.0
// (21.07.2016 16:30:41 - - $Rev: 10138 $)
// ************************************************************************ //

unit wsSMDOClassifA;

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

  chargeActualDictionary = class;               { "http://spr.nvcm.net/ActualDictionaryWebService"[GblElm] }
  chargeActualDictionaryResponse = class;       { "http://spr.nvcm.net/ActualDictionaryWebService"[GblElm] }
  receiveActualDictionary = class;              { "http://spr.nvcm.net/ActualDictionaryWebService"[GblElm] }
  receiveActualDictionaryResponse = class;      { "http://spr.nvcm.net/ActualDictionaryWebService"[GblElm] }

  { "http://spr.nvcm.net/ActualDictionaryWebService"[GblSmpl] }
  status = (OK, FAIL, PROCESS);



  // ************************************************************************ //
  // XML       : chargeActualDictionary, global, <element>
  // Namespace : http://spr.nvcm.net/ActualDictionaryWebService
  // ************************************************************************ //
  chargeActualDictionary = class(TRemotable)
  private
    FcompanyId: WideString;
    FdictionaryId: WideString;
    FactualDate: WideString;
    FactualDate_Specified: boolean;
    procedure SetactualDate(Index: Integer; const AWideString: WideString);
    function  actualDate_Specified(Index: Integer): boolean;
  published
    property companyId:    WideString  read FcompanyId write FcompanyId;
    property dictionaryId: WideString  read FdictionaryId write FdictionaryId;
    property actualDate:   WideString  Index (IS_OPTN) read FactualDate write SetactualDate stored actualDate_Specified;
  end;



  // ************************************************************************ //
  // XML       : chargeActualDictionaryResponse, global, <element>
  // Namespace : http://spr.nvcm.net/ActualDictionaryWebService
  // ************************************************************************ //
  chargeActualDictionaryResponse = class(TRemotable)
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
  // XML       : receiveActualDictionary, global, <element>
  // Namespace : http://spr.nvcm.net/ActualDictionaryWebService
  // ************************************************************************ //
  receiveActualDictionary = class(TRemotable)
  private
    FrequestGuid: WideString;
  published
    property requestGuid: WideString  read FrequestGuid write FrequestGuid;
  end;



  // ************************************************************************ //
  // XML       : receiveActualDictionaryResponse, global, <element>
  // Namespace : http://spr.nvcm.net/ActualDictionaryWebService
  // ************************************************************************ //
  receiveActualDictionaryResponse = class(TRemotable)
  private
    FrequestGuid: WideString;
    Fstatus: status;
    Fmessage_: WideString;
    FdictionaryData: TByteDynArray;
    FdictionaryData_Specified: boolean;
    procedure SetdictionaryData(Index: Integer; const ATByteDynArray: TByteDynArray);
    function  dictionaryData_Specified(Index: Integer): boolean;
  published
    property requestGuid:    WideString     read FrequestGuid write FrequestGuid;
    property status:         status         read Fstatus write Fstatus;
    property message_:       WideString     read Fmessage_ write Fmessage_;
    property dictionaryData: TByteDynArray  Index (IS_OPTN) read FdictionaryData write SetdictionaryData stored dictionaryData_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://spr.nvcm.net/ActualDictionaryWebService
  // binding   : actualDictionaryWebServiceSoapBinding
  // service   : actualDictionaryWebService
  // port      : actualDictionaryWebServicePort
  // URL       : http://10.30.254.30:8080/spr/ws/actualDictionaryWebService
  // ************************************************************************ //
  IActualDictionaryWebService = interface(IInvokable)
  ['{F09B3DA4-11E4-1EF3-79D8-C16ECED3E26C}']
    function  chargeActualDictionary(const chargeActualDictionary: chargeActualDictionary): chargeActualDictionaryResponse; stdcall;
    function  receiveActualDictionary(const receiveActualDictionary: receiveActualDictionary): receiveActualDictionaryResponse; stdcall;
  end;

function GetSMDOClassifAWs(Addr, Proxy: string; RIO: THTTPRIO): IActualDictionaryWebService;
function GetIActualDictionaryWebService(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IActualDictionaryWebService;


implementation
  uses SysUtils;

const
  defWSDL = 'http://10.30.254.30:8080/spr/ws/actualDictionaryWebService?wsdl';
  defURL  = 'http://10.30.254.30:8080/spr/ws/actualDictionaryWebService';
  defSvc  = 'actualDictionaryWebService';
  defPrt  = 'actualDictionaryWebServicePort';

//------------------------------------------------------------------------------
function GetSMDOClassifAWs(Addr, Proxy: string; RIO: THTTPRIO): IActualDictionaryWebService;
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
   Result:=(RIO as IActualDictionaryWebService);
end;
//------------------------------------------------------------------------------
function GetIActualDictionaryWebService(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IActualDictionaryWebService;
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
    Result := (RIO as IActualDictionaryWebService);
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


procedure chargeActualDictionary.SetactualDate(Index: Integer; const AWideString: WideString);
begin
  FactualDate := AWideString;
  FactualDate_Specified := True;
end;

function chargeActualDictionary.actualDate_Specified(Index: Integer): boolean;
begin
  Result := FactualDate_Specified;
end;

procedure chargeActualDictionaryResponse.SetrequestGuid(Index: Integer; const AWideString: WideString);
begin
  FrequestGuid := AWideString;
  FrequestGuid_Specified := True;
end;

function chargeActualDictionaryResponse.requestGuid_Specified(Index: Integer): boolean;
begin
  Result := FrequestGuid_Specified;
end;

procedure receiveActualDictionaryResponse.SetdictionaryData(Index: Integer; const ATByteDynArray: TByteDynArray);
begin
  FdictionaryData := ATByteDynArray;
  FdictionaryData_Specified := True;
end;

function receiveActualDictionaryResponse.dictionaryData_Specified(Index: Integer): boolean;
begin
  Result := FdictionaryData_Specified;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(IActualDictionaryWebService), 'http://spr.nvcm.net/ActualDictionaryWebService', 'UTF-8');
//  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IActualDictionaryWebService), 'http://spr.nvcm.net/ActualDictionaryWebService');  !!!  было
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IActualDictionaryWebService), '');
  RemClassRegistry.RegisterXSInfo(TypeInfo(status), 'http://spr.nvcm.net/ActualDictionaryWebService', 'status');
  RemClassRegistry.RegisterXSClass(chargeActualDictionary, 'http://spr.nvcm.net/ActualDictionaryWebService', 'chargeActualDictionary');
  RemClassRegistry.RegisterXSClass(chargeActualDictionaryResponse, 'http://spr.nvcm.net/ActualDictionaryWebService', 'chargeActualDictionaryResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(chargeActualDictionaryResponse), 'message_', 'message');
  RemClassRegistry.RegisterXSClass(receiveActualDictionary, 'http://spr.nvcm.net/ActualDictionaryWebService', 'receiveActualDictionary');
  RemClassRegistry.RegisterXSClass(receiveActualDictionaryResponse, 'http://spr.nvcm.net/ActualDictionaryWebService', 'receiveActualDictionaryResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(receiveActualDictionaryResponse), 'message_', 'message');

end.