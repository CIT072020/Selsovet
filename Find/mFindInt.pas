// интерфейсный модуль для фильтра
unit mFindInt; // find interface module [08.09.2004]
// изменения (NB в данном списке указаны не все изменения):
//   [2005.04.20] + ShowGroups (True)
//                  можно отключать показ групп в верхней части дерева полей,
//                  если у таблицы их нет или по другим причинам
//   [2005.04.24] + SelectFindValue, OnSelectFindValue
//                  можно подключать свои диалоги выбора из справочника
//   [2005.04.24] + fekGridW2, sekGrid2
//                  это новый вариант редактирования поля, когда можно только
//                  сделать выбор из справочника и показывается только наименование
//   [2005.04.29] + ShowMiddleSpace (True)
//                  можно отключать показ пространства с кнопками между деревом
//                  полей и деревом условий
//   [2005.06.13] * TOnFilterEvent
//                  появился параметр Sender: TObject
//   [2005.06.14] + TOnAddFilterMenu
//                  это событие вызывается для каждого пункта меню при построении
//                  меню фильтров
//   [2005.08.17] + UserRights ([])
//                  набор прав пользователя на выполнение следующих функций:
//                  работа с дизайнером форм, доступ к настройкам дерева полей,
//                  тестированию ошибок, тестированию запроса
//   [2005.08.17] * AdminUser
//                  изменение свойства AdminUser приводит к изменению UserRights
//   [2005.08.24] * Диалог добавления нового условия в список условий
//                  перемещён CheckBox "запрашивать значение во время поиска"
//                  и рядом с ним появился CheckBox "можно оставлять значение пустым"
//   [2005.08.25] * Диалог ввода параметров фильтра
//                  добавилась кнопка "Очистить"
//                + Диалог "Настройки..."
//                  можно ввести заголовок для формы ввода параметров фильтра
//                  можно отключать показ заголовка
//                  можно настроить показать/скрыть кнопку "Очистить"
//   [2005.09.09] * TOpItem изменился на TOperItem, TOpList -> TOperList
//                + Изменения для поддержки группировки по полям
//   [2005.09.21] + ffkText
//   [2005.12.22] + ширина колонки в пикселах для TGroupItem
//   [2006.08.05] + поддержка поиска по части даты (включая текущий возраст)
//   [2006.08.08] + fekMonth
//   [2006.08.09] + fekAge
//   [2007.01.08] + IncMonth
//   [2007.10.11] ! Исправление ошибки сохранения значений параметров в фильтре
//      *TFindList.ItemToStrings1
//      *TFindList.ParamsToString
//   [2008.01.29] ! Исправление ошибки сортировки, когда FOrder определялся по индексу в FList во время сортировки
//   [2008.04.04] ! Исправление ошибки TValueControl.TDBEditEh_IsValue для fekGridW2
//   [2008.06.04] + ffkDoTrim
//                  флаг, у поля надо убирать пробелы перед поиском (Trim)
//                  действует только для текстовых полей
//   [2008.06.04] * При формировании меню фильтров теперь все папки будут "вверху",
//                  имена фильтров будут отсортированы по алфавиту
//                * Добавлена возможность указывать тип отношений (1:1, 1:M, M:1, M:M)
//                  слово "список" будет теперь добавляться в зависимости от типа отношения
//   [2009.04.15] ! Исправление ошибки чтения сохраненного фильтра. Ошибка из-за перехода на delphi 7
//                  В delphi 7 отличается работа TStringList.CommaText:
//                  "Including a trailing comma in the source string causes a blank item to be included in the string list"
interface
uses
   Forms, Classes, SysUtils, Windows, DB, IniFiles, Dialogs, Controls, FileCtrl,
   TypInfo, Menus, Graphics, TB2Item, StdCtrls, DBCtrlsEh, CheckLst, DBLookupEh,
   {$IFDEF VER150} Variants, {$ENDIF}
   ExtCtrls, Messages, dFindImg, ElTree;

type

   // типы справочников подключаемых к полям
   TSprKind=(
      // данные справочника храняться в наборе данных
      skDataSet,
      // данные справочника содержатся в списках строк
      skStringList
   );

   // способы редактирования справочников
   TSprEditKind=(
      // по умолчанию способ редактирования будет определяться по типу
      // подключенного справочника (skDataSet -> sekGrid, skStringList -> sekComboBox)
      sekDefault,
      // для редактирования используется CheckListBox (множественный выбор)
      sekCheckList,
      // для редактирования используется DBGrid в отдельном окне
      sekGrid,
      // для редактирования используется DBGrid в отдельном окне
      sekGrid2,
      // для редактирования используется ComboBox
      sekComboBox,
      // для редактирования используется DBLookupComboBox
      sekLookup
   );

   // типы полей, используемых для поиска
   // (данные типы используются для определения подходящих операций)
   TFindFieldKind=(
      // строка
      ffkString,
      // текст
      ffkText,
      // логическое
      ffkBoolean,
      // число
      ffkNumber,
      // дробное число
      ffkFloat,
      // дата
      ffkDate,
      // список
      ffkList,
      // к полю подключен справочник
      ffkSpr,
      // поле является "свойством"
      ffkProp,
      // поле находится в другой таблице, которая задана отношением
      ffkRel,
      // поле не может принимать значение NULL
      ffkNotNull,
      // поле имеет индекс для полнотекстового поиска
      ffkFTS,
      // флаг, у поля надо убирать пробелы перед поиском
      // действует только для текстовых полей
      ffkDoTrim,
      // не реальное поле, а выражение  (например: GetVozrast(datez,dater) )
      ffkExpression,
      // дата + время
      ffkStamp,
      ffkAge
   );
   TFindFieldKinds=set of TFindFieldKind;

   // способы редактирования значения поля
   TFieldEditKind=(
      fekNone,
      // текст
      fekString,
      // да/нет
      fekBoolean,
      // дата
      fekDate,
      // месяц - внутренний тип, использовать нельзя
      fekMonth,
      // возраст (на дату) - внутренний тип, использовать нельзя
      fekAge,
      // число
      fekNumber,
      // дробное число
      fekFloat,
      // список
      fekList,
      // используется CheckListBox
      fekCheckList,
      // используется кнопка по которой открывается в отдельном окне DBGrid
      // при этом показывается значение поля (код) а рядом наименование из
      // справочника
      fekGridW,
      // используется кнопка по которой открывается в отдельном окне DBGrid
      // при этом показывается только наименование из справочника, которое
      // нельзя редактировать
      fekGridW2,
      // используется ComboBox
      fekComboBox,
      // используется LookupComboBox
      fekLookup
   );
   TFieldEditKinds=set of TFieldEditKind;

   // диапазон для поиска
   TSearchRange=(
      // текущее состояние
      srCurrent,
      // за все года
      srAllYear,
      // за определенный год
      srYear,
      // между двумя годами (включая их)
      srYearBetween
   );

   // свойства условий
   TFindItemKind=(
      // скобки
      fikPar,
      // через ИЛИ
      fikOr,
      // через И
      fikAnd,
      // первое условие
      fikFirst
   );
   TFindItemKinds=set of TFindItemKind;

   // типы значений для поиска (используемых при задании условий)
   TFindValueKind=(
      // тип значения не определен
      valNone,
      // строка
      valString,
      // строки
      valStrings,
      // логическое
      valBoolean,
      // целое число
      valNumber,
      // целые числа
      valNumbers,
      // дробное число
      valFloat,
      // дата
      valDate
   );

   // место добавления нового условия
   TAddPlace=(
      // за текущим
      apAfterCur,
      // перед текущим
      apBeforeCur,
      // в конец списка условий
      apEnd,
      // в начало списка условий
      apBegin
   );

   // права пользователя на выполнение определённых функций
   TUserRight=(
      // работа с дизайнером форм
      urDesigner,
      // тестирование запроса
      urTestSQL,
      // проверка ошибок инициализации интерфейса фильтра
      urTestError,
      // настройка дерева полей
      urFieldTree
   );
   TUserRights=set of TUserRight;

   TDialogMode=(
      dmNew,
      dmEdit,
      dmView
   );

   // признак, какую часть от даты использовать в условии
   TDateKind=(
      // год
      dkYear,
      // месяц
      dkMonth,
      // день месяца
      dkDayOfMonth,
      // полностью
      dkFull,
      // текущий возраст
      dkCurrentAge,
      // возраст (на дату)
      dkAge,
      // текущий возраст месяцев
      dkCurrentAgeMonth,
      // возраст месяцев (на дату)
      dkAgeMonth
   );

   //типы отношений
   TRelKind=(
      //один к одному
      rk11,
      //один ко многим
      rk1M,
      //многие к одному
      rkM1,
      //многие ко многим
      rkMM
   );

const
   CDateKindName: array [TDateKind] of string=(
      '<год>'     {dkYear},
      '<месяц>'   {dkMonth},
      '<день>'    {dkDayOfMonth},
      ''          {dkFull},
      '<текущий возраст>' {dkCurrentAge},
      '<возраст>'         {dkAge},
      '<текущий возраст мес.>' {dkCurrentAgeMonth},
      '<возраст мес.>'         {dkAgeMonth}
   );
   CDateKindName2: array [TDateKind] of string=(
      '<год>'     {dkYear},
      '<месяц>'   {dkMonth},
      '<день>'    {dkDayOfMonth},
      ''          {dkFull},
      '<кол-во лет>'     {dkCurrentAge},
      '<кол-во лет>'     {dkAge},
      '<кол-во мес.>' {dkCurrentAgeMonth},
      '<кол-во мес.>' {dkAgeMonth}
   );

type
   TFindFieldItem=class;
   TFilterInterface=class;

   // справочник
   TSprItem=class(TObject)
   private
      // имя справочника
      FName: string;
      // заголовок справочника
      FCaption: string;
      // тип: набор данных либо список строк
      FKind: TSprKind;
      // набор данных
      FDataSet: TDataSet;
      // список ключевых строк
      FKeyList: TStringList;
      // список строк с наименованиями
      FNameList: TStringList;
      // имя ключевого поля
      FKeyFieldName: string;
      // имя поля с наименованием
      FNameFieldName: string;
      // список всех имен полей через запятую вместе с равно (и если надо, то их названий через равно),
      // которые надо показывать в DBGrid
      FFieldNames: TStringList;
      // способ редактирования справочника
      FEditKind: TSprEditKind;
      // инедкс, устанавливаемый при открытии окна выбора значения из справочника
      // используется, если тип справочника skDataSet
      FIndexName: string;//ind
      FOldIndexName: string;//ind
   public
      // DataSet - передается ссылка
      // KeyList, NameList - информация копируется
      constructor Create(Name, Caption: string; Kind: TSprKind; DataSet: TDataSet; KeyList, NameList: TStringList; KeyFieldName, NameFieldName, AddFields: string; EditKind: TSprEditKind; {//ind}IndexName: string);
      destructor Destroy; override;
      // заполнить списки ключевых строк и строк с наименованиями (если надо) и заполнить
      // наименованиями переданный список
      procedure FillStrings(sl: TStrings);
      // установить/восстановить индекс
      function SetIndexName: Boolean;//ind
      procedure RestoreIndexName;//ind
   public
      property Name: string read FName;
      property Caption: string read FCaption;
      property Kind: TSprKind read FKind;
      property DataSet: TDataSet read FDataSet;
      property KeyList: TStringList read FKeyList;
      property NameList: TStringList read FNameList;
      property KeyFieldName: string read FKeyFieldName;
      property NameFieldName: string read FNameFieldName;
      property FieldNames: TStringList read FFieldNames;
      property EditKind: TSprEditKind read FEditKind;
      property IndexName: string read FIndexName; //ind
   end;

   // список справочников
   TSprList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TSprItem;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TSprItem): Integer;
      function AddNew(Name, Caption: string; Kind: TSprKind; DataSet: TDataSet; KeyList, NameList: TStringList; KeyFieldName, NameFieldName, AddFields: string; EditKind: TSprEditKind; {//ind}IndexName: string): TSprItem;
      function ByName(Name: string): TSprItem;
      // вызвать функцию восставновления индексов для всех справочников
      procedure RestoreIndexName;//ind
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TSprItem read GetItem; default;
   end;

   // операция
   TOperItem=class(TObject)
   private
      // имя операции
      FName: string;
      // название операции
      FCaption: string;
      // шаблон запроса для данной операции
      FSQL: string;
      // множество типов полей для которых можно использовать данную операцию
      FFieldKinds: TFindFieldKinds;
      // флаг, требует значение
      FNeedValue: Boolean;
      // флаг, требует два значения
      FTwoValue: Boolean;
      // флаг, операция чувствительна к регистру букв
      FCaseSensitive: Boolean;
      // флаг, операция допускает множественный выбор
      FMultiSel: Boolean;
      // флаг, при множественном выборе определяет способ связывания по ИЛИ/И
      FMultiOr: Boolean;
      // флаг, у операции есть свое значение
      FOwnValue: Boolean;
      // имя своего значения
      FOwnValName: string;
      // тип своего значения
      FOwnValKind: TFindValueKind;
      // справочник для совего значения
      FOwnSprName: string;
      // задает порядок операций
      FOrder: Integer;
   public
      constructor Create(Name, Caption, SQL: string; FieldKinds: string; NeedValue, TwoValue, CaseSensitive, MultiSel, MultiOr, OwnValue: Boolean; OwnValName, OwnValKind, OwnSprName: string);
      destructor Destroy; override;
      function GetEditKind(SprList: TSprList): TFieldEditKind;
   public
      property Name: string read FName;
      property Caption: string read FCaption;
      property SQL: string read FSQL;
      property FieldKinds: TFindFieldKinds read FFieldKinds;
      property NeedValue: Boolean read FNeedValue;
      property TwoValue: Boolean read FTwoValue;
      property CaseSensitive: Boolean read FCaseSensitive;
      property MultiSel: Boolean read FMultiSel;
      property MultiOr: Boolean read FMultiOr;
      property OwnValue: Boolean read FOwnValue;
      property OwnValName: string read FOwnValName;
      property OwnValKind: TFindValueKind read FOwnValKind;
      property OwnSprName: string read FOwnSprName;
      property Order: Integer read FOrder write FOrder;
   end;

   // список операций
   TOperList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TOperItem;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TOperItem): Integer;
      function AddNew(Name, Caption, SQL: string; FieldKinds: string; NeedValue, TwoValue, CaseSensitive, MultiSel, MultiOr, OwnValue: Boolean; OwnValName, OwnValKind, OwnSprName: string): TOperItem;
      function ByName(Name: string): TOperItem;
      procedure FillStrings(S: TStrings; Kinds: TFindFieldKinds; KeyList, MultiSel: Boolean);
      procedure Reorder;
      procedure FillComboBox(FilterInterface: TFilterInterface; Field: TFindFieldItem; ComboBox: TComboBox; DatePart: TDateKind);
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TOperItem read GetItem; default;
   end;

   // отношение
   TRelItem=class(TObject)
   private
      // уникальное имя отношения
      FName: string;
      // имя подчиненной таблицы
      FTableName: string;
      // алиас подчиненной таблицы
      FTableAlias: string;
      // условие, по которому соединяется главная таблица и подчиненная (с алиасами)
      FWhere: string;
      // список полей для group by (подчиненной таблицы)
      FGroupBy: string;
      // тип отношения
      FKind: TRelKind;
   public
      constructor Create(TableName, TableAlias, Name, Where, GroupBy: string; Kind: TRelKind);
      destructor Destroy; override;
   public
      property Name: string read FName;
      property TableName: string read FTableName;
      property TableAlias: string read FTableAlias;
      property Where: string read FWhere;
      property GroupBy: string read FGroupBy;
      property Kind: TRelKind read FKind;
   end;

   // список отношений
   TRelList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TRelItem;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TRelItem): Integer;
      function AddNew(TableName, TableAlias, Name, Where, GroupBy: string; Kind: TRelKind): TRelItem;
      function ByName(Name: string): TRelItem;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TRelItem read GetItem; default;
   end;

   TFindFieldList=class;

   // поле для поиска
   TFindFieldItem=class(TObject)
   private
      // имя поля (должно быть уникальным в пределах одного главного поля - FOwner)
      //  - для свойств - это код свойства
      FName: string;
      // имя поля в запросе (алиас поля)
      //  - для списков - это имя таблицы
      //  - для свойств - это имя поля со значением свойства
      FRealName: string;
      // основное название поля
      FCaption: string;
      // дополнительное название поля (если указано, то используется для показа
      // названия поля вместе с условием)
      FAddCaption: string;
      // алиас таблицы, к которой принадлежит поле
      FAlias: string;
      // тип: строка, число, дата, список
      // кроме того с помощью этого типа можно задать, что
      //  - к полю подключен справочник (ffkSpr)
      //  - поле не может принимать значение NULL (ffkNotNull)
      //  - поле имеет индекс для полнотекстового поиска (ffkFTS)
      FKinds: TFindFieldKinds;
      // имя подключенного справочника (если есть)
      FSprName: string;
      // способ редактирования справочника
      FSprEditKind: TSprEditKind;
      // флаг, использовать ли поле в диалоге поиска
      FVisible: Boolean;
      // флаг, поле не чуствительно к регистру
      FCaseSensitive: Boolean;
      // флаг, значение поля всегда храниться в верхнем регистре
      FIsUpper: Boolean;
      // главное поле (ссылка на поле у которого тип - список)
      // NB: это главное поле должно обязательно встретиться в списке раньше, чем
      //     подчиненые ему поля
      FOwner: TFindFieldItem;
      // порядок полей
      // важно: если используется возможность сортировки полей по заданному порядку,
      // то значение этого поля должно быть больше нуля и меньше 4096, иначе при
      // сортировки будет использоваться индекс в списке полей FListOrder как значение для FOrder
      FOrder: Integer;
      // значение данного свойства заполняется автоматически при добавлении поля в список
      // и используется программой для сортировки если FOrder=0
      FListOrder: Integer;
      // имя группы, которой принадлежит поле
      FGroup: string;
      // имя операции по умолчанию для данного поля
      //   при добавлени в дерево условий данного поля эта операция выберется по умолчанию
      FDefaultOp: string;
      // имя отношения, через которое связано данное поле и главная таблица
      FRelName: string;
      // иконка используемая при отображении поля в списке полей для поиска
      //   ссылка на список этих иконок должная находится в TFilterInterface
      //   по умолчанию -1, т.е. используется стандартная
      FImageIndex: Integer;
      //
      FExpanded: Boolean;
      //
      FListOwner: TFindFieldList;
      // флаг, поле не может участвовать в группировке
      //   по умолчанию False
      FNotGroupBy: Boolean;
   private
      function GetPath: string;
      function GetIndent: string;
      function GetFullName: string;
      function GetIsSpr: Boolean;
      function GetLevel: Integer;
   protected
      procedure SetList(List: TFindFieldList; Ind: Integer);
   public
      constructor Create(Name, RealName, Caption, AddCaption, Alias: string; Kinds: TFindFieldKinds; Visible, CaseSensitive, IsUpper: Boolean; SprName: string; Owner: TFindFieldItem; Order: Integer; Group, DefaultOp, RelName: string; SprEditKind: TSprEditKind);
      destructor Destroy; override;
      // каким образом надо редактировать поле
      function GetEditKind(SprList: TSprList; DatePart: TDateKind): TFieldEditKind;
      // требует ли поле только операций позволяющих делать множественный выбор
      function GetMultiSel(SprList: TSprList): Boolean;
      //
      procedure Change(Caption, AddCaption, Alias, RealName, Group, DefaultOp, RelName, SprName: string; Kinds: TFindFieldKinds; SprEditKind: TSprEditKind; Visible, CaseSensitive, IsUpper: Boolean; Order: Integer);
      //
      function TestErrors(Err: TStrings): Boolean;
      function GetInternalOrder(MaxLevel: Integer): string;
      procedure SetCaption(sCaption:String; sAddCaption:String='');
   public
      property Name: string read FName;
      property RealName: string read FRealName;
      property FullName: string read GetFullName;
      property Caption: string read FCaption;
      property AddCaption: string read FAddCaption;
      property Alias: string read FAlias;
      property Kinds: TFindFieldKinds read FKinds write FKinds;
      property IsSpr: Boolean read GetIsSpr;
      property SprName: string read FSprName;
      property Visible: Boolean read FVisible write FVisible;
      property CaseSensitive: Boolean read FCaseSensitive;
      property IsUpper: Boolean read FIsUpper;
      property Owner: TFindFieldItem read FOwner;
      property Order: Integer read FOrder write FOrder;
      property ListOrder: Integer read FListOrder write FListOrder;
      property Group: string read FGroup;
      property DefaultOp: string read FDefaultOp;
      property RelName: string read FRelName;
      property Path: string read GetPath;
      property Indent: string read GetIndent;
      property SprEditKind: TSprEditKind read FSprEditKind;
      property ImageIndex: Integer read FImageIndex write FImageIndex;
      property Expanded: Boolean read FExpanded write FExpanded;
      property ListOwner: TFindFieldList read FListOwner;
      property NotGroupBy: Boolean read FNotGroupBy write FNotGroupBy;
   end;

   // список полей для поиска
   TFindFieldList=class(TObject)
   private
      FList: TList;
      FFileName: string;
      FTopIndex: Integer;
      FSelIndex: Integer;
      FLastGroups: TStringList;
      FSorted: Boolean;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TFindFieldItem;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TFindFieldItem): Integer;
      procedure Insert(Ind: Integer; Item: TFindFieldItem);
      function AddNew(Name, RealName, Caption, AddCaption, Alias: string; Kinds: TFindFieldKinds; Visible, CaseSensitive, IsUpper: Boolean; SprName: string; Owner: TFindFieldItem; Order: Integer; Group, DefaultOp, RelName: string; SprEditKind: TSprEditKind): TFindFieldItem;
      function InsertNew(AfterItem: string; Name, RealName, Caption, AddCaption, Alias: string; Kinds: TFindFieldKinds; Visible, CaseSensitive, IsUpper: Boolean; SprName: string; Owner: TFindFieldItem; Order: Integer; Group, DefaultOp, RelName: string; SprEditKind: TSprEditKind): TFindFieldItem;
      function ByName(Owner: TFindFieldItem; Name: string): Integer;
      function ByRealName(Owner: TFindFieldItem; RealName: string): TFindFieldItem; overload;
      function ByRealName(Owner: TFindFieldItem; Alias, RealName: string): TFindFieldItem; overload;
      function ByPath(Path: string): TFindFieldItem;
      function GetIndex(Item: TFindFieldItem): Integer;
      function SaveToFile(FileName: string): Boolean;
      function LoadFromFile(FileName: string): Boolean;
      function SaveToIni(Ini: TCustomIniFile): Boolean;
      function LoadFromIni(Ini: TCustomIniFile): Boolean;
      function GetMaxLevel: Integer;
      function IndexOf(Item: TFindFieldItem): Integer;
      procedure Sort;
      procedure BuildFieldTree(FilterInterface: TFilterInterface; Tree: TElTree; Combo: TComboBox; IsRootNode, IsSimpleField: Boolean);
      //заново присвоить значение FListOrder для всех полей списка
      procedure ResetListOrder;
      //[2010.06.10] переключение видимости полей, принадлежащих группе
      procedure SetVisible(Group: string; Visible: Boolean);
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TFindFieldItem read GetItem; default;
      property FileName: string read FFileName;
      property TopIndex: Integer read FTopIndex write FTopIndex;
      property SelIndex: Integer read FSelIndex write FSelIndex;
      property LastGroups: TStringList read FLastGroups;
      property Sorted: Boolean read FSorted;
   end;

   TFindList=class;

   // значение используемое в условии для поиска
   TFindValue=class(TObject)
   private
      FKind: TFindValueKind;
      FDateVal: TDateTime;
      FStrVal: string;
      FBoolVal: Boolean;
      FNumVal: Integer;
      FExtVal: Extended;
      FIsNull: Boolean;
      FValCaption: string;
      FValues: TStringList;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Assign(Value: TFindValue);
      function GetText(DoUpper: Boolean; DateTimeFormat, TrueS, FalseS: string): string;
      function GetCaption(DoUpper: Boolean): string;
      procedure SaveToStrings(sl: TStringList);
      function LoadFromStrings(sl: TStringList; var Ind: Integer): Boolean;
      procedure Clear;
   public
      property Kind: TFindValueKind read FKind write FKind;
      property IsNull: Boolean read FIsNull write FIsNull;
      property DateVal: TDateTime read FDateVal write FDateVal;
      property StrVal: string read FStrVal write FStrVal;
      property BoolVal: Boolean read FBoolVal write FBoolVal;
      property NumVal: Integer read FNumVal write FNumVal;
      property ExtVal: Extended read FExtVal write FExtVal;
      property ValCaption: string read FValCaption write FValCaption;
      property Values: TStringList read FValues;
   end;

   //[2010.01.26]
   //--TOnUserOperEvent=function (Oper: TOperItem; FindField: TFindFieldItem; RelItem: TRelItem; FullFieldName, Value1, Value2, OperVal: string): string of object;
   TOnUserOperEvent=function (Oper: TOperItem; FindField: TFindFieldItem; RelItem: TRelItem; FullFieldName, Value1, Value2, OperVal: string; var Expr: string): Boolean of object;

   // условие для поиска
   TFindItem=class(TObject)
   private
      FId: Integer;
      FField: TFindFieldItem;
      FOper: TOperItem;
      FValue1: TFindValue;
      FValue2: TFindValue;
      FOperVal: TFindValue;
      FPar: TFindList;
      FKinds: TFindItemKinds;
      FOwner: TFindList;
      // значение надо вводить при выборе условия для поиска
      FIsParam: Boolean;
      // значение обязательно должно быть заполнено при вводе параметров
      FNeedValue: Boolean;
      // флаг, игнорировать регистр букв
      FIgnoreCase: Boolean;
      // какую часть даты использовать при поиске (имеет смысл только для полей типа ffkDate)
      FDatePart: TDateKind;
   private
      procedure SetOwner(Value: TFindList);
   public
      constructor Create(Field: TFindFieldItem; Oper: TOperItem; Value1, Value2, OperVal: TFindValue; Kinds: TFindItemKinds; IgnoreCase, IsParam, NeedValue: Boolean; DatePart: TDateKind);
      destructor Destroy; override;
      class function BuildCaption(Field: TFindFieldItem; OperItem: TOperItem; RelItem: TRelItem; Value1, Value2, OperVal: TFindValue; DoUpper, IsParam, NeedValue: Boolean; DatePart: TDateKind): string;
      procedure Change(Field: TFindFieldItem; Oper: TOperItem; Value1, Value2, OperVal: TFindValue; Kind: TFindItemKind; IgnoreCase, IsParam, NeedValue: Boolean; DatePart: TDateKind);
      procedure Delete;
      procedure DeletePar;
      procedure Remove;
      function GetSQL(SQL: TStrings; Blank: Boolean; FilterInterface: TFilterInterface): Boolean;
      procedure GetText(Text: TStringList);
      procedure Assign(Find: TFindItem);
      function Clone: TFindItem;
      function GetCaption(FilterInterface: TFilterInterface): string;
   public
      property Field: TFindFieldItem read FField;
      property Oper: TOperItem read FOper write FOper;
      property Value1: TFindValue read FValue1;
      property Value2: TFindValue read FValue2;
      property OperVal: TFindValue read FOperVal;
      property Par: TFindList read FPar;
      property Kinds: TFindItemKinds read FKinds write FKinds;
      property Owner: TFindList read FOwner write SetOwner;
      property IgnoreCase: Boolean read FIgnoreCase write FIgnoreCase;
      //--property Caption: string read GetCaption;
      property IsParam: Boolean read FIsParam write FIsParam;
      property NeedValue: Boolean read FNeedValue write FNeedValue;
      property Id: Integer read FId write FId;
      property DatePart: TDateKind read FDatePart write FDatePart;
   end;

   // NB: новые настройки добавлять только в конец списка
   //     это особенность способа записи/чтения
   TParamOption=(
      // запоминать сохранённые пользователем параметры
      poSaveValue,
      // показывать кнопку "Очистить"
      poShowClearButton,
      // показывать заголовок
      poShowCaption
   );
   TParamOptions=set of TParamOption;

   // список условий требующих параметры
   TParamList=class(TObject)
   private
      FList: TList;
      FFormWidth: Integer;
      FFormHeight: Integer;
      FPixelsPerInch: Integer;
      FCaption: string;
      FOption: TParamOptions;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TFindItem;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TFindItem): Integer;
      function GetMaxOpWidth(Canvas: TCanvas): Integer;
      function GetRealWidth: Integer;
      function GetRealHeight: Integer;
      procedure Assign(Params: TParamList);
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TFindItem read GetItem; default;
      property FormWidth: Integer read FFormWidth write FFormWidth;
      property FormHeight: Integer read FFormHeight write FFormHeight;
      property PixelsPerInch: Integer read FPixelsPerInch write FPixelsPerInch;
      property Caption: string read FCaption write FCaption;
      property Option: TParamOptions read FOption write FOption;
   end;

   // элемент для задания порядка сортировки
   TOrderItem=class(TObject)
   private
      // путь к полю
      FFieldPath: string;
      // флаг, сортировать по убыванию/возрастанию (по умолчанию True - Asc)
      FDirection: Boolean;
      // флаг, переводить в верхний регистр (для строкового поля)
      FUpperCase: Boolean;
   public
      constructor Create(FieldPath: string; Direction, UpperCase: Boolean);
      destructor Destroy; override;
      procedure Assign(OrderItem: TOrderItem);
      function Clone: TOrderItem;
   public
      property FieldPath: string read FFieldPath;
      property Direction: Boolean read FDirection write FDirection;
      property UpperCase: Boolean read FUpperCase write FUpperCase;
   end;

   // список элементов сортировки
   TOrderList=class(TObject)
   private
      FList: TList;
   private
      function GetItem(Ind: Integer): TOrderItem;
      function GetCount: Integer;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      procedure Assign(List: TOrderList);
      function Clone: TOrderList;
      function IndexOfPath(Path: string): Integer;
      procedure Delete(Ind: Integer);
      function InsertNew(Ind: Integer; FieldPath: string; Direction, UpperCase: Boolean): TOrderItem;
      function Add(Item: TOrderItem): Integer;
      function Insert(Ind: Integer; Item: TOrderItem): Integer;
      function AddNew(FieldPath: string; Direction, UpperCase: Boolean): TOrderItem;
      procedure Exchange(Ind1, Ind2: Integer);
      function SaveToString: string;
      function LoadFromString(S: string): Boolean;
   public
      property Count: Integer read GetCount;
      property Item[Ind: Integer]: TOrderItem read GetItem; default;
   end;

   // поле входящее в группировку
   TGroupItem=class(TObject)
   private
      // заголовок
      FTitle: string;
      // путь к полю
      FFieldPath: string;
      // флаг, видимость - для временного отключения
      FIsVisible: Boolean;
      // имя поля в полученном запросе
      FFieldName: string;
      // признак, для полей типа - дата (год/месяц/день/полностью)
      FDateKind: TDateKind;
      // ширина колонки в пикселах
      FWidth: Integer;
   public
      constructor Create(FieldName, Title: string; FieldPath: string; IsVisible: Boolean; Width: Integer);
      destructor Destroy; override;
      procedure Assign(GroupItem: TGroupItem);
      function Clone: TGroupItem;
      function SaveToString: string;
      function LoadFromString(S: string): Boolean;
   public
      property Title: string read FTitle write FTitle;
      property FieldPath: string read FFieldPath write FFieldPath;
      property IsVisible: Boolean read FIsVisible write FIsVisible;
      property FieldName: string read FFieldName;
      property DateKind: TDateKind read FDateKind write FDateKind;
      property Width: Integer read FWidth write FWidth;
   end;

   // список полей входящих в группировку
   TGroupList=class(TObject)
   private
      FId: Integer;
      FList: TList;
   private
      function GetItem(Ind: Integer): TGroupItem;
      function GetCount: Integer;
      function GetNextFieldName: string;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      procedure Assign(List: TGroupList);
      function Clone: TGroupList;
      procedure Delete(Ind: Integer);
      function Add(Item: TGroupItem): Integer;
      function AddNew(Title: string; FieldPath: string; IsVisible: Boolean; Width: Integer): TGroupItem;
      function IndexOfPath(Path: string): Integer;
      procedure SaveToStrings(sl: TStringList);
      function LoadFromStrings(sl: TStringList; var Ind: Integer): Boolean;
   public
      property Count: Integer read GetCount;
      property Item[Ind: Integer]: TGroupItem read GetItem; default;
      property Id: Integer read FId;
   end;

   // колонка для группировки
   TGroupColumnItem=class(TObject)
   private
      // заголовок колонки
      FTitle: string;
      // признак колонки "Всего"
      FIsTotal: Boolean;
      // путь к полю связанному с колонкой
      FFieldPath: string;
      // флаг, видимость - для временного отключения
      FIsVisible: Boolean;
      // имя поля в полученном запросе
      FFieldName: string;
      // условие попадания значения в колонку
      FCondition: TFindList;
      // ширина колонки в пикселах
      FWidth: Integer;
   public
      constructor Create(FieldName, Title: string; IsTotal, IsVisible: Boolean; FieldPath: string; Width: Integer);
      destructor Destroy; override;
      procedure Assign(ColumnItem: TGroupColumnItem);
      function Clone: TGroupColumnItem;
      procedure SaveToStrings(sl: TStringList);
      function LoadFromStrings(FilterInterface: TFilterInterface; sl: TStringList; var Ind: Integer): Boolean;
   public
      property Title: string read FTitle write FTitle;
      property IsTotal: Boolean read FIsTotal write FIsTotal;
      property FieldPath: string read FFieldPath write FFieldPath;
      property IsVisible: Boolean read FIsVisible write FIsVisible;
      property FieldName: string read FFieldName;
      property Condition: TFindList read FCondition;
      property Width: Integer read FWidth write FWidth;
   end;

   // список колонок для группировки
   TGroupColumnList=class(TObject)
   private
      FId: Integer;
      FList: TList;
   private
      function GetItem(Ind: Integer): TGroupColumnItem;
      function GetCount: Integer;
      function GetNextFieldName: string;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      procedure Assign(List: TGroupColumnList);
      function Clone: TGroupColumnList;
      procedure Delete(Ind: Integer);
      function Add(Item: TGroupColumnItem): Integer;
      function AddNew(Title: string; IsTotal, IsVisible: Boolean; FieldPath: string; Width: Integer): TGroupColumnItem;
      procedure SaveToStrings(sl: TStringList);
      function LoadFromStrings(FilterInterface: TFilterInterface; sl: TStringList; var Ind: Integer): Boolean;
   public
      property Count: Integer read GetCount;
      property Item[Ind: Integer]: TGroupColumnItem read GetItem; default;
      property Id: Integer read FId;
   end;

   // данные для формирования группировки
   TGroupBy=class(TObject)
   private
      // заголовок
      FCaption: string;
      // список путей к полям, по которым строится группировка
      FGroupList: TGroupList;
      // список колонок
      FColumnList: TGroupColumnList;
      // список полей по которым надо сортировать
      FOrderList: TOrderList;
   public
      constructor Create(Caption: string);
      destructor Destroy; override;
      procedure Assign(GroupBy: TGroupBy);
      function Clone: TGroupBy;
      function GetSQL(SQL: TStrings; FilterInterface: TFilterInterface; Where: string): Boolean;
      function SaveToFile(FileName: string; var Err: string): Boolean;
      procedure SaveToStrings(sl: TStringList);
      function LoadFromFile(FilterInterface: TFilterInterface; FileName: string; var Err: string): Boolean;
      function LoadFromStrings(FilterInterface: TFilterInterface; sl: TStringList): Boolean;
      procedure Clear;
   public
      property Caption: string read FCaption write FCaption;
      property GroupList: TGroupList read FGroupList;
      property ColumnList: TGroupColumnList read FColumnList;
      property OrderList: TOrderList read FOrderList;
   end;

   // список условий для поиска (фильтр)
   TFindList=class(TObject)
   private
      FName: string;
      FCaption: string;
      FFolder: string;
      FList: TList;
      // флаг, означает что это папка, а не фильтр
      FIsFolder: Boolean;
      // ссылка на фильтр-папку, в которой находится данный фильтр
      FOwnerFolder: TFindList;
      // список условий с параметрами (перед его использованием надо каждый раз заполнять заново)
      FParams: TParamList;
      // список путей к полям, по которым строится order by для этого фильтра
      FOrderList: TOrderList;
      // список сохраненных свойств элементов управления для параметров
      FParamCtrl: TStringList;
      //
      FLastId: Integer;
      //
      FOwner: TFindList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TFindItem;
      procedure FillParamList2(ParamList: TParamList);
      function GetNextId: Integer;
      function GetRoot: TFindList;
   public
      constructor Create(Name, Caption, Folder: string; IsFolder: Boolean);
      destructor Destroy; override;
      procedure Clear;
      procedure ClearFilter;
      function IndexOf(Item: TFindItem): Integer;
      procedure Add(Item: TFindItem);
      procedure Insert(Ind: Integer; Item: TFindItem);
      procedure AddList(List: TFindList);
      procedure InsertList(Ind: Integer; List: TFindList);
      function AddNew(Field: TFindFieldItem; Oper: TOperItem; Value1, Value2, OperVal: TFindValue; Kinds: TFindItemKinds; IsUpper, IsParam, NeedValue: Boolean; DatePart: TDateKind): TFindItem;
      function InsertNew(Item: TFindItem; Field: TFindFieldItem; Oper: TOperItem; Value1, Value2, OperVal: TFindValue; Kinds: TFindItemKinds; IsUpper, IsParam, NeedValue: Boolean; DatePart: TDateKind): TFindItem;
      function InsertFirst(Field: TFindFieldItem; Oper: TOperItem; Value1, Value2, OperVal: TFindValue; Kinds: TFindItemKinds; IsUpper, IsParam, NeedValue: Boolean; DatePart: TDateKind): TFindItem;
      procedure Remove(Item: TFindItem);
      procedure Delete(Item: TFindItem);
      procedure DeletePar(Item: TFindItem);
      function GetSQL(SQL: TStrings; FilterInterface: TFilterInterface): Boolean;
      function GetText(Text: TStringList): Boolean;
      procedure Assign(List: TFindList);
      function Clone: TFindList;
      // имеет ли фильти условия с параметрами
      function HaveParams: Boolean;
      // заполнить список условий требующих параметры
      procedure FillParamList;
      // функции для записи фильтра в файл
      function SaveToFile(FileName: string; var Err: string): Boolean;
      procedure SaveToStrings(sl: TStringList);
      procedure SaveToStrings_(sl: TStringList);
      procedure SaveToStrings1(sl: TStringList);
      procedure ItemToStrings1(Item: TFindItem; sl: TStringList);
      function ParamsToString: string;
      // функции для чтения фильтра из файла
      function LoadFromFile(FileName: string; var Err: string; FindField: TFindFieldList; FindOper: TOperList): Boolean;
      function LoadFromStrings(sl: TStringList; FindField: TFindFieldList; FindOper: TOperList): Boolean;
      function LoadFromStrings_(sl: TStringList; var Ind: Integer; FindField: TFindFieldList; FindOper: TOperList): Boolean;
      function LoadFromStrings1(sl: TStringList; var Ind: Integer; Owner: TFindList; FindField: TFindFieldList; FindOper: TOperList): Boolean;
      function ItemFromStrings1(sl: TStringList; var Ind: Integer; Owner: TFindList; FindField: TFindFieldList; FindOper: TOperList): TFindItem;
      function ParamsFromString(S: string): Boolean;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TFindItem read GetItem; default;
      property Name: string read FName;
      property Caption: string read FCaption write FCaption;
      property Folder: string read FFolder write FFolder;
      property IsFolder: Boolean read FIsFolder write FIsFolder;
      property OwnerFolder: TFindList read FOwnerFolder write FOwnerFolder;
      property Owner: TFindList read FOwner write FOwner;
      property LastId: Integer read FLastId;
      property Params: TParamList read FParams;
      property OrderList: TOrderList read FOrderList;
      property ParamCtrl: TStringList read FParamCtrl;
   end;

   // список фильтров
   TFilterList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TFindList;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function AddNew: TFindList;
      function AddFolder(Name: string): TFindList;
      function AddCopy(Filter: TFindList): TFindList;
      procedure Delete(I: Integer);
      function Last: TFindList;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TFindList read GetItem; default;
   end;

   TFilterName=class(TObject)
   private
      FFullFileName: string;
      FIsFolder: Boolean;
      FOwner: TFilterName;
   private
      function GetName: string;
   public
      constructor Create(FullFileName: string; IsFolder: Boolean; Owner: TFilterName);
      destructor Destroy; override;
      function EqualFileName(Filter: TFindList): Boolean;
   public
      property Name: string read GetName;
      property IsFolder: Boolean read FIsFolder;
      property Owner: TFilterName read FOwner;
      property FullFileName: string read FFullFileName;
   end;

   // список имен фильтров
   TFilterNameList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TFilterName;
      function BuildDirNameList(Dir: string; Owner: TFilterName): Boolean;
      function Add(Item: TFilterName): Integer;
      function AddFolder(FullFileName: string; Owner: TFilterName): TFilterName;
      function AddName(FullFileName: string; Owner: TFilterName): TFilterName;
      procedure Delete(Item: TFilterName);
      procedure Sort;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Build(BaseDir: string): Boolean;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TFilterName read GetItem; default;
   end;

   TOnFilterEvent=procedure(Sender: TObject; Filter: TFindList) of object;
   TOnAddFilterMenu=procedure(Menu: TObject; IsFolder: Boolean; Filter: TFindList) of object;
   TOnSelectFindValue=function (Spr: TSprItem; Ini: TCustomIniFile; Section: string; AutoSave: Boolean; var Value, ValCaption: string): Boolean of object;
   TOnAddWhereEvent=procedure(Sender: TFilterInterface; SQL: TStringList) of object;

   // интерфейс фильтра
   TFilterInterface=class(TObject)
   private
      // список используемых операций
      FOperList: TOperList;
      // список используемых справочников
      FSprList: TSprList;
      // список используемых отношений
      FRelList: TRelList;
      // список используемых при поиске полей
      FFindFieldList: TFindFieldList;
      // файл для хранения визуальных настроек
      FIni: TCustomIniFile;
      // имя секции для сохранения визуальных настроек (по умолчанию "fFind")
      FSection: string;
      // сохранять ли автоматически визуальные настройки (по умолчанию True)
      FAutoSave: Boolean;
      // дополнительное условие для всех фильтров, которое будет добавляеться
      // к условию заданному пользователем чере AND
      FAddWhere: string;
      // заголовок корневого узла дерева полей для поиска (по умолчанию "Лицевые счета")
      FRootCaption: string;
      // диапазон для поиска: текущее состояние, за все года, за определенный год
      // (по умолчанию "текущее состояние")
      FSearchRange: TSearchRange;
      FCurrentSearchRange: TSearchRange;
      // в зависимости от диапазона поиска - дата за которую искать (по умолчанию - 1899-12-30)
      FSearchDate: TDateTime;
      FCurrentSearchDate: TDateTime;
      // в зависимости от диапазона поиска - первая дата из диапазона (по умолчанию - 1899-12-30)
      FFirstDate: TDateTime;
      // в зависимости от диапазона поиска - последняя дата из диапазона (по умолчанию - 1899-12-30)
      FLastDate: TDateTime;
      // формат даты/времени (по умолчанию YYYY-MM-DD)
      FDateTimeFormat: string;
      // текущий фильтр
      FFilter: TFindList;
      // текущее состояние фильтра (сохранен или нет)
      FFilterIsSaved: Boolean;
      // базовый каталог для сохранения фильтров (по умолчанию - каталог программы + 'Filters')
      // если такого каталога не будет, то он создаться при необходимости
      FBaseDir: string;
      // текущий список всех фильтров
      FFilterList: TFilterList;
      // событие вызываемое при нажатии в меню на фильтр
      FOnFilterEvent: TOnFilterEvent;
      // событие вызываемое при добавлении пункта меню в меню фильтров
      FOnAddFilterMenu: TOnAddFilterMenu;
      // имя поля даты в главной таблице (вместе с алиасом таблицы)
      FDateFieldName: string;
      // это список картинок 16x16, который используется для показа списка полей
      //   по умолчанию nil, т.е. используется стандартные иконки
      FFieldImages: TImageList;
      // индекс картинки для групп полей (в списке полей для поиска)
      //   по умолчанию -1, т.е. используется стандартная
      FGroupImageIndex: Integer;
      // индекс картинки для корневого узла (в списке полей для поиска)
      //   по умолчанию -1, т.е. используется стандартная
      FRootImageIndex: Integer;
      // индекс картинки для полей с подключенными справочниками
      //   по умолчанию -1, т.е. используется стандартная
      FSprImageIndex: Integer;
      // флаг, показывать или нет "плюс"/"минус" в списки полей (дерево)
      //   по умолчанию (True)
      FShowButtons: Boolean;
      // флаг, покащывать или нет выпадающий список с группами полей
      //   по умолчанию (True)
      FShowGroups: Boolean;
      // флаг, показывать между деревом полей и деревом условий пространство с кнопками
      //   по умолчанию (True)
      FShowMiddleSpace: Boolean;
      // флаг, показывать дерево полей слохпнутым при открытии фильтра
      //   по умолчанию (True) и при первом запуске этот флаг сбрасывается
      FCollapseAll: Boolean;
      // флаг, пользователю доступны функции администратора
      //   по умолчанию - False
      FAdminUser: Boolean;
      // месяц по умолчанию для формирования произвольной даты (01)
      FDefMonth: Integer;
      // день по умолчанию для формирования произвольной даты (01)
      FDefDay: Integer;
      // упрощенный режим добавления в дерево условий (по умолчанию - True)
      FSimpleAddMode: Boolean;
      // событие будет вызываться в редактировании фильтра в режиме администратора
      // если нажать "Запрос"
      FOnTestSQL: TNotifyEvent;
      // списко имен фильтров
      FFilterNameList: TFilterNameList;
      // списко имен группировок
      FGroupNameList: TFilterNameList;
      // до первого открытия фильтра стоит True
      FFirstRun: Boolean;
      // данные пользователя
      FData: TObject;
      // событие для заполнения переменной FAddWhere для дополнительного условия к фильтру
      FOnAddWhereEvent: TOnAddWhereEvent; //TNotifyEvent;
      // событие, вызываемое для операций пользователя
      FOnUserOperEvent: TOnUserOperEvent;
      // флаг, всегда фоткрывать фильтр заново (этот флаг не касается редактирования)
      //  по умолчанию - False, т.е. при выборе в меню имени фильтра он
      //  не будет читаться из файла, если с таким именем фильтр уже открыт
      FAlwaysOpen: Boolean;
      // список путей к полям из списка полей для поиска, которые могут участвовать
      // в order by
      FOrderFields: TStringList;
      // флаг, делать сортировку списка полей для поиска перед его показом
      // по умолчанию - False
      FDoFieldSort: Boolean;
      // флаг, исполльзовать панель для установки года
      // по умолчанию - False
      FUseYear: Boolean;
      // модуль с иконками (imFields)
      FImages: TdmFindImg;
      // если используется список иконок пользователя (FieldImages), то они
      // добавляются в список иконок по умолчанию (FImages.imFields) и эта
      // переменная означает индекс, с которого в общем списке иконок
      // начинаются иконки пользователя
      FAddImageIndex: Integer;
      // событие, вызывается при выборе значения из справочника вместо стандартного
      // диалога (окна) выбора
      FOnSelectFindValue: TOnSelectFindValue;
      // набор прав пользователя на выполнение определённых функций
      //  по умолчанию - []
      FUserRights: TUserRights;
      // текущая (последняя) группировка
      FGroupBy: TGroupBy;
      // имя главной таблицы для группировки
      FMainTableName: string;
      // алиас главной таблицы для группировки
      FMainTableAlias: string;
      // строка соединения с главной таблицей
      FMainConnect: string;
      //[2009.01.12]
      // используется для группировки
      FMainTableJoin: string;  // JOIN для группировки
      FAliasJoin: string;      // ALIAS для JOIN
   private
      function BuildDirFilterList(Dir: string; OwnerFolder: TFindList): Boolean;
      procedure OnMenuClick(Sender: TObject);
      procedure OnMenu2Click(Sender: TObject);
      procedure OnMenu2Click_Group(Sender: TObject);
      function GetGroupImageIndex: Integer;
      function GetRootImageIndex: Integer;
      function GetSprImageIndex: Integer;
      function GetAddImageIndex: Integer;
      procedure DoAddFilterMenu(Menu: TObject; IsFolder: Boolean; Filter: TFindList);
      procedure SetAdminUser(Value: Boolean);
      function GetYearWhere(rSearchRange: TSearchRange; dSearchDate: TDateTime): string;
      procedure SetSearchDate(const Value: TDateTime);
      procedure SetSearchRange(const Value: TSearchRange);
   public
      constructor Create(OperList: TOperList; SprList: TSprList);
      destructor Destroy; override;
      function LoadAndRunFilter(sName:String):Boolean;  // vadim 24.02.2016

      // вызов формы редактирования текущего фильтра
      function Edit: Boolean;
      // вызов формы редактирования параметров фильтра
      function EditParams(Filter: TFindList; IsTest: Boolean): Boolean;
      // вызов диалога установки параметров группировки
      function EditGroupBy(Filter: TFindList; GroupBy: TGroupBy; IsFiltered: Boolean; sName:String): Boolean;
      function EditCurrentGroupBy(IsFiltered: Boolean): Boolean;
      function RunGroupBy(sName:String; IsFiltered: Boolean): Boolean;

      function ShowFieldGroupBy(FieldName: string; IsFiltered: Boolean; Width: Integer): Boolean;
      // вызов формы редактирования сортировки фильтра
      function EditOrderBy(Filter: TFindList): Boolean;
      function EditCurrentOrderBy: Boolean;
      function IsAddDateFiks(sSQL:String): boolean;

      // получить полное условие для поиска заданного фильтра
      function GetSQL(Filter: TFindList; lPlusAddWhere:Boolean=true): string;
      function GetSQL2(Filter: TFindList; IsFiltered: Boolean; lPlusAddWhere:Boolean=true): string;
      // получить order by для заданного фильтра
      function GetOrderBy(Filter: TFindList): string;
      function GetOrderByName(Filter: TFindList): string;
      // получить полное условие для поиска текущего фильтра (без order by)
      function GetCurrentSQL: string;
      // получить order by для текущего фильтра
      function GetCurrentOrderBy: string;
      function GetCurrentOrderByName: string;
      // построить текущий список всех фильтров
      function BuildFilterList: Boolean;
      // построить меню по списку всех фильтров
      function BuildFilterMenu(Menu: TMenu; OnClick: TNotifyEvent): Boolean;
      function BuildFilterMenu_old(Menu: TMenu; OnClick: TNotifyEvent): Boolean;

      function BuildGroupMenu2(Menu: TTBSubMenuItem; OnClick: TNotifyEvent): Boolean;
      // построить меню по списку всех фильтров
      function BuildFilterMenu2(Menu: TTBSubMenuItem; OnClick: TNotifyEvent): Boolean;
      function BuildFilterMenu2_old(Menu: TTBSubMenuItem; OnClick: TNotifyEvent): Boolean;
      // функция проверяет все связи между массивами интерфейса и возвращает ошибки
      function TestErrors(Errors: TStrings): Boolean;
      //
      function LoadFieldList(FileName: string): Boolean;
      function SaveFieldList(FileName: string): Boolean;
      //
      function CheckAlias(Field: TFindFieldItem):Boolean;
      //
      function GetValueKind(Oper: TOperItem; Field: TFindFieldItem): TFindValueKind;
      function GetValueSpr(Oper: TOperItem; Field: TFindFieldItem): TSprItem;
      function GetEditKind(Oper: TOperItem; Field: TFindFieldItem; DatePart: TDateKind): TFieldEditKind;
      //
      function GetImageIndex(Field: TFindFieldItem): Integer;
      // вызов окна выбора значения из справочника
      function SelectFindValue(Spr: TSprItem; var Value, ValCaption: string): Boolean;
      function GroupDir:String;
   public
      property OperList: TOperList read FOperList;
      property SprList: TSprList read FSprList;
      property RelList: TRelList read FRelList;
      property FindFieldList: TFindFieldList read FFindFieldList;
      property AddWhere: string read FAddWhere write FAddWhere;
      property Ini: TCustomIniFile read FIni write FIni;
      property Section: string read FSection write FSection;
      property AutoSave: Boolean read FAutoSave write FAutoSave;
      property RootCaption: string read FRootCaption write FRootCaption;
      property SearchRange: TSearchRange read FSearchRange write SetSearchRange;
      property CurrentSearchRange: TSearchRange read FCurrentSearchRange write FCurrentSearchRange;
      property SearchDate: TDateTime read FSearchDate write SetSearchDate;
      property CurrentSearchDate: TDateTime read FCurrentSearchDate write FCurrentSearchDate;
      property FirstDate: TDateTime read FFirstDate write FFirstDate;
      property LastDate: TDateTime read FLastDate write FLastDate;
      property DateTimeFormat: string read FDateTimeFormat write FDateTimeFormat;
      property Filter: TFindList read FFilter;
      property BaseDir: string read FBaseDir write FBaseDir;
      property OnAddWhereEvent: TOnAddWhereEvent read FOnAddWhereEvent write FOnAddWhereEvent;
      property OnFilterEvent: TOnFilterEvent read FOnFilterEvent write FOnFilterEvent;
      property OnAddFilterMenu: TOnAddFilterMenu read FOnAddFilterMenu write FOnAddFilterMenu;
      property FilterIsSaved: Boolean read FFilterIsSaved write FFilterIsSaved;
      property DateFieldName: string read FDateFieldName write FDateFieldName;
      property FieldImages: TImageList read FFieldImages write FFieldImages;
      property GroupImageIndex: Integer read GetGroupImageIndex write FGroupImageIndex;
      property RootImageIndex: Integer read GetRootImageIndex write FRootImageIndex;
      property SprImageIndex: Integer read GetSprImageIndex write FSprImageIndex;
      property FilterList: TFilterList read FFilterList;
      property ShowButtons: Boolean read FShowButtons write FShowButtons;
      property ShowGroups: Boolean read FShowGroups write FShowGroups;
      property ShowMiddleSpace: Boolean read FShowMiddleSpace write FShowMiddleSpace; 
      property AdminUser: Boolean read FAdminUser write SetAdminUser;
      property DefMonth: Integer read FDefMonth write FDefMonth;
      property DefDay: Integer read FDefDay write FDefDay;
      property SimpleAddMode: Boolean read FSimpleAddMode write FSimpleAddMode;
      property OnTestSQL: TNotifyEvent read FOnTestSQL write FOnTestSQL;
      property FilterNameList: TFilterNameList read FFilterNameList;
      property GroupNameList: TFilterNameList read FGroupNameList;
      property CollapseAll: Boolean read FCollapseAll write FCollapseAll;
      property FirstRun: Boolean read FFirstRun;
      property Data: TObject read FData write FData;
      property OnUserOperEvent: TOnUserOperEvent read FOnUserOperEvent write FOnUserOperEvent;
      property AlwaysOpen: Boolean read FAlwaysOpen write FAlwaysOpen;
      property OrderFields: TStringList read FOrderFields;
      property DoFieldSort: Boolean read FDoFieldSort write FDoFieldSort;
      property UseYear: Boolean read FUseYear write FUseYear;
      property AddImageIndex: Integer read GetAddImageIndex;
      property Images: TdmFindImg read FImages;
      property OnSelectFindValue: TOnSelectFindValue read FOnSelectFindValue write FOnSelectFindValue;
      property UserRights: TUserRights read FUserRights write FUserRights;
      property GroupBy: TGroupBy read FGroupBy;
      property MainTableName: string read FMainTableName write FMainTableName;
      property MainTableAlias: string read FMainTableAlias write FMainTableAlias;
      property MainConnect: string read FMainConnect write FMainConnect;
      property MainTableJoin: string read FMainTableJoin write FMainTableJoin;
      property AliasJoin: string read FAliasJoin write FAliasJoin;
   end;

   TValueControl=class(TObject)
   private
      FControl: TControl;
      FKinds: TFieldEditKinds;
      FTwo: Boolean;
      FIsValue: Boolean;
      FField: TFindFieldItem;
      FFind: TFindItem;
   private
      function TEdit_IsValue: Boolean;
      procedure TEdit_GetValue(Value: TFindValue; Kind: TFieldEditKind);
      procedure TEdit_SetValue(Value: TFindValue; Kind: TFieldEditKind);
      procedure TEdit_ClearValue;
      function TComboBox_IsValue: Boolean;
      procedure TComboBox_GetValue(Value: TFindValue; Kind: TFieldEditKind; ValueKind: TFindValueKind; Spr: TSprItem);
      procedure TComboBox_SetValue(Value: TFindValue; Kind: TFieldEditKind; Spr: TSprItem);
      procedure TComboBox_ClearValue;
      function TDBNumberEditEh_IsValue: Boolean;
      procedure TDBNumberEditEh_GetValue(Value: TFindValue; Kind: TFieldEditKind);
      procedure TDBNumberEditEh_SetValue(Value: TFindValue; Kind: TFieldEditKind);
      procedure TDBNumberEditEh_ClearValue;
      function TDBDateTimeEditEh_IsValue: Boolean;
      procedure TDBDateTimeEditEh_GetValue(Value: TFindValue; Kind: TFieldEditKind);
      procedure TDBDateTimeEditEh_SetValue(Value: TFindValue; Kind: TFieldEditKind);
      procedure TDBDateTimeEditEh_ClearValue;
      function TCheckListBox_IsValue: Boolean;
      procedure TCheckListBox_GetValue(Value: TFindValue; Kind: TFieldEditKind; ValueKind: TFindValueKind; Spr: TSprItem);
      procedure TCheckListBox_SetValue(Value: TFindValue; Kind: TFieldEditKind; Spr: TSprItem);
      procedure TCheckListBox_ClearValue;
      function TDBLookupComboboxEh_IsValue: Boolean;
      procedure TDBLookupComboboxEh_GetValue(Value: TFindValue; Kind: TFieldEditKind; ValueKind: TFindValueKind);
      procedure TDBLookupComboboxEh_SetValue(Value: TFindValue; Kind: TFieldEditKind; Spr: TSprItem);
      procedure TDBLookupComboboxEh_ClearValue;
      function TDBEditEh_IsValue(ValueKind: TFindValueKind): Boolean;
      procedure TDBEditEh_GetValue(Value: TFindValue; Kind: TFieldEditKind; ValueKind: TFindValueKind; LastValue, LastCaption: string);
      procedure TDBEditEh_SetValue(Value: TFindValue; Kind: TFieldEditKind; var LastValue, LastCaption: string);
      procedure TDBEditEh_ClearValue;
   public
      constructor Create(Control: TControl; Kinds: TFieldEditKinds; Two, IsValue: Boolean; Field: TFindFieldItem; Find: TFindItem);
      destructor Destroy; override;
      function NullValue(ValueKind: TFindValueKind): Boolean;
      procedure GetValue(Value: TFindValue; Kind: TFieldEditKind; ValueKind: TFindValueKind; LastValue, LastCaption: string; Spr: TSprItem);
      procedure SetValue(Value: TFindValue; Kind: TFieldEditKind; var LastValue, LastCaption: string; Spr: TSprItem);
      procedure ClearValue;
      procedure InitControl(EditKind: TFieldEditKind; SprItem: TSprItem);
   public
      property Control: TControl read FControl;
      property Kinds: TFieldEditKinds read FKinds;
      property Two: Boolean read FTwo;
      property IsValue: Boolean read FIsValue;
      property Field: TFindFieldItem read FField;
      property Find: TFindItem read FFind;
   end;

   TValueControlList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TValueControl;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TValueControl): Integer;
      function AddNew(Control: TControl; Kinds: TFieldEditKinds; Two, IsValue: Boolean; Field: TFindFieldItem; Find: TFindItem): TValueControl;
      procedure SetEnable(Kind: TFieldEditKind; Two: Boolean);
      procedure SetVisible(Kind: TFieldEditKind; Two: Boolean);
      function LastControl(Kind: TFieldEditKind; Two: Boolean): TControl;
      function IsFindItemValue(FilterInterface: TFilterInterface; Find: TFindItem; DatePart: TDateKind): Boolean;
      function IsValue(Find: TFindItem; Kind: TFieldEditKind; ValueKind: TFindValueKind; Two: Boolean): Boolean;
      procedure GetFindItemValue(FilterInterface: TFilterInterface; Find: TFindItem; LastValue, LastCaption: string);
      procedure GetValue(FilterInterface: TFilterInterface; Find: TFindItem; Field: TFindFieldItem; Value1, Value2, OperVal: TFindValue; Oper: TOperItem; LastValue, LastCaption: string; DatePart: TDateKind);
      procedure InternalGetValue(Find: TFindItem; Kind: TFieldEditKind; ValueKind: TFindValueKind; Field: TFindFieldItem; Value1, Value2, OperVal: TFindValue; Oper: TOperItem; LastValue, LastCaption: string; Spr: TSprItem);
      procedure SetFindItemValue(FilterInterface: TFilterInterface; Find: TFindItem; var LastValue, LastCaption: string);
      procedure SetValue(Find: TFindItem; Kind: TFieldEditKind; Field: TFindFieldItem; Value1, Value2, OperVal: TFindValue; Oper: TOperItem; var LastValue, LastCaption: string; Spr: TSprItem);
      procedure Disable;
      procedure Invisible;
      procedure ClearValue(Find: TFindItem; Kind: TFieldEditKind; ValueKind: TFindValueKind);
      procedure InitControl(FindItem: TFindItem; EditKind: TFieldEditKind; SprItem: TSprItem);
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TValueControl read GetItem; default;
   end;

   TUndoActionKind=(akAdd, akDelete, akClear, akAddPar, akChange, akDelValue, akParIn);

   // элемент отмены/повтора действий пользователя
   TFilterUndoItem=class(TObject)
   private
      FFilter: TFindList;
      FTopIndex: Integer;
      FSelIndex: Integer;
      FActionKind: TUndoActionKind;
   public
      constructor Create(Filter: TFindList; TopIndex, SelIndex: Integer; ActionKind: TUndoActionKind);
      destructor Destroy; override;
   public
      property Filter: TFindList read FFilter;
      property TopIndex: Integer read FTopIndex;
      property SelIndex: Integer read FSelIndex;
      property ActionKind: TUndoActionKind read FActionKind;
   end;

   // список отмены/повтора действий пользователя
   TFilterUndoList=class(TObject)
   private
      FList: TList;
      FMax: Integer;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TFilterUndoItem;
   public
      constructor Create(Max: Integer);
      destructor Destroy; override;
      procedure Clear;
      procedure Add(Item: TFilterUndoItem);
      procedure Delete(I: Integer);
      procedure AddNew(Filter: TFindList; TopIndex, SelIndex: Integer; ActionKind: TUndoActionKind);
      procedure DeleteLast;
      function Last: TFilterUndoItem;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]:TFilterUndoItem read GetItem;
      property Max: Integer read FMax;
   end;

