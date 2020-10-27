unit Crypto_Classes;

interface

uses AvCryptMail, SysUtils, Windows, msxml2_tlb, U_AvestConst, SOO_Consts, Classes, XMLDoc,
{$IFDEF USE_CODESITE} CodeSiteLogging, {$ENDIF}
  CLS_AUDIT, generics.collections;

const
  csAvCryptMailDefErrMsg = 'Ошибка AvCryptMail. Код ошибки: %d';
  csActionUserCancelled = 3895066935;
  csErrorCERExists = AVCMR_ALREADY_EXISTS;
  csPublisherCertNotExists = 3895066895;
  csErrorCRLNotExists = 3895066903;
  csNKINotExists = 3895066925;
  csSertRevoke = 3895066928;
  csSertSuspend = 3895066951;
  csCertListForEncryptIsEmpty = 4000000001;

type
  EAvCryptMailException = class(Exception)
  strict private
    FErrorCode: Cardinal;
  public
    constructor Create(const AErrorCode: Cardinal;
      const AErrorMessage: string); overload;
    property ErrorCode: Cardinal read FErrorCode write FErrorCode;
  end;
  TUNPPublisherType = (unpNotDefined, unpRUC, unpMNS, unpAttrCert);

  TSignPersonInfo = record
    OrgName: string;
    FirstName: string;
    LastName: string;
    Department: string;
    Position: string;
    PublicKey: string;
    CodeUNP: string;
    UNPOID: string;
    EMAIL: string;
    DNSIDAttr: string;
    function ToString: string;
  end;

  {$REGION 'Значение атрибутного сертификата'}
  ///	<summary>Значение атрибутного сертификата</summary>
  {$ENDREGION}
  TAttrCertValue = record

    {$REGION 'OID атрибута'}
    ///	<summary>OID атрибута</summary>
    {$ENDREGION}
    AttrOID: string;
    {$REGION 'Наименование значение (как правило повторение OID, но не всегда !!!)'}
    ///	<summary>Наименование значение (как правило повторение OID)</summary>
    {$ENDREGION}
    AttrName: string;
    {$REGION 'Значение атрибута'}
    ///	<summary>Значение атрибута</summary>
    {$ENDREGION}
    AttrValue: string;
  end;

  {$REGION 'Сведения из атрибутного сертификата'}
  ///	<summary>Сведения из атрибутного сертификата</summary>
  {$ENDREGION}
  TAttrCertInfo = class

    {$REGION 'Открытый хэндл используемый в библиотеках Авест'}
    ///	<summary>Открытый хэндл используемый в библиотеках Авест</summary>
    {$ENDREGION}
    CertHandle: AvCmHcert;

    {$REGION 'Серийный номер'}
    ///	<summary>Серийный номер</summary>
    {$ENDREGION}
    SerialNum: string;

    {$REGION 'Активен С'}
    ///	<summary>Активен С</summary>
    {$ENDREGION}
    ActiveFrom: TDateTime;

    {$REGION 'Активен ПО'}
    ///	<summary>Активен ПО</summary>
    {$ENDREGION}
    ActiveTo: TDateTime;
  private
    FAttrValList: TDictionary<string, TAttrCertValue>;
  public
    constructor Create;
    destructor Destroy; override;

    {$REGION 'Список значений атрибутов сертификата'}
    ///	<summary>Список значений атрибутов сертификата</summary>
    ///	<remarks>Индексация массива по OID атрибутов</remarks>
    {$ENDREGION}
    property AttrValList: TDictionary<string, TAttrCertValue> read FAttrValList;
  end;

  TLogInfoFunc = procedure(const aMsg: string) of object;

  {$REGION 'Класс содержит информацию о УНП и дополнительным атрибутам пользователя на ...'}
  ///	<summary>Класс содержит информацию о УНП и дополнительным атрибутам
  ///	пользователя на основании сведений из сертификата.</summary>
  {$ENDREGION}
  TCertExtInfo = class
  private
    FUNPPublisherType: TUNPPublisherType;
    FUNPList: TList<string>;
    FAttrCertList: TDictionary<string, TAttrCertInfo>;
    FLogFunc: TLogInfoFunc;
    procedure SetLogFunc(const Value: TLogInfoFunc);
  strict protected
  protected
    {$REGION 'Заполнение данных сертификата из сертификата, которым осуществлен вход в ...'}
    ///	<summary>Заполнение данных сертификата из сертификата, которым
    ///	осуществлен вход в ПО КЗИ</summary>
    {$ENDREGION}
    procedure FillFromLoginSession(const FLoginHandle: AvCmHc);

    {$REGION 'Заполнение данных сертификата из сертификата, которым осуществлено подпис...'}
    ///	<summary>Заполнение данных сертификата из сертификата, которым
    ///	осуществлено подписание ЭЦП</summary>
    {$ENDREGION}
    procedure FillFromCert(const FLoginHandle: AvCmHc; const FCertHandle: AvCmHc; FMsgHandle: AvCmHmsg);

    {$REGION 'Заполнение данных сертификата (только УНП) по заданным значениям'}
    ///	<summary>Заполнение данных сертификата (только УНП) по заданным
    ///	значениям</summary>
    {$ENDREGION}
    procedure FillFromCertVal(const UNPCode: string; const UNPPublisher: TUNPPublisherType);
  public
    constructor Create;
    destructor Destroy; override;

    {$REGION 'Очистка данных по атрибутным сертификатам пользователя.'}
    ///	<summary>Очистка данных по атрибутным сертификатам
    ///	пользователя.</summary>
    {$ENDREGION}
    procedure ClearAttrCertList;

    {$REGION 'Поиск атрибутного сертификата пользователя по заданному УНП'}
    ///	<summary>Поиск атрибутного сертификата пользователя по заданному
    ///	УНП</summary>
    {$ENDREGION}
    function GetCertByCodeUNP(const CodeUNP: string): AvCmHCert;

    function GetSNByCodeUNP(const CodeUNP: string): string;
    procedure LogMsg(const aMessage: string);
    {$REGION 'Список атрибутных сертификатов пользователя'}
    ///	<summary>Список атрибутных сертификатов пользователя</summary>
    {$ENDREGION}
    property AttrCertList: TDictionary<string, TAttrCertInfo> read FAttrCertList;
    property LogFunc: TLogInfoFunc read FLogFunc write SetLogFunc;

    {$REGION 'Список найденных кодов УНП во всех сертификатах'}
    ///	<summary>Список найденных кодов УНП во всех сертификатах</summary>
    {$ENDREGION}
    property UNPList: TList<string> read FUNPList;

    {$REGION 'Тип источника кодов УНП в сертификате. МНС РУЦ переходный РУЦ атрибутные ...'}
    ///	<summary>
    ///	  Тип источника кодов УНП в сертификате.
    ///	  <list type="bullet">
    ///	    <item>МНС</item>
    ///	    <item>РУЦ переходный</item>
    ///	    <item>РУЦ атрибутные</item>
    ///	    <item>Неопределен (УНП отсутствует)</item>
    ///	  </list>
    ///	</summary>
    {$ENDREGION}
    property UNPPublisherType: TUNPPublisherType read FUNPPublisherType write
        FUNPPublisherType;
  end;

  TCryptMain = class(TObject)
  strict private
    FAuditProvider: TEISGSAudit;
    /// <summary>TCryptMain.FHc
    /// Указатель инициализированной библиотеки криптофункций
    /// </summary>
    /// type:AvCmHc
    FHc: AvCmHc;
    FIsLogged: Boolean;
    /// <summary>
    /// Информация из сертификата о его владельце
    /// </summary>
    /// type:TSignPersonInfo
    FLoggedPersonInfo: TSignPersonInfo;
{$REGION 'Указатель библиотеки формирования хэша'}
    /// <summary>Указатель библиотеки формирования хэша</summary>
{$ENDREGION}
//    FHashDLLHandle: THandle;
//    AvGetHashStrOfFile: function(FileName: PChar; ResStr: Pointer;
//      out RealSize: DWORD): LongInt; stdcall;
    FPathName: ansistring;

    function CheckLoggedPersonValid: Boolean;
    procedure FillLoggedPersonInfo;
    function GetCertAttribAsString(const HCert: AvCmHcert;
      AttribName: AnsiString; DefValue: AnsiString = '';
      const IsExtendedAttrib: Boolean = False): AnsiString;
    function HexToStr(AInputStr: AnsiString): AnsiString;
    procedure InitParams;
    procedure StoreLoggedPersonToAttr(XMLElem: IXMLDOMElement);
    /// <summary>TCryptMain.ImportCertsInRepository Импорт сертификатов и СОС в
    /// хранилище
    /// </summary>
    procedure LogMessage(EvntMessType, UserCategoryID, UserEventID: Integer;
      UserMessages: array of string);
    procedure LogPreDefinedMessage(EvntMessType, UserCategoryID,
      UserEventID: Integer);
{$REGION 'Инициализация библиотеки AvHashSTB.dll для вычисления хэш суммы по СТБ.'}
    /// <summary>Инициализация библиотеки AvHashSTB.dll для вычисления хэш суммы по СТБ.</summary>
{$ENDREGION}
    function StrToHEX(InputString: AnsiString): AnsiString;
  private
    FIsLibrarySupportAttrCert: Boolean;
    FLogFunc: TLogInfoFunc;
    FLoggedCertExtInfo: TCertExtInfo;
    function GetAvestDLLVersion: string;
    function GetUNPPublisher: TUNPPublisherType;
    procedure SetLogFunc(const Value: TLogInfoFunc);
  public
    AvGetHashStrOfMemory: function(BuffPointer: PUCHAR; BuffSize: DWORD;
      ResStr: Pointer; out RealSize: DWORD): LongInt; stdcall;
    procedure ImportCertsInRepository(AStream: TMemoryStream;
      const ATypeCert: Cardinal);
    constructor Create; overload;
    constructor Create(const ADllFullName: string); overload;
    destructor Destroy; override;
    procedure AddHashToTemplate(const SourceDoc: IXMLDOMDocument2);
    class function CheckInstallAvestDll(const ADllFullName: string): Boolean;
    /// <summary>TCryptMain.ValidCodeUNPLoggedUser Проверка кода УНП в сертификате
    /// пользователя, инициализировавшего библиотеку криптопровайдера.
    /// </summary>
    /// <returns> Boolean
    /// </returns>
    function ValidCodeUNPLoggedUser: Boolean;
    function CheckXMLDocSignCorrectly(const DocForSign: IXMLDOMDocument2;
      out ErrCode: TTicketErrorCode; out ErrMessage: string;
      PathToSignBody: string; out FoundedCodeUNP: string): Boolean;
    /// <summary>TCryptMain.DecryptDocFromStream Дешифрует зашифрованный документ из
    /// потока и возвращает результат во входной поток.
    /// </summary>
    /// <returns> Boolean
    /// </returns>
    /// <param name="ADocAsStream"> (TMemoryStream) </param> Поток зашифрованного
    /// документа который необходимо дешифровать.
    /// <param name="ErrMessage"> (string) </param> Текст ошибки
    /// <param name="RaiseIfError"> (Boolean) </param> Поднимать исключение, если
    /// произошла ошибка.
    function DecryptDocFromStream(const ADocAsStream: TStream;
      const AOutStream: TMemoryStream; out ErrMessage: string;
      const RaiseIfError: Boolean = True): Boolean;
    /// <summary>TCryptMain.DeleteSignInfo Удаляет из XML документа тег с ЭЦП (
    /// SignInfoElement), если он есть и нормализует документ.
    /// </summary>
    function DeleteSignInfo(const AXMLDoc: IXMLDOMDocument2;
      const ASignInfoNodePath: string): IXMLDOMDocument2;
    procedure ShowDlgAboutObject(const AXMLDoc: IXMLDOMDocument2; const APathToSignBody: String; const AHOwner: hwnd; const
        AVerifySign: Boolean = True);
    function EncryptText(var AText: AnsiString; out ErrMessage: string): Boolean;
    /// <summary>TCryptMain.SignAndEncryptXMLDoc Подписывает и зашифровывает документ,
    /// переданный в ADocForSign.
    /// </summary>
    /// <returns> Boolean
    /// </returns>
    /// <param name="ADocForSign"> (IXMLDOMDocument2) Документ для подписи и
    /// зашифровывания.</param>
    /// <param name="ASignInfoNodePath"> (string) Элемент XML документа, указывающий
    /// где храниться ЭЦП документа.</param>
    /// <param name="OutDocAsAnsiString"> (AnsiString) Строковое представление
    /// подписанного и зажифрованного документа.</param>
    function SignAndEncryptXMLDoc(const ADocForSign: IXMLDOMDocument2;
      const ASignInfoNodePath: string; out OutDocAsAnsiString: AnsiString)
      : Boolean;
    /// <summary>TCryptMain.GetCertListForEncrypt Создает список сертификатов для
    /// шифрования
    /// </summary>
    /// <returns> AvCmHcertEnum Указатель на список сертификатов
    /// </returns>
    function GetCertListForEncrypt: AvCmHcertEnum;
    function GetBeginDateCRL: TDateTime;
    /// <summary>TCryptMain.Login - Авторизация пользователя (открытие сессии) Функция
    /// AvCmLogin предназначена для авторизации пользователя для дальнейшей работы с
    /// библиотекой.
    /// <returns> Boolean
    /// </returns>
    /// </summary>
    procedure Login(const IsCheckHaveCodeUNP: Boolean = false); overload;
    /// <summary>TCryptMain.Login - Авторизация пользователя (открытие сессии) Функция
    /// AvCmLogin предназначена для авторизации пользователя для дальнейшей работы с
    /// библиотекой.
    /// !!! Устаревшая
    /// <param name="ErrMessage"> (string) </param>
    /// <returns> Boolean
    /// </returns>
    /// </summary>
    function Login(out ErrMessage: string): Boolean; overload;
    procedure Flush;
    class function DllPath: string;
    function Logout(out ErrMessage: string): Boolean; overload;
    /// <summary> TCryptMain.ReadCertSerialNumberFromFile <para>
    /// Возвращает серийный номер сертификата из указанного файла.
    /// Инициализация библиотеки не обязательна.
    /// </para>
    /// </summary>
    /// <returns> string - Серийный номер СОК
    /// </returns>
    /// <param name="AFileName"> (string) - Файл с СОК в формате CER </param>
    function ReadCertSerialNumberFromFile(AFileName: string): string;
    function GetSignerInfo(const SignedDoc: IXMLDOMDocument2;
      PathToSignBody: string; SignerInfo: TSignPersonInfo;
      out ErrMessage: string): Boolean;
    function GetXMLDocAsStreamWithEncoding(const AXMLDoc: IXMLDOMDocument2): TMemoryStream;
    procedure ImportCertListInRepository(AStream: TMemoryStream);
    procedure ImportCRLInRepository(AStream: TMemoryStream);
    procedure ImportCERInRepository(AStream: TMemoryStream);

    {$REGION 'IsLoggedHaveAttrCerts'}
    ///	<summary>Проверяет содержит ли сертификат, которым авторизовался
    ///	пользователь в ПО КЗИ, атрибутные сертификаты.</summary>
    ///	<exception cref="">Вход не выполнен.</exception>
    {$ENDREGION}
    function IsLoggedHaveAttrCerts: Boolean;
    procedure LoginWithoutAuthorization;
    procedure LogMsg(const aMessage: string);
    procedure LogMsgFmt(const aMessage: string; Vals: array of const);
    function SignXMLDoc(const ADocForSign: IXMLDOMDocument2;
      const ASignInfoNodePath: string; out OutDocAsAnsiString: AnsiString;
      out ErrMessage: string): Boolean;
    function TestSign(out AErrMessage: string): Boolean;
    property AuditProvider
      : TEISGSAudit read FAuditProvider write FAuditProvider;
    /// <summary>TCryptMain.IsLogged
    /// <para>Признак успешного логина в библиотеку</para>
    /// </summary>
    /// type:Boolean
    property IsLogged: Boolean read FIsLogged;
    property LogFunc: TLogInfoFunc read FLogFunc write SetLogFunc;
    property AvestDLLVersion: string read GetAvestDLLVersion;
    property IsLibrarySupportAttrCert: Boolean read FIsLibrarySupportAttrCert;
    property LoggedCertExtInfo: TCertExtInfo read FLoggedCertExtInfo;
    /// <summary>
    /// Информация из сертификата о его владельце
    /// </summary>
    /// type:TSignPersonInfo
    property LoggedPersonInfo: TSignPersonInfo read FLoggedPersonInfo;
    property UNPPublisher: TUNPPublisherType read GetUNPPublisher;
  end;

