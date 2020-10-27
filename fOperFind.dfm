object fmOperFind: TfmOperFind
  Left = 416
  Top = 243
  Width = 880
  Height = 431
  Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' ('#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080')'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 864
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = fmMain.ImageList
      Stretch = True
      TabOrder = 0
      object TBItemSave: TTBItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        DisplayMode = nbdmImageAndText
        ImageIndex = 36
        OnClick = TBItemSaveClick
      end
    end
  end
  object SasaDBGrid1: TSasaDBGrid
    Left = 0
    Top = 26
    Width = 864
    Height = 367
    Align = alClient
    Ctl3D = True
    DataSource = DataSource
    DrawMemoText = True
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    EnterDirection = mdNextGraph
    OptionsS = [dgsSelectCurrentColor]
    SelRowColor = clAqua
    Color1 = clBlack
    Color2 = clBlack
    TypeSave = 0
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Visible'
        Footers = <>
        Title.Caption = #1042#1080#1076#1080#1084#1086#1089#1090#1100
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'Order'
        Footers = <>
        Title.Caption = #8470
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
        Title.Caption = #1048#1084#1103
        Width = 140
      end
      item
        EditButtons = <>
        FieldName = 'Caption'
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 170
      end
      item
        EditButtons = <>
        FieldName = 'SQL'
        Footers = <>
        Title.Caption = #1064#1072#1073#1083#1086#1085' '#1079#1072#1087#1088#1086#1089#1072
        Width = 317
      end
      item
        EditButtons = <>
        FieldName = 'FieldKinds'
        Footers = <>
        Title.Caption = #1058#1080#1087#1099' '#1087#1086#1083#1077#1081' '#1095#1077#1088#1077#1079' '#1079#1072#1087#1103#1090#1091#1102
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'NeedValue'
        Footers = <>
        Title.Caption = #1058#1088#1077#1073#1091#1077#1090' '#1079#1085#1072#1095#1077#1085#1080#1077
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'TwoValue'
        Footers = <>
        Title.Caption = #1058#1088#1077#1073#1091#1077#1090' '#1076#1074#1072' '#1079#1085#1072#1095#1077#1085#1080#1103
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'IgnoreCase'
        Footers = <>
        Title.Caption = #1048#1075#1085#1086#1088#1080#1088#1086#1074#1072#1090#1100' '#1088#1077#1075#1080#1089#1090#1088
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'MultiSel'
        Footers = <>
        Title.Caption = #1052#1085#1086#1078#1077#1089#1090'. '#1074#1099#1073#1086#1088
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'MultiOr'
        Footers = <>
        Title.Caption = #1057#1074#1103#1079#1099#1074#1072#1090#1100' '#1087#1086' '#1048#1051#1048'/'#1048
        Width = 59
      end
      item
        EditButtons = <>
        FieldName = 'OwnValue'
        Footers = <>
        Title.Caption = #1057#1074#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
      end
      item
        EditButtons = <>
        FieldName = 'OwnValName'
        Footers = <>
        Title.Caption = #1048#1084#1103' '#1079#1085#1072#1095#1077#1085#1080#1103
      end
      item
        EditButtons = <>
        FieldName = 'OwnValKind'
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1079#1085#1072#1095#1077#1085#1080#1103
      end
      item
        EditButtons = <>
        FieldName = 'SprName'
        Footers = <>
        Title.Caption = #1050#1086#1076' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      end>
  end
  object DataSource: TDataSource
    Left = 240
    Top = 168
  end
end
