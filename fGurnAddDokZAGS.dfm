inherited fmGurnAddDokZAGS: TfmGurnAddDokZAGS
  Left = 523
  Top = 257
  Width = 778
  Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
  Icon.Data = {
    0000010001001010000001001800680300001600000028000000100000002000
    0000010018000000000000030000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000084848484848400000084848484848484848484
    8484848484848484008484000000000000000000000000000000000000000000
    008484FFFFFF008484FFFFFF008484FFFFFF008484FFFFFF8484840000000000
    00000000000000008484FFFFFF000000FFFFFF840000840000840000FFFFFF00
    0084FFFFFF000084848484000000000000000000FFFFFF008484008484000000
    00FFFFFF0000FF000084000000FFFFFFFFFF00FFFFFFFFFF8484840000000000
    00FFFFFF008484FFFFFF008484000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00
    FFFFFFFFFFFFFFFF848484000000000000FFFFFFFFFFFF008484008484000000
    00FFFF84000084000084000000FFFF00008400FFFF0000848484840000000000
    00FFFFFF008484008484008484000000FFFFFFFF0000FF0000840000FFFFFF00
    FFFFFFFFFF00FFFF848484000000000000FFFFFFFFFFFF008484008484000000
    00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF8484840000000000
    00FFFFFF008484008484008484000000FFFFFF840000840000840000FFFFFF00
    0084FFFFFF000084848484000000000000FFFFFFFFFFFF008484008484000000
    00FFFFFF0000FF000084000000FFFFFFFFFF00FFFFFFFFFF8484840000000000
    00FFFFFF00848400848400848400000000000000000000000000000000000000
    0000000000000000000000000000000000FFFFFF008484848484000000848484
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000084848400000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    0000F0000000E8000000E0000000C00000000000000000000000000000000000
    00000000000000000000000000000000000003FF00000FFF0000FFFF0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBDock: TTBDock
    Width = 762
    Height = 59
    inherited TBToolbarMenu: TTBToolbar
      Stretch = True
      inherited TBSubSysFlt: TTBSubmenuItem
        Visible = False
      end
    end
    object TBToolWindow1: TTBToolWindow
      Left = 0
      Top = 26
      Caption = 'TBToolWindow1'
      ClientAreaHeight = 29
      ClientAreaWidth = 758
      DockPos = 24
      DockRow = 1
      FullSize = True
      Stretch = True
      TabOrder = 1
      object Label3: TLabel
        Left = 560
        Top = 7
        Width = 44
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103
      end
      object Label4: TLabel
        Left = 12
        Top = 7
        Width = 18
        Height = 13
        Caption = #1058#1080#1087
      end
      object edFamilia: TDBEditEh
        Left = 618
        Top = 1
        Width = 116
        Height = 24
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
            Style = ebsGlyphEh
            OnClick = edFamiliaEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
        OnChange = edFamiliaChange
      end
      object edTip: TDBComboBoxEh
        Left = 39
        Top = 1
        Width = 490
        Height = 24
        DropDownBox.Rows = 20
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
            Style = ebsGlyphEh
            Visible = False
            OnClick = edTipEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = True
        OnChange = edTipChange
      end
    end
  end
  inherited Grid: TSasaDBGrid
    Top = 59
    Width = 762
    Height = 289
    OnGetCellParams = GridGetCellParams
  end
  inherited StBar: TStatusBar
    Width = 762
  end
  inherited Query: TAdsQuery
    ParamData = <>
  end
  inherited TmpQuery: TAdsQuery
    ParamData = <>
  end
end
