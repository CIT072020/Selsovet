inherited fmDeclBrak: TfmDeclBrak
  Left = 464
  Top = 189
  ActiveControl = edNomer
  Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077' '#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103' '#1073#1088#1072#1082#1072
  ClientHeight = 732
  ClientWidth = 902
  Constraints.MinHeight = 770
  Icon.Data = {
    0000010001001010000001000400280100001600000028000000100000002000
    0000010004000000000080000000000000000000000000000000000000000000
    0000800000000080000080800000000080008000800000808000C0C0C0008080
    8000FF00000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF000000
    00000000000000000000040800000000000044408800000FF04444444080000F
    0CCCC4444408000F4CCCCC444440000F4FCCCCCC4440000F4FCCC4CC4440000F
    0CFC40CC4400000FF0440F0C4000000FFFFFFFFF0000000FFFFFF0000000000F
    FFFFF0F00000000FFFFFF000000000000000000000000000000000000000FF9F
    0000FF0F0000C0030000C0010000C0000000C0000000C0000000C0000000C001
    0000C0030000C0070000C0070000C00F0000C01F0000C03F0000FFFF0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 26
    Width = 902
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
    Width = 902
    Height = 657
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 902
    inherited TBToolbar: TTBToolbar
      object TBItemChoiceMen: TTBItem [2]
        Caption = #1042#1099#1073#1088#1072#1090#1100
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072
        ImageIndex = 44
        Visible = False
      end
      object TBItemArxSpr: TTBItem [9]
        AutoCheck = True
        Caption = #1057#1087#1088#1072#1074#1082#1072
        Hint = #1040#1088#1093#1080#1074#1085#1072#1103' '#1089#1087#1088#1072#1074#1082#1072
        ImageIndex = 45
        Visible = False
        OnClick = TBItemArxSprClick
      end
      inherited TBItemDelList: TTBItem
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1089#1090#1088#1086#1082#1091'  '#1074' '#1089#1087#1080#1089#1082#1077' '#1076#1077#1090#1077#1081' Ctrl-Del'
      end
      object TBItemVozrast: TTBItem [13]
        AutoCheck = True
        Caption = #1042#1086#1079#1088#1072#1089#1090
        Hint = #1058#1086#1083#1100#1082#1086' '#1074#1086#1079#1088#1072#1089#1090
        ImageIndex = 109
        Visible = False
        OnClick = TBItemVozrastClick
      end
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      inherited TBItemZAGS: TTBItem
        Visible = False
      end
      inherited TBItemShablon: TTBItem
        Visible = True
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 299
        inherited edZAGS: TDBEditEh
          TabStop = False
        end
      end
    end
  end
  inherited sb: TScrollBox
    Top = 53
    Width = 902
    Height = 657
    Align = alClient
    TabOrder = 2
    inherited pnPovtor: TPanel
      TabOrder = 2
    end
    inherited N_F_edTypeEkz: TComboBox
      TabOrder = 3
    end
    object pc: TPageControl
      Left = 0
      Top = 32
      Width = 902
      Height = 625
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
          894
          596)
        object Label1: TLabel
          Left = 3
          Top = 10
          Width = 63
          Height = 13
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
          Left = 321
          Top = -1
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
          Left = 694
          Top = -1
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
        object Label5: TLabel
          Left = 3
          Top = 74
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
          Left = 3
          Top = 101
          Width = 145
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
          Left = 3
          Top = 128
          Width = 145
          Height = 13
          AutoSize = False
          Caption = '4. '#1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 3
          Top = 142
          Width = 150
          Height = 13
          AutoSize = False
          Caption = '5. '#1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 18
          Top = 155
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
          Left = 18
          Top = 182
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
        object Label11: TLabel
          Left = 18
          Top = 209
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
        object Label12: TLabel
          Left = 18
          Top = 236
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
        object Label13: TLabel
          Left = 3
          Top = 263
          Width = 145
          Height = 13
          AutoSize = False
          Caption = '6. '#1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 3
          Top = 318
          Width = 150
          Height = 13
          AutoSize = False
          Caption = '7. '#1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 3
          Top = 345
          Width = 161
          Height = 13
          AutoSize = False
          Caption = '8. '#1043#1076#1077' '#1080' '#1082#1077#1084' '#1088#1072#1073#1086#1090#1072#1077#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 3
          Top = 372
          Width = 165
          Height = 13
          AutoSize = False
          Caption = '9. '#1054#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 3
          Top = 386
          Width = 132
          Height = 13
          Caption = '10. '#1052#1077#1089#1090#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 18
          Top = 401
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
          Left = 18
          Top = 426
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
          Left = 18
          Top = 452
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
          Left = 18
          Top = 479
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
          Left = 18
          Top = 506
          Width = 86
          Height = 13
          Caption = #1088'-'#1086#1085'  '#1075#1086#1088'., '#1091#1083#1080#1094#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label45: TLabel
          Left = 18
          Top = 561
          Width = 129
          Height = 13
          Caption = #1089' '#1082#1072#1082#1086#1075#1086' '#1075#1086#1076#1072' '#1087#1088#1086#1078#1080#1074#1072#1077#1090
        end
        object Label42: TLabel
          Left = 270
          Top = 561
          Width = 44
          Height = 13
          Caption = #1090#1077#1083#1077#1092#1086#1085
        end
        object Label43: TLabel
          Left = 642
          Top = 561
          Width = 44
          Height = 13
          Caption = #1090#1077#1083#1077#1092#1086#1085
        end
        object Label66: TLabel
          Left = 154
          Top = 533
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
          Left = 246
          Top = 533
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
          Left = 337
          Top = 533
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
          Left = 532
          Top = 533
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
          Left = 617
          Top = 533
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
          Left = 708
          Top = 533
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
        object Label4: TLabel
          Left = 19
          Top = 23
          Width = 141
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
        object Label33: TLabel
          Left = 19
          Top = 47
          Width = 147
          Height = 13
          Caption = #1087#1086#1089#1083#1077' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103' '#1073#1088#1072#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbON_REG_DATE_TILL: TvchDBText
          Left = 188
          Top = 580
          Width = 301
          Height = 15
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
          Left = 560
          Top = 579
          Width = 281
          Height = 16
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
        object edON_Familia: TDBEditEh
          Left = 185
          Top = 13
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
          OnEnter = edON_FamiliaEnter
        end
        object edONA_Familia: TDBEditEh
          Left = 558
          Top = 13
          Width = 145
          Height = 26
          DataField = 'ONA_Familia'
          DataSource = dsDokument
          EditButtons = <
            item
              Style = ebsGlyphEh
              Width = 20
              OnClick = edONA_FamiliaEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 28
          Visible = True
          OnEnter = edONA_FamiliaEnter
        end
        object edON_Name: TDBEditEh
          Left = 185
          Top = 67
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
          OnEnter = edON_NameEnter
        end
        object edON_OTCH: TDBEditEh
          Left = 185
          Top = 94
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
          OnEnter = edON_OTCHEnter
        end
        object edONA_Name: TDBEditEh
          Left = 558
          Top = 67
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
          TabOrder = 30
          Visible = True
          OnEnter = edONA_NameEnter
        end
        object edONA_OTCH: TDBEditEh
          Left = 558
          Top = 94
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
          TabOrder = 31
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edONA_OTCHEnter
        end
        object edON_DATER: TDBDateTimeEditEh
          Left = 185
          Top = 121
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
          TabOrder = 4
          Visible = True
          OnUpdateData = edON_DATERUpdateData
        end
        object edONA_DATER: TDBDateTimeEditEh
          Left = 558
          Top = 121
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
          TabOrder = 32
          Visible = True
          OnUpdateData = edONA_DATERUpdateData
        end
        object edON_GOSUD: TDBLookupComboboxEh
          Left = 185
          Top = 148
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
          TabOrder = 6
          Visible = True
        end
        object edONA_GOSUD: TDBLookupComboboxEh
          Left = 558
          Top = 148
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
        object edON_GOROD: TDBEditEh
          Left = 185
          Top = 229
          Width = 145
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
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edONA_GOROD: TDBEditEh
          Left = 558
          Top = 229
          Width = 145
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
          TabOrder = 38
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edON_NATION: TDBLookupComboboxEh
          Left = 186
          Top = 256
          Width = 297
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
          TabOrder = 11
          Visible = True
        end
        object edON_M_GOSUD: TDBLookupComboboxEh
          Left = 186
          Top = 392
          Width = 297
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
        end
        object edON_M_GOROD: TDBEditEh
          Left = 278
          Top = 473
          Width = 205
          Height = 26
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
        end
        object edON_GRAG: TDBLookupComboboxEh
          Left = 186
          Top = 311
          Width = 297
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
          Left = 186
          Top = 338
          Width = 297
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
          Left = 186
          Top = 365
          Width = 297
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
          Left = 186
          Top = 500
          Width = 297
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
        end
        object edONA_NATION: TDBLookupComboboxEh
          Left = 558
          Top = 256
          Width = 297
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
          Left = 558
          Top = 392
          Width = 297
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
          TabOrder = 44
          Visible = True
        end
        object edONA_M_GOROD: TDBEditEh
          Left = 650
          Top = 473
          Width = 205
          Height = 26
          DataField = 'ONA_M_GOROD'
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
        object edONA_GRAG: TDBLookupComboboxEh
          Left = 558
          Top = 311
          Width = 297
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
          TabOrder = 41
          Visible = True
        end
        object edONA_WORK: TDBEditEh
          Left = 558
          Top = 338
          Width = 297
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
          TabOrder = 42
          Visible = True
        end
        object edONA_OBRAZ: TDBComboBoxEh
          Left = 558
          Top = 365
          Width = 297
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
          TabOrder = 43
          Visible = True
        end
        object edONA_M_GOROD_R: TDBEditEh
          Left = 558
          Top = 500
          Width = 297
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
          TabOrder = 50
          Visible = True
        end
        object DBCheckBoxEh1: TDBCheckBoxEh
          Left = 164
          Top = 153
          Width = 15
          Height = 17
          DataField = 'ON_B_RESP'
          DataSource = dsDokument
          TabOrder = 56
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object DBCheckBoxEh2: TDBCheckBoxEh
          Left = 164
          Top = 180
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ON_B_OBL'
          DataSource = dsDokument
          TabOrder = 57
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBoxEh4: TDBCheckBoxEh
          Left = 537
          Top = 153
          Width = 15
          Height = 17
          DataField = 'ONA_B_RESP'
          DataSource = dsDokument
          TabOrder = 58
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object DBCheckBoxEh5: TDBCheckBoxEh
          Left = 537
          Top = 180
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ONA_B_OBL'
          DataSource = dsDokument
          TabOrder = 59
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBoxEh7: TDBCheckBoxEh
          Left = 164
          Top = 397
          Width = 15
          Height = 17
          DataField = 'ON_M_B_RESP'
          DataSource = dsDokument
          TabOrder = 60
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object DBCheckBoxEh8: TDBCheckBoxEh
          Left = 164
          Top = 424
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ON_M_B_OBL'
          DataSource = dsDokument
          TabOrder = 61
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBoxEh10: TDBCheckBoxEh
          Left = 536
          Top = 397
          Width = 15
          Height = 17
          DataField = 'ONA_M_B_RESP'
          DataSource = dsDokument
          TabOrder = 62
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object DBCheckBoxEh11: TDBCheckBoxEh
          Left = 536
          Top = 424
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ONA_M_B_OBL'
          DataSource = dsDokument
          TabOrder = 63
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object cbOnlyGodON: TDBCheckBoxEh
          Left = 296
          Top = 126
          Width = 57
          Height = 17
          Hint = #1058#1086#1083#1100#1082#1086' '#1075#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
          Caption = #1043#1086#1076
          DataField = 'ON_ONLYGOD'
          DataSource = dsDokument
          TabOrder = 64
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
          OnClick = cbOnlyGodONClick
        end
        object cbOnlyGodONA: TDBCheckBoxEh
          Left = 668
          Top = 126
          Width = 57
          Height = 17
          Hint = #1058#1086#1083#1100#1082#1086' '#1075#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
          Caption = #1043#1086#1076
          DataField = 'ONA_ONLYGOD'
          DataSource = dsDokument
          TabOrder = 65
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
          OnClick = cbOnlyGodONClick
        end
        object edON_GODPR: TDBNumberEditEh
          Left = 186
          Top = 555
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
          MaxValue = 2100.000000000000000000
          MinValue = 1900.000000000000000000
          ParentFont = False
          TabOrder = 26
          Visible = True
        end
        object edONA_GODPR: TDBNumberEditEh
          Left = 558
          Top = 555
          Width = 53
          Height = 26
          DataField = 'ONA_GODPR'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxValue = 2100.000000000000000000
          MinValue = 1900.000000000000000000
          ParentFont = False
          TabOrder = 54
          Visible = True
        end
        object edON_VOZR: TDBNumberEditEh
          Left = 352
          Top = 121
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
        object edONA_VOZR: TDBNumberEditEh
          Left = 727
          Top = 121
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
          Left = 330
          Top = 500
          Width = 166
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
        end
        object edONA_M_RNGOROD: TDBLookupComboboxEh
          Left = 707
          Top = 500
          Width = 151
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
          TabOrder = 49
          Visible = True
          OnNotInList = edON_M_RNGORODNotInList
        end
        object edON_NATION_DOK: TDBEditEh
          Left = 186
          Top = 284
          Width = 297
          Height = 26
          DataField = 'ON_NATION_DOK'
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
        object edONA_NATION_DOK: TDBEditEh
          Left = 558
          Top = 284
          Width = 297
          Height = 26
          DataField = 'ONA_NATION_DOK'
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
        object edON_TELEFON: TDBEditEh
          Left = 333
          Top = 555
          Width = 150
          Height = 26
          DataField = 'ON_TELEFON'
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
        object edONA_TELEFON: TDBEditEh
          Left = 705
          Top = 555
          Width = 150
          Height = 26
          HelpType = htKeyword
          HelpContext = 999
          DataField = 'ONA_TELEFON'
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
        object edON_B_GOROD: TDBLookupComboboxEh
          Left = 132
          Top = 229
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
        object edONA_B_GOROD: TDBLookupComboboxEh
          Left = 505
          Top = 229
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
          Left = 186
          Top = 473
          Width = 63
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
          Left = 558
          Top = 473
          Width = 63
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
          TabOrder = 47
          Visible = True
        end
        object N_F_cbBelorus: TDBCheckBoxEh
          Left = 839
          Top = -3
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
          TabOrder = 66
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
          OnClick = N_F_cbBelorusClick
        end
        object edON_M_DOM: TDBEditEh
          Left = 186
          Top = 527
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
          Left = 283
          Top = 527
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
          Left = 360
          Top = 527
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
          Left = 558
          Top = 527
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
          TabOrder = 51
          Visible = True
        end
        object edONA_M_KORP: TDBEditEh
          Left = 654
          Top = 527
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
          TabOrder = 52
          Visible = True
        end
        object edONA_M_KV: TDBEditEh
          Left = 731
          Top = 527
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
          TabOrder = 53
          Visible = True
        end
        object edON_OBL_R: TDBEditEh
          Left = 185
          Top = 175
          Width = 145
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
        object edON_RAION_R: TDBEditEh
          Left = 185
          Top = 202
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
          TabOrder = 8
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edONA_OBL_R: TDBEditEh
          Left = 558
          Top = 175
          Width = 145
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
          TabOrder = 35
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edONA_RAION_R: TDBEditEh
          Left = 558
          Top = 202
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
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edON_M_OBL: TDBEditEh
          Left = 186
          Top = 419
          Width = 297
          Height = 26
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
        end
        object edON_M_RAION: TDBEditEh
          Left = 186
          Top = 446
          Width = 297
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
        end
        object edONA_M_OBL: TDBEditEh
          Left = 558
          Top = 419
          Width = 297
          Height = 26
          DataField = 'ONA_M_OBL'
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
        object edONA_M_RAION: TDBEditEh
          Left = 558
          Top = 446
          Width = 297
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
          TabOrder = 46
          Visible = True
        end
        object edON_FamiliaP: TDBEditEh
          Left = 185
          Top = 40
          Width = 145
          Height = 21
          DataField = 'ON_FamiliaP'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object BLR_edON_FamiliaP: TDBEditEh
          Left = 339
          Top = 40
          Width = 145
          Height = 21
          DataField = 'ON_FamiliaP_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 68
          Visible = True
        end
        object BLR_edON_Familia: TDBEditEh
          Left = 339
          Top = 13
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
          TabOrder = 67
          Visible = True
        end
        object BLR_edON_Name: TDBEditEh
          Left = 339
          Top = 67
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
          TabOrder = 69
          Visible = True
        end
        object BLR_edON_Otch: TDBEditEh
          Left = 339
          Top = 94
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
          TabOrder = 70
          Visible = True
        end
        object edONA_FamiliaP: TDBEditEh
          Left = 558
          Top = 40
          Width = 145
          Height = 21
          DataField = 'ONA_FamiliaP'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 29
          Visible = True
        end
        object BLR_edONA_Familia: TDBEditEh
          Left = 715
          Top = 13
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
          TabOrder = 75
          Visible = True
        end
        object BLR_edONA_FamiliaP: TDBEditEh
          Left = 715
          Top = 40
          Width = 145
          Height = 21
          DataField = 'ONA_FamiliaP_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 76
          Visible = True
        end
        object BLR_edONA_Name: TDBEditEh
          Left = 715
          Top = 67
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
          TabOrder = 77
          Visible = True
        end
        object BLR_edONA_Otch: TDBEditEh
          Left = 715
          Top = 94
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
          TabOrder = 78
          Visible = True
        end
        object BLR_edON_GOSUD: TDBLookupComboboxEh
          Left = 339
          Top = 148
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
          TabOrder = 71
          Visible = True
        end
        object BLR_edON_OBL: TDBEditEh
          Left = 339
          Top = 175
          Width = 145
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
          TabOrder = 72
          Visible = True
        end
        object BLR_edON_RAION: TDBEditEh
          Left = 339
          Top = 202
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
          TabOrder = 73
          Visible = True
        end
        object BLR_edON_Gorod: TDBEditEh
          Left = 339
          Top = 229
          Width = 145
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
          TabOrder = 74
          Visible = True
        end
        object BLR_edONA_Gosud: TDBLookupComboboxEh
          Left = 715
          Top = 148
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
          TabOrder = 79
          Visible = True
        end
        object BLR_edONA_OBL: TDBEditEh
          Left = 715
          Top = 175
          Width = 145
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
          TabOrder = 80
          Visible = True
        end
        object BLR_edONA_RAION: TDBEditEh
          Left = 715
          Top = 202
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
          TabOrder = 81
          Visible = True
        end
        object BLR_edONA_Gorod: TDBEditEh
          Left = 715
          Top = 229
          Width = 145
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
          TabOrder = 82
          Visible = True
        end
      end
      object tsTail2: TTabSheet
        Caption = #1063#1072#1089#1090#1100' 2'
        ImageIndex = -1
        DesignSize = (
          894
          596)
        object Label24: TLabel
          Left = 8
          Top = 20
          Width = 145
          Height = 13
          Caption = '12. '#1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label25: TLabel
          Left = 254
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
          Left = 675
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
          Top = 128
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
        object Label7: TLabel
          Left = 8
          Top = 67
          Width = 154
          Height = 26
          Caption = '13. '#1054#1090#1085#1086#1096#1077#1085#1080#1077' '#1082' '#1074#1086#1080#1085#1089#1082#1086#1081' '#1089#1083#1091#1078#1073#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label29: TLabel
          Left = 337
          Top = 154
          Width = 12
          Height = 13
          Caption = #1086#1090
        end
        object Label32: TLabel
          Left = 686
          Top = 154
          Width = 12
          Height = 13
          Caption = #1086#1090
        end
        object Label35: TLabel
          Left = 75
          Top = 44
          Width = 87
          Height = 13
          Caption = #1076#1086#1082#1091#1084'. '#1087#1086#1076#1090#1074'. '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label44: TLabel
          Left = 8
          Top = 261
          Width = 63
          Height = 13
          Caption = #1057#1074#1080#1076#1077#1090#1077#1083#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label47: TLabel
          Left = 8
          Top = 207
          Width = 163
          Height = 13
          Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label48: TLabel
          Left = 8
          Top = 232
          Width = 180
          Height = 16
          AutoSize = False
          Caption = '15. '#1054#1090#1084#1077#1090#1082#1072' '#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label34: TLabel
          Left = 9
          Top = 514
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
        object lbRukov: TvchDBText
          Left = 7
          Top = 405
          Width = 506
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
        object N_F_lbON_SEM: TvchDBText
          Left = 376
          Top = 20
          Width = 153
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
          Left = 726
          Top = 20
          Width = 166
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
          Left = 195
          Top = 174
          Width = 326
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
          TabOrder = 9
          Visible = True
        end
        object edONA_DOKUMENT: TDBEditEh
          Left = 546
          Top = 174
          Width = 326
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
          TabOrder = 21
          Visible = True
        end
        object edON_SEM: TDBComboBoxEh
          Left = 195
          Top = 14
          Width = 176
          Height = 26
          HelpContext = 888
          DataField = 'ON_SEM'
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
        object edONA_SEM: TDBComboBoxEh
          Left = 546
          Top = 14
          Width = 176
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
          TabOrder = 12
          Visible = True
        end
        object edON_VUS: TDBComboBoxEh
          Left = 195
          Top = 67
          Width = 176
          Height = 26
          DataField = 'ON_VUS'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            #1074#1086#1077#1085#1085#1086#1086#1073#1103#1079#1072#1085#1085#1099#1081
            #1085#1077#1074#1086#1077#1085#1085#1086#1086#1073#1103#1079#1072#1085#1085#1099#1081)
          KeyItems.Strings = (
            '1'
            '0')
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object edONA_VUS: TDBComboBoxEh
          Left = 546
          Top = 67
          Width = 176
          Height = 26
          DataField = 'ONA_VUS'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            #1074#1086#1077#1085#1085#1086#1086#1073#1103#1079#1072#1085#1085#1099#1081
            #1085#1077#1074#1086#1077#1085#1085#1086#1086#1073#1103#1079#1072#1085#1085#1099#1081)
          KeyItems.Strings = (
            '1'
            '0')
          ParentFont = False
          TabOrder = 14
          Visible = True
        end
        object edON_VUS_KOMISS: TDBEditEh
          Left = 3
          Top = 94
          Width = 62
          Height = 26
          DataField = 'ON_VUS_KOMISS'
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
        object edONA_VUS_KOMISS: TDBEditEh
          Left = 78
          Top = 94
          Width = 51
          Height = 26
          DataField = 'ONA_VUS_KOMISS'
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
        object edON_DOK_SERIA: TDBEditEh
          Left = 195
          Top = 147
          Width = 33
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
          TabOrder = 6
          Visible = True
        end
        object edON_DOK_NOMER: TDBEditEh
          Left = 240
          Top = 147
          Width = 89
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
          TabOrder = 7
          Visible = True
        end
        object edON_DOK_DATE: TDBDateTimeEditEh
          Left = 359
          Top = 147
          Width = 107
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
          TabOrder = 8
          Visible = True
        end
        object edONA_DOK_DATE: TDBDateTimeEditEh
          Left = 710
          Top = 147
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
          TabOrder = 20
          Visible = True
        end
        object edONA_DOK_SERIA: TDBEditEh
          Left = 546
          Top = 147
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
          TabOrder = 18
          Visible = True
        end
        object edONA_DOK_NOMER: TDBEditEh
          Left = 591
          Top = 147
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
          TabOrder = 19
          Visible = True
        end
        object edON_DOK_TYPE: TDBComboBoxEh
          Left = 195
          Top = 120
          Width = 326
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
          TabOrder = 5
          Visible = True
        end
        object edONA_DOK_TYPE: TDBComboBoxEh
          Left = 546
          Top = 120
          Width = 326
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
          TabOrder = 17
          Visible = True
        end
        object edON_SEM_DOK: TDBEditEh
          Left = 195
          Top = 40
          Width = 326
          Height = 26
          Hint = #1044#1086#1082#1091#1084#1077#1085#1090' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1072#1102#1097#1080#1081' '#1087#1088#1077#1082#1088#1072#1097#1077#1085#1080#1077' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1073#1088#1072#1082#1072
          DataField = 'ON_SEM_DOK'
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
        object edONA_SEM_DOK: TDBEditEh
          Left = 546
          Top = 40
          Width = 326
          Height = 26
          Hint = #1044#1086#1082#1091#1084#1077#1085#1090' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1072#1102#1097#1080#1081' '#1087#1088#1077#1082#1088#1072#1097#1077#1085#1080#1077' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1073#1088#1072#1082#1072
          DataField = 'ONA_SEM_DOK'
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
        object N_F_cbTorgest: TDBCheckBoxEh
          Left = 535
          Top = 452
          Width = 205
          Height = 17
          Caption = #1074' '#1090#1086#1088#1078#1077#1089#1090#1074#1077#1085#1085#1086#1081' '#1086#1073#1089#1090#1072#1085#1086#1074#1082#1077
          DataField = 'OSNOV'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 27
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object N_F_Bel: TDBCheckBoxEh
          Left = 535
          Top = 432
          Width = 234
          Height = 17
          Caption = #1085#1072' '#1073#1077#1083#1086#1088#1091#1089#1089#1082#1086#1084' '#1103#1079#1099#1082#1077
          DataField = 'BELORUS'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 28
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edON_SVID: TDBEditEh
          Left = 195
          Top = 254
          Width = 326
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
          TabOrder = 24
          Visible = True
        end
        object edONA_SVID: TDBEditEh
          Left = 547
          Top = 254
          Width = 326
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
          TabOrder = 25
          Visible = True
        end
        object edON_DOK_OTM: TDBEditEh
          Left = 195
          Top = 227
          Width = 326
          Height = 26
          Hint = #1044#1086#1082#1091#1084#1077#1085#1090' ('#1088#1072#1079#1088#1077#1096#1077#1085#1080#1077') '#1085#1072' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1077
          DataField = 'ON_DOK_OTM'
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
        object edONA_DOK_OTM: TDBEditEh
          Left = 546
          Top = 227
          Width = 326
          Height = 26
          Hint = #1044#1086#1082#1091#1084#1077#1085#1090' ('#1088#1072#1079#1088#1077#1096#1077#1085#1080#1077') '#1085#1072' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1077
          DataField = 'ONA_DOK_OTM'
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
        object ENG_edON_IDENTIF: TDBEditEh
          Left = 195
          Top = 200
          Width = 176
          Height = 26
          Hint = #1044#1086#1082#1091#1084#1077#1085#1090' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1072#1102#1097#1080#1081' '#1087#1088#1077#1082#1088#1072#1097#1077#1085#1080#1077' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1073#1088#1072#1082#1072
          CharCase = ecUpperCase
          DataField = 'ON_IDENTIF'
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
          OnUpdateData = ENG_edON_IDENTIFUpdateData
        end
        object ENG_edONA_IDENTIF: TDBEditEh
          Left = 546
          Top = 200
          Width = 176
          Height = 26
          Hint = #1044#1086#1082#1091#1084#1077#1085#1090' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1072#1102#1097#1080#1081' '#1087#1088#1077#1082#1088#1072#1097#1077#1085#1080#1077' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1073#1088#1072#1082#1072
          CharCase = ecUpperCase
          DataField = 'ONA_IDENTIF'
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
          OnUpdateData = ENG_edONA_IDENTIFUpdateData
        end
        object pnDeti: TPanel
          Left = 0
          Top = 288
          Width = 777
          Height = 104
          BevelOuter = bvNone
          TabOrder = 26
          object gbDeti: TGroupBox
            Left = 0
            Top = 0
            Width = 736
            Height = 104
            Align = alClient
            Caption = ' 11. '#1054#1073#1097#1080#1077' '#1076#1077#1090#1080' '#1085#1077' '#1076#1086#1089#1090#1080#1075#1096#1080#1077' 18 '#1083#1077#1090' '
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
              Width = 732
              Height = 87
              Align = alClient
              DataSource = dsDeti
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
            Left = 736
            Top = 0
            Width = 41
            Height = 104
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
        end
        object edSumPoshlina: TDBNumberEditEh
          Left = 232
          Top = 507
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
          TabOrder = 31
          Visible = True
        end
        object edPoshlina: TDBEditEh
          Left = 352
          Top = 507
          Width = 523
          Height = 26
          HelpContext = 999
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
          TabOrder = 32
          Visible = True
        end
        object edON_Voenkom: TDBLookupComboboxEh
          Left = 194
          Top = 94
          Width = 326
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
          TabOrder = 3
          Visible = True
          OnChange = edON_VoenkomChange
        end
        object edONA_VOENKOM: TDBLookupComboboxEh
          Left = 546
          Top = 94
          Width = 326
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
          TabOrder = 15
          Visible = True
          OnChange = edONA_VOENKOMChange
        end
        object gbMesto: TGroupBox
          Left = 2
          Top = 430
          Width = 513
          Height = 71
          TabOrder = 30
          object Label80: TLabel
            Left = 360
            Top = 19
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
          object edNameMestoReg: TDBEditEh
            Left = 11
            Top = 42
            Width = 490
            Height = 26
            DataField = 'NAME_MESTOREG'
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
            OnEnter = edRukovEnter
          end
          object edMestoRegistr: TDBLookupComboboxEh
            Left = 11
            Top = 15
            Width = 331
            Height = 26
            DataField = 'MESTO'
            DataSource = dsDokument
            EditButtons = <
              item
                Hint = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
                ShortCut = 45
                Style = ebsEllipsisEh
                OnClick = edMestoRegistrEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsMesto
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
          object edTarif: TDBNumberEditEh
            Left = 411
            Top = 16
            Width = 90
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
            TabOrder = 1
            Visible = True
          end
        end
        object N_F_ZA_PREDEL: TDBCheckBoxEh
          Left = 8
          Top = 426
          Width = 269
          Height = 17
          Caption = #1079#1072' '#1087#1088#1077#1076#1077#1083#1072#1084#1080' '#1087#1086#1084#1077#1097#1077#1085#1080#1103' '#1086#1088#1075#1072#1085#1072' '#1079#1072#1075#1089#1072
          DataField = 'ZA_PREDEL'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 29
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edRukov: TDBEditEh
          Left = 522
          Top = 400
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
          TabOrder = 33
          Visible = True
        end
        object N_F_cbOtkaz: TDBCheckBoxEh
          Left = 535
          Top = 473
          Width = 205
          Height = 17
          Caption = #1086#1090#1082#1072#1079' '#1086#1090' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          DataField = 'OTKAZ'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 34
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object mDebug: TMemo
          Left = 0
          Top = 563
          Width = 889
          Height = 7
          Anchors = [akLeft, akTop, akRight, akBottom]
          Lines.Strings = (
            'm'
            'D'
            'e'
            'b'
            'u'
            'g')
          TabOrder = 35
        end
      end
      object tsReshSud: TTabSheet
        Caption = #1056#1077#1096#1077#1085#1080#1103' '#1089#1091#1076#1072' ('#1043#1048#1057' '#1056#1053')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 19
        ParentFont = False
        DesignSize = (
          894
          596)
        object GridRS: TDBGridEh
          Left = 1
          Top = 9
          Width = 888
          Height = 257
          Anchors = [akLeft, akTop, akRight]
          DataSource = dsReshSud
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
      object tsAdd: TTabSheet
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
        ImageIndex = -1
        DesignSize = (
          894
          596)
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
        object Label30: TLabel
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
          Left = 3
          Top = 1
          Width = 888
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
            888
            189)
          object GridZapros: TDBGridEh
            Left = 7
            Top = 17
            Width = 826
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
                Width = 280
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
          object Panel1: TPanel
            Left = 834
            Top = 15
            Width = 52
            Height = 172
            Align = alRight
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
      Width = 902
      Height = 32
      Align = alTop
      TabOrder = 0
      object Label27: TLabel
        Left = 8
        Top = 7
        Width = 101
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label28: TLabel
        Left = 184
        Top = 7
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
      object Label36: TLabel
        Left = 346
        Top = 7
        Width = 192
        Height = 13
        Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103' '#1073#1088#1072#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNomer: TDBEditEh
        Left = 120
        Top = 3
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
        Left = 213
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
        OnUpdateData = edDateZUpdateData
      end
      object edDateBrak: TDBDateTimeEditEh
        Left = 555
        Top = 3
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
        TabOrder = 2
        Visible = True
      end
      object edTimeR: TDBDateTimeEditEh
        Left = 668
        Top = 3
        Width = 181
        Height = 26
        DataField = 'TimeB'
        DataSource = dsDokument
        EditButton.Visible = False
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Visible = True
        EditFormat = #1074#1088#1077#1084#1103': HH  '#1095#1072#1089'.  NN '#1084#1080#1085'.'
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 710
    Width = 902
  end
  inherited pnAdd: TPanel
    Top = 29
    Width = 902
  end
  inherited dsDokument: TDataSource
    Left = 672
    Top = 90
  end
  object dsDeti: TDataSource [8]
    DataSet = tbDeti
    OnDataChange = dsDetiDataChange
    Left = 832
    Top = 445
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
    Left = 832
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
    Left = 508
    Top = 385
  end
  object dsStran: TDataSource [11]
    DataSet = dmBase.SprStran
    Left = 476
    Top = 305
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
        Size = 50
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
        Size = 50
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
        Name = 'VOSSTAN'
        DataType = ftBoolean
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
        Name = 'DATEB'
        DataType = ftDate
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
        Name = 'ONA_INOMER'
        DataType = ftString
        Size = 14
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
        Name = 'ON_INOMER'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'ROD_M_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ROD_M_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ROD_M_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ROD_M_GOROD_R'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ROD_DOK_TYPE'
        DataType = ftSmallint
      end
      item
        Name = 'ROD_DOK_SERIA'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ROD_DOK_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ROD_DOK_DATE'
        DataType = ftDate
      end
      item
        Name = 'ROD_DOK_ORGAN'
        DataType = ftMemo
      end
      item
        Name = 'ON_NATION_DOK'
        DataType = ftMemo
      end
      item
        Name = 'ONA_NATION_DOK'
        DataType = ftMemo
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
        Name = 'ON_VUS_KOMISS'
        DataType = ftMemo
      end
      item
        Name = 'ONA_VUS_KOMISS'
        DataType = ftMemo
      end
      item
        Name = 'ON_SEM_DOK'
        DataType = ftMemo
      end
      item
        Name = 'ONA_SEM_DOK'
        DataType = ftMemo
      end
      item
        Name = 'DOLG_FIO'
        DataType = ftMemo
      end
      item
        Name = 'ON_TELEFON'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'ONA_TELEFON'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'BELORUS'
        DataType = ftBoolean
      end
      item
        Name = 'TIMEB'
        DataType = ftTime
      end
      item
        Name = 'ROD_FIO'
        DataType = ftString
        Size = 70
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
        Name = 'VOENKOM'
        DataType = ftInteger
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
        Name = 'ON_DOK_OTM'
        DataType = ftMemo
      end
      item
        Name = 'ONA_DOK_OTM'
        DataType = ftMemo
      end
      item
        Name = 'ZA_PREDEL'
        DataType = ftBoolean
      end
      item
        Name = 'NAME_MESTOREG'
        DataType = ftMemo
      end
      item
        Name = 'SUM_POSHLINA'
        DataType = ftFloat
      end
      item
        Name = 'POSHLINA'
        DataType = ftString
        Size = 200
      end>
    Left = 688
    Top = 266
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
    object DokumentON_Familia: TStringField [4]
      FieldName = 'ON_Familia'
      Size = 50
    end
    object DokumentON_Otch: TStringField [5]
      FieldName = 'ON_Otch'
      Size = 30
    end
    object DokumentON_Name: TStringField [6]
      FieldName = 'ON_Name'
      Size = 30
    end
    object DokumentON_GOSUD: TIntegerField [7]
      FieldName = 'ON_GOSUD'
    end
    object DokumentON_DateR: TDateField [8]
      FieldName = 'ON_DateR'
    end
    object DokumentON_OBL: TStringField [9]
      FieldName = 'ON_OBL'
      Size = 30
    end
    object DokumentON_RAION: TStringField [10]
      FieldName = 'ON_RAION'
      Size = 30
    end
    object DokumentON_GOROD: TStringField [11]
      FieldName = 'ON_GOROD'
      Size = 30
    end
    object DokumentON_WORK: TStringField [12]
      FieldName = 'ON_WORK'
      Size = 100
    end
    object DokumentON_OBRAZ: TIntegerField [13]
      FieldName = 'ON_OBRAZ'
    end
    object DokumentON_M_GOSUD: TIntegerField [14]
      FieldName = 'ON_M_GOSUD'
    end
    object DokumentON_M_OBL: TStringField [15]
      FieldName = 'ON_M_OBL'
      Size = 30
    end
    object DokumentON_M_RAION: TStringField [16]
      FieldName = 'ON_M_RAION'
      Size = 30
    end
    object DokumentON_M_GOROD: TStringField [17]
      FieldName = 'ON_M_GOROD'
      Size = 30
    end
    object DokumentON_M_GOROD_R: TStringField [18]
      FieldName = 'ON_M_GOROD_R'
      Size = 50
    end
    object DokumentON_SEM: TIntegerField [19]
      FieldName = 'ON_SEM'
    end
    object DokumentON_DOKUMENT: TStringField [20]
      FieldName = 'ON_DOKUMENT'
      Size = 250
    end
    object DokumentON_SVID: TStringField [21]
      FieldName = 'ON_SVID'
      Size = 70
    end
    object DokumentOTMETKA: TMemoField [22]
      FieldName = 'OTMETKA'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentONA_Familia: TStringField [23]
      FieldName = 'ONA_Familia'
      Size = 50
    end
    object DokumentONA_Otch: TStringField [24]
      FieldName = 'ONA_Otch'
      Size = 30
    end
    object DokumentONA_Name: TStringField [25]
      FieldName = 'ONA_Name'
      Size = 30
    end
    object DokumentONA_DateR: TDateField [26]
      FieldName = 'ONA_DateR'
    end
    object DokumentONA_GOSUD: TIntegerField [27]
      FieldName = 'ONA_GOSUD'
    end
    object DokumentONA_OBL: TStringField [28]
      FieldName = 'ONA_OBL'
      Size = 30
    end
    object DokumentONA_RAION: TStringField [29]
      FieldName = 'ONA_RAION'
      Size = 30
    end
    object DokumentONA_GOROD: TStringField [30]
      FieldName = 'ONA_GOROD'
      Size = 30
    end
    object DokumentONA_WORK: TStringField [31]
      FieldName = 'ONA_WORK'
      Size = 100
    end
    object DokumentONA_OBRAZ: TIntegerField [32]
      FieldName = 'ONA_OBRAZ'
    end
    object DokumentONA_M_GOSUD: TIntegerField [33]
      FieldName = 'ONA_M_GOSUD'
    end
    object DokumentONA_M_OBL: TStringField [34]
      FieldName = 'ONA_M_OBL'
      Size = 30
    end
    object DokumentONA_M_RAION: TStringField [35]
      FieldName = 'ONA_M_RAION'
      Size = 30
    end
    object DokumentONA_M_GOROD: TStringField [36]
      FieldName = 'ONA_M_GOROD'
      Size = 30
    end
    object DokumentONA_M_GOROD_R: TStringField [37]
      FieldName = 'ONA_M_GOROD_R'
      Size = 50
    end
    object DokumentONA_SEM: TIntegerField [38]
      FieldName = 'ONA_SEM'
    end
    object DokumentONA_DOKUMENT: TStringField [39]
      FieldName = 'ONA_DOKUMENT'
      Size = 250
    end
    object DokumentONA_SVID: TStringField [40]
      FieldName = 'ONA_SVID'
      Size = 70
    end
    object DokumentDETI: TMemoField [41]
      FieldName = 'DETI'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentON_FamiliaP: TStringField [42]
      FieldName = 'ON_FamiliaP'
      Size = 50
    end
    object DokumentONA_FamiliaP: TStringField [43]
      FieldName = 'ONA_FamiliaP'
      Size = 50
    end
    object DokumentON_B_RESP: TBooleanField [44]
      FieldName = 'ON_B_RESP'
    end
    object DokumentON_B_OBL: TBooleanField [45]
      FieldName = 'ON_B_OBL'
    end
    object DokumentON_M_B_RESP: TBooleanField [46]
      FieldName = 'ON_M_B_RESP'
    end
    object DokumentON_M_B_OBL: TBooleanField [47]
      FieldName = 'ON_M_B_OBL'
    end
    object DokumentONA_B_RESP: TBooleanField [48]
      FieldName = 'ONA_B_RESP'
    end
    object DokumentONA_B_OBL: TBooleanField [49]
      FieldName = 'ONA_B_OBL'
    end
    object DokumentONA_M_B_RESP: TBooleanField [50]
      FieldName = 'ONA_M_B_RESP'
    end
    object DokumentONA_M_B_OBL: TBooleanField [51]
      FieldName = 'ONA_M_B_OBL'
    end
    object DokumentON_ID: TIntegerField [52]
      FieldName = 'ON_ID'
    end
    object DokumentONA_ID: TIntegerField [53]
      FieldName = 'ONA_ID'
    end
    object DokumentDATESV: TDateField [54]
      FieldName = 'DATESV'
    end
    object DokumentON_Familia_B: TStringField [55]
      FieldName = 'ON_Familia_B'
      Size = 50
    end
    object DokumentON_FamiliaP_B: TStringField [56]
      FieldName = 'ON_FamiliaP_B'
      Size = 50
    end
    object DokumentON_Name_B: TStringField [57]
      FieldName = 'ON_Name_B'
      Size = 30
    end
    object DokumentON_Otch_B: TStringField [58]
      FieldName = 'ON_Otch_B'
      Size = 30
    end
    object DokumentON_OBL_B: TStringField [59]
      FieldName = 'ON_OBL_B'
      Size = 30
    end
    object DokumentON_RAION_B: TStringField [60]
      FieldName = 'ON_RAION_B'
      Size = 30
    end
    object DokumentON_GOROD_B: TStringField [61]
      FieldName = 'ON_GOROD_B'
      Size = 30
    end
    object DokumentONA_Familia_B: TStringField [62]
      FieldName = 'ONA_Familia_B'
      Size = 50
    end
    object DokumentONA_FamiliaP_B: TStringField [63]
      FieldName = 'ONA_FamiliaP_B'
      Size = 50
    end
    object DokumentONA_Name_B: TStringField [64]
      FieldName = 'ONA_Name_B'
      Size = 30
    end
    object DokumentONA_Otch_B: TStringField [65]
      FieldName = 'ONA_Otch_B'
      Size = 30
    end
    object DokumentONA_OBL_B: TStringField [66]
      FieldName = 'ONA_OBL_B'
      Size = 30
    end
    object DokumentONA_RAION_B: TStringField [67]
      FieldName = 'ONA_RAION_B'
      Size = 30
    end
    object DokumentONA_GOROD_B: TStringField [68]
      FieldName = 'ONA_GOROD_B'
      Size = 30
    end
    object DokumentOSNOV: TBooleanField [69]
      FieldName = 'OSNOV'
    end
    object DokumentSUD_NAME: TMemoField [70]
      FieldName = 'SUD_NAME'
      BlobType = ftMemo
    end
    object DokumentSUD_DATE: TDateField [71]
      FieldName = 'SUD_DATE'
    end
    object DokumentSUD_BRAK: TMemoField [72]
      FieldName = 'SUD_BRAK'
      BlobType = ftMemo
    end
    object DokumentVOSSTAN: TBooleanField [73]
      FieldName = 'VOSSTAN'
    end
    object DokumentID_ZAGS: TIntegerField [74]
      FieldName = 'ID_ZAGS'
    end
    object DokumentDATEB: TDateField [76]
      FieldName = 'DATEB'
    end
    object DokumentON_ONLYGOD: TBooleanField [77]
      FieldName = 'ON_ONLYGOD'
    end
    object DokumentONA_ONLYGOD: TBooleanField [78]
      FieldName = 'ONA_ONLYGOD'
    end
    object DokumentCOPIA: TBooleanField [79]
      FieldName = 'COPIA'
    end
    object DokumentON_GODPR: TSmallintField [84]
      FieldName = 'ON_GODPR'
    end
    object DokumentONA_GODPR: TSmallintField [85]
      FieldName = 'ONA_GODPR'
    end
    object DokumentON_VOZR: TSmallintField [86]
      FieldName = 'ON_VOZR'
    end
    object DokumentONA_VOZR: TSmallintField [87]
      FieldName = 'ONA_VOZR'
    end
    object DokumentON_M_RNGOROD: TStringField [106]
      FieldName = 'ON_M_RNGOROD'
      Size = 30
    end
    object DokumentONA_M_RNGOROD: TStringField [107]
      FieldName = 'ONA_M_RNGOROD'
      Size = 30
    end
    object DokumentON_M_B_RN: TBooleanField [108]
      FieldName = 'ON_M_B_RN'
    end
    object DokumentONA_M_B_RN: TBooleanField [109]
      FieldName = 'ONA_M_B_RN'
    end
    object DokumentONA_DOK_TYPE: TSmallintField [110]
      FieldName = 'ONA_DOK_TYPE'
    end
    object DokumentONA_DOK_SERIA: TStringField [111]
      FieldName = 'ONA_DOK_SERIA'
      Size = 7
    end
    object DokumentONA_DOK_NOMER: TStringField [112]
      FieldName = 'ONA_DOK_NOMER'
      Size = 10
    end
    object DokumentONA_DOK_DATE: TDateField [113]
      FieldName = 'ONA_DOK_DATE'
    end
    object DokumentONA_INOMER: TStringField [114]
      FieldName = 'ONA_INOMER'
      Size = 14
    end
    object DokumentON_DOK_TYPE: TSmallintField [115]
      FieldName = 'ON_DOK_TYPE'
    end
    object DokumentON_DOK_SERIA: TStringField [116]
      FieldName = 'ON_DOK_SERIA'
      Size = 7
    end
    object DokumentON_DOK_NOMER: TStringField [117]
      FieldName = 'ON_DOK_NOMER'
      Size = 10
    end
    object DokumentON_DOK_DATE: TDateField [118]
      FieldName = 'ON_DOK_DATE'
    end
    object DokumentON_INOMER: TStringField [119]
      FieldName = 'ON_INOMER'
      Size = 14
    end
    object DokumentROD_M_OBL: TStringField [120]
      FieldName = 'ROD_M_OBL'
      Size = 30
    end
    object DokumentROD_M_RAION: TStringField [121]
      FieldName = 'ROD_M_RAION'
      Size = 30
    end
    object DokumentROD_M_GOROD: TStringField [122]
      FieldName = 'ROD_M_GOROD'
      Size = 30
    end
    object DokumentROD_M_GOROD_R: TStringField [123]
      FieldName = 'ROD_M_GOROD_R'
      Size = 50
    end
    object DokumentROD_DOK_TYPE: TSmallintField [124]
      FieldName = 'ROD_DOK_TYPE'
    end
    object DokumentROD_DOK_SERIA: TStringField [125]
      FieldName = 'ROD_DOK_SERIA'
      Size = 7
    end
    object DokumentROD_DOK_NOMER: TStringField [126]
      FieldName = 'ROD_DOK_NOMER'
      Size = 10
    end
    object DokumentROD_DOK_DATE: TDateField [127]
      FieldName = 'ROD_DOK_DATE'
    end
    object DokumentROD_DOK_ORGAN: TMemoField [128]
      FieldName = 'ROD_DOK_ORGAN'
      BlobType = ftMemo
    end
    object DokumentON_NATION_DOK: TMemoField [129]
      FieldName = 'ON_NATION_DOK'
      BlobType = ftMemo
    end
    object DokumentONA_NATION_DOK: TMemoField [130]
      FieldName = 'ONA_NATION_DOK'
      BlobType = ftMemo
    end
    object DokumentON_VUS: TBooleanField [131]
      FieldName = 'ON_VUS'
    end
    object DokumentONA_VUS: TBooleanField [132]
      FieldName = 'ONA_VUS'
    end
    object DokumentON_VUS_KOMISS: TMemoField [133]
      FieldName = 'ON_VUS_KOMISS'
      BlobType = ftMemo
    end
    object DokumentONA_VUS_KOMISS: TMemoField [134]
      FieldName = 'ONA_VUS_KOMISS'
      BlobType = ftMemo
    end
    object DokumentON_SEM_DOK: TMemoField [135]
      FieldName = 'ON_SEM_DOK'
      BlobType = ftMemo
    end
    object DokumentONA_SEM_DOK: TMemoField [136]
      FieldName = 'ONA_SEM_DOK'
      BlobType = ftMemo
    end
    object DokumentON_TELEFON: TStringField [137]
      FieldName = 'ON_TELEFON'
      Size = 25
    end
    object DokumentONA_TELEFON: TStringField [138]
      FieldName = 'ONA_TELEFON'
      Size = 25
    end
    object DokumentBELORUS: TBooleanField [139]
      FieldName = 'BELORUS'
    end
    object DokumentTIMEB: TTimeField [140]
      FieldName = 'TIMEB'
    end
    object DokumentROD_FIO: TStringField [141]
      FieldName = 'ROD_FIO'
      Size = 70
    end
    object DokumentON_B_GOROD: TSmallintField [142]
      FieldName = 'ON_B_GOROD'
    end
    object DokumentONA_B_GOROD: TSmallintField [143]
      FieldName = 'ONA_B_GOROD'
    end
    object DokumentON_M_B_GOROD: TSmallintField [144]
      FieldName = 'ON_M_B_GOROD'
    end
    object DokumentONA_M_B_GOROD: TSmallintField [145]
      FieldName = 'ONA_M_B_GOROD'
    end
    object DokumentON_IDENTIF: TStringField [146]
      FieldName = 'ON_IDENTIF'
      Size = 14
    end
    object DokumentONA_IDENTIF: TStringField [147]
      FieldName = 'ONA_IDENTIF'
      Size = 14
    end
    object DokumentVOENKOM: TIntegerField [148]
      FieldName = 'VOENKOM'
    end
    object DokumentON_M_DOM: TStringField [149]
      FieldName = 'ON_M_DOM'
      Size = 10
    end
    object DokumentON_M_KORP: TStringField [150]
      FieldName = 'ON_M_KORP'
      Size = 7
    end
    object DokumentON_M_KV: TStringField [151]
      FieldName = 'ON_M_KV'
      Size = 10
    end
    object DokumentONA_M_DOM: TStringField [152]
      FieldName = 'ONA_M_DOM'
      Size = 10
    end
    object DokumentONA_M_KORP: TStringField [153]
      FieldName = 'ONA_M_KORP'
      Size = 7
    end
    object DokumentONA_M_KV: TStringField [154]
      FieldName = 'ONA_M_KV'
      Size = 10
    end
    object DokumentON_DOK_OTM: TMemoField [155]
      FieldName = 'ON_DOK_OTM'
      BlobType = ftMemo
    end
    object DokumentONA_DOK_OTM: TMemoField [156]
      FieldName = 'ONA_DOK_OTM'
      BlobType = ftMemo
    end
    object DokumentZA_PREDEL: TBooleanField [157]
      FieldName = 'ZA_PREDEL'
    end
    object DokumentNAME_MESTOREG: TMemoField [158]
      FieldName = 'NAME_MESTOREG'
      BlobType = ftMemo
    end
    object DokumentSUM_POSHLINA: TFloatField [159]
      FieldName = 'SUM_POSHLINA'
      DisplayFormat = '### ###.#0'
    end
    object DokumentPOSHLINA: TStringField [160]
      FieldName = 'POSHLINA'
      Size = 200
    end
    object DokumentBRAK_ID: TIntegerField [161]
      FieldName = 'BRAK_ID'
    end
    object DokumentON_VOENKOM: TIntegerField [162]
      FieldName = 'ON_VOENKOM'
    end
    object DokumentONA_VOENKOM: TIntegerField [163]
      FieldName = 'ONA_VOENKOM'
    end
    object DokumentARX_ADRESAT: TMemoField [164]
      FieldName = 'ARX_ADRESAT'
      BlobType = ftMemo
    end
    object DokumentMESTO: TIntegerField [165]
      FieldName = 'MESTO'
    end
    object DokumentTARIF: TFloatField [166]
      FieldName = 'TARIF'
    end
    object DokumentON_GRAG_ADD: TMemoField [167]
      FieldName = 'ON_GRAG_ADD'
      BlobType = ftMemo
    end
    object DokumentONA_GRAG_ADD: TMemoField [168]
      FieldName = 'ONA_GRAG_ADD'
      BlobType = ftMemo
    end
    object DokumentON_GRAG: TIntegerField [169]
      FieldName = 'ON_GRAG'
    end
    object DokumentON_NATION: TIntegerField [170]
      FieldName = 'ON_NATION'
    end
    object DokumentONA_GRAG: TIntegerField [171]
      FieldName = 'ONA_GRAG'
    end
    object DokumentONA_NATION: TIntegerField [172]
      FieldName = 'ONA_NATION'
    end
    object DokumentDOLG_RUKOV: TStringField [173]
      FieldName = 'DOLG_RUKOV'
      Size = 200
    end
    object DokumentRUKOV: TStringField [174]
      FieldName = 'RUKOV'
      Size = 60
    end
    object DokumentOTMETKA_ISP: TMemoField [175]
      FieldName = 'OTMETKA_ISP'
      BlobType = ftMemo
    end
    object DokumentPRIM: TMemoField [176]
      FieldName = 'PRIM'
      BlobType = ftMemo
    end
    object DokumentOTKAZ: TBooleanField [177]
      FieldName = 'OTKAZ'
    end
    object DokumentON_REG_DATE: TDateField [178]
      FieldName = 'ON_REG_DATE'
    end
    object DokumentON_REG_DATE_TILL: TDateField [179]
      FieldName = 'ON_REG_DATE_TILL'
    end
    object DokumentONA_REG_DATE: TDateField [180]
      FieldName = 'ONA_REG_DATE'
    end
    object DokumentONA_REG_DATE_TILL: TDateField [181]
      FieldName = 'ONA_REG_DATE_TILL'
    end
    object DokumentONA_ATEID: TIntegerField [182]
      FieldName = 'ONA_ATEID'
    end
    object DokumentON_ATEID: TIntegerField [183]
      FieldName = 'ON_ATEID'
    end
  end
  object dsGragd: TDataSource [13]
    Left = 540
    Top = 219
  end
  inherited HistZAGS: TkbmMemTable
    Left = 640
    Top = 146
  end
  inherited dsSeria: TDataSource
    Left = 744
    Top = 234
  end
  inherited dsObl: TDataSource
    Left = 848
    Top = 226
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 792
    Top = 250
  end
  inherited dsPovtor: TDataSource
    Left = 632
  end
  inherited dsRN: TDataSource
    Left = 712
    Top = 250
  end
  inherited dsGorod: TDataSource
    Left = 632
    Top = 218
  end
  inherited dsRnGor: TDataSource
    Left = 576
    Top = 218
  end
  inherited dsTypeGorod: TDataSource
    Left = 640
    Top = 178
  end
  inherited ImGISUN: TImageList
    Left = 420
    Top = 99
  end
  inherited dsVoenkom: TDataSource
    Left = 824
    Top = 154
  end
  inherited dsRovd: TDataSource
    Left = 840
    Top = 298
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 608
    Top = 90
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 440
    Top = 178
  end
  object dsMesto: TDataSource [31]
    Left = 708
    Top = 355
  end
  object dsReshSud: TDataSource [32]
    DataSet = tbReshSud
    Left = 92
    Top = 230
  end
  object tbZapros: TkbmMemTable [33]
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
    Left = 508
    Top = 214
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
  object dsZapros: TDataSource [34]
    DataSet = tbZapros
    OnDataChange = dsDetiDataChange
    Left = 55
    Top = 191
  end
end
