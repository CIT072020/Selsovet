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
      //������
      FService: GisunCommonWs;
      //����� �������
      FUrl: string;
      FProxy: string;
      //
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
      function GetService: GisunCommonWs;
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
      function CreateClassifier(Code: string; ClassifierType: Integer): Classifier;
      function CreateDateTime(DateTime: TDateTime): TXSDateTime;
      function CreateRegisterRequest(MessageType: string; PersonCount, IdentifierCount: Integer): register_request;
      function CreateDocument: Document;
      //��������� ����������
      procedure HandleException(E: Exception; Log: TStrings);
      //������ ���������� � error-dataset
      function  FindNodeXML(x:TXMLNode; strFind:String):TXMLNode;
      procedure FaultDetailToError(strFaultDetail:String; strMessage:String);
      //����� �������
      function GetPersonalData(const registerRequest: register_request; var registerResponse: register_response; Log: TStrings): Boolean;
      //��������������� ������� ��� ������:
      //����� � ���
      procedure MessageCoverToLog(Log: TStrings; Cover: MessageCover);
      procedure ErrorListToLog(Log: TStrings; error_list: ErrorList);
      procedure PersonalDataToLog(Log: TStrings; Data: PersonalData; Add: string);
      procedure DocumentToLog(Log: TStrings; Doc: Document; Add: string);
      procedure AddressToLog(Log: TStrings; Adr: Address; Add: string);
      procedure FamilyToLog(Log: TStrings; Fam: Family; Add: string);
      procedure DeathToLog(Log: TStrings; D: Death; Add: string);
      procedure CitizenshipToLog(Log: TStrings; C: Citizenship; Add: string);
      //�������������� � ������
      function GetClassifierString(C: Classifier): string;
      function GetDateString(Date: TXSDate): string;
      function GetDateTimeString(DateTime: TXSDateTime): string;
      //������ ���������������
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
   //-2 ���� ��������� ����������
   //-1 ��������� ���������
   //1 �������
   //6 ���� ��������� �����������
   //7 ���������� ������
   ctCountry    =   8;  //������
   ctMVD        =  24;  //������ ���
   //29 ������
   ctPol        =  32;  //���
   //34 �����
   ctTypeCityGit=  35;  //���� ���������� �������  ����� ����������
   ctTypeCity   =  68;  //���� ���������� �������  ����� �������� � ����� ������
   ctDocType    =  37;  //���� ����������
   //38 ���� ����
   ctZags       =  80;  //������ ����
   ctDeathCause =  81;  //������� ������
   ctActType    =  82;  //���� ������� �������

implementation
uses
   mRegInt;
   
{ TGisunInterface }

constructor TGisunInterface.Create;
begin
   //������ ��������� ������
   FError:=CreateErrorTable;
   //SOAP
   FRIO:=THTTPRIO.Create(nil);
   FRIO.OnAfterExecute:=RIOAfterExecute;
   FRIO.OnBeforeExecute:=RIOBeforeExecute;
end;

destructor TGisunInterface.Destroy;
begin
   FService:=nil;
   //!!!!!!! ������ �� �������� AV
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
  XMLDoc.SaveToFile(ExtractFilePath(Application.ExeName)+'������_�����.xml');
  XMLDoc.Free;
end;

procedure TGisunInterface.RIOBeforeExecute(const MethodName: string; var SOAPRequest: WideString);
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
//  XMLDoc:=TNativeXML.Create;
  s:=Utf8Encode(SOAPRequest);
  MemoWrite(ExtractFilePath(Application.ExeName)+'������.xml',s);
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
      //try except end !!! ����� ��� �����
   end;
   Result:=FService;
end;

function TGisunInterface.CreateClassifier(Code: string; ClassifierType: Integer): Classifier;
begin
   //�������������
   Result:=Classifier.Create;
   //������� ��������
   Result.code:=Code;
   //��� ��������������
   Result.type_:=ClassifierType;
   //������ ������
   //Result.lexema/
   //Result.lexema/Text
   //���� ������������� ��������
   //Result.lexema/lang
   //������� ����������
   //Result.active
   //���� ������������
   //Result.begin_date
   //���� �����������
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
   //���������� �������������
   Result:=GUIDToString(GUID);
end;

function TGisunInterface.CreateMessageCover(MessageType, ParentId: string): MessageCover;
begin
   //���������������� ���������� � ���������
   Result:=MessageCover.Create;
   //������������� ���������
   Result.message_id:=CreateId;
   //��� ���������
   Result.message_type:=CreateClassifier(MessageType, ctActType);
   //����� �������� ���������
   Result.message_time:=CreateDateTime(Now);
   //�������� ���������
   Result.message_source:=CreateClassifier(FMessageSource, ctZags);
   //������������� ���������, ��� �������� ������� �������� �������
   Result.parent_message_id:=ParentId;
