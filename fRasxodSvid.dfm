object fmRasxodSvid: TfmRasxodSvid
  Left = 371
  Top = 266
  BorderStyle = bsDialog
  Caption = #1042#1099#1076#1072#1095#1072' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074' '#1074' '#1089#1077#1083#1100#1080#1089#1087#1086#1083#1082#1086#1084
  ClientHeight = 241
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbDate: TLabel
    Left = 13
    Top = 54
    Width = 88
    Height = 16
    Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
    FocusControl = edDate
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbSeria: TLabel
    Left = 13
    Top = 125
    Width = 39
    Height = 16
    Caption = #1057#1077#1088#1080#1103
    FocusControl = edSeria
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbNomer1: TLabel
    Left = 13
    Top = 160
    Width = 54
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1089
    FocusControl = edNomer1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbNomer2: TLabel
    Left = 13
    Top = 195
    Width = 63
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1087#1086
    FocusControl = edNomer2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbType: TLabel
    Left = 13
    Top = 89
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
    Width = 366
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
  object edDate: TDBDateTimeEditEh
    Left = 135
    Top = 50
    Width = 121
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 1
    Visible = True
  end
  object edTypeSvid: TDBComboBoxEh
    Left = 135
    Top = 85
    Width = 121
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'edTypeSvid'
    Visible = True
  end
  object edSeria: TDBLookupComboboxEh
    Left = 135
    Top = 121
    Width = 74
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'SERIA'
    ListField = 'SERIA'
    ListSource = dsSeria
    ParentFont = False
    TabOrder = 3
    Visible = True
  end
  object edNomer1: TDBEditEh
    Left = 135
    Top = 156
    Width = 121
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 7
    ParentFont = False
    TabOrder = 4
    Text = '       '
    Visible = True
    OnUpdateData = edNomer1UpdateData
    EditMask = '9999999;1;_'
  end
  object edNomer2: TDBEditEh
    Left = 135
    Top = 191
    Width = 121
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 7
    ParentFont = False
    TabOrder = 5
    Visible = True
    OnUpdateData = edNomer2UpdateData
    EditMask = '9999999;0;_'
  end
  object dsSeria: TDataSource
    Left = 271
    Top = 116
  end
end
