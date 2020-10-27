inherited fmZapisBrak: TfmZapisBrak
  Left = 314
  Top = 131
  ActiveControl = edNomer
  Caption = #1047#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1080' '#1073#1088#1072#1082#1072
  ClientHeight = 719
  ClientWidth = 904
  Constraints.MinHeight = 690
  Constraints.MinWidth = 905
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0001070000000000001110770000000011111110700000099991111107000019
    999911111000001F999999111000001F9991991110000009F910991100000000
    110009100000000000000000000000000000000000000000000000000000FFFF
    0000FFFF0000FFFF0000FE7F0000FC3F0000F80F0000E0070000C0030000C003
    0000C0030000C0030000C0070000E10F0000FFFF0000FFFF0000FFFF0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 50
    Width = 904
    Height = 2
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
    Top = 52
    Width = 904
    Height = 645
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 904
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
        object TBItem1: TTBItem
          Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '
          OnClick = TBItem1Click
        end
        object TBItem2: TTBItem
          Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1072#1082#1090#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
          OnClick = TBItem2Click
        end
      end
      object TBItemChoiceDeclare: TTBItem [11]
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077' '#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1073#1088#1072#1082#1072
        ImageIndex = 112
        OnClick = TBItemChoiceDeclareClick
      end
      object TBItemArxSpr: TTBItem [12]
        AutoCheck = True
        Caption = #1057#1087#1088#1072#1074#1082#1072
        Hint = #1040#1088#1093#1080#1074#1085#1072#1103' '#1089#1087#1088#1072#1074#1082#1072
        ImageIndex = 45
        OnClick = TBItemArxSprClick
      end
      inherited TBItemDelList: TTBItem
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1089#1090#1088#1086#1082#1091'  '#1074' '#1089#1087#1080#1089#1082#1077' '#1076#1077#1090#1077#1081' Ctrl-Del'
      end
      object TBItemVozrast: TTBItem [14]
        AutoCheck = True
        Caption = #1042#1086#1079#1088#1072#1089#1090
        Hint = #1058#1086#1083#1100#1082#1086' '#1074#1086#1079#1088#1072#1089#1090
        ImageIndex = 109
        OnClick = TBItemVozrastClick
      end
      object TBItemChName: TTBItem [15]
        Caption = #1042#1085#1077#1089#1090#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1080#1079' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
        Hint = #1042#1085#1077#1089#1090#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1080#1079' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
        ImageIndex = 97
        OnClick = TBItemChNameClick
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
        Left = 900
        Top = 22
        inherited edZAGS: TDBEditEh
          TabStop = False
        end
      end
    end
  end
  inherited sb: TScrollBox
    Top = 52
    Width = 904
    Height = 645
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
      Top = 32
      Width = 904
      Height = 613
      ActivePage = tsTail1
      Align = alClient
      HotTrack = True
      Images = fmMain.ImageList
      TabOrder = 1
      TabStop = False
      OnChange = pcChange
      object tsTail1: TTabSheet
        Caption = #1063#1072#1089#1090#1100' 1'
        ImageIndex = -1
        DesignSize = (
          896
          584)
        object Label1: TLabel
          Left = 4
          Top = 3
          Width = 116
          Height = 14
          AutoSize = False
          Caption = '1. '#1060#1072#1084#1080#1083#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label2: TLabel
          Left = 317
          Top = 2
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
          Left = 687
          Top = 2
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
          Left = 17
          Top = 51
          Width = 147
          Height = 13
          Caption = #1087#1086#1089#1083#1077' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103' '#1073#1088#1072#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 4
          Top = 78
          Width = 163
          Height = 13
          AutoSize = False
          Caption = '2. '#1057#1086#1073#1089#1090#1074#1077#1085#1085#1086#1077' '#1080#1084#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 4
          Top = 105
          Width = 110
          Height = 13
          AutoSize = False
          Caption = '3. '#1054#1090#1095#1077#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbDateR_Rodit: TLabel
          Left = 4
          Top = 157
          Width = 147
          Height = 13
          AutoSize = False
          Caption = '5. '#1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 4
          Top = 174
          Width = 144
          Height = 13
          AutoSize = False
          Caption = '6. '#1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 17
          Top = 187
          Width = 134
          Height = 13
          Caption = #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072' ('#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1086')'
        end
        object Label10: TLabel
          Left = 17
          Top = 213
          Width = 76
          Height = 13
          Caption = #1086#1073#1083#1072#1089#1090#1100' ('#1082#1088#1072#1081')'
        end
        object Label11: TLabel
          Left = 17
          Top = 240
          Width = 30
          Height = 13
          Caption = #1088#1072#1081#1086#1085
        end
        object Label12: TLabel
          Left = 17
          Top = 267
          Width = 82
          Height = 13
          Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077')'
          Visible = False
        end
        object Label13: TLabel
          Left = 4
          Top = 294
          Width = 151
          Height = 13
          AutoSize = False
          Caption = '7. '#1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 4
          Top = 321
          Width = 194
          Height = 13
          AutoSize = False
          Caption = '8. '#1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 4
          Top = 348
          Width = 152
          Height = 13
          AutoSize = False
          Caption = '9. '#1043#1076#1077' '#1080' '#1082#1077#1084' '#1088#1072#1073#1086#1090#1072#1077#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 4
          Top = 372
          Width = 164
          Height = 13
          AutoSize = False
          Caption = '10. '#1054#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 4
          Top = 390
          Width = 152
          Height = 13
          AutoSize = False
          Caption = '11. '#1052#1077#1089#1090#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 23
          Top = 402
          Width = 134
          Height = 13
          Caption = #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072' ('#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1086')'
        end
        object Label19: TLabel
          Left = 23
          Top = 429
          Width = 76
          Height = 13
          Caption = #1086#1073#1083#1072#1089#1090#1100' ('#1082#1088#1072#1081')'
        end
        object Label20: TLabel
          Left = 23
          Top = 456
          Width = 30
          Height = 13
          Caption = #1088#1072#1081#1086#1085
        end
        object Label21: TLabel
          Left = 23
          Top = 483
          Width = 82
          Height = 13
          Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077')'
          Visible = False
        end
        object Label23: TLabel
          Left = 23
          Top = 510
          Width = 109
          Height = 13
          Caption = #1088#1072#1081#1086#1085'  '#1075#1086#1088#1086#1076#1072', '#1091#1083#1080#1094#1072
        end
        object lbIN: TLabel
          Left = 4
          Top = 132
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
        object lbBrakRast: TvchDBText
          Left = 786
          Top = 129
          Width = 70
          Height = 16
          AutoSize = True
          DataField = 'TYPE_RAST'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
          OnGetText = lbBrakRastGetText
        end
        object Label66: TLabel
          Left = 150
          Top = 537
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
          Left = 223
          Top = 537
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
          Left = 314
          Top = 537
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
          Left = 523
          Top = 537
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
          Left = 601
          Top = 537
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
          Left = 692
          Top = 537
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
        object Label45: TLabel
          Left = 23
          Top = 564
          Width = 129
          Height = 13
          Caption = #1089' '#1082#1072#1082#1086#1075#1086' '#1075#1086#1076#1072' '#1087#1088#1086#1078#1080#1074#1072#1077#1090
        end
        object Label36: TLabel
          Left = 17
          Top = 23
          Width = 151
          Height = 14
          AutoSize = False
          Caption = #1076#1086' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103' '#1073#1088#1072#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object lbON_REG_DATE_TILL: TvchDBText
          Left = 237
          Top = 563
          Width = 271
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          DataField = 'ON_REG_DATE_TILL'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnGetText = lbON_REG_DATE_TILLGetText
        end
        object lbONA_REG_DATE_TILL: TvchDBText
          Left = 613
          Top = 563
          Width = 271
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          DataField = 'ONA_REG_DATE_TILL'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnGetText = lbONA_REG_DATE_TILLGetText
        end
        object N_F_lbON_Status: TvchDBText
          Left = 339
          Top = 0
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
          Left = 717
          Top = 0
          Width = 139
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
          Left = 323
          Top = 131
          Width = 16
          Height = 16
          Transparent = True
          Visible = False
        end
        object ImCondIN_ONA: TImage
          Left = 700
          Top = 131
          Width = 16
          Height = 16
          Transparent = True
          Visible = False
        end
        object edON_Familia: TDBEditEh
          Left = 175
          Top = 18
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
              Hint = #1042#1099#1073#1088#1072#1090#1100
              Style = ebsGlyphEh
              Width = 20
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
          Left = 553
          Top = 18
          Width = 145
          Height = 26
          DataField = 'ONA_Familia'
          DataSource = dsDokument
          EditButtons = <
            item
              Hint = #1042#1099#1073#1088#1072#1090#1100
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
          TabOrder = 27
          Visible = True
        end
        object edON_FamiliaP: TDBEditEh
          Left = 175
          Top = 45
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
          Left = 553
          Top = 45
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
          TabOrder = 28
          Visible = True
          OnUpdateData = edONA_FamiliaPUpdateData
        end
        object edON_Name: TDBEditEh
          Left = 175
          Top = 72
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
          MRUList.Active = True
          MRUList.Limit = 200
          MRUList.Rows = 20
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object edON_OTCH: TDBEditEh
          Left = 175
          Top = 99
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
          Left = 553
          Top = 72
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
          TabOrder = 29
          Visible = True
        end
        object edONA_OTCH: TDBEditEh
          Left = 553
          Top = 99
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
          MRUList.AutoAdd = False
          MRUList.Limit = 1000
          MRUList.Rows = 15
          ParentFont = False
          TabOrder = 30
          Visible = True
        end
        object edON_DATER: TDBDateTimeEditEh
          Left = 175
          Top = 153
          Width = 100
          Height = 26
          HelpKeyword = '4'
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
          OnEnter = edON_DATEREnter
          OnUpdateData = edON_DATERUpdateData
        end
        object edONA_DATER: TDBDateTimeEditEh
          Left = 553
          Top = 153
          Width = 100
          Height = 26
          HelpKeyword = '4'
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
          TabOrder = 32
          Visible = True
          OnEnter = edONA_DATEREnter
          OnUpdateData = edON_DATERUpdateData
        end
        object edON_GOSUD: TDBLookupComboboxEh
          Left = 175
          Top = 180
          Width = 145
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
          Left = 553
          Top = 180
          Width = 145
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
          TabOrder = 34
          Visible = True
        end
        object BLR_edON_OBL: TDBEditEh
          Left = 331
          Top = 207
          Width = 145
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'ON_OBL_B'
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
        object BLR_edONA_OBL: TDBEditEh
          Left = 710
          Top = 207
          Width = 145
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'ONA_OBL_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 67
          Visible = True
        end
        object BLR_edON_RAION: TDBEditEh
          Left = 331
          Top = 234
          Width = 145
          Height = 26
          DataField = 'ON_RAION_B'
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
        object BLR_edONA_RAION: TDBEditEh
          Left = 710
          Top = 234
          Width = 145
          Height = 26
          DataField = 'ONA_RAION_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 68
          Visible = True
        end
        object edON_GOROD: TDBEditEh
          Left = 175
          Top = 261
          Width = 145
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
          Left = 553
          Top = 261
          Width = 145
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
          TabOrder = 38
          Visible = True
        end
        object edON_NATION: TDBLookupComboboxEh
          Left = 175
          Top = 288
          Width = 247
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
          Left = 175
          Top = 396
          Width = 247
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
          TabOrder = 16
          Visible = True
          OnUpdateData = edON_M_GOSUDUpdateData
        end
        object edON_M_GOROD: TDBEditEh
          Left = 227
          Top = 477
          Width = 195
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
          TabOrder = 20
          Visible = True
          OnUpdateData = edON_M_GOSUDUpdateData
        end
        object edON_GRAG: TDBLookupComboboxEh
          Left = 175
          Top = 315
          Width = 302
          Height = 26
          DataField = 'ON_GRAG'
          DataSource = dsDokument
          DropDownBox.Sizable = True
          DropDownBox.Width = 300
          EditButtons = <
            item
              Hint = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1077' '#1075#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086'  (Ins)'
              ShortCut = 45
              Style = ebsPlusEh
              OnClick = edON_GRAGEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'GNAME'
          ListSource = dsGragd
          ParentFont = False
          Style = csDropDownEh
          TabOrder = 13
          Visible = True
        end
        object edON_WORK: TDBEditEh
          Left = 175
          Top = 342
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
          TabOrder = 14
          Visible = True
        end
        object edON_OBRAZ: TDBComboBoxEh
          Left = 175
          Top = 369
          Width = 247
          Height = 26
          DataField = 'ON_OBRAZ'
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
        object edON_M_GOROD_R: TDBEditEh
          Left = 329
          Top = 504
          Width = 184
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
          TabOrder = 22
          Visible = True
          OnUpdateData = edON_M_GOSUDUpdateData
        end
        object edONA_NATION: TDBLookupComboboxEh
          Left = 553
          Top = 288
          Width = 247
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
          TabOrder = 39
          Visible = True
        end
        object edONA_M_GOSUD: TDBLookupComboboxEh
          Left = 553
          Top = 396
          Width = 247
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
          TabOrder = 43
          Visible = True
          OnUpdateData = edONA_M_GOSUDUpdateData
        end
        object edONA_M_GOROD: TDBEditEh
          Left = 603
          Top = 477
          Width = 198
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
          TabOrder = 47
          Visible = True
          OnUpdateData = edONA_M_GOSUDUpdateData
        end
        object edONA_GRAG: TDBLookupComboboxEh
          Left = 553
          Top = 315
          Width = 302
          Height = 26
          DataField = 'ONA_GRAG'
          DataSource = dsDokument
          DropDownBox.Sizable = True
          DropDownBox.Width = 300
          EditButtons = <
            item
              Hint = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1077' '#1075#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086'  (Ins)'
              ShortCut = 45
              Style = ebsPlusEh
              OnClick = edONA_GRAGEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'GNAME'
          ListSource = dsGragd
          ParentFont = False
          TabOrder = 40
          Visible = True
        end
        object edONA_WORK: TDBEditEh
          Left = 553
          Top = 342
          Width = 302
          Height = 26
          DataField = 'ONA_WORK'
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
        end
        object edONA_OBRAZ: TDBComboBoxEh
          Left = 553
          Top = 369
          Width = 247
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
          TabOrder = 42
          Visible = True
        end
        object edONA_M_GOROD_R: TDBEditEh
          Left = 708
          Top = 504
          Width = 180
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
          TabOrder = 49
          Visible = True
          OnUpdateData = edONA_M_GOSUDUpdateData
        end
        object edON_B_OBL: TDBCheckBoxEh
          Left = 159
          Top = 211
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ON_B_OBL'
          DataSource = dsDokument
          TabOrder = 76
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edONA_B_OBL: TDBCheckBoxEh
          Left = 532
          Top = 211
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ONA_B_OBL'
          DataSource = dsDokument
          TabOrder = 74
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edON_M_B_OBL: TDBCheckBoxEh
          Left = 159
          Top = 427
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ON_M_B_OBL'
          DataSource = dsDokument
          TabOrder = 72
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edONA_M_B_OBL: TDBCheckBoxEh
          Left = 531
          Top = 427
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ONA_M_B_OBL'
          DataSource = dsDokument
          TabOrder = 73
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object cbOnlyGodON: TDBCheckBoxEh
          Left = 286
          Top = 157
          Width = 57
          Height = 17
          Hint = #1058#1086#1083#1100#1082#1086' '#1075#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
          Caption = #1043#1086#1076
          DataField = 'ON_ONLYGOD'
          DataSource = dsDokument
          TabOrder = 71
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = cbOnlyGodONClick
        end
        object cbOnlyGodONA: TDBCheckBoxEh
          Left = 663
          Top = 157
          Width = 57
          Height = 17
          Hint = #1058#1086#1083#1100#1082#1086' '#1075#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
          Caption = #1043#1086#1076
          DataField = 'ONA_ONLYGOD'
          DataSource = dsDokument
          TabOrder = 70
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = cbOnlyGodONClick
        end
        object edON_VOZR: TDBNumberEditEh
          Left = 341
          Top = 153
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
          Top = 153
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
          TabOrder = 33
          Visible = False
        end
        object edON_M_RNGOROD: TDBLookupComboboxEh
          Left = 175
          Top = 504
          Width = 145
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
          TabOrder = 21
          Visible = True
          OnNotInList = edON_M_RNGORODNotInList
          OnUpdateData = edON_M_GOSUDUpdateData
        end
        object edONA_M_RNGOROD: TDBLookupComboboxEh
          Left = 553
          Top = 504
          Width = 145
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
          TabOrder = 48
          Visible = True
          OnNotInList = edON_M_RNGORODNotInList
          OnUpdateData = edONA_M_GOSUDUpdateData
        end
        object edON_B_GOROD: TDBLookupComboboxEh
          Left = 111
          Top = 261
          Width = 54
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
          Left = 503
          Top = 261
          Width = 46
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
          TabOrder = 37
          Visible = True
        end
        object edON_M_B_GOROD: TDBLookupComboboxEh
          Left = 175
          Top = 477
          Width = 46
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
          TabOrder = 19
          Visible = True
        end
        object edONA_M_B_GOROD: TDBLookupComboboxEh
          Left = 553
          Top = 477
          Width = 46
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
          TabOrder = 46
          Visible = True
        end
        object ENG_edON_IDENTIF: TDBEditEh
          Left = 175
          Top = 126
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
        end
        object ENG_edONA_IDENTIF: TDBEditEh
          Left = 553
          Top = 126
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
          TabOrder = 31
          Visible = True
        end
        object N_F_cbBelorus: TDBCheckBoxEh
          Left = 852
          Top = -3
          Width = 44
          Height = 18
          Anchors = [akTop, akRight]
          Caption = #1073#1077#1083
          DragCursor = crNo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbGrayed
          TabOrder = 75
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = N_F_cbBelorusClick
        end
        object edON_OBL: TDBEditEh
          Left = 175
          Top = 207
          Width = 145
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
        end
        object edON_RAION: TDBEditEh
          Left = 175
          Top = 234
          Width = 145
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
        end
        object edON_M_OBL: TDBEditEh
          Left = 175
          Top = 423
          Width = 247
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
          TabOrder = 17
          Visible = True
          OnUpdateData = edON_M_GOSUDUpdateData
        end
        object edON_M_RAION: TDBEditEh
          Left = 175
          Top = 450
          Width = 247
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
          TabOrder = 18
          Visible = True
          OnUpdateData = edON_M_GOSUDUpdateData
        end
        object edONA_M_OBL: TDBEditEh
          Left = 553
          Top = 423
          Width = 247
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
          TabOrder = 44
          Visible = True
          OnUpdateData = edONA_M_GOSUDUpdateData
        end
        object edONA_M_RAION: TDBEditEh
          Left = 553
          Top = 450
          Width = 247
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
          TabOrder = 45
          Visible = True
          OnUpdateData = edONA_M_GOSUDUpdateData
        end
        object edONA_OBL: TDBEditEh
          Left = 553
          Top = 207
          Width = 145
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
          TabOrder = 35
          Visible = True
        end
        object edONA_RAION: TDBEditEh
          Left = 553
          Top = 234
          Width = 145
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
          TabOrder = 36
          Visible = True
        end
        object edON_M_DOM: TDBEditEh
          Left = 175
          Top = 531
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
          TabOrder = 23
          Visible = True
        end
        object edON_M_KORP: TDBEditEh
          Left = 260
          Top = 531
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
          TabOrder = 24
          Visible = True
        end
        object edON_M_KV: TDBEditEh
          Left = 337
          Top = 531
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
          TabOrder = 25
          Visible = True
        end
        object edONA_M_DOM: TDBEditEh
          Left = 553
          Top = 531
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
          TabOrder = 50
          Visible = True
        end
        object edONA_M_KORP: TDBEditEh
          Left = 638
          Top = 531
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
          TabOrder = 51
          Visible = True
        end
        object edONA_M_KV: TDBEditEh
          Left = 715
          Top = 531
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
          TabOrder = 52
          Visible = True
        end
        object edON_GODPR: TDBNumberEditEh
          Left = 175
          Top = 558
          Width = 53
          Height = 26
          DataField = 'ON_GODPR'
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
        object edONA_GODPR: TDBNumberEditEh
          Left = 553
          Top = 558
          Width = 53
          Height = 26
          HelpType = htKeyword
          HelpContext = 999
          DataField = 'ONA_GODPR'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 53
          Visible = True
        end
        object BLR_edON_FamiliaP: TDBEditEh
          Left = 331
          Top = 45
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
          Left = 331
          Top = 72
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
          MRUList.Active = True
          MRUList.Limit = 200
          MRUList.Rows = 20
          ParentFont = False
          TabOrder = 56
          Visible = True
        end
        object BLR_edON_Otch: TDBEditEh
          Left = 331
          Top = 99
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
          Left = 331
          Top = 18
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
          Left = 710
          Top = 45
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
          TabOrder = 63
          Visible = True
          OnUpdateData = BLR_edONA_FamiliaPUpdateData
        end
        object BLR_edONA_Name: TDBEditEh
          Left = 710
          Top = 72
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
          TabOrder = 64
          Visible = True
        end
        object BLR_edONA_Otch: TDBEditEh
          Left = 710
          Top = 99
          Width = 145
          Height = 26
          DataField = 'ONA_Otch_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          MRUList.AutoAdd = False
          MRUList.Limit = 1000
          MRUList.Rows = 15
          ParentFont = False
          TabOrder = 65
          Visible = True
        end
        object BLR_edONA_Familia: TDBEditEh
          Left = 710
          Top = 18
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
          TabOrder = 62
          Visible = True
        end
        object BLR_edON_GOSUD: TDBLookupComboboxEh
          Left = 331
          Top = 180
          Width = 145
          Height = 26
          TabStop = False
          Color = clInfoBk
          DataField = 'ON_GOSUD'
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
          ReadOnly = True
          TabOrder = 58
          Visible = True
        end
        object BLR_edONA_Gosud: TDBLookupComboboxEh
          Left = 710
          Top = 180
          Width = 145
          Height = 26
          TabStop = False
          Color = clInfoBk
          DataField = 'ONA_GOSUD'
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
          ReadOnly = True
          TabOrder = 66
          Visible = True
        end
        object BLR_edON_Gorod: TDBEditEh
          Left = 331
          Top = 261
          Width = 145
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'ON_GOROD_B'
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
        object BLR_edONA_Gorod: TDBEditEh
          Left = 710
          Top = 261
          Width = 145
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'ONA_GOROD_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 69
          Visible = True
        end
        object edON_SOATO: TDBEditEh
          Left = 394
          Top = 531
          Width = 105
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
          TabOrder = 77
          Visible = True
          OnClick = edON_SOATOClick
          OnDblClick = edON_SOATODblClick
        end
        object edONA_SOATO: TDBEditEh
          Left = 776
          Top = 531
          Width = 105
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
          TabOrder = 78
          Visible = True
          OnClick = edONA_SOATOClick
          OnDblClick = edONA_SOATODblClick
        end
        object BLR_edON_B_GOROD: TDBLookupComboboxEh
          Left = 454
          Top = 261
          Width = 40
          Height = 26
          Alignment = taRightJustify
          Color = clInfoBk
          DataField = 'ON_B_GOROD'
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
          TabOrder = 79
          Visible = False
        end
        object BLR_edONA_B_GOROD: TDBLookupComboboxEh
          Left = 823
          Top = 261
          Width = 46
          Height = 26
          Alignment = taRightJustify
          Color = clInfoBk
          DataField = 'ONA_B_GOROD'
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
          TabOrder = 80
          Visible = False
        end
      end
      object tsTail2: TTabSheet
        Caption = #1063#1072#1089#1090#1100' 2'
        ImageIndex = -1
        DesignSize = (
          896
          584)
        object Label24: TLabel
          Left = 8
          Top = 20
          Width = 177
          Height = 16
          AutoSize = False
          Caption = '13. '#1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label31: TLabel
          Left = 8
          Top = 46
          Width = 107
          Height = 39
          Caption = '14. '#1044#1086#1082#1091#1084#1077#1085#1090' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1080#1081' '#1083#1080#1095#1085#1086#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label32: TLabel
          Left = 8
          Top = 153
          Width = 71
          Height = 13
          Caption = '18. '#1054#1090#1084#1077#1090#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 8
          Top = 249
          Width = 83
          Height = 13
          Caption = '16. '#1057#1074#1080#1076#1077#1090#1077#1083#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 9
          Top = 221
          Width = 191
          Height = 13
          Caption = #1042#1079#1099#1089#1082#1072#1085#1072' '#1075#1086#1089#1087#1086#1096#1083#1080#1085#1072' '#1074' '#1088#1072#1079#1084#1077#1088#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbDateBrak: TLabel
          Left = 378
          Top = 507
          Width = 273
          Height = 13
          AutoSize = False
          Caption = #1044#1072#1090#1072' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103' '#1073#1088#1072#1082#1072' ('#1077#1089#1083#1080' '#1085#1077' '#1076#1072#1090#1072' '#1079'/'#1072')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Label42: TLabel
          Left = 8
          Top = 425
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
          Left = 332
          Top = 76
          Width = 12
          Height = 13
          Caption = #1086#1090
        end
        object Label70: TLabel
          Left = 673
          Top = 76
          Width = 12
          Height = 13
          Caption = #1086#1090
        end
        object Label25: TLabel
          Left = 8
          Top = 130
          Width = 64
          Height = 13
          Caption = #1042#1086#1077#1085#1082#1086#1084#1072#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Label25Click
        end
        object Label26: TLabel
          Left = 101
          Top = 535
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
        object Label65: TLabel
          Left = 488
          Top = 535
          Width = 81
          Height = 13
          Caption = #1055#1088#1080#1095#1080#1085#1072' '#1089#1086#1082#1088'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label80: TLabel
          Left = 178
          Top = 561
          Width = 36
          Height = 13
          Caption = #1058#1072#1088#1080#1092
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbDolgRuk: TvchDBText
          Left = 5
          Top = 275
          Width = 649
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
          Left = 5
          Top = 305
          Width = 649
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
        object N_F_lbON_SEM: TvchDBText
          Left = 366
          Top = 20
          Width = 155
          Height = 15
          DataField = 'ON_SEM'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnGetText = N_F_lbON_SEMGetText
        end
        object N_F_lbONA_SEM: TvchDBText
          Left = 704
          Top = 20
          Width = 174
          Height = 15
          DataField = 'ONA_SEM'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnGetText = N_F_lbONA_SEMGetText
        end
        object edON_DOKUMENT: TDBEditEh
          Left = 191
          Top = 97
          Width = 269
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
          TabOrder = 5
          Visible = True
        end
        object edONA_DOKUMENT: TDBEditEh
          Left = 530
          Top = 97
          Width = 267
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
          TabOrder = 12
          Visible = True
        end
        object edOTMETKA: TDBEditEh
          Left = 191
          Top = 151
          Width = 701
          Height = 57
          Anchors = [akLeft, akTop, akRight]
          AutoSelect = False
          AutoSize = False
          Ctl3D = True
          DataField = 'OTMETKA'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 14
          Visible = True
          WantReturns = True
          WordWrap = True
          OnDblClick = TBItemEditMemoClick
        end
        object edON_SVID: TDBEditEh
          Left = 112
          Top = 243
          Width = 235
          Height = 26
          DataField = 'ON_SVID'
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
        object edONA_SVID: TDBEditEh
          Left = 407
          Top = 243
          Width = 235
          Height = 26
          DataField = 'ONA_SVID'
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
        object gbDeti: TGroupBox
          Left = 3
          Top = 327
          Width = 889
          Height = 91
          Anchors = [akLeft, akTop, akRight]
          Caption = ' 12. '#1054#1073#1097#1080#1077' '#1076#1077#1090#1080' '#1085#1077' '#1076#1086#1089#1090#1080#1075#1096#1080#1077' 18 '#1083#1077#1090' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 21
          DesignSize = (
            889
            91)
          object GridDeti: TDBGridEh
            Left = 5
            Top = 16
            Width = 836
            Height = 69
            Anchors = [akLeft, akTop, akRight, akBottom]
            Ctl3D = True
            DataSource = dsDeti
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
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
            ParentCtl3D = False
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
          object pnDeti: TPanel
            Left = 846
            Top = 15
            Width = 41
            Height = 74
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
              Top = 37
              Width = 28
              Height = 28
              Hint = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 1
              TabStop = False
              OnClick = btDelChildClick
            end
          end
          object edDeti: TDBEditEh
            Left = 64
            Top = 40
            Width = 545
            Height = 35
            Anchors = [akLeft, akTop, akRight]
            AutoSelect = False
            AutoSize = False
            Ctl3D = True
            DataField = 'DETI'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
            Visible = False
            WantReturns = True
            WordWrap = True
            OnDblClick = TBItemEditMemoClick
          end
        end
        object edON_SEM: TDBComboBoxEh
          Left = 191
          Top = 16
          Width = 170
          Height = 26
          HelpContext = 888
          Ctl3D = True
          DataField = 'ON_SEM'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          Visible = True
        end
        object edONA_SEM: TDBComboBoxEh
          Left = 530
          Top = 16
          Width = 170
          Height = 26
          DataField = 'ONA_SEM'
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
        object edRukov: TDBEditEh
          Left = 663
          Top = 270
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
          TabOrder = 19
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edRukovEnter
        end
        object edSpec: TDBEditEh
          Left = 663
          Top = 300
          Width = 230
          Height = 26
          Anchors = [akTop, akRight]
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
          TabOrder = 20
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edSpecEnter
        end
        object edPoshlina: TDBEditEh
          Left = 348
          Top = 215
          Width = 544
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'POSHLINA'
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
        object edDateBrak: TDBDateTimeEditEh
          Left = 659
          Top = 501
          Width = 100
          Height = 26
          DataField = 'DATEB'
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
          Visible = False
        end
        object edIzmen: TDBEditEh
          Left = 92
          Top = 423
          Width = 801
          Height = 75
          Anchors = [akLeft, akTop, akRight]
          AutoSelect = False
          AutoSize = False
          Ctl3D = True
          DataField = 'IZMEN'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 22
          Visible = True
          WantReturns = True
          WordWrap = True
          OnDblClick = TBItemEditMemoClick
        end
        object N_F_edCopy: TDBCheckBoxEh
          Left = 4
          Top = 505
          Width = 97
          Height = 17
          Caption = #1050#1086#1087#1080#1103
          DataField = 'COPIA'
          DataSource = dsDokument
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 24
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object btRazdel: TButton
          Left = 157
          Top = 165
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
          TabOrder = 25
          TabStop = False
          OnClick = btRazdelClick
        end
        object N_F_cbTorgest: TDBCheckBoxEh
          Left = 121
          Top = 505
          Width = 224
          Height = 17
          Caption = #1074' '#1090#1086#1088#1078#1077#1089#1090#1074#1077#1085#1085#1086#1081' '#1086#1073#1089#1090#1072#1085#1086#1074#1082#1077
          DataField = 'OSNOV'
          DataSource = dsDokument
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 26
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object btV18: TButton
          Left = 157
          Top = 191
          Width = 24
          Height = 17
          Hint = #1052#1077#1085#1100#1096#1077' 18 '#1083#1077#1090
          Caption = '<18'
          Enabled = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 28
          TabStop = False
          OnClick = btV18Click
        end
        object edON_DOK_TYPE: TDBComboBoxEh
          Left = 191
          Top = 43
          Width = 268
          Height = 26
          Ctl3D = True
          DataField = 'ON_DOK_TYPE'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object edON_DOK_SERIA: TDBEditEh
          Left = 191
          Top = 70
          Width = 33
          Height = 26
          CharCase = ecUpperCase
          Ctl3D = True
          DataField = 'ON_DOK_SERIA'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object edON_DOK_NOMER: TDBEditEh
          Left = 235
          Top = 70
          Width = 89
          Height = 26
          Ctl3D = True
          DataField = 'ON_DOK_NOMER'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          Visible = True
        end
        object edON_DOK_DATE: TDBDateTimeEditEh
          Left = 351
          Top = 70
          Width = 107
          Height = 26
          Ctl3D = True
          DataField = 'ON_DOK_DATE'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
          Visible = True
        end
        object edONA_DOK_SERIA: TDBEditEh
          Left = 530
          Top = 70
          Width = 33
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
          TabOrder = 9
          Visible = True
        end
        object edONA_DOK_TYPE: TDBComboBoxEh
          Left = 530
          Top = 43
          Width = 268
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
          TabOrder = 8
          Visible = True
        end
        object edONA_DOK_NOMER: TDBEditEh
          Left = 578
          Top = 70
          Width = 89
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
          TabOrder = 10
          Visible = True
        end
        object edONA_DOK_DATE: TDBDateTimeEditEh
          Left = 691
          Top = 70
          Width = 107
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
          TabOrder = 11
          Visible = True
        end
        object N_F_cbRast: TDBCheckBoxEh
          Left = 700
          Top = 243
          Width = 176
          Height = 21
          Caption = #1056#1072#1089#1090#1086#1088#1075#1085#1091#1090' ('#1087#1088#1077#1082#1088#1072#1097#1077#1085')'
          DataField = 'BRAK_RAST'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 29
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = N_F_cbRastClick
        end
        object edON_Voenkom: TDBLookupComboboxEh
          Left = 191
          Top = 124
          Width = 269
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
          TabOrder = 6
          Visible = True
          OnChange = edON_VoenkomChange
        end
        object edONA_VOENKOM: TDBLookupComboboxEh
          Left = 530
          Top = 124
          Width = 269
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
              Hint = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1074#1086#1077#1085#1082#1086#1084#1072#1090' '#1087#1086' '#1084#1077#1089#1090#1091' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
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
          TabOrder = 13
          Visible = True
          OnChange = edONA_VOENKOMChange
        end
        object cbON_VUS: TDBCheckBoxEh
          Left = 168
          Top = 128
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
        object cbONA_VUS: TDBCheckBoxEh
          Left = 508
          Top = 128
          Width = 17
          Height = 17
          Hint = #1042#1086#1077#1085#1085#1086#1086#1073#1103#1079#1072#1085#1085#1072#1103
          DataField = 'ONA_VUS'
          DataSource = dsDokument
          TabOrder = 31
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edMestoRegistr: TDBLookupComboboxEh
          Left = 233
          Top = 529
          Width = 231
          Height = 26
          DataField = 'MESTO'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsMesto
          ParentFont = False
          TabOrder = 32
          Visible = True
        end
        object edPrich18: TDBComboBoxEh
          Left = 11
          Top = 184
          Width = 137
          Height = 26
          Hint = #1055#1088#1080#1095#1080#1085#1072' '#1089#1085#1080#1078#1077#1085#1080#1103' '#1073#1088#1072#1095#1085#1086#1075#1086' '#1074#1086#1079#1088#1072#1089#1090#1072
          TabStop = False
          DataField = 'PRICH18'
          DataSource = dsDokument
          Enabled = False
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
        object edSokrReg: TDBComboBoxEh
          Left = 589
          Top = 529
          Width = 212
          Height = 26
          Hint = #1055#1088#1080#1095#1080#1085#1072' '#1089#1086#1082#1088#1072#1097#1077#1085#1080#1103' '#1089#1088#1086#1082#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          HelpContext = 999
          DataField = 'SOKR_REG'
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
        object edSumPoshlina: TDBNumberEditEh
          Left = 224
          Top = 215
          Width = 105
          Height = 26
          DataField = 'SUM_POSHLINA'
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
        object edTarif: TDBNumberEditEh
          Left = 233
          Top = 556
          Width = 105
          Height = 26
          DataField = 'TARIF'
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
      end
      object tsRast: TTabSheet
        Caption = #1056#1072#1089#1090#1086#1088#1075#1085#1091#1090' ('#1087#1088#1077#1082#1088#1072#1097#1077#1085')'
        ImageIndex = -1
        OnEnter = tsRastEnter
        object Label74: TLabel
          Left = 12
          Top = 409
          Width = 102
          Height = 13
          Caption = #1054#1090#1084#1077#1090#1082#1072' '#1074#1085#1077#1089#1077#1085#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label75: TLabel
          Left = 12
          Top = 331
          Width = 261
          Height = 13
          Caption = #1060#1072#1084#1080#1083#1080#1103' '#1087#1086#1089#1083#1077' '#1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1103' ('#1087#1088#1077#1082#1088#1072#1097#1077#1085#1080#1103')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label78: TLabel
          Left = 322
          Top = 358
          Width = 25
          Height = 13
          Caption = #1054#1085#1072' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label79: TLabel
          Left = 322
          Top = 331
          Width = 18
          Height = 13
          Caption = #1054#1085' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 896
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
        end
        object gbSud: TGroupBox
          Left = 0
          Top = 124
          Width = 896
          Height = 97
          Align = alTop
          Caption = '        '
          TabOrder = 2
          object lb10: TLabel
            Left = 582
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
          object lb11: TLabel
            Left = 60
            Top = 64
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
            Left = 610
            Top = 29
            Width = 121
            Height = 26
            DataField = 'SUDRESH'
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
          object edSudName: TDBEditEh
            Left = 28
            Top = 29
            Width = 540
            Height = 26
            Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1091#1076#1072
            DataField = 'SUDNAME'
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
            OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          end
          object edSudSila: TDBDateTimeEditEh
            Left = 232
            Top = 57
            Width = 121
            Height = 26
            DataField = 'SUDSILA'
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
        object gbZap: TGroupBox
          Left = 0
          Top = 221
          Width = 896
          Height = 92
          Align = alTop
          Caption = '          '
          TabOrder = 3
          DesignSize = (
            896
            92)
          object lb7: TLabel
            Left = 10
            Top = 45
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
            Left = 201
            Top = 45
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
            Left = 361
            Top = 45
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
            Left = 30
            Top = 38
            Width = 155
            Height = 26
            DataField = 'R_NOMER'
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
          object edR_DATE: TDBDateTimeEditEh
            Left = 225
            Top = 38
            Width = 121
            Height = 26
            DataField = 'R_DATE'
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
          object edR_ZAGS: TDBEditEh
            Left = 452
            Top = 38
            Width = 432
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            DataField = 'R_ZAGS'
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
            OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          end
        end
        object gbSmert: TGroupBox
          Left = 0
          Top = 19
          Width = 896
          Height = 105
          Align = alTop
          Caption = '                     '
          TabOrder = 1
          DesignSize = (
            896
            105)
          object lb14: TLabel
            Left = 196
            Top = 57
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
            Left = 360
            Top = 57
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
            Top = 57
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
            Top = 28
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
            Top = 50
            Width = 155
            Height = 26
            HelpContext = 888
            DataField = 'S_NOMER'
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
          object edS_DATE: TDBDateTimeEditEh
            Left = 220
            Top = 50
            Width = 121
            Height = 26
            DataField = 'S_DATE'
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
          object edS_ZAGS: TDBEditEh
            Left = 438
            Top = 50
            Width = 449
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            DataField = 'S_ZAGS'
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
            OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          end
        end
        object rbSmert: TRadioButton
          Left = 15
          Top = 19
          Width = 303
          Height = 17
          Caption = #1073#1088#1072#1082' '#1087#1088#1077#1082#1088#1072#1097#1077#1085' '#1074' '#1089#1074#1103#1079#1080' '#1089#1086' '#1089#1084#1077#1088#1090#1100#1102' '#1089#1091#1087#1088#1091#1075#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          OnClick = rbSmertClick
        end
        object rbSud: TRadioButton
          Left = 15
          Top = 124
          Width = 266
          Height = 17
          Caption = #1088#1072#1089#1090#1086#1088#1075#1085#1091#1090' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1088#1077#1096#1077#1085#1080#1103' '#1089#1091#1076#1072
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          TabStop = True
          OnClick = rbSudClick
        end
        object rbZap: TRadioButton
          Left = 15
          Top = 220
          Width = 394
          Height = 17
          Caption = #1088#1072#1089#1090#1086#1088#1075#1085#1091#1090' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1079#1072#1087#1080#1089#1080' '#1072#1082#1090#1072' '#1086' '#1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1080' '#1073#1088#1072#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          OnClick = rbZapClick
        end
        object edDateOtmRast: TDBDateTimeEditEh
          Left = 435
          Top = 402
          Width = 121
          Height = 26
          HelpContext = 999
          DataField = 'DATE_OTM_RAST'
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
        object edOtmRast: TDBEditEh
          Left = 151
          Top = 402
          Width = 264
          Height = 26
          DataField = 'OTM_RAST'
          DataSource = dsDokument
          EditButtons = <
            item
              Hint = #1042#1099#1073#1088#1072#1090#1100' '#1089#1087#1077#1094#1080#1072#1083#1080#1089#1090#1072
              Style = ebsEllipsisEh
              OnClick = DBEditEh1EditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Visible = True
        end
        object edON_FAM_R: TDBEditEh
          Left = 361
          Top = 327
          Width = 147
          Height = 26
          Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1091#1076#1072
          DataField = 'ON_FAM_R'
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
        object edONA_FAM_R: TDBEditEh
          Left = 361
          Top = 354
          Width = 147
          Height = 26
          Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1091#1076#1072
          DataField = 'ONA_FAM_R'
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
        object rbNed: TRadioButton
          Left = 367
          Top = 124
          Width = 369
          Height = 17
          Caption = #1087#1088#1080#1079#1085#1072#1085' '#1085#1077#1076#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1099#1084' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1088#1077#1096#1077#1085#1080#1103' '#1089#1091#1076#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          OnClick = rbNedClick
        end
      end
      object tsSprav: TTabSheet
        Caption = #1040#1088#1093#1080#1074#1085#1072#1103' '#1089#1087#1088#1072#1074#1082#1072
        ImageIndex = -1
        OnEnter = tsSpravEnter
        object Label37: TLabel
          Left = 16
          Top = 21
          Width = 18
          Height = 13
          Caption = #1058#1080#1087
          Visible = False
        end
        object Label38: TLabel
          Left = 16
          Top = 49
          Width = 43
          Height = 13
          Caption = #1040#1076#1088#1077#1089#1072#1090
        end
        object Label39: TLabel
          Left = 16
          Top = 133
          Width = 31
          Height = 13
          Caption = #1053#1086#1084#1077#1088
        end
        object Label43: TLabel
          Left = 16
          Top = 162
          Width = 26
          Height = 13
          Caption = #1044#1072#1090#1072
        end
        object Label44: TLabel
          Left = 16
          Top = 198
          Width = 120
          Height = 13
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1090#1077#1082#1089#1090
        end
        object edTypeSpr: TDBComboBoxEh
          Left = 72
          Top = 17
          Width = 321
          Height = 26
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = False
        end
        object edAddTextArx: TDBEditEh
          Left = 19
          Top = 217
          Width = 804
          Height = 144
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
          TabOrder = 4
          Visible = True
          WantReturns = True
          WordWrap = True
          OnDblClick = TBItemEditMemoClick
        end
        object edDateArxSpr: TDBDateTimeEditEh
          Left = 72
          Top = 158
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
          TabOrder = 3
          Visible = True
        end
        object edNomerArxSpr: TDBEditEh
          Left = 72
          Top = 129
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
          TabOrder = 2
          Visible = True
        end
        object edAdresat: TDBEditEh
          Left = 72
          Top = 46
          Width = 750
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
          TabOrder = 1
          Visible = True
          WantReturns = True
          WordWrap = True
          OnDblClick = TBItemEditMemoClick
        end
      end
      object tsSvid: TTabSheet
        Caption = #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086
        ImageIndex = -1
        DesignSize = (
          896
          584)
        object Label77: TLabel
          Left = 12
          Top = 17
          Width = 67
          Height = 13
          Caption = #1043#1088#1072#1078#1076#1072#1085#1080#1085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label76: TLabel
          Left = 394
          Top = 17
          Width = 74
          Height = 13
          Caption = #1043#1088#1072#1084#1072#1076#1079#1103#1085'i'#1085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label46: TLabel
          Left = 12
          Top = 224
          Width = 68
          Height = 13
          Caption = #1043#1088#1072#1078#1076#1072#1085#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label47: TLabel
          Left = 394
          Top = 224
          Width = 78
          Height = 13
          Caption = #1043#1088#1072#1084#1072#1076#1079#1103#1085#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label48: TLabel
          Left = 12
          Top = 71
          Width = 70
          Height = 13
          Caption = #1088#1086#1076#1080#1074#1096#1080#1081#1089#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label49: TLabel
          Left = 12
          Top = 94
          Width = 138
          Height = 13
          AutoSize = False
          Caption = #1084#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label50: TLabel
          Left = 26
          Top = 112
          Width = 134
          Height = 13
          Caption = #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072' ('#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1086')'
        end
        object Label51: TLabel
          Left = 26
          Top = 139
          Width = 76
          Height = 13
          Caption = #1086#1073#1083#1072#1089#1090#1100' ('#1082#1088#1072#1081')'
        end
        object Label52: TLabel
          Left = 26
          Top = 166
          Width = 30
          Height = 13
          Caption = #1088#1072#1081#1086#1085
        end
        object Label53: TLabel
          Left = 26
          Top = 193
          Width = 82
          Height = 13
          Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077')'
        end
        object Label54: TLabel
          Left = 12
          Top = 278
          Width = 72
          Height = 13
          Caption = #1088#1086#1076#1080#1074#1096#1072#1103#1089#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label56: TLabel
          Left = 12
          Top = 299
          Width = 171
          Height = 13
          AutoSize = False
          Caption = #1084#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label57: TLabel
          Left = 26
          Top = 317
          Width = 134
          Height = 13
          Caption = #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072' ('#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1086')'
        end
        object Label58: TLabel
          Left = 26
          Top = 344
          Width = 76
          Height = 13
          Caption = #1086#1073#1083#1072#1089#1090#1100' ('#1082#1088#1072#1081')'
        end
        object Label59: TLabel
          Left = 26
          Top = 371
          Width = 30
          Height = 13
          Caption = #1088#1072#1081#1086#1085
        end
        object Label60: TLabel
          Left = 26
          Top = 398
          Width = 82
          Height = 13
          Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077')'
        end
        object Label61: TLabel
          Left = 257
          Top = 423
          Width = 290
          Height = 13
          AutoSize = False
          Caption = #1055#1086#1089#1083#1077' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103' '#1073#1088#1072#1082#1072' '#1087#1088#1080#1089#1074#1086#1077#1085#1099' '#1092#1072#1084#1080#1083#1080#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label62: TLabel
          Left = 29
          Top = 443
          Width = 33
          Height = 13
          Caption = #1084#1091#1078#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label63: TLabel
          Left = 29
          Top = 470
          Width = 32
          Height = 13
          Caption = #1078#1077#1085#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label64: TLabel
          Left = 12
          Top = 507
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
        object edON_Familia_Sv: TDBEditEh
          Left = 104
          Top = 11
          Width = 155
          Height = 26
          HelpContext = 888
          DataField = 'ON_Familia'
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
          Top = 38
          Width = 155
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
          TabOrder = 1
          Visible = True
        end
        object edON_Otch_Sv: TDBEditEh
          Left = 201
          Top = 38
          Width = 155
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
          TabOrder = 2
          Visible = True
        end
        object edON_DateR_Sv: TDBDateTimeEditEh
          Left = 105
          Top = 65
          Width = 100
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
          TabOrder = 3
          Visible = True
          OnEnter = edON_DATEREnter
          OnUpdateData = edON_DATERUpdateData
        end
        object cbOnlyGodON_Sv: TDBCheckBoxEh
          Left = 216
          Top = 69
          Width = 52
          Height = 17
          Hint = #1058#1086#1083#1100#1082#1086' '#1075#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
          Caption = #1043#1086#1076
          DataField = 'ON_ONLYGOD'
          DataSource = dsDokument
          TabOrder = 4
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = cbOnlyGodON_SvClick
        end
        object edON_VOZR_SV: TDBNumberEditEh
          Left = 272
          Top = 65
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
          TabOrder = 5
          Visible = False
        end
        object edON_B_OBL_Sv: TDBCheckBoxEh
          Left = 168
          Top = 137
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ON_B_OBL'
          DataSource = dsDokument
          TabOrder = 26
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edON_GOSUD_Sv: TDBLookupComboboxEh
          Left = 197
          Top = 106
          Width = 190
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
          TabOrder = 6
          Visible = True
        end
        object edON_B_GOROD_Sv: TDBLookupComboboxEh
          Left = 197
          Top = 187
          Width = 46
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
          TabOrder = 9
          Visible = True
        end
        object edON_Gorod_Sv: TDBEditEh
          Left = 250
          Top = 187
          Width = 137
          Height = 26
          DataField = 'ON_GOROD'
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
        object edONA_Familia_Sv: TDBEditEh
          Left = 112
          Top = 218
          Width = 155
          Height = 26
          DataField = 'ONA_Familia'
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
        object edONA_Name_Sv: TDBEditEh
          Left = 23
          Top = 245
          Width = 155
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
          TabOrder = 12
          Visible = True
        end
        object edONA_Otch_Sv: TDBEditEh
          Left = 199
          Top = 245
          Width = 155
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
          TabOrder = 13
          Visible = True
        end
        object edONA_DateR_Sv: TDBDateTimeEditEh
          Left = 103
          Top = 272
          Width = 100
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
          TabOrder = 14
          Visible = True
          OnEnter = edONA_DATEREnter
          OnUpdateData = edON_DATERUpdateData
        end
        object cbOnlyGodONA_Sv: TDBCheckBoxEh
          Left = 213
          Top = 276
          Width = 57
          Height = 17
          Hint = #1058#1086#1083#1100#1082#1086' '#1075#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
          Caption = #1043#1086#1076
          DataField = 'ONA_ONLYGOD'
          DataSource = dsDokument
          TabOrder = 15
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = cbOnlyGodON_SvClick
        end
        object edONA_VOZR_SV: TDBNumberEditEh
          Left = 272
          Top = 272
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
          TabOrder = 16
          Visible = False
        end
        object edONA_B_OBL_Sv: TDBCheckBoxEh
          Left = 170
          Top = 342
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ONA_B_OBL'
          DataSource = dsDokument
          TabOrder = 25
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edONA_GOSUD_Sv: TDBLookupComboboxEh
          Left = 191
          Top = 314
          Width = 190
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
          TabOrder = 17
          Visible = True
        end
        object edONA_B_GOROD_Sv: TDBLookupComboboxEh
          Left = 191
          Top = 395
          Width = 46
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
          TabOrder = 20
          Visible = True
        end
        object edONA_Gorod_Sv: TDBEditEh
          Left = 246
          Top = 395
          Width = 134
          Height = 26
          DataField = 'ONA_GOROD'
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
        object edRukov_Sv: TDBEditEh
          Left = 190
          Top = 504
          Width = 190
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
          TabOrder = 24
          Visible = True
        end
        object edON_FamiliaP_Sv: TDBEditEh
          Left = 190
          Top = 440
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
          TabOrder = 22
          Visible = True
        end
        object edONA_FamiliaP_Sv: TDBEditEh
          Left = 190
          Top = 467
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
          TabOrder = 23
          Visible = True
        end
        object BLR_edON_Familia_B_Sv: TDBEditEh
          Left = 507
          Top = 11
          Width = 155
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
          TabOrder = 27
          Visible = True
        end
        object BLR_edON_Name_B_Sv: TDBEditEh
          Left = 419
          Top = 38
          Width = 155
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
          TabOrder = 28
          Visible = True
        end
        object BLR_edON_Otch_B_Sv: TDBEditEh
          Left = 604
          Top = 38
          Width = 155
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
          TabOrder = 29
          Visible = True
        end
        object edON_GOSUD_B_Sv: TDBLookupComboboxEh
          Left = 424
          Top = 106
          Width = 190
          Height = 26
          Color = clInfoBk
          DataField = 'ON_GOSUD'
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
          ReadOnly = True
          TabOrder = 30
          Visible = True
        end
        object BLR_edON_Gorod_B_Sv: TDBEditEh
          Left = 424
          Top = 187
          Width = 190
          Height = 26
          DataField = 'ON_GOROD_B'
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
        object BLR_edONA_Familia_B_Sv: TDBEditEh
          Left = 507
          Top = 218
          Width = 155
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
          TabOrder = 34
          Visible = True
        end
        object BLR_edONA_Name_B_Sv: TDBEditEh
          Left = 426
          Top = 245
          Width = 155
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
          TabOrder = 35
          Visible = True
        end
        object BLR_edONA_Otch_B_Sv: TDBEditEh
          Left = 602
          Top = 245
          Width = 155
          Height = 26
          DataField = 'ONA_Otch_B'
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
        object edONA_GOSUD_B_Sv: TDBLookupComboboxEh
          Left = 426
          Top = 314
          Width = 190
          Height = 26
          Color = clInfoBk
          DataField = 'ONA_GOSUD'
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
          ReadOnly = True
          TabOrder = 37
          Visible = True
        end
        object BLR_edONA_Gorod_B_Sv: TDBEditEh
          Left = 426
          Top = 395
          Width = 190
          Height = 26
          DataField = 'ONA_GOROD_B'
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
        end
        object BLR_edON_FamiliaP_B_Sv: TDBEditEh
          Left = 425
          Top = 440
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
          TabOrder = 41
          Visible = True
        end
        object BLR_edONA_FamiliaP_B_Sv: TDBEditEh
          Left = 425
          Top = 467
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
          TabOrder = 42
          Visible = True
        end
        object BLR_edRukov_Sv_B: TDBEditEh
          Left = 425
          Top = 504
          Width = 190
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
          TabOrder = 43
          Visible = True
        end
        object BLR_edONA_OBL_R_B_Sv: TDBEditEh
          Left = 426
          Top = 341
          Width = 190
          Height = 26
          DataField = 'ONA_OBL_B'
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
        end
        object BLR_edONA_RAION_R_B_Sv: TDBEditEh
          Left = 426
          Top = 368
          Width = 190
          Height = 26
          DataField = 'ONA_RAION_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 39
          Visible = True
        end
        object BLR_edON_OBL_R_B_Sv: TDBEditEh
          Left = 424
          Top = 133
          Width = 190
          Height = 26
          DataField = 'ON_OBL_B'
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
        object BLR_edON_RAION_R_B_Sv: TDBEditEh
          Left = 424
          Top = 160
          Width = 190
          Height = 26
          DataField = 'ON_RAION_B'
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
        object edON_OBL_R_Sv: TDBEditEh
          Left = 197
          Top = 133
          Width = 190
          Height = 26
          DataField = 'ON_OBL'
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
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edON_RAION_R_Sv: TDBEditEh
          Left = 197
          Top = 160
          Width = 190
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
          TabOrder = 8
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edONA_OBL_R_Sv: TDBEditEh
          Left = 191
          Top = 341
          Width = 190
          Height = 26
          DataField = 'ONA_OBL'
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
        object edONA_RAION_R_Sv: TDBEditEh
          Left = 191
          Top = 368
          Width = 190
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
          TabOrder = 19
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object N_F_cbPovtor: TDBCheckBoxEh
          Left = 774
          Top = 7
          Width = 99
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1055#1054#1042#1058#1054#1056#1053#1054#1045
          DataField = 'POVTOR'
          DataSource = dsDokument
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 44
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
      object tsPovtor: TTabSheet
        Caption = #1055#1086#1074#1090#1086#1088#1085#1099#1077' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072
        ImageIndex = -1
      end
      object tsReshSud: TTabSheet
        Caption = #1056#1077#1096#1077#1085#1080#1103' '#1089#1091#1076#1072' ('#1043#1048#1057' '#1056#1053')'
        ImageIndex = 19
        DesignSize = (
          896
          584)
        object GridRS: TDBGridEh
          Left = 1
          Top = 10
          Width = 890
          Height = 257
          Anchors = [akLeft, akTop, akRight]
          DataSource = dsReshSud
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          ReadOnly = True
          RowHeight = 36
          RowSizingAllowed = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          UseMultiTitle = True
          OnGetCellParams = GridRSGetCellParams
          Columns = <
            item
              EditButtons = <>
              FieldName = 'ID'
              Footers = <>
              KeyList.Strings = (
                'ON'
                'ONA')
              PickList.Strings = (
                #1054#1085
                #1054#1085#1072)
              Title.Caption = #1050#1090#1086
              Width = 40
            end
            item
              EditButtons = <>
              FieldName = 'FIO'
              Footers = <>
              Title.Caption = #1060#1048#1054
              Width = 182
            end
            item
              EditButtons = <>
              FieldName = 'TYPE_RESH'
              Footers = <>
              Title.Caption = #1058#1080#1087
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'DATE_RESH'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072
              Width = 78
            end
            item
              EditButtons = <>
              FieldName = 'TEXT'
              Footers = <>
              Title.Caption = #1056#1077#1096#1077#1085#1080#1077
              Width = 355
            end
            item
              EditButtons = <>
              FieldName = 'SUD'
              Footers = <>
              Title.Caption = #1057#1091#1076
              Width = 287
            end
            item
              EditButtons = <>
              FieldName = 'CANCEL'
              Footers = <>
              Title.Caption = #1054#1090#1084#1077#1085#1072
              Visible = False
            end>
        end
      end
    end
    object pnMain: TPanel
      Left = 0
      Top = 0
      Width = 904
      Height = 32
      Align = alTop
      TabOrder = 0
      DesignSize = (
        904
        32)
      object lbNomer: TLabel
        Left = 8
        Top = 10
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
        Left = 123
        Top = 10
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
      object lbSvid: TLabel
        Left = 261
        Top = 10
        Width = 91
        Height = 13
        Caption = 'C'#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label55: TLabel
        Left = 436
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
      object Label29: TLabel
        Left = 548
        Top = 10
        Width = 12
        Height = 13
        Caption = #1086#1090
      end
      object ImageGISUN: TImage
        Left = 877
        Top = 5
        Width = 20
        Height = 20
        Anchors = [akTop, akRight]
        Transparent = True
      end
      object edNomer: TDBEditEh
        Left = 53
        Top = 3
        Width = 58
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
        Top = 3
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
        Left = 713
        Top = 6
        Width = 119
        Height = 17
        Caption = '1-'#1099#1081' '#1101#1082#1079#1077#1084#1087#1083#1103#1088
        DataField = 'First_Ekz'
        DataSource = dsDokument
        DragCursor = crNo
        TabOrder = 5
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object edSvid_Nomer: TDBEditEh
        Left = 457
        Top = 3
        Width = 80
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
        TabOrder = 3
        Visible = True
      end
      object edDateSV: TDBDateTimeEditEh
        Left = 570
        Top = 3
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
        TabOrder = 4
        Visible = True
        OnEnter = edDateSVEnter
      end
      object edSVID_SERIA: TDBLookupComboboxEh
        Left = 363
        Top = 3
        Width = 64
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
    end
  end
  inherited StBar: TStatusBar
    Top = 697
    Width = 904
  end
  inherited pnAdd: TPanel
    Width = 904
  end
  inherited dsDokument: TDataSource
    Left = 504
    Top = 258
  end
  inherited Dokument: TkbmMemTable
    FieldDefs = <
      item
        Name = 'TYPE_RAST'
        DataType = ftInteger
      end
      item
        Name = 'S_NOMER'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'S_DATE'
        DataType = ftDate
      end
      item
        Name = 'S_ZAGS'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'R_NOMER'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'R_DATE'
        DataType = ftDate
      end
      item
        Name = 'R_ZAGS'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'SUDNAME'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'SUDRESH'
        DataType = ftDate
      end
      item
        Name = 'SUDSILA'
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
        Name = 'ON_Familia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ON_Otch'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'ON_DateR'
        DataType = ftDate
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
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_GRAG'
        DataType = ftString
        Size = 50
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
        Size = 60
      end
      item
        Name = 'ON_SEM'
        DataType = ftInteger
      end
      item
        Name = 'ON_DOKUMENT'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'ON_SVID'
        DataType = ftString
        Size = 70
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
        Name = 'ONA_Otch'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Name'
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
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_GRAG'
        DataType = ftString
        Size = 50
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
        Size = 60
      end
      item
        Name = 'ONA_SEM'
        DataType = ftInteger
      end
      item
        Name = 'ONA_DOKUMENT'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'ONA_SVID'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'DETI'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ON_FamiliaP'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_FamiliaP'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'RUKOV'
        DataType = ftString
        Size = 69
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
        Name = 'ON_ID'
        DataType = ftInteger
      end
      item
        Name = 'ONA_ID'
        DataType = ftInteger
      end
      item
        Name = 'First_Ekz'
        DataType = ftBoolean
      end
      item
        Name = 'DATESV'
        DataType = ftDate
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
        Name = 'ON_OBL_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_RAION_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_GOROD_B'
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
        Name = 'ONA_OBL_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_RAION_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_GOROD_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RUKOV_B'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'OSNOV'
        DataType = ftBoolean
      end
      item
        Name = 'SUD_NAME'
        DataType = ftMemo
      end
      item
        Name = 'SUD_DATE'
        DataType = ftDate
      end
      item
        Name = 'SUD_BRAK'
        DataType = ftMemo
      end
      item
        Name = 'ZAVIT'
        DataType = ftMemo
      end
      item
        Name = 'VOSSTAN'
        DataType = ftBoolean
      end
      item
        Name = 'SPEC'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ID_ZAGS'
        DataType = ftInteger
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'POSHLINA'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'DATEB'
        DataType = ftDate
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
        Name = 'ON_ONLYGOD'
        DataType = ftBoolean
      end
      item
        Name = 'ONA_ONLYGOD'
        DataType = ftBoolean
      end
      item
        Name = 'COPIA'
        DataType = ftBoolean
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
        Name = 'NOMER_EKZ'
        DataType = ftInteger
      end
      item
        Name = 'ARX_ADRESAT'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'ARX_DATE'
        DataType = ftDate
      end
      item
        Name = 'ARX_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ARX_TEXT'
        DataType = ftMemo
      end
      item
        Name = 'ON_GODPR'
        DataType = ftSmallint
      end
      item
        Name = 'ONA_GODPR'
        DataType = ftSmallint
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
        Name = 'TYPE_EKZ'
        DataType = ftInteger
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
        Name = 'POLE_GRN'
        DataType = ftSmallint
      end
      item
        Name = 'ON_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'ONA_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'ON_M_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'ONA_M_B_GOROD'
        DataType = ftSmallint
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
        Name = 'TYPEMESSAGE'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'BRAK_RAST'
        DataType = ftBoolean
      end
      item
        Name = 'ON_VOENKOM'
        DataType = ftInteger
      end
      item
        Name = 'ONA_VOENKOM'
        DataType = ftInteger
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
        Name = 'MESTO'
        DataType = ftInteger
      end
      item
        Name = 'SPEC_B'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PRICH18'
        DataType = ftInteger
      end
      item
        Name = 'SOKR_REG'
        DataType = ftInteger
      end
      item
        Name = 'DETI_COUNT'
        DataType = ftSmallint
      end
      item
        Name = 'POVTOR'
        DataType = ftBoolean
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
        Name = 'IS_GOROD'
        DataType = ftBoolean
      end
      item
        Name = 'SUM_POSHLINA'
        DataType = ftFloat
      end
      item
        Name = 'DATE_ANUL'
        DataType = ftDate
      end
      item
        Name = 'DATE_OTM_RAST'
        DataType = ftDate
      end
      item
        Name = 'ON_M_DOM'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ON_M_KORP'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ON_M_KV'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ONA_M_DOM'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ONA_M_KORP'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ONA_M_KV'
        DataType = ftString
        Size = 5
      end>
    Left = 384
    Top = 250
    object DokumentTYPE_RAST: TIntegerField [0]
      FieldName = 'TYPE_RAST'
    end
    object DokumentS_NOMER: TStringField [1]
      FieldName = 'S_NOMER'
      Size = 30
    end
    object DokumentS_DATE: TDateField [2]
      FieldName = 'S_DATE'
    end
    object DokumentS_ZAGS: TStringField [3]
      FieldName = 'S_ZAGS'
      Size = 200
    end
    object DokumentR_NOMER: TStringField [4]
      FieldName = 'R_NOMER'
      Size = 30
    end
    object DokumentR_DATE: TDateField [5]
      FieldName = 'R_DATE'
    end
    object DokumentR_ZAGS: TStringField [6]
      FieldName = 'R_ZAGS'
      Size = 200
    end
    object DokumentSUDNAME: TStringField [7]
      FieldName = 'SUDNAME'
      Size = 200
    end
    object DokumentSUDRESH: TDateField [8]
      FieldName = 'SUDRESH'
    end
    object DokumentSUDSILA: TDateField [9]
      FieldName = 'SUDSILA'
    end
    object DokumentNOMER: TIntegerField [10]
      FieldName = 'NOMER'
    end
    object DokumentDATEZ: TDateField [11]
      FieldName = 'DATEZ'
    end
    object DokumentSVID_SERIA: TStringField [12]
      FieldName = 'SVID_SERIA'
      Size = 10
    end
    object DokumentSVID_NOMER: TStringField [13]
      FieldName = 'SVID_NOMER'
    end
    object DokumentON_Familia: TStringField [14]
      FieldName = 'ON_Familia'
      Size = 50
    end
    object DokumentON_Familia_B: TStringField [15]
      FieldName = 'ON_Familia_B'
      Size = 50
    end
    object DokumentON_FamiliaP: TStringField [16]
      FieldName = 'ON_FamiliaP'
      Size = 50
    end
    object DokumentON_FamiliaP_B: TStringField [17]
      FieldName = 'ON_FamiliaP_B'
      Size = 50
    end
    object DokumentON_Otch: TStringField [18]
      FieldName = 'ON_Otch'
      Size = 40
    end
    object DokumentON_Otch_B: TStringField [19]
      FieldName = 'ON_Otch_B'
      Size = 40
    end
    object DokumentON_Name: TStringField [20]
      FieldName = 'ON_Name'
      Size = 60
    end
    object DokumentON_Name_B: TStringField [21]
      FieldName = 'ON_Name_B'
      Size = 60
    end
    object DokumentON_GOSUD: TIntegerField [22]
      FieldName = 'ON_GOSUD'
    end
    object DokumentON_DateR: TDateField [23]
      FieldName = 'ON_DateR'
    end
    object DokumentON_OBL: TStringField [24]
      FieldName = 'ON_OBL'
      Size = 30
    end
    object DokumentON_RAION: TStringField [25]
      FieldName = 'ON_RAION'
      Size = 30
    end
    object DokumentON_GOROD: TStringField [26]
      FieldName = 'ON_GOROD'
      Size = 30
    end
    object DokumentON_WORK: TStringField [27]
      FieldName = 'ON_WORK'
      Size = 100
    end
    object DokumentON_OBRAZ: TIntegerField [28]
      FieldName = 'ON_OBRAZ'
    end
    object DokumentON_M_GOSUD: TIntegerField [29]
      FieldName = 'ON_M_GOSUD'
    end
    object DokumentON_M_OBL: TStringField [30]
      FieldName = 'ON_M_OBL'
      Size = 30
    end
    object DokumentON_M_RAION: TStringField [31]
      FieldName = 'ON_M_RAION'
      Size = 30
    end
    object DokumentON_M_GOROD: TStringField [32]
      FieldName = 'ON_M_GOROD'
      Size = 30
    end
    object DokumentON_M_GOROD_R: TStringField [33]
      FieldName = 'ON_M_GOROD_R'
      Size = 60
    end
    object DokumentON_SEM: TIntegerField [34]
      FieldName = 'ON_SEM'
    end
    object DokumentON_DOKUMENT: TStringField [35]
      FieldName = 'ON_DOKUMENT'
      Size = 250
    end
    object DokumentON_SVID: TStringField [36]
      FieldName = 'ON_SVID'
      Size = 70
    end
    object DokumentOTMETKA: TMemoField [37]
      FieldName = 'OTMETKA'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentONA_Familia: TStringField [38]
      FieldName = 'ONA_Familia'
      Size = 50
    end
    object DokumentONA_FamiliaP: TStringField [39]
      FieldName = 'ONA_FamiliaP'
      Size = 50
    end
    object DokumentONA_Familia_B: TStringField [40]
      FieldName = 'ONA_Familia_B'
      Size = 50
    end
    object DokumentONA_FamiliaP_B: TStringField [41]
      FieldName = 'ONA_FamiliaP_B'
      Size = 50
    end
    object DokumentONA_Otch: TStringField [42]
      FieldName = 'ONA_Otch'
      Size = 40
    end
    object DokumentONA_Otch_B: TStringField [43]
      FieldName = 'ONA_Otch_B'
      Size = 40
    end
    object DokumentONA_Name: TStringField [44]
      FieldName = 'ONA_Name'
      Size = 60
    end
    object DokumentONA_Name_B: TStringField [45]
      FieldName = 'ONA_Name_B'
      Size = 60
    end
    object DokumentONA_DateR: TDateField [46]
      FieldName = 'ONA_DateR'
    end
    object DokumentONA_GOSUD: TIntegerField [47]
      FieldName = 'ONA_GOSUD'
    end
    object DokumentONA_OBL: TStringField [48]
      FieldName = 'ONA_OBL'
      Size = 30
    end
    object DokumentONA_RAION: TStringField [49]
      FieldName = 'ONA_RAION'
      Size = 30
    end
    object DokumentONA_GOROD: TStringField [50]
      FieldName = 'ONA_GOROD'
      Size = 30
    end
    object DokumentONA_WORK: TStringField [51]
      FieldName = 'ONA_WORK'
      Size = 100
    end
    object DokumentONA_OBRAZ: TIntegerField [52]
      FieldName = 'ONA_OBRAZ'
    end
    object DokumentONA_M_GOSUD: TIntegerField [53]
      FieldName = 'ONA_M_GOSUD'
    end
    object DokumentONA_M_OBL: TStringField [54]
      FieldName = 'ONA_M_OBL'
      Size = 30
    end
    object DokumentONA_M_RAION: TStringField [55]
      FieldName = 'ONA_M_RAION'
      Size = 30
    end
    object DokumentONA_M_GOROD: TStringField [56]
      FieldName = 'ONA_M_GOROD'
      Size = 30
    end
    object DokumentONA_M_GOROD_R: TStringField [57]
      FieldName = 'ONA_M_GOROD_R'
      Size = 60
    end
    object DokumentONA_SEM: TIntegerField [58]
      FieldName = 'ONA_SEM'
    end
    object DokumentONA_DOKUMENT: TStringField [59]
      FieldName = 'ONA_DOKUMENT'
      Size = 250
    end
    object DokumentONA_SVID: TStringField [60]
      FieldName = 'ONA_SVID'
      Size = 70
    end
    object DokumentDETI: TMemoField [61]
      FieldName = 'DETI'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentRUKOV: TStringField [62]
      FieldName = 'RUKOV'
      Size = 69
    end
    object DokumentON_B_RESP: TBooleanField [63]
      FieldName = 'ON_B_RESP'
    end
    object DokumentON_B_OBL: TBooleanField [64]
      FieldName = 'ON_B_OBL'
    end
    object DokumentON_M_B_RESP: TBooleanField [65]
      FieldName = 'ON_M_B_RESP'
    end
    object DokumentON_M_B_OBL: TBooleanField [66]
      FieldName = 'ON_M_B_OBL'
    end
    object DokumentONA_B_RESP: TBooleanField [67]
      FieldName = 'ONA_B_RESP'
    end
    object DokumentONA_B_OBL: TBooleanField [68]
      FieldName = 'ONA_B_OBL'
    end
    object DokumentONA_M_B_RESP: TBooleanField [69]
      FieldName = 'ONA_M_B_RESP'
    end
    object DokumentONA_M_B_OBL: TBooleanField [70]
      FieldName = 'ONA_M_B_OBL'
    end
    object DokumentON_ID: TIntegerField [71]
      FieldName = 'ON_ID'
    end
    object DokumentONA_ID: TIntegerField [72]
      FieldName = 'ONA_ID'
    end
    object DokumentFirst_Ekz: TBooleanField [73]
      FieldName = 'First_Ekz'
    end
    object DokumentDATESV: TDateField [74]
      FieldName = 'DATESV'
    end
    object DokumentON_OBL_B: TStringField [75]
      FieldName = 'ON_OBL_B'
      Size = 30
    end
    object DokumentON_RAION_B: TStringField [76]
      FieldName = 'ON_RAION_B'
      Size = 30
    end
    object DokumentON_GOROD_B: TStringField [77]
      FieldName = 'ON_GOROD_B'
      Size = 30
    end
    object DokumentONA_OBL_B: TStringField [78]
      FieldName = 'ONA_OBL_B'
      Size = 30
    end
    object DokumentONA_RAION_B: TStringField [79]
      FieldName = 'ONA_RAION_B'
      Size = 30
    end
    object DokumentONA_GOROD_B: TStringField [80]
      FieldName = 'ONA_GOROD_B'
      Size = 30
    end
    object DokumentRUKOV_B: TStringField [81]
      FieldName = 'RUKOV_B'
      Size = 60
    end
    object DokumentOSNOV: TBooleanField [82]
      FieldName = 'OSNOV'
    end
    object DokumentSUD_NAME: TMemoField [83]
      FieldName = 'SUD_NAME'
      BlobType = ftMemo
    end
    object DokumentSUD_DATE: TDateField [84]
      FieldName = 'SUD_DATE'
    end
    object DokumentSUD_BRAK: TMemoField [85]
      FieldName = 'SUD_BRAK'
      BlobType = ftMemo
    end
    object DokumentZAVIT: TMemoField [86]
      FieldName = 'ZAVIT'
      BlobType = ftMemo
    end
    object DokumentVOSSTAN: TBooleanField [87]
      FieldName = 'VOSSTAN'
    end
    object DokumentSPEC: TStringField [88]
      FieldName = 'SPEC'
      Size = 60
    end
    object DokumentID_ZAGS: TIntegerField [89]
      FieldName = 'ID_ZAGS'
    end
    object DokumentPOSHLINA: TStringField [91]
      FieldName = 'POSHLINA'
      Size = 300
    end
    object DokumentDATEB: TDateField [92]
      FieldName = 'DATEB'
    end
    object DokumentOTHER: TMemoField [93]
      FieldName = 'OTHER'
      BlobType = ftMemo
    end
    object DokumentIZMEN: TMemoField [94]
      FieldName = 'IZMEN'
      BlobType = ftMemo
    end
    object DokumentON_ONLYGOD: TBooleanField [95]
      FieldName = 'ON_ONLYGOD'
    end
    object DokumentONA_ONLYGOD: TBooleanField [96]
      FieldName = 'ONA_ONLYGOD'
    end
    object DokumentCOPIA: TBooleanField [97]
      FieldName = 'COPIA'
    end
    object DokumentARX_ADRESAT: TStringField [102]
      FieldName = 'ARX_ADRESAT'
      Size = 300
    end
    object DokumentARX_DATE: TDateField [103]
      FieldName = 'ARX_DATE'
    end
    object DokumentARX_NOMER: TStringField [104]
      FieldName = 'ARX_NOMER'
      Size = 10
    end
    object DokumentARX_TEXT: TMemoField [105]
      FieldName = 'ARX_TEXT'
      BlobType = ftMemo
    end
    object DokumentON_GODPR: TSmallintField [106]
      FieldName = 'ON_GODPR'
    end
    object DokumentONA_GODPR: TSmallintField [107]
      FieldName = 'ONA_GODPR'
    end
    object DokumentON_VOZR: TSmallintField [108]
      FieldName = 'ON_VOZR'
    end
    object DokumentONA_VOZR: TSmallintField [109]
      FieldName = 'ONA_VOZR'
    end
    object DokumentON_M_RNGOROD: TStringField [111]
      FieldName = 'ON_M_RNGOROD'
      Size = 30
    end
    object DokumentONA_M_RNGOROD: TStringField [112]
      FieldName = 'ONA_M_RNGOROD'
      Size = 30
    end
    object DokumentON_M_B_RN: TBooleanField [113]
      FieldName = 'ON_M_B_RN'
    end
    object DokumentONA_M_B_RN: TBooleanField [114]
      FieldName = 'ONA_M_B_RN'
    end
    object DokumentPOLE_GRN: TSmallintField [115]
      FieldName = 'POLE_GRN'
    end
    object DokumentON_B_GOROD: TSmallintField [116]
      FieldName = 'ON_B_GOROD'
    end
    object DokumentONA_B_GOROD: TSmallintField [117]
      FieldName = 'ONA_B_GOROD'
    end
    object DokumentON_M_B_GOROD: TSmallintField [118]
      FieldName = 'ON_M_B_GOROD'
    end
    object DokumentONA_M_B_GOROD: TSmallintField [119]
      FieldName = 'ONA_M_B_GOROD'
    end
    object DokumentON_IDENTIF: TStringField [120]
      FieldName = 'ON_IDENTIF'
      Size = 14
    end
    object DokumentONA_IDENTIF: TStringField [121]
      FieldName = 'ONA_IDENTIF'
      Size = 14
    end
    object DokumentON_STATUS: TStringField [122]
      FieldName = 'ON_STATUS'
      Size = 1
    end
    object DokumentONA_STATUS: TStringField [123]
      FieldName = 'ONA_STATUS'
      Size = 1
    end
    object DokumentON_DOK_TYPE: TSmallintField [124]
      FieldName = 'ON_DOK_TYPE'
    end
    object DokumentON_DOK_SERIA: TStringField [125]
      FieldName = 'ON_DOK_SERIA'
      Size = 7
    end
    object DokumentON_DOK_NOMER: TStringField [126]
      FieldName = 'ON_DOK_NOMER'
      Size = 10
    end
    object DokumentON_DOK_DATE: TDateField [127]
      FieldName = 'ON_DOK_DATE'
    end
    object DokumentON_DOK_ORGAN: TIntegerField [128]
      FieldName = 'ON_DOK_ORGAN'
    end
    object DokumentONA_DOK_TYPE: TSmallintField [129]
      FieldName = 'ONA_DOK_TYPE'
    end
    object DokumentONA_DOK_SERIA: TStringField [130]
      FieldName = 'ONA_DOK_SERIA'
      Size = 7
    end
    object DokumentONA_DOK_NOMER: TStringField [131]
      FieldName = 'ONA_DOK_NOMER'
      Size = 10
    end
    object DokumentONA_DOK_DATE: TDateField [132]
      FieldName = 'ONA_DOK_DATE'
    end
    object DokumentONA_DOK_ORGAN: TIntegerField [133]
      FieldName = 'ONA_DOK_ORGAN'
    end
    object DokumentTYPEMESSAGE: TStringField [134]
      FieldName = 'TYPEMESSAGE'
      Size = 4
    end
    object DokumentBRAK_RAST: TBooleanField [135]
      FieldName = 'BRAK_RAST'
    end
    object DokumentON_VOENKOM: TIntegerField [136]
      FieldName = 'ON_VOENKOM'
      LookupDataSet = SvidPovtor
    end
    object DokumentONA_VOENKOM: TIntegerField [137]
      FieldName = 'ONA_VOENKOM'
    end
    object DokumentON_VUS: TBooleanField [138]
      FieldName = 'ON_VUS'
    end
    object DokumentONA_VUS: TBooleanField [139]
      FieldName = 'ONA_VUS'
    end
    object DokumentMESTO: TIntegerField [140]
      FieldName = 'MESTO'
    end
    object DokumentSPEC_B: TStringField [141]
      FieldName = 'SPEC_B'
      Size = 60
    end
    object DokumentPRICH18: TIntegerField [142]
      FieldName = 'PRICH18'
    end
    object DokumentSOKR_REG: TIntegerField [143]
      FieldName = 'SOKR_REG'
    end
    object DokumentDETI_COUNT: TSmallintField [144]
      FieldName = 'DETI_COUNT'
    end
    object DokumentRN_ON_M_B_GOROD: TStringField [146]
      FieldName = 'RN_ON_M_B_GOROD'
      Size = 10
    end
    object DokumentRN_ON_B_GOROD: TStringField [147]
      FieldName = 'RN_ON_B_GOROD'
      Size = 10
    end
    object DokumentRN_ONA_M_B_GOROD: TStringField [148]
      FieldName = 'RN_ONA_M_B_GOROD'
      Size = 10
    end
    object DokumentRN_ONA_B_GOROD: TStringField [149]
      FieldName = 'RN_ONA_B_GOROD'
      Size = 10
    end
    object DokumentSUM_POSHLINA: TFloatField [151]
      FieldName = 'SUM_POSHLINA'
      DisplayFormat = '### ### ### ##0.#0'
    end
    object DokumentDATE_OTM_RAST: TDateField [153]
      FieldName = 'DATE_OTM_RAST'
    end
    object DokumentON_M_DOM: TStringField [154]
      FieldName = 'ON_M_DOM'
      Size = 10
    end
    object DokumentON_M_KORP: TStringField [155]
      FieldName = 'ON_M_KORP'
      Size = 7
    end
    object DokumentON_M_KV: TStringField [156]
      FieldName = 'ON_M_KV'
      Size = 10
    end
    object DokumentONA_M_DOM: TStringField [157]
      FieldName = 'ONA_M_DOM'
      Size = 10
    end
    object DokumentONA_M_KORP: TStringField [158]
      FieldName = 'ONA_M_KORP'
      Size = 7
    end
    object DokumentONA_M_KV: TStringField [159]
      FieldName = 'ONA_M_KV'
      Size = 10
    end
    object DokumentOTM_RAST: TStringField [160]
      FieldName = 'OTM_RAST'
      Size = 100
    end
    object DokumentON_FAM_R: TStringField [161]
      FieldName = 'ON_FAM_R'
      Size = 50
    end
    object DokumentONA_FAM_R: TStringField [162]
      FieldName = 'ONA_FAM_R'
      Size = 50
    end
    object DokumentTARIF: TFloatField [168]
      FieldName = 'TARIF'
      DisplayFormat = '###.#0'
    end
    object DokumentON_GRAG_ADD: TMemoField [169]
      FieldName = 'ON_GRAG_ADD'
      BlobType = ftMemo
    end
    object DokumentONA_GRAG_ADD: TMemoField [170]
      FieldName = 'ONA_GRAG_ADD'
      BlobType = ftMemo
    end
    object DokumentON_GRAG: TIntegerField [171]
      FieldName = 'ON_GRAG'
    end
    object DokumentON_NATION: TIntegerField [172]
      FieldName = 'ON_NATION'
    end
    object DokumentONA_GRAG: TIntegerField [173]
      FieldName = 'ONA_GRAG'
    end
    object DokumentONA_NATION: TIntegerField [174]
      FieldName = 'ONA_NATION'
    end
    object DokumentON_SOATO: TStringField [175]
      FieldName = 'ON_SOATO'
      Size = 10
    end
    object DokumentONA_SOATO: TStringField [176]
      FieldName = 'ONA_SOATO'
      Size = 10
    end
    object DokumentDECL_ID: TIntegerField [177]
      FieldName = 'DECL_ID'
    end
    object DokumentDECLARE_ID: TIntegerField [178]
      DisplayLabel = 'ID '#1079#1072#1103#1074#1083#1077#1085#1080#1103' '#1086' '#1073#1088#1072#1082#1077
      FieldName = 'DECLARE_ID'
    end
    object DokumentS_ZAGS_B: TStringField [179]
      FieldName = 'S_ZAGS_B'
      Size = 200
    end
    object DokumentR_ZAGS_B: TStringField [180]
      FieldName = 'R_ZAGS_B'
      Size = 200
    end
    object DokumentSUDNAME_B: TStringField [181]
      FieldName = 'SUDNAME_B'
      Size = 200
    end
    object DokumentDETIasSTR: TBooleanField
      FieldName = 'DETIasSTR'
    end
    object DokumentON_REG_DATE_TILL: TDateField
      FieldName = 'ON_REG_DATE_TILL'
    end
    object DokumentON_REG_DATE: TDateField
      FieldName = 'ON_REG_DATE'
    end
    object DokumentONA_REG_DATE_TILL: TDateField
      FieldName = 'ONA_REG_DATE_TILL'
    end
    object DokumentONA_REG_DATE: TDateField
      FieldName = 'ONA_REG_DATE'
    end
    object DokumentON_SEM_DOK: TMemoField
      FieldName = 'ON_SEM_DOK'
      BlobType = ftMemo
    end
    object DokumentONA_SEM_DOK: TMemoField
      FieldName = 'ONA_SEM_DOK'
      BlobType = ftMemo
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
  object dsDeti: TDataSource [9]
    DataSet = tbDeti
    OnDataChange = dsDetiDataChange
    Left = 616
    Top = 469
  end
  object tbDeti: TkbmMemTable [10]
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
    Left = 768
    Top = 469
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
  object dsNation: TDataSource [11]
    DataSet = dmBase.SprNac
    Left = 452
    Top = 265
  end
  object dsStran: TDataSource [12]
    DataSet = dmBase.SprStran
    Left = 652
    Top = 281
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 488
    Top = 418
  end
  object dsGragd: TDataSource [14]
    Left = 828
    Top = 315
  end
  inherited HistZAGS: TkbmMemTable
    Left = 512
    Top = 138
  end
  inherited dsSeria: TDataSource
    Left = 840
    Top = 306
  end
  inherited dsObl: TDataSource
    Left = 744
    Top = 330
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 608
    Top = 146
  end
  inherited dsPovtor: TDataSource
    Left = 568
    Top = 498
  end
  inherited dsRN: TDataSource
    Left = 704
    Top = 298
  end
  inherited dsGorod: TDataSource
    Left = 728
    Top = 266
  end
  inherited dsRnGor: TDataSource
    Left = 632
    Top = 514
  end
  inherited dsTypeGorod: TDataSource
    Left = 472
    Top = 458
  end
  inherited ImGISUN: TImageList
    Left = 548
    Top = 283
  end
  inherited dsVoenkom: TDataSource
    Left = 664
    Top = 330
  end
  inherited dsRovd: TDataSource
    Left = 784
    Top = 322
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 704
    Top = 154
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 480
    Top = 210
  end
  inherited tbReshSud: TkbmMemTable
    Left = 752
  end
  object dsMesto: TDataSource
    Left = 372
    Top = 475
  end
  object dsReshSud: TDataSource
    DataSet = tbReshSud
    Left = 60
    Top = 284
  end
end
