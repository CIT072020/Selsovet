inherited fmZapisOpeka: TfmZapisOpeka
  Left = 439
  Top = 82
  ActiveControl = edDateUst
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086#1073' '#1086#1087#1077#1082#1077' /'#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100#1089#1090#1074#1077'/'
  ClientHeight = 768
  ClientWidth = 974
  Constraints.MinHeight = 780
  Constraints.MinWidth = 900
  Icon.Data = {
    0000010001001010000001000400280100001600000028000000100000002000
    0000010004000000000080000000000000000000000000000000000000000000
    0000800000000080000080800000000080008000800000808000C0C0C0008080
    8000FF00000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF000000
    0000000000000000000000000000999999900000C00009900000000CC0000007
    F00000CCCC00000F00000CCCCCC00007F7F000CCCCCC000F7F70000CC0CC0000
    F7F70000C00C000F7F100000000C0000F7F00000000C00000000000000C00000
    000000000000000000000000000000000000000000000000000000000000FFFF
    0000FFFF000000F7000001E7000083C30000C0810000C0C0000080E400000076
    000000FE0000007E0000007D000080FF0000C1FF0000FFFF0000FFFF0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 746
    Width = 974
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited pnTable: TPanel
    Top = 746
    Width = 974
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 974
    inherited TBToolbar: TTBToolbar
      DockPos = 96
      object TBSubmenuGISUN: TTBSubmenuItem [5]
        Caption = #1042#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1077' '#1089' '#1043#1048#1057' '#1056#1053
        ImageIndex = 5
        Images = ImGISUN
        object TBItemStep1: TTBItem
          Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
          OnClick = TBItemStep1Click
        end
        object TBSeparatorItem1: TTBSeparatorItem
        end
        object TBItemStep2: TTBItem
          Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100
          OnClick = TBItemStep2Click
        end
        object TBItemStep2ust: TTBItem
          Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077
          Visible = False
          OnClick = TBItemStep2ustClick
        end
      end
      object TBItemClearLich: TTBItem [9]
        Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100
        Hint = #1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1083#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090' '#1086#1090' '#1072#1082#1090#1072' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080
        ImageIndex = 34
        Visible = False
      end
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      object TBItemCreatePopech18: TTBItem [19]
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1086' '#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100#1089#1090#1074#1077
        Hint = 
          #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1086' '#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100#1089#1090#1074#1077' '#1085#1072#1076' '#1085#1077#1089#1086#1074#1077#1088#1096#1077#1085#1085#1086#1083#1077#1090#1085#1080#1084' '#1086#1090' 14 '#1076#1086' ' +
          '18'
        ImageIndex = 26
        OnClick = TBItemCreatePopech18Click
      end
      object TBItemChOpeka: TTBItem [22]
        Caption = #1042#1099#1073#1086#1088' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086#1073' '#1086#1087#1077#1082#1077
        Hint = #1042#1099#1073#1086#1088' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086#1073' '#1086#1087#1077#1082#1077' '#1080' '#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100#1089#1090#1074#1077
        ImageIndex = 90
        OnClick = TBItemChOpekaClick
      end
      inherited TBItemShablon: TTBItem
        Visible = True
      end
      inherited TBItemEditMemo: TTBItem
        Visible = True
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 414
      end
    end
  end
  inherited sb: TScrollBox
    Width = 974
    Height = 696
    Align = alClient
    inherited pnPovtor: TPanel
      TabOrder = 3
      inherited imBE: TImage
        Anchors = [akTop]
      end
    end
    object pn: TPanel
      Left = 0
      Top = 0
      Width = 974
      Height = 176
      Align = alTop
      TabOrder = 0
      DesignSize = (
        974
        176)
      object ImageGISUN: TImage
        Left = 946
        Top = 5
        Width = 20
        Height = 20
        Anchors = [akTop, akRight]
        Transparent = True
      end
      object Label69: TLabel
        Left = 352
        Top = 39
        Width = 14
        Height = 13
        Caption = #8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label72: TLabel
        Left = 6
        Top = 39
        Width = 83
        Height = 13
        Caption = #1059#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label71: TLabel
        Left = 352
        Top = 72
        Width = 14
        Height = 13
        Caption = #8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label74: TLabel
        Left = 16
        Top = 72
        Width = 80
        Height = 13
        Caption = #1055#1088#1077#1082#1088#1072#1097#1077#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDateEditGIS: TvchDBText
        Left = 514
        Top = 101
        Width = 450
        Height = 17
        Hint = #1044#1072#1090#1072' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080' '#1088#1077#1082#1074#1080#1079#1080#1090#1086#1074' '#1043#1048#1057' '#1056#1053
        Color = clBtnFace
        DataField = 'DATE_EDIT_GIS'
        DataSource = dsDokument
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        OnGetText = lbDateEditGISGetText
      end
      object lbDatePostGIS: TvchDBText
        Left = 904
        Top = 5
        Width = 31
        Height = 17
        Hint = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1074' '#1043#1048#1057' '#1056#1053
        DataField = 'DATE_POST_GIS'
        DataSource = dsDokument
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        OnGetText = lbDatePostGISGetText
      end
      object Bevel2: TBevel
        Left = 3
        Top = 60
        Width = 965
        Height = 7
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object Bevel3: TBevel
        Left = 455
        Top = 98
        Width = 3
        Height = 28
      end
      object Label64: TLabel
        Left = 6
        Top = 103
        Width = 42
        Height = 13
        Caption = #1087#1088#1080#1095#1080#1085#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 445
        Top = 39
        Width = 14
        Height = 13
        Caption = #1086#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label61: TLabel
        Left = 445
        Top = 72
        Width = 14
        Height = 13
        Caption = #1086#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDokToText: TLabel
        Left = 6
        Top = 128
        Width = 72
        Height = 13
        Caption = 'lbDokToText'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label66: TLabel
        Left = 6
        Top = 152
        Width = 58
        Height = 13
        Caption = #1087#1077#1088#1077#1076#1072#1085#1086' '#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label70: TLabel
        Left = 630
        Top = 152
        Width = 42
        Height = 13
        Caption = #1087#1088#1080#1095#1080#1085#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object StaticText1: TStaticText
        Left = 525
        Top = 8
        Width = 19
        Height = 19
        Hint = #1044#1088#1091#1075#1072#1103' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1091#1089#1090#1072#1085#1086#1074#1080#1083#1072' '#1086#1087#1077#1082#1091
        AutoSize = False
        Caption = #1044#1088#1091#1075#1072#1103#13#10#1086#1088#1075#1072#1085#1080#1079#1072#1085#1080#1103
        TabOrder = 13
        Visible = False
      end
      object edNomer: TDBEditEh
        Left = 904
        Top = 93
        Width = 25
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
        TabOrder = 11
        Visible = False
      end
      object N_F_1: TDBCheckBoxEh
        Left = 837
        Top = 9
        Width = 44
        Height = 17
        Caption = '1-'#1099#1081' '#1101#1082#1079#1077#1084#1087#1083#1103#1088
        DataField = 'First_Ekz'
        DataSource = dsDokument
        TabOrder = 12
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        Visible = False
      end
      object edDateUst: TDBDateTimeEditEh
        Left = 133
        Top = 32
        Width = 115
        Height = 26
        Hint = #1044#1072#1090#1072' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103' '#1086#1087#1077#1082#1080' ('#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100#1089#1090#1074#1072')'
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
        OnCheckDrawRequiredState = GisunCheckDrawRequiredState
      end
      object edNomerUst: TDBEditEh
        Left = 374
        Top = 32
        Width = 61
        Height = 26
        DataField = 'NOMER_UST'
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
        OnCheckDrawRequiredState = NomerCheckDrawRequiredState
      end
      object edDateOtm: TDBDateTimeEditEh
        Left = 133
        Top = 65
        Width = 115
        Height = 26
        Hint = #1044#1072#1090#1072' '#1087#1088#1077#1082#1088#1072#1097#1077#1085#1080#1103' '#1086#1087#1077#1082#1080' ('#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100#1089#1090#1074#1072')'
        DataField = 'DATE_OTM'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 6
        Visible = True
        OnCheckDrawRequiredState = edDateOtmCheckDrawRequiredState
      end
      object edNomerOtm: TDBEditEh
        Left = 374
        Top = 65
        Width = 61
        Height = 26
        DataField = 'NOMER_OTM'
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
        OnCheckDrawRequiredState = NomerCheckDrawRequiredState
      end
      object edVid: TDBComboBoxEh
        Left = 6
        Top = 4
        Width = 509
        Height = 26
        DataField = 'VID'
        DataSource = dsDokument
        DropDownBox.Rows = 10
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
        OnChange = edVidChange
        OnCheckDrawRequiredState = GisunCheckDrawRequiredState
      end
      object edPrich: TDBEditEh
        Left = 64
        Top = 96
        Width = 437
        Height = 26
        DataField = 'PRICH_OTM'
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
      object N_F_cbOtheOrg: TDBCheckBoxEh
        Left = 559
        Top = 9
        Width = 15
        Height = 17
        Hint = #1044#1088#1091#1075#1072#1103' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1091#1089#1090#1072#1085#1086#1074#1080#1083#1072' '#1086#1087#1077#1082#1091
        DataField = 'UST_OTHER'
        DataSource = dsDokument
        TabOrder = 5
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        Visible = False
      end
      object N_F_edDocOpeka: TDBComboBoxEh
        Left = 257
        Top = 34
        Width = 85
        Height = 21
        DataField = 'DOC_OPEKA'
        DataSource = dsDokument
        DropDownBox.Rows = 10
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = True
        OnCheckDrawRequiredState = N_F_edDocOpekaCheckDrawRequiredState
      end
      object edUstOrg: TDBEditEh
        Left = 590
        Top = 32
        Width = 378
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        DataField = 'UST_ORG'
        DataSource = dsDokument
        EditButtons = <
          item
            Hint = #1042#1099#1073#1088#1072#1090#1100' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102' '#1091#1089#1090#1072#1085#1086#1074#1080#1074#1096#1091#1102' '#1086#1087#1077#1082#1091
            Style = ebsEllipsisEh
            OnClick = edUstOrgEditButtons0Click
          end
          item
            Glyph.Data = {
              C6010000424DC60100000000000036000000280000000A0000000A0000000100
              2000000000009001000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000FF000000FF000000FF000000FF0000
              000000000000000000000000000000000000000000FF000000FF000000FF0000
              00FF000000FF000000FF00000000000000000000000000000000000000FF0000
              00FF000000000000000000000000000000FF0000000000000000000000000000
              0000000000FF000000FF00000000000000000000000000000000000000000000
              00000000000000000000000000FF000000FF0000000000000000000000000000
              000000000000000000000000000000000000000000FF000000FF000000000000
              000000000000000000FF00000000000000000000000000000000000000FF0000
              00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
              000000000000000000FF000000FF000000FF000000FF00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000}
            Hint = #1042#1099#1073#1088#1072#1090#1100' '#1089#1077#1083#1100#1089#1082#1080#1081' '#1089#1086#1074#1077#1090
            Style = ebsGlyphEh
            OnClick = edUstOrgEditButtons1Click
          end
          item
            Glyph.Data = {
              D6000000424DD60000000000000076000000280000000A0000000C0000000100
              0400000000006000000000000000000000001000000000000000000000008000
              00000080000080800000000080008000800000808000C0C0C00080808000FF00
              000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF00888888888800
              0000800000000800000080BBBBBB0800000080BBBBBB0800000080BBBBBB0800
              000080BBBBBB0800000080BBBBBB0800000080BBB0000800000080BBB0AA0800
              000080BBB0A08800000080000008880000008888888888000000}
            Hint = #1055#1086#1089#1083#1077#1076#1085#1077#1077' '#1074#1099#1073#1088#1072#1085#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
            Style = ebsGlyphEh
            OnClick = edUstOrgEditButtons2Click
          end
          item
            Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
            Style = ebsGlyphEh
            OnClick = edUstOrgEditButtons3Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Visible = True
        OnCheckDrawRequiredState = edUstOrgCheckDrawRequiredState
      end
      object N_F_cbIsControl: TDBCheckBoxEh
        Left = 623
        Top = 9
        Width = 154
        Height = 17
        Hint = #1050#1086#1085#1090#1088#1086#1083#1100' '#1076#1086#1089#1090#1080#1078#1077#1085#1080#1103' '#1074#1086#1079#1088#1072#1089#1090#1072' 14 '#1080#1083#1080' 18 '#1083#1077#1090
        Caption = #1082#1086#1085#1090#1088#1086#1083#1100' '#1074#1086#1079#1088#1072#1089#1090#1072
        DataField = 'IS_CONTROL'
        DataSource = dsDokument
        TabOrder = 14
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object edOtmOrg: TDBEditEh
        Left = 590
        Top = 65
        Width = 378
        Height = 26
        Hint = 
          #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1086#1089#1091#1097#1077#1089#1090#1074#1080#1074#1096#1072#1103' '#1087#1088#1077#1082#1088#1072#1097#1077#1085#1080#1077' ('#1086#1089#1074#1086#1073#1086#1078#1076#1077#1085#1080#1077', '#1086#1090#1089#1090#1088#1072#1085#1077#1080#1077')' +
          ' '#1086#1087#1077#1082#1080' ('#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100#1089#1090#1074#1072')'
        Anchors = [akLeft, akTop, akRight]
        DataField = 'OTM_ORG'
        DataSource = dsDokument
        EditButtons = <
          item
            Hint = #1042#1099#1073#1088#1072#1090#1100' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102
            Style = ebsEllipsisEh
            OnClick = edOtmOrgEditButtons0Click
          end
          item
            Glyph.Data = {
              C6010000424DC60100000000000036000000280000000A0000000A0000000100
              2000000000009001000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000FF000000FF000000FF000000FF0000
              000000000000000000000000000000000000000000FF000000FF000000FF0000
              00FF000000FF000000FF00000000000000000000000000000000000000FF0000
              00FF000000000000000000000000000000FF0000000000000000000000000000
              0000000000FF000000FF00000000000000000000000000000000000000000000
              00000000000000000000000000FF000000FF0000000000000000000000000000
              000000000000000000000000000000000000000000FF000000FF000000000000
              000000000000000000FF00000000000000000000000000000000000000FF0000
              00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
              000000000000000000FF000000FF000000FF000000FF00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000}
            Hint = #1042#1099#1073#1088#1072#1090#1100' '#1089#1077#1083#1100#1089#1082#1080#1081' '#1089#1086#1074#1077#1090
            Style = ebsGlyphEh
            OnClick = edOtmOrgEditButtons1Click
          end
          item
            Glyph.Data = {
              D6000000424DD60000000000000076000000280000000A0000000C0000000100
              0400000000006000000000000000000000001000000000000000000000008000
              00000080000080800000000080008000800000808000C0C0C00080808000FF00
              000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF00888888888800
              0000800000000800000080BBBBBB0800000080BBBBBB0800000080BBBBBB0800
              000080BBBBBB0800000080BBBBBB0800000080BBB0000800000080BBB0AA0800
              000080BBB0A08800000080000008880000008888888888000000}
            Hint = #1055#1086#1089#1083#1077#1076#1085#1077#1077' '#1074#1099#1073#1088#1072#1085#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
            Style = ebsGlyphEh
            OnClick = edOtmOrgEditButtons2Click
          end
          item
            Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
            Style = ebsGlyphEh
            OnClick = edOtmOrgEditButtons3Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        Visible = True
        OnCheckDrawRequiredState = edOtmOrgCheckDrawRequiredState
      end
      object N_F_edDocOpekaO: TDBComboBoxEh
        Left = 257
        Top = 68
        Width = 85
        Height = 21
        DataField = 'DOC_OPEKA_OTM'
        DataSource = dsDokument
        DropDownBox.Rows = 10
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Visible = True
        OnCheckDrawRequiredState = N_F_edDocOpekaOCheckDrawRequiredState
      end
      object N_F_edTypeSn: TDBComboBoxEh
        Left = 6
        Top = 68
        Width = 121
        Height = 21
        DataField = 'TYPE_SN'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 15
        Visible = True
        OnChange = N_F_edTypeSnChange
      end
      object edDateDokUst: TDBDateTimeEditEh
        Left = 465
        Top = 32
        Width = 115
        Height = 26
        Hint = #1044#1072#1090#1072' '#1076#1072#1082#1091#1084#1077#1085#1090#1072
        DataField = 'DATEDOK_UST'
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
        OnCheckDrawRequiredState = edDateDokUstCheckDrawRequiredState
      end
      object edDateDokSn: TDBDateTimeEditEh
        Left = 465
        Top = 65
        Width = 115
        Height = 26
        Hint = #1044#1072#1090#1072' '#1076#1072#1082#1091#1084#1077#1085#1090#1072
        DataField = 'DATEDOK_SN'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 17
        Visible = True
        OnCheckDrawRequiredState = edDateDokSnCheckDrawRequiredState
      end
      object edSendOrg: TDBEditEh
        Left = 76
        Top = 145
        Width = 378
        Height = 26
        Hint = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1082#1091#1076#1072' '#1087#1077#1088#1077#1076#1072#1085#1086' '#1076#1077#1083#1086
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SEND_ORG_SPR'
        DataSource = dsDokument
        EditButtons = <
          item
            Hint = #1042#1099#1073#1088#1072#1090#1100' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102
            Style = ebsEllipsisEh
            OnClick = edSendOrgEditButtons0Click
          end
          item
            Glyph.Data = {
              C6010000424DC60100000000000036000000280000000A0000000A0000000100
              2000000000009001000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000FF000000FF000000FF000000FF0000
              000000000000000000000000000000000000000000FF000000FF000000FF0000
              00FF000000FF000000FF00000000000000000000000000000000000000FF0000
              00FF000000000000000000000000000000FF0000000000000000000000000000
              0000000000FF000000FF00000000000000000000000000000000000000000000
              00000000000000000000000000FF000000FF0000000000000000000000000000
              000000000000000000000000000000000000000000FF000000FF000000000000
              000000000000000000FF00000000000000000000000000000000000000FF0000
              00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
              000000000000000000FF000000FF000000FF000000FF00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000}
            Hint = #1042#1099#1073#1088#1072#1090#1100' '#1089#1077#1083#1100#1089#1082#1080#1081' '#1089#1086#1074#1077#1090
            Style = ebsGlyphEh
            OnClick = edSendOrgEditButtons1Click
          end
          item
            Glyph.Data = {
              D6000000424DD60000000000000076000000280000000A0000000C0000000100
              0400000000006000000000000000000000001000000000000000000000008000
              00000080000080800000000080008000800000808000C0C0C00080808000FF00
              000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF00888888888800
              0000800000000800000080BBBBBB0800000080BBBBBB0800000080BBBBBB0800
              000080BBBBBB0800000080BBBBBB0800000080BBB0000800000080BBB0AA0800
              000080BBB0A08800000080000008880000008888888888000000}
            Hint = #1055#1086#1089#1083#1077#1076#1085#1077#1077' '#1074#1099#1073#1088#1072#1085#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
            Style = ebsGlyphEh
            OnClick = edSendOrgEditButtons2Click
          end
          item
            Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
            Style = ebsGlyphEh
            OnClick = edSendOrgEditButtons3Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
        Visible = True
        OnCheckDrawRequiredState = edOtmOrgCheckDrawRequiredState
      end
      object edSendDate: TDBDateTimeEditEh
        Left = 486
        Top = 145
        Width = 115
        Height = 26
        Hint = #1044#1072#1090#1072' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103' '#1086#1087#1077#1082#1080' ('#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100#1089#1090#1074#1072')'
        DataField = 'SEND_DATE'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 19
        Visible = True
        OnCheckDrawRequiredState = GisunCheckDrawRequiredState
      end
      object edSendPrich: TDBEditEh
        Left = 688
        Top = 145
        Width = 277
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SEND_PRICH'
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
    end
    object pc: TPageControl
      Left = 0
      Top = 176
      Width = 974
      Height = 520
      ActivePage = tsChild
      Align = alClient
      TabOrder = 2
      TabStop = False
      OnChange = pcChange
      object tsChild: TTabSheet
        Caption = #1055#1086#1076#1086#1087#1077#1095#1085#1099#1081
        DesignSize = (
          966
          492)
        object Label4: TLabel
          Left = 3
          Top = 37
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
        object Label5: TLabel
          Left = 530
          Top = 37
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
        object Label6: TLabel
          Left = 3
          Top = 9
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
        object Label24: TLabel
          Left = 239
          Top = 9
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
        object Label25: TLabel
          Left = 475
          Top = 9
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
        object lbIdentif: TLabel
          Left = 221
          Top = 37
          Width = 73
          Height = 13
          Caption = #1048#1076#1077#1085'. '#1085#1086#1084#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 669
          Top = 463
          Width = 55
          Height = 13
          Caption = #1047#1072#1087#1086#1083#1085#1080#1083
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbForma: TLabel
          Left = 339
          Top = 97
          Width = 75
          Height = 13
          Caption = #1060#1086#1088#1084#1072' '#1086#1087#1077#1082#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbTip: TLabel
          Left = 3
          Top = 97
          Width = 49
          Height = 13
          Caption = #1056#1077#1073#1077#1085#1086#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbPrichChild: TLabel
          Left = 3
          Top = 127
          Width = 216
          Height = 13
          Caption = #1055#1088#1080#1095#1080#1085#1072' '#1073#1077#1079' '#1087#1086#1087#1077#1095#1077#1085#1080#1103' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label62: TLabel
          Left = 3
          Top = 155
          Width = 175
          Height = 13
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label63: TLabel
          Left = 3
          Top = 66
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
        object edDateR: TDBDateTimeEditEh
          Left = 640
          Top = 30
          Width = 113
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
          OnUpdateData = edDateRUpdateData
        end
        object edPol: TDBComboBoxEh
          Left = 44
          Top = 30
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
        object edFamilia: TDBEditEh
          Left = 70
          Top = 2
          Width = 145
          Height = 26
          HelpType = htKeyword
          HelpContext = 888
          DataField = 'Familia'
          DataSource = dsDokument
          EditButtons = <
            item
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDDDDDDDDDDDDDDDDDD00000000000DDDDD09999999990DDDDD0999999999
                0DDDDD09999F99990DDDDDD0999F9990DDDDDDDD00FFF00DDDDDDDDDDD000DDD
                DDDDDDDDD07770DDDDDDDDDDD07770DDDDDDDDDDD07770DDDDDDDDDDD00000DD
                DDDDDDDDDD000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
              Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1072#1082#1090#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080
              Style = ebsGlyphEh
              Visible = False
              Width = 20
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
        object edName: TDBEditEh
          Left = 279
          Top = 2
          Width = 145
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
          Left = 547
          Top = 2
          Width = 145
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
        object N_F_cbBelorus: TDBCheckBoxEh
          Left = 920
          Top = 1
          Width = 46
          Height = 16
          Anchors = [akTop, akRight]
          Caption = #1073#1077#1083
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object ENG_edIDENTIF: TDBEditEh
          Left = 311
          Top = 30
          Width = 170
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
          OnCheckDrawRequiredState = GisunCheckDrawRequiredState
        end
        object gbMestoGit: TGroupBox
          Left = 0
          Top = 243
          Width = 965
          Height = 138
          Anchors = [akLeft, akTop, akRight]
          Caption = ' '#1052#1077#1089#1090#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072'  ('#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
          DesignSize = (
            965
            138)
          object Label7: TLabel
            Left = 28
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
            Left = 451
            Top = 20
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
            Left = 22
            Top = 49
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
          object Label37: TLabel
            Left = 409
            Top = 49
            Width = 72
            Height = 13
            Caption = #1088#1072#1081#1086#1085'  '#1075#1086#1088#1086#1076#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label40: TLabel
            Left = 74
            Top = 77
            Width = 30
            Height = 13
            Caption = #1091#1083#1080#1094#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label2: TLabel
            Left = 420
            Top = 77
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
          object Label3: TLabel
            Left = 531
            Top = 77
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
            Left = 659
            Top = 77
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
          object Label59: TLabel
            Left = 568
            Top = 113
            Width = 68
            Height = 13
            Caption = #1089' '#1082#1072#1082#1086#1081' '#1076#1072#1090#1099
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label60: TLabel
            Left = 33
            Top = 113
            Width = 71
            Height = 13
            Caption = #1076#1086#1084'-'#1080#1085#1090#1077#1088#1085#1072#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Bevel1: TBevel
            Left = 5
            Top = 99
            Width = 954
            Height = 5
            Anchors = [akLeft, akTop, akRight]
          end
          object edGT_GOROD: TDBEditEh
            Left = 217
            Top = 42
            Width = 152
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
            TabOrder = 4
            Visible = True
          end
          object edGT_GOROD_R: TDBEditEh
            Left = 150
            Top = 70
            Width = 219
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
            TabOrder = 6
            Visible = True
          end
          object edGT_B_OBL: TDBCheckBoxEh
            Left = 118
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
            TabOrder = 0
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edGT_B_GOROD: TDBLookupComboboxEh
            Left = 150
            Top = 41
            Width = 53
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
            TabOrder = 3
            Visible = True
          end
          object edGT_OBL: TDBEditEh
            Left = 150
            Top = 13
            Width = 219
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
            TabOrder = 1
            Visible = True
          end
          object edGT_RAION: TDBEditEh
            Left = 504
            Top = 13
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
            TabOrder = 2
            Visible = True
          end
          object edGT_RNGOROD: TDBLookupComboboxEh
            Left = 504
            Top = 42
            Width = 205
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
            TabOrder = 5
            Visible = False
          end
          object edGT_DOM: TDBEditEh
            Left = 455
            Top = 70
            Width = 44
            Height = 26
            DataField = 'GT_DOM'
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
          object edGT_KORP: TDBEditEh
            Left = 573
            Top = 70
            Width = 52
            Height = 26
            DataField = 'GT_KORP'
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
          object edGT_KV: TDBEditEh
            Left = 689
            Top = 70
            Width = 46
            Height = 26
            DataField = 'GT_KV'
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
          object edInternatDate: TDBDateTimeEditEh
            Left = 651
            Top = 106
            Width = 115
            Height = 26
            DataField = 'INTERNAT_DATE'
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
          object edInternat: TDBLookupComboboxEh
            Left = 150
            Top = 106
            Width = 367
            Height = 26
            DataField = 'INTERNAT'
            DataSource = dsDokument
            DropDownBox.Width = 300
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = edInternatEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsInternat
            ParentFont = False
            TabOrder = 10
            Visible = True
          end
          object cbLONELY: TDBCheckBoxEh
            Left = 782
            Top = 17
            Width = 106
            Height = 17
            Caption = #1086#1076#1080#1085#1086#1082#1080#1081
            DataField = 'LONELY'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 12
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        object edSpec: TDBEditEh
          Left = 743
          Top = 457
          Width = 214
          Height = 26
          HelpContext = 999
          DataField = 'SPEC'
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
          TabOrder = 15
          Visible = True
        end
        object gbMestoRogd: TGroupBox
          Left = 0
          Top = 172
          Width = 965
          Height = 72
          Anchors = [akLeft, akTop, akRight]
          Caption = ' '#1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
          object Label33: TLabel
            Left = 112
            Top = 46
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
          object Label30: TLabel
            Left = 411
            Top = 18
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
          object Label34: TLabel
            Left = 408
            Top = 46
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
          object Label29: TLabel
            Left = 9
            Top = 18
            Width = 137
            Height = 13
            Caption = #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072' ('#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1086') '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edRG_B_RESP: TDBCheckBoxEh
            Left = 154
            Top = 16
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
            Visible = False
          end
          object edRG_GOSUD: TDBLookupComboboxEh
            Left = 180
            Top = 11
            Width = 205
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
            Left = 496
            Top = 16
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
            TabOrder = 2
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edRG_GOROD: TDBEditEh
            Left = 579
            Top = 39
            Width = 152
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
            TabOrder = 6
            Visible = True
          end
          object edRG_B_GOROD: TDBLookupComboboxEh
            Left = 525
            Top = 39
            Width = 46
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
            TabOrder = 5
            Visible = True
          end
          object edRG_RAION: TDBEditEh
            Left = 180
            Top = 39
            Width = 205
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
            TabOrder = 4
            Visible = True
          end
          object edRG_OBL: TDBEditEh
            Left = 525
            Top = 11
            Width = 205
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
            TabOrder = 3
            Visible = True
          end
        end
        object gbObraz: TGroupBox
          Left = 0
          Top = 381
          Width = 965
          Height = 72
          Anchors = [akLeft, akTop, akRight]
          Caption = ' '#1052#1077#1089#1090#1086' '#1091#1095#1077#1073#1099'  ('#1088#1072#1073#1086#1090#1099')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
          object Label11: TLabel
            Left = 11
            Top = 22
            Width = 36
            Height = 13
            Caption = #1059#1095#1080#1090#1089#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label20: TLabel
            Left = 832
            Top = 19
            Width = 83
            Height = 13
            Caption = #1060#1086#1088#1084#1072' '#1086#1073#1091#1095#1077#1085#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label26: TLabel
            Left = 397
            Top = 22
            Width = 100
            Height = 13
            Caption = #1059#1095#1077#1073#1085#1086#1077' '#1079#1072#1074#1077#1076#1077#1085#1080#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label36: TLabel
            Left = 651
            Top = 22
            Width = 57
            Height = 13
            Caption = #1050#1083#1072#1089#1089'/'#1050#1091#1088#1089
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label65: TLabel
            Left = 11
            Top = 49
            Width = 100
            Height = 13
            Caption = #1043#1076#1077' '#1080' '#1082#1077#1084' '#1088#1072#1073#1086#1090#1072#1077#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edKurs: TDBEditEh
            Left = 720
            Top = 15
            Width = 39
            Height = 26
            DataField = 'KURS'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = False
          end
          object edStudent: TDBComboBoxEh
            Left = 60
            Top = 15
            Width = 307
            Height = 26
            DataField = 'STUDENT'
            DataSource = dsDokument
            DropDownBox.Rows = 15
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            MRUList.Rows = 15
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
          object edStudent_Type: TDBComboBoxEh
            Left = 930
            Top = 12
            Width = 30
            Height = 26
            DataField = 'STUDENT_TYPE'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Visible = False
          end
          object edStudentSpr: TDBLookupComboboxEh
            Left = 516
            Top = 15
            Width = 367
            Height = 26
            DataField = 'STUDENT_SPR'
            DataSource = dsDokument
            DropDownBox.Width = 300
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = edStudentSprEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsStudentSpr
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
          object edPlaceWork: TDBEditEh
            Left = 123
            Top = 42
            Width = 489
            Height = 26
            DataField = 'PLACE_WORK'
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
        object edForma: TDBComboBoxEh
          Left = 428
          Top = 90
          Width = 263
          Height = 26
          Hint = #1060#1086#1088#1084#1072' '#1086#1087#1077#1082#1080
          DataField = 'FORMA'
          DataSource = dsDokument
          DropDownBox.Rows = 10
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
        object edTip: TDBComboBoxEh
          Left = 76
          Top = 90
          Width = 220
          Height = 26
          DataField = 'TIP'
          DataSource = dsDokument
          DropDownBox.Rows = 10
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          Visible = True
          OnChange = edTipChange
        end
        object edPrichChildLais: TDBComboBoxEh
          Left = 678
          Top = 120
          Width = 218
          Height = 26
          DataField = 'PRICH_CHILD'
          DataSource = dsDokument
          DropDownBox.Rows = 20
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
        object edAddDok: TDBEditEh
          Left = 235
          Top = 148
          Width = 679
          Height = 26
          DataField = 'ADD_DOK'
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
        object edGrag: TDBLookupComboboxEh
          Left = 107
          Top = 59
          Width = 277
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
          TabOrder = 6
          Visible = True
        end
        object edPrichChild: TDBLookupComboboxEh
          Left = 235
          Top = 120
          Width = 435
          Height = 26
          DataField = 'PRICH_CHILD'
          DataSource = dsDokument
          DropDownBox.ListSource = dsSprChildPrich
          DropDownBox.Rows = 20
          DropDownBox.Width = 300
          EditButtons = <
            item
              Style = ebsEllipsisEh
              OnClick = edPrichChildEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsSprChildPrich
          ParentFont = False
          TabOrder = 9
          Visible = True
        end
      end
      object tsOpekun: TTabSheet
        Caption = #1054#1087#1077#1082#1091#1085' ('#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100')'
        ImageIndex = 1
        DesignSize = (
          966
          492)
        object Label9: TLabel
          Left = 7
          Top = 11
          Width = 50
          Height = 13
          Caption = #1060#1072#1084#1080#1083#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label12: TLabel
          Left = 267
          Top = 11
          Width = 23
          Height = 13
          Caption = #1048#1084#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 475
          Top = 11
          Width = 56
          Height = 13
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 537
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
        object Label15: TLabel
          Left = 7
          Top = 102
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
        object Label16: TLabel
          Left = 18
          Top = 120
          Width = 134
          Height = 13
          Caption = #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072' ('#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1086')'
        end
        object Label17: TLabel
          Left = 411
          Top = 115
          Width = 76
          Height = 13
          Caption = #1086#1073#1083#1072#1089#1090#1100' ('#1082#1088#1072#1081')'
        end
        object Label18: TLabel
          Left = 120
          Top = 150
          Width = 30
          Height = 13
          Caption = #1088#1072#1081#1086#1085
        end
        object Label19: TLabel
          Left = 427
          Top = 145
          Width = 82
          Height = 13
          Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077')'
        end
        object Label21: TLabel
          Left = 7
          Top = 71
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
        object Label53: TLabel
          Left = 84
          Top = 180
          Width = 72
          Height = 13
          Caption = #1088'-'#1086#1085'  '#1075#1086#1088'., '#1091#1083'.'
        end
        object Label67: TLabel
          Left = 7
          Top = 215
          Width = 115
          Height = 13
          Caption = #1043#1076#1077' '#1080' '#1082#1077#1084' '#1088#1072#1073#1086#1090#1072#1077#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 214
          Top = 41
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
        object Label41: TLabel
          Left = 449
          Top = 178
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
        object Label49: TLabel
          Left = 551
          Top = 178
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
        object Label50: TLabel
          Left = 664
          Top = 178
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
        object lbOtnosh: TLabel
          Left = 509
          Top = 71
          Width = 65
          Height = 13
          Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 7
          Top = 41
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
        object edON_Familia: TDBEditEh
          Left = 83
          Top = 4
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
        end
        object edON_Name: TDBEditEh
          Left = 307
          Top = 4
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
          TabOrder = 1
          Visible = True
        end
        object edON_OTCH: TDBEditEh
          Left = 546
          Top = 4
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
          TabOrder = 2
          Visible = True
        end
        object edON_DATER: TDBDateTimeEditEh
          Left = 650
          Top = 34
          Width = 125
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
        end
        object edON_GOSUD: TDBLookupComboboxEh
          Left = 178
          Top = 113
          Width = 200
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
          TabOrder = 8
          Visible = True
        end
        object edON_GOROD: TDBEditEh
          Left = 581
          Top = 138
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
          TabOrder = 12
          Visible = True
        end
        object edON_GRAG: TDBLookupComboboxEh
          Left = 105
          Top = 64
          Width = 284
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
          TabOrder = 6
          Visible = True
        end
        object edON_B_RESP: TDBCheckBoxEh
          Left = 157
          Top = 118
          Width = 15
          Height = 17
          DataField = 'ON_B_RESP'
          DataSource = dsDokument
          TabOrder = 18
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object edON_B_OBL: TDBCheckBoxEh
          Left = 492
          Top = 113
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ON_B_OBL'
          DataSource = dsDokument
          TabOrder = 19
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edON_GOROD_R: TDBEditEh
          Left = 178
          Top = 173
          Width = 241
          Height = 26
          DataField = 'ON_GOROD_R'
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
        object edON_WORK: TDBEditEh
          Left = 138
          Top = 208
          Width = 489
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
          TabOrder = 17
          Visible = True
        end
        object edON_B_GOROD: TDBLookupComboboxEh
          Left = 526
          Top = 138
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
          TabOrder = 11
          Visible = True
        end
        object ENG_edON_IDENTIF: TDBEditEh
          Left = 314
          Top = 34
          Width = 170
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
            '6241008G012PB8'
            ''
            '')
          ParentFont = False
          TabOrder = 4
          Visible = True
          OnCheckDrawRequiredState = GisunCheckDrawRequiredState
        end
        object edON_OBL: TDBEditEh
          Left = 526
          Top = 108
          Width = 200
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
          TabOrder = 9
          Visible = True
        end
        object edON_RAION: TDBEditEh
          Left = 178
          Top = 143
          Width = 200
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
          TabOrder = 10
          Visible = True
        end
        object edON_DOM: TDBEditEh
          Left = 481
          Top = 171
          Width = 44
          Height = 26
          DataField = 'ON_DOM'
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
        object edON_KORP: TDBEditEh
          Left = 588
          Top = 171
          Width = 52
          Height = 26
          DataField = 'ON_KORP'
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
        object edON_KV: TDBEditEh
          Left = 690
          Top = 171
          Width = 46
          Height = 26
          DataField = 'ON_KV'
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
        object edOtnosh: TDBEditEh
          Left = 592
          Top = 64
          Width = 211
          Height = 26
          DataField = 'OTNOSH'
          DataSource = dsDokument
          EditButtons = <
            item
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDDDDDDDDDDDDDDDDDD00000000000DDDDD09999999990DDDDD0999999999
                0DDDDD09999F99990DDDDDD0999F9990DDDDDDDD00FFF00DDDDDDDDDDD000DDD
                DDDDDDDDD07770DDDDDDDDDDD07770DDDDDDDDDDD07770DDDDDDDDDDD00000DD
                DDDDDDDDDD000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
              Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1072#1082#1090#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080
              Style = ebsGlyphEh
              Visible = False
              Width = 20
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
        object edON_POL: TDBComboBoxEh
          Left = 51
          Top = 34
          Width = 121
          Height = 26
          DataField = 'ON_POL'
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
        object cbTwo: TDBCheckBoxEh
          Left = 4
          Top = 247
          Width = 155
          Height = 17
          Hint = #1045#1089#1083#1080' '#1103#1074#1083#1103#1077#1090#1089#1103' '#1074#1090#1086#1088#1099#1084' '#1086#1087#1077#1082#1091#1085#1086#1084' ('#1087#1086#1087#1077#1095#1080#1090#1077#1083#1077#1084')'
          Caption = #1089#1091#1087#1088#1091#1075' ('#1089#1091#1087#1088#1091#1075#1072')'
          DataField = 'TWO'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 20
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = cbTwoClick
        end
        object gbSuprug: TGroupBox
          Left = 0
          Top = 268
          Width = 965
          Height = 143
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 21
          object Label75: TLabel
            Left = 15
            Top = 23
            Width = 50
            Height = 13
            Caption = #1060#1072#1084#1080#1083#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object Label76: TLabel
            Left = 267
            Top = 23
            Width = 23
            Height = 13
            Caption = #1048#1084#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label77: TLabel
            Left = 503
            Top = 23
            Width = 56
            Height = 13
            Caption = #1054#1090#1095#1077#1089#1090#1074#1086
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label78: TLabel
            Left = 546
            Top = 53
            Width = 95
            Height = 13
            Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label84: TLabel
            Left = 15
            Top = 83
            Width = 81
            Height = 13
            Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label86: TLabel
            Left = 15
            Top = 114
            Width = 115
            Height = 13
            Caption = #1043#1076#1077' '#1080' '#1082#1077#1084' '#1088#1072#1073#1086#1090#1072#1077#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label87: TLabel
            Left = 225
            Top = 53
            Width = 80
            Height = 13
            Caption = #1048#1076#1077#1085#1090'. '#1085#1086#1084#1077#1088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label92: TLabel
            Left = 15
            Top = 53
            Width = 22
            Height = 13
            Caption = #1055#1086#1083
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edONA_Familia: TDBEditEh
            Left = 83
            Top = 16
            Width = 145
            Height = 26
            HelpType = htKeyword
            HelpContext = 888
            DataField = 'ONA_Familia'
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
          object edONA_Name: TDBEditEh
            Left = 307
            Top = 16
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
            TabOrder = 1
            Visible = True
          end
          object edONA_Otch: TDBEditEh
            Left = 574
            Top = 16
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
            TabOrder = 2
            Visible = True
          end
          object edONA_DateR: TDBDateTimeEditEh
            Left = 662
            Top = 46
            Width = 125
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
            TabOrder = 3
            Visible = True
          end
          object edONA_GRAG: TDBLookupComboboxEh
            Left = 121
            Top = 76
            Width = 284
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
            TabOrder = 4
            Visible = True
          end
          object edONA_WORK: TDBEditEh
            Left = 138
            Top = 107
            Width = 489
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
            TabOrder = 5
            Visible = True
          end
          object edONA_IDENTIF: TDBEditEh
            Left = 325
            Top = 46
            Width = 170
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
              '6241008G012PB8'
              ''
              '')
            ParentFont = False
            TabOrder = 6
            Visible = True
          end
          object edONA_POL: TDBComboBoxEh
            Left = 60
            Top = 46
            Width = 121
            Height = 26
            DataField = 'ONA_POL'
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
        end
        object N_F_cbMinTrud: TDBCheckBoxEh
          Left = 768
          Top = 9
          Width = 182
          Height = 17
          Caption = #1042#1099#1075#1088#1091#1078#1072#1090#1100' '#1076#1083#1103' '#1052#1080#1085#1090#1088#1091#1076#1072
          DataField = 'IS_MINTRUD'
          DataSource = dsDokument
          TabOrder = 22
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
      object tsFaser: TTabSheet
        Caption = #1056#1086#1076#1080#1090#1077#1083#1080
        ImageIndex = 2
        DesignSize = (
          966
          492)
        object Label28: TLabel
          Left = 8
          Top = 27
          Width = 53
          Height = 13
          Caption = #1060#1072#1084#1080#1083#1080#1103' '
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
          Top = 56
          Width = 23
          Height = 13
          Caption = #1048#1084#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 8
          Top = 85
          Width = 56
          Height = 13
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 8
          Top = 143
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
        object Label38: TLabel
          Left = 8
          Top = 172
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
        object Label39: TLabel
          Left = 8
          Top = 193
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
        object Label42: TLabel
          Left = 32
          Top = 213
          Width = 134
          Height = 13
          Caption = #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072' ('#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1086')'
        end
        object Label43: TLabel
          Left = 32
          Top = 240
          Width = 76
          Height = 13
          Caption = #1086#1073#1083#1072#1089#1090#1100' ('#1082#1088#1072#1081')'
        end
        object Label44: TLabel
          Left = 32
          Top = 267
          Width = 30
          Height = 13
          Caption = #1088#1072#1081#1086#1085
        end
        object Label45: TLabel
          Left = 32
          Top = 294
          Width = 82
          Height = 13
          Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077')'
        end
        object Label46: TLabel
          Left = 32
          Top = 321
          Width = 121
          Height = 13
          Caption = #1088'-'#1086#1085'  '#1075#1086#1088'., '#1091#1083'., '#1076#1086#1084', '#1082#1074'.'
        end
        object Label47: TLabel
          Left = 260
          Top = 1
          Width = 33
          Height = 16
          Caption = #1054#1090#1077#1094
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label48: TLabel
          Left = 558
          Top = 0
          Width = 33
          Height = 16
          Caption = #1052#1072#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label73: TLabel
          Left = 8
          Top = 114
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
        object Label51: TLabel
          Left = 289
          Top = 350
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
        object Label52: TLabel
          Left = 193
          Top = 350
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
        object Label54: TLabel
          Left = 393
          Top = 350
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
        object Label55: TLabel
          Left = 497
          Top = 350
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
        object Label56: TLabel
          Left = 594
          Top = 350
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
        object Label57: TLabel
          Left = 694
          Top = 350
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
        object Label58: TLabel
          Left = 8
          Top = 381
          Width = 115
          Height = 13
          Caption = #1043#1076#1077' '#1080' '#1082#1077#1084' '#1088#1072#1073#1086#1090#1072#1077#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label79: TLabel
          Left = 8
          Top = 409
          Width = 175
          Height = 13
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edOTEC_Familia: TDBEditEh
          Left = 196
          Top = 20
          Width = 170
          Height = 26
          HelpType = htKeyword
          HelpContext = 888
          DataField = 'OTEC_Familia'
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
        object edOTEC_Name: TDBEditEh
          Left = 196
          Top = 49
          Width = 170
          Height = 26
          DataField = 'OTEC_Name'
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
        object edOTEC_Otch: TDBEditEh
          Left = 196
          Top = 78
          Width = 170
          Height = 26
          DataField = 'OTEC_Otch'
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
        object edOTEC_DateR: TDBDateTimeEditEh
          Left = 196
          Top = 136
          Width = 120
          Height = 26
          DataField = 'OTEC_DateR'
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
          OnUpdateData = edDateRUpdateData
        end
        object edOTEC_GRAG: TDBLookupComboboxEh
          Left = 196
          Top = 165
          Width = 267
          Height = 26
          DataField = 'OTEC_GRAG'
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
          TabOrder = 5
          Visible = True
        end
        object edOTEC_GOSUD: TDBLookupComboboxEh
          Left = 196
          Top = 206
          Width = 200
          Height = 26
          DataField = 'OTEC_GOSUD'
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
        object edOTEC_GOROD: TDBEditEh
          Left = 250
          Top = 287
          Width = 147
          Height = 26
          DataField = 'OTEC_GOROD'
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
        object edOTEC_GOROD_R: TDBEditEh
          Left = 196
          Top = 314
          Width = 267
          Height = 26
          DataField = 'OTEC_GOROD_R'
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
        object edOTEC_B_OBL: TDBCheckBoxEh
          Left = 175
          Top = 238
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'OTEC_B_OBL'
          DataSource = dsDokument
          TabOrder = 16
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edOTEC_B_RESP: TDBCheckBoxEh
          Left = 175
          Top = 211
          Width = 15
          Height = 17
          DataField = 'OTEC_B_RESP'
          DataSource = dsDokument
          TabOrder = 17
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object edMAT_FAMILIA: TDBEditEh
          Left = 497
          Top = 20
          Width = 170
          Height = 26
          DataField = 'MAT_Familia'
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
        object edMAT_Name: TDBEditEh
          Left = 497
          Top = 49
          Width = 170
          Height = 26
          DataField = 'MAT_Name'
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
        object edMAT_Otch: TDBEditEh
          Left = 497
          Top = 78
          Width = 170
          Height = 26
          DataField = 'MAT_Otch'
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
        object edMAT_DateR: TDBDateTimeEditEh
          Left = 497
          Top = 136
          Width = 120
          Height = 26
          DataField = 'MAT_DateR'
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
          OnUpdateData = edDateRUpdateData
        end
        object edMAT_GRAG: TDBLookupComboboxEh
          Left = 497
          Top = 165
          Width = 267
          Height = 26
          DataField = 'MAT_GRAG'
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
          TabOrder = 23
          Visible = True
        end
        object edMAT_GOSUD: TDBLookupComboboxEh
          Left = 497
          Top = 206
          Width = 200
          Height = 26
          DataField = 'MAT_GOSUD'
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
          TabOrder = 24
          Visible = True
        end
        object edMAT_GOROD: TDBEditEh
          Left = 551
          Top = 287
          Width = 147
          Height = 26
          DataField = 'MAT_GOROD'
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
        object edMAT_GOROD_R: TDBEditEh
          Left = 497
          Top = 314
          Width = 267
          Height = 26
          DataField = 'MAT_GOROD_R'
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
        object edMAT_B_OBL: TDBCheckBoxEh
          Left = 476
          Top = 238
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'MAT_B_OBL'
          DataSource = dsDokument
          TabOrder = 34
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edMAT_B_RESP: TDBCheckBoxEh
          Left = 476
          Top = 211
          Width = 15
          Height = 17
          DataField = 'MAT_B_RESP'
          DataSource = dsDokument
          TabOrder = 35
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object ENG_edOTEC_IDENTIF: TDBEditEh
          Left = 196
          Top = 107
          Width = 170
          Height = 26
          CharCase = ecUpperCase
          DataField = 'OTEC_IDENTIF'
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
            '6241008G012PB8'
            ''
            '')
          ParentFont = False
          TabOrder = 3
          Visible = True
        end
        object ENG_edMAT_IDENTIF: TDBEditEh
          Left = 497
          Top = 107
          Width = 170
          Height = 26
          CharCase = ecUpperCase
          DataField = 'MAT_IDENTIF'
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
            '6241008G012PB8'
            ''
            '')
          ParentFont = False
          TabOrder = 21
          Visible = True
        end
        object edOTEC_B_GOROD: TDBLookupComboboxEh
          Left = 196
          Top = 287
          Width = 46
          Height = 26
          Alignment = taRightJustify
          DataField = 'OTEC_B_GOROD'
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
        object edMAT_B_GOROD: TDBLookupComboboxEh
          Left = 497
          Top = 287
          Width = 46
          Height = 26
          Alignment = taRightJustify
          DataField = 'MAT_B_GOROD'
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
          TabOrder = 27
          Visible = True
        end
        object edOTEC_OBL: TDBEditEh
          Left = 196
          Top = 233
          Width = 200
          Height = 26
          DataField = 'OTEC_OBL'
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
        object edOTEC_RAION: TDBEditEh
          Left = 196
          Top = 260
          Width = 200
          Height = 26
          DataField = 'OTEC_RAION'
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
        object edMAT_OBL: TDBEditEh
          Left = 497
          Top = 233
          Width = 200
          Height = 26
          DataField = 'MAT_OBL'
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
        object edMAT_RAION: TDBEditEh
          Left = 497
          Top = 260
          Width = 200
          Height = 26
          DataField = 'MAT_RAION'
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
        object edOTEC_KORP: TDBEditEh
          Left = 326
          Top = 343
          Width = 52
          Height = 26
          DataField = 'OTEC_KORP'
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
        object edOTEC_DOM: TDBEditEh
          Left = 226
          Top = 343
          Width = 44
          Height = 26
          DataField = 'OTEC_DOM'
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
        object edOTEC_KV: TDBEditEh
          Left = 417
          Top = 343
          Width = 46
          Height = 26
          DataField = 'OTEC_KV'
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
        object edMAT_DOM: TDBEditEh
          Left = 529
          Top = 343
          Width = 44
          Height = 26
          DataField = 'MAT_DOM'
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
        end
        object edMAT_KORP: TDBEditEh
          Left = 631
          Top = 343
          Width = 52
          Height = 26
          DataField = 'MAT_KORP'
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
        object edMAT_KV: TDBEditEh
          Left = 718
          Top = 343
          Width = 46
          Height = 26
          DataField = 'MAT_KV'
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
        object edOTEC_WORK: TDBEditEh
          Left = 196
          Top = 374
          Width = 289
          Height = 26
          DataField = 'OTEC_WORK'
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
        object edMAT_WORK: TDBEditEh
          Left = 497
          Top = 374
          Width = 269
          Height = 26
          DataField = 'MAT_WORK'
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
        object edKomm: TDBEditEh
          Left = 196
          Top = 406
          Width = 768
          Height = 84
          HelpContext = 999
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSelect = False
          AutoSize = False
          Ctl3D = True
          DataField = 'KOMM'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 36
          Visible = True
          WantReturns = True
          WordWrap = True
          OnDblClick = TBItemEditMemoClick
        end
      end
      object tsSud: TTabSheet
        Caption = #1056#1077#1096#1077#1085#1080#1103' '#1089#1091#1076#1072
        ImageIndex = 3
        DesignSize = (
          966
          492)
        object GridRS: TDBGridEh
          Left = 0
          Top = 31
          Width = 965
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
                'CHILD'
                'ON'
                'ONA'
                'OTEC'
                'MAT')
              PickList.Strings = (
                #1087#1086#1076#1086#1087#1077#1095#1085#1099#1081
                #1086#1087#1077#1082#1091#1085' ('#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100')'
                'c'#1091#1087#1088#1091#1075' ('#1089#1091#1087#1088#1091#1075#1072')'
                #1086#1090#1077#1094
                #1084#1072#1090#1100)
              Title.Caption = #1050#1090#1086
              Width = 134
            end
            item
              EditButtons = <>
              FieldName = 'FIO'
              Footers = <>
              Title.Caption = #1060#1048#1054
              Width = 198
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
              Width = 371
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
        object cbType: TComboBox
          Left = 23
          Top = 2
          Width = 169
          Height = 24
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 16
          ItemIndex = 0
          ParentFont = False
          TabOrder = 1
          Text = #1074#1089#1077
          OnChange = cbTypeChange
          Items.Strings = (
            #1074#1089#1077
            #1087#1086#1076#1086#1087#1077#1095#1085#1099#1081
            #1086#1087#1077#1082#1091#1085'('#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100')'
            #1089#1091#1087#1088#1091#1075'('#1089#1091#1087#1088#1091#1075#1072')'
            #1086#1090#1077#1094
            #1084#1072#1090#1100)
        end
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 746
    Width = 974
  end
  inherited pnAdd: TPanel
    Width = 974
  end
  inherited dsDokument: TDataSource
    Left = 248
    Top = 178
  end
  object dsNation: TDataSource [7]
    DataSet = dmBase.SprNac
    Left = 756
    Top = 137
  end
  object dsStran: TDataSource [8]
    DataSet = dmBase.SprStran
    Left = 780
    Top = 169
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
        Name = 'POL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DateR_DO'
        DataType = ftDate
      end
      item
        Name = 'GOSUD_DO'
        DataType = ftInteger
      end
      item
        Name = 'OBL_DO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RAION_DO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GOROD_DO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'REG_NOMER_DO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'REG_DATE_DO'
        DataType = ftDate
      end
      item
        Name = 'REG_MESTO_DO'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'OTEC_Familia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'OTEC_Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OTEC_Otch'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OTEC_DateR'
        DataType = ftDate
      end
      item
        Name = 'OTEC_NATION'
        DataType = ftInteger
      end
      item
        Name = 'OTEC_GRAG'
        DataType = ftInteger
      end
      item
        Name = 'OTEC_SOATO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'OTEC_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'OTEC_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OTEC_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OTEC_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OTEC_GOROD_R'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'OTEC_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'OTEC_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'MAT_Familia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'MAT_Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MAT_Otch'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MAT_DateR'
        DataType = ftDate
      end
      item
        Name = 'MAT_NATION'
        DataType = ftInteger
      end
      item
        Name = 'MAT_GRAG'
        DataType = ftInteger
      end
      item
        Name = 'MAT_SOATO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MAT_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'MAT_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MAT_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MAT_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MAT_GOROD_R'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'MAT_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'MAT_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'ON_ID'
        DataType = ftInteger
      end
      item
        Name = 'ON_Familia'
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
        Name = 'ON_NATION'
        DataType = ftInteger
      end
      item
        Name = 'ON_GRAG'
        DataType = ftInteger
      end
      item
        Name = 'ON_SOATO'
        DataType = ftString
        Size = 10
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
        Name = 'ON_GOROD_R'
        DataType = ftString
        Size = 70
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
        Name = 'ONA_ID'
        DataType = ftInteger
      end
      item
        Name = 'ONA_Familia'
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
        Name = 'ONA_NATION'
        DataType = ftInteger
      end
      item
        Name = 'ONA_GRAG'
        DataType = ftInteger
      end
      item
        Name = 'ONA_SOATO'
        DataType = ftString
        Size = 10
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
        Name = 'ONA_GOROD_R'
        DataType = ftString
        Size = 70
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
        Name = 'BRAK_M'
        DataType = ftBoolean
      end
      item
        Name = 'BRAK_NOMER'
        DataType = ftInteger
      end
      item
        Name = 'BRAK_DATE'
        DataType = ftDate
      end
      item
        Name = 'BRAK_NAME'
        DataType = ftMemo
        Size = 1
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
        Name = 'SUD_DATEV'
        DataType = ftDate
      end
      item
        Name = 'ISRODIT'
        DataType = ftBoolean
      end
      item
        Name = 'OTMETKA'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ISPRAV'
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
        Name = 'B_RESP_DO'
        DataType = ftBoolean
      end
      item
        Name = 'B_OBL_DO'
        DataType = ftBoolean
      end
      item
        Name = 'LICH_ID'
        DataType = ftInteger
      end
      item
        Name = 'CHILD_ID'
        DataType = ftInteger
      end
      item
        Name = 'PROV'
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
        Name = 'ID_SOURCE'
        DataType = ftInteger
      end
      item
        Name = 'DateR_POSLE'
        DataType = ftDate
      end
      item
        Name = 'GOSUD_POSLE'
        DataType = ftInteger
      end
      item
        Name = 'OBL_POSLE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RAION_POSLE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GOROD_POSLE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'REG_NOMER_POSLE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'REG_DATE_POSLE'
        DataType = ftDate
      end
      item
        Name = 'REG_MESTO_POSLE'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'B_RESP_POSLE'
        DataType = ftBoolean
      end
      item
        Name = 'B_OBL_POSLE'
        DataType = ftBoolean
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
        Name = 'OBL_DO_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RAION_DO_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GOROD_DO_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_Familia_B'
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
        Name = 'VOSSTAN'
        DataType = ftBoolean
      end
      item
        Name = 'DATESV'
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
        Name = 'COPIA'
        DataType = ftBoolean
      end
      item
        Name = 'NOMER_EKZ'
        DataType = ftInteger
      end
      item
        Name = 'IZV_NOMER'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'IZV_DATE'
        DataType = ftDate
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
        Name = 'ONA_WORK'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ONA_OBRAZ'
        DataType = ftInteger
      end
      item
        Name = 'R_SVID_SERIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'R_SVID_NOMER'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'AdresIzvech'
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
        Name = 'ON_FAMILIA_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ON_NAME_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ON_OTCH_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ON_FAMILIA_B_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ON_NAME_B_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ON_OTCH_B_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_FAMILIA_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_NAME_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_OTCH_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_FAMILIA_B_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_NAME_B_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_OTCH_B_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'OTEC_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'MAT_B_GOROD'
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
        Name = 'B_GOROD_DO'
        DataType = ftSmallint
      end
      item
        Name = 'B_GOROD_POSLE'
        DataType = ftSmallint
      end
      item
        Name = 'OTEC_STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OTEC_IDENTIF'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'OTEC_M_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'OTEC_M_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'OTEC_M_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'OTEC_M_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OTEC_M_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OTEC_M_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'OTEC_M_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TYPEMESSAGE'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'POLE_GRN'
        DataType = ftSmallint
      end
      item
        Name = 'MAT_M_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'MAT_M_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'MAT_M_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'MAT_M_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MAT_M_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MAT_M_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'MAT_M_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MAT_STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MAT_IDENTIF'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'ON_STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ON_IDENTIF'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'ON_M_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'ON_M_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'ON_M_B_OBL'
        DataType = ftBoolean
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
        Name = 'ON_M_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'ON_M_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ONA_IDENTIF'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'ONA_M_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'ONA_M_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'ONA_M_B_OBL'
        DataType = ftBoolean
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
        Name = 'ONA_M_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'ONA_M_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDENTIF_DO'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'IDENTIF_POSLE'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'GRAG_DO'
        DataType = ftInteger
      end
      item
        Name = 'GRAG_POSLE'
        DataType = ftInteger
      end
      item
        Name = 'SPEC_B'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'RN_B_GOROD_DO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RN_B_GOROD_POSLE'
        DataType = ftString
        Size = 10
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
        Name = 'RN_OTEC_M_B_GOROD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RN_OTEC_B_GOROD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RN_MAT_M_B_GOROD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RN_MAT_B_GOROD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'OBL_POSLE_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RAION_POSLE_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GOROD_POSLE_B'
        DataType = ftString
        Size = 30
      end>
    Left = 216
    Top = 178
    object DokumentNOMER: TIntegerField [0]
      FieldName = 'NOMER'
    end
    object DokumentDATEZ: TDateField [1]
      FieldName = 'DATEZ'
    end
    object DokumentDATE_PR: TDateField [2]
      FieldName = 'DATE_PR'
    end
    object DokumentNOMER_PR: TStringField [3]
      FieldName = 'NOMER_PR'
      Size = 10
    end
    object DokumentNOMER_UST: TStringField [4]
      FieldName = 'NOMER_UST'
      Size = 10
    end
    object DokumentDOC_OPEKA: TIntegerField [5]
      FieldName = 'DOC_OPEKA'
    end
    object DokumentPRICH_UST: TMemoField [6]
      FieldName = 'PRICH_UST'
      BlobType = ftMemo
    end
    object DokumentPRICH_CHILD: TSmallintField [7]
      FieldName = 'PRICH_CHILD'
    end
    object DokumentDATE_OTM: TDateField [8]
      FieldName = 'DATE_OTM'
    end
    object DokumentNOMER_OTM: TStringField [9]
      FieldName = 'NOMER_OTM'
      Size = 10
    end
    object DokumentPRICH_OTM: TMemoField [10]
      FieldName = 'PRICH_OTM'
      BlobType = ftMemo
    end
    object DokumentDATE_OTST: TDateField [11]
      FieldName = 'DATE_OTST'
    end
    object DokumentNOMER_OTST: TStringField [12]
      FieldName = 'NOMER_OTST'
      Size = 10
    end
    object DokumentPRICH_OTST: TMemoField [13]
      FieldName = 'PRICH_OTST'
      BlobType = ftMemo
    end
    object DokumentKEM: TMemoField [14]
      FieldName = 'KEM'
      BlobType = ftMemo
    end
    object DokumentTIP: TSmallintField [15]
      FieldName = 'TIP'
    end
    object DokumentVID: TSmallintField [16]
      FieldName = 'VID'
    end
    object DokumentFORMA: TSmallintField [17]
      FieldName = 'FORMA'
    end
    object DokumentSVID_SERIA: TStringField [18]
      FieldName = 'SVID_SERIA'
      Size = 10
    end
    object DokumentSVID_NOMER: TStringField [19]
      FieldName = 'SVID_NOMER'
    end
    object DokumentSTATUS: TStringField [20]
      FieldName = 'STATUS'
      Size = 1
    end
    object DokumentIDENTIF: TStringField [21]
      FieldName = 'IDENTIF'
      Size = 14
    end
    object DokumentFamilia: TStringField [22]
      FieldName = 'Familia'
      Size = 50
    end
    object DokumentGRAG: TIntegerField [23]
      FieldName = 'GRAG'
    end
    object DokumentName: TStringField [24]
      FieldName = 'Name'
      Size = 30
    end
    object DokumentOtch: TStringField [25]
      FieldName = 'Otch'
      Size = 30
    end
    object DokumentPOL: TStringField [26]
      FieldName = 'POL'
      Size = 1
    end
    object DokumentDateR: TDateField [27]
      FieldName = 'DateR'
    end
    object DokumentSTUDENT: TSmallintField [28]
      FieldName = 'STUDENT'
    end
    object DokumentSTUDENT_TYPE: TSmallintField [29]
      FieldName = 'STUDENT_TYPE'
    end
    object DokumentSTUDENT_SPR: TIntegerField [30]
      FieldName = 'STUDENT_SPR'
    end
    object DokumentKURS: TSmallintField [31]
      FieldName = 'KURS'
    end
    object DokumentRG_B_RESP: TBooleanField [32]
      FieldName = 'RG_B_RESP'
    end
    object DokumentRG_GOSUD: TIntegerField [33]
      FieldName = 'RG_GOSUD'
    end
    object DokumentRG_B_OBL: TBooleanField [34]
      FieldName = 'RG_B_OBL'
    end
    object DokumentRG_OBL: TStringField [35]
      FieldName = 'RG_OBL'
      Size = 30
    end
    object DokumentRG_RAION: TStringField [36]
      FieldName = 'RG_RAION'
      Size = 30
    end
    object DokumentRN_B_GOROD_DO: TStringField [37]
      FieldName = 'RN_B_GOROD'
      Size = 10
    end
    object DokumentRG_B_GOROD: TSmallintField [38]
      FieldName = 'RG_B_GOROD'
    end
    object DokumentRG_GOROD: TStringField [39]
      FieldName = 'RG_GOROD'
      Size = 30
    end
    object DokumentGT_B_OBL: TBooleanField [40]
      FieldName = 'GT_B_OBL'
    end
    object DokumentGT_OBL: TStringField [41]
      FieldName = 'GT_OBL'
      Size = 30
    end
    object DokumentGT_RAION: TStringField [42]
      FieldName = 'GT_RAION'
      Size = 30
    end
    object DokumentRN_GT_B_GOROD: TStringField [43]
      FieldName = 'RN_GT_B_GOROD'
      Size = 10
    end
    object DokumentGT_B_GOROD: TSmallintField [44]
      FieldName = 'GT_B_GOROD'
    end
    object DokumentGT_GOROD: TStringField [45]
      FieldName = 'GT_GOROD'
      Size = 30
    end
    object DokumentGT_RNGOROD: TStringField [46]
      FieldName = 'GT_RNGOROD'
    end
    object DokumentGT_GOROD_R: TStringField [47]
      FieldName = 'GT_GOROD_R'
      Size = 50
    end
    object DokumentGT_DOM: TStringField [48]
      FieldName = 'GT_DOM'
      Size = 10
    end
    object DokumentGT_KORP: TStringField [49]
      FieldName = 'GT_KORP'
      Size = 10
    end
    object DokumentGT_KV: TStringField [50]
      FieldName = 'GT_KV'
      Size = 10
    end
    object DokumentOTNOSH: TStringField [51]
      DisplayWidth = 30
      FieldName = 'OTNOSH'
      Size = 30
    end
    object DokumentSTUD_PLACE: TIntegerField [52]
      FieldName = 'STUD_PLACE'
    end
    object DokumentOTEC_STATUS: TStringField [53]
      FieldName = 'OTEC_STATUS'
      Size = 1
    end
    object DokumentOTEC_IDENTIF: TStringField [54]
      FieldName = 'OTEC_IDENTIF'
      Size = 14
    end
    object DokumentOTEC_Familia: TStringField [55]
      FieldName = 'OTEC_Familia'
      Size = 50
    end
    object DokumentOTEC_Name: TStringField [56]
      FieldName = 'OTEC_Name'
      Size = 30
    end
    object DokumentOTEC_Otch: TStringField [57]
      FieldName = 'OTEC_Otch'
      Size = 30
    end
    object DokumentOTEC_DateR: TDateField [58]
      FieldName = 'OTEC_DateR'
    end
    object DokumentOTEC_NATION: TIntegerField [59]
      FieldName = 'OTEC_NATION'
    end
    object DokumentOTEC_GRAG: TIntegerField [60]
      FieldName = 'OTEC_GRAG'
    end
    object DokumentOTEC_SOATO: TStringField [61]
      FieldName = 'OTEC_SOATO'
      Size = 10
    end
    object DokumentOTEC_B_RESP: TBooleanField [62]
      FieldName = 'OTEC_B_RESP'
    end
    object DokumentOTEC_GOSUD: TIntegerField [63]
      FieldName = 'OTEC_GOSUD'
    end
    object DokumentOTEC_B_OBL: TBooleanField [64]
      FieldName = 'OTEC_B_OBL'
    end
    object DokumentOTEC_OBL: TStringField [65]
      FieldName = 'OTEC_OBL'
      Size = 30
    end
    object DokumentOTEC_RAION: TStringField [66]
      FieldName = 'OTEC_RAION'
      Size = 30
    end
    object DokumentRN_OTEC_B_GOROD: TStringField [67]
      FieldName = 'RN_OTEC_B_GOROD'
      Size = 10
    end
    object DokumentOTEC_B_GOROD: TSmallintField [68]
      FieldName = 'OTEC_B_GOROD'
    end
    object DokumentOTEC_GOROD: TStringField [69]
      FieldName = 'OTEC_GOROD'
      Size = 30
    end
    object DokumentOTEC_GOROD_R: TStringField [70]
      FieldName = 'OTEC_GOROD_R'
      Size = 70
    end
    object DokumentOTEC_DOM: TStringField [71]
      FieldName = 'OTEC_DOM'
      Size = 10
    end
    object DokumentOTEC_KORP: TStringField [72]
      FieldName = 'OTEC_KORP'
      Size = 7
    end
    object DokumentOTEC_KV: TStringField [73]
      FieldName = 'OTEC_KV'
      Size = 10
    end
    object DokumentOTEC_WORK: TStringField [74]
      FieldName = 'OTEC_WORK'
      Size = 200
    end
    object DokumentMAT_STATUS: TStringField [75]
      FieldName = 'MAT_STATUS'
      Size = 1
    end
    object DokumentMAT_IDENTIF: TStringField [76]
      FieldName = 'MAT_IDENTIF'
      Size = 14
    end
    object DokumentMAT_Familia: TStringField [77]
      FieldName = 'MAT_Familia'
      Size = 50
    end
    object DokumentMAT_Name: TStringField [78]
      FieldName = 'MAT_Name'
      Size = 30
    end
    object DokumentMAT_Otch: TStringField [79]
      FieldName = 'MAT_Otch'
      Size = 30
    end
    object DokumentMAT_DateR: TDateField [80]
      FieldName = 'MAT_DateR'
    end
    object DokumentMAT_GRAG: TIntegerField [81]
      FieldName = 'MAT_GRAG'
    end
    object DokumentMAT_B_RESP: TBooleanField [82]
      FieldName = 'MAT_B_RESP'
    end
    object DokumentMAT_GOSUD: TIntegerField [83]
      FieldName = 'MAT_GOSUD'
    end
    object DokumentMAT_B_OBL: TBooleanField [84]
      FieldName = 'MAT_B_OBL'
    end
    object DokumentMAT_OBL: TStringField [85]
      FieldName = 'MAT_OBL'
      Size = 30
    end
    object DokumentMAT_RAION: TStringField [86]
      FieldName = 'MAT_RAION'
      Size = 30
    end
    object DokumentRN_MAT_B_GOROD: TStringField [87]
      FieldName = 'RN_MAT_B_GOROD'
      Size = 10
    end
    object DokumentMAT_B_GOROD: TSmallintField [88]
      FieldName = 'MAT_B_GOROD'
    end
    object DokumentMAT_GOROD: TStringField [89]
      FieldName = 'MAT_GOROD'
      Size = 30
    end
    object DokumentMAT_GOROD_R: TStringField [90]
      FieldName = 'MAT_GOROD_R'
      Size = 70
    end
    object DokumentMAT_DOM: TStringField [91]
      FieldName = 'MAT_DOM'
      Size = 10
    end
    object DokumentMAT_KORP: TStringField [92]
      FieldName = 'MAT_KORP'
      Size = 7
    end
    object DokumentMAT_KV: TStringField [93]
      FieldName = 'MAT_KV'
      Size = 10
    end
    object DokumentMAT_WORK: TStringField [94]
      FieldName = 'MAT_WORK'
      Size = 200
    end
    object DokumentON_STATUS: TStringField [95]
      FieldName = 'ON_STATUS'
      Size = 1
    end
    object DokumentON_IDENTIF: TStringField [96]
      FieldName = 'ON_IDENTIF'
      Size = 14
    end
    object DokumentON_Familia: TStringField [97]
      FieldName = 'ON_Familia'
      Size = 50
    end
    object DokumentON_POL: TStringField [98]
      FieldName = 'ON_POL'
      Size = 1
    end
    object DokumentON_Name: TStringField [99]
      FieldName = 'ON_Name'
      Size = 30
    end
    object DokumentON_Otch: TStringField [100]
      FieldName = 'ON_Otch'
      Size = 30
    end
    object DokumentON_DateR: TDateField [101]
      FieldName = 'ON_DateR'
    end
    object DokumentON_GRAG: TIntegerField [102]
      FieldName = 'ON_GRAG'
    end
    object DokumentON_B_RESP: TBooleanField [103]
      FieldName = 'ON_B_RESP'
    end
    object DokumentON_GOSUD: TIntegerField [104]
      FieldName = 'ON_GOSUD'
    end
    object DokumentON_B_OBL: TBooleanField [105]
      FieldName = 'ON_B_OBL'
    end
    object DokumentON_OBL: TStringField [106]
      FieldName = 'ON_OBL'
      Size = 30
    end
    object DokumentON_RAION: TStringField [107]
      FieldName = 'ON_RAION'
      Size = 30
    end
    object DokumentON_B_GOROD: TSmallintField [108]
      FieldName = 'ON_B_GOROD'
    end
    object DokumentRN_ON_B_GOROD: TStringField [109]
      FieldName = 'RN_ON_B_GOROD'
      Size = 10
    end
    object DokumentON_GOROD: TStringField [110]
      FieldName = 'ON_GOROD'
      Size = 30
    end
    object DokumentON_GOROD_R: TStringField [111]
      FieldName = 'ON_GOROD_R'
      Size = 70
    end
    object DokumentON_DOM: TStringField [112]
      FieldName = 'ON_DOM'
      Size = 10
    end
    object DokumentON_KORP: TStringField [113]
      FieldName = 'ON_KORP'
      Size = 7
    end
    object DokumentON_KV: TStringField [114]
      FieldName = 'ON_KV'
      Size = 10
    end
    object DokumentON_WORK: TStringField [115]
      FieldName = 'ON_WORK'
      Size = 100
    end
    object DokumentOTMETKA: TMemoField [136]
      FieldName = 'OTMETKA'
      BlobType = ftMemo
    end
    object DokumentRUKOV: TStringField [137]
      FieldName = 'RUKOV'
      Size = 60
    end
    object DokumentSPEC: TStringField [138]
      FieldName = 'SPEC'
      Size = 60
    end
    object DokumentID_ZAGS: TIntegerField [139]
      FieldName = 'ID_ZAGS'
    end
    object DokumentID_SOURCE: TIntegerField [140]
      FieldName = 'ID_SOURCE'
    end
    object DokumentFirst_Ekz: TBooleanField [141]
      FieldName = 'First_Ekz'
    end
    object DokumentTYPEMESSAGE: TStringField [142]
      FieldName = 'TYPEMESSAGE'
      Size = 4
    end
    object DokumentPOLE_GRN: TSmallintField [143]
      FieldName = 'POLE_GRN'
    end
    object DokumentPLACE_WORK: TStringField [144]
      FieldName = 'PLACE_WORK'
      Size = 200
    end
    object DokumentREG_UST: TBooleanField [145]
      FieldName = 'REG_UST'
    end
    object DokumentREG_OTM: TBooleanField [146]
      FieldName = 'REG_OTM'
    end
    object DokumentREG_OTST: TBooleanField [147]
      FieldName = 'REG_OTST'
    end
    object DokumentINTERNAT: TIntegerField [148]
      FieldName = 'INTERNAT'
    end
    object DokumentINTERNAT_DATE: TDateField [149]
      FieldName = 'INTERNAT_DATE'
    end
    object DokumentLONELY: TBooleanField [150]
      FieldName = 'LONELY'
    end
    object DokumentONA_STATUS: TStringField [151]
      FieldName = 'ONA_STATUS'
      Size = 1
    end
    object DokumentONA_IDENTIF: TStringField [152]
      FieldName = 'ONA_IDENTIF'
      Size = 14
    end
    object DokumentONA_Familia: TStringField [153]
      FieldName = 'ONA_Familia'
      Size = 50
    end
    object DokumentONA_POL: TStringField [154]
      FieldName = 'ONA_POL'
      Size = 1
    end
    object DokumentONA_Name: TStringField [155]
      FieldName = 'ONA_Name'
      Size = 30
    end
    object DokumentONA_Otch: TStringField [156]
      FieldName = 'ONA_Otch'
      Size = 30
    end
    object DokumentONA_DateR: TDateField [157]
      FieldName = 'ONA_DateR'
    end
    object DokumentONA_GRAG: TIntegerField [158]
      FieldName = 'ONA_GRAG'
    end
    object DokumentONA_B_RESP: TBooleanField [159]
      FieldName = 'ONA_B_RESP'
    end
    object DokumentONA_GOSUD: TIntegerField [160]
      FieldName = 'ONA_GOSUD'
    end
    object DokumentONA_B_OBL: TBooleanField [161]
      FieldName = 'ONA_B_OBL'
    end
    object DokumentONA_OBL: TStringField [162]
      FieldName = 'ONA_OBL'
      Size = 30
    end
    object DokumentONA_RAION: TStringField [163]
      FieldName = 'ONA_RAION'
      Size = 30
    end
    object DokumentONA_B_GOROD: TSmallintField [164]
      FieldName = 'ONA_B_GOROD'
    end
    object DokumentRN_ONA_B_GOROD: TStringField [165]
      FieldName = 'RN_ONA_B_GOROD'
      Size = 10
    end
    object DokumentONA_GOROD: TStringField [166]
      FieldName = 'ONA_GOROD'
      Size = 30
    end
    object DokumentONA_GOROD_R: TStringField [167]
      FieldName = 'ONA_GOROD_R'
      Size = 70
    end
    object DokumentONA_DOM: TStringField [168]
      FieldName = 'ONA_DOM'
      Size = 10
    end
    object DokumentONA_KORP: TStringField [169]
      FieldName = 'ONA_KORP'
      Size = 7
    end
    object DokumentONA_KV: TStringField [170]
      FieldName = 'ONA_KV'
      Size = 10
    end
    object DokumentONA_WORK: TStringField [171]
      FieldName = 'ONA_WORK'
      Size = 100
    end
    object DokumentTWO: TBooleanField [172]
      FieldName = 'TWO'
    end
    object DokumentDATE_OSV: TDateField [173]
      FieldName = 'DATE_OSV'
    end
    object DokumentNOMER_OSV: TStringField [174]
      FieldName = 'NOMER_OSV'
      Size = 10
    end
    object DokumentREG_OSV: TBooleanField [175]
      FieldName = 'REG_OSV'
    end
    object DokumentADD_DOK: TMemoField [176]
      FieldName = 'ADD_DOK'
      BlobType = ftMemo
    end
    object DokumentKOMM: TMemoField [177]
      FieldName = 'KOMM'
      BlobType = ftMemo
    end
    object DokumentIS_MINTRUD: TBooleanField
      FieldName = 'IS_MINTRUD'
    end
    object DokumentIS_CONTROL: TBooleanField
      FieldName = 'IS_CONTROL'
    end
    object DokumentUST_OTHER: TBooleanField
      FieldName = 'UST_OTHER'
    end
    object DokumentUST_ORG: TStringField
      FieldName = 'UST_ORG'
      Size = 200
    end
    object DokumentUST_ORG_SPR: TStringField
      FieldName = 'UST_ORG_SPR'
      Size = 12
    end
    object DokumentUST_ORG_TYPE: TIntegerField
      FieldName = 'UST_ORG_TYPE'
    end
    object DokumentDOC_OPEKA_OTM: TIntegerField
      FieldName = 'DOC_OPEKA_OTM'
    end
    object DokumentOTM_ORG: TStringField
      FieldName = 'OTM_ORG'
      Size = 200
    end
    object DokumentOTM_ORG_SPR: TIntegerField
      FieldName = 'OTM_ORG_SPR'
    end
    object DokumentOTM_ORG_TYPE: TIntegerField
      FieldName = 'OTM_ORG_TYPE'
    end
    object DokumentOTM_OTHER: TBooleanField
      FieldName = 'OTM_OTHER'
    end
    object DokumentDATEDOK_UST: TDateField
      FieldName = 'DATEDOK_UST'
    end
    object DokumentDATEDOK_SN: TDateField
      FieldName = 'DATEDOK_SN'
    end
    object DokumentTYPE_SN: TSmallintField
      FieldName = 'TYPE_SN'
    end
    object DokumentVERNO: TBooleanField
      FieldName = 'VERNO'
    end
    object DokumentSEND_ORG: TStringField
      FieldName = 'SEND_ORG'
      Size = 200
    end
    object DokumentSEND_ORG_SPR: TIntegerField
      FieldName = 'SEND_ORG_SPR'
    end
    object DokumentSEND_ORG_TYPE: TIntegerField
      FieldName = 'SEND_ORG_TYPE'
    end
    object DokumentSEND_DATE: TDateField
      FieldName = 'SEND_DATE'
    end
    object DokumentSEND_PRICH: TStringField
      FieldName = 'SEND_PRICH'
      Size = 200
    end
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 864
    Top = 290
  end
  inherited HistZAGS: TkbmMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'FieldName'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Value'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'StringValue'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'DateIzm'
        DataType = ftDateTime
      end
      item
        Name = 'TypeDate'
        DataType = ftSmallint
      end
      item
        Name = 'DatePropis'
        DataType = ftSmallint
      end
      item
        Name = 'Info'
        DataType = ftString
        Size = 200
      end>
    IndexFieldNames = 'fieldname;dateizm'
    Left = 864
    Top = 178
  end
  inherited dsSeria: TDataSource
    Left = 536
    Top = 178
  end
  inherited dsObl: TDataSource
    Left = 704
    Top = 322
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 744
    Top = 282
  end
  inherited dsPovtor: TDataSource
    Left = 488
    Top = 218
  end
  inherited dsGorod: TDataSource
    Left = 864
    Top = 306
  end
  inherited dsRnGor: TDataSource
    Left = 768
    Top = 250
  end
  inherited dsTypeGorod: TDataSource
    Left = 816
    Top = 202
  end
  inherited ImGISUN: TImageList
    Left = 828
    Top = 155
  end
  inherited dsVoenkom: TDataSource
    Left = 816
    Top = 170
  end
  inherited dsRovd: TDataSource
    Left = 720
    Top = 162
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 472
    Top = 170
  end
  object dsGragd: TDataSource [24]
    Left = 700
    Top = 235
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 576
    Top = 178
  end
  inherited Zip: TZipForge
    Left = 808
    Top = 130
  end
  object dsStudentSpr: TDataSource [27]
    Left = 672
    Top = 626
  end
  object dsInternat: TDataSource [28]
    Left = 384
    Top = 522
  end
  inherited tbReshSud: TkbmMemTable
    Left = 48
    Top = 402
  end
  object dsReshSud: TDataSource
    DataSet = tbReshSud
    Left = 12
    Top = 394
  end
  object dsSprChildPrich: TDataSource
    Left = 580
    Top = 350
  end
end
