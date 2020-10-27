unit mZags;
interface
uses
   wsGisun, wsZags, SysUtils, Classes, Forms, TypInfo, SoapHTTPClient, XSBuiltIns,
   InvokeRegistry, DB, NativeXML, FuncPr;

type
   //���������
   TZagsInterface=class(TObject)
   private
      //SOAP
      FRIO: THTTPRIO;
      //������
      FService: ZagsWs;
      //����� �������
      FUrl: string;
      FProxy: string;
      //��� ��������� ��������� (MessageCover.message_source)
      FMessageSource: string;
      //
      FFaultError: string;
      //
      FError: TDataSet;
   private
      //������� SOAP
      procedure RIOAfterExecute(const MethodName: string; SOAPResponse: TStream);
      procedure RIOBeforeExecute(const MethodName: string; var SOAPRequest: WideString);
      //��������� ������ �� ������
      function GetService: ZagsWs;
      //
      procedure SetUrl(Value: string);
      procedure ClearError;
      procedure CopyErrorList(error_list: ErrorList);
   public
      constructor Create;
      destructor Destroy; override;
      //���������:
      //�������� ��������
      function CreateId: string;
      function CreateMessageCover(MessageType, ParentId: string): MessageCover;
      function CreateRegisterRequest(MessageType: string; PersonCount, IdentifierCount: Integer): register_request;
      function CreateRequestData(PersonCount, IdentifierCount: Integer): RequestData;
      function CreateActReason: ActReason;
      function CreateActData: ActData;
      function CreatePersonalData: PersonalData;
      function CreateDocument: Document;
      function CreateClassifier(Code: string; ClassifierType: Integer): Classifier;
      function CreateDateTime(DateTime: TDateTime): TXSDateTime;
      function CreateDate(Date: TDateTime): TXSDate;
      //������ ���� � ��������
      function CreateBirthActRequest(MessageType, ParentMessageId: string): birth_act;
      function CreateBirthCertData: birth_cert_data;
      //������ ���� �� ������������ ���������
      function CreateAffActRequest(MessageType, ParentMessageId: string): affiliation_act;
      function CreateAffCertData: aff_cert_data;
      function CreateAffPerson: aff_person;
      //������ ���� � ���������� �����
      function CreateMarriageActRequest(MessageType, ParentMessageId: string): marriage_act;
      function CreateMrgCertData: mrg_cert_data;
      //�������������� ������ ���� � ��������
      function CreateReconstructedBirthActRequest(MessageType, ParentMessageId: string): reconstructed_birth_act;
      function CreateRcnBirthCertData: rcn_birth_cert_data;
      //������ ���� � ����������� �����
      function CreateDivorceActRequest(MessageType, ParentMessageId: string): divorce_act;
      function CreateDvcCertData: dvc_cert_data;
      //������ ���� �� ����������� (����������)
      function CreateAdoptionActRequest(MessageType, ParentMessageId: string): adoption_act;
      function CreateAdpCertData:adp_cert_data;
      //������ ���� � ������
      function CreateDeceaseActRequest(MessageType, ParentMessageId: string): decease_act;
      function CreateDcsCertData: dcs_cert_data;
      function CreateDeath: Death;
      //������ ���� � �������� �����
      function CreateNameChangeActRequest(MessageType, ParentMessageId: string): name_change_act;
      function CreateCngCertData: cng_cert_data;
      //����� �������
      //��� ������ ����� ������ ���� ������������ ��������� ������
      function GetPersonalData(const registerRequest: register_request; var registerResponse: register_response; Log: TStrings): Boolean;
      //����������� ��������
      function PostBirthCertificate(const birthActRequest: birth_act; Log: TStrings): return_code;
      //������������ ���������
      function PostAffiliationCertificate(const affActRequest: affiliation_act; Log: TStrings): return_code;
      // �������������� ������� ������ � ��������
      function PostReconstBirthCertificate(const rcnBirthActRequest: reconstructed_birth_act; Log: TStrings): return_code;
      //����������� �����
      function PostMarriageCertificate(const mrgActRequest: marriage_act; Log: TStrings): return_code;
      //����������� �����
      function PostDivorceCertificate(const dvcActRequest: divorce_act; Log: TStrings): return_code;
      //�����������
      function PostAdoptionCertificate(const adpActRequest: adoption_act; Log: TStrings): return_code;
      //��������
      function PostDeceaseCertificate(const dcsActRequest: decease_act; Log: TStrings): return_code;
      //�������� �����
      function PostNameChangeCertificate(const cngActRequest: name_change_act; Log: TStrings): return_code;
      //��������� ����������
      procedure HandleException(E: Exception; Log: TStrings);
      //��������������� ������� ��� ������:
      //����� � ���
      procedure MessageCoverToLog(Log: TStrings; Cover: MessageCover);
      procedure ReturnCodeToLog(Log: TStrings; ReturnCode: return_code);
      procedure ErrorListToLog(Log: TStrings; error_list: ErrorList);
      procedure PersonalDataToLog(Log: TStrings; Data: PersonalData; Add: string);
      procedure DocumentToLog(Log: TStrings; Doc: Document; Add: string);
      procedure ActDataToLog(Log: TStrings; Act: ActData; Add: string);
      procedure ActReasonToLog(Log: TStrings; Act: ActReason; Add: string);
      procedure AddressToLog(Log: TStrings; Adr: Address; Add: string);
      procedure FamilyToLog(Log: TStrings; Fam: Family; Add: string);
      procedure BirthCertDataToLog(Log: TStrings; Act: birth_cert_data);
      procedure AffCertDataToLog(Log: TStrings; Act: aff_cert_data);
      procedure MrgCertDataToLog(Log: TStrings; Act: mrg_cert_data);
      procedure RcnBirthCertDataToLog(Log: TStrings; Act: rcn_birth_cert_data);
      procedure DvcCertDataToLog(Log: TStrings; Act: dvc_cert_data);
      procedure AdpCertDataToLog(Log: TStrings; Act: adp_cert_data);
      procedure DcsCertDataToLog(Log: TStrings; Act: dcs_cert_data);
      procedure CngCertDataToLog(Log: TStrings; Act: cng_cert_data);
      //�������������� � ������
      function GetClassifierString(C: Classifier): string;
      function GetDateString(Date: TXSDate): string;
      function GetDateTimeString(DateTime: TXSDateTime): string;
      //������ ���������������
      function GetClassifierLexema(C: Classifier): string;
      function GetClassifierCode(C: Classifier): string;
   public
      property MessageSource: string read FMessageSource write FMessageSource;
      property Service: ZagsWs read GetService;
      property Url: string read FUrl write SetUrl;
      property Proxy: string read FProxy write FProxy;
      property FaultError: string read FFaultError;
      property Error: TDataSet read FError;
   end;

const
   //���� ���������������
   //-51 ������ �����������
   //-50 ������ ��������������
   //-40 ������ ������� ������ �����
   //-20 ������ � ���������� �����������
   ctStatus     = -18;  //������ ����
   //-17 ������� �������� �������
   //-16 ������ ������������� ������
   //-12 ������� ������������
   //-11 ���� �������� (�����������)
   //-10 ����� �����
   //-5 ����� ��������� �������
   //-3 ������ �������
   ctSysDoc     =  -2; //���� ��������� ����������
   //-1 ��������� ���������
   //1 �������
   //6 ���� ��������� �����������
   //7 ���������� ������
   ctCountry    =   8;  //������
   ctMVD        =  24;  //������ ���
   //29 ������
   ctPol        =  32;  //���
   //34 �����
   ctTypeCity   =  35;  //���� ���������� �������
   ctDocType    =  37;  //���� ����������
   //38 ���� ����
   ctZags       =  80;  //������ ����
   ctDeathCause =  81;  //������� ������
   ctActType    =  82;  //���� ������� �������

implementation
uses
   mRegInt;
   
{TZagsInterface}

