unit mTempl; // 17.06.2005
interface
uses
   Windows, Classes, Controls, Forms, SysUtils, IniFiles, TypInfo, StdCtrls, DB,
   Dialogs, ComObj, ShellApi, FileCtrl,
   Word_TLB,
   DBGrids, DBCtrlsEh, DBGridEh,
   {$IFDEF VER150} Variants, {$ENDIF}
   kbmMemTable,
   AdsTable;

type

   // =========================================================================
   // Классы для хранения структур данных
   // -------------------------------------------------------------------------
   // TTemplate        - шаблон
   // TTemplateList    - список шаблонов
   // TParameter       - параметр шаблона
   // TParameterList   - список параметров шаблона
   // TControlLink     - связь между элементом управления и параметром шаблона
   // TControlLinkList - список связей
   // =========================================================================

   TParameterList=class;

   // шаблон
   TTemplate=class(TObject)
   private
      // название группы
      FGroup: string;
      // порядок в группе
      FOrder: Integer;
      // уникальный идентификатор в группе
      FName: string;
      // заголовок
      FCaption: string;
      // текст шаблона
      FTemplateText: string;
      // имя файла текста шаблона
      FTemplateFile: string;
      // шаблон экранной формы для ввода параметров шаблона
      FFormTemplate: string;
      // sql-запрос на получение значений параметров шаблона из базы даных
      FSQLText: string;
      // имя функции заполняющей значения параметров для данного шаблона
      // (текст функции написан на RemObjects Pascal Script)
      // (функция заполняет набор значений, в качетсве параметров передаются имя
      //  набора значений и сам набор значений готовый для заполнения)
      FScriptName: string;
      // набор значений для параметров шаблона (создаётся только для чтения данных
      // через скрипт) 
      FDataSet: TkbmMemTable;
      // использовать ли формы ввода параметров
      FUseForm: Boolean;
      //!!!!!!!!!!!!!
      FFields: string;
      //!!!!!!!!!!!!!
      FTables: string;
      //!!!!!!!!!!!!!
      FFiles: string;
      //!!!!!!!!!!!!!
      FParams: TStringList;
      // не обязательный параметр
      // если установлен, то определяет какой использовать генератор текста (DOC, RTF)
      FTextGeneranor: string;
      // название подменю, в которое необходимо поместить данный шаблон
      FSubMenu: string;
   private
      function GetFullName: string;
   public
      constructor Create(Group, Name, Caption, TemplateText, TemplateFile, FormTemplate, SQLText, ScriptName, Fields, Tables, Files, TextGeneranor, SubMenu: string; UseForm: Boolean; Order: Integer);
      destructor Destroy; override;
   public
      property Group: string read FGroup;
      property Order: Integer read FOrder;
      property Name: string read FName;
      property FullName: string read GetFullName;
      property Caption: string read FCaption;
      property TemplateText: string read FTemplateText;
      property TemplateFile: string read FTemplateFile;
      property FormTemplate: string read FFormTemplate;
      property SQLText: string read FSQLText;
      property ScriptName: string read FScriptName;
      property DataSet: TkbmMemTable read FDataSet;
      property UseForm: Boolean read FUseForm;
      //!!!!!!!!!!!!!
      property Fields: string read FFields write FFields;
      //!!!!!!!!!!!!!
      property Tables: string read FTables write FTables;
      //!!!!!!!!!!!!!
      property Files: string read FFiles write FFiles;
      //!!!!!!!!!!!!!
      property Params: TStringList read FParams write FParams;
      property TextGeneranor: string read FTextGeneranor write FTextGeneranor;
      property SubMenu: string read FSubMenu write FSubMenu;
   end;

   // список шаблонов
   TTemplateList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TTemplate;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TTemplate): Integer;
      function AddItem(Group, Name, Caption, TemplateText, TemplateFile, FormTemplate, SQLText, ScriptName, Fields, Tables, Files, TextGeneranor, SubMenu: string; UseForm: Boolean; Order: Integer): TTemplate;
      function GetByName(FullName: string): TTemplate;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TTemplate read GetItem; default;
   end;

   // типы параметров шаблона
   TParameterType=(
     // строка
     ptString,
     //
     ptMemo,
     // число
     ptNumber,
     // дата
     ptDate,
     // таблица
     ptTable,
     // файл
     ptFile
   );

   // стили парметров шаблона
   TParameterStyle=(
      // значение параметра обязателено должно быть введено для генерации текста
      // по шаблону, иначе значение указывать не обязательно
      psRequired (*не работает  пока*),
      // для колонок типа "число" значение колонки будет номер п/п
      // имя поля колонки должно быть "_ROWNUM_"
      psRownum,
      // оставлять параметр на той же строке, что и предыдущий
      psLine,
      // это означает, что параметр не будет присутствовать на форме
      psInfo
   );
   TParameterStyles=set of TParameterStyle;

   // параметр шаблона
   TParameter=class(TObject)
   private
      // уникальный идентификатор - ключ
      FName: string;
      // заголовок
      FCaption: string;
      // кодовое имя параметра
      FCodeName: string;
      // тип параметра
      FParameterType: TParameterType;
      // строка форматирования значения параметра (например, для дат)
      FFormat: string;
      // длина значения параметра (например, для строк)
      FSize: Integer;
      // длина показываемого значения параметра (например, для строк)
      // если не указан, то берётся FSize
      FViewSize: Integer;
      // это свойство задаёт парядок обхода параметров шаблона в списке параметров
      FOrder: Integer;
      // имя поля в sql-запросе, из которого берётся значение параметра шаблона
      FFieldName: string;
      // значение по умолчанию
      FDefaultValue: Variant;
      // значение параметра (для колонок таблицы всегда Null, а для таблицы это FDataSet)
      FValue: Variant;
      // значения для параметра типа "таблица" 
      FDataSet: TkbmMemTable;
      // список колонок, если параметр имеет тип <таблица>
      FParameterList: TParameterList;
      // стили параметра
      FParameterStyle: TParameterStyles;
      // sql-запрос на получение значений параметров шаблона из базы даных
      // (для колонок таблицы)
      FSQLText: string;
      // количество строк, отводимых на показ параметра (актуально пока только для таблиц)
      FRowNumber: Integer;
   public
      constructor Create(Name, Caption, CodeName: string; ParameterType: TParameterType; Format: string; Size, ViewSize, RowNumber, Order: Integer; FieldName: string; ParameterStyle: TParameterStyles; DefaultValue, SQLText: string);
      destructor Destroy; override;
      function GetText: string;
   public
      property Name: string read FName;
      property Caption: string read FCaption;
      property CodeName: string read FCodeName;
      property ParameterType: TParameterType read FParameterType;
      property Format: string read FFormat;
      property Size: Integer read FSize;
      property ViewSize: Integer read FViewSize;
      property Order: Integer read FOrder write FOrder;
      property FieldName: string read FFieldName;
      property DefaultValue: Variant read FDefaultValue write FDefaultValue;
      property Value: Variant read FValue write FValue;
      property ParameterList: TParameterList read FParameterList;
      property ParameterStyle: TParameterStyles read FParameterStyle;
      property SQLText: string read FSQLText;
      property DataSet: TkbmMemTable read FDataSet;
      property RowNumber: Integer read FRowNumber;
   end;

   // список параметров шаблона
   TParameterList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TParameter;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TParameter): Integer;
      function AddItem(Name, Caption, CodeName: string; ParameterType: TParameterType; Format: string; Size, ViewSize, RowNumber, Order: Integer; FieldName: string; ParameterStyle: TParameterStyles; DefaultValue, SQLText: string): TParameter;
      procedure Reorder;
      procedure ClearValue;
      procedure ConfigMemTable(Table: TkbmMemTable);
      procedure CopyDataSet(Src, Dest: TDataSet);
      function ByCodeName(CodeName: string): TParameter;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TParameter read GetItem; default;
   end;

   // связь между элементом управления и параметром шаблона
   TControlLink=class(TObject)
   private
      FParameter: TParameter;
      FControl: TControl;
   public
      constructor Create(Parameter: TParameter; Control: TControl); virtual;
      destructor Destroy; override;
      procedure SetValue(Value: Variant); virtual;
      function GetValue: Variant; virtual;
   public
      property Parameter: TParameter read FParameter;
      property Control: TControl read FControl;
   end;

   // список связей элементом управления и параметром шаблона
   TControlLinkList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TControlLink;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TControlLink): Integer;
      function AddItem(Parameter: TParameter; Control: TControl): TControlLink;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TControlLink read GetItem; default;
   end;

   // =========================================================================
   // Абстранктные классы для обработки структур данных
   // -------------------------------------------------------------------------
   // TTemplateReader   - чтение данных шаблона из <источника>
   // TParameterReader  - чтение данных параметров шаблона из <источника>
   // TFormGenerator    - генерация <экранной формы> для ввода параметров шаблона
   // TDataGetter       - чтение значений параметров шаблона из <источника>
   // TFormSetter       - заполнение значений (параметров шаблона) на <экранной форме>
   // TFormGetter       - чтение значений параметров шаблона из <экранной формы>
   // TTextGenerator    - генерация <текста> по шаблону и значениям параметров
   // TTextViewer       - просмотр сгенерированного <текста>
   // =========================================================================

   // чтение данных шаблона из <источника>
   // ------------------------------------
   // <источник> => TTemplateList
   TTemplateReader=class(TObject)
   public
      constructor Create(Source: string); virtual;
      destructor Destroy; override;
      function ReadTemplate(TemplateGroup, TemplateName: string; Params: TStringList): TTemplate; virtual; abstract;
      function ReadTemplateList(TemplateList: TTemplateList; Params: TStringList): Boolean; virtual; abstract;
   end;

   TTemplateReaderClass=class of TTemplateReader;

   // чтение данных параметров шаблона из <источника>
   // -----------------------------------------------
   // <источник> => TParameterList
   TParameterReader=class(TObject)
   public
      constructor Create(Source: string); virtual;
      destructor Destroy; override;
      function ReadParameter(ParameterName: string; Params: TStringList): TParameter; virtual; abstract;
      function ReadParameterList(FullName: string; ParameterList: TParameterList; Params: TStringList): Boolean; virtual; abstract;
   end;

   TParameterReaderClass=class of TParameterReader;

   // генерация <экранной формы> для ввода параметров шаблона
   // -------------------------------------------------------
   // TTemplate + TParameteList => <экранная форма>
   TFormGenerator=class(TObject)
   public
      constructor Create; virtual;
      destructor Destroy; override;
      procedure GenerateForm(Template: TTemplate; ParameterList: TParameterList; WinControl: TWinControl; ControlLinkList: TControlLinkList); virtual; abstract;
   end;

   TFormGeneratorClass=class of TFormGenerator;

   // чтение значений параметров шаблона из <источника>
   // -------------------------------------------------
   // <источника> + TTemplate + TParameterList => TParameterList + <значения>
   TDataGetter=class(TObject)
   public
      constructor Create(SourceName: string; SourceObject: TObject); virtual;
      destructor Destroy; override;
      function GetData(Template: TTemplate; ParameterList: TParameterList; Params: TStringList): Boolean; virtual; abstract;
   end;

   TDataGetterClass=class of TDataGetter;

   // заполнение значений (параметров шаблона) на <экранной форме>
   // -------------------------------------------------------------
   // <экранная форма> + TParameterList + <значения> => <экранная форма> + <значения>
   TFormSetter=class(TObject)
   public
      constructor Create; virtual;
      destructor Destroy; override;
      procedure SetData(Template: TTemplate; ParameterList: TParameterList; ControlLinkList: TControlLinkList); virtual; abstract;
   end;

   TFormSetterClass=class of TFormSetter;

   // чтение значений параметров шаблона из <экранной формы>
   // ------------------------------------------------------
   // <экранная форма> + <значения> + TParameterList => TParameterList + <значения>
   TFormGetter=class(TObject)
   public
      constructor Create; virtual;
      destructor Destroy; override;
      function GetData(Template: TTemplate; ParameterList: TParameterList; ControlLinkList: TControlLinkList): Boolean; virtual; abstract;
   end;

   TFormGetterClass=class of TFormGetter;

   // генерация <текста> по шаблону и значениям параметров
   // -----------------------------------------------------
   // TTemplate + TParameterList + <значения> => <текст>
   TTextGenerator=class(TObject)
   public
      constructor Create; virtual;
      destructor Destroy; override;
      function GenerateText(Template: TTemplate; ParameterList: TParameterList; Text: TStringList; TemplateFileName, OutputFileName: string): Boolean; virtual; abstract;
   end;

   TTextGeneratorClass=class of TTextGenerator;

   // просмотр сгенерированного <текста>
   // ----------------------------------
   // TTemplate + <текст> => просмотр текста на экране
   TTextViewer=class(TObject)
   public
      constructor Create; virtual;
      destructor Destroy; override;
      procedure ViewText(Template: TTemplate; Text: TStringList; OutputFileName: string); virtual; abstract;
   end;

   TTextViewerClass=class of TTextViewer;

   // =========================================================================
   // Общий класс для работы с шаблонами
   // =========================================================================

   // общий класс для работы с шаблонами
   TTemplateEngine=class(TObject)
   private
      // список шаблонов
      FTemplateList: TTemplateList;
      // текущий список параметров шаблона
      FParameterList: TParameterList;
      // текущий список связей параметров с элементами управления
      FControlLinkList: TControlLinkList;
      // текущий текст шаблона после подстановки параметров
      FText: TStringList;
      // класс чтения данных шаблона из <источника>
      FTemplateReaderClass: TTemplateReaderClass;
      // класс чтения данных параметров шаблона из <источника>
      FParameterReaderClass: TParameterReaderClass;
      // класс генерации <экранной формы> для ввода параметров шаблона
      FFormGeneratorClass: TFormGeneratorClass;
      // класс чтения значений параметров шаблона из <источника>
      FDataGetterClass: TDataGetterClass;
      // класс заполнения значений (параметров шаблона) на <экранной форме>
      FFormSetterClass: TFormSetterClass;
      // класс чтения значений параметров шаблона из <экранной формы>
      FFormGetterClass: TFormGetterClass;
      // класс генерации <текста> по шаблону и значениям параметров
      FTextGeneratorClass: TTextGeneratorClass;
      // класс просмотра сгенерированного <текста>
      FTextViewerClass: TTextViewerClass;
      // список входных параметров для sql-запросов <имя параметра>=<значение>
      // задаются как следующая макроподставновка '$'<имя параметра>'$'
      FParams: TStringList;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function ReadTemplateList(Source: string): Boolean;
      function ReadParameterList(Source: string; Template: TTemplate): Boolean;
      procedure GenerateForm(Template: TTemplate; WinControl: TWinControl);
      function GetData(SourceName: string; SourceObject: TObject; Template: TTemplate): Boolean;
      procedure SetFormData(Template: TTemplate);
      function GetFormData(Template: TTemplate): Boolean;
      function GenerateText(Template: TTemplate; TemplateFileName, OutputFileName: string): Boolean;
      procedure ViewText(Template: TTemplate; OutputFileName: string);
      procedure AddParam(Name: string; Value: string);
   public
      property TemplateList: TTemplateList read FTemplateList;
      property ControlLinkList: TControlLinkList read FControlLinkList;
      property ParameterList: TParameterList read FParameterList;
      property Text: TStringList read FText;
      property TemplateReaderClass: TTemplateReaderClass read FTemplateReaderClass write FTemplateReaderClass;
      property ParameterReaderClass: TParameterReaderClass read FParameterReaderClass write FParameterReaderClass;
      property FormGeneratorClass: TFormGeneratorClass read FFormGeneratorClass write FFormGeneratorClass;
      property DataGetterClass: TDataGetterClass read FDataGetterClass write FDataGetterClass;
      property FormSetterClass: TFormSetterClass read FFormSetterClass write FFormSetterClass;
      property FormGetterClass: TFormGetterClass read FFormGetterClass write FFormGetterClass;
      property TextGeneratorClass: TTextGeneratorClass read FTextGeneratorClass write FTextGeneratorClass;
      property TextViewerClass: TTextViewerClass read FTextViewerClass write FTextViewerClass;
      property Params: TStringList read FParams;
   end;

   // =========================================================================
   // Реализация TTemplateReader (чтение данных шаблона из <источника>)
   // =========================================================================

   // чтение списка шаблонов из ini-файла
   TReadTemplateFromIni=class(TTemplateReader)
   private
      FIni: TIniFile;
      FFileName: string;
   public
      constructor Create(Source: string); override;
      destructor Destroy; override;
      function ReadTemplate(TemplateGroup, TemplateName: string; Params: TStringList): TTemplate; override;
      function ReadTemplateList(TemplateList: TTemplateList; Params: TStringList): Boolean; override;
   end;

   // =========================================================================
   // Реализация TParameterReader (чтение данных параметров шаблона из <источника>)
   // =========================================================================

   // чтение параметров шаблона из ini-файла
   TReadParameterFromIni=class(TParameterReader)
   private
      FIni: TIniFile;
      FFileName: string;
   public
      constructor Create(Source: string); override;
      destructor Destroy; override;
      function ReadParameter(ParameterName: string; Params: TStringList): TParameter; override;
      function ReadParameterList(FullName: string; ParameterList: TParameterList; Params: TStringList): Boolean; override;
   end;

   // =========================================================================
   // Реализация TParameterReader (чтение данных параметров шаблона из <источника>)
   // =========================================================================

   // чтение параметров шаблона из rtf-шаблона
   TReadParameterFromRtf=class(TParameterReader)
   private
      //--FTextDoc: string;
   private
      //--function LoadFromFile(FileName: string): string;
   public
      constructor Create(Source: string); override;
      destructor Destroy; override;
      function ReadParameter(ParameterName: string; Params: TStringList): TParameter; override;
      function ReadParameterList(FullName: string; ParameterList: TParameterList; Params: TStringList): Boolean; override;
   end;

   // =========================================================================
   // Реализация классов для связи между элементом управления и параметром шаблона
   // =========================================================================

   TEditEhLink=class(TControlLink)
   private
      FEdit: TDBEditEh;
   public
      constructor Create(Parameter: TParameter; Control: TControl); override;
      destructor Destroy; override;
      procedure SetValue(Value: Variant); override;
      function GetValue: Variant; override;
   end;

   TDateTimeEditEhLink=class(TControlLink)
   private
      FDateTime: TDBDateTimeEditEh;
   public
      constructor Create(Parameter: TParameter; Control: TControl); override;
      destructor Destroy; override;
      procedure SetValue(Value: Variant); override;
      function GetValue: Variant; override;
   end;

   TNumberEditEhLink=class(TControlLink)
   private
      FNumber: TDBNumberEditEh;
   public
      constructor Create(Parameter: TParameter; Control: TControl); override;
      destructor Destroy; override;
      procedure SetValue(Value: Variant); override;
      function GetValue: Variant; override;
   end;

   TGridEhLink=class(TControlLink)
   private
      FGrid: TDBGridEh;
      FDataSet: TDataSet;
   public
      constructor Create(Parameter: TParameter; Control: TControl); override;
      destructor Destroy; override;
      procedure SetValue(Value: Variant); override;
      function GetValue: Variant; override;
   end;

   // =========================================================================
   // Реализация TFormGenerator (генерация <экранной формы> для ввода параметров шаблона)
   // =========================================================================

   // генерация экранной формы по умолчанию
   TDefaultFormGenerator=class(TFormGenerator)
   public
      constructor Create; override;
      destructor Destroy; override;
      procedure GenerateForm(Template: TTemplate; ParameterList: TParameterList; WinControl: TWinControl; ControlLinkList: TControlLinkList); override;
   end;

   // =========================================================================
   // Реализация TDataGetter (чтение значений параметров шаблона из <источника>)
   // =========================================================================

   // чтение значений параметров шаблона из ads-таблиц
   TAdsDataGetter=class(TDataGetter)
   private
      FDatabaseName: string;
   public
      constructor Create(SourceName: string; SourceObject: TObject); override;
      destructor Destroy; override;
      function GetData(Template: TTemplate; ParameterList: TParameterList; Params: TStringList): Boolean; override;
   end;

   // =========================================================================
   // Реализация TFormSetter (заполнение значений (параметров шаблона) на <экранной форме>)
   // =========================================================================

   // заполнение значений экранной формы по умолчанию
   TDefaultFormSetter=class(TFormSetter)
   public
      constructor Create; override;
      destructor Destroy; override;
      procedure SetData(Template: TTemplate; ParameterList: TParameterList; ControlLinkList: TControlLinkList); override;
   end;

   // =========================================================================
   // Реализация TFormGetter (чтение значений параметров шаблона из <экранной формы>)
   // =========================================================================

   // чтение значений экранной формы по умолчанию
   TDefaultFormGetter=class(TFormGetter)
   public
      constructor Create; override;
      destructor Destroy; override;
      function GetData(Template: TTemplate; ParameterList: TParameterList; ControlLinkList: TControlLinkList): Boolean; override;
   end;

   // =========================================================================
   // Реализация TTextGenerator (генерация <текста> по шаблону и значениям параметров)
   // =========================================================================

   // генерация txt-файла по шаблону
   TWordGenerator=class(TTextGenerator)
   public
      constructor Create; override;
      destructor Destroy; override;
      function GenerateText(Template: TTemplate; ParameterList: TParameterList; Text: TStringList; TemplateFileName, OutputFileName: string): Boolean; override;
   end;

   // =========================================================================
   // Реализация TTextGenerator (генерация <текста> по шаблону и значениям параметров)
   // =========================================================================

   // генерация txt-файла по шаблону
   TRtfGenerator=class(TTextGenerator)
   private
      function LoadFromFile(FileName: string): string;
      procedure SaveToFile(S, FileName: string);
   public
      constructor Create; override;
      destructor Destroy; override;
      function GenerateText(Template: TTemplate; ParameterList: TParameterList; Text: TStringList; TemplateFileName, OutputFileName: string): Boolean; override;
   end;

   // =========================================================================
   // Реализация TTextViewer (просмотр сгенерированного <текста>)
   // =========================================================================

   // просмотр текста на экране
   TDefaultTextViewer=class(TTextViewer)
   public
      constructor Create; override;
      destructor Destroy; override;
      procedure ViewText(Template: TTemplate; Text: TStringList; OutputFileName: string); override;
   end;


