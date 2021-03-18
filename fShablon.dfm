object fmShablon: TfmShablon
  Left = 401
  Top = 200
  AutoScroll = False
  Caption = #1064#1072#1073#1083#1086#1085#1099' '#1074#1074#1086#1076#1072
  ClientHeight = 374
  ClientWidth = 823
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TDBGridEh
    Left = 0
    Top = 54
    Width = 823
    Height = 320
    Align = alClient
    AutoFitColWidths = True
    DataSource = DataSource
    DrawMemoText = True
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
    ParentFont = False
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
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
        Width = 658
      end
      item
        EditButtons = <>
        FieldName = 'NOMER'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088' '#1076#1083#1103' '#1087#1086#1082#1072#1079#1072
      end>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 823
    Height = 54
    AllowDrag = False
    FixAlign = True
    object TBToolbar: TTBToolbar
      Left = 0
      Top = 0
      DragHandleStyle = dhNone
      Images = fmMain.ImageList
      ProcessShortCuts = True
      SmoothDrag = False
      Stretch = True
      TabOrder = 0
      object TBItemOk: TTBItem
        Caption = #1042#1099#1073#1086#1088
        DisplayMode = nbdmImageAndText
        ImageIndex = 36
        ShortCut = 13
        OnClick = TBItemOkClick
      end
      object TBItemCancel: TTBItem
        Caption = #1054#1090#1082#1072#1079
        DisplayMode = nbdmImageAndText
        ImageIndex = 37
        OnClick = TBItemCancelClick
      end
      object TBItemAdd: TTBItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        DisplayMode = nbdmImageAndText
        ImageIndex = 127
        ShortCut = 45
        OnClick = TBItemAddClick
      end
      object TBItemEdit: TTBItem
        Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100
        DisplayMode = nbdmImageAndText
        Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100
        ImageIndex = 126
        ShortCut = 113
        OnClick = TBItemEditClick
      end
      object TBItemDel: TTBItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        DisplayMode = nbdmImageAndText
        ImageIndex = 41
        OnClick = TBItemDelClick
      end
      object TBItemSetFlt: TTBItem
        Caption = #1053#1072#1081#1090#1080
        DisplayMode = nbdmImageAndText
        ImageIndex = 35
        ShortCut = 115
        OnClick = TBItemSetFltClick
      end
      object TBItemClearFlt: TTBItem
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100
        DisplayMode = nbdmImageAndText
        Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1086#1090#1073#1086#1088
        ImageIndex = 29
        ShortCut = 16499
        OnClick = TBItemClearFltClick
      end
    end
    object TBToolbarCh: TTBToolbar
      Left = 0
      Top = 26
      BorderStyle = bsNone
      DockMode = dmCannotFloat
      DockPos = 0
      DockRow = 1
      ParentShowHint = False
      Resizable = False
      ShowHint = True
      Stretch = True
      TabOrder = 1
      object TBControlItem1: TTBControlItem
        Control = edNameShablon
      end
      object edNameShablon: TComboBox
        Left = 0
        Top = 0
        Width = 441
        Height = 24
        Style = csDropDownList
        DropDownCount = 15
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
        OnChange = edNameShablonChange
        Items.Strings = (
          #1044#1086#1082#1091#1084#1077#1085#1090' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1080#1081' '#1083#1080#1095#1085#1086#1089#1090#1100
          #1054#1090#1084#1077#1090#1082#1072' '#1086' '#1085#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1080
          #1047#1072#1087#1080#1089#1100' '#1089#1074#1077#1076#1077#1085#1080#1081' '#1086#1073' '#1086#1090#1094#1077
          #1048#1079#1084#1077#1085#1077#1085#1080#1103', '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103', '#1076#1086#1087#1086#1083#1085#1077#1085#1080#1103
          #1054#1088#1075#1072#1085' '#1074#1099#1076#1072#1095#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072', '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1072#1102#1097#1077#1075#1086' '#1092#1072#1082#1090' '#1089#1084#1077#1088#1090#1080
          #1052#1077#1089#1090#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          #1056#1077#1096#1077#1085#1080#1077' '#1089#1091#1076#1072
          #1044#1086#1082#1091#1084#1077#1085#1090#1099' '#1076#1083#1103' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080' '#1085#1072' '#1086#1095#1077#1088#1077#1076#1100
          #1057#1087#1080#1089#1086#1082' '#1056#1054#1042#1044
          #1047#1072#1103#1074#1080#1090#1077#1083#1100
          #1044#1086#1082#1091#1084#1077#1085#1090' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1072#1102#1097#1080#1081' '#1092#1072#1082#1090' '#1088#1086#1078#1076#1077#1085#1080#1103
          #1044#1088#1091#1075#1080#1077' '#1087#1088#1080#1095#1080#1085#1099' '#1087#1088#1080#1073#1099#1090#1080#1103
          #1054#1089#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1083#1077#1085#1080#1103' '#1078#1080#1083#1086#1075#1086' '#1087#1086#1084#1077#1097#1077#1085#1080#1103)
      end
    end
  end
  object DataSource: TDataSource
    Left = 144
    Top = 128
  end
end
