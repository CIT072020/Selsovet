object fmPredZapis: TfmPredZapis
  Left = 619
  Top = 260
  Width = 1049
  Height = 604
  Caption = 'fmPredZapis'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000000040000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000CAB9
    A7FF825C30FF704513FF704513FF825C30FFCAB9A7FF00000000000000000000
    0000000000000000000000000000000000000000000000000000A68B6BFF7045
    13FF9D7F5DFFB8A289FFB8A289FF9D7F5DFF704513FFA68B6BFF000000000000
    00000000000000000000000000000000000000000000D3C5B5FF704513FFCAB9
    A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAB9A7FF704513FFD3C5B5FF0000
    000000000000000000000000000000000000000000008B683FFF8B683FFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B683FFF8B683FFF0000
    00000000000000000000000000000000000000000000704513FFB8A289FFFFFF
    FFFFFFFFFFFF704513FF704513FF704513FFFFFFFFFFB8A289FF704513FF0000
    00000000000000000000000000000000000000000000704513FFB8A289FFFFFF
    FFFFFFFFFFFF704513FFFFFFFFFFFFFFFFFFFFFFFFFFB8A289FF704513FF0000
    000000000000000000000000000000000000040204FF8B683FFF825C30FFFFFF
    FFFFFFFFFFFF704513FFFFFFFFFFFFFFFFFFFFFFFFFF825C30FF8B683FFF0000
    0000000000000000000000000000040204FF040284FFDCD1C4FF704513FFB8A2
    89FFFFFFFFFFB8A289FFFFFFFFFFFFFFFFFFB8A289FF704513FFDCD1C4FF0000
    00000000000000000000040204FF040284FF040284FF040284FFB8A289FF7045
    13FF8B683FFF94734EFF94734EFF8B683FFF704513FFB8A289FF000000000000
    0000040204FF040284FF040284FF040284FF040284FF040284FF040284FFD3C5
    B5FF94734EFF94734EFF94734EFF94734EFFD3C5B5FF00000000000000000402
    04FF0402FCFF0402FCFF0402FCFF0402FCFF040284FF040284FF040284FF0402
    84FF040284FF040204FF00000000000000000000000000000000000000000402
    84FF0402FCFF0402FCFF0402FCFF0402FCFF0402FCFF040284FF040284FF0402
    84FF040284FF040284FF040204FF000000000000000000000000000000000402
    84FFFCFEFCFF0402FCFF0402FCFF0402FCFF0402FCFF0402FCFF0402FCFF0402
    84FF040284FF040284FF040204FF000000000000000000000000000000000402
    84FFFCFEFCFF0402FCFF0402FCFF0402FCFF040284FF0402FCFF0402FCFF0402
    84FF040284FF040284FF040204FF000000000000000000000000000000000402
    04FF0402FCFFFCFEFCFF0402FCFF040284FF040204FF0402FCFF0402FCFF0402
    84FF040284FF040204FF00000000000000000000000000000000000000000000
    0000040204FF040284FF040284FF040204FF00000000040204FF0402FCFF0402
    84FF040204FF000000000000000000000000000000000000000000000000FF03
    0000FE010000FC000000FC000000FC000000FC000000F8000000F0000000E001
    000080030000001F0000000F0000000F0000000F0000001F0000843F0000}
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poDefault
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 1033
    Height = 34
    AllowDrag = False
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      FullSize = True
      Images = TBImageList1
      ProcessShortCuts = True
      TabOrder = 0
      object TBItemPreView: TTBItem
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088
        Hint = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088
        ImageIndex = 13
        ShortCut = 116
        Visible = False
        OnClick = TBItemPreViewClick
      end
      object TBSubmenuItemPreView: TTBSubmenuItem
        Caption = #1054#1090#1095#1077#1090
        Hint = #1054#1090#1095#1077#1090
        ImageIndex = 13
        Images = TBImageList1
        object TBItemW1: TTBItem
          Caption = #1058#1072#1083#1086#1085' '#1087#1088#1080#1075#1083#1072#1096#1077#1085#1080#1077
          Hint = #1058#1072#1083#1086#1085' '#1087#1088#1080#1075#1083#1072#1096#1077#1085#1080#1077
          OnClick = TBItemW1Click
        end
        object TBSeparatorItem2: TTBSeparatorItem
        end
      end
      object TBItemEdit: TTBItem
        Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100
        Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
        ImageIndex = 7
        OnClick = TBItemEditClick
      end
      object TBItemZ: TTBItem
        Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077
        Hint = #1047#1072#1103#1074#1083#1077#1085#1080#1077
        ImageIndex = 4
        ShortCut = 32
        OnClick = TBItemZClick
      end
      object TBItemClear: TTBItem
        Caption = #1054#1089#1074#1086#1073#1086#1076#1080#1090#1100
        Hint = #1054#1089#1074#1086#1073#1086#1076#1080#1090#1100' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
        ImageIndex = 3
        ShortCut = 46
        OnClick = TBItemClearClick
      end
      object TBItemPerevod: TTBItem
        Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080
        Hint = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1080#1079' '#1076#1088#1091#1075#1086#1075#1086#1081' '#1079#1072#1087#1080#1089#1080
        ImageIndex = 22
        OnClick = TBItemPerevodClick
      end
      object TBItemFullDelete: TTBItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
        ImageIndex = 2
        OnClick = TBItemFullDeleteClick
      end
      object TBItemSeek: TTBItem
        Caption = #1053#1072#1081#1090#1080
        Hint = #1053#1072#1081#1090#1080
        ImageIndex = 48
        OnClick = TBItemSeekClick
      end
      object TBItemRefresh2: TTBItem
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        Hint = #1054#1073#1085#1086#1074#1080#1090#1100
        ImageIndex = 24
        OnClick = TBItemRefresh2Click
      end
      object TBSubmenuItemRefresh: TTBSubmenuItem
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        DropdownCombo = True
        Hint = #1054#1073#1085#1086#1074#1080#1090#1100
        ImageIndex = 24
        Visible = False
        OnClick = TBSubmenuItemRefreshClick
        object TBItemAutoRefresh: TTBItem
          AutoCheck = True
          Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077
          Checked = True
          Visible = False
          OnClick = TBItemAutoRefreshClick
        end
      end
      object TBSubmenuMonth: TTBSubmenuItem
        Caption = #1052#1077#1089#1103#1094
        ImageIndex = 11
        Visible = False
      end
      object TBItemMesto: TTBItem
        Caption = #1052#1077#1089#1090#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
        Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1084#1077#1089#1090#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
        ImageIndex = 0
        Images = TBImageList1
        Visible = False
        OnClick = TBItemMestoClick
      end
      object TBSubmenuRun: TTBSubmenuItem
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
        ImageIndex = 19
        object TBItemRenumber: TTBItem
          Caption = #1055#1077#1088#1077#1085#1091#1084#1077#1088#1086#1074#1072#1090#1100' '#1078#1091#1088#1085#1072#1083
          Hint = #1055#1077#1088#1077#1085#1091#1084#1077#1088#1086#1074#1072#1090#1100' '#1078#1091#1088#1085#1072#1083
          OnClick = TBItemRenumberClick
        end
        object TBItemZCh: TTBItem
          Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
          Hint = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
          OnClick = TBItemZChClick
        end
        object TBSeparatorItem1: TTBSeparatorItem
        end
        object TBItemWorkTime: TTBItem
          Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1085#1077#1088#1072#1073#1086#1095#1077#1077' '#1074#1088#1077#1084#1103
          Hint = #1054#1090#1084#1077#1090#1080#1090#1100' '#1085#1077#1088#1072#1073#1086#1095#1077#1077' '#1074#1088#1077#1084#1103
          OnClick = TBItemWorkTimeClick
        end
        object TBSeparatorItem3: TTBSeparatorItem
        end
        object TBItemDeleteMonth: TTBItem
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1084#1077#1089#1103#1094
          OnClick = TBItemDeleteMonth_Click
        end
      end
      object TBItemCreateMonth: TTBItem
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1084#1077#1089#1103#1094
        Hint = #1057#1086#1079#1076#1072#1090#1100' '#1084#1077#1089#1103#1094
        ImageIndex = 20
        OnClick = TBItemCreateMonthClick
      end
      object TBItemDeleteMonth_: TTBItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1084#1077#1089#1103#1094
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1091#1102' '#1079#1072#1087#1080#1089#1100' '#1079#1072' '#1084#1077#1089#1103#1094
        ImageIndex = 21
        Visible = False
        OnClick = TBItemDeleteMonth_Click
      end
      object TBItemParams: TTBItem
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
        ImageIndex = 18
        OnClick = TBItemParamsClick
      end
      object TBItemViewGurnal: TTBItem
        Caption = #1046#1091#1088#1085#1072#1083
        Hint = #1046#1091#1088#1085#1072#1083
        ImageIndex = 57
        OnClick = TBItemViewGurnalClick
      end
      object TBItemExit: TTBItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        Hint = #1047#1072#1082#1088#1099#1090#1100
        ImageIndex = 15
        OnClick = TBItemExitClick
      end
      object TBItemDesignReport: TTBItem
        Caption = #1054#1090#1095#1077#1090
        Hint = #1054#1090#1095#1077#1090
        ImageIndex = 39
        OnClick = TBItemDesignReportClick
      end
    end
  end
  object pnCaption: TPanel
    Left = 0
    Top = 34
    Width = 1033
    Height = 33
    Align = alTop
    TabOrder = 1
    object lbMesto: TLabel
      Left = 386
      Top = 8
      Width = 113
      Height = 16
      Caption = #1052#1077#1089#1090#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 15
      Top = 8
      Width = 37
      Height = 16
      Caption = #1052#1077#1089#1103#1094
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 240
      Top = 8
      Width = 21
      Height = 16
      Caption = #1043#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbDay: TLabel
      Left = 808
      Top = 8
      Width = 30
      Height = 16
      Caption = #1044#1077#1085#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object cbMesto: TComboBox
      Left = 512
      Top = 4
      Width = 258
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      OnClick = cbMestoClick
    end
    object cbMonth: TComboBox
      Left = 62
      Top = 4
      Width = 145
      Height = 24
      Hint = 'PgUp-'#1087#1088#1077#1076#1099#1076#1091#1097#1080#1081'   PgDn-'#1089#1083#1077#1076#1091#1102#1097#1080#1081
      Style = csDropDownList
      DropDownCount = 12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 1
      OnChange = cbMonthChange
    end
    object cbGod: TComboBox
      Left = 272
      Top = 4
      Width = 80
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 2
      OnChange = cbGodChange
    end
    object cbDay: TComboBox
      Left = 849
      Top = 4
      Width = 62
      Height = 24
      Style = csDropDownList
      DropDownCount = 15
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 3
      Visible = False
      OnChange = cbGodChange
    end
  end
  object pnGrafic: TPanel
    Left = 0
    Top = 67
    Width = 1033
    Height = 499
    Align = alClient
    TabOrder = 2
    object Grid: TDBGridEh
      Left = 1
      Top = 1
      Width = 1031
      Height = 403
      Align = alClient
      AllowedOperations = []
      AllowedSelections = [gstColumns]
      AutoFitColWidths = True
      Ctl3D = True
      DataSource = dsTable
      DrawMemoText = True
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      FrozenCols = 1
      HorzScrollBar.Visible = False
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghFrozen3D, dghHighlightFocus, dghClearSelection, dghDialogFind]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      UseMultiTitle = True
      VertScrollBar.Tracking = True
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnColEnter = GridColEnter
      OnDblClick = GridDblClick
      OnGetCellParams = GridGetCellParams
      OnKeyDown = GridKeyDown
      OnTitleBtnClick = GridTitleBtnClick
      Columns = <
        item
          Color = clBtnFace
          EditButtons = <>
          FieldName = 'TIME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Footers = <>
          Title.Caption = #1042#1088#1077#1084#1103
          Width = 59
        end
        item
          EditButtons = <>
          FieldName = 'DAY1'
          Footers = <>
          Title.Caption = '1'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY2'
          Footers = <>
          Title.Caption = '2'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY3'
          Footers = <>
          Title.Caption = '3'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY4'
          Footers = <>
          Title.Caption = '4'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY5'
          Footers = <>
          Title.Caption = '5'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY6'
          Footers = <>
          Title.Caption = '6'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY7'
          Footers = <>
          Title.Caption = '7'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY8'
          Footers = <>
          Title.Caption = '8'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY9'
          Footers = <>
          Title.Caption = '9'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY10'
          Footers = <>
          Title.Caption = '10'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY11'
          Footers = <>
          Title.Caption = '11'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY12'
          Footers = <>
          Title.Caption = '12'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY13'
          Footers = <>
          Title.Caption = '13'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY14'
          Footers = <>
          Title.Caption = '14'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY15'
          Footers = <>
          Title.Caption = '15'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY16'
          Footers = <>
          Title.Caption = '16'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY17'
          Footers = <>
          Title.Caption = '17'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY18'
          Footers = <>
          Title.Caption = '18'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY19'
          Footers = <>
          Title.Caption = '19'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY20'
          Footers = <>
          Title.Caption = '20'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY21'
          Footers = <>
          Title.Caption = '21'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY22'
          Footers = <>
          Title.Caption = '22'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY23'
          Footers = <>
          Title.Caption = '23'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY24'
          Footers = <>
          Title.Caption = '24'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY25'
          Footers = <>
          Title.Caption = '25'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY26'
          Footers = <>
          Title.Caption = '26'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY27'
          Footers = <>
          Title.Caption = '27'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY28'
          Footers = <>
          Title.Caption = '28'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY29'
          Footers = <>
          Title.Caption = '29'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY30'
          Footers = <>
          Title.Caption = '30'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'DAY31'
          Footers = <>
          Title.Caption = '31'
          Title.TitleButton = True
          Width = 30
          OnGetCellParams = GridColumns1GetCellParams
        end>
    end
    object pnView: TPanel
      Left = 1
      Top = 404
      Width = 1031
      Height = 94
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 145
        Top = 14
        Width = 69
        Height = 13
        Caption = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072
      end
      object Label2: TLabel
        Left = 290
        Top = 14
        Width = 72
        Height = 13
        Caption = #1076#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
      end
      object Label3: TLabel
        Left = 426
        Top = 14
        Width = 30
        Height = 13
        Caption = #1084#1080#1085#1091#1090
      end
      object Label5: TLabel
        Left = 748
        Top = 41
        Width = 110
        Height = 13
        Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
      end
      object Label4: TLabel
        Left = 487
        Top = 14
        Width = 60
        Height = 13
        Caption = #1057#1087#1077#1094#1080#1072#1083#1080#1089#1090
      end
      object Label6: TLabel
        Left = 8
        Top = 69
        Width = 73
        Height = 13
        Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077'  '#8470
      end
      object Label7: TLabel
        Left = 167
        Top = 69
        Width = 12
        Height = 13
        Caption = #1086#1090
      end
      object lbON: TLabel
        Left = 8
        Top = 41
        Width = 34
        Height = 13
        Caption = #1046#1077#1085#1080#1093
      end
      object lbONA: TLabel
        Left = 371
        Top = 41
        Width = 42
        Height = 13
        Caption = #1053#1077#1074#1077#1089#1090#1072
      end
      object Label13: TLabel
        Left = 8
        Top = 14
        Width = 31
        Height = 13
        Caption = #1053#1086#1084#1077#1088
      end
      object Label14: TLabel
        Left = 784
        Top = 14
        Width = 26
        Height = 13
        Caption = #1044#1072#1090#1072
      end
      object lbDateDecl: TLabel
        Left = 352
        Top = 69
        Width = 168
        Height = 13
        Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077'  '#1076#1086#1083#1078#1085#1086' '#1073#1099#1090#1100' '#1087#1086#1076#1072#1085#1086
      end
      object edBegin: TDBDateTimeEditEh
        Left = 222
        Top = 8
        Width = 54
        Height = 24
        Color = clInfoBk
        DataField = 'BEGINR'
        DataSource = dsView
        EditButton.Visible = False
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Visible = True
        EditFormat = 'HH:MM'
      end
      object edDateSost: TDBDateTimeEditEh
        Left = 830
        Top = 8
        Width = 169
        Height = 24
        Color = clInfoBk
        DataField = 'DATER'
        DataSource = dsView
        EditButton.Visible = False
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Visible = True
        EditFormat = 'DD/MM/YYYY HH:NN'
      end
      object edSpec: TDBEditEh
        Left = 559
        Top = 8
        Width = 140
        Height = 24
        Color = clInfoBk
        DataField = 'SPEC'
        DataSource = dsView
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Visible = True
      end
      object edTelefon: TDBEditEh
        Left = 867
        Top = 35
        Width = 144
        Height = 24
        Color = clInfoBk
        DataField = 'TELEFON'
        DataSource = dsView
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        Visible = True
      end
      object edLong: TDBEditEh
        Left = 371
        Top = 8
        Width = 48
        Height = 24
        Color = clInfoBk
        DataField = 'LONGR'
        DataSource = dsView
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
      object edDateZ: TDBDateTimeEditEh
        Left = 193
        Top = 63
        Width = 102
        Height = 24
        Color = 13290239
        DataField = 'DATE_Z'
        DataSource = dsView
        EditButton.Visible = False
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        Visible = True
        EditFormat = 'DD/MM/YYYY'
      end
      object edNomerZ: TDBEditEh
        Left = 92
        Top = 63
        Width = 59
        Height = 24
        Color = 13290239
        DataField = 'NOMER_Z'
        DataSource = dsView
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
      object edON: TDBEditEh
        Left = 54
        Top = 35
        Width = 300
        Height = 24
        Color = clInfoBk
        DataField = 'ON_FIO'
        DataSource = dsView
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Visible = True
      end
      object edONA: TDBEditEh
        Left = 426
        Top = 35
        Width = 300
        Height = 24
        Color = clInfoBk
        DataField = 'ONA_FIO'
        DataSource = dsView
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Visible = True
      end
      object cbFirstBrak: TDBCheckBoxEh
        Left = 764
        Top = 66
        Width = 189
        Height = 17
        Caption = #1041#1088#1072#1082' '#1074#1087#1077#1088#1074#1099#1077
        DataField = 'FIRST_BRAK'
        DataSource = dsView
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object edNomer: TDBNumberEditEh
        Left = 54
        Top = 8
        Width = 65
        Height = 24
        Color = clInfoBk
        DataField = 'NOMER'
        DataSource = dsView
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
      object edDateDecl: TDBDateTimeEditEh
        Left = 533
        Top = 63
        Width = 102
        Height = 24
        DataField = 'DATE_DECL'
        DataSource = dsView
        EditButton.Visible = False
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
        Visible = True
        EditFormat = 'DD/MM/YYYY'
      end
    end
  end
  object pnGurnal: TPanel
    Left = 442
    Top = 168
    Width = 522
    Height = 217
    TabOrder = 3
    Visible = False
    object GridGurn: TDBGridEh
      Left = 1
      Top = 1
      Width = 520
      Height = 215
      Align = alClient
      AllowedOperations = [alopUpdateEh, alopDeleteEh, alopAppendEh]
      DataSource = dsGurnal
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
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      UseMultiTitle = True
      OnDblClick = GridGurnDblClick
      OnGetCellParams = GridGurnGetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          Visible = False
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'DATE_BRAK'
          Footers = <>
          Title.Caption = #1047#1072#1082#1083#1102#1095#1077#1085#1080#1077' '#1073#1088#1072#1082#1072'|'#1044#1072#1090#1072
          Width = 90
        end
        item
          Alignment = taCenter
          DisplayFormat = 'HH:NN'
          EditButtons = <>
          FieldName = 'BEGINR'
          Footers = <>
          Title.Caption = #1047#1072#1082#1083#1102#1095#1077#1085#1080#1077' '#1073#1088#1072#1082#1072'|'#1042#1088#1077#1084#1103
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'ON_FIO'
          Footers = <>
          Title.Caption = #1046#1077#1085#1080#1093
          Width = 277
        end
        item
          EditButtons = <>
          FieldName = 'ONA_FIO'
          Footers = <>
          Title.Caption = #1053#1077#1074#1077#1089#1090#1072
          Width = 250
        end
        item
          EditButtons = <>
          FieldName = 'TELEFON'
          Footers = <>
          Title.Caption = #1058#1077#1083#1077#1092#1086#1085
        end
        item
          EditButtons = <>
          FieldName = 'NOMER'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1074' '#1078#1091#1088#1085#1072#1083#1077
          Width = 59
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'DATER'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1079#1072#1087#1080#1089#1080
          Width = 85
        end
        item
          EditButtons = <>
          FieldName = 'MESTO'
          Footers = <>
          Title.Caption = #1052#1077#1089#1090#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          Visible = False
          Width = 213
          OnGetCellParams = GridGurnColumns8GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'GOD'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'MONTH'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'DAY'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'LONGR'
          Footers = <>
          Visible = False
          Width = 54
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'DATE_CORR'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
          Width = 97
        end
        item
          EditButtons = <>
          FieldName = 'FIRST_BRAK'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'OTKAZ'
          Footers = <>
          Visible = False
        end>
    end
  end
  object dsTable: TDataSource
    DataSet = table
    OnDataChange = dsTableDataChange
    Left = 304
    Top = 168
  end
  object table: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'TIME'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DAY1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DAY2'
        DataType = ftString
        Size = 20
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
    Left = 304
    Top = 136
  end
  object ImageList: TImageList
    Left = 120
    Top = 112
  end
  object TBImageList1: TTBImageList
    Height = 24
    Width = 24
    Left = 56
    Top = 112
    Bitmap = {
      494C01013B004000040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000008001000001002000000000000040
      0200000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000000000553F
      230070553300533E2300574730005848310058472D004E3A1B00594424005944
      24005944240058452400584524005845240056442500524427004F432B004039
      2A00524A3D0043351F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FFFDFDFEFF000000FFF0EFF0FF8A879BFF716E79FFEDEDEDFF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005B46
      2A00FBE4C400FFFCE600F6EBDD00EDE3D200FFF5E200FFF4D900FFEDCF00FFF3
      D400FFF3D400FFF3D400FFF3D400FFF3D300FFF3D400FFF2D700FFF1DA00FFF5
      E400F6ECDB004C3B210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FFF9F9
      F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF8F8F8FFD8D7
      D8FF827B83FF404341FF1B391EFF163D1CFF173420FF1D2120FF6C666EFFD0CF
      D1FFFEFEFEFF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005D4F
      3300FFF1D500FFFEF300FEFFFD00FFFFFC00FFFFF800FFFFED00FFFFEB00FFFF
      EC00FFFFEC00FFFFED00FFFFEC00FFFFE900FFFFEA00FFFFED00FFFFF000FFFF
      EE00FDF2DE00614E330000000000000000009FA4A3007E7879006A606000605D
      55005F5C5400685A5E0074636600766055006E5C51006D626400655E63006258
      58006D615F00645C5D006F6663006F625200695F4E006B636400625D66005558
      5D0060626200605E56006F6C640085828400000000FF000000FFF6F6F6FF8A8A
      8AFF919191FF8A8A8AFF898989FF888888FF8C8C8CFF868786FF544955FF1D2D
      1FFF0B7A0DFF05CA06FF02E601FF01EA00FF02E501FF05C905FF0C760DFF212C
      23FF989499FFFBFBFBFF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006A63
      4F00EDEBD900D6E2E6008394A100919DA900D5D9DE006A61580068584B006A59
      50006C5B52006B5952006A564B006D56470070594A006B58500068595000FFFF
      F100E8DBC500604B2F0000000000000000007F808400E1D6D900DBCDCE00DBD3
      CC00E3D9D200E2D2D300E2CDCB00BDA59100B49E8C00DFD0CE00E7DADC00D7C9
      C300E3D6CE00E0D4CE00DDD1C500B7A88E00AEA08900DDD1CB00E1DBDC00C9C9
      C900D7D6D200DAD6CB00E0DBD200605B5D00000000FF000000FFF5F5F5FF8989
      89FFF3F3F3FFFAFAFAFFF8F8F8FFFAFAFAFFF9FBF9FF938794FF164117FF04CC
      04FF01FF01FF01FE01FF01FD01FF00FD00FF01FE01FF00FD00FF01FF01FF08C9
      08FF163C17FF9D969DFFFDFDFDFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005B56
      4100F8F9E900DCF0FB00D9F4FF00DCF0FF00DBE4EE00FFFCF500FFF0E400FFF1
      EA00FFF2ED00FFF1EC00FFEFE900FFEFE400FFF0E500FFEFE900FFEEE600FFFF
      F000EADDC700624E2F0000000000000000007A7D8C00E1D9E400D0C6CC00CFCC
      C800D3CECB00D6CBCD00D9CBC500B9AA9000B5A88E00DAD1CD00D4CECF00D8D0
      C900D7CFC200DACDBD00E1D3BC00BBAB8700B5A68500E3D6C800D7CFC800CDCB
      C300D1CFC500D8D1C200DDD4CA0071686B00000000FF000000FFF6F6F6FF8D8D
      8DFFF9F9F9FFF9F9F9FFEBEBEBFFF3F6F2FFA89AA8FF143816FF04D505FF06D4
      07FF05BC07FF01FF01FF00FF00FF00FB00FF00FD00FF01FF01FF06B609FF03D6
      06FF07D408FF162F18FFBDBBBEFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008176
      5A00F1EFD700ECFFFF00CAE5F900E4F8FF00EEF4FB00F3E5D900FFF9E500FFF0
      E200FFF2E600FFF0E700FFEFE200FFF0DD00FFF0DD00FFEEE000FFECDE00FFFF
      EE00E9DDC5005F4D2E0000000000000000007F818C00E2DBE000DAD1CE00D7D2
      C900D6D2C700E9DED600E4D6C400BBAD8300B3A77F00D9D1C000D6D1C800DBD5
      C200DBD4BB00E8DDC200E6D7B700BAA97E00B4A37C00E1D3BD00DCD2C800D7D3
      C800D7D4C600E0D8C700E5DCCF00796E7000000000FF000000FFF5F5F5FF8989
      89FFF6F6F6FFF8F8F9FFEDEFECFFD2CCD2FF545757FF009900FF00FF01FF0B91
      0BFF143B16FF05C706FF00FF00FF00FF00FF00FF00FF03D004FF163018FF09A3
      0AFF01FF01FF09A609FF363238FFD9D8D9FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000857A
      5A00E8E5C900C2D8DE007E9AB200758B9D00DCE2E90078675A00836651007F63
      52008063550080635500846252008D634C008E644D00866250007C5F5000FFFE
      ED00E8DCC4005E4C2D00000000000000000096919000EEE0D400EDDFC900ECE1
      C500EAE1C000EFDFC200EFDDB400CEBC7B00CEBE7C00F3E8C200EFE4C800EFE4
      BE00E8DEB600ECE0BE00E9D9B500C8B78600C8B88A00F0E0C900E8DDCF00E2DC
      CF00D8D3C400DBD1BF00E2D6CA00786B6D00000000FF000000FFF5F5F5FF8C8C
      8CFFF9F9F9FFF7F7F7FFEBEEECFFAFA0B1FF144F14FF04EE04FF01FB01FF01F2
      01FF0F6E10FF153D16FF0A970CFF06B808FF0A980BFF153718FF0E750FFF01F6
      01FF00FD00FF01F401FF154318FF665D68FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008377
      5500F8F4DB00E3FBFF00D8F8FF00C6DEF600EBF4FE00FFF5E900FFEED900FFF4
      E400FFF3E700FFF3E700FFF2E300FFF5DD00FFF8E000FFF5E500FFF3E300FFFF
      EF00E8DDC7005E4E3100000000000000000088827D00A99B89008F8165008F85
      63009C936E009B8B6700B8A77600B1A05700AA9C5400B9AD8300A69D7C00B4AA
      8200C3BA8F00BCAD8C00D0C09C00CAB88900C5B58700D0C0A900BBB0A200C4BE
      B100CBC5B800D7CDBC00E0D4C800776A6C00000000FF000000FFF5F5F5FF8C8C
      8CFFF8F8F8FFF5F5F6FFF9F8FAFFBDB7BCFF006600FF04FF03FF00F700FF00FE
      00FF00F600FF0A910BFF124F14FF134E15FF125014FF0B950BFF00FB00FF00FE
      00FF01FC01FF00FE00FF0D7E0EFF261B2DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008375
      5100EDE9CD00E6FDFF00CAECFF00DEF6FF00DEE7F400FFF7EA00FFFBE600FFF3
      E300FFF2E600FFF2E600FFF3E300FFF7DE00FFF9DF00FFF6E200FFF2E100FFFF
      EE00E7DCC6005D4D3000000000000000000097999A00EAE4D900EEE5D100EAE5
      CC00E6E2C600F2E7CC00F1E4BE00CDC48100CBC28300F1EBCE00EAE6D400EAE5
      CC00E6E0C300F2E5CB00EBDCBC00CBBA8F00CDBC9500F1E2CF00EBE1D700E8E3
      DA00DBD7CC00E1D8CA00EAE0D6007E737600000000FF000000FFF5F5F5FF8B8B
      8BFFF7F7F7FFF6F6F7FFFEFCFFFFC0C7BDFF007C00FF05FE04FF00F900FF00FB
      00FF00FC00FF00FF00FF00FB00FF01EA02FF00FA00FF00FF00FF00FB00FF00FC
      00FF00FD00FF00FE00FF0A950BFF1D182BFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F7D
      5800F9F1D400BBD1DD007496B4007A92AE00D1DAE4007C6C5C00735A40007C64
      52007A655600796657007E685600896D4F00896D4F007B6650006D5F4D00FFFF
      ED00E4DCC5005A4C3000000000000000000093959F00E9E3DE00E3DBCE00E2DD
      CE00E9E2D100EBE1D000F0E4C800D2C78E00C8BF8D00E4DDCE00DAD5D400E1DD
      D200E7E0CF00EADECC00EEDEC700D1BF9A00CAB99800EADACD00E1D6D200E2DE
      D900E2E0D600E7DFD200F0E7DD0082797C00000000FF000000FFF5F5F5FF8A8A
      8AFFF8F8F8FFF5F6F7FFFBF9FBFFBBC3B4FF007E00FF04FD04FF00F900FF00FF
      00FF00FF00FF00FF00FF00FE00FF00FF00FF00FE00FF00FF00FF00FF00FF00FF
      00FF01FC01FF00FE00FF0B970CFF211C34FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008B77
      5400F7EED300E3FBFF00CCF0FF00CEE8FF00E8F3FF00F9EBDF00FFFAE400FFF3
      E100FFF6E500FFF9E900FFFBEA00FFFEE400FFFCE200FFF3DE00F7ECD800FFFF
      EC00EADEC6005C4E320000000000000000008A899900F5EAEC00E9DDD700E6DD
      D400E8DDD500EFDFD900F0E1CE00D3C49600CEC29A00F0E4E400E7DDEA00E7DD
      E300E6DAD800ECDFD700F1E2D200CEBEA100CABCA000F4E7DF00E8E0E000DEDC
      DB00DCDCD600E2DFD100EEE7DE007F797A00000000FF000000FFF5F5F5FF8C8C
      8CFFF9F9F9FFF5F5F6FFF6F5F4FFB9B4B0FF006701FF05FF03FF00FC00FF03DE
      03FF09A609FF03D603FF00FD00FF00FA00FF00FD00FF04D504FF09A50AFF02E3
      02FF00FD00FF00FF00FF0D7C0DFF1B1032FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C77
      5C00F4EDD900E1FEFF00C5EFFF00CEEFFF00DFEDFF00FAEEEC00FFF7E800FFF3
      E200FFFFEE00FFFBF000FFF5EA00FFFAED00FFF2E300FBEBDA00F2E5CF00FFFF
      EA00E0CDB200645339000000000000000000928B9800FFF2F000EEDED200EBDD
      D100F2E4D800F2E0D500F9E4CE00D8C79C00D2C09B00F2DFDA00E7D6DF00E9DD
      DD00EBDFD900EADED200F4E9D500CFC4A400C8BD9F00F2E6DA00E5DCD800E1DB
      D600E6E4DA00E8E2D700F2EAE300807B7D00000000FF000000FFF5F5F5FF8B8B
      8BFFF7F8F8FFF6F6F7FFFBFDFBFFC2B2C4FF033C0BFF08F307FF00FC00FF0C8A
      0CFF1F0022FF0E7910FF00FE00FF00FC00FF00FE00FF116E11FF1F0021FF0A98
      0BFF01FC01FF01F701FF17441CFF493D56FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009581
      6800EBE4D000C8E5EE006792AD007294B200CBD9EF00716565007A6052007662
      5000735F4D00725C50007F645A00755147007D5C4D007864520060503900FFEE
      D200EAD4B800625039000000000000000000A99B9F00FFF4E500FFEAD100FFF1
      D600FFEED100FFEDCD00FFF8D200E6D19E00DFCB9C00FFF0D600FFEEDC00EDE2
      C700F7F1D400F9F1D300EDE7C400D4D1A500D9D4AD00F1E5CD00F8EBDB00FBEC
      DC00F2E5D700FAEEE400EFE3E10089808A00000000FF000000FFF5F5F5FF8B8B
      8DFFF4F6F6FFF8F9F9FFF8FDFDFFDCDAE3FF404547FF019B00FF02FF03FF07B4
      08FF125814FF08AD09FF00FE00FF00FB00FF00FF00FF09A70AFF125714FF06BE
      07FF01FF01FF0AA708FF252236FFC7C6C8FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009F8A
      6F00FFFCE400DFF7FD00D6FDFF00DBFAFF00E4EFFD00FFFBF500FFFBE700FFFD
      E500FFFCE400FFFCEB00FFFFF000FFEAD800FFE3CD00FFEED400E8D6B900FFF1
      D200D5C0A40061513A000000000000000000A99A9800AE9B8600978364009F8E
      6D00A3936E00AC9A7100B09B6E00AE976500B8A17100C0A58300BFAA8B00BFB6
      9100B7B28B00C3BA9400CCC39800BFB88700C3BA8E00D3C3A600D3C1AA00D3C1
      AA00D3C2AD00D0C0B300D5C6C30091848C00000000FF000000FFF5F5F5FF8C8C
      8DFFF5F7F7FFFBFCFCFFEBEFF0FFF5FDF9FFAB9FACFF0D3110FF06D006FF02FF
      03FF00EF01FF00F800FF00FC00FF00FB00FF00FB00FF01F901FF01EE01FF00FF
      00FF07D008FF0E2616FF77737FFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A691
      7600EFE5CD00EAFFFF00D1F2FF00D9F2FF00F4FDFF00FFFFF700FFFBE600FFFF
      E900FFFFEA00FFF4DF00FFE7D300FFEFD800FFD8BF00F6DCBE00EAD6B700EAD5
      B600D6C4A7005C4B36000000000000000000BDACA900E8DBC500DACFAF00DDD2
      B200ECE2C000E9DEB800F0E0B600E3CC9E00E5CCA200F6DBC000F1DDC400E8E0
      C200E9E2C100F1DEBB00FCE6BD00E6CFA100E7D0A300FFE3C400FCE3C900F5E0
      C400F7E6CB00F4E6D000F3E5D900A7979800000000FF000000FFF5F5F5FF8C8C
      8CFFF8F8F8FFFBFAFAFFEAE9E8FFE7E6E4FFE5E4E5FF867B86FF103E11FF00B6
      00FF05FF05FF01FF02FF01FF01FF01FF01FF00FF00FF00FF01FF02FF03FF04B9
      04FF173E1AFF766B77FFE4E4E3FFFDFDFDFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5A4
      8A00E7DECA00DBEFF4007A9AAD007A92A600D1DAE4006E5F56007F645000795F
      470080654B0076594400815F480088604700855E42006E5233006B563700EBD7
      B800B9A88D006B5D47000000000000000000AC9F9D00FFFFF000F7F6DA00F5F2
      D600F2EED200F3F0D400FFF6D800E7CEAE00E8C6AE00FFEBE000FFECE600F0E4
      D800FCF1E300FFF1E000FFF2DA00ECD0B100EACEB000FFECD700FFF0DE00F9EB
      D400FAF3DA00F5EFDC00F8F0E30099898A00000000FF000000FFF5F5F5FF8A89
      89FFF8F8F7FFFDFCFBFFFAF9F5FFF4F2EFFFF9F9F7FFF7F6F6FFA197A2FF3244
      33FF016802FF01B501FF01DB01FF03E703FF05DD05FF06B906FF096C0AFF2B3A
      29FF958F96FFE6E6E5FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A99A
      8700F9F4E500E2F7FF00DCF9FF00E1F9FF00F3FDFF00F7EBE500FFFFF000FFF5
      E100FFF6E000FFEDD900FFE6D100C5A08600DDBB9E00BBA18300B6A18500B4A2
      8500817258006A5C49000000000000000000B3ACAF00E7F2E200DBECD700F5FA
      EB00E3E4DA00E6ECE100F0EBE200EFCFC900F6CBCE00FFDFF000FDE0F900F4DF
      F500F5E2F500F2DFEE00FCE7F000E3CCCA00E3CAC600FCE5E900F5E7E800E5E6
      DD00E6F0E400E2EBE100F9FDF8009B8E9600000000FF000000FFF5F5F5FF8D8B
      8AFFF8F7F5FFFCFBFBFFFCFBF5FFFEFCF7FFFBF9F4FFFEFCF9FFFCFAF6FFC9BB
      C5FF857C86FF4B5D4DFF284D29FF174519FF1A3D1BFF2A392CFF58505BFF796F
      7AFFF0F1F1FF000000FFFCFCFCFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A79E
      9100EFEFE900E8FDFF00D4F3FF00E2FAFF00EBF8FF00FFFAF700FFF8EB00FFF5
      E600FFEDDC00FFE7D700E7CBBA00C9AA9300FFFEE500FFF4DB00FFF4DA00E9DA
      C000AEA08900645846000000000000000000AFACAE00D5EFDD00D5F7DF00E0F6
      E400DFF2E300DBF6E600E9F8EA00E5D4C700EACDC800FBE8F100F1E8F500E2E1
      EB00E7E9F100E9EAF400EDECF000D9D1CA00DBD2C900F3ECE900ECF2ED00DAF4
      E400D6F9E500D0F1E200E3F8F0008B8A9300000000FF000000FFF5F5F5FF8F8E
      8CFFF9F9F3FFF7F1ECFFEDE7DEFFEFE7DFFFF2E8E0FFF2E9E1FFF2EBE4FFEFEC
      E4FFF1EEEBFFD5C9D2FF9D909DFFBFB2C0FFD3C5D3FFDCD2DDFFD6D6D7FF999C
      9AFFF1F1F1FFFDFDFDFF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ACA3
      9900E7E8E400CDE0EF007991A900899EB300CCD8E40066635F00695D51006A5A
      4D0066534600765F50005E443300B3977F00FFFFEA00FFECD600DECDB800A698
      81007A6F5B00000000000000000000000000B7B8B400E3FFF100D4FFE400CFFB
      D600DDFFE300C8FFD600D7FFD900D9EAB700E1E9BA00EFFFE000E5FFE400D8FF
      DA00DFFFE100E0FFE200E4FFDE00D7ECBF00D9EDBE00E8FFD900E0FFDF00CDFF
      DB00C5FFDB00CFFFEB00CEFDE7009FAFAE00000000FF000000FFF5F5F5FF8D8B
      87FFF7F6F1FFF5EBE3FFEEE4DAFFF3E9DEFFF9EADEFFF6E7DAFFF1E5DBFFE8DE
      D3FFFBF8F2FFEAEDE8FFA1A39CFFE7E9E5FFFFFFFFFFE4E7E4FFA1A2A1FFC5C5
      C5FFF4F4F4FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A9A0
      9600EBEAE600ECF8FF00E8FAFF00EDFDFF00E5F0F400F5F2EA00F9EEE000EDDC
      CF00F8E3D400ECD3C300CBB29E00AD927800FFF0D600FDE8D200A69580008678
      650000000000000000000000000000000000A1B3A6009DDEB70054A872005CA8
      72005BAD72004FB470004FAE63007EBB6B008DC4750061AC620050AB5F0059C0
      6B0045AB59004EAA610065B76F006FB6660075B768006DB36D005BAA67004CB0
      680049B26F004BA972005EA6820084A89C00000000FF000000FFF6F6F6FF9290
      8CFFFBFBF7FFF9F4ECFFF7ECE3FFF9EEE3FFF9EADBFFFDF0E2FFFCF3E8FFF2E6
      DBFFFBF6F2FFE6E6E5FF9A9791FFDCDBDAFFE6E6E7FF909090FFB3B3B3FFEBEB
      EBFFFDFDFDFF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AFA6
      9900F5F0E700FAFEFF00F2FBFF00F2FBFF00EAF0EB00F4EFE000F0E4D200EEDB
      CC00DBC4B400E9CFBE00CBB19900A68C6E00E9D1B300B8A289007A6954000000
      0000000000000000000000000000000000008EBEA20086E8B20048C17D0043B9
      720047C77A0032CA710033C866005DD36C0064D76F003DC964002ECB63002ED6
      650022CE5E0028CD660036D06B0046D469004CD2680047C96A003EC46A0033C7
      690036C870003BBB730054B6820077AE9300000000FF000000FFF5F5F5FF8989
      89FFF2F2F2FFFAFAFAFFF9F9F8FFFAF9F8FFF8F8F8FFF8F8F8FFF8F9F9FFF4F3
      F3FFFDFDFDFFE1E1E1FFB1B2B1FFD1D1D1FF9D9D9EFFB6B6B6FFEBEBEBFF0000
      00FFFDFDFDFF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AEA1
      9100F7EADA00FFFFFB00FFFFFE00FFFFF900FCF9EA00FBF3DC00EFE1CA00EFDA
      C500ECD1BD00DDC1A900C5A88D0092785400B39B7700846E5200000000000000
      00000000000000000000000000000000000090BFA50080DFAD004DC5850048BB
      7C0042BF7A0037CB7D0036C974005BD2770061D67B003FCA730030CC75002FD6
      750026CE6D002BCE730037CF760047D375004CD1740049CA750041C775003AC9
      74003CC978004CC783005CBB890072A78C00000000FF000000FFF6F6F6FF8989
      89FF8F8F90FF8A8A8AFF89898AFF888889FF8B8B8CFF878788FF898989FF8888
      88FF8A8A8AFF8D8D8DFF7D7D7DFF9B9B9BFFC7C7C7FFEAEAEAFF000000FFFEFE
      FEFF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFB3
      A100F2E3D000F9EDE300F1E8DF00EFE8D900E6E1CC00E2D9BE00D9CCB200CDB7
      A500CAB09F00C2A68E00AC9176008F77530087714E0000000000000000000000
      000000000000000000000000000000000000B0C3BA009FD9BC0094DEBA009BE1
      C20094E0C00086E3BE0086DEB600A4E3B900ABE4BD0092DABC0088DCBF0086E5
      C0007FDFB7008ADEBC0092DFBA009CE1B400A0E1B3009DDEB70097DEB6008CE1
      B4008AE2B40094E3BA0095D3B5008FB0A200000000FF000000FF000000FFF9F9
      F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9
      F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFFAFAFAFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ACA1
      9300BEB09E00B6A79E00AEA19900ACA59600AAA59000ACA78E00B2A79100B4A1
      9400B0988C00AD958300A18B7200736144000000000000000000000000000000
      000000000000000000000000000000000000C3C3C900ACC5BB00AACFBF00ACCF
      C500A2C9C100A1D0C700A1CCBF00BACDBE00C1CCC200B2C6C700ADC8CC00A9CE
      CA00A4CBC300ABCBC600B2CAC200B6CCBA00B8CCB900B5CBBF00B1CDC000A8D1
      BC00A2D2BA009ECCB600B0D0C500B9C7C600000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFE76C
      0CFFE66A0CFF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFC157
      00FFC15700FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FFEA6B0CFFDB59
      04FFE36F10FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFC157
      00FFC76B18FFC15700FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFFEFEFEFFF7F7F7FFEFEF
      EFFFE6E6E6FFE0E0E0FFDDDDDDFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDC
      DCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDEDEDEFFE1E1
      E1FFE7E7E7FFF0F0F0FFFEFEFEFF000000FF000000FFFEFEFEFFF7F7F7FFEFEF
      EFFFE6E6E6FFE0E0E0FFDDDDDDFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDC
      DCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDEDEDEFFE1E1
      E1FFE7E7E7FFF0F0F0FFFEFEFEFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFE7680CFFE57011FFEA9C
      2AFFE77B17FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFC157
      00FFE08800FFC96510FFC15700FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFFAFAFAFFCCCCCCFF8D8E
      8FFF8E9190FF8F9392FF939696FF989A9BFF9B9FA0FF9FA2A4FFA2A5A7FFA4A8
      A7FFA5A9A8FFA5AAA9FFA5AAAAFFA6A9AAFFA4A8AAFFA2A7A9FFA2A5A7FFA1A4
      A6FF909191FFCCCCCCFFF8F8F8FF000000FF000000FFFAFAFAFFCCCCCCFF8F8D
      8FFF919090FF929192FF969496FF9A999BFF9E9DA0FFA2A0A4FFA5A4A7FFA7A6
      A7FFA8A7A8FFA8A8A9FFA8A7AAFFA7A8AAFFA6A6AAFFA5A5A9FFA4A4A7FFA5A3
      A6FF929091FFCCCCCCFFF8F8F8FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FFE96E0CFFE36E0CFFF4BE46FFEDAA
      36FFE36911FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFC157
      00FFF4C239FFE08800FFC9630FFFC15700FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFF7F7F7FF989896FF5F36
      28FF4C0C00FF611200FF6D1809FF711C14FF74201EFF752328FF752632FF7327
      38FF70273DFF6C2841FF6A2740FF6A273FFF6D263CFF6F2437FF6C202FFF5C1B
      22FF855A5FFFACADADFF000000FF000000FF000000FFF7F7F7FF969996FF2A5B
      28FF004300FF005600FF006008FF006412FF00681DFF006B27FF006E31FF006F
      37FF00703CFF007040FF00703FFF006F3EFF006E3BFF006D36FF00642DFF0052
      21FF497E5EFFADADADFF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FFEB6F0CFFE67711FFF4BC4BFFF8C858FFE791
      2CFFDE710FFF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFBC53
      00FFE59000FFF1B929FFE08800FFC96310FFC15700FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFBFBFC0FF715342FF5A15
      00FF852702FF722005FF73230DFF782919FF7B2D25FF7B2F2EFF7B3238FF7733
      3DFF743442FF703244FF6D3144FF6B2F41FF6E2E3EFF712C38FF7A2B35FF9738
      3FFF641C1EFF97797AFFCCCCCCFF000000FF000000FFC0BFC0FF447142FF0055
      00FF027F02FF026C02FF006C0CFF027117FF027524FF00772CFF027B36FF007A
      3BFF027D40FF027B43FF027A42FF00773FFF02763DFF027437FF007734FF038F
      3DFF02581DFF6C927AFFCCCCCCFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FFEC6F0CFFE68317FFF5C45DFFF8C75EFFF3BA4CFFE58D
      2CFFDA700CFF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFC45C
      04FFE28E00FFE28B00FFEEAF1DFFE08800FFC96310FFC15700FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFB4B5B6FF643E20FF792B
      00FF532D14FF898876FF8E8E7FFF949286FF97978EFF9A9B98FF9CA09FFF9CA3
      A5FF9BA5A7FF9CA4A8FF9BA3A7FF9AA2A5FF99A0A3FF999EA1FF949295FF5729
      29FF892E2EFF805455FFC2C3C3FF000000FF000000FFB6B4B6FF226820FF007A
      00FF135513FF789375FF7D987EFF829C87FF85A18EFF89A598FF8AAA9FFF8AAE
      A5FF8AAFA7FF89AFA8FF8AAEA7FF88ACA5FF88AAA3FF88A7A0FF7E9E95FF0C54
      28FF027E2DFF3F7954FFC3C2C3FF000000FF000000FF000000FF000000FF0000
      00FF000000FFED750CFFE8881BFFF6CE6CFFF9CA6CFFF7BE52FFF2B84CFFDB8D
      30FFD36B18FFE57F20FFE77820FFE26F1DFFDD741BFFE27717FFE27415FFDF6E
      11FFE06A11FFE06A0CFFD85F0CFFD8480CFFC76110FFC45B0CFFC2580BFFC058
      0BFFC1550BFFBE550AFFBD530AFFBC5409FFBC530AFFBA5208FFBA5109FFC35B
      08FFEB9700FFE28B00FFE08800FFF1B01AFFE08800FFC16016FFC7620FFF0000
      00FF000000FF000000FF000000FF000000FF000000FFB5B6B7FF704923FF6527
      00FF7C7358FFACBDA6FFADBDAAFFAFC0B1FFB0C3B6FFAFC4BCFFAEC5C0FFACC5
      C3FFA9C5C4FFA6C4C4FFA4C2C3FFA4C0C0FFA4BDBDFFA5BABAFFA9BABCFF7A63
      61FF6C2220FF825757FFC1C2C2FF000000FF000000FFB7B5B7FF277723FF0068
      00FF5C8658FFAFBBA6FFAEBCAAFFB0BFB1FFB1C2B6FFB0C4BCFFAFC5C0FFADC4
      C3FFAAC4C4FFA7C3C4FFA5C1C3FFA5C0C0FFA5BCBDFFA6BABAFFACB8BCFF4D7D
      61FF00651FFF407D56FFC2C1C2FF000000FF000000FF000000FF000000FF0000
      00FFEF780CFFEC9522FFF9D782FFF9D277FFF6C25CFFF7C45AFFF0B249FFD993
      38FFDA9037FFD99333FFD3932DFFD89127FFDD8522FFD67D1CFFD67814FFD374
      12FFD36F0BFFD36A09FFDA6D00FFC44100FFCE6E13FFEFB13CFFF5BC42FFF2B5
      3AFFF0B135FFF0AB2FFFEEA82AFFECA126FFEB9E22FFEA991BFFE89616FFE795
      11FFEB990BFFE99506FFE58E00FFE08800FFEEA60DFFE18700FFC16016FFC660
      0EFF000000FF000000FF000000FF000000FF000000FFB5B7B8FF745228FF5929
      00FF827D5CFFACC2A7FFABC0AAFFACC3B1FFB1C8BAFFB3C7BFFFB2C7C4FFAEC7
      C6FFAAC7C7FFA7C7C5FFA8C7C4FFA5C3BEFFA4BDBAFFA4B9B6FFA7B9B7FF7F68
      63FF5E1F19FF805756FFC0C1C1FF000000FF000000FFB8B5B8FF2A7C27FF0060
      00FF618F5CFFAEC1A7FFAEC1A9FFAFC4B0FFB1C6B9FFB3C7BEFFB1C6C4FFAFC8
      C5FFAEC8C7FFADC7C8FFA8C3C3FFA6C0C0FFA5BBBCFFA1B4B2FFA9B7B6FF4F82
      64FF025819FF407C55FFC2C0C1FF000000FF000000FF000000FF000000FFEF7D
      0CFFEEA02CFFFADD97FFFAD483FFF7C769FFF6C666FFF6C25EFFF5BC55FFF3B7
      4FFFF2B545FFF1AF3EFFF1A834FFEFA430FFEF9F27FFED9922FFED931CFFEB8D
      17FFEA8811FFEC870EFFDD7206FFC43700FFD37A1FFFF7CC57FFFAD562FFF9CE
      58FFF8CC4FFFF7C648FFF6C342FFF5C03CFFF4B833FFF2B12DFFF2AF24FFEFA8
      1FFFEDA117FFEB9E10FFEA9709FFE89302FFE18800FFEBA107FFE18700FFC160
      16FFC55F0EFF000000FF000000FF000000FF000000FFB6B7B8FF75572BFF532A
      00FF898461FFB0CAABFF9A897BFF6D201BFF805B55FFBBD1CCFFB9D0CDFF9480
      7DFF6C211BFF6F241EFFA5B7B3FFACCAC3FFAAC3BDFFA6BBB6FFA7B8B5FF836A
      63FF541B14FF7F5755FFC0C1C1FF000000FF000000FFB8B6B8FF2F7F2BFF005B
      00FF659962FFB1C6A8FFB1C6AEFFBBCBBDFFBDCEC6FFC0D0CDFFBED1D1FFB8CE
      CEFFBCD0D5FF337237FF125E12FF145E14FF0B5B0BFF76967BFFACB8B8FF5087
      65FF024E16FF3F7C56FFC1C0C1FF000000FF000000FF000000FFF17E0CFFEFA7
      30FFFCE3A5FFFBDA93FFF8CD7AFFF7CD73FFF7C869FFF6C362FFF5C05AFFF4BE
      51FFF5B749FFF4B743FFF2B03AFFF2AA34FFF2A52AFFF09F27FFF09A21FFEE94
      18FFED8E17FFEF8D0FFFE47809FFC43A00FFD77F20FFF7D05BFFFCD86AFFF9CD
      5EFFF8CB57FFF6CA51FFF6C64AFFF6C445FFF4BE3DFFF3BA38FFF2B531FFF1AD
      2AFFEFA823FFEDA51CFFEDA115FFEC9C0FFFEA9708FFE18700FFEC9F02FFE187
      00FFC05F15FFC55E0CFF000000FF000000FF000000FFB7B7B9FF795C2FFF542E
      01FF918D65FFB4CEB1FF998477FF6C1A14FF691711FFA1A09DFFC3D9D9FF9A83
      80FF6C1913FF6C1B15FF81514CFFB5D5CDFFB0C7C0FFABBEB8FFAABAB5FF876B
      62FF501B10FF805955FFC0C1C1FF000000FF000000FFB8B6B9FF348530FF005D
      03FF6AA268FFB5CAAEFFAEC0ACFF307031FF29702CFF2A702EFF2C7030FFB2C4
      C4FF568F5DFF005B00FF005E01FF005B00FF508955FFB3C3C0FFACB8B5FF508A
      65FF004B14FF407E56FFC1C0C1FF000000FF000000FFF3890CFFF1B43DFFFEEB
      C2FFFBE0A3FFF9D485FFF9D383FFF8CF78FFF7CC6FFFF6C768FFF6C25EFFF4BF
      55FFF3BA4EFFF2B546FFF2B13EFFF1AB38FFF0A630FFEFA12AFFEE9C24FFED95
      1DFFEB9018FFED8C13FFE77E0BFFC43E00FFDB8423FFF9D564FFFDDC75FFFAD6
      68FFF9D261FFF8CE5EFFF7CC56FFF6C84FFFF6C449FFF5C142FFF4BD3DFFF3B7
      34FFF1B02EFFF0AD27FFEFA922FFEDA41AFFEC9F13FFEB9B0CFFEA9000FFEA96
      00FFF0B83BFFD07621FFC45D0CFF000000FF000000FFB7B7B8FF816133FF5C33
      04FF9A936DFFBAD2B7FF9D887BFF73211AFF74241DFF77322CFFCBE3E3FFAC94
      91FF7B2922FF7D2C26FF731F18FFA5A6A0FFB7CFC5FFB1C2BBFFAEBDB8FF8D70
      63FF581E10FF855C55FFBFC0C0FF000000FF000000FFB8B6B8FF378A35FF0165
      07FF71A970FFBBCDB3FFBED1BCFFA9C1ABFF056D0BFF006B02FF027109FF1679
      1CFF03720AFF06730CFF026D04FF39873FFFC0D1CDFFB1C2BBFFB1BBB8FF518E
      67FF025116FF428258FFC1BFC0FF000000FFF38F0CFFF5C857FFFFF4DFFFFDEE
      D8FFFBDB97FFFAD889FFF9D589FFF8D27FFFF8CE77FFF7C96EFFF6C663FFF5C1
      5BFFF4BD53FFF3B94EFFF2B642FFF1AE3DFFF1A935FFEFA42FFFEFA129FFED98
      21FFED931CFFED9117FFEA8912FFC53D03FFDF8B26FFFBD96DFFFEE07DFFFBDB
      72FFFBD76BFFFAD365FFF9D160FFF8CD59FFF6CA52FFF7CB4DFFF6C447FFF4BF
      41FFF4BA3AFFF3B533FFF1B12DFFF0AC26FFEEA71EFFEEA318FFEB9E10FFE28A
      00FFF4BE2AFFF6D67FFFE19A3BFFC5600EFF000000FFB7B8B9FF886438FF6438
      07FFA29672FFC0D5BBFFAA9384FF91392EFF9A443AFF9D4539FFBA9894FFCEB6
      B1FF9C4439FF9E493EFF9E473CFF9F594FFFD0E6DEFFC0CDC6FFB2BEBAFF9371
      61FF5E210FFF895E55FFBFC0C0FF000000FF000000FFB9B7B9FF3A8F3BFF036C
      0CFF75B075FFC1D1B8FFCADBC7FFDDECE0FFDAEDE2FF37A042FF1A972AFF1B97
      2AFF1B972BFF199729FF46A751FFE7F8F2FFD1E3DAFFC0CDC6FFB6BDBAFF5092
      67FF005717FF438659FFC1BFC0FF000000FFF3920CFFF1AC36FFFFF5DAFFFFF3
      E8FFFCE7C1FFFBD78CFFF9D789FFF9D484FFF8D17CFFF7CC73FFF6C768FFF6C3
      60FFF4BF58FFF4BA51FFF2B545FFF2B340FFF1AB3AFFF0A634FFEFA22BFFEE9C
      24FFED941EFFEE9419FFEC8D14FFC93F02FFE39027FFFCDE76FFFEE586FFFDE0
      79FFFBDD77FFFBDA70FFFBD76BFFFAD366FFF8D05EFFF8CB57FFF7CA51FFF7C6
      4EFFF5C345FFF4BE3FFFF3BA39FFF3B432FFF1AF2DFFEFAC22FFED9F11FFF4C4
      3DFFF6D67FFFE19A3BFFD37E25FFC55F0EFF000000FFB7B8B9FF8F673AFF6D3B
      08FFB1A07DFFDDF1D8FFCCAF9DFFAE4A37FFCBABA0FFAE4D38FFAE4F3CFFC28F
      83FFAF4F3CFFB3604EFFBA7565FFAD4A36FFBFA49BFFDDEAE4FFD0DAD5FF9F7A
      68FF66250FFF8E6355FFBFBFC0FF000000FF000000FFB9B7B9FF3C943FFF0472
      10FF80B980FFDEECD4FFE7F5E3FFECF9EDFFFCFFFFFF7CC98CFF14A534FF17A6
      37FF18A638FF10A230FFD0E8D8FFECFDF4FFE2F0E7FFDAE6DFFFD4D9D4FF599C
      6FFF025E19FF438B5CFFC0BFC0FF000000FF000000FFF68E0CFFEF9B1DFFFEF1
      CBFFFFF6EBFFFCE9C4FFFAD789FFF9D584FFF9D27FFFF8CE78FFF7C96EFFF6C6
      62FFF5C059FFF4B94DFFF3B442FFF2B140FFF2AB37FFF1A531FFEFA32AFFEF9B
      23FFED951EFFED941AFFED9319FFCF4302FFE59828FFFDE277FFFFE88CFFFEE3
      81FFFDE27BFFFDDE77FFFBDC71FFFBDA6CFFFAD666FFF9D060FFF8CC59FFF7CA
      54FFF6CB4FFFF6C549FFF5C141FFF4BD3EFFF3B632FFF0AA23FFF4C43DFFF6D6
      7FFFE19B37FFD37E25FFC45E0CFF000000FF000000FFB8B9BAFF966C3BFF8650
      1AFFC8B190FFE6F7E0FFD8B49FFFC65633FFE6D2CAFFDFAB9BFFC75A38FFC75C
      3AFFC85F3EFFC66648FFE8E4DFFFC65633FFC25E40FFD5DED9FFD7E0DBFFB68C
      78FF813C21FF956756FFBEBFBFFF000000FF000000FFBAB7BAFF3E9941FF1689
      24FF92CC96FFE7F2DDFFECF7E4FFFAFFF7FFA0DEB2FF0AB53EFF17BA4AFF14B9
      48FF17BA49FF13B947FF34B75BFFF0F6F3FFE8F3EAFFE0E6DFFFDBDDD9FF6AB1
      81FF0A792EFF44905DFFBFBEBFFF000000FF000000FF000000FFF4870CFFED90
      12FFFDEDC1FFFFF7EFFFFCE9C6FFFAD688FFF9D080FFF8D180FFF8CE75FFF6C7
      66FFF6C56AFFF6C76AFFF3C25DFFF4BE55FFF2B94AFFF1B444FFF1B03DFFEFAB
      32FFEFA52FFFEE9B1EFFF09517FFCF4803FFE89D2DFFFCE380FFFFEA95FFFEE6
      8BFFFDE585FFFEE27EFFFDE07EFFFDDF76FFFADC72FFFBDA6CFFFBD669FFF9D2
      61FFF8CF59FFF7CB57FFF6CA50FFF6C245FFF4BB35FFF4C43DFFF6D67FFFF0AA
      23FFD37E25FFC55F0EFF000000FF000000FF000000FFB9BABBFFAB7E4EFF965A
      22FFCBB290FFEBF9E3FFE7BEA3FFE26332FFEFD3C7FFFFFFFFFFE27950FFE369
      3BFFE36B3DFFDB6E44FFFDFFFFFFE19B7EFFE46636FFD2967DFFDCE6E3FFB98D
      75FF8E4626FFAA7967FFBFBFC0FF000000FF000000FFBBB9BBFF4EAD55FF1F95
      2FFF93CE97FFEDF4DEFFF8FBEBFFC5ECCEFF0AC853FF12CC5BFF11CC5AFF23CD
      64FF0ECB58FF13CC5CFF0ECB58FF62C987FFF7F7F2FFE5EAE3FFDEDFDBFF69B4
      80FF108336FF54A46FFFC0BFC0FF000000FF000000FF000000FF000000FFF483
      0CFFED9015FFFDEBBCFFFFF7EFFFFCE9C8FFFAD586FFF9D079FFF8CC71FFF7CA
      6DFFFAE3B4FFFDECD6FFFAE9C4FFF9E5BFFFF9E2B6FFF8DFACFFF7DBA2FFF7D7
      94FFF5D890FFF3C663FFF2A220FFCF4603FFECAB3AFFFFF5CFFFFFF8DBFFFFF6
      D4FFFFF6D5FFFFF5D3FFFFF4D2FFFFF3CEFFFFF2CBFFFFF1C7FFFFF1C9FFFDEB
      B2FFFAD461FFF9D161FFF8CB55FFF7C94DFFF6D67FFFF6D67FFFF0AA23FFD37E
      25FFC55F0EFF000000FF000000FF000000FF000000FFBBBDBEFFB17E4EFF9C5B
      21FFD2B491FFECF0DAFFEFA178FFF96D30FFEFAC8EFFFBFEFFFFFAE3DAFFF76D
      30FFF97237FFEF743EFFF2ECE8FFE4B9A3FFF96F31FFF76E33FFD8C8BBFFBC8F
      75FF934825FFAE7B66FFC0C1C2FF000000FF000000FFBEBCBEFF50B058FF2098
      2FFF95D098FFF6F5E1FFD9F2D7FF0AD964FF08DB65FF08DB64FF1AD96DFFF4FA
      F7FF7EE3A8FF04DB62FF09DC65FF00DA5FFF9BD8B2FFEDEEE9FFE3E2DEFF67B5
      7FFF0E8837FF54A770FFC2C0C1FF000000FF000000FF000000FF000000FF0000
      00FFF3800CFFEB870BFFFBE9B0FFFFF8EFFFFCE9C8FFF9D583FFF8D074FFF9CF
      77FFFADB94FFF9DE97FFF8D788FFF8D47EFFF6CF74FFF6CC6BFFF4C85FFFF4C0
      56FFF3BC51FFF4BC4DFFF1A529FFCE4703FFEC9E20FFFAE6A4FFFBEAACFFFBE8
      A8FFFBE7A8FFFAE8A6FFF9E7A6FFF9E6A4FFF9E5A3FFF9E4A1FFF8E3A0FFF9DF
      93FFFBDB6FFFFAD462FFF8D05BFFF6D67FFFFAEBB9FFF4BB35FFD37E25FFC55F
      0EFF000000FF000000FF000000FF000000FF000000FFBBBDBEFFB47E4CFFA35B
      21FFD5B491FFF4EAD3FFFDA577FFFDAC84FFFDA67EFFFBF9F9FFFEFFFFFFF7C0
      A6FFF8A780FFF0AA87FFF5DED2FFF9A47AFFF9AB82FFF7A780FFEAC3ACFFBE90
      75FF984C25FFAD7C64FFBFC0C0FF000000FF000000FFBEBBBEFF50B055FF219A
      30FF97D199FFFCF7E3FFA6EDBCFF8DEFB5FF8FEFB9FF8AEDB5FFE2F7EBFFFFFF
      FFFFFFFDFFFF8BE7B4FF89E9B5FF8BECB6FF8FE8B2FFECECE7FFE6E4E1FF67B9
      80FF108E39FF52A96FFFC1BFC0FF000000FF000000FF000000FF000000FF0000
      00FF000000FFF17E0CFFEA7D04FFFAE3A2FFFFF7EEFFFCEBD2FFFCE5B5FFF7CB
      6DFFEE9820FFED8111FFEE8D14FFED8813FFEC8610FFEB8011FFEA7B0FFFE974
      0FFFE7700DFFE76F0CFFE77616FFE05A0CFFEDA429FFEA9A1CFFE8961AFFE896
      1AFFE7941AFFE79319FFE69018FFE68F19FFE59118FFE48C18FFE28B14FFE494
      27FFFDE274FFFCDD76FFFEF1C0FFFCEEBEFFF4BB35FFD37E25FFC5600EFF0000
      00FF000000FF000000FF000000FF000000FF000000FFBBBDBEFFB57A49FFA75A
      22FFD8B391FFF6F8E4FFFDFFF0FFFEFFFBFFFDFFFFFFFFFFFFFFFDFDFDFFFFFF
      FFFFFEFFFFFFFEFFFFFFFEFFFFFFFFFFFFFFFBFFFAFFEEF4EFFFE3EAE5FFC08E
      72FF9B4E25FFAC7B60FFBFBFC0FF000000FF000000FFBEBBBEFF4EAD54FF239C
      32FF98D19AFFF9F6E3FFFFFDEDFFFFFEF9FFFFFEFFFFFFFFFFFFFFFEFEFFFFFF
      FFFFFEFEFEFFFFFEFFFFFFFEFFFFFFFFFFFFFFFEF8FFEFF1EAFFE8E6E1FF67B9
      80FF11913BFF4FA86DFFC0BFC0FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FFF1780CFFE97903FFFAE098FFFFF8F2FFFEF3DFFFF6C8
      66FFE9740CFF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFEEAB
      2CFFFEE88AFFFFF6D3FFF8E8B1FFF5CD67FFD37E25FFC5600EFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFBBBCBDFFB6774AFFA959
      22FFD7B390FFF3F5E2FFFCFCEAFFFFFFF5FFFFFFFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFBFDF6FFF0F2EAFFE5E9E3FFC090
      71FF9D5026FFAA795DFFBDBFBFFF000000FF000000FFBDBBBDFF4DAB55FF239B
      33FF9AD19AFFF6F4E2FFFCFCEAFFFFFFF5FFFFFFFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFBFDF6FFF0F2EAFFE9E7E3FF67B9
      81FF10933BFF4CA76BFFBFBEBFFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FFF07A0CFFE87400FFF9DE97FFFFF9EAFFF7CF
      79FFEB8510FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFF2B4
      39FFFFFCE4FFFAEBB3FFF5CD67FFD37E25FFC55F0EFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFBBBCBDFFB4744AFFA858
      24FFCF9D76FFF4FAE9FFFAFEEEFFFFFFF9FFFEFFFFFFFFFFFFFFFEFFFFFFFFFF
      FFFFFDFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFAFFFBFFF0F5EFFFE6EFEBFFB87D
      57FF9E5328FFA7755BFFBDBEBFFF000000FF000000FFBDBBBDFF4BA855FF2399
      35FF7CC682FFFEF4E7FFFFFBEDFFFFFFF7FFFFFFFFFFFFFFFFFFFFFEFFFFFFFF
      FFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFFFFFFFFFDF9FFF6F2EEFFF1EAE8FF49B2
      6CFF11943DFF47A467FFBFBDBFFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FFF1790CFFE76C01FFF9DE90FFFCE5
      9DFFEC8B17FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFEEAB
      2CFFFDECABFFF5CD67FFD37E25FFC55F0EFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFBCBEBFFFB77A58FFA658
      29FFB35F29FFCB804DFFD88C57FFE29359FFEB9A5BFFF4A05CFFFAA65EFFFDAA
      5EFFFDAB60FFFBA95FFFF5A45FFFEB9E5DFFE0965BFFD38B57FFC07644FFAB5D
      2CFF9D5429FFA67A60FFBFC0C1FF000000FF000000FFBFBDBEFF53AC61FF2498
      39FF24A33FFF49BD65FF52CB74FF56D67FFF59E288FF5AEB92FF5CF59BFF5DFA
      A3FF5EFCA6FF5DF8A3FF5BF09BFF56E793FF53DA87FF4CCB7BFF36B863FF18A2
      48FF12963FFF4EA56BFFC1BFC1FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFEF730CFFEA7F12FFF1BC
      54FFEE9929FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFF3B6
      32FFF5CD67FFD37E25FFCD6E1CFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFDCDDDDFFC8B4A7FFA754
      27FFB05D2BFFBD642AFFC96C2BFFD5742DFFDF7C2FFFE98530FFEF8A32FFF48E
      33FFF59034FFF28E34FFEC8834FFE38235FFD87A33FFCA7030FFBC652DFFAD5D
      2BFFA3562AFFA49B94FFEAEAEAFF000000FF000000FFDDDCDDFFA6C6ABFF199B
      38FF1EA240FF20AE46FF20BC4EFF22C959FF24D764FF26E270FF28EC7AFF2BF2
      83FF2BF386FF2BF083FF29E87DFF27DE73FF23D167FF1FC25BFF1AB350FF15A5
      46FF0F9E40FF8EA696FFEAEAEAFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FFF1850CFFEB87
      0BFFE9820FFF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFEEAB
      2CFFD37E25FFCA6918FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FFC7C8C8FFC3BB
      B3FFD0AD96FFD5B095FFDCB597FFE1BA99FFE5BC9BFFE7BE9BFFE8BE9AFFE7BE
      9AFFE6BD99FFE4BB98FFE1B897FFDBB493FFD3AD8EFFCAA488FFC09C83FFB697
      80FFA29E99FFCDCECEFF000000FF000000FF000000FF000000FFC8C7C8FFB1C4
      B6FF8ECD9FFF8CD3A0FF8FDAA6FF91E0ACFF93E3B1FF93E6B5FF93E8B7FF93E7
      B8FF91E6B8FF90E4B6FF8EE0B3FF8BDAACFF86D2A4FF7FC89AFF79BE91FF76B5
      8BFF96A39BFFCECDCEFF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFF084
      0CFFEF850CFF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFD37E
      25FFCA6918FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFF9F9
      F9FFDBDBDBFFDADBDBFFDADBDBFFDADBDBFFDADBDBFFDADBDBFFDADBDBFFDADB
      DBFFDADADBFFDADADBFFDADADAFFDADADBFFDADADAFFDADADAFFDADADBFFDBDC
      DCFFFCFCFCFF000000FF000000FF000000FF000000FF000000FF000000FFF9F9
      F9FFDBDBDBFFDBDADBFFDBDADBFFDBDADBFFDBDADBFFDBDADBFFDBDADBFFDBDA
      DBFFDBDADAFFDBDADAFFDBDADAFFDBDADAFFDADADAFFDBDADAFFDBDADAFFDCDB
      DCFFFCFCFCFF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006565650000000000000000000000000000000000000000000000
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
      000000000000329EDE00359AD500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7F7005959B8000101A3005959B8000000000000000000000000000000
      00005959B8000101A3005959B800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004393C300329DDE003595CF006565650000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006262C5000101A8000005E9000101A8005E5EBC00F7F7F700F7F7F7005E5E
      BC000101A8000005E9000101A8006262C5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005AB8
      8F0062BA94000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D9D9D900D9D9D900D9D9
      D900D9D9D900D9D9D900D9D9D900D9D9D900D9D9D90000000000000000000000
      0000000000000000000000000000D9D9D900D9D9D900D9D9D900D9D9D900D9D9
      D900D9D9D900D9D9D900D9D9D900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006489A000329BDD0067C6EE00369FDE005F6B7300000000000000
      00000000000000000000000000000000000000000000D9D9D900D9D9D900D9D9
      D900D9D9D900D9D9D900D9D9D900D9D9D900D9D9D90000000000000000000000
      00000202AF004D56F1000310EB00000DEA000303AD004D4DAF004D4DAF000303
      AD00000DEA000310EB004D56F1000202AF0000000000D9D9D900D9D9D900D9D9
      D900D9D9D900D9D9D900D9D9D900D9D9D900D9D9D9000000000062C1980018C4
      890030C7910068C19B0000000000D6D6D600D8D8D80051B2880003A7610031A3
      730088B6A300D3D3D300D8D8D800000000000000000036342E0036342E003634
      2E0036342E0036342E0036342E0036342E0036342E0000000000000000000000
      000000000000000000000000000036342E0036342E0036342E0036342E003634
      2E0036342E0036342E0036342E00000000000000000036342E0036342E003634
      2E0036342E0036342E0036342E0036342E0036342E0000000000000000000000
      00000000000000000000319ADB0083D7F30089E4FA00349CDC002B3538003230
      2A0036342E0036342E0036342E00000000000000000036342E0036342E003634
      2E0036342E0036342E0036342E0036342E0036342E0000000000000000000000
      00006B6BD4000404B6004A59F1000319EE000016ED000404B2000404B2000016
      ED000319EE004A59F1000404B6006B6BD4000000000036342E0036342E003634
      2E0036342E0036342E0036342E0036342E0036342E000000000019AF6E0022D7
      A20019C68B0053B18800A7C7B9002B352B002F2D280005AA630022DBA80019CC
      930007AB65002253390034322C00000000000000000036342E00BCC0BE00CACF
      CD00A9ADAB0083878600606462005458560036342E0000000000000000000000
      000000000000000000000000000036342E00BCC0BE00CACFCD00A9ADAB008387
      8600606462005458560036342E00000000000000000036342E00BCC0BE00CACF
      CD00A9ADAB0083878600606462005458560036342E0000000000000000000000
      00000000000000000000468FBF0057BEEA00A9F5FF007BDEF800369CDC00567C
      9300595D5B005458560036342E00000000000000000036342E00BCC0BE00CACF
      CD00A9ADAB0083878600606462005458560036342E0000000000000000000000
      0000000000007474DB000D0DC0004A61F3000324F0000020EF000020EF000324
      F0004A61F3000707BA001A1A7D00000000000000000036342E00BCC0BE00CACF
      CD00A9ADAB0083878600606462005458560036342E00000000000BAE69002FE0
      AD0028DEAA0017C687000EB8740009B26B0007AE660007AE66002AE0AD002AE0
      AD0020D2990009B0690021573C00000000000000000036342E00D4D7D500D4D8
      D600B6BAB80095989700787B7900686C690036342E0000000000000000000000
      000000000000000000000000000036342E00D4D7D500D4D8D600B6BAB8009598
      9700787B7900686C690036342E00000000000000000036342E00D4D7D500D4D8
      D600B6BAB80095989700787B7900686C690036342E0000000000000000000000
      000065656500656565005773850042A9E200BDF5FE0081E7FB0076DBF600379B
      DC0051758A005D605E0036342E00000000000000000036342E00D4D7D500D4D8
      D600B6BAB80095989700787B7900686C690036342E0000000000000000000000
      000000000000000000007171DB000707BE00022CF1000022EF000022EF00022C
      F1000909C00030329A0036342E00000000000000000036342E00D4D7D500D4D8
      D600B6BAB80095989700787B7900686C690036342E000000000013B36F0057E7
      BE002EE0A80031E4B30031E4B30031E4B30031E4B30031E4B3002DDFA60028DA
      980031E4B30027D7A0000BB36C009AD5BC0000000000777670008D8E8B00C1C7
      C400919794006E7371005D615F004C4D490072716D00FDFDFD00000000000000
      000000000000000000000000000074746F008D8E8B00C1C7C400919794006E73
      71005D615F004C4D4900747470000000000000000000777670008D8E8B00C1C7
      C400919794006E7371005D615F004C4D490072716D0000000000000000000000
      0000389BDC0048ACE40045A9E2003FA5E100BDF3FD007FE4F8007AE3FA0070D9
      F50042A5E0003A6C8B00646461000000000000000000777670008D8E8B00C1C7
      C400919794006E7371005D615F004C4D490072716D0000000000000000000000
      000000000000000000006060CF000707C9000034F500032DF200032DF2000034
      F5000808C9001F1F8D00706F6B000000000000000000777670008D8E8B00C1C7
      C400919794006E7371005D615F004C4D490072716D00FDFDFD005BCC9C0071DF
      B80050EBC0002EE09E002DDF9B002DDF9B002DDF9B002DDF9B002DDF9B002DDF
      9B002FE1A0003BE9B90045DFAF0012B8720000000000CECDCD0053534E00CCD0
      CE00919794006F747200676B690041413C00C6C5C500F6F6F600F9F9F9000000
      0000000000000000000000000000C6C5C50053534C00CCD0CE00919794006F74
      7200676B690043433D000000000000000000000000000000000053534E00CCD0
      CE00919794006F747200676B690041413C00C6C5C50000000000000000000000
      00003799DB009EF1FD0080E5F90073E0F9006FDEF7006DDCF7006EDDF70071E0
      F90070DFF80040A6E0004989B3000000000000000000CECDCD0053534E00CCD0
      CE00919794006F747200676B690041413C00C6C5C50000000000000000000000
      0000000000005E5ED2000909D200003FF8000342F9004B76FA004B76FA000342
      F900003FF8000808D0004F4FC2000000000000000000CECDCD0053534E00CCD0
      CE00919794006F747200676B690041413C00C6C5C50000000000000000001ABD
      79008FECCF007AF2D20054ECBC003AE6AA0033E5A40033E5A30033E5A30033E5
      A30035E6A70060F0C90089E8C80012BA7300000000000000000041403D007576
      7500656967004F5151003E403E0031312D00CACACA00CDCDCD00000000000000
      00000000000000000000CDCDCD00CACACA0034332F0075767500656967004F51
      51003E403E003E3D38000000000000000000000000000000000041403D007576
      7500656967004F5151003E403E0031312D00CACACA0000000000000000000000
      00004390C60085DCF50089E5F80068DAF60068DAF600B9F0FC00B8F2FD00B4F2
      FC00A9F1FD00ABF1FC0044A9E200498BB700000000000000000041403D007576
      7500656967004F5151003E403E0031312D00CACACA00CDCDCD00000000000000
      00006464E0000A0ADC000048FB00034BFC004B7CFC000D0DD8000D0DD7004B7C
      FC00034BFC000048FB000A0ADC006868E300000000000000000041403D007576
      7500656967004F5151003E403E0031312D00CACACA00CDCDCD00000000000000
      00001AC07A0063DBAD0095EDD000B1F7E300B7F9E700B7F9E70044EFBA003CEC
      AE0069F3CE0088E9C80014BE7600A8E6CC0000000000000000005E5B58003836
      300036342E0036342E0036342E0036342E0036342E0039373100868682000000
      0000000000008C8B88003A38320036342E0036342E0036342E0036342E003634
      2E0036342E005B585400000000000000000000000000000000005E5B58003836
      300036342E0036342E0036342E0036342E0036342E0039373100868682000000
      00005A89AA006DC5EC009CE8FA005FD6F40061D7F40046B4E6003191D8003595
      DA003797DA003A99DB003E9CDC00409EDD0000000000000000005E5B58003836
      300036342E0036342E0036342E0036342E0036342E0039373100868682000000
      00000B0BE3004D86FE000051FE004B82FD000C0CDC001E1D92001E1D92000C0C
      DC004B82FD000051FE004D86FE000B0BE30000000000000000005E5B58003836
      300036342E0036342E0036342E0036342E0036342E0039373100868682000000
      0000000000004CA47D0017A3660011BA710010BF740010BF740051F5C90071F7
      D30088EAC80016C17800AEE7CF000000000000000000000000003B3933009DA2
      A000BBC1BF00B0B6B3009397950073777500676A6800606362003A383200C4C4
      C400C8C8C8003B3933009CA1A000BBC1BF00B0B6B3009397950073777500676A
      6800606362003A393200000000000000000000000000000000003B3933009DA2
      A000BBC1BF00B0B6B3009397950073777500676A6800606362003A3832000000
      0000000000004CAEE400B0EEFB0066D8F40057D3F300ACEDFB0063B4E5004770
      8B005F6261003A393200000000000000000000000000000000003B3933009DA2
      A000BBC1BF00B0B6B3009397950073777500676A6800606362003A383200C4C4
      C4005858DA000B0BE8004D89FF000B0BE8005457D00093979500737775003435
      AE000B0BE8004D89FF000B0BE8006F6FF10000000000000000003B3933009DA2
      A000BBC1BF00B0B6B3009397950073777500676A6800606362003A383200C4C4
      C400C8C8C8003B3933009CA1A000BBC1BF00B0B6B30011C17600BBFCEA0087EA
      C70015C279002D6246000000000000000000000000000000000036342E00A7AC
      AA00ABB2AF009FA6A3007F8481005D626000535755006063610036342E003634
      2E0036342E0036342E00959A9700ACB3B0009FA6A3007F8481005D6260005357
      5500666968003C3A34000000000000000000000000000000000036342E00A7AC
      AA00ABB2AF009FA6A3007F8481005D626000535755006063610036342E003634
      2E0036342E003B9ADA00ACEEFB0082DDF5004CCEF10082DFF600ABE6F8003996
      D900555959003C3A34000000000000000000000000000000000036342E00A7AC
      AA00ABB2AF009FA6A3007F8481005D626000535755006063610036342E003634
      2E0036342E001D1C9D000C0CEC004D50D3009FA6A3007F8481005D6260005357
      55003132B5000C0CEC006969ED0000000000000000000000000036342E00A7AC
      AA00ABB2AF009FA6A3007F8481005D626000535755006063610036342E003634
      2E0036342E0036342E00959A9700ACB3B0009FA6A3003EA97B0012C3780025A1
      6D004E826C003C3A34000000000000000000000000000000000036342E00AAAF
      AD00ABB2AF009FA6A3007F8481005D626000535755003F3D3800686A6600B7BD
      BA00808683004C4E49004E4D4900ACB3B0009FA6A3007F8481005D6260005357
      55006A6D6C003D3B35000000000000000000000000000000000036342E00AAAF
      AD00ABB2AF009FA6A3007F8481005D626000535755003F3D3800686A6600B7BD
      BA00808683003E87BC008BDAF300ACEAF9003FCBF00045CDF000BBF0FB006DBA
      E700428DC100393732000000000000000000000000000000000036342E00AAAF
      AD00ABB2AF009FA6A3007F8481005D626000535755003F3D3800686A6600B7BD
      BA00808683004C4E49004E4D4900ACB3B0009FA6A3007F8481005D6260005357
      55006A6D6C003D3B35000000000000000000000000000000000036342E00AAAF
      AD00ABB2AF009FA6A3007F8481005D626000535755003F3D3800686A6600B7BD
      BA00808683004C4E49004E4D4900ACB3B0009FA6A3007F8481005D6260005357
      55006A6D6C003D3B35000000000000000000000000000000000036342E00AEB2
      B000ABB2AF009FA6A3007F8481005D6260005357550036342E0094989700B2B9
      B600797F7C00666A680036342E00ACB3B0009FA6A3007F8481005D6260005357
      55006F7270003D3B35000000000000000000000000000000000036342E00AEB2
      B000ABB2AF009FA6A3007F8481005D6260005357550036342E0094989700B2B9
      B600797F7C00507F9F006CC5EB00D7FAFF00CDF6FD00C3F3FD00D2F8FF00C6F1
      FB00409ADA00364D5C000000000000000000000000000000000036342E00AEB2
      B000ABB2AF009FA6A3007F8481005D6260005357550036342E0094989700B2B9
      B600797F7C00666A680036342E00ACB3B0009FA6A3007F8481005D6260005357
      55006F7270003D3B35000000000000000000000000000000000036342E00AEB2
      B000ABB2AF009FA6A3007F8481005D6260005357550036342E0094989700B2B9
      B600797F7C00666A680036342E00ACB3B0009FA6A3007F8481005D6260005357
      55006F7270003D3B3500000000000000000000000000000000003F3D3900A4A7
      A500C3C8C600B3B9B600858A87005D6260005357550036342E009B9F9E00B2B9
      B6007A807D007073720036342E00ACB3B0009FA6A300858986007A7E7C00777B
      7900707471003E3D3500000000000000000000000000000000003F3D3900A4A7
      A500C3C8C600B3B9B600858A87005D6260005357550036342E009B9F9E00B2B9
      B6007A807D00667C8A00439ADA003F97D9003E96D9003E96D9003E97D9004099
      DA00459CDB00489EDC00000000000000000000000000000000003F3D3900A4A7
      A500C3C8C600B3B9B600858A87005D6260005357550036342E009B9F9E00B2B9
      B6007A807D007073720036342E00ACB3B0009FA6A300858986007A7E7C00777B
      7900707471003E3D3500000000000000000000000000000000003F3D3900A4A7
      A500C3C8C600B3B9B600858A87005D6260005357550036342E009B9F9E00B2B9
      B6007A807D007073720036342E00ACB3B0009FA6A300858986007A7E7C00777B
      7900707471003E3D350000000000000000000000000000000000000000003E3C
      35003A383200797B77009EA2A0005E636100535755004746410077797500C4C9
      C700989C9A005D5F5B0045443F00ACB3B0009FA6A3009DA19F0060625E003A38
      32003B3934000000000000000000000000000000000000000000000000003E3C
      35003A383200797B77009EA2A0005E636100535755004746410077797500C4C9
      C700989C9A005D5F5B0045443F00ACB3B0009FA6A3009DA19F0060625E003A38
      32003B3934000000000000000000000000000000000000000000B0AFAD003E3C
      35003A383200797B77009EA2A0005E636100535755004746410077797500C4C9
      C700989C9A005D5F5B0045443F00ACB3B0009FA6A3009DA19F0060625E003A38
      32003B393400A7A5A30000000000000000000000000000000000B0AFAD003E3C
      35003A383200797B77009EA2A0005E636100535755004746410077797500C4C9
      C700989C9A005D5F5B0045443F00ACB3B0009FA6A3009DA19F0060625E003A38
      32003B393400A7A5A30000000000000000000000000000000000000000000000
      000000000000565450008F928F008B8F8E00818482006F726F0036342E003634
      2E0036342E0036342E0094969300C4C9C700BCC1BE00929592004E4C48000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000565450008F928F008B8F8E00818482006F726F0036342E003634
      2E0036342E0036342E0094969300C4C9C700BCC1BE00929592004E4C48000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000565450008F928F008B8F8E00818482006F726F0036342E003634
      2E0036342E0036342E0094969300C4C9C700BCC1BE00929592004E4C48000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000565450008F928F008B8F8E00818482006F726F0036342E003634
      2E0036342E0036342E0094969300C4C9C700BCC1BE00929592004E4C48000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003737300036342E0036342E0036342F00A5A5A100FBFB
      FB00FBFBFB00ADADAA003836300036342E0036342E0038363000C2C2C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003737300036342E0036342E0036342F00A5A5A1000000
      000000000000ADADAA003836300036342E0036342E0038363000C2C2C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C8C8C7003737300036342E0036342E0036342F00A5A5A1000000
      000000000000ADADAA003836300036342E0036342E0038363000C2C2C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C8C8C7003737300036342E0036342E0036342F00A5A5A1000000
      000000000000ADADAA003836300036342E0036342E0038363000C2C2C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000036342E007C807F005559570036342E00FCFCFC000000
      000000000000FCFCFC0036342E007C807F005559570036342E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000036342E007C807F005559570036342E00000000000000
      0000000000000000000036342E007C807F005559570036342E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000036342E007C807F005559570036342E00000000000000
      0000000000000000000036342E007C807F005559570036342E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000036342E007C807F005559570036342E00FCFCFC000000
      0000000000000000000036342E007C807F005559570036342E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000706D6A0036342E0036342E006D6A6700000000000000
      000000000000000000006C6A660036342E0036342E0069676300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000706D6A0036342E0036342E006D6A6700000000000000
      000000000000000000006C6A660036342E0036342E0069676300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000706D6A0036342E0036342E006D6A6700000000000000
      000000000000000000006C6A660036342E0036342E0069676300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000706D6A0036342E0036342E006D6A6700000000000000
      000000000000000000006C6A660036342E0036342E0069676300000000000000
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
      00000000000000000000000000000000000000000000FEFEFE00A5A5F1000000
      000000000000A5A5F100FEFEFE00000000000000000000000000000000000000
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
      000000000000000000000000000000000000000000008F8FEE002020DD00F1F1
      FC00F1F1FD002020D3008F8FE900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003E70AB00496F9D004D72
      9F004C729E004C729E004C729E004A729E004A729F004A729E004A729E004A72
      9E0049729E0049729E0049729E0049729E0049729E0048729E0048739E004872
      9E0047729E0046709B003971AA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C7C7F6002020DD004444
      E1004343D2001F1FC400C6C6F000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000023559100598AB2006EA0C6006294
      BD006696C0006796BF006795BF006895BF006895BD006993BF006995BF006894
      BF006B94BF006B94BD006B94BF006A93BF006C94BF006D92BF006D92BF006E92
      BD006D91BD007B9EC6006185B1003F6E9D0004689A000066990003669A000165
      9900016699000165990001669800016599000165990001669900016599000066
      9900016599000065990000669900006699000066990000659800006698000165
      9800006699000166990004689A0004689A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7E7FB002020DD002020
      DD001E1EB4001E1EB300E7E7F600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFDFF00FCFDFF00F6FA
      FF00F9FCFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000274D7C008ABDE400B4EBFF00B2E0
      FA00B7E6FE00B7E5FF00BAE6FF00BBE6FF00BEE6FF00C1E7FF00C0E7FF00C2E6
      FF00C4E8FF00C7E8FF00C8E8FF00C8EAFF00CBE8FF00CCEAFF00CDE9FF00D0E9
      FF00CFE7FF00D1EBFF009CB9E5005371930004689A0001669900458FB4005297
      BA005297BA005297BA005397BA005297BA005397BA005297BA005297BA00267D
      A8000A6D9E002A85B300348DB900348DB900358EBA00348DB900358EB900348D
      B900348DB900308AB70004689A0004689A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7D7F9002020DD002020
      DD001E1EB1001D1DA200D7D7EE00000000000000000000000000000000000000
      0000000000000000000000000000EEEEEF0099AEC400386898002D5C8C002B5B
      8C003D6D9E004B78A70045729F00A3B4C700F3F3F30000000000000000000000
      000000000000000000000000000000000000244D7B007CADD5009BD3F3005BA3
      E0005FA7E20061A6E10061A5E2005FA3E10060A0E00060A1DE00609FDF00609C
      DF00609BDD00609BDE006098DD005E97DB006095DC006096DA006093DB005E91
      DA005989D400B5D3FB008CABD5004F71940004689A0004689A00F7FAFC00F8FA
      FC00F8FAFC00F8FAFC00F8FAFC00F8FAFC00F8FAFC00F8FAFC00F8FAFC006DA8
      C500187AAA0055B6E3006BCBF6006BCBF6006CCCF7006BCCF7006CCCF7006CCB
      F6006BCBF60063C3EF002084B40004689A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003636E0002020
      DD001F1FC30033339E0000000000000000000000000000000000000000000000
      00000000000000000000000000006188B1004474A50095B8DC003B6A9B004777
      A8006C9CCE004777A8004777A8006393C4004A78A700EBEDEF00000000000000
      000000000000000000000000000000000000234D7C0081B4D7009FD6F6002988
      DE002D8BDF002E8ADF002D88DC002C84DA002B81D900287FD800277BD7002779
      D4002576D4002472D2002371D100226DCF00216ACE001F68CD002066CC001B62
      C9001255C200B7D3FC0094B2DA005070940004689A0004689A00F8FAFC00F9FB
      FD00FAFCFC00FBFDFD00FBFDFD00FBFDFD00FAFDFD00F9FCFC00F8FBFC0075AC
      C8001279AB0030A9E00033ADE30032ABE20032ACE20032ACE20032ACE20033AB
      E20031ABE10035AFE6001481B60004689A002167CD002067CD002067CD002067
      CD002067CD002066CD002067CD002067CD002167CD002167CD002167CD002167
      CD002167CD002067CD002067CD002067CD002067CD002055C9001E1EB9001F1F
      C8001D1DA4001F34B9002067CD002067CD000000000000000000000000000000
      00000000000000000000D2DBE3004272A30095B8DC003F6D9E005282B1007EAB
      D9004777A8006999CB007EACDC004777A8004777A8005982AC00F8F8F8000000
      000000000000000000000000000000000000254D7C007FB1D7009FD8F8003791
      DF003D96E0003F93E1003C91E0003D8FDD003C8CDD003B8ADC003A88DB003A87
      DA003B83D8003880D700397DD700367BD5003578D4003578D2003676D1003170
      D0002766C900B7D7FD0092B1D8005071940004689A0004689A00F8FAFC00FAFC
      FD00FBFDFC00FCFEFD00FCFEFD00FCFEFD00FBFEFD00FAFDFD00FAFDFD0075AC
      C7001078AA002096CD000975AA00066FA300066FA300066EA200066FA200066F
      A300066FA3001A8EC5001180B50004689A002269CE00E0F3FC00DDF3FD00DAF2
      FD00D7F0FD00D4EFFC00D0EEFB00CDEDFC00CAECFC00C5EAFB00C3E9FB00C0E8
      FB00BCE7FB00BAE6FA00B7E6FA00B5E4F9009DC8F2001F1FC3001C2AC4000E7A
      E2001169DA001E1EB8006A88DB00226ACE000000000000000000000000000000
      0000000000000000000095ACC30039699A004E7CAE006D9AC9007BA9D90081B0
      E100A8D2FA0084B4E5004777A80077A7D900C5E3FF005887B700F1F2F3000000
      000000000000000000000000000000000000244D7C007FB1D7009DD5F7003494
      E1003A96E3003E96E0003D91E1003C91E0003A8FDC003A8ADD00398ADA003786
      DB003885D8003682D800357ED700347DD6003479D5003277D2003377D2003072
      CD002568CA00B6D3FD0092B3D8005070940004689A0005689A00F8FAFC00F7F6
      EE00F5F1DE00F6F2DF00F7F2E000F6F2DF00F6F2DF00F6F5E800FBFDFD0076AD
      C8001078AB0028A2D9002098CF001E94CB001E94CB001E94CA001E94CA001D94
      CB001D94CB0026A2DA001180B50004689A00246CCF00E3F5FD00DFF4FD00DCF3
      FC00D9F2FC00D6F0FC00D3EFFC00D0EDFB00CDEDFC00C9EBFB00C7EBFB00C2E9
      FB00BFE8FB00BCE7FB00B9E6FB00B7E5FA004856DB001F1FCC000E7DE70000C5
      FF0000C5FF001551D4001E1EBD00236CD0000000000000000000000000000000
      000000000000000000009AB0C7006191C200C7E0F900B8D8F600BBDDFE0098C9
      FA0096C7F8006595C700B1D9FF00AAD5FF004070A1003D6C9B00EAECEF000000
      000000000000000000000000000000000000254D7C007FB3D7009DD7F7003796
      E0003B98E3003E97E2003C95DF003B91E0003C90DF00398DDC003889DC003989
      DA003787DA003884D7003581D700367DD500337CD4003278D4003377D3002E73
      D0002569CB00B5D3FD0091B2D6005071950004689A0005689900F8FAFC00E8D6
      9D00D5AC3500D6AD3600D8B04000D6AE3800D6AD3600E0C67500FAFCFA0076AC
      C700127AAB0033B0E8003AC2FD003AC2FD003BC3FE003AC3FE003BC2FE003BC2
      FD003AC2FD0036BAF5001281B60004689A002670D100E5F5FE003588DC003588
      DC003588DC003588DC003588DC003588DC003588DC003588DC003588DC003588
      DC003588DC003588DC003588DC003588DC003136DA001F1FD4000E7BEA0000C5
      FF0000C5FF001650D9001F1FC5002670D100000000000000000000000000EFEF
      EF00B7B7B700C6C8CB004C7BAB00ADD6FF00C2E1FF00C8E4FF00C8E4FF00C8E4
      FF00B1D9FF00C2E1FF0096C7F8004A7AAB0095C5F7005686B7005981AA000000
      000000000000000000000000000000000000274D7C007EB3D7009CD8F7003997
      E2003D99E2003F98E3003E96E0003B92E1003A91E0003B8FDD003A8ADD00378A
      DC003888DB003685D9003781D600347ED700357DD600327BD5003578D4002F74
      D200276AC900B3D4FD008FB0D8005072940004689A0005689900F8FAFC00E4CE
      8800CD9B0C00CE9B0C00DFBE6100D3A62500CE9B0B00DBBA5900FAFCFA0076AC
      C700227EAB0076C5E80089D9FC0088D9FC007AD6FD006DD2FD0057CAFD0042C4
      FC003BC2FC0037BAF5001282B60004689A002973D300E8F7FD00E5F5FE00E2F4
      FD00DFF3FD00DBF2FD00D9F1FD00D5F0FC00D2EEFC00CFEDFC00CBECFC00C8EB
      FB00C4E9FB00C0E9FA00BEE7FB00BBE7FA007E99EE002020DA001E28DA000F75
      EB001363E6001F1FD1003943D7002874D30000000000EFEFEF008C8C8C002C2D
      2D0036333000235384006696C800CDE6FF00CBE5FF00C0E0FF00ADD6FF00C8E4
      FF00CFE7FF0091C1F3004777A800C0E0FF00C2E1FF00AAD5FF0039699A004D56
      5E0085888B00F2F1F1000000000000000000254D7C007CB1D7009AD6F7003796
      E3003D9BE4003D97E2003C95E2003D94DF003C90E0003C90DF00398BDC003889
      DC003989DA003785DA003884D700357FD800367CD500337CD5003279D2003173
      D100246CCB00B5D4FD008FB0D8005072940004689A0005689900F8FAFC00E4CE
      8800CD9B0C00D1A11A00ECD9A400DCBA5700CE9B0B00DBBA5800FBFCFA0076AD
      C7002B81AB0089BAD400569BBD004993B8003F90B800368DB7002789B7001784
      B8001382B800259AD0001281B50004689A002A77D500EAF7FE00E7F6FE00E4F5
      FE00E2F4FC00DEF3FD00DBF1FC00D8F1FC00D4EFFC00D1EEFC00CEEDFC00CBEB
      FB00C7EAFB00C3EAFA00C0E9FB00BDE7FA00BAE6FB006073E9002020DD002020
      DC002020DA003B44DE00ABDEF8002B77D500F0F0F00041414100232323003333
      3300413D3700C9DEF60079A9DB00DCEEFF009DCEFF004777A8004373A40072A2
      D40087B7E9003D6D9E0077A7D900BBDEFF00C8E4FF00BEDFFF004676A700D2E9
      FF0083545200823E2B00C2B2B20000000000274D7C007EB3D7009AD7F7003799
      E1003E9BE3003F9AE4003E98E1003C96E0003B92E1003A91DE003B8FDE003A8A
      DB003788DC003988D9003684D9003782D600347ED700357CD600347BD3002F76
      D300266CCC00B3D5FD008EB1D6005071950004689A0005689900F8FAFC00E4CE
      8900CD9B0C00D8B14000F5ECD200E7D08E00CE9C0C00DBBB5900FAFCFA0076AD
      C7002880AB0076B2D0003488B2002680AC002680AC00267FAB00267FAB002680
      AC00267FAC0053A3CA002787B50004689A002D7CD700EDF9FE003588DC003588
      DC003588DC003588DC003588DC003588DC003588DC003588DC003588DC003588
      DC003588DC003588DC003588DC003588DC003588DC003588DC003588DC00337C
      DC003483DC003588DC00AEE2F9002D7CD600E8E8E8002C2C2C00292929003434
      34002726250089888C00BADCFF00CFE7FF0072A2D400B9DCFF00ADD6FF005383
      B4004070A1008BBBED00C8E4FF00BBDEFF00CBE5FF009CCDFE00D2E9FF00C3D8
      E80089460900A97500007B2A0400C3B5BE00274D7C007CB2D7009AD9F7003B9C
      E300419EE500429CE5003E99E3004097E2003F95E1003E92E0003E92DF003D8D
      DD003A8CDC003B89DB003A88DA003A84D7003881D8003880D700377ED5003379
      D4002A6ECE00B3D7FD008EB1D8005071950004689A0005689900F8FAFC00EADB
      AA00D4A92D00E0C16C00FCF6F400F1E1BD00D4A92D00E2CB8200FBFCFA0076AD
      C700267FAB0094CAE300A5D6ED00A3D5EC00A3D5EC00A2D4EC00A3D5EC00A2D4
      EC00A1D3EB00A3D5EC003B8DB60004689A003080D800EFF9FE00ECF8FE00E9F7
      FD00E6F6FD00E3F5FD00E0F4FD00DDF3FD00DAF1FD00D6F0FC00D3EFFB00CFEE
      FB00CDECFB00C9EBFB00C5EAFB00C2E9FB00BFE8FB00BCE7FB00B9E6FA00B6E5
      FA00B5E4F900B2E3F900B0E2FA003080D900F9F9F90046464600424242004040
      400040404100413D3600B0C9E700ADD6FF00CDE6FF008CBCEE00DCEEFF00EDF6
      FF00B4DAFF00C5E3FF00E3F1FF00DCEEFF00B9DCFF00B9DCFF00D5ECF9008A69
      4F00AA750000AD7C00009B5C0000BAA7B400254B7A007DB3D70099D7F7002D95
      E3003197E4003495E3003194E2003090E100308EDE002F89DF002C89DC002B85
      DC002C80D9002880D900297DD800277AD6002677D5002573D4002672D3001F6C
      D0001661CA00B2D4FB0090B3DA005072930004689A0005689A00F8FAFC00F9FB
      FD00F9FBFD00F7D7E300FCC7FD00FAD6F400F9FBFD00F9FBFD00FBFDFD0076AD
      C800237EAB0090CCE800B3E6FC00B4E6FC00B5E7FD00B5E6FD00B5E7FD00B4E6
      FC00B3E6FC00A5DCF500358CB60004689A003284DB00F0FAFE00EEF9FD00EBF8
      FE00E8F7FD00E5F6FD00E3F5FD00DFF4FD00DCF2FD003588DC003588DC003588
      DC003588DC003588DC003588DC003588DC00C1E9FA00BFE7FA00BCE7FB00B8E6
      FA00B6E5FA00B4E4FA00B1E3FA003284DA00000000008F8F8F00404040004E4E
      4E004F4F4F0033333300746E6A00E5F2FE00A3D1FF0087B3E000608EBD00AFD8
      FF00F1F9FF00E8F4FF00D2E9FF00C8E4FF00D4EAFF00E0F5FE00A7A7B300A565
      0000B4850000B185000089400000D7CACD00274D7C007BB0D50098D6F50060AE
      E30065AFE60066B1E40066AEE60065ADE40066ACE30066ABE30066A8E40068AA
      E20066A7E30067A6E10069A5E00067A3E00067A2E00067A0DF00679FDF00679E
      DE005E96DA00B1D5FA008AAED6005072950004689A0005689A00F8FAFC00FAFC
      FC00F9FBFD00C4A2C400EAB0EC00F8C4FA00FBEFFC00FAFCFC00FBFDFD0076AD
      C800227EAB0082C8E800A1DFFB00A1DFFA00A2E0FB00A2DFFB00A2E0FB00A1DF
      FA00A0DFFA0095D6F400328BB60004689A003588DC00F3FBFE00F0FAFE00EDF9
      FE00EAF7FD00E7F6FD00E4F5FD00E2F4FD00DFF3FC00DBF2FC00D8F0FC00D5F0
      FC00D2EFFC00CEEDFB00CBECFB00C8EBFB00C4E9FA00C0E9FB00BEE7FA00BBE7
      FA00B8E5FA00B6E5FA00B3E4FA003589DC0000000000EBEBEB00404040005252
      5200515151005354540039383700808180005972890000000000FCFCFC00CFD5
      DB0093ABC400A8BBCF00D2D6DA00465B7100DDEDF800BBBFCB00A5620000BC92
      0000B68A0000B07F000090524300FBFBFB00294E7E0079B4D800A4E3FF00AAE0
      F900AEE3FA00AFE2FC00B2E0FD00B1E4FB00B4E4FD00B5E4FD00B6E4FE00B9E4
      FF00BAE6FE00BBE5FF00BFE7FF00BFE6FF00BEE4FF00C3E6FF00C4E6FF00C7E8
      FF00C5E5FF00C1E5FF008DB4DE005070930004689A0005689A00F8FAFC00F8F9
      F800F8FAFC00777278004133410087768800F8FAFC00F9FBFD00FBFDFD0076AD
      C8001E7CAB0051A7CF002482B0001A7AA9001B7AA9001B79A9001B7AA9001A7A
      A9001A7AA900479FC8002A88B50004689A00388CDE00F5FBFE00E2DDD700C7B1
      9F00C7B4A400C5B5A700CDC4BC00CFCECA00D3D8D700DDF1FB00DBF1FC00D7F0
      FC00D4F0FC00D1EEFC00CDEDFC00C9E9FA00A3BFED008FA9E7007A91DF005A6B
      D3004B5ACE003640C500B5E4FA00388CDE000000000000000000B2B2B2003D3D
      3D00595959005B5B5B005454540041404000C9C8C70000000000000000000000
      0000000000000000000000000000989B9D00AD732400B47F0000C39A0000BC93
      0000BC900000A15A1600DBD6D60000000000274E7C0071AAD1007AB4DA005286
      B2005C92BA005B8FB9005C8FBB005C8FB9005D8FB9005F8FB9005D8FB9005E8F
      B9005F8FB9005F8FB900608FB900618DB900618EB700618CB900628EB700648E
      B8005984B20087ABCF00779CBF0055779C0004689A0005689A00F8FAFC00FAFC
      FD00FAFCFC00D6D8D80092929300C4C5C500F9FBFD00F9FBFD00F9FBFD0076AD
      C8001A7BAB004BA7D300288AB9002183B4002184B4002083B3002083B3002183
      B4002083B30044A2CE002586B50004689A003A90E000F7FCFE00F4FCFE00F2FB
      FE00CAB7A900B4967F00A7816400A0775700996E4D00B8AB9C00DEF3FC00CBDD
      E500B4BEC300C9DFE900D0EEFC007485DB001212B6001212B6001212B6003239
      C3005567D200BAE6FA00B7E6FA003B90E0000000000000000000000000009999
      9900454545005151510065656500E0E0E0000000000000000000000000000000
      000000000000000000000000000000000000B1948100BC8A0000C9A00000C296
      0000A9620C00D1BEB9000000000000000000274D7A0071A6CD004D7FAB000930
      66001F4A7C001B4678001C4679001C4679001C4679001A4679001A4679001A46
      79001A4679001A4679001A467900194779001947790019477900194679001C4A
      7A0007376D004C7196006C8DAB00597BA20004689A0004689A00F8FAFC00FAFC
      FD00FBFDFD00FCFEFE00FCFEFE00FCFEFE00F9FBFD00F9FBFD00F9FBFD0076AD
      C800187BAB0056B9E50065C7F30064C6F30065C7F30064C6F30065C7F30064C6
      F30064C6F20060C3F0002185B60004689A003C94E200F9FDFE00F6FCFE00F4FB
      FE00F1FAFE00EEF9FE00CABEB3009D735300976B4A00D1D5D400DFF4FD00A4A7
      A8009D9D9D00A9AEB100D3EFFC00A8C1ED001212B6001314B700798EDE00C2E9
      FB00BFE8FB00BDE7FA00B9E6FA003C93E1000000000000000000000000000000
      0000C1C1C1009A9A9A00F5F5F500000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0877900AA6907009E62
      3600D5C5C400000000000000000000000000153E7100598FB90092CFF3002D5A
      8900204B7D002C588900295786002A5787002A5787002A5786002A5788002A57
      88002A5788002A5788002A5788002A5788002A5788002A5788002C598900204D
      80002C5A890094B5CE00577EA6004A76A30004689A0004689A00F8FAFC00F9FB
      FD00FAFCFD00FAFDFD00F9FCFC00FAFDFD00FAFDFE00F9FBFD00F9FBFD0076AD
      C800167BAB004CB7E8005FCCFC005FCCFC0060CDFD005FCDFD0060CDFD0060CC
      FC005FCCFC0058C4F4001D84B60004689A003E96E300FAFDFF00F8FCFF00F6FC
      FE00F4FBFE00F1FAFE00EEF9FE00D3D0CA00B1978300E1ECF100E2F5FD00BBC4
      CA009E9F9F00BCC9CF00D6F0FC00C7E1F8005D69D20099B1E900C8ECFB00C5EA
      FB00C2E9FB00BEE8FB00BCE7FA003F96E3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAF7F600FDFD
      FD0000000000000000000000000000000000EAEFF4002658920068A2C90092CD
      F000245180001F4A7C002350820023508000235080002350810023518100234F
      8100235181002350820023508200235082002350820023518300204D80002552
      830091B3D000688EB1002A68AB000000000004689A0004689A00F7FAFC00F8FA
      FC00F8FAFC00F8FAFC00F8FAFC00F8FAFC00F8FAFC00F8FAFC00F8FAFC0069A5
      C3001278A9003AACE00048BEF30048BEF30049BFF40048BFF40049BFF40049BE
      F30048BEF30044B7EC001680B30004689A004099E400FCFEFF00FAFEFF00F7FC
      FF00F5FCFE00F2FBFF00F0FAFE00EEF9FE00EBF8FD00E8F6FE00E4F5FD00E2F4
      FD00DEF3FC00DCF2FC00D9F1FC00D5F0FC00D1EFFC00CEEDFC00CBECFC00C8EB
      FB00C4EAFB00C1E9FA00BEE8FA004099E4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F528C0071AA
      D20093CDF0007EB7DE0083BBDF0082B7DC0082B6DB0081B7DA0081B4D70081B3
      D70081B2D20081AFD20081AECF0081ADCE0082ABCB0081ACCA007DA6C50090B5
      D1007098B90020569200000000000000000004689A0000669900287EA8002F81
      AB002F82AB002F82AC002F82AB002F82AC002F81AB002F82AB002F81AB001673
      A10003689C000A74A7000D77AB000D77AB000D78AC000D77AB000D78AB000D77
      AB000D77AB000C76A900036B9E0004689A00419BE500419BE500419BE500419B
      E500419BE500419BE500419BE500419BE500419BE500419BE500419BE500419B
      E500419BE500419BE500419BE500419BE500419BE500419BE500419BE500419B
      E500419BE500419BE500419BE500419BE5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F1F5F9002652
      8200598EB9005789B4005589B2005788B3005788B1005787B0005586B1005786
      AF005785AE005784AD005782AC005583AB005781AB005780AA005681A9005A83
      AB0026548400F1F5F900000000000000000004689A0004689A0004689A000468
      9A0004689A0004689A0004689A0004689A0004689A0004689A0004689A000468
      9A0004689A0004689A0004689A0004689A0004689A0004689A0004689A000468
      9A0004689A0004689A0004689A0004689A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008FB0
      D400144380001647820017488400174884001748840017488600174A8500174A
      8600174A8600174C8700174C8700174C8900174C8900174C8900174C8B00134A
      88008FB1D4000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000936645009366
      4500936745009367450093674400936744009366450093674500936745009366
      4400936744009366440093674500936644009366440093674500936744009367
      4400936744009367440000000000000000000000000000000000000000009367
      45009367450093674500936744009367440000000000895E3A00815832007B52
      2B00774F2600764E2400744C2300744C2300764E2400784F27007C522B008158
      3200895E3A0093674500FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003B46E2003A44E20000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003A44E2003B46E2000000
      000000000000000000000000000000000000000000000000000094674500E9D7
      C100E9D7C100E9D7C100E9D7C100E9D7C100E9D7C100E9D7C100E9D7C100E9D7
      C100E8D7C100E8D7C100E8D7C100E8D7C100E8D7C100E8D7C100E8D7C100E8D7
      C100E8D7C10093674500000000000000000094674500E3CAAD00E3CAAD00E4CA
      AD00E3CBAD00E2CAAC00CAAF8E00A07F59008C693F00906A3D00A9835600B893
      6500C5A17300A07B4E00E0DFDE00E0DFDE00A17B4E00C8A37500BC976900AC87
      5A00936D40007F582D00AC967C00E1D9D0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003B46
      E200616BF900616BF9003842E000000000000000000000000000000000000000
      0000000000000000000000000000000000003842E000616BF900616BF9003B46
      E20000000000000000000000000000000000000000000000000095694500E8D8
      C300E8D8C300E8D8C300E8D8C300E8D8C300E8D8C300E8D8C300E8D8C300E8D8
      C300E9D8C300E9D8C300E9D8C300E9D8C300E9D8C300E9D8C300E9D8C300E9D8
      C300E9D7C30095684600000000000000000095694500E4CBAE00E4CBAE00A073
      480098693F00B79067007E592E00A6815400C19E7000D2AF8200D6B48600D9B7
      8900DAB88A00A8845600EAEAEA00EAEAEA00A8845600DAB88A00D9B78900D7B5
      8700D4B18300C5A17400AA855700805B33000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003A44E1005660
      F100737CFE007E87FE00626CF9003842E0000000000000000000000000000000
      00000000000000000000000000003842E000626CF9007E87FE00737CFE005660
      F1003A44E100000000000000000000000000000000000000000097694600E9D9
      C400E9D9C400E9D9C400E9D9C400E9D9C400E9D9C400E9D9C400E9D9C400E9D9
      C400E9D8C500E9D8C500E9D8C500E9D8C500E9D8C500E9D8C500E9D8C500E9D8
      C500E9D9C40097694600000000000000000097694600E5CDB100E5CDB100E6C3
      9600D6AA70009C6F45008C683D00B9956700DDBB8E00DDBB8E00DDBB8E00DDBB
      8E00DDBB8E00AB875800F3F3F300F3F3F300AB875800DDBB8E00DDBB8E00DDBB
      8E00DDBB8E00DDBB8E00B9966800846238000000000000000000000000000000
      000000000000000000000000000000000000000000000000000005793A00ECF7
      F100000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003842E0004C54EA006169
      F6006972FC00757FFE00848DFE00636DFA003842E00000000000000000000000
      000000000000000000003842E000636DFA00848DFE00757FFE006972FC006169
      F6004C54EA003842E00000000000000000000000000000000000986A4600E9DA
      C600E9DAC6001E6F27001E6F2700E9DAC6007E5019007E501900E9DAC6001015
      A6001015A600EADAC600EADAC600EADAC600EADAC600EADAC600EADAC600EADA
      C600E9D9C600986A46000000000000000000986A4600E5CFB300E5CFB300FDE8
      CF00F4D9B800A87D5200C3A886008A643400CEAC7E00DFBE9100DFBE9100DFBE
      9100DFBE9100AD895A00FAFAFA00FAFAFA00AD895A00DFBE9100DFBE9100DFBE
      9100DFBE9100CDAB7E008A643400C3B39F000000000000000000000000000000
      000000000000000000000000000000000000000000000E82450063CE9D001084
      4700EEF8F2000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003741DF00464FE7005961
      F100626BF8006B74FE007882FE00828CFE00616BF9003943E100000000000000
      0000000000003943E100616BF900828CFE007882FE006B74FE00626BF8005961
      F100464FE7003741DF00000000000000000000000000000000009A6B4700EADC
      C800EADCC8005DAE66001E6F2700EADCC800C89A63007E501900EADCC8006365
      F1001015A600EBDBC800EBDBC800A9754E00A9754E00A9754E00A9754E00EBDB
      C800EBDBC8009A6B470000000000000000009A6B4700E6D1B600E6D1B600E6D0
      B500E6D0B600E6D0B600E6CFB6009D7C540096704100D9B98B00E1C19400E1C1
      9400E1C19400AF8B5D00FFFFFF00FFFFFF00AF8B5D00E1C19400E1C19400E1C1
      9400D9B88B0096704100997C5800FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000D84440072D1A7006DD0A40066CE
      9F000F874700E7F3EB0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003741DF004851
      E8005C64F300646CF9006A73FD00747DFE007B85FE005D67F7003B46E2000000
      00003B46E2005D67F7007B85FE00747DFE006A73FD00646CF9005C64F3004851
      E8003741DF0000000000000000000000000000000000000000009A6C4800EADC
      CA00EADCCA005DAE66001E6F2700EADCCA00C89A63007E501900EADCCA006365
      F1001015A600EADDCA00EADDCA00EADDCA00EADDCA00EADDCA00EADDCA00EADD
      CA00EADCCA009B6C480000000000000000009A6C4800E7D2B900E7D2B900A073
      480098693F00B9926B00E7D2B900E3CEB4009B784D00946E3D00D2B08300E3C3
      9600E3C39600B18D5E00BBBBBB00BBBBBB00B18D5E00E3C39600E3C39600D2B0
      8300946E3D0081572800F5F2EE00FF00FF000000000000000000000000000000
      00000000000000000000000000000D86440080D7B0007ED5AE0076D2A9006DD0
      A40065CD9F0010894700EAF5ED00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003741
      DF004851E8005A62F200616AF700666FFA006D76FE00717BFE006B74FE003B46
      E2006B74FE00717BFE006D76FE00666FFA00616AF7005A62F2004851E8003741
      DF000000000000000000000000000000000000000000000000009C6E4800EBDE
      CC00EBDECC005DAE66001E6F2700EBDECC00C89A63007E501900EBDECC006365
      F1001015A600EBDECC00EBDECC00EBDECC00EBDECC00EBDECC00EBDECC00EBDE
      CC00ECDECC009D6D490000000000000000009C6E4800E7D4BD00E7D4BD00E6C3
      9600D6AA70009C6F4600E7D4BD00E7D4BD00AF7E5800956539008E653400BE9B
      6C00DDBD9000B08C5C0088BBEA0088BBEA00B28E5E00DDBD9000BE9B6C00936D
      3D00B49773009C6C4600FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000004823D008FDAB9008FDAB90086D8B3007DD5AE0074D2
      A8006ACFA20061CC9D000F8B4800EDF6F0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003741DF004750E7005860F1005D65F400616AF700646DF9006770FB006770
      FB006770FB00646DF900616AF7005D65F4005860F1004750E7003741DF000000
      00000000000000000000000000000000000000000000000000009F6E4900ECDF
      CF00ECDFCF00ECDFCF00ECDFCF00ECDFCF00C89A63007E501900ECDFCF006365
      F1001015A600ECDFCF00ECDFCF00A9754E00A9754E00A9754E00A9754E00ECDF
      CF00ECE0CF009F6D490000000000000000009F6E4900E8D7C000E8D7C000FDE8
      CF00F4D9B800A87D5300E8D6C000E8D6C100E8D7C100E8D7C000DDCAB000B1A3
      900075858E005A7D9A00597C99005B7D9B00597C990074838D00AEA08A00DCC7
      AE00E8D6C0009F6F4800FF00FF00FF00FF000000000000000000000000000000
      0000000000000C8846009CDFC1009FE0C30098DDBF008EDBB80085D7B2007AD4
      AB006FD1A60065CE9F005CCB9A000F8D4A00EDF6F00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003640DE00424AE3004E55E900575FF0005A62F2005C64F3005C64
      F3005C64F3005A62F200575FF0004E55E900424AE3003640DE00000000000000
      0000000000000000000000000000000000000000000000000000A06F4A00ECE1
      D100ECE1D100ECE1D100ECE1D100ECE1D100C89A63007E501900ECE1D1006365
      F1001015A600EDE1D100EDE1D100EDE1D100EDE1D100EDE1D100EDE1D100EDE1
      D100ECE1D100A06F49000000000000000000A06F4A00E9D9C400E9D9C400E9D9
      C300E9D9C400E9D9C400E9D9C400E9D9C400E9D9C400E9D9C400DAD0C100B5BA
      BB007A9FC1007DAEDB0078ABDA0076A9D8006193C0006E98BD00B4BABA00DACF
      C100E9D8C300A0704A00FF00FF00FF00FF000000000000000000000000000000
      0000098C4700A5E1C600ADE4CC00A7E2C8009FDFC30095DCBC008AD9B6007ED6
      AE0072D1A80068CEA0005ECB9A0057C997000E904C00CAE2CB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003640DE004E55E900575FF0005A62F2005C64F3005C64
      F3005C64F3005A62F200575FF0004E55E9003640DE0000000000000000000000
      0000000000000000000000000000000000000000000000000000A2714B00EDE3
      D400EDE3D400EDE3D400EDE3D400EDE3D400EDE3D400EDE3D400EDE3D4006365
      F1001015A600EDE3D300EDE3D300EDE3D300EDE3D300EDE3D300EDE3D300EDE3
      D300EDE3D400A2714A000000000000000000A2714B00EBDAC700EBDAC700A073
      480098693F00BA946E00EADBC700EADBC700DCC4AD00DAC2AA0095A0AA007B9A
      B70091BEE7008DBEEB0089BCEA0087BAE90075A8D6005A8CBB007296B6009EAD
      B800EADBC600A1704A00FF00FF00FF00FF000000000000000000000000000990
      4800A7E2C800B8E7D200B5E6D000AEE4CC00A4E1C60099DDBF0026B4660088D9
      B40075D2A9006ACFA20060CC9B0057C9960051C79400048C4100D4E8D5000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003640DE00575FF0005A62F2005C64F3005C64
      F3005C64F3005A62F200575FF0003640DE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A3724B00EEE4
      D600EEE4D600EEE4D600EEE4D600EEE4D600EEE4D600EEE4D600EEE4D6006365
      F1001015A600EEE4D600EEE4D600A9754E00A9754E00A9754E00A9754E00EEE4
      D600EEE4D600A4724B000000000000000000A3724B00EBDCCA00EBDCCA00E6C3
      9600D6AA70009D704600EBDECA00ECDDCA00AF7F5A00A7744D005977940081AD
      D400ACCFF00091C0EB0088BBEA0088BBEA0088BBEA0072A4D3005F90BC006083
      A400E7DBC800A4724B00FF00FF00FF00FF00000000000000000007934700A1E1
      C400B8E7D200BEE9D600B7E7D300AFE5CD00A3E0C6000C954900000000001FAD
      5F0083D7B2006BD0A20060CC9C0058C9960051C8930051C793000E974D00D9EB
      DA00000000000000000000000000000000000000000000000000000000000000
      000000000000000000003640DE004E55E900575FF0005A62F2005C64F3005C64
      F3005C64F3005A62F200575FF0004E55E9003640DE0000000000000000000000
      0000000000000000000000000000000000000000000000000000A5744B00EFE6
      D800EFE6D800EFE6D800EFE6D800EFE6D800EFE6D800EFE6D800EFE6D8006365
      F1001015A600EEE6D800EEE6D800EEE6D800EEE6D800EEE6D800EEE6D800EEE6
      D800EEE6D800A6724B000000000000000000A5744B00EBDFCF00EBDFCF00FDE8
      CF00F4D9B800A87D5300ECE0CF00ECE0CF00ECDFCE00DCD1C1002A364E0086B2
      D900BCD9F30097C4EC0089BCEA0088BBEA0088BBEA0087BAE9005E8AB5001A20
      3400D7CCBF00A6734C00FF00FF00FF00FF0000000000029143008FDBB900AEE4
      CC00B4E6D000B8E7D200B5E6D000A7E2C8000B974B0000000000000000000000
      00001FAD5F007CD5AD0060CC9C0057CA960051C8930050C7920051C792000E98
      4E00DCEDDD000000000000000000000000000000000000000000000000000000
      0000000000003640DE00424AE3004E55E900575FF0005A62F2005C64F3005C64
      F3005C64F3005A62F200575FF0004E55E900424AE3003640DE00000000000000
      0000000000000000000000000000000000000000000000000000A8744C00EFE8
      DC00EFE8DC00EFE8DC00EFE8DC00EFE8DC00EFE8DC00EFE8DC00EFE8DC00EFE8
      DC00EFE7DB00EFE7DB00EFE7DB00EFE7DB00EFE7DB00EFE7DB00EFE7DB00EFE7
      DB00F0E7DC00A7744C000000000000000000A8744C00EDE1D200EDE1D200EDE1
      D100ECE1D100ECE1D100EDE1D200EDE1D200EDE1D100D5CCC00018192B00779A
      BE00BCD7F000A0C9EE008ABCEB0088BBEA0088BBEA0085B7E600597FA8000E0E
      2000CFC6BB00A7744C00FF00FF00FF00FF00000000000000000019A35900A0E0
      C300AEE4CC00B0E4CD00A4E1C5001DA35B000000000000000000000000000000
      00000000000023B1630073D1A80056C9960050C792004FC791004FC7920051C7
      9100119C5100DDEEDE0000000000000000000000000000000000000000000000
      00003741DF004750E7005860F1005D65F400616AF700646DF9006770FB006770
      FB006770FB00646DF900616AF7005D65F4005860F1004750E7003741DF000000
      0000000000000000000000000000000000000000000000000000A9754D00EFE9
      DD00EFE9DD00A9754E00A9754E00A9754E00A9754E00A9754E00A9754E00A975
      4E00A9754E00A9754E00A9754E00A9754E00A9754E00A9754E00A9754E00DFD3
      C500E6DBCD00A8764D000000000000000000A9754D00EEE4D500EEE4D500A073
      480098693F00BB977200EEE3D500EEE3D500DFCBB800C6B7A70018182A001919
      2A0096A9C1009ABAD9008BBBE90087BAE90085B7E6006D94BE000E0E20000E0E
      2100CFC7BC00A9754D00FF00FF00FF00FF000000000000000000000000001CA7
      5C009DDFC200A6E2C700109F5100000000000000000000000000000000000000
      0000000000000000000023B163006BD0A2004FC792004FC7920050C7920050C7
      920050C79100139E5300E3F1E400000000000000000000000000000000003741
      DF004851E8005A62F200616AF700666FFA006D76FE00717BFE006B74FE003B46
      E2006B74FE00717BFE006D76FE00666FFA00616AF7005A62F2004851E8003741
      DF00000000000000000000000000000000000000000000000000AA774E00F0EB
      E000F0EBE000F0EBE000F0EBE000F0EBE000F0EBE000F0EBE000F0EBE000F0EB
      E000F1EBE000C5B19E00BCA69100BCA69100BCA69100BCA69100BCA69100BCA6
      9100BBA59100915F3700FDFDFD0000000000AA774E00EFE6D800EFE6D800E6C3
      9600D6AA70009D704700EFE6D800EFE6D800B0805B0096694900171729002B2B
      3B000F0F2100101022004E6684007FAED9006A90B9000E0E20000E0E20000F0F
      2200D2CAC000AA774E00FF00FF00FF00FF000000000000000000000000000000
      00001AA85A0016A5570000000000000000000000000000000000000000000000
      000000000000000000000000000024B3650063CD9E0050C792004FC7920050C7
      920050C7920051C792000C9B4D000000000000000000000000003741DF004851
      E8005C64F300646CF9006A73FD00747DFE007B85FE005D67F7003B46E2000000
      00003B46E2005D67F7007B85FE00747DFE006A73FD00646CF9005C64F3004851
      E8003741DF000000000000000000000000000000000000000000AD784F00F1EC
      E200F1ECE200F1ECE200F1ECE200F1ECE200F1ECE200F1ECE200F1ECE200F1EC
      E200F1ECE200C9B8A700CD916200C98D5E00C3875A00BC815400B47A4E00AC73
      4700A36A40009A6238000000000000000000AD784F00EFE8DC00EFE8DC00FDE8
      CF00F4D9B800A87D5300EFE8DC00EFE8DC00EFE8DC00DDD7CE00232A3F002B2C
      3D0017172800101022000E0E20000E0E20000E0E20000E0E200010102300161A
      2E00D8D1C900AD784F00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000020AF61005FCC9A004FC7920050C7
      920051C89300088D46000000000000000000000000003741DF00464FE7005961
      F100626BF8006B74FE007882FE00828CFE00616BF9003943E100000000000000
      0000000000003943E100616BF900828CFE007882FE006B74FE00626BF8005961
      F100464FE7003741DF0000000000000000000000000000000000AF794F00F1ED
      E400F1EDE400A9754E00A9754E00A9754E00A9754E00A9754E00A9754E00A975
      4E00A9754E00BC9A7F00C98D5F00E9D7C100E9D7C100EBDBC800EDE1D200F0E7
      DC00F1ECE200FAF8F5000000000000000000AF794F00F0EBDF00F0EBDF00F0EB
      DF00F0EADF00F0EADF00F0EADF00F0EADF00F0EADF00E9E5DB006D7A8A002224
      3600363645003E3E4C00101022000E0E20000E0E20000E0E2000101022005059
      6900E6E0D500AF784F00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001BAA5C005ACA980053C8
      94000A964B00000000000000000000000000000000003842E0004C54EA006169
      F6006972FC00757FFE00848DFE00636DFA003842E00000000000000000000000
      000000000000000000003842E000636DFA00848DFE00757FFE006972FC006169
      F6004C54EA003842E00000000000000000000000000000000000AF7A5000F2EF
      E500F2EFE500F2EFE500F2EFE500F2EFE500F2EFE500F2EFE500F2EFE500F2EF
      E500F2EEE600D4C6B800C4895B00E9D7C100EADBC800EDE1D100EFE7DB00F1EC
      E200F9F7F300000000000000000000000000AF7A5000F1ECE100F1ECE100A073
      480098693F00BB997500F1ECE200F1ECE200E1D2C200DECEBD00BDB4AB002120
      310016182B0036374600161627000E0E20000E0F210012132500191A2A00C6C6
      C300EFEADF00AF795000FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000011A05200139F
      53000000000000000000000000000000000000000000000000003A44E1005660
      F100737CFE007E87FE00626CF9003842E0000000000000000000000000000000
      00000000000000000000000000003842E000626CF9007E87FE00737CFE005660
      F1003A44E1000000000000000000000000000000000000000000B17B5100F2EF
      E700F2EFE700F2EFE700F2EFE700F2EFE700F2EFE700F2EFE700F2EFE700F2EF
      E700F2EFE700D8CCBF00BF845600EBDBC800EDE2D200EFE8DB00F1ECE200F8F6
      F10000000000000000000000000000000000B17B5100F1EEE500F1EEE500E6C3
      9600D6AA70009D704700F1EDE400F2EDE500B0805C00A9754E00A6734D008C6C
      5800565B67001E2438001416290014172B001E2539004449570088695500EDE9
      E100F1EDE400B17A5000FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003B46
      E200616BF900616BF9003842E000000000000000000000000000000000000000
      0000000000000000000000000000000000003842E000616BF900616BF9003B46
      E200000000000000000000000000000000000000000000000000B27C5100F3F0
      E800F3F0E800A9754E00A9754E00A9754E00A9754E00A9754E00A9754E00A975
      4E00AA764F00CDB6A200B87E5100EDE1D100EFE8DB00F1ECE200F7F5EF000000
      000000000000000000000000000000000000B27C5100F2EFE700F2EFE700FDE8
      CF00F4D9B800A87E5400F1EFE700F2EFE700F3EFE700F2EFE700F1EFE700F1EE
      E500ECE9E200E0DDD800DBD8D200DBD8D200E0DDD700E9E7E000F1EEE600F1EF
      E600F1EFE600B27C5100FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003B46E2003A44E20000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003A44E2003B46E2000000
      0000000000000000000000000000000000000000000000000000B37D5200F3F1
      EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1
      EA00F3F1EA00E2DAD000B1774B00EFE7DB00F1ECE200F6F3ED00000000000000
      000000000000000000000000000000000000B37D5200F3F0E800F3F0E800F3F1
      E900F2F0E900F2F0E900F2F1E900F3F1E900F3F0E900F2F1E900F2F1E900F2F0
      E800F3F0E800F3F0E900F3F1E900F3F1E900F2F1E900F2F0E900F2F0E900F2F1
      E800F2F1E800B47C5100FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B57D5200F3F1
      EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1
      EA00F3F1EA00EBE6DD00A9714500F1ECE200F5F2EB0000000000000000000000
      000000000000000000000000000000000000B57D5200F3F1EA00F3F1EA00F3F1
      EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1
      EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1
      EA00F3F1EA00B47C5100FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B57D5200B57D
      5200B57D5200B57D5200B57D5200B57D5200B57E5200B57D5200B57D5200B57D
      5200B57D5200B57D5200A2693F00F7F5EF000000000000000000000000000000
      000000000000000000000000000000000000B57D5200B57D5200B57D5200B57D
      5200B57D5200B57D5200B57D5200B57D5200B57E5200B57E5200B57D5200B57D
      5200B57D5200B57D5200B57D5200B57D5200B57D5200B57D5200B57D5200B57D
      5200B57D5200B57D5200FF00FF00FF00FF000000000000000000000000000000
      000000000000000000000000000000000000CFDDD200A1BBA500779577006789
      68006789680077957700A1BCA600CFDDD2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001A751C001A751C000B6F0F000B6F
      0F000B6F0D000B6F0D00086B0B00086B0B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AFC4B200305F32002B592C002B5629003B704300447D
      5000447D50003B7043002B5629002B592C00305F3200AEC4B200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001A751C0072D2880022C34D0022C3
      4D0022C24B0022C24B001DAC3B00086B0B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6BDE2002A17
      96005C49AF00E4DFF20000000000000000000000000000000000000000000000
      0000DCE7DF00678E6B002C5D2E003F784A006BB68B0086DBB10087DEB30084D8
      AE0084D8AE0087DEB30086DBB1006BB68B003F784A002C5D2E00678D6B00DCE7
      DF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001A751C006ED0840021C04D0021BE
      4C0021BE4A0021BE4A001CA83900086B0B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3BBDF0012008D001300
      8E000E008C0036249E00DBD8EA0000000000000000000000000000000000D0DF
      D3002F6437002C61330070B78E008EDFB7007ED1A40069BD85005AB4740059B2
      710059B271005AB4740069BD85007ED1A4008EDFB70070B78E002C6133002F63
      3700CFDFD3000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001A751C006ED1840021C04F0021C0
      4F0021C04D0021BE4C001CAA3B00086B0B000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E1E0
      EE00E5E5F000E5E4EF00E5E5EF00000000000000000000000000000000000000
      000000000000000000000000000000000000C2B9DE0012008D0015008E001800
      90001800900008008800A597CE00000000000000000000000000DCE8E0002F68
      3A003873440088D3AC008AD7AE0061B87C0050AE660054B16C0056B26E0056B2
      6E0056B26E0056B26E0054B16C0050AE660061B87C008AD7AE0088D2AC003874
      44002F683A00DCE8E00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001A751C006ED0860021C2500021C2
      4F0021C04F0021C04F001CAB3C00086B0B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CFC9DF003C32
      41002F2920003029240029241E00645A6800DCDAEA0000000000000000000000
      0000000000000000000000000000C3BCDF0014008E0016008E00180090001800
      90000F008A00523FAB00E4E3EF00000000000000000000000000679571002B67
      38008DD4AF008AD6AD0055B16C0056B06E0059B2720059B2720059B2720059B2
      720059B2720059B2720059B2720059B2720056B06E0055B16C008AD6AD008DD4
      AF002B6737006895720000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001A751C006ED287001EC353001EC2
      520021C2500021C24F001CAD3E00086B0B000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005F555A000000
      00000000000000000000000000001A131B00CDC9D70000000000000000000000
      00000000000000000000C6BEE00015008C0015008E0018009000180090000F00
      8A005D4BB000E3E2EF00000000000000000000000000B0CAB7002A6A39007BBD
      970096DCB6005AB170005BB471005DB574005DB574005DB5740055B16D004FAE
      67005DB573005DB574005DB574005DB574005DB574005BB471005AB1700096DC
      B6007BBD97002A693800B0CBB800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001A751C006FD58C0021C5550021C3
      53001EC353001EC252001CAF3F00086B0B000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005F5955000000
      000000000000000000000000000031293000D5D1DF0000000000000000000000
      000000000000C8C2E20013008D0014008E00180090001800900011008C006B59
      B500E4E3F000000000000000000000000000000000002F75440042865900A6E5
      C7006CBD84005BB371005EB675005EB675005EB575004EAE670080C69300CAE9
      D20041A95D005DB574005EB675005EB675005EB675005EB675005BB371006ABD
      8400A6E5C700428659002E744300000000000100AF000301CD000000CA000000
      CA000000C9000000C9000000C8000000C8000000C8000000C6000000C6000000
      C4000000C4000000C4000000C3000000C2000000C2000100C0000100BF000200
      BE000300BD000200BC000200BD000000AD000000000000000000000000000000
      0000000000000000000000000000000000001A751C005CCB7C001FC658001FC6
      570021C5550021C355001BAE4200086B0B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000615A58000000
      0000000000000000000000000000221C1F00D3D0DE000000000000000000E1E0
      EE009285C8001F05920013008D00180090001700900016018F006E59B600E5E4
      F00000000000000000000000000000000000D1E3D70028713E0084C4A00097D8
      B30058B16E0061B6790061B6790061B6780051AF69008BCB9B00FFFFFF00FFFF
      FF00D1EBD9004DAD66005FB5770061B6790061B6790061B6790061B6790058B1
      6E0097D8B30084C4A00028713E00D2E3D8000C0CD9006288FF00274CFF002A4C
      FF00294AFF002748FF002342FF00223FFF001F3DFF001E3BFF001C36FF001A33
      FF001930FF00172DFF001528FF001424FF001220FF00111BFF001018FF000F14
      FF000E12FF000D0DFF000909FF000500CD00208329001A751C001A751C001A75
      1C001A751C001A751C001A751C001A751C00086B0B005CCB7C001FC85B001FC6
      5A001FC658001FC658001BAE4200086B0B00086B0B00086B0B00086B0B00086B
      0B00086B0B00086B0B00086B0B00086B0B000000000000000000615A58000000
      00000000000000000000000000002B232800D3CFE100988BCC00766ABB004530
      A5000D00890017008F0018009000180090001700900016018F009F93CE00E3E3
      EF0000000000000000000000000000000000A5C8B00024743E00B0E6CB007DC6
      960062B6770066B97C0065B87B004EAE6800A0D6AF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DFF1E30049AC640063B7790066B97C0066B97C0066B97C0062B6
      77007DC69600B0E6CB0024743E00A6C9B2001D1CE3005E84FF002A4DFF002C4F
      FF002749FF002749FF002645FF002443FF00233EFF00203BFF001D39FF001C37
      FF001B33FF001830FF00172DFF00152AFF001426FF001323FF00111EFF00101B
      FF000F17FF000E14FF000E12FF000200DB00278D340046CE78001BB44D001BB4
      4D001BB44D001BB44D001BB44D001BB44D001BB44D005CCB7C001FC95E001FC9
      5D001FC85B001FC65A001BAE42001BAE42001BB44D001BB44D001BB44D001BB4
      4D001BB44D001BB44D001BAE420010801C000000000000000000615A58000000
      000000000000000000000000000040383E00D3CFE60030179D00000082001100
      8B001D0091001B008F0012008B0016008F00180090001700900015008E004430
      A100D1CBE50000000000000000000000000075AC8900408D5C00B5E7D1006DBC
      830067B97B0068B97D005FB57600B5DFC000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E9F5ED0058B3700065B87A0069BA7D0069BA7D0067B9
      7B006DBC8300B5E7D100408D5C0075AB8900534FF00086A3FF003057FF002C50
      FF002C4FFF002B4EFF002A49FF002749FF002645FF002542FF00233EFF00203B
      FF001C39FF001D37FF001B36FF001830FF00172DFF00152AFF001426FF001323
      FF00111EFF00101BFF001019FF000300E5002890350055ED9F0018D16D001ED3
      6E001ED16D001ED16B001ED069001ED068001ECE66001FCD63001FCD62001FCB
      60001FC95E001FC95D001FC85B001FC65A001FC658001FC658001FC5570021C5
      550021C353001EC3530021C04F0012831D000000000000000000615A58000000
      00000000000000000000000000002D272900D4D1E600C1BBE000BCB3DD00A59A
      D0008E85C3009589C800A195D1002209940017008F0018009000180090001200
      8C001D058E00DAD7EA00000000000000000066A27D004D996E00B3E5CD006DBB
      82006ABA7F0068B97D007CC49000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFD
      FC00FFFFFF00FFFFFF00FFFFFF00F2F9F40056B06E0067B87D006CBB81006ABA
      7F006DBB8200B3E5CD004D996E0066A27D004D4AF500A2BAFF007994FF005F7E
      FF00456AFF003257FF00294EFF00284CFF002847FF002547FF002545FF002441
      FF002340FF00203BFF001C39FF001D37FF001B36FF001830FF00172EFF00152B
      FF001426FF001323FF001221FF000200EE002893380055F0A20018D471001CD5
      73001CD571001CD36E001ED16D001ED16B001ED069001ED068001ECE66001FCD
      65001FCD62001FCB60001FC95E001FC95D001FC85B001FC85B001FC657001FC6
      58001FC5570021C5550021C04F00128720000000000000000000615A58000000
      000000000000000000000000000001010000473D5800B4B0BB00C8C4CE00B0AC
      B5009996A000A9A5AE00D5D2DF00C2BBDF001A028F0018009000180090001800
      90000D0089007566BA00000000000000000065A67E00509C6F00B9E6D00071BD
      86006DBB82006FBB840065B77C0076C28900FFFFFF00FFFFFF0099D2A80051AF
      6A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFDFA0068B87D0069B87F006DBB
      820071BD8600B9E6D000509C6F0065A67E004E4BFA00A0BAFF007594FF007897
      FF007995FF007594FF006B8BFF006080FF004A6CFF004467FF003356FF003453
      FF002041FF00203DFF001E3BFF001B36FF001934FF001832FF001630FF00132B
      FF001229FF001226FF001025FF000000F70029963B0053F2A50017D875001CD8
      76001CD674001CD573001CD571001CD36E001ED36D001ED16B001ED069001ED0
      68001ECE66001FCE65001FCD63001FCB60001FCB5E001FC95D001FC85D001FC8
      5B001FC65A001FC6580021C04F00128B23000000000000000000615A58000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000060501000000000030263A00CCC6E500220B930018009000180090001800
      900014008E00270E9500E0DEED000000000074B08D0040956400C3EBDA0076BF
      8B0070BD850072BE870072BE870068B87E0085C996009FD3AD0061B679006BBA
      810071C08700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0076C18A006DBB
      820076BF8B00C3EBDA004095640073B08D004F4CFF009FB9FF007292FF007494
      FF007594FF007493FF007491FF006E8FFF006F8EFF006D8CFF006C8BFF006B89
      FF006B87FF006786FF006683FF00647FFF00637DFF006079FF005F78FF005D75
      FF005A72FF00556EFF005771FF003F3EFF00299B3E004FF4A70014DA770017DA
      790017D8770018D7760018D4710018D5700019D46F001BD370001ED36E001ED1
      6B001ED069001ED068001ECE66001DCD64001CCC61001BC95F001BC95D001BC7
      5B001BC65A001BC658001FC65A00128E26000000000000000000615A58000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002E273E00ACA1D600210A920018009000180090001800
      900017008F0010008E00D8D5EA0000000000A5CFB70020854A00C4EADB008ECE
      A20070BD840074C0890074C0890074C0890070BD85006DBC820074C0890074C0
      89006CBB810076C28900FFFFFF00FFFFFF00FFFFFF00FFFFFF008BCB9C006CBB
      80008ECEA200C4EADB001F844900A7D1B9005755FF00B4CCFF009EB8FF00A0B9
      FF00A0B9FF00A0B9FF009FB7FF009FB7FF009AB5FF009BB4FF0098B3FF0097B1
      FF0094ADFF0093ABFF0092AAFF0091A8FF008FA6FF008EA6FF008C9FFF008A9F
      FF00889EFF00889DFF0086A0FF00514EFF002B9E41006CFFBD004CEFA3004EF0
      A2004FEE9F004FEE9E004FED9C0051EB9B0053E89A0018D570001CD571001CD3
      70001ED36E001ED16D001DCF68001CCC610054E38F0052E38D0052E28B0052E0
      890052E0880052DD860055E28A001E9832000000000000000000615A58000000
      000000000000000000000000000000000000000000000E0B0800100E09000D0B
      08000E0C08000D0A0700564A5E00CFC9E5001F09930018009000180090001800
      900014008E002A119600E0DEED0000000000D2E8DB00218B4F0099CFB400B2E0
      C7006EBB7F0079C18A0079C18A0079C18A0079C18A0079C18A0079C18A0079C1
      8A0079C18A006EBB81008FCD9F00FFFFFF00DDEFE1006CBD800072BD85006EBB
      7F00B2E0C70099CFB400208A4E00D3E8DD00463EFF005D5BFF005B58FF005B58
      FF005B58FF005B58FF005B58FF005B58FF005C58FF005C58FF005C58FF005B58
      FF005B58FF005B58FF005B58FF005A58FF005A58FF005A58FF005B58FF005B56
      FF005B56FF005A56FF005C58FF00463EFF00249E3C00249E3C00249E3C00249E
      3C00249E3C00249E3C00249E3C00249E3C00249E3C006EE5A0001CD876001CD6
      73001CD571001CD3700019C35E00128C2300128C2300128C2300128C2300128C
      2300128C2300128C2300128C2300128C23000000000000000000615A58000000
      000000000000000000000000000002010000857C9000BAB6BF00B3ADB800B4AE
      B900B5B0BB00BAB5BF00D9D6E300B8B0DB0014018D0018009000180090001800
      90000D008A007866BA000000000000000000000000002994590045A26F00CFED
      E50088CB9C0077BF89007CC28E007CC28E007CC28E007CC28E007CC28E007CC2
      8E007CC28E007CC28E0072BD850086CA98006AB97E007AC08C0077BF890088CB
      9C00CFEDE50045A26F0027935800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001E9832006EE5A0001BD979001CD9
      78001CD876001CD6740019C35E001E9832000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000615A58000000
      00000000000000000000000000001B161600D2CEE3008B79C6004E3BAA005C45
      AD006449B0006A54B4006350B3001800910017008F0018009000170090001400
      8D0013008C00D7D3E800000000000000000000000000B0D8C200209154009ED2
      B800C6E8DC007AC28B007BC18D007DC290007DC290007DC290007DC290007DC2
      90007DC290007DC290007DC290007AC18D007DC290007BC18D007AC28B00C6E8
      DA009ED2B8001F915400B1D9C300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001E9832006DEAA6001BDC7E001BDB
      7C001BDB7B001BD978001BC864001E9832000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000615A58000000
      00000000000000000000000000001E1A1800D0CCE0003C21A30010008E001400
      8F0014008F0013008F0013008F00170090001900910013008D0019008F00311E
      9A00C3BCDF00000000000000000000000000000000000000000064B68B002095
      5800C7E7D900C4E6D8007DC38C007CC28D0080C4910080C4910080C4910080C4
      910080C4910080C4910080C4910080C491007CC28D007DC38C00C4E6D800C7E7
      D9002095580063B58B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001E98320070ECA60019E0830019DE
      810019DC7E001BDB7C001BCB68001E9832000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000615A58000000
      00000000000000000000000000000D0B0A00DBD8E100B1A8DD007363C1007D6D
      C5007D6DC5007D6DC5007D6DC5007C6CC5007A6BC3008878C500B2A9D700DAD8
      EB00000000000000000000000000000000000000000000000000DEEFE600259D
      600036A46C00CCE8DF00CFEBE10093CEA30079C3880080C6900083C7920083C7
      930083C7930083C7920080C6900079C3880093CEA300CFEBE100CCE8DF0036A4
      6C00249D5F00DEF0E70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001E98320070ECA80019E0840019E0
      840019E0830019DE810019CF6D001E9832000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000615A58000000
      0000000000000000000000000000000000003B313F007D70A5007669A1006E60
      9D006D609D006E609D0071609D0064559700BFBAD30000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D2EB
      DE0024A063001F9D5E00A9D9C400E4F3F300C9E6DB00A4D5B4008CCB9B0089C9
      9A0089C99A008CCB9B00A4D5B400C9E6DB00E4F3F300A9D9C4001F9D5E0024A0
      6200D2EBDE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001E9832006FEEAA0019E0840019E0
      840019E0840019E0840019D273001E9832000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005D5652000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F1A1700D7D3E700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEF0E70061BD92001B9F5F0048B17F00ACDCC800E7F2F400EBF5F600E3F0
      F000E3F0F000EBF5F600E7F2F400ACDCC80048B17F001B9F5F0062BD9200DEF0
      E800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001E9832006EF0AA0012DE7F0012DE
      7F0012DE7F0012DE7F0014D370001E9832000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000797176000907
      0600070604000806040008060400080604000806040008060400080604000806
      0400080604000806040008060400040301003D323B00DFDCEC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B1DEC90026A86D001BA2630018A2610041B27F0057BA
      8D0057BA8D0041B27F0018A161001BA2630025A76C00B1DEC900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000249E3C006EF0AC008AFFCE008AFF
      CE008AFFCE008AFFCE0072F2AF00249E3C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D4EDE200A9DCC50071C8A00061C2
      960061C2960071C8A000AADCC500D5EEE2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000249E3C002CBB530031C1570031C1
      570031C1570031C157002CBB5300249E3C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000736D6C003D39
      3900211D1E001A17170014111000141110000F0C0C00282421002A1E0E002A1F
      13002A1D0D002F2D2E000F0C0B0012101A00110D3F00100C55000E0A68000A04
      9400000000000000000000000000000000000000000000000000000000000000
      00008C552900C9843E00C9843E00C8833C00C7813C00C6803A00C6803A00C57E
      3800C37B3500C27A3100C1763000C1752E00BE722C00BD6F2900A35A2C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0803100B57C2100A9750F00A6770E00AE7E
      0F00AE7E0F00A6770E00A8740F00B2771B00B973240000000000000000000000
      000000000000000000000000000000000000000000002E2A280025222100221D
      1B002B2726002F2B2900383332003833320027222400FFFFF600D98C1200DC93
      2000DB8C0F00F0F5FF002A252400332F2D002F2B290029252300231F1D001C18
      17001914150018175B000000000000000000000000000000000000000000925A
      2C00F7EADB00FAEFE300F8EAD900F5E6D300F8EBDB00F8ECDE00F8EAD900F2DE
      C000F5E4CB00F5E3C800F3DFC100F2DBB600EDCF9B00EDCF9B00E9C586009955
      2400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004E433000A0710D00B1801100C3961800CE9E1F00D1A32000D0A1
      2000D0A12000D1A32000CE9E1F00C3961800B1801100A0710D004E4330000000
      000000000000000000000000000000000000000000003733320084807D003430
      2E0038343200383432003733310037333100231F1D00FFFFFF00D08C1E00D394
      2F00DDAB4E00E0E4EB0027222000373331003834320038343200383432003A35
      3300363331001F1C1A000000000000000000000000000000000000000000A372
      3F00FAF0E300F0D49F00D8963F00CF893900E0BA8600F8E9D500E1AB5200D692
      3E00C67C3400F0D7B300F0D39B00E3AD5500D89B4900C7803800EAC68900C072
      2900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006A4E1A00A3720E00C9971D00CFA01F00CC9B1D00BF911900C7961A00D6A1
      1D00D6A11D00D4A11D00C1921900CC9B1D00CFA01F00C9971D00A3720E006C4F
      1A0000000000000000000000000000000000000000002E2A29008A858400332F
      2D003A3634003A3634003A36340039353300312D2B00FFFFFF00DAA13F00DAA0
      3E00E5C07D00FFFFFF00272320003A3634003A3634003A3634003A3634003A36
      34003D3937001C1918000000000000000000000000000000000000000000CD8B
      3F00FAF0E300EDC67900EFD4A500EFD4A500E3BE8700F5E2C000EAC68900EFD3
      A400EDD0A000DDAD6D00EDCA8000E3AD5500EFD4A500DEAE6900ECCA8E00C67A
      2E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A76D
      0F00AE7D1000D1A51F00CB9E1D00C5961900C4931800BD8E1700C6941900E0B9
      5800E2BE6600C6941900C6941900C4931800C5961900CB9E1D00D1A51F00AE7D
      1000985D07000000000000000000000000000000000028242200A09C98003F39
      37003C3735003D3836003D3836003934320069636100FFFFFF00E8C27D00DFA8
      4900F0DAB500FFFFFF00272220003C3735003D3836003D3836003D3836003E38
      36003B3735001F1C1B000000000000000000000000000000000000000000D697
      4300FAEFE300EEC97D00F8ECDE00F8ECDE00E3BE8700F6E5C700ECCB8F00F8EA
      DA00F9F0E500E5C08B00F2D9A700E3AD5500F8EADA00E9CFA800ECCB9000C984
      390000000000000000000000000000000000000000001943B200165CCE00165C
      CE00165CCE00165CCE00165CCE00165CCE00165CCE00165CCE00165CCE00165C
      CE00165CCE00165CCE00165CCE00165CCE00165CCE00165CCE00165CCE00165C
      CE00165CCE00165CCE00194BC300000000000000000000000000B1720C00AA7A
      1100D2A82000C99A1B00C3921800C1901800C1901800BD8E1700F1E0B600F5EA
      CC00F5EACC00F1E0B600C6941900C1901800C3921800C3921800C99A1B00D2A8
      2000AA7A1100B3740C0000000000000000000000000030322B00928F8D006863
      62003C373400403B3900403B39003A35330067616000FFFFFF00EED3A300E3B1
      5700F7E8D300FFFFFF005A5554003D383600403B3900403B3900403B3900413C
      3A0036313000282F59000000000000000000000000000000000000000000DBA4
      5200FAF0E300F8EAD600F6E8D400F3E5D100F6E8D600F8ECDE00F6E7D100F3E1
      C700F0DBBE00F5E3C800F3DDBA00F3DFC000F2DFC300EAC99400ECCB9000CE88
      3800000000000000000000000000000000001E49B80027A3EE0013A7F50013A7
      F50013A7F50013A7F50013A7F50013A7F50013A7F50013A7F50013A7F50013A7
      F50013A7F50013A7F50013A7F50013A7F50013A7F50013A7F50013A7F50013A7
      F50013A7F50013A7F5001495ED001A44BB0000000000D691220099650D00D1A5
      1F00C99B1B00C3921800C1901800C1901800C1901800BD8E1700F5E9CA00FEFD
      FC00FFFFFF00FEFDF900C6941900C1901800C1901800C1901800C3921800C99B
      1B00D1A51F0099650D00BC6C0F0000000000000000002F622F004D4948009F9B
      9A003D3A3700423D3C00423D3C00363130008B868500FFFFFF00F6E4C600E8BB
      6100FBF4EC00FFFFFF006A6563003C373700433E3D00433E3D00433E3D004641
      400027232200364BAB000000000000000000000000000000000000000000DCA5
      5400FAF0E300F9EADA00E7C28700DFB67B00F5E5D100F8ECDC00F2DEBE00DEAE
      6900E5C08B00F1D9B700F1DAB800E9C28000DAA35700E9C48900ECCA8E00CE89
      390000000000000000000000000000000000276BD10028BAF6001173DF00052E
      B800052EB800052EB800052EB800052EB800052EB800052EB800052EB800052E
      B800052EB800052EB800052EB8000B68DC0013ABF50013ABF50013ABF50013AB
      F50013ABF50013ABF50013ABF5001760D000000000008D570A00C79B1900CB9F
      1C00C3921800C1901800C1901800C1901800C1901800BD8E1700F5E9CA00FEFD
      FC00FFFFFF00FEFDF900C6941900C1901800C1901800C1901800C1901800C190
      1800CB9F1C00C79B19008D570A0000000000000000000000000025242100938F
      8E008A8584003D3837003A343400928F8C00A29E9C00FFFFFF00F0CF8900EEC9
      7800F8E8CA00FFFFFF0085827F00524B4A00423D3C0046414000474342003934
      320029252700000000000000000000000000000000000000000000000000DCA5
      5200FAF0E300EBC37400E3B06000DBA55C00D39B5A00F6E7CC00E7B66000E1B2
      6700CD883F00E2BC8500EDCA8000E6BA6E00E2B46C00C27A3100EBC98D00D08C
      3B0000000000000000000000000000000000276CD30033C2F7001DABF100119F
      EF00119FEF00119FEF00119FEF00119FEF00119FEF00119FEF00119FEF00119F
      EF00119FEF00119FEF00119FEF00119FEF0013B0F50013B0F50013B0F50013B0
      F50013B0F50013B0F50013B0F5001861D1003F66A4009F6A0F00D3AD1E00C697
      1900C1901800C1901800C1901800C1901800C1901800BD8E1700F5EACC00FEFD
      FC00FFFFFF00FEFDF900C6941900C1901800C1901800C1901800C1901800C190
      1800C4951900D3AD1E009F6A0F00335EA200000000000000000036A85B003C38
      3600A5A1A100787673006D676300FFFFFF00FCFCFD00E6E0D600F3CD7500F4D0
      7C00F3D18500F7F9FD00F3F2F200FFFFFF00383130004B454400474140002B28
      25002A205700000000000000000000000000000000000000000000000000DEA7
      5200FAF0E300F0D18D00F3DFC000F3DFC000EACFA700F5E2C000ECCB8F00F3DF
      C000F4E2C700D8A26000F0D18D00F3DFC000F3DFC000E9CCA000ECCB9000D48F
      3C0000000000000000000000000000000000296FD4003CCAF800147FDF000431
      B8000431B8000431B8000431B8000431B8000431B8000431B8000431B8000431
      B8000431B8000431B8000431B8000B6FDB0012B4F50012B4F50012B4F50012B4
      F50012B4F50012B4F50012B4F5001764D200534D1A00BB8E1500CBA41A00C392
      1800C1901800C1901800C1901800C1901800C1901800BD8E1700F4E7C600FFFF
      FE00FFFFFF00FDFAF300C6941900C1901800C1901800C1901800C1901800C190
      1800C1901800CAA21A00BB8E1500514D1A000000000000000000000000003591
      5600464140009E999900EBEBEB00FFFFFF00FFFFFF00FFFFFF00F1F1F500DACE
      BC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00857E7D00403A39002D2927002D34
      400000000000000000000000000000000000000000000000000000000000DFA7
      5100FAF0E300EACFA700FAF2EA00FBF3EC00EACFA700F8EAD600ECCB8F00FAF2
      E800F5E9DA00EFD6B100F2DCB500F9F0E500FAF2EA00EBD3AF00ECCB9000D591
      3C00000000000000000000000000000000002870D5003ACCF8001DB4F10010A8
      EF0010A8EF0010A8EF0010A8EF0010A8EF0010A8EF0010A8EF0010A8EF0010A8
      EF0010A8EF0010A8EF0010A8EF0010A8EF0012B9F50012B9F50012B9F50012B9
      F50012B9F50012B9F50012B9F5001865D400704B0900D4B83100C3981700C190
      1800C1901800C1901800C1901800C1901800C1901800BE8F1700F3E5C000FFFF
      FF00FFFFFF00FDFAF100C6941900C1901800C1901800C1901800C1901800BD8E
      1700C1901800C4991700D4B83100704B09000000000000000000000000000000
      000035925C00322E2C00FFFFFF00FFFFFF0093B8EA004D8EE0003E94ED001D80
      EB001777E50067A4E500F9F4F600FFFFFF00D4D3D00023201D003B89B5000000
      000000000000000000000000000000000000000000000000000000000000DFA8
      4F00FAF0E300FAEFE300F8EAD600F8EBDC00F8ECDE00F8ECDE00F6E7D200F8EC
      DE00F1DCBC00F5E3C800F3DFC100F0D7AD00F0DAB500EED19E00ECCB9000D593
      3C00000000000000000000000000000000002770D60039D0F8001598E7000752
      CB000752CB000752CB000752CB000752CB000752CB000752CB000752CB000752
      CB000752CB000752CB000752CB000B88E30010BEF50010BEF50010BEF50010BE
      F50010BEF50010BEF50010BEF5001868D5007C430200EAE17700D3A42000C190
      1800BE8F1700C1901800C1901800C1901800C1901800BE8F1700F3E5C000FFFF
      FF00FFFFFF00FDFAF100C4931800C1901800C1901800C1901800C4931800BD8E
      1700C1901800CD9F1E00EAE177007C4302000000000000000000000000000000
      00000000000035C87D00223F2900529CF3006DBEFB0031A3FB002C9DFA002E9F
      FA002E9FFA00279DFB002088EC00747CA1002B3A3D0049BBF700000000000000
      000000000000000000000000000000000000000000000000000000000000E1AD
      5400FAF0E300F9ECDB00E3BC7900DBAF7200F3E1CB00F8EBDC00F2DBB400DFAC
      6500E7C59400F3DFC100F3DFC1009273D1008D6CC100E5C5A100ECCB9000D593
      3900000000000000000000000000000000002873D70038D4F8001ABCF1000EB1
      EF000EB1EF000EB1EF000EB1EF000EB1EF000EB1EF000EB1EF000EB1EF000EB1
      EF000EB1EF000EB1EF000EB1EF000EB0EF0010C1F5000FC0F5000FC0F5000FBF
      F4000FC0F40010C1F50010C2F5001869D600874E0A00E8E16C00E1BD5F00D39E
      1C00BE8F1700C1901800C1901800C1901800C1901800BE8F1700F3E5C000FFFF
      FF00FFFFFF00FDFAF300C4931800C1901800C1901800C3921800C6941900BB8D
      1700C9961900E0BB5C00E8E16C0080480A000000000000000000000000000000
      000000000000000000001E89CB008DD5FF0031A5F90034A5F90036A6F90036A6
      F90036A6F90036A6F90036ACFE001D62CF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E3B4
      6200FAEFE300E8BD6C00DFAC6500DEAF6700D39B5A00F5E3C400E7B96400E7C1
      8000D5985000EACA9D007057E3001A25F2001A25F2003026B800ECCB9000D99C
      4600000000000000000000000000000000002874D80032D6F7001DCEF7000FC6
      F5000FC6F5000FC6F5000FC6F5000FC6F5000FC6F5000FC6F5000FC6F5000FC6
      F5000FC6F5000FC6F5000FC6F50008AAED00069BE900059CEA00059BEA00059B
      EA00059BEA00059CEA0008AAEE00125BCC00A6600500EBE87500DFB95700E2BE
      6500D39E1C00D6A11D00C1901800C4931800C1901800B6881600F3E5C000FFFF
      FF00FFFFFF00FDFAF300C4931800C1901800C3921800C6941900CB981900C996
      1900E2BD6200DFB95700E8E46D00A56005000000000000000000000000000000
      00000000000000000000469AEF0067C6FB0038ADF9003DAFF9003DAFF9003DAF
      F9003DAFF9003DAFF9003DB0FA003EB3FF005C8DC90000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E2B2
      5F00FAF0E300F0D39400F4E3C800F4E3C800EAD1AB00F5E2C000ECCB8F00F5E3
      C800F6E7D100DDAD6D007E75EE003151F8002D4BF800292CD500ECCA8E00DDA2
      4D00000000000000000000000000000000002876D90024D2F6001CD0F70010CA
      F50010CAF50010CAF50010CAF50010CAF50010CAF50010CAF50010CAF50010CA
      F50010CAF50010CAF5001FBFE800DAD7D200DAD7D200DAD7D200DAD7D200DAD7
      D200DAD7D200DAD7D200109CD4001259CD00934A0000ECE77100DFBE5800E1BC
      5E00E1BC5E00D39E1C00D6A22200D6A22200D6A22200D7A42400F4E7C500FCF8
      EE00FBF5E900FBF5E900BE8F1700C6941900C8961900C9961900C9961900E2BD
      6200E1BC5E00DFBE5800E8E36900934A00000000000000000000000000000000
      0000000000000000000099D3F90073CBFC0041B5FA0043B6FA0045B6FA0046B7
      FA0046B7FA0046B7FA0046B7FA004AC1FF004580CC0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E4B3
      6100FAF0E300F0D39400FBF4EC00FCF5ED00EAD1AB00F6E7CF00ECCB8F00FAF2
      EA00F6EADD00EFD6B100BCA0DA007A81F6007380F2008064B900ECCB9000DCA3
      4A00000000000000000000000000000000002877DA0022D5F6001AD4F7000FCE
      F5000FCEF5000FCEF5000FCEF5000FCEF5000FCEF5000FCEF5000FCEF5000FCE
      F5000FCEF5000FCEF50021BAE200E1DDD600DC9C2600DC9C2600DC9C2600DC9C
      2600DC9C2600E1DDD600139CCF00125DD00087540400E3DA7F00E0C55600E1BC
      5E00E1BC5E00E1BC5E00D6A22200D6A22200D6A22200DEB54E00E5C47200EDD7
      9E00EDD79F00EDD69C00D8A72C00D6A22200D6A22200C9961900E2BD6200E2BD
      6200E0B95800E0C55600DFD57700875404000000000000000000000000000000
      00000000000049ACFA0098D2FC007DD2FD0084D3FC006DCBFB0052C1FB0049BE
      FB004BBEFB004BBEFB004BBEFB004FC8FF003564B10000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E5B5
      5D00FAF0E300FAEFE300F6E7CC00F6E7CC00F8ECDE00F8ECDE00F6E7D200F6E8
      D400F3E1C700F5E3C800F3DFC100DFC3BE00D1AEB500EED19E00ECCB9000DFA6
      4900000000000000000000000000000000002879DB0020D9F50019D8F7000ED2
      F5000ED2F5000ED2F5000ED2F5000ED2F5000ED2F5000ED2F5000ED2F5000ED2
      F5000ED2F5000ED2F5001FBDE100EBE6DD00E5B34900E5B34900E5B34900E5B3
      4900E5B34900EBE6DD0013A5D0001464D30063641000CCB25700E9E18C00DFB6
      5000E0B95900DFB85600E0BA5B00E0BA5B00E0BA5B00D9A93200E0B95900D7A4
      2400C9961900CD9A1A00D9A93200E0BA5B00E0BA5B00E0BA5B00DFB85600E0B9
      5900DFB65000E9E18C00C7AD5300636410000000000000000000000000000000
      0000000000004BA1CD00ADD2E20089E0FF0089DCFF0089D9FF008AD7FD0086D6
      FC007AD3FC0079D2FC0070CFFC0081DFFF003B4E670000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7BB
      6500F8EADA00D39B5A00C8833C00C7813C00C6803A00C6803A00C57E3800C37D
      3600C37B3500C27A3100C1763000C1752E00C1732D00C8813800E9C58600DEA4
      460000000000000000000000000000000000287ADB0024DCF50018DBF6000DD5
      F4000DD5F4000DD5F4000DD5F4000DD5F4000DD5F4000DD5F4000DD5F4000DD5
      F4000DD5F4000DD5F4001EBFE100F5F1EA00EFCC7600EFCC7600EFCC7600EFCC
      7600EFCC7600F7F4EE0013AAD0001568D40034802000A6680C00E9EDA200E3C9
      6D00DEB54E00DFB75400DFB85600DFB85600DFB85600D7A42400E9CC8600EED9
      A300EEDAA600EED9A300D7A42500E1BC5E00E3C26D00DFB85600DFB75400DEB5
      4E00E3C96D00E9EDA200A6680C00348020000000000000000000000000000000
      00000000000074B7D5003F3A38005E89A1006AA0BC0087D6F60093E4FF008FDD
      FD008FDDFC008FDDFC0091DEFD009BF1FF003634330048434100000000000000
      000000000000000000000000000000000000000000000000000000000000E9C1
      7000DBA55C00EAB95100EAB84B00E7B14200E5AB3900E3A42F00E09E2700DE98
      1F00DB921900DA8F1500D98D1400D98D1400D98D1400D78A1400CD843100E0AB
      510000000000000000000000000000000000287CDD0039E4F60021E0F70014DD
      F50013DCF50015DDF50014DCF50015DDF50014DDF50014DDF50013DCF50013DC
      F50012DCF50012DCF5002ACAE400F6F3EC00F7F4EE00F7F4EE00F7F4EE00F7F4
      EE00F7F4EE00F7F4EE0018B7D6001772D9000000000090490100C2AE5200EBE8
      A800E7C87D00DFB65000DFB75300DEB54E00DEB54E00D8A62900F9F0DC00FDFB
      F700FEFDF900FCF9EF00D8A72C00DEB54E00DFB75400DFB75300DFB65000E7C8
      7D00EBE8A800C2AE520090490100000000000000000000000000000000000000
      00000000000080C4D60039333100372D2900332A23003329250070A9BE0098E8
      FF0095E1FB0096E2FC009DEEFF00699BAF002D26210049424100000000000000
      000000000000000000000000000000000000000000000000000000000000E7BC
      6500E2B46C00F1D07800EEC66400ECC15900EAB95100E8B44600E6AE3D00E3A7
      3500E2A12C00DF9B2300DD951B00DB901700D98D1400D98D1400D28A2F00E3AF
      5900000000000000000000000000000000002856CF0054D9F20045E9F8002DE4
      F7002CE4F7002CE4F6002CE4F7002CE4F6002DE4F7002DE4F7002DE4F7002EE4
      F7002EE5F7002EE5F70037E2F30050DAEB004ED8E9004CD6E70049D5E50048D3
      E50046D1E4003FCEE00025C8EA002A56C9000000000030AA470091490000E9E7
      8900EAE2A000EACF8F00E3C16800DEB44B00DEB54E00D8A62900F8EED500FFFF
      FF00FFFFFF00FFFFFF00D8A62B00DEB54E00DEB44B00E3C16800EACF8F00EAE2
      A000E9E789009149000030AA4700000000000000000000000000000000000000
      000000000000352924003E3938003E3937003D3836003B343200352C2800ACFF
      FF00A5F4FF00AAFCFF0070A0B20030221D0036312E004F4A4800000000000000
      000000000000000000000000000000000000000000000000000000000000D9A2
      5000E8C37E00F8E9C000F6E4B200F4DC9B00F2D28300EEC86C00ECBE5500EAB8
      4B00E7B14200E5AB3900E3A42F00E09E2700DE981F00DC921900D8973900E1AA
      4F0000000000000000000000000000000000000000002C64D4002980DF002980
      DF002980DF002980DF002980DF002980DF002980DF002980DF002980DF002980
      DF002980DF002980DF002A81DF002B81DF002B82DF002B81DF002B82DF002B82
      DF002B82DF002A81DF002D5DCF00000000000000000000000000637A2500A96D
      1700E4E77F00E8E19B00EBD39400EACF8D00E6C67800D8A62B00F9F1DF00FEFD
      FA00FEFDFC00FDFBF400D8A72C00E6C67800EACF8D00EBD39400E8E19B00E9EA
      8B00AC6F1800637A250000000000000000000000000000000000000000000000
      000000000000403A3800423D3C00423D3B00413C3A00403B39003C3432005363
      6500525D600039322E00362E2A003A3634003B36340038373500000000000000
      000000000000000000000000000000000000000000000000000000000000D59E
      5000ECCB8700FAECC700FAECC500F9EBC300F8E7BD00F7E5B800F6E3B200F3DD
      A400F2D79400F0D38C00EFD08400EECD7B00EFD08400EDCF8100E3AD5500D593
      3C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000676F
      1E00A3681600E4E47A00E4E39600E9D89400EBD29100D6A22200DCB04100DDB3
      4900DDB34900DDB34900D6A22200EBD29100E9D89400E4E39600DDDD6D00A369
      1700676F1E000000000000000000000000000000000000000000000000000000
      000000000000000000004741400046413F0045403E00443F3D00433D3B00403B
      3800403A3700403B3900403B39003F3A39003E39380000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EDC8
      7100EECD8400FAECC700FAECC700FAECC700FAECC700F9EBC300F8E9C000F7E7
      BA00F6E3B500F5E1AF00F4DFAA00F3DDA400F2D99D00F0D69700E5B25900D598
      3F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000061782A0089440000BCAC4600DCE48000E4E49600E7DE9700E9D79200EAD3
      9100EAD39100E9D79200E7DE9700E4E49600E0E68700CEC05400894400006178
      2A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4442004C4443004A44420048434200474241004741
      400046413F0045403E00443F3D00433E3D009C97960000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1C9
      7700F6E5C700EEC66600EEC66400EEC66400EEC66400EEC66400EEC66400EEC5
      6200EDC26000EDC26000ECC15D00ECBE5C00EBBE5900EABA5700EAC27A00DBB1
      6700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002BB35C00824201009E5E1100BCA43D00D3CC6100E1E78300E5EE
      9200E5EE9200E1E78300D3CC6100BCA43D00A05F1100824201002BB35C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004D4746004B4544004D4544004D4544004E45
      4100673E2A00463F3E004E494800686462000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D9B77F00EEC86F00EEC86F00EEC76D00EEC76D00EEC76D00EEC56A00EDC3
      6900ECC26600ECC06300EBBE6000EABC5D00EAB95900E9B65600B78F48000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000349939005E721E00714E0900723800008E47
      00008E47000072380000714E09005E721E003499390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004B381C0090692A00CE983900E8A83C00EBB0
      4400EBB04400E8A83C00CB953600916A2F0049353F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BC772900CD872800DB942600E19A2400E5A3
      2D00E5A32D00E19A2400DB942600CD872800BC77290000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD672000CF903600DE9F3E00E09F4000E4A7
      4700E4A74700E09F4000DE9F3E00CF903600A670210000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000252454003D2B
      7D0002009F000701B2000701B2000701B2000702B3000702B3000702B3000701
      B00006048F000D0A7600161557001B191C000000000000000000000000000000
      00000000000052422C00DF9F3900EAB24B00F2CA6D00F9D68100F9DB8D00F9DB
      8B00F9DB8B00F9DB8D00F9D68100F2CA6D00EAB24B00DE9E3800483822000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D7CBBA00E0982900E5A73300EDC55900F3D47100F7DB7E00F6DA
      7D00F6DA7D00F7DB7E00F3D47100EDC55900E5A73300E0982900D7CBBA000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DD841300DC9B3D00E4AA4F00EDC06C00F3CF8000F5D48900F5D2
      8900F5D28900F5D48900F3CF8000EDC06C00E4AA4F00DC9B3D00E9D2AB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000019177000403FDC001415
      F0001A1BFB001A1BF9001A1BF9001A1BF9001A1BF9001A1BF9001A1BF9001A1B
      F9001B1BFB001618EE001110D8000903B9000000000000000000000000000000
      00009A723700E4A63F00F5CF7400FAD88900F9D68500F8D68400F8D58300F8D5
      8300F8D58300F8D58300F8D68400F9D68500FAD88900F5CF7400E4A63F009B72
      3700000000000000000000000000000000000000000000000000000000000000
      0000DCB07000DF992800F0CD6000F7DA7B00F6D77700F6D67500F5D57400F5D5
      7400F5D57400F5D57400F6D67500F6D77700F7DA7B00F0CD6000DF992800DDB0
      7100000000000000000000000000000000000000000000000000000000000000
      0000DD983500DC9E4200F0C67400F7D38700F6D18400F6D08200F5CF8100F5CF
      8100F5CF8100F5CF8100F6D08200F6D18400F7D38700F0C67400DC9E4200DFA8
      5D00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000009089C006B76F6001725
      F4001D2AF3001D2AF3001D2AF3001D2AF3001D2AF3001D2AF3001D2AF3001D2A
      F3001D2AF3001D2BF4001F2DF9000F0DD000000000000000000000000000A376
      3300E7AE4A00F9D68300F8D48200F7D38100F7D38000F7D38000F7D38000F7D3
      8000F7D38000F7D38000F7D38000F8D48100F8D58200F8D48300F9D68300E7AE
      4A00A7793700000000000000000000000000000000000000000000000000C18C
      4D00E2A43200F4D57400F4D37300F3D27100F4D37100F4D47200F3D37100F3D2
      7000F3D27000F3D27000F3D27000F3D27000F3D27000F4D37300F4D57400E2A4
      3200C18C4D00000000000000000000000000000000000000000000000000D796
      3E00E0A64E00F6D28500F5D18300F4CF8000F3CE7E00F3CD7E00F3CD7E00F3CD
      7E00F3CD7E00F3CD7E00F3CD7E00F3CD7E00F3CD7E00F4CE8000F5D08200E0A5
      4E00CE8B38000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001C1A89008795F7001C32
      F3002439F3002439F3002439F3002439F3002439F3002439F3002439F3002439
      F3002439F300243AF300263EF6000F0DD3000000000000000000C2985F00E5AA
      4600F9D68300F7D27D00F7D17C00F7D17C00F7D17C00F7D17C00F7D17C00F7D1
      7C00F7D17C00F8D27D00FAD58000F8D37C00E7B65C00F9D68000F8D27D00F9D6
      8300E5AA46008C632A0000000000000000000000000000000000DB8F2200E09F
      3000F4D57400F2D06D00F2CF6C00F3D06D00F1CF6700F4D47200F7D97400F3D1
      6E00F2CF6C00F2CF6C00F2CF6C00F2CF6C00F2CF6C00F2CF6C00F2D06D00F4D5
      7400E09F3000DC91240000000000000000000000000000000000B3943700DDA4
      4C00F6D08000E3B15F00E3B26000E7BA6800F5CE7F00F2CA7C00F2CA7B00F2CA
      7B00F2CA7B00F2CA7B00F2CA7B00F2CA7B00F3CB7C00F5CE7F00F9D48400FAD7
      8800DDA44B00D9A15A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002D2B93008791F8002D48
      F5002A44F5002B45F5002A44F500273DF5002337F400253AF4002942F5002A44
      F5002B45F5002B46F5002C46F6000E06BE000000000050442C00DC993800F6D0
      7900F6CF7A00F6CE7900F6CE7900F6CE7900F6CE7900F6CE7900F6CE7900F6CE
      7A00F7D07B00FBD78100DFA64C00AA530B009B3E0300EDBD6200F7D07B00F6CF
      7A00F6D07900DC9938004848CA000000000000000000EAC17600D6872000F2CF
      6700F1CC6700F1CB6600F1CB6600F3D06B00CA7A2000B3550B00B3550B00F4CE
      6300F3CE6900F1CB6600F1CB6600F1CB6600F1CB6600F1CB6600F1CB6600F1CC
      6700F2CF6700D6872000E1A23700000000000000000065B34900D3933B00F8CF
      7F00B46F2600913D0000933F0000913D0200E7B66300F2C97900F1C77700F1C7
      7700F1C77700F1C77700F1C87800F3CA7A00F8D18000D69E4B0094440600B36B
      2300F8D07F00D3933B00DBBD980000000000000000006F7D6600738F6F004876
      4300406C39002F612900255E1F00255E1F0027611B001F4C29004E43F6007998
      FC002B4CF6003353F600304AF50060B4FA0098FFFE0076D8FD003D66F6003351
      F6003455F6003658F7002737EF00281F8F0000000000D08B3000EFC16600F5CD
      7500F4CB7300F4CB7300F4CB7300F4CB7300F4CB7300F4CB7300F5CC7400F8D1
      7800EDBD6200BB681500B05D1300F8F5EE00BB783900EDBD6300F5CD7500F4CB
      7300F5CD7500EFC16600CF8836000000000000000000CF7A1E00EABC5000F1CA
      6200F0C86000F0C86000F0C86000F3CE6500CB7B1D00EBD7B000EAD9BC00A43C
      0000EAB94B00F3CD6400F0C96100F0C86000F0C86000F0C86000F0C86000F0C8
      6000F1CA6200EABC5000CE791B000000000000000000CC863400E9B96600F6CD
      7B00AF621700FFFFFF00FFFFFF00D5B59400DFA65300F1C67500F0C37200F0C3
      7200F0C37200F1C47300F5CA7800E2AC5A00A7581100B6783E00D9BF9C00B166
      1F00F6CD7B00E9B96600CC863400000000003B6B32003687390038A74B003CB6
      540045D16C0045CF6A0045CF6A0045CF6A0045D06A0047DB5E00181FD2009098
      FE007997FD003555F600447EF9006AE1FF0064D7FF0067DCFF0063D5FF003C56
      F6003E61F7004062F7001107E6004A3B340079985100DA993B00F5CC7200F3C8
      6D00F3C86D00F3C86D00F3C86D00F3C86D00F4C96E00F5CC7100F4CA6C00CA7F
      2800AD570A00E3C9AA00FFFFFF00FFFFFF00BB783600ECBC6200F4C96E00F3C8
      6D00F3C86D00F5CC7200DA993B008C602E00C77F2D00D5872500F0C85F00EEC3
      5B00EEC35A00EEC35A00EEC35A00F0C85E00CB7D1B00EBD7B000FFFFFF00EAD9
      BC00982C0000E1A13700F1CA5F00EEC45B00EEC35A00EEC35A00EEC35A00EEC3
      5A00EEC35B00F0C85F00D5872500C57624006D842C00D2923F00F1C47100F3C6
      7200B1641700FFFFFF00FFFFFF00D1AF8B00DDA54E00EFC16E00EEBF6C00EFC0
      6D00F1C46F00ECBA6600BE772B00A85D1C00E3CCB300FFFFFF00F2E6DC00B168
      1D00F3C67200F1C47100D2923F00A1691F005B9D5D006DDF91003FC8660042C8
      670041C6660041C6650041C6650041C6650041C6650042C964003FCE61001C23
      DC008D94F300889FFF003DAFFF00288AE7004291E400277BDB003CB2F9004383
      FF004164FF00140FFE0039338600000000009B893A00E8B15200F2C66A00F1C4
      6800F1C46800F1C46800F1C56800F2C66A00F6CC6E00D6933900B0570900D9B3
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00BE7C3C00ECBC6200F2C56900F1C4
      6800F1C46800F2C66A00E8B15200BF792A00C7782500E2A73900EEC15500EDBF
      5300EDBF5300EDBF5300EDBF5300EFC45700CC7D1C00EBD7B000FFFFFF00FFFF
      FF00FAFCF8009F390000D0822100F2C75900EEC05400EDC05300EDBF5300EDBF
      5300EDBF5300EEC15500E2A73900C6742000AA7E2D00E0A85400EDBE6A00F0C2
      6D00B5661B00FFFFFF00FFFFFF00D4B18D00DDA34D00EDBF6A00EEBF6B00EDBC
      6800CC8C3C00A3500800D7B59000FFFFFF00FFFFFF00FFFFFF00F0E3D600B66A
      1F00F0C26D00EDBE6A00E0A85400BA762A004F8F4F007BDFA1003AC6680040C7
      6C0040C76C0040C76C0040C76C0040C76C0040C76C0040C96D003EC06600332A
      1E002B251500554D75001C71E7006AA9ED0042AAFC001E7CE8001244B8002245
      C4002A205E002F2A4C003E3A380000000000BC7B2800EFC36E00EFBD6100EFBD
      6300EFBE6300F0BF6400F2C36700E7AE5000BA641100CA8E4800F9F5F000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C1823E00F3C36500EFBE6300EFBD
      6300EFBD6300EFBD6100EFC36E00CA782500C2691800EBBE5900EBB74C00EBB7
      4E00EBB84E00EBB84E00EBB84E00EDBC5100CD7D1C00EBD7B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BA651600D0822100ECB94B00ECBA5000EBB84F00EBB8
      4E00EBB74E00EBB74C00EBBE5900C2671700BE782B00EABD7000EAB56100EEBB
      6800B7691C00FFFFFF00FFFFFF00D8B79000DDA14B00F0BE6900DA9F4C00AD5E
      1300C68F5600FCFBFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0E4D700B96D
      2000EEBB6800EAB56100EABD7000C0772A00537831009DE6BD0039C971003CC9
      70003DC971003DC971003DC971003DC971003DC971003DCC72003BA65F003220
      2700322E2B002C20130074AFE20031ABFF0031A6FE0034AAFF0033AFFF002E3A
      4D00342D200034302A00302C2A0000000000CA792200F7D89A00EEC46C00EFBB
      5B00F1BE5F00EDB85700C8782200C3772600F1E4D400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5864100F2C05E00EFBC5D00EFBC
      5D00EFBB5B00EEC46C00F7D89A00CA792200BE610D00F4D98F00EBBF5800E9B1
      4300E9B34500E9B34600E9B34600EBB74800CF7F1D00EBD7B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D3A25B00B7550300E5A93900EAB54800E9B3
      4600E9B14300EBBF5800F4D98F00BE610D00BF742600F4D29700EABC6B00EBB6
      5E00BB6F1E00FFFFFF00FFFFFF00DBBA9300D3943E00BC722500BC7D3800F1E9
      DD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1E6D800BC73
      2300EBB65E00EABC6B00F4D29700BF742600636E3C007CC48C006DDBA40033C8
      740039CA79003ACA79003ACA79003ACA79003ACA79003ACB7A003BCE7800333C
      3200312827004142450055CAFF003DB3FE0040B4FD0040B4FD0041BAFF003B85
      C20032272000332F2D002522220000000000CB7F2A00F6D29000F3CE8D00EFC0
      6600E1A44100C6782900E5CBA500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC8E4700EFBA5500EDB75500EDB6
      5200EEBE6500F3CE8D00F6D39000C87B2800C0661500F2D28000EFCC7D00EAB9
      4F00E8AD3B00E8AE3E00E8AF3F00EAB24100D1801B00EBD7B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE4CB00B8530500E5A93900E8AD
      3B00EAB94F00EFCC7D00F2D28000BE621300C0792F00F1CC8C00EEC78900ECBA
      6800BD731C00FFFFFF00FFFFFF00E0C09700BB722500ECD9C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1E7D800C377
      2200ECBA6800EEC78900F1CC8C00BD752D00000000003B8C3F009FE4C50053D6
      970031CA7C0036CB7F0037CC7F0038CE7F0038CE7F0038CD7F0037D1830036B3
      71002E1D1E007591A50065D0FF004BC0FD0049BFFD004ABFFD004BC3FF0048AF
      EF0031241C00161314000000000000000000C2772500F3D18A00EFCA8400F0CC
      8800E7B76600CC832C00EDD7BA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D1964A00F0BB5500EAB24D00EEC7
      7400EFCC8700EFCA8400F3D18B00C3772500B75D1100F0D17B00ECC97400ECCA
      7700EAC26100E5AB3500E4A93600E6AC3900D2801A00EBD7B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6EDE100BC5C0700E2A53200EBC2
      6200ECCA7700ECC97400F0D17B00B75E1100B8732A00EEC98700EAC27F00ECC7
      8500CD924600FFFFFF00FFFFFF00E2C29800BB6E1A00E5C8A400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2E8DB00CF95
      4A00ECC78500EAC27F00EEC98700B8732A0000000000696F660051A65E009FE5
      C80060DBA90030D07F002EC2890028AE90002BAD8C002EB7890037DA850036B0
      72002D1A1C006C8CA10090E2FF008CDAFF0079D6FF006AD2FF0067D6FF005FC4
      F60030231D00817B78000000000000000000BA661A00F0CC8200EEC77C00EEC7
      7C00EFC97F00ECC47700D7984100D38D3400F5EEE200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D89F5400E3AA5000EEC97E00EEC8
      7D00EEC77C00EEC77C00F0CC8200BA661A00AC490700ECCA7100EBC36C00EBC3
      6C00EBC46E00EBC46B00E8B74B00E4A53000D2801600EBD7B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEB26900C7680600E4AD4400ECC66B00ECC4
      6E00EBC36C00EBC36C00ECCA7100AC490700AE641E00EBC58100E9BF7B00EAC1
      7D00D5A15B00FFFFFF00FFFFFF00E3C39900D6943600CF8A2E00C9863500EDD7
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F0E500D9A6
      6000EAC17C00E9BF7B00EBC58100AE641E0000000000000000007B82750049A6
      560095E1A5003894CC004988EF004D9DF8002C86F6001E6EEA001653B50035A8
      65002F1E1C007495A5009AEBFF0096E1FF0098E3FF00A0EEFF008CD5F4004D61
      6C0030292500716C6B000000000000000000B6641C00E8C38100EEC47600EDC4
      7700EDC47700EEC57800EFC77B00EAC07500DCA14C00E3BB7C00FDFEFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E6C28B00E5B26200EEC57900EDC4
      7700EDC47700EEC47600E8C38100B8641900B0540F00E5BF6E00EAC06400E9C0
      6500E9C06500E9C16600E9C16800EAC46C00E0A54100F1E1C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DDA75100DA9C3C00EAC66A00EAC26900E9C16600E9C0
      6500E9C06500EAC06400E5BF6E00AF530E00AD642000E2BC7F00E8BC7500E8BD
      7700DAA35C00FFFFFF00FFFFFF00ECD6BC00E1B05F00E6B15D00DDA34C00CE8B
      3300DAAA6800F7F1E600FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F0E600DCA8
      6000E8BD7700E8BC7500E2BC7F00AD631E000000000000000000000000000000
      0000488ABF0086CBFF0036ABFF002FA5FE0031A7FE0033A9FF0034B0FF001E3F
      90003A2F27003B3B3A00A5F7FF00A3EEFF00A9F8FF00526D7700291B16003029
      2500322E2C0074706D000000000000000000A9633300D5A25800F0D09000ECC2
      6F00ECC37100ECC37100ECC47100EDC47200EDC57300E8B96C00E2AF5F00EFD9
      B900FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9C48B00E4AF5B00EDC47200ECC3
      7100ECC26F00F0D09000D5A25800BA661C00BD6B2300D0933E00EED08300E8BA
      5800E8BC5B00E8BC5C00E8BC5C00E9BD5C00E3AF5200F1E1C600FFFFFF00FFFF
      FF00FCFAFE00DEA95400DA9C3C00E9BE5E00E8BD5D00E8BC5C00E8BC5C00E8BC
      5B00E8BA5800EED08300D0933E00BC691E00AD6F2B00CE9A5A00ECC98C00E6BB
      6E00DDA75D00FFFFFF00FFFFFF00ECD9BC00E3B46900E7BD7300E7BE7300E7BE
      7400E3B36C00DDA85D00EBCCA600FEFCFB00FFFFFF00FFFFFF00F8EFE700DEAC
      6200E6BB6D00ECC98C00CE9A5A00A7601F000000000000000000000000000000
      000052A0FF005BC3FF0038B1FD003CB2FD003CB2FD003CB2FD003CB5FF003E9B
      E40044352C003F3633004A4F50009BDDEC007FB0BD0033272300383431003833
      300035312F0074706D000000000000000000B7887B00BE702600F1D29B00EDC5
      7900EBBE6700EBBF6900EBBF6A00EBBF6A00EBBF6A00ECC06B00EBBD6900E8B8
      6700E8BA6F00F5E5D100FFFFFF00FFFFFF00EBC88E00E5B05900ECC06B00EBBE
      6700EDC57900F1D29B00BE702600C77C2B00CD893A00AF571100EFD48F00E9C1
      6800E7B65100E7B75400E7B85500E7B85500E4B24E00F2E3C500FFFFFF00F6ED
      E100E0AA4600E5B65300E8B95600E7B85500E7B85500E7B85500E7B75400E7B6
      5100E9C16800EFD48F00AF571100CD853100B6984800B26D2A00EDCC9800E8BD
      7700DFAA5C00FFFFFF00FFFFFF00EDDABC00E3B36200E5B76A00E5B76A00E5B7
      6A00E6B86B00E4B66900E2B26600E3B36F00F0DCBF00FFFFFF00FAF3EC00E2AF
      6300E7BD7700EDCC9800B26D2A0099622300000000000000000000000000ACAA
      B200A9DDFF0052C2FD0041BAFD0044BBFD0046BBFD0046BCFD0047BDFE0046C0
      FF004D3931004A444200473F3C003F3533003F363200423B3B00423C3A00403A
      39003F393700C0BBB700000000000000000000000000B15F1E00DAA96000F1D6
      9900EEC97F00E8BA6000E9BA6000E9BB6200E9BB6200E9BB6200E9BB6200E9BB
      6100E9BB6200EABB6500EECA8B00FCF9F600F1D19B00E6B45800E8BA6000EEC9
      7F00F1D69900DAA96000AE5A18000000000000000000A4430A00D59B4700F0D6
      8E00E9C56E00E4B44A00E5B24A00E5B24B00E5B34E00F5E9D400F6EDE100E5B2
      4E00E5B24E00E5B34C00E5B34C00E5B34C00E5B34C00E5B24A00E4B44A00E9C5
      6E00F0D68E00D59B4700A44208000000000000000000A55A1B00D0A16100EED1
      9600E3B56B00FFFFFF00FFFFFF00F1E0C600E2B25F00E3B46300E3B46300E3B4
      6300E3B46300E3B46300E3B46300E3B36100E4B46400E9BC7C00F2DFBF00E6BA
      7300EED19600D0A16100A55A1A0000000000000000000000000000000000A8B1
      C700BDEEFF0085DAFF0082D6FF006FD1FE005CC9FE004EC4FE0050C5FE0051D0
      FF00525B65004F4644004F4847004F4847004E4746004D4745004C4544004A44
      43004C46460000000000000000000000000000000000BB958C00B1611900E5BE
      7800EFD09100EECD8800EABF6A00E7B65400E8B75700E8B75800E8B85800E8B8
      5900E8B85800E8B75700E8BB5E00EEC16B00EEC47200ECC26F00EECD8800EFD0
      9100E5BE7800B1611900DBA65B000000000000000000E8C59700A0410700E2B8
      6100EDCF8400EACA7800E6B95500E2AB3A00E7B65000EABE6000E8B65300E2B0
      4100E3AF4000E3AF4000E3AE3F00E2AE3E00E2AC3B00E6B95500EACA7800EDCF
      8400E2B86100A0410700E5B76A000000000000000000C1AF6A00A65D1C00DDB7
      7800E9BE7A00E7B56600E6B46500E8B86C00E1B15F00E1AE5800E1AE5900E1AF
      5A00E1AF5A00E1AE5900E1AE5900E0AE5700E0AC5400E5BB6E00E9BD7500ECC3
      7F00DDB77800A65D1C00A0703400000000000000000000000000000000006B64
      60007696A50092E7FF0098EDFF0094E3FF0093E0FF0094DFFF0095E1FF009EF4
      FF004B3E37004C464400635C5B00645E5C00645D5C004F4847004A444300433F
      3D00000000000000000000000000000000000000000000000000B5672400BA6E
      2500E7C37B00EFCF8800EECD8800EDC97F00EAC46F00E6BA5C00E6B55000E6B3
      4D00E6B34D00E6B55000E6B95A00EBC26E00EDCB8200EECC8700EFCF8800E7C3
      7B00BA6E2500B567250000000000000000000000000000000000C07A3600AB53
      0F00E4BD6700EBCD7900EACA7800E9C67000E7BB5A00E6B74D00DFAA3600E0A6
      3300E0A63400E0AC3800E2B04400E6BC5B00E9C67000EACA7800EBCD7900E4BD
      6700AB530F00C17A390000000000000000000000000000000000A06B2D00AF6D
      2900E1BC7A00EBC58300E9C28000E7C17E00E4BC6C00E0B05B00DEAC5000DEAB
      4E00DEAB4E00DEAC5000E0B15B00E4BC6E00E7C17E00E8C38400EAC68600E1BB
      7B00AF6D2900A15C20000000000000000000000000000000000000000000944C
      1600352D2A0032251F00322722008DD7F5009BE8FF0099E5FF00A0F1FF006C9E
      B5002C221D000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A458
      1C00BA6D2200E1B76A00EBCB7F00EDCB7E00EDCA7E00EDCA7F00EDCB8000EDCB
      8000EDCB8000EDCB8000EDCA7F00EDCA7E00EDCB7D00EBCB7F00E1B76A00BA6D
      2200AD5C1B00000000000000000000000000000000000000000000000000B66B
      2D00AB510E00DEAE5300EAC86E00E9CA6E00E9C96E00E9C96F00E9C97000E9CA
      7100E9CA7100E9C97000E9C97000E9C96E00E9CA6E00EAC86E00DEAE5300AB51
      0E00B66C2D000000000000000000000000000000000000000000000000009A60
      2800AF692600D9AF6B00E6C47D00E7C37D00E7C27D00E7C27E00E7C37F00E7C3
      7F00E7C37F00E7C37F00E7C27E00E7C27D00E7C37D00E6C47C00D9AF6B00AF69
      26009E541A000000000000000000000000000000000000000000000000009C60
      2F00413B3900403A38003D353300362D2800B3FFFF00B0FFFF0074A7B7003023
      1E0037312F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007C4A2600AA571400D39E4D00E6BE7200EBCA7A00EBC87C00EBC77A00EBC7
      7A00EBC77A00EBC77A00EBC87C00EBCA7A00E6BE7200D39E4D00AA5714009F5B
      2300000000000000000000000000000000000000000000000000000000000000
      0000BB77350096360200CE8C3500E3B95C00E9C76700E9C56900E8C46700E8C3
      6700E8C36700E8C46700E9C56900E9C76700E3B95C00CE8C350096360200BB78
      3500000000000000000000000000000000000000000000000000000000000000
      0000946932009F551800CC965200DDB67100E5C27800E6C27A00E5C17800E5C0
      7800E5C07800E5C17800E6C27A00E5C27800DDB67100CC9652009F5518009B57
      1D0000000000000000000000000000000000000000000000000000000000EBCB
      7C004641400045403D00443F3C00413A38003A2D2900382A26003A302C003E38
      360051493C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005C4739009F4B0E00B2641C00CA8B3C00DBAB5B00E4BC6C00E7C3
      7400E7C37400E4BC6C00DBAB5B00CA8B3C00B2641C00A34F1200806A5D000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CCBCBE008F340900A1450700C1762300D6A14100E0B25500E4BC
      5E00E4BC5E00E0B25500D6A14100C1762300A14507008F340900CCBCBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000083B48700984A0F00A8601F00C1874100D3A65E00DBB46D00E2BB
      7300E2BB7300DBB46D00D3A65E00C1874100A8601F00984A0F0099652D000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005B5352004B4543004A444200494341004742400046413F0045403D00443F
      3C00907A4C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000634937007E49220096491200A0470900A855
      1100A8551100A0470900964912008A552F006A53410000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D19A4F00B2692B00973F0E00892900009537
      01009537010089290000973F0E00B2692B00D19A4F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AE8256009D592400964A100096490D009E54
      16009E54160096490D00964A10009C572000A0703B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D4745004F4747004E4847004F474600504B490045403F00713D
      2000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FFF7FBF6FF8EC976FF57AE33FF299000FF289300FF23A2
      01FF2A8E01FF289002FF63B246FFACD89BFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FFF1FAEDFF000000000D23BD000703BC000803
      C3000803C2000803C2000804BF000805C0000904C1000804C0000905C1000804
      BF000805C0000805C0000804C0000805C0000805BD000804BD000805BD000703
      BD000804BE000902BA000615A70000000000000000001B533D0023751F00257A
      220025772100257A2200257A2200257A2200257A220025772100267B22002578
      2200257C22002579220025792200257922002579210024792200257922002579
      21002578210024741F0019503800000000000000000000000000000000000000
      00000000000000000000000000009D541400B67A2500D0903200DD9A3800E0A3
      3F00E0A33F00DD9A3800D0903200B57A25009360150000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF74BD58FF2F9900FF2CBD00FF25D300FF18E200FF17DE00FF14DA
      00FF16DA02FF1BDA04FF26CC06FF28B506FF2F9905FF86C96FFF000000FF0000
      00FF000000FF000000FFC7E9BDFF28A706FF0E24C0000C07E4001108FF001108
      FF001108FF001108FF001109FF001108FF001109FF001109FF001108FF001109
      FF001005FF000F06FE001109FF001108FF001108FF001109FF001108FF001108
      FF001109FF00110AFF000E06E3000C2687001C563E002DA7380032C74C0031C5
      4A0031C5490031C54A0031C64B0031C54B0031C54A0031C84B0030C649002CB8
      3F002BB63E002BB73E002CB53F002CB53F002DB43F002CB43D002CB53D002EB8
      410031C84B0033C74E002CA638001B5331000000000000000000000000000000
      000000000000DE7E0A00D9953400E1A54700EBC06600F1CC7900F5D38400F5D2
      8300F5D28300F5D38400F1CC7900EBC06600E1A54700DA973800EDDEC4000000
      000000000000000000000000000000000000000000FF000000FF000000FFE7F4
      E2FF289200FF26AC00FF1EDD00FF1BE200FF1CE000FF1BDE00FF1CDE00FF1EDB
      03FF1EDC05FF24DC08FF26DE0BFF27DF0CFF2CDD0EFF29B208FF33A40FFFE9F6
      E5FF000000FF6CBC5BFF1EA207FF27B60AFF0904C600110BFF00100AFB00100A
      FA00100AFB00100AFB00100CFB00100AFA00100AFA00100AFA00100BFA000D04
      F7001128F5000611F3000D06F700100BFA00100AFA00100AFA00100CFB00100B
      FA00100AFA00100AFA00110CFF000805C2002477200031C84F002EBC460027B4
      3A0024B1370023AE35002AAB38002DB640002EBB43001A871E0027892E00459E
      50004197470041934600408E43003E8A40003D893E003C863D003F863E00296C
      25002BA7370030C1470031C74C0023741F000000000000000000000000000000
      0000E3982800D9993A00EEC56D00F6D28100F4CF7E00F4CE7C00F3CD7B00F3CD
      7B00F3CD7B00F3CD7B00F4CE7C00F4CF7E00F6D28100EEC56D00D9993A00E7BF
      8A0000000000000000000000000000000000000000FF000000FFE7F4E2FF2B93
      00FF1EC300FF18DF00FF1DE000FF1DDF00FF1CDF00FF21E002FF22E004FF29E1
      08FF2EE20CFF32E30FFF35E312FF35E115FF32E015FF2FE717FF2CCE0FFF2099
      05FF2A8C19FF19B509FF38F332FF2CC00CFF0907CC001213FE001112FA001112
      FB001112FB001212FB001112FB001112FB001112FA001112FB001113FC000200
      F300CCE6FD00E0F3FD000000EE001011FA001212FB001112FB001112FB001111
      FA001112FA001112FA001313FF000906C800267F240032C54F0026B237007ED0
      980099D7B0009BD7AF0054B4660029AD370015861B00BCE0C900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0093C5
      9B00218B250031C2480031C44A00267B2300000000000000000000000000DA9B
      4400DEA14600F3CD7B00F2CD7B00F1CC7900F1CB7800F1CB7800F1CB7800F1CB
      7800F1CB7800F1CB7800F1CB7800F1CC7900F2CD7A00F4D07E00F4CF7E00DEA3
      4600C07B3200000000000000000000000000000000FF000000FF2C9700FF1BBD
      00FF15DC00FF1CDE00FF1DDF00FF1EDF00FF22E003FF28E306FF2AE309FF2EE5
      0DFF33E40FFF37E614FF3FE819FF45E91FFF43E822FF3EE723FF38E822FF2CD9
      16FF22CB11FF32E62AFF45F33DFF28C20CFF0A07CF001419FF001217FB001318
      FB001318FB001319FB001319FB001217FB001217FB001318FB001319FC000000
      F100FFFFFF00FFFFFF003E6FF3000A08F4001319FC001319FB001318FB001318
      FB001318FB001217FB001318FF000905CB00267F250032CB52001FB13300E7F2
      EE00FFFFFF00FFFFFF0097D4AC0019911F006ABE7E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00238026000054000000530000005200000954
      000027942C0031C34B0031C44B00267D23000000000000000000869A3200DBA0
      4200F8D48100F8D27C00F4CD7800F2C87500F1C77400F1C77400F1C77400F1C7
      7400F1C77400F1C77400F1C77400F4CC7800E5B76100E2AE5A00E1AD5900F3CD
      7A00DBA04200E3BA87000000000000000000000000FF74BE58FF24A900FF14DA
      00FF18D900FF1ADD00FF1FE001FF24E204FF28E509FF2DD107FF3BC910FF3FBA
      10FF5ED43CFF70E269FF91F79FFF61EF4FFF4DED2BFF53EE35FF4EED36FF46ED
      33FF3FEB34FF49EE40FF56F553FF30CA12FF0B08D200151EFF00141CFB001419
      FB00141DFC001419FB001419FB00141AFB00141CFB00141CFB00151DFD000000
      EE00FFFFFF00FFFFFF00608CF4000807F100151BFC001419FB00141CFC00141C
      FB001419FB00141CFC00151EFF000A08CE002782270031CA53001EB13300DFEF
      E900FFFFFF00FFFFFF0091D2A4000C871400EFF4F200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E1EDE300D6E8DA00D6E9DB00D8E9DC00D0E8
      D6001B5E13002EBA430031C64D00267E2500000000004DBD4D00D08C3300F6CE
      7900AE631C008F390200D4984400F8CF7A00F2C87400F0C67200F0C57100F0C5
      7100F0C57100F0C57100F1C77300E5B45C00883400008936000088340000B167
      1F00F6CE7900D08C3300DEC9AE0000000000F7FBF6FF298F00FF15D100FF13D4
      00FF15D500FF1CDC02FF22E105FF2FDF09FF39B207FF3BA611FF99D283FFD9EF
      D1FFA6DC94FF80CE63FF31B309FF58D64AFF9DFCAFFF5FF242FF65F150FF5CF1
      4FFF5BF152FF64F55EFF70FA74FF37D416FF0B09D6001622FE001520FC001520
      FC00151FFB001520FB001520FB001520FC001520FC001520FC001622FE000000
      EA00FFFFFF00FFFFFF004C7CF1000B0BEE001621FC001520FC001520FC001520
      FC001520FB001520FC001622FF000B09D2002783280031CB56001CB13400E0EF
      E900FFFFFF00FFFFFF0090D1A2001F993000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00246B21002FBD460031C54F002781250000000000C57F2E00E7B65E00F4CB
      7500AD5D1700D8BD9700B2713400A14E0A00E0A95300F3C97200EFC26D00EEC1
      6C00EEC16C00EEC16C00EFC36F00DDA34B00D3B38E00FFFFFF00FFFFFF00AA5A
      1000F4CB7500E7B65E00C87F3000000000008BC476FF22AF00FF10D500FF13D1
      00FF19D502FF24E006FF32E00AFF46BA09FFB0E197FF000000FF000000FF0000
      00FF000000FF000000FF93D482FF1C9D04FF7AF083FF6DF457FF74F664FF72F6
      6AFF73F86EFF7BF87CFF82FC8BFF40DB1CFF0C0BD9001826FF001724FC001623
      FB001623FB001724FC001724FC001724FC001724FC001825FD000F14F200133B
      EB00FFFFFF00FFFFFF000000E1001421F9001623FD001724FC001724FC001724
      FC001724FC001724FC001826FF000C0AD4002685280031CB57001CB13400DFEF
      E900FFFFFF00FFFFFF008ED0A1003FA95100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006703000053000000500000004E00000050
      0000155E0D0030C6510031CB5200278228004E832900CF8C3700EFC46D00F1C6
      6D00AD5F1600F0E6DB00FFFFFF00E2CDB100A2531400BB6F2300EAB95F00EFC4
      6B00EDBF6800ECBE6700EDC16900DBA04700CFAC8500FFFFFF00FFFFFF00AD5A
      0F00F1C66D00EFC46D00CF8C37009460180053A634FF17C300FF12D401FF18D6
      03FF21DC06FF2CE40CFF46C30BFFA4DE85FF000000FF000000FF000000FF0000
      00FF000000FF5DBA49FF2EB914FF6EF47CFF59F241FF70F562FF75F76AFF7CF9
      7AFF82FA85FF88FA8DFF8EFE9AFF3FDF1DFF0D0BDB00192AFF001827FC00182A
      FC001827FC001827FC001827FC001827FC001828FD001725F8000000E300D1E6
      FA00FFFFFF00FFFFFF000000E300192AFF001928FD001928FD001928FD001928
      FD001827FD001827FC00192AFF000C0AD8002787280031CD5D001EB23400DFEF
      E900FFFFFF00FFFFFF008ACE9C0079C78C00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005FA1620022801F0031CD540026852800827E2800DEA44B00EBBA6400EFC0
      6800B1621600EEE2D500FFFFFF00FFFFFF00FFFFFF00D5B28C009D450200C986
      3300EBBA6200ECBB6500EBBC6400DB9E4500D2B08900FFFFFF00FFFFFF00AF5F
      1200EFC06700EBBA6400DEA44B00A86A1F002D9902FF23AB02FF1BBC02FF1FD4
      06FF25E00AFF32DD0EFF4EB917FF000000FF000000FF000000FF000000FFEAF8
      E4FF2DB109FF1D9F08FF6BE67BFFB9FFCDFFC0FECEFFA5FEB5FF8FFC9DFF74F8
      77FF7CFB80FF86FC8EFF8DFD9BFF3FE320FF0C08DD001B2EFF001A2CFC001A2C
      FC001A2DFD001A2DFD001A2CFC001A2DFD00192BFA000000E4006B9AF300FFFF
      FF00FFFFFF00FFFFFF000000DC001019F000111DF100111DF000111CF000121D
      F0001728F7001B2FFE001B2EFF000B07DA00248B270030CC5B001DB23500E0EF
      E800FFFFFF00FFFFFF008CCE9E0052B56600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D4E9DB001A74170031CE570025852400AA732500E8B86900E8B35B00ECB9
      6200B4651800EFE3D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFC00C28D
      4E00A9550B00D89A4400EEBC6300DB9B4300D6B38B00FFFFFF00FFFFFF00B261
      1300ECB96200E8B35B00E8B86900B66C2200000000FFF1F8ECFFC7E7B8FF65BC
      3DFF38B209FF38B809FF7ACA5AFF000000FF000000FF000000FF000000FF0000
      00FF000000FFC1E7B9FF7ECE70FF34A824FF23BA0FFF3ED53CFF7CF290FFCBFF
      DAFFB8FFCCFFABFFBFFF9CFFB1FF38E21BFF2B4BE9001A2FFE00192DFC001D33
      FE001E34FE001E34FE001C33FD001E36FF000501E500305EEB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007BA3F0002148E4001638DF001637DD001637DD001839
      DA000003CC000F18ED001A30FF002B4BE70051AE610029CB5D001AB03100DFEF
      E700FFFFFF00FFFFFF0090D1A30033A24500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00227E24002E8530002D812D002A7B2D003181
      31000A50000028B441002AC956004FA95D00BB6C1F00F2D09300E8B76500E9B3
      5700B96B1A00F0E6D700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1E7DD00B9772D00B96B1D00D18E3600D8B68F00FFFFFF00FFFFFF00B767
      1600E9B35700E8B76500F2D09400BB6C1F00AC540DFFE7CDBBFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFB2E7AAFF6FD162FF25BF
      15FF2CD21FFF59E865FFACFEBFFF38DE28FF4669EE00618BFF001F3AEB000000
      E3000000E0000000DE000200DF000400DF00133AE600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00ADC9F3001129D900608AFF004669EC006FBC7F007CE0AC003AC16100E9F1
      EB00FFFFFF00FFFFFF0099D5AC000C881200FEFBFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CDE2D100D3E5D700D4E6D700D3E6D600C6E1
      CB003F863D0040A952007DE1A8006FBB7D00BD722700F0CB8700ECC58400EAB7
      6000BE6D1A00F1E5D800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EBDBC400B76A1D00DEBD9300FFFFFF00FFFFFF00BA6A
      1400EAB76000ECC58400F0CB8800B86E2400C47622FFE3B060FFE3B060FFCF88
      32FFCF8832FFD19764FFE7C9ADFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FFA8EF9FFF30DC1BFF4466EF00618AFF003C66F100DEEF
      FA00FFFFFF00FFFFFF005D8DF1000000D700E8F8FD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D2DFF800D2DFF800D2DFF800CDDBF600D2DF
      F8007294E7001129D9006389FF004164ED006DBD7D0078DEAA0075D2940090D5
      A40089CF9A0068C27B002CA23D001B91230053AF6400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFF2EF005FA765007EE0A8006BB97900B46B2400EDC88200E8C07B00EAC5
      8000CC904200F2E6DA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E3C79F00B7641300E0C09600FFFFFF00FFFFFF00CA8C
      3D00EAC58000E8C07B00EDC88200B56A2300B55B00FFEBB32BFFF0CA63FFF8E1
      9FFFFFF0CAFFF2D496FFE5B167FFD58F36FFCA7B2DFFDFAE7BFFF0D9C0FF0000
      00FF000000FF000000FF000000FF000000FF000000FFEABD77FFE7AD42FFE8AA
      3EFFEBB960FF000000FF000000FF000000FF4569F000648AFF00375BEE00CDDE
      F900FFFFFF00FFFFFF0094B4F4002D56E800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000006D0000626D4001B40D700183DD700193D
      D600193DD600486BE5006389FF004568EF006DBE7F0078DFA8007ADEA80075DD
      A50075DDA5007BDEA90082E1B00060DB9A003BA64A009DD0AB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E5EEE600B7D5BB00B8D5BC00B7D5B900B6D4B900BCD7
      BF0065A0640072CD8E007CDFA9006DBA7B00AA5B1A00E9C27B00E7BD7400E8BF
      7500D8A15800F6EEE500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00ECD8BE00C6802B00CB822600D38F2E00E0C19500FFFFFF00FFFFFF00D49D
      5400E8BF7500E7BD7400E9C27B00AA5B1A00BB5F03FFE29501FFE09506FFE39A
      0DFFE5A31CFFEFC55DFFF6D890FFFDEBBEFFFEEDC7FFF5DA9EFFD78F32FFD283
      24FFFAF1E7FF000000FF000000FF000000FF000000FFE2A13BFFFADD81FFFEE6
      96FFFCE38EFFF9D573FFF4D075FFEFB841FF466AF200658FFF00385EEC00CDDE
      FA00FFFFFF00FFFFFF008DACF1005C83EC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A3BDEF003958DF00658EFF004469F0006EC182007AE1AC0079DEA90077DE
      A90077DEA9007ADEA90077DDA70079DEA9007EE2AE005DB36D00D9E7DA00FFFF
      FF00FFFFFF00EDF3EF004E9F55006AC886006DD0930070CF90006DCE90006ECF
      910076D49B0077DDA6007BDFA7006DBE7F00A2682800E0B97800E6B96E00E6BA
      7000DAA45800F6EEE500FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F0E500D7A7
      6200CC842B00DB9D4400E4AF5600DFAC5800EBD6BA00FFFFFF00FFFFFF00D79F
      5400E6BA7000E6B96E00E0B97800A65B1B00BC6106FFE29906FFE39A0FFFE49F
      19FFE7A423FFE7A92AFFEAAB31FFECB032FFF5D57FFFDFA54FFFDCA05BFF0000
      00FF000000FF000000FF000000FF000000FFF0CE99FFE7AB3EFFFEE491FFFCE4
      91FFFEE592FFFFEAB0FFFCE8BAFFF2C564FF456BF3006990FF00365AE900CCDD
      F900FFFFFF00FFFFFF0088A8EF007C9FEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008EACE9003756DB006991FF004569F2006FC3840077E2AE0079DFAB0079DF
      AB0079DFAB0079DFAC0076DEAC007ADEAB0077DFAD0075DBA20061B16E00FEFA
      FC00FFFFFF00E5ECE7005DB26E007BE3AE007ADFA90077DEA8007ADEA80077DD
      A6007BDDA7007ADDA70078DEA8006FC08100AB833A00C9945200EAC88900E4B8
      6600DCA75B00F7EFE600FFFFFF00FFFFFF00FEFDFC00E9CCA200DBA55600E0B0
      6600E4BB6D00E4BA6C00E4B96C00E1B06200ECD8BA00FFFFFF00FFFFFF00DAA4
      5600E4B86600EAC88900C99452009D5D1D00BD6509FFE29C09FFE39C12FFE5A1
      1BFFE7A727FFE9AD31FFEBAF36FFF2CF7CFFCC781AFFE6BC8DFF000000FF0000
      00FF000000FF000000FF000000FFF1D5A8FFE39F32FFFADA7DFFFCE18FFFFDE3
      92FFFEE38FFFFFF2D1FFF6D47CFFF6D898FF476CF4006D96FF003659E800CCDA
      F800FFFFFF00FFFFFF008BA8EF00496FE500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF001038D3001538CF001437CD001437CD001837
      CB002946CF005C82F7006894FF00466BF3006FC686007AE2B20079E0AF0076DF
      AB0079DFAC0079DFAC0076DFAB007ADFAC0077DEAB0078E2AE006FCB8A0083C2
      8E00FFFFFF00FFFFFF005CA25F0075DCA6007ADFAC0077DEAB0077DDA9007ADE
      A90076DEA90076DEA9007AE1AC006FC28400BAAA5500AE662400EBCB9400E6BA
      7100DFAC5B00FAF2EB00FFFFFF00F0DCBF00E0B06700E0AF5F00E2B26300E4B4
      6400E3B36300E3B36300E3B36300E1AE5B00EDD9BA00FFFFFF00FFFFFF00DCA6
      5400E6BB7100EBCB9400AE66240094622400C1660AFFE39C09FFE39E14FFE6A2
      1EFFE7A829FFEAAE35FFEAB036FFF9DFA1FFE9BE77FFD28322FFE4B173FFEECC
      A0FFF8EAD7FFEECA97FFDF9D39FFE4A338FFF7D779FFFDE18DFFFCE08EFFFDE2
      8FFFFEE8AAFFFFF0D5FFEFB538FFFEFCF8FF476FF5006F98FF003558E700CBDC
      F600FFFFFF00FFFFFF008BA9EE003259E000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D5E3F700D5E3F700D5E3F700D5E3F700D5E3
      F7002E4ECD006288F9006D93FF00476CF4006FC8880077E2B40079E0B10079E0
      B10079E0AF0079E0AF0079E0AD0077E0AE0077DFAD0077DFAD0078E5B50057A8
      6000F8F8F900FFFFFF00A0CAA3006FCB8C007AE1AE007ADFAC007ADFAC0079DF
      AB007ADFAC007ADFAB007AE1AE006FC6840000000000A2551A00D09B5900EDCE
      9100E4B76D00F2DFBE00E7BA7700E2B05D00E1AF5A00E1B05A00E1B05B00E1B0
      5B00E1B05B00E1B05B00E1B05A00E0AF5800F1DFC600FFFFFF00FFFFFF00E1B3
      6400EDCE9100D09B5900A153170000000000C2690DFFE59C0CFFE49F18FFE7A5
      23FFE9AB2CFFEAAF36FFEDB33EFFEDB640FFF4CC6DFFF9E4A9FFF2CF8FFFECC3
      76FFE5AA4DFFEEBE5EFFF1C964FFFCDE85FFFBDE87FFFCE08BFFFCE08CFFFEE5
      9BFFFFF5DFFFF4CE6EFFF4D082FF000000FF4A6FF700709AFF003558E600CBD9
      F700FFFFFF00FFFFFF008CA9EE001F41D600EEF4FB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFF
      FD002949C8006189F8006E96FF00486FF50071CA8C007AE4B60079E2B30079E2
      B40076E0B20076E0B20076E0B10077E0B10077E0B10077E0B10078E3B6005FB8
      7200E6EEE700FFFFFF00BCD8C10068C5860078E2B10077E0AE0077E0AE0077E0
      AE0076E0AE0076DFAB0077E1AF0071C7870000000000C8C27C00A1531700DCB4
      7100EAC17A00E7BC6E00E3B76700DEA94B00DEAC5000DFAB5200DFAC5200DFAD
      5300DFAD5300DFAC5200DFAB5100DFAD5600E5B46700E3AF5F00E4B06000E7BC
      7400DCB47100A15317009F743A0000000000C36B0FFFE59D0EFFE7A41BFFE19A
      1FFFE7A735FFECB339FFEDB540FFEEBA48FFF0BE4EFFF0C252FFF3C75DFFF5CC
      68FFF7D171FFF8D576FFFAD87DFFFADA80FFFBDD85FFFCDF88FFFDE49BFFFFF2
      D3FFFBE3AAFFEFB63BFF000000FF000000FF4A70F800749DFF003457E100CDDD
      F700FFFFFF00FFFFFF008EACEC002645D300799BE700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF002F58D300082CC4000B2EC3000C2BC1001B38
      C200486BE500719BFF007098FF004870F60072CC8F007AE5B80079E3B40079E3
      B50079E3B5007BE3B50079E3B40079E2B30079E2B30079E2B3007AE5B8005FB7
      7100E7EFE700FFFFFF00A0CAA2006FCF920078E1B40077E0B10077E0B10077E0
      B10079E0B10079E0B1007AE2B20071CA8B0000000000000000009D854900AB64
      2200E0B97500E8C58000E6C17E00E5C07700E1B76800DEAD5500DCA94800DCA5
      4600DCA54600DCA94800DEAD5500E1B76700E5BF7800E7C07A00E9C47D00E0BA
      7300AB6423009E6128000000000000000000C56F12FFE8A412FFD7881BFFC678
      2EFFCB7824FFE5A943FFEFBA43FFEEBC4AFFF0C052FFF2C55AFFF4C963FFF5CD
      6AFFF6D271FFF8D477FFF9D87DFFFADA7FFFFBDD83FFFDE7A3FFFFF5DEFFFBE4
      AAFFEFB538FFFDF7E9FF000000FF000000FF4B71F900789FFF003758DE00A5BE
      F100CCD9F500CFDDF6007193E5004668E6002243CE00E3EDFA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007E9E
      E3004568E0007398FF00739AFF004B72F80073CE91007BE7BC0079E4B80079E4
      B80079E4B80079E4B70079E4B80076E3B70079E3B7007AE3B5007BE6B90063B8
      7500F0F3F000FFFEFF0060A15E0076DFAE007AE4B50079E2B30079E1B30076E1
      B30079E2B30079E1B3007AE4B60072CC8D000000000000000000000000008F7D
      4A00AB622000D8AB6400E4C27700E5C17600E5C07600E5C17700E5C17800E5C2
      7800E5C27800E5C17800E5C17700E5C07600E5C17600E4C27800D8AB6400AB62
      20009B592200000000000000000000000000C77113FFC87218FFD79F69FF0000
      00FFF9F1E8FFCD7D26FFDFA043FFF3CB6DFFF2C65CFFF2C759FFF4C960FFF4CC
      67FFF7D16EFFF7D573FFF8D778FFFBE098FFFFEFCDFFFEF0D4FFF4CE6EFFEFB6
      3BFFFDF7E9FF000000FF000000FF000000FF496FFA007DA2FF00486BE6003758
      DC003356DC003356DB003655DA00587BEF00597CF000203EC9003A5DD1006183
      DD00A3BDEF00A3BDEF00A3BDEF00A3BDEF00A3BDEF00A3BDEF00A3BDEF003D5C
      CB004B6EE500759AFF00779DFF004970F90073D090007AE9C10079E6BC0079E5
      BB0079E5BA0079E5BA0079E5BA007AE5BA0079E4B70079E4B8007BE7BC0070CC
      90007FBA85007EB884006BC98A007AE7BD0076E3B70079E3B70079E3B5007AE3
      B5007AE3B5007AE3B5007AE6B90073CD8D000000000000000000000000000000
      0000898A58009A4B1300C9904800DDB46A00E3BF7200E4BF7400E3BE7200E3BD
      7200E3BD7200E3BE7200E4BF7400E3BF7200DDB46A00C99048009A4B1300995E
      260000000000000000000000000000000000BF6918FFEED7C1FF000000FF0000
      00FF000000FF000000FFE5B780FFD48321FFE9BB6AFFF3D085FFF8DF99FFFBE5
      A9FFFCE5ABFFFEEBBCFFFFF3D8FFFAE3AFFFF4CF79FFEFB438FFF4D082FF0000
      00FF000000FF000000FF000000FF000000FF4E63DB00638CFE007EA2FF007EA3
      FF007DA2FF007DA2FF007EA3FF007CA1FF0079A2FF007DA6FF006387F3006287
      F3004A6CE200496CE100496AE0004A6CE1004A6CE200496AE000496AE1005C80
      EC007BA4FF0079A1FF00618BFC004E68E80068BA910077DEAB0079E8C3007BE9
      C00079E7C00079E8C0007BE7C0007BE7C0007BE8C1007BE8C10079E8BF007AEA
      C30071D39D0072D7A5007AE9C1007AE7BE007AE7BD007BE5BC007AE5BB007AE5
      BB007AE5BB007AE6BD0076DBA7006AB49B000000000000000000000000000000
      0000000000007ECAA00092430F00A3581A00BD7F3800D2A05400DAB06500E0B8
      6C00E0B86C00DAB06500D2A05400BD7F3800A3581A0091420D00996A32000000
      000000000000000000000000000000000000FAF4EEFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FFF0D2AAFFE5AE61FFDE952CFFE198
      2BFFEDB95BFFE7A938FFE8A934FFEFBE5FFFF5D798FFFEFCF8FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000006F8EFE004A72FD004D74
      FE004D74FE004E76FD004C75FD004D74FE004D74FE004D74FE004D77FE004F76
      FF005077FF005078FF005079FF005079FE005079FE005079FF005179FE005077
      FD004D75FC004A70FC006778D400000000000000000073BFA70076D4940075D3
      970077D5970076D4970075D5970075D5970075D4970075D4970076D4940076D4
      970076D5990076D5990076D4970073D3950073D3950076D4950073D3950073D3
      950073D3950073D1930070B89900000000000000000000000000000000000000
      0000000000000000000000000000B5936D00A56C3F00964D1B008F3E0A00974C
      1100974C11008F3E0A00964C1A00A1673500A27B490000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007D6FF3008277F30000000000000000000000000000000000978FD6008173
      D9009892E300000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000002C98F0000F89ED00249F
      ED00229AEB002098EA002196E7001F91E5001E8FE2001E8EE0001F8DDD001E8A
      DC001D8AD9001C87D7001B84D3001880D100177DCE00177BCB001476C7001272
      C4001272C1000A5EAC00115EA500000000000000000000000000000000000000
      000000000000000000000000000000000000A5737300846B6B00846B6B00846B
      6B00846B6B00846B6B00846B6B00846B6B00A573730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5737300846B6B00846B6B00846B6B002411
      CC004F5AE4005967E9003F2EDD00A5737300000000005B60C3006662E9005C57
      F600585CE0006E7FC2000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF2B98F00058C3F6005AE2F60050DB
      F6004DDAF6004BD8F60048D6F60044D5F60042D3F70041D4F80017B2E8001A77
      A1001A76A1001AB3E8001CBDF30033C4F8002FBFF8002EBAF7002CB6F9002BB2
      F90029AFF90027AEFD001580D400095AA4000000000000000000000000000000
      00000000000000000000846B6B00846B6B00846B6B00846B6B00846B6B00A573
      730000000000A5737300A5737300846B6B00846B6B00846B6B00A57373000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000846B6B00846B6B00846B6B00846B6B009FB6EE00302EDC002B3D
      E4005D8DFF005F91FF002F46E2001B16CB005B69BC001D36CC004F71FA005D87
      FF005074FF002F43D8007379F00000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF7CC188FF9FDDA9FF000000FF9A8E9AFF9889
      97FF7F7E82FF858585FF858585FF858585FF858585FF858585FF858585FF8585
      85FF858585FF8E8E8EFF000000FF000000FF148FEF0087EBF90046D4F4004BD2
      F50048D1F50045CFF50043CFF40040CDF4003FCBF40034C6F400334855002928
      2900262527002A404D0017B7F00030BAF3002CB7F3002BB2F20029AEF10028A9
      F10026A5F10023A1F10023A7FF00095CA3000000000000000000000000000000
      000000000000846B6B00846B6B00A5737300A5737300FF9C9C00FF9C9C00FFBD
      BD0000000000FFCECE00FFBDBD00FF9C9C00FF9C9C00FF9C9C00846B6B00A573
      7300000000000000000000000000000000000000000000000000000000000000
      0000846B6B00846B6B00A5737300A5737300C1B8D2001116E700072CBE003175
      D8002362F8001F63F200307ED8000935D000030BF800275DFF00165EE8000F60
      D9001E5EF8002240FF003237EA00797BD900000000FF000000FF000000FF0000
      00FF000000FF000000FF449752FF3BB64EFF0E7B1FFFA9DEB3FFF5FAF9FFF8F6
      FCFFF8FFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF868686FF000000FF000000FF0886EF008AE9F90045D2F4004CD2
      F50048D2F50045D0F50043CFF40040CDF4003FCCF40022A6D600343233002E2D
      2E002A292A0027252700178EC6002FBAF3002CB7F3002BB2F20029AEF20028AB
      F20026A6F20023A1F20022A4F900095DA6000000000000000000000000000000
      0000846B6B00846B6B00A5737300A5737300FF9C9C00FFBDBD00FFCECE00FFCE
      CE0000000000FFCECE00FFCECE00FFBDBD00FFB5B500FF9C9C00A5737300846B
      6B00A5737300000000000000000000000000000000000000000000000000846B
      6B00846B6B00A5737300A5737300FF9C9C009186A7000A3EC700225CEB001753
      FF001A63FF000757F2000045EC001E64FD000E4AF000004BFB000048EA000051
      F0000043F7000B3BFE000D27C7007181D400000000FF000000FF000000FF0000
      00FF000000FF000000FF00802CFF6ED972FF53B94DFF007F26FFAAD6B7FFEEF3
      F2FFE8E4E9FFE5E5E5FFE7E7E7FFE2E2E2FFE2E2E2FFE6E6E6FFE6E6E6FFECEC
      ECFFFCFCFCFF848484FF000000FF000000FF43A6F20059C2F4005EDDF60049D2
      F50048D2F50045D0F50043CFF40040CDF4003FCCF4001ABEF300484545003634
      3400302E2F00393839000EB2F0002FBAF3002CB7F3002BB2F20029AEF20028AB
      F20026A6F20024A7F7001580D400165A9900000000000000000000000000846B
      6B00846B6B00A5737300FFBDBD00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFC6C600FFB5B500FF9C9C00A573
      7300846B6B00A573730000000000000000000000000000000000846B6B00846B
      6B00A5737300FFBDBD00FFCECE00B9BEC100969CA7000E1AD2003D66FF001967
      EA00136BF5000E56FF001950FF001B50FE001859E4001750FF000040F1000A5E
      FD000358EE000239E8001D2EDB008C91E600000000FF000000FFAAD8BBFF2E8C
      51FF057B30FF008126FF158029FF1AA323FF36BA38FF4FCA4AFF00801AFFA3D5
      ADFFF9FCFAFFE7E7E7FFEDEDEDFFEDEDEDFFEBEBEBFFEAEAEAFFE6E6E6FFEEEE
      EEFFFFFFFFFF848484FF000000FF000000FF00000000027FED008DE7F80043D1
      F50048D2F50045D0F50043CFF40040CDF4003FCCF40025C3F30019A3D5006A68
      68006A68680016A0D3001CB6F1002FBAF3002CB7F3002BB2F20029AEF20028AB
      F20026A7F30023A3F40007559F00000000000000000000000000846B6B00846B
      6B00A5737300FFBDBD00FFCECE00FFDEDE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFC6C600FFB5B500E79C
      9C00A5737300846B6B00A57373000000000000000000846B6B00846B6B00A573
      7300FFBDBD00FFCECE00FFDEDE00FFCECE00FFCECE00515BC6001527C2003260
      FF00115DDF001A6EEC001154FD000949FF00125CFA000A4EFF00004DED000043
      E9000940FB000528CB005164BB0000000000000000FF000000FF419150FF47BD
      54FF41C543FF47BD4CFF48BD4AFF31B735FF10BD15FF2CBB29FF4BC74BFF2594
      4AFFF4FEF2FFC2C2C2FFBEBEBEFFBBBBBBFFBDBDBDFFBFBFBFFFC4C4C4FFDFDF
      DFFFFFFFFFFF848484FF000000FF000000FF000000003F79D4002AA0EF006EE3
      F70043D1F50045D0F50043CFF40040CDF4003ECBF40039C9F400149DD1000F98
      D0000F98D0000F98D00019B8F00030BAF3002CB7F3002BB2F20029AEF20028A9
      F10029B0FB001273C2005C767400000000000000000000000000846B6B00A573
      7300A5737300FFCECE00FFDEDE00FFD6D600FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFC6C600FFB5
      B500FF9C9C00846B6B00846B6B000000000000000000846B6B00A5737300A573
      7300FFCECE00FFDEDE00FFD6D600FFCECE00FFCECE00FFCECE004A4CC900131F
      E3003467FD00226FE3001560F2001864FF00035FEC000A58FF000F63EB00114F
      F7000219F1003F4BDF000000000000000000000000FF000000FF478E56FF82E2
      88FF8CED7FFF96E58AFF8BE37FFF63D050FF25BA2AFF42BB31FF96D886FF2790
      4DFFFFFCFBFFF0F0F0FFEBEBEBFFEAEAEAFFEDEDEDFFEEEEEEFFEBEBEBFFF2F2
      F2FFFFFFFFFF848484FF000000FF000000FF00000000000000000885EC007ADB
      F70044D3F50043CFF50043CFF40040CDF4003FCCF4002DC5F300262D34002525
      260025232500232B320014B7F00030BAF3002CB7F3002BB2F20029AEF2002AAE
      F40023A0ED000959A700000000000000000000000000A5737300846B6B00A573
      7300FFCECE00FFDEDE00FFE7E700FFD6D600FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FF9C9C00FF9C9C00846B6B00A5737300A5737300846B6B00A5737300FFCE
      CE00FFDEDE00FFE7E700FFD6D600FFCECE00FFCECE00FFCECE006A6AD400202E
      C7005E8AFF004588E4003379E4002D75FE000B5BF000105CF2001966E400275D
      F8000918E000484CDA00A573730000000000000000FF000000FFA9DCB7FF3292
      52FF037A2CFF00742EFF0B8128FF2F9E34FF2DB33BFF8CED8FFF00822CFFB0D4
      C4FFECF0EAFFBBBBBBFFC1C1C1FFC6C6C6FFC0C0C0FFBABABAFFC7C7C7FFE5E5
      E5FFFDFDFDFF848484FF000000FF000000FF000000000000000097B6CE000D86
      EB007EE8F9003FCFF50043D0F40040CDF4003FCCF4001DBEF3002A282A002826
      2800262527002524260010B3F0002FBAF3002CB7F3002BB2F20029AFF3002CB6
      FD000C63B3005F5A4200000000000000000000000000846B6B00846B6B00A573
      7300EFD6D600FFE7E700FFDEDE00FFD6D600FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE000000
      0000FFCECE00FF9C9C00846B6B00846B6B00846B6B00846B6B00A5737300EFD6
      D600FFE7E700FFDEDE00FFD6D600FFCECE00FFCECE005C4CD5004D5CB9007FA8
      ED006B9CE80078ADF6005E99DF004179E6004672FF003978F8003775F100386B
      F1004667FA003040C9005159B70000000000000000FF000000FF000000FFF4FF
      FEFFF8FFFCFFD6FFEDFF10792EFF3FBD53FFA1DE8EFF037C2BFFB9DEC4FFF2FF
      FAFFF6F9EAFFF9F9F9FFEEEEEEFFF0F0F0FFF7F7F7FFF2F2F2FFEDEDEDFFF6F6
      F6FFFFFFFFFF848484FF000000FF000000FF000000000000000000000000469E
      DB0060C2F30046D5F7003FCEF40040CDF4003FCCF40019BEF3002E2C2E002B2A
      2B0029282900282628000CB0F0002FBAF3002CB7F3002BB2F2002BB2F5002092
      DD002470B40000000000000000000000000000000000846B6B00A5737300FFCE
      CE00FFDEDE00FFE7E700FFD6D600FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE000000000000000000FFCE
      CE00FFCECE00FF9C9C00A5737300846B6B00846B6B00A5737300FFCECE00FFDE
      DE00FFE7E700FFD6D600FFCECE00FFCECE00A2A3BD00534AE0008AABEA009CD0
      F5007D9CFF008495FF0081A0FB00719EE80078A4FF00699AFF005686FF00548C
      FD00629BFE005575FC003032D600898EEB00000000FF000000FF808685FFFFFD
      FFFFFFDDE4FFFFFCFAFF2C904FFF95DA97FF0B8433FFB7D9BAFFF0F0F0FFBDCD
      C6FFC1C8BBFFE9E9E9FFCACACAFFBDBDBDFFC3C3C3FFC3C3C3FFC9C9C9FFE6E6
      E6FFFFFFFFFF848484FF000000FF000000FF0000000000000000000000000000
      000054ABEF00A1EBFB0048D0F40035CAF3003BCBF40017BCF30034323200302E
      2F002D2C2D002B292B000CB0F0002FBAF3002CB7F3002CB4F3002DB5F8000A61
      B4000000000000000000000000000000000000000000846B6B00A5737300FFCE
      CE00FFEFEF00FFEFEF00FFDEDE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE000000000000000000FFCECE00FFCECE00FFCE
      CE00FFCECE00FF9C9C00A5737300846B6B00846B6B00A5737300FFCECE00FFEF
      EF00FFEFEF00FFDEDE00FFCECE00FFCECE009896BA006766E400B9D6FF008FB9
      E60096ADFF00858CFF00889AFF00759CF1005887E2006892F7005885FE005996
      FE00498FE2006F98FF003939E300726CD100000000FF000000FF808B89FFEEFC
      FAFFEBF6F4FFFEFFF1FFBBD6C6FF6CBC8DFFAEDAB6FFECFEF1FFD5CECBFFC9C2
      C5FFC9BBC6FFF7F7F7FFF1F1F1FFF4F4F4FFF7F7F7FFF1F1F1FFF3F3F3FFFAFA
      FAFFFBFBFBFF848484FF000000FF000000FF0000000000000000000000000000
      00007EBEEA0076C7F30098E7FA0079DDF90062D5F60025C2F300393738003634
      3400333032002F2D2F0009AFF0002BB9F30028B6F30027B7F7001481CF005493
      CE000000000000000000000000000000000000000000846B6B00000000000000
      000000000000FFEFEF00FFE7E700FFD6D600FFCECE00FFCECE00FFCECE00FFCE
      CE00000000000000000000000000FFCECE00FFCECE00FFCECE00FFCECE000000
      00000000000000000000846B6B00846B6B00846B6B0000000000000000000000
      0000FFEFEF00FFE7E700FFD6D600FFCECE00FFCECE00351AC8006C72DB00B2D9
      F9009BCCD6009EC5EC007F98F8003E55E700102ADC005882E3006291FF004F91
      F8004F97EF00537EF5001616A80000000000000000FF000000FF858585FFFDFF
      FFFFE7EAEEFFD4CEC7FFF8F7F3FFF7F9F9FFFFFFFEFFF1EDE8FFC6C3BEFFC2C4
      C5FFBDC5CCFFEBF6FAFFB9C2C6FFBDC4C7FFBEC3C6FFC3C7C8FFC4C3C5FFF0EE
      EEFFFFFFFFFF848484FF000000FF000000FF0000000000000000000000000000
      00000000000041A2EC009AE0F70073DCF70077DBF70059D1F600403D3D003D3B
      3C00383637003533340029BCF3004BC5F40045C4F60050C0F300438AC7000000
      00000000000000000000000000000000000000000000846B6B00A5737300FFCE
      CE00FFEFEF00EFE7E700FFE7E700FFDEDE00FFD6D600FFCECE00FFCECE00FFCE
      CE0000000000FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FF9C9C00A5737300846B6B00846B6B00A5737300FFCECE00FFEF
      EF00EFE7E700FFE7E700FFDEDE00FFD6D600FFCECE00A5B2DE005550D3004251
      CC00A8DEFF008DC2E700363FCC005A4EE8005E61AB001513D1006A9AFF00468C
      EA001D3AD9001D0AAD00846B6B0000000000000000FF000000FF868686FFFAFC
      FDFFE5E7E8FFC3C1C0FFC0C2C3FF878B90FFFCFEFFFFFDFAF6FFFFFCF7FFF6F7
      F5FFF0F5F8FFF6F8F8FFF8F8F8FFF9F9F9FFF8F8F8FFF7F7F7FFFBF9F9FFFAF8
      F8FFFFFFFFFF868686FF000000FF000000FF0000000000000000000000000000
      000000000000A4D4F50063B9EE0097E9FC0071D9F70051D0F60066636300504E
      4E00454242003B393A004DC9F4006ED0F7006DD4FC0055A2D9008BAAC1000000
      00000000000000000000000000000000000000000000846B6B00A5737300FFCE
      CE00FFEFEF00FFF7F700FFEFEF00FFE7E700FFDEDE00FFCECE00FFCECE00FFCE
      CE0000000000FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FF9C9C00A5737300846B6B00846B6B00A5737300FFCECE00FFEF
      EF00FFF7F700FFEFEF00FFE7E700FFDEDE00FFCECE00FFCECE00ABBBCB005E66
      B900534EE700413AD7005F63C200FFCECE00B4BFC3006682A0001724B000313A
      FF002937B900A5737300846B6B0000000000000000FF000000FF858585FFFCFC
      FCFFEDEDEDFFC1C3C4FFBFC3C8FF7C8289FFFBFEFFFFF7F3EEFFFFFEF5FFFFF9
      F2FFFDFAF6FFFFF9F1FFFFFAF2FFFFFCF5FFFCF6F1FFFCF7F4FFEDE9E8FFEBE9
      E9FFE5E5E5FF868686FF000000FF000000FF0000000000000000000000000000
      0000000000000000000045A4EB0093D9F60077DEF90053D0F600777373007773
      7300666363004948480049C9F4006AD0F7005EC0EC004995D000000000000000
      00000000000000000000000000000000000000000000846B6B00A5737300FFCE
      CE00FFEFEF00FFFFFF00FFF7F700FFEFEF00FFEFEF00FFD6D600FFCECE00FFCE
      CE0000000000FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFBDBD00FF9C9C00846B6B00846B6B00846B6B00A5737300FFCECE00FFEF
      EF00FFFFFF00FFF7F700FFEFEF00FFEFEF00FFD6D600FFCECE00FFCECE00B1B9
      CA00856EF2007C65E900ADB4C800FFCECE00FFCECE00FFCECE00857DE100756D
      FA00FF9C9C00846B6B00846B6B0000000000000000FF000000FF838383FFFFFF
      FEFFFBF8F4FFF9F7F6FFF8FAFBFF828589FFFFFDFDFFEDE4DAFFF0E1D1FFF6E8
      D6FFF0E5D7FFFBE6D7FFECD9CCFFF4E4D8FFEFE2DAFFB5ADA6FF8C8985FF7D7E
      7CFF929494FF8C8C8CFF000000FF000000FF0000000000000000000000000000
      000000000000000000000000000046A0E800A0E7FB004ED1F600828181008281
      8100828181006E6B6B004CC8F40069D3FA004D99D50000000000000000000000
      00000000000000000000000000000000000000000000846B6B00846B6B00A573
      7300FFCECE00FFEFEF00FFF7F700FFF7F700FFEFEF00FFD6D600FFCECE00FFCE
      CE0000000000FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFBD
      BD00FFADAD00FF9C9C00846B6B00A5737300846B6B00846B6B00A5737300FFCE
      CE00FFEFEF00FFF7F700FFF7F700FFEFEF00FFD6D600FFCECE00FFCECE000000
      0000FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFBDBD00FFAD
      AD00FF9C9C00846B6B00A573730000000000000000FF000000FF868483FFFFFF
      FCFFFCF6EFFFFFFAF0FFFFFDF8FF888483FFFFFEF9FFF1E4D6FFF2DFCAFFF7E2
      CCFFF2DFCAFFF7E0D0FFF6E1D2FFEFDED1FFEDE1D7FF99918AFFFFFFFCFFF9F9
      F9FFF0F2F2FFABABABFF000000FF000000FF0000000000000000000000000000
      000000000000000000000000000059ACE90082CDF1006EDCF70054B8DC00A3A1
      A100A4A3A30055B7DB0059D1F7005FBAE9005598CD0000000000000000000000
      0000000000000000000000000000000000000000000000000000846B6B00A573
      7300FFCECE00FFEFEF00FFEFEF00FFFFFF00FFF7F700FFE7E700FFD6D600FFCE
      CE0000000000FFCECE00FFCECE00FFCECE00FFCECE00FFC6C600FFBDBD00FFBD
      BD00FF9C9C00A5737300846B6B000000000000000000846B6B00A5737300FFCE
      CE00FFEFEF00FFEFEF00FFFFFF00FFF7F700FFE7E700FFD6D600FFCECE000000
      0000FFCECE00FFCECE00FFCECE00FFCECE00FFC6C600FFBDBD00FFBDBD00FF9C
      9C00A5737300846B6B000000000000000000000000FF000000FF888685FFFFFD
      F6FFEFE8DFFFF3E2CFFFEDE1D5FF8E8883FFFFFEF9FFEBDFD3FFF4E4D3FFF1E0
      CDFFF5E5D4FFF0E0D3FFF1E3D7FFEDE1D7FFE5DBD4FF8F8984FFF5F1F0FFF2F2
      F2FF868889FF000000FF000000FF000000FF0000000000000000000000000000
      000000000000000000000000000000000000409AE400A4E7FA0055D0F50071D5
      F60071D5F60055CEF50069D3F8004692D3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000846B6B00846B
      6B00A5737300FFCECE00FFEFEF00FFEFEF00FFF7F700FFE7E700FFD6D600FFCE
      CE0000000000FFCECE00FFCECE00FFCECE00FFC6C600FFBDBD00FFADAD00FF9C
      9C00A5737300846B6B00A57373000000000000000000846B6B00846B6B00A573
      7300FFCECE00FFEFEF00FFEFEF00FFF7F700FFE7E700FFD6D600FFCECE000000
      0000FFCECE00FFCECE00FFCECE00FFC6C600FFBDBD00FFADAD00FF9C9C00A573
      7300846B6B00A57373000000000000000000000000FF000000FF898786FFFFFE
      F5FFE9E0D3FFF5E2CDFFEADED2FF8D8887FFFFFFFFFFFEF9F6FFFFFFF9FFFFFE
      F7FFFFFDFAFFFFFFF8FFFFFFF7FFFFFFFAFFFFFFFCFF9C9A99FFF4F4F4FF8786
      88FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000007C84900060B1E9008DE3FA0063D4
      F60067D3F6006AD8FA0058ADE200859FA7000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000846B
      6B00846B6B00A5737300FFCECE00FFEFEF00FFEFEF00FFE7E700FFDEDE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFBDBD00FFADAD00FF9C9C00A573
      7300846B6B00A573730000000000000000000000000000000000846B6B00846B
      6B00A5737300FFCECE00FFEFEF00FFEFEF00FFE7E700FFDEDE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFBDBD00FFADAD00FF9C9C00A5737300846B
      6B00A5737300000000000000000000000000000000FF000000FF888685FFFFFF
      F8FFEBE2D5FFF7E6D3FFE5DAD2FF858486FF81848CFF84878CFF808185FF8686
      8CFF80838BFF838782FF828681FF848785FF808381FF828484FF8C8B8DFF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      00000000000000000000000000000000000000000000459FE20091DAF6008AE2
      FA0072DBFA0073D2F4004695D700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000846B6B00846B6B00A5737300FFCECE00FFEFEF00FFCECE00FFD6D600FFCE
      CE0000000000FFCECE00FFCECE00FFBDBD00FFADAD00FF9C9C00A5737300846B
      6B00A5737300000000000000000000000000000000000000000000000000846B
      6B00846B6B00A5737300FFCECE00FFEFEF00FFCECE00FFD6D600FFCECE000000
      0000FFCECE00FFCECE00FFBDBD00FFADAD00FF9C9C00A5737300846B6B00A573
      730000000000000000000000000000000000000000FF000000FF808080FFFFFF
      FFFFFFFFFFFFFDFDFDFFFFFFFFFFFAFAFAFFFFFFFFFFFDFDFDFFFFFFFFFFF9F9
      F9FF9A9A9AFFEEEEEEFF868686FFBEBEBEFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000449BE10073C1
      EB0076C0EB004598DA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000846B6B00846B6B00A5737300A5737300FFBDBD00FFCECE00FFCE
      CE0000000000FFCECE00FFBDBD00FF9C9C00FF9C9C00A5737300846B6B00A573
      7300000000000000000000000000000000000000000000000000000000000000
      0000846B6B00846B6B00A5737300A5737300FFBDBD00FFCECE00FFCECE000000
      0000FFCECE00FFBDBD00FF9C9C00FF9C9C00A5737300846B6B00A57373000000
      000000000000000000000000000000000000000000FF000000FF848484FF8C8C
      8CFF7F7F7FFF828282FF888888FF858585FF888888FF838383FF818181FF8A8A
      8AFF808080FF929292FFC0C0C0FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009ABE
      D50087B3CC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000846B6B00846B6B00846B6B00A5737300A5737300A573
      730000000000A5737300A5737300A5737300846B6B00846B6B00A57373000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000846B6B00846B6B00846B6B00A5737300A5737300A57373000000
      0000A5737300A5737300A5737300846B6B00846B6B00A5737300000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000846B6B00846B6B00846B6B00846B
      6B00846B6B00846B6B00846B6B00846B6B00A573730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000846B6B00846B6B00846B6B00846B6B00846B
      6B00846B6B00846B6B00846B6B00A57373000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAFAFA00DCDC
      DC00B1B1B100B6B6B600F0F0F000F0F0F000B6B6B600B1B1B100DCDCDC00FAFA
      FA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000076767200767672007676
      7200767672007676720076767200000000000000000000000000000000000000
      000000000000000000000000000000000000DFDBE700D5D1DC00BAB7C000B7B5
      BB00B3B2B400A8A9A700B0B2AC00A8ADA400ABB0A7009EA49900A8ADA400ADB2
      A900AAAEA800A5A9A3009EA29D00AAAEA800A3ABA000A9B3A300AAB3A6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2C2C2000000
      000000000000A4A4A400DFDFDF0000000000000000007B7B7B00B0B0B000F0F0
      F000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000076767200E6E2E200E6DE
      DE00E6DEDE00E6E2E20076767200000000000000000000000000000000000000
      000000000000000000000000000000000000FFFBFF00F9F3FE00D5D0D900CECA
      CF00CAC9CB00C3C4C200C9CDC800C1C7C200C1C7C200C1C7C200BEC5C200C5CA
      CB00BEC3C600B6BCC300C1C6CF00B8BFC800C4CDD100BEC8C800BEC6C5000000
      00000000000000000000000000000000000000000000000000007F7F7F008E8E
      8E007F7F7F00838480008A8887008A8586008783880084878F0076808A006478
      8300627C880053788C002F7B87001F7E87002C606D00847F94009B99AC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000098989800A4A4A40000000000EFEFEF0000000000A7A7A700EEEE
      EE00000000000000000000000000000000000000000000000000000000000000
      0000928E8E008E8A8A0000000000000000000000000076767200D6D2CE00DAD6
      D600DAD6D600D6D2CE00767672000000000000000000000000008E8E8A00928E
      8E0000000000000000000000000000000000FFFCFF00ECE8EE00C4C0C500BFBC
      BE00BFBFBF00B9BBBB00C1C6C500B9BFBE00ACB3B600C3C9D000BBC1CC00BBC2
      D300B4B8D000B9BDD900C1C4E300888DAE009A9FBE00A8AFCA00B2B8CF000000
      00000000000000000000000000000000000000000000000000008A8A8A00F5F5
      F500FFFFFF00FFFFFB00FDFCF800F9FDFE00F3FEFF00C8E2F00076A1B4004F89
      9F005FA5BC003B88A200DEECFF00E0F5FF003D7B930071B4C90029798A003088
      960080B5C9000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000EFEFEF0000000000B0B0B000F0F0
      F000000000000000000000000000000000000000000000000000000000008E8A
      8A00A29E9E00DEDADA0096928E008A8A86007E7A7A00726E6E006A6666006E6E
      6E006E6E6E006A666600726E6E007E7A7A008E8A8A0096928E00DEDADA00A29E
      9E008E8A8A00000000000000000000000000FFFFFE00F0ECEB00C9C5C400C4C2
      C100C7C7C700C1C3C400C8CBCF00BCC1CA00C6CBDA00C3C9E000B4B9D800BEC2
      EB00B7BBEC00B4B6F000AFAFEF006769AA000E0F53007A7ABA00B9BAF2000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00E6ECE100E2EBEE00EAE6EB00ECE6F100479CAB00BDCDDE00EAF1
      FF001179960018769A00C6F3FF00C8EAFA00157397000D789400F7F3FE00ACCF
      D9003089B5000000000000000000000000000000000000000000FEFEFE00FAFA
      FA00F5F5F500F4F4F400F4F4F400F4F4F400F4F4F400F4F4F40000000000FFFF
      FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00C3C3C30000000000D2D2D200EFEF
      EF00F4F4F400F5F5F500FAFAFA00FEFEFE0000000000000000008A8686009A96
      9200D6D6D200B2AEAE007E7E7A005E5E5A0042424200565252007A7676008A86
      86008A8686007A76760056525200424242005E5E5A007E7E7A00B2AEAE00D6D6
      D6009A9696008A8686000000000000000000FFFFF800F3F0E800CDCBC300C9C9
      C300CACBC900C1C5C600C6C8D200B9BDCF00B8BBD70066698F00393C6F004949
      890042408C0039368C003B3894001D1A7D00100C71000400600035308500C5C1
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FDE7EC00F0E7E300DBECE900DEE9F1005AA2AA00EDEFFF00CAEC
      FF00C8F1FF00A0C9F600A5D3EB0097D3E9009DCBF400C2E8FF00D1EEF500DDF9
      FF00468BAC000000000000000000000000000000000000000000FAFAFA00E3E3
      E300CDCDCD00C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800A2A2A2000000
      0000FFFFFF00EFEFEF00C3C3C300C3C3C3000000000088888800C3C3C300C8C8
      C800C8C8C800CDCDCD00E3E3E300FAFAFA00000000000000000086828200D6D6
      D200B6B2AE007A7A76003E3E3A0052524E009E9A9A00EAEAEA00FAFAFA00FEFE
      FE00FEFEFE00FAFAFA00EAEAEA00A29E9A0052524E003E3E3A007E7A7A00B6B2
      AE00D6D6D600868282000000000000000000FFFFF400F7F7E700D3D3C700CECF
      C500CDCECA00C3C6CA00C8CBD900BDC1DA00CFD0F60049497F00121056001815
      6A000F096E0010097800191088001C139200251AA0002219980011077900261B
      7B00847CC300000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00DCDCE200C5DBD600E9DAD700D3D0D20088B3C6000B718E00DDF3
      FF00B2F0F000C6EBF900C9E7F800BFECFF00B2E8FF00B1E5FC00C5EDFF00146F
      8A0071ADDB000000000000000000000000000000000000000000949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00EFEFEF00000000000000000000000000000000000000
      00000000000073737300CDCDCD00F5F5F5000000000000000000000000008E8E
      8A00A29E9E005A5A560076727200CAC6C600E6E6E200EAE6E600EAEAEA00F2EE
      EE00F2EEEE00EAEAEA00EAE6E600E6E6E600CAC6C600767272005A5A5600A6A2
      9E00928E8A00000000000000000000000000FFFFF100F7F5E300D4D3C500CECF
      C500CDCECA00C4C7CC00CDCFE100C4C6E500C6C6F60047468800272277002721
      86001E168B00291EA2001E139F00160A9E000C009B001D12A800251AA000160C
      7E00332A8100605996000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00EFEEF000E0E7E400F2F3F100B4D1D500398492000D7C9200B1CC
      E700CBF0F800D5F5FA008EC6D90092C3DD00BFEDFE00AAEAF500AFCDF000177B
      9D001F76960069A2B8000000000000000000000000000000000000000000BAC9
      C6007894900076928E0075918E0076928E0075918E0073908C00728F8B00728F
      8B0000000000FFFFFF00C3C3C300000000004A5D5B006A858100728F8B00728F
      8B005167640000000000C8C8C800F4F4F4000000000000000000000000008682
      82006E6A6A0076727200C6C6C200DEDEDA00E2E2DE00C6C2C200767672007676
      72007676720076767200C6C2C200E2E2DE00DEDEDA00C6C6C200767272006E6A
      6A0086828200000000000000000000000000FFFFF200F5F3E100DEDDCF00D6D4
      CC00D3D3D300D0D1DB00C9CBE300C6C7ED00CBCAFF0042418B002F2988002018
      8A00170D8F003127B7001A0EA8001B0EB000140AB1000C03A700180EA0002A22
      9E00231C7D00231F66007976A30000000000000000000000000084848400FFFF
      FF00FFFFFF00F1EEF000F8F2E700EEE8F30020909C00DFF7FF00EEF4FF009DD3
      EA00E9ECFF0096BFDF0014739E00066F960098C3D400D4F1F800A3D4E200CDED
      FF00F3FBFF00357E94000000000000000000000000000000000000000000E0E8
      E800B4C9C700B4C9C600B4C9C600B3C9C600B3C8C500B2C7C500B0C6C400AAC0
      BC0000000000FFFFFF00EFEFEF00000000006C7C790093A9A600A2BAB800A4BE
      BA00728F8B0000000000C8C8C800F4F4F4000000000000000000000000007A76
      76005A5A5600AEAAA600D6D2D200DEDADA00BEBEBA0086828200000000000000
      0000000000000000000086828200BEBEBA00DEDADA00D6D6D200AEAAA6005A5A
      56007A767600000000000000000000000000FFFFF500F7F4E600E1DFD400D9D6
      D100D6D5D700D2D3DD00CECFE400C9CBEE00D3D4FF0044428800201C75002A24
      8F00231B970020169F0010059700190FA9001D16B3001714AD001E1AA2001D1A
      8E0034318D008A87CC000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00E5F4EC00EAF2EB00FFE7F9002A909D00F1F9FF00DBF4FE00B9E2
      F100CCF1FF0088C2D80011729600187A9C008FC2D200CAF7FB00A8D4E500C1EF
      FF00FEF9FF004B90A1000000000000000000000000000000000000000000E7EE
      EC00B6CBC700B6CBC700B6CBC800B5CAC700B4CAC600B3C8C600AEC4C1007A8A
      880000000000FFFFFF00C3C3C30000000000657371007283810090A4A200A1BA
      B700728F8B0000000000C8C8C800F4F4F4007676720076767200767672006E6A
      66007A767600C6C2BE00D2CECE00BABAB60086828200000000009A9692008A86
      86008A8686009A9696000000000086828200BEBAB600D6D2CE00C6C2BE007A7A
      76006E6A6A00767672007676720076767200FFFFF900F7F4EC00E4E0DB00DBDA
      D600D9D9D900D5D7DF00D1D4E300CED1ED00D2D4FC00595B91001D1D63002323
      77001F1D7D001F1A87002923980025239B001F1F9B001D1E960013158100494A
      A500BABCFF00000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00EFE9E200DFD7E100D5DBE000A4BDC70028859A001A7B8900E1F5
      FF00D0F1FF00D8FAFA008DCDD80095BCD200DBF8FF00B2EAF500E0F1FF001777
      95001984A0009FC9D5000000000000000000000000000000000000000000E8EE
      ED00B8CCC900B8CCC900B8CCC800B7CBC800B6CBC800B5CAC600889896000000
      0000FFFFFF00EFEFEF00EFEFEF00C3C3C30000000000505C5A00738481009CB2
      B000728F8B0000000000C8C8C800F4F4F40076767200AAA6A600AEAAA600726E
      6A00A29E9E00BEBAB600C6C2BE0076767200000000009A9696008A8A8600AAA6
      A600AAA6A6008A8A86009A9696000000000076767200C6C2BE00BEBABA00A29E
      9E00726E6E00B2AEAA00AEAAA60076767200FFFFFC00F6F3EF00E5E1E000DDDB
      DA00DBDBDB00D6D9DD00D5D7E100D3D7E900DBDFF800C0C4E700A1A5D500A9AB
      E500A4A7EB00A5A8F300A1A1F5006263BB001C227B0020277C00797FCA00D7DE
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFF0F400E7ECEF00FFF8F900EDECF500B0D0ED0019759200B9D6
      EB00E0F8F600D9F7FC00E1F1FF00D3F0FF00DBF3FF00DFF0FF00AECCE7002E71
      900059A3C700000000000000000000000000000000000000000000000000EBF0
      EF00BACDCB00BACDCB00BACDCA00B8CCCA00B7CBC900B7CBC80000000000FFFF
      FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00C3C3C300000000006E7D7C009AB2
      AF0075918E0000000000C8C8C800F4F4F40076767200BAB6B600C2BEBE008682
      8200B6B2B200B2AEAE00B2AEAA0076767200000000008A8A8600B2AEAA00CAC6
      C600CAC6C600B2AEAA008A8A86000000000076767200B6B2AE00B6B2AE00BAB6
      B2008A868600C6C2BE00BEBAB60076767200FFFEFF00F6F1F300E7E2E300DFDD
      DD00DCDCDC00D7DCDB00D7DCDF00D7DDE200C3CAD300DFE6F500D4DCF300D6DE
      FB00D3D9FE00D7DDFF00D4D8FF00858CBD00495486009DAAD800D0DCFF000000
      000000000000000000000000000000000000000000000000000084868700FDFF
      FF00FDFFFF00F2F7EE00E8F9F000FFF6F900EDF1F6005E9EA200E4F8FF00FFF4
      FF00AAD5EA00FFF9FF00BBDAE900BFE0E900D6F2FD00B2D9EF00E0F4FF00EBFF
      FF00438BA300000000000000000000000000000000000000000000000000ECF1
      F000BCCFCC00BCCECC00BBCECC00BACECB00B9CDCA00B8CCC90000000000FFFF
      FF0000000000000000000000000000000000EFEFEF0000000000748582009DB3
      B0007894900000000000C8C8C800F4F4F40076767200BEBAB600C6C2BE009E9A
      9600CAC6C600B2AEAA00AEAAA60076767200000000008E8A8A00BAB6B200DEDA
      D600DEDAD600BAB6B2008E8A8A000000000076767200B2AEAA00B2AEAA00CECA
      C6009E9A9A00C6C2C200C2BEBA0076767200FFFDFF00F4F0F500E7E4E600E0E0
      E000DEDFDD00DBDEDC00DADFDD00DCE3E000D5DDDC00E3EBEB00D1DADE00CFD8
      E100CBD2E100CDD4E700DDE4F800BCC5D900C3D1E400C4D2E400DEEBFB000000
      000000000000000000000000000000000000000000000000000084868700FBFD
      FE00FCFEFF00FCF4F400F2FAF900FFF0F700EFFAFF0058A7AA00A4CFDE00E6F2
      FF002A7B8A0000709800EDF9FF00F5FBFF001D7599001B718F00EFFCFF00BBC3
      D4005F9BB800000000000000000000000000000000000000000000000000EBF0
      F000BED1CD00BED0CE00BCD0CC00BCCFCC00BACECB00B9CDCA0000000000FFFF
      FF00000000007F8E8C00A5BAB80000000000EFEFEF000000000091A6A300A4BC
      B9007C96930000000000C8C8C800F4F4F40076767200D2CECE00DAD6D600BEBE
      BA00D2CECE00AEAAAA009E9A9A007676720000000000A29E9E00928E8E00C2BE
      BE00C2BEBE00928E8E00A29E9E000000000076767200A29E9A00B2AEAA00D6D2
      CE00C2BEBE00DAD6D600D6D2D20076767200FFFDFF00F4F3F700E8E7E900E3E3
      E300E1E2DE00DEE2DC00DFE3DD00E1E9DF00D9E0D900DEE5DE00DEE5E000EAF1
      EE00E8EDEE00DBE2E500DAE0E500CFD8DB00D4E0E000E2EFED00E6F1EF000000
      000000000000000000000000000000000000000000000000000086868600FEFE
      FE00FEFEFE00F9E4EC00D8E1E500D7E3E900D6DAE500B5D2DB0065A0A9005691
      9B0098C3D2002A89AA00EBFDFF00E2F9FF003D7DA0008AC1DC00347A8700549F
      B50000000000000000000000000000000000000000000000000000000000EBF0
      EF00BFD1CF00BFD2CE00BED1CE00BDD0CD00BBCFCC00BACDCB0094A5A2000000
      000000000000A9BDBA00AFC4C200000000000000000082949200A7BEBB00A8C0
      BE0075918E0000000000C8C8C800F4F4F400767672007676720076767200C6C6
      C200DEDADA00BEBAB6008A86860096928E008A86860000000000A29E9E00928E
      8A00928E8A00A29E9E00000000008A8A8600969292008A868600BEBABA00DEDE
      DA00CAC6C600767672007676720076767200FFFEFF00F6F5F700EBEBEB00E6E7
      E500E4E6E000E2E5DC00E2E7DE00E6ECE100E5EBE000E2E7DE00E0E5DC00DEE2
      DC00E1E5E000E6E9E700E5E8E600E3E9E400E6EEE700DAE3D900E1E9DF000000
      000000000000000000000000000000000000000000000000000087858400FFFF
      FE00FFFFFE00FDFFFF00EEF0F100FDFEFF00F2F7FA00F3FCFF00EFF7FE00F1F7
      FE00F3FAFF00C3CFE100368C9800348D9700A7BFCB00DCD9E2007F8989000000
      000000000000000000000000000000000000000000000000000000000000ECF1
      F000C1D3D100C1D3CF00C0D2CF00BFD1CE00BDCFCC00BBCECB00B9CDCA00B8CB
      C800B6CBC700B4C9C600B2C8C400B0C6C400AEC5C200ACC4C000ABC2BE00A8C1
      BE007894900000000000C8C8C800F4F4F400000000000000000000000000827E
      7E00D6D2D200DEDAD600868282007E7A7A0096928E008A8A8600000000000000
      000000000000000000008E8A8A0096928E007E7A7A0086828200DEDADA00D6D2
      D200827E7E00000000000000000000000000FDFFFE00F6F9F700EBEFEA00E4E8
      E200E6E8E200E8EBE200E8EBE200E7EAE100F4F7EE00DADCD600F0F2EC00E5E6
      E200E3E4E200E6E6E600F2F2F200DEDFDD00E5E9E400E2E6E000E8E9E5000000
      000000000000000000000000000000000000000000000000000087858400FFFF
      FC00FDFAF600F8FAF400FFFFFB00F6FAF400FFFFFB00FFFEFB00FFFBF700FFFF
      FC00FFF6F500DCD8D7008A969A007D7F7F008C8588009097A0007B867E000000
      000000000000000000000000000000000000000000000000000000000000EBF0
      F000C3D4D200C3D4D100C1D3CF00C0D1CF00BDD0CE00BCCECC00B9CECA00B7CC
      C900B6CBC700B4C9C600B2C7C500B0C6C300AFC4C200ADC3C000ABC2BF00A9C0
      BD007C96930000000000CBCBCB00F5F5F500000000000000000000000000928E
      8E00BAB6B200EAE6E600BEBEBA00767272006E6A6A007E7A7A00767672007676
      72007676720076767200827E7A00726E6A0076727200C2BEBE00EAE6E600BAB6
      B600928E8E00000000000000000000000000FDFFFB00F5F9F300EAEEE800E4E8
      E200E6E9E000E7EAE100E7E9E300E6E8E200E7E6E200E2E1DD00EFEDEC00E2E0
      E000EFECEE00E2DFE100E6E2E700E8E5E700E5E3E200EAEBE900F5F3F3000000
      000000000000000000000000000000000000000000000000000089868200FFFE
      F900F3EFEA00EBEBDD00FFE8DE00F4EBDE00E7F1E100EFE3D900F9EAE100E5E9
      DD00FBFFF5009B92A700FAFDFF00FFFFFE00F9F1F800EAEAF600A99D9B000000
      000000000000000000000000000000000000000000000000000000000000F6F7
      F700C5D6D300C3D5D100C1D3D000BFD2CF00BED0CD00BCCFCC00BACDCB00B8CC
      C900B6CBC800B4C9C600B3C8C500B1C7C300AFC5C200ADC4C100ABC2BF00A9C1
      BE00677C7A0000000000DBDBDB00F9F9F9000000000000000000000000009A96
      9200DAD6D600EEEAEA00EEEEEA00BEBAB6006A6666005A5A5A00525252004242
      420042424200525252005A5A5A006A666600BEBABA00F2EEEE00EEEEEA00DEDA
      DA009A969600000000000000000000000000FDFFF900F6FBF200ECF1E800E7EC
      E300E9EBE500EAECE600EAEBE700E9EAE800E8E6E600F4F2F200F4F1F300E5E1
      E600FEFAFF00ECE7F000EEE6F100F4EFF800F4F0F500E8E4E900E9E5EA000000
      00000000000000000000000000000000000000000000000000008C888300FFFF
      FA00EFE9E200F7ECDE00FEEDE000FBE5DA00F5EFE200E9EDE100FCE9E100FDEB
      E400EAFFF80078858700FFF8F600FBEFEF00F2F1F30087868800000000000000
      000000000000000000000000000000000000000000000000000000000000DDE7
      E600F3F6F500DDE7E600DDE7E600DDE7E600DDE7E600DDE7E600DBE5E400DDE7
      E600D9E4E200D9E4E200D8E3E100D8E3E100D9E4E200D8E3E100D8E3E100D6E1
      DF003A403F0058585800F0F0F000FDFDFD0000000000000000008E8A8A00FEFE
      FE00DED6D600EAE6E600F6F6F200F6F6F200EAE6E6009E9A9A00666262004E4A
      4A004E4A4A00666262009E9A9A00EEEAE600F6F6F600F6F6F600EAE6E600DEDA
      DA00FEFEFE008E8E8A000000000000000000FDFFF900F9FEF500EFF3ED00EBEF
      E900EDEEEA00EEEFEB00EDEEEC00ECECEC00E8E5E700F0EDEF00EEEAEF00DDD9
      DF00F1ECF500EEE9F200F0EAF500CDC8D100C3BFC500B2AEB400C4C0C6000000
      00000000000000000000000000000000000000000000000000008D898400FFFF
      F900EFE9E200F8EFE200FCECE000FFEBE300F2E7DF00FAECE600FFE5E500FFE5
      E400FBFFFA008B8A8000EFF5F000EDF5F40080878400BFC0B700000000000000
      000000000000000000000000000000000000000000000000000000000000F0F4
      F30099AEAB009CB1AE009CB0AE00A1B5B200A0B4B2009DB2AF005C716E000000
      0000000000000000000000000000000000000000000000000000000000000000
      000074747400CFCFCF00FDFDFD00000000000000000000000000928E8E00BAB6
      B200FEFEFE00EAE2E200F2EEEE00CAC6C600EAEAEA00FAFAFA00FAF6F600F6F6
      F600F6F6F600FAF6F600FAFAFA00EAEAEA00CAC6C600F2EEEE00EAE6E600FEFE
      FE00BAB6B600928E8E000000000000000000FFFFFB00FAFCF600F1F2EE00EDEE
      EA00EDEEEC00EEEEEE00EDEDED00ECEBED00EEEDEF00EAE9EB00F1F0F400E6E5
      E900E7E5EB00F5F3F900F4F3F70088878B005E5D610084838700C3C2C6000000
      000000000000000000000000000000000000000000000000000086868600FAFA
      FA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009A9A9A00EAEAEA008D8D8D00B6B6B60000000000000000000000
      0000000000000000000000000000000000000000000000000000A4A4A4006674
      7300DEE5E400CAD5D300CAD5D300CAD5D300CAD5D30097A7A50000000000B4B4
      B400FAFAFA000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000928E
      8E00BEBAB600FEFEFE00A29E9E009696920086828200EAEAEA00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00EAEAEA00868282009A969200A29E9E00FEFEFE00BEBA
      BA0096928E00000000000000000000000000FEFFFD00F7F8F600EFEFEF00ECEC
      EC00ECECEC00EDECEE00ECEBED00EAE9EB00F0EFF100E8E7E900F5F4F600F2F4
      F500EBEBEB00F4F6F600F2F3F1005F605E0063636300B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000868686008E8E
      8E00828282008585850085858500858585008585850085858500858585008585
      8500858585007E7E7E0092929200C0C0C0000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4A4
      A400000000000000000000000000000000000000000000000000BFBFBF00FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000096928E0096928E0000000000000000000000000076767200F2EEEE00F2EE
      EE00F2EEEE00F6F2EE007676720000000000000000000000000096928E009692
      920000000000000000000000000000000000FFFEFF00F9F8FA00F1F0F200EEED
      EF00EDEFF000EEF0F100ECEEEF00EAECED00E4E6E600E4E7E500E5E8E600E6EC
      E700E8ECE600E4ECE200E9EFE40071766D00C3C7C10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000076767200FEFEFE00FEFE
      FE00FEFEFE00FEFEFE0076767200000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFF00FDFCFF00F6F5F900F3F2
      F600F2F3F700F3F4F800F1F3F400EEF0F000F6F8F800FDFFFC00EAF0EB00ECF4
      EA00FBFFF900F0F9EC00FBFFF700B7C0B3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000076767200767672007676
      7200767672007676720076767200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AB591600AB5916000000
      0000B26E2D00B06B2A00B06B2A00B06B2A00B06B2A00B06B2A00B06B2A00B06B
      2A00B06B2A00B06B2A00B06B2A00B06B2A00B06B2A00B06B2A00B06B2A00B26E
      2D0000000000AC5B1800AB591500AC5B18000000000000000000000000007A4E
      0D007A4E0D007C4D08007B4D08007B4D08007B4D08007B4D08007B4D08007B4D
      08007B4D08007B4D08007B4D08007B4D08007B4D08007B4D08007A4C07007647
      08007647080009357800546C9B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000090562A00D7961F00D2A14F00D3B47F00D4CBBF0000000000000000000000
      00000000000000000000000000000000000000000000EEC86D00E59A14007F84
      9500DCE0E400D6D9DE00D6D9DE00D6D9DE00D6D9DE00D6D9DE00D6D9DE00D6D9
      DE00D6D9DE00D6D9DE00D6D9DE00D6D9DE00D6D9DE00D6D9DE00D6D9DE00DCE0
      E4007F849500E69D1900DE9A2200AC5B18000000000000000000000000007A4E
      0D00F2EEE400F2EEE400F2EEE400F2EEE400F2EEE400F2EEE400F2EEE400F2EE
      E400F2EEE400F2EEE400F2EEE400F2EEE400F2EEE400F2EEE400F2EEE400F2EE
      E40006308600CBFFFF006CB3DA00516EA5000000000000000000000000000000
      0000FDFDFD00FAFAFA00F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800FAFAFA00FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000092491700D7971F00D2901C00D2901C00D2901C00D2901C00C78A3500E2C5
      9400F9F1E200000000000000000000000000BC722800ECC97900E3991600908F
      9D00DEDDDC00DBDAD800DEDCDB00DEDEDC00DFDEDD00E0DFDD00E0E0DE00E1E0
      DF00E2E1DF00E2E2E000E3E2E100E4E3E100E5E3E200E5E3E200E1E0DE00E0DE
      DD00908F9D00E49C1D00E0A02800B6681C000000000000000000000000007F53
      1400EEE9E100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00023A
      9500BDFFFF00D3FFFF0018A0FF000A4B9700000000000000000000000000FDFD
      FD00EDEDED00CECECE00B4805700B4805600B4805500B47F5500B47F5500B480
      5500B4805500B47F5500B3805600B4805600B4805600B4805700CECECE00EDED
      ED00FDFDFD000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DCBBA100BF9F87008C8C
      92008B4C1900D8991F00D2901C00D2901C00D2901C00D2901C00D2901C00D290
      1C00D2901C00D4952600E4BB6E00D0AB8E00BD762D00EECD8000E49B1E009594
      A100E4E5E300AFA4A6009A898E009181870087777F007F71750076676D006D5F
      660064575F005D4F560055484E004E424900473A43003C3239005F555B00E9E9
      E8009594A100E59E2500E2A23100BA6B20000000000000000000000000007F53
      1400EEE9E100E4CABB00A55F3500A55F3400A55F3400A55F3400A55F3400A55F
      3400A55F3400A15C3200A15A3200A25B3200A35C3200A45C3300063E9A00B8FD
      FF00CEFFFF000089FF00074394000000000000000000A9AAAA00707070006D6E
      6E005A5A5A0032323200B1805700F3DEC500F4DEC500F3DDC500F3DEC500F4DD
      C500F4DEC500F3DEC500F4DEC500F3DDC500F3DEC700B27F570032323200595A
      5A006D6E6E00707070009D9E9E00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B97A4300864B1F000B10
      1B006F370200D9991F00D2901D00D2901D00D2901D00D2901D00D2901D00D290
      1D00D2901D00D2901D00D5951D00A4581F00BF773000EFCF8500E59E25009999
      A500E5E6E400E7E8E600E7E8E600E7E8E600E7E8E600E7E8E600E7E8E600E7E8
      E600E7E8E600E7E8E600E7E8E600E7E8E600E7E8E600E7E8E600E7E8E600E7E8
      E6009999A500E7A12B00E4A73800BC6C22000000000000000000000000009068
      2A00EEE9E100FFFFFF00F5F3ED00F5F2EE00F5F2EE00F5F2EE00F5F2EE00F5F2
      EE00F5F2EF00F7F4ED00F5F4EA00F0F2EA00F2F0ED00005ABA00B2FAFF00D5FF
      FF00058CFF00024EA50000000000000000000000000067676700616262005E5F
      5F00484949001B1B1B00B3815800F9EADA00F8EADA00F8EADA00F8E9DA00F8EA
      DA00F8EADA00F9EADA00F9E9D900F8EADA00F8E9DA00B38158001B1B1B004849
      49005E5F5F006162620063646400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AF713C00894E20000A0F
      1B00743A0200DA992000D3901E00D3901E00D3901E00D3901E00D3901E00D390
      1E00D3901E00D3901E00D6941D00A75D2300C37A3100F0D18C00E6A32B009F9D
      AA00ECEAE900DCDADA00D9D8D700DAD6D700D8D7D600D8D5D600D7D4D400D6D4
      D300D6D2D300D4D2D100D4D1D100D3D1D000D2D0CF00D0CDCE00D3D2D100EDEC
      EA009F9DAA00E7A63100E5AB3E00BE7026000000000000000000000000009068
      2A00EEE9E100FFFFFF00F5F3ED00F5F2ED00F5F2ED00F5F2ED00BEB4B200826A
      6A006F535100684B4B00AD9E9A00F4F2E7004480BE0058C8FF00ECFFFF00048A
      FF000359B700845611000000000000000000000000008D8E8E00878888008384
      84006364640023232300B4845B00FBF1E700FBF2E700FBF1E700FBF1E700FBF1
      E800FBF1E800FBF1E700FBF1E700FBF1E700FBF1E700B4835B00232323006364
      640083848400878888008A8B8B00000000000000000000000000000000000000
      00000000000000000000564949000000000000000000A4652D008D512200090F
      1B00783D0200DB992100D4911F00D4911F00D4911F00D4911F00D4911F00D491
      1F00D4911F00D4911F00D7951E00AA612500C57F3500F1D39000E7A73200A4A2
      AF00F0F0EE00B2A8AA0097878B008F7F840085757D007D6F730074646B006C5D
      630062555D005B4D540053464C004C3F470045384100392F360062565D00F4F5
      F300A4A2AF00E9AA3900E6AE4600C07327000000000000000000000000009068
      2A00EEE9E100DBB8A500AC653B00AC653B00AC653B004E231F009A6F5D00E8DE
      B000FEFAC800F9F2D200D2C8C8007E4F400091635E004DAFFF000585FA00066F
      CA00E3D9CA0084561100000000000000000000000000939394008D8D8E008989
      8A0069696A0027272700B6875F00FBF2E700FBF1E700FBF1E700FBF2E700FBF1
      E800FBF1E800FBF2E700FBF1E800FBF1E700FBF1E800B6865E00272727006969
      6A0089898A008D8D8E0090909100000000000000000000000000000000000000
      000000000000000000001513CD000000000000000000AC6C27008D552500090F
      1B007B410200DB9A2300D4922000D4922000D4922000D4922000D4922000D492
      2000D4922000D4922000D7961F00AD652800C7833500F0D39400E9AB3800A8A7
      B400F0F1F000F0F1F000F4F5F300F5F7F500F6F8F600F7F9F700F8F9F800F9FB
      F800FAFBFA00FBFDFA00FCFEFC00FDFEFD00FEFFFD00FEFFFD00F8F9F800F2F2
      F100A8A7B400EAAE3E00E8B34B00C37729000000000000000000000000009A72
      3A00EEE9E100FFFFFF00F5F3ED00F5F2ED0063454A00D7A77E00FFFFCE00FFF4
      C600FFFFD900FFFFE700FFFFFF00FFFFFF0099605300A46658002097EF00FFFF
      FF00E3D9C900845611000000000000000000000000009A9A9B00959596009292
      9300787879004343440029292A00262627002626270026262700262627002626
      2700262627002626270026262700262627002626270029292A00434344007878
      7900929293009595960098989900000000000000000000000000000000000000
      000000000000000000001513CD001B1BE40000000000A66A220092582600090E
      1B0080460600DC9B2500D6952200D5942300D5942300D5942300D5942300D594
      2300D5942300D5942300D7972200B0682C00C9853900F2D59800EBAE3E00ACAA
      B800F6F5F500F8F7F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7
      F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7
      F700ACAAB800ECB14300EAB65000C67B2C000000000000000000000000009A72
      3A00EEE9E100FFFFFF00F5F3ED00BBAFB000AE785E00FFECB500E0BA9A00F3DF
      B900FBF3D300FAF2DD00FEFAEC00FFFFFF00FFFFFF009F5B4800F5EEEC00FFFF
      FF00E3D9C90084561100000000000000000000000000A8A8A900A4A4A500A3A3
      A40098989900848485007A7A7B00797979007979790079797900797979007979
      790079797900797979007979790079797900797979007A7A7B00848485009898
      9900A3A3A400A4A4A500A6A6A700000000000000000000000000000000000000
      000000000000000000001513CD00242CF8001519E8007E4E6400A1621F00090E
      190086490A00D7911F00C4872700D7962300D5952500D5952500D5952500D595
      2500D5952500D5952500D7992400B36B2D00CB893900F3D79D00ECB24400B2AF
      BD00F9FAF800C7C0C200B3A9AB00AEA3A600A79D9F00A0999B009B919400968B
      90008F858B0089818500847A800080737B007870760070686D00928B8E00FDFE
      FC00B2AFBD00EDB54900EBBA5600C87D2E000000000000000000000000009E7B
      4100EEE9E100DBB8A500AC653B006C413D00F7BC8900E4B99400E6C5A100F9EA
      CA00FCF3D100FBF2D600FDFCEB00FFFBF600FFFFFF00CDC2BF0092472800FBF6
      F400E3DACB0084561200000000000000000000000000BBBBBB00B8B8B800B8B8
      B800B7B7B700B4B4B400B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3
      B300B3B3B3000ACE22000F8F1E00B3B3B3000ACE22000F8F1E00B4B4B400B7B7
      B700B8B8B800B8B8B800BABABA00000000001F2CEB001F2CEB00222DEB00222C
      EB00212CEB00212BEB00222CEC002532F4002331F6001925F700362482000D11
      0E00884B0B00EAD09500C4CBDC00C0791700D7992900D7972800D7972800D797
      2800D7972800D7972800D99B2700B7702F00CD8D3D00F4D8A000EEB54900B6B7
      C200FAF9F900F7F6F600F9F9F900FAF9F900FAFAFA00FBFBFB00FCFBFB00FCFB
      FB00FCFCFC00FDFDFC00FEFDFD00FEFDFD00FEFEFD00FEFEFD00FBFBFB00FAFA
      FA00B6B7C200EEB74F00EDBB5B00CA8531000000000000000000000000009E7B
      4100EEE9E100FFFFFF00F5F3ED007C555300FFC58C00E3C4A100EACBA600EFD7
      B200FFFAE700FBF5DF00FBF3DB00FDF5E300FFFFFC00DFD7D100A98F8D00FFFF
      FF00E5DBCF0084571300000000000000000000000000CECECE00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00EAEAEA00EAEAEA00CDCDCD00000000006D76EF00263DF4002A3FF4002A3F
      F4002A3EF400293DF400293CF400273AF3002739F3002839F500202FF8000B09
      8F0090510600EAC87500DEC39100D4942500D7992C00D79A2C00D79A2C00D79A
      2C00D79A2C00D79A2C00DA9E2C00B9743100D0904000F3DAA500EEBA5000A6A6
      B500FFFFFF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FEFF
      FF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FFFF
      FF00A6A6B500EFBC5600EEBF6100CD8833000000000000000000000000009C7D
      4E00EEE9E100FFFFFF00F7F4EC008A5F5E00F3B58100E8CCA300F1DDBB00F5E3
      CD00F0D8AF00FFFBEB00FCF1D500FAF1D400FFFFE800E3D9C200AB959000FFFF
      FF00E2D3C40085591500000000000000000000000000DCDCDC00DADADA00DADA
      DA00DADADA003F3F3F003F3F3F003F3F3F003F3F3F003E3F3F003E3F3F003F3F
      3E003F3F3F003F3F3E003F3F3F003F3F3F003E3F3F003F3F3F003E3F3F00DADA
      DA00C4C4C400C4C4C500DBDBDB00000000006F78EF002A44F4002D46F4002D45
      F4002C45F4002C44F4002C42F4002C42F4002B41F400293EF4002F48F6005C6F
      FF004F2B7D00E8B84D00DFAD4D00E0B05400DDA74500D99E3200D99B2F00D99C
      3000D99C3100D99C3100DCA03100BC783300D2944200F5DCAA00F0BF5C00B892
      690091796B00977B6700977B6500977B6500977B6500977B6500977B6500977B
      6500977B6500977B6500977B6500977B6500977B6500977B6500977B67009179
      6B00B8926900F0C16300F0C26800CF8A3500000000000000000000000000A086
      5900EEE9E100E4CABB00AB633700805B5B00E4996700EBCAA200FFFFDF00FFFF
      FF00F2DBC200F3E1BD00FAF0CA00F9E9C600FFFFDE00D5C6A70082472E00F5EE
      EA00DACAB600875B1700000000000000000000000000DFDFDF00DEDEDE00DEDE
      DE00DEDEDE0049494900626262007474740090909000B0B0B000CECECF00E3E4
      E300EBEBEB00E0E0E000C7C8C700A8A8A8008D8D8C007C7C7C0049494900DEDE
      DE008B8C8B008B8B8B00DFDFDF0000000000707BF2002A45F4002C48F4002C47
      F4002C46F4002C45F4002C46F3002F48F4002C45F4003852F50095A7FF001B1A
      CF0096581900E7BB5A00E0B25600E0B25600E0B35700E1B45A00DEAC4B00D9A0
      3600D99F3600DAA03700DCA43700C17D3500D4964400F6DDAC00EEBE6300F2C3
      6700FAC86400A5897300B8A28A00B6A08800B6A08800B6A08800B6A08800B6A0
      8800B6A08800B6A08800B6A08800B6A08800B6A08800B8A28A00A5897300FAC8
      6400F2C36700EFC06800F1C46C00D28F3700000000000000000000000000A58E
      6500EEE9E100FFFFFF00FCFFFC00C5BAB900C37C5600ECBA8A00F6E5B900FFFD
      DC00F1DDB900F4E1BF00E9C8A600EDD2AE00FFFFCB008F696200CABCB200EFE6
      E000D1BFA500885D1A00000000000000000000000000CFCFCF00CDCDCD00CDCD
      CD00CDCDCD0053545400626262007575740090909000B0B0B000CECECF00E4E4
      E400EBEBEB00E0E0E000C8C7C800A8A8A9008C8D8D007C7C7C0053535400CDCD
      CD00CDCDCD00CDCDCD00CECECE00000000007480F40084A0FA00849EF900849E
      F900839CF900849CF9008BA0FA002E4BF4003D5BF60091A7FF002620D6000B0D
      11009A5E1D00E8BC6500E2B45D00E2B45D00E2B45D00E2B45D00E2B65E00E3B4
      5E00DFAB4B00DDA33B00DFA73E00C4803600D69A4700F7E0AF00EFC36700F0C5
      6C00F6C86700A29EAA00D8D8D900D4D3D500D4D3D500D4D3D500D4D3D500D4D3
      D500D4D3D500D5D4D500D7D6D700D7D7D800D7D7D700D8D9DA00A29EAB00F6C8
      6700F0C56C00F0C56C00F3C97000D4933A00000000000000000000000000B194
      6E00EEE9E100FFFFFF00FCFCFB00F2F0EC00976B6600DB906000EABA8900EED1
      A500EBD6B200E0B99500E7BF9600FFEBB100C79B7E008F787C00DCCDBD00E3DB
      CC00C7B695008A5E1D00000000000000000000000000969696006F6F6F006F6F
      6F006E6E6E005E5E5E005E5D5E005D5D5D005E5E5E005E5E5E005E5E5E005E5E
      5E005E5D5D005E5E5E005E5E5D005E5D5E005E5E5E005E5E5E005E5E5E006E6E
      6E006F6F6F006F6F6F008D8D8D00000000003A3AED004D50EF004B4EEF004A4E
      EF004A4EEF004B50EF00363BEF004467F70094ACFE006245B700A56B2C00070C
      14009E652400E9C16C00E4B96500E4B96500E4B96500E4B96500E4B96500E4B9
      6500E4BA6700E4B66000DFAA4600C8843900D99D4900F7E1B300F0C66C00F0C7
      7100F7CA6B00ACA9B400DBD9D800D8D6D500D8D6D500D8D6D500D8D6D500D8D6
      D500D8D6D500DBD9D900BAB7B900BAB8BC00B9B6BB00D1D0D000AFADB500F7CA
      6B00F0C77100F0C77100F2CC7600D8973C00000000000000000000000000B89E
      7500EEE9E100E4CABB00AC643900AB633900A3684C009D726900C17C5400D991
      5F00EDAE7800F6BB8200E9B78600B88673007F5555009C562F00954F2A00DBCD
      BB00C1AE8F008B62200000000000000000000000000000000000000000000000
      00008F8F8F0077777700CDA88200F6EDE600F5EEE600F6EDE700F5EEE700F6EE
      E700F6EDE700F6EEE700F5EEE600F6EDE700F5EEE600CDA78200777777008F8F
      8F00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000292BEF008DA1F9002527FA00BB862E00AB713200060B
      1600A46A2700ECC47500E6BC6D00E6BC6D00E6BC6D00E6BC6D00E6BC6D00E6BC
      6D00E6BC6D00E6BC6F00E8C07100CA893700DBA04C00F8E4B500F1C87000F1C9
      7500F7CC6F00B3AEBA00E0DFDE00DDDCDB00DDDCDB00DDDCDB00DDDCDB00DDDC
      DB00DDDCDB00E5E6E700654F3D00A6825700A57F5100938F9500B8B5BF00F7CC
      6F00F1C97500F1C97500F3CE7A00DA9B3F00000000000000000000000000BBA4
      7D00EEE9E100FFFFFF00F9FCFC00FAFAFA00FAFAFA00F0F0F200C4B9BB009C7C
      7A009F7D7E009B7C7800A2868800B5A18D00C5B39500C4A68800BEA57C00BEA5
      7C00A48048008E65270000000000000000000000000000000000000000000000
      00008B8B8B007A7A7A00CFAB8600F4EDE500F4EDE600F4EDE500F4EDE500F5ED
      E500F4EDE600F4EDE600F5EDE500F4EDE600F5EDE600CFAA86007A7A7A008B8B
      8B00000000000000000000000000000000000000000000000000000000000000
      000000000000000000002B27F1001B17F10000000000E4AF5B00AB753600060A
      1600AA6F2B00EDC97B00E8C27400E8C27400E8C27400E8C27400E8C27400E8C2
      7400E8C27400E8C27400EAC67900CD8C3B00DEA64E00F9E5B800F1CB7400F2CD
      7900F7CE7300B8B4BF00E4E3E200E1E0DF00E1E0DF00E1E0DF00E1E0DF00E1E0
      DF00E1E0DF00E7E9EB00A3805200FFD97F00FFD67A00918F9B00C0BDC500F7CE
      7300F2CD7900F2CD7900F4D17E00DC9F4200000000000000000000000000BCA6
      8200EEE9E100FFFFFF00F7FCFC00FAFAFA00FAFBFB00FAFCFA00F8F9F100F4F1
      E600F1EBE200EEEAE400DBCDBB00BDA17800FFFFFF00F3F1F000F2EEE400DAD3
      C600B89D740090682A0000000000000000000000000000000000000000000000
      0000898989007C7B7C00D1AD8900F4ECE500F4ECE400F4ECE500F4ECE500F4EC
      E500F4ECE400F4ECE500F4ECE400F4ECE400F4ECE400D1AD89007C7B7C008989
      8900000000000000000000000000000000000000000000000000000000000000
      000000000000000000001812F1000000000000000000DFAC6500AF783800050A
      1500AF752E00EFCD8400EAC67D00EAC67D00EAC67D00EAC67D00EAC67D00EAC6
      7D00EAC67D00EAC67D00EDCA8300D0903C00E0A95100FAE4BA00F3CD7900F4CE
      7D00F9D07700BCB9C400E8E7E600E5E4E300E5E4E300E5E4E300E5E4E300E5E4
      E300E5E4E300EBECF0009F7E5400FBD58000FDD47A0096949C00C3C0CB00F9D0
      7700F4CE7D00F4CE7D00F6D38200DFA14400000000000000000000000000BCA5
      8400EEE9E100E4CABB00AA643900AB633900AC643900A9633700A65F3500A35C
      3300A25A3200A25A320087472200BDA17800FFFFFF00F2EEE400DCCEBD00B89D
      74009E7B41000000000000000000000000000000000000000000000000000000
      0000878787007C7C7C00D3B08C00F3EBE300F3EBE300F3EBE300F3EBE400F4EB
      E400F3ECE400F4ECE300F3EBE400F3EBE300F4EBE300D3B18C007C7C7C008787
      8700000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0AE6900B17B3A00040A
      1500B27A3200F1D18F00EDCA8600EDCA8600EDCA8600EDCA8600EDCA8600EDCA
      8600EDCA8600EDCA8600EFCE8D00D3943D00E2AB5200FBE7BC00F4D17D00F5D2
      8100F9D37B00C2BEC900ECECEB00E9E9E800E9E9E800E9E9E800E9E9E800E9E9
      E800E9E9E800EFF2F500A2815600FFDB8600FFDA81009996A000C9C5D000F9D3
      7B00F5D28100F5D28200F8D98B00E0A24300000000000000000000000000BEA8
      8600EEE9E100FFFFFF00FCFCFC00FAFBFC00FDFBF600F5F3EE00EBE8E500E8DF
      D800E7D7CC00E2D4C600CEB89E00AC946700F2EEE400EEE8E100B4986A009E7B
      4100000000000000000000000000000000000000000000000000000000000000
      0000929292007C7C7C00D4B38F00F1E9E000F2E9DF00F2E9E000F2E9DF00F2E8
      DF00F2E9DF00F2E9DF00F1E9E000F2E9E000F2E9DF00D5B38F007C7C7C009292
      9200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E3B36A00B37E3B000409
      1400B8803700F4D79700EFD08F00EFD08F00EFD08F00EFD08F00EFD08F00EFD0
      8F00EFD08F00EFD08F00F1D49600D6993F00E4AF5400F9E8BE00F4D37D00F5D4
      8300F8D47D00C8C5CD00F0F0EF00EDEDEC00EDEDEC00EDEDEC00EDEDEC00EDED
      EC00EDEDEC00F5F7F90083694A00DCB87100DAB36A009E9BA100CCCAD400F8D4
      7D00F5D58400F7D98B00E7B45300C38F5000000000000000000000000000BEAB
      8900EEE9E100FFFFFF00FAFAFC00F6FAF300F9F0E900F4E8E000E8E2D800E3DB
      D000DED0BD00DCCEB800CAB28F00AC946700D8D0C100B5996F009E7B41000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F80085858500D5B59100EFE3D500F0E3D500F0E3D500EFE3D500EFE3
      D500EFE3D500F0E3D600EFE3D500F0E3D600F0E3D500D6B6910085858500F8F8
      F800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5B76C00B8823E00040A
      1400C6903F00FFE4A900F8DE9F00F6DA9C00F3D79A00F2D79900F2D79900F2D7
      9900F2D79900F2D79900F4DBA000D89C4100E6B35900FBEED100F6D98D00F5D4
      8000F9D57C00CBC8D000F4F4F300F1F1F000F1F1F000F1F1F000F1F1F000F1F1
      F000F1F1F000F7F8F6009D9AA000A09EA5009C9AA100D5D3D400CECBD300F9D6
      7C00F8DA8D00E8B65600D6A74900FF00FF00000000000000000000000000BEAB
      8900EEE9E100FFFFFF00FFFFFF00FEFFFE00F8F5F400F5EDE700ECE4D900E0D7
      CB00DACCB400D7C4AF00C3AD8600997B4100BCA17B009E7B4100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F5F5F500D8B99500EEDFCD00EEDFCD00EEDFCD00EEDFCD00EEDF
      CD00EEDECE00EEDFCD00EEDFCD00EEDFCE00EEDFCE00D8BA9500F5F5F5000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E6BB7000B7833F000409
      140026211C0084745800907B5D00C8B18200F4DCA600FEE8B000FAE4AD00F9E2
      AB00F7DFA900F6DFA700F7E2AF00DBA04500E6AC4900FBEDCC00FCEED200FBE9
      C000FFEBBD00DBDDEB00FBFFFF00F9FDFF00F9FDFF00F9FDFF00F9FDFF00F9FD
      FF00F9FDFF00FAFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DBDEEC00FFED
      C500ECBE6600D7AA4A00FF00FF00FF00FF00000000000000000000000000C0AE
      8C00EEE9E100EEE9E100F1EEE600ECE3DC00E2DBCE00DED3C200D9CCB700CEC1
      A500CBB49400C5AC8B00AC946700997B41009A723A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DABB9800DABA9600DABA9600DABA9600DABA9600DABA
      9600DABA9600DABA9600DABA9600DABA9600DABA9600DABB9800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DBA65600D09B48007051
      2E0075552F006D4F2C006B4D2B0067492900624527005C402400B28B4F00BF96
      5500EDCA7B00F0D38F00F4D99B00DFA74800E5A94200E7B14C00EBBB5C00EBBA
      5C00EBBB5B00E7BB6900E7BB6900EABF6B00EABE6B00EABE6B00EABE6B00EABE
      6B00EABE6B00EABE6B00EABE6B00EABE6B00EABF6B00E7BB6900E0AF5D00EAB8
      5300C8965900FF00FF00FF00FF00FF00FF00000000000000000000000000C0AE
      8C00C1AC8B00BFA98700BEA88600BFA98600BFA98800C0AA8900C0AB8B00BEA2
      7B00BEA47E00B59D6F00A78D5C009A723A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9C07400E6B35200EAB7
      5500EBB85500EBB85500EBB85500EBB85500EBB85500EAB75500E8B35100E6B1
      5000E3AD4E00E3AC4D00E3AC4D00E4B050000000000000000000000000000000
      0000000000000000000000000000B5948C00B5735A00A5735A009C7B6B00A594
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC000000000000000000946746009567
      4600956745009567460095674500956746009567460094674500946745009467
      4600946745009567450094674500956746009567450094674600946746009567
      4500946746009467450095674500000000000000000000000000000000000000
      00000000000000000000AD948400AD4A00009C3900009C3100009C3100008C31
      00007B3108007B422900735242008C7B7300B5948C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00000000000000000097684700E7D0
      B600E7D0B600E6D0B700E6D0B600E7D0B600E6D0B600E6D0B600E7D0B600E7D0
      B600E6D0B600E6D0B600E7D0B600E7D0B600E6D0B700E6D0B700E7D0B600E6D0
      B600E7D0B700E6D0B60097684600000000000000000000000000000000000000
      000000000000B5948C00AD4A0000D66B00009C390000AD633900E7CEC600CE9C
      8400BD7B5200A54A18009C3100008C3100007B3108007B422900735242009C94
      8C00000000000000000000000000000000000000000000000000000000000000
      00000000000031638C00CE948C00CE948C00B5848400B5848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7EBE600ECF0EB00EAE9E500ECE7
      E400DBD3D300E2E0DF00D5CED100D8C8D300272531005C6E7900B3C7C800AAB6
      B800B2B9CA00C8C2C300CFCACB00D3D2D400C5CACD00C6CECE00C5CAC900D5D2
      CE00DBD2CE00E2E2E200F1F1F100EAEAEA000000000000000000996A4700E7D3
      BA00E7D2BB00E7D3BA00E7D2BA00E8D3BA00E7D3BB00E7D2BB00E7D3BB00E7D2
      BB00E7D3BA00E8D2BB00E7D3BA00E8D3BA00E7D2BA00E7D2BA00E7D2BA00E8D3
      BA00E8D2BB00E7D3BA0099694700000000000000000000000000000000000000
      0000B5948C00B5520800DE730000D6730000A5420800BD735200EFDECE00E7D6
      C600E7CEBD00DEC6B500DEB5A500C68C7300B56B4A00A54A18009C3100007339
      2100B5948C000000000000000000000000000000000000000000000000000000
      000031638C00B5848400DEA59400F7EFE700F7EFE700EFDED600CEADA500B584
      8400B58484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EBECEA00F0F1EF00DCDDDB00DCDA
      DA00D2D0D000E0E4E500C0CECA00D0CDC5001A1719000017170021758F001572
      93005086A700A5B9BE00CFD8DC00C9C8CC00D4CFD000E3E5E500CACFCE00C3C2
      C400BAB3B600D8D8D800EDEDED00EAEAEA0000000000000000009B6B4800E8D5
      C000C6986E00C6986E00C6986E00C6986E00C6986E00C6986E00C6986E00C698
      6E00C6986E00C6986E00C6986E00C6986E00C6986E00C6986E00C6986E00C698
      6E00CA9D7500E8D6BF009B6C490000000000000000000000000000000000B594
      8C00B55A0800E77B0000DE7B0000D6730000A5420800BD7B5A00EFDED600EFD6
      CE00E7CEC600E7C6BD00DEC6B500DEBDA500D6B59C00D6AD9400CE9C8400B584
      6B00BD735200000000000000000000000000000000000000000000000000426B
      B500426BB500B5848400DEA59400FFF7EF00F7EFE700F7EFE700F7EFE700F7EF
      E700EFDED600CEADA500B5848400B58484000000000000000000000000000000
      000000000000000000000000000000000000EDEBEB00EEEDEF00D5D7D800E0E4
      E500E7ECEF00D3E1DB00F0EDEF00D3EFEF003E5551003E77960075DAFF0074D2
      FF00156FA6005490A0009DC0CE00E4EAF100F0E8E900E7E0DD00EFEFEF00EFEF
      F500BEBAC500CECECE00EAEAEA00ECECEC0000000000000000009F6D4900EAD9
      C400C6986E00F9EAE000FFF7F500FFF8F600CA9F7A00FFF7F500FFF5F200FFF6
      F400CB9F7A00FFF6F300FFF3F000FFF5F300CB9F7900FFF4F200FFF4F000FFF5
      F300C6986E00E9D9C3009E6E490000000000000000000000000000000000BD5A
      1000E7840000E7840000DE7B0000DE730000A5420800BD7B6300EFE7DE00EFDE
      D600E7D6C600E7CEBD00DEB5A500D6B59C00D6AD9C00D6AD9C00D6A58C00CE9C
      8400BD735200000000000000000000000000000000000000000000000000396B
      AD00426BB500B5848400DEA59400FFF7EF00FFF7EF00F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700EFDED600CEADA500B5848400B58484000000
      000000000000000000000000000000000000EBE8EA00EEEAEF00D2D3D700E6EB
      EE00EAF3F600EEDBDE00F9F6F100DBEEFB003079A500A3E6FF0069CCF80064D3
      FF0066D0FF00127395004C90AD00A3C1D200E5E8ED00ECE2E200F1E7E700F2EF
      F100CECDD600CBCBCB00EBEBEB00EDEDED000000000000000000A16F4A00EBDC
      C900C6986E00F9EBE200FFF8F600FFF9F800CAA07B00FFF8F700FFF6F400FFF8
      F600CB9F7A00FFF7F500FFF4F200FFF6F400CB9F7A00FFF5F300FFF5F200FFF6
      F400C6986E00EADCC900A1704A0000000000000000000000000000000000CE63
      0000EF840000E7840000E77B0000DE7B0000A5420800BD846300EFE7DE00EFDE
      D600EFD6CE00CE9C8C00D6A58C00D6AD9400CE9C8400CE9C8400D6AD9400D6A5
      8C00BD735200000000000000000000000000000000000000000000000000426B
      B5004273CE00B5848400DEA59400FFF7F700FFF7EF00FFF7EF00FFF7F700B5AD
      B5004E4E4F004E4E4F00ADADAD00F7EFE700F7EFE700F7EFE700B58484000000
      000000000000000000000000000000000000ECE8ED00EDEBF100CCCDD100DFE3
      E400DAE0DF00E2E2E200D0DDDB00E3D9D900A8C0C000097AA200A1E6FF006CD8
      FA0054D4FF0066D5FF00107098004F90AC00A1BECD00D8D8DE00EDE0E200E8E3
      E200DDE0DE00CDCDCD00EDEDED00EDEDED000000000000000000A4724B00ECE0
      CE00C6986E00C89C7400CAA07B00CAA07B00C28F6100CAA07B00CA9F7A00CAA0
      7B00C28F6100CAA07A00CA9F7A00CA9F7A00C28F6100CA9F7A00CA9F7A00CA9F
      7A00C6986E00ECDFCE00A4724C0000000000000000000000000000000000CE6B
      0000EF8C0000EF840000E7840000E77B0000A5420800C68C6B00F7EFE700EFE7
      DE00E7D6D600297BAD002973AD0021639C006384A500C68C7300D6AD9C00D6A5
      9400BD735200000000000000000000000000000000000000000000000000426B
      B5004273CE00B5848400DEA59400FFFFFF00FFF7F700FFF7EF00FFF7EF003535
      3700B5ADB500A59C9C004E4E4F00BDB5B500F7EFE700F7EFE700B58484000000
      000000000000000000000000000000000000EBECF000EBECF000CECECE00F4F1
      ED00F5F2EA00D8E6DB00F2D7C900EFBF8500CF9B66008C786D00167C9300A3E6
      FF0070D6FF0068D4FF006ED7FF00167295005695B1009FBBCC00E7EAF200EFED
      EC00CDD2C900CDCDCD00EDEDED00ECECEC000000000000000000A8734D00EEE2
      D300C6986E00F9EEE500FFFBFA00FFFBFB00CAA17B00FFFBFA00FFF8F700FFFA
      F900CBA07B00FFF9F900FFF7F500FFF9F800CBA07B00FFF8F700FFF8F500FFF9
      F800C6986E00EEE3D300A7744D0000000000000000000000000000000000CE6B
      0000F78C0000EF8C0000E7840000E78400009C3900008C5A4200F7EFEF00F7E7
      E700EFDED600EFD6CE00E7CEC600D6C6BD00849CB500C6ADA500D6B59C00D6AD
      9400BD735200000000000000000000000000000000000000000000000000426B
      B5004273CE00B5848400DEA59400FFFFFF00FFFFFF00FFF7F700FFF7F700FFF7
      F700FFF7F700F7EFE700353537008C848400F7EFE700F7EFE700B58484000000
      000000000000000000000000000000000000E8EDF000E8ECED00D4D1CD00FFF7
      ED00F7EADC00D9B69500E4813100E3884300F1A95C00F1AF5000B0936E001172
      9400A9E9FF0080DAFD006ED1F70070D9FF001E79A0004888A700ADCEE100DEEA
      EE00CDD1CB00CCCCCC00EDEDED00EDEDED000000000000000000AA764D00EFE6
      D800C6986E00F9F0E800FFFDFD00FFFEFF00CAA17C00FFFDFE00FFFBFA00FFFD
      FD00CBA17C00FFFCFC00FFFAF800FFFBFB00CBA17B00FFFAFA00FFFAFA00FFFB
      FB00C6986E00EFE6D800AA764E0000000000000000000000000000000000CE6B
      0000F7940000EF8C0000EF840000E7840000943100005A392900F7F7EF00F7EF
      E700EFE7DE00EFDED600EFD6CE00E7CEC600DEC6B500DEBDAD00DEB5A500D6AD
      9C00BD735200000000000000000000000000000000000000000000000000426B
      B5004273CE00B5848400DEA59400FFFFFF00FFFFFF00FFFFFF00FFF7F700ADA5
      AD00B5ADB500A5A5A5004E4E4F00A5A5A500F7EFE700F7EFE700B58484000000
      000000000000000000000000000000000000E1EAED00E8EEED00D3D0C800E9DC
      CE00BDA79500EB821900F3B56E00FFC77600FABC5000FDC15700FDC36400C0AA
      810015749F00A2F1FF0083DDFB006DD8FE0067D2FE001D77A0004B849E00A8C1
      CB00D8DADA00CBCBCB00EDEDED00EEEEEE000000000000000000AD784F00EFE8
      DC00C6986E00CB9F7600CDA37D00CCA37D00C2916300CAA27D00CAA17C00CAA1
      7C00C2916200CAA17C00CAA17C00CAA17C00C2906200CAA17C00CAA17C00CAA1
      7C00C6986E00F0E9DC00AD784F0000000000000000000000000000000000D66B
      0000F7940000F78C0000EF8C0000EF840000943100006B423100F7EFEF00F7EF
      EF00F7E7E700EFDEDE00EFDECE00E7D6C600E7CEBD00DEC6B500DEBDAD00DEB5
      A500BD735200000000000000000000000000000000000000000000000000426B
      B5004273BD00B5848400DEA59400FFFFFF00FFFFFF00FFFFFF00FFFFFF003535
      37004E4E4F00353537009C949C00F7F7EF00F7EFE700F7EFE700B58484000000
      000000000000000000000000000000000000E5EBF200F8E7F200D7CFC800FEBF
      7500D9863000FAC97900EEC37A00FFE5AF00FFF0CA00FFEADB00FFF3CF00FFE1
      B000BFB1800006709F00B6EEFF0084DEFF005AD9FF008AD8F50017799700707A
      9800AEBDC600CECDCF00F8EFEB00F4EBE8000000000000000000B0794F00F1EB
      E100C6986E005676FA005B7DFF00AFC0FF00CCA37E00FFFFFF00FFFDFE00FFFF
      FF00CBA27D00FFFEFF00FFFCFC00FFFEFE00CBA17C00FFFDFD00FFFDFD00FFFE
      FE00C6986E00F1EBE100B079500000000000000000000000000000000000D673
      0800FF940000F7940000F78C0000EF8C0000BD6B3900F7CEAD00E7BD9400D6A5
      7B00E7B58C00E7BD9400EFC6A500E7BDA500DEBDAD00DEC6B500DEBDAD00DEB5
      A500BD735200000000000000000000000000000000000000000000000000426B
      B5004273BD00B5848400DEA59400FFFFFF00FFFFFF00FFFFFF00FFFFFF003535
      3700CECECE00CECECE00FFF7EF00FFF7EF00FFF7EF00F7EFE700B58484000000
      000000000000000000000000000000000000F0EBED00F7EFF600D0BA9E00C880
      3200FFC27200FFC78200FDFEEA00FCFEF800FFFEF600C6A38900FFFFF800FFFF
      F200F9F9E900C8B68D0011729400C2F0F800A1E8FC004C5D5400D7CFC2005859
      5700809BBD00A9B0C900EFEEEA00F9F3EC000000000000000000B27B5000F2EE
      E400C6986E000028FF00002AFF007C99FF00CCA47E00FFFFFF00FFFFFF00FFFF
      FF00CBA27E00FFFFFF00FFFDFF00FFFFFF00CBA17D00FFFEFF00FFFEFF00FFFF
      FF00C6986E00F1EDE400B27B510000000000000000000000000000000000D673
      0800FF9C0800FF940000F7940000F7A53100FFEFE700FFF7EF00F7DEC600F7DE
      C600F7D6B500EFC6A500F7CEA500C6845A00522108006331100063392900A56B
      5200B5948C00000000000000000000000000000000000000000000000000426B
      B5004273BD00B5848400DEA59400FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADA5
      AD0035353700353537007B737300FFF7F700FFF7F700F7EFE700B58484000000
      000000000000000000000000000000000000F5E8E600E6EBEC00DBA86A00EDA2
      5300F9C67D00FFF1DE00FDFCF800FFFFFF00EDFFFF00FFFFFE00FAFDFF00FFFC
      FF00F1FFFF00FFF0D300B4B3870068556600E0EBE900F0EEFA005B5B6100CAC8
      DB000A13A00093A0EA00CED9DD00EEEDDF000000000000000000B37C5100F3EF
      E700C79A7100C79A7100C79A7100C79A7100C79A7100C79A7100C6986E00C698
      6E00C6986E00C6986E00C6986E00C6986E00C6986E00C6986E00C6986E00C698
      6E00CA9F7900F2EFE800B47C510000000000000000000000000000000000D673
      1000FF9C1000FF9C0000FF940000F7A53100FFEFE700FFFFFF00FFEFE700F7D6
      BD00F7D6BD00F7D6BD00D6A59400C6846B00C6947B00C68C6300BD6B3900844A
      290000000000000000000000000000000000000000000000000000000000426B
      B5004273BD00B5848400DEA59400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7F700FFF7F700B58484000000
      000000000000000000000000000000000000F9EEEA00E2EFED00D9862A00FFCD
      7D00F3C98400FFF7F800FFFFFB00FFFFF900F1F9F800FFFBF000FBFFFF00FFFD
      FF00FBFBFB00FFFCFD00FFCB7F00B79774005A5B5200E1EBF200F1ECEE00808A
      FF004945FC0009119A00B7C5DC00F2F4E1000000000000000000B57D5200F3F1
      EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1
      EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1
      EA00F3F1EA00F3F1EA00B57D520000000000000000000000000000000000D67B
      1800FFA51800FF9C0800FF940000F7940000D68C4200F7EFE700FFF7EF00EFD6
      C600F7D6C600D6AD9C00CE9C8400D6AD9400D6AD9400D6A58C00C68C6300844A
      290000000000000000000000000000000000000000000000000000000000426B
      B5004273BD00B5848400DEA59400FFFFFF00FFFFFF00FFFFFF004A5A52004A5A
      5200CECECE00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7F700B58484000000
      000000000000000000000000000000000000F0F1EF00E5EFEF00D9750F00F7C9
      7B00FFD49200D3A88700EBF8FF00F5FCFF00FAFFFF00E7A66200FFFFFB00FFFB
      FF00FFFFFC00CFA67900F9D08700FFD187009970270054664900BFB9FF006590
      FD005E71FF000808B000B4BDE800F2F5E5000000000000000000B57D5200F3F1
      E900F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1
      EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1EA00F3F1
      EA00F3F1EA00F3F1EA00B57D520000000000000000000000000000000000D67B
      2100FFA52900FFA51800FF9C0800FF940000D6843900EFD6C600E7C6A500E7A5
      5A00D6A58C00D6A59400D6AD9C00D6B59C00D6AD9C00D6A59400CE946B008C52
      290000000000000000000000000000000000000000000000000000000000426B
      B500426B9C00B5848400DEA59400FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECE
      CE004A5A52004A5A52004A5A5200CECECE00FFFFFF00FFF7F700B58484000000
      000000000000000000000000000000000000E5ECEF00ECECEC00D9832F00FFCE
      7E00FFCA8B00FFFFE700FAFDFF00FFFEFF00F6FFFF00DB9A5500FFF7F700FFFC
      FF00FDFEF500FFFBFF00FFCA8C00FEC28E00D47D1D00C2C2DA00000DB000B9D6
      FF0097B1F40017169C00D8DBFF00F9FBEF0000000000000000001421AC001421
      AC001421AC001421AC001421AC001421AC001421AC001421AC001421AC001421
      AC001421AC001421AC001421AC001421AC001421AC001421AC001421AC001421
      AC001421AC001421AC001421AC0000000000000000000000000000000000D67B
      2100FFAD3100FFA52100FF9C1000FF9C0000DE8C3900F7E7E700EFDED600D6C6
      BD0084949C007B8494009C949400BD948400D6AD9C00D6AD9C00CE946B008C52
      290000000000000000000000000000000000000000000000000000000000426B
      9C00426B9C00B5848400DEA59400FFFFFF00FFFFFF00FFFFFF008C949400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58484000000
      000000000000000000000000000000000000E9EBF300FEF0F100C89C6700FBB2
      5C00FFCC8F00FFEFE000FEFEF200FFFDEF00FFFEFD00DE9B6400FFFFFE00F8FE
      FF00FFFFF100F3ECDB00FFD89300F1B25600DBA36800D7DCDD00D6DFFF000709
      9D000E09AC00ACB3E500F2F4FF00F0F0EA0000000000000000001829B8003945
      D4003945D4003945D4007F7AE400FFFFFE003940D300DAD6F5001A24C5003339
      D100C2B6F100DBD6F6000810BD007166E600BCACF000131BBD001720BC00131B
      BA00131BBD00131BBD00192AB80000000000000000000000000000000000D684
      2900FFB53900FFAD2900FFA51800FF9C0800E7943900F7EFE700EFE7DE00D6CE
      CE0084ADCE007B9CB5007394AD00638CAD00DEB5A500D6AD9C00D69C73009452
      290000000000000000000000000000000000000000000000000000000000426B
      9C0042638C00B5848400DEA59400FFFFFF00FFFFFF00FFFFFF004A5A5200ADA5
      AD00FFF7FF00FFFFFF008C949400FFF7FF00FFFFFF00FFFFFF00B58484000000
      000000000000000000000000000000000000F2EAF400FFEDEB00CBC0A400DC7B
      2100FFCF9300FCD6A000EFF7F700FFFEFF00FFFFFF00EA8C2D00FFFFFC00F7F9
      FF00FCFDE900F6DAAB00FACC9200D2811E00FFD5C200F0DFD600F8FDFC00DDEF
      FF00B9B8E400C9DAC500EAEFE000EBE9E80000000000000000001E32C200525F
      E800525FE800525FE8005B64E800DAD9FE00CEC7FC00FBFCFF00E3E2FF00FFFF
      FF00A59CF600FFFFFF002A36D000FFFFFF00F2F2FF001C25C900212BC7001D26
      C5001C25C9001C25C9001E32C20000000000000000000000000000000000D684
      3100FFB54200FFAD3100FFA52900FFA51800EF9C3900F7EFEF00F7E7E700EFE7
      DE00EFDECE00E7D6C600E7CEBD00DEC6B500DEBDAD00DEB5A500DEA573009452
      2900000000000000000000000000000000000000000000000000000000004263
      8C004A8CCE00B5848400DEA59400DEA59400DEA59400FFFFFF004A5A5200ADA5
      AD00FFFFFF00FFFFFF004A5A5200ADA5AD00FFFFFF00FFFFFF00B58484000000
      000000000000000000000000000000000000EDEDED00F1F1F100D6C8B600EAC2
      9100BC803400FDD79600FFD8A100FFE6BE00FFEBD300EBDDCB00F8EAD400FEEA
      C700F4DCAE00FFD87B00D3873F00DCAB7F00E8E1D000D4E0E000DBDEE600E1DC
      DE00E1E2E000CECECE00ECECEC00EDEDED0000000000000000002239CE006373
      EB006373EB006373EB004154E0007C7DEB00E2DEFB007775E900FFFFFF00FFFF
      FF002D3BD000EBE6FE00CEC7F500FFFFFF00B8B1F4002431CB002733D000222D
      CA002431CB002431CB002238CE0000000000000000000000000000000000D684
      3900FFBD5200FFB54200FFAD3100FFA52100F7A54200F7F7EF00F7EFE700EFE7
      DE00EFDED600EFD6CE00E7CEC600E7C6BD00DEC6B500DEB5A500DEAD7B009C5A
      2900000000000000000000000000000000000000000000000000000000000000
      0000426BB500B5848400B5848400B5848400B5848400DEA5940000000000DEA5
      9400DEA59400FFFFFF004A5A5200ADA5AD00FFFFFF00FFFFFF00CE948C000000
      000000000000000000000000000000000000ECEEEF00E7EBF000D5D1CC00FFF6
      DA00F8D09F00E17F3100FBBC7800FFDAA600FAD9A800F7CB9500FFDE9E00FFDF
      9C00F9C18000C97B4000D2AA7900FFFFE600FFFFF900E3DBE200FFFDFF00FDFF
      FF00CCD2CD00D8D8D800EFEFEF00EEEEEE000000000000000000263DD4007489
      F4007489F4007489F4007489F400A0A3FB00FFFFFE00152ECE00FFFFFF00FFFF
      FE00061ECA00FFFFFF00FFFFFF009290F200EEE7FE002837D5005D5DC700444A
      CB002837D5002837D500263DD40000000000000000000000000000000000D684
      4200FFBD5A00FFBD4A00FFB53900FFAD3100FFA52900FFCE8C00FFCE8C00F7CE
      A500EFCEA500EFCEA500E7CEBD00E7C6AD00E7C6B500DEBDAD00DEAD7B00A563
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000004273CE00426BB500396B9C003173CE00B5848400B5848400B584
      8400B5848400DEA5940000000000DEA59400DEA59400DEA59400DEA594000000
      000000000000000000000000000000000000E9ECF000E1EAF400D2D9E200FFFF
      FB00FFF7E500F3C58F00D58E4A00E18B3700FBAD5300F2B05D00EAA65B00DF91
      4500DC8A3900FCD1BC00EDE3D100FBFFF900F9F8FA00E9E1EB00F9FDFF00F8FE
      FD00D6D1CE00E6E6E600F1F1F100EEEEEE000000000000000000263DD4007489
      F4007489F40061616100616161005B80F100D1DEFF00607CEC00CFD5FE00B5BC
      FB00405AE000C6C7FB009697F7005963E0005F88F100535AD600616161006161
      6100535AD600535AD600263DD40000000000000000000000000000000000D68C
      4200FFCE7B00FFD69C00F7D6A500EFDECE00EFDED600EFD6CE00E7CEC600E7C6
      AD00E7BDA500DEB59C00DEAD7B00DE9C6B00D6844200CE731800D66B1800BD84
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004273CE00426BB500396B9C00396B
      9C003173CE00B5848400B5848400B5848400B5848400B5848400000000000000
      000000000000000000000000000000000000EEEEEE00ECF2F900D4DDE700D1D5
      DA00CFCFCF00D7D2C300CEC4B200CDB59900DDA98000E19F6C00DEA47300DCB6
      9600D7C0B100D1CFCE00CEC9CA00D1CBD000D1D1D700C7CED100C7CCCD00D8D9
      D700E8E3E000EFEFEF00F0F0F000EDEDED0000000000000000005964DE00263D
      D400263DD400C0C0C000C0BFC0000411DA000411DA000E25CE001832D0000C27
      D300102BD3001D37D5000F2AD5001531D5001832D0000410D600C0C0C000C0BF
      C000263DD400263DD4004A4FB20000000000000000000000000000000000D6A5
      8C00CE9C8400CE9C8400CE9C8400CE9C8400C6948400C68C7300C68C7300C68C
      7300C6947B00C68C7300C68C7300C69C8C00B5948C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004273CE00426BB500396B9C00396B9C00396B9C0000000000000000000000
      000000000000000000000000000000000000ECE8E300F4F4F400F1F4F800ECEE
      EF00F0F0F000E9EAF400EAEDF100EDEEEA00F2EDEA00F0ECEB00EAECED00EDF0
      F400EFEEF000E9EBEC00F8F3F500EFEEF000E8F0EF00EFEFEF00F5E8EA00F3EB
      EB00E5F0ED00F1F1F100EEEEEE00EDEDED000000000000000000000000000000
      000000000000D1D1D100D1D1D100000000000000000000000000F8F9FD00F8F9
      FD00F8F8FD00F8F8FD00F8F8FD00F8F8FD000000000000000000D1D1D100D1D1
      D100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5F1EC00F1EDE800F0EDE900F5F2
      EE00EEEBE700F1F5EF00F3EAE600FCF3EF00E7EDE800DFEDE900EFF5F400F6F4
      F400F0EBEC00FCF3F000F3F2EE00E8EFEC00EDF0EE00F6EEEE00FCEEF000F9F4
      F500E3F0EE00F0F0F000EDEDED00ECECEC000000000000000000000000000000
      000000000000A6A6A600A6A6A600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A6A6A600A6A6
      A60000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF75758BFF636368FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000003170
      1E0098470500BF520000BB4E0000893D06007C4D08007B4D08007B4D08007B4D
      08007B4D08007B4D08007B4D08007B4D08007B4D08007B4D08007B4D08007B4D
      08007A4C0700764708007647080076470800000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FFAC6425FFA85F20FF9E5116FFA456
      18FF551906FF913C0FFF8D390EFF8C390EFF8C390DFF8C3A0DFF8C390DFF8C39
      0EFF8C390EFF8B390EFF8B390EFF8B380EFF8C380EFF8C390EFF89390EFFE6D2
      C3FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF3D3D64FF2D2DC6FF1E1E9BFF30303DFFC8C8C8FF0000
      00FF000000FF000000FF000000FF000000FF000000000000000035C04900B589
      2B00FAA41800DF780000E0800000E77F0000C68B6800F2EEE400F2EEE400F2EE
      E400F2EEE400F2EEE400F2EEE400F2EEE400F2EEE400F2EEE400F2EEE400F2EE
      E400F2EEE400F2EEE400F2EEE40076470800000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FFC78F51FFB26E2FFF9D5015FFA355
      18FF6B2106FFD99330FFD28A2BFFD28A28FFD08B27FFCF8524FFCE8222FFCD80
      1EFFCC7E1DFFCB7D1BFFC97C19FFCA7917FFC87915FFC87714FFB15A0EFFA263
      3CFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8585
      85FF8C8C8CFF838383FF858585FF848484FF858585FF858585FF858585FF8585
      85FF7A7A7BFF1E1E52FF3131D4FF3131F1FF3535F3FF2222A9FF15152FFF6A6A
      6AFF000000FF000000FF000000FF000000FF000000000000000050A53800E9A5
      2D00F6A01400E3770000E37F0000E57F0000BD704300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F2EEE4007F531400000000FF000000FF000000FF8585
      85FF8C8C8CFF838383FF858585FF848484FF858585FF858585FF858585FF8585
      85FF858585FF858585FF858585FF858585FF848484FF818181FF919191FF8484
      84FF000000FF000000FF000000FF000000FFC58C4EFFB16D2DFF9D5015FFA255
      18FF702105FFE8AF43FFE0A63DFFD89731FFC36C18FFE8AA31FFDEA12FFFDA9A
      2CFFD89829FFD79727FFD69423FFD59321FFD4901FFFD38F1CFFD8941AFFAC6E
      46FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8686
      86FFFCFCFCFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9
      DDFF27276BFF3434E2FF2222E8FF0101C5FF0606CCFF3030F4FF2929C0FF0E0E
      34FF9B9B9BFF000000FF000000FF000000FF0000000000000000439E2D00E9B7
      6500FAB03300EA730000EC820000F27F0000B5603600A55F3400A55F3400A55F
      3400A55F3400A55F3400A55F3400A15C3200A15A3200A25B3200A35C3200A45C
      33009E582F00FCF8F700E4DBCC0083541000000000FF000000FF000000FF8686
      86FFFCFCFCFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6FF8888
      88FF000000FF000000FF000000FF000000FFC58C4EFFB16D2DFF9D5015FFA255
      18FF702104FFE6B048FFE3A943FF854623FF012281FF473944FF97591EFF9A6E
      3CFFDE9C2BFFD9992AFFD69527FFD69425FFD59221FFD3901FFFD7931EFFAF71
      46FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8686
      86FFFEFEFEFFFCFCFCFFE9E9E9FFE8E8E8FFE9E9E9FFE9E9E9FFB6B6B7FF2020
      73FF3131E8FF1A1AE8FF0000CEFF0000D4FF0000D2FF0202D1FF2727F3FF2C2C
      CDFF111145FF9D9D9DFF000000FF000000FF000000000000000000000000D38F
      5400FFEF9200F9BF3400FDB82000F19E2F00BF928A00F5F2EE00F5F2EE00F5F2
      EE00F5F2EE00F5F2EE00F5F2EF00F7F4ED00F5F4EA00F0F2EA00F2F0ED00F6F4
      F100F3EEE800FFFFFF00E3DACA0084561100000000FF000000FF000000FF8686
      86FFFEFEFEFFFCFCFCFFE9E9E9FFE8E8E8FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9
      E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFFFFFFFFFFFFFFFFF8484
      84FF000000FF000000FF000000FF000000FFC58C4EFFB16D2DFF9D5015FFA255
      18FF702205FFE8B54CFFE1AC46FFCA751CFF052379FF01228EFF71D8FFFF659A
      C1FF9A6E3CFF97591EFFDD9D2BFFD89729FFD69526FFD59424FFD89622FFAF71
      46FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8282
      82FFFEFEFEFFFFFFFFFFEEEEEEFFEBEBEBFFEAEAEAFFA5A5A8FF1B1B7DFF2929
      EFFF0D0DE3FF0000D2FF0000DCFF0000DDFF0000DEFF0000DAFF0000D4FF1D1D
      F0FF2D2DE0FF121252FF888888FF000000FF0000000000000000000000000000
      0000D7916A00EBAF5A00C8732500D2AA9A00FFFFFF00F5F2ED00F5F2ED00F5F2
      ED00F5F2ED00F5F2ED00F5F2ED00F5F2ED00F5F2EB00F4F2E700F5F2E800F5F2
      ED00F2EFE400FFFFFF00E3D9CA0084561100000000FF000000FF000000FF8282
      82FFFEFEFEFFFFFFFFFFEEEEEEFFEBEBEBFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
      EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFFFFFFFFFFFFFFFFF8484
      84FF000000FF000000FF000000FF000000FFC58C4EFFB16D2DFF9D5015FFA255
      18FF722104FFE9B750FFE2AC4AFFEBB447FF6D4233FFBCEDFFFFACE7FFFF8FE0
      FFFF40C0FFFF1776C7FF97591EFFDF9E2AFFD9972BFFD69628FFDB9926FFAE71
      46FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8686
      86FFFFFFFFFFFBFBFBFFE1E1E1FFD9D9D9FFAAAAADFF1C1C85FF3030F9FF3737
      FEFF2222E7FF0B0BE3FF0000E2FF0000E6FF0000E6FF0000E4FF0000DFFF0000
      D7FF1515EFFF2B2BE7FF151552FFAFAFAFFF000000000000000000000000DBD9
      CD00F1D6C400FBEEE100A5773A00E0BEAA00D7AB9400AC653B00AC653B00AC65
      3B00AC653B00AC653B00AC653B00AC653B00AD653B00AD653B00AD653B00AD65
      3B00AB653900FBF6F400E3D9CA0084561100000000FF000000FF000000FF8686
      86FFFFFFFFFFFBFBFBFFE1E1E1FFD9D9D9FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7
      D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFEBEBEBFFFFFFFFFFFFFFFFFF8585
      85FF000000FF000000FF000000FF000000FFC58C4EFFB16D2DFF9D5015FFA255
      18FF722204FFEBBB56FFE2AD4DFFE5B14CFFB16D2DFFDCEFFAFFD4EEFFFF53D9
      FFFF22A1E7FF1B87E2FF118AE9FF97591EFFE09E2AFFD9992BFFDC9B2BFFAE71
      45FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8585
      85FFFEFEFEFFFEFEFEFFEDEDEDFFEDEDEDFF48487CFF3030EBFF5353FFFF5B5B
      FFFF5D5DFFFF5555FDFF2D2DF4FF0505EEFF0000EDFF0000EBFF0000E7FF0000
      E1FF0000D6FF1313F0FF2525C7FF3C3C4DFF000000000000000000000000E2BF
      8700EFA72E00EA8E0E00EF8A1100E0780E00D9A49100F5F2ED00F5F2ED00F5F2
      ED00F5F2ED00F5F2ED00F8F5F000F3F2EC00F6F2EF00F9F4F400F9F5F300F9F5
      F100F5F2EB00FFFFFF00E3D9C90084561100000000FF000000FF000000FF8585
      85FFFEFEFEFFFEFEFEFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
      EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFECECECFFFFFFFFFFFFFFFFFF8585
      85FF000000FF000000FF000000FF000000FFC58C4EFFB16D2DFF9D5015FFA255
      18FF732204FFECBD5CFFE3B151FFE4B04FFFE1A643FFC28D68FF98FCFFFF13D7
      FBFF0DC8FBFF2A9CE3FF1C87E0FF1188E6FF97591EFFE2A02EFFDDA12FFFAE71
      45FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8585
      85FFFEFEFEFFFFFFFFFFEEEEEEFFEEEEEEFF2626A2FF5B5BFFFF7474FFFF6E6E
      FFFF6E6EFFFF7171FFFF7575FFFF5959FCFF1B1BF6FF0000F1FF0000ECFF0000
      E6FF0000DDFF0101DAFF1D1DEFFF242461FF000000000000000000000000E3C7
      9200FCCC5700FBBC2900FFBD2200EE951600D8A19100F5F2ED00F5F2ED00F5F2
      ED00F5F2ED00F5F1EC00F9F7F200F4F2ED00F8F4F000FCF6F400FAF5F200FDF6
      F400F5EEEC00FFFFFF00E3D9C90084561100000000FF000000FF000000FF8585
      85FFFEFEFEFFFFFFFFFFEEEEEEFFEEEEEEFFEFEFEFFFEFEFEFFFEFEFEFFFEFEF
      EFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEEEEEEFFFFFFFFFFFFFFFFFF8585
      85FF000000FF000000FF000000FF000000FFC68C50FFB26E2EFFA05117FFA456
      19FF742303FFEDC05FFFE5B356FFE4B253FFE7B552FFDA9A2CFF3BFBFFFF0DF2
      F9FF0DD4FAFF0DCBFCFF2A9CE3FF1C87E0FF1288E7FF97591EFFE9A933FFAF71
      45FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8383
      83FFFFFFFFFFFFFFFFFFF1F1F1FFEFEFEFFF2F2FB7FF8080FFFF8A8AFFFF8585
      FFFF8585FFFF8585FFFF8585FFFF8E8EFFFF8383FFFF4343FAFF0505F0FF0000
      E7FF0000E1FF0000D8FF1313EFFF232376FF000000000000000000000000DCB2
      8000F8D59600FBBE3900F7AE2000FDB22400BC582C00AC653B00AC653B00AC65
      3B00AC653B00AC653A00AD663B00B0663C00B1683C00AF673C00AF663C00B167
      3D00AB623800FBF6F400E3DACB0084561200000000FF000000FF000000FF8383
      83FFFFFFFFFFFFFFFFFFF1F1F1FFEFEFEFFFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFFFFFFFFFFFFFFFFF8585
      85FF000000FF000000FF000000FF000000FFC68F52FFB57130FFA15418FFA659
      1BFF762404FFEEC363FFE6B75AFFE5B557FFE5B356FFE6B04CFFDA9A2CFF47FA
      FFFF0FF2F9FF0DD4FAFF0DCBFCFF2A9CE3FF1D88E0FF0C7EE1FF97591EFFB974
      40FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8787
      87FFFFFFFFFFFEFEFEFFE4E4E4FFDDDDDDFF3838ADFF9A9AFFFFA1A1FFFF9C9C
      FFFF9C9CFFFF9C9CFFFF9C9CFFFF9B9BFFFFA1A1FFFFA5A5FFFF8080FBFF3030
      EFFF0000E0FF0000D8FF0D0DF1FF27276FFF000000000000000000000000DCE3
      D900EBB36F00FFE37A00F8B31700FEC22D00F4941900CE927C00F5F2EC00F3F0
      EB00F4F0EB00F8F0F000FAF2F700FAF8F100FAFDF100FBFCF900FCF8F900F7F3
      EE00EEE5DA00FFFFFF00E5DBCF0084571300000000FF000000FF000000FF8787
      87FFFFFFFFFFFEFEFEFFE4E4E4FFDDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFFDDDD
      DDFFDDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFFF1F1F1FFFFFFFFFFFFFFFFFF8585
      85FF000000FF000000FF000000FF000000FFC79054FFB77333FFA5561AFFA95B
      1DFF772505FFEFC767FFE7B85DFFE6B75BFFE5B658FFE7B557FFE9AF4CFFDA9A
      2CFF48FAFFFF0FF3F9FF0DD4FAFF0FCBFCFF2A9DE3FF1E89E0FF1283E3FF7C59
      41FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8484
      84FFFEFEFEFFFFFFFFFFF2F2F2FFF3F3F3FF424294FF9E9EF7FFC0C0FFFFB1B1
      FFFFB2B2FFFFB2B2FFFFB2B2FFFFB8B8FFFFB6B6FFFFB3B3FFFFBABAFFFFB5B5
      FFFF8B8BF6FF6E6EF4FF4444E3FF3E3E60FF0000000000000000000000000000
      0000F1C79200FEF4D200FED46800F9B92A00FFCD3500F59A1600D3968000F7F4
      F000F9F5F300FAF4F300FAFAF300FAFDF500FBFAF900FCF7F600F7F5ED00F4ED
      E900E9E0D400FFFFFF00E2D3C40085591500000000FF000000FF000000FF8484
      84FFFEFEFEFFFFFFFFFFF2F2F2FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3
      F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF2F2F2FFFFFFFFFFFFFFFFFF8585
      85FF000000FF000000FF000000FF000000FFC99357FFB87634FFA75A1CFFAB5E
      1FFF792504FFF1C86DFFE8BC62FFE7B960FFE7B85CFFE6B85AFFE7B758FFE9B0
      4DFFDA9A2CFF49FAFFFF10F3F9FF0DD5FAFF0FCBFAFF2A9DE3FF1F8BE0FF168A
      E6FFE6F2FBFF000000FF000000FF000000FF000000FF000000FF000000FF8786
      88FFFAFCFDFFFAFEFFFFEFF3F4FFF1F5F6FF9496B2FF5B5BB7FFD4D4FFFFDFDF
      FFFFD5D5FFFFD7D7FFFFDEDEFFFFC8C8FFFFD1D1FFFFDDDDFFFFD5D5FFFFD7D7
      FFFFEBEBFFFFCCCCFFFF3E3E89FF000000FF0000000000000000000000000000
      000000000000BAB55F00FFFCEC00FFDE8600FBD16500FFE46700ECA03A00B467
      3400AB633900AB633800AB633800AB643900AA623900A7613600A55E3400A25C
      34009B572F00F5EEEA00DACAB600875B1700000000FF000000FF000000FF8786
      88FFFAFCFDFFFAFEFFFFEFF3F4FFF1F5F6FFF2F4F4FFF2F4F4FFF5F5F5FFF9F9
      F9FFF3F1F1FFF7F2F3FFFEF9FAFFF7F2F3FFF5F5F5FFFFFFFFFFFAFAFAFF8A8A
      8AFF000000FF000000FF000000FF000000FFCA9458FFBB7737FFAA5D1EFFAE63
      20FF792605FFF2C970FFE9BD66FFE9BC64FFE8BB61FFE7B85FFFE6B75BFFE7B8
      5BFFEAB14FFFCD801EFF4EFAFFFF10F3F9FF0DD5FAFF0ECBFCFF2A9CE3FF208A
      DDFF1985DDFFE2F0FBFF000000FF000000FF000000FF000000FF000000FF8584
      86FFFCFEFEFFFDFFFFFFF5F7F7FFF3F8F7FFF4F6F6FF6A6B96FF5E5EB3FFBABA
      F3FFDADAFFFFD7D7FFFFA7A7FCFF4141CEFF5858D7FFBDBDFFFFDBDBFFFFD6D6
      FFFFA6A6ECFF414194FF868693FF000000FF0000000000000000000000000000
      00000000000000000000E4BE7800FFF8DC00FED87700FDDE8D00FFEA8900E19A
      4900FAFAFD00FAFAFD00FAFAFD00FCF7F900F5F5F200EEF1E700EFE5E000E7E4
      DB00DED4C700EFE6E000D1BFA500885D1A00000000FF000000FF000000FF8584
      86FFFCFEFEFFFDFFFFFFF5F7F7FFF3F8F7FFF4F6F6FFF5F7F7FFF8F8F8FFF7F7
      F7FFF8F6F6FFFFFFFFFFF0EEEEFFFAF8F8FFF7F7F7FFFEFEFEFFFFFFFFFF8282
      82FF000000FF000000FF000000FF000000FFCB965AFFBC7A38FFAC5F1FFFAF65
      23FF7D2804FFF3CD74FFEABF69FFEABE68FFE9BD65FFE8BC62FFE7B960FFE7B8
      5DFFE8B95CFFEBB351FFCD801EFF4FFAFFFF11F3F9FF0DD5FAFF0ECAFCFF2B9F
      E5FF1C8BE3FF1D6098FFFFFEFBFF000000FF000000FF000000FF000000FF8787
      87FFFFFFFFFFFCFCFCFFEBECEAFFE3E4E2FFE1E1E1FFE0E0E0FF8F8FA5FF4242
      83FF3C3C9AFF3838A0FF2D2D7FFF696882FF5C5C89FF313191FF3A3AA1FF3A3A
      92FF41416FFFB2B2B6FF000000FF000000FF00000000ACCF8300A4CB81000000
      0000000000000000000092CE8E00FFF3CE00FFDE7800FFDF8700FFE08500ECAC
      4700FAFAFA00FAFAFB00FCFCFA00F7F5EB00F2EFE500EEEAE300E9E2D900E4DD
      D100DCCDBD00E3DBCC00C7B695008A5E1D00000000FF000000FF000000FF8787
      87FFFFFFFFFFFCFCFCFFEBECEAFFE3E4E2FFE1E1E1FFE0E0E0FFE1E1E1FFE1E1
      E1FFDEDDDFFFE4E3E5FFE0DFE1FFE5E4E6FFE1E1E1FFECECECFFE8E8E8FF8484
      84FF000000FF000000FF000000FF000000FFCC985DFFBE7D3BFFAE6022FFB266
      25FF7C2805FFF4D078FFEBC36DFFEAC06AFFEABF69FFE9BD66FFE9BD64FFE8BB
      61FFE7B95FFFE8BA5DFFEBB552FFCD801EFF50FAFFFF11F3F9FF0CD6FAFF07CD
      FFFF3681AEFFE6CCC2FFE7DFCCFFE8E9FBFF000000FF000000FF000000FF8383
      83FFFFFFFEFFFFFFFEFFFFFCF8FFFBF8F4FFFBF9F8FFFCFAF9FFFCFAFAFFFCFC
      FCFFFAF9FBFFF7F6F8FFFDFFFFFFD3D4D8FFDADADAFFD7D7D7FFE0E0E0FF8383
      83FF000000FF000000FF000000FF000000FFADBF6700FEEEC100FFE79E00F3C5
      6000B3CA790099D18E00E5C16100FFEDAE00FFE28D00FFE29000FFE58F00F0BA
      5000AB633900AB643900A9633800A9603500A45E3400A15C3300A05931009C56
      2F00954F2A00DBCDBB00C1AE8F008B622000000000FF000000FF000000FF8383
      83FFFFFFFEFFFFFFFEFFFFFCF8FFFBF8F4FFFBF9F8FFFCFAF9FFFCFAFAFFFCFC
      FCFFFAF9FBFFF7F6F8FFFDFFFFFFD3D4D8FFDADADAFFD7D7D7FFE0E0E0FF8383
      83FF000000FF000000FF000000FF000000FFCE995EFFBF7F3CFFB06424FFB469
      28FF7F2905FFF5D27AFFECC571FFECC46EFFEBC16CFFEABF6AFFEABE68FFE9BD
      65FFE9BC64FFE7BB60FFE9BA5EFFECB656FFCD801EFF51FAFFFF0BF8FFFF26A2
      BDFFFFECE4FFECE5D7FF1222D2FF1728F6FF000000FF000000FF000000FF8785
      84FFFFFFFCFFFFFEF9FFFFFFFAFFFFFEF9FFFFFDF8FFFFFDFAFFFEF9F6FFFDF9
      F8FFFFFEFEFFFDFDFDFFCDCFD0FF9A9C9DFF878787FF868686FF989898FF8989
      89FF000000FF000000FF000000FF000000FFC1C46800FFF3D200FFE69800FFF0
      B700FFEFA700FFE89700FFEFAA00FFE39500FFE59900FFE39000FFEDA100EEB4
      5000FAFCF900F8F9F000F5F1EB00F0EEE500EBE3DA00C5B39500C5B39500C4A6
      8800BEA57C00BEA57C00A48048008E652700000000FF000000FF000000FF8785
      84FFFFFFFCFFFFFEF9FFFFFFFAFFFFFEF9FFFFFDF8FFFFFDFAFFFEF9F6FFFDF9
      F8FFFFFEFEFFFDFDFDFFCDCFD0FF9A9C9DFF878787FF868686FF989898FF8989
      89FF000000FF000000FF000000FF000000FFCF9C5FFFC1813EFFB26725FFB66C
      28FF812A06FFF7D57FFFEEC773FFEDC672FFECC570FFEBC36DFFEAC16CFFEABF
      69FFEABE66FFE9BD65FFE8BD62FFE9BB61FFECB657FFCD801EFF63C0C6FFFFF5
      F3FFECE5DBFF132FD1FF111FF6FF1625F3FF000000FF000000FF000000FF8987
      86FFFFFFFAFFF3EDE8FFF1E9E2FFF0E7DEFFF2E7DFFFF5ECE3FFF3EBE4FFEEE8
      E3FFECE9E5FFFBF9F8FFA9A9A9FFF1F3F3FFF9F9F9FFFCFCFCFFEDEDEDFF8F8F
      8FFF000000FF000000FF000000FF000000FFDFD98800FFFCF300FFEFBE00FFE5
      9C00FFE69A00FFE7A300FFE6A000FFE69D00FFE59000FFECAB00FBE29300EDBE
      8500F8F9F100F4F1E600F1EBE200EEEAE400DBCDBB00BDA17800FFFFFF00F3F1
      F000F2EEE400DAD3C600B89D740090682A00000000FF000000FF000000FF8987
      86FFFFFFFAFFF3EDE8FFF1E9E2FFF0E7DEFFF2E7DFFFF5ECE3FFF3EBE4FFEEE8
      E3FFECE9E5FFFBF9F8FFA9A9A9FFF1F3F3FFF9F9F9FFFCFCFCFFEDEDEDFF8F8F
      8FFF000000FF000000FF000000FF000000FFD09D61FFC38440FFB56A26FFBA70
      29FF812B05FFF7D682FFEFC977FFEEC875FFEDC773FFECC571FFECC46EFFEBC3
      6DFFEAC06AFFEABE68FFE9BD66FFE9BC64FFEABD62FFE8B353FFCD801EFFEDEE
      F0FF337DDAFF2165FAFF1934F3FF6E79F6FF000000FF000000FF000000FF8784
      80FFFFFDF8FFF2EAE3FFF5ECE3FFF7EDE3FFFEF0E4FFF9EBDFFFF2E8DEFFF3EA
      E1FFF2ECE5FFFFFFFBFF83827EFFFFFFFEFFF5F5F5FFEEEEEEFF8A8A8AFFD1D1
      D1FF000000FF000000FF000000FF000000FF78CA8900D1DA9200FFF3CB00FFFB
      EF00FFF5DB00FFF1BD00FFEDB500FFEEB700FFFBD800FCE7AE00D1833400AB64
      3600A65F3500A35C3300A25A3200A25A320087472200BDA17800FFFFFF00F2EE
      E400DCCEBD00B89D74009E7B410000000000000000FF000000FF000000FF8784
      80FFFFFDF8FFF2EAE3FFF5ECE3FFF7EDE3FFFEF0E4FFF9EBDFFFF2E8DEFFF3EA
      E1FFF2ECE5FFFFFFFBFF83827EFFFFFFFEFFF5F5F5FFEEEEEEFF8A8A8AFF0000
      00FF000000FF000000FF000000FF000000FFD19F62FFC58641FFB76C27FFBC72
      2BFF822C05FFF7D884FFEFCB7AFFEFCA79FFEFC976FFEEC875FFEDC672FFECC5
      70FFECC46EFFEBC16CFFEABF69FFEABE68FFE9BD65FFE9BD62FFEFBF5EFF7D57
      43FF54C1FFFF3C94FAFF81A5F9FF000000FF000000FF000000FF000000FF8C89
      85FFFFFFFBFFF6EDE4FFF6ECE2FFF7EBE1FFF6E6D6FFFFEFE2FFFDEFE3FFF5EB
      E1FFF0E9E0FFFFFFFBFF87847FFFF5F4F0FFF4F4F4FF858585FFC2C2C2FF0000
      00FF000000FF000000FF000000FF000000FF00000000000000009DD19000C3DA
      8B00F1D88500FDDD9B00F9CE7F00F1C66A00EFB06200EAB68C00FDFBF600F5F3
      EE00EBE8E500E8DFD800E7D7CC00E2D4C600CEB89E00AC946700F2EEE400EEE8
      E100B4986A009E7B41000000000000000000000000FF000000FF000000FF8C89
      85FFFFFFFBFFF6EDE4FFF6ECE2FFF7EBE1FFF6E6D6FFFFEFE2FFFDEFE3FFF5EB
      E1FFF0E9E0FFFFFFFBFF87847FFFF5F4F0FFF4F4F4FF858585FFC2C2C2FF0000
      00FF000000FF000000FF000000FF000000FFD3A163FFC78842FFBA6F28FFBF75
      2CFF842C06FFF9DC89FFF0CD7DFFEFCC7BFFEFCB7AFFEFCA77FFEEC876FFEDC7
      73FFECC671FFECC470FFEBC36DFFEAC06AFFEABF69FFE9BD66FFEEC569FFC77D
      44FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8787
      87FFFBFBFBFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFDFDFDFFFFFFFFFFFAFA
      FAFFFFFFFFFFFAFAFAFF9E9E9EFFEDEDEDFF838383FFC7C7C7FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      00000000000000000000BEAB8900EEE9E100FFFFFF00F6FAF300F9F0E900F4E8
      E000E8E2D800E3DBD000DED0BD00DCCEB800CAB28F00AC946700D8D0C100B599
      6F009E7B4100000000000000000000000000000000FF000000FF000000FF8787
      87FFFBFBFBFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFDFDFDFFFFFFFFFFFAFA
      FAFFFFFFFFFFFAFAFAFF9E9E9EFFEDEDEDFF838383FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FFD4A364FFC88D44FFBB712AFFC077
      2EFF852D05FFFADE8EFFF1CF81FFF1CE7FFFEFCD7DFFEFCB7AFFEFCA79FFEFC9
      77FFEEC875FFEDC672FFECC571FFECC46EFFEBC16CFFEABF6AFFEEC56DFFC57B
      44FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8484
      84FF8C8C8CFF848484FF868686FF838383FF878787FF838383FF848484FF8686
      86FF828282FF8D8D8DFF787878FF959595FFCDCDCDFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      00000000000000000000BEAB8900EEE9E100FFFFFF00FEFFFE00F8F5F400F5ED
      E700ECE4D900E0D7CB00DACCB400D7C4AF00C3AD8600997B4100BCA17B009E7B
      410000000000000000000000000000000000000000FF000000FF000000FF8484
      84FF8C8C8CFF848484FF868686FF838383FF878787FF838383FF848484FF8686
      86FF828282FF8D8D8DFF787878FF959595FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FFD6A466FFC98B42FFBD7328FFC27A
      2DFF852E04FFFADE8DFFF2D083FFF2CF81FFF1CE80FFF0CE7DFFEFCB79FFEFCA
      79FFEFC978FFEFC874FFEEC671FFEDC570FFECC46EFFEBC26BFFEEC870FFC384
      4FFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      00000000000000000000C0AE8C00EEE9E100EEE9E100ECE3DC00E2DBCE00DED3
      C200D9CCB700CEC1A500CBB49400C5AC8B00AC946700997B41009A723A000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FFD7A867FFDDB77BFFCB8E43FFCE95
      49FFA0501DFFFBE6A5FFF5DB9BFFF5DA9AFFF5D999FFF5D897FFF4D796FFF3D6
      93FFF3D592FFF2D491FFF2D38FFFF1D28CFFF1D18AFFF2D089FFEFCF84FFC98D
      54FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      00000000000000000000C0AE8C00C1AC8B00BFA98700BFA98600BFA98800C0AA
      8900C0AB8B00BEA27B00BEA47E00B59D6F00A78D5C009A723A00000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FFCA8A3EFFD9AA68FFD8A968FFDBAE
      6BFFAA693EFFDBAD6DFFD7A768FFD6A768FFD6A668FFD6A669FFD6A669FFD6A6
      69FFD6A767FFD6A767FFD6A767FFD6A768FFD6A768FFD7A669FFCF9956FFEDDA
      C7FF000000FF000000FF000000FF000000FFF0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6B0
      8C00D6B08C00D6B08C00D6B08C00D6B08C00D6B08C00D6B08C00D6B08C00D6B0
      8C00D6B08C00D6B08C00D6B08C00D6B08C00D6B08C00D6B08C00D6B08C00D6B0
      8C00D6B08C00000000000000000000000000F5F0F100EFEDED00EFF4F500ECE8
      EE00E7F4F600F9F1F200EBEDE700EAF5EB00F2EEF300FEF0F600F9EAE700FCF4
      ED00F4F1F300ECEDF100EEF2ED00F1F1F100EDEDED00EEEEEE00F0F0F000F1F1
      F100F0F0F000F0F0F000F0F0F000F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6B0
      8C00FEF8F400FEF8F400FEF8F400FEF8F400FEF8F400FEF8F400FEF8F400FEF8
      F400FEF8F400FEF8F400FEF8F400FEF8F400FEF8F400FEF8F400FEF8F400FEF8
      F400D6B08C00000000000000000000000000F4F1EC00F8F7F300EDF1F200EFEE
      F200F4FEF100E9E9DD00E1EDD700E2E0C200EBE5DA00D8D2D300E1DEDA00D8D9
      D500E6E9ED00EEF1F600F0F1EF00EEEEEE00F4F4F400F8F8F800F0F0F000E7E7
      E700E4E4E400EEEEEE00F0F0F000F1F1F10000000000000000007F7F7F008E8E
      8E007F7F7F00858C89008781820093858B002D292F003E4B53006F8A94005D77
      830066798800798180007F8584007C828100808584008C8E8E007F7F7F000000
      00000000000000000000000000000000000000000000000000008D8D8D008585
      8500838383008282820083838300858585008686860085858500838383008584
      860083967B004A469F001F0BB8002517BD00444CA600667E8A00665FB0002012
      BE00402CCB00877BDF000000000000000000000000000000000000000000D6B0
      8C00FEF8F400FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FCEC
      DC00FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FEF8
      F400D6B08C00000000000000000000000000F2E8F500EDEEF800E9F2F600FFF7
      F400FFD1A100DB8D5E00CF733800E0903700BF804600A98164009D887300AFA8
      9900DBD9D800F5F4F800F3EEEF00F4F4F400F2F2F200EBEBEB00D3D3D300B0B0
      B000ADADAD00D9D9D900F1F1F100F1F1F10000000000000000008A8A8A00F5F5
      F500FFFFFF00FDFEFC00FFFEFF00FBF3FA00101C280000172500337B8D002B79
      900058A3BD00D3DBDA00F0F8F700FAFFFF00FBFFFF00F9FBFB008C8C8C000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FC00ECF5FF003827C4005D62FB005D66FF000100C400484BD1001904B700515F
      FF005C5DFF003131A3000000000000000000000000000000000000000000D6B0
      8C00FEF8F400FCECDC00D6B08C00D6B08C00D6B08C00D6B08C00D6B08C00D6B0
      8C00D6B08C00D6B08C00D6B08C00D6B08C00D6B08C00D6B08C00FCECDC00FEF8
      F400D6B08C00000000000000000000000000F3F6ED00EFF2F000EFF1F200F1EC
      EB00D6A35D00F7CB9000FFE7A000C4740900FFE19E009E937800FBFFF800818C
      8400C7CFCF00EEEEF400FAF4F500EDEDED00F0F0F000F3F3F3009B9B9B00F2F2
      F20093939300CDCDCD00F6F6F600F1F1F100000000000000000084848400FFFF
      FF00FFFFFF00FEE5E100EBF2ED00D0E7E9003A5069003273990079D4FF007CD3
      FF00157599006296B4009BBFCF00CEE5E700FFFDFD00FFFEFF008A7F82000000
      000000000000000000000000000000000000000000000000000085858500FFFF
      FF00FEFEFE00E8E8E800E7E7E700E8E8E800E8E8E800E8E8E800E8E8E800F7F1
      E600E1E1E7002F16E2007F85EE003D3AF4006264FF000900C9005F64FD003F36
      FB007A80FF00291ED2000000000000000000000000000000000000000000D6B0
      8C00FEF8F400FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FCEC
      DC00FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FEF8
      F400D6B08C00000000000000000000000000F6F5F100F1EEF000F7F3F800F4ED
      EA00C5711100FFC67A00FFD58100E56F0000FFCB8C009A877800FBFDFE007D82
      8100D5D9DA00EEEDF100F5EDEE00F4F4F400EFEFEF00F1F1F10085858500FFFF
      FF0086868600CDCDCD00F0F0F000F1F1F100000000000000000084848400FFFF
      FF00FFFFFF00DBF0E800F1E4E200DFE8EC00448C96009EE7FF0072D4FC005AD5
      FB006CD1F800076E95005790AF00B6C5D500F5F8FC00F2FDFB00848988000000
      000000000000000000000000000000000000000000000000000085858500FEFE
      FE00FFFFFF00EBEBEB00ECECEC00EDEDED00ECECEC00EAEAEA00E9E9E900F2EB
      E800D7F1E100828CDA000D00D100798AF9004143FF004249F6004847FF007885
      FF001107C5008A8AE4000000000000000000000000000000000000000000D6B0
      8C00FEF8F400FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FCEC
      DC00FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FEF8
      F400D6B08C00000000000000000000000000E8F3E900EEF1EF00F7F1F600FCF7
      F600D6700000FFCE8200FFC57500E6780000FEC980008B8D7A00ECFAF9008186
      8400D1D5D000F2F4F400F4EFF000EEEEEE00F0F0F000F4F4F40086868600FCFC
      FC0084848400D5D5D500F1F1F100F1F1F100000000000000000084848400FFFF
      FF00FFFFFF00D8E7E300D3DAD700D6D5D70098B8C300187E90007ADFFF006FDB
      FF0060D2FB006ED3FF0013719C004E90A900BFD6E600F6F0FB00888385000000
      000000000000000000000000000000000000000000000000000085858500FFFF
      FF00FDFDFD00E1E1E100D9D9D900D6D6D600D4D4D400D5D5D500D7D7D700D2D6
      CA00D1DFDE00C1D8D400383BD3000300BA006256FF004233FF004751FF000C00
      C7003849C100000000000000000000000000000000000000000000000000D6B0
      8C00FEF8F400FCECDC00D6B08C00D6B08C00D6B08C00D6B08C00D6B08C00D6B0
      8C00D6B08C00D6B08C00D6B08C00D6B08C00D6B08C00D6B08C00FCECDC00FEF8
      F400D6B08C00000000000000000000000000F3F2EE00F9F3F400F5EBF100EDEF
      EF00DE730000F4D08400F6CC7F00E6710400F0BC87008B8F9000EFF7FF008884
      8900D3D0CC00EBF0EF00F0F3F700F3F3F300F4F4F400ECECEC0086868600FDFD
      FD0088888800D3D3D300EBEBEB00F1F1F100000000000000000084848400FFFF
      FF00FFFFFF00F0E9EC00EBEBEB00ECEEEE00F1F0F900A5C7D700197E940090E1
      FF0073DCFF0056D1FF0077D7FF0012739700629CB900AFD7EA006A7F87000000
      000000000000000000000000000000000000000000000000000085858500FDFD
      FD00FFFFFF00ECECEC00EDEDED00EEEEEE00EEEEEE00EEEEEE00EEEEEE00FFE9
      FC00E3EDDC009D8FDD000703C6007F85FF006662FE008888FA006266F4007C86
      FF000F09BA008E88E1000000000000000000000000009595DC009595DC00F2E7
      DC00FEFCFB00948FD100948DCC00FEF8EF00FEF8F000948ECE00948FD100FEF9
      F400FEF9F400948FD100948FD100FEF9F400FEF9F400948FD100948FD100FEFC
      FB00F2E7DC009595DC009595DC0000000000F0EEF400F2EEF400F5EDF400F1F3
      F300F5780000FFC87B00FFC47700EC740000FCC67F0082847800FBFEFF009387
      8300CFC8BF00E4E9E700D9E2E600DFDFDF00E9E9E900E3E3E30086868600FFFF
      FF0084848400CFCFCF00F5F5F500F1F1F100000000000000000084848400FFFF
      FF00FFFFFF00FCEEF200F3EDEE00F2F0F000EDE9EE00ECE8F400BACBE0000F75
      8C0096E6FF0081D7FB0070D5FB0077D6FE00166E96005BA4C20060667D000000
      000000000000000000000000000000000000000000000000000085858500FFFF
      FF00FFFFFF00EEEEEE00EEEEEE00EEEEEE00EDEDED00EEEEEE00EEEEEE00F2E8
      F400E4F1E3002D1BD400ACA1FD008381FF0097A2FF000800C4009DB4F8007979
      FF00949BFF002D29B800000000000000000000000000C8B09400C8B09400D6B0
      8C00C8A47C00C8A07400C8A47800C8A47C00C8A47800C8A47800FCECDC00FCEC
      DC00FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FEF8
      F400D6B08C00000000000000000000000000F2F1ED00EDF4FF00F6F4E900FFEC
      D800D36F0500FBCC7B00FFC45C00FFA44200FFB86200927E8300FFFFF9008F7D
      940093958900A39F940099A1A100A7A0A500A59EA100A7A2A30087888600F7FD
      F80080878400BEC1C500E8E7F000F2F2F200000000000000000084848400FFFF
      FF00FFFFFF00EFF0EE00F2F4F400EAECED00ECF2F100F6EDF000E0E7F000B4D2
      E50019768B00A6EFFF007FDDFA006FDAFF007ADBFF001B7391002F6175009EB8
      C40000000000000000000000000000000000000000000000000085858500FCFC
      FC00FFFFFF00EFEFEF00F1F1F100F2F2F200F1F1F100F0F0F000F0F0F000E7EF
      FC00E1F0FF002619C300BBC6FF00BFCDFE001405C4004C4AD9001000C400BAD1
      FE00B9CDF600271EC200000000000000000084500C007C4400007C4400007C44
      00007C4400007C4400007C4400007C4400007C4400007C440000844C10008054
      3800CCAC9400D6B08C00D6B08C00D6B08C00D6B08C00D6B08C00FCECDC00FEF8
      F400D6B08C00000000000000000000000000F7FCFB00E0E6ED00FFCEA000D0A0
      7600EC6F0000EBA74200E1891700DE962000BF9340007D8C8400E5E2DE009BB8
      BC00B2B8BF00B3B2AE00B7BDB800B4B7BB00B1B4B800AFB1B200B8BABA00F1F2
      F00088898700B1AFAE00E3E1E100F2F2F200000000000000000084848400FFFF
      FF00FFFFFF00E4E8E300DADFDE00D2DBDE00D9D9D900DCE2DD00E6DEDE00D1D7
      DE0090C3CD00087B8800AAECFF0080DDFC007AD8F50084E4F400118285007380
      900000000000000000000000000000000000000000000000000085858500FFFF
      FF00FEFEFE00E4E4E400DEDEDE00DBDBDB00D9D9D900DBDBDB00DEDEDE00DCDF
      D000D6DED4008386DB002C20B8002B1ECD009A97E600EDFDFF00524C99003B19
      C4003B1EC800988DED0000000000000000009064280094683000946430009464
      2C00946830009468300094683000946830009468300094683000946430008058
      3C00885C4400FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FCECDC00FEF8
      F400D6B08C00000000000000000000000000ECF1F000F2F6FB00DA7E3700FFE1
      BF00EA740000F7BD7B00E9AC6E00D28F3A00C4986F00FFF9FB00F3FFFF00FEFF
      FD00F9FAFF00FFFBFF00FFFCF900FAFDFF00FBFEFF00FCFDFF00FEFDFF00FFFD
      FF00FFFBFC00ABAAA600E9ECE300F2F2F200000000000000000084848400FFFF
      FF00FFFFFF00FEF5F100F1F3F300ECF1F400F9F6F800FEEFEC00F7F5ED00EFF6
      F300FDEEF600BAC8EC0023769200B5EEFF008EE8F90049576900C8C9D7005054
      6600B1BCD200000000000000000000000000000000000000000085858500FFFF
      FF00FFFFFF00F2F2F200F4F4F400F4F4F400F3F3F300F3F3F300F4F4F400FCF5
      F200ECF4F400F6F1F200E8F6F400F3F1F100FFFAFF00F9FEFC007D8D7C000000
      0000000000000000000000000000000000009C7440009C7444009C7444009C74
      44009C7444009C7448009C7444009C7448009C7448009C7848009C7448008058
      3C0080583C0084584800CCBCC000FCECDC00FCECDC00FCECDC00FCECDC00FEF8
      F400D6B08C00000000000000000000000000FAF5EC00F2EFEB00E9720B00FDE7
      C300EB780600F7B78000E4BC9200FFFCF300BCA4A400AA8C970080817100968B
      8700898874007B80890078838B00847F81008A8789008484840084808500857C
      86009A929900D6D7D500F0F9EF00F2F2F200000000000000000084868700FDFF
      FF00FDFFFF00F2F4F500F4F6F700F3F5F600F3F5F500F5F5F500F7F7F700F8F9
      F700F4F5F300ECFEF100C2D1D4004C575F00EFEDF300F8F2E700595E4F00B4CE
      D5000B0CAA00BAC4FA000000000000000000000000000000000085858500FFFF
      FE00FFFFFE00F5F5F500F3F3F300F6F8F800F2F4F500F2F4F500F3F5F600F0F2
      F300F7F9FA00F0F2F300F6F8F900F4F4F400FFFFFF00FFFFFF00848484000000
      0000000000000000000000000000000000009C7440009C784800A0784800A078
      4800A0784800A0784C00A07C4C00A07C4C00A07C4C00A47C5000A47C5000906C
      480080543800845848006C6CB400D0C8D000FCF4E000FCECDC00FCECDC00FEF8
      F400D6B08C00000000000000000000000000F5F8E900F1F5EF00EB6C0000F8E8
      BE00D6750300FDB87200DCB18000FFFFFF00E2A77A00F9B67D00D3680D00FFEF
      B900CE720D00E1D2BF00F3F4F200EFF9ED00E2F4E300E3F9E600E8F6EB00F0EF
      F300FDF2FC00F7F0F500EFF0EE00F2F2F200000000000000000084868700FBFD
      FE00FCFEFF00F6F8F900F7F9FA00F4F6F700F2F4F500F3F5F500F7F7F700F8F8
      F800F6F6F600F7EEFB00F6F8F900B3B4BE00615D6300ECE9EB00E5F5EE008183
      FF004251FB0016179100C8C8F00000000000000000000000000085858500FDFD
      FD00FFFFFF00F7F7F700F3F5F500F9FBFC00F7F9FA00F7F9FA00F8FAFB00F5F7
      F800F6F8F900F3F5F600F8F8F800F7F7F700F9F9F900FFFFFF00858585000000
      0000000000000000000000000000000000000000000000000000C8A87800C0A4
      8000C4A88000C4A88400C8AC8400C8AC8400C8AC8800C8AC8800C8AC8800CCB4
      9000B4907000885C44006864AC006C6CB400DCD0D000FCF0DC00FCECDC00FEF8
      F400D6B08C00000000000000000000000000E6F8F100E1F2EE00ED700000FDE4
      B200E7A03100FFBB6300D2975900FCFBF700DBA05800FCBF5F00FFAA2C00EDD9
      A200E47A0000DED2C800E7ECF500A3DBAA00478B50003B83470097CEA100D7EF
      DD00F9F4F600FBECF400FFF0F400F2F2F200000000000000000086868600FEFE
      FE00FEFEFE00E4E6E700E3E5E600E1E3E400DEE0E100E1E1E100E2E2E200E2E2
      E200E2E2E200E8E7D900E1DDE300E3EADB00A7ACA30059596500B9B8F800888D
      FF005569FF000B05B200C1CBFA0000000000000000000000000085858500FFFF
      FF00FDFDFD00EDEDED00E2E2E200DFE1E200DDDFE000DEE0E100DFE1E200E3E3
      E300DEDEDE00E2E2E200DFDFDF00E0E0E000EEEEEE00E8E8E800838383000000
      000000000000000000000000000000000000000000000000000000000000C4B4
      B000B4ACB800B8ACB800B8ACBC00B8ACBC00B8ACBC00B8B0BC00B8B0BC00B8B0
      BC00BCB4C000948090006864AC005C60B000B0A8C800FCF4E000FCECDC00FEF8
      F400D6B08C00000000000000000000000000E1EEEC00F0F8F100E6700600FDD0
      9300F6BD5400FFB85400C4823B00F5D9CE00BC7C4200F8B05800FDC75C00FECD
      A700DF710100E9DDCB00BCD5BB00187E1F0041B94D003FBF5000117D240098D7
      A500DAEDDE00F5F0F100F8F0F100F2F2F200000000000000000087858400FFFF
      FE00FFFFFE00FDFBFA00FCFAFA00FDFBFB00F9F9F900FAFAFA00FAFAFA00F7F7
      F700FAF9FB00FAF8F800DADCDD00D2D8D300DEE6DB00CEC6F500270F9700B7D1
      FF008CB5FA001714A0000000000000000000000000000000000085858500FFFE
      FF00FFFFFF00FBFBFB00F9F9F900FBFBFB00FEFCFC00FEFCFC00FCFAF900FDFB
      FA00FCFAF900FCFAF900DCDCDC00D9D9D900DADADA00DDDDDD00868686000000
      000000000000000000000000000000000000000000000000000000000000D6B0
      8C008888C4006064B4007070BC007070BC007074BC007474BC007474C0007478
      C0007478C0007C7CC8008080C4006464B000B0A8C800FEF6E600FCECE000FEF8
      F400D6B08C00000000000000000000000000F5F5F500F7F4F000DF7E2600FFF1
      C800FFE9AF00F1C28E00FAE6D500FFFFFB00FDE5CF00EFD09100F9C28500FFF2
      D700E07A2100A3D0A5000880270045C1450029BD310027C7370033C248001976
      2B00A2CFAE00DFEEE600EDF4F100F2F2F200000000000000000087858400FFFF
      FC00FDFAF600FFFEF900FFFBF800FFFDFA00FFFDF900FFFEFD00FFFDFC00FCFA
      FA00FFFFFF00DFDFCD009996980084838700838B7A0089938D008694AA00160C
      9C000A09A700D1D7FF000000000000000000000000000000000085858500FFFF
      FF00FFFEFE00FEFCFB00FFFCFB00FFFEFA00FFFEFB00FFFCF900FFFBF600FCF9
      F500FFFFFB00DDDBDA0095939200858585008484840094949400848687000000
      000000000000000000000000000000000000000000009595DC009595DC00F2E7
      DC00FEFEFE007B7AD1007677D100DFE0F500E1E2F5007778D3007879D400E2E3
      F600E3E4F700797AD4007B7CD600DEDFF500EAE8F2009492D4009490D400FEFC
      FB00F2E7DC009595DC009595DC0000000000F8F6EC00F5F2ED00EFD1B800F07A
      2B00E7740500D16D0000DBA15F00D6A55900E69D6300F4700000E0710000EB89
      3D00ACBA8A000085170046C4470069C9650021B52C002AB2240069D55D0037BF
      4F0000801D009ED7A400ECF0F100F3F3F300000000000000000089868200FFFE
      F900F3EFEA00F4EBE200F2E9E000F2EAE300EFE7E000EFE9E400EEE9E600EDE8
      E500FCF7F40096959E00FCFFFB00F4F3FC00F4F3FD00EFF2F6008B8FA100D4D6
      FF0000000000000000000000000000000000000000000000000085858500FFFE
      FB00F4EFEC00EEE9E600EDE7E200EEE6DF00F1E9E200F4EBE200F5ECE300EEEA
      E500FFFFFA0094918D00FFFFFE00FBF9F800F9F9F900EDEFF000969899000000
      000000000000000000000000000000000000000000000000000000000000D6B0
      8C00FEFEFE00FEF8EC00EAE4EC00D8D6EE00D0D0F400D0D0F400D0D0F400D0D0
      F400D0D2F600D2D2F600D2D2F600D4D4F600F0EAEE00FEF8EC00FEF6EC00FEF8
      F400D6B08C00000000000000000000000000F0F8F100F3F2FB00F4EEE900FFFC
      F100F0AB6C00FCAF6000FCCB7500F1C35E00FFCC7D00F5B06700C37F3600EDD2
      D6005FB97800A0DE9C00A2DC9B0043B0540030B739002AB52C0046B3470092E7
      970090DC9C007FAA8900F1EFF500F3F3F30000000000000000008C888300FFFF
      FA00EFE9E200FBEEE000F8EADE00FAEEE200F3E9DF00F4EBE200F2EAE300F3EB
      E400FFFFFA007E877D00F6FAFB00F6FBF200F7F3F90086897A00CDCAD3000000
      000000000000000000000000000000000000000000000000000085858500FFFD
      F800F2EAE300F0E8E100F5ECE300F6ECE200F8ECE000F7E9DD00F7EADC00F3ED
      E600FDF9F4008E8A8500F7F4F000FAF8F700F1F1F1008A8C8D00C2C4C5000000
      000000000000000000000000000000000000000000000000000000000000D6B0
      8C00FEFEFE00FCF4EC00FEF8EC00FEF8EC00FEF8EC00FEF8EC00FEF8EC00FEF8
      EC00FEF8EC00FEF8EC00FEF6EC00FEFCF800FEFCF800FEFCF800FEFCF800FEFC
      F800D6B08C00000000000000000000000000E0F8EE00E3EEF600F0FAF400F2EC
      F100D66E1B00FFDE8900FFBB6300FFB25400FDC26500FFDA8D00E26E0F00E1E2
      D800ACD6B70023904100008523000086140042C6430048C240000C841F000D7A
      2E003C884E00B1D0B300F1F6F900F3F3F30000000000000000008D898400FFFF
      F900EFE9E200FCECDC00FAEBDB00FFF0E300FAECE000F9EDE300F6EBE300F4EB
      E200FFFFF9008C7D9200FAF2F300FAECF8008B888000BFC2B300000000000000
      000000000000000000000000000000000000000000000000000085858500FFFF
      F900F5ECE300F3E8E000F8ECE200FAECE000FDEDE000FDEEDE00FFEFDF00F4EE
      E700FFFEF70089858000FEFBF700F4F2F10082828200BCBEBF00000000000000
      000000000000000000000000000000000000000000000000000000000000D6B0
      8C00FEFEFE00FEF8F200FEF8F200FEF8F200FEF8F200FEF8F200FEF8F200FEF6
      F000FEF8F200FEF8F200FCF4EE00FEFCF800D6B08C00D6B08C00D6B08C00D6B0
      8C00D6B08C00000000000000000000000000F1F7F600F5F2F400EFF3EE00FFF9
      E200E1803000F8E7BC00FAC97300F3C75400F5CC7000FBE6B200ED773600E7E2
      DF00F8F0FA00F8F5F700E8F0F0000781290044C2520035C34C00117A2B00E4FA
      E100F3F5EF00E4F2EE00F7F0F300F3F3F300000000000000000086868600FAFA
      FA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009A9A9A00EAEAEA008D8D8D00B6B6B60000000000000000000000
      000000000000000000000000000000000000000000000000000082828200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFA
      FA00FFFFFF0093939300F0F0F00086868600BCBCBC0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6B0
      8C00FEFEFE00FEF8F400FEF8F400FEFAF600FEF8F400FEF8F400FEF8F400FEF8
      F400FEF8F400FEF8F400FEF8F200FEFCFA00D6B08C00FEFEFE00FEFEFE00D6B0
      8C0000000000000000000000000000000000FFF8F000D6EFFF00F6F1F200F9F9
      E700FFD5AA00CD690B00FFF2C100FFDDBD00FFF6BD00C96F1100FBCBA700FFF9
      E500F8F0F100EFF7F600FBF4F900229244008CDE8C0092E1980046875A00E1F6
      E700EAF8F200E7F5F400FFEEFB00F3F3F3000000000000000000868686008E8E
      8E00828282008585850085858500858585008585850085858500858585008585
      8500858585007E7E7E0092929200C0C0C0000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008D8D8D008585
      8500858585008585850085858500858585008585850085858500858585008A8A
      8A0080808000808080009B9B9B00BDBDBD000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6B0
      8C00FEFEFE00FEFAF800FEFAF800FEFAF800FEFAF800FEFAF800FEFAF800FEFA
      F800FEFAF800FEFAF800FEFAF600FEFEFA00D6B08C00FEFEFE00D6B08C000000
      000000000000000000000000000000000000F9F4EB00EDF2F100EEF1F900FEEF
      EC00FFF5F800FFD39D00D6813300E46D0600D6833500FED0AE00E4EFF300F3ED
      F800EEFEE600FEF3EF00E3FBE300ABD7AE00338C4D0030914F00A4D5AF00EFF7
      F000ECF0F100F9FCFA00F9F2E900F3F3F3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6B0
      8C00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00D6B08C00D6B08C00000000000000
      000000000000000000000000000000000000ECF3EC00FFF8FB00E4EDF600DEEF
      FF00FCF2FF00E9F6F800FFF8EB00ECF2E700FBFBED00EDEBF700FFFCFC00DBEC
      EF00FDEFFF00E4F0FC00F9F7F600E7F2EA00ECFBF300E9F0ED00FFF8FB00F7F0
      F300F1F5F600ECEDF100FFF2FA00F3F3F3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6B0
      8C00D6B08C00D6B08C00D6B08C00D6B08C00D6B08C00D6B08C00D6B08C00D6B0
      8C00D6B08C00D6B08C00D6B08C00D6B08C00D6B08C0000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000800100000100010000000000001200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000E00003FFFFFFFFF43F000000E00003FF
      FFFFE00007000000E00003000000C00003000000E00003000000C00001000000
      E00003000000C00001000000E00003000000C00000000000E00003000000C000
      00000000E00003000000C00000000000E00003000000C00000000000E0000300
      0000C00000000000E00003000000C00000000000E00003000000C00000000000
      E00003000000C00000000000E00003000000C00001000000E00003000000C000
      00000000E00003000000C00003000000E00003000000C00005000000E0000300
      0000C00003000000E00007000000C00007000000E0000F000000C00007000000
      E0001F000000C00017000000E0003F000000C0002F000000E0007F000000E000
      7F000000E000FF000000FFFFFF000000FFE7FFFFE7FFFFFFFFFFFFFFFFC7FFFF
      E3FF800001800001FF87FFFFE1FF800001800001FF07FFFFE0FF800003800003
      FE07FFFFE07F800001800001FC07FFFFE03F800001800001F8000000001F8000
      01800001F0000000000F800001800001E00000000007800001800001C0000000
      0003800001800001800000000001800001800001000000000000800001800001
      000000000000800001800001800000000001800001800001C000000000038000
      01800001E00000000007800001800001F0000000000F800001800001F8000000
      001F800001800001FC07FFFFE03F800001800001FE07FFFFE07F800001800001
      FF07FFFFE0FF800001800001FF87FFFFE1FF800001800001FFC7FFFFE3FFC000
      03C00003FFE7FFFFE7FFE00007E00007FFFFFFFFFBFFFFFFFFFFFFFFFFFFFFFF
      F9FFFFF0F1FFFFFFFFFFFFFFF87FFFF000FFE7FF807E01FFF83F807000804201
      807E01807C01807000804001807E01807C01807801804001807E01807001807C
      01804000803E01807001807C01800000801E03C07001807801806000C03C03C0
      7000C03000C03000C01803C01000C01000C01801C00003C01803C00000C00003
      C00003C00003C00001C00003C00003C00003C00003C00003C00003C00003C000
      03C00003C00003C00003C00003C00003E00007E00007C00003C00003F8001FF8
      001FF8001FF8001FFC001FFC181FF8181FF8181FFC183FFC3C3FFC3C3FFC1C3F
      FC3C3FFC3C3FFC3C3FFC3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99FFFFFFFFFFFFFFFFFFFFFF81FF
      FFFF800001FFFFFFFFFF81FFFFFF000000000000FFFF81FF87FF000000000000
      FFFF81FE007F000000000000FFFFC3FE003F000000000000000000FC001F0000
      00000000000000FC001F000000000000000000FC001F000000000000000000E0
      001F000000000000000000800003000000000000000000000001000000000000
      0000000000000000000000000000000000000000000000000000008000000000
      00000000000000804000000000000000000000C07E01000000000000000000E0
      FF03000000000000000000F1FF87000000000000000000FFFFCF000001000000
      000000FFFFFFC00003000000000000FFFFFFC00003000000FFFFFFFFFFFFE000
      07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00003E08000FFFFFFF3
      FF9FC00003000000FFFFFFE1FF0FC00003000000FFFFFFC0FE07C00003000000
      FFCFFF807C03C00003000000FF87FF803803C00003000000FF03FFC01007C000
      03000000FE01FFE0000FC00003000000FC00FFF0001FC00003000000F8007FF8
      003FC00003000000F0003FFC007FC00003000000E0001FFE00FFC00003000000
      C0200FFC007FC00003000000807007F8003FC00003000000C0F803F0001FC000
      03000000E1FC01E0000FC00001000000F3FE01C01007C00003000000FFFF0380
      3803C00003000000FFFF87807C03C00007000000FFFFCFC0FE07C0000F000000
      FFFFFFE1FF0FC0001F000000FFFFFFF3FF9FC0003F000000FFFFFFFFFFFFC000
      7F000000FFFFFFFFFFFFC000FF000000FF00FFFFFFFFFF00FFFFFFFFFC003FFF
      FFFFFF00FFFFFFC3F0000FFFFFFFFF00FFFFFF81E00007FFFFFFFF00FFE1FF01
      C00003FFFFFFFF00FFC07E01C00003FFFFFFFF00FFC07C03800001FFFFFFFF00
      FFC07807800001000000FF00FFC0600F000000000000000000C0000F00000000
      0000000000C00007000000000000000000C00003000000000000000000C00003
      000000000000000000C00001000000000000000000C000010000000000000000
      00C00001000000000000000000C00003800001FFFFFFFF00FFC00003800001FF
      FFFFFF00FFC00007C00003FFFFFFFF00FFC0000FC00003FFFFFFFF00FFC0007F
      E00007FFFFFFFF00FFC0003FF0000FFFFFFFFF00FFC0003FFC003FFFFFFFFF00
      FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFC0000FF0001FFFFFFFFE007F800003E0
      000FFFFFFFF8001F800003E0000FFFFFFFF0000F800003E0000FFFFFFFE00007
      800003E0000F800001C00003800003E0000F000000800001800003E0000F0000
      00800001C00007E0000F000000000000C00007E0000F000000000000E0000FE0
      000F000000000000F0001FE0000F000000000000F8003FE0000F000000000000
      FC00FFE0000F000000000000FC007FE0000F000000000000FC007FE0000F0000
      00000000F8007FE0000F000000000000F8007FE0000F000000000000F8003FE0
      000F000000800001F8003FE0000F000000800001F8003FE0000F800001C00003
      F8003FE0000FFFFFFFE00007FC007FE0000FFFFFFFF0000FFC007FE0000FFFFF
      FFF8001FFE00FFF0001FFFFFFFFE007FFE007FFE007FFE007FFFC000F8001FF8
      001FF8001FFF8000F0000FF0000FF0000FFF8000E00007E00007E00007FF8000
      C00003C00003C00003FF80008000018000018000018000008000018000018000
      0100000000000000000000000000000100000000000000000000000100000000
      0000000000000001000000000000000000000001000000000000000000800003
      000000000000000000800003000000000000000000C000030000000000000000
      00F00003000000000000000000F00003000000000000000000E0000380000180
      0001800001E00007800001800001800001E0000FC00003C00003C00003E007FF
      E00007E00007E00007E007FFF0000FF0000FF0000FE007FFF8001FF8001FF800
      1FF007FFFE007FFE007FFE007FF80FFFFC00FE800001800001FE007FF8003C00
      0000000000F8001FE00008000000000000F0000FC00000000000000000E00007
      C00000000000000000C000038000000000000000008000010000000000000000
      00800001007C0000000000000000000000F80000000000000000000001E00000
      000000000000000081F8000000000000000000003FFF80000000000000000000
      01FFFC000000000000000000001F870000000000000000000007800000000000
      00000000001F00000000000000000000003E0000000000000000000000000000
      0000000000800001000001000000000000800001000003000000000000C00003
      000003000000000000E00007100007000000000000F0000F3C001F0000000000
      00F8001F7F003F800001800001FE007FFFFFFFFFF3C7FFFFFF800001FF007FFE
      0083FFFFFF000000FC001FF80001FE4003000000F8000FF00000FC0003000000
      F00007E00000FC0003000000E00003C00000C00003800001C00001800001C000
      03800001C00001800003C00003C00003800000000001C00003C0000380000000
      0001E00003E00007800000000000C00003F0000F800000000000C00003F0000F
      800000000001C00003F8001F800000000001C00003F8001F800000000001C000
      03FC003F800000000001C00003FE007F800000000001C00003FE007FC0000180
      0003C00007FF00FFC00001800003C0000FFF00FFE00003C00007C0001FFF81FF
      F00007E0000FC000FFFFC3FFF8000FF0001FC001FFFFE7FFFC001FF8003FFFFF
      FFFFFFFFFF007FFE00FFFFFFFFFFFFFFFFFFFFFFFFFFFFC00FFF81FF00001FFF
      FFFFFFC00FFF81FF00001FC0001FFFC00FF381CF00001FC00007FFC00FE00007
      00001FC00007C00000C0000300000FC00007C00000C00003000007C00007C000
      00E00007000003C00003C00000E00007000001C00003C00000E03C07000003C0
      0003C00000004200000007C00003C0000000810000000FC00007C00000008100
      00001FC00007C0000000810000001FC00007C0000000810000001FC0000FC000
      0000420000001FC0001FC00000E03C0700001FC0001FC00000E0000700001FC0
      001FC00000E0000700001FC0003FC00000C0000300001FC0003FC00001C00003
      00001FC0007FC007FFE0000700003FC000FFE00FFFF381CF00007FFFFFFFFFFF
      FFFF81FF0000FFFFFFFFFFFFFFFF81FF900008E00001FFFFFFFFF07F800000E0
      0000F0000FFFF007000000E00000E00007FF8000000000E00001800001FF8000
      000000E00003800001FF8000000000E00003800001FD8000000000E000038000
      01FD8000000000E00003800001FC8000000000E00003800001FC0000000000E0
      0003800001000000000000E00003800001000000000000E00003800001000000
      000000E00003800001000000000000E00003800001000000000000E000038000
      01000000000000E00003F0000FFC0000000000E00003F0000FFC8000000000E0
      0003F0000FFD8000000000E00007F0000FFF8000000000E0000FF0000FFF8000
      000000E0001FF0000FFF8000000000E0003FF8001FFF8000000000E0007FFC00
      3FFF8000000000E000FFFFFFFFFF8000FE0FFFFFFFFF000000C00001FC007FFF
      FFFF000000C00001F8000FF83FFF000000C00001F00007F007FF000000C00001
      E00007E000FF000000C00001E00007E0001F000000C00001E00007E0001F0000
      00C00001E00007E0001F000000C00001E00007E0001F000000C00001E00007E0
      001F000000C00001E00007E0001F000000C00001E00007E0001F000000C00001
      E00007E0001F000000C00001E0000FE0001F000000C00001E0000FE0001F0000
      00C00001E0000FE0001F000000C00001E0000FE0001F000000C00001E0000FE0
      001F000000C00001E0000FE0001F000000C00001E0000FF0001F000000C00001
      E0000FF8001F000000C00001E0000FFF003F000000C00001E0007FFFF07F0000
      00F9C0CFFFFFFFFFFFFF000000F9FFCFFFFE7FE00000FFFFFF00000FFFFC1FC0
      0000FFFFFF00000FE0000FC00000E0000F00000FE00007C00000E0000F00000F
      E00003E00000E0000F00000FE00001F00000E0000F00000FE00000E00000E000
      0F00000FE00000E00000E0000F00000FE00000E00000E0000F00000FE00000E0
      0000E0000F00000FE00000E00000E0000F00000FE00000F00000E0000F000007
      E00001F80000E0000F000003E00001FC0000E0000F000001E000039C0000E000
      0F000000E0000F000000E0000F000000E0000F000000E0000F000000E0000F00
      0000E0000F000000E0000F000001E0001F000001E0001FC00003E0001F00000F
      E0003FFC0007E0007F00000FE0007FFC000FE000FF00000FFFFFFFFC001FFFFF
      FF00000FFFFFFFFC003FFFFFFF00000F000000FFFFFFFFFFFFE00007000000FF
      FFFFFFFFFFE00007000000C0001FC00003E00007000000C0001FC00003E00007
      000000C0001FC00003E00007000000C0001FC00003E00007000000C0001FC000
      07E00007000000C0001FC00003800001000000C0001FC00003800007000000C0
      000FC00003000007000000C0000FC00003000007000000C00007C0001F000007
      000000C00003C0001F000007000000C00001C0001FC00007000000C00001C000
      1FE00007000000C00003C0001FE00007000000C00003C0001F800001000000C0
      000FC0001FE00007000000C0001FC0001FE00007000000C0003FC0003FE00007
      000000C0007FC0007FE0000F000000C000FFC000FFE0001F000000FFFFFFFFFF
      FFE0003F000000FFFFFFFFFFFFE0007F00000000000000000000000000000000
      000000000000}
  end
  object tbPredZapis: TAdsTable
    AdsConnection = dmBase.AdsConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'PredZapis'
    Left = 64
    Top = 160
  end
  object Query: TAdsQuery
    AdsConnection = dmBase.AdsConnection
    Left = 120
    Top = 160
    ParamData = <>
  end
  object dsMesto: TDataSource
    Left = 432
    Top = 128
  end
  object tbView: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'DAY'
        DataType = ftInteger
      end
      item
        Name = 'BEGINR'
        DataType = ftTime
      end
      item
        Name = 'LONGR'
        DataType = ftInteger
      end
      item
        Name = 'DECL_ID'
        DataType = ftInteger
      end
      item
        Name = 'AKT_ID'
        DataType = ftInteger
      end
      item
        Name = 'DATER'
        DataType = ftDateTime
      end
      item
        Name = 'DATEB'
        DataType = ftDate
      end
      item
        Name = 'OPIS'
        DataType = ftMemo
      end
      item
        Name = 'METKA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SPEC'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'OPIS_DECL'
        DataType = ftMemo
      end
      item
        Name = 'OPIS_AKT'
        DataType = ftMemo
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
    Left = 56
    Top = 248
    object tbViewID: TIntegerField
      FieldName = 'ID'
    end
    object tbViewDAY: TIntegerField
      FieldName = 'DAY'
    end
    object tbViewBEGINR: TTimeField
      FieldName = 'BEGINR'
    end
    object tbViewLONGR: TIntegerField
      FieldName = 'LONGR'
    end
    object tbViewDECL_ID: TIntegerField
      FieldName = 'DECL_ID'
    end
    object tbViewAKT_ID: TIntegerField
      FieldName = 'AKT_ID'
    end
    object tbViewNOMER: TIntegerField
      FieldName = 'NOMER'
    end
    object tbViewDATER: TDateTimeField
      FieldName = 'DATER'
    end
    object tbViewSPEC: TStringField
      FieldName = 'SPEC'
      Size = 50
    end
    object tbViewOPIS_DECL: TMemoField
      FieldName = 'OPIS_DECL'
      BlobType = ftMemo
    end
    object tbViewOPIS_AKT: TMemoField
      FieldName = 'OPIS_AKT'
      BlobType = ftMemo
    end
    object tbViewTELEFON: TStringField
      FieldName = 'TELEFON'
      Size = 30
    end
    object tbViewON_FIO: TStringField
      FieldName = 'ON_FIO'
      Size = 50
    end
    object tbViewONA_FIO: TStringField
      FieldName = 'ONA_FIO'
      Size = 50
    end
    object tbViewFIRST_BRAK: TBooleanField
      FieldName = 'FIRST_BRAK'
    end
    object tbViewNOMER_Z: TIntegerField
      FieldName = 'NOMER_Z'
    end
    object tbViewDATE_Z: TDateField
      FieldName = 'DATE_Z'
    end
    object tbViewDATEB: TDateField
      FieldName = 'DATEB'
    end
    object tbViewOPIS: TMemoField
      FieldName = 'OPIS'
      BlobType = ftMemo
    end
    object tbViewYEAR: TSmallintField
      FieldName = 'YEAR'
    end
    object tbViewMONTH: TSmallintField
      FieldName = 'MONTH'
    end
    object tbViewDATE_BRAK: TDateField
      FieldName = 'DATE_BRAK'
    end
    object tbViewMESTO: TIntegerField
      FieldName = 'MESTO'
    end
    object tbViewDATE_DECL: TDateField
      FieldName = 'DATE_DECL'
    end
  end
  object tbEdit: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'DAY'
        DataType = ftInteger
      end
      item
        Name = 'BEGINR'
        DataType = ftTime
      end
      item
        Name = 'LONGR'
        DataType = ftInteger
      end
      item
        Name = 'DECL_ID'
        DataType = ftInteger
      end
      item
        Name = 'AKT_ID'
        DataType = ftInteger
      end
      item
        Name = 'DATER'
        DataType = ftDateTime
      end
      item
        Name = 'DATEB'
        DataType = ftDate
      end
      item
        Name = 'OPIS'
        DataType = ftMemo
      end
      item
        Name = 'METKA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SPEC'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'OPIS_DECL'
        DataType = ftMemo
      end
      item
        Name = 'OPIS_AKT'
        DataType = ftMemo
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
    Left = 112
    Top = 248
    object tbEditID: TIntegerField
      FieldName = 'ID'
    end
    object tbEditDAY: TIntegerField
      FieldName = 'DAY'
    end
    object tbEditBEGINR: TTimeField
      FieldName = 'BEGINR'
    end
    object tbEditLONGR: TIntegerField
      FieldName = 'LONGR'
    end
    object tbEditDECL_ID: TIntegerField
      FieldName = 'DECL_ID'
    end
    object tbEditAKT_ID: TIntegerField
      FieldName = 'AKT_ID'
    end
    object tbEditNOMER: TIntegerField
      FieldName = 'NOMER'
    end
    object tbEditDATER: TDateTimeField
      FieldName = 'DATER'
    end
    object tbEditDATEB: TDateField
      FieldName = 'DATEB'
    end
    object tbEditOPIS: TMemoField
      FieldName = 'OPIS'
      BlobType = ftMemo
    end
    object tbEditSPEC: TStringField
      FieldName = 'SPEC'
      Size = 50
    end
    object tbEditOPIS_DECL: TMemoField
      FieldName = 'OPIS_DECL'
      BlobType = ftMemo
    end
    object tbEditOPIS_AKT: TMemoField
      FieldName = 'OPIS_AKT'
      BlobType = ftMemo
    end
    object tbEditNOMER_Z: TIntegerField
      FieldName = 'NOMER_Z'
    end
    object tbEditDATE_Z: TDateField
      FieldName = 'DATE_Z'
    end
    object tbEditTELEFON: TStringField
      FieldName = 'TELEFON'
    end
    object tbEditON_FIO: TStringField
      FieldName = 'ON_FIO'
      Size = 50
    end
    object tbEditONA_FIO: TStringField
      FieldName = 'ONA_FIO'
      Size = 50
    end
    object tbEditFIRST_BRAK: TBooleanField
      FieldName = 'FIRST_BRAK'
    end
    object tbEditYEAR: TSmallintField
      FieldName = 'YEAR'
    end
    object tbEditMONTH: TSmallintField
      FieldName = 'MONTH'
    end
    object tbEditDATE_BRAK: TDateField
      FieldName = 'DATE_BRAK'
    end
    object tbEditMESTO: TIntegerField
      FieldName = 'MESTO'
    end
    object tbEditDATE_DECL: TDateField
      FieldName = 'DATE_DECL'
    end
  end
  object dsView: TDataSource
    DataSet = tbView
    Left = 56
    Top = 288
  end
  object frxPredZapis: TfrxDBDataset
    UserName = 'frxPredZapis'
    CloseDataSource = False
    DataSet = tbPredZapis
    BCDToCurrency = False
    Left = 216
    Top = 240
  end
  object frxTable: TfrxDBDataset
    UserName = 'frxTable'
    CloseDataSource = False
    DataSet = table
    BCDToCurrency = False
    Left = 272
    Top = 240
  end
  object frxView: TfrxDBDataset
    UserName = 'frxView'
    CloseDataSource = False
    DataSet = tbView
    BCDToCurrency = False
    Left = 216
    Top = 280
  end
  object PopupMenu1: TPopupMenu
    Left = 200
    Top = 128
    object N1: TMenuItem
      Caption = #1055#1086' '#1094#1077#1085#1090#1088#1091' '#1101#1082#1088#1072#1085#1072
      OnClick = N1Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 384
    Top = 208
  end
  object dsGurnal: TDataSource
    DataSet = Gurnal
    Left = 924
    Top = 259
  end
  object Gurnal: TAdsQuery
    StoreActive = False
    SQL.Strings = (
      'SELECT ID,NOMER,TYPEOBJ,MESTO,GOD,MONTH,DAY,BEGINR,LONGR,OTKAZ, '
      
        '   Convert(DATER,SQL_DATE) DATER, Convert(DATE_CORR,SQL_DATE) DA' +
        'TE_CORR, '
      '   TELEFON, ON_FIO, ONA_FIO, FIRST_BRAK,'
      
        '   convert(cast(god as SQL_CHAR(4))+'#39'-'#39'+IIF(length(convert(month' +
        ',SQL_VARCHAR))=1,'#39'0'#39'+convert(month,SQL_VARCHAR),convert(month,SQ' +
        'L_VARCHAR))+'#39'-'#39'+IIF(length(convert(day,SQL_VARCHAR))=1,'#39'0'#39'+conve' +
        'rt(day,SQL_VARCHAR),convert(day,SQL_VARCHAR)),SQL_DATE) DATE_BRA' +
        'K '
      'FROM PredZapis '
      
        'WHERE god=:par_god and month=:par_month and typeobj=:par_typeobj' +
        ' and mesto=:par_mesto and day>0 and (true=:par_all or day=:par_d' +
        'ay)'
      'ORDER BY GOD,MONTH,DAY,BEGINR')
    AdsConnection = dmBase.AdsConnection
    Left = 892
    Top = 259
    ParamData = <
      item
        DataType = ftInteger
        Name = 'par_god'
        ParamType = ptUnknown
        Value = 2015
      end
      item
        DataType = ftInteger
        Name = 'par_month'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'par_typeobj'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'par_mesto'
        ParamType = ptUnknown
      end
      item
        DataType = ftBoolean
        Name = 'par_all'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'par_day'
        ParamType = ptUnknown
      end>
  end
end
