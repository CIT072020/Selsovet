inherited fmMen: TfmMen
  Left = 383
  Top = 198
  Caption = #1063#1077#1083#1086#1074#1077#1082
  ClientHeight = 698
  ClientWidth = 811
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
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBDock: TTBDock
    Width = 811
    inherited TBToolbar: TTBToolbar
      inherited TBItemDelList: TTBItem
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
        Visible = False
      end
      inherited TBItemPreView: TTBItem
        Hint = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      end
      inherited TBItemPrint: TTBItem
        Hint = #1055#1077#1095#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      end
      object TBItemTalonPrib: TTBItem [5]
        Caption = #1058#1072#1083#1086#1085
        Hint = #1042#1099#1087#1080#1089#1072#1090#1100' '#1090#1072#1083#1086#1085' '#1087#1088#1080#1073#1099#1090#1080#1103
        ImageIndex = 48
        ShortCut = 16468
        OnClick = TBItemTalonPribClick
      end
      inherited TBItemWrite: TTBItem
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      end
      inherited TBItemCancel: TTBItem
        Hint = #1042#1099#1081#1090#1080' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
      end
    end
  end
  inherited sb: TScrollBox
    Width = 811
    Height = 653
    object pc: TPageControl
      Left = 0
      Top = 87
      Width = 811
      Height = 566
      ActivePage = tsMain
      Align = alClient
      TabOrder = 0
      TabStop = False
      OnChange = pcChange
      object tsMain: TTabSheet
        Caption = #1054#1089#1085#1086#1074#1085#1099#1077
        object gbObraz: TGroupBox
          Left = 0
          Top = 273
          Width = 803
          Height = 75
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
            Left = 561
            Top = 51
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
            Top = 51
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
            Left = 552
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
          object edStud_Place: TDBEditEh
            Left = 120
            Top = 45
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
            TabOrder = 3
            Visible = True
          end
          object edKurs: TDBEditEh
            Left = 621
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
            Width = 298
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
            Left = 659
            Top = 45
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
          Top = 83
          Width = 803
          Height = 97
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
            Top = 46
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
            Top = 72
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
            Top = 72
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
            Top = 17
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
          object edIsWork: TDBComboBoxEh
            Left = 10
            Top = 15
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
          object edDolg_Name: TDBEditEh
            Left = 92
            Top = 67
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
            TabOrder = 3
            Visible = True
          end
          object edWork_Name: TDBEditEh
            Left = 92
            Top = 41
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
            TabOrder = 2
            Visible = True
          end
          object edWorkTelefon: TDBEditEh
            Left = 408
            Top = 67
            Width = 121
            Height = 22
            DataField = 'WORK_TELEF'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            ParentFont = False
            TabOrder = 4
            Visible = True
          end
          object edUNP: TDBEditEh
            Left = 644
            Top = 14
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
            TabOrder = 1
            Visible = True
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 475
          Width = 803
          Height = 63
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 7
          object gbLgot: TGroupBox
            Left = 0
            Top = 0
            Width = 377
            Height = 63
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
            Width = 426
            Height = 63
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
          Width = 803
          Height = 83
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label29: TLabel
            Left = 10
            Top = 64
            Width = 108
            Height = 13
            Caption = #1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
          end
          object lbOtnosh: TLabel
            Left = 10
            Top = 8
            Width = 210
            Height = 13
            Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077' '#1082' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1091', '#1085#1072#1085#1080#1084#1072#1090#1077#1083#1102
          end
          object Label5: TLabel
            Left = 321
            Top = 64
            Width = 44
            Height = 13
            Caption = #1058#1077#1083#1077#1092#1086#1085
          end
          object Label68: TLabel
            Left = 10
            Top = 37
            Width = 93
            Height = 13
            Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          end
          object Label69: TLabel
            Left = 541
            Top = 64
            Width = 84
            Height = 13
            Caption = #1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100
          end
          object Label10: TLabel
            Left = 247
            Top = 37
            Width = 75
            Height = 13
            Caption = #1044#1072#1090#1072' '#1074#1099#1073#1099#1090#1080#1103
          end
          object Label109: TLabel
            Left = 464
            Top = 37
            Width = 84
            Height = 13
            Caption = #1044#1086' '#1082#1072#1082#1086#1075#1086' '#1089#1088#1086#1082#1072
            Visible = False
          end
          object Label110: TLabel
            Left = 556
            Top = 8
            Width = 13
            Height = 13
            Caption = #1076#1086
          end
          object edSem: TDBComboBoxEh
            Left = 136
            Top = 59
            Width = 152
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
                Style = ebsGlyphEh
                OnClick = edOTNOSHEditButtons1Click
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
          object edTelefon: TDBEditEh
            Left = 376
            Top = 59
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
            TabOrder = 7
            Visible = True
          end
          object edDateProp2: TDBDateTimeEditEh
            Left = 115
            Top = 32
            Width = 108
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
          object edNation: TDBLookupComboboxEh
            Left = 640
            Top = 59
            Width = 124
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
            TabOrder = 8
            Visible = True
          end
          object edDateV2: TDBDateTimeEditEh
            Left = 335
            Top = 31
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
            TabOrder = 4
            Visible = True
          end
          object edDateSrok2: TDBDateTimeEditEh
            Left = 560
            Top = 31
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
            TabOrder = 5
            Visible = False
          end
          object N_F_cbKvartirant: TDBCheckBoxEh
            Left = 456
            Top = 6
            Width = 89
            Height = 17
            Caption = #1082#1074#1072#1088#1090#1080#1088#1072#1085#1090
            DataField = 'NOMER_SEM'
            DataSource = dsDokument
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object edDateSrokDN: TDBDateTimeEditEh
            Left = 587
            Top = 5
            Width = 108
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
        end
        object gbPasp: TGroupBox
          Left = 0
          Top = 180
          Width = 803
          Height = 93
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
            Top = 44
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
            Top = 44
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
            Top = 44
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
            Top = 44
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
          object Label112: TLabel
            Left = 555
            Top = 70
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
          object edLichNomer: TDBEditEh
            Left = 135
            Top = 38
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
            Top = 38
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
            Top = 38
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
            Left = 618
            Top = 38
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
            Top = 64
            Width = 429
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
            Top = 12
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
            Left = 641
            Top = 64
            Width = 121
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
          Top = 393
          Width = 803
          Height = 46
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
            Left = 232
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
            Left = 448
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
            Left = 46
            Top = 16
            Width = 121
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
            Left = 318
            Top = 16
            Width = 97
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
            Left = 526
            Top = 16
            Width = 121
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
          Top = 348
          Width = 803
          Height = 45
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
            Top = 19
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
            Top = 19
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
            Top = 15
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
                Width = 16
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
                Width = 16
                OnClick = edPapaEditButtons1Click
              end
              item
                Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
                Style = ebsGlyphEh
                Width = 14
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
            Top = 15
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
                Width = 16
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
                Width = 16
                OnClick = edMamaEditButtons1Click
              end
              item
                Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
                Style = ebsGlyphEh
                Width = 14
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
          Top = 439
          Width = 803
          Height = 36
          Align = alTop
          TabOrder = 6
          object Label122: TLabel
            Left = 5
            Top = 10
            Width = 179
            Height = 13
            Caption = #1059#1076#1086#1089#1090#1086#1074#1077#1088#1077#1085#1080#1077' '#1086' '#1087#1088#1072#1074#1077'  '#1085#1072' '#1083#1100#1075#1086#1090#1099
          end
          object edUdostLgot: TDBEditEh
            Left = 229
            Top = 6
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
          Top = 330
          Width = 803
          Height = 43
          Align = alTop
          Caption = ' '#1057#1091#1076#1080#1084#1086#1089#1090#1100' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
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
            Width = 121
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
          object cbSpec: TDBCheckBoxEh
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
            OnClick = cbSpecClick
          end
        end
        object gbAktSmert: TGroupBox
          Left = 0
          Top = 259
          Width = 803
          Height = 71
          Align = alTop
          Caption = ' '#1047#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1089#1084#1077#1088#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object Label25: TLabel
            Left = 24
            Top = 19
            Width = 30
            Height = 13
            Caption = #1085#1086#1084#1077#1088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label26: TLabel
            Left = 191
            Top = 19
            Width = 25
            Height = 13
            Caption = #1076#1072#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label32: TLabel
            Left = 456
            Top = 19
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
          object Label114: TLabel
            Left = 24
            Top = 49
            Width = 53
            Height = 13
            Caption = #1086#1088#1075#1072#1085' '#1079#1072#1075#1089
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edAKT_SMER_NOMER: TDBEditEh
            Left = 67
            Top = 16
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
            Left = 223
            Top = 16
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
            Left = 543
            Top = 16
            Width = 121
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
            TabOrder = 3
            Visible = True
          end
          object edAKTSMERTORGAN: TDBEditEh
            Left = 95
            Top = 43
            Width = 566
            Height = 24
            DataField = 'AKT_SMER_ORGAN'
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
        object gbActRogd: TGroupBox
          Left = 0
          Top = 187
          Width = 803
          Height = 72
          Align = alTop
          Caption = ' '#1047#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object Label20: TLabel
            Left = 24
            Top = 18
            Width = 30
            Height = 13
            Caption = #1085#1086#1084#1077#1088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label22: TLabel
            Left = 191
            Top = 18
            Width = 25
            Height = 13
            Caption = #1076#1072#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label31: TLabel
            Left = 456
            Top = 18
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
          object Label113: TLabel
            Left = 24
            Top = 46
            Width = 53
            Height = 13
            Caption = #1086#1088#1075#1072#1085' '#1079#1072#1075#1089
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edAKT_ROGD_NOMER: TDBEditEh
            Left = 67
            Top = 15
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
            Left = 223
            Top = 15
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
            Left = 543
            Top = 15
            Width = 121
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
            TabOrder = 3
            Visible = True
          end
          object edAKTROGDORGAN: TDBEditEh
            Left = 95
            Top = 43
            Width = 566
            Height = 24
            DataField = 'AKT_ROGD_ORGAN'
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
        object gbAddInfo: TGroupBox
          Left = 0
          Top = 373
          Width = 803
          Height = 165
          Align = alClient
          Caption = ' '#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          DesignSize = (
            803
            165)
          object edAdd_Info: TDBEditEh
            Left = 7
            Top = 14
            Width = 789
            Height = 144
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
            ParentFont = False
            TabOrder = 0
            Visible = True
            WantReturns = True
          end
        end
        object gbMestoRogd: TGroupBox
          Left = 0
          Top = 109
          Width = 803
          Height = 78
          Align = alTop
          Caption = ' '#1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label74: TLabel
            Left = 14
            Top = 21
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
            Top = 21
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
            Top = 50
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
            Left = 445
            Top = 50
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
          object edMR_B_GOROD: TDBLookupComboboxEh
            Left = 544
            Top = 47
            Width = 57
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
            Left = 609
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
          object edON_M_B_OBL: TDBCheckBoxEh
            Left = 545
            Top = 19
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
          object edMR_GOSUD: TDBLookupComboboxEh
            Left = 185
            Top = 18
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
            Width = 164
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
            Left = 571
            Top = 18
            Width = 164
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
        end
        object gbOtkudaPrib: TGroupBox
          Left = 0
          Top = 0
          Width = 803
          Height = 109
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
            Top = 21
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
            Top = 21
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
            Left = 438
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
          object Label111: TLabel
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
            Left = 544
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
            Left = 609
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
            Left = 545
            Top = 19
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
            Left = 571
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
            Width = 121
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
            TabOrder = 6
            Visible = True
          end
        end
      end
      object tsMigr: TTabSheet
        Caption = #1044#1074#1080#1078#1077#1085#1080#1077
        ImageIndex = 2
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
          Width = 803
          Height = 272
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object gbMigr: TGroupBox
            Left = 0
            Top = 34
            Width = 803
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
              Width = 758
              Height = 175
              Align = alClient
              Ctl3D = True
              DataSource = dsMigr
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
                  Alignment = taCenter
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
                  Width = 167
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
                  Width = 98
                  OnGetCellParams = GridMigrColumns1GetCellParams
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
                  Width = 215
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
              Left = 760
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
            Width = 803
            Height = 34
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label30: TLabel
              Left = 3
              Top = 11
              Width = 93
              Height = 13
              Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
            end
            object Label33: TLabel
              Left = 223
              Top = 11
              Width = 75
              Height = 13
              Caption = #1044#1072#1090#1072' '#1074#1099#1073#1099#1090#1080#1103
            end
            object Label70: TLabel
              Left = 440
              Top = 11
              Width = 84
              Height = 13
              Caption = #1044#1086' '#1082#1072#1082#1086#1075#1086' '#1089#1088#1086#1082#1072
              Visible = False
            end
            object edDateProp: TDBDateTimeEditEh
              Left = 108
              Top = 4
              Width = 105
              Height = 26
              DataField = 'DATEP'
              DataSource = dsDokument
              EditButton.Visible = False
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              Kind = dtkDateEh
              ParentFont = False
              TabOrder = 0
              Visible = True
            end
            object edDateVip: TDBDateTimeEditEh
              Left = 311
              Top = 4
              Width = 105
              Height = 26
              DataField = 'DATEV'
              DataSource = dsDokument
              Enabled = False
              EditButton.Visible = False
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              Kind = dtkDateEh
              ParentFont = False
              TabOrder = 1
              Visible = True
            end
            object edDateSrok: TDBDateTimeEditEh
              Left = 536
              Top = 4
              Width = 105
              Height = 26
              DataField = 'DATE_SROK'
              DataSource = dsDokument
              Enabled = False
              EditButton.Visible = False
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
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
            Top = 229
            Width = 502
            Height = 17
            Caption = #1053#1077' '#1074#1082#1083#1102#1095#1072#1090#1100' '#1074'  '#1089#1087#1080#1089#1082#1080' '#1080#1079#1073#1080#1088#1072#1090#1077#1083#1077#1081
            DataField = 'NOTSELECT'
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
          end
          object N_F_cbNotDelete: TDBCheckBoxEh
            Left = 11
            Top = 251
            Width = 534
            Height = 17
            Caption = #1053#1077' '#1091#1076#1072#1083#1103#1090#1100' '#1080#1079' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1089#1086#1089#1090#1086#1103#1085#1080#1103
            DataField = 'NOTDELETE'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        object pnNotReg: TPanel
          Left = 0
          Top = 272
          Width = 803
          Height = 58
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          object lbAdresProp: TLabel
            Left = 10
            Top = 27
            Width = 212
            Height = 13
            Caption = #1040#1076#1088#1077#1089'  '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1087#1086' '#1084#1077#1089#1090#1091' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edAdresProp: TDBEditEh
            Left = 254
            Top = 24
            Width = 497
            Height = 19
            Hint = #1047#1072#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1076#1083#1103' '#1088#1077#1075#1080#1089#1090#1088#1080#1088#1091#1077#1084#1099#1093' '#1087#1086' '#1084#1077#1089#1090#1091' '#1087#1088#1077#1073#1099#1074#1072#1085#1080#1103
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
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Visible = True
          end
          object N_F_edFirstNotMy: TDBCheckBoxEh
            Left = 11
            Top = 0
            Width = 606
            Height = 17
            Caption = #1043#1083#1072#1074#1072' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072' '#1085#1077' '#1087#1088#1086#1078#1080#1074#1072#1077#1090' '#1080' '#1085#1077' '#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085' '#1087#1086' '#1072#1076#1088#1077#1089#1091
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
      end
      object tsVUS: TTabSheet
        Caption = #1042#1059#1057
        ImageIndex = 3
        DesignSize = (
          803
          538)
        object Label34: TLabel
          Left = 7
          Top = 92
          Width = 69
          Height = 13
          Caption = #1043#1088#1091#1087#1087#1072' '#1091#1095#1077#1090#1072
        end
        object Label35: TLabel
          Left = 202
          Top = 92
          Width = 147
          Height = 13
          Caption = #1043#1086#1076#1085#1086#1089#1090#1100' '#1082' '#1074#1086#1080#1085#1089#1082#1086#1081' '#1089#1083#1091#1078#1073#1077
        end
        object Label36: TLabel
          Left = 7
          Top = 119
          Width = 85
          Height = 13
          Caption = #1042#1086#1080#1085#1089#1082#1086#1077' '#1079#1074#1072#1085#1080#1077
        end
        object Label37: TLabel
          Left = 7
          Top = 147
          Width = 147
          Height = 13
          Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1082#1072#1103' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
        end
        object Label39: TLabel
          Left = 347
          Top = 65
          Width = 58
          Height = 13
          Caption = #1059#1095#1072#1089#1090#1086#1082' '#8470
        end
        object Label40: TLabel
          Left = 7
          Top = 65
          Width = 57
          Height = 13
          Caption = #1042#1088#1077#1084#1103' '#1103#1074#1082#1080
        end
        object Label41: TLabel
          Left = 474
          Top = 65
          Width = 62
          Height = 13
          Caption = #1052#1072#1088#1096#1088#1091#1090' '#8470
        end
        object Label46: TLabel
          Left = 323
          Top = 119
          Width = 67
          Height = 13
          Caption = #1054#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077
        end
        object Label48: TLabel
          Left = 8
          Top = 246
          Width = 185
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072', '#1085#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
        end
        object Label56: TLabel
          Left = 8
          Top = 273
          Width = 68
          Height = 13
          Caption = #1057#1086#1089#1090#1072#1074' '#1089#1077#1084#1100#1080
        end
        object Label63: TLabel
          Left = 490
          Top = 441
          Width = 178
          Height = 13
          Caption = #1044#1072#1090#1072' '#1089#1086#1089#1090#1072#1074#1083#1077#1085#1080#1103', '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
        end
        object Label64: TLabel
          Left = 11
          Top = 11
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
          Left = 221
          Top = 11
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
          Left = 377
          Top = 11
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
          Top = 441
          Width = 97
          Height = 13
          Caption = #1054#1089#1086#1073#1099#1077' '#1086#1090#1084#1077#1090#1082#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbAdres: TLabel
          Left = 207
          Top = 247
          Width = 167
          Height = 16
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
        object lbUchastokVUS: TLabel
          Left = 414
          Top = 63
          Width = 35
          Height = 16
          AutoSize = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label71: TLabel
          Left = 279
          Top = 38
          Width = 36
          Height = 13
          Caption = #1057#1086#1089#1090#1072#1074
        end
        object Label72: TLabel
          Left = 456
          Top = 38
          Width = 107
          Height = 13
          Caption = #1042#1059#1057' '#1087#1088#1077#1076#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
        end
        object Label73: TLabel
          Left = 152
          Top = 65
          Width = 48
          Height = 13
          Caption = #1052#1072#1088#1082#1072' '#1058#1057
        end
        object Label107: TLabel
          Left = 10
          Top = 469
          Width = 54
          Height = 13
          Caption = #1042#1086#1077#1085#1082#1086#1084#1072#1090
        end
        object edGruppa: TDBComboBoxEh
          Left = 91
          Top = 86
          Width = 82
          Height = 24
          DataField = 'GRUPPA'
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
        object edGodnost: TDBComboBoxEh
          Left = 363
          Top = 86
          Width = 201
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
          TabOrder = 12
          Visible = True
        end
        object edZvan: TDBComboBoxEh
          Left = 107
          Top = 113
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
          TabOrder = 13
          Visible = True
        end
        object edGragdSpec: TDBEditEh
          Left = 168
          Top = 141
          Width = 193
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
          TabOrder = 15
          Visible = True
        end
        object edKomanda: TDBEditEh
          Left = 130
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
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Visible = True
        end
        object edJavka: TDBNumberEditEh
          Left = 79
          Top = 59
          Width = 41
          Height = 24
          DataField = 'JAVKA'
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
        object edMarshrut: TDBNumberEditEh
          Left = 545
          Top = 59
          Width = 52
          Height = 24
          DataField = 'MARSHRUT'
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
        object edObrazVUS: TDBComboBoxEh
          Left = 404
          Top = 113
          Width = 170
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
          TabOrder = 14
          Visible = True
        end
        object gbWorkVUS: TGroupBox
          Left = 4
          Top = 165
          Width = 677
          Height = 74
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 16
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
            Top = 51
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
            Left = 259
            Top = 51
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
          object edIsWorkVUS: TDBComboBoxEh
            Left = 10
            Top = 15
            Width = 109
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
            Top = 45
            Width = 141
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
            TabOrder = 2
            Visible = True
          end
          object edWorkNameVUS: TDBEditEh
            Left = 223
            Top = 15
            Width = 418
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
            Left = 313
            Top = 45
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
            TabOrder = 3
            Visible = True
          end
        end
        object gbDateSV: TGroupBox
          Left = 686
          Top = 48
          Width = 114
          Height = 157
          Anchors = [akTop, akRight]
          Caption = ' '#1044#1072#1090#1099' '#1089#1074#1077#1088#1086#1082' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 24
          object Label42: TLabel
            Left = 13
            Top = 19
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
            Left = 13
            Top = 65
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
            Left = 13
            Top = 108
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
            Left = 8
            Top = 34
            Width = 98
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
            Left = 8
            Top = 82
            Width = 98
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
            Left = 8
            Top = 125
            Width = 98
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
        object gbVUS: TGroupBox
          Left = 686
          Top = 0
          Width = 114
          Height = 47
          Anchors = [akTop, akRight]
          Caption = ' '#1053#1086#1084#1077#1088' '#1042#1059#1057
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object edNomerVUS: TDBEditEh
            Left = 6
            Top = 15
            Width = 102
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
        object gbKomiss: TGroupBox
          Left = 4
          Top = 298
          Width = 796
          Height = 77
          Anchors = [akLeft, akTop, akRight]
          Caption = 
            ' '#1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1079#1076#1086#1088#1086#1074#1100#1103' ('#1076#1083#1103' '#1074#1086#1077#1085#1085#1086#1086#1073#1103#1079#1072#1085#1085#1099#1093', '#1075#1086#1076#1085#1099#1093' '#1082' '#1074#1086#1077#1085#1085#1086#1081' '#1089#1083#1091#1078#1073 +
            #1077' '#1089' '#1086#1088#1075#1072#1085#1080#1095#1077#1085#1080#1103#1084#1080') '
          TabOrder = 18
          object Label45: TLabel
            Left = 510
            Top = 21
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
            Left = 8
            Top = 53
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
            Left = 125
            Top = 53
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
            Left = 236
            Top = 53
            Width = 135
            Height = 13
            Caption = #1088#1072#1089#1087'. '#1073#1086#1083#1077#1079#1085#1077#1081', '#1087#1088#1080#1082#1072#1079' '#8470
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label55: TLabel
            Left = 466
            Top = 53
            Width = 195
            Height = 13
            Caption = #1055#1086#1076#1083#1077#1078#1080#1090' '#1087#1077#1088#1077#1086#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086#1074#1072#1085#1080#1102
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
            Width = 105
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
            Left = 127
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
            Left = 563
            Top = 18
            Width = 213
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
            Left = 66
            Top = 47
            Width = 41
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
            Left = 169
            Top = 47
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
            Left = 381
            Top = 47
            Width = 59
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
            Left = 671
            Top = 47
            Width = 105
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
          Left = 90
          Top = 270
          Width = 709
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          DataField = 'SOSTAV_SEM'
          DataSource = dsDokument
          EditButtons = <
            item
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000C0C0C0FFC0C0
                C0FF808080FF000080FF000080FF808080FF808080FF800000FF800000FF8080
                80FF800000FF800000FF808080FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
                C0FFC0C0C0FF808080FF000080FF808080FF000080FF808080FF800000FF8080
                80FF800000FF808080FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
                C0FFC0C0C0FFC0C0C0FF000080FF808080FF000080FF808080FF800000FF8080
                80FF800000FF808080FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
                C0FFC0C0C0FFC0C0C0FF000080FF808080FF000080FF808080FF800000FF8080
                80FF800000FF808080FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
                C0FFC0C0C0FFC0C0C0FF000080FF000080FF000080FF808080FF800000FF8000
                00FF800000FF808080FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
                C0FFC0C0C0FFC0C0C0FF000080FF000080FF000080FF808080FF800000FF8000
                00FF800000FF808080FFC0C0C0FF808080FF808080FFC0C0C0FFC0C0C0FF0000
                80FF808080FFC0C0C0FF000080FF800000FF808080FF808080FF800000FF8000
                00FF800000FF808080FF808080FF800000FF808080FFC0C0C0FFC0C0C0FF0000
                80FF000080FF808080FF000080FF800000FF800000FF808080FF800000FF8000
                00FF800000FF808080FF800000FF800000FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
                C0FF000080FF000080FF000080FF000080FF800000FF800000FF800000FF8000
                00FF800000FF800000FF800000FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
                C0FFC0C0C0FF000080FF000080FF000080FF000080FF800000FF800000FF8000
                00FF800000FF800000FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
                C0FFC0C0C0FFC0C0C0FFC0C0C0FF000080FF808080FF808080FFC0C0C0FF8000
                00FF808080FF808080FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
                C0FFC0C0C0FFC0C0C0FF000080FF000080FF000080FF808080FF800000FF8000
                00FF800000FF808080FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
                C0FFC0C0C0FFC0C0C0FF000080FF000080FF000080FF808080FF800000FF8000
                00FF800000FF808080FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
                C0FFC0C0C0FFC0C0C0FF808080FF000080FF000080FFC0C0C0FF808080FF8000
                00FF800000FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
                C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
                C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
                C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
                C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF}
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1095#1083#1077#1085#1072' '#1089#1077#1084#1100#1080
              Style = ebsGlyphEh
              OnClick = edSostSemEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          Visible = True
        end
        object gbUchet: TGroupBox
          Left = 4
          Top = 374
          Width = 796
          Height = 55
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 19
          object Label57: TLabel
            Left = 10
            Top = 9
            Width = 79
            Height = 13
            Caption = #1055#1088#1080#1085#1103#1090' '#1085#1072' '#1091#1095#1077#1090
          end
          object Label58: TLabel
            Left = 122
            Top = 9
            Width = 53
            Height = 13
            Caption = #1055#1088#1080#1073#1099#1083' '#1080#1079
          end
          object Label60: TLabel
            Left = 266
            Top = 9
            Width = 77
            Height = 13
            Caption = #1057#1086#1086#1073#1097#1077#1085#1086' '#1074' '#1042#1050
          end
          object Label59: TLabel
            Left = 389
            Top = 9
            Width = 66
            Height = 13
            Caption = #1057#1085#1103#1090' '#1089' '#1091#1095#1077#1090#1072
          end
          object Label61: TLabel
            Left = 504
            Top = 9
            Width = 80
            Height = 13
            Caption = #1050#1091#1076#1072' '#1080' '#1087#1088#1080#1095#1080#1085#1072
          end
          object Label62: TLabel
            Left = 679
            Top = 9
            Width = 77
            Height = 13
            Caption = #1057#1086#1086#1073#1097#1077#1085#1086' '#1074' '#1042#1050
          end
          object edDatePr: TDBDateTimeEditEh
            Left = 7
            Top = 23
            Width = 105
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
            TabOrder = 0
            Visible = True
          end
          object edPrib: TDBEditEh
            Left = 122
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
            TabOrder = 1
            Visible = True
          end
          object edDatePrVK: TDBDateTimeEditEh
            Left = 266
            Top = 23
            Width = 105
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
            TabOrder = 2
            Visible = True
          end
          object edDateUb: TDBDateTimeEditEh
            Left = 386
            Top = 23
            Width = 105
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
            TabOrder = 3
            Visible = True
          end
          object edUbit: TDBEditEh
            Left = 504
            Top = 23
            Width = 160
            Height = 24
            DataField = 'UBIT_TEXT'
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
          object edDateUbVK: TDBDateTimeEditEh
            Left = 679
            Top = 23
            Width = 105
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
            TabOrder = 5
            Visible = True
          end
        end
        object edDateSost: TDBDateTimeEditEh
          Left = 679
          Top = 435
          Width = 105
          Height = 24
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
          TabOrder = 22
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
          TabOrder = 1
          Visible = True
        end
        object edVBNomer: TDBEditEh
          Left = 269
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
          TabOrder = 2
          Visible = True
        end
        object edVBDate: TDBDateTimeEditEh
          Left = 420
          Top = 5
          Width = 105
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
          TabOrder = 3
          Visible = True
        end
        object edSpec: TDBLookupComboboxEh
          Left = 112
          Top = 435
          Width = 121
          Height = 21
          DataField = 'SPEC'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsOsobOtm
          ParentFont = False
          TabOrder = 20
          Visible = True
        end
        object edSpecText: TDBEditEh
          Left = 248
          Top = 435
          Width = 176
          Height = 21
          DataField = 'SPEC_TEXT'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 21
          Visible = True
        end
        object edTypeComanda: TDBComboBoxEh
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
          TabOrder = 4
          Visible = True
        end
        object edSostav: TDBComboBoxEh
          Left = 328
          Top = 32
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
          TabOrder = 6
          Visible = True
        end
        object edPredn: TDBEditEh
          Left = 576
          Top = 32
          Width = 73
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
          TabOrder = 7
          Visible = True
        end
        object edMarka: TDBEditEh
          Left = 218
          Top = 59
          Width = 95
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
          TabOrder = 9
          Visible = True
        end
        object edAdresGit: TDBEditEh
          Left = 210
          Top = 243
          Width = 589
          Height = 24
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
          TabOrder = 25
          Visible = True
        end
        object N_F_cbPriz: TDBCheckBoxEh
          Left = 544
          Top = 9
          Width = 115
          Height = 17
          Caption = #1055#1088#1080#1079#1099#1074#1085#1080#1082
          DataField = 'PRIZ'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 26
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edVoenkom: TDBLookupComboboxEh
          Left = 80
          Top = 466
          Width = 327
          Height = 24
          HelpContext = 999
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
          TabOrder = 23
          Visible = True
        end
      end
      object tsOchered: TTabSheet
        Caption = #1054#1095#1077#1088#1077#1076#1100' '#1085#1072' '#1078#1080#1083#1100#1077
        ImageIndex = 4
        object pnSostavOchered: TPanel
          Left = 0
          Top = 127
          Width = 803
          Height = 411
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel4: TPanel
            Left = 761
            Top = 0
            Width = 42
            Height = 411
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
            Width = 761
            Height = 411
            ActivePage = tsOchSostav
            Align = alClient
            HotTrack = True
            TabOrder = 1
            OnChange = pcOcheredChange
            object tsOchSostav: TTabSheet
              Caption = #1057#1086#1089#1090#1072#1074' '#1089#1077#1084#1100#1080
              object GridSostav: TDBGridEh
                Left = 0
                Top = 0
                Width = 753
                Height = 357
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
                    Width = 111
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
                    Width = 97
                  end
                  item
                    EditButtons = <>
                    FieldName = 'OTCH'
                    Footers = <>
                    Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
                    Width = 118
                  end
                  item
                    EditButtons = <>
                    FieldName = 'DATER'
                    Footers = <>
                    Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
                    Width = 92
                  end
                  item
                    EditButtons = <>
                    FieldName = 'POL'
                    Footers = <>
                    Title.Caption = #1055#1086#1083
                    Width = 76
                  end>
              end
              object Panel3: TPanel
                Left = 0
                Top = 357
                Width = 753
                Height = 26
                Align = alBottom
                BevelOuter = bvLowered
                TabOrder = 1
                object Label88: TLabel
                  Left = 13
                  Top = 6
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
                object edKolvoSostav: TDBNumberEditEh
                  Left = 58
                  Top = 3
                  Width = 37
                  Height = 21
                  DataField = 'KOLVO_SOSTAV'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  Flat = True
                  ParentFont = False
                  TabOrder = 0
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
                Width = 732
                Height = 298
                Align = alClient
                DataSource = dsOcheredLgot
                DrawMemoText = True
                FooterColor = clWindow
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -11
                FooterFont.Name = 'Tahoma'
                FooterFont.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete]
                OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
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
                    Width = 114
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'DEC_DATE'
                    Footers = <>
                    Title.Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
                    Width = 81
                  end
                  item
                    EditButtons = <>
                    FieldName = 'REG_RESH'
                    Footers = <>
                    Title.Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103'|'#1053#1086#1084#1077#1088
                    Width = 81
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'REG_DATE'
                    Footers = <>
                    Title.Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103'|'#1044#1072#1090#1072
                    Width = 89
                  end
                  item
                    EditButtons = <>
                    FieldName = 'REG_OSNOV_TEXT'
                    Footers = <>
                    Title.Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103'|'#1054#1089#1085#1086#1074#1072#1085#1080#1077
                    Width = 332
                    OnGetCellParams = GridOcheredColumns4GetCellParams
                  end>
              end
            end
            object tsDoks: TTabSheet
              Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
              ImageIndex = 3
              DesignSize = (
                753
                383)
              object edDoks: TDBEditEh
                Left = 0
                Top = 1
                Width = 752
                Height = 373
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
                Top = 25
                Width = 753
                Height = 83
                Align = alTop
                Caption = ' '#1059#1083#1091#1095#1096#1077#1085#1080#1077' '#1078#1080#1083#1080#1097#1085#1099#1093' '#1091#1089#1083#1086#1074#1080#1081' '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
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
                  Top = 50
                  Width = 58
                  Height = 21
                  Hint = #1054#1073#1097#1072#1103' '#1087#1083#1086#1097#1072#1076#1100
                  DataField = 'NEW_PLOSH_ALL'
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
                end
                object edNewKolKomn: TDBNumberEditEh
                  Left = 225
                  Top = 50
                  Width = 32
                  Height = 21
                  Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1086#1084#1085#1072#1090
                  DataField = 'NEW_KOLVO_KOMN'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Flat = True
                  ParentFont = False
                  TabOrder = 1
                  Visible = True
                end
                object edNew_Date: TDBDateTimeEditEh
                  Left = 560
                  Top = 50
                  Width = 105
                  Height = 21
                  Hint = #1044#1072#1090#1072' '#1091#1083#1091#1095#1096#1077#1085#1080#1103' '#1078#1080#1083#1080#1097#1085#1099#1093' '#1091#1089#1083#1086#1074#1080#1081
                  DataField = 'NEW_DATE'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Flat = True
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
                  Top = 50
                  Width = 103
                  Height = 21
                  DataField = 'NEW_DOGOVOR'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Flat = True
                  ParentFont = False
                  TabOrder = 2
                  Visible = True
                end
              end
              object pnKredit: TPanel
                Left = 0
                Top = 108
                Width = 753
                Height = 55
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object Label99: TLabel
                  Left = 5
                  Top = 37
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
                object Label100: TLabel
                  Left = 117
                  Top = 37
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
                object Label101: TLabel
                  Left = 276
                  Top = 37
                  Width = 31
                  Height = 13
                  Caption = #1057#1091#1084#1084#1072
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
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
                object Label94: TLabel
                  Left = 117
                  Top = 12
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
                object Label93: TLabel
                  Left = 276
                  Top = 12
                  Width = 31
                  Height = 13
                  Caption = #1057#1091#1084#1084#1072
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object edSubsidDate: TDBDateTimeEditEh
                  Left = 157
                  Top = 34
                  Width = 100
                  Height = 19
                  DataField = 'SUBSID_DATE'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Flat = True
                  Kind = dtkDateEh
                  ParentFont = False
                  TabOrder = 2
                  Visible = True
                end
                object edSubsidSumma: TDBNumberEditEh
                  Left = 322
                  Top = 34
                  Width = 93
                  Height = 19
                  HelpContext = 999
                  DataField = 'SUBSID_SUMMA'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Flat = True
                  ParentFont = False
                  TabOrder = 3
                  Visible = True
                end
                object edKreditDate: TDBDateTimeEditEh
                  Left = 157
                  Top = 9
                  Width = 100
                  Height = 19
                  DataField = 'KREDIT_DATE'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Flat = True
                  Kind = dtkDateEh
                  ParentFont = False
                  TabOrder = 0
                  Visible = True
                end
                object edKreditSumma: TDBNumberEditEh
                  Left = 322
                  Top = 9
                  Width = 93
                  Height = 19
                  DataField = 'KREDIT_SUMMA'
                  DataSource = dsDokument
                  EditButtons = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Flat = True
                  ParentFont = False
                  TabOrder = 1
                  Visible = True
                end
              end
              object Panel5: TPanel
                Left = 0
                Top = 163
                Width = 753
                Height = 220
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 2
                DesignSize = (
                  753
                  220)
                object edPrim: TDBMemo
                  Left = 2
                  Top = 4
                  Width = 747
                  Height = 214
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  DataField = 'OCHERED_PRIM'
                  DataSource = dsDokument
                  TabOrder = 0
                end
              end
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 753
                Height = 25
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 3
                object Label108: TLabel
                  Left = 16
                  Top = 4
                  Width = 66
                  Height = 13
                  Caption = #1046#1057#1050' ('#1046#1057#1055#1050')'
                end
                object DBCheckBoxEh1: TDBCheckBoxEh
                  Left = 545
                  Top = 2
                  Width = 154
                  Height = 17
                  Caption = #1055#1088#1077#1076#1086#1089#1090#1072#1074#1083#1077#1085' '#1091#1095#1072#1089#1090#1086#1082
                  DataField = 'UCHASTOK'
                  DataSource = dsDokument
                  TabOrder = 0
                  ValueChecked = 'True'
                  ValueUnchecked = 'False'
                end
                object edGSK: TDBEditEh
                  Left = 96
                  Top = 0
                  Width = 57
                  Height = 21
                  DataField = 'GSK'
                  DataSource = dsDokument
                  EditButtons = <>
                  TabOrder = 1
                  Visible = True
                end
              end
              object edSocial: TDBComboBoxEh
                Left = 219
                Top = 23
                Width = 220
                Height = 21
                DataField = 'SOCIAL'
                DataSource = dsDokument
                EditButtons = <>
                TabOrder = 4
                Visible = True
              end
            end
          end
        end
        object pnOcheredMain: TPanel
          Left = 0
          Top = 0
          Width = 803
          Height = 127
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            803
            127)
          object Label82: TLabel
            Left = 8
            Top = 10
            Width = 109
            Height = 13
            Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077' '#1087#1086#1076#1072#1085#1086
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbNomer: TLabel
            Left = 441
            Top = 10
            Width = 100
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1074' '#1086#1095#1077#1088#1077#1076#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label86: TLabel
            Left = 526
            Top = 56
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
            Left = 207
            Top = 56
            Width = 245
            Height = 13
            Caption = #1053#1072' '#1082#1072#1082#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1086#1084#1085#1072#1090' '#1087#1088#1077#1090#1077#1085#1076#1091#1077#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label89: TLabel
            Left = 8
            Top = 56
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
            Top = 33
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
            Left = 11
            Top = 79
            Width = 70
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1076#1077#1083#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label91: TLabel
            Left = 657
            Top = 1
            Width = 135
            Height = 13
            Anchors = [akTop, akRight]
            Caption = #1044#1072#1090#1072' '#1087#1077#1088#1077#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edDecDate: TDBDateTimeEditEh
            Left = 136
            Top = 7
            Width = 105
            Height = 19
            HelpContext = 888
            DataField = 'DEC_DATE'
            DataSource = dsDokument
            EditButtons = <>
            Flat = True
            Kind = dtkDateEh
            TabOrder = 0
            Visible = True
          end
          object edDecTime: TDBDateTimeEditEh
            Left = 256
            Top = 7
            Width = 123
            Height = 19
            DataField = 'DEC_TIME'
            DataSource = dsDokument
            EditButton.Visible = False
            EditButtons = <>
            Flat = True
            TabOrder = 1
            Visible = True
            EditFormat = #1074#1088#1077#1084#1103': HH  '#1095#1072#1089'.  NN '#1084#1080#1085'.'
          end
          object edNomer: TDBNumberEditEh
            Left = 556
            Top = 5
            Width = 53
            Height = 21
            DataField = 'NOMER_OCH'
            DataSource = dsDokument
            DecimalPlaces = 0
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Flat = True
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
          object edTypeHouse: TDBLookupComboboxEh
            Left = 163
            Top = 30
            Width = 297
            Height = 19
            DataField = 'TYPEHOUSE'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = edTypeHouseEditButtons0Click
              end>
            Flat = True
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsSprTypeHouse
            TabOrder = 3
            Visible = True
          end
          object edPloshAll: TDBNumberEditEh
            Left = 120
            Top = 53
            Width = 57
            Height = 19
            DataField = 'PLOSH_ALL'
            DataSource = dsDokument
            EditButtons = <>
            Flat = True
            TabOrder = 5
            Visible = True
          end
          object edKolvoKomn: TDBNumberEditEh
            Left = 464
            Top = 53
            Width = 40
            Height = 19
            DataField = 'KOLVO_KOMN'
            DataSource = dsDokument
            EditButtons = <>
            Flat = True
            TabOrder = 6
            Visible = True
          end
          object edKolvoPropis: TDBNumberEditEh
            Left = 735
            Top = 53
            Width = 35
            Height = 19
            DataField = 'KOLVO_PROPIS'
            DataSource = dsDokument
            EditButtons = <>
            Flat = True
            TabOrder = 7
            Visible = True
          end
          object edDelo: TDBEditEh
            Left = 97
            Top = 76
            Width = 91
            Height = 19
            DataField = 'DELO'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            ParentFont = False
            TabOrder = 8
            Visible = True
          end
          object edResidence: TDBComboBoxEh
            Left = 497
            Top = 30
            Width = 158
            Height = 19
            DataField = 'RESIDENCE'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsGlyphEh
              end>
            Flat = True
            TabOrder = 4
            Visible = True
          end
          object edDatePerereg: TDBDateTimeEditEh
            Left = 689
            Top = 15
            Width = 105
            Height = 19
            HelpContext = 888
            Anchors = [akTop, akRight]
            DataField = 'PER_DATE'
            DataSource = dsDokument
            EditButtons = <>
            Flat = True
            Kind = dtkDateEh
            TabOrder = 9
            Visible = True
          end
          object cbNewSem: TDBCheckBoxEh
            Left = 600
            Top = 77
            Width = 169
            Height = 17
            Caption = #1052#1086#1083#1086#1076#1072#1103' '#1089#1077#1084#1100#1103
            DataField = 'NEWSEM'
            DataSource = dsDokument
            TabOrder = 10
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
      end
    end
    object pnZag: TPanel
      Left = 0
      Top = 0
      Width = 811
      Height = 87
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        811
        87)
      object Label1: TLabel
        Left = 10
        Top = 9
        Width = 44
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103
      end
      object Label4: TLabel
        Left = 10
        Top = 40
        Width = 19
        Height = 13
        Caption = #1055#1086#1083
      end
      object Label2: TLabel
        Left = 221
        Top = 9
        Width = 19
        Height = 13
        Caption = #1048#1084#1103
      end
      object Label3: TLabel
        Left = 400
        Top = 9
        Width = 49
        Height = 13
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      end
      object Label7: TLabel
        Left = 161
        Top = 40
        Width = 80
        Height = 13
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      end
      object Label18: TLabel
        Left = 375
        Top = 40
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
        Left = 772
        Top = 4
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
        Top = 65
        Width = 31
        Height = 13
        Caption = #1040#1076#1088#1077#1089
      end
      object TextAdres: TvchDBText
        Left = 54
        Top = 62
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
      object vchDBText1: TvchDBText
        Left = 664
        Top = 38
        Width = 89
        Height = 17
        DataField = 'FIRST'
        DataSource = dsDokument
        Visible = False
        OnGetText = vchDBText1GetText
      end
      object edFam: TDBEditEh
        Left = 67
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
        TabOrder = 0
        Visible = True
      end
      object edPol: TDBComboBoxEh
        Left = 40
        Top = 34
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
        Left = 249
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
        TabOrder = 1
        Visible = True
        OnUpdateData = edNameUpdateData
      end
      object edOtch: TDBEditEh
        Left = 457
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
        TabOrder = 2
        Visible = True
      end
      object edDateR: TDBDateTimeEditEh
        Left = 249
        Top = 34
        Width = 105
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
        OnUpdateData = edDateRUpdateData
      end
      object edCitizen: TDBLookupComboboxEh
        Left = 453
        Top = 34
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
      object cbVUS: TDBCheckBoxEh
        Left = 668
        Top = 8
        Width = 49
        Height = 17
        Hint = #1042#1086#1077#1085#1085#1086'-'#1091#1095#1077#1090#1085#1099#1081' '#1089#1090#1086#1083
        Caption = #1042#1059#1057
        DataField = 'VUS'
        DataSource = dsDokument
        TabOrder = 6
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        Visible = False
        OnClick = cbVUSClick
      end
      object btAdres: TBitBtn
        Left = 570
        Top = 60
        Width = 36
        Height = 22
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1076#1088#1077#1089
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
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
        Top = 63
        Width = 161
        Height = 17
        Hint = #1073#1077#1079' '#1072#1076#1088#1077#1089#1072' '#1085#1072' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080' '#1089#1086#1074#1077#1090#1072
        Caption = #1073#1077#1079' '#1072#1076#1088#1077#1089#1072' '#1085#1072' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080
        DataField = 'BEZADRESA'
        DataSource = dsDokument
        TabOrder = 8
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = N_F_cbBezAdresaClick
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 679
    Width = 811
    Panels = <
      item
        Style = psOwnerDraw
        Text = '<F2> '#1079#1072#1087#1080#1089#1072#1090#1100'  <F5> '#1087#1088#1077#1076#1087#1088#1086#1089#1084#1086#1090#1088'  <F6> '#1087#1077#1095#1072#1090#1100'   <Ctrl-F2> '#1074#1099#1093#1086#1076
        Width = 50
      end>
  end
  inherited dsDokument: TDataSource
    Left = 440
    Top = 538
  end
  object dsMigr: TDataSource [4]
    OnStateChange = dsMigrStateChange
    OnDataChange = dsMigrDataChange
    Left = 452
    Top = 199
  end
  object dsPrizn: TDataSource [5]
    DataSet = dmMen.tbPriznaki
    OnDataChange = dsMigrDataChange
    Left = 364
    Top = 278
  end
  object dsLgot: TDataSource [6]
    DataSet = dmMen.tbLgot
    OnDataChange = dsMigrDataChange
    Left = 612
    Top = 238
  end
  object dsOsobOtm: TDataSource [7]
    Left = 624
    Top = 298
  end
  object dsKomiss: TDataSource [8]
    Left = 624
    Top = 194
  end
  inherited dsObl: TDataSource
    Left = 744
    Top = 250
  end
  inherited dsRN: TDataSource
    Left = 728
    Top = 306
  end
  inherited dsGorod: TDataSource
    Left = 680
    Top = 298
  end
  inherited dsStran: TDataSource
    Left = 724
    Top = 401
  end
  inherited dsTypeGorod: TDataSource
    Left = 704
    Top = 322
  end
  object dsSprPostOch: TDataSource
    DataSet = dmBase.SprPostOch
    Left = 412
    Top = 290
  end
  object dsSprSnOch: TDataSource
    DataSet = dmBase.SprSnOch
    Left = 520
    Top = 263
  end
  object dsSprTypeHouse: TDataSource
    DataSet = dmBase.SprTypeHouse
    Left = 420
    Top = 250
  end
  object dsSostavSem: TDataSource
    DataSet = dmMen.tbSostavSem
    OnDataChange = dsSostavSemDataChange
    Left = 481
    Top = 301
  end
  object dsOcheredLgot: TDataSource
    DataSet = dmMen.tbOcheredLgot
    OnDataChange = dsOcheredLgotDataChange
    Left = 289
    Top = 269
  end
  object dsVoenkom: TDataSource
    DataSet = dmBase.SprVoenkom
    Left = 312
    Top = 311
  end
  object dsOcheredResh: TDataSource
    Left = 332
    Top = 243
  end
end
