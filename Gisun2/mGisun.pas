unit mGisun;
interface
uses
   wsGisun, SysUtils, Classes, Forms, TypInfo, SoapHTTPClient, XSBuiltIns, InvokeRegistry,
   Dialogs, DB, NativeXML, FuncPr;

type
   TGisunInterface=class(TObject)
   private
      //SOAP
      FRIO: THTTPRIO;
      //сервис
      FService: GisunCommonWs;
      //адрес сервиса
      FUrl: string;
      FProxy: string;
      //
      FMessageSource: string;
      //
      FFaultError: string;
      //
      FError: TDataSet;
   private
      //события SOAP
      procedure RIOAfterExecute(const MethodName: string; SOAPResponse: TStream);
      procedure RIOBeforeExecute(const MethodName: string; var SOAPRequest: WideString);
      //получение ссылки не сервис
      function GetService: GisunCommonWs;
      //
      procedure SetUrl(Value: string);
      procedure ClearError;
      procedure CopyErrorList(error_list: ErrorList);
   public
      constructor Create;
      destructor Destroy; override;
      //ИНТЕРФЕЙС:
      //создание объектов
      function CreateId: string;
      function CreateMessageCover(MessageType, ParentId: string): MessageCover;
      function CreateClassifier(Code: string; ClassifierType: Integer): Classifier;
      function CreateDateTime(DateTime: TDateTime): TXSDateTime;
      function CreateRegisterRequest(MessageType: string; PersonCount, IdentifierCount: Integer): register_request;
      function CreateDocument: Document;
      //обработка исключений
      procedure HandleException(E: Exception; Log: TStrings);
      //запись исключения в error-dataset
      function  FindNodeXML(x:TXMLNode; strFind:String):TXMLNode;
      procedure FaultDetailToError(strFaultDetail:String; strMessage:String);
      //вызов методов
      function GetPersonalData(const registerRequest: register_request; var registerResponse: register_response; Log: TStrings): Boolean;
      //ВСПОМОГАТЕЛЬНЫЕ ФУНКЦИИ ДЛЯ ТЕСТОВ:
      //вывод в лог
      procedure MessageCoverToLog(Log: TStrings; Cover: MessageCover);
      procedure ErrorListToLog(Log: TStrings; error_list: ErrorList);
      procedure PersonalDataToLog(Log: TStrings; Data: PersonalData; Add: string);
      procedure DocumentToLog(Log: TStrings; Doc: Document; Add: string);
      procedure AddressToLog(Log: TStrings; Adr: Address; Add: string);
      procedure FamilyToLog(Log: TStrings; Fam: Family; Add: string);
      procedure DeathToLog(Log: TStrings; D: Death; Add: string);
      procedure CitizenshipToLog(Log: TStrings; C: Citizenship; Add: string);
      //преобразование в строку
      function GetClassifierString(C: Classifier): string;
      function GetDateString(Date: TXSDate): string;
      function GetDateTimeString(DateTime: TXSDateTime): string;
      //другие вспомогательные
      function GetClassifierLexema(C: Classifier): string;
      function GetClassifierCode(C: Classifier): string;
   public
      property MessageSource: string read FMessageSource write FMessageSource;
      property Service: GisunCommonWs read GetService;
      property Url: string read FUrl write SetUrl;
      property Proxy: string read FProxy write FProxy;
      property FaultError: string read FFaultError;
      property Error: TDataSet read FError;
   end;

const
   //Типы классификаторов
   //-51 Статус авторизации
   //-50 Статус аутентификации
   //-40 Статус истории приема почты
   //-20 Ошибки в сообщениях вебсервисов
   ctStatus     = -18;  //Статус лица
   //-17 Входные атрибуты запроса
   //-16 Состав запрашиваемых данных
   //-12 Сигналы пользователя
   //-11 Типы операций (репозитарий)
   //-10 Связи семьи
   //-5 Орган установки системы
   //-3 Уровни доступа
   //-2 Типы системных документов
   //-1 Системные параметры
   //1 Области
   //6 Типы изменения гражданства
   //7 Населенные пункты
   ctCountry    =   8;  //Страны
   ctMVD        =  24;  //Органы МВД
   //29 Районы
   ctPol        =  32;  //Пол
   //34 Улицы
   ctTypeCityGit=  35;  //Типы населенных пунктов  места жительства
   ctTypeCity   =  68;  //Типы населенных пунктов  места рождения и места смерти
   ctDocType    =  37;  //Типы документов
   //38 Типы улиц
   ctZags       =  80;  //Органы ЗАГС
   ctDeathCause =  81;  //Причины смерти
   ctActType    =  82;  //Типы актовых записей

