object fmTypeCountMensAdres: TfmTypeCountMensAdres
  Left = 353
  Top = 191
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
  ClientHeight = 323
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rbPresent: TRadioGroup
    Left = 9
    Top = 57
    Width = 185
    Height = 81
    Caption = '  '#1055#1088#1080#1089#1091#1090#1089#1090#1074#1080#1077'  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
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
    Left = 201
    Top = 57
    Width = 185
    Height = 81
    Caption = '  '#1055#1088#1086#1087#1080#1089#1082#1072'  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #1053#1077#1074#1072#1078#1085#1086
      #1053#1077' '#1087#1091#1089#1090#1072#1103' '#1076#1072#1090#1072' '#1087#1088#1086#1087#1080#1089#1082#1080
      #1055#1091#1089#1090#1072#1103' '#1076#1072#1090#1072' '#1087#1088#1086#1087#1080#1089#1082#1080)
    ParentFont = False
    TabOrder = 1
  end
  object cbShow: TCheckBox
    Left = 8
    Top = 8
    Width = 321
    Height = 17
    Caption = #1043#1088#1072#1092#1072' '#1089' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086#1084' '#1087#1088#1086#1078#1080#1074#1072#1102#1097#1080#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object cbListMens: TCheckBox
    Left = 8
    Top = 34
    Width = 377
    Height = 17
    Caption = #1043#1088#1072#1092#1072' '#1089#1086' '#1089#1087#1080#1089#1082#1086#1084' '#1087#1088#1086#1078#1080#1074#1072#1102#1097#1080#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object cbNotRegistred: TCheckBox
    Left = 8
    Top = 182
    Width = 335
    Height = 17
    Caption = #1043#1088#1072#1092#1072' '#1089' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086#1084' '#1085#1077' '#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1085#1099#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object cbNameDom: TCheckBox
    Left = 8
    Top = 206
    Width = 335
    Height = 17
    Caption = #1043#1088#1072#1092#1072' '#1089' '#1085#1072#1079#1074#1072#1085#1080#1077#1084' '#1089#1090#1088#1086#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object cbDateP: TDBCheckBoxEh
    Left = 306
    Top = 54
    Width = 55
    Height = 17
    Caption = #1044#1072#1090#1072
    TabOrder = 6
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object cbNamePunkt: TCheckBox
    Left = 8
    Top = 231
    Width = 288
    Height = 17
    Caption = #1043#1088#1072#1092#1072' '#1089' '#1085#1072#1079#1074#1072#1085#1080#1077#1084' '#1085#1072#1089'.'#1087#1091#1085#1082#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object cbRnGor: TCheckBox
    Left = 8
    Top = 256
    Width = 335
    Height = 17
    Caption = #1043#1088#1072#1092#1072' '#1089' '#1085#1072#1079#1074#1072#1085#1080#1077#1084' '#1088#1072#1081#1086#1085#1072' '#1075#1086#1088#1086#1076#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object Panel1: TPanel
    Left = 0
    Top = 287
    Width = 394
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 9
    object Button1: TButton
      Left = 215
      Top = 6
      Width = 75
      Height = 25
      Caption = #1054#1050
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 303
      Top = 6
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object cbOwners: TCheckBox
    Left = 8
    Top = 142
    Width = 335
    Height = 17
    Caption = #1043#1088#1072#1092#1072' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object cbAddTail: TCheckBox
    Left = 28
    Top = 161
    Width = 125
    Height = 17
    Caption = #1044#1086#1083#1103'('#1095#1072#1089#1090#1100')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
  end
  object cbAddAdres: TCheckBox
    Left = 178
    Top = 161
    Width = 167
    Height = 17
    Caption = #1040#1076#1088#1077#1089' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
  end
end
