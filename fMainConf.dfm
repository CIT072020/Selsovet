object fmMainConf: TfmMainConf
  Left = 459
  Top = 219
  Width = 545
  Height = 410
  BorderIcons = [biSystemMenu, biMinimize]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnMain: TPanel
    Left = 0
    Top = 331
    Width = 529
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btOk: TButton
      Left = 347
      Top = 9
      Width = 75
      Height = 25
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      TabOrder = 0
      Visible = False
      OnClick = acRunUpdateExecute
    end
    object btCancel: TButton
      Left = 435
      Top = 9
      Width = 75
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 1
      OnClick = btCancelClick
    end
  end
  object Readme: TMemo
    Left = 168
    Top = 0
    Width = 353
    Height = 314
    TabOrder = 1
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 40
    Top = 56
  end
end