constructor TZagsInterface.Create;
begin
   //������ ��������� ������
   FError:=CreateErrorTable;
   //SOAP
   FRIO:=THTTPRIO.Create(nil);
   FRIO.OnAfterExecute:=RIOAfterExecute;
   FRIO.OnBeforeExecute:=RIOBeforeExecute;
end;

destructor TZagsInterface.Destroy;
begin
   FService:=nil;
   //!!!!!!! ������ �� �������� AV
   //FRIO.Free;
   FError.Close;
   FError.Free;
   inherited;
end;

procedure TZagsInterface.RIOAfterExecute(const MethodName: string; SOAPResponse: TStream);
var
//   StringList: TStringList;
   XMLDoc:TNativeXML;
begin
   //����� ������ �������
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
  XMLDoc.SaveToFile(ExtractFilePath(Application.ExeName)+'�����������_�����.xml');
  XMLDoc.Free;
end;

procedure TZagsInterface.RIOBeforeExecute(const MethodName: string; var SOAPRequest: WideString);
var
//   StringList: TStringList;
//  XMLDoc:TNativeXML;
  s:Utf8String;
begin
   //����� ������ �������
{
   StringList:=TStringList.Create;
   try
      StringList.Text:=SOAPRequest;
      StringList.SaveToFile(ExtractFilePath(Application.ExeName)+'SOAPRequest.xml');
   finally
      StringList.Free;
   end;
}
  s:=Utf8Encode(SOAPRequest);
  MemoWrite(ExtractFilePath(Application.ExeName)+'�����������.xml',s);
end;

function TZagsInterface.GetService: ZagsWs;
begin
   if FService=nil then begin
      FService:=GetZagsWs(FUrl, FProxy, FRIO);
      //try except end !!! ����� ��� �����
   end;
   Result:=FService;
end;

function TZagsInterface.CreateRegisterRequest(MessageType: string; PersonCount, IdentifierCount: Integer): register_request;
begin
   Result:=register_request.Create;
   Result.cover:=CreateMessageCover(MessageType, '');
   Result.request:=CreateRequestData(PersonCount, IdentifierCount);
end;

function TZagsInterface.CreateMessageCover(MessageType, ParentId: string): MessageCover;
begin
   //���������������� ���������� � ���������
   Result:=MessageCover.Create;
   //������������� ���������
   Result.message_id:=CreateId;
   //��� ���������
   Result.message_type:=CreateClassifier(MessageType, ctSysDoc{--ctActType});
   //����� �������� ���������
   Result.message_time:=CreateDateTime(Now);
   //�������� ���������
   Result.message_source:=CreateClassifier(FMessageSource, ctZags);
   //������������� ���������, ��� �������� ������� �������� �������
   Result.parent_message_id:=ParentId;
end;

function TZagsInterface.CreateRequestData(PersonCount, IdentifierCount: Integer): RequestData;
var
   I: Integer;
   GUID: TGUID;
   person_request: Array_Of_PersonRequest;
   identif_request: Array_Of_IdentifRequest;
begin
   Result:=RequestData.Create;
   //������������� ������� �� ��������� ������������ ������
   if PersonCount>0 then begin
      SetLength(person_request, PersonCount);
      for I:=0 to Pred(PersonCount) do begin
         person_request[I]:=PersonRequest.Create;
         person_request[I].document:=CreateDocument;
         //person_request[I].document.document_type:=Classifier.Create;
         //person_request[I].document.authority=Classifier.Create;
         //person_request[I].document.date_of_issue:=TXSDate.Create;
         //person_request[I].document.expire_date:=TXSDate.Create;
         //person_request[I].document.act_data:=ActData.Create;
         //person_request[I].document.act_data.act_type:=Classifier.Create;
         //person_request[I].document.act_data.authority:=Classifier.Create;
         //person_request[I].document.act_data.date:=TXSDate.Create;
         CReateGUID(GUID);
         person_request[I].request_id:=GUIDToString(GUID);
      end;
      Result.person_request:=person_request;
   end;
   //������������� ������� �� ��������� ����� ����������������� �������
   if IdentifierCount>0 then begin
      SetLength(identif_request, IdentifierCount);
      for I:=0 to Pred(IdentifierCount) do begin
         identif_request[I]:=IdentifRequest.Create;
         CReateGUID(GUID);
         identif_request[I].request_id:=GUIDToString(GUID);
      end;
      Result.identif_request:=identif_request;
   end;
end;

function TZagsInterface.CreateBirthActRequest(MessageType, ParentMessageId: string): birth_act;
begin
   //������ ���� � ��������
   Result:=birth_act.Create;
   //��������� ����������
   Result.cover:=CreateMessageCover(MessageType, ParentMessageId);
   //��� � ��������
   Result.birth_cert_data:=CreateBirthCertData;
end;

function TZagsInterface.CreateBirthCertData: birth_cert_data;
begin
   //��� � ��������
   Result:=birth_cert_data.Create;
   //������������ ������ ������
   Result.child_data:=CreatePersonalData;
   //������������ ������ ������
   Result.mother_data:=CreatePersonalData;
   //������������ ������ ����
   Result.father_data:=CreatePersonalData;
   //��������� ������ �������� �� ���� (������������� � ���������� �����)
   Result.marriage_cert:=CreateActData;
   //���������� �� ������� ������
   Result.birth_act_data:=CreateActData;
   //���������� � �������� ���������
   Result.birth_certificate_data:=CreateDocument;
end;

function TZagsInterface.CreateActData: ActData;
begin
   //���������� �� ������� ������
   Result:=ActData.Create;
   //��� ������� ������
   //Result.act_type:=GetClassifier();
   //���. �����, ������������� ������� ������ (����� ����)
   //Result.authority:=GetClassifier();
   //���� ������� ������
   //Result.date:=GetDate(Now);
   //����� ������� ������
   //Result.number:='1';
end;

function TZagsInterface.CreatePersonalData: PersonalData;
begin
   //������������ ������
   Result:=PersonalData.Create;
   //������������ �����
   //Result.identif: PersonalId;
   //�������
   //Result.last_name: WideString;
   //������� �����������
   //Result.last_name_bel: WideString;
   //������� ��������� (???)
   //Result.last_name_lat: WideString;
   //���
   //Result.name_: WideString;
   //��� �����������
   //Result.name_bel: WideString;
   //��� ���������
   //Result.name_lat: WideString;
   //��������
   //Result.patronymic: WideString;
   //�������� �����������
   //Result.patronymic_bel: WideString;
   //�������� ���������
   //Result.patronymic_lat: WideString;
   //���
   //Result.sex: Classifier;
   //���� ��������
   //Result.birth_day: WideString;
   //����� ��������
   Result.birth_place:=birth_place.Create;
   //�����������
   //Result.citizenship: Classifier;
   //������ ����
   //Result.status: Classifier;
   //Result.addresses: AddressList;
   //Result.documents: DocumentList;
   //Result.family: FamilyList;
end;

function TZagsInterface.CreateDocument: Document;
begin
   //��������, �������������� ��������
   Result:=Document.Create;
   //��� ���������
   //Result.document_type: Classifier;
   //���. �����, �������� ��������
   //Result.authority: Classifier;
   //���� ������ ���������
   //Result.date_of_issue: TXSDate;
   //���� �������� ���������
   //Result.expire_date: TXSDate;
   //����� ���������
   //Result.series: WideString;
   //����� ���������
   //Result.number: WideString;
   //���������� �� ������� ������
   //Result.act_data: ActData;
end;

function TZagsInterface.CreateClassifier(Code: string; ClassifierType: Integer): Classifier;
begin
   Result:=Classifier.Create;
   Result.code:=Code;
   Result.type_:=ClassifierType;
end;

function TZagsInterface.CreateDateTime(DateTime: TDateTime): TXSDateTime;
begin
   Result:=TXSDateTime.Create;
   Result.AsDateTime:=DateTime;
end;

function TZagsInterface.CreateDate(Date: TDateTime): TXSDate;
begin
   Result:=TXSDate.Create;
   Result.AsDate:=Date;
