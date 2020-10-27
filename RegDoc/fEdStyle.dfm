object fmEdStyle: TfmEdStyle
  Left = 216
  Top = 106
  BorderStyle = bsDialog
  Caption = #1057#1090#1080#1083#1080
  ClientHeight = 317
  ClientWidth = 219
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
    Left = 32
    Top = 272
    Width = 75
    Height = 23
    Caption = #1054#1050
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btCancel: TButton
    Left = 128
    Top = 272
    Width = 75
    Height = 23
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object chbStyle: TCheckListBox
    Left = 8
    Top = 8
    Width = 201
    Height = 249
    ItemHeight = 13
    TabOrder = 2
  end
end
