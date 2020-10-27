object fmGetGISUN1: TfmGetGISUN1
  Left = 477
  Top = 297
  BorderStyle = bsDialog
  Caption = #1047#1072#1087#1088#1086#1089' '#1076#1072#1085#1085#1099#1093' '#1080#1079' '#1043#1048#1057' '#1056#1053
  ClientHeight = 141
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lbDecl: TLabel
    Left = 20
    Top = 68
    Width = 182
    Height = 16
    Caption = #1048#1076#1077#1085#1090#1080#1092'. '#1085#1086#1084#1077#1088' '#1079#1072#1103#1074#1080#1090#1077#1083#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel: TBevel
    Left = 5
    Top = 58
    Width = 482
    Height = 6
    Shape = bsTopLine
  end
  object pn: TPanel
    Left = 0
    Top = 100
    Width = 492
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      492
      41)
    object btCancel: TBitBtn
      Left = 355
      Top = 8
      Width = 117
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079' - ESC'
      TabOrder = 1
      OnClick = btCancelClick
      Kind = bkCancel
    end
    object btOk: TBitBtn
      Left = 218
      Top = 8
      Width = 117
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' - F2'
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
  end
  object PanelIN: TPanel
    Left = 0
    Top = 0
    Width = 492
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lbINChild: TLabel
      Left = 20
      Top = 8
      Width = 185
      Height = 16
      Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edIN: TDBEditEh
      Left = 245
      Top = 6
      Width = 149
      Height = 24
      CharCase = ecUpperCase
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 0
      Visible = True
      EditMask = ''
    end
  end
  object cbDok: TDBCheckBoxEh
    Left = 21
    Top = 35
    Width = 345
    Height = 17
    Caption = #1057#1076#1072#1085' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1080#1081' '#1083#1080#1095#1085#1086#1089#1090#1100
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 3
    TabStop = False
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object edDecl: TDBEditEh
    Left = 245
    Top = 66
    Width = 149
    Height = 24
    CharCase = ecUpperCase
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 14
    ParentFont = False
    TabOrder = 1
    Visible = True
    EditMask = ''
  end
  object DataSource: TDataSource
    Left = 440
    Top = 8
  end
end
