object fmLoadExcel: TfmLoadExcel
  Left = 389
  Top = 141
  Width = 1003
  Height = 649
  Caption = 'LoadExcel'
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
    Left = 24
    Top = 56
    Width = 37
    Height = 16
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 80
    Width = 67
    Height = 16
    Caption = #1055#1088#1086#1087#1091#1097#1077#1085#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Load'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edDebug: TMemo
    Left = 208
    Top = 8
    Width = 774
    Height = 585
    Lines.Strings = (
      '')
    TabOrder = 1
  end
  object ListBox1: TListBox
    Left = 8
    Top = 120
    Width = 193
    Height = 209
    ItemHeight = 13
    TabOrder = 2
    OnClick = ListBox1Click
  end
  object cbShowExcel: TCheckBox
    Left = 16
    Top = 344
    Width = 161
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object edGraf: TEdit
    Left = 16
    Top = 376
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = 'A3:K2416'
  end
end
