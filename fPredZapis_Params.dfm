object fmPredZapis_Params: TfmPredZapis_Params
  Left = 408
  Top = 223
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
  ClientHeight = 342
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001001800680300001600000028000000100000002000
    0000010018000000000000030000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000084000000000000000000
    000000000000000000000000FF00000000000000000000000000000000000000
    00000000000000000084000000000000000000000000000000FF000000000000
    0000000000000000000000000000000000000000000000000000000084000000
    000000000000FF00000000000000000000000000000000000000000000000000
    00000000000000000000000000000084000000FF000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    FF00000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000FF000000000000008400000000000000000000
    0000000000000000000000000000000000000000000000000000FF0000000000
    0000000000000000840000000000000000000000000084840000000000000000
    0000000000000000000000000000000000000000000000000000008400000000
    0000000000008484008484000000000000000000000000000000000000000000
    0000000000000000000000000000000084840084840000000000000000000000
    0000000000000000000000000000000000000000000000000000000000848400
    8484008484000000000000000000000000000000000000000000000000000000
    0000000000000000000000000084840084840084840000000000000000000000
    0000000000000000000000000000000000000000000000848400848400000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    0000FFFF00009FCF00008F8F0000C71F0000E23F0000F07F0000F8FF0000F07B
    0000023100000700000067810000E7830000C7030000FC070000FE1F0000}
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object ImBtClear: TImage
    Left = 376
    Top = 11
    Width = 17
    Height = 17
    Picture.Data = {
      07544269746D6170C6000000424DC60000000000000076000000280000000A00
      00000A0000000100040000000000500000000000000000000000100000000000
      0000000000000000800000800000008080008000000080008000808000008080
      8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00888888888800000000888888080000008008888008000000800088008800
      0000880000088800000088800088880000008800000888000000800088008800
      000080088880080000008088888888000000}
    Visible = False
  end
  object lbMin: TLabel
    Left = 353
    Top = 73
    Width = 26
    Height = 16
    Caption = #1084#1080#1085'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbDay: TLabel
    Left = 36
    Top = 130
    Width = 91
    Height = 16
    Caption = #1087#1088#1080#1077#1084#1085#1099#1081' '#1076#1077#1085#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 298
    Width = 405
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      405
      44)
    object btOk: TBitBtn
      Left = 180
      Top = 11
      Width = 96
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      ModalResult = 1
      TabOrder = 0
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
      Left = 296
      Top = 11
      Width = 96
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object cbCheckNomer: TDBCheckBoxEh
    Left = 8
    Top = 42
    Width = 329
    Height = 17
    Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1089#1090#1080' '#1085#1086#1084#1077#1088#1072' '#1074' '#1078#1091#1088#1085#1072#1083#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object cbAutoRefresh: TDBCheckBoxEh
    Left = 8
    Top = 73
    Width = 281
    Height = 17
    Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1101#1082#1088#1072#1085#1072' '#1095#1077#1088#1077#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = cbAutoRefreshClick
  end
  object edMin: TDBNumberEditEh
    Left = 298
    Top = 69
    Width = 49
    Height = 24
    EditButton.Style = ebsUpDownEh
    EditButton.Visible = True
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxValue = 10.000000000000000000
    MinValue = 1.000000000000000000
    ParentFont = False
    TabOrder = 3
    Visible = True
  end
  object cbRaschetDay: TDBCheckBoxEh
    Left = 8
    Top = 104
    Width = 385
    Height = 17
    Caption = #1055#1088#1080' '#1087#1077#1095#1072#1090#1080' '#1090#1072#1083#1086#1085#1072'-'#1087#1088#1080#1075#1083#1072#1096#1077#1085#1080#1103' '#1088#1072#1089#1089#1095#1080#1090#1099#1074#1072#1090#1100' '#1076#1072#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = cbRaschetDayClick
  end
  object cbDay: TComboBox
    Left = 141
    Top = 127
    Width = 145
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 5
  end
  object cbOnlyWorkDays: TDBCheckBoxEh
    Left = 8
    Top = 12
    Width = 329
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1088#1072#1073#1086#1095#1080#1077' '#1076#1085#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object cbTalon: TGroupBox
    Left = 5
    Top = 155
    Width = 395
    Height = 142
    Caption = ' '#1058#1072#1083#1086#1085'-'#1087#1088#1080#1075#1083#1072#1096#1077#1085#1080#1077' '
    TabOrder = 7
    object Label1: TLabel
      Left = 12
      Top = 20
      Width = 129
      Height = 16
      Caption = #1058#1077#1083#1077#1092#1086#1085' '#1076#1083#1103' '#1089#1087#1088#1072#1074#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 12
      Top = 49
      Width = 83
      Height = 16
      Caption = #1042#1088#1077#1084#1103' '#1088#1072#1073#1086#1090#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 12
      Top = 78
      Width = 123
      Height = 16
      Caption = #1055#1086#1088#1103#1076#1086#1082' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 12
      Top = 109
      Width = 157
      Height = 23
      Hint = 
        #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1090#1077#1082#1089#1090' '#1074' '#1090#1072#1083#1086#1085#1077'-'#1087#1088#1080#1075#1083#1072#1096#1077#1085#1080#1080'  ('#1082#1086#1087#1080#1088#1091#1077#1090#1089#1103' '#1089' '#1075#1083#1072#1074#1085#1086#1075 +
        #1086' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072')'
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1090#1077#1082#1089#1090
      TabOrder = 0
      OnClick = Button1Click
    end
    object edTel: TEdit
      Left = 154
      Top = 16
      Width = 232
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edTimeWork: TEdit
      Left = 154
      Top = 45
      Width = 232
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edPorProv: TEdit
      Left = 154
      Top = 74
      Width = 232
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
end
