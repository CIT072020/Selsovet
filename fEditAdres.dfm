object fmEditAdres: TfmEditAdres
  Left = 370
  Top = 214
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1072#1076#1088#1077#1089
  ClientHeight = 234
  ClientWidth = 545
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
    Top = 44
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
    Top = 72
    Width = 24
    Height = 16
    Caption = #1044#1086#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 100
    Width = 40
    Height = 16
    Caption = #1050#1086#1088#1087#1091#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 128
    Width = 55
    Height = 16
    Caption = #1050#1074#1072#1088#1090#1080#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbName: TLabel
    Left = 8
    Top = 158
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
  object lbRnGor: TLabel
    Left = 325
    Top = 16
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
  object btCancel: TBitBtn
    Left = 443
    Top = 196
    Width = 87
    Height = 25
    Hint = #1042#1099#1081#1090#1080'  ESC'
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 8
    Kind = bkCancel
  end
  object btOk: TBitBtn
    Left = 339
    Top = 196
    Width = 87
    Height = 25
    Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1072#1076#1088#1077#1089'  F2'
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 7
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
    Width = 164
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
    Top = 41
    Width = 239
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
    TabOrder = 2
    Visible = True
    OnChange = edPunktChange
  end
  object cbNotUL: TDBCheckBoxEh
    Left = 394
    Top = 43
    Width = 125
    Height = 17
    Caption = #1073#1077#1079' '#1091#1083#1080#1094#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    TabStop = False
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = cbNotULClick
  end
  object edDom: TDBEditEh
    Left = 149
    Top = 69
    Width = 71
    Height = 24
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
  object edKorp: TDBEditEh
    Left = 149
    Top = 97
    Width = 71
    Height = 24
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
  object edKv: TDBEditEh
    Left = 149
    Top = 125
    Width = 71
    Height = 24
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
  object cbNotDom: TDBCheckBoxEh
    Left = 233
    Top = 73
    Width = 153
    Height = 17
    Caption = #1073#1077#1079' '#1085#1086#1084#1077#1088#1072' '#1076#1086#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = cbNotDomClick
  end
  object edName: TDBEditEh
    Left = 149
    Top = 154
    Width = 215
    Height = 24
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
  object edRnGor: TDBComboBoxEh
    Left = 377
    Top = 12
    Width = 152
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'edRnGor'
    Visible = True
  end
  object dsPunkt: TDataSource
    DataSet = dmBase.LookUpPunkt
    Left = 248
    Top = 92
  end
  object dsUL: TDataSource
    DataSet = QueryUL
    Left = 296
    Top = 92
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
    Left = 344
    Top = 92
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
    IndexName = 'VIEW_KEY'
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
    Left = 384
    Top = 92
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
      Size = 7
    end
    object tbDomKORP: TAdsStringField
      FieldName = 'KORP'
      Size = 7
    end
    object tbDomKV: TAdsStringField
      FieldName = 'KV'
      Size = 7
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
  end
  object dsDom: TDataSource
    DataSet = tbDom
    Left = 440
    Top = 92
  end
end
