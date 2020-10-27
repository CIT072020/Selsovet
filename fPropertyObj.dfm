object fmPropertyObj: TfmPropertyObj
  Left = 368
  Top = 189
  Width = 933
  Height = 482
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1086#1073#1098#1077#1082#1090#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 0
    Top = 256
    Width = 925
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 925
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      FullSize = True
      Images = fmMain.ImageList
      TabOrder = 0
      object TBItemSave: TTBItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '
        ImageIndex = 36
        OnClick = TBItemSaveClick
      end
      object TBItemExit: TTBItem
        Caption = #1042#1099#1093#1086#1076
        Hint = #1042#1099#1093#1086#1076' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
        ImageIndex = 37
        OnClick = TBItemExitClick
      end
      object TBItem1: TTBItem
        Caption = 'Save to MemTables'
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' MemTables'
        ImageIndex = 26
        Visible = False
        OnClick = TBItem1Click
      end
      object TBItem2: TTBItem
        Caption = 'Load from MemTables'
        Hint = 'Load from MemTables'
        ImageIndex = 40
        Visible = False
        OnClick = TBItem2Click
      end
      object TBItemSaveToSysSpr: TTBItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1089#1080#1089#1090#1077#1084#1085#1099#1081' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
        ImageIndex = 26
        OnClick = TBItemSaveToSysSprClick
      end
    end
  end
  object GridRazdel: TSasaDBGrid
    Left = 0
    Top = 26
    Width = 925
    Height = 230
    Align = alTop
    Ctl3D = True
    DataSource = dsRazdel
    DrawMemoText = True
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    EnterDirection = mdNextGraph
    OptionsS = [dgsSelectCurrentColor]
    SelRowColor = clAqua
    Color1 = clBlack
    Color2 = clBlack
    TypeSave = 0
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Width = 30
      end
      item
        EditButtons = <>
        FieldName = 'TYPEOBJ'
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072
        Width = 99
      end
      item
        EditButtons = <>
        FieldName = 'NOMER'
        Footers = <>
        Title.Caption = #1056#1072#1079#1076#1077#1083'|'#1053#1086#1084#1077#1088
        Width = 41
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1056#1072#1079#1076#1077#1083'|'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 151
      end
      item
        EditButtons = <>
        FieldName = 'FNAME'
        Footers = <>
        Title.Caption = #1056#1072#1079#1076#1077#1083'|'#1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 243
      end
      item
        EditButtons = <>
        FieldName = 'VISIBLE'
        Footers = <>
        Title.Caption = #1056#1072#1079#1076#1077#1083'|'#1042#1080#1076#1080#1084#1086#1089#1090#1100
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'ENABLED'
        Footers = <>
        Title.Caption = #1056#1072#1079#1076#1077#1083'|'#1044#1086#1089#1090#1091#1087#1085#1086#1089#1090#1100
        Width = 71
      end
      item
        EditButtons = <>
        FieldName = 'USER'
        Footers = <>
        Title.Caption = #1056#1072#1079#1076#1077#1083'|'#1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
        Width = 179
      end>
  end
  object GridProperty: TDBGridEh
    Left = 0
    Top = 259
    Width = 925
    Height = 189
    Align = alClient
    DataSource = dsProperty
    Flat = True
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
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Visible = False
        Width = 41
      end
      item
        EditButtons = <>
        FieldName = 'TYPEOBJ'
        Footers = <>
        Visible = False
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'RAZDEL'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'NOMER'
        Footers = <>
        Title.Caption = #8470
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'KOD'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Width = 101
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 140
      end
      item
        EditButtons = <>
        FieldName = 'FNAME'
        Footers = <>
        Title.Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 199
      end
      item
        EditButtons = <>
        FieldName = 'TIP'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Width = 72
      end
      item
        Alignment = taLeftJustify
        EditButtons = <>
        FieldName = 'VID'
        Footers = <>
        Title.Caption = #1042#1080#1076
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'UROV'
        Footers = <>
        KeyList.Strings = (
          '1'
          '2'
          '3'
          '4')
        PickList.Strings = (
          #1050#1086#1088#1077#1085#1100
          #1044#1086#1073#1072#1074#1080#1090#1100
          #1055#1088#1077#1076#1099#1076'.'
          #1053#1086#1074#1099#1081'+')
        Title.Caption = #1060#1080#1083#1100#1090#1088'|'#1059#1088'.'
        Width = 48
      end
      item
        EditButtons = <>
        FieldName = 'NAME_FLT'
        Footers = <>
        Title.Caption = #1060#1080#1083#1100#1090#1088'|'#1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1083#1103
        Width = 169
      end
      item
        EditButtons = <>
        FieldName = 'ADD_FLT'
        Footers = <>
        Title.Caption = #1060#1080#1083#1100#1090#1088'|'#1044#1086#1087#1086#1083#1085'. '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 140
      end
      item
        EditButtons = <>
        FieldName = 'DEFAULT_OP'
        Footers = <>
        Title.Caption = #1060#1080#1083#1100#1090#1088'|'#1054#1087#1077#1088#1072#1094#1080#1103' '#1087#1086' '#1091#1084#1086#1083#1095'.'
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'FIELD_FLT'
        Footers = <>
        Title.Caption = #1060#1080#1083#1100#1090#1088'|'#1055#1086#1083#1077' '#1076#1083#1103' '#1074#1089#1090#1072#1074#1082#1080
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = 'OPISEDIT'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Width = 118
      end
      item
        EditButtons = <>
        FieldName = 'WIDTH'
        Footers = <>
        Title.Caption = #1064#1080#1088#1080#1085#1072' '#1087#1086#1082#1072#1079#1072
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'EDIZM'
        Footers = <>
        Title.Caption = #1045#1076'.'#1080#1079#1084'.'
        Width = 53
      end
      item
        EditButtons = <>
        FieldName = 'EDITMASK'
        Footers = <>
        Title.Caption = #1052#1072#1089#1082#1072' '#1088#1077#1076#1072#1082#1090#1080#1088'.'
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'DISPLAYFORMAT'
        Footers = <>
        Title.Caption = #1060#1086#1088#1084#1072#1090' '#1087#1086#1082#1072#1079#1072
      end
      item
        EditButtons = <>
        FieldName = 'MINVALUE'
        Footers = <>
        Title.Caption = 'Min'
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'MAXVALUE'
        Footers = <>
        Title.Caption = 'Max'
        Width = 41
      end
      item
        EditButtons = <>
        FieldName = 'FONT_SIZE'
        Footers = <>
        Title.Caption = #1060#1086#1085#1090'|'#1088#1072#1079#1084#1077#1088
        Width = 46
      end
      item
        EditButtons = <>
        FieldName = 'FONT_BOLD'
        Footers = <>
        Title.Caption = #1060#1086#1085#1090'|'#1046
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'FONT_KURSIV'
        Footers = <>
        Title.Caption = #1060#1086#1085#1090'|'#1050
        Width = 42
      end
      item
        EditButtons = <>
        FieldName = 'FONT_PODCH'
        Footers = <>
        Title.Caption = #1060#1086#1085#1090'|'#1055
        Width = 35
      end
      item
        EditButtons = <>
        FieldName = 'VISIBLE'
        Footers = <>
        Title.Caption = #1042#1080#1076#1080#1084'.'
        Width = 39
      end
      item
        EditButtons = <>
        FieldName = 'FIELDNAME'
        Footers = <>
        Title.Caption = #1048#1084#1103' '#1087#1086#1083#1103
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'ENABLE'
        Footers = <>
        Title.Caption = #1044#1086#1089#1090#1091#1087
        Width = 44
      end
      item
        EditButtons = <>
        FieldName = 'USER'
        Footers = <>
        Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        Width = 136
      end
      item
        Alignment = taLeftJustify
        EditButtons = <>
        FieldName = 'WHERESAVE'
        Footers = <>
        Title.Caption = #1043#1076#1077' '#1093#1088#1072#1085#1080#1090#1089#1103
        Width = 114
      end>
  end
  object memRazdel: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'TYPEOBJ'
        DataType = ftInteger
      end
      item
        Name = 'NOMER'
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FNAME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VISIBLE'
        DataType = ftBoolean
      end
      item
        Name = 'ENABLED'
        DataType = ftBoolean
      end
      item
        Name = 'USER'
        DataType = ftString
        Size = 30
      end>
    IndexFieldNames = 'TYPEOBJ;NOMER'
    IndexName = 'memRazdelIndex'
    IndexDefs = <
      item
        Name = 'memRazdelIndex'
        Fields = 'TYPEOBJ;NOMER'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.50'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    DefaultFormat = fmMain.kbmCSVStreamFormat1
    CommaTextFormat = fmMain.kbmCSVStreamFormat1
    Left = 232
    Top = 128
    object memRazdelID: TAutoIncField
      FieldName = 'ID'
    end
    object memRazdelTYPEOBJ: TIntegerField
      FieldName = 'TYPEOBJ'
    end
    object memRazdelNOMER: TIntegerField
      FieldName = 'NOMER'
    end
    object memRazdelNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object memRazdelFNAME: TStringField
      FieldName = 'FNAME'
      Size = 100
    end
    object memRazdelVISIBLE: TBooleanField
      FieldName = 'VISIBLE'
    end
    object memRazdelENABLED: TBooleanField
      FieldName = 'ENABLED'
    end
    object memRazdelUSER: TStringField
      FieldName = 'USER'
      Size = 30
    end
  end
  object memProperty: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'TYPEOBJ'
        DataType = ftSmallint
      end
      item
        Name = 'RAZDEL'
        DataType = ftInteger
      end
      item
        Name = 'NOMER'
        DataType = ftSmallint
      end
      item
        Name = 'VID'
        DataType = ftSmallint
      end
      item
        Name = 'TIP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'KOD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'EDIZM'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'WIDTH'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'EDITMASK'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FNAME'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'VISIBLE'
        DataType = ftBoolean
      end
      item
        Name = 'ENABLE'
        DataType = ftBoolean
      end
      item
        Name = 'USER'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OPISEDIT'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FIELDNAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'WHERESAVE'
        DataType = ftSmallint
      end
      item
        Name = 'FONT_SIZE'
        DataType = ftInteger
      end
      item
        Name = 'FONT_BOLD'
        DataType = ftBoolean
      end
      item
        Name = 'FONT_KURSIV'
        DataType = ftBoolean
      end
      item
        Name = 'FONT_PODCH'
        DataType = ftBoolean
      end
      item
        Name = 'LINE_UP'
        DataType = ftBoolean
      end
      item
        Name = 'LINE_DOWN'
        DataType = ftBoolean
      end
      item
        Name = 'DATE_CR'
        DataType = ftDate
      end
      item
        Name = 'DATE_DEL'
        DataType = ftDate
      end
      item
        Name = 'NAME_FLT'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DEFAULT_OP'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ADD_FLT'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'UROV'
        DataType = ftInteger
      end
      item
        Name = 'FIELD_FLT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MINVALUE'
        DataType = ftInteger
      end
      item
        Name = 'MAXVALUE'
        DataType = ftInteger
      end
      item
        Name = 'DISPLAYFORMAT'
        DataType = ftString
        Size = 20
      end>
    IndexFieldNames = 'TYPEOBJ;RAZDEL;NOMER'
    IndexDefs = <
      item
        Name = 'TYPEOBJ_RAZDEL_NOMER'
        Fields = 'TYPEOBJ;RAZDEL;NOMER'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'TYPEOBJ_KOD'
        Fields = 'TYPEOBJ;KOD'
      end>
    SortFields = 
      'ID;TYPEOBJ;RAZDEL;NOMER;TIP;KOD;NAME;EDIZM;FNAME;EDITMASK;VISIBL' +
      'E;ENABLE;USER;OPISEDIT'
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    MasterFields = 'TYPEOBJ;ID'
    MasterSource = dsRazdel
    Version = '5.50'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    DefaultFormat = fmMain.kbmCSVStreamFormat1
    CommaTextFormat = fmMain.kbmCSVStreamFormat1
    Left = 312
    Top = 128
    object memPropertyID: TAutoIncField
      FieldName = 'ID'
    end
    object memPropertyTYPEOBJ: TSmallintField
      FieldName = 'TYPEOBJ'
    end
    object memPropertyRAZDEL: TIntegerField
      FieldName = 'RAZDEL'
    end
    object memPropertyNOMER: TSmallintField
      FieldName = 'NOMER'
    end
    object memPropertyVID: TSmallintField
      DefaultExpression = '1'
      FieldName = 'VID'
    end
    object memPropertyTIP: TStringField
      FieldName = 'TIP'
      Size = 1
    end
    object memPropertyKOD: TStringField
      FieldName = 'KOD'
      Size = 10
    end
    object memPropertyNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object memPropertyEDIZM: TStringField
      FieldName = 'EDIZM'
      Size = 3
    end
    object memPropertyWIDTH: TStringField
      DefaultExpression = '50'
      FieldName = 'WIDTH'
      Size = 10
    end
    object memPropertyEDITMASK: TStringField
      FieldName = 'EDITMASK'
    end
    object memPropertyFNAME: TStringField
      FieldName = 'FNAME'
      Size = 150
    end
    object memPropertyVISIBLE: TBooleanField
      DefaultExpression = 'true'
      FieldName = 'VISIBLE'
    end
    object memPropertyENABLE: TBooleanField
      DefaultExpression = 'true'
      FieldName = 'ENABLE'
    end
    object memPropertyUSER: TStringField
      FieldName = 'USER'
      Size = 30
    end
    object memPropertyOPISEDIT: TStringField
      FieldName = 'OPISEDIT'
      Size = 30
    end
    object memPropertyFIELDNAME: TStringField
      FieldName = 'FIELDNAME'
      Size = 30
    end
    object memPropertyWHERESAVE: TSmallintField
      DefaultExpression = '1'
      FieldName = 'WHERESAVE'
    end
    object memPropertyFONT_SIZE: TIntegerField
      FieldName = 'FONT_SIZE'
    end
    object memPropertyFONT_BOLD: TBooleanField
      FieldName = 'FONT_BOLD'
    end
    object memPropertyFONT_KURSIV: TBooleanField
      FieldName = 'FONT_KURSIV'
    end
    object memPropertyFONT_PODCH: TBooleanField
      FieldName = 'FONT_PODCH'
    end
    object memPropertyLINE_UP: TBooleanField
      FieldName = 'LINE_UP'
    end
    object memPropertyLINE_DOWN: TBooleanField
      FieldName = 'LINE_DOWN'
    end
    object memPropertyDATE_CR: TDateField
      FieldName = 'DATE_CR'
    end
    object memPropertyDATE_DEL: TDateField
      FieldName = 'DATE_DEL'
    end
    object memPropertyNAME_FLT: TStringField
      FieldName = 'NAME_FLT'
      Size = 50
    end
    object memPropertyDEFAULT_OP: TStringField
      FieldName = 'DEFAULT_OP'
      Size = 30
    end
    object memPropertyADD_FLT: TStringField
      FieldName = 'ADD_FLT'
      Size = 50
    end
    object memPropertyUROV: TIntegerField
      FieldName = 'UROV'
    end
    object memPropertyFIELD_FLT: TStringField
      FieldName = 'FIELD_FLT'
    end
    object memPropertyMINVALUE: TIntegerField
      FieldName = 'MINVALUE'
    end
    object memPropertyMAXVALUE: TIntegerField
      FieldName = 'MAXVALUE'
    end
    object memPropertyDISPLAYFORMAT: TStringField
      FieldName = 'DISPLAYFORMAT'
    end
  end
  object dsRazdel: TDataSource
    DataSet = memRazdel
    Left = 232
    Top = 176
  end
  object dsProperty: TDataSource
    DataSet = memProperty
    OnDataChange = dsPropertyDataChange
    Left = 312
    Top = 176
  end
  object tbPropertysObj: TAdsTable
    DatabaseName = 'dmBase.AdsSharedConnection'
    StoreActive = True
    AdsConnection = dmBase.AdsSharedConnection
    Exclusive = True
    TableName = 'PropertysObj'
    Left = 88
    Top = 120
  end
end