end;

procedure TZagsInterface.MessageCoverToLog(Log: TStrings; Cover: MessageCover);
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
      Log.Add('cover=nil');
   end;
end;

procedure TZagsInterface.ReturnCodeToLog(Log: TStrings; ReturnCode: return_code);
begin
   if ReturnCode<>nil then begin
      MessageCoverToLog(Log, ReturnCode.cover);
      Log.Add('');
      ErrorListToLog(Log, ReturnCode.error_list);
   end
   else begin
      Log.Add('ReturnCode=nil');
   end;
end;

procedure TZagsInterface.ErrorListToLog(Log: TStrings; error_list: ErrorList);
var
   I: Integer;
   ErrorList: TStringList;
begin
   ErrorList:=TStringList.Create;
   ErrorList.Add('error_code.code;error_code.text;error_place;wrong_value;correct_value;check_name');
   try
      Log.Add(Format('������ ������ error_list (%d):', [Length(error_list)]));
      for I:=Low(error_list) to High(error_list) do begin
         Log.Add('');
         Log.Add(Format('error_code    =%s', [GetClassifierString(error_list[I].error_code)]));
         Log.Add(Format('error_place   =%s', [error_list[I].error_place]));
         Log.Add(Format('wrong_value   =%s', [error_list[I].wrong_value]));
         Log.Add(Format('correct_value =%s', [error_list[I].correct_value]));
         Log.Add(Format('check_name    =%s', [error_list[I].check_name]));
         ErrorList.Add(Format('"%s";"%s";"%s";"%s";"%s";"%s"', [GetClassifierCode(error_list[I].error_code), GetClassifierLexema(error_list[I].error_code), error_list[I].error_place, error_list[I].wrong_value, error_list[I].correct_value, error_list[I].check_name]));
      end;
      ErrorList.SaveToFile('error_list.csv');
   finally
      ErrorList.Free;
   end;
end;

procedure TZagsInterface.PersonalDataToLog(Log: TStrings; Data: PersonalData; Add: string);
var
   I: Integer;
begin
   if Data<>nil then begin
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
      Log.Add(Format(Add+'citizenship    =%s', [GetClassifierString(Data.citizenship)]));
      Log.Add(Format(Add+'status         =%s', [GetClassifierString(Data.status)]));
      Log.Add(Format('������ ������� addresses (%d):', [Length(Data.addresses)]));
      for I:=Low(Data.addresses) to High(Data.addresses) do begin
         Log.Add('');
         AddressToLog(Log, Data.addresses[I], Add+'addresses/');
      end;
      Log.Add(Format('������ ���������� documents (%d):', [Length(Data.documents)]));
      for I:=Low(Data.documents) to High(Data.documents) do begin
         Log.Add('');
         DocumentToLog(Log, Data.documents[I], Add+'documents/');
      end;
      Log.Add(Format('������ ����������� ������ family (%d):', [Length(Data.family)]));
      for I:=Low(Data.family) to High(Data.family) do begin
         Log.Add('');
         FamilytoLog(Log, Data.family[I], Add+'family/');
      end;
   end
   else begin
      Log.Add(Add+' =nil');
   end;
end;

function TZagsInterface.GetClassifierString(C: Classifier): string;
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

function TZagsInterface.GetDateString(Date: TXSDate): string;
begin
   if Date=nil then begin
      Result:='nil';
   end
   else begin
      Result:=FormatDateTime('yyyy.mm.dd', Date.AsDate);
   end;
end;

function TZagsInterface.GetDateTimeString(DateTime: TXSDateTime): string;
begin
   if DateTime=nil then begin
      Result:='nil';
   end
   else begin
      Result:=FormatDateTime('yyyy.mm.dd hh:nn', DateTime.AsDateTime);
   end;
end;

function TZagsInterface.GetPersonalData(const registerRequest: register_request; var registerResponse: register_response; Log: TStrings): Boolean;
begin
   Result:=False;
   try
      if GetService<>nil then begin
         registerResponse:=FService.getPersonalData(registerRequest);
         Result:=True;
      end
      else begin
         Log.Add('������: GetService=nil');
      end;
   except
      on E: Exception do begin
         HandleException(E, Log);
      end;
   end
end;

function TZagsInterface.PostBirthCertificate(const birthActRequest: birth_act; Log: TStrings): return_code;
begin
   ClearError;
   Result:=nil;
   try
      if GetService<>nil then begin
         Log.Add('');
         Log.Add('����������� �������� ������ ������� ������ � �������:');
         Log.Add('');
         Log.Add('������ ���� � ��������');
         Log.Add('');
         MessageCoverToLog(Log, birthActRequest.cover);
         Log.Add('');
         BirthCertDataToLog(Log, birthActRequest.birth_cert_data);
         Result:=FService.postBirthCertificate(birthActRequest);
         Log.Add('');
         Log.Add('������� �����:');
         Log.Add('');
         ReturnCodeToLog(Log, Result);
         CopyErrorList(Result.error_list);
      end
      else begin
         Log.Add('������: GetService=nil');
      end;
   except
      on E: Exception do begin
         HandleException(E, Log);
      end;
   end
end;

procedure TZagsInterface.HandleException(E: Exception; Log: TStrings);
begin
   if E is WsException then begin
      Log.Add('!���������� WsException');
      Log.Add(Format('FaultActor=%s', [WsException(E).FaultActor]));
      Log.Add(Format('FaultCode=%s', [WsException(E).FaultCode]));
      Log.Add(Format('FaultDetail=%s', [WsException(E).FaultDetail]));
      Log.Add(Format('Message=%s', [WsException(E).Message]));
      Log.Add(Format('ClassName=%s', [WsException(E).ClassName]));
      MessageCoverToLog(Log, WsException(E).cover);
      ErrorListToLog(Log, WsException(E).error_list);
      //��������� ����������
      CopyErrorList(WsException(E).error_list);
   end
   else if E is ERemotableException then begin
      Log.Add('!���������� ERemotableException');
      Log.Add(Format('FaultActor=%s', [ERemotableException(E).FaultActor]));
      Log.Add(Format('FaultCode=%s', [ERemotableException(E).FaultCode]));
      Log.Add(Format('FaultDetail=%s', [ERemotableException(E).FaultDetail]));
      Log.Add(Format('Message=%s', [ERemotableException(E).Message]));
      Log.Add(Format('ClassName=%s', [ERemotableException(E).ClassName]));
      //��������� ����������
      // ???
      FFaultError:=ERemotableException(E).Message;
   end
   //!!! ESOAPHTTPException
   else begin
      Log.Add('!���������� Exception');
      Log.Add(Format('Message=%s', [E.Message]));
      Log.Add(Format('ClassName=%s', [E.ClassName]));
      //��������� ����������
      FFaultError:=E.Message;
   end;
end;

function TZagsInterface.CreateId: string;
var
   GUID: TGUID;
begin
   CReateGUID(GUID);
   //���������� �������������
   Result:=GUIDToString(GUID);
end;

procedure TZagsInterface.SetUrl(Value: string);
begin
   if CompareText(FUrl, Value)<>0 then begin
      FUrl:=Value;
   end;
end;

procedure TZagsInterface.ClearError;
begin
   FFaultError:='';
   FError.First;
   while not FError.Eof do FError.Delete;
end;

procedure TZagsInterface.CopyErrorList(error_list: ErrorList);
var
   I: Integer;
begin
   for I:=Low(error_list) to High(error_list) do begin
      FError.Append;
      //��� ������
      FError.FieldByName('ERROR_CODE').AsString:=GetClassifierCode(error_list[I].error_code);
      //����� ������
      FError.FieldByName('ERROR_TEXT').AsString:=GetClassifierLexema(error_list[I].error_code);
      //����� ������������� ������
      FError.FieldByName('ERROR_PLACE').AsString:=error_list[I].error_place;
      //������������ ��������
      FError.FieldByName('WRONG_VALUE').AsString:=error_list[I].wrong_value;
      //���������� ��������
      FError.FieldByName('CORRECT_VALUE').AsString:=error_list[I].correct_value;
      //�������� ������������ ��������
      FError.FieldByName('CHECK_NAME').AsString:=error_list[I].check_name;
      FError.Post;
   end;
