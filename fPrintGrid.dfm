object fmPrintGrid: TfmPrintGrid
  Left = 217
  Top = 137
  BorderStyle = bsDialog
  Caption = 'Печать '
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
    Caption = ' Заголовок '
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
    Caption = ' Графы для печати '
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
    Hint = 'Выполнить печать'
    Caption = 'Выполнить'
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
    Caption = 'Выход'
    TabOrder = 3
    Kind = bkCancel
  end
  object Button1: TButton
    Left = 9
    Top = 269
    Width = 76
    Height = 25
    Hint = 'Настройка принтера'
    Caption = 'Настройка '
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 100
    Top = 269
    Width = 84
    Height = 25
    Hint = 'Отменить печать всех граф'
    Caption = 'Очистить все'
    TabOrder = 5
    OnClick = Button2Click
  end
  object PrintGrid: TPrintDBGridEh
    Options = [pghFitGridToPageWidth]
    Page.BottomMargin = 1
    Page.LeftMargin = 1
    Page.RightMargin = 1
    Page.TopMargin = 1
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'Tahoma'
    PageFooter.Font.Style = []
    PageFooter.RightText.Strings = (
      'стр. &[Page] из &[Pages]')
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
