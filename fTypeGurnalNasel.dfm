object fmTypeGurnalNasel: TfmTypeGurnalNasel
  Left = 520
  Top = 71
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
  ClientHeight = 684
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cbPrib: TCheckBox
    Left = 13
    Top = 8
    Width = 363
    Height = 17
    Caption = #1043#1088#1072#1092#1072' '#1086#1090#1082#1091#1076#1072' '#1087#1088#1080#1073#1099#1083'/'#1082#1091#1076#1072' '#1091#1073#1099#1083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 338
    Top = 651
    Width = 75
    Height = 25
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 432
    Top = 651
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
  object cbParent: TCheckBox
    Left = 13
    Top = 60
    Width = 363
    Height = 17
    Caption = #1043#1088#1072#1092#1099' c '#1088#1086#1076#1080#1090#1077#1083#1103#1084#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = cbParentClick
  end
  object cbMR: TCheckBox
    Left = 13
    Top = 42
    Width = 363
    Height = 17
    Caption = #1043#1088#1072#1092#1072' '#1084#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object gbDeti: TGroupBox
    Left = 5
    Top = 164
    Width = 380
    Height = 85
    Caption = 'gbDeti'
    Color = clBtnFace
    ParentColor = False
    TabOrder = 6
    object Label1: TLabel
      Left = 23
      Top = 35
      Width = 60
      Height = 16
      Caption = #1042#1086#1079#1088#1072#1089#1090'  '#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 147
      Top = 35
      Width = 14
      Height = 16
      Caption = #1076#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 224
      Top = 13
      Width = 117
      Height = 16
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1073#1086#1083#1100#1096#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label4: TLabel
      Left = 312
      Top = 13
      Width = 57
      Height = 16
      Caption = #1080' '#1084#1077#1085#1100#1096#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object edVozr1: TDBNumberEditEh
      Left = 105
      Top = 31
      Width = 31
      Height = 24
      DecimalPlaces = 0
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Value = 0.000000000000000000
      Visible = True
    end
    object edVozr2: TDBNumberEditEh
      Left = 176
      Top = 31
      Width = 31
      Height = 24
      DecimalPlaces = 0
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Value = 18.000000000000000000
      Visible = True
    end
    object cbDetiOtnosh: TCheckBox
      Left = 23
      Top = 59
      Width = 97
      Height = 17
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1090#1085#1086#1096#1077#1085#1080#1077' ('#1076#1086#1095#1100','#1089#1099#1085')'
      Caption = #1086#1090#1085#1086#1096#1077#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edDetiGod: TComboBox
      Left = 145
      Top = 57
      Width = 145
      Height = 21
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' ('#1075#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103',...)'
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = #1043#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
      Items.Strings = (
        #1043#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
        #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        #1042#1086#1079#1088#1072#1089#1090
        #1053#1080#1095#1077#1075#1086)
    end
    object cbOnlyMama: TCheckBox
      Left = 24
      Top = 14
      Width = 137
      Height = 17
      Hint = #1042#1099#1074#1086#1076#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1084#1072#1084
      Caption = #1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1084#1072#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object edKolvo111: TDBNumberEditEh
      Left = 278
      Top = 31
      Width = 27
      Height = 24
      DecimalPlaces = 0
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Value = 0.000000000000000000
      Visible = False
    end
    object edKolvo222: TDBNumberEditEh
      Left = 326
      Top = 9
      Width = 27
      Height = 24
      DecimalPlaces = 0
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Value = 0.000000000000000000
      Visible = False
    end
  end
  object cbDeti: TCheckBox
    Left = 13
    Top = 161
    Width = 130
    Height = 17
    Caption = #1043#1088#1072#1092#1072' c '#1076#1077#1090#1100#1084#1080
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 5
    OnClick = cbDetiClick
  end
  object cbUnionFIO: TCheckBox
    Left = 13
    Top = 590
    Width = 363
    Height = 17
    Caption = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100' '#1060#1048#1054' '#1074' '#1086#1076#1085#1091' '#1075#1088#1072#1092#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object cbUnionAdres: TCheckBox
    Left = 13
    Top = 607
    Width = 377
    Height = 17
    Caption = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100' '#1072#1076#1088#1077#1089' '#1074' '#1086#1076#1085#1091' '#1075#1088#1072#1092#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object cbUnionPasp: TCheckBox
    Left = 13
    Top = 624
    Width = 377
    Height = 17
    Caption = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100' '#1087#1072#1089#1087#1086#1088#1090#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1074' '#1086#1076#1085#1091' '#1075#1088#1072#1092#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object cbUL: TCheckBox
    Left = 13
    Top = 144
    Width = 363
    Height = 17
    Caption = #1043#1088#1072#1092#1072' '#1089' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1077#1085#1080#1077#1084' '#1083#1100#1075#1086#1090#1085#1080#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
  end
  object cbParentDATER: TCheckBox
    Left = 37
    Top = 78
    Width = 322
    Height = 17
    Caption = #1076#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
  end
  object cbParentWORK: TCheckBox
    Left = 37
    Top = 128
    Width = 322
    Height = 17
    Caption = #1084#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099' '#1080' '#1076#1086#1083#1078#1085#1086#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
  end
  object cbParentPASP: TCheckBox
    Left = 37
    Top = 111
    Width = 322
    Height = 17
    Caption = #1087#1072#1089#1087#1086#1088#1090#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
  end
  object cbParentIN: TCheckBox
    Left = 37
    Top = 94
    Width = 322
    Height = 17
    Caption = #1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
  end
  object cbShow: TCheckBox
    Left = 13
    Top = 254
    Width = 377
    Height = 17
    Caption = #1043#1088#1072#1092#1072' '#1086' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1077' '#1095#1083#1077#1085#1086#1074' '#1093#1086#1079#1103#1081#1089#1090#1074#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
  end
  object cbListMens: TCheckBox
    Left = 13
    Top = 271
    Width = 377
    Height = 17
    Caption = #1043#1088#1072#1092#1072' '#1089#1086' '#1089#1087#1080#1089#1082#1086#1084' '#1095#1083#1077#1085#1086#1074' '#1093#1086#1079#1103#1081#1089#1090#1074#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
  end
  object rbPresent: TRadioGroup
    Left = 28
    Top = 287
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
    TabOrder = 17
  end
  object rbZareg: TRadioGroup
    Left = 219
    Top = 287
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
    TabOrder = 18
  end
  object rbPropis: TRadioGroup
    Left = 381
    Top = 287
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
    TabOrder = 19
  end
  object gbVozr: TGroupBox
    Left = 28
    Top = 368
    Width = 477
    Height = 44
    Caption = ' '#1042#1086#1079#1088#1072#1089#1090' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 20
    object Label5: TLabel
      Left = 153
      Top = 22
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
    object Label6: TLabel
      Left = 239
      Top = 22
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
    object edVozrC1: TDBNumberEditEh
      Left = 176
      Top = 16
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
    object edVozrC2: TDBNumberEditEh
      Left = 263
      Top = 16
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
    object cbNotVozrC1: TCheckBox
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
      Top = 20
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
      Top = 16
      Width = 128
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
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
  object GroupBox1: TGroupBox
    Left = 28
    Top = 411
    Width = 477
    Height = 153
    Caption = ' '#1044#1086#1073#1072#1074#1083#1103#1090#1100' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
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
      Top = 31
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
      Top = 114
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
      Top = 48
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
      Top = 64
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
      Top = 81
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
    object cbPrizn: TCheckBox
      Left = 16
      Top = 131
      Width = 237
      Height = 17
      Caption = #1055#1088#1080#1079#1085#1072#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object cbWork: TCheckBox
      Left = 16
      Top = 97
      Width = 237
      Height = 19
      Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
  end
  object cbAddCurMen: TCheckBox
    Left = 28
    Top = 568
    Width = 485
    Height = 17
    Hint = #1042#1082#1083#1102#1095#1072#1090#1100' '#1075#1083#1072#1074#1091' '#1093#1086#1079#1103#1081#1090#1089#1074#1072' '#1074' '#1089#1087#1080#1089#1086#1082' '#1089#1086#1089#1090#1072#1074#1072' '#1089#1077#1084#1100#1080
    Caption = #1042#1082#1083#1102#1095#1072#1090#1100' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1095#1077#1083#1086#1074#1077#1082#1072' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072' '#1074' '#1089#1087#1080#1089#1086#1082' '#1095#1083#1077#1085#1086#1074' '#1093#1086#1079#1103#1081#1089#1090#1074#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 22
  end
  object cbPriznMen: TCheckBox
    Left = 13
    Top = 25
    Width = 363
    Height = 17
    Caption = #1043#1088#1072#1092#1072' '#1089' '#1087#1088#1080#1079#1085#1072#1082#1072#1084#1080' '#1095#1077#1083#1086#1074#1077#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 23
  end
end
