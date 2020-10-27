inherited fmChLoadClassif: TfmChLoadClassif
  Left = 582
  Top = 255
  Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1082#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086#1088
  ClientHeight = 159
  ClientWidth = 393
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 115
    Width = 393
    inherited btOk: TBitBtn
      Left = 184
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    end
    inherited btCancel: TBitBtn
      Left = 288
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 115
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      393
      115)
    object edSpr: TComboBox
      Left = 22
      Top = 20
      Width = 349
      Height = 24
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      OnChange = edSprChange
    end
    object cbOnlyChange: TCheckBox
      Left = 24
      Top = 63
      Width = 345
      Height = 17
      Caption = #1090#1086#1083#1100#1082#1086' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object DataSource: TDataSource
    Left = 16
    Top = 120
  end
end