/// <summary>CheckMsg Проверка кода возврата функции из библиотеки
/// Авеста. При возникновении ошибочной ситуации возникает исключение с соотв.
/// текстом сообщения.
/// <param name="ErrCode"> (DWORD) </param>
/// </summary>
procedure CheckMsg(const ErrCode: Cardinal);

/// <summary>GetMsg Проверка кода возврата функции из библиотеки
/// Авеста. При возникновении ошибочной ситуации возвращает соотв.
/// текст сообщения.
/// <param name="ErrCode"> (DWORD) </param>
/// </summary>
function GetMsg(const ErrCode: Cardinal): string;

const
  // csValidSOODomainName = 'www.belstat.by';
{В связи с введением OID-ов согласно СТБ 34.101.50 некоторые поля в сертификатах теперь будут кодироваться по-новому:
В сертификате юр. лица:
2.5.4.10=Наименование организации - владельца открытого ключа
2.5.4.6=Код страны
2.5.4.8=Область
2.5.4.7=Населенный пункт
2.5.4.9=Адрес
1.2.112.1.2.1.1.1.1.2=Уникальный номер налогоплательщика
2.5.4.11=Подразделение
2.5.4.12=Должность
2.5.4.4=Фамилия
2.5.4.41=И.О.
1.2.840.113549.1.9.1=Адрес электронной почты
В сертификате физ. лица:
2.5.4.4=Фамилия
2.5.4.41=И.О.
2.5.4.6=Страна
1.2.112.1.2.1.1.1.1.1=Данные из документа, удостоверяющего личность
2.5.4.8=Область
2.5.4.7=Населенный пункт
2.5.4.9=Адрес
1.2.112.1.2.1.1.5.1=Место работы и должность
1.2.112.1.2.1.1.5.2=Подразделение (необязательное присутствие)}
  csSignDataNodeName = 'SignData';
  csSignInfoNodeName = 'SignInfo';
  csHashInfoNodeName = 'HASH_DOC';
  csNewLine = #13#10;
  csCertPosition_MNS = '1.3.6.1.4.1.12656.5.1';
  csCertPosition_RUC = '2.5.4.12';
  csCertDepartmentName = '2.5.4.11';
  csCertOrgName = '2.5.4.10';
  csCertFirstName = '2.5.4.41';
  csCertLastName = '2.5.4.4';
  csCertPublicKey = '2.5.29.14';
  cstValidLengthCodeUNP = 9;
  // csCodeUNP = '1.3.6.1.4.1.12656.4.1';
  csCodeUNP_MNS = '1.3.6.1.4.1.12656.106.101';
  //1.2.112.1.2.1.1.1.1.2=Уникальный номер налогоплательщика
  csCodeUNP_RUC = '1.2.112.1.2.1.1.1.1.2';
  csCertEMAIL = '1.2.840.113549.1.9.1';
  //  2.5.4.3=Имя DNS (ID устройства или процесса)
  csDNSIDAttr = '2.5.4.3';
//  csValidDNSIDStrForSOO = '_TEST_http://www.belstat.gov.by/SOO';
//  csValidDNSIDStrForSOO = 'www.soo.belstat.gov.by;www.rsoo.belstat.gov.by';
  csGosSUOKCertEmail = 'rca@pki.gov.by';
//  csValidDNSIDStrForSOO = '_TEST_http://www.belstat.gov.by/SOO;www.soo.belstat.gov.by;www.rsoo.belstat.gov.by';
  csDNSDelimeter = ';';
  // До 29.06.2015
  // csValidSOOEMAILForSOO = 'www.belstat.gov.by';
  // С 29.06.2015
  //csValidSOOEMAILForSOO = 'belstat@belstat.gov.by;belstat@mail.belpak.by;www.belstat.gov.by';
  // С 01.03.2018
{$IFDEF DEBUG}
  csValidSOOEMAILForSOO = 'provolotski@gmail.com;belstat@belstat.gov.by';
{$ELSE}
  csValidSOOEMAILForSOO = 'belstat@belstat.gov.by';
{$ENDIF}
implementation

uses
  Dialogs, StrUtils, Registry, IOUtils, XMLIntf, xmldom, U_AuditConsts, AvHash;

const
  ciNotSupported = 3895066918;

constructor TCryptMain.Create;
begin
  inherited Create;
  InitParams;
end;

constructor TCryptMain.Create(const ADllFullName: string);
begin
  inherited Create;
  FPathName := ExtractFilePath(ADllFullName);
  InitParams;
end;

destructor TCryptMain.Destroy;
var
  ErrMsg: string;
begin
  if IsLogged then
    Logout(ErrMsg);
  FreeAndNil(FLoggedCertExtInfo);

  if FPathName = EmptyStr then
    CheckMsg(AvCmInit(AVCMF_SHUTDOWN))
  else
    CheckMsg(AvCmInitEx(PChar(FPathName), AVCMF_SHUTDOWN));
end;

procedure TCryptMain.AddHashToTemplate(const SourceDoc: IXMLDOMDocument2);
var
  ErrStr: string;
  MemStream: TMemoryStream;
  FHashString: String;
  HashElement: IXMLDOMElement;
begin
  MemStream := GetXMLDocAsStreamWithEncoding(SourceDoc);
  try
    // и получаем значение Хэша как строку
    if not GetStreamAvHash(MemStream, FHashString, ErrStr) then
      raise Exception.Create(ErrStr);
    // Создаем новый элемент сод. подпись и инф. о ней
    HashElement := SourceDoc.createElement(csHashInfoNodeName);
    SourceDoc.documentElement.appendChild(HashElement);
    HashElement.text := FHashString;
  finally
    HashElement := nil;
    FreeAndNil(MemStream);
  end;
end;

