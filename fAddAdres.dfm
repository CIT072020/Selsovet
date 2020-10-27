object fmAddAdres: TfmAddAdres
  Left = 513
  Top = 285
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1076#1088#1077#1089
  ClientHeight = 228
  ClientWidth = 518
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 108
    Height = 16
    Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 44
    Width = 35
    Height = 16
    Caption = #1059#1083#1080#1094#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 72
    Width = 24
    Height = 16
    Caption = #1044#1086#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbKorp: TLabel
    Left = 8
    Top = 100
    Width = 40
    Height = 16
    Caption = #1050#1086#1088#1087#1091#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 128
    Width = 55
    Height = 16
    Caption = #1050#1074#1072#1088#1090#1080#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbName: TLabel
    Left = 8
    Top = 158
    Width = 86
    Height = 16
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbRnGor: TLabel
    Left = 293
    Top = 16
    Width = 35
    Height = 16
    Caption = #1056#1072#1081#1086#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btCancel: TBitBtn
    Left = 415
    Top = 190
    Width = 87
    Height = 25
    Hint = #1042#1099#1081#1090#1080'  ESC'
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 7
    Kind = bkCancel
  end
  object btOk: TBitBtn
    Left = 311
    Top = 190
    Width = 87
    Height = 25
    Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1076#1088#1077#1089'  F2'
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 6
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
  object edPunkt: TDBLookupComboboxEh
    Left = 142
    Top = 13
    Width = 140
    Height = 24
    DropDownBox.Rows = 20
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = dsPunkt
    ParentFont = False
    TabOrder = 0
    Visible = True
    OnChange = edPunktChange
  end
  object edUL: TDBLookupComboboxEh
    Left = 142
    Top = 41
    Width = 231
    Height = 24
    DropDownBox.Columns = <
      item
        FieldName = 'name_tip'
        Width = 30
      end
      item
        FieldName = 'NAME'
        Width = 120
      end>
    DropDownBox.ListSource = dsUL
    DropDownBox.Rows = 20
    EditButtons = <
      item
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1091#1083#1080#1094#1091
        Style = ebsPlusEh
        OnClick = edULEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'ID'
    ListField = 'name_tip;name'
    ListFieldIndex = 1
    ListSource = dsUL
    ParentFont = False
    TabOrder = 2
    Visible = True
    OnChange = edPunktChange
  end
  object cbNotUL: TDBCheckBoxEh
    Left = 384
    Top = 43
    Width = 109
    Height = 17
    Caption = #1073#1077#1079' '#1091#1083#1080#1094#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    TabStop = False
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = cbNotULClick
  end
  object edDom: TDBEditEh
    Left = 143
    Top = 69
    Width = 71
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
  object edKorp: TDBEditEh
    Left = 143
    Top = 97
    Width = 71
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = True
  end
  object edKv: TDBEditEh
    Left = 143
    Top = 125
    Width = 71
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Visible = True
  end
  object cbNotDom: TDBCheckBoxEh
    Left = 237
    Top = 72
    Width = 153
    Height = 17
    Caption = #1073#1077#1079' '#1085#1086#1084#1077#1088#1072' '#1076#1086#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = cbNotDomClick
  end
  object edName: TDBEditEh
    Left = 143
    Top = 154
    Width = 215
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    Visible = True
  end
  object edRnGor: TDBComboBoxEh
    Left = 342
    Top = 12
    Width = 162
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'edRnGor'
    Visible = True
  end
  object dsPunkt: TDataSource
    DataSet = dmBase.LookUpPunkt
    Left = 272
    Top = 108
  end
  object dsUL: TDataSource
    DataSet = QueryUL
    Left = 304
    Top = 108
  end
  object QueryUL: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    StoreActive = False
    RequestLive = True
    SQL.Strings = (
      'SELECT u.*,t.name name_tip '
      '  FROM '#1057#1087#1088#1059#1083#1080#1094' u'
      '  LEFT JOIN '#1057#1087#1088#1058#1080#1087#1059#1083#1080#1094' t ON u.tip=t.id'
      'ORDER BY u.name')
    AdsConnection = dmBase.AdsConnection
    Left = 336
    Top = 108
    ParamData = <>
  end
end
