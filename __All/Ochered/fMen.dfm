inherited fmMen: TfmMen
  Left = 407
  Top = 81
  Caption = #1054#1095#1077#1088#1077#1076#1085#1080#1082
  ClientHeight = 776
  ClientWidth = 884
  Constraints.MinHeight = 700
  Constraints.MinWidth = 900
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF007000
    00000CCC40007FFFFFFF0CC400007FCFCCCF044400007FFFFFFF0F8000007FCF
    CCCF000000007FFFFFFF0FFF80007FCFCCCF0FFFF8007FFFFFFF0FFFFF007FCF
    CCFF0FFFFF807FFFFF770FFFFF007FFFFF7F0FFFFC0077777700000FFF000000
    000000000F800000000000000000000000000000000000000000000000000007
    0000000F0000000F0000000F0000000700000003000000010000000100000000
    0000000100000001000000010000F0000000F8000000FC010000FE070000}
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label31: TLabel [0]
    Left = 8
    Top = 168
    Width = 149
    Height = 13
    Caption = #1057' '#1082#1072#1082#1086#1081' '#1076#1072#1090#1099' '#1087#1088#1086#1078#1080#1074#1072#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited TBDock: TTBDock
    Width = 884
    inherited TBToolbar: TTBToolbar
      DockPos = 0
      inherited TBItemDelList: TTBItem
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
        Visible = False
      end
      object TBSubRunOchered: TTBSubmenuItem [5]
        Caption = #1054#1095#1077#1088#1077#1076#1100
        ImageIndex = 26
        Visible = False
        object TBItemStep1: TTBItem
          Caption = '1. '#1058#1080#1087' '#1086#1087#1077#1088#1072#1094#1080#1080
          Checked = True
          OnClick = TBItemStep1Click
        end
        object TBItemStep2: TTBItem
          Caption = '2. '#1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1088#1077#1096#1077#1085#1080#1077
          OnClick = TBItemStep2Click
        end
        object TBItemStep3: TTBItem
          Caption = '3. '#1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1080#1079#1074#1077#1097#1077#1085#1080#1077
          OnClick = TBItemStep3Click
        end
        object TBItemStep4: TTBItem
          Caption = '3. '#1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1080' '#1079#1072#1087#1080#1089#1072#1090#1100
          ImageIndex = 7
          Images = fmMain.ImageList
          OnClick = TBItemStep4Click
        end
      end
      inherited TBSubmenuRun: TTBSubmenuItem
        Visible = True
      end
    end
    inherited TBToolbarMove: TTBToolbar
      Left = 664
      DockPos = 664
    end
  end
  inherited sb: TScrollBox
    Width = 884
    Height = 731
    object pc: TPageControl
      Left = 0
      Top = 241
      Width = 884
      Height = 490
      ActivePage = tsOchered
      Align = alClient
      TabOrder = 2
      TabStop = False
      OnChange = pcChange
      object tsOchered: TTabSheet
        Caption = #1054#1089#1085#1086#1074#1085#1086#1077
        ImageIndex = 4
        object pnSostavOchered: TPanel
          Left = 0
          Top = 237
          Width = 876
          Height = 225
          Align = alClient
          BevelOuter = bvNone
          Constraints.MinHeight = 225
          TabOrder = 1
          object Panel4: TPanel
            Left = 836
            Top = 0
            Width = 40
            Height = 225
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object btAddMen: TBitBtn
              Left = 8
              Top = 23
              Width = 28
              Height = 28
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100
              TabOrder = 0
              OnClick = btAddMenClick
            end
            object btDelMen: TBitBtn
              Left = 8
              Top = 89
              Width = 28
              Height = 28
              Hint = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 1
              OnClick = btDelMenClick
            end
            object btEdit: TBitBtn
              Left = 8
              Top = 56
              Width = 28
              Height = 28
              Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100
              TabOrder = 2
              OnClick = btEditClick
            end
            object btUp: TBitBtn
              Left = 8
              Top = 133
              Width = 20
              Height = 25
              Hint = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072' '#1074#1074#1077#1088#1093
              TabOrder = 3
              OnClick = btUpClick
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
                0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000000000008000000080000000800000000000
                0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
                0000000000000000000000000000000000008000000080000000800000000000
                000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
                C000000000008000000080000000800000008000000080000000800000008000
                0000800000008000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C0000000000080000000800000008000000080000000800000008000
                00008000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C00000000000800000008000000080000000800000008000
                000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000000000008000000080000000800000000000
                0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000000000008000000000000000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
            end
            object btDown: TBitBtn
              Left = 8
              Top = 163
              Width = 20
              Height = 25
              Hint = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072' '#1074#1085#1080#1079
              TabOrder = 4
              OnClick = btDownClick
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000800000000000
                0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080000000800000008000
                000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000000000008000000080000000800000008000
                00008000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C00000000000800000008000000080000000800000008000
                0000800000008000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C0000000000080000000800000008000000080000000800000008000
                000080000000800000008000000000000000C0C0C000C0C0C000C0C0C000C0C0
                C000000000000000000000000000000000000000000080000000800000008000
                00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080000000800000008000
                000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
                000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
            end
          end
          object pcOchered: TPageControl
            Left = 0
            Top = 0
            Width = 836
            Height = 225
            ActivePage = tsOchSostav
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 1
            OnChange = pcOcheredChange
            object tsResh: TTabSheet
              Caption = #1056#1077#1096#1077#1085#1080#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ImageIndex = 4
              ParentFont = False
              object GridResh: TDBGridEh
                Left = 0
                Top = 0
                Width = 828
                Height = 197
                Align = alClient
                DataSource = dsOcheredResh
                DrawMemoText = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                FooterColor = clWindow
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -11
                FooterFont.Name = 'Tahoma'
                FooterFont.Style = [fsBold]
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
                ParentFont = False
                ReadOnly = True
                RowLines = 4
                RowSizingAllowed = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = [fsBold]
                UseMultiTitle = True
                OnDblClick = GridReshDblClick
                OnGetCellParams = GridReshGetCellParams
                Columns = <
                  item
                    Alignment = taLeftJustify
                    EditButtons = <>
                    FieldName = 'TIP'
                    Footers = <>
                    Title.Caption = #1058#1080#1087
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Width = 135
                    WordWrap = True
                    OnGetCellParams = GridReshColumns0GetCellParams
                  end
                  item
                    Alignment = taRightJustify
                    EditButtons = <>
                    FieldName = 'NOMER'
                    Footers = <>
                    Title.Caption = #1053#1086#1084#1077#1088
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'DATER'
                    Footers = <>
                    Title.Caption = #1044#1072#1090#1072
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Width = 83
                  end
                  item
                    EditButtons = <>
                    FieldName = 'OSNOV_TEXT'
                    Footers = <>
                    Title.Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Width = 420
                    OnGetCellParams = GridReshColumns3GetCellParams
                  end
                  item
                    EditButtons = <>
                    FieldName = 'OTKAZ'
                    Footers = <>
                    Title.Caption = #1054#1090#1082#1072'- '#1079#1072#1085#1086
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Visible = False
                    Width = 38
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ADDINFO'
                    Footers = <>
                    Title.Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Visible = False
                    Width = 213
                  end
                  item
                    EditButtons = <>
                    FieldName = 'TEXT'
                    Footers = <>
                    Title.Caption = #1058#1077#1082#1089#1090' '#1088#1077#1096#1077#1085#1080#1103
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Visible = False
                    Width = 218
                  end
                  item
                    EditButtons = <>
                    FieldName = 'OCHERED_ID'
                    Footers = <>
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Visible = False
                  end
                  item
                    EditButtons = <>
                    FieldName = 'AUTO_ID'
                    Footers = <>
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Visible = False
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ID_INTERNAL'
                    Footers = <>
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Visible = False
                    Width = 35
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ID2'
                    Footers = <>
                    Visible = False
                  end>
              end
            end
            object tsOchSostav: TTabSheet
              Caption = #1057#1086#1089#1090#1072#1074' '#1089#1077#1084#1100#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              object GridSostav: TDBGridEh
                Left = 0
                Top = 0
                Width = 828
                Height = 171
                Align = alClient
                BorderStyle = bsNone
                DataSource = dsSostavSem
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                FooterColor = clWindow
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -11
                FooterFont.Name = 'Tahoma'
                FooterFont.Style = [fsBold]
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                UseMultiTitle = True
                OnDblClick = GridSostavDblClick
                OnGetCellParams = GridSostavGetCellParams
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'NOMER'
                    Footer.Value = #1042#1089#1077#1075#1086
                    Footer.ValueType = fvtStaticText
                    Footers = <
                      item
                      end>
                    Title.Caption = #8470
                    Width = 26
                  end
                  item
                    Alignment = taLeftJustify
                    EditButtons = <>
                    FieldName = 'OTNOSH'
                    Footers = <>
                    Title.Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077
                    Width = 81
                  end
                  item
                    EditButtons = <>
                    FieldName = 'FAMILIA'
                    Footers = <>
                    Title.Caption = #1060#1072#1084#1080#1083#1080#1103
                    Width = 102
                  end
                  item
                    EditButtons = <>
                    FieldName = 'NAME'
                    Footers = <>
                    Title.Caption = #1048#1084#1103
                    Width = 89
                  end
                  item
                    EditButtons = <>
                    FieldName = 'OTCH'
                    Footers = <>
                    Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
                    Width = 107
                  end
                  item
                    EditButtons = <>
                    FieldName = 'DATER'
                    Footers = <>
                    Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
                    Width = 88
                  end
                  item
                    EditButtons = <>
                    FieldName = 'DATEP'
                    Footers = <>
                    Title.Caption = #1044#1072#1090#1072' '#1074#1082#1083#1102#1095#1077#1085#1080#1103
                    Width = 93
                  end
                  item
                    EditButtons = <>
                    FieldName = 'LICH_NOMER'
                    Footers = <>
                    Title.Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
                    Width = 152
                  end
                  item
                    EditButtons = <>
                    FieldName = 'POL'
                    Footers = <>
                    Title.Caption = #1055#1086#1083
                    Width = 67
                  end
                  item
                    Alignment = taLeftJustify
                    EditButtons = <>
                    FieldName = 'PRICH'
                    Footers = <>
                    Title.Caption = #1055#1088#1080#1095#1080#1085#1072
                    Width = 106
                  end
                  item
                    EditButtons = <>
                    FieldName = 'PASP_VIDAN'
                    Footers = <>
                    Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1080#1081' '#1083#1080#1095#1085#1086#1089#1090#1100
                    Width = 365
                    OnGetCellParams = GridSostavColumns8GetCellParams
                  end>
              end
              object Panel3: TPanel
                Left = 0
                Top = 171
                Width = 828
                Height = 26
                Align = alBottom
                BevelOuter = bvLowered
                TabOrder = 1
                DesignSize = (
                  828
                  26)
                object Label88: TLabel
                  Left = 13
                  Top = 8
                  Width = 33
                  Height = 13
                  Caption = #1042#1089#1077#1075#1086
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label36: TLabel
                  Left = 138
                  Top = 8
                  Width = 132
                  Height = 13
                  Caption = #1044#1086#1093#1086#1076' '#1085#1072' '#1095#1083#1077#1085#1072' '#1089#1077#1084#1100#1080
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object edKolvoSostav: TDBNumberEditEh
                  Left = 58
                  Top = 3
                  Width = 39
                  Height = 22
                  DataField = 'KOLVO_SOSTAV'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  Flat = True
                  ParentFont = False
                  TabOrder = 0
                  Visible = True
                end
                object btIsk2Vkl: TButton
                  Left = 730
                  Top = 4
                  Width = 79
                  Height = 22
                  Hint = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1095#1077#1083#1086#1074#1077#1082#1072' '#1080#1079'  '#1089#1086#1089#1090#1072#1074#1072' '#1089#1077#1084#1100#1080
                  Anchors = [akTop, akRight]
                  Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  Visible = False
                  OnClick = btIsk2VklClick
                end
                object edDoxod: TDBNumberEditEh
                  Left = 286
                  Top = 2
                  Width = 93
                  Height = 24
                  DataField = 'DOXOD_SUMMA'
                  DataSource = dsDokument
                  DisplayFormat = '### ### ###.##'
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  Visible = True
                end
              end
            end
            object tsOchLgot: TTabSheet
              Caption = #1054#1090#1076#1077#1083#1100#1085#1072#1103' '#1086#1095#1077#1088#1077#1076#1100
              ImageIndex = 1
              object GridOchered: TDBGridEh
                Left = 0
                Top = 0
                Width = 828
                Height = 172
                Align = alClient
                DataSource = dsOcheredLgot
                DrawMemoText = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                FooterColor = clWindow
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -11
                FooterFont.Name = 'Tahoma'
                FooterFont.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete]
                OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                UseMultiTitle = True
                OnDblClick = GridOcheredDblClick
                Columns = <
                  item
                    Alignment = taLeftJustify
                    EditButtons = <>
                    FieldName = 'OCHERED_ID'
                    Footers = <>
                    Title.Caption = #1058#1080#1087' '#1086#1095#1077#1088#1077#1076#1080
                    Width = 135
                    OnGetCellParams = GridOcheredColumns0GetCellParams
                  end
                  item
                    EditButtons = <>
                    FieldName = 'DEC_DATE_REAL'
                    Footers = <>
                    Title.Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
                    Width = 68
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'DEC_DATE'
                    Footers = <>
                    Title.Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080
                    Width = 72
                  end
                  item
                    EditButtons = <>
                    FieldName = 'LAST_RESH_NOMER'
                    Footers = <>
                    Title.Caption = #1056#1077#1096#1077#1085#1080#1077'|'#1053#1086#1084#1077#1088
                    Width = 81
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'LAST_RESH_DATE'
                    Footers = <>
                    Title.Caption = #1056#1077#1096#1077#1085#1080#1077'|'#1044#1072#1090#1072
                    Width = 89
                  end
                  item
                    EditButtons = <>
                    FieldName = 'LAST_RESH_OSNOV_TEXT'
                    Footers = <>
                    Title.Caption = #1056#1077#1096#1077#1085#1080#1077'|'#1054#1089#1085#1086#1074#1072#1085#1080#1077
                    Width = 323
                    OnGetCellParams = GridOcheredColumns4GetCellParams
                  end>
              end
              object Panel5: TPanel
                Left = 0
                Top = 172
                Width = 828
                Height = 25
                Align = alBottom
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object cbOnly: TDBCheckBoxEh
                  Left = 4
                  Top = 3
                  Width = 219
                  Height = 17
                  Caption = #1058#1086#1083#1100#1082#1086' '#1086#1090#1076#1077#1083#1100#1085#1072#1103' '#1086#1095#1077#1088#1077#1076#1100
                  DataField = 'ONLY'
                  DataSource = dsDokument
                  TabOrder = 0
                  ValueChecked = 'True'
                  ValueUnchecked = 'False'
                  OnClick = cbOnlyClick
                end
              end
            end
            object tsDoks: TTabSheet
              Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
              ImageIndex = 3
              object GroupBox2: TGroupBox
                Left = 0
                Top = 0
                Width = 828
                Height = 138
                Align = alTop
                TabOrder = 0
                DesignSize = (
                  828
                  138)
                object edDoks: TDBEditEh
                  Left = 6
                  Top = 12
                  Width = 816
                  Height = 119
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  AutoSize = False
                  DataField = 'OCHERED_DOK'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Visible = True
                  WantReturns = True
                end
              end
              object GroupBox3: TGroupBox
                Left = 0
                Top = 138
                Width = 828
                Height = 59
                Align = alClient
                Caption = ' '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '
                TabOrder = 1
                DesignSize = (
                  828
                  59)
                object edPrim: TDBMemo
                  Left = 6
                  Top = 16
                  Width = 816
                  Height = 36
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  DataField = 'OCHERED_PRIM'
                  DataSource = dsDokument
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
              end
            end
            object tsPrim: TTabSheet
              Caption = #1059#1083#1091#1095#1096#1077#1085#1080#1077
              ImageIndex = 2
              object pnKredit: TPanel
                Left = 0
                Top = 86
                Width = 828
                Height = 111
                Align = alTop
                BevelOuter = bvNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                DesignSize = (
                  828
                  111)
                object Label99: TLabel
                  Left = 5
                  Top = 40
                  Width = 55
                  Height = 13
                  Caption = #1057#1091#1073#1089#1080#1076#1080#1103
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label92: TLabel
                  Left = 5
                  Top = 12
                  Width = 104
                  Height = 13
                  Caption = #1051#1100#1075#1086#1090#1085#1099#1081' '#1082#1088#1077#1076#1080#1090
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label114: TLabel
                  Left = 5
                  Top = 68
                  Width = 134
                  Height = 13
                  Caption = #1043#1076#1077' '#1077#1097#1077' '#1089#1086#1089#1090#1086#1080#1090' '#1085#1072' '#1091#1095#1077#1090#1077
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object Label115: TLabel
                  Left = 586
                  Top = 68
                  Width = 26
                  Height = 13
                  Caption = #1044#1072#1090#1072
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object Label116: TLabel
                  Left = 5
                  Top = 95
                  Width = 347
                  Height = 13
                  Caption = #1040#1076#1088#1077#1089' '#1080' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072' '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1083#1077#1085#1085#1086#1075#1086' '#1089#1083#1091#1078#1077#1073#1085#1086#1075#1086' '#1087#1086#1084#1077#1097#1077#1085#1080#1103
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object Label79: TLabel
                  Left = 420
                  Top = 12
                  Width = 37
                  Height = 13
                  Caption = #1057#1091#1084#1084#1072
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label81: TLabel
                  Left = 420
                  Top = 40
                  Width = 37
                  Height = 13
                  Caption = #1057#1091#1084#1084#1072
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label83: TLabel
                  Left = 583
                  Top = 12
                  Width = 51
                  Height = 13
                  Caption = #1044#1086#1075#1086#1074#1086#1088
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label27: TLabel
                  Left = 252
                  Top = 12
                  Width = 50
                  Height = 13
                  Caption = #1056#1077#1096#1077#1085#1080#1077
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label28: TLabel
                  Left = 252
                  Top = 40
                  Width = 50
                  Height = 13
                  Caption = #1056#1077#1096#1077#1085#1080#1077
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object edSubsidDate: TDBDateTimeEditEh
                  Left = 122
                  Top = 34
                  Width = 105
                  Height = 24
                  DataField = 'SUBSID_DATE'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Kind = dtkDateEh
                  ParentFont = False
                  TabOrder = 4
                  Visible = True
                end
                object edSubsidSumma: TDBNumberEditEh
                  Left = 472
                  Top = 34
                  Width = 93
                  Height = 24
                  HelpContext = 999
                  DataField = 'SUBSID_SUMMA'
                  DataSource = dsDokument
                  DisplayFormat = '### ### ###.##'
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 6
                  Visible = True
                end
                object edKreditDate: TDBDateTimeEditEh
                  Left = 122
                  Top = 6
                  Width = 105
                  Height = 24
                  DataField = 'KREDIT_DATE'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Kind = dtkDateEh
                  ParentFont = False
                  TabOrder = 0
                  Visible = True
                end
                object edKreditSumma: TDBNumberEditEh
                  Left = 472
                  Top = 6
                  Width = 93
                  Height = 24
                  DataField = 'KREDIT_SUMMA'
                  DataSource = dsDokument
                  DisplayFormat = '### ### ###.##'
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  Visible = True
                end
                object edDopOchered: TDBEditEh
                  Left = 151
                  Top = 62
                  Width = 420
                  Height = 24
                  DataField = 'DOP_OCHERED'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 7
                  Visible = True
                end
                object edDopDate: TDBDateTimeEditEh
                  Left = 626
                  Top = 62
                  Width = 100
                  Height = 24
                  DataField = 'DOP_DATE'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Kind = dtkDateEh
                  ParentFont = False
                  TabOrder = 8
                  Visible = True
                end
                object edSlugeb: TDBEditEh
                  Left = 365
                  Top = 89
                  Width = 458
                  Height = 24
                  HelpContext = 999
                  Anchors = [akLeft, akTop, akRight]
                  DataField = 'SLUGEB_POMECH'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 9
                  Visible = True
                end
                object edKreditNomer: TDBEditEh
                  Left = 646
                  Top = 6
                  Width = 86
                  Height = 24
                  Hint = #1053#1086#1084#1077#1088' '#1082#1088#1077#1076#1080#1090#1085#1086#1075#1086' '#1076#1086#1075#1086#1074#1086#1088#1072
                  DataField = 'KREDIT_NOMER'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                  Visible = True
                end
                object edKreditResh: TDBEditEh
                  Left = 317
                  Top = 6
                  Width = 86
                  Height = 24
                  Hint = #1053#1086#1084#1077#1088' '#1082#1088#1077#1076#1080#1090#1085#1086#1075#1086' '#1076#1086#1075#1086#1074#1086#1088#1072
                  DataField = 'KREDIT_RESH'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  Visible = True
                end
                object edSubsidResh: TDBEditEh
                  Left = 317
                  Top = 34
                  Width = 86
                  Height = 24
                  Hint = #1053#1086#1084#1077#1088' '#1082#1088#1077#1076#1080#1090#1085#1086#1075#1086' '#1076#1086#1075#1086#1074#1086#1088#1072
                  DataField = 'SUBSID_RESH'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 5
                  Visible = True
                end
              end
              object gbUluch: TGroupBox
                Left = 0
                Top = 10
                Width = 828
                Height = 76
                Align = alTop
                Caption = ' '#1059#1083#1091#1095#1096#1077#1085#1080#1077' '#1078#1080#1083#1080#1097#1085#1099#1093' '#1091#1089#1083#1086#1074#1080#1081' '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object Label95: TLabel
                  Left = 12
                  Top = 53
                  Width = 46
                  Height = 13
                  Caption = #1054#1073#1097'. '#1087#1083'.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object Label96: TLabel
                  Left = 143
                  Top = 53
                  Width = 66
                  Height = 13
                  Caption = #1050#1086#1083'-'#1074#1086' '#1082#1086#1084#1085'.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object Label97: TLabel
                  Left = 520
                  Top = 53
                  Width = 26
                  Height = 13
                  Caption = #1044#1072#1090#1072
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object vchDBText2: TvchDBText
                  Left = 11
                  Top = 23
                  Width = 439
                  Height = 18
                  Color = clInfoBk
                  DataField = 'NEW_ADRES_ID'
                  DataSource = dsDokument
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                  Transparent = False
                  OnGetText = vchDBText2GetText
                end
                object Label98: TLabel
                  Left = 291
                  Top = 53
                  Width = 82
                  Height = 13
                  Caption = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object edNewPloshAll: TDBNumberEditEh
                  Left = 65
                  Top = 47
                  Width = 58
                  Height = 24
                  Hint = #1054#1073#1097#1072#1103' '#1087#1083#1086#1097#1072#1076#1100
                  DataField = 'NEW_PLOSH_ALL'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Visible = True
                end
                object edNewKolKomn: TDBNumberEditEh
                  Left = 225
                  Top = 47
                  Width = 32
                  Height = 24
                  Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1086#1084#1085#1072#1090
                  DataField = 'NEW_KOLVO_KOMN'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  Visible = True
                end
                object edNew_Date: TDBDateTimeEditEh
                  Left = 560
                  Top = 47
                  Width = 105
                  Height = 24
                  Hint = #1044#1072#1090#1072' '#1091#1083#1091#1095#1096#1077#1085#1080#1103' '#1078#1080#1083#1080#1097#1085#1099#1093' '#1091#1089#1083#1086#1074#1080#1081
                  DataField = 'NEW_DATE'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Kind = dtkDateEh
                  ParentFont = False
                  TabOrder = 3
                  Visible = True
                end
                object BitBtn1: TBitBtn
                  Left = 459
                  Top = 21
                  Width = 27
                  Height = 22
                  Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1076#1088#1077#1089' '#1087#1088#1086#1087#1080#1089#1082#1080
                  TabOrder = 4
                  TabStop = False
                  OnClick = BitBtn1Click
                  Glyph.Data = {
                    D6000000424DD600000000000000560000002800000010000000100000000100
                    040000000000800000000000000000000000080000000800000004020400FCFE
                    04000402840004868400FC02FC0004FEFC000402FC0084868400444444444444
                    4444440000000000074444055555055037444400000505503744440011050550
                    3744440011050550374444000005000037444003333333333774402266666666
                    2674440226000262674444402261062674444444022662677444444440222607
                    7444444444026707744444444440740004444444444444444444}
                end
                object edNewDogovor: TDBEditEh
                  Left = 390
                  Top = 47
                  Width = 103
                  Height = 24
                  DataField = 'NEW_DOGOVOR'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  Visible = True
                end
                object BitBtn2: TBitBtn
                  Left = 493
                  Top = 21
                  Width = 25
                  Height = 22
                  Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1086' '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1083#1077#1085#1080#1080' '#1078#1080#1083#1100#1103
                  TabOrder = 5
                  OnClick = BitBtn2Click
                  Glyph.Data = {
                    F6000000424DF600000000000000760000002800000010000000100000000100
                    040000000000800000000000000000000000020000000200000004020400C4C2
                    C400111111111111111111111111111111111111111111111011111011111111
                    1111110001111111011111000111111011111110001111001111111100011001
                    1111111110000011111111111100011111111111100000111111111100011011
                    1111110000111100111110000111111001111001111111110011111111111111
                    1111}
                end
              end
              object Panel7: TPanel
                Left = 0
                Top = 0
                Width = 828
                Height = 10
                Align = alTop
                BevelOuter = bvNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
              object edSocial: TDBComboBoxEh
                Left = 212
                Top = 3
                Width = 261
                Height = 24
                DataField = 'SOCIAL'
                DataSource = dsDokument
                DropDownBox.Rows = 15
                EditButtons = <>
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                Visible = True
              end
            end
            object tsSobst: TTabSheet
              Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1100
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ImageIndex = 5
              ParentFont = False
              object GridSobstv: TDBGridEh
                Left = 0
                Top = 0
                Width = 828
                Height = 197
                Align = alClient
                DataSource = dsSobst
                DrawMemoText = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                FooterColor = clWindow
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -11
                FooterFont.Name = 'Tahoma'
                FooterFont.Style = [fsBold]
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
                ParentFont = False
                ReadOnly = True
                RowHeight = 37
                RowSizingAllowed = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = [fsBold]
                UseMultiTitle = True
                Columns = <
                  item
                    Alignment = taLeftJustify
                    EditButtons = <>
                    FieldName = 'MEMBER_ID'
                    Footers = <>
                    Title.Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Width = 114
                    WordWrap = True
                    OnGetCellParams = GridSobstvColumns0GetCellParams
                  end
                  item
                    EditButtons = <>
                    FieldName = 'KADASTR'
                    Footers = <>
                    Title.Caption = #1050#1072#1076#1072#1089#1090#1088#1086#1074#1099#1081' '#1085#1086#1084#1077#1088
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Width = 123
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ADRES'
                    Footers = <>
                    Title.Caption = #1040#1076#1088#1077#1089
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Width = 227
                  end
                  item
                    EditButtons = <>
                    FieldName = 'PRIM'
                    Footers = <>
                    Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Width = 228
                  end
                  item
                    EditButtons = <>
                    FieldName = 'DEST'
                    Footers = <>
                    Title.Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Width = 209
                  end
                  item
                    EditButtons = <>
                    FieldName = 'PLOSH_ALL'
                    Footers = <>
                    Title.Caption = #1055#1083#1086#1097#1072#1076#1100
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = 'PRAVO'
                    Footers = <>
                    Title.Caption = #1058#1080#1087' '#1087#1088#1072#1074#1072' '#1085#1072' '#1086#1073#1098#1077#1082#1090
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Width = 258
                  end
                  item
                    EditButtons = <>
                    FieldName = 'TAIL'
                    Footers = <>
                    Title.Caption = #1063#1072#1089#1090#1100
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                  end
                  item
                    EditButtons = <>
                    FieldName = 'DATER'
                    Footers = <>
                    Title.Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Width = 83
                  end
                  item
                    EditButtons = <>
                    FieldName = 'DATEP'
                    Footers = <>
                    Title.Caption = #1044#1072#1090#1072' '#1087#1088#1077#1082#1088#1072#1097#1077#1085#1080#1103
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Width = 83
                  end>
              end
            end
          end
        end
        object pnOcheredMain: TPanel
          Left = 0
          Top = 0
          Width = 876
          Height = 237
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            876
            237)
          object Label82: TLabel
            Left = 8
            Top = 37
            Width = 102
            Height = 13
            Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbNomer: TLabel
            Left = 687
            Top = 7
            Width = 67
            Height = 13
            Caption = #8470' '#1086#1095#1077#1088#1077#1076#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label86: TLabel
            Left = 550
            Top = 93
            Width = 195
            Height = 13
            Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1085#1099#1093
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label87: TLabel
            Left = 359
            Top = 93
            Width = 114
            Height = 13
            Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1086#1084#1085#1072#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label89: TLabel
            Left = 8
            Top = 93
            Width = 96
            Height = 13
            Caption = #1054#1073#1097#1072#1103' '#1087#1083#1086#1097#1072#1076#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label90: TLabel
            Left = 8
            Top = 65
            Width = 136
            Height = 13
            Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072' '#1078#1080#1083#1100#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbDelo: TLabel
            Left = 8
            Top = 121
            Width = 124
            Height = 13
            Caption = #1059#1095#1077#1090#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1076#1077#1083#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Image1: TImage
            Left = 820
            Top = 97
            Width = 16
            Height = 16
            Anchors = [akTop, akRight]
            AutoSize = True
            Center = True
            Picture.Data = {
              07544269746D617036040000424D360400000000000036000000280000001000
              0000100000000100200000000000000400000000000000000000000000000000
              0000FFFFF800E5FBE900FBFFFE00FFFFD800BFF2EA00FFFFF000FBC5FF00273F
              F500151FE100FBFFF400FFFFDD00FFFFE300F2F2F8000C00E8001109FF00B8CF
              CB00FEF9E000E4FFF700B4E0F700E6F7EC00D08E9A00902F31006048D6003048
              E0002C32FF000A10FF00603024009A7854002D06FF000620F600203CFF000100
              F800FFFEFC00A3C7EB00477CDD007A4A5C00B5403100F9AD15006D41FF004B45
              F6005C3AF2004A68FF004B1CFA003E1DFF002C36EE00494CE4003017E3002F1D
              FF00E4F7FF001F71C2003694FF009F583700E6A74D00FF9F2700C78733003638
              F4006A4DFF00613DD7003D5DFD004046E5005F4CFF003A4BFF001C29EF00BDC6
              F200D0F1FF002E82B60067A6E200B38A8F00F7A72400FFAE2400FF9F2E00AF9D
              60003F4AF2004D4FFF005742F500664AFB00535FD5000027E6002252E000F4F9
              FA00FFF8FF00CAC8C70082482400EFBC8400FFBE8B00C8B72000FFA94500F98A
              6A005643F0004D5BFB00484CE7001F3EF500304EFF00472EEE00AF9EC000F4F8
              F300FFFFFF00EBE6E700C4BFC000DD2A0500EDEEDA00FFE06D00C6AC84004A5D
              FA006A48F300706FF5005157FE006258FF005370DD003A38FC00432BEF00CFC4
              FF00FFFFFF00FFFEFF00F1ECED00CB9BB300A52B0000EAECD900515CFA008256
              F1006567E300605EFF004D5CF8006B60EC004037F2005C71FC004F53F800492F
              D900FFFFFF00FFFFFF00FFFFFF00F8FEFF00C0737A001E578B004F4AFF00965F
              FF004B79FF003338F3002D55A8005A5C8C005B45FC004751F200636CFF004037
              DB00FBFBFB00FAFAFA00FCFCFC00F7F8E800306CA70090C6DF00C7CCFF004754
              F6004D6AF40096B6FF0095D7E200606C9C00CFE0FF005953E6005D59E100B8C1
              FF00FFFFFF00FFFFFF00FFFFFF00DFFAFF001E638400D0E6EC0063A8E70060A1
              FF008B88C60077A8CE00A2E2F4004253BA00CBFCDC00ECF8FF00F9EEFF00FFFC
              FF00FDFFFF00FDFFFF00FDFFFF00DDF9FF000D2879006185D10074AFFE005495
              C80017436000102F7A000326660000256000E1FFFF00FFFFD400FFFFF400FFF9
              FE00FBFDFD00FAFFFE00F8FDFC00FFFFE7000A1B90000035A5001C4387000745
              7500002D6300182F9300122F6C0006313400E9F3FF00F2F2E000FFFBFF00FFFC
              FF00FDFFFF00FBFFFF00FBFFFF00D7EFE500B1A9CE00073F7600003D9A00004A
              8F00144E89000731920000354A00848FAF00F0F9EF00FFF6FF00F0EAFF00EAF1
              FF00FFFFFF00FFFFFF00FFFFFF00FFF8FF00F9F5FF00828EBE001D3878001B3C
              810016337000253969007581A900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFBEC00FFFFFB00F3FFFF00E5F9FF00E3FC
              FF00E4FEFF00E3F6FD00F1FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00}
            Transparent = True
            Visible = False
          end
          object Label20: TLabel
            Left = 563
            Top = 65
            Width = 62
            Height = 13
            Caption = #1046#1080#1083'. '#1092#1086#1085#1076
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 8
            Top = 150
            Width = 81
            Height = 13
            Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label21: TLabel
            Left = 364
            Top = 150
            Width = 131
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label84: TLabel
            Left = 8
            Top = 180
            Width = 149
            Height = 13
            Caption = #1057' '#1082#1072#1082#1086#1081' '#1076#1072#1090#1099' '#1087#1088#1086#1078#1080#1074#1072#1077#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label117: TLabel
            Left = 459
            Top = 180
            Width = 13
            Height = 13
            Caption = #1076#1086
          end
          object lbRegNomer: TLabel
            Left = 413
            Top = 8
            Width = 14
            Height = 13
            Caption = #8470
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label32: TLabel
            Left = 8
            Top = 210
            Width = 163
            Height = 13
            Caption = #1044#1072#1090#1072' '#1087#1088#1080#1086#1073#1088#1077#1090#1077#1085#1080#1103' '#1083#1100#1075#1086#1090#1099
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label30: TLabel
            Left = 199
            Top = 93
            Width = 31
            Height = 13
            Caption = #1044#1086#1083#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label108: TLabel
            Left = 312
            Top = 210
            Width = 66
            Height = 13
            Caption = #1046#1057#1050' ('#1046#1057#1055#1050')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label10: TLabel
            Left = 553
            Top = 210
            Width = 35
            Height = 13
            Caption = '( '#1082#1086#1084#1085'.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label35: TLabel
            Left = 639
            Top = 210
            Width = 4
            Height = 13
            Caption = ')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label37: TLabel
            Left = 8
            Top = 8
            Width = 95
            Height = 13
            Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label39: TLabel
            Left = 304
            Top = 37
            Width = 74
            Height = 13
            Caption = #1044#1072#1090#1072' '#1089#1074#1077#1088#1082#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edDecDate: TDBDateTimeEditEh
            Left = 126
            Top = 31
            Width = 110
            Height = 24
            HelpContext = 888
            Color = clInfoBk
            DataField = 'DEC_DATE'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            Visible = True
          end
          object edDecTime: TDBDateTimeEditEh
            Left = 259
            Top = 2
            Width = 123
            Height = 24
            DataField = 'DEC_TIME'
            DataSource = dsDokument
            EditButton.Visible = False
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = True
            EditFormat = 'HH '#1095#1072#1089'. NN '#1084#1080#1085'.'
          end
          object edNomer: TDBNumberEditEh
            Left = 771
            Top = 3
            Width = 80
            Height = 21
            DataField = 'NOMER_OCH'
            DataSource = dsDokument
            DecimalPlaces = 0
            EditButtons = <
              item
                ShortCut = 16462
                Style = ebsPlusEh
                OnClick = edNomerEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
          object edTypeHouse: TDBLookupComboboxEh
            Left = 157
            Top = 59
            Width = 384
            Height = 24
            DataField = 'TYPEHOUSE'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = edTypeHouseEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsSprTypeHouse
            ParentFont = False
            TabOrder = 6
            Visible = True
          end
          object edPloshAll: TDBNumberEditEh
            Left = 119
            Top = 87
            Width = 57
            Height = 24
            DataField = 'PLOSH_ALL'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            Visible = True
          end
          object edKolvoKomn: TDBNumberEditEh
            Left = 487
            Top = 87
            Width = 40
            Height = 24
            DataField = 'KOLVO_KOMN_PR'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
            Visible = True
          end
          object edKolvoPropis: TDBNumberEditEh
            Left = 759
            Top = 87
            Width = 35
            Height = 24
            DataField = 'KOLVO_PROPIS'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
            Visible = True
          end
          object edDelo: TDBEditEh
            Left = 140
            Top = 115
            Width = 116
            Height = 24
            DataField = 'DELO'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
            Visible = True
          end
          object edResidence: TDBComboBoxEh
            Left = 640
            Top = 59
            Width = 211
            Height = 24
            DataField = 'RESIDENCE'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsGlyphEh
                OnClick = edResidenceEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            Visible = True
          end
          object N_F_cbNewSem: TDBCheckBoxEh
            Left = 664
            Top = 164
            Width = 128
            Height = 17
            Caption = #1052#1086#1083#1086#1076#1072#1103' '#1089#1077#1084#1100#1103
            DataField = 'NEWSEM'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 24
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = N_F_cbNewSemClick
          end
          object N_F_cbOchUch: TDBCheckBoxEh
            Left = 325
            Top = 119
            Width = 140
            Height = 17
            Caption = #1054#1095#1077#1088#1077#1076#1100' '#1085#1072' '#1091#1095#1072#1089#1090#1086#1082' c'
            DataField = 'IS_UCHASTOK'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 23
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object N_F_cbSirota: TDBCheckBoxEh
            Left = 664
            Top = 146
            Width = 99
            Height = 17
            Caption = #1057#1080#1088#1086#1090#1072
            DataField = 'SIROTA'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 25
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = N_F_cbSirotaClick
          end
          object edCitizen: TDBLookupComboboxEh
            Left = 97
            Top = 144
            Width = 249
            Height = 24
            HelpContext = 888
            DataField = 'CITIZEN'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
            Visible = True
          end
          object edIN: TDBEditEh
            Left = 514
            Top = 144
            Width = 128
            Height = 24
            CharCase = ecUpperCase
            DataField = 'LICH_NOMER'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 16
            Visible = True
            OnUpdateData = edLichNomerUpdateData
          end
          object edResidenceDate: TDBDateTimeEditEh
            Left = 184
            Top = 174
            Width = 110
            Height = 24
            DataField = 'RESIDENCE_DATE'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 17
            Visible = True
          end
          object N_F_cbKvartirant: TDBCheckBoxEh
            Left = 327
            Top = 178
            Width = 122
            Height = 17
            Caption = #1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1085#1072#1081#1084#1072
            DataField = 'NOMER_SEM'
            DataSource = dsDokument
            TabOrder = 22
            TabStop = False
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object edDateSrokDN: TDBDateTimeEditEh
            Left = 481
            Top = 174
            Width = 110
            Height = 24
            Hint = #1057#1088#1086#1082' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1086#1075#1086#1074#1086#1088#1072' '#1085#1072#1081#1084#1072' '#1076#1083#1103' '#1082#1074#1072#1088#1090#1080#1088#1072#1085#1090#1072
            DataField = 'DATE_SROK_DN'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 18
            Visible = True
            OnUpdateData = edDateSrokDNUpdateData
          end
          object edRegNomer: TDBEditEh
            Left = 437
            Top = 2
            Width = 69
            Height = 24
            DataField = 'REG_NOMER'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
          object edDateLgot: TDBDateTimeEditEh
            Left = 184
            Top = 204
            Width = 110
            Height = 24
            DataField = 'LGOT_DATE'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 19
            Visible = True
          end
          object edTail: TDBEditEh
            Left = 244
            Top = 87
            Width = 93
            Height = 24
            DataField = 'TAIL'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            Visible = True
          end
          object edGSK: TDBEditEh
            Left = 390
            Top = 204
            Width = 149
            Height = 24
            DataField = 'GSK'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 20
            Visible = True
          end
          object N_F_cbUchastok: TDBCheckBoxEh
            Left = 607
            Top = 119
            Width = 143
            Height = 17
            Caption = #1055#1088#1077#1076#1086#1089#1090#1072#1074#1083#1077#1085' '#1091#1095#1072#1089#1090#1086#1082
            DataField = 'UCHASTOK'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 26
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = N_F_cbUchastokClick
          end
          object edKolvoKomnPr: TDBNumberEditEh
            Left = 596
            Top = 204
            Width = 36
            Height = 24
            Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1086#1084#1085#1072#1090
            DataField = 'KOLVO_KOMN'
            DataSource = dsDokument
            DecimalPlaces = 0
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 21
            Visible = True
          end
          object edIsUchastokDate: TDBDateTimeEditEh
            Left = 471
            Top = 115
            Width = 110
            Height = 24
            Hint = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080' '#1074' '#1086#1095#1077#1088#1077#1076#1100' '#1085#1072' '#1091#1095#1072#1089#1090#1086#1082
            DataField = 'IS_UCHASTOK_DATE'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 13
            Visible = True
            OnUpdateData = edDateSrokDNUpdateData
          end
          object edDecDateReal: TDBDateTimeEditEh
            Left = 126
            Top = 2
            Width = 110
            Height = 24
            HelpContext = 888
            DataField = 'DEC_DATE_REAL'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
          object edDatePerereg: TDBDateTimeEditEh
            Left = 393
            Top = 30
            Width = 115
            Height = 24
            Hint = #1044#1072#1090#1072' '#1087#1077#1088#1077#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
            DataField = 'PER_DATE'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 5
            Visible = True
          end
          object edUchastokDate: TDBDateTimeEditEh
            Left = 758
            Top = 115
            Width = 110
            Height = 24
            Hint = #1044#1072#1090#1072' '#1087#1088#1077#1083#1086#1089#1090#1072#1074#1083#1077#1085#1080#1103' '#1091#1095#1072#1089#1090#1082#1072
            DataField = 'UCHASTOK_DATE'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 14
            Visible = True
            OnUpdateData = edDateSrokDNUpdateData
          end
          object N_F_cbMnogo4: TDBCheckBoxEh
            Left = 664
            Top = 183
            Width = 214
            Height = 17
            Caption = #1052#1085#1086#1075#1086#1076#1077#1090#1085#1072#1103' (4 '#1080' '#1073#1086#1083#1077#1077' '#1076#1077#1090#1077#1081')'
            DataField = 'MNOGO_4'
            DataSource = dsDokument
            TabOrder = 27
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = N_F_cbNewSemClick
          end
          object N_F_cbMnogoI: TDBCheckBoxEh
            Left = 664
            Top = 202
            Width = 215
            Height = 17
            Caption = #1052#1085#1086#1075#1086#1076#1077#1090#1085#1072#1103' ('#1088#1077#1073#1077#1085#1086#1082' '#1080#1085#1074#1072#1083#1080#1076')'
            DataField = 'MNOGO_I'
            DataSource = dsDokument
            TabOrder = 28
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = N_F_cbNewSemClick
          end
        end
      end
      object tsMain: TTabSheet
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
        object gbObraz: TGroupBox
          Left = 0
          Top = 216
          Width = 876
          Height = 70
          Align = alTop
          Caption = ' '#1054#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object Label6: TLabel
            Left = 182
            Top = 19
            Width = 36
            Height = 13
            Caption = #1059#1095#1080#1090#1089#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 548
            Top = 19
            Width = 83
            Height = 13
            Caption = #1060#1086#1088#1084#1072' '#1086#1073#1091#1095#1077#1085#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 8
            Top = 45
            Width = 100
            Height = 13
            Caption = #1059#1095#1077#1073#1085#1086#1077' '#1079#1072#1074#1077#1076#1077#1085#1080#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label19: TLabel
            Left = 419
            Top = 19
            Width = 57
            Height = 13
            Caption = #1050#1083#1072#1089#1089'/'#1050#1091#1088#1089
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edStudent1: TDBLookupComboboxEh
            Left = 741
            Top = 40
            Width = 28
            Height = 21
            DataField = 'STUDENT'
            DataSource = dsDokument
            DropDownBox.Rows = 15
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            ParentFont = False
            TabOrder = 2
            Visible = False
          end
          object edStudent_Type1: TDBLookupComboboxEh
            Left = 709
            Top = 40
            Width = 20
            Height = 21
            DataField = 'STUDENT_TYPE'
            DataSource = dsDokument
            DropDownBox.Rows = 5
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            ParentFont = False
            TabOrder = 5
            Visible = False
          end
          object edStud_Place: TDBEditEh
            Left = 120
            Top = 42
            Width = 585
            Height = 21
            HelpContext = 999
            DataField = 'STUD_PLACE'
            DataSource = dsDokument
            EditButtons = <
              item
                Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
                Style = ebsEllipsisEh
              end
              item
                Glyph.Data = {
                  C6000000424DC60000000000000076000000280000000A0000000A0000000100
                  0400000000005000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888800
                  0000008888880800000080088880080000008000880088000000880000088800
                  0000888000888800000088000008880000008000880088000000800888800800
                  00008088888888000000}
                Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
                Style = ebsGlyphEh
                OnClick = edStud_PlaceEditButtons1Click
              end>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            Visible = True
          end
          object edStudent_Spr: TDBLookupComboboxEh
            Left = 712
            Top = 46
            Width = 33
            Height = 21
            DataField = 'STUDENT_SPR'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            ParentFont = False
            TabOrder = 6
            Visible = False
          end
          object edKurs: TDBEditEh
            Left = 488
            Top = 16
            Width = 34
            Height = 24
            DataField = 'KURS'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
          object edObraz: TDBComboBoxEh
            Left = 13
            Top = 16
            Width = 151
            Height = 24
            DataField = 'OBRAZ'
            DataSource = dsDokument
            DropDownBox.Rows = 8
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            MRUList.Rows = 10
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
          object edStudent: TDBComboBoxEh
            Left = 230
            Top = 16
            Width = 164
            Height = 24
            DataField = 'STUDENT'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
          object edStudent_Type: TDBComboBoxEh
            Left = 646
            Top = 16
            Width = 113
            Height = 24
            DataField = 'STUDENT_TYPE'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Visible = True
          end
        end
        object gbWork: TGroupBox
          Left = 0
          Top = 34
          Width = 876
          Height = 86
          Align = alTop
          Caption = ' '#1056#1072#1073#1086#1090#1072' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label11: TLabel
            Left = 10
            Top = 27
            Width = 72
            Height = 13
            Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label12: TLabel
            Left = 10
            Top = 52
            Width = 57
            Height = 13
            Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label47: TLabel
            Left = 354
            Top = 52
            Width = 44
            Height = 13
            Caption = #1058#1077#1083#1077#1092#1086#1085
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edDolg_Name: TDBEditEh
            Left = 92
            Top = 49
            Width = 225
            Height = 21
            DataField = 'DOLG_NAME'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
              end
              item
                Style = ebsGlyphEh
                OnClick = edDolg_NameEditButtons1Click
              end>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
          object edWork_Name: TDBEditEh
            Left = 92
            Top = 24
            Width = 501
            Height = 21
            DataField = 'WORK_NAME'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
              end
              item
                Style = ebsGlyphEh
                OnClick = edWork_NameEditButtons1Click
              end>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
          object edWorkTelefon: TDBEditEh
            Left = 408
            Top = 49
            Width = 121
            Height = 24
            DataField = 'WORK_TELEF'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 286
          Width = 369
          Height = 176
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Panel1'
          TabOrder = 4
          object gbLgot: TGroupBox
            Left = 0
            Top = 0
            Width = 369
            Height = 176
            Align = alClient
            Caption = ' '#1051#1100#1075#1086#1090#1099' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel2: TPanel
          Left = 369
          Top = 286
          Width = 507
          Height = 176
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel2'
          TabOrder = 5
          object gbPrizn: TGroupBox
            Left = 0
            Top = 0
            Width = 507
            Height = 176
            Align = alClient
            Caption = ' '#1055#1088#1080#1079#1085#1072#1082#1080' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object pnOsn: TPanel
          Left = 0
          Top = 0
          Width = 876
          Height = 34
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label29: TLabel
            Left = 9
            Top = 10
            Width = 108
            Height = 13
            Caption = #1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
          end
          object Label33: TLabel
            Left = 586
            Top = 10
            Width = 75
            Height = 13
            Caption = #1044#1072#1090#1072' '#1074#1099#1073#1099#1090#1080#1103
            Visible = False
          end
          object lbDateS: TLabel
            Left = 374
            Top = 10
            Width = 64
            Height = 13
            Caption = #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080
            Visible = False
          end
          object edSem: TDBComboBoxEh
            Left = 129
            Top = 4
            Width = 208
            Height = 24
            DataField = 'SEM'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
          object edDateVip: TDBDateTimeEditEh
            Left = 672
            Top = 4
            Width = 106
            Height = 24
            DataField = 'DATEV'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 1
            Visible = False
          end
          object edDateS: TDBDateTimeEditEh
            Left = 459
            Top = 4
            Width = 106
            Height = 24
            DataField = 'DATES'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 2
            Visible = False
          end
        end
        object gbPasp: TGroupBox
          Left = 0
          Top = 120
          Width = 876
          Height = 96
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object Label13: TLabel
            Left = 310
            Top = 45
            Width = 31
            Height = 13
            Caption = #1057#1077#1088#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 430
            Top = 45
            Width = 31
            Height = 13
            Caption = #1053#1086#1084#1077#1088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label15: TLabel
            Left = 582
            Top = 45
            Width = 26
            Height = 13
            Caption = #1044#1072#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label16: TLabel
            Left = 10
            Top = 70
            Width = 73
            Height = 13
            Caption = #1054#1088#1075#1072#1085' '#1074#1099#1076#1072#1095#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label17: TLabel
            Left = 10
            Top = 45
            Width = 115
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edLichNomer: TDBEditEh
            Left = 135
            Top = 39
            Width = 128
            Height = 24
            CharCase = ecUpperCase
            DataField = 'LICH_NOMER'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = True
            OnUpdateData = edLichNomerUpdateData
          end
          object edPasp_Seria: TDBEditEh
            Left = 351
            Top = 39
            Width = 50
            Height = 24
            CharCase = ecUpperCase
            DataField = 'PASP_SERIA'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
          object edPasp_Nomer: TDBEditEh
            Left = 473
            Top = 39
            Width = 97
            Height = 24
            CharCase = ecUpperCase
            DataField = 'PASP_NOMER'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
          object edPasp_Date: TDBDateTimeEditEh
            Left = 615
            Top = 39
            Width = 121
            Height = 24
            DataField = 'PASP_DATE'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 4
            Visible = True
          end
          object edPasp_Organ: TDBEditEh
            Left = 96
            Top = 67
            Width = 457
            Height = 24
            DataField = 'PASP_VIDAN'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = edPasp_OrganEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            MRUList.Rows = 15
            ParentFont = False
            TabOrder = 5
            Visible = True
          end
          object edUdost: TDBComboBoxEh
            Left = 11
            Top = 11
            Width = 318
            Height = 24
            DataField = 'PASP_UDOST'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
        end
        object edIsWork: TDBComboBoxEh
          Left = 11
          Top = 31
          Width = 165
          Height = 24
          DataField = 'ISWORK'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          Visible = True
        end
      end
      object tsMigr: TTabSheet
        Caption = #1044#1074#1080#1078#1077#1085#1080#1077
        ImageIndex = 2
        object Label74: TLabel
          Left = 6
          Top = 42
          Width = 134
          Height = 13
          Caption = #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072' ('#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1086')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edMR_B_RESP: TDBCheckBoxEh
          Left = 153
          Top = 40
          Width = 15
          Height = 17
          DataField = 'MR_B_RESP'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edMR_GOSUD: TDBLookupComboboxEh
          Left = 177
          Top = 36
          Width = 214
          Height = 24
          DataField = 'MR_GOSUD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsStran
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object edMR_B_OBL: TDBCheckBoxEh
          Left = 532
          Top = 21
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'MR_B_OBL'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edAdresProp: TDBEditEh
          Left = 50
          Top = 6
          Width = 555
          Height = 21
          DataField = 'ADRES_PROP'
          DataSource = dsDokument
          EditButtons = <
            item
              Hint = #1042#1074#1077#1089#1090#1080' '#1072#1076#1088#1077#1089
              Style = ebsEllipsisEh
              OnClick = edAdresPropEditButtons0Click
            end
            item
              Glyph.Data = {
                C6000000424DC60000000000000076000000280000000A0000000A0000000100
                0400000000005000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888800
                0000008888880800000080088880080000008000880088000000880000088800
                0000888000888800000088000008880000008000880088000000800888800800
                00008088888888000000}
              Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1072#1076#1088#1077#1089
              Style = ebsGlyphEh
              OnClick = edAdresPropEditButtons1Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Visible = True
        end
      end
    end
    object pnFIO: TPanel
      Left = 0
      Top = 0
      Width = 884
      Height = 58
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        884
        58)
      object Label1: TLabel
        Left = 10
        Top = 12
        Width = 44
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103
      end
      object Label2: TLabel
        Left = 234
        Top = 12
        Width = 19
        Height = 13
        Caption = #1048#1084#1103
      end
      object Label3: TLabel
        Left = 433
        Top = 12
        Width = 49
        Height = 13
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      end
      object Label5: TLabel
        Left = 369
        Top = 39
        Width = 44
        Height = 13
        Caption = #1058#1077#1083#1077#1092#1086#1085
      end
      object Label7: TLabel
        Left = 157
        Top = 39
        Width = 80
        Height = 13
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      end
      object Label4: TLabel
        Left = 10
        Top = 39
        Width = 19
        Height = 13
        Caption = #1055#1086#1083
      end
      object ImageSpec: TImage
        Left = 844
        Top = 5
        Width = 32
        Height = 32
        Anchors = [akTop, akRight]
        AutoSize = True
        Center = True
        Picture.Data = {
          07544269746D617036100000424D361000000000000036000000280000002000
          0000200000000100200000000000001000000000000000000000000000000000
          0000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD0084848400848484008484
          8400848484008484840084848400848484008484840084848400848484008484
          8400848484008484840084848400848484008484840084848400848484008484
          8400848484008484840084848400848484008484840084848400BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD008484840084848400848484008484
          8400848484008484840084848400848484008484840084848400848484008484
          8400848484008484840084848400848484008484840084848400848484008484
          840084848400848484008484840084848400848484008484840084848400BDBD
          BD00BDBDBD00BDBDBD00007B7B00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000848484008484840084848400848484008484
          8400BDBDBD00007B7B0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF00BDBDBD00000000008484840084848400848484008484
          8400007B7B0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF00BDBDBD000000000084848400848484008484
          8400007B7B0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF000000000084848400848484008484
          8400007B7B0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00BDBDBD00000000000000
          0000BDBDBD0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF00000000008484840084848400BDBD
          BD00007B7B0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
          00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF00BDBDBD00000000008484840084848400BDBD
          BD00BDBDBD00007B7B0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
          00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF00000000008484840084848400BDBDBD00BDBD
          BD00BDBDBD00007B7B0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00BDBDBD00000000000000
          0000BDBDBD0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF00BDBDBD00000000008484840084848400BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00007B7B0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF00000000008484840084848400BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00007B7B0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF00BDBDBD00000000008484840084848400BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00007B7B0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00BDBDBD0000000000BDBD
          BD0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF00000000008484840084848400BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00007B7B0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007B7B0000000000007B
          7B0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF00BDBDBD00000000008484840084848400BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00007B7B0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
          000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF00000000008484840084848400BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00007B7B0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF00BDBDBD0000000000000000000000
          0000BDBDBD0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00BDBD
          BD00000000008484840084848400BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00007B7B0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF00007B7B0000000000000000000000
          0000007B7B0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
          00008484840084848400BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00007B7B0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
          00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00BDBDBD000000
          00008484840084848400BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00007B7B0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
          00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000008484
          840084848400BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00007B7B0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
          00000000000000FFFF0000FFFF0000FFFF0000FFFF00BDBDBD00000000008484
          840084848400BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00007B
          7B0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
          00000000000000FFFF0000FFFF0000FFFF0000FFFF0000000000848484008484
          8400BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00007B
          7B0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
          00000000000000FFFF0000FFFF0000FFFF00BDBDBD0000000000848484008484
          8400BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00007B7B0000FFFF0000FFFF0000FFFF00BDBDBD0000000000000000000000
          0000BDBDBD0000FFFF0000FFFF0000FFFF00000000008484840084848400BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00007B7B0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF00BDBDBD00000000008484840084848400BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00007B7B0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF00000000008484840084848400BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00007B7B0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF00BDBDBD00000000008484840084848400BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00007B7B0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF00000000008484840084848400BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00007B7B0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF00BDBDBD00000000008484840084848400BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00007B7B0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF00000000008484840084848400BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00007B7B0000FFFF0000FFFF0000FFFF0000FF
          FF00BDBDBD000000000084848400BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00007B7B0000FFFF0000FFFF00BDBD
          BD0000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00007B7B00007B7B00007B
          7B00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
          BD00}
        Transparent = True
        Visible = False
      end
      object Label34: TLabel
        Left = 556
        Top = 39
        Width = 71
        Height = 13
        Caption = #1052#1086#1073'. '#1090#1077#1083#1077#1092#1086#1085
      end
      object edFam: TDBEditEh
        Left = 71
        Top = 6
        Width = 140
        Height = 24
        DataField = 'FAMILIA'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
      object edName: TDBEditEh
        Left = 268
        Top = 6
        Width = 140
        Height = 24
        DataField = 'NAME'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = True
      end
      object edOtch: TDBEditEh
        Left = 494
        Top = 6
        Width = 140
        Height = 24
        DataField = 'OTCH'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Visible = True
      end
      object Button1: TButton
        Left = 656
        Top = 4
        Width = 65
        Height = 25
        Caption = 'reshAll'
        TabOrder = 0
        Visible = False
        OnClick = Button1Click
      end
      object edTelefon: TDBEditEh
        Left = 425
        Top = 33
        Width = 104
        Height = 24
        DataField = 'TELEFON'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Visible = True
      end
      object edDateR: TDBDateTimeEditEh
        Left = 246
        Top = 33
        Width = 106
        Height = 24
        DataField = 'DATER'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 5
        Visible = True
      end
      object edPol: TDBComboBoxEh
        Left = 41
        Top = 33
        Width = 97
        Height = 24
        DataField = 'POL'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Visible = True
      end
      object edTelefonM: TDBEditEh
        Left = 638
        Top = 33
        Width = 109
        Height = 24
        DataField = 'TELEFON_M'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Visible = True
      end
    end
    object pnAdres: TPanel
      Left = 0
      Top = 58
      Width = 884
      Height = 183
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object pnZag: TPanel
        Left = 0
        Top = 0
        Width = 884
        Height = 60
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object Label38: TLabel
          Left = 10
          Top = 11
          Width = 35
          Height = 13
          Caption = #1040#1076#1088#1077#1089':'
        end
        object TextAdres: TvchDBText
          Left = 54
          Top = 8
          Width = 509
          Height = 18
          Color = clInfoBk
          DataField = 'ADRES_ID'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          OnGetText = TextAdresGetText
        end
        object ImageH: TImage
          Left = 840
          Top = 6
          Width = 35
          Height = 35
          Hint = #1089#1090#1088#1086#1080#1090' '#1046#1057#1050'('#1046#1057#1055#1050')'
          Picture.Data = {
            0B54504E474772617068696336100000424D3610000000000000360000002800
            0000200000002000000001002000000000000010000000000000000000000000
            000000000000FFFFFF00646464246464647E6464648164646481646464816464
            6481646464816464648164646481646464816464648164646481646464816464
            6481646464816464647E64646420646464106464647C64646481646464816464
            64816464648164646481646464816464648164646481646464816464642AFFFF
            FF00FFFFFF00FFFFFF006464647E646464FF646464FF646464FF646464FF6464
            64FF646464FF646464FF646464FF646464FF646464FF646464FF646464FF6464
            64FF646464FF646464FF6464647464646444646464FF646464FF646464E96464
            64ED646464FF646464FF646464E9646464D7646464F3646464FF6464647EFFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF646464ED646464BF6464
            64BF646464DD646464FF646464FF646464FF646464C9646464AB646464AB6464
            64E7646464FF646464FF6464647464646444646464FF646464A9FFFFFF006464
            6402646464EF646464FF6464642AFFFFFF006464646A646464FF6464647EFFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF6464645CFFFFFF00FFFF
            FF0064646416646464FF646464FF646464FF64646408FFFFFF00FFFFFF006464
            6462646464FF646464FF6464647464646444646464FF646464C16464642C6464
            6434646464F5646464FF646464646464643864646499646464FF6464647EFFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF6464644EFFFFFF00FFFF
            FF006464640A646464FF646464FF646464FFFFFFFF00FFFFFF00FFFFFF006464
            645A646464FF646464FF6464647464646444646464FF646464FF646464FF6464
            64FF646464FF646464FF646464FF646464FF646464FF646464FF6464647EFFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF64646493646464286464
            642864646456646464FF646464FF646464FF646464626464643C6464643C6464
            64A7646464FF646464FF6464647464646444646464FF646464ED646464856464
            6487646464F5646464FF646464A964646478646464B1646464FF6464647EFFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF646464FF646464FF6464
            64FF646464FF646464FF646464FF646464FF646464FF646464FF646464FF6464
            64FF646464FF646464FF6464647464646444646464FF646464BBFFFFFF00FFFF
            FF00646464CF646464FF6464643EFFFFFF006464644A646464FF6464647EFFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF646464FF646464FF6464
            64FF646464FF646464FF646464FF646464FF646464FF646464FF646464FF6464
            64FF646464FF646464FF6464647464646444646464FF646464EF6464648D6464
            648F646464F5646464FF646464C164646497646464C7646464FF6464647EFFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF646464E3646464916464
            648F646464A5646464FF646464FF646464FF646464B36464647C6464647C6464
            64BB646464FF646464FF6464647464646444646464FF646464EB646464916464
            6495646464FB646464FF646464AD64646483646464BF646464FF6464647EFFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF6464647AFFFFFF00FFFF
            FF00FFFFFF00646464E9646464FF646464FF64646428FFFFFF00FFFFFF006464
            6436646464FF646464FF6464647464646444646464FF646464AFFFFFFF00FFFF
            FF00646464DB646464FF64646430FFFFFF0064646458646464FF6464647EFFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF64646476FFFFFF00FFFF
            FF00FFFFFF00646464E3646464FF646464FF64646428FFFFFF00FFFFFF006464
            6434646464FF646464FF6464647464646444646464FF646464E7646464856464
            6489646464F9646464FF646464B76464648F646464C7646464FF6464647EFFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF646464CB646464586464
            64586464646C646464FD646464FF646464FF646464A76464646C6464646C6464
            64AF646464FF646464FF6464647464646444646464FF646464FB646464CD6464
            64D1646464FF646464FF646464D9646464BF646464E3646464FF6464647EFFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF646464FF646464FF6464
            64FF646464FF646464FF646464FF646464FF646464FF646464FF646464FF6464
            64FF646464FF646464FF6464647464646444646464FF646464B3FFFFFF00FFFF
            FF00646464DF646464FF64646434FFFFFF006464645A646464FF6464647EFFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF646464CD646464706464
            647064646491646464FF646464FF646464FF6464648F6464645C6464645C6464
            64B1646464FF646464FF6464647464646444646464FF646464D5646464486464
            644C646464F1646464FF6464648564646454646464A1646464FF6464647EFFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF64646464FFFFFF00FFFF
            FF0064646400646464F9646464FF646464FF64646414FFFFFF00FFFFFF006464
            6448646464FF646464FF6464647464646444646464FF646464FF646464FF6464
            64FF646464FF646464FF646464FF646464FF646464FF646464FF6464647EFFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF64646464FFFFFF00FFFF
            FF0064646400646464F9646464FF646464FF64646418FFFFFF00FFFFFF006464
            644A646464FF646464FF64646474646464106464648164646483646464836464
            64836464648364646483646464836464648364646483646464836464642CFFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF646464CF646464746464
            647464646495646464FF646464FF646464FF646464B564646487646464876464
            64CD646464FF646464FF64646474FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF646464FF646464FF6464
            64FF646464FF646464FF646464FF646464FF646464FF646464FF646464FF6464
            64FF646464FF646464FF64646474FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF646464E5646464A56464
            64A3646464BF646464FF646464FF646464FF646464B96464648F6464648F6464
            64D1646464FF646464FF64646474FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF6464646AFFFFFF00FFFF
            FF0064646404646464F9646464FF646464FF64646418FFFFFF00FFFFFF006464
            644C646464FF646464FF64646474FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF64646462FFFFFF00FFFF
            FF00FFFFFF00646464F7646464FF646464FF64646414FFFFFF00FFFFFF006464
            6446646464FF646464FF64646474FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF646464B5646464446464
            644464646466646464FF646464FF646464FF6464648D64646458646464586464
            64AF646464FF646464FF64646474FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0064646481646464FF646464FF646464FF646464FF6464
            64FF646464FF646464FF646464FF646464FF646464FF646464FF646464FF6464
            64FF646464FF646464FF64646474FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF006464647E646464FF646464FF646464FF646464FF6464
            64FF646464FF646464FF646464FF646464FF646464FF646464FF646464FF6464
            64FF646464FF646464FF64646474FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0064646430646464976464649764646497646464976464
            6497646464976464649764646497646464976464649764646497646464976464
            649764646497646464976464642AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF000000C1040000C10C0000C10C0000C10C0000C10C0000
            C10C0000C10C0000C10C0000C10E0000C1100000C1100000C1100000C1100000
            C1100000C1100000C1100000C106FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF000000C1080000C1970000C1FF0000C1FF0000C1FF0000
            C1FF0000C1FF0000C1FF0000C1FF0000C1FF0000C1FF0000C1FF0000C1FF0000
            C1FF0000C1FF0000C1950000C10AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000C15A0000C1F30000C1FF0000
            C1FF0000C1FF0000C1FF0000C1FF0000C1FF0000C1FF0000C1FF0000C1FF0000
            C1E70000C14AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000C12A0000C1D50000
            C1FF0000C1FF0000C1FF0000C1FF0000C1FF0000C1FF0000C1FF0000C1B10000
            C114FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000C10C0000
            C1A50000C1FF0000C1FF0000C1FF0000C1FF0000C1F50000C166FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF000000C1660000C1F30000C1FF0000C1C50000C126FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF000000C11A0000C1520000C100FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00}
        end
        object ImageU: TImage
          Left = 800
          Top = 6
          Width = 35
          Height = 35
          Hint = #1087#1088#1077#1076#1086#1089#1090#1072#1074#1083#1077#1085' '#1091#1095#1072#1089#1090#1086#1082
          Picture.Data = {
            055449636F6E0000010001002020000001001800A80C00001600000028000000
            20000000400000000100180000000000000C0000000000000000000000000000
            0000000000000000000000000000000000000065966021631C236E2225731C1D
            6E2F157E1D1C8B19166B2018691A1E76181B6A31196F27156D211B7621136E11
            1C731734832C2C712128671D0000000000000000000000000000000000000000
            0000000000000000000000000000000000000087A984558551538A5153834847
            7E571F6F221D7216437E4C5B8F5A59924E4577575782555C8B5A54865052854C
            5D8D59446C426786670000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00005E905A366D2895B19D000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000066915E558445000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00005286463C742B0000000000000000000000000000000000000000005D875E
            2D632E417B41367137336E343C712E59894F40683F0000000000000000000000
            0000000000000078927400000000000000000000000000000000000000000000
            00004E8F403E832C00000000000000000000000000000079A685346F3C337D35
            3A90382985261B7B173797333F892F3A822F4A89433266310000000000000000
            00000000000000395E30709D5800000000000000000000000000000000000000
            00005395433A80260000000000000000000000000000005C965B30772E2D8129
            187213258423308E2F1E7C1E257A281C711D3687323880333F753A0000000000
            0000000000000082AC753B732040742EA9CAAF00000000000000000000000000
            00005390402C7019000000000000000000000000598D473D762B397D2A38842C
            38893234863429752D3882402B81412D863C29832A368B2F4082335B87520000
            0000000000000000000079A6852C880B4E974700000000000000000000000000
            00003D99403F8E3F0000000000000000000000002778293485363C8D3E368738
            3081323182333384353384353183303F8B3D3782342F7F2C4193403A7C3B0000
            000000000000000000000000000000003876284C843DB0CCBF00000000000000
            000053A15A33703600000000000000000086AD8D2D7F2D348634378937338533
            328432378937388A383587353688363C883A39843631842F2A8129337C348BB2
            8C0000000000000000000000000000000000004383235FAD4F84C0AE00000000
            0000569A5F3F724600000000000000000069A575368836368836348634328432
            3587353A8C3A398B393486343786353682343A87363B91392381233A8A3D5081
            5300000000000000000000000000000000000000000039862B38875497B49B00
            0000519D564B884E000000000000689C6D3D974B3A8C39398B38378936368835
            378936388A3736883532843135873539853739873440983E2E9030398E3C457D
            4A00000000000072A75E0000000000000000000000000000004A8C3B4D874C68
            B7683A98393B8F37599852659E5F489748167B193688353789363A8C393B8D3A
            398B38368835358734378936378C373F8E3D348431369134359636267A285B8F
            5F000000000000488934508C200000000000000000000000000000004E8B492E
            7C2930902B399A32469A3C2B732158A05360AD5C378A35378A353A8D383D903B
            3B8E39388B363A8D383F923D358F363D903B338631328A30379439317C3295BF
            960000000000000000005D994154963D00000000000000000000000000000062
            975E3E8C393C963735862F619E5C000000000000489B463F923D398C373B8E39
            3C8F3A3A8D383C8F3A41943F339335348B333D903B398F37378C375D9F5E0000
            000000000000000000000000004190353F9624A4C6BC00000000000000000000
            0000649E642C772B5BA15A0000000000000000005BAF57499D453B8F37398D35
            3C90383B8F373B8F373D91393C9E3E328C324B9E49449742307F2E7FB97F0000
            000000000000000000000000000000004E962C45904400000000000000000000
            000000000071AB75000000000000000000000000439945369A3A29972D228A25
            4198424F9C4B388B36409E3F338C3D3B99403F9B3C3176268AAB7E0000000000
            0000000000000000000000000000000000000062A159539A339FC7AB00000000
            0000000000000000000000000000000000589D463F8A403E974146AD4B3FA442
            429742469342348A323A9B3A429A463A973C439A4287C4820000000000000000
            000000000000000000000000000000000000000000005E9F4A3C952E93BD9A00
            000000000000000000000000000066AC663E96326DA46B3C873D319035329234
            378C37489845429A403A9D39459D3F3D96394390460000000000000000000000
            0000000000000080A47A00000000000000000000000000000059B33C4CA43200
            00000000000000000000006CBC6949993400000000000066A6653A913B3E9C3E
            3C933B489B46429D403497333E9A3149A0443F86440000000000000000000000
            000000000000005CA34C2E7D2600000000000000000000000000000061B15855
            914300000000000053C34D31982982A58B0000000000006CA66B4197434EB050
            429C423D933B3D983B3DA03C43A03352AA4C4282460000000000000000000000
            0000000000000090BDA364AB5B619E4600000000000000000000000000000063
            9E5A55AC4C3AA53E369F446CAE7D00000000000000000061A1602E8B303DA540
            3C9F3D409A40439E4144A54448A83D49A3444586480000000000000000000000
            0000000000000000000000000069A74D4F8F4D00000000000000000000000000
            000073BF61459C2A7DA48E0000000000000000000000006CB56D3BA2403AAB3D
            3BA43D48A648449F423B993A42A73E419D3E5197510000000000000000000000
            000000000000000000000000000000005DB56F33923700000000000000000000
            00000000000000000000000000000000000000006697633E8C3F3EAB443AB13E
            309E3443A14248A04645A0433EA43F43A34562AB620000000000000000000000
            000000000000000000000000000000000000007EA77A57975500000000000000
            000000000000000000000000000000000048B14439A4433DA4433C9F3D55B753
            45A84243AA41309D313BAB3D4383478BBD8D0000000000000000000000000000
            000000000000000000000000000000000000000000007EB27C5C9C5A00000000
            000000000000000000000000000075BB68479B4D48A74C4AAB4D3FA240359733
            3E9A3B4DA24D6BB66A67B068A4D6A60000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000078A1745CA45200
            000000000000000000000062BC69369E2955A9574DA54B52B3524CB34A3BA239
            59B1577CBC7B0000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000066AD6B56
            98460000000000005AA85041A241379E434EC4433B9B3742AD4039AF383AAF3C
            4FAD4F7EB6810000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000080
            CA703A95405EA96B7FB7706DA16550A85C28B8234DB6494FC24D37B3373EB640
            43A34599CE9C0000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00007AD37D5AA55100000000000067AB5634AA414CB04A45AE453AA43945A846
            5DA85E0000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000070A57A60AF5E3F8B3D65AA617AB376
            99BF950000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000F80000FFF80001FFFFC7FFFFFFCFFFFFFFCFE01FBFCF800F9FCF8007
            87CF0003C7CF0003F1CE0001F8CE0001FC4C0001BE0000019F000001CF830003
            E3C70003F3EF0007F8FE000FFC7C001FBE79801F9F31801F8F83801FE7C7801F
            F3FF001FF9FE003FFCFC007FFE7803FFFF3003FFFF8003FFFFCC07FFFFFE07FF
            FFFFFFFF}
        end
        object btAdres: TBitBtn
          Left = 570
          Top = 6
          Width = 36
          Height = 22
          TabOrder = 0
          TabStop = False
          OnClick = btAdresClick
          Glyph.Data = {
            D6000000424DD600000000000000560000002800000010000000100000000100
            040000000000800000000000000000000000080000000800000004020400FCFE
            04000402840004868400FC02FC0004FEFC000402FC0084868400444444444444
            4444440000000000074444055555055037444400000505503744440011050550
            3744440011050550374444000005000037444003333333333774402266666666
            2674440226000262674444402261062674444444022662677444444440222607
            7444444444026707744444444440740004444444444444444444}
        end
        object N_F_cbBezAdresa: TDBCheckBoxEh
          Left = 624
          Top = 9
          Width = 157
          Height = 17
          Caption = #1073#1077#1079' '#1072#1076#1088#1077#1089#1072' '#1085#1072' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080
          DataField = 'BEZADRESA'
          DataSource = dsDokument
          TabOrder = 1
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = N_F_cbBezAdresaClick
        end
        object TextAdres2: TDBEditEh
          Left = 54
          Top = 31
          Width = 509
          Height = 24
          DataField = 'TEXT_ADRES'
          DataSource = dsDokument
          EditButtons = <
            item
              Glyph.Data = {
                C6000000424DC60000000000000076000000280000000A0000000A0000000100
                0400000000005000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888800
                0000008888880800000080088880080000008000880088000000880000088800
                0000888000888800000088000008880000008000880088000000800888800800
                00008088888888000000}
              Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
              Style = ebsGlyphEh
              OnClick = TextAdres2EditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
      end
      object pnLoadAdres: TPanel
        Left = 0
        Top = 60
        Width = 884
        Height = 60
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label75: TLabel
          Left = 71
          Top = 12
          Width = 41
          Height = 13
          Caption = #1086#1073#1083#1072#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label76: TLabel
          Left = 305
          Top = 12
          Width = 30
          Height = 13
          Caption = #1088#1072#1081#1086#1085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label67: TLabel
          Left = 616
          Top = 39
          Width = 28
          Height = 13
          Caption = #1082#1086#1088#1087'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 709
          Top = 39
          Width = 16
          Height = 13
          Caption = #1082#1074'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label66: TLabel
          Left = 522
          Top = 39
          Width = 19
          Height = 13
          Caption = #1076#1086#1084
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 8
          Top = 39
          Width = 64
          Height = 13
          Caption = #1088'-'#1086#1085'  '#1075#1086#1088#1086#1076#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 10
          Top = 11
          Width = 35
          Height = 13
          Caption = #1040#1076#1088#1077#1089':'
        end
        object Label26: TLabel
          Left = 259
          Top = 39
          Width = 30
          Height = 13
          Caption = #1091#1083#1080#1094#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edMR_B_GOROD: TDBLookupComboboxEh
          Left = 550
          Top = 6
          Width = 64
          Height = 24
          Alignment = taRightJustify
          DataField = 'MR_B_GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsTypeGorod
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object edMR_GOROD: TDBEditEh
          Left = 623
          Top = 6
          Width = 152
          Height = 24
          DataField = 'MR_GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = True
        end
        object edMR_RAION: TDBEditEh
          Left = 350
          Top = 6
          Width = 160
          Height = 24
          DataField = 'MR_RAION'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object edMR_OBL: TDBEditEh
          Left = 127
          Top = 6
          Width = 143
          Height = 24
          DataField = 'MR_OBL'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = True
        end
        object edMR_ULICA: TDBEditEh
          Left = 298
          Top = 33
          Width = 199
          Height = 24
          DataField = 'MR_ULICA'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Visible = True
        end
        object edMR_KV: TDBEditEh
          Left = 736
          Top = 33
          Width = 40
          Height = 24
          DataField = 'MR_KV'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Visible = True
        end
        object edMR_KORP: TDBEditEh
          Left = 655
          Top = 33
          Width = 40
          Height = 24
          DataField = 'MR_KORP'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          Visible = True
        end
        object edMR_DOM: TDBEditEh
          Left = 554
          Top = 33
          Width = 40
          Height = 24
          DataField = 'MR_DOM'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Visible = True
        end
        object edMR_GOROD_RN: TDBEditEh
          Left = 83
          Top = 33
          Width = 161
          Height = 24
          DataField = 'MR_GOROD_RN'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Visible = True
        end
      end
      object pnTextAdres: TPanel
        Left = 0
        Top = 120
        Width = 884
        Height = 60
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label24: TLabel
          Left = 10
          Top = 11
          Width = 35
          Height = 13
          Caption = #1040#1076#1088#1077#1089':'
        end
        object edTextAdres: TDBEditEh
          Left = 56
          Top = 6
          Width = 509
          Height = 24
          DataField = 'TEXT_ADRES'
          DataSource = dsDokument
          EditButtons = <
            item
              Glyph.Data = {
                C6000000424DC60000000000000076000000280000000A0000000A0000000100
                0400000000005000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888800
                0000008888880800000080088880080000008000880088000000880000088800
                0000888000888800000088000008880000008000880088000000800888800800
                00008088888888000000}
              Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
              Style = ebsGlyphEh
              Visible = False
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
    end
  end
  inherited StBar: TStatusBar
    Top = 757
    Width = 884
    Panels = <
      item
        Style = psOwnerDraw
        Text = '<F2> '#1079#1072#1087#1080#1089#1072#1090#1100'  <F5> '#1087#1088#1077#1076#1087#1088#1086#1089#1084#1086#1090#1088'  <F6> '#1087#1077#1095#1072#1090#1100'   <Ctrl-F2> '#1074#1099#1093#1086#1076
        Width = 50
      end>
  end
  inherited dsDokument: TDataSource
    Left = 520
    Top = 538
  end
  object dsMigr: TDataSource [5]
    OnStateChange = dsMigrStateChange
    OnDataChange = dsMigrDataChange
    Left = 748
    Top = 383
  end
  object dsPrizn: TDataSource [6]
    DataSet = dmMen.tbPriznaki
    OnDataChange = dsMigrDataChange
    Left = 676
    Top = 382
  end
  object dsLgot: TDataSource [7]
    DataSet = dmMen.tbLgot
    OnDataChange = dsMigrDataChange
    Left = 716
    Top = 390
  end
  object dsOsobOtm: TDataSource [8]
    Left = 736
    Top = 226
  end
  object dsKomiss: TDataSource [9]
    Left = 776
    Top = 242
  end
  inherited dsObl: TDataSource
    Left = 480
    Top = 226
  end
  inherited dsRN: TDataSource
    Left = 664
    Top = 242
  end
  inherited dsGorod: TDataSource
    Left = 720
    Top = 242
  end
  inherited dsStran: TDataSource
    Left = 620
    Top = 241
  end
  inherited dsTypeGorod: TDataSource
    Left = 312
    Top = 242
  end
  object dsSprPostOch: TDataSource
    DataSet = dmBase.SprPostOch
    Left = 540
    Top = 226
  end
  object dsSprSnOch: TDataSource
    DataSet = dmBase.SprSnOch
    Left = 704
    Top = 215
  end
  object dsSprTypeHouse: TDataSource
    DataSet = dmBase.SprTypeHouse
    Left = 428
    Top = 226
  end
  object dsSostavSem: TDataSource
    DataSet = dmMen.tbSostavSem
    OnDataChange = dsSostavSemDataChange
    Left = 97
    Top = 485
  end
  object dsOcheredLgot: TDataSource
    DataSet = dmMen.tbOcheredLgot
    OnDataChange = dsOcheredLgotDataChange
    Left = 65
    Top = 485
  end
  object dsOcheredResh: TDataSource
    DataSet = dmMen.tbOcheredResh
    OnDataChange = dsOcheredReshDataChange
    Left = 20
    Top = 486
  end
  object dsSobst: TDataSource
    DataSet = dmMen.tbOcheredSobstv
    Left = 152
    Top = 441
  end
  object DataSource1: TDataSource
    DataSet = dmMen.tbOcheredResh
    Left = 112
    Top = 640
  end
  object DataSource2: TDataSource
    DataSet = dmMen.tbOcheredReshA
    Left = 368
    Top = 624
  end
end
