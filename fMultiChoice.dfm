object fmMultiChoice: TfmMultiChoice
  Left = 577
  Top = 197
  AutoScroll = False
  BorderIcons = []
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1103
  ClientHeight = 462
  ClientWidth = 330
  Color = clBtnFace
  Constraints.MaxHeight = 900
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 250
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object cbChoice: TCheckListBox
    Left = 0
    Top = 0
    Width = 330
    Height = 401
    OnClickCheck = cbChoiceClickCheck
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
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
  object Panel1: TPanel
    Left = 0
    Top = 421
    Width = 330
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      330
      41)
    object lbCount: TLabel
      Left = 11
      Top = 12
      Width = 17
      Height = 16
      Caption = '[0]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btOk: TBitBtn
      Left = 105
      Top = 8
      Width = 96
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 0
      Kind = bkOK
    end
    object btCancel: TBitBtn
      Left = 218
      Top = 8
      Width = 96
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 401
    Width = 330
    Height = 20
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    object cbNot: TDBCheckBoxEh
      Left = 7
      Top = 3
      Width = 241
      Height = 17
      Caption = #1042#1089#1077' '#1082#1088#1086#1084#1077' '#1074#1099#1073#1088#1072#1085#1085#1099#1093
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 112
    Top = 64
    object N1: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1099#1073#1086#1088
      OnClick = N2Click
    end
  end
end
