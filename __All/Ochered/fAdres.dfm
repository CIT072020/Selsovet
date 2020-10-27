inherited fmAdres: TfmAdres
  Left = 304
  Top = 55
  Caption = #1040#1076#1088#1077#1089
  ClientHeight = 707
  ClientWidth = 904
  Constraints.MinHeight = 599
  OldCreateOrder = True
  OnHide = FormHide
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel [0]
    Left = 352
    Top = 65
    Width = 49
    Height = 13
    Caption = #1050#1074#1072#1088#1090#1080#1088#1072
  end
  inherited TBDock: TTBDock
    Width = 904
    inherited TBToolbar: TTBToolbar
      inherited TBItemDelList: TTBItem
        Visible = False
      end
    end
  end
  inherited sb: TScrollBox
    Width = 904
    Height = 662
    object pc: TPageControl
      Left = 0
      Top = 198
      Width = 904
      Height = 464
      ActivePage = tsMain
      Align = alClient
      TabOrder = 2
      OnChange = pcChange
      object tsMain: TTabSheet
        Caption = #1054#1089#1085#1086#1074#1085#1099#1077
        object Splitter1: TSplitter
          Left = 0
          Top = 180
          Width = 896
          Height = 5
          Cursor = crVSplit
          Align = alTop
        end
        object Splitter2: TSplitter
          Left = 624
          Top = 185
          Width = 5
          Height = 251
          Align = alRight
        end
        object gbVlMen: TGroupBox
          Left = 0
          Top = 185
          Width = 624
          Height = 251
          Align = alClient
          Caption = ' '#1051#1080#1094#1077#1074#1099#1077' '#1089#1095#1077#1090#1072' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object GridLich: TSasaDBGrid
            Left = 2
            Top = 15
            Width = 620
            Height = 234
            Align = alClient
            AllowedOperations = []
            Ctl3D = True
            DataSource = dsLichSchet
            DrawMemoText = True
            EditActions = [geaCopyEh, geaSelectAllEh]
            Flat = True
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
            HorzScrollBar.Visible = False
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentCtl3D = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            UseMultiTitle = True
            VertScrollBar.VisibleMode = sbNeverShowEh
            EnterDirection = mdNextGraph
            OptionsS = [dgsSelectCurrentColor]
            SelRowColor = clAqua
            Color1 = clBlack
            Color2 = clBlack
            TypeSave = 0
            Columns = <
              item
                EditButtons = <>
                FieldName = 'NOMER'
                Footers = <>
                Title.Caption = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072
                Width = 63
              end
              item
                EditButtons = <>
                FieldName = 'FIO'
                Footers = <>
                Title.Caption = #1043#1083#1072#1074#1072' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
                Width = 241
              end
              item
                EditButtons = <>
                FieldName = 'KNIGA_NOMER'
                Footers = <>
                Title.Caption = #1050#1085#1080#1075#1072'|'#1053#1086#1084#1077#1088
                Width = 52
              end
              item
                EditButtons = <>
                FieldName = 'KNIGA_STR'
                Footers = <>
                Title.Caption = #1050#1085#1080#1075#1072'|'#1057#1090#1088#1072#1085#1080#1094#1072
                Width = 91
              end>
          end
        end
        object gbSobstv: TGroupBox
          Left = 0
          Top = 0
          Width = 896
          Height = 180
          Align = alTop
          Caption = ' '#1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1080' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Panel1: TPanel
            Left = 788
            Top = 15
            Width = 106
            Height = 163
            Align = alRight
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object btAddMen: TBitBtn
              Left = 13
              Top = 4
              Width = 85
              Height = 25
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1072
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = btAddMenClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                888888888888888AA88888888888888AA88808888808888AA88808800088AAAA
                AAAA800FF088AAAAAAAA880F0008888AA888800FFFF0888AA8880000FFF0888A
                A888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
                8888800000000888888888000008888888888888888888888888}
            end
            object btDelMen: TBitBtn
              Left = 13
              Top = 70
              Width = 85
              Height = 25
              Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1072
              Caption = #1059#1076#1072#1083#1080#1090#1100
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = btDelMenClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000008000
                00000080000080800000000080008000800000808000C0C0C00080808000FF00
                000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF00777777777777
                777777777C7777777C7777777CC77777C777077777CC777C77770770007CCCC7
                7777700FF077CC777777770F000CCCC77777700FFCCC77CC77770000FCC07777
                C777000FFFFF07777777000FFF007777777700000FF0777777770000000F0777
                7777700000000777777777000007777777777777777777777777}
            end
            object btEditMen: TBitBtn
              Left = 13
              Top = 37
              Width = 85
              Height = 25
              Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1072
              Caption = #1050#1086#1088#1088#1077#1082#1090'.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnClick = btEditMenClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888888888888888888888888888880888880888888888088000888888
                8888800FF08888888888880F000888888888800FFFF0888888880000FFF08888
                8888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
                8888800000000888888888000008888888888888888888888888}
            end
            object cbHist: TDBCheckBoxEh
              Left = 13
              Top = 134
              Width = 79
              Height = 17
              Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1080#1089#1090#1086#1088#1080#1080' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1086#1074
              Caption = #1048#1089#1090#1086#1088#1080#1103
              TabOrder = 3
              ValueChecked = 'True'
              ValueUnchecked = 'False'
              OnClick = cbHistClick
            end
            object btRemove: TBitBtn
              Left = 13
              Top = 105
              Width = 85
              Height = 25
              Hint = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1072' '#1074' '#1080#1089#1090#1086#1088#1080#1102
              Caption = #1055#1077#1088#1077#1084'.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              OnClick = btRemoveClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888888888888888888888888888888808888808CCCCCCC808800088CCCC
                CCC8800FF088CCCCCCC8880F000888888888800FFFF0888888880000FFF08888
                8888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
                8888800000000888888888000008888888888888888888888888}
            end
          end
          object Panel3: TPanel
            Left = 2
            Top = 15
            Width = 786
            Height = 163
            Align = alClient
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object GridSobstv: TSasaDBGrid
              Left = 0
              Top = 0
              Width = 786
              Height = 163
              Align = alClient
              Ctl3D = True
              DataSource = dsHouseOwners
              DrawMemoText = True
              EditActions = [geaCopyEh, geaSelectAllEh]
              Flat = True
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
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
              ParentCtl3D = False
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              UseMultiTitle = True
              VertScrollBar.VisibleMode = sbNeverShowEh
              OnDblClick = GridSobstvDblClick
              EnterDirection = mdNextGraph
              OptionsS = [dgsSelectCurrentColor]
              SelRowColor = clAqua
              Color1 = clBlack
              Color2 = clBlack
              TypeSave = 0
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'TYPEKOD'
                  Footers = <>
                  ImageList = ImageList
                  Title.Caption = #1058#1080#1087
                  Width = 24
                  OnGetCellParams = GridSobstvColumns0GetCellParams
                end
                item
                  EditButtons = <>
                  FieldName = 'NAME'
                  Footers = <>
                  Title.Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086' / '#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
                  Width = 189
                  OnGetCellParams = GridSobstvColumns1GetCellParams
                end
                item
                  EditButtons = <>
                  FieldName = 'ADRES'
                  Footers = <>
                  Title.Caption = #1040#1076#1088#1077#1089
                  Width = 210
                end
                item
                  EditButtons = <>
                  FieldName = 'TAIL'
                  Footers = <>
                  Width = 46
                end
                item
                  EditButtons = <>
                  FieldName = 'DATES'
                  Footers = <>
                  Title.Caption = #1044#1072#1090#1072' '#1074#1083#1072#1076#1077#1085#1080#1103'|'#1085#1072#1095#1072#1083#1100#1085#1072#1103
                  Width = 67
                end
                item
                  EditButtons = <>
                  FieldName = 'DATEP'
                  Footers = <>
                  Title.Caption = #1044#1072#1090#1072' '#1074#1083#1072#1076#1077#1085#1080#1103'|'#1082#1086#1085#1077#1095#1085#1072#1103
                  Width = 85
                end>
            end
          end
        end
        object GroupBox1: TGroupBox
          Left = 629
          Top = 185
          Width = 267
          Height = 251
          Align = alRight
          Caption = ' '#1055#1088#1080#1079#1085#1072#1082#1080' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object Panel2: TPanel
            Left = 232
            Top = 15
            Width = 33
            Height = 234
            Align = alRight
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            DesignSize = (
              33
              234)
            object sbAdd: TSpeedButton
              Left = 5
              Top = 5
              Width = 24
              Height = 24
              Anchors = [akTop]
              OnClick = sbAddClick
            end
            object sbDel: TSpeedButton
              Left = 5
              Top = 38
              Width = 24
              Height = 24
              Anchors = [akTop]
              OnClick = sbDelClick
            end
          end
          object GridProp: TDBGridEh
            Left = 2
            Top = 15
            Width = 230
            Height = 234
            Align = alClient
            DataSource = dsHouseProps
            Flat = True
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
            Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            VertScrollBar.VisibleMode = sbNeverShowEh
            Columns = <
              item
                Alignment = taLeftJustify
                EditButtons = <>
                FieldName = 'KOD'
                Footers = <>
                Width = 220
              end>
          end
        end
      end
      object tsProp: TTabSheet
        Caption = #1057#1074#1086#1081#1089#1090#1074#1072
        ImageIndex = 1
        object sbProp: TScrollBox
          Left = 0
          Top = 0
          Width = 896
          Height = 436
          Align = alClient
          BorderStyle = bsNone
          ParentBackground = True
          TabOrder = 0
          OnResize = sbPropResize
        end
      end
      object tsMCHS: TTabSheet
        Caption = #1052#1063#1057
        ImageIndex = 4
        DesignSize = (
          896
          436)
        object Label19: TLabel
          Left = 13
          Top = 64
          Width = 148
          Height = 16
          Caption = #1053#1072#1083#1080#1095#1080#1077' '#1074#1099#1074#1086#1076#1072' '#1089#1080#1075#1085#1072#1083#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 13
          Top = 38
          Width = 189
          Height = 16
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1093' '#1040#1055#1048
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 13
          Top = 15
          Width = 88
          Height = 16
          Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 13
          Top = 90
          Width = 248
          Height = 16
          Caption = #1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1085#1086#1088#1084#1072#1084' '#1089#1080#1089#1090#1077#1084#1099' '#1086#1090#1086#1087#1083#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 13
          Top = 116
          Width = 255
          Height = 16
          Caption = #1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1085#1086#1088#1084#1072#1084' '#1101#1083#1077#1082#1090#1088#1080#1095#1077#1089#1082#1080#1093' '#1089#1077#1090#1077#1081
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 12
          Top = 142
          Width = 266
          Height = 16
          Caption = #1047#1072' '#1087#1088#1077#1076#1077#1083#1072#1084#1080' '#1085#1086#1088#1084#1072#1090#1080#1074#1085#1086#1075#1086' '#1088#1072#1076#1080#1091#1089#1072' '#1074#1099#1077#1079#1076#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edMS_API: TDBNumberEditEh
          Left = 327
          Top = 37
          Width = 32
          Height = 24
          DataField = 'MS_API'
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
        object edMS_OUT: TDBComboBoxEh
          Left = 327
          Top = 63
          Width = 313
          Height = 24
          DataField = 'MS_OUT'
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
        object edMS_OTOPL: TDBComboBoxEh
          Left = 327
          Top = 89
          Width = 57
          Height = 24
          DataField = 'MS_OTOPL'
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
        object edMS_ELPR: TDBComboBoxEh
          Left = 327
          Top = 115
          Width = 57
          Height = 24
          DataField = 'MS_ELPR'
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
        object edMS_DATE: TDBDateTimeEditEh
          Left = 327
          Top = 12
          Width = 100
          Height = 24
          HelpContext = 888
          DataField = 'MS_DATE'
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
          OnUpdateData = edDateKnUpdateData
        end
        object gbPrim: TGroupBox
          Left = 6
          Top = 163
          Width = 882
          Height = 147
          Anchors = [akLeft, akTop, akRight]
          Caption = ' '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          DesignSize = (
            882
            147)
          object edMS_PRIM: TDBEditEh
            Left = 8
            Top = 16
            Width = 865
            Height = 122
            Anchors = [akLeft, akTop, akRight, akBottom]
            AutoSize = False
            DataField = 'MS_PRIM'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Visible = True
            WantReturns = True
          end
        end
        object edMS_ZA_PRED: TDBComboBoxEh
          Left = 327
          Top = 141
          Width = 57
          Height = 24
          HelpContext = 999
          DataField = 'MS_ZA_PRED'
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
      end
      object tsBigHouse: TTabSheet
        Caption = #1047#1076#1072#1085#1080#1077
        ImageIndex = 2
        object Label13: TLabel
          Left = 13
          Top = 42
          Width = 119
          Height = 16
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1074#1072#1088#1090#1080#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbNameBigHouse: TLabel
          Left = 13
          Top = 15
          Width = 114
          Height = 16
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1090#1088#1086#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object cbGiloe: TDBCheckBoxEh
          Left = 13
          Top = 74
          Width = 97
          Height = 17
          Caption = #1046#1080#1083#1086#1077
          Color = clBtnFace
          DataField = 'GILOE'
          DataSource = dsBigHouse
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 2
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object cbOtdelno: TDBCheckBoxEh
          Left = 13
          Top = 123
          Width = 246
          Height = 17
          Caption = #1054#1090#1076#1077#1083#1100#1085#1086' '#1089#1090#1086#1103#1097#1077#1077' '#1079#1076#1072#1085#1080#1077
          Color = clBtnFace
          DataField = 'OTDELNO'
          DataSource = dsBigHouse
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object cbChet: TDBCheckBoxEh
          Left = 13
          Top = 99
          Width = 193
          Height = 17
          Caption = #1063#1105#1090#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1076#1086#1084#1072
          Color = clBtnFace
          DataField = 'CHET'
          DataSource = dsBigHouse
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 3
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edKolvoKv: TDBNumberEditEh
          Left = 183
          Top = 40
          Width = 50
          Height = 21
          DataField = 'KOL_KV'
          DataSource = dsBigHouse
          DecimalPlaces = 0
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
        object edNameBigHouse: TDBEditEh
          Left = 184
          Top = 13
          Width = 345
          Height = 21
          DataField = 'NAME'
          DataSource = dsBigHouse
          EditButtons = <>
          TabOrder = 0
          Visible = True
        end
      end
      object TabSheet1: TTabSheet
        Caption = #1051#1102#1076#1080
        ImageIndex = 3
        object gbSostav: TGroupBox
          Left = 0
          Top = 0
          Width = 896
          Height = 436
          Align = alClient
          Caption = ' '#1051#1102#1076#1080' '#1087#1088#1086#1078#1080#1074#1072#1102#1097#1080#1077' '#1087#1086' '#1072#1076#1088#1077#1089#1091' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object GridMens: TSasaDBGrid
            Left = 2
            Top = 15
            Width = 785
            Height = 419
            Align = alClient
            Ctl3D = True
            DataSource = dsMens
            DrawMemoText = True
            EditActions = [geaCopyEh, geaSelectAllEh]
            Flat = True
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
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
            ParentCtl3D = False
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            UseMultiTitle = True
            VertScrollBar.VisibleMode = sbNeverShowEh
            OnGetCellParams = GridMensGetCellParams
            EnterDirection = mdNextGraph
            OptionsS = []
            SelRowColor = clAqua
            Color1 = clRed
            Color2 = clBlue
            TypeSave = 0
            Columns = <
              item
                EditButtons = <>
                FieldName = 'NSTR'
                Footers = <>
                Title.Caption = #8470
                Width = 22
              end
              item
                EditButtons = <>
                FieldName = 'NOMER'
                Footers = <>
                Title.Caption = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072
                Width = 44
              end
              item
                EditButtons = <>
                FieldName = 'FAMILIA'
                Footers = <>
                Width = 111
              end
              item
                EditButtons = <>
                FieldName = 'NAME'
                Footers = <>
                Width = 83
              end
              item
                EditButtons = <>
                FieldName = 'OTCH'
                Footers = <>
                Width = 105
              end
              item
                EditButtons = <>
                FieldName = 'DATER'
                Footers = <>
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = 'POL'
                Footers = <>
                Width = 66
                OnGetCellParams = GridMensColumns6GetCellParams
              end
              item
                EditButtons = <>
                FieldName = 'DATEP'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1087#1080#1089#1082#1080
                Width = 77
              end
              item
                EditButtons = <>
                FieldName = 'DATEV'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072' '#1074#1099#1087#1080#1089#1082#1080
                Width = 74
              end>
          end
          object pnWorkMens: TPanel
            Left = 787
            Top = 15
            Width = 107
            Height = 419
            Align = alRight
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object BitBtn1: TBitBtn
              Left = 13
              Top = 203
              Width = 85
              Height = 25
              Hint = #1059#1076#1072#1083#1080#1090#1100' '#1095#1083#1077#1085#1072' '#1093#1086#1079#1103#1081#1089#1090#1074#1072
              Caption = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 0
              Visible = False
              OnClick = btDelMenClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000008000
                00000080000080800000000080008000800000808000C0C0C00080808000FF00
                000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF00777777777777
                777777777C7777777C7777777CC77777C777077777CC777C77770770007CCCC7
                7777700FF077CC777777770F000CCCC77777700FFCCC77CC77770000FCC07777
                C777000FFFFF07777777000FFF007777777700000FF0777777770000000F0777
                7777700000000777777777000007777777777777777777777777}
            end
            object BitBtn2: TBitBtn
              Left = 13
              Top = 170
              Width = 85
              Height = 25
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1095#1083#1077#1085#1072' '#1093#1086#1079#1103#1081#1089#1090#1074#1072
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100
              TabOrder = 1
              Visible = False
              OnClick = btAddMenClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                888888888888888AA88888888888888AA88808888808888AA88808800088AAAA
                AAAA800FF088AAAAAAAA880F0008888AA888800FFFF0888AA8880000FFF0888A
                A888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
                8888800000000888888888000008888888888888888888888888}
            end
            object btEditMenAdres: TBitBtn
              Left = 13
              Top = 62
              Width = 85
              Height = 25
              Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1095#1083#1077#1085#1072' '#1093#1086#1079#1103#1081#1089#1090#1074#1072
              Caption = #1050#1086#1088#1088#1077#1082#1090'.'
              TabOrder = 2
              Visible = False
              OnClick = btEditMenAdresClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888888888888888888888888888880888880888888888088000888888
                8888800FF08888888888880F000888888888800FFFF0888888880000FFF08888
                8888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
                8888800000000888888888000008888888888888888888888888}
            end
            object btChoiceMen: TBitBtn
              Left = 13
              Top = 101
              Width = 85
              Height = 25
              Hint = #1042#1099#1073#1088#1072#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072' '#1080#1079' '#1085#1072#1089#1077#1083#1077#1085#1080#1103
              Caption = #1042#1099#1073#1088#1072#1090#1100
              TabOrder = 3
              Visible = False
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                888888888888888E88888888888888EEE888088888088EEEE88808800088EEE8
                EE88800FF0888E888EE8880F0008888888EE800FFFF08888888E0000FFF08888
                8888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
                8888800000000888888888000008888888888888888888888888}
            end
            object btIsklMen: TBitBtn
              Left = 13
              Top = 133
              Width = 85
              Height = 25
              Hint = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1095#1083#1077#1085#1072' '#1093#1086#1079#1103#1081#1089#1090#1074#1072' '#1080#1079' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
              Caption = #1048#1089#1082#1083#1102#1095'. '
              TabOrder = 4
              Visible = False
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888888888888888888888888888888808888808CCCCCCC808800088CCCC
                CCC8800FF088CCCCCCC8880F000888888888800FFFF0888888880000FFF08888
                8888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
                8888800000000888888888000008888888888888888888888888}
            end
            object btUp: TBitBtn
              Left = 12
              Top = 18
              Width = 20
              Height = 25
              Hint = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072' '#1074#1074#1077#1088#1093
              TabOrder = 5
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
              Left = 36
              Top = 18
              Width = 20
              Height = 25
              Hint = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072' '#1074#1085#1080#1079
              TabOrder = 6
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
        end
      end
    end
    object pnMain: TPanel
      Left = 0
      Top = 0
      Width = 904
      Height = 68
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        904
        68)
      object vchDBText1: TvchDBText
        Left = 9
        Top = 2
        Width = 577
        Height = 25
        DataField = 'ID'
        DataSource = dsDokument
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnGetText = vchDBText1GetText
      end
      object iPrivateSect: TImage
        Left = 852
        Top = 3
        Width = 32
        Height = 32
        Hint = #1063#1072#1089#1090#1085#1099#1081' '#1089#1077#1082#1090#1086#1088
        Picture.Data = {
          055449636F6E0000010001002020000001001800A80C00001600000028000000
          2000000040000000010018000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000282828B6B6B4C7C7C5CECECDD0D0CDD0D0CDD0D0CDD0D0CED0
          D0CED0D0CED0D0CED0D0CED0D0CED0D0CED1D1CFD1D1CFD1D1CFD1D1CFD1D1CF
          D1D1CFD1D1CFD2D2CFD2D2CFD2D2D0D2D2D0D2D2D0D2D2D0CBCBC8B7B7B62929
          29000000282828B9B9B693938D8F8F898E8E858B8B818B8B818B8B818B8B818B
          8B818B8B818B8B818B8B818B8B818B8B818B8B818B8B818B8B818B8B818B8B81
          8B8B818B8B828B8B828B8B828B8B828B8B828C8C828F8F8593938D989892BDBD
          BA2929288A8A877E7E768888808D8D848E8E848E8E848E8E848E8E848E8E848E
          8E848E8E848E8E848E8E848E8E848E8E848E8E848E8E848E8E848E8E848E8E84
          8E8E848E8E848E8E848E8E848E8E848E8E848E8E848E8E848D8D848B8B838383
          7B8D8D897676706F6F669B9B909C9C919C9C919C9C919C9C919C9C919C9C919C
          9C919C9C919C9C919C9C919C9C919C9C919C9C919C9C919C9C919C9C919C9C91
          9C9C919C9C919C9C919C9C919C9C919C9C919C9C919C9C919C9C919B9B907373
          6A7979726A6A61717167A7A79CADADA3B7B7ADBABAB0BBBBB1BBBBB1BBBBB1CA
          CAC4CFCFCBCFCFCBCFCFCBCFCFCBCFCFCBCFCFCBCFCFCBCFCFCBCFCFCBCFCFCB
          CFCFCBCFCFCBCFCFCBBBBBB1BBBBB1BBBBB1BABAB0B7B7ADADADA3A7A79C7373
          696C6C635D5D53757569B5B5ABBDBDB3BDBDB3BDBDB3BDBDB3BDBDB3BDBDB378
          78702C2C222C2C222C2C222C2C222B2B202A2A212A2A212A2A212B2B212C2C22
          2C2C222C2C222C2C22BABAB0BDBDB3BDBDB3BDBDB3BDBDB3BDBDB3B5B5AB7575
          6A5E5E555A5A50727268BFBFB4BFBFB5BFBFB5BFBFB5BFBFB5BFBFB5BFBFB57A
          7A722E2E2475756BA8A89DA8A89D3C3C332E2E242E2E242E2E24818176A8A89D
          A8A89D3030272E2E24BDBDB4BFBFB5BFBFB5BFBFB5BFBFB5BFBFB5BFBFB47272
          685A5A505A5A50707066C0C0B6C0C0B6C0C0B6C0C0B6C0C0B6C0C0B6C0C0B67C
          7C7530302685857BC0C0B6C0C0B6434339323228323228323228939389C0C0B6
          C0C0B634342A303026BFBFB5C0C0B6C0C0B6C0C0B6C0C0B6C0C0B6C0C0B67070
          665A5A505A5A50717166C2C2B8C2C2B8C2C2B8C2C2B8C2C2B8C2C2B8C2C2B87E
          7E7733332988887EC2C2B8C2C2B846463D36362C36362C36362C96968CC2C2B8
          C2C2B837372D333329C2C2B8C2C2B8C2C2B8C2C2B8C2C2B8C2C2B8C2C2B87171
          665A5A505A5A50717167C4C4BAC4C4BAC4C4BAC4C4BAC4C4BAC4C4BAC4C4BA82
          827A35352B8A8A80C4C4BAC4C4BA4A4A403A3A303A3A303A3A3097978DC3C3B9
          C3C3B939392F37372DC4C4BAC4C4BAC4C4BAC4C4BAC4C4BAC4C4BAC4C4BA7171
          675A5A505A5A50717167C6C6BCC6C6BCC6C6BCC6C6BCC6C6BCC6C6BCC6C6BC84
          847D37372D8B8B81C5C5BBC5C5BB4D4D443E3E343E3E343E3E349A9A90C5C5BB
          C5C5BB3B3B313A3A30C6C6BCC6C6BCC6C6BCC6C6BCC6C6BCC6C6BCC6C6BC7171
          675A5A505A5A50727268C8C8BEC8C8BEC8C8BEC8C8BEC8C8BEC8C8BEC8C8BE86
          86803A3A308E8E84C7C7BDC7C7BD5252474242384242384242389D9D93C7C7BD
          C7C7BD3E3E343F3F35C8C8BEC8C8BEC8C8BEC8C8BEC8C8BEC8C8BEC8C8BE7272
          685A5A505A5A50727268CACAC0CACAC0CACAC0CACAC0B6B6ADBEBEB5CACAC08A
          8A813C3C32909086C9C9BFC9C9BF55554C46463C46463C46463C9F9F96C9C9BF
          C9C9BF404036434339CACAC0C7C7BDC7C7BDCACAC0CACAC0CACAC0CACAC07272
          685A5A505A5A50737369CCCCC2CCCCC2CCCCC2BBBBB34C4C43525249BCBCB48B
          8B843E3E34929288CBCBC1CBCBC1B1B1A7AEAEA4AEAEA4AEAEA4C2C2B8CBCBC1
          CBCBC142423846463DC9C9BF75756D7A7A73CACAC0CCCCC2CCCCC2CCCCC27373
          695A5A505A5A50737369CDCDC3CDCDC3CDCDC3B8B8AF4D4D434141374E4E4571
          716941413794948ACDCDC3CDCDC3CDCDC3CDCDC3CDCDC3CDCDC3CDCDC3CCCCC2
          CCCCC244443B48483F73736B414137414137A8A8A0CDCDC3CDCDC3CDCDC37373
          695A5A505A5A50737369CFCFC5CFCFC5CFCFC5CFCFC5BBBBB351514843433943
          433943433996968CCECEC4CECEC4CECEC4CECEC4CECEC4CECEC4CECEC4CECEC4
          CECEC446463D434339434339434339909087CFCFC5CFCFC5CFCFC5CFCFC57373
          695A5A505A5A5074746AD1D1C7D1D1C7D1D1C7D1D1C7D1D1C7C0C0B757574E45
          453B45453B919187D0D0C6D0D0C6D0D0C6D0D0C6D0D0C6D0D0C6D0D0C6D0D0C6
          CACAC047473D45453B45453B95958ED1D1C7D1D1C7D1D1C7D1D1C7D1D1C77474
          6A5A5A505A5A5074746AD3D3C9D3D3C9D3D3C9D3D3C9D3D3C9D3D3C9C5C5BB5C
          5C5347473D4C4C43AEAEA5D2D2C8D2D2C8D2D2C8D2D2C8D2D2C8D2D2C8CCCCC1
          69695E47473D47473D9B9B92D3D3C9D3D3C9D3D3C9D3D3C9D3D3C9D3D3C97474
          6A5A5A505A5A5075756BD5D5CBD5D5CBD5D5CBD5D5CBD5D5CBD5D5CBD5D5CBC8
          C8C05C5C534A4A404E4E44AFAFA4D4D4CAD4D4CAD4D4CAD4D4CACCCCC36A6A60
          4A4A404A4A409F9F99D5D5CBD5D5CBD5D5CBD5D5CBD5D5CBD5D5CBD5D5CB7575
          6B5A5A505A5A5075756BD7D7CDD7D7CDD7D7CDD7D7CDD7D7CDD7D7CDD7D7CDD7
          D7CD7A7A734C4C424C4C424F4F46AEAEA4D6D6CCD6D6CCCDCDC36A6A604C4C42
          4C4C42A4A49DD7D7CDD7D7CDD7D7CDD7D7CDD7D7CDD7D7CDD7D7CDD7D7CD7575
          6B5A5A505A5A5079796FD9D9CFD9D9CFD9D9CFD9D9CFD9D9CFD9D9CFD9D9CFD9
          D9CF7B7B744E4E444E4E444E4E44515147ACACA2CECEC46A6A604E4E444E4E44
          AAAAA2D9D9CFD9D9CFD9D9CFD9D9CFD9D9CFD9D9CFD9D9CFD9D9CFD9D9CF7979
          6F5A5A505A5A507F7F75DDDDD4DADAD0DADAD0DADAD0DADAD0DADAD0DADAD0DA
          DAD07D7D765151477C7C7370706851514752524864645B515147515147AEAEA7
          DADAD0DADAD0DADAD0DADAD0DADAD0DADAD0DADAD0DADAD0DADAD0DDDDD47F7F
          755A5A505A5A507F7F76E9E9E2DEDED5DCDCD2DCDCD2DCDCD2DCDCD2DCDCD2DC
          DCD2808078535349898981D5D5CB75756D53534953534954544AB3B3ABDCDCD2
          DCDCD2DCDCD2DCDCD2DCDCD2DCDCD2DCDCD2DCDCD2DCDCD2DEDED5E9E9E27F7F
          765A5A505A5A5064645AEFEFEAEFEFEAEAEAE3E6E6DFE6E6DEE6E6DEE6E6DEE6
          E6DE85857D59594F8F8F88E6E6DEDFDFD77B7B7357574EBBBBB4E6E6DEE6E6DE
          E6E6DEE6E6DEE6E6DEE6E6DEE6E6DEE6E6DEE6E6DFEAEAE3EFEFEAEFEFEA6464
          5A5A5A505252485A5A50D0D0CAF4F4F1F4F4F1F4F4F1F4F4F1F4F4F1F4F4F1F4
          F4F1F4F4F1F4F4F1F4F4F1F4F4F1F4F4F1EDEDE9CFCFCAF4F4F1F4F4F1F4F4F1
          F4F4F1F4F4F1F4F4F1F4F4F1F4F4F1F4F4F1F4F4F1F4F4F1F4F4F1D0D0CA5A5A
          505252483C3C355A5A5067675DDADAD5F8F8F6F8F8F6F8F8F6F8F8F6F8F8F6F8
          F8F6F8F8F6F8F8F6F8F8F6F8F8F6F8F8F6F8F8F6F8F8F6F8F8F6F8F8F6F8F8F6
          F8F8F6F8F8F6F8F8F6F8F8F6F8F8F6F8F8F6F8F8F6F8F8F6DADAD567675D5A5A
          503C3C350A0A0954544A5A5A505A5A5069695F8989808B8B828B8B828B8B828B
          8B828B8B828B8B828B8B828B8B828B8B828B8B828B8B828B8B828B8B828B8B82
          8B8B828B8B828B8B828B8B828B8B828B8B8289898069695F5A5A505A5A505454
          4A0A0A090000000A0A083A3A335050475A5A505A5A505A5A505A5A505A5A505A
          5A505A5A505A5A505A5A505A5A505A5A505A5A505A5A505A5A505A5A505A5A50
          5A5A505A5A505A5A505A5A505A5A505A5A505A5A505A5A505050473A3A330A0A
          0800000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000}
        Visible = False
      end
      object Label4: TLabel
        Left = 8
        Top = 44
        Width = 18
        Height = 13
        Caption = #1058#1080#1087
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 274
        Top = 44
        Width = 55
        Height = 13
        Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
      end
      object iUchastok: TImage
        Left = 852
        Top = 3
        Width = 32
        Height = 32
        Hint = #1063#1072#1089#1090#1085#1099#1081' '#1089#1077#1082#1090#1086#1088
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
        Visible = False
      end
      object edTip: TDBComboBoxEh
        Left = 46
        Top = 38
        Width = 202
        Height = 24
        DataField = 'TIP'
        DataSource = dsDokument
        DropDownBox.Rows = 15
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
        OnChange = edTipChange
      end
      object edOsnovDate: TDBDateTimeEditEh
        Left = 346
        Top = 38
        Width = 100
        Height = 24
        Hint = #1044#1072#1090#1072' '#1088#1077#1096#1077#1085#1080#1103
        DataField = 'OSNOV_DATE'
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
        Visible = True
      end
      object edOsnov: TDBEditEh
        Left = 460
        Top = 38
        Width = 394
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataField = 'OSNOV'
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
    object pnHouse: TPanel
      Left = 0
      Top = 68
      Width = 904
      Height = 130
      Align = alTop
      TabOrder = 1
      object Label9: TLabel
        Left = 8
        Top = 70
        Width = 105
        Height = 13
        Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1083#1103#1077#1090' '#1089#1086#1073#1086#1081
      end
      object Label10: TLabel
        Left = 398
        Top = 70
        Width = 146
        Height = 13
        Caption = #1055#1086#1084#1077#1097#1077#1085#1080#1077' '#1088#1072#1089#1087#1086#1083#1086#1078#1077#1085#1086' '#1085#1072' '
      end
      object Label11: TLabel
        Left = 601
        Top = 70
        Width = 31
        Height = 13
        Caption = #1101#1090#1072#1078#1077
      end
      object Label12: TLabel
        Left = 686
        Top = 70
        Width = 103
        Height = 13
        Caption = #1101#1090#1072#1078#1085#1086#1075#1086' '#1079#1076#1072#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 8
        Top = 97
        Width = 49
        Height = 13
        Caption = #1046#1080#1083#1092#1086#1085#1076
      end
      object Label14: TLabel
        Left = 8
        Top = 13
        Width = 126
        Height = 13
        Caption = #1053#1072#1093#1086#1076#1080#1090#1089#1103' '#1074' '#1074#1077#1076#1077#1085#1080#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 8
        Top = 41
        Width = 175
        Height = 13
        Caption = #1054#1089#1091#1097#1077#1089#1090#1074#1083#1103#1077#1090' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1102
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edEtag: TDBNumberEditEh
        Left = 560
        Top = 64
        Width = 32
        Height = 24
        DataField = 'ETAG'
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
      object edKol_Etag: TDBNumberEditEh
        Left = 645
        Top = 64
        Width = 30
        Height = 24
        DataField = 'KOL_ETAG'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
      object edPredst: TDBLookupComboboxEh
        Left = 132
        Top = 64
        Width = 243
        Height = 24
        DataField = 'PREDST'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dsPredst
        ParentFont = False
        TabOrder = 2
        Visible = True
      end
      object edGilfond: TDBComboBoxEh
        Left = 73
        Top = 91
        Width = 272
        Height = 24
        DataField = 'GILFOND'
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
      object N_F_edPrivateSect: TDBCheckBoxEh
        Left = 612
        Top = 11
        Width = 179
        Height = 17
        Caption = #1074' '#1095#1072#1089#1090#1085#1086#1081' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1080
        Color = clBtnFace
        DataField = 'PRIVATE_SECT'
        DataSource = dsBigHouse
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 4
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        Visible = False
        OnClick = N_F_edPrivateSectClick
      end
      object edControlHouse: TDBComboBoxEh
        Left = 158
        Top = 7
        Width = 433
        Height = 24
        Hint = #1053#1072#1093#1086#1076#1080#1090#1089#1103' '#1074' '#1074#1077#1076#1077#1085#1080#1080', '#1093#1086#1079#1103#1081#1089#1090#1074#1077#1085#1085#1086#1084' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1080
        DataField = 'CONTROL'
        DataSource = dsBigHouse
        EditButton.Width = 20
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
            Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1080#1079' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
            Style = ebsGlyphEh
            Width = 20
            OnClick = edControlHouseEditButtons0Click
          end
          item
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000008000
              00000080000080800000000080008000800000808000C0C0C00080808000FF00
              000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF00888888888888
              8888888888888888888888808888808888888880880008888888888800FF0888
              8888888880F000888888888800FFFF0888888880000FFF088888888000FFFFF0
              8888888000FFF008888888800000FF0888888880000000F08888888800000000
              8888888880000088888888888888888888888888888888888888}
            Hint = #1042' '#1095#1072#1089#1090#1085#1086#1081' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1080
            Style = ebsGlyphEh
            Width = 20
            OnClick = edControlHouseEditButtons1Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        Visible = True
        OnUpdateData = edControlHouseUpdateData
      end
      object edUseGilfond: TDBComboBoxEh
        Left = 201
        Top = 35
        Width = 408
        Height = 24
        Hint = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1086#1089#1091#1097#1077#1089#1090#1074#1083#1103#1102#1097#1072#1103' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1102
        DataField = 'USE_GILFOND'
        DataSource = dsBigHouse
        EditButton.Width = 20
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
            Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1080#1079' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
            Style = ebsGlyphEh
            Width = 20
            OnClick = edUseGilfondEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        Visible = True
      end
      object N_F_cbSpecUch: TDBCheckBoxEh
        Left = 400
        Top = 95
        Width = 353
        Height = 17
        Caption = #1085#1072' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1084' '#1091#1095#1077#1090#1077' ('#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1079#1072#1087#1088#1077#1097#1077#1085#1072')'
        DataField = 'SPEC_UCH'
        DataSource = dsDokument
        TabOrder = 7
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 688
    Width = 904
    Panels = <
      item
        Style = psOwnerDraw
        Text = '<F2> '#1079#1072#1087#1080#1089#1072#1090#1100'   <F3> '#1086#1090#1084#1077#1090#1080#1090#1100' <Ctrl-F2> '#1074#1099#1093#1086#1076
        Width = 50
      end>
  end
  inherited dsDokument: TDataSource
    Left = 544
    Top = 218
  end
  inherited dsObl: TDataSource
    Left = 592
    Top = 410
  end
  inherited dsRN: TDataSource
    Left = 408
    Top = 338
  end
  inherited dsGorod: TDataSource
    Left = 464
    Top = 378
  end
  inherited dsStran: TDataSource
    Left = 460
    Top = 345
  end
  inherited dsTypeGorod: TDataSource
    Left = 528
    Top = 354
  end
  object dsUL: TDataSource
    DataSet = dmBase.SprUL
    Left = 560
    Top = 382
  end
  object dsPunkt: TDataSource
    DataSet = dmBase.SprPunkt
    Left = 480
    Top = 430
  end
  object dsLichSchet: TDataSource
    DataSet = dmAdres.mtLichSchet
    Left = 608
    Top = 326
  end
  object dsDopProp: TDataSource
    DataSet = dmAdres.tbDopProp
    OnDataChange = dsDopPropDataChange
    Left = 560
    Top = 326
  end
  object dsHouseProps: TDataSource
    DataSet = dmAdres.tbHouseProps
    OnDataChange = dsHousePropsDataChange
    Left = 631
    Top = 362
  end
  object dsHouseOwners: TDataSource
    DataSet = dmAdres.tbHouseOwners
    OnDataChange = dsHouseOwnersDataChange
    Left = 404
    Top = 378
  end
  object ImageList: TImageList
    Left = 596
    Top = 202
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008482040084820400848204008482
      0400848204000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008482040084820400848204008482
      0400848204000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848204008482040084820400848204008482
      0400848204008482040000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000808000008080000080
      8000008080000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000848204008482040084820400848204008482
      0400848204008482040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084820400848204008482040084820400848204008482
      0400848204008482040084820400000000000000000000000000000000000000
      0000000000000000000000808000008080000080800000808000008080000080
      8000008080000080800000808000000000000000000000000000000000000000
      0000000000000000000084820400848204008482040084820400848204008482
      0400848204008482040084820400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FC020400FC020400FC020400FC020400FC020400848204008482
      0400848204008482040084820400000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000008080000080
      8000008080000080800000808000000000000000000000000000000000000000
      0000000000000402FC000402FC000402FC000402FC000402FC00848204008482
      0400848204008482040084820400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FC020400FC020400FC020400FC020400FC020400FC020400FC0204008482
      0400848204008482040084820400000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000080
      8000008080000080800000808000000000000000000000000000000000000000
      00000402FC000402FC000402FC000402FC000402FC000402FC000402FC008482
      0400848204008482040084820400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FC02
      0400FC020400FC020400FC020400FC020400FC020400FC020400FC020400FC02
      04008482040084820400848204000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000008080000080800000808000000000000000000000000000000000000402
      FC000402FC000402FC000402FC000402FC000402FC000402FC000402FC000402
      FC00848204008482040084820400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FC02
      0400FC020400FC020400FC020400FC020400FC020400FC020400FC020400FC02
      04008482040084820400000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000008080000080800000000000000000000000000000000000000000000402
      FC000402FC000402FC000402FC000402FC000402FC000402FC000402FC000402
      FC00848204008482040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FC02
      0400FCFEFC00FCFEFC00FC020400FC020400FC020400FC020400FC020400FC02
      04008482040000000000000000000000000000000000000000000000000000FF
      0000FFFFFF00FFFFFF0000FF000000FF000000FF000000FF000000FF000000FF
      0000008080000000000000000000000000000000000000000000000000000402
      FC00FCFEFC00FCFEFC000402FC000402FC000402FC000402FC000402FC000402
      FC00848204000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FC02
      0400FCFEFC00FCFEFC00FC020400FC020400FC020400FC020400FC020400FC02
      04000000000000000000000000000000000000000000000000000000000000FF
      0000FFFFFF00FFFFFF0000FF000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000402
      FC00FCFEFC00FCFEFC000402FC000402FC000402FC000402FC000402FC000402
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FC020400FC020400FC020400FC020400FC020400FC020400FC0204000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000402FC000402FC000402FC000402FC000402FC000402FC000402FC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FC020400FC020400FC020400FC020400FC020400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000402FC000402FC000402FC000402FC000402FC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      FF07FF07FF070000FE03FE03FE030000FC01FC01FC010000F801F801F8010000
      F001F001F0010000E001E001E0010000E003E003E0030000E007E007E0070000
      E00FE00FE00F0000F01FF01FF01F0000F83FF83FF83F0000FFFFFFFFFFFF0000
      FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object dsPredst: TDataSource
    DataSet = dmBase.SprPredst
    Left = 524
    Top = 409
  end
  object dsBigHouse: TDataSource
    DataSet = dmAdres.mtBigHouse
    OnDataChange = dsBigHouseDataChange
    Left = 712
    Top = 194
  end
  object dsMens: TDataSource
    DataSet = dmMen.mtDokument
    Left = 368
    Top = 343
  end
end
