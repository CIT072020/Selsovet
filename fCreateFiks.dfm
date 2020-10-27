object fmCreateFiks: TfmCreateFiks
  Left = 245
  Top = 181
  BorderStyle = bsDialog
  Caption = 'Создать состояние базы'
  ClientHeight = 132
  ClientWidth = 302
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
  object Label1: TLabel
    Left = 13
    Top = 35
    Width = 148
    Height = 16
    Caption = 'Состояние на 1 января'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 254
    Top = 35
    Width = 30
    Height = 16
    Caption = 'года'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edYear: TDBNumberEditEh
    Left = 169
    Top = 33
    Width = 81
    Height = 21
    DecimalPlaces = 0
    EditButton.Hint = 'Изменить значение года'
    EditButton.Style = ebsUpDownEh
    EditButton.Visible = True
    EditButtons = <>
    MaxValue = 3000
    MinValue = 2000
    TabOrder = 0
    Visible = True
  end
  object btOk: TBitBtn
    Left = 81
    Top = 88
    Width = 90
    Height = 25
    Caption = 'Выполнить'
    TabOrder = 1
    Kind = bkOK
  end
  object btCancel: TBitBtn
    Left = 185
    Top = 88
    Width = 90
    Height = 25
    Caption = 'Отказ'
    TabOrder = 2
    Kind = bkCancel
  end
  object ckCurSost: TDBCheckBoxEh
    Left = 9
    Top = 5
    Width = 202
    Height = 17
    Caption = 'Восстановить текущее состояние'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
end
