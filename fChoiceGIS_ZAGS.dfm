inherited fmChoiceGIS_Class: TfmChoiceGIS_Class
  Left = 429
  Top = 306
  Caption = #1042#1099#1073#1086#1088' '#1086#1088#1075#1072#1085#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TSasaDBGrid
    OnGetCellParams = GridGetCellParams
  end
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