implementation

{ TTemplate }

constructor TTemplate.Create(Group, Name, Caption, TemplateText, TemplateFile, FormTemplate, SQLText, ScriptName, Fields, Tables, Files, TextGeneranor, SubMenu: string; UseForm: Boolean; Order: Integer);
begin
   FGroup:=Trim(Group);
   FOrder:=Order;
   FName:=Trim(Name);
   FCaption:=Caption;
   FTemplateText:=Trim(TemplateText);
   FTemplateFile:=Trim(TemplateFile);
   FFormTemplate:=FormTemplate;
   FSQLText:=Trim(SQLText);
   FScriptName:=Trim(ScriptName);
   FDataSet:=TkbmMemTable.Create(nil);
   FUseForm:=UseForm;
   FFields:=Trim(Fields);
   FTables:=Trim(Tables);
   FFiles:=Trim(Files);
   FParams:=TStringList.Create;
   FTextGeneranor:=Trim(TextGeneranor);
   FSubMenu:=Trim(SubMenu);
end;

destructor TTemplate.Destroy;
begin
   FDataSet.Free;
   FParams.Free;
   inherited;
end;

function TTemplate.GetFullName: string;
begin
   if FGroup='' then begin
      Result:=FName;
   end
   else begin
      Result:=FGroup+'.'+FName;
   end;
end;

{ TTemplateList }

function TTemplateList.Add(Item: TTemplate): Integer;
begin
   Result:=FList.Add(Item);
end;

