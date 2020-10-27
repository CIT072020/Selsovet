inherited fmCheckAkt: TfmCheckAkt
  Left = 489
  Top = 239
  Caption = '!!!'
  ClientHeight = 336
  ClientWidth = 437
  ShowHint = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImBtClear: TImage
    Left = 20
    Top = 27
  end
  object Label1: TLabel [1]
    Left = 12
    Top = 11
    Width = 78
    Height = 16
    Caption = #1047#1072#1087#1080#1089#1080' '#1072#1082#1090#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbDate1: TLabel [2]
    Left = 12
    Top = 187
    Width = 93
    Height = 16
    Caption = #1055#1077#1088#1080#1086#1076'           '#1089
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbDate2: TLabel [3]
    Left = 225
    Top = 187
    Width = 14
    Height = 16
    Caption = #1087#1086
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbZags: TLabel [4]
    Left = 12
    Top = 218
    Width = 30
    Height = 16
    Caption = #1047#1040#1043#1057
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbPodr: TLabel [5]
    Left = 34
    Top = 267
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
  inherited Panel1: TPanel
    Top = 296
    Width = 437
    Height = 40
    inherited btOk: TBitBtn
      Left = 212
      Top = 7
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    end
    inherited btCancel: TBitBtn
      Left = 328
      Top = 7
    end
  end
  object cbTypes: TCheckListBox
    Left = 116
    Top = 11
    Width = 233
    Height = 161
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    Items.Strings = (
      #1086' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1080' '#1073#1088#1072#1082#1072)
    ParentFont = False
    TabOrder = 1
  end
  object edDate1: TDBDateTimeEditEh
    Left = 116
    Top = 183
    Width = 97
    Height = 24
    Enabled = False
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 2
    Visible = True
  end
  object edDate2: TDBDateTimeEditEh
    Left = 252
    Top = 183
    Width = 97
    Height = 24
    Enabled = False
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 3
    Visible = True
  end
  object cbRun: TCheckBox
    Left = 12
    Top = 246
    Width = 233
    Height = 17
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1091#1073#1083#1080#1082#1072#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = cbRunClick
  end
  object cbDate: TCheckBox
    Left = 69
    Top = 188
    Width = 17
    Height = 17
    Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1087#1088#1086#1074#1077#1088#1082#1091' '#1079#1072' '#1087#1077#1088#1080#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = cbDateClick
  end
  object cbZags: TCheckBox
    Left = 69
    Top = 218
    Width = 17
    Height = 17
    Hint = #1055#1088#1086#1074#1077#1088#1082#1072' '#1076#1083#1103' '#1082#1086#1085#1082#1088#1077#1090#1085#1086#1075#1086' '#1086#1088#1075#1072#1085#1072' '#1047#1040#1043#1057
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = cbZagsClick
  end
  object edZags: TDBEditEh
    Left = 116
    Top = 214
    Width = 311
    Height = 24
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edZagsEditButtons0Click
      end>
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Visible = True
  end
  object cbPodr: TComboBox
    Left = 137
    Top = 262
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
    TabOrder = 8
  end
end
