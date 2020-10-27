unit mRegInt;
interface
uses
   Windows, Classes, SysUtils, Graphics, ActiveX, DB, Forms, ImgList, Controls,
   Dialogs, StdCtrls, ExtCtrls, ShellApi, ComObj, Messages, TypInfo,
   kbmMemTable, mZags, wsZags, mGisun, wsGisun, XSBuiltIns;

type
   //��������� ���������� �������������� � ��������� ���������
   TRequestResult=(
      //�� ���������� �������������� � ��������� ��������� �������������� ������
      //��� ������ ���������� ���� ��������� (��������, �� ������� ������)
      rrBeforeError,
      //��������� ����� ������� � ��������� � ��� ���� ������� �� ������ ������
      rrOk,
      //��������� ����� ������ � ���������, �� ������� ������ ������
      rrError,
      //����� ������ ������� � ��������� ��������� �������������� ������
      //��� ������ ���������� ���� ��������� (��������, � ���������� �� �������� ������)
      rrAfterError,
      //�� ��������� �������������� � ��������� � ���������� ������-���� ����
      //��� ���������� �����
      rrFault
   );

   //���� ������� �������/�������� � ��������
   TActKind=(
      //������ �� ��������� ������������ ������
      akGetPersonalData,
      //������� ������ � ��������
      akBirth,
      //������� ������ �� ������������ ���������
      akAffiliation,
      //������� ������ � ���������� �����
      akMarriage,
      //������� ������ � ������
      akDecease,
      //������� ������ � ����������� �����
      akDivorce,
      //������� ������ �� ����������� (����������)
      akAdoption,
      //������� ������ � �������� �����
      akNameChange
   );

const
   //���� ��������� (MessageCover.message_type)
   CMessageType: array [TActKind] of string=(
      //??? !!! ���������� �� ����� ���
      '0001',   //������ �� ��������� ������������ ������ (akGetPersonalData)
      '0100',   //������� ������ � �������� (akBirth)
      '0200',   //������� ������ �� ������������ ��������� (akAffiliation)
      '0300',   //������� ������ � ���������� ����� (akMarriage)
      '0400',   //������� ������ � ������ (akDecease)
      '0500',   //������� ������ � ����������� ����� (akDivorce)
      '0600',   //������� ������ �� ����������� (����������) (akAdoption)
      '0700'    //������� ������ � �������� ����� (akNameChange)
   );

type
   //���� �������� �� ������ ������� � ���������
   TOperation=(
      //��������� ������
      opGet,
      //�������� ������
      opPost
   );

   TRegField=class(TObject)
   private
      FName: string;
      FDataType: TFieldType;
      FSize: Integer;
      FComm: string;
      FGrupComm: string;
      FPath: string;
   public
      constructor Create;
      destructor Destroy; override;
   public
      property Name: string read FName write FName;
      property DataType: TFieldType read FDataType write FDataType;
      property Size: Integer read FSize write FSize;
      property Comm: string read FComm write FComm;
      property GrupComm: string read FGrupComm write FGrupComm;
      property Path: string read FPath write FPath;
   end;

   TRegFieldList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TRegField;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TRegField): Integer;
      function AddNew: TRegField;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TRegField read GetItem; default;
   end;

   TRegTable=class(TObject)
   private
      FComm: string;
      FIsInput: Boolean;
      FActKind: TActKind;
      FOperation: TOperation;
      FFieldList: TRegFieldList;
   public
      constructor Create;
      destructor Destroy; override;
      function CreateMemTable: TDataSet;
      function SetProp(Root: TObject; DataSet: TDataSet): Boolean;
      function GetProp(Root: TObject; DataSet: TDataSet): Boolean;
   public
      property FieldList: TRegFieldList read FFieldList;
      property Comm: string read FComm write FComm;
      property IsInput: Boolean read FIsInput write FIsInput;
      property ActKind: TActKind read FActKind write FActKind;
      property Operation: TOperation read FOperation write FOperation;
   end;

   TRegTableList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TRegTable;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TRegTable): Integer;
      function AddNew: TRegTable;
      function Find(IsInput: Boolean; ActKind: TActKind; Operation: TOperation): TRegTable;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TRegTable read GetItem; default;
   end;

   //��������� ��� ������ � ��������� ���������
   TRegInt=class(TObject)
   private
      //������ ��� �������� ���������� � �������
      FZags: TZagsInterface;
      //������ ��� ��������� ���������� �� ��������
      FGisun: TGisunInterface;
      //����� ���� ��� ����� ��� ���������� ������ �������������� � ���������
      FFaultError: string;
      //������������� ���������� ��������� ������� ������ �� ��������
      FRequestMessageId: string;
      //���������:
      //����� �����/�������� ��������� - ������ ������������� ���������� ���������
      //(!) ���� �������� �� ����� ���������� ������
      FMessageSource: string;
      //����� ���-������� ��� �������� ���������� � ������� �� �����
      //�� ��������� http://agat-system.by:4569/gisun/zags/ws
      FZagsUrl: string;
      FZagsProxy: string;
      //����� ���-������� ��� ������ ���������� �� ��������
      //�� ��������� http://agat-system.by:4569/gisun/common/ws
      FGisunUrl: string;
      FGisunProxy: string;
      //������ ���� ����������� ��� ������ ������� � ���������
      //�� ��������� yyyymmdd
      //FDateFormat: string;
      //��������� ����:
      FLog: TStringList;
      //������ ������ ������������ ��� ������ ������� � ���������
      FTableList: TRegTableList;
      FPostIsUpper: Boolean;
      FVersion: Integer;
      procedure SetPostIsUpper(const Value: Boolean);
      procedure SetVersion(const Value: Integer);
   private
      //
      function CreateOutputTable(ActKind: TActKind): TDataSet;
      //
      //function FormatDate(DateTime: TDateTime): string;
      procedure SetMessageSource(Value: string);
      procedure SetZagsUrl(Value: string);
      procedure SetZagsProxy(const Value: string);
      procedure SetGisunUrl(Value: string);
      procedure SetGisunProxy(const Value: string);
      //function StringToDate(DateTime: string): TDateTime;
      //procedure PersonalDataToDataSet(Prefix: string; personal_data: wsGisun.ResponsePerson; DataSet: TDataSet);
      //procedure DataSetToPersonalData(Prefix: string; personal_data: wsZags.PersonalData; DataSet: TDataSet);
      //procedure DataSetToActData(Prefix: string; act_data: wsZags.ActData; DataSet: TDataSet);
      //procedure DataSetToDocument(Prefix: string; doc: wsZags.Document; DataSet: TDataSet);
   public
      constructor Create(MessageSource: string);
      destructor Destroy; override;
      //������� ������ ��������������, ����������� ��� �������� ������, ������������
      //��� ������ ������� Get � Post
      //��� ������� ���������� ����������� ������� �� ������� ������ �������
      //CreateInputTable � CreateOutputTable
      //������� ���������:
      //InputFile   - ������ ���� � �����
      //OutputFile  - ������ ���� � �����
      //�������� ���������:
      //True        -
      //False       -
      function ReadMetaInfo(InputFile, OutputFile: string): Boolean;
      //������� ������ ������ �������, ������� ������ ��������� ���������� ���������
      //����� ��� ��� ��������� ������ ������ �� �������� � ������� ������� Get
      //������� ���������:
      //ActKind - ��� ������� ������, ��� ������� ��������� �������� ������ �� ��������
      //          ���������
      //Operation -
      //�������� ���������:
      //Input   - ����� ������ ������������ � �������. ��������� ���� �������
      //          ������� �� ���� ������� ������. ����� �������� ������� �����������.
      function CreateInputTable(ActKind: TActKind; Operation: TOperation): TDataSet;
      //������� ��� ��������� ������ �� �������� ���������
      //������� ���������:
      //ActKind - ��� ������� ������, ��� ������� ��������� �������� ������ �� ��������
      //          ���������
      //MessageType - ��� ��������� (��� ���� �������� ������ ����) <nnnn>
      //              �� ������ ������ ����� ���������� ������
      //Input   - ����� ������ ������������ � �������. ��������� ���� �������
      //          ������� �� ���� ������� ������. ��� ������� ��������, �����������
      //          � ������������ ���������� ����������. ��� �������� ������� ����������
      //          ������������ ������� CreateInputTable. �� ������ ������ �������
      //          Get ������� ������ ���� ������� � ������ ��������� �� ������ ������.
      //�������� ���������:
      //Output  - ����� ������ ���������� �� ��������. ��������� ���� �������
      //          ������� �� ���� ������� ������. ��� ������� �������� � �����������
      //          �������� Get. ���������� ��������� ������ ���������� ���������. ��
      //          ������ ������ �� ������� Get ������� ������ ���� ������� � ������
      //          ��������� �� ������ ������. ������� �������� ��������
      //          Get, ������ ��� �������� ��������� ������ �� ��������, �����
      //          ������������ nil.
      //Error   - ������ ������ ������������ ���������. ��� ������� �������� � �����������
      //          �������� Get. ���������� ��������� ������ ���������� ���������. ��
      //          ������ ������ �� ������� Get ������� ������ ���� ������� � ������
      //          ��������� �� ������ ������.������� �������� ��������
      //          Get, ������ ��� ������� ������, ����� ������������ nil.
      //��������� �������:
      //rrFault       - �� ��������� �������������� � ��������� � ���������� ������-����
      //                ���� ��� ���������� �����. �������� ��������� Output � Error �����
      //                nil. ����� ������ �������� ���� FaultError
      //rrBeforeError - � ������ ������ ���������� rrFault
      //rrOk          - ��������� ����� ������� � ��������� � ��� ���� ������� �� ������
      //                ������. �������� �������� Output �������� ���������� ������,
      //                � Error ����� nil
      //rrError       - ��������� ����� ������ � ���������, �� ������� ������ ������
      //                �������� �������� Output �������� ���������� ������, � Error
      //                �������� ������ ������, ������� ������ �������.
      //rrAfterError  - ����� ������ ������� � ��������� ��������� �������������� ������
      //                ��� ������ ���������� ���� ��������� (��������, � ���������� ��
      //                �������� ������). �������� �������� Output �������� ����������
      //                ������, Error ����� nil, FaultError �������� ����� ������
      function Get(ActKind: TActKind; MessageType: string; const Input: TDataSet; var Output, Error: TDataSet): TRequestResult;
      //
      function Post(RequestMessageId: string; ActKind: TActKind; MessageType: string; const Input: TDataSet; var Error: TDataSet): TRequestResult;
      procedure DataSetAllFieldUpper(ds:TDataSet);
   public
      property FaultError: string read FFaultError;
      property RequestMessageId: string read FRequestMessageId;
      //���������:
      property MessageSource: string read FMessageSource write SetMessageSource;
      property ZagsUrl: string read FZagsUrl write SetZagsUrl;
      property ZagsProxy: string read FZagsProxy write SetZagsProxy;
      property GisunUrl: string read FGisunUrl write SetGisunUrl;
      property GisunProxy: string read FGisunProxy write SetGisunProxy;
      property PostIsUpper:Boolean read FPostIsUpper write SetPostIsUpper;
      property Version:Integer read FVersion write SetVersion;
      //property DateFormat: string read FDateFormat write FDateFormat;
      //������
      property Log: TStringList read FLog;
      //
      property TableList: TRegTableList read FTableList;
   end;

