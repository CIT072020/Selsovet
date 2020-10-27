inherited fmVisibleMensGurnal: TfmVisibleMensGurnal
  Left = 613
  Top = 313
  BorderIcons = [biSystemMenu]
  Caption = #1053#1072#1089#1090#1088#1086#1080#1090#1100
  ClientHeight = 219
  ClientWidth = 426
  OldCreateOrder = True
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RxLabel1: TRxLabel [0]
    Left = 33
    Top = 106
    Width = 245
    Height = 16
    Caption = #1055#1088#1086#1078#1080#1074#1072#1102#1097#1080#1077' '#1085#1072' '#1076#1088#1091#1075#1086#1081' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080
    Color = clInfoBk
    FocusControl = cbGreenNotMy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShadowSize = 0
    OnClick = RxLabel1Click
  end
  object Image1: TImage [1]
    Left = 32
    Top = 106
    Width = 18
    Height = 18
    Picture.Data = {
      07544269746D617036040000424D360400000000000036000000280000001000
      0000100000000100200000000000000400000000000000000000000000000000
      0000FFFFF800E5FBE900FBFFFE00FFFFD800BFF2EA00FFFFF000FBC5FF00273F
      F500151FE100FBFFF400FFFFDD00FFFFE300F2F2F8000C00E8001109FF00B8CF
      CB00FEF9E000E4FFF700B4E0F700E6F7EC00D08E9A00902F31006048D6003048
      E0002C32FF000A10FF00603024009A7854002D06FF000620F600203CFF000100
      F800FFFEFC00A3C7EB00477CDD007A4A5C00B5403100F9AD15006D41FF004B45
      F6005C3AF2004A68FF004B1CFA003E1DFF002C36EE00494CE4003017E3002F1D
      FF00E4F7FF001F71C2003694FF009F583700E6A74D00FF9F2700C78733003638
      F4006A4DFF00613DD7003D5DFD004046E5005F4CFF003A4BFF001C29EF00BDC6
      F200D0F1FF002E82B60067A6E200B38A8F00F7A72400FFAE2400FF9F2E00AF9D
      60003F4AF2004D4FFF005742F500664AFB00535FD5000027E6002252E000F4F9
      FA00FFF8FF00CAC8C70082482400EFBC8400FFBE8B00C8B72000FFA94500F98A
      6A005643F0004D5BFB00484CE7001F3EF500304EFF00472EEE00AF9EC000F4F8
      F300FFFFFF00EBE6E700C4BFC000DD2A0500EDEEDA00FFE06D00C6AC84004A5D
      FA006A48F300706FF5005157FE006258FF005370DD003A38FC00432BEF00CFC4
      FF00FFFFFF00FFFEFF00F1ECED00CB9BB300A52B0000EAECD900515CFA008256
      F1006567E300605EFF004D5CF8006B60EC004037F2005C71FC004F53F800492F
      D900FFFFFF00FFFFFF00FFFFFF00F8FEFF00C0737A001E578B004F4AFF00965F
      FF004B79FF003338F3002D55A8005A5C8C005B45FC004751F200636CFF004037
      DB00FBFBFB00FAFAFA00FCFCFC00F7F8E800306CA70090C6DF00C7CCFF004754
      F6004D6AF40096B6FF0095D7E200606C9C00CFE0FF005953E6005D59E100B8C1
      FF00FFFFFF00FFFFFF00FFFFFF00DFFAFF001E638400D0E6EC0063A8E70060A1
      FF008B88C60077A8CE00A2E2F4004253BA00CBFCDC00ECF8FF00F9EEFF00FFFC
      FF00FDFFFF00FDFFFF00FDFFFF00DDF9FF000D2879006185D10074AFFE005495
      C80017436000102F7A000326660000256000E1FFFF00FFFFD400FFFFF400FFF9
      FE00FBFDFD00FAFFFE00F8FDFC00FFFFE7000A1B90000035A5001C4387000745
      7500002D6300182F9300122F6C0006313400E9F3FF00F2F2E000FFFBFF00FFFC
      FF00FDFFFF00FBFFFF00FBFFFF00D7EFE500B1A9CE00073F7600003D9A00004A
      8F00144E89000731920000354A00848FAF00F0F9EF00FFF6FF00F0EAFF00EAF1
      FF00FFFFFF00FFFFFF00FFFFFF00FFF8FF00F9F5FF00828EBE001D3878001B3C
      810016337000253969007581A900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFBEC00FFFFFB00F3FFFF00E5F9FF00E3FC
      FF00E4FEFF00E3F6FD00F1FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00}
    Visible = False
  end
  object cbGreenNotMy: TDBCheckBoxEh [2]
    Left = 10
    Top = 106
    Width = 15
    Height = 17
    BiDiMode = bdLeftToRight
    Caption = 
      '                                                                ' +
      '                                                                ' +
      '              '
    Color = clBtnFace
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  inherited Panel1: TPanel
    Top = 178
    Width = 426
    TabOrder = 3
    inherited btOk: TBitBtn
      Left = 198
      Top = 5
      Anchors = [akTop, akRight]
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
    end
    inherited btCancel: TBitBtn
      Left = 311
      Top = 4
      Anchors = [akTop, akRight]
    end
  end
  object cbCanDelete: TDBCheckBoxEh
    Left = 10
    Top = 31
    Width = 399
    Height = 17
    Caption = #1059#1084#1077#1088#1096#1080#1077' '#1080' '#1091#1073#1099#1074#1096#1080#1077' '#1087#1086#1089#1090#1086#1103#1085#1085#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object cbTmpUbit: TDBCheckBoxEh
    Left = 10
    Top = 56
    Width = 407
    Height = 17
    Caption = #1042#1088#1077#1084#1077#1085#1085#1086' '#1091#1073#1099#1074#1096#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object edType: TComboBox
    Left = 13
    Top = 4
    Width = 182
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1080#1079' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
    Items.Strings = (
      #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1080#1079' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
      #1055#1088#1086#1089#1084#1086#1090#1088' '#1090#1086#1083#1100#1082#1086)
  end
  object cbGreenMy: TDBCheckBoxEh
    Left = 10
    Top = 81
    Width = 407
    Height = 17
    Caption = ' '#1053#1077' '#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1085#1099#1077' ('#1079#1072#1088#1077#1075'. '#1087#1086' '#1084#1077#1089#1090#1091' '#1087#1088#1077#1073#1099#1074#1072#1085#1080#1103')'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 5
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object cbZaregSrok: TDBCheckBoxEh
    Left = 10
    Top = 131
    Width = 407
    Height = 17
    Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1087#1086' '#1084#1077#1089#1090#1091' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
    TabOrder = 6
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object cbOldCopyMen: TDBCheckBoxEh
    Left = 10
    Top = 156
    Width = 399
    Height = 17
    Caption = #1063#1077#1083#1086#1074#1077#1082' '#1089#1082#1086#1087#1080#1088#1086#1074#1072#1085' ('#1091#1073#1099#1083') '#1085#1072' '#1076#1088#1091#1075#1086#1081' '#1083#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object cbRiap_: TDBCheckBoxEh
    Left = 400
    Top = 147
    Width = 25
    Height = 17
    Caption = #1053#1077' '#1074#1099#1075#1088#1091#1078#1072#1077#1084#1099#1077' '#1085#1072' '#1087#1086#1088#1090#1072#1083' '#1056#1048#1040#1055
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 8
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    Visible = False
  end
end
