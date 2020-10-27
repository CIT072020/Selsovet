unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Types, EncdDecd, NativeXML,
  wsSMDOClassifA, wsSMDOClassifH, SOAPHTTPClient,  TypInfo,
  Dialogs, StdCtrls, ExtCtrls, Mask, InvokeRegistry, Rio, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, DBCtrlsEh;

type
  TForm1 = class(TForm)
    Debug: TMemo;
    cbOrg: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Timer: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    edUrl: TEdit;
    Label3: TLabel;
    edId: TMaskEdit;
    Button3: TButton;
    edDate: TEdit;
    HTTPRIO1: THTTPRIO;
    IdHTTP1: TIdHTTP;
    Button4: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    edDate1: TDBDateTimeEditEh;
    edDate2: TDBDateTimeEditEh;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
  private
    { Private declarations }
    RIO : THTTPRIO;
  public
    { Public declarations }
    FFull:Boolean;
    XMLResult:TNativeXML;
    DictServiceA : IActualDictionaryWebService;
    DictServiceH : IHistoryDictionaryWebService;
    FGuid:string;
    FStatus:String;
    FMessage:String;
    FTypeStep:Integer;
    function getValue(sNode:String):String;
    procedure RIOAfterExecute(const MethodName: string; SOAPResponse: TStream);
    procedure RIOBeforeExecute(const MethodName: string; var SOAPRequest: WideString);
  end;

var
  Form1: TForm1;

const
 CHARGE=1;
 RECEIVE=2;

implementation

{$R *.dfm}

const
  id_dict_org='bd3141f9-aed3-4f62-a74c-8a093a0b2ba9';
  id_dict_viddok='b774521b-c2db-44ea-8118-244cbc07ab00';
  my_ogr='61fb0fa8-432e-444f-b1a7-862b6f042514';
//  my_ogr='3c5d96c7-43a7-49d7-8a2f-cc703daf05bb';

function statusToStr(st:status):string;
begin
  Result:=GetEnumName(TypeInfo(status),Ord(st));
  {
  if st=OK then begin
    result:='OK';
  end else if st=FAIL then begin
    result:='FAIL';
  end else if st=PROCESS then begin
    result:='PROCESS';
  end; }
end;

function TForm1.getValue(sNode:String):String;
var
 s:String;
 begin
   try
     s:=XMLResult.Root.FindNode(sNode).ValueAsString;
   except
     s:='';
   end;
   Result:=sdUtf8ToAnsi(s); // Utf8ToAnsi(s);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  cd:chargeActualDictionary;
  cdr:chargeActualDictionaryResponse;
  cdh:chargeHistoryDictionary;
  cdrh:chargeHistoryDictionaryResponse;
  s:String;
  lErr:Boolean;
begin
  lErr:=true;
  Debug.Lines.Add(StringOfChar('-',50));
//  DictService:=GetIActualDictionaryWebService(true, '', RIO);
  if FFull then begin
    DictServiceA:=GetSMDOClassifAWs(edUrl.Text, '', RIO);
    if DictServiceA<>nil then begin
      cd:=chargeActualDictionary.Create;
      cd.companyId:=my_ogr; //edId.Text;
      cd.actualDate:='01.01.2001'; //Trim(edDate.Text); // FormatDateTime('yyyy-mm-dd',Date);
      if cbOrg.ItemIndex=0  then cd.dictionaryId:=id_dict_org  else cd.dictionaryId:=id_dict_viddok;
      Debug.Lines.Add('вызов chargeActualDictionary');
      lErr:=false;
      cdr:=nil;
      XMLResult.Clear;
      try
        FTypeStep:=CHARGE;
        cdr:=DictServiceA.chargeActualDictionary(cd);
      except
        on E:Exception do begin
          Debug.Lines.Add(E.Message);
          lErr:=true;
        end;
      end;
      cd.Free;
    end;
  end else begin
    DictServiceH:=GetSMDOClassifHWs(edUrl.Text, '', RIO);
    if DictServiceH<>nil then begin
      cdh:=chargeHistoryDictionary.Create;
      cdh.companyId:=my_ogr; //edId.Text;
      cdh.historyDateFrom:='01.01.2001';
      cdh.historyDateTo:='01.01.2001';
      if cbOrg.ItemIndex=0  then cdh.dictionaryId:=id_dict_org  else cdh.dictionaryId:=id_dict_viddok;
      Debug.Lines.Add('вызов chargeHistoryDictionary');
      lErr:=false;
      cdrh:=nil;
      XMLResult.Clear;
      try
        FTypeStep:=CHARGE;
        cdrh:=DictServiceH.chargeHistoryDictionary(cdh);
      except
        on E:Exception do begin
          Debug.Lines.Add(E.Message);
          lErr:=true;
        end;
      end;
      cdh.Free;
    end;
  end;
  if not lErr and not XMLResult.IsEmpty then begin //(cdr<>nil) then begin
    FStatus:=getValue('status');
    Debug.Lines.Add(FStatus);
    if ((FStatus='OK') or (FStatus='PROCESS')) then  begin
      FMessage:=getValue('message'); //'STATUS','');// cdr.message_;
      FGuid:=getValue('requestGuid');
