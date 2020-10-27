object fmChoiceAdresS: TfmChoiceAdresS
  Left = 398
  Top = 251
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1072#1076#1088#1077#1089
  ClientHeight = 146
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 108
    Height = 16
    Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 45
    Width = 35
    Height = 16
    Caption = #1059#1083#1080#1094#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 74
    Width = 94
    Height = 16
    Caption = #1044#1086#1084' ('#1082#1086#1088#1087'., '#1082#1074'.)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btCancel: TBitBtn
    Left = 348
    Top = 108
    Width = 83
    Height = 25
    Hint = #1054#1090#1082#1072#1079'  ESC'
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 4
    Kind = bkCancel
  end
  object btOk: TBitBtn
    Left = 247
    Top = 108
    Width = 83
    Height = 25
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1076#1088#1077#1089'  F2'
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 3
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
  object edPunkt: TDBLookupComboboxEh
    Left = 149
    Top = 13
    Width = 177
    Height = 24
    DropDownBox.Rows = 20
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = dsPunkt
    ParentFont = False
    TabOrder = 0
    Visible = True
    OnChange = edPunktChange
  end
  object edUL: TDBLookupComboboxEh
    Left = 149
    Top = 42
    Width = 191
    Height = 24
    DropDownBox.Columns = <
      item
        FieldName = 'name_tip'
        Width = 30
      end
      item
        FieldName = 'NAME'
        Width = 120
      end>
    DropDownBox.ListSource = dsUL
    DropDownBox.Rows = 20
    EditButtons = <
      item
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1091#1083#1080#1094#1091
        Style = ebsPlusEh
        OnClick = edULEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'ID'
    ListField = 'name_tip;name'
    ListFieldIndex = 1
    ListSource = dsUL
    ParentFont = False
    TabOrder = 1
    Visible = True
    OnChange = edPunktChange
  end
  object cbNotUL: TDBCheckBoxEh
    Left = 347
    Top = 43
    Width = 94
    Height = 17
    Caption = #1073#1077#1079' '#1091#1083#1080#1094#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    TabStop = False
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = cbNotULClick
  end
  object edDom: TDBLookupComboboxEh
    Left = 149
    Top = 71
    Width = 177
    Height = 24
    DropDownBox.Rows = 20
    EditButtons = <
      item
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1072#1076#1088#1077#1089
        Style = ebsPlusEh
        OnClick = edDomEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'ID'
    ListField = 'NAME_ADRES'
    ListSource = dsDom
    ParentFont = False
    TabOrder = 2
    Visible = True
  end
  object dsPunkt: TDataSource
    DataSet = tbPunkt
    Left = 16
    Top = 96
  end
  object dsUL: TDataSource
    DataSet = QueryUL
    Left = 48
    Top = 96
  end
  object QueryUL: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    StoreActive = False
    RequestLive = True
    SQL.Strings = (
      'SELECT u.*,t.name name_tip '
      '  FROM '#1057#1087#1088#1059#1083#1080#1094' u'
      '  LEFT JOIN '#1057#1087#1088#1058#1080#1087#1059#1083#1080#1094' t ON u.tip=t.id'
      'ORDER BY u.name')
    AdsConnection = dmBase.AdsConnection
    Left = 80
    Top = 96
    ParamData = <>
  end
  object tbDom: TAdsTable
    DatabaseName = 'dmBase.AdsConnection'
    IndexDefs = <
      item
        Name = 'DF_PUNKT_KEY'
        Fields = 'DATE_FIKS;PUNKT'
      end
      item
        Name = 'PR_KEY'
        Fields = 'DATE_FIKS;ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'VIEW_KEY'
        Fields = 'DATE_FIKS;PUNKT;UL;DOM;KORP;KV'
      end
      item
        Name = 'HOUSE_KEY'
        Fields = 'DATE_FIKS;HOUSE_ID'
      end
      item
        Name = 'VIEWD_KEY'
        Fields = 'DATE_FIKS;PUNKT;UL;DOM1;DOM2;KORP;KV'
      end>
    IndexName = 'VIEWD_KEY'
    StoreActive = False
    AdsConnection = dmBase.AdsConnection
    AdsTableOptions.AdsIndexPageSize = 512
    FieldDefs = <
      item
        Name = 'DATE_FIKS'
        DataType = ftDate
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'PUNKT'
        DataType = ftInteger
      end
      item
        Name = 'UL'
        DataType = ftInteger
      end
      item
        Name = 'NOT_DOM'
        DataType = ftBoolean
      end
      item
        Name = 'DOM1'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DOM2'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DOM'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'KORP'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'KV'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'HOUSE_ID'
        DataType = ftInteger
      end
      item
        Name = 'TIP'
        DataType = ftInteger
      end
      item
        Name = 'PRIM'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'CANDELETE'
        DataType = ftBoolean
      end
      item
        Name = 'OSNOV'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'UCH_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VID'
        DataType = ftInteger
      end
      item
        Name = 'PREDST'
        DataType = ftInteger
      end
      item
        Name = 'ETAG'
        DataType = ftSmallint
      end
      item
        Name = 'KOL_ETAG'
        DataType = ftSmallint
      end
      item
        Name = 'GILFOND'
        DataType = ftSmallint
      end>
    StoreDefs = True
    TableName = #1041#1072#1079#1072#1044#1086#1084#1086#1074
    Left = 112
    Top = 96
    object tbDomDATE_FIKS: TDateField
      FieldName = 'DATE_FIKS'
    end
    object tbDomID: TIntegerField
      FieldName = 'ID'
    end
    object tbDomPUNKT: TIntegerField
      FieldName = 'PUNKT'
    end
    object tbDomUL: TIntegerField
      FieldName = 'UL'
    end
    object tbDomDOM: TAdsStringField
      FieldName = 'DOM'
      Size = 5
    end
    object tbDomKORP: TAdsStringField
      FieldName = 'KORP'
      Size = 5
    end
    object tbDomKV: TAdsStringField
      FieldName = 'KV'
      Size = 5
    end
    object tbDomTIP: TIntegerField
      FieldName = 'TIP'
    end
    object tbDomNAME_ADRES: TStringField
      FieldKind = fkCalculated
      FieldName = 'NAME_ADRES'
      OnGetText = tbDomNAME_ADRESGetText
      Size = 50
      Calculated = True
    end
    object tbDomNOT_DOM: TBooleanField
      FieldName = 'NOT_DOM'
    end
    object tbDomDOM1: TAdsStringField
      FieldName = 'DOM1'
      Size = 5
    end
    object tbDomDOM2: TAdsStringField
      FieldName = 'DOM2'
      Size = 5
    end
    object tbDomSPEC_UCH: TBooleanField
      FieldName = 'SPEC_UCH'
    end
  end
  object dsDom: TDataSource
    DataSet = tbDom
    Left = 144
    Top = 96
  end
  object tbPunkt: TAdsTable
    DatabaseName = 'dmBase.AdsConnection'
    IndexName = 'PR_KEY'
    StoreActive = False
    AdsConnection = dmBase.AdsConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = #1057#1087#1088#1053#1072#1089#1055#1091#1085#1082#1090#1086#1074
    Left = 184
    Top = 96
  end
end