class function TCryptMain.CheckInstallAvestDll(const ADllFullName: string): Boolean;
begin
  // Define !!!! AVCRYPTMAIL_DYNAMIC
  if not DLLLoaded then
    AvCryptMail.LoadAvCryptMailDLL(ExtractFilePath(ADllFullName) + AVCRYPTMAIL_NAME_DLL);

  Result := DLLLoaded;
end;

function TCryptMain.CheckLoggedPersonValid: Boolean;
var
  StrParser: TStringList;
  i: Integer;
  SourceStr,
  FieldStr: String;
begin
  Result := False;
  case UNPPublisher of
    unpMNS:
      begin
        SourceStr := csValidSOOEMAILForSOO;
        FieldStr := UpperCase(Trim(FLoggedPersonInfo.EMAIL));
      end
    else
      begin
        SourceStr := csValidDNSIDStrForSOO;
        FieldStr := UpperCase(Trim(FLoggedPersonInfo.DNSIDAttr));
      end;
  end;

  StrParser := TStringList.Create;
  try
    StrParser.Delimiter := csDNSDelimeter;
    StrParser.DelimitedText := SourceStr;
    for i := 0 to StrParser.Count - 1 do
    begin
      Result := FieldStr = UpperCase(Trim(StrParser[i]));
      if Result then
        Break;
    end;
  finally
    StrParser.Free;
  end;
end;

procedure CheckMsg(const ErrCode: Cardinal);
var
  S: AnsiString;
  W: Cardinal;
begin
  if ErrCode <> AVCMR_SUCCESS then
  begin
    AvCmGetErrorInfo(nil, ErrCode, AVCM_SHORT_STRING, Nil, W, 0);
    SetLength(S, W - 1);
    AvCmGetErrorInfo(nil, ErrCode, AVCM_SHORT_STRING, @S[1], W, 0);
    raise EAvCryptMailException.Create(ErrCode, S);
  end
end;

function GetMsg(const ErrCode: Cardinal): string;
var
  S: AnsiString;
  W: Cardinal;
begin
  if ErrCode <> AVCMR_SUCCESS then
  begin
    AvCmGetErrorInfo(0, ErrCode, AVCM_SHORT_STRING, Nil, W, 0);
    SetLength(S, W - 1);
    AvCmGetErrorInfo(0, ErrCode, AVCM_SHORT_STRING, @S[1], W, 0);
    Result := WideString(s);
  end
  else
    Result := EmptyStr;
end;

function TCryptMain.ValidCodeUNPLoggedUser: Boolean;
begin
  Result := (Length(FLoggedPersonInfo.CodeUNP) = cstValidLengthCodeUNP)
    or (LoggedCertExtInfo.UNPList.Count > 0);
end;

function TCryptMain.CheckXMLDocSignCorrectly
  (const DocForSign: IXMLDOMDocument2; out ErrCode: TTicketErrorCode;
  out ErrMessage: string; PathToSignBody: string;
  out FoundedCodeUNP: string): Boolean;
var
  SignHEXBody: AnsiString;
  SSign: AnsiString;
  ClearDoc: IXMLDOMDocument2;
  DocAsMemStream: TMemoryStream;
  NodeWithSign: IXMLDOMNode;
  hmsg: AvCmHmsg;
  ishmsgInited: Boolean;
  hSign: AvCmHandle;
  ishSignInited: Boolean;
  HCert: AvCmHcert;
  ishcertInited: Boolean;
  K: DWORD;
  W: DWORD;
  SignerCertInfo: TCertExtInfo;
  I: Integer;
begin
  {$IFDEF USE_CODESITE}CodeSite.TraceMethod(Self, 'CheckXMLDocSignCorrectly', tmoTiming);{$ENDIF}
  Result := False;
  ishmsgInited := False;
  ishSignInited := False;
  ishcertInited := False;
  // Пытаемся извлечь подпись
  NodeWithSign := DocForSign.documentElement.selectSingleNode(PathToSignBody + '/' + csSignDataNodeName);
  try
    try
      if not Assigned(NodeWithSign) then
      begin
        ErrMessage := rsNoECPInDocument;
        LogMessage(EVENTLOG_ERROR_TYPE, ciaCatError, ciaErrorProcessingIncomeDoc, [ErrMessage]);
        Exit(False);
      end;
      SignHEXBody := NodeWithSign.text;
      NodeWithSign := nil;
      SSign := HexToStr(SignHEXBody);
      // Вычищаем от подписи документ
      ClearDoc := DeleteSignInfo(DocForSign, PathToSignBody);
      try
        DocAsMemStream := GetXMLDocAsStreamWithEncoding(ClearDoc);
        try
          CheckMsg(AvCmOpenMsg(FHc, @SSign[1], Length(SSign), hmsg, AVCMF_IN_PKCS7));
          ishmsgInited := True;
          CheckMsg(AvCmSetMsgContent(hmsg, DocAsMemStream.Memory, DocAsMemStream.Size, 0));
        finally
          DocAsMemStream.Free;
        end;
      finally
        ClearDoc := nil;
      end;
      K := 0;
      W := SizeOf(K);
      CheckMsg(AvCmGetMsgParam(hmsg, AVCM_SIGN_COUNT, @K, W, 0));
      if K <> 1 then
      begin
        ErrCode := tecBadSign;
        ErrMessage := 'Отчет должен быть подписан только одним сертификатом. Найдено в документе: ' + IntToStr(K);
        Exit(False);
      end;
      try
        // Проверяем подпись
        CheckMsg(AvCmMsgVerifySignAtIndex(hmsg, 0, 0));
      except
        on E: EAvCryptMailException do
        begin
          if E.ErrorCode = AVCMR_SIGN_INVALID then
          begin
            ErrCode := tecBadSign;
            ErrMessage := E.Message;
          end
          else if E.ErrorCode = AVCMR_CERT_REVOKED then
          begin
            ErrCode := tecCertRevoked;
            ErrMessage := E.Message;
          end
          else if E.ErrorCode = AVCMR_CERT_TEMPORARY_REVOKED then
          begin
            ErrCode := tecCertSuspended;
            ErrMessage := E.Message;
          end
          else if E.ErrorCode = AVCMR_CRL_EXPIRED then
          begin
            ErrCode := tecSOSTimeInvalid;
            ErrMessage := E.Message;
          end
          else if E.ErrorCode = AVCMR_BAD_HCRL then
          begin
            ErrCode := tecSOKNotSupported;
            ErrMessage := E.Message;
          end
          else
          begin
            ErrCode := tecUndefined;
            ErrMessage := E.Message;
{$IFDEF USE_CODESITE}
            CodeSite.SendError(
              'При проверке ЭЦП возникла не стандартная ошибка: %s (%d)',
              [E.Message, E.ErrorCode]);
            OutputDebugString(PWideChar(Format('Ошибка проверки ЭЦП: %s (%d)',
                  [E.Message, E.ErrorCode])));
{$ENDIF}
          end;
          Exit(False);
        end;
      end;
      // Извлекаем тело подписи
      CheckMsg(AvCmGetMsgSign(hmsg, 0, hSign, 0));
      ishSignInited := True;
      // Находим сертификат по подписи
      CheckMsg(AvCmFindCertBySign(hSign, HCert, 0));
      ishcertInited := True;
      FoundedCodeUNP := GetCertAttribAsString(HCert, csCodeUNP_MNS, EmptyStr, True);
      if (FoundedCodeUNP = EmptyStr) then
      begin
        // Может быть что сертификат РУЦА, тогда читаем атрибут УНП в другом OID
        FoundedCodeUNP := GetCertAttribAsString(HCert, csCodeUNP_RUC, EmptyStr, False);
        if FoundedCodeUNP = EmptyStr then
        begin
          SignerCertInfo := TCertExtInfo.Create;
          try
            SignerCertInfo.LogFunc := LogFunc;
            SignerCertInfo.FillFromCert(FHc, HCert, hmsg);
            for I := 0 to SignerCertInfo.UNPList.Count - 1 do
              FoundedCodeUNP := FoundedCodeUNP + SignerCertInfo.UNPList[i] + ';';
            if FoundedCodeUNP <> EmptyStr then
             FoundedCodeUNP := LeftStr(FoundedCodeUNP, Length(FoundedCodeUNP) - 1);
          finally
            SignerCertInfo.Free;
          end;
        end
        else
          LogMsg(Format('В сообщении найден код УНП %s выданный %s', [FoundedCodeUNP, 'УЦ РУЦ (новый OID)']));
      end
      else
        LogMsg(Format('В сообщении найден код УНП %s выданный %s', [FoundedCodeUNP, 'УЦ МНС']));
      Result := True;
    except
      on E: Exception do
      begin
        Result := False;
        ErrMessage := E.Message;
      end;
    end;
  finally
    try
      if ishcertInited then
        CheckMsg(AvCmCloseHandle(HCert, 0));
    except
    end;
    try
      if ishSignInited then
        CheckMsg(AvCmCloseHandle(hSign, 0));
    except
    end;
    try
      if ishmsgInited then
        CheckMsg(AvCmCloseHandle(hmsg, 0));
    except
    end;
    if not Result then
      LogMessage(EVENTLOG_ERROR_TYPE, ciaCatAvestEvents, ciaAvErrorCheckSign,
        [ErrMessage]);
  end;
end;

function TCryptMain.DecryptDocFromStream(const ADocAsStream: TStream;
  const AOutStream: TMemoryStream; out ErrMessage: string;
  const RaiseIfError: Boolean = True): Boolean;
var
  OutBuffer: Pointer;
  OutBufferSize: Cardinal;
begin
  {$IFDEF USE_CODESITE}CodeSite.TraceMethod(Self, 'DecryptDocFromStream', tmoTiming);{$ENDIF}
  try
    AOutStream.LoadFromStream(ADocAsStream);
    AOutStream.Position := soFromBeginning;
    CheckMsg(AvCmDecrypt(FHc, AOutStream.Memory, AOutStream.Size, @OutBuffer,
        OutBufferSize, AVCMF_IN_RAW_DATA or AVCMF_ALLOC));
    try
      AOutStream.Position := soFromBeginning;
      AOutStream.Size := OutBufferSize;
      AOutStream.WriteBuffer(OutBuffer^, OutBufferSize);
      // Восстановим позицию на начало для "читателей"
      AOutStream.Position := soFromBeginning;
    finally
      HeapFree(GetProcessHeap, 0, OutBuffer);
    end;
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      ErrMessage := E.Message;
      LogMessage(EVENTLOG_ERROR_TYPE, ciaCatAvestEvents, ciaAvErrorDecryptDoc,
        [ErrMessage]);
      if RaiseIfError then
        Raise ;
    end;
  end;
end;

function TCryptMain.DeleteSignInfo(const AXMLDoc: IXMLDOMDocument2;
  const ASignInfoNodePath: string): IXMLDOMDocument2;
var
  OldNode: IXMLDOMNode;
begin
  {$IFDEF USE_CODESITE}CodeSite.TraceMethod(Self, 'DeleteSignInfo', tmoTiming);{$ENDIF}
  // Удаляем тег SignInfoElement (если он есть)
  OldNode := AXMLDoc.documentElement.selectSingleNode(ASignInfoNodePath);
  try
    if Assigned(OldNode) then
      AXMLDoc.documentElement.removeChild(OldNode);
    // Нормализуем документ
    AXMLDoc.documentElement.normalize;
    Result := AXMLDoc;
  finally
    OldNode := nil;
  end;
