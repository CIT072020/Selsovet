object fmLoadLicGES: TfmLoadLicGES
  Left = 374
  Top = 234
  ActiveControl = edPath
  BorderStyle = bsDialog
  Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1083#1080#1094#1077#1074#1099#1077' '#1089#1095#1077#1090#1072' '#1080#1079' '#1046#1069#1057
  ClientHeight = 198
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
  object lbPath: TLabel
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
    Left = 4
    Top = 147
    Width = 494
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
  object btOk: TBitBtn
    Left = 276
    Top = 160
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
    Top = 160
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
    Height = 24
    Hint = #1055#1091#1090#1100' '#1082' '#1088#1077#1079#1077#1088#1074#1085#1086#1081' '#1082#1086#1087#1080#1080' '#1079#1072#1075#1088#1091#1078#1072#1077#1084#1086#1081' '#1073#1072#1079#1099
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edPathEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'f:\projects\selsovet\version base\1.0'
    Visible = True
  end
  object cbCurSost: TDBCheckBoxEh
    Left = 280
    Top = 105
    Width = 201
    Height = 17
    Caption = #1090#1086#1083#1100#1082#1086' '#1090#1077#1082#1091#1097#1077#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
    Checked = True
    State = cbChecked
    TabOrder = 3
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    Visible = False
  end
  object cbAllPunkt: TDBCheckBoxEh
    Left = 8
    Top = 97
    Width = 201
    Height = 17
    Caption = #1079#1072#1075#1088#1091#1079#1080#1090#1100' '#1074#1089#1077' '#1085#1072#1089#1077#1083#1077#1085#1080#1077
    Checked = True
    State = cbChecked
    TabOrder = 4
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object cbOneBase: TDBCheckBoxEh
    Left = 8
    Top = 122
    Width = 201
    Height = 17
    Caption = #1079#1072#1075#1088#1091#1079#1082#1072' '#1086#1076#1085#1086#1081' '#1073#1072#1079#1099
    Checked = True
    State = cbChecked
    TabOrder = 5
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = cbOneBaseClick
  end
  object btClear: TBitBtn
    Left = 9
    Top = 160
    Width = 97
    Height = 25
    Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1073#1072#1079#1091
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 6
    OnClick = btClearClick
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      08000000000000010000F30E0000F30E00000001000000010000080000003110
      180018394A001042420010424A000842520008525200086B7300396B7B00FF00
      FF0018A5C6004AC6E70073DEF7009CDEEF0094F7FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000090909090909
      090909090909090909090909090909090909090909090909090909090A0A0A0A
      0A0A0A0A0A0A0A0A0909090D0E0C0C0C0C04030C0C0C0C0B0A0909090E0C0C0C
      0C05020C0C0C0C0A090909090D0E0C0C0C0C0C0C0C0C0B0A09090909090E0C0C
      0C0C0C0C0C0C0A0909090909090D0E0C0C07080C0C0B0A090909090909090E0C
      0C07080C0C0A09090909090909090D0E0C04010C0B0A0909090909090909090E
      0C00010C0A090909090909090909090D0E06030B0A0909090909090909090909
      0E0C0C0A0909090909090909090909090D0E0B0A090909090909090909090909
      090E0A0909090909090909090909090909090909090909090909}
  end
  object ConnectSource: TAdsConnection
    AdsServerTypes = [stADS_LOCAL]
    LoginPrompt = False
    Username = 'adssys'
    StoreConnected = False
    Left = 216
    Top = 148
  end
  object Query: TAdsQuery
    DatabaseName = 'ConnectSource'
    AdsConnection = ConnectSource
    Left = 176
    Top = 146
    ParamData = <>
  end
end