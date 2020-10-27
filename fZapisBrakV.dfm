inherited fmZapisBrakV: TfmZapisBrakV
  Left = 406
  Top = 184
  Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1080' '#1073#1088#1072#1082#1072
  ClientHeight = 632
  ClientWidth = 864
  Constraints.MinHeight = 670
  Constraints.MinWidth = 880
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
    Top = 26
    Width = 864
    Visible = False
  end
  inherited pnTable: TPanel
    Top = 442
    Width = 770
    Height = 6
    Align = alNone
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 864
    inherited TBToolbar: TTBToolbar
      DockPos = 0
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
        object TBItemStep1: TTBItem
          Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
          OnClick = TBItemStep1Click
        end
        object TBItemStep2: TTBItem
          Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1072#1082#1090#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
          OnClick = TBItemStep2Click
        end
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
        Left = 860
        Top = 22
      end
    end
  end
  inherited sb: TScrollBox
    Top = 53
    Width = 864
    Height = 557
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
      Top = 33
      Width = 864
      Height = 524
      ActivePage = tsTail1
      Align = alClient
      HotTrack = True
      TabOrder = 0
      TabStop = False
      OnChange = pcChange
      object tsTail1: TTabSheet
        Caption = #1063#1072#1089#1090#1100' 1'
        DesignSize = (
          856
          496)
        object Label1: TLabel
          Left = 8
          Top = 17
          Width = 195
          Height = 13
          Caption = '1. '#1060#1072#1084#1080#1083#1080#1103' '#1076#1086' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103' '#1073#1088#1072#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 290
          Top = -2
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
          Left = 599
          Top = -2
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
          Left = 24
          Top = 47
          Width = 148
          Height = 13
          Caption = #1055#1086#1089#1083#1077' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103' '#1073#1088#1072#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 8
          Top = 74
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
          Top = 101
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
          Top = 156
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
          Top = 182
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
          Left = 32
          Top = 198
          Width = 134
          Height = 13
          Caption = #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072' ('#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1086')'
        end
        object Label10: TLabel
          Left = 32
          Top = 226
          Width = 76
          Height = 13
          Caption = #1086#1073#1083#1072#1089#1090#1100' ('#1082#1088#1072#1081')'
        end
        object Label11: TLabel
          Left = 32
          Top = 253
          Width = 30
          Height = 13
          Caption = #1088#1072#1081#1086#1085
        end
        object Label12: TLabel
          Left = 32
          Top = 281
          Width = 82
          Height = 13
          Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077')'
        end
        object Label13: TLabel
          Left = 8
          Top = 308
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
          Top = 336
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
          Top = 361
          Width = 214
          Height = 13
          Caption = '9. '#1054#1089#1085#1086#1074#1072#1085#1080#1077' '#1074#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 25
          Top = 386
          Width = 99
          Height = 13
          Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1091#1076#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 537
          Top = 386
          Width = 25
          Height = 13
          Caption = #1076#1072#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 8
          Top = 128
          Width = 86
          Height = 13
          Caption = '4. '#1048#1076#1077#1085'. '#1085#1086#1084#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbBrakRast: TvchDBText
          Left = 756
          Top = 29
          Width = 70
          Height = 16
          Anchors = [akTop, akRight]
          AutoSize = True
          DataField = 'BRAK_RAST'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnGetText = lbBrakRastGetText
        end
        object edON_Familia: TDBEditEh
          Left = 233
          Top = 14
          Width = 165
          Height = 24
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
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edON_FamiliaEnter
        end
        object edONA_Familia: TDBEditEh
          Left = 538
          Top = 16
          Width = 155
          Height = 24
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
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edONA_FamiliaEnter
        end
        object edON_FamiliaP: TDBEditEh
          Left = 233
          Top = 41
          Width = 165
          Height = 24
          DataField = 'ON_FamiliaP'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edON_FamiliaPEnter
        end
        object edONA_FamiliaP: TDBEditEh
          Left = 538
          Top = 42
          Width = 155
          Height = 24
          DataField = 'ONA_FamiliaP'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edONA_FamiliaPEnter
        end
        object edON_Name: TDBEditEh
          Left = 233
          Top = 68
          Width = 165
          Height = 24
          DataField = 'ON_Name'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edON_NameEnter
        end
        object edON_OTCH: TDBEditEh
          Left = 233
          Top = 95
          Width = 165
          Height = 24
          DataField = 'ON_Otch'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edON_OTCHEnter
        end
        object edONA_Name: TDBEditEh
          Left = 538
          Top = 69
          Width = 155
          Height = 24
          DataField = 'ONA_Name'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edONA_NameEnter
        end
        object edONA_OTCH: TDBEditEh
          Left = 538
          Top = 96
          Width = 155
          Height = 24
          DataField = 'ONA_Otch'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edONA_OTCHEnter
        end
        object edON_DATER: TDBDateTimeEditEh
          Left = 233
          Top = 150
          Width = 100
          Height = 24
          DataField = 'ON_DateR'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 5
          Visible = True
          OnUpdateData = edON_DATERUpdateData
        end
        object edONA_DATER: TDBDateTimeEditEh
          Left = 538
          Top = 150
          Width = 100
          Height = 24
          DataField = 'ONA_DateR'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 21
          Visible = True
          OnUpdateData = edON_DATERUpdateData
        end
        object edON_GOSUD: TDBLookupComboboxEh
          Left = 233
          Top = 193
          Width = 212
          Height = 24
          DataField = 'ON_GOSUD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
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
          Left = 538
          Top = 193
          Width = 212
          Height = 24
          DataField = 'ONA_GOSUD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsStran
          ParentFont = False
          TabOrder = 23
          Visible = True
        end
        object edON_GOROD: TDBEditEh
          Left = 286
          Top = 275
          Width = 159
          Height = 24
          DataField = 'ON_GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edONA_GOROD: TDBEditEh
          Left = 595
          Top = 275
          Width = 155
          Height = 24
          DataField = 'ONA_GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 29
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edON_NATION: TDBLookupComboboxEh
          Left = 234
          Top = 302
          Width = 234
          Height = 24
          DataField = 'ON_NATION'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME_M'
          ListSource = dsNation
          ParentFont = False
          TabOrder = 14
          Visible = True
        end
        object edSUD_NAME: TDBEditEh
          Left = 134
          Top = 380
          Width = 363
          Height = 24
          DataField = 'SUD_NAME'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 32
          Visible = True
        end
        object edSUD_BRAK: TDBEditEh
          Left = 25
          Top = 427
          Width = 746
          Height = 24
          HelpContext = 999
          Anchors = [akLeft, akTop, akRight]
          DataField = 'SUD_BRAK'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 34
          Visible = True
        end
        object edON_GRAG: TDBLookupComboboxEh
          Left = 234
          Top = 330
          Width = 234
          Height = 24
          DataField = 'ON_GRAG'
          DataSource = dsDokument
          DropDownBox.Width = 300
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'GNAME'
          ListSource = dsGragd
          ParentFont = False
          TabOrder = 15
          Visible = True
        end
        object edONA_NATION: TDBLookupComboboxEh
          Left = 538
          Top = 302
          Width = 234
          Height = 24
          DataField = 'ONA_NATION'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME_G'
          ListSource = dsNation
          ParentFont = False
          TabOrder = 30
          Visible = True
        end
        object edONA_GRAG: TDBLookupComboboxEh
          Left = 538
          Top = 330
          Width = 234
          Height = 24
          DataField = 'ONA_GRAG'
          DataSource = dsDokument
          DropDownBox.Width = 300
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'GNAME'
          ListSource = dsGragd
          ParentFont = False
          TabOrder = 31
          Visible = True
        end
        object edON_B_OBL: TDBCheckBoxEh
          Left = 212
          Top = 224
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ON_B_OBL'
          DataSource = dsDokument
          TabOrder = 37
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edONA_B_OBL: TDBCheckBoxEh
          Left = 517
          Top = 224
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ONA_B_OBL'
          DataSource = dsDokument
          TabOrder = 38
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edSUD_DATE: TDBDateTimeEditEh
          Left = 576
          Top = 380
          Width = 121
          Height = 24
          DataField = 'SUD_DATE'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 33
          Visible = True
        end
        object RadioButton1: TRadioButton
          Left = 25
          Top = 405
          Width = 253
          Height = 17
          Caption = #1054#1073' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1080' '#1092#1072#1082#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1073#1088#1072#1082#1072
          Checked = True
          TabOrder = 35
          TabStop = True
          OnClick = RadioButton1Click
        end
        object RadioButton2: TRadioButton
          Left = 308
          Top = 405
          Width = 536
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = #1054#1073' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1080' '#1092#1072#1082#1090#1072' '#1089#1086#1089#1090#1086#1103#1085#1080#1103' '#1074' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1093' '#1073#1088#1072#1095#1085#1099#1093' '#1086#1090#1085#1086#1096#1077#1085#1080#1103#1093
          TabOrder = 36
          OnClick = RadioButton2Click
        end
        object cbOnlyGodON: TDBCheckBoxEh
          Left = 343
          Top = 154
          Width = 57
          Height = 17
          Hint = #1058#1086#1083#1100#1082#1086' '#1075#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
          Caption = #1043#1086#1076
          DataField = 'ON_ONLYGOD'
          DataSource = dsDokument
          TabOrder = 39
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = cbOnlyGodONClick
        end
        object cbOnlyGodONA: TDBCheckBoxEh
          Left = 647
          Top = 154
          Width = 57
          Height = 17
          Hint = #1058#1086#1083#1100#1082#1086' '#1075#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
          Caption = #1043#1086#1076
          DataField = 'ONA_ONLYGOD'
          DataSource = dsDokument
          TabOrder = 40
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = cbOnlyGodONClick
        end
        object edON_VOZR: TDBNumberEditEh
          Left = 390
          Top = 150
          Width = 41
          Height = 24
          DataField = 'ON_VOZR'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Visible = False
        end
        object edONA_VOZR: TDBNumberEditEh
          Left = 697
          Top = 150
          Width = 41
          Height = 24
          DataField = 'ONA_VOZR'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 22
          Visible = False
        end
        object edON_OBL_B: TDBEditEh
          Left = 453
          Top = 220
          Width = 50
          Height = 24
          DataField = 'ON_OBL_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edON_RAION_B: TDBEditEh
          Left = 453
          Top = 247
          Width = 50
          Height = 24
          DataField = 'ON_RAION_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edONA_OBL_B: TDBEditEh
          Left = 731
          Top = 220
          Width = 50
          Height = 24
          DataField = 'ONA_OBL_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 25
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edONA_RAION_B: TDBEditEh
          Left = 731
          Top = 247
          Width = 50
          Height = 24
          DataField = 'ONA_RAION_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 27
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object cbBelorus: TDBCheckBoxEh
          Left = 774
          Top = 3
          Width = 58
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
          TabOrder = 41
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = cbBelorusClick
        end
        object edON_B_GOROD: TDBLookupComboboxEh
          Left = 233
          Top = 275
          Width = 46
          Height = 24
          Alignment = taRightJustify
          DataField = 'ON_B_GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsTypeGorod
          ParentFont = False
          TabOrder = 12
          Visible = True
        end
        object edONA_B_GOROD: TDBLookupComboboxEh
          Left = 538
          Top = 275
          Width = 46
          Height = 24
          Alignment = taRightJustify
          DataField = 'ONA_B_GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsTypeGorod
          ParentFont = False
          TabOrder = 28
          Visible = True
        end
        object ENG_edON_IDENTIF: TDBEditEh
          Left = 233
          Top = 122
          Width = 165
          Height = 24
          CharCase = ecUpperCase
          DataField = 'ON_IDENTIF'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Visible = True
        end
        object ENG_edONA_IDENTIF: TDBEditEh
          Left = 538
          Top = 123
          Width = 155
          Height = 24
          CharCase = ecUpperCase
          DataField = 'ONA_IDENTIF'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
          Visible = True
        end
        object edON_OBL_R: TDBEditEh
          Left = 233
          Top = 220
          Width = 212
          Height = 24
          DataField = 'ON_OBL'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edON_RAION_R: TDBEditEh
          Left = 233
          Top = 247
          Width = 212
          Height = 24
          DataField = 'ON_RAION'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edONA_OBL_R: TDBEditEh
          Left = 538
          Top = 220
          Width = 212
          Height = 24
          DataField = 'ONA_OBL'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 24
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edONA_RAION_R: TDBEditEh
          Left = 538
          Top = 247
          Width = 212
          Height = 24
          DataField = 'ONA_RAION'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 26
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
      end
      object tsTail2: TTabSheet
        Caption = #1063#1072#1089#1090#1100' 2'
        ImageIndex = 1
        DesignSize = (
          856
          496)
        object Label32: TLabel
          Left = 8
          Top = 113
          Width = 71
          Height = 13
          Caption = '11. '#1054#1090#1084#1077#1090#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 8
          Top = 22
          Width = 82
          Height = 13
          Caption = '10. '#1047#1072#1103#1074#1080#1090#1077#1083#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 8
          Top = 237
          Width = 144
          Height = 13
          Caption = #1044#1072#1090#1072' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103' '#1073#1088#1072#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 24
          Top = 333
          Width = 93
          Height = 13
          Caption = #1044#1088#1091#1075#1080#1077' '#1076#1072#1085#1085#1099#1077
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
          Top = 311
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
        object lbDolgRuk: TvchDBText
          Left = 6
          Top = 262
          Width = 615
          Height = 19
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
          Left = 6
          Top = 286
          Width = 615
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
          Left = 174
          Top = 113
          Width = 680
          Height = 112
          Anchors = [akLeft, akTop, akRight]
          AutoSelect = False
          AutoSize = False
          DataField = 'OTMETKA'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = True
          WantReturns = True
          OnDblClick = TBItemEditMemoClick
        end
        object edRukov: TDBEditEh
          Left = 635
          Top = 259
          Width = 208
          Height = 24
          Anchors = [akTop, akRight]
          DataField = 'RUKOV'
          DataSource = dsDokument
          EditButtons = <
            item
              Style = ebsEllipsisEh
              OnClick = edRukovEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edRukovEnter
        end
        object edSpec: TDBEditEh
          Left = 635
          Top = 283
          Width = 209
          Height = 24
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
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Visible = True
        end
        object edZAVIT: TDBEditEh
          Left = 174
          Top = 22
          Width = 680
          Height = 73
          HelpContext = 888
          Anchors = [akLeft, akTop, akRight]
          AutoSelect = False
          AutoSize = False
          DataField = 'ZAVIT'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = True
          WantReturns = True
          OnDblClick = TBItemEditMemoClick
        end
        object edDateBrak: TDBDateTimeEditEh
          Left = 174
          Top = 234
          Width = 125
          Height = 24
          DataField = 'DATEB'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object edOther: TDBEditEh
          Left = 59
          Top = 333
          Width = 30
          Height = 22
          AutoSize = False
          DataField = 'OTHER'
          DataSource = dsDokument
          EditButtons = <>
          Flat = True
          TabOrder = 5
          Visible = False
          WantReturns = True
          OnDblClick = TBItemEditMemoClick
        end
        object edIzmen: TDBEditEh
          Left = 174
          Top = 311
          Width = 680
          Height = 162
          HelpContext = 999
          Anchors = [akLeft, akTop, akRight]
          AutoSelect = False
          AutoSize = False
          DataField = 'IZMEN'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Visible = True
          WantReturns = True
          OnDblClick = TBItemEditMemoClick
        end
        object N_F_edCopy: TDBCheckBoxEh
          Left = 8
          Top = 368
          Width = 97
          Height = 17
          Caption = #1050#1086#1087#1080#1103
          DataField = 'COPIA'
          DataSource = dsDokument
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 7
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object N_F_cbPovtor: TDBCheckBoxEh
          Left = 8
          Top = 392
          Width = 99
          Height = 13
          Caption = #1055#1086#1074#1090#1086#1088#1085#1086#1077
          DataField = 'POVTOR'
          DataSource = dsDokument
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 8
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object cbRast: TDBCheckBoxEh
          Left = 173
          Top = 473
          Width = 204
          Height = 21
          Caption = #1041#1088#1072#1082' '#1088#1072#1089#1090#1086#1088#1075#1085#1091#1090
          DataField = 'BRAK_RAST'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
      object tsPovtor: TTabSheet
        Caption = #1055#1086#1074#1090#1086#1088#1085#1099#1077' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072
        ImageIndex = 2
      end
    end
    object pnMain: TPanel
      Left = 0
      Top = 0
      Width = 864
      Height = 33
      Align = alTop
      TabOrder = 1
      DesignSize = (
        864
        33)
      object Label27: TLabel
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
      object Label40: TLabel
        Left = 277
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
      end
      object Label55: TLabel
        Left = 461
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
      end
      object Label29: TLabel
        Left = 578
        Top = 11
        Width = 12
        Height = 13
        Caption = #1086#1090
      end
      object ImageGISUN: TImage
        Left = 836
        Top = 5
        Width = 20
        Height = 20
        Anchors = [akTop, akRight]
        Transparent = True
      end
      object edNomer: TDBEditEh
        Left = 55
        Top = 5
        Width = 54
        Height = 24
        HelpContext = 888
        DataField = 'NOMER'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
      object edDateZ: TDBDateTimeEditEh
        Left = 148
        Top = 5
        Width = 110
        Height = 24
        DataField = 'DATEZ'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
      object N_F_1: TDBCheckBoxEh
        Left = 729
        Top = 9
        Width = 106
        Height = 17
        Caption = '1-'#1099#1081' '#1101#1082#1079#1077#1084#1087#1083#1103#1088
        DataField = 'First_Ekz'
        DataSource = dsDokument
        TabOrder = 5
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object edSvid_Nomer: TDBEditEh
        Left = 481
        Top = 5
        Width = 83
        Height = 24
        DataField = 'SVID_NOMER'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Visible = True
      end
      object edDateSV: TDBDateTimeEditEh
        Left = 603
        Top = 5
        Width = 110
        Height = 24
        DataField = 'DATESV'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 4
        Visible = True
      end
      object edSVID_SERIA: TDBLookupComboboxEh
        Left = 378
        Top = 5
        Width = 68
        Height = 24
        DataField = 'SVID_SERIA'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
    Top = 610
    Width = 864
  end
  inherited pnAdd: TPanel
    Top = 29
    Width = 864
  end
  inherited dsDokument: TDataSource
    Left = 656
    Top = 154
  end
  object dsDeti: TDataSource [7]
    DataSet = tbDeti
    Left = 440
    Top = 125
  end
  object tbDeti: TkbmMemTable [8]
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
    Left = 488
    Top = 117
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
  object dsNation: TDataSource [9]
    DataSet = dmBase.SprNac
    Left = 460
    Top = 193
  end
  object dsStran: TDataSource [10]
    DataSet = dmBase.SprStran
    Left = 452
    Top = 169
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
        Name = 'NOMER_EKZ'
        DataType = ftInteger
      end
      item
        Name = 'POSHLINA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TYPE_EKZ'
        DataType = ftInteger
      end
      item
        Name = 'POVTOR'
        DataType = ftBoolean
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
        Name = 'ON_VOZR'
        DataType = ftSmallint
      end
      item
        Name = 'ONA_VOZR'
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
        Name = 'POLE_GRN'
        DataType = ftSmallint
      end
      item
        Name = 'TYPEMESSAGE'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ONA_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'ON_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'ONA_M_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'ON_M_B_GOROD'
        DataType = ftSmallint
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
        Name = 'BRAK_RAST'
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
      end>
    Left = 696
    Top = 146
    object DokumentNOMER: TIntegerField [4]
      FieldName = 'NOMER'
    end
    object DokumentDATEZ: TDateField [5]
      FieldName = 'DATEZ'
    end
    object DokumentSVID_SERIA: TStringField [6]
      FieldName = 'SVID_SERIA'
      Size = 10
    end
    object DokumentSVID_NOMER: TStringField [7]
      FieldName = 'SVID_NOMER'
    end
    object DokumentON_Familia: TStringField [8]
      FieldName = 'ON_Familia'
      Size = 50
    end
    object DokumentON_Otch: TStringField [9]
      FieldName = 'ON_Otch'
      Size = 30
    end
    object DokumentON_Name: TStringField [10]
      FieldName = 'ON_Name'
      Size = 30
    end
    object DokumentON_GOSUD: TIntegerField [11]
      FieldName = 'ON_GOSUD'
    end
    object DokumentON_DateR: TDateField [12]
      FieldName = 'ON_DateR'
    end
    object DokumentON_OBL: TStringField [13]
      FieldName = 'ON_OBL'
      Size = 30
    end
    object DokumentON_RAION: TStringField [14]
      FieldName = 'ON_RAION'
      Size = 30
    end
    object DokumentON_GOROD: TStringField [15]
      FieldName = 'ON_GOROD'
      Size = 30
    end
    object DokumentON_NATION: TStringField [16]
      FieldName = 'ON_NATION'
      Size = 30
    end
    object DokumentON_GRAG: TStringField [17]
      FieldName = 'ON_GRAG'
      Size = 50
    end
    object DokumentON_WORK: TStringField [18]
      FieldName = 'ON_WORK'
      Size = 100
    end
    object DokumentON_OBRAZ: TIntegerField [19]
      FieldName = 'ON_OBRAZ'
    end
    object DokumentON_M_GOSUD: TIntegerField [20]
      FieldName = 'ON_M_GOSUD'
    end
    object DokumentON_M_OBL: TStringField [21]
      FieldName = 'ON_M_OBL'
      Size = 30
    end
    object DokumentON_M_RAION: TStringField [22]
      FieldName = 'ON_M_RAION'
      Size = 30
    end
    object DokumentON_M_GOROD: TStringField [23]
      FieldName = 'ON_M_GOROD'
      Size = 30
    end
    object DokumentON_M_GOROD_R: TStringField [24]
      FieldName = 'ON_M_GOROD_R'
      Size = 50
    end
    object DokumentON_SEM: TIntegerField [25]
      FieldName = 'ON_SEM'
    end
    object DokumentON_DOKUMENT: TStringField [26]
      FieldName = 'ON_DOKUMENT'
      Size = 250
    end
    object DokumentON_SVID: TStringField [27]
      FieldName = 'ON_SVID'
      Size = 70
    end
    object DokumentOTMETKA: TMemoField [28]
      FieldName = 'OTMETKA'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentONA_Familia: TStringField [29]
      FieldName = 'ONA_Familia'
      Size = 50
    end
    object DokumentONA_Otch: TStringField [30]
      FieldName = 'ONA_Otch'
      Size = 30
    end
    object DokumentONA_Name: TStringField [31]
      FieldName = 'ONA_Name'
      Size = 30
    end
    object DokumentONA_DateR: TDateField [32]
      FieldName = 'ONA_DateR'
    end
    object DokumentONA_GOSUD: TIntegerField [33]
      FieldName = 'ONA_GOSUD'
    end
    object DokumentONA_OBL: TStringField [34]
      FieldName = 'ONA_OBL'
      Size = 30
    end
    object DokumentONA_RAION: TStringField [35]
      FieldName = 'ONA_RAION'
      Size = 30
    end
    object DokumentONA_GOROD: TStringField [36]
      FieldName = 'ONA_GOROD'
      Size = 30
    end
    object DokumentONA_NATION: TStringField [37]
      FieldName = 'ONA_NATION'
      Size = 30
    end
    object DokumentONA_GRAG: TStringField [38]
      FieldName = 'ONA_GRAG'
      Size = 50
    end
    object DokumentONA_WORK: TStringField [39]
      FieldName = 'ONA_WORK'
      Size = 100
    end
    object DokumentONA_OBRAZ: TIntegerField [40]
      FieldName = 'ONA_OBRAZ'
    end
    object DokumentONA_M_GOSUD: TIntegerField [41]
      FieldName = 'ONA_M_GOSUD'
    end
    object DokumentONA_M_OBL: TStringField [42]
      FieldName = 'ONA_M_OBL'
      Size = 30
    end
    object DokumentONA_M_RAION: TStringField [43]
      FieldName = 'ONA_M_RAION'
      Size = 30
    end
    object DokumentONA_M_GOROD: TStringField [44]
      FieldName = 'ONA_M_GOROD'
      Size = 30
    end
    object DokumentONA_M_GOROD_R: TStringField [45]
      FieldName = 'ONA_M_GOROD_R'
      Size = 50
    end
    object DokumentONA_SEM: TIntegerField [46]
      FieldName = 'ONA_SEM'
    end
    object DokumentONA_DOKUMENT: TStringField [47]
      FieldName = 'ONA_DOKUMENT'
      Size = 250
    end
    object DokumentONA_SVID: TStringField [48]
      FieldName = 'ONA_SVID'
      Size = 70
    end
    object DokumentDETI: TMemoField [49]
      FieldName = 'DETI'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentON_FamiliaP: TStringField [50]
      FieldName = 'ON_FamiliaP'
      Size = 50
    end
    object DokumentONA_FamiliaP: TStringField [51]
      FieldName = 'ONA_FamiliaP'
      Size = 50
    end
    object DokumentRUKOV: TStringField [52]
      FieldName = 'RUKOV'
      Size = 69
    end
    object DokumentON_B_RESP: TBooleanField [53]
      FieldName = 'ON_B_RESP'
    end
    object DokumentON_B_OBL: TBooleanField [54]
      FieldName = 'ON_B_OBL'
    end
    object DokumentON_M_B_RESP: TBooleanField [55]
      FieldName = 'ON_M_B_RESP'
    end
    object DokumentON_M_B_OBL: TBooleanField [56]
      FieldName = 'ON_M_B_OBL'
    end
    object DokumentONA_B_RESP: TBooleanField [57]
      FieldName = 'ONA_B_RESP'
    end
    object DokumentONA_B_OBL: TBooleanField [58]
      FieldName = 'ONA_B_OBL'
    end
    object DokumentONA_M_B_RESP: TBooleanField [59]
      FieldName = 'ONA_M_B_RESP'
    end
    object DokumentONA_M_B_OBL: TBooleanField [60]
      FieldName = 'ONA_M_B_OBL'
    end
    object DokumentON_ID: TIntegerField [61]
      FieldName = 'ON_ID'
    end
    object DokumentONA_ID: TIntegerField [62]
      FieldName = 'ONA_ID'
    end
    object DokumentFirst_Ekz: TBooleanField [63]
      FieldName = 'First_Ekz'
    end
    object DokumentDATESV: TDateField [64]
      FieldName = 'DATESV'
    end
    object DokumentON_Familia_B: TStringField [65]
      FieldName = 'ON_Familia_B'
      Size = 50
    end
    object DokumentON_FamiliaP_B: TStringField [66]
      FieldName = 'ON_FamiliaP_B'
      Size = 50
    end
    object DokumentON_Name_B: TStringField [67]
      FieldName = 'ON_Name_B'
      Size = 30
    end
    object DokumentON_Otch_B: TStringField [68]
      FieldName = 'ON_Otch_B'
      Size = 30
    end
    object DokumentON_OBL_B: TStringField [69]
      FieldName = 'ON_OBL_B'
      Size = 30
    end
    object DokumentON_RAION_B: TStringField [70]
      FieldName = 'ON_RAION_B'
      Size = 30
    end
    object DokumentON_GOROD_B: TStringField [71]
      FieldName = 'ON_GOROD_B'
      Size = 30
    end
    object DokumentONA_Familia_B: TStringField [72]
      FieldName = 'ONA_Familia_B'
      Size = 50
    end
    object DokumentONA_FamiliaP_B: TStringField [73]
      FieldName = 'ONA_FamiliaP_B'
      Size = 50
    end
    object DokumentONA_Name_B: TStringField [74]
      FieldName = 'ONA_Name_B'
      Size = 30
    end
    object DokumentONA_Otch_B: TStringField [75]
      FieldName = 'ONA_Otch_B'
      Size = 30
    end
    object DokumentONA_OBL_B: TStringField [76]
      FieldName = 'ONA_OBL_B'
      Size = 30
    end
    object DokumentONA_RAION_B: TStringField [77]
      FieldName = 'ONA_RAION_B'
      Size = 30
    end
    object DokumentONA_GOROD_B: TStringField [78]
      FieldName = 'ONA_GOROD_B'
      Size = 30
    end
    object DokumentRUKOV_B: TStringField [79]
      FieldName = 'RUKOV_B'
      Size = 60
    end
    object DokumentOSNOV: TBooleanField [80]
      FieldName = 'OSNOV'
    end
    object DokumentSUD_NAME: TMemoField [81]
      FieldName = 'SUD_NAME'
      BlobType = ftMemo
    end
    object DokumentSUD_DATE: TDateField [82]
      FieldName = 'SUD_DATE'
    end
    object DokumentSUD_BRAK: TMemoField [83]
      FieldName = 'SUD_BRAK'
      BlobType = ftMemo
    end
    object DokumentZAVIT: TMemoField [84]
      FieldName = 'ZAVIT'
      BlobType = ftMemo
    end
    object DokumentVOSSTAN: TBooleanField [85]
      FieldName = 'VOSSTAN'
    end
    object DokumentSPEC: TStringField [86]
      FieldName = 'SPEC'
      Size = 60
    end
    object DokumentID_ZAGS: TIntegerField [87]
      FieldName = 'ID_ZAGS'
    end
    object DokumentDATEB: TDateField [88]
      FieldName = 'DATEB'
    end
    object DokumentOTHER: TMemoField [89]
      FieldName = 'OTHER'
      BlobType = ftMemo
    end
    object DokumentIZMEN: TMemoField [90]
      FieldName = 'IZMEN'
      BlobType = ftMemo
    end
    object DokumentON_ONLYGOD: TBooleanField [91]
      FieldName = 'ON_ONLYGOD'
    end
    object DokumentONA_ONLYGOD: TBooleanField [92]
      FieldName = 'ONA_ONLYGOD'
    end
    object DokumentCOPIA: TBooleanField [93]
      FieldName = 'COPIA'
    end
    object DokumentPOSHLINA: TStringField [95]
      FieldName = 'POSHLINA'
      Size = 50
    end
    object DokumentON_VOZR: TSmallintField
      FieldName = 'ON_VOZR'
    end
    object DokumentONA_VOZR: TSmallintField
      FieldName = 'ONA_VOZR'
    end
    object DokumentON_IDENTIF: TStringField
      FieldName = 'ON_IDENTIF'
      Size = 14
    end
    object DokumentONA_IDENTIF: TStringField
      FieldName = 'ONA_IDENTIF'
      Size = 14
    end
    object DokumentON_STATUS: TStringField
      FieldName = 'ON_STATUS'
      Size = 1
    end
    object DokumentONA_STATUS: TStringField
      FieldName = 'ONA_STATUS'
      Size = 1
    end
    object DokumentPOLE_GRN: TSmallintField
      FieldName = 'POLE_GRN'
    end
    object DokumentTYPEMESSAGE: TStringField
      FieldName = 'TYPEMESSAGE'
      Size = 4
    end
    object DokumentONA_B_GOROD: TSmallintField
      FieldName = 'ONA_B_GOROD'
    end
    object DokumentON_B_GOROD: TSmallintField
      FieldName = 'ON_B_GOROD'
    end
    object DokumentONA_M_B_GOROD: TSmallintField
      FieldName = 'ONA_M_B_GOROD'
    end
    object DokumentON_M_B_GOROD: TSmallintField
      FieldName = 'ON_M_B_GOROD'
    end
    object DokumentON_VOENKOM: TIntegerField
      FieldName = 'ON_VOENKOM'
    end
    object DokumentONA_VOENKOM: TIntegerField
      FieldName = 'ONA_VOENKOM'
    end
    object DokumentBRAK_RAST: TBooleanField
      FieldName = 'BRAK_RAST'
    end
    object DokumentMESTO: TIntegerField
      FieldName = 'MESTO'
    end
    object DokumentSPEC_B: TStringField
      FieldName = 'SPEC_B'
      Size = 60
    end
    object DokumentARX_ADRESAT: TMemoField
      FieldName = 'ARX_ADRESAT'
      BlobType = ftMemo
    end
  end
  inherited HistZAGS: TkbmMemTable
    Left = 408
    Top = 138
  end
  inherited dsObl: TDataSource
    Left = 536
    Top = 170
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 744
    Top = 186
  end
  inherited dsGorod: TDataSource
    Left = 592
    Top = 282
  end
  inherited dsRnGor: TDataSource
    Left = 512
    Top = 274
  end
  inherited dsTypeGorod: TDataSource
    Left = 688
    Top = 178
  end
  inherited ImGISUN: TImageList
    Left = 388
    Top = 123
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 696
    Top = 210
  end
  object dsGragd: TDataSource
    Left = 676
    Top = 281
  end
end
