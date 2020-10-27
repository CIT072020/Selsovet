inherited fmClearZakl: TfmClearZakl
  Left = 454
  Top = 105
  Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1072#1082#1083#1072#1076#1082#1091' "'#1055#1086#1082#1072#1079#1072#1090#1077#1083#1080' ('#1056#1072#1079#1076#1077#1083' III)"'
  ClientHeight = 578
  ClientWidth = 519
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 534
    Width = 519
    inherited btOk: TBitBtn
      Left = 308
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    end
    inherited btCancel: TBitBtn
      Left = 412
    end
  end
  object clProp: TCheckListBox
    Left = 0
    Top = 0
    Width = 519
    Height = 534
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    Items.Strings = (
      '1111111111'
      '22222222'
      '333333333333')
    ParentFont = False
    TabOrder = 1
  end
end
