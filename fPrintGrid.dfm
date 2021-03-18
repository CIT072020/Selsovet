object fmPrintGrid: TfmPrintGrid
  Left = 354
  Top = 231
  BorderStyle = bsDialog
  Caption = #1055#1077#1095#1072#1090#1100' '
  ClientHeight = 302
  ClientWidth = 477
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 477
    Height = 105
    Align = alTop
    Caption = ' '#1047#1072#1075#1086#1083#1086#1074#1086#1082' '
    TabOrder = 0
    object edTitle: TDBEditEh
      Left = 4
      Top = 13
      Width = 468
      Height = 87
      AutoSize = False
      EditButtons = <>
      TabOrder = 0
      Visible = True
      WantReturns = True
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 105
    Width = 477
    Height = 152
    Align = alTop
    Caption = ' '#1043#1088#1072#1092#1099' '#1076#1083#1103' '#1087#1077#1095#1072#1090#1080' '
    TabOrder = 1
    object chListGraf: TCheckListBox
      Left = 2
      Top = 15
      Width = 473
      Height = 135
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object btOk: TBitBtn
    Left = 263
    Top = 269
    Width = 90
    Height = 25
    Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1087#1077#1095#1072#1090#1100
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    Default = True
    TabOrder = 2
    OnClick = btOkClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888800000000
      0888888088888880808888000000000008088808888888880008440888888888
      08084F000000000008804F088888888080804CC00000000808004FFF0FFFFFF0
      80804CCCC0F000F000084FFFF0FFFFFF08884CCCCC0F000F08884FFFFF0FFFFF
      F0884CCCCCC0000000884FFFFFFFFF4888884444444444488888}
  end
  object btCancel: TBitBtn
    Left = 371
    Top = 269
    Width = 90
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkCancel
  end
  object Button1: TButton
    Left = 9
    Top = 269
    Width = 76
    Height = 25
    Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1080#1085#1090#1077#1088#1072
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 100
    Top = 269
    Width = 84
    Height = 25
    Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1087#1077#1095#1072#1090#1100' '#1074#1089#1077#1093' '#1075#1088#1072#1092
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1077
    TabOrder = 5
    OnClick = Button2Click
  end
  object PrintGrid: TPrintDBGridEh
    Options = [pghFitGridToPageWidth]
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'Tahoma'
    PageFooter.Font.Style = []
    PageFooter.RightText.Strings = (
      #1089#1090#1088'. &[Page] '#1080#1079' &[Pages]')
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'Tahoma'
    PageHeader.Font.Style = []
    PrintFontName = 'Tahoma'
    Units = MM
    Left = 88
    Top = 41
  end
end
