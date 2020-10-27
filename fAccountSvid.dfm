object fmAccountSvid: TfmAccountSvid
  Left = 353
  Top = 174
  Width = 334
  Height = 270
  Caption = 'Свидетельства'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 116
    Width = 32
    Height = 16
    Caption = 'Дата'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 53
    Width = 65
    Height = 16
    Caption = 'Операция'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 148
    Width = 40
    Height = 16
    Caption = 'Серия'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 179
    Width = 70
    Height = 16
    Caption = 'Номера    с'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 187
    Top = 179
    Width = 16
    Height = 16
    Caption = 'по'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 16
    Top = 85
    Width = 25
    Height = 16
    Caption = 'Тип'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 326
    Height = 26
    object TBToolbar: TTBToolbar
      Left = 0
      Top = 0
      AutoResize = False
      Caption = 'Меню'
      CloseButton = False
      DockPos = 8
      DragHandleStyle = dhNone
      FullSize = True
      Images = fmMain.ImageList
      MenuBar = True
      ProcessShortCuts = True
      ShrinkMode = tbsmWrap
      TabOrder = 0
      object TBItemWrite: TTBItem
        Caption = 'Записать'
        DisplayMode = nbdmImageAndText
        Hint = 'Сохранить докумет в базе  F2'
        ImageIndex = 36
        ShortCut = 113
        OnClick = TBItemWriteClick
      end
      object TBItemCancel: TTBItem
        Caption = 'Отказ'
        DisplayMode = nbdmImageAndText
        Hint = 'Выйти без сохранения  Ctrl-F2'
        ImageIndex = 37
        ShortCut = 16497
        OnClick = TBItemCancelClick
      end
      object TBItemZAGS: TTBItem
        Caption = 'Отдел ЗАГС'
        DisplayMode = nbdmImageAndText
        Hint = 'Выбрать ЗАГС выписки документа  F4'
        ImageIndex = 42
        ShortCut = 115
        Visible = False
      end
    end
  end
  object edDate: TDBDateTimeEditEh
    Left = 104
    Top = 114
    Width = 121
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 3
    Visible = True
  end
  object edOper: TDBComboBoxEh
    Left = 104
    Top = 51
    Width = 121
    Height = 21
    EditButtons = <>
    Items.Strings = (
      'Приход'
      'Остаток'
      'Возврат'
      'Удаление'
      'Испорченно'
      'Передача')
    TabOrder = 1
    Text = 'edOper'
    Visible = True
    OnChange = edOperChange
  end
  object edSeria: TDBEditEh
    Left = 104
    Top = 146
    Width = 41
    Height = 21
    EditButtons = <>
    TabOrder = 4
    Text = 'edSeria'
    Visible = True
  end
  object edNomer1: TDBEditEh
    Left = 104
    Top = 177
    Width = 57
    Height = 21
    EditButtons = <>
    MaxLength = 7
    TabOrder = 5
    Text = '       '
    Visible = True
    EditMask = '0000000;1;_'
  end
  object edNomer2: TDBEditEh
    Left = 227
    Top = 177
    Width = 57
    Height = 21
    EditButtons = <>
    MaxLength = 7
    TabOrder = 6
    Text = '       '
    Visible = True
    EditMask = '0000000;1;_'
  end
  object edType: TDBComboBoxEh
    Left = 104
    Top = 83
    Width = 121
    Height = 21
    EditButtons = <>
    TabOrder = 2
    Text = 'edType'
    Visible = True
  end
end
