object fmParamsAlfavit: TfmParamsAlfavit
  Left = 367
  Top = 223
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1074#1074#1086#1076#1072
  ClientHeight = 265
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbType: TLabel
    Left = 7
    Top = 54
    Width = 125
    Height = 16
    Caption = #1054#1088#1075#1072#1085' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
    FocusControl = edTypeSvid
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 7
    Top = 22
    Width = 128
    Height = 16
    Caption = #1058#1080#1087' '#1072#1082#1090#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
    FocusControl = edTypeSvid
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 7
    Top = 88
    Width = 110
    Height = 16
    Caption = #1043#1086#1076' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
    FocusControl = edTypeSvid
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbVosstan: TLabel
    Left = 7
    Top = 120
    Width = 169
    Height = 16
    Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
    FocusControl = edVosstan
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edTypeSvid: TDBComboBoxEh
    Left = 192
    Top = 18
    Width = 194
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'edTypeSvid'
    Visible = True
    OnChange = edTypeSvidChange
  end
  object btOk: TBitBtn
    Left = 260
    Top = 233
    Width = 99
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    Default = True
    TabOrder = 1
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
    Left = 371
    Top = 233
    Width = 99
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
  object edZAGS: TDBLookupComboboxEh
    Left = 192
    Top = 50
    Width = 273
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = DataSource1
    ParentFont = False
    TabOrder = 3
    Visible = True
  end
  object cbNomerCur: TDBCheckBoxEh
    Left = 7
    Top = 178
    Width = 442
    Height = 17
    Caption = #1053#1086#1084#1077#1088' '#1080' '#1076#1072#1090#1072' '#1080#1079' '#1090#1077#1082#1091#1097#1077#1081' '#1072#1082#1090#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object cbAutoAdd: TDBCheckBoxEh
    Left = 7
    Top = 202
    Width = 442
    Height = 17
    Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1087#1077#1088#1077#1093#1086#1076#1080#1090#1100' '#1074' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1085#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object edYear: TDBNumberEditEh
    Left = 192
    Top = 83
    Width = 61
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxValue = 2500.000000000000000000
    MinValue = 1900.000000000000000000
    ParentFont = False
    TabOrder = 6
    Visible = True
  end
  object cbOnlyYear: TDBCheckBoxEh
    Left = 7
    Top = 153
    Width = 442
    Height = 17
    Caption = #1058#1086#1083#1100#1082#1086' '#1075#1086#1076' '#1072#1082#1090#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object edVosstan: TDBComboBoxEh
    Left = 192
    Top = 116
    Width = 194
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.Strings = (
      #1053#1077#1090
      #1044#1072' '
      #1053#1077' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086)
    KeyItems.Strings = (
      '0'
      '1'
      '2')
    ParentFont = False
    TabOrder = 8
    Visible = True
  end
  object DataSource1: TDataSource
    DataSet = dmBase.SprNames
    Left = 208
    Top = 218
  end
end