end;

procedure TZagsInterface.BirthCertDataToLog(Log: TStrings; Act: birth_cert_data);
begin
   Log.Add('������������ ������ ������');
   Log.Add('');
   PersonalDataToLog(Log, Act.child_data, 'child_data/');
   Log.Add('');
   Log.Add('������������ ������ ������');
   Log.Add('');
   PersonalDataToLog(Log, Act.mother_data, 'mother_data/');
   Log.Add('');
   Log.Add('������������ ������ ����');
   Log.Add('');
   PersonalDataToLog(Log, Act.father_data, 'father_data/');
   Log.Add('');
   Log.Add('��������� ������ �������� �� ���� (������������� � ���������� �����)');
   Log.Add('');
   ActDataToLog(Log, Act.marriage_cert, 'marriage_cert/');
   Log.Add('');
   Log.Add('���������� �� ������� ������');
   Log.Add('');
   ActDataToLog(Log, Act.birth_act_data, 'birth_act_data/');
   Log.Add('');
   Log.Add('���������� � �������� ���������');
   Log.Add('');
   DocumentToLog(Log, Act.birth_certificate_data, 'birth_certificate_data/');
end;

procedure TZagsInterface.DocumentToLog(Log: TStrings; Doc: Document; Add: string);
begin
   if Doc<>nil then begin
      Log.Add(Format(Add+'document_type =%s', [GetClassifierString(Doc.document_type)]));
      Log.Add(Format(Add+'authority     =%s', [GetClassifierString(Doc.authority)]));
      Log.Add(Format(Add+'date_of_issue =%s', [GetDateString(Doc.date_of_issue)]));
      Log.Add(Format(Add+'expire_date   =%s', [GetDateString(Doc.expire_date)]));
      Log.Add(Format(Add+'series        =%s', [Doc.series]));
      Log.Add(Format(Add+'number        =%s', [Doc.number]));
      ActDataToLog(Log, Doc.act_data, Add+'act_data/');
   end
   else begin
      Log.Add(Add+' =nil');
   end;
end;

procedure TZagsInterface.ActDataToLog(Log: TStrings; Act: ActData; Add: string);
begin
   if Act<>nil then begin
      Log.Add(Format(Add+'act_type  =%s', [GetClassifierString(Act.act_type)]));
      Log.Add(Format(Add+'authority =%s', [GetClassifierString(Act.authority)]));
      Log.Add(Format(Add+'date      =%s', [GetDateString(Act.date)]));
      Log.Add(Format(Add+'number    =%s', [Act.number]));
   end
   else begin
      Log.Add(Add+' =nil');
   end;
end;

procedure TZagsInterface.AddressToLog(Log: TStrings; Adr: Address; Add: string);
begin
   Log.Add(Format(Add+'country  =%s', [GetClassifierString(Adr.country)]));
   Log.Add(Format(Add+'area     =%s', [GetClassifierString(Adr.area)]));
   Log.Add(Format(Add+'region   =%s', [GetClassifierString(Adr.region)]));
   Log.Add(Format(Add+'locality =%s', [GetClassifierString(Adr.locality)]));
   Log.Add(Format(Add+'street   =%s', [GetClassifierString(Adr.street)]));
   Log.Add(Format(Add+'house    =%s', [Adr.house]));
   Log.Add(Format(Add+'building =%s', [Adr.building]));
   Log.Add(Format(Add+'flat     =%s', [Adr.flat]));
   Log.Add(Format(Add+'reg_date =%s', [GetDateString(Adr.reg_date)]));
end;

procedure TZagsInterface.FamilyToLog(Log: TStrings; Fam: Family; Add: string);
begin
   if Fam<>nil then begin
      Log.Add(Format(Add+'relationship =%s', [GetClassifierString(Fam.relationship)]));
      Log.Add(Format(Add+'is_owner     =%s', [GetEnumName(TypeInfo(Boolean), Ord(Fam.is_owner))]));
      Log.Add(Format(Add+'rel_id       =%s', [Fam.rel_id]));
      Log.Add(Format(Add+'begin_date   =%s', [GetDateTimeString(Fam.begin_date)]));
      Log.Add(Format(Add+'end_date     =%s', [GetDateTimeString(Fam.end_date)]));
   end
   else begin
      Log.Add(Add+' =nil');
   end;
end;

function TZagsInterface.GetClassifierCode(C: Classifier): string;
begin
   Result:='';
   if (C<>nil) then begin
      Result:=C.code;
   end;
end;

function TZagsInterface.GetClassifierLexema(C: Classifier): string;
begin
   Result:='';
   if (C<>nil) and (Length(C.lexema)>0) then begin
      Result:=C.lexema[0].Text;
   end;
end;

function TZagsInterface.CreateAffActRequest(MessageType, ParentMessageId: string): affiliation_act;
begin
   //������ ���� �� ������������ ���������
   Result:=affiliation_act.Create;
   //��������� ����������
   Result.cover:=CreateMessageCover(MessageType, ParentMessageId);
   //��� �� ������������ ���������
   Result.aff_cert_data:=CreateAffCertData;
end;

function TZagsInterface.CreateAffCertData: aff_cert_data;
begin
   //��� �� ������������ ���������
   Result:=aff_cert_data.Create;
   //�������� � ����, � ��������� �������� ��������������� ���������
   Result.aff_person:=CreateAffPerson;
   //������������ ������ ������
   Result.mother_data:=CreatePersonalData;
   //������������ ������ ����
   Result.father_data:=CreatePersonalData;
   //��������� ������ ���� �� ������������ ��������� - ������� ����
   Result.court_decision:=CreateActReason;
   //���������� �� ������� ������
   Result.aff_act_data:=CreateActData;
   //���������� � �������� ��������� (������������� ��� ������)
   Result.aff_mother_certificate_data:=CreateDocument;
   //���������� � �������� ��������� (������������� ��� ����)
   Result.aff_father_certificate_data:=CreateDocument;
end;

function TZagsInterface.CreateAffPerson: aff_person;
begin
   //�������� � ����, � ��������� �������� ��������������� ���������
   Result:=aff_person.Create;
   //���������� �� ���� � ��������
   Result.birth_act_data:=CreateActData;
   //������������ ������ ���� �� ������������ ���������
   Result.before_aff_person_data:=CreatePersonalData;
   //������������ ������ ���� ����� ������������ ���������
   Result.after_aff_person_data:=CreatePersonalData;
end;

function TZagsInterface.PostAdoptionCertificate(const adpActRequest: adoption_act; Log: TStrings): return_code;
begin
   ClearError;
   Result:=nil;
   try
      if GetService<>nil then begin
         Log.Add('');
         Log.Add('����������� �������� ������ ������� ������ � �������:');
         Log.Add('');
         Log.Add('������ ���� �� ����������� (����������)');
         Log.Add('');
         MessageCoverToLog(Log, adpActRequest.cover);
         Log.Add('');
         AdpCertDataToLog(Log, adpActRequest.adp_cert_data);
         Result:=FService.postAdoptionCertificate(adpActRequest);
         Log.Add('');
         Log.Add('������� �����:');
         Log.Add('');
         ReturnCodeToLog(Log, Result);
         CopyErrorList(Result.error_list);
      end
      else begin
         Log.Add('������: GetService=nil');
      end;
   except
      on E: Exception do begin
         HandleException(E, Log);
      end;
   end
end;

