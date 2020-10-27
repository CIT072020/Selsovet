object fmChVigrZags: TfmChVigrZags
  Left = 616
  Top = 201
  BorderStyle = bsDialog
  Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1047#1040#1043#1057
  ClientHeight = 316
  ClientWidth = 329
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
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 50
    Width = 329
    Height = 43
    Align = alTop
    Caption = ' '#1055#1077#1088#1080#1086#1076' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object rbMonth: TRadioButton
      Left = 14
      Top = 16
      Width = 87
      Height = 17
      Caption = #1052#1077#1089#1103#1094
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = rbMonthClick
    end
    object rbKv: TRadioButton
      Left = 117
      Top = 16
      Width = 106
      Height = 17
      Caption = #1050#1074#1072#1088#1090#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = rbKvClick
    end
    object rbYear: TRadioButton
      Left = 242
      Top = 16
      Width = 73
      Height = 17
      Caption = #1043#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = rbYearClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 273
    Width = 329
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      329
      43)
    object btOk: TBitBtn
      Left = 104
      Top = 9
      Width = 92
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100
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
      Left = 216
      Top = 9
      Width = 92
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 93
    Width = 329
    Height = 180
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object lbPer: TLabel
      Left = 7
      Top = 13
      Width = 90
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1087#1077#1088#1080#1086#1076#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbGod: TLabel
      Left = 9
      Top = 43
      Width = 22
      Height = 13
      Caption = #1043#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 73
      Width = 133
      Height = 13
      Caption = #1044#1080#1089#1082' '#1076#1083#1103' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbGod1: TLabel
      Left = 7
      Top = 27
      Width = 91
      Height = 13
      Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1075#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object edNomerPeriod: TDBComboBoxEh
      Left = 160
      Top = 9
      Width = 129
      Height = 26
      DropDownBox.Rows = 12
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'edNomerPeriod'
      Visible = True
    end
    object edGod: TDBComboBoxEh
      Left = 160
      Top = 39
      Width = 84
      Height = 26
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'edGod'
      Visible = True
    end
    object edDisk: TDBComboBoxEh
      Left = 160
      Top = 69
      Width = 83
      Height = 26
      EditButtons = <
        item
          Glyph.Data = {
            C6000000424DC60000000000000076000000280000000A0000000A0000000100
            0400000000005000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888800
            0000008888880800000080088880080000008000880088000000880000088800
            0000888000888800000088000008880000008000880088000000800888800800
            00008088888888000000}
          Hint = #1042#1099#1075#1088#1091#1078#1072#1090#1100' '#1074' '#1087#1072#1087#1082#1091' "Export"'
          Style = ebsGlyphEh
          OnClick = edDiskEditButtons0Click
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object edGod1: TDBComboBoxEh
      Left = 160
      Top = 23
      Width = 84
      Height = 26
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = 'edGod'
      Visible = False
    end
    object cbPath: TDBCheckBoxEh
      Left = 10
      Top = 97
      Width = 305
      Height = 17
      Caption = #1055#1086' '#1087#1091#1090#1080' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1086#1084#1091' '#1074' '#1087#1072#1088#1072#1084#1077#1090#1088#1072#1093
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = cbPathClick
    end
    object cbOnlySmert: TDBCheckBoxEh
      Left = 10
      Top = 115
      Width = 305
      Height = 17
      Caption = #1058#1086#1083#1100#1082#1086' '#1079'/'#1072' '#1086' '#1089#1084#1077#1088#1090#1080
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object cbAll: TDBCheckBoxEh
      Left = 160
      Top = 114
      Width = 161
      Height = 17
      Caption = #1042#1089#1077' '#1086#1088#1075#1072#1085#1099' '#1047#1040#1043#1057
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Visible = False
      OnClick = cbPathClick
    end
    object cbDateIzm: TDBCheckBoxEh
      Left = 10
      Top = 133
      Width = 316
      Height = 17
      Caption = #1055#1086' '#1076#1072#1090#1077' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080'('#1089#1086#1079#1076#1072#1085#1080#1103') '#1079#1072#1087#1080#1089#1080
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = cbDateIzmClick
    end
    object btHelp: TButton
      Left = 304
      Top = 126
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
      TabOrder = 8
      OnClick = btHelpClick
    end
    object edMinYear: TDBNumberEditEh
      Left = 195
      Top = 152
      Width = 64
      Height = 26
      DecimalPlaces = 0
      Enabled = False
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 2040.000000000000000000
      ParentFont = False
      TabOrder = 9
      Visible = True
    end
    object lbMinYear: TStaticText
      Left = 31
      Top = 157
      Width = 157
      Height = 17
      Caption = #1084#1080#1085#1080#1084#1072#1083#1100#1085#1099#1081' '#1075#1086#1076' '#1079#1072#1087#1080#1089#1080' '#1072#1082#1090#1072
      Enabled = False
      TabOrder = 10
    end
  end
  object gbZAGS: TGroupBox
    Left = 0
    Top = 0
    Width = 329
    Height = 50
    Align = alTop
    Caption = ' '#1047#1040#1043#1057' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object edZAGS: TDBEditEh
      Left = 8
      Top = 20
      Width = 311
      Height = 21
      Color = clInfoBk
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = edZAGSEditButtons0Click
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Visible = True
    end
  end
  object AdsConnection: TAdsConnection
    AdsServerTypes = [stADS_LOCAL]
    LoginPrompt = False
    StoreConnected = False
    Left = 264
    Top = 106
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
    Top = 268
  end
  object tbDesc: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    Exclusive = True
    Left = 296
    Top = 106
  end
  object tbDescBaseProp: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'BaseProp'
    Left = 272
    Top = 74
  end
  object tbDescBaseTextProp: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'BaseTextProp'
    Left = 256
    Top = 138
  end
  object tbDescHistZAGS: TAdsTable
    DatabaseName = 'AdsConnection'
    AdsConnection = AdsConnection
    TableName = 'HistoryZAGS'
    Left = 296
    Top = 138
  end
  object tbDescSvidPovtor: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SvidPovtor'
    Left = 80
    Top = 272
  end
  object tbDescSprNames: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SprNames'
    Left = 48
    Top = 272
  end
  object Report: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41670.608424236110000000
    ReportOptions.LastChange = 41670.608424236110000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 264
    Top = 162
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
