inherited fmChoiceAkt: TfmChoiceAkt
  Left = 380
  Top = 264
  Caption = #1042#1099#1073#1086#1088' '#1072#1082#1090#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBDock: TTBDock
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
      inherited TBItemDetail: TTBSubmenuItem
        Visible = False
      end
      inherited TBItemOneDetail: TTBItem
        Visible = False
      end
    end
  end
  inherited DataSource: TDataSource
    Left = 106
    Top = 84
  end
  inherited puMenu: TPopupMenu
    Left = 57
  end
  inherited ImageList: TTBImageList
    Left = 176
    Top = 72
  end
end