function GetTextWidth(Text: string; FontSize: Integer; FontName: string; Bold: Boolean): Integer;
function GetFontHeight(FontSize: Integer; FontName: string): Integer;
function GetAveCharSizeR(Canvas: TCanvas): TPoint;
function InputQueryR(const ACaption, APrompt: string; var Value: string): Boolean;
function MessageDlgR(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): Integer;
function RUS_LCID: LongWord;
function ENG_LCID: LongWord;
// TComboBox
function GetComboBoxNonTextArea: Integer;
function GetComboBoxHint(Text: string; cb: TComboBox; IsBold: Boolean): string;
type
   TGetItemCaption=function(Strings: TStrings; Ind: Integer; var AddWidth: Integer; var IsBold: Boolean): string;
procedure SetComboBoxDropDownWidth(cb: TComboBox; MaxWidth: Integer; GetItemCaption: TGetItemCaption);
procedure SetComboBoxHeight(cb: TComboBox; AddHeight: Integer);
// TListBox
procedure SetListBoxHeight(lb: TListBox);
procedure SetListBoxMaxWidth(lb: TListBox; AddWidth: Integer; IsBold: Boolean);
// Misc
procedure AddControlStyle(Control: TControl; Style: TControlStyle);
function StringToDate(S: string): TDateTime;
function DateToString(D: TDateTime): string;

const
   MapBool: array [Boolean] of string=('0', '1');
   CMinIndent: string='   ';
   CValueCaptionDateFmt: string='DD.MM.YYYY';
   CExistsOp: string='EXISTS';
   CMaxDropDownGroup=25;
   CMaxDropDownOper: Integer=20;
   CRootTag=1;
   CGroupTag=2;
   CFieldTag=3;
   CListTag=4;

implementation
uses
   fFind2, fFindPrm, fOrderBy, fFindSel, fGroup, fGroupBy, fGrpDK,
  StrUtils;

resourcestring
   CFirstLine='Фильтр АС "Сельсовет" (СОДЕРЖАНИЕ ЭТОГО ФАЙЛА НЕЛЬЗЯ МЕНЯТЬ ВРУЧНУЮ)';
   CFirstLine2='Группировка АС "Сельсовет" (СОДЕРЖАНИЕ ЭТОГО ФАЙЛА НЕЛЬЗЯ МЕНЯТЬ ВРУЧНУЮ)';

const
   CMapDirection: array [Boolean] of string=(' DESC', '');

{ TSprItem }

