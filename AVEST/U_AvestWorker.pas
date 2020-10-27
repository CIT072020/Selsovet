//Для Вадима Петровича:
//Метод TCryptMain.EncryptText в файле Crypto_Classes используется у нас в электронном респонденте.
//Метод TAVWorker.DecryptDocFromStream в файле U_AvestWorker - расшифровывает полученные сообщения.


unit U_AvestWorker;

interface

uses
  OtlTaskControl, U_SOOComplexDoc, AvCryptMail, Classes, OtlSync,
  {$IFDEF USE_CODESITE} CodeSiteLogging, {$ENDIF}
  U_SharedStructs, U_AvestConst, EISGS_ReceiveServiceLib_Intf, xmldom,
  msxml2_tlb, SOO_Consts, CLS_AUDIT, AvHash;

type
  TAVWorker = class
  strict private
    FIsLoggedIn: Boolean;
    {$REGION 'Признак необходимости закрытия дескриптора подключения к библиотеке Авест...'}
    ///	<summary>Признак необходимости закрытия дескриптора подключения к
    ///	библиотеке Авеста. Необходимо в том случае, если логин происходил
    ///	именно в данном экземпляре.</summary>
    {$ENDREGION}
    FIsNeedCloseMainAVHandle: boolean;
    {$REGION 'Расширенная информация в сертификате подключившегося пользователя.'}
    ///	<summary>Расширенная информация в сертификате подключившегося
    ///	пользователя.</summary>
    {$ENDREGION}
    FLoggedCertExtInfo: TCertExtInfo;

    {$REGION 'Тип издателя и его способ хранения УНП в сертификате'}
    ///	<summary>Тип издателя и его способ хранения УНП в сертификате</summary>
    ///	<remarks>В зависимости от версии УЦ издателя может быть в различных
    ///	атрибутах или вообще идти как один из параметров атрибутного
    ///	сертификата.</remarks>
    {$ENDREGION}
    {$REGION 'Публичный идентификатор ключа подключаемого пользователя'}
    ///	<summary>Публичный идентификатор ключа подключаемого
    ///	пользователя</summary>
    {$ENDREGION}
    FCertPubKeyID: AnsiString;

    {$REGION 'Признак инициализации библиотеки'}
    ///	<summary>Признак инициализации библиотеки</summary>
    {$ENDREGION}
    FIsInited: Boolean;
    FIsNeedShutDownAVLib: Boolean;

    {$REGION 'Информация из сертификата о его владельце'}
    ///	<summary>Информация из сертификата о его владельце</summary>
    {$ENDREGION}
    FLoggedPersonInfo: TSignPersonInfo;

    {$REGION 'Указатель на вошедшего пользователя в библ. Авест'}
    ///	<summary>Указатель на вошедшего пользователя в библ. Авест</summary>
    {$ENDREGION}
    FLoggedUserHandle: AvCmHc;

    {$REGION 'Пароль контейнера'}
    ///	<summary>Пароль контейнера</summary>
    {$ENDREGION}
    FPassword: AnsiString;
    FPathToAVLibrary: AnsiString;

    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure ImportCERInRepository(AStream: TMemoryStream);
    procedure ImportCertListInRepository(AStream: TMemoryStream);
    procedure ImportCertsInRepository(AStream: TMemoryStream; const ATypeCert:
        Cardinal);
    procedure ImportCRLInRepository(AStream: TMemoryStream);

    function CheckLoggedPersonValid: Boolean;

    {$REGION 'Инициализация и логин в библиотеку Авест'}
    ///	<summary>Инициализация и логин в библиотеку Авест</summary>
    {$ENDREGION}
    function LoginToAvest(out ErrStr: string): boolean;
    procedure FillLoggedPersonInfo;

    {$REGION 'Расшифровка потока'}
    ///	<summary>Расшифровка потока</summary>
    {$ENDREGION}
    function DecryptDocFromStream(const ADocAsStream: TMemoryStream; const
        AOutStream: TMemoryStream; out ErrMessage: string; const RaiseIfError:
        Boolean = True): Boolean;

    {$REGION 'Получение значения атрибута сертификата'}
    ///	<summary>Получение значения атрибута сертификата</summary>
    {$ENDREGION}
    function GetCertAttribAsString(const HCert: AvCmHcert; AttribName: AnsiString;
        DefValue: AnsiString = ''; const IsExtendedAttrib: Boolean = False):
        AnsiString;
    function HexToStr(AInputStr: AnsiString): AnsiString;
    procedure StoreLoggedPersonToAttr(XMLElem: IXMLDOMElement);
    function StrToHEX(InputString: AnsiString): AnsiString;
  private
    FIsLibrarySupportAttrCert: Boolean;
    FIsLibrarySupportAttrCert1: Boolean;
    function GetAvestDLLVersion: string;
    function GetAvestDLLVersion1: string;
    function GetUNPPublisher: TUNPPublisherType;
    procedure LoginWithoutAuthorization;

  public
    constructor Create(PathToAVLibrary: AnsiString; IsNeedInitAVLib: Boolean);
    function AddHashToTemplate(const SourceDoc: IXMLDOMDocument2; out ErrStr:
        string): boolean;
    class function CheckInstallAvestDll(const ADllFullName: string): Boolean;
    function CheckXMLDocSignCorrectly(const DocForSign: IXMLDOMDocument2; LogFunc:
        TExtLogInfoFunc; out ErrCode: TTicketErrorCode; out ErrMessage,
        FoundedCodeUNP, SignerCertSN: string; PathToSignBody: string = ''): Boolean;
    {$REGION 'Расшифровать документ'}
    ///	<summary>Расшифровать документ</summary>
    {$ENDREGION}
    procedure DecryptDoc(aDocRec: TSOOComplexDoc);
    /// <summary>TAVWorker.DeleteSignInfo Удаляет из XML документа тег с ЭЦП (
    /// SignInfoElement), если он есть и нормализует документ.
    /// </summary>
    function DeleteSignInfo(const AXMLDoc: IXMLDOMDocument2; const
        ASignInfoNodePath: string): IXMLDOMDocument2;
    /// <summary>TAVWorker.DeleteSignInfo1 Удаляет из XML документа тег с ЭЦП (
    /// SignInfoElement), если он есть и нормализует документ.
    /// </summary>
    function DeleteSignInfo1(const AXMLDoc: IXMLDOMDocument2; const
        ASignInfoNodePath: string): IXMLDOMDocument2;
    function GetXMLDocAsStreamWithEncoding(const AXMLDoc: IXMLDOMDocument2):
        TMemoryStream;

    {$REGION 'Начать сеанс работы с библиотекой криптографии'}
    ///	<summary>Начать сеанс работы с библиотекой криптографии</summary>
    ///	<param name="aCertID">Публичный ключ сертификата пользователя</param>
    ///	<param name="aPassword">Пароль</param>
    {$ENDREGION}
    function Initialize(aCertID, aPassword: AnsiString; out ErrStr: string):
        Boolean; overload;
    function Initialize(aOpenSession: AvCmHc; out ErrStr: string):boolean; overload;
    function Initialize(out ErrStr: string):boolean; overload;

    {$REGION 'Начать сеанс работы с библиотекой криптографии.'}
    ///	<summary>Начать сеанс работы с библиотекой криптографии.</summary>
    ///	<remarks>Пользователь сам выберет сертификат, которыс необходимо
    ///	авторизоваться.</remarks>
    {$ENDREGION}
    function IsLoggedHaveAttrCerts: Boolean;

    function LoadSOSCertFromArray(ACertList: BinaryArray; out ErrStr: string):
        Boolean;

    {$REGION 'Завершение сеанса работы с криптографией.'}
    ///	<summary>Завершение сеанса работы с криптографией.</summary>
    {$ENDREGION}
    function Logout(out ErrStr: string): boolean;
    function SignXMLDoc(const ADocForSign: IXMLDOMDocument2; const
        ASignInfoNodePath: string; out OutDocAsAnsiString: AnsiString; out
        ErrMessage: string): Boolean;

    {$REGION 'Признак успешной инициализации библиотеки и выполненного входа в сеанс.'}
    ///	<summary>Признак успешной инициализации библиотеки и выполненного входа
    ///	в сеанс.</summary>
    {$ENDREGION}
    property AvestDLLVersion: string read GetAvestDLLVersion1;
    property IsLibrarySupportAttrCert: Boolean read FIsLibrarySupportAttrCert1;
    property IsLoggedIn: Boolean read FIsLoggedIn;

    {$REGION 'Расширенная информация в сертификате подключившегося пользователя.'}
    ///	<summary>Расширенная информация в сертификате подключившегося
    ///	пользователя.</summary>
    {$ENDREGION}
    property LoggedCertExtInfo: TCertExtInfo read FLoggedCertExtInfo;

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
    property UNPPublisher: TUNPPublisherType read GetUNPPublisher;
    /// <summary>
    /// Информация из сертификата о его владельце
    /// </summary>
    /// type:TSignPersonInfo
    property LoggedPersonInfo: TSignPersonInfo read FLoggedPersonInfo;
    property LoggedUserHandle: AvCmHc read FLoggedUserHandle;
  end;

