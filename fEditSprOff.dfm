inherited fmEditSprOff: TfmEditSprOff
  Left = 432
  Top = 228
  Width = 726
  Height = 420
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1076#1086#1083#1078#1085#1086#1089#1090#1085#1099#1093' '#1083#1080#1094
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TSasaDBGrid
    Top = 57
    Width = 710
    Height = 303
  end
  inherited TBDock1: TTBDock
    Width = 710
    Height = 26
    inherited TBToolbar: TTBToolbar
      inherited TBItemPreView: TTBItem
        Visible = False
      end
      inherited TBItemDetail: TTBSubmenuItem
        Visible = False
      end
      inherited TBItemOneDetail: TTBItem
        Visible = False
      end
      inherited TBSubItemRun: TTBSubmenuItem
        Visible = False
      end
      inherited tbClr: TTBItem
        Visible = False
      end
    end
  end
  inherited pn: TPanel
    Top = 360
    Width = 710
    inherited StBar: TStatusBar
      Width = 708
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 26
    Width = 710
    Height = 31
    Align = alTop
    TabOrder = 3
    Visible = False
  end
  inherited PrintGrid: TPrintDBGridEh
    Top = 64
  end
  inherited ImageList: TImageList
    Left = 200
    Top = 64
  end
end
