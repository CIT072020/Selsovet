object fmGrpDK: TfmGrpDK
  Left = 281
  Top = 237
  BorderStyle = bsDialog
  Caption = 'Выбор части даты'
  ClientHeight = 167
  ClientWidth = 277
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btOk: TButton
    Left = 107
    Top = 140
    Width = 75
    Height = 23
    Caption = 'ОК'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btCancel: TButton
    Left = 195
    Top = 140
    Width = 75
    Height = 23
    Cancel = True
    Caption = 'Отмена'
    ModalResult = 2
    TabOrder = 1
  end
  object rbFull: TRadioButton
    Left = 41
    Top = 24
    Width = 113
    Height = 17
    Caption = 'полная дата'
    TabOrder = 2
  end
  object rbYear: TRadioButton
    Left = 41
    Top = 48
    Width = 113
    Height = 17
    Caption = 'только год'
    TabOrder = 3
  end
  object rbMonth: TRadioButton
    Left = 41
    Top = 72
    Width = 113
    Height = 17
    Caption = 'только месяц'
    TabOrder = 4
  end
  object rbDayOfMonth: TRadioButton
    Left = 41
    Top = 96
    Width = 113
    Height = 17
    Caption = 'только день'
    TabOrder = 5
  end
end
