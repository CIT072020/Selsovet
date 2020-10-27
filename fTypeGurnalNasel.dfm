object fmTypeGurnalNasel: TfmTypeGurnalNasel
  Left = 442
  Top = 216
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
  ClientHeight = 430
  ClientWidth = 390
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
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 203
    Top = 394
    Width = 75
    Height = 25
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 297
    Top = 394
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
  object cbParent: TCheckBox
    Left = 13
    Top = 57
    Width = 363
    Height = 17
    Caption = #1043#1088#1072#1092#1099' c '#1088#1086#1076#1080#1090#1077#1083#1103#1084#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = cbParentClick
  end
  object cbMR: TCheckBox
    Left = 13
    Top = 32
    Width = 363
    Height = 17
    Caption = #1043#1088#1072#1092#1072' '#1084#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object gbDeti: TGroupBox
    Left = 5
    Top = 180
    Width = 380
    Height = 120
    Caption = 'gbDeti'
    Color = clBtnFace
    ParentColor = False
    TabOrder = 6
    object Label1: TLabel
      Left = 23
      Top = 53
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
      Top = 53
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
      Top = 21
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
      Top = 21
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
      Top = 49
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
      Top = 49
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
      Top = 85
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
      Top = 83
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
      Top = 25
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
      Top = 25
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
      Top = 17
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
    Top = 177
    Width = 130
    Height = 17
    Caption = #1043#1088#1072#1092#1072' c '#1076#1077#1090#1100#1084#1080
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 5
    OnClick = cbDetiClick
  end
  object cbUnionFIO: TCheckBox
    Left = 13
    Top = 307
    Width = 363
    Height = 17
    Caption = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100' '#1060#1048#1054' '#1074' '#1086#1076#1085#1091' '#1075#1088#1072#1092#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object cbUnionAdres: TCheckBox
    Left = 13
    Top = 329
    Width = 377
    Height = 17
    Caption = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100' '#1072#1076#1088#1077#1089' '#1074' '#1086#1076#1085#1091' '#1075#1088#1072#1092#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object cbUnionPasp: TCheckBox
    Left = 13
    Top = 352
    Width = 377
    Height = 17
    Caption = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100' '#1087#1072#1089#1087#1086#1088#1090#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1074' '#1086#1076#1085#1091' '#1075#1088#1072#1092#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object cbUL: TCheckBox
    Left = 13
    Top = 153
    Width = 363
    Height = 17
    Caption = #1043#1088#1072#1092#1072' '#1089' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1077#1085#1080#1077#1084' '#1083#1100#1075#1086#1090#1085#1080#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object cbParentDATER: TCheckBox
    Left = 37
    Top = 77
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
    Top = 130
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
    Top = 113
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
    Top = 95
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
end
