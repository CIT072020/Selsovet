object fmDeleteSvid: TfmDeleteSvid
  Left = 296
  Top = 248
  BorderStyle = bsDialog
  Caption = 'Удаление свидетельств'
  ClientHeight = 219
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbDate: TLabel
    Left = 16
    Top = 86
    Width = 102
    Height = 16
    Caption = 'Дата прихода'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Lb: TLabel
    Left = 17
    Top = 114
    Width = 377
    Height = 97
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object lbType: TLabel
    Left = 16
    Top = 52
    Width = 29
    Height = 16
    Caption = 'Тип'
    FocusControl = edTypeSvid
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 405
    Height = 39
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      CloseButton = False
      DockMode = dmCannotFloat
      DragHandleStyle = dhNone
      FullSize = True
      Images = fmMain.ImageList
      Options = [tboImageAboveCaption]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object TBItem1: TTBItem
        Caption = 'Выполнить'
        Hint = 'Выполнить операцию'
        ImageIndex = 7
        OnClick = TBItem1Click
      end
      object TBItem2: TTBItem
        Caption = 'Выход'
        Hint = 'Выход'
        ImageIndex = 62
        OnClick = TBItem2Click
      end
    end
  end
  object edDatePrix: TDBLookupComboboxEh
    Left = 136
    Top = 82
    Width = 127
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'DATEP'
    ListField = 'DATEP'
    ListSource = DataSource1
    ParentFont = False
    TabOrder = 1
    Visible = True
  end
  object edTypeSvid: TDBComboBoxEh
    Left = 136
    Top = 48
    Width = 166
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'edTypeSvid'
    Visible = True
    OnChange = edTypeSvidChange
  end
  object AdsQuery1: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    StoreActive = True
    SQL.Strings = (
      'SELECT distinct DATEP FROM ListSvid ')
    AdsConnection = dmBase.AdsConnection
    Left = 288
    Top = 134
    ParamData = <>
  end
  object DataSource1: TDataSource
    DataSet = AdsQuery1
    Left = 320
    Top = 134
  end
  object AdsQuery2: TAdsQuery
    StoreActive = True
    AdsConnection = dmBase.AdsConnection
    Left = 344
    Top = 56
    ParamData = <>
  end
end
