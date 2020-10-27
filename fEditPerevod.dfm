inherited fmEditPerevod: TfmEditPerevod
  Left = 234
  Top = 214
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1077#1088#1077#1074#1086#1076#1086#1074' '#1085#1072' '#1073#1077#1083#1086#1088#1091#1089#1089#1082#1080#1081
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TSasaDBGrid
    Top = 57
    Height = 276
  end
  inherited TBDock1: TTBDock
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
  object Panel1: TPanel [3]
    Left = 0
    Top = 26
    Width = 750
    Height = 31
    Align = alTop
    TabOrder = 3
    object rbObl: TRadioButton
      Left = 16
      Top = 8
      Width = 81
      Height = 17
      Caption = #1054#1073#1083#1072#1089#1090#1080
      TabOrder = 0
      OnClick = rbOblClick
    end
    object rbRn: TRadioButton
      Left = 127
      Top = 8
      Width = 71
      Height = 17
      Caption = #1056#1072#1081#1086#1085#1099
      TabOrder = 1
      OnClick = rbRnClick
    end
    object rbPunkt: TRadioButton
      Left = 376
      Top = 8
      Width = 159
      Height = 17
      Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1077' '#1087#1091#1085#1082#1090#1099
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = rbPunktClick
    end
    object rbRnGor: TRadioButton
      Left = 238
      Top = 8
      Width = 113
      Height = 17
      Caption = #1056#1072#1081#1086#1085#1099' '#1075#1086#1088#1086#1076#1086#1074
      TabOrder = 3
      OnClick = rbRnGorClick
    end
  end
  inherited PrintGrid: TPrintDBGridEh
    Top = 64
  end
  inherited ImageList: TImageList
    Left = 200
    Top = 64
  end
end