{ ������ � ��������� }

function CreateMemTable(FieldList: array of const; AutoCreate, AutoOpen: Boolean): TkbmMemTable;
procedure CreateAndCopyMemTable(Src: TDataSet; Dst: TkbmMemTable);
function CreateErrorTable: TDataSet;

implementation


{ ������ � ��������� }

function CreateMemTable(FieldList: array of const; AutoCreate, AutoOpen: Boolean): TkbmMemTable;
var
   I: Integer;
   FieldName: string;
   FieldType: TFieldType;
   FieldSize: Integer;
   FieldDef: TFieldDef;

   function GetString(var VarRec: TVarRec): string;
   begin
      case VarRec.VType of
         vtAnsiString: Result:=VarRec.VPChar;
         vtChar: Result:=VarRec.VChar;
      else
         Result:='';
      end;
   end;

begin
   Result:=nil;
   if Length(FieldList) mod 3=0 then begin
      Result:=TkbmMemTable.Create(nil);
      for I:=Low(FieldList) to High(FieldList) div 3 do begin
         FieldName:=GetString(FieldList[I*3]);
         FieldType:=TFieldType(FieldList[I*3+1].VInteger);
         FieldSize:=FieldList[I*3+2].VInteger;
         FieldDef:=Result.FieldDefs.AddFieldDef;
         FieldDef.Name:=FieldName;
         FieldDef.DataType:=FieldType;
         if FieldType<>ftBoolean then begin
            FieldDef.Size:=FieldSize;
         end;
      end;
      if AutoCreate then begin
         Result.CreateTable;
         if AutoOpen then begin
            Result.Open;
         end;
      end;
   end;
end;

procedure CreateAndCopyMemTable(Src: TDataSet; Dst: TkbmMemTable);
var
   I: Integer;
   Field: TField;
   FieldDef: TFieldDef;
begin
   Dst.FieldDefs.Clear;
   for I:=0 to Pred(Src.Fields.Count) do begin
      Field:=Src.Fields[I];
      FieldDef:=Dst.FieldDefs.AddFieldDef;
      FieldDef.Name:=Field.FieldName;
      FieldDef.DataType:=Field.DataType;
      FieldDef.Size:=Field.Size;
      if Field is TFloatField then begin
         FieldDef.Precision:=TFloatField(Field).Precision;
      end;
   end;
   Dst.CreateTable;
   Dst.Open;
   Src.First;
   while not Src.Eof do begin
      Dst.Append;
      for I:=0 to Pred(Src.Fields.Count) do begin
         Dst.Fields[I].AsString:=Src.Fields[I].AsString;
      end;
      Dst.Post;
      Src.Next;
   end;
end;

function CreateErrorTable: TDataSet;
begin
   //???���������
   Result:=CreateMemTable([
      'ERROR_CODE',    Integer(ftString),    10,  //��� ������
      'ERROR_TEXT',    Integer(ftString),   250,  //����� ������
      'ERROR_PLACE',   Integer(ftString),   250,  //����� ������������� ������
      'WRONG_VALUE',   Integer(ftString),   250,  //������������ ��������
      'CORRECT_VALUE', Integer(ftString),   250,  //���������� ��������
      'CHECK_NAME',    Integer(ftString),   250   //�������� ������������ ��������
   ], True, True);
end;

{ TRegInt }

constructor TRegInt.Create(MessageSource: string);
const
   CDefaultZagsUrl='http://agat-system.by:4569/gisun/zags/ws';
   CDefaultGisunUrl='http://agat-system.by:4569/gisun/common/ws';
begin
   FVersion:=1;
   FPostIsUpper:=false;
   FTableList:=TRegTableList.Create;
   FLog:=TStringList.Create;
   FZags:=TZagsInterface.Create;
   FGisun:=TGisunInterface.Create;
   SetMessageSource(MessageSource);
   SetZagsUrl(CDefaultZagsUrl);
   SetGisunUrl(CDefaultGisunUrl);
   //FDateFormat:='yyyymmdd';
   //�������� ������ ����������
   Assert(MessageSource<>'', '����� TRegInt.Create. �� ���������� �������� MessageSource');
end;

//--------------------------------------------------------------------------
procedure TRegInt.DataSetAllFieldUpper(ds:TDataSet);
var
  i:Integer;
begin
  if (ds<>nil) and FPostIsUpper then begin
    ds.Edit;
    for i:=0 to ds.FieldCount-1 do begin
      if ds.Fields[i].DataType=ftString then begin
        ds.Fields[i].AsString:=ANSIUpperCase(ds.Fields[i].AsString);
      end;
    end;
    ds.Post;
  end;
end;

function TRegInt.CreateInputTable(ActKind: TActKind; Operation: TOperation): TDataSet;
var
   Table: TRegTable;
begin
   Result:=nil;
   Table:=FTableList.Find(True, ActKind, Operation);
   if Operation=opGet then begin
      Table:=FTableList.Find(True, akGetPersonalData, Operation);
   end;
   if Table<>nil then begin
      Result:=Table.CreateMemTable;
   end;
end;

function TRegInt.CreateOutputTable(ActKind: TActKind): TDataSet;
var
   Table: TRegTable;
begin
   Result:=nil;
   Table:=FTableList.Find(False, ActKind, opGet);
   if Table<>nil then begin
      Result:=Table.CreateMemTable;
   end;
end;

{
procedure TRegInt.DataSetToActData(Prefix: string; act_data: wsZags.ActData; DataSet: TDataSet);
begin
   //���������� �� ������� ������
   //1. ��� ������� ������
   act_data.act_type:=FZags.CreateClassifier(DataSet.FieldByName(Prefix+'TIP').AsString, ctActType);
   //2. ���. �����, ������������� ������� ������
   act_data.authority:=FZags.CreateClassifier(DataSet.FieldByName(Prefix+'ORGAN').AsString, ctZags);
   //3. ���� ������� ������
   act_data.date:=FZags.CreateDate(DataSet.FieldByName(Prefix+'DATE').AsDateTime);
   //4. ����� ������� ������
   act_data.number:=DataSet.FieldByName(Prefix+'NOMER').AsString;
end;
}
{
procedure TRegInt.DataSetToDocument(Prefix: string; doc: wsZags.Document; DataSet: TDataSet);
begin
   //��������
   //6.1. ��� ���������
   doc.document_type:=FZags.CreateClassifier(DataSet.FieldByName(Prefix+'TIP').AsString, ctDocType);
   //6.2. ���. �����, �������� ��������
   doc.authority:=FZags.CreateClassifier(DataSet.FieldByName(Prefix+'ORGAN').AsString, ctZags);
   //6.3. ���� ������
   doc.date_of_issue:=FZags.CreateDate(DataSet.FieldByName(Prefix+'DATE').AsDateTime);
   //6.4. ���� �������� ���������
   //doc.expire_date
   //6.5. ����� ���������
   doc.series:=DataSet.FieldByName(Prefix+'SERIA').AsString;
   //6.6. ����� ���������
   doc.number:=DataSet.FieldByName(Prefix+'NOMER').AsString;
end;
}
{
procedure TRegInt.DataSetToPersonalData(Prefix: string; personal_data: wsZags.PersonalData; DataSet: TDataSet);
begin
   //������������ ������
   //1. ������������ �����
   personal_data.identif:=DataSet.FieldByName(Prefix+'IDENTIF').AsString;
   //2. ������� �� ������� �����
   personal_data.last_name:=DataSet.FieldByName(Prefix+'FAMILIA').AsString;
   //3. ������� �� ����������� �����
   personal_data.last_name_bel:=DataSet.FieldByName(Prefix+'FAMILIA_B').AsString;
   //4. ������� ���������
   //personal_data.last_name_lat
   //5. ��� �� ������� �����
   personal_data.name_:=DataSet.FieldByName(Prefix+'NAME').AsString;
   //6. ��� �� ����������� �����
   personal_data.name_bel:=DataSet.FieldByName(Prefix+'NAME_B').AsString;
   //7. ��� ���������
   //personal_data.name_lat
   //8. �������� �� ������� �����
   personal_data.patronymic:=DataSet.FieldByName(Prefix+'OTCH').AsString;
   //9. �������� �� ����������� �����
   personal_data.patronymic_bel:=DataSet.FieldByName(Prefix+'OTCH_B').AsString;
   //10. �������� ���������
   //personal_data.patronymic_lat
   //11. ���
   personal_data.sex:=FZags.CreateClassifier(DataSet.FieldByName(Prefix+'POL').AsString, ctPol);
   //12. ���� ��������
   personal_data.birth_day:=DataSet.FieldByName(Prefix+'DATER').AsString;//FormatDate(DataSet.FieldByName(Prefix+'DATER').AsDateTime);
   //13. ����� ��������
   //13.1. ������ ��������
   //personal_data.birth_place.country_b
   //13.2. ������� ��������
   //personal_data.birth_place.area_b
   //13.3. ������� �������� �� ����������� �����
   //personal_data.birth_place.area_b_bel
   //13.4. ����� ��������
   //personal_data.birth_place.region_b
   //13.5. ����� �������� �� ����������� �����
   //personal_data.birth_place.region_b_bel
   //13.6. ��� ���������� ������
   //personal_data.birth_place.type_city_b
   //13.7. ��������� ����� �� ������� �����
   //personal_data.birth_place.city_b
   //13.8. ��������� ����� �� ����������� �����
   //personal_data.birth_place.city_b_bel
   //14. �����������
   personal_data.citizenship:=FZags.CreateClassifier(DataSet.FieldByName(Prefix+'GRAJD').AsString, ctCountry);
   //15. ������
   personal_data.status:=FZags.CreateClassifier(DataSet.FieldByName(Prefix+'STATUS').AsString, ctStatus);
   //16. ������ �������
   //personal_data.addresses
   //17. ������ ����������
   //personal_data.documents
   //18. ������ �������� ������
   //personal_data.family
end;
}
destructor TRegInt.Destroy;
begin
   FZags.Free;
   FGisun.Free;
   FLog.Free;
   FTableList.Free;
   inherited;
