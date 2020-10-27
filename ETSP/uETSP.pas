// ЭЦП
unit uETSP;

interface

uses Windows,Classes,SysUtils,
     pkcs11t, pkcs11f;

type

  TETSP=class(TObject)
  private
    FNameLib: String;
    FLastError: String;
    FIsLoadFunctionList:Boolean;
    pFunctionList: CK_FUNCTION_LIST_PTR;
    ppFunctionList: CK_FUNCTION_LIST_PTR_PTR;
    GetFunctionList: TfC_GetFunctionList;
    procedure SetNameLib(const Value: String);
    procedure SetLastError(const Value: String);
    procedure CreateForAll;
  public
    DLL: THandle;
    Session: Cardinal;
    pApplication : CK_VOID_PTR;
    Notify : CK_NOTIFY;
    SlotId : CK_SLOT_ID;
    flags  : CK_FLAGS;
    TknInfo: CK_TOKEN_INFO;
    ClassObject : CK_OBJECT_CLASS;
    KeyType : CK_KEY_TYPE;
    property LastError:String read FLastError write SetLastError;
    property NameLib:String read FNameLib write SetNameLib;
    function LoadLib(strNameLib:String):Boolean;
    //-------------------------------------------
    function Initialize:Boolean;
    function Finalize:Boolean;
    function Login(strUserPinKod:String):Boolean;
    function OpenSession(strUserPinKod:String): Boolean;
    function GetTokenInfo: Boolean;
    function Find(ClassObject : CK_OBJECT_CLASS;KeyType : CK_KEY_TYPE) : CK_OBJECT_HANDLE;
    function SignWithHBelt(Data:String; Obj:CK_OBJECT_HANDLE; var sign : String; var len_sign : Cardinal) : Boolean;
    function VerifyWithHBelt(Data:String; Obj:CK_OBJECT_HANDLE; sign : String; len_sign : Cardinal) : Boolean;
    function GenerateRandom : String;
    function CloseSession: Boolean;
    //-------------------------------------------
    constructor Create(strNameLib:String); overload;
    constructor Create; overload;
    destructor Destroy; override;
  end;

var
  ETSP:TETSP;