//        FGuid:=cdr.requestGuid;
      edId.Text:=FGuid;
      Debug.Lines.Add(FGuid+' -> '+FMessage);
      Label3.Caption:=cbOrg.Items[cbOrg.itemindex];
      Label1.Caption:=FormatDateTime('hh:mm:ss',Now);
      if not Timer.Enabled
        then Timer.Enabled:=true;
//      cdr.Free;
    end;
  end else begin
    Debug.Lines.Add('result empty');
  end;
end;

//-----------------------------------------------------
Function StrToFile(aFile: String; Const Str: AnsiString): boolean;
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

procedure TForm1.Button2Click(Sender: TObject);
var
 rd:receiveActualDictionary;
 rdr:receiveActualDictionaryResponse;
 rdh:receiveHistoryDictionary;
 rdrh:receiveHistoryDictionaryResponse;
 data:TByteDynArray;
 s:string;
 n:Integer;
 lErr:Boolean;
begin
  XMLResult.Clear;
  if FGuid<>'' then begin
    lErr:=false;
    Debug.Lines.Add(StringOfChar('-',50));
    if FFull then begin
      DictServiceA:=GetSMDOClassifAWs(edUrl.Text, '', RIO);
      if (DictServiceA<>nil) and not lErr then begin
        Debug.Lines.Add('вызов receiveActualDictionary');
        rd:=receiveActualDictionary.Create;
        rd.requestGuid:=FGuid;
        lErr:=false;
        rdr:=nil;
        try
          FTypeStep:=RECEIVE;
          rdr:=DictServiceA.receiveActualDictionary(rd);
        except
          on E:Exception do begin
            Debug.Lines.Add(E.Message);
            lErr:=true;
          end;
        end;
        rd.Free;
      end;
    end else begin
      DictServiceH:=GetSMDOClassifHWs(edUrl.Text, '', RIO);
      if (DictServiceH<>nil) and not lErr then begin
        Debug.Lines.Add('вызов receiveHistoryDictionary');
        rdh:=receiveHistoryDictionary.Create;
        rdh.requestGuid:=FGuid;
        lErr:=false;
        rdrh:=nil;
        try
          FTypeStep:=RECEIVE;
          rdrh:=DictServiceH.receiveHistoryDictionary(rdh);
        except
          on E:Exception do begin
            Debug.Lines.Add(E.Message);
            lErr:=true;
          end;
        end;
        rdh.Free;
      end;
    end;
    if not lErr and not XMLResult.IsEmpty then begin //(rdr<>nil) then begin
      FStatus:=getValue('status');
      FMessage:=getValue('message'); //'STATUS','');// cdr.message_;
      Debug.Lines.Add(FStatus+' '+FMessage);
      if (FStatus='OK') then  begin
        s:=getValue('dictionaryData');
//        s:=rdr.message_;
//        Debug.Lines.Add(rdr.requestGuid+'->  '+statustostr(rdr.status)+' '+s);
//        if rdr.status=OK then begin
//          Debug.Lines.Add('dictionaryData='+inttostr(Length(rdr.dictionaryData)));
        Debug.Lines.Add('dictionaryData='+s);
//          data:=rdr.dictionaryData;
//          n:=Length(data);
//          SetLength(s,n);
  //        binaryData: TByteDynArray;   Data: String;
  //        Move(PChar(Data)^, PByte(binaryData)^, Length(binaryData));
  //        Move(Data[1], binaryData[0], Length(Data) * sizeof(Char));
//          Move(data[0], s[1], n);
        if FFull then begin
          StrToFile('data_base64',s);
          StrToFile('data_spr.zip',DecodeString(s));
        end else begin
          StrToFile('datah_base64',s);
          StrToFile('datah_spr.zip',DecodeString(s));
        end;
        Debug.Lines.Add('dictionaryData=OK');
      end;
    end;
      rdr.Free;
  end else begin

  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
