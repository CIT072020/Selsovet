object fmMsgList: TfmMsgList
  Left = 354
  Top = 185
  Width = 1025
  Height = 499
  Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1103' '#1074' '#1087#1086#1095#1090#1086#1074#1086#1084' '#1103#1097#1080#1082#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GridMsg: TDBGridEh
    Left = 0
    Top = 26
    Width = 1009
    Height = 435
    Align = alClient
    DataSource = ds
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    OnGetCellParams = GridMsgGetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'nomer'
        Footers = <>
        Title.Caption = #8470
        Width = 38
      end
      item
        EditButtons = <>
        FieldName = 'date'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072
        Width = 85
      end
      item
        Alignment = taLeftJustify
        EditButtons = <>
        FieldName = 'STATUS'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        PickList.Strings = (
          #1087#1086#1083#1091#1095#1077#1085#1086
          #1085#1086#1074#1086#1077)
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Width = 69
      end
      item
        DisplayFormat = '### ### ### ###'
        EditButtons = <>
        FieldName = 'size'
        Footers = <>
        Title.Caption = #1056#1072#1079#1084#1077#1088' ('#1073#1072#1081#1090')'
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'subject'
        Footers = <>
        Title.Caption = #1058#1077#1084#1072
        Width = 330
      end
      item
        Alignment = taLeftJustify
        EditButtons = <>
        FieldName = 'run'
        Footers = <>
        KeyList.Strings = (
          '1'
          '2')
        PickList.Strings = (
          #1087#1086#1083#1091#1095#1080#1090#1100' '#1087#1086#1074#1090#1086#1088#1085#1086
          #1091#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1103#1097#1080#1082#1072)
        Title.Caption = #1044#1077#1081#1089#1090#1074#1080#1077
        Width = 133
      end
      item
        EditButtons = <>
        FieldName = 'UID'
        Footers = <>
        Title.Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
        Width = 237
      end
      item
        EditButtons = <>
        FieldName = 'from'
        Footers = <>
        Title.Caption = #1054#1090' '#1082#1086#1075#1086
        Width = 244
      end>
  end
  object Button1: TButton
    Left = 48
    Top = 360
    Width = 75
    Height = 25
    Caption = #1090#1077#1089#1090
    TabOrder = 1
    Visible = False
    OnClick = Button1Click
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 1009
    Height = 26
    AllowDrag = False
    FixAlign = True
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      CloseButton = False
      FullSize = True
      Images = fmMain.ImageList
      MenuBar = True
      ParentShowHint = False
      ProcessShortCuts = True
      ShowHint = True
      ShrinkMode = tbsmWrap
      Stretch = True
      TabOrder = 0
      object TBItemLoad: TTBItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1091' '#1087#1086#1095#1090#1086#1074#1086#1075#1086' '#1103#1097#1080#1082#1072
        ImageIndex = 26
        OnClick = TBItemLoadClick
      end
      object TBItemNew: TTBItem
        Caption = #1053#1086#1074#1086#1077
        Hint = #1054#1090#1084#1077#1090#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1077' '#1076#1083#1103' '#1087#1086#1074#1090#1086#1088#1085#1086#1075#1086' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
        ImageIndex = 43
        ShortCut = 32
        OnClick = TBItemNewClick
      end
      object TBItemDel: TTBItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        Hint = #1054#1090#1084#1077#1090#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1077' '#1076#1083#1103' '#1091#1076#1072#1083#1077#1085#1080#1103
        ImageIndex = 41
        ShortCut = 46
        OnClick = TBItemDelClick
      end
      object TBItemDelAll: TTBItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077
        Hint = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077' '#1087#1086#1083#1091#1095#1077#1085#1085#1099#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1103' '#1076#1083#1103' '#1091#1076#1072#1083#1077#1085#1080#1103
        ImageIndex = 10
        OnClick = TBItemDelAllClick
      end
      object TBItemBack: TTBItem
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100
        Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1089#1077' '#1076#1077#1081#1089#1090#1074#1080#1103
        ImageIndex = 38
        OnClick = TBItemBackClick
      end
      object TBItemRun: TTBItem
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
        Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1077' '#1076#1077#1081#1089#1090#1074#1080#1103
        ImageIndex = 7
        OnClick = TBItemRunClick
      end
      object TBItemExit: TTBItem
        Caption = #1042#1099#1093#1086#1076
        Hint = #1042#1099#1093#1086#1076
        ImageIndex = 62
        OnClick = TBItemExitClick
      end
    end
  end
  object Button2: TButton
    Left = 160
    Top = 360
    Width = 75
    Height = 25
    Caption = #1087#1086#1083#1091#1095#1080#1090#1100
    TabOrder = 3
    Visible = False
    OnClick = Button2Click
  end
  object ds: TDataSource
    DataSet = MsgList
    Left = 80
    Top = 168
  end
  object MsgList: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'subject'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'size'
        DataType = ftInteger
      end
      item
        Name = 'from'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'date'
        DataType = ftDate
      end
      item
        Name = 'status'
        DataType = ftInteger
      end
      item
        Name = 'run'
        DataType = ftInteger
      end
      item
        Name = 'UID'
        DataType = ftString
        Size = 50
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
    Left = 136
    Top = 168
    object MsgListnomer: TIntegerField
      FieldName = 'nomer'
    end
    object MsgListSubject: TStringField
      FieldName = 'subject'
      Size = 300
    end
    object MsgListSize: TIntegerField
      FieldName = 'size'
    end
    object MsgListFrom: TStringField
      FieldName = 'from'
      Size = 200
    end
    object MsgListDate: TDateField
      FieldName = 'date'
    end
    object MsgListStatus: TIntegerField
      FieldName = 'STATUS'
    end
    object MsgListRun: TIntegerField
      FieldName = 'run'
    end
    object MsgListUID: TStringField
      FieldName = 'UID'
      Size = 50
    end
  end
end
