inherited fmTalonUbit: TfmTalonUbit
  Left = 425
  Top = 81
  Caption = #1058#1072#1083#1086#1085' '#1091#1073#1099#1090#1080#1103
  ClientHeight = 753
  ClientWidth = 754
  Constraints.MinHeight = 755
  Constraints.MinWidth = 770
  Icon.Data = {
    0000010001001212100000000000880100001600000028000000120000002400
    0000010004000000000020010000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000004
    4440000064444000000000049200000049990000000000049200000649200000
    0000000669600004292000000000000049260064990000000000000064926449
    9600000000000000064222992000000000000006462299960000000000000004
    9604996644440000000000049604296429960000000000049244994296000000
    0000000049929929000000000000000004999220000000000000000000492200
    0000000000000000000494400000000000000000000429600000000000000000
    00049960000000000000000000066600000000000000E1F04000E3F0C000E3E1
    C000E1E1C000F0C3C000F003C000F807C000E00FC000E200C000E200C000E003
    C000F00FC000F81FC000FC3FC000FE1FC000FE1FC000FE1FC000FE3FC000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 731
    Width = 754
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited pnTable: TPanel
    Top = 731
    Width = 754
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 754
    inherited TBToolbar: TTBToolbar
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 750
        Top = 22
      end
    end
  end
  inherited sb: TScrollBox
    Width = 754
    Height = 681
    Align = alClient
    inherited pnPovtor: TPanel
      Width = 473
      TabOrder = 2
    end
    inherited N_F_edTypeEkz: TComboBox
      TabOrder = 3
    end
    object pn: TPanel
      Left = 0
      Top = 0
      Width = 754
      Height = 32
      Align = alTop
      TabOrder = 0
      object Label38: TLabel
        Left = 13
        Top = 7
        Width = 99
        Height = 13
        Caption = #1058#1072#1083#1086#1085' '#1089#1086#1089#1090#1072#1074#1083#1077#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TextLich: TvchDBText
        Left = 336
        Top = 6
        Width = 151
        Height = 18
        Color = clBtnFace
        DataField = 'ADRES_ID'
        DataSource = dsDokument
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        OnGetText = TextLichGetText
      end
      object edDate_SOST: TDBDateTimeEditEh
        Left = 125
        Top = 4
        Width = 119
        Height = 26
        DataField = 'DATE_SOST'
        DataSource = dsDokument
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
      object cbProvDvig: TDBCheckBoxEh
        Left = 505
        Top = 8
        Width = 137
        Height = 17
        Caption = #1055#1088#1086#1074#1086#1076#1080#1090#1100' '#1076#1074#1080#1078#1077#1085#1080#1077
        State = cbGrayed
        TabOrder = 1
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
    end
    object pc: TPageControl
      Left = 0
      Top = 32
      Width = 754
      Height = 649
      ActivePage = ts1
      Align = alClient
      TabOrder = 1
      object ts1: TTabSheet
        Caption = #1063#1072#1089#1090#1100' 1'
        object Label1: TLabel
          Left = 12
          Top = 9
          Width = 50
          Height = 13
          Caption = #1060#1072#1084#1080#1083#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 259
          Top = 9
          Width = 23
          Height = 13
          Caption = #1048#1084#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 455
          Top = 9
          Width = 56
          Height = 13
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 12
          Top = 37
          Width = 22
          Height = 13
          Caption = #1055#1086#1083
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 11
          Top = 64
          Width = 98
          Height = 13
          Caption = #1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 184
          Top = 37
          Width = 95
          Height = 13
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 12
          Top = 463
          Width = 267
          Height = 13
          Caption = #1050#1072#1082#1080#1084' '#1086#1088#1075#1072#1085#1086#1084' '#1073#1099#1083#1072' '#1086#1092#1086#1088#1084#1083#1077#1085#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelCel: TLabel
          Left = 11
          Top = 488
          Width = 79
          Height = 13
          Caption = #1062#1077#1083#1100' '#1074#1099#1077#1079#1076#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 6
          Top = 597
          Width = 28
          Height = 13
          Caption = #1057#1088#1086#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 12
          Top = 91
          Width = 76
          Height = 13
          Caption = #1054#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 263
          Top = 91
          Width = 125
          Height = 13
          Caption = #1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label42: TLabel
          Left = 305
          Top = 64
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
        object Label52: TLabel
          Left = 175
          Top = 597
          Width = 16
          Height = 13
          Caption = #1076#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edFamilia: TDBEditEh
          Left = 82
          Top = 2
          Width = 154
          Height = 26
          HelpContext = 888
          DataField = 'Familia'
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
              Style = ebsGlyphEh
              Width = 16
              OnClick = edFamiliaEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = True
        end
        object edName: TDBEditEh
          Left = 292
          Top = 2
          Width = 134
          Height = 26
          DataField = 'Name'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object edOtch: TDBEditEh
          Left = 517
          Top = 2
          Width = 132
          Height = 26
          DataField = 'Otch'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object edPol: TDBComboBoxEh
          Left = 49
          Top = 30
          Width = 110
          Height = 26
          DataField = 'POL'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = True
          OnChange = edPolChange
        end
        object edNATION: TDBLookupComboboxEh
          Left = 121
          Top = 57
          Width = 161
          Height = 26
          DataField = 'NATION'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME_M'
          ListSource = dsNation
          ParentFont = False
          TabOrder = 5
          Visible = True
        end
        object edDateR: TDBDateTimeEditEh
          Left = 289
          Top = 30
          Width = 110
          Height = 26
          DataField = 'DateR'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Visible = True
          EditFormat = 'DD/MM/YYYY      '
        end
        object gbRogd: TGroupBox
          Left = 0
          Top = 206
          Width = 745
          Height = 70
          Caption = ' '#1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          object Label9: TLabel
            Left = 8
            Top = 16
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
          object Label10: TLabel
            Left = 399
            Top = 16
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
          object Label11: TLabel
            Left = 110
            Top = 47
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
          object Label12: TLabel
            Left = 399
            Top = 47
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
          object edGOSUD_R: TDBLookupComboboxEh
            Left = 152
            Top = 13
            Width = 215
            Height = 26
            DataField = 'GOSUD_R'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsStran
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
          object edGOROD_R: TDBEditEh
            Left = 575
            Top = 40
            Width = 161
            Height = 26
            DataField = 'GOROD_R'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Visible = True
          end
          object DBCheckBoxEh3: TDBCheckBoxEh
            Left = 484
            Top = 15
            Width = 15
            Height = 17
            AllowGrayed = True
            DataField = 'B_OBL_R'
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
          object edB_GOROD_R: TDBLookupComboboxEh
            Left = 507
            Top = 40
            Width = 59
            Height = 26
            Alignment = taRightJustify
            DataField = 'GOROD_R_B'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsTypeGorod
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
          object edOBL_R: TDBEditEh
            Left = 507
            Top = 13
            Width = 229
            Height = 26
            DataField = 'OBL_R'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
          object edRAION_R: TDBEditEh
            Left = 152
            Top = 40
            Width = 215
            Height = 26
            DataField = 'RAION_R'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
        end
        object gbPribil: TGroupBox
          Left = 0
          Top = 279
          Width = 745
          Height = 98
          Caption = ' '#1054#1090#1082#1091#1076#1072' '#1087#1088#1080#1073#1099#1083' '#1074' '#1076#1072#1085#1085#1091#1102' '#1084#1077#1089#1090#1085#1086#1089#1090#1100' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
          object Label13: TLabel
            Left = 8
            Top = 18
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
          object Label14: TLabel
            Left = 402
            Top = 18
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
          object Label22: TLabel
            Left = 110
            Top = 47
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
          object Label23: TLabel
            Left = 402
            Top = 47
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
          object Label5: TLabel
            Left = 22
            Top = 74
            Width = 28
            Height = 13
            Caption = #1076#1072#1090#1072' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edGOSUD_O: TDBLookupComboboxEh
            Left = 152
            Top = 13
            Width = 215
            Height = 26
            DataField = 'GOSUD_O'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsStran
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
          object edGOROD_O: TDBEditEh
            Left = 575
            Top = 40
            Width = 161
            Height = 26
            DataField = 'GOROD_O'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Visible = True
          end
          object edDate_O: TDBDateTimeEditEh
            Left = 57
            Top = 67
            Width = 105
            Height = 26
            DataField = 'DATE_O'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            Visible = True
            EditFormat = 'DD/MM/YYYY      '
          end
          object DBCheckBoxEh1: TDBCheckBoxEh
            Left = 484
            Top = 16
            Width = 15
            Height = 17
            AllowGrayed = True
            DataField = 'B_OBL_O'
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
          object edGOROD_O_B: TDBLookupComboboxEh
            Left = 507
            Top = 40
            Width = 59
            Height = 26
            Alignment = taRightJustify
            DataField = 'GOROD_O_B'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsTypeGorod
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
          object edOBL_O: TDBEditEh
            Left = 507
            Top = 13
            Width = 229
            Height = 26
            DataField = 'OBL_O'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
          object edRAION_O: TDBEditEh
            Left = 152
            Top = 40
            Width = 215
            Height = 26
            DataField = 'RAION_O'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
        end
        object edOrgan: TDBEditEh
          Left = 301
          Top = 456
          Width = 428
          Height = 26
          DataField = 'ORGAN'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          Visible = True
        end
        object edCel: TDBLookupComboboxEh
          Left = 105
          Top = 483
          Width = 353
          Height = 26
          DataField = 'CEL'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsCel
          ParentFont = False
          TabOrder = 15
          Visible = True
          OnChange = edCelChange
        end
        object edSrok: TDBEditEh
          Left = 324
          Top = 590
          Width = 179
          Height = 26
          HelpContext = 999
          DataField = 'SROK'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
          Visible = True
        end
        object edObraz: TDBComboBoxEh
          Left = 100
          Top = 84
          Width = 145
          Height = 26
          DataField = 'OBRAZ'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          Visible = True
        end
        object edSem: TDBComboBoxEh
          Left = 397
          Top = 84
          Width = 179
          Height = 26
          DataField = 'SEM'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Visible = True
        end
        object N_F_edSuprug: TDBCheckBoxEh
          Left = 590
          Top = 89
          Width = 119
          Height = 17
          Caption = #1074#1084#1077#1089#1090#1077' '#1089' '#1089#1091#1087#1088#1091#1075#1086#1084
          DataField = 'SUPRUG'
          DataSource = dsDokument
          TabOrder = 21
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object gbVibil: TGroupBox
          Left = 0
          Top = 511
          Width = 745
          Height = 72
          Caption = ' '#1050#1091#1076#1072' '#1074#1099#1073#1099#1083' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 16
          object Label7: TLabel
            Left = 7
            Top = 18
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
          object Label21: TLabel
            Left = 369
            Top = 18
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
          object Label32: TLabel
            Left = 109
            Top = 47
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
          object Label33: TLabel
            Left = 369
            Top = 47
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
          object edGOSUD_V: TDBLookupComboboxEh
            Left = 149
            Top = 13
            Width = 204
            Height = 26
            DataField = 'GOSUD_V'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsStran
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
          object edGOROD_V: TDBEditEh
            Left = 535
            Top = 42
            Width = 157
            Height = 26
            DataField = 'GOROD_V'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Visible = True
          end
          object edGOROD_V_B: TDBLookupComboboxEh
            Left = 477
            Top = 42
            Width = 49
            Height = 26
            Alignment = taRightJustify
            DataField = 'GOROD_V_B'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsTypeGorod
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
          object DBCheckBoxEh2: TDBCheckBoxEh
            Left = 454
            Top = 16
            Width = 15
            Height = 17
            AllowGrayed = True
            DataField = 'B_OBL_V'
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
          object edRAION_V: TDBEditEh
            Left = 149
            Top = 42
            Width = 204
            Height = 26
            DataField = 'RAION_V'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
          object edOBL_V: TDBEditEh
            Left = 477
            Top = 13
            Width = 215
            Height = 26
            DataField = 'OBL_V'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
        end
        object edContant: TDBComboBoxEh
          Left = 46
          Top = 590
          Width = 112
          Height = 26
          DataField = 'CONTANT'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
          Visible = True
        end
        object gbPasp: TGroupBox
          Left = 0
          Top = 120
          Width = 745
          Height = 83
          Caption = ' '#1055#1072#1089#1087#1086#1088#1090' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          object Label8: TLabel
            Left = 280
            Top = 30
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
          object Label27: TLabel
            Left = 377
            Top = 30
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
          object Label28: TLabel
            Left = 529
            Top = 30
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
          object Label29: TLabel
            Left = 10
            Top = 58
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
          object Label30: TLabel
            Left = 10
            Top = 30
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
          object ENG_edLichNomer: TDBEditEh
            Left = 136
            Top = 23
            Width = 129
            Height = 26
            CharCase = ecUpperCase
            DataField = 'LICH_NOMER'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Visible = True
            OnUpdateData = ENG_edLichNomerUpdateData
          end
          object edPasp_Seria: TDBEditEh
            Left = 317
            Top = 23
            Width = 43
            Height = 26
            CharCase = ecUpperCase
            DataField = 'PASP_SERIA'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
          object edPasp_Nomer: TDBEditEh
            Left = 417
            Top = 23
            Width = 97
            Height = 26
            DataField = 'PASP_NOMER'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
          object edPasp_Date: TDBDateTimeEditEh
            Left = 562
            Top = 23
            Width = 110
            Height = 26
            DataField = 'PASP_DATE'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
          object edPasp_Organ: TDBEditEh
            Left = 96
            Top = 51
            Width = 550
            Height = 26
            DataField = 'PASP_VIDAN'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = edPasp_OrganEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Visible = True
          end
        end
        object edCitizen: TDBLookupComboboxEh
          Left = 396
          Top = 57
          Width = 248
          Height = 26
          DataField = 'CITIZEN'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsGrag
          ParentFont = False
          TabOrder = 6
          Visible = True
        end
        object bgBilProp: TGroupBox
          Left = 0
          Top = 377
          Width = 745
          Height = 73
          Caption = ' '#1041#1099#1083' '#1087#1088#1086#1087#1080#1089#1072#1085' '#1087#1086' '#1072#1076#1088#1077#1089#1091' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
          object Label45: TLabel
            Left = 10
            Top = 17
            Width = 62
            Height = 13
            Caption = #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label46: TLabel
            Left = 264
            Top = 17
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
          object Label47: TLabel
            Left = 475
            Top = 17
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
          object Label48: TLabel
            Left = 10
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
          object TextAdres: TvchDBText
            Left = 676
            Top = 13
            Width = 9
            Height = 18
            Color = clWhite
            DataField = 'ADRES_ID'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Visible = False
            OnGetText = TextAdresGetText
          end
          object Label15: TLabel
            Left = 310
            Top = 50
            Width = 16
            Height = 13
            Caption = #1091#1083'.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label49: TLabel
            Left = 495
            Top = 50
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
          object Label50: TLabel
            Left = 592
            Top = 50
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
          object Label51: TLabel
            Left = 673
            Top = 50
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
          object edGOSUD_B: TDBLookupComboboxEh
            Left = 83
            Top = 14
            Width = 168
            Height = 26
            DataField = 'GOSUD_B'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsStran
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
          object edOBL_B: TDBEditEh
            Left = 314
            Top = 14
            Width = 147
            Height = 26
            DataField = 'OBL_B'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
          object edGOROD_B: TDBEditEh
            Left = 164
            Top = 43
            Width = 138
            Height = 26
            DataField = 'GOROD_B'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Visible = True
          end
          object edRAION_B: TDBEditEh
            Left = 515
            Top = 14
            Width = 151
            Height = 26
            DataField = 'RAION_B'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
          object btAdres: TBitBtn
            Left = 690
            Top = 10
            Width = 36
            Height = 22
            Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1076#1088#1077#1089
            TabOrder = 9
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
          object edUL_B: TDBEditEh
            Left = 331
            Top = 43
            Width = 150
            Height = 26
            DataField = 'UL_B'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            Visible = True
          end
          object edDOM_B: TDBEditEh
            Left = 522
            Top = 43
            Width = 58
            Height = 26
            DataField = 'DOM_B'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            Visible = True
          end
          object edKORP_B: TDBEditEh
            Left = 628
            Top = 43
            Width = 34
            Height = 26
            DataField = 'KORP_B'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            Visible = True
          end
          object edKV_B: TDBEditEh
            Left = 697
            Top = 43
            Width = 41
            Height = 26
            DataField = 'KV_B'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            Visible = True
          end
          object edGOROD_B_B: TDBLookupComboboxEh
            Left = 100
            Top = 43
            Width = 55
            Height = 26
            Alignment = taRightJustify
            DataField = 'GOROD_B_B'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsTypeGorod
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
        end
        object edUdost: TDBComboBoxEh
          Left = 9
          Top = 113
          Width = 350
          Height = 26
          DataField = 'PASP_UDOST'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = True
        end
        object edDateSrok: TDBDateTimeEditEh
          Left = 200
          Top = 590
          Width = 107
          Height = 26
          DataField = 'DATE_SROK'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          Visible = True
          EditFormat = 'DD/MM/YYYY      '
        end
        object N_F_cbUmer: TDBCheckBoxEh
          Left = 567
          Top = 489
          Width = 81
          Height = 17
          Caption = #1057#1084#1077#1088#1090#1100
          DataField = 'SMERT'
          DataSource = dsDokument
          TabOrder = 22
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = N_F_cbUmerClick
        end
        object edAktSmert: TDBEditEh
          Left = 466
          Top = 484
          Width = 91
          Height = 21
          Hint = #1040#1082#1090#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1086' '#1089#1084#1077#1088#1090#1080
          DataField = 'AKT_SMERT'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          Visible = False
        end
      end
      object ts2: TTabSheet
        Caption = #1063#1072#1089#1090#1100' 2'
        ImageIndex = 1
        object Label17: TLabel
          Left = 7
          Top = 148
          Width = 88
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 11
          Top = 431
          Width = 231
          Height = 13
          Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1087#1088#1086#1074#1077#1088#1080#1083' '#1080' '#1074#1099#1087#1080#1089#1082#1091' '#1086#1092#1086#1088#1084#1080#1083
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 49
          Top = 204
          Width = 150
          Height = 13
          Caption = #1080#1083#1080' '#1080#1089#1090#1086#1095#1085#1080#1082' '#1089#1091#1097#1077#1089#1090#1074#1086#1074#1072#1085#1080#1103
        end
        object Label31: TLabel
          Left = 7
          Top = 176
          Width = 69
          Height = 13
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 9
          Top = 232
          Width = 167
          Height = 13
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1077#1090#1077#1081' '#1076#1086' 14 '#1083#1077#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 7
          Top = 10
          Width = 228
          Height = 13
          Caption = #1055#1077#1088#1077#1077#1093#1072#1083' '#1074' '#1090#1086#1084' '#1078#1077' '#1085#1072#1089#1077#1083#1077#1085#1085#1086#1084' '#1087#1091#1085#1082#1077' '#1085#1072' '#1091#1083'. '
        end
        object Label36: TLabel
          Left = 247
          Top = 38
          Width = 35
          Height = 13
          Caption = #1076#1086#1084' '#8470
        end
        object Label37: TLabel
          Left = 379
          Top = 38
          Width = 28
          Height = 13
          Caption = #1082#1086#1088#1087'.'
        end
        object Label39: TLabel
          Left = 494
          Top = 38
          Width = 16
          Height = 13
          Caption = #1082#1074'.'
        end
        object Label40: TLabel
          Left = 7
          Top = 65
          Width = 219
          Height = 13
          Caption = #1080#1083#1080' '#1087#1077#1088#1077#1084#1077#1085#1080#1083' '#1092#1072#1084#1080#1083#1080#1102', '#1080#1084#1103', '#1086#1090#1095#1077#1089#1090#1074#1086' '#1085#1072
        end
        object Label43: TLabel
          Left = 7
          Top = 92
          Width = 84
          Height = 13
          Caption = #1044#1088#1091#1075#1080#1077' '#1087#1088#1080#1095#1080#1085#1099
        end
        object BtRB: TImage
          Left = 571
          Top = 176
          Width = 13
          Height = 17
          Picture.Data = {
            07544269746D6170E6000000424DE60000000000000076000000280000000A00
            00000E0000000100040000000000700000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFF000000FFFFFFFFFF000000F000000FFF000000F0FFFFF0FF00
            0000F0FFFFF0FF000000F0FFFFF0FF000000F0FFFFF0FF000000F000000FFF00
            0000F0FFFFFFFF000000F0FFFFFFFF000000F0FFFFFFFF000000F000000FFF00
            0000FFFFFFFFFF000000FFFFFFFFFF000000}
          Visible = False
        end
        object btRF: TImage
          Left = 523
          Top = 173
          Width = 13
          Height = 17
          Picture.Data = {
            07544269746D6170E6000000424DE60000000000000076000000280000000A00
            00000E0000000100040000000000700000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFF000000FFFFFFFFFF000000FFF0FFFFFF000000FFF0FFFFFF00
            0000FFF0FFFFFF000000FFF0FFFFFF000000FFF00000FF000000FFF0FFF0FF00
            0000FFF0FFF0FF000000FFF0FFF0FF000000FFF0FFF0FF000000FFF00000FF00
            0000FFFFFFFFFF000000FFFFFFFFFF000000}
          Visible = False
        end
        object btU: TImage
          Left = 547
          Top = 173
          Width = 13
          Height = 17
          Picture.Data = {
            07544269746D6170E6000000424DE60000000000000076000000280000000A00
            00000E0000000100040000000000700000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFF000000FFFFFFFFFF000000FFF00000FF000000FFFFFFF0FF00
            0000FFFFFFF0FF000000FFFFFFF0FF000000FFF00000FF000000FFF0FFF0FF00
            0000FFF0FFF0FF000000FFF0FFF0FF000000FFF0FFF0FF000000FFF0FFF0FF00
            0000FFFFFFFFFF000000FFFFFFFFFF000000}
          Visible = False
        end
        object Label44: TLabel
          Left = 7
          Top = 120
          Width = 220
          Height = 13
          Caption = #1043#1076#1077' '#1080' '#1082#1077#1084' '#1088#1072#1073#1086#1090#1072#1083' '#1085#1072' '#1087#1088#1077#1078#1085#1077#1084' '#1084#1077#1089#1090#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edRukov: TDBEditEh
          Left = 272
          Top = 424
          Width = 218
          Height = 26
          DataField = 'RUKOV'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          Visible = True
        end
        object edWork: TDBEditEh
          Left = 247
          Top = 141
          Width = 420
          Height = 26
          DataField = 'WORK_NAME'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          Visible = True
        end
        object edIst: TDBLookupComboboxEh
          Left = 247
          Top = 197
          Width = 257
          Height = 26
          DataField = 'ISTOC'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsIst
          ParentFont = False
          TabOrder = 9
          Visible = True
        end
        object edDateZ: TDBDateTimeEditEh
          Left = 517
          Top = 424
          Width = 121
          Height = 26
          HelpContext = 999
          DataField = 'DATEZ'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 11
          Visible = True
        end
        object GroupBox1: TGroupBox
          Left = 1
          Top = 255
          Width = 667
          Height = 161
          Caption = ' '#1044#1077#1090#1080' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
          DesignSize = (
            667
            161)
          object GridDeti: TDBGridEh
            Left = 6
            Top = 15
            Width = 610
            Height = 139
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dsDeti
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
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            UseMultiTitle = True
            VertScrollBar.VisibleMode = sbNeverShowEh
            Columns = <
              item
                EditButtons = <
                  item
                    Glyph.Data = {
                      F6000000424DF600000000000000760000002800000010000000100000000100
                      0400000000008000000000000000000000001000000000000000000000000000
                      8000008000000080800080000000800080008080000080808000C0C0C0000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                      8888887117744744788888871717474788888888171747478888888817174747
                      8888888811174447888888881117444787788178147744477478811714474447
                      4488881111444444488888811114444488888888817784778888888811174447
                      8888888811174447888888887118744888888888888888888888}
                    Style = ebsGlyphEh
                    Width = 16
                    OnClick = GridDetiColumns0EditButtons0Click
                  end>
                FieldName = 'FAMILIA'
                Footers = <>
                Title.Caption = #1060#1072#1084#1080#1083#1080#1103
                Width = 142
              end
              item
                EditButtons = <>
                FieldName = 'NAME'
                Footers = <>
                Title.Caption = #1048#1084#1103
                Width = 92
              end
              item
                EditButtons = <>
                FieldName = 'OTCH'
                Footers = <>
                Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
                Width = 123
              end
              item
                EditButtons = <>
                FieldName = 'POL'
                Footers = <>
                KeyList.Strings = (
                  #1052
                  #1046)
                PickList.Strings = (
                  #1052#1091#1078#1089#1082#1086#1081
                  #1046#1077#1085#1089#1082#1080#1081)
                Title.Caption = #1055#1086#1083
                Width = 90
              end
              item
                EditButtons = <>
                FieldName = 'DATER'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
                Width = 125
              end>
          end
          object Panel1: TPanel
            Left = 619
            Top = 15
            Width = 46
            Height = 144
            Align = alRight
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object btAddChild: TBitBtn
              Left = 8
              Top = 0
              Width = 28
              Height = 28
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100
              TabOrder = 0
              OnClick = btAddChildClick
            end
            object btDelChild: TBitBtn
              Left = 8
              Top = 39
              Width = 28
              Height = 28
              Hint = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 1
              OnClick = btDelChildClick
            end
          end
        end
        object edDolgName: TDBEditEh
          Left = 247
          Top = 169
          Width = 257
          Height = 26
          DataField = 'DOLG_NAME'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Visible = True
        end
        object edDeti: TDBNumberEditEh
          Left = 247
          Top = 225
          Width = 42
          Height = 26
          HelpContext = 999
          DataField = 'DETI'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          Visible = True
        end
        object edNewUL: TDBEditEh
          Left = 247
          Top = 5
          Width = 257
          Height = 26
          HelpContext = 888
          DataField = 'NEW_UL'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = True
        end
        object edNewDom: TDBEditEh
          Left = 288
          Top = 31
          Width = 73
          Height = 26
          DataField = 'NEW_DOM'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object edNewKorp: TDBEditEh
          Left = 415
          Top = 31
          Width = 59
          Height = 26
          DataField = 'NEW_KORP'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object edNewKv: TDBEditEh
          Left = 519
          Top = 31
          Width = 59
          Height = 26
          DataField = 'NEW_KV'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = True
        end
        object edNewFIO: TDBEditEh
          Left = 247
          Top = 58
          Width = 257
          Height = 26
          DataField = 'NEW_FIO'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Visible = True
        end
        object edDrugPrich: TDBEditEh
          Left = 247
          Top = 85
          Width = 420
          Height = 26
          DataField = 'DRUG_PRICH'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Visible = True
        end
        object edWorkOLD: TDBEditEh
          Left = 247
          Top = 113
          Width = 420
          Height = 26
          DataField = 'WORK_DOLG_OLD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Visible = True
        end
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 731
    Width = 754
  end
  inherited pnAdd: TPanel
    Width = 754
  end
  inherited dsDokument: TDataSource
    Left = 456
    Top = 74
  end
  inherited Dokument: TkbmMemTable
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NAME_ZAGS'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'NAME_ZAGS_B'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'DateIzm'
        DataType = ftDate
      end
      item
        Name = 'NOMER_EKZ'
        DataType = ftInteger
      end
      item
        Name = 'POVTOR'
        DataType = ftBoolean
      end
      item
        Name = 'TYPE_EKZ'
        DataType = ftInteger
      end
      item
        Name = 'IS_GOROD'
        DataType = ftBoolean
      end
      item
        Name = 'DATE_ANUL'
        DataType = ftDate
      end
      item
        Name = 'NOMER'
        DataType = ftInteger
      end
      item
        Name = 'DATEZ'
        DataType = ftDate
      end
      item
        Name = 'Familia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Otch'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DateR'
        DataType = ftDate
      end
      item
        Name = 'SOATO_R'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'GOSUD_R'
        DataType = ftInteger
      end
      item
        Name = 'OBL_R'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RAION_R'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GOROD_R'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SELO_R'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'POL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NATION'
        DataType = ftInteger
      end
      item
        Name = 'OBRAZ'
        DataType = ftInteger
      end
      item
        Name = 'SEM'
        DataType = ftInteger
      end
      item
        Name = 'SOATO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ADRES_ID'
        DataType = ftInteger
      end
      item
        Name = 'ADRES_NAME'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ORGAN'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'SOATO_O'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'GOSUD_O'
        DataType = ftInteger
      end
      item
        Name = 'OBL_O'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RAION_O'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GOROD_O'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DATE_O'
        DataType = ftDate
      end
      item
        Name = 'GOD_PROG'
        DataType = ftSmallint
      end
      item
        Name = 'CEL'
        DataType = ftInteger
      end
      item
        Name = 'SROK'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CONTANT'
        DataType = ftInteger
      end
      item
        Name = 'ISTOC'
        DataType = ftInteger
      end
      item
        Name = 'DETI'
        DataType = ftSmallint
      end
      item
        Name = 'LICH_NOMER'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'PASP_SERIA'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'PASP_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PASP_DATE'
        DataType = ftDate
      end
      item
        Name = 'DATE_SOST'
        DataType = ftDate
      end
      item
        Name = 'RUKOV'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'MEN_ID'
        DataType = ftInteger
      end
      item
        Name = 'LICH_ID'
        DataType = ftInteger
      end
      item
        Name = 'PROV'
        DataType = ftBoolean
      end
      item
        Name = 'WORK_NAME'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'DOLG_NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SUPRUG'
        DataType = ftBoolean
      end
      item
        Name = 'PASP_VIDAN'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'SOATO_V'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'GOSUD_V'
        DataType = ftInteger
      end
      item
        Name = 'OBL_V'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RAION_V'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GOROD_V'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NEW_ADRES_ID'
        DataType = ftInteger
      end
      item
        Name = 'NEW_UL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NEW_DOM'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NEW_KORP'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NEW_KV'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NEW_FIO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CITIZEN'
        DataType = ftInteger
      end
      item
        Name = 'DRUG_PRICH'
        DataType = ftMemo
      end
      item
        Name = 'WORK_DOLG_OLD'
        DataType = ftMemo
      end
      item
        Name = 'GOSUD_B'
        DataType = ftInteger
      end
      item
        Name = 'OBL_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RAION_B'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'GOROD_B'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'UL_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DOM_B'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'KORP_B'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'KV_B'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'PASP_UDOST'
        DataType = ftSmallint
      end
      item
        Name = 'GOROD_R_B'
        DataType = ftSmallint
      end
      item
        Name = 'GOROD_O_B'
        DataType = ftSmallint
      end
      item
        Name = 'GOROD_V_B'
        DataType = ftSmallint
      end
      item
        Name = 'GOROD_B_B'
        DataType = ftSmallint
      end
      item
        Name = 'B_OBL_R'
        DataType = ftBoolean
      end
      item
        Name = 'B_OBL_O'
        DataType = ftBoolean
      end
      item
        Name = 'B_OBL_V'
        DataType = ftBoolean
      end
      item
        Name = 'DATE_SROK'
        DataType = ftDate
      end
      item
        Name = 'SMERT'
        DataType = ftBoolean
      end
      item
        Name = 'DATE_SMERT'
        DataType = ftDate
      end
      item
        Name = 'AKT_SMERT'
        DataType = ftMemo
      end>
    Left = 512
    Top = 66
    object DokumentNOMER: TIntegerField
      FieldName = 'NOMER'
    end
    object DokumentDATEZ: TDateField
      FieldName = 'DATEZ'
    end
    object DokumentFamilia: TStringField
      FieldName = 'Familia'
      Size = 50
    end
    object DokumentName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object DokumentOtch: TStringField
      FieldName = 'Otch'
      Size = 30
    end
    object DokumentDateR: TDateField
      FieldName = 'DateR'
    end
    object DokumentSOATO_R: TStringField
      FieldName = 'SOATO_R'
      Size = 10
    end
    object DokumentGOSUD_R: TIntegerField
      FieldName = 'GOSUD_R'
    end
    object DokumentOBL_R: TStringField
      FieldName = 'OBL_R'
      Size = 30
    end
    object DokumentRAION_R: TStringField
      FieldName = 'RAION_R'
      Size = 30
    end
    object DokumentGOROD_R: TStringField
      FieldName = 'GOROD_R'
      Size = 30
    end
    object DokumentSELO_R: TStringField
      FieldName = 'SELO_R'
      Size = 30
    end
    object DokumentPOL: TStringField
      FieldName = 'POL'
      Size = 1
    end
    object DokumentNATION: TIntegerField
      FieldName = 'NATION'
    end
    object DokumentOBRAZ: TIntegerField
      FieldName = 'OBRAZ'
    end
    object DokumentSEM: TIntegerField
      FieldName = 'SEM'
    end
    object DokumentSOATO: TStringField
      FieldName = 'SOATO'
      Size = 10
    end
    object DokumentADRES_ID: TIntegerField
      FieldName = 'ADRES_ID'
    end
    object DokumentADRES_NAME: TMemoField
      FieldName = 'ADRES_NAME'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentORGAN: TMemoField
      FieldName = 'ORGAN'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentSOATO_O: TStringField
      FieldName = 'SOATO_O'
      Size = 10
    end
    object DokumentGOSUD_O: TIntegerField
      FieldName = 'GOSUD_O'
    end
    object DokumentOBL_O: TStringField
      FieldName = 'OBL_O'
      Size = 30
    end
    object DokumentRAION_O: TStringField
      FieldName = 'RAION_O'
      Size = 30
    end
    object DokumentGOROD_O: TStringField
      FieldName = 'GOROD_O'
      Size = 30
    end
    object DokumentDATE_O: TDateField
      FieldName = 'DATE_O'
    end
    object DokumentGOD_PROG: TSmallintField
      FieldName = 'GOD_PROG'
    end
    object DokumentCEL: TIntegerField
      FieldName = 'CEL'
    end
    object DokumentSROK: TStringField
      FieldName = 'SROK'
    end
    object DokumentCONTANT: TIntegerField
      FieldName = 'CONTANT'
    end
    object DokumentISTOC: TIntegerField
      FieldName = 'ISTOC'
    end
    object DokumentDETI: TSmallintField
      FieldName = 'DETI'
    end
    object DokumentLICH_NOMER: TStringField
      FieldName = 'LICH_NOMER'
      Size = 14
    end
    object DokumentPASP_SERIA: TStringField
      FieldName = 'PASP_SERIA'
      Size = 5
    end
    object DokumentPASP_NOMER: TStringField
      FieldName = 'PASP_NOMER'
      Size = 10
    end
    object DokumentPASP_DATE: TDateField
      FieldName = 'PASP_DATE'
    end
    object DokumentDATE_SOST: TDateField
      FieldName = 'DATE_SOST'
    end
    object DokumentRUKOV: TStringField
      FieldName = 'RUKOV'
      Size = 50
    end
    object DokumentMEN_ID: TIntegerField
      FieldName = 'MEN_ID'
    end
    object DokumentLICH_ID: TIntegerField
      FieldName = 'LICH_ID'
    end
    object DokumentPROV: TBooleanField
      FieldName = 'PROV'
    end
    object DokumentWORK_NAME: TStringField
      FieldName = 'WORK_NAME'
      Size = 200
    end
    object DokumentDOLG_NAME: TStringField
      FieldName = 'DOLG_NAME'
      Size = 50
    end
    object DokumentSUPRUG: TBooleanField
      FieldName = 'SUPRUG'
    end
    object DokumentPASP_VIDAN: TStringField
      FieldName = 'PASP_VIDAN'
      Size = 200
    end
    object DokumentSOATO_V: TStringField
      FieldName = 'SOATO_V'
      Size = 10
    end
    object DokumentGOSUD_V: TIntegerField
      FieldName = 'GOSUD_V'
    end
    object DokumentOBL_V: TStringField
      FieldName = 'OBL_V'
      Size = 30
    end
    object DokumentRAION_V: TStringField
      FieldName = 'RAION_V'
      Size = 30
    end
    object DokumentGOROD_V: TStringField
      FieldName = 'GOROD_V'
      Size = 30
    end
    object DokumentNEW_ADRES_ID: TIntegerField
      FieldName = 'NEW_ADRES_ID'
    end
    object DokumentNEW_UL: TStringField
      FieldName = 'NEW_UL'
      Size = 30
    end
    object DokumentNEW_DOM: TStringField
      FieldName = 'NEW_DOM'
      Size = 7
    end
    object DokumentNEW_KORP: TStringField
      FieldName = 'NEW_KORP'
      Size = 7
    end
    object DokumentNEW_KV: TStringField
      FieldName = 'NEW_KV'
      Size = 7
    end
    object DokumentNEW_FIO: TStringField
      FieldName = 'NEW_FIO'
      Size = 60
    end
    object DokumentCITIZEN: TIntegerField
      FieldName = 'CITIZEN'
    end
    object DokumentDRUG_PRICH: TMemoField
      FieldName = 'DRUG_PRICH'
      BlobType = ftMemo
    end
    object DokumentWORK_DOLG_OLD: TMemoField
      FieldName = 'WORK_DOLG_OLD'
      BlobType = ftMemo
    end
    object DokumentGOSUD_B: TIntegerField
      FieldName = 'GOSUD_B'
    end
    object DokumentOBL_B: TStringField
      FieldName = 'OBL_B'
      Size = 30
    end
    object DokumentRAION_B: TStringField
      FieldName = 'RAION_B'
    end
    object DokumentGOROD_B: TStringField
      FieldName = 'GOROD_B'
    end
    object DokumentUL_B: TStringField
      FieldName = 'UL_B'
      Size = 30
    end
    object DokumentDOM_B: TStringField
      FieldName = 'DOM_B'
      Size = 7
    end
    object DokumentKORP_B: TStringField
      FieldName = 'KORP_B'
      Size = 7
    end
    object DokumentKV_B: TStringField
      FieldName = 'KV_B'
      Size = 7
    end
    object DokumentPASP_UDOST: TSmallintField
      FieldName = 'PASP_UDOST'
    end
    object DokumentGOROD_R_B: TSmallintField
      FieldName = 'GOROD_R_B'
    end
    object DokumentGOROD_O_B: TSmallintField
      FieldName = 'GOROD_O_B'
    end
    object DokumentGOROD_V_B: TSmallintField
      FieldName = 'GOROD_V_B'
    end
    object DokumentGOROD_B_B: TSmallintField
      FieldName = 'GOROD_B_B'
    end
    object DokumentB_OBL_R: TBooleanField
      FieldName = 'B_OBL_R'
    end
    object DokumentB_OBL_O: TBooleanField
      FieldName = 'B_OBL_O'
    end
    object DokumentB_OBL_V: TBooleanField
      FieldName = 'B_OBL_V'
    end
    object DokumentDATE_SROK: TDateField
      FieldName = 'DATE_SROK'
    end
    object DokumentSMERT: TBooleanField
      FieldName = 'SMERT'
    end
    object DokumentDATE_SMERT: TDateField
      FieldName = 'DATE_SMERT'
    end
    object DokumentAKT_SMERT: TMemoField
      FieldName = 'AKT_SMERT'
      BlobType = ftMemo
    end
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 496
    Top = 114
  end
  inherited dsGorod: TDataSource
    Left = 624
  end
  inherited dsRnGor: TDataSource
    Left = 624
    Top = 170
  end
  inherited dsVoenkom: TDataSource
    Top = 146
  end
  inherited dsRovd: TDataSource
    Left = 616
    Top = 98
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 256
    Top = 90
  end
  inherited tbReshSud: TkbmMemTable
    Left = 656
    Top = 282
  end
  object dsStran: TDataSource
    DataSet = dmBase.SprStran
    Left = 452
    Top = 9
  end
  object dsNation: TDataSource
    DataSet = dmBase.SprNac
    Left = 492
    Top = 9
  end
  object dsDeti: TDataSource
    DataSet = mtDeti
    OnDataChange = dsDetiDataChange
    Left = 604
    Top = 49
  end
  object mtDeti: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.52'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 552
    Top = 98
    object mtDetiFAMILIA: TStringField
      FieldName = 'FAMILIA'
      Size = 30
    end
    object mtDetiNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object mtDetiOTCH: TStringField
      FieldName = 'OTCH'
      Size = 30
    end
    object mtDetiPOL: TStringField
      FieldName = 'POL'
      Size = 1
    end
    object mtDetiDATER: TDateField
      FieldName = 'DATER'
    end
    object mtDetiCHILD_ID: TIntegerField
      FieldName = 'CHILD_ID'
    end
  end
  object dsCel: TDataSource
    DataSet = dmBase.SprTypeMigr
    Left = 524
    Top = 1
  end
  object dsIst: TDataSource
    DataSet = dmBase.SprIst
    Left = 404
    Top = 9
  end
  object dsGrag: TDataSource
    DataSet = dmBase.LookUpCitizen
    Left = 412
    Top = 41
  end
  object frDBDeti: TfrDBDataSet
    DataSet = mtDeti
    Left = 436
    Top = 153
  end
end
