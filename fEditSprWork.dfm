inherited fmEditSprWork: TfmEditSprWork
  Left = 468
  Top = 211
  Width = 726
  Height = 420
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081
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
      object TBItemSetSMDO: TTBItem [10]
        Caption = #1057#1052#1044#1054
        DisplayMode = nbdmImageAndText
        Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1089#1086' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1084' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081' '#1057#1052#1044#1054
        ImageIndex = 12
        OnClick = TBItemSetSMDOClick
      end
      object TBItemAddSMDO: TTBItem [11]
        Caption = '2222222'#1057#1052#1044#1054
        DisplayMode = nbdmImageAndText
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1084' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081' '#1057#1052#1044#1054
        ImageIndex = 12
        Visible = False
        OnClick = TBItemAddSMDOClick
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
