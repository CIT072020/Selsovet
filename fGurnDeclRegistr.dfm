inherited fmGurnDeclRegistr: TfmGurnDeclRegistr
  Left = 412
  Top = 195
  Width = 655
  ActiveControl = Grid
  Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1103' '#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1087#1086' '#1084#1077#1089#1090#1091' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072'('#1087#1088#1077#1073#1099#1074#1072#1085#1080#1103')'
  Icon.Data = {
    0000010001001010000001001800680300001600000028000000100000002000
    0000010018000000000000030000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000300000319151A020001070406
    0201030204040106050001000605010701001200002709082300002700000000
    00050004FFFDFFFBF5FAFFFEFFE3E8E9707C7C0007040003000009050914117C
    7B7792807F9A7B7C2700005220220000001F0E17FFF5FDFFFBFF7F82866E7B7D
    000C0C000502E0FFFDE3FFFEE2F7F4F6FDFAFFFEFEDABBBE2900004B13180000
    00130006FFF4FFFFF8FFF6FAFFEDFFFF000403B0DBD800060300140EE4FFFFF3
    FFFFF6EEEFFFFBFF270000521C23000000130006FFF9FFFFFBFFF4FAFFE4F9FB
    000404D6FFFFC3F6F2000603DFFFFFEDFFFF08070B1200012300042B00050000
    0015010DFFFAFFBAB2BCC1C4CCB1C2C5B2D0D1000504D6FFFFC0ECEB00040400
    0303EBF1F6180E140000000000000000000B000AFFF9FFFEF9FFFBFDFFEAF4FB
    EDFFFFE6FFFF000404000707C4E6E600111300080C0000000000000000000000
    00000106F5F5FBC9C7CDBCBAC0BDBDC3BBBFC4B6C1C5BCCDD09BB2B4E5FEFFDF
    F5FA000106000000000000000000000000000C0EF8FFFFF2F3F7FFFCFFFFFCFF
    FFFAFFECEAF0F6FAFFF4FFFFE6F6FC0001060000000001060000000000000000
    00011312E0EAEAC6C8C9CBC1C7C3B5BBC9B9C0DBCFD5BFB9BEBFC2C6F4FFFF00
    0104000000445D61000000000000000000000300F8FFFFF6F6F6FFFDFFFFFCFF
    FFFBFFFFF8FEFFFDFFF7F8FCECF5F900090C0000000000000000000000000000
    00000200FDFFFEC8C4C3BCB2B2D0C3C5FFF5F7FFFDFFF9F6F8FAFFFFF1FAFD00
    01030000000000000000000000000000000B0A06F8F3F0FFFDFAFFFFFCFDF5F5
    FFFFFEFBFBFBFAFFFFE1EBEBF3FFFF000D0F0000000000000000000000000000
    001004000C00000B00000B050007040003080600020000030000030000090800
    0808000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    0000800000008000000080000000800000008000000080030000800700008007
    0000800B0000800B0000800F0000800F0000800F0000800F0000FFFF0000}
  OldCreateOrder = True
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBDock: TTBDock
    Width = 647
    Height = 27
    inherited TBToolbarMenu: TTBToolbar
      Stretch = True
    end
    object TBToolWindow1: TTBToolWindow
      Left = 464
      Top = 0
      Caption = 'TBToolWindow'
      ClientAreaHeight = 23
      ClientAreaWidth = 173
      DockPos = 464
      TabOrder = 1
      object lbSost: TLabel
        Left = 344
        Top = 4
        Width = 48
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
      object Label1: TLabel
        Left = 12
        Top = 5
        Width = 49
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103
      end
      object edSeek: TDBEditEh
        Left = 72
        Top = 1
        Width = 99
        Height = 21
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
            Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
            Style = ebsGlyphEh
            OnClick = edSeekEditButtons0Click
          end>
        TabOrder = 0
        Visible = True
        OnChange = edSeekChange
      end
    end
  end
  inherited Grid: TSasaDBGrid
    Top = 27
    Width = 647
    Height = 314
  end
  inherited Query: TAdsQuery
    ParamData = <>
  end
  inherited TmpQuery: TAdsQuery
    ParamData = <>
  end
end
