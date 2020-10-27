object fmNewNomerAkt: TfmNewNomerAkt
  Left = 471
  Top = 334
  ActiveControl = edNomer
  BorderStyle = bsDialog
  Caption = #1053#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072
  ClientHeight = 156
  ClientWidth = 504
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lbNomer: TLabel
    Left = 14
    Top = 16
    Width = 43
    Height = 16
    Caption = #1053#1086#1084#1077#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 14
    Top = 48
    Width = 33
    Height = 16
    Caption = #1044#1072#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbOrgan: TLabel
    Left = 14
    Top = 80
    Width = 39
    Height = 16
    Caption = #1054#1088#1075#1072#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbSvid1: TLabel
    Left = 182
    Top = 16
    Width = 101
    Height = 16
    Caption = #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object lbSvid2: TLabel
    Left = 392
    Top = 16
    Width = 15
    Height = 16
    Caption = #8470
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lbNomer2: TLabel
    Left = 214
    Top = 48
    Width = 8
    Height = 16
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object btOk: TBitBtn
    Left = 295
    Top = 118
    Width = 90
    Height = 25
    Hint = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1087#1080#1089#1100' (F2)'
    Caption = #1057#1086#1079#1076#1072#1090#1100
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
    Left = 399
    Top = 118
    Width = 90
    Height = 25
    Cancel = True
    Caption = #1054#1090#1082#1072#1079
    ModalResult = 2
    TabOrder = 1
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object edNomer: TDBNumberEditEh
    Left = 78
    Top = 12
    Width = 81
    Height = 24
    HelpContext = 888
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = True
  end
  object edDate: TDBDateTimeEditEh
    Left = 78
    Top = 44
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
    TabOrder = 3
    Visible = True
  end
  object edOrgan: TDBLookupComboboxEh
    Left = 78
    Top = 76
    Width = 411
    Height = 24
    HelpContext = 999
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = dsOrgan
    ParentFont = False
    TabOrder = 4
    Visible = True
  end
  object edSvid_Seria: TDBLookupComboboxEh
    Left = 308
    Top = 12
    Width = 69
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'SERIA'
    ListField = 'SERIA'
    ListSource = dsSeria
    ParentFont = False
    TabOrder = 5
    Visible = False
  end
  object edSvid_Nomer: TDBEditEh
    Left = 411
    Top = 12
    Width = 72
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
  end
  object edNomer2: TDBNumberEditEh
    Left = 227
    Top = 44
    Width = 81
    Height = 24
    HelpContext = 888
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Visible = False
  end
  object dsOrgan: TDataSource
    DataSet = dmBase.SprNames
    Left = 136
    Top = 112
  end
  object dsSeria: TDataSource
    DataSet = dmBase.SvidSeria
    Left = 56
    Top = 112
  end
end
