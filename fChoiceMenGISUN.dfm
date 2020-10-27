object fmChoiceMenGISUN: TfmChoiceMenGISUN
  Left = 315
  Top = 220
  Width = 769
  Height = 345
  ActiveControl = Grid
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1095#1077#1083#1086#1074#1077#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TDBGridEh
    Left = 0
    Top = 0
    Width = 753
    Height = 258
    Align = alClient
    DataSource = DataSource
    DrawMemoText = True
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit]
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
    ReadOnly = True
    RowHeight = 59
    RowSizingAllowed = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'IDENTIF'
        Footers = <>
        Title.Caption = #1048#1053
        Width = 98
      end
      item
        EditButtons = <>
        FieldName = 'FIO'
        Footers = <>
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
        ToolTips = True
        Width = 147
      end
      item
        EditButtons = <>
        FieldName = 'DATER'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'ADRES_G'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089' '#1084#1077#1089#1090#1072' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
        Width = 174
      end
      item
        EditButtons = <>
        FieldName = 'ADRES_R'
        Footers = <>
        Title.Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
        Width = 159
      end
      item
        EditButtons = <>
        FieldName = 'DOC_NAME'
        Footers = <>
        Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1080#1081' '#1083#1080#1095#1085#1086#1089#1090#1100
        Width = 150
      end
      item
        EditButtons = <>
        FieldName = 'DATES'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080
        Width = 88
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 258
    Width = 753
    Height = 49
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      753
      49)
    object btOk: TBitBtn
      Left = 522
      Top = 11
      Width = 97
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Default = True
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
    object BitBtn1: TBitBtn
      Left = 639
      Top = 11
      Width = 97
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object DataSource: TDataSource
    Left = 176
    Top = 104
  end
end
