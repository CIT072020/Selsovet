object fmExportStru: TfmExportStru
  Left = 340
  Top = 169
  Width = 570
  Height = 341
  Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1089#1090#1088#1091#1082#1090#1091#1088#1091' '#1073#1072#1079#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 262
    Width = 554
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btPrint: TBitBtn
      Left = 322
      Top = 9
      Width = 75
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 0
      OnClick = btPrintClick
    end
    object btExit: TBitBtn
      Left = 415
      Top = 9
      Width = 75
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      ModalResult = 2
      TabOrder = 1
    end
  end
  object edStru: TMemo
    Left = 0
    Top = 0
    Width = 554
    Height = 262
    Align = alClient
    Lines.Strings = (
      '')
    TabOrder = 1
  end
  object Query: TAdsQuery
    Left = 56
    Top = 64
    ParamData = <>
  end
  object Query1: TAdsQuery
    Left = 56
    Top = 104
    ParamData = <>
  end
end