implementation


uses
  SysUtils, Windows, XMLIntf, XMLDoc, StrUtils, U_AuditConsts, U_AVFuncs;

const
  csTwoParamWithDelim = '%s: %s';
  csDocForDecryptNotLoadFromDB = 'Документ переданный для расшифровки не загружен из СУБД';
  csAVSessionNotInitialized = 'Сеанс работы с криптографией не инициализирован.';
var
  AVLoginCS: TOmniCS;
  AVLogoutCS: TOmniCS;
  AvInitializationDialogCriticalSection: TOmniCS;

constructor TAVWorker.Create(PathToAVLibrary: AnsiString; IsNeedInitAVLib:
    Boolean);
begin
  FIsNeedShutDownAVLib := False;
  FPathToAVLibrary := PathToAVLibrary;
  if IsNeedInitAVLib then
  begin
    if FPathToAVLibrary = EmptyStr then
      CheckMsg(AvCmInit(AVCMF_STARTUP))
    else
      CheckMsg(AvCmInitEx(PChar(FPathToAVLibrary), AVCMF_STARTUP));
    FIsNeedShutDownAVLib := True;
  end;
end;

function TAVWorker.AddHashToTemplate(const SourceDoc: IXMLDOMDocument2; out
    ErrStr: string): boolean;
