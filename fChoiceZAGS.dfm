object fmChoiceZAGS: TfmChoiceZAGS
  Left = 419
  Top = 228
  BorderStyle = bsDialog
  Caption = #1047#1040#1043#1057
  ClientHeight = 426
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  DesignSize = (
    392
    426)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 14
    Width = 60
    Height = 13
    Caption = #1058#1077#1088#1088#1080#1090#1086#1088#1080#1103
  end
  object Label2: TLabel
    Left = 16
    Top = 60
    Width = 101
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086'-'#1088#1091#1089#1089#1082#1080
  end
  object Label3: TLabel
    Left = 16
    Top = 107
    Width = 125
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086'-'#1073#1077#1083#1086#1088#1091#1089#1089#1082#1080
  end
  object Label4: TLabel
    Left = 16
    Top = 153
    Width = 34
    Height = 13
    Caption = #1064#1090#1072#1084#1087
  end
  object edSOATO: TDBLookupComboboxEh
    Left = 16
    Top = 29
    Width = 361
    Height = 21
    DropDownBox.Rows = 16
    EditButton.Style = ebsEllipsisEh
    EditButtons = <>
    KeyField = 'KOD'
    ListField = 'KOD;NAME'
    ListSource = DataSource1
    TabOrder = 0
    Visible = True
    OnChange = edSOATOChange
  end
  object edNameRus: TDBEditEh
    Left = 16
    Top = 75
    Width = 355
    Height = 21
    EditButtons = <>
    TabOrder = 1
    Text = 'edNameRus'
    Visible = True
  end
  object edNameBel: TDBEditEh
    Left = 16
    Top = 122
    Width = 355
    Height = 21
    EditButtons = <>
    TabOrder = 2
    Text = 'edNameBel'
    Visible = True
  end
  object btOk: TBitBtn
    Left = 172
    Top = 390
    Width = 89
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    TabOrder = 4
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
    Left = 284
    Top = 390
    Width = 89
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 5
    Kind = bkCancel
  end
  object cbHandled: TDBCheckBoxEh
    Left = 241
    Top = 6
    Width = 121
    Height = 17
    Caption = #1042#1074#1077#1089#1090#1080' '#1074#1088#1091#1095#1085#1091#1102
    TabOrder = 6
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = cbHandledClick
  end
  object edShtamp: TMemo
    Left = 16
    Top = 171
    Width = 355
    Height = 204
    Lines.Strings = (
      '')
    ScrollBars = ssVertical
    TabOrder = 3
    WordWrap = False
  end
  object DataSource1: TDataSource
    DataSet = Query
    Left = 360
    Top = 56
  end
  object Query: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    StoreActive = False
    AdsConnection = dmBase.AdsConnection
    Left = 288
    Top = 200
    ParamData = <>
  end
  object QuerySeek: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    StoreActive = False
    AdsTableOptions.AdsIndexPageSize = 512
    SQL.Strings = (
      'SELECT ID '
      '   FROM SprNames '
      '   WHERE Substring(SOATO,1,2)='#39'90'#39
      '   ORDER BY ID DESC')
    AdsConnection = dmBase.AdsConnection
    Left = 184
    Top = 200
    ParamData = <>
  end
end
