object fmCheckMens: TfmCheckMens
  Left = 482
  Top = 278
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1077#1090#1077#1081
  ClientHeight = 168
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 127
    Width = 442
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      442
      41)
    object btOk: TBitBtn
      Left = 225
      Top = 8
      Width = 89
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 0
      Kind = bkOK
    end
    object btCancel: TBitBtn
      Left = 334
      Top = 8
      Width = 89
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object ckList: TCheckListBox
    Left = 0
    Top = 0
    Width = 442
    Height = 127
    Align = alClient
    BevelInner = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 19
    Items.Strings = (
      '1111111111'
      '222222222'
      '3333333333'
      '4444444444'
      '555555555'
      '66666666666')
    ParentFont = False
    TabOrder = 1
  end
end
