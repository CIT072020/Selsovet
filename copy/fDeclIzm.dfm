inherited fmDeclIzm: TfmDeclIzm
  Left = 607
  Top = 115
  ActiveControl = edNomer
  Caption = 
    #1047#1072#1103#1074#1083#1077#1085#1080#1077' '#1086' '#1074#1085#1077#1089#1077#1085#1080#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1081', '#1076#1086#1087#1086#1083#1085#1077#1085#1080#1081', '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1081' '#1074' '#1079#1072#1087#1080#1089#1100 +
    ' '#1072#1082#1090#1072
  ClientHeight = 782
  ClientWidth = 920
  Constraints.MinHeight = 820
  Constraints.MinWidth = 936
  Icon.Data = {
    0000010001001010000001001800680300001600000028000000100000002000
    0000010018000000000000030000000000000000000000000000000000000000
    00000000847D6E6F66594F49544F53663C4B5B48555D5555555A594F5159484A
    584C42555A4551556E6B5C000000000000000000867D73DDD0C8FFF9FCEBE4F1
    DFDFEFEBEFFADEE0E1EBEFEADBE7E1E6F7F4D1E3EAD4DFE356544A0000000000
    00000000817575FFFAF9FFEFE7DBC2C0FDE5F7DFD0E5DEE3E6DDEEF1D7EBFDBA
    CDE2D1E3EAD6DFE25F5B600000000000000000009B9093FFEDE8694632A27963
    FFEBE8654A54D2D3E8CFE0FFABBFEF374A75EFFAFFDFE5EC4B4A530000000000
    00000000797473FFFFF0FFEFCAFFE0B2FFE0B2FFE0D35A4E82343A8D4152A336
    4689B5B7E0E9E8FC4F54550000000000000000008F8A89F0E1C79A7041A36D31
    8F591D8A5F4CF2DBFF3A3598B4BAFF3D4493D4D1FFEFECFF4F58550000000000
    00000000746F71FFFFEEFFEBB6FFFFCFFFF0C2FFF3EBDFC2EFEADAFF4138933D
    3786EBE4FFDEDEEC404A44000000000000000000858081FFF8EC836846896541
    885A497D505378576C664C74E8D2FF504075EBE5FEDFDEE7565C5B0000000000
    00000000807D78FFF8FCFFF0F9FFF2FFFFF3FFFFF3FFFFF1E9FFEDDDE7CCC2EA
    DAD4EBE6E5DBDBE1656271000000000000000000838579FFFBFF05002007002B
    04001DFFE5F988614B8E683890713C847348F1ECDDFAF9FD4B42560000000000
    000000006C7261FFFCFF413D713835737979A1FFF8FFFFFAE4FFEDBAFFFFBEFF
    FFC2FAF3E0D9D5DB564D5A00000000000000000080867BF5F8FD00062DDCE4FF
    828DA9EBEAEE795C478F6B3D7356198B7944FFFFF2E8E6E66760630000000000
    00000000797A84F1F7FC000201EFFFFF59626FFFFEFFFFFDEAFFFFE9FFFFF260
    4B434D473C5F5F535B5A500000000000000000007F7E92F7FDFF7C897975816D
    959994EFF0EEFFFFF6FAF6F1F5E9F5C6BAC6FFFFFB8786780000000000000000
    0000000077788CE4E8F3FFFFF9FFFEEBFFFDE5FEFEF0F2FDFFDEECFFEFFBFFCE
    D4E166616200000000000000000000000000000076798E7377828B84818B826E
    8279588B8D776A798C6980A05E758B5D6B77000000000000000000000000C001
    0000C0010000C0010000C0010000C0010000C0010000C0010000C0010000C001
    0000C0010000C0010000C0010000C0010000C0030000C0070000C00F0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 26
    Width = 920
    Visible = False
  end
  object Label22: TLabel [1]
    Left = 37
    Top = 479
    Width = 82
    Height = 13
    Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077')'
  end
  inherited pnTable: TPanel
    Top = 53
    Width = 920
    Height = 707
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 920
    inherited TBToolbar: TTBToolbar
      object TBItemChoiceMen: TTBItem [2]
        Caption = #1042#1099#1073#1088#1072#1090#1100
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072
        ImageIndex = 44
        Visible = False
      end
      object TBSubmenuGISUN: TTBSubmenuItem [6]
        Caption = #1042#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1077' '#1089' '#1043#1048#1057' '#1056#1053
        ImageIndex = 5
        Images = ImGISUN
        Visible = False
        object TBItemStep1: TTBItem
          Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
          OnClick = TBItemStep1Click
        end
        object TBItemStep2: TTBItem
          Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1072#1082#1090#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
          OnClick = TBItemStep2Click
        end
      end
      object TBSubmenuChoiceBrak: TTBSubmenuItem [8]
        Caption = #1053#1077#1074#1077#1089#1090#1072' '#1080#1079' '#1079#1072#1087#1080#1089#1080' '#1072#1082#1090#1072' '#1086' '#1073#1088#1072#1082#1077
        DropdownCombo = True
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1085#1077#1074#1077#1089#1090#1091' '#1080#1079' '#1079#1072#1087#1080#1089#1080' '#1072#1082#1090#1072' '#1086' '#1073#1088#1072#1082#1077
        ImageIndex = 51
        OnClick = TBSubmenuChoiceBrakClick
        object TBItemChoiceBrakON: TTBItem
          Caption = #1042#1099#1073#1088#1072#1090#1100' '#1078#1077#1085#1080#1093#1072' '#1080#1079' '#1079#1072#1087#1080#1089#1080' '#1072#1082#1090#1072' '#1086' '#1073#1088#1072#1082#1077
          OnClick = TBItemChoiceBrakONClick
        end
      end
      inherited TBItemGetDataGISUN: TTBItem
        Visible = True
      end
      object TBItemZaklChName: TTBItem [11]
        Caption = #1047#1072#1082#1083#1102#1095#1077#1085#1080#1077
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1077' '#1086' '#1087#1077#1088#1077#1084#1077#1085#1077' '#1080#1084#1077#1085#1080
        ImageIndex = 137
        Visible = False
      end
      object TBItemArxSpr: TTBItem [12]
        AutoCheck = True
        Caption = #1040#1088#1093#1080#1074#1085#1072#1103' '#1089#1087#1088#1072#1074#1082#1072
        Hint = #1040#1088#1093#1080#1074#1085#1072#1103' '#1089#1087#1088#1072#1074#1082#1072
        ImageIndex = 45
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
      inherited TBItemSvidIspor: TTBItem
        Visible = True
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 402
        inherited edZAGS: TDBEditEh
          TabStop = False
        end
      end
    end
  end
  inherited sb: TScrollBox
    Top = 53
    Width = 920
    Height = 707
    Align = alClient
    inherited pnPovtor: TPanel
      TabOrder = 2
      inherited imBE: TImage
        Anchors = [akTop]
      end
    end
    inherited N_F_edTypeEkz: TComboBox
      TabOrder = 3
    end
    object pc: TPageControl
      Left = 0
      Top = 34
      Width = 920
      Height = 673
      ActivePage = tsTail2
      Align = alClient
      HotTrack = True
      TabOrder = 0
      TabStop = False
      OnChange = pcChange
      object tsTail1: TTabSheet
        Caption = #1063#1072#1089#1090#1100' 1'
        DesignSize = (
          912
          645)
        object Label13: TLabel
          Left = 8
          Top = 475
          Width = 98
          Height = 13
          Caption = #1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 8
          Top = 503
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
          Left = 17
          Top = 417
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
        object Label11: TLabel
          Left = 121
          Top = 446
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
        object Label10: TLabel
          Left = 419
          Top = 417
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
        object Label12: TLabel
          Left = 413
          Top = 446
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
        object Label36: TLabel
          Left = 8
          Top = 401
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
          Left = 17
          Top = 536
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
        object Label23: TLabel
          Left = 19
          Top = 574
          Width = 45
          Height = 13
          Caption = #1088'-'#1086#1085'  '#1075#1086#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label35: TLabel
          Left = 30
          Top = 593
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
        object Label20: TLabel
          Left = 121
          Top = 565
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
        object Label19: TLabel
          Left = 419
          Top = 536
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
        object Label21: TLabel
          Left = 413
          Top = 565
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
        object Label24: TLabel
          Left = 8
          Top = 518
          Width = 112
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbPrich: TLabel
          Left = 8
          Top = 383
          Width = 51
          Height = 13
          Caption = #1042' '#1089#1074#1103#1079#1080' '#1089
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 7
          Top = 622
          Width = 162
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099'/'#1091#1095#1077#1073#1099', '#1082#1091#1088#1089
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 8
          Top = 159
          Width = 138
          Height = 13
          Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1087#1086#1076#1083#1077#1078#1072#1097#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 8
          Top = 269
          Width = 84
          Height = 13
          Caption = #1055#1088#1086#1089#1080#1090' '#1074#1085#1077#1089#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edNATION: TDBLookupComboboxEh
          Left = 184
          Top = 468
          Width = 188
          Height = 26
          DataField = 'NATION'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME_M'
          ListSource = dsNation
          ParentFont = False
          TabOrder = 15
          Visible = True
        end
        object edGRAG: TDBLookupComboboxEh
          Left = 184
          Top = 496
          Width = 300
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
          TabOrder = 17
          Visible = True
        end
        object N_F_cbBelorus: TDBCheckBoxEh
          Left = 888
          Top = 0
          Width = 17
          Height = 16
          Anchors = [akTop, akRight]
          Caption = #1073#1077#1083
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbGrayed
          TabOrder = 23
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
          OnClick = N_F_cbBelorusClick
        end
        object edB_RESP: TDBCheckBoxEh
          Left = 162
          Top = 415
          Width = 15
          Height = 17
          DataField = 'B_RESP'
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
          Visible = False
        end
        object edGOSUD: TDBLookupComboboxEh
          Left = 184
          Top = 410
          Width = 205
          Height = 26
          DataField = 'GOSUD'
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
          TabOrder = 9
          Visible = True
        end
        object edB_OBL: TDBCheckBoxEh
          Left = 506
          Top = 415
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'B_OBL'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edGOROD: TDBEditEh
          Left = 579
          Top = 439
          Width = 153
          Height = 26
          DataField = 'GOROD'
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
        object BLR_edOBL: TDBEditEh
          Left = 680
          Top = 392
          Width = 30
          Height = 26
          DataField = 'OBL_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          Visible = False
        end
        object BLR_edRAION: TDBEditEh
          Left = 720
          Top = 403
          Width = 22
          Height = 26
          DataField = 'RAION_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
          Visible = False
        end
        object edB_GOROD: TDBLookupComboboxEh
          Left = 528
          Top = 439
          Width = 44
          Height = 26
          Alignment = taRightJustify
          DataField = 'B_GOROD'
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
          TabOrder = 13
          Visible = True
        end
        object edRAION: TDBEditEh
          Left = 184
          Top = 439
          Width = 205
          Height = 26
          DataField = 'RAION'
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
        object edOBL: TDBEditEh
          Left = 528
          Top = 410
          Width = 205
          Height = 26
          DataField = 'OBL'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          Visible = True
        end
        object BLR_edGorod: TDBEditEh
          Left = 752
          Top = 406
          Width = 22
          Height = 26
          DataField = 'GOROD_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 22
          Visible = False
        end
        object BLR_edGosud: TDBLookupComboboxEh
          Left = 624
          Top = 397
          Width = 46
          Height = 26
          TabStop = False
          Color = clInfoBk
          DataField = 'GOSUD'
          DataSource = dsDokument
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME_B'
          ListSource = dsStran
          ParentFont = False
          Style = csDropDownEh
          TabOrder = 18
          Visible = False
        end
        object BLR_edB_GOROD: TDBLookupComboboxEh
          Left = 705
          Top = 398
          Width = 24
          Height = 26
          TabStop = False
          Alignment = taRightJustify
          Color = clInfoBk
          DataField = 'B_GOROD'
          DataSource = dsDokument
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME_B'
          ListSource = dsTypeGorod
          ParentFont = False
          TabOrder = 21
          Visible = False
        end
        object edM_RNGOROD: TDBLookupComboboxEh
          Left = 33
          Top = 562
          Width = 37
          Height = 26
          DataField = 'M_RNGOROD'
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
          TabOrder = 29
          Visible = False
        end
        object edM_B_RESP: TDBCheckBoxEh
          Left = 162
          Top = 534
          Width = 15
          Height = 17
          DataField = 'M_B_RESP'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 24
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object edM_GOSUD: TDBLookupComboboxEh
          Left = 184
          Top = 529
          Width = 205
          Height = 26
          DataField = 'M_GOSUD'
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
          TabOrder = 25
          Visible = True
        end
        object edM_RAION: TDBEditEh
          Left = 184
          Top = 558
          Width = 205
          Height = 26
          DataField = 'M_RAION'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 28
          Visible = True
        end
        object edM_GOROD_R: TDBEditEh
          Left = 184
          Top = 586
          Width = 550
          Height = 26
          DataField = 'M_GOROD_R'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 32
          Visible = True
        end
        object edM_B_OBL: TDBCheckBoxEh
          Left = 506
          Top = 534
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'M_B_OBL'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 26
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edM_OBL: TDBEditEh
          Left = 528
          Top = 529
          Width = 205
          Height = 26
          DataField = 'M_OBL'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 27
          Visible = True
        end
        object edM_B_GOROD: TDBLookupComboboxEh
          Left = 528
          Top = 558
          Width = 44
          Height = 26
          Alignment = taRightJustify
          DataField = 'M_B_GOROD'
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
          TabOrder = 30
          Visible = True
        end
        object edM_GOROD: TDBEditEh
          Left = 579
          Top = 558
          Width = 153
          Height = 26
          DataField = 'M_GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 31
          Visible = True
        end
        object edPRICH: TDBEditEh
          Left = 184
          Top = 379
          Width = 670
          Height = 26
          DataField = 'PRICH'
          DataSource = dsDokument
          EditButtons = <
            item
              Style = ebsEllipsisEh
              Width = 20
              OnClick = edPRICHEditButtons0Click
            end
            item
              Style = ebsGlyphEh
              Width = 20
              OnClick = edPRICHEditButtons1Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          Visible = True
        end
        object edWORK_PLACE: TDBEditEh
          Left = 184
          Top = 615
          Width = 670
          Height = 26
          HelpContext = 999
          DataField = 'WORK_PLACE'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 33
          Visible = True
        end
        object edNationDok: TDBEditEh
          Left = 389
          Top = 468
          Width = 465
          Height = 26
          DataField = 'NATION_DOK'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
          Visible = True
        end
        object pnFIO: TPanel
          Left = 0
          Top = 0
          Width = 912
          Height = 154
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            912
            154)
          object Label3: TLabel
            Left = 528
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
            Left = 106
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
            Left = 332
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
          object lbTypeZapis: TLabel
            Left = 8
            Top = 72
            Width = 140
            Height = 13
            Caption = #1074#1085#1077#1089#1090#1080' '#1074' '#1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086#1073
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label57: TLabel
            Left = 8
            Top = 101
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
          object Label58: TLabel
            Left = 136
            Top = 101
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
          object Label59: TLabel
            Left = 305
            Top = 101
            Width = 96
            Height = 13
            Caption = #1089#1086#1089#1090#1072#1074#1083#1077#1085#1085#1091#1102' '#1074
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label60: TLabel
            Left = 8
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
          object Label4: TLabel
            Left = 8
            Top = 43
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
          object Label26: TLabel
            Left = 217
            Top = 43
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
          object Label7: TLabel
            Left = 509
            Top = 43
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
          object Label61: TLabel
            Left = 43
            Top = 132
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
          object Label62: TLabel
            Left = 269
            Top = 132
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
          object Label63: TLabel
            Left = 465
            Top = 130
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
          object Label64: TLabel
            Left = 8
            Top = 132
            Width = 14
            Height = 13
            Caption = #1085#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edOtch: TDBEditEh
            Left = 599
            Top = 6
            Width = 140
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
            Left = 171
            Top = 8
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
            Left = 369
            Top = 6
            Width = 123
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
          object edTypeAkt: TDBComboBoxEh
            Left = 173
            Top = 65
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
          object edRegDate: TDBDateTimeEditEh
            Left = 167
            Top = 94
            Width = 121
            Height = 26
            DataField = 'REG_DATE'
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
          object edRegZags: TDBEditEh
            Left = 415
            Top = 94
            Width = 484
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            DataField = 'REG_ZAGS'
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
            Left = 769
            Top = 8
            Width = 72
            Height = 17
            Caption = #1089#1082#1083#1086#1085#1103#1090#1100
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 13
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            Visible = False
          end
          object edPol: TDBComboBoxEh
            Left = 70
            Top = 36
            Width = 125
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
            Left = 315
            Top = 36
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
            TabOrder = 4
            Visible = True
          end
          object edDATER: TDBDateTimeEditEh
            Left = 621
            Top = 36
            Width = 125
            Height = 26
            DataField = 'DateR'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 5
            Visible = True
            OnUpdateData = edDATERUpdateData
          end
          object edFamiliaNa: TDBEditEh
            Left = 116
            Top = 125
            Width = 129
            Height = 26
            DataField = 'FamiliaNa'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
            Visible = True
          end
          object edNameNa: TDBEditEh
            Left = 306
            Top = 125
            Width = 123
            Height = 26
            DataField = 'NameNa'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
            Visible = True
          end
          object edOtchNa: TDBEditEh
            Left = 536
            Top = 125
            Width = 140
            Height = 26
            DataField = 'OtchNa'
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
          object edRegNomer: TDBNumberEditEh
            Left = 32
            Top = 94
            Width = 89
            Height = 26
            DataField = 'REG_NOMER'
            DataSource = dsDokument
            DecimalPlaces = 0
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
          object btAktBrak: TBitBtn
            Left = 755
            Top = 64
            Width = 102
            Height = 24
            Hint = #1054#1090#1082#1088#1099#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1073#1088#1072#1082#1077
            Caption = #1079'/'#1072' '#1086' '#1073#1088#1072#1082#1077
            TabOrder = 14
            OnClick = btAktBrakClick
            Glyph.Data = {
              CE000000424DCE000000000000004E0000002800000010000000100000000100
              0400000000008000000000000000000000000600000006000000040204008486
              840004028400FC02FC00FCFEFC000402FC003333333333333333333333333333
              3333333333333333333333333330033333333333330201333333333330222011
              3333333022222220133333055552222201333325555522222033332455555522
              2033332455525522203333054520552203333330220305203333333333333333
              333333333333333333333333333333333333}
          end
        end
        object edCurValues: TDBMemo
          Left = 2
          Top = 177
          Width = 906
          Height = 88
          Anchors = [akLeft, akTop, akRight]
          DataField = 'CURVALUES'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnDblClick = TBItemEditMemoClick
        end
        object edNewValues: TDBMemo
          Left = 2
          Top = 287
          Width = 906
          Height = 88
          Anchors = [akLeft, akTop, akRight]
          DataField = 'NEWVALUES'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnDblClick = TBItemEditMemoClick
        end
        object N_F_cbIzm: TDBCheckBoxEh
          Left = 161
          Top = 157
          Width = 116
          Height = 17
          Caption = #1080#1079#1084#1077#1085#1077#1085#1080#1102
          DataField = 'IS_IZMEN'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object N_F_cbDopoln: TDBCheckBoxEh
          Left = 277
          Top = 157
          Width = 137
          Height = 17
          Caption = #1076#1086#1087#1086#1083#1085#1077#1085#1080#1102
          DataField = 'IS_DOPOLN'
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
        object N_F_cbIsprav: TDBCheckBoxEh
          Left = 419
          Top = 157
          Width = 122
          Height = 17
          Caption = #1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1102
          DataField = 'IS_ISPRAV'
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
        object pnSt21: TPanel
          Left = 285
          Top = 224
          Width = 809
          Height = 124
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          TabOrder = 1
          object lbFIO1: TLabel
            Left = 8
            Top = 18
            Width = 73
            Height = 13
            Caption = #1074' '#1086#1090#1085#1086#1096#1077#1085#1080#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbFIO3: TLabel
            Left = 8
            Top = 47
            Width = 331
            Height = 13
            Caption = #1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1092#1072#1084#1080#1083#1080#1080', '#1080#1079#1073#1088#1072#1085#1085#1086#1081' '#1087#1088#1080' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1080' '#1073#1088#1072#1082#1072' '#1085#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbFIO2: TLabel
            Left = 439
            Top = 18
            Width = 6
            Height = 13
            Caption = #1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 8
            Top = 79
            Width = 105
            Height = 13
            Caption = #1085#1072' '#1088#1091#1089#1089#1082#1086#1084' '#1103#1079#1099#1082#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 317
            Top = 79
            Width = 133
            Height = 13
            Caption = #1085#1072' '#1073#1077#1083#1086#1088#1091#1089#1089#1082#1086#1084' '#1103#1079#1099#1082#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edFIO1: TDBEditEh
            Left = 102
            Top = 11
            Width = 319
            Height = 26
            HelpContext = 999
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
          object edTypeFam: TDBComboBoxEh
            Left = 357
            Top = 40
            Width = 297
            Height = 26
            DataField = 'TYPE_FAM'
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
            OnChange = edTypeBrakChange
          end
          object edFIO2: TDBEditEh
            Left = 466
            Top = 11
            Width = 319
            Height = 26
            HelpContext = 999
            DataField = 'FIO2'
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
          object edFamiliaNa21: TDBEditEh
            Left = 131
            Top = 72
            Width = 150
            Height = 26
            DataField = 'FamiliaNa'
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
          object BLR_edFamiliaNa21: TDBEditEh
            Left = 466
            Top = 72
            Width = 150
            Height = 26
            DataField = 'FamiliaNa_B'
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
        end
      end
      object tsTail2: TTabSheet
        Caption = #1063#1072#1089#1090#1100' 2'
        ImageIndex = 1
        DesignSize = (
          912
          645)
        object Label31: TLabel
          Left = 4
          Top = 9
          Width = 161
          Height = 26
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090#13#10#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1080#1081' '#1083#1080#1095#1085#1086#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label42: TLabel
          Left = 4
          Top = 441
          Width = 131
          Height = 13
          Caption = #1055#1088#1080#1083#1072#1075#1072#1102' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label69: TLabel
          Left = 359
          Top = 40
          Width = 12
          Height = 13
          Caption = #1086#1090
        end
        object lbSpec: TvchDBText
          Left = 8
          Top = 600
          Width = 655
          Height = 17
          Alignment = taRightJustify
          DataField = 'SPEC_D'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbAddSud: TLabel
          Left = 4
          Top = 355
          Width = 852
          Height = 44
          AutoSize = False
          Caption = 
            #1053#1072#1093#1086#1076#1080#1083#1089#1103'('#1072#1089#1100') '#1083#1080' '#1087#1086#1076' '#1089#1091#1076#1086#1084' '#1080#1083#1080' '#1089#1083#1077#1076#1089#1090#1074#1080#1077#1084' ('#1077#1089#1083#1080' '#1085#1072#1093#1086#1076#1080#1083#1089#1103'('#1072#1089#1100'),' +
            ' '#1090#1086' '#1082#1086#1075#1076#1072' '#1080' '#1079#1072' '#1095#1090#1086' '#1087#1088#1080#1074#1083#1077#1082#1072#1083#1089#1103'('#1072#1089#1100') '#1082' '#1091#1075#1086#1083#1086#1074#1085#1086#1081' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1089#1090#1080',' +
            ' '#1077#1089#1083#1080' '#1073#1099#1083' '#1086#1089#1091#1078#1076#1077#1085'('#1072'), '#1090#1086' '#1082#1086#1075#1076#1072', '#1087#1086' '#1082#1072#1082#1086#1081' '#1089#1090#1072#1090#1100#1077' '#1059#1075#1086#1083#1086#1074#1085#1086#1075#1086' '#1082#1086#1076#1077#1082 +
            #1089#1072' '#1056#1077#1089#1087#1091#1073#1083#1080#1082#1080' '#1041#1077#1083#1072#1088#1091#1089#1100', '#1082#1072#1082#1080#1084' '#1089#1091#1076#1086#1084', '#1082' '#1082#1072#1082#1086#1081' '#1084#1077#1088#1077' '#1085#1072#1082#1072#1079#1072#1085#1080#1103', '#1082#1086#1075 +
            #1076#1072' '#1089#1085#1103#1090#1072' '#1080#1083#1080' '#1087#1086#1075#1072#1096#1077#1085#1072' '#1089#1091#1076#1080#1084#1086#1089#1090#1100')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label17: TLabel
          Left = 0
          Top = 71
          Width = 106
          Height = 13
          Caption = #1042#1086#1077#1085#1085#1086#1086#1073#1103#1079#1072#1085#1085#1099#1081
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edDOKUMENT: TDBEditEh
          Left = 506
          Top = 33
          Width = 340
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
        object gbDeti: TGroupBox
          Left = 4
          Top = 217
          Width = 902
          Height = 133
          Anchors = [akLeft, akTop, akRight]
          Caption = '  '#1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1076#1077#1090#1103#1093'  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
          object GridDeti: TDBGridEh
            Left = 2
            Top = 15
            Width = 857
            Height = 116
            TabStop = False
            Align = alClient
            DataSource = dsDeti
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'Tahoma'
            FooterFont.Style = []
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            UseMultiTitle = True
            OnColEnter = GridDetiColEnter
            OnTitleBtnClick = GridDetiTitleBtnClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'FAMILIA'
                Footers = <>
                Title.Caption = #1060#1072#1084#1080#1083#1080#1103
                Width = 87
              end
              item
                EditButtons = <>
                FieldName = 'NAME'
                Footers = <>
                Title.Caption = #1048#1084#1103
                Width = 93
              end
              item
                EditButtons = <>
                FieldName = 'OTCH'
                Footers = <>
                Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
                Width = 81
              end
              item
                EditButtons = <>
                FieldName = 'GOD_ROG'
                Footers = <>
                Title.Caption = #1043#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
                Title.TitleButton = True
                Visible = False
                Width = 82
              end
              item
                EditButtons = <>
                FieldName = 'DATER'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
                Title.TitleButton = True
                Width = 85
              end
              item
                EditButtons = <>
                FieldName = 'MESTOR'
                Footers = <>
                Title.Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
                Width = 289
              end
              item
                EditButtons = <>
                FieldName = 'ZAGS_NAME'
                Footers = <>
                Title.Caption = #1052#1077#1089#1090#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
                Width = 291
              end
              item
                EditButtons = <>
                FieldName = 'ZAGS_NOMER'
                Footers = <>
                Title.Caption = #1053#1086#1084#1077#1088
                Width = 61
              end
              item
                EditButtons = <>
                FieldName = 'ZAGS_DATE'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072
                Width = 108
              end>
          end
          object Panel1: TPanel
            Left = 859
            Top = 15
            Width = 41
            Height = 116
            Align = alRight
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object btAddChild: TBitBtn
              Left = 6
              Top = 4
              Width = 28
              Height = 28
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100
              TabOrder = 0
              TabStop = False
              OnClick = btAddChildClick
            end
            object btDelChild: TBitBtn
              Left = 6
              Top = 39
              Width = 28
              Height = 28
              Hint = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 1
              TabStop = False
              OnClick = btDelChildClick
            end
            object btChoiceChild: TBitBtn
              Left = 6
              Top = 75
              Width = 28
              Height = 28
              Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1072#1082#1090#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080
              TabOrder = 2
              TabStop = False
              OnClick = btChoiceChildClick
            end
          end
        end
        object edDOK_TYPE: TDBComboBoxEh
          Left = 178
          Top = 3
          Width = 423
          Height = 26
          HelpContext = 888
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
          Left = 178
          Top = 33
          Width = 62
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
        object edDOK_NOMER: TDBEditEh
          Left = 256
          Top = 33
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
        object edDOK_DATE: TDBDateTimeEditEh
          Left = 385
          Top = 33
          Width = 107
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
        object edSpec: TDBEditEh
          Left = 677
          Top = 595
          Width = 225
          Height = 26
          Hint = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1087#1086#1076#1087#1080#1089#1100' '#1082' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1102
          HelpContext = 999
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
          TabOrder = 11
          Visible = True
        end
        object edAddDok: TDBMemo
          Left = 4
          Top = 459
          Width = 902
          Height = 122
          DataField = 'ADD_DOK'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object edAddSud: TDBEditEh
          Left = 4
          Top = 403
          Width = 902
          Height = 31
          Anchors = [akLeft, akTop, akRight]
          AutoSelect = False
          AutoSize = False
          DataField = 'ADD_SUD'
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
          WantReturns = True
          OnDblClick = TBItemEditMemoClick
        end
        object pnTypeBrak: TPanel
          Left = 5
          Top = 97
          Width = 809
          Height = 120
          BevelOuter = bvNone
          TabOrder = 7
          DesignSize = (
            809
            120)
          object edTypeBrak: TDBComboBoxEh
            Left = 6
            Top = 4
            Width = 297
            Height = 26
            DataField = 'TYPE_BRAK'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Visible = True
            OnChange = edTypeBrakChange
          end
          object pnZags: TPanel
            Left = 0
            Top = 32
            Width = 809
            Height = 88
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            DesignSize = (
              809
              88)
            object Label32: TLabel
              Left = 6
              Top = 17
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
            object Label33: TLabel
              Left = 126
              Top = 17
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
            object Label34: TLabel
              Left = 302
              Top = 17
              Width = 79
              Height = 13
              Caption = #1089#1086#1089#1090#1072#1074#1083#1077#1085#1085#1086#1081' '#1074
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edB_NOMER: TDBEditEh
              Left = 27
              Top = 10
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
              TabOrder = 0
              Visible = True
            end
            object edB_DATE: TDBDateTimeEditEh
              Left = 160
              Top = 10
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
              TabOrder = 1
              Visible = True
            end
            object edB_ZAGS: TDBEditEh
              Left = 395
              Top = 10
              Width = 398
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
              TabOrder = 2
              Visible = True
            end
          end
          object pnSud: TPanel
            Left = 224
            Top = 85
            Width = 601
            Height = 64
            Anchors = [akLeft, akRight, akBottom]
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              601
              64)
            object Label38: TLabel
              Left = 15
              Top = 17
              Width = 71
              Height = 13
              Caption = #1088#1077#1096#1077#1085#1080#1077' '#1089#1091#1076#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label30: TLabel
              Left = 15
              Top = 48
              Width = 149
              Height = 13
              Caption = #1074#1089#1090#1091#1087#1080#1074#1096#1077#1077' '#1074' '#1079#1072#1082#1086#1085#1085#1091#1102' '#1089#1080#1083#1091
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label29: TLabel
              Left = 478
              Top = 8
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
            object Label37: TLabel
              Left = 526
              Top = 17
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
            object edSud: TDBEditEh
              Left = 99
              Top = 10
              Width = 206
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
              TabOrder = 0
              Visible = True
            end
            object edSudDateSila: TDBDateTimeEditEh
              Left = 179
              Top = 41
              Width = 121
              Height = 26
              DataField = 'B_DATE2'
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
            object edSudDate: TDBDateTimeEditEh
              Left = 549
              Top = 10
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
              TabOrder = 1
              Visible = True
            end
          end
        end
        object N_F_cbVUS: TDBCheckBoxEh
          Left = 153
          Top = 69
          Width = 19
          Height = 17
          DataField = 'V_OBAZAN'
          DataSource = dsDokument
          TabOrder = 5
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = N_F_cbVUSClick
        end
        object edVoenkom: TDBLookupComboboxEh
          Left = 178
          Top = 64
          Width = 609
          Height = 26
          DataField = 'VOENKOM'
          DataSource = dsDokument
          DropDownBox.AutoFitColWidths = False
          DropDownBox.Columns = <
            item
              FieldName = 'NAME'
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Width = 250
            end
            item
              FieldName = 'ADRES'
              Title.Caption = #1040#1076#1088#1077#1089
              Width = 350
            end>
          DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
          DropDownBox.Rows = 20
          DropDownBox.ShowTitles = True
          DropDownBox.Sizable = True
          DropDownBox.Width = 550
          EditButtons = <
            item
              Glyph.Data = {
                D6000000424DD60000000000000076000000280000000A0000000C0000000100
                0400000000006000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888800
                0000800000000800000080EEEEEE0800000080EEEEEE0800000080EEEEEE0800
                000080EEEEEE0800000080EEEEEE0800000080EEE0000800000080EEE0AA0800
                000080EEE0A08800000080000008880000008888888888000000}
              Hint = #1047#1085#1072#1095#1077#1085#1080#1077' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
              Style = ebsGlyphEh
              OnClick = edVoenkomEditButtons0Click
            end
            item
              Glyph.Data = {
                C6000000424DC60000000000000076000000280000000A0000000A0000000100
                0400000000005000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888800
                0000008888880800000080088880080000008000880088000000880000088800
                0000888000888800000088000008880000008000880088000000800888800800
                00008088888888000000}
              Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
              Style = ebsGlyphEh
              OnClick = edVoenkomEditButtons1Click
            end
            item
              Hint = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1074#1086#1077#1085#1082#1086#1084#1072#1090' '#1087#1086' '#1084#1077#1089#1090#1091' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
              ShortCut = 45
              Style = ebsPlusEh
              OnClick = edVoenkomEditButtons2Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsVoenkom
          ParentFont = False
          TabOrder = 6
          Visible = True
          OnChange = edVoenkomChange
        end
        object pnFAM: TPanel
          Left = 488
          Top = 360
          Width = 529
          Height = 87
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          TabOrder = 8
          object Label6: TLabel
            Left = 7
            Top = 7
            Width = 338
            Height = 13
            Caption = #1054#1076#1085#1086#1074#1088#1077#1084#1077#1085#1085#1086' '#1087#1088#1086#1096#1091' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1092#1072#1084#1080#1083#1080#1102' '#1084#1072#1090#1077#1088#1080' ('#1086#1090#1094#1072') '#1089
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object Label8: TLabel
            Left = 227
            Top = 35
            Width = 14
            Height = 13
            Caption = #1085#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label56: TLabel
            Left = 11
            Top = 55
            Width = 764
            Height = 13
            Caption = 
              #1074' '#1079#1072#1087#1080#1089#1080' '#1072#1082#1090#1072' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080' '#1086#1073#1097#1077#1075#1086' '#1085#1077#1089#1086#1074#1077#1088#1096#1077#1085#1085#1086#1083#1077#1090#1085#1077#1075#1086' '#1088#1077#1073#1077#1085#1082#1072' / '#1079#1072 +
              #1087#1080#1089#1103#1093' '#1072#1082#1090#1086#1074' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080' '#1086#1073#1097#1080#1093' '#1085#1077#1089#1086#1074#1077#1088#1096#1077#1085#1085#1086#1083#1077#1090#1085#1080#1093' '#1076#1077#1090#1077#1081
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edFAM1: TDBEditEh
            Left = 9
            Top = 27
            Width = 200
            Height = 26
            AutoSelect = False
            AutoSize = False
            DataField = 'FAM1'
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
            WantReturns = True
            OnDblClick = TBItemEditMemoClick
          end
          object edFAM2: TDBEditEh
            Left = 271
            Top = 28
            Width = 200
            Height = 26
            AutoSelect = False
            AutoSize = False
            DataField = 'FAM2'
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
            WantReturns = True
            OnDblClick = TBItemEditMemoClick
          end
        end
      end
      object tsAdd: TTabSheet
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
        ImageIndex = 2
        DesignSize = (
          912
          645)
        object lbOtmIsp: TLabel
          Left = 12
          Top = 216
          Width = 137
          Height = 13
          Caption = #1054#1090#1084#1077#1090#1082#1072' '#1086#1073' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 12
          Top = 247
          Width = 70
          Height = 13
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox1: TGroupBox
          Left = 4
          Top = 1
          Width = 904
          Height = 189
          Anchors = [akLeft, akTop, akRight]
          Caption = 
            ' '#1057#1074#1077#1076#1077#1085#1080#1103', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1077' '#1076#1083#1103' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103' '#1073#1088#1072#1082#1072', '#1079#1072#1087#1088#1072#1096#1080 +
            #1074#1072#1077#1084#1099#1077' '#1086#1088#1075#1072#1085#1086#1084' '#1079#1072#1075#1089#1072'  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          DesignSize = (
            904
            189)
          object GridZapros: TDBGridEh
            Left = 7
            Top = 17
            Width = 842
            Height = 164
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dsZapros
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'Tahoma'
            FooterFont.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            UseMultiTitle = True
            Columns = <
              item
                EditButtons = <>
                FieldName = 'FLD_TEXT'
                Footers = <>
                Title.Caption = #1079#1072#1087#1088#1072#1096#1080#1074#1072#1077#1084#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
                Width = 259
              end
              item
                EditButtons = <>
                FieldName = 'FLD_ORG'
                Footers = <>
                Title.Caption = 
                  #1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1077#1085#1085#1099#1077' '#1086#1088#1075#1072#1085#1099', '#1080#1085#1099#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080', '#1074' '#1082#1086#1090#1086#1088#1099#1077' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1099' '#1079 +
                  #1072#1087#1088#1086#1089#1099
                Width = 268
              end
              item
                EditButtons = <>
                FieldName = 'FLD_DATEZ'
                Footers = <>
                Title.Caption = #1076#1072#1090#1072' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1088#1086#1089#1072
                Width = 123
              end
              item
                EditButtons = <>
                FieldName = 'FLD_DATEO'
                Footers = <>
                Title.Caption = #1076#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1086#1090#1074#1077#1090#1072' '#1085#1072' '#1079#1072#1087#1088#1086#1089
                Width = 104
              end>
          end
          object Panel3: TPanel
            Left = 850
            Top = 15
            Width = 52
            Height = 172
            Align = alRight
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object btAddZapros: TBitBtn
              Left = 12
              Top = 8
              Width = 28
              Height = 28
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100
              TabOrder = 0
              TabStop = False
              OnClick = btAddZaprosClick
            end
            object btDelZapros: TBitBtn
              Left = 12
              Top = 48
              Width = 28
              Height = 28
              Hint = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 1
              TabStop = False
              OnClick = btDelZaprosClick
            end
          end
        end
        object edOtmIsp: TDBEditEh
          Left = 166
          Top = 210
          Width = 459
          Height = 26
          HelpContext = 888
          DataField = 'OTMETKA_ISP'
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
        object edPrim: TDBEditEh
          Left = 166
          Top = 240
          Width = 459
          Height = 26
          HelpContext = 999
          Anchors = [akLeft, akTop, akRight]
          DataField = 'PRIM'
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
    end
    object pnMain: TPanel
      Left = 0
      Top = 0
      Width = 920
      Height = 34
      Align = alTop
      TabOrder = 1
      DesignSize = (
        920
        34)
      object lbNomer: TLabel
        Left = 8
        Top = 11
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
      object Label28: TLabel
        Left = 124
        Top = 11
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
        Left = 922
        Top = 5
        Width = 20
        Height = 20
        Anchors = [akTop, akRight]
        Transparent = True
      end
      object lbZapis: TLabel
        Left = 347
        Top = 11
        Width = 272
        Height = 13
        Caption = #1042#1085#1077#1089#1077#1085#1099' '#1080#1079#1084#1077#1085#1077#1085#1080#1103', '#1076#1086#1087#1086#1083#1085#1077#1085#1080#1103', '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNomer: TDBEditEh
        Left = 55
        Top = 4
        Width = 60
        Height = 26
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
        Left = 146
        Top = 4
        Width = 100
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
        OnUpdateData = edDateZUpdateData
      end
      object N_F_1: TDBCheckBoxEh
        Left = 792
        Top = 6
        Width = 57
        Height = 17
        Caption = '1-'#1099#1081' '#1101#1082#1079#1077#1084#1087#1083#1103#1088
        DataField = 'First_Ekz'
        DataSource = dsDokument
        TabOrder = 3
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        Visible = False
      end
      object edZDate: TDBDateTimeEditEh
        Left = 634
        Top = 4
        Width = 100
        Height = 26
        DataField = 'Z_DATE'
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
    end
  end
  inherited StBar: TStatusBar
    Top = 760
    Width = 920
  end
  inherited pnAdd: TPanel
    Top = 29
    Width = 920
  end
  inherited dsDokument: TDataSource
    Left = 680
    Top = 138
  end
  object dsDeti: TDataSource [8]
    DataSet = tbDeti
    OnDataChange = dsDetiDataChange
    Left = 464
    Top = 101
  end
  object tbDeti: TkbmMemTable [9]
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'FAMILIA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'OTCH'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'GOD_ROG'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ZAGS_NAME'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ZAGS_NOMER'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ZAGS_DATE'
        DataType = ftDate
      end
      item
        Name = 'DATER'
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
    Left = 296
    Top = 293
    object tbDetiFAMILIA: TStringField
      FieldName = 'FAMILIA'
      Size = 50
    end
    object tbDetiNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object tbDetiOTCH: TStringField
      FieldName = 'OTCH'
      Size = 50
    end
    object tbDetiGOD_ROG: TStringField
      FieldName = 'GOD_ROG'
      Size = 15
    end
    object tbDetiZAGS_NAME: TStringField
      FieldName = 'ZAGS_NAME'
      Size = 200
    end
    object tbDetiZAGS_NOMER: TStringField
      FieldName = 'ZAGS_NOMER'
    end
    object tbDetiZAGS_DATE: TDateField
      FieldName = 'ZAGS_DATE'
    end
    object tbDetiDATER: TDateField
      FieldName = 'DATER'
    end
    object tbDetiMESTOR: TStringField
      FieldName = 'MESTOR'
      Size = 150
    end
  end
  object dsNation: TDataSource [10]
    DataSet = dmBase.SprNac
    Left = 716
    Top = 161
  end
  object dsStran: TDataSource [11]
    DataSet = dmBase.SprStran
    Left = 684
    Top = 153
  end
  inherited Dokument: TkbmMemTable
    FieldDefs = <
      item
        Name = 'NOMER'
        DataType = ftInteger
      end
      item
        Name = 'DATEZ'
        DataType = ftDate
      end
      item
        Name = 'SVID_SERIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SVID_NOMER'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATESV'
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
        Name = 'FamiliaDo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NameDo'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OtchDo'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FamiliaPosle'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NamePosle'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OtchPosle'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FamiliaDo_B'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NameDo_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OtchDo_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FamiliaPosle_B'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NamePosle_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OtchPosle_B'
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
        Name = 'GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NATION'
        DataType = ftInteger
      end
      item
        Name = 'GRAG'
        DataType = ftInteger
      end
      item
        Name = 'M_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'M_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'M_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'M_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'M_GOROD_R'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'M_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'M_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'SEM'
        DataType = ftInteger
      end
      item
        Name = 'V_OBAZAN'
        DataType = ftBoolean
      end
      item
        Name = 'V_WHO'
        DataType = ftMemo
      end
      item
        Name = 'DOKUMENT'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'DETI'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'OSNOV'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'OTMETKA'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'RUKOV'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'RUKOV_B'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SPEC'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ISPRAV'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'VOSSTAN'
        DataType = ftBoolean
      end
      item
        Name = 'ID_ZAGS'
        DataType = ftInteger
      end
      item
        Name = 'ID_SOURCE'
        DataType = ftInteger
      end
      item
        Name = 'B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'REG_ZAGS'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'REG_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'REG_DATE'
        DataType = ftDate
      end
      item
        Name = 'First_Ekz'
        DataType = ftBoolean
      end
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
        Name = 'DateIzm'
        DataType = ftDate
      end
      item
        Name = 'OBL_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RAION_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GOROD_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OTHER'
        DataType = ftMemo
      end
      item
        Name = 'IZMEN'
        DataType = ftMemo
      end
      item
        Name = 'COPIA'
        DataType = ftBoolean
      end
      item
        Name = 'NOMER_EKZ'
        DataType = ftInteger
      end
      item
        Name = 'ARX_ADRESAT'
        DataType = ftMemo
      end
      item
        Name = 'ARX_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ARX_DATE'
        DataType = ftDate
      end
      item
        Name = 'ARX_TEXT'
        DataType = ftMemo
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
        Name = 'B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'M_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'POLE_GRN'
        DataType = ftSmallint
      end
      item
        Name = 'DOK_TYPE'
        DataType = ftSmallint
      end
      item
        Name = 'DOK_SERIA'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'DOK_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DOK_DATE'
        DataType = ftDate
      end
      item
        Name = 'DOK_ORGAN'
        DataType = ftInteger
      end
      item
        Name = 'VOENKOM'
        DataType = ftInteger
      end
      item
        Name = 'TYPEMESSAGE'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'IDENTIF'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'SPEC_B'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'RN_B_GOROD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RN_M_B_GOROD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'POSHLINA'
        DataType = ftMemo
      end
      item
        Name = 'SUM_POSHLINA'
        DataType = ftFloat
      end>
    Left = 496
    Top = 170
    object DokumentNOMER: TIntegerField [0]
      FieldName = 'NOMER'
    end
    object DokumentDATEZ: TDateField [1]
      FieldName = 'DATEZ'
    end
    object DokumentSVID_SERIA: TStringField [2]
      FieldName = 'SVID_SERIA'
      Size = 10
    end
    object DokumentSVID_NOMER: TStringField [3]
      FieldName = 'SVID_NOMER'
    end
    object DokumentDATESV: TDateField [4]
      FieldName = 'DATESV'
    end
    object DokumentMEN_ID: TIntegerField [5]
      FieldName = 'MEN_ID'
    end
    object DokumentLICH_ID: TIntegerField [6]
      FieldName = 'LICH_ID'
    end
    object DokumentFamilia: TStringField [7]
      FieldName = 'Familia'
      Size = 50
    end
    object DokumentName: TStringField [8]
      FieldName = 'Name'
      Size = 30
    end
    object DokumentOtch: TStringField [9]
      FieldName = 'Otch'
      Size = 30
    end
    object DokumentFamiliaNa: TStringField [10]
      FieldName = 'FamiliaNa'
      Size = 50
    end
    object DokumentFamiliaNa_B: TStringField [11]
      FieldName = 'FamiliaNa_B'
      Size = 50
    end
    object DokumentNameNa: TStringField [12]
      FieldName = 'NameNa'
      Size = 30
    end
    object DokumentOtchNa: TStringField [13]
      FieldName = 'OtchNa'
      Size = 30
    end
    object DokumentPOL: TStringField [14]
      FieldName = 'POL'
      Size = 1
    end
    object DokumentDateR: TDateField [15]
      FieldName = 'DateR'
    end
    object DokumentGOSUD: TIntegerField [16]
      FieldName = 'GOSUD'
    end
    object DokumentOBL: TStringField [17]
      FieldName = 'OBL'
      Size = 30
    end
    object DokumentRAION: TStringField [18]
      FieldName = 'RAION'
      Size = 30
    end
    object DokumentGOROD: TStringField [19]
      FieldName = 'GOROD'
      Size = 30
    end
    object DokumentNATION: TIntegerField [20]
      FieldName = 'NATION'
    end
    object DokumentGRAG: TIntegerField [21]
      FieldName = 'GRAG'
    end
    object DokumentM_GOSUD: TIntegerField [22]
      FieldName = 'M_GOSUD'
    end
    object DokumentM_OBL: TStringField [23]
      FieldName = 'M_OBL'
      Size = 30
    end
    object DokumentM_RAION: TStringField [24]
      FieldName = 'M_RAION'
      Size = 30
    end
    object DokumentM_GOROD: TStringField [25]
      FieldName = 'M_GOROD'
      Size = 30
    end
    object DokumentM_GOROD_R: TStringField [26]
      FieldName = 'M_GOROD_R'
      Size = 70
    end
    object DokumentM_B_RESP: TBooleanField [27]
      FieldName = 'M_B_RESP'
    end
    object DokumentM_B_OBL: TBooleanField [28]
      FieldName = 'M_B_OBL'
    end
    object DokumentV_OBAZAN: TBooleanField [29]
      FieldName = 'V_OBAZAN'
    end
    object DokumentV_WHO: TMemoField [30]
      DisplayLabel = #1043#1076#1077' '#1089#1086#1089#1090#1086#1080#1090' '#1085#1072' '#1091#1095#1077#1090#1077
      FieldName = 'V_WHO'
      BlobType = ftMemo
    end
    object DokumentDOKUMENT: TMemoField [31]
      FieldName = 'DOKUMENT'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentDETI: TMemoField [32]
      FieldName = 'DETI'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentSPEC: TStringField [33]
      FieldName = 'SPEC'
      Size = 60
    end
    object DokumentVOSSTAN: TBooleanField [34]
      FieldName = 'VOSSTAN'
    end
    object DokumentID_ZAGS: TIntegerField [35]
      FieldName = 'ID_ZAGS'
    end
    object DokumentID_SOURCE: TIntegerField [36]
      FieldName = 'ID_SOURCE'
    end
    object DokumentB_RESP: TBooleanField [37]
      FieldName = 'B_RESP'
    end
    object DokumentB_OBL: TBooleanField [38]
      FieldName = 'B_OBL'
    end
    object DokumentREG_ZAGS: TMemoField [39]
      FieldName = 'REG_ZAGS'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentREG_NOMER: TIntegerField [40]
      FieldName = 'REG_NOMER'
    end
    object DokumentREG_DATE: TDateField [41]
      FieldName = 'REG_DATE'
    end
    object DokumentFirst_Ekz: TBooleanField [42]
      FieldName = 'First_Ekz'
    end
    object DokumentOBL_B: TStringField [47]
      FieldName = 'OBL_B'
      Size = 30
    end
    object DokumentRAION_B: TStringField [48]
      FieldName = 'RAION_B'
      Size = 30
    end
    object DokumentGOROD_B: TStringField [49]
      FieldName = 'GOROD_B'
      Size = 30
    end
    object DokumentOTHER: TMemoField [50]
      FieldName = 'OTHER'
      BlobType = ftMemo
    end
    object DokumentCOPIA: TBooleanField [51]
      FieldName = 'COPIA'
    end
    object DokumentB_GOROD: TSmallintField [59]
      FieldName = 'B_GOROD'
    end
    object DokumentM_B_GOROD: TSmallintField [60]
      FieldName = 'M_B_GOROD'
    end
    object DokumentSTATUS: TStringField [61]
      FieldName = 'STATUS'
      Size = 1
    end
    object DokumentPOLE_GRN: TSmallintField [62]
      FieldName = 'POLE_GRN'
    end
    object DokumentDOK_TYPE: TSmallintField [63]
      FieldName = 'DOK_TYPE'
    end
    object DokumentDOK_SERIA: TStringField [64]
      FieldName = 'DOK_SERIA'
      Size = 7
    end
    object DokumentDOK_NOMER: TStringField [65]
      FieldName = 'DOK_NOMER'
      Size = 10
    end
    object DokumentDOK_DATE: TDateField [66]
      FieldName = 'DOK_DATE'
    end
    object DokumentDOK_ORGAN: TIntegerField [67]
      FieldName = 'DOK_ORGAN'
    end
    object DokumentVOENKOM: TIntegerField [68]
      FieldName = 'VOENKOM'
    end
    object DokumentTYPEMESSAGE: TStringField [69]
      FieldName = 'TYPEMESSAGE'
      Size = 4
    end
    object DokumentIDENTIF: TStringField [70]
      FieldName = 'IDENTIF'
      Size = 14
    end
    object DokumentPOSHLINA: TMemoField [71]
      FieldName = 'POSHLINA'
      BlobType = ftMemo
    end
    object DokumentSUM_POSHLINA: TFloatField [72]
      FieldName = 'SUM_POSHLINA'
    end
    object DokumentDETI_DATER: TBooleanField [73]
      FieldName = 'DETI_DATER'
    end
    object DokumentM_RNGOROD: TStringField [77]
      FieldName = 'M_RNGOROD'
      Size = 50
    end
    object DokumentPRICH: TStringField
      FieldName = 'PRICH'
      Size = 100
    end
    object DokumentKOD_PRICH: TIntegerField
      FieldName = 'KOD_PRICH'
    end
    object DokumentNATION_DOK: TStringField
      FieldName = 'NATION_DOK'
      Size = 200
    end
    object DokumentWORK: TStringField
      FieldName = 'WORK_PLACE'
      Size = 200
    end
    object DokumentADD_SUD: TStringField
      FieldName = 'ADD_SUD'
      Size = 250
    end
    object DokumentADD_DOK: TMemoField
      FieldName = 'ADD_DOK'
      BlobType = ftMemo
    end
    object DokumentTYPE_BRAK: TIntegerField
      FieldName = 'TYPE_BRAK'
    end
    object DokumentB_DATE: TDateField
      FieldName = 'B_DATE'
    end
    object DokumentB_DATE2: TDateField
      FieldName = 'B_DATE2'
    end
    object DokumentB_ZAGS: TStringField
      FieldName = 'B_ZAGS'
      Size = 200
    end
    object DokumentB_NOMER: TStringField
      FieldName = 'B_NOMER'
      Size = 10
    end
    object DokumentTYPEAKT: TSmallintField
      FieldName = 'TYPEAKT'
    end
    object DokumentOTMETKA_ISP: TStringField
      FieldName = 'OTMETKA_ISP'
      Size = 500
    end
    object DokumentPRIM: TStringField
      FieldName = 'PRIM'
      Size = 500
    end
    object DokumentIS_IZMEN: TBooleanField
      FieldName = 'IS_IZMEN'
    end
    object DokumentIS_DOPOLN: TBooleanField
      FieldName = 'IS_DOPOLN'
    end
    object DokumentIS_ISPRAV: TBooleanField
      FieldName = 'IS_ISPRAV'
    end
    object DokumentZ_DATE: TDateField
      FieldName = 'Z_DATE'
    end
    object DokumentZ_NOMER: TIntegerField
      FieldName = 'Z_NOMER'
    end
    object DokumentCURVALUES: TMemoField
      FieldName = 'CURVALUES'
      BlobType = ftMemo
    end
    object DokumentNEWVALUES: TMemoField
      FieldName = 'NEWVALUES'
      BlobType = ftMemo
    end
    object DokumentBRAK_ID: TIntegerField
      FieldName = 'BRAK_ID'
    end
    object DokumentTYPE_FAM: TSmallintField
      FieldName = 'TYPE_FAM'
    end
    object DokumentFAM1: TStringField
      FieldName = 'FAM1'
      Size = 50
    end
    object DokumentFAM2: TStringField
      FieldName = 'FAM2'
      Size = 50
    end
    object DokumentFIO1: TStringField
      FieldName = 'FIO1'
      Size = 100
    end
    object DokumentFIO2: TStringField
      FieldName = 'FIO2'
      Size = 100
    end
    object DokumentST21: TBooleanField
      FieldName = 'ST21'
    end
  end
  inherited HistZAGS: TkbmMemTable
    Left = 296
    Top = 90
  end
  inherited dsSeria: TDataSource
    Left = 648
    Top = 250
  end
  inherited dsObl: TDataSource
    Top = 178
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 704
    Top = 202
  end
  inherited dsPovtor: TDataSource
    Left = 528
    Top = 242
  end
  inherited dsGorod: TDataSource
    Left = 576
    Top = 210
  end
  inherited dsRnGor: TDataSource
    Left = 560
    Top = 242
  end
  inherited dsTypeGorod: TDataSource
    Left = 672
    Top = 202
  end
  inherited dsVoenkom: TDataSource
    Left = 752
    Top = 202
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 432
    Top = 98
  end
  object dsGragd: TDataSource [27]
    Left = 604
    Top = 179
  end
  object tbZakl: TkbmMemTable [28]
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
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
    Left = 646
    Top = 359
    object tbZaklID: TIntegerField
      FieldName = 'ID'
    end
    object tbZaklNAME_ZAGS: TStringField
      FieldName = 'NAME_ZAGS'
      Size = 200
    end
    object tbZaklNAME_ZAGS_B: TStringField
      FieldName = 'NAME_ZAGS_B'
      Size = 200
    end
    object tbZaklID_ZAGS: TIntegerField
      FieldName = 'ID_ZAGS'
    end
    object tbZaklDateIzm: TDateField
      FieldName = 'DateIzm'
    end
    object tbZaklPOVTOR: TBooleanField
      FieldName = 'POVTOR'
    end
    object tbZaklIS_GOROD: TBooleanField
      FieldName = 'IS_GOROD'
    end
    object tbZaklDATE_ANUL: TDateField
      FieldName = 'DATE_ANUL'
    end
    object tbZaklNOMER: TIntegerField
      FieldName = 'NOMER'
    end
    object tbZaklDATEZ: TDateField
      FieldName = 'DATEZ'
    end
    object tbZaklMEN_ID: TIntegerField
      FieldName = 'MEN_ID'
    end
    object tbZaklLICH_ID: TIntegerField
      FieldName = 'LICH_ID'
    end
    object tbZaklADRESAT: TMemoField
      FieldName = 'ADRESAT'
      BlobType = ftMemo
    end
    object tbZaklFamilia: TStringField
      FieldName = 'Familia'
      Size = 50
    end
    object tbZaklName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object tbZaklOtch: TStringField
      FieldName = 'Otch'
      Size = 30
    end
    object tbZaklPOL: TStringField
      FieldName = 'POL'
      Size = 1
    end
    object tbZaklGRAG: TIntegerField
      FieldName = 'GRAG'
    end
    object tbZaklDateR: TDateField
      FieldName = 'DateR'
    end
    object tbZaklRG_B_RESP: TBooleanField
      FieldName = 'RG_B_RESP'
    end
    object tbZaklRG_GOSUD: TIntegerField
      FieldName = 'RG_GOSUD'
    end
    object tbZaklRG_B_OBL: TBooleanField
      FieldName = 'RG_B_OBL'
    end
    object tbZaklRG_OBL: TStringField
      FieldName = 'RG_OBL'
      Size = 30
    end
    object tbZaklRG_RAION: TStringField
      FieldName = 'RG_RAION'
      Size = 30
    end
    object tbZaklRG_B_GOROD: TSmallintField
      FieldName = 'RG_B_GOROD'
    end
    object tbZaklRG_GOROD: TStringField
      FieldName = 'RG_GOROD'
      Size = 30
    end
    object tbZaklGT_B_RESP: TBooleanField
      FieldName = 'GT_B_RESP'
    end
    object tbZaklGT_GOSUD: TIntegerField
      FieldName = 'GT_GOSUD'
    end
    object tbZaklGT_B_OBL: TBooleanField
      FieldName = 'GT_B_OBL'
    end
    object tbZaklGT_OBL: TStringField
      FieldName = 'GT_OBL'
      Size = 30
    end
    object tbZaklGT_RAION: TStringField
      FieldName = 'GT_RAION'
      Size = 30
    end
    object tbZaklGT_RNGOROD: TStringField
      FieldName = 'GT_RNGOROD'
      Size = 30
    end
    object tbZaklGT_B_GOROD: TSmallintField
      FieldName = 'GT_B_GOROD'
    end
    object tbZaklGT_GOROD: TStringField
      FieldName = 'GT_GOROD'
      Size = 30
    end
    object tbZaklGT_GOROD_R: TStringField
      FieldName = 'GT_GOROD_R'
      Size = 50
    end
    object tbZaklRUKOV: TStringField
      FieldName = 'RUKOV'
      Size = 60
    end
    object tbZaklDATE1: TDateField
      FieldName = 'DATE1'
    end
    object tbZaklDATE2: TDateField
      FieldName = 'DATE2'
    end
    object tbZaklWHO: TStringField
      FieldName = 'WHO'
      Size = 50
    end
    object tbZaklPRICH: TStringField
      FieldName = 'PRICH'
      Size = 200
    end
    object tbZaklFamilia_Posle: TStringField
      FieldName = 'Familia_Posle'
      Size = 50
    end
    object tbZaklName_Posle: TStringField
      FieldName = 'Name_Posle'
      Size = 30
    end
    object tbZaklOtch_Posle: TStringField
      FieldName = 'Otch_Posle'
      Size = 30
    end
    object tbZaklR_NOMER: TStringField
      FieldName = 'R_NOMER'
      Size = 10
    end
    object tbZaklR_DATE: TDateField
      FieldName = 'R_DATE'
    end
    object tbZaklR_ZAGS: TMemoField
      FieldName = 'R_ZAGS'
      BlobType = ftMemo
    end
    object tbZaklR_RG_B_RESP: TBooleanField
      FieldName = 'R_RG_B_RESP'
    end
    object tbZaklR_RG_GOSUD: TIntegerField
      FieldName = 'R_RG_GOSUD'
    end
    object tbZaklR_RG_B_OBL: TBooleanField
      FieldName = 'R_RG_B_OBL'
    end
    object tbZaklR_RG_OBL: TStringField
      FieldName = 'R_RG_OBL'
      Size = 30
    end
    object tbZaklR_RG_RAION: TStringField
      FieldName = 'R_RG_RAION'
      Size = 30
    end
    object tbZaklR_RG_B_GOROD: TSmallintField
      FieldName = 'R_RG_B_GOROD'
    end
    object tbZaklR_RG_GOROD: TStringField
      FieldName = 'R_RG_GOROD'
      Size = 30
    end
    object tbZaklR_MAT: TStringField
      FieldName = 'R_MAT'
      Size = 70
    end
    object tbZaklR_OTEC: TStringField
      FieldName = 'R_OTEC'
      Size = 70
    end
    object tbZaklWORK: TMemoField
      FieldName = 'WORK'
      BlobType = ftMemo
    end
    object tbZaklVUS: TMemoField
      FieldName = 'VUS'
      BlobType = ftMemo
    end
    object tbZaklSUPRUG: TStringField
      FieldName = 'SUPRUG'
      Size = 70
    end
    object tbZaklB_NOMER: TStringField
      FieldName = 'B_NOMER'
      Size = 10
    end
    object tbZaklB_DATE: TDateField
      FieldName = 'B_DATE'
    end
    object tbZaklB_ZAGS: TMemoField
      FieldName = 'B_ZAGS'
      BlobType = ftMemo
    end
    object tbZaklROVD: TStringField
      FieldName = 'ROVD'
      Size = 100
    end
    object tbZaklROVD_DATE: TDateField
      FieldName = 'ROVD_DATE'
    end
    object tbZaklROVD_ZAKL: TMemoField
      FieldName = 'ROVD_ZAKL'
      BlobType = ftMemo
    end
    object tbZaklSOOB: TMemoField
      FieldName = 'SOOB'
      BlobType = ftMemo
    end
    object tbZaklIZMEN: TMemoField
      FieldName = 'IZMEN'
      BlobType = ftMemo
    end
    object tbZaklR_Familia: TStringField
      FieldName = 'R_Familia'
      Size = 50
    end
    object tbZaklR_Name: TStringField
      FieldName = 'R_Name'
      Size = 30
    end
    object tbZaklR_OTCH: TStringField
      FieldName = 'R_OTCH'
      Size = 30
    end
    object tbZaklOTEC: TStringField
      FieldName = 'OTEC'
      Size = 70
    end
    object tbZaklMAT: TStringField
      FieldName = 'MAT'
      Size = 70
    end
    object tbZaklIS_IZMEN: TBooleanField
      FieldName = 'IS_IZMEN'
    end
    object tbZaklFIO_NEW: TStringField
      FieldName = 'FIO_NEW'
      Size = 100
    end
  end
  object tbZaklDeti: TkbmMemTable [29]
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
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
    Left = 686
    Top = 359
    object tbZaklDetiFIO: TStringField
      FieldName = 'FIO'
      Size = 100
    end
    object tbZaklDetiMESTO: TStringField
      FieldName = 'MESTO'
      Size = 100
    end
    object tbZaklDetiDATER: TDateField
      FieldName = 'DATER'
    end
    object tbZaklDetiMESTOREG: TStringField
      FieldName = 'MESTOREG'
      Size = 100
    end
    object tbZaklDetiNOMER: TStringField
      FieldName = 'NOMER'
      Size = 10
    end
    object tbZaklDetiDATEA: TDateField
      FieldName = 'DATEA'
    end
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 248
    Top = 90
  end
  object tbZapros: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
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
    Left = 724
    Top = 230
    object tbZaprosFLD_ORG: TStringField
      FieldName = 'FLD_ORG'
      Size = 200
    end
    object tbZaprosFLD_TEXT: TStringField
      FieldName = 'FLD_TEXT'
      Size = 200
    end
    object tbZaprosFLD_DATEZ: TStringField
      FieldName = 'FLD_DATEZ'
      Size = 50
    end
    object tbZaprosFLD_DATEO: TStringField
      FieldName = 'FLD_DATEO'
      Size = 50
    end
  end
  object dsZapros: TDataSource
    DataSet = tbZapros
    OnDataChange = dsDetiDataChange
    Left = 344
    Top = 216
  end
end
