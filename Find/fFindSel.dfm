object fmSelVal: TfmSelVal
  Left = 348
  Top = 122
  Width = 502
  Height = 477
  ActiveControl = dgSpr
  Caption = #1042#1099#1073#1086#1088' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    000000000000008888888000BB000080808080000000008888888000BB000080
    80800000BB00008888880BB00BB0008080800BB00BB00CCCCCCC0BB00BB00008
    88880BBBBBB00008080880BBBB00000888888800000000080808080000000008
    888888000000000808080800000000CCCCCCCCC0000000000000000000008021
    000080210000802100008021000080010000800000008000000080000000C000
    0000C0010000C0030000C01F0000C01F0000C01F0000C01F0000FFFF0000}
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  DesignSize = (
    486
    439)
  PixelsPerInch = 96
  TextHeight = 13
  object laSpr: TLabel
    Left = 3
    Top = 3
    Width = 486
    Height = 17
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BiDiMode = bdLeftToRight
    Color = clInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object btOk: TButton
    Left = 311
    Top = 405
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = #1054#1050
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btCancel: TButton
    Left = 400
    Top = 405
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object dgSpr: TDBGridEh
    Left = 4
    Top = 24
    Width = 477
    Height = 361
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsSpr
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dgSprDblClick
  end
  object dsSpr: TDataSource
    Left = 352
    Top = 192
  end
end
