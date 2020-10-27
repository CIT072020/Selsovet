object fmGetGISUN: TfmGetGISUN
  Left = 454
  Top = 296
  BorderStyle = bsDialog
  Caption = #1047#1072#1087#1088#1086#1089' '#1076#1072#1085#1085#1099#1093' '#1080#1079' '#1043#1048#1057' '#1056#1053
  ClientHeight = 221
  ClientWidth = 340
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
  object pn: TPanel
    Left = 0
    Top = 180
    Width = 340
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    DesignSize = (
      340
      41)
    object btCancel: TBitBtn
      Left = 214
      Top = 8
      Width = 110
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079' - ESC'
      TabOrder = 1
      OnClick = btCancelClick
      Kind = bkCancel
    end
    object btOk: TBitBtn
      Left = 86
      Top = 8
      Width = 110
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' - F2'
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
  object pnIN: TPanel
    Left = 0
    Top = 0
    Width = 340
    Height = 40
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
      Left = 12
      Top = 13
      Width = 56
      Height = 16
      Caption = #1056#1077#1073#1077#1085#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edINChild: TDBEditEh
      Left = 173
      Top = 9
      Width = 150
      Height = 26
      HelpContext = 888
      CharCase = ecUpperCase
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnUpdateData = edIN1UpdateData
    end
  end
  object pnIN1: TPanel
    Left = 0
    Top = 40
    Width = 340
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbPasp1: TLabel
      Left = 12
      Top = 7
      Width = 33
      Height = 16
      Caption = #1054#1090#1077#1094
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edIN1: TDBEditEh
      Left = 173
      Top = 3
      Width = 150
      Height = 26
      CharCase = ecUpperCase
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnUpdateData = edIN1UpdateData
    end
  end
  object pnIN2: TPanel
    Left = 0
    Top = 75
    Width = 340
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lbPasp2: TLabel
      Left = 12
      Top = 7
      Width = 33
      Height = 16
      Caption = #1052#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edIN2: TDBEditEh
      Left = 173
      Top = 3
      Width = 150
      Height = 26
      CharCase = ecUpperCase
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnUpdateData = edIN1UpdateData
    end
  end
  object pnIN3: TPanel
    Left = 0
    Top = 110
    Width = 340
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object lbPasp3: TLabel
      Left = 12
      Top = 7
      Width = 89
      Height = 16
      Caption = #1059#1089#1099#1085#1086#1074#1080#1090#1077#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edIN3: TDBEditEh
      Left = 173
      Top = 3
      Width = 150
      Height = 26
      CharCase = ecUpperCase
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnUpdateData = edIN1UpdateData
    end
  end
  object pnIN4: TPanel
    Left = 0
    Top = 145
    Width = 340
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object lbPasp4: TLabel
      Left = 12
      Top = 7
      Width = 121
      Height = 16
      Caption = #1059#1089#1099#1085#1086#1074#1080#1090#1077#1083#1100#1085#1080#1094#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edIN4: TDBEditEh
      Left = 173
      Top = 3
      Width = 150
      Height = 26
      HelpContext = 999
      CharCase = ecUpperCase
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnUpdateData = edIN1UpdateData
    end
  end
  object DataSource: TDataSource
    Left = 120
    Top = 32
  end
end
