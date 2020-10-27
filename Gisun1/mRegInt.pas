unit mRegInt;
interface
uses
   Windows, Classes, SysUtils, Graphics, ActiveX, DB, Forms, ImgList, Controls,
   Dialogs, StdCtrls, ExtCtrls, ShellApi, ComObj, Messages, TypInfo,
   kbmMemTable, mZags, wsZags, mGisun, wsGisun, XSBuiltIns;

type
   //Возможные результаты взаимодействия с регистром населения
   TRequestResult=(
      //До выполнения взаимодействия с регистром произошла непредвиденная ошибка
      //или ошибку обнаружила наша программа (например, во входных данных)
      rrBeforeError,
      //Произошёл обмен данными с регистром и при этом регистр не вернул ошибок
      rrOk,
      //Произошёл обмен данным с регистром, но регистр вернул ошибки
      rrError,
      //После обмена данными с регистром произошла непредвиденная ошибка
      //или ошибки обнаружила наша программа (например, в полученных из регистра данных)
      rrAfterError,
      //Не произошло взаимодействия с регистром в результате какого-либо сбоя
      //или отсутствия связи
      rrFault
   );

   //Типы актовых записей/запросов к регистру
   TActKind=(
      //Запрос на получение персональных данных
      akGetPersonalData,
      //Актовая запись о рождении
      akBirth,
      //Актовая запись об установлении отцовства
      akAffiliation,
      //Актовая запись о заключении брака
      akMarriage,
      //Актовая запись о смерти
      akDecease,
      //Актовая запись о расторжении брака
      akDivorce,
      //Актовая запись об усыновлении (удочерении)
      akAdoption,
      //Актовая запись о перемени имени
      akNameChange
   );

const
   //Типы сообщений (MessageCover.message_type)
   CMessageType: array [TActKind] of string=(
      //??? !!! существует ли такой тип
      '0001',   //Запрос на получение персональных данных (akGetPersonalData)
      '0100',   //Актовая запись о рождении (akBirth)
      '0200',   //Актовая запись об установлении отцовства (akAffiliation)
      '0300',   //Актовая запись о заключении брака (akMarriage)
      '0400',   //Актовая запись о смерти (akDecease)
      '0500',   //Актовая запись о расторжении брака (akDivorce)
      '0600',   //Актовая запись об усыновлении (удочерении) (akAdoption)
      '0700'    //Актовая запись о перемени имени (akNameChange)
   );

