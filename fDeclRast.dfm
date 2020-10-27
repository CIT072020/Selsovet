inherited fmDeclRast: TfmDeclRast
  Left = 432
  Top = 185
  ActiveControl = edNomer
  Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077' '#1086' '#1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1080' '#1073#1088#1072#1082#1072
  ClientHeight = 702
  ClientWidth = 840
  Constraints.MinHeight = 740
  Constraints.MinWidth = 823
  Icon.Data = {
    0000010001001010000001001800680300001600000028000000100000002000
    0000010018000000000000030000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000001C6E1C0094000094003E3E3E0000000000000000000000000000
    0000000000000000000000000000000000000000FF0000FF0000FF0000FF0000
    FF0000CE00000000000000000000000000000000000000000000FFFFFFFFFFFF
    00940000CE0000CE0000FF0000FF0000910000FF000042000000000000000000
    00000000000000000000FFFFFF00190000FF0000D900001C0000940000870000
    3E0000FF0000FF00000000000000000000000000000000000000FFFFFF001900
    00FF0000FF0000EE0000E90000E90000F60000FF0000FF000000000000000000
    00000000000000000000FFFFFF00190000FF0000D900006B0000FF0000F20000
    6B0000FF0000FF00000000000000000000000000000000000000FFFFFFFFFFFF
    00940000CE0000420000FF0000EF0000420000FF000042000000000000000000
    00000000000000000000FFFFFFFFFFFF00000000FF0000FF0000FF0000FF0000
    FF0000CE00000000000000000000000000000000000000000000FFFFFFFFFFFF
    FFFFFF0000001C6E1C0094000094003E3E3E0000000000000000000000000000
    00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFF000000000000000000000000000000000000000000FFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000
    00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
    FFFF000000000000000000000000000000000000000000000000FFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    0000FE070000E0030000E0030000E0010000E0010000E0010000E0030000E003
    0000E0030000E0030000E0030000E0070000E00F0000E01F0000FFFF0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 26
    Width = 840
    Visible = False
  end
  object Label22: TLabel [1]
    Left = 37
    Top = 479
    Width = 82
    Height = 13
    Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077')'
  end
  object Label34: TLabel [2]
    Left = 78
    Top = 426
    Width = 130
    Height = 13
    Caption = #1054#1090#1084#1077#1090#1082#1072' '#1086#1073' '#1080#1089#1087#1086#1083#1077#1085#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pnTable: TPanel
    Top = 53
    Width = 840
    Height = 627
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 840
    inherited TBToolbar: TTBToolbar
      inherited TBSubmenuTmp: TTBSubmenuItem [2]
      end
      inherited TBItemFastPrint: TTBItem [4]
      end
      object TBSubmenuGISUN: TTBSubmenuItem [5]
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
        Visible = False
      end
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      object TBItemVozrast: TTBItem [15]
        AutoCheck = True
        Caption = #1042#1086#1079#1088#1072#1089#1090
        Hint = #1058#1086#1083#1100#1082#1086' '#1074#1086#1079#1088#1072#1089#1090
        ImageIndex = 109
        Visible = False
        OnClick = TBItemVozrastClick
      end
      object TBItemChoiceBrak: TTBItem [19]
        Caption = #1042#1099#1073#1088#1072#1090#1100
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1082#1090#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100' '#1086' '#1073#1088#1072#1082#1077
        ImageIndex = 51
        OnClick = TBItemChoiceBrakClick
      end
      object TBItemSpeedChoice: TTBItem [20]
        Caption = #1055#1086#1080#1089#1082
        Hint = #1041#1099#1089#1090#1088#1099#1081' '#1087#1086#1080#1089#1082' '#1079#1072#1087#1080#1089#1080' '#1072#1082#1090#1072' '#1086' '#1073#1088#1072#1082#1077' '#1087#1086' '#1085#1086#1084#1077#1088#1091
        ImageIndex = 7
        OnClick = btSeekClick
      end
      inherited TBItemZAGS: TTBItem
        Visible = False
      end
      inherited TBItemShablon: TTBItem
        Visible = True
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 345
        Width = 403
        inherited edZAGS: TDBEditEh
          Width = 242
          TabStop = False
        end
        inherited N_F_cbGorod: TDBCheckBoxEh
          Left = 320
        end
      end
    end
  end
  inherited sb: TScrollBox
    Top = 53
    Width = 840
    Height = 627
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
      Top = 35
      Width = 840
      Height = 592
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
          832
          561)
        object Label1: TLabel
          Left = 8
          Top = 22
          Width = 164
          Height = 13
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
          Left = 339
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
          Left = 663
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
          Left = 24
          Top = 49
          Width = 117
          Height = 13
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
          Top = 76
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
          Top = 103
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
          Top = 157
          Width = 108
          Height = 13
          Caption = '4. '#1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 8
          Top = 176
          Width = 117
          Height = 13
          Caption = '5. '#1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 32
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
          Left = 32
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
          Left = 32
          Top = 246
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
          Left = 32
          Top = 273
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
          Top = 306
          Width = 111
          Height = 13
          Caption = '6. '#1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 8
          Top = 360
          Width = 94
          Height = 13
          Caption = '7. '#1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 8
          Top = 376
          Width = 125
          Height = 13
          Caption = '8. '#1052#1077#1089#1090#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 33
          Top = 392
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
          Left = 33
          Top = 419
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
          Left = 33
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
        object Label21: TLabel
          Left = 33
          Top = 473
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
          Left = 33
          Top = 500
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
        object Label7: TLabel
          Left = 8
          Top = 130
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
        object Label66: TLabel
          Left = 168
          Top = 527
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
          Top = 527
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
          Top = 527
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
          Left = 492
          Top = 527
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
          Left = 570
          Top = 527
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
          Left = 661
          Top = 527
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
        object edON_Familia: TDBEditEh
          Left = 198
          Top = 15
          Width = 145
          Height = 26
          HelpType = htKeyword
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
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edON_FamiliaEnter
        end
        object edONA_Familia: TDBEditEh
          Left = 522
          Top = 15
          Width = 145
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
          TabOrder = 25
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edONA_FamiliaEnter
        end
        object edON_FamiliaP: TDBEditEh
          Left = 198
          Top = 42
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
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edON_FamiliaPEnter
        end
        object edONA_FamiliaP: TDBEditEh
          Left = 522
          Top = 42
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
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edONA_FamiliaPEnter
        end
        object edON_Name: TDBEditEh
          Left = 198
          Top = 69
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
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edON_NameEnter
        end
        object edON_OTCH: TDBEditEh
          Left = 198
          Top = 96
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
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edON_OTCHEnter
        end
        object edONA_Name: TDBEditEh
          Left = 522
          Top = 69
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
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edONA_NameEnter
        end
        object edONA_OTCH: TDBEditEh
          Left = 522
          Top = 96
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
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
          OnEnter = edONA_OTCHEnter
        end
        object edON_DATER: TDBDateTimeEditEh
          Left = 198
          Top = 150
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
          OnUpdateData = edON_DATERUpdateData
        end
        object edONA_DATER: TDBDateTimeEditEh
          Left = 522
          Top = 150
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
          OnUpdateData = edON_DATERUpdateData
        end
        object edON_GOSUD: TDBLookupComboboxEh
          Left = 198
          Top = 186
          Width = 247
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
          Left = 522
          Top = 186
          Width = 247
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
          Left = 291
          Top = 267
          Width = 154
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
          TabOrder = 11
          Visible = True
        end
        object edONA_GOROD: TDBEditEh
          Left = 615
          Top = 267
          Width = 154
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
          TabOrder = 36
          Visible = True
        end
        object edON_NATION: TDBLookupComboboxEh
          Left = 198
          Top = 300
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
          Left = 198
          Top = 386
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
          TabOrder = 15
          Visible = True
        end
        object edON_M_GOROD: TDBEditEh
          Left = 254
          Top = 467
          Width = 191
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
          TabOrder = 19
          Visible = True
        end
        object edON_GRAG: TDBLookupComboboxEh
          Left = 198
          Top = 354
          Width = 247
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
          TabOrder = 14
          Visible = True
        end
        object edON_M_GOROD_R: TDBEditEh
          Left = 198
          Top = 494
          Width = 255
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
          TabOrder = 21
          Visible = True
        end
        object edONA_NATION: TDBLookupComboboxEh
          Left = 522
          Top = 300
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
          TabOrder = 37
          Visible = True
        end
        object edONA_M_GOSUD: TDBLookupComboboxEh
          Left = 522
          Top = 386
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
          TabOrder = 40
          Visible = True
        end
        object edONA_M_GOROD: TDBEditEh
          Left = 578
          Top = 467
          Width = 191
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
          TabOrder = 44
          Visible = True
        end
        object edONA_GRAG: TDBLookupComboboxEh
          Left = 522
          Top = 354
          Width = 247
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
          TabOrder = 39
          Visible = True
        end
        object edONA_M_GOROD_R: TDBEditEh
          Left = 522
          Top = 494
          Width = 255
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
          TabOrder = 46
          Visible = True
        end
        object edON_B_RESP: TDBCheckBoxEh
          Left = 176
          Top = 191
          Width = 15
          Height = 17
          DataField = 'ON_B_RESP'
          DataSource = dsDokument
          TabOrder = 50
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object edON_B_OBL: TDBCheckBoxEh
          Left = 176
          Top = 218
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ON_B_OBL'
          DataSource = dsDokument
          TabOrder = 51
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edONA_B_RESP: TDBCheckBoxEh
          Left = 501
          Top = 191
          Width = 15
          Height = 17
          DataField = 'ONA_B_RESP'
          DataSource = dsDokument
          TabOrder = 52
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object edONA_B_OBL: TDBCheckBoxEh
          Left = 501
          Top = 218
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ONA_B_OBL'
          DataSource = dsDokument
          TabOrder = 53
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edON_M_B_RESP: TDBCheckBoxEh
          Left = 176
          Top = 390
          Width = 15
          Height = 17
          DataField = 'ON_M_B_RESP'
          DataSource = dsDokument
          TabOrder = 54
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object edON_M_B_OBL: TDBCheckBoxEh
          Left = 176
          Top = 417
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ON_M_B_OBL'
          DataSource = dsDokument
          TabOrder = 55
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edONA_M_B_RESP: TDBCheckBoxEh
          Left = 500
          Top = 390
          Width = 15
          Height = 17
          DataField = 'ONA_M_B_RESP'
          DataSource = dsDokument
          TabOrder = 56
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object edONA_M_B_OBL: TDBCheckBoxEh
          Left = 500
          Top = 417
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ONA_M_B_OBL'
          DataSource = dsDokument
          TabOrder = 57
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object btPadeg: TButton
          Left = 2
          Top = 488
          Width = 23
          Height = 22
          Anchors = [akTop, akRight]
          Caption = #1042' '#1087#1072#1076#1077#1078#1077
          TabOrder = 58
          Visible = False
        end
        object cbOnlyGodON: TDBCheckBoxEh
          Left = 329
          Top = 155
          Width = 57
          Height = 17
          Hint = #1058#1086#1083#1100#1082#1086' '#1075#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
          Caption = #1043#1086#1076
          DataField = 'ON_ONLYGOD'
          DataSource = dsDokument
          TabOrder = 59
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = cbOnlyGodONClick
        end
        object cbOnlyGodONA: TDBCheckBoxEh
          Left = 655
          Top = 155
          Width = 57
          Height = 17
          Hint = #1058#1086#1083#1100#1082#1086' '#1075#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
          Caption = #1043#1086#1076
          DataField = 'ONA_ONLYGOD'
          DataSource = dsDokument
          TabOrder = 60
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = cbOnlyGodONClick
        end
        object edON_VOZR: TDBNumberEditEh
          Left = 374
          Top = 150
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
          Left = 701
          Top = 150
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
          Left = 198
          Top = 267
          Width = 74
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
          Left = 522
          Top = 267
          Width = 74
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
          Left = 198
          Top = 467
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
          TabOrder = 18
          Visible = True
        end
        object edONA_M_B_GOROD: TDBLookupComboboxEh
          Left = 522
          Top = 467
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
          TabOrder = 43
          Visible = True
        end
        object ENG_edONA_IDENTIF: TDBEditEh
          Left = 522
          Top = 123
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
          MRUList.Active = True
          MRUList.Items.Strings = (
            '4140492A023PB5'
            '3171266A082PB6'
            '3230493A017PB2'
            '4090148A064PB6'
            '3101149A066PB3'
            '4060859A072PB3'
            '4230649A064PB8'
            '3250452A090PB8'
            '3191049A000VF3'
            'A0100000230141'
            '5240908G001PB1'
            '5250908G003PB8'
            '6250908G027PB1'
            '5250908G002PB5'
            '6290908G003PB9'
            '5250908G001PB2'
            '6250908G006PB4'
            '5020208G003PB8'
            '6250908G021PB3'
            '6200908G001PB4'
            '5020208G001PB2'
            '6090808G001PB4'
            '6250908G025PB5'
            '6250908G026PB8'
            '5101000G007PB6'
            '5101000G008PB9'
            '6250908G022PB6'
            '6010108G052PB3'
            '6241008G012PB8')
          MRUList.Rows = 10
          ParentFont = False
          TabOrder = 29
          Visible = True
        end
        object ENG_edON_IDENTIF: TDBEditEh
          Left = 198
          Top = 123
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
          MRUList.Active = True
          MRUList.Items.Strings = (
            '4140492A023PB5'
            '3171266A082PB6'
            '3230493A017PB2'
            '4090148A064PB6'
            '3101149A066PB3'
            '4060859A072PB3'
            '4230649A064PB8'
            '3250452A090PB8'
            '3191049A000VF3'
            'A0100000230141'
            '5240908G001PB1'
            '5250908G003PB8'
            '6250908G027PB1'
            '5250908G002PB5'
            '6290908G003PB9'
            '5250908G001PB2'
            '6250908G006PB4'
            '5020208G003PB8'
            '6250908G021PB3'
            '6200908G001PB4'
            '5020208G001PB2'
            '6090808G001PB4'
            '6250908G025PB5'
            '6250908G026PB8'
            '5101000G007PB6'
            '5101000G008PB9'
            '6250908G022PB6'
            '6010108G052PB3'
            '6241008G012PB8')
          MRUList.Rows = 10
          ParentFont = False
          TabOrder = 4
          Visible = True
        end
        object cbBelorus: TDBCheckBoxEh
          Left = 733
          Top = 0
          Width = 97
          Height = 16
          Anchors = [akTop, akRight]
          Caption = #1087#1086'-'#1073#1077#1083#1086#1088#1091#1089#1089#1082#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbGrayed
          TabOrder = 61
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
          OnClick = cbBelorusClick
        end
        object edON_M_RNGOROD: TDBLookupComboboxEh
          Left = 328
          Top = 494
          Width = 140
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
          TabOrder = 20
          Visible = True
        end
        object edONA_M_RNGOROD: TDBLookupComboboxEh
          Left = 662
          Top = 494
          Width = 140
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
          TabOrder = 45
          Visible = True
        end
        object edON_M_DOM: TDBEditEh
          Left = 198
          Top = 521
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
          TabOrder = 22
          Visible = True
        end
        object edON_M_KORP: TDBEditEh
          Left = 283
          Top = 521
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
          TabOrder = 23
          Visible = True
        end
        object edON_M_KV: TDBEditEh
          Left = 360
          Top = 521
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
          TabOrder = 24
          Visible = True
        end
        object edONA_M_DOM: TDBEditEh
          Left = 522
          Top = 521
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
          TabOrder = 47
          Visible = True
        end
        object edONA_M_KORP: TDBEditEh
          Left = 607
          Top = 521
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
          TabOrder = 48
          Visible = True
        end
        object edONA_M_KV: TDBEditEh
          Left = 684
          Top = 521
          Width = 40
          Height = 26
          HelpType = htKeyword
          HelpContext = 999
          DataField = 'ONA_M_KV'
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
        object edON_OBL_R: TDBEditEh
          Left = 198
          Top = 213
          Width = 247
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
          TabOrder = 8
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edON_RAION_R: TDBEditEh
          Left = 198
          Top = 240
          Width = 247
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
          Left = 522
          Top = 213
          Width = 247
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
          TabOrder = 33
          Visible = True
          OnCheckDrawRequiredState = edON_FamiliaCheckDrawRequiredState
        end
        object edONA_RAION_R: TDBEditEh
          Left = 522
          Top = 240
          Width = 247
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
          Left = 198
          Top = 413
          Width = 247
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
          TabOrder = 16
          Visible = True
        end
        object edON_M_RAION: TDBEditEh
          Left = 198
          Top = 440
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
          TabOrder = 17
          Visible = True
        end
        object edONA_M_OBL: TDBEditEh
          Left = 522
          Top = 413
          Width = 247
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
          TabOrder = 41
          Visible = True
        end
        object edONA_M_RAION: TDBEditEh
          Left = 522
          Top = 440
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
          TabOrder = 42
          Visible = True
        end
        object edON_NATION_DOK: TDBEditEh
          Left = 198
          Top = 327
          Width = 247
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
          TabOrder = 13
          Visible = True
        end
        object edONA_NATION_DOK: TDBEditEh
          Left = 522
          Top = 327
          Width = 247
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
          TabOrder = 38
          Visible = True
        end
        object BLR_edON_Familia: TDBEditEh
          Left = 353
          Top = 15
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
          TabOrder = 62
          Visible = True
        end
        object BLR_edON_FamiliaP: TDBEditEh
          Left = 353
          Top = 42
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
          TabOrder = 63
          Visible = True
        end
        object BLR_edON_Name: TDBEditEh
          Left = 353
          Top = 69
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
          TabOrder = 64
          Visible = True
        end
        object BLR_edON_Otch: TDBEditEh
          Left = 353
          Top = 96
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
          TabOrder = 65
          Visible = True
        end
        object BLR_edONA_Familia: TDBEditEh
          Left = 678
          Top = 15
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
          TabOrder = 66
          Visible = True
        end
        object BLR_edONA_FamiliaP: TDBEditEh
          Left = 678
          Top = 42
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
          TabOrder = 67
          Visible = True
        end
        object BLR_edONA_Name: TDBEditEh
          Left = 678
          Top = 69
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
          TabOrder = 68
          Visible = True
        end
        object BLR_edONA_Otch: TDBEditEh
          Left = 678
          Top = 96
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
          TabOrder = 69
          Visible = True
        end
      end
      object tsTail2: TTabSheet
        Caption = #1063#1072#1089#1090#1100' 2'
        ImageIndex = 1
        DesignSize = (
          832
          561)
        object Label24: TLabel
          Left = 8
          Top = 79
          Width = 158
          Height = 13
          Caption = '11. '#1042' '#1082#1072#1082#1086#1084' '#1087#1086' '#1089#1095#1077#1090#1091' '#1073#1088#1072#1082#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label25: TLabel
          Left = 356
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
        object Label31: TLabel
          Left = 8
          Top = 132
          Width = 161
          Height = 26
          Caption = '12. '#1044#1086#1082#1091#1084#1077#1085#1090' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1080#1081' '#1083#1080#1095#1085#1086#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label32: TLabel
          Left = 10
          Top = 383
          Width = 51
          Height = 13
          Caption = #1054#1090#1084#1077#1090#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 8
          Top = 214
          Width = 213
          Height = 18
          AutoSize = False
          Caption = #1056#1072#1089#1090#1086#1088#1075#1072#1077#1084#1099#1081' '#1073#1088#1072#1082' '#1079#1072#1082#1083#1102#1095#1077#1085' '#1074
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
          Top = 103
          Width = 220
          Height = 18
          AutoSize = False
          Caption = '     '#1054#1090#1084#1077#1090#1082#1072' '#1086#1073' '#1091#1087#1083#1072#1090#1077' '#1087#1086#1096#1083#1080#1085#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label69: TLabel
          Left = 360
          Top = 160
          Width = 13
          Height = 16
          Caption = #1086#1090
        end
        object Label70: TLabel
          Left = 672
          Top = 160
          Width = 13
          Height = 16
          Caption = #1086#1090
        end
        object Label16: TLabel
          Left = 8
          Top = 51
          Width = 96
          Height = 13
          Caption = '10. '#1054#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 526
          Top = 215
          Width = 41
          Height = 16
          Caption = #1079'/'#1072'  '#8470
        end
        object Label52: TLabel
          Left = 658
          Top = 215
          Width = 13
          Height = 16
          Caption = #1086#1090
        end
        object Label53: TLabel
          Left = 8
          Top = 245
          Width = 49
          Height = 13
          Caption = #1055#1086#1076#1087#1080#1089#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 8
          Top = 301
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
        object Label15: TLabel
          Left = 8
          Top = 24
          Width = 128
          Height = 13
          Caption = '9. '#1043#1076#1077' '#1080' '#1082#1077#1084' '#1088#1072#1073#1086#1090#1072#1077#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbRukov: TvchDBText
          Left = 5
          Top = 360
          Width = 537
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
        object lbOtmIsp: TLabel
          Left = 6
          Top = 475
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
        object Label35: TLabel
          Left = 6
          Top = 503
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
        object Label42: TLabel
          Left = 8
          Top = 273
          Width = 51
          Height = 13
          Caption = #1058#1077#1083#1077#1092#1086#1085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 6
          Top = 533
          Width = 35
          Height = 13
          Caption = #1054#1090#1082#1072#1079
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edOTMETKA: TDBEditEh
          Left = 78
          Top = 383
          Width = 743
          Height = 69
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
          TabOrder = 33
          Visible = True
          WantReturns = True
          OnDblClick = TBItemEditMemoClick
        end
        object edON_SEM: TDBNumberEditEh
          Left = 222
          Top = 72
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
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object edONA_SEM: TDBNumberEditEh
          Left = 539
          Top = 72
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
          ParentFont = False
          TabOrder = 12
          Visible = True
        end
        object edBrak: TDBEditEh
          Left = 222
          Top = 210
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
          TabOrder = 20
          Visible = True
        end
        object edON_POSHLINA: TDBEditEh
          Left = 297
          Top = 100
          Width = 191
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
          TabOrder = 4
          Visible = True
        end
        object edONA_POSHLINA: TDBEditEh
          Left = 614
          Top = 100
          Width = 191
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
          TabOrder = 14
          Visible = True
        end
        object edON_DOKUMENT: TDBEditEh
          Left = 222
          Top = 183
          Width = 266
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
          Left = 539
          Top = 183
          Width = 266
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
          TabOrder = 19
          Visible = True
        end
        object edON_DOK_TYPE: TDBComboBoxEh
          Left = 222
          Top = 127
          Width = 266
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
        object edON_DOK_SERIA: TDBEditEh
          Left = 222
          Top = 155
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
          Left = 267
          Top = 155
          Width = 83
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
          Left = 379
          Top = 155
          Width = 109
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
        object edONA_DOK_SERIA: TDBEditEh
          Left = 539
          Top = 155
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
          TabOrder = 16
          Visible = True
        end
        object edONA_DOK_TYPE: TDBComboBoxEh
          Left = 539
          Top = 127
          Width = 266
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
          TabOrder = 15
          Visible = True
        end
        object edONA_DOK_NOMER: TDBEditEh
          Left = 579
          Top = 155
          Width = 83
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
          TabOrder = 17
          Visible = True
        end
        object edONA_DOK_DATE: TDBDateTimeEditEh
          Left = 694
          Top = 155
          Width = 109
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
          TabOrder = 18
          Visible = True
        end
        object edON_OBRAZ: TDBComboBoxEh
          Left = 222
          Top = 44
          Width = 266
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
          TabOrder = 1
          Visible = True
        end
        object edONA_OBRAZ: TDBComboBoxEh
          Left = 539
          Top = 44
          Width = 266
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
          TabOrder = 11
          Visible = True
        end
        object edON_SumPoshlina: TDBNumberEditEh
          Left = 222
          Top = 100
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
          TabOrder = 3
          Visible = True
        end
        object edONA_SumPoshlina: TDBNumberEditEh
          Left = 539
          Top = 100
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
          TabOrder = 13
          Visible = True
        end
        object edBrakDate: TDBDateTimeEditEh
          Left = 682
          Top = 210
          Width = 98
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
          TabOrder = 22
          Visible = True
        end
        object btSeek: TBitBtn
          Left = 796
          Top = 212
          Width = 23
          Height = 21
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1082#1090#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100' '#1086' '#1073#1088#1072#1082#1077' '#1087#1086' '#1085#1086#1084#1077#1088#1091' '#1080' '#1076#1072#1090#1077
          TabOrder = 30
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
        object btRazdel: TButton
          Left = 35
          Top = 436
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
          TabOrder = 31
          TabStop = False
          OnClick = btRazdelClick
        end
        object edOnPodpis: TDBEditEh
          Left = 222
          Top = 238
          Width = 266
          Height = 26
          Hint = #1050#1074#1080#1090#1072#1085#1094#1080#1103
          DataField = 'ON_PODPIS'
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
        object edOnaPodpis: TDBEditEh
          Left = 539
          Top = 238
          Width = 266
          Height = 26
          Hint = #1050#1074#1080#1090#1072#1085#1094#1080#1103
          DataField = 'ONA_PODPIS'
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
        object cbON_VUS: TDBCheckBoxEh
          Left = 222
          Top = 299
          Width = 17
          Height = 17
          Hint = #1042#1086#1077#1085#1085#1086#1086#1073#1103#1079#1072#1085#1085#1099#1081
          DataField = 'ON_VUS'
          DataSource = dsDokument
          TabOrder = 37
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edON_Voenkom: TDBLookupComboboxEh
          Left = 244
          Top = 294
          Width = 272
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
          TabOrder = 25
          Visible = True
          OnChange = edON_VoenkomChange
        end
        object cbONA_VUS: TDBCheckBoxEh
          Left = 539
          Top = 299
          Width = 17
          Height = 17
          Hint = #1042#1086#1077#1085#1085#1086#1086#1073#1103#1079#1072#1085#1085#1072#1103
          DataField = 'ONA_VUS'
          DataSource = dsDokument
          TabOrder = 28
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edONA_VOENKOM: TDBLookupComboboxEh
          Left = 561
          Top = 294
          Width = 256
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
          TabOrder = 29
          Visible = True
          OnChange = edONA_VOENKOMChange
        end
        object cbON_SVID: TDBCheckBoxEh
          Left = 222
          Top = 323
          Width = 237
          Height = 17
          Hint = #1042#1086#1077#1085#1085#1086#1086#1073#1103#1079#1072#1085#1085#1099#1081
          Caption = #1087#1086#1083#1091#1095#1072#1077#1090' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086
          DataField = 'ON_SVID'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 39
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBoxEh1: TDBCheckBoxEh
          Left = 539
          Top = 323
          Width = 237
          Height = 17
          Hint = #1042#1086#1077#1085#1085#1086#1086#1073#1103#1079#1072#1085#1085#1099#1081
          Caption = #1087#1086#1083#1091#1095#1072#1077#1090' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086
          DataField = 'ON_SVID'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 38
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edON_WORK: TDBEditEh
          Left = 222
          Top = 17
          Width = 266
          Height = 26
          HelpType = htKeyword
          HelpContext = 888
          DataField = 'ON_WORK'
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
        object edONA_WORK: TDBEditEh
          Left = 539
          Top = 17
          Width = 266
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
          TabOrder = 10
          Visible = True
        end
        object edRukov: TDBEditEh
          Left = 555
          Top = 353
          Width = 225
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
          TabOrder = 32
          Visible = True
        end
        object edBrakNomer: TDBEditEh
          Left = 576
          Top = 210
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
          TabOrder = 21
          Visible = True
        end
        object edOtmIsp: TDBEditEh
          Left = 160
          Top = 468
          Width = 660
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
          TabOrder = 34
          Visible = True
        end
        object edPrim: TDBEditEh
          Left = 160
          Top = 496
          Width = 660
          Height = 26
          DataField = 'PRIM'
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
        object edON_TELEFON: TDBEditEh
          Left = 222
          Top = 266
          Width = 187
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
          TabOrder = 24
          Visible = True
        end
        object edONA_TELEFON: TDBEditEh
          Left = 539
          Top = 266
          Width = 187
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
          TabOrder = 27
          Visible = True
        end
        object edOtkaz: TDBComboBoxEh
          Left = 160
          Top = 526
          Width = 279
          Height = 26
          DataField = 'OTKAZ'
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
        object edTypeRast: TDBComboBoxEh
          Left = 488
          Top = 526
          Width = 332
          Height = 26
          HelpContext = 999
          DataField = 'TYPE_RAST'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 40
          Visible = True
          OnChange = edTypeRastChange
        end
      end
      object tsSud: TTabSheet
        Caption = #1057#1091#1076
        ImageIndex = 2
        DesignSize = (
          832
          561)
        object lbSud_Date: TLabel
          Left = 602
          Top = 14
          Width = 13
          Height = 16
          Caption = #1086#1090
        end
        object lbSudSila: TLabel
          Left = 8
          Top = 44
          Width = 171
          Height = 16
          Caption = #1074#1089#1090#1091#1087#1080#1074#1096#1077#1077' '#1074' '#1079#1072#1082#1086#1085#1085#1091#1102' '#1089#1080#1083#1091
        end
        object Label29: TLabel
          Left = 8
          Top = 14
          Width = 82
          Height = 16
          Caption = #1056#1077#1096#1077#1085#1080#1077' '#1089#1091#1076#1072
        end
        object edSUD_NAME: TDBEditEh
          Left = 108
          Top = 9
          Width = 474
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
          TabOrder = 0
          Visible = True
        end
        object edSUD_DATE: TDBDateTimeEditEh
          Left = 631
          Top = 9
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
          TabOrder = 1
          Visible = True
        end
        object edSudSila: TDBDateTimeEditEh
          Left = 197
          Top = 39
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
          TabOrder = 2
          Visible = True
        end
        object pnDeti: TPanel
          Left = 3
          Top = 82
          Width = 820
          Height = 144
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          TabOrder = 3
          object gbDeti: TGroupBox
            Left = 0
            Top = 0
            Width = 779
            Height = 144
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
              Width = 775
              Height = 127
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
            Left = 779
            Top = 0
            Width = 41
            Height = 144
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
      end
    end
    object pnMain: TPanel
      Left = 0
      Top = 0
      Width = 840
      Height = 35
      Align = alTop
      TabOrder = 0
      DesignSize = (
        840
        35)
      object Label27: TLabel
        Left = 8
        Top = 12
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
        Left = 114
        Top = 12
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
      object lbDateRast: TLabel
        Left = 302
        Top = 12
        Width = 199
        Height = 13
        Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1103' '#1073#1088#1072#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ImageSUD: TImage
        Left = 812
        Top = 9
        Width = 20
        Height = 20
        Hint = #1055#1086' '#1088#1077#1096#1077#1085#1080#1102' '#1089#1091#1076#1072
        Anchors = [akTop, akRight]
        Transparent = True
      end
      object edNomer: TDBEditEh
        Left = 55
        Top = 5
        Width = 46
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
        Left = 137
        Top = 5
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
      object edDateRast: TDBDateTimeEditEh
        Left = 518
        Top = 5
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
      object edTimeRast: TDBDateTimeEditEh
        Left = 635
        Top = 5
        Width = 172
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
    Top = 680
    Width = 840
  end
  inherited pnAdd: TPanel
    Top = 29
    Width = 840
  end
  inherited dsDokument: TDataSource
    Left = 560
    Top = 90
  end
  object dsDeti: TDataSource [9]
    DataSet = tbDeti
    Left = 480
    Top = 109
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
    Left = 480
    Top = 269
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
    Left = 467
    Top = 185
  end
  object dsStran: TDataSource [12]
    DataSet = dmBase.SprStran
    Left = 515
    Top = 177
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
    Left = 648
    Top = 162
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
    object DokumentCOPIA: TBooleanField [110]
      FieldName = 'COPIA'
    end
    object DokumentON_ONLYGOD: TBooleanField [117]
      FieldName = 'ON_ONLYGOD'
    end
    object DokumentONA_ONLYGOD: TBooleanField [118]
      FieldName = 'ONA_ONLYGOD'
    end
    object DokumentON_VOZR: TSmallintField [119]
      FieldName = 'ON_VOZR'
    end
    object DokumentONA_VOZR: TSmallintField [120]
      FieldName = 'ONA_VOZR'
    end
    object DokumentON_B_GOROD: TSmallintField [121]
      FieldName = 'ON_B_GOROD'
    end
    object DokumentON_M_B_GOROD: TSmallintField [122]
      FieldName = 'ON_M_B_GOROD'
    end
    object DokumentONA_B_GOROD: TSmallintField [123]
      FieldName = 'ONA_B_GOROD'
    end
    object DokumentONA_M_B_GOROD: TSmallintField [124]
      FieldName = 'ONA_M_B_GOROD'
    end
    object DokumentON_STATUS: TStringField [125]
      FieldName = 'ON_STATUS'
      Size = 1
    end
    object DokumentONA_STATUS: TStringField [126]
      FieldName = 'ONA_STATUS'
      Size = 1
    end
    object DokumentON_IDENTIF: TStringField [127]
      FieldName = 'ON_IDENTIF'
      Size = 14
    end
    object DokumentONA_IDENTIF: TStringField [128]
      FieldName = 'ONA_IDENTIF'
      Size = 14
    end
    object DokumentPOLE_GRN: TSmallintField [129]
      FieldName = 'POLE_GRN'
    end
    object DokumentTYPEMESSAGE: TStringField [130]
      FieldName = 'TYPEMESSAGE'
      Size = 4
    end
    object DokumentON_DOK_TYPE: TSmallintField [131]
      FieldName = 'ON_DOK_TYPE'
    end
    object DokumentON_DOK_SERIA: TStringField [132]
      FieldName = 'ON_DOK_SERIA'
      Size = 7
    end
    object DokumentON_DOK_NOMER: TStringField [133]
      FieldName = 'ON_DOK_NOMER'
      Size = 10
    end
    object DokumentON_DOK_DATE: TDateField [134]
      FieldName = 'ON_DOK_DATE'
    end
    object DokumentON_DOK_ORGAN: TIntegerField [135]
      FieldName = 'ON_DOK_ORGAN'
    end
    object DokumentONA_DOK_TYPE: TSmallintField [136]
      FieldName = 'ONA_DOK_TYPE'
    end
    object DokumentONA_DOK_SERIA: TStringField [137]
      FieldName = 'ONA_DOK_SERIA'
      Size = 7
    end
    object DokumentONA_DOK_NOMER: TStringField [138]
      FieldName = 'ONA_DOK_NOMER'
      Size = 10
    end
    object DokumentONA_DOK_DATE: TDateField [139]
      FieldName = 'ONA_DOK_DATE'
    end
    object DokumentONA_DOK_ORGAN: TIntegerField [140]
      FieldName = 'ONA_DOK_ORGAN'
    end
    object DokumentSPEC_B: TStringField [141]
      FieldName = 'SPEC_B'
      Size = 60
    end
    object DokumentDETI_COUNT: TSmallintField [142]
      FieldName = 'DETI_COUNT'
    end
    object DokumentRN_ON_M_B_GOROD: TStringField [143]
      FieldName = 'RN_ON_M_B_GOROD'
      Size = 10
    end
    object DokumentRN_ON_B_GOROD: TStringField [144]
      FieldName = 'RN_ON_B_GOROD'
      Size = 10
    end
    object DokumentRN_ONA_M_B_GOROD: TStringField [145]
      FieldName = 'RN_ONA_M_B_GOROD'
      Size = 10
    end
    object DokumentRN_ONA_B_GOROD: TStringField [146]
      FieldName = 'RN_ONA_B_GOROD'
      Size = 10
    end
    object DokumentON_M_DOM: TStringField [147]
      FieldName = 'ON_M_DOM'
      Size = 10
    end
    object DokumentON_M_KORP: TStringField [148]
      FieldName = 'ON_M_KORP'
      Size = 7
    end
    object DokumentON_M_KV: TStringField [149]
      FieldName = 'ON_M_KV'
      Size = 10
    end
    object DokumentONA_M_DOM: TStringField [150]
      FieldName = 'ONA_M_DOM'
      Size = 10
    end
    object DokumentONA_M_KORP: TStringField [151]
      FieldName = 'ONA_M_KORP'
      Size = 7
    end
    object DokumentONA_M_KV: TStringField [152]
      FieldName = 'ONA_M_KV'
      Size = 10
    end
    object DokumentON_M_RNGOROD: TStringField [153]
      FieldName = 'ON_M_RNGOROD'
      Size = 30
    end
    object DokumentONA_M_RNGOROD: TStringField [154]
      FieldName = 'ONA_M_RNGOROD'
      Size = 30
    end
    object DokumentON_M_B_RN: TBooleanField [155]
      FieldName = 'ON_M_B_RN'
    end
    object DokumentONA_M_B_RN: TBooleanField [156]
      FieldName = 'ONA_M_B_RN'
    end
    object DokumentON_SUM_POSHLINA: TFloatField [157]
      FieldName = 'ON_SUM_POSHLINA'
      DisplayFormat = '### ##0.#0'
      EditFormat = '### ##0.#0'
    end
    object DokumentONA_SUM_POSHLINA: TFloatField [158]
      FieldName = 'ONA_SUM_POSHLINA'
      DisplayFormat = '### ##0.#0'
      EditFormat = '### ##0.#0'
    end
    object DokumentBRAK_ID: TIntegerField [159]
      FieldName = 'BRAK_ID'
    end
    object DokumentBRAK_DATE: TDateField [160]
      FieldName = 'BRAK_DATE'
    end
    object DokumentBRAK_NOMER: TStringField [161]
      FieldName = 'BRAK_NOMER'
      Size = 10
    end
    object DokumentON_SOATO: TStringField [162]
      FieldName = 'ON_SOATO'
      Size = 10
    end
    object DokumentONA_SOATO: TStringField [163]
      FieldName = 'ONA_SOATO'
      Size = 10
    end
    object DokumentON_PODPIS: TStringField [164]
      FieldName = 'ON_PODPIS'
      Size = 200
    end
    object DokumentONA_PODPIS: TStringField [165]
      FieldName = 'ONA_PODPIS'
      Size = 200
    end
    object DokumentON_VUS: TBooleanField
      FieldName = 'ON_VUS'
    end
    object DokumentONA_VUS: TBooleanField
      FieldName = 'ONA_VUS'
    end
    object DokumentON_VOENKOM: TIntegerField
      FieldName = 'ON_VOENKOM'
    end
    object DokumentONA_VOENKOM: TIntegerField
      FieldName = 'ONA_VOENKOM'
    end
    object DokumentDATEB: TDateField
      FieldName = 'DATEB'
    end
    object DokumentTIMEB: TTimeField
      FieldName = 'TIMEB'
    end
    object DokumentON_SVID: TBooleanField
      FieldName = 'ON_SVID'
    end
    object DokumentONA_SVID: TBooleanField
      FieldName = 'ONA_SVID'
    end
    object DokumentON_NATION_DOK: TMemoField
      FieldName = 'ON_NATION_DOK'
      BlobType = ftMemo
    end
    object DokumentONA_NATION_DOK: TMemoField
      FieldName = 'ONA_NATION_DOK'
      BlobType = ftMemo
    end
    object DokumentDOLG_RUKOV: TStringField
      FieldName = 'DOLG_RUKOV'
      Size = 200
    end
    object DokumentRAST_ID: TIntegerField
      FieldName = 'RAST_ID'
    end
    object DokumentOTMETKA_ISP: TMemoField
      FieldName = 'OTMETKA_ISP'
      BlobType = ftMemo
    end
    object DokumentPRIM: TMemoField
      FieldName = 'PRIM'
      BlobType = ftMemo
    end
    object DokumentON_GRAG_ADD: TMemoField
      FieldName = 'ON_GRAG_ADD'
      BlobType = ftMemo
    end
    object DokumentONA_GRAG_ADD: TMemoField
      FieldName = 'ONA_GRAG_ADD'
      BlobType = ftMemo
    end
    object DokumentON_TELEFON: TStringField
      FieldName = 'ON_TELEFON'
      Size = 25
    end
    object DokumentONA_TELEFON: TStringField
      FieldName = 'ONA_TELEFON'
      Size = 25
    end
    object DokumentOTKAZ: TSmallintField
      FieldName = 'OTKAZ'
    end
    object DokumentTYPE_RAST: TSmallintField
      FieldName = 'TYPE_RAST'
    end
    object DokumentSUD_SILA: TDateField
      FieldName = 'SUD_SILA'
    end
    object DokumentON_ATEID: TIntegerField
      FieldName = 'ON_ATEID'
    end
    object DokumentONA_ATEID: TIntegerField
      FieldName = 'ONA_ATEID'
    end
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 424
    Top = 106
  end
  inherited HistZAGS: TkbmMemTable
    Left = 376
    Top = 106
  end
  inherited dsSeria: TDataSource
    Left = 736
  end
  inherited dsObl: TDataSource
    Left = 712
    Top = 170
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 720
    Top = 98
  end
  inherited dsPovtor: TDataSource
    Left = 752
  end
  inherited dsRN: TDataSource
    Left = 624
    Top = 186
  end
  inherited dsGorod: TDataSource
    Left = 656
    Top = 234
  end
  inherited dsRnGor: TDataSource
    Top = 186
  end
  inherited dsTypeGorod: TDataSource
    Left = 696
    Top = 154
  end
  inherited ImGISUN: TImageList
    Left = 484
    Top = 107
  end
  inherited dsRovd: TDataSource
    Left = 752
    Top = 178
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 648
    Top = 98
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 600
    Top = 162
  end
  object dsGragd: TDataSource
    Left = 716
    Top = 242
  end
end
