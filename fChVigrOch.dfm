object fmChVigrOch: TfmChVigrOch
  Left = 718
  Top = 370
  BorderStyle = bsDialog
  Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1089#1087#1080#1089#1082#1072' '#1086#1095#1077#1088#1077#1076#1085#1080#1082#1086#1074
  ClientHeight = 106
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PrintScale = poNone
  ShowHint = True
  DesignSize = (
    329
    106)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 17
    Width = 133
    Height = 13
    Caption = #1044#1080#1089#1082' '#1076#1083#1103' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btOk: TBitBtn
    Left = 107
    Top = 67
    Width = 92
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100
    ModalResult = 1
    TabOrder = 0
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btCancel: TBitBtn
    Left = 219
    Top = 67
    Width = 92
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 1
    Kind = bkCancel
  end
  object edDisk: TDBComboBoxEh
    Left = 160
    Top = 13
    Width = 83
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
        Hint = #1042#1099#1075#1088#1091#1078#1072#1090#1100' '#1074' '#1087#1072#1087#1082#1091' "Export"'
        Style = ebsGlyphEh
        OnClick = edDiskEditButtons0Click
      end>
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Visible = True
  end
  object cbPath: TDBCheckBoxEh
    Left = 8
    Top = 41
    Width = 305
    Height = 17
    Caption = #1055#1086' '#1087#1091#1090#1080' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1086#1084#1091' '#1074' '#1087#1072#1088#1072#1084#1077#1090#1088#1072#1093
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = cbPathClick
  end
  object Zip: TZipForge
    ExtractCorruptedFiles = False
    CompressionLevel = clNormal
    CompressionMode = 6
    CurrentVersion = '4.03 '
    SpanningMode = smNone
    SpanningOptions.AdvancedNaming = True
    SpanningOptions.VolumeSize = vsAutoDetect
    Options.FlushBuffers = True
    Options.OEMFileNames = True
    InMemory = False
    Zip64Mode = zmDisabled
    UnicodeFilenames = True
    EncryptionMethod = caPkzipClassic
    Left = 8
    Top = 71
  end
  object tbOchered: TAdsTable
    DatabaseName = 'dmBase.AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = dmBase.AdsConnection
    TableName = 'Ochered'
    Left = 48
    Top = 72
  end
end