end;

function TGisunInterface.CreateRegisterRequest(MessageType: string; PersonCount, IdentifierCount: Integer): register_request;
var
   I: Integer;
   person_request: Array_Of_PersonRequest;
   identif_request: Array_Of_IdentifRequest;
begin
   //������ �� ��������� ������ �� ��� ��
   Result:=register_request.Create;
   //��������� �������
   //���������������� ���������� � ���������
   Result.cover:=CreateMessageCover(MessageType, '');
   //���� �������
   //������ �������� � ��� ��
   Result.request:=RequestData.Create;
   //������������� ������� �� ��������� ������������ ������
   if PersonCount>0 then begin
      SetLength(person_request, PersonCount);
      for I:=0 to Pred(PersonCount) do begin
         //������ �� ��������� ������������ ������
         person_request[I]:=PersonRequest.Create;
         //������������� �������
         person_request[I].request_id:=CreateId;
         //����������������� �����
         //person_request[I].identif_number
         //������ ��������
         person_request[I].document:=CreateDocument;
      end;
      Result.request.person_request:=person_request;
   end;
   //������������� ������� �� ��������� ����� ����������������� �������
   if IdentifierCount>0 then begin
      SetLength(identif_request, IdentifierCount);
      for I:=0 to Pred(IdentifierCount) do begin
         //������ �� ��������� ������������������ ������
         identif_request[I]:=IdentifRequest.Create;
         //������������� �������
         identif_request[I].request_id:=CreateId;
         //���
         //identif_request[I].sex
         //���� ��������
         //identif_request[I].birth_day
      end;
      Result.request.identif_request:=identif_request;
   end;
end;

