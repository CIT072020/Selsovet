inherited fmChoiceNasel: TfmChoiceNasel
  Left = 629
  Top = 228
  Width = 553
  ActiveControl = edFam
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1095#1077#1083#1086#1074#1077#1082#1072
  KeyPreview = True
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter: TSplitter
    Top = 221
    Width = 537
  end
  inherited Grid: TSasaDBGrid
    Width = 537
    Height = 173
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
  end
  inherited pn: TPanel
    Width = 537
    inherited StBar: TStatusBar
      Width = 535
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 227
    Width = 537
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object Label2: TLabel
      Left = 7
      Top = 7
      Width = 44
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103
    end
    object edFam: TDBEditEh
      Left = 66
      Top = 4
      Width = 71
      Height = 21
      EditButtons = <>
      TabOrder = 0
      Visible = True
      OnChange = edFamChange
    end
    object btNewMen: TBitBtn
      Left = 145
      Top = 4
      Width = 82
      Height = 22
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1085#1077#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1085#1086#1075#1086' '#1095#1077#1083#1086#1074#1077#1082#1072
      Caption = #1053#1086#1074#1099#1081
      TabOrder = 1
      OnClick = btNewMenClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888AA88888888888888AA88808888808888AA88808800088AAAA
        AAAA800FF088AAAAAAAA880F0008888AA888800FFFF0888AA8880000FFF0888A
        A888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
        8888800000000888888888000008888888888888888888888888}
    end
  end
  inherited TBDock: TTBDock
    Width = 537
    inherited TBToolbar: TTBToolbar
      inherited TBItemAdd: TTBItem
        Visible = False
      end
      inherited TBItemDelete: TTBItem
        Visible = False
      end
      inherited TBItemCorr: TTBItem
        Visible = False
      end
      object TBItemCopyMen: TTBItem [5]
        Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
        DisplayMode = nbdmImageAndText
        Hint = #1042#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1095#1077#1083#1086#1074#1077#1082#1072' '#1089#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1080' '#1079#1072#1074#1077#1089#1090#1080' '#1082#1072#1082' '#1085#1086#1074#1086#1075#1086
        ImageIndex = 128
        Images = fmMain.ImageList
        OnClick = TBItemCopyMenClick
      end
      inherited TBItemDetail: TTBSubmenuItem
        Visible = False
      end
      inherited TBItemOneDetail: TTBItem
        Visible = False
      end
      object TBControlItem1: TTBControlItem
        Control = TBSaveDvig
      end
      object TBSaveDvig: TTBToolWindow
        Left = 170
        Top = 22
        Width = 205
        Height = 22
        ClientAreaHeight = 22
        ClientAreaWidth = 205
        TabOrder = 0
        object cbMigr: TDBCheckBoxEh
          Left = 8
          Top = 2
          Width = 185
          Height = 17
          Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1076#1074#1080#1078#1077#1085#1080#1077
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
    end
  end
  inherited GridSelect: TSasaDBGrid
    Width = 537
  end
  inherited ImageList: TTBImageList
    Top = 56
  end
  object tb: TAdsTable
    DatabaseName = 'dmBase.AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AfterScroll = tbAfterScroll
    AdsConnection = dmBase.AdsConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = #1053#1072#1089#1077#1083#1077#1085#1080#1077
    Left = 160
    Top = 80
  end
  object qChMens: TAdsQuery
    StoreActive = False
    AdsConnection = dmBase.AdsConnection
    Left = 80
    Top = 160
    ParamData = <>
  end
end
