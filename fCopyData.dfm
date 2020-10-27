object fmCopyData: TfmCopyData
  Left = 558
  Top = 248
  BorderStyle = bsDialog
  Caption = #1056#1077#1079#1077#1088#1074#1085#1086#1077' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 152
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 37
    Width = 132
    Height = 16
    Caption = #1055#1091#1090#1100' '#1076#1083#1103' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 2
    Top = 105
    Width = 534
    Height = 7
    Shape = bsTopLine
  end
  object Label2: TLabel
    Left = 10
    Top = 6
    Width = 424
    Height = 16
    Caption = #1042#1053#1048#1052#1040#1053#1048#1045': '#1042#1089#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080' '#1076#1086#1083#1078#1085#1099' '#1079#1072#1074#1077#1088#1096#1080#1090#1100' '#1088#1072#1073#1086#1090#1091' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btOk: TBitBtn
    Left = 309
    Top = 118
    Width = 97
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    Default = True
    TabOrder = 0
    OnClick = btOkClick
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
    Left = 424
    Top = 118
    Width = 97
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 1
    OnClick = btCancelClick
    Kind = bkCancel
  end
  object edPath: TDBEditEh
    Left = 180
    Top = 33
    Width = 345
    Height = 24
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edPathEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'f:\projects\selsovet\version base\1.0'
    Visible = True
  end
  object cbRestoreParams: TCheckBox
    Left = 11
    Top = 68
    Width = 246
    Height = 17
    Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1079#1072#1076#1072#1095#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = cbRestoreParamsClick
  end
  object cbDocArxiv: TCheckBox
    Left = 310
    Top = 68
    Width = 214
    Height = 17
    Caption = #1055#1088#1080#1082#1088#1077#1087#1083#1077#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object cbArxiv: TCheckBox
    Left = 58
    Top = 84
    Width = 246
    Height = 17
    Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1072#1088#1093#1080#1074#1072#1094#1080#1102
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = cbArxivClick
  end
  object ConnectSource: TAdsConnection
    AdsServerTypes = [stADS_LOCAL]
    LoginPrompt = False
    Username = 'adssys'
    StoreConnected = False
    Left = 48
    Top = 104
  end
  object Query: TAdsQuery
    DatabaseName = 'ConnectSource'
    AdsConnection = ConnectSource
    Left = 80
    Top = 104
    ParamData = <>
  end
  object Dokument: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
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
    Left = 136
    Top = 104
  end
  object SvidPovtor: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
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
    Left = 224
    Top = 88
  end
  object HistZAGS: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
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
    Left = 264
    Top = 104
  end
  object kbmCSVStreamFormat2: TkbmCSVStreamFormat
    CSVQuote = #0
    CSVFieldDelimiter = #20
    CSVRecordDelimiter = #0
    CSVTrueString = 'True'
    CSVFalseString = 'False'
    sfLocalFormat = []
    sfQuoteOnlyStrings = []
    sfNoHeader = []
    Version = '3.00'
    sfData = [sfSaveData, sfLoadData]
    sfCalculated = []
    sfLookup = []
    sfNonVisible = [sfSaveNonVisible, sfLoadNonVisible]
    sfBlobs = [sfSaveBlobs, sfLoadBlobs]
    sfDef = [sfSaveDef, sfLoadDef]
    sfIndexDef = [sfSaveIndexDef, sfLoadIndexDef]
    sfPlaceHolders = []
    sfFiltered = [sfSaveFiltered]
    sfIgnoreRange = [sfSaveIgnoreRange]
    sfIgnoreMasterDetail = [sfSaveIgnoreMasterDetail]
    sfDeltas = []
    sfDontFilterDeltas = []
    sfAppend = []
    sfFieldKind = [sfSaveFieldKind]
    sfFromStart = [sfLoadFromStart]
    Left = 152
    Top = 98
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
    Left = 16
    Top = 106
  end
end
