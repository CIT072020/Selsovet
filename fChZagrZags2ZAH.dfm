object fmChZagrZags2Zah: TfmChZagrZags2Zah
  Left = 597
  Top = 243
  AutoScroll = False
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1047#1040#1043#1057
  ClientHeight = 287
  ClientWidth = 333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    333
    287)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 127
    Height = 13
    Caption = #1055#1091#1090#1100' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1076#1072#1085#1085#1099#1093
  end
  object Label2: TLabel
    Left = 8
    Top = 100
    Width = 66
    Height = 13
    Caption = #1058#1080#1087' '#1079#1072#1075#1088#1091#1079#1082#1080
  end
  object lbSeek: TLabel
    Left = 8
    Top = 170
    Width = 51
    Height = 13
    Caption = #1048#1089#1082#1072#1090#1100' '#1087#1086
    Enabled = False
  end
  object Label3: TLabel
    Left = 8
    Top = 198
    Width = 94
    Height = 13
    Caption = #1047#1072#1087#1080#1089#1080' '#1072#1082#1090#1086#1074'       '#1089
  end
  object Label4: TLabel
    Left = 90
    Top = 227
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object btOk: TBitBtn
    Left = 123
    Top = 254
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
    Left = 229
    Top = 254
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
    Width = 161
    Height = 17
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1089#1072#1084#1086#1089#1090#1086#1103#1090#1077#1083#1100#1085#1086
    TabOrder = 2
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = cbChoiceClick
  end
  object edDisk: TDBComboBoxEh
    Left = 176
    Top = 8
    Width = 51
    Height = 21
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
  object edPath: TDBEditEh
    Left = 8
    Top = 65
    Width = 317
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edPathEditButtons0Click
      end>
    Enabled = False
    TabOrder = 4
    Visible = True
  end
  object cbType: TComboBox
    Left = 88
    Top = 96
    Width = 237
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 5
    Text = #1055#1086#1083#1085#1072#1103' '#1079#1072#1075#1088#1091#1079#1082#1072
    OnChange = cbTypeChange
    Items.Strings = (
      #1055#1086#1083#1085#1072#1103' '#1079#1072#1075#1088#1091#1079#1082#1072
      #1044#1086#1079#1072#1087#1080#1089#1100' '#1085#1086#1084#1077#1088#1072' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1080)
  end
  object cbDelete: TCheckBox
    Left = 120
    Top = 121
    Width = 178
    Height = 17
    Caption = #1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1086#1077' '#1091#1076#1072#1083#1077#1085#1080#1077
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object cbSeek: TComboBox
    Left = 88
    Top = 166
    Width = 237
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    ItemIndex = 1
    TabOrder = 7
    Text = #1060#1048#1054'+'#1076#1072#1090#1072' '#1089#1084#1077#1088#1090#1080
    Items.Strings = (
      #1060#1048#1054'+'#1076#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      #1060#1048#1054'+'#1076#1072#1090#1072' '#1089#1084#1077#1088#1090#1080)
  end
  object cbEmpty: TCheckBox
    Left = 120
    Top = 141
    Width = 178
    Height = 17
    Caption = #1090#1086#1083#1100#1082#1086' '#1077#1089#1083#1080' '#1087#1091#1089#1090#1086#1081' '#1048#1053
    Enabled = False
    TabOrder = 8
  end
  object edDate1: TDBDateTimeEditEh
    Left = 119
    Top = 194
    Width = 95
    Height = 21
    EditButtons = <>
    TabOrder = 9
    Visible = True
    EditFormat = 'DD/MM/YYYY'
  end
  object edDate2: TDBDateTimeEditEh
    Left = 119
    Top = 223
    Width = 95
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 10
    Visible = True
  end
  object btSetDate: TButton
    Left = 230
    Top = 194
    Width = 27
    Height = 21
    Hint = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1076#1072#1090#1099' '#1080#1079' '#1092#1072#1081#1083#1072' '#1079#1072#1075#1088#1091#1079#1082#1080
    Caption = '...'
    TabOrder = 11
    OnClick = btSetDateClick
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
    Left = 136
    Top = 56
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
    Left = 224
    Top = 72
  end
  object tbSourceSvidPovtor: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SvidPovtor'
    Left = 160
    Top = 40
  end
  object tbSourceSprNames: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SprNames'
    Left = 272
    Top = 80
  end
  object Query: TAdsQuery
    DatabaseName = 'AdsConnection'
    AdsConnection = AdsConnection
    Left = 96
    Top = 64
    ParamData = <>
  end
end