const
{------------------------------------------------------
        CK_KEY_TYPE identifies a key type
 ------------------------------------------------------}
  CKK_RSA                               =	$00000000;
  CKK_DSA                               =	$00000001;
  CKK_DH                                =	$00000002;
  CKK_ECDSA                             =	$00000003;
  CKK_EC                                =	$00000003;
  CKK_X9_42_DH                          =	$00000004;
  CKK_KEA                               =	$00000005;
  CKK_GENERIC_SECRET                    =	$00000010;
  CKK_RC2                               =	$00000011;
  CKK_RC4                               =	$00000012;
  CKK_DES                               =	$00000013;
  CKK_DES2                              =	$00000014;
  CKK_DES3                              =	$00000015;
  CKK_CAST                              =	$00000016;
  CKK_CAST3                             =	$00000017;
  CKK_CAST5                             =	$00000018;
  CKK_CAST128                           =	$00000018;     { CAST128=CAST5 }
  CKK_RC5                               =	$00000019;
  CKK_IDEA                              =	$0000001A;
  CKK_SKIPJACK                          =	$0000001B;
  CKK_BATON                             =	$0000001C;
  CKK_JUNIPER                           =	$0000001D;
  CKK_CDMF                              =	$0000001E;
  CKK_AES                               =	$0000001F;
  CKK_BELT                              =	$00000020;//-----------------
  CKK_GOST                              =	$00000021;	//-----------------
  CKK_STB_11762_99_PRE_SIGN			=$00000022;	//-----------------
  CKK_STB_P_34_101_45_2011_BIGN_WITH_HBELT	=$00000023;	//-----------------
  CKK_VENDOR_DEFINED                     	=$80000000;
{------------------------------------------------------
        CK_ATTRIBUTE_TYPE identifies an attribute type
 ------------------------------------------------------}
  CKA_CLASS                              =	$00000000;
  CKA_TOKEN                              =	$00000001;
  CKA_PRIVATE                            =	$00000002;
  CKA_LABEL                              =	$00000003;
  CKA_APPLICATION                        =	$00000010;
  CKA_VALUE                              =	$00000011;
  CKA_OBJECT_ID                          =	$00000012;
  CKA_CERTIFICATE_TYPE                   =	$00000080;
  CKA_ISSUER                             =	$00000081;
  CKA_SERIAL_NUMBER                      =	$00000082;
  CKA_AC_ISSUER                          =	$00000083;
  CKA_OWNER                              =	$00000084;
  CKA_ATTR_TYPES                         =	$00000085;
  CKA_TRUSTED                            =	$00000086;
  CKA_KEY_TYPE                           =	$00000100;
  CKA_SUBJECT                            =	$00000101;
  CKA_ID                                 =	$00000102;
  CKA_SENSITIVE                          =	$00000103;
  CKA_ENCRYPT                            =	$00000104;
  CKA_DECRYPT                            =	$00000105;
  CKA_WRAP                               =	$00000106;
  CKA_UNWRAP                             =	$00000107;
  CKA_SIGN                               =	$00000108;
  CKA_SIGN_RECOVER                       =	$00000109;
  CKA_VERIFY                             =	$0000010A;
  CKA_VERIFY_RECOVER                     =	$0000010B;
  CKA_DERIVE                             =	$0000010C;
  CKA_START_DATE                         =	$00000110;
  CKA_END_DATE                           =	$00000111;
  CKA_MODULUS                            =	$00000120;
  CKA_MODULUS_BITS                       =	$00000121;
  CKA_PUBLIC_EXPONENT                    =	$00000122;
  CKA_PRIVATE_EXPONENT                   =	$00000123;
  CKA_PRIME_1                            =	$00000124;
  CKA_PRIME_2                            =	$00000125;
  CKA_EXPONENT_1                         =	$00000126;
  CKA_EXPONENT_2                         =	$00000127;
  CKA_COEFFICIENT                        =	$00000128;
  CKA_PRIME                              =	$00000130;
  CKA_SUBPRIME                           =	$00000131;
  CKA_BASE                               =	$00000132;
  CKA_PRIME_BITS                         =	$00000133;
  CKA_SUBPRIME_BITS                      =	$00000134;
  CKA_VALUE_BITS                         =	$00000160;
  CKA_VALUE_LEN                          =	$00000161;
  CKA_EXTRACTABLE                        =	$00000162;
  CKA_LOCAL                              =	$00000163;
  CKA_NEVER_EXTRACTABLE                  =	$00000164;
  CKA_ALWAYS_SENSITIVE                   =	$00000165;
  CKA_KEY_GEN_MECHANISM                  =	$00000166;
  CKA_MODIFIABLE                         =	$00000170;
  CKA_ECDSA_PARAMS                       =	$00000180;
  CKA_EC_PARAMS                          =	$00000180;
  CKA_EC_POINT                           =	$00000181;
  CKA_SECONDARY_AUTH                     =	$00000200;
  CKA_AUTH_PIN_FLAGS                     =	$00000201;
  CKA_HW_FEATURE_TYPE                    =	$00000300;
  CKA_RESET_ON_INIT                      =	$00000301;
  CKA_HAS_RESET                          =	$00000302;
  CKA_VENDOR_DEFINED                     =	$80000000;

  stb11762_sign				 =      $010000;
  stb11762pre_sign			 =      $010001;
  bign_with_hbelt			 =      $010002;

implementation

//---------------------------------------------------
procedure TETSP.CreateForAll;
begin
  ppFunctionList:=@pFunctionList;
  DLL:=0;
  Session:=0;
  pApplication:=nil;
  Notify:=nil;
  SlotId:=1;
  flags:=CKF_SERIAL_SESSION;
end;
//---------------------------------------------------
constructor TETSP.Create;
begin
  inherited Create;
  CreateForAll;
end;
//---------------------------------------------------
constructor TETSP.Create(strNameLib: String);
begin
  inherited Create;
  CreateForAll;
  LoadLib(strNameLib);