implementation
uses
   mRegInt;
   
{ TGisunInterface }

constructor TGisunInterface.Create;
begin
   //Список последних ошибок
   FError:=CreateErrorTable;
   //SOAP
   FRIO:=THTTPRIO.Create(nil);
   FRIO.OnAfterExecute:=RIOAfterExecute;
   FRIO.OnBeforeExecute:=RIOBeforeExecute;
end;

destructor TGisunInterface.Destroy;
begin
   FService:=nil;
   //!!!!!!! почему то возникал AV
   //FRIO.Free;
   FError.Close;
   FError.Free;
   inherited;
end;

procedure TGisunInterface.RIOAfterExecute(const MethodName: string; SOAPResponse: TStream);
var
//   StringList: TStringList;
   XMLDoc:TNativeXML;
begin
   //вывод текста запроса
   {
   StringList:=TStringList.Create;
   try
      SOAPResponse.Position:=0;
      StringList.LoadFromStream(SOAPResponse);
      StringList.SaveToFile(ExtractFilePath(Application.ExeName)+'SOAPResponse.xml');
   finally
      StringList.Free;
   end;
  }
  XMLDoc:=TNativeXML.Create;
  XMLDoc.LoadFromStream(SOAPResponse);
  XMLDoc.SaveToFile(ExtractFilePath(Application.ExeName)+'Запрос_ответ.xml');
  XMLDoc.Free;
end;

procedure TGisunInterface.RIOBeforeExecute(const MethodName: string; var SOAPRequest: WideString);
var
//   StringList: TStringList;
//  XMLDoc:TNativeXML;
  s:Utf8String;
begin
   //вывод текста запроса
   {
   StringList:=TStringList.Create;
   try
      StringList.Text:=SOAPRequest;
      StringList.SaveToFile(ExtractFilePath(Application.ExeName)+'SOAPRequest.xml');
   finally
      StringList.Free;
   end;
  }
//  XMLDoc:=TNativeXML.Create;
  s:=Utf8Encode(SOAPRequest);
  MemoWrite(ExtractFilePath(Application.ExeName)+'Запрос.xml',s);
  {
  XMLDoc.ReadFromString(s);
  XMLDoc.SaveToFile(ExtractFilePath(Application.ExeName)+'SOAPRequest.xml');
  XMLDoc.Free;
  }
end;

function TGisunInterface.GetService: GisunCommonWs;
begin
   if FService=nil then begin
      FService:=GetGisunWs(FUrl, FProxy, FRIO);
      //try except end !!! когда нет связи
   end;
   Result:=FService;
end;

function TGisunInterface.CreateClassifier(Code: string; ClassifierType: Integer): Classifier;
begin
   //Классификатор
   Result:=Classifier.Create;
   //Кодовое значение
   Result.code:=Code;
   //Тип классификатора
   Result.type_:=ClassifierType;
   //Список лексем
   //Result.lexema/
   //Result.lexema/Text
   //Язык передаваемого значения
   //Result.lexema/lang
   //Признак активности
   //Result.active
   //Дата формирования
   //Result.begin_date
   //Дата упразднения
   //Result.end_date
end;

function TGisunInterface.CreateDateTime(DateTime: TDateTime): TXSDateTime;
begin
   Result:=TXSDateTime.Create;
   Result.AsDateTime:=DateTime;
end;

function TGisunInterface.CreateId: string;
var
   GUID: TGUID;
begin
   CReateGUID(GUID);
   //Внутренний идентификатор
   Result:=GUIDToString(GUID);
end;

function TGisunInterface.CreateMessageCover(MessageType, ParentId: string): MessageCover;
begin
   //Сопроводительная информация к сообщению
   Result:=MessageCover.Create;
   //Идентификатор сообщения
   Result.message_id:=CreateId;
   //Тип сообщения
   Result.message_type:=CreateClassifier(MessageType, ctActType);
   //Время отправки сообщения
   Result.message_time:=CreateDateTime(Now);
   //Источник сообщения
   Result.message_source:=CreateClassifier(FMessageSource, ctZags);
   //Идентификатор сообщения, для которого текущее является ответом
   Result.parent_message_id:=ParentId;
end;

function TGisunInterface.CreateRegisterRequest(MessageType: string; PersonCount, IdentifierCount: Integer): register_request;
var
   I: Integer;
   person_request: Array_Of_PersonRequest;
   identif_request: Array_Of_IdentifRequest;
