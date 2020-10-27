object fmEditRecHistOwners: TfmEditRecHistOwners
  Left = 253
  Top = 152
  Width = 614
  Height = 496
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 598
    Height = 95
    Align = alTop
    TabOrder = 0
    object Label6: TLabel
      Left = 17
      Top = 40
      Width = 135
      Height = 16
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1074#1083#1072#1076#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 17
      Top = 69
      Width = 155
      Height = 16
      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1074#1083#1072#1076#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 337
      Top = 40
      Width = 34
      Height = 16
      Caption = #1063#1072#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object rb1: TRadioButton
      Left = 17
      Top = 12
      Width = 148
      Height = 17
      Caption = #1092#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = rb1Click
    end
    object rb2: TRadioButton
      Left = 183
      Top = 12
      Width = 113
      Height = 17
      Caption = #1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = rb2Click
    end
    object edDateS: TDBDateTimeEditEh
      Left = 203
      Top = 36
      Width = 110
      Height = 26
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 2
      Visible = True
    end
    object edDateP: TDBDateTimeEditEh
      Left = 203
      Top = 65
      Width = 110
      Height = 26
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 3
      Visible = True
    end
    object edTail: TDBEditEh
      Left = 384
      Top = 36
      Width = 95
      Height = 26
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = True
    end
  end
  object pc: TPageControl
    Left = 0
    Top = 95
    Width = 598
    Height = 322
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    TabPosition = tpBottom
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      DesignSize = (
        590
        296)
      object Label1: TLabel
        Left = 15
        Top = 9
        Width = 139
        Height = 16
        Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 15
        Top = 39
        Width = 35
        Height = 16
        Caption = #1040#1076#1088#1077#1089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 15
        Top = 128
        Width = 92
        Height = 16
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 15
        Top = 188
        Width = 53
        Height = 16
        Caption = #1058#1077#1083#1077#1092#1086#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 15
        Top = 215
        Width = 160
        Height = 16
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 15
        Top = 69
        Width = 48
        Height = 16
        Caption = #1055#1072#1089#1087#1086#1088#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 15
        Top = 99
        Width = 133
        Height = 16
        Caption = #1053#1086#1084#1077#1088' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 15
        Top = 158
        Width = 74
        Height = 16
        Caption = #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edFamilia: TDBEditEh
        Left = 200
        Top = 5
        Width = 129
        Height = 26
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'edFamilia'
        Visible = True
      end
      object edAdres1: TDBEditEh
        Left = 200
        Top = 34
        Width = 385
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = 'edAdres1'
        Visible = True
      end
      object edDateRogd: TDBDateTimeEditEh
        Left = 200
        Top = 123
        Width = 110
        Height = 26
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 6
        Visible = True
      end
      object edTelefon1: TDBEditEh
        Left = 200
        Top = 183
        Width = 121
        Height = 26
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        Text = 'edTelefon1'
        Visible = True
      end
      object edAdd1: TDBEditEh
        Left = 200
        Top = 212
        Width = 386
        Height = 75
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        Text = 'edAdd1'
        Visible = True
        WantReturns = True
        WordWrap = True
      end
      object edPasport: TDBEditEh
        Left = 200
        Top = 64
        Width = 384
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Visible = True
      end
      object edLichNomer: TDBEditEh
        Left = 200
        Top = 94
        Width = 177
        Height = 26
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = True
      end
      object edDateSmer: TDBDateTimeEditEh
        Left = 200
        Top = 153
        Width = 110
        Height = 26
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 7
        Visible = True
      end
      object edName_Men: TDBEditEh
        Left = 345
        Top = 5
        Width = 81
        Height = 26
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
      object edOtch_Men: TDBEditEh
        Left = 440
        Top = 5
        Width = 107
        Height = 26
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = True
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      DesignSize = (
        590
        296)
      object Label10: TLabel
        Left = 14
        Top = 6
        Width = 86
        Height = 16
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 14
        Top = 40
        Width = 35
        Height = 16
        Caption = #1040#1076#1088#1077#1089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 14
        Top = 129
        Width = 160
        Height = 16
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 14
        Top = 71
        Width = 53
        Height = 16
        Caption = #1058#1077#1083#1077#1092#1086#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 14
        Top = 103
        Width = 48
        Height = 16
        Caption = #1050#1086#1076' '#1059#1053#1055
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edAdd2: TDBEditEh
        Left = 198
        Top = 129
        Width = 390
        Height = 85
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Visible = True
        WantTabs = True
        WordWrap = True
      end
      object edAdres2: TDBEditEh
        Left = 198
        Top = 35
        Width = 393
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
      object edName: TDBEditEh
        Left = 198
        Top = 4
        Width = 395
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
      object edTelefon2: TDBEditEh
        Left = 198
        Top = 66
        Width = 121
        Height = 26
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = True
      end
      object edUNP2: TDBEditEh
        Left = 198
        Top = 98
        Width = 121
        Height = 26
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Visible = True
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 417
    Width = 598
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 384
      Top = 10
      Width = 90
      Height = 25
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      ModalResult = 1
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 490
      Top = 10
      Width = 90
      Height = 25
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
