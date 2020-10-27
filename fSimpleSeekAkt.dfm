object fmSimpleSeekAkt: TfmSimpleSeekAkt
  Left = 351
  Top = 257
  ActiveControl = edNomer
  BorderStyle = bsDialog
  Caption = #1053#1072#1081#1090#1080' '#1072#1082#1090#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
  ClientHeight = 184
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 14
    Top = 69
    Width = 43
    Height = 16
    Caption = #1053#1086#1084#1077#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 14
    Top = 99
    Width = 24
    Height = 16
    Caption = #1043#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 14
    Top = 39
    Width = 22
    Height = 16
    Caption = #1058#1080#1087
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 14
    Top = 130
    Width = 71
    Height = 16
    Caption = #1054#1088#1075#1072#1085' '#1079#1072#1075#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edNomer: TDBNumberEditEh
    Left = 119
    Top = 65
    Width = 81
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxValue = 9999999.000000000000000000
    MinValue = 1.000000000000000000
    ParentFont = False
    TabOrder = 1
    Visible = True
    OnChange = edNomerChange
    OnUpdateData = edTypeAktUpdateData
  end
  object edYear: TDBNumberEditEh
    Left = 119
    Top = 95
    Width = 81
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
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100
        Style = ebsGlyphEh
        OnClick = edYearEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxValue = 2100.000000000000000000
    MinValue = 1900.000000000000000000
    ParentFont = False
    TabOrder = 2
    Visible = True
    OnUpdateData = edTypeAktUpdateData
  end
  object edTypeAkt: TDBComboBoxEh
    Left = 120
    Top = 35
    Width = 249
    Height = 24
    HelpContext = 888
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'edTypeAkt'
    Visible = True
    OnChange = edTypeAktChange
    OnUpdateData = edTypeAktUpdateData
  end
  object edOrgan: TDBLookupComboboxEh
    Left = 120
    Top = 126
    Width = 472
    Height = 24
    HelpContext = 999
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edOrganEditButtons0Click
      end
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
        OnClick = edOrganEditButtons1Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = dsOrgan
    ParentFont = False
    TabOrder = 3
    Visible = True
    OnUpdateData = edTypeAktUpdateData
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 606
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
  object FoundRecord_: TListView
    Left = 0
    Top = 152
    Width = 57
    Height = 32
    AllocBy = 500
    BorderWidth = 1
    Columns = <
      item
        Caption = #1054#1088#1075#1072#1085' '#1079#1072#1075#1089
        Width = 400
      end
      item
        Alignment = taCenter
        AutoSize = True
        Caption = #1043#1086#1076
        WidthType = (
          -349)
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    FullDrag = True
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 5
    ViewStyle = vsReport
    Visible = False
    OnColumnClick = FoundRecord_ColumnClick
    OnCompare = FoundRecord_Compare
    OnDblClick = FoundRecord_DblClick
  end
  object FoundRecord: TDBGridEh
    Left = 0
    Top = 144
    Width = 545
    Height = 40
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
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    OnDblClick = FoundRecordDblClick
    OnGetCellParams = FoundRecordGetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'GOD'
        Footers = <>
        Title.Caption = #1043#1086#1076
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'NAME_ZAGS'
        Footers = <>
        Title.Caption = #1054#1088#1075#1072#1085' '#1079#1072#1075#1089
        Width = 257
      end
      item
        EditButtons = <>
        FieldName = 'NAME_ZAGS_2'
        Footers = <>
        Title.Caption = #1054#1090' '#1080#1084#1077#1085#1080
        Width = 196
      end>
  end
  object dsOrgan: TDataSource
    DataSet = dmBase.SprNames
    Left = 408
    Top = 64
  end
  object dsSeek: TDataSource
    DataSet = tbSeek
    Left = 328
    Top = 80
  end
  object tbSeek: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'GOD'
        DataType = ftInteger
      end
      item
        Name = 'NAME_ZAGS'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'NAME_ZAGS_2'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'DATEZ'
        DataType = ftDate
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
    Left = 272
    Top = 88
    object tbSeekGOD: TIntegerField
      FieldName = 'GOD'
    end
    object tbSeekNAME_ZAGS: TStringField
      FieldName = 'NAME_ZAGS'
      Size = 200
    end
    object tbSeekNAME_ZAGS_2: TStringField
      FieldName = 'NAME_ZAGS_2'
      Size = 200
    end
    object tbSeekID: TIntegerField
      FieldName = 'ID'
    end
    object tbSeekDATEZ: TDateField
      FieldName = 'DATEZ'
    end
    object tbSeekVOSSTAN: TBooleanField
      FieldName = 'VOSSTAN'
    end
  end
end
