object fmActions: TfmActions
  Left = 177
  Top = 151
  Width = 791
  Height = 519
  Caption = #1040#1082#1094#1080#1080' '#1080' '#1086#1073#1077#1082#1090#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnActions: TPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 481
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object TBDock1: TTBDock
      Left = 1
      Top = 1
      Width = 773
      Height = 26
      object TBToolbar1: TTBToolbar
        Left = 0
        Top = 0
        BorderStyle = bsNone
        CloseButton = False
        FullSize = True
        Images = fmMain.ImageList
        MenuBar = True
        ParentShowHint = False
        ProcessShortCuts = True
        ShowHint = True
        ShrinkMode = tbsmWrap
        TabOrder = 0
        object TBItemSave: TTBItem
          Caption = #1047#1072#1087#1080#1089#1072#1090#1100
          DisplayMode = nbdmImageAndText
          Hint = #1047#1072#1087#1080#1089#1072#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          ImageIndex = 36
          ShortCut = 113
          OnClick = TBItemSaveClick
        end
        object TBItemExit: TTBItem
          Caption = #1042#1099#1093#1086#1076
          DisplayMode = nbdmImageAndText
          Hint = #1042#1099#1093#1086#1076' '#1073#1077#1079' '#1079#1072#1087#1080#1089#1080
          ImageIndex = 37
          OnClick = TBItemExitClick
        end
        object tbClr: TTBItem
          Caption = #1054#1090#1084#1077#1085#1080#1090#1100
          DisplayMode = nbdmImageAndText
          ImageIndex = 58
          OnClick = tbClrClick
        end
        object TBSubmenuIndex: TTBSubmenuItem
          Caption = #1055#1086#1088#1103#1076#1086#1082
          DisplayMode = nbdmImageAndText
          ImageIndex = 84
          object TBItem1: TTBItem
            Caption = #1055#1086#1076#1089#1080#1089#1090#1077#1084#1072'+'#8470'+'#1058#1080#1087
            OnClick = TBItem1Click
          end
          object TBItem2: TTBItem
            Caption = #1058#1080#1087'+'#1048#1084#1103' '#1086#1073#1098#1077#1082#1090#1072
          end
        end
        object TBItemCopy: TTBItem
          Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
          DisplayMode = nbdmImageAndText
          Hint = #1057#1082#1086#1087#1088#1080#1088#1086#1074#1072#1090#1100' '#1089#1090#1088#1086#1082#1091
          ImageIndex = 26
          OnClick = TBItemCopyClick
        end
        object TBItemAdd: TTBItem
          Caption = #1058#1072#1073#1083#1080#1094#1072
          DisplayMode = nbdmImageAndText
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
          ImageIndex = 16
          ShortCut = 112
          OnClick = TBItemAddClick
        end
      end
    end
    object Grid: TDBGridEh
      Left = 1
      Top = 27
      Width = 773
      Height = 453
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
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      UseMultiTitle = True
      OnColumnMoved = GridColumnMoved
      OnKeyDown = GridKeyDown
      OnTitleBtnClick = GridTitleBtnClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'SUBSYSTEM'
          Footers = <>
          Title.Caption = #1055#1086#1076#1089#1080#1089#1090#1077#1084#1072
          Title.TitleButton = True
          Width = 126
        end
        item
          EditButtons = <>
          FieldName = 'TYPEOBJ'
          Footers = <>
          Title.Caption = #1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072
          Title.TitleButton = True
          Width = 114
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 249
        end
        item
          EditButtons = <>
          FieldName = 'KOD'
          Footers = <>
          Title.Caption = #1048#1084#1103' '#1086#1073#1098#1077#1082#1090#1072
          Title.TitleButton = True
          Width = 122
        end
        item
          EditButtons = <>
          FieldName = 'NEW'
          Footers = <>
          Title.Caption = #1053#1086#1074#1099#1081
          Width = 42
        end
        item
          EditButtons = <>
          FieldName = 'NOMER'
          Footers = <>
          Title.Caption = #8470
          Title.TitleButton = True
          Width = 32
        end>
    end
  end
  object DataSource: TDataSource
    OnDataChange = DataSourceDataChange
    Left = 48
    Top = 88
  end
end
