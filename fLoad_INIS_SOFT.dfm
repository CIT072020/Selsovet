object fmLoad_INIS_SOFT: TfmLoad_INIS_SOFT
  Left = 422
  Top = 199
  Width = 612
  Height = 419
  Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1048#1053#1048#1057'-'#1057#1054#1060#1058
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
    Width = 596
    Height = 340
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      object gbProtokol: TGroupBox
        Left = 0
        Top = 139
        Width = 588
        Height = 173
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
          588
          173)
        object edDebug: TMemo
          Left = 4
          Top = 14
          Width = 579
          Height = 154
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
        Width = 588
        Height = 139
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object lbZagr: TLabel
          Left = 152
          Top = 13
          Width = 55
          Height = 13
          Caption = #1047#1072#1075#1088#1091#1078#1077#1085#1086
          Visible = False
        end
        object lbProp: TLabel
          Left = 323
          Top = 13
          Width = 58
          Height = 13
          Caption = #1055#1088#1086#1087#1091#1097#1077#1085#1086
          Visible = False
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
        object cbDeleteAll: TCheckBox
          Left = 13
          Top = 41
          Width = 443
          Height = 17
          Hint = 'a'
          Caption = #1055#1077#1088#1077#1076' '#1079#1072#1075#1088#1091#1079#1082#1086#1081' '#1091#1076#1072#1083#1080#1090#1100' '#1088#1072#1085#1077#1077' '#1079#1072#1075#1088#1091#1078#1077#1085#1085#1091#1102' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102
          TabOrder = 1
        end
        object cbSeekID: TCheckBox
          Left = 13
          Top = 59
          Width = 450
          Height = 17
          Hint = 'a'
          Caption = #1048#1089#1082#1072#1090#1100' '#1087#1086' ID '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1048#1053#1048#1057'-'#1057#1054#1060#1058' ('#1076#1083#1103' '#1088#1072#1085#1077#1077' '#1079#1072#1075#1088#1091#1078#1077#1085#1085#1099#1093')'
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = cbSeekIDClick
        end
        object cbNotIN_SeekFIO: TCheckBox
          Left = 480
          Top = 41
          Width = 121
          Height = 17
          Hint = 'a'
          Caption = 
            #1045#1089#1083#1080' '#1095#1077#1083#1086#1074#1077#1082' '#1085#1077' '#1085#1072#1081#1076#1077#1085' '#1087#1086' '#1048#1053' '#1080#1089#1082#1072#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072' '#1087#1086' '#1060#1048#1054'  (  '#1076#1072#1090#1072' '#1088#1086#1078 +
            #1076#1077#1085#1080#1103':'
          TabOrder = 3
          Visible = False
        end
        object cbRewrite: TCheckBox
          Left = 33
          Top = 96
          Width = 419
          Height = 17
          Caption = #1055#1077#1088#1077#1079#1072#1087#1080#1089#1099#1074#1072#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1087#1086' '#1085#1072#1081#1076#1077#1085#1085#1086#1084#1091' '#1095#1077#1083#1086#1074#1077#1082#1091
          TabOrder = 4
        end
        object cbTypeDateR: TComboBox
          Left = 483
          Top = 63
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 5
          Text = #1087#1086#1083#1085#1086#1077' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1077
          Visible = False
          Items.Strings = (
            #1087#1086#1083#1085#1086#1077' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1077
            #1090#1086#1083#1100#1082#1086' '#1075#1086#1076
            #1085#1077' '#1087#1088#1086#1074#1077#1088#1103#1090#1100)
        end
        object cbSeekIN: TCheckBox
          Left = 13
          Top = 78
          Width = 450
          Height = 17
          Hint = 'a'
          Caption = #1048#1089#1082#1072#1090#1100' '#1087#1086' '#1085#1086#1084#1077#1088#1091' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1080' '#1095#1077#1083#1086#1074#1077#1082#1072
          Checked = True
          State = cbChecked
          TabOrder = 6
          OnClick = cbSeekINClick
        end
        object cbWriteAdres: TCheckBox
          Left = 13
          Top = 115
          Width = 380
          Height = 17
          Caption = #1055#1077#1088#1077#1085#1086#1089#1080#1090#1100' '#1072#1076#1088#1077#1089#1072' '#1084#1077#1089#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103' '#1080' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
          Checked = True
          State = cbChecked
          TabOrder = 7
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 596
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
