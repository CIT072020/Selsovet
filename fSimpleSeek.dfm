object fmSimpleSeek: TfmSimpleSeek
  Left = 396
  Top = 257
  BorderStyle = bsDialog
  Caption = #1053#1072#1081#1090#1080
  ClientHeight = 265
  ClientWidth = 656
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 656
    Height = 26
    AllowDrag = False
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      CloseButton = False
      DockMode = dmCannotFloat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      FullSize = True
      Images = fmMain.ImageList
      MenuBar = True
      ParentFont = False
      ParentShowHint = False
      ProcessShortCuts = True
      ShowHint = True
      ShrinkMode = tbsmNone
      SmoothDrag = False
      TabOrder = 0
      object TBItemSeek: TTBItem
        Caption = #1053#1072#1081#1090#1080
        DisplayMode = nbdmImageAndText
        ImageIndex = 7
        ShortCut = 113
        OnClick = TBItemSeekClick
      end
      object TBItemChoice: TTBItem
        Caption = #1042#1099#1073#1088#1072#1090#1100
        DisplayMode = nbdmImageAndText
        ImageIndex = 36
        OnClick = TBItemChoiceClick
      end
      object TBItemRefresh: TTBItem
        Caption = #1055#1086#1074#1090#1086#1088#1080#1090#1100
        DisplayMode = nbdmImageAndText
        ImageIndex = 38
        ShortCut = 16497
        OnClick = TBItemRefreshClick
      end
      object TBItemCancel: TTBItem
        Caption = #1054#1090#1082#1072#1079
        DisplayMode = nbdmImageAndText
        ImageIndex = 20
        OnClick = TBItemCancelClick
      end
    end
  end
  object FoundRecord: TDBGridEh
    Left = 5
    Top = 88
    Width = 644
    Height = 171
    DataSource = dsSeek
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    Visible = False
    OnDblClick = FoundRecordDblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'FIO'
        Footers = <>
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
        Width = 152
      end
      item
        EditButtons = <>
        FieldName = 'ADRES'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089
        Width = 341
      end
      item
        EditButtons = <>
        FieldName = 'NOMER'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072
        Width = 73
      end>
  end
  object cbType: TComboBox
    Left = 13
    Top = 44
    Width = 191
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ItemIndex = 0
    ParentFont = False
    TabOrder = 2
    Text = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
    Items.Strings = (
      #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
      #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090)
  end
  object edSeek: TDBEditEh
    Left = 225
    Top = 44
    Width = 174
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
  object dsSeek: TDataSource
    DataSet = tbSeek
    Left = 472
    Top = 40
  end
  object tbSeek: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'VOSSTAN'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'DATEZ'
    IndexName = 'tbSeekIndex2'
    IndexDefs = <
      item
        Name = 'tbSeekIndex2'
        Fields = 'DATEZ'
        Options = [ixDescending]
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
    Left = 432
    Top = 40
    object tbSeekLIC_ID: TIntegerField
      FieldName = 'LIC_ID'
    end
    object tbSeekID: TIntegerField
      FieldName = 'ID'
    end
    object tbSeekFIO: TStringField
      FieldName = 'FIO'
      Size = 100
    end
    object tbSeekNOMER: TStringField
      FieldName = 'NOMER'
      Size = 15
    end
    object tbSeekADRES: TStringField
      FieldName = 'ADRES'
      Size = 200
    end
  end
end
