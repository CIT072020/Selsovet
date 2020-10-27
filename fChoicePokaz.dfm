object fmChoicePokaz: TfmChoicePokaz
  Left = 442
  Top = 163
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = 'Выберите показатели'
  ClientHeight = 367
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF001100
    0011000000001111001B11000000111111BB6B1100001111116B6BBB11001111
    1BB886BBBB10111118000B66BB101111BB80E0BB661011116B80FE0BB100111B
    B6330FE0B1001116B6BBB0FE000011BB666BBB0FE00011BB6BB66BB0FE000011
    BBBBB6610000000011BBBB10000000000011BB10000000000000110000003CFF
    00000C3F0000000F000000030000000100000001000000010000000300000003
    0000000700000003000000010000C0000000F0190000FC1F0000FF3F0000}
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cb: TCheckListBox
    Left = 7
    Top = 4
    Width = 285
    Height = 321
    ItemHeight = 13
    PopupMenu = PopupMenu1
    TabOrder = 0
  end
  object btOk: TButton
    Left = 122
    Top = 335
    Width = 75
    Height = 23
    Caption = 'ОК'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btCancel: TButton
    Left = 213
    Top = 335
    Width = 75
    Height = 23
    Cancel = True
    Caption = 'Отмена'
    ModalResult = 2
    TabOrder = 2
  end
  object PopupMenu1: TPopupMenu
    Left = 64
    Top = 64
    object N1: TMenuItem
      Caption = 'Очистить все'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = 'Отметить все'
      OnClick = N2Click
    end
  end
end
