object fmChoiceUL: TfmChoiceUL
  Left = 307
  Top = 224
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1091#1083#1080#1094#1091
  ClientHeight = 99
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 11
    Width = 19
    Height = 13
    Caption = #1058#1080#1087
  end
  object Label2: TLabel
    Left = 16
    Top = 37
    Width = 32
    Height = 13
    Caption = #1059#1083#1080#1094#1072
  end
  object edNameUL: TDBLookupComboboxEh
    Left = 64
    Top = 34
    Width = 190
    Height = 21
    DropDownBox.Columns = <
      item
        FieldName = 'TIP_UL'
        Title.Caption = #1058#1080#1087
        Width = 70
      end
      item
        FieldName = 'NAME_UL'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 200
      end>
    DropDownBox.Rows = 15
    DropDownBox.ShowTitles = True
    EditButtons = <>
    KeyField = 'ID'
    ListField = 'NAME_UL'
    ListSource = dsUL
    TabOrder = 0
    Visible = True
    OnChange = edNameULChange
  end
  object btOk: TBitBtn
    Left = 151
    Top = 66
    Width = 83
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100
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
    Left = 248
    Top = 66
    Width = 83
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
  object btAdd: TButton
    Left = 270
    Top = 33
    Width = 61
    Height = 20
    Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1077#1089#1091#1097#1077#1089#1090#1074#1091#1102#1096#1091#1102' '#1091#1083#1080#1094#1091'  ( INSERT )'
    Caption = #1053#1086#1074#1072#1103
    TabOrder = 3
    OnClick = btAddClick
  end
  object edTipUL: TDBEditEh
    Left = 64
    Top = 8
    Width = 121
    Height = 21
    EditButtons = <>
    TabOrder = 4
    Text = 'edTipUL'
    Visible = True
  end
  object dsUL: TDataSource
    DataSet = Query
    Left = 232
  end
  object Query: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    StoreActive = False
    SQL.Strings = (
      'SELECT ul.ID, t.Name TIP_UL,ul.Name NAME_UL  FROM '#1057#1087#1088#1059#1083#1080#1094' ul'
      '    LEFT OUTER JOIN '#1057#1087#1088#1058#1080#1087#1059#1083#1080#1094' t ON t.id=ul.tip')
    AdsConnection = dmBase.AdsConnection
    Left = 8
    Top = 56
    ParamData = <>
  end
end
