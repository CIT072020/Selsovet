object fmServiceUpdate: TfmServiceUpdate
  Left = 376
  Top = 271
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1077#1088#1074#1080#1089#1085#1099#1077' '#1092#1091#1085#1082#1094#1080#1080
  ClientHeight = 144
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001000800680500001600000028000000100000002000
    0000010008000000000000010000000000000000000000000000000000000000
    0000734A39005A525200635242007B5A4A0063635A006B635A00636363006B6B
    6B00736B63007B7363007B736B006B7373007F7F7F00945A29008C5231008C5A
    3900A55A2900A5632100D6731800D6732100CE733100DE73310084635A00A563
    4200A57B5A00846B63008C7363009C846300A58C7300CE9C6300CE9C6B00DEA5
    6B00D6A57300F7BD7B00527B8400848484008C8C8C0094949400949C9C009C9C
    9C00A594A500A5A5A500ADADAD00B5B5B500BDBDBD00C6C6C600CECECE00D6D6
    D600DEDEDE00F7F7F700734A2900000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000B000000
    00008420940001ABBE777C20940001000000E401797600000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000002F0058EB
    E605000000009C2094000500D1001001000028027976002A757620000B00F0E6
    E6050100000050EBE605C020940023E0BD77A5DFBD7700000000000000000000
    0000442194003ABC76764421940094BC767600000000020000000C2394000100
    000018000000000000001C219400420000000000000008219400000000000000
    000000000000000000000C000000020000000101000080219400000000000000
    2F000816140500000000020000001200D801DE0A000058EBE60500000000A405
    00009011140501000000001614056421940023E0BD77A4050000982194000100
    00000016140578219400A8E6BD7700002F000000000008161405882194007FE6
    BD770816140502000000A0219400D8534D75982194000C239400000000000000
    0000E0229400CF034B0090F35002000000C000000000D4229400020000008000
    000000000000200000001000000010000000453A5C50726F6A656374735C5365
    6C736F766574375C424D505C546F6F6C732E69636F00E8CD1A050100000098CE
    1A051822940023E0BD7746E1BD77742294002110637698CE1A052C2294000200
    0000C0F9BC77A401BD77C02294000000000000002F00B07AE40896689376C022
    942E1DF9BC77B5D47576A4050000000000000000000000000000842294001C23
    94001600000000000000FBD475767109CACB160000000C23940010000000A8E6
    BD7700002F0000000000160000006C2294007FE6BD7734239400906578760D56
    26BDFEFFFFFFFBD47576CC124D75A40500001C23940016000000F02294000000
    0000E422940066044B00A40500001C23940016000000F0229400000000000000
    00000000000C0C000000000000000000000000000C1B12330000000000000000
    00000000061C1311000000000000000002020200061C130E0000000000000024
    2C2D2C2A091D130F000000000000002424242E2D091F13100202020207000000
    00002C2E091E14012C2B2B2C2902002807072E2D0A2014012424242424000028
    2A2C2A24052116040000000000000000282824000B2215170000000000000000
    000000000319181A000000000000000000000000022A08020000000000000000
    00252500022A2C0200000000000000002330072502262E2E0000020C00000000
    232C073208262B2C2E2D280C00000000072C28252A312F2D2B270C000000FE7F
    0000FC3F0000FC3F0000C43F0000803F000080010000F000000080010000803F
    0000C43F0000FC3F0000FC3F0000E43F0000C0330000C0030000C0070000}
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lb: TLabel
    Left = 277
    Top = 49
    Width = 26
    Height = 16
    Caption = #1082#1091#1076#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbPath: TLabel
    Left = 10
    Top = 16
    Width = 28
    Height = 16
    Caption = #1041#1072#1079#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object pb: TProgressBar
    Left = 9
    Top = 81
    Width = 190
    Height = 17
    TabOrder = 3
    Visible = False
  end
  object SB: TStatusBar
    Left = 0
    Top = 124
    Width = 535
    Height = 20
    Panels = <
      item
        Bevel = pbNone
        Width = 150
      end
      item
        Bevel = pbNone
        Width = 240
      end
      item
        Bevel = pbNone
        Width = 50
      end>
    Visible = False
  end
  object btRun: TButton
    Left = 433
    Top = 86
    Width = 89
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 5
    OnClick = btRunClick
  end
  object cbType: TComboBox
    Left = 10
    Top = 45
    Width = 241
    Height = 24
    Style = csDropDownList
    DropDownCount = 10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
    OnChange = cbTypeChange
    Items.Strings = (
      #1055#1086#1084#1077#1089#1090#1080#1090#1100' '#1073#1072#1079#1091' '#1074' '#1072#1088#1093#1080#1074
      #1048#1079#1074#1083#1077#1095#1100' '#1073#1072#1079#1091' '#1080#1079' '#1072#1088#1093#1080#1074#1072
      #1055#1077#1088#1077#1076#1072#1090#1100' '#1073#1072#1079#1091
      #1047#1072#1073#1088#1072#1090#1100' '#1073#1072#1079#1091
      #1057#1082#1072#1095#1072#1090#1100' '#1091#1089#1090#1072#1085#1086#1074#1082#1091' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      #1057#1082#1072#1095#1072#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      #1057#1082#1072#1095#1072#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074
      #1057#1082#1072#1095#1072#1090#1100' '#1079#1072#1087#1083#1072#1090#1082#1091' '#1082' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      #1055#1077#1088#1077#1076#1072#1090#1100' '#1092#1072#1081#1083
      #1057#1082#1072#1095#1072#1090#1100' '#1092#1072#1081#1083' ')
  end
  object cbServer: TComboBox
    Left = 331
    Top = 45
    Width = 195
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ItemIndex = 1
    ParentFont = False
    TabOrder = 2
    Text = #1062#1048#1058' '#1041#1077#1083#1089#1090#1072#1090#1072' ('#1053#1062#1069#1059')'
    Items.Strings = (
      #1062#1048#1058' '#1041#1077#1083#1089#1090#1072#1090#1072' (Internet)'
      #1062#1048#1058' '#1041#1077#1083#1089#1090#1072#1090#1072' ('#1053#1062#1069#1059')'
      #1062#1048#1058' '#1041#1077#1083#1089#1090#1072#1090#1072' ('#1053#1062#1069#1059' '#1076#1086#1087')')
  end
  object edPath: TDBEditEh
    Left = 57
    Top = 12
    Width = 468
    Height = 24
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edPathEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    Text = 'edPath'
    Visible = True
  end
  object edDir: TDBEditEh
    Left = 347
    Top = 53
    Width = 178
    Height = 24
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edDirEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    Text = 'C:\'
    Visible = True
  end
  object cbXML: TCheckBox
    Left = 10
    Top = 80
    Width = 129
    Height = 17
    Caption = 'XML '#1092#1072#1081#1083#1099' '#1087#1086#1095#1090#1099
    TabOrder = 7
    Visible = False
  end
  object btSetFiles: TButton
    Left = 178
    Top = 100
    Width = 60
    Height = 20
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083#1099' '#1076#1083#1103' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103
    Caption = #1060#1072#1081#1083#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    Visible = False
    OnClick = btSetFilesClick
  end
  object cbPart: TCheckBox
    Left = 10
    Top = 102
    Width = 167
    Height = 17
    Caption = #1063#1072#1089#1090#1080#1095#1085#1086#1077' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077
    TabOrder = 9
    OnClick = cbPartClick
  end
  object IdFTP1: TIdFTP
    MaxLineAction = maException
    ReadTimeout = 0
    OnWork = IdFTP1Work
    OnWorkBegin = IdFTP1WorkBegin
    OnWorkEnd = IdFTP1WorkEnd
    Host = 'vc.brest.by'
    Passive = True
    Password = 'IOlnelxy'
    Username = 'vc'
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 240
    Top = 80
  end
  object Zip: TZipForge
    ExtractCorruptedFiles = False
    CompressionLevel = clMax
    CompressionMode = 9
    CurrentVersion = '4.03 '
    SpanningMode = smSplitting
    SpanningOptions.AdvancedNaming = False
    SpanningOptions.VolumeSize = vsAutoDetect
    SpanningOptions.CustomVolumeSize = 65536
    Options.FlushBuffers = True
    Options.OEMFileNames = True
    InMemory = False
    OnFileProgress = ZipFileProgress
    Zip64Mode = zmDisabled
    UnicodeFilenames = False
    EncryptionMethod = caPkzipClassic
    Left = 280
    Top = 88
  end
  object tbCh: TAdsTable
    StoreActive = False
    AdsConnection = dmBaseConf.AdsConnection
    Exclusive = True
    TableName = #1057#1086#1079#1076#1072#1085#1080#1077#1054#1073#1098#1077#1082#1090#1072
    Left = 280
    Top = 88
  end
  object Query: TAdsQuery
    Left = 320
    Top = 88
    ParamData = <>
  end
  object odFile: TOpenDialog
    Title = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083' '#1076#1083#1103' '#1087#1077#1088#1077#1076#1072#1095#1080
    Left = 376
    Top = 88
  end
end
