object fmIzvechNal: TfmIzvechNal
  Left = 438
  Top = 164
  BorderStyle = bsDialog
  Caption = #1048#1079#1074#1077#1097#1077#1085#1080#1077' '#1087#1086' '#1085#1072#1083#1086#1075#1091' '#1085#1072' '#1085#1077#1076#1074#1080#1078#1080#1084#1086#1089#1090#1100' '#1080' '#1079#1077#1084#1077#1083#1100#1085#1086#1084#1091' '#1085#1072#1083#1086#1075#1091
  ClientHeight = 372
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 180
    Width = 122
    Height = 13
    Caption = #1053#1072#1083#1086#1075' '#1085#1072' '#1085#1077#1076#1074#1080#1078#1080#1084#1086#1089#1090#1100
  end
  object Label2: TLabel
    Left = 24
    Top = 212
    Width = 88
    Height = 13
    Caption = #1047#1077#1084#1077#1083#1100#1085#1099#1081' '#1085#1072#1083#1086#1075
  end
  object lbNedoim: TLabel
    Left = 24
    Top = 244
    Width = 64
    Height = 13
    Caption = #1053#1077#1076#1086#1080#1084#1082#1072' '#1079#1072
  end
  object Label3: TLabel
    Left = 24
    Top = 276
    Width = 126
    Height = 13
    Caption = #1055#1077#1085#1103' '#1079#1072' '#1101#1090#1091' '#1085#1077#1076#1086#1080#1084#1082#1091' '#1085#1072
  end
  object Bevel1: TBevel
    Left = 18
    Top = 136
    Width = 511
    Height = 33
    Shape = bsFrame
  end
  object Label4: TLabel
    Left = 189
    Top = 140
    Width = 44
    Height = 26
    Alignment = taCenter
    Caption = #1042#1089#1077#1075#1086#13#10'('#1088#1091#1073#1083#1077#1081')'
  end
  object Label5: TLabel
    Left = 277
    Top = 140
    Width = 40
    Height = 26
    Alignment = taCenter
    Caption = #1076#1086' 15'#13#10#1072#1074#1075#1091#1089#1090#1072
  end
  object Label6: TLabel
    Left = 365
    Top = 140
    Width = 47
    Height = 26
    Alignment = taCenter
    Caption = #1076#1086' 15'#13#10#1089#1077#1085#1090#1103#1073#1088#1103
  end
  object Label7: TLabel
    Left = 462
    Top = 140
    Width = 36
    Height = 26
    Alignment = taCenter
    Caption = #1076#1086' 15'#13#10#1085#1086#1103#1073#1088#1103
  end
  object Label9: TLabel
    Left = 16
    Top = 61
    Width = 31
    Height = 13
    Caption = #1059#1083#1080#1094#1072
  end
  object Label10: TLabel
    Left = 280
    Top = 61
    Width = 20
    Height = 13
    Caption = #1044#1086#1084
  end
  object Label11: TLabel
    Left = 17
    Top = 88
    Width = 190
    Height = 16
    Caption = #1055#1051#1040#1058#1045#1046#1053#1054#1045' '#1048#1047#1042#1045#1065#1045#1053#1048#1045'  '#8470' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 400
    Top = 61
    Width = 17
    Height = 13
    Caption = #1050#1074'.'
  end
  object Label13: TLabel
    Left = 370
    Top = 113
    Width = 21
    Height = 13
    Caption = #1059#1053#1055
  end
  object DBDateTimeEditEh1: TDBDateTimeEditEh
    Left = 24
    Top = 291
    Width = 121
    Height = 24
    DataField = 'PENJA_DATE'
    DataSource = DataSource
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 16
    Visible = True
  end
  object DBNumberEditEh1: TDBNumberEditEh
    Left = 168
    Top = 176
    Width = 81
    Height = 24
    DataField = 'NEDVIG_ALL'
    DataSource = DataSource
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
  object DBNumberEditEh2: TDBNumberEditEh
    Left = 168
    Top = 208
    Width = 81
    Height = 24
    DataField = 'ZEMLJA_ALL'
    DataSource = DataSource
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
  object DBNumberEditEh3: TDBNumberEditEh
    Left = 168
    Top = 240
    Width = 81
    Height = 24
    DataField = 'NEDOIM_ALL'
    DataSource = DataSource
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
  object DBNumberEditEh4: TDBNumberEditEh
    Left = 259
    Top = 176
    Width = 81
    Height = 24
    DataField = 'NEDVIG_1'
    DataSource = DataSource
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
  object DBNumberEditEh5: TDBNumberEditEh
    Left = 259
    Top = 208
    Width = 81
    Height = 24
    DataField = 'ZEMLJA_1'
    DataSource = DataSource
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
  object DBNumberEditEh6: TDBNumberEditEh
    Left = 259
    Top = 240
    Width = 81
    Height = 24
    DataField = 'NEDOIM_1'
    DataSource = DataSource
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    Visible = True
  end
  object DBNumberEditEh7: TDBNumberEditEh
    Left = 349
    Top = 240
    Width = 81
    Height = 24
    DataField = 'NEDOIM_2'
    DataSource = DataSource
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    Visible = True
  end
  object DBNumberEditEh8: TDBNumberEditEh
    Left = 349
    Top = 208
    Width = 81
    Height = 24
    DataField = 'ZEMLJA_2'
    DataSource = DataSource
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
  object DBNumberEditEh9: TDBNumberEditEh
    Left = 349
    Top = 176
    Width = 81
    Height = 24
    DataField = 'NEDVIG_2'
    DataSource = DataSource
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
  object DBNumberEditEh10: TDBNumberEditEh
    Left = 440
    Top = 240
    Width = 81
    Height = 24
    DataField = 'NEDOIM_3'
    DataSource = DataSource
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    Visible = True
  end
  object DBNumberEditEh11: TDBNumberEditEh
    Left = 440
    Top = 208
    Width = 81
    Height = 24
    DataField = 'ZEMLJA_3'
    DataSource = DataSource
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
  object DBNumberEditEh12: TDBNumberEditEh
    Left = 440
    Top = 176
    Width = 81
    Height = 24
    DataField = 'NEDVIG_3'
    DataSource = DataSource
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
  object DBNumberEditEh13: TDBNumberEditEh
    Left = 168
    Top = 272
    Width = 81
    Height = 24
    DataField = 'PENJA_ALL'
    DataSource = DataSource
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
  object DBNumberEditEh14: TDBNumberEditEh
    Left = 259
    Top = 272
    Width = 81
    Height = 24
    DataField = 'PENJA_1'
    DataSource = DataSource
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    Visible = True
  end
  object DBNumberEditEh15: TDBNumberEditEh
    Left = 349
    Top = 272
    Width = 81
    Height = 24
    DataField = 'PENJA_2'
    DataSource = DataSource
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    Visible = True
  end
  object DBNumberEditEh16: TDBNumberEditEh
    Left = 440
    Top = 272
    Width = 81
    Height = 24
    DataField = 'PENJA_3'
    DataSource = DataSource
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    Visible = True
  end
  object DBDateTimeEditEh2: TDBDateTimeEditEh
    Left = 360
    Top = 336
    Width = 121
    Height = 24
    DataField = 'DOK_DATE'
    DataSource = DataSource
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 18
    Visible = True
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 536
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = #1052#1077#1085#1102
      CloseButton = False
      FullSize = True
      Images = fmMain.ImageList
      MenuBar = True
      ParentShowHint = False
      ProcessShortCuts = True
      ShowHint = True
      ShrinkMode = tbsmWrap
      TabOrder = 0
      object TBItem3: TTBItem
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088
        Hint = #1055#1077#1095#1072#1090#1100' '#1089' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1084' '#1087#1088#1086#1089#1084#1086#1090#1088#1086#1084
        ImageIndex = 31
        OnClick = TBItem3Click
      end
      object TBItem4: TTBItem
        Caption = #1055#1077#1095#1072#1090#1100
        Hint = #1055#1077#1095#1072#1090#1100
        ImageIndex = 24
        OnClick = TBItem4Click
      end
      object TBItem5: TTBItem
        Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1100
        Hint = #1056#1072#1079#1076#1077#1083#1080#1090#1100' '#1087#1083#1072#1090#1077#1078#1080' '#1085#1072' '#1095#1072#1089#1090#1080
        ImageIndex = 50
        OnClick = TBItem5Click
      end
      object TBItem1: TTBItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        ImageIndex = 36
        OnClick = TBItem1Click
      end
      object TBItem2: TTBItem
        Caption = #1042#1099#1093#1086#1076
        Hint = #1042#1099#1093#1086#1076' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
        ImageIndex = 37
        OnClick = TBItem2Click
      end
      object TBItem6: TTBItem
        Caption = #1056#1072#1079#1072#1088#1072#1073#1086#1090#1072#1090#1100
        Hint = #1056#1072#1079#1088#1072#1073#1086#1090#1072#1090#1100' '#1086#1090#1095#1077#1090
        ImageIndex = 12
        OnClick = TBItem6Click
      end
      object TBControlItem1: TTBControlItem
        Control = TBToolWindow1
      end
      object TBToolWindow1: TTBToolWindow
        Left = 138
        Top = 0
        Width = 166
        Height = 22
        Align = alRight
        Caption = 'TBToolWindow1'
        ClientAreaHeight = 22
        ClientAreaWidth = 166
        TabOrder = 0
        object Label8: TLabel
          Left = 43
          Top = 4
          Width = 19
          Height = 13
          Caption = #1043#1086#1076
        end
        object edGod: TDBEditEh
          Left = 67
          Top = 1
          Width = 50
          Height = 21
          DataField = 'GOD'
          DataSource = DataSource
          EditButtons = <>
          TabOrder = 0
          Visible = True
          OnChange = edGodChange
        end
      end
    end
  end
  object edPunkt: TDBEditEh
    Left = 16
    Top = 32
    Width = 233
    Height = 22
    DataField = 'ADRES_PUNKT'
    DataSource = DataSource
    EditButtons = <>
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Flat = True
    ParentFont = False
    TabOrder = 19
    Visible = True
  end
  object edUL: TDBEditEh
    Left = 55
    Top = 58
    Width = 194
    Height = 22
    DataField = 'ADRES_UL'
    DataSource = DataSource
    EditButtons = <>
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Flat = True
    ParentFont = False
    TabOrder = 20
    Visible = True
  end
  object edDom: TDBEditEh
    Left = 312
    Top = 58
    Width = 65
    Height = 22
    DataField = 'ADRES_DOM'
    DataSource = DataSource
    EditButtons = <>
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Flat = True
    ParentFont = False
    TabOrder = 21
    Visible = True
  end
  object edFIO: TDBEditEh
    Left = 17
    Top = 110
    Width = 329
    Height = 22
    DataField = 'FIO'
    DataSource = DataSource
    EditButtons = <>
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Flat = True
    ParentFont = False
    TabOrder = 23
    Visible = True
  end
  object edNomer: TDBEditEh
    Left = 223
    Top = 84
    Width = 97
    Height = 22
    DataField = 'NOMER'
    DataSource = DataSource
    EditButtons = <>
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Flat = True
    ParentFont = False
    TabOrder = 25
    Visible = True
  end
  object edKv: TDBEditEh
    Left = 425
    Top = 58
    Width = 41
    Height = 22
    DataField = 'ADRES_KV'
    DataSource = DataSource
    EditButtons = <>
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Flat = True
    ParentFont = False
    TabOrder = 22
    Visible = True
  end
  object edUNP: TDBEditEh
    Left = 402
    Top = 108
    Width = 119
    Height = 22
    DataField = 'UNP'
    DataSource = DataSource
    EditButtons = <>
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Flat = True
    ParentFont = False
    TabOrder = 24
    Visible = True
  end
  object tbDok: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'NEDVIG_ALL'
        DataType = ftFloat
      end
      item
        Name = 'NEDVIG_1'
        DataType = ftFloat
      end
      item
        Name = 'NEDVIG_2'
        DataType = ftFloat
      end
      item
        Name = 'NEDVIG_3'
        DataType = ftFloat
      end
      item
        Name = 'ZAMLJA_ALL'
        DataType = ftFloat
      end
      item
        Name = 'ZEMLJA_1'
        DataType = ftFloat
      end
      item
        Name = 'ZEMLJA_2'
        DataType = ftFloat
      end
      item
        Name = 'ZEMLJA_3'
        DataType = ftFloat
      end
      item
        Name = 'NEDOIM_ALL'
        DataType = ftFloat
      end
      item
        Name = 'NEDOIM_1'
        DataType = ftFloat
      end
      item
        Name = 'NEDOIM_2'
        DataType = ftFloat
      end
      item
        Name = 'NEDOIM_3'
        DataType = ftFloat
      end
      item
        Name = 'PENJA_ALL'
        DataType = ftFloat
      end
      item
        Name = 'PENJA_1'
        DataType = ftFloat
      end
      item
        Name = 'PENJA_2'
        DataType = ftFloat
      end
      item
        Name = 'PENJA_3'
        DataType = ftFloat
      end
      item
        Name = 'PANJA_DATE'
        DataType = ftDate
      end
      item
        Name = 'DOK_DATE'
        DataType = ftDate
      end
      item
        Name = 'GOD'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ADRES_PUNKT'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ADRES_UL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'FIO'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'ADRES_DOM'
        DataType = ftString
        Size = 30
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
    Left = 488
    Top = 32
    object tbDokNEDVIG_ALL: TFloatField
      FieldName = 'NEDVIG_ALL'
    end
    object tbDokNEDVIG_1: TFloatField
      FieldName = 'NEDVIG_1'
    end
    object tbDokNEDVIG_2: TFloatField
      FieldName = 'NEDVIG_2'
    end
    object tbDokNEDVIG_3: TFloatField
      FieldName = 'NEDVIG_3'
    end
    object tbDokZEMLJA_1: TFloatField
      FieldName = 'ZEMLJA_1'
    end
    object tbDokZEMLJA_2: TFloatField
      FieldName = 'ZEMLJA_2'
    end
    object tbDokZEMLJA_3: TFloatField
      FieldName = 'ZEMLJA_3'
    end
    object tbDokNEDOIM_ALL: TFloatField
      FieldName = 'NEDOIM_ALL'
    end
    object tbDokNEDOIM_1: TFloatField
      FieldName = 'NEDOIM_1'
    end
    object tbDokNEDOIM_2: TFloatField
      FieldName = 'NEDOIM_2'
    end
    object tbDokNEDOIM_3: TFloatField
      FieldName = 'NEDOIM_3'
    end
    object tbDokPENJA_ALL: TFloatField
      FieldName = 'PENJA_ALL'
    end
    object tbDokPENJA_1: TFloatField
      FieldName = 'PENJA_1'
    end
    object tbDokPENJA_2: TFloatField
      FieldName = 'PENJA_2'
    end
    object tbDokPENJA_3: TFloatField
      FieldName = 'PENJA_3'
    end
    object tbDokPENJA_DATE: TDateField
      FieldName = 'PENJA_DATE'
    end
    object tbDokDOK_DATE: TDateField
      FieldName = 'DOK_DATE'
    end
    object tbDokGOD: TStringField
      FieldName = 'GOD'
      Size = 4
    end
    object tbDokADRES_PUNKT: TStringField
      FieldName = 'ADRES_PUNKT'
      Size = 100
    end
    object tbDokADRES_UL: TStringField
      FieldName = 'ADRES_UL'
      Size = 50
    end
    object tbDokADRES_DOM: TStringField
      FieldName = 'ADRES_DOM'
      Size = 30
    end
    object tbDokFIO: TStringField
      FieldName = 'FIO'
      Size = 70
    end
    object tbDokNOMER: TStringField
      FieldName = 'NOMER'
      Size = 10
    end
    object tbDokZEMLJA_ALL: TFloatField
      FieldName = 'ZEMLJA_ALL'
    end
    object tbDokADRES_KV: TStringField
      FieldName = 'ADRES_KV'
      Size = 10
    end
    object tbDokUNP: TStringField
      FieldName = 'UNP'
      Size = 15
    end
  end
  object frDBDataSet: TfrDBDataSet
    DataSet = tbDok
    Left = 456
    Top = 32
  end
  object DataSource: TDataSource
    DataSet = tbDok
    Left = 424
    Top = 32
  end
end
