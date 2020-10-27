object fmChVigrZAH: TfmChVigrZAH
  Left = 460
  Top = 231
  BorderStyle = bsDialog
  Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
  ClientHeight = 343
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
    Left = 296
    Top = 0
    Width = 33
    Height = 43
    Caption = ' '#1055#1077#1088#1080#1086#1076' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Visible = False
    object rbMonth: TRadioButton
      Left = 16
      Top = 16
      Width = 57
      Height = 17
      Caption = #1052#1077#1089#1103#1094
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = rbMonthClick
    end
    object rbKv: TRadioButton
      Left = 103
      Top = 16
      Width = 65
      Height = 17
      Caption = #1050#1074#1072#1088#1090#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = rbKvClick
    end
    object rbYear: TRadioButton
      Left = 65
      Top = 8
      Width = 49
      Height = 17
      Caption = #1043#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = rbYearClick
    end
    object rbAny: TRadioButton
      Left = 176
      Top = 16
      Width = 113
      Height = 17
      Caption = #1055#1088#1086#1080#1079#1074#1086#1083#1100#1085#1099#1081
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      TabStop = True
      OnClick = rbMonthClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 299
    Width = 329
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      329
      44)
    object btOk: TBitBtn
      Left = 104
      Top = 5
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
      Top = 5
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
    Top = 0
    Width = 329
    Height = 299
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object lbPer: TLabel
      Left = 14
      Top = 14
      Width = 97
      Height = 13
      Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 14
      Top = 76
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
      Left = 14
      Top = 45
      Width = 89
      Height = 13
      Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edNomerPeriod: TDBComboBoxEh
      Left = 288
      Top = 9
      Width = 35
      Height = 21
      DropDownBox.Rows = 12
      EditButtons = <>
      TabOrder = 3
      Text = 'edNomerPeriod'
      Visible = False
    end
    object edDisk: TDBComboBoxEh
      Left = 166
      Top = 70
      Width = 83
      Height = 24
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
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object cbPath: TDBCheckBoxEh
      Left = 14
      Top = 275
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
    object cbAll: TDBCheckBoxEh
      Left = 14
      Top = 105
      Width = 257
      Height = 17
      Caption = #1042#1089#1077' '#1084#1077#1089#1090#1072' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1081
      Checked = True
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      State = cbChecked
      TabOrder = 5
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = cbAllClick
    end
    object edDate1: TDBDateTimeEditEh
      Left = 166
      Top = 8
      Width = 121
      Height = 24
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 0
      Visible = True
    end
    object edDate2: TDBDateTimeEditEh
      Left = 166
      Top = 39
      Width = 121
      Height = 24
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 1
      Visible = True
    end
    object Button1: TButton
      Left = 296
      Top = 39
      Width = 21
      Height = 24
      Hint = #1056#1072#1074#1085#1072' '#1085#1072#1095#1072#1083#1100#1085#1086#1081' '#1076#1072#1090#1077
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = Button1Click
    end
    object ListKlad: TCheckListBox
      Left = 14
      Top = 126
      Width = 303
      Height = 141
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 7
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
    Left = 88
    Top = 92
  end
  object tbDesc: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    Exclusive = True
    Left = 296
    Top = 106
  end
  object tbDescSprZAH: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SprZAH'
    Left = 288
    Top = 74
  end
  object tbDescBaseProp: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'BaseProp'
    Left = 216
    Top = 106
  end
  object tbDescHistZAGS: TAdsTable
    DatabaseName = 'AdsConnection'
    AdsConnection = AdsConnection
    TableName = 'HistoryZAGS'
    Left = 256
    Top = 138
  end
  object tbDescSprRazmer: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SprRazmer'
    Left = 272
    Top = 72
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
    Left = 248
    Top = 74
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