end;

{
function TRegInt.FormatDate(DateTime: TDateTime): string;
begin
   Result:=FormatDateTime(FDateFormat, DateTime);
end;
}

function TRegInt.Get(ActKind: TActKind; MessageType: string; const Input: TDataSet; var Output, Error: TDataSet): TRequestResult;
var
   registerRequest: wsGisun.register_request;
   registerResponse: wsGisun.register_response;
   Person: wsGisun.ResponsePerson;
   Identif: wsGisun.ResponseIdentif;
   PersonCount: Integer;
   IdentifierCount: Integer;
   PersonInd: Integer;
   IdentifierInd: Integer;
   Table: TRegTable;
   Temp: TkbmMemTable;

   function FindPersonData(request_id: wsGisun.Id; personal_data: wsGisun.Array_Of_ResponsePerson): wsGisun.ResponsePerson;
   var
      I: Integer;
   begin
      Result:=nil;
      for I:=Low(personal_data) to High(personal_data) do begin
         if CompareText(personal_data[I].request_id, request_id)=0 then begin
            Result:=personal_data[I];
            Break;
         end;
      end;
   end;

   function FindResponseIdentif(request_id: wsGisun.Id; identif_number: wsGisun.Array_Of_ResponseIdentif): wsGisun.ResponseIdentif;
   var
      I: Integer;
   begin
      Result:=nil;
      for I:=Low(identif_number) to High(identif_number) do begin
         if CompareText(identif_number[I].request_id, request_id)=0 then begin
            Result:=identif_number[I];
            Break;
         end;
      end;
   end;

begin
   FLog.Clear;
   Output:=nil;
   Error:=nil;
   FRequestMessageId:='';
   FFaultError:='';
   if MessageType='' then begin
      MessageType:=CMessageType[ActKind];
   end;
   Result:=rrFault;
   case ActKind of
      //������ �� ��������� ������������ ������
      akGetPersonalData,
      //������� ������ � ��������
      akBirth,
      //������ - CHILD
      //����    - ON
      //����    - ONA
      //������� ������ �� ������������ ���������
      akAffiliation,
      //1. ������ - CHILD
      //2. ����    - ON
      //3. ����    - ONA
      //������� ������ � ���������� �����
      akMarriage,
      //1. �����   - ON
      //2. ������� - ONA
      //������� ������ � ������
      akDecease,
      //������ �� �������
      //������� ������ � ����������� �����
      akDivorce,
      //����  - ONA
      //���   - ON
      //������� ������ �� ����������� (����������)
      akAdoption,
      //������         - CHILD
      //����            - ONA
      //����            - ON
      //��������������� - ONA2
      //�����������     - ON2
      //������� ������ � �������� �����
      akNameChange
      //������������ ������ ����
      : begin
         //������� ���������� �������� ��������������� � ������������ ������
         PersonCount:=0;
         IdentifierCount:=0;
         Input.First;
         while not Input.Eof do begin
            if Input.FieldByName('IS_PERSON').AsBoolean then begin
               Inc(PersonCount);
            end
            else begin
               Inc(IdentifierCount);
            end;
            Input.Next;
         end;
         registerRequest:=FGisun.CreateRegisterRequest(MessageType, PersonCount, IdentifierCount);
         FRequestMessageId:=registerRequest.cover.message_id;
         //
         Table:=FTableList.Find(True, akGetPersonalData, opGet);
         PersonInd:=0;
         IdentifierInd:=0;
         Input.First;
         while not Input.Eof do begin
            if Input.FieldByName('IS_PERSON').AsBoolean then begin
               Input.Edit;
               Input.FieldByName('REQUEST_ID').AsString:=registerRequest.request.person_request[PersonInd].request_id;
               Input.Post;
               if Table<>nil then begin
                  Table.SetProp(registerRequest.request.person_request[PersonInd], Input)
               end;
               Inc(PersonInd);
            end
            else begin
               Input.Edit;
               Input.FieldByName('REQUEST_ID').AsString:=registerRequest.request.identif_request[IdentifierInd].request_id;
               Input.Post;
               if Table<>nil then begin
                  Table.SetProp(registerRequest.request.identif_request[IdentifierInd], Input)
               end;
               Inc(IdentifierInd);
            end;
            Input.Next;
         end;
         registerResponse:=nil;
         try
            if FGisun.GetPersonalData(registerRequest, registerResponse, FLog) then begin
               Result:=rrOk;
               Output:=CreateOutputTable(akGetPersonalData); //akGetPersonalData
               //��������� ��������� ���������
               if registerResponse.cover.parent_message_id<>FRequestMessageId then begin
                  Result:=rrAfterError;
                  FFaultError:='������ ������ � ���������. �� ��������� �������������� ��������� ������� � ������.';
                  FLog.Add('!������: �� ��������� �������������� ���������')
               end;
               //
               Table:=FTableList.Find(False, akGetPersonalData, opGet);
               Input.First;
               while not Input.Eof do begin
                  if Input.FieldByName('IS_PERSON').AsBoolean then begin
                     Person:=FindPersonData(Input.FieldByName('REQUEST_ID').AsString, registerResponse.response.personal_data);
                     //������������ ������
                     if Person<>nil then begin
                        Output.Append;
                        Output.FieldByName('IS_PERSON').AsBoolean:=Input.FieldByName('IS_PERSON').AsBoolean;
                        Output.FieldByName('PREFIX').AsString:=Input.FieldByName('PREFIX').AsString;
                        if Table<>nil then begin
                           Table.GetProp(Person, Output)
                        end;
                        Output.Post;
                     end
                     else begin
                        Result:=rrAfterError;
                        FFaultError:='������ ������ � ���������. �� ������ ������������� ������� ������������ ������.';
                        FLog.Add('!������: �� ��������� �������������� �������� ������������ ������')
                     end;
                  end
                  else begin
                     Identif:=FindResponseIdentif(Input.FieldByName('REQUEST_ID').AsString, registerResponse.response.identif_number);
                     //������������ ������
                     if Identif<>nil then begin
                        Output.Append;
                        Output.FieldByName('IS_PERSON').AsBoolean:=Input.FieldByName('IS_PERSON').AsBoolean;
                        Output.FieldByName('PREFIX').AsString:=Input.FieldByName('PREFIX').AsString;
                        if Table<>nil then begin
                           Table.GetProp(Identif, Output)
                        end;
                        Output.Post;
                     end
                     else begin
                        Result:=rrAfterError;
                        FFaultError:='������ ������ � ���������. �� ������ ������������� ������� ������� ������.';
                        FLog.Add('!������: �� ��������� �������������� �������� ������� ������')
                     end;
                  end;
                  Input.Next;
               end;
            end
            else begin
               Result:=rrFault;
               Temp:=TkbmMemTable.Create(nil);
               CreateAndCopyMemTable(FGisun.Error, Temp);
               Error:=TDataSet(Temp);
               FFaultError:=FGisun.FaultError;
            end;
         finally
            registerRequest.Free;
            registerResponse.Free;
         end;
      end;
   end;
end;