function TGisunInterface.CreateDocument: Document;
begin
   //��������, �������������� ��������
   Result:=Document.Create;
   //��� �������
   //Result.access
   //��� ���������
   //Result.document_type
   //���. �����, �������� ��������
   //Result.authority
   //���� ������ ���������
   //Result.date_of_issue
   //���� �������� ���������
   //Result.expire_date
   //����� ���������
   //Result.series
   //����� ���������
   //Result.number
   //���������� �� ������� ������
   //Result.act_data
   //������� ��������������� ���������
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
         Log.Add('����������� ������ �� ��������� ������ �� ��������:');
         Log.Add('');
         MessageCoverToLog(Log, registerRequest.cover);
         Log.Add('');
         Log.Add(Format('������ �� ��������� ������������ ������ person_request (%d):', [Length(registerRequest.request.person_request)]));
         for I:=Low(registerRequest.request.person_request) to High(registerRequest.request.person_request) do begin
            Log.Add('');
            Log.Add(Format('person_request/request_id     =%s', [registerRequest.request.person_request[I].request_id]));
            Log.Add(Format('person_request/identif_number =%s', [registerRequest.request.person_request[I].identif_number]));
            DocumenttoLog(Log, registerRequest.request.person_request[I].document, 'person_request/document/');
         end;
         Log.Add('');
         Log.Add(Format('������ �� ��������� ������ ������������������ ������  (%d):', [Length(registerRequest.request.identif_request)]));
         for I:=Low(registerRequest.request.identif_request) to High(registerRequest.request.identif_request) do begin
            Log.Add('');
            Log.Add(Format('identif_request/request_id =%s', [registerRequest.request.identif_request[I].request_id]));
            Log.Add(Format('identif_request/sex        =%s', [GetClassifierString(registerRequest.request.identif_request[I].sex)]));
            Log.Add(Format('identif_request/birth_day  =%s', [registerRequest.request.identif_request[I].birth_day]));
         end;
         registerResponse:=FService.getPersonalData(registerRequest);
         Log.Add('');
         Log.Add('������� �����:');
         Log.Add('');
         MessageCoverToLog(Log, registerResponse.cover);
         Log.Add('');
         Log.Add(Format('������ ������������ ������ personal_data (%d):', [Length(registerResponse.response.personal_data)]));
         for I:=Low(registerResponse.response.personal_data) to High(registerResponse.response.personal_data) do begin
            Log.Add('');
            Log.Add(Format('personal_data/request_id =%s', [registerResponse.response.personal_data[I].request_id]));
            PersonalDataToLog(Log, registerResponse.response.personal_data[I].data, 'personal_data/');
         end;
         Log.Add('');
         Log.Add(Format('������ ����������������� ������� identif_number (%d):', [Length(registerResponse.response.identif_number)]));
         for I:=Low(registerResponse.response.identif_number) to High(registerResponse.response.identif_number) do begin
            Log.Add('');
            Log.Add(Format('identif_number/request_id =%s', [registerResponse.response.identif_number[I].request_id]));
            Log.Add(Format('identif_number/data       =%s', [registerResponse.response.identif_number[I].data]));
         end;
         Result:=True;
      end
      else begin
         Log.Add('������: GetService=nil');
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
      Log.Add(Format('������ ������ error_list (%d):', [Length(error_list)]));
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
      Log.Add(Format('������ ������� addresses (%d):', [Length(Data.addresses)]));
      for I:=Low(Data.addresses) to High(Data.addresses) do begin
         Log.Add('');
         AddressToLog(Log, Data.addresses[I], Add+'addresses/');
      end;
      Log.Add(Format('������ ���������� documents (%d):', [Length(Data.documents)]));
      for I:=Low(Data.documents) to High(Data.documents) do begin
         Log.Add('');
         DocumenttoLog(Log, Data.documents[I], Add+'documents/');
      end;
      Log.Add(Format('������ ����������� ������ family (%d):', [Length(Data.family)]));
      for I:=Low(Data.family) to High(Data.family) do begin
         Log.Add('');
         FamilyToLog(Log, Data.family[I], Add+'family/');
      end;
      Log.Add(Format('������ ? deaths (%d):', [Length(Data.deaths)]));
      for I:=Low(Data.deaths) to High(Data.deaths) do begin
         Log.Add('');
         DeathToLog(Log, Data.deaths[I], Add+'deaths/');
      end;
      Log.Add(Format('������ ? citizenships (%d):', [Length(Data.citizenships)]));
      for I:=Low(Data.citizenships) to High(Data.citizenships) do begin
         Log.Add('');
         CitizenshipToLog(Log, Data.citizenships[I], Add+'citizenships/');
      end;
      Log.Add(Format('������ ? photos (%d):', [Length(Data.photos)]));
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
      Log.Add('!���������� WsException');
      Log.Add(Format('FaultActor  =%s', [WsException(E).FaultActor]));
      Log.Add(Format('FaultCode   =%s', [WsException(E).FaultCode]));
      Log.Add(Format('FaultDetail =%s', [WsException(E).FaultDetail]));
      Log.Add(Format('Message     =%s', [WsException(E).Message]));
      Log.Add(Format('ClassName   =%s', [WsException(E).ClassName]));
      MessageCoverToLog(Log, WsException(E).cover);
      ErrorListToLog(Log, WsException(E).error_list);
      //��������� ����������
      CopyErrorList(WsException(E).error_list);
   end
   else if E is ERemotableException then begin
      Log.Add('');
      Log.Add('!���������� ERemotableException');
      Log.Add(Format('FaultActor  =%s', [ERemotableException(E).FaultActor]));
      Log.Add(Format('FaultCode   =%s', [ERemotableException(E).FaultCode]));
      Log.Add(Format('FaultDetail =%s', [ERemotableException(E).FaultDetail]));
      Log.Add(Format('Message     =%s', [ERemotableException(E).Message]));
      Log.Add(Format('ClassName   =%s', [ERemotableException(E).ClassName]));

      //��������� ����������
      FFaultError:=ERemotableException(E).Message;
      FaultDetailToError(ERemotableException(E).FaultDetail, FFaultError);
   end
   //!!! ESOAPHTTPException
   else begin
      Log.Add('');
      Log.Add('!���������� Exception');
      Log.Add(Format('Message   =%s', [E.Message]));
      Log.Add(Format('ClassName =%s', [E.ClassName]));
      //��������� ����������
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
      then FError.AppendRecord(['--','����������� ������','','','',''])
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
      s1:=Utf8ToAnsi(XMLNodeErr.Name);   //  ����: 'ns2:error'
      j:=Pos(':error',s1);
      ss:=Copy(s1,1,j);  // ���� 'ns2:'
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
            s2:='������';
          end;
        end else begin
          s2:='������';
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
      if (strMessage<>'') and (s2='������') then begin
        s2:=strMessage;
      end;
      FError.AppendRecord([s1,s2,'',s3,'','']);
      {
      'ERROR_CODE',    Integer(ftString),    10,  //��� ������
      'ERROR_TEXT',    Integer(ftString),   250,  //����� ������
      'ERROR_PLACE',   Integer(ftString),   250,  //����� ������������� ������
      'WRONG_VALUE',   Integer(ftString),   250,  //������������ ��������
      'CORRECT_VALUE', Integer(ftString),   250,  //���������� ��������
      'CHECK_NAME',    Integer(ftString),   250   //�������� ������������ ��������
      }
    end;
  end else begin
    FError.AppendRecord(['--','����������� ������','','','','']);
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