var
  MemStream: TMemoryStream;
  FHashString: String;
  HashElement: IXMLDOMElement;
begin
  try
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
    Result := True;
  except
    on E: Exception do
    begin
      {$IFDEF USE_CODESITE}CodeSite.SendException(E);{$ENDIF}
      ErrStr := e.Message;
      Result := False;
    end;
  end;
end;

{ TAVWorker }

procedure TAVWorker.AfterConstruction;
begin
  inherited;
  FIsInited := False;
  FIsLoggedIn := False;
  FIsNeedCloseMainAVHandle := False;
  FLoggedCertExtInfo := TCertExtInfo.Create;
end;

procedure TAVWorker.BeforeDestruction;
var
  ErrStr: string;
begin
  inherited;
  if FIsNeedCloseMainAVHandle then
    Logout(ErrStr);
  if FIsNeedShutDownAVLib then
    if FPathToAVLibrary = EmptyStr then
      AvCmInit(AVCMF_SHUTDOWN)
    else
      AvCmInitEx(PChar(FPathToAVLibrary), AVCMF_SHUTDOWN);

  FreeAndNil(FLoggedCertExtInfo);
end;

class function TAVWorker.CheckInstallAvestDll(const ADllFullName: string): Boolean;
begin
  // Define !!!! AVCRYPTMAIL_DYNAMIC
  if not DLLLoaded then
    AvCryptMail.LoadAvCryptMailDLL(ExtractFilePath(ADllFullName) + AVCRYPTMAIL_NAME_DLL);

  Result := DLLLoaded;
end;

function TAVWorker.CheckLoggedPersonValid: Boolean;
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
        //23.06.2017 Белстат получил серт. от налоговой по новой карточке ОК, там есть и УНП и емайл
        // ломает старые правила
        //        FieldStr := UpperCase(Trim(FLoggedPersonInfo.DNSIDAttr));
        FieldStr := UpperCase(Trim(FLoggedPersonInfo.EMAIL));
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

function TAVWorker.CheckXMLDocSignCorrectly(const DocForSign: IXMLDOMDocument2;
    LogFunc: TExtLogInfoFunc; out ErrCode: TTicketErrorCode; out ErrMessage,
    FoundedCodeUNP, SignerCertSN: string; PathToSignBody: string = ''): Boolean;
