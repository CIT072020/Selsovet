inherited fmRegDogN: TfmRegDogN
  Left = 426
  Top = 176
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1076#1086#1075#1086#1074#1086#1088#1072' '#1085#1072#1081#1084#1072
  ClientHeight = 577
  ClientWidth = 820
  Constraints.MinHeight = 600
  Constraints.MinWidth = 830
  Icon.Data = {
    0000010001001010000001001800680300001600000028000000100000002000
    0000010018000000000000030000000000000000000000000000000000004E48
    4666615F534D4A3F4F563C5B663C5A663E4E5356545166615F3E412F49563645
    413A5C5A5247423A47533544453765635FD4D3D2D8D7D692DAF94CC0F14CBFF0
    9FDBF4CFCDCCDAD8D8434E3273CB2D686F58FFFFFF7A7F6D6CBB2D4956366563
    5FE2ECF1E6EEF292DBFA4CC3F6469CC09BD5ECD5D5D4E3E2E1434E3273CB2D68
    6F58FFFFFF797D6D6EBE2C49563665635FE0F5FEE3F6FE92DBFA4CC4F74494B6
    9BD5EED0CECED9D8D7434E3273CB2D5B5E4DC9C7C667695A6EBF2C4956366563
    5FC8C6C5CDCBCAA1E0FA58C8F758C8F7B0E5FAC3E5F3CCE7F2434E3373CA2D5F
    90315F8F335E8F3171C62D49563665635FFFFFFFFFFFFFFCFEFFE1F5FEE2F5FE
    FEFFFFFEFEFEF5F5F5434D3371984D6E6E62646A546D6E627692594956366563
    5FFBFCFAFAFCF7FBFDF8FEFFFEFDFDFCF9F8F8F9F8F8FEFEFE434E339BD36FF5
    F5F5A2DC75FFFFFFBFE7A049563665635FDDF0CE7BCA3D7ECD3CF2FAEBBCBAB9
    66615E4F4946FFFFFF434E329CD470F4F4F49ED572FEFEFEBFE7A04956366563
    5FDDF1CF7AC83A7ECA42F1F9EABCBAB9BCBAB9797572FFFFFF434E328AD24FBB
    E09F89CC55BBE09F96D7614A563465635FE0F4D17CCA3D7AC63DE9F1E2BBB9B8
    66615E4F4946FFFFFF434E3273CB2D6FC12C5E952B4C63344A5338595A4D6563
    5FFEFFFDFAFCF7F1F3EFF3F4F3F3F3F2F8F7F7F9F8F8FFFFFF3F42324955364E
    534063635D00000000000000000065635FD6D5D4635E5B5D5754E4E4E4C1E3F2
    5CC3EF60CAF6FFFFFF5E59580000000000000000000000000000000000006563
    5FD2D1D0A6A3A18C8886EBEAEABDE3F24BBCEC5FC4EFFEFEFE635E5D00000000
    000000000000000000000000000065635FD2D1D06D6765605A57ECEBEBC3EBFB
    55C3F25AC3F0F8F9F9635E5D0000000000000000000000000000000000006563
    5FF8F8F7DFDEDDDFDEDDFCFCFCF5FCFFE3F6FEE0F3FBFBFBFB625E5C00000000
    00000000000000000000000000004C464565635F65635F65635F65635F65635F
    65635F65635F65635F4F4A480000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000070000003F0000003F0000003F0000003F0000003F0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 555
    Width = 820
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited pnTable: TPanel
    Top = 555
    Width = 820
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 820
    inherited TBToolbar: TTBToolbar
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      inherited TBSubmenuRun: TTBSubmenuItem
        Visible = False
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 276
      end
    end
  end
  inherited sb: TScrollBox
    Width = 820
    Height = 505
    Align = alClient
    inherited ImBtClear: TImage
      Left = 728
      Top = 32
    end
    inherited ImBtRun: TImage
      Left = 712
      Top = 8
    end
    inherited pnPovtor: TPanel
      Left = 712
      Top = 384
      Width = 89
      Height = 65
      TabOrder = 5
      Visible = False
      inherited DbGridEh1: TDBGridEh
        Left = 27
      end
      inherited btAddPovtor: TBitBtn
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          040000000000800000000000000000000000020000000200000004020400C4C2
          C400111111111111111111111111111111111111111111111011111011111111
          1111110001111111011111000111111011111110001111001111111100011001
          1111111110000011111111111100011111111111100000111111111100011011
          1111110000111100111110000111111001111001111111110011111111111111
          1111}
      end
    end
    inherited N_F_edTypeEkz: TComboBox
      Left = 768
      Top = 349
      Width = 49
      TabOrder = 6
    end
    object pnInfo: TPanel
      Left = 0
      Top = 213
      Width = 820
      Height = 253
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      DesignSize = (
        820
        253)
      object Label47: TLabel
        Left = 380
        Top = 15
        Width = 14
        Height = 13
        Caption = #1087#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 583
        Top = 105
        Width = 6
        Height = 13
        Caption = 'c'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 10
        Top = 15
        Width = 211
        Height = 13
        Caption = #1057#1088#1086#1082' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1076#1086#1075#1086#1074#1086#1088#1072' '#1085#1072#1081#1084#1072' '#1089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 10
        Top = 44
        Width = 204
        Height = 13
        Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1077#1082#1088#1072#1097#1077#1085#1080#1103' '#1076#1086#1075#1086#1074#1086#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 10
        Top = 74
        Width = 173
        Height = 13
        Caption = #1044#1072#1090#1072' '#1087#1088#1077#1082#1088#1072#1097#1077#1085#1080#1103' '#1076#1086#1075#1086#1074#1086#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 10
        Top = 104
        Width = 91
        Height = 13
        Caption = #1048#1085#1089#1087#1077#1082#1094#1080#1103' '#1052#1053#1057
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 11
        Top = 136
        Width = 70
        Height = 13
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edDateCancel: TDBDateTimeEditEh
        Left = 239
        Top = 67
        Width = 115
        Height = 26
        DataField = 'DATE_CANCEL'
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
        EditFormat = 'DD/MM/YYYY      '
      end
      object edDateR2: TDBDateTimeEditEh
        Left = 413
        Top = 8
        Width = 120
        Height = 26
        DataField = 'DATER2'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = True
        EditFormat = 'DD/MM/YYYY      '
      end
      object edIMNS: TDBComboBoxEh
        Left = 239
        Top = 97
        Width = 568
        Height = 26
        DataField = 'IMNS'
        DataSource = dsDokument
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = edIMNSEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = True
      end
      object edOsnovCancel: TDBComboBoxEh
        Left = 238
        Top = 37
        Width = 568
        Height = 26
        DataField = 'OSNOV_CANCEL'
        DataSource = dsDokument
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = edOsnovCancelEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = True
      end
      object edDateR1: TDBDateTimeEditEh
        Left = 238
        Top = 8
        Width = 120
        Height = 26
        DataField = 'DATER1'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
        EditFormat = 'DD/MM/YYYY      '
      end
      object edPrim: TDBEditEh
        Left = 9
        Top = 154
        Width = 801
        Height = 93
        TabStop = False
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSelect = False
        AutoSize = False
        DataField = 'PRIM'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Visible = True
        WantReturns = True
        WordWrap = True
        OnDblClick = TBItemEditMemoClick
      end
      object cbUnlim: TDBCheckBoxEh
        Left = 392
        Top = 72
        Width = 233
        Height = 17
        Caption = #1073#1077#1089#1089#1088#1086#1095#1085#1099#1081
        DataField = 'UNLIM'
        DataSource = dsDokument
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
    end
    object pnPodval: TPanel
      Left = 0
      Top = 466
      Width = 820
      Height = 39
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 4
      DesignSize = (
        820
        39)
      object lbDolgSpec: TvchDBText
        Left = 6
        Top = 11
        Width = 592
        Height = 17
        Alignment = taRightJustify
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SPEC_D'
        DataSource = dsDokument
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edSpec: TDBEditEh
        Left = 606
        Top = 5
        Width = 204
        Height = 26
        HelpContext = 999
        Anchors = [akTop, akRight]
        DataField = 'SPEC'
        DataSource = dsDokument
        EditButtons = <
          item
            Hint = #1042#1099#1073#1088#1072#1090#1100
            Style = ebsEllipsisEh
            OnClick = edSpecEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
    end
    object gbNanim: TGroupBox
      Left = 0
      Top = 168
      Width = 820
      Height = 45
      Align = alTop
      Caption = ' '#1053#1072#1085#1080#1084#1072#1090#1077#1083#1100' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Label2: TLabel
        Left = 593
        Top = 18
        Width = 53
        Height = 16
        Caption = #1058#1077#1083#1077#1092#1086#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edNanim: TDBEditEh
        Left = 195
        Top = 13
        Width = 370
        Height = 26
        DataField = 'NANIM_FIO'
        DataSource = dsDokument
        EditButtons = <
          item
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000000000000000000000000000000000007F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F80808000008000008080808080808080
              00008000008080808000008000008080807F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F8080800000808080800000808080808000008080808000008080807F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00008080808000008080
              80808000008080808000008080807F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F0000808080800000808080808000008080808000008080807F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00008000008000008080
              80808000008000008000008080807F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F0000800000800000808080808000008000008000008080807F7F
              7F8080808080807F7F7F7F7F7F0000808080807F7F7F00008080000080808080
              80808000008000008000008080808080808000008080807F7F7F7F7F7F000080
              0000808080800000808000008000008080808000008000008000008080808000
              008000007F7F7F7F7F7F7F7F7F7F7F7F00008000008000008000008080000080
              00008000008000008000008000008000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F0000800000800000800000808000008000008000008000008000007F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00008080808080
              80807F7F7F8000008080808080807F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F0000800000800000808080808000008000008000008080807F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00008000008000008080
              80808000008000008000008080807F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F8080800000800000807F7F7F8080808000008000007F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F}
            Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
            Style = ebsEllipsisEh
            Width = 20
            OnClick = edNanimEditButtons0Click
          end
          item
            Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
            Style = ebsGlyphEh
            Width = 20
            OnClick = edNanimEditButtons1Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
      object edNanimTel: TDBEditEh
        Left = 663
        Top = 13
        Width = 145
        Height = 26
        DataField = 'NANIM_TEL'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
      object cbNanim: TComboBox
        Left = 11
        Top = 14
        Width = 172
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
        Text = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
        OnChange = cbNanimChange
        Items.Strings = (
          #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
          #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103)
      end
    end
    object pnMain: TPanel
      Left = 0
      Top = 0
      Width = 820
      Height = 63
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label15: TLabel
        Left = 12
        Top = 38
        Width = 128
        Height = 13
        Caption = #1040#1076#1088#1077#1089' '#1076#1086#1084#1086#1074#1083#1072#1076#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TextAdres: TvchDBText
        Left = 157
        Top = 36
        Width = 429
        Height = 18
        Color = clInfoBk
        DataField = 'ADRES_ID'
        DataSource = dsDokument
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        OnGetText = TextAdresGetText
      end
      object Label38: TLabel
        Left = 185
        Top = 10
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
      object lbNomer: TLabel
        Left = 12
        Top = 10
        Width = 37
        Height = 13
        Caption = #1053#1086#1084#1077#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btAdres: TBitBtn
        Left = 596
        Top = 34
        Width = 24
        Height = 22
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1076#1088#1077#1089' '#1076#1086#1084#1086#1074#1083#1072#1076#1077#1085#1080#1103
        TabOrder = 2
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
      object edDateZ: TDBDateTimeEditEh
        Left = 215
        Top = 3
        Width = 120
        Height = 26
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
        TabOrder = 1
        Visible = True
      end
      object edNomer: TDBEditEh
        Left = 67
        Top = 3
        Width = 101
        Height = 26
        HelpType = htKeyword
        HelpContext = 888
        DataField = 'NOMER'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
      object btClearAdres: TBitBtn
        Left = 622
        Top = 34
        Width = 24
        Height = 22
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1072#1076#1088#1077#1089' '#1076#1086#1084#1086#1074#1083#1072#1076#1077#1085#1080#1103
        TabOrder = 3
        TabStop = False
        OnClick = btClearAdresClick
      end
    end
    object gbSobst: TGroupBox
      Left = 0
      Top = 63
      Width = 820
      Height = 105
      Align = alTop
      Caption = ' '#1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object lbSobst: TLabel
        Left = 12
        Top = 17
        Width = 139
        Height = 16
        Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 593
        Top = 17
        Width = 53
        Height = 16
        Caption = #1058#1077#1083#1077#1092#1086#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbIDENTIF: TLabel
        Left = 12
        Top = 48
        Width = 167
        Height = 16
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081'. '#1085#1086#1084#1077#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbAdres: TLabel
        Left = 12
        Top = 77
        Width = 150
        Height = 16
        Caption = #1040#1076#1088#1077#1089' '#1084#1077#1089#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbSobstUNP: TLabel
        Left = 424
        Top = 48
        Width = 23
        Height = 16
        Caption = #1059#1053#1055
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edSobst: TDBEditEh
        Left = 195
        Top = 13
        Width = 370
        Height = 26
        DataField = 'SOBST_FIO'
        DataSource = dsDokument
        EditButtons = <
          item
            Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
            Style = ebsEllipsisEh
            Width = 20
            OnClick = edSobstEditButtons0Click
          end
          item
            Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
            Style = ebsGlyphEh
            Width = 20
            OnClick = edSobstEditButtons1Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
      object edSobstTel: TDBEditEh
        Left = 663
        Top = 13
        Width = 145
        Height = 26
        DataField = 'SOBST_TEL'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
      object ENG_edISobstIN: TDBEditEh
        Left = 195
        Top = 42
        Width = 174
        Height = 26
        CharCase = ecUpperCase
        DataField = 'SOBST_IDENTIF'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = True
      end
      object edSobstAdres: TDBEditEh
        Left = 195
        Top = 71
        Width = 500
        Height = 26
        DataField = 'SOBST_ADRES'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Visible = True
      end
      object edSobstUNP: TDBEditEh
        Left = 467
        Top = 42
        Width = 174
        Height = 26
        CharCase = ecUpperCase
        DataField = 'SOBST_UNP'
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
    end
  end
  inherited StBar: TStatusBar
    Top = 555
    Width = 820
  end
  inherited pnAdd: TPanel
    Width = 820
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
    Left = 776
    Top = 154
    inherited DokumentPOVTOR: TBooleanField [3]
    end
    inherited DokumentDateIzm: TDateField [4]
    end
    inherited DokumentNOMER_EKZ: TIntegerField [5]
    end
    inherited DokumentCOVER_MESSAGE_ID: TStringField [16]
    end
    inherited DokumentCOVER_MESSAGE_TIME: TDateTimeField [17]
    end
    inherited DokumentREQUEST_IN: TStringField [18]
    end
    inherited DokumentCOUNT_RESH_SUD: TIntegerField [19]
    end
    inherited DokumentDATE_POST_GIS: TDateTimeField [20]
    end
    inherited DokumentDATE_EDIT_GIS: TDateTimeField [21]
    end
    inherited DokumentUSER_GIS: TStringField [22]
    end
    object DokumentSPEC: TStringField [23]
      FieldName = 'SPEC'
      Size = 70
    end
    inherited DokumentSPEC_D: TStringField [24]
    end
    object DokumentNOMER: TStringField
      FieldName = 'NOMER'
    end
    object DokumentTYPEOBJ: TIntegerField
      FieldName = 'TYPEOBJ'
    end
    object DokumentDATEZ: TDateField
      FieldName = 'DATEZ'
    end
    object DokumentTYPEHOUSE: TIntegerField
      FieldName = 'TYPEHOUSE'
    end
    object DokumentADRES_ID: TIntegerField
      FieldName = 'ADRES_ID'
    end
    object DokumentNANIM_ID: TIntegerField
      FieldName = 'NANIM_ID'
    end
    object DokumentNANIM_FIO: TStringField
      FieldName = 'NANIM_FIO'
      Size = 70
    end
    object DokumentNANIM_IDENTIF: TStringField
      FieldName = 'NANIM_IDENTIF'
      Size = 14
    end
    object DokumentNANIM_TYPE: TIntegerField
      FieldName = 'NANIM_TYPE'
    end
    object DokumentNANIM_DateR: TDateField
      FieldName = 'NANIM_DateR'
    end
    object DokumentNANIM_TEL: TStringField
      FieldName = 'NANIM_TEL'
      Size = 30
    end
    object DokumentSOBST_ID: TIntegerField
      FieldName = 'SOBST_ID'
    end
    object DokumentSOBST_FIO: TStringField
      FieldName = 'SOBST_FIO'
      Size = 100
    end
    object DokumentSOBST_IDENTIF: TStringField
      FieldName = 'SOBST_IDENTIF'
      Size = 14
    end
    object DokumentSOBST_ADRES: TMemoField
      FieldName = 'SOBST_ADRES'
      BlobType = ftMemo
      Size = 200
    end
    object DokumentSOBST_UNP: TStringField
      FieldName = 'SOBST_UNP'
      Size = 9
    end
    object DokumentSOBST_TEL: TStringField
      FieldName = 'SOBST_TEL'
      Size = 30
    end
    object DokumentDATER1: TDateField
      FieldName = 'DATER1'
    end
    object DokumentDATER2: TDateField
      FieldName = 'DATER2'
    end
    object DokumentDATE_CANCEL: TDateField
      FieldName = 'DATE_CANCEL'
    end
    object DokumentOSNOV_CANCEL: TIntegerField
      FieldName = 'OSNOV_CANCEL'
    end
    object DokumentIMNS: TIntegerField
      FieldName = 'IMNS'
    end
    object DokumentPRIM: TStringField
      FieldName = 'PRIM'
      Size = 200
    end
    object DokumentADD_FIELDS: TMemoField
      FieldName = 'ADD_FIELDS'
      BlobType = ftMemo
    end
    object DokumentUNLIM: TBooleanField
      FieldName = 'UNLIM'
    end
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 608
    Top = 266
  end
  inherited HistZAGS: TkbmMemTable
    Left = 648
    Top = 266
  end
  inherited dsSeria: TDataSource
    Left = 480
    Top = 354
  end
  inherited dsObl: TDataSource
    Left = 384
    Top = 362
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 688
    Top = 266
  end
  inherited dsPovtor: TDataSource
    Left = 568
    Top = 362
  end
  inherited dsRN: TDataSource
    Left = 736
    Top = 266
  end
  inherited dsGorod: TDataSource
    Top = 354
  end
  inherited dsRnGor: TDataSource
    Left = 432
    Top = 362
  end
  inherited dsTypeGorod: TDataSource
    Left = 520
    Top = 346
  end
  inherited ImGISUN: TImageList
    Left = 580
    Top = 59
  end
  inherited dsVoenkom: TDataSource
    Left = 768
    Top = 266
  end
  inherited dsRovd: TDataSource
    Left = 568
    Top = 266
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 696
    Top = 330
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 680
  end
  inherited tbFamily: TkbmMemTable
    Left = 648
    Top = 330
  end
end
