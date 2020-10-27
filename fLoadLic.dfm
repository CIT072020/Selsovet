object fmLoadLic: TfmLoadLic
  Left = 286
  Top = 183
  BorderStyle = bsDialog
  Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1087#1086#1093#1086#1079#1103#1081#1089#1090#1074#1077#1085#1085#1099#1081' '#1091#1095#1077#1090
  ClientHeight = 279
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 70
    Width = 129
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1079#1072#1075#1088#1091#1078#1072#1077#1084#1086#1081' '#1073#1072#1079#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 2
    Top = 228
    Width = 496
    Height = 7
    Shape = bsTopLine
  end
  object Label2: TLabel
    Left = 10
    Top = 6
    Width = 424
    Height = 16
    Caption = #1042#1053#1048#1052#1040#1053#1048#1045': '#1042#1089#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080' '#1076#1086#1083#1078#1085#1099' '#1079#1072#1074#1077#1088#1096#1080#1090#1100' '#1088#1072#1073#1086#1090#1091' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 24
    Width = 483
    Height = 34
    AutoSize = False
    Caption = 
      #1055#1077#1088#1077#1076' '#1074#1099#1087#1086#1083#1085#1077#1080#1077#1084' '#1086#1087#1077#1088#1072#1094#1080#1080' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1085#1072#1089#1090#1086#1103#1090#1077#1083#1100#1085#1086' '#1088#1077#1082#1086#1084#1077#1085#1076#1091#1077#1090#1089#1103' '#1074#1099 +
      #1087#1086#1083#1085#1080#1090#1100' '#1088#1077#1079#1077#1088#1074#1085#1086#1077' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1073#1072#1079#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label4: TLabel
    Left = 8
    Top = 171
    Width = 229
    Height = 13
    Caption = #1053#1072' '#1089#1082#1086#1083#1100#1082#1086' '#1091#1074#1077#1083#1080#1095#1080#1090#1100' '#1085#1086#1084#1077#1088' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
  end
  object Label5: TLabel
    Left = 8
    Top = 200
    Width = 250
    Height = 13
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1080#1084#1074#1086#1083#1099' '#1082' '#1085#1086#1084#1077#1088#1091' '#1082#1085#1080#1075#1080
  end
  object btOk: TBitBtn
    Left = 276
    Top = 241
    Width = 97
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    Default = True
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
    Left = 391
    Top = 241
    Width = 97
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 1
    OnClick = btCancelClick
    Kind = bkCancel
  end
  object edPath: TDBEditEh
    Left = 157
    Top = 66
    Width = 331
    Height = 21
    Hint = #1055#1091#1090#1100' '#1082' '#1088#1077#1079#1077#1088#1074#1085#1086#1081' '#1082#1086#1087#1080#1080' '#1079#1072#1075#1088#1091#1078#1072#1077#1084#1086#1081' '#1073#1072#1079#1099
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edPathEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'f:\projects\selsovet\version base\1.0'
    Visible = True
  end
  object cbCurSost: TDBCheckBoxEh
    Left = 8
    Top = 97
    Width = 201
    Height = 17
    Caption = #1090#1086#1083#1100#1082#1086' '#1090#1077#1082#1091#1097#1077#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
    Checked = True
    State = cbChecked
    TabOrder = 3
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object edAddNomerKniga: TDBEditEh
    Left = 282
    Top = 196
    Width = 56
    Height = 21
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Visible = True
  end
  object edAddNomerLic: TDBNumberEditEh
    Left = 282
    Top = 167
    Width = 55
    Height = 21
    DecimalPlaces = 0
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Value = 0.000000000000000000
    Visible = True
  end
  object cbAllPunkt: TDBCheckBoxEh
    Left = 8
    Top = 121
    Width = 201
    Height = 17
    Caption = #1074#1089#1077' '#1085#1072#1089#1077#1083#1077#1085#1085#1099#1077' '#1087#1091#1085#1082#1090#1099
    Checked = True
    State = cbChecked
    TabOrder = 6
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object cbZAGS: TDBCheckBoxEh
    Left = 8
    Top = 145
    Width = 201
    Height = 17
    Caption = #1072#1082#1090#1086#1074#1099#1077' '#1079#1072#1087#1080#1089#1080' '#1047#1040#1043#1057
    TabOrder = 7
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object ConnectSource: TAdsConnection
    AdsServerTypes = [stADS_LOCAL]
    LoginPrompt = False
    Username = 'adssys'
    StoreConnected = False
    Left = 16
    Top = 214
  end
  object Query: TAdsQuery
    DatabaseName = 'ConnectSource'
    AdsConnection = ConnectSource
    Left = 56
    Top = 244
    ParamData = <>
  end
end
