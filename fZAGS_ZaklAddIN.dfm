inherited fmZAGS_ZaklAddIN: TfmZAGS_ZaklAddIN
  Left = 318
  Top = 84
  Caption = #1047#1072#1082#1083#1102#1095#1077#1085#1080#1077' '#1086' '#1076#1086#1087#1086#1083#1085#1077#1085#1080#1080' '#1079#1072#1087#1080#1089#1080' '#1072#1082#1090#1072' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080' '#1048#1053
  ClientHeight = 667
  ClientWidth = 837
  Constraints.MinHeight = 680
  Constraints.MinWidth = 845
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000000040000000000000000000000000000000000000000
    00FF000000FF00000000000000000000000000000000000000FF000000FF0101
    B1FF0101B1FF000000000000000000000000000000000101B1FF0101B1FF0000
    00FF000000FF000000FF000000000000000000000000000000FF000000FF0101
    B1FF0101B1FF000000000000000000000000000000000101B1FF0101B1FF0000
    00FF000000FF000000FF000000FF0000000000000000000000FF000000FF0101
    B1FF0101B1FF000000000000000000000000000000000101B1FF0101B1FF0000
    00FF000000FF000000FF000000FF000000FF00000000000000FF000000FF0101
    B1FF0101B1FF0101B1FF0101B1FF0101B1FF0101B1FF0101B1FF0101B1FF0000
    00FF000000FF00000000000000FF000000FF000000FF000000FF000000FF0101
    B1FF0101B1FF0101B1FF0101B1FF0101B1FF0101B1FF0101B1FF0101B1FF0000
    00FF000000FF0000000000000000000000FF000000FF000000FF000000FF0101
    B1FF0101B1FF0101B1FF0101B1FF0101B1FF0101B1FF0101B1FF0101B1FF0000
    00FF000000FF0000000000000000A0A0A09F000000FF000000FF000000FF0101
    B1FF0101B1FF000000000000000000000000000000000101B1FF0101B1FF0000
    00FF000000FFA0A0A05FA0A0A0FFBDBDBDFFEDEDEDFF000000FF000000FF0101
    B1FF0101B1FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A09F0101B1FF0101B1FF0000
    00FF000000FFBDBDBDFFE9E9E9FFFFFFFFFFFFFFFFFF000000FF000000FF0101
    B1FF0101B1FFFFFFFFFFFFFFFFFFF8F8F8FFC0C0C0FF0101B1FF0101B1FF0000
    0000A0A0A0FFEBEBEBFFFBFBFBFFF6F6F6FFF4F4F4FFFFFFFFFFCC6600FFFFFF
    FFFFF4F4F4FFF4F4F4FFF4F4F4FFFAFAFAFFF9F9F9FFA0A0A0FF000000000000
    0000A0A0A0FFFFFFFFFFFAFAFAFFF8F8F8FFF8F8F8FFFFFFFFFFF0D1B2FFFFFF
    FFFFFCFCFCFFF8F8F8FFF8F8F8FFF8F8F8FFFFFFFFFFA0A0A0FF000000000000
    0000A0A0A0FFFFFFFFFFFCFCFCFFFCFCFCFFFCFCFCFFFFFFFFFFCC6600FFCC66
    00FFFFFFFFFFFEFEFEFFFCFCFCFFFCFCFCFFFFFFFFFFA0A0A0FF000000000000
    0000A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFCC6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0FF000000000000
    0000A0A0A0FFF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFCC6600FFCC6600FFCC66
    00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3FFA0A0A0FF000000000000
    0000A0A0A060C4C4C4FFF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3FFC4C4C4FFA0A0A060000000000000
    000000000000A0A0A060A0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0
    A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A06000000000000000003C3C
    00001C3C00000C3C0000040000002000000030000000303C0000000000000000
    0000800100008001000080010000800100008001000080010000C0030000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 603
    Width = 837
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited pnTable: TPanel
    Top = 576
    Width = 1111
    Height = 17
    Align = alNone
    TabOrder = 8
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 837
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
      object TBItemAktRogd: TTBItem [12]
        Caption = #1079'/'#1072' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080
        ImageIndex = 83
        OnClick = TBItemAktRogdClick
      end
      object TBItemAktBrak: TTBItem [13]
        Caption = #1079'/'#1072' '#1086' '#1073#1088#1072#1082#1077
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1073#1088#1072#1082#1077
        ImageIndex = 51
        Visible = False
        OnClick = TBItemAktBrakClick
      end
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      inherited TBSubmenuRun: TTBSubmenuItem
        Visible = False
      end
      inherited TBItemSeekAkt: TTBItem
        Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072
        Hint = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1087#1086' '#1085#1086#1084#1077#1088#1091' '#1080' '#1076#1072#1090#1077
        Visible = True
      end
      inherited TBItemZAGS: TTBItem
        Visible = False
      end
      inherited TBItemShablon: TTBItem
        Visible = True
      end
      inherited TBItemEditMemo: TTBItem
        Visible = True
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 299
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
    TabOrder = 9
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
    Top = 645
    Width = 837
  end
  inherited pnAdd: TPanel
    Width = 837
    TabOrder = 0
  end
  object pnFIO: TPanel [6]
    Left = 0
    Top = 83
    Width = 837
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 0
      Top = 3
      Width = 825
      Height = 52
      Caption = ' '#1047#1072#1103#1074#1080#1090#1077#1083#1100' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label10: TLabel
        Left = 12
        Top = 21
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
        Left = 237
        Top = 21
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
        Left = 416
        Top = 21
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
      object edFamilia: TDBEditEh
        Left = 79
        Top = 15
        Width = 138
        Height = 26
        DataField = 'Familia1'
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
        Left = 277
        Top = 15
        Width = 122
        Height = 26
        DataField = 'Name1'
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
        OnUpdateData = edNameUpdateData
      end
      object edOtch: TDBEditEh
        Left = 485
        Top = 15
        Width = 131
        Height = 26
        DataField = 'Otch1'
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
        OnUpdateData = edNameUpdateData
      end
      object edZvl: TDBComboBoxEh
        Left = 642
        Top = 15
        Width = 86
        Height = 26
        HelpContext = 888
        DataField = 'ZV'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Items.Strings = (
          #1054#1090#1077#1094
          #1052#1072#1090#1100)
        KeyItems.Strings = (
          #1052
          #1046)
        ParentFont = False
        TabOrder = 3
        Visible = True
      end
    end
  end
  object gbGit: TGroupBox [7]
    Left = 0
    Top = 140
    Width = 837
    Height = 103
    Align = alTop
    Caption = ' '#1052#1077#1089#1090#1086' '#1087#1086#1089#1090#1086#1103#1085#1085#1086#1075#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label15: TLabel
      Left = 10
      Top = 21
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
      Left = 448
      Top = 21
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
      Left = 112
      Top = 48
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
      Left = 448
      Top = 48
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
      Left = 28
      Top = 75
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
      Left = 161
      Top = 19
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
      Left = 189
      Top = 17
      Width = 233
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
      Left = 543
      Top = 19
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
      TabOrder = 2
      TabStop = False
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object edGT_GOROD: TDBEditEh
      Left = 619
      Top = 44
      Width = 177
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
      TabOrder = 6
      Visible = True
    end
    object edGT_GOROD_R: TDBEditEh
      Left = 189
      Top = 71
      Width = 428
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
    object edGT_B_GOROD: TDBLookupComboboxEh
      Left = 564
      Top = 44
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
      TabOrder = 5
      Visible = True
    end
    object edGT_RN: TDBEditEh
      Left = 189
      Top = 44
      Width = 233
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
      TabOrder = 4
      Visible = True
    end
    object edGT_OBL: TDBEditEh
      Left = 564
      Top = 17
      Width = 233
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
      TabOrder = 3
      Visible = True
    end
  end
  object gbAktRogd: TGroupBox [8]
    Left = 0
    Top = 243
    Width = 837
    Height = 80
    Align = alTop
    Caption = ' '#1047#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080' '#1088#1077#1073#1077#1085#1082#1072'  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    DesignSize = (
      837
      80)
    object Label16: TLabel
      Left = 6
      Top = 25
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
    object Label17: TLabel
      Left = 126
      Top = 24
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
    object Label18: TLabel
      Left = 298
      Top = 25
      Width = 67
      Height = 13
      Caption = #1089#1086#1074#1077#1088#1096#1077#1085#1085#1086#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 7
      Top = 52
      Width = 47
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 211
      Top = 52
      Width = 22
      Height = 13
      Caption = #1048#1084#1103' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 381
      Top = 52
      Width = 52
      Height = 13
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edRNomer: TDBEditEh
      Left = 27
      Top = 19
      Width = 86
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
    object edRDate: TDBDateTimeEditEh
      Left = 160
      Top = 19
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
    object edRZAGS: TDBEditEh
      Left = 379
      Top = 19
      Width = 444
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
    end
    object edRFamilia: TDBEditEh
      Left = 66
      Top = 46
      Width = 122
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
      TabOrder = 3
      Visible = True
    end
    object edRName: TDBEditEh
      Left = 243
      Top = 46
      Width = 118
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
      TabOrder = 4
      Visible = True
      OnUpdateData = edRNameUpdateData
    end
    object edROtch: TDBEditEh
      Left = 442
      Top = 46
      Width = 129
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
      TabOrder = 5
      Visible = True
      OnUpdateData = edRNameUpdateData
    end
    object N_F_cbIsMy: TDBCheckBoxEh
      Left = 379
      Top = -1
      Width = 77
      Height = 17
      Hint = #1047#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1093#1088#1072#1085#1080#1090#1100#1089#1103' '#1074' '#1084#1086#1077#1084' '#1079#1072#1075#1089#1077
      Caption = #1084#1086#1081' '#1079#1072#1075#1089
      DataField = 'IS_MY'
      DataSource = dsDokument
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      TabStop = False
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = N_F_cbIsMyClick
    end
    object N_F_cbSklon: TDBCheckBoxEh
      Left = 745
      Top = -1
      Width = 76
      Height = 17
      Hint = #1057#1082#1083#1086#1085#1103#1090#1100' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1047#1040#1043#1057' '#1087#1088#1080' '#1087#1077#1095#1072#1090#1080
      Caption = #1089#1082#1083#1086#1085#1103#1090#1100
      DataField = 'IS_SKLON'
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
    object N_F_cbSklonR: TDBCheckBoxEh
      Left = 746
      Top = 50
      Width = 73
      Height = 17
      Hint = #1057#1082#1083#1086#1085#1103#1090#1100' '#1060#1048#1054' '#1087#1088#1080' '#1087#1077#1095#1072#1090#1080
      Caption = #1089#1082#1083#1086#1085#1103#1090#1100
      DataField = 'IS_SKLONR'
      DataSource = dsDokument
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      TabStop = False
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object edDateR: TDBDateTimeEditEh
      Left = 610
      Top = 46
      Width = 105
      Height = 26
      Hint = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103' '#1088#1077#1073#1077#1085#1082#1072
      HelpKeyword = '4'
      DataField = 'DateR'
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
      OnUpdateData = edDateRUpdateData
      EditFormat = 'DD/MM/YYYY      '
    end
  end
  object pnRukov: TPanel [9]
    Left = 0
    Top = 603
    Width = 837
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
    object lbRukov: TvchDBText
      Left = 1
      Top = 8
      Width = 490
      Height = 30
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
      Left = 770
      Top = 5
      Width = 31
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
      Visible = False
    end
    object edRukov: TDBEditEh
      Left = 497
      Top = 5
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
    object edSpec: TDBEditEh
      Left = 789
      Top = 9
      Width = 33
      Height = 24
      Hint = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1087#1086#1076#1087#1080#1089#1100' '#1082' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1102
      DataField = 'SPEC'
      DataSource = dsDokument
      EditButtons = <
        item
          Style = ebsEllipsisEh
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object cbRazr: TDBCheckBoxEh
      Left = 725
      Top = 8
      Width = 47
      Height = 17
      Hint = #1055#1077#1095#1072#1090#1100' '#1074' '#1092#1086#1088#1084#1077' "'#1088#1072#1079#1088#1077#1096#1077#1085#1086'"'
      Caption = #1059#1090#1074#1077#1088#1078#1076#1077#1085#1086
      DataField = 'PRINT_RAZR'
      DataSource = dsDokument
      TabOrder = 2
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Visible = False
    end
  end
  object gbSvid: TPanel [10]
    Left = 0
    Top = 468
    Width = 837
    Height = 138
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 6
    object Label4: TLabel
      Left = 12
      Top = 108
      Width = 279
      Height = 13
      Caption = #1042#1099#1076#1072#1085#1086' '#1087#1086#1074#1090#1086#1088#1085#1086#1077' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 386
      Top = 106
      Width = 16
      Height = 16
      Caption = #8470
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbIDENTIF: TLabel
      Left = 12
      Top = 81
      Width = 214
      Height = 13
      Caption = #1055#1086#1083#1091#1095#1077#1085' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 536
      Top = 108
      Width = 31
      Height = 13
      Caption = #1044#1072#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 12
      Top = 9
      Width = 150
      Height = 13
      Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1074#1090#1086#1088#1086#1084' '#1088#1086#1076#1080#1090#1077#1083#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 12
      Top = 36
      Width = 179
      Height = 13
      Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 324
      Top = 38
      Width = 12
      Height = 13
      Caption = #1086#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edSVID_SERIAP: TDBLookupComboboxEh
      Left = 309
      Top = 102
      Width = 63
      Height = 26
      DataField = 'SVID_SERIAP'
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
      TabOrder = 4
      Visible = True
    end
    object edSvid_NomerP: TDBEditEh
      Left = 409
      Top = 102
      Width = 98
      Height = 26
      DataField = 'SVID_NOMERP'
      DataSource = dsDokument
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 5
      Visible = True
      EditMask = '9999999;0;_'
    end
    object ENG_edIDENTIF: TDBEditEh
      Left = 309
      Top = 75
      Width = 132
      Height = 26
      CharCase = ecUpperCase
      Color = clInfoBk
      DataField = 'IDENTIF'
      DataSource = dsDokument
      EditButtons = <
        item
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000000000000000007F7F
            7F000101B1000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000B00000000002020940001ABFF001820940001000000E401
            4B00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000001D0008EB0D0000000000382094000500A000AF0100002802
            4B00002A470020000B0050E20D000100000000EB0D005C20940023E0FE00A5DF
            FE00000000000000000000000000E02094003ABC4800E020940094BC4800B700
            00000200000094229400010000001800000000000000B8209400420000000000
            0000A4209400000000000000000000000000000000000C000000020000000101
            00001C2194000000000000001D0020FFE100000000000300000004001400521B
            720008EB0D000000000038060000B8FDE1000100000018FFE1000021940023E0
            FE0038060000342194000100000018FFE10014219400A8E6FE0000001D000000
            000020FFE100242194007FE6FE0020FFE100020000003C219400D853DD003421
            94009422940000000000000000007C229400CF034B00A8094D00000000000000
            0000702294000200000080000000000000000001000004239400E911AD00443A
            5C006F776E006F6164005C696E00626D7000C8E14A004800490070014900F0A9
            4C00E0054900480049002C21940060AA4C0050229400D5710300A2B0DC00FEFF
            FF008CE3FE00F2E0FE002C000000D022940010000000F2E0FE002C0000000423
            940010000000E06ADD0000000000000000000000000000004800F0A94C000000
            00000000000018004F007C050000D86ADD001822940023E0FE0018A84C000100
            0000E8A94C002C22940023E0FE00F0A94C0000000000E911AD00E8A94C004022
            9400DD14DD000000480000000000F0A94C0088229400A8034900000048000000
            0000F0A94C0000000000D0229400E911AD00A0011000000001002F1A00000000
            05000C00000000000000010000000F000000F61B4600A8094D00010101010101
            0101010101010101010101010101010101010101010101010101010101010101
            0101010101010101010101010101010101010101010101010101000001010101
            0000020201010101020200000001010100000202010101010202000000000101
            0000020201010101020200000000000100000202020202020202000001000000
            0000020202020202020200000101000000000202020202020202000001010100
            0000020201010101020200000101010100000202010101010202000001010101
            0000020201010101020201010101010101010101010101010101010101010101
            0101010101010101010101010101010101010101010101010101}
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1079#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#1085#1099#1093' (Insert)'
          ShortCut = 45
          Style = ebsGlyphEh
          Visible = False
          Width = 24
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = True
    end
    object edDateSv: TDBDateTimeEditEh
      Left = 579
      Top = 102
      Width = 142
      Height = 26
      DataField = 'DATESV'
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
      EditFormat = 'DD/MM/YYYY      '
    end
    object edSvedTwo: TDBEditEh
      Left = 204
      Top = 3
      Width = 615
      Height = 26
      DataField = 'SVED_TWO'
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
    object edNomerZv: TDBEditEh
      Left = 204
      Top = 32
      Width = 106
      Height = 21
      DataField = 'NOMERZV'
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
      EditMask = ''
    end
    object edDateZv: TDBDateTimeEditEh
      Left = 347
      Top = 32
      Width = 116
      Height = 21
      DataField = 'DATEZV'
      DataSource = dsDokument
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = True
      EditFormat = 'DD/MM/YYYY      '
    end
  end
  object pnDoks: TPanel [11]
    Left = 0
    Top = 323
    Width = 837
    Height = 145
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object gbDoks: TGroupBox
      Left = 1
      Top = 3
      Width = 827
      Height = 136
      Caption = ' '#1047#1072#1103#1074#1080#1090#1077#1083#1077#1084' '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1083#1077#1085#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label69: TLabel
        Left = 155
        Top = 48
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
      object Label70: TLabel
        Left = 560
        Top = 48
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
      object lbSvid: TLabel
        Left = 12
        Top = 108
        Width = 187
        Height = 13
        Caption = 'C'#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080' '#1088#1077#1073#1077#1085#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label55: TLabel
        Left = 288
        Top = 106
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
      object edD1_DOK_TYPE: TDBComboBoxEh
        Left = 14
        Top = 19
        Width = 303
        Height = 26
        DataField = 'D1_DOK_TYPE'
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
      object edD1_DOK_SERIA: TDBEditEh
        Left = 14
        Top = 45
        Width = 33
        Height = 26
        CharCase = ecUpperCase
        DataField = 'D1_DOK_SERIA'
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
      object edD1_DOK_NOMER: TDBEditEh
        Left = 58
        Top = 45
        Width = 89
        Height = 26
        DataField = 'D1_DOK_NOMER'
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
      object edD1_DOKUMENT: TDBEditEh
        Left = 14
        Top = 71
        Width = 378
        Height = 26
        DataField = 'D1_DOKUMENT'
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
      object edD1_DOK_DATE: TDBDateTimeEditEh
        Left = 175
        Top = 45
        Width = 142
        Height = 26
        DataField = 'D1_DOK_DATE'
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
      object edD2_DOK_TYPE: TDBComboBoxEh
        Left = 420
        Top = 19
        Width = 303
        Height = 26
        DataField = 'D2_DOK_TYPE'
        DataSource = dsDokument
        EditButtons = <
          item
            Style = ebsGlyphEh
            OnClick = edD2_DOK_TYPEEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = True
      end
      object edD2_DOK_SERIA: TDBEditEh
        Left = 420
        Top = 45
        Width = 33
        Height = 26
        CharCase = ecUpperCase
        DataField = 'D2_DOK_SERIA'
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
      object edD2_DOK_NOMER: TDBEditEh
        Left = 465
        Top = 45
        Width = 89
        Height = 26
        DataField = 'D2_DOK_NOMER'
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
      object edD2_DOKUMENT: TDBEditEh
        Left = 420
        Top = 71
        Width = 378
        Height = 26
        DataField = 'D2_DOKUMENT'
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
      object edD2_DOK_DATE: TDBDateTimeEditEh
        Left = 582
        Top = 45
        Width = 142
        Height = 24
        DataField = 'D2_DOK_DATE'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 8
        Visible = True
      end
      object edSVID_SERIA: TDBLookupComboboxEh
        Left = 208
        Top = 102
        Width = 63
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
        TabOrder = 10
        Visible = True
      end
      object edSvid_Nomer: TDBEditEh
        Left = 311
        Top = 102
        Width = 109
        Height = 26
        DataField = 'SVID_NOMER'
        DataSource = dsDokument
        EditButtons = <
          item
            Style = ebsGlyphEh
            OnClick = edSvid_NomerEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        TabOrder = 11
        Visible = True
        EditMask = '9999999;0;_'
      end
    end
  end
  object pn: TPanel [12]
    Left = 0
    Top = 50
    Width = 837
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbNomer: TLabel
      Left = 14
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
    object Label11: TLabel
      Left = 150
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
    object edNomer: TDBEditEh
      Left = 68
      Top = 6
      Width = 68
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
      Left = 180
      Top = 6
      Width = 142
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
  end
  inherited dsDokument: TDataSource
    Left = 672
    Top = 218
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
        Name = 'D1_DOK_TYPE'
        DataType = ftInteger
      end
      item
        Name = 'D1_DOK_SERIA'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'D1_DOK_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'D1_DOK_ORGAN'
        DataType = ftInteger
      end
      item
        Name = 'D1_DOK_DATE'
        DataType = ftDate
      end
      item
        Name = 'D1_DOKUMENT'
        DataType = ftMemo
      end
      item
        Name = 'D2_DOK_TYPE'
        DataType = ftInteger
      end
      item
        Name = 'D2_DOK_SERIA'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'D2_DOK_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'D2_DOK_ORGAN'
        DataType = ftInteger
      end
      item
        Name = 'D2_DOK_DATE'
        DataType = ftDate
      end
      item
        Name = 'D2_DOKUMENT'
        DataType = ftMemo
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
        Name = 'DELETE_CRLF'
        DataType = ftBoolean
      end
      item
        Name = 'PRINT_POVTOR'
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
        Name = 'R_NOMER'
        DataType = ftString
        Size = 10
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
        Name = 'SPEC'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DOLG_SPEC'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PRINT_RAZR'
        DataType = ftBoolean
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
        Name = 'SVID_SERIAP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SVID_NOMERP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IDENTIF'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'IS_MY'
        DataType = ftBoolean
      end
      item
        Name = 'R_Familia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'R_Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'R_Otch'
        DataType = ftString
        Size = 30
      end>
    Left = 632
    Top = 178
    object DokumentID_ZAGS: TIntegerField [3]
      FieldName = 'ID_ZAGS'
    end
    object DokumentD1_DOK_TYPE: TIntegerField [9]
      FieldName = 'D1_DOK_TYPE'
    end
    object DokumentD1_DOK_SERIA: TStringField [10]
      FieldName = 'D1_DOK_SERIA'
      Size = 7
    end
    object DokumentD1_DOK_NOMER: TStringField [11]
      FieldName = 'D1_DOK_NOMER'
      Size = 10
    end
    object DokumentD1_DOK_ORGAN: TIntegerField [12]
      FieldName = 'D1_DOK_ORGAN'
    end
    object DokumentD1_DOK_DATE: TDateField [13]
      FieldName = 'D1_DOK_DATE'
    end
    object DokumentD1_DOKUMENT: TMemoField [14]
      FieldName = 'D1_DOKUMENT'
      BlobType = ftMemo
    end
    object DokumentD2_DOK_TYPE: TIntegerField [15]
      FieldName = 'D2_DOK_TYPE'
    end
    object DokumentD2_DOK_SERIA: TStringField [16]
      FieldName = 'D2_DOK_SERIA'
      Size = 7
    end
    object DokumentD2_DOK_NOMER: TStringField [17]
      FieldName = 'D2_DOK_NOMER'
      Size = 10
    end
    object DokumentD2_DOK_ORGAN: TIntegerField [18]
      FieldName = 'D2_DOK_ORGAN'
    end
    object DokumentD2_DOK_DATE: TDateField [19]
      FieldName = 'D2_DOK_DATE'
    end
    object DokumentD2_DOKUMENT: TMemoField [20]
      FieldName = 'D2_DOKUMENT'
      BlobType = ftMemo
    end
    object DokumentNOMER: TIntegerField
      FieldName = 'NOMER'
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
    object DokumentGRAG: TIntegerField
      FieldName = 'GRAG'
    end
    object DokumentDateR: TDateField
      FieldName = 'DateR'
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
      Size = 30
    end
    object DokumentGT_RAION: TStringField
      FieldName = 'GT_RAION'
      Size = 30
    end
    object DokumentGT_RNGOROD: TStringField
      FieldName = 'GT_RNGOROD'
      Size = 30
    end
    object DokumentGT_B_GOROD: TSmallintField
      FieldName = 'GT_B_GOROD'
    end
    object DokumentGT_GOROD: TStringField
      FieldName = 'GT_GOROD'
      Size = 30
    end
    object DokumentGT_GOROD_R: TStringField
      FieldName = 'GT_GOROD_R'
      Size = 50
    end
    object DokumentR_NOMER: TStringField
      FieldName = 'R_NOMER'
      Size = 10
    end
    object DokumentR_DATE: TDateField
      FieldName = 'R_DATE'
    end
    object DokumentR_ZAGS: TMemoField
      FieldName = 'R_ZAGS'
      BlobType = ftMemo
    end
    object DokumentRUKOV: TStringField
      FieldName = 'RUKOV'
      Size = 60
    end
    object DokumentDOLG_RUKOV: TStringField
      FieldName = 'DOLG_RUKOV'
      Size = 200
    end
    object DokumentSPEC: TStringField
      FieldName = 'SPEC'
      Size = 60
    end
    object DokumentDOLG_SPEC: TStringField
      FieldName = 'DOLG_SPEC'
      Size = 100
    end
    object DokumentPRINT_RAZR: TBooleanField
      FieldName = 'PRINT_RAZR'
    end
    object DokumentSVID_SERIA: TStringField
      FieldName = 'SVID_SERIA'
      Size = 10
    end
    object DokumentSVID_NOMER: TStringField
      FieldName = 'SVID_NOMER'
    end
    object DokumentSVID_SERIAP: TStringField
      FieldName = 'SVID_SERIAP'
      Size = 10
    end
    object DokumentSVID_NOMERP: TStringField
      FieldName = 'SVID_NOMERP'
    end
    object DokumentIDENTIF: TStringField
      FieldName = 'IDENTIF'
      Size = 14
    end
    object DokumentIS_MY: TBooleanField
      FieldName = 'IS_MY'
    end
    object DokumentFamilia1: TStringField
      FieldName = 'Familia1'
      Size = 50
    end
    object DokumentName1: TStringField
      FieldName = 'Name1'
      Size = 30
    end
    object DokumentOtch1: TStringField
      FieldName = 'Otch1'
      Size = 30
    end
    object DokumentIS_SKLON: TBooleanField
      FieldName = 'IS_SKLON'
    end
    object DokumentIS_SKLONR: TBooleanField
      FieldName = 'IS_SKLONR'
    end
    object DokumentD1_IDENTIF: TStringField
      FieldName = 'D1_IDENTIF'
      Size = 14
    end
    object DokumentD2_IDENTIF: TStringField
      FieldName = 'D2_IDENTIF'
      Size = 14
    end
    object DokumentDATEZV: TDateField
      FieldName = 'DATEZV'
    end
    object DokumentNOMERZV: TStringField
      FieldName = 'NOMERZV'
      Size = 15
    end
    object DokumentFamilia2: TStringField
      FieldName = 'Familia2'
      Size = 50
    end
    object DokumentName2: TStringField
      FieldName = 'Name2'
      Size = 30
    end
    object DokumentOtch2: TStringField
      FieldName = 'Otch2'
      Size = 30
    end
    object DokumentSVED_TWO: TMemoField
      FieldName = 'SVED_TWO'
      BlobType = ftMemo
    end
    object DokumentZV: TStringField
      FieldName = 'ZV'
      Size = 1
    end
    object DokumentDATESV: TDateField
      FieldName = 'DATESV'
    end
  end
  object dsStran: TDataSource [15]
    DataSet = dmBase.SprStran
    Left = 676
    Top = 321
  end
  object dsNation: TDataSource [16]
    DataSet = dmBase.SprNac
    Left = 772
    Top = 329
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 704
    Top = 130
  end
  inherited HistZAGS: TkbmMemTable
    Left = 776
    Top = 98
  end
  inherited dsSeria: TDataSource
    Left = 656
    Top = 370
  end
  inherited dsObl: TDataSource
    Left = 536
    Top = 378
  end
  object dsGragd: TDataSource [21]
    Left = 612
    Top = 321
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 760
    Top = 146
  end
  inherited dsPovtor: TDataSource
    Left = 728
    Top = 314
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
    Left = 792
    Top = 202
  end
  inherited ImGISUN: TImageList
    Left = 732
    Top = 35
  end
  inherited dsVoenkom: TDataSource
    Top = 114
  end
  inherited dsRovd: TDataSource
    Top = 114
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 712
    Top = 154
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 664
    Top = 154
  end
  object ApplicationEvents1: TApplicationEvents
    Left = 742
    Top = 336
  end
end
