object fmLoadPinsk: TfmLoadPinsk
  Left = 321
  Top = 158
  Width = 1188
  Height = 623
  Caption = 'fmLoadPinsk'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 435
    Top = 12
    Width = 36
    Height = 13
    Caption = '999999'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 59
    Width = 1172
    Height = 526
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object tsDebug: TTabSheet
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      object edDebug: TMemo
        Left = 0
        Top = 0
        Width = 1164
        Height = 498
        Align = alClient
        Lines.Strings = (
          '')
        TabOrder = 0
      end
    end
    object tsBasa: TTabSheet
      Caption = #1041#1072#1079#1072
      ImageIndex = 1
      object Label6: TLabel
        Left = 824
        Top = 0
        Width = 148
        Height = 13
        Caption = #1051#1100#1075#1086#1090#1099' '#1082#1072#1088#1090#1086#1095#1082#1080' (SC54.DBF)'
      end
      object Label7: TLabel
        Left = 656
        Top = 329
        Width = 135
        Height = 13
        Caption = #1051#1100#1075#1086#1090#1099' '#1089#1077#1084#1100#1080' (SC229.DBF)'
      end
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 1164
        Height = 153
        Align = alTop
        DataSource = DataSource1
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnGetCellParams = DBGridEh2GetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'CODE'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'DESCR'
            Footers = <>
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'ISMARK'
            Footers = <>
            Width = 15
          end
          item
            EditButtons = <>
            FieldName = 'SP274'
            Footers = <>
            Width = 41
          end
          item
            EditButtons = <>
            FieldName = 'SP36'
            Footers = <>
            Width = 95
          end
          item
            EditButtons = <>
            FieldName = 'SP37'
            Footers = <>
            Width = 68
          end
          item
            EditButtons = <>
            FieldName = 'SP38'
            Footers = <>
            Width = 92
          end
          item
            EditButtons = <>
            FieldName = 'SP39'
            Footers = <>
            Width = 118
          end
          item
            EditButtons = <>
            FieldName = 'SP40'
            Footers = <>
            Width = 38
          end
          item
            EditButtons = <>
            FieldName = 'SP45'
            Footers = <>
            Width = 36
          end
          item
            EditButtons = <>
            FieldName = 'SP63'
            Footers = <>
            Width = 37
          end
          item
            EditButtons = <>
            FieldName = 'SP41'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP42'
            Footers = <>
            Width = 36
          end
          item
            EditButtons = <>
            FieldName = 'SP43'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP44'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP46'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP47'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP48'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP49'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP50'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP51'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP52'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP53'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP186'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP187'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP188'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP219'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP220'
            Footers = <>
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 153
        Width = 1164
        Height = 171
        Align = alTop
        TabOrder = 1
        object Splitter1: TSplitter
          Left = 679
          Top = 17
          Width = 6
          Height = 153
        end
        object DBGridEh2: TDBGridEh
          Left = 1
          Top = 17
          Width = 678
          Height = 153
          Align = alLeft
          DataSource = DataSource2
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnGetCellParams = DBGridEh2GetCellParams
          Columns = <
            item
              EditButtons = <>
              FieldName = 'PARENTEXT'
              Footers = <>
              Width = 44
            end
            item
              EditButtons = <>
              FieldName = 'ID'
              Footers = <>
              Width = 42
            end
            item
              EditButtons = <>
              FieldName = 'CODE'
              Footers = <>
              Width = 39
            end
            item
              EditButtons = <>
              FieldName = 'DESCR'
              Footers = <>
              Width = 19
            end
            item
              EditButtons = <>
              FieldName = 'ISMARK'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'SP72'
              Footers = <>
              Width = 84
            end
            item
              EditButtons = <>
              FieldName = 'SP73'
              Footers = <>
              Width = 69
            end
            item
              EditButtons = <>
              FieldName = 'SP74'
              Footers = <>
              Width = 74
            end
            item
              EditButtons = <>
              FieldName = 'SP275'
              Footers = <>
              Width = 39
            end
            item
              EditButtons = <>
              FieldName = 'SP87'
              Footers = <>
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'SP103'
              Footers = <>
              Width = 41
            end
            item
              EditButtons = <>
              FieldName = 'SP88'
              Footers = <>
              Width = 41
            end
            item
              EditButtons = <>
              FieldName = 'SP170'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'SP90'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'SP91'
              Footers = <>
              Width = 32
            end
            item
              EditButtons = <>
              FieldName = 'SP221'
              Footers = <>
              Width = 39
            end>
        end
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 1162
          Height = 16
          Align = alTop
          TabOrder = 1
          object Label3: TLabel
            Left = 225
            Top = 0
            Width = 90
            Height = 13
            Caption = #1057#1077#1084#1100#1103' (SC34.DBF)'
          end
          object Label4: TLabel
            Left = 824
            Top = 0
            Width = 148
            Height = 13
            Caption = #1051#1100#1075#1086#1090#1099' '#1082#1072#1088#1090#1086#1095#1082#1080' (SC54.DBF)'
          end
        end
        object DBGridEh3: TDBGridEh
          Left = 685
          Top = 17
          Width = 478
          Height = 153
          Align = alClient
          DataSource = DataSource3
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'PARENTEXT'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'ID'
              Footers = <>
              Width = 43
            end
            item
              EditButtons = <>
              FieldName = 'CODE'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'DESCR'
              Footers = <>
              Width = 39
            end
            item
              EditButtons = <>
              FieldName = 'ISMARK'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'SP69'
              Footers = <>
              Width = 45
            end
            item
              EditButtons = <>
              FieldName = 'SP65'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'SP66'
              Footers = <>
              Width = 34
            end
            item
              EditButtons = <>
              FieldName = 'SP67'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'SP68'
              Footers = <>
              Width = 39
            end>
        end
      end
      object DBGridEh4: TDBGridEh
        Left = 0
        Top = 328
        Width = 361
        Height = 164
        DataSource = DataSource4
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Button3: TButton
        Left = 368
        Top = 328
        Width = 75
        Height = 25
        Caption = 'set filter'
        TabOrder = 3
        OnClick = Button3Click
      end
      object DBGridEh5: TDBGridEh
        Left = 452
        Top = 345
        Width = 707
        Height = 151
        DataSource = DataSource5
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
            Width = 47
          end
          item
            EditButtons = <>
            FieldName = 'CODE'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'DESCR'
            Footers = <>
            Width = 45
          end
          item
            EditButtons = <>
            FieldName = 'PARENTEXT'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'ISMARK'
            Footers = <>
            Width = 17
          end
          item
            EditButtons = <>
            FieldName = 'VERSTAMP'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP223'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP224'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP225'
            Footers = <>
            Width = 45
          end
          item
            EditButtons = <>
            FieldName = 'SP226'
            Footers = <>
            Width = 61
          end
          item
            EditButtons = <>
            FieldName = 'SP227'
            Footers = <>
            Width = 46
          end
          item
            EditButtons = <>
            FieldName = 'SP223'
            Footers = <>
            Title.Caption = #1051#1100#1075#1086#1090#1072
            OnGetCellParams = DBGridEh5Columns11GetCellParams
          end>
      end
      object cbFilter: TDBCheckBoxEh
        Left = 808
        Top = 327
        Width = 67
        Height = 17
        Caption = #1051#1100#1075#1086#1090#1099
        TabOrder = 5
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = cbFilterClick
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1041#1072#1079#1072' '#1072#1088#1093#1080#1074
      ImageIndex = 2
      DesignSize = (
        1164
        498)
      object DBGridEh6: TDBGridEh
        Left = 0
        Top = 8
        Width = 1162
        Height = 245
        Anchors = [akLeft, akTop, akRight]
        DataSource = DataSource6
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'CODE'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'DESCR'
            Footers = <>
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'ISMARK'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'VERSTAMP'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP165'
            Footers = <>
            Width = 68
          end
          item
            EditButtons = <>
            FieldName = 'SP115'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP276'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP116'
            Footers = <>
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'SP117'
            Footers = <>
            Width = 77
          end
          item
            EditButtons = <>
            FieldName = 'SP118'
            Footers = <>
            Width = 183
          end
          item
            EditButtons = <>
            FieldName = 'SP119'
            Footers = <>
            Width = 178
          end
          item
            EditButtons = <>
            FieldName = 'SP120'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP121'
            Footers = <>
            Width = 42
          end
          item
            EditButtons = <>
            FieldName = 'SP122'
            Footers = <>
            Width = 42
          end
          item
            EditButtons = <>
            FieldName = 'SP123'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP124'
            Footers = <>
            Width = 38
          end
          item
            EditButtons = <>
            FieldName = 'SP125'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP126'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP127'
            Footers = <>
            Width = 42
          end
          item
            EditButtons = <>
            FieldName = 'SP128'
            Footers = <>
            Width = 38
          end
          item
            EditButtons = <>
            FieldName = 'SP129'
            Footers = <>
            Width = 42
          end
          item
            EditButtons = <>
            FieldName = 'SP130'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP131'
            Footers = <>
            Width = 45
          end
          item
            EditButtons = <>
            FieldName = 'SP132'
            Footers = <>
            Width = 43
          end
          item
            EditButtons = <>
            FieldName = 'SP133'
            Footers = <>
            Width = 43
          end
          item
            EditButtons = <>
            FieldName = 'SP134'
            Footers = <>
            Width = 42
          end>
      end
      object DBGridEh7: TDBGridEh
        Left = 8
        Top = 264
        Width = 945
        Height = 161
        DataSource = DataSource7
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
            Width = 48
          end
          item
            EditButtons = <>
            FieldName = 'CODE'
            Footers = <>
            Width = 52
          end
          item
            EditButtons = <>
            FieldName = 'DESCR'
            Footers = <>
            Width = 47
          end
          item
            EditButtons = <>
            FieldName = 'PARENTEXT'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'ISMARK'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'VERSTAMP'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SP144'
            Footers = <>
            Width = 77
          end
          item
            EditButtons = <>
            FieldName = 'SP145'
            Footers = <>
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'SP146'
            Footers = <>
            Width = 83
          end
          item
            EditButtons = <>
            FieldName = 'SP277'
            Footers = <>
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'SP147'
            Footers = <>
            Width = 62
          end
          item
            EditButtons = <>
            FieldName = 'SP148'
            Footers = <>
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'SP149'
            Footers = <>
            Width = 47
          end
          item
            EditButtons = <>
            FieldName = 'SP171'
            Footers = <>
            Width = 40
          end
          item
            EditButtons = <>
            FieldName = 'SP150'
            Footers = <>
            Width = 46
          end
          item
            EditButtons = <>
            FieldName = 'SP151'
            Footers = <>
            Width = 39
          end
          item
            EditButtons = <>
            FieldName = 'SP222'
            Footers = <>
            Width = 49
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1172
    Height = 59
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = 15
      Top = 42
      Width = 31
      Height = 13
      Caption = 'Label2'
    end
    object Label5: TLabel
      Left = 176
      Top = 40
      Width = 31
      Height = 13
      Caption = 'Label5'
    end
    object edConnect: TDBEditEh
      Left = 10
      Top = 8
      Width = 229
      Height = 24
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'E:\1'#1057'_'#1054#1095#1077#1088#1077#1076#1100
      Visible = True
    end
    object Button1: TButton
      Left = 256
      Top = 8
      Width = 75
      Height = 25
      Caption = 'connect'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 336
      Top = 8
      Width = 75
      Height = 25
      Caption = 'load'
      TabOrder = 2
      OnClick = Button2Click
    end
    object cbAll: TCheckBox
      Left = 457
      Top = 12
      Width = 135
      Height = 17
      Caption = #1047#1072#1075#1088#1091#1078#1072#1090#1100' '#1072#1088#1093#1080#1074#1085#1099#1077
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object cbDeleted: TCheckBox
      Left = 632
      Top = 12
      Width = 225
      Height = 17
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1077
      TabOrder = 4
      OnClick = cbDeletedClick
    end
    object edDate: TDBDateTimeEditEh
      Left = 812
      Top = 8
      Width = 121
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 5
      Visible = True
    end
    object cbOsn: TCheckBox
      Left = 457
      Top = 29
      Width = 135
      Height = 17
      Caption = #1047#1072#1075#1088#1091#1078#1072#1090#1100' '#1086#1089#1085#1086#1074#1085#1099#1077
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object Button4: TButton
      Left = 976
      Top = 8
      Width = 75
      Height = 25
      Caption = 'load '#1046#1057#1050
      TabOrder = 7
      OnClick = Button4Click
    end
  end
  object connectPinsk: TAdsConnection
    ConnectPath = 'E:\1'#1057'_'#1054#1095#1077#1088#1077#1076#1100
    AdsServerTypes = [stADS_LOCAL]
    LoginPrompt = False
    StoreConnected = False
    Compression = ccAdsCompressionNotSet
    CommunicationType = ctAdsDefault
    Left = 616
    Top = 40
  end
  object Kart: TAdsTable
    StoreActive = False
    AfterScroll = KartAfterScroll
    AdsConnection = connectPinsk
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SC32.DBF'
    TableType = ttAdsCDX
    Left = 96
    Top = 128
  end
  object KartSem: TAdsTable
    IndexFieldNames = 'PARENTEXT;CODE'
    MasterFields = 'ID'
    MasterSource = DataSource1
    StoreActive = False
    AdsConnection = connectPinsk
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SC34.DBF'
    TableType = ttAdsCDX
    Left = 104
    Top = 176
  end
  object DataSource1: TDataSource
    DataSet = Kart
    Left = 140
    Top = 126
  end
  object DataSource2: TDataSource
    DataSet = KartSem
    Left = 156
    Top = 182
  end
  object DataSource3: TDataSource
    DataSet = KartLgot
    Left = 380
    Top = 116
  end
  object KartLgot: TAdsTable
    IndexFieldNames = 'PARENTEXT;CODE'
    MasterFields = 'ID'
    MasterSource = DataSource1
    StoreActive = False
    AdsConnection = connectPinsk
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SC54.DBF'
    TableType = ttAdsCDX
    Left = 324
    Top = 116
  end
  object SprOsnov: TAdsTable
    IndexName = 'IDD'
    StoreActive = True
    AdsConnection = connectPinsk
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SC26.DBF'
    TableType = ttAdsCDX
    Left = 324
    Top = 411
  end
  object SprTypeHouse: TAdsTable
    IndexName = 'IDD'
    StoreActive = True
    AdsConnection = connectPinsk
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SC16.DBF'
    TableType = ttAdsCDX
    Left = 292
    Top = 451
  end
  object tbConst: TAdsTable
    IndexName = 'IDD'
    StoreActive = True
    AdsConnection = connectPinsk
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = '1SCONST.DBF'
    TableType = ttAdsCDX
    Left = 196
    Top = 411
  end
  object DataSource4: TDataSource
    DataSet = tbConst
    Left = 108
    Top = 475
  end
  object SemLgot: TAdsTable
    StoreActive = False
    AdsConnection = connectPinsk
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SC229.DBF'
    TableType = ttAdsCDX
    Left = 660
    Top = 451
  end
  object DataSource5: TDataSource
    DataSet = SemLgot
    Left = 604
    Top = 459
  end
  object SprLgot: TAdsTable
    IndexName = 'IDD'
    StoreActive = False
    AdsConnection = connectPinsk
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SC14.DBF'
    TableType = ttAdsCDX
    Left = 532
    Top = 483
  end
  object KartA: TAdsTable
    IndexFieldNames = 'SP116'
    StoreActive = False
    AdsConnection = connectPinsk
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SC114.DBF'
    TableType = ttAdsCDX
    Left = 580
    Top = 123
  end
  object KartASem: TAdsTable
    IndexFieldNames = 'PARENTEXT;CODE'
    MasterFields = 'ID'
    MasterSource = DataSource6
    StoreActive = False
    AdsConnection = connectPinsk
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SC143.DBF'
    TableType = ttAdsCDX
    Left = 628
    Top = 123
  end
  object DataSource6: TDataSource
    DataSet = KartA
    Left = 580
    Top = 155
  end
  object DataSource7: TDataSource
    DataSet = KartASem
    Left = 628
    Top = 155
  end
  object SprGSK: TAdsTable
    IndexName = 'IDD'
    StoreActive = True
    AdsConnection = connectPinsk
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SC29.DBF'
    TableType = ttAdsCDX
    Left = 380
    Top = 403
  end
end
