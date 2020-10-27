inherited fmZapisOpekaSh: TfmZapisOpekaSh
  Left = 449
  Top = 217
  ActiveControl = edDateUst
  Caption = #1064#1072#1073#1083#1086#1085' '#1086#1073' '#1086#1087#1077#1082#1077' /'#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100#1089#1090#1074#1077'/'
  ClientHeight = 482
  ClientWidth = 974
  Constraints.MinHeight = 520
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
    Top = 460
    Width = 974
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited pnTable: TPanel
    Top = 460
    Width = 974
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 974
    inherited TBToolbar: TTBToolbar
      DockPos = 96
      inherited TBItemPreView: TTBItem
        Visible = False
      end
      inherited TBItemPrint: TTBItem
        Visible = False
      end
      inherited TBSubmenuTmp: TTBSubmenuItem
        Visible = False
      end
      object TBSubmenuGISUN: TTBSubmenuItem [5]
        Caption = #1042#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1077' '#1089' '#1043#1048#1057' '#1056#1053
        ImageIndex = 5
        Images = ImGISUN
        Visible = False
        object TBItemStep1: TTBItem
          Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
          Visible = False
          OnClick = TBItemStep1Click
        end
        object TBSeparatorItem1: TTBSeparatorItem
          Visible = False
        end
        object TBItemStep2: TTBItem
          Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100
          Visible = False
          OnClick = TBItemStep2Click
        end
      end
      inherited TBItemGetDataGISUN: TTBItem
        DisplayMode = nbdmImageAndText
        Visible = True
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
        Visible = False
        OnClick = TBItemCreatePopech18Click
      end
      inherited TBSubmenuRun: TTBSubmenuItem
        Visible = False
      end
      object TBItemChOpeka: TTBItem [22]
        Caption = #1042#1099#1073#1086#1088' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086#1073' '#1086#1087#1077#1082#1077
        Hint = #1042#1099#1073#1086#1088' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086#1073' '#1086#1087#1077#1082#1077' '#1080' '#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100#1089#1090#1074#1077
        ImageIndex = 90
        Visible = False
      end
      inherited TBItemZAGS: TTBItem
        Visible = False
      end
      inherited TBItemAdresat: TTBItem
        Visible = False
      end
      inherited TBItemSprAkt: TTBItem
        Visible = False
      end
      inherited TBItemDeclSvid: TTBItem
        Visible = False
      end
      inherited TBItemWrite: TTBItem
        Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
        DisplayMode = nbdmImageAndText
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1096#1072#1073#1083#1086#1085
      end
      inherited TBItemCancel: TTBItem
        DisplayMode = nbdmImageAndText
      end
      inherited TBItemSetUp: TTBItem
        Visible = False
      end
      inherited TBItemDesignReport: TTBItem
        Visible = False
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 278
      end
    end
  end
  inherited sb: TScrollBox
    Width = 974
    Height = 410
    VertScrollBar.Visible = False
    Align = alClient
    inherited pnPovtor: TPanel
      TabOrder = 2
      inherited imBE: TImage
        Anchors = [akTop]
      end
    end
    object pn: TPanel
      Left = 0
      Top = 0
      Width = 974
      Height = 410
      Align = alClient
      TabOrder = 0
      DesignSize = (
        974
        410)
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
        Top = 108
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
      object Label71: TLabel
        Left = 354
        Top = 37
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
        Left = 18
        Top = 37
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
      object Bevel2: TBevel
        Left = 3
        Top = 69
        Width = 965
        Height = 7
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object Label8: TLabel
        Left = 445
        Top = 108
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
        Left = 447
        Top = 37
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
      object Label9: TLabel
        Left = 18
        Top = 167
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
        Left = 278
        Top = 167
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
        Left = 486
        Top = 167
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
        Left = 548
        Top = 197
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
        Left = 18
        Top = 258
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
        Left = 38
        Top = 276
        Width = 134
        Height = 13
        Caption = #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072' ('#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1086')'
      end
      object Label17: TLabel
        Left = 422
        Top = 271
        Width = 76
        Height = 13
        Caption = #1086#1073#1083#1072#1089#1090#1100' ('#1082#1088#1072#1081')'
      end
      object Label18: TLabel
        Left = 142
        Top = 306
        Width = 30
        Height = 13
        Caption = #1088#1072#1081#1086#1085
      end
      object Label19: TLabel
        Left = 438
        Top = 301
        Width = 82
        Height = 13
        Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077')'
      end
      object Label21: TLabel
        Left = 18
        Top = 227
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
        Left = 100
        Top = 336
        Width = 72
        Height = 13
        Caption = #1088'-'#1086#1085'  '#1075#1086#1088'., '#1091#1083'.'
      end
      object Label67: TLabel
        Left = 18
        Top = 371
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
        Left = 225
        Top = 197
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
        Left = 454
        Top = 334
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
        Left = 556
        Top = 334
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
        Left = 669
        Top = 334
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
        Left = 520
        Top = 227
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
        Left = 18
        Top = 197
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
      object Label1: TLabel
        Left = 10
        Top = 138
        Width = 165
        Height = 13
        Caption = #1053#1086#1074#1099#1081' '#1086#1087#1077#1082#1091#1085' ('#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object N_F__LabelClose: TLabel
        Left = 29
        Top = 10
        Width = 217
        Height = 13
        Caption = #1055#1088#1077#1082#1088#1072#1090#1080#1090#1100' '#1086#1087#1077#1082#1091' ('#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100#1089#1090#1074#1086')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edDateUst: TDBDateTimeEditEh
        Left = 133
        Top = 101
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
        TabOrder = 6
        Visible = True
        OnCheckDrawRequiredState = N_F_edDocOpekaCheckDrawRequiredState
      end
      object edNomerUst: TDBEditEh
        Left = 374
        Top = 101
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
        TabOrder = 8
        Visible = True
      end
      object edDateOtm: TDBDateTimeEditEh
        Left = 135
        Top = 30
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
        TabOrder = 1
        Visible = True
        OnCheckDrawRequiredState = N_F_edTypeSnCheckDrawRequiredState
      end
      object edNomerOtm: TDBEditEh
        Left = 376
        Top = 30
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
        TabOrder = 3
        Visible = True
      end
      object N_F_edDocOpeka: TDBComboBoxEh
        Left = 257
        Top = 103
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
        TabOrder = 7
        Visible = True
        OnCheckDrawRequiredState = N_F_edDocOpekaCheckDrawRequiredState
      end
      object edUstOrg: TDBEditEh
        Left = 590
        Top = 101
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
        TabOrder = 10
        Visible = True
      end
      object edOtmOrg: TDBEditEh
        Left = 592
        Top = 30
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
        TabOrder = 5
        Visible = True
      end
      object N_F_edDocOpekaO: TDBComboBoxEh
        Left = 259
        Top = 33
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
        TabOrder = 2
        Visible = True
        OnCheckDrawRequiredState = N_F_edTypeSnCheckDrawRequiredState
      end
      object N_F_edTypeSn: TDBComboBoxEh
        Left = 8
        Top = 33
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
        TabOrder = 0
        Visible = True
        OnChange = N_F_edTypeSnChange
        OnCheckDrawRequiredState = N_F_edTypeSnCheckDrawRequiredState
      end
      object edDateDokUst: TDBDateTimeEditEh
        Left = 465
        Top = 101
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
        TabOrder = 9
        Visible = True
      end
      object edDateDokSn: TDBDateTimeEditEh
        Left = 467
        Top = 30
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
        TabOrder = 4
        Visible = True
      end
      object edON_Familia: TDBEditEh
        Left = 94
        Top = 160
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
        TabOrder = 11
        Visible = True
        OnCheckDrawRequiredState = N_F_edDocOpekaCheckDrawRequiredState
      end
      object edON_Name: TDBEditEh
        Left = 318
        Top = 160
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
        TabOrder = 12
        Visible = True
        OnCheckDrawRequiredState = N_F_edDocOpekaCheckDrawRequiredState
      end
      object edON_OTCH: TDBEditEh
        Left = 557
        Top = 160
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
        TabOrder = 13
        Visible = True
        OnCheckDrawRequiredState = N_F_edDocOpekaCheckDrawRequiredState
      end
      object edON_DATER: TDBDateTimeEditEh
        Left = 661
        Top = 190
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
        TabOrder = 16
        Visible = True
      end
      object edON_GOSUD: TDBLookupComboboxEh
        Left = 189
        Top = 269
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
        TabOrder = 19
        Visible = True
      end
      object edON_GOROD: TDBEditEh
        Left = 592
        Top = 294
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
        TabOrder = 23
        Visible = True
      end
      object edON_GRAG: TDBLookupComboboxEh
        Left = 116
        Top = 220
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
        TabOrder = 17
        Visible = True
      end
      object edON_B_OBL: TDBCheckBoxEh
        Left = 503
        Top = 269
        Width = 15
        Height = 17
        AllowGrayed = True
        DataField = 'ON_B_OBL'
        DataSource = dsDokument
        TabOrder = 29
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object edON_GOROD_R: TDBEditEh
        Left = 189
        Top = 329
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
        TabOrder = 24
        Visible = True
      end
      object edON_WORK: TDBEditEh
        Left = 149
        Top = 364
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
        TabOrder = 28
        Visible = True
      end
      object edON_B_GOROD: TDBLookupComboboxEh
        Left = 537
        Top = 294
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
        TabOrder = 22
        Visible = True
      end
      object ENG_edON_IDENTIF: TDBEditEh
        Left = 325
        Top = 190
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
        TabOrder = 15
        Visible = True
        OnCheckDrawRequiredState = N_F_edDocOpekaCheckDrawRequiredState
      end
      object edON_OBL: TDBEditEh
        Left = 537
        Top = 264
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
        TabOrder = 20
        Visible = True
      end
      object edON_RAION: TDBEditEh
        Left = 189
        Top = 299
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
        TabOrder = 21
        Visible = True
      end
      object edON_DOM: TDBEditEh
        Left = 492
        Top = 327
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
        TabOrder = 25
        Visible = True
      end
      object edON_KORP: TDBEditEh
        Left = 599
        Top = 327
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
        TabOrder = 26
        Visible = True
      end
      object edON_KV: TDBEditEh
        Left = 701
        Top = 327
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
        TabOrder = 27
        Visible = True
      end
      object edOtnosh: TDBEditEh
        Left = 603
        Top = 220
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
        TabOrder = 18
        Visible = True
      end
      object edON_POL: TDBComboBoxEh
        Left = 62
        Top = 190
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
        TabOrder = 14
        Visible = True
      end
      object N_F_cbDel: TDBCheckBoxEh
        Left = 463
        Top = 8
        Width = 337
        Height = 17
        Caption = #1055#1088#1077#1082#1088#1072#1090#1080#1090#1100' '#1086#1087#1077#1082#1091' ('#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100#1089#1090#1074#1086')'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 30
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        Visible = False
        OnClick = N_F_cbDelClick
      end
      object N_F_cbAdd: TDBCheckBoxEh
        Left = 9
        Top = 76
        Width = 337
        Height = 17
        Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1086#1087#1077#1082#1091' ('#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100#1089#1090#1074#1086')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 31
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = N_F_cbAddClick
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 460
    Width = 974
  end
  inherited pnAdd: TPanel
    Width = 974
  end
  inherited dsDokument: TDataSource
    Left = 776
    Top = 314
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
    Left = 32
    Top = 274
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
    Top = 330
  end
  inherited dsRnGor: TDataSource
    Left = 768
    Top = 250
  end
  inherited dsTypeGorod: TDataSource
    Left = 816
    Top = 210
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
    Left = 464
    Top = 194
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
    Left = 64
    Top = 370
  end
  object dsReshSud: TDataSource
    DataSet = tbReshSud
    Left = 20
    Top = 362
  end
  object dsSprChildPrich: TDataSource
    Left = 580
    Top = 350
  end
end
