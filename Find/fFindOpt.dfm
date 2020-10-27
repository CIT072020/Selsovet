object fmFindOpt: TfmFindOpt
  Left = 262
  Top = 187
  BorderStyle = bsDialog
  Caption = 'Настройки'
  ClientHeight = 177
  ClientWidth = 398
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
  object laCaption: TLabel
    Left = 37
    Top = 39
    Width = 54
    Height = 13
    Caption = 'Заголовок'
  end
  object btOk: TButton
    Left = 226
    Top = 144
    Width = 75
    Height = 23
    Caption = 'ОК'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object btCancel: TButton
    Left = 314
    Top = 144
    Width = 75
    Height = 23
    Cancel = True
    Caption = 'Отмена'
    ModalResult = 2
    TabOrder = 4
  end
  object edCaption: TEdit
    Left = 104
    Top = 36
    Width = 273
    Height = 21
    TabOrder = 0
  end
  object chbSaveValue: TCheckBox
    Left = 16
    Top = 99
    Width = 313
    Height = 17
    Caption = 'запоминать последнее введённое значение'
    TabOrder = 2
  end
  object chbShowClearButton: TCheckBox
    Left = 16
    Top = 67
    Width = 321
    Height = 17
    Caption = 'показывать кнопку "Очистить"'
    TabOrder = 1
  end
  object chbShowCaption: TCheckBox
    Left = 16
    Top = 14
    Width = 225
    Height = 17
    Caption = 'показывать заголовок'
    TabOrder = 5
    OnClick = chbShowCaptionClick
  end
end