//var
//  binaryData: TByteDynArray;
//  i:Integer;
//  Data: String;
begin
  XMLResult:=TNativeXML.Create;
  debug.Lines.Clear;
  FGuid:=edID.Text;
  FFull:=true;
  RIO:=THTTPRIO.Create(nil);
  RIO.OnAfterExecute:=RIOAfterExecute;
  RIO.OnBeforeExecute:=RIOBeforeExecute;
  {
  setlength(binaryData,20);
  for i:=0 to Length(binaryData)-1 do begin
    binaryData[i]:=Byte(chr(i+49));
  end;
  setlength(data,length(binaryData));
//  Move(PByte(binaryData)^, PChar(Data)^, Length(binaryData));
  Move(binaryData[0], Data[1], Length(Data) * sizeof(Char));
  ShowMessage('"'+data+'"');  }
end;

procedure TForm1.TimerTimer(Sender: TObject);
begin
  Label2.Caption:=FormatDateTime('hh:mm:ss',Now);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  XMLResult.Free;
//  RIO.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Debug.Lines.SaveToFile('debug.txt');
//  IdHTTP1.Post();
end;

procedure TForm1.RIOAfterExecute(const MethodName: string;  SOAPResponse: TStream);
var
  s:WideString;
  ss:String;
  fs:TStringStream;
begin
   //вывод текста запроса
   XMLResult.Clear;
//   XMLDoc:=TNativeXML.Create;
//   try
   fs:=TStringStream.Create('');
   fs.CopyFrom(SOAPResponse, 0);
   XMLResult.ReadFromString(fs.DataString);
   fs.Free;
  //    XMLResult.LoadFromStream(SOAPResponse);
   XMLResult.VersionString:='1.0';
   XMLResult.EncodingString:='UTF-8';
//      XMLResult.ExternalEncoding:=seUTF8;
//      s:=XMLResult.Root.FindNode('message').ValueAsUnicodeString;
//      ss:=XMLResult.Root.FindNode('message').ValueAsUnicodeString;
//      ShowMessage('str='+WideCharToString(PWideChar(s)));
   XMLResult.SaveToFile(ExtractFilePath(Application.ExeName)+'SOAPResponse.xml');
//      XMLResult.LoadFromFile(ExtractFilePath(Application.ExeName)+'SOAPResponse.xml');
//   finally
//      XMLDoc.Free;
//   end;
end;
//---------------------------------------------------------------------------------------
procedure TForm1.RIOBeforeExecute(const MethodName: string;  var SOAPRequest: WideString);
var
   XMLDoc:TNativeXML;
   S: Utf8String;
   lNodes:TList;
   node:TXMLNode;
   ss:String;
begin
//   lNodes:=TList.Create;
   S:=Utf8Encode(SOAPRequest);
   StrToFile(ExtractFilePath(Application.ExeName)+'SOAPRequest.xml', S);
   XMLDoc:=TNativeXML.Create;
   XMLDoc.XmlFormat:=xfReadable;
   if FTypeStep=CHARGE then begin
     if FFull
       then XMLDoc.LoadFromFile('chargeActualDictionary.xml')
       else XMLDoc.LoadFromFile('chargeHistoryDictionary.xml');
     node:=XMLDoc.Root.FindNode('companyId');
     if node<>nil then node.ValueAsString:=my_ogr;
     node:=XMLDoc.Root.FindNode('dictionaryId');
     if node<>nil then if cbOrg.ItemIndex=0 then node.ValueAsString:=id_dict_org else node.ValueAsString:=id_dict_viddok;
     if FFull then begin
       node:=XMLDoc.Root.FindNode('actualDate');
       if node<>nil then node.ValueAsString:=FormatDateTime('dd.mm.yyyy', Date);
     end else begin
       node:=XMLDoc.Root.FindNode('historyDateFrom');
       if node<>nil then node.ValueAsString:=FormatDateTime('dd.mm.yyyy', edDate1.Value);
       node:=XMLDoc.Root.FindNode('historyDateTo');
       if node<>nil then node.ValueAsString:=FormatDateTime('dd.mm.yyyy', edDate2.Value);
      end;
   end else begin
     if FFull
       then XMLDoc.LoadFromFile('receiveActualDictionary.xml')
       else XMLDoc.LoadFromFile('receiveHistoryDictionary.xml');
     node:=XMLDoc.Root.FindNode('requestGuid');
     if node<>nil then node.ValueAsString:=FGuid;
   end;
   SOAPRequest:=UTF8Decode(XMLDoc.WriteToString);
   S:=Utf8Encode(SOAPRequest);
   StrToFile(ExtractFilePath(Application.ExeName)+'SOAPRequest_new.xml', S);
   XMLDoc.Free;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Timer.Enabled:=false;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
 FFull:=true;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
 FFull:=false;
end;

end.
