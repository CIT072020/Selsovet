inherited fmChoiceUlica: TfmChoiceUlica
  Left = 386
  Top = 197
  Width = 511
  Caption = 'Выберите улицу'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TSasaDBGrid
    Width = 503
    Height = 246
  end
  inherited pn: TPanel
    Width = 503
    inherited StBar: TStatusBar
      Width = 501
    end
  end
  inherited TBDock: TTBDock
    Width = 503
    inherited TBToolbar: TTBToolbar
      inherited TBItemDetail: TTBSubmenuItem
        Visible = False
      end
      inherited TBItemOneDetail: TTBItem
        Visible = False
      end
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 272
    Width = 503
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Label2: TLabel
      Left = 7
      Top = 7
      Width = 32
      Height = 13
      Caption = 'Улица'
    end
    object edUL: TDBEditEh
      Left = 53
      Top = 4
      Width = 109
      Height = 21
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
  end
end
