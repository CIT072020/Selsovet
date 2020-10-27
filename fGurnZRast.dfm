inherited fmGurnZRast: TfmGurnZRast
  Left = 534
  Top = 258
  Caption = #1047#1072#1087#1080#1089#1080' '#1072#1082#1090#1086#1074' '#1086' '#1088#1072#1089#1090#1086#1088#1078#1077#1085#1080#1080' '#1073#1088#1072#1082#1072
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBDock: TTBDock
    inherited TBToolbarMenu: TTBToolbar
      inherited TBItemDelayRegister: TTBItem
        Visible = True
      end
    end
  end
  inherited Grid: TSasaDBGrid
    OnGetCellParams = GridGetCellParams
  end
  inherited Query: TAdsQuery
    ParamData = <>
  end
  inherited TmpQuery: TAdsQuery
    ParamData = <>
  end
end
