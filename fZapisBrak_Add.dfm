inherited fmZapisBrak_Add: TfmZapisBrak_Add
  Left = 346
  Top = 291
  Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1087#1088#1077#1082#1088#1072#1097#1077#1085#1080#1080' ('#1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1080') '#1073#1088#1072#1082#1072
  ClientHeight = 179
  ClientWidth = 793
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 135
    Width = 793
    inherited btOk: TBitBtn
      Left = 575
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    end
    inherited btCancel: TBitBtn
      Left = 684
    end
  end
  object pcRast: TPageControl
    Left = 0
    Top = 41
    Width = 793
    Height = 94
    ActivePage = tsRast
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Style = tsButtons
    TabOrder = 1
    object tsSmert: TTabSheet
      Caption = #1073#1088#1072#1082' '#1087#1088#1077#1082#1088#1072#1097#1077#1085' '#1074' '#1089#1074#1103#1079#1080' '#1089#1086' '#1089#1084#1077#1088#1090#1100#1102
      DesignSize = (
        785
        63)
      object lb14: TLabel
        Left = 125
        Top = 30
        Width = 12
        Height = 13
        Caption = #1086#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lb15: TLabel
        Left = 289
        Top = 30
        Width = 64
        Height = 13
        Caption = #1089#1086#1074#1077#1088#1096#1077#1085#1072' '#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lb13: TLabel
        Left = 8
        Top = 30
        Width = 13
        Height = 13
        Caption = #8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lb12: TLabel
        Left = 7
        Top = 4
        Width = 109
        Height = 13
        Caption = #1047#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1089#1084#1077#1088#1090#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edS_NOMER: TDBEditEh
        Left = 28
        Top = 26
        Width = 86
        Height = 21
        DataField = 'S_NOMER'
        DataSource = fmZapisBrak.dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
      object edS_DATE: TDBDateTimeEditEh
        Left = 149
        Top = 26
        Width = 121
        Height = 21
        DataField = 'S_DATE'
        DataSource = fmZapisBrak.dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
      object edS_ZAGS: TDBEditEh
        Left = 379
        Top = 26
        Width = 373
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'S_ZAGS'
        DataSource = fmZapisBrak.dsDokument
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = edS_ZAGSEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = True
      end
    end
    object tsRast: TTabSheet
      Caption = #1088#1072#1089#1090#1086#1088#1075#1085#1091#1090' '#1087#1086' '#1088#1077#1096#1077#1085#1080#1102' '#1089#1091#1076#1072
      ImageIndex = 1
      DesignSize = (
        785
        63)
      object lb10: TLabel
        Left = 496
        Top = 10
        Width = 12
        Height = 13
        Caption = #1086#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lb11: TLabel
        Left = 12
        Top = 38
        Width = 154
        Height = 13
        Caption = #1074#1089#1090#1091#1087#1080#1074#1096#1077#1075#1086' '#1074' '#1079#1072#1082#1086#1085#1085#1091#1102' '#1089#1080#1083#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edSudResh: TDBDateTimeEditEh
        Left = 523
        Top = 6
        Width = 121
        Height = 21
        DataField = 'SUDRESH'
        DataSource = fmZapisBrak.dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
      object edSudName: TDBEditEh
        Left = 14
        Top = 6
        Width = 470
        Height = 21
        Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1091#1076#1072
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SUDNAME'
        DataSource = fmZapisBrak.dsDokument
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = edSudNameEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
      object edSudSila: TDBDateTimeEditEh
        Left = 195
        Top = 34
        Width = 121
        Height = 21
        DataField = 'SUDSILA'
        DataSource = fmZapisBrak.dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 2
        Visible = True
      end
    end
    object tsAkt: TTabSheet
      Caption = #1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1080' '#1073#1088#1072#1082#1072
      ImageIndex = 2
      DesignSize = (
        785
        63)
      object lb6: TLabel
        Left = 7
        Top = 4
        Width = 174
        Height = 13
        Caption = #1047#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1080' '#1073#1088#1072#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lb7: TLabel
        Left = 8
        Top = 30
        Width = 13
        Height = 13
        Caption = #8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lb8: TLabel
        Left = 125
        Top = 30
        Width = 12
        Height = 13
        Caption = #1086#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lb9: TLabel
        Left = 285
        Top = 30
        Width = 76
        Height = 13
        Caption = #1089#1086#1074#1077#1088#1096#1077#1085#1085#1086#1081' '#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edR_NOMER: TDBEditEh
        Left = 28
        Top = 26
        Width = 86
        Height = 21
        DataField = 'R_NOMER'
        DataSource = fmZapisBrak.dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
      object edR_DATE: TDBDateTimeEditEh
        Left = 149
        Top = 26
        Width = 121
        Height = 21
        DataField = 'R_DATE'
        DataSource = fmZapisBrak.dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
      object edR_ZAGS: TDBEditEh
        Left = 379
        Top = 26
        Width = 388
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'R_ZAGS'
        DataSource = fmZapisBrak.dsDokument
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = edR_ZAGSEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = True
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 793
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object cbBrak: TDBCheckBoxEh
      Left = 13
      Top = 9
      Width = 268
      Height = 21
      Caption = #1041#1088#1072#1082' '#1088#1072#1089#1090#1086#1088#1075#1085#1091#1090' ('#1087#1088#1077#1082#1088#1072#1097#1077#1085')'
      DataField = 'BRAK_RAST'
      DataSource = fmZapisBrak.dsDokument
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = False
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
end
