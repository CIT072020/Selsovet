object fmDeliverStatus: TfmDeliverStatus
  Left = 409
  Top = 206
  Width = 1064
  Height = 443
  Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1088#1072#1089#1089#1099#1083#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefaultPosOnly
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TDBGridEh
    Left = 0
    Top = 26
    Width = 1048
    Height = 379
    Align = alClient
    DataSource = DataSource
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
    RowHeight = 18
    RowSizingAllowed = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'MSG_ID'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'SMDOCODE'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        Width = 316
      end
      item
        EditButtons = <>
        FieldName = 'UVD_DISP'
        Footers = <>
        Visible = False
        Width = 38
      end
      item
        EditButtons = <>
        FieldName = 'DATE_DISP'
        Footers = <>
        Title.Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1086' '#1086#1090' '#1084#1072#1088#1096#1088#1091#1090#1080#1079#1072#1090#1086#1088#1072
      end
      item
        EditButtons = <>
        FieldName = 'UVD_RECEIVED'
        Footers = <>
        Visible = False
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'DATE_RECEIVED'
        Footers = <>
        Title.Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1086' '#1087#1086#1083#1091#1095#1077#1085#1080#1080
      end
      item
        EditButtons = <>
        FieldName = 'UVD_REGISTER'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'DATE_REGISTER'
        Footers = <>
        Title.Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      end
      item
        EditButtons = <>
        FieldName = 'ADR_REGNUMBER'
        Footers = <>
        Title.Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103'|'#1085#1086#1084#1077#1088
        Width = 125
      end
      item
        EditButtons = <>
        FieldName = 'ADR_REGDATE'
        Footers = <>
        Title.Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103'|'#1076#1072#1090#1072
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'TEL_ORG'
        Footers = <>
        Title.Caption = #1058#1077#1083#1077#1092#1086#1085' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081
        Width = 161
      end
      item
        EditButtons = <>
        FieldName = 'TEL_SMDO'
        Footers = <>
        Title.Caption = #1058#1077#1083#1077#1092#1086#1085' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1057#1052#1044#1054
        Width = 165
      end>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 1048
    Height = 26
    AllowDrag = False
    FixAlign = True
    LimitToOneRow = True
    object TBToolbar: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar'
      FullSize = True
      Images = fmMain.ImageList
      ParentShowHint = False
      ShowHint = True
      Stretch = True
      TabOrder = 0
      object TBItemExport: TTBItem
        Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100
        Hint = #1042#1099#1075#1088#1091#1079#1080#1090#1100
        ImageIndex = 96
        OnClick = TBItemExportClick
      end
      object TBItemAddGraf: TTBItem
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1075#1088#1072#1092#1099
        Hint = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1075#1088#1072#1092#1099
        ImageIndex = 9
        OnClick = TBItemAddGrafClick
      end
      object TBItemFilter: TTBItem
        Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1086#1090#1073#1086#1088' '#1087#1086' '#1085#1077#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1084
        ImageIndex = 106
        ShortCut = 32
        OnClick = TBItemFilterClick
      end
      object TBItemExit: TTBItem
        Caption = #1042#1099#1093#1086#1076
        Hint = #1042#1099#1093#1086#1076
        ImageIndex = 62
        OnClick = TBItemExitClick
      end
    end
  end
  object tbStatus: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'MSG_ID'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'SMDOCODE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'UVD_DISP'
        DataType = ftBoolean
      end
      item
        Name = 'DATE_DISP'
        DataType = ftDateTime
      end
      item
        Name = 'UVD_RECEIVED'
        DataType = ftBoolean
      end
      item
        Name = 'DATE_RECEIVED'
        DataType = ftDateTime
      end
      item
        Name = 'UVD_REGISTER'
        DataType = ftBoolean
      end
      item
        Name = 'DATE_REGISTER'
        DataType = ftDateTime
      end
      item
        Name = 'TEXT_REGISTER'
        DataType = ftString
        Size = 100
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
    Left = 96
    Top = 224
    object tbStatusID: TIntegerField
      FieldName = 'ID'
    end
    object tbStatusMSG_ID: TStringField
      FieldName = 'MSG_ID'
      Size = 40
    end
    object tbStatusSMDOCODE: TStringField
      FieldName = 'SMDOCODE'
      Size = 15
    end
    object tbStatusNAME: TStringField
      FieldName = 'NAME'
      Size = 200
    end
    object tbStatusTEL_SMDO: TStringField
      FieldName = 'TEL_SMDO'
      Size = 30
    end
    object tbStatusTEL_ORG: TStringField
      FieldName = 'TEL_ORG'
      Size = 30
    end
    object tbStatusUVD_DISP: TBooleanField
      FieldName = 'UVD_DISP'
    end
    object tbStatusDATE_DISP: TDateTimeField
      FieldName = 'DATE_DISP'
    end
    object tbStatusUVD_RECEIVED: TBooleanField
      FieldName = 'UVD_RECEIVED'
    end
    object tbStatusDATE_RECEIVED: TDateTimeField
      FieldName = 'DATE_RECEIVED'
    end
    object tbStatusUVD_REGISTER: TBooleanField
      FieldName = 'UVD_REGISTER'
    end
    object tbStatusDATE_REGISTER: TDateTimeField
      FieldName = 'DATE_REGISTER'
    end
    object tbStatusADR_REGNUMBER: TStringField
      FieldName = 'ADR_REGNUMBER'
      Size = 50
    end
    object tbStatusADR_REGDATE: TDateField
      FieldName = 'ADR_REGDATE'
    end
  end
  object DataSource: TDataSource
    DataSet = tbStatus
    Left = 136
    Top = 224
  end
end