begin
   //Запрос на получение данных из ГИС РН
   Result:=register_request.Create;
   //Заголовок запроса
   //Сопроводительная информация к сообщению
   Result.cover:=CreateMessageCover(MessageType, '');
   //Тело запроса
   //Список запросов в ГИС РН
   Result.request:=RequestData.Create;
   //инициализация массива на получение персональных данных
   if PersonCount>0 then begin
      SetLength(person_request, PersonCount);
      for I:=0 to Pred(PersonCount) do begin
         //Запрос на получение персональных данных
         person_request[I]:=PersonRequest.Create;
         //Идентификатор запроса
         person_request[I].request_id:=CreateId;
         //Идентификационный номер
         //person_request[I].identif_number
         //Данные паспорта
         person_request[I].document:=CreateDocument;
      end;
      Result.request.person_request:=person_request;
   end;
   //инициализация массива на генерацию новых идентификационных номеров
   if IdentifierCount>0 then begin
      SetLength(identif_request, IdentifierCount);
      for I:=0 to Pred(IdentifierCount) do begin
         //Запрос на получение идентификационного номера
         identif_request[I]:=IdentifRequest.Create;
         //Идентификатор запроса
         identif_request[I].request_id:=CreateId;
         //Пол
         //identif_request[I].sex
         //Дата рождения
         //identif_request[I].birth_day
      end;
      Result.request.identif_request:=identif_request;
   end;
end;

function TGisunInterface.CreateDocument: Document;
begin
   //Документ, удостоверяющий личность
   Result:=Document.Create;
   //Тип доступа
   //Result.access
   //Тип документа
   //Result.document_type
   //Гос. орган, выдавший документ
   //Result.authority
   //Дата выдачи документа
   //Result.date_of_issue
   //Срок действия документа
   //Result.expire_date
   //Серия документа
   //Result.series
   //Номер документа
   //Result.number
   //Информация по актовой записи
   //Result.act_data
   //Признак действительного документа
   //Result.active
end;

function TGisunInterface.GetPersonalData(const registerRequest: register_request; var registerResponse: register_response; Log: TStrings): Boolean;
var
   I: Integer;
begin
   ClearError;
   Result:=False;
   try
      if GetService<>nil then begin
         Log.Add('');
         Log.Add('Выполняется запрос на получение данных из регистра:');
         Log.Add('');
         MessageCoverToLog(Log, registerRequest.cover);
         Log.Add('');
         Log.Add(Format('Запрос на получение пресональных данных person_request (%d):', [Length(registerRequest.request.person_request)]));
         for I:=Low(registerRequest.request.person_request) to High(registerRequest.request.person_request) do begin
            Log.Add('');
            Log.Add(Format('person_request/request_id     =%s', [registerRequest.request.person_request[I].request_id]));
            Log.Add(Format('person_request/identif_number =%s', [registerRequest.request.person_request[I].identif_number]));
            DocumenttoLog(Log, registerRequest.request.person_request[I].document, 'person_request/document/');
         end;
         Log.Add('');
         Log.Add(Format('Запрос на генерацию нового идентификационного номера  (%d):', [Length(registerRequest.request.identif_request)]));
         for I:=Low(registerRequest.request.identif_request) to High(registerRequest.request.identif_request) do begin
            Log.Add('');
            Log.Add(Format('identif_request/request_id =%s', [registerRequest.request.identif_request[I].request_id]));
            Log.Add(Format('identif_request/sex        =%s', [GetClassifierString(registerRequest.request.identif_request[I].sex)]));
            Log.Add(Format('identif_request/birth_day  =%s', [registerRequest.request.identif_request[I].birth_day]));
         end;
         registerResponse:=FService.getPersonalData(registerRequest);
         Log.Add('');
         Log.Add('Получен ответ:');
         Log.Add('');
         MessageCoverToLog(Log, registerResponse.cover);
         Log.Add('');
         Log.Add(Format('Список персональных данных personal_data (%d):', [Length(registerResponse.response.personal_data)]));
         for I:=Low(registerResponse.response.personal_data) to High(registerResponse.response.personal_data) do begin
            Log.Add('');
            Log.Add(Format('personal_data/request_id =%s', [registerResponse.response.personal_data[I].request_id]));
            PersonalDataToLog(Log, registerResponse.response.personal_data[I].data, 'personal_data/');
         end;
         Log.Add('');
         Log.Add(Format('Список идентификационных номеров identif_number (%d):', [Length(registerResponse.response.identif_number)]));
         for I:=Low(registerResponse.response.identif_number) to High(registerResponse.response.identif_number) do begin
            Log.Add('');
            Log.Add(Format('identif_number/request_id =%s', [registerResponse.response.identif_number[I].request_id]));
            Log.Add(Format('identif_number/data       =%s', [registerResponse.response.identif_number[I].data]));
         end;
         Result:=True;
      end
      else begin
         Log.Add('ОШИБКА: GetService=nil');
      end;
   except
      on E: Exception do begin
         HandleException(E, Log);
      end;
   end;
