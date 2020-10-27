object fmTypeCountMens: TfmTypeCountMens
  Left = 429
  Top = 166
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
  ClientHeight = 471
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object rbPresent: TRadioGroup
    Left = 28
    Top = 74
    Width = 187
    Height = 82
    Caption = '  '#1055#1088#1080#1089#1091#1090#1089#1090#1074#1080#1077'  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #1053#1077#1074#1072#1078#1085#1086
      #1055#1088#1080#1089#1091#1090#1089#1090#1074#1091#1102#1097#1080#1077
      #1042#1088#1077#1084#1077#1085#1085#1086' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1102#1097#1080#1077)
    ParentFont = False
    TabOrder = 0
    OnClick = rbPresentClick
  end
  object rbPropis: TRadioGroup
    Left = 381
    Top = 74
    Width = 122
    Height = 82
    Caption = '  '#1044#1072#1090#1072' '#1087#1088#1086#1087#1080#1089#1082#1080'  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #1053#1077#1074#1072#1078#1085#1086
      #1053#1077' '#1087#1091#1089#1090#1072#1103
      #1055#1091#1089#1090#1072#1103)
    ParentFont = False
    TabOrder = 1
  end
  object cbShow: TCheckBox
    Left = 8
    Top = 8
    Width = 377
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1075#1088#1072#1092#1091' '#1086' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1077' '#1095#1083#1077#1085#1086#1074' '#1093#1086#1079#1103#1081#1089#1090#1074#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 324
    Top = 425
    Width = 75
    Height = 25
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 418
    Top = 425
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
  end
  object cbListMens: TCheckBox
    Left = 8
    Top = 34
    Width = 377
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1075#1088#1072#1092#1091' '#1089#1086' '#1089#1087#1080#1089#1082#1086#1084' '#1095#1083#1077#1085#1086#1074' '#1093#1086#1079#1103#1081#1089#1090#1074#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object rbZareg: TRadioGroup
    Left = 219
    Top = 74
    Width = 158
    Height = 82
    Caption = ' '#1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #1053#1077#1074#1072#1078#1085#1086
      #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085
      #1053#1077' '#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085)
    ParentFont = False
    TabOrder = 6
  end
  object gbVozr: TGroupBox
    Left = 28
    Top = 157
    Width = 477
    Height = 41
    Caption = ' '#1042#1086#1079#1088#1072#1089#1090' '
    TabOrder = 7
    object Label1: TLabel
      Left = 153
      Top = 16
      Width = 15
      Height = 13
      Caption = ' '#1086#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 239
      Top = 16
      Width = 13
      Height = 13
      Caption = #1076#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edVozr1: TDBNumberEditEh
      Left = 176
      Top = 12
      Width = 55
      Height = 24
      DecimalPlaces = 0
      EditButton.Style = ebsUpDownEh
      EditButton.Visible = True
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 150.000000000000000000
      MinValue = -1.000000000000000000
      ParentFont = False
      TabOrder = 1
      Visible = True
    end
    object edVozr2: TDBNumberEditEh
      Left = 263
      Top = 12
      Width = 55
      Height = 24
      DecimalPlaces = 0
      EditButton.Style = ebsUpDownEh
      EditButton.Visible = True
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 999.000000000000000000
      MinValue = -1.000000000000000000
      ParentFont = False
      TabOrder = 2
      Visible = True
    end
    object cbNotVozr1: TCheckBox
      Left = 322
      Top = 14
      Width = 31
      Height = 21
      Caption = #1053#1077#1074#1072#1078#1085#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
    end
    object cbAllMens: TCheckBox
      Left = 329
      Top = 15
      Width = 133
      Height = 17
      Hint = 
        #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1091#1089#1090#1072#1085#1086#1074#1082#1091' '#1074#1086#1079#1088#1072#1089#1090#1072' '#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1086#1090#1073#1086#1088#1072', '#1074' '#1089#1087#1080#1089#1086#1082' '#1074#1082#1083#1102 +
        #1095#1072#1090#1100' '#1074#1089#1077#1093
      Caption = #1058#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1086#1090#1073#1086#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object cbVozr: TComboBox
      Left = 10
      Top = 14
      Width = 128
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 3
      TabOrder = 4
      Text = #1058#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1099#1081
      Items.Strings = (
        #1053#1077#1074#1072#1078#1085#1086
        #1047#1085#1072#1095#1077#1085#1080#1077
        #1052#1083#1072#1076#1096#1077' '#1090#1088#1091#1076#1086#1089#1087'.'
        #1058#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1099#1081
        #1057#1090#1072#1088#1096#1077' '#1090#1088#1091#1076#1086#1089#1087'.'
        #1053#1077#1090#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1099#1081)
    end
  end
  object cbOwners: TCheckBox
    Left = 8
    Top = 353
    Width = 377
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1075#1088#1072#1092#1091' '#1089#1086' '#1089#1087#1080#1089#1082#1086#1084' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object cbUnionFIO: TCheckBox
    Left = 8
    Top = 377
    Width = 377
    Height = 17
    Caption = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100' '#1060#1048#1054' '#1074' '#1086#1076#1085#1091' '#1075#1088#1072#1092#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object GroupBox1: TGroupBox
    Left = 28
    Top = 201
    Width = 477
    Height = 140
    Caption = ' '#1042#1082#1083#1102#1095#1072#1090#1100' '
    TabOrder = 10
    object cbOtnosh: TCheckBox
      Left = 16
      Top = 15
      Width = 227
      Height = 17
      Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077' '#1082' '#1075#1083#1072#1074#1077' '#1093#1086#1079#1103#1081#1089#1090#1074#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cbDateR: TCheckBox
      Left = 16
      Top = 34
      Width = 222
      Height = 17
      Caption = #1044#1072#1090#1091' '#1088#1086#1078#1076#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object cbLgot: TCheckBox
      Left = 16
      Top = 113
      Width = 237
      Height = 17
      Caption = #1051#1100#1075#1086#1090#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object cbDateP: TCheckBox
      Left = 16
      Top = 54
      Width = 222
      Height = 17
      Caption = #1044#1072#1090#1091' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object cbIN: TCheckBox
      Left = 16
      Top = 73
      Width = 237
      Height = 19
      Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object cbPasp: TCheckBox
      Left = 16
      Top = 93
      Width = 237
      Height = 19
      Caption = #1055#1072#1089#1087#1086#1088#1090#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
  object cbAddFirst: TCheckBox
    Left = 28
    Top = 55
    Width = 241
    Height = 17
    Hint = #1042#1082#1083#1102#1095#1072#1090#1100' '#1075#1083#1072#1074#1091' '#1093#1086#1079#1103#1081#1090#1089#1074#1072' '#1074' '#1089#1087#1080#1089#1086#1082' '#1089#1086#1089#1090#1072#1074#1072' '#1089#1077#1084#1100#1080
    Caption = #1043#1083#1072#1074#1072' '#1093#1086#1079#1103#1081#1089#1090#1074#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
  end
  object cbUnionAdres: TCheckBox
    Left = 8
    Top = 401
    Width = 377
    Height = 17
    Caption = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100' '#1072#1076#1088#1077#1089' '#1074' '#1086#1076#1085#1091' '#1075#1088#1072#1092#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
  end
end