function TZagsInterface.PostAffiliationCertificate(const affActRequest: affiliation_act; Log: TStrings): return_code;
begin
   ClearError;
   Result:=nil;
   try
      if GetService<>nil then begin
         Log.Add('');
         Log.Add('����������� �������� ������ ������� ������ � �������:');
         Log.Add('');
         Log.Add('������ ���� �� ������������ ���������');
         Log.Add('');
         MessageCoverToLog(Log, affActRequest.cover);
         Log.Add('');
         AffCertDataToLog(Log, affActRequest.aff_cert_data);
         Result:=FService.PostAffiliationCertificate(affActRequest);
         Log.Add('');
         Log.Add('������� �����:');
         Log.Add('');
         ReturnCodeToLog(Log, Result);
         CopyErrorList(Result.error_list);
      end
      else begin
         Log.Add('������: GetService=nil');
      end;
   except
      on E: Exception do begin
         HandleException(E, Log);
      end;
   end
end;

function TZagsInterface.PostDeceaseCertificate(const dcsActRequest: decease_act; Log: TStrings): return_code;
begin
   ClearError;
   Result:=nil;
   try
      if GetService<>nil then begin
         Log.Add('');
         Log.Add('����������� �������� ������ ������� ������ � �������:');
         Log.Add('');
         Log.Add('������ ���� � ������');
         Log.Add('');
         MessageCoverToLog(Log, dcsActRequest.cover);
         Log.Add('');
         DcsCertDataToLog(Log, dcsActRequest.dcs_cert_data);
         Result:=FService.postDeceaseCertificate(dcsActRequest);
         Log.Add('');
         Log.Add('������� �����:');
         Log.Add('');
         ReturnCodeToLog(Log, Result);
         CopyErrorList(Result.error_list);
      end
      else begin
         Log.Add('������: GetService=nil');
      end;
   except
      on E: Exception do begin
         HandleException(E, Log);
      end;
   end
end;

function TZagsInterface.PostDivorceCertificate(const dvcActRequest: divorce_act; Log: TStrings): return_code;
begin
   ClearError;
   Result:=nil;
   try
      if GetService<>nil then begin
         Log.Add('');
         Log.Add('����������� �������� ������ ������� ������ � �������:');
         Log.Add('');
         Log.Add('������ ���� � ����������� �����');
         Log.Add('');
         MessageCoverToLog(Log, dvcActRequest.cover);
         Log.Add('');
         DvcCertDataToLog(Log, dvcActRequest.dvc_cert_data);
         Result:=FService.postDivorceCertificate(dvcActRequest);
         Log.Add('');
         Log.Add('������� �����:');
         Log.Add('');
         ReturnCodeToLog(Log, Result);
         CopyErrorList(Result.error_list);
      end
      else begin
         Log.Add('������: GetService=nil');
      end;
   except
      on E: Exception do begin
         HandleException(E, Log);
      end;
   end
end;

function TZagsInterface.PostMarriageCertificate(const mrgActRequest: marriage_act; Log: TStrings): return_code;
begin
   ClearError;
   Result:=nil;
   try
      if GetService<>nil then begin
         Log.Add('');
         Log.Add('����������� �������� ������ ������� ������ � �������:');
         Log.Add('');
         Log.Add('������ ���� � ���������� �����');
         Log.Add('');
         MessageCoverToLog(Log, mrgActRequest.cover);
         Log.Add('');
         MrgCertDataToLog(Log, mrgActRequest.mrg_cert_data);
         Result:=FService.postMarriageCertificate(mrgActRequest);
         Log.Add('');
         Log.Add('������� �����:');
         Log.Add('');
         ReturnCodeToLog(Log, Result);
         CopyErrorList(Result.error_list);
      end
      else begin
         Log.Add('������: GetService=nil');
      end;
   except
      on E: Exception do begin
         HandleException(E, Log);
      end;
   end
end;

function TZagsInterface.PostNameChangeCertificate(const cngActRequest: name_change_act; Log: TStrings): return_code;
begin
   ClearError;
   Result:=nil;
   try
      if GetService<>nil then begin
         Log.Add('');
         Log.Add('����������� �������� ������ ������� ������ � �������:');
         Log.Add('');
         Log.Add('������ ���� � �������� �����');
         Log.Add('');
         MessageCoverToLog(Log, cngActRequest.cover);
         Log.Add('');
         CngCertDataToLog(Log, cngActRequest.cng_cert_data);
         Result:=FService.postNameChangeCertificate(cngActRequest);
         Log.Add('');
         Log.Add('������� �����:');
         Log.Add('');
         ReturnCodeToLog(Log, Result);
         CopyErrorList(Result.error_list);
      end
      else begin
         Log.Add('������: GetService=nil');
      end;
   except
      on E: Exception do begin
         HandleException(E, Log);
      end;
   end
end;

function TZagsInterface.PostReconstBirthCertificate(const rcnBirthActRequest: reconstructed_birth_act; Log: TStrings): return_code;
begin
   ClearError;
   Result:=nil;
   try
      if GetService<>nil then begin
         Log.Add('');
         Log.Add('����������� �������� ������ ������� ������ � �������:');
         Log.Add('');
         Log.Add('��������������� ������� ������ � ��������');
         Log.Add('');
         MessageCoverToLog(Log, rcnBirthActRequest.cover);
         Log.Add('');
         RcnBirthCertDataToLog(Log, rcnBirthActRequest.rcn_birth_cert_data);
         Result:=FService.postReconstBirthCertificate(rcnBirthActRequest);
         Log.Add('');
         Log.Add('������� �����:');
         Log.Add('');
         if Result<>nil then begin
            ReturnCodeToLog(Log, Result);
            CopyErrorList(Result.error_list);
         end
         else begin
            Log.Add('return_code =nil')
         end;
      end
      else begin
         Log.Add('������: GetService=nil');
      end;
   except
      on E: Exception do begin
         HandleException(E, Log);
      end;
   end
end;

procedure TZagsInterface.AffCertDataToLog(Log: TStrings; Act: aff_cert_data);
begin
   //��� �� ������������ ���������
   Log.Add('�������� � ����, � ��������� �������� ��������������� ���������');
   Log.Add('');
   Log.Add('���������� �� ���� � ��������');
   Log.Add('');
   ActDataToLog(Log, Act.aff_person.birth_act_data, 'aff_person/birth_act_data/');
   Log.Add('');
   Log.Add('������������ ������ ���� �� ������������ ���������');
   Log.Add('');
   PersonalDataToLog(Log, Act.aff_person.before_aff_person_data, 'aff_person/before_aff_person_data/');
   Log.Add('');
   Log.Add('������������ ������ ���� ����� ������������ ���������');
   Log.Add('');
   PersonalDataToLog(Log, Act.aff_person.after_aff_person_data, 'aff_person/before_aff_person_data/');
   Log.Add('');
   Log.Add('������������ ������ ������');
   Log.Add('');
   PersonalDataToLog(Log, Act.mother_data, 'mother_data/');
   Log.Add('');
   Log.Add('������������ ������ ����');
   Log.Add('');
   PersonalDataToLog(Log, Act.father_data, 'father_data/');
   Log.Add('');
   Log.Add('��������� ������ ���� �� ������������ ��������� - ������� ����');
   Log.Add('');
   ActReasonToLog(Log, Act.court_decision, 'court_decision/');
   Log.Add('');
   Log.Add('���������� �� ������� ������');
   Log.Add('');
   ActDataToLog(Log, Act.aff_act_data, 'aff_act_data/');
   Log.Add('');
   Log.Add('���������� � �������� ��������� (������������� ��� ������)');
   Log.Add('');
   DocumentToLog(Log, Act.aff_mother_certificate_data, 'aff_mother_certificate_data/');
   Log.Add('');
   Log.Add('���������� � �������� ��������� (������������� ��� ����)');
   Log.Add('');
   DocumentToLog(Log, Act.aff_father_certificate_data, 'aff_father_certificate_data/');
end;

function TZagsInterface.CreateMarriageActRequest(MessageType, ParentMessageId: string): marriage_act;
begin
   //������ ���� � ���������� �����
   Result:=marriage_act.Create;
   //��������� ����������
   Result.cover:=CreateMessageCover(MessageType, ParentMessageId);
   //��� � ���������� �����
   Result.mrg_cert_data:=CreateMrgCertData;
