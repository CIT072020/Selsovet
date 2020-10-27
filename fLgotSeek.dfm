object fmLgotSeek: TfmLgotSeek
  Left = 429
  Top = 159
  BorderStyle = bsToolWindow
  Caption = #1051#1100#1075#1086#1090#1085#1080#1082#1080
  ClientHeight = 471
  ClientWidth = 379
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object gbOp: TGroupBox
    Left = 0
    Top = 264
    Width = 379
    Height = 57
    Align = alTop
    Caption = ' '#1054#1087#1094#1080#1080'  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object rbOneValue: TRadioButton
      Left = 8
      Top = 15
      Width = 252
      Height = 17
      Caption = #1054#1076#1085#1086' '#1080#1079' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1093' '#1079#1085#1072#1095#1077#1085#1080#1081
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
    end
    object rbAllValue: TRadioButton
      Left = 8
      Top = 34
      Width = 236
      Height = 17
      Caption = #1042#1089#1077' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1077' '#1079#1085#1072#1095#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 431
    Width = 379
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btCancel: TBitBtn
      Left = 287
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 0
      Kind = bkCancel
    end
    object btOk: TBitBtn
      Left = 199
      Top = 8
      Width = 75
      Height = 25
      Caption = #1053#1072#1081#1090#1080
      TabOrder = 1
      Kind = bkOK
    end
  end
  object gbSeek: TGroupBox
    Left = 0
    Top = 0
    Width = 379
    Height = 264
    Align = alTop
    Caption = ' '#1048#1089#1082#1072#1090#1100'  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object cbSeek: TCheckListBox
      Left = 2
      Top = 15
      Width = 375
      Height = 247
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 321
    Width = 379
    Height = 56
    Align = alTop
    Caption = ' '#1042#1086#1079#1088#1072#1089#1090' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label1: TLabel
      Left = 281
      Top = 31
      Width = 12
      Height = 13
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbVozr: TComboBox
      Left = 12
      Top = 20
      Width = 180
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = #1085#1077#1074#1072#1078#1085#1086
      OnClick = cbVozrClick
      Items.Strings = (
        #1085#1077#1074#1072#1078#1085#1086
        #1084#1083#1072#1076#1096#1077' '#1090#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1086#1075#1086
        #1090#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1086#1075#1086
        #1089#1090#1072#1088#1096#1077' '#1090#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1086#1075#1086
        #1084#1077#1078#1076#1091)
    end
    object Vozr1: TDBNumberEditEh
      Left = 210
      Top = 20
      Width = 60
      Height = 24
      DecimalPlaces = 0
      Enabled = False
      EditButton.Style = ebsUpDownEh
      EditButton.Visible = True
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxValue = 150.000000000000000000
      ParentFont = False
      TabOrder = 1
      Value = 0.000000000000000000
      Visible = True
    end
    object Vozr2: TDBNumberEditEh
      Left = 306
      Top = 20
      Width = 60
      Height = 24
      DecimalPlaces = 0
      Enabled = False
      EditButton.Style = ebsUpDownEh
      EditButton.Visible = True
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxValue = 150.000000000000000000
      ParentFont = False
      TabOrder = 2
      Value = 18.000000000000000000
      Visible = True
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 377
    Width = 379
    Height = 55
    Align = alTop
    Caption = ' '#1055#1086#1083' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object cbPol: TComboBox
      Left = 12
      Top = 20
      Width = 180
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = #1085#1077#1074#1072#1078#1085#1086
      Items.Strings = (
        #1085#1077#1074#1072#1078#1085#1086
        #1084#1091#1078#1089#1082#1086#1081
        #1078#1077#1085#1089#1082#1080#1081)
    end
  end
end
