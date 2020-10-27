object fmSprRec: TfmSprRec
  Left = 493
  Top = 249
  BorderStyle = bsDialog
  Caption = 'fmSprRec'
  ClientHeight = 227
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  DesignSize = (
    683
    227)
  PixelsPerInch = 96
  TextHeight = 16
  object bv01: TBevel
    Left = 10
    Top = 190
    Width = 663
    Height = 6
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object btOk: TBitBtn
    Left = 496
    Top = 198
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 0
  end
  object btCancel: TBitBtn
    Left = 589
    Top = 198
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
end
