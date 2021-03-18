object fmParamsGisun: TfmParamsGisun
  Left = 394
  Top = 179
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1043#1048#1057' '#1056#1053
  ClientHeight = 596
  ClientWidth = 960
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 555
    Width = 960
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      960
      41)
    object BitBtn1: TBitBtn
      Left = 746
      Top = 8
      Width = 89
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      Default = True
      TabOrder = 0
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 851
      Top = 8
      Width = 89
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object pnOsn: TPanel
    Left = 0
    Top = 0
    Width = 477
    Height = 555
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object Label10: TLabel
      Left = 16
      Top = 509
      Width = 114
      Height = 16
      Caption = #1042#1088#1077#1084#1103' '#1086#1078#1080#1076#1072#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 236
      Top = 509
      Width = 27
      Height = 16
      Caption = #1089#1077#1082'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbLocal: TLabel
      Left = 15
      Top = 473
      Width = 156
      Height = 16
      Caption = #1044#1086#1089#1090#1091#1087#1085#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 477
      Height = 180
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object cbActive: TDBCheckBoxEh
        Left = 16
        Top = 8
        Width = 345
        Height = 17
        Caption = #1042#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1077' '#1089' '#1043#1048#1057' '#1056#1053' '#1076#1086#1089#1090#1091#1087#1085#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = cbActiveClick
      end
      object cbTmpOff: TDBCheckBoxEh
        Left = 16
        Top = 32
        Width = 377
        Height = 17
        Caption = #1044#1086#1089#1090#1091#1087#1085#1086' '#1074#1088#1077#1084#1077#1085#1085#1086#1077' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1077' '#1074#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        Visible = False
      end
      object cbUser: TDBCheckBoxEh
        Left = 16
        Top = 55
        Width = 345
        Height = 17
        Caption = #1055#1077#1088#1077#1076#1072#1074#1072#1090#1100' '#1080#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1080' '#1087#1072#1088#1086#1083#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = cbUserClick
      end
      object cbUserBase: TDBCheckBoxEh
        Left = 35
        Top = 74
        Width = 436
        Height = 17
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' '#1043#1048#1057' '#1056#1053' '#1082#1072#1082' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object edSource: TDBEditEh
        Left = 367
        Top = 6
        Width = 89
        Height = 21
        Hint = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' - '#1080#1089#1090#1086#1095#1085#1080#1082' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        Text = 'edSource'
        Visible = True
      end
      object cbETSP: TDBCheckBoxEh
        Left = 16
        Top = 96
        Width = 369
        Height = 17
        Caption = #1055#1086#1076#1087#1080#1089#1099#1074#1072#1090#1100' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1086'-'#1094#1080#1092#1088#1086#1074#1086#1081' '#1087#1086#1076#1087#1080#1089#1100#1102
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = cbETSPClick
      end
      object cbURLOtd: TDBCheckBoxEh
        Left = 35
        Top = 112
        Width = 407
        Height = 17
        Caption = #1054#1090#1076#1077#1083#1100#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' URL '#1076#1083#1103' '#1088#1072#1073#1086#1090#1099' '#1089' '#1069#1062#1055
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = cbURLOtdClick
      end
      object cbCommonMessageSource: TDBCheckBoxEh
        Left = 415
        Top = 129
        Width = 49
        Height = 17
        Caption = #1048#1089#1090#1086#1095#1085#1080#1082' - '#1042#1057#1045#1043#1044#1040' '#1086#1088#1075#1072#1085' '#1089#1086#1079#1076#1072#1074#1096#1080#1081' '#1072#1082#1090#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        Visible = False
      end
      object cbCheckUSB: TDBCheckBoxEh
        Left = 35
        Top = 128
        Width = 407
        Height = 17
        Caption = #1054#1090#1089#1083#1077#1078#1080#1074#1072#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103'  '#1074' USB-'#1087#1086#1088#1090#1072#1093
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object cbCheckSpr: TDBCheckBoxEh
        Left = 355
        Top = 114
        Width = 110
        Height = 17
        Caption = #1055#1086#1076#1087#1080#1089#1099#1074#1072#1090#1100' '#1087#1088#1080' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1080' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        Visible = False
      end
      object edTypeSource: TDBEditEh
        Left = 411
        Top = 30
        Width = 45
        Height = 21
        Hint = #1050#1086#1076' '#1090#1080#1087#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        Text = 'edTypeSource'
        Visible = False
      end
      object cbAvestPIN: TDBCheckBoxEh
        Left = 35
        Top = 162
        Width = 430
        Height = 17
        Caption = #1044#1086#1089#1090#1091#1087#1085#1086#1089#1090#1100' '#1074#1074#1086#1076#1072'  '#1055#1048#1053'-'#1082#1086#1076#1072' '#1076#1083#1103' '#1053#1050#1048' '#1040#1074#1077#1089#1090' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object cbIgnoreCOC: TDBCheckBoxEh
        Left = 35
        Top = 145
        Width = 435
        Height = 17
        Caption = #1048#1075#1085#1086#1088#1080#1088#1086#1074#1072#1090#1100' '#1086#1090#1089#1091#1090#1089#1090#1074#1080#1077' '#1057#1054#1057' '#1087#1088#1080' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1080' '#1082'  '#1053#1050#1048' '#1040#1074#1077#1089#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object cbTypeETSP: TComboBox
        Left = 371
        Top = 92
        Width = 97
        Height = 24
        Hint = #1058#1080#1087' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084#1086#1081' '#1069#1062#1055
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 16
        ItemIndex = 0
        ParentFont = False
        TabOrder = 13
        Text = #1087#1072#1088#1072#1084#1077#1090#1088
        Visible = False
        Items.Strings = (
          #1087#1072#1088#1072#1084#1077#1090#1088
          #1072#1074#1077#1089#1090
          #1085#1080#1080' '#1090#1079#1080)
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 180
      Width = 477
      Height = 91
      Align = alTop
      Caption = ' '#1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label2: TLabel
        Left = 16
        Top = 26
        Width = 24
        Height = 16
        Caption = 'URL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 15
        Top = 59
        Width = 37
        Height = 16
        Caption = 'Proxy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edZAGSUrl: TDBEditEh
        Left = 60
        Top = 20
        Width = 400
        Height = 21
        AutoSelect = False
        EditButtons = <
          item
            Hint = #1042#1099#1073#1088#1072#1090#1100' IP '#1072#1076#1088#1077#1089' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
            Style = ebsEllipsisEh
            Width = 20
            OnClick = edZAGSUrlEditButtons0Click
          end
          item
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FAFAFAE5E5E5
              BDBDBDCFCFCFC7C7C7BEBEBECDCDCDC8C8C8CDCDCDC0C0C0D0D0D0C3C3C3BCBC
              BCE5E5E5F3F3F3F9F9F9FFFFFFF3F3F3DEDEDE69696961616171717168686869
              69696A6A6A696969626262686868727272BEBEBEFFFFFFFFFFFFF7F7F7FAFAFA
              6060605353534141414747474141413C3C3C3939395555553D3D3D4040404E4E
              4E717171E6E6E6FCFCFCFFFFFFFFFFFF3535353939393737374242423131314A
              4A4A3B3B3B3030304C4C4C3A3A3A262626444444FFFFFFFFFFFFF7F7F7FFFFFF
              393939424242FFFFFFFBFBFBF4F4F4474747FFFFFF2525253434344E4E4E3939
              393C3C3CFFFFFFF0F0F0F9F9F9FFFFFF3636363F3F3F313131FFFFFF4141412E
              2E2EF7F7F74949494444443E3E3E343434464646F8F8F8FFFFFFFEFEFEFEFEFE
              3939394040404A4A4AF6F6F64848483A3A3AF4F4F4FDFDFDF7F7F7B4B4B42C2C
              2C484848F7F7F7FFFFFFFFFFFFFEFEFE3C3C3C4141413D3D3DF0F0F04242423D
              3D3DFFFFFF434343393939EFEFEF4646463C3C3CFEFEFEFBFBFBFBFBFBFFFFFF
              313131434343444444F3F3F3565656323232FFFFFF414141434343FFFFFF3232
              32383838FFFFFFFEFEFEFFFFFFECECEC424242404040FCFCFCFFFFFFE6E6E64E
              4E4EF8F8F8FFFFFFD8D8D89E9E9E444444494949FCFCFCFFFFFFF6F6F6FFFFFF
              4848483A3A3A4343433535354E4E4E2E2E2E4040404C4C4C4D4D4D3232324343
              43454545EFEFEFFFFFFFFFFFFFF1F1F16B6B6B4040403C3C3C4C4C4C3E3E3E47
              47473737373D3D3D4E4E4E4B4B4B2B2B2B696969FFFFFFFFFFFFFFFFFFFAFAFA
              E4E4E48989897D7D7D6868685A5A5A6C6C6C6868687676765959596969698E8E
              8EE6E6E6FFFFFFF1F1F1FFFFFFFFFFFFF9F9F9F7F7F7F1F1F1FFFFFFFFFFFFFF
              FFFFF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F5F5F5FFFFFFEBEBEBFFFFFF
              FFFFFFFFFFFFFFFFFFEFEFEFFFFFFFF0F0F0FFFFFFFAFAFAFFFFFFEFEFEFF2F2
              F2FFFFFFFFFFFFF8F8F8FFFFFFFDFDFDFDFDFDFBFBFBFEFEFEF5F5F5FFFFFFFF
              FFFFFEFEFEFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFEFEFEFFFFFFF}
            Hint = #1048#1079#1084#1077#1085#1080#1090#1100' IP-'#1072#1076#1088#1077#1089
            Style = ebsGlyphEh
            Width = 20
            OnClick = edZAGSUrlEditButtonsIPClick
          end
          item
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
              0000FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF0000000000FF00FF000000000000000000000000000000000000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF000000000000000000848484008484000084840000848400000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF000000000000FFFF0000FFFF0000FFFF00848484008484
              000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF000000000000FFFF0000FFFF0000FFFF0084848400848400008484
              00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF000000000000FFFF0000FFFF008484840000FFFF0000FFFF000000
              0000848400008484000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0000000000FFFFFF008484840000FFFF0000FFFF000000000000FF
              FF0000FFFF00848484008484000000000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF0000000000FFFFFF0000FFFF000000000000FFFF0000FF
              FF0084848400848400008484000000000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00000000000000000000FFFF0000FFFF008484
              840000FFFF0000FFFF008484000000000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF008484840000FF
              FF0000FFFF0000FFFF008484840000000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF0000FF
              FF0000FFFF00848484000000000000000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
              0000848484000000000000000000FF00FF0000000000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00}
            Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077
            Style = ebsGlyphEh
            Width = 20
            OnClick = edZAGSUrlEditButtons1Click
          end
          item
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000000000350000003535
              0000353535007912000079121200793500007935120079570000795735007979
              350000575700355757003579790079575700797979007F7F7F00FF351200FF57
              0000FF571200FF790000FF791200FF573500FF793500FF575700FF795700FF79
              7900799B7900FF9B0000FF9B1200FFBE1200FFBE3500FFFF3500FFBE5700FF9B
              7900FFFF570035799B00799B9B0079BE9B00799BBE0079BEBE00FF9B9B00FFBE
              BE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000B00000000002020940001ABE4001820940001000000E401
              5400000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000C200D853E700000000003820940004008C00220272002802
              5400002A500020000B00F848E70001000000D053E7005C20940023E0E300A5DF
              E300000000000000000000000000E02094003ABC5100E020940094BC51000000
              00000200000094229400010000001800000000000000B8209400420000000000
              0000A4209400000000000000000000000000000000000C000000020000000101
              00001C219400000000000000C200C0D72600000000000200000007001400E605
              0000D853E700000000008805000088D6260001000000B8D726000021940023E0
              E300880500003421940001000000B8D7260014219400A8E6E3000000C2000000
              0000C0D72600242194007FE6E300C0D72600020000003C219400D85389003421
              94009422940000000000000000007C229400CF034B0090075E00000000000000
              0000702294000200000080000000000000000001000004239400E911DE00443A
              5C006F776E006F6164005C696500626D700068E15B0048005A0070015A00E8E9
              5C00E0055A0048005A002C219400F8EC5C0050229400D571E80062A57100FEFF
              FF008CE3E300F2E0E3002C000000D022940010000000F2E0E3002C0000000423
              940010000000A032E10000000000000000000000000000004E00E8E95C000000
              0000000000000900CD008B0100009832E1001822940023E0E300F8E65C000100
              0000E0E95C002C22940023E0E300E8E95C0000000000E911DE00E0E95C004022
              9400DD14890000004E0000000000E8E95C0088229400A803490000004E000000
              0000E8E95C0000000000D0229400E911DE00A0012F0000000100A91800000000
              05000C00000000000000010000000F000000F61B460090075E000F190301050E
              0F0F0F0F0F0F0F0F0F0F2410290F0F1A0E0805051A290F0F0F0F0D070F0F290D
              03070711121209290F0F0212090804061112111212121212290F021205000611
              12161A1A10121212070F020607040511160F0F0F29101212111A0E0B12050512
              080E0E0E0E0E0E0E0E29290A0D121112121212141313131313210F0B23151212
              1111111111131B1B1B210F0D0C261212210F0F0F0E131E2013290F2903252712
              12290F29111C221F110F0F0F17051A2712121011131D1D1B160F0F0F0F171115
              28121213131B131329290F0F0F0F211112121214131316290F210F0F0F0F0F0F
              2921211611210F0F0F160F0F0F0F0F0F0F0F0F0F0F2118211629}
            Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074' Internet Explorer'
            Style = ebsGlyphEh
            Width = 20
            OnClick = edZAGSUrlEditButtons2Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        MRUList.AutoAdd = False
        MRUList.Active = True
        MRUList.Items.Strings = (
          'http://agat-system.by:4569/gisun/zags/ws'
          'http://sgisun.nlb.by/gisun/zags/ws')
        MRUList.Limit = 2
        ParentFont = False
        TabOrder = 0
        Visible = True
        EditMask = ''
      end
      object edZAGSProxy: TDBEditEh
        Left = 60
        Top = 57
        Width = 400
        Height = 21
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        MRUList.AutoAdd = False
        MRUList.Active = True
        MRUList.Limit = 2
        ParentFont = False
        TabOrder = 1
        Visible = True
        EditMask = ''
      end
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 271
      Width = 477
      Height = 98
      Align = alTop
      Caption = ' '#1047#1072#1087#1088#1086#1089' '#1087#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1093' '#1076#1072#1085#1085#1099#1093' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Label1: TLabel
        Left = 16
        Top = 25
        Width = 24
        Height = 16
        Caption = 'URL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 15
        Top = 66
        Width = 37
        Height = 16
        Caption = 'Proxy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edGisunUrl: TDBEditEh
        Left = 60
        Top = 23
        Width = 400
        Height = 21
        AutoSelect = False
        EditButtons = <
          item
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000000000350000003535
              0000353535007912000079121200793500007935120079570000795735007979
              350000575700355757003579790079575700797979007F7F7F00FF351200FF57
              0000FF571200FF790000FF791200FF573500FF793500FF575700FF795700FF79
              7900799B7900FF9B0000FF9B1200FFBE1200FFBE3500FFFF3500FFBE5700FF9B
              7900FFFF570035799B00799B9B0079BE9B00799BBE0079BEBE00FF9B9B00FFBE
              BE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000B00000000002020940001ABE4001820940001000000E401
              5400000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000C200D853E700000000003820940004008C00220272002802
              5400002A500020000B00F848E70001000000D053E7005C20940023E0E300A5DF
              E300000000000000000000000000E02094003ABC5100E020940094BC51000000
              00000200000094229400010000001800000000000000B8209400420000000000
              0000A4209400000000000000000000000000000000000C000000020000000101
              00001C219400000000000000C200C0D72600000000000200000007001400E605
              0000D853E700000000008805000088D6260001000000B8D726000021940023E0
              E300880500003421940001000000B8D7260014219400A8E6E3000000C2000000
              0000C0D72600242194007FE6E300C0D72600020000003C219400D85389003421
              94009422940000000000000000007C229400CF034B0090075E00000000000000
              0000702294000200000080000000000000000001000004239400E911DE00443A
              5C006F776E006F6164005C696500626D700068E15B0048005A0070015A00E8E9
              5C00E0055A0048005A002C219400F8EC5C0050229400D571E80062A57100FEFF
              FF008CE3E300F2E0E3002C000000D022940010000000F2E0E3002C0000000423
              940010000000A032E10000000000000000000000000000004E00E8E95C000000
              0000000000000900CD008B0100009832E1001822940023E0E300F8E65C000100
              0000E0E95C002C22940023E0E300E8E95C0000000000E911DE00E0E95C004022
              9400DD14890000004E0000000000E8E95C0088229400A803490000004E000000
              0000E8E95C0000000000D0229400E911DE00A0012F0000000100A91800000000
              05000C00000000000000010000000F000000F61B460090075E000F190301050E
              0F0F0F0F0F0F0F0F0F0F2410290F0F1A0E0805051A290F0F0F0F0D070F0F290D
              03070711121209290F0F0212090804061112111212121212290F021205000611
              12161A1A10121212070F020607040511160F0F0F29101212111A0E0B12050512
              080E0E0E0E0E0E0E0E29290A0D121112121212141313131313210F0B23151212
              1111111111131B1B1B210F0D0C261212210F0F0F0E131E2013290F2903252712
              12290F29111C221F110F0F0F17051A2712121011131D1D1B160F0F0F0F171115
              28121213131B131329290F0F0F0F211112121214131316290F210F0F0F0F0F0F
              2921211611210F0F0F160F0F0F0F0F0F0F0F0F0F0F2118211629}
            Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074' Internet Explorer'
            Style = ebsGlyphEh
            Width = 20
            OnClick = edGisunUrlEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        MRUList.AutoAdd = False
        MRUList.Active = True
        MRUList.Items.Strings = (
          'http://agat-system.by:4569/gisun/common/ws'
          'http://sgisun.nlb.by/gisun/common/ws')
        MRUList.Limit = 2
        ParentFont = False
        TabOrder = 0
        Visible = True
        EditMask = ''
      end
      object edGisunProxy: TDBEditEh
        Left = 60
        Top = 60
        Width = 400
        Height = 21
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        MRUList.AutoAdd = False
        MRUList.Active = True
        MRUList.Limit = 2
        ParentFont = False
        TabOrder = 1
        Visible = True
        EditMask = ''
      end
    end
    object GroupBox3: TGroupBox
      Left = 376
      Top = 56
      Width = 81
      Height = 31
      Caption = ' '#1054#1073#1085#1086#1074#1083#1077#1085#1080#1103' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Visible = False
      object Label5: TLabel
        Left = 16
        Top = 23
        Width = 24
        Height = 16
        Caption = 'URL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edUrlUpdate: TDBEditEh
        Left = 60
        Top = 20
        Width = 400
        Height = 21
        AutoSelect = False
        EditButtons = <
          item
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FAFAFAE5E5E5
              BDBDBDCFCFCFC7C7C7BEBEBECDCDCDC8C8C8CDCDCDC0C0C0D0D0D0C3C3C3BCBC
              BCE5E5E5F3F3F3F9F9F9FFFFFFF3F3F3DEDEDE69696961616171717168686869
              69696A6A6A696969626262686868727272BEBEBEFFFFFFFFFFFFF7F7F7FAFAFA
              6060605353534141414747474141413C3C3C3939395555553D3D3D4040404E4E
              4E717171E6E6E6FCFCFCFFFFFFFFFFFF3535353939393737374242423131314A
              4A4A3B3B3B3030304C4C4C3A3A3A262626444444FFFFFFFFFFFFF7F7F7FFFFFF
              393939424242FFFFFFFBFBFBF4F4F4474747FFFFFF2525253434344E4E4E3939
              393C3C3CFFFFFFF0F0F0F9F9F9FFFFFF3636363F3F3F313131FFFFFF4141412E
              2E2EF7F7F74949494444443E3E3E343434464646F8F8F8FFFFFFFEFEFEFEFEFE
              3939394040404A4A4AF6F6F64848483A3A3AF4F4F4FDFDFDF7F7F7B4B4B42C2C
              2C484848F7F7F7FFFFFFFFFFFFFEFEFE3C3C3C4141413D3D3DF0F0F04242423D
              3D3DFFFFFF434343393939EFEFEF4646463C3C3CFEFEFEFBFBFBFBFBFBFFFFFF
              313131434343444444F3F3F3565656323232FFFFFF414141434343FFFFFF3232
              32383838FFFFFFFEFEFEFFFFFFECECEC424242404040FCFCFCFFFFFFE6E6E64E
              4E4EF8F8F8FFFFFFD8D8D89E9E9E444444494949FCFCFCFFFFFFF6F6F6FFFFFF
              4848483A3A3A4343433535354E4E4E2E2E2E4040404C4C4C4D4D4D3232324343
              43454545EFEFEFFFFFFFFFFFFFF1F1F16B6B6B4040403C3C3C4C4C4C3E3E3E47
              47473737373D3D3D4E4E4E4B4B4B2B2B2B696969FFFFFFFFFFFFFFFFFFFAFAFA
              E4E4E48989897D7D7D6868685A5A5A6C6C6C6868687676765959596969698E8E
              8EE6E6E6FFFFFFF1F1F1FFFFFFFFFFFFF9F9F9F7F7F7F1F1F1FFFFFFFFFFFFFF
              FFFFF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F5F5F5FFFFFFEBEBEBFFFFFF
              FFFFFFFFFFFFFFFFFFEFEFEFFFFFFFF0F0F0FFFFFFFAFAFAFFFFFFEFEFEFF2F2
              F2FFFFFFFFFFFFF8F8F8FFFFFFFDFDFDFDFDFDFBFBFBFEFEFEF5F5F5FFFFFFFF
              FFFFFEFEFEFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFEFEFEFFFFFFF}
            Hint = #1048#1079#1084#1077#1085#1080#1090#1100' IP-'#1072#1076#1088#1077#1089
            Style = ebsGlyphEh
            Width = 20
            OnClick = edUrlUpdateEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        MRUList.AutoAdd = False
        MRUList.Active = True
        MRUList.Items.Strings = (
          'http://agat-system.by:4569/gisun/zags/ws'
          'http://sgisun.nlb.by/gisun/zags/ws')
        MRUList.Limit = 2
        ParentFont = False
        TabOrder = 0
        Visible = True
        EditMask = ''
      end
    end
    object edTimeOut: TDBNumberEditEh
      Left = 149
      Top = 505
      Width = 81
      Height = 24
      AutoSelect = False
      DecimalPlaces = 0
      EditButton.Style = ebsUpDownEh
      EditButton.Visible = True
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Increment = 10.000000000000000000
      MaxValue = 180.000000000000000000
      ParentFont = False
      TabOrder = 4
      Visible = True
    end
    object cbLog: TDBCheckBoxEh
      Left = 288
      Top = 509
      Width = 157
      Height = 17
      Hint = #1060#1072#1081#1083' c:\gisun.txt'
      Caption = #1079#1072#1087#1080#1089#1099#1074#1072#1090#1100' '#1083#1086#1075
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = cbUserClick
    end
    object cbRegFIO: TDBCheckBoxEh
      Left = 16
      Top = 371
      Width = 453
      Height = 17
      Caption = #1084#1077#1085#1103#1090#1100' '#1088#1077#1075#1080#1089#1090#1088' '#1073#1091#1082#1074' '#1060#1048#1054' '#1087#1088#1080' '#1079#1072#1087#1088#1086#1089#1077' '#1076#1072#1085#1085#1099#1093
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = cbUserClick
    end
    object cbRegAdres: TDBCheckBoxEh
      Left = 16
      Top = 390
      Width = 453
      Height = 17
      Caption = #1084#1077#1085#1103#1090#1100' '#1088#1077#1075#1080#1089#1090#1088' '#1073#1091#1082#1074' '#1072#1076#1088#1077#1089#1072' '#1087#1088#1080' '#1079#1072#1087#1088#1086#1089#1077' '#1076#1072#1085#1085#1099#1093
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = cbUserClick
    end
    object cbLoadFamSt: TDBCheckBoxEh
      Left = 16
      Top = 409
      Width = 361
      Height = 17
      Caption = #1079#1072#1075#1088#1091#1078#1072#1090#1100' '#1089#1077#1084#1077#1081#1085#1099#1081' '#1089#1090#1072#1090#1091#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = cbUserClick
    end
    object cbZaprosZah: TDBCheckBoxEh
      Left = 16
      Top = 447
      Width = 448
      Height = 17
      Caption = #1082#1086#1085#1090#1088#1086#1083#1100' '#1079#1072#1087#1088#1086#1089#1072' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1091#1095#1077#1090#1072' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Visible = False
      OnClick = cbUserClick
    end
    object cbLocal2: TDBCheckBoxEh
      Left = 180
      Top = 474
      Width = 87
      Height = 17
      Caption = #1086#1087#1077#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Visible = False
    end
    object cbAteGIS: TDBCheckBoxEh
      Left = 16
      Top = 428
      Width = 448
      Height = 17
      Caption = #1086#1073#1088#1072#1073#1072#1090#1099#1074#1072#1090#1100' '#1082#1086#1076' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080' '#1084#1077#1089#1090#1072' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072' '#1080#1079' '#1088#1077#1075#1080#1089#1090#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Visible = False
    end
  end
  object pnExt: TPanel
    Left = 477
    Top = 0
    Width = 483
    Height = 555
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel1: TBevel
      Left = 2
      Top = 121
      Width = 255
      Height = 7
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 256
      Top = 150
      Width = 17
      Height = 30
      Shape = bsLeftLine
    end
    object Bevel3: TBevel
      Left = 245
      Top = 122
      Width = 13
      Height = 35
      Shape = bsRightLine
    end
    object GroupBox4: TGroupBox
      Left = 1
      Top = 180
      Width = 470
      Height = 91
      Caption = ' '#1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label6: TLabel
        Left = 16
        Top = 26
        Width = 24
        Height = 16
        Caption = 'URL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 15
        Top = 59
        Width = 37
        Height = 16
        Caption = 'Proxy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edZAGSUrl1: TDBEditEh
        Left = 60
        Top = 20
        Width = 400
        Height = 21
        AutoSelect = False
        EditButtons = <
          item
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FAFAFAE5E5E5
              BDBDBDCFCFCFC7C7C7BEBEBECDCDCDC8C8C8CDCDCDC0C0C0D0D0D0C3C3C3BCBC
              BCE5E5E5F3F3F3F9F9F9FFFFFFF3F3F3DEDEDE69696961616171717168686869
              69696A6A6A696969626262686868727272BEBEBEFFFFFFFFFFFFF7F7F7FAFAFA
              6060605353534141414747474141413C3C3C3939395555553D3D3D4040404E4E
              4E717171E6E6E6FCFCFCFFFFFFFFFFFF3535353939393737374242423131314A
              4A4A3B3B3B3030304C4C4C3A3A3A262626444444FFFFFFFFFFFFF7F7F7FFFFFF
              393939424242FFFFFFFBFBFBF4F4F4474747FFFFFF2525253434344E4E4E3939
              393C3C3CFFFFFFF0F0F0F9F9F9FFFFFF3636363F3F3F313131FFFFFF4141412E
              2E2EF7F7F74949494444443E3E3E343434464646F8F8F8FFFFFFFEFEFEFEFEFE
              3939394040404A4A4AF6F6F64848483A3A3AF4F4F4FDFDFDF7F7F7B4B4B42C2C
              2C484848F7F7F7FFFFFFFFFFFFFEFEFE3C3C3C4141413D3D3DF0F0F04242423D
              3D3DFFFFFF434343393939EFEFEF4646463C3C3CFEFEFEFBFBFBFBFBFBFFFFFF
              313131434343444444F3F3F3565656323232FFFFFF414141434343FFFFFF3232
              32383838FFFFFFFEFEFEFFFFFFECECEC424242404040FCFCFCFFFFFFE6E6E64E
              4E4EF8F8F8FFFFFFD8D8D89E9E9E444444494949FCFCFCFFFFFFF6F6F6FFFFFF
              4848483A3A3A4343433535354E4E4E2E2E2E4040404C4C4C4D4D4D3232324343
              43454545EFEFEFFFFFFFFFFFFFF1F1F16B6B6B4040403C3C3C4C4C4C3E3E3E47
              47473737373D3D3D4E4E4E4B4B4B2B2B2B696969FFFFFFFFFFFFFFFFFFFAFAFA
              E4E4E48989897D7D7D6868685A5A5A6C6C6C6868687676765959596969698E8E
              8EE6E6E6FFFFFFF1F1F1FFFFFFFFFFFFF9F9F9F7F7F7F1F1F1FFFFFFFFFFFFFF
              FFFFF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F5F5F5FFFFFFEBEBEBFFFFFF
              FFFFFFFFFFFFFFFFFFEFEFEFFFFFFFF0F0F0FFFFFFFAFAFAFFFFFFEFEFEFF2F2
              F2FFFFFFFFFFFFF8F8F8FFFFFFFDFDFDFDFDFDFBFBFBFEFEFEF5F5F5FFFFFFFF
              FFFFFEFEFEFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFEFEFEFFFFFFF}
            Hint = #1048#1079#1084#1077#1085#1080#1090#1100' IP-'#1072#1076#1088#1077#1089
            Style = ebsGlyphEh
            Width = 20
            OnClick = edZAGSUrlEditButtonsIPClick
          end
          item
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
              0000FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF0000000000FF00FF000000000000000000000000000000000000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF000000000000000000848484008484000084840000848400000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF000000000000FFFF0000FFFF0000FFFF00848484008484
              000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF000000000000FFFF0000FFFF0000FFFF0084848400848400008484
              00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF000000000000FFFF0000FFFF008484840000FFFF0000FFFF000000
              0000848400008484000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0000000000FFFFFF008484840000FFFF0000FFFF000000000000FF
              FF0000FFFF00848484008484000000000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF0000000000FFFFFF0000FFFF000000000000FFFF0000FF
              FF0084848400848400008484000000000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00000000000000000000FFFF0000FFFF008484
              840000FFFF0000FFFF008484000000000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF008484840000FF
              FF0000FFFF0000FFFF008484840000000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF0000FF
              FF0000FFFF00848484000000000000000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
              0000848484000000000000000000FF00FF0000000000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00}
            Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077
            Style = ebsGlyphEh
            Width = 20
            OnClick = edZAGSUrlEditButtons1Click
          end
          item
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000000000350000003535
              0000353535007912000079121200793500007935120079570000795735007979
              350000575700355757003579790079575700797979007F7F7F00FF351200FF57
              0000FF571200FF790000FF791200FF573500FF793500FF575700FF795700FF79
              7900799B7900FF9B0000FF9B1200FFBE1200FFBE3500FFFF3500FFBE5700FF9B
              7900FFFF570035799B00799B9B0079BE9B00799BBE0079BEBE00FF9B9B00FFBE
              BE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000B00000000002020940001ABE4001820940001000000E401
              5400000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000C200D853E700000000003820940004008C00220272002802
              5400002A500020000B00F848E70001000000D053E7005C20940023E0E300A5DF
              E300000000000000000000000000E02094003ABC5100E020940094BC51000000
              00000200000094229400010000001800000000000000B8209400420000000000
              0000A4209400000000000000000000000000000000000C000000020000000101
              00001C219400000000000000C200C0D72600000000000200000007001400E605
              0000D853E700000000008805000088D6260001000000B8D726000021940023E0
              E300880500003421940001000000B8D7260014219400A8E6E3000000C2000000
              0000C0D72600242194007FE6E300C0D72600020000003C219400D85389003421
              94009422940000000000000000007C229400CF034B0090075E00000000000000
              0000702294000200000080000000000000000001000004239400E911DE00443A
              5C006F776E006F6164005C696500626D700068E15B0048005A0070015A00E8E9
              5C00E0055A0048005A002C219400F8EC5C0050229400D571E80062A57100FEFF
              FF008CE3E300F2E0E3002C000000D022940010000000F2E0E3002C0000000423
              940010000000A032E10000000000000000000000000000004E00E8E95C000000
              0000000000000900CD008B0100009832E1001822940023E0E300F8E65C000100
              0000E0E95C002C22940023E0E300E8E95C0000000000E911DE00E0E95C004022
              9400DD14890000004E0000000000E8E95C0088229400A803490000004E000000
              0000E8E95C0000000000D0229400E911DE00A0012F0000000100A91800000000
              05000C00000000000000010000000F000000F61B460090075E000F190301050E
              0F0F0F0F0F0F0F0F0F0F2410290F0F1A0E0805051A290F0F0F0F0D070F0F290D
              03070711121209290F0F0212090804061112111212121212290F021205000611
              12161A1A10121212070F020607040511160F0F0F29101212111A0E0B12050512
              080E0E0E0E0E0E0E0E29290A0D121112121212141313131313210F0B23151212
              1111111111131B1B1B210F0D0C261212210F0F0F0E131E2013290F2903252712
              12290F29111C221F110F0F0F17051A2712121011131D1D1B160F0F0F0F171115
              28121213131B131329290F0F0F0F211112121214131316290F210F0F0F0F0F0F
              2921211611210F0F0F160F0F0F0F0F0F0F0F0F0F0F2118211629}
            Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074' Internet Explorer'
            Style = ebsGlyphEh
            Width = 20
            OnClick = edZAGSUrl1EditButtons3Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        MRUList.AutoAdd = False
        MRUList.Active = True
        MRUList.Items.Strings = (
          'http://agat-system.by:4569/gisun/zags/ws'
          'http://sgisun.nlb.by/gisun/zags/ws')
        MRUList.Limit = 2
        ParentFont = False
        TabOrder = 0
        Visible = True
        EditMask = ''
      end
      object edZAGSProxy1: TDBEditEh
        Left = 60
        Top = 57
        Width = 400
        Height = 21
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        MRUList.AutoAdd = False
        MRUList.Active = True
        MRUList.Limit = 2
        ParentFont = False
        TabOrder = 1
        Visible = True
        EditMask = ''
      end
    end
    object GroupBox5: TGroupBox
      Left = 1
      Top = 271
      Width = 470
      Height = 98
      Caption = ' '#1047#1072#1087#1088#1086#1089' '#1087#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1093' '#1076#1072#1085#1085#1099#1093' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label8: TLabel
        Left = 16
        Top = 25
        Width = 24
        Height = 16
        Caption = 'URL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 15
        Top = 66
        Width = 37
        Height = 16
        Caption = 'Proxy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edGisunUrl1: TDBEditEh
        Left = 60
        Top = 23
        Width = 400
        Height = 21
        AutoSelect = False
        EditButtons = <
          item
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000000000350000003535
              0000353535007912000079121200793500007935120079570000795735007979
              350000575700355757003579790079575700797979007F7F7F00FF351200FF57
              0000FF571200FF790000FF791200FF573500FF793500FF575700FF795700FF79
              7900799B7900FF9B0000FF9B1200FFBE1200FFBE3500FFFF3500FFBE5700FF9B
              7900FFFF570035799B00799B9B0079BE9B00799BBE0079BEBE00FF9B9B00FFBE
              BE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000B00000000002020940001ABE4001820940001000000E401
              5400000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000C200D853E700000000003820940004008C00220272002802
              5400002A500020000B00F848E70001000000D053E7005C20940023E0E300A5DF
              E300000000000000000000000000E02094003ABC5100E020940094BC51000000
              00000200000094229400010000001800000000000000B8209400420000000000
              0000A4209400000000000000000000000000000000000C000000020000000101
              00001C219400000000000000C200C0D72600000000000200000007001400E605
              0000D853E700000000008805000088D6260001000000B8D726000021940023E0
              E300880500003421940001000000B8D7260014219400A8E6E3000000C2000000
              0000C0D72600242194007FE6E300C0D72600020000003C219400D85389003421
              94009422940000000000000000007C229400CF034B0090075E00000000000000
              0000702294000200000080000000000000000001000004239400E911DE00443A
              5C006F776E006F6164005C696500626D700068E15B0048005A0070015A00E8E9
              5C00E0055A0048005A002C219400F8EC5C0050229400D571E80062A57100FEFF
              FF008CE3E300F2E0E3002C000000D022940010000000F2E0E3002C0000000423
              940010000000A032E10000000000000000000000000000004E00E8E95C000000
              0000000000000900CD008B0100009832E1001822940023E0E300F8E65C000100
              0000E0E95C002C22940023E0E300E8E95C0000000000E911DE00E0E95C004022
              9400DD14890000004E0000000000E8E95C0088229400A803490000004E000000
              0000E8E95C0000000000D0229400E911DE00A0012F0000000100A91800000000
              05000C00000000000000010000000F000000F61B460090075E000F190301050E
              0F0F0F0F0F0F0F0F0F0F2410290F0F1A0E0805051A290F0F0F0F0D070F0F290D
              03070711121209290F0F0212090804061112111212121212290F021205000611
              12161A1A10121212070F020607040511160F0F0F29101212111A0E0B12050512
              080E0E0E0E0E0E0E0E29290A0D121112121212141313131313210F0B23151212
              1111111111131B1B1B210F0D0C261212210F0F0F0E131E2013290F2903252712
              12290F29111C221F110F0F0F17051A2712121011131D1D1B160F0F0F0F171115
              28121213131B131329290F0F0F0F211112121214131316290F210F0F0F0F0F0F
              2921211611210F0F0F160F0F0F0F0F0F0F0F0F0F0F2118211629}
            Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074' Internet Explorer'
            Style = ebsGlyphEh
            Width = 20
            OnClick = edGisunUrl1EditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        MRUList.AutoAdd = False
        MRUList.Active = True
        MRUList.Items.Strings = (
          'http://agat-system.by:4569/gisun/common/ws'
          'http://sgisun.nlb.by/gisun/common/ws')
        MRUList.Limit = 2
        ParentFont = False
        TabOrder = 0
        Visible = True
        EditMask = ''
      end
      object edGisunProxy1: TDBEditEh
        Left = 60
        Top = 60
        Width = 400
        Height = 21
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        MRUList.AutoAdd = False
        MRUList.Active = True
        MRUList.Limit = 2
        ParentFont = False
        TabOrder = 1
        Visible = True
        EditMask = ''
      end
    end
  end
  object TCPClient: TIdTCPClient
    OnStatus = TCPClientStatus
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 0
    Left = 336
    Top = 40
  end
end
