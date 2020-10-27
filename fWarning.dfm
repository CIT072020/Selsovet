object fmWarning: TfmWarning
  Left = 425
  Top = 230
  BorderStyle = bsDialog
  Caption = #1055#1088#1077#1076#1091#1087#1088#1077#1078#1076#1077#1085#1080#1077
  ClientHeight = 221
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  DesignSize = (
    461
    221)
  PixelsPerInch = 96
  TextHeight = 13
  object lbText: TLabel
    Left = 13
    Top = 10
    Width = 439
    Height = 136
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    Caption = 
      #1042#1053#1048#1052#1040#1053#1048#1045'!'#13#10#1055#1086#1089#1083#1077' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1079#1072#1075#1088#1091#1079#1082#1080', '#1090#1077#1082#1091#1097#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#13#10#1087#1086' '#1083#1080 +
      #1094#1077#1074#1099#1084' '#1089#1095#1077#1090#1072#1084' '#1080' '#1085#1072#1089#1077#1083#1077#1085#1080#1102' '#1073#1091#1076#1077#1090' '#1091#1085#1080#1095#1090#1086#1078#1077#1085#1072'.'#13#10#1045#1089#1083#1080' '#1042#1099' '#1091#1074#1077#1088#1077#1085#1099' '#1074' '#1085#1077 +
      #1086#1073#1093#1086#1076#1080#1084#1086#1089#1090#1080' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1086#1087#1077#1088#1072#1094#1080#1080#13#10#1074#1074#1077#1076#1080#1090#1077' '#1089#1083#1086#1074#1086' '#1044#1040' '#1074' '#1087#1086#1083#1077' '#1074#1074#1086#1076#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object pn: TPanel
    Left = 0
    Top = 156
    Width = 461
    Height = 65
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      461
      65)
    object lbYes: TLabel
      Left = 112
      Top = 2
      Width = 169
      Height = 16
      Caption = '( '#1042#1074#1077#1076#1080#1090#1077' '#1044#1040' '#1074' '#1087#1086#1083#1077' '#1074#1074#1086#1076#1072' )'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object edYes: TDBEditEh
      Left = 18
      Top = 1
      Width = 82
      Height = 24
      CharCase = ecUpperCase
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
    end
    object btOk: TBitBtn
      Left = 226
      Top = 32
      Width = 95
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      TabOrder = 1
      Kind = bkOK
    end
    object btCancel: TBitBtn
      Left = 343
      Top = 32
      Width = 95
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 2
      Kind = bkCancel
    end
  end
  object edMemo: TMemo
    Left = 352
    Top = 99
    Width = 92
    Height = 28
    Lines.Strings = (
      '')
    ScrollBars = ssBoth
    TabOrder = 0
    Visible = False
  end
end
