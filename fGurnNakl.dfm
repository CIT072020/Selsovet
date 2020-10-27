inherited fmGurnNakl: TfmGurnNakl
  Left = 435
  Top = 233
  Width = 778
  Caption = #1055#1088#1080#1093#1086#1076#1085#1086'-'#1088#1072#1089#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008887
    7778888800008877777788888888087000000088000088777777888888880870
    0000008800008887777888888888088000000088000088888888888888888000
    0000000000088888888888888888080808080808080808080808080808080008
    0008008808080808080808088008080880080808880888888888888888880000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
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
      inherited TBSubChoiceFlt: TTBSubmenuItem
        Visible = False
      end
      inherited TBItemFlt: TTBItem
        Visible = False
      end
      inherited TBItemRepeatFilter: TTBItem
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
      Visible = False
      object Label3: TLabel
        Left = 560
        Top = 5
        Width = 44
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103
      end
      object Label4: TLabel
        Left = 12
        Top = 5
        Width = 18
        Height = 13
        Caption = #1058#1080#1087
      end
      object edFamilia: TDBEditEh
        Left = 618
        Top = 1
        Width = 95
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
        Font.Style = [fsBold]
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
            OnClick = edTipEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
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
  end
  inherited StBar: TStatusBar
    Width = 762
  end
  inherited Query: TAdsQuery
    Left = 64
    Top = 136
    ParamData = <>
  end
  inherited TmpQuery: TAdsQuery
    ParamData = <>
  end
end