{
procedure TRegInt.PersonalDataToDataSet(Prefix: string; personal_data: ResponsePerson; DataSet: TDataSet);
begin
   //������������ �����
   DataSet.FieldByName(Prefix+'IDENTIF').AsString:=personal_data.data.identif;
   //������� �� ������� �����
   DataSet.FieldByName(Prefix+'FAMILIA').AsString:=personal_data.data.last_name;
   //������� �� ����������� �����
   DataSet.FieldByName(Prefix+'FAMILIA_B').AsString:=personal_data.data.last_name_bel;
   //��� �� ������� �����
   DataSet.FieldByName(Prefix+'NAME').AsString:=personal_data.data.name_;
   //��� �� ����������� �����
   DataSet.FieldByName(Prefix+'NAME_B').AsString:=personal_data.data.name_bel;
   //�������� �� ������� �����
   DataSet.FieldByName(Prefix+'OTCH').AsString:=personal_data.data.patronymic;
   //�������� �� ����������� �����
   DataSet.FieldByName(Prefix+'OTCH_B').AsString:=personal_data.data.patronymic_bel;
   //���
   DataSet.FieldByName(Prefix+'POL').AsString:=personal_data.data.sex.code;
   //���� ��������
   DataSet.FieldByName(Prefix+'DATER').AsString:=personal_data.data.birth_day;//.AsDateTime:=StringToDate(personal_data.data.birth_day);
   //�����������
   DataSet.FieldByName(Prefix+'GRAJD').AsString:=personal_data.data.citizenship.code;
   //������
   DataSet.FieldByName(Prefix+'STATUS').AsString:=personal_data.data.status.code;
end;
}

function TRegInt.Post(RequestMessageId: string; ActKind: TActKind; MessageType: string; const Input: TDataSet; var Error: TDataSet): TRequestResult;
var
   birthActRequest: wsZags.birth_act;
   affActRequest: wsZags.affiliation_act;
   mrgActRequest: wsZags.marriage_act;
   dvcActRequest: wsZags.divorce_act;
   adpActRequest: wsZags.adoption_act;
   dcsActRequest: wsZags.decease_act;
   cngActRequest: wsZags.name_change_act;
   ReturnCode: wsZags.return_code;
   Temp: TkbmMemTable;
   Table: TRegTable;
