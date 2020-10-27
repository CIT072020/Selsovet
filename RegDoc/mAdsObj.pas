unit mAdsObj; // [15.02.2005]
// ОСОБЕННОСТИ:
//  - если ни одно поле в главной таблице не означить при заведении новой записи,
//    то новая запись (даже не смотря на заполнение детальных таблиц) не появится
//  - после обновления реестра всегда пробуем позиционироваться на старую запись
//    (на которой стояли до обновления), из-за этого получается не совсем красиво
//    например в DBGrid первая видимая строка меняется
//  - ключ связывающий все главные-детальные таблицы должен повторяться
//    и должен следовать в том же порядке при этом MasterFields и KeyFieldNames
//    пересекаются
//    пример: главаня таблица -> детальная  -> детальная детальная
//                 KEY1       -> KEY1, KEY2 -> KEY1, KEY2, KEY3
//  - справочник может иметь только одно ключевое поле
//  - поле, которое используется как LookupFieldName должно обязательно иметь
//    стиль fsViewVisible, иначе не открывается запрос на просмотр
//    и потом его надо вручную исключать из просмотра
// -----------------------------------------------------------------------------
//  = не отработан момент с удалением/добавлением полей (или изменением имён полей)
//    когда надо как-то удалять/изменять сохраненные визуальные настройки колонок,
//    которые были сохранены до изменения соответствующего поля
//  = не отработан момент с возможностью редактирования таблицы либо через форму
//    либо через таблицу, либо так и так
// =============================================================================
// ПЛАН ДОРАБОТОК:
// - CodeFieldName и vkWithValue
// - lookup поля:                                      
//   - автоматическое подключение к управляющему элементу
//   - возможность показа кода и наименования
//   - количество выпадающих строк
interface
uses
   Windows, SysUtils, Classes, Controls, Db, Forms, Graphics, IniFiles, TypInfo,
   DBCtrls, Dialogs, Variants, ComCtrls, Menus, Grids, DBGrids, StdCtrls, Math,
   Messages, DBGridEh, ToolCtrlsEh, DBCtrlsEh, DBLookupEh,
   AdsTable,
   kbmMemTable,
   mFindInt, mTempl;

type

   TStringLists=class(TObject)
   private
      FList: TList;
      FName: TStringList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TStringList;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Name: string): TStringList;
      function ByName(Name: string): TStringList;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TStringList read GetItem;
   end;

   TDBList=class;
   TDBItemList=class;
   TTableView=class;
   TViewList=class;
   TDBItem=class;
   TEnumItem=class;
   TEnumList=class;
   TLayoutList=class;

   // ==========================================================================
   //
   // --------------------------------------------------------------------------
   // TFieldItem
   // TFieldList
   // --------------------------------------------------------------------------
   // TRelationItem
   // TRelationList
   // --------------------------------------------------------------------------
   // TTableIndex
   // TTableIndexList
   // --------------------------------------------------------------------------
   // TJoinItem
   // TJoinList
   // --------------------------------------------------------------------------
   // TDBItem
   // TDBItemList
   // TDBList

   // что бы не заводить кучу отдельных свойств здесь собраны все флаги
   // (они условно названы стилями), которые могут быть у поля
   TFieldStyles=(
      // значение поля присваивается на стороне сервера
      fsServerSide,
      // поле видно для поиска
      fsFindVisible,
      // поле видно для просмотра
      fsViewVisible,
      // поле видно для редактирования
      fsEditVisible,
      // поле не чуствительно к регистру
      fsCaseInsensitive,
      // значение поля всегда храниться в верхнем регистре
      fsAlwaysUpper,
      // устанавливается для полей, которые создаются программой для
      // внутренних нужд (например, для показа наименований из справочников)
      fsInternal,
      // поле может участвовать в сортировке (order by), этот флаг задаёт саму
      // возможность участия в сортировки, а свойство FOrderBy указывает место
      // в этой сортировке
      fsInOrderBy,
      // если участвует в сортировке, то этот флаг указывает восходящий порядок
      // сортировки по этому полю
      fsAscOrder,
      // если участвует в сортировке, то этот флаг указывает нисходящий порядок
      // сортировки по этому полю
      fsDescOrder,
      // поле не может принимать значение NULL
      fsNotNull,
      // поле имеет индекс для полнотекстового поиска
      fsFTS,
      // поле является фасетом другого поля
      fsFaset,
      // этому полю соответствует lookup-поле в наборе данных
      fsLookup,
      // означает, что пользователь никогда и нигде это поле не сможет явно отредактировать
      fsReadOnly,
      // этот стиль должен стоять у всех полей относящихся к первичному ключу
      // NB: этот стиль пока никак не используется, но предполагается что он нужен
      fsKeyField,
      // для таблиц, имеющих древовидную структуру
      // данное поле будет исключаться при редактировании папки
      fsNotForFolder,
      // для конфигурироваия ListSource если поле связано с TDbLookupComboBoxEh
      fsLookupCombo
   );
   TFieldStyle=set of TFieldStyles;

   // есть ли подключения к полю (справочник, список значений и т.д.)
   TValueLinkStyle=(
      // нет подключений
      lsNone,
      // есть подключенный справочник
      lsLinkSpr,
      // есть подключенное перечисление значений
      lsLinkEnum,
      // есть собственный список значений (NB: эта возможность пока не работает)
      lsOwnPickList
   );

   // способы выбора значений (из справочника и др.)
   TSelectValueStyle=(
      // нет выбора значений
      ssNone,
      // выбор значений осуществлять с помощью выпадающего списка
      ssPickList,
      // выбор значений осуществлять с помощью открытия отдельного окна со значениями
      ssShowWindow
   );

   // тип данных поля
   TFieldDataKind=(
      // строка
      dkString,
      // логическое
      dkBoolean,
      // число
      dkNumber,
      // дробное число
      dkFloat,
      // дата
      dkDate//,
      // время
//      dkTime
   );

   TFieldItem=class(TObject)
   private
      FDBItem: TDBItem;
      FSrcField: TField;
      FDestField: TField;
      FViewField: TField;
      // имя поля в запросе (алиас поля), оно может быть не равно реальному
      // имени поля
      FName: string;
      // реальное имя поля в своей таблице
      FFieldName: string;
      // алиас таблицы (дублирует адиас таблицы FDBItem`а)
      FTableAlias: string;
      // название поля
      FCaption: string;
      // дополнительное название поля (если указано, то используется для показа
      // названия поля в диалоге поиска вместе с условием)
      FAddCaption: string;
      // комментарий о назначении поля или другое примечание
      FComm: string;
      // синоним имени поля (например, по-русски)
      FSynonim: string;
      // имя группы, к которой принадлежит полей (используется для инициализации
      // поиска или для другого показа)
      FGroup: string;
      // текст запроса вместо реально имени поля (например вызов функции)
      FSelectText: string;
      FStyle: TFieldStyle;
      // задаёт порядок полей (для инициализации поиска или для другого показа)
      FOrder: Integer;
      // задаёт порядок полей в сортировке (если они в ней могут учавствовать)
      // если OrderBy<=0, то поле не участвует в сортировке
      FOrderBy: Integer;
      // имя операции для поиска по умолчанию
      FFindOperation: string;
      // имя подключенного к полю справочника
      FLinkEnumName: string;
      FLinkEnum: TEnumItem;
      // имя подключенного к полю списка значений
      FLinkSprName: string;
      FLinkSpr: TDBItem;
      // начало фасета
      FFasetStart: Integer;
      // длина фасета
      FFasetLength: Integer;
      // реальное имя поля в своей таблице, из которого берется фасет
      FFasetFieldName: string;
      // определяет существование подключаемых к полю значений, справочников и т.д.
      FLinkStyle: TValueLinkStyle;
      // способы выбора значений
      FSelectValueStyle: TSelectValueStyle;
      // вид данных хранящихся в поле
      FDataKind: TFieldDataKind;
      // NB: ??? не используется
      FSize: Integer;
      //
      FLookupFieldName: string;
      // это внутреннее свойство отслеживает сколько ссылок на данное поле извне
      // от TColView
      FInternalLink: TList;
   private
      procedure CopyField(SrcField, DestField: TField);
   public
      constructor Create(DBItem: TDBItem; Name, FieldName, Synonim, Caption, Comm, Group, LinkSprName, LinkEnumName: string; Order: Integer; Style: TFieldStyle; LinkStyle: TValueLinkStyle; SelectValueStyle: TSelectValueStyle; DataKind: TFieldDataKind);
      destructor Destroy; override;
      procedure SetField(SrcDataSet, DestDataSet: TDataSet);
      procedure SetViewField(ViewDataSet: TDataSet);
      procedure Src2Dest;
      procedure Dest2Src;
      function HaveStyle(Style: TFieldStyles): Boolean;
      procedure RestoreLinks(SprList: TDBItemList; EnumList: TEnumList);
      procedure IncludeStyle(S: TFieldStyles);
      procedure ExcludeStyle(S: TFieldStyles);
      procedure AddStyle(DoAdd: Boolean; S: TFieldStyles);
      function CanEdit: Boolean;
   public
      property Name: string read FName;
      property FieldName: string read FFieldName;
      property DBItem: TDBItem read FDBItem;
      property ViewField: TField read FViewField;
      property SrcField: TField read FSrcField;
      property DestField: TField read FDestField;
      property Style: TFieldStyle read FStyle;
      property TableAlias: string read FTableAlias write FTableAlias;
      property Caption: string read FCaption;
      property AddCaption: string read FAddCaption write FAddCaption;
      property Comm: string read FComm;
      property Synonim: string read FSynonim;
      property Group: string read FGroup;
      property SelectText: string read FSelectText write FSelectText;
      property Order: Integer read FOrder;
      property OrderBy: Integer read FOrderBy write FOrderBy;
      property FindOperation: string read FFindOperation write FFindOperation;
      property LinkEnumName: string read FLinkEnumName;
      property LinkSprName: string read FLinkSprName;
      property FasetStart: Integer read FFasetStart write FFasetStart;
      property FasetLength: Integer read FFasetLength write FFasetLength;
      property FasetFieldName: string read FFasetFieldName write FFasetFieldName;
      property LinkStyle: TValueLinkStyle read FLinkStyle;
      property SelectValueStyle: TSelectValueStyle read FSelectValueStyle;
      property LinkSpr: TDBItem read FLinkSpr;
      property LinkEnum: TEnumItem read FLinkEnum;
      property DataKind: TFieldDataKind read FDataKind;
      property Size: Integer read FSize write FSize;
      property LookupFieldName: string read FLookupFieldName write FLookupFieldName;
      property InternalLink: TList read FInternalLink;
   end;

   TFieldList=class(TObject)
   private
      FList: TList;
      FDBItem: TDBItem;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TFieldItem;
   protected
      procedure Delete(Item: TFieldItem);
   public
      constructor Create(DBItem: TDBItem);
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TFieldItem): Integer;
      function AddItem(Name, FieldName, Synonim, Caption, Comm, Group, LinkSprName, LinkEnumName: string; Order: Integer; Style: TFieldStyle; LinkStyle: TValueLinkStyle; SelectValueStyle: TSelectValueStyle; DataKind: TFieldDataKind): TFieldItem;
      procedure SetField(SetNil: Boolean);
      procedure SetViewField(SetNil: Boolean);
      procedure Src2Dest;
      procedure Dest2Src;
      function ByName(Name: string): TFieldItem;
      procedure CreateEditTable;
      procedure CreateEditTable2(EditTable: TkbmMemTable);
      procedure RestoreLinks(SprList: TDBItemList; EnumList: TEnumList);
      procedure BuildDataSetFieldList(DataSet: TDataSet; IsQuery: Boolean);
      // добавить все поля, которые связаны с заданным справочником, в список
      function FindLinkSpr(Spr: TDBItem; List: TList): Boolean;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TFieldItem read GetItem; default;
      property DBItem: TDBItem read FDBItem;
   end;

   // --------------------------------------------------------------------------

   TRelationKind=(rkOneMany, rkOneOne, rkManyOne, rkManyMany, rkNone);

   TRelationItem=class(TObject)
   private
      FName: string;
      FCaption: string;
      FSynonim: string;
      FRelationTableName: string;
      FRelationTable: TDBItem;
      FRelationKind: TRelationKind;
      FFindVisible: Boolean;
      // имя операции для поиска по умолчанию
      FFindOperation: string;
      FWhere: string;
      FGroupBy: string;
   public
      constructor Create(Name, Caption, Synonim, RelationTableName, Where, GroupBy, FindOperation: string; RelationKind: TRelationKind; FindVisible: Boolean);
      destructor Destroy; override;
      function GetWhere(TableAlias, RelationAlias: string): string;
      function GetGroup(RelationAlias: string): string;
      procedure RestoreLinks(DBList: TDBList);
   public
      property Name: string read FName;
      property Caption: string read FCaption;
      property Synonim: string read FSynonim;
      property RelationTableName: string read FRelationTableName;
      property RelationTable: TDBItem read FRelationTable;
      property RelationKind: TRelationKind read FRelationKind;
      property FindVisible: Boolean read FFindVisible;
      property Where: string read FWhere;
      property GroupBy: string read FGroupBy;
      property FindOperation: string read FFindOperation;
   end;

   TRelationList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TRelationItem;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TRelationItem): Integer;
      function AddItem(Name, Caption, Synonim, RelationTableName, Where, GroupBy, FindOperation: string; RelationKind: TRelationKind; FindVisible: Boolean): TRelationItem;
      function ByName(Name: string): TRelationItem;
      procedure RestoreLinks(DBList: TDBList);
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TRelationItem read GetItem; default;
   end;

   // --------------------------------------------------------------------------

   TTableIndexStyles=(isPrimary, isUnique, isOrder);
   TTableIndexStyle=set of TTableIndexStyles;

   // индекс таблицы
   TTableIndex=class(TObject)
   private
      FName: string;
      FIndexName: string;
      FFieldNames: string;
      FStyle: TTableIndexStyle;
   public
      constructor Create(Name, IndexName, FieldNames: string; Style: TTableIndexStyle);
      destructor Destroy; override;
   public
      property Name: string read FName;
      property IndexName: string read FIndexName;
      property FieldNames: string read FFieldNames;
      property Style: TTableIndexStyle read FStyle;
   end;

   // список индексов таблицы
   TTableIndexList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TTableIndex;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TTableIndex): Integer;
      function AddItem(Name, IndexName, FieldNames: string; Style: TTableIndexStyle): TTableIndex;
      function ByName(Name: string): TTableIndex;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TTableIndex read GetItem; default;
   end;

   // --------------------------------------------------------------------------

   TJoinItem=class(TObject)
   private
      FTableName: string;
      FAlias: string;
      FMainField: TStringList;
      FJoinField: TStringList;
      FOuterJoin: Boolean;
      FWhere: string;
      FInternal: Boolean;
      FInternalLink: TList;
   public
      constructor Create(TableName, Alias, MainField, JoinField, Where: string; OuterJoin: Boolean);
      destructor Destroy; override;
      procedure Assign(JoinItem: TJoinItem);
      function Clone: TJoinItem;
   public
      property TableName: string read FTableName;
      property Alias: string read FAlias;
      property MainField: TStringList read FMainField;
      property JoinField: TStringList read FJoinField;
      property OuterJoin: Boolean read FOuterJoin;
      property Where: string read FWhere;
      property Internal: Boolean read FInternal write FInternal;
      property InternalLink: TList read FInternalLink;
   end;

   TJoinList=class(TObject)
   private
      FNumAlias: Integer;
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TJoinItem;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TJoinItem): Integer;
      procedure Delete(Item: TJoinItem);
      function AddItem(TableName, Alias, MainField, JoinField, Where: string; OuterJoin, First: Boolean): TJoinItem;
      function ByAlias(Alias: string): TJoinItem;
      function AliasByName(TableName, MainField: string): string;
      procedure ClearInternal;
      function GetNewAlias: string;
      procedure Assign(JoinList: TJoinList);
      function Clone: TJoinList;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TJoinItem read GetItem; default;
   end;

   // --------------------------------------------------------------------------

   // стили таблицы
   TDBItemStyles=(
      // таблица может быть использована в режиме "просмотра"
      bsView,
      // таблица является "главной"
      bsMaster,
      // таблица является "подчиненной"
      //   - обязательна установка IndexName
      bsDetail,
      // данную таблицу нельзя редактировать
      bsReadOnly,
      // таблица является справочником
      bsSpr,
      // таблица имеет древовидную структуру
      bsTree,
      // если таблица имеет древовидную структуру и является справочником,
      // то этот стиль указывает, что все записи справочника можно выбирать,
      // иначе можно выбирать только ветки дерева 
      bsAllSelable,
      // в таблице есть поле задающее порядок следования записей
      //   - обязательна установка IndexName
      bsOrder,
      // данные могут быть представлены в виде выпадающих списков (например,
      // выбор из справочника)
      bsPickList,
      // выдавать запрос на подтверждение удаления записи
      // устанавливается по умолчанию
      bsConfirmDelete,
      // выдавать запрос на подтверждение закрытия документа без сохранения (если были изменения)
      // устанавливается по умолчанию
      bsConfirmSave,
      // таблица учавствует в поиске (пока только этот флаг актуален для списков)
      bsFindVisible,
      // этот стиль указывает, что перед редактирование справочника надо снять фильтр
      // а после редактирования установить его обратно
      bsClearFilter
   );
   TDBItemStyle=set of TDBItemStyles;

   TDBItemEditMode=(emView, emEdit, emNew, emNone);

   TViewMode=(
      vmAdd,
      vmEdit,
      vmView
   );

   // виды меню
   TBuildMenuKind=(
      // шаблоны Word документов
      mkWordTemplate,
      // системные фильтры
      mkSysFilter
   );

   TSetDefaultValueEvent=procedure (Sender: TDBItem) of object;
   TOpenEvent=procedure (Sender: TDBItem) of object;
   TBeforeCloseEvent=procedure (Sender: TDBItem) of object;
   TBeforeDeleteRecordEvent=function (Sender: TDBItem; KeyValues: string): Boolean of object;
   TBeforeNewRecordEvent=function (Sender: TDBItem): Boolean of object;
   TBeforeEditRecordEvent=function (Sender: TDBItem; KeyValues: string): Boolean of object;
   TBeforeUpdateRecordEvent=procedure (Sender: TDBItem; IsNew: Boolean) of object;
   TAfterAddRecordEvent=procedure (Sender: TDBItem; IsNew: Boolean) of object;
   TAfterReadRecordEvent=procedure (Sender: TDBItem) of object;
   TViewRecordEvent=function (Sender: TDBItem; ViewMode: TViewMode): Boolean of object;
   TUpdateTopInfoEvent=function (Sender: TDBItem; RichEdit: TRichEdit; var TopInfo: string): Boolean of object;
   TBuildMenuEvent=procedure (Sender: TDBItem; Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent) of object;
   TExecActionEvent=procedure (Sender: TDBItem) of object;

   // вид текущего "источника" для выполнения операций над объектом база данных
   TSourceKind=(
      // непосредственно таблица базы данных
      skTable,
      // "представление"
      skView,
      // временная таблица для редактирования
      skEdit
   );

   TLookTreeList=class;
   TDBControl=class;

   // объект хранящийся в базе данных (имеется в виду в табличном виде)
   TDBItem=class(TObject)
   private
      // имя объекта NB: в каких приделах оно должно быть уникальным?
      FName: string;
      // синоним имени объекта (наприме, по-русски) NB: не означено
      FSynonim: string;
      // имя таблицы в базе данных
      FTableName: string;
      // алиас таблицы NB: в каких приделах он должен быть уникальным?
      FTableAlias: string;
      // краткое название
      FShortName: string;
      // полное название
      FCaption: string;
      // комментарий
      FComm: string;
      // имя индекса в списке индексов таблицы
      //  - он всегда устанавливается у основной таблицы FTable при открытии
      //  - он всегда создается у временной (для редактиования) таблицы FEditTable
      //  - для детальных таблиц он должен соответствовать вторичному ключу
      //  - для таблиц с порядком записей этот индекс должен задавать желаемый порядок
      FIndexName: string;
      // имя ключевого поля или списка ключевых полей
      //  - эти поля должны всегда присутствовать в списке полей
      //  - имена этих полей в списке полей должны всегда совпадать с физическими
      //    именами полей в таблице
      //  - для справочников это должно быть обязательно одно поле - код справочника
      //  - для не справочников это может быть несколько имен полей через запятую
      //  - эти поля всегда учавствуют в конструировании sql-запроса (InternalGetViewSQL)
      //    для FViewQuery
      FKeyFieldNames: string;
      // список имен ключевых полей, который строится по FKeyFieldNames
      //  - для внутреннего использования
      //  - в это списке храниться так же ссылки на FieldItem (эти ссылки
      //    восстанавливаются каждый раз при открытии FViewQuery)
      FKeyFieldList: TStringList;
      // имя физического поля содержащего "код" справочника
      //  - пока на данный по умолчанию для справочников оно равно FKeyFieldNames,
      //    но там где в программе речь идет именно о коде из справочника
      //    надо использовать значение этого свойства
      FCodeFieldName: string;
      // имя физического поля содержащего "наименованием" справочника
      FNameFieldName: string;
      // имя физического поля (полей) содержащего наименование для выпадающего списка
      //  - по умолчанию оно тождественно FNameFieldName
      FPickFieldNames: string;
      // имя физического поля содержащего "сокращенное наименование" справочника
      //  - по умолчанию оно тождественно FNameFieldName
      FShortFieldName: string;

      ///////////////////////////////////
      FViewQuery: TAdsQuery;
      FViewSource: TDataSource;
      FEditTable: TkbmMemTable;
      FEditSource: TDataSource;
      FTable: TAdsTable;
      FMasterSource: TDataSource;
      FTableSource: TDataSource;
      FDatabaseName: string;
      FIsOpen: Boolean;
      FIsViewOpen: Boolean;
      FIsFiltered: Boolean;
      FStyle: TDBItemStyle;
      FMasterItem: TDBItem;
      FDetailList: TDBItemList;
      FMasterFields: string;
      FFieldList: TFieldList;

      // имя AutoInc поля
      FAutoIncFieldName: string;
      FEditMode: TDBItemEditMode;
      FViewRowidField: TField;
      FIndexList: TTableIndexList;
      FKeyList: TStringList;
      FPickList: TStringLists;
      FViewList: TViewList;
      FRelationList: TRelationList;
      FJoinList: TJoinList;
      // имя Rowid поля
      FRowIdFieldName: string;
      // имя поля задающего порядок записей в справочниках
      FOrderFieldName: string;
      // имя поля признака узла дерева для таблиц представленных в древовидной форме
      FIsNodeFieldName: string;
      // имя поля родительского ключа для таблиц представленных в древовидной форме
      FParentIdFieldName: string;
      FSQLOrder: string;
      FSQLWhere: string;
      FLookFilter: string;
      // постоянный фильтр для справочника
      FTableFilter: string;
      FFilterInterface: TFilterInterface;
      FLayoutList: TLayoutList;
      FCanModify: Boolean;
      FFilterWhere: string;
      FFilterOrderBy: string;
      FControl: TDBControl;
      // эти три поля используются при инициализации поиска (только для списков)
      FFindOrder: Integer;
      FFindOperation: string;
      FFindGroup: string;
      FLook: TLookTreeList;
      //список системных фильтров
      FSysFilter: TStringList;
   private
      //СОБЫТИЯ:
      FOnSetDefaultValue: TSetDefaultValueEvent;
      FOnOpen: TOpenEvent;
      FOnBeforeClose: TBeforeCloseEvent;
      FOnBeforeDeleteRecord: TBeforeDeleteRecordEvent;
      FOnBeforeNewRecord: TBeforeNewRecordEvent;
      FOnBeforeEditRecord: TBeforeEditRecordEvent;
      FOnBeforeUpdateRecord: TBeforeUpdateRecordEvent;
      FOnAfterAddRecord: TAfterAddRecordEvent;
      FOnAfterReadRecord: TAfterReadRecordEvent;
      FOnViewRecord: TViewRecordEvent;
      //информация отобращаемая в верхней части таблицы при включенном стиле tsTopInfo
      FOnUpdateTopInfo: TUpdateTopInfoEvent;
      //автоматическая генерация пунктов меню
      FOnBuildMenu: TBuildMenuEvent;
      //выполнение дополнительных действий в fTblEdit
      FOnExecAction: TExecActionEvent;
   private
      procedure DoSetDefaultValue;
      procedure DoOpen;
      procedure DoBeforeClose;
      function DoBeforeNewRecord: Boolean;
      function DoBeforeDeleteRecord(KeyValues: TStringList): Boolean;
      function DoBeforeEditRecord(KeyValues: string): Boolean;
      procedure DoBeforeUpdateRecord(IsNew: Boolean);
      procedure DoAfterAddRecord(IsNew: Boolean);
      procedure DoAfterReadRecord;
   private
      function InternalLocate(KeyValues: TStringList): Boolean;
      function Locate(KeyValues: string): Boolean;
      procedure InternalGetKeyValues(KeyValues: TStringList; SourceKind: TSourceKind);
      procedure SetDatabaseName(Value: string);
      procedure SetMasterItem(Item: TDBItem);
      procedure AddField(FieldItem: TFieldItem);
      function InternalGetDeleteSQL(KeyValues: TStringList): string;
      function InternalGetViewSQL(Select, Where, FilterWhere, OrderBy, FilterOrderBy, RowidName: string; Formating, OnlyForCount: Boolean): string;
      function InternalDeleteRecord(KeyValues: TStringList; Query: TAdsQuery): Boolean;
      procedure InternalOpenEdit;
      procedure InternalAppendEdit;
      procedure InternalEditRecord(KeyValues: TStringList);
      procedure InternalApplyEdit(KeyValues: TStringList);
      procedure InternalChangeView(After: Boolean);
      function GetTableView: TTableView;
      //
      function GetIsNodeField: TField;
      function GetParentIdField: TField;
      function GetOrderField: TField;
      function GetNameField: TField;
      function GetCodeField: TField;
      function GetShortNameField: TField;
      //
      function GetIsDataModified: Boolean;
      procedure SetIndex;
      procedure SetKeyFieldList;
      function DefaultStyle: TDBItemStyle;
   public
      constructor Create(Name, TableName, TableAlias, ShortName, Caption, Comm, IndexName, MasterFields, KeyFieldNames, NameFieldName, AutoIncFieldName: string; Style: TDBItemStyle);
      destructor Destroy; override;
      function Open(var ErrMsg: string): Boolean;
      procedure Close;
      procedure OpenView;
      procedure CloseView;
      procedure RefreshView;
      function CountViewRecord: Integer;
      function NewRecord: Boolean;
      procedure AddRecord;
      procedure DeleteRecord(KeyValues: string);
      function DeleteCurrentRecord(SourceKind: TSourceKind): Boolean;
      procedure ApplyEdit(KeyValues: string);
      procedure CancelEdit;
      procedure EditRecord(KeyValues: string);
      procedure ViewRecord(KeyValues: string);
      procedure CheckEditMode;
      function GetKeyValues(SourceKind: TSourceKind): string;
      function GetDeleteSQL(KeyValues: string): string;
      procedure GetKeyPickList(KeyList, PickList: TStrings; NameFieldName: string);
      function GetPickList(NameFieldName: string): TStringList; overload;
      function GetPickList: TStringList; overload;
      procedure RestoreLinks(DBList: TDBList; SprList: TDBItemList; EnumList: TEnumList);
      function FindTable(Name: string): TDBItem;
      function GetRecNo: Integer;
      function GetViewSQL(Formating, OnlyForCount: Boolean): string;
      function GetSqlForCount: string;
      function GetDetailPath: string;
      procedure ClearFilter;
      procedure SetFilter(DoRefresh: Boolean);
      procedure SetFilterOrderBy;
      procedure InitFilter(OpList: TOperList; SprList: TSprList);
      procedure InitOrderList(OrderList: TOrderList);
      function HaveFilter: Boolean;
      function HaveFilterOrderBy: Boolean;
      function HaveNotEmptyFilter: Boolean;
      procedure LoadFormLayoutFromIni(Ini: TCustomIniFile);
      procedure SaveFormLayoutToIni(Ini: TCustomIniFile);
      function HaveStyle(S: TDBItemStyles): Boolean;
      procedure IncludeStyle(S: TDBItemStyles);
      procedure ExcludeStyle(S: TDBItemStyles);
      function DoViewRecord(ViewMode: TViewMode): Boolean;
      function CanViewRecord: Boolean;
      function IsEmpty(SourceKind: TSourceKind): Boolean;
      procedure DisableControls;
      procedure EnableControls;
      function ApplyFilter: Boolean;
      procedure PrepareTableView(SprList: TDBItemList; EnumList: TEnumList);
      function GetFieldValue(KeyValues: string; FieldName: string): string;
      // возращает спискок Id для справочника с древовидной структурой
      function GetIdList(RootId: Integer): string;
      function CanAdd: Boolean;
      function CanDelete: Boolean;
      function CanEdit: Boolean;
      function CanPrev: Boolean;
      function CanNext: Boolean;

      procedure RecordUp(DataSet: TDataSet; Field: TField);            //2010.02.10 изменение порядка записей
      procedure RecordUpEx(DataSet: TDataSet; Field, Parent: TField);  //{n_order}  2020.01.14

      procedure RecordDown(DataSet: TDataSet; Field: TField);
      procedure EditRecordUp;
      procedure EditRecordDown;
      function GetLastDataSetOrder(DataSet: TDataSet; Field: TField): Integer;
      function GetLastOrder(SourceKind: TSourceKind): Integer;
      //обновление информации, отобращаемой в верхней части таблицы при включенном стиле tsTopInfo
      function UpdateTopInfo(RichEdit: TRichEdit; var TopInfo: string): Boolean;
      //автоматическая генерация пунктов меню
      procedure BuildMenu(Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent);
      //
      procedure ExecAction;
      // обновление справочника после его изменения пользователем
      procedure UpdateSpr;
      // очистить все флаги об изменениях данных
      procedure ClearModified;
      //[2010.06.10] установить значения полей
      procedure SetDestField(Arr: array of Variant);
      procedure SetSrcField(Arr: array of Variant);
      // добавить все поля, которые связаны с заданным справочником, в список
      function FindLinkSpr(Spr: TDBItem; List: TList): Boolean;
   public
      property Name: string read FName;
      property TableName: string read FTableName;
      property TableAlias: string read FTableAlias;
      property ShortName: string read FShortName;
      property Caption: string read FCaption write FCaption;
      property Comm: string read FComm;
      property IsOpen: Boolean read FIsOpen;
      property IsViewOpen: Boolean read FIsViewOpen;
      property DatabaseName: string read FDatabaseName write SetDatabaseName;
      property Style: TDBItemStyle read FStyle;
      property MasterItem: TDBItem read FMasterItem write SetMasterItem;
      property DetailList: TDBItemList read FDetailList;
      property ViewQuery: TAdsQuery read FViewQuery;
      property ViewSource: TDataSource read FViewSource;
      property EditSource: TDataSource read FEditSource {//2010.02.14}write FEditSource;
      property MasterSource: TDataSource read FMasterSource;
      property TableSource: TDataSource read FTableSource;
      property MasterFields: string read FMasterFields;
      property KeyFieldNames: string read FKeyFieldNames;
      property CodeFieldName: string read FCodeFieldName; {==FKeyFieldNames}
      property NameFieldName: string read FNameFieldName;
      property ShortFieldName: string read FShortFieldName write FShortFieldName;
      property PickFieldNames: string read FPickFieldNames write FPickFieldNames;
      property AutoIncFieldName: string read FAutoIncFieldName;
      property EditTable: TkbmMemTable read FEditTable;
      property Table: TAdsTable read FTable;
      property IndexName: string read FIndexName;
      property FieldList: TFieldList read FFieldList;
      property EditMode: TDBItemEditMode read FEditMode;
      property IndexList: TTableIndexList read FIndexList;
      property ViewList: TViewList read FViewList;
      property TableView: TTableView read GetTableView;
      property OrderFieldName: string read FOrderFieldName write FOrderFieldName;
      property IsNodeFieldName: string read FIsNodeFieldName write FIsNodeFieldName;
      property ParentIdFieldName: string read FParentIdFieldName write FParentIdFieldName;
      property RelationList: TRelationList read FRelationList;
      property JoinList: TJoinList read FJoinList;
      property RowIdFieldName: string read FRowIdFieldName;
      property SQLOrder: string read FSQLOrder write FSQLOrder;
      property SQLWhere: string read FSQLWhere write FSQLWhere;
      property LookFilter: string read FLookFilter write FLookFilter;
      property IsFiltered: Boolean read FIsFiltered;
      property KeyList: TStringList read FKeyList;
      property PickList: TStringLists read FPickList;
      property FilterInterface: TFilterInterface read FFilterInterface;
      property IsNodeField: TField read GetIsNodeField;
      property ParentIdField: TField read GetParentIdField;
      property OrderField: TField read GetOrderField;
      property NameField: TField read GetNameField;
      property CodeField: TField read GetCodeField;
      property ShortNameField: TField read GetShortNameField;
      property LayoutList: TLayoutList read FLayoutList;
      property CanModify: Boolean read FCanModify;
      property Control: TDBControl read FControl write FControl;
      property FindOrder: Integer read FFindOrder write FFindOrder;
      property FindOperation: string read FFindOperation write FFindOperation;
      property FindGroup: string read FFindGroup write FFindGroup;
      property KeyFieldList: TStringList read FKeyFieldList;
      property Look: TLookTreeList read FLook;
      property TableFilter: string read FTableFilter write FTableFilter;
      property SysFilter: TStringList read FSysFilter;
      property IsDataModified: Boolean read GetIsDataModified;
   public
      property OnSetDefaultValue: TSetDefaultValueEvent read FOnSetDefaultValue write FOnSetDefaultValue;
      property OnOpen: TOpenEvent read FOnOpen write FOnOpen;
      property OnBeforeClose: TBeforeCloseEvent read FOnBeforeClose write FOnBeforeClose;
      property OnBeforeNewRecord: TBeforeNewRecordEvent read FOnBeforeNewRecord write FOnBeforeNewRecord;
      property OnBeforeEditRecord: TBeforeEditRecordEvent read FOnBeforeEditRecord write FOnBeforeEditRecord;
      property OnBeforeDeleteRecord: TBeforeDeleteRecordEvent read FOnBeforeDeleteRecord write FOnBeforeDeleteRecord;
      property OnViewRecord: TViewRecordEvent read FOnViewRecord write FOnViewRecord;
      property OnBeforeUpdateRecord: TBeforeUpdateRecordEvent read FOnBeforeUpdateRecord write FOnBeforeUpdateRecord;
      property OnAfterAddRecord: TAfterAddRecordEvent read FOnAfterAddRecord write FOnAfterAddRecord;
      property OnAfterReadRecord: TAfterReadRecordEvent read FOnAfterReadRecord write FOnAfterReadRecord;
      property OnUpdateTopInfo: TUpdateTopInfoEvent read FOnUpdateTopInfo write FOnUpdateTopInfo;
      property OnBuildMenu: TBuildMenuEvent read FOnBuildMenu write FOnBuildMenu;
      property OnExecAction: TExecActionEvent read FOnExecAction write FOnExecAction; 
   end;

   TDBItemList=class(TObject)
   private
      FName: string;
      FMasterItem: TDBItem;
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TDBItem;
      function GetIsDataModified: Boolean;
      procedure InternalOpenEdit;
      procedure InternalEditRecord(KeyValues: TStringList);
      procedure InternalApplyEdit(KeyValues: TStringList);
      function InternalDeleteRecord(KeyValues: TStringList; Query: TAdsQuery): Boolean;
   public
      constructor Create(Name: string; MasterItem: TDBItem);
      destructor Destroy; override;
      procedure Clear;
      procedure SetDatabaseName(Value: string);
      function Open(var ErrMsg: string): Boolean;
      procedure Close;
      function Add(Item: TDBItem): Integer;
      function AddItem(Name, TableName, TableAlias, ShortName, Caption, Comm, IndexName, MasterFields, KeyFieldNames, NameFieldName, AutoIncFieldName: string; Style: TDBItemStyle): TDBItem;
      procedure NewRecord;
      procedure AddRecord;
      procedure DeleteRecord(KeyValues: string);
      procedure ApplyEdit(KeyValues: string);
      procedure EditRecord(KeyValues: string);
      procedure CheckEditMode;
      function ByName(Name: string): TDBItem;
      procedure RestoreLinks(DBList: TDBList; SprList: TDBItemList; EnumList: TEnumList);
      function FindTable(Name: string): TDBItem;
      procedure LoadFormLayoutFromIni(Ini: TCustomIniFile);
      procedure SaveFormLayoutToIni(Ini: TCustomIniFile);
      procedure LoadTableViewFromIni(Ini: TCustomIniFile);
      procedure SaveTableViewToIni(Ini: TCustomIniFile);
      procedure IncludeStyle(S: TDBItemStyles);
      procedure ExcludeStyle(S: TDBItemStyles);
      //NB: нигде не вызывается ???
      procedure UpdateSpr;
      // очистить все флаги об изменениях данных
      procedure ClearModified;
      // добавить все поля, которые связаны с заданным справочником, в список
      function FindLinkSpr(Spr: TDBItem; List: TList): Boolean;
   public
      property Name: string read FName;
      property Count: Integer read GetCount;
      property Item[I: Integer]: TDBItem read GetItem; default;
      property MasterItem: TDBItem read FMasterItem;
      property IsDataModified: Boolean read GetIsDataModified;
   end;

   TDBList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TDBItemList;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      procedure SetDatabaseName(Value: string);
      function Open(var ErrMsg: string): Boolean;
      procedure Close;
      function Add(Item: TDBItemList): Integer;
      function AddItem(Name: string; MasterItem: TDBItem): TDBItemList;
      function ByName(Name: string): TDBItemList;
      function FindTable(Name: string): TDBItem;
      procedure RestoreLinks(SprList: TDBItemList; EnumList: TEnumList);
      procedure LoadFormLayoutFromIni(Ini: TCustomIniFile);
      procedure SaveFormLayoutToIni(Ini: TCustomIniFile);
      procedure LoadTableViewFromIni(Ini: TCustomIniFile);
      procedure SaveTableViewToIni(Ini: TCustomIniFile);
      // добавить все поля, которые связаны с заданным справочником, в список
      function FindLinkSpr(Spr: TDBItem; List: TList): Boolean;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TDBItemList read GetItem; default;
   end;

   // ==========================================================================
   //
   // --------------------------------------------------------------------------
   // TEnumItem
   // TEnumList

   // стили списка значений
   TEnumItemStyles=(
      // список значений можно редактировать
      esEditable,
      // нельзя добавлять записи
      esNotAdd,
      // нельзя удалять записи
      esNotDelete,
      // нельзя менять значение
      esNotChangeCode,
      // нельзя менять наименование значения
      esNotChangeName
   );
   TEnumItemStyle=set of TEnumItemStyles;

   // список значений
   TEnumItem=class(TObject)
   private
      FName: string;
      FCaption: string;
      FComm: string;
      FFolder: string;
      FKeyList: TStringList;
      FPickList: TStringList;
      FStyle: TEnumItemStyle;
   public
      constructor Create(Name, Caption, Comm, Folder: string);
      destructor Destroy; override;
      procedure Add(Key, Pick: string); overload;
      procedure Add(Key: Integer; Pick: string); overload;
      function GetName(Value: string): string;
   public
      property Name: string read FName;
      property Caption: string read FCaption;
      property Comm: string read FComm;
      property Folder: string read FFolder;
      property KeyList: TStringList read FKeyList;
      property PickList: TStringList read FPickList;
   end;

   TEnumList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TEnumItem;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      procedure Add(Item: TEnumItem);
      function AddItem(Name, Caption, Comm, Folder: string): TEnumItem;
      function ByName(Name: string): TEnumItem;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TEnumItem read GetItem; default;
   end;

   // ==========================================================================
   // 
   // --------------------------------------------------------------------------
   // TColView
   // TTableView
   // TViewList

   TColViewStyles=(
      // видимость колонки (но она всё равно будет создаваться)
      csVisible,
      // колонка только для чтения
      csReadOnly,
      // заголовок как кнопка
      csTitleButton,
      // перенос по словам
      csWordWrap,
      // у колонки заданы свои цвета
      csOwnColor,
      // всегда показывать кнопку
      csAlwaysButton,
      // для случая, когда колонка привязана к полю, которое отсутствует в списке
      // полей на момент привязки колонк к полям (при чтении из хранилищя)
      // это, например, могут быть поля добавляемые в список полей программой
      csLateBind,
      // означает, что колнка создается и настраивается программой и её не надо
      // показывать в диалогах настройки колонок
      csInternal,
      // означает, что атрибут колонки ReadOnly пользователь менять не может
      csSetReadOnly,
      // означает, что эту колонку завела программа для отображения наименования
      // из справочника
      csNameColumn,
      // замораживать колонку
      csFrozen,
      // показывать текст и в режиме редактирования (касается показа наименования)
      // иначе в режиме редактирования будет показываться код вместо наименования
      csEditMode,
      // показывать картинки (должен быть установлен FImages)
      csImage,
      // не показывать заголовок
      csNotTitle
   );
   TColViewStyle=set of TColViewStyles;

   // режим показа наименования из справочника
   TNameFieldMode=(
      // не показывать наименование из справочника
      nmNone,
      // показывать наименования в той же колонке что и значение
      nmWithValue,
      // показывать только наименование (вместо значения)
      nmOnlyName,
      // показывать наименование в отдельной колонке
      nmNewColumn,
      //
      nmLookup
   );

   // вид показываемого наименования
   TNameFieldKind=(
      // показывать полное наименование из справочника
      nsFullName,
      // показывать сокращенное наименовани из справочника
      nsShortName,
      // показывать другое поле в качестве наименования
      nsFieldForName,
      // показывать запрос в качестве наименования
      nsSelectForName
   );

   // событие, которое вызывается у колонки, когда надо показать картинку
   TGetImageIndexEvent=function (Text: string): Integer of object;

   TColView=class(TObject)
   private
      FDBItem: TDBItem;
      FFieldItem: TFieldItem;
      FFieldName: string;
      // заголовок колонки (её название), который пользователь не может изменить
      // при настройке внешнего вида колонок
      FCaption: string;
      // изменяемый пользователем заголовок колонки
      // (если стоит стиль csNotTitle, то он не будет показываться у колонки)
      FTitle: string;
      FTitleAlign: TAlignment;
      FTitleOrientation: TTextOrientationEh;
      // ширина колонки в физических пикселах
      FWidth: Integer;
      FAlign: TAlignment;
      FColumn: TColumnEh;
      FOrder: Integer;
      FBgColor: TColor;
      FFgColor: TColor;
      FEnabled: Boolean;
      FStyle: TColViewStyle;
      FNameFieldKind: TNameFieldKind;
      FPickList: TStringList;
      FKeyList: TStringList;
      FLinkEnumName: string;
      FLinkEnum: TEnumItem;
      FLinkSprName: string;
      FLinkSpr: TDBItem;
      // поле справочника для показа в качетсве наименования
      FFieldForName: string;
      // запрос из справочника для показа в качетсве наименования
      FSelectForName: string;
      // заголовок для колонки, в которой показывается наименование из справочника
      FLinkColumnTitle: string;
      // имя поля колонки, в которой показывается наименование из справочника
      FLinkColumnFieldName: string;
      // имя поля в списке полей, которое содержит наименование из справочника
      FLinkFieldName: string;
      // алиса таблицы (справочника), которое используется для "вытаскивания" наименования
      FLinkJoinAlias: string;
      // какое подключение есть к этой колонке
      FLinkStyle: TValueLinkStyle;
      // способ выбора значений
      FSelectValueStyle: TSelectValueStyle;
      // максимальное количество строк для выпадающего списка
      FMaxDropDownRows: Integer;
      // режим показа наименования из справочника
      FNameFieldMode: TNameFieldMode;
      // используется если к колонке подключён список картинок
      // (должен бьть установлен стиль csImage)
      FImages: TImageList;
      // событие вызывается когда надо показать картинку
      // его надо использовать, если порядок картинок в FImages не соответствует
      // значению поля (должен бьть установлен стиль csImage и FImages<>nil)
      FOnGetImageIndex: TGetImageIndexEvent;
      //
      FOldOnGetText: TFieldGetTextEvent;
      // количество строк, необходимых для отображения значения
      FRowNum: Integer;
   private
      function DefaultStyle: TColViewStyle;
      function GetEnabled: Boolean;
      function GetIsLinkValue: Boolean;
      function GetLinkValueCaption: string;
      function GetField: TField;
      procedure InternalSetFieldItem(Item: TFieldItem);
      function StyleToString: string;
      function StringToStyle(S: string): TColViewStyle;
      procedure AddStyle(DoAdd: Boolean; Style: TColViewStyles);
      procedure DeleteNameLink;
      procedure OnGetText(Sender: TField; var Text: string; DisplayText: Boolean);
   public
      constructor Create(FieldItem: TFieldItem; DBItem: TDBItem);
      destructor Destroy; override;
      procedure Assign(ColView: TColView);
      function Clone: TColView;
      procedure SetKeyPickList(KeyList, PickList: TStrings);
      procedure GetKeyPickList(KeyList, PickList: TStrings);
      procedure LoadFromString(S: string);
      function SaveToString: string;
      procedure UpdateNameLink(TableView: TTableView);
      procedure RestoreLinks(SprList: TDBItemList; EnumList: TEnumList);
      function HaveStyle(Style: TColViewStyles): Boolean;
      procedure IncludeStyle(S: TColViewStyles); overload;
      procedure IncludeStyle(S: TColViewStyle); overload;
      procedure ExcludeStyle(S: TColViewStyles); overload;
      procedure ExcludeStyle(S: TColViewStyle); overload;
   public
      property Enabled: Boolean read GetEnabled write FEnabled;
      property IsLinkValue: Boolean read GetIsLinkValue;
      property LinkValueCaption: string read GetLinkValueCaption;
      property DBItem: TDBItem read FDBItem;
      property FieldItem: TFieldItem read FFieldItem;
      property Field: TField read GetField;
      property FieldName: string read FFieldName;
      property Style: TColViewStyle read FStyle;
      property NameFieldKind: TNameFieldKind read FNameFieldKind write FNameFieldKind;
      property PickList: TStringList read FPickList;
      property KeyList: TStringList read FKeyList;
      property Caption: string read FCaption write FCaption;
      property Title: string read FTitle write FTitle;
      property TitleAlign: TAlignment read FTitleAlign write FTitleAlign;
      property TitleOrientation: TTextOrientationEh read FTitleOrientation write FTitleOrientation;
      property Width: Integer read FWidth write FWidth;
      property Align: TAlignment read FAlign write FAlign;
      property Column: TColumnEh read FColumn write FColumn;
      property Order: Integer read FOrder write FOrder;
      property BgColor: TColor read FBgColor write FBgColor;
      property FgColor: TColor read FFgColor write FFgColor;
      property LinkEnumName: string read FLinkEnumName{-- write FLinkEnumName};
      property LinkSprName: string read FLinkSprName{-- write FLinkSprName};
      property LinkEnum: TEnumItem read FLinkEnum;
      property LinkSpr: TDBItem read FLinkSpr;
      property FieldForName: string read FFieldForName write FFieldForName;
      property SelectForName: string read FSelectForName write FSelectForName;
      property LinkColumnTitle: string read FLinkColumnTitle write FLinkColumnTitle;
      property LinkColumnFieldName: string read FLinkColumnFieldName write FLinkColumnFieldName;
      property LinkFieldName: string read FLinkFieldName write FLinkFieldName;
      property LinkJoinAlias: string read FLinkJoinAlias write FLinkJoinAlias;
      property LinkStyle: TValueLinkStyle read FLinkStyle write FLinkStyle;
      property SelectValueStyle: TSelectValueStyle read FSelectValueStyle write FSelectValueStyle;
      property MaxDropDownRows: Integer read FMaxDropDownRows write FMaxDropDownRows;
      property NameFieldMode: TNameFieldMode read FNameFieldMode write FNameFieldMode;
      property Images: TImageList read FImages write FImages;
      property OnGetImageIndex: TGetImageIndexEvent read FOnGetImageIndex write FOnGetImageIndex;
      property OldOnGetText: TFieldGetTextEvent read FOldOnGetText write FOldOnGetText;
      property RowNum: Integer read FRowNum write FRowNum;
   end;

   TOnChangeColView=procedure(ColView: TColView; Column: TColumnEh) of object;
   TOnAfterChangeColView=procedure(Grid: TDBGridEh) of object;

   TTableViewStyles=(
      // сохранять атоматически при закрытии окна ширину и порядок граф
      // устанавливается по умолчаниию
      tsAutoSaveColView,
      // сохранять высоту строк при выходе
      tsAutoSaveRowHeight,
      // показывать колонку номер п/п
      tsShowNppColumn,
      // замораживать колонку с номеро п/п
      tsFrozenNppCol,
      // открывать при старте программы
      tsAutoOpen,
      // показывать значение поля под таблицей или нет (подсказка)
      tsShowFooter,
      // показывать заголовок для списков или нет
      tsShowHeader,
      // разрешно менять высоту строк
      tsRowSizing,
      // использовать многострочный заголовок
      tsMultiTitle,
      // рисовать полосатую таблицу
      tsStriped,
      // запоминать последний вид (таблица, форма, ...) и автоматически его устанавливать
      // при первом показе
      tsAutoRestoreView,
      // подсвечивать строку
      tsRowHighlight,
      // все колонки таблицы находится в режиме только для чтения
      tsReadOnly,
      // окно просмотра должно работать в режиме MDI - NB: !!! пока не работает
      tsMDI,
      // в верхней части окна расположена панель информации
      tsTopInfo,
      // отображать системные фильтры
      tsSysFilter,
      // отображать дополнительную acShowInfoWin
      tsShowInfoWin,
      // автоматически создавать элементы редактирования
      tsAutoCreateControl
   );
   TTableViewStyle=set of TTableViewStyles;

   TTableViewKind=(
      // вид - таблица
      tvTable,
      // вид - форма
      tvForm
   );

   // в данном типе перечислены все доступные операции, которые можно выполнять
   // в окне просмотра/редактирования с данным представлением
   TTableViewOpers=(
      // добавить новую запись
      toAdd,
      // добавить новую папку (для иерархических таблиц)
      toAddFolder,
      // изменить запись
      toEdit,
      // удалить запись
      toDelete,
      // переместить запись вверх
      toRecordUp,
      // переместить запись вниз
      toRecordDown
   );
   TTableViewOper=set of TTableViewOpers;

   TTableView=class(TObject)
   private
      FName: string;
      FDBItem: TDBItem;
      FList: TList;
      FGrid: TDBGridEh;
      FNppColumn: TColumnEh;
      FStyle: TTableViewStyle;
      // вид таблицы
      FViewKind: TTableViewKind;
      // последний вид таблицы
      FLastViewKind: TTableViewKind;
      // ширина колонки с номером п/п
      FNppColumnWidth: Integer;
      // цвет фона колонки номер п/п
      FNppColumnBgColor: TColor;
      // цвет шрифта колонки номер п/п
      FNppColumnFgColor: TColor;
      // отступ для многострочного заголовка
      FVTitleMargin: Integer;
      // высота строк
      FRowHeight: Integer;
      // цвет фона
      FBgColor: TColor;
      // цвет шрифта
      FFgColor: TColor;
      // цвет фона для нечетных строк
      FOddBgColor: TColor;
      // цвет шрифта для нечетных строк
      FOddFgColor: TColor;
      // цвет фона для четных строк
      FEvenBgColor: TColor;
      // цвет шрифта для четных строк
      FEvenFgColor: TColor;
      // цвет фона нередактируемых полей формы
      FReadOnlyBg: TColor;
      // цвет фона нередактируемых полей формы
      FReadOnlyFg: TColor;
      // цвет фона редактируемых полей формы
      FWriteOnlyBg: TColor;
      // цвет фона редактируемых полей формы
      FWriteOnlyFg: TColor;
      //
      FRowFgColor: TColor;
      //
      FRowBgColor: TColor;
      //
      FSaveDate: string;
      // операции, которые можно выполнять с данным представлением
      // по умолчанию доступны все операции
      FOper: TTableViewOper;
      // ширина автоматически генерируемой формы редактирования записей (в пикселах)
      FFormWidth: Integer;
      FOnGetCellParams: TGetColCellParamsEventEh;
   private
      FOnSetColView: TOnChangeColView;
      FOnUpdateColView: TOnChangeColView;
      FOnAfterSetColView: TOnAfterChangeColView;
      FOnAfterUpdateColView: TOnAfterChangeColView;
   private
      procedure DoSetColView(ColView: TColView; Column: TColumnEh);
      procedure DoUpdateColView(ColView: TColView; Column: TColumnEh);
      procedure DoAfterSetColView;
      procedure DoAfterUpdateColView;
      procedure DoGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TColView;
      // стили
      function StyleToString: string;
      function StringToStyle(S: string): TTableViewStyle;
      function DefaultStyle: TTableViewStyle;
      // операции
      function OperToString: string;
      function StringToOper(S: string): TTableViewOper;
      function DefaultOper: TTableViewOper;
   public
      constructor Create(Name: string; DBItem: TDBItem);
      destructor Destroy; override;
      procedure Clear;
      procedure Assign(TableView: TTableView);
      function Clone: TTableView;
      function Add(Item: TColView): Integer;
      procedure Delete(Item: TColView);
      function AddItem(FieldItem: TFieldItem): TColView;
      function ByFieldName(FieldName: string): TColView;
      function ByFieldItem(FieldItem: TFieldItem): TColView;
      procedure Reorder;
      function SaveToString: string;
      function SaveListToString: string;
      procedure LoadFromString(S: string);
      procedure LoadListFromString(S: string);
      function SaveToIni(Ini: TCustomIniFile; Section: string): Boolean;
      function LoadFromIni(Ini: TCustomIniFile; Section: string): Boolean;
      // стили
      function HaveStyle(Style: TTableViewStyles): Boolean;
      procedure IncludeStyle(Style: TTableViewStyles); overload;
      procedure IncludeStyle(Style: TTableViewStyle); overload;
      procedure ExcludeStyle(Style: TTableViewStyles); overload;
      procedure ExcludeStyle(Style: TTableViewStyle); overload;
      // операции
      function HaveOper(Oper: TTableViewOpers): Boolean;
      procedure IncludeOper(Oper: TTableViewOpers); overload;
      procedure IncludeOper(Oper: TTableViewOper); overload;
      procedure ExcludeOper(Oper: TTableViewOpers); overload;
      procedure ExcludeOper(Oper: TTableViewOper); overload;
      procedure SetDefaultOper;
      // обновить настройки полей из grid`а
      procedure UpdateColView;
      // проинициализировать grid в соответствии с настройками полей
      procedure SetColView(Grid: TDBGridEh; OnDrawCell: TGetColCellParamsEventEh; OnButtonClick: TButtonClickEventEh; LockGrid: Boolean);
      procedure UpdateNameLink;
      procedure DeleteNameLink;
      // установить заново ссылки на FieldItem
      procedure RelinkInternalFieldItem;
      procedure SetDefaultColView;
      procedure RestoreLinks(SprList: TDBItemList; EnumList: TEnumList);
      procedure DefaultDrawCell(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
      // можно передавать несолько имен полей через запятую
      procedure ExcludeByFieldName(FieldName: string; Internal: Boolean);
      procedure DeleteByFieldName(FieldName: string; Include: Boolean);
      procedure SetReadOnly(Value: Boolean);
      // обновить настройки полей и очистить привязку к grid`у
      procedure UpdateAndClear;
   public
      property DBItem: TDBItem read FDBItem;
      property Grid: TDBGridEh read FGrid;
      property NppColumn: TColumnEh read FNppColumn; 
      property Name: string read FName write FName;
      property Count: Integer read GetCount;
      property Item[I: Integer]: TColView read GetItem; default;
      property Style: TTableViewStyle read FStyle;
      property ViewKind: TTableViewKind read FViewKind write FViewKind;
      property LastViewKind: TTableViewKind read FLastViewKind write FLastViewKind;
      property NppColumnWidth: Integer read FNppColumnWidth write FNppColumnWidth;
      property NppColumnBgColor: TColor read FNppColumnBgColor write FNppColumnBgColor;
      property NppColumnFgColor: TColor read FNppColumnFgColor write FNppColumnFgColor;
      property VTitleMargin: Integer read FVTitleMargin write FVTitleMargin;
      property RowHeight: Integer read FRowHeight write FRowHeight;
      property BgColor: TColor read FBgColor write FBgColor;
      property FgColor: TColor read FFgColor write FFgColor;
      property OddBgColor: TColor read FOddBgColor write FOddBgColor;
      property OddFgColor: TColor read FOddFgColor write FOddFgColor;
      property EvenBgColor: TColor read FEvenBgColor write FEvenBgColor;
      property EvenFgColor: TColor read FEvenFgColor write FEvenFgColor;
      property ReadOnlyBg: TColor read FReadOnlyBg write FReadOnlyBg;
      property ReadOnlyFg: TColor read FReadOnlyFg write FReadOnlyFg;
      property WriteOnlyBg: TColor read FWriteOnlyBg write FWriteOnlyBg;
      property WriteOnlyFg: TColor read FWriteOnlyFg write FWriteOnlyFg;
      property RowFgColor: TColor read FRowFgColor write FRowFgColor;
      property RowBgColor: TColor read FRowBgColor write FRowBgColor;
      property Oper: TTableViewOper read FOper write FOper;
      property FormWidth: Integer read FFormWidth write FFormWidth;
   public
      property OnSetColView: TOnChangeColView read FOnSetColView write FOnSetColView;
      property OnUpdateColView: TOnChangeColView read FOnUpdateColView write FOnUpdateColView;
      property OnAfterSetColView: TOnAfterChangeColView read FOnAfterSetColView write FOnAfterSetColView;
      property OnAfterUpdateColView: TOnAfterChangeColView read FOnAfterUpdateColView write FOnAfterUpdateColView;
      property OnGetCellParams: TGetColCellParamsEventEh read FOnGetCellParams write FOnGetCellParams;
   end;

   TViewList=class(TObject)
   private
      FList: TList;
      FDBItem: TDBItem;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TTableView;
   public
      constructor Create(DBItem: TDBItem);
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TTableView): Integer;
      procedure Delete(Item: TTableView);
      function AddItem(Name: string): TTableView;
      function ByName(Name: string): TTableView;
      procedure RestoreLinks(SprList: TDBItemList; EnumList: TEnumList);
      procedure UpdateNameLink;
      procedure DeleteNameLink;
      function SaveToIni(Ini: TCustomIniFile; Section: string): Boolean;
      function LoadFromIni(Ini: TCustomIniFile; Section: string): Boolean;
      procedure IncludeStyle(S: TTableViewStyles);
      procedure ExcludeStyle(S: TTableViewStyles);
      procedure SetReadOnly(Value: Boolean);
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TTableView read GetItem; default;
   end;

   // ==========================================================================
   // 
   // --------------------------------------------------------------------------
   // TFormLayout
   // TLayoutList

   TFormLayout=class(TObject)
   private
      FName: string;
      FFormTop: Integer;
      FFormLeft: Integer;
      FFormWidth: Integer;
      FFormHeight: Integer;
      FFormWindowState: TWindowState;
      FValueList: TStringList;
      FIsEmpty: Boolean;
   public
      constructor Create(Name: string);
      destructor Destroy; override;
      procedure SetForm(Form: TForm);
      procedure GetForm(Form: TForm);
      procedure SetInteger(Iden: string; Value: Integer);
      function GetInteger(Iden: string; DefaultValue: Integer): Integer;
      procedure SetBoolean(Iden: string; Value: Boolean);
      function GetBoolean(Iden: string; DefaultValue: Boolean): Boolean;
      procedure SetString(Iden: string; Value: String);
      function GetString(Iden: string; DefaultValue: String): String;
      function SaveToIni(Ini: TCustomIniFile; Section: string): Boolean;
      function LoadFromIni(Ini: TCustomIniFile; Section: string): Boolean;
      procedure ClearValueList;
   public
      property Name: string read FName;
      property IsEmpty: Boolean read FIsEmpty;
   end;

   TLayoutList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TFormLayout;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TFormLayout): Integer;
      procedure Delete(Item: TFormLayout);
      function AddItem(Name: string): TFormLayout;
      function ByName(Name: string): TFormLayout;
      function SaveToIni(Ini: TCustomIniFile; Section: string): Boolean;
      function LoadFromIni(Ini: TCustomIniFile; Section: string): Boolean;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TFormLayout read GetItem; default;
   end;

   // ==========================================================================
   // Иерархия классов предназначеная для создания списка элементов управления.
   // Каждый элемент списка связан с полем таблицы.
   // --------------------------------------------------------------------------
   // TDBAware                      [abstract class]
   //    |---TDBEditLink            -> TDBEditEh
   //    |---TDBNumberEditLink      -> TDBNumberEditEh
   //    |---TDBDateTimeEditLonk    -> TDBDateTimeEditEh
   //    |---TDBLookupComboBoxLink  -> TDBLookupComboboxEh
   //    |---TDBMemoLink            -> TDBMemo
   //    |---TDBComboBoxLink        -> TDBComboBoxEh
   //    \---TDBCheckBoxLink        -> TDBCheckBoxEh
   // TDBAwareList

   TOnEnterFieldEvent=procedure (Sender: TObject; FieldItem: TFieldItem) of object;

   TDBAwareList=class;

   TDBAware=class(TObject)
   private
      FOwner: TDBAwareList;
      FFieldItem: TFieldItem;
      FTag: Integer;
      FOnEnter: TOnEnterFieldEvent;
   public
      procedure SetReadOnly(Value: Boolean); virtual; abstract;
      function GetReadOnly: Boolean; virtual; abstract;
      procedure Config(ViewMode: TViewMode; OnButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent); virtual; abstract;
      function TestControl(Control: TControl): Boolean; virtual; abstract;
      procedure OnGetText(Sender: TField; var Text: string; DisplayText: Boolean); virtual;
      procedure Clear; virtual;
   public
      property FieldItem: TFieldItem read FFieldItem;
      property Owner: TDBAwareList read FOwner write FOwner;
   end;

   TDBEditLink=class(TDBAware)
   private
      FEdit: TDBEditEh;
      // показывать наименование из справочника вместо кода
      FShowName: Boolean;
      // надо очистить событие
      FClearEvent: Boolean;
      FOldOnGetText: TFieldGetTextEvent;
   public
      constructor Create(DBEdit: TDBEditEh; FieldItem: TFieldItem);
      procedure SetReadOnly(Value: Boolean); override;
      function GetReadOnly: Boolean; override;
      procedure Config(ViewMode: TViewMode; OnButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent); override;
      procedure Clear; override;
      function TestControl(Control: TControl): Boolean; override;
      procedure OnGetText(Sender: TField; var Text: string; DisplayText: Boolean); override;
      procedure OnEditEnter(Sender: TObject);
   end;

   TDBNumberEditLink=class(TDBAware)
   private
      FNumberEdit: TDBNumberEditEh;
   public
      constructor Create(DBNumberEdit: TDBNumberEditEh; FieldItem: TFieldItem);
      procedure SetReadOnly(Value: Boolean); override;
      function GetReadOnly: Boolean; override;
      procedure Config(ViewMode: TViewMode; OnButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent); override;
      function TestControl(Control: TControl): Boolean; override;
   end;

   TDBDateTimeEditLink=class(TDBAware)
   private
      FDateTimeEdit: TDBDateTimeEditEh;
   public
      constructor Create(DBDateTimeEdit: TDBDateTimeEditEh; FieldItem: TFieldItem);
      procedure SetReadOnly(Value: Boolean); override;
      function GetReadOnly: Boolean; override;
      procedure Config(ViewMode: TViewMode; OnButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent); override;
      function TestControl(Control: TControl): Boolean; override;
   end;

   TDBLookupComboBoxLink=class(TDBAware)
   private
      FLookupComboBox: TDBLookupComboboxEh;
      // надо очистить событие
      FClearEvent: Boolean;
   public
      constructor Create(DBLookupComboBox: TDBLookupComboBoxEh; FieldItem: TFieldItem);
      procedure SetReadOnly(Value: Boolean); override;
      function GetReadOnly: Boolean; override;
      procedure Config(ViewMode: TViewMode; OnButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent); override;
      function TestControl(Control: TControl): Boolean; override;
      procedure Clear; override;
   end;

   TDBMemoLink=class(TDBAware)
   private
      FMemo: TDBMemo;
   public
      constructor Create(DBMemo: TDBMemo; FieldItem: TFieldItem);
      procedure SetReadOnly(Value: Boolean); override;
      function GetReadOnly: Boolean; override;
      procedure Config(ViewMode: TViewMode; OnButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent); override;
      function TestControl(Control: TControl): Boolean; override;
   end;

   TDBComboBoxLink=class(TDBAware)
   private
      FComboBox: TDBComboBoxEh;
      // надо очистить событие
      FClearEvent: Boolean;
   public
      constructor Create(DBComboBox: TDBComboBoxEh; FieldItem: TFieldItem);
      procedure SetReadOnly(Value: Boolean); override;
      function GetReadOnly: Boolean; override;
      procedure Config(ViewMode: TViewMode; OnButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent); override;
      function TestControl(Control: TControl): Boolean; override;
      procedure Clear; override;
   end;

   TDBCheckBoxLink=class(TDBAware)
   private
      FCheckBox: TDBCheckBoxEh;
   public
      constructor Create(DBCheckBox: TDBCheckBoxEh; FieldItem: TFieldItem);
      procedure SetReadOnly(Value: Boolean); override;
      function GetReadOnly: Boolean; override;
      procedure Config(ViewMode: TViewMode; OnButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent); override;
      function TestControl(Control: TControl): Boolean; override;
   end;

   TDBGridLink=class(TDBAware)
   private
      FGrid: TDBGridEh;
      FDBItem: TDBItem;
      FClearDblClickEvent: Boolean;
   private
      procedure OnDblClick(Sender: TObject);
   public
      constructor Create(DBGrid: TDBGridEh; TableItem: TDBItem);
      procedure SetReadOnly(Value: Boolean); override;
      function GetReadOnly: Boolean; override;
      procedure Config(ViewMode: TViewMode; OnButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent); override;
      function TestControl(Control: TControl): Boolean; override;
      procedure Clear; override;
   end;

   TDBAwareList=class(TObject)
   private
      FList: TList;
      FReadOnlyBg: TColor;
      FReadOnlyFg: TColor;
      FWriteOnlyBg: TColor;
      FWriteOnlyFg: TColor;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TDBAware;
      function GetItemReadOnly(I: Integer; Owner: TDBItem): Boolean;
      procedure SetItemReadOnly(I: Integer; Owner: TDBItem; Value: Boolean);
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TDBAware): Integer;
      function AddEdit(DBEdit: TDBEditEh; FieldItem: TFieldItem): TDBAware;
      function AddNumberEdit(DBNumberEdit: TDBNumberEditEh; FieldItem: TFieldItem): TDBAware;
      function AddDateTimeEdit(DBDateTimeEdit: TDBDateTimeEditEh; FieldItem: TFieldItem): TDBAware;
      function AddMemo(DBMemo: TDBMemo; FieldItem: TFieldItem): TDBAware;
      function AddLookupComboBox(DBLookupComboBox: TDBLookupComboBoxEh; FieldItem: TFieldItem): TDBAware;
      function AddComboBox(DBComboBox: TDBComboBoxEh; FieldItem: TFieldItem): TDBAware;
      function AddCheckBox(DBCheckBox: TDBCheckBoxEh; FieldItem: TFieldItem): TDBAware;
      function AddGrid(DBGrid: TDBGridEh; TableItem: TDBItem): TDBAware;
      procedure BuildControlList(DBItem: TDBItem; WinControl: TWinControl);
      procedure ConfigControlList(ViewMode: TViewMode; OnButtonClick, OnGridButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent);
      procedure ClearControlList;
      function FindFirstEditable(WinControl: TWinControl): TWinControl;
      procedure SetFirstEditableFocus(Form: TForm);
      function ByControl(Control: TControl): TDBAware;
      procedure SetReadOnly(Value: Boolean; Owner: TDBItem);
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TDBAware read GetItem; default;
      property ItemReadOnly[I: Integer; Owner: TDBItem]: Boolean read GetItemReadOnly write SetItemReadOnly;
      property ReadOnlyBg: TColor read FReadOnlyBg write FReadOnlyBg;
      property ReadOnlyFg: TColor read FReadOnlyFg write FReadOnlyFg;
      property WriteOnlyBg: TColor read FWriteOnlyBg write FWriteOnlyBg;
      property WriteOnlyFg: TColor read FWriteOnlyFg write FWriteOnlyFg;
   end;

   // ==========================================================================
   //
   // --------------------------------------------------------------------------
   // TLookItem
   // TLookList
   // TLookTree
   // TLookTreeList

   TLookList=class;

   TLookItem=class(TObject)
   private
      FOwner: TLookList;
      FChild: TLookList;
      FCaption: string;
      FFolder: Boolean;
      FFilter: Boolean;
      FReadChild: Boolean;
      FNode: TObject;
      FImageIndex: Integer;
      FOpenIndex: Integer;
      FCloseIndex: Integer;
      FValue: Variant;
      FId: Integer;
   public
      constructor Create(Owner: TLookList; Caption: string; Folder, Filter, ReadChild: Boolean; ImageIndex, OpenIndex, CloseIndex, Id: Integer);
      destructor Destroy; override;
      function IsFolder: Boolean;
      function CanApplyFilter: Boolean;
   public
      property Owner: TLookList read FOwner;
      property Child: TLookList read FChild;
      property Caption: string read FCaption;
      property Node: TObject read FNode write FNode;
      property ImageIndex: Integer read FImageIndex;
      property OpenIndex: Integer read FOpenIndex;
      property CloseIndex: Integer read FCloseIndex;
      property Id: Integer read FId;
      property Value: Variant read FValue write FValue;
      property ReadChild: Boolean read FReadChild write FReadChild;
   end;

   TLookList=class(TObject)
   private
      FList: TList;
      FOwner: TLookItem;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TLookItem;
   public
      constructor Create(Owner: TLookItem);
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TLookItem): Integer;
      function AddItem(Caption: string; Folder, Filter, ReadChild: Boolean; ImageIndex, OpenIndex, CloseIndex, Id: Integer): TLookItem;
      procedure Delete(Item: TLookItem);
   public
      property Owner: TLookItem read FOwner;
      property Count: Integer read GetCount;
      property Item[I: Integer]: TLookItem read GetItem; default;
   end;

   TLookTree=class;

   TOnGetLookTreeEvent=function (Name: string; LookTree: TLookTree): Boolean of object;
   TOnApplyFilterEvent=function (LookTree: TLookTree; LookItem: TLookItem): Boolean of object;

   TLookTree=class(TObject)
   private
      FName: string;
      FDBItem: TDBItem;
      FRoot: TLookList;
      FCaption: string;
      FTableViewName: string;
      FImages: TImageList;
      FDoExpand: Boolean;
      FRebuild: Boolean;
      // имена справочников, от изменения которых зависит изменение данного дерева
      FSprNames: TStringList;
   private
      FOnGetLookTree: TOnGetLookTreeEvent;
      FOnApplyFilter: TOnApplyFilterEvent;
   public
      constructor Create(Name, Caption, TableViewName: string; DBItem: TDBItem; OnGetEvent: TOnGetLookTreeEvent; OnApplyFilter: TOnApplyFilterEvent; Images: TImageList; SprNameList: string);
      destructor Destroy; override;
      function ApplyFilter(Item: TLookItem): Boolean;
      procedure ReadChild(Item: TLookItem);
      function DoGetLookTree: Boolean;
      procedure Close;
      // если в дереве только один ID, то возвращает его значение, иначе -1
      function GetOneId: Integer;
   public
      property Name: string read FName;
      property TableViewName: string read FTableViewName;
      property Root: TLookList read FRoot;
      property DBItem: TDBItem read FDBItem;
      property Caption: string read FCaption;
      property Images: TImageList read FImages;
      property SprNames: TStringList read FSprNames;
   public
      property OnGetLookTree: TOnGetLookTreeEvent read FOnGetLookTree write FOnGetLookTree;
      property OnApplyFilter: TOnApplyFilterEvent read FOnApplyFilter write FOnApplyFilter;
      property DoExpand: Boolean read FDoExpand write FDoExpand;
      property Rebuild: Boolean read FRebuild write FRebuild;
   end;

   TLookTreeList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TLookTree;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TLookTree): Integer;
      function AddItem(Name, Caption, TableViewName: string; DBItem: TDBItem; OnGetEvent: TOnGetLookTreeEvent; OnApplyFilter: TOnApplyFilterEvent; Images: TImageList; SprNameList: string): TLookTree;
      procedure Delete(Item: TLookTree);
      function ByName(Name: string): TLookTree;
      // вызывается при обновлении справочника
      procedure UpdateSpr(SprName: string);
      procedure Close;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TLookTree read GetItem; default;
   end;

   // ==========================================================================
   //
   // --------------------------------------------------------------------------
   // TDBControl

   TObjectEvent=procedure of object;

   TDBControl=class(TObject)
   private
      FDBItem: TDBItem;
      FViewMode: TViewMode;
      FDBAware: TDBAwareList;
      FFormLayout: TFormLayout;
      FForm: TForm;
      FLayoutName: string;
      FIsOrder: Boolean;
      FIsTree: Boolean;
      FLastOrder: Integer;
      FParentId: Integer;
      FIsNode: Integer;
      FDlgResult: Integer;
      // группа шаблонов
      FTemplateGroup: string;
   private
      FOnSetControl: TObjectEvent;
      FOnSetControlPosition: TObjectEvent;
      FOnInvokeControlEvent: TObjectEvent;
      FOnUpdateEnabledAction: TObjectEvent;
      FOnSetControlEvent: TObjectEvent;
      FOnClearControlEvent: TObjectEvent;
      FOnLoadLayout: TObjectEvent;
      FOnClearModified: TObjectEvent;
      FOnSaveLayout: TObjectEvent;
      FOnResetControl: TObjectEvent;
   private
      function GetEditField(FieldName: string): TField;
      function GetTableField(FieldName: string): TField;
      function GetLayout(LayoutName: string): TFormLayout;
      function CanSave: Boolean;
      function GetViewField(FieldName: string): TField;
   protected
      //произошло обновление справочника
      procedure UpdateSpr(SprItem: TDBItem); virtual;
      //СОБЫТИЯ:
      // открытие таблицы
      procedure OnOpen(Sender: TDBItem); virtual;
      // перед закрытием таблицы
      procedure OnBeforeClose(Sender: TDBItem); virtual;
      // установка значений полей по умоланию
      procedure OnSetDefaultValue(Sender: TDBItem); virtual;
      // перед создание новой записи
      function OnBeforeNewRecord(Sender: TDBItem): Boolean; virtual;
      // перед редактированием записи
      function OnBeforeEditRecord(Sender: TDBItem; KeyValues: string): Boolean; virtual;
      // перед удалением записи
      function OnBeforeDeleteRecord(Sender: TDBItem; KeyValues: string): Boolean; virtual;
      // перед добавлением записи
      procedure OnBeforeUpdateRecord(Sender: TDBItem; IsNew: Boolean); virtual;
      // после добавления записи
      procedure OnAfterAddRecord(Sender: TDBItem; IsNew: Boolean); virtual;
      // после чтения записи
      procedure OnAfterReadRecord(Sender: TDBItem); virtual;
      // процедура просмотра/редактирования объекта
      function OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean; virtual;
      // обновление информации, отобращаемой в верхней части таблицы при включенном стиле tsTopInfo
      function OnUpdateTopInfo(Sender: TDBItem; RichEdit: TRichEdit; var TopInfo: string): Boolean; virtual;
      // автоматическая генерация пунктов меню
      procedure OnBuildMenu(Sender: TDBItem; Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent); virtual;
      // добавлять шаблон в меню или нет
      function AddInTemplateMenu(Template: TTemplate): Boolean; virtual;
      // выполнение дополнительных событий
      procedure OnExecAction(Sender: TDBItem); virtual;
      // при выборе элемента редактирования на форме
      procedure OnEnter(Sender: TObject; FieldItem: TFieldItem); virtual;
      // вызывается при отрисовке таблицы (TDBGridEh)
      procedure OnGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh); virtual;
   protected
      procedure DoSetControlPosition;
      procedure DoInvokeControlEvent;
      procedure DoUpdateEnabledAction;
      procedure DoSetControlEvent;           
      procedure DoClearControlEvent;
      // установить/снять связь элементов редактирования формы с полями документа
      procedure DoSetControl;
      procedure DoResetControl;
      // автоматически создать элементы редактирования
      procedure DoAutoCreateControl;
      //сброс всех флагов об изменениях данных
      procedure DoClearModified;
      // чтение/сохранение визуальных настроек
      procedure DoSaveLayout;
      procedure DoLoadLayout;
      // формирование документа по шаблону
      procedure DoTemplate(Template: TTemplate); virtual;
   public
      //СОБЫТИЯ:
      procedure OnEditButtonClick(Sender: TObject; var Handled: Boolean); virtual;
      procedure OnGridButtonClick(Sender: TObject; var Handled: Boolean); virtual;
      procedure OnTemplateMenuClick(Sender: TObject); virtual;
      // перед сохранением изменений в окне редактирования записи
      function OnFormCloseQuery(Sender: TDBItem): Boolean; virtual;
   public
      constructor Create(DBItem: TDBItem);
      destructor Destroy; override;
      // выполнить запрос и вернуть числовое значение
      function QueryIntegerValue(SQL: string; const Args: array of const; DefaultValue: Integer): Integer;
      // выполнить запрос и заполнить список строк
      procedure QueryStringList(SQL: string; const Args: array of const; sl: TStrings);
      // выполнить запрос и заполнить два списка строк
      procedure QueryStringLists(SQL: string; const Args: array of const; KeyList, PickList: TStrings);
      // отркыть форму просмотра/редактирования
      function Edit(Form: TForm): Boolean;
      //СПИСОК: добавить/редактировать/удалить/запись вверх/запись вниз
      function DetailAdd: Boolean; virtual;
      function DetailEdit: Boolean;
      function DetailDelete: Boolean; virtual;
      procedure DetailUp;
      procedure DetailDown;
   public
      property ViewField[FieldName: string]: TField read GetViewField;
      property DBItem: TDBItem read FDBItem;
      property EditField[FieldName: string]: TField read GetEditField; default;
      property TableField[FieldName: string]: TField read GetTableField;
      property ViewMode: TViewMode read FViewMode write FViewMode;
      property DBAware: TDBAwareList read FDBAware;
      property FormLayout: TFormLayout read FFormLayout write FFormLayout;
      property Form: TForm read FForm write FForm;
      property LayoutName: string read FLayoutName write FLayoutName;
      property IsOrder: Boolean read FIsOrder;
      property IsTree: Boolean read FIsTree;
      property LastOrder: Integer read FLastOrder write FLastOrder;
      property ParentId: Integer read FParentId write FParentId;
      property IsNode: Integer read FIsNode write FIsNode;
      property DlgResult: Integer read FDlgResult write FDlgResult;
      property TemplateGroup: string read FTemplateGroup write FTemplateGroup;
   public
      property OnSetControl: TObjectEvent read FOnSetControl write FOnSetControl;
      property OnSetControlPosition: TObjectEvent read FOnSetControlPosition write FOnSetControlPosition;
      property OnInvokeControlEvent: TObjectEvent read FOnInvokeControlEvent write FOnInvokeControlEvent;
      property OnUpdateEnabledAction: TObjectEvent read FOnUpdateEnabledAction write FOnUpdateEnabledAction;
      property OnSetControlEvent: TObjectEvent read FOnSetControlEvent write FOnSetControlEvent;
      property OnClearControlEvent: TObjectEvent read FOnClearControlEvent write FOnClearControlEvent;
      property OnLoadLayout: TObjectEvent read FOnLoadLayout write FOnLoadLayout;
      property OnClearModified: TObjectEvent read FOnClearModified write FOnClearModified;
      property OnSaveLayout: TObjectEvent read FOnSaveLayout write FOnSaveLayout;
      property OnResetControl: TObjectEvent read FOnResetControl write FOnResetControl;
   end;

   // ==========================================================================
   //
   // --------------------------------------------------------------------------
   // 


const
   // эти константы задают способ отображения значения поля при редактировании
   // (их надо проставлять в поле Tag)
   vkOnlyName   = 1; // только наименование из справочника
   vkWithValue  = 2; // наименование вместе со значением

   // IS_NODE - признак узел/лист дерева
   iNode =1;   // узел
   iLeaf =2;   // лист дерева

   //
   CMaxDropDownRows =20;

   // имя для настроек колонок таблицы по умолчанию
   CDefaultTableViewName='DEFAULT';

   //
   CSprEditTableView    ='SPR_EDIT';
   CSprSelectTableView  ='SPR_SELECT';


procedure UpdateAndClearTableView(TableView: TTableView); overload;
procedure UpdateAndClearTableView(DBItem: TDBItem); overload;

//Вспомогательные функции - NB: !!! переделать на использование модуля mCommon

procedure AddString(var S: string; AddS, Delimeter: string);
procedure CopyDataSetToDataSet(Src, Dst: TDataSet);
procedure SetBookmark(DataSet: TDataSet; Bookmark: string);
procedure SetDropDownWidth(cb: TDBComboBoxEh);

implementation
uses
   fSprEdit;

procedure UpdateAndClearTableView(TableView: TTableView); overload;
begin
   if TableView<>nil then begin
      TableView.UpdateAndClear;
   end;
end;

procedure UpdateAndClearTableView(DBItem: TDBItem); overload;
begin
   if (DBItem<>nil) and (DBItem.TableView<>nil) then begin
      DBItem.TableView.UpdateAndClear;
   end;
end;

procedure SetBookmark(DataSet: TDataSet; Bookmark: string);
begin
   if DataSet.BookmarkValid(TBookmark(Bookmark)) then begin
      DataSet.Bookmark:=Bookmark;
   end;
end;

procedure AddString(var S: string; AddS, Delimeter: string);
begin
   if S='' then begin
      S:=AddS;
   end
   else if AddS<>'' then begin
      S:=S+Delimeter+AddS;
   end;
end;

procedure CopyDataSetToDataSet(Src, Dst: TDataSet);
var
   I: Integer;
   FieldCount: Integer;
   SrcField: array of TField;
   DstField: array of TField;
begin
   FieldCount:=0;
   SetLength(SrcField, 0);
   SetLength(DstField, 0);
   for I:=0 to Pred(Dst.FieldCount) do begin
      if Src.FindField(Dst.Fields[I].FieldName)<>nil then begin
         Inc(FieldCount);
         SetLength(SrcField, FieldCount);
         SetLength(DstField, FieldCount);
         SrcField[Pred(FieldCount)]:=Src.FindField(Dst.Fields[I].FieldName);
         DstField[Pred(FieldCount)]:=Dst.Fields[I];
      end;
   end;
   Src.First;
   while not Src.Eof do begin
      Dst.Append;
      for I:=0 to Pred(FieldCount) do begin
         DstField[I].AsString:=SrcField[I].AsString;
      end;
      Dst.Post;
      Src.Next;
   end;
end;

procedure SetDropDownWidth(cb: TDBComboBoxEh);
var
   I: Integer;
   MaxWidth: Integer;
   ItemWidth: Integer;
begin
   ItemWidth:=cb.ClientWidth;
   MaxWidth:=GetSystemMetrics(SM_CXFULLSCREEN)-cb.Parent.ClientToScreen(Point(cb.Left, cb.Top)).X;
   for I:=0 to Pred(cb.Items.Count) do begin
      ItemWidth:=Max(ItemWidth, GetTextWidth(cb.Items[I], cb.Font.Height, cb.Font.Name, False)+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXBORDER));
   end;
   cb.DropDownBox.Width:=Min(MaxWidth, ItemWidth);
end;

{ TFieldItem }

procedure TFieldItem.AddStyle(DoAdd: Boolean; S: TFieldStyles);
begin
   if DoAdd then begin
      Include(FStyle, S);
   end;
end;

function TFieldItem.CanEdit: Boolean;
begin
   Result:=(fsEditVisible in FStyle) and not (fsReadOnly in FStyle) and (not FDBItem.HaveStyle(bsReadOnly)); 
end;

procedure TFieldItem.CopyField(SrcField, DestField: TField);
begin
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

constructor TFieldItem.Create(DBItem: TDBItem; Name, FieldName, Synonim, Caption, Comm, Group, LinkSprName, LinkEnumName: string; Order: Integer; Style: TFieldStyle; LinkStyle: TValueLinkStyle; SelectValueStyle: TSelectValueStyle; DataKind: TFieldDataKind);
begin
   FDBItem:=DBItem;
   FName:=AnsiUpperCase(Trim(Name));
   FFieldName:=AnsiUpperCase(Trim(FieldName));
   FSynonim:=Trim(Synonim);
   FCaption:=Caption;
   FAddCaption:='';
   FComm:=Comm;
   FGroup:=Group;
   FDataKind:=DataKind;
   FLinkSprName:=AnsiUpperCase(Trim(LinkSprName));
   FLinkEnumName:=AnsiUpperCase(Trim(LinkEnumName));
   if FDBItem<>nil then begin
      FTableAlias:=FDBItem.TableAlias;
   end
   else begin
      FTableAlias:='';
   end;
   FSrcField:=nil;
   FDestField:=nil;
   FViewField:=nil;
   FStyle:=Style;
   FLinkStyle:=LinkStyle;
   FSelectValueStyle:=SelectValueStyle;
   FOrder:=Order;
   FOrderBy:=-1;
   FFasetStart:=0;
   FFasetLength:=0;
   FFasetFieldName:='';
   FSelectText:='';
   FFindOperation:='';
   FLinkEnum:=nil;
   FLinkSpr:=nil;
   FSize:=0;
   FLookupFieldName:='';
   FInternalLink:=TList.Create;
end;

procedure TFieldItem.Dest2Src;
begin
   if not (fsServerSide in FStyle) then begin
      CopyField(FDestField, FSrcField);
   end;
end;

destructor TFieldItem.Destroy;
begin
   FInternalLink.Free;
   inherited;
end;

procedure TFieldItem.ExcludeStyle(S: TFieldStyles);
begin
   Exclude(FStyle, S);
end;

function TFieldItem.HaveStyle(Style: TFieldStyles): Boolean;
begin
   Result:=Style in FStyle;
end;

procedure TFieldItem.IncludeStyle(S: TFieldStyles);
begin
   Include(FStyle, S);
end;

procedure TFieldItem.RestoreLinks(SprList: TDBItemList; EnumList: TEnumList);
begin
   FLinkSpr:=nil;
   FLinkEnum:=nil;
   case FLinkStyle of
      lsLinkSpr: begin
         if (FLinkSprName<>'') and (SprList<>nil) then begin
            FLinkSpr:=SprList.ByName(FLinkSprName);
         end;
      end;
      lsLinkEnum: begin
         if (FLinkEnumName<>'') and (EnumList<>nil) then begin
            FLinkEnum:=EnumList.ByName(FLinkEnumName);
         end;
      end;
   end;
end;

procedure TFieldItem.SetField(SrcDataSet, DestDataSet: TDataSet);
begin
   if (SrcDataSet<>nil) and (DestDataSet<>nil) then begin
      FSrcField:=SrcDataSet.FindField(FFieldName);
      FDestField:=DestDataSet.FindField(FFieldName);
   end
   else begin
      FSrcField:=nil;
      FDestField:=nil;
   end;
end;

procedure TFieldItem.SetViewField(ViewDataSet: TDataSet);
begin
   if ViewDataSet<>nil then begin
      FViewField:=ViewDataSet.FindField(FName);
   end
   else begin
      FViewField:=nil;
   end;
end;

procedure TFieldItem.Src2Dest;
begin
   CopyField(FSrcField, FDestField);
end;

{ TFieldList }

function TFieldList.Add(Item: TFieldItem): Integer;
begin
   Result:=FList.Add(Item);
end;

function TFieldList.AddItem(Name, FieldName, Synonim, Caption, Comm, Group, LinkSprName, LinkEnumName: string; Order: Integer; Style: TFieldStyle; LinkStyle: TValueLinkStyle; SelectValueStyle: TSelectValueStyle; DataKind: TFieldDataKind): TFieldItem;
begin
   Result:=TFieldItem.Create(FDBItem, Name, FieldName, Synonim, Caption, Comm, Group, LinkSprName, LinkEnumName, Order, Style, LinkStyle, SelectValueStyle, DataKind);
   if FDBItem<>nil then begin
      FDBItem.AddField(Result);
   end;
   Add(Result);
end;

procedure TFieldList.BuildDataSetFieldList(DataSet: TDataSet; IsQuery: Boolean);
var
   I: Integer;
   FieldItem: TFieldItem;
   LookupFieldItem: TFieldItem;
   Field: TField;
   FieldDef: TFieldDef;
   FieldName: string;
begin
   if not DataSet.Active then begin
      DataSet.Fields.Clear;
      // NB: возможно это не самый быстрый способ делать каждый раз Update
      DataSet.FieldDefs.Update;
      for I:=0 to Pred(GetCount) do begin
         FieldItem:=GetItem(I);
         if IsQuery then begin
            FieldName:=FieldItem.Name;
         end
         else begin
            FieldName:=FieldItem.FieldName;
         end;
         if FieldItem<>nil then begin
            if FieldItem.HaveStyle(fsLookup) then begin
               LookupFieldItem:=ByName(FieldItem.LookupFieldName);
               if (LookupFieldItem<>nil) and (FieldItem.LinkStyle=lsLinkSpr) and (FieldItem.LinkSpr<>nil) then begin
//lookup               if (LookupFieldItem<>nil) and (LookupFieldItem.LinkStyle=lsLinkSpr) and (LookupFieldItem.LinkSpr<>nil) then begin
                  Field:=TStringField.Create(DataSet);
                  // NB: заплатка
                  Field.Size:=300;
                  //--if FieldItem.Size<>0 then begin
                  //--   Field.Size:=FieldItem.Size;
                  //--end;
                  Field.FieldName:=FieldName;
                  Field.FieldKind:=fkLookup;
                  Field.DataSet:=DataSet;
//lookup                  Field.Name:='LOOKUP_'+LookupFieldItem.Name;
                  Field.Name:=FieldItem.Name;
                  if IsQuery then begin
                     Field.KeyFields:=LookupFieldItem.Name;
                  end
                  else begin
                     Field.KeyFields:=LookupFieldItem.FieldName;
                  end;
//lookup                  Field.LookupDataset:=LookupFieldItem.LinkSpr.Table;
//lookup                  Field.LookupKeyFields:=LookupFieldItem.LinkSpr.CodeFieldName;{KeyFieldName}
//lookup                  Field.LookupResultField:=LookupFieldItem.LinkSpr.NameFieldName;
                  Field.LookupDataset:=FieldItem.LinkSpr.Table;
                  Field.LookupKeyFields:=FieldItem.LinkSpr.CodeFieldName;{KeyFieldName}
                  Field.LookupResultField:=FieldItem.LinkSpr.NameFieldName;
              end;
            end
            else if DataSet.FieldDefs.IndexOf(FieldName)<>-1 then begin
               FieldDef:=DataSet.FieldDefs.Find(FieldName);
               if DefaultFieldClasses[FieldDef.DataType]<>nil then begin
                  Field:=DefaultFieldClasses[FieldDef.DataType].Create(DataSet);
                  Field.FieldName:=FieldName;
                  Field.FieldKind:=fkData;
                  Field.DataSet:=DataSet;
                  Field.Name:=FieldName;
                  Field.Size:=FieldDef.Size;
               end;
            end;
         end;
      end;
      // NB: поле с rowid добавляем отдельно
      if IsQuery then begin
         if (FDBItem<>nil) and (FDBItem.RowIdFieldName<>'') and (bsView in FDBItem.Style) then begin
            Field:=TStringField.Create(DataSet);
            Field.FieldName:=FDBItem.RowIdFieldName;
            Field.FieldKind:=fkData;
            Field.DataSet:=DataSet;
            Field.Name:=FDBItem.RowIdFieldName;
         end;
      end;
   end;
end;

function TFieldList.ByName(Name: string): TFieldItem;
var
   I: Integer;
   Item: TFieldItem;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if AnsiCompareText(Item.Name, Name)=0 then begin
         Result:=Item;
         Break;
      end;
   end;
end;

procedure TFieldList.Clear;
var
   I: Integer;
   Item: TFieldItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.Free;
   end;
   FList.Clear;
end;

constructor TFieldList.Create(DBItem: TDBItem);
begin
   FList:=TList.Create;
   FDBItem:=DBItem;
end;

procedure TFieldList.CreateEditTable2(EditTable: TkbmMemTable);
var
   I: Integer;
   FieldDef: TFieldDef;
   Field: TField;
   LookupField: TField;
   EditField: TField;
   Item: TFieldItem;
   IndexDef: TIndexDef;
   Index: TTableIndex;
begin
   if FDBItem<>nil then begin
      // создание полей
      {FDBItem.}EditTable.FieldDefs.Clear;
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         Field:=FDBItem.Table.FindField(Item.FieldName);
         if (Field<>nil) and (Field.FieldKind=fkData) then begin
            FieldDef:={FDBItem.}EditTable.FieldDefs.AddFieldDef;
            FieldDef.Name:=Field.FieldName;
            if AnsiCompareText(Item.FieldName, FDBItem.AutoIncFieldName)=0 then begin
               FieldDef.DataType:=ftAutoInc;
            end
            else begin
               FieldDef.DataType:=Field.DataType;
               FieldDef.Size:=Field.Size;
            end;
            FieldDef.DisplayName:=Field.FieldName;
            if Field is TFloatField then begin
               FieldDef.Precision:=TFloatField(Field).Precision;
            end;
         end;
      end;
      // создание индекса
      Index:=nil;
      if FDBItem.IndexName<>'' then begin
         Index:=FDBItem.IndexList.ByName(FDBItem.IndexName);
         if Index<>nil then begin
            {FDBItem.}EditTable.IndexDefs.Clear;
            IndexDef:={FDBItem.}EditTable.IndexDefs.AddIndexDef;
            IndexDef.Name:=Index.Name;
            IndexDef.Fields:=Index.FieldNames;
            IndexDef.Options:=[];
            if isPrimary in Index.Style then begin
               IndexDef.Options:=IndexDef.Options+[ixPrimary];
            end;
            if isUnique in Index.Style then begin
               IndexDef.Options:=IndexDef.Options+[ixUnique];
            end;
         end;
      end;
      // создание временной таблицы
      {FDBItem.}EditTable.CreateTable;
      // устанавливаем индекс (если надо)
      if Index<>nil then begin
         {FDBItem.}EditTable.IndexName:=Index.Name;
         {FDBItem.}EditTable.IndexFieldNames:=Index.FieldNames;
      end;
      // копируем заголовки полей
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         Field:=FDBItem.Table.FindField(Item.FieldName);
         EditField:={FDBItem.}EditTable.FindField(Item.FieldName);
         if (Field<>nil) and (EditField<>nil) then begin
            EditField.DisplayLabel:=Field.DisplayLabel;
            EditField.DisplayWidth:=Field.DisplayWidth;
         end;
      end;
      // копируем lookup поля
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         Field:=FDBItem.Table.FindField(Item.FieldName);
         if (Field<>nil) and (Field.FieldKind=fkLookup) then begin
            LookupField:=TStringField.Create({FDBItem.}EditTable);
            LookupField.Size:=Field.Size;
            LookupField.FieldName:=Field.FieldName;
            LookupField.FieldKind:=fkLookup;
            LookupField.DataSet:={FDBItem.}EditTable;
            LookupField.Name:=Field.Name+'2';
            LookupField.KeyFields:=Field.KeyFields;
            LookupField.LookupDataSet:=Field.LookupDataSet;
            LookupField.LookupKeyFields:=Field.LookupKeyFields;
            LookupField.LookupResultField:=Field.LookupResultField;
         end;
      end;
   end;
end;

procedure TFieldList.CreateEditTable;
begin
   if FDBItem<>nil then begin
      CreateEditTable2(FDBItem.EditTable)
   end;
end;

procedure TFieldList.Delete(Item: TFieldItem);
var
   I: Integer;
begin
   if Item<>nil then begin
      I:=FList.IndexOf(Item);
      if I<>-1 then begin
         FList.Delete(I);
      end;
      Item.Free;
   end;
end;

procedure TFieldList.Dest2Src;
var
   I: Integer;
   Item: TFieldItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.Dest2Src;
   end;
end;

destructor TFieldList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TFieldList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TFieldList.GetItem(I: Integer): TFieldItem;
begin
   Result:=TFieldItem(FList[I]);
end;

procedure TFieldList.RestoreLinks(SprList: TDBItemList; EnumList: TEnumList);
var
   I: Integer;
   Item: TFieldItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.RestoreLinks(SprList, EnumList);
      end;
   end;
end;

procedure TFieldList.SetField(SetNil: Boolean);
var
   I: Integer;
   Item: TFieldItem;
begin
   if FDBItem<>nil then begin
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         if SetNil then begin
            Item.SetField(nil, nil);
         end
         else begin
            Item.SetField(FDBItem.Table, FDBItem.EditTable);
         end;
      end;
   end;
end;

procedure TFieldList.SetViewField(SetNil: Boolean);
var
   I: Integer;
   Item: TFieldItem;
begin
   if FDBItem<>nil then begin
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         if SetNil then begin
            Item.SetViewField(nil);
         end
         else begin
            Item.SetViewField(FDBItem.ViewQuery);
         end;
      end;
   end;
end;

procedure TFieldList.Src2Dest;
var
   I: Integer;
   Item: TFieldItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.Src2Dest;
   end;
end;

function TFieldList.FindLinkSpr(Spr: TDBItem; List: TList): Boolean;
var
   I: Integer;
   Item: TFieldItem;
begin
   Result:=False;
   if (List<>nil) and (Spr<>nil) then begin
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         if (Item.LinkSpr=Spr) and not Item.HaveStyle(fsLookup) then begin
            List.Add(Item);
            Result:=True;
         end;
      end;
   end;
end;

{ TDBItem }

procedure TDBItem.AddField(FieldItem: TFieldItem);
begin
// empty
end;

procedure TDBItem.AddRecord;
begin
   if FEditTable.Active then begin
      FEditTable.CheckBrowseMode;
      FEditTable.First;
      while not FEditTable.Eof do begin
         FTable.Append;
         FFieldList.Dest2Src;
         DoBeforeUpdateRecord(True);
         FTable.Post;
         if bsMaster in Style then begin
            FDetailList.AddRecord;
         end;
         DoAfterAddRecord(True);
         FEditTable.Next;
      end;
      RefreshView;
   end;
   FEditMode:=emNone;
end;

procedure TDBItem.ApplyEdit(KeyValues: string);
var
   sl: TStringList;
   Query: TAdsQuery;
begin
   if (Trim(KeyValues)<>'') and FEditTable.Active then begin
      sl:=TStringList.Create;
      Query:=TAdsQuery.Create(nil);
      Query.DatabaseName:=FDatabaseName;
      try
         sl.CommaText:=KeyValues;
         FDetailList.InternalDeleteRecord(sl, Query);
         InternalApplyEdit(sl);
      finally
         Query.Free;
         sl.Free;
      end;
   end;
   FEditMode:=emNone;
end;

procedure TDBItem.CancelEdit;
begin
   //NB: ??? FEditTable.Cancel
   CheckEditMode;
   FEditMode:=emNone;
end;

procedure TDBItem.CheckEditMode;
begin
   FEditTable.CheckBrowseMode;
   FDetailList.CheckEditMode;
end;

procedure TDBItem.Close;
begin
   DoBeforeClose;
   FLook.Close;
   FTable.Close;
   FEditTable.Close;
   CloseView;
   FCanModify:=False;
   FIsOpen:=False;
   FPickList.Clear;
   FKeyList.Clear;
   FDetailList.Close;
end;

procedure TDBItem.CloseView;
begin
   FViewQuery.Close;
   FViewQuery.AdsCloseSQLStatement;
   FViewRowidField:=nil;
   FIsViewOpen:=False;
end;

constructor TDBItem.Create(Name, TableName, TableAlias, ShortName, Caption, Comm, IndexName, MasterFields, KeyFieldNames, NameFieldName, AutoIncFieldName: string; Style: TDBItemStyle);
begin
   FRowIdFieldName:='ROWID';
   FName:=AnsiUpperCase(Trim(Name));
   FSynonim:=FName;
   FTableName:=TableName;
   FTableAlias:=TableAlias;
   FShortName:=ShortName;
   FCaption:=Caption;
   FComm:=Comm;
   FIndexName:=AnsiUpperCase(Trim(IndexName));
   FMasterFields:=AnsiUpperCase(Trim(MasterFields));
   FKeyFieldNames:=AnsiUpperCase(Trim(KeyFieldNames));
   FKeyFieldList:=TStringList.Create;
   FKeyFieldList.CommaText:=FKeyFieldNames;
   FCodeFieldName:=FKeyFieldNames;
   FNameFieldName:=AnsiUpperCase(Trim(NameFieldName));
   FShortFieldName:=FNameFieldName;
   FPickFieldNames:=FNameFieldName;
   FAutoIncFieldName:=AnsiUpperCase(Trim(AutoIncFieldName));
   FStyle:=Style+DefaultStyle;
   FViewQuery:=TAdsQuery.Create(nil);
   FViewSource:=TDataSource.Create(nil);
   FViewSource.DataSet:=FViewQuery;
   FEditTable:=TkbmMemTable.Create(nil);
   FEditSource:=TDataSource.Create(nil);
   FEditSource.DataSet:=FEditTable;
   FTable:=TAdsTable.Create(nil);
   // таблицы открываются в режиме общего доступа
   FTable.Exclusive:=False;
   FTable.TableName:=TableName;
   FMasterSource:=TDataSource.Create(nil);
   if bsMaster in FStyle then begin
      FMasterSource.DataSet:=FTable;
   end;
   FTableSource:=TDataSource.Create(nil);
   if bsSpr in FStyle then begin
      FTableSource.DataSet:=FTable;
   end;
   FDatabaseName:='';
   FIsOpen:=False;
   FIsViewOpen:=False;
   FMasterItem:=nil;
   FDetailList:=TDBItemList.Create('', Self);
   FFieldList:=TFieldList.Create(Self);
   FEditMode:=emNone;
   FSQLOrder:='';
   FSQLWhere:='';
   FLookFilter:='';
   FIndexList:=TTableIndexList.Create;
   FKeyList:=TStringList.Create;
   FPickList:=TStringLists.Create;
   FViewList:=TViewList.Create(Self);
   FViewList.AddItem(CDefaultTableViewName);
   if bsTree in FStyle then begin
      FIsNodeFieldName:='IS_NODE';
      FParentIdFieldName:='PARENT_ID';
   end
   else begin
      FIsNodeFieldName:='';
      FParentIdFieldName:='';
   end;
   if bsOrder in FStyle then begin
      FOrderFieldName:='N_ORDER';
   end
   else begin
      FOrderFieldName:='';
   end;
   FRelationList:=TRelationList.Create;
   FJoinList:=TJoinList.Create;
   FIsFiltered:=False;
   FLayoutList:=TLayoutList.Create;
   FCanModify:=False;
   FFilterWhere:='';
   FFilterOrderBy:='';
   FFindOrder:=0;
   FFindOperation:='';
   FFindGroup:='';
   FLook:=TLookTreeList.Create;
   FTableFilter:='';
   FSysFilter:=TStringList.Create;
end;

procedure TDBItem.DeleteRecord(KeyValues: string);
var
   sl: TStringList;
   Query: TAdsQuery;
begin
   if Trim(KeyValues)<>'' then begin
      sl:=TStringList.Create;
      Query:=TAdsQuery.Create(nil);
      Query.DatabaseName:=FDatabaseName;
      try
         sl.CommaText:=KeyValues;
         InternalDeleteRecord(sl, Query);
      finally
         Query.Free;
         sl.Free;
      end;
      RefreshView;
   end;
end;

destructor TDBItem.Destroy;
begin
   Close;
   FLook.Free;
   FLayoutList.Free;
   FJoinList.Free;
   FRelationList.Free;
   FViewList.Free;
   FPickList.Free;
   FKeyList.Free;
   FIndexList.Free;
   FFieldList.Free;
   FDetailList.Free;
   FViewQuery.Free;
   FViewSource.Free;
   FEditTable.Free;
   FEditSource.Free;
   FTable.Free;
   FTableSource.Free;
   FMasterSource.Free;
   if FFilterInterface<>nil then begin
      FFilterInterface.Free;
   end;
   FKeyFieldList.Free;
   FSysFilter.Free;
   inherited;
end;

procedure TDBItem.EditRecord(KeyValues: string);
var
   sl: TStringList;
begin
   if Trim(KeyValues)<>'' then begin
      if DoBeforeEditRecord(KeyValues) then begin
         InternalOpenEdit;
         sl:=TStringList.Create;
         try
            sl.CommaText:=KeyValues;
            InternalEditRecord(sl);
         finally
            sl.Free;
         end;
         DoAfterReadRecord;
      end;
   end;
end;

function TDBItem.GetDeleteSQL(KeyValues: string): string;
var
   sl: TStringList;
begin
   // NB: здесь не учтено что ключевые поля могут быть разных типов
   //     пока это уравновешивается тем, что значение для этой функции
   //     обычно используется то, которое возвращает GetKeyValues
   Result:='';
   if KeyValues<>'' then begin
      sl:=TStringList.Create;
      try
         sl.CommaText:=KeyValues;
         Result:=InternalGetDeleteSQL(sl);
      finally
         sl.Free;
      end;
   end;
end;

function TDBItem.GetViewSQL(Formating, OnlyForCount: Boolean): string;
var
   Filter_Where: string;
   Filter_OrderBy: string;
begin
   Filter_Where:='';
   Filter_OrderBy:='';
   if FIsFiltered then begin
      Filter_Where:=FFilterWhere;
      Filter_OrderBy:=FFilterOrderBy
   end;
   Result:=InternalGetViewSQL('', FSQLWhere, Filter_Where, FSQLOrder, Filter_OrderBy, FRowIdFieldName, Formating, OnlyForCount);
end;

function TDBItem.DoBeforeNewRecord: Boolean;
begin
   if Assigned(FOnBeforeNewRecord) then begin
      Result:=FOnBeforeNewRecord(Self);
   end
   else begin
      Result:=True;
   end;
end;

function TDBItem.NewRecord: Boolean;
begin
   Result:=DoBeforeNewRecord;
   if Result then begin
      InternalOpenEdit;
      InternalAppendEdit;
      FEditMode:=emNew;
   end;
end;

function TDBItem.Open(var ErrMsg: string): Boolean;
begin
   Result:=True;
   ErrMsg:='';
   try
      Close;
      SetIndex;
      SetKeyFieldList;
      //--if not (bsView in FStyle) then begin
         FFieldList.BuildDataSetFieldList(FTable, False);
      //--end;
      {!}FFieldList.CreateEditTable;
      {++}FTable.Filter:=FTableFilter;
      {++}FTable.Filtered:=FTableFilter<>'';
      FTable.Open;
      FCanModify:=FTable.CanModify;
      FFieldList.SetField(False);
      if not FDetailList.Open(ErrMsg) then begin
         raise Exception.Create(ErrMsg);
      end;
      if (bsDetail in FStyle) and (FMasterItem<>nil) then begin
         FEditTable.MasterFields:=FMasterFields;
         FEditTable.MasterSource:=FMasterItem.EditSource;
      end;
      DoOpen;
      FIsOpen:=True;
   except
      on E: Exception do begin
         ErrMsg:=Format('Ошибка при открытии "%s".'#13'%s', [FCaption, E.Message]);
         Result:=False;
      end;
   end;
end;

procedure TDBItem.OpenView;
begin
   if bsView in FStyle then begin
      CloseView;
      FViewQuery.SQL.Text:=GetViewSQL(False, False);
      InternalChangeView(False);
      FViewQuery.Open;
      InternalChangeView(True);
      FIsViewOpen:=True;
   end;
end;

procedure TDBItem.RefreshView;
var
   RowId: string;
begin
   if FIsViewOpen then begin
      if FViewQuery.Active then begin
         FViewQuery.DisableControls;
///////////////--!!!!!!!!!!!!!!!!!--//////////////////////         Screen.Cursor:=crHourGlass;
         try
            RowId:=FViewRowidField.AsString;
            FViewQuery.Close;
            FViewQuery.Fields.Clear;
            FViewQuery.SQL.Text:=GetViewSQL(False, False);
            InternalChangeView(False);
            FViewQuery.Open;
            InternalChangeView(True);
            FViewQuery.Locate(FRowIdFieldName, RowId, []);
         finally
            Screen.Cursor:=crDefault;
            FViewQuery.EnableControls;
         end;
      end;
   end;
end;

procedure TDBItem.SetDatabaseName(Value: string);
begin
   FDatabaseName:=Value;
   FTable.DatabaseName:=Value;
   if bsView in FStyle then begin
      FViewQuery.DatabaseName:=Value;
   end;
   FDetailList.SetDatabaseName(Value);
end;

procedure TDBItem.DoSetDefaultValue;
begin
   if Assigned(FOnSetDefaultValue) then begin
      FOnSetDefaultValue(Self);
   end;
end;

procedure TDBItem.SetMasterItem(Item: TDBItem);
begin
   FMasterItem:=Item;
   if (bsDetail in FStyle) and (FMasterItem<>nil) then begin
      //--FTable.IndexName:=FIndexName; // нельзя было так присваивать, потому что это не имя физического индекса
      FTable.MasterFields:=FMasterFields;
      FTable.MasterSource:=FMasterItem.MasterSource;
      //---
   end;
end;

procedure TDBItem.DoOpen;
begin
   if Assigned(FOnOpen) then begin
      FOnOpen(Self);
   end;
end;

function TDBItem.GetKeyValues(SourceKind: TSourceKind): string;
var
   sl: TStringList;
begin
   Result:='';
   //--if FIsViewOpen then begin
      sl:=TStringList.Create;
      try
         InternalGetKeyValues(sl, SourceKind);
         Result:=sl.CommaText;
      finally
         sl.Free;
      end;
   //--end;
end;

procedure TDBItem.ViewRecord(KeyValues: string);
begin
   if Trim(KeyValues)<>'' then begin
      EditRecord(KeyValues);
      FEditMode:=emView;
   end;
end;

procedure TDBItem.InternalAppendEdit;
begin
   FEditTable.Append;
   DoSetDefaultValue;
   //FDetailList.InternalAppendEdit;
end;

procedure TDBItem.InternalOpenEdit;
begin
   if FEditTable.Active then begin
      FEditTable.EmptyTable;
   end
   else begin
      FEditTable.Open;
   end;
   FEditTable.AutoIncMinValue:=1;
   FEditTable.ResetAutoInc;
   FDetailList.InternalOpenEdit;
end;

procedure TDBItem.InternalEditRecord(KeyValues: TStringList);
begin
   if bsDetail in FStyle then begin
      FTable.First;
      while not FTable.Eof do begin
         FEditTable.Append;
         FFieldList.Src2Dest;
         FEditTable.Post;
         if bsMaster in FStyle then begin
            FDetailList.InternalEditRecord(KeyValues);
         end;
         FTable.Next;
      end;
   end
   else if InternalLocate(KeyValues) then begin
      FEditTable.Append;
      FFieldList.Src2Dest;
      FEditTable.Post;
      if bsMaster in FStyle then begin
         FDetailList.InternalEditRecord(KeyValues);
      end;
   end;
   FEditMode:=emEdit;
end;

procedure TDBItem.InternalApplyEdit(KeyValues: TStringList);
begin
   FEditTable.CheckBrowseMode;
   if bsDetail in FStyle then begin
      FEditTable.First;
      while not FEditTable.Eof do begin
         FTable.Append;
         // NB: возможно надо завести тут другое событие 
         FFieldList.Dest2Src;
         DoBeforeUpdateRecord(False);
         FTable.Post;
         if bsMaster in Style then begin
            FDetailList.InternalApplyEdit(KeyValues);
         end;
         DoAfterAddRecord(False);
         FEditTable.Next;
      end;
   end
   else if InternalLocate(KeyValues) then begin
      FTable.Edit;
      FFieldList.Dest2Src;
      DoBeforeUpdateRecord(False);
      FTable.Post;
      if bsMaster in FStyle then begin
         FDetailList.InternalApplyEdit(KeyValues);
      end;
      DoAfterAddRecord(False);
   end;
   RefreshView;
end;

procedure TDBItem.GetKeyPickList(KeyList, PickList: TStrings; NameFieldName: string);
var
   sl: TStringList;
begin
   sl:=GetPickList(NameFieldName);
   if sl<>nil then begin
      PickList.Assign(sl);
      KeyList.Assign(FKeyList);
   end;
end;

(*--
procedure TDBItem.GetKeyPickList(KeyList, PickList: TStrings; NameFieldName: string);
var
   sl: TStringList;
   fl: Boolean;
   CodeField: TField;
   NameField: TField;
   Bookmark: string;
begin
   // NB: - тут надо ещё подумать в какой момент читать эти списки (может быть заранее)
   //       и каким образом - через отдельно открываемый запрос или набор данных
   //     - нужно иметь возможность задовать порядок
   //     - непонятно как читать в список поля из древовидного (иерархического справочника)
   if IsOpen and (bsPickList in FStyle) then begin
      sl:=FPickList.ByName(NameFieldName);
      if sl=nil then begin
         sl:=FPickList.Add(NameFieldName);
         CodeField:=FTable.FindField(FCodeFieldName); {FKeyFieldName}
         NameField:=FTable.FindField(NameFieldName);
         if FTable.Active and (CodeField<>nil) and (NameField<>nil) then begin
            FTable.DisableControls;
            try
               Bookmark:=FTable.Bookmark;
               FTable.First;
               fl:=FKeyList.Count=0;
               while not FTable.Eof do begin
                  if fl then begin
                     FKeyList.Add(CodeField.AsString);
                  end;
                  sl.Add(NameField.AsString);
                  FTable.Next;
               end;
               //FTable.Bookmark:=Bookmark;
               SetBookmark(FTable, Bookmark);
            finally
               FTable.EnableControls;
            end;
         end;
      end;
      PickList.Assign(sl);
      KeyList.Assign(FKeyList);
   end;
end;
--*)

function TDBItem.GetTableView: TTableView;
begin
   Result:=FViewList.ByName(CDefaultTableViewName);
end;

procedure TDBItem.InternalChangeView(After: Boolean);
begin
   // эта процедура вызывается два раза:
   // до открытия FViewQuery (After=False) и после открытия FViewQuery (After=True)
   if After then begin
      FViewRowidField:=FViewQuery.FindField(FRowIdFieldName);
      FFieldList.SetViewField(False);
      SetKeyFieldList;
   end
   else begin
      FFieldList.BuildDataSetFieldList(FViewQuery, True);
      {--for I:=0 to Pred(FKeyFieldList.Count) do begin
         FKeyFieldList.Objects[I]:=nil;
      end;}
   end;
end;

procedure TDBItem.RestoreLinks(DBList: TDBList; SprList: TDBItemList; EnumList: TEnumList);
begin
   FRelationList.RestoreLinks(DBList);
   FFieldList.RestoreLinks(SprList, EnumList);
   FDetailList.RestoreLinks(DBList, SprList, EnumList);
   {+}FViewList.RestoreLinks(SprList, EnumList);
   {+}FViewList.UpdateNameLink;
end;

function TDBItem.FindTable(Name: string): TDBItem;
begin
   if AnsiCompareText(FName, Name)=0 then begin
      Result:=Self;
   end
   else begin
      Result:=FDetailList.FindTable(Name);
   end;
end;

function TDBItem.GetRecNo: Integer;
begin
   // NB: !!! эта функция (и все подобные) получается не правильно срабатывает
   //     когда речь идет о EditTable, пока поставлю временный if для списков
   //     но потом это всё надо продумать и переделать 
   Result:=0;
   if HaveStyle(bsView) then begin
      if FViewQuery.Active then begin
         Result:=FViewQuery.RecNo;
      end;
   end
   else if HaveStyle(bsDetail) then begin
      if FEditTable.Active then begin
         Result:=FEditTable.RecNo;
      end;
   end
   else begin
      if FTable.Active then begin
         Result:=FTable.RecNo;
      end;
   end;
end;

function CustomOrderSort(List: TStringList; Index1, Index2: Integer): Integer;
var
   FieldItem: TFieldItem;
   FieldItem2: TFieldItem;
begin
   FieldItem:=TFieldItem(List.Objects[Index1]);
   FieldItem2:=TFieldItem(List.Objects[Index2]);
   Result:=FieldItem.OrderBy-FieldItem2.OrderBy;
end;

function TDBItem.InternalGetViewSQL(Select, Where, FilterWhere, OrderBy, FilterOrderBy, RowidName: string; Formating, OnlyForCount: Boolean): string;
var
   I: Integer;
   J: Integer;
   LB: string;
   FieldIndent: string;
   JoinIndent: string;
   WhereIndent: string;
   FieldDelimeter: string;
   JoinDelimeter: string;
   WhereDelimeter: string;
   Rowid: string;
   FieldItem: TFieldItem;
   Fields: string;
   FieldOrder: string;
   JoinItem: TJoinItem;
   Joins: string;
   JoinWhere: string;
   TempWhere: string;
   MainField: TFieldItem;
   SelectStm: string;
   FromStm: string;
   WhereStm: string;
   OrderByStm: string;
   OrderList: TStringList;
begin
   if Formating then begin
      LB:=#13#10;
      FieldIndent:='       ';
      JoinIndent:='     ';
      WhereIndent:='      ';
      FieldDelimeter:=', '#13#10;
      JoinDelimeter:=' '#13#10;
      WhereDelimeter:=' AND '#13#10;
   end
   else begin
      LB:='';
      FieldIndent:='';
      JoinIndent:='';
      WhereIndent:='';
      FieldDelimeter:=', ';
      JoinDelimeter:=' ';
      WhereDelimeter:=' AND ';
   end;
   if RowidName<>'' then begin
      Rowid:=Format('%s%s.rowid AS %s', [FieldIndent, FTableAlias, RowidName]);
   end
   else begin
      Rowid:='';
   end;
   Fields:='';
   OrderList:=TStringList.Create;
   try
      for I:=0 to Pred(FFieldList.Count) do begin
         FieldItem:=FFieldList[I];
         // NB: ключевые поля всегда присутствуют
         if (FieldItem<>nil) and (FieldItem.HaveStyle(fsViewVisible) or (FKeyFieldList.IndexOf(FieldItem.Name)<>-1)) and not FieldItem.HaveStyle(fsLookup) then begin
            if FieldItem.FieldName<>'' then begin
               if AnsiCompareText(FieldItem.FieldName, FieldItem.Name)=0 then begin
                  AddString(Fields, Format('%s%s.%s', [FieldIndent, FieldItem.TableAlias, FieldItem.FieldName]), FieldDelimeter);
               end
               else begin
                  AddString(Fields, Format('%s%s.%s AS %s', [FieldIndent, FieldItem.TableAlias, FieldItem.FieldName, FieldItem.Name]), FieldDelimeter);
               end;
               if FieldItem.HaveStyle(fsInOrderBy) and (FieldItem.OrderBy>0) then begin
                  if FieldItem.HaveStyle(fsDescOrder) then begin
                     OrderList.AddObject(Format('%s.%s DESC', [FieldItem.TableAlias, FieldItem.Name]), FieldItem);
                  end
                  else begin
                     OrderList.AddObject(Format('%s.%s', [FieldItem.TableAlias, FieldItem.Name]), FieldItem);
                  end;
               end;
            end
            else if FieldItem.SelectText<>'' then begin
               AddString(Fields, Format('%s%s AS %s', [FieldIndent, FieldItem.SelectText, FieldItem.Name]), FieldDelimeter);
               // NB: order by?
            end
            else if FieldItem.HaveStyle(fsFaset) then begin
               AddString(Fields, Format('%sSUBSTR(%s.%s, %d, %d) AS %s', [FieldIndent, FieldItem.TableAlias, FieldItem.FasetFieldName, FieldItem.FasetStart, FieldItem.FasetLength, FieldItem.Name]), FieldDelimeter);
               if FieldItem.HaveStyle(fsInOrderBy) and (FieldItem.OrderBy>0) then begin
                  OrderList.AddObject(Format('SUBSTR(%s.%s, %d, %d)', [FieldItem.TableAlias, FieldItem.FasetFieldName, FieldItem.FasetStart, FieldItem.FasetLength]), FieldItem);
               end;
            end;
         end;
      end;
      // формируем список сортировки
      FieldOrder:='';
      OrderList.CustomSort(CustomOrderSort);
      for I:=0 to Pred(OrderList.Count) do begin
         AddString(FieldOrder, OrderList[I], ', ');
      end;
   finally
      OrderList.Free;
   end;
   Joins:='';
   JoinWhere:='';
   for I:=0 to Pred(FJoinList.Count) do begin
      JoinItem:=FJoinList[I];
      if JoinItem<>nil then begin
         TempWhere:=JoinItem.Where;
         if JoinItem.Where='' then begin
            for J:=0 to Pred(JoinItem.MainField.Count) do begin
               MainField:=FFieldList.ByName(JoinItem.MainField[J]);
               if MainField<>nil then begin
                  if MainField.HaveStyle(fsFaset) then begin
                     AddString(TempWhere, Format('SUBSTR(%s.%s, %d, %d)=%s.%s', [MainField.TableAlias, MainField.FasetFieldName, MainField.FasetStart, MainField.FasetLength, JoinItem.Alias, JoinItem.JoinField[J]]), ' AND ');
                  end
                  else begin
                     AddString(TempWhere, Format('%s.%s=%s.%s', [MainField.TableAlias, JoinItem.MainField[J], JoinItem.Alias, JoinItem.JoinField[J]]), ' AND ');
                  end;
               end;
            end;
         end;
         if JoinItem.OuterJoin then begin
            AddString(Joins, Format('%sleft outer join %s %s on %s', [JoinIndent, JoinItem.TableName, JoinItem.Alias, TempWhere]), JoinDelimeter);
         end
         else begin
            AddString(Joins, Format('%s%s %s', [JoinIndent, JoinItem.TableName, JoinItem.Alias]), JoinDelimeter);
            AddString(JoinWhere, WhereIndent+TempWhere, WhereDelimeter);
         end;
      end;
   end;
   SelectStm:=Rowid;
   AddString(SelectStm, Fields, FieldDelimeter);
   AddString(SelectStm, Select, FieldDelimeter);
   FromStm:=Format('%s%s %s', [JoinIndent, FTableName, FTableAlias]);
   AddString(FromStm, Joins, ' '+LB);
   WhereStm:='';
   if Where<>'' then begin
      WhereStm:=WhereIndent+'('+Where+')';
   end;
   // добавление фильтра боковой панели
   if FLookFilter<>'' then begin
      AddString(WhereStm, '('+FLookFilter+')', WhereDelimeter);
   end;
   // добавление системного фильтра
   for I:=0 to Pred(FSysFilter.Count) do begin
      if Boolean(FSysFilter.Objects[I]) then begin
         AddString(WhereStm, '('+FSysFilter[I]+')', WhereDelimeter);
      end;
   end;
   //
   AddString(WhereStm, JoinWhere, WhereDelimeter);
   if FilterWhere<>'' then begin
      if WhereStm<>'' then begin
         WhereStm:=Format('(%s)%s(%s)', [WhereStm, WhereDelimeter, FilterWhere]);
      end
      else begin
         WhereStm:=FilterWhere;
      end;
   end;
   {-- NB: !!! временно - пока не разработал схему объединения сортировок
   OrderByStm:=OrderBy;
   AddString(OrderByStm, FieldOrder, ', ');
   AddString(OrderByStm, FilterOrderBy, ', ');
   --}
   if FilterOrderBy<>'' then begin
      OrderByStm:=FilterOrderBy;
   end
   else begin
      OrderByStm:=OrderBy;
   end;
   if OnlyForCount then begin
      Result:=Format('SELECT %scount(*) %sFROM %s%s', [LB, LB, LB, FromStm]);
   end
   else begin
      Result:=Format('SELECT %s%s %sFROM %s%s', [LB, SelectStm, LB, LB, FromStm]);
   end;
   if WhereStm<>'' then begin
      Result:=Format('%s %sWHERE %s%s', [Result, LB, LB, WhereStm]);
   end;
   if not OnlyForCount and (OrderByStm<>'') then begin
      Result:=Format('%s %sORDER BY %s', [Result, LB, OrderByStm]);
   end;
end;

function TDBItem.GetDetailPath: string;
begin
   if FMasterItem<>nil then begin
      Result:=FMasterItem.GetDetailPath+'.'+FName;
   end
   else begin
      Result:=FName;
   end;
end;

procedure TDBItem.ClearFilter;
begin
   // NB: здесь есть один момент, если я снимаю фильтр, то это не значит, что
   //     этот фильтр очищаю
   FIsFiltered:=False;
   FFilterWhere:='';
   FFilterOrderBy:='';
   RefreshView;
end;

procedure TDBItem.SetFilter(DoRefresh: Boolean);
begin
   // NB: тут можно делать проверку на наличие фильтра
   try
      if ApplyFilter then begin
         FIsFiltered:=True;
         if DoRefresh then begin
            RefreshView;
         end;
      end;
   except
      ClearFilter;
      raise; // NB: не совсем ясно что надо делать в случае ошибочной ситуации
   end;
end;

procedure TDBItem.InitFilter(OpList: TOperList; SprList: TSprList);
const
   FieldDataKindMap: array [TFieldDataKind] of TFindFieldKind=(
      ffkString,  {dkString}
      ffkBoolean, {dkBoolean}
      ffkNumber,  {dkNumber}
      ffkFloat,   {dkFloat}
      ffkDate     {dkDate}
   );

   RelationKindMap: array [TRelationKind] of TRelKind=(
      rk1M, {rkOneMany}
      rk11, {rkOneOne}
      rkM1, {rkManyOne}
      rkMM, {rkManyMany}
      rk11  {rkNone}
   );

var
   I: Integer;
   FieldItem: TFieldItem;
   RelationItem: TRelationItem;
   DetailItem: TDBItem;

   procedure AddFieldItem(List: TFieldList; Item: TFieldItem; Owner: TFindFieldItem);
   var
      LinkName: string;
      ItemCaption: string;
      ItemAddCaption: string;
      FindFieldKind: TFindFieldKinds;
      FSprEditKind: TSprEditKind;
      Spr: TSprItem;
   begin
      FSprEditKind:=sekDefault;
      LinkName:='';
      case Item.LinkStyle of
         lsLinkSpr: LinkName:=Item.LinkSprName;
         lsLinkEnum: LinkName:='ENUM_'+Item.LinkEnumName;
      end;
      ItemCaption:=Item.Caption;
      ItemAddCaption:=Item.AddCaption;
      if (Item.HaveStyle(fsLookup)) and (Item.LookupFieldName<>'') and (List.ByName(Item.LookupFieldName)<>nil) then begin
         FSprEditKind:=sekLookup;
         Item:=List.ByName(Item.LookupFieldName);
      end
      else if Item.SelectValueStyle=ssPickList then begin
         FSprEditKind:=sekComboBox;
         // NB: заплатка
         Spr:=FFilterInterface.SprList.ByName(Item.LinkSprName);
         if (Spr<>nil) and (Item.LinkSpr<>nil) then begin
            Item.LinkSpr.GetKeyPickList(Spr.KeyList, Spr.NameList, Item.LinkSpr.PickFieldNames{Spr.NameFieldName});
         end;
      end;
      FindFieldKind:=[FieldDataKindMap[Item.DataKind]];
      if LinkName<>'' then begin
         Include(FindFieldKind, ffkSpr);
      end;
      if Item.HaveStyle(fsNotNull) then begin
         Include(FindFieldKind, ffkNotNull);
      end;
      if Item.HaveStyle(fsFTS) then begin
         Include(FindFieldKind, ffkFTS);
      end;
      FFilterInterface.FindFieldList.AddNew(
         Item.Name,
         Item.FieldName,
         ItemCaption,
         ItemAddCaption,
         Item.TableAlias,
         FindFieldKind,
         True,
         Item.HaveStyle(fsCaseInsensitive),
         Item.HaveStyle(fsAlwaysUpper),
         LinkName,
         Owner,
         Item.Order,
         Item.Group,
         Item.FindOperation,
         '',
         FSprEditKind
      );
   end;

   procedure AddDetailItem(Item: TDBItem; Owner: TFindFieldItem);
   var
      I: Integer;
      S: string;
      FindFieldItem: TFindFieldItem;
      FieldItem: TFieldItem;
      DetailItem: TDBItem;
      RelationName: string;
      RelationWhere: string;
      RelationGroupBy: string;
      sl: TStringList;
   begin
      RelationName:='REL_'+Item.Name;
      RelationWhere:='';
      RelationGroupBy:='';
      sl:=TStringList.Create;
      try
         sl.CommaText:=StringReplace(Item.MasterFields, ';', ',', [rfReplaceAll]);
         for I:=0 to Pred(sl.Count) do begin
            S:=Format('%s.%s=%s.%s', [Item.MasterItem.TableAlias, sl[I], Item.TableAlias, Item.KeyFieldList[I]]);
            if RelationWhere='' then begin
               RelationWhere:=S;
            end
            else begin
               RelationWhere:=RelationWhere+' AND '+S;
            end;
            S:=Format('%s.%s', [Item.TableAlias, Item.KeyFieldList[I]]);
            if RelationGroupBy='' then begin
               RelationGroupBy:=S;
            end
            else begin
               RelationGroupBy:=RelationGroupBy+', '+S;
            end;
         end;
      finally
         sl.Free;
      end;
      FFilterInterface.RelList.AddNew(
         Item.TableName,
         Item.TableAlias,
         RelationName,
         RelationWhere,
         RelationGroupBy,
         rk1M
      );
      FindFieldItem:=FFilterInterface.FindFieldList.AddNew(
         Item.Name,
         Item.TableName,
         Item.ShortName,
         '',
         Item.TableAlias,
         [ffkList],
         True,
         False,
         True,
         '',
         Owner,
         Item.FindOrder,
         Item.FindGroup,
         Item.FindOperation,
         RelationName,
         sekDefault
      );
      // инициализация списка полей
      for I:=0 to Pred(Item.FieldList.Count) do begin
         FieldItem:=Item.FieldList[I];
         if FieldItem.HaveStyle(fsFindVisible) then begin
            AddFieldItem(Item.FieldList, FieldItem, FindFieldItem);
         end;
      end;
      // инициализация списка детальных таблиц
      for I:=0 to Pred(Item.DetailList.Count) do begin
         DetailItem:=Item.DetailList[I];
         if DetailItem.HaveStyle(bsFindVisible) then begin
            AddDetailItem(DetailItem, FindFieldItem);
         end;
      end;
   end;

begin
   if FFilterInterface<>nil then begin
      FFilterInterface.Free;
   end;
   FFilterInterface:=TFilterInterface.Create(OpList, SprList);
   FFilterInterface.RootCaption:=FCaption;
   // инициализация отношений
   for I:=0 to Pred(FRelationList.Count) do begin
      RelationItem:=FRelationList[I];
      if RelationItem.FindVisible then begin
         FFilterInterface.RelList.AddNew(
            RelationItem.RelationTable.TableName,
            RelationItem.RelationTable.TableAlias,
            RelationItem.Name,
            RelationItem.Where,
            RelationItem.GroupBy,
            RelationKindMap[RelationItem.RelationKind]
         );
      end;
   end;
   // инициализация списка полей
   for I:=0 to Pred(FFieldList.Count) do begin
      FieldItem:=FFieldList[I];
      if FieldItem.HaveStyle(fsFindVisible) then begin
         AddFieldItem(FFieldList, FieldItem, nil);
         // инициализация списка полей участвующих в сортировке
         if FieldItem.HaveStyle(fsInOrderBy) then begin
            FFilterInterface.OrderFields.Add(FieldItem.Name);
         end;
      end;
   end;
   // инициализация списка детальных таблиц
   for I:=0 to Pred(FDetailList.Count) do begin
      DetailItem:=FDetailList[I];
      if DetailItem.HaveStyle(bsFindVisible) then begin
         AddDetailItem(DetailItem, nil);
      end;
   end;
end;

function TDBItem.HaveFilter: Boolean;
begin
   Result:=FFilterInterface<>nil;
end;

function TDBItem.GetIsNodeField: TField;
begin
   Result:=FTable.FindField(FIsNodeFieldName);
end;

function TDBItem.GetNameField: TField;
begin
   Result:=FTable.FindField(FNameFieldName);
end;

function TDBItem.GetOrderField: TField;
begin
   Result:=FTable.FindField(FOrderFieldName);
end;

function TDBItem.GetParentIdField: TField;
begin
   Result:=FTable.FindField(FParentIdFieldName);
end;

function TDBItem.GetCodeField: TField;
begin
   Result:=FTable.FindField(FCodeFieldName);
end;

procedure TDBItem.LoadFormLayoutFromIni(Ini: TCustomIniFile);
begin
   if Ini<>nil then begin
      FLayoutList.LoadFromIni(Ini, FName+'.Layout');
      FDetailList.LoadFormLayoutFromIni(Ini);
   end;
end;

procedure TDBItem.SaveFormLayoutToIni(Ini: TCustomIniFile);
begin
   if Ini<>nil then begin
      FLayoutList.SaveToIni(Ini, FName+'.Layout');
      FDetailList.SaveFormLayoutToIni(Ini);
   end;
end;

function TDBItem.DeleteCurrentRecord(SourceKind: TSourceKind): Boolean;
var
   I: Integer;
   CurId: Integer;
   KeyValues: TStringList;
   Query: TAdsQuery;
   IsNode: TField;
   Id: TField;
   ParentId: TField;
   DeleteIdList: TStringList;

   procedure DeleteId(RootId: Integer);
   var
      Bookmark: string;
   begin
      // NB: !!! самый не оптимальный способ обхода дерева
      FTable.First;
      while not FTable.Eof do begin
         if ParentId.AsInteger=RootId then begin
            DeleteIdList.AddObject(Id.AsString, TObject(RootId));
            if IsNode.AsInteger=iNode then begin
               Bookmark:=FTable.Bookmark;
               DeleteId(Id.AsInteger);
               SetBookmark(FTable, Bookmark);
            end;
         end;
         FTable.Next;
      end;
   end;

begin
   // NB: !!! не работает для EditTable !!!
   KeyValues:=TStringList.Create;
   DeleteIdList:=TStringList.Create;
   Query:=TAdsQuery.Create(nil);
   Query.DatabaseName:=FDatabaseName;
   try
      // если таблица имеет древовидную структуру
      if bsTree in FStyle then begin
                 Id:=GetCodeField;
         IsNode:=GetIsNodeField;
         ParentId:=GetParentIdField;
         if (IsNode=nil) or (Id=nil) or (ParentId=nil) then begin
            Result:=False
         end
         //  если текущая запись является узлом дерева
         else if IsNode.AsInteger=iNode then begin
            // всегда полностью снимаем фильтр
            DeleteIdList.AddObject(Id.AsString, TObject(-1));
            CurId:=Id.AsInteger;
            FTable.Filtered:=False;
            // формируем полный список всех подчиненных элементов данного узла
            DeleteId(CurId);
            // удаляем записи по списку, если нет подчиенных
            Result:=True;
            for I:=Pred(DeleteIdList.Count) downto 0 do begin
               if DeleteIdList.IndexOfObject(TObject(StrToInt(DeleteIdList[I])))=-1 then begin
                  if FTable.Locate(FCodeFieldName, DeleteIdList[I], []) then begin
                     InternalGetKeyValues(KeyValues, SourceKind);
                     if InternalDeleteRecord(KeyValues, Query) then begin
                        DeleteIdList.Objects[I]:=TObject(-1);
                     end
                     else begin
                        Result:=False;
                        if (FControl<>nil) and (Control.DlgResult=mrCancel) then begin
                           Break;
                        end;
                     end;
                  end;
               end;
            end;
         end
         else begin
            InternalGetKeyValues(KeyValues, SourceKind);
            Result:=InternalDeleteRecord(KeyValues, Query);
         end;
      end
      else begin
         InternalGetKeyValues(KeyValues, SourceKind);
         Result:=InternalDeleteRecord(KeyValues, Query);
      end;
   finally
      Query.Free;
      DeleteIdList.Free;
      KeyValues.Free;
   end;
   case SourceKind of
      skView: RefreshView;
      skTable: FTable.Refresh;
      skEdit: FEditTable.Refresh;
   end;
end;

{function TDBItem.DeleteCurrentRecord(SourceKind: TSourceKind): Boolean;
var
   KeyValues: TStringList;
   Query: TAdsQuery;
begin
   // NB: !!! не работает для EditTable !!!
   KeyValues:=TStringList.Create;
   Query:=TAdsQuery.Create(nil);
   Query.DatabaseName:=FDatabaseName;
   try
      InternalGetKeyValues(KeyValues, SourceKind);
      Result:=InternalDeleteRecord(KeyValues, Query);
   finally
      Query.Free;
      KeyValues.Free;
   end;
   case SourceKind of
      skView: RefreshView;
      skTable: FTable.Refresh;
      skEdit: FEditTable.Refresh;
   end;
end;}

function TDBItem.HaveStyle(S: TDBItemStyles): Boolean;
begin
   Result:=S in FStyle;
end;

function TDBItem.HaveNotEmptyFilter: Boolean;
begin
   Result:=HaveFilter and ((FFilterInterface.Filter.HaveParams) or (FFilterInterface.GetCurrentSQL<>''));
end;

function TDBItem.HaveFilterOrderBy: Boolean;
begin
   Result:=(FFilterInterface<>nil) and (FFilterInterface.OrderFields.Count<>0);
end;

function TDBItem.DoViewRecord(ViewMode: TViewMode): Boolean;
begin
   Result:=False;
   if CanViewRecord then begin
      Result:=FOnViewRecord(Self, ViewMode);
   end;
end;

function TDBItem.CanViewRecord: Boolean;
begin
   Result:=(FControl<>nil) and Assigned(FOnViewRecord);
end;

procedure TDBItem.DisableControls;
begin
   FViewQuery.DisableControls;
   FTable.DisableControls;
   FEditTable.DisableControls;
end;

procedure TDBItem.EnableControls;
begin
   FViewQuery.EnableControls;
   FTable.EnableControls;
   FEditTable.EnableControls;
end;

function TDBItem.ApplyFilter: Boolean;
begin
   FFilterWhere:='';
   FFilterOrderBy:='';
   if FFilterInterface<>nil then begin
      FFilterWhere:=FFilterInterface.GetCurrentSQL;
      FFilterOrderBy:=FFilterInterface.GetCurrentOrderBy;
   end;
   Result:=FFilterWhere<>'';
end;

procedure TDBItem.SetFilterOrderBy;
begin
   try
      FFilterOrderBy:=FFilterInterface.GetCurrentOrderBy;
      FIsFiltered:=True;
      RefreshView;
      FIsFiltered:=False;
   except
      ClearFilter;
      raise; // NB: не совсем ясно что надо делать в случае ошибочной ситуации
   end;
end;

procedure TDBItem.PrepareTableView(SprList: TDBItemList; EnumList: TEnumList);
var
   View: TTableView;
begin
   View:=GetTableView;
   if View<>nil then begin
      if View.Count=0 then begin
         View.SetDefaultColView;
      end;
      View.RestoreLinks(SprList, EnumList);
      FViewList.UpdateNameLink;
   end;
end;


function TDBItem.GetFieldValue(KeyValues: string; FieldName: string): string;
var
   Bookmark: string;
   Field: TField;
begin
   // эта функция предназначена для возвращения значения одного из полей таблицы
   // когда известно значение ключевого поля (полей)
   Result:='';
   if KeyValues<>'' then begin
      Field:=FTable.FindField(FieldName);
      if Field<>nil then begin
         // NB: интересно что будет в закладке если набор данных пустой
         Bookmark:=FTable.Bookmark;
         if Locate(KeyValues) then begin
            Result:=Field.AsString;
         end;
         // хотя позиция может и не меняется если ничего не найдено
         // но на всякий случай буду восстанавливать всегда
         //FTable.Bookmark:=Bookmark;
         SetBookmark(FTable, Bookmark);
      end;
   end;
end;

procedure TDBItem.SetIndex;
var
   TableIndex: TTableIndex;
begin
   if FIndexName<>'' then begin
      TableIndex:=FIndexList.ByName(FIndexName);
      if TableIndex<>nil then begin
         FTable.IndexName:=TableIndex.IndexName;
      end;
   end;
end;

function TDBItem.InternalGetDeleteSQL(KeyValues: TStringList): string;
var
   I: Integer;
   FieldWhere: string;
   S: string;
begin
   // - функция предусматривает, что количество переданных значений может быть
   //   меньше или равно количеству ключей
   // - здесь неявно подразумевается, что порядок ключей главной таблицы
   //   повторяет порядок ключеней подчиненной таблицы (у подчиненной их просто
   //   может быть больше)
   // - тип значений полей не проверяется, т.е. это значит, например, что
   //   строковые значения должны быть заключены в кавычки
   Result:='';
   if (KeyValues.Count<>0) and (KeyValues.Count<=FKeyFieldList.Count) then begin
      FieldWhere:='';
      for I:=0 to Pred(KeyValues.Count) do begin
         S:=Format('%s=%s', [FKeyFieldList[I], KeyValues[I]]);
         if FieldWhere='' then begin
            FieldWhere:=S;
         end
         else begin
            FieldWhere:=FieldWhere+' and '+S;
         end;
      end;
      Result:=Format('delete from %s where %s', [FTableName, FieldWhere]);
   end;
end;

function TDBItem.InternalDeleteRecord(KeyValues: TStringList; Query: TAdsQuery): Boolean;
var
   SQL: string;
begin
   // NB: пока (из-за того что всю операцию удаления объекта нельзя поместить в
   //     одну транзакцию) ошибки при удалении не будем корректно отслеживать
   Result:=False;
   SQL:=InternalGetDeleteSQL(KeyValues);
   if SQL<>'' then begin
      if DoBeforeDeleteRecord(KeyValues) then begin
         if (FDetailList.Count=0) or FDetailList.InternalDeleteRecord(KeyValues, Query) then begin
            Query.SQL.Text:=SQL;
            Query.ExecSQL;
            Result:=True;
         end;
      end;
   end;
end;

function TDBItem.InternalLocate(KeyValues: TStringList): Boolean;
var
   I: Integer;
   vKeyValues: Variant;
begin
   Result:=False;
   if FKeyFieldList.Count=KeyValues.Count then begin
      vKeyValues:=VarArrayCreate([0, Pred(KeyValues.Count)], varOleStr);
      for I:=0 to Pred(KeyValues.Count) do begin
         vKeyValues[I]:=KeyValues[I];
      end;
      Result:=FTable.Locate(FKeyFieldNames, vKeyValues, [loCaseInsensitive]);
   end;
end;

function TDBItem.Locate(KeyValues: string): Boolean;
var
   sl: TStringList;
begin
   sl:=TStringList.Create;
   try
      sl.CommaText:=KeyValues;
      Result:=InternalLocate(sl);
   finally
      sl.Free;
   end;
end;

procedure TDBItem.InternalGetKeyValues(KeyValues: TStringList; SourceKind: TSourceKind);
var
   I: Integer;
   Field: TField;
   FieldItem: TFieldItem;
begin
   if KeyValues<>nil then begin
      KeyValues.Clear;
      if (FIsViewOpen and (SourceKind=skView)) or (FIsOpen and (SourceKind=skTable)) or (FEditTable.Active and (SourceKind=skEdit)) then begin
         for I:=0 to Pred(FKeyFieldList.Count) do begin
            FieldItem:=TFieldItem(FKeyFieldList.Objects[I]);
            Field:=nil;
            if FieldItem<>nil then begin
               case SourceKind of
                  skTable: Field:=FieldItem.SrcField;
                  skView: Field:=FieldItem.ViewField;
                  skEdit: Field:=FieldItem.DestField;
               end;
            end;
            if (Field=nil) then begin
               KeyValues.Clear;
               Break;
            end
            else begin
               case FieldItem.DataKind of
                  // NB: с типом dkDate не всё понятно
                  dkDate, dkString: KeyValues.Add(''''+Field.AsString+'''');
               else
                  // NB: с типом dkBoolean не всё понятно
                  KeyValues.Add(Field.AsString);
               end;
            end;
         end;
      end;
   end;
end;

function TDBItem.IsEmpty(SourceKind: TSourceKind): Boolean;
begin
   Result:=True;
   case SourceKind of
      skTable: Result:=FTable.IsEmpty;
      skView: Result:=FViewQuery.IsEmpty;
      skEdit: Result:=FEditTable.IsEmpty;
   end;
end;

function TDBItem.DoBeforeEditRecord(KeyValues: string): Boolean;
begin
   if Assigned(FOnBeforeEditRecord) then begin
      Result:=FOnBeforeEditRecord(Self, KeyValues);
   end
   else begin
      Result:=True;
   end;
end;

function TDBItem.GetIdList(RootId: Integer): string;
var
   Bookmark: string;
   NodeId: TField;
   ParentId:  TField;
   Is_Node: TField;
   IdList: TStringList;
   IsNodeList: TList;
   ResultIdList: TStringList;
   ParentIdList: TStringList;
   I: Integer;
   J: Integer;
   S: string;
begin
   Result:='';
   if HaveStyle(bsTree) then begin
      NodeId:=GetCodeField;
      ParentId:=GetParentIdField;
      Is_Node:=GetIsNodeField;
      if FTable.Active and (NodeId<>nil) and (ParentId<>nil) and (Is_Node<>nil) then begin
         FTable.DisableControls;
         IdList:=TStringList.Create;
         ResultIdList:=TStringList.Create;
         ParentIdList:=TStringList.Create;
         IsNodeList:=TList.Create;
         try
            Bookmark:=FTable.Bookmark;
            FTable.First;
            while not FTable.Eof do begin
               if ParentId.AsInteger=RootId then begin
                  S:=NodeId.AsString;
                  if Is_Node.AsInteger=iNode then begin
                     ParentIdList.Add(S);
                  end
                  else begin
                     ResultIdList.Add(S);
                  end;
               end
               else begin
                  IdList.AddObject(ParentId.AsString, TObject(NodeId.AsInteger));
                  IsNodeList.Add(Pointer(Is_Node.AsInteger));
               end;
               FTable.Next;
            end;
            //FTable.Bookmark:=Bookmark;
            SetBookmark(FTable, Bookmark);
            I:=0;
            while I<ParentIdList.Count do begin
               J:=0;
               while J<IdList.Count do begin
                  if IdList[J]=ParentIdList[I] then begin
                     S:=IntToStr(Integer(IdList.Objects[J]));
                     if Integer(IsNodeList[J])=iNode then begin
                        ParentIdList.Add(S);
                     end
                     else begin
                        ResultIdList.Add(S);
                     end;
                     IdList.Delete(J);
                     IsNodeList.Delete(J);
                  end
                  else begin                  
                     Inc(J);
                  end;
               end;
               Inc(I);
            end;
            Result:=ResultIdList.CommaText;
         finally
            IdList.Free;
            ResultIdList.Free;
            ParentIdList.Free;
            IsNodeList.Free;
            FTable.EnableControls;
         end;
      end;
   end;
end;

procedure TDBItem.SetKeyFieldList;
var
   I: Integer;
begin
   for I:=0 to Pred(FKeyFieldList.Count) do begin
      FKeyFieldList.Objects[I]:=FFieldList.ByName(FKeyFieldList[I]);
   end;
end;

procedure TDBItem.DoBeforeUpdateRecord(IsNew: Boolean);
begin
   if Assigned(FOnBeforeUpdateRecord) then begin
      FOnBeforeUpdateRecord(Self, IsNew);
   end;
end;

procedure TDBItem.IncludeStyle(S: TDBItemStyles);
begin
   Include(FStyle, S);
   if S in [bsReadOnly] then begin
      FViewList.IncludeStyle(tsReadOnly);
      FDetailList.IncludeStyle(S);
   end;
end;

function TDBItem.CanAdd: Boolean;
begin
   Result:=(FControl<>nil) and (not HaveStyle(bsReadOnly));
end;

function TDBItem.CanDelete: Boolean;
begin
   Result:=(FControl<>nil) and (not FEditTable.IsEmpty) and (not HaveStyle(bsReadOnly));
end;

function TDBItem.CanEdit: Boolean;
begin
   Result:=(FControl<>nil) and (not FEditTable.IsEmpty) and (not HaveStyle(bsReadOnly));
end;

procedure TDBItem.DoAfterAddRecord(IsNew: Boolean);
begin
   if Assigned(FOnAfterAddRecord) then begin
      FOnAfterAddRecord(Self, IsNew);
   end;
end;

function TDBItem.DoBeforeDeleteRecord(KeyValues: TStringList): Boolean;
begin
   if Assigned(FOnBeforeDeleteRecord) then begin
      Result:=FOnBeforeDeleteRecord(Self, KeyValues.CommaText);
   end
   else begin
      Result:=True;
   end;
end;

function TDBItem.CanNext: Boolean;
begin
   Result:=(FControl<>nil) and (not FEditTable.IsEmpty) and (not HaveStyle(bsReadOnly)) and
           (FEditTable.RecNo<>FEditTable.RecordCount);
end;

function TDBItem.CanPrev: Boolean;
begin
   Result:=(FControl<>nil) and (not FEditTable.IsEmpty) and (not HaveStyle(bsReadOnly)) and
           (FEditTable.RecNo<>1);
end;

procedure TDBItem.InitOrderList(OrderList: TOrderList);
begin
   //NB: !!! должна быть возможность редактировать список сортировки
end;

function TDBItem.UpdateTopInfo(RichEdit: TRichEdit; var TopInfo: string): Boolean;
begin
   if Assigned(FOnUpdateTopInfo) then begin
      Result:=FOnUpdateTopInfo(Self, RichEdit, TopInfo);
   end
   else begin
      Result:=False;
   end;
end;

procedure TDBItem.BuildMenu(Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent);
begin
   if Assigned(FOnBuildMenu) then begin
      FOnBuildMenu(Self, Menu, MenuKind, OnClick);
   end
end;

function TDBItem.GetSqlForCount: string;
begin
   Result:=GetViewSQL(False, True);
end;

function TDBItem.CountViewRecord: Integer;
var
   Query: TAdsQuery;
begin
   Result:=0;
   if (bsView in FStyle) and FIsViewOpen then begin
      Query:=TAdsQuery.Create(nil);
      Query.DatabaseName:=FDatabaseName;
      try
         Query.SQL.Text:=GetSqlForCount;
         Query.Open;
         Result:=Query.Fields[0].AsInteger;
      finally
         Query.Free;
      end;
   end;
end;
//-----------------------------------------------------------------------
procedure TDBItem.RecordDown(DataSet: TDataSet; Field: TField);
var
   CurOrder: Integer;
   CurMark: string;
   NextOrder: Integer;
begin
   CurMark:=DataSet.Bookmark;
   CurOrder:=Field.AsInteger;
   DataSet.Next;
   NextOrder:=Field.AsInteger;
   if NextOrder<>CurOrder then begin
      DataSet.Edit;
      Field.AsInteger:=CurOrder;
      DataSet.Post;
      DataSet.Bookmark:=CurMark;
      DataSet.Edit;
      Field.AsInteger:=NextOrder;
      DataSet.Post;
   end
   else begin
      DataSet.Bookmark:=CurMark;
   end;
end;
//-----------------------------------------------------------------------
procedure TDBItem.RecordUp(DataSet: TDataSet; Field: TField);
var
   CurOrder: Integer;
   CurMark: string;
   PriorOrder: Integer;
begin
   CurMark:=DataSet.Bookmark;
   CurOrder:=Field.AsInteger;
   DataSet.Prior;
   PriorOrder:=Field.AsInteger;
   if PriorOrder<>CurOrder then begin
      DataSet.Edit;
      Field.AsInteger:=CurOrder;
      DataSet.Post;
      DataSet.Bookmark:=CurMark;
      DataSet.Edit;
      Field.AsInteger:=PriorOrder;
      DataSet.Post;
      DataSet.Bookmark:=CurMark;
   end
   else begin
      DataSet.Bookmark:=CurMark;
   end;
end;
//-----------------------------------------------------------------------
procedure TDBItem.RecordUpEx(DataSet: TDataSet; Field, Parent: TField);
var
   CurOrder: Integer;
   CurMark: string;
   PriorOrder: Integer;
   CurParent: Integer;
   PriorParent: Integer;
begin
   CurMark:=DataSet.Bookmark;
   CurParent:=Parent.AsInteger;
   CurOrder:=Field.AsInteger;
   DataSet.Prior;
   PriorOrder:=Field.AsInteger;
   PriorParent:=Parent.AsInteger;
   if (PriorOrder<>CurOrder) and (CurParent=PriorParent) then begin
      DataSet.Edit;
      Field.AsInteger:=CurOrder;
      DataSet.Post;
      DataSet.Bookmark:=CurMark;
      DataSet.Edit;
      Field.AsInteger:=PriorOrder;
      DataSet.Post;
      DataSet.Bookmark:=CurMark;
   end
   else begin
      DataSet.Bookmark:=CurMark;
   end;
end;
//-----------------------------------------------------------------------
procedure TDBItem.EditRecordDown;
begin
   RecordDown(FEditTable, FEditTable.FieldByName(FOrderFieldName));
end;

procedure TDBItem.EditRecordUp;
begin
   RecordUp(FEditTable, FEditTable.FieldByName(FOrderFieldName));
end;

function TDBItem.GetLastDataSetOrder(DataSet: TDataSet; Field: TField): Integer;
begin
   Result:=0;
   if (bsOrder in FStyle) and (Field<>nil) then begin
      DataSet.Last;
      if (not DataSet.IsEmpty) and (not Field.IsNull) then begin
         Result:=Field.AsInteger;
      end;
   end;
end;

function TDBItem.GetLastOrder(SourceKind: TSourceKind): Integer;
begin
   Result:=0;
   case SourceKind of
      skTable: Result:=GetLastDataSetOrder(FTable, GetOrderField);
      skView: ;
      skEdit: Result:=GetLastDataSetOrder(FEditTable, FEditTable.FieldByName(FOrderFieldName));
   end;
end;

procedure TDBItem.UpdateSpr;
begin
   FPickList.Clear;
   FKeyList.Clear;
end;

procedure TDBItem.ExecAction;
begin
   if Assigned(FOnExecAction) then begin
      FOnExecAction(Self);
   end                        
end;

procedure TDBItem.DoBeforeClose;
begin
   if Assigned(FOnBeforeClose) then begin
      FOnBeforeClose(Self);
   end;
end;

function TDBItem.GetIsDataModified: Boolean;
var
   I: Integer;
begin
   Result:=FEditTable.IsDataModified;
   if not Result then begin
      for I:=0 to Pred(FEditTable.FieldCount) do begin
         // не проверяем ключевые поля
         if (FKeyFieldList.IndexOf(FEditTable.Fields[I].FieldName)=-1) and
            not SameText(FAutoIncFieldName, FEditTable.Fields[I].FieldName)
         then begin
            // для memo-полей отдельная проверка
            if FEditTable.Fields[I] is TBlobField then begin
               Result:=TBlobField(FEditTable.Fields[I]).Modified
            end
            else begin
               Result:=FEditTable.IsFieldModified[I];
            end;
            if Result then begin
               Break;
            end;
         end;
      end;
   end;
   if not Result and (bsMaster in Style) then begin
      Result:=FDetailList.IsDataModified;
   end;
end;

procedure TDBItem.ClearModified;
begin
   FEditTable.ClearModified;
   if bsMaster in Style then begin
      FDetailList.ClearModified;
   end;
end;

function TDBItem.DefaultStyle: TDBItemStyle;
begin
   Result:=[bsConfirmDelete, bsConfirmSave];
end;

procedure TDBItem.SetDestField(Arr: array of Variant);
var
   I: Integer;
   FieldName: string;
   FieldItem: TFieldItem;
begin
   if Length(Arr) mod 2=0 then begin
      for I:=Low(Arr) to High(Arr) div 2 do begin
         FieldName:=Arr[I*2];
         FieldItem:=FieldList.ByName(FieldName);
         if FieldItem<>nil then begin
//            if (FieldItem.DestField.DataType=ftDateTime) or (FieldItem.DestField.DataType=ftDate)
            FieldItem.DestField.AsVariant:=Arr[Succ(I*2)];
         end;
      end;
   end;
end;

procedure TDBItem.DoAfterReadRecord;
begin
   if Assigned(FOnAfterReadRecord) then begin
      FOnAfterReadRecord(Self);
   end;
end;

procedure TDBItem.SetSrcField(Arr: array of Variant);
var
   I: Integer;
   FieldName: string;
   FieldItem: TFieldItem;
begin
   if Length(Arr) mod 2=0 then begin
      for I:=Low(Arr) to High(Arr) div 2 do begin
         FieldName:=Arr[I*2];
         FieldItem:=FieldList.ByName(FieldName);
         if FieldItem<>nil then begin
            FieldItem.SrcField.AsVariant:=Arr[Succ(I*2)];
         end;
      end;
   end;
end;

function TDBItem.GetPickList(NameFieldName: string): TStringList;
var
   I: Integer;
   S: string;
   sl: TStringList;
   fl: Boolean;
   CodeField: TField;
   PickFieldName: TStringList;
   Bookmark: string;
begin
   // NB: - тут надо ещё подумать в какой момент читать эти списки (может быть заранее)
   //       и каким образом - через отдельно открываемый запрос или набор данных
   //     - нужно иметь возможность задовать порядок
   //     - непонятно как читать в список поля из древовидного (иерархического справочника)
   Result:=nil;
   if IsOpen and (bsPickList in FStyle) then begin
      sl:=FPickList.ByName(NameFieldName);
      if sl=nil then begin
         sl:=FPickList.Add(NameFieldName);
         PickFieldName:=TStringList.Create;
         PickFieldName.CommaText:=NameFieldName;
         try
            CodeField:=FTable.FindField(FCodeFieldName); {FKeyFieldName}
            fl:=False;
            for I:=0 to Pred(PickFieldName.Count) do begin
               PickFieldName.Objects[I]:=FTable.FindField(PickFieldName[I]);
               if PickFieldName.Objects[I]<>nil then begin
                  fl:=True;
               end;
            end;
            if FTable.Active and (CodeField<>nil) and fl then begin
               FTable.DisableControls;
               try
                  Bookmark:=FTable.Bookmark;
                  FTable.First;
                  fl:=FKeyList.Count=0;
                  while not FTable.Eof do begin
                     if fl then begin
                        FKeyList.Add(CodeField.AsString);
                     end;
                     S:='';
                     for I:=0 to Pred(PickFieldName.Count) do begin
                        if PickFieldName.Objects[I]<>nil then begin
                           AddString(S, TField(PickFieldName.Objects[I]).AsString, ' ');
                        end;
                     end;
                     sl.Add(S);
                     FTable.Next;
                  end;
                  //FTable.Bookmark:=Bookmark;
                  SetBookmark(FTable, Bookmark);
               finally
                  FTable.EnableControls;
               end;
            end;
         finally
            PickFieldName.Free;
         end;
      end;
      Result:=sl;
   end;
end;

function TDBItem.GetPickList: TStringList;
begin
   Result:=GetPickList(FPickFieldNames);
end;

function TDBItem.FindLinkSpr(Spr: TDBItem; List: TList): Boolean;
var
   I: Integer;
begin
   Result:=False;
   if (List<>nil) and (Spr<>nil) then begin
      I:=List.Count;
      FFieldList.FindLinkSpr(Spr, List);
      FDetailList.FindLinkSpr(Spr, List);
      Result:=List.Count>I;
   end;
end;

procedure TDBItem.ExcludeStyle(S: TDBItemStyles);
begin
   Exclude(FStyle, S);
   if S in [bsReadOnly] then begin
      FViewList.ExcludeStyle(tsReadOnly);
      FDetailList.ExcludeStyle(S);
   end;
end;

function TDBItem.GetShortNameField: TField;
begin
   Result:=FTable.FindField(FShortFieldName);
end;

{ TDBItemList }

function TDBItemList.Add(Item: TDBItem): Integer;
begin
   Result:=FList.Add(Item);
end;

function TDBItemList.AddItem(Name, TableName, TableAlias, ShortName, Caption, Comm, IndexName, MasterFields, KeyFieldNames, NameFieldName, AutoIncFieldName: string; Style: TDBItemStyle): TDBItem;
begin
   Result:=TDBItem.Create(Name, TableName, TableAlias, ShortName, Caption, Comm, IndexName, MasterFields, KeyFieldNames, NameFieldName, AutoIncFieldName, Style);
   if FMasterItem<>nil then begin
      Result.MasterItem:=MasterItem;
   end;
   Add(Result);
end;

procedure TDBItemList.AddRecord;
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.AddRecord;
   end;
end;

procedure TDBItemList.ApplyEdit(KeyValues: string);
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.ApplyEdit(KeyValues);
   end;
end;

function TDBItemList.ByName(Name: string): TDBItem;
var
   I: Integer;
   Item: TDBItem;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if AnsiCompareText(Item.Name, Name)=0 then begin
         Result:=Item;
         Break;
      end;
   end;
end;

procedure TDBItemList.CheckEditMode;
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.CheckEditMode;
   end;
end;

procedure TDBItemList.Clear;
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.Free;
   end;
   FList.Clear;
end;

procedure TDBItemList.ClearModified;
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.ClearModified;
   end;
end;

procedure TDBItemList.Close;
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.Close;
   end;
end;

constructor TDBItemList.Create(Name: string; MasterItem: TDBItem);
begin
   FName:=AnsiUpperCase(Trim(Name));
   FList:=TList.Create;
   FMasterItem:=MasterItem;
end;

procedure TDBItemList.DeleteRecord(KeyValues: string);
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.DeleteRecord(KeyValues);
   end;
end;

destructor TDBItemList.Destroy;
begin
   Close;
   Clear;
   FList.Free;
   inherited;
end;

procedure TDBItemList.EditRecord(KeyValues: string);
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.EditRecord(KeyValues);
   end;
end;

procedure TDBItemList.ExcludeStyle(S: TDBItemStyles);
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.ExcludeStyle(S);
   end;
end;

function TDBItemList.FindLinkSpr(Spr: TDBItem; List: TList): Boolean;
var
   I: Integer;
   Item: TDBItem;
begin
   Result:=False;
   if (List<>nil) and (Spr<>nil) then begin
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         if Item.FindLinkSpr(Spr, List) then begin
            Result:=True;
         end;
      end;
   end;
end;

function TDBItemList.FindTable(Name: string): TDBItem;
var
   I: Integer;
   Item: TDBItem;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Result:=Item.FindTable(Name);
         if Result<>nil then begin
            Break;
         end;
      end;
   end;
end;

function TDBItemList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TDBItemList.GetIsDataModified: Boolean;
var
   I: Integer;
   Item: TDBItem;
begin
   Result:=False;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Result:=Item.IsDataModified;
      if Result then begin
         Break;
      end;
   end;
end;

function TDBItemList.GetItem(I: Integer): TDBItem;
begin
   Result:=TDBItem(FList[I]);
end;
{--
procedure TDBItemList.InternalAppendEdit;
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.InternalAppendEdit;
   end;
end;
}
procedure TDBItemList.IncludeStyle(S: TDBItemStyles);
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.IncludeStyle(S);
   end;
end;

procedure TDBItemList.InternalApplyEdit(KeyValues: TStringList);
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.InternalApplyEdit(KeyValues);
   end;
end;

function TDBItemList.InternalDeleteRecord(KeyValues: TStringList; Query: TAdsQuery): Boolean;
var
   I: Integer;
   Item: TDBItem;
begin
   // NB: нет возможности поместить операцию удаления в транзакцию и из-за этого
   //     не имеет видимо смыла возвращать здесь True или False, ведь нельзя
   //     гарантировать что всё удалиться или (при ошибке) всё не удалиться
   Result:=True;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if not Item.InternalDeleteRecord(KeyValues, Query) then begin
         Result:=False;
      end;
   end;
end;

procedure TDBItemList.InternalEditRecord(KeyValues: TStringList);
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.InternalEditRecord(KeyValues);
   end;
end;

procedure TDBItemList.InternalOpenEdit;
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.InternalOpenEdit;
   end;
end;

procedure TDBItemList.LoadFormLayoutFromIni(Ini: TCustomIniFile);
var
   I: Integer;
   Item: TDBItem;
begin
   if Ini<>nil then begin
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         if Item<>nil then begin
            Item.LoadFormLayoutFromIni(Ini);
         end;
      end;
   end;
end;

procedure TDBItemList.LoadTableViewFromIni(Ini: TCustomIniFile);
var
   I: Integer;
   Item: TDBItem;
begin
   if Ini<>nil then begin
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         if Item<>nil then begin
            Item.ViewList.LoadFromIni(Ini, '');
         end;
      end;
   end;
end;

procedure TDBItemList.NewRecord;
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.NewRecord;
   end;
end;

function TDBItemList.Open(var ErrMsg: string): Boolean;
var
   I: Integer;
   Item: TDBItem;
begin
   Result:=True;
   ErrMsg:='';
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if not Item.Open(ErrMsg) then begin
         Result:=False;
         Break;
      end;
   end;
end;

procedure TDBItemList.RestoreLinks(DBList: TDBList; SprList: TDBItemList; EnumList: TEnumList);
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.RestoreLinks(DBList, SprList, EnumList);
      end;
   end;
end;

procedure TDBItemList.SaveFormLayoutToIni(Ini: TCustomIniFile);
var
   I: Integer;
   Item: TDBItem;
begin
   if Ini<>nil then begin
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         if Item<>nil then begin
            Item.SaveFormLayoutToIni(Ini);
         end;
      end;
   end;
end;

procedure TDBItemList.SaveTableViewToIni(Ini: TCustomIniFile);
var
   I: Integer;
   Item: TDBItem;
begin
   if Ini<>nil then begin
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         if Item<>nil then begin
            Item.ViewList.SaveToIni(Ini, '');
         end;
      end;
   end;
end;

procedure TDBItemList.SetDatabaseName(Value: string);
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.DatabaseName:=Value;
   end;
end;

procedure TDBItemList.UpdateSpr;
var
   I: Integer;
   Item: TDBItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and Item.HaveStyle(bsSpr) then begin
         Item.UpdateSpr;
      end;
   end;
end;

{ TDBList }

function TDBList.Add(Item: TDBItemList): Integer;
begin
   Result:=FList.Add(Item);
end;

function TDBList.AddItem(Name: string; MasterItem: TDBItem): TDBItemList;
begin
   Result:=TDBItemList.Create(Name, MasterItem);
   Add(Result);
end;

function TDBList.ByName(Name: string): TDBItemList;
var
   I: Integer;
   Item: TDBItemList;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if AnsiCompareText(Item.Name, Name)=0 then begin
         Result:=Item;
         Break;
      end;
   end;
end;

procedure TDBList.Clear;
var
   I: Integer;
   Item: TDBItemList;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.Free;
   end;
   FList.Clear;
end;

procedure TDBList.Close;
var
   I: Integer;
   Item: TDBItemList;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.Close;
   end;
end;

constructor TDBList.Create;
begin
   FList:=TList.Create;
end;

destructor TDBList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TDBList.FindLinkSpr(Spr: TDBItem; List: TList): Boolean;
var
   I: Integer;
   Item: TDBItemList;
begin
   Result:=False;
   if (Spr<>nil) and (List<>nil) then begin
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         if Item<>nil then begin
            if Item.FindLinkSpr(Spr, List) then begin
               Result:=True;
            end;
         end;
      end;
   end;
end;

function TDBList.FindTable(Name: string): TDBItem;
var
   I: Integer;
   Item: TDBItemList;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Result:=Item.FindTable(Name);
         if Result<>nil then begin
            Break;
         end;
      end;
   end;
end;

function TDBList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TDBList.GetItem(I: Integer): TDBItemList;
begin
   Result:=TDBItemList(FList[I]);
end;

procedure TDBList.LoadFormLayoutFromIni(Ini: TCustomIniFile);
var
   I: Integer;
   DBItemList: TDBItemList;
begin
   if Ini<>nil then begin
      for I:=0 to Pred(GetCount) do begin
         DBItemList:=GetItem(I);
         if DBItemList<>nil then begin
            DBItemList.LoadFormLayoutFromIni(Ini)
         end;
      end;
   end;
end;

procedure TDBList.LoadTableViewFromIni(Ini: TCustomIniFile);
var
   I: Integer;
   DBItemList: TDBItemList;
begin
   if Ini<>nil then begin
      for I:=0 to Pred(GetCount) do begin
         DBItemList:=GetItem(I);
         if DBItemList<>nil then begin
            DBItemList.LoadTableViewFromIni(Ini);
         end;
      end;
   end;
end;

function TDBList.Open(var ErrMsg: string): Boolean;
var
   I: Integer;
   Item: TDBItemList;
begin
   Result:=True;
   ErrMsg:='';
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if not Item.Open(ErrMsg) then begin
         Result:=False;
         Break;
      end;
   end;
end;

procedure TDBList.RestoreLinks(SprList: TDBItemList; EnumList: TEnumList);
var
   I: Integer;
   DBItemList: TDBItemList;
begin
   for I:=0 to Pred(GetCount) do begin
      DBItemList:=GetItem(I);
      if DBItemList<>nil then begin
         DBItemList.RestoreLinks(Self, SprList, EnumList)
      end;
   end;
end;

procedure TDBList.SaveFormLayoutToIni(Ini: TCustomIniFile);
var
   I: Integer;
   DBItemList: TDBItemList;
begin
   if Ini<>nil then begin
      for I:=0 to Pred(GetCount) do begin
         DBItemList:=GetItem(I);
         if DBItemList<>nil then begin
            DBItemList.SaveFormLayoutToIni(Ini);
         end;
      end;
   end;
end;

procedure TDBList.SaveTableViewToIni(Ini: TCustomIniFile);
var
   I: Integer;
   DBItemList: TDBItemList;
begin
   if Ini<>nil then begin
      for I:=0 to Pred(GetCount) do begin
         DBItemList:=GetItem(I);
         if DBItemList<>nil then begin
            DBItemList.SaveTableViewToIni(Ini);
         end;
      end;
   end;
end;

procedure TDBList.SetDatabaseName(Value: string);
var
   I: Integer;
   Item: TDBItemList;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.SetDatabaseName(Value);
   end;
end;

{ TTableIndex }

constructor TTableIndex.Create(Name, IndexName, FieldNames: string; Style: TTableIndexStyle);
begin
   FName:=Trim(AnsiUpperCase(Name));
   FIndexName:=Trim(AnsiUpperCase(IndexName));
   FFieldNames:=Trim(AnsiUpperCase(FieldNames));
   FStyle:=Style;
end;

destructor TTableIndex.Destroy;
begin
   inherited;
end;

{ TTableIndexList }

function TTableIndexList.Add(Item: TTableIndex): Integer;
begin
   Result:=FList.Add(Item);
end;

function TTableIndexList.AddItem(Name, IndexName, FieldNames: string; Style: TTableIndexStyle): TTableIndex;
begin
   Result:=TTableIndex.Create(Name, IndexName, FieldNames, Style);
   Add(Result);
end;

function TTableIndexList.ByName(Name: string): TTableIndex;
var
   I: Integer;
   Item: TTableIndex;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if AnsiCompareText(Item.Name, Name)=0 then begin
         Result:=Item;
         Break;
      end;
   end;
end;

procedure TTableIndexList.Clear;
var
   I: Integer;
   Item: TTableIndex;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.Free;
   end;
   FList.Clear;
end;

constructor TTableIndexList.Create;
begin
   FList:=TList.Create;
end;

destructor TTableIndexList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TTableIndexList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TTableIndexList.GetItem(I: Integer): TTableIndex;
begin
   Result:=TTableIndex(FList[I]);
end;


{ TEnumItem }

procedure TEnumItem.Add(Key, Pick: string);
begin
   FKeyList.Add(Key);
   FPickList.Add(Pick);
end;

procedure TEnumItem.Add(Key: Integer; Pick: string);
begin
   FKeyList.Add(IntToStr(Key));
   FPickList.Add(Pick);
end;

constructor TEnumItem.Create(Name, Caption, Comm, Folder: string);
begin
   FName:=Trim(AnsiUpperCase(Name));
   FCaption:=Caption;
   FComm:=Comm;
   FFolder:=Folder;
   FKeyList:=TStringList.Create;
   FPickList:=TStringList.Create;
   FStyle:=[];
end;

destructor TEnumItem.Destroy;
begin
   FKeyList.Free;
   FPickList.Free;
   inherited;
end;

function TEnumItem.GetName(Value: string): string;
var
   I: Integer;
begin
   Result:=Value;
   I:=FKeyList.IndexOf(Value);
   if I<>-1 then begin
      Result:=FPickList[I];
   end;
end;

{ TEnumList }

procedure TEnumList.Add(Item: TEnumItem);
begin
   FList.Add(Item);
end;

function TEnumList.AddItem(Name, Caption, Comm, Folder: string): TEnumItem;
begin
   Result:=TEnumItem.Create(Name, Caption, Comm, Folder);
   Add(Result);
end;

function TEnumList.ByName(Name: string): TEnumItem;
var
   I: Integer;
   Item: TEnumItem;
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

procedure TEnumList.Clear;
var
   I: Integer;
   Item: TEnumItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

constructor TEnumList.Create;
begin
   FList:=TList.Create;
end;

destructor TEnumList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TEnumList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TEnumList.GetItem(I: Integer): TEnumItem;
begin
   Result:=TEnumItem(FList[I]);
end;

{ TColView }

procedure TColView.AddStyle(DoAdd: Boolean; Style: TColViewStyles);
begin
   if DoAdd then begin
      Include(FStyle, Style);
   end;
end;

procedure TColView.Assign(ColView: TColView);
begin
   if ColView<>nil then begin
      FDBItem:=ColView.DBItem;
      FFieldItem:=ColView.FieldItem;
      FFieldName:=ColView.FieldName;
      FCaption:=ColView.Caption;
      FTitle:=ColView.Title;
      FTitleAlign:=ColView.TitleAlign;
      FTitleOrientation:=ColView.TitleOrientation;
      FWidth:=ColView.Width;
      FAlign:=ColView.Align;
      FColumn:=ColView.Column;
      FOrder:=ColView.Order;
      FBgColor:=ColView.BgColor;
      FFgColor:=ColView.FgColor;
      FEnabled:=ColView.Enabled;
      FStyle:=ColView.Style;
      FNameFieldKind:=ColView.NameFieldKind;
      if FPickList<>ColView.PickList then begin
         FPickList.Assign(ColView.PickList);
      end;
      if FKeyList<>ColView.FKeyList then begin
         FKeyList.Assign(ColView.KeyList);
      end;
      FLinkEnumName:=ColView.LinkEnumName;
      FLinkEnum:=ColView.LinkEnum;
      FLinkSprName:=ColView.LinkSprName;
      FLinkSpr:=ColView.LinkSpr;
      FFieldForName:=ColView.FieldForName;
      FSelectForName:=ColView.SelectForName;
      FLinkColumnTitle:=ColView.LinkColumnTitle;
      FLinkColumnFieldName:=ColView.LinkColumnFieldName;
      FLinkFieldName:=ColView.LinkFieldName;
      FLinkJoinAlias:=ColView.LinkJoinAlias;
      FLinkStyle:=ColView.LinkStyle;
      FSelectValueStyle:=ColView.SelectValueStyle;
      FMaxDropDownRows:=ColView.MaxDropDownRows;
      FNameFieldMode:=ColView.NameFieldMode;
      FImages:=ColView.Images;
      FOnGetImageIndex:=ColView.OnGetImageIndex;
      FRowNum:=ColView.RowNum;
   end;
end;

function TColView.Clone: TColView;
begin
   Result:=TColView.Create(FFieldItem, FDBItem);
   Result.Assign(Self);
end;

constructor TColView.Create(FieldItem: TFieldItem; DBItem: TDBItem);
var
   Field: TField;
begin
   FFieldItem:=FieldItem;
   FDBItem:=DBItem; // NB: FieldItem.DBItem == FDBItem
   FStyle:=DefaultStyle;
   if FFieldItem<>nil then begin
      FFieldName:=FFieldItem.Name;
      FCaption:=FFieldItem.Caption;
      FLinkEnumName:=FFieldItem.LinkEnumName;
      FLinkSprName:=FFieldItem.LinkSprName;
      FTitle:=FCaption;
      FLinkStyle:=FFieldItem.LinkStyle;
      FSelectValueStyle:=FFieldItem.SelectValueStyle;
      FLinkSpr:=FFieldItem.LinkSpr;
      FLinkEnum:=FFieldItem.LinkEnum;
      // если поле всегда только для чтения, то устанавливаем соответствующие
      // ситили у колонки
      if FFieldItem.HaveStyle(fsReadOnly) then begin
         Include(FStyle, csSetReadOnly);
         Include(FStyle, csReadOnly);
      end;
   end
   else begin
      FCaption:='';
      FFieldName:='';
      FLinkEnumName:='';
      FLinkSprName:='';
      FTitle:='';
      FLinkStyle:=lsNone;
      FSelectValueStyle:=ssNone;
      FLinkEnum:=nil;
      FLinkSpr:=nil;
   end;
   Field:=GetField;
   if Field<>nil then begin
      AddStyle(Field.Visible, csVisible);
      AddStyle(Field.ReadOnly, csReadOnly);
      FWidth:=Length(FTitle)*7; // NB: почему такой множитель и почему нельзя взять ширину из Field
   end
   else begin
      Include(FStyle, csVisible);
      //--Exclude(FStyle, csReadOnly);
      FWidth:=Length(FTitle)*7; // NB: почему такой множитель
   end;
   FNameFieldKind:=nsFullName;
   FTitleAlign:=taCenter;//FTitleAlign:=taLeftJustify;
   FOrder:=0;
   FColumn:=nil;
   FAlign:=taLeftJustify;
   FTitleOrientation:=tohHorizontal;
   FBgColor:=clWhite;
   FFgColor:=clBlack;
   FEnabled:=True;
   FPickList:=TStringList.Create;
   FKeyList:=TStringList.Create;
   FFieldForName:='';
   FSelectForName:='';
   FLinkColumnTitle:='';
   FLinkColumnFieldName:='';
   FLinkFieldName:='';
   FLinkJoinAlias:='';
   FMaxDropDownRows:=CMaxDropDownRows;
   FNameFieldMode:=nmNone;
   FImages:=nil;
   FOnGetImageIndex:=nil;
   FRowNum:=1;
end;

function TColView.DefaultStyle: TColViewStyle;
begin
   Result:=[];
end;

procedure TColView.DeleteNameLink;
var
   FieldItem: TFieldItem;
   JoinItem: TJoinItem;
   I: Integer;
begin
   // NB: !!! эта функция не отлажена
   if FDBItem<>nil then begin
      if FLinkFieldName<>'' then begin
         FieldItem:=FDBItem.FieldList.ByName(FLinkFieldName);
         if FieldItem<>nil then begin
            I:=FieldItem.InternalLink.IndexOf(Self);
            if I<>-1 then begin
               FieldItem.InternalLink.Delete(I);
            end;
            if FieldItem.InternalLink.Count=0 then begin
               FDBItem.FieldList.Delete(FieldItem);
            end;
         end;
      end;
      if FLinkJoinAlias<>'' then begin
         JoinItem:=FDBItem.JoinList.ByAlias(FLinkJoinAlias);
         if JoinItem<>nil then begin
            I:=JoinItem.InternalLink.IndexOf(Self);
            if I<>-1 then begin
               JoinItem.InternalLink.Delete(I);
            end;
            if JoinItem.InternalLink.Count=0 then begin
               FDBItem.JoinList.Delete(JoinItem);
            end;
         end;
      end;
   end;
   FLinkFieldName:='';
   FLinkJoinAlias:='';
end;

destructor TColView.Destroy;
begin
   FPickList.Free;
   FKeyList.Free;
   inherited;
end;

procedure TColView.ExcludeStyle(S: TColViewStyles);
begin
   Exclude(FStyle, S);
end;

procedure TColView.ExcludeStyle(S: TColViewStyle);
begin
   FStyle:=FStyle-S;
end;

function TColView.GetEnabled: Boolean;
begin
   Result:=FEnabled and (FFieldItem<>nil) and FFieldItem.HaveStyle(fsViewVisible);
end;

function TColView.GetField: TField;
begin
   if (FFieldItem<>nil) and (FDBItem<>nil) then begin
      if bsView in FDBItem.Style then begin
         Result:=FFieldItem.ViewField;
      end
      else begin
         Result:=FFieldItem.SrcField;
      end;
   end
   else begin
      Result:=nil;
   end;
end;

function TColView.GetIsLinkValue: Boolean;
begin
   Result:=(FFieldItem<>nil) and
           (((FLinkStyle=lsLinkSpr) and (FLinkSprName<>'') and (FLinkSpr<>nil)) or
           ((FLinkStyle=lsLinkEnum) and (FLinkEnumName<>'') and (FLinkEnum<>nil)));
   Result:=Result or (FLinkStyle=lsOwnPickList);
end;

procedure TColView.GetKeyPickList(KeyList, PickList: TStrings);
begin
   if (KeyList<>nil) and (PickList<>nil) and (KeyList<>FKeyList) and (PickList<>FPickList) then begin
      PickList.Assign(FPickList);
      KeyList.Assign(FKeyList);
   end;
end;

function TColView.GetLinkValueCaption: string;
begin
   Result:='';
   if GetIsLinkValue then begin
      case FLinkStyle of
         lsNone:;
         lsLinkSpr: Result:=FLinkSpr.Caption;
         lsLinkEnum: Result:=FLinkEnum.Caption;
      end;
   end;
end;

function TColView.HaveStyle(Style: TColViewStyles): Boolean;
begin
   Result:=Style in FStyle;
end;

procedure TColView.IncludeStyle(S: TColViewStyles);
begin
   Include(FStyle, S);
end;

procedure TColView.IncludeStyle(S: TColViewStyle);
begin
   FStyle:=FStyle+S;
end;

procedure TColView.InternalSetFieldItem(Item: TFieldItem);
begin
   if Item<>nil then begin
      FFieldItem:=Item;
      FFieldName:=Item.Name;
      FCaption:=Item.Caption;
      // NB: надо ли здесь копировать из поля и другие свойства
      //     (связанные со справочниками)
   end
   else begin
      FFieldItem:=nil;
   end;
end;

procedure TColView.LoadFromString(S: string);
var
   sl: TStringList;
   Count: Integer;
begin
   // NB: возможно здесь надо приводить к верхнему регистру и убирать пробелы
   sl:=TStringList.Create;
   try
      sl.CommaText:=S;
      Count:=sl.Count;
      if Count>0 then FFieldName:=sl[0];
      if Count>1 then FTitle:=sl[1];
      if Count>2 then FWidth:=StrToIntDef(sl[2], FWidth);
      if Count>3 then FOrder:=StrToIntDef(sl[3], FOrder);
      if Count>4 then FAlign:=TAlignment(StrToIntDef(sl[4], Integer(FAlign)));
      if Count>5 then FTitleAlign:=TAlignment(StrToIntDef(sl[5], Integer(FTitleAlign)));
      if Count>6 then FTitleOrientation:=TTextOrientationEh(StrToIntDef(sl[6], Integer(FTitleOrientation)));
      if Count>7 then FStyle:=StringToStyle(sl[7]);
      if Count>8 then FBgColor:=StrToIntDef(sl[8], FBgColor);
      if Count>9 then FFgColor:=StrToIntDef(sl[9], FFgColor);
      if Count>10 then FEnabled:=sl[10]='1';
      if Count>11 then FLinkEnumName:=sl[11];
      if Count>12 then FLinkSprName:=sl[12];
      if Count>13 then FFieldForName:=sl[13];
      if Count>14 then FSelectForName:=sl[14];
      if Count>15 then FLinkColumnTitle:=sl[15];
      if Count>16 then FLinkColumnFieldName:=sl[16];
      if Count>17 then FPickList.CommaText:=sl[17];
      if Count>18 then FKeyList.CommaText:=sl[18];
      if FKeyList.Count<>FPickList.Count then begin
         FKeyList.Clear;
         FPickList.Clear;
      end;
      if Count>19 then FNameFieldKind:=TNameFieldKind(StrToIntDef(sl[19], Integer(FNameFieldKind)));
      if Count>20 then FLinkStyle:=TValueLinkStyle(StrToIntDef(sl[20], Integer(FLinkStyle)));
      if Count>21 then FSelectValueStyle:=TSelectValueStyle(StrToIntDef(sl[21], Integer(FSelectValueStyle)));
      if Count>22 then FMaxDropDownRows:=StrToIntDef(sl[22], FMaxDropDownRows);
      if Count>23 then FNameFieldMode:=TNameFieldMode(StrToIntDef(sl[23], Integer(FNameFieldMode)));
      if Count>24 then FRowNum:=StrToIntDef(sl[24], FRowNum);
      FFieldItem:=nil;
      FLinkSpr:=nil;
      FLinkEnum:=nil;
      FCaption:='';
   finally
      sl.Free;
   end;
end;

procedure TColView.OnGetText(Sender: TField; var Text: string; DisplayText: Boolean);
var
   Temp: string;
begin
//   if DisplayText then begin
      Temp:=Trim(Sender.AsString);
      if (Temp<>'') and (FFieldItem.LinkSpr<>nil) then begin
         Text:=FFieldItem.LinkSpr.GetFieldValue(Temp, FFieldItem.LinkSpr.NameFieldName);
      end;
//   end;
end;

procedure TColView.RestoreLinks(SprList: TDBItemList; EnumList: TEnumList);
begin
   FLinkSpr:=nil;
   FLinkEnum:=nil;
   case FLinkStyle of
      lsLinkSpr: begin
         if (FLinkSprName<>'') and (SprList<>nil) then begin
            FLinkSpr:=SprList.ByName(FLinkSprName);
         end;
      end;
      lsLinkEnum: begin
         if (FLinkEnumName<>'') and (EnumList<>nil) then begin
            FLinkEnum:=EnumList.ByName(FLinkEnumName);
         end;
      end;
   end;
end;

function TColView.SaveToString: string;
const
   MapBool: array [Boolean] of string=('0', '1');
var
   sl: TStringList;
begin
   sl:=TStringList.Create;
   try
      sl.Add(FFieldName);
      sl.Add(FTitle);
      sl.Add(IntToStr(FWidth));
      sl.Add(IntToStr(FOrder));
      sl.Add(IntToStr(Integer(FAlign)));
      sl.Add(IntToStr(Integer(FTitleAlign)));
      sl.Add(IntToStr(Integer(FTitleOrientation)));
      sl.Add(StyleToString);
      sl.Add(IntToStr(FBgColor));
      sl.Add(IntToStr(FFgColor));
      sl.Add(MapBool[FEnabled]);
      sl.Add(FLinkEnumName);
      sl.Add(FLinkSprName);
      sl.Add(FFieldForName);
      sl.Add(FSelectForName);
      sl.Add(FLinkColumnTitle);
      sl.Add(FLinkColumnFieldName);
      sl.Add(FPickList.CommaText);
      sl.Add(FKeyList.CommaText);
      sl.Add(IntToStr(Integer(FNameFieldKind)));
      sl.Add(IntToStr(Integer(FLinkStyle)));
      sl.Add(IntToStr(Integer(FSelectValueStyle)));
      sl.Add(IntToStr(FMaxDropDownRows));
      sl.Add(IntToStr(Integer(FNameFieldMode)));
      sl.Add(IntToStr(FRowNum));
      Result:=sl.CommaText;
   finally
      sl.Free;
   end;
end;

procedure TColView.SetKeyPickList(KeyList, PickList: TStrings);
begin
   if (KeyList<>nil) and (PickList<>nil) and (KeyList.Count=PickList.Count) and
      (KeyList<>FKeyList) and (PickList<>FPickList)
   then begin
      FPickList.Assign(PickList);
      FKeyList.Assign(KeyList);
   end
   else begin
      FPickList.Clear;
      FKeyList.Clear;
   end;
end;

function TColView.StringToStyle(S: string): TColViewStyle;
var
   I: Integer;
   First: Integer;
   Last: Integer;
   Len: Integer;
   Temp: string;

   procedure IncludeStyle;
   begin
      if First<=Last then begin
         Temp:=Copy(S, First, Succ(Last-First));
         Include(Result, TColViewStyles(GetEnumValue(TypeInfo(TColViewStyles), Temp)));
      end;
   end;

begin
   Result:=[];
   Len:=Length(S);
   First:=1;
   Last:=0;
   for I:=1 to Len do begin
      if S[I]='|' then begin
         Last:=Pred(I);
         IncludeStyle;
         First:=Succ(I);
      end;
   end;
   Last:=Len;
   IncludeStyle;
   if Result=[] then begin
      Result:=DefaultStyle;
   end;
end;

function TColView.StyleToString: string;
var
   S: string;
   I: TColViewStyles;
begin
   Result:='';
   for I:=Low(TColViewStyles) to High(TColViewStyles) do begin
      if I in FStyle then begin
         S:=GetEnumName(TypeInfo(TColViewStyles), Ord(I));
         if Result='' then begin
            Result:=S;
         end
         else begin
            Result:=Result+'|'+S;
         end;
      end;
   end;
end;

procedure TColView.UpdateNameLink(TableView: TTableView);
var
   LinkFieldItem: TFieldItem;
   LinkColView: TColView;
   JoinAlias: string;
   OldJoinAlias: string;
   ColumnTitle: string;
   Where: string;
   Field: string;
   FieldAlias: string;
   LinkJoinItem: TJoinItem;
   S: string;
begin
   LinkColView:=nil;
   if FLinkColumnFieldName<>'' then begin
      LinkColView:=TableView.ByFieldName(FLinkColumnFieldName);
   end;
   OldJoinAlias:=FLinkJoinAlias;
   DeleteNameLink;
   if (FNameFieldMode<>nmNone) and (FLinkStyle=lsLinkSpr) and (FLinkSpr<>nil) then begin
      case FNameFieldMode of
         nmOnlyName, nmWithValue: ColumnTitle:=FLinkSpr.Caption+'(спр)';
         nmNewColumn, nmLookup: ColumnTitle:=FLinkColumnTitle;
      end;
      Where:='';
      Field:='';
      case FNameFieldKind of
         nsFullName: Field:=FLinkSpr.NameFieldName;
         nsShortName: Field:=FLinkSpr.ShortFieldName;
         nsFieldForName: Field:=FFieldForName;
         nsSelectForName: Where:=FSelectForName;
      end;
      if FNameFieldKind=nsSelectForName then begin
         JoinAlias:=FDBItem.TableAlias;
      end
      else if FNameFieldMode=nmLookup then begin
         JoinAlias:=''; //???
      end
      else begin
         if OldJoinAlias='' then begin
            JoinAlias:=FDBItem.JoinList.GetNewAlias;
         end
         else begin
            JoinAlias:=OldJoinAlias;
         end;
         S:=FDBItem.JoinList.AliasByName(FLinkSpr.TableName, FFieldName);
         if S='' then begin
            LinkJoinItem:=FDBItem.JoinList.AddItem(FLinkSpr.TableName, JoinAlias, FFieldName, FLinkSpr.CodeFieldName, '', True, True); {KeyFieldName}
            LinkJoinItem.Internal:=True;
            LinkJoinItem.InternalLink.Add(Self);
            FLinkJoinAlias:=JoinAlias;
         end
         else begin
            FLinkJoinAlias:=S;
            LinkJoinItem:=FDBItem.JoinList.ByAlias(S);
            if LinkJoinItem.InternalLink.IndexOf(Self)=-1 then begin
               LinkJoinItem.InternalLink.Add(Self);
            end;
         end;
      end;
      FieldAlias:=Format('%s_%s', [FFieldName, FLinkSpr.Name]);
      // NB: заплатка !!! предпологается, что с одним имененм может быть только поле
      //     с одинаковыми свойствами
      LinkFieldItem:=FDBItem.FieldList.ByName(FieldAlias);
      if LinkFieldItem=nil then begin
         if FNameFieldMode=nmLookup then begin
            LinkFieldItem:=FDBItem.FieldList.AddItem(FieldAlias, Field, '', ColumnTitle, FieldItem.Comm, FieldItem.Group, FieldItem.LinkSprName, '', FieldItem.Order, [fsInternal, fsViewVisible, fsLookup], FieldItem.LinkStyle, FieldItem.SelectValueStyle, FieldItem.DataKind);
         end
         else begin
            LinkFieldItem:=FDBItem.FieldList.AddItem(FieldAlias, Field, '', ColumnTitle, '', '', '__', '', 0, [fsInternal, fsViewVisible], lsNone, ssNone, dkString);
         end;
         LinkFieldItem.TableAlias:=JoinAlias;
         LinkFieldItem.SelectText:=Where;
         if FNameFieldMode=nmLookup then begin
            LinkFieldItem.LookupFieldName:=FFieldName;
         end;
         LinkFieldItem.InternalLink.Add(Self);
      end
      else if LinkFieldItem.InternalLink.IndexOf(Self)=-1 then begin
         LinkFieldItem.InternalLink.Add(Self);
      end;
      FLinkFieldName:=FieldAlias;
      FLinkColumnFieldName:=FieldAlias;
      if FNameFieldMode in [nmNewColumn, nmLookup] then begin
         if LinkColView=nil then begin
            LinkColView:=TableView.AddItem(LinkFieldItem);
         end
         else begin
            LinkColView.InternalSetFieldItem(LinkFieldItem);
         end;
         LinkColView.IncludeStyle(csLateBind);
         LinkColView.IncludeStyle(csReadOnly);
         LinkColView.IncludeStyle(csSetReadOnly);
         LinkColView.IncludeStyle(csNameColumn);
      end
      else begin
         TableView.Delete(LinkColView);
         FLinkColumnFieldName:='';
      end;
   end
   else begin
      TableView.Delete(LinkColView);
      FLinkColumnFieldName:='';
   end;
end;

{ TTableView }

function TTableView.Add(Item: TColView): Integer;
begin
   Result:=FList.Add(Item);
end;

function TTableView.AddItem(FieldItem: TFieldItem): TColView;
begin
   Result:=TColView.Create(FieldItem, FDBItem);
   Add(Result);
end;

{procedure TTableView.AddStyle(DoAdd: Boolean; Style: TTableViewStyles);
begin
   if DoAdd then begin
      Include(FStyle, Style);
   end;
end;}

procedure TTableView.Assign(TableView: TTableView);
var
   I: Integer;
   Item: TColView;
begin
   FName:=TableView.Name;
   FDBItem:=TableView.DBItem;
   FGrid:=TableView.Grid;
   FNppColumn:=TableView.NppColumn;
   FStyle:=TableView.Style;
   FViewKind:=TableView.ViewKind;
   FLastViewKind:=TableView.LastViewKind;
   FNppColumnWidth:=TableView.NppColumnWidth;
   FNppColumnBgColor:=TableView.NppColumnBgColor;
   FNppColumnFgColor:=TableView.NppColumnFgColor;
   FVTitleMargin:=TableView.VTitleMargin;
   FRowHeight:=TableView.RowHeight;
   FBgColor:=TableView.BgColor;
   FFgColor:=TableView.FgColor;
   FOddBgColor:=TableView.OddBgColor;
   FOddFgColor:=TableView.OddFgColor;
   FEvenBgColor:=TableView.EvenBgColor;
   FEvenFgColor:=TableView.EvenFgColor;
   FReadOnlyBg:=TableView.ReadOnlyBg;
   FReadOnlyFg:=TableView.ReadOnlyFg;
   FWriteOnlyBg:=TableView.WriteOnlyBg;
   FWriteOnlyFg:=TableView.WriteOnlyFg;
   FRowBgColor:=TableView.RowBgColor;
   FRowFgColor:=TableView.RowFgColor;
   //--FSaveDate:=TableView.SaveDate;
   FOper:=TableView.Oper;
   FFormWidth:=TableView.FormWidth;
   Clear;
   for I:=0 to Pred(TableView.Count) do begin
      Item:=TableView[I];
      if Item<>nil then begin
         Add(Item.Clone);
      end;
   end;
   Reorder;
end;

function TTableView.ByFieldName(FieldName: string): TColView;
var
   I: Integer;
   Item: TColView;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (AnsiCompareText(FieldName, Item.FieldName)=0) then begin
         Result:=Item;
         Break;
      end;
   end;
end;

procedure TTableView.Clear;
var
   I: Integer;
   Item: TColView;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

function TTableView.Clone: TTableView;
begin
   Result:=TTableView.Create(FName, FDBItem);
   Result.Assign(Self);
end;

constructor TTableView.Create(Name: string; DBItem: TDBItem);
begin
   FName:=AnsiUpperCase(Trim(Name));
   FList:=TList.Create;
   FDBItem:=DBItem;
   FGrid:=nil;
   FNppColumn:=nil;
   FStyle:=DefaultStyle;
   if (FDBItem<>nil) and (bsReadOnly in FDBItem.Style) then begin
      Include(FStyle, tsReadOnly);
   end;
   FNppColumnBgColor:=TColor($E2FFFF);
   FNppColumnFgColor:=clNavy;
   FBgColor:=clWindow;
   FFgColor:=clWindowText;
   FOddBgColor:=TColor($E5E5E5{ABC9DE});
   FOddFgColor:=FFgColor;
   FEvenBgColor:=TColor($F5F5F5{D1E1ED});
   FEvenFgColor:=FFgColor;
   FReadOnlyBg:=clInfoBk;
   FReadOnlyFg:=clWindowText;
   FWriteOnlyBg:=clWindow;
   FWriteOnlyFg:=clWindowText;
   FNppColumnWidth:=40;
   FVTitleMargin:=5;
   FRowHeight:=0;
   FViewKind:=tvTable;
   FLastViewKind:=tvTable;
   FRowFgColor:=clHighlightText;
   FRowBgColor:=clHighlight;
   FSaveDate:='';
   FOper:=DefaultOper;
   FFormWidth:=0;
end;

procedure TTableView.Delete(Item: TColView);
var
   I: Integer;
begin
   if Item<>nil then begin
      I:=FList.IndexOf(Item);
      if I<>-1 then begin
         FList.Delete(I);
      end;
      Item.Free;
   end;
end;

procedure TTableView.DeleteNameLink;
var
   I: Integer;
   ColView: TColView;
begin
   for I:=0 to Pred(GetCount) do begin
      ColView:=GetItem(I);
      if (ColView<>nil) and (ColView.FieldItem<>nil) then begin
         ColView.DeleteNameLink;
      end;
   end;
end;

destructor TTableView.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

procedure TTableView.DoAfterSetColView;
begin
   if Assigned(FOnAfterSetColView) then begin
      FOnAfterSetColView(FGrid);
   end;
end;

procedure TTableView.DoAfterUpdateColView;
begin
   if Assigned(FOnAfterUpdateColView) then begin
      FOnAfterUpdateColView(FGrid);
   end;
end;

procedure TTableView.DoSetColView(ColView: TColView; Column: TColumnEh);
begin
   if Assigned(FOnSetColView) then begin
      FOnSetColView(ColView, Column);
   end;
end;

procedure TTableView.DoUpdateColView(ColView: TColView; Column: TColumnEh);
begin
   if Assigned(FOnUpdateColView) then begin
      FOnUpdateColView(ColView, Column);
   end;
end;

function TTableView.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TTableView.GetItem(I: Integer): TColView;
begin
   // NB: нет проверки на выход за пределы
   Result:=TColView(FList[I]);
end;

procedure TTableView.RelinkInternalFieldItem;
var
   I: Integer;
   ColView: TColView;
   FieldItem: TFieldItem;
begin
   if FDBItem<>nil then begin
      for I:=0 to Pred(GetCount) do begin
         ColView:=GetItem(I);
         if (ColView<>nil) and (ColView.FieldItem<>nil) and (ColView.FieldName<>'') then begin
            FieldItem:=FDBItem.FieldList.ByName(ColView.FieldName);
            if FieldItem<>nil then begin
               if FieldItem.HaveStyle(fsInternal) then begin
                  ColView.InternalSetFieldItem(FieldItem);
               end;
            end
            else begin
               ColView.InternalSetFieldItem(nil);
            end;
         end;
      end;
   end;
end;

function TTableView.LoadFromIni(Ini: TCustomIniFile; Section: string): Boolean;
var
   S: string;
   I: Integer;
   Ident: string;
   ItemCount: Integer;
   Item: TColView;
   FieldItem: TFieldItem;
   FieldName: string;
begin
   Result:=False;
   if (Ini<>nil) and (Section<>'') and (FDBItem<>nil) then begin
      FSaveDate:=Ini.ReadString(Section, 'SaveDate', '');
      S:=Ini.ReadString(Section, 'Property', '');
      if S<>'' then begin
         LoadFromString(S);
      end;
      ItemCount:=Ini.ReadInteger(Section, 'Count', 0);
      //--Clear;
      for I:=0 to Pred(ItemCount) do begin
         Ident:=Format('Item%d', [I]);
         S:=Ini.ReadString(Section, Ident, '');
         FieldName:=Copy(S, 1, Pred(Pos(',', S)));
         if S<>'' then begin
            Item:=ByFieldName(FieldName);
            if Item=nil then begin
               Item:=TColView.Create(nil, FDBItem);
               Add(Item);
            end;
            Item.LoadFromString(S);
            FieldItem:=FDBItem.FieldList.ByName(Item.FieldName);
            if FieldItem<>nil then begin
               Item.InternalSetFieldItem(FieldItem);
            end
            else if csLateBind in Item.Style then begin
               Item.InternalSetFieldItem(nil);
            end
            else begin
               Delete(Item);
            end;
         end;
      end;
      Reorder;
      Result:=True;
   end;
end;

procedure TTableView.LoadFromString(S: string);
var
   sl: TStringList;
   Count: Integer;
begin
   sl:=TStringList.Create;
   try
      sl.CommaText:=S;
      Count:=sl.Count;
      if Count>0 then FViewKind:=TTableViewKind(StrToIntDef(sl[0], Integer(FViewKind)));
      if Count>1 then FLastViewKind:=TTableViewKind(StrToIntDef(sl[1], Integer(FLastViewKind)));
      if Count>2 then FNppColumnWidth:=StrToIntDef(sl[2], FNppColumnWidth);
      if Count>3 then FNppColumnBgColor:=StrToIntDef(sl[3], FNppColumnBgColor);
      if Count>4 then FNppColumnFgColor:=StrToIntDef(sl[4], FNppColumnFgColor);
      if Count>5 then FVTitleMargin:=StrToIntDef(sl[5], FVTitleMargin);
      if Count>6 then FRowHeight:=StrToIntDef(sl[6], FRowHeight);
      if Count>7 then FBgColor:=StrToIntDef(sl[7], FBgColor);
      if Count>8 then FFgColor:=StrToIntDef(sl[8], FFgColor);
      if Count>9 then FOddBgColor:=StrToIntDef(sl[9], FOddBgColor);
      if Count>10 then FOddFgColor:=StrToIntDef(sl[10], FOddFgColor);
      if Count>11 then FEvenBgColor:=StrToIntDef(sl[11], FEvenBgColor);
      if Count>12 then FEvenFgColor:=StrToIntDef(sl[12], FEvenFgColor);
      if Count>13 then FReadOnlyBg:=StrToIntDef(sl[13], FReadOnlyBg);
      if Count>14 then FReadOnlyFg:=StrToIntDef(sl[14], FReadOnlyFg);
      if Count>15 then FWriteOnlyBg:=StrToIntDef(sl[15], FWriteOnlyBg);
      if Count>16 then FWriteOnlyFg:=StrToIntDef(sl[16], FWriteOnlyFg);
      if Count>17 then FStyle:=StringToStyle(sl[17]);
      if Count>18 then FRowBgColor:=StrToIntDef(sl[18], FRowBgColor);
      if Count>19 then FRowFgColor:=StrToIntDef(sl[19], FRowFgColor);
      if Count>20 then FOper:=StringToOper(sl[20]);
      if Count>21 then FFormWidth:=StrToIntDef(sl[21], FFormWidth);
   finally
      sl.Free;
   end;
end;

function ColViewReorder(Item1, Item2: Pointer): Integer;
begin
   Result:=TColView(Item1).Order-TColView(Item2).Order;
end;

procedure TTableView.LoadListFromString(S: string);
var
   I: Integer;
   sl: TStringList;
   Item: TColView;
   FieldItem: TFieldItem;
begin
   Clear;
   if FDBItem<>nil then begin
      sl:=TStringList.Create;
      try
         sl.Text:=S;
         for I:=0 to Pred(sl.Count) do begin
            Item:=TColView.Create(nil, FDBItem);
            Item.LoadFromString(sl[I]);
            Item.InternalSetFieldItem(nil);
            FieldItem:=FDBItem.FieldList.ByName(Item.FieldName);
            if FieldItem<>nil then begin
               Item.InternalSetFieldItem(FieldItem);
               Add(Item);
            end
            else if csLateBind in Item.Style then begin
               Add(Item);
            end
            else begin
               Item.Free;
            end;
         end;
      finally
         sl.Free;
      end;
      Reorder;
   end;
end;

procedure TTableView.Reorder;
var
   I: Integer;
   Item: TColView;
begin
   FList.Sort(ColViewReorder);
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Order:=I;
      end;
   end;
end;

function TTableView.SaveListToString: string;
var
   I: Integer;
   ColView: TColView;
begin
   Result:='';
   for I:=0 to Pred(GetCount) do begin
      ColView:=GetItem(I);
      if ColView<>nil then begin
         if Result='' then begin
            Result:=ColView.SaveToString;
         end
         else begin
            Result:=Result+#10+ColView.SaveToString;
         end;
      end;
   end;
end;

function TTableView.SaveToIni(Ini: TCustomIniFile; Section: string): Boolean;
var
   I: Integer;
   Ident: string;
   Item: TColView;
begin
   Result:=False;
   if (Ini<>nil) and (Section<>'') then begin
      Ini.EraseSection(Section);
      Ini.WriteString(Section, 'SaveDate', FormatDateTime('yyyy.mm.dd hh:nn', Now));
      Ini.WriteString(Section, 'Property', SaveToString);
      Ini.WriteInteger(Section, 'Count', GetCount);
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         Ident:=Format('Item%d', [I]);
         if Item<>nil then begin
            Ini.WriteString(Section, Ident, Item.SaveToString);
         end;
      end;
      Result:=True;
   end;
end;

function TTableView.SaveToString: string;
var
   sl: TStringList;
begin
   sl:=TStringList.Create;
   try
      sl.Add(IntToStr(Integer(FViewKind)));
      sl.Add(IntToStr(Integer(FLastViewKind)));
      sl.Add(IntToStr(FNppColumnWidth));
      sl.Add(IntToStr(FNppColumnBgColor));
      sl.Add(IntToStr(FNppColumnFgColor));
      sl.Add(IntToStr(FVTitleMargin));
      sl.Add(IntToStr(FRowHeight));
      sl.Add(IntToStr(FBgColor));
      sl.Add(IntToStr(FFgColor));
      sl.Add(IntToStr(FOddBgColor));
      sl.Add(IntToStr(FOddFgColor));
      sl.Add(IntToStr(FEvenBgColor));
      sl.Add(IntToStr(FEvenFgColor));
      sl.Add(IntToStr(FReadOnlyBg));
      sl.Add(IntToStr(FReadOnlyFg));
      sl.Add(IntToStr(FWriteOnlyBg));
      sl.Add(IntToStr(FWriteOnlyFg));
      sl.Add(StyleToString);
      sl.Add(IntToStr(FRowBgColor));
      sl.Add(IntToStr(FRowFgColor));
      sl.Add(OperToString);
      sl.Add(IntToStr(FFormWidth));
      Result:=sl.CommaText;
   finally
      sl.Free;
   end;
end;

procedure TTableView.SetColView(Grid: TDBGridEh; OnDrawCell: TGetColCellParamsEventEh; OnButtonClick: TButtonClickEventEh; LockGrid: Boolean);
var
   I: Integer;
   ColView: TColView;
   Column: TColumnEh;
   NameFieldName: string;
   Field: TField;
begin
   // если список колонок не заполнен, то его надо сформировать
   if GetCount=0 then begin
      SetDefaultColView
   end;
   // создаем колонки
   FGrid:=Grid;
   if Grid<>nil then begin
      if LockGrid then begin
         Grid.Columns.BeginUpdate;
      end;
      try
         Grid.Columns.Clear;
         if HaveStyle(tsShowNppColumn) then begin
            // добавляем колонку <номер по порядку>
            FNppColumn:=Grid.Columns.Add;
            FNppColumn.Title.Caption:='№ п/п';
            FNppColumn.Title.Alignment:=taCenter;
            FNppColumn.Tag:=0;
            FNppColumn.ReadOnly:=True;
            FNppColumn.Font.Color:=FNppColumnFgColor;
            FNppColumn.Color:=FNppColumnBgColor;
            FNppColumn.Width:=FNppColumnWidth;
            // NB: может имеет смысл для этой колонки свой передавать обработчик
            FNppColumn.OnGetCellParams:=OnDrawCell;
         end
         else begin
            FNppColumn:=nil;
         end;
         for I:=0 to Pred(GetCount) do begin
            ColView:=GetItem(I);
            if (ColView<>nil) and ColView.Enabled {--and ColView.HaveStyle(csVisible)} then begin
               Column:=Grid.Columns.Add;
               if ColView.HaveStyle(csNotTitle) then begin
                  Column.Title.Caption:='';
               end
               else begin
                  Column.Title.Caption:=ColView.Title;
               end;
               Column.Title.Alignment:=ColView.TitleAlign;
               Column.Title.Orientation:=ColView.TitleOrientation;
               Column.Title.TitleButton:=ColView.HaveStyle(csTitleButton);
               Column.Alignment:=ColView.Align;
               Column.ReadOnly:=ColView.HaveStyle(csReadOnly);
               Column.WordWrap:=ColView.HaveStyle(csWordWrap);
               Column.Visible:=ColView.HaveStyle(csVisible);
               if ColView.Width<>0 then begin // NB: с установкой ширины надо ещё разобраться будет
                  Column.Width:=ColView.Width;
               end;
               if ColView.HaveStyle(csOwnColor) then begin
                  Column.Color:=ColView.BgColor;
                  Column.Font.Color:=ColView.FgColor;
               end;
               Column.FieldName:=ColView.FieldName; // NB: здесь должно быть именно по имени поля
               Column.OnGetCellParams:=OnDrawCell;
               Column.Tag:=Integer(ColView);
               ColView.Column:=Column;
               Column.AlwaysShowEditButton:=False;
               Column.ButtonStyle:=cbsAuto;
               Column.PickList.Clear;
               Column.KeyList.Clear;
               if ColView.HaveStyle(csImage) and (ColView.Images<>nil) then begin
                  Column.ImageList:=ColView.Images;
               end
               else begin
                  Column.ImageList:=nil;
               end;
               // если есть подключаемое значение
               if ColView.IsLinkValue and (ColView.SelectValueStyle<>ssNone) then begin
                  Column.AlwaysShowEditButton:=ColView.HaveStyle(csAlwaysButton);
                  case ColView.SelectValueStyle of
                     ssShowWindow: begin
                        if (ColView.LinkStyle=lsLinkSpr) and (ColView.LinkSpr<>nil) then begin
                           Column.ButtonStyle:=cbsEllipsis;
                           Column.OnEditButtonClick:=OnButtonClick;
                        end;
                     end;
                     ssPickList: begin
                        case ColView.LinkStyle of
                           lsOwnPickList: begin
                              ColView.GetKeyPickList(ColView.KeyList, ColView.PickList);
                           end;
                           lsLinkEnum: begin
                              if ColView.LinkEnum<>nil then begin
                                 Column.PickList.Assign(ColView.LinkEnum.PickList);
                                 Column.KeyList.Assign(ColView.LinkEnum.KeyList);
                              end;
                           end;
                           lsLinkSpr: begin
                              if ColView.LinkSpr<>nil then begin
                                 case ColView.NameFieldKind of
                                    nsFullName: NameFieldName:=ColView.LinkSpr.PickFieldNames;{ColView.LinkSpr.NameFieldName;}
                                    nsShortName: NameFieldName:=ColView.LinkSpr.ShortFieldName;
                                    nsFieldForName: NameFieldName:=ColView.FieldForName;
                                    nsSelectForName: NameFieldName:=ColView.SelectForName;
                                 end;
                                 ColView.LinkSpr.GetKeyPickList(Column.KeyList, Column.PickList, NameFieldName);
                              end;
                           end;
                        end;
                        if ColView.MaxDropDownRows<>0 then begin
                           if Column.KeyList.Count>=ColView.MaxDropDownRows then begin
                              Column.DropDownRows:=ColView.MaxDropDownRows;
                           end
                           else begin
                              Column.DropDownRows:=Column.KeyList.Count;
                           end;
                        end;
                     end;
                  end;
                  //
                  Field:=ColView.FieldItem.DestField;
                  // NB: !!! временно заплатка
                  //if (ColView.LinkFieldName<>'') and (Field<>nil) then begin
                  if (ColView.LinkSpr<>nil) and (ColView.SelectValueStyle=ssShowWindow) and (not ColView.FieldItem.HaveStyle(fsLookup)) and (FDBItem.HaveStyle(bsDetail)) and (Field<>nil) then begin
                     ColView.OldOnGetText:=Field.OnGetText;
                     Field.OnGetText:=ColView.OnGetText;
                  end;
               end;
               DoSetColView(ColView, Column);
            end;
         end;
         DoAfterSetColView;
         if Grid.Columns.Count=0 then begin
            Grid.Columns.Add;
         end;
      finally
         if LockGrid then begin
            Grid.Columns.EndUpdate;
         end;
      end;
      Grid.RowSizingAllowed:=HaveStyle(tsRowSizing);
      Grid.RowHeight:=FRowHeight;
      Grid.UseMultiTitle:=HaveStyle(tsMultiTitle);
      Grid.VTitleMargin:=FVTitleMargin;
      Grid.ReadOnly:=HaveStyle(tsReadOnly) or FDBItem.HaveStyle(bsView);
      if Grid.ReadOnly then begin
         Grid.Color:=FReadOnlyBg;
         //2010.02.09
         Grid.Options:=Grid.Options-[dgEditing]+[dgAlwaysShowSelection];
         Grid.OptionsEh:=Grid.OptionsEh+[dghRowHighlight];
      end
      else begin
         Grid.Color:=FWriteOnlyBg;
         //2010.02.09
         Grid.Options:=Grid.Options+[dgEditing]-[dgAlwaysShowSelection];
         Grid.OptionsEh:=Grid.OptionsEh-[dghRowHighlight];
      end;
      if HaveStyle(tsShowNppColumn) and HaveStyle(tsFrozenNppCol) then begin
         Grid.FrozenCols:=1;
      end
      else begin
         Grid.FrozenCols:=0;
      end;
   end
   else begin
      for I:=0 to Pred(GetCount) do begin
         ColView:=GetItem(I);
         if ColView<>nil then begin
            Field:=ColView.FieldItem.DestField;
            //if (ColView.LinkFieldName<>'') and (Field<>nil) then begin
            if (ColView.LinkSpr<>nil) and (ColView.SelectValueStyle=ssShowWindow) and (not ColView.FieldItem.HaveStyle(fsLookup)) and (FDBItem.HaveStyle(bsDetail)) and (Field<>nil) then begin
               Field.OnGetText:=ColView.OldOnGetText;
            end;
            ColView.Column:=nil;
         end;
      end;
      FNppColumn:=nil;
   end;
end;

procedure TTableView.SetDefaultColView;
var
   I: Integer;
   ColView: TColView;
   FieldItem: TFieldItem;
begin
   Clear;
   if FDBItem<>nil then begin
      for I:=0 to Pred(FDBItem.FieldList.Count) do begin
         FieldItem:=FDBItem.FieldList[I];
         if (FieldItem<>nil) and FieldItem.HaveStyle(fsViewVisible) then begin
            ColView:=AddItem(FieldItem);
            ColView.Order:=FieldItem.Order;
         end;
      end;
   end;
   Reorder;
end;

function TTableView.StringToStyle(S: string): TTableViewStyle;
var
   I: Integer;
   First: Integer;
   Last: Integer;
   Len: Integer;
   Temp: string;

   procedure IncludeStyle;
   begin
      if First<=Last then begin
         Temp:=Copy(S, First, Succ(Last-First));
         Include(Result, TTableViewStyles(GetEnumValue(TypeInfo(TTableViewStyles), Temp)));
      end;
   end;

begin
   Result:=[];
   Len:=Length(S);
   First:=1;
   Last:=0;
   for I:=1 to Len do begin
      if S[I]='|' then begin
         Last:=Pred(I);
         IncludeStyle;
         First:=Succ(I);
      end;
   end;
   Last:=Len;
   IncludeStyle;
   if Result=[] then begin
      Result:=DefaultStyle;
   end;
end;

function TTableView.StyleToString: string;
var
   S: string;
   I: TTableViewStyles;
begin
   Result:='';
   for I:=Low(TTableViewStyles) to High(TTableViewStyles) do begin
      if I in FStyle then begin
         S:=GetEnumName(TypeInfo(TTableViewStyles), Ord(I));
         if Result='' then begin
            Result:=S;
         end
         else begin
            Result:=Result+'|'+S;
         end;
      end;
   end;
end;

procedure TTableView.UpdateColView;
var
   I: Integer;
   Column: TColumnEh;
   ColView: TColView;
begin
   for I:=0 to Pred(GetCount) do begin
      ColView:=GetItem(I);
      if (ColView<>nil) and ColView.Enabled and ColView.HaveStyle(csVisible) then begin
         Column:=ColView.Column;
         if Column<>nil then begin
            ColView.Order:=Column.Index;
            ColView.Width:=Column.Width;
            DoUpdateColView(ColView, Column);
         end;
      end;
      if HaveStyle(tsShowNppColumn) and (FNppColumn<>nil) then begin
         FNppColumnWidth:=FNppColumn.Width;
      end;
   end;
   Reorder;
   DoAfterUpdateColView;
end;

procedure TTableView.UpdateNameLink;
var
   I: Integer;
   ColView: TColView;
begin
   for I:=0 to Pred(GetCount) do begin
      ColView:=GetItem(I);
      if (ColView<>nil) and (ColView.FieldItem<>nil) then begin
         ColView.UpdateNameLink(Self);
      end;
   end;
end;

function TTableView.DefaultStyle: TTableViewStyle;
begin
   Result:=[tsAutoSaveColView{--, tsAutoCreateControl}];
end;

function TTableView.HaveStyle(Style: TTableViewStyles): Boolean;
begin
   Result:=Style in FStyle;
end;

procedure TTableView.RestoreLinks(SprList: TDBItemList; EnumList: TEnumList);
var
   I: Integer;
   ColView: TColView;
begin
   for I:=0 to Pred(GetCount) do begin
      ColView:=GetItem(I);
      if (ColView<>nil) then begin
         ColView.RestoreLinks(SprList, EnumList);
      end;
   end;
end;

procedure TTableView.DefaultDrawCell(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
   Column: TColumnEh;
   ColView: TColView;
   Grid: TCustomDBGridEh;
   RecNo: Integer;
   FieldItem: TFieldItem;
   Field: TField;
begin
   if Sender is TColumnEh then begin
      Column:=TColumnEh(Sender);
      if (Column<>nil) and (FDBItem<>nil) then begin
         ColView:=TColView(Column.Tag);
         Grid:=Column.Grid;
         RecNo:=FDBItem.GetRecNo;
//         if HaveStyle(tsRowHighlight) and (Grid.Row=Params.Row) then begin
//            Params.Background:=FRowBgColor;
//            Params.Font.Color:=FRowFgColor;
//         end;
         if (Params.State=[]) and (ColView<>nil) and (Grid<>nil) then begin
            if RecNo<1 then begin
               // вставка
            end
            else if HaveStyle(tsRowHighlight) and (Grid.Row=Params.Row) then begin
               Params.Background:=FRowBgColor;
               Params.Font.Color:=FRowFgColor;
            end
            else if HaveStyle(tsStriped) then begin
               if Odd(RecNo) then begin // нечетные
                  Params.Background:=FOddBgColor;
                  Params.Font.Color:=FOddFgColor;
               end
               else begin // нечетные
                  Params.Background:=FEvenBgColor;
                  Params.Font.Color:=FEvenFgColor;
               end;
            end
            else if ColView.HaveStyle(csReadOnly) or HaveStyle(tsReadOnly) or FDBItem.HaveStyle(bsView) then begin
               Params.Background:=FReadOnlyBg;
               Params.Font.Color:=FReadOnlyFg;
            end
            else if not ColView.HaveStyle(csOwnColor) then begin
               Params.Background:=FBgColor;
               Params.Font.Color:=FFgColor;
            end;
         end;
         if (ColView<>nil) and ColView.HaveStyle(csImage) and Assigned(ColView.OnGetImageIndex) then begin
            if (Column<>nil) and (Column.Field<>nil) then begin
               Params.ImageIndex:=ColView.OnGetImageIndex(Column.Field.AsString);
            end;
         end;
         if (ColView<>nil) and ((not EditMode) or ColView.HaveStyle(csEditMode)) then begin
            Field:=nil;
            if ColView.LinkFieldName<>'' then begin
               FieldItem:=FDBItem.FieldList.ByName(ColView.LinkFieldName);
               // NB: здесь есть большая проблема какое поле возвращать !!!!!
               if FieldItem<>nil then begin
                  if bsView in FDBItem.Style then begin
                     Field:=FieldItem.ViewField;
                  end
                  else if bsDetail in FDBItem.Style then begin
                     Field:=FieldItem.DestField;
                  end
                  else begin
                     Field:=FieldItem.SrcField;
                  end;
               end;
            end;
            if Field<>nil then begin
               // вывод наименования
               case ColView.NameFieldMode of
                  nmWithValue: begin
                     Params.Text:=Params.Text+' ';
                     Params.Text:=Params.Text+Field.AsString;
                  end;
                  nmOnlyName: begin
                     Params.Text:=Field.AsString;
                  end;
               end;
            end;
         end;
         // колонка <номер п/п>
         if (Column=FNppColumn) then begin
            if RecNo>0 then begin
               Params.Text:=IntToStr(RecNo);
            end
         end;
         DoGetCellParams(Sender, EditMode, Params);
      end;
   end;
end;

procedure TTableView.DoGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
   if Assigned(FOnGetCellParams) then begin
      FOnGetCellParams(Sender, EditMode, Params);
   end;
end;

procedure TTableView.ExcludeByFieldName(FieldName: string; Internal: Boolean);
var
   I: Integer;
   sl: TStringList;
   Item: TColView;
begin
   sl:=TStringList.Create;
   try
      sl.CommaText:=FieldName;
      for I:=0 to Pred(sl.Count) do begin
         Item:=ByFieldName(Trim(sl[I]));
         if Item<>nil then begin
            Item.ExcludeStyle(csVisible);
            if Internal then begin
               Item.IncludeStyle(csInternal);
            end;
         end;
      end;
   finally
      sl.Free;
   end;
end;

procedure TTableView.DeleteByFieldName(FieldName: string; Include: Boolean);
var
   I: Integer;
   sl: TStringList;
   Item: TColView;
begin
   sl:=TStringList.Create;
   try
      sl.CommaText:=FieldName;
      if Include then begin
         I:=0;
         while I<GetCount do begin
            Item:=GetItem(I);
            if sl.IndexOf(Item.FieldName)=-1 then begin
               Delete(Item);
            end
            else begin
               Inc(I);
            end;
         end;
      end
      else begin
         for I:=0 to Pred(sl.Count) do begin
            Item:=ByFieldName(Trim(sl[I]));
            if Item<>nil then begin
               Delete(Item);
            end;
         end;
      end;
   finally
      sl.Free;
   end;
end;

procedure TTableView.SetReadOnly(Value: Boolean);
begin
   if FGrid<>nil then begin
      if (not Value) and (not HaveStyle(tsReadOnly)) then begin
         FGrid.ReadOnly:=False;
         FGrid.Color:=FWriteOnlyBg;
         //2010.02.09
         FGrid.Options:=Grid.Options+[dgEditing]-[dgAlwaysShowSelection];
         FGrid.OptionsEh:=Grid.OptionsEh-[dghRowHighlight];
      end
      else begin
         FGrid.ReadOnly:=True;
         FGrid.Color:=FReadOnlyBg;
         //2010.02.09
         FGrid.Options:=Grid.Options-[dgEditing]+[dgAlwaysShowSelection];
         FGrid.OptionsEh:=Grid.OptionsEh+[dghRowHighlight];
      end;
   end;
end;

procedure TTableView.IncludeStyle(Style: TTableViewStyles);
begin
   Include(FStyle, Style);
end;

procedure TTableView.IncludeStyle(Style: TTableViewStyle);
begin
   FStyle:=FStyle+Style;
end;

procedure TTableView.ExcludeStyle(Style: TTableViewStyles);
begin
   Exclude(FStyle, Style);
end;

procedure TTableView.ExcludeStyle(Style: TTableViewStyle);
begin
   FStyle:=FStyle-Style;
end;

procedure TTableView.UpdateAndClear;
begin
   if HaveStyle(tsAutoSaveColView) then begin
      UpdateColView;
   end;
   SetColView(nil, nil, nil, False);
end;

function TTableView.DefaultOper: TTableViewOper;
var
   Oper: TTableViewOpers;
begin
   // сделать доступным по умолчанию все операции
   Result:=[];
   for Oper:=Low(TTableViewOpers) to High(TTableViewOpers) do begin
      Include(Result, Oper);
   end;
end;

function TTableView.OperToString: string;
var
   S: string;
   I: TTableViewOpers;
begin
   Result:='';
   for I:=Low(TTableViewOpers) to High(TTableViewOpers) do begin
      if I in FOper then begin
         S:=GetEnumName(TypeInfo(TTableViewOpers), Ord(I));
         if Result='' then begin
            Result:=S;
         end
         else begin
            Result:=Result+'|'+S;
         end;
      end;
   end;
end;

function TTableView.StringToOper(S: string): TTableViewOper;
var
   I: Integer;
   First: Integer;
   Last: Integer;
   Len: Integer;
   Temp: string;

   procedure IncludeOper;
   begin
      if First<=Last then begin
         Temp:=Copy(S, First, Succ(Last-First));
         Include(Result, TTableViewOpers(GetEnumValue(TypeInfo(TTableViewOpers), Temp)));
      end;
   end;

begin
   Result:=[];
   Len:=Length(S);
   First:=1;
   Last:=0;
   for I:=1 to Len do begin
      if S[I]='|' then begin
         Last:=Pred(I);
         IncludeOper;
         First:=Succ(I);
      end;
   end;
   Last:=Len;
   IncludeOper;
   if Result=[] then begin
      Result:=DefaultOper;
   end;
end;

procedure TTableView.ExcludeOper(Oper: TTableViewOpers);
begin
   Exclude(FOper, Oper);
end;

procedure TTableView.ExcludeOper(Oper: TTableViewOper);
begin
   FOper:=FOper-Oper;
end;

function TTableView.HaveOper(Oper: TTableViewOpers): Boolean;
begin
   Result:=Oper in FOper;
end;

procedure TTableView.IncludeOper(Oper: TTableViewOpers);
begin
   Include(FOper, Oper);
end;

procedure TTableView.IncludeOper(Oper: TTableViewOper);
begin
   FOper:=FOper+Oper;
end;

function TTableView.ByFieldItem(FieldItem: TFieldItem): TColView;
var
   I: Integer;
   Item: TColView;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Item.FieldItem=FieldItem) then begin
         Result:=Item;
         Break;
      end;
   end;
end;

procedure TTableView.SetDefaultOper;
begin
  FOper:=DefaultOper;
end;

{ TViewList }

function TViewList.Add(Item: TTableView): Integer;
begin
   Result:=FList.Add(Item);
end;

function TViewList.AddItem(Name: string): TTableView;
begin
   Result:=TTableView.Create(Name, FDBItem);
   Add(Result);
end;

function TViewList.ByName(Name: string): TTableView;
var
   I: Integer;
   Item: TTableView;
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

procedure TViewList.Clear;
var
   I: Integer;
   Item: TTableView;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.Free;
   end;
   FList.Clear;
end;

constructor TViewList.Create(DBItem: TDBItem);
begin
   FDBItem:=DBItem;
   FList:=TList.Create;
end;

procedure TViewList.Delete(Item: TTableView);
var
   I: Integer;
begin
   if Item<>nil then begin
      I:=FList.IndexOf(Item);
      if I<>-1 then begin
         FList.Delete(I);
      end;
      Item.Free;
   end;
end;

procedure TViewList.DeleteNameLink;
var
   I: Integer;
   TableView: TTableView;
begin
   for I:=0 to Pred(GetCount) do begin
      TableView:=GetItem(I);
      if TableView<>nil then begin
         TableView.DeleteNameLink;
      end;
   end;
end;

destructor TViewList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

procedure TViewList.ExcludeStyle(S: TTableViewStyles);
var
   I: Integer;
   TableView: TTableView;
begin
   for I:=0 to Pred(GetCount) do begin
      TableView:=GetItem(I);
      if TableView<>nil then begin
         TableView.ExcludeStyle(S);
      end;
   end;
end;

function TViewList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TViewList.GetItem(I: Integer): TTableView;
begin
   Result:=TTableView(FList[I]);
end;

procedure TViewList.IncludeStyle(S: TTableViewStyles);
var
   I: Integer;
   TableView: TTableView;
begin
   for I:=0 to Pred(GetCount) do begin
      TableView:=GetItem(I);
      if TableView<>nil then begin
         TableView.IncludeStyle(S);
      end;
   end;
end;

function TViewList.LoadFromIni(Ini: TCustomIniFile; Section: string): Boolean;
var
   I: Integer;
   Item: TTableView;
   ItemName: string;
   sl: TStringList;
begin
   // NB: в использовании этой функции заложена определенная проблема
   //     если перед чтением всё удалять, то не понятно как попадет
   //     в файл с настройками что-то новое что было добавлено при
   //     первоначальной инициализации
   Result:=False;
   if (FDBItem<>nil) and (Ini<>nil) then begin
      // NB: может имеет смысл не менять default view?
      if Section='' then begin
         Section:=FDBItem.GetDetailPath;
      end;
      sl:=TStringList.Create;
      try
         sl.CommaText:=Ini.ReadString(Section, 'View', '');
         for I:=0 to Pred(sl.Count) do begin
            ItemName:=sl[I];
            Item:=ByName(ItemName);
            if Item=nil then begin
               Item:=AddItem(ItemName);
            end;
            Result:=Item.LoadFromIni(Ini, Section+'.'+ItemName) or Result;
         end;
      finally
         sl.Free;
      end;
   end;
end;

procedure TViewList.RestoreLinks(SprList: TDBItemList; EnumList: TEnumList);
var
   I: Integer;
   TableView: TTableView;
begin
   for I:=0 to Pred(GetCount) do begin
      TableView:=GetItem(I);
      if TableView<>nil then begin
         TableView.RestoreLinks(SprList, EnumList);
      end;
   end;
end;

function TViewList.SaveToIni(Ini: TCustomIniFile; Section: string): Boolean;
var
   I: Integer;
   Item: TTableView;
   sl: TStringList;
begin
   Result:=False;
   if (FDBItem<>nil) and (Ini<>nil) then begin
      if Section='' then begin
         Section:=FDBItem.GetDetailPath;
      end;
      sl:=TStringList.Create;
      try
         for I:=0 to Pred(GetCount) do begin
            Item:=GetItem(I);
            sl.Add(Item.Name);
            Result:=Item.SaveToIni(Ini, Section+'.'+Item.Name) or Result;
         end;
         Ini.WriteString(Section, 'View', sl.CommaText);
      finally
         sl.Free;
      end;
   end;
end;

procedure TViewList.SetReadOnly(Value: Boolean);
var
   I: Integer;
   TableView: TTableView;
begin
   for I:=0 to Pred(GetCount) do begin
      TableView:=GetItem(I);
      if TableView<>nil then begin
         TableView.SetReadOnly(Value);
      end;
   end;
end;

procedure TViewList.UpdateNameLink;
var
   I: Integer;
   TableView: TTableView;
begin
   for I:=0 to Pred(GetCount) do begin
      TableView:=GetItem(I);
      if TableView<>nil then begin
         TableView.UpdateNameLink;
      end;
   end;
end;

{ TStringLists }

function TStringLists.Add(Name: string): TStringList;
begin
   Result:=ByName(Name);
   if Result=nil then begin
      Result:=TStringList.Create;
      FList.Add(Result);
      FName.Add(Name);
   end;
end;

function TStringLists.ByName(Name: string): TStringList;
var
   I: Integer;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      if AnsiCompareText(FName[I], Name)=0 then begin
         Result:=GetItem(I);
         Break;
      end;
   end;
end;

procedure TStringLists.Clear;
var
   I: Integer;
   Item: TStringList;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Item.Free;
   end;
   FList.Clear;
   FName.Clear;
end;

constructor TStringLists.Create;
begin
   FList:=TList.Create;
   FName:=TStringList.Create;
end;

destructor TStringLists.Destroy;
begin
   Clear;
   FList.Free;
   FName.Free;
   inherited;
end;

function TStringLists.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TStringLists.GetItem(I: Integer): TStringList;
begin
   Result:=TStringList(FList[I]);
end;

{ TRelationList }

function TRelationList.Add(Item: TRelationItem): Integer;
begin
   Result:=FList.Add(Item);
end;

function TRelationList.AddItem(Name, Caption, Synonim, RelationTableName, Where, GroupBy, FindOperation: string; RelationKind: TRelationKind; FindVisible: Boolean): TRelationItem;
begin
   Result:=TRelationItem.Create(Name, Caption, Synonim, RelationTableName, Where, GroupBy, FindOperation, RelationKind, FindVisible);
   Add(Result);
end;

function TRelationList.ByName(Name: string): TRelationItem;
var
   I: Integer;
   Item: TRelationItem;
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

procedure TRelationList.Clear;
var
   I: Integer;
   Item: TRelationItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

constructor TRelationList.Create;
begin
   FList:=TList.Create;
end;

destructor TRelationList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TRelationList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TRelationList.GetItem(I: Integer): TRelationItem;
begin
   Result:=TRelationItem(FList[I]);
end;

procedure TRelationList.RestoreLinks(DBList: TDBList);
var
   I: Integer;
   Item: TRelationItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.RestoreLinks(DBList);
      end;
   end;
end;

{ TRelationItem }

constructor TRelationItem.Create(Name, Caption, Synonim, RelationTableName, Where, GroupBy, FindOperation: string; RelationKind: TRelationKind; FindVisible: Boolean);
begin
   FName:=AnsiUpperCase(Trim(Name));
   FCaption:=Caption;
   FSynonim:=Synonim;
   FRelationTableName:=AnsiUpperCase(Trim(RelationTableName));
   FRelationTable:=nil;
   FRelationKind:=RelationKind;
   FFindVisible:=FindVisible;
   FFindOperation:=FindOperation;
   FWhere:=Where;
   FGroupBy:=GroupBy;
end;

destructor TRelationItem.Destroy;
begin
   inherited;
end;

function TRelationItem.GetGroup(RelationAlias: string): string;
begin
   Result:=Format(FGroupBy, [RelationAlias]);
end;

function TRelationItem.GetWhere(TableAlias, RelationAlias: string): string;
begin
   Result:=Format(FWhere, [TableAlias, RelationAlias]);
end;

procedure TRelationItem.RestoreLinks(DBList: TDBList);
begin
   FRelationTable:=nil;
   if DBList<>nil then begin
      FRelationTable:=DBList.FindTable(FRelationTableName);
   end;
end;

{ TJoinItem }

procedure TJoinItem.Assign(JoinItem: TJoinItem);
begin
   FTableName:=JoinItem.TableName;
   FAlias:=JoinItem.Alias;
   if JoinItem.MainField<>FMainField then begin
      FMainField.Assign(JoinItem.MainField);
   end;
   if JoinItem.JoinField<>FJoinField then begin
      FJoinField.Assign(JoinItem.JoinField);
   end;
   FOuterJoin:=JoinItem.OuterJoin;
   FWhere:=JoinItem.Where;
   FInternal:=JoinItem.Internal;
end;

function TJoinItem.Clone: TJoinItem;
begin
   Result:=TJoinItem.Create('', '', '', '', '', False);
   Result.Assign(Self);
end;

constructor TJoinItem.Create(TableName, Alias, MainField, JoinField, Where: string; OuterJoin: Boolean);
begin
   FTableName:=Trim(TableName);
   FAlias:=Trim(Alias);
   FMainField:=TStringList.Create;
   FMainField.CommaText:=MainField;
   FJoinField:=TStringList.Create;
   FJoinField.CommaText:=JoinField;
   FWhere:=Where;
   FOuterJoin:=OuterJoin;
   FInternal:=False;
   FInternalLink:=TList.Create;
end;

destructor TJoinItem.Destroy;
begin
   FInternalLink.Free;
   FMainField.Free;
   FJoinField.Free;
   inherited;
end;

{ TJoinList }

function TJoinList.Add(Item: TJoinItem): Integer;
begin
   Result:=FList.Add(Item);
end;

function TJoinList.AddItem(TableName, Alias, MainField, JoinField, Where: string; OuterJoin, First: Boolean): TJoinItem;
begin
   Result:=TJoinItem.Create(TableName, Alias, MainField, JoinField, Where, OuterJoin);
   if First then begin
      FList.Insert(0, Result);
   end
   else begin
      Add(Result);
   end;
end;

function TJoinList.AliasByName(TableName, MainField: string): string;
var
   I: Integer;
   Item: TJoinItem;
begin
   Result:='';
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (AnsiCompareText(TableName, Item.TableName)=0) and (AnsiCompareText(MainField, Item.MainField.CommaText)=0) then begin
         Result:=Item.Alias;
         Break;
      end;
   end;
end;

procedure TJoinList.Assign(JoinList: TJoinList);
var
   I: Integer;
   Item: TJoinItem;
begin
   Clear;
   FNumAlias:=JoinList.FNumAlias;
   for I:=0 to Pred(JoinList.Count) do begin
      Item:=JoinList[I];
      if Item<>nil then begin
         Add(Item.Clone);
      end;
   end;
end;

function TJoinList.ByAlias(Alias: string): TJoinItem;
var
   I: Integer;
   Item: TJoinItem;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (AnsiCompareText(Alias, Item.Alias)=0) then begin
         Result:=Item;
         Break;
      end;
   end;
end;

procedure TJoinList.Clear;
var
   I: Integer;
   Item: TJoinItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

procedure TJoinList.ClearInternal;
var
   I: Integer;
   Item: TJoinItem;
begin
   I:=0;
   while I<GetCount do begin
      Item:=GetItem(I);
      if (Item<>nil) and Item.Internal then begin
         FList.Delete(I);
         Item.Free;
      end
      else begin
         Inc(I);
      end;
   end;
end;

function TJoinList.Clone: TJoinList;
begin
   Result:=TJoinList.Create;
   Result.Assign(Self);
end;

constructor TJoinList.Create;
begin
   FList:=TList.Create;
   FNumAlias:=0;
end;

procedure TJoinList.Delete(Item: TJoinItem);
var
   I: Integer;
begin
   if Item<>nil then begin
      I:=FList.IndexOf(Item);
      if I<>-1 then begin
         FList.Delete(I);
      end;
      Item.Free;
   end;
end;

destructor TJoinList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TJoinList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TJoinList.GetItem(I: Integer): TJoinItem;
begin
   Result:=TJoinItem(FList[I]);
end;

function TJoinList.GetNewAlias: string;
begin
   Inc(FNumAlias);
   Result:=Format('AL%d', [FNumAlias]);
end;

{ TFormLayout }

constructor TFormLayout.Create(Name: string);
begin
   FName:=Name;
   FFormTop:=0;
   FFormLeft:=0;
   FFormWidth:=0;
   FFormHeight:=0;
   FFormWindowState:=wsNormal;
   FValueList:=TStringList.Create;
   FIsEmpty:=True;
end;

destructor TFormLayout.Destroy;
begin
   FValueList.Free;
   inherited;
end;

function TFormLayout.GetBoolean(Iden: string; DefaultValue: Boolean): Boolean;
const
   MapBool: array [Boolean] of string=('False', 'True');
var
   S: string;
begin
   S:=FValueList.Values[Iden];
   if S='' then begin
      Result:=DefaultValue;
   end
   else begin
      Result:=MapBool[True]=S;
   end;
end;

procedure TFormLayout.GetForm(Form: TForm);
begin
   if Form<>nil then begin
//      if FFormWindowState<>wsMaximized then begin
         if Form.BorderStyle<>bsDialog then begin
            Form.SetBounds(FFormLeft, FFormTop, FFormWidth, FFormHeight);
         end
         else begin
            Form.Left:=FFormLeft;
            Form.Top:=FFormTop;
         end;
//      end;
      Form.WindowState:=FFormWindowState;
   end;
end;

function TFormLayout.GetInteger(Iden: string; DefaultValue: Integer): Integer;
var
   S: string;
begin
   S:=FValueList.Values[Iden];
   Result:=StrToIntDef(S, DefaultValue);
end;

function TFormLayout.GetString(Iden: string; DefaultValue: String): String;
begin
   Result:=FValueList.Values[Iden];
   if Result=''
     then Result:=DefaultValue;
end;

procedure TFormLayout.ClearValueList;
begin
  FValueList.Clear;
end;

function TFormLayout.LoadFromIni(Ini: TCustomIniFile; Section: string): Boolean;
begin
   Result:=False;
   if (Ini<>nil) and (Section<>'') then begin
      Section:=Section+'.'+FName;
      FFormTop:=Ini.ReadInteger(Section, 'Top', FFormTop);
      FFormLeft:=Ini.ReadInteger(Section, 'Left', FFormLeft);
      FFormWidth:=Ini.ReadInteger(Section, 'Width', FFormWidth);
      FFormHeight:=Ini.ReadInteger(Section, 'Height', FFormHeight);
      FFormWindowState:=TWindowState(GetEnumValue(TypeInfo(TWindowState), Ini.ReadString(Section, 'WindowState', GetEnumName(TypeInfo(TWindowState), Ord(FFormWindowState)))));
      Section:=Section+'.ValueList';
      FValueList.Clear;
      Ini.ReadSectionValues(Section, FValueList);
      FIsEmpty:=False;
      Result:=True;
   end;
end;

function TFormLayout.SaveToIni(Ini: TCustomIniFile; Section: string): Boolean;
var
   I: Integer;
begin
   Result:=False;
   if (Ini<>nil) and (Section<>'') then begin
      Section:=Section+'.'+FName;
      Ini.EraseSection(Section);
//      if FFormWindowState<>wsMaximized then begin
         Ini.WriteInteger(Section, 'Top', FFormTop);
         Ini.WriteInteger(Section, 'Left', FFormLeft);
         Ini.WriteInteger(Section, 'Width', FFormWidth);
         Ini.WriteInteger(Section, 'Height', FFormHeight);
//      end;
      Ini.WriteString(Section, 'WindowState', GetEnumName(TypeInfo(TWindowState), Ord(FFormWindowState)));
      Section:=Section+'.ValueList';
      for I:=0 to Pred(FValueList.Count) do begin
         Ini.WriteString(Section, FValueList.Names[I], FValueList.Values[FValueList.Names[I]]);
      end;
      Result:=True;
   end;
end;

procedure TFormLayout.SetBoolean(Iden: string; Value: Boolean);
const
   MapBool: array [Boolean] of string=('False', 'True');
begin
   FValueList.Values[Iden]:=MapBool[Value];
end;

procedure TFormLayout.SetForm(Form: TForm);
begin
   if Form<>nil then begin
      if Form.WindowState<>wsMaximized then begin
         FFormTop:=Form.Top;
         FFormLeft:=Form.Left;
         FFormWidth:=Form.Width;
         FFormHeight:=Form.Height;
      end;
      FFormWindowState:=Form.WindowState;
      FIsEmpty:=False;
   end;
end;

procedure TFormLayout.SetInteger(Iden: string; Value: Integer);
begin
   FValueList.Values[Iden]:=IntToStr(Value);
end;

procedure TFormLayout.SetString(Iden: string; Value: String);
begin
   FValueList.Values[Iden]:=Value;
end;

{ TLayoutList }

function TLayoutList.Add(Item: TFormLayout): Integer;
begin
   Result:=FList.Add(Item);
end;

function TLayoutList.AddItem(Name: string): TFormLayout;
begin
   Result:=TFormLayout.Create(Name);
   Add(Result);
end;

function TLayoutList.ByName(Name: string): TFormLayout;
var
   I: Integer;
   Item: TFormLayout;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (AnsiCompareText(Name, Item.Name)=0) then begin
         Result:=Item;
         Break;
      end;
   end;
end;

procedure TLayoutList.Clear;
var
   I: Integer;
   Item: TFormLayout;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

constructor TLayoutList.Create;
begin
   FList:=TList.Create;
end;

procedure TLayoutList.Delete(Item: TFormLayout);
var
   I: Integer;
begin
   if Item<>nil then begin
      I:=FList.IndexOf(Item);
      if I<>-1 then begin
         FList.Delete(I);
      end;
      Item.Free;
   end;
end;

destructor TLayoutList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TLayoutList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TLayoutList.GetItem(I: Integer): TFormLayout;
begin
   Result:=TFormLayout(FList[I]);
end;

function TLayoutList.LoadFromIni(Ini: TCustomIniFile; Section: string): Boolean;
var
   I: Integer;
   Iden: string;
   Item: TFormLayout;
   Items: TStringList;
begin
   Result:=False;
   if (Ini<>nil) and (Section<>'') then begin
      Items:=TStringList.Create;
      try
         Clear;
         Ini.ReadSectionValues(Section, Items);
         I:=Items.IndexOfName('Count');
         if I<>-1 then begin
            Items.Delete(I);
         end;
         for I:=0 to Pred(Items.Count) do begin
            Iden:=Items.Values[Items.Names[I]];
            Item:=AddItem(Iden);
            if not Item.LoadFromIni(Ini, Section) then begin
               Delete(Item);
            end;
         end;
      finally
         Items.Free;
      end;
      Result:=True;
   end;
end;

function TLayoutList.SaveToIni(Ini: TCustomIniFile; Section: string): Boolean;
var
   I: Integer;
   Item: TFormLayout;
begin
   Result:=False;
   if (Ini<>nil) and (Section<>'') then begin
      Ini.EraseSection(Section);
      Ini.WriteInteger(Section, 'Count', GetCount);
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         if Item<>nil then begin
            Ini.WriteString(Section, Format('Item%d', [I]), Item.Name);
            Item.SaveToIni(Ini, Section);
         end;
      end;
      Result:=True;
   end;
end;

{ TDBEditLink }

procedure TDBEditLink.Clear;
begin
   if FClearEvent and (FEdit.EditButtons.Count>0) then begin
      FClearEvent:=False;
      FEdit.EditButtons[0].OnClick:=nil;
      FEdit.Tag:=0;
   end;
   if FShowName then begin
      FShowName:=False;
      FEdit.Field.OnGetText:=FOldOnGetText;
   end;
   // сброс дополнительных событий
   if Assigned(FOnEnter) then begin
      FEdit.OnEnter:=nil;
      FOnEnter:=nil;
   end;
end;

procedure TDBEditLink.Config(ViewMode: TViewMode; OnButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent);
var
   F: TField;
begin
   SetReadOnly((ViewMode=vmView) or not FFieldItem.CanEdit);
   FOldOnGetText:=nil;
   // на всякий случай что бы числовые поля не прыгали вправо
   FEdit.Alignment:=taLeftJustify;
   if (FFieldItem.LinkStyle=lsLinkSpr) and (FFieldItem.SelectValueStyle=ssShowWindow) and (FieldItem.LinkSpr<>nil) then begin
      //NB: !!! не доделано !!!
      case FEdit.Tag of
         // только наименование из справочника
         vkOnlyName: begin
            FShowName:=True;
            FTag:=vkOnlyName;
            // NB: заплатка: эта странная монипуляция нужна что бы вызвалось событие
            //     OnGetText и отобразилось в FEdit то что мне нужно
            //     (не хочется сейчас разбираться как правильно это надо было бы сделать)
            F:=FEdit.Field;
            FOldOnGetText:=F.OnGetText;
            F.OnGetText:=OnGetText;
            FEdit.DataField:='';
            FEdit.DataField:=F.FieldName;
         end;
         // наименование вместе со значением
         vkWithValue: begin
         end;
      end;
      if FEdit.EditButtons.Count>0 then begin
         FClearEvent:=True;
         FEdit.EditButtons[0].OnClick:=OnButtonClick;
         FEdit.Tag:=Integer(FieldItem);
      end;
   end;
   // NB: важное дополнение иначе надо писать ещё и OnSetText
   //     заодно я меняю цвет, что бы поле как-то отличалось по цвету как от
   //     редактируемых так и от не редактируемых
   if FShowName then begin
      FEdit.ReadOnly:=True;
      FEdit.Color:=clBtnFace;
   end;
   // установка дополнительных событий
   if not Assigned(FEdit.OnEnter) and Assigned(OnEnter) then begin
      FOnEnter:=OnEnter;
      FEdit.OnEnter:=OnEditEnter;
   end;
end;

constructor TDBEditLink.Create(DBEdit: TDBEditEh; FieldItem: TFieldItem);
begin
   FOwner:=nil;
   FEdit:=DBEdit;
   FFieldItem:=FieldItem;
   FShowName:=False;
   FClearEvent:=False;
   FTag:=0;
   FOnEnter:=nil;
end;

function TDBEditLink.GetReadOnly: Boolean;
begin
   Result:=FEdit.ReadOnly;
end;

procedure TDBEditLink.OnEditEnter(Sender: TObject);
begin
   if Assigned(FOnEnter) then begin
      FOnEnter(Sender, FFieldItem);
   end;
end;

procedure TDBEditLink.OnGetText(Sender: TField; var Text: string; DisplayText: Boolean);
var
   Temp: string;
begin
   // NB: здесь надо как-то сделать так что бы показывалось бы наименование
   //     вместо кода при редактировании на форме
   if FShowName then begin
      case FTag of
         // только наименование из справочника
         vkOnlyName: begin
            Temp:=Trim(Sender.AsString);
            if (Temp<>'') and (FFieldItem.LinkSpr<>nil) then begin
               Text:=FFieldItem.LinkSpr.GetFieldValue(Temp, FFieldItem.LinkSpr.NameFieldName);
            end;
         end;
         // наименование вместе со значением
         vkWithValue: begin
         end;
      end;
   end; 
end;

procedure TDBEditLink.SetReadOnly(Value: Boolean);
var
   I: Integer;
begin
   FEdit.ReadOnly:=Value;
   if Value then begin
      FEdit.Color:=Owner.ReadOnlyBg;
   end
   else begin
      FEdit.Color:=Owner.WriteOnlyBg;
   end;
   //NB: !!! отключить доступность отдельно для кнопок, отдельно для элемента управления - так просто нельзя
   for I:=0 to Pred(FEdit.EditButtons.Count) do begin
      FEdit.EditButtons[I].Visible:=not Value;
   end;
end;

function TDBEditLink.TestControl(Control: TControl): Boolean;
begin
   Result:=FEdit=Control;
end;

{ TDBNumberEditLink }

procedure TDBNumberEditLink.Config(ViewMode: TViewMode; OnButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent);
begin
   SetReadOnly((ViewMode=vmView) or not FFieldItem.CanEdit);
end;

constructor TDBNumberEditLink.Create(DBNumberEdit: TDBNumberEditEh; FieldItem: TFieldItem);
begin
   FOwner:=nil;
   FNumberEdit:=DBNumberEdit;
   FFieldItem:=FieldItem;
end;

function TDBNumberEditLink.GetReadOnly: Boolean;
begin
   Result:=FNumberEdit.ReadOnly;
end;

procedure TDBNumberEditLink.SetReadOnly(Value: Boolean);
begin
   FNumberEdit.ReadOnly:=Value;
   if Value then begin
      FNumberEdit.Color:=Owner.ReadOnlyBg;
   end
   else begin
      FNumberEdit.Color:=Owner.WriteOnlyBg;
   end;
end;

function TDBNumberEditLink.TestControl(Control: TControl): Boolean;
begin
   Result:=FNumberEdit=Control;
end;

{ TDBDateTimeEditLink }

procedure TDBDateTimeEditLink.Config(ViewMode: TViewMode; OnButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent);
begin
   SetReadOnly((ViewMode=vmView) or not FFieldItem.CanEdit);
end;

constructor TDBDateTimeEditLink.Create(DBDateTimeEdit: TDBDateTimeEditEh; FieldItem: TFieldItem);
begin
   FOwner:=nil;
   FDateTimeEdit:=DBDateTimeEdit;
   FFieldItem:=FieldItem;
end;

function TDBDateTimeEditLink.GetReadOnly: Boolean;
begin
   Result:=FDateTimeEdit.ReadOnly;
end;

procedure TDBDateTimeEditLink.SetReadOnly(Value: Boolean);
begin
   FDateTimeEdit.ReadOnly:=Value;
   if Value then begin
      FDateTimeEdit.Color:=Owner.ReadOnlyBg;
   end
   else begin
      FDateTimeEdit.Color:=Owner.WriteOnlyBg;
   end;
end;

function TDBDateTimeEditLink.TestControl(Control: TControl): Boolean;
begin
   Result:=FDateTimeEdit=Control;
end;

{ TDBMemoLink }

procedure TDBMemoLink.Config(ViewMode: TViewMode; OnButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent);
begin
   SetReadOnly((ViewMode=vmView) or not FFieldItem.CanEdit);
end;

constructor TDBMemoLink.Create(DBMemo: TDBMemo; FieldItem: TFieldItem);
begin
   FOwner:=nil;
   FMemo:=DBMemo;
   FFieldItem:=FieldItem;
end;

function TDBMemoLink.GetReadOnly: Boolean;
begin
   Result:=FMemo.ReadOnly;
end;

procedure TDBMemoLink.SetReadOnly(Value: Boolean);
begin
   FMemo.ReadOnly:=Value;
   if Value then begin
      FMemo.Color:=Owner.ReadOnlyBg;
   end
   else begin
      FMemo.Color:=Owner.WriteOnlyBg;
   end;
end;

function TDBMemoLink.TestControl(Control: TControl): Boolean;
begin
   Result:=FMemo=Control;
end;

{ TDBComboBoxLink }

procedure TDBComboBoxLink.Clear;
begin
   if FClearEvent and (FComboBox.EditButtons.Count>0) then begin
      FClearEvent:=False;
      FComboBox.EditButtons[0].OnClick:=nil;
      FComboBox.Tag:=0;
   end;
end;

type TDBComboBoxEh2=class(TDBComboBoxEh);

procedure TDBComboBoxLink.Config(ViewMode: TViewMode; OnButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent);
{--var
   I: Integer;
   MaxWidth: Integer;
   ItemWidth: Integer;}
begin
   SetReadOnly((ViewMode=vmView) or not FFieldItem.CanEdit);
   if FieldItem.SelectValueStyle=ssPickList then begin
      case FieldItem.LinkStyle of
         lsLinkSpr: if (FFieldItem.LinkSpr<>nil) and FFieldItem.LinkSpr.HaveStyle(bsPickList) then begin
            FFieldItem.LinkSpr.GetKeyPickList(FComboBox.KeyItems, FComboBox.Items, FFieldItem.LinkSpr.PickFieldNames{FFieldItem.LinkSpr.NameFieldName});
            FComboBox.DropDownBox.Rows:=FComboBox.KeyItems.Count;
         end;
         lsLinkEnum: if FFieldItem.LinkEnum<>nil then begin
            FComboBox.Items.Assign(FFieldItem.LinkEnum.PickList);
            FComboBox.KeyItems.Assign(FFieldItem.LinkEnum.KeyList);
            FComboBox.DropDownBox.Rows:=FComboBox.KeyItems.Count;
         end;
         lsOwnPickList: begin
            // NB: не совсем понимаю что здесь должно быть, видимо надо доделать TFieldItem
         end;
      end;
   end;
   if (FFieldItem.LinkStyle=lsLinkSpr) and (FieldItem.LinkSpr<>nil) then begin
      if FComboBox.EditButtons.Count>0 then begin
         FClearEvent:=True;
         FComboBox.EditButtons[0].OnClick:=OnButtonClick;
         FComboBox.Tag:=Integer(FieldItem);
      end;
   end;
   // установить ширину выпадающего списка
   SetDropDownWidth(FComboBox);
   {--ItemWidth:=FComboBox.ClientWidth;
   MaxWidth:=GetSystemMetrics(SM_CXFULLSCREEN)-FComboBox.Parent.ClientToScreen(Point(FComboBox.Left, FComboBox.Top)).X;
   for I:=0 to Pred(FComboBox.Items.Count) do begin
      ItemWidth:=Max(ItemWidth, GetTextWidth(FComboBox.Items[I], FComboBox.Font.Height, FComboBox.Font.Name, False)+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXBORDER));
   end;
   FComboBox.DropDownBox.Width:=Min(MaxWidth, ItemWidth);
   --}
end;

constructor TDBComboBoxLink.Create(DBComboBox: TDBComboBoxEh; FieldItem: TFieldItem);
begin
   FOwner:=nil;
   FComboBox:=DBComboBox;
   FFieldItem:=FieldItem;
   FClearEvent:=False;
end;

function TDBComboBoxLink.GetReadOnly: Boolean;
begin
   Result:=FComboBox.ReadOnly;
end;

procedure TDBComboBoxLink.SetReadOnly(Value: Boolean);
var
   I: Integer;
begin
   FComboBox.ReadOnly:=Value;
   if Value then begin
      FComboBox.Color:=Owner.ReadOnlyBg;
   end
   else begin
      FComboBox.Color:=Owner.WriteOnlyBg;
   end;
   for I:=0 to Pred(FComboBox.EditButtons.Count) do begin
      FComboBox.EditButtons[I].Visible:=not Value;
   end;
end;

function TDBComboBoxLink.TestControl(Control: TControl): Boolean;
begin
   Result:=FComboBox=Control;
end;

{ TDBAwareList }

function TDBAwareList.Add(Item: TDBAware): Integer;
begin
   Result:=FList.Add(Item);
   Item.Owner:=Self;
end;

function TDBAwareList.AddComboBox(DBComboBox: TDBComboBoxEh; FieldItem: TFieldItem): TDBAware;
begin
   Result:=TDBComboBoxLink.Create(DBComboBox, FieldItem);
   Add(Result);
end;

function TDBAwareList.AddDateTimeEdit(DBDateTimeEdit: TDBDateTimeEditEh; FieldItem: TFieldItem): TDBAware;
begin
   Result:=TDBDateTimeEditLink.Create(DBDateTimeEdit, FieldItem);
   Add(Result);
end;

function TDBAwareList.AddEdit(DBEdit: TDBEditEh; FieldItem: TFieldItem): TDBAware;
begin
   Result:=TDBEditLink.Create(DBEdit, FieldItem);
   Add(Result);
end;

function TDBAwareList.AddMemo(DBMemo: TDBMemo; FieldItem: TFieldItem): TDBAware;
begin
   Result:=TDBMemoLink.Create(DBMemo, FieldItem);
   Add(Result);
end;

function TDBAwareList.AddNumberEdit(DBNumberEdit: TDBNumberEditEh; FieldItem: TFieldItem): TDBAware;
begin
   Result:=TDBNumberEditLink.Create(DBNumberEdit, FieldItem);
   Add(Result);
end;

procedure TDBAwareList.BuildControlList(DBItem: TDBItem; WinControl: TWinControl);
var
   I: Integer;
   Component: TComponent;
   TableItem: TDBItem;
   FieldItem: TFieldItem;
   DBDateTimeEdit: TDBDateTimeEditEh;
   DBNumberEdit: TDBNumberEditEh;
   DBComboBox: TDBComboBoxEh;
   DBLookupComboBox: TDBLookupComboBoxEh;
   DBEdit: TDBEditEh;
   DBMemo: TDBMemo;
   DBCheckBox: TDBCheckBoxEh;
   DBGrid: TDBGridEh;

   function GetFieldItem(FieldName: string): TFieldItem;
   var
      P: Integer;
      FieldList: TFieldList;
      DetailDBItem: TDBItem;
      TableName: string;
   begin
      FieldList:=nil;
      TableName:='';
      P:=Pos('.', FieldName);
      if P<>0 then begin
         TableName:=Copy(FieldName, 1, Pred(P));
         Delete(FieldName, 1, P);
      end;
      if TableName<>'' then begin
         DetailDBItem:=DBItem.DetailList.FindTable(TableName);
         if DetailDBItem<>nil then begin
            FieldList:=DetailDBItem.FieldList;
         end;
      end
      else begin
         FieldList:=DBItem.FieldList;
      end;
      if FieldList<>nil then begin
         Result:=FieldList.ByName(FieldName);
      end
      else begin
         Result:=nil;
      end;
   end;

   function GetTableItem(TableName: string): TDBItem;
   begin
      Result:=DBItem.DetailList.FindTable(TableName);
   end;

begin
   Clear;
   for I:=0 to Pred(WinControl.ComponentCount) do begin
      Component:=WinControl.Components[I];
      if Component.Tag<>-1 then begin {//2010.02.14}
         if Component is TDBDateTimeEditEh then begin
            DBDateTimeEdit:=TDBDateTimeEditEh(Component);
            FieldItem:=GetFieldItem(DBDateTimeEdit.DataField);
            if FieldItem<>nil then begin
               AddDateTimeEdit(DBDateTimeEdit, FieldItem);
               DBDateTimeEdit.DataField:=FieldItem.Name;
               DBDateTimeEdit.DataSource:=FieldItem.DBItem.EditSource;
            end
            else begin
               DBDateTimeEdit.DataField:='';
               DBDateTimeEdit.DataSource:=nil;
            end;
         end
         else if Component is TDBNumberEditEh then begin
            DBNumberEdit:=TDBNumberEditEh(Component);
            FieldItem:=GetFieldItem(DBNumberEdit.DataField);
            if FieldItem<>nil then begin
               AddNumberEdit(DBNumberEdit, FieldItem);
               DBNumberEdit.DataField:=FieldItem.Name;
               DBNumberEdit.DataSource:=FieldItem.DBItem.EditSource;
            end
            else begin
               DBNumberEdit.DataField:='';
               DBNumberEdit.DataSource:=nil;
            end;
         end
         else if Component is TDBLookupComboBoxEh then begin
            DBLookupComboBox:=TDBLookupComboBoxEh(Component);
            FieldItem:=GetFieldItem(DBLookupComboBox.DataField);
            if FieldItem<>nil then begin
               AddLookupComboBox(DBLookupComboBox, FieldItem);
               DBLookupComboBox.DataField:=FieldItem.Name;
               DBLookupComboBox.DataSource:=FieldItem.DBItem.EditSource;
            end
            else begin
               DBLookupComboBox.DataField:='';
               DBLookupComboBox.DataSource:=nil;
            end;
         end
         else if Component is TDBComboBoxEh then begin
            DBComboBox:=TDBComboBoxEh(Component);
            FieldItem:=GetFieldItem(DBComboBox.DataField);
            if FieldItem<>nil then begin
               AddComboBox(DBComboBox, FieldItem);
               DBComboBox.DataField:=FieldItem.Name;
               DBComboBox.DataSource:=FieldItem.DBItem.EditSource;
            end
            else begin
               DBComboBox.DataField:='';
               DBComboBox.DataSource:=nil;
            end;
         end
         else if Component is TDBCheckBoxEh then begin
            DBCheckBox:=TDBCheckBoxEh(Component);
            FieldItem:=GetFieldItem(DBCheckBox.DataField);
            if FieldItem<>nil then begin
               AddCheckBox(DBCheckBox, FieldItem);
               DBCheckBox.DataField:=FieldItem.Name;
               DBCheckBox.DataSource:=FieldItem.DBItem.EditSource;
            end
            else begin
               DBCheckBox.DataField:='';
               DBCheckBox.DataSource:=nil;
            end;
         end
         else if Component is TDBEditEh then begin
            DBEdit:=TDBEditEh(Component);
            FieldItem:=GetFieldItem(DBEdit.DataField);
            if FieldItem<>nil then begin
               AddEdit(DBEdit, FieldItem);
               DBEdit.DataField:=FieldItem.Name;
               DBEdit.DataSource:=FieldItem.DBItem.EditSource;
            end
            else begin
               DBEdit.DataField:='';
               DBEdit.DataSource:=nil;
            end;
         end
         else if Component is TDBMemo then begin
            DBMemo:=TDBMemo(Component);
            FieldItem:=GetFieldItem(DBMemo.DataField);
            if FieldItem<>nil then begin
               AddMemo(DBMemo, FieldItem);
               DBMemo.DataField:=FieldItem.Name;
               DBMemo.DataSource:=FieldItem.DBItem.EditSource;
            end
            else begin
               DBMemo.DataField:='';
               DBMemo.DataSource:=nil;
            end;
         end
         else if Component is TDBGridEh then begin
            DBGrid:=TDBGridEh(Component);
            TableItem:=GetTableItem(DBGrid.Name);
            if TableItem<>nil then begin
               AddGrid(DBGrid, TableItem);
               DBGrid.DataSource:=TableItem.EditSource;
            end
            else begin
               DBGrid.DataSource:=nil;
            end;
         end;
      end;
   end;
end;

procedure TDBAwareList.Clear;
var
   I: Integer;
   Item: TDBAware;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

procedure TDBAwareList.ConfigControlList(ViewMode: TViewMode; OnButtonClick, OnGridButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent);
var
   I: Integer;
   Item: TDBAware;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         if Item is TDBGridLink then begin
            Item.Config(ViewMode, OnGridButtonClick, OnEnter);
         end
         else begin
            Item.Config(ViewMode, OnButtonClick, OnEnter);
         end;
      end;
   end;
end;

constructor TDBAwareList.Create;
begin
   FList:=TList.Create;
   FReadOnlyBg:=clInfoBk;
   FReadOnlyFg:=clWindowText;
   FWriteOnlyBg:=clWindow;
   FWriteOnlyFg:=clWindowText;
end;

destructor TDBAwareList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TDBAwareList.ByControl(Control: TControl): TDBAware;
var
   I: Integer;
   Item: TDBAware;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and Item.TestControl(Control) then begin
         Result:=Item;
         Break;
      end;
   end;
end;

function TDBAwareList.FindFirstEditable(WinControl: TWinControl): TWinControl;
var
   I: Integer;
   Control: TControl;
   TabOrderList: TList;
   Item: TDBAware;
begin
   Result:=nil;
   TabOrderList:=TList.Create;
   try
      WinControl.GetTabOrderList(TabOrderList);
      for I:=0 to Pred(TabOrderList.Count) do begin
         Control:=TControl(TabOrderList[I]);
         Item:=ByControl(Control);
         if (Item<>nil) and Item.FieldItem.CanEdit then begin
            if Control is TWinControl then begin
               Result:=TWinControl(Control);
            end;
            Break;
         end;
      end;
   finally
      TabOrderList.Free;
   end;
end;

function TDBAwareList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TDBAwareList.GetItem(I: Integer): TDBAware;
begin
   Result:=TDBAware(FList[I]);
end;

function TDBAwareList.GetItemReadOnly(I: Integer; Owner: TDBItem): Boolean;
var
   Item: TDBAware;
begin
   Item:=GetItem(I);
   if (Item<>nil) and ((Owner=nil) or (Item.FieldItem.DBItem=Owner)) then begin
      Result:=Item.GetReadOnly;
   end
   else begin
      Result:=False;
   end;
end;

procedure TDBAwareList.SetItemReadOnly(I: Integer; Owner: TDBItem; Value: Boolean);
var
   Item: TDBAware;
begin
   Item:=GetItem(I);
   if (Item<>nil) and ((Owner=nil) or (Item.FieldItem.DBItem=Owner)) then begin
      if (not Value) and Item.FieldItem.CanEdit then begin
         Item.SetReadOnly(False);
      end
      else begin
         Item.SetReadOnly(True);
      end;
   end;
end;

procedure TDBAwareList.SetReadOnly(Value: Boolean; Owner: TDBItem);
var
   I: Integer;
begin
   for I:=0 to Pred(GetCount) do begin
      SetItemReadOnly(I, Owner, Value);
   end;
end;

function TDBAwareList.AddLookupComboBox(DBLookupComboBox: TDBLookupComboBoxEh; FieldItem: TFieldItem): TDBAware;
begin
   Result:=TDBLookupComboBoxLink.Create(DBLookupComboBox, FieldItem);
   Add(Result);
end;

procedure TDBAwareList.ClearControlList;
var
   I: Integer;
   Item: TDBAware;
begin
   //NB: !!! DataSource=nil ???????????
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Clear;
      end;
   end;
end;

function TDBAwareList.AddCheckBox(DBCheckBox: TDBCheckBoxEh; FieldItem: TFieldItem): TDBAware;
begin
   Result:=TDBCheckBoxLink.Create(DBCheckBox, FieldItem);
   Add(Result);
end;

procedure TDBAwareList.SetFirstEditableFocus(Form: TForm);
var
   Control: TWinControl;
begin
   Control:=FindFirstEditable(Form);
   if (Control<>nil) and Control.CanFocus then begin
      Form.ActiveControl:=Control;
   end;
end;

function TDBAwareList.AddGrid(DBGrid: TDBGridEh; TableItem: TDBItem): TDBAware;
begin
   Result:=TDBGridLink.Create(DBGrid, TableItem);
   Add(Result);
end;

{ TDBLookupComboBoxLink }

procedure TDBLookupComboBoxLink.Clear;
begin
   if FClearEvent and (FLookupComboBox.EditButtons.Count>0) then begin
      FClearEvent:=False;
      FLookupComboBox.EditButtons[0].OnClick:=nil;
      FLookupComboBox.Tag:=0;
   end;
end;

procedure TDBLookupComboBoxLink.Config(ViewMode: TViewMode; OnButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent);
begin
   SetReadOnly((ViewMode=vmView) or not FFieldItem.CanEdit);
   if FFieldItem.HaveStyle(fsLookup) then begin
      // NB: lookup поле на данный момент уже должно быть создано, иначе
      //     (при динамическом создании в этот момент) пришлось бы заново
      //     создавать список полей и переоткрывать таблицу
   end;
   if FFieldItem.HaveStyle(fsLookupCombo) then begin      
     FLookupComboBox.ListSource:=FFieldItem.LinkSpr.TableSource;
     FLookupComboBox.KeyField:=FFieldItem.LinkSpr.CodeFieldName;{KeyFieldName}
     FLookupComboBox.ListField:=FFieldItem.LinkSpr.NameFieldName;
   end;
   if (FFieldItem.LinkStyle=lsLinkSpr) and (FFieldItem.SelectValueStyle=ssShowWindow) and (FieldItem.LinkSpr<>nil) then begin
      if FLookupComboBox.EditButtons.Count>0 then begin
         FClearEvent:=True;
         FLookupComboBox.EditButtons[0].OnClick:=OnButtonClick;
         FLookupComboBox.Tag:=Integer(FieldItem);
      end;
   end;
end;

constructor TDBLookupComboBoxLink.Create(DBLookupComboBox: TDBLookupComboBoxEh; FieldItem: TFieldItem);
begin
   FOwner:=nil;
   FLookupComboBox:=DBLookupComboBox;
   FFieldItem:=FieldItem;
   FClearEvent:=False;
end;

function TDBLookupComboBoxLink.GetReadOnly: Boolean;
begin
   Result:=FLookupComboBox.ReadOnly;
end;

procedure TDBLookupComboBoxLink.SetReadOnly(Value: Boolean);
var
   I: Integer;
begin
   FLookupComboBox.ReadOnly:=Value;
   if Value then begin
      FLookupComboBox.Color:=Owner.ReadOnlyBg;
   end
   else begin
      FLookupComboBox.Color:=Owner.WriteOnlyBg;
   end;
   for I:=0 to Pred(FLookupComboBox.EditButtons.Count) do begin
      FLookupComboBox.EditButtons[I].Visible:=not Value;
   end;
end;

function TDBLookupComboBoxLink.TestControl(Control: TControl): Boolean;
begin
   Result:=FLookupComboBox=Control;
end;

{ TDBCheckBoxLink }

procedure TDBCheckBoxLink.Config(ViewMode: TViewMode; OnButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent);
begin
   SetReadOnly((ViewMode=vmView) or not FFieldItem.CanEdit);
end;

constructor TDBCheckBoxLink.Create(DBCheckBox: TDBCheckBoxEh; FieldItem: TFieldItem);
begin
   FOwner:=nil;
   FCheckBox:=DBCheckBox;
   FFieldItem:=FieldItem;
end;

function TDBCheckBoxLink.GetReadOnly: Boolean;
begin
   Result:=FCheckBox.ReadOnly;
end;

procedure TDBCheckBoxLink.SetReadOnly(Value: Boolean);
begin
   FCheckBox.ReadOnly:=Value;
   {--цвет CheckBox`а так просто не поменяешь
   if Value then begin
      FCheckBox.Color:=Owner.ReadOnlyBg;
   end
   else begin
      FCheckBox.Color:=Owner.WriteOnlyBg;
   end;
   }
end;

function TDBCheckBoxLink.TestControl(Control: TControl): Boolean;
begin
   Result:=FCheckBox=Control;
end;

{ TDBAware }

procedure TDBAware.Clear;
begin

end;

procedure TDBAware.OnGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
end;

{ TLookItem }

function TLookItem.CanApplyFilter: Boolean;
begin
   Result:=FFilter and (Value<>Null);
end;

constructor TLookItem.Create(Owner: TLookList; Caption: string; Folder, Filter, ReadChild: Boolean; ImageIndex, OpenIndex, CloseIndex, Id: Integer);
begin
   FChild:=TLookList.Create(Self);
   FOwner:=Owner;
   FCaption:=Caption;
   FFolder:=Folder;
   FFilter:=Filter;
   FReadChild:=ReadChild;
   FImageIndex:=ImageIndex;
   FOpenIndex:=OpenIndex;
   FCloseIndex:=CloseIndex;
   FId:=Id;
   FNode:=nil;
   FValue:=Null;
end;

destructor TLookItem.Destroy;
begin
   FChild.Free;
   inherited;
end;

function TLookItem.IsFolder: Boolean;
begin
   Result:=FFolder;
end;

{ TLookList }

function TLookList.Add(Item: TLookItem): Integer;
begin
   Result:=FList.Add(Item);
end;

function TLookList.AddItem(Caption: string; Folder, Filter, ReadChild: Boolean; ImageIndex, OpenIndex, CloseIndex, Id: Integer): TLookItem;
begin
   Result:=TLookItem.Create(Self, Caption, Folder, Filter, ReadChild, ImageIndex, OpenIndex, CloseIndex, Id);
   Add(Result);
end;

procedure TLookList.Clear;
var
   I: Integer;
   Item: TLookItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

constructor TLookList.Create(Owner: TLookItem);
begin
   FOwner:=Owner;
   FList:=TList.Create;
end;

procedure TLookList.Delete(Item: TLookItem);
var
   I: Integer;
begin
   if Item<>nil then begin
      I:=FList.IndexOf(Item);
      if I<>-1 then begin
         FList.Delete(I);
      end;
      Item.Free;
   end;
end;

destructor TLookList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TLookList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TLookList.GetItem(I: Integer): TLookItem;
begin
   Result:=TLookItem(FList[I]);
end;

{ TLookTree }

function TLookTree.ApplyFilter(Item: TLookItem): Boolean;
var
   fl: Boolean;
begin
   Result:=False;
   fl:=False;
   if Assigned(FOnApplyFilter) then begin
      fl:=FOnApplyFilter(Self, Item);
   end;
   if fl and Item.CanApplyFilter then begin
      Result:=True;
      FDBItem.LookFilter:=Item.Value;
   end;
end;

procedure TLookTree.Close;
begin
   FRoot.Clear;
   FRebuild:=True;
end;

constructor TLookTree.Create(Name, Caption, TableViewName: string; DBItem: TDBItem; OnGetEvent: TOnGetLookTreeEvent; OnApplyFilter: TOnApplyFilterEvent; Images: TImageList; SprNameList: string);
begin
   FName:=Name;
   FCaption:=Caption;
   FTableViewName:=TableViewName;
   FDBItem:=DBItem;
   FRoot:=TLookList.Create(nil);
   FOnGetLookTree:=OnGetEvent;
   FOnApplyFilter:=OnApplyFilter;
   FImages:=Images;
   FDoExpand:=False;
   FRebuild:=False;
   FSprNames:=TStringList.Create;
   FSprNames.CommaText:=AnsiUpperCase(SprNameList);
end;

destructor TLookTree.Destroy;
begin
   FSprNames.Free;
   FRoot.Free;
   inherited;
end;

function TLookTree.DoGetLookTree: Boolean;
begin
   Result:=False;
   if Assigned(FOnGetLookTree) then begin
      Result:=FOnGetLookTree(FName, Self);
   end;
end;

function TLookTree.GetOneId: Integer;
var
   Count: Integer;
   Id: Integer;

   procedure CountId(LookList: TLookList);
   var
      I: Integer;
      LookItem: TLookItem;
   begin
      if Count<2 then begin
         for I:=0 to Pred(LookList.Count) do begin
            LookItem:=LookList[I];
            if LookItem.IsFolder then begin
               CountId(LookItem.Child);
            end
            else begin
               Id:=LookItem.Id;
               Inc(Count);
            end;
         end;
      end;
   end;

begin
   Result:=-1;
   Count:=0;
   Id:=-1;
   CountId(FRoot);
   if Count=1 then begin
      Result:=Id;
   end
   else if Count=0 then begin
      Result:=-2;
   end;
end;

procedure TLookTree.ReadChild(Item: TLookItem);
begin
   Item.ReadChild:=True;
end;

{ TLookTreeList }

function TLookTreeList.Add(Item: TLookTree): Integer;
begin
   Result:=FList.Add(Item);
end;

function TLookTreeList.AddItem(Name, Caption, TableViewName: string; DBItem: TDBItem; OnGetEvent: TOnGetLookTreeEvent; OnApplyFilter: TOnApplyFilterEvent; Images: TImageList; SprNameList: string): TLookTree;
begin
   Result:=TLookTree.Create(Name, Caption, TableViewName, DBItem, OnGetEvent, OnApplyFilter, Images, SprNameList);
   Add(Result);
end;

function TLookTreeList.ByName(Name: string): TLookTree;
var
   I: Integer;
   LookTree: TLookTree;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      LookTree:=GetItem(I);
      if SameText(LookTree.Name, Name) then begin
         Result:=LookTree;
         Break;
      end;
   end;
end;

procedure TLookTreeList.Clear;
var
   I: Integer;
   Item: TLookTree;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

procedure TLookTreeList.Close;
var
   I: Integer;
   LookTree: TLookTree;
begin
   for I:=0 to Pred(GetCount) do begin
      LookTree:=GetItem(I);
      if LookTree<>nil then begin
         LookTree.Close;
      end;
   end;
end;

constructor TLookTreeList.Create;
begin
   FList:=TList.Create;
end;

procedure TLookTreeList.Delete(Item: TLookTree);
var
   I: Integer;
begin
   if Item<>nil then begin
      I:=FList.IndexOf(Item);
      if I<>-1 then begin
         FList.Delete(I);
      end;
      Item.Free;
   end;
end;

destructor TLookTreeList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TLookTreeList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TLookTreeList.GetItem(I: Integer): TLookTree;
begin
   Result:=TLookTree(FList[I]);
end;

procedure TLookTreeList.UpdateSpr(SprName: string);
var
   I: Integer;
   LookTree: TLookTree;
begin
   for I:=0 to Pred(GetCount) do begin
      LookTree:=GetItem(I);
      if LookTree.SprNames.IndexOf(AnsiUpperCase(SprName))<>-1 then begin
         LookTree.Rebuild:=True;
      end;
   end;
end;

{ TDBControl }

constructor TDBControl.Create(DBItem: TDBItem);
var
  TableView:TTableView;
begin
   FDBItem:=DBItem;
   FDBItem.Control:=Self;
   //подключений событий
   FDBItem.OnOpen:=OnOpen;
   FDBItem.OnBeforeClose:=OnBeforeClose;
   FDBItem.OnSetDefaultValue:=OnSetDefaultValue;
   FDBItem.OnBeforeNewRecord:=OnBeforeNewRecord;
   FDBItem.OnBeforeEditRecord:=OnBeforeEditRecord;
   FDBItem.OnBeforeDeleteRecord:=OnBeforeDeleteRecord;
   FDBItem.OnBeforeUpdateRecord:=OnBeforeUpdateRecord;
   FDBItem.OnAfterAddRecord:=OnAfterAddRecord;
   FDBItem.OnAfterReadRecord:=OnAfterReadRecord;
   FDBItem.OnViewRecord:=OnViewRecord;
   FDBItem.OnUpdateTopInfo:=OnUpdateTopInfo;
   FDBItem.OnBuildMenu:=OnBuildMenu;
   FDBItem.OnExecAction:=OnExecAction;
   //инициализация полей
   FViewMode:=vmView;
   FDBAware:=TDBAwareList.Create;
   FFormLayout:=nil;
   FForm:=nil;
   FLayoutName:='NONE';
   FLastOrder:=0;
   FParentId:=0;
   FIsNode:=iLeaf;
   FIsOrder:=bsOrder in FDBItem.Style;
   FIsTree:=bsTree in FDBItem.Style;
   FTemplateGroup:='';
   // установка события для редактирования справочника
   TableView:=FDBItem.ViewList.ByName(CSprEditTableView);
   if TableView<>nil then begin
      TableView.OnGetCellParams:=OnGetCellParams;
   end;
   TableView:=FDBItem.ViewList.ByName(CSprSelectTableView);
   if TableView<>nil then begin
      TableView.OnGetCellParams:=OnGetCellParams;
   end;
   {+}
   TableView:=FDBItem.ViewList.ByName(CDefaultTableViewName);
   if TableView<>nil then begin
      TableView.OnGetCellParams:=OnGetCellParams;
   end;
end;

destructor TDBControl.Destroy;
var
  TableView:TTableView;
begin
   FDBAware.Free;
   //отключений событий
   FDBItem.OnOpen:=nil;
   FDBItem.OnBeforeClose:=nil;
   FDBItem.OnSetDefaultValue:=nil;
   FDBItem.OnBeforeNewRecord:=nil;
   FDBItem.OnBeforeEditRecord:=nil;
   FDBItem.OnBeforeDeleteRecord:=nil;
   FDBItem.OnBeforeUpdateRecord:=nil;
   FDBItem.OnAfterAddRecord:=nil;
   FDBItem.OnAfterReadRecord:=nil;
   FDBItem.OnViewRecord:=nil;
   FDBItem.OnUpdateTopInfo:=nil;
   FDBItem.OnBuildMenu:=nil;
   FDBItem.OnExecAction:=nil;
   // отключение события для редактирования справочника
   TableView:=FDBItem.ViewList.ByName(CSprEditTableView);
   if TableView<>nil then begin
      TableView.OnGetCellParams:=nil;
   end;
   TableView:=FDBItem.ViewList.ByName(CSprSelectTableView);
   if TableView<>nil then begin
      TableView.OnGetCellParams:=nil;
   end;
   {+}
   TableView:=FDBItem.ViewList.ByName(CDefaultTableViewName);
   if TableView<>nil then begin
      TableView.OnGetCellParams:=nil;
   end;
   //
   FDBItem.Control:=nil;
   inherited;
end;

procedure TDBControl.OnGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin

end;

function TDBControl.GetEditField(FieldName: string): TField;
begin
   //NB: ??? DBItem.FieldList.ByName(FieldName).DestField
   Result:=FDBItem.EditTable.FieldByName(FieldName);
end;

function TDBControl.GetViewField(FieldName: string): TField;
begin
   //NB: ??? DBItem.FieldList.ByName(FieldName).ViewField
   Result:=FDBItem.ViewQuery.FieldByName(FieldName);
end;

procedure TDBControl.OnAfterAddRecord(Sender: TDBItem; IsNew: Boolean);
begin
//vadim
//  ShowMessage(Sender.Name+'  '+Sender.NameFieldName+'  '+Sender.FTableName);
end;

procedure TDBControl.OnAfterReadRecord(Sender: TDBItem);
begin
end;

procedure TDBControl.OnBeforeUpdateRecord(Sender: TDBItem; IsNew: Boolean);
begin
end;

procedure TDBControl.OnBeforeClose(Sender: TDBItem);
begin
end;

function TDBControl.OnBeforeDeleteRecord(Sender: TDBItem; KeyValues: string): Boolean;
begin
   FDlgResult:=mrOk;
   Result:=True;
end;

function TDBControl.OnBeforeEditRecord(Sender: TDBItem; KeyValues: string): Boolean;
begin
   Result:=True;
end;

function TDBControl.OnBeforeNewRecord(Sender: TDBItem): Boolean;
begin
   Result:=True;
end;

procedure TDBControl.OnBuildMenu(Sender: TDBItem; Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent);
begin
end;

procedure TDBControl.OnExecAction(Sender: TDBItem);
begin
end;

function TDBControl.OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean;
begin
   Result:=False;
   if Sender=FDBItem then begin
      FViewMode:=ViewMode;
      Result:=True;
   end;
end;

procedure TDBControl.OnOpen(Sender: TDBItem);
begin
   FIsOrder:=(bsOrder in FDBItem.Style) and (FDBItem.OrderField<>nil);
   FIsTree:=(bsTree in FDBItem.Style) and (FDBItem.ParentIdField<>nil) and (FDBItem.CodeField<>nil) and (FDBItem.IsNodeField<>nil);
end;

procedure TDBControl.OnSetDefaultValue(Sender: TDBItem);
begin
end;

function TDBControl.OnUpdateTopInfo(Sender: TDBItem; RichEdit: TRichEdit; var TopInfo: string): Boolean;
begin
   Result:=False;
end;

function TDBControl.QueryIntegerValue(SQL: string; const Args: array of const; DefaultValue: Integer): Integer;
var
   Query: TAdsQuery;
begin
   Result:=DefaultValue;
   if SQL<>'' then begin
      Query:=TAdsQuery.Create(nil);
      try
         try
            Query.DatabaseName:=DBItem.DatabaseName;
            Query.SQL.Text:=Format(SQL, Args);
            Query.Open;
            Query.First;
            if not Query.Eof then begin
               Result:=Query.Fields[0].AsInteger;
            end;
         except
         end;
      finally
         Query.Free;
      end;
   end;
end;

procedure TDBControl.UpdateSpr(SprItem: TDBItem);
begin
end;

function TDBControl.GetLayout(LayoutName: string): TFormLayout;
begin
   Result:=nil;
   if LayoutName<>'' then begin
      Result:=FDBItem.LayoutList.ByName(LayoutName);
      if Result=nil then begin
         Result:=FDBItem.LayoutList.AddItem(LayoutName);
      end;
   end;
end;

function TDBControl.CanSave: Boolean;
begin
   Result:=not FDBItem.HaveStyle(bsReadOnly) and (FViewMode<>vmView);
end;

procedure TDBControl.OnEditButtonClick(Sender: TObject; var Handled: Boolean);
var
   DBEdit: TDBEditEh;
   DBLookup: TDBLookupComboboxEh;
   DBComboBox: TDBComboboxEh;
   FieldItem: TFieldItem;
   KeyValue: string;
begin
   if FForm.ActiveControl is TDBEditEh then begin
      DBEdit:=FForm.ActiveControl as TDBEditEh;
      FieldItem:=TFieldItem(DBEdit.Tag);
      if (FieldItem<>nil) and (FieldItem.LinkStyle=lsLinkSpr) and (FieldItem.LinkSpr<>nil) then begin
         KeyValue:=FieldItem.DestField.AsString;
         if SelectSprValue(FieldItem.LinkSpr, KeyValue, FieldItem.LinkSpr.CodeFieldName) then begin
            if FieldItem.CanEdit then begin
               FieldItem.DBItem.EditTable.Edit;
               FieldItem.DestField.AsString:=KeyValue;
            end;
         end;
      end;
   end
   else if FForm.ActiveControl is TDBLookupComboboxEh then begin
      DBLookup:=FForm.ActiveControl as TDBLookupComboboxEh;
      FieldItem:=FDBItem.FieldList.ByName(DBLookup.DataField);
      if FieldItem<>nil then begin
         if not FieldItem.HaveStyle(fsLookupCombo)
           then FieldItem:=FDBItem.FieldList.ByName(FieldItem.LookupFieldName);
         if (FieldItem<>nil) and (FieldItem.LinkStyle=lsLinkSpr) and (FieldItem.LinkSpr<>nil) then begin
            KeyValue:=FieldItem.DestField.AsString;
            if SelectSprValue(FieldItem.LinkSpr, KeyValue, FieldItem.LinkSpr.CodeFieldName) then begin
               if FieldItem.CanEdit then begin
//\\[2010.11.25]что бы вызывалось событие OnUpdateData
                  DBLookup.Value:=KeyValue;
//                  FieldItem.DBItem.EditTable.Edit;
//                  FieldItem.DestField.AsString:=KeyValue;
//\\
               end;
            end;
         end;
      end;
   end
   else if FForm.ActiveControl is TDBComboboxEh then begin
      DBComboBox:=FForm.ActiveControl as TDBComboboxEh;
      FieldItem:=FDBItem.FieldList.ByName(DBComboBox.DataField);
      if (FieldItem<>nil) and (FieldItem.LinkStyle=lsLinkSpr) and (FieldItem.LinkSpr<>nil) then begin
         KeyValue:=FieldItem.DestField.AsString;
         if SelectSprValue(FieldItem.LinkSpr, KeyValue, FieldItem.LinkSpr.CodeFieldName) then begin
            if FieldItem.CanEdit then begin
               FieldItem.DBItem.EditTable.Edit;
               FieldItem.DestField.AsString:=KeyValue;
            end;
         end;
      end;
   end;
   Handled:=True;
end;

procedure TDBControl.OnGridButtonClick(Sender: TObject; var Handled: Boolean);
var
   Grid: TDBGridEh;
   ColView: TColView;
   KeyValue: string;
   FieldItem: TFieldItem;
begin
   Grid:=TDBGridEh(FForm.ActiveControl);
   ColView:=TColView(Grid.Columns[Grid.SelectedIndex].Tag);
   FieldItem:=ColView.FieldItem;
   if (ColView.LinkStyle=lsLinkSpr) and (ColView.LinkSpr<>nil) and (FieldItem<>nil) then begin
      KeyValue:=FieldItem.DestField.AsString;
      if SelectSprValue(ColView.LinkSpr, KeyValue, ColView.LinkSpr.CodeFieldName) then begin
         if FieldItem.CanEdit then begin
            FieldItem.DBItem.EditTable.Edit;
            FieldItem.DestField.AsString:=KeyValue;
         end;
      end;
   end;
   Handled:=True;
end;

function TDBControl.Edit(Form: TForm): Boolean;
var
   Res: Integer;
begin
   Result:=False;
   FForm:=Form;
   try
      DoLoadLayout;
      DoSetControl;
      DoSetControlPosition;
      DoInvokeControlEvent;
      DoUpdateEnabledAction;
      DoSetControlEvent;
      //DoLoadLayout;
      DoClearModified;
      Res:=FForm.ShowModal;
      if (Res=mrOk) and CanSave then begin
         // NB: ??? а если только список отредактировать
         FDBItem.CheckEditMode;
         Result:=True;
      end;
      DoSaveLayout;
   finally
      DoClearControlEvent;
      DoResetControl;
      FForm:=nil;
      FOnSetControl:=nil;
      FOnResetControl:=nil;
      FOnSetControlEvent:=nil;
      FOnClearControlEvent:=nil;
      FOnInvokeControlEvent:=nil;
      FOnUpdateEnabledAction:=nil;
      FOnSetControlPosition:=nil;
      FOnClearModified:=nil;
      FOnSaveLayout:=nil;
      FOnLoadLayout:=nil;
   end;
end;

procedure TDBControl.DoClearControlEvent;
begin
   if Assigned(FOnClearControlEvent) then begin
      FOnClearControlEvent;
   end;
end;

procedure TDBControl.DoClearModified;
begin
   FDBItem.ClearModified;
   if Assigned(FOnClearModified) then begin
      FOnClearModified;
   end;
end;

procedure TDBControl.DoInvokeControlEvent;
begin
   if Assigned(FOnInvokeControlEvent) then begin
      FOnInvokeControlEvent;
   end;
end;

procedure TDBControl.DoLoadLayout;
begin
   FFormLayout:=GetLayout(FLayoutName);
   if FFormLayout<>nil then begin
      if FFormLayout.IsEmpty then begin
         FFormLayout.SetForm(FForm);
      end
      else begin
         FFormLayout.GetForm(FForm);
      end;
      if Assigned(FOnLoadLayout) then begin
         FOnLoadLayout;
      end;
   end;
end;

procedure TDBControl.DoResetControl;
begin
   if Assigned(FOnResetControl) then begin
      FOnResetControl;
   end;
   //NB: ??? очистка DataSource - замедлит или нет ???
   FDBAware.ClearControlList;
end;

procedure TDBControl.DoSaveLayout;
begin
   if FFormLayout<>nil then begin
      FFormLayout.SetForm(FForm);
      if Assigned(FOnSaveLayout) then begin
         FOnSaveLayout;
      end;
   end;
end;

procedure TDBControl.DoSetControl;
begin
   if FForm<>nil then begin
      // автоматическое создание элементов редактирования
      DoAutoCreateControl;
      // связь элементом редактированя формы с полями документа
      FDBAware.BuildControlList(FDBItem, FForm);
      FDBAware.ConfigControlList(FViewMode, OnEditButtonClick, OnGridButtonClick, OnEnter);
      //FDBAware.SetReadOnly(FDBItem.HaveStyle(bsReadOnly));
      // установка фокуса на первый элемент управления
      FDBAware.SetFirstEditableFocus(FForm);
   end;
   if Assigned(FOnSetControl) then begin
      FOnSetControl;
   end;
end;

procedure TDBControl.DoSetControlEvent;
begin
   if Assigned(FOnSetControlEvent) then begin
      FOnSetControlEvent;
   end;
end;

procedure TDBControl.DoSetControlPosition;
begin
   if Assigned(FOnSetControlPosition) then begin
      FOnSetControlPosition;
   end;
end;

procedure TDBControl.DoUpdateEnabledAction;
begin
   if Assigned(FOnUpdateEnabledAction) then begin
      FOnUpdateEnabledAction;
   end;
end;

function TDBControl.DetailAdd: Boolean;
begin
   Result:=False;
   if OnBeforeNewRecord(FDBItem) then begin
      FDBItem.EditTable.Append;
      OnSetDefaultValue(FDBItem);
      if FDBItem.DoViewRecord(vmAdd) then begin
         Result:=True;
      end                           
      else begin
         FDBItem.EditTable.Cancel;
      end;
   end;
end;

function TDBControl.DetailDelete: Boolean;
begin
   Result:=False;
   if (FDBItem<>nil) and (not FDBItem.HaveStyle(bsConfirmDelete)) or
      (MessageDlgR('Удалить текущую запись?', mtConfirmation, [mbYes, mbNo], 0)=mrYes)
   then begin
      FDBItem.EditTable.Delete;
      Result:=True;
   end;
end;

procedure TDBControl.DetailDown;
begin
   FDBItem.EditRecordDown;
end;

function TDBControl.DetailEdit: Boolean;
begin
   Result:=False;
   FDBItem.EditTable.CheckBrowseMode;
   if CanSave then begin
      FDBItem.EditTable.Edit; //NB: ???
   end;
   if FDBItem.DoViewRecord(vmEdit {FViewMode}) then begin   //  vadim 28.11.2016
      Result:=True;
   end         
   else begin
      FDBItem.EditTable.Cancel;
   end;
end;

procedure TDBControl.DetailUp;
begin
   FDBItem.EditRecordUp
end;

procedure TDBControl.QueryStringList(SQL: string; const Args: array of const; sl: TStrings);
var
   Query: TAdsQuery;
begin
   Query:=TAdsQuery.Create(nil);
   try
      try
         Query.DatabaseName:=DBItem.DatabaseName;
         Query.SQL.Text:=Format(SQL, Args);
         Query.Open;
         Query.First;
         while not Query.Eof do begin
            sl.Add(Query.Fields[0].AsString);
            Query.Next;
         end;
      except
      end;
   finally
      Query.Free;
   end;
end;

function GetAveCharSize(Canvas: TCanvas): TPoint;
var
   I: Integer;
   tm: TEXTMETRIC;
   Buffer: array[0..65] of Char;
begin
   for I:=0 to 47 do begin
      Buffer[I]:=Chr(I+Ord('А'));
   end;
   for I:=0 to 15 do begin
      Buffer[I+48]:=Chr(I+Ord('р'));
   end;
   GetTextExtentPoint(Canvas.Handle, Buffer, 64, TSize(Result));
   Result.X:=((Result.X div 32)+1) div 2;
   GetTextMetrics(Canvas.Handle, tm);
   Result.Y:=tm.tmHeight;
end;

procedure TDBControl.DoAutoCreateControl;
var
   I: Integer;
   TableView: TTableView;
   ColView: TColView;
   FieldItem: TFieldItem;
   laField: TLabel;
   edText: TDBEditEh;
   edDate: TDBDateTimeEditEh;
   edNumber: TDBNumberEditEh;
   dcText: TDBComboboxEh;
   dlText: TDBLookupComboboxEh;
   chbBool: TDBCheckBoxEh;
   // массив редактируемых полей
   FieldArr: array of TFieldItem;
   // максимальная ширина надписи
   MaxCaptionWidth: Integer;
   // максимальная ширина элемента редактирования
   MaxFieldWidth: Integer;
   // количество редактируемых полей
   FieldCount: Integer;
   // количество строк (линий) необходимых для отображения редактируемых полей
   RowCount: Integer;
   // текущая строка
   CurRow: Integer;
   // средний размер символа
   CharSize: TPoint;
   // выпадающий список
   PickList: TStringList;
   // максимальное количество строк в выпадающем списке
   MaxDropDownRows: Integer;
   // общая высота формы
   H: Integer;
   // высота отступа от края формы первого и последнего элементов редактирования
   H1: Integer;
   // базовая высота элемента редактирования
   H2: Integer;
   // расстояние между соседними элементами редактирования по высоте
   H3: Integer;
   // высота области для кнопок
   H4: Integer;
   // базовая высота надписи элемента редактирования
   H5: Integer;
   // расстояние между надписью и элементом редактирования по высоте
   H6: Integer;
   // высота кнопок
   H7: Integer;
   // раcстояние между кнопками краями области для кнопок по высоте
   H8: Integer;
   // высота TDBCheckBoxEh
   H9: Integer;
   // расстояние между TDBCheckBoxEh и границей области для полноразмерного
   // элемента редактирования по высоте
   H10: Integer;
   // общая ширина формы
   W: Integer;
   // ширина отступа от края формы элементов редактирования
   W1: Integer;
   // базовая ширина области для надписей
   W2: Integer;
   // расстояние между базовой областью для надписей и элементов редактирования по ширине
   W3: Integer;
   // базовая ширина области для элементов редактирования
   W4: Integer;
   // ширина кнопок
   W5: Integer;
   // расстояние между кнопками по ширине
   W6: Integer;
   // ширина эдемента редактирования TDBDateTimeEditEh
   W7: Integer;

   // количество строк необходимых для редактирования поля
   function GetFieldRow: Integer;
   begin
      Result:=1;
      if (ColView<>nil) and (ColView.RowNum<>0) then begin
         Result:=ColView.RowNum;
      end;
   end;

   // ширина поля для редактирования
   function GetFieldWidth: Integer;
   begin
      //ColView.Width
      //ColView.Column.Width
      //FieldItem.Size
      if (ColView<>nil) and (ColView.Width<>0) then begin
         Result:=ColView.Width;
      end
      else begin
         Result:=FieldItem.DestField.Size*CharSize.X;
      end;
      Result:=Min(Result, W4);
   end;

   // максимальная ширина списка значений
   function GetPickListWidth(sl: TStringList): Integer;
   var
      I: Integer;
   begin
      Result:=0;
      for I:=0 to Pred(sl.Count) do begin
         Result:=Max(FForm.Canvas.TextWidth(sl[I]), Result);
      end;
      Result:=Result;
   end;

   function CountFieldWidth: Integer;
   begin
      Result:=MulDiv(80, Screen.PixelsPerInch, 96);
      if FieldItem.HaveStyle(fsLookup) then begin
         //NB: !!! ширина
      end
      else if FieldItem.SelectValueStyle=ssPickList then begin
         PickList:=nil;
         case FieldItem.LinkStyle of
            lsLinkSpr: if (FieldItem.LinkSpr<>nil) and FieldItem.LinkSpr.HaveStyle(bsPickList) then begin
               PickList:=FieldItem.LinkSpr.GetPickList;
            end;
            lsLinkEnum: if FieldItem.LinkEnum<>nil then begin
               PickList:=FieldItem.LinkEnum.PickList;
            end;
            lsOwnPickList: begin
               // NB: не совсем понимаю что здесь должно быть, видимо надо доделать TFieldItem
            end;
         end;
         if PickList<>nil then begin
            Result:=GetPickListWidth(PickList)+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXBORDER);
         end;
      end
      else if FieldItem.SelectValueStyle=ssShowWindow then begin
         //NB: !!! ширина
      end
      else begin
         case FieldItem.DataKind of
            //4.2.1. строка
            dkString: begin
               if (ColView<>nil) and (ColView.Width<>0) then begin
                  Result:=ColView.Width;
               end
               else begin
                  Result:=FieldItem.DestField.Size*CharSize.X;
               end;
            end;
            //4.2.2. логическое
            dkBoolean: begin
               //NB: !!! ширина
            end;
            //4.2.3. дата
            dkDate: begin
               //NB: !!! ширина
            end;
            //4.2.4. число
            dkNumber,
            // дробное число
            dkFloat: begin
               //NB: !!! ширина
            end;
         end;
      end;
   end;

begin
   //NB: для использования текущей ширины колонок надо брать другое представление
   //    FDBItem.ViewList.ByName(CSprEditTableView или CSprSelectTableView)
   TableView:=FDBItem.TableView;
   if (TableView<>nil) and TableView.HaveStyle(tsAutoCreateControl) then begin
      // вычисляем средний размер символа
      CharSize:=GetAveCharSize(FForm.Canvas);
      //1. формируем массив редактируемых полей
      SetLength(FieldArr, FDBItem.FieldList.Count);
      MaxCaptionWidth:=0;
      MaxFieldWidth:=0;
      FieldCount:=0;
      RowCount:=0;
      for I:=0 to Pred(FDBItem.FieldList.Count) do begin
         FieldItem:=FDBItem.FieldList[I];
         if (FieldItem<>nil) and
            FieldItem.HaveStyle(fsEditVisible) and
            (FieldItem.FieldName<>'') and
            // исключаем поля, которые не нужны при редактировании папки
            not (FieldItem.HaveStyle(fsNotForFolder) and (FIsNode=iNode))
         then begin
            FieldArr[FieldCount]:=FieldItem;
            Inc(FieldCount);
            ColView:=FDBItem.TableView.ByFieldItem(FieldItem);
            // вычисляем максимальное количество строк
            Inc(RowCount, GetFieldRow);
            // вычисление максимальной ширины надписи
            MaxCaptionWidth:=Max(MaxCaptionWidth, FForm.Canvas.TextWidth(FieldItem.Caption));
            // вычисление максимальной ширины элемента редактирования
            MaxFieldWidth:=Max(MaxFieldWidth, CountFieldWidth);
         end;
      end;
      //2. расчет констант для размещения элементов редактирования на форме
      //2.1. константы по высоте
      H1:=MulDiv(10, Screen.PixelsPerInch, 96);
      H2:=MulDiv(21, Screen.PixelsPerInch, 96);
      H3:=MulDiv(5, Screen.PixelsPerInch, 96);  // 3->5 vadim
      H4:=MulDiv(33, Screen.PixelsPerInch, 96);
      H5:=MulDiv(13, Screen.PixelsPerInch, 96);
      H6:=(H2-H5) div 2;
      H7:=MulDiv(23, Screen.PixelsPerInch, 96);
      H8:=(H4-H7) div 2;
      H9:=MulDiv(17, Screen.PixelsPerInch, 96);
      H10:=(H2-H9) div 2;
      H:=H2*RowCount+H3*Pred(RowCount)+2*H1+H4;{H:=H2*FieldCount+H3*Pred(FieldCount)+2*H1+H4;}
      //NB: !!! необходимо контролировать максимальную высоту
      //2.2. константы по ширине
      W1:=H1;
      W3:=W1;
      if TableView.FormWidth<>0 then begin
         W:=TableView.FormWidth;
      end
      else begin
         W:=Min(MaxCaptionWidth+MaxFieldWidth+2*W1+W3, MulDiv(780, Screen.PixelsPerInch, 96));
      end;
      W2:=Min(MaxCaptionWidth, (W-2*W1-W3) div 2);
      W4:=W-2*W1-W3-W2;
      W5:=MulDiv(75, Screen.PixelsPerInch, 96);
      W6:=W1;
      W7:=MulDiv(120, Screen.PixelsPerInch, 96);
      //3. изменение размеров формы
      FForm.ClientWidth:=W;
      FForm.ClientHeight:=H;
      //4. расставляем надписи и элементы редактирования по форме
      CurRow:=0;
      for I:=0 to Pred(FieldCount) do begin
         FieldItem:=FieldArr[I];
         ColView:=FDBItem.TableView.ByFieldItem(FieldItem);
         MaxDropDownRows:=CMaxDropDownRows;
         if (ColView<>nil) and (ColView.MaxDropDownRows<>0) then begin
            MaxDropDownRows:=ColView.MaxDropDownRows;
         end;
         //4.1. надпись
         laField:=TLabel.Create(FForm);
         laField.Parent:=FForm;
         laField.Top:=H1+(H2+H3)*CurRow{I}+H6;
         laField.Left:=W1;
         laField.Caption:=FieldItem.Caption;
         // если значение поля не может быть пустым
         if FieldItem.HaveStyle(fsNotNull) and not FieldItem.HaveStyle(fsReadOnly) then begin
            laField.Font.Color:=clHighlight;
         end;
         //4.2. элемент редактирования
         if FieldItem.HaveStyle(fsLookup) then begin
            dlText:=TDBLookupComboboxEh.Create(FForm);
            dlText.Parent:=FForm;
            dlText.Top:=H1+(H2+H3)*CurRow{I};
            dlText.Left:=W1+W2+W3;
            dlText.DataField:=FieldItem.FieldName;
            if FieldItem.SelectValueStyle=ssShowWindow then begin
               dlText.EditButtons.Add.Style:=ebsEllipsisEh;
            end;
            //NB: !!! ширина
         end
         else if FieldItem.SelectValueStyle=ssPickList then begin
            dcText:=TDBComboboxEh.Create(FForm);
            dcText.Parent:=FForm;
            dcText.Top:=H1+(H2+H3)*CurRow{I};
            dcText.Left:=W1+W2+W3;
            dcText.DataField:=FieldItem.FieldName;
            // определяем максимальную ширину и количество строк выпадающего списка
            PickList:=nil;
            case FieldItem.LinkStyle of
               lsLinkSpr: if (FieldItem.LinkSpr<>nil) and FieldItem.LinkSpr.HaveStyle(bsPickList) then begin
                  PickList:=FieldItem.LinkSpr.GetPickList;
               end;
               lsLinkEnum: if FieldItem.LinkEnum<>nil then begin
                  PickList:=FieldItem.LinkEnum.PickList;
               end;
               lsOwnPickList: begin
                  // NB: не совсем понимаю что здесь должно быть, видимо надо доделать TFieldItem
               end;
            end;
            if PickList<>nil then begin
               dcText.ClientWidth:=GetPickListWidth(PickList)+GetSystemMetrics(SM_CXVSCROLL)++2*GetSystemMetrics(SM_CXBORDER);
               if dcText.Width>W4 then begin
                  dcText.Width:=W4;
               end;
               dcText.DropDownBox.Rows:=Min(PickList.Count, MaxDropDownRows);
            end;
         end
         else if FieldItem.SelectValueStyle=ssShowWindow then begin
            edText:=TDBEditEh.Create(FForm);
            edText.Parent:=FForm;
            edText.Top:=H1+(H2+H3)*CurRow{I};
            edText.Left:=W1+W2+W3;
            edText.DataField:=FieldItem.FieldName;
            edText.EditButtons.Add.Style:=ebsEllipsisEh;
            //NB: !!! ширина
         end
         else begin
            case FieldItem.DataKind of
               //4.2.1. строка
               dkString: begin
                  edText:=TDBEditEh.Create(FForm);
                  edText.Parent:=FForm;
                  edText.Top:=H1+(H2+H3)*CurRow{I};
                  edText.Left:=W1+W2+W3;
                  edText.Width:=GetFieldWidth;
                  if GetFieldRow>1 then begin
                     edText.AutoSize:=False;
                     edText.WordWrap:=True;
                  end;
                  edText.Height:=H2*GetFieldRow+H3*Pred(GetFieldRow);
                  edText.DataField:=FieldItem.FieldName;
               end;
               //4.2.2. логическое
               dkBoolean: begin
                  chbBool:=TDBCheckBoxEh.Create(FForm);
                  chbBool.Parent:=FForm;
                  chbBool.Top:=H1+(H2+H3)*CurRow{I}+H10;
                  chbBool.Left:=W1+W2+W3;
                  chbBool.Width:=GetSystemMetrics(SM_CXVSCROLL);
                  chbBool.DataField:=FieldItem.FieldName;
               end;
               //4.2.3. дата
               dkDate: begin
                  edDate:=TDBDateTimeEditEh.Create(FForm);
                  edDate.Parent:=FForm;
                  edDate.Top:=H1+(H2+H3)*CurRow{I};
                  edDate.Left:=W1+W2+W3;
                  edDate.Width:=W7;
                  edDate.DataField:=FieldItem.FieldName;
               end;
               //4.2.4. число
               dkNumber,
               // дробное число
               dkFloat: begin
                  edNumber:=TDBNumberEditEh.Create(FForm);
                  edNumber.Parent:=FForm;
                  edNumber.Top:=H1+(H2+H3)*CurRow{I};
                  edNumber.Left:=W1+W2+W3;
                  edNumber.DataField:=FieldItem.FieldName;
                  //NB: !!! ширина
               end;
            end;
         end;
         // вычисляем текущую строку
         Inc(CurRow, GetFieldRow);
      end;
   end;
end;

function TDBControl.OnFormCloseQuery(Sender: TDBItem): Boolean;
var
   I: Integer;
   FieldItem: TFieldItem;
   S: string;
   fSave: Boolean;
begin
   Result:=True;
   fSave:=(FForm.ModalResult=mrOk) and not DBItem.HaveStyle(bsReadOnly) and (ViewMode<>vmView);
   // вместо вызова CheckEditMode
   FForm.Perform(WM_NEXTDLGCTL, 0, 0);
   //если были изменения данных, то запрашиваем подтверждение для закрытия документа
   if FForm.ModalResult<>mrOk then begin
      if DBItem.HaveStyle(bsConfirmSave) and
         not DBItem.HaveStyle(bsReadOnly) and
         (ViewMode<>vmView)
      then begin
         // вместо вызова CheckEditMode
         //FForm.Perform(WM_NEXTDLGCTL, 0, 0); //--FDoc.DBItem.CheckEditMode;
         if DBItem.IsDataModified then begin
            case MessageDlgR('Сохранить изменения в документе?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
               mrYes: fSave:=True;
               mrNo:;
               mrCancel: Result:=False;
            end;
         end;
      end;
   end;
   // перед сохранением проверяем заполнены ли все обязательные поля
   if fSave then begin
      S:='';
      for I:=0 to Pred(DBItem.FieldList.Count) do begin
         FieldItem:=DBItem.FieldList[I];
         if FieldItem.HaveStyle(fsNotNull) and
            (FieldItem.DestField.IsNull or (Trim(FieldItem.DestField.AsString)='')) and
            not (FieldItem.HaveStyle(fsNotForFolder) and (FIsNode=iNode))
         then begin
            S:=S+#13#10+' "'+FieldItem.Caption+'"';
         end;
      end;
      if S<>'' then begin
         MessageDlgR(Format('Необходимо ввести значения реквизитов, обязательных для заполнения:%s', [S]), mtWarning, [mbOk], 0);
         Result:=False;
      end
      else begin
         FForm.ModalResult:=mrOk;
      end;
   end;
end;

function TDBControl.GetTableField(FieldName: string): TField;
begin
   //NB: ??? DBItem.FieldList.ByName(FieldName).SrcField
   Result:=FDBItem.Table.FieldByName(FieldName);
end;

procedure TDBControl.OnEnter(Sender: TObject; FieldItem: TFieldItem);
begin
end;

procedure TDBControl.QueryStringLists(SQL: string; const Args: array of const; KeyList, PickList: TStrings);
var
   Query: TAdsQuery;
begin
   Query:=TAdsQuery.Create(nil);
   try
      try
         Query.DatabaseName:=DBItem.DatabaseName;
         Query.SQL.Text:=Format(SQL, Args);
         Query.Open;
         Query.First;
         while not Query.Eof do begin
            KeyList.Add(Query.Fields[0].AsString);
            PickList.Add(Query.Fields[1].AsString);
            Query.Next;
         end;
      except
      end;
   finally
      Query.Free;
   end;
end;

procedure TDBControl.DoTemplate(Template: TTemplate);
begin

end;

procedure TDBControl.OnTemplateMenuClick(Sender: TObject);
var
   Template: TTemplate;
begin
   if (Sender<>nil) and (Sender is TComponent) then begin
      Template:=TTemplate(TComponent(Sender).Tag);
      DoTemplate(Template);
   end;
end;

function TDBControl.AddInTemplateMenu(Template: TTemplate): Boolean;
begin
   Result:=(Template<>nil) and (AnsiCompareText(FTemplateGroup, Template.Group)=0);
end;

{ TDBGridLink }

procedure TDBGridLink.Clear;
begin
   UpdateAndClearTableView(FDBItem);
   if FClearDblClickEvent then begin
      FClearDblClickEvent:=False;
      FGrid.OnDblClick:=nil;
   end;
end;

procedure TDBGridLink.Config(ViewMode: TViewMode;OnButtonClick: TButtonClickEventEh; OnEnter: TOnEnterFieldEvent);
var
   CanEdit: Boolean;
begin
   //NB: FDBItem.CanEdit не подходит
   CanEdit:=(FDBItem.Control<>nil) and (not FDBItem.HaveStyle(bsReadOnly));
   SetReadOnly((ViewMode=vmView) or not CanEdit);
   //NB: !!!!!!!!!!!!!!!!!!!!!!! надо переделать !!!!!!!!!!!!!!!!!!!!!!!
   //    что бы клонировалось описание, но не надо было бы его сохранять
   if GetReadOnly then begin
      FDBItem.TableView.IncludeStyle(tsReadOnly);
   end
   else begin
      FDBItem.TableView.ExcludeStyle(tsReadOnly);
   end;
   FDBItem.TableView.SetColView(FGrid, FDBItem.TableView.DefaultDrawCell, OnButtonClick, True);
   if not Assigned(FGrid.OnDblClick) then begin
      FClearDblClickEvent:=True;
      FGrid.OnDblClick:=OnDblClick;
   end;
end;

constructor TDBGridLink.Create(DBGrid: TDBGridEh; TableItem: TDBItem);
begin
   FOwner:=nil;
   FGrid:=DBGrid;
   FFieldItem:=nil;
   FDBItem:=TableItem;
   FClearDblClickEvent:=False;
end;

function TDBGridLink.GetReadOnly: Boolean;
begin
   Result:=FGrid.ReadOnly;
end;

procedure TDBGridLink.OnDblClick(Sender: TObject);
var
   pt: TPoint;
   gc: TGridCoord;
begin
   GetCursorPos(pt);
   pt:=FGrid.ScreenToClient(pt);
   gc:=FGrid.MouseCoord(pt.x, pt.y);
   if (gc.x<>-1) and (gc.y<>-1) and (FDBItem.Control<>nil) then begin
      FDBItem.Control.DetailEdit;
   end;
end;

procedure TDBGridLink.SetReadOnly(Value: Boolean);
begin
   FGrid.ReadOnly:=Value;
   if Value then begin
      FGrid.Color:=Owner.ReadOnlyBg;
   end
   else begin
      FGrid.Color:=Owner.WriteOnlyBg;
   end;
end;

function TDBGridLink.TestControl(Control: TControl): Boolean;
begin
   Result:=FGrid=Control;
end;

end.
