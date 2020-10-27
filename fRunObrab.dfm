object fmRunObrab: TfmRunObrab
  Left = 403
  Top = 128
  AutoScroll = False
  Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1086#1073#1088#1072#1073#1086#1090#1082#1091
  ClientHeight = 612
  ClientWidth = 655
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pn: TPanel
    Left = 0
    Top = 570
    Width = 655
    Height = 42
    Align = alBottom
    TabOrder = 0
    object btOk: TBitBtn
      Left = 314
      Top = 8
      Width = 94
      Height = 25
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 428
      Top = 8
      Width = 94
      Height = 25
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object pnOpis: TPanel
    Left = 0
    Top = 492
    Width = 655
    Height = 78
    Align = alBottom
    TabOrder = 1
    object edOpis: TMemo
      Left = 1
      Top = 1
      Width = 653
      Height = 76
      Align = alClient
      Color = clBtnFace
      Lines.Strings = (
        '')
      TabOrder = 0
    end
  end
  object lb: TListBox
    Left = 0
    Top = 0
    Width = 655
    Height = 492
    Align = alClient
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 2
    OnClick = lbClick
  end
end