end;

procedure TGisunInterface.MessageCoverToLog(Log: TStrings; Cover: MessageCover);
begin
   if cover<>nil then begin
      Log.Add('/cover/');
      Log.Add(Format('/cover/message_id        =%s', [cover.message_id]));
      Log.Add(Format('/cover/message_type      =%s', [GetClassifierString(cover.message_type)]));
      Log.Add(Format('/cover/message_time      =%s', [GetDateTimeString(cover.message_time)]));
      Log.Add(Format('/cover/message_source    =%s', [GetClassifierString(cover.message_source)]));
      Log.Add(Format('/cover/parent_message_id =%s', [cover.parent_message_id]));
   end
   else begin
      Log.Add('/cover/ =nil');
   end;
end;

procedure TGisunInterface.ErrorListToLog(Log: TStrings; error_list: ErrorList);
var
   I: Integer;
   ErrorList: TStringList;
begin
   ErrorList:=TStringList.Create;
   ErrorList.Add('error_code.code;error_code.text;error_place;wrong_value;correct_value;check_name');
   try
      Log.Add(Format('Список ошибок error_list (%d):', [Length(error_list)]));
      for I:=Low(error_list) to High(error_list) do begin
         Log.Add(Format('error_code=%s', [GetClassifierString(error_list[I].error_code)]));
         Log.Add(Format('error_place=%s', [error_list[I].error_place]));
         Log.Add(Format('wrong_value=%s', [error_list[I].wrong_value]));
         Log.Add(Format('correct_value=%s', [error_list[I].correct_value]));
         Log.Add(Format('check_name=%s', [error_list[I].check_name]));
         ErrorList.Add(Format('"%s";"%s";"%s";"%s";"%s";"%s"', [GetClassifierCode(error_list[I].error_code), GetClassifierLexema(error_list[I].error_code), error_list[I].error_place, error_list[I].wrong_value, error_list[I].correct_value, error_list[I].check_name]));
      end;
      ErrorList.SaveToFile('error_list.csv');
   finally
      ErrorList.Free;
   end;
end;

const
   MapBool: array [Boolean] of string=('False', 'True');

procedure TGisunInterface.PersonalDataToLog(Log: TStrings; Data: PersonalData; Add: string);
var
   I: Integer;
