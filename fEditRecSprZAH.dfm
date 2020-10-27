object fmEditRecSprZAH: TfmEditRecSprZAH
  Left = 421
  Top = 87
  ActiveControl = edName
  BorderStyle = bsDialog
  Caption = #1052#1077#1089#1090#1086' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1103
  ClientHeight = 664
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 586
    Height = 364
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    DesignSize = (
      586
      364)
    object lbOrgan: TLabel
      Left = 9
      Top = 14
      Width = 125
      Height = 16
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1102
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 9
      Top = 77
      Width = 49
      Height = 16
      Caption = #1054#1073#1083#1072#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 9
      Top = 109
      Width = 35
      Height = 16
      Caption = #1056#1072#1081#1086#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 9
      Top = 141
      Width = 92
      Height = 16
      Caption = #1057#1077#1083#1100#1089#1082#1080#1081' '#1089#1086#1074#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 9
      Top = 173
      Width = 61
      Height = 16
      Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 269
      Width = 86
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 9
      Top = 205
      Width = 67
      Height = 16
      Caption = #1043#1048#1057' '#1056#1053' '#1050#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 9
      Top = 237
      Width = 132
      Height = 16
      Caption = #1043#1048#1057' '#1056#1053' '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbBook: TLabel
      Left = 9
      Top = 301
      Width = 127
      Height = 16
      Caption = #1053#1086#1084#1077#1088' '#1090#1077#1082#1091#1097#1077#1081' '#1082#1085#1080#1075#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 9
      Top = 333
      Width = 92
      Height = 16
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbHandled: TDBCheckBoxEh
      Left = 376
      Top = 6
      Width = 121
      Height = 17
      Caption = #1042#1074#1077#1089#1090#1080' '#1074#1088#1091#1095#1085#1091#1102
      TabOrder = 0
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Visible = False
      OnClick = cbHandledClick
    end
    object edOrgan: TDBEditEh
      Left = 9
      Top = 32
      Width = 556
      Height = 21
      Color = clInfoBk
      EditButtons = <
        item
          Style = ebsEllipsisEh
          Width = 22
          OnClick = edOrganEditButtons0Click
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Visible = True
      OnChange = edOrganChange
    end
    object edAdd: TDBEditEh
      Left = 152
      Top = 328
      Width = 427
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      Visible = True
    end
    object edBook: TDBNumberEditEh
      Left = 152
      Top = 296
      Width = 114
      Height = 26
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 999999999.000000000000000000
      MinValue = 1.000000000000000000
      MRUList.Items.Strings = (
        '1'
        '2'
        '3')
      ParentFont = False
      TabOrder = 10
      Visible = True
    end
    object edNameGIS: TDBEditEh
      Left = 152
      Top = 232
      Width = 427
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
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
    object edGIS: TDBNumberEditEh
      Left = 152
      Top = 200
      Width = 145
      Height = 26
      EditButton.Style = ebsEllipsisEh
      EditButton.Width = 20
      EditButtons = <
        item
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
          Style = ebsEllipsisEh
          Width = 20
          OnClick = edGISEditButtons0Click
        end
        item
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FFFFED00FFF6
            D600FFC48C00DE9C4D00D5933400D7992F00D39D3200C4932700C6922700CF97
            2C00DC9A3100E39E3D00DD954800FFD09900FFE9CA00FFFFED00FFE9C500D09A
            6B00B4732F00D1883400E1943400E99D3900F1AA4900E29E3F00EAA54800F0A6
            4600E8973400E2903100C4762300BC753200C88D5F00FFF6D100FFD78E00C184
            3400D1822700FDA14200ED862900E67C2500F38A4100E57C3900DD733300EE85
            3C00F3863000FF9E4100FFB05100E1923700B7782800FFCF8300D08C3300BD71
            1700E2882900EC892D00D66D1C00E87F3C00FC966600F1906A00FB9A7400FF9E
            6E00F1894600E37D2B00F9993C00F19B3B00C27B2000D6973D00EA8D3E00E182
            3200E5823000D0712700EB955900FFDEB400FFF2DF00FFF6EE00FFFCF400FFF8
            E400FFE3B700EA9D5F00D9833700EB933F00E8964400E9984700F48D3E00E27E
            2C00DC792700C66E2200F3A96F00FFF7D000FFFCEC00FFFEF900FFFEF900FFFD
            EC00FFFED500F5B77B00DA8F4100E08D3800E7934100DF8B3900EB8A3000D879
            1C00F0923300E18B3100F6B06300FFFFC700FFFFDF00FFFCE100FFFFEA00FFFF
            E200FFFFC600E6AD5E00E5A04300EBA03E00E89B3E00E2983A00FA9B3A00D678
            1500F1942D00D17C1800D28B3400FFF1AA00FFF7C600D9C59C00D5C29C00FFFF
            CB00FFF6AF00CB933A00E3A03900EDA33900DE942E00DC942E00FE9A3400DC79
            1100ED8B1F00E1882000E79C4000C48C3F00BE9A6400FFE8BA00FFEBBE00CFB2
            7900C1934600E5A84A00E49C3100F0A13200E6982D00E69B2F00F68D2600ED87
            1D00FFA23600EF912D00CC7E2400D2974F00FFECBB00FFFBD300FFFFD700FFFF
            D200D6A55B00CD8C3000F2A33C00FFB44600F9A43700E8942A00FF902F00F384
            2200F68A2500F6933700DC883C00D6965C00FFFFDE00FFFFEB00FFFFEB00FFFF
            E200E2AA6F00EAA25400FFAA4C00FA9B3400F5953100ED8D2900F58F2F00F68F
            2E00F0852300F0892C00F99C4D00D6864B00FEBF9900FFF9DE00FFFFE600FFD2
            AB00E0945900F7A25200ED8F3000F2922E00FFA34000F69E3A00DB943200E597
            3200FFAA3E00F28C2200FF933400F3863800F8905500FFB98800FFBE8C00FF9A
            5F00FF994B00FFA34400FF9F3400FFBF5300ECA23C00D8963000F8C77900B178
            2300E2963600F79D3800FFA03D00FFA04500FF9C4D00FC964E00F48E4600FF98
            4900FFAE5300FFAD4A00FFAD4800F4A84800AE721E00EDBA6A00FFF6D400BA90
            6300BD864300DF9E4D00F3AE5100E7A24100E8AA4C00D59A3D00E3A84B00E8AA
            4C00EAA34200E1983C00CB863600BE824000BC8B5F00FFFFE000FFF7E900FFF1
            D700E4B78400C08D4400CB963C00B4821E00C99F3A00C49E3800BB952F00C298
            3300CB943100D79E4300C78C4600EEBB8900FFE2CA00FFF3E700}
          Style = ebsGlyphEh
          Visible = False
          Width = 20
          OnClick = edGISEditButtons1Click
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Visible = True
    end
    object edName: TDBEditEh
      Left = 151
      Top = 264
      Width = 427
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      Visible = True
    end
    object edB_GOROD: TDBLookupComboboxEh
      Left = 152
      Top = 168
      Width = 57
      Height = 26
      Alignment = taRightJustify
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsTypePunkt
      ParentFont = False
      TabOrder = 5
      Visible = True
    end
    object edGOROD: TDBEditEh
      Left = 224
      Top = 168
      Width = 210
      Height = 26
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Visible = True
    end
    object edSS: TDBEditEh
      Left = 152
      Top = 136
      Width = 284
      Height = 26
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
    object edRaion: TDBEditEh
      Left = 152
      Top = 104
      Width = 284
      Height = 26
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
    object edObl: TDBEditEh
      Left = 152
      Top = 72
      Width = 284
      Height = 26
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
    object rbObl: TRadioButton
      Left = 450
      Top = 77
      Width = 35
      Height = 17
      TabOrder = 12
    end
    object rbRn: TRadioButton
      Left = 450
      Top = 109
      Width = 35
      Height = 17
      TabOrder = 13
    end
    object rbSS: TRadioButton
      Left = 450
      Top = 141
      Width = 35
      Height = 17
      TabOrder = 14
    end
    object rbPunkt: TRadioButton
      Left = 450
      Top = 174
      Width = 35
      Height = 17
      TabOrder = 15
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 623
    Width = 586
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      586
      41)
    object btOk: TBitBtn
      Left = 365
      Top = 7
      Width = 89
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      TabOrder = 0
      OnClick = btOkClick
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
      Left = 477
      Top = 7
      Width = 89
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 428
    Width = 586
    Height = 195
    Align = alClient
    Caption = ' '#1057#1087#1080#1089#1086#1082' '#1082#1085#1080#1075' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      586
      195)
    object GridBooks: TDBGridEh
      Left = 6
      Top = 16
      Width = 540
      Height = 173
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DataSource
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          EditMask = '999999999;0;_'
          FieldName = 'BOOK'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1053#1086#1084#1077#1088
          Width = 81
        end
        item
          Alignment = taCenter
          EditButtons = <>
          EditMask = '!99/99/0000;1;_'
          FieldName = 'BOOK_DATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1074#1077#1076#1077#1085#1080#1103
          Width = 119
        end
        item
          Alignment = taCenter
          EditButtons = <>
          EditMask = '!99/99/0000;1;_'
          FieldName = 'BOOK_DATE_END'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1074#1077#1076#1077#1085#1080#1103
          Width = 138
        end
        item
          Alignment = taLeftJustify
          EditButtons = <>
          FieldName = 'ZH_TYPE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1058#1080#1087' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1103
          Width = 150
        end>
    end
    object btAdd: TBitBtn
      Left = 553
      Top = 20
      Width = 26
      Height = 26
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1082#1085#1080#1075#1091
      TabOrder = 1
      OnClick = btAddClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 364
    Width = 586
    Height = 64
    Align = alTop
    Caption = ' '#1054#1073#1103#1079#1072#1090#1077#1083#1100#1085#1099#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099' '#1084#1077#1089#1090#1072' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1103' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object cbSector: TCheckBox
      Left = 12
      Top = 18
      Width = 97
      Height = 17
      Caption = #1057#1077#1082#1090#1086#1088
      TabOrder = 0
    end
    object cbRad: TCheckBox
      Left = 115
      Top = 18
      Width = 71
      Height = 17
      Caption = #1056#1103#1076
      TabOrder = 1
    end
    object cbUch: TCheckBox
      Left = 200
      Top = 18
      Width = 133
      Height = 17
      Caption = #1059#1095#1072#1089#1090#1086#1082'('#1086#1075#1088#1072#1076#1072')'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object cbMog: TCheckBox
      Left = 353
      Top = 18
      Width = 85
      Height = 17
      Caption = #1052#1086#1075#1080#1083#1072
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object cbSecUch: TCheckBox
      Left = 12
      Top = 42
      Width = 397
      Height = 17
      Hint = #1042#1074#1086#1076' '#1089#1077#1082#1090#1086#1088#1072' '#1086#1089#1091#1097#1077#1089#1090#1074#1083#1103#1077#1090#1089#1103' '#1082#1072#1082': '#1089#1077#1082#1090#1086#1088'/'#1091#1095#1072#1089#1090#1086#1082' '#1089#1077#1082#1090#1086#1088#1072
      Caption = #1057#1077#1082#1090#1086#1088'='#1057#1077#1082#1090#1086#1088'/'#1091#1095#1072#1089#1090#1086#1082' '#1089#1077#1082#1090#1086#1088#1072
      TabOrder = 4
    end
  end
  object DataSource1: TDataSource
    DataSet = Query
    Left = 317
    Top = 101
  end
  object Query: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    StoreActive = False
    AdsConnection = dmBase.AdsConnection
    Left = 473
    Top = 226
    ParamData = <>
  end
  object QuerySeek: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    StoreActive = False
    AdsTableOptions.AdsIndexPageSize = 512
    SQL.Strings = (
      'SELECT ID '
      '   FROM SprNames '
      '   WHERE Substring(SOATO,1,2)='#39'90'#39
      '   ORDER BY ID DESC')
    AdsConnection = dmBase.AdsConnection
    Left = 434
    Top = 226
    ParamData = <>
  end
  object dsTypePunkt: TDataSource
    DataSet = dmBase.TypePunkt
    Left = 269
    Top = 144
  end
  object mtBooks: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexFieldNames = 'BOOK_DATE;BOOK'
    IndexDefs = <
      item
        Name = 'mtBooksIndex1'
        Fields = 'BOOK_DATE;BOOK'
      end
      item
        Name = 'mtBooksIndex2'
        Fields = 'BOOK'
        Options = [ixUnique]
      end>
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
    Left = 288
    Top = 296
    object mtBooksBOOK: TIntegerField
      FieldName = 'BOOK'
      MaxValue = 999999999
      MinValue = 1
    end
    object mtBooksBOOK_DATE: TDateField
      FieldName = 'BOOK_DATE'
    end
    object mtBooksBOOK_DATE_END: TDateField
      FieldName = 'BOOK_DATE_END'
    end
    object mtBooksZH_TYPE: TSmallintField
      FieldName = 'ZH_TYPE'
    end
  end
  object DataSource: TDataSource
    DataSet = mtBooks
    Left = 232
    Top = 288
  end
end
