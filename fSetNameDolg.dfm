inherited fmSetNameDolg: TfmSetNameDolg
  Left = 266
  Top = 233
  ActiveControl = edRuk
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1077#1081
  ClientHeight = 139
  ClientWidth = 483
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 10
    Top = 22
    Width = 95
    Height = 16
    Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 10
    Top = 54
    Width = 78
    Height = 16
    Caption = #1057#1087#1077#1094#1080#1072#1083#1080#1089#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel1: TPanel
    Top = 95
    Width = 483
    TabOrder = 2
    inherited btOk: TBitBtn
      Left = 271
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    end
    inherited btCancel: TBitBtn
      Left = 375
    end
  end
  object edRuk: TDBEditEh
    Left = 143
    Top = 20
    Width = 332
    Height = 24
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edRukEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'edRuk'
    Visible = True
  end
  object edSpec: TDBEditEh
    Left = 143
    Top = 52
    Width = 332
    Height = 24
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edSpecEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'edSpec'
    Visible = True
  end
end
