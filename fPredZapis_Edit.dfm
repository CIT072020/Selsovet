object fmPredZapis_Edit: TfmPredZapis_Edit
  Left = 425
  Top = 271
  ActiveControl = edON
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100
  ClientHeight = 250
  ClientWidth = 576
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000000040000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000CAB9
    A7FF825C30FF704513FF704513FF825C30FFCAB9A7FF00000000000000000000
    0000000000000000000000000000000000000000000000000000A68B6BFF7045
    13FF9D7F5DFFB8A289FFB8A289FF9D7F5DFF704513FFA68B6BFF000000000000
    00000000000000000000000000000000000000000000D3C5B5FF704513FFCAB9
    A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAB9A7FF704513FFD3C5B5FF0000
    000000000000000000000000000000000000000000008B683FFF8B683FFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B683FFF8B683FFF0000
    00000000000000000000000000000000000000000000704513FFB8A289FFFFFF
    FFFFFFFFFFFF704513FF704513FF704513FFFFFFFFFFB8A289FF704513FF0000
    00000000000000000000000000000000000000000000704513FFB8A289FFFFFF
    FFFFFFFFFFFF704513FFFFFFFFFFFFFFFFFFFFFFFFFFB8A289FF704513FF0000
    000000000000000000000000000000000000040204FF8B683FFF825C30FFFFFF
    FFFFFFFFFFFF704513FFFFFFFFFFFFFFFFFFFFFFFFFF825C30FF8B683FFF0000
    0000000000000000000000000000040204FF040284FFDCD1C4FF704513FFB8A2
    89FFFFFFFFFFB8A289FFFFFFFFFFFFFFFFFFB8A289FF704513FFDCD1C4FF0000
    00000000000000000000040204FF040284FF040284FF040284FFB8A289FF7045
    13FF8B683FFF94734EFF94734EFF8B683FFF704513FFB8A289FF000000000000
    0000040204FF040284FF040284FF040284FF040284FF040284FF040284FFD3C5
    B5FF94734EFF94734EFF94734EFF94734EFFD3C5B5FF00000000000000000402
    04FF0402FCFF0402FCFF0402FCFF0402FCFF040284FF040284FF040284FF0402
    84FF040284FF040204FF00000000000000000000000000000000000000000402
    84FF0402FCFF0402FCFF0402FCFF0402FCFF0402FCFF040284FF040284FF0402
    84FF040284FF040284FF040204FF000000000000000000000000000000000402
    84FFFCFEFCFF0402FCFF0402FCFF0402FCFF0402FCFF0402FCFF0402FCFF0402
    84FF040284FF040284FF040204FF000000000000000000000000000000000402
    84FFFCFEFCFF0402FCFF0402FCFF0402FCFF040284FF0402FCFF0402FCFF0402
    84FF040284FF040284FF040204FF000000000000000000000000000000000402
    04FF0402FCFFFCFEFCFF0402FCFF040284FF040204FF0402FCFF0402FCFF0402
    84FF040284FF040204FF00000000000000000000000000000000000000000000
    0000040204FF040284FF040284FF040204FF00000000040204FF0402FCFF0402
    84FF040204FF000000000000000000000000000000000000000000000000FF03
    0000FE010000FC000000FC000000FC000000FC000000F8000000F0000000E001
    000080030000001F0000000F0000000F0000000F0000001F0000843F0000}
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 45
    Width = 82
    Height = 16
    Caption = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072
  end
  object Label2: TLabel
    Left = 217
    Top = 45
    Width = 81
    Height = 16
    Caption = #1076#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
  end
  object Label3: TLabel
    Left = 381
    Top = 45
    Width = 34
    Height = 16
    Caption = #1084#1080#1085#1091#1090
  end
  object Label4: TLabel
    Left = 8
    Top = 192
    Width = 69
    Height = 16
    Caption = #1057#1087#1077#1094#1080#1072#1083#1080#1089#1090
  end
  object Label5: TLabel
    Left = 8
    Top = 162
    Width = 124
    Height = 16
    Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
  end
  object lbOn: TLabel
    Left = 8
    Top = 74
    Width = 39
    Height = 16
    Caption = #1046#1077#1085#1080#1093
  end
  object lbOna: TLabel
    Left = 8
    Top = 103
    Width = 48
    Height = 16
    Caption = #1053#1077#1074#1077#1089#1090#1072
  end
  object Label8: TLabel
    Left = 8
    Top = 133
    Width = 92
    Height = 16
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
  end
  object Label9: TLabel
    Left = 8
    Top = 15
    Width = 103
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1074' '#1078#1091#1088#1085#1072#1083#1077
  end
  object Label10: TLabel
    Left = 346
    Top = 15
    Width = 29
    Height = 16
    Caption = #1044#1072#1090#1072
  end
  object edBegin: TDBDateTimeEditEh
    Left = 148
    Top = 41
    Width = 41
    Height = 24
    TabStop = False
    Color = clInfoBk
    DataField = 'BEGINR'
    DataSource = DataSource
    EditButton.Visible = False
    EditButtons = <>
    ReadOnly = True
    TabOrder = 1
    Visible = True
    EditFormat = 'HH:MM'
  end
  object btOk: TBitBtn
    Left = 361
    Top = 215
    Width = 90
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    Default = True
    TabOrder = 9
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
    Left = 468
    Top = 215
    Width = 90
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 10
    Kind = bkCancel
  end
  object edDateSost: TDBDateTimeEditEh
    Left = 392
    Top = 11
    Width = 169
    Height = 24
    TabStop = False
    Color = clInfoBk
    DataField = 'DATER'
    DataSource = DataSource
    EditButton.Visible = False
    EditButtons = <>
    ReadOnly = True
    TabOrder = 3
    Visible = True
    EditFormat = 'DD/MM/YYYY HH:NN'
  end
  object cbLong: TDBComboBoxEh
    Left = 309
    Top = 41
    Width = 65
    Height = 24
    DataField = 'LONGR'
    DataSource = DataSource
    DropDownBox.Rows = 12
    EditButtons = <>
    TabOrder = 2
    Visible = True
  end
  object edSpec: TDBEditEh
    Left = 148
    Top = 188
    Width = 180
    Height = 24
    DataField = 'SPEC'
    DataSource = DataSource
    EditButtons = <>
    TabOrder = 8
    Visible = True
  end
  object edTelefon: TDBEditEh
    Left = 148
    Top = 158
    Width = 180
    Height = 24
    DataField = 'TELEFON'
    DataSource = DataSource
    EditButtons = <>
    TabOrder = 7
    Visible = True
  end
  object edON: TDBEditEh
    Left = 148
    Top = 70
    Width = 303
    Height = 24
    DataField = 'ON_FIO'
    DataSource = DataSource
    EditButtons = <>
    TabOrder = 4
    Visible = True
    OnUpdateData = edONUpdateData
  end
  object edONA: TDBEditEh
    Left = 148
    Top = 99
    Width = 303
    Height = 24
    DataField = 'ONA_FIO'
    DataSource = DataSource
    EditButtons = <>
    TabOrder = 5
    Visible = True
    OnUpdateData = edONUpdateData
  end
  object edOpis: TDBEditEh
    Left = 148
    Top = 129
    Width = 420
    Height = 24
    DataField = 'OPIS'
    DataSource = DataSource
    EditButtons = <>
    TabOrder = 6
    Visible = True
  end
  object cbFirstBrak: TDBCheckBoxEh
    Left = 452
    Top = 161
    Width = 114
    Height = 17
    Caption = #1041#1088#1072#1082' '#1074#1087#1077#1088#1074#1099#1077
    DataField = 'FIRST_BRAK'
    DataSource = DataSource
    TabOrder = 11
    TabStop = False
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object edNomer: TDBNumberEditEh
    Left = 148
    Top = 11
    Width = 60
    Height = 24
    DataField = 'NOMER'
    DataSource = DataSource
    DecimalPlaces = 0
    EditButtons = <>
    MaxValue = 100000.000000000000000000
    MinValue = 1.000000000000000000
    TabOrder = 0
    Visible = True
  end
  object DataSource: TDataSource
    Left = 472
    Top = 61
  end
end
