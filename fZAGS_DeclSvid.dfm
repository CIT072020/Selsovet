inherited fmZAGS_DeclSvid: TfmZAGS_DeclSvid
  Left = 469
  Top = 142
  Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077' '#1086' '#1074#1099#1076#1072#1095#1077' '#1087#1086#1074#1090#1086#1088#1085#1086#1075#1086' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072
  ClientHeight = 621
  ClientWidth = 806
  Constraints.MinHeight = 590
  Constraints.MinWidth = 800
  Icon.Data = {
    0000010001001010000001001800680300001600000028000000100000002000
    0000010018000000000000030000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000848484840000840000840000840000000000
    8400008400008400008400008400000000008400008400008400008400008484
    84FFFFFFFFFFFFFFFFFFFFFFFF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84
    8484FFFFFFFFFFFFFFFFFF840000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8400008484
    84FFFFFF840000840000840000840000840000840000840000FFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFF840000848484FFFFFF840000840000840000840000
    840000840000840000FFFFFF848484848484848484848484FFFFFF8400008484
    84FFFFFF840000840000840000FFFFFF840000840000840000FFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFF840000848484FFFFFFFFFFFF840000FFFFFFFFFFFF
    FFFFFF840000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8400008484
    84FFFFFFFFFFFFFFFFFF008484840000008484FFFFFFFFFFFFFFFFFF84848484
    8484848484848484FFFFFF840000848484FFFFFFFFFFFFFFFFFF840000840000
    840000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8400008484
    84FFFFFFFFFFFFFFFFFF008484840000008484FFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFF840000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8400000000
    0084848484848484848484848484848484848484848484848484848484848484
    8484848484848484848484000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    0000041000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000080010000FFFF0000FFFF0000FFFF0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 599
    Width = 806
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited pnTable: TPanel
    Top = 599
    Width = 806
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 806
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
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      inherited TBItemShablon: TTBItem
        Visible = True
      end
      object TBItem1: TTBItem [41]
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 802
        Top = 22
      end
    end
  end
  inherited sb: TScrollBox
    Width = 806
    Height = 549
    Align = alClient
    inherited pnPovtor: TPanel
      Left = 514
      Top = 487
      Width = 295
      Height = 34
      TabOrder = 4
      Visible = False
      inherited DbGridEh1: TDBGridEh
        Left = -77
        Top = -5
        Height = 21
      end
    end
    inherited N_F_edTypeEkz: TComboBox
      TabOrder = 3
    end
    object pn: TPanel
      Left = 0
      Top = 0
      Width = 806
      Height = 309
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        806
        309)
      object Label7: TLabel
        Left = 8
        Top = 13
        Width = 37
        Height = 13
        Caption = #1053#1086#1084#1077#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 155
        Top = 13
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
      object ImageGISUN: TImage
        Left = 302
        Top = 6
        Width = 20
        Height = 20
        Anchors = [akTop, akRight]
        Transparent = True
        Visible = False
      end
      object Label1: TLabel
        Left = 110
        Top = 42
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
        Left = 340
        Top = 42
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
      object Label3: TLabel
        Left = 512
        Top = 42
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
      object Label5: TLabel
        Left = 712
        Top = 42
        Width = 22
        Height = 13
        Caption = #1055#1086#1083
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lbSvid: TLabel
        Left = 330
        Top = 10
        Width = 140
        Height = 13
        Caption = #1042#1099#1076#1072#1085#1086' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label55: TLabel
        Left = 553
        Top = 8
        Width = 15
        Height = 16
        Caption = #8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label56: TLabel
        Left = 672
        Top = 10
        Width = 12
        Height = 13
        Caption = #1086#1090
      end
      object Label16: TLabel
        Left = 8
        Top = 42
        Width = 62
        Height = 13
        Caption = #1047#1072#1103#1074#1080#1090#1077#1083#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 12
        Top = 253
        Width = 74
        Height = 13
        Caption = #1047#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 501
        Top = 253
        Width = 13
        Height = 13
        Caption = #8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 102
        Top = 283
        Width = 58
        Height = 13
        Caption = #1089#1086#1089#1090#1072#1074#1083#1077#1085#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 469
        Top = 253
        Width = 6
        Height = 13
        Caption = #1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label41: TLabel
        Left = 637
        Top = 253
        Width = 12
        Height = 13
        Caption = #1086#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edNomer: TDBEditEh
        Left = 58
        Top = 6
        Width = 84
        Height = 26
        HelpContext = 888
        DataField = 'NOMER'
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
      object edDateZ: TDBDateTimeEditEh
        Left = 185
        Top = 6
        Width = 105
        Height = 26
        DataField = 'DATEZ'
        DataSource = dsDokument
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
      object edFamilia: TDBEditEh
        Left = 177
        Top = 35
        Width = 141
        Height = 26
        DataField = 'Familia'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = True
      end
      object edName: TDBEditEh
        Left = 381
        Top = 35
        Width = 107
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
        TabOrder = 6
        Visible = True
      end
      object edOtch: TDBEditEh
        Left = 583
        Top = 35
        Width = 107
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
        TabOrder = 7
        Visible = True
      end
      object edPol: TDBComboBoxEh
        Left = 750
        Top = 35
        Width = 43
        Height = 26
        DataField = 'POL'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        Visible = False
      end
      object gbAdres: TGroupBox
        Left = 3
        Top = 61
        Width = 800
        Height = 96
        Anchors = [akLeft, akTop, akRight]
        Caption = #1055#1088#1086#1078#1080#1074#1072#1102#1097#1080#1081' '#1087#1086' '#1072#1076#1088#1077#1089#1091' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        object Label15: TLabel
          Left = 22
          Top = 20
          Width = 134
          Height = 13
          Caption = #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072' ('#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1086')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 411
          Top = 20
          Width = 76
          Height = 13
          Caption = #1086#1073#1083#1072#1089#1090#1100' ('#1082#1088#1072#1081')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 22
          Top = 47
          Width = 30
          Height = 13
          Caption = #1088#1072#1081#1086#1085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 411
          Top = 47
          Width = 82
          Height = 13
          Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label53: TLabel
          Left = 22
          Top = 74
          Width = 65
          Height = 13
          Caption = #1091#1083'., '#1076#1086#1084', '#1082#1074'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edGT_B_RESP: TDBCheckBoxEh
          Left = 165
          Top = 18
          Width = 15
          Height = 17
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object edGT_GOSUD: TDBLookupComboboxEh
          Left = 185
          Top = 13
          Width = 205
          Height = 26
          DataField = 'GT_GOSUD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsStran
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object edGT_B_OBL: TDBCheckBoxEh
          Left = 498
          Top = 18
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'GT_B_OBL'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edGT_GOROD: TDBEditEh
          Left = 594
          Top = 40
          Width = 162
          Height = 26
          DataField = 'GT_GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Visible = True
        end
        object edGT_GOROD_R: TDBEditEh
          Left = 185
          Top = 67
          Width = 310
          Height = 26
          DataField = 'GT_GOROD_R'
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
        object edGT_RNGOROD: TDBLookupComboboxEh
          Left = 519
          Top = 67
          Width = 237
          Height = 26
          DataSource = dsDokument
          DropDownBox.Rows = 15
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'R_NAME'
          ListField = 'R_NAME'
          ListSource = dsRnGor
          ParentFont = False
          Style = csDropDownEh
          TabOrder = 6
          Visible = False
        end
        object edGT_B_GOROD: TDBLookupComboboxEh
          Left = 519
          Top = 40
          Width = 66
          Height = 26
          Alignment = taRightJustify
          DataField = 'GT_B_GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsTypeGorod
          ParentFont = False
          TabOrder = 4
          Visible = True
        end
        object edGT_RN: TDBEditEh
          Left = 185
          Top = 40
          Width = 205
          Height = 26
          DataField = 'GT_RAION'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = True
        end
        object edGT_OBL: TDBEditEh
          Left = 519
          Top = 13
          Width = 237
          Height = 26
          DataField = 'GT_OBL'
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
      end
      object edSVID_SERIA: TDBLookupComboboxEh
        Left = 484
        Top = 4
        Width = 60
        Height = 26
        DataField = 'SVID_SERIA'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'SERIA'
        ListField = 'SERIA'
        ListSource = dsSeria
        ParentFont = False
        TabOrder = 2
        Visible = True
      end
      object edSvid_Nomer: TDBEditEh
        Left = 573
        Top = 4
        Width = 89
        Height = 26
        DataField = 'SVID_NOMER'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        TabOrder = 3
        Visible = True
        EditMask = '9999999;0;_'
      end
      object edDateSv: TDBDateTimeEditEh
        Left = 688
        Top = 4
        Width = 105
        Height = 26
        DataField = 'DateSV'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 4
        Visible = True
      end
      object gbDok: TGroupBox
        Left = 3
        Top = 154
        Width = 800
        Height = 87
        Anchors = [akLeft, akTop, akRight]
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1080#1081' '#1083#1080#1095#1085#1086#1089#1090#1100' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        object Label69: TLabel
          Left = 629
          Top = 26
          Width = 12
          Height = 13
          Caption = #1086#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 380
          Top = 26
          Width = 29
          Height = 13
          Caption = #1089#1077#1088#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 484
          Top = 26
          Width = 30
          Height = 13
          Caption = #1085#1086#1084#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 15
          Top = 54
          Width = 137
          Height = 13
          Caption = #1086#1088#1075#1072#1085' '#1074#1099#1076#1072#1074#1096#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edDOK_TYPE: TDBComboBoxEh
          Left = 15
          Top = 19
          Width = 347
          Height = 26
          DataField = 'DOK_TYPE'
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
        object edDOK_SERIA: TDBEditEh
          Left = 420
          Top = 19
          Width = 52
          Height = 26
          CharCase = ecUpperCase
          DataField = 'DOK_SERIA'
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
        object edDOKUMENT: TDBEditEh
          Left = 167
          Top = 49
          Width = 461
          Height = 26
          DataField = 'DOKUMENT'
          DataSource = dsDokument
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
        object edDOK_DATE: TDBDateTimeEditEh
          Left = 656
          Top = 19
          Width = 105
          Height = 26
          DataField = 'DOK_DATE'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 3
          Visible = True
        end
        object edDOK_NOMER: TDBEditEh
          Left = 525
          Top = 19
          Width = 89
          Height = 26
          DataField = 'DOK_NOMER'
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
      end
      object edTypeAkt: TDBComboBoxEh
        Left = 98
        Top = 246
        Width = 343
        Height = 26
        DataField = 'TYPE_AKT'
        DataSource = dsDokument
        DropDownBox.Rows = 10
        EditButtons = <
          item
            Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072
            Style = ebsEllipsisEh
            OnClick = edTypeAktEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        Visible = True
        OnChange = edTypeAktChange
      end
      object edNomerAkt: TDBEditEh
        Left = 526
        Top = 246
        Width = 93
        Height = 26
        HelpContext = 888
        DataField = 'NOMER_AKT'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        Visible = True
      end
      object edDateAkt: TDBDateTimeEditEh
        Left = 667
        Top = 246
        Width = 119
        Height = 26
        DataField = 'DATE_AKT'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 13
        Visible = True
      end
      object edNAME_ZAGS: TDBEditEh
        Left = 178
        Top = 276
        Width = 608
        Height = 26
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        DataField = 'NAME_ZAGS'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        Visible = True
      end
    end
    object pnRukov: TPanel
      Left = 0
      Top = 510
      Width = 806
      Height = 39
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object lbRukov: TvchDBText
        Left = 8
        Top = 13
        Width = 532
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
      object edRukov: TDBEditEh
        Left = 552
        Top = 7
        Width = 225
        Height = 26
        HelpContext = 999
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
    end
    object pcAkt: TPageControl
      Left = 0
      Top = 309
      Width = 806
      Height = 201
      ActivePage = tsRogd
      Align = alClient
      TabOrder = 1
      object tsRogd: TTabSheet
        Caption = #1056#1086#1078#1076#1077#1085#1080#1077
        ParentShowHint = False
        ShowHint = True
        DesignSize = (
          798
          173)
        object Label13: TLabel
          Left = 14
          Top = 11
          Width = 268
          Height = 13
          Caption = #1060#1072#1084#1080#1083#1080#1103', '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1077' '#1080#1084#1103', '#1086#1090#1095#1077#1089#1090#1074#1086' '#1088#1077#1073#1077#1085#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 14
          Top = 71
          Width = 101
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 14
          Top = 101
          Width = 30
          Height = 13
          Caption = #1054#1090#1077#1094
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 14
          Top = 131
          Width = 31
          Height = 13
          Caption = #1052#1072#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 14
          Top = 41
          Width = 95
          Height = 13
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edFIO_Child: TDBEditEh
          Left = 297
          Top = 4
          Width = 385
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FIO'
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
        object edMestoR: TDBEditEh
          Left = 125
          Top = 64
          Width = 557
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'MESTO'
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
        object edOtec: TDBEditEh
          Left = 125
          Top = 94
          Width = 385
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FIO1'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = True
        end
        object edMat: TDBEditEh
          Left = 125
          Top = 124
          Width = 385
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FIO2'
          DataSource = dsDokument
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
        object edDateR: TDBDateTimeEditEh
          Left = 125
          Top = 34
          Width = 105
          Height = 26
          DataField = 'DATE_FOR'
          DataSource = dsDokument
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
      end
      object tsBrak: TTabSheet
        Caption = 'tsBrak'
        ImageIndex = 1
        DesignSize = (
          798
          173)
        object Label21: TLabel
          Left = 14
          Top = 11
          Width = 574
          Height = 13
          Caption = 
            #1060#1072#1084#1080#1083#1080#1103', '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1077' '#1080#1084#1103', '#1086#1090#1095#1077#1089#1090#1074#1086' '#1083#1080#1094', '#1074#1089#1090#1091#1087#1080#1074#1096#1080#1093' '#1074' '#1073#1088#1072#1082' ('#1091#1082#1072#1079#1099 +
            #1074#1072#1102#1090#1089#1103' '#1076#1086#1073#1088#1072#1095#1085#1099#1077' '#1092#1072#1084#1080#1083#1080#1080')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 14
          Top = 96
          Width = 220
          Height = 13
          Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103' '#1073#1088#1072#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 14
          Top = 127
          Width = 226
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103' '#1073#1088#1072#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 14
          Top = 36
          Width = 15
          Height = 13
          Caption = #1054#1085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 14
          Top = 66
          Width = 22
          Height = 13
          Caption = #1054#1085#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edDateBrak: TDBDateTimeEditEh
          Left = 260
          Top = 89
          Width = 105
          Height = 26
          DataField = 'DATE_FOR'
          DataSource = dsDokument
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
        object edMestoB: TDBEditEh
          Left = 260
          Top = 120
          Width = 450
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'MESTO'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = True
        end
        object edONB: TDBEditEh
          Left = 260
          Top = 29
          Width = 385
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FIO1'
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
        object edONAB: TDBEditEh
          Left = 260
          Top = 59
          Width = 385
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FIO2'
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
      end
      object tsRast: TTabSheet
        Caption = 'tsRast'
        ImageIndex = 2
        DesignSize = (
          798
          173)
        object Label44: TLabel
          Left = 14
          Top = 11
          Width = 365
          Height = 13
          Caption = #1060#1072#1084#1080#1083#1080#1103', '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1077' '#1080#1084#1103', '#1086#1090#1095#1077#1089#1090#1074#1086' '#1083#1080#1094', '#1088#1072#1089#1090#1086#1088#1075#1072#1102#1097#1080#1093' '#1073#1088#1072#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label45: TLabel
          Left = 14
          Top = 36
          Width = 15
          Height = 13
          Caption = #1054#1085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label46: TLabel
          Left = 14
          Top = 66
          Width = 22
          Height = 13
          Caption = #1054#1085#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label47: TLabel
          Left = 14
          Top = 96
          Width = 227
          Height = 13
          Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1103' '#1073#1088#1072#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label48: TLabel
          Left = 14
          Top = 127
          Width = 233
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1103' '#1073#1088#1072#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edOnRast: TDBEditEh
          Left = 267
          Top = 29
          Width = 385
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FIO1'
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
        object edOnaRast: TDBEditEh
          Left = 267
          Top = 59
          Width = 385
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FIO2'
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
        object edDateRast: TDBDateTimeEditEh
          Left = 267
          Top = 89
          Width = 105
          Height = 26
          DataField = 'DATE_FOR'
          DataSource = dsDokument
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
        object edMestoRast: TDBEditEh
          Left = 267
          Top = 120
          Width = 450
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'MESTO'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = True
        end
      end
      object tsUst: TTabSheet
        Caption = 'tsUst'
        ImageIndex = 3
        DesignSize = (
          798
          173)
        object Label29: TLabel
          Left = 8
          Top = 5
          Width = 268
          Height = 13
          Caption = #1060#1072#1084#1080#1083#1080#1103', '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1077' '#1080#1084#1103', '#1086#1090#1095#1077#1089#1090#1074#1086' '#1088#1077#1073#1077#1085#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 8
          Top = 117
          Width = 107
          Height = 13
          Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 8
          Top = 145
          Width = 113
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 40
          Top = 59
          Width = 119
          Height = 13
          Caption = #1087#1086#1089#1083#1077' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbUst: TLabel
          Left = 8
          Top = 88
          Width = 140
          Height = 13
          Caption = #1054#1090#1094#1086#1084' '#1088#1077#1073#1077#1085#1082#1072' '#1087#1088#1080#1079#1085#1072#1085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label49: TLabel
          Left = 40
          Top = 31
          Width = 101
          Height = 13
          Caption = #1076#1086' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edUstDo: TDBEditEh
          Left = 172
          Top = 24
          Width = 385
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FIO1'
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
        object edDateUst: TDBDateTimeEditEh
          Left = 172
          Top = 110
          Width = 105
          Height = 26
          DataField = 'DATE_FOR'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 3
          Visible = True
        end
        object edMestoUst: TDBEditEh
          Left = 172
          Top = 138
          Width = 557
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'MESTO'
          DataSource = dsDokument
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
        object edUstPosle: TDBEditEh
          Left = 172
          Top = 52
          Width = 364
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FIO2'
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
        object edRoditelUst: TDBEditEh
          Left = 172
          Top = 81
          Width = 385
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FIO'
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
      end
      object tsSmert: TTabSheet
        Caption = 'tsSmert'
        ImageIndex = 4
        DesignSize = (
          798
          173)
        object Label34: TLabel
          Left = 14
          Top = 11
          Width = 277
          Height = 13
          Caption = #1060#1072#1084#1080#1083#1080#1103', '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1077' '#1080#1084#1103', '#1086#1090#1095#1077#1089#1090#1074#1086' '#1091#1084#1077#1088#1096#1077#1075#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 14
          Top = 41
          Width = 75
          Height = 13
          Caption = #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label36: TLabel
          Left = 14
          Top = 71
          Width = 81
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1089#1084#1077#1088#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edFIOSm: TDBEditEh
          Left = 311
          Top = 4
          Width = 385
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FIO'
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
        object edDateSm: TDBDateTimeEditEh
          Left = 125
          Top = 34
          Width = 105
          Height = 26
          DataField = 'DATE_FOR'
          DataSource = dsDokument
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
        object edMestoSm: TDBEditEh
          Left = 125
          Top = 64
          Width = 557
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'MESTO'
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
      end
      object tsChName: TTabSheet
        Caption = 'tsChName'
        ImageIndex = 5
        DesignSize = (
          798
          173)
        object Label37: TLabel
          Left = 8
          Top = 5
          Width = 247
          Height = 13
          Caption = #1060#1072#1084#1080#1083#1080#1103', '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1077' '#1080#1084#1103', '#1086#1090#1095#1077#1089#1090#1074#1086' '#1083#1080#1094#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 8
          Top = 86
          Width = 107
          Height = 13
          Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 8
          Top = 114
          Width = 113
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 21
          Top = 59
          Width = 173
          Height = 13
          Caption = #1087#1086#1089#1083#1077' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1087#1077#1088#1077#1084#1077#1085#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label42: TLabel
          Left = 21
          Top = 31
          Width = 155
          Height = 13
          Caption = #1076#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1087#1077#1088#1077#1084#1077#1085#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edFIO1Ch: TDBEditEh
          Left = 213
          Top = 24
          Width = 385
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FIO1'
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
        object edDateChName: TDBDateTimeEditEh
          Left = 213
          Top = 79
          Width = 105
          Height = 26
          DataField = 'DATE_FOR'
          DataSource = dsDokument
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
        object edMestoChName: TDBEditEh
          Left = 213
          Top = 107
          Width = 557
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'MESTO'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = True
        end
        object edFIO2Ch: TDBEditEh
          Left = 213
          Top = 51
          Width = 364
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FIO2'
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
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 599
    Width = 806
  end
  inherited pnAdd: TPanel
    Width = 806
  end
  inherited dsDokument: TDataSource
    Left = 640
    Top = 402
  end
  inherited Dokument: TkbmMemTable
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NOMER'
        DataType = ftString
        Size = 15
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
        Name = 'POL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DateR'
        DataType = ftDate
      end
      item
        Name = 'RUKOV'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DOLG_RUKOV'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'VN_SVED'
        DataType = ftMemo
      end
      item
        Name = 'IS_VN_IZM'
        DataType = ftInteger
      end
      item
        Name = 'VN_IZM'
        DataType = ftMemo
      end
      item
        Name = 'DATE_AKT'
        DataType = ftDate
      end
      item
        Name = 'NOMER_AKT'
        DataType = ftInteger
      end
      item
        Name = 'TYPEAKT'
        DataType = ftInteger
      end>
    Left = 584
    Top = 322
    object DokumentNOMER: TStringField [1]
      FieldName = 'NOMER'
      Size = 15
    end
    object DokumentID_ZAGS: TIntegerField [4]
      FieldName = 'ID_ZAGS'
    end
    object DokumentDATEZ: TDateField
      FieldName = 'DATEZ'
    end
    object DokumentMEN_ID: TIntegerField
      FieldName = 'MEN_ID'
    end
    object DokumentLICH_ID: TIntegerField
      FieldName = 'LICH_ID'
    end
    object DokumentFamilia: TStringField
      FieldName = 'Familia'
      Size = 50
    end
    object DokumentName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object DokumentOtch: TStringField
      FieldName = 'Otch'
      Size = 30
    end
    object DokumentPOL: TStringField
      FieldName = 'POL'
      Size = 1
    end
    object DokumentDateR: TDateField
      FieldName = 'DateR'
    end
    object DokumentRUKOV: TStringField
      FieldName = 'RUKOV'
      Size = 60
    end
    object DokumentDOLG_RUKOV: TStringField
      FieldName = 'DOLG_RUKOV'
      Size = 200
    end
    object DokumentDATE_AKT: TDateField
      FieldName = 'DATE_AKT'
    end
    object DokumentNOMER_AKT: TIntegerField
      FieldName = 'NOMER_AKT'
    end
    object DokumentTYPE_AKT: TIntegerField
      FieldName = 'TYPE_AKT'
    end
    object DokumentSVID_SERIA: TStringField
      FieldName = 'SVID_SERIA'
      Size = 10
    end
    object DokumentSVID_NOMER: TStringField
      FieldName = 'SVID_NOMER'
    end
    object DokumentDATESV: TDateField
      FieldName = 'DATESV'
    end
    object DokumentDOK_TYPE: TIntegerField
      FieldName = 'DOK_TYPE'
    end
    object DokumentDOK_SERIA: TStringField
      FieldName = 'DOK_SERIA'
      Size = 7
    end
    object DokumentDOK_NOMER: TStringField
      FieldName = 'DOK_NOMER'
      Size = 10
    end
    object DokumentDOK_DATE: TDateField
      FieldName = 'DOK_DATE'
    end
    object DokumentDOKUMENT: TStringField
      FieldName = 'DOKUMENT'
      Size = 200
    end
    object DokumentGT_GOSUD: TIntegerField
      FieldName = 'GT_GOSUD'
    end
    object DokumentGT_B_OBL: TBooleanField
      FieldName = 'GT_B_OBL'
    end
    object DokumentGT_OBL: TStringField
      FieldName = 'GT_OBL'
      Size = 50
    end
    object DokumentGT_RAION: TStringField
      FieldName = 'GT_RAION'
      Size = 50
    end
    object DokumentGT_B_GOROD: TIntegerField
      FieldName = 'GT_B_GOROD'
    end
    object DokumentGT_GOROD: TStringField
      FieldName = 'GT_GOROD'
      Size = 50
    end
    object DokumentGT_GOROD_R: TStringField
      FieldName = 'GT_GOROD_R'
      Size = 100
    end
    object DokumentFIO: TStringField
      FieldName = 'FIO'
      Size = 150
    end
    object DokumentFIO1: TStringField
      FieldName = 'FIO1'
      Size = 150
    end
    object DokumentFIO2: TStringField
      FieldName = 'FIO2'
      Size = 150
    end
    object DokumentMESTO: TStringField
      FieldName = 'MESTO'
      Size = 200
    end
    object DokumentDATE_FOR: TDateField
      FieldName = 'DATE_FOR'
    end
    object DokumentAKT_ID: TIntegerField
      FieldName = 'AKT_ID'
    end
    object DokumentAKT_ID_ZAGS: TIntegerField
      FieldName = 'AKT_ID_ZAGS'
    end
  end
  object dsStran: TDataSource [8]
    DataSet = dmBase.SprStran
    Left = 676
    Top = 353
  end
  object dsNation: TDataSource [9]
    DataSet = dmBase.SprNac
    Left = 740
    Top = 321
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 680
    Top = 250
  end
  inherited HistZAGS: TkbmMemTable
    Left = 480
    Top = 402
  end
  inherited dsSeria: TDataSource
    Left = 512
    Top = 338
  end
  inherited dsObl: TDataSource
    Left = 536
    Top = 378
  end
  object dsGragd: TDataSource [14]
    Left = 740
    Top = 465
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 504
    Top = 434
  end
  inherited dsPovtor: TDataSource
    Left = 704
    Top = 474
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
    Left = 688
    Top = 402
  end
  inherited ImGISUN: TImageList
    Left = 732
    Top = 27
  end
  inherited dsVoenkom: TDataSource
    Left = 456
    Top = 362
  end
  inherited dsRovd: TDataSource
    Left = 424
    Top = 362
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 736
    Top = 250
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 488
    Top = 90
  end
  inherited Zip: TZipForge
    Left = 712
    Top = 106
  end
  inherited tbReshSud: TkbmMemTable
    Top = 314
  end
  object ApplicationEvents1: TApplicationEvents
    Left = 734
    Top = 392
  end
end
