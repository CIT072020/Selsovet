inherited fmQueryGISUN: TfmQueryGISUN
  Left = 381
  Top = 145
  ActiveControl = edFamilia
  Caption = #1047#1072#1087#1088#1086#1089' '#1076#1072#1085#1085#1099#1093' '#1086' '#1095#1077#1083#1086#1074#1077#1082#1077
  ClientHeight = 716
  Constraints.MinHeight = 625
  Constraints.MinWidth = 790
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    000001002000000000000004000000000000000000000000000000000000C096
    6834B99A46D3B49C33F7B49C33F4B49C33F4B49C33F4B49C33F4B49C33F4B49C
    33F4B49C33F4B49C33F4B49C33F4B49C33F4B49C33F6BA9A4ACDC0966734C295
    701BB79B40AAAF9F1BFFAF9F1BFFAF9F1BFFAF9F1BFFAF9F1BFFAFA01BFFAFA0
    1BFFAF9F1BFFAF9F1BFFAF9F1BFFAF9F1BFFAF9F1CFDB89A469FC2966F1C30DE
    0000BC98553FB29E28E4AF9F1CFFAF9F1DFFAF9F1DFFB09F1AFFAD9D1CFFAD9D
    1CFFB09F1AFFAF9F1DFFAF9F1DFFAE9F1BFFB29E2ADEBD985936FF25FF00BF97
    6000CA929003B89B4570B29E27EAAF9F1DFFAF9F1BFF999F4AFF86AB94FF86AB
    91FF9B9E44FFAF9F1AFFAF9F1DFFB19E29E5B99B4864D58DB302C0976500B59E
    2F00BD995500C5937B06BB99504FB69D32ADA09C44DE7CB8CAFE7BC5F0FF7CC6
    F0FF7DB6C3FDA49C3FDBB69C34A8BB995248C8938A04BF986100BC9A5000C394
    7800B59D3000BE985A00B79F1F00E493680B6E92A26F72B7DCF776BBDFFF76BB
    DFFF71B6DBF472929C61E6926B0AB89E2C00BE985E00BA9A4C00C49478000000
    0000000000009B8B7F004677920010547B0562A3C7877BC2E7FC81CAF0FF80CA
    EFFF7AC0E5FB60A1C47B002C5A02417490009E8C7F0000000000000000000000
    000000000000000000005A96B6004F88A63077BCE0D882CCF2FF81CAF0FF81CA
    F0FF82CBF2FF75BADFD04A829E26548FAD00FFFFFF0000000000000000000000
    0000000000005894B3004B84A107609EBF8E7AC1E5FB82CBF1FF81CAF0FF81CA
    F0FF82CBF1FF78BEE3F85D9ABB814B84A0055792B10000000000000000000000
    0000000000005A93B700538CAC225D95BAE078BBE2FF82CCF2FF81CAF0FF81CA
    F0FF82CCF2FF76B8DFFF5B91B7D65690B0195A93B60000000000000000000000
    000000000000416590003B5D87174B729ED474B5DDFF82CCF1FF81CBF1FF82CC
    F2FF83CDF3FF74B5DDFF4A719DCC3B5C861342648F0000000000000000000000
    000000000000456496003D5A8825496B9DE55883B2FF5E8EBBFF6194C0FF71B0
    D8FF81CBF0FF70AED7FF486B9CDE3D58881D4361930000000000000000000000
    000000000000466698003E5C8A274A6C9FE84D70A5FF4C6FA3FF4C6EA3FF4E73
    A5FF5F91BDFF5784B3FF47689BDD3E5D8B1C4464950000000000000000000000
    0000000000003E5D8C0037547F10466799BC4F72A7FF4E71A6FF4E71A6FF4E70
    A6FF4D6EA3FF4C6EA3FD4464959F334C750A3C59850000000000000000000000
    000000000000354E760098DAFF00405E8D4C496B9EDE4E71A6FF4F72A7FF4F72
    A7FF4B6DA1EB426191823A56821F466B9F0031466D0000000000000000000000
    00000000000039558100324C76002A4169053F5D8C49446596AD476799E74667
    98D7405F8E6A2C456B053F5D8C001E2A470037507A0000000000000000000000
    00000000000000000000000000000000000000000000C0030000C0030000C003
    0000C0030000C0030000C0030000C0030000C0030000C0030000C0030000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 26
    Visible = False
  end
  object Label22: TLabel [1]
    Left = 37
    Top = 479
    Width = 82
    Height = 13
    Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077')'
  end
  inherited pnTable: TPanel
    Top = 63
    Height = 631
    Visible = False
  end
  inherited TBDock: TTBDock
    inherited TBToolbar: TTBToolbar
      object TBItemChoiceMen: TTBItem [2]
        Caption = #1042#1099#1073#1088#1072#1090#1100
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072
        ImageIndex = 44
        Visible = False
      end
      object TBSeparatorItem1: TTBSeparatorItem [6]
      end
      object TBSubmenuGISUN: TTBSubmenuItem [7]
        Caption = #1042#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1077' '#1089' '#1043#1048#1057' '#1056#1053
        ImageIndex = 5
        Images = ImGISUN
        Visible = False
        object TBItemStep1: TTBItem
          Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
          OnClick = TBItemStep1Click
        end
        object TBItemStep2: TTBItem
          Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1072#1082#1090#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
          OnClick = TBItemStep2Click
        end
      end
      inherited TBItemGetDataGISUN: TTBItem [8]
        Visible = True
      end
      inherited TBSeparator1: TTBSeparatorItem [9]
      end
      object TBItemDeclChName: TTBItem [11]
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077
        ImageIndex = 148
        Visible = False
        OnClick = TBItemDeclChNameClick
      end
      object TBItemZaklChName: TTBItem [12]
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1077
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1077' '#1086' '#1087#1077#1088#1077#1084#1077#1085#1077' '#1080#1084#1077#1085#1080
        ImageIndex = 137
        Visible = False
      end
      object TBItemArxSpr: TTBItem [13]
        AutoCheck = True
        Caption = #1040#1088#1093#1080#1074#1085#1072#1103' '#1089#1087#1088#1072#1074#1082#1072
        Hint = #1040#1088#1093#1080#1074#1085#1072#1103' '#1089#1087#1088#1072#1074#1082#1072
        ImageIndex = 45
        Visible = False
      end
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      inherited TBItemHistCorr: TTBItem
        Visible = False
      end
      inherited TBItemZAGS: TTBItem
        Visible = False
      end
      inherited TBItemAdresat: TTBItem
        Visible = False
      end
      inherited TBItemSprAkt: TTBItem
        Visible = False
      end
      inherited TBItemDeclSvid: TTBItem
        Visible = False
      end
      inherited TBItemCancel: TTBItem
        Caption = '&'#1042#1099#1093#1086#1076
        Hint = #1042#1099#1093#1086#1076
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 213
        inherited edZAGS: TDBEditEh
          TabStop = False
        end
      end
    end
  end
  inherited sb: TScrollBox
    Top = 63
    Height = 631
    Align = alClient
    inherited pnPovtor: TPanel
      Left = 760
      Top = 208
      Width = 97
      Height = 41
      TabOrder = 1
      inherited imBE: TImage
        Left = 74
        Anchors = [akTop]
      end
      inherited DbGridEh1: TDBGridEh
        Left = 123
        Top = 15
      end
      inherited N_F_cbPrintPovtor: TDBCheckBoxEh
        Left = 14
      end
    end
    object pc: TPageControl [4]
      Left = 0
      Top = 0
      Width = 876
      Height = 631
      ActivePage = tsTail1
      Align = alClient
      HotTrack = True
      Images = fmMain.ImageList
      TabOrder = 0
      TabStop = False
      object tsTail1: TTabSheet
        Caption = #1054#1089#1085#1086#1074#1085#1086#1077
        ImageIndex = -1
        DesignSize = (
          868
          602)
        object Label1: TLabel
          Left = 5
          Top = 23
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
        object Label5: TLabel
          Left = 5
          Top = 50
          Width = 100
          Height = 13
          Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1086#1077' '#1080#1084#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 5
          Top = 77
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
        object Label7: TLabel
          Left = 490
          Top = 50
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
        object Label14: TLabel
          Left = 5
          Top = 330
          Width = 81
          Height = 13
          Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 490
          Top = 23
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
        object Label26: TLabel
          Left = 490
          Top = 77
          Width = 80
          Height = 13
          Caption = #1048#1076#1077#1085#1090'. '#1085#1086#1084#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 17
          Top = 123
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
        object Label11: TLabel
          Left = 119
          Top = 177
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
        object Label10: TLabel
          Left = 75
          Top = 150
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
        object Label12: TLabel
          Left = 69
          Top = 204
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
        object Label36: TLabel
          Left = 5
          Top = 102
          Width = 101
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel1: TBevel
          Left = 464
          Top = 15
          Width = 3
          Height = 76
        end
        object Label23: TLabel
          Left = 65
          Top = 301
          Width = 86
          Height = 13
          Caption = #1088'-'#1086#1085'  '#1075#1086#1088'., '#1091#1083#1080#1094#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label66: TLabel
          Left = 529
          Top = 301
          Width = 19
          Height = 13
          Caption = #1076#1086#1084
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label67: TLabel
          Left = 640
          Top = 301
          Width = 28
          Height = 13
          Caption = #1082#1086#1088#1087'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label68: TLabel
          Left = 739
          Top = 301
          Width = 16
          Height = 13
          Caption = #1082#1074'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 17
          Top = 244
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
        object Label19: TLabel
          Left = 463
          Top = 244
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
        object Label20: TLabel
          Left = 121
          Top = 272
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
        object Label2: TLabel
          Left = 5
          Top = 224
          Width = 112
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 5
          Top = 359
          Width = 125
          Height = 13
          Caption = #1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 5
          Top = 385
          Width = 129
          Height = 52
          AutoSize = False
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090#13#10#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1080#1081' '#1083#1080#1095#1085#1086#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label69: TLabel
          Left = 709
          Top = 388
          Width = 12
          Height = 13
          Caption = #1086#1090
        end
        object N_F_lbStatus: TvchDBText
          Left = 705
          Top = 1
          Width = 154
          Height = 16
          Hint = #1089#1090#1072#1090#1091#1089' '#1074' '#1043#1048#1057' '#1056#1053
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Color = clBtnFace
          Constraints.MaxWidth = 350
          DataField = 'STATUS'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          OnGetText = N_F_lbStatusGetText
        end
        object lbDateS: TLabel
          Left = 693
          Top = 124
          Width = 75
          Height = 13
          Caption = #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object edFamilia: TDBEditEh
          Left = 141
          Top = 16
          Width = 145
          Height = 26
          HelpType = htKeyword
          HelpContext = 888
          Color = clInfoBk
          DataField = 'Familia'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Visible = True
        end
        object edName: TDBEditEh
          Left = 141
          Top = 43
          Width = 145
          Height = 26
          Color = clInfoBk
          DataField = 'Name'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Visible = True
        end
        object edOtch: TDBEditEh
          Left = 141
          Top = 70
          Width = 145
          Height = 26
          Color = clInfoBk
          DataField = 'Otch'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Visible = True
        end
        object edDATER: TDBDateTimeEditEh
          Left = 604
          Top = 43
          Width = 161
          Height = 26
          Color = clInfoBk
          DataField = 'DateR'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          Visible = True
        end
        object edGRAG: TDBLookupComboboxEh
          Left = 184
          Top = 323
          Width = 300
          Height = 26
          Color = clInfoBk
          DataField = 'GRAG'
          DataSource = dsDokument
          DropDownBox.Width = 300
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'GNAME'
          ListSource = dsGragd
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
          Visible = True
        end
        object edPol: TDBComboBoxEh
          Left = 604
          Top = 16
          Width = 161
          Height = 26
          Color = clInfoBk
          DataField = 'POL'
          DataSource = dsDokument
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Visible = True
        end
        object ENG_edIDENTIF: TDBEditEh
          Left = 604
          Top = 70
          Width = 161
          Height = 26
          CharCase = ecUpperCase
          Color = clInfoBk
          DataField = 'IDENTIF'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Visible = True
        end
        object BLR_edOtch: TDBEditEh
          Left = 296
          Top = 70
          Width = 145
          Height = 26
          Color = clInfoBk
          DataField = 'Otch_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
          Visible = True
        end
        object BLR_edName: TDBEditEh
          Left = 296
          Top = 43
          Width = 145
          Height = 26
          Color = clInfoBk
          DataField = 'Name_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
          Visible = True
        end
        object BLR_edFamilia: TDBEditEh
          Left = 296
          Top = 16
          Width = 145
          Height = 26
          HelpType = htKeyword
          HelpContext = 888
          Color = clInfoBk
          DataField = 'Familia_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
          Visible = True
        end
        object edGOSUD: TDBLookupComboboxEh
          Left = 184
          Top = 116
          Width = 222
          Height = 26
          Color = clInfoBk
          DataField = 'GOSUD'
          DataSource = dsDokument
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsStran
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          Visible = True
        end
        object edB_OBL: TDBCheckBoxEh
          Left = 162
          Top = 148
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
          TabOrder = 7
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edGOROD: TDBEditEh
          Left = 256
          Top = 197
          Width = 150
          Height = 26
          HelpKeyword = '<FULL>'
          Color = clInfoBk
          DataField = 'GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
          Visible = True
        end
        object BLR_edOBL: TDBEditEh
          Left = 450
          Top = 143
          Width = 222
          Height = 26
          HelpType = htKeyword
          Color = clInfoBk
          DataField = 'OBL_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 17
          Visible = True
        end
        object BLR_edRAION: TDBEditEh
          Left = 450
          Top = 170
          Width = 222
          Height = 26
          Color = clInfoBk
          DataField = 'RAION_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 18
          Visible = True
        end
        object edB_GOROD: TDBLookupComboboxEh
          Left = 184
          Top = 197
          Width = 60
          Height = 26
          Alignment = taRightJustify
          Color = clInfoBk
          DataField = 'B_GOROD'
          DataSource = dsDokument
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsTypeGorod
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
          Visible = True
        end
        object edRAION: TDBEditEh
          Left = 184
          Top = 170
          Width = 222
          Height = 26
          Color = clInfoBk
          DataField = 'RAION'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
          Visible = True
        end
        object edOBL: TDBEditEh
          Left = 184
          Top = 143
          Width = 222
          Height = 26
          HelpKeyword = '<FULL>'
          Color = clInfoBk
          DataField = 'OBL'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
          Visible = True
        end
        object BLR_edGorod: TDBEditEh
          Left = 524
          Top = 197
          Width = 148
          Height = 26
          HelpKeyword = '<FULL>'
          Color = clInfoBk
          DataField = 'GOROD_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 20
          Visible = True
        end
        object BLR_edGosud: TDBLookupComboboxEh
          Left = 450
          Top = 116
          Width = 222
          Height = 26
          TabStop = False
          Color = clInfoBk
          DataField = 'GOSUD'
          DataSource = dsDokument
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME_B'
          ListSource = dsStran
          ParentFont = False
          ReadOnly = True
          Style = csDropDownEh
          TabOrder = 16
          Visible = True
        end
        object BLR_edB_GOROD: TDBLookupComboboxEh
          Left = 450
          Top = 197
          Width = 60
          Height = 26
          TabStop = False
          Alignment = taRightJustify
          Color = clInfoBk
          DataField = 'B_GOROD'
          DataSource = dsDokument
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME_B'
          ListSource = dsTypeGorod
          ParentFont = False
          ReadOnly = True
          TabOrder = 19
          Visible = True
        end
        object edM_GOROD_R: TDBEditEh
          Left = 342
          Top = 294
          Width = 166
          Height = 26
          Color = clInfoBk
          DataField = 'M_GOROD_R'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 21
          Visible = True
        end
        object edM_RNGOROD: TDBLookupComboboxEh
          Left = 184
          Top = 294
          Width = 147
          Height = 26
          Color = clInfoBk
          DataField = 'M_RNGOROD'
          DataSource = dsDokument
          DropDownBox.Rows = 15
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'R_NAME'
          ListField = 'R_NAME'
          ListSource = dsRnGor
          ParentFont = False
          ReadOnly = True
          Style = csDropDownEh
          TabOrder = 22
          Visible = True
        end
        object edM_DOM: TDBEditEh
          Left = 568
          Top = 294
          Width = 55
          Height = 26
          Color = clInfoBk
          DataField = 'M_DOM'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 23
          Visible = True
        end
        object edM_KORP: TDBEditEh
          Left = 677
          Top = 294
          Width = 48
          Height = 26
          Color = clInfoBk
          DataField = 'M_KORP'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 24
          Visible = True
        end
        object edM_KV: TDBEditEh
          Left = 764
          Top = 294
          Width = 57
          Height = 26
          Color = clInfoBk
          DataField = 'M_KV'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 25
          Visible = True
        end
        object edM_GOSUD: TDBLookupComboboxEh
          Left = 184
          Top = 237
          Width = 205
          Height = 26
          Color = clInfoBk
          DataField = 'M_GOSUD'
          DataSource = dsDokument
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsStran
          ParentFont = False
          ReadOnly = True
          TabOrder = 26
          Visible = True
        end
        object edM_B_OBL: TDBCheckBoxEh
          Left = 546
          Top = 242
          Width = 15
          Height = 17
          AllowGrayed = True
          Color = clBtnFace
          DataField = 'M_B_OBL'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 27
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edM_OBL: TDBEditEh
          Left = 568
          Top = 237
          Width = 205
          Height = 26
          HelpKeyword = '<FULL>'
          Color = clInfoBk
          DataField = 'M_OBL'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 28
          Visible = True
        end
        object edM_B_GOROD: TDBLookupComboboxEh
          Left = 568
          Top = 265
          Width = 44
          Height = 26
          Alignment = taRightJustify
          Color = clInfoBk
          DataField = 'M_B_GOROD'
          DataSource = dsDokument
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsTypeGorod
          ParentFont = False
          ReadOnly = True
          TabOrder = 29
          Visible = True
        end
        object edM_GOROD: TDBEditEh
          Left = 621
          Top = 265
          Width = 152
          Height = 26
          HelpKeyword = '<FULL>'
          Color = clInfoBk
          DataField = 'M_GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 30
          Visible = True
        end
        object edM_RAION: TDBEditEh
          Left = 184
          Top = 265
          Width = 205
          Height = 26
          Color = clInfoBk
          DataField = 'M_RAION'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 31
          Visible = True
        end
        object edDOKUMENT: TDBEditEh
          Left = 184
          Top = 410
          Width = 659
          Height = 26
          Color = clInfoBk
          DataField = 'DOKUMENT'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 32
          Visible = True
        end
        object edSEM: TDBComboBoxEh
          Left = 184
          Top = 352
          Width = 193
          Height = 26
          HelpContext = 888
          Color = clInfoBk
          DataField = 'SEM_REG'
          DataSource = dsDokument
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 33
          Visible = True
        end
        object edDOK_TYPE: TDBComboBoxEh
          Left = 184
          Top = 381
          Width = 329
          Height = 26
          Color = clInfoBk
          DataField = 'DOK_TYPE'
          DataSource = dsDokument
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 34
          Visible = True
        end
        object edDOK_SERIA: TDBEditEh
          Left = 534
          Top = 381
          Width = 52
          Height = 26
          CharCase = ecUpperCase
          Color = clInfoBk
          DataField = 'DOK_SERIA'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 35
          Visible = True
        end
        object edDOK_NOMER: TDBEditEh
          Left = 606
          Top = 381
          Width = 89
          Height = 26
          Color = clInfoBk
          DataField = 'DOK_NOMER'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 36
          Visible = True
        end
        object edDOK_DATE: TDBDateTimeEditEh
          Left = 736
          Top = 381
          Width = 107
          Height = 26
          Color = clInfoBk
          DataField = 'DOK_DATE'
          DataSource = dsDokument
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          ReadOnly = True
          TabOrder = 37
          Visible = True
        end
        object gbDeti: TGroupBox
          Left = 2
          Top = 444
          Width = 864
          Height = 135
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = ' '#1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1076#1077#1090#1103#1093'                          '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 38
          object GridDeti: TDBGridEh
            Left = 2
            Top = 15
            Width = 860
            Height = 118
            TabStop = False
            Align = alClient
            AllowedOperations = []
            Color = clInfoBk
            DataSource = dsDeti
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
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnGetCellParams = GridDetiGetCellParams
            OnKeyDown = GridDetiKeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'FAMILIA'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #1060#1072#1084#1080#1083#1080#1103
                Width = 102
              end
              item
                EditButtons = <>
                FieldName = 'NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #1048#1084#1103
                Width = 87
              end
              item
                EditButtons = <>
                FieldName = 'OTCH'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
                Width = 103
              end
              item
                EditButtons = <>
                FieldName = 'GOD_ROG'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #1043#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
                Title.TitleButton = True
                Visible = False
                Width = 82
              end
              item
                Alignment = taCenter
                EditButtons = <>
                FieldName = 'DATER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
                Title.TitleButton = True
                Width = 96
              end
              item
                EditButtons = <>
                FieldName = 'VOZR'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #1042#1086#1079#1088#1072#1089#1090
                Width = 47
              end
              item
                Alignment = taCenter
                EditButtons = <>
                FieldName = 'POL'
                Footer.FieldName = 'POL'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #1055#1086#1083
                Width = 40
              end
              item
                Alignment = taCenter
                EditButtons = <>
                FieldName = 'IDENTIF'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
                Width = 143
              end
              item
                EditButtons = <>
                FieldName = 'MESTOR'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
                Width = 319
              end
              item
                EditButtons = <>
                FieldName = 'STATUS_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #1057#1090#1072#1090#1091#1089
                Width = 99
              end
              item
                AlwaysShowEditButton = True
                EditButtons = <
                  item
                    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1086#1088#1075#1072#1085' '#1047#1040#1043#1057
                    ShortCut = 121
                    Style = ebsEllipsisEh
                  end>
                FieldName = 'ZAGS_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1072' '#1047#1040#1043#1057
                Width = 261
              end
              item
                EditButtons = <>
                FieldName = 'ZAGS_NOMER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #8470' '#1079#1072#1087#1080#1089#1080
                Width = 57
              end
              item
                EditButtons = <>
                FieldName = 'ZAGS_DATE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #1044#1072#1090#1072' '#1079#1072#1087#1080#1089#1080
                Width = 79
              end>
          end
        end
        object edSEM_DOK: TDBEditEh
          Left = 395
          Top = 352
          Width = 448
          Height = 26
          Hint = #1044#1086#1082#1091#1084#1077#1085#1090' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1072#1102#1097#1080#1081' '#1087#1088#1077#1082#1088#1072#1097#1077#1085#1080#1077' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1073#1088#1072#1082#1072
          Color = clInfoBk
          DataField = 'SEM_DOK'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 39
          Visible = True
        end
        object edDateS: TDBDateTimeEditEh
          Left = 692
          Top = 143
          Width = 161
          Height = 21
          Color = clInfoBk
          DataField = 'DATES'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          ReadOnly = True
          TabOrder = 40
          Visible = False
        end
        object N_F_OnlyActive: TDBCheckBoxEh
          Left = 130
          Top = 442
          Width = 97
          Height = 17
          Caption = #1072#1082#1090#1080#1074#1085#1099#1077
          DataField = 'ONLYACTIVE'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 41
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = N_F_OnlyActiveClick
        end
        object N_F_Do18: TDBCheckBoxEh
          Left = 220
          Top = 442
          Width = 85
          Height = 17
          Caption = #1076#1086' 18 '#1083#1077#1090
          DataField = 'DO18'
          DataSource = dsDokument
          TabOrder = 42
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = N_F_Do18Click
        end
      end
      object tsReshSud: TTabSheet
        Caption = #1056#1077#1096#1077#1085#1080#1103' '#1089#1091#1076#1072
        ImageIndex = 19
        DesignSize = (
          868
          602)
        object lbDolgSpec: TvchDBText
          Left = 2
          Top = 426
          Width = 616
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
          Visible = False
        end
        object edSpec: TDBEditEh
          Left = 633
          Top = 421
          Width = 230
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
          Visible = False
        end
        object GridRS: TDBGridEh
          Left = 4
          Top = 7
          Width = 860
          Height = 257
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          DataSource = dsReshSud
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
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
          ParentFont = False
          ReadOnly = True
          RowHeight = 36
          RowSizingAllowed = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          UseMultiTitle = True
          Columns = <
            item
              EditButtons = <>
              FieldName = 'ID'
              Footers = <>
              KeyList.Strings = (
                'ON'
                'ONA')
              PickList.Strings = (
                #1054#1085
                #1054#1085#1072)
              Title.Caption = #1050#1090#1086
              Visible = False
              Width = 40
            end
            item
              EditButtons = <>
              FieldName = 'FIO'
              Footers = <>
              Title.Caption = #1060#1048#1054
              Visible = False
              Width = 182
            end
            item
              EditButtons = <>
              FieldName = 'TYPE_RESH'
              Footers = <>
              Title.Caption = #1058#1080#1087
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'DATE_RESH'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072
              Width = 98
            end
            item
              EditButtons = <>
              FieldName = 'TEXT'
              Footers = <>
              Title.Caption = #1056#1077#1096#1077#1085#1080#1077
              Width = 355
            end
            item
              EditButtons = <>
              FieldName = 'SUD'
              Footers = <>
              Title.Caption = #1057#1091#1076
              Width = 287
            end
            item
              EditButtons = <>
              FieldName = 'CANCEL'
              Footers = <>
              Title.Caption = #1054#1090#1084#1077#1085#1072
              Visible = False
            end>
        end
        object mDebug: TMemo
          Left = 5
          Top = 277
          Width = 857
          Height = 111
          Lines.Strings = (
            'mDebug')
          TabOrder = 2
          Visible = False
        end
      end
    end
    inherited N_F_edTypeEkz: TComboBox
      Left = 792
      Top = 244
      Width = 51
      TabOrder = 2
    end
  end
  inherited StBar: TStatusBar
    Top = 694
  end
  inherited pnAdd: TPanel
    Top = 29
    Height = 34
    inherited lbAnnulir: TvchDBText
      Left = 853
      Width = 13
      Visible = False
    end
    object lbUser: TLabel
      Left = 10
      Top = 9
      Width = 84
      Height = 13
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbId: TLabel
      Left = 241
      Top = 9
      Width = 87
      Height = 13
      Caption = #1048#1076'. '#1089#1086#1086#1073#1097#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDt: TLabel
      Left = 633
      Top = 9
      Width = 79
      Height = 13
      Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object N_F_edGisUser: TDBEditEh
      Left = 104
      Top = 4
      Width = 122
      Height = 24
      Hint = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1043#1048#1057' '#1056#1053' '#1079#1072#1087#1088#1086#1089#1080#1074#1096#1077#1075#1086' '#1076#1072#1085#1085#1099#1077
      Color = 16776176
      Ctl3D = True
      DataField = 'USER_GIS'
      DataSource = dsDokument
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Visible = True
    end
    object N_F_edGisIdQuery: TDBEditEh
      Left = 339
      Top = 4
      Width = 280
      Height = 24
      Hint = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1089#1086#1086#1073#1097#1077#1085#1080#1103' '#1043#1048#1057' '#1056#1053
      Color = 16776176
      Ctl3D = True
      DataField = 'COVER_MESSAGE_ID'
      DataSource = dsDokument
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Visible = True
    end
    object N_F_edGisTimeQuery: TDBDateTimeEditEh
      Left = 723
      Top = 4
      Width = 144
      Height = 24
      Hint = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1086#1090#1074#1077#1090#1072' '#1043#1048#1057' '#1056#1053
      Color = 16776176
      Ctl3D = True
      DataField = 'COVER_MESSAGE_TIME'
      DataSource = dsDokument
      EditButton.Visible = False
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Visible = True
      EditFormat = 'dd.mm.yyyy hh:nn'
    end
  end
  inherited dsDokument: TDataSource
    Left = 400
    Top = 114
  end
  object dsDeti: TDataSource [8]
    DataSet = tbFamily
    OnDataChange = dsDetiDataChange
    Left = 240
    Top = 573
  end
  object dsNation: TDataSource [9]
    DataSet = dmBase.SprNac
    Left = 716
    Top = 161
  end
  object dsStran: TDataSource [10]
    DataSet = dmBase.SprStran
    Left = 676
    Top = 169
  end
  inherited Dokument: TkbmMemTable
    FieldDefs = <
      item
        Name = 'NOMER'
        DataType = ftInteger
      end
      item
        Name = 'DATEZ'
        DataType = ftDate
      end
      item
        Name = 'SVID_SERIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SVID_NOMER'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATESV'
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
        Name = 'FamiliaDo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NameDo'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OtchDo'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FamiliaPosle'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NamePosle'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OtchPosle'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FamiliaDo_B'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NameDo_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OtchDo_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FamiliaPosle_B'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NamePosle_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OtchPosle_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'POL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DateR'
        DataType = ftDate
      end
      item
        Name = 'GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NATION'
        DataType = ftInteger
      end
      item
        Name = 'GRAG'
        DataType = ftInteger
      end
      item
        Name = 'M_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'M_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'M_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'M_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'M_GOROD_R'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'M_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'M_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'SEM'
        DataType = ftInteger
      end
      item
        Name = 'V_OBAZAN'
        DataType = ftBoolean
      end
      item
        Name = 'V_WHO'
        DataType = ftMemo
      end
      item
        Name = 'DOKUMENT'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'DETI'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'OSNOV'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'OTMETKA'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'RUKOV'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'RUKOV_B'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SPEC'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ISPRAV'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'VOSSTAN'
        DataType = ftBoolean
      end
      item
        Name = 'ID_ZAGS'
        DataType = ftInteger
      end
      item
        Name = 'ID_SOURCE'
        DataType = ftInteger
      end
      item
        Name = 'B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'REG_ZAGS'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'REG_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'REG_DATE'
        DataType = ftDate
      end
      item
        Name = 'First_Ekz'
        DataType = ftBoolean
      end
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
        Name = 'DateIzm'
        DataType = ftDate
      end
      item
        Name = 'OBL_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RAION_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GOROD_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OTHER'
        DataType = ftMemo
      end
      item
        Name = 'IZMEN'
        DataType = ftMemo
      end
      item
        Name = 'COPIA'
        DataType = ftBoolean
      end
      item
        Name = 'NOMER_EKZ'
        DataType = ftInteger
      end
      item
        Name = 'ARX_ADRESAT'
        DataType = ftMemo
      end
      item
        Name = 'ARX_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ARX_DATE'
        DataType = ftDate
      end
      item
        Name = 'ARX_TEXT'
        DataType = ftMemo
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
        Name = 'B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'M_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'POLE_GRN'
        DataType = ftSmallint
      end
      item
        Name = 'DOK_TYPE'
        DataType = ftSmallint
      end
      item
        Name = 'DOK_SERIA'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'DOK_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DOK_DATE'
        DataType = ftDate
      end
      item
        Name = 'DOK_ORGAN'
        DataType = ftInteger
      end
      item
        Name = 'VOENKOM'
        DataType = ftInteger
      end
      item
        Name = 'TYPEMESSAGE'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'IDENTIF'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'SPEC_B'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'RN_B_GOROD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RN_M_B_GOROD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'POSHLINA'
        DataType = ftMemo
      end
      item
        Name = 'SUM_POSHLINA'
        DataType = ftFloat
      end>
    Left = 368
    Top = 114
    object DokumentNOMER: TIntegerField [0]
      FieldName = 'NOMER'
    end
    object DokumentDATEZ: TDateField [1]
      FieldName = 'DATEZ'
    end
    object DokumentFamilia: TStringField [2]
      FieldName = 'Familia'
      Size = 50
    end
    object DokumentName: TStringField [3]
      FieldName = 'Name'
      Size = 30
    end
    object DokumentOtch: TStringField [4]
      FieldName = 'Otch'
      Size = 30
    end
    object DokumentFamilia_B: TStringField [5]
      FieldName = 'Familia_B'
      Size = 50
    end
    object DokumentName_B: TStringField [6]
      FieldName = 'Name_B'
      Size = 30
    end
    object DokumentOtch_B: TStringField [7]
      FieldName = 'Otch_B'
      Size = 30
    end
    object DokumentPOL: TStringField [8]
      FieldName = 'POL'
      Size = 1
    end
    object DokumentDateR: TDateField [9]
      FieldName = 'DateR'
    end
    object DokumentGOSUD: TIntegerField [10]
      FieldName = 'GOSUD'
    end
    object DokumentOBL: TStringField [11]
      FieldName = 'OBL'
      Size = 30
    end
    object DokumentRAION: TStringField [12]
      FieldName = 'RAION'
      Size = 30
    end
    object DokumentGOROD: TStringField [13]
      FieldName = 'GOROD'
      Size = 30
    end
    object DokumentNATION: TIntegerField [14]
      FieldName = 'NATION'
    end
    object DokumentGRAG: TIntegerField [15]
      FieldName = 'GRAG'
    end
    object DokumentM_GOSUD: TIntegerField [16]
      FieldName = 'M_GOSUD'
    end
    object DokumentM_B_OBL: TBooleanField [17]
      FieldName = 'M_B_OBL'
    end
    object DokumentM_OBL: TStringField [18]
      FieldName = 'M_OBL'
      Size = 30
    end
    object DokumentM_RAION: TStringField [19]
      FieldName = 'M_RAION'
      Size = 30
    end
    object DokumentM_B_GOROD: TSmallintField [20]
      FieldName = 'M_B_GOROD'
    end
    object DokumentM_GOROD: TStringField [21]
      FieldName = 'M_GOROD'
      Size = 30
    end
    object DokumentM_RNGOROD: TStringField [22]
      FieldName = 'M_RNGOROD'
      Size = 50
    end
    object DokumentM_GOROD_R: TStringField [23]
      FieldName = 'M_GOROD_R'
      Size = 70
    end
    object DokumentM_DOM: TStringField [24]
      FieldName = 'M_DOM'
      Size = 10
    end
    object DokumentM_KORP: TStringField [25]
      FieldName = 'M_KORP'
      Size = 10
    end
    object DokumentM_KV: TStringField [26]
      FieldName = 'M_KV'
      Size = 10
    end
    object DokumentM_TEXTADRES: TStringField [27]
      FieldName = 'M_TEXTADRES'
      Size = 300
    end
    object DokumentM_ADRNUM: TStringField [28]
      FieldName = 'M_ADRNUM'
      Size = 12
    end
    object DokumentSEM_REG: TIntegerField [29]
      FieldName = 'SEM_REG'
    end
    object DokumentSEM_DOK: TStringField [30]
      FieldName = 'SEM_DOK'
      Size = 200
    end
    object DokumentV_OBAZAN: TBooleanField [31]
      FieldName = 'V_OBAZAN'
    end
    object DokumentV_WHO: TMemoField [32]
      DisplayLabel = #1043#1076#1077' '#1089#1086#1089#1090#1086#1080#1090' '#1085#1072' '#1091#1095#1077#1090#1077
      FieldName = 'V_WHO'
      BlobType = ftMemo
    end
    object DokumentDOKUMENT: TMemoField [33]
      FieldName = 'DOKUMENT'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentOTMETKA: TMemoField [34]
      FieldName = 'OTMETKA'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentRUKOV: TStringField [35]
      FieldName = 'RUKOV'
      Size = 60
    end
    object DokumentRUKOV_B: TStringField [36]
      FieldName = 'RUKOV_B'
      Size = 60
    end
    object DokumentSPEC: TStringField [37]
      FieldName = 'SPEC'
      Size = 60
    end
    object DokumentID_ZAGS: TIntegerField [38]
      FieldName = 'ID_ZAGS'
    end
    object DokumentID_SOURCE: TIntegerField [39]
      FieldName = 'ID_SOURCE'
    end
    object DokumentB_OBL: TBooleanField [40]
      FieldName = 'B_OBL'
    end
    object DokumentFirst_Ekz: TBooleanField [41]
      FieldName = 'First_Ekz'
    end
    object DokumentOBL_B: TStringField [46]
      FieldName = 'OBL_B'
      Size = 30
    end
    object DokumentRAION_B: TStringField [47]
      FieldName = 'RAION_B'
      Size = 30
    end
    object DokumentGOROD_B: TStringField [48]
      FieldName = 'GOROD_B'
      Size = 30
    end
    object DokumentB_GOROD: TSmallintField [56]
      FieldName = 'B_GOROD'
    end
    object DokumentSTATUS: TStringField [57]
      FieldName = 'STATUS'
      Size = 1
    end
    object DokumentPOLE_GRN: TSmallintField [58]
      FieldName = 'POLE_GRN'
    end
    object DokumentDOK_TYPE: TSmallintField [59]
      FieldName = 'DOK_TYPE'
    end
    object DokumentDOK_SERIA: TStringField [60]
      FieldName = 'DOK_SERIA'
      Size = 7
    end
    object DokumentDOK_NOMER: TStringField [61]
      FieldName = 'DOK_NOMER'
      Size = 10
    end
    object DokumentDOK_DATE: TDateField [62]
      FieldName = 'DOK_DATE'
    end
    object DokumentDOK_ORGAN: TIntegerField [63]
      FieldName = 'DOK_ORGAN'
    end
    object DokumentVOENKOM: TIntegerField [64]
      FieldName = 'VOENKOM'
    end
    object DokumentTYPEMESSAGE: TStringField [65]
      FieldName = 'TYPEMESSAGE'
      Size = 4
    end
    object DokumentIDENTIF: TStringField [66]
      FieldName = 'IDENTIF'
      Size = 14
    end
    object DokumentSPEC_B: TStringField [67]
      FieldName = 'SPEC_B'
      Size = 60
    end
    object DokumentREG_DATE: TDateField
      FieldName = 'REG_DATE'
    end
    object DokumentREG_DATE_TILL: TDateField
      FieldName = 'REG_DATE_TILL'
    end
    object DokumentDATES: TDateField
      FieldName = 'DATES'
    end
    object DokumentONLYACTIVE: TBooleanField
      FieldName = 'ONLYACTIVE'
    end
    object DokumentDO18: TBooleanField
      FieldName = 'DO18'
    end
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 272
    Top = 74
  end
  inherited HistZAGS: TkbmMemTable
    Left = 200
    Top = 202
  end
  inherited dsSeria: TDataSource
    Left = 648
    Top = 250
  end
  inherited dsObl: TDataSource
    Left = 416
    Top = 226
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 600
    Top = 170
  end
  inherited dsPovtor: TDataSource
    Left = 528
    Top = 242
  end
  inherited dsGorod: TDataSource
    Left = 576
    Top = 210
  end
  inherited dsRnGor: TDataSource
    Top = 242
  end
  inherited dsTypeGorod: TDataSource
    Left = 600
    Top = 170
  end
  inherited ImGISUN: TImageList
    Left = 532
  end
  inherited dsVoenkom: TDataSource
    Left = 752
    Top = 154
  end
  inherited dsRovd: TDataSource
    Left = 648
    Top = 138
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 320
    Top = 66
  end
  object dsGragd: TDataSource [26]
    Left = 540
    Top = 195
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 256
    Top = 202
  end
  inherited Zip: TZipForge
    Left = 720
    Top = 58
  end
  inherited tbFamily: TkbmMemTable
    FieldDefs = <
      item
        Name = 'PREFIX'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RELATION'
        DataType = ftInteger
      end
      item
        Name = 'IDENTIF'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FAMILIA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'OTCH'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'FAMILIA_B'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NAME_B'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'OTCH_B'
        DataType = ftString
        Size = 60
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
        Name = 'MESTOG'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'MESTOR'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ZAGS_NAME'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ZAGS_DATE'
        DataType = ftDate
      end
      item
        Name = 'ZAGS_NOMER'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DATES'
        DataType = ftDate
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'STATUS_NAME'
        DataType = ftString
        Size = 20
      end>
    inherited tbFamilyDATER: TDateField [9]
    end
    inherited tbFamilyMESTOG: TStringField [11]
    end
  end
  object dsReshSud: TDataSource
    DataSet = tbReshSud
    Left = 92
    Top = 230
  end
end
