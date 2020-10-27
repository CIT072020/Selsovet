object fmParamQuest: TfmParamQuest
  Left = 626
  Top = 296
  BorderStyle = bsDialog
  ClientHeight = 229
  ClientWidth = 406
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pn: TPanel
    Left = 0
    Top = 188
    Width = 406
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
  end
  object sb: TScrollBox
    Left = 0
    Top = 0
    Width = 406
    Height = 188
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 1
  end
end
