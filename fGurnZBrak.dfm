inherited fmGurnZBrak: TfmGurnZBrak
  Left = 149
  Top = 129
  Width = 951
  Height = 576
  Caption = #1047#1072#1087#1080#1089#1080' '#1072#1082#1090#1086#1074' '#1086' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1080' '#1073#1088#1072#1082#1072
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBDock: TTBDock
    Width = 935
    inherited TBToolbarMenu: TTBToolbar
      inherited TBItemDelayRegister: TTBItem
        Visible = True
      end
    end
  end
  inherited Grid: TSasaDBGrid
    Width = 935
    Height = 488
    OnGetCellParams = GridGetCellParams
  end
  inherited StBar: TStatusBar
    Top = 514
    Width = 935
    OnDrawPanel = nil
  end
  inherited Query: TAdsQuery
    ParamData = <>
  end
  inherited TmpQuery: TAdsQuery
    ParamData = <>
  end
end
