inherited fmRunSprav_UserProp: TfmRunSprav_UserProp
  Left = 484
  Top = 260
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072
  ClientHeight = 212
  ClientWidth = 504
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 168
    Width = 504
    inherited btOk: TBitBtn
      Left = 286
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    end
    inherited btCancel: TBitBtn
      Left = 395
    end
  end
  object gbUserPodr: TGroupBox
    Left = 0
    Top = 0
    Width = 504
    Height = 168
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 18
      Top = 24
      Width = 95
      Height = 16
      Caption = #1055#1077#1088#1074#1072#1103' '#1087#1086#1076#1087#1080#1089#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 18
      Top = 57
      Width = 93
      Height = 16
      Caption = #1042#1090#1086#1088#1072#1103' '#1087#1086#1076#1087#1080#1089#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 18
      Top = 90
      Width = 94
      Height = 16
      Caption = #1058#1088#1077#1090#1100#1103' '#1087#1086#1076#1087#1080#1089#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbShtamp: TLabel
      Left = 23
      Top = 137
      Width = 60
      Height = 16
      Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object blShtamp: TBevel
      Left = 3
      Top = 113
      Width = 497
      Height = 9
      Shape = bsBottomLine
    end
    object edDolgPodp1: TDBComboBoxEh
      Left = 130
      Top = 20
      Width = 245
      Height = 24
      DataField = 'DOLG_PODP1'
      DataSource = DataSource
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
    end
    object edDolgPodp2: TDBComboBoxEh
      Left = 130
      Top = 53
      Width = 245
      Height = 24
      DataField = 'DOLG_PODP2'
      DataSource = DataSource
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = True
    end
    object edDolgPodp3: TDBComboBoxEh
      Left = 130
      Top = 86
      Width = 245
      Height = 24
      DataField = 'DOLG_PODP3'
      DataSource = DataSource
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = True
    end
    object cbPodp2: TDBCheckBoxEh
      Left = 390
      Top = 57
      Width = 97
      Height = 17
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100
      DataField = 'PODP2'
      DataSource = DataSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = cbPodp2Click
    end
    object cbPODP3: TDBCheckBoxEh
      Left = 390
      Top = 90
      Width = 97
      Height = 17
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100
      DataField = 'PODP3'
      DataSource = DataSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = cbPODP3Click
    end
    object edShtamp: TDBComboBoxEh
      Left = 130
      Top = 133
      Width = 245
      Height = 24
      DataField = 'SHTAMP_CUR'
      DataSource = DataSource
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = True
    end
  end
  object DataSource: TDataSource
    Left = 424
    Top = 16
  end
end