begin
   if Data<>nil then begin
      Log.Add(Format(Add+'access         =%s', [GetClassifierString(Data.access)]));
      Log.Add(Format(Add+'identif        =%s', [Data.identif]));
      Log.Add(Format(Add+'last_name      =%s', [Data.last_name]));
      Log.Add(Format(Add+'last_name_bel  =%s', [Data.last_name_bel]));
      Log.Add(Format(Add+'last_name_lat  =%s', [Data.last_name_lat]));
      Log.Add(Format(Add+'name_          =%s', [Data.name_]));
      Log.Add(Format(Add+'name_bel       =%s', [Data.name_bel]));
      Log.Add(Format(Add+'name_lat       =%s', [Data.name_lat]));
      Log.Add(Format(Add+'patronymic     =%s', [Data.patronymic]));
      Log.Add(Format(Add+'patronymic_bel =%s', [Data.patronymic_bel]));
      Log.Add(Format(Add+'patronymic_lat =%s', [Data.patronymic_lat]));
      Log.Add(Format(Add+'sex            =%s', [GetClassifierString(Data.sex)]));
      Log.Add(Format(Add+'birth_day      =%s', [Data.birth_day]));
      Log.Add(Format(Add+'birth_place/country_b    =%s', [GetClassifierString(Data.birth_place.country_b)]));
      Log.Add(Format(Add+'birth_place/area_b       =%s', [Data.birth_place.area_b]));
      Log.Add(Format(Add+'birth_place/area_b_bel   =%s', [Data.birth_place.area_b_bel]));
      Log.Add(Format(Add+'birth_place/region_b     =%s', [Data.birth_place.region_b]));
      Log.Add(Format(Add+'birth_place/region_b_bel =%s', [Data.birth_place.region_b_bel]));
      Log.Add(Format(Add+'birth_place/type_city_b  =%s', [GetClassifierString(Data.birth_place.type_city_b)]));
      Log.Add(Format(Add+'birth_place/city_b       =%s', [Data.birth_place.city_b]));
      Log.Add(Format(Add+'birth_place/city_b_bel   =%s', [Data.birth_place.city_b_bel]));
      Log.Add(Format(Add+'birth_place/city_b_ate   =%s', [GetClassifierString(Data.birth_place.city_b_ate)]));
      Log.Add(Format(Add+'citizenship    =%s', [GetClassifierString(Data.citizenship)]));
      Log.Add(Format(Add+'status         =%s', [GetClassifierString(Data.status)]));
      Log.Add(Format('Список адресов addresses (%d):', [Length(Data.addresses)]));
      for I:=Low(Data.addresses) to High(Data.addresses) do begin
         Log.Add('');
         AddressToLog(Log, Data.addresses[I], Add+'addresses/');
      end;
      Log.Add(Format('Список документов documents (%d):', [Length(Data.documents)]));
      for I:=Low(Data.documents) to High(Data.documents) do begin
         Log.Add('');
         DocumenttoLog(Log, Data.documents[I], Add+'documents/');
      end;
      Log.Add(Format('Список родственных связей family (%d):', [Length(Data.family)]));
      for I:=Low(Data.family) to High(Data.family) do begin
         Log.Add('');
         FamilyToLog(Log, Data.family[I], Add+'family/');
      end;
      Log.Add(Format('Список ? deaths (%d):', [Length(Data.deaths)]));
      for I:=Low(Data.deaths) to High(Data.deaths) do begin
         Log.Add('');
         DeathToLog(Log, Data.deaths[I], Add+'deaths/');
      end;
      Log.Add(Format('Список ? citizenships (%d):', [Length(Data.citizenships)]));
      for I:=Low(Data.citizenships) to High(Data.citizenships) do begin
         Log.Add('');
         CitizenshipToLog(Log, Data.citizenships[I], Add+'citizenships/');
      end;
      Log.Add(Format('Список ? photos (%d):', [Length(Data.photos)]));
      for I:=Low(Data.photos) to High(Data.photos) do begin
      end;
   end
   else begin
      Log.Add(Add+' =nil');
   end;
end;

function TGisunInterface.GetClassifierString(C: Classifier): string;
var
   I: Integer;
begin
   if C=nil then begin
      Result:='nil';
   end
   else begin
      Result:=Format('type: %d, code: %s', [C.type_, C.code]);
      for I:=Low(C.lexema) to High(C.lexema) do begin
         Result:=Format('%s, Text: %s, lang: %s', [Result, C.lexema[I].Text, C.lexema[I].lang]);
      end;
   end;
end;

function TGisunInterface.GetDateString(Date: TXSDate): string;                              
begin
   if Date=nil then begin
      Result:='nil';
   end
   else begin
      Result:=FormatDateTime('yyyy.mm.dd', Date.AsDate);
   end;
end;

function TGisunInterface.GetDateTimeString(DateTime: TXSDateTime): string;
begin
   if DateTime=nil then begin
      Result:='nil';
   end
   else begin
      Result:=FormatDateTime('yyyy.mm.dd hh:nn', DateTime.AsDateTime);
   end;
end;

procedure TGisunInterface.HandleException(E: Exception; Log: TStrings);
begin
   if E is WsException then begin
      Log.Add('');
      Log.Add('!Исключение WsException');
      Log.Add(Format('FaultActor  =%s', [WsException(E).FaultActor]));
      Log.Add(Format('FaultCode   =%s', [WsException(E).FaultCode]));
      Log.Add(Format('FaultDetail =%s', [WsException(E).FaultDetail]));
      Log.Add(Format('Message     =%s', [WsException(E).Message]));
      Log.Add(Format('ClassName   =%s', [WsException(E).ClassName]));
      MessageCoverToLog(Log, WsException(E).cover);
      ErrorListToLog(Log, WsException(E).error_list);
      //обработка исключения
      CopyErrorList(WsException(E).error_list);
   end
   else if E is ERemotableException then begin
      Log.Add('');
      Log.Add('!Исключение ERemotableException');
      Log.Add(Format('FaultActor  =%s', [ERemotableException(E).FaultActor]));
      Log.Add(Format('FaultCode   =%s', [ERemotableException(E).FaultCode]));
      Log.Add(Format('FaultDetail =%s', [ERemotableException(E).FaultDetail]));
      Log.Add(Format('Message     =%s', [ERemotableException(E).Message]));
      Log.Add(Format('ClassName   =%s', [ERemotableException(E).ClassName]));

      //обработка исключения
      FFaultError:=ERemotableException(E).Message;
      FaultDetailToError(ERemotableException(E).FaultDetail, FFaultError);
   end
   //!!! ESOAPHTTPException
   else begin
      Log.Add('');
      Log.Add('!Исключение Exception');
      Log.Add(Format('Message   =%s', [E.Message]));
      Log.Add(Format('ClassName =%s', [E.ClassName]));
      //обработка исключения
      FFaultError:=E.Message;
   end;
