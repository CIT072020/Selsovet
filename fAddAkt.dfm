object fmAddAkt: TfmAddAkt
  Left = 481
  Top = 242
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1082#1090#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
  ClientHeight = 265
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 60
    Height = 16
    Caption = #1060#1072#1084#1080#1083#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 51
    Width = 26
    Height = 16
    Caption = #1048#1084#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 85
    Width = 62
    Height = 16
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 24
    Top = 123
    Width = 149
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1072#1082#1090#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbDay: TLabel
    Left = 24
    Top = 159
    Width = 33
    Height = 16
    Caption = #1044#1077#1085#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 17
    Top = 40
    Width = 449
    Height = 6
    Shape = bsTopLine
  end
  object Bevel2: TBevel
    Left = 17
    Top = 76
    Width = 449
    Height = 6
    Shape = bsTopLine
  end
  object Bevel3: TBevel
    Left = 17
    Top = 111
    Width = 449
    Height = 6
    Shape = bsTopLine
  end
  object Bevel5: TBevel
    Left = 17
    Top = 148
    Width = 449
    Height = 6
    Shape = bsTopLine
  end
  object Bevel6: TBevel
    Left = 17
    Top = 217
    Width = 449
    Height = 6
    Shape = bsTopLine
  end
  object lbMonth: TLabel
    Left = 24
    Top = 191
    Width = 43
    Height = 16
    Caption = #1052#1077#1089#1103#1094
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbVosstan: TLabel
    Left = 308
    Top = 152
    Width = 120
    Height = 16
    Caption = '( '#1074#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1072#1103' )'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object edFamilia: TDBEditEh
    Left = 216
    Top = 12
    Width = 169
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = 'edFamilia'
    Visible = True
    OnExit = edFamiliaExit
  end
  object edName: TDBEditEh
    Left = 216
    Top = 47
    Width = 169
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Text = 'edName'
    Visible = True
    OnExit = edNameExit
  end
  object edOtch: TDBEditEh
    Left = 216
    Top = 81
    Width = 169
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Text = 'edOtch'
    Visible = True
    OnExit = edOtchExit
  end
  object edNomer: TDBNumberEditEh
    Left = 216
    Top = 119
    Width = 69
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = True
    OnKeyPress = edNomerKeyPress
  end
  object btOk: TBitBtn
    Left = 230
    Top = 228
    Width = 108
    Height = 25
    Hint = #1047#1072#1087#1080#1089#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077'  ( F2, Ins )'
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100' - F2'
    TabOrder = 8
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
    Left = 356
    Top = 228
    Width = 108
    Height = 25
    Hint = #1054#1090#1082#1072#1079#1072#1090#1100' '#1086#1090' '#1079#1072#1087#1080#1089#1080' ( ESC )'
    Caption = #1054#1090#1082#1072#1079' - ESC'
    TabOrder = 9
    Kind = bkCancel
  end
  object edZAGS_ID: TDBLookupComboboxEh
    Left = 128
    Top = 84
    Width = 25
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = DataSource1
    ParentFont = False
    Style = csDropDownEh
    TabOrder = 7
    Visible = False
  end
  object edDay: TDBNumberEditEh
    Left = 216
    Top = 155
    Width = 33
    Height = 24
    DecimalPlaces = 0
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxValue = 31.000000000000000000
    MinValue = 1.000000000000000000
    ParentFont = False
    TabOrder = 4
    Visible = True
  end
  object edMonth: TDBNumberEditEh
    Left = 216
    Top = 187
    Width = 33
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxValue = 12.000000000000000000
    MinValue = 1.000000000000000000
    ParentFont = False
    TabOrder = 5
    Visible = True
  end
  object edYear: TDBNumberEditEh
    Left = 123
    Top = 49
    Width = 30
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxValue = 2400.000000000000000000
    MinValue = 1500.000000000000000000
    ParentFont = False
    TabOrder = 6
    Visible = False
  end
  object cbVosstan: TDBCheckBoxEh
    Left = 308
    Top = 122
    Width = 145
    Height = 17
    Hint = '*  '#1087#1077#1088#1077#1082#1083#1102#1095#1077#1085#1080#1077' '#1079#1085#1072#1095#1077#1085#1080#1103
    Caption = #1074#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1072#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DataSource1: TDataSource
    DataSet = dmBase.SprNames
    Left = 120
    Top = 176
  end
end
