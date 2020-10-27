inherited fmLicSchetDok: TfmLicSchetDok
  Left = 395
  Top = 203
  ActiveControl = edData
  Caption = #1044#1086#1082#1091#1084#1077#1085#1090
  ClientHeight = 190
  ClientWidth = 479
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 16
    Top = 20
    Width = 87
    Height = 16
    Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 16
    Top = 52
    Width = 29
    Height = 16
    Caption = #1044#1072#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 16
    Top = 84
    Width = 37
    Height = 16
    Caption = #1053#1086#1084#1077#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel [3]
    Left = 16
    Top = 116
    Width = 78
    Height = 16
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited Panel1: TPanel
    Top = 146
    Width = 479
    TabOrder = 4
    inherited btOk: TBitBtn
      Left = 261
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    end
    inherited btCancel: TBitBtn
      Left = 370
    end
  end
  object edTypeDok: TDBComboBoxEh
    Left = 128
    Top = 16
    Width = 337
    Height = 24
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edTypeDokEditButtons0Click
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
  object edData: TDBDateTimeEditEh
    Left = 128
    Top = 48
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
  object edNomer: TDBEditEh
    Left = 128
    Top = 80
    Width = 88
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
  object edKomm: TDBEditEh
    Left = 128
    Top = 112
    Width = 337
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
end
