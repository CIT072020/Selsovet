inherited fmListSvid: TfmListSvid
  Left = 397
  Top = 206
  Caption = #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072
  ClientWidth = 870
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBDock1: TTBDock
    Width = 870
    inherited TBToolbar1: TTBToolbar
      BorderStyle = bsNone
      object TBItemOpenAkt: TTBItem [0]
        Caption = #1054#1090#1082#1088#1099#1090#1100
        Hint = #1054#1090#1082#1088#1099#1090#1100' '#1072#1082#1090#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
        ImageIndex = 33
        Visible = False
        OnClick = TBItemOpenAktClick
      end
      inherited TBItemDel: TTBItem [1]
      end
      object TBItemPrixodSvid: TTBItem [2]
        Caption = #1055#1088#1080#1093#1086#1076' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074
        Hint = #1055#1088#1080#1093#1086#1076' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074
        ImageIndex = 0
        Images = ImageList1
        OnClick = TBItemPrixodSvidClick
      end
      object TBItemToSS: TTBItem [3]
        Caption = #1042#1099#1076#1072#1090#1100' '#1074' '#1089'/'#1089
        Hint = #1042#1099#1076#1072#1090#1100' '#1074' '#1089#1077#1083#1100#1080#1089#1087#1086#1083#1082#1086#1084
        ImageIndex = 3
        Images = ImageList1
        OnClick = TBItemToSSClick
      end
      object TBItemDeleteSvid: TTBItem [4]
        Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074
        Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074
        ImageIndex = 1
        Images = ImageList1
        OnClick = TBItemDeleteSvidClick
      end
      object TBItemPerexod: TTBItem [5]
        Caption = #1055#1077#1088#1077#1093#1086#1076
        Hint = #1055#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1085#1086#1074#1099#1081' '#1075#1086#1076
        ImageIndex = 2
        Images = ImageList1
        OnClick = TBItemPerexodClick
      end
      object TBItemClearStr: TTBItem [6]
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1074#1099#1076#1072#1095#1077' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1081' '#1089#1090#1088#1086#1082#1080
        ImageIndex = 41
        OnClick = TBItemClearStrClick
      end
      object TBSubmenuNakl: TTBSubmenuItem [7]
        Caption = #1055#1088#1080#1093#1086#1076#1085#1086'-'#1088#1072#1089#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
        DropdownCombo = True
        Hint = #1042#1099#1087#1080#1089#1072#1090#1100' '#1087#1088#1080#1093#1086#1076#1085#1086'-'#1088#1072#1089#1093#1086#1076#1085#1091#1102' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
        ImageIndex = 55
        OnClick = TBSubmenuNaklClick
        object TBItemEditNakl: TTBItem
          Caption = #1054#1090#1082#1088#1099#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
          OnClick = TBItemEditNaklClick
        end
        object TBItemDelNakl: TTBItem
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1091#1102' '#1080' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1074#1099#1076#1072#1095#1077
          OnClick = TBItemDelNaklClick
        end
      end
      inherited TBItemPreview: TTBItem [8]
      end
      inherited TBItemPrint: TTBItem [9]
      end
    end
    inherited TBToolbarMove: TTBToolbar
      inherited DBNavigator: TDBNavigator
        Hints.Strings = ()
      end
    end
    inherited TBToolbar2: TTBToolbar
      Left = 470
      inherited cbOrderBy: TComboBox
        Width = 298
      end
    end
  end
  inherited Grid: TSasaDBGrid
    Top = 63
    Width = 870
    Height = 342
    Flat = True
    TitleFont.Height = -13
    OnDblClick = TBItemOpenAktClick
    Columns = <
      item
        Alignment = taLeftJustify
        DblClickNextVal = True
        EditButtons = <>
        FieldName = 'SVID_TYPE'
        Footers = <>
        Title.Caption = #1057#1074#1080#1076#1077#1083#1100#1089#1090#1074#1086'|'#1058#1080#1087
        Title.TitleButton = True
        ToolTips = True
        Width = 95
      end
      item
        DblClickNextVal = True
        EditButtons = <>
        FieldName = 'SVID_SERIA'
        Footers = <>
        Title.Caption = #1057#1074#1080#1076#1077#1083#1100#1089#1090#1074#1086'|'#1057#1077#1088#1080#1103
        Title.TitleButton = True
        ToolTips = True
        Width = 56
      end
      item
        Alignment = taCenter
        EditButtons = <>
        EditMask = '9999999;0;_'
        FieldName = 'SVID_NOMER'
        Footers = <>
        Title.Caption = #1057#1074#1080#1076#1077#1083#1100#1089#1090#1074#1086'|'#1053#1086#1084#1077#1088
        Title.TitleButton = True
        ToolTips = True
        Width = 58
        OnUpdateData = GridColumns2UpdateData
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'DATEP'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1087#1088#1080#1093#1086#1076#1072
        Title.TitleButton = True
        ToolTips = True
        Width = 87
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'DATER'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1088#1072#1089#1093#1086#1076#1072
        Title.TitleButton = True
        ToolTips = True
        Width = 87
      end
      item
        Alignment = taLeftJustify
        DblClickNextVal = True
        EditButtons = <>
        FieldName = 'SOST'
        Footers = <>
        Title.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
        Title.TitleButton = True
        ToolTips = True
        Width = 130
      end
      item
        EditButtons = <>
        FieldName = 'AKT_ID'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1040#1082#1090#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
        Title.TitleButton = True
        ToolTips = True
        Visible = False
        Width = 117
      end
      item
        EditButtons = <>
        FieldName = 'AKT_NOMER'
        Footers = <>
        Title.Caption = #1040#1082#1090#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100'|'#1053#1086#1084#1077#1088
        Title.TitleButton = True
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'AKT_DATE'
        Footers = <>
        Title.Caption = #1040#1082#1090#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100'|'#1044#1072#1090#1072
        Title.TitleButton = True
        Width = 101
      end
      item
        Alignment = taLeftJustify
        EditButtons = <>
        FieldName = 'ID_ZAGS'
        Footers = <>
        Title.Caption = #1054#1088#1075#1072#1085' '#1047#1040#1043#1057' '#1074' '#1082#1086#1090#1086#1088#1099#1081' '#1087#1077#1088#1077#1076#1072#1085#1086' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086
        Title.TitleButton = True
        ToolTips = True
        Width = 203
      end
      item
        EditButtons = <>
        FieldName = 'ID_NAKL'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103
        Title.TitleButton = True
        Width = 80
        OnGetCellParams = GridColumnsGetCellParams_NAKL
      end>
  end
  object pnFilter: TPanel [2]
    Left = 0
    Top = 26
    Width = 870
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lbType: TLabel
      Left = 11
      Top = 10
      Width = 117
      Height = 16
      Caption = #1058#1080#1087' '#1072#1082#1090#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edType: TDBComboBoxEh
      Left = 144
      Top = 6
      Width = 250
      Height = 24
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
          Style = ebsGlyphEh
          Visible = False
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnChange = edTypeChange
    end
  end
  inherited DataSource: TDataSource
    Left = 160
    Top = 120
  end
  inherited Table: TAdsTable
    IndexName = 'VIEW_KEY'
    BeforePost = TableBeforePost
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'ListSvid'
    Left = 208
    Top = 120
    object TableSVID_TYPE: TSmallintField
      FieldName = 'SVID_TYPE'
    end
    object TableSVID_SERIA: TAdsStringField
      FieldName = 'SVID_SERIA'
      Size = 6
    end
    object TableSVID_NOMER: TAdsStringField
      FieldName = 'SVID_NOMER'
      Size = 7
    end
    object TableDATEP: TDateField
      FieldName = 'DATEP'
    end
    object TableDATER: TDateField
      FieldName = 'DATER'
    end
    object TableSOST: TSmallintField
      FieldName = 'SOST'
    end
    object TableAKT_NOMER: TSmallintField
      FieldName = 'AKT_NOMER'
    end
    object TableAKT_ID: TIntegerField
      FieldName = 'AKT_ID'
    end
    object TableID_ZAGS: TIntegerField
      FieldName = 'ID_ZAGS'
    end
    object TableAKT_DATE: TDateField
      FieldName = 'AKT_DATE'
    end
    object TableID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
    end
    object TableLOOKUP_ID_ZAGS: TStringField
      FieldKind = fkLookup
      FieldName = 'LOOKUP_ID_ZAGS'
      LookupDataSet = dmBase.SprNames
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAGS'
      Size = 100
      Lookup = True
    end
    object TableLOOKUP_NAKL: TStringField
      FieldKind = fkLookup
      FieldName = 'LOOKUP_NAKL'
      LookupDataSet = dmBase.tbDokuments
      LookupKeyFields = 'ID_AUTO'
      LookupResultField = 'NOMER'
      KeyFields = 'ID_NAKL'
      Lookup = True
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 96
    Top = 208
  end
  object ImageList1: TImageList
    Left = 336
    Top = 160
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000040204000402
      0400040204000000000000000000000000008482840004020400040204000000
      0000000000000000000000000000000000000402FC0000000000000000000000
      00000402FC000000000000000000000000000402040004020400848284000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008482840004020400848284000000000004020400040204000402
      04000402040004020400040204000402040000000000000000000402040004FE
      04000402040000000000000000000000000004FEFC0004020400848284000402
      0400000000000000000000000000000000000402FC000402FC00000000000000
      00000402FC0000000000000000000402040004FEFC0004020400848284000402
      0400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084828400040204008482840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000402040004FEFC0004020400848284000402040000000000040204000000
      00000000000000000000040204000000000004020400040204000402040004FE
      04000402040004020400040204000000000004FEFC0004020400848284008482
      840004020400000000000000000000000000000000000402FC000402FC000000
      00000402FC00000000008482840004FEFC0004FEFC0004020400848284008482
      8400040204000000000000000000000000000000000000000000000000000000
      0000000000000402040004FEFC00040204008482840004020400000000000000
      0000000000000000000000000000000000000000000000000000000000000402
      040004FEFC0004FEFC0004020400848284008482840000000000040204000000
      0000000000000000000004020400000000000402040004FE040004FE040004FE
      040004FE040004FE040004020400000000008482840004FEFC00040204008482
      84008482840004020400000000000000000000000000000000000402FC000402
      FC000402FC00000000000000000004FEFC000402040004FEFC00040204008482
      8400848284000402040000000000000000000000000000000000000000000000
      00000402040004FEFC0004FEFC00040204008482840084828400040204000000
      0000000000000000000000000000000000000000000000000000040204008482
      840004FEFC000402040004FEFC00040204008482840000000000040204000000
      00000000000000000000040204000000000004020400040204000402040004FE
      04000402040004020400040204000000000004FEFC0004FEFC0004FEFC000402
      0400848284008482840004020400000000000000000000000000000000000402
      FC000402FC000402FC00000000000000000004FEFC0004FEFC0004FEFC000402
      0400848284008482840004020400000000000000000000000000000000000402
      04008482840004FEFC000402040004FEFC000402040084828400848284000402
      040000000000000000000000000000000000000000000402040004FEFC008482
      84000402040004FEFC0004FEFC0004FEFC000402040000000000040204000402
      04000402040004020400040204000000000000000000000000000402040004FE
      040004020400000000000000000004FEFC0004FEFC0004FEFC0004FEFC0004FE
      FC000402040084828400848284000402040000000000000000000402FC000402
      FC00000000000402FC000402FC000402FC000000000004FEFC0004FEFC0004FE
      FC000402040084828400848284000402040000000000000000000402040004FE
      FC00848284000402040004FEFC0004FEFC0004FEFC0004020400848284008482
      8400040204000000000000000000000000000402040004FEFC0004FEFC000402
      040004FEFC0004FEFC0004FEFC0004FEFC0004FEFC0000000000040204000000
      0000000000000000000004020400000000000000000000000000040204000402
      0400040204000000000004FEFC008482840004FEFC0004FEFC0004FEFC008482
      840004FEFC0004020400848284000402040000000000000000000402FC000402
      FC0000000000000000000402FC000402FC000000000004FEFC0004FEFC008482
      840004FEFC00040204008482840004020400000000000402040004FEFC0004FE
      FC000402040004FEFC0004FEFC0004FEFC0004FEFC0004FEFC00040204008482
      8400848284000402040000000000000000000402040004FEFC000402040004FE
      FC008482840004FEFC0004FEFC0004FEFC008482840000000000040204000402
      0400040204000402040004020400000000000000000000000000000000000000
      00000000000004FEFC0004FEFC0004FEFC008482840004FEFC008482840004FE
      FC0004FEFC0004FEFC0004020400040204000000000000000000000000000000
      00008482840004FEFC0000000000000000008482840004FEFC008482840004FE
      FC0004FEFC0004FEFC000402040004020400000000000402040004FEFC000402
      040004FEFC008482840004FEFC0004FEFC0004FEFC008482840004FEFC000402
      040084828400040204000000000000000000040204000402040004FEFC0004FE
      FC0004FEFC008482840004FEFC008482840004FEFC0000000000040204000000
      0000000000000000000004020400000000000000000000000000000000000402
      040004FEFC0004FEFC0004FEFC0004FEFC0004FEFC008482840004FEFC0004FE
      FC0004FEFC0004FEFC0004FEFC00040204000000000000000000000000000402
      040004FEFC0004FEFC0004FEFC0004FEFC0004FEFC008482840004FEFC0004FE
      FC0004FEFC0004FEFC0004FEFC000402040000000000040204000402040004FE
      FC0004FEFC0004FEFC008482840004FEFC008482840004FEFC0004FEFC0004FE
      FC00040204000402040000000000000000000402040004FEFC0004FEFC0004FE
      FC0004FEFC0004FEFC008482840004FEFC0004FEFC0004FEFC00040204000402
      0400040204000402040004020400000000000000000000000000000000000000
      00000402040004FEFC0004FEFC0004FEFC008482840004FEFC008482840004FE
      FC0004FEFC0004FEFC0004020400000000000000000000000000000000000000
      00000402040004FEFC0004FEFC0004FEFC008482840004FEFC008482840004FE
      FC0004FEFC0004FEFC000402040000000000000000000402040004FEFC0004FE
      FC0004FEFC0004FEFC0004FEFC008482840004FEFC0004FEFC0004FEFC0004FE
      FC0004FEFC00040204000000000000000000000000000402040004FEFC0004FE
      FC0004FEFC008482840004FEFC008482840004FEFC0004FEFC0004FEFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000402040004FEFC008482840004FEFC0004FEFC0004FEFC008482
      840004FEFC000402040000000000000000000000000000000000000000000000
      0000000000000402040004FEFC008482840004FEFC0004FEFC0004FEFC008482
      840004FEFC0004020400000000000000000000000000000000000402040004FE
      FC0004FEFC0004FEFC008482840004FEFC008482840004FEFC0004FEFC0004FE
      FC000402040000000000000000000000000000000000000000000402040004FE
      FC008482840004FEFC0004FEFC0004FEFC008482840004FEFC00040204000000
      0000000000000482040000000000000000000000000000000000000000000000
      000000000000000000000402040004FEFC0004FEFC0004FEFC0004FEFC0004FE
      FC00040204000000000000000000000000000000000000000000000000000000
      000000000000000000000402040004FEFC0004FEFC0004FEFC0004FEFC0004FE
      FC00040204000000000000000000000000000000000000000000000000000402
      040004FEFC008482840004FEFC0004FEFC0004FEFC008482840004FEFC000402
      0400000000000000000000000000000000000000000000000000000000000402
      040004FEFC0004FEFC0004FEFC0004FEFC0004FEFC0004020400000000000000
      0000048204000482040004820400000000000000000000000000000000000000
      00000000000000000000000000000402040004FEFC0004FEFC0004FEFC000402
      0400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000402040004FEFC0004FEFC0004FEFC000402
      0400000000000000000000000000000000000000000000000000000000000000
      00000402040004FEFC0004FEFC0004FEFC0004FEFC0004FEFC00040204000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000402040004FEFC0004FEFC0004FEFC000402040000000000000000000482
      0400048204000482040004820400048204000000000000000000000000000000
      0000000000000000000000000000000000000402040004FEFC00040204000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000402040004FEFC00040204000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000402040004FEFC0004FEFC0004FEFC0004020400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000402040004FEFC00040204000000000000000000000000000000
      0000000000000482040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000004020400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000004020400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000402040004FEFC000402040000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000004020400000000000000000000000000048204000482
      040004820400000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFC71F771FFFFFF880
      C70F360FFC7FF05D01079407F83FE05D0103C603F01FC05D0101E301E00F8041
      C600C880C007005DC400CC8080030041F800F3008003005DE000E00080030001
      F001F0018003801FF803F803C007C01BFC07FC07E00FE031FE0FFE0FF01FF060
      FF1FFF1FF83FF8FBFFBFFFBFFC7FFDC700000000000000000000000000000000
      000000000000}
  end
end