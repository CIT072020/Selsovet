inherited fmDeclRegRogd: TfmDeclRegRogd
  Left = 536
  Top = 234
  Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077' '#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1088#1086#1078#1076#1077#1085#1080#1103
  ClientHeight = 362
  ClientWidth = 728
  Constraints.MinHeight = 400
  Constraints.MinWidth = 700
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
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 340
    Width = 728
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited pnTable: TPanel
    Top = 340
    Width = 728
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 728
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
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      inherited TBItemShablon: TTBItem
        Visible = True
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 724
        Top = 22
      end
    end
  end
  inherited sb: TScrollBox
    Width = 728
    Height = 290
    Align = alClient
    inherited pnPovtor: TPanel
      Left = 538
      Top = 495
      Width = 295
      Height = 34
      TabOrder = 2
      Visible = False
      inherited DbGridEh1: TDBGridEh
        Left = 3
        Top = 3
        Height = 21
      end
    end
    inherited N_F_edTypeEkz: TComboBox
      TabOrder = 4
    end
    object pn: TPanel
      Left = 0
      Top = 0
      Width = 728
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        728
        33)
      object Label7: TLabel
        Left = 8
        Top = 9
        Width = 50
        Height = 13
        Caption = '1. '#1053#1086#1084#1077#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 187
        Top = 9
        Width = 154
        Height = 13
        Caption = '2. '#1044#1072#1090#1072' '#1087#1086#1076#1072#1095#1080' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ImageGISUN: TImage
        Left = 699
        Top = 5
        Width = 20
        Height = 20
        Anchors = [akTop, akRight]
        Transparent = True
        Visible = False
      end
      object edNomer: TDBEditEh
        Left = 73
        Top = 6
        Width = 93
        Height = 24
        HelpContext = 888
        DataField = 'NOMER'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
      object edDateZ: TDBDateTimeEditEh
        Left = 357
        Top = 6
        Width = 119
        Height = 24
        DataField = 'DATEZ'
        DataSource = dsDokument
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
    end
    object pnMain: TPanel
      Left = 0
      Top = 33
      Width = 728
      Height = 257
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        728
        257)
      object Label1: TLabel
        Left = 10
        Top = 11
        Width = 190
        Height = 13
        Caption = '3. '#1060#1072#1084#1080#1083#1080#1103', '#1080#1085#1080#1094#1080#1072#1083#1099' '#1079#1072#1103#1074#1080#1090#1077#1083#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 10
        Top = 38
        Width = 73
        Height = 13
        Caption = '4. '#1044#1086#1082#1091#1084#1077#1085#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 10
        Top = 65
        Width = 163
        Height = 13
        Caption = '5. '#1040#1076#1088#1077#1089' '#1084#1077#1089#1090#1072' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 10
        Top = 93
        Width = 168
        Height = 13
        Caption = '6. '#1047#1072#1087#1088#1072#1096#1080#1074#1072#1077#1084#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 10
        Top = 120
        Width = 167
        Height = 13
        Caption = '7. '#1043#1086#1089#1091#1076#1072#1088#1089#1090#1074#1077#1085#1085#1099#1077' '#1086#1088#1075#1072#1085#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 10
        Top = 202
        Width = 157
        Height = 13
        Caption = '10. '#1054#1090#1084#1077#1090#1082#1072' '#1086#1073' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 10
        Top = 175
        Width = 214
        Height = 13
        Caption = '9. '#1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1086#1090#1074#1077#1090#1072' '#1085#1072' '#1079#1072#1087#1088#1086#1089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 10
        Top = 147
        Width = 173
        Height = 13
        Caption = '8. '#1044#1072#1090#1072' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1088#1086#1089#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 10
        Top = 230
        Width = 90
        Height = 13
        Caption = '11. '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edFIO: TDBEditEh
        Left = 240
        Top = 5
        Width = 261
        Height = 24
        DataField = 'FIO'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
      object edDokument: TDBEditEh
        Left = 240
        Top = 32
        Width = 474
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DOKUMENT'
        DataSource = dsDokument
        EditButtons = <
          item
            Hint = #1042#1074#1077#1089#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1080#1081' '#1083#1080#1095#1085#1086#1089#1090#1100
            Style = ebsEllipsisEh
            OnClick = edDokumentEditButtons0Click
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
            Style = ebsGlyphEh
            OnClick = edDokumentEditButtons1Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
      object edAdres: TDBEditEh
        Left = 240
        Top = 59
        Width = 474
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ADRES'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = True
      end
      object edZAPROS: TDBEditEh
        Left = 240
        Top = 87
        Width = 474
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ZAPROS'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Visible = True
      end
      object edORGANS: TDBEditEh
        Left = 240
        Top = 114
        Width = 474
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ORGANS'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Visible = True
      end
      object edOTMETKA: TDBEditEh
        Left = 240
        Top = 196
        Width = 474
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataField = 'OTMETKA'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Visible = True
      end
      object edOTVET_DATE: TDBDateTimeEditEh
        Left = 240
        Top = 169
        Width = 119
        Height = 24
        DataField = 'OTVET_DATE'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 6
        Visible = True
      end
      object edZAPROS_DATE: TDBDateTimeEditEh
        Left = 240
        Top = 141
        Width = 119
        Height = 24
        DataField = 'ZAPROS_DATE'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 5
        Visible = True
      end
      object edPRIM: TDBEditEh
        Left = 240
        Top = 224
        Width = 474
        Height = 24
        HelpContext = 999
        Anchors = [akLeft, akTop, akRight]
        DataField = 'PRIM'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        Visible = True
      end
    end
    object gbGit: TGroupBox
      Left = 53
      Top = 423
      Width = 289
      Height = 91
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1052#1077#1089#1090#1086' '#1087#1086#1089#1090#1086#1103#1085#1085#1086#1075#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Visible = False
      object Label15: TLabel
        Left = 22
        Top = 15
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
        Left = 387
        Top = 15
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
        Left = 22
        Top = 40
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
        Left = 387
        Top = 40
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
        Left = 22
        Top = 66
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
      object edB_RESP: TDBCheckBoxEh
        Left = 165
        Top = 13
        Width = 15
        Height = 17
        DataField = 'B_RESP'
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
      object edGOSUD: TDBLookupComboboxEh
        Left = 185
        Top = 12
        Width = 155
        Height = 19
        DataField = 'GOSUD'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Flat = True
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dsStran
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
      object edB_OBL: TDBCheckBoxEh
        Left = 474
        Top = 13
        Width = 15
        Height = 17
        AllowGrayed = True
        DataField = 'B_OBL'
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
      object edGOROD: TDBEditEh
        Left = 550
        Top = 37
        Width = 113
        Height = 19
        DataField = 'GOROD'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Flat = True
        ParentFont = False
        TabOrder = 5
        Visible = True
      end
      object edGOROD_R: TDBEditEh
        Left = 185
        Top = 63
        Width = 295
        Height = 19
        DataField = 'GOROD_R'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Flat = True
        ParentFont = False
        TabOrder = 7
        Visible = True
      end
      object edRNGOROD: TDBLookupComboboxEh
        Left = 501
        Top = 63
        Width = 122
        Height = 19
        DataField = 'RNGOROD'
        DataSource = dsDokument
        DropDownBox.Rows = 15
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Flat = True
        KeyField = 'R_NAME'
        ListField = 'R_NAME'
        ListSource = dsRnGor
        ParentFont = False
        Style = csDropDownEh
        TabOrder = 6
        Visible = False
        OnNotInList = edRNGORODNotInList
      end
      object edB_GOROD: TDBLookupComboboxEh
        Left = 495
        Top = 37
        Width = 46
        Height = 19
        Alignment = taRightJustify
        DataField = 'B_GOROD'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Flat = True
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dsTypeGorod
        ParentFont = False
        TabOrder = 4
        Visible = True
      end
      object edRAION: TDBEditEh
        Left = 185
        Top = 37
        Width = 155
        Height = 19
        DataField = 'RAION'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Flat = True
        ParentFont = False
        TabOrder = 3
        Visible = True
      end
      object edOBL: TDBEditEh
        Left = 495
        Top = 12
        Width = 169
        Height = 19
        DataField = 'OBL'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Flat = True
        ParentFont = False
        TabOrder = 2
        Visible = True
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 340
    Width = 728
  end
  inherited pnAdd: TPanel
    Width = 728
  end
  inherited dsDokument: TDataSource
    Left = 368
    Top = 82
  end
  inherited Dokument: TkbmMemTable
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NOMER'
        DataType = ftString
        Size = 15
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
        Name = 'DATE_ANUL'
        DataType = ftDate
      end
      item
        Name = 'PRINT_VOSSTAN'
        DataType = ftBoolean
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
        Name = 'RG_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'RG_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'RG_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'RG_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RG_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RG_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'RG_GOROD'
        DataType = ftString
        Size = 30
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
        Name = 'RUKOV'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DATE1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DOLG_RUKOV'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'DATE2'
        DataType = ftString
        Size = 30
      end>
    Left = 536
    Top = 186
    object DokumentNOMER: TStringField [1]
      FieldName = 'NOMER'
      Size = 15
    end
    object DokumentID_ZAGS: TIntegerField [4]
      FieldName = 'ID_ZAGS'
    end
    object DokumentDATEZ: TDateField
      FieldName = 'DATEZ'
    end
    object DokumentFIO: TStringField
      FieldName = 'FIO'
      Size = 70
    end
    object DokumentADRES: TMemoField
      FieldName = 'ADRES'
      BlobType = ftMemo
    end
    object DokumentDOKUMENT: TMemoField
      FieldName = 'DOKUMENT'
      BlobType = ftMemo
    end
    object DokumentRG_B_RESP: TBooleanField
      FieldName = 'B_RESP'
    end
    object DokumentRG_GOSUD: TIntegerField
      FieldName = 'GOSUD'
    end
    object DokumentRG_B_OBL: TBooleanField
      FieldName = 'B_OBL'
    end
    object DokumentRG_OBL: TStringField
      FieldName = 'OBL'
      Size = 30
    end
    object DokumentRG_RAION: TStringField
      FieldName = 'RAION'
      Size = 30
    end
    object DokumentRG_B_GOROD: TSmallintField
      FieldName = 'B_GOROD'
    end
    object DokumentRG_GOROD: TStringField
      FieldName = 'GOROD'
      Size = 30
    end
    object DokumentRNGOROD: TStringField
      FieldName = 'RNGOROD'
      Size = 50
    end
    object DokumentGT_GOROD_R: TStringField
      FieldName = 'GOROD_R'
      Size = 50
    end
    object DokumentRUKOV: TStringField
      FieldName = 'RUKOV'
      Size = 60
    end
    object DokumentZAPROS: TMemoField
      FieldName = 'ZAPROS'
      BlobType = ftMemo
    end
    object DokumentZAPROS_DATE: TDateField
      FieldName = 'ZAPROS_DATE'
    end
    object DokumentORGANS: TMemoField
      FieldName = 'ORGANS'
      BlobType = ftMemo
    end
    object DokumentOTVET_DATE: TDateField
      FieldName = 'OTVET_DATE'
    end
    object DokumentOTMETKA: TMemoField
      FieldName = 'OTMETKA'
      BlobType = ftMemo
    end
    object DokumentPRIM: TMemoField
      FieldName = 'PRIM'
      BlobType = ftMemo
    end
    object DokumentGOD: TIntegerField
      FieldName = 'GOD'
    end
    object DokumentDOK_TYPE: TIntegerField
      FieldName = 'DOK_TYPE'
    end
    object DokumentDOK_SERIA: TStringField
      FieldName = 'DOK_SERIA'
      Size = 7
    end
    object DokumentDOK_NOMER: TStringField
      FieldName = 'DOK_NOMER'
      Size = 10
    end
    object DokumentDOK_DATE: TDateField
      FieldName = 'DOK_DATE'
    end
    object DokumentDOK_NAME: TMemoField
      FieldName = 'DOK_NAME'
      BlobType = ftMemo
    end
  end
  object dsStran: TDataSource [8]
    DataSet = dmBase.SprStran
    Left = 556
    Top = 145
  end
  object dsNation: TDataSource [9]
    DataSet = dmBase.SprNac
    Left = 516
    Top = 113
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 480
    Top = 202
  end
  inherited HistZAGS: TkbmMemTable
    Left = 472
    Top = 122
  end
  inherited dsSeria: TDataSource
    Left = 496
    Top = 258
  end
  inherited dsObl: TDataSource
    Left = 536
    Top = 242
  end
  object dsGragd: TDataSource [14]
    Left = 436
    Top = 217
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 472
    Top = 170
  end
  inherited dsPovtor: TDataSource
    Left = 568
    Top = 242
  end
  inherited dsRN: TDataSource
    Left = 576
    Top = 242
  end
  inherited dsGorod: TDataSource
    Left = 536
    Top = 122
  end
  inherited dsRnGor: TDataSource
    Left = 624
  end
  inherited dsTypeGorod: TDataSource
    Left = 416
    Top = 66
  end
  inherited ImGISUN: TImageList
    Left = 780
    Top = 27
  end
  inherited dsVoenkom: TDataSource
    Left = 496
    Top = 74
  end
  inherited dsRovd: TDataSource
    Left = 456
    Top = 74
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 608
    Top = 194
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 432
    Top = 98
  end
  object ApplicationEvents1: TApplicationEvents
    Left = 518
    Top = 232
  end
end
