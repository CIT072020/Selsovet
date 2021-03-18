inherited fmGurnUZUstOtc: TfmGurnUZUstOtc
  Left = 372
  Top = 226
  Caption = #1046#1091#1088#1085#1072#1083' '#1091#1095#1077#1090#1072' '#1079#1072#1103#1074#1083#1077#1085#1080#1081' '#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103' '#1086#1090#1094#1086#1074#1089#1090#1074#1072
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBDock: TTBDock
    inherited TBToolbarMenu: TTBToolbar
      object TBItemOpenZUstOtc: TTBItem [3]
        Caption = #1047'/'#1072' '#1086#1073' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1080' '#1086#1090#1094#1086#1074#1089#1090#1074#1072
        Hint = #1054#1090#1082#1088#1099#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086#1073' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1080' '#1086#1090#1094#1086#1074#1089#1090#1074#1072
        ImageIndex = 86
        OnClick = TBItemOpenZUstOtcClick
      end
      inherited TBSubSysFlt: TTBSubmenuItem
        Visible = False
        object TBItemZader: TTBItem
          Caption = #1047#1072#1076#1077#1088#1078#1082#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1073#1086#1083#1077#1077' 7 '#1076#1085#1077#1081
          Hint = #1047#1072#1076#1077#1088#1078#1082#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1073#1086#1083#1077#1077' 7 '#1076#1085#1077#1081
          ImageIndex = 110
          OnClick = TBItemZaderClick
        end
      end
      inherited TBSubChoiceFlt: TTBSubmenuItem
        Visible = False
      end
      inherited TBItemFlt: TTBItem
        Visible = False
      end
      inherited TBItemRepeatFilter: TTBItem
        Visible = False
      end
    end
  end
  inherited Grid: TSasaDBGrid
    OnGetCellParams = GridGetCellParams
  end
  inherited TBDock24: TTBDock
    inherited TBToolbarMenu24: TTBToolbar
      object TBItemOpenZUstOtc24: TTBItem [3]
        Caption = #1047'/'#1072' '#1086#1073' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1080' '#1086#1090#1094#1086#1074#1089#1090#1074#1072
        ImageIndex = 4
      end
    end
  end
  inherited Query: TAdsQuery
    ParamData = <>
  end
  inherited TmpQuery: TAdsQuery
    ParamData = <>
  end
end