var
  AVErrorCode: Cardinal;
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
  try
    try
      // Пытаемся извлечь подпись
      if PathToSignBody = EmptyStr then
        NodeWithSign := DocForSign.documentElement.selectSingleNode(csPathToSignInERDoc + '/' + csSignDataNodeName)
      else
        NodeWithSign := DocForSign.documentElement.selectSingleNode(PathToSignBody);
      if not Assigned(NodeWithSign) then
      begin
        ErrMessage := rsNoECPInDocument;
        Exit(False);
      end;
      SignHEXBody := NodeWithSign.text;
      NodeWithSign := nil;
      SSign := HexToStr(SignHEXBody);
      // Вычищаем от подписи документ
      ClearDoc := DeleteSignInfo(DocForSign, csPathToSignInERDoc);
      try
        DocAsMemStream := GetXMLDocAsStreamWithEncoding(ClearDoc);
        try
          CheckMsg(AvCmOpenMsg(FLoggedUserHandle, @SSign[1], Length(SSign), hmsg, AVCMF_IN_PKCS7));
          ishmsgInited := True;
          CheckMsg(AvCmSetMsgContent(hmsg, DocAsMemStream.Memory, DocAsMemStream.Size, 0));
        finally
          DocAsMemStream.Free;
        end;
      finally
        ClearDoc := nil;
      end;
      // Проверяем кол-во подписей в документе (вероятность >1 близка к 0)
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
        AVErrorCode := AvCmMsgVerifySignAtIndex(hmsg, 0, 0);
        CheckMsg(AVErrorCode);
      except
        on E: EAvCryptMailException do
        begin
          case E.ErrorCode of
            AVCMR_SIGN_INVALID:
              ErrCode := tecBadSign;
            AVCMR_CERT_REVOKED, AVCMR_CERT_EXPIRED, AVCMR_CERT_ALREADY_EXPIRED:
              ErrCode := tecCertRevoked;
            AVCMR_CERT_TEMPORARY_REVOKED:
              ErrCode := tecCertSuspended;
            AVCMR_CRL_EXPIRED:
              ErrCode := tecSOSTimeInvalid;
            AVCMR_BAD_HCRL:
              ErrCode := tecSOKNotSupported;
            else
            begin
{$IFDEF USE_CODESITE}CodeSite.SendException(E);{$ENDIF}
              ErrCode := tecUndefined;
            end;
          end;
          ErrMessage := E.Message;
          Exit(False);
        end;
        on E: Exception do
        begin
{$IFDEF USE_CODESITE}CodeSite.SendException(E);{$ENDIF}
          ErrCode := tecUndefined;
          ErrMessage := E.Message;
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
      SignerCertSN := GetCertAttribAsString(HCert, csCertPublicKey, EmptyStr, True);
      SignerCertSN := StringReplace(SignerCertSN, ' ', EmptyStr, [rfReplaceAll]);
      LogFunc(ciInfo4, Format('S/N сертификата:%s УНП:%s', [SignerCertSN, FoundedCodeUNP]));
      if (FoundedCodeUNP = EmptyStr) then
      begin
        // Может быть что сертификат РУЦА, тогда читаем атрибут УНП в другом OID
        FoundedCodeUNP := GetCertAttribAsString(HCert, csCodeUNP_RUC, EmptyStr, False);
        LogFunc(ciInfo4, Format('Попытка найти УНП выданный РУЦом. OID:%s УНП:%s', [csCodeUNP_RUC, FoundedCodeUNP]));
        if FoundedCodeUNP = EmptyStr then
        begin
          SignerCertInfo := TCertExtInfo.Create;
          try
            SignerCertInfo.LogFunc := LogFunc;
            SignerCertInfo.FillFromCert(FLoggedUserHandle, HCert, hmsg);
            for I := 0 to SignerCertInfo.UNPList.Count - 1 do
              FoundedCodeUNP := FoundedCodeUNP + SignerCertInfo.UNPList[i] + ';';
            if FoundedCodeUNP <> EmptyStr then
             FoundedCodeUNP := LeftStr(FoundedCodeUNP, Length(FoundedCodeUNP) - 1);
          LogFunc(ciInfo4, Format('Чтение аттр. серт. найдено:%d УНП:%s', [SignerCertInfo.UNPList.Count, FoundedCodeUNP]));
          finally
            SignerCertInfo.Free;
          end;
          if FoundedCodeUNP = EmptyStr then
          begin
            ErrCode := tecUNPNotFoundInSOK;
            ErrMessage := 'Код УНП не найден в ЭЦП подписывающего.';
          end;
        end;
        {else
          LogFunc(ciInfo4, Format(rsFoundedUNPInARMDoc,
            [FoundedCodeUNP, 'УЦ РУЦ (новый OID)', aDocID]));}
      end;
      {else
        LogFunc(ciInfo4, Format(rsFoundedUNPInARMDoc, [FoundedCodeUNP, 'УЦ МНС', aDocID]));}
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
  end;
end;

procedure TAVWorker.DecryptDoc(aDocRec: TSOOComplexDoc);
var
  TempStr: string;
begin
  if aDocRec.CurrentStatus <> midsReadyForProcessing then
    raise Exception.Create(csDocForDecryptNotLoadFromDB);
  if not FIsInited then
    raise Exception.Create(csAVSessionNotInitialized);
  {$IFDEF SAVE_MYSQL_DOCONHDD}
  aDocRec.DocBody.SaveToFile('d:\ID_'+IntToStr(aDocRec.IntID)+'.bin');
  {$ENDIF}
  if not DecryptDocFromStream(aDocRec.DocBody, aDocRec.DecryptedDocBody, TempStr, False) then
  begin
    aDocRec.LastErrorMessage := TempStr;
    aDocRec.CurrentStatus := midsErrorDecrypt;
    raise Exception.Create(aDocRec.LastErrorMessage);
  end;
  aDocRec.CurrentStatus := midsDecrypted;
  aDocRec.LastErrorMessage := EmptyStr;
end;

function TAVWorker.DecryptDocFromStream(const ADocAsStream: TMemoryStream; const
    AOutStream: TMemoryStream; out ErrMessage: string; const RaiseIfError:
    Boolean = True): Boolean;
