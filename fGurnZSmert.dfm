inherited fmGurnZSmert: TfmGurnZSmert
  Left = 246
  Top = 122
  Width = 950
  Height = 586
  Caption = #1047#1072#1087#1080#1089#1080' '#1072#1082#1090#1086#1074' '#1086' '#1089#1084#1077#1088#1090#1080
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBDock: TTBDock
    Width = 934
    inherited TBToolbarMenu: TTBToolbar
      inherited TBItemGrantSprav: TTBItem
        Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
        Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      end
      inherited TBItemDelayRegister: TTBItem
        Visible = True
      end
      inherited TBSubSysFlt: TTBSubmenuItem
        object TBItemZader: TTBItem
          Caption = #1047#1072#1076#1077#1088#1078#1082#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1073#1086#1083#1077#1077' 7 '#1076#1085#1077#1081
          Hint = #1047#1072#1076#1077#1088#1078#1082#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1073#1086#1083#1077#1077' 7 '#1076#1085#1077#1081
          ImageIndex = 110
          Images = fmMain.ImageList
          OnClick = TBItemZaderClick
        end
      end
    end
  end
  inherited Grid: TSasaDBGrid
    Width = 934
    Height = 472
    OnGetCellParams = GridGetCellParams
  end
  inherited StBar: TStatusBar
    Top = 524
    Width = 934
  end
  inherited TBDock24: TTBDock
    Width = 934
  end
  inherited Query: TAdsQuery
    ParamData = <>
  end
  inherited TmpQuery: TAdsQuery
    ParamData = <>
  end
end
