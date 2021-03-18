object fmTableGurnal: TfmTableGurnal
  Left = 429
  Top = 250
  ActiveControl = Grid
  AutoScroll = False
  Caption = #1058#1072#1073#1083#1080#1095#1085#1099#1081' '#1078#1091#1088#1085#1072#1083
  ClientHeight = 405
  ClientWidth = 929
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object TBDock: TTBDock
    Left = 0
    Top = 0
    Width = 929
    Height = 28
    Visible = False
    object TBToolbar1: TTBToolbar
      Left = 82
      Top = 0
      Caption = 'TBToolbar1'
      DockMode = dmCannotFloat
      DockPos = 63
      DragHandleStyle = dhNone
      Images = fmMain.ImageList
      ParentShowHint = False
      ProcessShortCuts = True
      ShowHint = True
      TabOrder = 0
      object TBItemPreview: TTBItem
        Caption = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088
        Hint = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088' '#1086#1090#1095#1077#1090#1072
        ImageIndex = 31
        OnClick = TBItemPreviewClick
      end
      object TBItemPrint: TTBItem
        Caption = #1055#1077#1095#1072#1090#1100
        Hint = #1055#1077#1095#1072#1090#1100' '#1086#1090#1095#1077#1090#1072
        ImageIndex = 24
        OnClick = TBItemPrintClick
      end
      object TBItemDel: TTBItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
        ImageIndex = 34
        ShortCut = 16430
        OnClick = TBItemDelClick
      end
      object TBSubmenuSysFilter: TTBSubmenuItem
        Caption = #1057#1080#1089#1090#1077#1084#1085#1099#1081' '#1086#1090#1073#1086#1088
        Hint = #1057#1080#1089#1090#1077#1084#1085#1099#1081' '#1086#1090#1073#1086#1088
        ImageIndex = 106
        Visible = False
      end
      object TBItemColumnFilter: TTBItem
        Caption = #1054#1090#1073#1086#1088
        Hint = #1054#1090#1073#1086#1088' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1081' '#1082#1086#1083#1086#1085#1082#1077
        ImageIndex = 35
        ShortCut = 115
        OnClick = TBItemColumnFilterClick
      end
      object TBItemRepeatFilter: TTBItem
        Caption = #1055#1086#1074#1090#1086#1088#1080#1090#1100' '#1086#1090#1073#1086#1088
        Hint = #1055#1086#1074#1090#1086#1088#1080#1090#1100' '#1086#1090#1073#1086#1088
        ImageIndex = 85
        OnClick = TBItemRepeatFilterClick
      end
      object TBItemClrFlt: TTBItem
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1086#1090#1073#1086#1088
        Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1086#1090#1073#1086#1088
        ImageIndex = 58
        OnClick = TBItemClrFltClick
      end
      object TBItemExport: TTBItem
        Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100
        ImageIndex = 96
        OnClick = TBItemExportClick
      end
      object TBSubmenuRun: TTBSubmenuItem
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
        Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1086#1073#1088#1072#1073#1086#1090#1082#1091
        ImageIndex = 22
        Visible = False
      end
      object TBItemCount: TTBItem
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1080#1089#1077#1081
        ImageIndex = 102
        OnClick = TBItemCountClick
      end
      object TBItemRefresh: TTBItem
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        Hint = #1054#1073#1085#1086#1074#1080#1090#1100
        ImageIndex = 69
        OnClick = TBItemRefreshClick
      end
      object TBItemReport: TTBItem
        Caption = #1054#1090#1095#1077#1090#1099
        ImageIndex = 12
        OnClick = TBItemReportClick
      end
      object TBItemExit: TTBItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        Hint = #1047#1072#1082#1088#1099#1090#1100
        ImageIndex = 62
        OnClick = TBItemExitClick
      end
    end
    object TBToolbarMove: TTBToolbar
      Left = 0
      Top = 0
      BorderStyle = bsNone
      Caption = 'TBToolbarMove'
      DockMode = dmCannotFloat
      DragHandleStyle = dhNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object TBControlItem1: TTBControlItem
        Control = DBNavigator1
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 1
        Width = 78
        Height = 22
        DataSource = DataSource
        VisibleButtons = [nbInsert, nbPost, nbCancel]
        DragMode = dmAutomatic
        Flat = True
        Hints.Strings = (
          #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
          #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
          #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
          #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
          #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
          #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
          #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
          #1055#1088#1080#1085#1103#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          #1054#1090#1084#1077#1085#1080#1090#1100
          #1054#1073#1085#1086#1074#1080#1090#1100)
        TabOrder = 0
      end
    end
    object TBToolbar2: TTBToolbar
      Left = 339
      Top = 0
      AutoResize = False
      Caption = 'TBToolbarOrder'
      DockMode = dmCannotFloat
      DockPos = 208
      DragHandleStyle = dhNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      object TBControlItem3: TTBControlItem
        Control = cbOrderBy
      end
      object cbOrderBy: TComboBox
        Left = 0
        Top = 0
        Width = 278
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
        OnChange = cbOrderBy1Change
      end
    end
  end
  object Grid: TSasaDBGrid
    Left = 0
    Top = 62
    Width = 929
    Height = 343
    Align = alClient
    Ctl3D = True
    DataSource = DataSource
    DrawMemoText = True
    EditActions = [geaCopyEh, geaSelectAllEh]
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
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    OnTitleBtnClick = GridTitleBtnClick
    EnterDirection = mdNextGraph
    OptionsS = [dgsSelectCurrentColor]
    SelRowColor = clAqua
    Color1 = clBlack
    Color2 = clBlack
    TypeSave = 0
  end
  object TBDock24: TTBDock
    Left = 0
    Top = 28
    Width = 929
    Height = 34
    Visible = False
    object DBNavigator24: TDBNavigator
      Left = 0
      Top = 2
      Width = 90
      Height = 30
      DataSource = DataSource
      VisibleButtons = [nbInsert, nbPost, nbCancel]
      Align = alLeft
      DragMode = dmAutomatic
      Flat = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object TBToolbarMenu24: TTBToolbar
      Left = 90
      Top = 0
      Align = alLeft
      BorderStyle = bsNone
      Caption = 'TBToolbarMenu24'
      DockMode = dmCannotFloat
      DockPos = 90
      Images = fmMain.ImageList24
      ParentShowHint = False
      ProcessShortCuts = True
      ShowHint = True
      TabOrder = 1
      object TBItemPreview24: TTBItem
        Caption = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088
        ImageIndex = 35
        OnClick = TBItemPreviewClick
      end
      object TBItemPrint24: TTBItem
        Caption = #1055#1077#1095#1072#1090#1100
        ImageIndex = 36
        OnClick = TBItemPrintClick
      end
      object TBItemDel24: TTBItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
        ImageIndex = 32
        OnClick = TBItemDelClick
      end
      object TBSubmenuSysFilter24: TTBSubmenuItem
        Caption = #1057#1080#1089#1090#1077#1084#1085#1099#1081' '#1086#1090#1073#1086#1088
        ImageIndex = 91
        Visible = False
      end
      object TBItemColumnFilter24: TTBItem
        Caption = #1054#1090#1073#1086#1088
        ImageIndex = 78
        OnClick = TBItemColumnFilterClick
      end
      object TBItemRepeatFilter24: TTBItem
        Caption = #1055#1086#1074#1090#1086#1088#1080#1090#1100' '#1086#1090#1073#1086#1088
        ImageIndex = 42
        OnClick = TBItemRepeatFilterClick
      end
      object TBItemClrFlt24: TTBItem
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1086#1090#1073#1086#1088
        ImageIndex = 43
        OnClick = TBItemClrFltClick
      end
      object TBItemExport24: TTBItem
        Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100
        ImageIndex = 38
        OnClick = TBItemExportClick
      end
      object TBSubmenuRun24: TTBSubmenuItem
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
        ImageIndex = 25
        Visible = False
      end
      object TBItemCount24: TTBItem
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        ImageIndex = 65
        OnClick = TBItemCountClick
      end
      object TBItemRefresh24: TTBItem
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        ImageIndex = 98
        OnClick = TBItemRefreshClick
      end
      object TBItemReport24: TTBItem
        Caption = #1054#1090#1095#1077#1090#1099
        ImageIndex = 67
        OnClick = TBItemReportClick
      end
      object TBItemExit24: TTBItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        ImageIndex = 66
        OnClick = TBItemExitClick
      end
    end
    object TBToolbarMenu24_2: TTBToolbar
      Left = 441
      Top = 0
      BorderStyle = bsNone
      Caption = 'TBToolbarMenu24_2'
      DockPos = 429
      TabOrder = 2
    end
  end
  object DataSource: TDataSource
    DataSet = Table
    Left = 144
    Top = 88
  end
  object Table: TAdsTable
    StoreActive = False
    AdsConnection = dmBase.AdsConnection
    AdsTableOptions.AdsFilterOptions = RESPECT_WHEN_COUNTING
    AdsTableOptions.AdsScopeOptions = RESPECT_SCOPES_WHEN_COUNTING
    AdsTableOptions.AdsRecordCache = rcAggressive
    AdsTableOptions.AdsAutoKeyFieldCount = True
    Left = 192
    Top = 88
  end
  object PopupMenu1: TPopupMenu
    Left = 200
    Top = 128
    object N1: TMenuItem
      Caption = #1055#1086' '#1094#1077#1085#1090#1088#1091' '#1101#1082#1088#1072#1085#1072
      OnClick = N1Click
    end
  end
end
