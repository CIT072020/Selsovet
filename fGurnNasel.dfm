inherited fmGurnNasel: TfmGurnNasel
  Left = 339
  Top = 128
  Width = 1068
  Height = 457
  Caption = #1053#1072#1089#1077#1083#1077#1085#1080#1077
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888
    8888888888888888888888888888880880008880888888800880880888888888
    0800008888888888088880888888888008888000888888000088880808888800
    0888008808888800008880888088880000000080088888800000008808888888
    0000000080888888888000000088888888880000088888888888888888880000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = True
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBDock: TTBDock
    Width = 1052
    inherited TBToolbarMenu: TTBToolbar
      Caption = '1'
      Stretch = True
      inherited TBSeparatorItem2: TTBSeparatorItem [8]
      end
      object TBItemLgot: TTBItem [9]
        Caption = #1051#1100#1075#1086#1090#1085#1080#1082#1080
        Hint = #1053#1072#1081#1090#1080' '#1083#1100#1075#1086#1090#1085#1080#1082#1086#1074
        ImageIndex = 79
        OnClick = TBItemLgotClick
      end
      object TBItemPrizn: TTBItem [10]
        Caption = #1055#1088#1080#1079#1085#1072#1082#1080
        Hint = #1053#1072#1081#1090#1080' '#1087#1086' '#1087#1088#1080#1079#1085#1072#1082#1072#1084
        ImageIndex = 98
        OnClick = TBItemPriznClick
      end
      object TBSeparatorItem5: TTBSeparatorItem [11]
      end
      object TBItemEditLic: TTBItem [12]
        Caption = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
        Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
        ImageIndex = 60
        ShortCut = 8205
        OnClick = TBItemEditLicClick
      end
      object TBItemDopGraf: TTBItem [13]
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1075#1088#1072#1092#1099
        Hint = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1075#1088#1072#1092#1099
        ImageIndex = 2
        OnClick = TBItemDopGrafClick
      end
      object TBItemAddMen: TTBItem [14]
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        HelpContext = 1
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072' '#1073#1077#1079' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
        ImageIndex = 113
        OnClick = TBItemAddMenClick
      end
      object TBItemCopyMen: TTBItem [15]
        Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
        HelpContext = 1
        Hint = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072' '#1085#1072' '#1076#1088#1091#1075#1086#1081' '#1083#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
        ImageIndex = 128
        OnClick = TBItemCopyMenClick
      end
      inherited TBItemPrintGrid: TTBItem [16]
      end
      inherited TBItemGrantSprav: TTBItem [17]
      end
      inherited TBItemExport: TTBItem [18]
      end
      inherited TBItemDelayRegister: TTBItem [19]
      end
      inherited TBSeparatorItem3: TTBSeparatorItem [20]
      end
      inherited TBSubmenuPunkts: TTBSubmenuItem [21]
        Visible = True
      end
      inherited TBSubSysFlt: TTBSubmenuItem [22]
        AutoCheck = True
        Options = [tboToolbarStyle]
        Visible = False
      end
      inherited TBItemSysFlt: TTBItem [23]
        Visible = True
      end
      inherited TBSubChoiceFlt: TTBSubmenuItem [24]
      end
      inherited TBItemFlt: TTBItem [25]
      end
      inherited TBItemRepeatFilter: TTBItem [26]
      end
      inherited TBItemClrFlt: TTBItem [27]
      end
      inherited TBItemOrder: TTBItem [29]
      end
      inherited TBItemPokaz: TTBItem [30]
      end
      inherited TBSeparatorItem4: TTBSeparatorItem [31]
      end
      inherited TBItemYear: TTBItem [32]
        Visible = False
      end
      inherited TBSubmenuGroup: TTBSubmenuItem [33]
      end
      inherited TBItemQuery: TTBItem [34]
      end
      inherited TBItemGrupOne: TTBItem [35]
      end
      inherited TBItemCount: TTBItem [36]
      end
      inherited TBItemSum: TTBItem [37]
      end
      object TBItemEmptyAdres: TTBItem [38]
        Caption = #1055#1091#1089#1090#1099#1077' '#1072#1076#1088#1077#1089#1072
        ImageIndex = 67
        OnClick = TBItemEmptyAdresClick
      end
      inherited TBItemAddOtbor: TTBItem [39]
        Enabled = False
      end
      inherited TBItemIsklOtbor: TTBItem [40]
        Enabled = False
      end
      inherited TBItemWriteSavedFilter: TTBItem [41]
        Enabled = False
      end
      inherited TBSeparatorIskl2: TTBSeparatorItem [42]
      end
    end
    object TBToolWindow1: TTBToolWindow
      Left = 792
      Top = 0
      Caption = 'TBToolWindow'
      ClientAreaHeight = 22
      ClientAreaWidth = 256
      DockPos = 807
      TabOrder = 1
      object edSeek: TDBEditEh
        Left = 138
        Top = 1
        Width = 111
        Height = 21
        EditButtons = <
          item
            Glyph.Data = {
              76010000424D760100000000000036000000280000000A0000000A0000000100
              18000000000040010000000000000000000000000000000000007F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00007F7F7F7F7F7F
              7F7F7F0000008484847F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00007F7F7F7F7F7F
              7F7F7F0000000000008484847F7F7F7F7F7F7F7F7F7F7F7F00007F7F7F7F7F7F
              7F7F7F0000000000000000008484847F7F7F7F7F7F7F7F7F00007F7F7F7F7F7F
              7F7F7F0000000000000000000000008484847F7F7F7F7F7F00007F7F7F7F7F7F
              7F7F7F0000000000000000000000000000008484847F7F7F00007F7F7F7F7F7F
              7F7F7F0000000000000000000000008484847F7F7F7F7F7F00007F7F7F7F7F7F
              7F7F7F0000000000000000008484847F7F7F7F7F7F7F7F7F00007F7F7F7F7F7F
              7F7F7F0000000000008484847F7F7F7F7F7F7F7F7F7F7F7F00007F7F7F7F7F7F
              7F7F7F0000008484847F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000}
            Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
            Style = ebsGlyphEh
            OnClick = edSeekEditButtons0Click
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
            Visible = False
            OnClick = edSeekEditButtons1Click
          end>
        TabOrder = 0
        Visible = True
        OnChange = edSeekChange
        OnKeyDown = edSeekKeyDown
      end
      object edFind: TComboBox
        Left = 2
        Top = 0
        Width = 129
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        OnChange = edFindChange
        Items.Strings = (
          #1060#1072#1084#1080#1083#1080#1103
          #1051#1080#1094'. '#1089#1095#1077#1090
          #1044#1077#1090#1080
          #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
          #1055#1088#1086#1080#1079#1074#1086#1083#1100#1085#1099#1081
          #1076#1083#1103' '#1052#1080#1085#1090#1088#1091#1076#1072)
      end
    end
  end
  inherited Grid: TSasaDBGrid
    Width = 1052
    Height = 343
    OnGetCellParams = GridGetCellParams
    OnKeyDown = GridKeyDown
    Color1 = 3251505
  end
  inherited StBar: TStatusBar
    Top = 395
    Width = 1052
  end
  inherited TBDock24: TTBDock
    Width = 1052
  end
  inherited Query: TAdsQuery
    ParamData = <>
  end
  inherited TmpQuery: TAdsQuery
    ParamData = <>
  end
end
