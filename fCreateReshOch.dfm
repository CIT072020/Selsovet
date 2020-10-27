inherited fmCreateReshOch: TfmCreateReshOch
  Left = 496
  Top = 261
  Caption = #1057#1086#1079#1076#1072#1090#1100' '#1088#1077#1096#1077#1085#1080#1077
  ClientHeight = 208
  ClientWidth = 464
  Icon.Data = {
    0000010001001010000001001800680300001600000028000000100000002000
    0000010018000000000000030000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000084848484848400000084848484848484848484
    8484848484848484008484000000000000000000000000000000000000000000
    008484FFFFFF008484FFFFFF008484FFFFFF008484FFFFFF8484840000000000
    00000000000000008484FFFFFF000000FFFFFF840000840000840000FFFFFF00
    0084FFFFFF000084848484000000000000000000FFFFFF008484008484000000
    00FFFFFF0000FF000084000000FFFFFFFFFF00FFFFFFFFFF8484840000000000
    00FFFFFF008484FFFFFF008484000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00
    FFFFFFFFFFFFFFFF848484000000000000FFFFFFFFFFFF008484008484000000
    00FFFF84000084000084000000FFFF00008400FFFF0000848484840000000000
    00FFFFFF008484008484008484000000FFFFFFFF0000FF0000840000FFFFFF00
    FFFFFFFFFF00FFFF848484000000000000FFFFFFFFFFFF008484008484000000
    00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF8484840000000000
    00FFFFFF008484008484008484000000FFFFFF840000840000840000FFFFFF00
    0084FFFFFF000084848484000000000000FFFFFFFFFFFF008484008484000000
    00FFFFFF0000FF000084000000FFFFFFFFFF00FFFFFFFFFF8484840000000000
    00FFFFFF00848400848400848400000000000000000000000000000000000000
    0000000000000000000000000000000000FFFFFF008484848484000000848484
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000084848400000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    0000F0000000E8000000E0000000C00000000000000000000000000000000000
    00000000000000000000000000000000000003FF00000FFF0000FFFF0000}
  Position = poOwnerFormCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImBtClear: TImage
    Left = 440
    Top = 35
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 44
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
  object Label2: TLabel [2]
    Left = 224
    Top = 44
    Width = 33
    Height = 16
    Caption = #1044#1072#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbType: TLabel [3]
    Left = 8
    Top = 11
    Width = 89
    Height = 16
    Caption = #1058#1080#1087' '#1088#1077#1096#1077#1085#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edNewDate: TDBDateTimeEditEh [4]
    Left = 208
    Top = 106
    Width = 121
    Height = 26
    Enabled = False
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 3
    Visible = True
  end
  object edDate: TDBDateTimeEditEh [5]
    Left = 271
    Top = 39
    Width = 121
    Height = 26
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 1
    Visible = True
  end
  object edNomer: TDBEditEh [6]
    Left = 67
    Top = 39
    Width = 121
    Height = 26
    EditButtons = <
      item
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1088#1077#1096#1077#1085#1080#1077
        Style = ebsEllipsisEh
        OnClick = edNomerEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = True
  end
  object edNewNomer: TDBEditEh [7]
    Left = 208
    Top = 72
    Width = 121
    Height = 26
    EditButtons = <>
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = True
  end
  object cbIzmNomer: TCheckBox [8]
    Left = 8
    Top = 77
    Width = 185
    Height = 17
    Hint = #1055#1088#1080' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1080' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1085#1086#1084#1077#1088
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1086#1084#1077#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = cbIzmNomerClick
  end
  object cbIzmDate: TCheckBox [9]
    Left = 8
    Top = 110
    Width = 185
    Height = 17
    Hint = #1055#1088#1080' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1080' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1090#1091
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = cbIzmDateClick
  end
  object cbPlan: TCheckBox [10]
    Left = 8
    Top = 139
    Width = 361
    Height = 17
    Hint = #1055#1088#1080' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1080' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1090#1091
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1088#1086#1077#1082#1090' '#1085#1072' '#1088#1077#1096#1077#1085#1080#1077
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 7
    OnClick = cbIzmDateClick
  end
  inherited Panel1: TPanel
    Top = 164
    Width = 464
    TabOrder = 6
    inherited btOk: TBitBtn
      Left = 239
    end
    inherited btCancel: TBitBtn
      Left = 355
    end
  end
  object edType: TDBComboBoxEh
    Left = 113
    Top = 6
    Width = 226
    Height = 26
    DropDownBox.Rows = 15
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    Text = 'edType'
    Visible = True
  end
  object QueryChoiceResh: TAdsQuery
    StoreActive = False
    SQL.Strings = (
      'select distinct nomer,dater')
    AdsConnection = dmBase.AdsConnection
    Left = 408
    Top = 80
    ParamData = <>
  end
  object Query: TAdsQuery
    StoreActive = False
    AdsConnection = dmBase.AdsConnection
    Left = 360
    Top = 80
    ParamData = <>
  end
end