end;

procedure TCryptMain.ShowDlgAboutObject(const AXMLDoc: IXMLDOMDocument2; const APathToSignBody: String; const AHOwner:
    hwnd; const AVerifySign: Boolean = True);
var
  SignHEXBody, SSign: AnsiString;
  DocAsMemStream: TMemoryStream;
  NodeWithSign: IXMLDOMNode;
  hmsg: AvCmHmsg;
  hSign: AvCmHandle;
  CountSigns, Buffer: DWORD;
begin
  // Пытаемся извлечь подпись
  NodeWithSign := AXMLDoc.documentElement.selectSingleNode
    (APathToSignBody + '/' + csSignDataNodeName);
  try
    if not Assigned(NodeWithSign) or (NodeWithSign.text = EmptyStr) then
    begin
      LogMessage(EVENTLOG_ERROR_TYPE, ciaCatError, ciaErrorProcessingIncomeDoc,
        [rsNoECPInDocument]);
      raise Exception.Create(rsNoECPInDocument);
    end;

    // Получаем подпись
    SignHEXBody := NodeWithSign.text;
    SSign := HexToStr(SignHEXBody);
  finally
    NodeWithSign := nil;
  end;

  // Очищаем документ от подписи
  DeleteSignInfo(AXMLDoc, APathToSignBody);

  DocAsMemStream := GetXMLDocAsStreamWithEncoding(AXMLDoc);
  try
    CheckMsg(AvCmOpenMsg(FHc, @SSign[1], Length(SSign), hmsg, AVCMF_IN_PKCS7));
    try
      CheckMsg(AvCmSetMsgContent(hmsg, DocAsMemStream.Memory,
          DocAsMemStream.Size, 0));
      CountSigns := 0;
      Buffer := SizeOf(CountSigns);
      CheckMsg(AvCmGetMsgParam(hmsg, AVCM_SIGN_COUNT, @CountSigns, Buffer, 0));
      if CountSigns <> 1 then
        raise Exception.Create('Отчет должен быть подписан только одним сертификатом. Найдено в документе: '
            + IntToStr(CountSigns));
      // Проверяем подпись, если необходимо
      if AVerifySign then
        CheckMsg(AvCmMsgVerifySignAtIndex(hmsg, 0, 0));
      // Извлекаем тело подписи
      CheckMsg(AvCmGetMsgSign(hmsg, 0, hSign, 0));
      try
        // Вызываем диалог
        CheckMsg(AvCmShowObjectInfo(hSign, nil, nil, nil, 0));
      finally
        CheckMsg(AvCmCloseHandle(hSign, 0));
      end;
    finally
      CheckMsg(AvCmCloseHandle(hmsg, 0));
    end;
  finally
    DocAsMemStream.Free;
  end;
end;

function TCryptMain.EncryptText(var AText: AnsiString; out ErrMessage: string): Boolean;
var
  CertList: AvCmHcertEnum;
  HandleCert: AvCmHandle;
  IsFoundCert: Boolean;
  RecipientArray: array of AvCmHcert;
  RecipientCount: Cardinal;
  PBlock: PAnsiChar;
  EncryptBlockSize: DWORD;
  i: Integer;
begin
  {$IFDEF USE_CODESITE}CodeSite.TraceMethod(Self, 'EncryptText', tmoTiming);{$ENDIF}
  Result := False;
  ErrMessage := EmptyStr;
  // Находим список сертификатов для которых будем шифровать
  CertList := GetCertListForEncrypt;
  try
    RecipientCount := 0;
    // Готовим массив дескрипторов сертификатов для которых будем шифровать
    IsFoundCert := AvCmEnumGet(CertList, HandleCert, AVCMF_START) <> AVCMR_NOT_FOUND;
    while IsFoundCert do
    begin
      RecipientCount := RecipientCount + 1;
      SetLength(RecipientArray, RecipientCount);
      RecipientArray[RecipientCount - 1] := HandleCert;
      LogMsg(Format('Сертификат получателя: %s %s %s %s %s',
        [GetCertAttribAsString(HandleCert, csCertDepartmentName),
        GetCertAttribAsString(HandleCert, csCertOrgName),
        GetCertAttribAsString(HandleCert, csCertFirstName),
        GetCertAttribAsString(HandleCert, csCertLastName),
        GetCertAttribAsString(HandleCert, csCertPublicKey)]));
      IsFoundCert := AvCmEnumGet(CertList, HandleCert, AVCMF_NEXT) <> AVCMR_NOT_FOUND;
    end;

    if RecipientCount > 0 then
    begin
      try
        // Шифруем подписанный документ для всех сертификатов подготовленного списка
        CheckMsg(AvCmEncrypt(FHc, @AText[1], Length(AText), RecipientCount,
            @RecipientArray[0], @PBlock, EncryptBlockSize,
            AVCMF_IN_RAW_DATA or AVCMF_ALLOC));
        try
          // Сохраняем зашифрованный документ в строку
          SetLength(AText, EncryptBlockSize);
          Move(PBlock^, AText[1], EncryptBlockSize);
          Result := True;
        finally
          HeapFree(GetProcessHeap, 0, PBlock);
        end;
      finally
        // Наксерачил - убери! Чистим объекты по дескрипторам.
        for i := RecipientCount - 1 downto 0 do
        begin
          HandleCert := RecipientArray[i];
          CheckMsg(AvCmCloseHandle(HandleCert, 0));
        end;
        SetLength(RecipientArray, 0);
      end;
    end
    else
//      raise EAvCryptMailException.Create(csCertListForEncryptIsEmpty, rsNotFoundCertsForEncrypt);
      ErrMessage := rsNotFoundCertsForEncrypt;
  finally
    // Чистим список сертификатов для шифрования
    CheckMsg(AvCmCloseHandle(CertList, 0));
  end;
end;

procedure TCryptMain.FillLoggedPersonInfo;
var
  HCert: AvCmHcert;
  BuffSize: Cardinal;
begin
  if not IsLogged then
    Exit;
  BuffSize := SizeOf(HCert);
  CheckMsg(AvCmGetObjectInfo(FHc, AVCM_MY_CERT, @HCert, BuffSize, 0));
  try
    {В связи с введением OID-ов согласно СТБ 34.101.50 некоторые поля в сертификатах теперь будут кодироваться по-новому:
      В сертификате юр. лица:
      2.5.4.10=Наименование организации - владельца открытого ключа
      2.5.4.6=Код страны
      2.5.4.8=Область
      2.5.4.7=Населенный пункт
      2.5.4.9=Адрес
      1.2.112.1.2.1.1.1.1.2=Уникальный номер налогоплательщика
      2.5.4.11=Подразделение
      2.5.4.12=Должность
      2.5.4.4=Фамилия
      2.5.4.41=И.О.
      1.2.840.113549.1.9.1=Адрес электронной почты}
    FLoggedPersonInfo.LastName := GetCertAttribAsString(HCert, csCertLastName);
    FLoggedPersonInfo.FirstName := GetCertAttribAsString(HCert, csCertFirstName);
    FLoggedPersonInfo.OrgName := GetCertAttribAsString(HCert, csCertOrgName);
    FLoggedPersonInfo.Department := GetCertAttribAsString(HCert, csCertDepartmentName);
    FLoggedPersonInfo.Position := GetCertAttribAsString(HCert, csCertPosition_MNS, EmptyStr);
    if FLoggedPersonInfo.Position = EmptyStr then
      FLoggedPersonInfo.Position := GetCertAttribAsString(HCert, csCertPosition_RUC, EmptyStr);
    FLoggedPersonInfo.PublicKey := GetCertAttribAsString(HCert, csCertPublicKey);
    FLoggedPersonInfo.EMAIL := GetCertAttribAsString(HCert, csCertEMAIL, EmptyStr);
    FLoggedPersonInfo.DNSIDAttr := GetCertAttribAsString(HCert, csDNSIDAttr, EmptyStr);
    FLoggedPersonInfo.CodeUNP := GetCertAttribAsString(HCert, csCodeUNP_MNS, EmptyStr, True);
    if FLoggedPersonInfo.CodeUNP = EmptyStr then
    begin
      FLoggedPersonInfo.CodeUNP := GetCertAttribAsString(HCert, csCodeUNP_RUC, EmptyStr, False);
      if FLoggedPersonInfo.CodeUNP <> EmptyStr  then
        FLoggedPersonInfo.UNPOID := csCodeUNP_RUC;
    end
    else
      FLoggedPersonInfo.UNPOID := csCodeUNP_MNS;
    if UNPPublisher in [unpRUC, unpMNS] then
      LoggedCertExtInfo.FillFromCertVal(FLoggedPersonInfo.CodeUNP,  UNPPublisher)
    else
    begin
      LoggedCertExtInfo.FillFromLoginSession(FHc);
      if (LoggedCertExtInfo.UNPList.Count > 0) then
        LoggedCertExtInfo.UNPPublisherType := unpAttrCert
      else
        LoggedCertExtInfo.UNPPublisherType := unpNotDefined;
    end;
  finally
    CheckMsg(AvCmCloseHandle(HCert, 0));
  end;
end;

procedure TCryptMain.Flush;
begin
  AvCmFlush(FHc, 0);
end;

function TCryptMain.GetCertAttribAsString(const HCert: AvCmHcert; AttribName: AnsiString; DefValue: AnsiString = '';  const IsExtendedAttrib: Boolean = False): AnsiString;
var
  W: DWORD;
  RunResult: Cardinal;
  SearchContext: Cardinal;
begin
  if IsExtendedAttrib then
    SearchContext := AVCM_EXT_AS_STRING
  else
    SearchContext := AVCM_SUBJECT_ATTR;
  RunResult := AvCmGetCertAttr(HCert, SearchContext, PAnsiChar(AttribName),
    Nil, W, AVCMF_ATTR_BY_OID);
  if RunResult = AVCMR_NOT_FOUND then
    Exit(DefValue);
  CheckMsg(RunResult);
  SetLength(Result, W - 1);
  CheckMsg(AvCmGetCertAttr(HCert, SearchContext, PAnsiChar(AttribName),  @Result[1], W, AVCMF_ATTR_BY_OID));
end;

function TCryptMain.SignAndEncryptXMLDoc(const ADocForSign: IXMLDOMDocument2;
  const ASignInfoNodePath: string; out OutDocAsAnsiString: AnsiString): Boolean;
var
  ErrStr: string;
  SignedDocAsAnsiString: AnsiString;
begin
  {$IFDEF USE_CODESITE}CodeSite.TraceMethod(Self, 'SignAndEncryptXMLDoc', tmoTiming);{$ENDIF}
  // Подписываем документ
  Result := SignXMLDoc(ADocForSign, ASignInfoNodePath, SignedDocAsAnsiString, ErrStr);
  if Result then
    // Шифруем
    Result := EncryptText(SignedDocAsAnsiString, ErrStr);
  OutDocAsAnsiString := SignedDocAsAnsiString;
end;