//  FIsLoadFunctionList:=false;
end;
//-----------------------------------------------------------------
destructor TETSP.Destroy;
begin
  inherited;
  if DLL<>0 then FreeLibrary(DLL);
end;
//-------------------------------------------------------------
function TETSP.LoadLib(strNameLib:String):Boolean;
begin
  Result:=true;
  FIsLoadFunctionList:=false;
  if DLL<>0 then begin
    FreeLibrary(DLL);
    DLL:=0;
  end;
  DLL:=LoadLibrary(PAnsiChar(strNameLib));
  if DLL=0 then begin
    FLastError:=SysErrorMessage(GetLastError);
    Result:=false;
  end else begin
    //------------- GetFunctionList --------------
    try
      GetFunctionList:=GetProcAddress(DLL, 'C_GetFunctionList');
      GetFunctionList(ppFunctionList);
      FIsLoadFunctionList:=true;
    except
      on E:Exception do begin
        FLastError:='GetFunctionList: '+E.Message;
        FIsLoadFunctionList:=false;
        Result:=false;
      end;
    end;
  end;
end;
//-----------------------------------------------------------------
procedure TETSP.SetLastError(const Value: String);
begin
  FLastError := Value;
end;
//-----------------------------------------------------------------
procedure TETSP.SetNameLib(const Value: String);
begin
  FNameLib := Value;
  LoadLib(FNameLib);
end;

//-----------------------------------------------------------------
function TETSP.Initialize:Boolean;
begin
  FLastError:='';
  Result:=true;
  try
    pFunctionList^.C_Initialize(nil);
  except
    on E:Exception do begin
      FLastError:='C_Initialize: '+E.Message;
      Result:=false;
    end;
  end;
end;
//-----------------------------------------------------------------
function TETSP.Finalize:Boolean;
begin
  FLastError:='';
  Result:=true;
  try
    pFunctionList^.C_Finalize(nil);
  except
    on E:Exception do begin
      FLastError:='C_Finalize: '+E.Message;
      Result:=false;
    end;
  end;
end;
//-----------------------------------------------------------------
function TETSP.OpenSession(strUserPinKod:String): Boolean;
begin
  FLastError:='';
  Result:=false;
  try
    if (pFunctionList^.C_OpenSession(slotID, flags, pApplication, Notify, @Session) = 0) then begin
      Result:=true;
    end else begin
      FLastError:='Сессия не открыта';
    end;
  except
    on E:Exception do begin
      FLastError:='C_OpenSession: '+E.Message;
    end;
  end;
  if Result and (strUserPinKod<>'') then begin
    Result:=Login(strUserPinKod);
  end;
end;
//-----------------------------------------------------------------
function TETSP.Login(strUserPinKod: String): Boolean;
begin
  FLastError:='';
  Result:=false;
  try
    if (pFunctionList^.C_Login(Session, 1, CK_UTF8CHAR_PTR(PChar(strUserPinKod)), Length(strUserPinKod)) = 0) then begin
      Result:=true;
    end;
  except
    on E:Exception do begin
      FLastError:='C_Login: '+E.Message;
    end;
  end;
end;
//-----------------------------------------------------------------
function TETSP.GetTokenInfo: Boolean;
begin
  FLastError:='';
  Result:=false;
  try
    if (pFunctionList^.C_GetTokenInfo(SlotID, @TknInfo) = 0) then begin
      Result:=true;
    end;
  except
    on E:Exception do begin
      FLastError:='C_GetTokenInfo: '+E.Message;
    end;
  end;
end;
//-----------------------------------------------------------------
function TETSP.Find(ClassObject : CK_OBJECT_CLASS;KeyType : CK_KEY_TYPE) : CK_OBJECT_HANDLE;
var
  attr: array[1..2] of CK_ATTRIBUTE;
  tmp : Cardinal;
  Obj : CK_OBJECT_HANDLE;
