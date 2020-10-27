unit mRegInt;

interface

{$I Task.inc}

uses
   Windows, Classes, SysUtils, Graphics, ActiveX, DB, Forms, ImgList, Controls, FuncPr,
   {$IFDEF GIS_THREAD} TasksEx, AsyncCalls, {$ENDIF}
   Dialogs, StdCtrls, ExtCtrls, ShellApi, ComObj, Messages, TypInfo, mPermit,
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
      //������ �� ��������� ������������ ������ (�� ��������������)
      akGetPersonalData,
      //������ �� ��������� ������������ ������ (�� �.�.�.)
      akGetPersonIdentif,
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
      akNameChange,
      //���������� �� �����
      akOpeka,
      //���������� � ��������������
      akPopech,
      //���������� � �����������
      akZah
   );

const
   //���� ��������� (MessageCover.message_type)
   CMessageType: array [TActKind] of string=(
      //??? !!! ���������� �� ����� ���
      '0001',   //������ �� ��������� ������������ ������ �� �������������� (akGetPersonalData)
      '0001',   //������ �� ��������� ������������ ������ �� �.�.�. (akGetPersonIdentif)
      '0100',   //������� ������ � �������� (akBirth)
      '0200',   //������� ������ �� ������������ ��������� (akAffiliation)  !!!  '0800' ���. �����������  !!!
      '0300',   //������� ������ � ���������� ����� (akMarriage)
      '0400',   //������� ������ � ������ (akDecease)
      '0500',   //������� ������ � ����������� ����� (akDivorce)
      '0600',   //������� ������ �� ����������� (����������) (akAdoption)
      '0700',   //������� ������ � �������� ����� (akNameChange)
      '0100',    //akOpeka  ???  !!!   ����������
      '0100',    //akPopech    ???  !!!   ����������
      '0100'     //akZah    ???  !!!   ����������
   );

  USTMAT_MESSAGE_TYPE='0800';

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
      //���������� ������ � ������� ������� ��� �������� � �������
      FPostIsUpper: Boolean;
      //������ ���������� ��������
      FVersion: Integer;
      //��� ������������
      FUsername: string;
      //������ ������������
      FPassword: string;
      //���-��� ������������
      FPIN: string;
      FDbUserAsGIS: Boolean;
      FPostUserName: Boolean;
    procedure SetDbUserAsGIS(const Value: Boolean);
    procedure SetPostUserName(const Value: Boolean);
   private
      FTextLog:String;
      FError07:Boolean;
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
      procedure SetPostIsUpper(const Value: Boolean);
      procedure SetVersion(const Value: Integer);
   public
      //������ ��� �������� ���������� � �������
      FZags: TZagsInterface;
      //������ ��� ��������� ���������� �� ��������
      FGisun: TGisunInterface;
      constructor Create(MessageSource: string);
      destructor Destroy; override;

      function CheckLogon:Boolean;

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
      property Username: string read FUsername write FUsername;
      property Password: string read FPassword write FPassword;
      property PIN: string read FPIN write FPIN;
      property DbUserAsGIS : Boolean read FDbUserAsGIS write SetDbUserAsGIS;
      property PostUserName : Boolean read FPostUserName write SetPostUserName;
      property Error07: Boolean read FError07;
      property TextLog: string read FTextLog write FTextLog;

   end;

{ ������ � ��������� }

function CreateMemTable(FieldList: array of const; AutoCreate, AutoOpen: Boolean): TkbmMemTable;
procedure CreateAndCopyMemTable(Src: TDataSet; Dst: TkbmMemTable);
function CreateErrorTable: TDataSet;

implementation

{$IFDEF MY_PROJECT}
  uses fLogon, fMain, uGisun;
{$ENDIF}

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
   FVersion:=3;
   FPostIsUpper:=false;
   FTableList:=TRegTableList.Create;
   FLog:=TStringList.Create;
   FZags:=TZagsInterface.Create;