begin
   FLog.Clear;
   Error:=nil;
   FFaultError:='';
   if MessageType='' then begin
      MessageType:=CMessageType[ActKind];
   end;
   Result:=rrFault;
   Table:=FTableList.Find(True, ActKind, opPost);

   // � ����������� �� ��������� FPostIsUpper ��������� ��� ��������� ���� � ������� �������
   DataSetAllFieldUpper(Input);

   case ActKind of
      //������� ������ � ��������
      akBirth: begin
         //���������� ������ ��� �������� � �������
         birthActRequest:=FZags.CreateBirthActRequest(MessageType, RequestMessageId);
         if Table<>nil then begin
            Table.SetProp(birthActRequest, Input)
         end;
         {
         //1. ������������ ������ ������
         //1.1. ������������ �����
         birthActRequest.birth_cert_data.child_data.identif:=Input.FieldByName('IDENTIF').AsString;
         //1.2. ������� �� ������� �����
         birthActRequest.birth_cert_data.child_data.last_name:=Input.FieldByName('FAMILIA').AsString;
         //1.3. ������� �� ����������� �����
         birthActRequest.birth_cert_data.child_data.last_name_bel:=Input.FieldByName('FAMILIA_B').AsString;
         //1.4. ������� ���������
         //birthActRequest.birth_cert_data.child_data.last_name_lat
         //1.5. ��� �� ������� �����
         birthActRequest.birth_cert_data.child_data.name_:=Input.FieldByName('NAME').AsString;
         //1.6. ��� �� ����������� �����
         birthActRequest.birth_cert_data.child_data.name_bel:=Input.FieldByName('NAME_B').AsString;
         //1.7. ��� ���������
         //birthActRequest.birth_cert_data.child_data.name_lat
         //1.8. ��������
         //birthActRequest.birth_cert_data.child_data.patronymic
         //1.9. �������� �����������
         //birthActRequest.birth_cert_data.child_data.patronymic_bel
         //1.10. �������� ���������
         //birthActRequest.birth_cert_data.child_data.patronymic_lat
         //1.11. ���
         birthActRequest.birth_cert_data.child_data.sex:=FZags.CreateClassifier(Input.FieldByName('POL').AsString);
         //1.2. ���� ��������
         birthActRequest.birth_cert_data.child_data.birth_day:=Input.FieldByName('DATER').AsString;//FormatDate(Input.FieldByName('DATER').AsDateTime);
         //1.13. ����� ��������
         //1.13.1. ������ ��������
         birthActRequest.birth_cert_data.child_data.birth_place.country_b:=FZags.CreateClassifier(Input.FieldByName('GOSUD').AsString);
         //1.13.2. ������� ��������
         //birthActRequest.birth_cert_data.child_data.birth_place.area_b
         //1.13.3. ������� �������� �� ����������� �����
         //birthActRequest.birth_cert_data.child_data.birth_place.area_b_bel
         //1.13.4. ����� ��������
         //birthActRequest.birth_cert_data.child_data.birth_place.region_b
         //1.13.5. ����� �������� �� ����������� �����
         //birthActRequest.birth_cert_data.child_data.birth_place.region_b_bel
         //1.13.6. ��� ���������� ������
         birthActRequest.birth_cert_data.child_data.birth_place.type_city_b:=FZags.CreateClassifier(Input.FieldByName('TIP_PUNKT_R').AsString);
         //1.13.7. ��������� ����� �� ������� �����
         birthActRequest.birth_cert_data.child_data.birth_place.city_b:=Input.FieldByName('GOROD').AsString;
         //1.13.8. ��������� ����� �� ����������� �����
         birthActRequest.birth_cert_data.child_data.birth_place.city_b_bel:=Input.FieldByName('GOROD_B').AsString;
         //1.14. �����������
         birthActRequest.birth_cert_data.child_data.citizenship:=FZags.CreateClassifier(Input.FieldByName('GRAJD').AsString);
         //1.15. ������
         birthActRequest.birth_cert_data.child_data.status:=FZags.CreateClassifier(Input.FieldByName('STATUS').AsString);
         //1.16. ������ �������
         //birthActRequest.birth_cert_data.child_data.addresses
         //1.17. ������ ����������
         //birthActRequest.birth_cert_data.child_data.documents
         //1.18. ������ �������� ������
         //birthActRequest.birth_cert_data.child_data.family
         //2. ������������ ������ ������
         DataSetToPersonalData('ONA_', birthActRequest.birth_cert_data.mother_data, Input);
         //3. ������������ ������ ����
         DataSetToPersonalData('ON_', birthActRequest.birth_cert_data.father_data, Input);
         //4. ��������� ������ �������� �� ���� (������������� � ���������� �����)
         //4.1. ��� ������� ������
         //birthActRequest.birth_cert_data.marriage_cert.act_type
         //4.2. ���. �����, ������������� ������� ������ (����� ����)
         //birthActRequest.birth_cert_data.marriage_cert.authority
         //4.3. ���� ������� ������
         //birthActRequest.birth_cert_data.marriage_cert.date
         //4.4. ����� ������� ������
         //birthActRequest.birth_cert_data.marriage_cert.number
         //5. ���������� �� ������� ������
         DataSetToActData('ACT_', birthActRequest.birth_cert_data.birth_act_data, Input);
         //6. ���������� � �������� ���������
         DataSetToDocument('DOC_', birthActRequest.birth_cert_data.birth_certificate_data, Input);
         }
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostBirthCertificate(birthActRequest, FLog);
            if (ReturnCode<>nil) and (Length(ReturnCode.error_list)=0) then begin
               Result:=rrOk;
               if ReturnCode.cover.parent_message_id<>birthActRequest.cover.message_id then begin
                  Result:=rrAfterError;
                  FFaultError:='������ ������ � ���������. �� ��������� �������������� ��������� ������� � ������.';
                  FLog.Add('!������: �� ��������� �������������� ���������')
               end;
            end
            else begin
               if (ReturnCode<>nil) and (Length(ReturnCode.error_list)<>0) then begin
                  Result:=rrError;
               end
               else begin
                  Result:=rrFault;
               end;
               Temp:=TkbmMemTable.Create(nil);
               CreateAndCopyMemTable(FZags.Error, Temp);
               Error:=TDataSet(Temp);
               FFaultError:=FZags.FaultError;
            end;
         finally
            birthActRequest.Free;
            ReturnCode.Free;
         end;
      end;
      //������� ������ �� ������������ ���������
      akAffiliation: begin
         affActRequest:=FZags.CreateAffActRequest(MessageType, RequestMessageId);
         if Table<>nil then begin
            Table.SetProp(affActRequest, Input)
         end;
         {
         //���������� ������ ��� �������� � �������
         //��� �� ������������ ���������
         //1. �������� � ����, � ��������� �������� ��������������� ���������
         //1.1. ���������� �� ���� � ��������
         DataSetToActData('R_', affActRequest.aff_cert_data.aff_person.birth_act_data, Input);
         //1.2. ������������ ������ ���� �� ������������ ���������
         DataSetToPersonalData('DO_', affActRequest.aff_cert_data.aff_person.before_aff_person_data, Input);
         //1.3. ������������ ������ ���� ����� ������������ ���������
         DataSetToPersonalData('PO_', affActRequest.aff_cert_data.aff_person.after_aff_person_data, Input);
         //1.3.13. ����� ��������
         //1.3.13.1. ������ ��������
         affActRequest.aff_cert_data.aff_person.after_aff_person_data.birth_place.country_b:=FZags.CreateClassifier(Input.FieldByName('PO_GOSUD').AsString);
         //1.3.13.2. ������� ��������
         //affActRequest.aff_cert_data.aff_person.after_aff_person_data.birth_place.area_b: WideString;
         //1.3.13.3. ������� �������� �� �����������
         //affActRequest.aff_cert_data.aff_person.after_aff_person_data.birth_place.area_b_bel: WideString;
         //1.3.13.4. ����� ��������
         //affActRequest.aff_cert_data.aff_person.after_aff_person_data.birth_place.region_b: WideString;
         //1.3.13.5. ����� �������� �� �����������
         //affActRequest.aff_cert_data.aff_person.after_aff_person_data.birth_place.region_b_bel: WideString;
         //1.3.13.6. ��� ���������� ������ ��������
         affActRequest.aff_cert_data.aff_person.after_aff_person_data.birth_place.type_city_b:=FZags.CreateClassifier(Input.FieldByName('PO_TIP_PUNKT_R').AsString);
         //1.3.13.7. ��������� ����� ��������
         affActRequest.aff_cert_data.aff_person.after_aff_person_data.birth_place.city_b:=Input.FieldByName('PO_GOROD').AsString;
         //1.3.13.8. ��������� ����� �������� �� ����������
         affActRequest.aff_cert_data.aff_person.after_aff_person_data.birth_place.city_b_bel:=Input.FieldByName('PO_GOROD_B').AsString;
         //2. ������������ ������ ������
         DataSetToPersonalData('ONA_', affActRequest.aff_cert_data.mother_data, Input);
         //3. ������������ ������ ����
         DataSetToPersonalData('ON_', affActRequest.aff_cert_data.father_data, Input);
         //4. ��������� ������ ���� �� ������������ ��������� - ������� ����
         //4.1. ��� ������� ������
         //affActRequest.aff_cert_data.court_decision.act_type: Classifier;
         //4.2. ���. �����, ������������� ������� ������ (����� ����)
         //affActRequest.aff_cert_data.court_decision.authority: Classifier;
         //4.3. ���� ������� ������
         //affActRequest.aff_cert_data.court_decision.date: TXSDate;
         //4.4. ����� ������� ������
         //affActRequest.aff_cert_data.court_decision.number: WideString;
         //5. ���������� �� ������� ������
         DataSetToActData('ACT_', affActRequest.aff_cert_data.aff_act_data, Input);
         //6. ���������� � �������� ���������
         DataSetToDocument('DOC_', affActRequest.aff_cert_data.aff_certificate_data, Input);
         }
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostAffiliationCertificate(affActRequest, FLog);
            if (ReturnCode<>nil) and (Length(ReturnCode.error_list)=0) then begin
               Result:=rrOk;
               if ReturnCode.cover.parent_message_id<>affActRequest.cover.message_id then begin
                  Result:=rrAfterError;
                  FFaultError:='������ ������ � ���������. �� ��������� �������������� ��������� ������� � ������.';
                  FLog.Add('!������: �� ��������� �������������� ���������')
               end;
            end
            else begin
               if (ReturnCode<>nil) and (Length(ReturnCode.error_list)<>0) then begin
                  Result:=rrError;
               end
               else begin
                  Result:=rrFault;
               end;
               Temp:=TkbmMemTable.Create(nil);
               CreateAndCopyMemTable(FZags.Error, Temp);
               Error:=TDataSet(Temp);
               FFaultError:=FZags.FaultError;
            end;
         finally
            affActRequest.Free;
            ReturnCode.Free;
         end;
      end;
      //������� ������ � ���������� �����
      akMarriage: begin
         mrgActRequest:=FZags.CreateMarriageActRequest(MessageType, RequestMessageId);
         if Table<>nil then begin
            Table.SetProp(mrgActRequest, Input)
         end;
         {
         //���������� ������ ��� �������� � �������
         //��� � ���������� �����
         //1. ���������� � �������
         //1.1. ������������ ������ �������
         DataSetToPersonalData('ONA_', mrgActRequest.mrg_cert_data.bride.bride_data, Input);
         //1.2. ������� �� ���������� �����
         mrgActRequest.mrg_cert_data.bride.old_last_name:=Input.FieldByName('ONA_FAMILIA_OLD').AsString;
         //2. ���������� � ������
         //2.1. ������������ ������ ������
         DataSetToPersonalData('ON_', mrgActRequest.mrg_cert_data.bridegroom.bridegroom_data, Input);
         //2.2. ������� �� ���������� �����
         mrgActRequest.mrg_cert_data.bridegroom.old_last_name:=Input.FieldByName('ON_FAMILIA_OLD').AsString;
         //3. �������� � ���������� �����, �� ��������� 18 ���
         //mrgActRequest.mrg_cert_data.joint_child
         //4. ���������� �� ������� ������
         DataSetToActData('ACT_', mrgActRequest.mrg_cert_data.mrg_act_data, Input);
         //5. ���������� � �������� ���������
         DataSetToDocument('DOC_', mrgActRequest.mrg_cert_data.mrg_certificate_data, Input);
         }
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostMarriageCertificate(mrgActRequest, FLog);
            if (ReturnCode<>nil) and (Length(ReturnCode.error_list)=0) then begin
               Result:=rrOk;
               if ReturnCode.cover.parent_message_id<>mrgActRequest.cover.message_id then begin
                  Result:=rrAfterError;
                  FFaultError:='������ ������ � ���������. �� ��������� �������������� ��������� ������� � ������.';
                  FLog.Add('!������: �� ��������� �������������� ���������')
               end;
            end
            else begin
               if (ReturnCode<>nil) and (Length(ReturnCode.error_list)<>0) then begin
                  Result:=rrError;
               end
               else begin
                  Result:=rrFault;
               end;
               Temp:=TkbmMemTable.Create(nil);
               CreateAndCopyMemTable(FZags.Error, Temp);
               Error:=TDataSet(Temp);
               FFaultError:=FZags.FaultError;
            end;
         finally
            mrgActRequest.Free;
            ReturnCode.Free;
         end;
      end;
      //������� ������ � ������
      akDecease: begin
         dcsActRequest:=FZags.CreateDeceaseActRequest(MessageType, RequestMessageId);
         if Table<>nil then begin
            Table.SetProp(dcsActRequest, Input)
         end;
         {
         //���������� ������ ��� �������� � �������
         //��� � ������
         //������������ ������ ��������
         DataSetToPersonalData('', dcsActRequest.dcs_cert_data.person_data, Input);
         //���������� � ������
         //������� ������
         dcsActRequest.dcs_cert_data.decease_data.death_cause:=FZags.CreateClassifier(Input.FieldByName('SM_PRICH').AsString);
         //���� ������
         dcsActRequest.dcs_cert_data.decease_data.death_date:=Input.FieldByName('SM_DATE').AsString;//FormatDate(Input.FieldByName('SM_DATE').AsDateTime);
         //����� ������
         //������
         dcsActRequest.dcs_cert_data.decease_data.decease_place.country_d:=FZags.CreateClassifier(Input.FieldByName('GOSUD').AsString);
         //�������
         //dcsActRequest.dcs_cert_data.decease_data.decease_place.area_d: WideString;
         //�������
         //dcsActRequest.dcs_cert_data.decease_data.decease_place.area_d_bel: WideString;
         //�����
         //dcsActRequest.dcs_cert_data.decease_data.decease_place.region_d: WideString;
         //�����
         //dcsActRequest.dcs_cert_data.decease_data.decease_place.region_d_bel: WideString;
         //��� ���������� ������
         dcsActRequest.dcs_cert_data.decease_data.decease_place.type_city_d:=FZags.CreateClassifier(Input.FieldByName('TIP_PUNKT_S').AsString);
         //��������� ����� �� ������� �����
         dcsActRequest.dcs_cert_data.decease_data.decease_place.city_d:=Input.FieldByName('GOROD').AsString;
         //��������� ����� �� ����������� �����
         dcsActRequest.dcs_cert_data.decease_data.decease_place.city_d_bel:=Input.FieldByName('GOROD_B').AsString;
         //������ ����������� �
         //dcsActRequest.dcs_cert_data.decease_data.death_place: WideString;
         //����� �����������
         //dcsActRequest.dcs_cert_data.decease_data.burial_place: WideString;
         //��������, �������������� ���� ������
         dcsActRequest.dcs_cert_data.reason:=Input.FieldByName('SM_DOC').AsString;
         //���������� �� ������� ������
         DataSetToActData('ACT_', dcsActRequest.dcs_cert_data.dcs_act_data, Input);
         //���������� � �������� ���������
         DataSetToDocument('DOC_', dcsActRequest.dcs_cert_data.dcs_certificate_data, Input);
         }
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostDeceaseCertificate(dcsActRequest, FLog);
            if (ReturnCode<>nil) and (Length(ReturnCode.error_list)=0) then begin
               Result:=rrOk;
               if ReturnCode.cover.parent_message_id<>dcsActRequest.cover.message_id then begin
                  Result:=rrAfterError;
                  FFaultError:='������ ������ � ���������. �� ��������� �������������� ��������� ������� � ������.';
                  FLog.Add('!������: �� ��������� �������������� ���������')
               end;
            end
            else begin
               if (ReturnCode<>nil) and (Length(ReturnCode.error_list)<>0) then begin
                  Result:=rrError;
               end
               else begin
                  Result:=rrFault;
               end;
               Temp:=TkbmMemTable.Create(nil);
               CreateAndCopyMemTable(FZags.Error, Temp);
               Error:=TDataSet(Temp);
               FFaultError:=FZags.FaultError;
            end;
         finally
            dcsActRequest.Free;
            ReturnCode.Free;
         end;
      end;
      //������� ������ � ����������� �����
      akDivorce: begin
         dvcActRequest:=FZags.CreateDivorceActRequest(MessageType, RequestMessageId);
         if Table<>nil then begin
            Table.SetProp(dvcActRequest, Input)
         end;
         {
         //���������� ������ ��� �������� � �������
         //��� � ����������� �����
         //1. ���������� � ����
         //1.1. ������������ ������ ����
         DataSetToPersonalData('ONA_', dvcActRequest.dvc_cert_data.wife.wife_data, Input);
         //
         dvcActRequest.dvc_cert_data.wife.wife_data.birth_place.country_b:=FZags.CreateClassifier(Input.FieldByName('ONA_GOSUD').AsString);
         dvcActRequest.dvc_cert_data.wife.wife_data.birth_place.city_b:=Input.FieldByName('ONA_GOROD').AsString;
         //1.2. ������� �� ����������� �����
         dvcActRequest.dvc_cert_data.wife.old_last_name:=Input.FieldByName('ONA_FAMILIA_OLD').AsString;
         //2. ���������� � ����
         //2.1. ������������ ������ ����
         DataSetToPersonalData('ON_', dvcActRequest.dvc_cert_data.husband.husband_data, Input);
         //2.2. ������� �� ����������� �����
         dvcActRequest.dvc_cert_data.husband.old_last_name:=Input.FieldByName('ON_FAMILIA_OLD').AsString;
         //3. ���������� �� ���� � ����������� �����
         DataSetToActData('BRAK_', dvcActRequest.dvc_cert_data.mrg_act_data, Input);
         //4. �������� � ���������� �����, �� ��������� 18 ���
         //dvcActRequest.dvc_cert_data.joint_child: Array_Of_joint_child2;
         //5. ��������� ������ ���� � ����������� �����  - ������� ����
         //dvcActRequest.dvc_cert_data.court_decision: ActData;
         //6. ���������� �� ������� ������
         DataSetToActData('ACT_', dvcActRequest.dvc_cert_data.dvc_act_data, Input);
         //7. ���������� � �������� ��������� (������������� ��� ������ ����)
         DataSetToDocument('ONA_', dvcActRequest.dvc_cert_data.dvc_wm_certificate_data, Input);
         //8. ���������� � �������� ��������� (������������� ��� ������� ����)
         DataSetToDocument('ON_', dvcActRequest.dvc_cert_data.dvc_mn_certificate_data, Input);
         }
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostDivorceCertificate(dvcActRequest, FLog);
            if (ReturnCode<>nil) and (Length(ReturnCode.error_list)=0) then begin
               Result:=rrOk;
               if ReturnCode.cover.parent_message_id<>dvcActRequest.cover.message_id then begin
                  Result:=rrAfterError;
                  FFaultError:='������ ������ � ���������. �� ��������� �������������� ��������� ������� � ������.';
                  FLog.Add('!������: �� ��������� �������������� ���������')
               end;
            end
            else begin
               if (ReturnCode<>nil) and (Length(ReturnCode.error_list)<>0) then begin
                  Result:=rrError;
               end
               else begin
                  Result:=rrFault;
               end;
               Temp:=TkbmMemTable.Create(nil);
               CreateAndCopyMemTable(FZags.Error, Temp);
               Error:=TDataSet(Temp);
               FFaultError:=FZags.FaultError;
            end;
         finally
            dvcActRequest.Free;
            ReturnCode.Free;
         end;
      end;
      //������� ������ �� ����������� (����������)
      akAdoption: begin
         adpActRequest:=FZags.CreateAdoptionActRequest(MessageType, RequestMessageId);
         if Table<>nil then begin
            Table.SetProp(adpActRequest, Input)
         end;
         {
         //���������� ������ ��� �������� � �������
         //��� �� ����������� (����������)
         //1. �������� �� ������������
         //1.1. ����������������� ����� �������������
         adpActRequest.adp_cert_data.adp_child.identif:=Input.FieldByName('IDENTIF').AsString;
         //1.2. �������� �� ������������ �� �����������
         //1.2.1. ������������ ������ ������������� �� �����������
         DataSetToPersonalData('DO_', adpActRequest.adp_cert_data.adp_child.before_adp_child.before_adp_child_data, Input);
         //1.2.2. ���������� �� ���� � �������� (�� �����������)
         DataSetToActData('DO_', adpActRequest.adp_cert_data.adp_child.before_adp_child.before_adp_birth_act_data, Input);
         //1.3. �������� �� ������������ ����� �����������
         //1.3.1. ������������ ������ ������������� ����� �����������
         DataSetToPersonalData('PO_', adpActRequest.adp_cert_data.adp_child.after_adp_child.after_adp_child_data, Input);
         adpActRequest.adp_cert_data.adp_child.after_adp_child.after_adp_child_data.birth_place.country_b:=FZags.CreateClassifier(Input.FieldByName('PO_GOSUD').AsString);
         //�������
         //area_d: WideString;
         //�������
         //area_d_bel: WideString;
         //�����
         //region_d: WideString;
         //�����
         //region_d_bel: WideString;
         //��� ���������� ������
         adpActRequest.adp_cert_data.adp_child.after_adp_child.after_adp_child_data.birth_place.type_city_b:=FZags.CreateClassifier(Input.FieldByName('PO_TIP_PUNKT_R').AsString);
         //��������� ����� �� ������� �����
         adpActRequest.adp_cert_data.adp_child.after_adp_child.after_adp_child_data.birth_place.city_b:=Input.FieldByName('PO_GOROD').AsString;
         //��������� ����� �� ����������� �����
         adpActRequest.adp_cert_data.adp_child.after_adp_child.after_adp_child_data.birth_place.city_b_bel:=Input.FieldByName('PO_GOROD_B').AsString;
         //1.3.2. ���������� �� ���� � �������� (����� �����������)
         DataSetToActData('PO_', adpActRequest.adp_cert_data.adp_child.after_adp_child.after_adp_birth_act_data, Input);
         //2. ������������ ������ ������
         DataSetToPersonalData('ONA_', adpActRequest.adp_cert_data.mother_data, Input);
         //3. ������������ ������ ����
         DataSetToPersonalData('ON_', adpActRequest.adp_cert_data.father_data, Input);
         //4. ������������ ������ ���������������
         DataSetToPersonalData('ONA2_', adpActRequest.adp_cert_data.adp_mother_data, Input);
         //5. ������������ ������ �����������
         DataSetToPersonalData('ON2_', adpActRequest.adp_cert_data.adp_father_data, Input);
         //6. �������� � ����������� ���������� �����
         //6.1. ������� ���������� �����
         adpActRequest.adp_cert_data.marriage.mrg_flag:=wsZags.MarrFlag(Input.FieldByName('BRAK_FLAG').AsInteger);
         //6.2. ���������� �� ���� � ���������� �����
         DataSetToActData('BRAK_', adpActRequest.adp_cert_data.marriage.mrg_cert_data, Input);
         //7. ��������� ������ ���� �� ����������� (����������) - ������� ����
         //DataSetToActData('SUD_', adpActRequest.court_decision, Input);
         //8. ������������ �� ����������� ���������� ������
         adpActRequest.adp_cert_data.parents_flag:=wsZags.ParentsFlag(Input.FieldByName('RODIT_FLAG').AsInteger);
         //9. ���������� �� ������� ������
         DataSetToActData('ACT_', adpActRequest.adp_cert_data.adp_act_data, Input);
         //10. ���������� � �������� ���������
         DataSetToDocument('DOC_', adpActRequest.adp_cert_data.adp_certificate_data, Input);
         }
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostAdoptionCertificate(adpActRequest, FLog);
            if (ReturnCode<>nil) and (Length(ReturnCode.error_list)=0) then begin
               Result:=rrOk;
               if ReturnCode.cover.parent_message_id<>adpActRequest.cover.message_id then begin
                  Result:=rrAfterError;
                  FFaultError:='������ ������ � ���������. �� ��������� �������������� ��������� ������� � ������.';
                  FLog.Add('!������: �� ��������� �������������� ���������')
               end;
            end
            else begin
               if (ReturnCode<>nil) and (Length(ReturnCode.error_list)<>0) then begin
                  Result:=rrError;
               end
               else begin
                  Result:=rrFault;
               end;
               Temp:=TkbmMemTable.Create(nil);
               CreateAndCopyMemTable(FZags.Error, Temp);
               Error:=TDataSet(Temp);
               FFaultError:=FZags.FaultError;
            end;
         finally
            adpActRequest.Free;
            ReturnCode.Free;
         end;
      end;
      //������� ������ � �������� �����
      akNameChange: begin
         cngActRequest:=FZags.CreateNameChangeActRequest(MessageType, RequestMessageId);
         if Table<>nil then begin
            Table.SetProp(cngActRequest, Input)
         end;
         {
         //���������� ������ ��� �������� � �������
         //��� � �������� �����
         //1. ������������ ������ ����
         //1.1. ������������ ������ ����
         DataSetToPersonalData('', cngActRequest.cng_cert_data.person.person_data, Input);
         //1.2. ������� �� �������� �����
         cngActRequest.cng_cert_data.person.old_last_name:=Input.FieldByName('DO_FAMILIA').AsString;
         //1.3. ��� �� �������� �����
         cngActRequest.cng_cert_data.person.old_name:=Input.FieldByName('DO_NAME').AsString;
         //1.4. �������� �� �������� �����
         cngActRequest.cng_cert_data.person.old_patronymic:=Input.FieldByName('DO_OTCH').AsString;
         //1.5. ���������� �� ���� � ��������
         DataSetToActData('R_', cngActRequest.cng_cert_data.person.birth_act_data, Input);
         //2. �������� � �����, �� ��������� 18 ���
         //2.1. ���������� � ������
         //2.2. ���������� �� ���� � ��������
         //3. ��������� ������ ���� � �������� �����
         cngActRequest.cng_cert_data.reason:=Input.FieldByName('OSNOV').AsString;
         //4. ���������� �� ������� ������
         DataSetToActData('ACT_', cngActRequest.cng_cert_data.cng_act_data, Input);
         //5. ���������� � �������� ���������
         DataSetToDocument('DOC_', cngActRequest.cng_cert_data.cng_certificate_data, Input);
         }
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostNameChangeCertificate(cngActRequest, FLog);
            if (ReturnCode<>nil) and (Length(ReturnCode.error_list)=0) then begin
               Result:=rrOk;
               if ReturnCode.cover.parent_message_id<>cngActRequest.cover.message_id then begin
                  Result:=rrAfterError;
                  FFaultError:='������ ������ � ���������. �� ��������� �������������� ��������� ������� � ������.';
                  FLog.Add('!������: �� ��������� �������������� ���������')
               end;
            end
            else begin
               if (ReturnCode<>nil) and (Length(ReturnCode.error_list)<>0) then begin
                  Result:=rrError;
               end
               else begin
                  Result:=rrFault;
               end;
               Temp:=TkbmMemTable.Create(nil);
               CreateAndCopyMemTable(FZags.Error, Temp);
               Error:=TDataSet(Temp);
               FFaultError:=FZags.FaultError;
            end;
         finally
            cngActRequest.Free;
            ReturnCode.Free;
         end;
      end;
   end;
