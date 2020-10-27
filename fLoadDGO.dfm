object fmLoadDGO: TfmLoadDGO
  Left = 421
  Top = 136
  Width = 978
  Height = 644
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1044#1043#1054
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    962
    606)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 12
    Width = 19
    Height = 13
    Caption = #1043#1086#1076
  end
  object Label2: TLabel
    Left = 128
    Top = 12
    Width = 31
    Height = 13
    Caption = #1052#1077#1089#1103#1094
  end
  object Label3: TLabel
    Left = 336
    Top = 12
    Width = 35
    Height = 13
    Caption = #1047#1072#1087#1080#1089#1100
  end
  object Label4: TLabel
    Left = 15
    Top = 39
    Width = 19
    Height = 13
    Caption = #1043#1086#1076
  end
  object Label5: TLabel
    Left = 127
    Top = 39
    Width = 31
    Height = 13
    Caption = #1052#1077#1089#1103#1094
  end
  object list: TMemo
    Left = 5
    Top = 120
    Width = 952
    Height = 481
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    Lines.Strings = (
      'list')
    ParentFont = False
    TabOrder = 0
    WordWrap = False
  end
  object edYear: TDBNumberEditEh
    Left = 44
    Top = 8
    Width = 63
    Height = 21
    DecimalPlaces = 0
    EditButton.Style = ebsUpDownEh
    EditButton.Visible = True
    EditButtons = <>
    MaxValue = 2010.000000000000000000
    MinValue = 1900.000000000000000000
    TabOrder = 1
    Value = 1994.000000000000000000
    Visible = True
  end
  object edMonth: TDBNumberEditEh
    Left = 172
    Top = 8
    Width = 49
    Height = 21
    DecimalPlaces = 0
    EditButton.Style = ebsUpDownEh
    EditButton.Visible = True
    EditButtons = <>
    MaxValue = 12.000000000000000000
    MinValue = 1.000000000000000000
    TabOrder = 2
    Value = 1.000000000000000000
    Visible = True
  end
  object Button1: TButton
    Left = 250
    Top = 7
    Width = 55
    Height = 23
    Caption = 'Open'
    TabOrder = 3
    OnClick = Button1Click
  end
  object cbR: TCheckBox
    Left = 771
    Top = 10
    Width = 97
    Height = 17
    Caption = #1056#1086#1078#1076#1077#1085#1080#1103
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object edRec: TDBNumberEditEh
    Left = 380
    Top = 8
    Width = 49
    Height = 21
    DecimalPlaces = 0
    EditButton.Style = ebsUpDownEh
    EditButton.Visible = True
    EditButtons = <>
    MaxValue = 1000.000000000000000000
    MinValue = 1.000000000000000000
    TabOrder = 5
    Value = 1.000000000000000000
    Visible = True
    OnChange = edRecChange
  end
  object Button2: TButton
    Left = 776
    Top = 64
    Width = 129
    Height = 25
    Caption = #1053#1072#1081#1090#1080' '#1087#1086#1074#1090#1086#1088#1085#1086#1077
    TabOrder = 6
    OnClick = Button2Click
  end
  object edYearE: TDBNumberEditEh
    Left = 43
    Top = 35
    Width = 63
    Height = 21
    DecimalPlaces = 0
    EditButton.Style = ebsUpDownEh
    EditButton.Visible = True
    EditButtons = <>
    MaxValue = 2010.000000000000000000
    MinValue = 1900.000000000000000000
    TabOrder = 7
    Value = 2007.000000000000000000
    Visible = True
  end
  object edMonthE: TDBNumberEditEh
    Left = 171
    Top = 35
    Width = 49
    Height = 21
    DecimalPlaces = 0
    EditButton.Style = ebsUpDownEh
    EditButton.Visible = True
    EditButtons = <>
    MaxValue = 12.000000000000000000
    MinValue = 1.000000000000000000
    TabOrder = 8
    Value = 12.000000000000000000
    Visible = True
  end
  object Button3: TButton
    Left = 17
    Top = 66
    Width = 89
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    TabOrder = 9
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 200
    Top = 66
    Width = 75
    Height = 25
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
    TabOrder = 10
    OnClick = Button4Click
  end
  object DataSource1: TDataSource
    DataSet = tb
    Left = 24
    Top = 160
  end
  object AdsConnection1: TAdsConnection
    ConnectPath = 'D:\'#1047#1040#1043#1057'_'#1044#1043#1054'_'#1041#1056#1045#1057#1058'_DOS\DB1'
    AdsServerTypes = [stADS_LOCAL]
    LoginPrompt = False
    StoreConnected = False
    AdsCollation = 'OEM:ads_ascii'
    Left = 544
    Top = 8
  end
  object tb: TAdsTable
    AdsConnection = AdsConnection1
    AdsTableOptions.AdsCharType = OEM
    TableName = 'RM9106.DBF'
    TableType = ttAdsNTX
    Left = 608
    Top = 8
  end
  object tbFam: TAdsTable
    IndexName = 'PR_KEY'
    StoreActive = False
    AdsConnection = AdsConnection1
    AdsTableOptions.AdsCharType = OEM
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'CARDF.DBF'
    TableType = ttAdsCDX
    Left = 648
    Top = 8
  end
  object tbSpr: TAdsTable
    IndexName = 'PR_KEY'
    StoreActive = False
    AdsConnection = AdsConnection1
    AdsTableOptions.AdsCharType = OEM
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'REFER.DBF'
    TableType = ttAdsCDX
    Left = 696
    Top = 8
  end
end