function TCryptMain.GetCertListForEncrypt: AvCmHcertEnum;
var
  CriterionCount: Integer;
  CriterionArray: array of AvCmEnumGetParam;
  HCertEnum: AvCmHcertEnum;
  FilteredHCertEnum: AvCmHcertEnum;
  FilteredHCertEnumInited: Boolean;
  i: integer;
  StrParser: TStringList;
  TempStr: AnsiString;
  devnull: AvCmHandle;
  r: AvCmResult;
  S: AnsiString;
  W: Cardinal;
  count: Cardinal;
begin
  CriterionCount := 1;
  SetLength(CriterionArray, CriterionCount);
  StrParser := TStringList.Create;
  try
    StrParser.Delimiter := csDNSDelimeter;
    StrParser.DelimitedText := csValidSOOEMAILForSOO;
    for i := 0 to StrParser.Count - 1 do
    begin
      TempStr := StrParser[i];
      // Задаем условия поиска в сертификатах, предназначенных для шифрования
      CriterionArray[0].param_id := AVCM_SUBJECT_ATTR;
      CriterionArray[0].param_spec := PAnsiChar(csCertEMAIL);
      CriterionArray[0].param := PAnsiChar(TempStr);
      if (i = 0) then
        // Создаем первоначальный массив найденных по условиям сертификатов
        CheckMsg(AvCmOpenCertEnum(FHc, CriterionCount, @CriterionArray[0], HCertEnum, 0))
      else
        // Добавляем вновь найденные по условиям сертификаты в первоначальный список
        CheckMsg(AvCmEnumAddCerts(HCertEnum, CriterionCount, @CriterionArray[0], 0));
    end;

    FilteredHCertEnumInited := False;
    r := AvCmEnumGet(HCertEnum, devnull, AVCMF_START);
    while r <> AVCMR_NOT_FOUND do
    begin
      CheckMsg(r);
      CheckMsg(AvCmGetCertAttr(devnull, AVCM_ISSUER_ATTR, PAnsiChar(csCertEMAIL), nil, W, AVCMF_ATTR_BY_OID));
      SetLength(S, W - 1);
      CheckMsg(AvCmGetCertAttr(devnull, AVCM_ISSUER_ATTR, PAnsiChar(csCertEMAIL), @S[1], W, AVCMF_ATTR_BY_OID));
      if (CompareStr(csGosSUOKCertEmail, S) = 0) then
      begin
        CheckMsg(AvCmGetCertAttr(devnull, AVCM_PUB_KEY_ID, nil, nil, W, 0));
        SetLength(S, W - 1);
        CheckMsg(AvCmGetCertAttr(devnull, AVCM_PUB_KEY_ID, nil, @S[1], W, 0));
        CriterionArray[0].param_id := AVCM_PUB_KEY_ID;
        CriterionArray[0].param_spec := 0;
        CriterionArray[0].param := PAnsiChar(S);
        if not FilteredHCertEnumInited then
        begin
          CheckMsg(AvCmOpenCertEnum(FHc, CriterionCount, @CriterionArray[0], FilteredHCertEnum, 0));
          FilteredHCertEnumInited := True;
        end
        else
          CheckMsg(AvCmEnumAddCerts(FilteredHCertEnum, CriterionCount, @CriterionArray[0], 0));

      end;
      r := AvCmEnumGet(HCertEnum, devnull, AVCMF_NEXT);
    end;

    if FilteredHCertEnumInited then
      Result := FilteredHCertEnum
    else
      Result := HCertEnum;
  finally
    StrParser.Free;
  end;
end;

function TCryptMain.GetBeginDateCRL: TDateTime;
var
  BuffSize: Cardinal;
  HCert: AvCmHcert;
  NameIssuerCRL: AnsiString;
  FindParams: array of AvCmFindCrlParam;
  HCRL: AvCmHcrl;
  SysDate: SYSTEMTIME;
begin
  // Находим сертификат пользователя открытой сессии
  BuffSize := SizeOf(HCert);
  CheckMsg(AvCmGetObjectInfo(FHc, AVCM_MY_CERT, @HCert, BuffSize, 0));
  try
    // Находим наименование издателя сертификата пользователя открытой сессии
    BuffSize := 0;
    CheckMsg(AvCmGetCertAttr(HCert, AVCM_ISSUER_AS_STRING, nil, nil, BuffSize,
        0));
    SetLength(NameIssuerCRL, BuffSize - 1);
    CheckMsg(AvCmGetCertAttr(HCert, AVCM_ISSUER_AS_STRING, nil,
        @NameIssuerCRL[1], BuffSize, 0));

    // Ищем СОС
    SetLength(FindParams, 1);
    FindParams[0].param_id := AVCM_CRL_ISSUER_SUBJECT;
    FindParams[0].param := @NameIssuerCRL[1];
    CheckMsg(AvCmFindCrl(FHc, 1, @FindParams[0], HCRL, 0));
    try
      DateTimeToSystemTime(Now, SysDate);
      BuffSize := SizeOf(SysDate);
      CheckMsg(AvCmGetCrlAttr(HCRL, AVCM_NOT_BEFORE, @SysDate, BuffSize, 0));
      Result := SystemTimeToDateTime(SysDate);
    finally
      CheckMsg(AvCmCloseHandle(HCRL, 0));
    end;
  finally
    CheckMsg(AvCmCloseHandle(HCert, 0));
  end;
end;

class function TCryptMain.DllPath: string;
begin
  Result := AvCryptMailDLLPath;
end;

function TCryptMain.GetAvestDLLVersion: string;
begin
  Result := EmptyStr;
  if not DLLLoaded then
    Exit;
  Result := FileVersion(AvCryptMailDLLPath + AVCRYPTMAIL_NAME_DLL);
end;

function TCryptMain.GetSignerInfo(const SignedDoc: IXMLDOMDocument2;
  PathToSignBody: string; SignerInfo: TSignPersonInfo;
  out ErrMessage: string): Boolean;
var
  NodeWithSign: IXMLDOMNode;
  SignHEXBody: AnsiString;
  SSign: AnsiString;
begin
  if not IsLogged then
  begin
    ErrMessage := rsLibraryNotInitialized;
    Exit(False);
  end;
  // Пытаемся извлечь подпись
  NodeWithSign := SignedDoc.documentElement.selectSingleNode(PathToSignBody);
  try
    try
      if not Assigned(NodeWithSign) then
      begin
        ErrMessage := rsNoECPInDocument;
        Exit(False);
      end;
      SignHEXBody := NodeWithSign.text;
      SSign := HexToStr(SignHEXBody);
      Result := True;
    finally
      NodeWithSign := nil;
    end;
  except
    on E: Exception do
    begin
      Result := False;
      ErrMessage := E.Message;
    end;
  end;
end;

function TCryptMain.GetUNPPublisher: TUNPPublisherType;
begin
  Result := unpNotDefined;
  if not IsLogged then
    Exit;
  if LoggedPersonInfo.CodeUNP <> EmptyStr then
  begin
    if LoggedPersonInfo.UNPOID = csCodeUNP_RUC then
      Result := unpRUC
    else
      Result := unpMNS;
  end
  else
    if not IsLoggedHaveAttrCerts then
      Exit(unpNotDefined);
end;

function TCryptMain.GetXMLDocAsStreamWithEncoding(const AXMLDoc: IXMLDOMDocument2): TMemoryStream;

  function ValidateProcessingInstructionNode(ANode: IXMLDOMNode): Boolean;
  begin
    Result := Assigned(ANode) and (ANode.NodeType = NODE_PROCESSING_INSTRUCTION) and (ANode.nodeName = SXML);
  end;

  function GetProcessingInstructionNode(const AXMLDoc: IXMLDOMDocument2): IXMLDOMNode;
    var
      PINode: IXMLDOMNode;
  begin
    if AXMLDoc.ChildNodes.length = 0 then
      Exit(nil);

    PINode := AXMLDoc.ChildNodes[0];
    try
      if ValidateProcessingInstructionNode(PINode) then
        Result := PINode;
    finally
      PINode := nil;
    end;
  end;

  function GetAttributeProcessingInstruction(const ANode: IXMLDOMNode; const AAttributeName: string): string;
    var
      AttrNode: IXMLDOMNode;
  begin
    Result := EmptyStr;
    if ValidateProcessingInstructionNode(ANode) then
    begin
      AttrNode := ANode.attributes.getNamedItem(AAttributeName);
      try
        if Assigned(AttrNode) then
          Result := AttrNode.nodeValue;
      finally
        AttrNode := nil;
      end;
    end;
  end;

var
  PINode: IXMLDOMNode;
  tmpVersion,
  tmpEncoding,
  tmpStandalone: string;
  tmpXMLDoc: IXMLDocument;
begin
  {$IFDEF USE_CODESITE}CodeSite.EnterMethod(Self, 'GetXMLDocAsStreamWithEncoding');{$ENDIF}
  PINode := GetProcessingInstructionNode(AXMLDoc);
  try
    tmpVersion := GetAttributeProcessingInstruction(PINode, SVersion);
    tmpEncoding := GetAttributeProcessingInstruction(PINode, SEncoding);
    tmpStandalone := GetAttributeProcessingInstruction(PINode, SStandalone);

    tmpXMLDoc := TXMLDocument.Create(nil);
    try
      tmpXMLDoc.XML.Text := AXMLDoc.xml;
      tmpXMLDoc.Active := True;
      if tmpVersion <> EmptyStr then
        tmpXMLDoc.Version := tmpVersion;
      if tmpEncoding <> EmptyStr then
        tmpXMLDoc.Encoding := tmpEncoding;
      if tmpStandalone <> EmptyStr then
        tmpXMLDoc.StandAlone := tmpStandalone;

      Result := TMemoryStream.Create;
      tmpXMLDoc.SaveToStream(Result);
      Result.Position := 0;
    finally
      tmpXMLDoc := nil;
    end;
  finally
    PINode := nil;
  end;
  {$IFDEF USE_CODESITE}CodeSite.ExitMethod(Self, 'GetXMLDocAsStreamWithEncoding');{$ENDIF}
end;

function TCryptMain.HexToStr(AInputStr: AnsiString): AnsiString;
var
  TempStr: AnsiString;
  text: PAnsiChar;
  BufSize: Integer;
  ResultStr: AnsiString;
begin
  TempStr := LowerCase(AnsiReplaceStr(AInputStr, ' ', EmptyAnsiStr));
  text := PAnsiChar(TempStr);
  BufSize := Length(TempStr) div 2;
  SetLength(ResultStr, BufSize);
  HexToBin(text, PAnsiChar(ResultStr), BufSize);
  Result := ResultStr;
end;

procedure TCryptMain.ImportCertListInRepository(AStream: TMemoryStream);
var
  hmsg: AvCmHmsg;
begin
  if not Assigned(AStream) then
    Exit;

  AStream.Position := soFromBeginning;
  CheckMsg(AvCmOpenMsg(FHc, AStream.Memory, AStream.Size, hmsg,
      AVCMF_IN_PKCS7));
  try
    CheckMsg(AvCmMsgImportCerts(hmsg, AVCMF_IMPORT_ALL_CERTS));
  finally
    CheckMsg(AvCmCloseHandle(hmsg, 0));
  end;
  CheckMsg(AvCmFlush(FHc, 0));
