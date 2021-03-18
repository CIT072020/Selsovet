object fmDeleteSvid: TfmDeleteSvid
  Left = 296
  Top = 248
  BorderStyle = bsDialog
  Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074
  ClientHeight = 219
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbDate: TLabel
    Left = 16
    Top = 86
    Width = 92
    Height = 16
    Caption = #1044#1072#1090#1072' '#1087#1088#1080#1093#1086#1076#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Lb: TLabel
    Left = 17
    Top = 114
    Width = 377
    Height = 97
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object lbType: TLabel
    Left = 16
    Top = 52
    Width = 22
    Height = 16
    Caption = #1058#1080#1087
    FocusControl = edTypeSvid
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 405
    Height = 41
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      CloseButton = False
      DockMode = dmCannotFloat
      DragHandleStyle = dhNone
      FullSize = True
      Images = fmMain.ImageList
      Options = [tboImageAboveCaption]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object TBItem1: TTBItem
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
        Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1086#1087#1077#1088#1072#1094#1080#1102
        ImageIndex = 7
        OnClick = TBItem1Click
      end
      object TBItem2: TTBItem
        Caption = #1042#1099#1093#1086#1076
        Hint = #1042#1099#1093#1086#1076
        ImageIndex = 62
        OnClick = TBItem2Click
      end
    end
  end
  object edDatePrix: TDBLookupComboboxEh
    Left = 136
    Top = 82
    Width = 127
    Height = 26
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'DATEP'
    ListField = 'DATEP'
    ListSource = DataSource1
    ParentFont = False
    TabOrder = 1
    Visible = True
  end
  object edTypeSvid: TDBComboBoxEh
    Left = 136
    Top = 48
    Width = 207
    Height = 26
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'edTypeSvid'
    Visible = True
    OnChange = edTypeSvidChange
  end
  object AdsQuery1: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    SQL.Strings = (
      'SELECT distinct DATEP FROM ListSvid ')
    AdsConnection = dmBase.AdsConnection
    Left = 288
    Top = 134
    ParamData = <>
  end
  object DataSource1: TDataSource
    DataSet = AdsQuery1
    Left = 320
    Top = 134
  end
  object AdsQuery2: TAdsQuery
    AdsConnection = dmBase.AdsConnection
    Left = 344
    Top = 56
    ParamData = <>
  end
end
