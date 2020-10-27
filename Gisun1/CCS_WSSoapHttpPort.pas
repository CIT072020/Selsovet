// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://todes.by:8084/CCS/CCS_WSSoapHttpPort?wsdl
//  >Import : http://todes.by:8084/CCS/CCS_WSSoapHttpPort?wsdl:0
// Encoding : UTF-8
// Version  : 1.0
// (24.11.2011 16:14:17 - - $Rev: 10138 $)
// ************************************************************************ //

unit CCS_WSSoapHttpPort;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"[Gbl]

  KlRecBase            = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[GblCplx] }
  KlRecUser            = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[GblCplx] }
  KlTypeRecBase        = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[GblCplx] }
  KlTypeRecUser        = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[GblCplx] }
  KlHistoryRecBase     = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[GblCplx] }
  KlHistoryRecUser     = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[GblCplx] }
  SyslogRecBase        = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[GblCplx] }
  SyslogRecUser        = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[GblCplx] }
  mtnHierarchklElement = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  mtnIukltypesElement  = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  mtnIukltypesResponseElement = class;          { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  mtnIukluniElement    = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  mtnIukluniResponseElement = class;            { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  mtnKltypesElement    = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  mtnKluniElement      = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  mtnKlunihistoryElement = class;               { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  mtnSyslogElement     = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  rcvUpdatecategbyidElement = class;            { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  rcvUpdatecategbyidResponseElement = class;    { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  rcvUpdateklbyelementsElement = class;         { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  rcvUpdateklbyelementsResponseElement = class;   { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  sndAteElement        = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  sndIcdElement        = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  sndKlbytypeElement   = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  sndKlcountElement    = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  sndKlcountResponseElement = class;            { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  sndKltypesElement    = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  utlCodenextvalElement = class;                { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  utlCodenextvalResponseElement = class;        { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  utlGetklcountElement = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  utlGetklcountResponseElement = class;         { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  utlKlhistorycountElement = class;             { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  utlKlhistorycountResponseElement = class;     { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  utlParentateElement  = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  utlParentateResponseElement = class;          { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  utlParenticdElement  = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  utlParenticdResponseElement = class;          { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  utlTypenextvalElement = class;                { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  utlTypenextvalResponseElement = class;        { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }
  result               = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Alias] }
  result2              = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Alias] }
  result3              = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Alias] }
  result4              = class;                 { "http://admun_sv/CCS_WS.wsdl/types/"[Alias] }



  // ************************************************************************ //
  // XML       : KlRecBase, global, <complexType>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // ************************************************************************ //
  KlRecBase = class(TRemotable)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : KlRecUser, global, <complexType>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // ************************************************************************ //
  KlRecUser = class(KlRecBase)
  private
    Fcode: TXSDecimal;
    Factive: TXSDecimal;
    Flex2: WideString;
    FextCode: WideString;
    FbeginDate: WideString;
    Ftype_: TXSDecimal;
    FextOperin: TXSDecimal;
    Flex1: WideString;
    Flex3: WideString;
    FendDate: WideString;
    Fparent: WideString;
    FextType: WideString;
  public
    destructor Destroy; override;
  published
    property code:      TXSDecimal  Index (IS_NLBL) read Fcode write Fcode;
    property active:    TXSDecimal  Index (IS_NLBL) read Factive write Factive;
    property lex2:      WideString  Index (IS_NLBL) read Flex2 write Flex2;
    property extCode:   WideString  Index (IS_NLBL) read FextCode write FextCode;
    property beginDate: WideString  Index (IS_NLBL) read FbeginDate write FbeginDate;
    property type_:     TXSDecimal  Index (IS_NLBL) read Ftype_ write Ftype_;
    property extOperin: TXSDecimal  Index (IS_NLBL) read FextOperin write FextOperin;
    property lex1:      WideString  Index (IS_NLBL) read Flex1 write Flex1;
    property lex3:      WideString  Index (IS_NLBL) read Flex3 write Flex3;
    property endDate:   WideString  Index (IS_NLBL) read FendDate write FendDate;
    property parent:    WideString  Index (IS_NLBL) read Fparent write Fparent;
    property extType:   WideString  Index (IS_NLBL) read FextType write FextType;
  end;



  // ************************************************************************ //
  // XML       : KlTypeRecBase, global, <complexType>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // ************************************************************************ //
  KlTypeRecBase = class(TRemotable)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : KlTypeRecUser, global, <complexType>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // ************************************************************************ //
  KlTypeRecUser = class(KlTypeRecBase)
  private
    Ftype_: TXSDecimal;
    Flex: WideString;
    Fmask: TXSDecimal;
  public
    destructor Destroy; override;
  published
    property type_: TXSDecimal  Index (IS_NLBL) read Ftype_ write Ftype_;
    property lex:   WideString  Index (IS_NLBL) read Flex write Flex;
    property mask:  TXSDecimal  Index (IS_NLBL) read Fmask write Fmask;
  end;



  // ************************************************************************ //
  // XML       : KlHistoryRecBase, global, <complexType>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // ************************************************************************ //
  KlHistoryRecBase = class(TRemotable)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : KlHistoryRecUser, global, <complexType>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // ************************************************************************ //
  KlHistoryRecUser = class(KlHistoryRecBase)
  private
    Fcode: TXSDecimal;
    Flex2: WideString;
    FextCode: WideString;
    FbeginDate: WideString;
    Ftype_: TXSDecimal;
    FextOperin: TXSDecimal;
    Flex1: WideString;
    Flex3: WideString;
    FendDate: WideString;
    Frid: TXSDecimal;
    FextType: WideString;
  public
    destructor Destroy; override;
  published
    property code:      TXSDecimal  Index (IS_NLBL) read Fcode write Fcode;
    property lex2:      WideString  Index (IS_NLBL) read Flex2 write Flex2;
    property extCode:   WideString  Index (IS_NLBL) read FextCode write FextCode;
    property beginDate: WideString  Index (IS_NLBL) read FbeginDate write FbeginDate;
    property type_:     TXSDecimal  Index (IS_NLBL) read Ftype_ write Ftype_;
    property extOperin: TXSDecimal  Index (IS_NLBL) read FextOperin write FextOperin;
    property lex1:      WideString  Index (IS_NLBL) read Flex1 write Flex1;
    property lex3:      WideString  Index (IS_NLBL) read Flex3 write Flex3;
    property endDate:   WideString  Index (IS_NLBL) read FendDate write FendDate;
    property rid:       TXSDecimal  Index (IS_NLBL) read Frid write Frid;
    property extType:   WideString  Index (IS_NLBL) read FextType write FextType;
  end;



  // ************************************************************************ //
  // XML       : SyslogRecBase, global, <complexType>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // ************************************************************************ //
  SyslogRecBase = class(TRemotable)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : SyslogRecUser, global, <complexType>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // ************************************************************************ //
  SyslogRecUser = class(SyslogRecBase)
  private
    Fcode: TXSDecimal;
    FopDate: TXSDateTime;
    Ftype_: TXSDecimal;
    FTOpCode: TXSDecimal;
    FCOpCode: TXSDecimal;
    FTSysDocType: TXSDecimal;
    FCSysDocType: TXSDecimal;
    FidUser: TXSDecimal;
  public
    destructor Destroy; override;
  published
    property code:        TXSDecimal   Index (IS_NLBL) read Fcode write Fcode;
    property opDate:      TXSDateTime  Index (IS_NLBL) read FopDate write FopDate;
    property type_:       TXSDecimal   Index (IS_NLBL) read Ftype_ write Ftype_;
    property TOpCode:     TXSDecimal   Index (IS_NLBL) read FTOpCode write FTOpCode;
    property COpCode:     TXSDecimal   Index (IS_NLBL) read FCOpCode write FCOpCode;
    property TSysDocType: TXSDecimal   Index (IS_NLBL) read FTSysDocType write FTSysDocType;
    property CSysDocType: TXSDecimal   Index (IS_NLBL) read FCSysDocType write FCSysDocType;
    property idUser:      TXSDecimal   Index (IS_NLBL) read FidUser write FidUser;
  end;



  // ************************************************************************ //
  // XML       : mtnHierarchklElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  mtnHierarchklElement = class(TRemotable)
  private
    Fptype: WideString;
    Fpcode: WideString;
  public
    constructor Create; override;
  published
    property ptype: WideString  Index (IS_NLBL) read Fptype write Fptype;
    property pcode: WideString  Index (IS_NLBL) read Fpcode write Fpcode;
  end;

  mtnHierarchklResponseElement = array of result;   { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }


  // ************************************************************************ //
  // XML       : mtnIukltypesElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  mtnIukltypesElement = class(TRemotable)
  private
    Fnoper: TXSDecimal;
    Fntype: TXSDecimal;
    Fvlex1: WideString;
    Fnmask: WideString;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property noper: TXSDecimal  Index (IS_NLBL) read Fnoper write Fnoper;
    property ntype: TXSDecimal  Index (IS_NLBL) read Fntype write Fntype;
    property vlex1: WideString  Index (IS_NLBL) read Fvlex1 write Fvlex1;
    property nmask: WideString  Index (IS_NLBL) read Fnmask write Fnmask;
  end;



  // ************************************************************************ //
  // XML       : mtnIukltypesResponseElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  mtnIukltypesResponseElement = class(TRemotable)
  private
    Fresult: TXSDecimal;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property result: TXSDecimal  Index (IS_NLBL) read Fresult write Fresult;
  end;



  // ************************************************************************ //
  // XML       : mtnIukluniElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  mtnIukluniElement = class(TRemotable)
  private
    Fnoper: TXSDecimal;
    Fntype: TXSDecimal;
    Fncode: TXSDecimal;
    FvextType: WideString;
    FvextCode: WideString;
    FnextOperin: WideString;
    Fvlex1: WideString;
    Fvlex2: WideString;
    Fvlex3: WideString;
    Fvactive: WideString;
    FdbeginDate: WideString;
    FdendDate: WideString;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property noper:      TXSDecimal  Index (IS_NLBL) read Fnoper write Fnoper;
    property ntype:      TXSDecimal  Index (IS_NLBL) read Fntype write Fntype;
    property ncode:      TXSDecimal  Index (IS_NLBL) read Fncode write Fncode;
    property vextType:   WideString  Index (IS_NLBL) read FvextType write FvextType;
    property vextCode:   WideString  Index (IS_NLBL) read FvextCode write FvextCode;
    property nextOperin: WideString  Index (IS_NLBL) read FnextOperin write FnextOperin;
    property vlex1:      WideString  Index (IS_NLBL) read Fvlex1 write Fvlex1;
    property vlex2:      WideString  Index (IS_NLBL) read Fvlex2 write Fvlex2;
    property vlex3:      WideString  Index (IS_NLBL) read Fvlex3 write Fvlex3;
    property vactive:    WideString  Index (IS_NLBL) read Fvactive write Fvactive;
    property dbeginDate: WideString  Index (IS_NLBL) read FdbeginDate write FdbeginDate;
    property dendDate:   WideString  Index (IS_NLBL) read FdendDate write FdendDate;
  end;



  // ************************************************************************ //
  // XML       : mtnIukluniResponseElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  mtnIukluniResponseElement = class(TRemotable)
  private
    Fresult: TXSDecimal;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property result: TXSDecimal  Index (IS_NLBL) read Fresult write Fresult;
  end;



  // ************************************************************************ //
  // XML       : mtnKltypesElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  mtnKltypesElement = class(TRemotable)
  private
    Fntype: WideString;
    Fvlex1: WideString;
    Fnmask: WideString;
  public
    constructor Create; override;
  published
    property ntype: WideString  Index (IS_NLBL) read Fntype write Fntype;
    property vlex1: WideString  Index (IS_NLBL) read Fvlex1 write Fvlex1;
    property nmask: WideString  Index (IS_NLBL) read Fnmask write Fnmask;
  end;

  mtnKltypesResponseElement = array of result2;   { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }


  // ************************************************************************ //
  // XML       : mtnKluniElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  mtnKluniElement = class(TRemotable)
  private
    Fntype: WideString;
    Fncode: WideString;
    FvextType: WideString;
    FvextCode: WideString;
    FnextOperin: WideString;
    Fvlex1: WideString;
    Fvlex2: WideString;
    Fvlex3: WideString;
    Fvactive: WideString;
    FdbeginDate: WideString;
    FdendDate: WideString;
  public
    constructor Create; override;
  published
    property ntype:      WideString  Index (IS_NLBL) read Fntype write Fntype;
    property ncode:      WideString  Index (IS_NLBL) read Fncode write Fncode;
    property vextType:   WideString  Index (IS_NLBL) read FvextType write FvextType;
    property vextCode:   WideString  Index (IS_NLBL) read FvextCode write FvextCode;
    property nextOperin: WideString  Index (IS_NLBL) read FnextOperin write FnextOperin;
    property vlex1:      WideString  Index (IS_NLBL) read Fvlex1 write Fvlex1;
    property vlex2:      WideString  Index (IS_NLBL) read Fvlex2 write Fvlex2;
    property vlex3:      WideString  Index (IS_NLBL) read Fvlex3 write Fvlex3;
    property vactive:    WideString  Index (IS_NLBL) read Fvactive write Fvactive;
    property dbeginDate: WideString  Index (IS_NLBL) read FdbeginDate write FdbeginDate;
    property dendDate:   WideString  Index (IS_NLBL) read FdendDate write FdendDate;
  end;

  mtnKluniResponseElement = array of result;    { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }


  // ************************************************************************ //
  // XML       : mtnKlunihistoryElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  mtnKlunihistoryElement = class(TRemotable)
  private
    Fnrid: WideString;
    Fntype: WideString;
    Fncode: WideString;
    FvextType: WideString;
    FvextCode: WideString;
    FnextOperin: WideString;
    Fvlex1: WideString;
    Fvlex2: WideString;
    Fvlex3: WideString;
    FdbeginDate: WideString;
    FdendDate: WideString;
  public
    constructor Create; override;
  published
    property nrid:       WideString  Index (IS_NLBL) read Fnrid write Fnrid;
    property ntype:      WideString  Index (IS_NLBL) read Fntype write Fntype;
    property ncode:      WideString  Index (IS_NLBL) read Fncode write Fncode;
    property vextType:   WideString  Index (IS_NLBL) read FvextType write FvextType;
    property vextCode:   WideString  Index (IS_NLBL) read FvextCode write FvextCode;
    property nextOperin: WideString  Index (IS_NLBL) read FnextOperin write FnextOperin;
    property vlex1:      WideString  Index (IS_NLBL) read Fvlex1 write Fvlex1;
    property vlex2:      WideString  Index (IS_NLBL) read Fvlex2 write Fvlex2;
    property vlex3:      WideString  Index (IS_NLBL) read Fvlex3 write Fvlex3;
    property dbeginDate: WideString  Index (IS_NLBL) read FdbeginDate write FdbeginDate;
    property dendDate:   WideString  Index (IS_NLBL) read FdendDate write FdendDate;
  end;

  mtnKlunihistoryResponseElement = array of result3;   { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }


  // ************************************************************************ //
  // XML       : mtnSyslogElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  mtnSyslogElement = class(TRemotable)
  private
    Ftype_: WideString;
    Fcode: WideString;
    FidUser: WideString;
    FtOpCode: WideString;
    FcOpCode: WideString;
    FopDate: WideString;
    FtSysDocType: WideString;
    FcSysDocType: WideString;
  public
    constructor Create; override;
  published
    property type_:       WideString  Index (IS_NLBL) read Ftype_ write Ftype_;
    property code:        WideString  Index (IS_NLBL) read Fcode write Fcode;
    property idUser:      WideString  Index (IS_NLBL) read FidUser write FidUser;
    property tOpCode:     WideString  Index (IS_NLBL) read FtOpCode write FtOpCode;
    property cOpCode:     WideString  Index (IS_NLBL) read FcOpCode write FcOpCode;
    property opDate:      WideString  Index (IS_NLBL) read FopDate write FopDate;
    property tSysDocType: WideString  Index (IS_NLBL) read FtSysDocType write FtSysDocType;
    property cSysDocType: WideString  Index (IS_NLBL) read FcSysDocType write FcSysDocType;
  end;

  mtnSyslogResponseElement = array of result4;   { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }


  // ************************************************************************ //
  // XML       : rcvUpdatecategbyidElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  rcvUpdatecategbyidElement = class(TRemotable)
  private
    Fnid: TXSDecimal;
    Fvname: WideString;
    Fvsname: WideString;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property nid:    TXSDecimal  Index (IS_NLBL) read Fnid write Fnid;
    property vname:  WideString  Index (IS_NLBL) read Fvname write Fvname;
    property vsname: WideString  Index (IS_NLBL) read Fvsname write Fvsname;
  end;



  // ************************************************************************ //
  // XML       : rcvUpdatecategbyidResponseElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  rcvUpdatecategbyidResponseElement = class(TRemotable)
  private
    Fresult: TXSDecimal;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property result: TXSDecimal  Index (IS_NLBL) read Fresult write Fresult;
  end;



  // ************************************************************************ //
  // XML       : rcvUpdateklbyelementsElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  rcvUpdateklbyelementsElement = class(TRemotable)
  private
    Fnobjid: WideString;
    Fnobjopenin: WideString;
    Fnobjopenout: WideString;
    Fncategory: WideString;
    Fvcategory: WideString;
    Fndistr: WideString;
    Fvdistr: WideString;
    Fnregion: WideString;
    Fvregion: WideString;
    Fvnamerus: WideString;
    Fvnamebel: WideString;
    Fnactive: WideString;
    Fnleveldepend: WideString;
    Fddatechanged: WideString;
    Fnparentid: WideString;
  public
    constructor Create; override;
  published
    property nobjid:       WideString  Index (IS_NLBL) read Fnobjid write Fnobjid;
    property nobjopenin:   WideString  Index (IS_NLBL) read Fnobjopenin write Fnobjopenin;
    property nobjopenout:  WideString  Index (IS_NLBL) read Fnobjopenout write Fnobjopenout;
    property ncategory:    WideString  Index (IS_NLBL) read Fncategory write Fncategory;
    property vcategory:    WideString  Index (IS_NLBL) read Fvcategory write Fvcategory;
    property ndistr:       WideString  Index (IS_NLBL) read Fndistr write Fndistr;
    property vdistr:       WideString  Index (IS_NLBL) read Fvdistr write Fvdistr;
    property nregion:      WideString  Index (IS_NLBL) read Fnregion write Fnregion;
    property vregion:      WideString  Index (IS_NLBL) read Fvregion write Fvregion;
    property vnamerus:     WideString  Index (IS_NLBL) read Fvnamerus write Fvnamerus;
    property vnamebel:     WideString  Index (IS_NLBL) read Fvnamebel write Fvnamebel;
    property nactive:      WideString  Index (IS_NLBL) read Fnactive write Fnactive;
    property nleveldepend: WideString  Index (IS_NLBL) read Fnleveldepend write Fnleveldepend;
    property ddatechanged: WideString  Index (IS_NLBL) read Fddatechanged write Fddatechanged;
    property nparentid:    WideString  Index (IS_NLBL) read Fnparentid write Fnparentid;
  end;



  // ************************************************************************ //
  // XML       : rcvUpdateklbyelementsResponseElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  rcvUpdateklbyelementsResponseElement = class(TRemotable)
  private
    Fresult: TXSDecimal;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property result: TXSDecimal  Index (IS_NLBL) read Fresult write Fresult;
  end;



  // ************************************************************************ //
  // XML       : sndAteElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  sndAteElement = class(TRemotable)
  private
    Fvbdate: WideString;
    Fvedate: WideString;
  public
    constructor Create; override;
  published
    property vbdate: WideString  Index (IS_NLBL) read Fvbdate write Fvbdate;
    property vedate: WideString  Index (IS_NLBL) read Fvedate write Fvedate;
  end;

  sndAteResponseElement = array of result;      { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }


  // ************************************************************************ //
  // XML       : sndIcdElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  sndIcdElement = class(TRemotable)
  private
    Fvbdate: WideString;
    Fvedate: WideString;
  public
    constructor Create; override;
  published
    property vbdate: WideString  Index (IS_NLBL) read Fvbdate write Fvbdate;
    property vedate: WideString  Index (IS_NLBL) read Fvedate write Fvedate;
  end;

  sndIcdResponseElement = array of result;      { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }


  // ************************************************************************ //
  // XML       : sndKlbytypeElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  sndKlbytypeElement = class(TRemotable)
  private
    Fntype: TXSDecimal;
    Fvbdate: WideString;
    Fvedate: WideString;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property ntype:  TXSDecimal  Index (IS_NLBL) read Fntype write Fntype;
    property vbdate: WideString  Index (IS_NLBL) read Fvbdate write Fvbdate;
    property vedate: WideString  Index (IS_NLBL) read Fvedate write Fvedate;
  end;

  sndKlbytypeResponseElement = array of result;   { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }


  // ************************************************************************ //
  // XML       : sndKlcountElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  sndKlcountElement = class(TRemotable)
  private
    Fntype: TXSDecimal;
    Fvbdate: WideString;
    Fvedate: WideString;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property ntype:  TXSDecimal  Index (IS_NLBL) read Fntype write Fntype;
    property vbdate: WideString  Index (IS_NLBL) read Fvbdate write Fvbdate;
    property vedate: WideString  Index (IS_NLBL) read Fvedate write Fvedate;
  end;



  // ************************************************************************ //
  // XML       : sndKlcountResponseElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  sndKlcountResponseElement = class(TRemotable)
  private
    Fresult: TXSDecimal;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property result: TXSDecimal  Index (IS_NLBL) read Fresult write Fresult;
  end;



  // ************************************************************************ //
  // XML       : sndKltypesElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  sndKltypesElement = class(TRemotable)
  private
  public
    constructor Create; override;
  published
  end;

  sndKltypesResponseElement = array of result2;   { "http://admun_sv/CCS_WS.wsdl/types/"[Lit][GblElm] }


  // ************************************************************************ //
  // XML       : utlCodenextvalElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  utlCodenextvalElement = class(TRemotable)
  private
    Ffoo: TXSDecimal;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property foo: TXSDecimal  Index (IS_NLBL) read Ffoo write Ffoo;
  end;



  // ************************************************************************ //
  // XML       : utlCodenextvalResponseElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  utlCodenextvalResponseElement = class(TRemotable)
  private
    Fresult: TXSDecimal;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property result: TXSDecimal  Index (IS_NLBL) read Fresult write Fresult;
  end;



  // ************************************************************************ //
  // XML       : utlGetklcountElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  utlGetklcountElement = class(TRemotable)
  private
    Fextype: TXSDecimal;
    Fexcode: TXSDecimal;
    Fexver: TXSDecimal;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property extype: TXSDecimal  Index (IS_NLBL) read Fextype write Fextype;
    property excode: TXSDecimal  Index (IS_NLBL) read Fexcode write Fexcode;
    property exver:  TXSDecimal  Index (IS_NLBL) read Fexver write Fexver;
  end;



  // ************************************************************************ //
  // XML       : utlGetklcountResponseElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  utlGetklcountResponseElement = class(TRemotable)
  private
    Fresult: TXSDecimal;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property result: TXSDecimal  Index (IS_NLBL) read Fresult write Fresult;
  end;



  // ************************************************************************ //
  // XML       : utlKlhistorycountElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  utlKlhistorycountElement = class(TRemotable)
  private
    Fntype: TXSDecimal;
    Fncode: TXSDecimal;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property ntype: TXSDecimal  Index (IS_NLBL) read Fntype write Fntype;
    property ncode: TXSDecimal  Index (IS_NLBL) read Fncode write Fncode;
  end;



  // ************************************************************************ //
  // XML       : utlKlhistorycountResponseElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  utlKlhistorycountResponseElement = class(TRemotable)
  private
    Fresult: TXSDecimal;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property result: TXSDecimal  Index (IS_NLBL) read Fresult write Fresult;
  end;



  // ************************************************************************ //
  // XML       : utlParentateElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  utlParentateElement = class(TRemotable)
  private
    Fntype: TXSDecimal;
    Fncode: TXSDecimal;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property ntype: TXSDecimal  Index (IS_NLBL) read Fntype write Fntype;
    property ncode: TXSDecimal  Index (IS_NLBL) read Fncode write Fncode;
  end;



  // ************************************************************************ //
  // XML       : utlParentateResponseElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  utlParentateResponseElement = class(TRemotable)
  private
    Fresult: TXSDecimal;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property result: TXSDecimal  Index (IS_NLBL) read Fresult write Fresult;
  end;



  // ************************************************************************ //
  // XML       : utlParenticdElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  utlParenticdElement = class(TRemotable)
  private
    Fntype: TXSDecimal;
    Fncode: TXSDecimal;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property ntype: TXSDecimal  Index (IS_NLBL) read Fntype write Fntype;
    property ncode: TXSDecimal  Index (IS_NLBL) read Fncode write Fncode;
  end;



  // ************************************************************************ //
  // XML       : utlParenticdResponseElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  utlParenticdResponseElement = class(TRemotable)
  private
    Fresult: WideString;
  public
    constructor Create; override;
  published
    property result: WideString  Index (IS_NLBL) read Fresult write Fresult;
  end;



  // ************************************************************************ //
  // XML       : utlTypenextvalElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  utlTypenextvalElement = class(TRemotable)
  private
  public
    constructor Create; override;
  published
  end;



  // ************************************************************************ //
  // XML       : utlTypenextvalResponseElement, global, <element>
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  utlTypenextvalResponseElement = class(TRemotable)
  private
    Fresult: TXSDecimal;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property result: TXSDecimal  Index (IS_NLBL) read Fresult write Fresult;
  end;



  // ************************************************************************ //
  // XML       : result, alias
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // ************************************************************************ //
  result = class(KlRecUser)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : result, alias
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // ************************************************************************ //
  result2 = class(KlTypeRecUser)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : result, alias
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // ************************************************************************ //
  result3 = class(KlHistoryRecUser)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : result, alias
  // Namespace : http://admun_sv/CCS_WS.wsdl/types/
  // ************************************************************************ //
  result4 = class(SyslogRecUser)
  private
  published
  end;


  // ************************************************************************ //
  // Namespace : http://admun_sv/CCS_WS.wsdl
  // soapAction: http://admun_sv/CCS_WS.wsdl/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : CCS_WSSoapHttp
  // service   : CCS_WS
  // port      : CCS_WSSoapHttpPort
  // URL       : http://vm6-03:8084/CCS/CCS_WSSoapHttpPort
  // ************************************************************************ //
  CCS_WS = interface(IInvokable)
  ['{DBD212E4-8083-2F9B-354D-8A555573D9EC}']

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  mtnHierarchkl(const parameters: mtnHierarchklElement): mtnHierarchklResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  mtnIukltypes(const parameters: mtnIukltypesElement): mtnIukltypesResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  mtnIukluni(const parameters: mtnIukluniElement): mtnIukluniResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  mtnKltypes(const parameters: mtnKltypesElement): mtnKltypesResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  mtnKluni(const parameters: mtnKluniElement): mtnKluniResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  mtnKlunihistory(const parameters: mtnKlunihistoryElement): mtnKlunihistoryResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  mtnSyslog(const parameters: mtnSyslogElement): mtnSyslogResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  rcvUpdatecategbyid(const parameters: rcvUpdatecategbyidElement): rcvUpdatecategbyidResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  rcvUpdateklbyelements(const parameters: rcvUpdateklbyelementsElement): rcvUpdateklbyelementsResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  sndAte(const parameters: sndAteElement): sndAteResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  sndIcd(const parameters: sndIcdElement): sndIcdResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  sndKlbytype(const parameters: sndKlbytypeElement): sndKlbytypeResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  sndKlcount(const parameters: sndKlcountElement): sndKlcountResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  sndKltypes(const parameters: sndKltypesElement): sndKltypesResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  utlCodenextval(const parameters: utlCodenextvalElement): utlCodenextvalResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  utlGetklcount(const parameters: utlGetklcountElement): utlGetklcountResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  utlKlhistorycount(const parameters: utlKlhistorycountElement): utlKlhistorycountResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  utlParentate(const parameters: utlParentateElement): utlParentateResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  utlParenticd(const parameters: utlParenticdElement): utlParenticdResponseElement; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    function  utlTypenextval(const parameters: utlTypenextvalElement): utlTypenextvalResponseElement; stdcall;
  end;

function GetCCS_WS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): CCS_WS;


implementation
  uses SysUtils;

function GetCCS_WS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): CCS_WS;
const
  defWSDL = 'http://todes.by:8084/CCS/CCS_WSSoapHttpPort?wsdl';
  defURL  = 'http://todes.by:8084/CCS/CCS_WSSoapHttpPort';
  defSvc  = 'CCS_WS';
  defPrt  = 'CCS_WSSoapHttpPort';
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
    Result := (RIO as CCS_WS);
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


destructor KlRecUser.Destroy;
begin
  FreeAndNil(Fcode);
  FreeAndNil(Factive);
  FreeAndNil(Ftype_);
  FreeAndNil(FextOperin);
  inherited Destroy;
end;

destructor KlTypeRecUser.Destroy;
begin
  FreeAndNil(Ftype_);
  FreeAndNil(Fmask);
  inherited Destroy;
end;

destructor KlHistoryRecUser.Destroy;
begin
  FreeAndNil(Fcode);
  FreeAndNil(Ftype_);
  FreeAndNil(FextOperin);
  FreeAndNil(Frid);
  inherited Destroy;
end;

destructor SyslogRecUser.Destroy;
begin
  FreeAndNil(Fcode);
  FreeAndNil(FopDate);
  FreeAndNil(Ftype_);
  FreeAndNil(FTOpCode);
  FreeAndNil(FCOpCode);
  FreeAndNil(FTSysDocType);
  FreeAndNil(FCSysDocType);
  FreeAndNil(FidUser);
  inherited Destroy;
end;

constructor mtnHierarchklElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor mtnIukltypesElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor mtnIukltypesElement.Destroy;
begin
  FreeAndNil(Fnoper);
  FreeAndNil(Fntype);
  inherited Destroy;
end;

constructor mtnIukltypesResponseElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor mtnIukltypesResponseElement.Destroy;
begin
  FreeAndNil(Fresult);
  inherited Destroy;
end;

constructor mtnIukluniElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor mtnIukluniElement.Destroy;
begin
  FreeAndNil(Fnoper);
  FreeAndNil(Fntype);
  FreeAndNil(Fncode);
  inherited Destroy;
end;

constructor mtnIukluniResponseElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor mtnIukluniResponseElement.Destroy;
begin
  FreeAndNil(Fresult);
  inherited Destroy;
end;

constructor mtnKltypesElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor mtnKluniElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor mtnKlunihistoryElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor mtnSyslogElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor rcvUpdatecategbyidElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor rcvUpdatecategbyidElement.Destroy;
begin
  FreeAndNil(Fnid);
  inherited Destroy;
end;

constructor rcvUpdatecategbyidResponseElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor rcvUpdatecategbyidResponseElement.Destroy;
begin
  FreeAndNil(Fresult);
  inherited Destroy;
end;

constructor rcvUpdateklbyelementsElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor rcvUpdateklbyelementsResponseElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor rcvUpdateklbyelementsResponseElement.Destroy;
begin
  FreeAndNil(Fresult);
  inherited Destroy;
end;

constructor sndAteElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor sndIcdElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor sndKlbytypeElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor sndKlbytypeElement.Destroy;
begin
  FreeAndNil(Fntype);
  inherited Destroy;
end;

constructor sndKlcountElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor sndKlcountElement.Destroy;
begin
  FreeAndNil(Fntype);
  inherited Destroy;
end;

constructor sndKlcountResponseElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor sndKlcountResponseElement.Destroy;
begin
  FreeAndNil(Fresult);
  inherited Destroy;
end;

constructor sndKltypesElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor utlCodenextvalElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor utlCodenextvalElement.Destroy;
begin
  FreeAndNil(Ffoo);
  inherited Destroy;
end;

constructor utlCodenextvalResponseElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor utlCodenextvalResponseElement.Destroy;
begin
  FreeAndNil(Fresult);
  inherited Destroy;
end;

constructor utlGetklcountElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor utlGetklcountElement.Destroy;
begin
  FreeAndNil(Fextype);
  FreeAndNil(Fexcode);
  FreeAndNil(Fexver);
  inherited Destroy;
end;

constructor utlGetklcountResponseElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor utlGetklcountResponseElement.Destroy;
begin
  FreeAndNil(Fresult);
  inherited Destroy;
end;

constructor utlKlhistorycountElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor utlKlhistorycountElement.Destroy;
begin
  FreeAndNil(Fntype);
  FreeAndNil(Fncode);
  inherited Destroy;
end;

constructor utlKlhistorycountResponseElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor utlKlhistorycountResponseElement.Destroy;
begin
  FreeAndNil(Fresult);
  inherited Destroy;
end;

constructor utlParentateElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor utlParentateElement.Destroy;
begin
  FreeAndNil(Fntype);
  FreeAndNil(Fncode);
  inherited Destroy;
end;

constructor utlParentateResponseElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor utlParentateResponseElement.Destroy;
begin
  FreeAndNil(Fresult);
  inherited Destroy;
end;

constructor utlParenticdElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor utlParenticdElement.Destroy;
begin
  FreeAndNil(Fntype);
  FreeAndNil(Fncode);
  inherited Destroy;
end;

constructor utlParenticdResponseElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor utlTypenextvalElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor utlTypenextvalResponseElement.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor utlTypenextvalResponseElement.Destroy;
begin
  FreeAndNil(Fresult);
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(CCS_WS), 'http://admun_sv/CCS_WS.wsdl', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(CCS_WS), 'http://admun_sv/CCS_WS.wsdl/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(CCS_WS), ioDocument);
  InvRegistry.RegisterInvokeOptions(TypeInfo(CCS_WS), ioLiteral);
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'mtnHierarchkl', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'mtnIukltypes', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'mtnIukluni', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'mtnKltypes', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'mtnKluni', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'mtnKlunihistory', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'mtnSyslog', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'rcvUpdatecategbyid', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'rcvUpdateklbyelements', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'sndAte', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'sndIcd', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'sndKlbytype', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'sndKlcount', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'sndKltypes', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'utlCodenextval', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'utlGetklcount', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'utlKlhistorycount', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'utlParentate', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'utlParenticd', 'parameters1', 'parameters');
  InvRegistry.RegisterExternalParamName(TypeInfo(CCS_WS), 'utlTypenextval', 'parameters1', 'parameters');
  RemClassRegistry.RegisterXSClass(KlRecBase, 'http://admun_sv/CCS_WS.wsdl/types/', 'KlRecBase');
  RemClassRegistry.RegisterXSClass(KlRecUser, 'http://admun_sv/CCS_WS.wsdl/types/', 'KlRecUser');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(KlRecUser), 'type_', 'type');
  RemClassRegistry.RegisterXSClass(KlTypeRecBase, 'http://admun_sv/CCS_WS.wsdl/types/', 'KlTypeRecBase');
  RemClassRegistry.RegisterXSClass(KlTypeRecUser, 'http://admun_sv/CCS_WS.wsdl/types/', 'KlTypeRecUser');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(KlTypeRecUser), 'type_', 'type');
  RemClassRegistry.RegisterXSClass(KlHistoryRecBase, 'http://admun_sv/CCS_WS.wsdl/types/', 'KlHistoryRecBase');
  RemClassRegistry.RegisterXSClass(KlHistoryRecUser, 'http://admun_sv/CCS_WS.wsdl/types/', 'KlHistoryRecUser');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(KlHistoryRecUser), 'type_', 'type');
  RemClassRegistry.RegisterXSClass(SyslogRecBase, 'http://admun_sv/CCS_WS.wsdl/types/', 'SyslogRecBase');
  RemClassRegistry.RegisterXSClass(SyslogRecUser, 'http://admun_sv/CCS_WS.wsdl/types/', 'SyslogRecUser');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(SyslogRecUser), 'type_', 'type');
  RemClassRegistry.RegisterXSClass(mtnHierarchklElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'mtnHierarchklElement');
  RemClassRegistry.RegisterSerializeOptions(mtnHierarchklElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(mtnHierarchklResponseElement), 'http://admun_sv/CCS_WS.wsdl/types/', 'mtnHierarchklResponseElement');
  RemClassRegistry.RegisterSerializeOptions(TypeInfo(mtnHierarchklResponseElement), [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(mtnIukltypesElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'mtnIukltypesElement');
  RemClassRegistry.RegisterSerializeOptions(mtnIukltypesElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(mtnIukltypesResponseElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'mtnIukltypesResponseElement');
  RemClassRegistry.RegisterSerializeOptions(mtnIukltypesResponseElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(mtnIukluniElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'mtnIukluniElement');
  RemClassRegistry.RegisterSerializeOptions(mtnIukluniElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(mtnIukluniResponseElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'mtnIukluniResponseElement');
  RemClassRegistry.RegisterSerializeOptions(mtnIukluniResponseElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(mtnKltypesElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'mtnKltypesElement');
  RemClassRegistry.RegisterSerializeOptions(mtnKltypesElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(mtnKltypesResponseElement), 'http://admun_sv/CCS_WS.wsdl/types/', 'mtnKltypesResponseElement');
  RemClassRegistry.RegisterSerializeOptions(TypeInfo(mtnKltypesResponseElement), [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(mtnKluniElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'mtnKluniElement');
  RemClassRegistry.RegisterSerializeOptions(mtnKluniElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(mtnKluniResponseElement), 'http://admun_sv/CCS_WS.wsdl/types/', 'mtnKluniResponseElement');
  RemClassRegistry.RegisterSerializeOptions(TypeInfo(mtnKluniResponseElement), [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(mtnKlunihistoryElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'mtnKlunihistoryElement');
  RemClassRegistry.RegisterSerializeOptions(mtnKlunihistoryElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(mtnKlunihistoryResponseElement), 'http://admun_sv/CCS_WS.wsdl/types/', 'mtnKlunihistoryResponseElement');
  RemClassRegistry.RegisterSerializeOptions(TypeInfo(mtnKlunihistoryResponseElement), [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(mtnSyslogElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'mtnSyslogElement');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(mtnSyslogElement), 'type_', 'type');
  RemClassRegistry.RegisterSerializeOptions(mtnSyslogElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(mtnSyslogResponseElement), 'http://admun_sv/CCS_WS.wsdl/types/', 'mtnSyslogResponseElement');
  RemClassRegistry.RegisterSerializeOptions(TypeInfo(mtnSyslogResponseElement), [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(rcvUpdatecategbyidElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'rcvUpdatecategbyidElement');
  RemClassRegistry.RegisterSerializeOptions(rcvUpdatecategbyidElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(rcvUpdatecategbyidResponseElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'rcvUpdatecategbyidResponseElement');
  RemClassRegistry.RegisterSerializeOptions(rcvUpdatecategbyidResponseElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(rcvUpdateklbyelementsElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'rcvUpdateklbyelementsElement');
  RemClassRegistry.RegisterSerializeOptions(rcvUpdateklbyelementsElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(rcvUpdateklbyelementsResponseElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'rcvUpdateklbyelementsResponseElement');
  RemClassRegistry.RegisterSerializeOptions(rcvUpdateklbyelementsResponseElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(sndAteElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'sndAteElement');
  RemClassRegistry.RegisterSerializeOptions(sndAteElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(sndAteResponseElement), 'http://admun_sv/CCS_WS.wsdl/types/', 'sndAteResponseElement');
  RemClassRegistry.RegisterSerializeOptions(TypeInfo(sndAteResponseElement), [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(sndIcdElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'sndIcdElement');
  RemClassRegistry.RegisterSerializeOptions(sndIcdElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(sndIcdResponseElement), 'http://admun_sv/CCS_WS.wsdl/types/', 'sndIcdResponseElement');
  RemClassRegistry.RegisterSerializeOptions(TypeInfo(sndIcdResponseElement), [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(sndKlbytypeElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'sndKlbytypeElement');
  RemClassRegistry.RegisterSerializeOptions(sndKlbytypeElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(sndKlbytypeResponseElement), 'http://admun_sv/CCS_WS.wsdl/types/', 'sndKlbytypeResponseElement');
  RemClassRegistry.RegisterSerializeOptions(TypeInfo(sndKlbytypeResponseElement), [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(sndKlcountElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'sndKlcountElement');
  RemClassRegistry.RegisterSerializeOptions(sndKlcountElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(sndKlcountResponseElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'sndKlcountResponseElement');
  RemClassRegistry.RegisterSerializeOptions(sndKlcountResponseElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(sndKltypesElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'sndKltypesElement');
  RemClassRegistry.RegisterSerializeOptions(sndKltypesElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(sndKltypesResponseElement), 'http://admun_sv/CCS_WS.wsdl/types/', 'sndKltypesResponseElement');
  RemClassRegistry.RegisterSerializeOptions(TypeInfo(sndKltypesResponseElement), [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(utlCodenextvalElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'utlCodenextvalElement');
  RemClassRegistry.RegisterSerializeOptions(utlCodenextvalElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(utlCodenextvalResponseElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'utlCodenextvalResponseElement');
  RemClassRegistry.RegisterSerializeOptions(utlCodenextvalResponseElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(utlGetklcountElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'utlGetklcountElement');
  RemClassRegistry.RegisterSerializeOptions(utlGetklcountElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(utlGetklcountResponseElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'utlGetklcountResponseElement');
  RemClassRegistry.RegisterSerializeOptions(utlGetklcountResponseElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(utlKlhistorycountElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'utlKlhistorycountElement');
  RemClassRegistry.RegisterSerializeOptions(utlKlhistorycountElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(utlKlhistorycountResponseElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'utlKlhistorycountResponseElement');
  RemClassRegistry.RegisterSerializeOptions(utlKlhistorycountResponseElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(utlParentateElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'utlParentateElement');
  RemClassRegistry.RegisterSerializeOptions(utlParentateElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(utlParentateResponseElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'utlParentateResponseElement');
  RemClassRegistry.RegisterSerializeOptions(utlParentateResponseElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(utlParenticdElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'utlParenticdElement');
  RemClassRegistry.RegisterSerializeOptions(utlParenticdElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(utlParenticdResponseElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'utlParenticdResponseElement');
  RemClassRegistry.RegisterSerializeOptions(utlParenticdResponseElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(utlTypenextvalElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'utlTypenextvalElement');
  RemClassRegistry.RegisterSerializeOptions(utlTypenextvalElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(utlTypenextvalResponseElement, 'http://admun_sv/CCS_WS.wsdl/types/', 'utlTypenextvalResponseElement');
  RemClassRegistry.RegisterSerializeOptions(utlTypenextvalResponseElement, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(result, 'http://admun_sv/CCS_WS.wsdl/types/', 'result');
  RemClassRegistry.RegisterXSClass(result2, 'http://admun_sv/CCS_WS.wsdl/types/', 'result2', 'result');
  RemClassRegistry.RegisterXSClass(result3, 'http://admun_sv/CCS_WS.wsdl/types/', 'result3', 'result');
  RemClassRegistry.RegisterXSClass(result4, 'http://admun_sv/CCS_WS.wsdl/types/', 'result4', 'result');

end.