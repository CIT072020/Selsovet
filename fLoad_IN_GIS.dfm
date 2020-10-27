object fmLoad_IN_GIS: TfmLoad_IN_GIS
  Left = 857
  Top = 121
  Width = 712
  Height = 470
  Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1048#1053' '#1080#1079' '#1092#1072#1081#1083#1072' '#1043#1048#1057' '#1056#1053
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 696
    Height = 391
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      object gbProtokol: TGroupBox
        Left = 0
        Top = 65
        Width = 688
        Height = 298
        Align = alClient
        Caption = ' '#1055#1088#1086#1090#1086#1082#1086#1083' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          688
          298)
        object edDebug: TMemo
          Left = 4
          Top = 14
          Width = 679
          Height = 279
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            '')
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 688
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object lbZagr: TLabel
          Left = 152
          Top = 13
          Width = 55
          Height = 13
          Caption = #1047#1072#1075#1088#1091#1078#1077#1085#1086
        end
        object lbProp: TLabel
          Left = 323
          Top = 13
          Width = 58
          Height = 13
          Caption = #1055#1088#1086#1087#1091#1097#1077#1085#1086
        end
        object Label2: TLabel
          Left = 638
          Top = 50
          Width = 4
          Height = 13
          Caption = ')'
          Visible = False
        end
        object Button1: TButton
          Left = 13
          Top = 7
          Width = 75
          Height = 25
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
          TabOrder = 0
          OnClick = Button1Click
        end
        object cbTypeDateR: TComboBox
          Left = 560
          Top = 7
          Width = 100
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 1
          Text = #1087#1086#1083#1085#1086#1077' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1077
          Visible = False
          Items.Strings = (
            #1087#1086#1083#1085#1086#1077' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1077
            #1090#1086#1083#1100#1082#1086' '#1075#1086#1076
            #1085#1077' '#1087#1088#1086#1074#1077#1088#1103#1090#1100)
        end
        object cbNotLoad: TCheckBox
          Left = 14
          Top = 40
          Width = 419
          Height = 17
          Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1074' '#1087#1088#1086#1090#1086#1082#1086#1083' '#1090#1086#1083#1100#1082#1086' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1085#1077#1079#1072#1075#1088#1091#1078#1077#1085#1085#1099#1093
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 14
      Width = 26
      Height = 13
      Caption = #1060#1072#1081#1083
    end
    object edFile: TDBEditEh
      Left = 53
      Top = 8
      Width = 455
      Height = 24
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = edFileEditButtons0Click
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
    end
  end
  object ChFile: TOpenDialog
    DefaultExt = '*.xls'
    Filter = 'XML (xml)|*.xml'
    Left = 584
    Top = 8
  end
end