//   FZags.
   FGisun:=TGisunInterface.Create;
   SetMessageSource(MessageSource);
   SetZagsUrl(CDefaultZagsUrl);
   SetGisunUrl(CDefaultGisunUrl);
   FUsername:='';                     
   FPassword:='';
   FDbUserAsGIS:=false;
   FPostUserName:=false;
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
   if (Operation=opGet) and (ActKind<>akGetPersonIdentif) then begin
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
   registerPersonIdentifRequest: wsGisun.register_person_identif_request;
   registerResponse: wsGisun.register_response;
   Person: wsGisun.ResponsePerson;
   Identif: wsGisun.ResponseIdentif;
   PersonCount: Integer;
   IdentifierCount: Integer;
   PersonInd: Integer;
   IdentifierInd: Integer;
   Table: TRegTable;
   Temp: TkbmMemTable;
   I: Integer;
   s:String;
   lOk:Boolean;

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
   if not CheckLogon then begin
     FFaultError:='����� �� ��������������.';
     FLog.Add('����� �� ��������������.');
     exit;
   end;
   case ActKind of
      //������ �� ��������� ������������ ������ �� �.�.�.
      akGetPersonIdentif: begin
         registerPersonIdentifRequest:=FGisun.CreateRegisterPersonIdentifRequest(MessageType);
         FRequestMessageId:=registerPersonIdentifRequest.cover.message_id;
         //����������� ������ �� ������� ������� � �������� �������
         Table:=FTableList.Find(True, akGetPersonIdentif, opGet);
         Input.First;
         if not Input.Eof then begin
            Input.Edit;
            Input.FieldByName('REQUEST_ID').AsString:=registerPersonIdentifRequest.request.request_id;
            Input.Post;
            if Table<>nil then begin
               Table.SetProp(registerPersonIdentifRequest.request, Input);
            end;
         end;
         registerResponse:=nil;
         try
            gisun.WriteTextLog('������ ��: '+registerPersonIdentifRequest.request.surname+' '+registerPersonIdentifRequest.request.name_+' '+registerPersonIdentifRequest.request.sname+' '+
                               registerPersonIdentifRequest.request.bdate, LOG_GISUN);

            SetOwnerForm(gisun.CurAkt);
            OpenMessage('     ������ �� ...          ','',0);
            try
              lOk:=FGisun.GetPersonIdentif(registerPersonIdentifRequest, registerResponse, FLog, FUsername, FPassword);
            finally
              CloseMessage;
              gisun.CheckMainForm;
            end;
            if lOk then begin
               Result:=rrOk;
               Output:=CreateOutputTable(akGetPersonalData); //akGetPersonIdentif
               //��������� ��������� ���������
               if registerResponse.cover.parent_message_id<>FRequestMessageId then begin
                  Result:=rrAfterError;
                  FFaultError:='������ ������ � ���������. �� ��������� �������������� ��������� ������� � ������.';
                  FLog.Add('!������: �� ��������� �������������� ���������')
               end;
               Table:=FTableList.Find(False, akGetPersonalData, opGet); //akGetPersonIdentif
               for I:=Low(registerResponse.response.personal_data) to High(registerResponse.response.personal_data) do begin
                  Person:=registerResponse.response.personal_data[I];
                  //������������ ������
                  if Person<>nil then begin
                     Output.Append;
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
               end;
            end
            else begin
               Result:=rrFault;
               Temp:=TkbmMemTable.Create(nil);
               CreateAndCopyMemTable(FGisun.Error, Temp);
               Error:=TDataSet(Temp);
               FFaultError:=FGisun.FaultError;
            end;
            if FFaultError<>'' then begin
              gisun.WriteTextLog('������ �� ������: '+FFaultError, LOG_GISUN);
            end;
         finally
            registerPersonIdentifRequest.Free;
            registerResponse.Free;
         end
      end;
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
      //������� ������ �� ������������ �����������
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

            if gisun.FEnableTextLog then begin
              s:='';
              if length(registerRequest.request.person_request)>0 then begin
                s:=s+' ������ ������ �� ��: [';
                for i:=0 to length(registerRequest.request.person_request)-1 do begin
                  s:=s+registerRequest.request.person_request[i].identif_number+' ';
                end;
                s:=Trim(s)+']';
              end;
              if length(registerRequest.request.identif_request)>0 then begin
                s:=s+' ������ ��['+IntToStr(length(registerRequest.request.identif_request))+']';
              end;
              if s<>'' then gisun.WriteTextLog(Trim(s),LOG_GISUN);
            end;
            SetOwnerForm(gisun.CurAkt);
            OpenMessage('     ������ ������ ...          ','',0);
            {$IFDEF GIS_THREAD}
              EnterWorkerThread;
            {$ENDIF}
            try
              lOk:=FGisun.GetPersonalData(registerRequest, registerResponse, FLog, FUsername, FPassword);
            finally
//              gisun.CurAkt.WriteToDebug([FormatDateTime('hh:mm:ss',Now)+'  ���������� ������� RegInt  1']);
              {$IFDEF GIS_THREAD}
                LeaveWorkerThread;
              {$ENDIF}
              CloseMessage;
              gisun.CheckMainForm;
            end;
            gisun.WriteTextLog('���������� ������� ������', LOG_GISUN);
            if lOk then begin
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
            end else begin
               Result:=rrFault;
               Temp:=TkbmMemTable.Create(nil);
               CreateAndCopyMemTable(FGisun.Error, Temp);
               Error:=TDataSet(Temp);
               FFaultError:=FGisun.FaultError;
            end;
            if FFaultError<>'' then begin
              gisun.WriteTextLog('������ ������ ������: '+FFaultError, LOG_GISUN);
            end;
