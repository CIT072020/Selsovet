object fmLoadIN_Mens: TfmLoadIN_Mens
  Left = 453
  Top = 255
  Width = 844
  Height = 478
  Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1077' '#1085#1086#1084#1077#1088#1072
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
    Width = 828
    Height = 399
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      object gbProtokol: TGroupBox
        Left = 0
        Top = 110
        Width = 820
        Height = 225
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
          820
          225)
        object edDebug: TMemo
          Left = 4
          Top = 14
          Width = 811
          Height = 206
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
        Width = 820
        Height = 110
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
          Left = 417
          Top = 46
          Width = 4
          Height = 13
          Caption = ')'
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
        object cbShowExcel: TCheckBox
          Left = 694
          Top = 6
          Width = 116
          Height = 17
          Hint = 'a'
          Caption = #1055#1086#1082#1072#1079#1072#1090#1100' Excel'
          TabOrder = 1
        end
        object cbTypeDateR: TComboBox
          Left = 258
          Top = 43
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 2
          Text = #1090#1086#1083#1100#1082#1086' '#1075#1086#1076
          OnChange = cbTypeDateRChange
          Items.Strings = (
            #1087#1086#1083#1085#1086#1077' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1077
            #1090#1086#1083#1100#1082#1086' '#1075#1086#1076
            #1085#1077' '#1087#1088#1086#1074#1077#1088#1103#1090#1100)
        end
        object StaticText1: TStaticText
          Left = 17
          Top = 46
          Width = 231
          Height = 17
          Caption = #1048#1089#1082#1072#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072' '#1087#1086' '#1060#1048#1054'  (  '#1076#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
          TabOrder = 3
        end
        object cbRewrite: TCheckBox
          Left = 17
          Top = 66
          Width = 357
          Height = 17
          Hint = 'a'
          Caption = #1055#1077#1088#1077#1079#1072#1087#1080#1089#1099#1074#1072#1090#1100' '#1083#1080#1095#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1077#1089#1083#1080' '#1074' '#1073#1072#1079#1077' '#1086#1085' '#1085#1077' '#1087#1091#1089#1090#1086#1081
          TabOrder = 4
        end
        object cbDateR: TCheckBox
          Left = 17
          Top = 86
          Width = 357
          Height = 17
          Hint = 'a'
          Caption = #1047#1072#1087#1080#1089#1099#1074#1072#1090#1100' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086' '#1076#1072#1090#1091' '#1088#1086#1078#1076#1077#1085#1080#1103
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object cbEmptyDateR: TCheckBox
          Left = 449
          Top = 45
          Width = 336
          Height = 17
          Hint = 'a'
          Caption = #1042#1082#1083#1102#1095#1072#1090#1100' '#1074' '#1087#1086#1080#1089#1082' '#1083#1102#1076#1077#1081' '#1089' '#1087#1091#1089#1090#1086#1081' '#1076#1072#1090#1086#1081' '#1088#1086#1078#1076#1077#1085#1080#1103
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 335
        Width = 820
        Height = 36
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object btCopyToClipboard: TButton
          Left = 13
          Top = 4
          Width = 153
          Height = 25
          Caption = #1055#1088#1086#1090#1086#1082#1086#1083' '#1074' '#1073#1091#1092#1077#1088' '#1086#1073#1084#1077#1085#1072
          TabOrder = 0
          OnClick = btCopyToClipboardClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      ImageIndex = 1
      object Label4: TLabel
        Left = 176
        Top = 46
        Width = 149
        Height = 13
        Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1089#1090#1088#1086#1082#1072' '#1089' '#1076#1072#1085#1085#1099#1084#1080
        Enabled = False
      end
      object Label5: TLabel
        Left = 176
        Top = 91
        Width = 143
        Height = 13
        Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1089#1090#1088#1086#1082#1072' '#1089' '#1076#1072#1085#1085#1099#1084#1080
        Enabled = False
      end
      object Label6: TLabel
        Left = 7
        Top = 46
        Width = 145
        Height = 13
        Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1075#1088#1072#1092#1072' '#1089' '#1076#1072#1085#1085#1099#1084#1080
        Enabled = False
      end
      object Label7: TLabel
        Left = 7
        Top = 91
        Width = 139
        Height = 13
        Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1075#1088#1072#1092#1072' '#1089' '#1076#1072#1085#1085#1099#1084#1080
        Enabled = False
      end
      object cbCheckExit: TCheckBox
        Left = 272
        Top = 112
        Width = 173
        Height = 17
        Caption = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 0
      end
      object vlGrafs: TValueListEditor
        Left = 474
        Top = 6
        Width = 339
        Height = 139
        DefaultColWidth = 300
        Enabled = False
        FixedCols = 1
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goAlwaysShowEditor, goThumbTracking]
        ScrollBars = ssNone
        Strings.Strings = (
          #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088'=1'
          #1060#1072#1084#1080#1083#1080#1103'=2'
          #1048#1084#1103'=3'
          #1054#1090#1095#1077#1089#1090#1074#1086'=4'
          #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103'=5')
        TabOrder = 1
        TitleCaptions.Strings = (
          #1053#1072#1079#1074#1072#1085#1080#1077
          #8470)
        OnValidate = vlGrafsValidate
        ColWidths = (
          300
          33)
        RowHeights = (
          18
          18
          18
          18
          18
          18)
      end
      object edRow1: TDBNumberEditEh
        Left = 176
        Top = 65
        Width = 76
        Height = 21
        DecimalPlaces = 0
        Enabled = False
        EditButton.Style = ebsUpDownEh
        EditButton.Visible = True
        EditButtons = <>
        MaxValue = 50000.000000000000000000
        MinValue = 1.000000000000000000
        TabOrder = 2
        Value = 2.000000000000000000
        Visible = True
      end
      object edRow2: TDBNumberEditEh
        Left = 176
        Top = 110
        Width = 76
        Height = 21
        DecimalPlaces = 0
        Enabled = False
        EditButton.Style = ebsUpDownEh
        EditButton.Visible = True
        EditButtons = <>
        MaxValue = 50000.000000000000000000
        MinValue = 1.000000000000000000
        TabOrder = 3
        Value = 50000.000000000000000000
        Visible = True
      end
      object edGraf1: TDBEditEh
        Left = 7
        Top = 65
        Width = 44
        Height = 21
        EditButtons = <>
        Enabled = False
        TabOrder = 4
        Text = 'A'
        Visible = True
      end
      object edGraf2: TDBEditEh
        Left = 7
        Top = 110
        Width = 44
        Height = 21
        EditButtons = <>
        Enabled = False
        TabOrder = 5
        Text = 'E'
        Visible = True
      end
      object Button2: TButton
        Left = 32
        Top = 161
        Width = 75
        Height = 25
        Caption = 'Button2'
        TabOrder = 6
        Visible = False
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 5
        Top = 7
        Width = 201
        Height = 25
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1079#1072#1075#1088#1091#1079#1082#1080
        TabOrder = 7
        OnClick = Button3Click
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 828
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
      Width = 388
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
    Filter = 'Excel|*.xls'
    Left = 464
    Top = 8
  end
end
