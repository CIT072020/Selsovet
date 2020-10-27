inherited fmSeekSobstv: TfmSeekSobstv
  Left = 484
  Top = 233
  ActiveControl = edSeek
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1080#1089#1082#1072
  ClientHeight = 153
  ClientWidth = 331
  OldCreateOrder = True
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 16
    Top = 47
    Width = 69
    Height = 16
    Caption = #1050#1086#1075#1086' '#1080#1089#1082#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 16
    Top = 17
    Width = 53
    Height = 16
    Caption = #1060#1072#1084#1080#1083#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 16
    Top = 76
    Width = 64
    Height = 16
    Caption = #1043#1076#1077' '#1080#1089#1082#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited ImBtClear: TImage
    Left = 88
    Top = 35
  end
  inherited Panel1: TPanel
    Top = 109
    Width = 331
    inherited btOk: TBitBtn
      Left = 113
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
      Default = True
      ModalResult = 1
    end
    inherited btCancel: TBitBtn
      Left = 221
    end
  end
  object edSeek: TDBEditEh
    Left = 117
    Top = 13
    Width = 196
    Height = 21
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
  object edSeek2: TComboBox
    Left = 117
    Top = 72
    Width = 196
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = #1090#1077#1082#1091#1097#1080#1077' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1080
    Items.Strings = (
      #1090#1077#1082#1091#1097#1080#1077' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1080
      #1080#1089#1090#1086#1088#1080#1103' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1086#1074
      #1074#1089#1077)
  end
  object edSeek1: TComboBox
    Left = 117
    Top = 43
    Width = 196
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 3
    Text = #1092#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
    OnChange = edSeek1Change
    Items.Strings = (
      #1092#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
      #1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103)
  end
end