end;

procedure TCryptMain.ImportCertsInRepository(AStream: TMemoryStream;
  const ATypeCert: Cardinal);
// var
// hmsg: AvCmHmsg;
begin
  if not Assigned(AStream) then
    Exit;

  AStream.Position := soFromBeginning;
  CheckMsg(AvCmImport(FHc, ATypeCert, AStream.Memory, AStream.Size, 0, nil, 0));
  CheckMsg(AvCmFlush(FHc, 0));
  // CheckMsg(AvCmOpenMsg(fhc, AStream.Memory, AStream.Size, hmsg, AVCMF_IN_RAW_DATA));
  // CheckMsg(AvCmOpenMsg(fhc, AStream.Memory, AStream.Size, hmsg, AVCMF_IN_PKCS7));
  // CheckMsg(AvCmImport(fhc, AVCM_CERTIFICATE, AStream.Memory, AStream.Size, 0, nil, 0));
  // CheckMsg(AvCmMsgImportCerts(hmsg, AVCMF_IMPORT_CRL));
  // CheckMsg(AvCmMsgImportCerts(hmsg, AVCMF_IMPORT_ALL_CERTS));
  // CheckMsg(AvCmCloseHandle(hmsg, 0));
end;

procedure TCryptMain.ImportCRLInRepository(AStream: TMemoryStream);
begin
  ImportCertsInRepository(AStream, AVCM_CRL);
end;

procedure TCryptMain.ImportCERInRepository(AStream: TMemoryStream);
begin
  ImportCertsInRepository(AStream, AVCM_CERTIFICATE);
end;

procedure TCryptMain.InitParams;
begin
  FIsLogged := False;
  AuditProvider := nil;

  // Инициализация библиотеки
  if FPathName = EmptyStr then
    CheckMsg(AvCmInit(AVCMF_STARTUP))
  else
    CheckMsg(AvCmInitEx(PChar(FPathName), AVCMF_STARTUP));

  FLoggedCertExtInfo := TCertExtInfo.Create();
  FIsLibrarySupportAttrCert := False;
end;

function TCryptMain.IsLoggedHaveAttrCerts: Boolean;
var
  params: AvCmEnumGetParam;
  hcert_enum: AvCmHcertEnum;
  hAcert: AvCmHcert;
  RunRes: DWORD;
begin
  if not IsLogged then
    raise Exception.Create('Вход в ПО КЗИ не выполнен.');
  if not IsLibrarySupportAttrCert then
    Exit(False);
  // Поиск атрибутных сертификатов, выданных на личный сертификат открытых ключей
  params.param_id := AVCM_ATTRIBUTE_CERTS;
  params.param := Nil;
  RunRes := AvCmOpenCertEnum(fhc, 1,  @params, hcert_enum, 0);
  if RunRes = ciNotSupported then
    Exit(False);
  CheckMsg(RunRes);
  try
    Result := AvCmEnumGet(hcert_enum, hACert, AVCMF_START) = 0;
  finally
    CheckMsg(AvCmCloseHandle(hcert_enum, 0));
  end;
end;

procedure TCryptMain.Login(const IsCheckHaveCodeUNP: Boolean = false);
var
  ErrMsg: string;
begin
  if IsLogged then
    Exit;
  CheckMsg(AvCmLogin(0, Nil, FHc, 0));
//  CheckMsg(AvCmLogin(0, Nil, Fhc, AVCMF_DENY_TOKEN_CONTROL)); //запрет контроля наличия вставленного носителя с личным ключом
  FIsLogged := True;
  FIsLibrarySupportAttrCert := (AvestDLLVersion > '3.3.3');
  FillLoggedPersonInfo;
  if IsCheckHaveCodeUNP and not ValidCodeUNPLoggedUser then
  begin
    Logout(ErrMsg);
    raise Exception.Create(rsWrongCertLoggedUser);
  end;
end;

function TCryptMain.Login(out ErrMessage: string): Boolean;
var
  LogoutErr: string;
begin
  if IsLogged then
    Exit(True);
  Result := False;
  try
    try
      // Login
      CheckMsg(AvCmLogin(0, Nil, FHc, 0));
      FIsLogged := True;
      FillLoggedPersonInfo;
      if CheckLoggedPersonValid then
      begin
        Result := True;
        FIsLibrarySupportAttrCert := (AvestDLLVersion > '3.3.3');
      end
      else
      begin
        Logout(LogoutErr);
        ErrMessage := 'Сертификат пользователя не предназначен для работы с сервисом обработки отчетов.';
      end;
    except
      on E: Exception do
      begin
        ErrMessage := E.Message;
      end;
    end;
  finally
    if Result then
      LogMessage(EVENTLOG_SUCCESS, ciaCatAvestEvents, ciaAvSuccessLogin,
        [LoggedPersonInfo.ToString])
    else
      LogMessage(EVENTLOG_ERROR_TYPE, ciaCatAvestEvents, ciaAvErrorLogin,
        [ErrMessage]);
  end;
end;

procedure TCryptMain.LoginWithoutAuthorization;
begin
  CheckMsg(AvCmLogin(0, Nil, FHc, AVCMF_NO_AUTH or AVCMF_IGNORE_CRL_ABSENCE));
  FIsLogged := False;
  FIsLibrarySupportAttrCert := False;
end;

procedure TCryptMain.LogMessage(EvntMessType, UserCategoryID,
  UserEventID: Integer; UserMessages: array of string);
begin
  if Assigned(FAuditProvider) then
    FAuditProvider.LogMessage(EvntMessType, UserCategoryID, UserEventID,
      UserMessages);
end;

procedure TCryptMain.LogMsg(const aMessage: string);
begin
  if Assigned(LogFunc) then
    LogFunc(aMessage);
end;

procedure TCryptMain.LogMsgFmt(const aMessage: string; Vals: array of const);
begin
  if Assigned(LogFunc) then
    LogFunc(Format(aMessage, Vals));
end;

function TCryptMain.Logout(out ErrMessage: string): Boolean;
begin
  Result := True;
  FIsLibrarySupportAttrCert := False;
  LoggedCertExtInfo.ClearAttrCertList;
  if not IsLogged then
    Exit;
  try
    CheckMsg(AvCmLogout(FHc, 0));
    FIsLogged := False;
    LogPreDefinedMessage(EVENTLOG_SUCCESS, ciaCatAvestEvents, ciaAvSuccessLogout);
  except
    on E: Exception do
    begin
      Result := False;
      ErrMessage := E.Message;
      LogMessage(EVENTLOG_ERROR_TYPE, ciaCatAvestEvents, ciaAvErrorLogout, [ErrMessage]);
    end;
  end;
end;

procedure TCryptMain.LogPreDefinedMessage(EvntMessType, UserCategoryID,
  UserEventID: Integer);
begin
  if Assigned(FAuditProvider) then
    FAuditProvider.LogPreDefinedMessage(EvntMessType, UserCategoryID,
      UserEventID);
end;

function TCryptMain.ReadCertSerialNumberFromFile(AFileName: string): string;
var
  // ErrMessage: string;
  Memstr: TMemoryStream;
  HCert: AvCmHcert;
  TempStr: AnsiString;
  W: DWORD;
begin
  // if not IsLogged then
  // if not Login(ErrMessage) then
  // begin
  // MessageDlg(ErrMessage, mtWarning, [mbOK], 0);
  // Exit;
  // end;
  Memstr := TMemoryStream.Create;
  try
    Memstr.LoadFromFile(AFileName);
    Memstr.Position := soFromBeginning;
    W := SizeOf(W);
    raise Exception.Create('Not implemented');
    //CheckMsg(AvCmOpenCert(FHc, Memstr.Memory, Memstr.Size, HCert, 0));
    CheckMsg(AvCmGetCertAttr(HCert, AVCM_SERIAL_AS_STRING, Nil, Nil, W,
        AVCMF_ATTR_BY_OID));
    SetLength(TempStr, W - 1);
    CheckMsg(AvCmGetCertAttr(HCert, AVCM_SERIAL_AS_STRING, Nil, @TempStr[1], W,
        AVCMF_ATTR_BY_OID));
    CheckMsg(AvCmCloseHandle(HCert, 0));
    Result := Trim(TempStr);
  finally
    Memstr.Free;
  end;

end;

procedure TCryptMain.SetLogFunc(const Value: TLogInfoFunc);
begin
  FLogFunc := Value;
end;

function TCryptMain.SignXMLDoc(const ADocForSign: IXMLDOMDocument2;
  const ASignInfoNodePath: string; out OutDocAsAnsiString: AnsiString;
  out ErrMessage: string): Boolean;
var
  ADoc: IXMLDOMDocument2;
  AllDocAsStream: TMemoryStream;
  SignInfoElement: IXMLDOMElement;
  SignDataElement: IXMLDOMElement;
  SignCDATASection: IXMLDOMCDATASection;
  PBlock: PAnsiChar;
  SignBlockSize: DWORD;
  SignBlockDody: AnsiString;
  UNPCode: string;
  CurAttrCert: AvCmHcert;
  hmsg: AvCmHmsg;
begin
  {$IFDEF USE_CODESITE}CodeSite.TraceMethod(Self, 'SignXMLDoc', tmoTiming);{$ENDIF}
// Для начала нужно удалить тег SignInfoElement (если он есть)
  ADoc := DeleteSignInfo(ADocForSign, ASignInfoNodePath);
  try
    try
      AllDocAsStream := GetXMLDocAsStreamWithEncoding(ADocForSign);
      try
        if (FLoggedCertExtInfo.UNPPublisherType = unpAttrCert) then
        begin
          // Открываем сообщение
          CheckMsg(AvCmOpenMsg(FHc, AllDocAsStream.Memory, AllDocAsStream.Size,
            hmsg, AVCMF_IN_RAW_DATA));
          for UNPCode in LoggedCertExtInfo.UNPList do
          begin
            CurAttrCert := LoggedCertExtInfo.GetCertByCodeUNP(UNPCode);
            // Добавляем атрибутный сертификат
            if CurAttrCert <> Nil then
             begin
               CheckMsg(AvCmMsgSetAttribute(hmsg, AVCM_ATTRIBUTE_CERTS, @CurAttrCert, Nil, 0, 0));
               LogMsg(Format('К сообщению добавлен атрибутный сертификат S/N %s с кодом УНП: %s',
                [LoggedCertExtInfo.GetSNByCodeUNP(UNPCode), UNPCode]));
             end;
          end;
          // подписываем
          CheckMsg(AvCmMsgSign(hmsg, AVCMF_ADD_SIGN_CERT or AVCMF_DETACHED));
          // получаем размер блоба
          CheckMsg(AvCmGetMsg(hmsg, Nil, SignBlockSize, 0));
          SetLength(SignBlockDody, SignBlockSize);
          CheckMsg(AvCmGetMsg(hmsg, @SignBlockDody[1], SignBlockSize, 0));
          AvCmCloseHandle(hmsg, 0);
        end
        else
        begin
          LogMsgFmt('Сообщение подписано сертификатом с кодом УНП: %s OID кода УНП: %s',
                [LoggedPersonInfo.CodeUNP, LoggedPersonInfo.UNPOID]);
          // Подписываем документ
          CheckMsg(AvCmSign(FHc, AllDocAsStream.Memory, AllDocAsStream.Size,
            @PBlock, SignBlockSize, AVCMF_ADD_SIGN_CERT or AVCMF_IN_RAW_DATA or AVCMF_ALLOC or AVCMF_DETACHED));
          {$REGION 'запрет контроля наличия вставленного носителя с личным ключом'}
          // CheckMsg(AvCmSign(FHC, AllDocAsStream.Memory, AllDocAsStream.Size, @PBlock, SignBlockSize, AVCMF_IN_RAW_DATA or AVCMF_ALLOC or AVCMF_DETACHED or AVCMF_DENY_TOKEN_CONTROL));
          // Ниже, если потребуется повторно контролировать наличие носителя перед подписью
