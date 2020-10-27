inherited fmGurnalAdres: TfmGurnalAdres
  Left = 26
  Top = 124
  Width = 966
  Height = 472
  Caption = #1040#1076#1088#1077#1089#1085#1072#1103' '#1082#1085#1080#1075#1072
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000700000BBBBB0BB037000000000B0BB037000000
    EE0B0BB037000000EE0B0BB037000000000B0000370000033333333337700011
    99999999197000011900019197000000119E0919700000000119919770000000
    001119077000000000019707700000000000700000000000000000000000FFFF
    0000C0030000C0030000C0030000C0030000C0030000C0030000800100008001
    0000C0030000E0070000F0070000F8070000FC070000FE470000FFFF0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBDock: TTBDock
    Width = 950
    Height = 65
    inherited TBToolbarMenu: TTBToolbar
      Stretch = True
      object TBItemAdd: TTBItem [2]
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        HelpContext = 1
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1076#1088#1077#1089
        ImageIndex = 103
        OnClick = TBItemAddClick
      end
      object TBItemEditAdres: TTBItem [3]
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        HelpContext = 1
        Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1072#1076#1088#1077#1089
        ImageIndex = 70
        OnClick = TBItemEditAdresClick
      end
      object TBItemMen: TTBItem [4]
        Caption = #1063#1077#1083#1086#1074#1077#1082
        Hint = #1063#1077#1083#1086#1074#1077#1082
        ImageIndex = 44
        OnClick = TBItemMenClick
      end
      object TBItemLich: TTBItem [5]
        Caption = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
        Hint = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
        ImageIndex = 60
        OnClick = TBItemLichClick
      end
      inherited TBSubmenuPunkts: TTBSubmenuItem
        Visible = True
      end
      object TBItemCountMens: TTBItem [18]
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1088#1086#1078#1080#1074#1072#1102#1097#1080#1093
        ImageIndex = 2
        OnClick = TBItemCountMensClick
      end
      object TBItemCountHouse: TTBItem [24]
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1086#1084#1086#1074
        Hint = #1055#1086#1076#1089#1095#1080#1090#1072#1090#1100' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1086#1084#1086#1074
        ImageIndex = 1
        OnClick = TBItemCountHouseClick
      end
      inherited TBItemPokaz: TTBItem
        Visible = True
      end
    end
    object TBToolWindow2: TTBToolWindow
      Left = 0
      Top = 26
      Caption = 'TBToolWindow2'
      ClientAreaHeight = 35
      ClientAreaWidth = 946
      DockPos = 1
      DockRow = 1
      Stretch = True
      TabOrder = 1
      object lbPunkt: TLabel
        Left = 8
        Top = 8
        Width = 61
        Height = 16
        Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbUl: TLabel
        Left = 280
        Top = 8
        Width = 35
        Height = 16
        Caption = #1059#1083#1080#1094#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edPunkt: TDBLookupComboboxEh
        Left = 81
        Top = 4
        Width = 177
        Height = 24
        AlwaysShowBorder = True
        DropDownBox.Rows = 30
        EditButtons = <
          item
            Glyph.Data = {
              C6000000424DC60000000000000076000000280000000A0000000A0000000100
              0400000000005000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888800
              0000008888880800000080088880080000008000880088000000880000088800
              0000888000888800000088000008880000008000880088000000800888800800
              00008088888888000000}
            Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1086#1090#1073#1086#1088' '#1087#1086' '#1085#1072#1089#1077#1083#1077#1085#1085#1086#1084#1091' '#1087#1091#1085#1082#1090#1091
            Style = ebsGlyphEh
            OnClick = edPunktEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dsPunkt
        ParentFont = False
        TabOrder = 0
        Visible = True
        OnChange = edPunktChange
      end
      object edUL: TDBLookupComboboxEh
        Left = 328
        Top = 4
        Width = 191
        Height = 24
        DropDownBox.Rows = 30
        EditButtons = <
          item
            Glyph.Data = {
              C6000000424DC60000000000000076000000280000000A0000000A0000000100
              0400000000005000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888800
              0000008888880800000080088880080000008000880088000000880000088800
              0000888000888800000088000008880000008000880088000000800888800800
              00008088888888000000}
            Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1086#1090#1073#1086#1088' '#1087#1086'  '#1091#1083#1080#1094#1077
            Style = ebsGlyphEh
            OnClick = edULEditButtons1Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'UL'
        ListField = 'NAME_UL'
        ListSource = dsUlAll
        ParentFont = False
        TabOrder = 1
        Visible = True
        OnChange = edULChange
      end
      object edSobstv: TDBEditEh
        Left = 676
        Top = 4
        Width = 150
        Height = 24
        EditButtons = <
          item
            Hint = #1042#1074#1077#1089#1090#1080' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
            Style = ebsEllipsisEh
            OnClick = edSobstvEditButtons0Click
          end
          item
            Style = ebsGlyphEh
            OnClick = edSobstvEditButtons1Click
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
            Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1080#1089#1082#1072
            Style = ebsGlyphEh
            OnClick = edSobstvEditButtons2Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Visible = True
        OnKeyDown = edSobstvKeyDown
      end
      object cbFind: TComboBox
        Left = 544
        Top = 4
        Width = 122
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
        TabOrder = 2
        Text = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
        OnChange = cbFindChange
        Items.Strings = (
          #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
          #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086)
      end
    end
  end
  inherited Grid: TSasaDBGrid
    Top = 65
    Width = 950
    Height = 345
    OnGetCellParams = GridGetCellParams
  end
  inherited StBar: TStatusBar
    Top = 410
    Width = 950
  end
  inherited Query: TAdsQuery
    ParamData = <>
  end
  inherited TmpQuery: TAdsQuery
    ParamData = <>
  end
  object HImageList: TImageList
    Left = 152
    Top = 96
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FFEFF2F8FFCFDAEAFFBFCEE3FF6085BBFF2059A4FFCFDAEAFFBFCEE3FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FFBFCEE3FF3060A7FF0057A5FF0072B5FF006CB2FF0057A5FF003C93FFCFDA
      EAFF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF000000
      000000848400848484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF0000FFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FFEFF2F8FF3060A7FF0098D6FF0091CBFF0072B5FF8FA9CFFF0000
      00FF000000FF000000FF000000FF000000FF00000000000000000000000000FF
      000000FF000000FF00000000000000800000008000000000000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000FFFF0000FFFF000000
      000000848400848484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF0000FFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000FF000000FF000000FFEFF5
      EFFFCFE2CFFF70AA70FF207342FF007FC7FF0091CBFF0067AFFF7FA89DFFDFEC
      DFFF000000FF000000FF000000FF000000FF00000000000000000000000000FF
      000000FF000000FF00000000000000800000008000000000000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF00000000000000FFFF000000000000FFFF0000FFFF000000
      000000848400848484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF0000FFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000FF000000FFCFE2CFFF1078
      10FF007300FF008400FF008626FF007CC4FF0091CBFF006CB2FF00771AFF0074
      00FFAFCFAFFF000000FF000000FF000000FF00000000000000000000000000FF
      000000FF000000FF00000000000000800000008000000000000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF00000000000000FFFF000000000000FFFF0000FFFF000000
      000000848400848484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF0000FFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000FFDFECDFFF408D40FF0098
      07FF00A711FF00A60EFF005D68FF0087C7FF0077B9FF0082C1FF006E4BFF0098
      00FF007200FF108210FF7FB37FFF000000FF00000000000000000000000000FF
      000000FF000000FF00000000000000800000008000000000000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      000000848400848484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000AFCFAFFF0A981CFF02A31AFF03AF
      1FFF02AE1DFF005F6EFF00548BFF006A74FF007355FF0067AFFF00557DFF00A5
      0DFF00A30BFF0AB522FF1FB73CFF7FB37FFF00000000000000000000000000FF
      000000FF000000FF00000000000000000000000000000000000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      840000848400848484008484840000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000509750FF58FF91FF0AB52DFF08B4
      2BFF07B329FF06B227FF05B125FF04B022FF03AF20FF00913CFF00517DFF0096
      2FFF00AA16FF03AF1CFF58FF91FF408D40FF00000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000084000000
      84000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000084000000FF008484840000000000000000000000000000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF00000000000000000060A060FF3EE26CFF19C545FF0EBA
      38FF0DB935FF0CB833FF0BB730FF0AB52DFF08B42BFF07B329FF06B227FF05B1
      25FF04B022FF0EBA2FFF26C046FF60A060FF0000000000000000008000000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000000000000080000000000000000000000000000000000000000000000000
      8400000084000000FF00000000000000000000000000000084000000FF000000
      84000000FF0084848400000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF00000000000000000000000000038F10FF2BCD54FF16C245FF15C1
      43FF14C041FF13BE3EFF11BD3CFF10BC3AFF0EBA38FF0DB935FF0CB833FF0BB7
      31FF0AB52FFF08B42CFF58FF91FF038F10FF0000000000000000000000000080
      00000000000000FF000000FF000000FF000000FF000000FF000000FF00000000
      0000008000000000000000000000000000000000000000000000000000000000
      000000008400000084000000FF00FFFF0000000000000000FF00000084000000
      FF00848484000000000000000000000000000000000000000000000000000000
      000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000000000000000000000000000000000108E17FF50FC8AFF1FCB55FF1AC6
      4FFF19C54DFF18C44BFF17C348FF16C246FF15C144FF14C041FF13BE3EFF11BD
      3CFF10BC3AFF1DC948FF58FF91FF0A981CFF0000000000000000000000000000
      0000008000000000000000FF000000FF000000FF000000FF0000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000008400000084000000FF000000FF00000084000000FF008484
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000FFFF000000
      0000000000000000000000000000000000008FBC8FFF10A226FF4DF986FF26D1
      5FFF1ECA57FF1ECA56FF1DC954FF1CC751FF1AC64FFF19C54DFF18C44BFF17C3
      48FF16C246FF58FF91FF038F10FF9FC69FFF0000000000000000000000000000
      000000000000008000000000000000FF000000FF000000000000008000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000840000008400000084000000FF00000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000FFFF00000000000000
      840000000000000000000000000000000000000000FF7FB37FFF038F10FF34DE
      6AFF1FCB58FF1FCB58FF1FCB58FF1FCB58FF1FCB58FF1FCB57FF1ECA56FF1DC9
      55FF2BD761FF4AF17CFF70AA70FF000000FF0000000000000000000000000000
      0000000000000000000000800000000000000000000000800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000084000000FF0084848400000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      840000000000000000000000000000000000000000FF000000FF40A142FF4DF9
      86FF2DD967FF2DD967FF22CE5CFF1FCB58FF1FCB58FF1FCB58FF2AD663FF43EF
      7CFF55FF8EFF10A226FF9FC69FFF000000FF0000000000000000000000000000
      0000000000000000000000000000008000000080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      840000000000000000000000000000000000000000FF000000FF9FC69FFF1397
      22FF1FB73CFF10A226FF26C046FF26C54DFF3CE875FF3FEB79FF3FE36EFF207A
      20FF409740FF70AA70FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FFDFECDFFF8FBC8FFF509750FF038F10FF10A226FF308E30FFDFEC
      DFFF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFF01FFFFFC003C003F00FC003
      C003C003F81FC003C003C003E00FC003C003C003C007C003C003C0038001C003
      C003C0030000C0038001C0030000C0038001800100008001C003C0030000C003
      E007E0070000E007F007F0070000F007F807F8078001F807FC07FC27C001FC27
      FE47FE67C003FE67FFFFFFFFF80FFFFF00000000000000000000000000000000
      000000000000}
  end
  object dsPunkt: TDataSource
    DataSet = dmBase.LookUpPunkt
    Left = 416
    Top = 72
  end
  object dsUL: TDataSource
    DataSet = QueryUL
    Left = 296
    Top = 96
  end
  object QueryUL: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    StoreActive = False
    AdsConnection = dmBase.AdsConnection
    Left = 296
    Top = 184
    ParamData = <>
  end
  object QueryULAll: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    StoreActive = False
    AdsConnection = dmBase.AdsConnection
    Left = 400
    Top = 176
    ParamData = <>
  end
  object dsUlAll: TDataSource
    DataSet = QueryULAll
    Left = 464
    Top = 128
  end
  object FtbLich: TAdsTable
    DatabaseName = 'dmBase.AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = dmBase.AdsConnection
    TableName = #1051#1080#1094#1077#1074#1099#1077#1057#1095#1077#1090#1072
    Left = 136
    Top = 192
  end
  object FtbMens: TAdsTable
    DatabaseName = 'dmBase.AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = dmBase.AdsConnection
    TableName = #1053#1072#1089#1077#1083#1077#1085#1080#1077
    Left = 168
    Top = 192
  end
  object QueryN: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    AdsConnection = dmBase.AdsConnection
    Left = 224
    Top = 232
    ParamData = <>
  end
end