constructor TSprItem.Create(Name, Caption: string; Kind: TSprKind; DataSet: TDataSet; KeyList, NameList: TStringList; KeyFieldName, NameFieldName, AddFields: string; EditKind: TSprEditKind; {//ind}IndexName: string);
begin
   FKeyList:=TStringList.Create;
   FNameList:=TStringList.Create;
   FName:=Name;
   FCaption:=Caption;
   FKind:=Kind;
   FDataSet:=DataSet;
   if KeyList<>nil then begin
      FKeyList.Assign(KeyList);
   end;
   if NameList<>nil then begin
      FNameList.Assign(NameList);
   end;
   FKeyFieldName:=KeyFieldName;
   FNameFieldName:=NameFieldName;
   FFieldNames:=TStringList.Create;
   if AddFields='' then begin
      //--FFieldNames.Add(Format('%s=Код', [FKeyFieldName]));
      FFieldNames.Add(Format('%s=Наименование', [FNameFieldName]));
   end
   else begin
      FFieldNames.CommaText:=AddFields;
   end;
   FEditKind:=EditKind;
   FIndexName:=IndexName; //ind
   FOldIndexName:='.'; //ind
end;

destructor TSprItem.Destroy;
begin
   FFieldNames.Free;
   FKeyList.Free;
   FNameList.Free;
   inherited;
end;

procedure TSprItem.FillStrings(sl: TStrings);
var
   NameField: TField;
   KeyField: TField;
   fl: Boolean; //ind
begin
   if (FKeyList.Count=0) and (FKind=skDataSet) then begin
      if not FDataSet.Active then begin
         FDataSet.Open;
      end;
      fl:=SetIndexName;//ind
      try
         NameField:=FDataSet.FindField(FNameFieldName);
         KeyField:=FDataSet.FindField(FKeyFieldName);
         FNameList.Clear;
         if (NameField<>nil) and (KeyField<>nil) then begin
            FDataSet.First;
            while not FDataSet.Eof do begin
               FNameList.Add(NameField.AsString);
               FKeyList.Add(KeyField.AsString);
               FDataSet.Next;
            end;
         end;
      finally
         //ind
         if fl then begin
            RestoreIndexName;
         end;
      end;
   end;
   if sl<>nil then begin
      sl.BeginUpdate;
      try
         sl.Clear;
         sl.Assign(FNameList);
      finally
         sl.EndUpdate;
      end;
   end;
end;

procedure TSprItem.RestoreIndexName;
var
   PropInfo: PPropInfo;
   S: string;
begin
   if FOldIndexName<>'.' then begin
      PropInfo:=GetPropInfo(FDataSet, 'IndexName');
      if PropInfo<>nil then begin
         S:=GetStrProp(FDataSet, PropInfo);
         if not SameText(S, FOldIndexName) then begin
            SetStrProp(FDataSet, PropInfo, FOldIndexName);
         end;
      end;
      FOldIndexName:='.';
   end;
end;

function TSprItem.SetIndexName: Boolean;
var
   PropInfo: PPropInfo;
   S: string;
begin
   Result:=False;
   if FIndexName<>'' then begin
      PropInfo:=GetPropInfo(FDataSet, 'IndexName');
      if PropInfo<>nil then begin
         S:=GetStrProp(FDataSet, PropInfo);
         if not SameText(S, FIndexName) then begin
            FOldIndexName:=S;
            SetStrProp(FDataSet, PropInfo, FIndexName);
            Result:=True;
         end;
      end;
   end;
end;

{ TSprList }

function TSprList.Add(Item: TSprItem): Integer;
begin
   Result:=FList.Add(Item);
end;

function TSprList.AddNew(Name, Caption: string; Kind: TSprKind; DataSet: TDataSet; KeyList, NameList: TStringList; KeyFieldName, NameFieldName, AddFields: string; EditKind: TSprEditKind; {//ind}IndexName: string): TSprItem;
begin
   Result:=TSprItem.Create(Name, Caption, Kind, DataSet, KeyList, NameList, KeyFieldName, NameFieldName, AddFields, EditKind, {//ind}IndexName);
   Add(Result);
end;

function TSprList.ByName(Name: string): TSprItem;
var
   I: Integer;
   Item: TSprItem;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (AnsiCompareText(Item.Name, Name)=0) then begin
         Result:=Item;
         Exit;
      end;
   end;
end;

procedure TSprList.Clear;
var
   I: Integer;
   Item: TSprItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

constructor TSprList.Create;
begin
   FList:=TList.Create;
end;

destructor TSprList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TSprList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TSprList.GetItem(I: Integer): TSprItem;
begin
   Result:=TSprItem(FList[I]);
end;

procedure TSprList.RestoreIndexName;
var
   I: Integer;
   Item: TSprItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.RestoreIndexName;
      end;
   end;
end;

{ TOperItem }

const
   FindFieldKindIden: array [TFindFieldKind] of string=('STRING', 'TEXT', 'BOOLEAN', 'NUMBER', 'FLOAT', 'DATE', 'LIST', 'SPR', 'PROP', 'REL', 'NULL', 'FTS', 'TRIM', 'EXT', 'STAMP', 'AGE');
   //--FindFieldKindName: array [TFindFieldKind] of string=('Строка', 'Логическое', 'Число', 'Дробное', 'Дата', 'Список', 'Справочник', 'Свойство', 'Отношение', 'Пустое');

function FindFieldKindByIden(Iden: string; var Kind: TFindFieldKind): Boolean;
var
   I: TFindFieldKind;
begin
   Result:=False;
   for I:=Low(TFindFieldKind) to High(TFindFieldKind) do begin
      if CompareText(Iden, FindFieldKindIden[I])=0 then begin
         Kind:=I;
         Result:=True;
         Break;
      end;
   end;
end;


constructor TOperItem.Create(Name, Caption, SQL: string; FieldKinds: string; NeedValue, TwoValue, CaseSensitive, MultiSel, MultiOr, OwnValue: Boolean; OwnValName, OwnValKind, OwnSprName: string);
var
   sl: TStringList;
   I: Integer;
   Kind: TFindFieldKind;
begin
   FName:=Name;
   FCaption:=Caption;
   FSQL:=SQL;
   FNeedValue:=NeedValue;
   FTwoValue:=TwoValue;
   FCaseSensitive:=CaseSensitive;
   sl:=TStringList.Create;
   try
      sl.CommaText:=FieldKinds;
      FFieldKinds:=[];
      for I:=0 to Pred(sl.Count) do begin
         if FindFieldKindByIden(sl[I], Kind) then begin
            FFieldKinds:=FFieldKinds+[Kind];
         end;
      end;
   finally
      sl.Free;
   end;
   FMultiSel:=MultiSel;
   FMultiOr:=MultiOr;
   FOwnValue:=OwnValue;
   FOwnValName:=OwnValName;
   FOwnValKind:=valNone;
   if OwnValKind='STRING' then FOwnValKind:=valString
   else if OwnValKind='NUMBER' then FOwnValKind:=valNumber
   else if OwnValKind='BOOLEAN' then FOwnValKind:=valBoolean
   else if OwnValKind='FLOAT' then FOwnValKind:=valFloat
   else if OwnValKind='DATE' then FOwnValKind:=valDate;
   FOwnSprName:=Trim(OwnSprName);
   FOrder:=0;
end;

destructor TOperItem.Destroy;
begin
   inherited;
end;

function TOperItem.GetEditKind(SprList: TSprList): TFieldEditKind;
var
   Spr: TSprItem;
begin
   Result:=fekNone;
   if (FOwnSprName<>'') and (SprList<>nil) then begin
      Spr:=SprList.ByName(FOwnSprName);
      case Spr.EditKind of
         sekDefault: begin
            case Spr.Kind of
               skDataSet: Result:=fekGridW;
               skStringList: Result:=fekComboBox;
            end;
         end;
         sekCheckList: Result:=fekCheckList;
         sekGrid: Result:=fekGridW;
         sekGrid2: Result:=fekGridW2;
         sekComboBox: Result:=fekComboBox;
         sekLookup: Result:=fekLookup;
      end;
   end
   else begin
      case FOwnValKind of
         valString: Result:=fekString;
         valBoolean: Result:=fekBoolean;
         valNumber: Result:=fekNumber;
         valFloat: Result:=fekFloat;
         valDate: Result:=fekDate;
      end;
   end;
end;

{ TOperList }

function TOperList.Add(Item: TOperItem): Integer;
begin
   Result:=FList.Add(Item);
end;

function TOperList.AddNew(Name, Caption, SQL: string; FieldKinds: string; NeedValue, TwoValue, CaseSensitive, MultiSel, MultiOr, OwnValue: Boolean; OwnValName, OwnValKind, OwnSprName: string): TOperItem;
begin
   Result:=TOperItem.Create(Name, Caption, SQL, FieldKinds, NeedValue, TwoValue, CaseSensitive, MultiSel, MultiOr, OwnValue,OwnValName, OwnValKind, OwnSprName);
   Add(Result);
end;

function TOperList.ByName(Name: string): TOperItem;
var
   I: Integer;
   Item: TOperItem;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (AnsiCompareText(Item.Name, Name)=0) then begin
         Result:=Item;
         Break;
      end;
   end;
end;

procedure TOperList.Clear;
var
   I: Integer;
   Item: TOperItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

constructor TOperList.Create;
begin
   FList:=TList.Create;
end;

destructor TOperList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

procedure TOperList.FillComboBox(FilterInterface: TFilterInterface; Field: TFindFieldItem; ComboBox: TComboBox; DatePart: TDateKind);
var
   I: Integer;
   Oper: TOperItem;
   Ind: Integer;
   Kinds: TFindFieldKinds;
   RelItem: TRelItem;
   W: Integer;
   MaxW: Integer;
   B: Integer;
begin
   Kinds:=Field.Kinds;
   //++ поддержка поиска по части даты
   if (ffkDate in Kinds) and (DatePart<>dkFull) then begin
      Exclude(Kinds, ffkDate);
      Include(Kinds, ffkNumber);
   end;
   //\\
   // заполняем список операций согласно типам поля
   FillStrings(ComboBox.Items, Kinds, False, Field.GetMultiSel(FilterInterface.SprList));
   // растягиваем ComboBox до нужной длины
   B:=GetComboBoxNonTextArea;
   MaxW:=ComboBox.Width-B;
   for I:=0 to Pred(ComboBox.Items.Count) do begin
      W:=GetTextWidth(ComboBox.Items[I], ComboBox.Font.Height, ComboBox.Font.Name, False);
      if W>MaxW then begin
         MaxW:=W;
      end;
   end;
   ComboBox.Width:=MaxW+B;
   // проверяем доступность операций group by
   if Field.RelName<>'' then begin
      RelItem:=FilterInterface.RelList.ByName(Field.RelName);
      if (RelItem<>nil) and (RelItem.GroupBy='') then begin
          I:=0;
          while I<ComboBox.Items.Count do begin
             Oper:=TOperItem(ComboBox.Items.Objects[I]);
             if (Oper<>nil) and (Pos('GROUP BY', UpperCase(Oper.SQL))<>0) then begin
                ComboBox.Items.Delete(I);
             end
             else begin
                Inc(I);
             end;
          end;
      end;
   end;
   // устанавливаем операцию по умолчанию
   // NB: нет поддержки поиска по части даты
   if Field.DefaultOp<>'' then begin
      Oper:=ByName(Field.DefaultOp);
      if Oper<>nil then begin
         Ind:=ComboBox.Items.IndexOfObject(Oper);
         if Ind<>-1 then begin
            ComboBox.ItemIndex:=Ind;
         end;
      end;
   end;
   // проверяем ситуацию, когда доступна только одна операция
   if ComboBox.Items.Count=1 then begin
      ComboBox.ItemIndex:=0;
   end;
   ComboBox.DropDownCount:=ComboBox.Items.Count;
end;

procedure TOperList.FillStrings(S: TStrings; Kinds: TFindFieldKinds; KeyList, MultiSel: Boolean);
var
   I: Integer;
   Oper: TOperItem;
   K: TFindFieldKinds;
begin
   S.Clear;
//   K:=Kinds-[ffkNotNull, ffkFTS, ffkDoTrim];  26.10.2018 vadim в связи с добавлением  ffkStamp
   K:=Kinds-[ffkNotNull, ffkFTS, ffkDoTrim, ffkAge];
   for I:=0 to Pred(GetCount) do begin
      Oper:=GetItem(I);
      if Oper<>nil then begin
         if (ffkStamp in Oper.FieldKinds) and not (ffkStamp in Kinds) then Continue; //  add 26.10.2018 vadim
         if (ffkProp in Oper.FieldKinds) and not (ffkProp in Kinds) then Continue;
         if (ffkRel in Oper.FieldKinds) and not (ffkRel in Kinds) then Continue;
         if (ffkFTS in Oper.FieldKinds) and not (ffkFTS in Kinds) then Continue;
         if (ffkNotNull in Oper.FieldKinds) and (ffkNotNull in Kinds) then Continue;
         if (K<=Oper.FieldKinds) and (not MultiSel or (MultiSel=Oper.MultiSel)) then begin
            if KeyList then begin
               S.AddObject(Oper.Name, Oper);
            end
            else begin
               S.AddObject(Oper.Caption, Oper);
            end;
         end;
      end;
   end;
end;

function TOperList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TOperList.GetItem(I: Integer): TOperItem;
begin
   Result:=TOperItem(FList[I]);
end;

function OperListReorder(Item1, Item2: Pointer): Integer;
begin
   Result:=TOperItem(Item1).Order-TOperItem(Item2).Order;
end;

procedure TOperList.Reorder;
begin
   FList.Sort(OperListReorder);
end;

{ TFindFieldList }

function TFindFieldList.Add(Item: TFindFieldItem): Integer;
begin
   Result:=FList.Add(Item);
   Item.SetList(Self, Result);
end;

function TFindFieldList.AddNew(Name, RealName, Caption, AddCaption, Alias: string; Kinds: TFindFieldKinds; Visible, CaseSensitive, IsUpper: Boolean; SprName: string; Owner: TFindFieldItem; Order: Integer; Group, DefaultOp, RelName: string; SprEditKind: TSprEditKind): TFindFieldItem;
begin
   Result:=TFindFieldItem.Create(Name, RealName, Caption, AddCaption, Alias, Kinds, Visible, CaseSensitive, IsUpper, SprName, Owner, Order, Group, DefaultOp, RelName, SprEditKind);
   Add(Result);
end;

procedure TFindFieldList.BuildFieldTree(FilterInterface: TFilterInterface; Tree: TElTree; Combo: TComboBox; IsRootNode, IsSimpleField: Boolean);
var
   I: Integer;
   J: Integer;
   P: Integer;
   Field: TFindFieldItem;
   RootNode: TElTreeItem;
   OwnerFolder: TElTreeItem;
   GroupFolder: TElTreeItem;
   GroupName: string;
   OwnerIndex: Integer;
   GroupIndex: Integer;
   LastGroup: string;
   RootGroup: string;
   FieldNode: TElTreeItem;
   Owners: TStringList;
   Groups: TStringList;

   // инициализация узла дерева
   procedure InitNode(Node: TElTreeItem; Color: TColor; Bold: Boolean; Tag: Integer);
   begin
      Node.ParentStyle:=False;
      Node.ParentColors:=False;
      Node.UseBkColor:=False;
      Node.Color:=Color;
      Node.Bold:=Bold;
      Node.Tag:=Tag;
   end;

   // расчёт отступа для группы
   function CountIndent(Field: TFindFieldItem): string;
   var
      P: Integer;
      Group: string;
   begin
      Result:='';
      while Field<>nil do begin
         Group:=Field.Group;
         if Group<>'' then begin
            Result:=Result+CMinIndent;
            repeat
               P:=Pos('\', Group);
               if P<>0 then begin
                  Group[P]:=' ';
                  Result:=Result+CMinIndent;
               end;
            until P=0;
         end;
         Field:=Field.Owner;
      end;
   end;

   // добавление группы
   function AddGroup(Name: string): TElTreeItem;
   var
      Ind: Integer;
      AddName: string;
      PP: Integer;
   begin
      AddName:=Name;
      Name:=CMinIndent+Name;
      if Field.Owner<>nil then begin
         Name:=CountIndent(Field.Owner)+Field.Indent+AddName+'~'+Field.Owner.Path;
      end;
      Ind:=Groups.IndexOf(Name);
      if Ind=-1 then begin
         // удаляем вложенные группы, оставляя последнюю
         PP:=Pos('\', AddName);
         while PP<>0 do begin
            Delete(AddName, 1, PP);
            PP:=Pos('\', AddName);
         end;
         Result:=Tree.Items.AddChildObject(OwnerFolder, AddName, nil);
         InitNode(Result, clMaroon, True, CGroupTag);
         Groups.AddObject(Name, Result);
         if FilterInterface.GroupImageIndex<>-1 then begin
            Result.ImageIndex:=FilterInterface.AddImageIndex+FilterInterface.GroupImageIndex;
         end
         else begin
            Result.ImageIndex:=II_CloseGroup;
         end;
      end
      else begin
         Result:=TElTreeItem(Groups.Objects[Ind]);
      end;
   end;

begin
   Groups:=TStringList.Create;
   Owners:=TStringList.Create;
   if Combo<>nil then begin
      Combo.Items.BeginUpdate;
   end;
   Tree.Items.BeginUpdate;
   try
      if Combo<>nil then begin
         Combo.Clear;
      end;
      Tree.Items.Clear;
      Tree.ShowButtons:=FilterInterface.ShowButtons;
      Tree.ShowRootButtons:=False;
      Tree.Images:=FilterInterface.Images.imFields;
      // инициализация кореня дерева
      RootNode:=nil;
      if IsRootNode then begin
         RootNode:=Tree.Items.Add(nil, FilterInterface.RootCaption);
         InitNode(RootNode, clMaroon, True, CRootTag);
         if FilterInterface.RootImageIndex<>-1 then begin
            RootNode.ImageIndex:=FilterInterface.AddImageIndex+FilterInterface.RootImageIndex;
         end
         else begin
            RootNode.ImageIndex:=II_Tables;
         end;
      end;
      // цикл по списку полей, в котором строим дерево полей
      for I:=0 to Pred(GetCount) do begin
         Field:=GetItem(I);
         GroupName:=Field.Group;
         OwnerFolder:=RootNode;
         GroupFolder:=nil;        
         if (Field<>nil) and Field.Visible and (not IsSimpleField or (not Field.NotGroupBy and not (ffkText in Field.Kinds) and FilterInterface.CheckAlias(Field) and ([ffkList, ffkProp, ffkRel]*Field.Kinds=[]) and (Field.Owner=nil))) then begin
// vadim!!!         if (Field<>nil) and Field.Visible and (not IsSimpleField or (not Field.NotGroupBy and not (ffkText in Field.Kinds) and (Field.Alias=FilterInterface.MainTableAlias) and ([ffkList, ffkProp, ffkRel]*Field.Kinds=[]) and (Field.Owner=nil))) then begin
            // если поле имеет хозяина, то ищем этого хозяина в списке хозяев
            // (здесь неявно подразумевается, что хозяин уже добавлен в дерево)
            if Field.Owner<>nil then begin
               OwnerIndex:=Owners.IndexOf(Field.Owner.Path);
               if OwnerIndex<>-1 then begin
                  OwnerFolder:=TElTreeItem(Owners.Objects[OwnerIndex]);
               end;
            end;
            // если у поля есть группа, то ищем узел этой группы или создаем
            if GroupName<>'' then begin
               // обрабатываем вложенные группы (например, имея группу
               // "X\YY\ZZZ" добавим "X" и "X\YY")
               LastGroup:=GroupName;
               RootGroup:='';
               P:=Pos('\', LastGroup);
               while P<>0 do begin
                  if RootGroup='' then begin
                     RootGroup:=Copy(LastGroup, 1, Pred(P));
                  end
                  else begin
                     RootGroup:=RootGroup+'\'+Copy(LastGroup, 1, Pred(P));
                  end;
                  OwnerFolder:=AddGroup(RootGroup);
                  Delete(LastGroup, 1, P);
                  P:=Pos('\', LastGroup);
               end;
               //
               GroupFolder:=AddGroup(GroupName);
            end;
            // добавляем поле в дерево
            if GroupFolder<>nil then begin
               OwnerFolder:=GroupFolder;
            end;
            FieldNode:=Tree.Items.AddChildObject(OwnerFolder, Field.Caption, Field);
            // устанавливаем свойства добавленого в дерево узла
            FieldNode.ParentStyle:=False;
            FieldNode.ParentColors:=False;
            FieldNode.UseBkColor:=False;
            InitNode(FieldNode, FieldNode.Color, False, CFieldTag);
            // устанавливаем иконку
            FieldNode.ImageIndex:=FilterInterface.GetImageIndex(Field);
            // для полей-списков делаем специальные действия
            if ffkList in Field.Kinds then begin
               FieldNode.Color:=clNavy;
               FieldNode.Tag:=CListTag;
               // добавляем поле-список в список хозяев
               Owners.AddObject(Field.Path, FieldNode);
               // добавляем поле-список в список групп
               if OwnerFolder=RootNode then begin
                  Groups.AddObject(CountIndent(Field)+Field.Indent+Field.Caption, FieldNode);
               end
               else begin
                  GroupIndex:=Pred(Groups.Count);
                  while GroupIndex>=0 do begin
                     GroupFolder:=TElTreeItem(Groups.Objects[GroupIndex]);
                     if (GroupFolder=OwnerFolder) or (GroupFolder.Parent=OwnerFolder) then begin
                        Groups.InsertObject(Succ(GroupIndex), CountIndent(Field)+Field.Indent+Field.Caption, FieldNode);
                        Break;
                     end;
                     Dec(GroupIndex);
                  end;
               end;
            end;
         end;
      end;
      // добавить группы и хозяев в быстрый подвод
      if Combo<>nil then begin
         for I:=0 to Pred(Groups.Count) do begin
            GroupName:=Groups[I];
            P:=Pos('\', GroupName);
            if P<>0 then begin
               LastGroup:=GroupName;
               J:=1;
               GroupName:='';
               while (J<Length(LastGroup)) and (LastGroup[J]=' ') do begin
                  GroupName:=GroupName+' ';
                  Inc(J);
               end;
               Delete(LastGroup, 1, Pred(J));
               P:=Pos('\', LastGroup);
               while P<>0 do begin
                  GroupName:=GroupName+CMinIndent;
                  Delete(LastGroup, 1, P);
                  P:=Pos('\', LastGroup);
               end;
               GroupName:=GroupName+LastGroup;
            end;
            P:=Pos('~', GroupName);
            if P<>0 then begin
               Delete(GroupName, P, Succ(Length(GroupName)-P));
            end;
            Combo.Items.AddObject(GroupName, Groups.Objects[I]);
         end;
         Combo.Items.InsertObject(0, FilterInterface.RootCaption, RootNode);
         if Combo.Items.Count<CMaxDropDownGroup then begin
            Combo.DropDownCount:=Combo.Items.Count;
         end
         else begin
            Combo.DropDownCount:=CMaxDropDownGroup;
         end;
      end;
      //
      //SetComboBoxWidth;
      // раскрыть все дерево
      //RootNode.Expand(FilterInterface.FirstRun and not FilterInterface.CollapseAll);
   finally
      Tree.Items.EndUpdate;
      if Combo<>nil then begin
         Combo.Items.EndUpdate;
      end;
      Groups.Free;
      Owners.Free;
   end;
end;

function TFindFieldList.ByName(Owner: TFindFieldItem; Name: string): Integer;
var
   I: Integer;
   Item: TFindFieldItem;
begin
   Result:=-1;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Item.Owner=Owner) and (AnsiCompareText(Item.Name, Name)=0) then begin
         Result:=I;
         Break;
      end;
   end;
end;

function TFindFieldList.ByPath(Path: string): TFindFieldItem;
var
   I: Integer;
   Item: TFindFieldItem;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (AnsiCompareText(Item.Path, Path)=0) then begin
         Result:=Item;
         Break;
      end;
   end;
end;

function TFindFieldList.ByRealName(Owner: TFindFieldItem; RealName: string): TFindFieldItem;
var
   I: Integer;
   Item: TFindFieldItem;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Item.Owner=Owner) and (AnsiCompareText(Item.RealName, RealName)=0) then begin
         Result:=Item;
         Break;                            
      end;
   end;
end;

function TFindFieldList.ByRealName(Owner: TFindFieldItem; Alias, RealName: string): TFindFieldItem;
var
   I: Integer;
   Item: TFindFieldItem;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Item.Owner=Owner) and (AnsiCompareText(Item.Alias, Alias)=0) and (AnsiCompareText(Item.RealName, RealName)=0) then begin
         Result:=Item;
         Break;
      end;
   end;
end;

procedure TFindFieldList.Clear;
var
   I: Integer;
   Item: TFindFieldItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
   FLastGroups.Clear;
end;

constructor TFindFieldList.Create;
begin
   FList:=TList.Create;
   FTopIndex:=0;
   FSelIndex:=0;
   FLastGroups:=TStringList.Create;
   FSorted:=False;
end;

destructor TFindFieldList.Destroy;
begin
   Clear;
   FList.Free;
   FLastGroups.Free;
   inherited;
end;

function TFindFieldList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TFindFieldList.GetIndex(Item: TFindFieldItem): Integer;
begin
   Result:=FList.IndexOf(Item);
end;

function TFindFieldList.GetItem(I: Integer): TFindFieldItem;
begin
   Result:=TFindFieldItem(FList[I]);
end;

function TFindFieldList.GetMaxLevel: Integer;
var
   I: Integer;
   L: Integer;
   Item: TFindFieldItem;
begin
   Result:=1;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         L:=Item.GetLevel;
         if L>Result then begin
            Result:=L;
         end;
      end;
   end;
end;

function TFindFieldList.IndexOf(Item: TFindFieldItem): Integer;
begin
   Result:=FList.IndexOf(Item);
end;

procedure TFindFieldList.Insert(Ind: Integer; Item: TFindFieldItem);
begin
   //NB: прикольно, что здесь индекс увеличивается на единицу
   FList.Insert(Succ(Ind), Item);
   Item.SetList(Self, Succ(Ind));
end;

function TFindFieldList.InsertNew(AfterItem, Name, RealName, Caption, AddCaption, Alias: string; Kinds: TFindFieldKinds; Visible, CaseSensitive, IsUpper: Boolean; SprName: string; Owner: TFindFieldItem; Order: Integer; Group, DefaultOp, RelName: string; SprEditKind: TSprEditKind): TFindFieldItem;
var
   Ind: Integer;
   NewGroup: string;
   Item: TFindFieldItem;
begin
   Ind:=ByName(Owner, AfterItem);
   if Ind=-1 then begin
      Result:=TFindFieldItem.Create(Name, RealName, Caption, AddCaption, Alias, Kinds, Visible, CaseSensitive, IsUpper, SprName, Owner, Order, Group, DefaultOp, RelName, SprEditKind);
      Add(Result);
   end
   else begin
      Item:=GetItem(Ind);
      if Item<>nil then begin
         NewGroup:=Item.Group;
      end
      else begin
         NewGroup:=Group;
      end;
      Result:=TFindFieldItem.Create(Name, RealName, Caption, AddCaption, Alias, Kinds, Visible, CaseSensitive, IsUpper, SprName, Owner, Order, NewGroup, DefaultOp, RelName, SprEditKind);
      Insert(Ind, Result);
   end;
end;

function TFindFieldList.LoadFromFile(FileName: string): Boolean;
var
   Ini: TMemIniFile;
begin
   Result:=False;
   if (FileName<>'') and FileExists(FileName) then begin
      Ini:=TMemIniFile.Create(FileName);
      try
         Result:=LoadFromIni(Ini);
         FFileName:=FileName;
      finally
         Ini.UpdateFile;
         Ini.Free;
      end;
   end;
end;

function TFindFieldList.LoadFromIni(Ini: TCustomIniFile): Boolean;
var
   I: Integer;
   Cnt: Integer;
   Section: string;
   Name: string;
   RealName: string;
   Caption: string;
   AddCaption: string;
   Alias: string;
   sl: TStringList;
   J: Integer;
   Kind: TFindFieldKind;
   Kinds: TFindFieldKinds;
   Visible: Boolean;
   CaseSensitive: Boolean;
   IsUpper: Boolean;
   SprName: string;
   Owner: TFindFieldItem;
   Order: Integer;
   Group: string;
   DefaultOp: string;
   RelName: string;
   SprEditKind: TSprEditKind;
   S: string;
begin
   Result:=False;
   Clear;
   if Ini<>nil then begin
      sl:=TStringList.Create;
      try
         Cnt:=Ini.ReadInteger('FindFieldList', 'Count', 0);
         for I:=0 to Pred(Cnt) do begin
            Section:=Format('Item%d', [I]);
            if Ini.SectionExists(Section) then begin
               Name:=Ini.ReadString(Section, 'Name', '');
               RealName:=Ini.ReadString(Section, 'RealName', '');
               Caption:=Ini.ReadString(Section, 'Caption', '');
               AddCaption:=Ini.ReadString(Section, 'AddCaption', '');
               Alias:=Ini.ReadString(Section, 'Alias', '');
               sl.CommaText:=Ini.ReadString(Section, 'Kinds', '');
               Kinds:=[];
               for J:=0 to Pred(sl.Count) do begin
                  Kind:=TFindFieldKind(GetEnumValue(TypeInfo(TFindFieldKind), sl[J]));
                  Include(Kinds, Kind);
               end;
               Visible:=Ini.ReadString(Section, 'Visible', '')=MapBool[True];
               CaseSensitive:=Ini.ReadString(Section, 'CaseSensitive', '')=MapBool[True];
               IsUpper:=Ini.ReadString(Section, 'IsUpper', '')=MapBool[True];
               SprName:=Ini.ReadString(Section, 'SprName', '');
               S:=Ini.ReadString(Section, 'Owner', '-');
               Owner:=nil;
               if S<>'-' then begin
                  Owner:=ByPath(S);
               end;
               Order:=Ini.ReadInteger(Section, 'Order', 0);
               Group:=Ini.ReadString(Section, 'Group', '');
               DefaultOp:=Ini.ReadString(Section, 'DefaultOp', '');
               RelName:=Ini.ReadString(Section, 'RelName', '');
               SprEditKind:=TSprEditKind(GetEnumValue(TypeInfo(TSprEditKind), Ini.ReadString(Section, 'SprEditKind', '')));
               AddNew(Name, RealName, Caption, AddCaption, Alias, Kinds, Visible, CaseSensitive, IsUpper, SprName, Owner, Order, Group, DefaultOp, RelName, SprEditKind);
            end;
         end;
         Result:=True;
      finally
         sl.Free;
      end;
   end;
end;

procedure TFindFieldList.ResetListOrder;
var
   I: Integer;
   Item: TFindFieldItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.ListOrder:=Succ(I);
      end;
   end;
end;

function TFindFieldList.SaveToFile(FileName: string): Boolean;
var
   Ini: TMemIniFile;
begin
   Result:=False;
   if FileName<>'' then begin
      Ini:=TMemIniFile.Create(FileName);
      try
         Result:=SaveToIni(Ini);
      finally
         Ini.UpdateFile;
         Ini.Free;
      end;
   end;
end;

function TFindFieldList.SaveToIni(Ini: TCustomIniFile): Boolean;
var
   I: Integer;
   S: string;
   Kind: TFindFieldKind;
   Section: string;
   Field: TFindFieldItem;
begin
   Result:=False;
   if Ini<>nil then begin
      Ini.WriteInteger('FindFieldList', 'Count', GetCount);
      for I:=0 to Pred(GetCount) do begin
         Field:=GetItem(I);
         if Field<>nil then begin
            Section:=Format('Item%d', [I]);
            Ini.WriteString(Section, 'Name', Field.Name);
            Ini.WriteString(Section, 'RealName', Field.RealName);
            Ini.WriteString(Section, 'Caption', Field.Caption);
            if Field.Caption=Field.AddCaption then begin
               Ini.WriteString(Section, 'AddCaption', '');
            end
            else begin
               Ini.WriteString(Section, 'AddCaption', Field.AddCaption);
            end;
            Ini.WriteString(Section, 'Alias', Field.Alias);
            S:='';
            for Kind:=Low(TFindFieldKind) to High(TFindFieldKind) do begin
               if Kind in Field.Kinds then begin
                  if S='' then begin
                     S:=GetEnumName(TypeInfo(TFindFieldKind), Ord(Kind));
                  end
                  else begin
                     S:=S+','+GetEnumName(TypeInfo(TFindFieldKind), Ord(Kind));
                  end;
               end;
            end;
            Ini.WriteString(Section, 'Kinds', S);
            Ini.WriteString(Section, 'Visible', MapBool[Field.Visible]);
            Ini.WriteString(Section, 'CaseSensitive', MapBool[Field.CaseSensitive]);
            Ini.WriteString(Section, 'IsUpper', MapBool[Field.IsUpper]);
            Ini.WriteString(Section, 'SprName', Field.SprName);
            if Field.Owner=nil then begin
               Ini.WriteString(Section, 'Owner', '-');
            end
            else begin
               Ini.WriteString(Section, 'Owner', Field.Owner.Path);
            end;
            Ini.WriteInteger(Section, 'Order', Field.Order);
            Ini.WriteString(Section, 'Group', Field.Group);
            Ini.WriteString(Section, 'DefaultOp', Field.DefaultOp);
            Ini.WriteString(Section, 'RelName', Field.RelName);
            Ini.WriteString(Section, 'SprEditKind', GetEnumName(TypeInfo(TSprEditKind), Ord(Field.SprEditKind)));
         end;
      end;
      Result:=True;
   end;
end;

var
   VMaxLevel: Integer;

function CompareFindField(Item1, Item2: Pointer): Integer;
var
   Field1: TFindFieldItem;
   Field2: TFindFieldItem;
   Order1: string;
   Order2: string;
begin
   Field1:=TFindFieldItem(Item1);
   Field2:=TFindFieldItem(Item2);
   Order1:=Field1.GetInternalOrder(VMaxLevel);
   Order2:=Field2.GetInternalOrder(VMaxLevel);
   Result:=CompareText(Order1, Order2);
end;

procedure TFindFieldList.SetVisible(Group: string; Visible: Boolean);
var
   I: Integer;
   Item: TFindFieldItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (AnsiCompareText(Item.Group, Group)=0) then begin
         Item.Visible:=Visible;
      end;
   end;
end;

procedure TFindFieldList.Sort;
begin
   if not FSorted then begin
      VMaxLevel:=GetMaxLevel;
      FList.Sort(CompareFindField);
      FSorted:=True;
   end;
end;

{ TFindFieldItem }

procedure TFindFieldItem.Change(Caption, AddCaption, Alias, RealName, Group, DefaultOp, RelName, SprName: string; Kinds: TFindFieldKinds; SprEditKind: TSprEditKind; Visible, CaseSensitive, IsUpper: Boolean; Order: Integer);
begin
   FCaption:=Caption;
   if AddCaption='' then begin
      FAddCaption:=Caption;
   end
   else begin
      FAddCaption:=AddCaption;
   end;
   FAlias:=Alias;
   FRealName:=RealName;
   FGroup:=Group;
   FDefaultOp:=DefaultOp;
   FRelName:=RelName;
   FSprName:=SprName;
   FKinds:=Kinds;
   FSprEditKind:=SprEditKind;
   FVisible:=Visible;
   FCaseSensitive:=CaseSensitive;
   FIsUpper:=IsUpper;
   if Order<0 then begin
      Order:=0;
   end;
   FOrder:=Order;
end;

constructor TFindFieldItem.Create(Name, RealName, Caption, AddCaption, Alias: string; Kinds: TFindFieldKinds; Visible, CaseSensitive, IsUpper: Boolean; SprName: string; Owner: TFindFieldItem; Order: Integer; Group, DefaultOp, RelName: string; SprEditKind: TSprEditKind);
begin
   FName:=Trim(Name);
   FRealName:=Trim(RealName);
   FCaption:=Caption;
   FAddCaption:=AddCaption;
   if FAddCaption='' then begin
      FAddCaption:=FCaption;
   end;
   FAlias:=Trim(Alias);
   FKinds:=Kinds;
   FVisible:=Visible;
   FCaseSensitive:=CaseSensitive;
   FIsUpper:=IsUpper;
   FSprName:=Trim(SprName);
   FOwner:=Owner;
   FOrder:=Order;
   FGroup:=Group;
   FDefaultOp:=Trim(DefaultOp);
   FRelName:=Trim(RelName);
   FSprEditKind:=SprEditKind;
   FImageIndex:=-1;
   FExpanded:=False;
   FListOwner:=nil;
   FNotGroupBy:=False;
   FListOrder:=0;
end;

procedure TFindFieldItem.SetCaption(sCaption:String; sAddCaption:String);
begin
  FCaption:=Caption;
  if sAddCaption=''
    then FAddCaption:=FCaption
    else FAddCaption:=sAddCaption;
end;

destructor TFindFieldItem.Destroy;
begin
   inherited;
end;

function TFindFieldItem.GetEditKind(SprList: TSprList; DatePart: TDateKind): TFieldEditKind;
var
   Spr: TSprItem;
   K: TSprEditKind;
begin
   Result:=fekNone;
   if GetIsSpr then begin
      K:=FSprEditKind;
      if K=sekDefault then begin
         if (SprList<>nil) then begin
            Spr:=SprList.ByName(FSprName);
            if Spr<>nil then begin
               K:=Spr.EditKind;
            end;
         end;
      end;
      case K of
         sekDefault: begin
            Result:=fekString;
            if (SprList<>nil) then begin
               Spr:=SprList.ByName(FSprName);
               if (Spr<>nil) and (Spr.Kind in [skDataSet, skStringList]) then begin
                  case Spr.Kind of
                     skDataSet: Result:=fekGridW;
                     skStringList: Result:=fekComboBox;
                  end;
               end;
            end;
         end;
         sekCheckList: Result:=fekCheckList;
         sekGrid: Result:=fekGridW;
         sekGrid2: Result:=fekGridW2;
         sekComboBox: Result:=fekComboBox;
         sekLookup: Result:=fekLookup;
      end;
   end
   else begin
      if ffkString in FKinds then Result:=fekString
      else if ffkText in FKinds then Result:=fekString
      else if ffkBoolean in FKinds then Result:=fekBoolean
      else if ffkNumber in FKinds then Result:=fekNumber
      else if ffkFloat in FKinds then Result:=fekFloat
      else if ffkDate in FKinds then begin
         case DatePart of
            dkYear: Result:=fekNumber;
            dkMonth: Result:=fekMonth;
            dkDayOfMonth: Result:=fekNumber;
            dkFull: Result:=fekDate;
            dkCurrentAge: Result:=fekNumber;
            dkCurrentAgeMonth: Result:=fekNumber;
            dkAgeMonth: Result:=fekAge;
            dkAge: Result:=fekAge;
         end;
      end
      else if ffkList in FKinds then Result:=fekList;
   end;
end;

function TFindFieldItem.GetFullName: string;
begin
   if (ffkList in FKinds) or (Pos('(',FRealName)>0) then begin //(ffkExpression in FKinds) then begin
      Result:=FRealName;
   end
   else begin
      if FAlias=''
        then Result:=FRealName
        else Result:=Format('%s.%s', [FAlias, FRealName]);
   end;
end;

function TFindFieldItem.GetIndent: string;
begin
   Result:=CMinIndent;
   if FOwner<>nil then begin
      Result:=FOwner.Indent+Result;
   end;
end;

function TFindFieldItem.GetInternalOrder(MaxLevel: Integer): string;
var
   L: Integer;
   O: Integer;
   S: string;
begin
   L:=GetLevel;
   O:=FOrder;
   if (O=0) and (FListOwner<>nil) then begin
      //O:=FListOwner.IndexOf(Self);
      O:=FListOrder;
   end;
   if FOwner<>nil then begin
      Result:=FOwner.GetInternalOrder(MaxLevel);
   end
   else begin
      Result:=StringOfChar('0', MaxLevel*3);
   end;
   S:=IntToHex(O, 3);
   Result[Pred(L)*3+1]:=S[1];
   Result[Pred(L)*3+2]:=S[2];
   Result[Pred(L)*3+3]:=S[3];
end;

function TFindFieldItem.GetIsSpr: Boolean;
begin
   Result:=ffkSpr in FKinds;
end;

function TFindFieldItem.GetLevel: Integer;
begin
   Result:=1;
   if Owner<>nil then begin
      Result:=Result+Owner.GetLevel;
   end;
end;

function TFindFieldItem.GetMultiSel(SprList: TSprList): Boolean;
var
   EditKind: TFieldEditKind;
begin
   Result:=False;
   if SprList<>nil then begin
      EditKind:=GetEditKind(SprList, dkFull);
      Result:=EditKind in [fekCheckList];
   end;
end;

function TFindFieldItem.GetPath: string;
begin
   Result:=FName;
   if FOwner<>nil then begin
      Result:=FOwner.Path+'.'+Result;
   end;
end;

procedure TFindFieldItem.SetList(List: TFindFieldList; Ind: Integer);
begin
   FListOrder:=Succ(Ind);
   FListOwner:=List;
end;

function TFindFieldItem.TestErrors(Err: TStrings): Boolean;
var
   fBlankKind: Boolean;
   fBlankName: Boolean;
   fNoType: Boolean;
   fTwoType: Boolean;
   fTwoRel: Boolean;
   fRelAndList: Boolean;
   fNoSprName: Boolean;
   fNoSprKind: Boolean;
   fNoRelName: Boolean;
   fNoRelKind: Boolean;
   fSprKind: Boolean;
   fTrim: Boolean;
   Kind: TFindFieldKind;
begin
   fBlankKind:=True;
   fNoType:=True;
   fTwoType:=False;
   for Kind:=Low(TFindFieldKind) to High(TFindFieldKind) do begin
      if Kind in FKinds then begin
         fBlankKind:=False;
         if Kind in [ffkString, ffkText, ffkBoolean, ffkNumber, ffkFloat, ffkDate, ffkList] then begin
            if not fNoType then begin
               fTwoType:=True;
            end;
            fNoType:=False;
         end;
      end;
   end;
   fTwoRel:=(ffkProp in FKinds) and (ffkRel in FKinds);
   fRelAndList:=(ffkList in FKinds) and ((ffkProp in FKinds) or (ffkRel in FKinds));
   fNoSprName:=(ffkSpr in FKinds) and (FSprName='');
   fNoSprKind:=not (ffkSpr in FKinds) and (FSprName<>'');
   fNoRelName:=((ffkList in FKinds) or (ffkRel in FKinds) or (ffkProp in FKinds)) and (FRelName='');
   fNoRelKind:=(not (ffkList in FKinds) and not (ffkRel in FKinds) and not (ffkProp in FKinds)) and (FRelName<>'');
   fBlankName:=(FName='') or (FRealName='') or (FAlias='');
   fSprKind:=(ffkSpr in FKinds) and not ((ffkNumber in FKinds) or (ffkString in FKinds));
   fTrim:=(ffkDoTrim in FKinds) and not ((ffkString in FKinds) or (ffkText in FKinds));
   Result:=fBlankKind or fBlankName or fNoType or fTwoType or fTwoRel or fRelAndList or fNoSprName or fNoSprKind or fNoRelName or fNoRelKind or fSprKind or fTrim;
   if (Err<>nil) and Result then begin
      Err.Add(Format('Ошибки для поля %s - %s', [FName, FCaption]));
      if fNoType then begin
         Err.Add(' - не задан один из типов поля: строка, логическое, число, дробное число, дата, список');
      end;
      if fBlankKind then begin
         Err.Add(' - не задан тип поля');
      end;
      if fBlankName then begin
         Err.Add(' - не задано одно из обязательных строк: код поля, имя поля, алиас таблицы ');
      end;
      if fTwoType then begin
         Err.Add(' - заданы взаимоисключающие типы поля: строка, логическое, число, дробное число, дата, список');
      end;
      if fTwoRel then begin
         Err.Add(' - заданы взаимоисключающие типы поля: отношение, свойство');
      end;
      if fRelAndList then begin
         Err.Add(' - заданы взаимоисключающие типы поля: список и один из отношение, свойство');
      end;
      if fNoSprName then begin
         Err.Add(' - нет имени справочника, но есть тип - справочник');
      end;
      if fNoSprKind then begin
         Err.Add(' - нет типа - справочник, но есть имя справочника');
      end;
      if fNoRelName then begin
         Err.Add(' - нет имени отношения, но есть один из типов: список, свойство, отношение');
      end;
      if fNoRelKind then begin
         Err.Add(' - нет одного из типов: список, свойство, отношение; но есть имя отношения');
      end;
      if fSprKind then begin
         Err.Add(' - не верный тип поля, к которому подключен справочник; должно быть: строка или число');
      end;
      if fTrim then begin
         Err.Add(' - задан флаг убирать пробелы, но не задан один из типов поля: строка, текст');
      end;
   end;
end;

{ TFilterInterface }

function TFilterInterface.BuildDirFilterList(Dir: string; OwnerFolder: TFindList): Boolean;
var
   sr: TSearchRec;
   Folder: TFindList;
   Filter: TFindList;
   Err: string;
begin
   Result:=True;
   if DirectoryExists(Dir) then begin
      if FindFirst(Dir+'\*', faAnyFile, sr)=0 then begin
         repeat
            if (sr.Attr and faDirectory)=faDirectory then begin
               if (sr.Name<>'.') and (sr.Name<>'..') then begin
                  Folder:=FFilterList.AddFolder(sr.Name);
                  Folder.OwnerFolder:=OwnerFolder;
                  BuildDirFilterList(Dir+'\'+sr.Name, Folder);
               end;
            end
            else begin
               Filter:=FFilterList.AddNew;
               Filter.LoadFromFile(Dir+'\'+sr.Name, Err, FFindFieldList, FOperList);
               Filter.Folder:=Dir;
               Filter.OwnerFolder:=OwnerFolder;
            end;
         until FindNext(sr)<>0;
         SysUtils.FindClose(sr);
      end;
   end;
end;

function TFilterInterface.BuildFilterList: Boolean;
begin
   Result:=True;
   FFilterList.Clear;
   if DirectoryExists(FBaseDir) then begin
      BuildDirFilterList(FBaseDir, nil);
   end;
end;

function TFilterInterface.BuildFilterMenu_old(Menu: TMenu; OnClick: TNotifyEvent): Boolean;
var
   I: Integer;
   Ind: Integer;
   MenuItem: TMenuItem;
   Folders: TList;
   FolderMenus: TList;

   function NewItem(Filter: TFindList; Tag: Integer): TMenuItem;
   begin
      Result:=TMenuItem.Create(Menu.Owner);
      Result.AutoHotkeys:=maManual;
      Result.Tag:=Tag;
      Result.Caption:=Filter.Caption;
      if Filter.HaveParams then begin
         Result.Caption:=Result.Caption+'...';
      end;
      if Assigned(OnClick) then begin
         Result.OnClick:=OnClick;
      end
      else begin
         Result.OnClick:=OnMenuClick;
      end;
   end;

   function NewFolder(Filter: TFindList): TMenuItem;
   begin
      Result:=TMenuItem.Create(Menu.Owner);
      Result.AutoHotkeys:=maManual;
      Result.Caption:=Filter.Caption;
      Folders.Add(Filter);
      FolderMenus.Add(Result);
   end;

begin
   Result:=True;
   if Menu<>nil then begin
      Folders:=TList.Create;
      FolderMenus:=TList.Create;
      try
         Menu.Items.Clear;
         for I:=0 to Pred(FFilterList.Count) do begin
            if FFilterList[I].IsFolder then begin
               MenuItem:=NewFolder(FFilterList[I]);
            end
            else begin
               MenuItem:=NewItem(FFilterList[I], I);
            end;
            if FFilterList[I].OwnerFolder=nil then begin
               Menu.Items.Add(MenuItem);
               DoAddFilterMenu(MenuItem, FFilterList[I].IsFolder, FFilterList[I]);
            end
            else begin
               Ind:=Folders.IndexOf(FFilterList[I].OwnerFolder);
               if Ind<>-1 then begin
                  TMenuItem(FolderMenus[Ind]).Add(MenuItem);
                  DoAddFilterMenu(MenuItem, FFilterList[I].IsFolder, FFilterList[I]);
               end
               else begin
                  MenuItem.Free;
               end;
            end;
         end;
      finally
         FolderMenus.Free;
         Folders.Free;
      end;
   end;
end;

function TFilterInterface.BuildFilterMenu2_old(Menu: TTBSubMenuItem; OnClick: TNotifyEvent): Boolean;
var
   I: Integer;
   Ind: Integer;
   Item: TTBCustomItem;
   Folders: TList;
   FolderMenus: TList;

   function NewItem(Filter: TFindList; Tag: Integer): TTBItem;
   begin
      Result:=TTBItem.Create(Menu.Owner);
      Result.Tag:=Tag;
      Result.Caption:=Filter.Caption;
      if Filter.HaveParams then begin
         Result.Caption:=Result.Caption+'...';
      end;
      if Assigned(OnClick) then begin
         Result.OnClick:=OnClick;
      end
      else begin
         Result.OnClick:=OnMenuClick;
      end;
   end;

   function NewFolder(Filter: TFindList): TTBSubMenuItem;
   begin
      Result:=TTBSubMenuItem.Create(Menu.Owner);
      Result.Caption:=Filter.Caption;
      Folders.Add(Filter);
      FolderMenus.Add(Result);
   end;

begin
   Result:=True;
   if Menu<>nil then begin
      Folders:=TList.Create;
      FolderMenus:=TList.Create;
      try
         Menu.Clear;
         for I:=0 to Pred(FFilterList.Count) do begin
            if FFilterList[I].IsFolder then begin
               Item:=NewFolder(FFilterList[I]);
            end
            else begin
               Item:=NewItem(FFilterList[I], I);
            end;
            if FFilterList[I].OwnerFolder=nil then begin
               Menu.Add(Item);
               DoAddFilterMenu(Item, FFilterList[I].IsFolder, FFilterList[I]);
            end
            else begin
               Ind:=Folders.IndexOf(FFilterList[I].OwnerFolder);
               if Ind<>-1 then begin
                  TTBSubMenuItem(FolderMenus[Ind]).Add(Item);
                  DoAddFilterMenu(Item, FFilterList[I].IsFolder, FFilterList[I]);
               end
               else begin
                  Item.Free;
               end;
            end;
         end;
         Menu.DropdownCombo:=Menu.Count<>0;
      finally
         FolderMenus.Free;
         Folders.Free;
      end;
   end;
end;

function TFilterInterface.BuildFilterMenu(Menu: TMenu; OnClick: TNotifyEvent): Boolean;
var
   I: Integer;
   Ind: Integer;
   MenuItem: TMenuItem;
   Folders: TList;
   FolderMenus: TList;

   function NewItem(FilterName: TFilterName; Tag: Integer): TMenuItem;
   begin
      Result:=TMenuItem.Create(Menu.Owner);
      Result.AutoHotkeys:=maManual;
      Result.Tag:=Tag;
      Result.Caption:=FilterName.Name;
      if Assigned(OnClick) then begin
         Result.OnClick:=OnClick;
      end
      else begin
         Result.OnClick:=OnMenu2Click;
      end;
   end;

   function NewFolder(FilterName: TFilterName): TMenuItem;
   begin
      Result:=TMenuItem.Create(Menu.Owner);
      Result.AutoHotkeys:=maManual;
      Result.Caption:=FilterName.Name;
      Folders.Add(FilterName);
      FolderMenus.Add(Result);
   end;

begin
   Result:=True;
   if (Menu<>nil) and FFilterNameList.Build(FBaseDir) then begin
      Folders:=TList.Create;
      FolderMenus:=TList.Create;
      try
         Menu.Items.Clear;
         for I:=0 to Pred(FFilterNameList.Count) do begin
            if FFilterNameList[I].IsFolder then begin
               MenuItem:=NewFolder(FFilterNameList[I]);
            end
            else begin
               MenuItem:=NewItem(FFilterNameList[I], I);
            end;
            if FFilterNameList[I].Owner=nil then begin
               Menu.Items.Add(MenuItem);
               DoAddFilterMenu(MenuItem, FFilterNameList[I].IsFolder, nil);
            end
            else begin
               Ind:=Folders.IndexOf(FFilterNameList[I].Owner);
               if Ind<>-1 then begin
                  TMenuItem(FolderMenus[Ind]).Add(MenuItem);
                  DoAddFilterMenu(MenuItem, FFilterNameList[I].IsFolder, nil);
               end
               else begin
                  MenuItem.Free;
               end;
            end;
         end;
      finally
         FolderMenus.Free;
         Folders.Free;
      end;
   end;
end;

constructor TFilterInterface.Create(OperList: TOperList; SprList: TSprList);
begin
   FOnAddWhereEvent:=nil;
   FSearchDate:=0;
   FCurrentSearchDate:=0;
   FFirstDate:=0;
   FLastDate:=0;
   FSearchRange:=srCurrent;
   FCurrentSearchRange:=srCurrent;
   FDateTimeFormat:='YYYY-MM-DD';
   //--FOperList:=TOperList.Create;
   //--FSprList:=TSprList.Create;
   FOrderFields:=TStringList.Create;
   FOperList:=OperList;
   FSprList:=SprList;
   FRelList:=TRelList.Create;
   FFindFieldList:=TFindFieldList.Create;
   FIni:=nil;
   FAddWhere:='';
   FSection:='fFind';
   FAutoSave:=True;
   FRootCaption:='Лицевые счета';
   FFilter:=TFindList.Create('', '', '', False);
   FBaseDir:=ExtractFilePath(Application.ExeName)+'Filters';
   FFilterList:=TFilterList.Create;
   FFilterIsSaved:=True;
   FDateFieldName:='';
   FFieldImages:=nil;
   FGroupImageIndex:=-1;
   FRootImageIndex:=-1;
   FShowButtons:=True;
   FShowGroups:=True;
   FShowMiddleSpace:=True;
   FSprImageIndex:=-1;
   FAdminUser:=False;
   FUserRights:=[];
   FDefMonth:=1;
   FDefDay:=1;
   FSimpleAddMode:=True;
   FOnTestSQL:=nil;
   FFilterNameList:=TFilterNameList.Create;
   FGroupNameList:=TFilterNameList.Create;
   FCollapseAll:=True;
   FFirstRun:=True;
   FData:=nil;
   FOnUserOperEvent:=nil;
   FAlwaysOpen:=False;
   FDoFieldSort:=False;
   FUseYear:=False;
   FAddImageIndex:=-1;
   FImages:=TdmFindImg.Create(nil);
   FOnSelectFindValue:=nil;
   FGroupBy:=TGroupBy.Create('');
   FMainTableName:='';
   FMainTableAlias:='';
   FMainConnect:='';
   FMainTableJoin:='';
   FAliasJoin:='';
end;

destructor TFilterInterface.Destroy;
begin
   FGroupBy.Free;
   FFilterNameList.Free;
   FGroupNameList.Free;
   FFilterList.Free;
   FFindFieldList.Free;
   FRelList.Free;
   FOrderFields.Free;
   //--FOperList.Free;
   //--FSprList.Free;
   FFilter.Free;
   FImages.Free;
   inherited;
end;

function TFilterInterface.Edit: Boolean;
begin
   Result:=EditFind2(Self, FSection, FIni, FAutoSave);
   FFirstRun:=False;
end;

function TFilterInterface.EditParams(Filter: TFindList; IsTest: Boolean): Boolean;
begin
   Result:=False;
   if (Filter<>nil) and Filter.HaveParams then begin
      Filter.FillParamList;
      if EditFindParams(Self, Filter, Filter.Params, IsTest) then begin
         Result:=True;
      end;
   end;
end;

function TFilterInterface.GetCurrentSQL: string;
begin
   Result:=GetSQL(FFilter);
end;

function TFilterInterface.GetGroupImageIndex: Integer;
begin
   if (FFieldImages<>nil) and (FGroupImageIndex<FFieldImages.Count) then begin
      Result:=FGroupImageIndex;
   end
   else begin
      Result:=-1;
   end;
end;

function TFilterInterface.GetRootImageIndex: Integer;
begin
   if (FFieldImages<>nil) and (FRootImageIndex<FFieldImages.Count) then begin
      Result:=FRootImageIndex;
   end
   else begin
      Result:=-1;
   end;
end;

function TFilterInterface.GetSprImageIndex: Integer;
begin
   if (FFieldImages<>nil) and (FSprImageIndex<FFieldImages.Count) then begin
      Result:=FSprImageIndex;
   end
   else begin
      Result:=-1;
   end;
end;

procedure TFilterInterface.OnMenu2Click(Sender: TObject);
var
   FilterName: TFilterName;
   Err: string;
begin
   if (Sender<>nil) and (Sender is TComponent) then begin
      FilterName:=FFilterNameList[TComponent(Sender).Tag];
      if not FilterName.IsFolder then begin
         if not FAlwaysOpen and FilterName.EqualFileName(FFilter) then begin
            if Assigned(FOnFilterEvent) then begin
               FOnFilterEvent(Sender, FFilter);
            end;
         end
         else if FFilter.LoadFromFile(FilterName.FullFileName, Err, FFindFieldList, FOperList) then begin
            if Assigned(FOnFilterEvent) then begin
               FOnFilterEvent(Sender, FFilter);
            end;
         end;
      end;
   end;
end;

function TFilterInterface.LoadAndRunFilter(sName:String):Boolean;
var
   FilterName: TFilterName;
   Err: string;
   i:Integer;
   lOk:Boolean;
begin
  Result:=true;
  lOk:=false;
  Err:='';
  for I:=0 to Pred(FFilterNameList.Count) do begin
     if not FFilterNameList[I].IsFolder then begin
       FilterName:=FFilterNameList[I];
       if not FilterName.IsFolder then begin
         if ANSIUpperCase(FilterName.GetName)=ANSIUpperCase(sName) then begin
           lOk:=true;
           if FFilter.LoadFromFile(FilterName.FullFileName, Err, FFindFieldList, FOperList) then begin
//              FFilter.Params[i].FValue1.
              if Assigned(FOnFilterEvent) then begin
                 FOnFilterEvent(nil, FFilter);
              end;
           end else begin
             ShowMessage(Err);
           end;
         end;
       end;
     end;
   end;
   if not lOk then begin
     Err:='Не найден фильтр: "'+sName+'"';
   end;
   if (Err<>'') then begin
     Result:=false;
     ShowMessage(Err);
   end;
end;

procedure TFilterInterface.OnMenuClick(Sender: TObject);
var
   Filter: TFindList;
begin
   if (Sender<>nil) and (Sender is TComponent) then begin
      Filter:=FFilterList[TComponent(Sender).Tag];
      if not Filter.IsFolder then begin
         FFilter.Assign(Filter);
         if Assigned(FOnFilterEvent) then begin
            FOnFilterEvent(Sender, Filter);
         end;
      end;
   end;
end;

function TFilterInterface.TestErrors(Errors: TStrings): Boolean;
var
   I: Integer;
   Ind: Integer;
   Field: TFindFieldItem;
   DupField: TFindFieldItem;
   Oper: TOperItem;
   ListNames: TStringList;
begin
   Result:=False;
   if Errors<>nil then begin
      Errors.BeginUpdate;
   end;
   ListNames:=TStringList.Create;
   try
      if Errors<>nil then begin
         Errors.Clear;
      end;
      // проверяем наличие списка операций
      if (FOperList=nil) or (FOperList.Count=0) then begin
         Result:=True;
         if Errors<>nil then begin
            Errors.Add('Отсутствует или пустой список операций');
         end;
      end;
      // проверяем есть ли справочники операций в списке справочников
      for I:=0 to Pred(FOperList.Count) do begin
         Oper:=FOperList[I];
         if (Oper<>nil) and (Oper.OwnSprName<>'') and (FSprList.ByName(Oper.OwnSprName)=nil) then begin
            Result:=True;
            if Errors<>nil then begin
               Errors.Add(Format('У операции %s отсутствует справочник с именем %s', [Oper.Name, Oper.OwnSprName]));
            end;
         end;
      end;
      // проверяем наличие всех полей в списоке полей для сортировки
      for I:=0 to Pred(FOrderFields.Count) do begin
         Field:=FFindFieldList.ByPath(FOrderFields[I]);
         if Field=nil then begin
            Result:=True;
            if Errors<>nil then begin
               Errors.Add(Format('Не найдено поле из списка сортировки %s', [FOrderFields[I]]));
            end;
         end;
      end;
      // проверяем список доступных полей
      for I:=0 to Pred(FFindFieldList.Count) do begin
         Field:=FFindFieldList[I];
         if (Field<>nil) and (ffkList in Field.Kinds) then begin
            ListNames.Add(Field.Caption);
         end;
         // проверка ошибок инициализации поля
         if Field.TestErrors(Errors) then begin
            Result:=True;
         end;
         // 1. проверка отношений: все отношения указанные в списке полей, должны
         //       находиться в списке отношений
         if (Field<>nil) and (Field.RelName<>'') and (FRelList.ByName(Field.RelName)=nil) then begin
            Result:=True;
            if Errors<>nil then begin
               Errors.Add(Format('Не найдено отношение "%s". Поле: %s - "%s"', [Field.Name, Field.Caption, Field.RelName]));
            end;
         end;
         // 2. проверка справочников: все справочники указанные в списке полей, должны
         //       находиться в списке справочников
         if (Field<>nil) and (Field.SprName<>'') and (FSprList.ByName(Field.SprName)=nil) then begin
            Result:=True;
            if Errors<>nil then begin
               Errors.Add(Format('Не найден справочник "%s". Поле: %s - "%s"', [Field.SprName, Field.Name, Field.Caption]));
            end;
         end;
         // 3. проверка главного поля (хозяина): поле хозяин должно быть в списке
         //       и это поле должно встретиться раньше чем подчиненное поле
         //       не должно быть ссылок на самого себя
         if (Field<>nil) and (Field.Owner<>nil) then begin
            Ind:=FFindFieldList.GetIndex(Field.Owner);
            if Ind=-1 then begin
               Result:=True;
               if Errors<>nil then begin
                  Errors.Add(Format('Не найдено главное поле %s - "%s" для %s - "%s"', [Field.Owner.Name, Field.Owner.Caption, Field.Name, Field.Caption]));
               end;
            end
            else if Ind=I then begin
               Result:=True;
               if Errors<>nil then begin
                  Errors.Add(Format('Поле %s - "%s" ссылается само на себя', [Field.Name, Field.Caption]));
               end;
            end
            else if Ind>I then begin
               Result:=True;
               if Errors<>nil then begin
                  Errors.Add(Format('Главное поле %s - "%s" встретилось позже чем подчиненное %s - "%s"', [Field.Owner.Name, Field.Owner.Caption, Field.Name, Field.Caption]));
               end;
            end;
         end;
         // 4. проверка наличия всех операций по умолчанию в списке операций
         if (Field<>nil) and (Field.DefaultOp<>'') and (FOperList.ByName(Field.DefaultOp)=nil) then begin
            Result:=True;
            if Errors<>nil then begin
               Errors.Add(Format('Не найдена операция %s у поля %s - "%s"', [Field.DefaultOp, Field.Name, Field.Caption]));
            end;
         end;
         // 5. проверка сдвоенных имен полей
         if Field<>nil then begin
            // проверка по Name
            DupField:=FFindFieldList.ByPath(Field.Path);
            if DupField<>Field then begin
               Result:=True;
               if Errors<>nil then begin
                  Errors.Add(Format('Найдены сдвоенные имена полей - "%s", "%s", "%s"', [Field.Path, Field.Caption, DupField.Caption]));
               end;
            end;
            // проверка по RealName
            DupField:=FFindFieldList.ByRealName(Field.Owner, Field.Alias, Field.RealName);
            //[2010.06.02] если сравниваются два свойства, то имена могут совпадать
            //--if DupField<>Field then begin
            if (DupField<>Field) and not (ffkProp in Field.Kinds) and not (ffkProp in DupField.Kinds) then begin
            //\\
               Result:=True;
               if Errors<>nil then begin
                  Errors.Add(Format('Найдены сдвоенные имена полей - %s.%s as %s ("%s") и %s.%s as %s ("%s")', [Field.Alias, Field.RealName, Field.Name, Field.Caption, DupField.Alias, DupField.RealName, DupField.Name, DupField.Caption]));
               end;
            end;
         end;
         // 6. проверяем стоят ли правильно типы у полей
         if (Field<>nil) and not (ffkList in Field.Kinds) and (Field.RelName<>'') and not (ffkRel in Field.Kinds) and not (ffkProp in Field.Kinds) then begin
            Result:=True;
            if Errors<>nil then begin
               Errors.Add(Format('Ошибка в типе поля %s. Есть ссылка на отношения, но тип нет одного из типов ffkList, ffkRel, ffkProp', [Field.Name]));
            end;
         end;
         // 6.1. проверяем что бы тип ffkFTS стоял только у текстовго поля
         if (Field<>nil) and (ffkFTS in Field.Kinds) and not ((ffkString in Field.Kinds) or (ffkText in Field.Kinds)) then begin
            Result:=True;
            if Errors<>nil then begin
               Errors.Add(Format('Ошибка в типе поля %s. Поле не является строковым, хотя указан полнотекстовый поиск', [Field.Name]));
            end;
         end;
         // 6.2. проверяем что бы тип ffkStamp стоял только у поля с типом даты    add 26.10.2018 vadim
         if (Field<>nil) and (ffkStamp in Field.Kinds) and not (ffkDate in Field.Kinds) then begin
            Result:=True;
            if Errors<>nil then begin
               Errors.Add(Format('Ошибка в типе поля %s. Поле не является датой, хотя указано наличие времени ', [Field.Name]));
            end;
         end;
         // 7. проверяем стоят ли тип справочник
         if (Field<>nil) and (Field.SprName<>'') and not (ffkSpr in Field.Kinds) then begin
            Result:=True;
            if Errors<>nil then begin
               Errors.Add(Format('Ошибка в типе поля %s. Есть ссылка на справочник, но тип нет типа ffkSpr', [Field.Name]));
            end;
         end;
      end;
      // 8. проверка сдвоенных имен операций
      for I:=0 to Pred(FOperList.Count) do begin
         if FOperList.ByName(FOperList[I].Name)<>FOperList[I] then begin
            Result:=True;
            if Errors<>nil then begin
               Errors.Add(Format('Найдены сдвоенные имена операций %s', [FOperList[I].Name]));
            end;
         end;
      end;
      // 9. проверка сдвоенных имен отношений
      for I:=0 to Pred(FRelList.Count) do begin
         if FRelList.ByName(FRelList[I].Name)<>FRelList[I] then begin
            Result:=True;
            if Errors<>nil then begin
               Errors.Add(Format('Найдены сдвоенные имена отношений %s', [FRelList[I].Name]));
            end;
         end;
      end;
      // 10. проверка сдвоенных имен справочников
      for I:=0 to Pred(FSprList.Count) do begin
         if FSprList.ByName(FSprList[I].Name)<>FSprList[I] then begin
            Result:=True;
            if Errors<>nil then begin
               Errors.Add(Format('Найдены сдвоенные имена справочников %s', [FSprList[I].Name]));
            end;
         end;
      end;
      // 11. названия групп и названия списков должны быть разными
      for I:=0 to Pred(FFindFieldList.Count) do begin
         Field:=FFindFieldList[I];
         if (Field<>nil) and (Field.Group<>'') and (ListNames.IndexOf(Field.Group)<>-1) then begin
            Result:=True;
            if Errors<>nil then begin
               Errors.Add(Format('Найдены сдвоенные имена списков и групп - %s', [Field.Group]));
            end;
         end;
      end;
   finally
      ListNames.Free;
      if Errors<>nil then begin
         Errors.EndUpdate;
      end;
   end;
end;

function TFilterInterface.BuildFilterMenu2(Menu: TTBSubMenuItem; OnClick: TNotifyEvent): Boolean;
var
   I: Integer;
   Ind: Integer;
   Item: TTBCustomItem;
   Folders: TList;
   FolderMenus: TList;

   function NewItem(FilterName: TFilterName; Tag: Integer): TTBItem;
   begin
      Result:=TTBItem.Create(Menu.Owner);
      Result.Tag:=Tag;
      Result.Caption:=FilterName.Name;
      if Assigned(OnClick) then begin
         Result.OnClick:=OnClick;
      end
      else begin
         Result.OnClick:=OnMenu2Click;
      end;
   end;

   function NewFolder(FilterName: TFilterName): TTBSubMenuItem;
   begin
      Result:=TTBSubMenuItem.Create(Menu.Owner);
      Result.Caption:=FilterName.Name;
      Folders.Add(FilterName);
      FolderMenus.Add(Result);
   end;

begin
   Result:=True;
   if (Menu<>nil) and FFilterNameList.Build(FBaseDir) then begin
      Folders:=TList.Create;
      FolderMenus:=TList.Create;
      try
         Menu.Clear;
         for I:=0 to Pred(FFilterNameList.Count) do begin
            if FFilterNameList[I].IsFolder then begin
               Item:=NewFolder(FFilterNameList[I]);
            end
            else begin
               Item:=NewItem(FFilterNameList[I], I);
            end;
            if FFilterNameList[I].Owner=nil then begin
               Menu.Add(Item);
               DoAddFilterMenu(Item, FFilterNameList[I].IsFolder, nil);
            end
            else begin
               Ind:=Folders.IndexOf(FFilterNameList[I].Owner);
               if Ind<>-1 then begin
                  TTBSubMenuItem(FolderMenus[Ind]).Add(Item);
                  DoAddFilterMenu(Item, FFilterNameList[I].IsFolder, nil);
               end
               else begin
                  Item.Free;
               end;
            end;
         end;
         //Menu.DropdownCombo:=Menu.Count<>0;
      finally
         FolderMenus.Free;
         Folders.Free;
      end;
   end;
end;

function TFilterInterface.BuildGroupMenu2(Menu: TTBSubMenuItem; OnClick: TNotifyEvent): Boolean;
var
   I: Integer;
   Ind: Integer;
   Item: TTBCustomItem;
   Folders: TList;
   FolderMenus: TList;

   function NewItem(FilterName: TFilterName; Tag: Integer): TTBItem;
   begin
      Result:=TTBItem.Create(Menu.Owner);
      Result.Tag:=Tag;
      Result.Caption:=FilterName.Name;
      if Assigned(OnClick) then begin
         Result.OnClick:=OnClick;
      end
      else begin
         Result.OnClick:=OnMenu2Click_Group;
      end;
   end;

   function NewFolder(FilterName: TFilterName): TTBSubMenuItem;
   begin
      Result:=TTBSubMenuItem.Create(Menu.Owner);
      Result.Caption:=FilterName.Name;
      Folders.Add(FilterName);
      FolderMenus.Add(Result);
   end;

begin
   Result:=True;
   if (Menu<>nil)
     then Menu.Clear;
   if (Menu<>nil) and FGroupNameList.Build( GroupDir ) then begin
      Folders:=TList.Create;
      FolderMenus:=TList.Create;
      try
         for I:=0 to Pred(FGroupNameList.Count) do begin
            if FGroupNameList[I].IsFolder then begin
               Item:=NewFolder(FGroupNameList[I]);
            end
            else begin
               Item:=NewItem(FGroupNameList[I], I);
            end;
            if FGroupNameList[I].Owner=nil then begin
               Menu.Add(Item);
               DoAddFilterMenu(Item, FGroupNameList[I].IsFolder, nil);
            end
            else begin
               Ind:=Folders.IndexOf(FGroupNameList[I].Owner);
               if Ind<>-1 then begin
                  TTBSubMenuItem(FolderMenus[Ind]).Add(Item);
                  DoAddFilterMenu(Item, FGroupNameList[I].IsFolder, nil);
               end
               else begin
                  Item.Free;
               end;
            end;
         end;
         //Menu.DropdownCombo:=Menu.Count<>0;
      finally
         FolderMenus.Free;
         Folders.Free;
      end;

   end;
   if (Menu<>nil)
     then Menu.Visible:=Menu.Count>0;
end;
procedure TFilterInterface.OnMenu2Click_Group(Sender: TObject);
var
   GroupName: TFilterName;
   Err: string;
begin
   if (Sender<>nil) and (Sender is TComponent) then begin
      GroupName:=FGroupNameList[TComponent(Sender).Tag];
      if not GroupName.IsFolder then begin
         RunGroupBy(GroupName.FullFileName, false);
         {
         if not FAlwaysOpen and FilterName.EqualFileName(FFilter) then begin
            if Assigned(FOnFilterEvent) then begin
               FOnFilterEvent(Sender, FFilter);
            end;
         end
         else if FFilter.LoadFromFile(FilterName.FullFileName, Err, FFindFieldList, FOperList) then begin
            if Assigned(FOnFilterEvent) then begin
               FOnFilterEvent(Sender, FFilter);
            end;
         end;
         }
      end;
   end;
end;

function TFilterInterface.LoadFieldList(FileName: string): Boolean;
begin
   Result:=False;
   if (FileName<>'') and FileExists(FileName) then begin
      Result:=FFindFieldList.LoadFromFile(FileName);
      if not Result then begin
         FFindFieldList.Clear;
      end;
   end;
end;

function TFilterInterface.SaveFieldList(FileName: string): Boolean;
begin
   Result:=False;
   if FileName<>'' then begin
      Result:=FFindFieldList.SaveToFile(FileName);
   end;
end;

function TFilterInterface.GetCurrentOrderBy: string;
begin
   Result:=GetOrderBy(FFilter);
end;

function TFilterInterface.GetOrderBy(Filter: TFindList): string;
var
   I: Integer;
   Field: TFindFieldItem;
   OrderItem: TOrderItem;
   S: string;
begin
   Result:='';
   if Filter<>nil then begin
      for I:=0 to Pred(Filter.OrderList.Count) do begin
         OrderItem:=Filter.OrderList[I];
         Field:=FFindFieldList.ByPath(OrderItem.FieldPath);
         if Field<>nil then begin
            if Field.Alias='*' then begin
               S:=Format('%s%s', [Field.RealName, CMapDirection[OrderItem.Direction]]);
            end
            else begin
               S:=Format('%s.%s%s', [Field.Alias, Field.RealName, CMapDirection[OrderItem.Direction]]);
            end;
            if Result='' then begin
               Result:=S;
            end
            else begin
               Result:=Result+', '+S;
            end;
         end;
      end;
   end;
end;

function TFilterInterface.GetValueKind(Oper: TOperItem; Field: TFindFieldItem): TFindValueKind;
begin
   Result:=valNone;
   if (Oper<>nil) and Oper.OwnValue then begin
      Result:=Oper.OwnValKind;
   end
   else if ffkString in Field.Kinds then begin
      Result:=valString;
   end
   else if ffkText in Field.Kinds then begin
      Result:=valString;
   end
   else if ffkNumber in Field.Kinds then begin
      Result:=valNumber;
   end;
end;

function TFilterInterface.GetValueSpr(Oper: TOperItem; Field: TFindFieldItem): TSprItem;
begin
   Result:=nil;
   if (Oper<>nil) and Oper.OwnValue and (Oper.OwnSprName<>'') then begin
      Result:=FSprList.ByName(Oper.OwnSprName);
   end
   else begin
      if Field.IsSpr then begin
         Result:=FSprList.ByName(Field.SprName);
      end;
   end;
end;

function TFilterInterface.GetEditKind(Oper: TOperItem; Field: TFindFieldItem; DatePart: TDateKind): TFieldEditKind;
begin
   if (Oper<>nil) and Oper.OwnValue then begin
      Result:=Oper.GetEditKind(FSprList);
   end
   else begin
      Result:=Field.GetEditKind(FSprList, DatePart);
   end;
end;
//--------------------------------------------
function TFilterInterface.CheckAlias(Field: TFindFieldItem):Boolean;
begin
  if (Field<>nil) and ((Field.Alias=MainTableAlias) or (Pos(','+Field.Alias+',', ','+AliasJoin+',')>0)) then begin
    Result:=true;
  end else begin
    Result:=false;
  end;
end;
//--------------------------------------------
function TFilterInterface.GetCurrentOrderByName: string;
begin
   Result:=GetOrderByName(FFilter);
end;

function TFilterInterface.GetOrderByName(Filter: TFindList): string;
var
   I: Integer;
   Field: TFindFieldItem;
   OrderItem: TOrderItem;
   S: string;
begin
   Result:='';
   if Filter<>nil then begin
      for I:=0 to Pred(Filter.OrderList.Count) do begin
         OrderItem:=Filter.OrderList[I];
         Field:=FFindFieldList.ByPath(OrderItem.FieldPath);
         if Field<>nil then begin
            S:=Field.AddCaption;
            if Result='' then begin
               Result:=S;
            end
            else begin
               Result:=Result+', '+S;
            end;
         end;
      end;
   end;
end;

function TFilterInterface.EditOrderBy(Filter: TFindList): Boolean;
begin
   Result:=False;
   if Filter<>nil then begin
      Result:=SetOrderBy(Self, Filter.OrderList);
   end;
end;

function TFilterInterface.EditCurrentOrderBy: Boolean;
begin
   Result:=EditOrderBy(FFilter);
end;

function TFilterInterface.GetAddImageIndex: Integer;
begin
   if FAddImageIndex=-1 then begin
      FAddImageIndex:=0;
      // устанавливаем список картинок пользователя (если есть)
      if FFieldImages<>nil then begin
         FAddImageIndex:=FImages.imFields.Count;
         FImages.imFields.AddImages(FFieldImages);
      end;
   end;
   Result:=FAddImageIndex;
end;

function TFilterInterface.GetImageIndex(Field: TFindFieldItem): Integer;
begin
   Result:=-1;
   // определяем иконку для поля
   if (Field.ImageIndex<>-1) and (FFieldImages<>nil) then begin
      Result:=GetAddImageIndex+Field.ImageIndex;
   end
   else begin
      if ffkSpr in Field.Kinds then begin
         if FSprImageIndex<>-1 then begin
            Result:=GetAddImageIndex+FSprImageIndex;
         end
         else begin
            Result:=II_Spr;
         end;
      end
      else if ffkString in Field.Kinds then Result:=II_String
      else if ffkText in Field.Kinds then Result:=II_Text
      else if ffkNumber in Field.Kinds then Result:=II_Number
      else if ffkFloat in Field.Kinds then Result:=II_Float
      else if ffkBoolean in Field.Kinds then Result:=II_Bool
      else if ffkDate in Field.Kinds then Result:=II_Date
      else if ffkList in Field.Kinds then Result:=II_Table;
   end;
end;

function TFilterInterface.SelectFindValue(Spr: TSprItem; var Value, ValCaption: string): Boolean;
begin
   if Assigned(FOnSelectFindValue) then begin
      Result:=FOnSelectFindValue(Spr, FIni, FSection, FAutoSave, Value, ValCaption);
   end
   else begin
      Result:=fFindSel.SelectFindValue(Spr, FIni, FSection, FAutoSave, Value, ValCaption);
   end;
end;

procedure TFilterInterface.DoAddFilterMenu(Menu: TObject; IsFolder: Boolean; Filter: TFindList);
begin
   if Assigned(FOnAddFilterMenu) then begin
      FOnAddFilterMenu(Menu, IsFolder, Filter);
   end;
end;

procedure TFilterInterface.SetAdminUser(Value: Boolean);
begin
   if Value then begin
      FUserRights:=FUserRights+[urTestSQL, urTestError, urFieldTree, urDesigner];
   end
   else begin
      FUserRights:=FUserRights-[urTestSQL, urTestError, urFieldTree, urDesigner];
   end;
   FAdminUser:=Value;
end;

function TFilterInterface.EditGroupBy(Filter: TFindList; GroupBy: TGroupBy; IsFiltered: Boolean; sName:String): Boolean;
begin
   Result:=False;
   if SetGroupBy(Self, Filter, GroupBy, IsFiltered, sName) then begin
      ShowGroupBy(Self, Filter, GroupBy, IsFiltered);
      Result:=True;
   end;
end;

function TFilterInterface.EditCurrentGroupBy(IsFiltered: Boolean): Boolean;
begin
   Result:=EditGroupBy(FFilter, FGroupBy, IsFiltered, '');
end;

function TFilterInterface.RunGroupBy(sName:String; IsFiltered: Boolean): Boolean;
begin
   Result:=EditGroupBy(FFilter, FGroupBy, IsFiltered, sName);
end;

function TFilterInterface.GroupDir:String;
begin
   Result:=StringReplace(FBaseDir, '\Filters\', '\Group\', []);   // !!! vadim 05.12.2017
end;

function TFilterInterface.ShowFieldGroupBy(FieldName: string; IsFiltered: Boolean; Width: Integer): Boolean;
var
   Field: TFindFieldItem;
   DateKind: TDateKind;
   GroupItem: TGroupItem;
   n:Integer;
begin
   Result:=False;
   DateKind:=dkFull;            

   Field:=FindFieldList.ByRealName(nil, FieldName);
   if (Field=nil) and (Copy(FieldName,1,4)='FLD_') then begin  // vadim!!!  01.12.2017
     n:=FindFieldList.ByName(nil, FieldName);
     if n>-1
       then Field:=FindFieldList.GetItem(n);
   end;
   // vadim!!!    01.12.2017
   if (Field<>nil) and CheckAlias(Field) and (not Field.NotGroupBy) and not (ffkText in Field.Kinds) and ((not (ffkDate in Field.Kinds)) or GetDateKind(DateKind)) then begin
//  было if (Field<>nil) and (Field.Alias=FMainTableAlias) and (not Field.NotGroupBy) and not (ffkText in Field.Kinds) and ((not (ffkDate in Field.Kinds)) or GetDateKind(DateKind)) then begin
      FGroupBy.Clear;
      FGroupBy.ColumnList.AddNew('Всего', True, True, '', -1);
      GroupItem:=FGroupBy.GroupList.AddNew(Field.Caption, Field.Path, True, Width);
      GroupItem.DateKind:=DateKind;
      ShowGroupBy(Self, Filter, GroupBy, IsFiltered);
   end;
end;

function TFilterInterface.GetYearWhere(rSearchRange: TSearchRange; dSearchDate: TDateTime): string;
begin
   Result:='';
   if FUseYear then begin
      case rSearchRange of
         // текущее состояние
         srCurrent: begin
            // !!! SearchDate:=0;
            Result:=Format('%s=''%s''', [FDateFieldName, FormatDateTime(FDateTimeFormat, 0)]); // !!!dSearchDate)]);
         end;
         // за все года
         srAllYear: begin
            Result:='';
         end;
         // за определенный год
         srYear: begin
            Result:=Format('%s=''%s''', [FDateFieldName, FormatDateTime(FDateTimeFormat, IncMonth(dSearchDate, 12))]);
         end;
         // между двумя годами (включая их)
         srYearBetween: begin
            Result:=Format('%s>=''%s'' AND %s<=''%s''', [FDateFieldName, FormatDateTime(FDateTimeFormat, IncMonth(FFirstDate, 12)), FDateFieldName, FormatDateTime(FDateTimeFormat, IncMonth(FLastDate, 12))]);
         end;
      end;
   end;
end;
//--------------------------------
function TFilterInterface.IsAddDateFiks(sSQL:String): boolean;
//var
//  n:Integer;
begin
  Result:=true;
//  n:=1; //Pos('WHERE ', sSQL);
//  if n>0 then begin
//    if PosEx(UpperCase(FDateFieldName), sSQL, n)=0
//      then Result:=true;
//  end;
end;
//--------------------------------
function TFilterInterface.GetSQL(Filter: TFindList; lPlusAddWhere:Boolean): string;
var
   SQL: TStringList;
   YearWhere: string;
begin
   Result:='';
   SQL:=TStringList.Create;
   try
      if Filter.HaveParams then begin
         if not EditParams(Filter, False) then begin
            Exit;
         end;
      end;
      if Filter.GetSQL(SQL, Self) then begin
         FAddWhere:='';
         if lPlusAddWhere and Assigned(FOnAddWhereEvent) then begin
           FOnAddWhereEvent(Self,SQL);     // событие должно заполнить переменную  FAddWhere   vadim
         end;
         if FAddWhere='' then begin    // !!!  vadim
           Result:=SQL.Text;
         end else begin
           if SQL.Text=''
             then Result:=FAddWhere
             else Result:='('+SQL.Text+')' +' and ('+FAddWhere+')';
         end;
         if Result='' then begin
           Exit;
         end;
//         if FUseYear  then begin   // было vadim
         if FUseYear and IsAddDateFiks(UpperCase(Result)) then begin
            YearWhere:=GetYearWhere(FCurrentSearchRange, FCurrentSearchDate);
            if YearWhere<>'' then begin
               Result:=Format('%s AND ( %s )', [YearWhere, Result]);
            end;
         end;
      end;
   finally
      SQL.Free;
   end;
end;
//--------------------------------
function TFilterInterface.GetSQL2(Filter: TFindList; IsFiltered: Boolean; lPlusAddWhere:Boolean): string;
var
   SR: TSearchRange;
   SD: TDateTime;
   SQL: TStringList;
   YearWhere: string;
begin
   Result:='';
   SQL:=TStringList.Create;
   try
      if IsFiltered then begin
         // !!! повторный запрос параметров скорее всего не нужен
         if Filter.HaveParams then begin
            if not EditParams(Filter, False) then begin
               Exit;
            end;
         end;
      end;
      if (not IsFiltered) or Filter.GetSQL(SQL, Self) then begin
         //!!!Result:='';  vadim
         if SQL.Text<>'' then begin
           //!!!Result:=Format('(%s)', [SQL.Text]);   vadim
           SR:=FCurrentSearchRange;
           SD:=FCurrentSearchDate;
         end else begin
           SR:=FSearchRange;
           SD:=FSearchDate;
         end;
         FAddWhere:='';
         if lPlusAddWhere and Assigned(FOnAddWhereEvent) then begin
           FOnAddWhereEvent(Self,SQL);   // событие должно заполнить переменную  FAddWhere   vadim
         end;
         if SQL.Text<>''   // vadim
           then Result:=Format('(%s)', [SQL.Text])
           else Result:='';
         if FAddWhere<>'' then begin // !!!  vadim
           if Result<>'' then begin
             Result:=Format('%s AND %s', [FAddWhere, Result]);
           end else begin
             Result:=FAddWhere;
           end;
         end;
//         if FUseYear then begin    было  vadim
         if FUseYear and IsAddDateFiks(UpperCase(Result)) then begin
            YearWhere:=GetYearWhere(SR, SD);
            if YearWhere<>'' then begin
              if Result<>'' then begin
                Result:=Format('%s AND %s', [YearWhere, Result]);
              end else begin
                Result:=YearWhere;
              end;
            end;
         end;
      end;
   finally
      SQL.Free;
   end;
end;

procedure TFilterInterface.SetSearchDate(const Value: TDateTime);
begin
   FSearchDate:=Value;
   FCurrentSearchDate:=Value;
end;

procedure TFilterInterface.SetSearchRange(const Value: TSearchRange);
begin
    FSearchRange:=Value;
    FCurrentSearchRange:=Value;
end;

{ TFindItem }

procedure TFindItem.Assign(Find: TFindItem);
begin
   if Find<>Self then begin
      FId:=Find.Id;
      FField:=Find.Field;
      FOper:=Find.Oper;
      FValue1.Assign(Find.Value1);
      FValue2.Assign(Find.Value2);
      FOperVal.Assign(Find.OperVal);
      FKinds:=Find.Kinds;
      FIgnoreCase:=Find.IgnoreCase;
      FIsParam:=Find.IsParam;
      FNeedValue:=Find.NeedValue;
      FDatePart:=Find.DatePart;
      FPar.Assign(Find.Par);
   end;
end;

class function TFindItem.BuildCaption(Field: TFindFieldItem; OperItem: TOperItem; RelItem: TRelItem; Value1, Value2, OperVal: TFindValue; DoUpper, IsParam, NeedValue: Boolean; DatePart: TDateKind): string;
var
   Param: string;
   Name: string;
   ValCaption: string;
   DatePartName: string;
begin
   Param:='';
   if IsParam then begin
      Param:=' (параметр)';
   end;
   if (Field<>nil) and (OperItem<>nil) then begin
      if ffkList in Field.Kinds then begin
         Name:='';
         if (RelItem<>nil) and (RelItem.Kind in [rk1M, rkMM]) then begin
            Name:='список';
         end;
      end
      else begin
         Name:='реквизит';
      end;
      //++ поддержка поиска по части даты
      DatePartName:='';
      if (ffkDate in Field.Kinds) and (DatePart<>dkFull) then begin
         if ffkAge in Field.Kinds
           then DatePartName:=' '+CDateKindName[DatePart]
           else DatePartName:=' '+CDateKindName2[DatePart];
      end;  
      //\\                              
      if OperItem.NeedValue then begin
         if OperItem.OwnValue then begin
            ValCaption:=OperVal.GetCaption(DoUpper);
         end
         else begin
            ValCaption:=Value1.GetCaption(DoUpper);
         end;
         if OperItem.TwoValue then begin
            Result:=Format('%s "%s"%s %s %s%s и %s', [Name, Field.AddCaption, DatePartName, OperItem.Caption, ValCaption, Param, Value2.GetCaption(DoUpper)]);
         end
         else begin
            Result:=Format('%s "%s"%s %s %s', [Name, Field.AddCaption, DatePartName, OperItem.Caption, ValCaption]);
         end;
         //++ поддержка поиска возраста на дату
         if (ffkDate in Field.Kinds) and (DatePart=dkAge) then begin
            Result:=Result+' на дату '+OperVal.GetCaption(DoUpper);
         end;
         //\\
         Result:=Result+Param;
      end
      else begin
         Result:=Format('%s "%s"%s %s', [Name, Field.AddCaption, DatePartName, OperItem.Caption]);
      end;
   end;
end;

procedure TFindItem.Change(Field: TFindFieldItem; Oper: TOperItem; Value1, Value2, OperVal: TFindValue; Kind: TFindItemKind; IgnoreCase, IsParam, NeedValue: Boolean; DatePart: TDateKind);
begin
   FField:=Field;
   FOper:=Oper;
   if Value1<>nil then begin
      FValue1.Assign(Value1);
   end;
   if Value2<>nil then begin
      FValue2.Assign(Value2);
   end;
   if OperVal<>nil then begin
      FOperVal.Assign(OperVal);
   end;
   FIgnoreCase:=IgnoreCase;
   FIsParam:=IsParam;
   FNeedValue:=NeedValue;
   FDatePart:=DatePart;
   FKinds:=FKinds-[fikOr, fikAnd]+[Kind];
end;

function TFindItem.Clone: TFindItem;
begin
   Result:=TFindItem.Create(nil, nil, nil, nil, nil, [], False, False, True, dkFull);
   Result.Assign(Self);
end;

constructor TFindItem.Create(Field: TFindFieldItem; Oper: TOperItem; Value1, Value2, OperVal: TFindValue; Kinds: TFindItemKinds; IgnoreCase, IsParam, NeedValue: Boolean; DatePart: TDateKind);
begin
   FId:=-1;
   FField:=Field;
   FOper:=Oper;
   FKinds:=Kinds;
   FIgnoreCase:=IgnoreCase;
   FPar:=TFindList.Create('', '', '', False);
   FValue1:=TFindValue.Create;
   FValue2:=TFindValue.Create;
   FOperVal:=TFindValue.Create;
   if Value1<>nil then begin
      FValue1.Assign(Value1);
   end;
   if Value2<>nil then begin
      FValue2.Assign(Value2);
   end;
   if OperVal<>nil then begin
      FOperVal.Assign(OperVal);
   end;
   FIsParam:=IsParam;
   FNeedValue:=NeedValue;
   FDatePart:=DatePart;
end;

procedure TFindItem.Delete;
begin
   if Owner<>nil then begin
      Owner.Delete(Self);
   end
   else begin
      Free;
   end;
end;

procedure TFindItem.DeletePar;
begin
   if Owner<>nil then begin
      Owner.DeletePar(Self);
   end
   else begin
      Free;
   end;
end;

destructor TFindItem.Destroy;
begin
   FPar.Free;
   FValue1.Free;
   FValue2.Free;
   FOperVal.Free;
   inherited;
end;

function TFindItem.GetCaption(FilterInterface: TFilterInterface): string;
begin
   if FField<>nil then begin
      if (fikPar in Kinds) and not (ffkList in FField.Kinds) then begin
         Result:='';
      end
      else begin
         Result:=BuildCaption(FField, FOper, FilterInterface.RelList.ByName(FField.RelName), FValue1, FValue2, FOperVal, FIgnoreCase, FIsParam, FNeedValue, FDatePart);
      end;
   end
   else begin
      Result:='';
   end;
end;

function TFindItem.GetSQL(SQL: TStrings; Blank: Boolean; FilterInterface: TFilterInterface): Boolean;
const
   DCh='^$^';
   DLen=3;
var
   DPos: Integer;
   S: string;
   FieldFullName: string;
   LastPos: Integer;
   BlankPos: Integer;
   I: Integer;
   Value1: string;
   Value2: string;
   OperVal: string;
   RelItem: TRelItem;
   DoValUpper: Boolean;
   SQLPos: Integer;
   TrueS: string;
   FalseS: string;
   TempS: string;
   sl: TStringList;
begin
   if (FField<>nil) and not (ffkList in FField.Kinds) and (FOper<>nil) and FOper.NeedValue and ((FOper.OwnValue and FOperVal.IsNull) or (not FOper.OwnValue and FValue1.IsNull)) then begin
      Result:=True;
      Exit;
   end;                
   //                             
   LastPos:=SQL.Count;
   BlankPos:=-1;
   // проверяем, надо ли связывать с предыдущим условием
   if not (fikFirst in FKinds) and not Blank then begin
      if fikAnd in FKinds then begin
         SQL.Add(' AND ');
      end
      else if fikOr in FKinds then begin
         SQL.Add(' OR ');
      end;
      BlankPos:=SQL.Count;
   end;
   // определяем значения для "истина" и "ложь"
   TrueS:='True';
   FalseS:='False';
   if (FField<>nil) and (ffkProp in FField.Kinds) then begin
      TrueS:='1';
      FalseS:='0';
   end;
   //
   RelItem:=nil;
   if (FField<>nil) and (FField.RelName<>'') then begin
      RelItem:=FilterInterface.RelList.ByName(FField.RelName);
   end;
   // получаем значения
   Value1:=FValue1.GetText(False, FilterInterface.DateTimeFormat, TrueS, FalseS);
   Value2:=FValue2.GetText(False, FilterInterface.DateTimeFormat, TrueS, FalseS);
   OperVal:=FOperVal.GetText(False, FilterInterface.DateTimeFormat, TrueS, FalseS);
   // проверяем, надо ли привести к верхнему регистру значение условия для поиска
   DoValUpper:=((FField<>nil) and FField.IsUpper) or FIgnoreCase;
   if DoValUpper then begin
      Value1:=AnsiUpperCase(Value1);
      Value2:=AnsiUpperCase(Value2);
      OperVal:=AnsiUpperCase(Value2);
   end;
   // обрабатываем значение условия, если операция и поле поддерживают полнотекстовый поиск
   if (FField<>nil) and (ffkFTS in FField.Kinds) and (FOper<>nil) and (ffkFTS in FOper.FieldKinds) then begin
      sl:=TStringList.Create;
      try
         TempS:='';
         for I:=1 to Length(Value1) do begin
            case Value1[I] of
               '+': TempS:=TempS+' and ';
               '-': TempS:=TempS+' and not ';
               ',': begin
                  sl.Add(TempS);
                  TempS:='';
               end;
            else
               TempS:=TempS+Value1[I];
            end;
         end;
         sl.Add(TempS);
         Value1:='';
         for I:=0 to Pred(sl.Count) do begin
            TempS:=Trim(sl[I]);
            if TempS<>'' then begin
               if Value1<>'' then begin
                  Value1:=Format('(%s) or (%s)', [Value1, TempS]);
               end
               else begin
                  Value1:=TempS;
               end;
            end;
         end;
      finally
         sl.Free;
      end;
   end;
   // добавляем в запрос условие для списка
   DPos:=-1;
   if (FField<>nil) and (ffkList in FField.Kinds) then begin
      if RelItem=nil then begin
         Result:=False;
         Exit;
      end;
      if (FOper.SQL='') and Assigned(FilterInterface.OnUserOperEvent) then begin
         S:=''
      end
      else begin
         S:=Format(FOper.SQL, [FField.FullName, FField.Alias, RelItem.Where, RelItem.GroupBy, Value1, Value2]);
      end;
      if Assigned(FilterInterface.OnUserOperEvent) then begin
         FilterInterface.OnUserOperEvent(FOper, FField, RelItem, FField.FullName, Value1, Value2, OperVal, S);
      end;
      // ищем разделить для операций применимых к спискам (что бы дальнейшии операции вставлять внутри)
      DPos:=Pos(DCh, S);
      if DPos<>0 then begin
         SQL.Add(Copy(S, 1, Pred(DPos)));
      end
      else begin
         SQL.Add(S);
      end;
   end;
   // проверяем для списков: есть ли у них дополнительные условия и если есть,
   // то добавляем их
   if (FPar.Count>0) and ((FField=nil) or not (ffkList in FField.Kinds) or ((ffkList in FField.Kinds) and (DPos<>0))) then begin
      if (FField<>nil) and (ffkList in FField.Kinds) then begin
         SQL.Add('AND (');
      end
      else begin
         SQL.Add('(');
      end;
      SQLPos:=SQL.Count;
      FPar.GetSQL(SQL, FilterInterface);
      if SQL.Count=SQLPos then begin
         SQL.Delete(Pred(SQLPos));
      end
      else begin
         SQL.Add(')');
      end;
   end;
   // добавляем условие для обычных полей
   if (FOper<>nil) and (FField<>nil) and not (ffkList in Field.Kinds) then begin
      FieldFullName:=FField.FullName;
      //++ поддержка поиска по части даты
      if ffkDate in Field.Kinds then begin
         case FDatePart of
            dkYear: FieldFullName:=Format('Year(%s)', [FieldFullName]);
            dkMonth: FieldFullName:=Format('Month(%s)', [FieldFullName]);
            dkDayOfMonth: FieldFullName:=Format('DayOfMonth(%s)', [FieldFullName]);
            //--dkCurrentAge: FieldFullName:=Format('TIMESTAMPDIFF(SQL_TSI_YEAR, %0:s, CURDATE())-CASE WHEN DAYOFYEAR(CURDATE())-DAYOFYEAR(%0:s)>0 THEN 0 ELSE 1 END', [FieldFullName]);
            dkCurrentAge: FieldFullName:=Format('TRUNCATE(TIMESTAMPDIFF(SQL_TSI_MONTH, %0:s, CURDATE())/12,0)-IIF(MONTH(%0:s)=MONTH(CURDATE()), IIF(DAYOFMONTH(%0:s)-DAYOFMONTH(CURDATE())>0, 1, 0), 0)', [FieldFullName]);
            //--dkAge: FieldFullName:=Format('TIMESTAMPDIFF(SQL_TSI_YEAR, %0:s, ''%1:s'')-CASE WHEN DAYOFYEAR(''%1:s'')-DAYOFYEAR(%0:s)>0 THEN 0 ELSE 1 END', [FieldFullName, FormatDateTime(FilterInterface.DateTimeFormat, FOperVal.DateVal)]);
            dkAge: FieldFullName:=Format('TRUNCATE(TIMESTAMPDIFF(SQL_TSI_MONTH, %0:s, ''%1:s'')/12,0)-IIF(MONTH(%0:s)=MONTH(''%1:s''), IIF(DAYOFMONTH(%0:s)-DAYOFMONTH(''%1:s'')>0, 1, 0), 0)', [FieldFullName, FormatDateTime(FilterInterface.DateTimeFormat, FOperVal.DateVal)]);
            dkCurrentAgeMonth: FieldFullName:=Format('TIMESTAMPDIFF(SQL_TSI_MONTH, %0:s, CURDATE())', [FieldFullName]);
            dkAgeMonth: FieldFullName:=Format('TIMESTAMPDIFF(SQL_TSI_MONTH, %0:s, ''%1:s'')', [FieldFullName, FormatDateTime(FilterInterface.DateTimeFormat, FOperVal.DateVal)]);
         end;
      end;
      //\\
      //++ убираем пробелы
      if ffkDoTrim in Field.Kinds then begin
         FieldFullName:=Format('Trim(%s)', [FieldFullName]);
      end;
      //\\
      // проверяем, надо ли преобразовывать к верхнему регистру значение поля
      if FOper.CaseSensitive and FField.CaseSensitive and not ((FField<>nil) and FField.IsUpper) and FIgnoreCase then begin
         FieldFullName:=Format('Upper(%s)', [FieldFullName]);
      end;
      // добавляем условие если операция требует значения
      if FOper.NeedValue then begin
         // если два значения
         if FOper.TwoValue then begin
            if (FOper.SQL='') and Assigned(FilterInterface.OnUserOperEvent) then begin
               S:='';
            end
            else if ffkProp in Field.Kinds then begin
               S:=Format(FOper.SQL, [RelItem.TableName,  RelItem.TableAlias, RelItem.Where, FField.Name, FieldFullName, Value1, Value2]);
            end
            else if ffkRel in Field.Kinds then begin
               S:=Format(FOper.SQL, [RelItem.TableName,  RelItem.TableAlias, RelItem.Where, FieldFullName, Value1, Value2]);
            end
            else begin
               S:=Format(FOper.SQL, [FieldFullName, Value1, Value2]);
            end;
            if Assigned(FilterInterface.OnUserOperEvent) then begin
               FilterInterface.OnUserOperEvent(FOper, FField, RelItem, FieldFullName, Value1, Value2, OperVal, S);
            end;
            SQL.Add(S);
         end
         // если одно значение
         else begin
            // свойство или отношение
            if (FField.RelName<>'') and not (ffkList in Field.Kinds) then begin
               if RelItem=nil then begin
                  Result:=False;
                  Exit;
               end;
               // проверяем поле на множественный выбор
               if FField.GetMultiSel(FilterInterface.SprList) then begin
                  SQL.Add('(');
                  for I:=0 to Pred(FValue1.Values.Count) do begin
                     Value1:=FValue1.Values[I];
                     if DoValUpper then begin
                        Value1:=AnsiUpperCase(Value1);
                     end;
                     if I<>0 then begin
                        if FOper.MultiOr then begin
                           SQL.Add(' OR ');
                        end
                        else begin
                           SQL.Add(' AND ');
                        end;
                     end;
                     if ffkProp in Field.Kinds then begin
                        if (FOper.SQL='') and Assigned(FilterInterface.OnUserOperEvent) then begin
                           S:='';
                        end
                        else begin
                           S:=Format(FOper.SQL, [RelItem.TableName,  RelItem.TableAlias, RelItem.Where, FField.Name, FieldFullName, Value1]);
                        end;
                        if Assigned(FilterInterface.OnUserOperEvent) then begin
                           FilterInterface.OnUserOperEvent(FOper, FField, RelItem, FieldFullName, Value1, Value2, OperVal, S);
                        end;
                        SQL.Add(S);
                     end
                     else if ffkRel in Field.Kinds then begin
                        if (FOper.SQL='') and Assigned(FilterInterface.OnUserOperEvent) then begin
                           S:='';
                        end
                        else begin
                           S:=Format(FOper.SQL, [RelItem.TableName,  RelItem.TableAlias, RelItem.Where, FieldFullName, Value1]);
                        end;
                        if Assigned(FilterInterface.OnUserOperEvent) then begin
                           FilterInterface.OnUserOperEvent(FOper, FField, RelItem, FieldFullName, Value1, Value2, OperVal, S);
                        end;
                        SQL.Add(S);
                     end;
                  end;
                  SQL.Add(')');
               end
               else begin
                  if ffkProp in Field.Kinds then begin
                     if (FOper.SQL='') and Assigned(FilterInterface.OnUserOperEvent) then begin
                        S:='';
                     end
                     else begin
                        S:=Format(FOper.SQL, [RelItem.TableName,  RelItem.TableAlias, RelItem.Where, FField.Name, FieldFullName, Value1]);
                     end;
                     if Assigned(FilterInterface.OnUserOperEvent) then begin
                        FilterInterface.OnUserOperEvent(FOper, FField, RelItem, FieldFullName, Value1, Value2, OperVal, S);
                     end;
                     SQL.Add(S);
                  end
                  else if ffkRel in Field.Kinds then begin
                     if (FOper.SQL='') and Assigned(FilterInterface.OnUserOperEvent) then begin
                        S:='';
                     end
                     else begin
                        S:=Format(FOper.SQL, [RelItem.TableName,  RelItem.TableAlias, RelItem.Where, FieldFullName, Value1]);
                     end;
                     if Assigned(FilterInterface.OnUserOperEvent) then begin
                        FilterInterface.OnUserOperEvent(FOper, FField, RelItem, FieldFullName, Value1, Value2, OperVal, S);
                     end;
                     SQL.Add(S);
                  end;
               end;
            end
            // обычное поле
            else begin
               // проверяем поле на множественный выбор
               if FField.GetMultiSel(FilterInterface.SprList) then begin
                  SQL.Add('(');
                  for I:=0 to Pred(FValue1.Values.Count) do begin
                     Value1:=FValue1.Values[I];
                     if DoValUpper then begin
                        Value1:=AnsiUpperCase(Value1);
                     end;
                     if I<>0 then begin
                        if FOper.MultiOr then begin
                           SQL.Add(' OR ');
                        end
                        else begin
                           SQL.Add(' AND ');
                        end;
                     end;
                     if (FOper.SQL='') and Assigned(FilterInterface.OnUserOperEvent) then begin
                        S:='';
                     end       
                     else begin
                        S:=Format(FOper.SQL, [FieldFullName, Value1]);
                     end;
                     if Assigned(FilterInterface.OnUserOperEvent) then begin
                        FilterInterface.OnUserOperEvent(FOper, FField, RelItem, FieldFullName, Value1, Value2, OperVal, S);
                     end;
                     SQL.Add(S);
                  end;
                  SQL.Add(')');
               end
               else begin
                  if (FOper.SQL='') and Assigned(FilterInterface.OnUserOperEvent) then begin
                     S:='';
                  end
                  else begin
                     S:=Format(FOper.SQL, [FieldFullName, Value1]);
                  end;
                  if Assigned(FilterInterface.OnUserOperEvent) then begin
                     FilterInterface.OnUserOperEvent(FOper, FField, RelItem, FieldFullName, Value1, Value2, OperVal, S);
                  end;
                  SQL.Add(S);
               end;
            end;
         end;
      end
      // добавляем условие если операция НЕ требует значения
      else begin
         if ffkProp in Field.Kinds then begin
            if RelItem=nil then begin
               Result:=False;
               Exit;
            end;
            if (FOper.SQL='') and Assigned(FilterInterface.OnUserOperEvent) then begin
               S:='';
            end
            else begin
               S:=Format(FOper.SQL, [RelItem.TableName,  RelItem.TableAlias, RelItem.Where, FField.Name, FieldFullName]);
            end;
            if Assigned(FilterInterface.OnUserOperEvent) then begin
               FilterInterface.OnUserOperEvent(FOper, FField, RelItem, FieldFullName, Value1, Value2, OperVal, S);
            end;
            SQL.Add(S);
         end
         else if ffkRel in Field.Kinds then begin
            if RelItem=nil then begin
               Result:=False;
               Exit;
            end;
            if (FOper.SQL='') and Assigned(FilterInterface.OnUserOperEvent) then begin
               S:='';
            end
            else begin
               S:=Format(FOper.SQL, [RelItem.TableName,  RelItem.TableAlias, RelItem.Where, FieldFullName]);
            end;
            if Assigned(FilterInterface.OnUserOperEvent) then begin
               FilterInterface.OnUserOperEvent(FOper, FField, RelItem, FieldFullName, Value1, Value2, OperVal, S);
            end;
            SQL.Add(S);
         end
         else begin
            if (FOper.SQL='') and Assigned(FilterInterface.OnUserOperEvent) then begin
               S:='';
            end
            else begin
               S:=Format(FOper.SQL, [FieldFullName]);
            end;
            if Assigned(FilterInterface.OnUserOperEvent) then begin
               FilterInterface.OnUserOperEvent(FOper, FField, RelItem, FieldFullName, Value1, Value2, OperVal, S);
            end;
            SQL.Add(S);
         end;
      end;
   end;
   // добавляем (если надо) оставшуюся часть для операций списка
   if (FField<>nil) and (ffkList in FField.Kinds) then begin
      if DPos<>0 then begin
         DPos:=DPos+DLen;
         SQL.Add(Copy(S, DPos, Succ(Length(S)-DPos)));
      end
   end;
   if SQL.Count=BlankPos then begin
      SQL.Delete(Pred(BlankPos));
   end;
   Result:={Blank or }not (SQL.Count<>LastPos);
end;

procedure TFindItem.GetText(Text: TStringList);
begin
//
end;

procedure TFindList.ItemToStrings1(Item: TFindItem; sl: TStringList);
var
   FieldPath: string;
   OperName: string;
   KindsList: string;
   Kind: TFindItemKind;
   par: TStringList;
begin
   if sl<>nil then begin
      if Item.Field<>nil then begin
         FieldPath:=Item.Field.Path;
      end
      else begin
         FieldPath:='-';
      end;
      KindsList:='';
      for Kind:=Low(TFindItemKind) to High(TFindItemKind) do begin
         if Kind in Item.Kinds then begin
            if KindsList='' then begin
               KindsList:=GetEnumName(TypeInfo(TFindItemKind), Ord(Kind));
            end
            else begin
               KindsList:=KindsList+','+GetEnumName(TypeInfo(TFindItemKind), Ord(Kind));
            end;
         end;
      end;
      if Item.Oper<>nil then begin
         OperName:=Item.Oper.Name;
      end
      else begin
         OperName:='-';
      end;
      //[2007.10.11]
      //--sl.Add(Format('3,PROP,"%s","%s","%s","%s","%s","%s"'{//+ ver 2}+',"%d"'{//+ ver 3}+',"%s"', [FieldPath, OperName, KindsList, MapBool[Item.IgnoreCase], MapBool[Item.IsParam], MapBool[Item.NeedValue]{//+ ver 2}, Item.Id{//+ ver 3}, GetEnumName(TypeInfo(TDateKind), Integer(Item.DatePart))]));
      par:=TStringList.Create;
      try
         par.Add('3');
         par.Add('PROP');
         par.Add(FieldPath);
         par.Add(OperName);
         par.Add(KindsList);
         par.Add(MapBool[Item.IgnoreCase]);
         par.Add(MapBool[Item.IsParam]);
         par.Add(MapBool[Item.NeedValue]);{//+ ver 2}
         par.Add(IntToStr(Item.Id));{//+ ver 3}
         par.Add(GetEnumName(TypeInfo(TDateKind), Integer(Item.DatePart)));
         sl.Add(par.CommaText);
      finally
         par.Free;
      end;
      //
      Item.Value1.SaveToStrings(sl);
      Item.Value2.SaveToStrings(sl);
      Item.OperVal.SaveToStrings(sl);//+ ver 2
      if Item.Par.Count>0 then begin
         sl.Add('PAR');
         Item.Par.SaveToStrings1(sl);
      end;
   end;
end;

procedure TFindItem.Remove;
begin
   if Owner<>nil then begin
      Owner.Remove(Self);
   end;
end;

procedure TFindItem.SetOwner(Value: TFindList);
begin
   FOwner:=Value;
   FPar.Owner:=Value;
end;

{ TFindList }

procedure TFindList.Add(Item: TFindItem);
begin
   FList.Add(Item);
   Item.Owner:=Self;
   if Item.Id=-1 then begin
      Item.Id:=GetNextId;
   end;
end;

function TFindList.AddNew(Field: TFindFieldItem; Oper: TOperItem; Value1, Value2, OperVal: TFindValue; Kinds: TFindItemKinds; IsUpper, IsParam, NeedValue: Boolean; DatePart: TDateKind): TFindItem;
begin
   Result:=TFindItem.Create(Field, Oper, Value1, Value2, OperVal, Kinds, IsUpper, IsParam, NeedValue, DatePart);
   Add(Result);
end;

procedure TFindList.Assign(List: TFindList);
var
   I: Integer;
   Item: TFindItem;
begin
   if List<>Self then begin
      FName:=List.Name;
      FCaption:=List.Caption;
      FFolder:=List.Folder;
      FIsFolder:=List.IsFolder;
      FOwnerFolder:=List.OwnerFolder;
      FParams.Assign(List.Params);
      Clear;
      for I:=0 to Pred(List.Count) do begin
         Item:=List[I];
         if Item<>nil then begin
            Add(Item.Clone);
         end;
      end;
      FOrderList.Assign(List.OrderList);
      FParamCtrl.Assign(List.ParamCtrl);
      FOwner:=List.Owner;
      FLastId:=List.LastId;
   end;
end;

procedure TFindList.Clear;
var
   I: Integer;
   Item: TFindItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

function TFindList.Clone: TFindList;
begin
   Result:=TFindList.Create('', '', '', False);
   Result.Assign(Self);
end;

constructor TFindList.Create(Name, Caption, Folder: string; IsFolder: Boolean);
begin
   FName:=Name;
   FCaption:=Caption;
   FFolder:=Folder;
   FList:=TList.Create;
   FIsFolder:=IsFolder;
   FParams:=TParamList.Create;
   FParamCtrl:=TStringList.Create;
   FOrderList:=TOrderList.Create;
   FOwnerFolder:=nil;
   FLastId:=0;
   FOwner:=nil;
end;

procedure TFindList.Delete(Item: TFindItem);
var
   I: Integer;
begin
   I:=IndexOf(Item);
   if I<>-1 then begin
      FList.Delete(I);
      Item.Free;
   end;
end;

destructor TFindList.Destroy;
begin
   Clear;
   FList.Free;
   FParamCtrl.Free;
   FParams.Free;
   FOrderList.Free;
   inherited;
end;

function TFindList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TFindList.GetItem(I: Integer): TFindItem;
begin
   if I<=Pred(GetCount) then begin
      Result:=TFindItem(FList[I]);
   end
   else begin
      Result:=nil;
   end;
end;

function TFindList.GetSQL(SQL: TStrings; FilterInterface: TFilterInterface): Boolean;
var
   I: Integer;
   Item: TFindItem;
   Blank: Boolean;
begin       
   Result:=True;
   Blank:=True;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Blank:=Item.GetSQL(SQL, Blank, FilterInterface) and Blank;
      end;
   end;                         
end;

function TFindList.GetText(Text: TStringList): Boolean;
var
   I: Integer;
   Item: TFindItem;
begin
   Result:=True;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.GetText(Text);
      end;
   end;
end;

function TFindList.IndexOf(Item: TFindItem): Integer;
begin
   Result:=FList.IndexOf(Item);
end;

function TFindList.InsertNew(Item: TFindItem; Field: TFindFieldItem; Oper: TOperItem; Value1, Value2, OperVal: TFindValue; Kinds: TFindItemKinds; IsUpper, IsParam, NeedValue: Boolean; DatePart: TDateKind): TFindItem;
var
   I: Integer;
begin
   I:=IndexOf(Item);
   if (I=-1) or (Succ(I)=GetCount) then begin
      Result:=AddNew(Field, Oper, Value1, Value2, OperVal, Kinds, IsUpper, IsParam, NeedValue, DatePart);
   end
   else begin
      Result:=TFindItem.Create(Field, Oper, Value1, Value2, OperVal, Kinds, IsUpper, IsParam, NeedValue, DatePart);
      Insert(Succ(I), Result);
   end;
end;

function TFindList.LoadFromFile(FileName: string; var Err: string; FindField: TFindFieldList; FindOper: TOperList): Boolean;
var
   sl: TStringList;
begin              
   Result:=False;
   Err:='';
   try
      if FileExists(FileName) then begin
         sl:=TStringList.Create;
         try
            sl.LoadFromFile(FileName);
            if LoadFromStrings(sl, FindField, FindOper) then begin
               FFolder:=ExtractFilePath(FileName);
               if (Length(FFolder)>0) and (FFolder[Length(FFolder)]='\') then begin
                  System.Delete(FFolder, Length(FFolder), 1);
               end;
               Result:=True;
            end;
         finally
            sl.Free;
         end;
      end else begin
        Err:='Не найден файл фильтра: "'+ChangeFileExt(ExtractFileName(FileName), '')+'"';
      end;
   except
      on E: Exception do begin
         Err:=E.Message;
         Result:=False;
      end;
   end;
end;

function TFindList.LoadFromStrings(sl: TStringList; FindField: TFindFieldList; FindOper: TOperList): Boolean;
var
   Ind: Integer;
begin
   Result:=False;
   if (sl<>nil) and (sl.Count>5) then begin
      if sl[0]=CFirstLine then begin
         Ind:=1;
         Result:=LoadFromStrings_(sl, Ind, FindField, FindOper);
      end;
   end;
end;

function TFindList.LoadFromStrings1(sl: TStringList; var Ind: Integer; Owner: TFindList; FindField: TFindFieldList; FindOper: TOperList): Boolean;
var
   I: Integer;
   ItemCount: Integer;
   FindItem: TFindItem;
begin
   Result:=False;
   if sl<>nil then begin
      Clear;
      ItemCount:=StrToIntDef(sl[Ind], -1);
      Inc(Ind);
      for I:=0 to Pred(ItemCount) do begin
         FindItem:=ItemFromStrings1(sl, Ind, Owner, FindField, FindOper);
         if FindItem<>nil then begin
            FindItem.Owner:=Owner;
            Add(FindItem);
            Result:=True;
         end
         else begin
            Result:=False;
            Exit;
         end;
      end;
   end;
end;

function TFindList.SaveToFile(FileName: string; var Err: string): Boolean;
var
   Dir: string;
   Name: string;
   sl: TStringList;
begin
   Err:='';
   try
      Dir:=ExtractFilePath(FileName);
      Name:=ExtractFileName(FileName);
      {--if FileExists(FileName) then begin
         if MessageDlgR(Format('Файл с именем %s уже существует. Переписать его?', [Name]), mtConfirmation, [mbOk, mbCancel], 0)=mrCancel then begin
            Exit;
         end;
      end;}
      if not DirectoryExists(Dir) then begin
         ForceDirectories(Dir);
      end;
      sl:=TStringList.Create;
      try
         SaveToStrings(sl);
         sl.SaveToFile(FileName);
         FFolder:=ExtractFilePath(FileName);
         if (Length(FFolder)>0) and (FFolder[Length(FFolder)]='\') then begin
            System.Delete(FFolder, Length(FFolder), 1);
         end;
         Result:=True;
      finally
         sl.Free;
      end;
   except
      on E: Exception do begin
         Err:=E.Message;
         Result:=False;
      end;
   end;
end;

procedure TFindList.SaveToStrings(sl: TStringList);
begin
   if sl<>nil then begin
      sl.Add(CFirstLine);
      SaveToStrings_(sl);
   end;
end;

procedure TFindList.SaveToStrings1(sl: TStringList);
var
   I: Integer;
   FindItem: TFindItem;
begin
   if sl<>nil then begin
      sl.Add(IntToStr(GetCount));
      for I:=0 to Pred(GetCount) do begin
         FindItem:=GetItem(I);
         if FindItem<>nil then begin
            ItemToStrings1(FindItem, sl);
         end;
      end;
   end;
end;

function TFindList.ItemFromStrings1(sl: TStringList; var Ind: Integer; Owner: TFindList; FindField: TFindFieldList; FindOper: TOperList): TFindItem;
var
   FieldPath: string;
   OperName: string;
   KindsList: TStringList;
   Oper: TOperItem;
   Field: TFindFieldItem;
   Props: TStringList;
   Version: Integer;
   IgnoreCase: Boolean;
   IsParam: Boolean;
   NeedValue: Boolean;
   I: Integer;
   Kinds: TFindItemKinds;
begin
   Result:=nil;
   if sl<>nil then begin
      Props:=TStringList.Create;
      KindsList:=TStringList.Create;
      try
         Props.CommaText:=sl[Ind];
         Inc(Ind);
         Version:=-1;
         if Props.Count>0 then begin
            Version:=StrToIntDef(Props[0], Version);
         end;
         case Version of
            // первая версия
            1: begin
               if (Props.Count=8) and (Props[1]='PROP') then begin
                  FieldPath:=Trim(Props[2]);
                  if FieldPath='-' then begin
                     Field:=nil;
                  end
                  else begin
                     Field:=FindField.ByPath(FieldPath);
                  end;
                  OperName:=Trim(Props[3]);
                  if OperName='-' then begin
                     Oper:=nil;
                  end
                  else begin
                     Oper:=FindOper.ByName(OperName);
                  end;
                  KindsList.CommaText:=Trim(Props[4]);
                  IgnoreCase:=Trim(Props[5])=MapBool[True];
                  IsParam:=Trim(Props[6])=MapBool[True];
                  NeedValue:=Trim(Props[7])=MapBool[True];
                  Kinds:=[];
                  for I:=0 to Pred(KindsList.Count) do begin
                     Include(Kinds, TFindItemKind(GetEnumValue(TypeInfo(TFindItemKind), KindsList[I])));
                  end;
                  Result:=TFindItem.Create(Field, Oper, nil, nil, nil, Kinds, IgnoreCase, IsParam, NeedValue, dkFull);
                  try
                     if not Result.Value1.LoadFromStrings(sl, Ind) then raise Exception.Create('');
                     if not Result.Value2.LoadFromStrings(sl, Ind) then raise Exception.Create('');
                     Result.OperVal.Clear; //+ ver 2
                     if (Ind<sl.Count) and (sl[Ind]='PAR') then begin
                        Inc(Ind);
                        if not Result.Par.LoadFromStrings1(sl, Ind, Result.Par, FindField, FindOper) then raise Exception.Create('');
                     end;
                     Result.Id:=-1; //+ ver 2
                  except
                     Result.Free;
                     Result:=nil;
                  end;
               end;
            end;
            // вторая версия
            2: begin
               if (Props.Count=9) and (Props[1]='PROP') then begin
                  FieldPath:=Trim(Props[2]);
                  if FieldPath='-' then begin
                     Field:=nil;
                  end
                  else begin
                     Field:=FindField.ByPath(FieldPath);
                  end;
                  OperName:=Trim(Props[3]);
                  if OperName='-' then begin
                     Oper:=nil;
                  end
                  else begin
                     Oper:=FindOper.ByName(OperName);
                  end;
                  KindsList.CommaText:=Trim(Props[4]);
                  IgnoreCase:=Trim(Props[5])=MapBool[True];
                  IsParam:=Trim(Props[6])=MapBool[True];
                  NeedValue:=Trim(Props[7])=MapBool[True];
                  Kinds:=[];
                  for I:=0 to Pred(KindsList.Count) do begin
                     Include(Kinds, TFindItemKind(GetEnumValue(TypeInfo(TFindItemKind), KindsList[I])));
                  end;
                  Result:=TFindItem.Create(Field, Oper, nil, nil, nil, Kinds, IgnoreCase, IsParam, NeedValue, dkFull);
                  Result.Id:=StrToIntDef(Props[8], -1);
                  try
                     if not Result.Value1.LoadFromStrings(sl, Ind) then raise Exception.Create('');
                     if not Result.Value2.LoadFromStrings(sl, Ind) then raise Exception.Create('');
                     if not Result.OperVal.LoadFromStrings(sl, Ind) then raise Exception.Create(''); //+ ver 2
                     if (Ind<sl.Count) and (sl[Ind]='PAR') then begin
                        Inc(Ind);
                        if not Result.Par.LoadFromStrings1(sl, Ind, Result.Par, FindField, FindOper) then raise Exception.Create('');
                     end;
                  except
                     Result.Free;
                     Result:=nil;
                  end;
               end;
            end;
            // третья версия
            3: begin
               if (Props.Count=10) and (Props[1]='PROP') then begin
                  FieldPath:=Trim(Props[2]);
                  if FieldPath='-' then begin
                     Field:=nil;
                  end
                  else begin
                     Field:=FindField.ByPath(FieldPath);
                  end;  
                  OperName:=Trim(Props[3]);
                  if OperName='-' then begin
                     Oper:=nil;
                  end
                  else begin

                    if not (ffkRel in Field.Kinds) and (RightStr(OperName,2)='_R')    // vadim (если было с relation, а стало без)
                      then OperName:=Copy(OperName,1,Length(OperName)-2);
                      
                     Oper:=FindOper.ByName(OperName);
                  end;
                  KindsList.CommaText:=Trim(Props[4]);
                  IgnoreCase:=Trim(Props[5])=MapBool[True];
                  IsParam:=Trim(Props[6])=MapBool[True];
                  NeedValue:=Trim(Props[7])=MapBool[True];
                  Kinds:=[];
                  for I:=0 to Pred(KindsList.Count) do begin
                     Include(Kinds, TFindItemKind(GetEnumValue(TypeInfo(TFindItemKind), KindsList[I])));
                  end;
                  Result:=TFindItem.Create(Field, Oper, nil, nil, nil, Kinds, IgnoreCase, IsParam, NeedValue, dkFull);
                  Result.Id:=StrToIntDef(Props[8], -1);
                  Result.DatePart:=TDateKind(GetEnumValue(TypeInfo(TDateKind), Props[9]));
                  try
                     if not Result.Value1.LoadFromStrings(sl, Ind) then raise Exception.Create('');
                     if not Result.Value2.LoadFromStrings(sl, Ind) then raise Exception.Create('');
                     if not Result.OperVal.LoadFromStrings(sl, Ind) then raise Exception.Create(''); //+ ver 2
                     if (Ind<sl.Count) and (sl[Ind]='PAR') then begin
                        Inc(Ind);
                        if not Result.Par.LoadFromStrings1(sl, Ind, Result.Par, FindField, FindOper) then raise Exception.Create('');
                     end;
                  except
                     Result.Free;
                     Result:=nil;
                  end;
               end;
            end;
         end;
      finally
         Props.Free;
         KindsList.Free;
      end;
   end;
end;

function TFindList.HaveParams: Boolean;
var
   I: Integer;
   FindItem: TFindItem;
begin
   Result:=False;
   for I:=0 to Pred(GetCount) do begin
      FindItem:=GetItem(I);
      if FindItem.IsParam or FindItem.Par.HaveParams then begin
         Result:=True;
         Break;
      end;
   end;
end;

procedure TFindList.FillParamList;
begin
   FParams.Clear;
   FillParamList2(FParams);
end;

procedure TFindList.FillParamList2(ParamList: TParamList);
var
   I: Integer;
   FindItem: TFindItem;
begin
   for I:=0 to Pred(GetCount) do begin
      FindItem:=GetItem(I);
      if (FindItem<>nil) and FindItem.IsParam then begin
         ParamList.Add(FindItem);
      end;
      FindItem.Par.FillParamList2(ParamList);
   end;
end;

function TFindList.ParamsFromString(S: string): Boolean;
var
   Version: Integer;
   sl: TStringList;
   I: Integer;
   O: TParamOption;
begin
   Result:=False;
   if S<>'' then begin
      sl:=TStringList.Create;
      try
         sl.CommaText:=S;
         Version:=-1;
         if sl.Count>0 then begin
            Version:=StrToIntDef(sl[0], Version);
         end;
         case Version of
            // версия 1
            1: begin
               if (sl.Count=4) and (sl[1]='PARAM') then begin
                  FParams.FormWidth:=StrToIntDef(sl[2], FParams.FormWidth);
                  FParams.FormHeight:=StrToIntDef(sl[3], FParams.FormHeight);
                  Result:=True;
               end;
            end;
            // версия 2
            2: begin
               if (sl.Count=7) and (sl[1]='PARAM') then begin
                  FParams.FormWidth:=StrToIntDef(sl[2], FParams.FormWidth);
                  FParams.FormHeight:=StrToIntDef(sl[3], FParams.FormHeight);
                  FParams.PixelsPerInch:=StrToIntDef(sl[4], FParams.PixelsPerInch);
                  FParams.Caption:=sl[5];
                  FParams.Option:=[];
                  I:=1;
                  for O:=Low(TParamOption) to High(TParamOption) do begin
                     if (Length(sl[6])>=I) and (sl[6][I]='1') then begin
                        FParams.Option:=FParams.Option+[O];
                     end;
                     Inc(I);
                  end;
                  Result:=True;
               end;
            end;
         end;
      finally
         sl.Free;
      end;
   end;
end;

function TFindList.ParamsToString: string;
var
   S: string;
   O: TParamOption;
   par: TStringList;
begin
   //--Result:=Format('1,PARAM,"%d","%d"', [FParams.FormWidth, FParams.FormHeight]);
   S:='';
   for O:=Low(TParamOption) to High(TParamOption) do begin
      if O in FParams.Option then begin
         S:=S+'1';
      end
      else begin
         S:=S+'0';
      end;
   end;
   //[2007.10.11]
   {--
   Result:=Format('2,PARAM,"%d","%d","%d","%s","%s"', [
      FParams.FormWidth,
      FParams.FormHeight,
      FParams.PixelsPerInch,
      FParams.Caption,
      S
   ]);
   }
   par:=TStringList.Create;
   try
      par.Add('2');
      par.Add('PARAM');
      par.Add(IntToStr(FParams.FormWidth));
      par.Add(IntToStr(FParams.FormHeight));
      par.Add(IntToStr(FParams.PixelsPerInch));
      par.Add(FParams.Caption);
      par.Add(S);
      Result:=par.CommaText;
   finally
      par.Free;
   end;
   //
end;

procedure TFindList.ClearFilter;
begin
   Clear;
   FName:='';
   FCaption:='';
   FFolder:='';
   FLastId:=0;
   FOrderList.Clear;
   FParamCtrl.Clear;
end;

function TFindList.InsertFirst(Field: TFindFieldItem; Oper: TOperItem; Value1, Value2, OperVal: TFindValue; Kinds: TFindItemKinds; IsUpper, IsParam, NeedValue: Boolean; DatePart: TDateKind): TFindItem;
begin
   if GetCount=0 then begin
      Result:=AddNew(Field, Oper, Value1, Value2, OperVal, Kinds, IsUpper, IsParam, NeedValue, DatePart);
   end
   else begin
      Result:=TFindItem.Create(Field, Oper, Value1, Value2, OperVal, Kinds, IsUpper, IsParam, NeedValue, DatePart);
      Insert(0, Result);
   end;
end;

procedure TFindList.Insert(Ind: Integer; Item: TFindItem);
begin
   FList.Insert(Ind, Item);
   Item.Owner:=Self;
   if Item.Id=-1 then begin
      Item.Id:=GetNextId;
   end;
end;

procedure TFindList.AddList(List: TFindList);
var
   I: Integer;
   Item: TFindItem;
begin
   for I:=0 to Pred(List.Count) do begin
      Item:=List[I];
      Add(Item.Clone);
   end;
end;

procedure TFindList.InsertList(Ind: Integer; List: TFindList);
var
   I: Integer;
   Item: TFindItem;
begin
   for I:=0 to Pred(List.Count) do begin
      Item:=List[I];
      Insert(Ind, Item.Clone);
      Inc(Ind);
   end;
end;

procedure TFindList.DeletePar(Item: TFindItem);
var
   Ind: Integer;
begin
   Ind:=IndexOf(Item);
   if (Ind<>-1) and (fikPar in Item.Kinds) then begin
      FList.Delete(Ind);
      InsertList(Ind, Item.Par);
      Item.Free;
   end;
end;

procedure TFindList.Remove(Item: TFindItem);
var
   I: Integer;
begin
   I:=IndexOf(Item);
   if I<>-1 then begin
      FList.Delete(I);
   end;
end;

function TFindList.GetNextId: Integer;
var
   Root: TFindList;
begin
   Root:=GetRoot;
   if Root=Self then begin
      Inc(FLastId);
      Result:=FLastId;
      // получается, что нет проверки на появление полей с одинаковым Id
      // возможно такая проверка не помешала бы (на всякий случай)
   end
   else begin
      Result:=Root.GetNextId;
   end;
end;

function TFindList.GetRoot: TFindList;
begin
   Result:=Self;
   if FOwner<>nil then begin
      Result:=FOwner.GetRoot;
   end;
end;

function TFindList.LoadFromStrings_(sl: TStringList; var Ind: Integer; FindField: TFindFieldList; FindOper: TOperList): Boolean;
var
   Version: Integer;
   P: Integer;
   J: Integer;
   Temp: TFindList;
   Cnt: Integer;
begin
   Result:=False;
   P:=Pos('=', sl[Ind]);
   Version:=-1;
   if P>0 then begin
      Version:=StrToIntDef(Copy(sl[Ind], Succ(P), Length(sl[1])-P), Version);
   end;
   Inc(Ind);
   case Version of
      // первая версия
      1: begin
         Temp:=TFindList.Create('', '', '', False);
         try
            Temp.Assign(Self);
            try
               FName:=sl[Ind];
               Inc(Ind);
               FCaption:=sl[Ind];
               Inc(Ind, 2);
               FOrderList.Clear; //+ ver 2
               FParamCtrl.Clear; //+ ver 2
               FLastId:=0; //+ ver 2
               if ParamsFromString(sl[Ind]) then begin
                  Inc(Ind);
                  Result:=LoadFromStrings1(sl, Ind, Self, FindField, FindOper);
               end;
               if not Result then begin
                  Assign(Temp);
               end;
            except
               Assign(Temp);
            end;
         finally
            Temp.Free;
         end;
      end;
      // вторая версия, третья версия
      2, 3: begin
         Temp:=TFindList.Create('', '', '', False);
         try
            Temp.Assign(Self);
            try
               FName:=sl[Ind];
               Inc(Ind);
               FCaption:=sl[Ind];
               Inc(Ind, 2);
               if FOrderList.LoadFromString(sl[Ind]) and ParamsFromString(sl[Succ(Ind)]) then begin
                  Inc(Ind, 2);
                  FLastId:=StrToIntDef(sl[Ind], 0);
                  Inc(Ind);
                  Result:=LoadFromStrings1(sl, Ind, Self, FindField, FindOper);
               end;
               if Result and HaveParams then begin
                  FParamCtrl.Clear;
                  Cnt:=StrToIntDef(sl[Ind], 0);
                  Inc(Ind);
                  for J:=0 to Pred(Cnt) do begin
                     FParamCtrl.Add(sl[J+Ind]);
                  end;
                  Inc(Ind, Cnt);
               end;
               if not Result then begin
                  Assign(Temp);
               end;
            except
               Result:=False;
               Assign(Temp);
            end;
         finally
            Temp.Free;
         end;
      end;
   end;
end;

procedure TFindList.SaveToStrings_(sl: TStringList);
var
   I: Integer;
begin
   sl.Add('Версия=3');
   sl.Add(FName);
   sl.Add(FCaption);
   sl.Add(MapBool[HaveParams]);
   sl.Add(FOrderList.SaveToString); //+ ver 2
   sl.Add(ParamsToString);
   sl.Add(Format('%d', [FLastId])); //+ ver 2
   SaveToStrings1(sl);
   //+ ver 2
   if HaveParams then begin
      sl.Add(IntToStr(FParamCtrl.Count));
      for I:=0 to Pred(FParamCtrl.Count) do begin
         sl.Add(FParamCtrl[I]);
      end;
   end;
end;

{ TFindValue }

procedure TFindValue.Assign(Value: TFindValue);
begin
   if Value<>Self then begin
      FKind:=Value.Kind;
      FDateVal:=Value.DateVal;
      FStrVal:=Value.StrVal;
      FBoolVal:=Value.BoolVal;
      FNumVal:=Value.NumVal;
      FExtVal:=Value.ExtVal;
      FIsNull:=Value.IsNull;
      FValCaption:=Value.ValCaption;
      FValues.Assign(Value.Values);
   end;
end;

procedure TFindValue.Clear;
begin
   FKind:=valNone;
   FDateVal:=0;
   FStrVal:='';
   FBoolVal:=False;
   FNumVal:=0;
   FExtVal:=0;
   FIsNull:=True;
   FValCaption:='';
   FValues.Clear;
end;

constructor TFindValue.Create;
begin
   FValues:=TStringList.Create;
   FKind:=valNone;
   FIsNull:=True;
   FDateVal:=0;
   FStrVal:='';
   FBoolVal:=False;
   FNumVal:=0;
   FValCaption:='';
end;

destructor TFindValue.Destroy;
begin
   FValues.Free;
   inherited;
end;

function TFindValue.GetCaption(DoUpper: Boolean): string;
begin
   Result:='';
   if FValCaption<>'' then begin
      Result:=FValCaption;
   end
   else if not FIsNull then begin
      case FKind of
         // строка
         valString: begin
            Result:=FStrVal;
            if DoUpper then begin
               Result:=AnsiUpperCase(Result);
            end;
            Result:=Format('''%s''', [Result]);
         end;
         // логическое
         valBoolean: begin
            if FBoolVal then begin
               Result:='Да';
            end
            else begin
               Result:='Нет';
            end;
         end;
         // целое число
         valNumber: begin
            Result:=IntToStr(FNumVal);
         end;
         // дробное число
         valFloat: begin
            Result:=FloatToStr(FExtVal); 
         end;
         // дата
         valDate: begin
            Result:=FormatDateTime(CValueCaptionDateFmt, FDateVal);
         end;
      end;
   end;
end;

function TFindValue.GetText(DoUpper: Boolean; DateTimeFormat, TrueS, FalseS: string): string;
begin
   Result:='';
   if not FIsNull then begin
      case FKind of
         // строка
         valString: begin
            Result:=FStrVal;
            if DoUpper then begin
               Result:=AnsiUpperCase(Result);
            end;
            Result:=StringReplace(Result, '''', '''''', [rfReplaceAll, rfIgnoreCase]);
         end;
         // логическое
         valBoolean: begin
            if FBoolVal then begin
               //--Result:='True';
               Result:=TrueS;
            end
            else begin
               //--Result:='False';
               Result:=FalseS;
            end;
         end;
         // целое число
         valNumber: begin
            Result:=IntToStr(FNumVal);
         end;
         // дробное число
         valFloat: begin
            Result:=FloatToStr(FExtVal);
         end;
         // дата
         valDate: begin
            Result:=FormatDateTime(DateTimeFormat, FDateVal);
         end;
      end;
   end;
end;

function StrToFloat(S: string): Extended;
var
   DefThousandSeparator: Char;
   DefDecimalSeparator: Char;
begin
   DefThousandSeparator:=ThousandSeparator;
   DefDecimalSeparator:=DecimalSeparator;
   try
      ThousandSeparator:=#0;
      DecimalSeparator:='.';
      Result:=SysUtils.StrToFloatDef(S, 0);
   finally
      ThousandSeparator:=DefThousandSeparator;
      DecimalSeparator:=DefDecimalSeparator;
   end;
end;

function TFindValue.LoadFromStrings(sl: TStringList; var Ind: Integer): Boolean;
var
   Props: TStringList;
   Version: Integer;
begin
   Result:=False;
   if sl<>nil then begin
      Props:=TStringList.Create;
      try
         Props.CommaText:=sl[Ind];
         Inc(Ind);
         Version:=-1;
         if Props.Count>0 then begin
            Version:=StrToIntDef(Props[0], -1);
         end;
         case Version of
            1: begin
               if (Props.Count=11) and (Props[1]='VALUE') then begin
                  FKind:=TFindValueKind(GetEnumValue(TypeInfo(TFindValueKind), Props[2]));
                  FIsNull:=Props[3]=MapBool[True];
                  FStrVal:=Props[4];
                  FBoolVal:=Props[5]=MapBool[True];
                  FNumVal:=StrToInt(Props[6]);
                  FDateVal:=EncodeDate(StrToInt(Copy(Props[7], 1, 4)), StrToInt(Copy(Props[7], 5, 2)), StrToInt(Copy(Props[7], 7, 2)));
                  FIsNull:=Props[8]=MapBool[True];
                  FValCaption:=Props[9];
                  FExtVal:=StrToFloat(Props[10]);
                  FValues.CommaText:=sl[Ind];
                  Inc(Ind);
                  if (FValues.Count>0) and (FValues[0]='VALUES') then begin
                     FValues.Delete(0);
                     //delphi 7
                     if sl[Pred(Ind)][Length(sl[Pred(Ind)])]=',' then FValues.Delete(Pred(FValues.Count));
                     //\\
                     Result:=True;
                  end;
               end;
            end;
         end;
      finally
         Props.Free;
      end;
   end;
end;

procedure TFindValue.SaveToStrings(sl: TStringList);
var
   ValKind: string;
   par: TStringList;
   DefThousandSeparator: Char;
   DefDecimalSeparator: Char;
begin
   if sl<>nil then begin
      DefThousandSeparator:=ThousandSeparator;
      DefDecimalSeparator:=DecimalSeparator;
      ValKind:=GetEnumName(TypeInfo(TFindValueKind), Ord(FKind));
      //[2007.10.11]
      //--sl.Add(Format('1,VALUE,"%s","%s","%s","%s","%d","%s","%s","%s","%f"', [ValKind, MapBool[FIsNull], FStrVal, MapBool[FBoolVal], FNumVal, FormatDateTime('YYYYMMDD', FDateVal), MapBool[FIsNull], FValCaption, FExtVal]));
      par:=TStringList.Create;
      try
         ThousandSeparator:=#0;
         DecimalSeparator:='.';
         par.Add('1');
         //\\
         par.Add('VALUE');
         par.Add(ValKind);
         par.Add(MapBool[FIsNull]);
         par.Add(FStrVal);
         par.Add(MapBool[FBoolVal]);
         par.Add(IntToStr(FNumVal));
         par.Add(FormatDateTime('YYYYMMDD', FDateVal));
         par.Add(MapBool[FIsNull]);
         par.Add(FValCaption);
         par.Add(Format('%.2f', [FExtVal]));
         sl.Add(par.CommaText);
      finally
         par.Free;
         ThousandSeparator:=DefThousandSeparator;
         DecimalSeparator:=DefDecimalSeparator;
      end;
      //
      sl.Add(Format('VALUES,%s', [FValues.CommaText]));
   end;
end;

{ TFilterList }

function TFilterList.AddCopy(Filter: TFindList): TFindList;
begin
   Result:=AddNew;
   if Filter<>nil then begin
      Result.Assign(Filter);
   end;
end;

function TFilterList.AddFolder(Name: string): TFindList;
begin
   Result:=TFindList.Create('', Name, '', True);
   FList.Add(Result);
end;

function TFilterList.AddNew: TFindList;
begin
   Result:=TFindList.Create('', '', '', False);
   FList.Add(Result);
end;

procedure TFilterList.Clear;
var
   I: Integer;
   Item: TFindList;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

constructor TFilterList.Create;
begin
   FList:=TList.Create;
end;

procedure TFilterList.Delete(I: Integer);
var
   Item: TFindList;
begin
   Item:=GetItem(I);
   Item.Free;
   FList.Delete(I);
end;

destructor TFilterList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TFilterList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TFilterList.GetItem(I: Integer): TFindList;
begin
   Result:=TFindList(FList[I]);
end;

function TFilterList.Last: TFindList;
begin
   if GetCount>0 then begin
      Result:=GetItem(Pred(GetCount));
   end
   else begin
      Result:=nil;
   end;
end;

{ TParamList }

function TParamList.Add(Item: TFindItem): Integer;
begin
   Result:=FList.Add(Item);
end;

procedure TParamList.Assign(Params: TParamList);
begin
   FFormWidth:=Params.FormWidth;
   FFormHeight:=Params.FormHeight;
   FPixelsPerInch:=Params.PixelsPerInch;
   FCaption:=Params.Caption;
   FOption:=Params.Option;
end;

procedure TParamList.Clear;
begin
   FList.Clear;
end;

constructor TParamList.Create;
begin
   FList:=TList.Create;
   FFormWidth:=0;
   FFormHeight:=0;
   FPixelsPerInch:=Screen.PixelsPerInch;
   FCaption:='';
   FOption:=[poSaveValue, poShowClearButton, poShowCaption];
end;

destructor TParamList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TParamList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TParamList.GetItem(I: Integer): TFindItem;
begin
   Result:=TFindItem(FList[I]);
end;

function TParamList.GetMaxOpWidth(Canvas: TCanvas): Integer;
var
   I: Integer;
   FindItem: TFindItem;
   S: string;
   W: Integer;
begin
   Result:=0;
   for I:=0 to Pred(GetCount) do begin
      FindItem:=GetItem(I);
      if FindItem<>nil then begin
         S:=FindItem.Oper.Caption;
         W:=Canvas.TextWidth(S);
         if Result<W then begin
            Result:=W;
         end;
      end;
   end;
end;

function TParamList.GetRealHeight: Integer;
begin
   Result:=Round(FFormHeight*(Screen.PixelsPerInch/FPixelsPerInch));
end;

function TParamList.GetRealWidth: Integer;
begin
   Result:=Round(FFormWidth*(Screen.PixelsPerInch/FPixelsPerInch));
end;

{ TRelItem }

constructor TRelItem.Create(TableName, TableAlias, Name, Where, GroupBy: string; Kind: TRelKind);
begin
   FName:=Name;
   FTableName:=TableName;
   FTableAlias:=TableAlias;
   FWhere:=Where;
   FGroupBy:=GroupBy;
   FKind:=Kind;
end;

destructor TRelItem.Destroy;
begin
   inherited;
end;

{ TRelList }

function TRelList.Add(Item: TRelItem): Integer;
begin
   Result:=FList.Add(Item);
end;

function TRelList.AddNew(TableName, TableAlias, Name, Where, GroupBy: string; Kind: TRelKind): TRelItem;
begin
   Result:=TRelItem.Create(TableName, TableAlias, Name, Where, GroupBy, Kind);
   Add(Result);
end;

function TRelList.ByName(Name: string): TRelItem;
var
   I: Integer;
   Item: TRelItem;
begin
   Result:=nil;
   if Name<>'' then begin
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         if (Item<>nil) and (AnsiCompareText(Name, Item.Name)=0) then begin
            Result:=Item;
            Break;
         end;
      end;
   end;
end;

procedure TRelList.Clear;
var
   I: Integer;
   Item: TRelItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

constructor TRelList.Create;
begin
   FList:=TList.Create;
end;

destructor TRelList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TRelList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TRelList.GetItem(I: Integer): TRelItem;
begin
   Result:=TRelItem(FList[I]);
end;

{ TFilterName }

constructor TFilterName.Create(FullFileName: string; IsFolder: Boolean; Owner: TFilterName);
begin
   FFullFileName:=FullFileName;
   FIsFolder:=IsFolder;
   FOwner:=Owner;
end;

destructor TFilterName.Destroy;
begin
   inherited;
end;

function TFilterName.EqualFileName(Filter: TFindList): Boolean;
var
   S1: string;
   S2: string;
begin
   Result:=False;
   if Filter<>nil then begin
      S1:=ChangeFileExt(FFullFileName, '');
      S2:=Filter.Folder+'\'+Filter.Caption;
      Result:=AnsiCompareText(S1, S2)=0;
   end;
end;

function TFilterName.GetName: string;
begin
   Result:=ChangeFileExt(ExtractFileName(FFullFileName), '');
end;

{ TFilterNameList }

function TFilterNameList.Add(Item: TFilterName): Integer;
begin
   Result:=FList.Add(Item);
end;

function TFilterNameList.AddFolder(FullFileName: string; Owner: TFilterName): TFilterName;
begin
   Result:=TFilterName.Create(FullFileName, True, Owner);
   Add(Result);
end;

function TFilterNameList.AddName(FullFileName: string; Owner: TFilterName): TFilterName;
begin
   Result:=TFilterName.Create(FullFileName, False, Owner);
   Add(Result);
end;

function TFilterNameList.Build(BaseDir: string): Boolean;
begin
   Result:=True;
   Clear;
   if DirectoryExists(BaseDir) then begin
      BuildDirNameList(BaseDir, nil);
      Sort;
   end;
end;

function TFilterNameList.BuildDirNameList(Dir: string; Owner: TFilterName): Boolean;
var
   sr: TSearchRec;
   Folder: TFilterName;
begin
   Result:=False;
   if DirectoryExists(Dir) then begin
      if FindFirst(Dir+'\*', faAnyFile, sr)=0 then begin
         repeat
            if (sr.Attr and faDirectory)=faDirectory then begin
               if (sr.Name<>'.') and (sr.Name<>'..') then begin
                  Folder:=AddFolder(Dir+'\'+sr.Name, Owner);
                  if BuildDirNameList(Dir+'\'+sr.Name, Folder) then begin
                     Result:=True;
                  end
                  else begin
                     Delete(Folder);
                  end;
               end;
            end
            else begin
               AddName(Dir+'\'+sr.Name, Owner);
               Result:=True;
            end;
         until FindNext(sr)<>0;
         SysUtils.FindClose(sr);
      end;
   end;
end;

procedure TFilterNameList.Clear;
var
   I: Integer;
   Item: TFilterName;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

constructor TFilterNameList.Create;
begin
   FList:=TList.Create;
end;

procedure TFilterNameList.Delete(Item: TFilterName);
var
   Ind: Integer;
begin
   Ind:=FList.IndexOf(Item);
   if Ind<>-1 then begin
      FList.Delete(Ind);
      Item.Free;
   end;
end;

destructor TFilterNameList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TFilterNameList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TFilterNameList.GetItem(I: Integer): TFilterName;
begin
   Result:=TFilterName(FList[I]);
end;

function CompareFilterName(Item1, Item2: Pointer): Integer;
var
   FilterName1: TFilterName;
   FilterName2: TFilterName;
begin
   FilterName1:=TFilterName(Item1);
   FilterName2:=TFilterName(Item2);
   if FilterName2.IsFolder<>FilterName1.IsFolder then begin
      if FilterName1.IsFolder then begin
         Result:=-1;
      end
      else begin
         Result:=1;
      end;
   end
   else begin
      Result:=AnsiCompareText(FilterName1.FullFileName, FilterName2.FullFileName);
   end;
end;

procedure TFilterNameList.Sort;
begin
   FList.Sort(CompareFilterName);
end;

{ TOrderItem }

procedure TOrderItem.Assign(OrderItem: TOrderItem);
begin
   if OrderItem<>Self then begin
      FFieldPath:=OrderItem.FieldPath;
      FDirection:=OrderItem.Direction;
      FUpperCase:=OrderItem.UpperCase;
   end;
end;

function TOrderItem.Clone: TOrderItem;
begin
   Result:=TOrderItem.Create('', False, False);
   Result.Assign(Self);
end;

constructor TOrderItem.Create(FieldPath: string; Direction, UpperCase: Boolean);
begin
   FFieldPath:=FieldPath;
   FDirection:=Direction;
   FUpperCase:=UpperCase;
end;

destructor TOrderItem.Destroy;
begin
   inherited;
end;

{ TOrderList }

function TOrderList.Add(Item: TOrderItem): Integer;
begin
   Result:=FList.Add(Item);
end;

function TOrderList.AddNew(FieldPath: string; Direction, UpperCase: Boolean): TOrderItem;
begin
   Result:=TOrderItem.Create(FieldPath, Direction, UpperCase);
   Add(Result);
end;

procedure TOrderList.Assign(List: TOrderList);
var
   I: Integer;
   Item: TOrderItem;
begin
   if List<>Self then begin
      Clear;
      if List<>nil then begin
         for I:=0 to Pred(List.Count) do begin
            Item:=List[I];
            if Item<>nil then begin
               AddNew(Item.FieldPath, Item.Direction, Item.UpperCase);
            end;
         end;
      end;
   end;
end;

procedure TOrderList.Clear;
var
   I: Integer;
   Item: TOrderItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

function TOrderList.Clone: TOrderList;
begin
   Result:=TOrderList.Create;
   Result.Assign(Self);
end;

constructor TOrderList.Create;
begin
   FList:=TList.Create;
end;

procedure TOrderList.Delete(Ind: Integer);
var
   Item: TOrderItem;
begin
   Item:=FList[Ind];
   if Item<>nil then begin
      Item.Free;
   end;
   FList.Delete(Ind);
end;

destructor TOrderList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

procedure TOrderList.Exchange(Ind1, Ind2: Integer);
begin
   FList.Exchange(Ind1, Ind2);
end;

function TOrderList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TOrderList.GetItem(Ind: Integer): TOrderItem;
begin
   Result:=TOrderItem(FList[Ind]);
end;

function TOrderList.IndexOfPath(Path: string): Integer;
var
   I: Integer;
   Item: TOrderItem;
begin
   Result:=-1;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (AnsiCompareText(Path, Item.FieldPath)=0) then begin
         Result:=I;
         Break;
      end;
   end;
end;

function TOrderList.Insert(Ind: Integer; Item: TOrderItem): Integer;
begin
   Result:=Ind;
   FList.Insert(Ind, Item);
end;

function TOrderList.InsertNew(Ind: Integer; FieldPath: string; Direction, UpperCase: Boolean): TOrderItem;
begin
   Result:=TOrderItem.Create(FieldPath, Direction, UpperCase);
   Insert(Ind, Result);
end;

function TOrderList.LoadFromString(S: string): Boolean;
var
   sl: TStringList;
   Version: Integer;
   I: Integer;
   Cnt: Integer;
   FieldPath: string;
   Direction: Boolean;
   UpperCase: Boolean;
begin
   Result:=False;
   Clear;
   if S<>'' then begin
      sl:=TStringList.Create;
      try
         sl.CommaText:=S;
         Version:=-1;
         if sl.Count>1 then begin
            Version:=StrToIntDef(sl[0], -1);
         end;
         case Version of
            1: begin
               if sl.Count>1 then begin
                  Cnt:=StrToIntDef(sl[1], -1);
                  if sl.Count=((Cnt*3)+2) then begin
                     for I:=0 to Pred(Cnt) do begin
                        FieldPath:=sl[2+I*3];
                        Direction:=sl[3+I*3]=MapBool[True];
                        UpperCase:=sl[4+I*3]=MapBool[True];
                        AddNew(FieldPath, Direction, UpperCase);
                     end;
                     Result:=True;
                  end;
               end;
            end;
         end;
      finally
         sl.Free;
      end;
   end;
end;

function TOrderList.SaveToString: string;
var
   I: Integer;
   Item: TOrderItem;
   par: TStringList;
begin
   Result:=Format('1,"%d"', [GetCount]);
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         //[2007.10.11]
         //--Result:=Format('%s,"%s","%s","%s"', [Result, Item.FieldPath, MapBool[Item.Direction], MapBool[Item.UpperCase]]);
         par:=TStringList.Create;
         try
            //[2010.06.02] исправлена ошибка чтения/записи сортировки
            //--par.Add(Result);
            par.CommaText:=Result;
            //\\
            par.Add(Item.FieldPath);
            par.Add(MapBool[Item.Direction]);
            par.Add(MapBool[Item.UpperCase]);
            Result:=par.CommaText;
         finally
            par.Free;
         end;
      end;
   end;
end;

{ TValueControlList }

function TValueControlList.Add(Item: TValueControl): Integer;
begin
   Result:=FList.Add(Item);
end;

function TValueControlList.AddNew(Control: TControl; Kinds: TFieldEditKinds; Two, IsValue: Boolean; Field: TFindFieldItem; Find: TFindItem): TValueControl;
begin
   Result:=TValueControl.Create(Control, Kinds, Two, IsValue, Field, Find);
   Add(Result);
end;

procedure TValueControlList.Clear;
var
   I: Integer;
   Item: TValueControl;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

procedure TValueControlList.ClearValue(Find: TFindItem; Kind: TFieldEditKind; ValueKind: TFindValueKind);
var
   I: Integer;
   Item: TValueControl;
begin
   for I:=Pred(GetCount) downto 0 do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Item.Find=Find) and (Kind in Item.Kinds) and Item.IsValue then begin
         Item.ClearValue;
      end;
   end;
end;

constructor TValueControlList.Create;
begin
   FList:=TList.Create;
end;

destructor TValueControlList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

procedure TValueControlList.Disable;
var
   I: Integer;
   Item: TValueControl;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Control.Enabled:=False;
      end;
   end;
end;

function TValueControlList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

procedure TValueControlList.GetFindItemValue(FilterInterface: TFilterInterface; Find: TFindItem; LastValue, LastCaption: string);
begin
   InternalGetValue(
      Find,
      FilterInterface.GetEditKind(Find.Oper, Find.Field, Find.DatePart),
      FilterInterface.GetValueKind(Find.Oper, Find.Field),
      Find.Field,
      Find.Value1,
      Find.Value2,
      Find.OperVal,
      Find.Oper,
      LastValue,
      LastCaption,
      FilterInterface.GetValueSpr(Find.Oper, Find.Field)
   );
end;

function TValueControlList.GetItem(I: Integer): TValueControl;
begin
   Result:=TValueControl(FList[I]);
end;

procedure TValueControlList.GetValue(FilterInterface: TFilterInterface; Find: TFindItem; Field: TFindFieldItem; Value1, Value2, OperVal: TFindValue; Oper: TOperItem; LastValue, LastCaption: string; DatePart: TDateKind);
begin
   InternalGetValue(Find, FilterInterface.GetEditKind(Oper, Field, DatePart), FilterInterface.GetValueKind(Oper, Field), Field, Value1, Value2, OperVal, Oper, LastValue, LastCaption, FilterInterface.GetValueSpr(Oper, Field));
end;

procedure TValueControlList.InitControl(FindItem: TFindItem; EditKind: TFieldEditKind; SprItem: TSprItem);
var
   I: Integer;
   Item: TValueControl;
begin
   for I:=Pred(GetCount) downto 0 do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Item.Find=FindItem) and (EditKind in Item.Kinds) and Item.IsValue then begin
         Item.InitControl(EditKind, SprItem);
      end;
   end;
end;

procedure TValueControlList.InternalGetValue(Find: TFindItem; Kind: TFieldEditKind; ValueKind: TFindValueKind; Field: TFindFieldItem; Value1, Value2, OperVal: TFindValue; Oper: TOperItem; LastValue, LastCaption: string; Spr: TSprItem);
var
   I: Integer;
   Item: TValueControl;
begin
   for I:=Pred(GetCount) downto 0 do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Item.Find=Find) and (Kind in Item.Kinds) and Item.IsValue then begin
         //++ поддержка поиска возраста на дату
         if Oper.NeedValue and (Item.Control is TDBDateTimeEditEh) and (Kind=fekAge) then begin
            OperVal.IsNull:=True;
            OperVal.Kind:=valNone;
            OperVal.ValCaption:='';
            Item.GetValue(OperVal, Kind, ValueKind, LastValue, LastCaption, Spr);
         end
         //\\
         else if Oper.NeedValue and Oper.OwnValue and not Item.Two then begin
            OperVal.IsNull:=True;
            OperVal.Kind:=valNone;
            OperVal.ValCaption:='';
            Item.GetValue(OperVal, Kind, ValueKind, LastValue, LastCaption, Spr);
         end
         else if Oper.NeedValue and not Item.Two then begin
            Value1.IsNull:=True;
            Value1.Kind:=valNone;
            Value1.ValCaption:='';
            Item.GetValue(Value1, Kind, ValueKind, LastValue, LastCaption, Spr);
         end
         else if Oper.NeedValue and Oper.TwoValue and Item.Two then begin
            Value2.IsNull:=True;
            Value2.Kind:=valNone;
            Value2.ValCaption:='';
            Item.GetValue(Value2, Kind, ValueKind, LastValue, LastCaption, Spr);
         end;
      end;
   end;
end;

procedure TValueControlList.Invisible;
var
   I: Integer;
   Item: TValueControl;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Control.Visible:=False;
      end;
   end;
end;

function TValueControlList.IsFindItemValue(FilterInterface: TFilterInterface; Find: TFindItem; DatePart: TDateKind): Boolean;
begin
   Result:=IsValue(
      Find,
      FilterInterface.GetEditKind(Find.Oper, Find.Field, DatePart),
      FilterInterface.GetValueKind(Find.Oper, Find.Field),
      (Find.Oper=nil) or Find.Oper.TwoValue
   );
end;

function TValueControlList.IsValue(Find: TFindItem; Kind: TFieldEditKind; ValueKind: TFindValueKind; Two: Boolean): Boolean;
var
   I: Integer;
   Item: TValueControl;
begin
   Result:=False;
   for I:=Pred(GetCount) downto 0 do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Item.Find=Find) and (Kind in Item.Kinds) and (not Item.Two or (Item.Two=Two)) and Item.IsValue then begin
         if Result then begin
            Result:=Result and not Item.NullValue(ValueKind);
         end
         else begin
            Result:=not Item.NullValue(ValueKind);
         end;
         if not Result then begin
            Break;
         end;
      end;
   end;
end;

function TValueControlList.LastControl(Kind: TFieldEditKind; Two: Boolean): TControl;
var
   I: Integer;
   Item: TValueControl;
begin
   Result:=nil;
   for I:=Pred(GetCount) downto 0 do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Kind in Item.Kinds) and (not Item.Two or (Item.Two=Two)) then begin
         Result:=Item.Control;
         Break;
      end;
   end;
end;

procedure TValueControlList.SetEnable(Kind: TFieldEditKind; Two: Boolean);
var
   I: Integer;
   Item: TValueControl;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Kind in Item.Kinds) and (not Item.Two or (Item.Two=Two)) then begin
         Item.Control.Enabled:=True;
      end
      else begin
         Item.Control.Enabled:=False;
      end;
   end;
end;

procedure TValueControlList.SetFindItemValue(FilterInterface: TFilterInterface; Find: TFindItem; var LastValue, LastCaption: string);
begin
   SetValue(
      Find,
      FilterInterface.GetEditKind(Find.Oper, Find.Field, Find.DatePart),
      Find.Field,
      Find.Value1,
      Find.Value2,
      Find.OperVal,
      Find.Oper,
      LastValue,
      LastCaption,
      FilterInterface.GetValueSpr(Find.Oper, Find.Field)
   );
end;

procedure TValueControlList.SetValue(Find: TFindItem; Kind: TFieldEditKind; Field: TFindFieldItem; Value1, Value2, OperVal: TFindValue; Oper: TOperItem; var LastValue, LastCaption: string; Spr: TSprItem);
var
   I: Integer;
   Item: TValueControl;
begin
   for I:=Pred(GetCount) downto 0 do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Item.Find=Find) and (Kind in Item.Kinds) and Item.IsValue then begin
         //++ поддержка поиска возраста на дату
         if Oper.NeedValue and(Item.Control is TDBDateTimeEditEh) and (Kind=fekAge)  then begin
            Item.SetValue(OperVal, Kind, LastValue, LastCaption, Spr);
         end
         //\\
         else if Oper.NeedValue and Oper.OwnValue and not Item.Two then begin
            Item.SetValue(OperVal, Kind, LastValue, LastCaption, Spr);
         end
         else if Oper.NeedValue and not Item.Two then begin
            Item.SetValue(Value1, Kind, LastValue, LastCaption, Spr);
         end
         else if Oper.NeedValue and Oper.TwoValue and Item.Two then begin
            Item.SetValue(Value2, Kind, LastValue, LastCaption, Spr);
         end;
      end;
   end;
end;

procedure TValueControlList.SetVisible(Kind: TFieldEditKind; Two: Boolean);
var
   I: Integer;
   Item: TValueControl;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Kind in Item.Kinds) and (not Item.Two or (Item.Two=Two)) then begin
         Item.Control.Visible:=True;
      end
      else begin
         Item.Control.Visible:=False;
      end;
   end;
end;

{ TValueControl }

procedure TValueControl.ClearValue;
begin
   if FControl is TEdit then TEdit_ClearValue
   else if FControl is TComboBox then TComboBox_ClearValue
   else if FControl is TDBNumberEditEh then TDBNumberEditEh_ClearValue
   else if FControl is TDBDateTimeEditEh then TDBDateTimeEditEh_ClearValue
   else if FControl is TCheckListBox then TCheckListBox_ClearValue
   else if FControl is TDBLookupComboboxEh then TDBLookupComboboxEh_ClearValue
   else if FControl is TDBEditEh then TDBEditEh_ClearValue;
end;

constructor TValueControl.Create(Control: TControl; Kinds: TFieldEditKinds; Two, IsValue: Boolean; Field: TFindFieldItem; Find: TFindItem);
begin
   FControl:=Control;
   FKinds:=Kinds;
   FTwo:=Two;
   FIsValue:=IsValue;
   FField:=Field;
   FFind:=Find;
end;

destructor TValueControl.Destroy;
begin
   inherited;
end;

procedure TValueControl.GetValue(Value: TFindValue; Kind: TFieldEditKind; ValueKind: TFindValueKind; LastValue, LastCaption: string; Spr: TSprItem);
begin
   if FControl is TEdit then TEdit_GetValue(Value, Kind)
   else if FControl is TComboBox then TComboBox_GetValue(Value, Kind, ValueKind, Spr)
   else if FControl is TDBNumberEditEh then TDBNumberEditEh_GetValue(Value, Kind)
   else if FControl is TDBDateTimeEditEh then TDBDateTimeEditEh_GetValue(Value, Kind)
   else if FControl is TCheckListBox then TCheckListBox_GetValue(Value, Kind, ValueKind, Spr)
   else if FControl is TDBLookupComboboxEh then TDBLookupComboboxEh_GetValue(Value, Kind, ValueKind)
   else if FControl is TDBEditEh then TDBEditEh_GetValue(Value, Kind, ValueKind, LastValue, LastCaption);
end;

procedure TValueControl.InitControl(EditKind: TFieldEditKind; SprItem: TSprItem);
var
   I: Integer;
   ComboBox: TComboBox;
   CheckList: TCheckListBox;
   Lookup: TDBLookupComboboxEh;
begin
   case EditKind of
      fekMonth: if FControl is TComboBox then begin
         ComboBox:=TComboBox(FControl);
         ComboBox.Clear;
         for I:=1 to 12 do begin
            ComboBox.Items.Add(LongMonthNames[I]);
         end;
         ComboBox.DropDownCount:=12;
      end;
      fekBoolean: if FControl is TComboBox then begin
         ComboBox:=TComboBox(FControl);
         ComboBox.Clear;
         ComboBox.Items.CommaText:='Да,Нет';
      end;
      fekCheckList: if FControl is TCheckListBox then  begin
         CheckList:=TCheckListBox(FControl);
         CheckList.Clear;
         if SprItem<>nil then begin
            SprItem.FillStrings(CheckList.Items);
         end;
      end;
      fekLookup: if FControl is TDBLookupComboboxEh then begin
         Lookup:=TDBLookupComboboxEh(FControl);
         if (SprItem<>nil) and (SprItem.DataSet<>nil) and (Lookup.ListSource<>nil) then begin
            Lookup.ListSource.DataSet:=SprItem.DataSet;
            if not SprItem.DataSet.Active then begin
               SprItem.DataSet.Open;
            end;
            SprItem.SetIndexName;//ind
            Lookup.KeyField:=SprItem.KeyFieldName;
            Lookup.ListField:=SprItem.NameFieldName;
         end;
      end;
      fekComboBox: if FControl is TComboBox then begin
         ComboBox:=TComboBox(FControl);
         ComboBox.Clear;
         if SprItem<>nil then begin
            SprItem.FillStrings(ComboBox.Items);
            if ComboBox.Items.Count>CMaxDropDownOper then begin
               ComboBox.DropDownCount:=CMaxDropDownOper;
            end
            else begin
               ComboBox.DropDownCount:=ComboBox.Items.Count;
            end;
         end;
      end;
   end;
end;

function TValueControl.NullValue(ValueKind: TFindValueKind): Boolean;
begin
   Result:=True;
   if FControl is TEdit then Result:=not TEdit_IsValue
   else if FControl is TComboBox then Result:=not TComboBox_IsValue
   else if FControl is TDBNumberEditEh then Result:=not TDBNumberEditEh_IsValue
   else if FControl is TDBDateTimeEditEh then Result:=not TDBDateTimeEditEh_IsValue
   else if FControl is TCheckListBox then Result:=not TCheckListBox_IsValue
   else if FControl is TDBLookupComboboxEh then Result:=not TDBLookupComboboxEh_IsValue
   else if FControl is TDBEditEh then Result:=not TDBEditEh_IsValue(ValueKind);
end;

procedure TValueControl.SetValue(Value: TFindValue; Kind: TFieldEditKind; var LastValue, LastCaption: string; Spr: TSprItem);
begin
   if FControl is TEdit then TEdit_SetValue(Value, Kind)
   else if FControl is TComboBox then TComboBox_SetValue(Value, Kind, Spr)
   else if FControl is TDBNumberEditEh then TDBNumberEditEh_SetValue(Value, Kind)
   else if FControl is TDBDateTimeEditEh then TDBDateTimeEditEh_SetValue(Value, Kind)
   else if FControl is TCheckListBox then TCheckListBox_SetValue(Value, Kind, Spr)
   else if FControl is TDBLookupComboboxEh then TDBLookupComboboxEh_SetValue(Value, Kind, Spr)
   else if FControl is TDBEditEh then TDBEditEh_SetValue(Value, Kind, LastValue, LastCaption);
end;

procedure TValueControl.TCheckListBox_ClearValue;
var
   I: Integer;
   List: TCheckListBox;
begin
   List:=TCheckListBox(FControl);
   for I:=0 to Pred(List.Items.Count) do begin
      List.Checked[I]:=False;
   end;
end;

procedure TValueControl.TCheckListBox_GetValue(Value: TFindValue; Kind: TFieldEditKind; ValueKind: TFindValueKind; Spr: TSprItem);
var
   I: Integer;
   List: TCheckListBox;
begin
   List:=TCheckListBox(FControl);
   if Kind=fekCheckList then begin
      if ValueKind=valString then begin
         Value.Kind:=valStrings
      end
      else if ValueKind=valNumber then begin
         Value.Kind:=valNumbers;
      end;
      if TCheckListBox_IsValue and (Spr<>nil) then begin
         Value.Values.Clear;
         for I:=0 to Pred(List.Items.Count) do begin
            if List.Checked[I] then begin
               Value.Values.Add(Spr.KeyList[I]);
            end;
         end;
         Value.IsNull:=False;
      end
      else begin
         Value.IsNull:=True;
      end;
   end;
end;

function TValueControl.TCheckListBox_IsValue: Boolean;
var
   I: Integer;
   List: TCheckListBox;
begin
   List:=TCheckListBox(FControl);
   Result:=False;
   for I:=0 to Pred(List.Items.Count) do begin
      if List.Checked[I] then begin
         Result:=True;
         Break;
      end;
   end;
end;

procedure TValueControl.TCheckListBox_SetValue(Value: TFindValue; Kind: TFieldEditKind; Spr: TSprItem);
var
   I: Integer;
   Ind: Integer;
   List: TCheckListBox;
begin
   List:=TCheckListBox(FControl);
   if (Kind=fekCheckList) and (Value.Kind in [valStrings, valNumbers]) then begin
      for I:=0 to Pred(List.Items.Count) do begin
         List.Checked[I]:=False;
      end;
      if not Value.IsNull and (Spr<>nil) then begin
         for I:=0 to Pred(Value.Values.Count) do begin
            Ind:=Spr.KeyList.IndexOf(Value.Values[I]);
            if (Ind<>-1) and (Ind<List.Items.Count) then begin
               List.Checked[Ind]:=True;
            end;
         end;
      end;
   end;
end;

procedure TValueControl.TComboBox_ClearValue;
var
   Combo: TComboBox;
begin
   Combo:=TComboBox(FControl);
   Combo.ItemIndex:=-1;
end;

procedure TValueControl.TComboBox_GetValue(Value: TFindValue; Kind: TFieldEditKind; ValueKind: TFindValueKind; Spr: TSprItem);
var
   Combo: TComboBox;
   S: string;
begin
   Combo:=TComboBox(FControl);
   case Kind of
      fekMonth: begin
         Value.Kind:=valNumber;
         Value.ValCaption:=Combo.Text;
         if TComboBox_IsValue then begin
            Value.NumVal:=Succ(Combo.ItemIndex);
            Value.IsNull:=False;
         end
         else begin
            Value.IsNull:=True;
         end;
      end;
      fekBoolean: begin
         Value.Kind:=valBoolean;
         if TComboBox_IsValue then begin
            Value.BoolVal:=False;
            if Combo.Text='Да' then begin
               Value.BoolVal:=True;
            end;
            Value.IsNull:=False;
         end
         else begin
            Value.IsNull:=True;
         end;
      end;
      fekComboBox: begin
         if ValueKind=valString then begin
            Value.Kind:=valString;
         end
         else if ValueKind=valNumber then begin
            Value.Kind:=valNumber;
         end;
         if TComboBox_IsValue and (Spr<>nil) then begin
            Value.IsNull:=False;
            S:=Spr.KeyList[Combo.ItemIndex];
            Value.ValCaption:=Combo.Text;
            if ValueKind=valString then begin
               Value.StrVal:=S;
            end
            else if ValueKind=valNumber then begin
               Value.NumVal:=StrToIntDef(S, -1);
               Value.IsNull:=Value.NumVal=-1;
            end;
         end
         else begin
            Value.IsNull:=True;
            Value.ValCaption:='';
         end;
      end;
   end;
end;

function TValueControl.TComboBox_IsValue: Boolean;
var
   Combo: TComboBox;
begin
   Combo:=TComboBox(FControl);
   Result:=Combo.ItemIndex<>-1;
end;

procedure TValueControl.TComboBox_SetValue(Value: TFindValue; Kind: TFieldEditKind; Spr: TSprItem);
var
   Combo: TComboBox;
begin
   Combo:=TComboBox(FControl);
   if (Kind=fekBoolean) and (Value.Kind=valBoolean) then begin
      if Value.IsNull then begin
         Combo.ItemIndex:=-1;
      end
      else if Value.BoolVal then begin
         Combo.ItemIndex:=0
      end
      else begin
         Combo.ItemIndex:=1
      end;
   end
   else if (Kind=fekMonth) and (Value.Kind=valNumber) then begin
      if Value.IsNull then begin
         Combo.ItemIndex:=-1;
      end
      else begin
         Combo.ItemIndex:=Pred(Value.NumVal);
      end;
   end
   else if (Kind=fekComboBox) and (Value.Kind=valString) then begin
      if Value.IsNull or (Spr=nil) then begin
         Combo.ItemIndex:=-1;
      end
      else begin
         Combo.ItemIndex:=Spr.KeyList.IndexOf(Value.StrVal);
      end;
   end
   else if (Kind=fekComboBox) and (Value.Kind=valNumber) then begin
      if Value.IsNull or (Spr=nil) then begin
         Combo.ItemIndex:=-1;
      end
      else begin
         Combo.ItemIndex:=Spr.KeyList.IndexOf(IntToStr(Value.NumVal));
      end;
   end;
end;

procedure TValueControl.TDBDateTimeEditEh_ClearValue;
var
   Edit: TDBDateTimeEditEh;
begin
   Edit:=TDBDateTimeEditEh(FControl);
   Edit.Value:=Null;
end;

procedure TValueControl.TDBDateTimeEditEh_GetValue(Value: TFindValue; Kind: TFieldEditKind);
var
   Edit: TDBDateTimeEditEh;
begin
   Edit:=TDBDateTimeEditEh(FControl);
   if Kind in [fekDate, fekAge] then begin
      Value.Kind:=valDate;
      if TDBDateTimeEditEh_IsValue then begin
         Value.DateVal:=Edit.Value;
         Value.IsNull:=False;
      end
      else begin
         Value.IsNull:=True;
      end;
   end;
end;

function TValueControl.TDBDateTimeEditEh_IsValue: Boolean;
var
   Edit: TDBDateTimeEditEh;
begin
   Edit:=TDBDateTimeEditEh(FControl);
   Result:=Edit.Value<>Null;
end;

procedure TValueControl.TDBDateTimeEditEh_SetValue(Value: TFindValue; Kind: TFieldEditKind);
var
   Edit: TDBDateTimeEditEh;
begin
   Edit:=TDBDateTimeEditEh(FControl);
   if (Kind in [fekDate, fekAge]) and (Value.Kind=valDate) then begin
      if Value.IsNull then begin
         Edit.Value:=Null;
      end
      else begin
         Edit.Value:=Value.DateVal;
      end;
   end;
end;

procedure TValueControl.TDBEditEh_ClearValue;
var
   Edit: TDBEditEh;
begin
   Edit:=TDBEditEh(FControl);
   Edit.Value:=Null;
end;

procedure TValueControl.TDBEditEh_GetValue(Value: TFindValue; Kind: TFieldEditKind; ValueKind: TFindValueKind; LastValue, LastCaption: string);
var
   Edit: TDBEditEh;
   S: string;
begin
   Edit:=TDBEditEh(FControl);
   if Kind=fekGridW then begin
      if ValueKind=valString then begin
         Value.Kind:=valString;
      end
      else if ValueKind=valNumber then begin
         Value.Kind:=valNumber;
      end;
      if TDBEditEh_IsValue(ValueKind) then begin
         S:=Edit.Value;
         Value.ValCaption:=LastCaption;
         if ValueKind=valString then begin
            Value.StrVal:=S;
         end
         else if ValueKind=valNumber then begin
            Value.NumVal:=StrToIntDef(S, -1);
            Value.IsNull:=Value.NumVal=-1;
         end;
         Value.IsNull:=False;
      end
      else begin
         Value.ValCaption:='';
         Value.IsNull:=True;
      end;
   end
   else if Kind=fekGridW2 then begin
      if ValueKind=valString then begin
         Value.Kind:=valString;
      end
      else if ValueKind=valNumber then begin
         Value.Kind:=valNumber;
      end;
      if LastValue<>'' then begin
         Value.ValCaption:=LastCaption;
         if ValueKind=valString then begin
            Value.StrVal:=LastValue;
         end
         else if ValueKind=valNumber then begin
            Value.NumVal:=StrToIntDef(LastValue, -1);
            Value.IsNull:=Value.NumVal=-1;
         end;
         Value.IsNull:=False;
      end
      else begin
         Value.ValCaption:='';
         Value.IsNull:=True;
      end;
   end;
end;

function TValueControl.TDBEditEh_IsValue(ValueKind: TFindValueKind): Boolean;
var
   Edit: TDBEditEh;
begin
   Edit:=TDBEditEh(FControl);
   Result:=((Edit.Value<>Null) and (Edit.Value<>''));
   if Result and (ValueKind=valNumber) and (FKinds<>[fekGridW2]) then begin
      Result:=StrToIntDef(Edit.Value, -1)<>-1;
   end;
end;

procedure TValueControl.TDBEditEh_SetValue(Value: TFindValue; Kind: TFieldEditKind; var LastValue, LastCaption: string);
var
   Edit: TDBEditEh;
begin
   Edit:=TDBEditEh(FControl);
   if (Kind=fekGridW) and (Value.Kind=valString) then begin
      if Value.IsNull then begin
         Edit.Value:=Null;
      end
      else begin
         Edit.Value:=Value.StrVal;
         LastCaption:=Value.ValCaption;
      end;
   end
   else if (Kind=fekGridW) and (Value.Kind=valNumber) then begin
      if Value.IsNull then begin
         Edit.Value:=Null;
      end
      else begin
         Edit.Value:=Value.NumVal;
         LastCaption:=Value.ValCaption;
      end;
   end
   else if (Kind=fekGridW2) and (Value.Kind=valString) then begin
      if Value.IsNull then begin
         Edit.Text:='';
         LastValue:='';
         LastCaption:='';
      end
      else begin
         LastValue:=Value.StrVal;
         LastCaption:=Value.ValCaption;
         Edit.Text:=LastCaption;
      end;
   end
   else if (Kind=fekGridW2) and (Value.Kind=valNumber) then begin
      if Value.IsNull then begin
         Edit.Text:='';
         LastValue:='';
         LastCaption:='';
      end
      else begin
         LastValue:=Value.StrVal;
         LastCaption:=Value.ValCaption;
         Edit.Text:=LastCaption;
      end;
   end;
end;

procedure TValueControl.TDBLookupComboboxEh_ClearValue;
var
   Combo: TDBLookupComboboxEh;
begin
   Combo:=TDBLookupComboboxEh(FControl);
   Combo.Value:=Null;
end;

procedure TValueControl.TDBLookupComboboxEh_GetValue(Value: TFindValue; Kind: TFieldEditKind; ValueKind: TFindValueKind);
var
   Combo: TDBLookupComboboxEh;
   S: string;
begin
   Combo:=TDBLookupComboboxEh(FControl);
   if Kind=fekLookup then begin
      if ValueKind=valString then begin
         Value.Kind:=valString;
      end
      else if ValueKind=valNumber then begin
         Value.Kind:=valNumber;
      end;
      if TDBLookupComboboxEh_IsValue then begin
         S:=Combo.Value;
         Value.ValCaption:=Combo.Text;
         Value.IsNull:=False;
         if ValueKind=valString then begin
            Value.StrVal:=S;
         end
         else if ValueKind=valNumber then begin
            Value.NumVal:=StrToIntDef(S, -1);
            Value.IsNull:=Value.NumVal=-1;
         end;
      end
      else begin
         Value.ValCaption:='';
         Value.IsNull:=True;
      end;
   end;
end;

function TValueControl.TDBLookupComboboxEh_IsValue: Boolean;
var
   Combo: TDBLookupComboboxEh;
begin
   Combo:=TDBLookupComboboxEh(FControl);
   Result:=Combo.Value<>Null;
end;

procedure TValueControl.TDBLookupComboboxEh_SetValue(Value: TFindValue; Kind: TFieldEditKind; Spr: TSprItem);
var
   Combo: TDBLookupComboboxEh;
begin
   Combo:=TDBLookupComboboxEh(FControl);
   if (Kind=fekLookup) and (Value.Kind=valString) then begin
      if Value.IsNull or (Spr=nil) then begin
         Combo.Value:=Null;
      end
      else begin
         Combo.Value:=Value.StrVal;
      end;
   end
   else if (Kind=fekLookup) and (Value.Kind=valNumber) then begin
      if Value.IsNull or (Spr=nil) then begin
         Combo.Value:=Null;
      end
      else begin
         Combo.Value:=Value.NumVal;
      end;
   end;
end;

procedure TValueControl.TDBNumberEditEh_ClearValue;
var
   Edit: TDBNumberEditEh;
begin
   Edit:=TDBNumberEditEh(FControl);
   Edit.Value:=Null;
end;

procedure TValueControl.TDBNumberEditEh_GetValue(Value: TFindValue; Kind: TFieldEditKind);
var
   Edit: TDBNumberEditEh;
begin
   Edit:=TDBNumberEditEh(FControl);
   case Kind of
      fekNumber, fekList, fekAge: begin
         Value.Kind:=valNumber;
         if TDBNumberEditEh_IsValue then begin
            Value.NumVal:=Edit.Value;
            Value.IsNull:=False;
         end
         else begin
            Value.IsNull:=True;
         end;
      end;
      fekFloat: begin
         Value.Kind:=valFloat;
         if TDBNumberEditEh_IsValue then begin
            Value.IsNull:=False;
            Value.ExtVal:=Edit.Value;
         end
         else begin
            Value.IsNull:=True;
         end;
      end;
   end;
end;

function TValueControl.TDBNumberEditEh_IsValue: Boolean;
var
   Edit: TDBNumberEditEh;
begin
   Edit:=TDBNumberEditEh(FControl);
   Result:=Edit.Value<>Null;
end;

procedure TValueControl.TDBNumberEditEh_SetValue(Value: TFindValue; Kind: TFieldEditKind);
var
   Edit: TDBNumberEditEh;
begin
   Edit:=TDBNumberEditEh(FControl);
   if (Kind=fekFloat) and (Value.Kind=valFloat) then begin
      if Value.IsNull then begin
         Edit.Value:=Null;
      end
      else begin
         Edit.Value:=Value.ExtVal;
      end;
   end
   else if (Kind in [fekNumber, fekList, fekAge]) and (Value.Kind=valNumber) then begin
      if Value.IsNull then begin
         Edit.Value:=Null;
      end
      else begin
         Edit.Value:=Value.NumVal;
      end;
   end;
end;

procedure TValueControl.TEdit_ClearValue;
var
   Edit: TEdit;
begin
   Edit:=TEdit(Control);
   Edit.Text:='';
end;

procedure TValueControl.TEdit_GetValue(Value: TFindValue; Kind: TFieldEditKind);
var
   Edit: TEdit;
begin
   Edit:=TEdit(Control);
   if Kind=fekString then begin
      Value.Kind:=valString;
      if TEdit_IsValue then begin
         Value.StrVal:=Edit.Text;
         Value.IsNull:=False;
      end
      else begin
         Value.IsNull:=True;
      end;
   end;
end;

function TValueControl.TEdit_IsValue: Boolean;
var
   Edit: TEdit;
begin
   Edit:=TEdit(Control);
   Result:=Trim(Edit.Text)<>'';
end;

procedure TValueControl.TEdit_SetValue(Value: TFindValue; Kind: TFieldEditKind);
var
   Edit: TEdit;
begin
   Edit:=TEdit(Control);
   if (Kind=fekString) and (Value.Kind=valString) then begin
      if Value.IsNull then begin
         Edit.Text:='';
      end
      else begin
         Edit.Text:=Value.StrVal;
      end;
   end;
end;

function GetTextWidth(Text: string; FontSize: Integer; FontName: string; Bold: Boolean): Integer;
var
   dc: HDC;
   font: HFONT;
   old: HFONT;
   lf: LOGFONT;
   sz: SIZE;
begin
   lf.lfHeight:=FontSize;
   lf.lfWidth:=0;
   lf.lfEscapement:=0;
   lf.lfOrientation:=0;
   if Bold then begin
      lf.lfWeight:=FW_BOLD;
   end
   else begin
      lf.lfWeight:=FW_NORMAL;
   end;
   lf.lfItalic:=Byte(0);
   lf.lfUnderline:=Byte(0);
   lf.lfStrikeOut:=Byte(0);
   lf.lfCharSet:=RUSSIAN_CHARSET;
   lf.lfOutPrecision:=OUT_DEFAULT_PRECIS;
   lf.lfClipPrecision:=CLIP_DEFAULT_PRECIS;
   lf.lfQuality:=DEFAULT_QUALITY;
   lf.lfPitchAndFamily:=DEFAULT_PITCH;
   StrPCopy(lf.lfFaceName, FontName);
   dc:=CreateCompatibleDC(0);
   font:=CreateFontIndirect(lf);
   old:=SelectObject(dc, font);
   try
      GetTextExtentPoint32(dc, PChar(Text), Length(Text), sz);
   finally
      SelectObject(dc, old);
      DeleteDC(dc);
      DeleteObject(font);
   end;
   Result:=sz.cx;
end;

function GetFontHeight(FontSize: Integer; FontName: string): Integer;
var
   dc: HDC;
   font: HFONT;
   old: HFONT;
   lf: LOGFONT;
   tm: TEXTMETRIC;
begin
   lf.lfHeight:=FontSize;
   lf.lfWidth:=0;
   lf.lfEscapement:=0;
   lf.lfOrientation:=0;
   lf.lfWeight:=FW_NORMAL;
   lf.lfItalic:=Byte(0);
   lf.lfUnderline:=Byte(0);
   lf.lfStrikeOut:=Byte(0);
   lf.lfCharSet:=RUSSIAN_CHARSET;
   lf.lfOutPrecision:=OUT_DEFAULT_PRECIS;
   lf.lfClipPrecision:=CLIP_DEFAULT_PRECIS;
   lf.lfQuality:=DEFAULT_QUALITY;
   lf.lfPitchAndFamily:=DEFAULT_PITCH;
   StrPCopy(lf.lfFaceName, FontName);
   dc:=CreateCompatibleDC(0);
   font:=CreateFontIndirect(lf);
   old:=SelectObject(dc, font);
   try
      GetTextMetrics(dc, tm);
   finally
      SelectObject(dc, old);
      DeleteDC(dc);
      DeleteObject(font);
   end;
   Result:=tm.tmHeight;
end;

function GetAveCharSizeR(Canvas: TCanvas): TPoint;
var
   I: Integer;
   Buffer: array[0..115] of Char;
begin
   for I:=0 to 25 do begin
      Buffer[I]:=Chr(I+Ord('A'));
   end;
   for I:=0 to 25 do begin
      Buffer[I+26]:=Chr(I + Ord('a'));
   end;
   for I:=0 to 47 do begin
      Buffer[I+52]:=Chr(I+Ord('А'));
   end;
   for I:=0 to 15 do begin
      Buffer[I+100]:=Chr(I+Ord('р'));
   end;
   GetTextExtentPoint(Canvas.Handle, Buffer, 116, TSize(Result));
   Result.X:=Result.X div 116;
end;

function InputQueryR(const ACaption, APrompt: string; var Value: string): Boolean;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  ButtonTop: Integer;
  ButtonWidth: Integer;
  ButtonHeight: Integer;
begin
   Result:=False;
   Form:=TForm.Create(Application);
   with Form do begin
      try
         Canvas.Font:=Font;
         DialogUnits:=GetAveCharSizeR(Canvas);
         BorderStyle:=bsDialog;
         Caption:=ACaption;
         ClientWidth:=MulDiv(180, DialogUnits.X, 4);
         ClientHeight:=MulDiv(63, DialogUnits.Y, 8);
         Position:=poScreenCenter;
         Prompt:=TLabel.Create(Form);
         with Prompt do begin
            Parent:=Form;
            AutoSize:=True;
            Left:=MulDiv(8, DialogUnits.X, 4);
            Top:=MulDiv(8, DialogUnits.Y, 8);
            Caption:=APrompt;
         end;
         Edit:=TEdit.Create(Form);
         with Edit do begin
            Parent:=Form;
            Left:=Prompt.Left;
            Top:=MulDiv(19, DialogUnits.Y, 8);
            Width:=MulDiv(164, DialogUnits.X, 4);
            MaxLength:=255;
            Text:=Value;
            SelectAll;
         end;
         ButtonTop:=MulDiv(41, DialogUnits.Y, 8);
         ButtonWidth:=MulDiv(50, DialogUnits.X, 4);
         ButtonHeight:=MulDiv(14, DialogUnits.Y, 8);
         with TButton.Create(Form) do begin
            Parent:=Form;
            Caption:='ОК';
            ModalResult:=mrOk;
            Default:=True;
            SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth, ButtonHeight);
         end;
         with TButton.Create(Form) do begin
            Parent:=Form;
            Caption:='Отмена';
            ModalResult:=mrCancel;
            Cancel:=True;
            SetBounds(MulDiv(92, DialogUnits.X, 4), ButtonTop, ButtonWidth, ButtonHeight);
         end;
         if ShowModal=mrOk then begin
            Value:=Edit.Text;
            Result:=True;
         end;
      finally
         Form.Free;
      end;
   end;
end;

function MakeLangID(PrimaryLang, SubLang: Word): Word;
begin
   Result:=(SubLang shl 10) or PrimaryLang;
end;

function MakeLCID(LangID, SortID: LongWord): LongWord;
begin
   Result:=(SortID shl 16) or LangID;
end;

function ENG_LCID: LongWord;
begin
   Result:=MakeLCID(MakeLangID(LANG_ENGLISH, SUBLANG_DEFAULT), SORT_DEFAULT);
end;

function RUS_LCID: LongWord;
begin
   Result:=MakeLCID(MakeLangID(LANG_RUSSIAN, SUBLANG_DEFAULT), SORT_DEFAULT);
end;

type
   TMessageFormR=class(TForm)
   public
      constructor CreateNew(AOwner: TComponent); reintroduce;
   end;

constructor TMessageFormR.CreateNew(AOwner: TComponent);
var
   NonClientMetrics: TNonClientMetrics;
begin
   inherited CreateNew(AOwner);
   NonClientMetrics.cbSize:=sizeof(NonClientMetrics);
   if SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @NonClientMetrics, 0) then begin
      Font.Handle:=CreateFontIndirect(NonClientMetrics.lfMessageFont);
   end;
end;

var
   Captions: array [TMsgDlgType] of string=('Предупреждение', 'Ошибка', 'Информация', 'Подтверждение', '');
   IconIDs: array [TMsgDlgType] of PChar=(IDI_EXCLAMATION, IDI_HAND, IDI_ASTERISK, IDI_QUESTION, nil);
   ButtonNames: array [TMsgDlgBtn] of string=('Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry', 'Ignore', 'All', 'NoToAll', 'YesToAll', 'Help');
   ButtonCaptions: array [TMsgDlgBtn] of string=('&Да', '&Нет', '&ОК', 'О&тмена', 'П&рервать', '&Повторить', '&Игнорировать', '&Все', 'Н&ет для всего', 'Д&а для всего', 'По&мощь');
   ModalResults: array [TMsgDlgBtn] of Integer=(mrYes, mrNo, mrOk, mrCancel, mrAbort, mrRetry, mrIgnore, mrAll, mrNoToAll, mrYesToAll, 0);

var
   ButtonWidths : array [TMsgDlgBtn] of Integer;

function Max(I, J: Integer): Integer;
begin
   if I>J then begin
      Result:=I;
   end
   else begin
      Result:=J;
   end;
end;

function CreateMessageDialogR(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons): TForm;
const
   mcHorzMargin = 8;
   mcVertMargin = 8;
   mcHorzSpacing = 10;
   mcVertSpacing = 10;
   mcButtonWidth = 50;
   mcButtonHeight = 14;
   mcButtonSpacing = 4;
var
   DialogUnits: TPoint;
   HorzMargin: Integer;
   VertMargin: Integer;
   HorzSpacing: Integer;
   VertSpacing: Integer;
   ButtonWidth: Integer;
   ButtonHeight: Integer;
   ButtonSpacing: Integer;
   ButtonCount: Integer;
   ButtonGroupWidth: Integer;
   IconTextWidth: Integer;
   IconTextHeight: Integer;
   X: Integer;
   ALeft: Integer;
   B: TMsgDlgBtn;
   DefaultButton: TMsgDlgBtn;
   CancelButton: TMsgDlgBtn;
   IconID: PChar;
   TextRect: TRect;
begin
   Result:=TMessageFormR.CreateNew(Application);
   with Result do begin
      BiDiMode:=Application.BiDiMode;
      BorderStyle:=bsDialog;
      Canvas.Font:=Font;
      DialogUnits:=GetAveCharSizeR(Canvas);
      HorzMargin:=MulDiv(mcHorzMargin, DialogUnits.X, 4);
      VertMargin:=MulDiv(mcVertMargin, DialogUnits.Y, 8);
      HorzSpacing:=MulDiv(mcHorzSpacing, DialogUnits.X, 4);
      VertSpacing:=MulDiv(mcVertSpacing, DialogUnits.Y, 8);
      ButtonWidth:=MulDiv(mcButtonWidth, DialogUnits.X, 4);
      for B:=Low(TMsgDlgBtn) to High(TMsgDlgBtn) do begin
         if B in Buttons then begin
            if ButtonWidths[B]=0 then begin
               TextRect:=Rect(0, 0, 0, 0);
               Windows.DrawText(Canvas.Handle, PChar(ButtonCaptions[B]), -1, TextRect, DT_CALCRECT or DT_LEFT or DT_SINGLELINE or DrawTextBiDiModeFlagsReadingOnly);
               with TextRect do begin
                  ButtonWidths[B]:=Right-Left+8;
               end;
            end;
            if ButtonWidths[B]>ButtonWidth then begin
               ButtonWidth:=ButtonWidths[B];
            end;
         end;
      end;
      ButtonHeight:=MulDiv(mcButtonHeight, DialogUnits.Y, 8);
      ButtonSpacing:=MulDiv(mcButtonSpacing, DialogUnits.X, 4);
      SetRect(TextRect, 0, 0, Screen.Width div 2, 0);
      DrawText(Canvas.Handle, PChar(Msg), Length(Msg)+1, TextRect, DT_EXPANDTABS or DT_CALCRECT or DT_WORDBREAK or DrawTextBiDiModeFlagsReadingOnly);
      IconID:=IconIDs[DlgType];
      IconTextWidth:=TextRect.Right;
      IconTextHeight:=TextRect.Bottom;
      if IconID<>nil then begin
         Inc(IconTextWidth, 32+HorzSpacing);
         if IconTextHeight<32 then begin
            IconTextHeight:=32;
         end;
      end;
      ButtonCount:=0;
      for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do begin
         if B in Buttons then begin
            Inc(ButtonCount);
         end;
      end;
      ButtonGroupWidth:=0;
      if ButtonCount<>0 then begin
         ButtonGroupWidth:=ButtonWidth*ButtonCount+ButtonSpacing*(ButtonCount-1);
      end;
      ClientWidth:=Max(IconTextWidth, ButtonGroupWidth)+HorzMargin*2;
      ClientHeight:=IconTextHeight+ButtonHeight+VertSpacing+VertMargin*2;
      Left:=(Screen.Width div 2)-(Width div 2);
      Top:=(Screen.Height div 2)-(Height div 2);
      if DlgType<>mtCustom then begin
         Caption:=Captions[DlgType];
      end
      else begin
         Caption:=Application.Title;
      end;
      if IconID<>nil then begin
         with TImage.Create(Result) do begin
            Name:='Image';
            Parent:=Result;
            Picture.Icon.Handle:=LoadIcon(0, IconID);
            SetBounds(HorzMargin, VertMargin, 32, 32);
         end;
      end;
      with TLabel.Create(Result) do begin
         Name:='Message';
         Parent:=Result;
         WordWrap:=True;
         Caption:=Msg;
         BoundsRect:=TextRect;
         BiDiMode:=Result.BiDiMode;
         ALeft:=IconTextWidth-TextRect.Right+HorzMargin;
         if UseRightToLeftAlignment then begin
            ALeft:=Result.ClientWidth-ALeft-Width;
         end;
         SetBounds(ALeft, VertMargin, TextRect.Right, TextRect.Bottom);
      end;
      if mbOk in Buttons then DefaultButton := mbOk
      else if mbYes in Buttons then DefaultButton := mbYes
      else DefaultButton := mbRetry;
      if mbCancel in Buttons then CancelButton := mbCancel
      else if mbNo in Buttons then CancelButton := mbNo
      else CancelButton := mbOk;
      X:=(ClientWidth-ButtonGroupWidth) div 2;
      for B:=Low(TMsgDlgBtn) to High(TMsgDlgBtn) do begin
         if B in Buttons then begin
            with TButton.Create(Result) do begin
               Name:=ButtonNames[B];
               Parent:=Result;
               Caption:=ButtonCaptions[B];
               ModalResult:=ModalResults[B];
               if B=DefaultButton then begin
                  Default:=True;
               end;
               if B=CancelButton then begin
                  Cancel:=True;
               end;
               SetBounds(X, IconTextHeight+VertMargin+VertSpacing, ButtonWidth, ButtonHeight);
               Inc(X, ButtonWidth+ButtonSpacing);
            end;
         end;
      end;
   end;
end;

function MessageDlgR(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): Integer;
begin
   with CreateMessageDialogR(Msg, DlgType, Buttons) do begin
      try
         Position:=poScreenCenter;
         Result:=ShowModal;
      finally
         Free;
      end;
   end;
end;

{ TFilterUndoItem }

constructor TFilterUndoItem.Create(Filter: TFindList; TopIndex, SelIndex: Integer; ActionKind: TUndoActionKind);
begin
   FFilter:=TFindList.Create('', '', '', False);
   FFilter.Assign(Filter);
   FTopIndex:=TopIndex;
   FSelIndex:=SelIndex;
   FActionKind:=ActionKind;
end;

destructor TFilterUndoItem.Destroy;
begin
   FFilter.Free;
   inherited;
end;

{ TFilterUndoList }

procedure TFilterUndoList.Add(Item: TFilterUndoItem);
begin
   FList.Add(Item);
end;

procedure TFilterUndoList.AddNew(Filter: TFindList; TopIndex, SelIndex: Integer; ActionKind: TUndoActionKind);
var
   Item: TFilterUndoItem;
begin
   if GetCount=FMax then begin
      Delete(0);
   end;
   Item:=TFilterUndoItem.Create(Filter, TopIndex, SelIndex, ActionKind);
   Add(Item);
end;

procedure TFilterUndoList.Clear;
var
   I: Integer;
   Item: TFilterUndoItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

constructor TFilterUndoList.Create(Max: Integer);
begin
   FList:=TList.Create;
   FMax:=Max;
end;

procedure TFilterUndoList.Delete(I: Integer);
var
   Item: TFilterUndoItem;
begin
   Item:=GetItem(I);
   Item.Free;
   FList.Delete(I);
end;

procedure TFilterUndoList.DeleteLast;
begin
   if GetCount>0 then begin
      Delete(Pred(GetCount));
   end;
end;

destructor TFilterUndoList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TFilterUndoList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TFilterUndoList.GetItem(I: Integer): TFilterUndoItem;
begin
   Result:=TFilterUndoItem(FList[I]);
end;

function TFilterUndoList.Last: TFilterUndoItem;
begin
   if GetCount>0 then begin
      Result:=GetItem(Pred(GetCount));
   end
   else begin
      Result:=nil;
   end;
end;

function GetComboBoxNonTextArea: Integer;
begin
   Result:=GetSystemMetrics(SM_CXVSCROLL)+2*(GetSystemMetrics(SM_CYBORDER)+GetSystemMetrics(SM_CXDLGFRAME))+2;
end;

function GetComboBoxHint(Text: string; cb: TComboBox; IsBold: Boolean): string;
var
   B: Integer;
begin
   B:=GetComboBoxNonTextArea;
   B:=B+GetTextWidth(Text, cb.Font.Height, cb.Font.Name, IsBold);
   if B>=cb.Width then begin
      Result:=Text;
   end
   else begin
      Result:='';
   end;
end;

procedure SetComboBoxDropDownWidth(cb: TComboBox; MaxWidth: Integer; GetItemCaption: TGetItemCaption);
var
   I: Integer;
   B: Integer;
   W: Integer;
   MaxW: Integer;
   S: string;
   IsBold: Boolean;
   AddWidth: Integer;
begin
   // поиск максимальной по длине строки
   MaxW:=cb.ClientWidth;
   for I:=0 to Pred(cb.Items.Count) do begin
      AddWidth:=0;
      IsBold:=False;
      if Assigned(GetItemCaption) then begin
        S:=GetItemCaption(cb.Items, I, AddWidth, IsBold);
      end
      else begin
         S:=cb.Items[I];
      end;
      B:=AddWidth+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXBORDER);
      W:=GetTextWidth(S, cb.Font.Height, cb.Font.Name, IsBold)+B;
      if W>MaxW then begin
         MaxW:=W;
      end;
   end;
   if MaxW>MaxWidth then begin
      MaxW:=MaxWidth;
   end;
   cb.Perform(CB_SETDROPPEDWIDTH, MaxW, 0);
end;

procedure SetComboBoxHeight(cb: TComboBox; AddHeight: Integer);
var
   H: Integer;
begin
   H:=GetFontHeight(cb.Font.Height, cb.Font.Name);
   cb.ItemHeight:=H+3+AddHeight;
end;

procedure SetListBoxHeight(lb: TListBox);
var
   H: Integer;
begin
   H:=GetFontHeight(lb.Font.Height, lb.Font.Name);
   lb.ItemHeight:=H+3;
end;

procedure SetListBoxMaxWidth(lb: TListBox; AddWidth: Integer; IsBold: Boolean);
var
   I: Integer;
   B: Integer;
   W: Integer;
   MaxW: Integer;
   S: string;
begin
   B:=GetSystemMetrics(SM_CXVSCROLL)+AddWidth;
   MaxW:=lb.ClientWidth-B;
   for I:=0 to Pred(lb.Items.Count) do begin
      S:=lb.Items[I];
      W:=GetTextWidth(S, lb.Font.Height, lb.Font.Name, IsBold);
      if MaxW<W then begin
         MaxW:=W;
      end;
   end;
   MaxW:=MaxW+B;
   lb.Perform(LB_SETHORIZONTALEXTENT, MaxW, 0);
end;

procedure AddControlStyle(Control: TControl; Style: TControlStyle);
var
   I: Integer;
   win: TWinControl;
begin
   Control.ControlStyle:=Control.ControlStyle+Style;
   if Control is TWinControl then begin
      win:=TWinControl(Control);
      for I:=0 to Pred(win.ControlCount) do begin
         AddControlStyle(win.Controls[I], Style);
      end;
   end;
end;

function StringToDate(S: string): TDateTime;
begin
   Result:=EncodeDate(StrToInt(Copy(S, 1, 4)), StrToInt(Copy(S, 5, 2)), StrToInt(Copy(S, 7, 2)));
end;

function DateToString(D: TDateTime): string;
begin
   Result:=FormatDateTime('YYYYMMDD', D);
end;

{ TGroupItem }

procedure TGroupItem.Assign(GroupItem: TGroupItem);
begin
   if GroupItem<>Self then begin
      FFieldName:=GroupItem.FieldName;
      FTitle:=GroupItem.Title;
      FFieldPath:=GroupItem.FieldPath;
      FIsVisible:=GroupItem.IsVisible;
      FDateKind:=GroupItem.DateKind;
      FWidth:=GroupItem.Width;
   end;
end;

function TGroupItem.Clone: TGroupItem;
begin
   Result:=TGroupItem.Create('', '', '', True, -1);
   Result.Assign(Self);
end;

constructor TGroupItem.Create(FieldName, Title, FieldPath: string; IsVisible: Boolean; Width: Integer);
begin
   FFieldName:=FieldName;
   FTitle:=Title;
   FFieldPath:=FieldPath;
   FIsVisible:=IsVisible;
   FDateKind:=dkFull;
   FWidth:=Width;
end;

destructor TGroupItem.Destroy;
begin
   inherited;
end;

function TGroupItem.LoadFromString(S: string): Boolean;
var
   sl: TStringList;
   Version: Integer;
begin
   Result:=False;
   if S<>'' then begin
      sl:=TStringList.Create;
      try
         sl.CommaText:=S;
         Version:=-1;
         if sl.Count>1 then begin
            Version:=StrToIntDef(sl[0], -1);
         end;
         case Version of
            1: if (sl.Count=7) and (sl[1]='GRPITEM') then begin
               FTitle:=Trim(sl[2]);
               FFieldPath:=Trim(sl[3]);
               FIsVisible:=Trim(sl[4])=MapBool[True];
               FFieldName:=Trim(sl[5]);
               FDateKind:=TDateKind(GetEnumValue(TypeInfo(TDateKind), Trim(sl[6])));
               Result:=True;
            end;
            2: if (sl.Count=8) and (sl[1]='GRPITEM') then begin
               FTitle:=Trim(sl[2]);
               FFieldPath:=Trim(sl[3]);
               FIsVisible:=Trim(sl[4])=MapBool[True];
               FFieldName:=Trim(sl[5]);
               FDateKind:=TDateKind(GetEnumValue(TypeInfo(TDateKind), Trim(sl[6])));
               FWidth:=StrToIntDef(sl[7], -1);
               Result:=True;
            end;
         end;
      finally
         sl.Free;
      end;
   end;
end;

function TGroupItem.SaveToString: string;
var
   par: TStringList;
begin
   // версия 2: +FWidth
   //[2007.10.11]
   //--Result:=Format('2,GRPITEM,"%s","%s","%s","%s","%s","d"', [FTitle, FFieldPath, MapBool[FIsVisible], FFieldName, GetEnumName(TypeInfo(TDateKind), Ord(FDateKind)), FWidth]);
   par:=TStringList.Create;
   try
      par.Add('2');
      par.Add('GRPITEM');
      par.Add(FTitle);
      par.Add(FFieldPath);
      par.Add(MapBool[FIsVisible]);
      par.Add(FFieldName);
      par.Add(GetEnumName(TypeInfo(TDateKind), Ord(FDateKind)));
      par.Add(IntToStr(FWidth));
      Result:=par.CommaText;
   finally
      par.Free;
   end;
end;

{ TGroupList }

function TGroupList.Add(Item: TGroupItem): Integer;
begin
   Result:=FList.Add(Item);
end;

function TGroupList.AddNew(Title, FieldPath: string; IsVisible: Boolean; Width: Integer): TGroupItem;
begin
   Result:=TGroupItem.Create(GetNextFieldName, Title, FieldPath, IsVisible, Width);
   Add(Result);
end;

procedure TGroupList.Assign(List: TGroupList);
var
   I: Integer;
   Item: TGroupItem;
begin
   if List<>Self then begin
      FId:=List.Id;
      Clear;
      if List<>nil then begin
         for I:=0 to Pred(List.Count) do begin
            Item:=List[I];
            if Item<>nil then begin
               Add(Item.Clone);
            end;
         end;
      end;
   end;
end;

procedure TGroupList.Clear;
var
   I: Integer;
   Item: TGroupItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

function TGroupList.Clone: TGroupList;
begin
   Result:=TGroupList.Create;
   Result.Assign(Self);
end;

constructor TGroupList.Create;
begin
   FId:=0;
   FList:=TList.Create;
end;

procedure TGroupList.Delete(Ind: Integer);
var
   Item: TGroupItem;
begin
   Item:=FList[Ind];
   if Item<>nil then begin
      Item.Free;
   end;
   FList.Delete(Ind);
end;

destructor TGroupList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TGroupList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TGroupList.GetItem(Ind: Integer): TGroupItem;
begin
   Result:=TGroupItem(FList[Ind]);
end;

function TGroupList.GetNextFieldName: string;
begin
   Result:=Format('Field_%d', [FId]);
   Inc(FId);
end;

function TGroupList.IndexOfPath(Path: string): Integer;
var
   I: Integer;
   Item: TGroupItem;
begin
   Result:=-1;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (AnsiCompareText(Path, Item.FieldPath)=0) then begin
         Result:=I;
         Break;
      end;
   end;
end;

function TGroupList.LoadFromStrings(sl: TStringList; var Ind: Integer): Boolean;
var
   I: Integer;
   Cnt: Integer;
   Props: TStringList;
   Version: Integer;
   Item: TGroupItem;
begin
   Result:=False;
   if sl<>nil then begin
      Clear;
      Props:=TStringList.Create;
      try
         Props.CommaText:=sl[Ind];
         Inc(Ind);
         Version:=-1;
         if Props.Count>0 then begin
            Version:=StrToIntDef(Props[0], -1);
         end;
         case Version of
            1: begin
               if (Props.Count=4) and (Props[1]='GRPITEMS') then begin
                  Cnt:=StrToIntDef(Props[2], -1);
                  I:=StrToIntDef(Props[3], -1);
                  if (Cnt<>-1) and (FId<>-1) then begin
                     FId:=I;
                     for I:=0 to Pred(Cnt) do begin
                        Item:=TGroupItem.Create('', '', '', False, -1);
                        if Item.LoadFromString(sl[Ind]) then begin
                           Add(Item);
                        end
                        else begin
                           Item.Free;
                        end;
                        Inc(Ind);
                     end;
                  end;
                  Result:=True;
               end;
            end;
         end;
      finally
         Props.Free;
      end;
   end;
end;

procedure TGroupList.SaveToStrings(sl: TStringList);
var
   I: Integer;
   Item: TGroupItem;
begin
   if sl<>nil then begin
      sl.Add(Format('1,GRPITEMS,%d,%d', [GetCount, FId]));
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         if Item<>nil then begin
            sl.Add(Item.SaveToString);
         end;
      end;
   end;
end;

{ TGroupBy }

procedure TGroupBy.Assign(GroupBy: TGroupBy);
begin
   if GroupBy<>Self then begin
      FCaption:=GroupBy.Caption;
      FGroupList.Assign(GroupBy.GroupList);
      FColumnList.Assign(GroupBy.ColumnList);
      FOrderList.Assign(GroupBy.OrderList);
   end;
end;

procedure TGroupBy.Clear;
begin
   FGroupList.Clear;
   FColumnList.Clear;
   FOrderList.Clear;
end;

function TGroupBy.Clone: TGroupBy;
begin
   Result:=TGroupBy.Create('');
   Result.Assign(Self);
end;

constructor TGroupBy.Create(Caption: string);
begin
   FCaption:=Caption;
   FGroupList:=TGroupList.Create;
   FColumnList:=TGroupColumnList.Create;
   FColumnList.AddNew('Всего', True, True, '', -1);
   FOrderList:=TOrderList.Create;
end;

destructor TGroupBy.Destroy;
begin
   FOrderList.Free;
   FGroupList.Free;
   FColumnList.Free;
   inherited;
end;
//--------------------------------------------
function TGroupBy.GetSQL(SQL: TStrings; FilterInterface: TFilterInterface; Where: string): Boolean;
var
   I: Integer;
   GroupItem: TGroupItem;
   ColumnItem: TGroupColumnItem;
   OrderItem: TOrderItem;
   SelectStm: string;
   FromStm: string;
   JoinStm: string;
   WhereStm: string;
   GroupByStm: string;
   OrderByStm: string;
   GroupFields: string;
   SelectFields: string;
   Field: TFindFieldItem;
   FieldFullName: string;
   sl: TStringList;

   procedure AddString(var S: string; AddStr, Delim: string);
   begin
      if S='' then begin
         S:=AddStr;
      end
      else begin
         S:=S+Delim+AddStr;
      end;
   end;

begin
   Result:=False;
   SQL.Clear;
   if (FilterInterface.MainTableName<>'') and (FilterInterface.MainTableAlias<>'') and (FGroupList.Count>0) then begin
      SelectFields:='';
      GroupFields:='';
      for I:=0 to Pred(FGroupList.Count) do begin
         GroupItem:=FGroupList[I];
         if (GroupItem<>nil) and GroupItem.IsVisible then begin
            Field:=FilterInterface.FindFieldList.ByPath(GroupItem.FieldPath);
//            if (Field<>nil) and (Field.Alias=FilterInterface.MainTableAlias) then begin     // vadim!!!   01.12.2017
            if (Field<>nil) and FilterInterface.CheckAlias(Field) then begin
               FieldFullName:=Field.FullName;
               // проверяем поля типа - дата
               if ffkDate in Field.Kinds then begin
                  case GroupItem.DateKind of
                     dkMonth: FieldFullName:=Format('Month(%s)', [Field.FullName]);
                     dkYear: FieldFullName:=Format('Year(%s)', [Field.FullName]);
                     dkDayOfMonth: FieldFullName:=Format('DayOfMonth(%s)', [Field.FullName]);
                  end;
               end
               // иначе проверяем, надо ли преобразовывать к верхнему регистру значение поля
               else if (ffkString in Field.Kinds) and Field.CaseSensitive and not Field.IsUpper then begin
                  FieldFullName:=Format('Upper(%s)', [FieldFullName]);
               end;
               AddString(GroupFields, FieldFullName, ',');
               FieldFullName:=Format('%s as %s', [FieldFullName, GroupItem.FieldName]);
               AddString(SelectFields, FieldFullName, ',');
            end;
         end;
      end;
      sl:=TStringList.Create;
      try
         for I:=0 to Pred(FColumnList.Count) do begin
            ColumnItem:=FColumnList[I];
            if (ColumnItem<>nil) and ColumnItem.IsVisible then begin
               if ColumnItem.IsTotal then begin
                  AddString(SelectFields, 'count(*) as '+ColumnItem.FieldName, ',');
               end
               else if ColumnItem.FieldPath<>'' then begin
                  Field:=FilterInterface.FindFieldList.ByPath(ColumnItem.FieldPath);
                  if (Field<>nil) and FilterInterface.CheckAlias(Field) then begin            //  vadim!!!  01.12.2017
//                  if (Field<>nil) and (Field.Alias=FilterInterface.MainTableAlias) then begin   vadim!!!
                     sl.Clear;
                     ColumnItem.Condition.GetSQL(sl, FilterInterface);
                     AddString(SelectFields, Format('sum(case when %s then 1 end) as %s', [sl.Text, ColumnItem.FieldName]), ',');
                  end;
               end;
            end;
         end;
      finally
         sl.Free;
      end;
      OrderByStm:='';
      for I:=0 to Pred(FOrderList.Count) do begin
         OrderItem:=FOrderList[I];
         if OrderItem<>nil then begin
            AddString(OrderByStm, OrderItem.FieldPath+CMapDirection[OrderItem.Direction], ',');
         end;
      end;
      SelectStm:=Format('select %s', [SelectFields]);
      FromStm:=Format('  from %s %s', [FilterInterface.MainTableName, FilterInterface.MainTableAlias]);
      JoinStm:='';
      if FilterInterface.MainTableJoin<>'' then begin
         JoinStm:=FilterInterface.MainTableJoin;
      end;
      GroupByStm:=Format('  group by %s', [GroupFields]);
      WhereStm:='';
      if Where<>'' then begin
         WhereStm:=Format('  where %s', [Where]);
      end;
      if OrderByStm<>'' then begin
         OrderByStm:=Format('  order by %s', [OrderByStm]);
      end;
      SQL.Add(SelectStm);
      SQL.Add(FromStm);
      SQL.Add(JoinStm);
      SQL.Add(WhereStm);
      SQL.Add(GroupByStm);
      SQL.Add(OrderByStm);
      Result:=True;
   end;
end;

function TGroupBy.LoadFromFile(FilterInterface: TFilterInterface; FileName: string; var Err: string): Boolean;
var
   sl: TStringList;
begin
   Result:=False;
   Err:='';
   try
      if FileExists(FileName) then begin
         sl:=TStringList.Create;
         try
            sl.LoadFromFile(FileName);
            if LoadFromStrings(FilterInterface, sl) then begin
               Result:=True;
            end;
         finally
            sl.Free;
         end;
      end;
   except
      on E: Exception do begin
         Err:=E.Message;
         Result:=False;
      end;
   end;
end;

function TGroupBy.LoadFromStrings(FilterInterface: TFilterInterface; sl: TStringList): Boolean;
var
   Version: Integer;
   P: Integer;
   Ind: Integer;
   Temp: TGroupBy;
begin
   Result:=False;
   if (sl<>nil) and (sl.Count>5) then begin
      if sl[0]=CFirstLine2 then begin
         P:=Pos('=', sl[1]);
         Version:=-1;
         if P>0 then begin
            Version:=StrToIntDef(Copy(sl[1], Succ(P), Length(sl[1])-P), Version);
         end;
         case Version of
            // первая версия
            1: begin
               Temp:=Self.Clone;
               try
                  Temp.Caption:=sl[2];
                  if Temp.OrderList.LoadFromString(sl[3]) then begin
                     Ind:=4;
                     if Temp.GroupList.LoadFromStrings(sl, Ind) then begin
                        if Temp.ColumnList.LoadFromStrings(FilterInterface, sl, Ind) then begin
                           Result:=True;
                        end;
                     end;
                  end;
                  if Result then begin
                     Assign(Temp);
                  end;
               finally
                  Temp.Free;
               end;
            end;
         end;
      end;
   end;
end;

function TGroupBy.SaveToFile(FileName: string; var Err: string): Boolean;
var
   Dir: string;
   Name: string;
   sl: TStringList;
begin
   Err:='';
   try
      Dir:=ExtractFilePath(FileName);
      Name:=ExtractFileName(FileName);
      if not DirectoryExists(Dir) then begin
         ForceDirectories(Dir);
      end;
      sl:=TStringList.Create;
      try
         SaveToStrings(sl);
         sl.SaveToFile(FileName);
         Result:=True;
      finally
         sl.Free;
      end;
   except
      on E: Exception do begin
         Err:=E.Message;
         Result:=False;
      end;
   end;
end;

procedure TGroupBy.SaveToStrings(sl: TStringList);
begin
   if sl<>nil then begin
      sl.Add(CFirstLine2);
      sl.Add('Версия=1');
      sl.Add(FCaption);
      sl.Add(FOrderList.SaveToString);
      FGroupList.SaveToStrings(sl);
      FColumnList.SaveToStrings(sl);
   end;
end;

{ TGroupColumnItem }

procedure TGroupColumnItem.Assign(ColumnItem: TGroupColumnItem);
begin
   if ColumnItem<>Self then begin
      FFieldName:=ColumnItem.FieldName;
      FTitle:=ColumnItem.Title;
      FFieldPath:=ColumnItem.FieldPath;
      FIsVisible:=ColumnItem.IsVisible;
      FIsTotal:=ColumnItem.IsTotal;
      FCondition.Assign(ColumnItem.Condition);
      FWidth:=ColumnItem.Width;
   end;
end;

function TGroupColumnItem.Clone: TGroupColumnItem;
begin
   Result:=TGroupColumnItem.Create('', '', True, True, '', -1);
   Result.Assign(Self);
end;

constructor TGroupColumnItem.Create(FieldName, Title: string; IsTotal, IsVisible: Boolean; FieldPath: string; Width: Integer);
begin
   FFieldName:=FieldName;
   FTitle:=Title;
   FIsTotal:=IsTotal;
   FFieldPath:=FieldPath;
   FIsVisible:=IsVisible;
   FCondition:=TFindList.Create('', '', '', False);
   FWidth:=Width;
end;

destructor TGroupColumnItem.Destroy;
begin
   FCondition.Free;
   inherited;
end;

function TGroupColumnItem.LoadFromStrings(FilterInterface: TFilterInterface; sl: TStringList; var Ind: Integer): Boolean;
var
   Props: TStringList;
   Version: Integer;
begin
   Result:=False;
   if sl<>nil then begin
      Props:=TStringList.Create;
      try
         Props.CommaText:=sl[Ind];
         Inc(Ind);
         Version:=-1;
         if Props.Count>0 then begin
            Version:=StrToIntDef(Props[0], -1);
         end;
         case Version of
            1: begin
               if (Props.Count=7) and (Props[1]='COLITEM') then begin
                  FTitle:=Trim(Props[2]);
                  FIsTotal:=Trim(Props[3])=MapBool[True];
                  FFieldPath:=Trim(Props[4]);
                  FIsVisible:=Trim(Props[5])=MapBool[True];
                  FFieldName:=Trim(Props[6]);
                  FCondition.LoadFromStrings_(sl, Ind, FilterInterface.FindFieldList, FilterInterface.OperList);
                  Result:=True;
               end;
            end;
            2: begin
               if (Props.Count=8) and (Props[1]='COLITEM') then begin
                  FTitle:=Trim(Props[2]);
                  FIsTotal:=Trim(Props[3])=MapBool[True];
                  FFieldPath:=Trim(Props[4]);
                  FIsVisible:=Trim(Props[5])=MapBool[True];
                  FFieldName:=Trim(Props[6]);
                  FWidth:=StrToIntDef(Props[7], -1);
                  FCondition.LoadFromStrings_(sl, Ind, FilterInterface.FindFieldList, FilterInterface.OperList);
                  Result:=True;
               end;
            end;
         end;
      finally
         Props.Free;
      end;
   end;
end;

procedure TGroupColumnItem.SaveToStrings(sl: TStringList);
var
   par: TStringList;
begin
   // версия 2: +FWidth
   if sl<>nil then begin
      //[2007.10.11]
      //--sl.Add(Format('2,COLITEM,"%s","%s","%s","%s","%s","%d"', [FTitle, MapBool[FIsTotal], FFieldPath, MapBool[FIsVisible], FFieldName, FWidth]));
      par:=TStringList.Create;
      try
         par.Add('2');
         par.Add('COLITEM');
         par.Add(FTitle);
         par.Add(MapBool[FIsTotal]);
         par.Add(FFieldPath);
         par.Add(MapBool[FIsVisible]);
         par.Add(FFieldName);
         par.Add(IntToStr(FWidth));
         sl.Add(par.CommaText);
      finally
         par.Free;
      end;
      //
      FCondition.SaveToStrings_(sl);
   end;
end;

{ TGroupColumnList }

function TGroupColumnList.Add(Item: TGroupColumnItem): Integer;
begin
   Result:=FList.Add(Item);
end;

function TGroupColumnList.AddNew(Title: string; IsTotal, IsVisible: Boolean; FieldPath: string; Width: Integer): TGroupColumnItem;
begin
   Result:=TGroupColumnItem.Create(GetNextFieldName, Title, IsTotal, IsVisible, FieldPath, Width);
   Add(Result);
end;

procedure TGroupColumnList.Assign(List: TGroupColumnList);
var
   I: Integer;
   Item: TGroupColumnItem;
begin
   if List<>Self then begin
      FId:=List.Id;
      Clear;
      if List<>nil then begin
         for I:=0 to Pred(List.Count) do begin
            Item:=List[I];
            if Item<>nil then begin
               Add(Item.Clone);
            end;
         end;
      end;
   end;
end;

procedure TGroupColumnList.Clear;
var
   I: Integer;
   Item: TGroupColumnItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

function TGroupColumnList.Clone: TGroupColumnList;
begin
   Result:=TGroupColumnList.Create;
   Result.Assign(Self);
end;

constructor TGroupColumnList.Create;
begin
   FId:=0;
   FList:=TList.Create;
end;

procedure TGroupColumnList.Delete(Ind: Integer);
var
   Item: TGroupColumnItem;
begin
   Item:=FList[Ind];
   if Item<>nil then begin
      Item.Free;
   end;
   FList.Delete(Ind);
end;

destructor TGroupColumnList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TGroupColumnList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TGroupColumnList.GetItem(Ind: Integer): TGroupColumnItem;
begin
   Result:=TGroupColumnItem(FList[Ind]);
end;

function TGroupColumnList.GetNextFieldName: string;
begin
   Result:=Format('FieldNo%d', [FId]);
   Inc(FId);
end;

function TGroupColumnList.LoadFromStrings(FilterInterface: TFilterInterface; sl: TStringList; var Ind: Integer): Boolean;
var
   I: Integer;
   Cnt: Integer;
   Props: TStringList;
   Version: Integer;
   Item: TGroupColumnItem;
begin
   Result:=False;
   if sl<>nil then begin
      Clear;
      Props:=TStringList.Create;
      try
         Props.CommaText:=sl[Ind];
         Inc(Ind);
         Version:=-1;
         if Props.Count>0 then begin
            Version:=StrToIntDef(Props[0], -1);
         end;
         case Version of
            1: begin
               if (Props.Count=4) and (Props[1]='COLITEMS') then begin
                  Cnt:=StrToIntDef(Props[2], -1);
                  I:=StrToIntDef(Props[3], -1);
                  if (Cnt<>-1) and (FId<>-1) then begin
                     FId:=I;
                     for I:=0 to Pred(Cnt) do begin
                        Item:=TGroupColumnItem.Create('', '', False, False, '', -1);
                        if Item.LoadFromStrings(FilterInterface, sl, Ind) then begin
                           Add(Item);
                        end
                        else begin
                           Item.Free;
                        end;
                     end;
                  end;
                  Result:=True;
               end;
            end;
         end;
      finally
         Props.Free;
      end;
   end;
end;

procedure TGroupColumnList.SaveToStrings(sl: TStringList);
var
   I: Integer;
   Item: TGroupColumnItem;
begin
   if sl<>nil then begin
      sl.Add(Format('1,COLITEMS,%d,%d', [GetCount, FId]));
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         if Item<>nil then begin
            Item.SaveToStrings(sl);
         end;
      end;
   end;
end;

end.
