inherited fmZAGS_SprOtsut: TfmZAGS_SprOtsut
  Left = 298
  Top = 132
  Caption = #1057#1087#1088#1072#1074#1082#1072' ('#1086#1073' '#1086#1090#1089#1091#1090#1089#1090#1074#1080#1080' '#1079#1072#1087#1080#1089#1080' '#1072#1082#1090#1072' '#1086' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1080' '#1073#1088#1072#1082#1072')'
  ClientHeight = 662
  ClientWidth = 859
  Constraints.MinHeight = 680
  Icon.Data = {
    0000010001001010000001000400280100001600000028000000100000002000
    0000010004000000000080000000000000000000000000000000000000000000
    0000800000000080000080800000000080008000800000808000C0C0C0008080
    8000FF00000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF000000
    0000C4470C44000000000C48C4400000000070C4480000000000004C44700000
    000404C8C44700000044CCC80C440000444444408000000CCCC444440800004C
    CCCC44444000004FCCCCCC444000004FCCC4CC444000000CFC40CC4400000000
    44000C400000000000000000000000000000000000000000000000000000FF08
    0000FF810000FF430000FE410000FC000000F8080000E0070000C0030000C003
    0000C0030000C0030000C0070000E10F0000FFFF0000FFFF0000FFFF0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 640
    Width = 859
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited pnTable: TPanel
    Top = 640
    Width = 859
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 859
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
      inherited TBToolbarOrgan: TTBToolbar
        Left = 345
      end
    end
  end
  inherited sb: TScrollBox
    Width = 859
    Height = 590
    Align = alClient
    inherited pnPovtor: TPanel
      Left = 538
      Top = 495
      Width = 295
      Height = 34
      TabOrder = 5
      Visible = False
      inherited DbGridEh1: TDBGridEh
        Left = 3
        Top = 3
        Height = 21
      end
    end
    inherited N_F_edTypeEkz: TComboBox
      TabOrder = 6
    end
    object pn: TPanel
      Left = 0
      Top = 0
      Width = 859
      Height = 54
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        859
        54)
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
        Left = 171
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
        Left = 830
        Top = 5
        Width = 20
        Height = 20
        Anchors = [akTop, akRight]
        Transparent = True
        Visible = False
      end
      object Label4: TLabel
        Left = 354
        Top = 13
        Width = 51
        Height = 13
        Caption = #1040#1076#1088#1077#1089#1072#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbBel: TLabel
        Left = 34
        Top = 34
        Width = 109
        Height = 16
        Caption = #1085#1072' '#1073#1077#1083#1086#1088#1091#1089#1089#1082#1086#1084
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNomer: TDBEditEh
        Left = 64
        Top = 6
        Width = 93
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
        Left = 201
        Top = 6
        Width = 120
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
      object edAdresat: TDBEditEh
        Left = 425
        Top = 6
        Width = 420
        Height = 43
        HelpContext = 888
        Anchors = [akTop, akRight]
        AutoSelect = False
        AutoSize = False
        DataField = 'ADRESAT'
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
        WantReturns = True
      end
      object N_F_cbBelorus: TDBCheckBoxEh
        Left = 16
        Top = 34
        Width = 17
        Height = 16
        Hint = #1053#1072' '#1073#1077#1083#1086#1088#1091#1089#1089#1082#1086#1084' '#1103#1079#1099#1082#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = N_F_cbBelorusClick
      end
    end
    object pnMain: TPanel
      Left = 0
      Top = 54
      Width = 859
      Height = 294
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        859
        294)
      object Label1: TLabel
        Left = 6
        Top = 19
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
        Left = 238
        Top = 19
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
        Left = 420
        Top = 19
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
      object lbDateR: TLabel
        Left = 344
        Top = 47
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
      object Label21: TLabel
        Left = 7
        Top = 47
        Width = 81
        Height = 13
        Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 644
        Top = 19
        Width = 22
        Height = 13
        Caption = #1055#1086#1083
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 593
        Top = 48
        Width = 80
        Height = 13
        Caption = #1048#1076#1077#1085#1090'. '#1085#1086#1084#1077#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edFamilia: TDBEditEh
        Left = 77
        Top = 12
        Width = 131
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
        TabOrder = 0
        Visible = True
      end
      object edName: TDBEditEh
        Left = 274
        Top = 12
        Width = 116
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
      object edOtch: TDBEditEh
        Left = 491
        Top = 12
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
        TabOrder = 2
        Visible = True
      end
      object edDateR: TDBDateTimeEditEh
        Left = 455
        Top = 40
        Width = 120
        Height = 26
        DataField = 'DateR'
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
        OnUpdateData = edDateRUpdateData
        EditFormat = 'DD/MM/YYYY      '
      end
      object edGRAG: TDBLookupComboboxEh
        Left = 99
        Top = 40
        Width = 222
        Height = 26
        DataField = 'GRAG'
        DataSource = dsDokument
        DropDownBox.Width = 300
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'GNAME'
        ListSource = dsGragd
        ParentFont = False
        TabOrder = 4
        Visible = True
      end
      object gbRogd: TGroupBox
        Left = 5
        Top = 68
        Width = 848
        Height = 72
        Anchors = [akLeft, akTop, akRight]
        Caption = ' '#1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        object Label13: TLabel
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
        object Label14: TLabel
          Left = 462
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
        object Label22: TLabel
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
        object Label23: TLabel
          Left = 462
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
        object edRG_B_RESP: TDBCheckBoxEh
          Left = 165
          Top = 18
          Width = 15
          Height = 17
          DataField = 'RG_B_RESP'
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
        end
        object edRG_GOSUD: TDBLookupComboboxEh
          Left = 185
          Top = 13
          Width = 221
          Height = 26
          DataField = 'RG_GOSUD'
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
        object edRG_B_OBL: TDBCheckBoxEh
          Left = 549
          Top = 18
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'RG_B_OBL'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edRG_GOROD: TDBEditEh
          Left = 646
          Top = 40
          Width = 156
          Height = 26
          DataField = 'RG_GOROD'
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
        object edRG_B_GOROD: TDBLookupComboboxEh
          Left = 570
          Top = 40
          Width = 56
          Height = 26
          Alignment = taRightJustify
          DataField = 'RG_B_GOROD'
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
        object edRG_RN: TDBEditEh
          Left = 185
          Top = 40
          Width = 221
          Height = 26
          DataField = 'RG_RAION'
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
        object edRG_OBL: TDBEditEh
          Left = 570
          Top = 13
          Width = 232
          Height = 26
          DataField = 'RG_OBL'
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
      object gbGit: TGroupBox
        Left = 5
        Top = 144
        Width = 848
        Height = 96
        Anchors = [akLeft, akTop, akRight]
        Caption = ' '#1052#1077#1089#1090#1086' '#1087#1086#1089#1090#1086#1103#1085#1085#1086#1075#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
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
          Width = 121
          Height = 13
          Caption = #1088'-'#1086#1085'  '#1075#1086#1088'., '#1091#1083'., '#1076#1086#1084', '#1082#1074'.'
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
          DataField = 'GT_B_RESP'
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
        end
        object edGT_GOSUD: TDBLookupComboboxEh
          Left = 185
          Top = 13
          Width = 190
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
          Left = 574
          Top = 40
          Width = 135
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
          Width = 524
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
          Left = 739
          Top = 67
          Width = 84
          Height = 26
          DataField = 'GT_RNGOROD'
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
          OnNotInList = edGT_RNGORODNotInList
        end
        object edGT_B_GOROD: TDBLookupComboboxEh
          Left = 519
          Top = 40
          Width = 46
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
          Width = 190
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
          Width = 190
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
      object gbDate: TGroupBox
        Left = 5
        Top = 247
        Width = 848
        Height = 47
        Anchors = [akLeft, akTop, akRight]
        Caption = ' '#1055#1077#1088#1080#1086#1076' '#1087#1086#1080#1089#1082#1072' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        object Label5: TLabel
          Left = 41
          Top = 20
          Width = 5
          Height = 13
          Caption = #1089
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 252
          Top = 20
          Width = 12
          Height = 13
          Caption = #1087#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edDate1: TDBEditEh
          Left = 77
          Top = 16
          Width = 145
          Height = 26
          DataField = 'DATE1'
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
        object edDate2: TDBEditEh
          Left = 289
          Top = 16
          Width = 145
          Height = 26
          DataField = 'DATE2'
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
      object edPol: TDBComboBoxEh
        Left = 682
        Top = 12
        Width = 121
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
        TabOrder = 3
        Visible = True
      end
      object ENG_edIDENTIF: TDBEditEh
        Left = 687
        Top = 41
        Width = 145
        Height = 26
        CharCase = ecUpperCase
        DataField = 'IDENTIF'
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
    end
    object pnPodp: TPanel
      Left = 0
      Top = 513
      Width = 859
      Height = 77
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 4
      object lbRukov: TvchDBText
        Left = 8
        Top = 12
        Width = 578
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
      object lbRukov_B: TvchDBText
        Left = 8
        Top = 46
        Width = 578
        Height = 17
        Alignment = taRightJustify
        DataField = 'DOLG_RUKOV_B'
        DataSource = dsDokument
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object edRukov: TDBEditEh
        Left = 597
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
      object edRukov_B: TDBEditEh
        Left = 597
        Top = 39
        Width = 225
        Height = 26
        HelpContext = 999
        DataField = 'RUKOV_B'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = False
      end
    end
    object pnRast: TPanel
      Left = 0
      Top = 348
      Width = 859
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object lb2: TLabel
        Left = 707
        Top = 12
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
      object lb3: TLabel
        Left = 223
        Top = 12
        Width = 71
        Height = 13
        Caption = #1042' '#1076#1086#1082'. '#1072#1088#1093#1080#1074#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lb5: TLabel
        Left = 415
        Top = 41
        Width = 50
        Height = 13
        Caption = #1057#1091#1087#1088#1091#1075'('#1072')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lb4: TLabel
        Left = 15
        Top = 41
        Width = 23
        Height = 13
        Caption = #1060#1048#1054
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lb16: TLabel
        Left = 544
        Top = 12
        Width = 75
        Height = 13
        Caption = #1080#1084#1077#1077#1090#1089#1103' '#1079'/'#1072' '#8470
      end
      object N_F_cbBrak: TDBCheckBoxEh
        Left = 9
        Top = 8
        Width = 203
        Height = 17
        Caption = #1083#1080#1094#1086' '#1088#1072#1085#1077#1077' '#1089#1086#1089#1090#1086#1103#1083#1086' '#1074' '#1073#1088#1072#1082#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = N_F_cbBrakClick
      end
      object edB_NOMER: TDBEditEh
        Left = 633
        Top = 5
        Width = 60
        Height = 26
        DataField = 'B_NOMER'
        DataSource = dsRast
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
      object edB_DATE: TDBDateTimeEditEh
        Left = 732
        Top = 5
        Width = 120
        Height = 26
        DataField = 'B_DATE'
        DataSource = dsRast
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
      object edB_ZAGS: TDBEditEh
        Left = 300
        Top = 5
        Width = 233
        Height = 26
        Hint = #1047#1072#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1077#1089#1083#1080' '#1085#1077' '#1085#1072#1096' '#1047#1040#1043#1057
        DataField = 'B_ZAGS'
        DataSource = dsRast
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
      object edSuprug: TDBEditEh
        Left = 476
        Top = 34
        Width = 327
        Height = 26
        DataField = 'SUPRUG'
        DataSource = dsRast
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
      object edLico: TDBEditEh
        Left = 55
        Top = 34
        Width = 327
        Height = 26
        DataField = 'LICO'
        DataSource = dsRast
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Visible = True
        OnEnter = edLicoEnter
      end
    end
    object pcRast: TPageControl
      Left = 0
      Top = 413
      Width = 859
      Height = 100
      ActivePage = tsSmert
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Style = tsButtons
      TabOrder = 3
      OnChange = pcRastChange
      object tsSmert: TTabSheet
        Caption = #1073#1088#1072#1082' '#1087#1088#1077#1082#1088#1072#1097#1077#1085' '#1074' '#1089#1074#1103#1079#1080' '#1089#1086' '#1089#1084#1077#1088#1090#1100#1102
        DesignSize = (
          851
          69)
        object lb14: TLabel
          Left = 125
          Top = 33
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
        object lb15: TLabel
          Left = 286
          Top = 33
          Width = 64
          Height = 13
          Caption = #1089#1086#1074#1077#1088#1096#1077#1085#1072' '#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lb13: TLabel
          Left = 8
          Top = 33
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
        object lb12: TLabel
          Left = 7
          Top = 4
          Width = 109
          Height = 13
          Caption = #1047#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1089#1084#1077#1088#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edS_NOMER: TDBEditEh
          Left = 28
          Top = 26
          Width = 86
          Height = 26
          DataField = 'S_NOMER'
          DataSource = dsRast
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
        object edS_DATE: TDBDateTimeEditEh
          Left = 149
          Top = 26
          Width = 121
          Height = 26
          DataField = 'S_DATE'
          DataSource = dsRast
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
        object edS_ZAGS: TDBEditEh
          Left = 379
          Top = 26
          Width = 439
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'S_ZAGS'
          DataSource = dsRast
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
      object tsRast: TTabSheet
        Caption = #1088#1072#1089#1090#1086#1088#1075#1085#1091#1090' '#1087#1086' '#1088#1077#1096#1077#1085#1080#1102' '#1089#1091#1076#1072
        ImageIndex = 1
        object lb10: TLabel
          Left = 523
          Top = 10
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
        object lb11: TLabel
          Left = 12
          Top = 41
          Width = 154
          Height = 13
          Caption = #1074#1089#1090#1091#1087#1080#1074#1096#1077#1075#1086' '#1074' '#1079#1072#1082#1086#1085#1085#1091#1102' '#1089#1080#1083#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edSudResh: TDBDateTimeEditEh
          Left = 547
          Top = 6
          Width = 121
          Height = 26
          DataField = 'SUDRESH'
          DataSource = dsRast
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
        object edSudName: TDBEditEh
          Left = 14
          Top = 6
          Width = 494
          Height = 26
          Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1091#1076#1072
          DataField = 'SUDNAME'
          DataSource = dsRast
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
        object edSudSila: TDBDateTimeEditEh
          Left = 195
          Top = 34
          Width = 121
          Height = 26
          DataField = 'SUDSILA'
          DataSource = dsRast
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
      end
      object tsAkt: TTabSheet
        Caption = #1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1080' '#1073#1088#1072#1082#1072
        ImageIndex = 2
        DesignSize = (
          851
          69)
        object lb7: TLabel
          Left = 8
          Top = 33
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
        object lb8: TLabel
          Left = 125
          Top = 33
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
        object lb9: TLabel
          Left = 286
          Top = 33
          Width = 76
          Height = 13
          Caption = #1089#1086#1074#1077#1088#1096#1077#1085#1085#1086#1081' '#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edR_NOMER: TDBEditEh
          Left = 28
          Top = 26
          Width = 86
          Height = 26
          DataField = 'R_NOMER'
          DataSource = dsRast
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
        object edR_DATE: TDBDateTimeEditEh
          Left = 149
          Top = 26
          Width = 121
          Height = 26
          DataField = 'R_DATE'
          DataSource = dsRast
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
        object edR_ZAGS: TDBEditEh
          Left = 379
          Top = 26
          Width = 439
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'R_ZAGS'
          DataSource = dsRast
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
    end
  end
  inherited StBar: TStatusBar
    Top = 640
    Width = 859
  end
  inherited pnAdd: TPanel
    Width = 859
  end
  inherited dsDokument: TDataSource
    Left = 632
    Top = 66
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
        Name = 'GRAG'
        DataType = ftInteger
      end
      item
        Name = 'DateR'
        DataType = ftDate
      end
      item
        Name = 'RG_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'RG_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'RG_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'RG_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RG_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RG_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'RG_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GT_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'GT_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'GT_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'GT_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GT_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GT_RNGOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GT_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'GT_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GT_GOROD_R'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'RUKOV'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DATE1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DOLG_RUKOV'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'DATE2'
        DataType = ftString
        Size = 30
      end>
    Left = 744
    Top = 250
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
    object DokumentADRESAT: TMemoField
      FieldName = 'ADRESAT'
      BlobType = ftMemo
    end
    object DokumentFamilia: TStringField
      FieldName = 'Familia'
      Size = 100
    end
    object DokumentName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object DokumentOtch: TStringField
      FieldName = 'Otch'
      Size = 30
    end
    object DokumentPOL: TStringField
      FieldName = 'POL'
      Size = 1
    end
    object DokumentGRAG: TIntegerField
      FieldName = 'GRAG'
    end
    object DokumentDateR: TDateField
      FieldName = 'DateR'
    end
    object DokumentRG_B_RESP: TBooleanField
      FieldName = 'RG_B_RESP'
    end
    object DokumentRG_GOSUD: TIntegerField
      FieldName = 'RG_GOSUD'
    end
    object DokumentRG_B_OBL: TBooleanField
      FieldName = 'RG_B_OBL'
    end
    object DokumentRG_OBL: TStringField
      FieldName = 'RG_OBL'
      Size = 30
    end
    object DokumentRG_RAION: TStringField
      FieldName = 'RG_RAION'
      Size = 30
    end
    object DokumentRG_B_GOROD: TSmallintField
      FieldName = 'RG_B_GOROD'
    end
    object DokumentRG_GOROD: TStringField
      FieldName = 'RG_GOROD'
      Size = 30
    end
    object DokumentGT_B_RESP: TBooleanField
      FieldName = 'GT_B_RESP'
    end
    object DokumentGT_GOSUD: TIntegerField
      FieldName = 'GT_GOSUD'
    end
    object DokumentGT_B_OBL: TBooleanField
      FieldName = 'GT_B_OBL'
    end
    object DokumentGT_OBL: TStringField
      FieldName = 'GT_OBL'
      Size = 60
    end
    object DokumentGT_RAION: TStringField
      FieldName = 'GT_RAION'
      Size = 60
    end
    object DokumentGT_RNGOROD: TStringField
      FieldName = 'GT_RNGOROD'
      Size = 60
    end
    object DokumentGT_B_GOROD: TSmallintField
      FieldName = 'GT_B_GOROD'
    end
    object DokumentGT_GOROD: TStringField
      FieldName = 'GT_GOROD'
      Size = 60
    end
    object DokumentGT_GOROD_R: TStringField
      FieldName = 'GT_GOROD_R'
      Size = 100
    end
    object DokumentDATE1: TStringField
      FieldName = 'DATE1'
      Size = 30
    end
    object DokumentDATE2: TStringField
      FieldName = 'DATE2'
      Size = 30
    end
    object DokumentRUKOV: TStringField
      FieldName = 'RUKOV'
      Size = 60
    end
    object DokumentDOLG_RUKOV: TStringField
      FieldName = 'DOLG_RUKOV'
      Size = 200
    end
    object DokumentDOLG_RUKOV_B: TStringField
      FieldName = 'DOLG_RUKOV_B'
      Size = 200
    end
    object DokumentRUKOV_B: TStringField
      FieldName = 'RUKOV_B'
      Size = 100
    end
    object DokumentIDENTIF: TStringField
      FieldName = 'IDENTIF'
      Size = 14
    end
  end
  object dsStran: TDataSource [8]
    DataSet = dmBase.SprStran
    Left = 692
    Top = 337
  end
  object dsNation: TDataSource [9]
    DataSet = dmBase.SprNac
    Left = 772
    Top = 305
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 736
    Top = 194
  end
  inherited HistZAGS: TkbmMemTable
    Left = 752
    Top = 122
  end
  inherited dsSeria: TDataSource
    Left = 480
    Top = 362
  end
  inherited dsObl: TDataSource
    Left = 520
    Top = 346
  end
  object dsGragd: TDataSource [14]
    Left = 620
    Top = 337
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
    Left = 552
    Top = 346
  end
  inherited dsGorod: TDataSource
    Left = 728
    Top = 330
  end
  inherited dsRnGor: TDataSource
    Left = 592
    Top = 346
  end
  inherited dsTypeGorod: TDataSource
    Left = 680
    Top = 50
  end
  inherited ImGISUN: TImageList
    Left = 780
    Top = 27
  end
  inherited dsVoenkom: TDataSource
    Left = 760
    Top = 58
  end
  inherited dsRovd: TDataSource
    Left = 720
    Top = 58
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 632
    Top = 162
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 312
    Top = 130
  end
  inherited tbReshSud: TkbmMemTable
    Left = 728
    Top = 290
  end
  object ApplicationEvents1: TApplicationEvents
    Left = 782
    Top = 368
  end
  object tbRast: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'B_NOMER'
        DataType = ftString
        Size = 20
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
        Name = 'LICO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'SUPRUG'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'TYPE_RAST'
        DataType = ftInteger
      end
      item
        Name = 'S_NOMER'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'S_DATE'
        DataType = ftDate
      end
      item
        Name = 'S_ZAGS'
        DataType = ftMemo
      end
      item
        Name = 'R_NOMER'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'R_DATE'
        DataType = ftDate
      end
      item
        Name = 'R_ZAGS'
        DataType = ftMemo
      end
      item
        Name = 'SUDNAME'
        DataType = ftMemo
      end
      item
        Name = 'SUDRESH'
        DataType = ftDate
      end
      item
        Name = 'SUDSILA'
        DataType = ftDate
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
    Left = 805
    Top = 352
    object tbRastB_NOMER: TStringField
      FieldName = 'B_NOMER'
      Size = 30
    end
    object tbRastB_DATE: TDateField
      FieldName = 'B_DATE'
    end
    object tbRastB_ZAGS: TMemoField
      FieldName = 'B_ZAGS'
      BlobType = ftMemo
    end
    object tbRastLICO: TStringField
      FieldName = 'LICO'
      Size = 100
    end
    object tbRastSUPRUG: TStringField
      FieldName = 'SUPRUG'
      Size = 100
    end
    object tbRastTYPE_RAST: TIntegerField
      FieldName = 'TYPE_RAST'
    end
    object tbRastS_NOMER: TStringField
      FieldName = 'S_NOMER'
      Size = 30
    end
    object tbRastS_DATE: TDateField
      FieldName = 'S_DATE'
    end
    object tbRastS_ZAGS: TMemoField
      FieldName = 'S_ZAGS'
      BlobType = ftMemo
    end
    object tbRastR_NOMER: TStringField
      FieldName = 'R_NOMER'
      Size = 30
    end
    object tbRastR_DATE: TDateField
      FieldName = 'R_DATE'
    end
    object tbRastR_ZAGS: TMemoField
      FieldName = 'R_ZAGS'
      BlobType = ftMemo
    end
    object tbRastSUDNAME: TMemoField
      FieldName = 'SUDNAME'
      BlobType = ftMemo
    end
    object tbRastSUDRESH: TDateField
      FieldName = 'SUDRESH'
    end
    object tbRastSUDSILA: TDateField
      FieldName = 'SUDSILA'
    end
  end
  object dsRast: TDataSource
    DataSet = tbRast
    OnDataChange = dsRastDataChange
    Left = 824
    Top = 416
  end
end
