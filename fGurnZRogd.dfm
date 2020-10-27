inherited fmGurnZRogd: TfmGurnZRogd
  Left = 63
  Top = 121
  Width = 976
  Height = 583
  Caption = #1047#1072#1087#1080#1089#1080' '#1072#1082#1090#1086#1074' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBDock: TTBDock
    Width = 960
    inherited TBToolbarMenu: TTBToolbar
      inherited TBItemDelayRegister: TTBItem
        Visible = True
      end
      inherited TBSubSysFlt: TTBSubmenuItem
        object TBItemZader: TTBItem
          Caption = #1047#1072#1076#1077#1088#1078#1082#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1073#1086#1083#1077#1077' 3 '#1084#1077#1089#1103#1094#1077#1074
          Hint = #1047#1072#1076#1077#1088#1078#1082#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1073#1086#1083#1077#1077' 3 '#1084#1077#1089#1103#1094#1077#1074
          ImageIndex = 110
          OnClick = TBItemZaderClick
        end
      end
    end
  end
  inherited Grid: TSasaDBGrid
    Width = 960
    Height = 495
    ReadOnly = False
    OnGetCellParams = GridGetCellParams
  end
  inherited StBar: TStatusBar
    Top = 521
    Width = 960
  end
  inherited Query: TAdsQuery
    ParamData = <>
  end
  inherited TmpQuery: TAdsQuery
    ParamData = <>
  end
end