end;

function TRegInt.ReadMetaInfo(InputFile, OutputFile: string): Boolean;
var
   Struct: TStringList;

   function NextToken(var S: string): string;
   begin
      if Pos(' ', S)<>0 then begin
         Result:=Copy(S, 1, Pred(Pos(' ', S)));
         Delete(S, 1, Pos(' ', S));
         S:=Trim(S);
      end
      else begin
         Result:=S;
      end;
   end;

   procedure ReadStruct(Struct: TStringList; IsInput: Boolean);
   var
      Ind: Integer;
      S: string;
      Table: TRegTable;
      Field: TRegField;
   begin
      Ind:=0;
      repeat
         if Struct.Count<(Ind+3) then begin
            Break;
         end;
         Table:=FTableList.AddNew;
         Table.IsInput:=IsInput;
         S:=Trim(Struct[Ind]);
         Delete(S, 1, 1);
         Table.Comm:=S;
         Inc(Ind);
         S:=Trim(Struct[Ind]);
         Table.ActKind:=TActKind(GetEnumValue(TypeInfo(TActKind), NextToken(S)));
         if IsInput then begin
            Table.Operation:=TOperation(GetEnumValue(TypeInfo(TOperation), S));
         end
         else begin
            Table.Operation:=opGet;
         end;
         Inc(Ind);
         while (Ind<Struct.Count) and (Struct[Ind]<>'') do begin
            S:=Trim(Struct[Ind]);
            if (Length(S)>1) and (Copy(S, 1, 1)<>';') then begin
               Field:=Table.FieldList.AddNew;
               Field.Name:=NextToken(S);
               Field.DataType:=TFieldType(GetEnumValue(TypeInfo(TFieldType), NextToken(S)));
               if not (Field.DataType in [ftBoolean, ftInteger]) then begin
                  Field.Size:=StrToInt(NextToken(S));
               end
               else begin
                  NextToken(S);
               end;
               Field.Path:=NextToken(S);
               Delete(S, 1, 1);
               Field.Comm:=S;
            end;
            Inc(Ind)
         end;
         Inc(Ind);
      until Ind>=Struct.Count;
   end;

