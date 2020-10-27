object fmEditRecSprOwners: TfmEditRecSprOwners
  Left = 277
  Top = 124
  Width = 571
  Height = 488
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
    Width = 563
    Height = 95
    Align = alTop
    TabOrder = 0
    object Label6: TLabel
      Left = 17
      Top = 43
      Width = 149
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
      Width = 171
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
      Top = 43
      Width = 38
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
      Top = 39
      Width = 90
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 2
      Visible = True
    end
    object edDateP: TDBDateTimeEditEh
      Left = 203
      Top = 65
      Width = 90
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 3
      Visible = True
    end
    object edTail: TDBEditEh
      Left = 384
      Top = 39
      Width = 95
      Height = 21
      EditButtons = <>
      TabOrder = 4
      Visible = True
    end
  end
  object pc: TPageControl
    Left = 0
    Top = 95
    Width = 563
    Height = 318
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    TabPosition = tpBottom
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      DesignSize = (
        555
        292)
      object Label1: TLabel
        Left = 15
        Top = 9
        Width = 154
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
        Top = 35
        Width = 40
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
        Top = 113
        Width = 99
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
        Top = 165
        Width = 60
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
        Top = 188
        Width = 177
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
        Top = 61
        Width = 56
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
        Top = 87
        Width = 151
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
        Top = 139
        Width = 82
        Height = 16
        Caption = #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edFIO: TDBEditEh
        Left = 200
        Top = 5
        Width = 217
        Height = 21
        EditButtons = <>
        TabOrder = 0
        Text = 'edFIO'
        Visible = True
      end
      object edAdres1: TDBEditEh
        Left = 200
        Top = 31
        Width = 351
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        EditButtons = <>
        TabOrder = 1
        Text = 'edAdres1'
        Visible = True
      end
      object edDateRogd: TDBDateTimeEditEh
        Left = 200
        Top = 109
        Width = 90
        Height = 21
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 4
        Visible = True
      end
      object edTelefon1: TDBEditEh
        Left = 200
        Top = 161
        Width = 121
        Height = 21
        EditButtons = <>
        TabOrder = 6
        Text = 'edTelefon1'
        Visible = True
      end
      object edAdd1: TDBEditEh
        Left = 200
        Top = 187
        Width = 351
        Height = 75
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        EditButtons = <>
        TabOrder = 7
        Text = 'edAdd1'
        Visible = True
        WantReturns = True
        WordWrap = True
      end
      object edPasport: TDBEditEh
        Left = 200
        Top = 57
        Width = 351
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        EditButtons = <>
        TabOrder = 2
        Visible = True
      end
      object edLichNomer: TDBEditEh
        Left = 200
        Top = 83
        Width = 135
        Height = 21
        EditButtons = <>
        TabOrder = 3
        Visible = True
      end
      object edDateSmer: TDBDateTimeEditEh
        Left = 200
        Top = 135
        Width = 90
        Height = 21
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 5
        Visible = True
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      DesignSize = (
        555
        292)
      object Label10: TLabel
        Left = 14
        Top = 6
        Width = 99
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
        Top = 32
        Width = 40
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
        Top = 108
        Width = 177
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
        Top = 58
        Width = 60
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
        Top = 84
        Width = 56
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
        Top = 108
        Width = 351
        Height = 85
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        EditButtons = <>
        TabOrder = 4
        Visible = True
        WantTabs = True
        WordWrap = True
      end
      object edAdres2: TDBEditEh
        Left = 198
        Top = 30
        Width = 350
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
      object edName: TDBEditEh
        Left = 198
        Top = 4
        Width = 352
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
      object edTelefon2: TDBEditEh
        Left = 198
        Top = 56
        Width = 121
        Height = 21
        EditButtons = <>
        TabOrder = 2
        Visible = True
      end
      object edUNP2: TDBEditEh
        Left = 198
        Top = 82
        Width = 121
        Height = 21
        EditButtons = <>
        TabOrder = 3
        Visible = True
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 413
    Width = 563
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 331
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
      Left = 437
      Top = 10
      Width = 90
      Height = 25
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
