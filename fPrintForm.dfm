object fmPrintForm: TfmPrintForm
  Left = 418
  Top = 236
  Width = 616
  Height = 477
  Caption = 'fmPrintForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 600
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      DragHandleStyle = dhNone
      FullSize = True
      Images = fmMain.ImageList
      ProcessShortCuts = True
      TabOrder = 0
      object TBItemPreView: TTBItem
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088
        Hint = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088'   F5'
        ImageIndex = 31
        ShortCut = 116
        OnClick = TBItemPreViewClick
      end
      object TBItemPrint: TTBItem
        Caption = #1055#1077#1095#1072#1090#1100
        Hint = #1055#1077#1095#1072#1090#1100'   F6'
        ImageIndex = 24
        ShortCut = 117
        OnClick = TBItemPrintClick
      end
      object TBItemDesign: TTBItem
        Caption = #1056#1072#1079#1088#1072#1073#1086#1090#1072#1090#1100
        ImageIndex = 12
        OnClick = TBItemDesignClick
      end
      object TBItemExit: TTBItem
        Caption = #1042#1099#1093#1086#1076
        Hint = #1042#1099#1093#1086#1076
        ImageIndex = 62
        OnClick = TBItemExitClick
      end
    end
  end
  object frReport: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    ShowProgress = False
    RebuildPrinter = False
    Left = 392
    Top = 48
    ReportForm = {19000000}
  end
  object frDBPrintForm: TfrDBDataSet
    DataSet = Dokument
    Left = 392
    Top = 80
  end
  object frDBListPrintForm: TfrDBDataSet
    DataSet = List
    Left = 392
    Top = 120
  end
  object Dokument: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
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
    Left = 344
    Top = 80
    object DokumentNAME: TStringField
      FieldName = 'NAME'
      Size = 250
    end
  end
  object List: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = 1
    FieldDefs = <>
    IndexName = 'ListIndex'
    IndexDefs = <
      item
        Name = 'ListIndex'
        Fields = 'NPP'
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
    Left = 344
    Top = 120
    object ListNPP: TIntegerField
      FieldName = 'NPP'
    end
  end
  object dsDokument: TDataSource
    DataSet = Dokument
    Left = 304
    Top = 80
  end
  object dsList: TDataSource
    DataSet = List
    Left = 304
    Top = 120
  end
  object frxDBPrintForm: TfrxDBDataset
    UserName = 'Dokument'
    CloseDataSource = False
    DataSet = Dokument
    BCDToCurrency = False
    Left = 456
    Top = 80
  end
  object frxDBListPrintForm: TfrxDBDataset
    UserName = 'List'
    CloseDataSource = False
    DataSet = List
    BCDToCurrency = False
    Left = 456
    Top = 120
  end
  object frxReport: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41722.679675439820000000
    ReportOptions.LastChange = 41722.679675439820000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 456
    Top = 40
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