begin
   Result:=False;
   //�������� ������� ����������
   if not FileExists(InputFile) then begin
      MessageDlg(Format('�� ������ ���� "%s"', [InputFile]), mtError, [mbOk], 0);
      Exit;
   end;
   if not FileExists(OutputFile) then begin
      MessageDlg(Format('�� ������ ���� "%s"', [OutputFile]), mtError, [mbOk], 0);
      Exit;
   end;
   //������ ���������� � ��������� ������
   FTableList.Clear;
   Struct:=TStringList.Create;
   try
      Struct.LoadFromFile(InputFile);
      ReadStruct(Struct, True);
      Struct.LoadFromFile(OutputFile);
      ReadStruct(Struct, False);
      Result:=True;
   finally
      Struct.Free;
   end;
end;

procedure TRegInt.SetGisunProxy(const Value: string);
begin
   FGisun.Proxy:=Value;
   FGisunProxy:=Value;
end;

procedure TRegInt.SetGisunUrl(Value: string);
begin
   FGisun.Url:=Value;
   FGisunUrl:=Value;
end;

procedure TRegInt.SetMessageSource(Value: string);
begin
   FMessageSource:=Value;
   FZags.MessageSource:=Value;
   FGisun.MessageSource:=Value;
end;

procedure TRegInt.SetPostIsUpper(const Value: Boolean);
begin
  FPostIsUpper := Value;
end;

procedure TRegInt.SetZagsProxy(const Value: string);
begin
   FZags.Proxy:=Value;
   FZagsProxy:=Value;
end;

procedure TRegInt.SetZagsUrl(Value: string);
begin
   FZags.Url:=Value;
   FZagsUrl:=Value;
end;

{function TRegInt.StringToDate(DateTime: string): TDateTime;
var
   Year: Word;
   Month: Word;
   Day: Word;
begin
   Year:=StrToInt(Copy(DateTime, 1, 4));
   Month:=StrToInt(Copy(DateTime, 5, 2));
   Day:=StrToInt(Copy(DateTime, 7, 2));
   Result:=EncodeDate(Year, Month, Day);
end;}

procedure TRegInt.SetVersion(const Value: Integer);
begin
  FVersion := Value;
end;

{ TRegFieldList }

function TRegFieldList.Add(Item: TRegField): Integer;
begin
   Result:=FList.Add(Item);
end;

function TRegFieldList.AddNew: TRegField;
begin
   Result:=TRegField.Create;
   Add(Result);
end;

procedure TRegFieldList.Clear;
var
   I: Integer;
   Item: TRegField;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

constructor TRegFieldList.Create;
begin
   FList:=TList.Create;
end;

destructor TRegFieldList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TRegFieldList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TRegFieldList.GetItem(I: Integer): TRegField;
begin
   Result:=TRegField(FList[I]);
end;

{ TRegField }

constructor TRegField.Create;
begin

end;

destructor TRegField.Destroy;
begin
   inherited;
end;

{ TRegTable }

constructor TRegTable.Create;
begin
   FFieldList:=TRegFieldList.Create;
end;

function TRegTable.CreateMemTable: TDataSet;
var
   I: Integer;
   FieldDef: TFieldDef;
begin
   Result:=TkbmMemTable.Create(nil);
   for I:=0 to Pred(FFieldList.Count) do begin
      FieldDef:=Result.FieldDefs.AddFieldDef;
      FieldDef.Name:=FFieldList[I].Name;
      FieldDef.DataType:=FFieldList[I].DataType;
      if not (FieldDef.DataType in [ftBoolean, ftInteger]) then begin
         FieldDef.Size:=FFieldList[I].Size;
      end;
   end;
   TkbmMemTable(Result).CreateTable;
   for I:=0 to Pred(Result.FieldCount) do begin
      Result.Fields[I].DisplayLabel:=FFieldList[I].Comm;
   end;
   Result.Open;
end;

destructor TRegTable.Destroy;
begin
   FFieldList.Free;
   inherited;
end;

function TRegTable.GetProp(Root: TObject; DataSet: TDataSet): Boolean;
var
   First: TObject;
   I: Integer;
   J: Integer;
   PropName: string;
   PropInfo: PPropInfo;
   PropType: PPTypeInfo;
   ClassName: string;
   DataField: TField;
   PropClass: TClass;
   Obj: TObject;
   IsGet: Boolean;
   sArrInd :String;
   //
   Addresses: wsGisun.AddressList;
   Documents: wsGisun.DocumentList;
   Lexema: wsGisun.LangValueList;

   function NextProp(var S: string): string;
   var
      I,j: Integer;
   begin
      sArrInd:='';
      Result:='';
      for I:=1 to Length(S) do begin
         if IsDelimiter('/\.', S, I) then begin
            Result:=Copy(S, 1, Pred(I));
            Delete(S, 1, I);
            j:=Pos('[',Result);
            if j>0 then begin
              sArrInd:=Copy(Result,j+1,Length(Result)-j-1);
              Result:=Copy(Result,1,j-1);
            end;
            Break;
         end;
      end;

   end;

