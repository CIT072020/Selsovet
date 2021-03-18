inherited fmChVigrDelo: TfmChVigrDelo
  Left = 514
  Top = 311
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1074#1099#1075#1088#1091#1079#1082#1080
  ClientHeight = 215
  ClientWidth = 556
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF001100
    0011000000001111001B11000000111111BB6B1100001111116B6BBB11001111
    1BB886BBBB10111118000B66BB101111BB80E0BB661011116B80FE0BB100111B
    B6330FE0B1001116B6BBB0FE000011BB666BBB0FE00011BB6BB66BB0FE000011
    BBBBB6610000000011BBBB10000000000011BB10000000000000110000003CFF
    00000C3F0000000F000000030000000100000001000000010000000300000003
    0000000700000003000000010000C0000000F0190000FC1F0000FF3F0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 15
    Top = 19
    Width = 117
    Height = 16
    Caption = #1055#1072#1087#1082#1072' '#1076#1083#1103' '#1074#1099#1075#1088#1091#1079#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 15
    Top = 51
    Width = 83
    Height = 16
    Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited ImBtClear: TImage
    Left = 8
    Top = 11
  end
  inherited Panel1: TPanel
    Top = 171
    Width = 556
    TabOrder = 5
    inherited btOk: TBitBtn
      Left = 330
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    end
    inherited btCancel: TBitBtn
      Left = 443
    end
  end
  object edDir: TDBEditEh
    Left = 152
    Top = 15
    Width = 374
    Height = 24
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edDirEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = True
  end
  object gbDate: TGroupBox
    Left = 15
    Top = 96
    Width = 510
    Height = 51
    TabOrder = 3
    object lbDate2: TLabel
      Left = 265
      Top = 19
      Width = 87
      Height = 16
      Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbDate1: TLabel
      Left = 7
      Top = 19
      Width = 95
      Height = 16
      Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edDate2: TDBDateTimeEditEh
      Left = 370
      Top = 15
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
    object edDate1: TDBDateTimeEditEh
      Left = 120
      Top = 15
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
      TabOrder = 0
      Visible = True
    end
  end
  object cbDateDelo: TCheckBox
    Left = 15
    Top = 75
    Width = 362
    Height = 17
    Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1076#1072#1090#1091' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1056#1050#1050' '#1074' '#1076#1077#1083#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = cbDateDeloClick
  end
  object edDelo: TDBEditEh
    Left = 152
    Top = 45
    Width = 374
    Height = 24
    Color = clInfoBk
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edDeloEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Visible = True
    OnDblClick = edDeloDblClick
    OnKeyDown = edDeloKeyDown
  end
  object cbOpenFolder: TCheckBox
    Left = 15
    Top = 151
    Width = 362
    Height = 17
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1087#1072#1087#1082#1091' '#1087#1086#1089#1083#1077' '#1074#1099#1075#1088#1091#1079#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object dsSprTypeHouse: TDataSource
    DataSet = dmBase.SprTypeHouse
    Left = 116
    Top = 40
  end
end
