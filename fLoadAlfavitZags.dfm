inherited fmLoadAlfavitZags: TfmLoadAlfavitZags
  Left = 507
  Top = 249
  Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1079#1072#1087#1080#1089#1080' '#1072#1082#1090#1086#1074' '#1074' '#1072#1083#1092#1072#1074#1080#1090#1085#1091#1102' '#1082#1085#1080#1075#1091
  ClientHeight = 294
  ClientWidth = 441
  OldCreateOrder = True
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 250
    Width = 441
    inherited btOk: TBitBtn
      Left = 226
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    end
    inherited btCancel: TBitBtn
      Left = 335
    end
  end
  object gbType: TGroupBox
    Left = 6
    Top = 0
    Width = 183
    Height = 225
    Caption = ' '#1058#1080#1087#1099' '#1072#1082#1090#1086#1074#1099#1093' '#1079#1072#1087#1080#1089#1077#1081' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      183
      225)
    object lbType: TCheckListBox
      Left = 6
      Top = 47
      Width = 169
      Height = 170
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 16
      Items.Strings = (
        #1073#1088#1072#1082
        #1088#1086#1078#1076#1077#1085#1080#1077
        #1089#1084#1077#1088#1090#1100
        #1091#1089#1090'.'#1086#1090#1094#1086#1074#1089#1090#1074#1072
        #1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1077' '#1073#1088#1072#1082#1072
        #1091#1089#1099#1085#1086#1074#1083#1077#1085#1080#1077
        #1087#1077#1088#1077#1084#1077#1085#1072' '#1060#1048#1054)
      ParentFont = False
      TabOrder = 0
    end
    object cbAll: TCheckBox
      Left = 10
      Top = 21
      Width = 162
      Height = 17
      Caption = #1074#1089#1077' '#1090#1080#1087#1099' '
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 195
    Top = 0
    Width = 241
    Height = 105
    Caption = ' '#1055#1077#1088#1080#1086#1076' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 20
      Top = 26
      Width = 8
      Height = 19
      Caption = #1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 20
      Top = 67
      Width = 20
      Height = 19
      Caption = #1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edDateBegin: TDBDateTimeEditEh
      Left = 48
      Top = 24
      Width = 145
      Height = 24
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Visible = True
      EditFormat = 'MM/YYYY'
    end
    object edDateEnd: TDBDateTimeEditEh
      Left = 48
      Top = 65
      Width = 145
      Height = 24
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = True
      EditFormat = 'MM/YYYY'
    end
  end
  object GroupBox2: TGroupBox
    Left = 195
    Top = 109
    Width = 241
    Height = 116
    Caption = ' '#1054#1088#1075#1072#1085#1099' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object rbCur: TRadioButton
      Left = 8
      Top = 20
      Width = 226
      Height = 69
      Caption = 'rbCur'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      WordWrap = True
    end
    object rbAll: TRadioButton
      Left = 8
      Top = 93
      Width = 225
      Height = 17
      Caption = #1042#1089#1077' '#1086#1088#1075#1072#1085#1099' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = True
    end
  end
  object cbHand: TDBCheckBoxEh
    Left = 7
    Top = 229
    Width = 355
    Height = 17
    Caption = #1091#1076#1072#1083#1103#1090#1100' '#1074#1074#1077#1076#1077#1085#1085#1099#1077' '#1074#1088#1091#1095#1085#1091#1102' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
end
