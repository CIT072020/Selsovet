object fmAddUL: TfmAddUL
  Left = 398
  Top = 308
  BorderStyle = bsDialog
  Caption = #1053#1086#1074#1072#1103' '#1091#1083#1080#1094#1072
  ClientHeight = 101
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 13
    Width = 19
    Height = 13
    Caption = #1058#1080#1087
  end
  object Label2: TLabel
    Left = 16
    Top = 39
    Width = 32
    Height = 13
    Caption = #1059#1083#1080#1094#1072
  end
  object btOk: TBitBtn
    Left = 151
    Top = 66
    Width = 83
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100
    Default = True
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
    Left = 248
    Top = 66
    Width = 83
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 1
    Kind = bkCancel
  end
  object edNameUL: TDBEditEh
    Left = 64
    Top = 34
    Width = 195
    Height = 22
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Flat = True
    ParentFont = False
    TabOrder = 2
    Visible = True
  end
  object edTipUL: TDBLookupComboboxEh
    Left = 64
    Top = 8
    Width = 138
    Height = 22
    DropDownBox.Rows = 10
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Flat = True
    KeyField = 'ID'
    ListField = 'FNAME'
    ListSource = DataSource
    ParentFont = False
    TabOrder = 3
    Visible = True
  end
  object DataSource: TDataSource
    DataSet = dmBase.SprTypeUl
    Left = 272
    Top = 16
  end
end
