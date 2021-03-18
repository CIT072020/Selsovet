inherited fmGurnAlfKn: TfmGurnAlfKn
  Left = 457
  Top = 124
  Width = 934
  Height = 471
  ActiveControl = Grid
  Caption = #1040#1083#1092#1072#1074#1080#1090#1085#1072#1103' '#1082#1085#1080#1075#1072
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF007000
    00000CCC40007FFFFFFF0CC400007FCFCCCF044400007FFFFFFF0F8000007FCF
    CCCF000000007FFFFFFF0FFF80007FCFCCCF0FFFF8007FFFFFFF0FFFFF007FCF
    CCFF0FFFFF807FFFFF770FFFFF007FFFFF7F0FFFFC0077777700000FFF000000
    000000000F800000000000000000000000000000000000000000000000000007
    0000000F0000000F0000000F0000000700000003000000010000000100000000
    0000000100000001000000010000F0000000F8000000FC010000FE070000}
  OldCreateOrder = True
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBDock: TTBDock
    Width = 918
    inherited TBToolbarMenu: TTBToolbar
      Stretch = True
      inherited TBSubmenuPunkts: TTBSubmenuItem
        Visible = True
      end
      object TBItemCountMens: TTBItem [14]
        Caption = #1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1075#1088#1072#1092#1099
        Hint = #1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1075#1088#1072#1092#1099' '#1089#1086' '#1089#1087#1080#1089#1082#1072#1084#1080
        ImageIndex = 2
        OnClick = TBItemCountMensClick
      end
      inherited TBSubSysFlt: TTBSubmenuItem
        Visible = False
      end
      inherited TBItemSysFlt: TTBItem
        Visible = True
      end
      object TBItemEmptyAdres: TTBItem [26]
        Caption = #1055#1091#1089#1090#1099#1077' '#1072#1076#1088#1077#1089#1072
        Hint = #1051#1080#1094#1077#1074#1099#1077' '#1089#1095#1077#1090#1072' '#1089' '#1087#1091#1089#1090#1099#1084#1080' '#1072#1076#1088#1077#1089#1072#1084#1080
        ImageIndex = 67
        OnClick = TBItemEmptyAdresClick
      end
      inherited TBItemPokaz: TTBItem
        Visible = True
      end
    end
    object TBToolWindow1: TTBToolWindow
      Left = 676
      Top = 0
      Caption = 'TBToolWindow'
      ClientAreaHeight = 22
      ClientAreaWidth = 238
      DockPos = 264
      TabOrder = 1
      object lbSost: TLabel
        Left = 279
        Top = 4
        Width = 64
        Height = 16
        Caption = '                '
        Color = 16776176
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Visible = False
      end
      object edSeek: TDBEditEh
        Left = 117
        Top = 0
        Width = 115
        Height = 21
        TabStop = False
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
            Hint = #1054#1090#1084#1077#1085#1080#1090#1100
            Style = ebsGlyphEh
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
        Width = 107
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = edFindChange
        Items.Strings = (
          #1060#1072#1084#1080#1083#1080#1103
          #1051#1080#1094'. '#1089#1095#1077#1090
          #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086)
      end
    end
  end
  inherited Grid: TSasaDBGrid
    Width = 918
    Height = 357
    OnGetCellParams = GridGetCellParams
    OnKeyDown = GridKeyDown
    NewRowColor = clGreen
    Color2 = clMaroon
  end
  inherited StBar: TStatusBar
    Top = 409
    Width = 918
  end
  inherited TBDock24: TTBDock
    Width = 918
  end
  inherited Query: TAdsQuery
    ParamData = <>
  end
  inherited TmpQuery: TAdsQuery
    ParamData = <>
  end
  object tbProp: TkbmMemTable
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
    Left = 440
    Top = 104
  end
end
