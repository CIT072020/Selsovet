object fmOcheredResh: TfmOcheredResh
  Left = 318
  Top = 177
  Width = 736
  Height = 380
  Caption = 'fmOcheredResh'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 707
    Height = 161
    TabOrder = 0
    DesignSize = (
      707
      161)
    object Label79: TLabel
      Left = 16
      Top = 45
      Width = 116
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1080' '#1076#1072#1090#1072' '#1088#1077#1096#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label81: TLabel
      Left = 234
      Top = 45
      Width = 11
      Height = 13
      Caption = #1086#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label78: TLabel
      Left = 12
      Top = 85
      Width = 56
      Height = 13
      Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label93: TLabel
      Left = 9
      Top = 116
      Width = 80
      Height = 13
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edRegResh: TDBEditEh
      Left = 143
      Top = 39
      Width = 70
      Height = 24
      DataField = 'REG_RESH'
      EditButtons = <
        item
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888880000088888888880BF0FB0888888880BFBFBFB088888880FBFB
            FBF0880000000FB0000084444440FBF0FBF084F8F8F0BFB0BFB0848F1F110BF0
            FB0884F81818F000008884811F818408888884F81811F4088888848F8F8F8408
            8888844444444408888884C4CCC4C40888888444444444888888}
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1077#1077' '#1088#1077#1096#1077#1085#1080#1077
          Style = ebsGlyphEh
          Visible = False
          Width = 18
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
    end
    object edRegDate: TDBDateTimeEditEh
      Left = 254
      Top = 39
      Width = 105
      Height = 24
      DataField = 'REG_DATE'
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 1
      Visible = True
    end
    object edPostOsn: TDBEditEh
      Left = 102
      Top = 79
      Width = 489
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataField = 'REG_OSNOV_TEXT'
      EditButtons = <
        item
          Style = ebsEllipsisEh
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
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = True
    end
    object edPostOsn2: TDBEditEh
      Left = 102
      Top = 110
      Width = 489
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataField = 'REG_OSNOV_TEXT2'
      EditButtons = <
        item
          Style = ebsEllipsisEh
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
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = True
    end
  end
end
