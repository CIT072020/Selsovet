object fmLogon: TfmLogon
  Left = 540
  Top = 229
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1093#1086#1076' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
  ClientHeight = 153
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefaultPosOnly
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 83
    Height = 16
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 47
    Width = 43
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edPassword: TEdit
    Left = 120
    Top = 43
    Width = 155
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
  end
  object pnBt: TPanel
    Left = 0
    Top = 112
    Width = 300
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object btOk: TBitBtn
      Left = 79
      Top = 6
      Width = 97
      Height = 25
      Caption = #1042#1093#1086#1076
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
      Left = 188
      Top = 6
      Width = 97
      Height = 25
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object pnPIN: TPanel
    Left = 0
    Top = 71
    Width = 300
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 11
      Width = 49
      Height = 16
      Caption = #1055#1048#1053'-'#1082#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edPIN: TMaskEdit
      Left = 120
      Top = 7
      Width = 152
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object edUser: TMaskEdit
    Left = 120
    Top = 12
    Width = 155
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object cbPswVisible: TDBCheckBoxEh
    Left = 73
    Top = 47
    Width = 15
    Height = 17
    Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1088#1086#1083#1100
    TabOrder = 4
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = cbPswVisibleClick
  end
  object Conn: TAdsConnection
    LoginPrompt = False
    Left = 16
    Top = 112
  end
end