//            gisun.CurAkt.WriteToDebug([FormatDateTime('hh:mm:ss',Now)+'  ���������� ������� RegInt  2']);
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

//---------------------------------------------------------------------------------
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

  //---------------------------------------------------------------------------------
  function CheckError(cover: MessageCover): TRequestResult;
  begin
    FError07:=false;
    if (ReturnCode<>nil) and (Length(ReturnCode.error_list)=0) then begin
       Result:=rrOk;
       if ReturnCode.cover.parent_message_id<>cover.message_id then begin
          Result:=rrAfterError;
          FFaultError:='������ ������ � ���������. �� ��������� �������������� ��������� ������� � ������.';
          FLog.Add('!������: �� ��������� �������������� ���������')
       end;
    end
    else begin
       if (ReturnCode<>nil) and (Length(ReturnCode.error_list)<>0) then begin
          //���� ������������
          if (Length(ReturnCode.error_list)=1) and (ReturnCode.error_list[0].error_code.code='07') then begin
             FError07:=true;
             Result:=rrOk;
          end
          else Result:=rrError;
       end
       else begin
          Result:=rrFault;
       end;
       Temp:=TkbmMemTable.Create(nil);
       CreateAndCopyMemTable(FZags.Error, Temp);
       Error:=TDataSet(Temp);
       FFaultError:=FZags.FaultError;
    end;
  end;
  //-----------------------------------------------------------------------------------
begin
   FLog.Clear;
   Error:=nil;
   FError07:=false;
   FFaultError:='';
   if MessageType='' then begin
      MessageType:=CMessageType[ActKind];
   end;
   FError07:=false;
   Result:=rrFault;

   if FTextLog<>''
     then gisun.WriteTextLog('����������� '+FTextLog,LOG_GISUN);

   if not CheckLogon then begin
     FFaultError:='����� �� ��������������.';
     FLog.Add('����� �� ��������������.');
     exit;
   end;
   Table:=FTableList.Find(True, ActKind, opPost);

   SetOwnerForm(gisun.CurAkt);
   OpenMessage('       ����������� ...       ','',0);
   try

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
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostBirthCertificate(birthActRequest, FLog, FUsername, FPassword);
            Result:=CheckError(birthActRequest.cover);
         finally
            birthActRequest.Free;
            ReturnCode.Free;
         end;
      end;
      //-------------������� ������ �� ������������ ���������-------------------------------------------------------
      akAffiliation: begin
         affActRequest:=FZags.CreateAffActRequest(MessageType, RequestMessageId);
         if Table<>nil then begin
            Table.SetProp(affActRequest, Input)
         end;
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostAffiliationCertificate(affActRequest, FLog, FUsername, FPassword);
            Result:=CheckError(affActRequest.cover);
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
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostMarriageCertificate(mrgActRequest, FLog, FUsername, FPassword);
            Result:=CheckError(mrgActRequest.cover);
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
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostDeceaseCertificate(dcsActRequest, FLog, FUsername, FPassword);
            Result:=CheckError(dcsActRequest.cover);
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
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostDivorceCertificate(dvcActRequest, FLog, FUsername, FPassword);
            Result:=CheckError(dvcActRequest.cover);
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
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostAdoptionCertificate(adpActRequest, FLog, FUsername, FPassword);
            Result:=CheckError(adpActRequest.cover);
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
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostNameChangeCertificate(cngActRequest, FLog, FUsername, FPassword);
            Result:=CheckError(cngActRequest.cover);
         finally
            cngActRequest.Free;
            ReturnCode.Free;
         end;
      end;
   end;

   finally
     CloseMessage;
     gisun.CheckMainForm;
   end;

   if gisun.FEnableTextLog then begin
     if FFaultError<>'' then begin
       gisun.WriteTextLog('            ������: '+FFaultError, LOG_GISUN);
     end else if (Result=rrOk) then begin
       if FError07
         then gisun.WriteTextLog('����������� � ���������� ������ (������������ ������)', LOG_GISUN)
         else gisun.WriteTextLog('����������� ������� ���������', LOG_GISUN);
     end else begin
       gisun.WriteTextLog('            ������', LOG_GISUN);
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
   if FGisun.FService<>nil then begin
     FGisun.FRIO.URL:=Value;
   end;
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
   if FZags.FService<>nil then begin
     FZags.FRIO.URL:=Value;
   end;
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

//---------------------------------------------------------
procedure TRegInt.SetVErsion(const Value: Integer);
begin
   FVersion:=Value;
end;

//---------------------------------------------------------
procedure TRegInt.SetDbUserAsGIS(const Value: Boolean);
begin
  FDbUserAsGIS := Value;
end;

//---------------------------------------------------------
procedure TRegInt.SetPostUserName(const Value: Boolean);
begin
  FPostUserName := Value;
end;