begin
   Addresses:=nil;
   Documents:=nil;
   Lexema:=nil;
   Result:=False;
   First:=Root;
   for I:=0 to Pred(FFieldList.Count) do begin
      PropName:=FFieldList[I].Path;
      if PropName<>'X' then begin
         IsGet:=False;
         ClassName:=NextProp(PropName);
         if SameText(ClassName, First.ClassName) then begin
            Root:=First;
            repeat
               ClassName:=NextProp(PropName);
               if ClassName<>'' then begin
                  PropInfo:=GetPropInfo(Root, ClassName);
                  if PropInfo<>nil then begin
                     PropType:=PropInfo.PropType;
                     case PropType^.Kind of
                        tkDynArray: begin
                           if PropType^=TypeInfo(wsGisun.AddressList) then begin
                              Addresses:=wsGisun.AddressList(GetOrdProp(Root, PropInfo));
                              Root:=nil;
                              if (Addresses<>nil) and (Length(Addresses)>0) then begin
                                 Root:=Addresses[0];
                              end;
                           end
                           else if PropType^=TypeInfo(wsGisun.DocumentList) then begin
                              Documents:=wsGisun.DocumentList(GetOrdProp(Root, PropInfo));
                              Root:=nil;
                              if (Documents<>nil) and (Length(Documents)>0) then begin
                                 Root:=Documents[0];
                              end;
                           end
                           else if PropType^=TypeInfo(wsGisun.LangValueList) then begin
                              Lexema:=wsGisun.LangValueList(GetOrdProp(Root, PropInfo));
                              Root:=nil;
                              if (Lexema<>nil) and (Length(Lexema)>0) then begin
                                 if sArrInd='' then sArrInd:='RU';
                                 for J:=Low(Lexema) to High(Lexema) do begin
                                    if SameText(Lexema[J].lang, sArrInd) then begin
                                       Root:=Lexema[J];
                                       Break;
                                    end;
                                 end;
                              end;
                           end
                           else begin
                              Root:=nil;
                              ShowMessage(PropType^.Name+' '+FFieldList[I].Path);
                           end;
                        end;
                        tkClass: begin
                           Root:=GetObjectProp(Root, ClassName);
                        end;
                     else
                        Root:=nil;
                     end;
                  end
                  else begin
                     Root:=nil;
                  end;
               end;
            until (ClassName='') or (Root=nil);
            if (PropName<>'') and (Root<>nil) then begin
               DataField:=DataSet.FieldByName(FFieldList[I].Name);
               PropInfo:=GetPropInfo(Root, PropName);
               if PropInfo<>nil then begin
                  PropType:=PropInfo.PropType;
                  case PropType^.Kind of
                     //???tkEnumeration
                     //MarrFlag
                     //ParentsFlag
                     tkEnumeration: begin
                        Result:=True;
                        DataField.AsInteger:=GetOrdProp(Root, PropInfo);
                        IsGet:=True;
                     end;
                     tkInteger: begin
                        Result:=True;
                        DataField.AsInteger:=GetOrdProp(Root, PropInfo);
                        IsGet:=True;
                     end;
                     tkString, tkWChar, tkLString, tkWString: begin
                        Result:=True;
                        DataField.AsString:=GetStrProp(Root, PropInfo);
                        IsGet:=True;
                     end;
                     tkClass: begin
                        PropClass:=GetObjectPropClass(PropInfo);
                        Obj:=GetObjectProp(Root, PropInfo);
                        if (PropClass=wsGisun.Classifier) then begin
                           if Obj<>nil then begin
                              Result:=True;
                              DataField.AsString:=GetStrProp(Obj, 'Code');
                              IsGet:=True;
                           end;
                        end
                        else if PropClass=TXSDate then begin
                           if Obj<>nil then begin
                              Result:=True;
                              DataField.AsDateTime:=TXSDate(Obj).AsDate;
                              IsGet:=True;
                           end;
                        end
                        else begin
                           ShowMessage(GetEnumName(TypeInfo(TTypeKind), Ord(PropType^.Kind))+' '+FFieldList[I].Path);
                        end;
                     end;
                  else
                     ShowMessage(GetEnumName(TypeInfo(TTypeKind), Ord(PropType^.Kind))+' '+FFieldList[I].Path);
                  end;
               end;
            end;
         end;                      
         if not IsGet then begin
            //--ShowMessageFmt('Name="%s" Path="%s"', [FFieldList[I].Name, FFieldList[I].Path]);
         end;
      end;
   end;
end;

function TRegTable.SetProp(Root: TObject; DataSet: TDataSet): Boolean;
var
   First: TObject;
   I: Integer;
   PropName: string;
   PropInfo: PPropInfo;
   PropType: PPTypeInfo;
   ClassName: string;
   IsSet: Boolean;
   {
   Obj: TObject;
   }
   DataField: TField;
   PropClass: TClass;

   function NextProp(var S: string): string;
   var
      I: Integer;
   begin
      Result:='';
      for I:=1 to Length(S) do begin
         if IsDelimiter('/\.', S, I) then begin
            Result:=Copy(S, 1, Pred(I));
            Delete(S, 1, I);
            Break;
         end;
      end;
   end;

   function GetObject(Root: TObject; PropName: string): TObject; overload;
   begin
      Result:=GetObjectProp(Root, PropName);
      if Result=nil then begin
         Result:=GetObjectPropClass(Root, PropName).Create;
         SetObjectProp(Root, PropName, Result);
      end;
   end;

   function GetObject(Root: TObject; PropInfo: PPropInfo): TObject; overload;
   begin
      Result:=GetObjectProp(Root, PropInfo);
      if Result=nil then begin
         Result:=GetObjectPropClass(PropInfo).Create;
         SetObjectProp(Root, PropInfo, Result);
      end;
   end;

begin
   Result:=False;
   First:=Root;
   for I:=0 to Pred(FFieldList.Count) do begin
      PropName:=FFieldList[I].Path;
      if PropName<>'X' then begin
         IsSet:=False;
         ClassName:=NextProp(PropName);
         if SameText(ClassName, First.ClassName) then begin
            Root:=First;
            repeat
               ClassName:=NextProp(PropName);
               if ClassName<>'' then begin
                  //��� ��������, ��� ��� tkClass
                  Root:=GetObject(Root, ClassName);
                  {
                  Obj:=GetObjectProp(Root, ClassName);
                  if Obj=nil then begin
                     Obj:=GetObjectPropClass(Root, ClassName).Create;
                     SetObjectProp(Root, ClassName, Obj);
                  end;
                  Root:=Obj;
                  }
               end;
            until ClassName='';
            if PropName<>'' then begin
               DataField:=DataSet.FieldByName(FFieldList[I].Name);
               PropInfo:=GetPropInfo(Root, PropName);
               if PropInfo<>nil then begin
                  PropType:=PropInfo.PropType;
                  case PropType^.Kind of
                     tkEnumeration: begin
                        Result:=True;
                        SetOrdProp(Root, PropInfo, DataField.AsInteger);
                        IsSet:=True;
                     end;
                     tkInteger: begin
                        Result:=True;
                        SetOrdProp(Root, PropInfo, DataField.AsInteger);
                        IsSet:=True;
                     end;
                     tkString, tkWChar, tkLString, tkWString: begin
                        Result:=True;
                        SetStrProp(Root, PropInfo, DataField.AsString);
                        IsSet:=True;
                     end;
                     tkClass: begin
                        PropClass:=GetObjectPropClass(PropInfo);
                        if (PropClass=wsGisun.Classifier) then begin
                           {
                           Obj:=GetObjectProp(Root, PropInfo);
                           if Obj=nil then begin
                              Obj:=PropClass.Create;
                              SetObjectProp(Root, PropInfo, Obj);
                           end;
                           SetStrProp(Obj, 'Code', DataField.AsString);
                           }
                           SetStrProp(GetObject(Root, PropInfo), 'Code', DataField.AsString);
                           IsSet:=True;
                           if SameText(PropName, 'message_type') then SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctActType);
                           if SameText(PropName, 'message_source') then SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctZags);
                           if SameText(PropName, 'act_type') then SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctActType);
                           if SameText(PropName, 'authority') then begin
                              //ctMVD
                              if (Root is wsGisun.Document) then SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctZags);
                              if (Root is wsGisun.ActData) then SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctZags);
                           end;
                           if SameText(PropName, 'document_type') then SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctDocType);
                           if SameText(PropName, 'sex') then SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctPol);
                           if SameText(PropName, 'citizenship') then SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctCountry);
                           if SameText(PropName, 'status') then SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctStatus);
                           if SameText(PropName, 'country_b') then SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctCountry);
                           if SameText(PropName, 'type_city_b') then SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctTypeCity);
                           if SameText(PropName, 'death_cause') then begin
                              SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctDeathCause);
//                              if Pos('.',DataField.AsString)=0
//                                then SetOrdProp(GetObject(Root, PropInfo), 'Type_', 85)             // !!!
//                                else SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctDeathCause);
                           end;
                           if SameText(PropName, 'country_d') then SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctCountry);
                           if SameText(PropName, 'type_city_d') then SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctTypeCity);
                        end
                        else if PropClass=TXSDate then begin
                           TXSDate(GetObject(Root, PropInfo)).AsDate:=DataField.AsDateTime;
                           //SetFloatProp(GetObject(Root, PropInfo), 'AsDate', DataField.AsDateTime);
                           IsSet:=True;
                        end
                        else begin
                           ShowMessage(GetEnumName(TypeInfo(TTypeKind), Ord(PropType^.Kind))+' '+FFieldList[I].Path);
                        end;
                     end;
                  else
                     ShowMessage(GetEnumName(TypeInfo(TTypeKind), Ord(PropType^.Kind))+' '+FFieldList[I].Path);
                  end;
               end;
            end;
         end;
         if not IsSet then begin
            //ShowMessageFmt('Name="%s" Path="%s"', [FFieldList[I].Name, FFieldList[I].Path]);
         end;
      end;
   end;
end;

{ TRegTableList }

function TRegTableList.Add(Item: TRegTable): Integer;
begin
   Result:=FList.Add(Item);
end;

function TRegTableList.AddNew: TRegTable;
begin
   Result:=TRegTable.Create;
   Add(Result);
end;

procedure TRegTableList.Clear;
var
   I: Integer;
   Item: TRegTable;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

constructor TRegTableList.Create;
begin
   FList:=TList.Create;
end;

destructor TRegTableList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TRegTableList.Find(IsInput: Boolean; ActKind: TActKind; Operation: TOperation): TRegTable;
var
   I: Integer;
   Item: TRegTable;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Item.IsInput=IsInput) and (Item.ActKind=ActKind) and (Item.Operation=Operation) then begin
         Result:=Item;
         Break;
      end;
   end;
end;

function TRegTableList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TRegTableList.GetItem(I: Integer): TRegTable;
begin
   Result:=TRegTable(FList[I]);
end;

end.
