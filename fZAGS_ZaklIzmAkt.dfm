inherited fmZAGS_ZaklIzmAkt: TfmZAGS_ZaklIzmAkt
  Left = 616
  Top = 236
  Caption = 
    #1047#1072#1082#1083#1102#1095#1077#1085#1080#1077' ('#1086' '#1074#1085#1077#1089#1077#1085#1080#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1081', '#1076#1086#1087#1086#1083#1085#1077#1085#1080#1081' '#1080' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1081' '#1074' '#1079#1072#1087 +
    #1080#1089#1100' '#1072#1082#1090#1072' '#1075#1088#1072#1078#1076#1072#1085#1089#1082#1086#1075#1086' '#1089#1086#1089#1090#1086#1103#1085#1080#1103')'
  ClientHeight = 562
  ClientWidth = 825
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Icon.Data = {
    0000010001001010000001001800680300001600000028000000100000002000
    0000010018000000000000030000000000000000000000000000000000000000
    000000000202020000000000000101010101010101010303030000005159484A
    584C42555A4551556E6B5C0000001D1D1DABABABD2D2D2D1D1D1CECECECECECE
    CFCFCFCDCDCDD6D6D6646464DBE7E1E6F7F4D1E3EAD4DFE356544A0000002525
    25D9D9D9FFFFFFEAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF838383D7EBFDBA
    CDE2D1E3EAD6DFE25F5B60000000212121CDCDCDFCFCFC5E5E5E4D4D4DD0D0D0
    FFFFFFFFFFFFFDFDFD7B7B7AABBFEF374A75EFFAFFDFE5EC4B4A530000002222
    22CECECEFFFFFF565656000000101010656565BBBBBBFEFEFE7D7D7C4152A336
    4689B5B7E0E9E8FC4F54550000001D1D1DC7C7C7FFFFFF656565000000000000
    141414828282FEFEFE7D7D7EB4BAFF3D4493D4D1FFEFECFF4F58550000001919
    19C7C7C7FFFFFF525252181818848484E1E1E1FEFEFEFFFFFF7B7B7C4138933D
    3786EBE4FFDEDEEC404A44000000191919C5C5C5FBFBFB878787BDBDBDFFFFFF
    FFFFFFF7F7F7FBFBFB79797AE8D2FF504075EBE5FEDFDEE7565C5B0000002626
    26D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8BE7CCC2EA
    DAD4EBE6E5DBDBE16562710000000707076767678C8C8C8383837A7A7A7B7B7B
    7B7B7B7878798282822E2E2E90713C847348F1ECDDFAF9FD4B42560000000000
    000000006C7261FFFCFF413D713835737979A1FFF8FFFFFAE4FFEDBAFFFFBEFF
    FFC2FAF3E0D9D5DB564D5A00000000000000000080867BF5F8FD00062DDCE4FF
    828DA9EBEAEE795C478F6B3D7356198B7944FFFFF2E8E6E66760630000000000
    00000000797A84F1F7FC000201EFFFFF59626FFFFEFFFFFDEAFFFFE9FFFFF260
    4B434D473C5F5F535B5A500000000000000000007F7E92F7FDFF7C897975816D
    959994EFF0EEFFFFF6FAF6F1F5E9F5C6BAC6FFFFFB8786780000000000000000
    0000000077788CE4E8F3FFFFF9FFFEEBFFFDE5FEFEF0F2FDFFDEECFFEFFBFFCE
    D4E166616200000000000000000000000000000076798E7377828B84818B826E
    8279588B8D776A798C6980A05E758B5D6B770000000000000000000000000001
    0000000100000001000000010000000100000001000000010000000100000001
    000000010000C0010000C0010000C0010000C0030000C0070000C00F0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 540
    Width = 825
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited pnTable: TPanel
    Top = 540
    Width = 825
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 825
    inherited TBToolbar: TTBToolbar
      Stretch = True
      object TBSubmenuGISUN: TTBSubmenuItem [2]
        Caption = #1042#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1077' '#1089' '#1043#1048#1057#1059#1053
        ImageIndex = 114
        object TBItemStep1: TTBItem
          Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        end
        object TBItemStep2: TTBItem
          Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1072#1082#1090#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
        end
      end
      object TBItemDeclIzm: TTBItem [12]
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077' '#1086' '#1074#1085#1077#1089#1077#1085#1080#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1081', '#1076#1086#1087#1086#1083#1085#1077#1085#1080#1081', '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1081
        ImageIndex = 97
        OnClick = TBItemDeclIzmClick
      end
      object TBItemAktRogd: TTBItem [13]
        Caption = #1079'/'#1072' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080
        ImageIndex = 83
        Visible = False
        OnClick = TBItemAktRogdClick
      end
      object TBItemAktBrak: TTBItem [14]
        Caption = #1079'/'#1072' '#1086' '#1073#1088#1072#1082#1077
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1073#1088#1072#1082#1077
        ImageIndex = 51
        Visible = False
      end
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      inherited TBItemShablon: TTBItem
        Visible = True
      end
      inherited TBItemEditMemo: TTBItem
        Visible = True
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 821
        Top = 22
      end
    end
  end
  inherited sb: TScrollBox
    Left = 800
    Top = 584
    Width = 113
    Height = 65
    Align = alNone
    Constraints.MinHeight = 10
    inherited pnPovtor: TPanel
      Left = 16
      Top = 8
      Width = 63
      Height = 34
      Visible = False
      inherited DbGridEh1: TDBGridEh
        Left = -5
        Top = 11
        Height = 21
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 540
    Width = 825
  end
  inherited pnAdd: TPanel
    Width = 825
  end
  object PageControl1: TPageControl [6]
    Left = 0
    Top = 50
    Width = 825
    Height = 490
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 5
    object TabSheet1: TTabSheet
      Caption = #1063#1072#1089#1090#1100' 1'
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 817
        Height = 462
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 817
          Height = 126
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            817
            126)
          object Label3: TLabel
            Left = 509
            Top = 13
            Width = 59
            Height = 13
            Caption = #1054#1090#1095#1077#1089#1090#1074#1086' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 119
            Top = 13
            Width = 53
            Height = 13
            Caption = #1060#1072#1084#1080#1083#1080#1103' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 343
            Top = 13
            Width = 26
            Height = 13
            Caption = #1048#1084#1103' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 9
            Top = 40
            Width = 64
            Height = 13
            Caption = #1054' '#1074#1085#1077#1089#1077#1085#1080#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 9
            Top = 69
            Width = 80
            Height = 13
            Caption = #1042' '#1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label32: TLabel
            Left = 9
            Top = 102
            Width = 14
            Height = 13
            Caption = #8470
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label33: TLabel
            Left = 136
            Top = 102
            Width = 14
            Height = 13
            Caption = #1086#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label34: TLabel
            Left = 308
            Top = 102
            Width = 81
            Height = 13
            Caption = #1089#1086#1089#1090#1072#1074#1083#1077#1085#1085#1086#1081
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 9
            Top = 13
            Width = 69
            Height = 13
            Caption = #1047#1040#1071#1042#1048#1058#1045#1051#1068':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edOtch: TDBEditEh
            Left = 580
            Top = 6
            Width = 105
            Height = 26
            DataField = 'Otch'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
          object edFamilia: TDBEditEh
            Left = 190
            Top = 6
            Width = 129
            Height = 26
            HelpContext = 888
            DataField = 'Familia'
            DataSource = dsDokument
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
          object edName: TDBEditEh
            Left = 385
            Top = 6
            Width = 95
            Height = 26
            DataField = 'Name'
            DataSource = dsDokument
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
          object cbIzm: TDBCheckBoxEh
            Left = 116
            Top = 38
            Width = 140
            Height = 17
            Caption = #1080#1079#1084#1077#1085#1077#1085#1080#1081
            DataField = 'IS_IZMEN'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object cbDopoln: TDBCheckBoxEh
            Left = 266
            Top = 38
            Width = 137
            Height = 17
            Caption = #1076#1086#1087#1086#1083#1085#1077#1085#1080#1081
            DataField = 'IS_DOPOLN'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object cbIsprav: TDBCheckBoxEh
            Left = 418
            Top = 38
            Width = 145
            Height = 17
            Caption = #1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1081
            DataField = 'IS_ISPRAV'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edTypeAkt: TDBComboBoxEh
            Left = 115
            Top = 62
            Width = 297
            Height = 26
            DataField = 'TYPEAKT'
            DataSource = dsDokument
            DropDownBox.Rows = 10
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            Visible = True
          end
          object edB_NOMER: TDBEditEh
            Left = 34
            Top = 95
            Width = 86
            Height = 26
            DataField = 'B_NOMER'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            Visible = True
          end
          object edB_DATE: TDBDateTimeEditEh
            Left = 167
            Top = 95
            Width = 121
            Height = 26
            DataField = 'B_DATE'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 8
            Visible = True
          end
          object edB_ZAGS: TDBEditEh
            Left = 415
            Top = 95
            Width = 394
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            DataField = 'B_ZAGS'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            Visible = True
          end
          object N_F_cbSklonen: TDBCheckBoxEh
            Left = 713
            Top = 8
            Width = 85
            Height = 17
            Caption = #1089#1082#1083#1086#1085#1103#1090#1100
            DataField = 'IS_SKLONEN'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 10
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 126
          Width = 817
          Height = 336
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 817
            Height = 116
            Align = alTop
            Caption = ' '#1055#1088#1086#1089#1080#1090' '#1074#1085#1077#1089#1090#1080' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            DesignSize = (
              817
              116)
            object edPROSIT: THunSpellDBMemo
              Left = 5
              Top = 14
              Width = 806
              Height = 97
              Anchors = [akLeft, akTop, akRight, akBottom]
              DataField = 'PROSIT'
              DataSource = dsDokument
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
              OnDblClick = TBItemEditMemoClick
              RightClickMoveCaret = False
              RightEdge = 0
            end
          end
          object GroupBox4: TGroupBox
            Left = 0
            Top = 215
            Width = 817
            Height = 121
            Align = alBottom
            Caption = ' '#1059#1057#1058#1040#1053#1054#1042#1048#1051': '#1074' '#1079#1072#1087#1080#1089#1080' '#1072#1082#1090#1072' '#1079#1085#1072#1095#1080#1090#1089#1103' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            DesignSize = (
              817
              121)
            object edUSTANOVIL: THunSpellDBMemo
              Left = 5
              Top = 14
              Width = 806
              Height = 101
              HelpContext = 999
              Anchors = [akLeft, akTop, akRight, akBottom]
              DataField = 'USTANOVIL'
              DataSource = dsDokument
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
              OnDblClick = TBItemEditMemoClick
              RightClickMoveCaret = False
              RightEdge = 0
            end
          end
          object GroupBox5: TGroupBox
            Left = 0
            Top = 116
            Width = 817
            Height = 99
            Align = alClient
            Caption = 
              ' '#1042' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' '#1089#1074#1086#1077#1081' '#1087#1088#1086#1089#1100#1073#1099' '#1079#1072#1103#1074#1080#1090#1077#1083#1077#1084' '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1083#1077#1085#1099' '#1076#1086#1082#1091#1084#1077#1085#1090 +
              #1099' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            DesignSize = (
              817
              99)
            object edDOKUMENTS: THunSpellDBMemo
              Left = 5
              Top = 15
              Width = 806
              Height = 78
              Anchors = [akLeft, akTop, akRight, akBottom]
              DataField = 'DOKUMENTS'
              DataSource = dsDokument
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
              OnDblClick = TBItemEditMemoClick
              RightClickMoveCaret = False
              RightEdge = 0
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1063#1072#1089#1090#1100' 2'
      ImageIndex = 1
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 0
        Width = 817
        Height = 462
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object Panel9: TPanel
          Left = 0
          Top = 212
          Width = 817
          Height = 108
          Align = alBottom
          BevelOuter = bvNone
          Constraints.MinHeight = 100
          TabOrder = 2
          DesignSize = (
            817
            108)
          object gbROVD: TGroupBox
            Left = 1
            Top = 2
            Width = 815
            Height = 103
            Anchors = [akLeft, akTop, akRight, akBottom]
            Caption = ' '#1050#1088#1086#1084#1077' '#1090#1086#1075#1086' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1085#1077#1089#1090#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            DesignSize = (
              815
              103)
            object edIZMEN: THunSpellDBMemo
              Left = 5
              Top = 15
              Width = 804
              Height = 82
              Anchors = [akLeft, akTop, akRight, akBottom]
              DataField = 'IZMEN'
              DataSource = dsDokument
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
              OnDblClick = TBItemEditMemoClick
              RightClickMoveCaret = False
              RightEdge = 0
            end
          end
        end
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 817
          Height = 105
          Align = alClient
          BevelOuter = bvNone
          Constraints.MinHeight = 80
          TabOrder = 0
          object GroupBox2: TGroupBox
            Left = 0
            Top = 0
            Width = 817
            Height = 105
            Align = alClient
            Caption = ' '#1042' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1077' '#1087#1088#1086#1074#1077#1088#1082#1080' '#1074#1099#1103#1074#1083#1077#1085#1086' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            DesignSize = (
              817
              105)
            object edROVD_ZAKL: THunSpellDBMemo
              Left = 5
              Top = 14
              Width = 806
              Height = 84
              HelpContext = 888
              Anchors = [akLeft, akTop, akRight, akBottom]
              DataField = 'ROVD_ZAKL'
              DataSource = dsDokument
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
              OnDblClick = TBItemEditMemoClick
              RightClickMoveCaret = False
              RightEdge = 0
            end
          end
        end
        object Panel11: TPanel
          Left = 0
          Top = 320
          Width = 817
          Height = 59
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 3
          object lbRukov: TvchDBText
            Left = 1
            Top = 8
            Width = 446
            Height = 17
            Alignment = taRightJustify
            DataField = 'DOLG_RUKOV'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbSpec: TvchDBText
            Left = 7
            Top = 35
            Width = 440
            Height = 17
            Alignment = taRightJustify
            DataField = 'DOLG_SPEC'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edRukov: TDBEditEh
            Left = 454
            Top = 3
            Width = 227
            Height = 26
            DataField = 'RUKOV'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = edRukovEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
          object edDateZ: TDBDateTimeEditEh
            Left = 701
            Top = 3
            Width = 107
            Height = 26
            DataField = 'DATEZ'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = True
            OnUpdateData = edDateRUpdateData
            EditFormat = 'DD/MM/YYYY      '
          end
          object edSpec: TDBEditEh
            Left = 454
            Top = 30
            Width = 227
            Height = 26
            Hint = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1087#1086#1076#1087#1080#1089#1100' '#1082' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1102
            DataField = 'SPEC'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = edSpecEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
        end
        object Panel12: TPanel
          Left = 0
          Top = 105
          Width = 817
          Height = 107
          Align = alBottom
          BevelOuter = bvNone
          Constraints.MinHeight = 80
          TabOrder = 1
          object GroupBox3: TGroupBox
            Left = 0
            Top = 0
            Width = 817
            Height = 107
            Align = alClient
            Caption = ' '#1055#1054#1051#1040#1043#1040#1070':          '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            DesignSize = (
              817
              107)
            object edSOOB: THunSpellDBMemo
              Left = 5
              Top = 16
              Width = 806
              Height = 85
              Anchors = [akLeft, akTop, akRight, akBottom]
              DataField = 'SOOB'
              DataSource = dsDokument
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
              OnDblClick = TBItemEditMemoClick
              RightClickMoveCaret = False
              RightEdge = 0
            end
            object N_F_cbIsIzmen: TDBCheckBoxEh
              Left = 87
              Top = -1
              Width = 97
              Height = 17
              Caption = #1088#1072#1079#1088#1077#1096#1080#1090#1100
              DataField = 'OK'
              DataSource = dsDokument
              TabOrder = 1
              TabStop = False
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
          end
        end
        object pnCopy: TPanel
          Left = 0
          Top = 379
          Width = 817
          Height = 83
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 4
          object Label6: TLabel
            Left = 27
            Top = 7
            Width = 187
            Height = 13
            Caption = #1050#1086#1087#1080#1080' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1099':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edCopy1: TDBEditEh
            Left = 233
            Top = 0
            Width = 449
            Height = 26
            DataField = 'COPY1'
            DataSource = dsDokument
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
          object edCopy2: TDBEditEh
            Left = 233
            Top = 26
            Width = 449
            Height = 26
            DataField = 'COPY2'
            DataSource = dsDokument
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
          object edCopy3: TDBEditEh
            Left = 233
            Top = 55
            Width = 449
            Height = 26
            HelpContext = 999
            DataField = 'COPY3'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
          object N_F_DeleteCRLF: TDBCheckBoxEh
            Left = 3
            Top = 57
            Width = 198
            Height = 17
            Caption = #1059#1076#1072#1083#1103#1090#1100' '#1087#1077#1088#1077#1074#1086#1076#1099' '#1082#1072#1088#1077#1090#1082#1080
            DataField = 'DELETE_CRLF'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
      end
    end
  end
  inherited dsDokument: TDataSource
    Left = 704
    Top = 250
  end
  inherited Dokument: TkbmMemTable
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NAME_ZAGS'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'NAME_ZAGS_B'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ID_ZAGS'
        DataType = ftInteger
      end
      item
        Name = 'DateIzm'
        DataType = ftDate
      end
      item
        Name = 'TYPEAKT'
        DataType = ftInteger
      end
      item
        Name = 'NOMER_EKZ'
        DataType = ftInteger
      end
      item
        Name = 'POVTOR'
        DataType = ftBoolean
      end
      item
        Name = 'TYPE_EKZ'
        DataType = ftInteger
      end
      item
        Name = 'IS_GOROD'
        DataType = ftBoolean
      end
      item
        Name = 'DATE_ANUL'
        DataType = ftDate
      end
      item
        Name = 'PRINT_VOSSTAN'
        DataType = ftBoolean
      end
      item
        Name = 'NOMER'
        DataType = ftInteger
      end
      item
        Name = 'DATEZ'
        DataType = ftDate
      end
      item
        Name = 'MEN_ID'
        DataType = ftInteger
      end
      item
        Name = 'LICH_ID'
        DataType = ftInteger
      end
      item
        Name = 'ADRESAT'
        DataType = ftMemo
      end
      item
        Name = 'Familia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Otch'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IS_SKLONEN'
        DataType = ftBoolean
      end
      item
        Name = 'POL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'B_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'B_DATE'
        DataType = ftDate
      end
      item
        Name = 'B_ZAGS'
        DataType = ftMemo
      end
      item
        Name = 'ROVD_ZAKL'
        DataType = ftMemo
      end
      item
        Name = 'SOOB'
        DataType = ftMemo
      end
      item
        Name = 'IZMEN'
        DataType = ftMemo
      end
      item
        Name = 'RUKOV'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'IS_IZMEN'
        DataType = ftBoolean
      end
      item
        Name = 'IS_ISPRAV'
        DataType = ftBoolean
      end
      item
        Name = 'IS_DOPOLN'
        DataType = ftBoolean
      end
      item
        Name = 'PROSIT'
        DataType = ftMemo
      end
      item
        Name = 'DOKUMENTS'
        DataType = ftMemo
      end
      item
        Name = 'USTANOVIL'
        DataType = ftMemo
      end
      item
        Name = 'DOLG_RUKOV'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'COPY1'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'COPY2'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'COPY3'
        DataType = ftString
        Size = 100
      end>
    Left = 600
    Top = 226
    object DokumentID_ZAGS: TIntegerField [3]
      FieldName = 'ID_ZAGS'
    end
    object DokumentTYPEAKT: TIntegerField [5]
      FieldName = 'TYPEAKT'
    end
    object DokumentNOMER: TIntegerField [12]
      FieldName = 'NOMER'
    end
    object DokumentDATEZ: TDateField [13]
      FieldName = 'DATEZ'
    end
    object DokumentMEN_ID: TIntegerField [14]
      FieldName = 'MEN_ID'
    end
    object DokumentLICH_ID: TIntegerField [15]
      FieldName = 'LICH_ID'
    end
    object DokumentADRESAT: TMemoField [16]
      FieldName = 'ADRESAT'
      BlobType = ftMemo
    end
    object DokumentFamilia: TStringField [17]
      FieldName = 'Familia'
      Size = 50
    end
    object DokumentName: TStringField [18]
      FieldName = 'Name'
      Size = 30
    end
    object DokumentOtch: TStringField [19]
      FieldName = 'Otch'
      Size = 30
    end
    object DokumentIS_SKLONEN: TBooleanField [20]
      FieldName = 'IS_SKLONEN'
    end
    object DokumentPOL: TStringField [21]
      FieldName = 'POL'
      Size = 1
    end
    object DokumentB_NOMER: TStringField [22]
      FieldName = 'B_NOMER'
      Size = 10
    end
    object DokumentB_DATE: TDateField [23]
      FieldName = 'B_DATE'
    end
    object DokumentB_ZAGS: TMemoField [24]
      FieldName = 'B_ZAGS'
      BlobType = ftMemo
    end
    object DokumentROVD_ZAKL: TMemoField [25]
      FieldName = 'ROVD_ZAKL'
      BlobType = ftMemo
    end
    object DokumentSOOB: TMemoField [26]
      FieldName = 'SOOB'
      BlobType = ftMemo
    end
    object DokumentIZMEN: TMemoField [27]
      FieldName = 'IZMEN'
      BlobType = ftMemo
    end
    object DokumentRUKOV: TStringField [28]
      FieldName = 'RUKOV'
      Size = 50
    end
    object DokumentIS_IZMEN: TBooleanField [29]
      FieldName = 'IS_IZMEN'
    end
    object DokumentIS_ISPRAV: TBooleanField [30]
      FieldName = 'IS_ISPRAV'
    end
    object DokumentIS_DOPOLN: TBooleanField [31]
      FieldName = 'IS_DOPOLN'
    end
    object DokumentPROSIT: TMemoField [32]
      FieldName = 'PROSIT'
      BlobType = ftMemo
    end
    object DokumentDOKUMENTS: TMemoField [33]
      FieldName = 'DOKUMENTS'
      BlobType = ftMemo
    end
    object DokumentUSTANOVIL: TMemoField [34]
      FieldName = 'USTANOVIL'
      BlobType = ftMemo
    end
    object DokumentDOLG_RUKOV: TStringField [35]
      FieldName = 'DOLG_RUKOV'
      Size = 200
    end
    object DokumentCOPY1: TStringField [36]
      FieldName = 'COPY1'
      Size = 100
    end
    object DokumentCOPY2: TStringField [37]
      FieldName = 'COPY2'
      Size = 100
    end
    object DokumentCOPY3: TStringField [38]
      FieldName = 'COPY3'
      Size = 100
    end
    object DokumentSPEC: TStringField [39]
      FieldName = 'SPEC'
      Size = 60
    end
    object DokumentDOLG_SPEC: TStringField [40]
      FieldName = 'DOLG_SPEC'
      Size = 100
    end
    object DokumentOK: TBooleanField
      FieldName = 'OK'
    end
  end
  object dsStran: TDataSource [9]
    DataSet = dmBase.SprStran
    Left = 676
    Top = 321
  end
  object dsNation: TDataSource [10]
    DataSet = dmBase.SprNac
    Left = 772
    Top = 305
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 752
    Top = 162
  end
  inherited HistZAGS: TkbmMemTable
    Left = 776
    Top = 98
  end
  inherited dsSeria: TDataSource
    Left = 480
    Top = 362
  end
  inherited dsObl: TDataSource
    Left = 536
    Top = 378
  end
  object dsGragd: TDataSource [15]
    Left = 612
    Top = 321
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 752
    Top = 162
  end
  inherited dsPovtor: TDataSource
    Left = 728
    Top = 298
  end
  inherited dsRN: TDataSource
    Left = 576
    Top = 378
  end
  inherited dsGorod: TDataSource
    Left = 696
    Top = 362
  end
  inherited dsRnGor: TDataSource
    Left = 624
    Top = 354
  end
  inherited dsTypeGorod: TDataSource
    Left = 728
    Top = 250
  end
  inherited ImGISUN: TImageList
    Left = 780
    Top = 27
  end
  inherited dsVoenkom: TDataSource
    Left = 704
    Top = 114
  end
  inherited dsRovd: TDataSource
    Top = 130
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 680
    Top = 162
  end
  object ApplicationEvents1: TApplicationEvents [26]
    Left = 742
    Top = 336
  end
  object dsDeti: TDataSource [27]
    DataSet = tbDeti
    Left = 652
    Top = 281
  end
  object tbDeti: TkbmMemTable [28]
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'FAMILIA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OTCH'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'POL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATER'
        DataType = ftDate
      end
      item
        Name = 'CHILD_ID'
        DataType = ftInteger
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.52'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 512
    Top = 226
    object tbDetiFIO: TStringField
      FieldName = 'FIO'
      Size = 100
    end
    object tbDetiMESTO: TStringField
      FieldName = 'MESTO'
      Size = 100
    end
    object tbDetiDATER: TDateField
      FieldName = 'DATER'
    end
    object tbDetiMESTOREG: TStringField
      FieldName = 'MESTOREG'
      Size = 100
    end
    object tbDetiNOMER: TStringField
      FieldName = 'NOMER'
      Size = 10
    end
    object tbDetiDATEA: TDateField
      FieldName = 'DATEA'
    end
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 568
    Top = 106
  end
  inherited Zip: TZipForge
    Top = 114
  end
end
