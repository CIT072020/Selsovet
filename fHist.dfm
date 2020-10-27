object fmHist: TfmHist
  Left = 380
  Top = 232
  AutoScroll = False
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
  ClientHeight = 172
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 128
    Width = 390
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btDel: TBitBtn
      Left = 205
      Top = 8
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 0
      OnClick = btDelClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        0000000000000000000000900000000009000999000000000000099990000000
        9000009990000009000000099900009900000000999009900000000009999900
        0000000000999000000000000999990000000000999009900000009999000099
        0000099990000009900009990000000009000000000000000000}
    end
    object btClose: TBitBtn
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 1
      Kind = bkOK
    end
  end
  object Grid: TDBGridEh
    Left = 0
    Top = 0
    Width = 390
    Height = 128
    Align = alClient
    DataSource = DataSource
    DrawMemoText = True
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    RowSizingAllowed = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'StringValue'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
        Width = 264
      end
      item
        DisplayFormat = 'dd.mm.yyyy'
        EditButtons = <>
        FieldName = 'DateIzm'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 80
      end>
  end
  object DataSource: TDataSource
    DataSet = fmSimpleD.HistZAGS
    Left = 296
    Top = 48
  end
end