end;

function TGisunInterface.FindNodeXML(x:TXMLNode; strFind:String):TXMLNode;
var
  n,m:Integer;
  xx,xxx:TXMLNode;
begin
  Result:=nil;
  for n:=0 to x.NodeCount-1 do begin
    xx:=x.Nodes[n];
    if Pos(strFind,LowerCase(Utf8ToAnsi(xx.Name))) >0 then begin
      Result:=xx;
    end else begin
      for m:=0 to xx.NodeCount-1 do begin
        xxx:=xx.Nodes[m];
        if Pos(strFind,LowerCase(Utf8ToAnsi(xxx.name))) >0 then begin
          Result:=xxx;
          break;
        end else begin
          xxx:=FindNodeXML(xx.Nodes[m],strFind);
          if xxx<>nil then begin
            Result:=xxx;
            break;
          end;
        end;
      end;
    end;
    if Result<>nil then break;
  end;
end;

procedure TGisunInterface.FaultDetailToError(strFaultDetail:String; strMessage:String);
var
  i,j:Integer;
  XMLDoc:TNativeXML;
  s1,s2,s3,ss:String;
  XMLNode,XMLNodeErr,nd:TXMLNode;
begin
  if strFaultDetail='' then begin
    if Trim(strMessage)=''
      then FError.AppendRecord(['--','Неизвестная ошибка','','','',''])
      else FError.AppendRecord(['--',strMessage,'','','','']);
    exit;
  end;
  XMLDoc:=TNativeXML.Create;
  XMLDoc.ReadFromString(AnsiToUtf8(strFaultDetail));
//  XMLNode:=XMLDoc.Root.FindNode(AnsiToUtf8('detail'));
//  if XMLNode<>nil then begin
    XMLNode:=FindNodeXML(XMLDoc.Root,'error_list');
//  end;
  if XMLNode<>nil then begin
    for i:=0 to XMLNode.NodeCount-1 do begin
      XMLNodeErr:=XMLNode.Nodes[i];
      s1:=Utf8ToAnsi(XMLNodeErr.Name);   //  типа: 'ns2:error'
      j:=Pos(':error',s1);
      ss:=Copy(s1,1,j);  // типа 'ns2:'
      //------------------
      nd:=XMLNodeErr.FindNode(AnsiToUtf8('code'));
      if nd<>nil then begin
        s1:=Utf8ToAnsi(nd.ValueAsString);
      end else begin
        nd:=FindNodeXML(XMLNodeErr,':code');
        if nd<>nil then begin
          s1:=Utf8ToANSI(nd.ValueAsString);
        end else begin
          s1:='';
        end;
      end;
      //------------------
      s2:='';
      nd:=XMLNodeErr.FindNode(AnsiToUtf8('lexema'));
      if nd<>nil then begin
        nd:=nd.FindNode('value');
        if nd<>nil then begin
          s2:=Utf8ToANSI(nd.ValueAsString);
        end;
      end;
      if s2='' then begin
        nd:=FindNodeXML(XMLNodeErr,':lexema');
        if nd<>nil then begin
          nd:=FindNodeXML(nd,':value');
          if nd<>nil then begin
            s2:=Utf8ToANSI(nd.ValueAsString);
          end else begin
            s2:='ОШИБКА';
          end;
        end else begin
          s2:='ОШИБКА';
        end;
      end;
      //------------------
      s3:='';
      try
        nd:=XMLNodeErr.FindNode(AnsiToUtf8('wrong_value'));
        if nd<>nil then begin
          s3:=Utf8ToANSI(nd.ValueAsString);
        end;
      except
        ////
      end;
      if s3='' then begin
        nd:=FindNodeXML(XMLNodeErr,':wrong_value');
        if nd<>nil then begin
          s3:=Utf8ToANSI(nd.ValueAsString);
        end else begin
          s3:='';
        end;
      end;
      if (strMessage<>'') and (s2='ОШИБКА') then begin
        s2:=strMessage;
      end;
      FError.AppendRecord([s1,s2,'',s3,'','']);
      {
      'ERROR_CODE',    Integer(ftString),    10,  //Тип ошибки
      'ERROR_TEXT',    Integer(ftString),   250,  //Текст ошибки
      'ERROR_PLACE',   Integer(ftString),   250,  //Место возникновения ошибки
      'WRONG_VALUE',   Integer(ftString),   250,  //Неправильное значение
      'CORRECT_VALUE', Integer(ftString),   250,  //Правильное значение
      'CHECK_NAME',    Integer(ftString),   250   //Название проверяемого элемента
      }
    end;
  end else begin
    FError.AppendRecord(['--','Неизвестная ошибка','','','','']);
  end;
  XMLDoc.Free;