begin
//  ClassObject := CKO_PRIVATE_KEY;
//	KeyType     := CKK_STB_P_34_101_45_2011_BIGN_WITH_HBELT; //CKK_STB_P_34_101_45_2011_BIGN_WITH_HBELT, CKK_STB_11762_99_PRE_SIGN;
  Obj:=0;
  with attr[1] do begin
    _type  := CKA_CLASS;
    pValue := @ClassObject;
    ulValueLen := sizeof(ClassObject);
  end;

  with attr[2] do begin
    _type  := CKA_KEY_TYPE;
    pValue := @KeyType;
    ulValueLen := sizeof(KeyType);
  end;
  try
    if (pFunctionList^.C_FindObjectsInit(Session, @attr, 2) = CKR_OK) then begin

      if (pFunctionList^.C_FindObjects(Session, @Obj, 1, @tmp) = CKR_OK) then begin

        if (pFunctionList^.C_FindObjectsFinal(Session) = CKR_OK) then begin

        end;

      end;
    end;
  except
    on E:Exception do begin
      FLastError:='C_Find: '+E.Message;
    end;
  end;
  Result:=Obj;
end;

//----------------------------------------------------------------------------------------
function TETSP.SignWithHBelt(Data:String; Obj:CK_OBJECT_HANDLE; var sign : String; var len_sign : Cardinal) : Boolean;
var
  sign_: array[0..1023] of char;
  len_data : Cardinal;
  mechanism: CK_MECHANISM;
  i:Integer;
begin
  Result:=false;
  sign:='';
  FillChar(sign_,1024,#0);
  mechanism.mechanism := bign_with_hbelt;
  try
    if (pFunctionList^.C_SignInit(Session, @mechanism, Obj) = 0) then begin
      len_data := Length(Data); // sizeof(CBC_IVec);
      len_sign := 1024;
      if (pFunctionList^.C_Sign(Session, CK_BYTE_PTR(Data), len_data, @sign_, @len_sign) = 0) then  begin
        SetLength(sign, len_sign);
//        for i:=1 to len_sign do begin
//          sign[i]:=' ';
//        end;
//        Move(sign_[1], sign[1], Length(sign) * SizeOf(Char));
        for i:=0 to len_sign-1 do begin
          sign[i+1]:=sign_[i];
        end;
        Result:=true;
      end;
    end
  except
    on E:Exception do begin
      FLastError:='C_Sing: '+E.Message;
    end;
  end;
end;

//----------------------------------------------------------------------------------------
function TETSP.VerifyWithHBelt(Data:String; Obj:CK_OBJECT_HANDLE; sign : String; len_sign : Cardinal) : Boolean;
var
//  sign_: array[1..1024] of char;
  len_data : Cardinal;
  mechanism: CK_MECHANISM;
begin
  Result:=false;
  mechanism.mechanism := bign_with_hbelt;
  try
    if (pFunctionList^.C_VerifyInit(Session, @mechanism, Obj) = 0) then begin
      len_data := Length(Data); // sizeof(CBC_IVec);
      if (pFunctionList^.C_Verify(Session, CK_BYTE_PTR(Data), len_data, @sign, len_sign) = 0) then  begin
        Result:=true;
      end;
    end;
  except
    on E:Exception do begin
      FLastError:='C_Verify: '+E.Message;
    end;
  end;
end;

//------------------	C_GenerateRandom	----------------------------------------
function TETSP.GenerateRandom : String;
var
  rand_data: array[1..32] of char;
  len_rand:Cardinal;
begin
  Result:='';
  len_rand := 32;
  try
    if (pFunctionList^.C_GenerateRandom(Session, @rand_data, len_rand) = 0) then begin
      Result:=rand_data;
    end;
  except
    on E:Exception do begin
      FLastError:='C_GenerateRandom: '+E.Message;
    end;
  end;
end;
//-----------------------------------------------------------------------------
function TETSP.CloseSession: Boolean;
begin
  Result:=false;
  try
    if (pFunctionList^.C_CloseSession(Session) = 0) then begin
      Result:=true;
    end;
  except
    on E:Exception do begin
      FLastError:='C_CloseSession: '+E.Message;
    end;
  end;
end;

initialization
  ETSP:=nil;
finalization
  if ETSP<>nil then FreeAndNil(ETSP);

end.
