inherited fmDeclRegistr: TfmDeclRegistr
  Left = 439
  Top = 94
  ActiveControl = edFamilia
  Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077' '#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1087#1086' '#1084#1077#1089#1090#1091' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072' ('#1087#1088#1077#1073#1099#1074#1072#1085#1080#1103')'
  ClientHeight = 742
  ClientWidth = 821
  Constraints.MinHeight = 780
  Constraints.MinWidth = 800
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
    Top = 720
    Width = 821
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited pnTable: TPanel
    Top = 720
    Width = 821
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 821
    inherited TBToolbar: TTBToolbar
      object TBItemPrib: TTBItem [9]
        Caption = #1058#1072#1083#1086#1085' '#1087#1088#1080#1073#1099#1090#1080#1103
        HelpContext = 1
        Hint = #1042#1099#1087#1080#1089#1072#1090#1100' '#1090#1072#1083#1086#1085' '#1087#1088#1080#1073#1099#1090#1080#1103
        ImageIndex = 48
        OnClick = TBItemPribClick
      end
      object TBItemUbit: TTBItem [10]
        Caption = #1058#1072#1083#1086#1085' '#1091#1073#1099#1090#1080#1103
        Hint = #1042#1099#1087#1080#1089#1072#1090#1100' '#1090#1072#1083#1086#1085' '#1091#1073#1099#1090#1080#1103' '#1085#1072' '#1086#1089#1085#1086#1099#1074#1085#1080#1080' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1090#1072#1083#1086#1085#1072' '#1087#1088#1080#1073#1099#1090#1080#1103
        ImageIndex = 47
        OnClick = TBItemUbitClick
      end
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      inherited TBItemShablon: TTBItem
        Visible = True
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 817
        Top = 22
      end
    end
  end
  inherited sb: TScrollBox
    Width = 821
    Height = 670
    Align = alClient
    inherited pnPovtor: TPanel
      Left = 248
      Top = 424
      Visible = False
    end
    inherited N_F_edTypeEkz: TComboBox
      TabOrder = 9
    end
    object PanelMain: TPanel
      Left = 0
      Top = 0
      Width = 821
      Height = 126
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        821
        126)
      object Label1: TLabel
        Left = 12
        Top = 40
        Width = 50
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 234
        Top = 40
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
      object Label3: TLabel
        Left = 410
        Top = 40
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
      object Label4: TLabel
        Left = 648
        Top = 40
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
      object Label6: TLabel
        Left = 12
        Top = 68
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
        Left = 12
        Top = 96
        Width = 156
        Height = 13
        Caption = #1056#1077#1075#1080#1089#1090#1088#1080#1088#1091#1077#1090#1089#1103' '#1087#1086' '#1072#1076#1088#1077#1089#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TextAdres: TvchDBText
        Left = 181
        Top = 93
        Width = 406
        Height = 18
        Color = clInfoBk
        DataField = 'ADRES_ID'
        DataSource = dsDokument
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        OnGetText = TextAdresGetText
      end
      object Label26: TLabel
        Left = 250
        Top = 68
        Width = 120
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1095#1077#1083#1086#1074#1077#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 446
        Top = 68
        Width = 98
        Height = 13
        Caption = #1044#1086' '#1082#1072#1082#1086#1075#1086' '#1089#1088#1086#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label38: TLabel
        Left = 12
        Top = 9
        Width = 31
        Height = 13
        Caption = #1044#1072#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label35: TLabel
        Left = 193
        Top = 9
        Width = 204
        Height = 13
        Caption = #1054#1088#1075#1072#1085' '#1086#1092#1086#1088#1084#1083#1103#1102#1097#1080#1081' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1102
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edName: TDBEditEh
        Left = 274
        Top = 34
        Width = 100
        Height = 24
        DataField = 'Name'
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
      object edOtch: TDBEditEh
        Left = 479
        Top = 34
        Width = 133
        Height = 24
        DataField = 'Otch'
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
      object edPol: TDBComboBoxEh
        Left = 687
        Top = 34
        Width = 95
        Height = 24
        DataField = 'POL'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = True
      end
      object edDateR: TDBDateTimeEditEh
        Left = 118
        Top = 62
        Width = 103
        Height = 24
        DataField = 'DateR'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Visible = True
        EditFormat = 'DD/MM/YYYY      '
      end
      object btAdres: TBitBtn
        Left = 600
        Top = 91
        Width = 25
        Height = 22
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1076#1088#1077#1089' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
        TabOrder = 11
        TabStop = False
        OnClick = btAdresClick
        Glyph.Data = {
          D6000000424DD600000000000000560000002800000010000000100000000100
          040000000000800000000000000000000000080000000800000004020400FCFE
          04000402840004868400FC02FC0004FEFC000402FC0084868400444444444444
          4444440000000000074444055555055037444400000505503744440011050550
          3744440011050550374444000005000037444003333333333774402266666666
          2674440226000262674444402261062674444444022662677444444440222607
          7444444444026707744444444440740004444444444444444444}
      end
      object edKolvo: TDBNumberEditEh
        Left = 384
        Top = 62
        Width = 33
        Height = 24
        DataField = 'KOLVO'
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
      object edFamilia: TDBEditEh
        Left = 83
        Top = 34
        Width = 124
        Height = 24
        DataField = 'Familia'
        DataSource = dsDokument
        EditButtons = <
          item
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              1000030000000002000000000000000000000000000000000000007C0000E003
              00001F0000001863186318631863186318631863186318631863186318631863
              1863186318631863186310420040004010421042100010001042100010001042
              1863186318631863186318631042004010420040104210001042100010421863
              1863186318631863186318631863004010420040104210001042100010421863
              1863186318631863186318631863004010420040104210001042100010421863
              1863186318631863186318631863004000400040104210001000100010421863
              1863186318631863186318631863004000400040104210001000100010421863
              1042104218631863004010421863004010001042104210001000100010421042
              1000104218631863004000401042004010001000104210001000100010421000
              1000186318631863186300400040004000401000100010001000100010001000
              1863186318631863186318630040004000400040100010001000100010001863
              1863186318631863186318631863186300401042104218631000104210421863
              1863186318631863186318631863004000400040104210001000100010421863
              1863186318631863186318631863004000400040104210001000100010421863
              1863186318631863186318631863104200400040186310421000100018631863
              1863186318631863186318631863186318631863186318631863186318631863
              186318631863}
            Style = ebsGlyphEh
            Width = 16
            OnClick = edFamiliaEditButtons0Click
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
      object edDateSrok: TDBDateTimeEditEh
        Left = 561
        Top = 62
        Width = 103
        Height = 24
        DataField = 'DATE_SROK'
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
        EditFormat = 'DD/MM/YYYY      '
      end
      object edDateZ: TDBDateTimeEditEh
        Left = 56
        Top = 6
        Width = 121
        Height = 24
        HelpContext = 888
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
        TabOrder = 0
        Visible = True
      end
      object edOrgan: TDBEditEh
        Left = 420
        Top = 6
        Width = 362
        Height = 24
        DataField = 'ORGAN'
        DataSource = dsDokument
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = edOrganEditButtons0Click
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
      object edSrok: TDBEditEh
        Left = 677
        Top = 62
        Width = 134
        Height = 24
        Hint = #1058#1077#1082#1089#1090#1086#1074#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1076#1086' '#1082#1072#1082#1086#1075#1086' '#1089#1088#1086#1082#1072' ('#1077#1089#1083#1080' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086')'
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SROK'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        Visible = True
      end
      object edTypeReg: TDBComboBoxEh
        Left = 638
        Top = 90
        Width = 173
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataField = 'TYPEREG'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        Visible = True
        OnUpdateData = edTypeRegUpdateData
      end
    end
    object gbPasp: TGroupBox
      Left = 0
      Top = 126
      Width = 821
      Height = 79
      Align = alTop
      Caption = ' '#1055#1072#1089#1087#1086#1088#1090' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object Label8: TLabel
        Left = 261
        Top = 24
        Width = 31
        Height = 13
        Caption = #1057#1077#1088#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label27: TLabel
        Left = 366
        Top = 24
        Width = 31
        Height = 13
        Caption = #1053#1086#1084#1077#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 513
        Top = 24
        Width = 26
        Height = 13
        Caption = #1044#1072#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label29: TLabel
        Left = 10
        Top = 54
        Width = 73
        Height = 13
        Caption = #1054#1088#1075#1072#1085' '#1074#1099#1076#1072#1095#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label30: TLabel
        Left = 10
        Top = 24
        Width = 115
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edLichNomer: TDBEditEh
        Left = 135
        Top = 21
        Width = 117
        Height = 24
        CharCase = ecUpperCase
        DataField = 'LICH_NOMER'
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
        OnUpdateData = edLichNomerUpdateData
      end
      object edPasp_Seria: TDBEditEh
        Left = 298
        Top = 21
        Width = 45
        Height = 24
        CharCase = ecUpperCase
        DataField = 'PASP_SERIA'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
      object edPasp_Nomer: TDBEditEh
        Left = 406
        Top = 21
        Width = 87
        Height = 24
        DataField = 'PASP_NOMER'
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
      object edPasp_Date: TDBDateTimeEditEh
        Left = 546
        Top = 21
        Width = 121
        Height = 24
        DataField = 'PASP_DATE'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 3
        Visible = True
      end
      object edPasp_Organ: TDBEditEh
        Left = 96
        Top = 48
        Width = 571
        Height = 24
        DataField = 'PASP_VIDAN'
        DataSource = dsDokument
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = edPasp_OrganEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Visible = True
      end
    end
    object gbPribil: TGroupBox
      Left = 0
      Top = 205
      Width = 821
      Height = 88
      Align = alTop
      Caption = ' '#1054#1090#1082#1091#1076#1072' '#1087#1088#1080#1073#1099#1083' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      DesignSize = (
        821
        88)
      object Label13: TLabel
        Left = 8
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
      object Label14: TLabel
        Left = 418
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
      object Label22: TLabel
        Left = 110
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
      object Label23: TLabel
        Left = 418
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
      object BtRB: TImage
        Left = 388
        Top = 15
        Width = 13
        Height = 17
        Picture.Data = {
          07544269746D6170E6000000424DE60000000000000076000000280000000A00
          00000E0000000100040000000000700000000000000000000000100000000000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00FFFFFFFFFF000000FFFFFFFFFF000000F000000FFF000000F0FFFFF0FF00
          0000F0FFFFF0FF000000F0FFFFF0FF000000F0FFFFF0FF000000F000000FFF00
          0000F0FFFFFFFF000000F0FFFFFFFF000000F0FFFFFFFF000000F000000FFF00
          0000FFFFFFFFFF000000FFFFFFFFFF000000}
        Visible = False
      end
      object btRF: TImage
        Left = 403
        Top = 15
        Width = 13
        Height = 17
        Picture.Data = {
          07544269746D6170E6000000424DE60000000000000076000000280000000A00
          00000E0000000100040000000000700000000000000000000000100000000000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00FFFFFFFFFF000000FFFFFFFFFF000000FFF0FFFFFF000000FFF0FFFFFF00
          0000FFF0FFFFFF000000FFF0FFFFFF000000FFF00000FF000000FFF0FFF0FF00
          0000FFF0FFF0FF000000FFF0FFF0FF000000FFF0FFF0FF000000FFF00000FF00
          0000FFFFFFFFFF000000FFFFFFFFFF000000}
        Visible = False
      end
      object btU: TImage
        Left = 418
        Top = 15
        Width = 13
        Height = 17
        Picture.Data = {
          07544269746D6170E6000000424DE60000000000000076000000280000000A00
          00000E0000000100040000000000700000000000000000000000100000000000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00FFFFFFFFFF000000FFFFFFFFFF000000FFF00000FF000000FFFFFFF0FF00
          0000FFFFFFF0FF000000FFFFFFF0FF000000FFF00000FF000000FFF0FFF0FF00
          0000FFF0FFF0FF000000FFF0FFF0FF000000FFF0FFF0FF000000FFF0FFF0FF00
          0000FFFFFFFFFF000000FFFFFFFFFF000000}
        Visible = False
      end
      object Label16: TLabel
        Left = 38
        Top = 65
        Width = 105
        Height = 13
        Caption = #1091#1083#1080#1094#1072','#1076#1086#1084','#1082#1074#1072#1088#1090#1080#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edGOSUD_O: TDBLookupComboboxEh
        Left = 152
        Top = 12
        Width = 233
        Height = 24
        DataField = 'GOSUD_O'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dsStran
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
      object edGOROD_O: TDBEditEh
        Left = 578
        Top = 37
        Width = 183
        Height = 24
        DataField = 'GOROD_O'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = True
      end
      object DBCheckBoxEh1: TDBCheckBoxEh
        Left = 500
        Top = 14
        Width = 15
        Height = 17
        AllowGrayed = True
        DataField = 'B_OBL_O'
        DataSource = dsDokument
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object edGOROD_O_B: TDBLookupComboboxEh
        Left = 522
        Top = 37
        Width = 44
        Height = 24
        Alignment = taRightJustify
        DataField = 'GOROD_O_B'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dsTypeGorod
        ParentFont = False
        TabOrder = 4
        Visible = True
      end
      object edOBL_O: TDBEditEh
        Left = 522
        Top = 12
        Width = 191
        Height = 24
        DataField = 'OBL_O'
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
      object edRAION_O: TDBEditEh
        Left = 152
        Top = 37
        Width = 191
        Height = 24
        DataField = 'RAION_O'
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
      object edUlDom_O: TDBEditEh
        Left = 152
        Top = 62
        Width = 231
        Height = 24
        DataField = 'UL_O'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Visible = True
      end
      object edAddPrib: TDBEditEh
        Left = 411
        Top = 62
        Width = 401
        Height = 24
        Hint = #1047#1072#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1087#1088#1080' '#1074#1099#1076#1072#1095#1077' '#1087#1072#1089#1087#1086#1088#1090#1072
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ADD_PRIB'
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
    end
    object gbSem: TGroupBox
      Left = 0
      Top = 293
      Width = 821
      Height = 114
      Align = alClient
      Caption = ' '#1042#1084#1077#1089#1090#1077' '#1087#1088#1080#1073#1099#1083#1080' '
      Constraints.MinHeight = 114
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object GridSem: TDBGridEh
        Left = 2
        Top = 15
        Width = 771
        Height = 97
        Align = alClient
        DataSource = dsSem
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        HorzScrollBar.Visible = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        UseMultiTitle = True
        VertScrollBar.VisibleMode = sbNeverShowEh
        Columns = <
          item
            EditButtons = <>
            FieldName = 'OTNOSH'
            Footers = <>
            Title.Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077
            Width = 93
            OnGetCellParams = GridSemColumns0GetCellParams
          end
          item
            EditButtons = <>
            FieldName = 'FAMILIA'
            Footers = <>
            Title.Caption = #1060#1072#1084#1080#1083#1080#1103
            Width = 139
          end
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1048#1084#1103
            Width = 114
          end
          item
            EditButtons = <>
            FieldName = 'OTCH'
            Footers = <>
            Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
            Width = 115
          end
          item
            EditButtons = <>
            FieldName = 'DATER'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
            Width = 121
          end
          item
            EditButtons = <>
            FieldName = 'POL'
            Footers = <>
            KeyList.Strings = (
              #1052
              #1046)
            PickList.Strings = (
              #1052#1091#1078#1089#1082#1086#1081
              #1046#1077#1085#1089#1082#1080#1081)
            Title.Caption = #1055#1086#1083
            Width = 83
          end>
      end
      object Panel2: TPanel
        Left = 773
        Top = 15
        Width = 46
        Height = 97
        Align = alRight
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object btAddSem: TBitBtn
          Left = 8
          Top = 0
          Width = 28
          Height = 28
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 0
          OnClick = btAddSemClick
        end
        object btDelSem: TBitBtn
          Left = 8
          Top = 64
          Width = 28
          Height = 28
          Hint = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 2
          OnClick = btDelSemClick
        end
        object btEditSem: TBitBtn
          Left = 8
          Top = 32
          Width = 28
          Height = 28
          Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100
          TabOrder = 1
          OnClick = btEditSemClick
        end
      end
    end
    object pnFIOSobstv: TPanel
      Left = 0
      Top = 407
      Width = 821
      Height = 87
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 6
      DesignSize = (
        821
        87)
      object Label7: TLabel
        Left = 12
        Top = 65
        Width = 225
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = #1060#1072#1084#1080#1083#1080#1103', '#1048#1084#1103', '#1054#1090#1095#1077#1089#1090#1074#1086' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 12
        Top = 14
        Width = 282
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = #1046#1080#1083#1086#1077' '#1087#1086#1084#1077#1097#1077#1085#1080#1077' '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1083#1077#1085#1086' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 639
        Top = 14
        Width = 14
        Height = 13
        Caption = #1086#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label47: TLabel
        Left = 639
        Top = 41
        Width = 16
        Height = 13
        Caption = #1076#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label48: TLabel
        Left = 383
        Top = 41
        Width = 13
        Height = 13
        Caption = #8470
      end
      object edFIOSobstv: TDBEditEh
        Left = 265
        Top = 62
        Width = 548
        Height = 24
        Anchors = [akLeft, akRight, akBottom]
        DataField = 'FIO_SOBST'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Visible = True
      end
      object edOsnov: TDBEditEh
        Left = 11
        Top = 35
        Width = 358
        Height = 24
        Anchors = [akLeft, akBottom]
        DataField = 'OSNOV'
        DataSource = dsDokument
        EditButtons = <
          item
            Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1096#1072#1073#1083#1086#1085#1072
            Style = ebsEllipsisEh
            OnClick = edOsnovEditButtons0Click
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
      object edDate_Osnov: TDBDateTimeEditEh
        Left = 669
        Top = 8
        Width = 115
        Height = 24
        DataField = 'OSNOV_DATE'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = True
        EditFormat = 'DD/MM/YYYY      '
      end
      object edOSNOV_ID: TDBComboBoxEh
        Left = 318
        Top = 8
        Width = 306
        Height = 24
        DataField = 'OSNOV_ID'
        DataSource = dsDokument
        DropDownBox.Rows = 15
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
      object N_F_edNomerSem: TDBCheckBoxEh
        Left = 534
        Top = 39
        Width = 96
        Height = 17
        Caption = #1082#1074#1072#1088#1090#1080#1088#1072#1085#1090
        DataField = 'NOMER_SEM'
        DataSource = dsDokument
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object edDateSrokDog: TDBDateTimeEditEh
        Left = 669
        Top = 35
        Width = 115
        Height = 24
        Hint = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1086#1075#1086#1074#1086#1088#1072' '#1085#1072#1081#1084#1072' '#1076#1083#1103' '#1082#1074#1072#1088#1090#1080#1088#1072#1085#1090#1072
        DataField = 'DATE_SROK_DN'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = True
        EditFormat = 'DD/MM/YYYY      '
      end
      object edNomer_Osnov: TDBEditEh
        Left = 405
        Top = 35
        Width = 112
        Height = 24
        DataField = 'OSNOV_NOMER'
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
    end
    object gbSemSobst: TGroupBox
      Left = 0
      Top = 494
      Width = 821
      Height = 115
      Align = alBottom
      Caption = ' '#1057#1086#1074#1077#1088#1096#1077#1085#1085#1086#1083#1077#1090#1085#1080#1077' '#1095#1083#1077#1085#1099' '#1089#1077#1084#1100#1080' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1072'  '
      Constraints.MinHeight = 115
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object GridSemSobst: TDBGridEh
        Left = 2
        Top = 15
        Width = 771
        Height = 98
        Align = alClient
        DataSource = dsSemSobst
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        HorzScrollBar.Visible = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        UseMultiTitle = True
        VertScrollBar.VisibleMode = sbNeverShowEh
        Columns = <
          item
            EditButtons = <>
            FieldName = 'OTNOSH'
            Footers = <>
            Title.Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077
            Width = 93
            OnGetCellParams = GridSemColumns0GetCellParams
          end
          item
            EditButtons = <>
            FieldName = 'FAMILIA'
            Footers = <>
            Title.Caption = #1060#1072#1084#1080#1083#1080#1103
            Width = 139
          end
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1048#1084#1103
            Width = 114
          end
          item
            EditButtons = <>
            FieldName = 'OTCH'
            Footers = <>
            Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
            Width = 115
          end
          item
            EditButtons = <>
            FieldName = 'DATER'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
            Width = 121
          end>
      end
      object Panel1: TPanel
        Left = 773
        Top = 15
        Width = 46
        Height = 98
        Align = alRight
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object btAddS: TBitBtn
          Left = 8
          Top = 0
          Width = 28
          Height = 28
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 0
          OnClick = btAddSClick
        end
        object btDelS: TBitBtn
          Left = 8
          Top = 66
          Width = 28
          Height = 28
          Hint = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 2
          OnClick = btDelSClick
        end
        object btEditS: TBitBtn
          Left = 8
          Top = 33
          Width = 28
          Height = 28
          Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100
          TabOrder = 1
          OnClick = btEditSClick
        end
      end
    end
    object pnPodval: TPanel
      Left = 0
      Top = 609
      Width = 821
      Height = 61
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 8
      DesignSize = (
        821
        61)
      object Label41: TLabel
        Left = 12
        Top = 37
        Width = 190
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081' '#1079#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1102
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 18
        Top = 12
        Width = 96
        Height = 13
        Caption = #1054#1073#1097#1072#1103' '#1087#1083#1086#1097#1072#1076#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 283
        Top = 12
        Width = 157
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1088#1086#1078#1080#1074#1072#1102#1097#1080#1093
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 523
        Top = 12
        Width = 107
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1077#1090#1077#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edDolgRukov: TDBEditEh
        Left = 222
        Top = 34
        Width = 236
        Height = 24
        Anchors = [akLeft, akBottom]
        DataField = 'RUKOV_DOLG'
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
      object edRukov: TDBEditEh
        Left = 483
        Top = 34
        Width = 135
        Height = 24
        HelpContext = 999
        Anchors = [akLeft, akBottom]
        DataField = 'RUKOV'
        DataSource = dsDokument
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = edRukovEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Visible = True
      end
      object edKolvoProg: TDBNumberEditEh
        Left = 456
        Top = 6
        Width = 33
        Height = 24
        DataField = 'KOLVO_PROG'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
      object edKolvoDeti: TDBNumberEditEh
        Left = 648
        Top = 6
        Width = 35
        Height = 24
        DataField = 'KOLVO_DETI'
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
      object edPloshAll: TDBEditEh
        Left = 128
        Top = 6
        Width = 133
        Height = 24
        DataField = 'TAIL_HOUSE'
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
    end
    object edUdost: TDBComboBoxEh
      Left = 10
      Top = 119
      Width = 265
      Height = 24
      DataField = 'PASP_UDOST'
      DataSource = dsDokument
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
          Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1072#1089#1087#1086#1088#1090#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
          Style = ebsGlyphEh
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Visible = True
    end
  end
  inherited StBar: TStatusBar
    Top = 720
    Width = 821
  end
  inherited pnAdd: TPanel
    Width = 821
    Visible = False
    inherited lbAnnulir: TvchDBText
      Visible = False
    end
  end
  inherited dsDokument: TDataSource
    Left = 728
    Top = 154
  end
  inherited Dokument: TkbmMemTable
    FieldDefs = <
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
        Name = 'ORGAN'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ORGAN_ID'
        DataType = ftInteger
      end
      item
        Name = 'POVTOR'
        DataType = ftBoolean
      end
      item
        Name = 'NOMER'
        DataType = ftInteger
      end
      item
        Name = 'DATEZ'
        DataType = ftDate
      end
      item
        Name = 'TYPEREG'
        DataType = ftSmallint
      end
      item
        Name = 'DATE_SROK'
        DataType = ftDate
      end
      item
        Name = 'SROK'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FIO_SOBST'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'KOLVO'
        DataType = ftSmallint
      end
      item
        Name = 'LICH_ID'
        DataType = ftInteger
      end
      item
        Name = 'MEN_ID'
        DataType = ftInteger
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
        Name = 'DateIzm'
        DataType = ftDate
      end
      item
        Name = 'NOMER_EKZ'
        DataType = ftInteger
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
        Name = 'DateR'
        DataType = ftDate
      end
      item
        Name = 'POL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ADRES_ID'
        DataType = ftInteger
      end
      item
        Name = 'ADRES_NAME'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'SOATO_O'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'GOSUD_O'
        DataType = ftInteger
      end
      item
        Name = 'B_OBL_O'
        DataType = ftBoolean
      end
      item
        Name = 'OBL_O'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RAION_O'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GOROD_O'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UL_O'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DATE_O'
        DataType = ftDate
      end
      item
        Name = 'LICH_NOMER'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'PASP_UDOST'
        DataType = ftSmallint
      end
      item
        Name = 'PASP_SERIA'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'PASP_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PASP_DATE'
        DataType = ftDate
      end
      item
        Name = 'PASP_VIDAN'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'GOROD_O_B'
        DataType = ftInteger
      end
      item
        Name = 'OSNOV_ID'
        DataType = ftInteger
      end
      item
        Name = 'OSNOV_DATE'
        DataType = ftDate
      end
      item
        Name = 'OSNOV_NOMER'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'OSNOV'
        DataType = ftMemo
      end
      item
        Name = 'RUKOV'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'RUKOV_DOLG'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PLOSH_ALL'
        DataType = ftFloat
      end
      item
        Name = 'KOLVO_PROG'
        DataType = ftSmallint
      end
      item
        Name = 'KOLVO_DETI'
        DataType = ftSmallint
      end
      item
        Name = 'NOMER_SEM'
        DataType = ftSmallint
      end
      item
        Name = 'DATE_SROK_DN'
        DataType = ftDate
      end
      item
        Name = 'ADD_PRIB'
        DataType = ftMemo
      end>
    Left = 728
    Top = 170
    object DokumentORGAN: TStringField [3]
      FieldName = 'ORGAN'
      Size = 200
    end
    object DokumentORGAN_ID: TIntegerField [4]
      FieldName = 'ORGAN_ID'
    end
    inherited DokumentPOVTOR: TBooleanField [5]
    end
    object DokumentNOMER: TIntegerField [6]
      FieldName = 'NOMER'
    end
    object DokumentDATEZ: TDateField [7]
      FieldName = 'DATEZ'
    end
    object DokumentTYPEREG: TSmallintField [8]
      FieldName = 'TYPEREG'
    end
    object DokumentDATE_SROK: TDateField [9]
      FieldName = 'DATE_SROK'
    end
    object DokumentSROK: TStringField [10]
      FieldName = 'SROK'
      Size = 30
    end
    object DokumentFIO_SOBST: TStringField [11]
      FieldName = 'FIO_SOBST'
      Size = 200
    end
    object DokumentKOLVO: TSmallintField [12]
      FieldName = 'KOLVO'
    end
    object DokumentLICH_ID: TIntegerField [13]
      FieldName = 'LICH_ID'
    end
    object DokumentMEN_ID: TIntegerField [14]
      FieldName = 'MEN_ID'
    end
    object DokumentFamilia: TStringField [15]
      FieldName = 'Familia'
      Size = 50
    end
    object DokumentName: TStringField [16]
      FieldName = 'Name'
      Size = 30
    end
    object DokumentOtch: TStringField [17]
      FieldName = 'Otch'
      Size = 30
    end
    inherited DokumentDateIzm: TDateField [18]
    end
    inherited DokumentNOMER_EKZ: TIntegerField [19]
    end
    object DokumentDateR: TDateField
      FieldName = 'DateR'
    end
    object DokumentPOL: TStringField
      FieldName = 'POL'
      Size = 1
    end
    object DokumentADRES_ID: TIntegerField
      FieldName = 'ADRES_ID'
    end
    object DokumentADRES_NAME: TMemoField
      FieldName = 'ADRES_NAME'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentSOATO_O: TStringField
      FieldName = 'SOATO_O'
      Size = 10
    end
    object DokumentGOSUD_O: TIntegerField
      FieldName = 'GOSUD_O'
    end
    object DokumentB_OBL_O: TBooleanField
      FieldName = 'B_OBL_O'
    end
    object DokumentOBL_O: TStringField
      FieldName = 'OBL_O'
      Size = 30
    end
    object DokumentRAION_O: TStringField
      FieldName = 'RAION_O'
      Size = 30
    end
    object DokumentGOROD_O: TStringField
      FieldName = 'GOROD_O'
      Size = 30
    end
    object DokumentUL_O: TStringField
      FieldName = 'UL_O'
      Size = 50
    end
    object DokumentDATE_O: TDateField
      FieldName = 'DATE_O'
    end
    object DokumentLICH_NOMER: TStringField
      FieldName = 'LICH_NOMER'
      Size = 14
    end
    object DokumentPASP_UDOST: TSmallintField
      FieldName = 'PASP_UDOST'
    end
    object DokumentPASP_SERIA: TStringField
      FieldName = 'PASP_SERIA'
      Size = 5
    end
    object DokumentPASP_NOMER: TStringField
      FieldName = 'PASP_NOMER'
      Size = 10
    end
    object DokumentPASP_DATE: TDateField
      FieldName = 'PASP_DATE'
    end
    object DokumentPASP_VIDAN: TStringField
      FieldName = 'PASP_VIDAN'
      Size = 200
    end
    object DokumentGOROD_O_B: TIntegerField
      FieldName = 'GOROD_O_B'
    end
    object DokumentOSNOV_ID: TIntegerField
      FieldName = 'OSNOV_ID'
    end
    object DokumentOSNOV_DATE: TDateField
      FieldName = 'OSNOV_DATE'
    end
    object DokumentOSNOV_NOMER: TStringField
      FieldName = 'OSNOV_NOMER'
      Size = 15
    end
    object DokumentOSNOV: TMemoField
      FieldName = 'OSNOV'
      BlobType = ftMemo
    end
    object DokumentRUKOV: TStringField
      FieldName = 'RUKOV'
      Size = 50
    end
    object DokumentRUKOV_DOLG: TStringField
      FieldName = 'RUKOV_DOLG'
      Size = 100
    end
    object DokumentKOLVO_PROG: TSmallintField
      FieldName = 'KOLVO_PROG'
    end
    object DokumentKOLVO_DETI: TSmallintField
      FieldName = 'KOLVO_DETI'
    end
    object DokumentNOMER_SEM: TSmallintField
      FieldName = 'NOMER_SEM'
    end
    object DokumentDATE_SROK_DN: TDateField
      FieldName = 'DATE_SROK_DN'
    end
    object DokumentADD_PRIB: TMemoField
      FieldName = 'ADD_PRIB'
      BlobType = ftMemo
    end
    object DokumentTAIL_HOUSE: TStringField
      FieldName = 'TAIL_HOUSE'
      Size = 25
    end
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 88
    Top = 554
  end
  inherited HistZAGS: TkbmMemTable
    Left = 152
    Top = 546
  end
  inherited dsSeria: TDataSource
    Left = 352
    Top = 370
  end
  inherited dsObl: TDataSource
    Left = 120
    Top = 378
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 224
    Top = 554
  end
  inherited dsPovtor: TDataSource
    Left = 176
    Top = 378
  end
  inherited dsRN: TDataSource
    Left = 320
    Top = 546
  end
  inherited dsGorod: TDataSource
    Left = 56
    Top = 370
  end
  inherited dsRnGor: TDataSource
    Left = 296
    Top = 362
  end
  inherited dsTypeGorod: TDataSource
    Left = 472
    Top = 370
  end
  inherited ImGISUN: TImageList
    Left = 588
    Top = 67
  end
  inherited dsVoenkom: TDataSource
    Left = 416
    Top = 546
  end
  inherited dsRovd: TDataSource
    Left = 32
    Top = 546
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 240
    Top = 362
  end
  object dsStran: TDataSource
    DataSet = dmBase.SprStran
    Left = 404
    Top = 361
  end
  object dsSem: TDataSource
    DataSet = tbSem
    OnDataChange = dsSemDataChange
    Left = 652
    Top = 385
  end
  object tbSem: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'FAMILIA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OTCH'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'POL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATER'
        DataType = ftDate
      end
      item
        Name = 'CHILD_ID'
        DataType = ftInteger
      end>
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
    Left = 576
    Top = 370
    object tbSemFAMILIA: TStringField
      FieldName = 'FAMILIA'
      Size = 30
    end
    object tbSemNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object tbSemOTCH: TStringField
      FieldName = 'OTCH'
      Size = 30
    end
    object tbSemPOL: TStringField
      FieldName = 'POL'
      Size = 1
    end
    object tbSemDATER: TDateField
      FieldName = 'DATER'
    end
    object tbSemOTNOSH: TIntegerField
      FieldName = 'OTNOSH'
    end
  end
  object tbSemSobst: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'FAMILIA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OTCH'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'POL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATER'
        DataType = ftDate
      end
      item
        Name = 'CHILD_ID'
        DataType = ftInteger
      end>
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
    Left = 536
    Top = 546
    object tbSemSobstFAMILIA: TStringField
      FieldName = 'FAMILIA'
      Size = 30
    end
    object tbSemSobstNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object tbSemSobstOTCH: TStringField
      FieldName = 'OTCH'
      Size = 30
    end
    object tbSemSobstPOL: TStringField
      FieldName = 'POL'
      Size = 1
    end
    object tbSemSobstDATER: TDateField
      FieldName = 'DATER'
    end
    object tbSemSobstOTNOSH: TIntegerField
      FieldName = 'OTNOSH'
    end
  end
  object dsSemSobst: TDataSource
    DataSet = tbSemSobst
    Left = 618
    Top = 544
  end
end
