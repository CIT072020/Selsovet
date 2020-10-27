inherited fmGurnZOpeka: TfmGurnZOpeka
  Left = 437
  Top = 210
  Caption = #1046#1091#1088#1085#1072#1083' '#1086#1087#1077#1082#1080' '#1080' '#1087#1086#1087#1077#1095#1080#1090#1077#1083#1100#1089#1090#1074#1072
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBDock: TTBDock
    inherited TBToolbarMenu: TTBToolbar
      Stretch = True
      inherited TBItemAddDok: TTBItem
        Hint = #1044#1086#1074#1072#1074#1080#1090#1100
        Visible = True
      end
      inherited TBItemGrantSprav: TTBItem
        Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
        Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      end
      inherited TBItemDelayRegister: TTBItem
        Visible = True
      end
      object TBItemVigr: TTBItem [14]
        Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1079#1072#1087#1080#1089#1080
        Hint = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1079#1072#1087#1080#1089#1080
        ImageIndex = 21
        OnClick = TBItemVigrClick
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
