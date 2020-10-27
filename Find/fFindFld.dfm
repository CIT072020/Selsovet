object fmFindFld: TfmFindFld
  Left = 212
  Top = 106
  Width = 566
  Height = 415
  Anchors = [akRight, akBottom]
  Caption = 'Настройки полей для поиска'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbTables: TLabel
    Left = 8
    Top = 12
    Width = 43
    Height = 13
    Caption = 'Таблица'
  end
  object lbGroup: TLabel
    Left = 8
    Top = 40
    Width = 35
    Height = 13
    Caption = 'Группа'
  end
  object btOk: TButton
    Left = 399
    Top = 361
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'ОК'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btCancel: TButton
    Left = 482
    Top = 361
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Отмена'
    ModalResult = 2
    TabOrder = 1
  end
  object dgFields: TDBGridEh
    Left = 5
    Top = 71
    Width = 548
    Height = 280
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsoFields
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnGetCellParams = dgFieldsGetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Order'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'Visible'
        Footers = <>
        Width = 56
      end
      item
        Color = clInfoBk
        EditButtons = <>
        FieldName = 'Owner'
        Footers = <>
        ReadOnly = True
        Width = 107
      end
      item
        Color = clInfoBk
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
        ReadOnly = True
        Width = 127
      end
      item
        EditButtons = <>
        FieldName = 'RealName'
        Footers = <>
        Width = 104
      end
      item
        EditButtons = <>
        FieldName = 'Alias'
        Footers = <>
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'Caption'
        Footers = <>
        Width = 159
      end
      item
        EditButtons = <>
        FieldName = 'AddCaption'
        Footers = <>
        Width = 130
      end
      item
        EditButtons = <>
        FieldName = 'Group'
        Footers = <>
        Width = 140
      end
      item
        EditButtons = <>
        FieldName = 'Kinds'
        Footers = <>
        KeyList.Strings = (
          'ffkString'
          'ffkBoolean'
          'ffkNumber'
          'ffkFloat'
          'ffkDate'
          'ffkList')
        PickList.Strings = (
          'строка'
          'логическое'
          'число'
          'дробное число'
          'дата'
          'список')
        Width = 89
      end
      item
        EditButtons = <>
        FieldName = 'DefaultOp'
        Footers = <>
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'KindSpr'
        Footers = <>
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'SprEditKind'
        Footers = <>
        KeyList.Strings = (
          'sekDefault'
          'sekCheckList'
          'sekGrid'
          'sekComboBox'
          'sekLookup')
        PickList.Strings = (
          'по умолчанию'
          'CheckListBox'
          'DBGrid'
          'ComboBox'
          'DBLookupComboBox')
        Width = 98
      end
      item
        EditButtons = <>
        FieldName = 'SprName'
        Footers = <>
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'KindRel'
        Footers = <>
        KeyList.Strings = (
          'ffkProp'
          'ffkRel')
        PickList.Strings = (
          'свойство'
          'отношение')
      end
      item
        EditButtons = <>
        FieldName = 'RelName'
        Footers = <>
        Width = 94
      end
      item
        EditButtons = <>
        FieldName = 'CaseSensitive'
        Footers = <>
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'IsUpper'
        Footers = <>
        Width = 124
      end>
  end
  object chbUpdate: TCheckBox
    Left = 8
    Top = 360
    Width = 225
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'сохранить изменения в файле'
    TabOrder = 3
  end
  object cbTables: TComboBox
    Left = 80
    Top = 9
    Width = 337
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
    OnChange = cbTablesChange
  end
  object cbGroups: TComboBox
    Left = 80
    Top = 36
    Width = 337
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
    OnChange = cbGroupsChange
  end
  object btRenameGroup: TButton
    Left = 429
    Top = 35
    Width = 108
    Height = 23
    Caption = 'Переименовать...'
    TabOrder = 6
    OnClick = btRenameGroupClick
  end
  object dsFields: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.08b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    OnFilterRecord = dsFieldsFilterRecord
    Left = 40
    Top = 280
    object dsFieldsName: TStringField
      DisplayLabel = 'Код'
      FieldName = 'Name'
      Size = 100
    end
    object dsFieldsRealName: TStringField
      DisplayLabel = 'Имя'
      FieldName = 'RealName'
      Size = 100
    end
    object dsFieldsCaption: TStringField
      DisplayLabel = 'Заголовок'
      FieldName = 'Caption'
      Size = 300
    end
    object dsFieldsAddCaption: TStringField
      DisplayLabel = 'Заголовок 2'
      FieldName = 'AddCaption'
      Size = 300
    end
    object dsFieldsAlias: TStringField
      DisplayLabel = 'Алиас таблицы'
      FieldName = 'Alias'
      Size = 30
    end
    object dsFieldsKindSpr: TBooleanField
      DisplayLabel = 'Справочник'
      FieldName = 'KindSpr'
    end
    object dsFieldsVisible: TBooleanField
      DisplayLabel = 'Видимый'
      FieldName = 'Visible'
    end
    object dsFieldsCaseSensitive: TBooleanField
      DisplayLabel = 'Важен регистр'
      FieldName = 'CaseSensitive'
    end
    object dsFieldsIsUpper: TBooleanField
      DisplayLabel = 'Верхний регистр'
      FieldName = 'IsUpper'
    end
    object dsFieldsSprName: TStringField
      DisplayLabel = 'Справочник'
      FieldName = 'SprName'
      Size = 50
    end
    object dsFieldsOwner: TStringField
      DisplayLabel = 'Хозяин'
      FieldName = 'Owner'
      Size = 100
    end
    object dsFieldsOrder: TIntegerField
      DisplayLabel = 'Порядок'
      FieldName = 'Order'
    end
    object dsFieldsGroup: TStringField
      DisplayLabel = 'Группа'
      FieldName = 'Group'
      Size = 300
    end
    object dsFieldsDefaultOp: TStringField
      DisplayLabel = 'Операция'
      FieldName = 'DefaultOp'
      Size = 50
    end
    object dsFieldsRelName: TStringField
      DisplayLabel = 'Отношение'
      FieldName = 'RelName'
      Size = 50
    end
    object dsFieldsSprEditKind: TStringField
      DisplayLabel = 'Вид справочника'
      FieldName = 'SprEditKind'
      Size = 50
    end
    object dsFieldsKindRel: TStringField
      DisplayLabel = 'Отношение'
      FieldName = 'KindRel'
      Size = 30
    end
    object dsFieldsKinds: TStringField
      DisplayLabel = 'Тип'
      FieldName = 'Kinds'
      Size = 50
    end
    object dsFieldsPath: TStringField
      FieldName = 'Path'
      Size = 300
    end
  end
  object dsoFields: TDataSource
    DataSet = dsFields
    Left = 88
    Top = 280
  end
end