//           CheckMsg(AvCmSign(FHC, AllDocAsStream.Memory, AllDocAsStream.Size,
//             @PBlock, SignBlockSize, AVCMF_REPEAT_AUTHENTICATION or AVCMF_IN_RAW_DATA or AVCMF_ALLOC or AVCMF_DETACHED));
          {$ENDREGION}
          try
            SetLength(SignBlockDody, SignBlockSize);
            // Перемещаем тело подписи в нашу строку
            Move(PBlock^, SignBlockDody[1], SignBlockSize);
          finally
            HeapFree(GetProcessHeap, 0, PBlock);
          end;
        end;
      finally
        AllDocAsStream.Free;
      end;
        // Создаем новый элемент сод. подпись и инф. о ней
        SignInfoElement := ADocForSign.createElement(csSignInfoNodeName);
        ADocForSign.documentElement.appendChild(SignInfoElement);
        // Заполняем тело описания подписи
        StoreLoggedPersonToAttr(SignInfoElement);
        // Создаем новое пустое тело для подписи
        SignDataElement := ADocForSign.createElement(csSignDataNodeName);
        SignInfoElement.appendChild(SignDataElement);
        // Сформировать подпись в транспортабельном формате
        SignCDATASection := ADocForSign.createCDATASection
          (StrToHEX(SignBlockDody));
        // Добавить подпись в документ
        SignDataElement.appendChild(SignCDATASection);
        // Подготавливаем подписанный документ как строку
        AllDocAsStream := GetXMLDocAsStreamWithEncoding(ADocForSign);
        try
          SetLength(OutDocAsAnsiString, AllDocAsStream.Size);
          AllDocAsStream.ReadBuffer(OutDocAsAnsiString[1], AllDocAsStream.Size);
        finally
          AllDocAsStream.Free;
        end;
        Result := True;
    except
      on E: Exception do
      begin
        if (E is EAvCryptMailException) and
          (EAvCryptMailException(E).ErrorCode = csNKINotExists) then
          ErrMessage := rsCannotGenerateDS + csNewLine + rsNotExistsNKI
        else
          ErrMessage := E.Message;
        if Assigned(AuditProvider) then
          AuditProvider.LogMessage(EVENTLOG_ERROR_TYPE, ciaCatAvestEvents,
            ciaAvErrorSignTicket, [ErrMessage]);
        Exit(False);
      end;
    end;
  finally
    SetLength(SignBlockDody, 0);
    ADoc := nil;
    SignDataElement := nil;
    SignCDATASection := nil;
    SignInfoElement := nil;
  end;
end;

procedure TCryptMain.StoreLoggedPersonToAttr(XMLElem: IXMLDOMElement);
begin
  XMLElem.setAttribute('OrgName', LoggedPersonInfo.OrgName);
  XMLElem.setAttribute('FirstName', LoggedPersonInfo.FirstName);
  XMLElem.setAttribute('LastName', LoggedPersonInfo.LastName);
  XMLElem.setAttribute('Department', LoggedPersonInfo.Department);
  XMLElem.setAttribute('Position', LoggedPersonInfo.Position);
end;

function TCryptMain.StrToHEX(InputString: AnsiString): AnsiString;
var
  i: Integer;
begin
  Result := EmptyStr;
  for i := 1 to Length(InputString) do
    Result := Result + IntToHex(Ord(InputString[i]), 2);
end;

function TCryptMain.TestSign(out AErrMessage: string): Boolean;
var
  TestMsg: TStringStream;
  PBlock: PAnsiChar;
  SignBlockSize: DWORD;
begin
  Result := False;
  if not IsLogged then
    Exit;

  TestMsg := TStringStream.Create;
  try
    try
      TestMsg.WriteString('Test');
      CheckMsg(AvCmSign(FHc, TestMsg.Memory, TestMsg.Size,
        @PBlock, SignBlockSize, AVCMF_IN_RAW_DATA or AVCMF_ALLOC or AVCMF_DETACHED));
      HeapFree(GetProcessHeap, 0, PBlock);
      Result := True;
    except
      on E: Exception do
      begin
        if (E is EAvCryptMailException) and (EAvCryptMailException(E).ErrorCode = csNKINotExists) then
          AErrMessage := rsCannotGenerateDS + csNewLine + rsNotExistsNKI
        else
          AErrMessage := E.Message;
      end;
    end;
  finally
    FreeAndNil(TestMsg);
  end;
end;

constructor EAvCryptMailException.Create(const AErrorCode: Cardinal;
  const AErrorMessage: string);
begin
  if AErrorMessage = EmptyStr then
    inherited Create(Format(csAvCryptMailDefErrMsg, [AErrorCode]))
  else
    inherited Create(AErrorMessage);
  FErrorCode := AErrorCode;
end;

{ TSignPersonInfo }

function TSignPersonInfo.ToString: string;
begin
  Result := 'Значения полей в сертификате открытого ключа:' + sLineBreak +
    'Ниаменование организации: ' + OrgName + sLineBreak + 'И.О.: ' +
    FirstName + sLineBreak + 'Фамилия: ' + LastName + sLineBreak +
    'Подразделение: ' + Department + sLineBreak + 'Должность: ' + Position +
    sLineBreak + 'EMAIL: ' + EMAIL + sLineBreak +
    sLineBreak + 'DNSIDAttr: ' + DNSIDAttr + sLineBreak +
    sLineBreak + 'Идентификатор открытого ключа: ' + PublicKey + sLineBreak;
end;

constructor TCertExtInfo.Create;
begin
  inherited Create;
  FUNPList := TList<string>.Create();
  FAttrCertList := TDictionary<string, TAttrCertInfo>.Create();
end;

destructor TCertExtInfo.Destroy;
begin
  ClearAttrCertList;
  FreeAndNil(FAttrCertList);
  FreeAndNil(FUNPList);
  inherited Destroy;
end;

procedure TCertExtInfo.ClearAttrCertList;
var
  Key: string;
begin
  for Key in FAttrCertList.Keys do
    FAttrCertList.Items[Key].Free;
  FAttrCertList.Clear;
end;

procedure TCertExtInfo.FillFromLoginSession(const FLoginHandle: AvCmHc);
var
  params: AvCmEnumGetParam;
  hcert_enum: AvCmHcertEnum;
  f, W, K: DWORD;
  cSerialNum: AnsiString;
  cAttrVal: AnsiString;
  cOID, cOIDName: AnsiString;
  hAcert: AvCmHcert;
  i: Integer;
  DateFrom, DateTo: TSystemTime;
  CertStatRes: DWORD;
  SizeRes: cardinal;
  NewCert: TAttrCertInfo;
  NewAttrVal: TAttrCertValue;
begin
  {$IFDEF USE_CODESITE}CodeSite.TraceMethod(Self, 'FillFromLoginSession', tmoTiming);{$ENDIF}
  UNPList.Clear;
  // Поиск атрибутных сертификатов, выданных на личный сертификат открытых ключей
  params.param_id := AVCM_ATTRIBUTE_CERTS;
  params.param := Nil;
  CheckMsg(AvCmOpenCertEnum(FLoginHandle, 1,  @params, hcert_enum, 0));
  try
    f := AVCMF_START;
    while AvCmEnumGet(hcert_enum, hACert, f) = 0 do begin
      // получаем найденные сертификаты
      f := 0;
{$REGION 'Проверка методом AvCmVerifyCertStatus'}
      //  CertParam: AvCmCertStatParam;
      //  StatusCert: AvCmHcertstat;
      //  PM: DWORD;
      // PM := AVCM_CM_OFFLINE;
      // CertParam.param_id := AVCM_CHECK_MODE;
      // CertParam.param := @PM;
      // Проверяем валидность сертификата
      // CheckMsg(AvCmVerifyCertStatus(hACert, 1, @CertParam,  W, StatusCert, 0));
      // Если W = 0, то ошибка и расширенная инфа в StatusCert, который потом надо будет освободить
{$ENDREGION }
      { Дополнительный способ из SDK, но Авестом рекомендовано использовать нижеуказанный}
      SizeRes := SizeOf(CertStatRes);
      CheckMsg(AvCmGetCertAttr(hACert, AVCM_VALID, nil, @CertStatRes, SizeRes, 0));
      if CertStatRes <> 0 then
      begin
        // Сертификат не корректен, обработка и вывод этого сертификата пока в ПО
        // не предусмотрена, но если нужен текст сообщения, то его можно получить
        // так:
        //ErrorText := GetMsg(CertStatRes);
        continue;
      end;
      NewCert := TAttrCertInfo.Create;
      try
        NewCert.CertHandle := hACert;
        //получаем требуемый размер
        CheckMsg(AvCmGetCertAttr(hACert, AVCM_SERIAL_AS_STRING, Nil, Nil, W, 0));
        // выделяем память (дельфи авоматом содержит конец строки пожтому выделяем на 1 меньше)
        SetLength(cSerialNum, W - 1);
        // получаем значение атрибута
        CheckMsg(AvCmGetCertAttr(hACert, AVCM_SERIAL_AS_STRING, Nil, @cSerialNum[1], W, 0));
        //Writeln(WideString('Найден атрибутный сертификат серийный номер ' + S));
        NewCert.SerialNum := AnsiToUtf8(cSerialNum);
        w := SizeOf(DateFrom);
        CheckMsg(AvCmGetCertAttr(hACert, AVCM_NOT_BEFORE, Nil, @DateFrom, W, 0));
        CheckMsg(AvCmGetCertAttr(hACert, AVCM_NOT_AFTER, Nil, @DateTo, W, 0));
        NewCert.ActiveFrom := SystemTimeToDateTime(DateFrom);
        NewCert.ActiveTo := SystemTimeToDateTime(DateTo);
