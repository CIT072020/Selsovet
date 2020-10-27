inherited fmMen: TfmMen
  Left = 462
  Top = 97
  Caption = #1063#1077#1083#1086#1074#1077#1082
  ClientHeight = 742
  ClientWidth = 834
  Constraints.MinHeight = 780
  Constraints.MinWidth = 850
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
  inherited TBDock: TTBDock
    Width = 834
    inherited TBToolbar: TTBToolbar
      inherited TBItemDelList: TTBItem
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
        Visible = False
      end
      object TBItemTalonPrib: TTBItem [5]
        Caption = #1058#1072#1083#1086#1085
        Hint = #1042#1099#1087#1080#1089#1072#1090#1100' '#1090#1072#1083#1086#1085' '#1087#1088#1080#1073#1099#1090#1080#1103
        ImageIndex = 48
        ShortCut = 16468
        OnClick = TBItemTalonPribClick
      end
      inherited TBSubmenuRun: TTBSubmenuItem
        Visible = True
      end
    end
  end
  inherited sb: TScrollBox
    Width = 834
    Height = 697
    object pc: TPageControl
      Left = 0
      Top = 87
      Width = 834
      Height = 610
      ActivePage = tsOchered
      Align = alClient
      TabOrder = 0
      TabStop = False
      OnChange = pcChange
      object tsMain: TTabSheet
        Caption = #1054#1089#1085#1086#1074#1085#1099#1077
        object gbObraz: TGroupBox
          Left = 0
          Top = 311
          Width = 826
          Height = 74
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
            Left = 242
            Top = 22
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
            Left = 562
            Top = 48
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
            Top = 50
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
            Left = 623
            Top = 22
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
          object edStud_Place: TDBEditEh
            Left = 120
            Top = 44
            Width = 425
            Height = 21
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
            TabOrder = 4
            Visible = True
          end
          object edKurs: TDBEditEh
            Left = 692
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
            TabOrder = 2
            Visible = True
          end
          object edObraz: TDBComboBoxEh
            Left = 13
            Top = 16
            Width = 204
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
            Left = 290
            Top = 16
            Width = 315
            Height = 24
            DataField = 'STUDENT'
            DataSource = dsDokument
            DropDownBox.Rows = 10
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
            Left = 660
            Top = 42
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
            TabOrder = 3
            Visible = True
          end
        end
        object gbWork: TGroupBox
          Left = 0
          Top = 114
          Width = 826
          Height = 101
          Align = alTop
          Caption = ' '#1056#1072#1073#1086#1090#1072' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label10: TLabel
            Left = 194
            Top = 19
            Width = 39
            Height = 13
            Caption = #1053#1072' '#1089#1077#1083#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 10
            Top = 49
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
            Top = 75
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
            Left = 621
            Top = 47
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
          object Label80: TLabel
            Left = 608
            Top = 19
            Width = 21
            Height = 13
            Caption = #1059#1053#1055
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label125: TLabel
            Left = 369
            Top = 75
            Width = 80
            Height = 13
            Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edIsWork: TDBComboBoxEh
            Left = 10
            Top = 13
            Width = 148
            Height = 24
            DataField = 'ISWORK'
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
          object edWorkSelo: TDBComboBoxEh
            Left = 245
            Top = 13
            Width = 121
            Height = 24
            DataField = 'WORKSELO'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              #1044#1072
              #1053#1077#1090)
            KeyItems.Strings = (
              '1'
              '0')
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
          object edDolg_Name: TDBEditEh
            Left = 92
            Top = 71
            Width = 251
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
            TabOrder = 5
            Visible = True
          end
          object edWork_Name: TDBEditEh
            Left = 92
            Top = 43
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
            TabOrder = 3
            Visible = True
          end
          object edWorkTelefon: TDBEditEh
            Left = 679
            Top = 41
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
            TabOrder = 4
            Visible = True
          end
          object edUNP: TDBEditEh
            Left = 644
            Top = 13
            Width = 119
            Height = 24
            DataField = 'UNP'
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
          object edPodr: TDBEditEh
            Left = 464
            Top = 69
            Width = 251
            Height = 24
            DataField = 'PODR_NAME'
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
        object Panel1: TPanel
          Left = 0
          Top = 508
          Width = 826
          Height = 74
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 7
          object gbLgot: TGroupBox
            Left = 0
            Top = 0
            Width = 377
            Height = 74
            Align = alLeft
            Caption = ' '#1051#1100#1075#1086#1090#1099' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object gbPrizn: TGroupBox
            Left = 377
            Top = 0
            Width = 449
            Height = 74
            Align = alClient
            Caption = ' '#1055#1088#1080#1079#1085#1072#1082#1080' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
        object pnOsn: TPanel
          Left = 0
          Top = 0
          Width = 826
          Height = 114
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label29: TLabel
            Left = 10
            Top = 67
            Width = 108
            Height = 13
            Caption = #1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
          end
          object lbOtnosh: TLabel
            Left = 10
            Top = 11
            Width = 210
            Height = 13
            Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077' '#1082' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1091', '#1085#1072#1085#1080#1084#1072#1090#1077#1083#1102
          end
          object Label5: TLabel
            Left = 9
            Top = 94
            Width = 44
            Height = 13
            Caption = #1058#1077#1083#1077#1092#1086#1085
          end
          object Label68: TLabel
            Left = 10
            Top = 39
            Width = 93
            Height = 13
            Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          end
          object Label117: TLabel
            Left = 556
            Top = 11
            Width = 13
            Height = 13
            Caption = #1076#1086
          end
          object Label118: TLabel
            Left = 247
            Top = 39
            Width = 75
            Height = 13
            Caption = #1044#1072#1090#1072' '#1074#1099#1073#1099#1090#1080#1103
          end
          object Label119: TLabel
            Left = 464
            Top = 39
            Width = 84
            Height = 13
            Caption = #1044#1086' '#1082#1072#1082#1086#1075#1086' '#1089#1088#1086#1082#1072
            Visible = False
          end
          object Label124: TLabel
            Left = 257
            Top = 94
            Width = 105
            Height = 13
            Caption = #1052#1086#1073#1080#1083#1100#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
          end
          object Label73: TLabel
            Left = 367
            Top = 67
            Width = 87
            Height = 13
            Caption = #1057#1091#1087#1088#1091#1075' ('#1089#1091#1087#1088#1091#1075#1072')'
            Visible = False
          end
          object edSem: TDBComboBoxEh
            Left = 134
            Top = 61
            Width = 213
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
            TabOrder = 6
            Visible = True
          end
          object edOTNOSH: TDBLookupComboboxEh
            Left = 234
            Top = 5
            Width = 200
            Height = 24
            HelpContext = 888
            DataField = 'OTNOSH'
            DataSource = dsDokument
            DropDownBox.Rows = 20
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = edOTNOSHEditButtons0Click
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
                Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
                Style = ebsGlyphEh
                OnClick = edOTNOSHEditButtons1Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Style = csDropDownEh
            TabOrder = 0
            Visible = True
          end
          object edTelefon: TDBEditEh
            Left = 67
            Top = 88
            Width = 141
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
            TabOrder = 8
            Visible = True
          end
          object edDateProp2: TDBDateTimeEditEh
            Left = 118
            Top = 33
            Width = 110
            Height = 24
            DataField = 'DATEP'
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
          object N_F_cbKvartirant: TDBCheckBoxEh
            Left = 453
            Top = 9
            Width = 89
            Height = 17
            Caption = #1082#1074#1072#1088#1090#1080#1088#1072#1085#1090
            DataField = 'NOMER_SEM'
            DataSource = dsDokument
            TabOrder = 1
            TabStop = False
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object edDateSrokDN: TDBDateTimeEditEh
            Left = 580
            Top = 5
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
            TabOrder = 2
            Visible = True
          end
          object edDateV2: TDBDateTimeEditEh
            Left = 335
            Top = 33
            Width = 110
            Height = 24
            DataField = 'DATEV'
            DataSource = dsDokument
            Enabled = False
            EditButton.Visible = False
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
          object edDateSrok2: TDBDateTimeEditEh
            Left = 562
            Top = 33
            Width = 110
            Height = 24
            DataField = 'DATE_SROK'
            DataSource = dsDokument
            Enabled = False
            EditButton.Visible = False
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 5
            Visible = False
          end
          object edTelefonM: TDBEditEh
            Left = 374
            Top = 88
            Width = 141
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
            TabOrder = 9
            Visible = True
          end
          object edSuprug2: TDBEditEh
            Left = 471
            Top = 61
            Width = 306
            Height = 24
            Color = clInfoBk
            DataField = 'SUPRUG'
            DataSource = dsDokument
            EditButtons = <
              item
                Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  1000030000000002000000000000000000000000000000000000007C0000E003
                  00001F0000001863186318631863186318631863186318631863186318631863
                  1863186318631863186310420040004010421042100010001042100010001042
                  1863186318631863186318631042004010420040104210001042100010421863
                  1863186318631863186318631863004010420040104210001042100010421863
                  1863186318631863186318631863004010420040104210001042100010421863
                  1863186318631863186318631863004000400040104210001000100010421863
                  1863186318631863186318631863004000400040104210001000100010421863
                  1042104218631863004010421863004010001042104210001000100010421042
                  1000104218631863004000401042004010001000104210001000100010421000
                  1000186318631863186300400040004000401000100010001000100010001000
                  1863186318631863186318630040004000400040100010001000100010001863
                  1863186318631863186318631863186300401042104218631000104210421863
                  1863186318631863186318631863004000400040104210001000100010421863
                  1863186318631863186318631863004000400040104210001000100010421863
                  1863186318631863186318631863104200400040186310421000100018631863
                  1863186318631863186318631863186318631863186318631863186318631863
                  186318631863}
                Hint = #1042#1099#1073#1088#1072#1090#1100' '#1089#1091#1087#1088#1091#1075#1091' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072' '#1085#1072#1089#1077#1083#1077#1085#1080#1103
                Style = ebsGlyphEh
                Width = 20
                OnClick = edSuprugEditButtons0Click
              end
              item
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  888888888888888E88888888888888EEE888088888088EEEE88808800088EEE8
                  EE88800FF0888E888EE8880F0008888888EE800FFFF08888888E0000FFF08888
                  8888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
                  8888800000000888888888000008888888888888888888888888}
                Hint = #1042#1099#1073#1088#1072#1090#1100' '#1089#1091#1087#1088#1091#1075#1091' '#1080#1079' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
                Style = ebsGlyphEh
                Width = 20
                OnClick = edSuprugEditButtons1Click
              end
              item
                Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
                Style = ebsGlyphEh
                Width = 20
                OnClick = edSuprugEditButtons2Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
            Visible = False
          end
        end
        object gbPasp: TGroupBox
          Left = 0
          Top = 215
          Width = 826
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
            Left = 372
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
            Left = 482
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
            Left = 639
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
            Top = 72
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
            Width = 141
            Height = 13
            Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label113: TLabel
            Left = 564
            Top = 72
            Width = 76
            Height = 13
            Caption = #1057#1088#1086#1082' '#1076#1077#1081#1089#1090#1074#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object ENG_edLichNomer: TDBEditEh
            Left = 162
            Top = 39
            Width = 176
            Height = 24
            CharCase = ecUpperCase
            DataField = 'LICH_NOMER'
            DataSource = dsDokument
            EditButtons = <
              item
                Hint = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1048#1053' '#1087#1086' '#1060#1048#1054' '#1080' '#1076#1072#1090#1077' '#1088#1086#1078#1076#1077#1085#1080#1103
                Style = ebsPlusEh
                OnClick = ENG_edLichNomerEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = True
            OnUpdateData = ENG_edLichNomerUpdateData
          end
          object edPasp_Seria: TDBEditEh
            Left = 413
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
            Left = 525
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
            Left = 674
            Top = 39
            Width = 110
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
            Top = 66
            Width = 449
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
          object edPasp_Srok: TDBDateTimeEditEh
            Left = 650
            Top = 66
            Width = 110
            Height = 24
            DataField = 'PASP_SROK'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 6
            Visible = True
          end
        end
        object gbPens: TGroupBox
          Left = 0
          Top = 429
          Width = 826
          Height = 45
          Align = alTop
          Caption = ' '#1055#1077#1085#1089#1080#1086#1085#1077#1088' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          object Label21: TLabel
            Left = 16
            Top = 21
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
          object Label23: TLabel
            Left = 282
            Top = 21
            Width = 72
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1082#1085#1080#1078#1082#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label24: TLabel
            Left = 498
            Top = 21
            Width = 68
            Height = 13
            Caption = #1044#1072#1090#1072' '#1074#1099#1093#1086#1076#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edPENS_TIP: TDBLookupComboboxEh
            Left = 47
            Top = 15
            Width = 213
            Height = 24
            DataField = 'PENS_TIP'
            DataSource = dsDokument
            DropDownBox.Rows = 10
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = edPENS_TIPEditButtons0Click
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
          object edPENS_KNIGA: TDBEditEh
            Left = 368
            Top = 15
            Width = 110
            Height = 24
            DataField = 'PENS_KNIGA'
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
          object edPENS_DATE: TDBDateTimeEditEh
            Left = 581
            Top = 15
            Width = 110
            Height = 24
            DataField = 'PENS_DATE'
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
            Visible = True
          end
        end
        object gbParent: TGroupBox
          Left = 0
          Top = 385
          Width = 826
          Height = 44
          Align = alTop
          Caption = ' '#1056#1086#1076#1080#1090#1077#1083#1080' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object lbpapa: TLabel
            Left = 18
            Top = 20
            Width = 26
            Height = 13
            Caption = #1054#1090#1077#1094
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbMama: TLabel
            Left = 384
            Top = 20
            Width = 26
            Height = 13
            Caption = #1052#1072#1090#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edPapa: TDBEditEh
            Left = 60
            Top = 14
            Width = 245
            Height = 24
            Color = clInfoBk
            DataField = 'PA_FIO'
            DataSource = dsDokument
            EditButtons = <
              item
                Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  1000030000000002000000000000000000000000000000000000007C0000E003
                  00001F0000001863186318631863186318631863186318631863186318631863
                  1863186318631863186310420040004010421042100010001042100010001042
                  1863186318631863186318631042004010420040104210001042100010421863
                  1863186318631863186318631863004010420040104210001042100010421863
                  1863186318631863186318631863004010420040104210001042100010421863
                  1863186318631863186318631863004000400040104210001000100010421863
                  1863186318631863186318631863004000400040104210001000100010421863
                  1042104218631863004010421863004010001042104210001000100010421042
                  1000104218631863004000401042004010001000104210001000100010421000
                  1000186318631863186300400040004000401000100010001000100010001000
                  1863186318631863186318630040004000400040100010001000100010001863
                  1863186318631863186318631863186300401042104218631000104210421863
                  1863186318631863186318631863004000400040104210001000100010421863
                  1863186318631863186318631863004000400040104210001000100010421863
                  1863186318631863186318631863104200400040186310421000100018631863
                  1863186318631863186318631863186318631863186318631863186318631863
                  186318631863}
                Hint = #1042#1099#1073#1088#1072#1090#1100' '#1086#1090#1094#1072' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072' '#1085#1072#1089#1077#1083#1077#1085#1080#1103
                Style = ebsGlyphEh
                Width = 20
                OnClick = edPapaEditButtons0Click
              end
              item
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  888888888888888E88888888888888EEE888088888088EEEE88808800088EEE8
                  EE88800FF0888E888EE8880F0008888888EE800FFFF08888888E0000FFF08888
                  8888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
                  8888800000000888888888000008888888888888888888888888}
                Hint = #1042#1099#1073#1088#1072#1090#1100' '#1086#1090#1094#1072' '#1080#1079' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
                Style = ebsGlyphEh
                Width = 20
                OnClick = edPapaEditButtons1Click
              end
              item
                Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
                Style = ebsGlyphEh
                Width = 20
                OnClick = edPapaEditButtons2Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Visible = True
          end
          object edMama: TDBEditEh
            Left = 426
            Top = 14
            Width = 245
            Height = 24
            Color = clInfoBk
            DataField = 'MA_FIO'
            DataSource = dsDokument
            EditButtons = <
              item
                Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  1000030000000002000000000000000000000000000000000000007C0000E003
                  00001F0000001863186318631863186318631863186318631863186318631863
                  1863186318631863186310420040004010421042100010001042100010001042
                  1863186318631863186318631042004010420040104210001042100010421863
                  1863186318631863186318631863004010420040104210001042100010421863
                  1863186318631863186318631863004010420040104210001042100010421863
                  1863186318631863186318631863004000400040104210001000100010421863
                  1863186318631863186318631863004000400040104210001000100010421863
                  1042104218631863004010421863004010001042104210001000100010421042
                  1000104218631863004000401042004010001000104210001000100010421000
                  1000186318631863186300400040004000401000100010001000100010001000
                  1863186318631863186318630040004000400040100010001000100010001863
                  1863186318631863186318631863186300401042104218631000104210421863
                  1863186318631863186318631863004000400040104210001000100010421863
                  1863186318631863186318631863004000400040104210001000100010421863
                  1863186318631863186318631863104200400040186310421000100018631863
                  1863186318631863186318631863186318631863186318631863186318631863
                  186318631863}
                Hint = #1042#1099#1073#1088#1072#1090#1100' '#1084#1072#1090#1100' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072' '#1085#1072#1089#1077#1083#1077#1085#1080#1103
                Style = ebsGlyphEh
                Width = 20
                OnClick = edMamaEditButtons0Click
              end
              item
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  888888888888888E88888888888888EEE888088888088EEEE88808800088EEE8
                  EE88800FF0888E888EE8880F0008888888EE800FFFF08888888E0000FFF08888
                  8888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
                  8888800000000888888888000008888888888888888888888888}
                Hint = #1042#1099#1073#1088#1072#1090#1100' '#1084#1072#1090#1100' '#1080#1079' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
                Style = ebsGlyphEh
                Width = 20
                OnClick = edMamaEditButtons1Click
              end
              item
                Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
                Style = ebsGlyphEh
                Width = 20
                OnClick = edMamaEditButtons2Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            Visible = True
          end
        end
        object pnUdostLgot: TPanel
          Left = 0
          Top = 474
          Width = 826
          Height = 34
          Align = alTop
          TabOrder = 6
          object Label122: TLabel
            Left = 5
            Top = 8
            Width = 179
            Height = 13
            Caption = #1059#1076#1086#1089#1090#1086#1074#1077#1088#1077#1085#1080#1077' '#1086' '#1087#1088#1072#1074#1077'  '#1085#1072' '#1083#1100#1075#1086#1090#1099
          end
          object edUdostLgot: TDBEditEh
            Left = 229
            Top = 4
            Width = 553
            Height = 24
            HelpContext = 999
            DataField = 'UDOST_LGOT'
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
        end
      end
      object tsAdd: TTabSheet
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
        ImageIndex = 1
        object gbZek: TGroupBox
          Left = 0
          Top = 394
          Width = 826
          Height = 43
          Align = alTop
          Caption = ' '#1057#1091#1076#1080#1084#1086#1089#1090#1100' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          object Label27: TLabel
            Left = 8
            Top = 19
            Width = 202
            Height = 13
            Caption = #1044#1072#1090#1072' '#1074#1086#1079#1074#1088#1072#1097#1077#1085#1080#1103' '#1080#1079' '#1084#1077#1089#1090' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label28: TLabel
            Left = 372
            Top = 19
            Width = 122
            Height = 13
            Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1091#1076#1080#1084#1086#1089#1090#1077#1081
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edDateZ: TDBDateTimeEditEh
            Left = 222
            Top = 13
            Width = 110
            Height = 24
            DataField = 'DATEZ'
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
          object edCOUNT_ZEK: TDBNumberEditEh
            Left = 508
            Top = 13
            Width = 33
            Height = 24
            DataField = 'COUNT_ZEK'
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
          object N_F_cbSpec: TDBCheckBoxEh
            Left = 586
            Top = 17
            Width = 127
            Height = 17
            Caption = #1057#1087#1077#1094'. '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090
            DataField = 'SPEC_UCH'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = N_F_cbSpecClick
          end
        end
        object gbAktSmert: TGroupBox
          Left = 0
          Top = 260
          Width = 826
          Height = 45
          Align = alTop
          Caption = ' '#1040#1082#1090' '#1086' '#1089#1084#1077#1088#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          DesignSize = (
            826
            45)
          object Label25: TLabel
            Left = 10
            Top = 20
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
          object Label26: TLabel
            Left = 158
            Top = 20
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
          object Label32: TLabel
            Left = 333
            Top = 20
            Width = 64
            Height = 13
            Caption = #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label111: TLabel
            Left = 554
            Top = 20
            Width = 31
            Height = 13
            Caption = #1054#1088#1075#1072#1085
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edAKT_SMER_NOMER: TDBEditEh
            Left = 53
            Top = 14
            Width = 87
            Height = 24
            DataField = 'AKT_SMER_NOMER'
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
          object edAKT_SMER_DATE: TDBDateTimeEditEh
            Left = 190
            Top = 14
            Width = 121
            Height = 24
            DataField = 'AKT_SMER_DATE'
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
          object edDateS: TDBDateTimeEditEh
            Left = 420
            Top = 14
            Width = 110
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
            Visible = True
          end
          object edAktSmerOrgan: TDBEditEh
            Left = 596
            Top = 14
            Width = 218
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataField = 'AKT_SMER_ORGAN'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = edAktSmerOrganEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
        end
        object gbActRogd: TGroupBox
          Left = 0
          Top = 215
          Width = 826
          Height = 45
          Align = alTop
          Caption = ' '#1040#1082#1090' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          DesignSize = (
            826
            45)
          object Label20: TLabel
            Left = 10
            Top = 20
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
          object Label22: TLabel
            Left = 158
            Top = 20
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
          object Label31: TLabel
            Left = 333
            Top = 20
            Width = 80
            Height = 13
            Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label110: TLabel
            Left = 554
            Top = 20
            Width = 31
            Height = 13
            Caption = #1054#1088#1075#1072#1085
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edAKT_ROGD_NOMER: TDBEditEh
            Left = 53
            Top = 14
            Width = 87
            Height = 24
            DataField = 'AKT_ROGD_NOMER'
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
          object edAKT_ROGD_DATE: TDBDateTimeEditEh
            Left = 190
            Top = 14
            Width = 121
            Height = 24
            DataField = 'AKT_ROGD_DATE'
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
          object edDateR1: TDBDateTimeEditEh
            Left = 420
            Top = 14
            Width = 110
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
            TabOrder = 2
            Visible = True
          end
          object edAktRogdOrgan: TDBEditEh
            Left = 596
            Top = 14
            Width = 220
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataField = 'AKT_ROGD_ORGAN'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = edAktRogdOrganEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
        end
        object gbOtm: TGroupBox
          Left = 0
          Top = 305
          Width = 826
          Height = 46
          Align = alTop
          Caption = ' '#1054#1090#1084#1077#1090#1082#1072' '#1086' '#1085#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1080' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          DesignSize = (
            826
            46)
          object edOTM_NATION: TDBEditEh
            Left = 15
            Top = 16
            Width = 609
            Height = 24
            HelpContext = 999
            Anchors = [akLeft, akTop, akRight]
            DataField = 'OTM_NATION'
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
        end
        object gbAddInfo: TGroupBox
          Left = 0
          Top = 437
          Width = 826
          Height = 145
          Align = alClient
          Caption = ' '#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          DesignSize = (
            826
            145)
          object edAdd_Info: TDBEditEh
            Left = 7
            Top = 14
            Width = 812
            Height = 124
            HelpContext = 999
            Anchors = [akLeft, akTop, akRight, akBottom]
            AutoSize = False
            DataField = 'ADD_INFO'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            ParentFont = False
            TabOrder = 0
            Visible = True
            WantReturns = True
          end
        end
        object gbMestoRogd: TGroupBox
          Left = 0
          Top = 107
          Width = 826
          Height = 108
          Align = alTop
          Caption = ' '#1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103', '#1085#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label74: TLabel
            Left = 14
            Top = 23
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
          object Label75: TLabel
            Left = 438
            Top = 23
            Width = 76
            Height = 13
            Caption = #1086#1073#1083#1072#1089#1090#1100' ('#1082#1088#1072#1081')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label76: TLabel
            Left = 115
            Top = 53
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
          object Label77: TLabel
            Left = 432
            Top = 53
            Width = 82
            Height = 13
            Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label69: TLabel
            Left = 16
            Top = 81
            Width = 84
            Height = 13
            Caption = #1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edMR_B_GOROD: TDBLookupComboboxEh
            Left = 523
            Top = 47
            Width = 62
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
            TabOrder = 3
            Visible = True
          end
          object edMR_GOROD: TDBEditEh
            Left = 595
            Top = 47
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
            TabOrder = 4
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
            TabOrder = 5
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edMR_B_RESP: TDBCheckBoxEh
            Left = 161
            Top = 21
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
            TabOrder = 6
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edMR_GOSUD: TDBLookupComboboxEh
            Left = 185
            Top = 17
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
            TabOrder = 0
            Visible = True
          end
          object edMR_RAION: TDBEditEh
            Left = 185
            Top = 47
            Width = 214
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
            TabOrder = 2
            Visible = True
          end
          object edMR_OBL: TDBEditEh
            Left = 558
            Top = 17
            Width = 189
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
            TabOrder = 1
            Visible = True
          end
          object edNation: TDBLookupComboboxEh
            Left = 112
            Top = 75
            Width = 214
            Height = 24
            DataField = 'NATION'
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
        object gbOtkudaPrib: TGroupBox
          Left = 0
          Top = 0
          Width = 826
          Height = 107
          Align = alTop
          Caption = ' '#1054#1090#1082#1091#1076#1072' '#1087#1088#1080#1073#1099#1083' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label103: TLabel
            Left = 14
            Top = 24
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
          object Label104: TLabel
            Left = 438
            Top = 24
            Width = 76
            Height = 13
            Caption = #1086#1073#1083#1072#1089#1090#1100' ('#1082#1088#1072#1081')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label105: TLabel
            Left = 115
            Top = 53
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
          object Label106: TLabel
            Left = 432
            Top = 53
            Width = 82
            Height = 13
            Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label112: TLabel
            Left = 14
            Top = 83
            Width = 185
            Height = 13
            Caption = #1076#1072#1090#1072' '#1087#1088#1080#1073#1099#1090#1080#1103' '#1074' '#1076#1072#1085#1085#1091#1102' '#1084#1077#1089#1090#1085#1086#1089#1090#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edOP_B_GOROD: TDBLookupComboboxEh
            Left = 533
            Top = 47
            Width = 57
            Height = 24
            Alignment = taRightJustify
            DataField = 'OP_B_GOROD'
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
            TabOrder = 3
            Visible = True
          end
          object edOP_GOROD: TDBEditEh
            Left = 598
            Top = 47
            Width = 152
            Height = 24
            DataField = 'OP_GOROD'
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
          object cbOP_B_OBL: TDBCheckBoxEh
            Left = 534
            Top = 22
            Width = 15
            Height = 17
            AllowGrayed = True
            DataField = 'OP_B_OBL'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object cbOP_B_RESP: TDBCheckBoxEh
            Left = 161
            Top = 22
            Width = 15
            Height = 17
            DataField = 'OP_B_RESP'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edOP_GOSUD: TDBLookupComboboxEh
            Left = 185
            Top = 18
            Width = 214
            Height = 24
            HelpContext = 888
            DataField = 'OP_GOSUD'
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
            TabOrder = 0
            Visible = True
          end
          object edOP_OBL: TDBEditEh
            Left = 560
            Top = 18
            Width = 164
            Height = 24
            DataField = 'OP_OBL'
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
          object edOP_RAION: TDBEditEh
            Left = 185
            Top = 47
            Width = 164
            Height = 24
            DataField = 'OP_RAION'
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
          object edOP_DATE: TDBDateTimeEditEh
            Left = 206
            Top = 77
            Width = 110
            Height = 24
            DataField = 'OP_DATE'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 7
            Visible = True
          end
        end
        object gbAddLgot: TGroupBox
          Left = 0
          Top = 351
          Width = 826
          Height = 43
          Align = alTop
          Caption = ' '#1057#1087#1077#1094#1080#1072#1083#1100#1085#1099#1077' '#1083#1100#1075#1086#1090#1099'  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          DesignSize = (
            826
            43)
          object Label102: TLabel
            Left = 8
            Top = 19
            Width = 266
            Height = 13
            Caption = #1044#1072#1090#1072' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103' '#1083#1100#1075#1086#1090#1099' '#1085#1072' '#1086#1087#1083#1072#1090#1091' '#1101#1083#1077#1082#1090#1088#1086#1101#1085#1077#1088#1075#1080#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object LgotAdres: TvchDBText
            Left = 416
            Top = 16
            Width = 400
            Height = 18
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            DataField = 'EN_LGOT_DATA'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
            OnGetText = LgotAdresGetText
          end
          object edDateLgotEl: TDBDateTimeEditEh
            Left = 285
            Top = 13
            Width = 123
            Height = 24
            Color = clInfoBk
            DataField = 'EN_LGOT_DATA'
            DataSource = dsDokument
            EditButton.Visible = False
            EditButtons = <
              item
                Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
                Style = ebsGlyphEh
                Width = 20
                OnClick = edDateLgotElEditButtons0Click
              end
              item
                Hint = #1054#1095#1080#1089#1090#1080#1090#1100
                Style = ebsGlyphEh
                Width = 20
                OnClick = edDateLgotElEditButtons1Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Visible = True
          end
        end
      end
      object tsMigr: TTabSheet
        Caption = #1044#1074#1080#1078#1077#1085#1080#1077
        ImageIndex = 2
        object vchDBText1: TvchDBText
          Left = 543
          Top = 402
          Width = 89
          Height = 17
          DataField = 'FIRST'
          DataSource = dsDokument
          Visible = False
          OnGetText = vchDBText1GetText
        end
        object edPropis: TDBCheckBoxEh
          Left = 5
          Top = 390
          Width = 344
          Height = 17
          Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085' '#1087#1086' '#1084#1077#1089#1090#1091' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072' '#1085#1072' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080' '#1089#1086#1074#1077#1090#1072' '
          DataField = 'PROPIS'
          DataSource = dsDokument
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
          OnClick = edPropisClick
        end
        object edPresentEx: TDBCheckBox
          Left = 5
          Top = 406
          Width = 326
          Height = 17
          Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080' '#1087#1088#1086#1078#1080#1074#1072#1077#1090' '#1085#1072' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080' '#1089#1086#1074#1077#1090#1072
          DataField = 'PRESENT'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
          OnClick = edPresentExClick
        end
        object pnReg: TPanel
          Left = 0
          Top = 0
          Width = 826
          Height = 290
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object Label94: TLabel
            Left = 11
            Top = 248
            Width = 168
            Height = 13
            Caption = #1040#1076#1088#1077#1089'  '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103' '#1076#1083#1103' '#1074#1099#1073#1086#1088#1086#1074
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object vchDBText3: TvchDBText
            Left = 199
            Top = 247
            Width = 428
            Height = 18
            Color = clInfoBk
            DataField = 'ADRES_ID_GIT'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
            OnGetText = vchDBText3GetText
          end
          object gbMigr: TGroupBox
            Left = 0
            Top = 34
            Width = 826
            Height = 192
            Align = alTop
            Caption = ' '#1052#1080#1075#1088#1072#1094#1080#1103' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object GridMigr: TSasaDBGrid
              Left = 2
              Top = 15
              Width = 781
              Height = 175
              Align = alClient
              Ctl3D = True
              DataSource = dsMigr
              DrawMemoText = True
              EditActions = [geaCopyEh, geaSelectAllEh]
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
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete]
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
              OnExit = GridMigrExit
              OnGetCellParams = GridMigrGetCellParams
              EnterDirection = mdNextGraph
              OptionsS = []
              SelRowColor = clAqua
              Color1 = clBlack
              Color2 = clBlack
              TypeSave = 0
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'DATE'
                  Footers = <>
                  Title.Caption = #1044#1072#1090#1072
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'TIP'
                  Footers = <>
                  KeyList.Strings = (
                    '1'
                    '0')
                  PickList.Strings = (
                    #1055#1088#1080#1073#1099#1083
                    #1059#1073#1099#1083)
                  Title.Caption = #1058#1080#1087
                  Width = 140
                  OnGetCellParams = GridMigrColumns1GetCellParams
                end
                item
                  EditButtons = <>
                  FieldName = 'CONTANT'
                  Footers = <>
                  KeyList.Strings = (
                    '1'
                    '0')
                  PickList.Strings = (
                    #1044#1072
                    #1053#1077#1090)
                  Title.Caption = #1055#1086#1089#1090#1086#1103#1085#1085#1086
                  Visible = False
                  Width = 62
                end
                item
                  DropDownRows = 12
                  EditButtons = <>
                  FieldName = 'PRICH'
                  Footers = <>
                  Title.Caption = #1055#1088#1080#1095#1080#1085#1072
                  Visible = False
                  Width = 243
                end
                item
                  DropDownRows = 12
                  EditButtons = <>
                  FieldName = 'PRICH_NAME'
                  Footers = <>
                  Title.Caption = #1055#1088#1080#1095#1080#1085#1072
                  Width = 177
                end
                item
                  EditButtons = <>
                  FieldName = 'DATE_SROK'
                  Footers = <>
                  Title.Caption = #1044#1086' '#1082#1072#1082#1086#1075#1086' '#1089#1088#1086#1082#1072
                  Width = 65
                end
                item
                  EditButtons = <>
                  FieldName = 'ORGAN'
                  Footers = <>
                  Title.Caption = #1054#1088#1075#1072#1085' '#1086#1092#1086#1088#1084#1080#1074#1096#1080#1081' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1102
                  Width = 205
                end
                item
                  EditButtons = <>
                  FieldName = 'KOMM'
                  Footers = <>
                  Title.Caption = #1054#1090#1082#1091#1076#1072' '#1087#1088#1080#1073#1099#1083' / '#1050#1091#1076#1072' '#1091#1073#1099#1083
                  Width = 287
                end>
            end
            object Panel6: TPanel
              Left = 783
              Top = 15
              Width = 41
              Height = 175
              Align = alRight
              BevelOuter = bvNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object btAddMigr: TBitBtn
                Left = 7
                Top = 5
                Width = 28
                Height = 28
                Hint = #1044#1086#1073#1072#1074#1080#1090#1100
                TabOrder = 0
                OnClick = btAddMigrClick
              end
              object btDelMigr: TBitBtn
                Left = 7
                Top = 84
                Width = 28
                Height = 28
                Hint = #1059#1076#1072#1083#1080#1090#1100
                TabOrder = 1
                OnClick = btDelMigrClick
              end
              object btEditMigr: TBitBtn
                Left = 7
                Top = 44
                Width = 28
                Height = 28
                Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100
                TabOrder = 2
                OnClick = btEditMigrClick
              end
            end
          end
          object pnPropiski: TPanel
            Left = 0
            Top = 0
            Width = 826
            Height = 34
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label30: TLabel
              Left = 3
              Top = 10
              Width = 93
              Height = 13
              Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
            end
            object Label33: TLabel
              Left = 244
              Top = 10
              Width = 75
              Height = 13
              Caption = #1044#1072#1090#1072' '#1074#1099#1073#1099#1090#1080#1103
            end
            object Label70: TLabel
              Left = 461
              Top = 10
              Width = 84
              Height = 13
              Caption = #1044#1086' '#1082#1072#1082#1086#1075#1086' '#1089#1088#1086#1082#1072
              Visible = False
            end
            object edDateProp: TDBDateTimeEditEh
              Left = 108
              Top = 4
              Width = 101
              Height = 24
              DataField = 'DATEP'
              DataSource = dsDokument
              EditButton.Visible = False
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
            object edDateVip: TDBDateTimeEditEh
              Left = 332
              Top = 4
              Width = 101
              Height = 24
              DataField = 'DATEV'
              DataSource = dsDokument
              Enabled = False
              EditButton.Visible = False
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
            object edDateSrok: TDBDateTimeEditEh
              Left = 557
              Top = 4
              Width = 101
              Height = 24
              DataField = 'DATE_SROK'
              DataSource = dsDokument
              Enabled = False
              EditButton.Visible = False
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
          object N_F_edCanSelect: TDBCheckBoxEh
            Left = 11
            Top = 225
            Width = 406
            Height = 17
            Caption = #1053#1077' '#1074#1082#1083#1102#1095#1072#1090#1100' '#1074'  '#1089#1087#1080#1089#1082#1080' '#1080#1079#1073#1080#1088#1072#1090#1077#1083#1077#1081
            DataField = 'NOTSELECT'
            DataSource = dsDokument
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object N_F_cbNotDelete: TDBCheckBoxEh
            Left = 11
            Top = 270
            Width = 398
            Height = 17
            Caption = #1053#1077' '#1091#1076#1072#1083#1103#1090#1100' '#1080#1079' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1089#1086#1089#1090#1086#1103#1085#1080#1103
            DataField = 'NOTDELETE'
            DataSource = dsDokument
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object btAdresGit_Vib: TBitBtn
            Left = 634
            Top = 243
            Width = 25
            Height = 22
            Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1076#1088#1077#1089' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072', '#1077#1089#1083#1080' '#1086#1090#1083#1080#1095#1072#1077#1090#1089#1103' '#1086#1090' '#1072#1076#1088#1077#1089#1072' '#1088#1077#1075#1080#1089#1088#1072#1094#1080#1080
            TabOrder = 4
            TabStop = False
            OnClick = btAdresGit_VibClick
            Glyph.Data = {
              D6000000424DD600000000000000560000002800000010000000100000000100
              040000000000800000000000000000000000080000000800000004020400FCFE
              04000402840004868400FC02FC0004FEFC000402FC0084868400444444444444
              4444440000000000074444055555055037444400000505503744440011050550
              3744440011050550374444000005000037444003333333333774402266666666
              2674440226000262674444402261062674444444022662677444444440222607
              7444444444026707744444444440740004444444444444444444}
          end
          object btClear_AdresGit_Vib: TBitBtn
            Left = 664
            Top = 243
            Width = 25
            Height = 22
            Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1072#1076#1088#1077#1089
            TabOrder = 5
            OnClick = btClear_AdresGit_VibClick
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
        object pnNotReg: TPanel
          Left = 0
          Top = 290
          Width = 826
          Height = 65
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          object lbAdresProp: TLabel
            Left = 10
            Top = 7
            Width = 223
            Height = 13
            Caption = #1040#1076#1088#1077#1089'  '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1074#1085#1077' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080' '#1089#1086#1074#1077#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edAdresProp: TDBEditEh
            Left = 254
            Top = 1
            Width = 497
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
            TabOrder = 0
            Visible = True
          end
          object N_F_edFirstNotMy: TDBCheckBoxEh
            Left = 11
            Top = 30
            Width = 521
            Height = 17
            Caption = 
              #1043#1083#1072#1074#1072' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072' '#1085#1077' '#1087#1088#1086#1078#1080#1074#1072#1077#1090' '#1080' '#1085#1077' '#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085' '#1085#1072' '#1090#1077#1088#1088#1080#1090 +
              #1086#1088#1080' '#1089#1086#1074#1077#1090#1072
            Color = clBtnFace
            Ctl3D = True
            DataField = 'FIRST_NOTMY'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        object cbVUS: TDBCheckBoxEh
          Left = 667
          Top = 402
          Width = 49
          Height = 17
          Hint = #1042#1086#1077#1085#1085#1086'-'#1091#1095#1077#1090#1085#1099#1081' '#1089#1090#1086#1083
          Caption = #1042#1059#1057
          DataField = 'VUS'
          DataSource = dsDokument
          TabOrder = 4
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
          OnClick = cbVUSClick
        end
      end
      object tsVUS: TTabSheet
        Caption = #1042#1059#1057
        ImageIndex = 3
        DesignSize = (
          826
          582)
        object Label34: TLabel
          Left = 7
          Top = 66
          Width = 69
          Height = 13
          Caption = #1043#1088#1091#1087#1087#1072' '#1091#1095#1077#1090#1072
        end
        object Label35: TLabel
          Left = 210
          Top = 66
          Width = 104
          Height = 13
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1075#1086#1076#1085#1086#1089#1090#1080
        end
        object Label36: TLabel
          Left = 7
          Top = 94
          Width = 85
          Height = 13
          Caption = #1042#1086#1080#1085#1089#1082#1086#1077' '#1079#1074#1072#1085#1080#1077
        end
        object Label37: TLabel
          Left = 7
          Top = 150
          Width = 147
          Height = 13
          Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1082#1072#1103' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
        end
        object Label39: TLabel
          Left = 261
          Top = 38
          Width = 49
          Height = 13
          Caption = #1059#1095#1072#1089#1090#1086#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 529
          Top = 38
          Width = 66
          Height = 13
          Caption = #1042#1088#1077#1084#1103' '#1103#1074#1082#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 378
          Top = 38
          Width = 54
          Height = 13
          Caption = #1052#1072#1088#1096#1088#1091#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label46: TLabel
          Left = 7
          Top = 122
          Width = 67
          Height = 13
          Caption = #1054#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077
        end
        object Label48: TLabel
          Left = 8
          Top = 251
          Width = 168
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072' ('#1087#1088#1077#1073#1099#1074#1072#1085#1080#1103')'
        end
        object Label56: TLabel
          Left = 8
          Top = 306
          Width = 79
          Height = 13
          Caption = #1044#1077#1090#1080'/'#1088#1086#1076#1080#1090#1077#1083#1080
        end
        object Label63: TLabel
          Left = 6
          Top = 438
          Width = 178
          Height = 13
          Caption = #1044#1072#1090#1072' '#1089#1086#1089#1090#1072#1074#1083#1077#1085#1080#1103', '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
        end
        object Label64: TLabel
          Left = 11
          Top = 9
          Width = 133
          Height = 13
          Caption = #1042#1086#1077#1085#1085#1099#1081' '#1073#1080#1083#1077#1090'    '#1089#1077#1088#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label65: TLabel
          Left = 219
          Top = 9
          Width = 36
          Height = 13
          Caption = #1085#1086#1084#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label66: TLabel
          Left = 376
          Top = 9
          Width = 30
          Height = 13
          Caption = #1076#1072#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label67: TLabel
          Left = 6
          Top = 382
          Width = 84
          Height = 13
          Caption = #1054#1089#1086#1073#1099#1077' '#1086#1090#1084#1077#1090#1082#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbUchastokVUS: TLabel
          Left = 322
          Top = 36
          Width = 35
          Height = 16
          AutoSize = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label71: TLabel
          Left = 451
          Top = 66
          Width = 36
          Height = 13
          Caption = #1057#1086#1089#1090#1072#1074
        end
        object Label107: TLabel
          Left = 334
          Top = 438
          Width = 54
          Height = 13
          Caption = #1042#1086#1077#1085#1082#1086#1084#1072#1090
        end
        object Label121: TLabel
          Left = 629
          Top = 251
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
        object Label123: TLabel
          Left = 8
          Top = 279
          Width = 87
          Height = 13
          Caption = #1057#1091#1087#1088#1091#1075#1072' ('#1089#1091#1087#1088#1091#1075')'
        end
        object Label126: TLabel
          Left = 8
          Top = 331
          Width = 482
          Height = 13
          Caption = 
            #1052#1077#1089#1090#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072' '#1073#1083#1080#1079#1082#1080#1093' '#1088#1086#1076#1089#1090#1074#1077#1085#1085#1080#1082#1086#1074', '#1082#1086#1090#1086#1088#1099#1077' '#1089#1086#1074#1084#1077#1089#1090#1085#1086' '#1085#1077' '#1087#1088#1086 +
            #1078#1080#1074#1072#1102#1090' '#1089' '#1075#1088#1072#1078#1076#1072#1085#1080#1085#1086#1084
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label57: TLabel
          Left = 6
          Top = 410
          Width = 107
          Height = 13
          Caption = #1044#1072#1090#1072' '#1087#1088#1080#1077#1084#1072' '#1085#1072' '#1091#1095#1077#1090
        end
        object Label59: TLabel
          Left = 240
          Top = 410
          Width = 105
          Height = 13
          Caption = #1044#1072#1090#1072' '#1089#1085#1103#1090#1080#1103' '#1089' '#1091#1095#1077#1090#1072
        end
        object Label61: TLabel
          Left = 475
          Top = 410
          Width = 120
          Height = 13
          Caption = #1050#1091#1076#1072' '#1091#1073#1099#1083' '#1080' '#1086#1089#1085#1086#1074#1072#1085#1080#1077
        end
        object Label127: TLabel
          Left = 413
          Top = 150
          Width = 75
          Height = 13
          Caption = #1050#1074#1072#1083#1080#1092#1080#1082#1072#1094#1080#1080
        end
        object Label128: TLabel
          Left = 298
          Top = 122
          Width = 85
          Height = 13
          Caption = #1059#1095'. '#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103
        end
        object gbDateSV: TGroupBox
          Left = 768
          Top = 432
          Width = 55
          Height = 28
          Caption = ' '#1044#1072#1090#1099' '#1089#1074#1077#1088#1086#1082' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 37
          Visible = False
          object Label42: TLabel
            Left = 12
            Top = 18
            Width = 13
            Height = 13
            Caption = #1042#1050
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label43: TLabel
            Left = 12
            Top = 59
            Width = 86
            Height = 13
            Caption = #1089' '#1082#1072#1088#1090'. '#1087#1088#1086#1087#1080#1089#1082#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label44: TLabel
            Left = 12
            Top = 102
            Width = 55
            Height = 13
            Caption = #1089' '#1092#1086#1088#1084#1086#1081' 2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edDateSV_VK: TDBDateTimeEditEh
            Left = 12
            Top = 33
            Width = 110
            Height = 24
            DataField = 'DATESV_VK'
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
          object edDateSV_LIC: TDBDateTimeEditEh
            Left = 12
            Top = 76
            Width = 110
            Height = 24
            DataField = 'DATESV_LIC'
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
          object edDateSV_F2: TDBDateTimeEditEh
            Left = 12
            Top = 119
            Width = 110
            Height = 24
            DataField = 'DATESV_F2'
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
            Visible = True
          end
        end
        object edGruppa: TDBComboBoxEh
          Left = 87
          Top = 60
          Width = 93
          Height = 24
          DataField = 'GRUPPA'
          DataSource = dsDokument
          DropDownBox.Rows = 15
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
        object edGodnost: TDBComboBoxEh
          Left = 329
          Top = 60
          Width = 87
          Height = 24
          DataField = 'GODEN'
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
        object edZvan: TDBComboBoxEh
          Left = 107
          Top = 88
          Width = 182
          Height = 24
          DataField = 'ZVAN'
          DataSource = dsDokument
          DropDownBox.Rows = 25
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
        object edGragdSpec: TDBEditEh
          Left = 169
          Top = 144
          Width = 224
          Height = 24
          DataField = 'GRAGSPEC'
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
        end
        object edKomanda: TDBEditEh
          Left = 126
          Top = 32
          Width = 118
          Height = 24
          DataField = 'KOMANDA'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          Visible = True
        end
        object edJavka: TDBNumberEditEh
          Left = 610
          Top = 32
          Width = 48
          Height = 24
          DataField = 'JAVKA'
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
        object edMarshrut: TDBNumberEditEh
          Left = 444
          Top = 32
          Width = 62
          Height = 24
          DataField = 'MARSHRUT'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          Visible = True
        end
        object edObrazVUS: TDBComboBoxEh
          Left = 87
          Top = 116
          Width = 181
          Height = 24
          DataField = 'OBRAZ'
          DataSource = dsDokument
          DropDownBox.Rows = 9
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          MRUList.Rows = 10
          ParentFont = False
          TabOrder = 14
          Visible = True
        end
        object gbWorkVUS: TGroupBox
          Left = 2
          Top = 169
          Width = 821
          Height = 71
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 18
          object Label49: TLabel
            Left = 141
            Top = 18
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
          object Label50: TLabel
            Left = 10
            Top = 47
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
          object Label51: TLabel
            Left = 639
            Top = 18
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
          object Label72: TLabel
            Left = 377
            Top = 47
            Width = 80
            Height = 13
            Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edIsWorkVUS: TDBComboBoxEh
            Left = 10
            Top = 12
            Width = 116
            Height = 24
            DataField = 'ISWORK'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              #1056#1072#1073#1086#1090#1072#1077#1090
              #1041#1077#1079#1088#1072#1073#1086#1090#1085#1099#1081)
            KeyItems.Strings = (
              '1'
              '0')
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
          object edDolgNameVUS: TDBEditEh
            Left = 77
            Top = 41
            Width = 236
            Height = 24
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
          object edWorkNameVUS: TDBEditEh
            Left = 223
            Top = 12
            Width = 392
            Height = 24
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
          object edWorkTelefonVUS: TDBEditEh
            Left = 693
            Top = 12
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
          object edPodrVUS: TDBEditEh
            Left = 472
            Top = 41
            Width = 251
            Height = 24
            DataField = 'PODR_NAME'
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
        object gbKomiss: TGroupBox
          Left = 790
          Top = 532
          Width = 33
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          Caption = 
            ' '#1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1079#1076#1086#1088#1086#1074#1100#1103' ('#1076#1083#1103' '#1074#1086#1077#1085#1085#1086#1086#1073#1103#1079#1072#1085#1085#1099#1093', '#1075#1086#1076#1085#1099#1093' '#1082' '#1074#1086#1077#1085#1085#1086#1081' '#1089#1083#1091#1078#1073 +
            #1077' '#1089' '#1086#1088#1075#1072#1085#1080#1095#1077#1085#1080#1103#1084#1080') '
          TabOrder = 35
          Visible = False
          object Label45: TLabel
            Left = 494
            Top = 24
            Width = 41
            Height = 13
            Caption = #1087#1088#1080#1079#1085#1072#1085
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label52: TLabel
            Left = 16
            Top = 52
            Width = 50
            Height = 13
            Caption = #1087#1086' '#1089#1090#1072#1090#1100#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label53: TLabel
            Left = 166
            Top = 52
            Width = 33
            Height = 13
            Caption = #1075#1088#1072#1092#1099
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label54: TLabel
            Left = 293
            Top = 52
            Width = 161
            Height = 13
            Caption = #1088#1072#1089#1087'. '#1073#1086#1083#1077#1079#1085#1077#1081', '#1087#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label55: TLabel
            Left = 8
            Top = 80
            Width = 194
            Height = 13
            Caption = #1087#1086#1076#1083#1077#1078#1080#1090' '#1087#1077#1088#1077#1086#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086#1074#1072#1085#1080#1102
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edDateKomiss: TDBDateTimeEditEh
            Left = 9
            Top = 18
            Width = 110
            Height = 24
            DataField = 'KOMISS_DATE'
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
          object edKomiss: TDBLookupComboboxEh
            Left = 131
            Top = 18
            Width = 352
            Height = 24
            DataField = 'KOMISS'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsKomiss
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
          object edPriznan: TDBComboBoxEh
            Left = 547
            Top = 18
            Width = 235
            Height = 24
            DataField = 'KOMISS_GODEN'
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
          object edStat: TDBEditEh
            Left = 69
            Top = 46
            Width = 89
            Height = 24
            DataField = 'KOMISS_STAT'
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
          object edGraf: TDBEditEh
            Left = 213
            Top = 46
            Width = 49
            Height = 24
            DataField = 'KOMISS_GRAFA'
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
          object edPrikaz: TDBEditEh
            Left = 465
            Top = 46
            Width = 316
            Height = 24
            DataField = 'KOMISS_PRIKAZ'
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
          object edDatePereosv: TDBDateTimeEditEh
            Left = 215
            Top = 74
            Width = 110
            Height = 24
            DataField = 'KOMISS_DATEPERE'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 6
            Visible = True
          end
        end
        object edSostSem: TDBEditEh
          Left = 111
          Top = 301
          Width = 709
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          DataField = 'SOSTAV_SEM'
          DataSource = dsDokument
          EditButtons = <
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000232E0000232E00000000000000000001C0C0C0C0C0C0
                8080800000800000808080808080808000008000008080808000008000008080
                80C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808000008080808000008080
                8080800000808080800000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0000080808080000080808080800000808080800000808080C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000008080808000008080
                8080800000808080800000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0000080000080000080808080800000800000800000808080C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000008000008000008080
                8080800000800000800000808080C0C0C0808080808080C0C0C0C0C0C0000080
                808080C0C0C00000808000008080808080808000008000008000008080808080
                80800000808080C0C0C0C0C0C000008000008080808000008080000080000080
                8080800000800000800000808080800000800000C0C0C0C0C0C0C0C0C0C0C0C0
                0000800000800000800000808000008000008000008000008000008000008000
                00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000008000008000008000008080
                0000800000800000800000800000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0000080808080808080C0C0C0800000808080808080C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000008000008000008080
                8080800000800000800000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0000080000080000080808080800000800000800000808080C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080000080000080C0
                C0C0808080800000800000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1095#1083#1077#1085#1072' '#1089#1077#1084#1100#1080
              Style = ebsGlyphEh
              Width = 20
              OnClick = edSostSemEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 23
          Visible = True
        end
        object gbUchet: TGroupBox
          Left = 780
          Top = 523
          Width = 38
          Height = 38
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 38
          Visible = False
          object Label58: TLabel
            Left = 9
            Top = 33
            Width = 53
            Height = 13
            Caption = #1055#1088#1080#1073#1099#1083' '#1080#1079
          end
          object Label60: TLabel
            Left = 149
            Top = 9
            Width = 77
            Height = 13
            Caption = #1057#1086#1086#1073#1097#1077#1085#1086' '#1074' '#1042#1050
          end
          object Label62: TLabel
            Left = 263
            Top = 7
            Width = 77
            Height = 13
            Caption = #1057#1086#1086#1073#1097#1077#1085#1086' '#1074' '#1042#1050
          end
          object edPrib: TDBEditEh
            Left = 9
            Top = 23
            Width = 130
            Height = 24
            DataField = 'PRIB_TEXT'
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
          object edDatePrVK: TDBDateTimeEditEh
            Left = 149
            Top = 23
            Width = 100
            Height = 24
            DataField = 'PRIB_DATEVK'
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
          object edDateUbVK: TDBDateTimeEditEh
            Left = 263
            Top = 21
            Width = 100
            Height = 24
            DataField = 'UBIT_DATEVK'
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
            Visible = True
          end
        end
        object edDateSost: TDBDateTimeEditEh
          Left = 200
          Top = 432
          Width = 110
          Height = 24
          HelpContext = 999
          DataField = 'DATESOST'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 31
          Visible = True
        end
        object edVBSeria: TDBEditEh
          Left = 161
          Top = 5
          Width = 41
          Height = 21
          HelpContext = 888
          DataField = 'VB_SERIA'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Visible = True
        end
        object edVBNomer: TDBEditEh
          Left = 265
          Top = 5
          Width = 86
          Height = 21
          DataField = 'VB_NOMER'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object edVBDate: TDBDateTimeEditEh
          Left = 418
          Top = 5
          Width = 117
          Height = 21
          DataField = 'VB_DATE'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object edSpec: TDBLookupComboboxEh
          Left = 104
          Top = 376
          Width = 217
          Height = 24
          DataField = 'SPEC'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsOsobOtm
          ParentFont = False
          TabOrder = 25
          Visible = True
        end
        object edSpecText: TDBEditEh
          Left = 342
          Top = 376
          Width = 478
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          DataField = 'SPEC_TEXT'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 26
          Visible = True
        end
        object N_F_edTypeComanda: TDBComboBoxEh
          Left = 7
          Top = 32
          Width = 108
          Height = 24
          DataField = 'TYPE_KOMANDA'
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
        object edSostav: TDBComboBoxEh
          Left = 500
          Top = 60
          Width = 108
          Height = 24
          DataField = 'VUS_SOSTAV'
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
        object edPredn: TDBEditEh
          Left = 776
          Top = 538
          Width = 33
          Height = 24
          DataField = 'VUS_PREDN'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 36
          Visible = True
        end
        object edMarka: TDBEditEh
          Left = 776
          Top = 535
          Width = 33
          Height = 24
          DataField = 'VUS_MARKA_TS'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 33
          Visible = False
        end
        object edAdresGit: TDBEditEh
          Left = 189
          Top = 245
          Width = 423
          Height = 24
          Color = clInfoBk
          DataField = 'ADRES_GIT'
          DataSource = dsDokument
          EditButtons = <
            item
              Hint = #1042#1074#1077#1089#1090#1080' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1074#1088#1091#1095#1085#1091#1102
              Style = ebsEllipsisEh
              OnClick = edAdresGitEditButtons0Click
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
              Hint = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077#1084' '#1080#1079' '#1072#1076#1088#1077#1089#1072' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
              Style = ebsGlyphEh
              OnClick = edAdresGitEditButtons1Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 19
          Visible = True
        end
        object N_F_cbPriz: TDBCheckBoxEh
          Left = 551
          Top = 7
          Width = 113
          Height = 17
          Caption = #1055#1088#1080#1079#1099#1074#1085#1080#1082
          DataField = 'PRIZ'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 34
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edVoenkom: TDBLookupComboboxEh
          Left = 401
          Top = 432
          Width = 419
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          DataField = 'VOENKOM'
          DataSource = dsDokument
          DropDownBox.AutoFitColWidths = False
          DropDownBox.Columns = <
            item
              FieldName = 'NAME'
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Width = 250
            end
            item
              FieldName = 'ADRES'
              Title.Caption = #1040#1076#1088#1077#1089
              Width = 350
            end>
          DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
          DropDownBox.Rows = 20
          DropDownBox.ShowTitles = True
          DropDownBox.Sizable = True
          DropDownBox.Width = 550
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsVoenkom
          ParentFont = False
          TabOrder = 30
          Visible = True
        end
        object edZvan2: TDBComboBoxEh
          Left = 305
          Top = 88
          Width = 158
          Height = 24
          DataField = 'ZVAN2'
          DataSource = dsDokument
          DropDownBox.Rows = 25
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          Visible = True
        end
        object edAGitTel: TDBEditEh
          Left = 687
          Top = 245
          Width = 134
          Height = 24
          DataField = 'AGIT_TEL'
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
        object edSuprug: TDBEditEh
          Left = 111
          Top = 273
          Width = 306
          Height = 24
          DataField = 'SUPRUG'
          DataSource = dsDokument
          EditButtons = <
            item
              Glyph.Data = {
                42020000424D4202000000000000420000002800000010000000100000000100
                1000030000000002000000000000000000000000000000000000007C0000E003
                00001F0000001863186318631863186318631863186318631863186318631863
                1863186318631863186310420040004010421042100010001042100010001042
                1863186318631863186318631042004010420040104210001042100010421863
                1863186318631863186318631863004010420040104210001042100010421863
                1863186318631863186318631863004010420040104210001042100010421863
                1863186318631863186318631863004000400040104210001000100010421863
                1863186318631863186318631863004000400040104210001000100010421863
                1042104218631863004010421863004010001042104210001000100010421042
                1000104218631863004000401042004010001000104210001000100010421000
                1000186318631863186300400040004000401000100010001000100010001000
                1863186318631863186318630040004000400040100010001000100010001863
                1863186318631863186318631863186300401042104218631000104210421863
                1863186318631863186318631863004000400040104210001000100010421863
                1863186318631863186318631863004000400040104210001000100010421863
                1863186318631863186318631863104200400040186310421000100018631863
                1863186318631863186318631863186318631863186318631863186318631863
                186318631863}
              Hint = #1042#1099#1073#1088#1072#1090#1100' '#1089#1091#1087#1088#1091#1075#1091' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072' '#1085#1072#1089#1077#1083#1077#1085#1080#1103
              Style = ebsGlyphEh
              Width = 20
              OnClick = edSuprugEditButtons0Click
            end
            item
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                888888888888888E88888888888888EEE888088888088EEEE88808800088EEE8
                EE88800FF0888E888EE8880F0008888888EE800FFFF08888888E0000FFF08888
                8888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
                8888800000000888888888000008888888888888888888888888}
              Hint = #1042#1099#1073#1088#1072#1090#1100' '#1089#1091#1087#1088#1091#1075#1091' '#1080#1079' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
              Style = ebsGlyphEh
              Width = 20
              OnClick = edSuprugEditButtons1Click
            end
            item
              Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
              Style = ebsGlyphEh
              Width = 20
              OnClick = edSuprugEditButtons2Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 21
          Visible = True
        end
        object edGitRodstv: TDBEditEh
          Left = 9
          Top = 347
          Width = 811
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          DataField = 'AGIT_RODST'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 24
          Visible = True
        end
        object edDatePr: TDBDateTimeEditEh
          Left = 125
          Top = 404
          Width = 100
          Height = 24
          DataField = 'PRIB_DATE'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 27
          Visible = True
        end
        object edDateUb: TDBDateTimeEditEh
          Left = 357
          Top = 404
          Width = 100
          Height = 24
          DataField = 'UBIT_DATE'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 28
          Visible = True
        end
        object edUbit: TDBEditEh
          Left = 608
          Top = 404
          Width = 212
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          DataField = 'UBIT_TEXT'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 29
          Visible = True
        end
        object edSuprugDateR: TDBDateTimeEditEh
          Left = 442
          Top = 273
          Width = 120
          Height = 24
          DataField = 'SUPRUG_DATER'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 22
          Visible = True
        end
        object edKvalif: TDBEditEh
          Left = 503
          Top = 144
          Width = 317
          Height = 24
          DataField = 'KVALIF'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          Visible = True
        end
        object edUchObrAll: TDBEditEh
          Left = 401
          Top = 116
          Width = 419
          Height = 24
          DataField = 'UCH_OBR_ALL'
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
        object gbNomerVUS: TGroupBox
          Left = 670
          Top = 0
          Width = 149
          Height = 49
          Caption = ' '#1053#1086#1084#1077#1088' '#1042#1059#1057' '#1080' '#1082#1086#1076' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          object edNomerVUS: TDBEditEh
            Left = 7
            Top = 17
            Width = 135
            Height = 21
            DataField = 'NOMER_VUS'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
        end
        object gbMobTel: TGroupBox
          Left = 672
          Top = 50
          Width = 149
          Height = 49
          Caption = ' '#1052#1086#1073'. '#1090#1077#1083#1077#1092#1086#1085' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          object TELEFON_MVus: TDBEditEh
            Left = 7
            Top = 17
            Width = 135
            Height = 21
            DataField = 'TELEFON_M'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
        end
        object pnGrid: TPanel
          Left = 0
          Top = 454
          Width = 826
          Height = 128
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelOuter = bvNone
          TabOrder = 32
          DesignSize = (
            826
            128)
          object gbDeti: TGroupBox
            Left = 1
            Top = 5
            Width = 821
            Height = 121
            Anchors = [akLeft, akTop, akRight, akBottom]
            Caption = ' '#1054#1090#1084#1077#1090#1082#1080' '#1086' '#1089#1074#1077#1088#1082#1077' '#1076#1072#1085#1085#1099#1093' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            DesignSize = (
              821
              121)
            object GridSverki: TDBGridEh
              Left = 7
              Top = 15
              Width = 762
              Height = 98
              Anchors = [akLeft, akTop, akRight, akBottom]
              DataSource = dsSverki
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -11
              FooterFont.Name = 'Tahoma'
              FooterFont.Style = []
              HorzScrollBar.Visible = False
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              UseMultiTitle = True
              VertScrollBar.VisibleMode = sbNeverShowEh
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'DATE_SV'
                  Footers = <>
                  Title.Caption = #1044#1072#1090#1072' '#1089#1074#1077#1088#1082#1080
                  Width = 91
                end
                item
                  EditButtons = <>
                  FieldName = 'NAME'
                  Footers = <>
                  MRUList.AutoAdd = False
                  MRUList.Active = True
                  MRUList.Items.Strings = (
                    #1042#1086#1077#1085#1085#1099#1081' '#1082#1086#1084#1080#1089#1089#1072#1088#1080#1072#1090
                    #1060#1086#1088#1084#1072' 2'
                    #1050#1072#1088#1090#1086#1095#1082#1072' '#1087#1088#1086#1087#1080#1089#1082#1080)
                  Title.Caption = 
                    #1057' '#1082#1077#1084' '#1080#1083#1080' '#1095#1077#1084' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1083#1072#1089#1100' '#1089#1074#1077#1088#1082#1072' ('#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1072' '#1080#1083#1080' '#1076#1086#1082#1091 +
                    #1084#1077#1085#1090#1072')'
                  Title.Hint = #1054#1090#1085#1086#1096#1077#1085#1080#1077' '#1082' '#1075#1083#1072#1074#1077' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
                  Width = 398
                end
                item
                  EditButtons = <
                    item
                      Glyph.Data = {
                        42020000424D4202000000000000420000002800000010000000100000000100
                        1000030000000002000000000000000000000000000000000000007C0000E003
                        00001F0000001863186318631863186318631863186318631863186318631863
                        1863186318631863186310420040004010421042100010001042100010001042
                        1863186318631863186318631042004010420040104210001042100010421863
                        1863186318631863186318631863004010420040104210001042100010421863
                        1863186318631863186318631863004010420040104210001042100010421863
                        1863186318631863186318631863004000400040104210001000100010421863
                        1863186318631863186318631863004000400040104210001000100010421863
                        1042104218631863004010421863004010001042104210001000100010421042
                        1000104218631863004000401042004010001000104210001000100010421000
                        1000186318631863186300400040004000401000100010001000100010001000
                        1863186318631863186318630040004000400040100010001000100010001863
                        1863186318631863186318631863186300401042104218631000104210421863
                        1863186318631863186318631863004000400040104210001000100010421863
                        1863186318631863186318631863004000400040104210001000100010421863
                        1863186318631863186318631863104200400040186310421000100018631863
                        1863186318631863186318631863186318631863186318631863186318631863
                        186318631863}
                      Hint = #1057#1087#1077#1094#1080#1072#1083#1080#1089#1090
                      Style = ebsPlusEh
                      Width = 16
                      OnClick = GridSverkiColumns2EditButtons0Click
                    end>
                  FieldName = 'FIO'
                  Footers = <>
                  Title.Caption = ' '#1048#1085#1080#1094#1080#1072#1083#1099', '#1092#1072#1084#1080#1083#1080#1103' '#1087#1088#1086#1074#1086#1076#1080#1074#1096#1077#1075#1086' '#1089#1074#1077#1088#1082#1091
                  Width = 239
                end>
            end
            object Panel8: TPanel
              Left = 773
              Top = 15
              Width = 46
              Height = 104
              Align = alRight
              BevelOuter = bvNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object btAddSv: TBitBtn
                Left = 8
                Top = 0
                Width = 28
                Height = 28
                Hint = #1044#1086#1073#1072#1074#1080#1090#1100
                TabOrder = 0
                OnClick = btAddSvClick
              end
              object btDelSv: TBitBtn
                Left = 8
                Top = 39
                Width = 28
                Height = 28
                Hint = #1059#1076#1072#1083#1080#1090#1100
                TabOrder = 1
                OnClick = btDelSvClick
              end
            end
          end
        end
      end
      object tsOchered: TTabSheet
        Caption = #1054#1095#1077#1088#1077#1076#1100' '#1085#1072' '#1078#1080#1083#1100#1077
        ImageIndex = 4
        object pnSostavOchered: TPanel
          Left = 0
          Top = 185
          Width = 826
          Height = 397
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel4: TPanel
            Left = 784
            Top = 0
            Width = 42
            Height = 397
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object btAddMen: TBitBtn
              Left = 9
              Top = 22
              Width = 28
              Height = 28
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100
              TabOrder = 0
              OnClick = btAddMenClick
            end
            object btDelMen: TBitBtn
              Left = 9
              Top = 97
              Width = 28
              Height = 28
              Hint = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 1
              OnClick = btDelMenClick
            end
            object btEdit: TBitBtn
              Left = 9
              Top = 60
              Width = 28
              Height = 28
              Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100
              TabOrder = 2
              OnClick = btEditClick
            end
          end
          object pcOchered: TPageControl
            Left = 0
            Top = 0
            Width = 784
            Height = 397
            ActivePage = TabSheet1
            Align = alClient
            HotTrack = True
            TabOrder = 1
            OnChange = pcOcheredChange
            object TabSheet1: TTabSheet
              Caption = #1056#1077#1096#1077#1085#1080#1103
              ImageIndex = 4
              object GridResh: TDBGridEh
                Left = 0
                Top = 0
                Width = 776
                Height = 369
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
                RowHeight = 73
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
                    EditButtons = <>
                    FieldName = 'TIP'
                    Footers = <>
                    Title.Caption = #1058#1080#1087
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = []
                    Width = 127
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
                    Width = 58
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
                    Width = 436
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
                  end
                  item
                    EditButtons = <>
                    FieldName = 'DATE_SORT'
                    Footers = <>
                    Visible = False
                  end
                  item
                    EditButtons = <>
                    FieldName = 'AUTO_SORT'
                    Footers = <>
                    Visible = False
                  end>
              end
            end
            object tsOchSostav: TTabSheet
              Caption = #1057#1086#1089#1090#1072#1074' '#1089#1077#1084#1100#1080
              object GridSostav: TDBGridEh
                Left = 0
                Top = 0
                Width = 776
                Height = 339
                Align = alClient
                AllowedOperations = [alopUpdateEh]
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
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete]
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
                    Title.Hint = #1053#1086#1084#1077#1088' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091
                    Width = 26
                  end
                  item
                    Alignment = taLeftJustify
                    EditButtons = <>
                    FieldName = 'OTNOSH'
                    Footers = <>
                    Title.Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077
                    Width = 94
                  end
                  item
                    EditButtons = <>
                    FieldName = 'FAMILIA'
                    Footers = <>
                    Title.Caption = #1060#1072#1084#1080#1083#1080#1103
                    Width = 112
                  end
                  item
                    EditButtons = <>
                    FieldName = 'NAME'
                    Footers = <>
                    Title.Caption = #1048#1084#1103
                    Width = 90
                  end
                  item
                    EditButtons = <>
                    FieldName = 'OTCH'
                    Footers = <>
                    Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
                    Width = 105
                  end
                  item
                    EditButtons = <>
                    FieldName = 'DATER'
                    Footers = <>
                    Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
                    Width = 89
                  end
                  item
                    EditButtons = <>
                    FieldName = 'POL'
                    Footers = <>
                    Title.Caption = #1055#1086#1083
                    Width = 77
                  end
                  item
                    EditButtons = <>
                    FieldName = 'LICH_NOMER'
                    Footers = <>
                    Title.Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
                    Width = 154
                    OnUpdateData = GridSostavColumns7UpdateData
                  end>
              end
              object Panel3: TPanel
                Left = 0
                Top = 339
                Width = 776
                Height = 30
                Align = alBottom
                BevelOuter = bvLowered
                TabOrder = 1
                DesignSize = (
                  776
                  30)
                object Label88: TLabel
                  Left = 13
                  Top = 11
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
                object Label101: TLabel
                  Left = 138
                  Top = 11
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
                  Top = 6
                  Width = 37
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
                  Left = 683
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
                  OnClick = btIsk2VklClick
                end
                object edDoxod: TDBNumberEditEh
                  Left = 286
                  Top = 5
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
                Width = 775
                Height = 324
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
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'DEC_DATE'
                    Footers = <>
                    Title.Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
                    Width = 75
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
              object Panel7: TPanel
                Left = 0
                Top = 324
                Width = 775
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
                  Visible = False
                  OnClick = cbOnlyClick
                end
              end
            end
            object tsDoks: TTabSheet
              Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
              ImageIndex = 3
              DesignSize = (
                776
                369)
              object edDoks: TDBEditEh
                Left = 0
                Top = 1
                Width = 775
                Height = 359
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
                Flat = True
                ParentFont = False
                TabOrder = 0
                Visible = True
                WantReturns = True
              end
            end
            object tsPrim: TTabSheet
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              ImageIndex = 2
              object gbUluch: TGroupBox
                Left = 0
                Top = 31
                Width = 776
                Height = 79
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
                  Top = 55
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
                  Top = 55
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
                  Top = 56
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
                  Top = 26
                  Width = 390
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
                  Top = 55
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
                  Top = 49
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
                  Top = 49
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
                  Top = 49
                  Width = 110
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
                  Left = 410
                  Top = 23
                  Width = 25
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
                  Top = 49
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
                  Left = 440
                  Top = 23
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
              object pnKredit: TPanel
                Left = 0
                Top = 110
                Width = 776
                Height = 119
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 3
                DesignSize = (
                  776
                  119)
                object Label99: TLabel
                  Left = 5
                  Top = 44
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
                  Top = 15
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
                  Top = 71
                  Width = 141
                  Height = 13
                  Caption = #1043#1076#1077' '#1077#1097#1077' '#1087#1086#1089#1090#1072#1074#1083#1077#1085' '#1085#1072' '#1091#1095#1077#1090
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object Label116: TLabel
                  Left = 5
                  Top = 98
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
                object Label115: TLabel
                  Left = 586
                  Top = 71
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
                object Label79: TLabel
                  Left = 415
                  Top = 15
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
                  Left = 415
                  Top = 44
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
                  Left = 581
                  Top = 15
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
                object Label85: TLabel
                  Left = 248
                  Top = 15
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
                object Label93: TLabel
                  Left = 248
                  Top = 44
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
                  Left = 119
                  Top = 38
                  Width = 110
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
                  Left = 471
                  Top = 38
                  Width = 93
                  Height = 24
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
                  Left = 119
                  Top = 9
                  Width = 110
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
                  Left = 471
                  Top = 9
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
                  Top = 65
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
                object edSlugeb: TDBEditEh
                  Left = 365
                  Top = 92
                  Width = 406
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
                object edDopDate: TDBDateTimeEditEh
                  Left = 626
                  Top = 65
                  Width = 110
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
                object edKreditNomer: TDBEditEh
                  Left = 644
                  Top = 9
                  Width = 85
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
                  Left = 313
                  Top = 9
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
                  Left = 313
                  Top = 38
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
              object Panel5: TPanel
                Left = 0
                Top = 229
                Width = 776
                Height = 140
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 4
                DesignSize = (
                  776
                  140)
                object edPrim: TDBMemo
                  Left = 2
                  Top = 3
                  Width = 770
                  Height = 136
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
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 776
                Height = 31
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label108: TLabel
                  Left = 7
                  Top = 8
                  Width = 211
                  Height = 13
                  Caption = #1053#1072' '#1082#1072#1082#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1086#1084#1085#1072#1090' '#1087#1088#1077#1090#1077#1085#1076#1091#1077#1090
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object Label109: TLabel
                  Left = 348
                  Top = 8
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
                object edKolvoKomnPr: TDBNumberEditEh
                  Left = 231
                  Top = 2
                  Width = 36
                  Height = 24
                  DataField = 'KOLVO_KOMN'
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
                object edGSK: TDBEditEh
                  Left = 427
                  Top = 2
                  Width = 113
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
                  TabOrder = 1
                  Visible = True
                end
              end
              object edSocial: TDBComboBoxEh
                Left = 216
                Top = 28
                Width = 220
                Height = 24
                DataField = 'SOCIAL'
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
            end
            object tsSobst: TTabSheet
              Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1100
              ImageIndex = 5
              object GridSobstv: TDBGridEh
                Left = 0
                Top = 0
                Width = 775
                Height = 349
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
          Width = 826
          Height = 185
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label86: TLabel
            Left = 532
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
            Left = 344
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
            Top = 122
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
          object Label78: TLabel
            Left = 476
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
          object Label84: TLabel
            Left = 285
            Top = 121
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
          object Label100: TLabel
            Left = 202
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
          object Label82: TLabel
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
          object Label91: TLabel
            Left = 8
            Top = 36
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
          object Label120: TLabel
            Left = 304
            Top = 36
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
          object lbNomer: TLabel
            Left = 622
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
          object edTypeHouse: TDBLookupComboboxEh
            Left = 163
            Top = 59
            Width = 285
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
            Left = 120
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
            Left = 472
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
            Left = 741
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
            Left = 144
            Top = 116
            Width = 91
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
            Left = 554
            Top = 59
            Width = 256
            Height = 24
            DataField = 'RESIDENCE'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsGlyphEh
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
            Left = 609
            Top = 129
            Width = 131
            Height = 17
            Caption = #1052#1086#1083#1086#1076#1072#1103' '#1089#1077#1084#1100#1103
            DataField = 'NEWSEM'
            DataSource = dsDokument
            TabOrder = 14
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = N_F_cbNewSemClick
          end
          object N_F_cbSirota: TDBCheckBoxEh
            Left = 609
            Top = 112
            Width = 99
            Height = 17
            Caption = #1057#1080#1088#1086#1090#1072
            DataField = 'SIROTA'
            DataSource = dsDokument
            TabOrder = 15
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = N_F_cbSirotaClick
          end
          object edResidenceDate: TDBDateTimeEditEh
            Left = 450
            Top = 115
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
            TabOrder = 13
            Visible = True
          end
          object edTail: TDBEditEh
            Left = 247
            Top = 87
            Width = 77
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
          object edDecDate: TDBDateTimeEditEh
            Left = 126
            Top = 30
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
          object edDatePerereg: TDBDateTimeEditEh
            Left = 393
            Top = 30
            Width = 110
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
          object edNomer: TDBNumberEditEh
            Left = 705
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
          object N_F_cbIsUchastok: TDBCheckBoxEh
            Left = 5
            Top = 149
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
            TabOrder = 16
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edIsUchastokDate: TDBDateTimeEditEh
            Left = 150
            Top = 145
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
            TabOrder = 17
            Visible = True
          end
          object N_F_cbPredUchastok: TDBCheckBoxEh
            Left = 300
            Top = 149
            Width = 141
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
            TabOrder = 18
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edUchastokDate: TDBDateTimeEditEh
            Left = 450
            Top = 145
            Width = 110
            Height = 24
            Hint = #1044#1072#1090#1072' '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1083#1077#1085#1080#1103' '#1091#1095#1072#1089#1090#1082#1072
            HelpContext = 999
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
            TabOrder = 19
            Visible = True
          end
          object N_F_cbMnogo4: TDBCheckBoxEh
            Left = 609
            Top = 147
            Width = 205
            Height = 17
            Caption = #1052#1085#1086#1075#1086#1076#1077#1090#1085#1072#1103' (4 '#1080' '#1073#1086#1083#1077#1077' '#1076#1077#1090#1077#1081')'
            DataField = 'MNOGO_4'
            DataSource = dsDokument
            TabOrder = 20
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = N_F_cbNewSemClick
          end
          object N_F_cbMnogoI: TDBCheckBoxEh
            Left = 609
            Top = 165
            Width = 277
            Height = 17
            Caption = #1052#1085#1086#1075#1086#1076#1077#1090#1085#1072#1103' ('#1088#1077#1073#1077#1085#1086#1082' '#1080#1085#1074#1072#1083#1080#1076')'
            DataField = 'MNOGO_I'
            DataSource = dsDokument
            TabOrder = 21
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = N_F_cbNewSemClick
          end
        end
      end
    end
    object pnZag: TPanel
      Left = 0
      Top = 0
      Width = 834
      Height = 87
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        834
        87)
      object Label1: TLabel
        Left = 10
        Top = 11
        Width = 44
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103
      end
      object Label4: TLabel
        Left = 10
        Top = 39
        Width = 19
        Height = 13
        Caption = #1055#1086#1083
      end
      object Label2: TLabel
        Left = 221
        Top = 11
        Width = 19
        Height = 13
        Caption = #1048#1084#1103
      end
      object Label3: TLabel
        Left = 400
        Top = 11
        Width = 49
        Height = 13
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      end
      object Label7: TLabel
        Left = 164
        Top = 39
        Width = 80
        Height = 13
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      end
      object Label18: TLabel
        Left = 380
        Top = 39
        Width = 68
        Height = 13
        Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object ImageSpec: TImage
        Left = 795
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
      object Label38: TLabel
        Left = 10
        Top = 64
        Width = 31
        Height = 13
        Caption = #1040#1076#1088#1077#1089
      end
      object TextAdres: TvchDBText
        Left = 54
        Top = 61
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
        OnClick = TextAdresClick
        OnGetText = TextAdresGetText
      end
      object ImageEl: TImage
        Left = 760
        Top = 5
        Width = 32
        Height = 32
        Hint = #1051#1100#1075#1086#1090#1072' '#1087#1086' '#1086#1087#1083#1072#1090#1077' '#1101#1083#1077#1082#1090#1088#1086#1101#1085#1077#1088#1075#1080#1080
        Anchors = [akTop, akRight]
        AutoSize = True
        Center = True
        Picture.Data = {
          055449636F6E0000010001002020000001002000A81000001600000028000000
          2000000040000000010020000000000000100000000000000000000000000000
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
          000000000000000503030389000000BF000000C0000000C0000000C0000000C0
          000000C0000000C0000000C0000000C0000000C0000000C0000000C0000000C0
          000000C0000000C0000000C0000000C0000000C0000000C0000000C0000000C0
          000000C0000000C0000000C0000000C0010000C0000000C0000000B900000070
          0000000100000024010101FF010101FF010101FF030101FF040102FF040102FF
          040102FF040102FF040102FF040102FF040102FF040102FF040102FF040102FF
          040102FF040102FF040102FF040102FF040102FF040102FF040102FF040102FF
          040102FF040102FF040102FF030103FF020102FF010101FF010101FF020202FD
          0000001B00000004000000D5010101FF050A0CFF128EA6FF14A2BEFF14A2BFFF
          14A2BFFF14A2BFFF14A2BFFF14A2BFFF14A2BFFF14A2BFFF14A2BFFF14A2BFFF
          14A2BFFF14A2BFFF14A2BFFF14A2BFFF14A2BFFF14A2BFFF14A2BFFF14A2BFFF
          14A2BFFF14A2BFFF14A2BFFF14A2BEFF13778BFF010303FF010101FF000000BC
          000000020000000003030352010001FE09161AFF12C9EAFF0DCCEEFF0DCCEDFF
          0DCCEDFF0DCCEDFF0DCCEEFF0DCCEDFF0DCCEDFF0DCCEEFF0ECCEEFF0ECBEDFF
          0DCCEDFF0DCCEEFF0DCCEDFF0DCCEEFF0DCCEDFF0DCCEEFF0DCCEDFF0DCCEEFF
          0DCCEEFF0DCCEDFF0DCCEDFF0ECBEEFF16BBDAFF020608FF010101FC00000038
          000000000000000000000001010101BF030102FF18879CFF12CDEEFF13CEEDFF
          13CEEDFF13CDEDFF13CDEDFF13CEEDFF13CEEDFF13CEEDFF12CDEDFF18859CFF
          1AACC9FF13CEEDFF13CEEDFF13CEEDFF13CEEDFF13CEEDFF13CEEDFF13CEEDFF
          13CEEDFF13CEEDFF13CEEDFF13CDEDFF13606EFF010101FF000000AD00000000
          00000000000000000000000000000038010101FD0A1C23FF1BC8E5FF17CFEEFF
          17CFEEFF17CFEEFF17CFEEFF16CFEDFF17CFEEFF16CFEDFF18CFEFFF155664FF
          0B262CFF1CC6E3FF19CFEEFF17CFEEFF17CFEEFF18CFEEFF19CFEEFF17CFEDFF
          17CFEEFF17CFEDFF17CEEEFF20B8D0FF060A0BFF010001FA0000002800000000
          00000000000000000000000000000000010101A7020101FF1C7483FF1FD1EFFF
          1ED1EFFF1ED1EFFF1ED1EFFF1ED1EFFF1ED1EFFF1ED1EFFF1FD1EEFF194C59FF
          0B1214FF24ACC4FF1ED1F0FF1ED1EFFF1ED1EFFF1FD1EFFF20D1EFFF1FD1EFFF
          1ED1F0FF1ED1EFFF1FD1F0FF17535EFF030101FF0101019D0000000000000000
          0000000000000000000000000000000000000025010001F7091113FF28C2DCFF
          26D2F2FF26D2F1FF26D2F1FF26D2F0FF26D2F1FF26D2F0FF24D2F0FF29A3B9FF
          030304FF2AB5CEFF24D2F0FF26D2F0FF26D2F0FF26D2F1FF26D2F0FF26D2F0FF
          26D2F0FF26D2F0FF27B0C9FF050507FF010101F40000001F0000000000000000
          00000000000000000000000000000000000000000101018E020102FF1F5F6DFF
          2CD5F2FF2DD4F3FF2DD5F2FF2DD5F2FF2DD5F2FF2FCEE8FF2CD5F2FF31C6DCFF
          050405FF1D7180FF2CD5F1FF2DD5F2FF2DD5F2FF2DD5F2FF2DD5F2FF2DD5F2FF
          2DD5F2FF2DD4F2FF184552FF030202FF01010189000000000000000000000000
          000000000000000000000000000000000000000000000012010001EC04080AFF
          36B9CDFF35D6F1FF34D6F2FF34D6F2FF33D7F2FF236270FF205661FF36AFC4FF
          0B1519FF122B31FF34D6F0FF34D6F2FF34D6F2FF34D7F2FF34D6F2FF34D7F2FF
          35D7F1FF31A8BCFF020304FF020101EA00000012000000000000000000000000
          0000000000000000000000000000000000000000000000000202026E020101FF
          1C4B52FF3CD9F2FF3AD9F2FF3AD9F2FF3AD9F2FF37A9BBFF040102FF040405FF
          050504FF040304FF39B8CCFF3AD9F2FF3AD9F2FF3AD9F2FF3AD9F2FF3AD9F2FF
          3CD9EFFF14373EFF020101FF0000007000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000007010101D7
          030305FF3DABBDFF44DCF4FF44DCF4FF43DCF4FF46DAF2FF122327FF203D42FF
          1D434AFF060504FF2C7281FF42DCF5FF43DCF4FF44DCF4FF44DCF4FF45DBF4FF
          3698A8FF020202FF010001DC0000000800000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000004F
          020102FF1A363BFF4EDCF3FF4CDEF4FF4CDDF4FF4CDEF4FF307481FF0A1012FF
          4CCCE1FF46BACCFF35828EFF4DDEF2FF4BDEF3FF4CDEF4FF4CDDF4FF4DD9EEFF
          14252AFF020101FF0002005A0000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000001
          020202BF010101FF4098A6FF53E0F4FF54E0F3FF54E1F3FF51C5D6FF050406FF
          2E6A74FF55E0F3FF54E0F3FF54E0F3FF54E0F3FF54E0F3FF54E0F3FF398690FF
          030101FF000000CD000000030000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000033010000FC132226FF5ADCEEFF5AE2F6FF5AE3F5FF5CE2F5FF213E44FF
          070C0DFF57CDDDFF5AE3F5FF5AE2F5FF5AE3F5FF5BE2F5FF5BD6E8FF0B1719FF
          010100FE00000041000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000010101A5020201FF40818AFF63E5F5FF63E4F6FF62E4F6FF46929CFF
          010101FF32646BFF64E4F7FF63E4F7FF63E4F6FF64E4F7FF3B7178FF020101FF
          010101B800000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000023010101F60C1315FF68D6E5FF6CE7F9FF6CE7F8FF6ADDEBFF
          0A0F10FF07090BFF62CCD9FF6CE7F9FF6CE7F7FF65CFDBFF080C0EFF020100FC
          0000003000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000008B010101FF39686FFF73E8F8FF72E9F7FF71E9F7FF
          3D686FFF233D41FF56A3ABFF71EAF6FF72E9F7FF345C62FF010101FF010101A3
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000013020100EC08080AFF6EC9D3FF78EBF9FF7AEBF8FF
          79ECF8FF7CEBF9FF79EBF8FF7BECF9FF6BC4CDFF050507FF010101F600000020
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000002020276010101FF304E52FF82EDF9FF82EDFAFF
          82EDFAFF82EDFAFF81EDFAFF81EEF7FF314A4EFF020101FF0101018A00000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000A000100DE050305FF6EB8C1FF88F0FBFF
          88F0FBFF88F0FBFF88F0FBFF6DB7BEFF030303FF000000ED0000001500000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000200005D020101FF26383AFF91F0FAFF
          90F3FCFF91F2FCFF90F0FAFF26383BFF020101FF020202790000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000003010101CB020102FF6AA3A8FF
          96F4FAFF97F3FBFF6BA7AAFF040102FF020101E10000000C0000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000044010000FE192526FF
          98EEF3FF9DF0F5FF1D292BFF010101FF02020264000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000020102B3020101FF
          2A3B3BFF2B3E3FFF020101FF000000D100000004000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000002E000000FA
          010101FF010101FF010101FF0000004E00000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000001010198
          010101FF010101FF020202C10000000200000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000001A
          010101DA010101E6000000340000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000300000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000080000001
          80000003C0000003E0000007E0000007F000000FF000000FF800001FF800001F
          FC00003FFC00003FFE00007FFF0000FFFF0000FFFF8001FFFF8001FFFFC003FF
          FFC003FFFFE007FFFFE007FFFFF00FFFFFF80FFFFFF81FFFFFFC1FFFFFFC3FFF
          FFFE7FFF}
        Transparent = True
        Visible = False
      end
      object ImageElClr: TImage
        Left = 760
        Top = 5
        Width = 32
        Height = 32
        Hint = #1053#1077#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1072#1076#1088#1077#1089#1072' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103' '#1072#1076#1088#1077#1089#1091' '#1083#1100#1075#1086#1090#1099
        Anchors = [akTop, akRight]
        AutoSize = True
        Center = True
        Picture.Data = {
          055449636F6E0000010001002020000001002000A81000001600000028000000
          2000000040000000010020000000000000100000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000B1B1E1FFBABAE6FF00000000
          0000000000000000000000000000000000000000A8A8DEFF0000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000009393D4FF1C1BAFFF2B2BABFFABABE0FF
          000000000000000000000000000000005353BDFF1A1AAFFF6767C0FF00000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000008F8FCEFF2C2CB9FF0101BDFF0000BBFF2929ADFF
          A6A6DDFF00000000000000005656C0FF0404BDFF0404BFFF1A1AB8FF6868C0FF
          000000000000000503030389000000BF000000C0000000C0000000C0000000C0
          000000C0000000C0000000C0000000C0000000C0000000C0000000C0000000C0
          000000C0000000C09393C0FF4C4CC3FF1A1AC9FF0000C5FF0000C7FF0000C5FF
          2626ADFF8888CFFF5555BFFF0A0AC7FF0000C9FF0000C7FF0404C6FF1A1ABCFF
          7777C6FF00000024010101FF010101FF010101FF030101FF040102FF040102FF
          040102FF040102FF040102FF040102FF040102FF040102FF040102FF040102FF
          040102FF040102FF9797CDFF5656D8FF2827D3FF0A0ACFFF0000CFFF0000D1FF
          0000CEFF0F0FBAFF0E0ECFFF0000D2FF0000D1FF0000CFFF0000CDFF0404CBFF
          3D3DBBFF00000004000000D5010101FF050A0CFF128EA6FF14A2BEFF14A2BFFF
          14A2BFFF14A2BFFF14A2BFFF14A2BFFF14A2BFFF14A2BFFF14A2BFFF14A2BFFF
          14A2BFFF14A2BFFF14A2BFFF8A8ACDFF5858E0FF2625DBFF0202D7FF0000D9FF
          0000DAFF0000DAFF0000DAFF0000DAFF0000D9FF0000D7FF0101D4FF2323C5FF
          000000020000000003030352010001FE09161AFF12C9EAFF0DCCEEFF0DCCEDFF
          0DCCEDFF0DCCEDFF0DCCEEFF0DCCEDFF0DCCEDFF0DCCEEFF0ECCEEFF0ECBEDFF
          0DCCEDFF0DCCEEFF0DCCEDFF0DCCEEFF8A8AD1FF5D5DE7FF1B1BE2FF0000E0FF
          0000E2FF0000E2FF0000E2FF0000E2FF0000E0FF0202DFFF2B2BCEFF00000038
          000000000000000000000001010101BF030102FF18879CFF12CDEEFF13CEEDFF
          13CEEDFF13CDEDFF13CDEDFF13CEEDFF13CEEDFF13CEEDFF12CDEDFF18859CFF
          1AACC9FF13CEEDFF13CEEDFF13CEEDFF13CEEDFF7C7BCFFF4F4FEDFF1212E9FF
          0000E9FF0000EAFF0000EAFF0000E9FF0000E8FF2828D5FFB0B0E1FF00000000
          00000000000000000000000000000038010101FD0A1C23FF1BC8E5FF17CFEEFF
          17CFEEFF17CFEEFF17CFEEFF16CFEDFF17CFEEFF16CFEDFF18CFEFFF155664FF
          0B262CFF1CC6E3FF19CFEEFF17CFEEFFABABD5FF7372CDFF5857F2FF3F3FF3FF
          0F0FF1FF0000F1FF0000F0FF0000F0FF0000EFFF1E1ECEFFA7A7E0FF00000000
          00000000000000000000000000000000010101A7020101FF1C7483FF1FD1EFFF
          1ED1EFFF1ED1EFFF1ED1EFFF1ED1EFFF1ED1EFFF1ED1EFFF1FD1EEFF194C59FF
          0B1214FF24ACC4FF1ED1F0FFADADD4FF7473CDFF6969F2FF4F4FF7FF4D4CF8FF
          4544F9FF1212F7FF0000F7FF0000F7FF0000F5FF0000F0FF2929CFFFACACE3FF
          0000000000000000000000000000000000000025010001F7091113FF28C2DCFF
          26D2F2FF26D2F1FF26D2F1FF26D2F0FF26D2F1FF26D2F0FF24D2F0FF29A3B9FF
          030304FF2AB5CEFF24D2F0FF7676CEFF7271F3FF5A59F9FF5757FBFF5555FCFF
          5352FDFF4D4CFDFF201FFCFF0101FCFF0000FBFF0000F9FF0000F3FF2A2AD2FF
          B5B5E6FF000000000000000000000000000000000101018E020102FF1F5F6DFF
          2CD5F2FF2DD4F3FF2DD5F2FF2DD5F2FF2DD5F2FF2FCEE8FF2CD5F2FF31C6DCFF
          050405FF1D7180FF8281BFFF7D7DF5FF6565FBFF6262FDFF6060FEFF5F5FFFFF
          6363FFFF7D7DF8FF7372FEFF3B3BFFFF0A0AFEFF0000FEFF0000FBFF0000F5FF
          3636D6FF0000000000000000000000000000000000000012010001EC04080AFF
          36B9CDFF35D6F1FF34D6F2FF34D6F2FF33D7F2FF236270FF205661FF36AFC4FF
          0B1519FF122B31FF34D6F0FF9999EFFF7070FEFF6D6DFFFF6F6FFFFF7575FFFF
          7E7EE8FF7A79B1FF7675CEFF8484FEFF5E5EFFFF2D2DFFFF0505FFFF0404FCFF
          4545E3FF00000000000000000000000000000000000000000202026E020101FF
          1C4B52FF3CD9F2FF3AD9F2FF3AD9F2FF3AD9F2FF37A9BBFF040102FF040405FF
          050504FF040304FF39B8CCFF3AD9F2FF9C9CF2FF7F7FFFFF8383FFFF8585EAFF
          8E8DB2FF14373EFF020101FF7171CBFF8E8EFEFF7171FFFF5F5FFEFF5656EBFF
          00000000000000000000000000000000000000000000000000000007010101D7
          030305FF3DABBDFF44DCF4FF44DCF4FF43DCF4FF46DAF2FF122327FF203D42FF
          1D434AFF060504FF2C7281FF42DCF5FF43DCF4FFA6A6F4FF8685E5FF8D8BAFFF
          3698A8FF020202FF010001DC000000087575CFFF9C9CFEFF7676E4FF00000000
          000000000000000000000000000000000000000000000000000000000000004F
          020102FF1A363BFF4EDCF3FF4CDEF4FF4CDDF4FF4CDEF4FF307481FF0A1012FF
          4CCCE1FF46BACCFF35828EFF4DDEF2FF4BDEF3FF4CDEF4FF4CDDF4FF4DD9EEFF
          14252AFF020101FF0002005A00000000000000009292D8FF0000000000000000
          0000000000000000000000000000000000000000000000000000000000000001
          020202BF010101FF4098A6FF53E0F4FF54E0F3FF54E1F3FF51C5D6FF050406FF
          2E6A74FF55E0F3FF54E0F3FF54E0F3FF54E0F3FF54E0F3FF54E0F3FF398690FF
          030101FF000000CD000000030000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000033010000FC132226FF5ADCEEFF5AE2F6FF5AE3F5FF5CE2F5FF213E44FF
          070C0DFF57CDDDFF5AE3F5FF5AE2F5FF5AE3F5FF5BE2F5FF5BD6E8FF0B1719FF
          010100FE00000041000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000010101A5020201FF40818AFF63E5F5FF63E4F6FF62E4F6FF46929CFF
          010101FF32646BFF64E4F7FF63E4F7FF63E4F6FF64E4F7FF3B7178FF020101FF
          010101B800000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000023010101F60C1315FF68D6E5FF6CE7F9FF6CE7F8FF6ADDEBFF
          0A0F10FF07090BFF62CCD9FF6CE7F9FF6CE7F7FF65CFDBFF080C0EFF020100FC
          0000003000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000008B010101FF39686FFF73E8F8FF72E9F7FF71E9F7FF
          3D686FFF233D41FF56A3ABFF71EAF6FF72E9F7FF345C62FF010101FF010101A3
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000013020100EC08080AFF6EC9D3FF78EBF9FF7AEBF8FF
          79ECF8FF7CEBF9FF79EBF8FF7BECF9FF6BC4CDFF050507FF010101F600000020
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000002020276010101FF304E52FF82EDF9FF82EDFAFF
          82EDFAFF82EDFAFF81EDFAFF81EEF7FF314A4EFF020101FF0101018A00000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000A000100DE050305FF6EB8C1FF88F0FBFF
          88F0FBFF88F0FBFF88F0FBFF6DB7BEFF030303FF000000ED0000001500000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000200005D020101FF26383AFF91F0FAFF
          90F3FCFF91F2FCFF90F0FAFF26383BFF020101FF020202790000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000003010101CB020102FF6AA3A8FF
          96F4FAFF97F3FBFF6BA7AAFF040102FF020101E10000000C0000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000044010000FE192526FF
          98EEF3FF9DF0F5FF1D292BFF010101FF02020264000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000020102B3020101FF
          2A3B3BFF2B3E3FFF020101FF000000D100000004000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000002E000000FA
          010101FF010101FF010101FF0000004E00000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000001010198
          010101FF010101FF020202C10000000200000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000001A
          010101DA010101E6000000340000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000300000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FFFFF3F7FFFFE1E3FFFFC0C100000000000000000000000080000001
          80000003C0000003E0000001E0000000F0000000F0000000F8000001F8000003
          FC000037FC00003FFE00007FFF0000FFFF0000FFFF8001FFFF8001FFFFC003FF
          FFC003FFFFE007FFFFE007FFFFF00FFFFFF80FFFFFF81FFFFFFC1FFFFFFC3FFF
          FFFE7FFF}
        Transparent = True
        Visible = False
      end
      object lbDateSost: TvchDBText
        Left = 608
        Top = 7
        Width = 114
        Height = 18
        Color = clBtnFace
        DataField = 'DATE_FIKS'
        DataSource = dsDokument
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        OnClick = TextAdresClick
        OnGetText = lbDateSostGetText
      end
      object edFam: TDBEditEh
        Left = 67
        Top = 5
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
        TabOrder = 0
        Visible = True
      end
      object edPol: TDBComboBoxEh
        Left = 40
        Top = 33
        Width = 98
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
        TabOrder = 3
        Visible = True
        OnChange = edPolChange
      end
      object edName: TDBEditEh
        Left = 253
        Top = 5
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
        TabOrder = 1
        Visible = True
        OnUpdateData = edNameUpdateData
      end
      object edOtch: TDBEditEh
        Left = 457
        Top = 5
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
        TabOrder = 2
        Visible = True
      end
      object edDateR: TDBDateTimeEditEh
        Left = 253
        Top = 33
        Width = 110
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
        TabOrder = 4
        Visible = True
      end
      object edCitizen: TDBLookupComboboxEh
        Left = 457
        Top = 33
        Width = 201
        Height = 24
        DataField = 'CITIZEN'
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
      object btAdres: TBitBtn
        Left = 570
        Top = 59
        Width = 36
        Height = 22
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1076#1088#1077#1089
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
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
        Left = 629
        Top = 62
        Width = 161
        Height = 17
        Hint = #1073#1077#1079' '#1072#1076#1088#1077#1089#1072' '#1085#1072' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080' '#1089#1086#1074#1077#1090#1072
        Caption = #1073#1077#1079' '#1072#1076#1088#1077#1089#1072' '#1085#1072' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080
        DataField = 'BEZADRESA'
        DataSource = dsDokument
        TabOrder = 7
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = N_F_cbBezAdresaClick
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 723
    Width = 834
    Panels = <
      item
        Style = psOwnerDraw
        Text = '<F2> '#1079#1072#1087#1080#1089#1072#1090#1100'  <F5> '#1087#1088#1077#1076#1087#1088#1086#1089#1084#1086#1090#1088'  <F6> '#1087#1077#1095#1072#1090#1100'   <Ctrl-F2> '#1074#1099#1093#1086#1076
        Width = 50
      end>
  end
  inherited dsDokument: TDataSource
    Left = 584
    Top = 514
  end
  object dsMigr: TDataSource [4]
    OnStateChange = dsMigrStateChange
    OnDataChange = dsMigrDataChange
    Left = 468
    Top = 95
  end
  object dsPrizn: TDataSource [5]
    DataSet = dmMen.tbPriznaki
    OnDataChange = dsMigrDataChange
    Left = 756
    Top = 158
  end
  object dsLgot: TDataSource [6]
    DataSet = dmMen.tbLgot
    OnDataChange = dsMigrDataChange
    Left = 628
    Top = 230
  end
  object dsOsobOtm: TDataSource [7]
    Left = 664
    Top = 170
  end
  object dsKomiss: TDataSource [8]
    Left = 432
    Top = 90
  end
  inherited dsObl: TDataSource
    Left = 696
    Top = 338
  end
  inherited dsRN: TDataSource
    Left = 560
    Top = 242
  end
  inherited dsGorod: TDataSource
    Left = 592
    Top = 218
  end
  inherited dsStran: TDataSource
    Left = 460
    Top = 401
  end
  inherited dsTypeGorod: TDataSource
    Left = 608
    Top = 370
  end
  object dsSprPostOch: TDataSource
    Left = 300
    Top = 410
  end
  object dsSprSnOch: TDataSource
    Left = 464
    Top = 231
  end
  object dsSprTypeHouse: TDataSource
    DataSet = dmBase.SprTypeHouse
    Left = 532
    Top = 218
  end
  object dsSostavSem: TDataSource
    DataSet = dmMen.tbSostavSem
    OnDataChange = dsSostavSemDataChange
    Left = 393
    Top = 389
  end
  object dsOcheredLgot: TDataSource
    DataSet = dmMen.tbOcheredLgot
    OnDataChange = dsOcheredLgotDataChange
    Left = 129
    Top = 341
  end
  object dsVoenkom: TDataSource
    DataSet = dmBase.SprVoenkom
    Left = 488
    Top = 223
  end
  object dsOcheredResh: TDataSource
    OnDataChange = dsOcheredReshDataChange
    Left = 324
    Top = 374
  end
  object dsSobst: TDataSource
    DataSet = dmMen.tbOcheredSobstv
    Left = 536
    Top = 513
  end
  object dsSverki: TDataSource
    DataSet = dmMen.tbSverki
    OnDataChange = dsSverkiDataChange
    Left = 37
    Top = 644
  end
end
