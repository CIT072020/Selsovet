object fmShowErrorGISUN: TfmShowErrorGISUN
  Left = 444
  Top = 294
  Width = 745
  Height = 246
  ActiveControl = btOk
  Caption = #1054#1096#1080#1073#1082#1072' '#1086#1073#1084#1077#1085#1072' '#1089' '#1043#1048#1057' '#1056#1053
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TDBGridEh
    Left = 0
    Top = 0
    Width = 385
    Height = 153
    DataSource = DataSource
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghDialogFind]
    ReadOnly = True
    RowHeight = 45
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
        FieldName = 'ERROR_CODE'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Width = 28
      end
      item
        EditButtons = <>
        FieldName = 'ERROR_TEXT'
        Footers = <>
        Title.Caption = #1058#1077#1082#1089#1090' '#1086#1096#1080#1073#1082#1080
        ToolTips = True
        Width = 190
        WordWrap = True
      end
      item
        EditButtons = <>
        FieldName = 'DESCRIPTION'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Width = 217
      end
      item
        EditButtons = <>
        FieldName = 'CHECK_NAME'
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1101#1083#1077#1084#1077#1085#1090#1072
        Width = 113
      end
      item
        EditButtons = <>
        FieldName = 'WRONG_VALUE'
        Footers = <>
        Title.Caption = #1053#1077#1087#1088#1072#1074#1080#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'CORRECT_VALUE'
        Footers = <>
        Title.Caption = #1054#1078#1080#1076#1072#1077#1084#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
        Width = 83
      end
      item
        EditButtons = <>
        FieldName = 'ERROR_PLACE'
        Footers = <>
        Title.Caption = #1052#1077#1089#1090#1086' '#1074#1086#1079#1085#1080#1082#1085#1086#1074#1077#1085#1080#1103
        ToolTips = True
        Width = 179
        WordWrap = True
      end
      item
        EditButtons = <>
        FieldName = 'IDENTIF'
        Footers = <>
        Title.Caption = #1048#1053
        Width = 115
      end>
  end
  object Panel: TPanel
    Left = 0
    Top = 168
    Width = 729
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      729
      40)
    object btOk: TBitBtn
      Left = 611
      Top = 7
      Width = 97
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
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
  end
  object ValList: TValueListEditor
    Left = 272
    Top = 24
    Width = 425
    Height = 108
    DefaultColWidth = 250
    DefaultRowHeight = 20
    DisplayOptions = [doAutoColResize, doKeyColFixed]
    FixedCols = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLineWidth = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goAlwaysShowEditor, goThumbTracking]
    ParentFont = False
    Strings.Strings = (
      '11111=2222222')
    TabOrder = 2
    TitleCaptions.Strings = (
      '111'
      '222')
    ColWidths = (
      250
      169)
  end
  object DataSource: TDataSource
    Left = 176
    Top = 104
  end
end
