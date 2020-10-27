object fmDsgnSize: TfmDsgnSize
  Left = 216
  Top = 178
  BorderStyle = bsDialog
  Caption = 'Размер'
  ClientHeight = 162
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btOK: TButton
    Left = 231
    Top = 132
    Width = 75
    Height = 23
    Caption = 'ОК'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btCancel: TButton
    Left = 317
    Top = 132
    Width = 75
    Height = 23
    Cancel = True
    Caption = 'Отмена'
    ModalResult = 2
    TabOrder = 1
  end
  object rgWidth: TRadioGroup
    Left = 7
    Top = 6
    Width = 188
    Height = 116
    Caption = ' Ширина: '
    ItemIndex = 0
    Items.Strings = (
      'Не изменять'
      'Уменьшить до наименьшей'
      'Увеличить до наибольшей'
      'Ширина:')
    TabOrder = 2
    OnClick = rgWidthClick
  end
  object rgHeight: TRadioGroup
    Left = 206
    Top = 6
    Width = 188
    Height = 116
    Caption = ' Высота: '
    ItemIndex = 0
    Items.Strings = (
      'Не изменять'
      'Уменьшить до наименьшей'
      'Увеличить до наибольшей'
      'Высота:')
    TabOrder = 3
    OnClick = rgHeightClick
  end
  object edWidth: TEdit
    Left = 87
    Top = 93
    Width = 65
    Height = 21
    Enabled = False
    TabOrder = 4
    Text = '0'
  end
  object udWidth: TUpDown
    Left = 152
    Top = 93
    Width = 15
    Height = 21
    Associate = edWidth
    Enabled = False
    Min = 0
    Max = 9999
    Position = 0
    TabOrder = 5
    Wrap = False
  end
  object edHeight: TEdit
    Left = 284
    Top = 93
    Width = 65
    Height = 21
    Enabled = False
    TabOrder = 6
    Text = '0'
  end
  object udHeight: TUpDown
    Left = 349
    Top = 93
    Width = 15
    Height = 21
    Associate = edHeight
    Enabled = False
    Min = 0
    Max = 9999
    Position = 0
    TabOrder = 7
    Wrap = False
  end
end