end;

procedure TGisunInterface.SetUrl(Value: string);
begin
   if CompareText(FUrl, Value)<>0 then begin
      FUrl:=Value;
   end;
end;

procedure TGisunInterface.ClearError;
begin
   FFaultError:='';
   FError.First;
   while not FError.Eof do FError.Delete;
end;

procedure TGisunInterface.CopyErrorList(error_list: ErrorList);
var
   I: Integer;
begin
   for I:=Low(error_list) to High(error_list) do begin
      FError.Append;
      //Тип ошибки
      FError.FieldByName('ERROR_CODE').AsString:=GetClassifierCode(error_list[I].error_code);
      //Текст ошибки
      FError.FieldByName('ERROR_TEXT').AsString:=GetClassifierLexema(error_list[I].error_code);
      //Место возникновения ошибки
      FError.FieldByName('ERROR_PLACE').AsString:=error_list[I].error_place;
      //Неправильное значение
      FError.FieldByName('WRONG_VALUE').AsString:=error_list[I].wrong_value;
      //Правильное значение
      FError.FieldByName('CORRECT_VALUE').AsString:=error_list[I].correct_value;
      //Название проверяемого элемента
      FError.FieldByName('CHECK_NAME').AsString:=error_list[I].check_name;
      FError.Post;
   end;
end;

procedure TGisunInterface.DocumentToLog(Log: TStrings; Doc: Document; Add: string);
begin
   if Doc<>nil then begin
      Log.Add(Format(Add+'access        =%s', [GetClassifierString(Doc.access)]));
      Log.Add(Format(Add+'document_type =%s', [GetClassifierString(Doc.document_type)]));
      Log.Add(Format(Add+'authority     =%s', [GetClassifierString(Doc.authority)]));
      Log.Add(Format(Add+'date_of_issue =%s', [GetDateString(Doc.date_of_issue)]));
      Log.Add(Format(Add+'expire_date   =%s', [GetDateString(Doc.expire_date)]));
      Log.Add(Format(Add+'series        =%s', [Doc.series]));
      Log.Add(Format(Add+'number        =%s', [Doc.number]));
      if Doc.act_data<>nil then begin
         Log.Add(Format(Add+'act_data/act_type  =%s', [GetClassifierString(Doc.act_data.act_type)]));
         Log.Add(Format(Add+'act_data/authority =%s', [GetClassifierString(Doc.act_data.authority)]));
         Log.Add(Format(Add+'act_data/date      =%s', [GetDateString(Doc.act_data.date)]));
         Log.Add(Format(Add+'act_data/number    =%s', [Doc.act_data.number]));
      end
      else begin
         Log.Add(Add+'act_data      =nil');
      end;
      Log.Add(Format(Add+'active        =%s', [MapBool[Doc.active]]));
   end
   else begin
      Log.Add(Add+' =nil');
   end;
end;

