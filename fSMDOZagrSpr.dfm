object fmSMDOZagrSpr: TfmSMDOZagrSpr
  Left = 501
  Top = 292
  BorderStyle = bsDialog
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1057#1052#1044#1054
  ClientHeight = 133
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    363
    133)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 79
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083
  end
  object lbDate1: TLabel
    Left = 8
    Top = 74
    Width = 5
    Height = 13
    Caption = #1089
  end
  object lbDate2: TLabel
    Left = 180
    Top = 74
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object btOk: TBitBtn
    Left = 148
    Top = 102
    Width = 92
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
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
    Left = 254
    Top = 102
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
    Checked = True
    State = cbChecked
    TabOrder = 2
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = cbChoiceClick
  end
  object edDisk: TDBComboBoxEh
    Left = 50
    Top = 112
    Width = 36
    Height = 21
    EditButtons = <>
    TabOrder = 3
    Visible = False
  end
  object edPath: TDBEditEh
    Left = 8
    Top = 36
    Width = 346
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
  object cbWebService: TCheckBox
    Left = 6
    Top = 108
    Width = 116
    Height = 17
    Caption = #1054#1090#1074#1077#1090' WebService'
    TabOrder = 5
  end
  object cbTypeSpr: TComboBox
    Left = 103
    Top = 6
    Width = 218
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
    TabOrder = 6
    Text = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
    Items.Strings = (
      #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      #1042#1080#1076#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074)
  end
  object cbTypeLoad: TComboBox
    Left = 8
    Top = 38
    Width = 218
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
    TabOrder = 7
    Text = #1040#1082#1090#1091#1072#1083#1100#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
    OnChange = cbTypeLoadChange
    Items.Strings = (
      #1040#1082#1090#1091#1072#1083#1100#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
      #1058#1086#1083#1100#1082#1086' '#1080#1079#1084#1077#1085#1077#1085#1080#1103)
  end
  object edDate1: TDBDateTimeEditEh
    Left = 39
    Top = 68
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
    TabOrder = 8
    Visible = True
  end
  object edDate2: TDBDateTimeEditEh
    Left = 216
    Top = 68
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
    TabOrder = 9
    Visible = True
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
    Left = 288
    Top = 8
  end
  object OpenDialog: TOpenDialog
    Filter = #1040#1088#1093#1080#1074'|*.zip|XML|*.xml'
    Title = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083
    Left = 248
    Top = 8
  end
end
