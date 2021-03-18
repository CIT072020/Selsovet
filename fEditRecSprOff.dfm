object fmEditRecSprOff: TfmEditRecSprOff
  Left = 428
  Top = 222
  BorderStyle = bsDialog
  Caption = #1044#1086#1083#1078#1086#1089#1090#1085#1086#1077' '#1083#1080#1094#1086
  ClientHeight = 290
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnBel: TPanel
    Left = 0
    Top = 0
    Width = 659
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbBel: TLabel
      Left = 491
      Top = 10
      Width = 113
      Height = 13
      Caption = #1085#1072' '#1073#1077#1083#1086#1088#1091#1089#1089#1082#1086#1084' '#1103#1079#1099#1082#1077
    end
  end
  object pnFIO: TPanel
    Left = 0
    Top = 25
    Width = 659
    Height = 99
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = 9
      Top = 44
      Width = 66
      Height = 16
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 9
      Top = 13
      Width = 82
      Height = 16
      Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 9
      Top = 76
      Width = 116
      Height = 16
      Caption = #1060'.'#1048'.'#1054'. - '#1076#1086#1083#1078#1085#1086#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edPost: TDBEditEh
      Left = 171
      Top = 39
      Width = 230
      Height = 26
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = True
      OnUpdateData = edPostUpdateData
    end
    object edFIO: TDBEditEh
      Left = 171
      Top = 8
      Width = 230
      Height = 26
      HelpContext = 888
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnUpdateData = edFIOUpdateData
    end
    object edName: TDBEditEh
      Left = 171
      Top = 71
      Width = 469
      Height = 26
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = True
    end
    object edFIOB: TDBEditEh
      Left = 443
      Top = 8
      Width = 198
      Height = 26
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = True
      OnUpdateData = edFIOBUpdateData
    end
    object edPostB: TDBEditEh
      Left = 443
      Top = 39
      Width = 198
      Height = 26
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = True
      OnUpdateData = edFIOBUpdateData
    end
  end
  object pnBt: TPanel
    Left = 0
    Top = 255
    Width = 659
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      659
      35)
    object btOk: TBitBtn
      Left = 433
      Top = 6
      Width = 89
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
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
      Left = 545
      Top = 6
      Width = 89
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object pnTel: TPanel
    Left = 0
    Top = 156
    Width = 659
    Height = 99
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Label4: TLabel
      Left = 9
      Top = 8
      Width = 53
      Height = 16
      Caption = #1058#1077#1083#1077#1092#1086#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 9
      Top = 39
      Width = 123
      Height = 16
      Caption = #1052#1086#1073#1080#1083#1100#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 9
      Top = 68
      Width = 106
      Height = 16
      Caption = #1053#1086#1084#1077#1088' '#1076#1083#1103' '#1087#1086#1082#1072#1079#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object edTelefon: TDBEditEh
      Left = 171
      Top = 3
      Width = 177
      Height = 26
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
    end
    object edTelMob: TDBEditEh
      Left = 171
      Top = 33
      Width = 177
      Height = 26
      HelpContext = 999
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = True
    end
    object edNomer: TDBNumberEditEh
      Left = 171
      Top = 63
      Width = 81
      Height = 26
      DecimalPlaces = 0
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 9999999.000000000000000000
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object cbRukov: TDBCheckBoxEh
      Left = 448
      Top = 4
      Width = 177
      Height = 17
      Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
      TabOrder = 3
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object cbSpec: TDBCheckBoxEh
      Left = 448
      Top = 24
      Width = 179
      Height = 17
      Caption = #1057#1087#1077#1094#1080#1072#1083#1080#1089#1090
      TabOrder = 4
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object cbActual: TDBCheckBoxEh
      Left = 448
      Top = 44
      Width = 185
      Height = 17
      Caption = #1040#1082#1090#1091#1072#1083#1100#1085#1072#1103' '#1079#1072#1087#1080#1089#1100
      TabOrder = 5
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object pnFIOF: TPanel
    Left = 0
    Top = 124
    Width = 659
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lbFIOF: TLabel
      Left = 9
      Top = 8
      Width = 139
      Height = 16
      Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edFIOF: TDBEditEh
      Left = 171
      Top = 3
      Width = 230
      Height = 26
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnUpdateData = edFIOBUpdateData
    end
  end
  object DataSource1: TDataSource
    DataSet = Query
    Left = 397
    Top = 186
  end
  object Query: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    StoreActive = False
    AdsConnection = dmBase.AdsConnection
    Left = 132
    Top = 213
    ParamData = <>
  end
  object QuerySeek: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    StoreActive = False
    AdsTableOptions.AdsIndexPageSize = 512
    SQL.Strings = (
      'SELECT ID '
      '   FROM SprNames '
      '   WHERE Substring(SOATO,1,2)='#39'90'#39
      '   ORDER BY ID DESC')
    AdsConnection = dmBase.AdsConnection
    Left = 133
    Top = 141
    ParamData = <>
  end
end
