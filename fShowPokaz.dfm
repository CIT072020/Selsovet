object fmShowPokaz: TfmShowPokaz
  Left = 507
  Top = 255
  AutoScroll = False
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1073#1072#1079#1077
  ClientHeight = 270
  ClientWidth = 384
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ListPokaz: TListView
    Left = 0
    Top = 0
    Width = 384
    Height = 229
    Align = alClient
    AllocBy = 1000
    BevelInner = bvNone
    Columns = <
      item
        AutoSize = True
        Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100
      end
      item
        Caption = #1047#1085#1072#1095#1077#1085#1080#1077
        Width = 90
      end>
    ColumnClick = False
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object Panel1: TPanel
    Left = 0
    Top = 229
    Width = 384
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      384
      41)
    object btOk: TBitBtn
      Left = 268
      Top = 8
      Width = 103
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkOK
    end
  end
end
