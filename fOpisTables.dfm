object fmOpisTables: TfmOpisTables
  Left = 358
  Top = 164
  Width = 1094
  Height = 533
  Caption = #1054#1087#1080#1089#1072#1085#1080#1103' '#1090#1072#1073#1083#1080#1094' '#1073#1072#1079#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Sp: TSplitter
    Left = 0
    Top = 239
    Width = 1078
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object GridTables: TDBGridEh
    Left = 0
    Top = 26
    Width = 1078
    Height = 213
    Align = alTop
    DataSource = dsTables
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    OnGetCellParams = GridTablesGetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Nomer'
        Footers = <>
        Title.Caption = #8470
        Width = 27
      end
      item
        EditButtons = <>
        FieldName = 'TableName'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1048#1084#1103' '#1090#1072#1073#1083#1080#1094#1099
        Width = 133
      end
      item
        EditButtons = <>
        FieldName = 'Caption'
        Footers = <>
        Title.Caption = #1055#1086#1076#1087#1080#1089#1100
      end
      item
        EditButtons = <>
        FieldName = 'BaseName'
        Footers = <>
        Title.Caption = #1048#1084#1103' '#1073#1072#1079#1099
      end>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 1078
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = fmMain.ImageList
      ProcessShortCuts = True
      TabOrder = 0
      object TBItemWrite: TTBItem
        Caption = #1047#1072#1087#1080#1089#1072#1090#1100
        Hint = #1047#1072#1087#1080#1089#1072#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        ImageIndex = 18
        OnClick = TBItemWriteClick
      end
      object TBItemAddTables: TTBItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1099
        Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1085#1086#1074#1099#1077' '#1090#1072#1073#1083#1080#1094#1099
        ImageIndex = 26
        OnClick = TBItemAddTablesClick
      end
      object TBItemReNum: TTBItem
        Caption = #1055#1077#1088#1077#1085#1091#1084#1077#1088#1086#1074#1072#1090#1100
        Hint = #1055#1077#1088#1077#1085#1091#1084#1077#1088#1086#1074#1072#1090#1100' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099
        ImageIndex = 84
        OnClick = TBItemReNumClick
      end
      object TBItemCheck: TTBItem
        Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100
        Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1089#1091#1097#1077#1089#1090#1074#1086#1074#1072#1085#1080#1077' '#1090#1072#1073#1083#1080#1094
        ImageIndex = 16
        OnClick = TBItemCheckClick
      end
      object TBItemDelTable: TTBItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1086#1087#1080#1089#1085#1080#1077' '
        ImageIndex = 76
        ShortCut = 16430
        OnClick = TBItemDelTableClick
      end
      object TBItemExit: TTBItem
        Caption = #1042#1099#1093#1086#1076
        Hint = #1042#1099#1093#1086#1076
        ImageIndex = 62
        OnClick = TBItemExitClick
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 242
    Width = 1078
    Height = 253
    ActivePage = tsFields
    Align = alClient
    TabOrder = 2
    object tsFields: TTabSheet
      Caption = #1055#1086#1083#1103
      object GridFields: TDBGridEh
        Left = 0
        Top = 0
        Width = 1070
        Height = 225
        Align = alClient
        DataSource = dsFields
        DrawMemoText = True
        EditActions = [geaDeleteEh]
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        FrozenCols = 2
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
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
            FieldName = 'TableName'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'Nomer'
            Footers = <>
            Title.Caption = #8470
            Width = 33
          end
          item
            EditButtons = <>
            FieldName = 'FieldName'
            Footers = <>
            Title.Caption = #1048#1084#1103' '#1087#1086#1083#1103
            Width = 113
          end
          item
            EditButtons = <>
            FieldName = 'EnableF'
            Footers = <>
            Title.Caption = #1042#1082#1083'. '#1074' '#1092#1080#1083#1100#1090#1088
          end
          item
            EditButtons = <>
            FieldName = 'Caption'
            Footers = <>
            Title.Caption = #1055#1086#1076#1087#1080#1089#1100
            Width = 215
          end
          item
            EditButtons = <>
            FieldName = 'Gruppa'
            Footers = <>
            Title.Caption = #1043#1088#1091#1087#1087#1072
            Width = 212
          end
          item
            EditButtons = <>
            FieldName = 'Spr_Filter'
            Footers = <>
            Title.Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
            Width = 101
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'NotGroupBy'
            Footers = <>
            Title.Caption = #1053#1077' '#1074#1082#1083'. '#1074' '#1075#1088#1091#1087#1087'.'
            Width = 48
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'FTS'
            Footers = <>
            Width = 24
          end
          item
            EditButtons = <>
            FieldName = 'EnableH'
            Footers = <>
            Title.Caption = #1044#1086#1089#1090'. '#1080#1089#1090#1086#1088#1080#1080
            Width = 52
          end
          item
            EditButtons = <>
            FieldName = 'EnableI'
            Footers = <>
            Title.Caption = #1044#1086#1089#1090'. '#1080#1085#1080#1094'.'
            Title.Hint = #1044#1086#1089#1090#1091#1087#1085#1086#1089#1090#1100' '#1080#1085#1080#1094#1080#1072#1083#1080#1079#1072#1094#1080#1080
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'Calc'
            Footers = <>
            Title.Caption = #1042#1099#1088#1072#1078#1077#1085#1080#1077' '#1076#1083#1103' '#1074#1099#1095#1080#1089#1083#1077#1085#1080#1103
            Width = 288
          end>
      end
    end
  end
  object dsTables: TDataSource
    DataSet = fmMain.mtTables
    OnDataChange = dsTablesDataChange
    Left = 152
    Top = 80
  end
  object dsFields: TDataSource
    DataSet = fmMain.mtTablesFields
    Left = 164
    Top = 197
  end
end
