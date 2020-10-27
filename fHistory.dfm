object fmHistory: TfmHistory
  Left = 577
  Top = 205
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077
  ClientHeight = 269
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001000400280100001600000028000000100000002000
    0000010004000000000080000000000000000000000000000000000000000000
    0000800000000080000080800000000080008000800000808000C0C0C0008080
    8000FF00000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF000000
    000000000000000000000000000000110000001000000111448881110000111C
    C4000111110000000000011111100008FFFFF01111110008F888FF0111110008
    FFFFFFF011110000000000FF011100000888888FF011000000000000FF010000
    000888888FF0000000000000008000000000088888800000000000000000FFFF
    0000C00F0000CFC70000800300000381000080000000E0000000E0000000E000
    0000F0000000F8040000FC020000FE010000FF010000FF810000FFFF0000}
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object cb: TCheckListBox
    Left = 7
    Top = 4
    Width = 285
    Height = 189
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
  end
  object btOk: TButton
    Left = 122
    Top = 233
    Width = 75
    Height = 23
    Caption = #1054#1050
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btCancel: TButton
    Left = 213
    Top = 233
    Width = 75
    Height = 23
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
  object cbClear: TCheckBox
    Left = 11
    Top = 200
    Width = 273
    Height = 17
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1077' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1088#1077#1082#1074#1080#1079#1080#1090#1086#1074
    TabOrder = 3
  end
  object PopupMenu1: TPopupMenu
    Left = 64
    Top = 64
    object N1: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1077
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
      OnClick = N2Click
    end
  end
end