end;

function TZagsInterface.CreateAdoptionActRequest(MessageType, ParentMessageId: string): adoption_act;
begin
   //������ ���� �� ����������� (����������)
   Result:=adoption_act.Create;
   //��������� ����������
   Result.cover:=CreateMessageCover(MessageType, ParentMessageId);
   //��� �� ����������� (����������)
   Result.adp_cert_data:=CreateAdpCertData;
end;

function TZagsInterface.CreateDeceaseActRequest(MessageType, ParentMessageId: string): decease_act;
begin
   //������ ���� � ������
   Result:=decease_act.Create;
   //��������� ����������
   Result.cover:=CreateMessageCover(MessageType, ParentMessageId);
   //��� � ������
   Result.dcs_cert_data:=CreateDcsCertData;
end;

function TZagsInterface.CreateDivorceActRequest(MessageType, ParentMessageId: string): divorce_act;
begin
   //������ ���� � ����������� �����
   Result:=divorce_act.Create;
   //��������� ����������
   Result.cover:=CreateMessageCover(MessageType, ParentMessageId);
   //��� � ����������� �����
   Result.dvc_cert_data:=CreateDvcCertData;
end;

function TZagsInterface.CreateNameChangeActRequest(MessageType, ParentMessageId: string): name_change_act;
begin
   //������ ���� � �������� �����
   Result:=name_change_act.Create;
   //��������� ����������
   Result.cover:=CreateMessageCover(MessageType, ParentMessageId);
   //��� � �������� �����
   Result.cng_cert_data:=CreateCngCertData;
end;

function TZagsInterface.CreateReconstructedBirthActRequest(MessageType, ParentMessageId: string): reconstructed_birth_act;
begin
   //��������������� ������ ���� � ��������
   Result:=reconstructed_birth_act.Create;
   //��������� ����������
   Result.cover:=CreateMessageCover(MessageType, ParentMessageId);
   //��������������� ��� � ��������
   Result.rcn_birth_cert_data:=CreateRcnBirthCertData;
end;

function TZagsInterface.CreateMrgCertData: mrg_cert_data;
begin
  //��� � ���������� �����
  Result:=mrg_cert_data.Create;
  //1. ���������� � �������
  Result.bride:=bride.Create;
  //1.1. ������������ ������ �������
  Result.bride.bride_data:=CreatePersonalData;
  //2. ���������� � ������
  Result.bridegroom:=bridegroom.Create;
  //2.1. ������������ ������ ������
  Result.bridegroom.bridegroom_data:=CreatePersonalData;
  //3. �������� � ���������� �����, �� ��������� 18 ���
  //joint_child: Array_Of_joint_child;
  //4. ���������� �� ������� ������
  Result.mrg_act_data:=CreateActData;
  //5. ���������� � �������� ���������
  Result.mrg_certificate_data:=CreateDocument;
end;

procedure TZagsInterface.AdpCertDataToLog(Log: TStrings; Act: adp_cert_data);
begin
   //��� �� ����������� (����������)
   Log.Add('�������� �� ������������');
   Log.Add('');
   //����������������� ����� �������������
   Log.Add(Format('adp_child/identif =%s', [Act.adp_child.identif]));
   Log.Add('');
   Log.Add('�������� �� ������������ �� �����������');
   Log.Add('');
   Log.Add('������������ ������ ������������� �� �����������');
   Log.Add('');
   PersonalDataToLog(Log, Act.adp_child.before_adp_child.before_adp_child_data, 'adp_child/before_adp_child/before_adp_child_data/');
   Log.Add('');
   Log.Add('���������� �� ���� � �������� (�� �����������)');
   Log.Add('');
   ActDataToLog(Log, Act.adp_child.before_adp_child.before_adp_birth_act_data, 'adp_child/before_adp_child/before_adp_birth_act_data/');
   Log.Add('');
   Log.Add('�������� �� ������������ ����� �����������');
   Log.Add('');
   Log.Add('������������ ������ ������������� ����� �����������');
   Log.Add('');
   PersonalDataToLog(Log, Act.adp_child.after_adp_child.after_adp_child_data, 'adp_child/after_adp_child/after_adp_child_data/');
   Log.Add('');
   Log.Add('���������� �� ���� � �������� (����� �����������)');
   Log.Add('');
   ActDataToLog(Log, Act.adp_child.after_adp_child.after_adp_birth_act_data, 'adp_child/after_adp_child/after_adp_birth_act_data/');
   Log.Add('');
   Log.Add('������������ ������ ������');
   Log.Add('');
   PersonalDataToLog(Log, Act.mother_data, 'mother_data/');
   Log.Add('');
   Log.Add('������������ ������ ����');
   Log.Add('');
   PersonalDataToLog(Log, Act.father_data, 'father_data/');
   Log.Add('');
   Log.Add('������������ ������ ���������������');
   Log.Add('');
   PersonalDataToLog(Log, Act.adp_mother_data, 'adp_mother_data/');
   Log.Add('');
   Log.Add('������������ ������ �����������');
   Log.Add('');
   PersonalDataToLog(Log, Act.adp_father_data, 'adp_father_data/');
   Log.Add('');
   Log.Add('�������� � ����������� ���������� �����');
   Log.Add('');
   //������� ���������� �����
   Log.Add(Format('marriage/mrg_flag =%s', [GetEnumName(TypeInfo(MarrFlag), Integer(Act.marriage.mrg_flag))]));
   Log.Add('');
   Log.Add('���������� �� ���� � ���������� �����');
   Log.Add('');
   ActDataToLog(Log, Act.marriage.mrg_cert_data, 'marriage/mrg_cert_data/');
   Log.Add('');
   Log.Add('��������� ������ ���� �� ����������� (����������) - ������� ����');
   Log.Add('');
   ActReasonToLog(Log, Act.court_decision, 'court_decision/');
   Log.Add('');
   //������������ �� ����������� ���������� ������
   Log.Add(Format('parents_flag  =%s', [GetEnumName(TypeInfo(ParentsFlag), Integer(Act.parents_flag))]));
   Log.Add('');
   Log.Add('���������� �� ������� ������');
   Log.Add('');
   ActDataToLog(Log, Act.adp_act_data, 'adp_act_data/');
   Log.Add('');
   Log.Add('���������� � �������� ���������');
   Log.Add('');
   DocumentToLog(Log, Act.adp_certificate_data, 'adp_certificate_data/');
end;

procedure TZagsInterface.CngCertDataToLog(Log: TStrings; Act: cng_cert_data);
var
   I: Integer;
begin
   //��� � �������� �����
   Log.Add('');
   Log.Add('������������ ������ ����');
   Log.Add('');
   PersonalDataToLog(Log, Act.person.person_data, 'person/person_data/');
   Log.Add('');
   //1.2. ������� �� �������� �����
   Log.Add(Format('person/old_last_name  =%s', [Act.person.old_last_name]));
   //1.3. ��� �� �������� �����
   Log.Add(Format('person/old_name       =%s', [Act.person.old_name]));
   //1.4. �������� �� �������� �����
   Log.Add(Format('person/old_patronymic =%s', [Act.person.old_patronymic]));
   Log.Add('');
   Log.Add('���������� �� ���� � ��������');
   Log.Add('');
   ActDataToLog(Log, Act.person.birth_act_data, 'person/birth_act_data/');
   Log.Add('');
   Log.Add(Format('�������� � �����, �� ��������� 18 ��� (%d):', [Length(Act.joint_child)]));
   for I:=Low(Act.joint_child) to High(Act.joint_child) do begin
      Log.Add('');
      Log.Add('���������� � ������');
      Log.Add('');
      PersonalDataToLog(Log, Act.joint_child[I], 'joint_child/');
   end;
   Log.Add('');
   //��������� ������ ���� � �������� �����
   Log.Add(Format('reason  =%s', [Act.reason]));
   Log.Add('');
   Log.Add('���������� �� ������� ������');
   Log.Add('');
   ActDataToLog(Log, Act.cng_act_data, 'cng_act_data/');
   Log.Add('');
   Log.Add('���������� � �������� ���������');
   Log.Add('');
   DocumentToLog(Log, Act.cng_certificate_data, 'cng_certificate_data/');