type
   //Виды операций по обмену данными с регистром
   TOperation=(
      //Получение данных
      opGet,
      //Передача данных
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

   //Интерфейс для обмена с регистром населения
   TRegInt=class(TObject)
   private
      //Сервис для передачи информации в регистр
      FZags: TZagsInterface;
      //Сервис для получения информации из регистра
      FGisun: TGisunInterface;
      //Текст сбоя или ошбки для последнего сеанса взаимодействия с регистром
      FFaultError: string;
      //Идентификатор последнего сообщения запроса данных из регистра
      FRequestMessageId: string;
      //ПАРАМЕТРЫ:
      //Орган загса/источник сообщений - должна устанавливать вызывающая программа
      //(!) Этот параметр не может оставаться пустым
      FMessageSource: string;
      //Адрес веб-сервиса для передачи информации в регистр из загса
      //По умолчанию http://agat-system.by:4569/gisun/zags/ws
      FZagsUrl: string;
      FZagsProxy: string;
      //Адрес веб-сервиса для зпроса информации из регистра
      //По умолчанию http://agat-system.by:4569/gisun/common/ws
      FGisunUrl: string;
      FGisunProxy: string;
      //Формат даты применяемый для обмена данными с регистром
      //По умолчанию yyyymmdd
      //FDateFormat: string;
      //Служебные поля:
      FLog: TStringList;
      //Список таблиц используемых для обмена данными с регистром
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
      //Функция читает метаинформацию, необходимую для создания таблиц, используемых
      //при вызове функций Get и Post
      //Эту функцию необходимо обязательно вызвать до первого вызова функций
      //CreateInputTable и CreateOutputTable
      //Входные параметры:
      //InputFile   - полный путь к файлу
      //OutputFile  - полный путь к файлу
      //Выходные параметры:
      //True        -
      //False       -
      function ReadMetaInfo(InputFile, OutputFile: string): Boolean;
      //Функция создаёт пустую таблицу, которую должна заполнить вызывающая процедура
      //перед тем как выполнить запрос данных из регистра с помощью функции Get
      //Входные параметры:
      //ActKind - Тип актовой записи, для которой требуется получить данные из регистра
      //          населения
      //Operation -
      //Выходные параметры:
      //Input   - Набор данных передаваемых в регистр. Структура этой таблицы
      //          зависит от типа актовой записи. После создания таблица открывается.
      function CreateInputTable(ActKind: TActKind; Operation: TOperation): TDataSet;
      //Функция для получения данных из регистра населения
      //Входные параметры:
      //ActKind - Тип актовой записи, для которой требуется получить данные из регистра
      //          населения
      //MessageType - Тип сообщения (код вида операции органа ЗАГС) <nnnn>
      //              На данный момент может оставаться пустым
      //Input   - Набор данных передаваемых в регистр. Структура этой таблицы
      //          зависит от типа актовой записи. Эта таблица создаётся, заполняется
      //          и уничтожается вызывающей процедурой. Для создания таблицы необходимо
      //          использовать функцию CreateInputTable. На момент вызова функции
      //          Get таблица должна быть открыта в режиме просмотра на первой записи.
      //Выходные параметры:
      //Output  - Набор данных получаемых из регистра. Структура этой таблицы
      //          зависит от типа актовой записи. Эта таблица создаётся и заполняется
      //          функцией Get. Уничтожать процедуру должна вызывающая процедура. На
      //          момент выхода из функции Get таблица должна быть открыта в режиме
      //          просмотра на первой записи. Таблица создаётся функцией
      //          Get, только при успешном получении данных из регистра, иначе
      //          возвращается nil.
      //Error   - Список ошибок возвращаемых регистром. Эта таблица создаётся и заполняется
      //          функцией Get. Уничтожать процедуру должна вызывающая процедура. На
      //          момент выхода из функции Get таблица должна быть открыта в режиме
      //          просмотра на первой записи.Таблица создаётся функцией
      //          Get, только при наличии ошибок, иначе возвращается nil.
      //Результат функции:
      //rrFault       - Не произошло взаимодействия с регистром в результате какого-либо
      //                сбоя или отсутствия связи. Выходные параметры Output и Error равны
      //                nil. Текст ошибки содержит поле FaultError
      //rrBeforeError - В данные момент аналогично rrFault
      //rrOk          - Произошёл обмен данными с регистром и при этом регистр не вернул
      //                ошибок. Выходной параметр Output содержит полученные данные,
      //                а Error равен nil
      //rrError       - Произошёл обмен данным с регистром, но регистр вернул ошибки
      //                Выходной параметр Output содержит полученные данные, а Error
      //                содержит список ошибок, которые вернул регистр.
      //rrAfterError  - После обмена данными с регистром произошла непредвиденная ошибка
      //                или ошибки обнаружила наша программа (например, в полученных из
      //                регистра данных). Выходной параметр Output содержит полученные
      //                данные, Error равен nil, FaultError содержит текст ошибки
      function Get(ActKind: TActKind; MessageType: string; const Input: TDataSet; var Output, Error: TDataSet): TRequestResult;
      //
      function Post(RequestMessageId: string; ActKind: TActKind; MessageType: string; const Input: TDataSet; var Error: TDataSet): TRequestResult;
      procedure DataSetAllFieldUpper(ds:TDataSet);
   public
      property FaultError: string read FFaultError;
      property RequestMessageId: string read FRequestMessageId;
      //ПАРАМЕТРЫ:
      property MessageSource: string read FMessageSource write SetMessageSource;
      property ZagsUrl: string read FZagsUrl write SetZagsUrl;
      property ZagsProxy: string read FZagsProxy write SetZagsProxy;
      property GisunUrl: string read FGisunUrl write SetGisunUrl;
      property GisunProxy: string read FGisunProxy write SetGisunProxy;
      property PostIsUpper:Boolean read FPostIsUpper write SetPostIsUpper;
      property Version:Integer read FVersion write SetVersion;
      //property DateFormat: string read FDateFormat write FDateFormat;
      //Журнал
      property Log: TStringList read FLog;
      //
      property TableList: TRegTableList read FTableList;
   end;

{ Работа с таблицами }

function CreateMemTable(FieldList: array of const; AutoCreate, AutoOpen: Boolean): TkbmMemTable;
procedure CreateAndCopyMemTable(Src: TDataSet; Dst: TkbmMemTable);
function CreateErrorTable: TDataSet;

implementation


{ Работа с таблицами }

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
   //???значность
   Result:=CreateMemTable([
      'ERROR_CODE',    Integer(ftString),    10,  //Тип ошибки
      'ERROR_TEXT',    Integer(ftString),   250,  //Текст ошибки
      'ERROR_PLACE',   Integer(ftString),   250,  //Место возникновения ошибки
      'WRONG_VALUE',   Integer(ftString),   250,  //Неправильное значение
      'CORRECT_VALUE', Integer(ftString),   250,  //Правильное значение
      'CHECK_NAME',    Integer(ftString),   250   //Название проверяемого элемента
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
   //Проверка важных параметров
   Assert(MessageSource<>'', 'Метод TRegInt.Create. Не установлен параметр MessageSource');
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
   //Информация об актовой записи
   //1. Тип актовой записи
   act_data.act_type:=FZags.CreateClassifier(DataSet.FieldByName(Prefix+'TIP').AsString, ctActType);
   //2. Гос. орган, осуществивший актовую запись
   act_data.authority:=FZags.CreateClassifier(DataSet.FieldByName(Prefix+'ORGAN').AsString, ctZags);
   //3. Дата актовой записи
   act_data.date:=FZags.CreateDate(DataSet.FieldByName(Prefix+'DATE').AsDateTime);
   //4. Номер актовой записи
   act_data.number:=DataSet.FieldByName(Prefix+'NOMER').AsString;
end;
}
{
procedure TRegInt.DataSetToDocument(Prefix: string; doc: wsZags.Document; DataSet: TDataSet);
begin
   //Документ
   //6.1. Тип документа
   doc.document_type:=FZags.CreateClassifier(DataSet.FieldByName(Prefix+'TIP').AsString, ctDocType);
   //6.2. Гос. орган, выдавший документ
   doc.authority:=FZags.CreateClassifier(DataSet.FieldByName(Prefix+'ORGAN').AsString, ctZags);
   //6.3. Дата выдачи
   doc.date_of_issue:=FZags.CreateDate(DataSet.FieldByName(Prefix+'DATE').AsDateTime);
   //6.4. Срок действия документа
   //doc.expire_date
   //6.5. Серия документа
   doc.series:=DataSet.FieldByName(Prefix+'SERIA').AsString;
   //6.6. Номер документа
   doc.number:=DataSet.FieldByName(Prefix+'NOMER').AsString;
end;
}
{
procedure TRegInt.DataSetToPersonalData(Prefix: string; personal_data: wsZags.PersonalData; DataSet: TDataSet);
begin
   //Персональные данные
   //1. Персональный номер
   personal_data.identif:=DataSet.FieldByName(Prefix+'IDENTIF').AsString;
   //2. Фамилия на русском языке
   personal_data.last_name:=DataSet.FieldByName(Prefix+'FAMILIA').AsString;
   //3. Фамилия на белорусском языке
   personal_data.last_name_bel:=DataSet.FieldByName(Prefix+'FAMILIA_B').AsString;
   //4. Фамилия латинская
   //personal_data.last_name_lat
   //5. Имя на русском языке
   personal_data.name_:=DataSet.FieldByName(Prefix+'NAME').AsString;
   //6. Имя на белорусском языке
   personal_data.name_bel:=DataSet.FieldByName(Prefix+'NAME_B').AsString;
   //7. Имя латинское
   //personal_data.name_lat
   //8. Отчество на русском языке
   personal_data.patronymic:=DataSet.FieldByName(Prefix+'OTCH').AsString;
   //9. Отчество на белорусском языке
   personal_data.patronymic_bel:=DataSet.FieldByName(Prefix+'OTCH_B').AsString;
   //10. Отчество латинское
   //personal_data.patronymic_lat
   //11. Пол
   personal_data.sex:=FZags.CreateClassifier(DataSet.FieldByName(Prefix+'POL').AsString, ctPol);
   //12. Дата рождения
   personal_data.birth_day:=DataSet.FieldByName(Prefix+'DATER').AsString;//FormatDate(DataSet.FieldByName(Prefix+'DATER').AsDateTime);
   //13. Место рождения
   //13.1. Страна рождения
   //personal_data.birth_place.country_b
   //13.2. Область рождения
   //personal_data.birth_place.area_b
   //13.3. Область рождения на белорусском языке
   //personal_data.birth_place.area_b_bel
   //13.4. Район рождения
   //personal_data.birth_place.region_b
   //13.5. Район рождения на белорусском языке
   //personal_data.birth_place.region_b_bel
   //13.6. Тип населённого пункта
   //personal_data.birth_place.type_city_b
   //13.7. Населённый пункт на русском языке
   //personal_data.birth_place.city_b
   //13.8. Населённый пункт на белорусском языке
   //personal_data.birth_place.city_b_bel
   //14. Гражданство
   personal_data.citizenship:=FZags.CreateClassifier(DataSet.FieldByName(Prefix+'GRAJD').AsString, ctCountry);
   //15. Статус
   personal_data.status:=FZags.CreateClassifier(DataSet.FieldByName(Prefix+'STATUS').AsString, ctStatus);
   //16. Список адресов
   //personal_data.addresses
   //17. Список документов
   //personal_data.documents
   //18. Список семейных связей
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
      //Запрос на получение персональных данных
      akGetPersonalData,
      //Актовая запись о рождении
      akBirth,
      //Ребёнок - CHILD
      //Отец    - ON
      //Мать    - ONA
      //Актовая запись об установлении отцовства
      akAffiliation,
      //1. Ребёнок - CHILD
      //2. Отец    - ON
      //3. Мать    - ONA
      //Актовая запись о заключении брака
      akMarriage,
      //1. Жених   - ON
      //2. Невеста - ONA
      //Актовая запись о смерти
      akDecease,
      //Данные об умершем
      //Актовая запись о расторжении брака
      akDivorce,
      //Жена  - ONA
      //Муж   - ON
      //Актовая запись об усыновлении (удочерении)
      akAdoption,
      //Ребёнок         - CHILD
      //Мать            - ONA
      //Отец            - ON
      //Усыновительница - ONA2
      //Усыновитель     - ON2
      //Актовая запись о перемени имени
      akNameChange
      //Персональные данные лица
      : begin
         //Считаем количество запросов идентификаторов и персональных данных
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
               //Проверяем заголовок сообщения
               if registerResponse.cover.parent_message_id<>FRequestMessageId then begin
                  Result:=rrAfterError;
                  FFaultError:='Ошибка обмена с регистром. Не совпадают идентификаторы сообщений запроса и ответа.';
                  FLog.Add('!ОШИБКА: не совпадают идентификаторы сообщений')
               end;
               //
               Table:=FTableList.Find(False, akGetPersonalData, opGet);
               Input.First;
               while not Input.Eof do begin
                  if Input.FieldByName('IS_PERSON').AsBoolean then begin
                     Person:=FindPersonData(Input.FieldByName('REQUEST_ID').AsString, registerResponse.response.personal_data);
                     //Персональные данные
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
                        FFaultError:='Ошибка обмена с регистром. Не найден идентификатор запроса персональных данных.';
                        FLog.Add('!ОШИБКА: не совпадают идентификаторы запросов персональных данных')
                     end;
                  end
                  else begin
                     Identif:=FindResponseIdentif(Input.FieldByName('REQUEST_ID').AsString, registerResponse.response.identif_number);
                     //Персональные данные
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
                        FFaultError:='Ошибка обмена с регистром. Не найден идентификатор запроса личного номера.';
                        FLog.Add('!ОШИБКА: не совпадают идентификаторы запросов личного номера')
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
   //Персональный номер
   DataSet.FieldByName(Prefix+'IDENTIF').AsString:=personal_data.data.identif;
   //Фамилия на русском языке
   DataSet.FieldByName(Prefix+'FAMILIA').AsString:=personal_data.data.last_name;
   //Фамилия на белорусском языке
   DataSet.FieldByName(Prefix+'FAMILIA_B').AsString:=personal_data.data.last_name_bel;
   //Имя на русском языке
   DataSet.FieldByName(Prefix+'NAME').AsString:=personal_data.data.name_;
   //Имя на белорусском языке
   DataSet.FieldByName(Prefix+'NAME_B').AsString:=personal_data.data.name_bel;
   //Отчество на русском языке
   DataSet.FieldByName(Prefix+'OTCH').AsString:=personal_data.data.patronymic;
   //Отчество на белорусском языке
   DataSet.FieldByName(Prefix+'OTCH_B').AsString:=personal_data.data.patronymic_bel;
   //Пол
   DataSet.FieldByName(Prefix+'POL').AsString:=personal_data.data.sex.code;
   //Дата рождения
   DataSet.FieldByName(Prefix+'DATER').AsString:=personal_data.data.birth_day;//.AsDateTime:=StringToDate(personal_data.data.birth_day);
   //Гражданство
   DataSet.FieldByName(Prefix+'GRAJD').AsString:=personal_data.data.citizenship.code;
   //Статус
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

   // в зависимомти от параметра FPostIsUpper перевести все строковые поля в верхний регистр
   DataSetAllFieldUpper(Input);

   case ActKind of
      //Актовая запись о рождении
      akBirth: begin
         //Заполнение данных для передачи в регистр
         birthActRequest:=FZags.CreateBirthActRequest(MessageType, RequestMessageId);
         if Table<>nil then begin
            Table.SetProp(birthActRequest, Input)
         end;
         {
         //1. Персональные данные ребёнка
         //1.1. Персональный номер
         birthActRequest.birth_cert_data.child_data.identif:=Input.FieldByName('IDENTIF').AsString;
         //1.2. Фамилия на русском языке
         birthActRequest.birth_cert_data.child_data.last_name:=Input.FieldByName('FAMILIA').AsString;
         //1.3. Фамилия на белорусском языке
         birthActRequest.birth_cert_data.child_data.last_name_bel:=Input.FieldByName('FAMILIA_B').AsString;
         //1.4. Фамилия латинская
         //birthActRequest.birth_cert_data.child_data.last_name_lat
         //1.5. Имя на русском языке
         birthActRequest.birth_cert_data.child_data.name_:=Input.FieldByName('NAME').AsString;
         //1.6. Имя на белорусском языке
         birthActRequest.birth_cert_data.child_data.name_bel:=Input.FieldByName('NAME_B').AsString;
         //1.7. Имя латинское
         //birthActRequest.birth_cert_data.child_data.name_lat
         //1.8. Отчество
         //birthActRequest.birth_cert_data.child_data.patronymic
         //1.9. Отчество белорусское
         //birthActRequest.birth_cert_data.child_data.patronymic_bel
         //1.10. Отчество латинское
         //birthActRequest.birth_cert_data.child_data.patronymic_lat
         //1.11. Пол
         birthActRequest.birth_cert_data.child_data.sex:=FZags.CreateClassifier(Input.FieldByName('POL').AsString);
         //1.2. Дата рождения
         birthActRequest.birth_cert_data.child_data.birth_day:=Input.FieldByName('DATER').AsString;//FormatDate(Input.FieldByName('DATER').AsDateTime);
         //1.13. Место рождения
         //1.13.1. Страна рождения
         birthActRequest.birth_cert_data.child_data.birth_place.country_b:=FZags.CreateClassifier(Input.FieldByName('GOSUD').AsString);
         //1.13.2. Область рождения
         //birthActRequest.birth_cert_data.child_data.birth_place.area_b
         //1.13.3. Область рождения на белорусском языке
         //birthActRequest.birth_cert_data.child_data.birth_place.area_b_bel
         //1.13.4. Район рождения
         //birthActRequest.birth_cert_data.child_data.birth_place.region_b
         //1.13.5. Район рождения на белорусском языке
         //birthActRequest.birth_cert_data.child_data.birth_place.region_b_bel
         //1.13.6. Тип населённого пункта
         birthActRequest.birth_cert_data.child_data.birth_place.type_city_b:=FZags.CreateClassifier(Input.FieldByName('TIP_PUNKT_R').AsString);
         //1.13.7. Населённый пункт на русском языке
         birthActRequest.birth_cert_data.child_data.birth_place.city_b:=Input.FieldByName('GOROD').AsString;
         //1.13.8. Населённый пункт на белорусском языке
         birthActRequest.birth_cert_data.child_data.birth_place.city_b_bel:=Input.FieldByName('GOROD_B').AsString;
         //1.14. Гражданство
         birthActRequest.birth_cert_data.child_data.citizenship:=FZags.CreateClassifier(Input.FieldByName('GRAJD').AsString);
         //1.15. Статус
         birthActRequest.birth_cert_data.child_data.status:=FZags.CreateClassifier(Input.FieldByName('STATUS').AsString);
         //1.16. Список адресов
         //birthActRequest.birth_cert_data.child_data.addresses
         //1.17. Список документов
         //birthActRequest.birth_cert_data.child_data.documents
         //1.18. Список семейных связей
         //birthActRequest.birth_cert_data.child_data.family
         //2. Персональные данные матери
         DataSetToPersonalData('ONA_', birthActRequest.birth_cert_data.mother_data, Input);
         //3. Персональные данные отца
         DataSetToPersonalData('ON_', birthActRequest.birth_cert_data.father_data, Input);
         //4. Основание записи сведений об отце (свидетельство о заключении брака)
         //4.1. Тип актовой записи
         //birthActRequest.birth_cert_data.marriage_cert.act_type
         //4.2. Гос. орган, осуществивший актовую запись (отдел ЗАГС)
         //birthActRequest.birth_cert_data.marriage_cert.authority
         //4.3. Дата актовой записи
         //birthActRequest.birth_cert_data.marriage_cert.date
         //4.4. Номер актовой записи
         //birthActRequest.birth_cert_data.marriage_cert.number
         //5. Информация об актовой записи
         DataSetToActData('ACT_', birthActRequest.birth_cert_data.birth_act_data, Input);
         //6. Информация о печатном документе
         DataSetToDocument('DOC_', birthActRequest.birth_cert_data.birth_certificate_data, Input);
         }
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostBirthCertificate(birthActRequest, FLog);
            if (ReturnCode<>nil) and (Length(ReturnCode.error_list)=0) then begin
               Result:=rrOk;
               if ReturnCode.cover.parent_message_id<>birthActRequest.cover.message_id then begin
                  Result:=rrAfterError;
                  FFaultError:='Ошибка обмена с регистром. Не совпадают идентификаторы сообщений запроса и ответа.';
                  FLog.Add('!ОШИБКА: не совпадают идентификаторы сообщений')
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
      //Актовая запись об установлении отцовства
      akAffiliation: begin
         affActRequest:=FZags.CreateAffActRequest(MessageType, RequestMessageId);
         if Table<>nil then begin
            Table.SetProp(affActRequest, Input)
         end;
         {
         //Заполнение данных для передачи в регистр
         //Акт об установлении отцовства
         //1. Сведения о лице, в отношении которого устанавливается отцовство
         //1.1. Информация об акте о рождении
         DataSetToActData('R_', affActRequest.aff_cert_data.aff_person.birth_act_data, Input);
         //1.2. Персональные данные лица до установления отцовства
         DataSetToPersonalData('DO_', affActRequest.aff_cert_data.aff_person.before_aff_person_data, Input);
         //1.3. Персональные данные лица после установления отцовства
         DataSetToPersonalData('PO_', affActRequest.aff_cert_data.aff_person.after_aff_person_data, Input);
         //1.3.13. Место рождения
         //1.3.13.1. Страна рождения
         affActRequest.aff_cert_data.aff_person.after_aff_person_data.birth_place.country_b:=FZags.CreateClassifier(Input.FieldByName('PO_GOSUD').AsString);
         //1.3.13.2. Область рождения
         //affActRequest.aff_cert_data.aff_person.after_aff_person_data.birth_place.area_b: WideString;
         //1.3.13.3. Область рождения на белорусском
         //affActRequest.aff_cert_data.aff_person.after_aff_person_data.birth_place.area_b_bel: WideString;
         //1.3.13.4. Район рождения
         //affActRequest.aff_cert_data.aff_person.after_aff_person_data.birth_place.region_b: WideString;
         //1.3.13.5. Район рождения на белорусском
         //affActRequest.aff_cert_data.aff_person.after_aff_person_data.birth_place.region_b_bel: WideString;
         //1.3.13.6. Тип населённого пункта рождения
         affActRequest.aff_cert_data.aff_person.after_aff_person_data.birth_place.type_city_b:=FZags.CreateClassifier(Input.FieldByName('PO_TIP_PUNKT_R').AsString);
         //1.3.13.7. Населённый пункт рождения
         affActRequest.aff_cert_data.aff_person.after_aff_person_data.birth_place.city_b:=Input.FieldByName('PO_GOROD').AsString;
         //1.3.13.8. Населённый пункт рождения на белоруском
         affActRequest.aff_cert_data.aff_person.after_aff_person_data.birth_place.city_b_bel:=Input.FieldByName('PO_GOROD_B').AsString;
         //2. Персональные данные матери
         DataSetToPersonalData('ONA_', affActRequest.aff_cert_data.mother_data, Input);
         //3. Персональные данные отца
         DataSetToPersonalData('ON_', affActRequest.aff_cert_data.father_data, Input);
         //4. Основание записи акта об установлении отцовства - решение суда
         //4.1. Тип актовой записи
         //affActRequest.aff_cert_data.court_decision.act_type: Classifier;
         //4.2. Гос. орган, осуществивший актовую запись (отдел ЗАГС)
         //affActRequest.aff_cert_data.court_decision.authority: Classifier;
         //4.3. Дата актовой записи
         //affActRequest.aff_cert_data.court_decision.date: TXSDate;
         //4.4. Номер актовой записи
         //affActRequest.aff_cert_data.court_decision.number: WideString;
         //5. Информация об актовой записи
         DataSetToActData('ACT_', affActRequest.aff_cert_data.aff_act_data, Input);
         //6. Информация о печатном документе
         DataSetToDocument('DOC_', affActRequest.aff_cert_data.aff_certificate_data, Input);
         }
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostAffiliationCertificate(affActRequest, FLog);
            if (ReturnCode<>nil) and (Length(ReturnCode.error_list)=0) then begin
               Result:=rrOk;
               if ReturnCode.cover.parent_message_id<>affActRequest.cover.message_id then begin
                  Result:=rrAfterError;
                  FFaultError:='Ошибка обмена с регистром. Не совпадают идентификаторы сообщений запроса и ответа.';
                  FLog.Add('!ОШИБКА: не совпадают идентификаторы сообщений')
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
      //Актовая запись о заключении брака
      akMarriage: begin
         mrgActRequest:=FZags.CreateMarriageActRequest(MessageType, RequestMessageId);
         if Table<>nil then begin
            Table.SetProp(mrgActRequest, Input)
         end;
         {
         //Заполнение данных для передачи в регистр
         //Акт о заключении брака
         //1. Информация о невесте
         //1.1. Персональные данные невесты
         DataSetToPersonalData('ONA_', mrgActRequest.mrg_cert_data.bride.bride_data, Input);
         //1.2. Фамилия до заключения брака
         mrgActRequest.mrg_cert_data.bride.old_last_name:=Input.FieldByName('ONA_FAMILIA_OLD').AsString;
         //2. Информация о женихе
         //2.1. Персональные данные жениха
         DataSetToPersonalData('ON_', mrgActRequest.mrg_cert_data.bridegroom.bridegroom_data, Input);
         //2.2. Фамилия до заключения брака
         mrgActRequest.mrg_cert_data.bridegroom.old_last_name:=Input.FieldByName('ON_FAMILIA_OLD').AsString;
         //3. Сведения о совместных детях, не достигших 18 лет
         //mrgActRequest.mrg_cert_data.joint_child
         //4. Информация об актовой записи
         DataSetToActData('ACT_', mrgActRequest.mrg_cert_data.mrg_act_data, Input);
         //5. Информация о печатном документе
         DataSetToDocument('DOC_', mrgActRequest.mrg_cert_data.mrg_certificate_data, Input);
         }
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostMarriageCertificate(mrgActRequest, FLog);
            if (ReturnCode<>nil) and (Length(ReturnCode.error_list)=0) then begin
               Result:=rrOk;
               if ReturnCode.cover.parent_message_id<>mrgActRequest.cover.message_id then begin
                  Result:=rrAfterError;
                  FFaultError:='Ошибка обмена с регистром. Не совпадают идентификаторы сообщений запроса и ответа.';
                  FLog.Add('!ОШИБКА: не совпадают идентификаторы сообщений')
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
      //Актовая запись о смерти
      akDecease: begin
         dcsActRequest:=FZags.CreateDeceaseActRequest(MessageType, RequestMessageId);
         if Table<>nil then begin
            Table.SetProp(dcsActRequest, Input)
         end;
         {
         //Заполнение данных для передачи в регистр
         //Акт о смерти
         //Персональные данные умершего
         DataSetToPersonalData('', dcsActRequest.dcs_cert_data.person_data, Input);
         //Информация о смерти
         //Причина смерти
         dcsActRequest.dcs_cert_data.decease_data.death_cause:=FZags.CreateClassifier(Input.FieldByName('SM_PRICH').AsString);
         //Дата смерти
         dcsActRequest.dcs_cert_data.decease_data.death_date:=Input.FieldByName('SM_DATE').AsString;//FormatDate(Input.FieldByName('SM_DATE').AsDateTime);
         //Место смерти
         //Страна
         dcsActRequest.dcs_cert_data.decease_data.decease_place.country_d:=FZags.CreateClassifier(Input.FieldByName('GOSUD').AsString);
         //Область
         //dcsActRequest.dcs_cert_data.decease_data.decease_place.area_d: WideString;
         //Область
         //dcsActRequest.dcs_cert_data.decease_data.decease_place.area_d_bel: WideString;
         //Район
         //dcsActRequest.dcs_cert_data.decease_data.decease_place.region_d: WideString;
         //Район
         //dcsActRequest.dcs_cert_data.decease_data.decease_place.region_d_bel: WideString;
         //Тип населённого пункта
         dcsActRequest.dcs_cert_data.decease_data.decease_place.type_city_d:=FZags.CreateClassifier(Input.FieldByName('TIP_PUNKT_S').AsString);
         //Населённый пункт на русском языке
         dcsActRequest.dcs_cert_data.decease_data.decease_place.city_d:=Input.FieldByName('GOROD').AsString;
         //Населённый пункт на белорусском языке
         dcsActRequest.dcs_cert_data.decease_data.decease_place.city_d_bel:=Input.FieldByName('GOROD_B').AsString;
         //Смерть последовала в
         //dcsActRequest.dcs_cert_data.decease_data.death_place: WideString;
         //Место захоронения
         //dcsActRequest.dcs_cert_data.decease_data.burial_place: WideString;
         //Документ, подтверждающий факт смерти
         dcsActRequest.dcs_cert_data.reason:=Input.FieldByName('SM_DOC').AsString;
         //Информация об актовой записи
         DataSetToActData('ACT_', dcsActRequest.dcs_cert_data.dcs_act_data, Input);
         //Информация о печатном документе
         DataSetToDocument('DOC_', dcsActRequest.dcs_cert_data.dcs_certificate_data, Input);
         }
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostDeceaseCertificate(dcsActRequest, FLog);
            if (ReturnCode<>nil) and (Length(ReturnCode.error_list)=0) then begin
               Result:=rrOk;
               if ReturnCode.cover.parent_message_id<>dcsActRequest.cover.message_id then begin
                  Result:=rrAfterError;
                  FFaultError:='Ошибка обмена с регистром. Не совпадают идентификаторы сообщений запроса и ответа.';
                  FLog.Add('!ОШИБКА: не совпадают идентификаторы сообщений')
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
      //Актовая запись о расторжении брака
      akDivorce: begin
         dvcActRequest:=FZags.CreateDivorceActRequest(MessageType, RequestMessageId);
         if Table<>nil then begin
            Table.SetProp(dvcActRequest, Input)
         end;
         {
         //Заполнение данных для передачи в регистр
         //Акт о расторжении брака
         //1. Информация о жене
         //1.1. Персональные данные жены
         DataSetToPersonalData('ONA_', dvcActRequest.dvc_cert_data.wife.wife_data, Input);
         //
         dvcActRequest.dvc_cert_data.wife.wife_data.birth_place.country_b:=FZags.CreateClassifier(Input.FieldByName('ONA_GOSUD').AsString);
         dvcActRequest.dvc_cert_data.wife.wife_data.birth_place.city_b:=Input.FieldByName('ONA_GOROD').AsString;
         //1.2. Фамилия до расторжения брака
         dvcActRequest.dvc_cert_data.wife.old_last_name:=Input.FieldByName('ONA_FAMILIA_OLD').AsString;
         //2. Информация о муже
         //2.1. Персональные данные мужа
         DataSetToPersonalData('ON_', dvcActRequest.dvc_cert_data.husband.husband_data, Input);
         //2.2. Фамилия до расторжения брака
         dvcActRequest.dvc_cert_data.husband.old_last_name:=Input.FieldByName('ON_FAMILIA_OLD').AsString;
         //3. Информация об акте о регистрации брака
         DataSetToActData('BRAK_', dvcActRequest.dvc_cert_data.mrg_act_data, Input);
         //4. Сведения о совместных детях, не достигших 18 лет
         //dvcActRequest.dvc_cert_data.joint_child: Array_Of_joint_child2;
         //5. Основание записи акта о расторжении брака  - решение суда
         //dvcActRequest.dvc_cert_data.court_decision: ActData;
         //6. Информация об актовой записи
         DataSetToActData('ACT_', dvcActRequest.dvc_cert_data.dvc_act_data, Input);
         //7. Информация о печатном документе (свидетельство для бывшей жены)
         DataSetToDocument('ONA_', dvcActRequest.dvc_cert_data.dvc_wm_certificate_data, Input);
         //8. Информация о печатном документе (свидетельство для бывшего мужа)
         DataSetToDocument('ON_', dvcActRequest.dvc_cert_data.dvc_mn_certificate_data, Input);
         }
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostDivorceCertificate(dvcActRequest, FLog);
            if (ReturnCode<>nil) and (Length(ReturnCode.error_list)=0) then begin
               Result:=rrOk;
               if ReturnCode.cover.parent_message_id<>dvcActRequest.cover.message_id then begin
                  Result:=rrAfterError;
                  FFaultError:='Ошибка обмена с регистром. Не совпадают идентификаторы сообщений запроса и ответа.';
                  FLog.Add('!ОШИБКА: не совпадают идентификаторы сообщений')
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
      //Актовая запись об усыновлении (удочерении)
      akAdoption: begin
         adpActRequest:=FZags.CreateAdoptionActRequest(MessageType, RequestMessageId);
         if Table<>nil then begin
            Table.SetProp(adpActRequest, Input)
         end;
         {
         //Заполнение данных для передачи в регистр
         //Акт об усыновлении (удочерении)
         //1. Сведения об усыновляемом
         //1.1. Идентификационный номер усыновляемого
         adpActRequest.adp_cert_data.adp_child.identif:=Input.FieldByName('IDENTIF').AsString;
         //1.2. Сведения об усыновляемом до усыновления
         //1.2.1. Персональные данные усыновляемого до усыновления
         DataSetToPersonalData('DO_', adpActRequest.adp_cert_data.adp_child.before_adp_child.before_adp_child_data, Input);
         //1.2.2. Информация об акте о рождении (до усыновления)
         DataSetToActData('DO_', adpActRequest.adp_cert_data.adp_child.before_adp_child.before_adp_birth_act_data, Input);
         //1.3. Сведения об усыновляемом после усыновления
         //1.3.1. Персональные данные усыновляемого после усыновления
         DataSetToPersonalData('PO_', adpActRequest.adp_cert_data.adp_child.after_adp_child.after_adp_child_data, Input);
         adpActRequest.adp_cert_data.adp_child.after_adp_child.after_adp_child_data.birth_place.country_b:=FZags.CreateClassifier(Input.FieldByName('PO_GOSUD').AsString);
         //Область
         //area_d: WideString;
         //Область
         //area_d_bel: WideString;
         //Район
         //region_d: WideString;
         //Район
         //region_d_bel: WideString;
         //Тип населённого пункта
         adpActRequest.adp_cert_data.adp_child.after_adp_child.after_adp_child_data.birth_place.type_city_b:=FZags.CreateClassifier(Input.FieldByName('PO_TIP_PUNKT_R').AsString);
         //Населённый пункт на русском языке
         adpActRequest.adp_cert_data.adp_child.after_adp_child.after_adp_child_data.birth_place.city_b:=Input.FieldByName('PO_GOROD').AsString;
         //Населённый пункт на белорусском языке
         adpActRequest.adp_cert_data.adp_child.after_adp_child.after_adp_child_data.birth_place.city_b_bel:=Input.FieldByName('PO_GOROD_B').AsString;
         //1.3.2. Информация об акте о рождении (после усыновления)
         DataSetToActData('PO_', adpActRequest.adp_cert_data.adp_child.after_adp_child.after_adp_birth_act_data, Input);
         //2. Персональные данные матери
         DataSetToPersonalData('ONA_', adpActRequest.adp_cert_data.mother_data, Input);
         //3. Персональные данные отца
         DataSetToPersonalData('ON_', adpActRequest.adp_cert_data.father_data, Input);
         //4. Персональные данные усыновительницы
         DataSetToPersonalData('ONA2_', adpActRequest.adp_cert_data.adp_mother_data, Input);
         //5. Персональные данные усыновителя
         DataSetToPersonalData('ON2_', adpActRequest.adp_cert_data.adp_father_data, Input);
         //6. Сведения о регистрации заключения брака
         //6.1. Признак заключения брака
         adpActRequest.adp_cert_data.marriage.mrg_flag:=wsZags.MarrFlag(Input.FieldByName('BRAK_FLAG').AsInteger);
         //6.2. Информация об акте о заключении брака
         DataSetToActData('BRAK_', adpActRequest.adp_cert_data.marriage.mrg_cert_data, Input);
         //7. Основание записи акта об усыновлении (удочерении) - решение суда
         //DataSetToActData('SUD_', adpActRequest.court_decision, Input);
         //8. Записываются ли усыновители родителями ребёнка
         adpActRequest.adp_cert_data.parents_flag:=wsZags.ParentsFlag(Input.FieldByName('RODIT_FLAG').AsInteger);
         //9. Информация об актовой записи
         DataSetToActData('ACT_', adpActRequest.adp_cert_data.adp_act_data, Input);
         //10. Информация о печатном документе
         DataSetToDocument('DOC_', adpActRequest.adp_cert_data.adp_certificate_data, Input);
         }
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostAdoptionCertificate(adpActRequest, FLog);
            if (ReturnCode<>nil) and (Length(ReturnCode.error_list)=0) then begin
               Result:=rrOk;
               if ReturnCode.cover.parent_message_id<>adpActRequest.cover.message_id then begin
                  Result:=rrAfterError;
                  FFaultError:='Ошибка обмена с регистром. Не совпадают идентификаторы сообщений запроса и ответа.';
                  FLog.Add('!ОШИБКА: не совпадают идентификаторы сообщений')
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
      //Актовая запись о перемени имени
      akNameChange: begin
         cngActRequest:=FZags.CreateNameChangeActRequest(MessageType, RequestMessageId);
         if Table<>nil then begin
            Table.SetProp(cngActRequest, Input)
         end;
         {
         //Заполнение данных для передачи в регистр
         //Акт о перемене имени
         //1. Персональные данные лица
         //1.1. Персональные данные лица
         DataSetToPersonalData('', cngActRequest.cng_cert_data.person.person_data, Input);
         //1.2. Фамилия до перемены имени
         cngActRequest.cng_cert_data.person.old_last_name:=Input.FieldByName('DO_FAMILIA').AsString;
         //1.3. Имя до перемены имени
         cngActRequest.cng_cert_data.person.old_name:=Input.FieldByName('DO_NAME').AsString;
         //1.4. Отчество до перемены имени
         cngActRequest.cng_cert_data.person.old_patronymic:=Input.FieldByName('DO_OTCH').AsString;
         //1.5. Информация об акте о рождении
         DataSetToActData('R_', cngActRequest.cng_cert_data.person.birth_act_data, Input);
         //2. Сведения о детях, не достигших 18 лет
         //2.1. Информация о ребёнке
         //2.2. Информация об акте о рождении
         //3. Основание записи акта о перемене имени
         cngActRequest.cng_cert_data.reason:=Input.FieldByName('OSNOV').AsString;
         //4. Информация об актовой записи
         DataSetToActData('ACT_', cngActRequest.cng_cert_data.cng_act_data, Input);
         //5. Информация о печатном документе
         DataSetToDocument('DOC_', cngActRequest.cng_cert_data.cng_certificate_data, Input);
         }
         ReturnCode:=nil;
         try
            ReturnCode:=FZags.PostNameChangeCertificate(cngActRequest, FLog);
            if (ReturnCode<>nil) and (Length(ReturnCode.error_list)=0) then begin
               Result:=rrOk;
               if ReturnCode.cover.parent_message_id<>cngActRequest.cover.message_id then begin
                  Result:=rrAfterError;
                  FFaultError:='Ошибка обмена с регистром. Не совпадают идентификаторы сообщений запроса и ответа.';
                  FLog.Add('!ОШИБКА: не совпадают идентификаторы сообщений')
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
   //Проверка входных параметров
   if not FileExists(InputFile) then begin
      MessageDlg(Format('Не найден файл "%s"', [InputFile]), mtError, [mbOk], 0);
      Exit;
   end;
   if not FileExists(OutputFile) then begin
      MessageDlg(Format('Не найден файл "%s"', [OutputFile]), mtError, [mbOk], 0);
      Exit;
   end;
   //Чтение информации о структуре таблиц
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
                  //нет проверки, что это tkClass
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
