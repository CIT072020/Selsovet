object fmSpAdm: TfmSpAdm
  Left = 87
  Top = 203
  BorderStyle = bsDialog
  Caption = 'fmSpAdm'
  ClientHeight = 230
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    683
    230)
  PixelsPerInch = 96
  TextHeight = 13
  object laSignType: TLabel
    Left = 10
    Top = 114
    Width = 125
    Height = 13
    Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1088#1080' '#1074#1099#1073#1086#1088#1077
  end
  object laNeedReq: TLabel
    Left = 10
    Top = 138
    Width = 37
    Height = 13
    Caption = #1047#1072#1087#1088#1086#1089
  end
  object laProcRes: TLabel
    Left = 10
    Top = 162
    Width = 52
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
  end
  object laProcNo: TLabel
    Left = 10
    Top = 10
    Width = 92
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1087#1088#1086#1094#1077#1076#1091#1088#1099
  end
  object laName: TLabel
    Left = 10
    Top = 34
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object bv01: TBevel
    Left = 10
    Top = 188
    Width = 663
    Height = 6
    Shape = bsTopLine
  end
  object dcIsSelect: TDBComboBoxEh
    Left = 155
    Top = 110
    Width = 62
    Height = 21
    DataField = 'IS_SELECT'
    EditButtons = <>
    TabOrder = 2
    Visible = True
  end
  object btOk: TButton
    Left = 509
    Top = 198
    Width = 75
    Height = 23
    Anchors = [akTop, akRight]
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 5
  end
  object btCancel: TButton
    Left = 597
    Top = 198
    Width = 75
    Height = 23
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 6
  end
  object deName: TDBEditEh
    Left = 155
    Top = 30
    Width = 518
    Height = 77
    AutoSize = False
    DataField = 'FULL_NAME'
    EditButtons = <>
    TabOrder = 1
    Visible = True
    WantReturns = True
    WordWrap = True
  end
  object dcNeedReq: TDBComboBoxEh
    Left = 155
    Top = 134
    Width = 62
    Height = 21
    DataField = 'NEED_REQ'
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
  object dcProcRes: TDBComboBoxEh
    Left = 155
    Top = 158
    Width = 126
    Height = 21
    DataField = 'PROC_RES'
    EditButtons = <>
    TabOrder = 4
    Visible = True
  end
  object deProcNo: TDBEditEh
    Left = 155
    Top = 6
    Width = 86
    Height = 21
    DataField = 'PROC_NO'
    EditButtons = <>
    TabOrder = 0
    Visible = True
  end
end