end;

procedure TZagsInterface.DcsCertDataToLog(Log: TStrings; Act: dcs_cert_data);
begin
   //��� � ������
   Log.Add('������������ ������ ��������');
   Log.Add('');
   PersonalDataToLog(Log, Act.person_data, 'person_data/');
   Log.Add('');
   Log.Add('���������� � ������');
   Log.Add('');
   //������� ������
   Log.Add(Format('decease_data/death_cause  =%s', [GetClassifierString(Act.decease_data.death_cause)]));
   //���� ������
   Log.Add(Format('decease_data/death_date   =%s', [Act.decease_data.death_date]));
   Log.Add('����� ������');
   //������
   Log.Add(Format('decease_data/decease_place/country_d    =%s', [GetClassifierString(Act.decease_data.decease_place.country_d)]));
   //�������
   Log.Add(Format('decease_data/decease_place/area_d       =%s', [Act.decease_data.decease_place.area_d]));
   //�������
   Log.Add(Format('decease_data/decease_place/area_d_bel   =%s', [Act.decease_data.decease_place.area_d_bel]));
   //�����
   Log.Add(Format('decease_data/decease_place/region_d     =%s', [Act.decease_data.decease_place.region_d]));
   //�����
   Log.Add(Format('decease_data/decease_place/region_d_bel =%s', [Act.decease_data.decease_place.region_d_bel]));
   //��� ���������� ������
   Log.Add(Format('decease_data/decease_place/type_city_d  =%s', [GetClassifierString(Act.decease_data.decease_place.type_city_d)]));
   //��������� �����
   Log.Add(Format('decease_data/decease_place/city_d       =%s', [Act.decease_data.decease_place.city_d]));
   //��������� �����
   Log.Add(Format('decease_data/decease_place/city_d_bel   =%s', [Act.decease_data.decease_place.city_d_bel]));
   //������ ����������� �
   Log.Add(Format('decease_dat/death_place   =%s', [Act.decease_data.death_place]));
   //����� �����������
   Log.Add(Format('decease_data/burial_place =%s', [Act.decease_data.burial_place]));
   //��������, �������������� ���� ������
   Log.Add(Format('reason       =%s', [Act.reason]));
   Log.Add('');
   Log.Add('���������� �� ������� ������');
   Log.Add('');
   ActDataToLog(Log, Act.dcs_act_data, 'dcs_act_data/');
   Log.Add('');
   Log.Add('���������� � �������� ���������');
   Log.Add('');
   DocumentToLog(Log, Act.dcs_certificate_data, 'dcs_certificate_data/');
end;

procedure TZagsInterface.DvcCertDataToLog(Log: TStrings; Act: dvc_cert_data);
var
   I: Integer;
begin
   //��� � ����������� �����
   Log.Add('���������� � ����');
   Log.Add('');
   Log.Add('������������ ������ ����');
   Log.Add('');
   PersonalDataToLog(Log, Act.wife.wife_data, 'wife/wife_data/');
   Log.Add('');
   //������� �� ����������� �����
   Log.Add(Format('wife/old_last_name =%s', [Act.wife.old_last_name]));
   Log.Add('');
   Log.Add('���������� � ����');
   Log.Add('');
   Log.Add('������������ ������ ����');
   Log.Add('');
   PersonalDataToLog(Log, Act.husband.husband_data, 'husband/husband_data/');
   Log.Add('');
   //������� �� ����������� �����
   Log.Add(Format('husband/old_last_name =%s', [Act.husband.old_last_name]));
   Log.Add('');
   Log.Add('���������� �� ���� � ����������� �����');
   Log.Add('');
   ActDataToLog(Log, Act.mrg_act_data, 'mrg_act_data/');
   Log.Add('');
   Log.Add(Format('�������� � ���������� �����, �� ��������� 18 ��� (%d):', [Length(Act.joint_child)]));
   for I:=Low(Act.joint_child) to High(Act.joint_child) do begin
      Log.Add('');
      Log.Add('���������� � ������');
      Log.Add('');
      PersonalDataToLog(Log, Act.joint_child[I], 'joint_child/');
   end;
   Log.Add('');
   Log.Add('��������� ������ ���� � ����������� �����  - ������� ����');
   Log.Add('');
   ActReasonToLog(Log, Act.court_decision, 'court_decision/');
   Log.Add('');
   Log.Add('���������� �� ������� ������');
   Log.Add('');
   ActDataToLog(Log, Act.dvc_act_data, 'dvc_act_data/');
   Log.Add('');
   Log.Add('���������� � �������� ��������� (������������� ��� ������ ����)');
   Log.Add('');
   DocumentToLog(Log, Act.dvc_wm_certificate_data, 'dvc_wm_certificate_data/');
   Log.Add('');
   Log.Add('���������� � �������� ��������� (������������� ��� ������� ����)');
   Log.Add('');
   DocumentToLog(Log, Act.dvc_mn_certificate_data, 'dvc_mn_certificate_data/');
end;

procedure TZagsInterface.MrgCertDataToLog(Log: TStrings; Act: mrg_cert_data);
var
   I: Integer;
begin
   //��� � ���������� �����
   Log.Add('���������� � �������');
   Log.Add('');
   Log.Add('������������ ������ �������');
   Log.Add('');
   PersonalDataToLog(Log, Act.bride.bride_data, 'bride/bride_data/');
   Log.Add('');
   Log.Add('������� �� ���������� �����');
   Log.Add('');
   Log.Add(Format('bride/old_last_name =%s', [Act.bride.old_last_name]));
   Log.Add('');
   Log.Add('���������� � ������');
   Log.Add('');
   Log.Add('������������ ������ ������');
   Log.Add('');
   PersonalDataToLog(Log, Act.bridegroom.bridegroom_data, 'bridegroom/bridegroom_data/');
   Log.Add('');
   Log.Add('������� �� ���������� �����');
   Log.Add('');
   Log.Add(Format('bridegroom/old_last_name =%s', [Act.bridegroom.old_last_name]));
   Log.Add('');
   Log.Add(Format('�������� � ���������� �����, �� ��������� 18 ��� (%d):', [Length(Act.joint_child)]));
   for I:=Low(Act.joint_child) to High(Act.joint_child) do begin
      Log.Add('');
      Log.Add('���������� � ������');
      Log.Add('');
      PersonalDataToLog(Log, Act.joint_child[I], 'joint_child/');
   end;
   Log.Add('');
   Log.Add('���������� �� ������� ������');
   Log.Add('');
   ActDataToLog(Log, Act.mrg_act_data, 'mrg_act_data/');
   Log.Add('');
   Log.Add('���������� � �������� ���������');
   Log.Add('');
   DocumentToLog(Log, Act.mrg_certificate_data, 'mrg_certificate_data/');
end;

procedure TZagsInterface.RcnBirthCertDataToLog(Log: TStrings; Act: rcn_birth_cert_data);
begin
   //��������������� ��� � ��������
   Log.Add('������������ ������ ������');
   Log.Add('');
   PersonalDataToLog(Log, Act.child_data, 'child_data/');
   Log.Add('');
   Log.Add('������������ ������ ������');
   Log.Add('');
   PersonalDataToLog(Log, Act.mother_data, 'mother_data/');
   Log.Add('');
   Log.Add('������������ ������ ����');
   Log.Add('');
   PersonalDataToLog(Log, Act.father_data, 'father_data/');
   Log.Add('');
   Log.Add('��������� �������������� ������ - ������� ����');
   Log.Add('');
   ActReasonToLog(Log, Act.court_decision, 'court_decision/');
   Log.Add('');
   Log.Add('���������� �� ������� ������');
   Log.Add('');
   ActDataToLog(Log, Act.rcn_birth_act_data, 'rcn_birth_act_data/');
   Log.Add('');
   Log.Add('���������� � �������� ���������');
   Log.Add('');
   DocumentToLog(Log, Act.rcn_birth_certificate_data, 'rcn_birth_certificate_data/');