procedure TGisunInterface.AddressToLog(Log: TStrings; Adr: Address; Add: string);
begin
   if Adr<>nil then begin
      Log.Add(Format(Add+'access        =%s', [GetClassifierString(Adr.access)]));
      Log.Add(Format(Add+'country       =%s', [GetClassifierString(Adr.country)]));
      Log.Add(Format(Add+'area          =%s', [GetClassifierString(Adr.area)]));
      Log.Add(Format(Add+'region        =%s', [GetClassifierString(Adr.region)]));
      Log.Add(Format(Add+'soviet        =%s', [GetClassifierString(Adr.soviet)]));
      Log.Add(Format(Add+'locality_type =%s', [GetClassifierString(Adr.locality_type)]));
      Log.Add(Format(Add+'locality      =%s', [GetClassifierString(Adr.locality)]));
      Log.Add(Format(Add+'city_region   =%s', [GetClassifierString(Adr.city_region)]));
      Log.Add(Format(Add+'street_type   =%s', [GetClassifierString(Adr.street_type)]));
      Log.Add(Format(Add+'street        =%s', [GetClassifierString(Adr.street)]));
      Log.Add(Format(Add+'house         =%s', [Adr.house]));
      Log.Add(Format(Add+'building      =%s', [Adr.building]));
      Log.Add(Format(Add+'flat          =%s', [Adr.flat]));
      Log.Add(Format(Add+'reg_date      =%s', [GetDateString(Adr.reg_date)]));
      Log.Add(Format(Add+'active        =%s', [MapBool[Adr.active]]));
   end
   else begin
      Log.Add(Add+' =nil');
   end;
end;

procedure TGisunInterface.FamilyToLog(Log: TStrings; Fam: Family; Add: string);
begin
   if Fam<>nil then begin
      Log.Add(Format(Add+'access       =%s', [GetClassifierString(Fam.access)]));
      Log.Add(Format(Add+'relationship =%s', [GetClassifierString(Fam.relationship)]));
      Log.Add(Format(Add+'is_owner     =%s', [GetEnumName(TypeInfo(Boolean), Ord(Fam.is_owner))]));
      Log.Add(Format(Add+'rel_id       =%s', [Fam.rel_id]));
      Log.Add(Format(Add+'begin_date   =%s', [GetDateTimeString(Fam.begin_date)]));
      Log.Add(Format(Add+'end_date     =%s', [GetDateTimeString(Fam.end_date)]));
      Log.Add(Format(Add+'active       =%s', [MapBool[Fam.active]]));
   end
   else begin
      Log.Add(Add+' =nil');
   end;
end;

procedure TGisunInterface.DeathToLog(Log: TStrings; D: Death; Add: string);
begin
   if D<>nil then begin
      Log.Add(Format(Add+'access      =%s', [GetClassifierString(D.access)]));
      Log.Add(Format(Add+'death_cause =%s', [GetClassifierString(D.death_cause)]));
      Log.Add(Format(Add+'death_date  =%s', [D.death_date]));
      Log.Add(Format(Add+'decease_place/country_d    =%s', [GetClassifierString(D.decease_place.country_d)]));
      Log.Add(Format(Add+'decease_place/area_d       =%s', [D.decease_place.area_d]));
      Log.Add(Format(Add+'decease_place/area_d_bel   =%s', [D.decease_place.area_d_bel]));
      Log.Add(Format(Add+'decease_place/region_d     =%s', [D.decease_place.region_d]));
      Log.Add(Format(Add+'decease_place/region_d_bel =%s', [D.decease_place.region_d_bel]));
      Log.Add(Format(Add+'decease_place/type_city_d  =%s', [GetClassifierString(D.decease_place.type_city_d)]));
      Log.Add(Format(Add+'decease_place/city_d       =%s', [D.decease_place.city_d]));
      Log.Add(Format(Add+'decease_place/city_d_bel   =%s', [D.decease_place.city_d_bel]));
      Log.Add(Format(Add+'death_place  =%s', [D.death_place]));
      Log.Add(Format(Add+'burial_place =%s', [D.burial_place]));
      Log.Add(Format(Add+'active       =%s', [MapBool[D.active]]));
   end
   else begin
      Log.Add(Add+' =nil');
   end;
end;

function TGisunInterface.GetClassifierCode(C: Classifier): string;
begin
   Result:='';
   if (C<>nil) then begin
      Result:=C.code;
   end;
end;

function TGisunInterface.GetClassifierLexema(C: Classifier): string;
begin
   Result:='';
   if (C<>nil) and (Length(C.lexema)>0) then begin
//      Result:=C.lexema[0].lang
      Result:=C.lexema[0].Text;
   end;
end;

procedure TGisunInterface.CitizenshipToLog(Log: TStrings; C: Citizenship; Add: string);
begin
   if C<>nil then begin
      Log.Add(Format(Add+'access             =%s', [GetClassifierString(C.access)]));
      Log.Add(Format(Add+'citizenship_change =%s', [GetClassifierString(C.citizenship_change)]));
      Log.Add(Format(Add+'date_citizenship   =%s', [GetDateTimeString(C.date_citizenship)]));
      Log.Add(Format(Add+'active             =%s', [MapBool[C.active]]));
   end
   else begin
      Log.Add(Add+' =nil');
   end;
end;

end.//TGisunInterface
