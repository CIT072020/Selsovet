object fmdomUlPunkt: TfmdomUlPunkt
  Left = 528
  Top = 195
  Width = 145
  Height = 380
  BorderIcons = [biSystemMenu]
  Caption = #1044#1086#1084#1072
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
  object cbDomKorp: TCheckListBox
    Left = 0
    Top = 26
    Width = 137
    Height = 320
    Align = alClient
    ItemHeight = 13
    TabOrder = 0
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 137
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      CloseButton = False
      DragHandleStyle = dhNone
      FullSize = True
      Images = fmMain.ImageList
      MenuBar = True
      ProcessShortCuts = True
      ShrinkMode = tbsmWrap
      TabOrder = 0
      object TBItem2: TTBItem
        Caption = #1042#1099#1093#1086#1076
        DisplayMode = nbdmImageAndText
        ImageIndex = 36
        OnClick = TBItem2Click
      end
    end
  end
end
