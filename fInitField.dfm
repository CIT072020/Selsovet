inherited fmInitField: TfmInitField
  Left = 389
  Top = 277
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1088#1077#1082#1074#1080#1079#1080#1090#1072
  ClientHeight = 159
  ClientWidth = 393
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 115
    Width = 393
    inherited btOk: TBitBtn
      Left = 184
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    end
    inherited btCancel: TBitBtn
      Left = 288
    end
    object Button1: TButton
      Left = 88
      Top = 16
      Width = 43
      Height = 25
      Caption = 'Button1'
      TabOrder = 2
      Visible = False
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 115
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 6
      Top = 63
      Width = 382
      Height = 53
      Caption = ' '#1053#1086#1074#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object edSpr: TDBLookupComboboxEh
        Left = 173
        Top = 19
        Width = 196
        Height = 24
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ListSource = DataSource
        ParentFont = False
        TabOrder = 1
        Visible = False
      end
      object edList: TDBComboBoxEh
        Left = 331
        Top = 19
        Width = 33
        Height = 24
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = 'edList'
        Visible = False
      end
      object edNumeric: TDBNumberEditEh
        Left = 370
        Top = 19
        Width = 22
        Height = 24
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
      object edOper: TComboBox
        Left = 25
        Top = 19
        Width = 120
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
        Visible = False
        OnChange = edOperChange
        Items.Strings = (
          #1079#1072#1087#1080#1089#1072#1090#1100
          #1086#1095#1080#1089#1090#1080#1090#1100
          #1091#1074#1077#1083#1080#1095#1080#1090#1100
          #1091#1084#1077#1085#1100#1096#1080#1090#1100)
      end
      object edDate: TDBDateTimeEditEh
        Left = 157
        Top = 19
        Width = 113
        Height = 24
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 4
        Visible = False
      end
      object edString: TDBEditEh
        Left = 192
        Top = 24
        Width = 41
        Height = 24
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = False
      end
    end
    object gbRekv: TGroupBox
      Left = 6
      Top = 4
      Width = 382
      Height = 56
      Caption = ' '#1056#1077#1082#1074#1080#1079#1080#1090' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        382
        56)
      object edRekv: TComboBox
        Left = 24
        Top = 21
        Width = 345
        Height = 24
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
        OnChange = edRekvChange
      end
    end
  end
  object DataSource: TDataSource
    Left = 40
    Top = 112
  end
end
