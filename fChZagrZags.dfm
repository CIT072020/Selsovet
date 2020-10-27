object fmChZagrZags: TfmChZagrZags
  Left = 522
  Top = 240
  BorderStyle = bsDialog
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1047#1040#1043#1057
  ClientHeight = 178
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PrintScale = poNone
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    397
    178)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 148
    Height = 13
    Caption = #1055#1091#1090#1100' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1076#1072#1085#1085#1099#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btOk: TBitBtn
    Left = 185
    Top = 146
    Width = 92
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    ModalResult = 1
    TabOrder = 0
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btCancel: TBitBtn
    Left = 291
    Top = 146
    Width = 92
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 1
    Kind = bkCancel
  end
  object cbChoice: TDBCheckBoxEh
    Left = 8
    Top = 38
    Width = 377
    Height = 17
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1089#1072#1084#1086#1089#1090#1086#1103#1090#1077#1083#1100#1085#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = cbChoiceClick
  end
  object edDisk: TDBComboBoxEh
    Left = 177
    Top = 6
    Width = 65
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = True
  end
  object edPath: TDBEditEh
    Left = 8
    Top = 64
    Width = 381
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edPathEditButtons0Click
      end>
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = True
  end
  object cbImitation: TDBCheckBoxEh
    Left = 9
    Top = 121
    Width = 73
    Height = 17
    Caption = #1048#1084#1080#1090#1072#1094#1080#1103
    TabOrder = 5
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    Visible = False
  end
  object cbCheckData: TDBCheckBoxEh
    Left = 9
    Top = 97
    Width = 355
    Height = 17
    Hint = #1050#1086#1085#1090#1088#1086#1083#1100' '#1085#1072#1083#1080#1095#1080#1103' '#1076#1072#1085#1085#1099#1093' '#1074' '#1073#1072#1079#1077
    Caption = #1047#1072#1087#1080#1089#1100' '#1089' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1084' '#1087#1086#1080#1089#1082#1086#1084' '#1082#1072#1078#1076#1086#1081' '#1079#1072#1087#1080#1089#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object btHelp: TButton
    Left = 367
    Top = 95
    Width = 19
    Height = 21
    Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1072#1088#1072#1084#1077#1090#1088#1077
    Caption = '?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btHelpClick
  end
  object cbType: TComboBox
    Left = 8
    Top = 117
    Width = 290
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ItemIndex = 0
    ParentFont = False
    TabOrder = 8
    Text = #1085#1072#1081#1076#1077#1085#1085#1099#1077' '#1079#1072#1087#1080#1089#1080' '#1087#1077#1088#1077#1079#1072#1087#1080#1089#1099#1074#1072#1090#1100
    Items.Strings = (
      #1085#1072#1081#1076#1077#1085#1085#1099#1077' '#1079#1072#1087#1080#1089#1080' '#1087#1077#1088#1077#1079#1072#1087#1080#1089#1099#1074#1072#1090#1100
      #1085#1072#1081#1076#1077#1085#1085#1099#1077' '#1079#1072#1087#1080#1089#1080' '#1085#1077' '#1080#1079#1084#1077#1085#1103#1090#1100
      #1076#1086#1073#1072#1074#1083#1103#1090#1100' '#1073#1077#1079' '#1087#1088#1086#1074#1077#1088#1082#1080)
  end
  object AdsConnection: TAdsConnection
    AdsServerTypes = [stADS_LOCAL]
    LoginPrompt = False
    StoreConnected = False
    Left = 248
    Top = 16
  end
  object tbSource: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    AdsTableOptions.AdsFilterOptions = RESPECT_WHEN_COUNTING
    AdsTableOptions.AdsFreshRecordCount = True
    Left = 288
    Top = 16
  end
  object Zip: TZipForge
    ExtractCorruptedFiles = False
    CompressionLevel = clNormal
    CompressionMode = 6
    CurrentVersion = '4.03 '
    SpanningMode = smNone
    SpanningOptions.AdvancedNaming = True
    SpanningOptions.VolumeSize = vsAutoDetect
    Options.FlushBuffers = True
    Options.OEMFileNames = True
    InMemory = False
    Zip64Mode = zmDisabled
    UnicodeFilenames = True
    EncryptionMethod = caPkzipClassic
    Left = 208
    Top = 32
  end
  object tbSourceBaseProp: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'BaseProp'
    Left = 120
    Top = 64
  end
  object tbSourceBaseTextProp: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'BaseTextProp'
    Left = 168
    Top = 72
  end
  object tbSourceHistZAGS: TAdsTable
    DatabaseName = 'AdsConnection'
    AdsConnection = AdsConnection
    TableName = 'HistoryZAGS'
    Left = 232
    Top = 64
  end
  object tbSourceSvidPovtor: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SvidPovtor'
    Left = 192
    Top = 40
  end
  object tbSourceSprNames: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SprNames'
    Left = 272
    Top = 72
  end
  object Query: TAdsQuery
    DatabaseName = 'AdsConnection'
    AdsConnection = AdsConnection
    Left = 80
    Top = 72
    ParamData = <>
  end
  object memSeek: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'AKT_TYPE'
        DataType = ftInteger
      end
      item
        Name = 'ID_ZAGS'
        DataType = ftInteger
      end
      item
        Name = 'YEARZ'
        DataType = ftInteger
      end
      item
        Name = 'NOMER'
        DataType = ftInteger
      end>
    IndexFieldNames = 'ID_ZAGS;YEARZ;NOMER'
    IndexName = 'memSeekIndex1'
    IndexDefs = <
      item
        Name = 'memSeekIndex1'
        Fields = 'AKT_TYPE;ID_ZAGS;YEARZ;NOMER'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.52'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 40
    Top = 139
    object memSeekAKT_TYPE: TIntegerField
      FieldName = 'AKT_TYPE'
    end
    object memSeekID_ZAGS: TIntegerField
      FieldName = 'ID_ZAGS'
    end
    object memSeekYEARZ: TIntegerField
      FieldName = 'YEARZ'
    end
    object memSeekNOMER: TIntegerField
      FieldName = 'NOMER'
    end
  end
end
