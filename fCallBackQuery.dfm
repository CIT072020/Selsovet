object fmCallBackQuery: TfmCallBackQuery
  Left = 330
  Top = 241
  Cursor = crArrow
  BorderStyle = bsDialog
  Caption = 'Установка отбора'
  ClientHeight = 86
  ClientWidth = 267
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 182
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Отменить'
    TabOrder = 0
    OnClick = Button1Click
  end
  object pb: TProgressBar
    Left = 8
    Top = 16
    Width = 249
    Height = 17
    Min = 0
    Max = 100
    Position = 50
    Smooth = True
    TabOrder = 1
  end
end
