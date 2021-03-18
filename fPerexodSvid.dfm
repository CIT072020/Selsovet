object fmPerexodSvid: TfmPerexodSvid
  Left = 430
  Top = 214
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1085#1086#1074#1099#1081' '#1075#1086#1076
  ClientHeight = 193
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
    Top = 51
    Width = 81
    Height = 16
    Caption = #1053#1072' 1 '#1103#1085#1074#1072#1088#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Lb: TLabel
    Left = 13
    Top = 84
    Width = 377
    Height = 95
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
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
  object edYear: TDBNumberEditEh
    Left = 136
    Top = 46
    Width = 92
    Height = 26
    DecimalPlaces = 0
    DisplayFormat = '9999'
    EditButton.Style = ebsUpDownEh
    EditButton.Visible = True
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxValue = 2000.000000000000000000
    MinValue = 2008.000000000000000000
    ParentFont = False
    TabOrder = 1
    Visible = True
  end
  object DataSource1: TDataSource
    Left = 320
    Top = 96
  end
  object AdsQuery2: TAdsQuery
    AdsConnection = dmBase.AdsConnection
    Left = 352
    Top = 74
    ParamData = <>
  end
end
