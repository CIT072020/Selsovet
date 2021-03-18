object Form1: TForm1
  Left = 434
  Top = 147
  Width = 1358
  Height = 638
  Caption = 'Form1'
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
  object PageControl1: TPageControl
    Left = 0
    Top = 88
    Width = 1342
    Height = 512
    ActivePage = tsEva
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #1054#1090#1083#1072#1076#1082#1072
      object edDebug: TMemo
        Left = 0
        Top = 0
        Width = 1334
        Height = 484
        Align = alClient
        Lines.Strings = (
          '')
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1040#1058#1045
      ImageIndex = 1
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 1334
        Height = 484
        Align = alClient
        DataSource = DataSource1
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
        OnGetCellParams = DBGridEh1GetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'KOD'
            Footers = <>
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'CATEGORY'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Width = 197
            OnGetCellParams = DBGridEh1Columns3GetCellParams
          end
          item
            EditButtons = <>
            FieldName = 'NAME_B'
            Footers = <>
            Width = 161
          end
          item
            EditButtons = <>
            FieldName = 'PARENTID'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'DATEIN'
            Footers = <>
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'DATEOUT'
            Footers = <>
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'ACTIVE'
            Footers = <>
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'OBL'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'RAION'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'CENTR'
            Footers = <>
          end>
      end
    end
    object tsEva: TTabSheet
      Caption = 'EVA'
      ImageIndex = 2
      object DBGridEh3: TDBGridEh
        Left = 0
        Top = 0
        Width = 1334
        Height = 443
        Align = alClient
        DataSource = DataSource3
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'SOATO'
            Footers = <>
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'ATE_ID'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'NAME_OBL'
            Footers = <>
            Width = 101
          end
          item
            EditButtons = <>
            FieldName = 'NAME_RN'
            Footers = <>
            Width = 96
          end
          item
            EditButtons = <>
            FieldName = 'NAME_SS'
            Footers = <>
            Width = 119
          end
          item
            EditButtons = <>
            FieldName = 'NAME_GAT'
            Footers = <>
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'NAME_NP'
            Footers = <>
            Width = 147
          end
          item
            EditButtons = <>
            FieldName = 'VID_ID'
            Footers = <>
            Width = 42
          end
          item
            EditButtons = <>
            FieldName = 'VID_NAME'
            Footers = <>
            Width = 131
          end
          item
            EditButtons = <>
            FieldName = 'EVA_ID'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Width = 239
          end
          item
            EditButtons = <>
            FieldName = 'NAME_B'
            Footers = <>
            Width = 92
          end
          item
            EditButtons = <>
            FieldName = 'DATE_REG'
            Footers = <>
            Width = 76
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 443
        Width = 1334
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object BitBtn5: TBitBtn
          Left = 29
          Top = 9
          Width = 124
          Height = 25
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' EVA'
          TabOrder = 0
          OnClick = BitBtn5Click
        end
        object edGrafE: TEdit
          Left = 179
          Top = 8
          Width = 140
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = 'A2:M91000'
        end
        object BitBtn6: TBitBtn
          Left = 369
          Top = 9
          Width = 137
          Height = 25
          Caption = #1055#1077#1088#1077#1075#1088#1091#1079#1080#1090#1100' '#1074' SysSpr'
          TabOrder = 2
          OnClick = BitBtn6Click
        end
      end
    end
    object tsAdres: TTabSheet
      Caption = #1040#1076#1088#1077#1089#1072
      ImageIndex = 3
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 1334
        Height = 443
        Align = alClient
        DataSource = DataSource2
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
            FieldName = 'ADR_NUM'
            Footers = <>
            Width = 97
          end
          item
            EditButtons = <>
            FieldName = 'OBJ_ID'
            Footers = <>
            Width = 95
          end
          item
            EditButtons = <>
            FieldName = 'OBJ_NAME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'ID_EVA'
            Footers = <>
            Width = 74
          end
          item
            EditButtons = <>
            FieldName = 'TYPE_EVA_K'
            Footers = <>
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'TYPE_EVA_N'
            Footers = <>
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'NAME_EVA'
            Footers = <>
            Width = 139
          end
          item
            EditButtons = <>
            FieldName = 'PROP_TYPE'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'NUM_HOUSE'
            Footers = <>
            Width = 77
          end
          item
            EditButtons = <>
            FieldName = 'NUM_CORP'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'IND_HOUSE'
            Footers = <>
            Width = 67
          end
          item
            EditButtons = <>
            FieldName = 'NUM_ROOM'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'IND_ROOM'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'INDEXES'
            Footers = <>
            Width = 58
          end
          item
            EditButtons = <>
            FieldName = 'REMARK'
            Footers = <>
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 443
        Width = 1334
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object BitBtn4: TBitBtn
          Left = 13
          Top = 9
          Width = 124
          Height = 25
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1072#1076#1088#1077#1089#1072
          TabOrder = 0
          OnClick = BitBtn4Click
        end
        object edGrafA: TEdit
          Left = 165
          Top = 7
          Width = 140
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = 'A2:Z3000'
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1342
    Height = 88
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 160
      Top = 16
      Width = 46
      Height = 19
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 348
      Top = 16
      Width = 46
      Height = 19
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 21
      Top = 48
      Width = 124
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' ATE'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object cbAll: TCheckBox
      Left = 630
      Top = 14
      Width = 157
      Height = 17
      Caption = #1047#1072#1082#1088#1091#1078#1072#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object edGraf: TEdit
      Left = 805
      Top = 10
      Width = 140
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'A2:K76000'
    end
    object cbIndex: TComboBox
      Left = 804
      Top = 42
      Width = 145
      Height = 27
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 19
      ParentFont = False
      TabOrder = 3
      OnChange = cbIndexChange
      Items.Strings = (
        #1057#1054#1040#1058#1054
        #1050#1054#1044
        #1044#1040#1058#1040' '#1053#1040#1063'.'
        'PARENT')
    end
    object BitBtn2: TBitBtn
      Left = 207
      Top = 48
      Width = 132
      Height = 25
      Caption = #1055#1088#1086#1089#1090#1072#1074#1080#1090#1100' PARENT'
      TabOrder = 4
      OnClick = BitBtn2Click
    end
    object cbOnlyActive: TCheckBox
      Left = 630
      Top = 55
      Width = 157
      Height = 17
      Caption = #1058#1086#1083#1100#1082#1086' '#1072#1082#1090#1080#1074#1085#1099#1077
      TabOrder = 5
      OnClick = cbOnlyActiveClick
    end
    object BitBtn3: TBitBtn
      Left = 377
      Top = 48
      Width = 137
      Height = 25
      Caption = #1055#1077#1088#1077#1075#1088#1091#1079#1080#1090#1100' '#1074' SysSpr'
      TabOrder = 6
      OnClick = BitBtn3Click
    end
    object cbAllCat: TCheckBox
      Left = 630
      Top = 30
      Width = 157
      Height = 17
      Caption = #1042#1089#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
      TabOrder = 7
      OnClick = cbOnlyActiveClick
    end
    object edExcel: TEdit
      Left = 1028
      Top = 11
      Width = 201
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      Text = 'Excel.Application'
    end
  end
  object AdsConnection1: TAdsConnection
    ConnectPath = 'Data'
    AdsServerTypes = [stADS_LOCAL]
    LoginPrompt = False
    StoreConnected = False
    Left = 8
    Top = 8
  end
  object ATE: TAdsTable
    StoreActive = False
    AdsConnection = AdsConnection1
    AdsTableOptions.AdsIndexPageSize = 512
    Exclusive = True
    TableName = 'ATE.dbf'
    TableType = ttAdsCDX
    Left = 48
    Top = 8
  end
  object Categ: TAdsTable
    StoreActive = False
    AdsConnection = AdsConnection1
    TableName = 'Categ.dbf'
    TableType = ttAdsCDX
    Left = 88
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ATE
    Left = 188
    Top = 256
  end
  object AdsConnection2: TAdsConnection
    ConnectPath = 'E:\Projects\Selsovet7\Spr\SysSpr.add'
    AdsServerTypes = [stADS_LOCAL]
    LoginPrompt = False
    Username = 'adssys'
    Password = 'sysdba'
    StoreConnected = False
    Left = 52
    Top = 265
  end
  object AteSys: TAdsTable
    DatabaseName = 'AdsConnection2'
    StoreActive = False
    AdsConnection = AdsConnection2
    TableName = 'ATE'
    Left = 100
    Top = 265
  end
  object Adresa: TAdsTable
    StoreActive = False
    AdsConnection = AdsConnection1
    AdsTableOptions.AdsIndexPageSize = 512
    Exclusive = True
    TableName = 'Adresa.dbf'
    TableType = ttAdsCDX
    Left = 120
    Top = 8
  end
  object DataSource2: TDataSource
    DataSet = Adresa
    Left = 260
    Top = 225
  end
  object EVA: TAdsTable
    StoreActive = False
    AdsConnection = AdsConnection1
    Exclusive = True
    TableName = 'EVA.dbf'
    TableType = ttAdsCDX
    Left = 152
    Top = 48
  end
  object DataSource3: TDataSource
    DataSet = EVA
    Left = 268
    Top = 284
  end
  object EvaSys: TAdsTable
    DatabaseName = 'AdsConnection2'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection2
    TableName = 'EVA'
    Left = 100
    Top = 297
  end
end
