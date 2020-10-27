object fmArxivZAGS: TfmArxivZAGS
  Left = 252
  Top = 201
  Width = 653
  Height = 402
  Caption = 'Архив'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TSasaDBGrid
    Left = 0
    Top = 26
    Width = 645
    Height = 342
    Align = alClient
    Ctl3D = True
    DrawMemoText = True
    EditActions = [geaCopyEh, geaSelectAllEh]
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    EnterDirection = mdNextGraph
    OptionsS = [dgsSelectCurrentColor]
    SelRowColor = clAqua
    Color1 = clBlack
    Color2 = clBlack
    TypeSave = 0
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 645
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Stretch = True
      TabOrder = 0
    end
    object TBToolWindow1: TTBToolWindow
      Left = 444
      Top = 0
      Anchors = [akTop, akRight]
      Caption = 'TBToolWindow'
      ClientAreaHeight = 22
      ClientAreaWidth = 191
      DockPos = 448
      TabOrder = 1
      object edType: TDBComboBoxEh
        Left = 3
        Top = 0
        Width = 155
        Height = 21
        EditButtons = <>
        Items.Strings = (
          'Браки'
          'Разводы'
          'Рождения'
          'Смерти'
          'Установление отцовства'
          'Усыновление'
          'Перемена имени')
        TabOrder = 0
        Visible = True
      end
    end
  end
  object tbAlfavit: TAdsTable
    StoreActive = True
    Left = 56
    Top = 96
  end
end