function TTemplateList.AddItem(Group, Name, Caption, TemplateText, TemplateFile, FormTemplate, SQLText, ScriptName, Fields, Tables, Files, TextGeneranor, SubMenu: string; UseForm: Boolean; Order: Integer): TTemplate;
begin
   Result:=TTemplate.Create(Group, Name, Caption, TemplateText, TemplateFile, FormTemplate, SQLText, ScriptName, Fields, Tables, Files, TextGeneranor, SubMenu, UseForm, Order);
   Add(Result);
end;

procedure TTemplateList.Clear;
var
   I: Integer;
   Item: TTemplate;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

constructor TTemplateList.Create;
begin
   FList:=TList.Create;
end;

destructor TTemplateList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TTemplateList.GetByName(FullName: string): TTemplate;
var
   I: Integer;
   Item: TTemplate;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and AnsiSameText(FullName, Item.FullName) then begin
         Result:=Item;
         Break;
      end;
   end;
end;

function TTemplateList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TTemplateList.GetItem(I: Integer): TTemplate;
begin
   Result:=TTemplate(FList[I]);
end;

{ TParameter }

constructor TParameter.Create(Name, Caption, CodeName: string; ParameterType: TParameterType; Format: string; Size, ViewSize, RowNumber, Order: Integer; FieldName: string; ParameterStyle: TParameterStyles; DefaultValue, SQLText: string);
begin
   FName:=AnsiUpperCase(Trim(Name));
   FCaption:=Caption;
   FCodeName:=Trim(CodeName);
   FParameterType:=ParameterType;
   FFormat:=Format;
   FSize:=Size;
   FViewSize:=ViewSize;
   if ViewSize=0 then begin
      FViewSize:=Size;
   end;
   FOrder:=Order;
   FFieldName:=Trim(FieldName);
   FValue:=Null;
   FDefaultValue:=DefaultValue;
   FParameterList:=TParameterList.Create;
   FParameterStyle:=ParameterStyle;
   FSQLText:=Trim(SQLText);
   FDataSet:=TkbmMemTable.Create(nil);
   if ParameterType=ptTable then begin
      FValue:=Integer(FDataSet);
   end;
   FRowNumber:=RowNumber;
end;

destructor TParameter.Destroy;
begin
   FDataSet.Free;
   FParameterList.Free;
   inherited;
end;

function TParameter.GetText: string;
begin
   Result:='';
   if FValue<>Null then begin
      case FParameterType of
         ptString, ptMemo: begin
            Result:=Value;
         end;
         ptNumber: begin
            Result:=Value;
         end;
         ptDate: begin
            if FFormat<>'' then begin
               Result:=FormatDateTime(FFormat, Value);
            end
            else begin
               Result:=Value;
            end;
         end;
      end;
   end
   else if FParameterType=ptFile then begin
      Result:=FCodeName;
   end;
end;

{ TParameterList }

function TParameterList.Add(Item: TParameter): Integer;
begin
   Result:=FList.Add(Item);
end;

function TParameterList.AddItem(Name, Caption, CodeName: string; ParameterType: TParameterType; Format: string; Size, ViewSize, RowNumber, Order: Integer; FieldName: string; ParameterStyle: TParameterStyles; DefaultValue, SQLText: string): TParameter;
begin
   Result:=TParameter.Create(Name, Caption, CodeName, ParameterType, Format, Size, ViewSize, RowNumber, Order, FieldName, ParameterStyle, DefaultValue, SQLText);
   Add(Result);
end;

function TParameterList.ByCodeName(CodeName: string): TParameter;
var
   I: Integer;
   Item: TParameter;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and SameText(CodeName, Item.CodeName) then begin
         Result:=Item;
         Break;
      end;
   end;
end;

procedure TParameterList.Clear;
var
   I: Integer;
   Item: TParameter;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

procedure TParameterList.ClearValue;
var
   I: Integer;
   Item: TParameter;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         if Item.ParameterType=ptTable then begin
            Item.ParameterList.ClearValue;
         end
         else begin
            Item.Value:=Null;
         end;
      end;
   end;
end;

procedure TParameterList.ConfigMemTable(Table: TkbmMemTable);
var
   I: Integer;
   Parameter: TParameter;
   FieldDef: TFieldDef;
begin
   Table.Close;
   Table.FieldDefs.Clear;
   for I:=0 to Pred(GetCount) do begin
      Parameter:=GetItem(I);
      if (Parameter.ParameterType<>ptTable) and (Parameter.ParameterType<>ptFile) and (Parameter.FieldName<>'') then begin
         FieldDef:=Table.FieldDefs.AddFieldDef;
         FieldDef.Name:=Parameter.FieldName;
         case Parameter.ParameterType of
            ptString: begin
               FieldDef.DataType:=ftString;
               FieldDef.Size:=Parameter.Size;
            end;
            ptMemo: begin
               FieldDef.DataType:=ftMemo;
            end;
            ptNumber: begin
               FieldDef.DataType:=ftInteger;
            end;
            ptDate: begin
               FieldDef.DataType:=ftDateTime;
            end;
         end;
      end;
   end;
   Table.CreateTable;
   Table.Open;
end;

procedure TParameterList.CopyDataSet(Src, Dest: TDataSet);
var
   I: Integer;
   Parameter: TParameter;
   SrcField: TField;
   DestField: TField;
begin
   if (Src<>nil) and (Dest<>nil) and (Src.Active) and (Dest.Active) then begin
      // NB!!! предполагается, что таблица Dest пустая
      Src.First;
      while not Src.Eof do begin
         Dest.Append;
         for I:=0 to Pred(GetCount) do begin
            Parameter:=GetItem(I);
            if (Parameter<>nil) and (Parameter.FieldName<>'') then begin
               SrcField:=Src.FindField(Parameter.FieldName);
               DestField:=Dest.FindField(Parameter.FieldName);
               if (SrcField<>nil) and (DestField<>nil) then begin
                  case DestField.DataType of
                     ftDate, ftTime, ftDateTime: begin
                        if not SrcField.IsNull then begin
                           DestField.AsDateTime:=SrcField.AsDateTime;
                        end
                        else begin
                           DestField.AsString:='';
                        end;
                     end;
                     ftAutoInc, ftSmallint, ftInteger, ftWord: begin
                        if SrcField.IsNull then begin
                           DestField.AsString:='';
                        end
                        else begin
                           DestField.AsInteger:=SrcField.AsInteger;
                        end;
                     end;
                     ftFloat: DestField.AsFloat:=SrcField.AsFloat;
                  else
                     DestField.AsString:=SrcField.AsString;
                  end;
               end
               else begin
                  // NB: !!! эту ошибку надо как-то сигнализировать
               end;
            end;
         end;
         Dest.Post;
         Src.Next;
      end;
   end;
end;

constructor TParameterList.Create;
begin
   FList:=TList.Create;
end;

destructor TParameterList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TParameterList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TParameterList.GetItem(I: Integer): TParameter;
begin
   Result:=TParameter(FList[I]);
end;

function SortParameterByOrder(Item1, Item2: Pointer): Integer;
begin
   Result:=TParameter(Item1).Order-TParameter(Item2).Order;
end;

procedure TParameterList.Reorder;
begin
   FList.Sort(SortParameterByOrder);
end;

{ TControlLink }

constructor TControlLink.Create(Parameter: TParameter; Control: TControl);
begin
   FParameter:=Parameter;
   FControl:=Control;
end;

destructor TControlLink.Destroy;
begin
   inherited;
end;

function TControlLink.GetValue: Variant;
begin
   Result:=Null;
end;

procedure TControlLink.SetValue(Value: Variant);
begin
//
end;

{ TControlLinkList }

function TControlLinkList.Add(Item: TControlLink): Integer;
begin
   Result:=FList.Add(Item);
end;

function TControlLinkList.AddItem(Parameter: TParameter; Control: TControl): TControlLink;
begin
   Result:=TControlLink.Create(Parameter, Control);
   Add(Result);
end;

procedure TControlLinkList.Clear;
var
   I: Integer;
   Item: TControlLink;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

constructor TControlLinkList.Create;
begin
   FList:=TList.Create;
end;

destructor TControlLinkList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TControlLinkList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TControlLinkList.GetItem(I: Integer): TControlLink;
begin
   Result:=TControlLink(FList[I]);
end;

{ TTemplateReader }

constructor TTemplateReader.Create(Source: string);
begin
end;

destructor TTemplateReader.Destroy;
begin
   inherited;
end;

{ TParameterReader }

constructor TParameterReader.Create;
begin
end;

destructor TParameterReader.Destroy;
begin
   inherited;
end;

{ TFormGenerator }

constructor TFormGenerator.Create;
begin
end;

destructor TFormGenerator.Destroy;
begin
   inherited;
end;

{ TDataGetter }

constructor TDataGetter.Create(SourceName: string; SourceObject: TObject);
begin
end;

destructor TDataGetter.Destroy;
begin
   inherited;
end;

{ TFormSetter }

constructor TFormSetter.Create;
begin
end;

destructor TFormSetter.Destroy;
begin
   inherited;
end;

{ TFormGetter }

constructor TFormGetter.Create;
begin
end;

destructor TFormGetter.Destroy;
begin
   inherited;
end;

{ TTextGenerator }

constructor TTextGenerator.Create;
begin
end;

destructor TTextGenerator.Destroy;
begin
   inherited;
end;

{ TTextViewer }

constructor TTextViewer.Create;
begin
end;

destructor TTextViewer.Destroy;
begin
   inherited;
end;

{ TTemplateEngine }

procedure TTemplateEngine.AddParam(Name, Value: string);
begin
   FParams.Add(Format('%s=%s', [AnsiUpperCase(Name), Value]));
end;

procedure TTemplateEngine.Clear;
begin
   FText.Clear;
   FControlLinkList.Clear;
   FTemplateList.Clear;
end;

constructor TTemplateEngine.Create;
begin
   FTemplateList:=TTemplateList.Create;
   FParameterList:=TParameterList.Create;
   FControlLinkList:=TControlLinkList.Create;
   FText:=TStringList.Create;
   FTemplateReaderClass:=nil;
   FParameterReaderClass:=nil;
   FFormGeneratorClass:=nil;
   FDataGetterClass:=nil;
   FFormSetterClass:=nil;
   FFormGetterClass:=nil;
   FTextGeneratorClass:=nil;
   FTextViewerClass:=nil;
   FParams:=TStringList.Create;
end;

destructor TTemplateEngine.Destroy;
begin
   FParams.Free;
   FText.Free;
   FControlLinkList.Free;
   FParameterList.Free;
   FTemplateList.Free;
   inherited;
end;

procedure TTemplateEngine.GenerateForm(Template: TTemplate; WinControl: TWinControl);
var
   FormGenerator: TFormGenerator;
begin
   if FFormGeneratorClass<>nil then begin
      FormGenerator:=FFormGeneratorClass.Create;
      try
         FormGenerator.GenerateForm(Template, FParameterList, WinControl, FControlLinkList);
      finally
         FormGenerator.Free;
      end;
   end;
end;

function TTemplateEngine.GenerateText(Template: TTemplate; TemplateFileName, OutputFileName: string): Boolean;
var
   TextGenerator: TTextGenerator;
begin
   Result:=False;
   if FTextGeneratorClass<>nil then begin
      // !!!
      if SameText(Template.TextGeneranor, 'RTF') then begin
         TextGenerator:=TRtfGenerator.Create;
      end
      else if SameText(Template.TextGeneranor, 'DOC') then begin
         TextGenerator:=TWordGenerator.Create;
      end
      else begin
         TextGenerator:=FTextGeneratorClass.Create;
      end;
      //
      Application.ProcessMessages;
      Screen.Cursor:=crHourGlass;
      try
         Result:=TextGenerator.GenerateText(Template, FParameterList, FText, TemplateFileName, OutputFileName);
      finally
         TextGenerator.Free;
         Screen.Cursor:=crDefault;
      end;
   end;
end;

function TTemplateEngine.GetData(SourceName: string; SourceObject: TObject; Template: TTemplate): Boolean;
var
   DataGetter: TDataGetter;
