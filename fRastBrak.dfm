inherited fmRastBrak: TfmRastBrak
  Left = 226
  Top = 137
  ActiveControl = edNomer
  Caption = #1047#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1080' '#1073#1088#1072#1082#1072
  ClientHeight = 725
  ClientWidth = 888
  Constraints.MinHeight = 640
  Constraints.MinWidth = 848
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    00000000000000000AAAAA000000000AAAAAAAAA000000AAAAAAAAAAA00000AA
    0AAAAA0AA0000AAA00AAA00AAA000AAAA00000AAAA000AAAAAAAAAAAAA000AAA
    AAAAAAAAAA000AAA00AAA00AAA0000AA00AAA00AA00000AAAAAAAAAAA000000A
    AAAAAAAA000000000AAAAA00000000000000000000000000000000000000F83F
    0000E00F0000C007000080030000800300000001000000010000000100000001
    0000000100008003000080030000C0070000E00F0000F83F0000FFFF0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 26
    Width = 888
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
    Width = 888
    Height = 650
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 888
    inherited TBToolbar: TTBToolbar
      inherited TBSubmenuTmp: TTBSubmenuItem [2]
      end
      inherited TBItemFastPrint: TTBItem [4]
      end
      object TBSubmenuGISUN: TTBSubmenuItem [5]
        Caption = #1042#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1077' '#1089' '#1043#1048#1057' '#1056#1053
        ImageIndex = 5
        Images = ImGISUN
        object TBItemStep1: TTBItem
          Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
          OnClick = TBItemStep1Click
        end
        object TBItemStep2: TTBItem
          Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1072#1082#1090#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
          OnClick = TBItemStep2Click
        end
      end
      object TBItemChoiceMen: TTBItem [9]
        Caption = #1042#1099#1073#1088#1072#1090#1100
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072
        ImageIndex = 44
        Visible = False
      end
      object TBItemArxSpr: TTBItem [10]
        AutoCheck = True
        Caption = #1057#1087#1088#1072#1074#1082#1072
        Hint = #1040#1088#1093#1080#1088#1085#1072#1103' '#1089#1087#1088#1072#1074#1082#1072
        ImageIndex = 45
        OnClick = TBItemArxSprClick
      end
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      object TBItemVozrast: TTBItem [15]
        AutoCheck = True
        Caption = #1042#1086#1079#1088#1072#1089#1090
        Hint = #1058#1086#1083#1100#1082#1086' '#1074#1086#1079#1088#1072#1089#1090
        ImageIndex = 109
        OnClick = TBItemVozrastClick
      end
      object TBItemChoiceDeclRast: TTBItem [19]
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077' '#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1103' '#1073#1088#1072#1082#1072
        ImageIndex = 142
        OnClick = TBItemChoiceDeclRastClick
      end
      object TBItemChoiceBrak: TTBItem [20]
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1073#1088#1072#1082
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1082#1090#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100' '#1086' '#1073#1088#1072#1082#1077
        ImageIndex = 51
        OnClick = TBItemChoiceBrakClick
      end
      object TBItemSpeedChoice: TTBItem [21]
        Caption = #1055#1086#1080#1089#1082
        Hint = #1041#1099#1089#1090#1088#1099#1081' '#1087#1086#1080#1089#1082' '#1079#1072#1087#1080#1089#1080' '#1072#1082#1090#1072' '#1086' '#1073#1088#1072#1082#1077' '#1087#1086' '#1085#1086#1084#1077#1088#1091
        ImageIndex = 7
        OnClick = btSeekClick
      end
      inherited TBSubmenuRun: TTBSubmenuItem
        object TBItemPrintSvFIO: TTBItem
          Caption = #1055#1077#1088#1077#1085#1086#1089#1080#1090#1100' '#1074' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086' '#1092#1072#1084#1080#1083#1080#1080' '#1087#1086#1089#1083#1077' '#1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1103
          OnClick = TBItemPrintSvFIOClick
        end
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
        Left = 884
        Top = 22
        inherited edZAGS: TDBEditEh
          TabStop = False
        end
      end
    end
  end
  inherited sb: TScrollBox
    Top = 53
    Width = 888
    Height = 650
    Align = alClient
    TabOrder = 2
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
      Width = 888
      Height = 616
      ActivePage = tsTail1
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      TabOrder = 1
      TabStop = False
      OnChange = pcChange
      object tsTail1: TTabSheet
        Caption = #1063#1072#1089#1090#1100' 1'
        DesignSize = (
          880
          585)
        object Label1: TLabel
          Left = 9
          Top = 20
          Width = 181
          Height = 21
          AutoSize = False
          Caption = '1. '#1060#1072#1084#1080#1083#1080#1103' '#1076#1086' '#1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label2: TLabel
          Left = 330
          Top = 1
          Width = 16
          Height = 13
          Caption = #1054#1053
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 656
          Top = 1
          Width = 24
          Height = 13
          Caption = #1054#1053#1040
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 25
          Top = 48
          Width = 165
          Height = 21
          AutoSize = False
          Caption = #1055#1086#1089#1083#1077' '#1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label5: TLabel
          Left = 8
          Top = 79
          Width = 113
          Height = 13
          Caption = '2. '#1057#1086#1073#1089#1090#1074#1077#1085#1085#1086#1077' '#1080#1084#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 8
          Top = 106
          Width = 69
          Height = 13
          Caption = '3. '#1054#1090#1095#1077#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbDateR_Rodit: TLabel
          Left = 8
          Top = 161
          Width = 108
          Height = 13
          Caption = '5. '#1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 8
          Top = 181
          Width = 117
          Height = 13
          Caption = '6. '#1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 25
          Top = 193
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
        object Label10: TLabel
          Left = 80
          Top = 220
          Width = 79
          Height = 13
          Caption = #1086#1073#1083#1072#1089#1090#1100' ('#1082#1088#1072#1081') '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 124
          Top = 247
          Width = 33
          Height = 13
          Caption = #1088#1072#1081#1086#1085' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 74
          Top = 274
          Width = 85
          Height = 13
          Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077') '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 8
          Top = 302
          Width = 111
          Height = 13
          Caption = '7. '#1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 8
          Top = 328
          Width = 94
          Height = 13
          Caption = '8. '#1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 8
          Top = 346
          Width = 125
          Height = 13
          Caption = '9. '#1052#1077#1089#1090#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 25
          Top = 361
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
        object Label19: TLabel
          Left = 83
          Top = 387
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
        object Label20: TLabel
          Left = 127
          Top = 414
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
        object Label21: TLabel
          Left = 77
          Top = 441
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
        object Label23: TLabel
          Left = 43
          Top = 468
          Width = 109
          Height = 13
          Caption = #1088#1072#1081#1086#1085'  '#1075#1086#1088#1086#1076#1072', '#1091#1083#1080#1094#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 8
          Top = 549
          Width = 135
          Height = 13
          Caption = '10. '#1043#1076#1077' '#1080' '#1082#1077#1084' '#1088#1072#1073#1086#1090#1072#1077#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 8
          Top = 134
          Width = 93
          Height = 13
          Caption = '4. '#1048#1076#1077#1085#1090'. '#1085#1086#1084#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label66: TLabel
          Left = 161
          Top = 495
          Width = 19
          Height = 13
          Caption = #1076#1086#1084
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label67: TLabel
          Left = 239
          Top = 495
          Width = 28
          Height = 13
          Caption = #1082#1086#1088#1087'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label68: TLabel
          Left = 330
          Top = 495
          Width = 16
          Height = 13
          Caption = #1082#1074'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label71: TLabel
          Left = 512
          Top = 495
          Width = 19
          Height = 13
          Caption = #1076#1086#1084
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label72: TLabel
          Left = 591
          Top = 495
          Width = 28
          Height = 13
          Caption = #1082#1086#1088#1087'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label73: TLabel
          Left = 682
          Top = 494
          Width = 16
          Height = 13
          Caption = #1082#1074'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label96: TLabel
          Left = 78
          Top = 522
          Width = 82
          Height = 13
          Caption = #1082#1086#1076' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbON_SOATO: TvchDBText
          Left = 293
          Top = 521
          Width = 217
          Height = 17
          Color = clBtnFace
          DataField = 'ON_SOATO'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          WordWrap = True
          OnGetText = lbON_SOATOGetText
        end
        object lbONA_SOATO: TvchDBText
          Left = 648
          Top = 521
          Width = 200
          Height = 17
          Color = clBtnFace
          DataField = 'ONA_SOATO'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          OnGetText = lbONA_SOATOGetText
        end
        object N_F_lbON_Status: TvchDBText
          Left = 353
          Top = -1
          Width = 146
          Height = 16
          Hint = #1057#1090#1072#1090#1091#1089' '#1074' '#1043#1048#1057' '#1056#1053
          Color = clBtnFace
          Constraints.MaxWidth = 350
          DataField = 'ON_STATUS'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsItalic]
          ParentColor = False
          ParentFont = False
          OnClick = N_F_lbON_StatusClick
          OnGetText = N_F_lbON_StatusGetText
        end
        object N_F_lbONA_Status: TvchDBText
          Left = 686
          Top = -1
          Width = 111
          Height = 16
          Hint = #1057#1090#1072#1090#1091#1089' '#1074' '#1043#1048#1057' '#1056#1053
          Color = clBtnFace
          Constraints.MaxWidth = 350
          DataField = 'ONA_STATUS'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsItalic]
          ParentColor = False
          ParentFont = False
          OnClick = N_F_lbONA_StatusClick
          OnGetText = N_F_lbONA_StatusGetText
        end
        object ImCondIN_ON: TImage
          Left = 339
          Top = 133
          Width = 16
          Height = 16
          Transparent = True
          Visible = False
        end
        object ImCondIN_ONA: TImage
          Left = 691
          Top = 133
          Width = 16
          Height = 16
          Transparent = True
          Visible = False
        end
        object edON_Familia: TDBEditEh
          Left = 191
          Top = 19
          Width = 145
          Height = 26
          HelpType = htKeyword
          HelpContext = 888
          DataField = 'ON_Familia'
          DataSource = dsDokument
          EditButtons = <
            item
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888887117744744788888871717474788888888171747478888888817174747
                8888888811174447888888881117444787788178147744477478811714474447
                4488881111444444488888811114444488888888817784778888888811174447
                8888888811174447888888887118744888888888888888888888}
              Style = ebsGlyphEh
              Width = 18
              OnClick = edON_FamiliaEditButtons0Click
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
        object edONA_Familia: TDBEditEh
          Left = 543
          Top = 19
          Width = 145
          Height = 26
          DataField = 'ONA_Familia'
          DataSource = dsDokument
          EditButtons = <
            item
              Style = ebsGlyphEh
              Width = 18
              OnClick = edONA_FamiliaEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 25
          Visible = True
        end
        object edON_FamiliaP: TDBEditEh
          Left = 191
          Top = 46
          Width = 145
          Height = 26
          DataField = 'ON_FamiliaP'
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
        object edONA_FamiliaP: TDBEditEh
          Left = 543
          Top = 46
          Width = 145
          Height = 26
          DataField = 'ONA_FamiliaP'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 26
          Visible = True
        end
        object edON_Name: TDBEditEh
          Left = 191
          Top = 73
          Width = 145
          Height = 26
          DataField = 'ON_Name'
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
        object edON_OTCH: TDBEditEh
          Left = 191
          Top = 100
          Width = 145
          Height = 26
          DataField = 'ON_Otch'
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
        object edONA_Name: TDBEditEh
          Left = 543
          Top = 73
          Width = 145
          Height = 26
          DataField = 'ONA_Name'
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
        object edONA_OTCH: TDBEditEh
          Left = 543
          Top = 100
          Width = 145
          Height = 26
          DataField = 'ONA_Otch'
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
        object edON_DATER: TDBDateTimeEditEh
          Left = 191
          Top = 155
          Width = 111
          Height = 26
          DataField = 'ON_DateR'
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
          OnCheckDrawRequiredState = edON_DATERCheckDrawRequiredState
          OnUpdateData = edON_DATERUpdateData
        end
        object edONA_DATER: TDBDateTimeEditEh
          Left = 543
          Top = 155
          Width = 111
          Height = 26
          DataField = 'ONA_DateR'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 30
          Visible = True
          OnCheckDrawRequiredState = edONA_DATERCheckDrawRequiredState
          OnUpdateData = edON_DATERUpdateData
        end
        object edON_GOSUD: TDBLookupComboboxEh
          Left = 191
          Top = 187
          Width = 259
          Height = 26
          DataField = 'ON_GOSUD'
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
          TabOrder = 7
          Visible = True
        end
        object edONA_GOSUD: TDBLookupComboboxEh
          Left = 543
          Top = 187
          Width = 259
          Height = 26
          DataField = 'ONA_GOSUD'
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
          TabOrder = 32
          Visible = True
        end
        object edON_GOROD: TDBEditEh
          Left = 264
          Top = 268
          Width = 186
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'ON_GOROD'
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
        object edONA_GOROD: TDBEditEh
          Left = 616
          Top = 268
          Width = 186
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'ONA_GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 36
          Visible = True
        end
        object edON_NATION: TDBLookupComboboxEh
          Left = 191
          Top = 296
          Width = 259
          Height = 26
          DataField = 'ON_NATION'
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
          TabOrder = 12
          Visible = True
        end
        object edON_M_GOSUD: TDBLookupComboboxEh
          Left = 191
          Top = 354
          Width = 259
          Height = 26
          DataField = 'ON_M_GOSUD'
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
          TabOrder = 14
          Visible = True
          OnUpdateData = edON_M_GOSUDUpdateData
        end
        object edON_M_GOROD: TDBEditEh
          Left = 264
          Top = 435
          Width = 186
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'ON_M_GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
          Visible = True
          OnUpdateData = edON_M_GOSUDUpdateData
        end
        object edON_GRAG: TDBLookupComboboxEh
          Left = 191
          Top = 323
          Width = 259
          Height = 26
          DataField = 'ON_GRAG'
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
          TabOrder = 13
          Visible = True
        end
        object edON_M_GOROD_R: TDBEditEh
          Left = 327
          Top = 462
          Width = 169
          Height = 26
          DataField = 'ON_M_GOROD_R'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
          Visible = True
        end
        object edONA_NATION: TDBLookupComboboxEh
          Left = 543
          Top = 296
          Width = 259
          Height = 26
          DataField = 'ONA_NATION'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME_G'
          ListSource = dsNation
          ParentFont = False
          TabOrder = 37
          Visible = True
        end
        object edONA_M_GOSUD: TDBLookupComboboxEh
          Left = 543
          Top = 354
          Width = 259
          Height = 26
          DataField = 'ONA_M_GOSUD'
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
          TabOrder = 39
          Visible = True
          OnUpdateData = edONA_M_GOSUDUpdateData
        end
        object edONA_M_GOROD: TDBEditEh
          Left = 616
          Top = 435
          Width = 186
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'ONA_M_GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 43
          Visible = True
          OnUpdateData = edONA_M_GOSUDUpdateData
        end
        object edONA_GRAG: TDBLookupComboboxEh
          Left = 543
          Top = 323
          Width = 259
          Height = 26
          DataField = 'ONA_GRAG'
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
          TabOrder = 38
          Visible = True
        end
        object edONA_M_GOROD_R: TDBEditEh
          Left = 679
          Top = 462
          Width = 159
          Height = 26
          DataField = 'ONA_M_GOROD_R'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 45
          Visible = True
        end
        object edON_B_OBL: TDBCheckBoxEh
          Left = 169
          Top = 218
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ON_B_OBL'
          DataSource = dsDokument
          TabOrder = 50
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edONA_B_OBL: TDBCheckBoxEh
          Left = 522
          Top = 218
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ONA_B_OBL'
          DataSource = dsDokument
          TabOrder = 51
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edON_M_B_OBL: TDBCheckBoxEh
          Left = 169
          Top = 385
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ON_M_B_OBL'
          DataSource = dsDokument
          TabOrder = 52
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edONA_M_B_OBL: TDBCheckBoxEh
          Left = 521
          Top = 385
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ONA_M_B_OBL'
          DataSource = dsDokument
          TabOrder = 53
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edON_WORK: TDBEditEh
          Left = 191
          Top = 543
          Width = 302
          Height = 26
          DataField = 'ON_WORK'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 24
          Visible = True
        end
        object edONA_WORK: TDBEditEh
          Left = 543
          Top = 543
          Width = 302
          Height = 26
          HelpType = htKeyword
          HelpContext = 999
          DataField = 'ONA_WORK'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 49
          Visible = True
        end
        object btPadeg: TButton
          Left = 543
          Top = 3
          Width = 23
          Height = 22
          Anchors = [akTop, akRight]
          Caption = #1042' '#1087#1072#1076#1077#1078#1077
          TabOrder = 65
          Visible = False
          OnClick = btPadegClick
        end
        object cbOnlyGodON: TDBCheckBoxEh
          Left = 322
          Top = 159
          Width = 57
          Height = 17
          Hint = #1058#1086#1083#1100#1082#1086' '#1075#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
          Caption = #1043#1086#1076
          DataField = 'ON_ONLYGOD'
          DataSource = dsDokument
          TabOrder = 63
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = cbOnlyGodONClick
        end
        object cbOnlyGodONA: TDBCheckBoxEh
          Left = 676
          Top = 159
          Width = 57
          Height = 17
          Hint = #1058#1086#1083#1100#1082#1086' '#1075#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
          Caption = #1043#1086#1076
          DataField = 'ONA_ONLYGOD'
          DataSource = dsDokument
          TabOrder = 64
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = cbOnlyGodONClick
        end
        object edON_VOZR: TDBNumberEditEh
          Left = 367
          Top = 155
          Width = 41
          Height = 26
          DataField = 'ON_VOZR'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Visible = False
        end
        object edONA_VOZR: TDBNumberEditEh
          Left = 722
          Top = 155
          Width = 41
          Height = 26
          DataField = 'ONA_VOZR'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 31
          Visible = False
        end
        object edON_B_GOROD: TDBLookupComboboxEh
          Left = 191
          Top = 268
          Width = 62
          Height = 26
          Alignment = taRightJustify
          DataField = 'ON_B_GOROD'
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
          TabOrder = 10
          Visible = True
        end
        object edONA_B_GOROD: TDBLookupComboboxEh
          Left = 543
          Top = 268
          Width = 62
          Height = 26
          Alignment = taRightJustify
          DataField = 'ONA_B_GOROD'
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
          TabOrder = 35
          Visible = True
        end
        object edON_M_B_GOROD: TDBLookupComboboxEh
          Left = 191
          Top = 435
          Width = 62
          Height = 26
          Alignment = taRightJustify
          DataField = 'ON_M_B_GOROD'
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
          TabOrder = 17
          Visible = True
        end
        object edONA_M_B_GOROD: TDBLookupComboboxEh
          Left = 543
          Top = 435
          Width = 62
          Height = 26
          Alignment = taRightJustify
          DataField = 'ONA_M_B_GOROD'
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
          TabOrder = 42
          Visible = True
        end
        object ENG_edONA_IDENTIF: TDBEditEh
          Left = 543
          Top = 128
          Width = 145
          Height = 26
          CharCase = ecUpperCase
          DataField = 'ONA_IDENTIF'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          MRUList.Rows = 10
          ParentFont = False
          TabOrder = 29
          Visible = True
          OnCheckDrawRequiredState = ENG_edONA_IDENTIFCheckDrawRequiredState
        end
        object ENG_edON_IDENTIF: TDBEditEh
          Left = 191
          Top = 128
          Width = 145
          Height = 26
          CharCase = ecUpperCase
          DataField = 'ON_IDENTIF'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          MRUList.Rows = 10
          ParentFont = False
          TabOrder = 4
          Visible = True
          OnCheckDrawRequiredState = ENG_edON_IDENTIFCheckDrawRequiredState
        end
        object N_F_cbBelorus: TDBCheckBoxEh
          Left = 829
          Top = -2
          Width = 48
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
          TabOrder = 62
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = N_F_cbBelorusClick
        end
        object edON_M_RNGOROD: TDBLookupComboboxEh
          Left = 191
          Top = 462
          Width = 126
          Height = 26
          DataField = 'ON_M_RNGOROD'
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
          TabOrder = 19
          Visible = True
          OnUpdateData = edON_M_GOSUDUpdateData
        end
        object edONA_M_RNGOROD: TDBLookupComboboxEh
          Left = 543
          Top = 462
          Width = 126
          Height = 26
          DataField = 'ONA_M_RNGOROD'
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
          TabOrder = 44
          Visible = True
          OnUpdateData = edONA_M_GOSUDUpdateData
        end
        object edON_M_DOM: TDBEditEh
          Left = 191
          Top = 489
          Width = 40
          Height = 26
          DataField = 'ON_M_DOM'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 21
          Visible = True
        end
        object edON_M_KORP: TDBEditEh
          Left = 276
          Top = 489
          Width = 40
          Height = 26
          DataField = 'ON_M_KORP'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 22
          Visible = True
        end
        object edON_M_KV: TDBEditEh
          Left = 353
          Top = 489
          Width = 40
          Height = 26
          DataField = 'ON_M_KV'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 23
          Visible = True
        end
        object edONA_M_DOM: TDBEditEh
          Left = 543
          Top = 489
          Width = 40
          Height = 26
          DataField = 'ONA_M_DOM'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 46
          Visible = True
        end
        object edONA_M_KORP: TDBEditEh
          Left = 628
          Top = 489
          Width = 40
          Height = 26
          DataField = 'ONA_M_KORP'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 47
          Visible = True
        end
        object edONA_M_KV: TDBEditEh
          Left = 705
          Top = 489
          Width = 40
          Height = 26
          DataField = 'ONA_M_KV'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 48
          Visible = True
        end
        object edON_OBL_R: TDBEditEh
          Left = 191
          Top = 214
          Width = 259
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'ON_OBL'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edON_RAION_R: TDBEditEh
          Left = 191
          Top = 241
          Width = 259
          Height = 26
          DataField = 'ON_RAION'
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
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edONA_OBL_R: TDBEditEh
          Left = 543
          Top = 214
          Width = 259
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'ONA_OBL'
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
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edONA_RAION_R: TDBEditEh
          Left = 543
          Top = 241
          Width = 259
          Height = 26
          DataField = 'ONA_RAION'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 34
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edON_M_OBL: TDBEditEh
          Left = 191
          Top = 381
          Width = 259
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'ON_M_OBL'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          Visible = True
          OnUpdateData = edON_M_GOSUDUpdateData
        end
        object edON_M_RAION: TDBEditEh
          Left = 191
          Top = 408
          Width = 259
          Height = 26
          DataField = 'ON_M_RAION'
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
          OnUpdateData = edON_M_GOSUDUpdateData
        end
        object edONA_M_OBL: TDBEditEh
          Left = 543
          Top = 381
          Width = 259
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'ONA_M_OBL'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 40
          Visible = True
          OnUpdateData = edONA_M_GOSUDUpdateData
        end
        object edONA_M_RAION: TDBEditEh
          Left = 543
          Top = 408
          Width = 259
          Height = 26
          DataField = 'ONA_M_RAION'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 41
          Visible = True
          OnUpdateData = edONA_M_GOSUDUpdateData
        end
        object BLR_edON_FamiliaP: TDBEditEh
          Left = 346
          Top = 46
          Width = 145
          Height = 26
          DataField = 'ON_FamiliaP_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 55
          Visible = True
        end
        object BLR_edON_Name: TDBEditEh
          Left = 346
          Top = 73
          Width = 145
          Height = 26
          DataField = 'ON_Name_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 56
          Visible = True
        end
        object BLR_edON_Otch: TDBEditEh
          Left = 346
          Top = 100
          Width = 145
          Height = 26
          DataField = 'ON_Otch_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 57
          Visible = True
        end
        object BLR_edON_Familia: TDBEditEh
          Left = 346
          Top = 19
          Width = 145
          Height = 26
          DataField = 'ON_Familia_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 54
          Visible = True
        end
        object BLR_edONA_FamiliaP: TDBEditEh
          Left = 699
          Top = 46
          Width = 145
          Height = 26
          DataField = 'ONA_FamiliaP_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 59
          Visible = True
        end
        object BLR_edONA_Name: TDBEditEh
          Left = 699
          Top = 73
          Width = 145
          Height = 26
          DataField = 'ONA_Name_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 60
          Visible = True
        end
        object BLR_edONA_Otch: TDBEditEh
          Left = 699
          Top = 100
          Width = 145
          Height = 26
          HelpType = htKeyword
          HelpContext = 999
          DataField = 'ONA_Otch_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 61
          Visible = True
        end
        object BLR_edONA_Familia: TDBEditEh
          Left = 699
          Top = 19
          Width = 145
          Height = 26
          DataField = 'ONA_Familia_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 58
          Visible = True
        end
        object edON_SOATO: TDBEditEh
          Left = 191
          Top = 516
          Width = 100
          Height = 26
          TabStop = False
          Color = clInfoBk
          DataField = 'ON_SOATO'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 66
          Visible = True
          OnClick = edON_SOATOClick
          OnDblClick = edON_SOATOClick
        end
        object edONA_SOATO: TDBEditEh
          Left = 543
          Top = 516
          Width = 100
          Height = 26
          TabStop = False
          Color = clInfoBk
          DataField = 'ONA_SOATO'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 67
          Visible = True
          OnClick = edONA_SOATOClick
          OnDblClick = edONA_SOATOClick
        end
      end
      object tsTail2: TTabSheet
        Caption = #1063#1072#1089#1090#1100' 2'
        ImageIndex = 1
        DesignSize = (
          880
          585)
        object Label24: TLabel
          Left = 8
          Top = 48
          Width = 158
          Height = 13
          Caption = '12. '#1042' '#1082#1072#1082#1086#1084' '#1087#1086' '#1089#1095#1077#1090#1091' '#1073#1088#1072#1082#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label25: TLabel
          Left = 352
          Top = 1
          Width = 16
          Height = 13
          Caption = #1054#1053
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 630
          Top = 1
          Width = 24
          Height = 13
          Caption = #1054#1053#1040
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 8
          Top = 106
          Width = 107
          Height = 39
          Caption = '17. '#1044#1086#1082#1091#1084#1077#1085#1090' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1080#1081' '#1083#1080#1095#1085#1086#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label32: TLabel
          Left = 9
          Top = 436
          Width = 71
          Height = 13
          Caption = '20. '#1054#1090#1084#1077#1090#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 8
          Top = 389
          Width = 111
          Height = 13
          Caption = '19. C'#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label55: TLabel
          Left = 276
          Top = 387
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
        object Label33: TLabel
          Left = 8
          Top = 187
          Width = 198
          Height = 13
          Caption = '13. '#1056#1072#1089#1090#1086#1088#1075#1072#1077#1084#1099#1081' '#1073#1088#1072#1082' '#1079#1072#1082#1083#1102#1095#1077#1085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 8
          Top = 214
          Width = 17
          Height = 13
          Caption = '15.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label36: TLabel
          Left = 8
          Top = 74
          Width = 169
          Height = 31
          AutoSize = False
          Caption = '16. '#1054#1090#1084#1077#1090#1082#1072' '#1086#1073' '#1091#1087#1083#1072#1090#1077' '#1087#1086#1096#1083#1080#1085#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label38: TLabel
          Left = 619
          Top = 387
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
        object Label39: TLabel
          Left = 728
          Top = 387
          Width = 13
          Height = 16
          Caption = #1086#1090
        end
        object Label29: TLabel
          Left = 386
          Top = 387
          Width = 13
          Height = 16
          Caption = #1086#1090
        end
        object Label42: TLabel
          Left = 17
          Top = 539
          Width = 63
          Height = 13
          Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label69: TLabel
          Left = 378
          Top = 130
          Width = 13
          Height = 16
          Caption = #1086#1090
        end
        object Label70: TLabel
          Left = 720
          Top = 130
          Width = 13
          Height = 16
          Caption = #1086#1090
        end
        object lbSud_Date: TLabel
          Left = 658
          Top = 212
          Width = 13
          Height = 16
          Caption = #1086#1090
        end
        object Label16: TLabel
          Left = 8
          Top = 19
          Width = 96
          Height = 13
          Caption = '11. '#1054#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 533
          Top = 185
          Width = 41
          Height = 16
          Caption = #1079'/'#1072'  '#8470
        end
        object Label52: TLabel
          Left = 658
          Top = 185
          Width = 13
          Height = 16
          Caption = #1086#1090
        end
        object Label53: TLabel
          Left = 8
          Top = 362
          Width = 69
          Height = 13
          Caption = '18. '#1055#1086#1076#1087#1080#1089#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 8
          Top = 416
          Width = 64
          Height = 13
          Caption = #1042#1086#1077#1085#1082#1086#1084#1072#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbSudSila: TLabel
          Left = 259
          Top = 240
          Width = 171
          Height = 16
          Caption = #1074#1089#1090#1091#1087#1080#1074#1096#1077#1077' '#1074' '#1079#1072#1082#1086#1085#1085#1091#1102' '#1089#1080#1083#1091
        end
        object lbDolgRuk: TvchDBText
          Left = 11
          Top = 483
          Width = 623
          Height = 17
          Alignment = taRightJustify
          Anchors = [akLeft, akTop, akRight]
          DataField = 'RUKOV_D'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbDolgSpec: TvchDBText
          Left = 11
          Top = 512
          Width = 623
          Height = 17
          Alignment = taRightJustify
          Anchors = [akLeft, akTop, akRight]
          DataField = 'SPEC_D'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edOTMETKA: TDBEditEh
          Left = 128
          Top = 436
          Width = 743
          Height = 39
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          DataField = 'OTMETKA'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 38
          Visible = True
          WantReturns = True
          OnDblClick = TBItemEditMemoClick
        end
        object edRukov: TDBEditEh
          Left = 641
          Top = 478
          Width = 230
          Height = 26
          Anchors = [akTop, akRight]
          DataField = 'RUKOV'
          DataSource = dsDokument
          EditButtons = <
            item
              Hint = #1042#1099#1073#1088#1072#1090#1100
              Style = ebsEllipsisEh
              OnClick = edRukovEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 39
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edRukovEnter
        end
        object edSpec: TDBEditEh
          Left = 641
          Top = 507
          Width = 230
          Height = 26
          Anchors = [akTop, akRight]
          DataField = 'SPEC'
          DataSource = dsDokument
          EditButtons = <
            item
              Hint = #1042#1099#1073#1088#1072#1090#1100
              Style = ebsEllipsisEh
              OnClick = edSpecEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 40
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edSpecEnter
        end
        object edON_Svid_Nomer: TDBEditEh
          Left = 296
          Top = 382
          Width = 83
          Height = 26
          DataField = 'ON_SVID_NOMER'
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
        object edONA_SVID_DATE: TDBDateTimeEditEh
          Left = 750
          Top = 382
          Width = 100
          Height = 26
          DataField = 'ONA_SVID_DATE'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 35
          Visible = True
          OnEnter = edONA_SVID_DATEEnter
        end
        object edON_SEM: TDBNumberEditEh
          Left = 205
          Top = 43
          Width = 35
          Height = 26
          DataField = 'ON_SEM'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxValue = 100.000000000000000000
          MinValue = 1.000000000000000000
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object edONA_SEM: TDBNumberEditEh
          Left = 549
          Top = 43
          Width = 35
          Height = 26
          DataField = 'ONA_SEM'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxValue = 100.000000000000000000
          MinValue = 1.000000000000000000
          ParentFont = False
          TabOrder = 10
          Visible = True
        end
        object edBrak: TDBEditEh
          Left = 222
          Top = 180
          Width = 296
          Height = 26
          DataField = 'BRAK_ZAKL'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edSUD_NAME: TDBEditEh
          Left = 258
          Top = 207
          Width = 386
          Height = 26
          DataField = 'SUD_NAME'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 22
          Visible = True
        end
        object edSUD_DATE: TDBDateTimeEditEh
          Left = 682
          Top = 207
          Width = 100
          Height = 26
          DataField = 'SUD_DATE'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 23
          Visible = True
        end
        object edON_POSHLINA: TDBEditEh
          Left = 284
          Top = 70
          Width = 214
          Height = 26
          Hint = #1050#1074#1080#1090#1072#1085#1094#1080#1103
          DataField = 'ON_POSHLINA'
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
        object edONA_POSHLINA: TDBEditEh
          Left = 624
          Top = 70
          Width = 213
          Height = 26
          Hint = #1050#1074#1080#1090#1072#1085#1094#1080#1103
          DataField = 'ONA_POSHLINA'
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
        object edONA_SVID_NOMER: TDBEditEh
          Left = 635
          Top = 382
          Width = 83
          Height = 26
          DataField = 'ONA_SVID_NOMER'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 34
          Visible = True
        end
        object edON_SVID_DATE: TDBDateTimeEditEh
          Left = 405
          Top = 382
          Width = 100
          Height = 26
          DataField = 'ON_SVID_DATE'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 29
          Visible = True
          OnEnter = edON_SVID_DATEEnter
        end
        object edIzmen: TDBEditEh
          Left = 128
          Top = 537
          Width = 743
          Height = 45
          HelpType = htKeyword
          HelpContext = 999
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          DataField = 'IZMEN'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 41
          Visible = True
          WantReturns = True
          OnDblClick = TBItemEditMemoClick
        end
        object N_F_edCopy: TDBCheckBoxEh
          Left = 17
          Top = 564
          Width = 97
          Height = 17
          Anchors = [akLeft, akBottom]
          Caption = #1050#1086#1087#1080#1103
          DataField = 'COPIA'
          DataSource = dsDokument
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 42
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edON_SVID_SERIA: TDBLookupComboboxEh
          Left = 205
          Top = 382
          Width = 63
          Height = 26
          DataField = 'ON_SVID_SERIA'
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
          TabOrder = 27
          Visible = True
        end
        object edONA_SVID_SERIA: TDBLookupComboboxEh
          Left = 549
          Top = 382
          Width = 64
          Height = 26
          DataField = 'ONA_SVID_SERIA'
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
          TabOrder = 33
          Visible = True
        end
        object edON_DOKUMENT: TDBEditEh
          Left = 205
          Top = 152
          Width = 293
          Height = 26
          DataField = 'ON_DOKUMENT'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Visible = True
        end
        object edONA_DOKUMENT: TDBEditEh
          Left = 549
          Top = 152
          Width = 293
          Height = 26
          DataField = 'ONA_DOKUMENT'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          Visible = True
        end
        object edON_DOK_TYPE: TDBComboBoxEh
          Left = 205
          Top = 98
          Width = 293
          Height = 26
          DataField = 'ON_DOK_TYPE'
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
        object edON_DOK_SERIA: TDBEditEh
          Left = 205
          Top = 125
          Width = 54
          Height = 26
          CharCase = ecUpperCase
          DataField = 'ON_DOK_SERIA'
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
        object edON_DOK_NOMER: TDBEditEh
          Left = 271
          Top = 125
          Width = 99
          Height = 26
          DataField = 'ON_DOK_NOMER'
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
        object edON_DOK_DATE: TDBDateTimeEditEh
          Left = 398
          Top = 126
          Width = 100
          Height = 26
          DataField = 'ON_DOK_DATE'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 7
          Visible = True
        end
        object edONA_DOK_SERIA: TDBEditEh
          Left = 549
          Top = 125
          Width = 54
          Height = 26
          CharCase = ecUpperCase
          DataField = 'ONA_DOK_SERIA'
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
        object edONA_DOK_TYPE: TDBComboBoxEh
          Left = 549
          Top = 98
          Width = 293
          Height = 26
          DataField = 'ONA_DOK_TYPE'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          Visible = True
        end
        object edONA_DOK_NOMER: TDBEditEh
          Left = 613
          Top = 125
          Width = 99
          Height = 26
          DataField = 'ONA_DOK_NOMER'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          Visible = True
        end
        object edONA_DOK_DATE: TDBDateTimeEditEh
          Left = 742
          Top = 125
          Width = 100
          Height = 26
          DataField = 'ONA_DOK_DATE'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 16
          Visible = True
        end
        object edON_OBRAZ: TDBComboBoxEh
          Left = 205
          Top = 16
          Width = 293
          Height = 26
          HelpContext = 888
          DataField = 'ON_OBRAZ'
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
        object edONA_OBRAZ: TDBComboBoxEh
          Left = 549
          Top = 16
          Width = 301
          Height = 26
          DataField = 'ONA_OBRAZ'
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
        object edON_SumPoshlina: TDBNumberEditEh
          Left = 205
          Top = 70
          Width = 65
          Height = 26
          Hint = #1057#1091#1084#1084#1072' '#1087#1086#1096#1083#1080#1085#1099
          DataField = 'ON_SUM_POSHLINA'
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
        object edONA_SumPoshlina: TDBNumberEditEh
          Left = 549
          Top = 70
          Width = 65
          Height = 26
          Hint = #1057#1091#1084#1084#1072' '#1087#1086#1096#1083#1080#1085#1099
          DataField = 'ONA_SUM_POSHLINA'
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
        object N_F_edTypeRast: TDBComboBoxEh
          Left = 30
          Top = 211
          Width = 216
          Height = 21
          DataField = 'TYPE_RAST'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Flat = True
          ParentFont = False
          TabOrder = 21
          Visible = True
          OnChange = N_F_edTypeRastChange
        end
        object edBrakDate: TDBDateTimeEditEh
          Left = 682
          Top = 180
          Width = 100
          Height = 26
          DataField = 'BRAK_DATE'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 20
          Visible = True
        end
        object btSeek: TBitBtn
          Left = 792
          Top = 183
          Width = 25
          Height = 21
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1082#1090#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100' '#1086' '#1073#1088#1072#1082#1077' '#1087#1086' '#1085#1086#1084#1077#1088#1091' '#1080' '#1076#1072#1090#1077
          TabOrder = 43
          Visible = False
          OnClick = btSeekClick
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00008400000084000000840000008400000084
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000084000000840000008400000084000000840000008400000084
            00000084000000840000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00008400000084000000840000008400000084000000840000008400000084
            0000008400000084000000840000FF00FF00FF00FF00FF00FF00FF00FF000084
            0000008400000084000000840000008400000084000000840000008400000084
            000000840000008400000084000000840000FF00FF00FF00FF00FF00FF000084
            000000840000008400000084000000840000FFFFFF0000840000008400000084
            000000840000008400000084000000840000FF00FF00FF00FF00008400000084
            000000840000008400000084000000840000FFFFFF00FFFFFF00008400000084
            00000084000000840000008400000084000000840000FF00FF00008400000084
            000000840000008400000084000000840000FFFFFF00FFFFFF00FFFFFF000084
            00000084000000840000008400000084000000840000FF00FF00008400000084
            000000840000008400000084000000840000FFFFFF00FFFFFF00FFFFFF00FFFF
            FF000084000000840000008400000084000000840000FF00FF00008400000084
            000000840000008400000084000000840000FFFFFF00FFFFFF00FFFFFF000084
            00000084000000840000008400000084000000840000FF00FF00008400000084
            000000840000008400000084000000840000FFFFFF00FFFFFF00008400000084
            00000084000000840000008400000084000000840000FF00FF00FF00FF000084
            000000840000008400000084000000840000FFFFFF0000840000008400000084
            000000840000008400000084000000840000FF00FF00FF00FF00FF00FF000084
            0000008400000084000000840000008400000084000000840000008400000084
            000000840000008400000084000000840000FF00FF00FF00FF00FF00FF00FF00
            FF00008400000084000000840000008400000084000000840000008400000084
            0000008400000084000000840000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000084000000840000008400000084000000840000008400000084
            00000084000000840000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00008400000084000000840000008400000084
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object pnDeti: TPanel
          Left = 0
          Top = 260
          Width = 879
          Height = 89
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          TabOrder = 25
          object gbDeti: TGroupBox
            Left = 0
            Top = 0
            Width = 838
            Height = 89
            Align = alClient
            Caption = ' 14. '#1054#1073#1097#1080#1077' '#1076#1077#1090#1080' '#1085#1077' '#1076#1086#1089#1090#1080#1075#1096#1080#1077' 18 '#1083#1077#1090' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object GridDeti: TDBGridEh
              Left = 2
              Top = 15
              Width = 834
              Height = 72
              Align = alClient
              DataSource = dsDeti
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
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'FAMILIA'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #1060#1072#1084#1080#1083#1080#1103
                  Width = 178
                end
                item
                  EditButtons = <>
                  FieldName = 'NAME'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #1048#1084#1103
                  Width = 148
                end
                item
                  EditButtons = <>
                  FieldName = 'OTCH'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
                  Width = 144
                end
                item
                  EditButtons = <>
                  FieldName = 'GOD_ROG'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #1043#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
                  Width = 88
                end>
            end
          end
          object Panel2: TPanel
            Left = 838
            Top = 0
            Width = 41
            Height = 89
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
              Top = 9
              Width = 28
              Height = 28
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100
              TabOrder = 0
              TabStop = False
              OnClick = btAddChildClick
            end
            object btDelChild: TBitBtn
              Left = 6
              Top = 42
              Width = 28
              Height = 28
              Hint = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 1
              TabStop = False
              OnClick = btDelChildClick
            end
          end
        end
        object btRazdel: TButton
          Left = 93
          Top = 457
          Width = 24
          Height = 17
          Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100
          Caption = '#'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 44
          TabStop = False
          OnClick = btRazdelClick
        end
        object edOnPodpis: TDBEditEh
          Left = 205
          Top = 355
          Width = 301
          Height = 26
          DataField = 'ON_PODPIS'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 26
          Visible = True
        end
        object edOnaPodpis: TDBEditEh
          Left = 549
          Top = 355
          Width = 301
          Height = 26
          DataField = 'ONA_PODPIS'
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
        object cbON_VUS: TDBCheckBoxEh
          Left = 205
          Top = 414
          Width = 17
          Height = 17
          Hint = #1042#1086#1077#1085#1085#1086#1086#1073#1103#1079#1072#1085#1085#1099#1081
          DataField = 'ON_VUS'
          DataSource = dsDokument
          TabOrder = 30
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edON_Voenkom: TDBLookupComboboxEh
          Left = 226
          Top = 409
          Width = 279
          Height = 26
          DataField = 'ON_VOENKOM'
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
              OnClick = edON_VoenkomEditButtons0Click
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
              OnClick = edON_VoenkomEditButtons1Click
            end
            item
              Hint = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1087#1086' '#1084#1077#1089#1090#1091' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
              ShortCut = 45
              Style = ebsPlusEh
              OnClick = edON_VoenkomEditButtons2Click
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
          TabOrder = 31
          Visible = True
          OnChange = edON_VoenkomChange
        end
        object cbONA_VUS: TDBCheckBoxEh
          Left = 549
          Top = 414
          Width = 17
          Height = 17
          Hint = #1042#1086#1077#1085#1085#1086#1086#1073#1103#1079#1072#1085#1085#1072#1103
          DataField = 'ONA_VUS'
          DataSource = dsDokument
          TabOrder = 36
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edONA_VOENKOM: TDBLookupComboboxEh
          Left = 574
          Top = 409
          Width = 276
          Height = 26
          DataField = 'ONA_VOENKOM'
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
              OnClick = edONA_VOENKOMEditButtons0Click
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
              OnClick = edONA_VOENKOMEditButtons1Click
            end
            item
              Hint = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1087#1086' '#1084#1077#1089#1090#1091' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
              ShortCut = 45
              Style = ebsPlusEh
              OnClick = edONA_VOENKOMEditButtons2Click
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
          TabOrder = 37
          Visible = True
          OnChange = edONA_VOENKOMChange
        end
        object edSudSila: TDBDateTimeEditEh
          Left = 440
          Top = 235
          Width = 100
          Height = 26
          DataField = 'SUD_SILA'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 24
          Visible = True
        end
        object edBrakNomer: TDBEditEh
          Left = 576
          Top = 180
          Width = 73
          Height = 26
          DataField = 'BRAK_NOMER'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          Visible = True
        end
      end
      object tsSprav: TTabSheet
        Caption = #1040#1088#1093#1080#1074#1085#1072#1103' '#1089#1087#1088#1072#1074#1082#1072
        ImageIndex = 2
        object Label43: TLabel
          Left = 16
          Top = 39
          Width = 48
          Height = 16
          Caption = #1040#1076#1088#1077#1089#1072#1090
        end
        object Label44: TLabel
          Left = 16
          Top = 123
          Width = 37
          Height = 16
          Caption = #1053#1086#1084#1077#1088
        end
        object Label45: TLabel
          Left = 16
          Top = 152
          Width = 29
          Height = 16
          Caption = #1044#1072#1090#1072
        end
        object Label46: TLabel
          Left = 16
          Top = 188
          Width = 136
          Height = 16
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1090#1077#1082#1089#1090
        end
        object edAdresat: TDBEditEh
          Left = 72
          Top = 36
          Width = 684
          Height = 73
          HelpContext = 888
          AutoSelect = False
          AutoSize = False
          DataField = 'ARX_ADRESAT'
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
          WordWrap = True
        end
        object edNomerArxSpr: TDBEditEh
          Left = 72
          Top = 119
          Width = 121
          Height = 26
          DataField = 'ARX_NOMER'
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
        object edDateArxSpr: TDBDateTimeEditEh
          Left = 72
          Top = 148
          Width = 121
          Height = 26
          DataField = 'ARX_DATE'
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
        object edAddTextArx: TDBEditEh
          Left = 19
          Top = 207
          Width = 734
          Height = 97
          HelpContext = 999
          AutoSelect = False
          AutoSize = False
          DataField = 'ARX_TEXT'
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
          WantReturns = True
          WordWrap = True
          OnDblClick = TBItemEditMemoClick
        end
      end
      object tsSvid: TTabSheet
        Caption = #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086
        ImageIndex = 4
        DesignSize = (
          880
          585)
        object Label77: TLabel
          Left = 12
          Top = 30
          Width = 158
          Height = 13
          Caption = #1041#1088#1072#1082' '#1084#1077#1078#1076#1091' '#1075#1088#1072#1078#1076#1072#1085#1080#1085#1086#1084
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label76: TLabel
          Left = 394
          Top = 30
          Width = 167
          Height = 13
          Caption = #1064#1083#1102#1073' '#1087#1072#1084'i'#1078' '#1075#1088#1072#1084#1072#1076#1079#1103#1085'i'#1085#1072#1084
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbVidON: TLabel
          Left = 12
          Top = 313
          Width = 218
          Height = 13
          Caption = #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086' '#1074#1099#1076#1072#1085#1086' '#1075#1088#1072#1078#1076#1072#1085#1080#1085#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbVidON_B: TLabel
          Left = 394
          Top = 313
          Width = 235
          Height = 13
          Caption = #1055#1072#1089#1074#1077#1076#1095#1072#1085#1085#1077' '#1074#1099#1076#1072#1076#1079#1077#1085#1072' '#1075#1088#1072#1084#1072#1076#1079#1103#1085'i'#1085#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label62: TLabel
          Left = 235
          Top = 218
          Width = 290
          Height = 13
          AutoSize = False
          Caption = #1055#1086#1089#1083#1077' '#1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1103' '#1073#1088#1072#1082#1072' '#1087#1088#1080#1089#1074#1086#1077#1085#1099' '#1092#1072#1084#1080#1083#1080#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label63: TLabel
          Left = 33
          Top = 253
          Width = 22
          Height = 13
          Caption = #1077#1084#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label64: TLabel
          Left = 33
          Top = 282
          Width = 13
          Height = 13
          Caption = #1077#1081
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label65: TLabel
          Left = 10
          Top = 500
          Width = 160
          Height = 13
          Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100' '#1086#1088#1075#1072#1085#1072' '#1047#1040#1043#1057
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbVidONA: TLabel
          Left = 12
          Top = 394
          Width = 212
          Height = 13
          Caption = #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086' '#1074#1099#1076#1072#1085#1086' '#1075#1088#1072#1078#1076#1072#1085#1082#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbVidONA_B: TLabel
          Left = 394
          Top = 394
          Width = 236
          Height = 13
          Caption = #1055#1072#1089#1074#1077#1076#1095#1072#1085#1085#1077' '#1074#1099#1076#1072#1076#1079#1077#1085#1072' '#1075#1088#1072#1084#1072#1076#1079#1103#1085#1094#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label50: TLabel
          Left = 12
          Top = 119
          Width = 83
          Height = 13
          Caption = #1080' '#1075#1088#1072#1078#1076#1072#1085#1082#1086#1081
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label51: TLabel
          Left = 394
          Top = 119
          Width = 90
          Height = 13
          Caption = 'i '#1075#1088#1072#1084#1072#1076#1079#1103#1085#1082#1072#1081
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbINON: TLabel
          Left = 335
          Top = 86
          Width = 68
          Height = 13
          Caption = #1080#1076#1077#1085#1090'. '#1085#1086#1084#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object lbDateRON: TLabel
          Left = 32
          Top = 86
          Width = 79
          Height = 13
          Caption = #1076#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object lbINONA: TLabel
          Left = 335
          Top = 176
          Width = 68
          Height = 13
          Caption = #1080#1076#1077#1085#1090'. '#1085#1086#1084#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object lbDateRONA: TLabel
          Left = 32
          Top = 176
          Width = 79
          Height = 13
          Caption = #1076#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object edON_Familia_Sv: TDBEditEh
          Left = 183
          Top = 27
          Width = 155
          Height = 26
          HelpContext = 888
          DataField = 'ON_Familia_P'
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
        object edON_Name_Sv: TDBEditEh
          Left = 16
          Top = 56
          Width = 155
          Height = 26
          DataField = 'ON_Name_P'
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
        object edON_Otch_Sv: TDBEditEh
          Left = 201
          Top = 56
          Width = 155
          Height = 26
          DataField = 'ON_Otch_P'
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
        object edON_FamiliaPD_Sv: TDBEditEh
          Left = 106
          Top = 334
          Width = 155
          Height = 26
          DataField = 'ON_Familia_PD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Visible = True
        end
        object edON_NamePD_Sv: TDBEditEh
          Left = 16
          Top = 363
          Width = 155
          Height = 26
          DataField = 'ON_Name_PD'
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
        object edON_OtchPD_Sv: TDBEditEh
          Left = 199
          Top = 363
          Width = 155
          Height = 26
          DataField = 'ON_Otch_PD'
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
        object edRukov_Sv: TDBEditEh
          Left = 192
          Top = 493
          Width = 209
          Height = 26
          DataField = 'RUKOV'
          DataSource = dsDokument
          EditButtons = <
            item
              Hint = #1042#1099#1073#1088#1072#1090#1100
              Style = ebsEllipsisEh
              OnClick = edRukov_SvEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          Visible = True
        end
        object edON_FamiliaP_Sv: TDBEditEh
          Left = 90
          Top = 248
          Width = 190
          Height = 26
          DataField = 'ON_FamiliaP'
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
        object edONA_FamiliaP_Sv: TDBEditEh
          Left = 90
          Top = 277
          Width = 190
          Height = 26
          DataField = 'ONA_FamiliaP'
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
        object BLR_edON_Familia_B_Sv: TDBEditEh
          Left = 577
          Top = 27
          Width = 155
          Height = 26
          DataField = 'ON_Familia_B_P'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          Visible = True
        end
        object BLR_edON_Name_B_Sv: TDBEditEh
          Left = 419
          Top = 56
          Width = 155
          Height = 26
          DataField = 'ON_Name_B_P'
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
        object BLR_edON_Otch_B_Sv: TDBEditEh
          Left = 604
          Top = 56
          Width = 155
          Height = 26
          DataField = 'ON_Otch_B_P'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          Visible = True
        end
        object BLR_edON_FamiliaPD_B_Sv: TDBEditEh
          Left = 504
          Top = 334
          Width = 155
          Height = 26
          DataField = 'ON_Familia_B_PD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 23
          Visible = True
        end
        object BLR_edON_NamePD_B_Sv: TDBEditEh
          Left = 419
          Top = 363
          Width = 155
          Height = 26
          DataField = 'ON_Name_B_PD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 24
          Visible = True
        end
        object BLR_edON_OtchPD_B_Sv: TDBEditEh
          Left = 602
          Top = 362
          Width = 155
          Height = 26
          DataField = 'ON_Otch_B_PD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 25
          Visible = True
        end
        object BLR_edON_FamiliaP_B_Sv: TDBEditEh
          Left = 420
          Top = 248
          Width = 190
          Height = 26
          DataField = 'ON_FamiliaP_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 21
          Visible = True
        end
        object BLR_edONA_FamiliaP_B_Sv: TDBEditEh
          Left = 420
          Top = 277
          Width = 190
          Height = 26
          DataField = 'ONA_FamiliaP_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 22
          Visible = True
        end
        object BLR_edRukov_Sv_B: TDBEditEh
          Left = 427
          Top = 493
          Width = 209
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
          TabOrder = 29
          Visible = True
        end
        object edONA_FamiliaPD_Sv: TDBEditEh
          Left = 106
          Top = 415
          Width = 155
          Height = 26
          DataField = 'ONA_Familia_PD'
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
        object edONA_NamePD_Sv: TDBEditEh
          Left = 16
          Top = 444
          Width = 155
          Height = 26
          DataField = 'ONA_Name_PD'
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
        object edONA_OtchPD_Sv: TDBEditEh
          Left = 199
          Top = 444
          Width = 155
          Height = 26
          DataField = 'ONA_Otch_PD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          Visible = True
        end
        object BLR_edONA_NamePD_B_Sv: TDBEditEh
          Left = 419
          Top = 444
          Width = 155
          Height = 26
          DataField = 'ONA_Name_B_PD'
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
        object BLR_edONA_FamiliaPD_B_Sv: TDBEditEh
          Left = 504
          Top = 415
          Width = 155
          Height = 26
          DataField = 'ONA_Familia_B_PD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 26
          Visible = True
        end
        object BLR_edONA_OtchPD_B_Sv: TDBEditEh
          Left = 594
          Top = 444
          Width = 155
          Height = 26
          DataField = 'ONA_Otch_B_PD'
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
        object edONA_Familia_Sv: TDBEditEh
          Left = 168
          Top = 117
          Width = 155
          Height = 26
          DataField = 'ONA_Familia_P'
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
        object edONA_Name_Sv: TDBEditEh
          Left = 16
          Top = 146
          Width = 155
          Height = 26
          DataField = 'ONA_Name_P'
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
        object edONA_Otch_Sv: TDBEditEh
          Left = 201
          Top = 146
          Width = 155
          Height = 26
          DataField = 'ONA_Otch_P'
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
        object BLR_edONA_Familia_B_Sv: TDBEditEh
          Left = 577
          Top = 117
          Width = 155
          Height = 26
          DataField = 'ONA_Familia_B_P'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
          Visible = True
        end
        object BLR_edONA_Name_B_Sv: TDBEditEh
          Left = 419
          Top = 146
          Width = 155
          Height = 26
          DataField = 'ONA_Name_B_P'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          Visible = True
        end
        object BLR_edONA_Otch_B_Sv: TDBEditEh
          Left = 604
          Top = 146
          Width = 155
          Height = 26
          DataField = 'ONA_Otch_B_P'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
          Visible = True
        end
        object N_F_cbPovtor: TDBCheckBoxEh
          Left = 764
          Top = 5
          Width = 99
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1055#1054#1042#1058#1054#1056#1053#1054#1045
          Color = clBtnFace
          DataField = 'POVTOR'
          DataSource = dsDokument
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 30
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = N_F_cbPovtorClick
        end
      end
      object tsPovtor: TTabSheet
        Caption = #1055#1086#1074#1090#1086#1088#1085#1099#1077' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072
        ImageIndex = 3
      end
    end
    object pnMain: TPanel
      Left = 0
      Top = 0
      Width = 888
      Height = 34
      Align = alTop
      TabOrder = 0
      DesignSize = (
        888
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
        Left = 121
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
        Left = 859
        Top = 6
        Width = 20
        Height = 20
        Anchors = [akTop, akRight]
        Transparent = True
      end
      object lbSvid: TLabel
        Left = 270
        Top = 11
        Width = 91
        Height = 13
        Caption = 'C'#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lbSvid2: TLabel
        Left = 451
        Top = 9
        Width = 15
        Height = 16
        Caption = #8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lbSvid3: TLabel
        Left = 558
        Top = 11
        Width = 12
        Height = 13
        Caption = #1086#1090
        Visible = False
      end
      object edNomer: TDBEditEh
        Left = 55
        Top = 4
        Width = 55
        Height = 26
        HelpType = htKeyword
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
        Left = 144
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
      end
      object N_F_1: TDBCheckBoxEh
        Left = 691
        Top = 5
        Width = 109
        Height = 17
        Caption = '1-'#1099#1081' '#1101#1082#1079#1077#1084#1087#1083#1103#1088
        DataField = 'First_Ekz'
        DataSource = dsDokument
        TabOrder = 2
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object edSVID_SERIA: TDBLookupComboboxEh
        Left = 372
        Top = 4
        Width = 67
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
        TabOrder = 3
        Visible = False
      end
      object edSvid_Nomer: TDBEditEh
        Left = 472
        Top = 4
        Width = 78
        Height = 26
        DataField = 'SVID_NOMER'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Visible = False
      end
      object edDateSV: TDBDateTimeEditEh
        Left = 578
        Top = 4
        Width = 100
        Height = 26
        DataField = 'DATESV'
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
        Visible = False
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 703
    Width = 888
  end
  inherited pnAdd: TPanel
    Top = 29
    Width = 888
  end
  inherited dsDokument: TDataSource
    Left = 416
    Top = 394
  end
  object dsDeti: TDataSource [8]
    DataSet = tbDeti
    OnDataChange = dsDetiDataChange
    Left = 688
    Top = 413
  end
  object tbDeti: TkbmMemTable [9]
    Active = True
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
    Left = 656
    Top = 413
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
    object tbDetiGOD_ROG: TIntegerField
      FieldName = 'GOD_ROG'
    end
  end
  object dsNation: TDataSource [10]
    DataSet = dmBase.SprNac
    Left = 395
    Top = 289
  end
  object dsStran: TDataSource [11]
    DataSet = dmBase.SprStran
    Left = 427
    Top = 289
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
        Name = 'DateIzm'
        DataType = ftDate
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
        Name = 'ON_SVID_SERIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ON_SVID_NOMER'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ON_SVID_DATE'
        DataType = ftDate
      end
      item
        Name = 'ONA_SVID_SERIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ONA_SVID_NOMER'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ONA_SVID_DATE'
        DataType = ftDate
      end
      item
        Name = 'ON_Familia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ON_FamiliaP'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ON_Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_Otch'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_DateR'
        DataType = ftDate
      end
      item
        Name = 'ON_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'ON_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_NATION'
        DataType = ftInteger
      end
      item
        Name = 'ON_GRAG'
        DataType = ftInteger
      end
      item
        Name = 'ON_WORK'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ON_OBRAZ'
        DataType = ftInteger
      end
      item
        Name = 'ON_M_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'ON_M_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_M_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_M_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_M_GOROD_R'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'ON_POSHLINA'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'ON_SEM'
        DataType = ftInteger
      end
      item
        Name = 'ON_DOKUMENT'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'OTMETKA'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ONA_Familia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_FamiliaP'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Otch'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_DateR'
        DataType = ftDate
      end
      item
        Name = 'ONA_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'ONA_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_NATION'
        DataType = ftInteger
      end
      item
        Name = 'ONA_GRAG'
        DataType = ftInteger
      end
      item
        Name = 'ONA_WORK'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ONA_OBRAZ'
        DataType = ftInteger
      end
      item
        Name = 'ONA_M_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'ONA_M_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_M_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_M_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_M_GOROD_R'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_SEM'
        DataType = ftInteger
      end
      item
        Name = 'ONA_DOKUMENT'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'DETI'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ON_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'ON_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'ON_M_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'ON_M_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'ONA_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'ONA_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'ONA_M_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'ONA_M_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'ONA_POSHLINA'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'ON_ID'
        DataType = ftInteger
      end
      item
        Name = 'ONA_ID'
        DataType = ftInteger
      end
      item
        Name = 'RUKOV'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SPEC'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PROV'
        DataType = ftBoolean
      end
      item
        Name = 'ON_Familia_B'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ON_FamiliaP_B'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ON_Name_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_Otch_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Familia_B'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_FamiliaP_B'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_Name_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Otch_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RUKOV_B'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SUD_NAME'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'SUD_DATE'
        DataType = ftDate
      end
      item
        Name = 'BRAK_ZAKL'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'VOSSTAN'
        DataType = ftBoolean
      end
      item
        Name = 'ISPRAV'
        DataType = ftMemo
        Size = 1
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
        Name = 'First_Ekz'
        DataType = ftBoolean
      end
      item
        Name = 'ON_Familia_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ON_Name_P'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_Otch_P'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_Familia_B_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ON_Name_B_P'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_Otch_B_P'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Familia_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_Name_P'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Otch_P'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Familia_B_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_Name_B_P'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Otch_B_P'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_Familia_PD'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ON_Name_PD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_Otch_PD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_Familia_B_PD'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ON_Name_B_PD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_Otch_B_PD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Familia_PD'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_Name_PD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Otch_PD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Familia_B_PD'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_Name_B_PD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Otch_B_PD'
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
        Name = 'ARX_TEXT'
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
        Name = 'ON_ONLYGOD'
        DataType = ftBoolean
      end
      item
        Name = 'ONA_ONLYGOD'
        DataType = ftBoolean
      end
      item
        Name = 'ON_VOZR'
        DataType = ftSmallint
      end
      item
        Name = 'ONA_VOZR'
        DataType = ftSmallint
      end
      item
        Name = 'ON_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'ON_M_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'ONA_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'ONA_M_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'ON_STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ONA_STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ON_IDENTIF'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'ONA_IDENTIF'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'POLE_GRN'
        DataType = ftSmallint
      end
      item
        Name = 'TYPEMESSAGE'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ON_DOK_TYPE'
        DataType = ftSmallint
      end
      item
        Name = 'ON_DOK_SERIA'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ON_DOK_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ON_DOK_DATE'
        DataType = ftDate
      end
      item
        Name = 'ON_DOK_ORGAN'
        DataType = ftInteger
      end
      item
        Name = 'ONA_DOK_TYPE'
        DataType = ftSmallint
      end
      item
        Name = 'ONA_DOK_SERIA'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ONA_DOK_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ONA_DOK_DATE'
        DataType = ftDate
      end
      item
        Name = 'ONA_DOK_ORGAN'
        DataType = ftInteger
      end
      item
        Name = 'SPEC_B'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DETI_COUNT'
        DataType = ftSmallint
      end
      item
        Name = 'RN_ON_M_B_GOROD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RN_ON_B_GOROD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RN_ONA_M_B_GOROD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RN_ONA_B_GOROD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ON_M_DOM'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ON_M_KORP'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ON_M_KV'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ONA_M_DOM'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ONA_M_KORP'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ONA_M_KV'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ON_M_RNGOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_M_RNGOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_M_B_RN'
        DataType = ftBoolean
      end
      item
        Name = 'ONA_M_B_RN'
        DataType = ftBoolean
      end
      item
        Name = 'ON_SUM_POSHLINA'
        DataType = ftFloat
      end
      item
        Name = 'ONA_SUM_POSHLINA'
        DataType = ftFloat
      end
      item
        Name = 'TYPE_RAST'
        DataType = ftSmallint
      end
      item
        Name = 'BRAK_ID'
        DataType = ftInteger
      end
      item
        Name = 'BRAK_DATE'
        DataType = ftDate
      end
      item
        Name = 'BRAK_NOMER'
        DataType = ftInteger
      end
      item
        Name = 'ON_SOATO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ONA_SOATO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ON_PODPIS'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ONA_PODPIS'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'DELETE_CRLF'
        DataType = ftBoolean
      end
      item
        Name = 'ON_VUS'
        DataType = ftBoolean
      end
      item
        Name = 'ONA_VUS'
        DataType = ftBoolean
      end
      item
        Name = 'ON_VOENKOM'
        DataType = ftInteger
      end
      item
        Name = 'ONA_VOENKOM'
        DataType = ftInteger
      end>
    Left = 352
    Top = 346
    object DokumentNOMER: TIntegerField [4]
      FieldName = 'NOMER'
    end
    object DokumentDATEZ: TDateField [5]
      FieldName = 'DATEZ'
    end
    object DokumentON_SVID_SERIA: TStringField [6]
      FieldName = 'ON_SVID_SERIA'
      Size = 10
    end
    object DokumentON_SVID_NOMER: TStringField [7]
      FieldName = 'ON_SVID_NOMER'
    end
    object DokumentON_SVID_DATE: TDateField [8]
      FieldName = 'ON_SVID_DATE'
    end
    object DokumentONA_SVID_SERIA: TStringField [9]
      FieldName = 'ONA_SVID_SERIA'
      Size = 10
    end
    object DokumentONA_SVID_NOMER: TStringField [10]
      FieldName = 'ONA_SVID_NOMER'
    end
    object DokumentONA_SVID_DATE: TDateField [11]
      FieldName = 'ONA_SVID_DATE'
    end
    object DokumentON_Familia: TStringField [12]
      FieldName = 'ON_Familia'
      Size = 50
    end
    object DokumentON_FamiliaP: TStringField [13]
      FieldName = 'ON_FamiliaP'
      Size = 50
    end
    object DokumentON_Name: TStringField [14]
      FieldName = 'ON_Name'
      Size = 30
    end
    object DokumentON_Otch: TStringField [15]
      FieldName = 'ON_Otch'
      Size = 30
    end
    object DokumentON_DateR: TDateField [16]
      FieldName = 'ON_DateR'
    end
    object DokumentON_GOSUD: TIntegerField [17]
      FieldName = 'ON_GOSUD'
    end
    object DokumentON_OBL: TStringField [18]
      FieldName = 'ON_OBL'
      Size = 30
    end
    object DokumentON_RAION: TStringField [19]
      FieldName = 'ON_RAION'
      Size = 30
    end
    object DokumentON_GOROD: TStringField [20]
      FieldName = 'ON_GOROD'
      Size = 30
    end
    object DokumentON_NATION: TIntegerField [21]
      FieldName = 'ON_NATION'
    end
    object DokumentON_GRAG: TIntegerField [22]
      FieldName = 'ON_GRAG'
    end
    object DokumentON_WORK: TStringField [23]
      FieldName = 'ON_WORK'
      Size = 100
    end
    object DokumentON_OBRAZ: TIntegerField [24]
      FieldName = 'ON_OBRAZ'
    end
    object DokumentON_M_GOSUD: TIntegerField [25]
      FieldName = 'ON_M_GOSUD'
    end
    object DokumentON_M_OBL: TStringField [26]
      FieldName = 'ON_M_OBL'
      Size = 30
    end
    object DokumentON_M_RAION: TStringField [27]
      FieldName = 'ON_M_RAION'
      Size = 30
    end
    object DokumentON_M_GOROD: TStringField [28]
      FieldName = 'ON_M_GOROD'
      Size = 30
    end
    object DokumentON_M_GOROD_R: TStringField [29]
      FieldName = 'ON_M_GOROD_R'
      Size = 70
    end
    object DokumentON_POSHLINA: TStringField [30]
      FieldName = 'ON_POSHLINA'
      Size = 250
    end
    object DokumentON_SEM: TIntegerField [31]
      FieldName = 'ON_SEM'
    end
    object DokumentON_DOKUMENT: TMemoField [32]
      FieldName = 'ON_DOKUMENT'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentOTMETKA: TMemoField [33]
      FieldName = 'OTMETKA'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentONA_Familia: TStringField [34]
      FieldName = 'ONA_Familia'
      Size = 50
    end
    object DokumentONA_FamiliaP: TStringField [35]
      FieldName = 'ONA_FamiliaP'
      Size = 50
    end
    object DokumentONA_Name: TStringField [36]
      FieldName = 'ONA_Name'
      Size = 30
    end
    object DokumentONA_Otch: TStringField [37]
      FieldName = 'ONA_Otch'
      Size = 30
    end
    object DokumentONA_DateR: TDateField [38]
      FieldName = 'ONA_DateR'
    end
    object DokumentONA_GOSUD: TIntegerField [39]
      FieldName = 'ONA_GOSUD'
    end
    object DokumentONA_OBL: TStringField [40]
      FieldName = 'ONA_OBL'
      Size = 30
    end
    object DokumentONA_RAION: TStringField [41]
      FieldName = 'ONA_RAION'
      Size = 30
    end
    object DokumentONA_GOROD: TStringField [42]
      FieldName = 'ONA_GOROD'
      Size = 30
    end
    object DokumentONA_NATION: TIntegerField [43]
      FieldName = 'ONA_NATION'
    end
    object DokumentONA_GRAG: TIntegerField [44]
      FieldName = 'ONA_GRAG'
    end
    object DokumentONA_WORK: TStringField [45]
      FieldName = 'ONA_WORK'
      Size = 100
    end
    object DokumentONA_OBRAZ: TIntegerField [46]
      FieldName = 'ONA_OBRAZ'
    end
    object DokumentONA_M_GOSUD: TIntegerField [47]
      FieldName = 'ONA_M_GOSUD'
    end
    object DokumentONA_M_OBL: TStringField [48]
      FieldName = 'ONA_M_OBL'
      Size = 30
    end
    object DokumentONA_M_RAION: TStringField [49]
      FieldName = 'ONA_M_RAION'
      Size = 30
    end
    object DokumentONA_M_GOROD: TStringField [50]
      FieldName = 'ONA_M_GOROD'
      Size = 30
    end
    object DokumentONA_M_GOROD_R: TStringField [51]
      FieldName = 'ONA_M_GOROD_R'
      Size = 50
    end
    object DokumentONA_SEM: TIntegerField [52]
      FieldName = 'ONA_SEM'
    end
    object DokumentONA_DOKUMENT: TMemoField [53]
      FieldName = 'ONA_DOKUMENT'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentDETI: TMemoField [54]
      FieldName = 'DETI'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentON_B_RESP: TBooleanField [55]
      FieldName = 'ON_B_RESP'
    end
    object DokumentON_B_OBL: TBooleanField [56]
      FieldName = 'ON_B_OBL'
    end
    object DokumentON_M_B_RESP: TBooleanField [57]
      FieldName = 'ON_M_B_RESP'
    end
    object DokumentON_M_B_OBL: TBooleanField [58]
      FieldName = 'ON_M_B_OBL'
    end
    object DokumentONA_B_RESP: TBooleanField [59]
      FieldName = 'ONA_B_RESP'
    end
    object DokumentONA_B_OBL: TBooleanField [60]
      FieldName = 'ONA_B_OBL'
    end
    object DokumentONA_M_B_RESP: TBooleanField [61]
      FieldName = 'ONA_M_B_RESP'
    end
    object DokumentONA_M_B_OBL: TBooleanField [62]
      FieldName = 'ONA_M_B_OBL'
    end
    object DokumentONA_POSHLINA: TStringField [63]
      FieldName = 'ONA_POSHLINA'
      Size = 250
    end
    object DokumentON_ID: TIntegerField [64]
      FieldName = 'ON_ID'
    end
    object DokumentONA_ID: TIntegerField [65]
      FieldName = 'ONA_ID'
    end
    object DokumentRUKOV: TStringField [66]
      FieldName = 'RUKOV'
      Size = 60
    end
    object DokumentSPEC: TStringField [67]
      FieldName = 'SPEC'
      Size = 60
    end
    object DokumentPROV: TBooleanField [68]
      FieldName = 'PROV'
    end
    object DokumentON_Familia_B: TStringField [69]
      FieldName = 'ON_Familia_B'
      Size = 50
    end
    object DokumentON_FamiliaP_B: TStringField [70]
      FieldName = 'ON_FamiliaP_B'
      Size = 50
    end
    object DokumentON_Name_B: TStringField [71]
      FieldName = 'ON_Name_B'
      Size = 30
    end
    object DokumentON_Otch_B: TStringField [72]
      FieldName = 'ON_Otch_B'
      Size = 30
    end
    object DokumentONA_Familia_B: TStringField [73]
      FieldName = 'ONA_Familia_B'
      Size = 50
    end
    object DokumentONA_FamiliaP_B: TStringField [74]
      FieldName = 'ONA_FamiliaP_B'
      Size = 50
    end
    object DokumentONA_Name_B: TStringField [75]
      FieldName = 'ONA_Name_B'
      Size = 30
    end
    object DokumentONA_Otch_B: TStringField [76]
      FieldName = 'ONA_Otch_B'
      Size = 30
    end
    object DokumentRUKOV_B: TStringField [77]
      FieldName = 'RUKOV_B'
      Size = 60
    end
    object DokumentSUD_NAME: TMemoField [78]
      FieldName = 'SUD_NAME'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentSUD_DATE: TDateField [79]
      FieldName = 'SUD_DATE'
    end
    object DokumentBRAK_ZAKL: TMemoField [80]
      FieldName = 'BRAK_ZAKL'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentVOSSTAN: TBooleanField [81]
      FieldName = 'VOSSTAN'
    end
    object DokumentISPRAV: TMemoField [82]
      FieldName = 'ISPRAV'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentID_ZAGS: TIntegerField [83]
      FieldName = 'ID_ZAGS'
    end
    object DokumentID_SOURCE: TIntegerField [84]
      FieldName = 'ID_SOURCE'
    end
    object DokumentFirst_Ekz: TBooleanField [85]
      FieldName = 'First_Ekz'
    end
    object DokumentON_Familia_P: TStringField [86]
      FieldName = 'ON_Familia_P'
      Size = 50
    end
    object DokumentON_Name_P: TStringField [87]
      FieldName = 'ON_Name_P'
      Size = 30
    end
    object DokumentON_Otch_P: TStringField [88]
      FieldName = 'ON_Otch_P'
      Size = 30
    end
    object DokumentON_Familia_B_P: TStringField [89]
      FieldName = 'ON_Familia_B_P'
      Size = 50
    end
    object DokumentON_Name_B_P: TStringField [90]
      FieldName = 'ON_Name_B_P'
      Size = 30
    end
    object DokumentON_Otch_B_P: TStringField [91]
      FieldName = 'ON_Otch_B_P'
      Size = 30
    end
    object DokumentONA_Familia_P: TStringField [92]
      FieldName = 'ONA_Familia_P'
      Size = 50
    end
    object DokumentONA_Name_P: TStringField [93]
      FieldName = 'ONA_Name_P'
      Size = 30
    end
    object DokumentONA_Otch_P: TStringField [94]
      FieldName = 'ONA_Otch_P'
      Size = 30
    end
    object DokumentONA_Familia_B_P: TStringField [95]
      FieldName = 'ONA_Familia_B_P'
      Size = 50
    end
    object DokumentONA_Name_B_P: TStringField [96]
      FieldName = 'ONA_Name_B_P'
      Size = 30
    end
    object DokumentONA_Otch_B_P: TStringField [97]
      FieldName = 'ONA_Otch_B_P'
      Size = 30
    end
    object DokumentON_Familia_PD: TStringField [98]
      FieldName = 'ON_Familia_PD'
      Size = 50
    end
    object DokumentON_Name_PD: TStringField [99]
      FieldName = 'ON_Name_PD'
      Size = 30
    end
    object DokumentON_Otch_PD: TStringField [100]
      FieldName = 'ON_Otch_PD'
      Size = 30
    end
    object DokumentON_Familia_B_PD: TStringField [101]
      FieldName = 'ON_Familia_B_PD'
      Size = 50
    end
    object DokumentON_Name_B_PD: TStringField [102]
      FieldName = 'ON_Name_B_PD'
      Size = 30
    end
    object DokumentON_Otch_B_PD: TStringField [103]
      FieldName = 'ON_Otch_B_PD'
      Size = 30
    end
    object DokumentONA_Familia_PD: TStringField [104]
      FieldName = 'ONA_Familia_PD'
      Size = 50
    end
    object DokumentONA_Name_PD: TStringField [105]
      FieldName = 'ONA_Name_PD'
      Size = 30
    end
    object DokumentONA_Otch_PD: TStringField [106]
      FieldName = 'ONA_Otch_PD'
      Size = 30
    end
    object DokumentONA_Familia_B_PD: TStringField [107]
      FieldName = 'ONA_Familia_B_PD'
      Size = 50
    end
    object DokumentONA_Name_B_PD: TStringField [108]
      FieldName = 'ONA_Name_B_PD'
      Size = 30
    end
    object DokumentONA_Otch_B_PD: TStringField [109]
      FieldName = 'ONA_Otch_B_PD'
      Size = 30
    end
    object DokumentOTHER: TMemoField [110]
      FieldName = 'OTHER'
      BlobType = ftMemo
    end
    object DokumentIZMEN: TMemoField [111]
      FieldName = 'IZMEN'
      BlobType = ftMemo
    end
    object DokumentCOPIA: TBooleanField [112]
      FieldName = 'COPIA'
    end
    object DokumentARX_ADRESAT: TMemoField [114]
      FieldName = 'ARX_ADRESAT'
      BlobType = ftMemo
    end
    object DokumentARX_TEXT: TMemoField [115]
      FieldName = 'ARX_TEXT'
      BlobType = ftMemo
    end
    object DokumentARX_NOMER: TStringField [116]
      FieldName = 'ARX_NOMER'
      Size = 10
    end
    object DokumentARX_DATE: TDateField [117]
      FieldName = 'ARX_DATE'
    end
    object DokumentON_ONLYGOD: TBooleanField [123]
      FieldName = 'ON_ONLYGOD'
    end
    object DokumentONA_ONLYGOD: TBooleanField [124]
      FieldName = 'ONA_ONLYGOD'
    end
    object DokumentON_VOZR: TSmallintField [125]
      FieldName = 'ON_VOZR'
    end
    object DokumentONA_VOZR: TSmallintField [126]
      FieldName = 'ONA_VOZR'
    end
    object DokumentON_B_GOROD: TSmallintField [127]
      FieldName = 'ON_B_GOROD'
    end
    object DokumentON_M_B_GOROD: TSmallintField [128]
      FieldName = 'ON_M_B_GOROD'
    end
    object DokumentONA_B_GOROD: TSmallintField [129]
      FieldName = 'ONA_B_GOROD'
    end
    object DokumentONA_M_B_GOROD: TSmallintField [130]
      FieldName = 'ONA_M_B_GOROD'
    end
    object DokumentON_STATUS: TStringField [131]
      FieldName = 'ON_STATUS'
      Size = 1
    end
    object DokumentONA_STATUS: TStringField [132]
      FieldName = 'ONA_STATUS'
      Size = 1
    end
    object DokumentON_IDENTIF: TStringField [133]
      FieldName = 'ON_IDENTIF'
      Size = 14
    end
    object DokumentONA_IDENTIF: TStringField [134]
      FieldName = 'ONA_IDENTIF'
      Size = 14
    end
    object DokumentPOLE_GRN: TSmallintField [135]
      FieldName = 'POLE_GRN'
    end
    object DokumentTYPEMESSAGE: TStringField [136]
      FieldName = 'TYPEMESSAGE'
      Size = 4
    end
    object DokumentON_DOK_TYPE: TSmallintField [137]
      FieldName = 'ON_DOK_TYPE'
    end
    object DokumentON_DOK_SERIA: TStringField [138]
      FieldName = 'ON_DOK_SERIA'
      Size = 7
    end
    object DokumentON_DOK_NOMER: TStringField [139]
      FieldName = 'ON_DOK_NOMER'
      Size = 10
    end
    object DokumentON_DOK_DATE: TDateField [140]
      FieldName = 'ON_DOK_DATE'
    end
    object DokumentON_DOK_ORGAN: TIntegerField [141]
      FieldName = 'ON_DOK_ORGAN'
    end
    object DokumentONA_DOK_TYPE: TSmallintField [142]
      FieldName = 'ONA_DOK_TYPE'
    end
    object DokumentONA_DOK_SERIA: TStringField [143]
      FieldName = 'ONA_DOK_SERIA'
      Size = 7
    end
    object DokumentONA_DOK_NOMER: TStringField [144]
      FieldName = 'ONA_DOK_NOMER'
      Size = 10
    end
    object DokumentONA_DOK_DATE: TDateField [145]
      FieldName = 'ONA_DOK_DATE'
    end
    object DokumentONA_DOK_ORGAN: TIntegerField [146]
      FieldName = 'ONA_DOK_ORGAN'
    end
    object DokumentSPEC_B: TStringField [147]
      FieldName = 'SPEC_B'
      Size = 60
    end
    object DokumentDETI_COUNT: TSmallintField [148]
      FieldName = 'DETI_COUNT'
    end
    object DokumentRN_ON_M_B_GOROD: TStringField [149]
      FieldName = 'RN_ON_M_B_GOROD'
      Size = 10
    end
    object DokumentRN_ON_B_GOROD: TStringField [150]
      FieldName = 'RN_ON_B_GOROD'
      Size = 10
    end
    object DokumentRN_ONA_M_B_GOROD: TStringField [151]
      FieldName = 'RN_ONA_M_B_GOROD'
      Size = 10
    end
    object DokumentRN_ONA_B_GOROD: TStringField [152]
      FieldName = 'RN_ONA_B_GOROD'
      Size = 10
    end
    object DokumentON_M_DOM: TStringField [153]
      FieldName = 'ON_M_DOM'
      Size = 10
    end
    object DokumentON_M_KORP: TStringField [154]
      FieldName = 'ON_M_KORP'
      Size = 7
    end
    object DokumentON_M_KV: TStringField [155]
      FieldName = 'ON_M_KV'
      Size = 10
    end
    object DokumentONA_M_DOM: TStringField [156]
      FieldName = 'ONA_M_DOM'
      Size = 10
    end
    object DokumentONA_M_KORP: TStringField [157]
      FieldName = 'ONA_M_KORP'
      Size = 7
    end
    object DokumentONA_M_KV: TStringField [158]
      FieldName = 'ONA_M_KV'
      Size = 10
    end
    object DokumentON_M_RNGOROD: TStringField [159]
      FieldName = 'ON_M_RNGOROD'
      Size = 30
    end
    object DokumentONA_M_RNGOROD: TStringField [160]
      FieldName = 'ONA_M_RNGOROD'
      Size = 30
    end
    object DokumentON_M_B_RN: TBooleanField [161]
      FieldName = 'ON_M_B_RN'
    end
    object DokumentONA_M_B_RN: TBooleanField [162]
      FieldName = 'ONA_M_B_RN'
    end
    object DokumentON_SUM_POSHLINA: TFloatField [163]
      FieldName = 'ON_SUM_POSHLINA'
      DisplayFormat = '##0.#0'
      EditFormat = '##0.#0'
    end
    object DokumentONA_SUM_POSHLINA: TFloatField [164]
      FieldName = 'ONA_SUM_POSHLINA'
      DisplayFormat = '### ##0.#0'
      EditFormat = '### ##0.#0'
    end
    object DokumentTYPE_RAST: TSmallintField [165]
      FieldName = 'TYPE_RAST'
    end
    object DokumentBRAK_ID: TIntegerField [166]
      FieldName = 'BRAK_ID'
    end
    object DokumentBRAK_DATE: TDateField [167]
      FieldName = 'BRAK_DATE'
    end
    object DokumentBRAK_NOMER: TStringField [168]
      FieldName = 'BRAK_NOMER'
      Size = 10
    end
    object DokumentON_SOATO: TStringField [169]
      FieldName = 'ON_SOATO'
      Size = 10
    end
    object DokumentONA_SOATO: TStringField [170]
      FieldName = 'ONA_SOATO'
      Size = 10
    end
    object DokumentON_PODPIS: TStringField [171]
      FieldName = 'ON_PODPIS'
      Size = 200
    end
    object DokumentONA_PODPIS: TStringField [172]
      FieldName = 'ONA_PODPIS'
      Size = 200
    end
    object DokumentON_VUS: TBooleanField [177]
      FieldName = 'ON_VUS'
    end
    object DokumentONA_VUS: TBooleanField [178]
      FieldName = 'ONA_VUS'
    end
    object DokumentON_VOENKOM: TIntegerField [179]
      FieldName = 'ON_VOENKOM'
    end
    object DokumentONA_VOENKOM: TIntegerField [180]
      FieldName = 'ONA_VOENKOM'
    end
    object DokumentSUD_SILA: TDateField [181]
      FieldName = 'SUD_SILA'
    end
    object DokumentDECL_ID: TSmallintField [182]
      FieldName = 'DECL_ID'
    end
    object DokumentDECLARE_ID: TIntegerField [183]
      FieldName = 'DECLARE_ID'
    end
    object DokumentSVID_SERIA: TStringField [184]
      FieldName = 'SVID_SERIA'
      Size = 10
    end
    object DokumentSVID_NOMER: TStringField [185]
      FieldName = 'SVID_NOMER'
    end
    object DokumentDATESV: TDateField [186]
      FieldName = 'DATESV'
    end
    object DokumentWHO_SVID: TStringField [187]
      DisplayLabel = #1082#1086#1084#1091' '#1074#1099#1076#1072#1077#1090#1089#1103' '#1087#1086#1074#1090'. '#1089#1074#1080'-'#1074#1086' ('#1052','#1046')'
      FieldName = 'WHO_SVID'
      Size = 1
    end
    object DokumentON_GRAG_ADD: TMemoField [188]
      FieldName = 'ON_GRAG_ADD'
      BlobType = ftMemo
    end
    object DokumentONA_GRAG_ADD: TMemoField [189]
      FieldName = 'ONA_GRAG_ADD'
      BlobType = ftMemo
    end
    object DokumentBRAK_ZAKL_B: TStringField [190]
      FieldName = 'BRAK_ZAKL_B'
      Size = 200
    end
    object DokumentON_IDENTIF_GIS: TStringField
      FieldName = 'ON_IDENTIF_GIS'
      Size = 1
    end
    object DokumentONA_IDENTIF_GIS: TStringField
      FieldName = 'ONA_IDENTIF_GIS'
      Size = 1
    end
    object DokumentON_ATEID: TIntegerField
      FieldName = 'ON_ATEID'
    end
    object DokumentONA_ATEID: TIntegerField
      FieldName = 'ONA_ATEID'
    end
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 744
    Top = 146
  end
  inherited HistZAGS: TkbmMemTable
    Left = 416
    Top = 114
  end
  inherited dsSeria: TDataSource
    Left = 792
    Top = 282
  end
  inherited dsObl: TDataSource
    Left = 784
    Top = 258
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 680
    Top = 90
  end
  inherited dsPovtor: TDataSource
    Left = 512
    Top = 242
  end
  inherited dsRN: TDataSource
    Left = 792
    Top = 394
  end
  inherited dsGorod: TDataSource
    Left = 704
    Top = 338
  end
  inherited dsRnGor: TDataSource
    Left = 584
    Top = 266
  end
  inherited dsTypeGorod: TDataSource
    Left = 472
    Top = 314
  end
  inherited ImGISUN: TImageList
    Left = 484
    Top = 107
  end
  inherited dsVoenkom: TDataSource
    Left = 784
    Top = 362
  end
  inherited dsRovd: TDataSource
    Left = 808
    Top = 306
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 512
    Top = 106
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 768
    Top = 314
  end
  inherited tbReshSud: TkbmMemTable
    Left = 624
    Top = 338
  end
  object dsGragd: TDataSource
    Left = 732
    Top = 266
  end
end
