object fmDeleteAkt: TfmDeleteAkt
  Left = 512
  Top = 248
  BorderStyle = bsDialog
  Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1080' '#1072#1082#1090#1086#1074
  ClientHeight = 229
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 21
    Width = 96
    Height = 16
    Caption = #1058#1080#1087' '#1079#1072#1087#1080#1089#1080' '#1072#1082#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 55
    Width = 95
    Height = 16
    Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 89
    Width = 87
    Height = 16
    Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbPodr: TLabel
    Left = 41
    Top = 151
    Width = 91
    Height = 16
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object cbType: TComboBox
    Left = 144
    Top = 16
    Width = 249
    Height = 26
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 18
    ParentFont = False
    TabOrder = 0
  end
  object edDate1: TDBDateTimeEditEh
    Left = 144
    Top = 50
    Width = 121
    Height = 26
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 1
    Visible = True
  end
  object edDate2: TDBDateTimeEditEh
    Left = 144
    Top = 84
    Width = 121
    Height = 26
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 2
    Visible = True
  end
  object cbAll: TDBCheckBoxEh
    Left = 16
    Top = 127
    Width = 193
    Height = 17
    Caption = #1042#1089#1077' '#1079#1072#1087#1080#1089#1080
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 3
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = cbAllClick
  end
  object cbPodr: TComboBox
    Left = 144
    Top = 146
    Width = 66
    Height = 26
    Style = csDropDownList
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 18
    ParentFont = False
    TabOrder = 4
  end
  object btOk: TBitBtn
    Left = 169
    Top = 192
    Width = 100
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 5
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 293
    Top = 192
    Width = 100
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 6
    Kind = bkCancel
  end
end