//        sd := FormatDateTime('с dd.mm.yyyy hh:nn:ss', SystemTimeToDateTime(st1)) +
//          FormatDateTime(' по dd.mm.yyyy hh:nn:ss', SystemTimeToDateTime(st2));
//        Writeln(WideString('Срок действия ' + sd));
        // количество дополнительных атрибутов
        W := SizeOF(K);
        CheckMsg(AvCmGetCertAttr(hACert, AVCM_ATTR_COUNT, Nil, @K, W, 0));
  //        Writeln(WideString('Количество атрибутов  ' + IntToStr(K)));
        for i := 0 to K - 1 do begin
          CheckMsg(AvCmGetCertAttr(hACert, AVCM_ATTR_OID, @i, Nil, W, 0));
          SetLength(cOID, W - 1);
          CheckMsg(AvCmGetCertAttr(hACert, AVCM_ATTR_OID, @i, @cOID[1], W, 0));

          CheckMsg(AvCmGetCertAttr(hACert, AVCM_ATTR_OID_NAME, @i, Nil, W, 0));
          SetLength(cOIDName, W - 1);
          CheckMsg(AvCmGetCertAttr(hACert, AVCM_ATTR_OID_NAME, @i, @cOIDName[1], W, 0));

          CheckMsg(AvCmGetCertAttr(hACert, AVCM_ATTR_AS_STRING, @i, Nil, W, 0));
          SetLength(cAttrVal, W - 1);
          CheckMsg(AvCmGetCertAttr(hACert, AVCM_ATTR_AS_STRING, @i, @cAttrVal[1], W, 0));
          NewAttrVal.AttrName := cOIDName;
          NewAttrVal.AttrValue := cAttrVal;
          NewAttrVal.AttrOID := cOID;
          NewCert.AttrValList.Add(cOID, NewAttrVal);
          //1.2.112.1.2.1.1.1.1.2=Уникальный номер налогоплательщика
          if NewAttrVal.AttrOID = csCodeUNP_RUC then
          begin
            UNPList.Add(NewAttrVal.AttrValue);
          end;
//            SL.AddObject(s + '=' + sd, TObject(hACert));
//          Writeln(WideString(s1 + '(' + s2 + ')=' + S));
        end;
        AttrCertList.Add(NewCert.SerialNum, NewCert);
      except on E: Exception do
        begin
          NewCert.Free;
          raise;
        end;
      end;
    end;
  finally
    CheckMsg(AvCmCloseHandle(hcert_enum, 0));
  end;
end;

procedure TCertExtInfo.FillFromCert(const FLoginHandle: AvCmHc; const
    FCertHandle: AvCmHc; FMsgHandle: AvCmHmsg);
var
  W, K: DWORD;
  cSerialNum: AnsiString;
  cAttrVal: AnsiString;
  cOID, cOIDName: AnsiString;
  i: Integer;
  DateFrom, DateTo: TSystemTime;
  CertStatRes: DWORD;
  cKeySignerID: AnsiString;
  cSerialPublisher: AnsiString;
  f: DWORD;
  hACert: AvCmHcert;
  SizeRes: cardinal;
  NewCert: TAttrCertInfo;
  NewAttrVal: TAttrCertValue;
  params: AvCmEnumGetParam;
  hcert_enum: AvCmHcertEnum;
begin
  {$IFDEF USE_CODESITE}CodeSite.TraceMethod(Self, 'FillFromCert', tmoTiming);{$ENDIF}
  UNPList.Clear;
  SizeRes := SizeOf(CertStatRes);
  CheckMsg(AvCmGetCertAttr(FCertHandle, AVCM_VALID, nil, @CertStatRes, SizeRes, 0));
  if CertStatRes <> 0 then
  begin
    // Сертификат не корректен, обработка и вывод этого сертификата пока в ПО
    // не предусмотрена, но если нужен текст сообщения, то его можно получить
    // так:
    //ErrorText := GetMsg(CertStatRes);
    Exit;
  end;
  // Проверяем, выполнино ли ЭЦП сертификатом юридического лица
  // В сертификате должен присутствовать атрибут с OID=1.2.112.1.2.1.1.1.1.2=Учетный номер плательщика
  if AvCmGetCertAttr(FCertHandle, AVCM_EXT_AS_STRING, PAnsiChar('1.2.112.1.2.1.1.1.1.2'), Nil, W, AVCMF_ATTR_BY_OID) = 0 Then begin
     SetLength(cOIDName, W - 1);
     CheckMsg(AvCmGetCertAttr(FCertHandle, AVCM_EXT_AS_STRING, PAnsiChar('1.2.112.1.2.1.1.1.1.2'), @cOIDName[1], W, AVCMF_ATTR_BY_OID));
     if cOIDName <> EmptyStr then
     begin
       UNPList.Add(cOIDName);
       LogMsg(Format('В сообщении найден код УНП %s выданный %s', [cOIDName, 'УЦ РУЦ (сертификатом юридического лица)']));
       Exit;
     end;
  end;
  // Извлекаем значение серийного номера сертификата, которым подписано сообщение
  // актуально на 23.12.2014 т.к. по информации от Авеста на данный момент атрибутный сертификат связан
  // с сертификатом физ. лица через серийный номер (флаг AVCM_SERIAL_AS_STRING),
  // до этого связь была через ключ субъекта (флаг AVCM_PUB_KEY_ID)
  CheckMsg(AvCmGetCertAttr(FCertHandle, AVCM_SERIAL_AS_STRING{AVCM_PUB_KEY_ID}, Nil, Nil, W, 0));
  SetLength(cKeySignerID, W - 1);
  CheckMsg(AvCmGetCertAttr(FCertHandle, AVCM_SERIAL_AS_STRING{AVCM_PUB_KEY_ID}, Nil, @cKeySignerID[1], W, 0));

  // Иначе ищем атрибутные сертификаты
  params.param_id := AVCM_ATTRIBUTE_CERTS;
  //Поиск атрибутных сертификатов в сообщении
  params.param := @FMsgHandle;
  AvCmOpenCertEnum(FLoginHandle, 1,  @params, hcert_enum, 0);
  f := AVCMF_START;
  while AvCmEnumGet(hcert_enum, hACert, f) = 0 do begin
    f := 0;
    // Если ищем в сообщении - проверим на кого выпущен атрибутный сертификат
    CheckMsg(AvCmGetCertAttr(hACert, AVCM_PUB_KEY_ID, @i, Nil, W, 0));
    SetLength(cSerialPublisher, W - 1);
    CheckMsg(AvCmGetCertAttr(hACert, AVCM_PUB_KEY_ID, @i, @cSerialPublisher[1], W, 0));
    if cKeySignerID <> cSerialPublisher then begin
      //Writeln('Этот атрибутный сертификат выпущен на другой сертифика с KEY_ID ' + S1);
      Continue;
    end;
    NewCert := TAttrCertInfo.Create;
    try
      NewCert.CertHandle := hACert;
      // получаем найденные сертификаты
      //получаем требуемый размер
      CheckMsg(AvCmGetCertAttr(hACert, AVCM_SERIAL_AS_STRING, Nil, Nil, W, 0));
      // выделяем память (дельфи авоматом содержит конец строки пожтому выделяем на 1 меньше)
      SetLength(cSerialNum, W - 1);
      // получаем значение атрибута
      CheckMsg(AvCmGetCertAttr(hACert, AVCM_SERIAL_AS_STRING, Nil, @cSerialNum[1], W, 0));
      //Writeln(WideString('Найден атрибутный сертификат серийный номер ' + S));
      NewCert.SerialNum := cSerialNum;
      w := SizeOf(DateFrom);
      CheckMsg(AvCmGetCertAttr(FCertHandle, AVCM_NOT_BEFORE, Nil, @DateFrom, W, 0));
      CheckMsg(AvCmGetCertAttr(FCertHandle, AVCM_NOT_AFTER, Nil, @DateTo, W, 0));
      NewCert.ActiveFrom := SystemTimeToDateTime(DateFrom);
      NewCert.ActiveTo := SystemTimeToDateTime(DateTo);
      // количество дополнительных атрибутов
      W := SizeOF(K);
      CheckMsg(AvCmGetCertAttr(hACert, AVCM_ATTR_COUNT, Nil, @K, W, 0));
      for i := 0 to K - 1 do begin
        CheckMsg(AvCmGetCertAttr(hACert, AVCM_ATTR_OID, @i, Nil, W, 0));
        SetLength(cOID, W - 1);
        CheckMsg(AvCmGetCertAttr(hACert, AVCM_ATTR_OID, @i, @cOID[1], W, 0));

        CheckMsg(AvCmGetCertAttr(hACert, AVCM_ATTR_OID_NAME, @i, Nil, W, 0));
        SetLength(cOIDName, W - 1);
        CheckMsg(AvCmGetCertAttr(hACert, AVCM_ATTR_OID_NAME, @i, @cOIDName[1], W, 0));

        CheckMsg(AvCmGetCertAttr(hACert, AVCM_ATTR_AS_STRING, @i, Nil, W, 0));
        SetLength(cAttrVal, W - 1);
        CheckMsg(AvCmGetCertAttr(hACert, AVCM_ATTR_AS_STRING, @i, @cAttrVal[1], W, 0));
        NewAttrVal.AttrOID := cOID;
        NewAttrVal.AttrName := cOIDName;
        NewAttrVal.AttrValue := cAttrVal;
        NewCert.AttrValList.Add(cOID, NewAttrVal);
        //1.2.112.1.2.1.1.1.1.2=Уникальный номер налогоплательщика
        if NewAttrVal.AttrOID = csCodeUNP_RUC then
        begin
          UNPList.Add(NewAttrVal.AttrValue);
          LogMsg(Format('В сообщении найден код УНП %s выданный %s S/N %s', [NewAttrVal.AttrValue, 'УЦ РУЦ (атрибутный сертификат)',
            cSerialNum]));
        end;
      end;
      AttrCertList.Add(NewCert.SerialNum, NewCert);
    except on E: Exception do
      begin
        NewCert.Free;
        raise;
      end;
    end;
  end;
end;

procedure TCertExtInfo.FillFromCertVal(const UNPCode: string; const
    UNPPublisher: TUNPPublisherType);
begin
  UNPList.Clear;
  UNPList.Add(UNPCode);
  FUNPPublisherType := UNPPublisher;
end;

function TCertExtInfo.GetCertByCodeUNP(const CodeUNP: string): AvCmHCert;
var
  CertSerial: string;
begin
  Result := nil;
  for CertSerial in AttrCertList.Keys do
  begin
    if AttrCertList.Items[CertSerial].AttrValList.ContainsKey(csCodeUNP_RUC) and
       (AttrCertList.Items[CertSerial].AttrValList.Items[csCodeUNP_RUC].AttrValue = CodeUNP) then
      Exit(AttrCertList.Items[CertSerial].CertHandle);
  end;
end;

function TCertExtInfo.GetSNByCodeUNP(const CodeUNP: string): string;
var
  CertSerial: string;
begin
  Result := EmptyStr;
  for CertSerial in AttrCertList.Keys do
  begin
    if AttrCertList.Items[CertSerial].AttrValList.ContainsKey(csCodeUNP_RUC) and
       (AttrCertList.Items[CertSerial].AttrValList.Items[csCodeUNP_RUC].AttrValue = CodeUNP) then
      Exit(CertSerial);
  end;
end;

procedure TCertExtInfo.LogMsg(const aMessage: string);
begin
  if Assigned(LogFunc) then
    LogFunc(aMessage);
end;

procedure TCertExtInfo.SetLogFunc(const Value: TLogInfoFunc);
begin
  FLogFunc := Value;
end;

constructor TAttrCertInfo.Create;
begin
  inherited Create;
  FAttrValList := TDictionary<string, TAttrCertValue>.Create();
end;

destructor TAttrCertInfo.Destroy;
begin
  FreeAndNil(FAttrValList);
  inherited Destroy;
end;

end.
