object fmChZagrOch: TfmChZagrOch
  Left = 634
  Top = 227
  AutoScroll = False
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1089#1087#1080#1089#1082#1072' '#1086#1095#1077#1088#1077#1076#1085#1080#1082#1086#1074
  ClientHeight = 247
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    397
    247)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 144
    Height = 16
    Caption = #1044#1080#1089#1082' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1076#1072#1085#1085#1099#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btOk: TBitBtn
    Left = 184
    Top = 211
    Width = 92
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
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
    Left = 290
    Top = 211
    Width = 92
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 1
    Kind = bkCancel
  end
  object cbChoice: TDBCheckBoxEh
    Left = 8
    Top = 38
    Width = 161
    Height = 17
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1089#1072#1084#1086#1089#1090#1086#1103#1090#1077#1083#1100#1085#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = cbChoiceClick
  end
  object edDisk: TDBComboBoxEh
    Left = 176
    Top = 8
    Width = 51
    Height = 21
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
  object edPath: TDBEditEh
    Left = 8
    Top = 65
    Width = 380
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edPathEditButtons0Click
      end>
    Enabled = False
    TabOrder = 4
    Visible = True
  end
  object cbQuery: TDBCheckBoxEh
    Left = 8
    Top = 98
    Width = 305
    Height = 17
    Caption = #1047#1072#1087#1088#1086#1089' '#1085#1072' '#1079#1072#1075#1088#1091#1079#1082#1091' '#1082#1072#1078#1076#1086#1075#1086' '#1092#1072#1081#1083#1072
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 5
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object cbQueryDelete: TDBCheckBoxEh
    Left = 8
    Top = 118
    Width = 305
    Height = 17
    Caption = #1047#1072#1087#1088#1086#1089' '#1085#1072' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1086#1077' '#1091#1076#1072#1083#1077#1085#1080#1077
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 6
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object cbLoadIskl: TDBCheckBoxEh
    Left = 8
    Top = 139
    Width = 305
    Height = 17
    Caption = #1047#1072#1075#1088#1091#1078#1072#1090#1100' '#1080#1089#1082#1083#1102#1095#1077#1085#1085#1099#1093' '#1080#1079' '#1086#1095#1077#1088#1077#1076#1080
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 7
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object cbDateAndCount: TDBCheckBoxEh
    Left = 8
    Top = 161
    Width = 385
    Height = 17
    Caption = #1048#1075#1085#1086#1088#1080#1088#1086#1074#1072#1090#1100' '#1092#1072#1081#1083#1099' '#1087#1088#1080' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1080' '#1076#1072#1090#1099' '#1080' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 8
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object cbOnlyMy: TDBCheckBoxEh
    Left = 8
    Top = 183
    Width = 329
    Height = 17
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1089#1074#1086#1080#1093' '#1086#1095#1077#1088#1077#1076#1085#1080#1082#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    ValueChecked = 'True'
    ValueUnchecked = 'False'
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
    Left = 288
    Top = 8
  end
end