//---------------------------------------------------------
function TRegInt.CheckLogon: Boolean;
begin
{$IFDEF MY_PROJECT}
  Result:=Gisun.CheckLogon;
{$ELSE}
  Result:=true;
{$ENDIF}
end;

{ TRegFieldList }

function TRegFieldList.Add(Item: TRegField): Integer;
begin
   Result:=FList.Add(Item);
end;
//------------------------------------------------------------
function TRegFieldList.AddNew: TRegField;
begin
   Result:=TRegField.Create;
   Add(Result);
end;
//------------------------------------------------------------
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
//------------------------------------------------------------
constructor TRegFieldList.Create;
begin
   FList:=TList.Create;
end;
//------------------------------------------------------------
destructor TRegFieldList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;
//------------------------------------------------------------
function TRegFieldList.GetCount: Integer;
begin
   Result:=FList.Count;
end;
//------------------------------------------------------------
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
   Deaths: wsGisun.DeathList;

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
   Deaths:=nil;
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
                           else if PropType^=TypeInfo(wsGisun.DeathList) then begin
                              Deaths:=wsGisun.DeathList(GetOrdProp(Root, PropInfo));
                              Root:=nil;
                              if (Deaths<>nil) and (Length(Deaths)>0) then begin
                                 Root:=Deaths[0];
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
//            ShowMessageFmt('Name="%s" Path="%s"', [FFieldList[I].Name, FFieldList[I].Path]);
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

   procedure SetOrganName;
   var
      Field: TField;
      c: wsGisun.Classifier;
      lexema: wsGisun.LangValueList;
   begin                                       
      if DataField.AsString='0' then begin
         Field:=DataSet.FindField(DataField.FieldName+'_LEX');
         if (Field<>nil) and (Trim(Field.AsString)<>'') then begin
            c:=wsGisun.Classifier(GetObject(Root, PropInfo));
            SetLength(lexema, 1);
            lexema[0]:=wsGisun.value.Create;
            lexema[0].Text:=Trim(Field.AsString);
            lexema[0].lang:='RU';
            c.lexema:=lexema;
         end;
      end;
   end;               

begin
   Result:=False;
   First:=Root;
   for I:=0 to Pred(FFieldList.Count) do begin
      PropName:=FFieldList[I].Path;
      DataField:=DataSet.FieldByName(FFieldList[I].Name);
      //---- !!! -------------------------------------------------
      if Pos('_certificate_data.', PropName)> 0 then begin        // ��� ���������� ������� �������������
        if DataField.IsNull or (DataField.AsString='') then begin
          continue;
        end;
      end;
      //----------------------------------------------------------

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
                           IsSet:=True;
                           if DataField.AsString<>'' then begin
                             SetStrProp(GetObject(Root, PropInfo), 'Code', DataField.AsString);
                             if SameText(PropName, 'message_type') then begin
                               SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctActType);
                             end else if SameText(PropName, 'message_source') then begin
                               SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctZags);
                             end else if SameText(PropName, 'act_type') then begin
                               SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctActType);
                             end else if SameText(PropName, 'authority') then begin
                                //ctMVD
                                if (Root is wsGisun.Document) then begin
                                  SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctZags);
                                  SetOrganName;
                                end;
                                if (Root is wsGisun.ActData) then begin
                                  SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctZags);
                                  SetOrganName;
                                end;
                             end else if SameText(PropName, 'document_type') then begin
                               SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctDocType);
                             end else if SameText(PropName, 'sex') then begin
                               SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctPol);
                             end else if SameText(PropName, 'citizenship') then begin
                               SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctCountry);
                             end else if SameText(PropName, 'status') then begin
                               SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctStatus);
                             end else if SameText(PropName, 'country_b') then begin
                               SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctCountry);
                             end else if SameText(PropName, 'type_city_b') then begin
                               SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctTypeCity);
                             end else if SameText(PropName, 'death_cause') then begin
                                SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctDeathCause);
  //                              if Pos('.',DataField.AsString)=0
  //                                then SetOrdProp(GetObject(Root, PropInfo), 'Type_', 85)             // !!!
  //                                else SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctDeathCause);
                             end else if SameText(PropName, 'country_d') then begin
                               SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctCountry);
                             end else if SameText(PropName, 'type_city_d') then begin
                               SetOrdProp(GetObject(Root, PropInfo), 'Type_', ctTypeCity);
                             end;
                           end;
                        end
                        else if PropClass=TXSDate then begin
                           if DataField.IsNull then begin
//                             TXSDate(GetObject(Root, PropInfo)).XSToNative('');
                           end else begin
                             TXSDate(GetObject(Root, PropInfo)).AsDate:=DataField.AsDateTime;
                           end;
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
//            ShowMessageFmt('Name="%s" Path="%s"', [FFieldList[I].Name, FFieldList[I].Path]);
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