var
  OutBuffer: Pointer;
  OutBufferSize: Cardinal;
begin
  {$IFDEF USE_CODESITE}CodeSite.TraceMethod(Self, 'DecryptDocFromStream', tmoTiming);{$ENDIF}
  try
    CheckMsg(AvCmDecrypt(FLoggedUserHandle, ADocAsStream.Memory, ADocAsStream.Size, @OutBuffer,
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
      {LogMessage(EVENTLOG_ERROR_TYPE, ciaCatAvestEvents, ciaAvErrorDecryptDoc,
        [ErrMessage]);}
      if RaiseIfError then
        Raise ;
    end;
  end;
end;

function TAVWorker.DeleteSignInfo(const AXMLDoc: IXMLDOMDocument2; const
    ASignInfoNodePath: string): IXMLDOMDocument2;
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

function TAVWorker.DeleteSignInfo1(const AXMLDoc: IXMLDOMDocument2; const
    ASignInfoNodePath: string): IXMLDOMDocument2;
var
  OldNode: IXMLDOMNode;
begin
  {$IFDEF USE_CODESITE}CodeSite.TraceMethod(Self, 'DeleteSignInfo1', tmoTiming);{$ENDIF}
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

procedure TAVWorker.FillLoggedPersonInfo;
var
  HCert: AvCmHcert;
  BuffSize: Cardinal;
begin
  if not IsLoggedIn then
    Exit;
  BuffSize := SizeOf(HCert);
  CheckMsg(AvCmGetObjectInfo(FLoggedUserHandle, AVCM_MY_CERT, @HCert, BuffSize, 0));
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
      LoggedCertExtInfo.FillFromLoginSession(FLoggedUserHandle);
      if (LoggedCertExtInfo.UNPList.Count > 0) then
        LoggedCertExtInfo.UNPPublisherType := unpAttrCert
      else
        LoggedCertExtInfo.UNPPublisherType := unpNotDefined;
    end;
  finally
    CheckMsg(AvCmCloseHandle(HCert, 0));
  end;
end;

function TAVWorker.GetAvestDLLVersion: string;
begin
  Result := EmptyStr;
  if not DLLLoaded then
    Exit;
  Result := FileVersion(AvCryptMailDLLPath + AVCRYPTMAIL_NAME_DLL);
end;

function TAVWorker.GetAvestDLLVersion1: string;
begin
  Result := EmptyStr;
  if not DLLLoaded then
    Exit;
  Result := FileVersion(AvCryptMailDLLPath + AVCRYPTMAIL_NAME_DLL);
end;

function TAVWorker.GetCertAttribAsString(const HCert: AvCmHcert;
    AttribName: AnsiString; DefValue: AnsiString = ''; const IsExtendedAttrib:
    Boolean = False): AnsiString;
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
  CheckMsg(AvCmGetCertAttr(HCert, SearchContext, PAnsiChar(AttribName),
      @Result[1], W, AVCMF_ATTR_BY_OID));
end;

function TAVWorker.GetUNPPublisher: TUNPPublisherType;
begin
  Result := unpNotDefined;
  if not IsLoggedIn then
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

function TAVWorker.GetXMLDocAsStreamWithEncoding(const AXMLDoc:
    IXMLDOMDocument2): TMemoryStream;

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

function TAVWorker.HexToStr(AInputStr: AnsiString): AnsiString;
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

procedure TAVWorker.ImportCERInRepository(AStream: TMemoryStream);
begin
  ImportCertsInRepository(AStream, AVCM_CERTIFICATE);
end;

procedure TAVWorker.ImportCertListInRepository(AStream: TMemoryStream);
var
  hmsg: AvCmHmsg;
begin
  if not Assigned(AStream) then
    Exit;
  AStream.Position := soFromBeginning;
  CheckMsg(AvCmOpenMsg(FLoggedUserHandle, AStream.Memory, AStream.Size, hmsg, AVCMF_IN_PKCS7));
  try
    CheckMsg(AvCmMsgImportCerts(hmsg, AVCMF_IMPORT_ALL_CERTS));
  finally
    CheckMsg(AvCmCloseHandle(hmsg, 0));
  end;
  CheckMsg(AvCmFlush(FLoggedUserHandle, 0));
end;

procedure TAVWorker.ImportCertsInRepository(AStream: TMemoryStream; const
    ATypeCert: Cardinal);
begin
  if not Assigned(AStream) then
    Exit;
  AStream.Position := soFromBeginning;
  CheckMsg(AvCmImport(FLoggedUserHandle, ATypeCert, AStream.Memory, AStream.Size, 0, nil, 0));
  CheckMsg(AvCmFlush(FLoggedUserHandle, 0));
end;

procedure TAVWorker.ImportCRLInRepository(AStream: TMemoryStream);
begin
  ImportCertsInRepository(AStream, AVCM_CRL);
end;

function TAVWorker.Initialize(out ErrStr: string): boolean;
begin
  if FIsLoggedIn then
    Exit(True);
  try
    //CheckMsg(AvCmLogin(0, Nil, FLoggedUserHandle, 0));
    CheckMsg(AvCmLogin(0, Nil, FLoggedUserHandle, AVCMF_DENY_TOKEN_CONTROL)); //запрет контроля наличия вставленного носителя с личным ключом
    FIsInited := True;
    FIsLoggedIn := True;
    FIsNeedCloseMainAVHandle := True;
    FIsLibrarySupportAttrCert := (AvestDLLVersion > csVerAVLibWithAttrib);
    FillLoggedPersonInfo;
    if not CheckLoggedPersonValid then
    begin
      Logout(ErrStr);
      ErrStr :=  rsWrongCertLoggedUser;
      Exit(False);
    end;
    Result := FIsLoggedIn;
  except
    on E: Exception do
    begin
      {$IFDEF USE_CODESITE}CodeSite.SendException(E);{$ENDIF}
      ErrStr := e.Message;
      Result := False;
    end;
  end;
end;

function TAVWorker.Initialize(aOpenSession: AvCmHc; out ErrStr: string): boolean;
var
  MyCert: AvCmHcert;
  CertSize: Cardinal;
  MyCertPubKeyId: AnsiString;
  PubKeyIdSize: DWORD;
  AvInitParam: AvCmConnectionParam;
begin
  //FLoggedUserHandle := aOpenSession;
  CertSize := SizeOf(MyCert);
  AvInitializationDialogCriticalSection.Acquire;
  try
  CheckMsg(AvCmGetObjectInfo(aOpenSession, AVCM_MY_CERT, @MyCert, CertSize, 0));
  CheckMsg(AvCmGetCertAttr(MyCert, AVCM_PUB_KEY_ID, nil, nil, PubKeyIdSize, 0));
  SetLength(MyCertPubKeyId, PubKeyIdSize);
  CheckMsg(AvCmGetCertAttr(MyCert, AVCM_PUB_KEY_ID, nil, @MyCertPubKeyId[1], PubKeyIdSize, 0));
  AvInitParam.param_id := AVCM_PUB_KEY_ID;
  AvInitParam.param := @MyCertPubKeyId[1];
  CheckMsg(AvCmLogin(1, @AvInitParam, FLoggedUserHandle, AVCMF_DENY_TOKEN_CONTROL));
  finally
    AvInitializationDialogCriticalSection.Release;
    SetLength(MyCertPubKeyId, 0);
  end;
  FIsNeedCloseMainAVHandle := False;
  FIsInited := True;
  FIsLoggedIn := true;
  try
    FillLoggedPersonInfo;
    if CheckLoggedPersonValid then
    begin
      FIsLibrarySupportAttrCert := (AvestDLLVersion > csVerAVLibWithAttrib);
    end
    else
    begin
      FIsLoggedIn := False;
      FIsInited := False;
      FLoggedUserHandle := nil;
      ErrStr := csBadCertForSOO;
    end;
  except
    on E: Exception do
    begin
      {$IFDEF USE_CODESITE}CodeSite.SendException(E);{$ENDIF}
      FIsLoggedIn := False;
      FIsInited := False;
      FLoggedUserHandle := nil;
      ErrStr := e.Message;
    end;
  end;
  Result := FIsInited;
end;

function TAVWorker.Initialize(aCertID, aPassword: AnsiString; out ErrStr:
    string): Boolean;
begin
  Assert((ACertID<>EmptyStr)and(aPassword <> EmptyStr));
  FCertPubKeyID := aCertID;
  FPassword := aPassword;
  FIsInited := LoginToAvest(ErrStr);
  if FIsInited then
    FIsNeedCloseMainAVHandle := True;
  Result := FIsInited;
end;

function TAVWorker.IsLoggedHaveAttrCerts: Boolean;
var
  params: AvCmEnumGetParam;
  hcert_enum: AvCmHcertEnum;
  hAcert: AvCmHcert;
  RunRes: DWORD;
begin
  if not IsLoggedIn then
    raise Exception.Create('Вход в ПО КЗИ не выполнен.');
  if not IsLibrarySupportAttrCert then
    Exit(False);
  // Поиск атрибутных сертификатов, выданных на личный сертификат открытых ключей
  params.param_id := AVCM_ATTRIBUTE_CERTS;
  params.param := Nil;
  RunRes := AvCmOpenCertEnum(FLoggedUserHandle, 1,  @params, hcert_enum, 0);
  if RunRes = ciNotSupported then
    Exit(False);
  CheckMsg(RunRes);
  try
    Result := AvCmEnumGet(hcert_enum, hACert, AVCMF_START) = 0;
  finally
    CheckMsg(AvCmCloseHandle(hcert_enum, 0));
  end;
end;

function TAVWorker.LoadSOSCertFromArray(ACertList: BinaryArray; out ErrStr:
    string): Boolean;
var
  I: Integer;
  NeedLogout: boolean;
begin
  try
    NeedLogout := False;
    if not IsLoggedIn then
    begin
      LoginWithoutAuthorization;
      NeedLogout := True;
    end;
    try
      try
        for I := 0 to ACertList.Count - 1 do
        begin
          case ACertList[I].FileType of
            0:
            try
              ImportCERInRepository(ACertList[I].FileBody);
            except
              on E: EAvCryptMailException do
                if not ((E is EAvCryptMailException) and (EAvCryptMailException(E).ErrorCode = csErrorCERExists)) then
                  raise Exception.CreateFmt('Ошибка импорта сертификата пользователя из ПЦ: %s', [e.Message]);
            end;
            1:
            try
              ImportCRLInRepository(ACertList[I].FileBody);
            except
              on E: EAvCryptMailException do
              begin
                  // Импорт существ. в теории не должно быть, но не страшно.
                if (EAvCryptMailException(E).ErrorCode = AVCMR_ALREADY_EXISTS)
                  or (EAvCryptMailException(E).ErrorCode = AVCMR_OLD_CRL) then
                  //raise Exception.CreateFmt('Ошибка импорта СОС: %s %d', [E.Message, EAvCryptMailException(E).ErrorCode]);
                begin
                  //Не ошибка
                  Result := true;
                  if ErrStr <> EmptyStr then
                    ErrStr := ErrStr + NewLine + Format(csTwoParamWithDelim, [ACertList[I].FileName, e.Message])
                  else
                    ErrStr := Format(csTwoParamWithDelim, [ACertList[I].FileName, e.Message]);
                end;
              end;
              on E: Exception do
              begin
                  raise Exception.CreateFmt('Ошибка импорта СОС: %s %d', [E.Message, EAvCryptMailException(E).ErrorCode]);
              end;
            end;
          end;
        end;
      except
        on E: Exception do
          if not ((E is EAvCryptMailException) and ((EAvCryptMailException(E).ErrorCode = AVCMR_ALREADY_EXISTS)
            or (EAvCryptMailException(E).ErrorCode = AVCMR_OLD_CRL))) then
                  raise Exception.CreateFmt('%s %d', [E.Message, EAvCryptMailException(E).ErrorCode]);
      end;
    finally
      if NeedLogout then
         Logout(ErrStr);
    end;
  except
    on E: Exception do
    begin
      {$IFDEF USE_CODESITE}CodeSite.SendException(E);{$ENDIF}
      ErrStr := E.Message;
      Result := False;
    end;
  end;
end;

function TAVWorker.LoginToAvest(out ErrStr: string): boolean;
var
  ArrParams: array of AvCmConnectionParam;
begin
  AVLoginCS.Acquire;
  try
    if ((FCertPubKeyID<>EmptyStr)and(FPassword<>EmptyStr)) then
    begin
      SetLength(ArrParams, 2);
      ArrParams[0].param_id := AVCM_PASSWORD;
      ArrParams[0].param := Pointer(FPassword);
      ArrParams[1].param_id := AVCM_PUB_KEY_ID;
      ArrParams[1].param := Pointer(FCertPubKeyID);
      CheckMsg(AvCmLogin(2, Pointer(ArrParams), FLoggedUserHandle, 0));
    end
    else
      CheckMsg(AvCmLogin(0, nil, FLoggedUserHandle, 0));
  finally
    AVLoginCS.Release;
  end;
  FIsLoggedIn := true;
  FillLoggedPersonInfo;
  if CheckLoggedPersonValid then
    FIsLibrarySupportAttrCert := (AvestDLLVersion > csVerAVLibWithAttrib)
  else
  begin
    FIsLoggedIn := False;
    Logout(ErrStr);
    ErrStr := csBadCertForSOO;
  end;
  Result := FIsLoggedIn;
end;

procedure TAVWorker.LoginWithoutAuthorization;
begin
  AVLoginCS.Acquire;
  try
    CheckMsg(AvCmLogin(0, Nil, FLoggedUserHandle, AVCMF_NO_AUTH or AVCMF_IGNORE_CRL_ABSENCE));
    FIsLoggedIn := True;
    FIsLibrarySupportAttrCert := False;
  finally
    AVLoginCS.Release;
  end;
end;

function TAVWorker.Logout(out ErrStr: string): boolean;
begin
  try
    Result := True;
    if FIsLoggedIn and FIsNeedCloseMainAVHandle then
    begin
      AVLogoutCS.Acquire;
      try
        CheckMsg(AvCmLogout(FLoggedUserHandle, 0));
      finally
        AVLogoutCS.Release;
      end;
      FIsLoggedIn := False;
    end;
    FIsInited := False;
    FIsLoggedIn := False;
  except
    on E: Exception do
    begin
      {$IFDEF USE_CODESITE}CodeSite.SendException(E);{$ENDIF}
      Result := False;
      ErrStr := E.message;
    end;
  end;
end;

function TAVWorker.SignXMLDoc(const ADocForSign: IXMLDOMDocument2; const
    ASignInfoNodePath: string; out OutDocAsAnsiString: AnsiString; out
    ErrMessage: string): Boolean;
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
  I: Integer;
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
{$IFDEF USE_CODESITE}CodeSite.SendMsg('Подписание атрибутным сертификатом');{$ENDIF}
          // Открываем сообщение
          CheckMsg(AvCmOpenMsg(FLoggedUserHandle, AllDocAsStream.Memory, AllDocAsStream.Size,
            hmsg, AVCMF_IN_RAW_DATA));
{$IFDEF USE_CODESITE}CodeSite.SendMsg('Открываем сообщение');{$ENDIF}
          for UNPCode in LoggedCertExtInfo.UNPList do
          begin
            CurAttrCert := LoggedCertExtInfo.GetCertByCodeUNP(UNPCode);
            // Добавляем атрибутный сертификат
            if CurAttrCert <> Nil then
             begin
               CheckMsg(AvCmMsgSetAttribute(hmsg, AVCM_ATTRIBUTE_CERTS, @CurAttrCert, Nil, 0, 0));
               {LogMsg(Format('К сообщению добавлен атрибутный сертификат S/N %s с кодом УНП: %s',
                [LoggedCertExtInfo.GetSNByCodeUNP(UNPCode), UNPCode]));}
             end;
          end;
{$IFDEF USE_CODESITE}CodeSite.SendMsg('Добавили атрибутный сертификат');{$ENDIF}
          // подписываем
          CheckMsg(AvCmMsgSign(hmsg, AVCMF_ADD_SIGN_CERT or AVCMF_DETACHED));
          // получаем размер блоба
          CheckMsg(AvCmGetMsg(hmsg, Nil, SignBlockSize, 0));
          SetLength(SignBlockDody, SignBlockSize);
          CheckMsg(AvCmGetMsg(hmsg, @SignBlockDody[1], SignBlockSize, 0));
          AvCmCloseHandle(hmsg, 0);
{$IFDEF USE_CODESITE}CodeSite.SendMsg('Подписано подпись перемещена в строку');{$ENDIF}
        end
        else
        begin
          {LogMsgFmt('Сообщение подписано сертификатом с кодом УНП: %s OID кода УНП: %s',
                [LoggedPersonInfo.CodeUNP, LoggedPersonInfo.UNPOID]);}
          // Подписываем документ
{$IFDEF USE_CODESITE}CodeSite.SendMsg('Начало выполнения функции AvCmSign подписания');{$ENDIF}
          CheckMsg(AvCmSign(FLoggedUserHandle, AllDocAsStream.Memory, AllDocAsStream.Size,
            @PBlock, SignBlockSize, AVCMF_ADD_SIGN_CERT or AVCMF_IN_RAW_DATA or AVCMF_ALLOC or AVCMF_DETACHED));
{$IFDEF USE_CODESITE}CodeSite.SendMsg('Подписание сертификатом с УНП');{$ENDIF}
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
{$IFDEF USE_CODESITE}CodeSite.SendMsg('Подписано подпись перемещена в строку');{$ENDIF}
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
        {!!! if Assigned(AuditProvider) then
          AuditProvider.LogMessage(EVENTLOG_ERROR_TYPE, ciaCatAvestEvents,
            ciaAvErrorSignTicket, [ErrMessage]);}
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

procedure TAVWorker.StoreLoggedPersonToAttr(XMLElem: IXMLDOMElement);
begin
  XMLElem.setAttribute('OrgName', LoggedPersonInfo.OrgName);
  XMLElem.setAttribute('FirstName', LoggedPersonInfo.FirstName);
  XMLElem.setAttribute('LastName', LoggedPersonInfo.LastName);
  XMLElem.setAttribute('Department', LoggedPersonInfo.Department);
  XMLElem.setAttribute('Position', LoggedPersonInfo.Position);
end;

function TAVWorker.StrToHEX(InputString: AnsiString): AnsiString;
var
  i: Integer;
begin
  Result := EmptyStr;
  for i := 1 to Length(InputString) do
    Result := Result + IntToHex(Ord(InputString[i]), 2);
end;


end.