end;

function TZagsInterface.CreateDcsCertData: dcs_cert_data;
begin
   //��� � ������
   Result:=dcs_cert_data.Create;
   //������������ ������ ��������
   Result.person_data:=CreatePersonalData;
   //���������� � ������
   Result.decease_data:=CreateDeath;
   //��������, �������������� ���� ������
   //reason: WideString;
   //���������� �� ������� ������
   Result.dcs_act_data:=CreateActData;
   //���������� � �������� ���������
   Result.dcs_certificate_data:=CreateDocument;
end;

function TZagsInterface.CreateDeath: Death;
begin
   //���������� � ������
   Result:=Death.Create;
   //������� ������
   //death_cause: Classifier;
   //���� ������
   //death_date: WideString;
   //����� ������
   Result.decease_place:=decease_place.Create;
   //������
   //country_d: Classifier;
   //�������
   //area_d: WideString;
   //�������
   //area_d_bel: WideString;
   //�����
   //region_d: WideString;
   //�����
   //region_d_bel: WideString;
   //��� ���������� ������
   //type_city_d: Classifier;
   //��������� �����
   //city_d: WideString;
   //��������� �����
   //city_d_bel: WideString;
   //������ ����������� �
   //death_place: WideString;
   //����� �����������
   //burial_place: WideString;
end;

function TZagsInterface.CreateDvcCertData: dvc_cert_data;
begin
   //��� � ����������� �����
   Result:=dvc_cert_data.Create;
   //���������� � ����
   Result.wife:=wife.Create;
   //������������ ������ ����
   Result.wife.wife_data:=CreatePersonalData;
   //������� �� ����������� �����
   //Fold_last_name: WideString;
   //���������� � ����
   Result.husband:=husband.Create;
   //������������ ������ ����
   Result.husband.husband_data:=CreatePersonalData;
   //������� �� ����������� �����
   //Fold_last_name: WideString;
   //���������� �� ���� � ����������� �����
   Result.mrg_act_data:=CreateActData;
   //�������� � ���������� �����, �� ��������� 18 ���
   //joint_child: Array_Of_joint_child2;
   //��������� ������ ���� � ����������� �����  - ������� ����
   Result.court_decision:=CreateActReason;
   //���������� �� ������� ������
   Result.dvc_act_data:=CreateActData;
   //���������� � �������� ��������� (������������� ��� ������ ����)
   Result.dvc_wm_certificate_data:=CreateDocument;
   //���������� � �������� ��������� (������������� ��� ������� ����)
   Result.dvc_mn_certificate_data:=CreateDocument;
end;

function TZagsInterface.CreateAdpCertData: adp_cert_data;
begin
   //��� �� ����������� (����������)
   Result:=adp_cert_data.Create;
   //1. �������� �� ������������
   Result.adp_child:=adp_child.Create;
   //1.1. ����������������� ����� �������������
   //Result.adp_child.identif: PersonalId;
   //1.2. �������� �� ������������ �� �����������
   Result.adp_child.before_adp_child:=before_adp_child.Create;
   //1.2.1. ������������ ������ ������������� �� �����������
   Result.adp_child.before_adp_child.before_adp_child_data:=CreatePersonalData;
   //1.2.2. ���������� �� ���� � �������� (�� �����������)
   Result.adp_child.before_adp_child.before_adp_birth_act_data:=CreateActData;
   //1.3. �������� �� ������������ ����� �����������
   Result.adp_child.after_adp_child:=after_adp_child.Create;
   //1.3.1. ������������ ������ ������������� ����� �����������
   Result.adp_child.after_adp_child.after_adp_child_data:=CreatePersonalData;
   //1.3.2. ���������� �� ���� � �������� (����� �����������)
   Result.adp_child.after_adp_child.after_adp_birth_act_data:=CreateActData;
   //2. ������������ ������ ������
   Result.mother_data:=CreatePersonalData;
   //3. ������������ ������ ����
   Result.father_data:=CreatePersonalData;
   //4. ������������ ������ ���������������
   Result.adp_mother_data:=CreatePersonalData;
   //5. ������������ ������ �����������
   Result.adp_father_data:=CreatePersonalData;
   //6. �������� � ����������� ���������� �����
   Result.marriage:=marriage.Create;
   //6.1. ������� ���������� �����
   //Result.marriage.mrg_flag: MarrFlag;
   //6.2. ���������� �� ���� � ���������� �����
   Result.marriage.mrg_cert_data:=CreateActData;
   //7. ��������� ������ ���� �� ����������� (����������) - ������� ����
   Result.court_decision:=CreateActReason;
   //8. ������������ �� ����������� ���������� ������
   //Result.parents_flag: ParentsFlag;
   //9. ���������� �� ������� ������
   Result.adp_act_data:=CreateActData;
   //10. ���������� � �������� ���������
   Result.adp_certificate_data:=CreateDocument;
end;

function TZagsInterface.CreateCngCertData: cng_cert_data;
begin
   //��� � �������� �����
   Result:=cng_cert_data.Create;
   //1. ������������ ������ ����
   Result.person:=person.Create;
   //1.1. ������������ ������ ����
   Result.person.person_data:=CreatePersonalData;
   //1.2. ������� �� �������� �����
   //Result.person.old_last_name: WideString;
   //1.3. ��� �� �������� �����
   //Result.person.old_name: WideString;
   //1.4. �������� �� �������� �����
   //Result.person.old_patronymic: WideString;
   //1.5. ���������� �� ���� � ��������
   Result.person.birth_act_data:=CreateActData;
   //2. �������� � �����, �� ��������� 18 ���
   //Result.children: Array_Of_children;
   //2.1. ���������� � ������
   //Result..children[].child_data: PersonalData;
   //2.2. ���������� �� ���� � ��������
   //Result..children[].birth_act_data: ActData;
   //3. ��������� ������ ���� � �������� �����
   //Result.reason: WideString;
   //4. ���������� �� ������� ������
   Result.cng_act_data:=CreateActData;
   //5. ���������� � �������� ���������
   Result.cng_certificate_data:=CreateDocument;
end;

function TZagsInterface.CreateRcnBirthCertData: rcn_birth_cert_data;
begin
   //��������������� ��� � ��������
   Result:=rcn_birth_cert_data.Create;
   //1. ������������ ������ ������
   Result.child_data:=CreatePersonalData;
   //2. ������������ ������ ������
   Result.mother_data:=CreatePersonalData;
   //3. ������������ ������ ����
   Result.father_data:=CreatePersonalData;
   //4. ��������� �������������� ������ - ������� ����
   Result.court_decision:=CreateActReason;
   //5. ���������� �� ������� ������
   Result.rcn_birth_act_data:=CreateActData;
   //6. ���������� � �������� ���������
   Result.rcn_birth_certificate_data:=CreateDocument;
end;

function TZagsInterface.CreateActReason: ActReason;
begin
   //��������� ������ ����
   Result:=ActReason.Create;
   //������������ ����
   //court_name: WideString;
   //���� ��������� �������
   //court_decision_date: WideString;
   //����������� � ��������� ������ ����
   //comment: WideString;
end;

procedure TZagsInterface.ActReasonToLog(Log: TStrings; Act: ActReason; Add: string);
begin
   if Act<>nil then begin
      Log.Add(Format(Add+'court_name          =%s', [Act.court_name]));
      Log.Add(Format(Add+'court_decision_date =%s', [Act.court_decision_date]));
      Log.Add(Format(Add+'comment             =%s', [Act.comment]));
   end
   else begin
      Log.Add(Add+' =nil');
   end;
end;

end.//TZagsInterface
