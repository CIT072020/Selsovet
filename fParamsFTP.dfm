inherited fmParamsFTP: TfmParamsFTP
  Left = 426
  Top = 272
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' FTP'
  ClientHeight = 238
  ClientWidth = 412
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImBtClear: TImage
    Left = 384
    Top = 147
  end
  object Label1: TLabel [1]
    Left = 25
    Top = 48
    Width = 48
    Height = 16
    Caption = #1057#1077#1088#1074#1077#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [2]
    Left = 25
    Top = 104
    Width = 125
    Height = 16
    Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [3]
    Left = 25
    Top = 132
    Width = 50
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [4]
    Left = 25
    Top = 161
    Width = 42
    Height = 16
    Caption = #1055#1072#1087#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel [5]
    Left = 25
    Top = 76
    Width = 33
    Height = 16
    Caption = #1055#1086#1088#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbFTP: TLabel [6]
    Left = 25
    Top = 20
    Width = 21
    Height = 16
    Caption = 'FTP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel1: TPanel
    Top = 194
    Width = 412
    inherited btOk: TBitBtn
      Left = 187
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    end
    inherited btCancel: TBitBtn
      Left = 303
    end
  end
  object cbFTP: TComboBox
    Left = 176
    Top = 16
    Width = 220
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
    OnChange = cbFTPChange
  end
  object edHost: TEdit
    Left = 176
    Top = 44
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object edUserName: TEdit
    Left = 176
    Top = 100
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object edPassword: TEdit
    Left = 176
    Top = 128
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object edDir: TEdit
    Left = 176
    Top = 157
    Width = 220
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object edPort: TEdit
    Left = 176
    Top = 72
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
end
