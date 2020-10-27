object fmGetGISUNR: TfmGetGISUNR
  Left = 410
  Top = 241
  BorderStyle = bsDialog
  Caption = #1047#1072#1087#1088#1086#1089' '#1076#1072#1085#1085#1099#1093' '#1080#1079' '#1043#1048#1057' '#1056#1053
  ClientHeight = 239
  ClientWidth = 592
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
    Top = 198
    Width = 592
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    DesignSize = (
      592
      41)
    object btCancel: TBitBtn
      Left = 466
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
      Left = 338
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
  object PanelDateR: TPanel
    Left = 0
    Top = 65
    Width = 592
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbDate: TLabel
      Left = 20
      Top = 7
      Width = 166
      Height = 16
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103' '#1088#1077#1073#1077#1085#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edDate: TDBDateTimeEditEh
      Left = 265
      Top = 3
      Width = 150
      Height = 24
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 0
      Visible = True
    end
  end
  object PanelPol: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbPol: TLabel
      Left = 20
      Top = 41
      Width = 87
      Height = 16
      Caption = #1055#1086#1083' '#1088#1077#1073#1077#1085#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbCheck: TLabel
      Left = 20
      Top = 10
      Width = 199
      Height = 16
      Caption = #1047#1072#1087#1088#1072#1096#1080#1074#1072#1090#1100' '#1048#1053' '#1076#1083#1103' '#1088#1077#1073#1077#1085#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edPol: TDBComboBoxEh
      Left = 265
      Top = 37
      Width = 150
      Height = 24
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        #1052#1091#1078#1089#1082#1086#1081
        #1046#1077#1085#1089#1082#1080#1081)
      KeyItems.Strings = (
        #1052
        #1046)
      ParentFont = False
      TabOrder = 1
      Visible = True
    end
    object edCheckINChild: TDBComboBoxEh
      Left = 265
      Top = 6
      Width = 64
      Height = 24
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        #1044#1072
        #1053#1077#1090)
      KeyItems.Strings = (
        '1'
        '0')
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnChange = edCheckINChildChange
    end
  end
  object pnIN: TPanel
    Left = 0
    Top = 98
    Width = 592
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object lbINChild: TLabel
      Left = 20
      Top = 6
      Width = 77
      Height = 16
      Caption = #1048#1053' '#1088#1077#1073#1077#1085#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edINChild: TDBEditEh
      Left = 265
      Top = 2
      Width = 150
      Height = 24
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
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
    Top = 131
    Width = 592
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object lbDok1: TLabel
      Left = 20
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
    object lbIN1: TLabel
      Left = 386
      Top = 7
      Width = 17
      Height = 16
      Caption = #1048#1053
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edIN1: TDBEditEh
      Left = 421
      Top = 3
      Width = 142
      Height = 24
      CharCase = ecUpperCase
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = True
      OnUpdateData = edIN1UpdateData
    end
    object edPasp1: TDBComboBoxEh
      Left = 116
      Top = 3
      Width = 252
      Height = 24
      DropDownBox.Rows = 15
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnChange = edPasp1Change
    end
  end
  object pnIN2: TPanel
    Left = 0
    Top = 166
    Width = 592
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object lbDok2: TLabel
      Left = 20
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
    object lbIN2: TLabel
      Left = 386
      Top = 7
      Width = 17
      Height = 16
      Caption = #1048#1053
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edIN2: TDBEditEh
      Left = 421
      Top = 3
      Width = 142
      Height = 24
      CharCase = ecUpperCase
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = True
      OnUpdateData = edIN1UpdateData
    end
    object edPasp2: TDBComboBoxEh
      Left = 116
      Top = 3
      Width = 252
      Height = 24
      DropDownBox.Rows = 15
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnChange = edPasp1Change
    end
  end
  object DataSource: TDataSource
    Left = 416
    Top = 40
  end
end