begin
   Result:=False;
   if FDataGetterClass<>nil then begin
      DataGetter:=FDataGetterClass.Create(SourceName, SourceObject);
      Screen.Cursor:=crHourGlass;
      try
         Result:=DataGetter.GetData(Template, FParameterList, FParams);
      finally
         DataGetter.Free;
         Screen.Cursor:=crDefault;
      end;
   end;
end;

function TTemplateEngine.GetFormData(Template: TTemplate): Boolean;
var
   FormGetter: TFormGetter;
begin
   Result:=False;
   if FFormGetterClass<>nil then begin
      FormGetter:=FFormGetterClass.Create;
      try
         Result:=FormGetter.GetData(Template, FParameterList, FControlLinkList);
      finally
         FormGetter.Free;
      end;
   end; 
end;

function TTemplateEngine.ReadParameterList(Source: string; Template: TTemplate): Boolean;
var
   ParameterReader: TParameterReader;

   function NVL(V, S: string): string;
   begin
      if V='' then Result:=S else Result:=V;
   end;

begin
   Result:=False;
   if FParameterReaderClass<>nil then begin
      ParameterReader:=FParameterReaderClass.Create(Source);
      //Screen.Cursor:=crHourGlass;
      try
         //Result:=ParameterReader.ReadParameterList(Template.FullName, FParameterList, FParams);
         Result:=ParameterReader.ReadParameterList(NVL(Template.Fields, ' ')+#13#10+NVL(Template.Tables, ' ')+#13#10+NVL(Template.Files, ' '), FParameterList, FParams);
      finally
         ParameterReader.Free;
         //Screen.Cursor:=crDefault;
      end;
   end;
end;

function TTemplateEngine.ReadTemplateList(Source: string): Boolean;
var
   TemplateReader: TTemplateReader;
begin
   Result:=False;
   if FTemplateReaderClass<>nil then begin
      TemplateReader:=FTemplateReaderClass.Create(Source);
      try
         Result:=TemplateReader.ReadTemplateList(FTemplateList, FParams);
      finally
         TemplateReader.Free;
      end;
   end;
end;

procedure TTemplateEngine.SetFormData(Template: TTemplate);
var
   FormSetter: TFormSetter;
begin
   if FFormSetterClass<>nil then begin
      FormSetter:=FFormSetterClass.Create;
      try
         FormSetter.SetData(Template, FParameterList, FControlLinkList);
      finally
         FormSetter.Free;
      end;
   end;
end;

procedure TTemplateEngine.ViewText(Template: TTemplate; OutputFileName: string);
var
   TextViewer: TTextViewer;
begin
   if FTextViewerClass<>nil then begin
      TextViewer:=FTextViewerClass.Create;
      try
         TextViewer.ViewText(Template, FText, OutputFileName);
      finally
         TextViewer.Free;
      end;
   end;
end;

{ TReadTemplateFromIni }

constructor TReadTemplateFromIni.Create(Source: string);
begin
   FFileName:=Source;
   FIni:=TIniFile.Create(FFileName);
end;

destructor TReadTemplateFromIni.Destroy;
begin
   FIni.Free;
   inherited;
end;

function TReadTemplateFromIni.ReadTemplate(TemplateGroup, TemplateName: string; Params: TStringList): TTemplate;
var
   Ind: Integer;
   //I: Integer;
   S: string;
   sl: TStringList;
   Caption: string;
   TemplateText: string;
   TemplateFile: string;
   FormTemplate: string;
   SQLText: TStringList;
   ScriptName: string;
   UseForm: Boolean;
   Fields: string;
   Tables: string;
   Files: string;
   TemplateParams: TStringList;
   TextGeneranor: string;
   SubMenu: string;
   Order: Integer;
   Section: string;
begin
   Result:=nil;
   sl:=TStringList.Create;
   SQLText:=TStringList.Create;
   TemplateParams:=TStringList.Create;
   try
      if TemplateGroup='' then begin
         Section:=TemplateName;
      end
      else begin
         Section:=TemplateGroup+'.'+TemplateName;
      end;
      FIni.ReadSectionValues(Section, sl);
      if sl.Count>0 then begin
         Caption:=sl.Values['Caption'];
         TemplateText:=sl.Values['TemplateText'];
         TemplateFile:=sl.Values['TemplateFile'];
         if TemplateFile<>'' then begin
            TemplateFile:=StringReplace(TemplateFile, '%BaseDir%', ExtractFilePath(Application.ExeName), [rfReplaceAll, rfIgnoreCase]);
         end;
         FormTemplate:=sl.Values['FormTemplate'];
         ScriptName:=sl.Values['ScriptName'];
         UseForm:=sl.Values['UseForm']='1';
         Fields:=sl.Values['Fields'];
         Tables:=sl.Values['Tables'];
         Files:=sl.Values['Files'];
         TextGeneranor:=sl.Values['TextGenerator'];
         SubMenu:=sl.Values['SubMenu'];
         TemplateParams.CommaText:=sl.Values['Params'];
         SQLText.Clear;
         Ind:=sl.IndexOf('START=SQL');
         if Ind<>-1 then begin
            Inc(Ind);
            while (sl[Ind]<>'END=SQL') and (Ind<>sl.Count) do begin
               S:=sl.Values[sl.Names[Ind]];
               //for I:=0 to Pred(Params.Count) do begin
               //   S:=StringReplace(S, '$'+Params.Names[I]+'$', Params.Values[Params.Names[I]], [rfReplaceAll, rfIgnoreCase]);
               //end;
               SQLText.Add(S);
               Inc(Ind);
            end;
         end;
         Order:=StrToIntDef(sl.Values['Order'], 0);
         if (Caption<>'') {and (TemplateText<>'') and (FormTemplate<>'') and (SQLText<>'')} then begin
            Result:=TTemplate.Create(TemplateGroup, TemplateName, Caption, TemplateText, TemplateFile, FormTemplate, SQLText.Text, ScriptName, Fields, Tables, Files, TextGeneranor, SubMenu, UseForm, Order);
            Result.Params.Assign(TemplateParams);
         end;
      end;
   finally
      SQLText.Free;
      TemplateParams.Free;
      sl.Free;
   end;
end;

function TReadTemplateFromIni.ReadTemplateList(TemplateList: TTemplateList; Params: TStringList): Boolean;
var
   I: Integer;
   P: Integer;
   sl: TStringList;
   Template: TTemplate;
   TemplateGroup: string;
   TemplateName: string;
begin
   if TemplateList<>nil then begin
      Result:=True;
      sl:=TStringList.Create;
      try
         FIni.ReadSections(sl);
         TemplateList.Clear;
         for I:=0 to Pred(sl.Count) do begin
            P:=Pos('.', sl[I]);
            if P<>0 then begin
               TemplateGroup:=Copy(sl[I], 1, Pred(P));
               TemplateName:=Copy(sl[I], Succ(P), Length(sl[I])-P);
            end
            else begin
               TemplateGroup:='';
               TemplateName:=sl[I];
            end;
            Template:=ReadTemplate(TemplateGroup, TemplateName, Params);
            if Template<>nil then begin
               TemplateList.Add(Template);
            end;
         end;
      finally
         sl.Free;
      end;
   end
   else begin
      Result:=False;
   end;
end;

{ TReadParameterFromIni }

constructor TReadParameterFromIni.Create(Source: string);
begin
   FFileName:=Source;
   FIni:=TIniFile.Create(FFileName);
end;

destructor TReadParameterFromIni.Destroy;
begin
   FIni.Free;
   inherited;
end;

function TReadParameterFromIni.ReadParameter(ParameterName: string; Params: TStringList): TParameter;
const
   CRowNumber=4;
var
   sl: TStringList;
   //I: Integer;
   S: string;
   Caption: string;
   CodeName: string;
   ParameterType: TParameterType;
   Format: string;
   Size: Integer;
   ViewSize: Integer;
   RowNumber: Integer;
   Order: Integer;
   FieldName: string;
   ParameterStyle: TParameterStyles;
   DefaultValue: string;
   SQLText: TStringList;
   Ind: Integer;

   function GetParameterStyleValue(Name: string): TParameterStyles;
   var
      I: Integer;
      Len: Integer;
      EnumName: string;
   begin
      Result:=[];
      EnumName:='';
      Len:=Length(Name);
      I:=1;
      while I<=Len do begin
         if Name[I] in ['[', ' ', ',', ']'] then begin
            if EnumName<>'' then begin
               Include(Result, TParameterStyle(GetEnumValue(TypeInfo(TParameterStyle), EnumName)));
               EnumName:='';
            end;
         end
         else begin
            EnumName:=EnumName+Name[I];
         end;
         Inc(I);
      end;
   end;

begin
   Result:=nil;
   sl:=TStringList.Create;
   SQLText:=TStringList.Create;;
   try
      FIni.ReadSectionValues(ParameterName, sl);
      if sl.Count>0 then begin
         Caption:=sl.Values['Caption'];
         CodeName:=sl.Values['CodeName'];
         Format:=sl.Values['Format'];
         FieldName:=sl.Values['FieldName'];
         Size:=StrToIntDef(sl.Values['Size'], 0);
         ViewSize:=StrToIntDef(sl.Values['ViewSize'], Size);
         RowNumber:=StrToIntDef(sl.Values['RowNumber'], CRowNumber);
         Order:=StrToIntDef(sl.Values['Order'], 0);
         DefaultValue:=sl.Values['DefaultValue'];
         ParameterType:=TParameterType(GetEnumValue(TypeInfo(TParameterType), sl.Values['ParameterType']));
         ParameterStyle:=GetParameterStyleValue(sl.Values['ParameterStyle']);
         SQLText.Clear;
         Ind:=sl.IndexOf('START=SQL');
         if Ind<>-1 then begin
            Inc(Ind);
            while (sl[Ind]<>'END=SQL') and (Ind<>sl.Count) do begin
               S:=sl.Values[sl.Names[Ind]];
               //for I:=0 to Pred(Params.Count) do begin
               //   S:=StringReplace(S, '$'+Params.Names[I]+'$', Params.Values[Params.Names[I]], [rfReplaceAll, rfIgnoreCase]);
               //end;
               SQLText.Add(S);
               Inc(Ind);
            end;
         end;
         Result:=TParameter.Create(ParameterName, Caption, CodeName, ParameterType, Format, Size, ViewSize, RowNumber, Order, FieldName, ParameterStyle, DefaultValue, SQLText.Text);
         if ParameterType=ptTable then begin
            ReadParameterList(ParameterName+'.Columns', Result.ParameterList, Params);
         end;
      end;
   finally
      sl.Free;
      SQLText.Free;
   end;
end;

function TReadParameterFromIni.ReadParameterList(FullName: string; ParameterList: TParameterList; Params: TStringList): Boolean;
var
   I: Integer;
   sl: TStringList;
   Parameter: TParameter;
begin
   Result:=False;
   if ParameterList<>nil then begin
      ParameterList.Clear;
      sl:=TStringList.Create;
      try
         FIni.ReadSectionValues(FullName, sl);
         for I:=0 to Pred(sl.Count) do begin
            Parameter:=ReadParameter(sl.Values[sl.Names[I]], Params);
            if Parameter<>nil then begin
               ParameterList.Add(Parameter);
               if Parameter.ParameterType=ptTable then begin
                  Parameter.ParameterList.ConfigMemTable(Parameter.DataSet);
               end;
            end;
         end;
         ParameterList.Reorder;
         Result:=True;
      finally
         sl.Free;
      end;
   end;
end;

{ TDefaultFormGenerator }

constructor TDefaultFormGenerator.Create;
begin
end;

destructor TDefaultFormGenerator.Destroy;
begin
   inherited;
end;

procedure TDefaultFormGenerator.GenerateForm(Template: TTemplate; ParameterList: TParameterList; WinControl: TWinControl; ControlLinkList: TControlLinkList);
const
   HorzSpace: Integer=20;
   VertSpace: Integer=10; //15;
   ControlHeight: Integer=21;
   ControlWidth: Integer=500;
   ButtonHeight: Integer=23;
   ButtonWidth: Integer=75;
var
   I: Integer;
   J: Integer;
   Parameter: TParameter;
   ColumnParameter: TParameter;
   FormWidth: Integer;                 
   FormHeight: Integer;
   MaxLabelWidth: Integer;
   MaxControlWidth: Integer;
   Width: Integer;
   Top: Integer;
   Left: Integer;
   AveCharWidth: Integer;
   Canvas: TControlCanvas;
   Column: TColumnEh;
   fm: TForm;
   la: TLabel;
   ded: TDBEditEh;
   dbd: TDBDateTimeEditEh;
   dbn: TDBNumberEditEh;
   dg: TDBGridEh;
   dso: TDataSource;
   ds: TkbmMemTable;
   bt: TButton;

   function GetControlWidth(Par: TParameter; DefaultW: Integer): Integer;
   var
      W: Integer;
   begin
      if DefaultW=0 then begin
         Result:=MaxControlWidth;
      end
      else begin
         Result:=DefaultW;
      end;
      if Par.ViewSize<>0 then begin
         W:=AveCharWidth*Par.ViewSize;
         if W<=MaxControlWidth then begin
            Result:=W;
         end;
      end;
   end;

begin
   if (Template<>nil) and (ParameterList<>nil) and (WinControl<>nil) and (ControlLinkList<>nil) then begin
      ControlLinkList.Clear;
      if WinControl is TForm then begin
         fm:=TForm(WinControl);
         fm.Caption:=Template.Caption;
         fm.Position:=poScreenCenter;
         fm.BorderStyle:=bsDialog;
      end;
      if Template.FormTemplate<>'' then begin
      end
      else begin
         //FormWidth:=0;
         //FormHeight:=0;
         // приводим размеры в соответствие с текущим логическим разрешением
         HorzSpace:=MulDiv(HorzSpace, Screen.PixelsPerInch, 96);//Round(HorzSpace*Screen.PixelsPerInch/96);
         VertSpace:=MulDiv(VertSpace, Screen.PixelsPerInch, 96);//Round(VertSpace*Screen.PixelsPerInch/96);
         ControlHeight:=MulDiv(ControlHeight, Screen.PixelsPerInch, 96); //Round(ControlHeight*Screen.PixelsPerInch/96);
         ControlWidth:=MulDiv(ControlWidth, Screen.PixelsPerInch, 96); //Round(ControlWidth*Screen.PixelsPerInch/96);
         ButtonWidth:=MulDiv(ButtonWidth, Screen.PixelsPerInch, 96); //Round(ButtonWidth*Screen.PixelsPerInch/96);
         ButtonHeight:=MulDiv(ButtonHeight, Screen.PixelsPerInch, 96); //Round(ButtonHeight*Screen.PixelsPerInch/96);
         Canvas:=TControlCanvas.Create;
         try
            Canvas.Control:=WinControl;
            // поиск максимального по длине названия параметра и элемента
            // управления и подсчёт высоты формы
            MaxLabelWidth:=0;
            MaxControlWidth:=0;
            AveCharWidth:=Canvas.TextWidth('0');
            FormHeight:=0;
            for I:=0 to Pred(ParameterList.Count) do begin
               Parameter:=ParameterList[I];
               if not (psInfo in Parameter.ParameterStyle) then begin
                  if Parameter.ParameterType=ptTable then begin
                     if Parameter.ViewSize<>0 then begin
                        MaxControlWidth:=ControlWidth;
                     end
                     else begin
                        MaxControlWidth:=AveCharWidth*Parameter.ViewSize;
                     end;
                     FormHeight:=FormHeight+Parameter.RowNumber*ControlHeight+ControlHeight+VertSpace;
                  end
                  else if not (psLine in Parameter.ParameterStyle) then begin
                     Width:=Canvas.TextWidth(Parameter.Caption);
                     if Width>MaxLabelWidth then begin
                        MaxLabelWidth:=Width;
                     end;
                     FormHeight:=FormHeight+ControlHeight+(VertSpace div 2);
                     if Parameter.ParameterType in [ptString, ptMemo] then begin
                        Width:=AveCharWidth*Parameter.ViewSize;
                        if Width>MaxControlWidth then begin
                           MaxControlWidth:=Width;
                        end;
                     end;
                  end;
               end;
            end;
            if MaxControlWidth=0 then begin
               MaxControlWidth:=ControlWidth;
            end;
            FormWidth:=MaxLabelWidth+3*HorzSpace+MaxControlWidth;
            FormHeight:=FormHeight+2*VertSpace;
            // расставляем названия параметров и элементов управления
            Top:=VertSpace;
            Left:=HorzSpace;
            for I:=0 to Pred(ParameterList.Count) do begin
               Parameter:=ParameterList[I];
               if not (psInfo in Parameter.ParameterStyle) then begin
                  if not (psLine in Parameter.ParameterStyle) then begin
                     Left:=HorzSpace;
                  end;
                  if (I>0) and (psLine in Parameter.ParameterStyle) then begin
                     Top:=Top-ControlHeight-(VertSpace div 2);
                  end;
                  // название параметра
                  la:=TLabel.Create(WinControl);
                  la.Parent:=WinControl;
                  la.Caption:=Parameter.Caption;
                  la.Left:=Left;
                  la.Top:=Top+((ControlHeight-la.Height) div 2);
                  la.Visible:=True;
                  if not (psLine in Parameter.ParameterStyle) then begin
                     Left:=HorzSpace*2+MaxLabelWidth;
                  end
                  else begin
                     Left:=Left+HorzSpace+la.Width;
                  end;
                  // элемент управления для редактирования параметра
                  case Parameter.ParameterType of
                     ptString, ptMemo: begin
                        ded:=TDBEditEh.Create(WinControl);
                        ded.Parent:=WinControl;
                        ded.Height:=ControlHeight;
                        ded.Width:=GetControlWidth(Parameter, ded.Width);
                        ded.Left:=Left;
                        ded.Top:=Top;
                        ded.Visible:=True;
                        Top:=Top+ControlHeight+(VertSpace div 2);
                        Left:=Left+ded.Width+HorzSpace;
                        ControlLinkList.Add(TEditEhLink.Create(Parameter, ded));
                     end;
                     ptNumber: begin
                        dbn:=TDBNumberEditEh.Create(WinControl);
                        dbn.Parent:=WinControl;
                        dbn.Height:=ControlHeight;
                        dbn.Width:=GetControlWidth(Parameter, dbn.Width div 2);
                        dbn.Left:=Left;
                        dbn.Top:=Top;
                        dbn.Visible:=True;
                        Top:=Top+ControlHeight+(VertSpace div 2);
                        Left:=Left+dbn.Width+HorzSpace;
                        ControlLinkList.Add(TNumberEditEhLink.Create(Parameter, dbn));
                     end;
                     ptDate: begin
                        dbd:=TDBDateTimeEditEh.Create(WinControl);
                        dbd.Parent:=WinControl;
                        dbd.Height:=ControlHeight;
                        dbd.Width:=GetControlWidth(Parameter, dbd.Width);
                        dbd.Left:=Left;
                        dbd.Top:=Top;
                        dbd.Visible:=True;
                        Top:=Top+ControlHeight+(VertSpace div 2);
                        Left:=Left+dbd.Width+HorzSpace;
                        ControlLinkList.Add(TDateTimeEditEhLink.Create(Parameter, dbd));
                     end;
                     ptTable: begin
                        dg:=TDBGridEh.Create(WinControl);
                        dso:=TDataSource.Create(WinControl);
                        ds:=TkbmMemTable.Create(WinControl);
                        dso.DataSet:=ds;
                        dg.DataSource:=dso;
                        dg.Parent:=WinControl;
                        dg.Height:=Parameter.RowNumber*ControlHeight;
                        dg.Width:=FormWidth-HorzSpace*2;
                        dg.Left:=HorzSpace;
                        dg.UseMultiTitle:=True;
                        dg.VTitleMargin:=3;
                        dg.Options:=dg.Options-[dgTabs];
                        Top:=Top+ControlHeight+(VertSpace div 2);
                        dg.Top:=Top;
                        Top:=Top+Parameter.RowNumber*ControlHeight+(VertSpace div 2);
                        ControlLinkList.Add(TGridEhLink.Create(Parameter, dg));
                        // конфигурирование колонок параметра-таблицы
                        Parameter.ParameterList.ConfigMemTable(ds);
                        for J:=0 to Pred(Parameter.ParameterList.Count) do begin
                           ColumnParameter:=Parameter.ParameterList[J];
                           if (ColumnParameter.ParameterType<>ptTable) and (ColumnParameter.FieldName<>'') then begin
                              Column:=dg.Columns.Add;
                              Column.Title.Caption:=ColumnParameter.Caption;
                              Column.FieldName:=ColumnParameter.FieldName;
                              if ColumnParameter.ViewSize<>0 then begin
                                 Column.Width:=AveCharWidth*ColumnParameter.ViewSize;
                              end;
                           end;
                        end;
                     end;
                  end;
               end;
            end;
         finally
            Canvas.Free;
         end;
         if WinControl is TForm then begin
            fm:=TForm(WinControl);
            // добавляем две кнопки на форму с параметрами
            fm.ClientHeight:=FormHeight+ButtonHeight+(VertSpace div 2);
            fm.ClientWidth:=FormWidth;
            Top:=Top+VertSpace;
            bt:=TButton.Create(fm);
            bt.Parent:=fm;
            bt.Width:=ButtonWidth;
            bt.Height:=ButtonHeight;
            bt.Caption:='ОК';
            bt.Top:=Top;
            bt.Left:=FormWidth-ButtonWidth*2-HorzSpace*2;
            bt.ModalResult:=mrOk;
            bt.Default:=True;
            bt:=TButton.Create(fm);
            bt.Parent:=fm;
            bt.Width:=ButtonWidth;
            bt.Height:=ButtonHeight;
            bt.Caption:='Отмена';
            bt.Top:=Top;
            bt.Left:=FormWidth-ButtonWidth-HorzSpace;
            bt.ModalResult:=mrCancel;
            bt.Cancel:=True;
         end
         else begin
            WinControl.ClientWidth:=FormWidth;
            WinControl.ClientHeight:=FormHeight;
         end;
      end;
   end;
end;

{ TAdsDataGetter }

constructor TAdsDataGetter.Create(SourceName: string; SourceObject: TObject);
begin
   FDatabaseName:=SourceName;
end;

destructor TAdsDataGetter.Destroy;
begin
   inherited;
end;

function TAdsDataGetter.GetData(Template: TTemplate; ParameterList: TParameterList; Params: TStringList): Boolean;
var
   I: Integer;
   Parameter: TParameter;
   Query: TAdsQuery;
   TableQuery: TAdsQuery;
   FieldQuery: TAdsQuery;
   Field: TField;
begin
   Result:=False;
   if (Template<>nil) and (ParameterList<>nil) and (Template.SQLText<>'') then begin
      ParameterList.ClearValue;
      Query:=TAdsQuery.Create(nil);
      TableQuery:=TAdsQuery.Create(nil);
      FieldQuery:=TAdsQuery.Create(nil);
      try
         Query.DatabaseName:=FDatabaseName;
         TableQuery.DatabaseName:=FDatabaseName;
         FieldQuery.DatabaseName:=FDatabaseName;
         Query.SQL.Text:=Template.SQLText;
         Query.Open;
         Query.First;
         if not Query.Eof then begin
            Result:=True;
            for I:=0 to Pred(ParameterList.Count) do begin
               Parameter:=ParameterList[I];
               if Parameter.FieldName<>'' then begin
                  Field:=Query.FindField(Parameter.FieldName);
                  if Field<>nil then begin
                     case Parameter.ParameterType of
                        ptString, ptMemo: Parameter.Value:=Field.AsString;
                        ptNumber: Parameter.Value:=Field.Value;
                        ptDate: Parameter.Value:=Field.Value;
                     end;
                  end;
               end
               else if Parameter.ParameterType=ptTable then begin
                  //--Parameter.ParameterList.ConfigMemTable(Parameter.DataSet);
                  if Parameter.SQLText<>'' then begin
                     TableQuery.SQL.Text:=Parameter.SQLText;
                     TableQuery.Open;
                     TableQuery.First;
                     if not TableQuery.Eof then begin
                        Parameter.ParameterList.CopyDataSet(TableQuery, Parameter.DataSet);
                     end;
                     TableQuery.Close;
                  end;
               end
               else if Parameter.SQLText<>'' then begin
                  FieldQuery.SQL.Text:=Parameter.SQLText;
                  FieldQuery.Open;
                  FieldQuery.First;
                  if not FieldQuery.Eof and (FieldQuery.Fields.Count>0) then begin
                     case Parameter.ParameterType of
                        ptString, ptMemo: Parameter.Value:=FieldQuery.Fields[0].AsString;
                        ptNumber: Parameter.Value:=FieldQuery.Fields[0].Value;
                        ptDate: Parameter.Value:=FieldQuery.Fields[0].Value;
                     end;
                  end;
                  FieldQuery.Close;
               end;
            end;
         end;
      finally
         Query.Free;
         TableQuery.Free;
         FieldQuery.Free;
      end;
   end;
end;

{ TDefaultFormSetter }

constructor TDefaultFormSetter.Create;
begin
end;

destructor TDefaultFormSetter.Destroy;
begin
   inherited;
end;

procedure TDefaultFormSetter.SetData(Template: TTemplate; ParameterList: TParameterList; ControlLinkList: TControlLinkList);
var
   I: Integer;
   ControlLink: TControlLink;
begin
   if (Template<>nil) and (ParameterList<>nil) and (ControlLinkList<>nil) then begin
      for I:=0 to Pred(ControlLinkList.Count) do begin
         ControlLink:=ControlLinkList[I];
         if (ControlLink.Parameter.Value=Null) and (ControlLink.Parameter.DefaultValue<>'') then begin
            ControlLink.SetValue(ControlLink.Parameter.DefaultValue);
         end
         else begin
            ControlLink.SetValue(ControlLink.Parameter.Value);
         end;
      end;
   end;
end;

{ TEditEhLink }

constructor TEditEhLink.Create(Parameter: TParameter; Control: TControl);
begin
   FParameter:=Parameter;
   FControl:=Control;
   FEdit:=TDBEditEh(Control);
end;

destructor TEditEhLink.Destroy;
begin
   inherited;
end;

function TEditEhLink.GetValue: Variant;
begin
   Result:=FEdit.Text;
end;

procedure TEditEhLink.SetValue(Value: Variant);
begin
   if Value<>Null then begin
      FEdit.Text:=Value;
   end
   else begin
      FEdit.Text:='';
   end;
end;

{ TDateTimeEditLink }

constructor TDateTimeEditEhLink.Create(Parameter: TParameter; Control: TControl);
begin
   FParameter:=Parameter;
   FControl:=Control;
   FDateTime:=TDBDateTimeEditEh(Control);
end;

destructor TDateTimeEditEhLink.Destroy;
begin
   inherited;
end;

function TDateTimeEditEhLink.GetValue: Variant;
begin
   Result:=FDateTime.Value;
end;

procedure TDateTimeEditEhLink.SetValue(Value: Variant);
begin
   if Value<>Null then begin
      FDateTime.Value:=Value;
   end
   else begin
      FDateTime.Value:=Null;
   end;
end;

{ TNumberEditEhLink }

constructor TNumberEditEhLink.Create(Parameter: TParameter; Control: TControl);
begin
   FParameter:=Parameter;
   FControl:=Control;
   FNumber:=TDBNumberEditEh(Control);
end;

destructor TNumberEditEhLink.Destroy;
begin
   inherited;
end;

function TNumberEditEhLink.GetValue: Variant;
begin
   Result:=FNumber.Value;
end;

procedure TNumberEditEhLink.SetValue(Value: Variant);
begin
   if Value<>Null then begin
      FNumber.Value:=Value;
   end
   else begin
      FNumber.Value:=Null;
   end;
end;

{ TGridEhLink }

constructor TGridEhLink.Create(Parameter: TParameter; Control: TControl);
begin
   FParameter:=Parameter;
   FControl:=Control;
   FGrid:=TDBGridEh(Control);
   if FGrid.DataSource<>nil then begin
      FDataSet:=FGrid.DataSource.DataSet;
   end;
end;

destructor TGridEhLink.Destroy;
begin
   inherited;
end;

function TGridEhLink.GetValue: Variant;
begin
   Result:=Integer(FParameter.DataSet);
   if FDataSet<>nil then begin
      FParameter.DataSet.EmptyTable;
      FParameter.ParameterList.CopyDataSet(FDataSet, FParameter.DataSet);
   end;
end;

procedure TGridEhLink.SetValue(Value: Variant);
var
   I: Integer;
   Source: TDataSet;
   Rownum: TField;
begin
   if (FDataSet<>nil) and (Value<>Null) then begin
      Source:=TDataSet(Integer(Value));
      if Source<>nil then begin
         FParameter.ParameterList.CopyDataSet(Source, FDataSet);
         Rownum:=FDataSet.FindField('_ROWNUM_');
         if Rownum<>nil then begin
            FDataSet.First;
            I:=0;
            while not FDataSet.Eof do begin
               Inc(I);
               FDataSet.Edit;
               Rownum.AsInteger:=I;
               FDataSet.Post;
               FDataSet.Next;
            end;
         end;
         FDataSet.First;
      end;
   end;
end;

{ TDefaultFormGetter }

constructor TDefaultFormGetter.Create;
begin
end;

destructor TDefaultFormGetter.Destroy;
begin
   inherited;
end;

function TDefaultFormGetter.GetData(Template: TTemplate; ParameterList: TParameterList; ControlLinkList: TControlLinkList): Boolean;
var
   I: Integer;
   ControlLink: TControlLink;
begin
   Result:=False;
   if (Template<>nil) and (ParameterList<>nil) and (ControlLinkList<>nil) then begin
      for I:=0 to Pred(ControlLinkList.Count) do begin
         ControlLink:=ControlLinkList[I];
         ControlLink.Parameter.Value:=ControlLink.GetValue;
      end;
      Result:=True;
   end;
end;

{ TWordGenerator }

constructor TWordGenerator.Create;
begin
end;

destructor TWordGenerator.Destroy;
begin
   inherited;
end;

function TWordGenerator.GenerateText(Template: TTemplate; ParameterList: TParameterList; Text: TStringList; TemplateFileName, OutputFileName: string): Boolean;
var
   I: Integer;
   J: Integer;
   Parameter: TParameter;
   ColumnParameter: TParameter;
   ValueText: string;
   fCloseWord: Boolean;
   WordApp: _Application;
   WordDoc: _Document;
   vFileName: OleVariant;
   vConfirmConversions: OleVariant;
   vReadOnly: OleVariant;
   vAddToRecentFiles: OleVariant;
   vPasswordDocument: OleVariant;
   vPasswordTemplate: OleVariant;
   vRevert: OleVariant;
   vWritePasswordDocument: OleVariant;
   vWritePasswordTemplate: OleVariant;
   vFormat: OleVariant;
   vFindText: OleVariant;
   vMatchCase: OleVariant;
   vMatchWholeWord: OleVariant;
   vMatchWildcards: OleVariant;
   vMatchSoundsLike: OleVariant;
   vMatchAllWordForms: OleVariant;
   vForward: OleVariant;
   vWrap: OleVariant;
   vReplaceWith: OleVariant;
   vReplace: OleVariant;
   vFileFormat: OleVariant;
   vLockComments: OleVariant;
   vPassword: OleVariant;
   vWritePassword: OleVariant;
   vReadOnlyRecommended: OleVariant;
   vEmbedTrueTypeFonts: OleVariant;
   vSaveNativePictureFormat: OleVariant;
   vSaveFormsData: OleVariant;
   vSaveAsAOCELetter: OleVariant;
   vSaveChanges: OleVariant;
   vOriginalFormat: OleVariant;
   vRouteDocument: OleVariant;
   vStart: OleVariant;
   vFirstStart: OleVariant;
   vEnd: OleVariant;
   vUnit: OleVariant;
   vCount: OleVariant;
   vExtend: OleVariant;
vRange: OleVariant;
vLink: OleVariant;
vAttachment: OleVariant;
//
//--vTemplate: OleVariant;
//--vNewTemplate: OleVariant;
//
   Field: TField;
begin
   Result:=False;
   if (Template<>nil) and (ParameterList<>nil) and (Text<>nil) then begin
      if (TemplateFileName<>'') and FileExists(TemplateFileName) then begin
         if FileExists(OutputFileName) then begin
            if not DeleteFile(OutputFileName) then begin
               MessageDlg(Format('Невозможна запись в документ с именем "%s".'#10'Возможно файл с таким именем уже открыт в программе Word.', [OutputFileName]), mtWarning, [mbOk], 0);
               Exit;
            end;
         end;
         //
//if not CopyFile(PChar(TemplateFileName), PChar(OutputFileName), False) then begin
//   MessageDlg(Format('Ошибка копирования "%s".'#10'Возможно файл с таким именем уже открыт в программе Word.', [OutputFileName]), mtError, [mbOk], 0);
//   Exit;
//end;
         //
         fCloseWord:=False;
         try
            GetActiveOleObject('Word.Application').QueryInterface(_Application, WordApp);
         except
            WordApp:=nil;
         end;
         if not Assigned(WordApp) then begin
            try
               //--WordApp:=CoApplication_.Create;
               CreateOleObject('Word.Application').QueryInterface(_Application, WordApp);
               fCloseWord:=True;
            except
               WordApp:=nil;
            end;
         end;
         try
            try
               if Assigned(WordApp) then begin
                  vFileName:=TemplateFileName;
                  //
//vFileName:=OutputFileName;
                  //
                  vConfirmConversions:=False;
                  vReadOnly:=False;
                  vAddToRecentFiles:=False;
                  vPasswordDocument:='';
                  vPasswordTemplate:='';
                  vRevert:=False;
                  vWritePasswordDocument:='';
                  vWritePasswordTemplate:='';
                  vFormat:=wdOpenFormatAuto;
                  //
//vTemplate:=TemplateFileName;
//vNewTemplate:=False;
//WordDoc:=WordApp.Documents.Add(vTemplate, vNewTemplate);
                  WordDoc:=WordApp.Documents.Open(vFileName, vConfirmConversions, vReadOnly, vAddToRecentFiles, vPasswordDocument, vPasswordTemplate, vRevert, vWritePasswordDocument, vWritePasswordTemplate, vFormat);
                  if Assigned(WordDoc) then begin
                     vMatchCase:=False;
                     vMatchWholeWord:=False;
                     vMatchWildcards:=False;
                     vMatchSoundsLike:=False;
                     vMatchAllWordForms:=False;
                     vForward:=True;
                     vWrap:=wdFindContinue;
                     vFormat:=False;
                     for I:=0 to Pred(ParameterList.Count) do begin
                        Parameter:=ParameterList[I];
                        if Parameter.ParameterType=ptTable then begin
                           vFindText:='#'+Parameter.CodeName+'_';
                           vReplaceWith:='';
                           vReplace:=wdReplaceNone;
                           WordApp.Selection.Find.Execute(vFindText, vMatchCase, vMatchWholeWord, vMatchWildcards, vMatchSoundsLike, vMatchAllWordForms, vForward, vWrap, vFormat, vReplaceWith, vReplace);
                           vUnit:=wdCharacter;
                           vCount:=1;
                           WordApp.Selection.Delete(vUnit, vCount);
                           vStart:=WordApp.Selection.Get_End_;
                           vFirstStart:=vStart;
                           vFindText:='_'+Parameter.CodeName+'&';
                           WordApp.Selection.Find.Execute(vFindText, vMatchCase, vMatchWholeWord, vMatchWildcards, vMatchSoundsLike, vMatchAllWordForms, vForward, vWrap, vFormat, vReplaceWith, vReplace);
                           vExtend:=wdExtend;
                           WordApp.Selection.MoveRight(vUnit, vCount, vExtend);
                           WordApp.Selection.Delete(vUnit, vCount);
                           vEnd:=WordApp.Selection.Get_Start;
                           vExtend:=wdMove;
                           WordApp.Selection.Set_Start(vStart);
                           WordApp.Selection.Set_End_(vStart);
                           WordApp.Selection.MoveRight(vUnit, vCount, vExtend);
                           WordApp.Selection.Set_End_(vEnd);
                           WordApp.Selection.Copy;
                           WordApp.Selection.Cut;
                           if not Parameter.DataSet.Active then begin
                              Parameter.DataSet.Open;
                           end;
                           Parameter.DataSet.First;
                           while not Parameter.DataSet.Eof do begin
                              vStart:=WordApp.Selection.Get_Start;
                              WordApp.Selection.Paste;
                              vEnd:=WordApp.Selection.Get_End_;
                              WordApp.Selection.Set_Start(vStart);
                              WordApp.Selection.Set_End_(vEnd);
                              vReplace:=wdReplaceAll;
                              for J:=0 to Pred(Parameter.ParameterList.Count) do begin
                                 ColumnParameter:=Parameter.ParameterList[J];
                                 Field:=Parameter.DataSet.FindField(ColumnParameter.FieldName);
                                 if Field<>nil then begin
                                    ValueText:=StringReplace(Field.AsString, #10, '', [rfReplaceAll, rfIgnoreCase]);
                                    vFindText:='#'+ColumnParameter.CodeName+'&';
                                    vReplaceWith:=ValueText;
                                    WordApp.Selection.Find.Execute(vFindText, vMatchCase, vMatchWholeWord, vMatchWildcards, vMatchSoundsLike, vMatchAllWordForms, vForward, vWrap, vFormat, vReplaceWith, vReplace);
                                 end;
                              end;
                              //--WordApp.Selection.MoveRight(vUnit, vCount, vExtend);
                              WordApp.Selection.Set_Start(vEnd);
                              WordApp.Selection.Set_End_(vEnd);
                              Parameter.DataSet.Next;
                           end;
                           WordApp.Selection.Set_Start(vFirstStart);
                           WordApp.Selection.Set_End_(vFirstStart);
                           vExtend:=wdExtend;
                           WordApp.Selection.MoveRight(vUnit, vCount, vExtend);
                           WordApp.Selection.Delete(vUnit, vCount);
                        end
                        else if Parameter.ParameterType=ptFile then begin
                           vFindText:='#'+Parameter.CodeName+'&';
                           vReplace:=wdReplaceNone;
                           if WordApp.Selection.Find.Execute(vFindText, vMatchCase, vMatchWholeWord, vMatchWildcards, vMatchSoundsLike, vMatchAllWordForms, vForward, vWrap, vFormat, vReplaceWith, vReplace) then begin
                              vFileName:=ExtractFilePath(Application.ExeName)+ExtractFileName(Parameter.GetText);
                              if not FileExists(vFileName) then begin
                                 vFileName:=ExtractFilePath(TemplateFileName)+ExtractFileName(Parameter.GetText);
                              end;
                              vRange:='';
                              vConfirmConversions:=False;
                              vLink:=False;
                              vAttachment:=False;
                              WordApp.Selection.InsertFile(vFileName, vRange, vConfirmConversions, vLink, vAttachment);
                              WordApp.Selection.TypeBackspace;
                           end;
                        end
                        else begin
                           ValueText:=StringReplace(Parameter.GetText, #10, '', [rfReplaceAll, rfIgnoreCase]);
                           vFindText:='#'+Parameter.CodeName+'&';
                           vReplaceWith:=ValueText;
                           vReplace:=wdReplaceAll;
                           WordApp.Selection.Find.Execute(vFindText, vMatchCase, vMatchWholeWord, vMatchWildcards, vMatchSoundsLike, vMatchAllWordForms, vForward, vWrap, vFormat, vReplaceWith, vReplace);
                        end;
                     end;
                     vFileName:=OutputFileName;
                     vFileFormat:=wdFormatDocument;
                     vLockComments:=False;
                     vPassword:='';
                     vAddToRecentFiles:=False;
                     vWritePassword:='';
                     vReadOnlyRecommended:=False;
                     vEmbedTrueTypeFonts:=False;
                     vSaveNativePictureFormat:=False;
                     vSaveFormsData:=False;
                     vSaveAsAOCELetter:=False;
                     if not DirectoryExists(ExtractFilePath(OutputFileName)) then begin
                        ForceDirectories(ExtractFilePath(OutputFileName));
                     end;
                     WordDoc.SaveAs(vFileName, vFileFormat, vLockComments, vPassword, vAddToRecentFiles, vWritePassword, vReadOnlyRecommended, vEmbedTrueTypeFonts, vSaveNativePictureFormat, vSaveFormsData, vSaveAsAOCELetter);
                     //
//WordDoc.Save;
                     //
                     Result:=True;
                  end;
                  vSaveChanges:=wdDoNotSaveChanges;
                  vOriginalFormat:=wdOriginalDocumentFormat;
                  vRouteDocument:=False;
                  WordDoc.Close(vSaveChanges, vOriginalFormat, vRouteDocument);
//WordApp.ActiveDocument.Close(vSaveChanges, vOriginalFormat, vRouteDocument);
                  //WordDoc.Saved:=True;
                  //--WordApp.Visible:=True;
               end;
            except
               vSaveChanges:=wdDoNotSaveChanges;
               vOriginalFormat:=wdOriginalDocumentFormat;
               vRouteDocument:=False;
               WordApp.Quit(vSaveChanges, vOriginalFormat, vRouteDocument);
               raise;
            end;
         finally
            if fCloseWord then begin
               //--vSaveChanges:=wdDoNotSaveChanges;
               //--vOriginalFormat:=wdOriginalDocumentFormat;
               //--vRouteDocument:=False;
               //??ActiveWindow.Close
               //??Application.Quit
               //--WordApp.Quit(vSaveChanges, vOriginalFormat, vRouteDocument);
            end;
            //WordDoc:=nil;
            //WordApp:=nil;
         end;
      end;
   end;
end;

{ TDefaultTextViewer }

constructor TDefaultTextViewer.Create;
begin
end;

destructor TDefaultTextViewer.Destroy;
begin
   inherited;
end;

procedure TDefaultTextViewer.ViewText(Template: TTemplate; Text: TStringList; OutputFileName: string);
   {--
var
   WordApp: _Application;
   WordDoc: _Document;
   vTemplate: OleVariant;
   vNewTemplate: OleVariant;
   vFileName: OleVariant;
   vRange: OleVariant;
   vConfirmConversions: OleVariant;
   vLink: OleVariant;
   vAttachment: OleVariant;
   //vUnit: OleVariant;
   //vExtend: OleVariant;
   hDocument: HWND;
   S: string;
   }
begin
   OutputFileName:=Trim(OutputFileName);
   if (OutputFileName<>'') and FileExists(OutputFileName) then begin
      {--
      try
         GetActiveOleObject('Word.Application').QueryInterface(_Application, WordApp);
      except
         WordApp:=nil;
      end;
      if not Assigned(WordApp) then begin
         try
            CreateOleObject('Word.Application').QueryInterface(_Application, WordApp);
         except
            WordApp:=nil;
         end;
      end;
      if Assigned(WordApp) then begin
//         vTemplate:='';
         vTemplate:=OutputFileName;
         vNewTemplate:=False;
         vFileName:=OutputFileName;
         vRange:='';
         vConfirmConversions:=False;
         vLink:=False;
         vAttachment:=False;
         WordDoc:=WordApp.Documents.Add(vTemplate, vNewTemplate);
//         WordApp.Selection.InsertFile(vFileName, vRange, vConfirmConversions, vLink, vAttachment);
         WordApp.ActiveDocument.Saved:=True;
//         vUnit:=wdStory;
//         vExtend:=wdMove;
//         WordApp.Selection.HomeKey(vUnit, vExtend);
         WordApp.WindowState:=wdWindowStateMaximize;
         WordApp.Visible:=True;
         WordApp.ActiveDocument.Activate;
         S:=WordDoc.Name+' - '+WordApp.Name;
         hDocument:=FindWindow(nil, PChar(S));
         if hDocument<>0 then begin
            SetForegroundWindow(hDocument);
         end;
      end;
      }
      ShellExecute(0, nil, PChar(OutputFileName), nil, nil, SW_SHOWNORMAL);
   end;
end;

{ TRtfGenerator }

constructor TRtfGenerator.Create;
begin
end;

destructor TRtfGenerator.Destroy;
begin
   inherited;
end;

function TRtfGenerator.GenerateText(Template: TTemplate; ParameterList: TParameterList; Text: TStringList; TemplateFileName, OutputFileName: string): Boolean;
const
   CRtfHead='{\rtf';
var
   I: Integer;
   Parameter: TParameter;
   TextDoc: string;
   OutDoc: string;
   CurPos: Integer;
   FirstPos: Integer;
   TablePos: Integer;
   MaxLen: Integer;
   S: string;
   Ch: string;
   CodeName: string;
   Value: string;
   FileName: string;
   Table: TParameter;
   Field: TField;
   inTable: Boolean;

   function NextToken: string;
   var
      StartPos: Integer;
   begin
      Result:='';
      Ch:='';
      while CurPos<=MaxLen do begin
         if TextDoc[CurPos] in ['{', '}'] then begin
            Result:=TextDoc[CurPos];
            Inc(CurPos);
            Break;
         end
         else if TextDoc[CurPos]='\' then begin
            StartPos:=CurPos;
            Inc(CurPos);
            if CurPos>=MaxLen then begin
               Break;
            end;
            if TextDoc[CurPos] in ['a'..'z'] then begin
               Inc(CurPos);
               if CurPos>=MaxLen then begin
                  Break;
               end;
               while (TextDoc[CurPos] in ['a'..'z', 'A'..'Z']) and (CurPos<MaxLen) do begin
                  Inc(CurPos);
               end;
               if TextDoc[CurPos]=' ' then begin
                  Inc(CurPos);
                  Result:=Copy(TextDoc, StartPos, CurPos-StartPos);
                  Break;
               end
               else begin
                  if TextDoc[CurPos]='-' then begin
                     Inc(CurPos);
                     if CurPos>=MaxLen then begin
                        Break;
                     end;
                  end;
                  while (TextDoc[CurPos] in ['0'..'9']) and (CurPos<MaxLen) do begin
                     Inc(CurPos);
                  end;
                  if TextDoc[CurPos]=' ' then begin
                     Inc(CurPos);
                  end;
                  Result:=Copy(TextDoc, StartPos, CurPos-StartPos);
                  Break;
               end;
            end
            else if TextDoc[CurPos]='''' then begin
               Inc(CurPos);
               if CurPos+1>=MaxLen then begin
                  Break;
               end;
               if (TextDoc[CurPos] in ['0'..'9', 'a'..'f']) and (TextDoc[CurPos+1] in ['0'..'9', 'a'..'f']) then begin
                  Ch:=Chr(StrToInt('$'+TextDoc[CurPos]+TextDoc[CurPos+1]));
                  Inc(CurPos, 2);
                  Result:=Copy(TextDoc, StartPos, CurPos-StartPos);
                  Break;
               end
               else begin
                  Break;
               end;
            end
            else if TextDoc[CurPos] in ['-', '_', '~', '\', '{', '}'] then begin
               Ch:=TextDoc[CurPos];
               Inc(CurPos);
               Result:=Copy(TextDoc, StartPos, CurPos-StartPos);
               Break;
            end
            else begin
               Inc(CurPos);
               Result:=Copy(TextDoc, StartPos, CurPos-StartPos);
               Break;
            end;
         end
         else begin
            Ch:=TextDoc[CurPos];
            Result:=TextDoc[CurPos];
            Inc(CurPos);
            Break;
         end;
      end;
      if (Ch<>'') and (Ch[1]<' ') then begin
         Ch:='';
      end;
   end;

   function GetRtfText(FileName: string): string;
   var
      P: Integer;
   begin
      Result:='';
      if FileExists(FileName) then begin
         Result:=LoadFromFile(FileName);
         if (Length(Result)>Length(CRtfHead)) and SameText(CRtfHead, Copy(Result, 1, Length(CRtfHead))) then begin
            P:=Pos('\plain', Result);
            Delete(Result, 1, P+6);
            Delete(Result, Length(Result)-6, 7);
            Result:=Result+'}';
            //
            if inTable then begin
               Result:=StringReplace(Result, '\pard', '\pard\intbl', [rfReplaceAll, rfIgnoreCase]);
            end;
         end
         else begin
            MessageDlg(Format('Файл "%s" не является файлом в формате rtf. Откройте этот файл в программе Word и через пункт меню "Файл->Сохранить как..." сохраните его в формате rtf.', [FileName]), mtWarning, [mbOk], 0);
            Result:='';
         end;
      end;
   end;

begin
   Result:=False;
   if (Template<>nil) and (ParameterList<>nil) and (Text<>nil) then begin
      if (TemplateFileName<>'') and FileExists(TemplateFileName) then begin
         if FileExists(OutputFileName) then begin
            if not DeleteFile(OutputFileName) then begin
               MessageDlg(Format('Невозможна запись в документ с именем "%s".'#10'Возможно файл с таким именем уже открыт в программе Word.', [OutputFileName]), mtWarning, [mbOk], 0);
               Exit;
            end;
         end;
         TextDoc:=LoadFromFile(TemplateFileName);
         //проверяем, что файл шаблона действительно в формате rtf
         if not ((Length(TextDoc)>Length(CRtfHead)) and SameText(CRtfHead, Copy(TextDoc, 1, Length(CRtfHead)))) then begin
            MessageDlg(Format('Файл "%s" не является файлом в формате rtf. Откройте этот файл в программе Word и через пункт меню "Файл->Сохранить как..." сохраните его в формате rtf.', [TemplateFileName]), mtWarning, [mbOk], 0);
            Exit;
         end;
         //
         inTable:=False;
         Table:=nil;
         TablePos:=-1;
         CurPos:=Pred(Pos('plain', TextDoc));
         OutDoc:=Copy(TextDoc, 1, Pred(CurPos));
         MaxLen:=Length(TextDoc);
         while CurPos<=MaxLen do begin
            S:=NextToken;
            if Ch='#' then begin
               FirstPos:=CurPos;
               CodeName:='';
               Ch:='';
               while (CurPos<=MaxLen) and (Ch<>'&') do begin
                  NextToken;
                  if Ch<>'&' then begin
                     CodeName:=CodeName+Ch;
                  end
               end;
               if Table=nil then begin
                  Parameter:=ParameterList.ByCodeName(CodeName);
               end
               else if SameText(Table.CodeName, CodeName) then begin
                  Parameter:=Table;
               end
               else begin
                  Parameter:=Table.ParameterList.ByCodeName(CodeName);
               end;
               if Parameter<>nil then begin
                  // вставляем значение параметра
                  if Parameter.ParameterType=ptTable then begin
                     // таблица
                  end
                  else if Parameter.ParameterType=ptFile then begin
                     // файл
                     FileName:=ExtractFilePath(Application.ExeName)+ExtractFileName(Parameter.GetText);
                     if not FileExists(FileName) then begin
                        FileName:=ExtractFilePath(TemplateFileName)+ExtractFileName(Parameter.GetText);
                     end;
                     Value:=GetRtfText(FileName);
                     OutDoc:=OutDoc+Value;
                  end
                  else begin
                     // обычный параметр
                     if Table<>nil then begin
                        Field:=Table.DataSet.FindField(Parameter.FieldName);
                        Value:='';
                        if Field<>nil then begin
                           Value:=Field.AsString;
                        end;
                     end
                     else begin
                        Value:=Parameter.GetText;
                     end;
                     for I:=1 to Length(Value) do begin
                        case Value[I] of
                           #09: begin
                              OutDoc:=OutDoc+'\tab ';
                           end;
                           #10: begin
                           end;
                           #13: begin
                              OutDoc:=OutDoc+'\par ';
                           end;
                           '{', '}', '\': begin
                              OutDoc:=OutDoc+'\'+Value[I];
                           end;
                           Chr(160): begin
                              OutDoc:=OutDoc+'\~';
                           end;
                           Chr(128)..Chr(159), Chr(161)..Chr(255): begin
                              OutDoc:=OutDoc+'\'''+LowerCase(IntToHex(Ord(Value[I]), 2));
                           end;
                        else
                           OutDoc:=OutDoc+Value[I];
                        end;
                     end;
                  end;
                  // повторяем вывод имени параметра, но оставляем только управляющие последовательности
                  CurPos:=Pred(FirstPos);
                  Ch:='';
                  while (CurPos<=MaxLen) and (Ch<>'&') do begin
                     S:=NextToken;
                     if Ch='' then begin
                        OutDoc:=OutDoc+S;
                     end;
                  end;
                  if Parameter.ParameterType=ptTable then begin
                     // убираем первый после имени таблицы \par
                     S:='';
                     while (CurPos<=MaxLen) and (S<>'\par ') do begin
                        S:=NextToken;
                        if S<>'\par ' then begin
                           OutDoc:=OutDoc+S;
                        end;
                     end;
                     // ищем первый после имени таблицы конец или начало группы
                     S:='';
                     while (CurPos<=MaxLen) and (S<>'{') and (S<>'}') do begin
                        S:=NextToken;
                        OutDoc:=OutDoc+S;
                     end;
                     if Table=nil then begin
                        if S='}' then begin
                           TablePos:=CurPos;
                        end
                        else begin
                           OutDoc[Length(OutDoc)]:='}';
                           OutDoc:=OutDoc+'{{';
                           TablePos:=CurPos-2;
                           TextDoc[TablePos]:='{';
                        end;
                        Table:=Parameter;
                        if not Table.DataSet.Active then begin
                           Table.DataSet.Open;
                        end;
                        Table.DataSet.First;
                     end
                     else if TablePos<>-1 then begin
                        Table.DataSet.Next;
                        if not Table.DataSet.Eof then begin
                           CurPos:=TablePos;
                        end
                        else begin
                           Table.DataSet.Close;
                           Table:=nil;
                           TablePos:=-1;
                        end;
                     end;
                  end;
               end
               else begin
                  CurPos:=FirstPos;
                  OutDoc:=OutDoc+S;
               end;
            end
            else begin
               if SameText(Trim(S), '\intbl') then begin
                  inTable:=True;
               end
               else if SameText(Trim(S), '\cell') then begin
                  inTable:=False;
               end;
               OutDoc:=OutDoc+S;
            end;
         end;
         if not DirectoryExists(ExtractFilePath(OutputFileName)) then begin
            ForceDirectories(ExtractFilePath(OutputFileName));
         end;
         SaveToFile(OutDoc, OutputFileName);
         Result:=True;
      end;
   end;
end;

function TRtfGenerator.LoadFromFile(FileName: string): string;
var
   Stream: TStream;
   Size: Integer;
begin
   Stream:=TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
   try
      Size:=Stream.Size-Stream.Position;
      SetString(Result, nil, Size);
      Stream.Read(Pointer(Result)^, Size);
   finally
      Stream.Free;
   end;
end;

procedure TRtfGenerator.SaveToFile(S, FileName: string);
var
   Stream: TStream;
begin
   Stream:=TFileStream.Create(FileName, fmCreate);
   try
      Stream.WriteBuffer(Pointer(S)^, Length(S));
   finally
      Stream.Free;
   end;
end;

{ TReadParameterFromRtf }

constructor TReadParameterFromRtf.Create(Source: string);
begin
   //--FTextDoc:=LoadFromFile(Source);
end;

destructor TReadParameterFromRtf.Destroy;
begin
   inherited;
end;

{--
function TReadParameterFromRtf.LoadFromFile(FileName: string): string;
var
   Stream: TStream;
   Size: Integer;
begin
   Stream:=TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
   try
      Size:=Stream.Size-Stream.Position;
      SetString(Result, nil, Size);
      Stream.Read(Pointer(Result)^, Size);
   finally
      Stream.Free;
   end;
end;
}
function TReadParameterFromRtf.ReadParameter(ParameterName: string; Params: TStringList): TParameter;
const
   CRowNumber=4;
begin
   Result:=TParameter.Create(ParameterName, ParameterName, ParameterName, ptMemo, '', 0, 100, CRowNumber, -1, ParameterName, [], '', '');
end;

function TReadParameterFromRtf.ReadParameterList(FullName: string; ParameterList: TParameterList; Params: TStringList): Boolean;
var
   I: Integer;
   J: Integer;
   P: Integer;
   Fields: string;
   Tables: string;
   Files: string;
   TableName: string;
   sl: TStringList;
   tbl: TStringList;
   TablePar: TParameter;
   Parameter: TParameter;
begin
   Result:=False;
   if ParameterList<>nil then begin
      ParameterList.Clear;
      sl:=TStringList.Create;
      tbl:=TStringList.Create;
      tbl.Sorted:=True;
      tbl.Duplicates:=dupIgnore;
      try
         {!!!!!!!!!
         // 1. Ищем в строке (тексте rtf-файла) все вхождения вида #<идентификатор>&
         I:=1;
         while I<Length(FTextDoc) do begin
            if FTextDoc[I]='#' then begin
               J:=I;
               Inc(I);
               while (FTextDoc[I]<>'&') and (Pos(FTextDoc[I], 'QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm')<>0) and (I<Length(FTextDoc)) do begin
                  Inc(I);
               end;
               if FTextDoc[I]='&' then begin
                  sl.Add(AnsiUpperCase(Copy(FTextDoc, Succ(J), Pred(I-J))));
               end;
            end
            else begin
               Inc(I);
            end;
         end;
         }
         sl.Text:=FullName;
         if sl.Count>0 then Fields:=Trim(sl[0]) else Fields:='';
         if sl.Count>1 then Tables:=Trim(sl[1]) else Tables:='';
         if sl.Count>2 then Files :=Trim(sl[2]) else Files:='';
         //
         sl.Clear;
         sl.Sorted:=True;
         sl.Duplicates:=dupIgnore;
         // 2. Создаем список параметров
         sl.CommaText:=Fields;
         for I:=0 to Pred(sl.Count) do begin
            Parameter:=ReadParameter(sl[I], Params);
            if Parameter<>nil then begin
               ParameterList.Add(Parameter);
               Parameter.Order:=Succ(I);
            end;
         end;
         // 3. Создаем список таблиц
         tbl.CommaText:='"'+Tables+'"';
         for I:=0 to Pred(tbl.Count) do begin
            P:=Pos('=', tbl[I]);
            if P<>0 then begin
               Fields:=Copy(tbl[I], Succ(P), Length(tbl[I])-P);
               TableName:=Copy(tbl[I], 1, Pred(P));
               sl.CommaText:=Fields;
               TablePar:=TParameter.Create(TableName, TableName, TableName, ptTable, '', 0, 100, sl.Count, -1, TableName, [], '', '');
               ParameterList.Add(TablePar);
               //
               for J:=0 to Pred(sl.Count) do begin
                  Parameter:=ReadParameter(sl[J], Params);
                  if Parameter<>nil then begin
                     TablePar.ParameterList.Add(Parameter);
                     Parameter.Order:=Succ(J);
                  end;
               end;
               //
               TablePar.ParameterList.ConfigMemTable(TablePar.DataSet);
            end;
         end;
         // 3. Создаем список файлов
         sl.CommaText:=Files;
         for I:=0 to Pred(sl.Count) do begin
            Parameter:=TParameter.Create(sl[I], sl[I], sl[I], ptFile, '', 0, 100, 0, -1, sl[I], [], '', '');
            if Parameter<>nil then begin
               ParameterList.Add(Parameter);
               Parameter.Order:=-Succ(I);
            end;
         end;
         //
         ParameterList.Reorder;
         Result:=True;
      finally
         tbl.Free;
         sl.Free;
      end;
   end;
end;

end.
