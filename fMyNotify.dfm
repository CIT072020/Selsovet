object fmMyNotify: TfmMyNotify
  Left = 658
  Top = 372
  AlphaBlendValue = 180
  BorderStyle = bsToolWindow
  Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
  ClientHeight = 162
  ClientWidth = 484
  Color = clInfoBk
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 64
    Height = 13
    Caption = 'Hello Wolrd!!!'
  end
  object Memo: TMemo
    Left = 0
    Top = 0
    Width = 484
    Height = 162
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    OnDblClick = MemoDblClick
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 8
    Top = 8
  end
end
