object fmIzbUch: TfmIzbUch
  Left = 400
  Top = 208
  BorderStyle = bsDialog
  Caption = #1048#1079#1073#1080#1088#1072#1090#1077#1083#1100#1085#1099#1081' '#1091#1095#1072#1089#1090#1086#1082
  ClientHeight = 479
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    431
    479)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 43
    Width = 86
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1091#1095#1072#1089#1090#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 12
    Top = 126
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
  object Label3: TLabel
    Left = 12
    Top = 152
    Width = 76
    Height = 32
    Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1077' '#13#10#1087#1091#1085#1082#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 12
    Top = 72
    Width = 79
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1086#1082#1088#1091#1075#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 274
    Top = 72
    Width = 59
    Height = 16
    Caption = #1075#1086#1088#1086#1076#1089#1082#1086#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 118
    Top = 101
    Width = 51
    Height = 16
    Caption = #1088#1072#1081#1086#1085#1099#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 118
    Top = 72
    Width = 53
    Height = 16
    Caption = #1089#1077#1083#1100#1089#1082#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 274
    Top = 101
    Width = 61
    Height = 16
    Caption = #1086#1073#1083#1072#1089#1090#1085#1086#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edNomer: TDBNumberEditEh
    Left = 118
    Top = 39
    Width = 75
    Height = 24
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
  object edName: TDBEditEh
    Left = 118
    Top = 126
    Width = 305
    Height = 24
    Anchors = [akLeft, akTop, akRight]
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
  object cbPunkts: TCheckListBox
    Left = 118
    Top = 160
    Width = 306
    Height = 315
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 6
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 431
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      CloseButton = False
      DragHandleStyle = dhNone
      FullSize = True
      Images = fmMain.ImageList
      MenuBar = True
      ProcessShortCuts = True
      ShrinkMode = tbsmWrap
      TabOrder = 0
      object TBItem2: TTBItem
        Caption = #1047#1072#1087#1080#1089#1072#1090#1100
        DisplayMode = nbdmImageAndText
        ImageIndex = 36
        OnClick = BitBtn1Click
      end
      object TBItem3: TTBItem
        Caption = #1054#1090#1082#1072#1079
        DisplayMode = nbdmImageAndText
        ImageIndex = 37
        OnClick = TBItem3Click
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBItem1: TTBItem
        Caption = #1059#1083#1080#1094#1099
        DisplayMode = nbdmImageAndText
        ImageIndex = 0
        OnClick = Button1Click
      end
    end
  end
  object edOkrRN: TDBNumberEditEh
    Left = 185
    Top = 97
    Width = 59
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
  object edOkrGOR: TDBNumberEditEh
    Left = 351
    Top = 68
    Width = 59
    Height = 24
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
  object edOkrSS: TDBNumberEditEh
    Left = 185
    Top = 68
    Width = 59
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = True
  end
  object edOkrOBL: TDBNumberEditEh
    Left = 351
    Top = 97
    Width = 59
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
  object cbActive: TCheckBox
    Left = 320
    Top = 42
    Width = 97
    Height = 17
    TabStop = False
    Caption = #1040#1082#1090#1080#1074#1085#1099#1081
    TabOrder = 8
  end
  object Query: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    AdsConnection = dmBase.AdsConnection
    Left = 24
    Top = 288
    ParamData = <>
  end
  object tbDom: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexFieldNames = 'PUNKT;UL'
    IndexDefs = <
      item
        Name = 'tbDomIndex'
        Fields = 'PUNKT;UL'
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
    Left = 16
    Top = 206
    object tbDomPUNKT: TIntegerField
      FieldName = 'PUNKT'
    end
    object tbDomUL: TIntegerField
      FieldName = 'UL'
    end
    object tbDomDOM: TStringField
      FieldName = 'DOM'
      Size = 2000
    end
  end
  object QueryD: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    AdsConnection = dmBase.AdsConnection
    Left = 24
    Top = 320
    ParamData = <>
  end
  object Query_not_ul: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    AdsConnection = dmBase.AdsConnection
    Left = 64
    Top = 288
    ParamData = <>
  end
end
