inherited fmZapisUstMat: TfmZapisUstMat
  Left = 456
  Top = 133
  Caption = #1047#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086#1073' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1080' '#1084#1072#1090#1077#1088#1080#1085#1089#1090#1074#1072
  ClientHeight = 637
  ClientWidth = 825
  Constraints.MinWidth = 787
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000C
    CCEDFDFDD0000000CCD000FD00000000000887000000000007FFF70000000000
    07FF700000000000300FF88700000000000FFF700000003000F7FFFF00000000
    00FFFFFF80000030000087C70000003030300888000000003000000000000000
    000000300000000000303000000000000000000000000000000000000000C003
    0000E0070000F00F0000F81F0000F80F0000F0070000E0070000C0070000C003
    0000C0070000C0070000E0070000E0070000F00F0000FC3F0000FFFF0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 615
    Width = 825
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited pnTable: TPanel
    Top = 615
    Width = 825
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 825
    inherited TBToolbar: TTBToolbar
      object TBSubmenuGISUN: TTBSubmenuItem [5]
        Caption = #1042#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1077' '#1089' '#1043#1048#1057' '#1056#1053
        ImageIndex = 5
        Images = ImGISUN
        object TBItemStep1: TTBItem
          Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
          OnClick = TBItemStep1Click
        end
        object TBItemStep2: TTBItem
          Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1072#1082#1090#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
          OnClick = TBItemStep2Click
        end
      end
      object TBItemClearLich: TTBItem [9]
        Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100
        Hint = #1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1083#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090' '#1086#1090' '#1072#1082#1090#1072' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080
        ImageIndex = 34
        Visible = False
        OnClick = TBItemClearLichClick
      end
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      inherited TBItemShablon: TTBItem
        Visible = True
      end
      inherited TBItemEditMemo: TTBItem
        Visible = True
      end
      inherited TBItemSvidIspor: TTBItem
        Visible = True
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 821
        Top = 22
      end
    end
  end
  inherited sb: TScrollBox
    Width = 825
    Height = 565
    Align = alClient
    inherited pnPovtor: TPanel
      Left = 432
      Top = 184
      Width = 105
      TabOrder = 2
      inherited imBE: TImage
        Left = 75
        Anchors = [akTop]
      end
    end
    inherited N_F_edTypeEkz: TComboBox
      TabOrder = 3
    end
    object pc: TPageControl
      Left = 0
      Top = 34
      Width = 825
      Height = 531
      ActivePage = tsFaser
      Align = alClient
      TabOrder = 1
      OnChange = pcChange
      object tsChild: TTabSheet
        Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1088#1077#1073#1077#1085#1082#1077
        DesignSize = (
          817
          503)
        object Label4: TLabel
          Left = 12
          Top = 114
          Width = 35
          Height = 13
          Caption = '4. '#1055#1086#1083
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 229
          Top = 114
          Width = 108
          Height = 13
          Caption = '5. '#1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 12
          Top = 33
          Width = 63
          Height = 13
          Caption = '1. '#1060#1072#1084#1080#1083#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 12
          Top = 60
          Width = 36
          Height = 13
          Caption = '2. '#1048#1084#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 12
          Top = 87
          Width = 69
          Height = 13
          Caption = '3. '#1054#1090#1095#1077#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 172
          Top = 8
          Width = 181
          Height = 13
          Caption = #1044#1086' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103' '#1084#1072#1090#1077#1088#1080#1085#1089#1090#1074#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 483
          Top = 8
          Width = 199
          Height = 13
          Caption = #1055#1086#1089#1083#1077' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103' '#1084#1072#1090#1077#1088#1080#1085#1089#1090#1074#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 5
          Top = 290
          Width = 334
          Height = 13
          Caption = '18. '#1054#1089#1085#1086#1074#1072#1085#1080#1077' '#1079#1072#1087#1080#1089#1080' '#1072#1082#1090#1072' '#1086#1073' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1080' '#1084#1072#1090#1077#1088#1080#1085#1089#1090#1074#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 20
          Top = 345
          Width = 181
          Height = 13
          Caption = #1056#1077#1096#1077#1085#1080#1077' '#1089#1091#1076#1072' ('#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1091#1076#1072')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbOsnov: TLabel
          Left = 20
          Top = 318
          Width = 86
          Height = 13
          Caption = #1056#1077#1096#1077#1085#1080#1077' '#1089#1091#1076#1072' '#1086#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbIDENTIF: TLabel
          Left = 508
          Top = 114
          Width = 80
          Height = 13
          Caption = #1048#1076#1077#1085#1090'. '#1085#1086#1084#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edDateR: TDBDateTimeEditEh
          Left = 349
          Top = 107
          Width = 105
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
          TabOrder = 7
          Visible = True
          EditFormat = 'DD/MM/YYYY      '
        end
        object edPol: TDBComboBoxEh
          Left = 64
          Top = 107
          Width = 109
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
          TabOrder = 6
          Visible = True
        end
        object edFamiliaDo: TDBEditEh
          Left = 101
          Top = 26
          Width = 139
          Height = 26
          HelpContext = 888
          DataField = 'FamiliaDo'
          DataSource = dsDokument
          EditButtons = <
            item
              Style = ebsGlyphEh
              Width = 16
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
        object edNameDo: TDBEditEh
          Left = 101
          Top = 53
          Width = 139
          Height = 26
          DataField = 'NameDo'
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
        object edOtchDo: TDBEditEh
          Left = 101
          Top = 80
          Width = 139
          Height = 26
          DataField = 'OtchDo'
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
        object edFamiliaPosle: TDBEditEh
          Left = 432
          Top = 26
          Width = 139
          Height = 26
          HelpContext = 888
          DataField = 'FamiliaPosle'
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
        object edNamePosle: TDBEditEh
          Left = 432
          Top = 53
          Width = 139
          Height = 26
          DataField = 'NamePosle'
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
        object edOtchPosle: TDBEditEh
          Left = 432
          Top = 80
          Width = 139
          Height = 26
          DataField = 'OtchPosle'
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
        object gbMestoReg: TGroupBox
          Left = 1
          Top = 220
          Width = 813
          Height = 54
          Anchors = [akLeft, akTop, akRight]
          Caption = ' 7. '#1052#1077#1089#1090#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          object Label26: TLabel
            Left = 9
            Top = 28
            Width = 13
            Height = 13
            Caption = #8470
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 95
            Top = 28
            Width = 12
            Height = 13
            Caption = #1086#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edMestoNomer: TDBEditEh
            Left = 25
            Top = 21
            Width = 48
            Height = 26
            DataField = 'MestoNomer'
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
          object edMesto: TDBEditEh
            Left = 262
            Top = 21
            Width = 495
            Height = 26
            DataField = 'Mesto'
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
          object edMestoDate: TDBDateTimeEditEh
            Left = 114
            Top = 21
            Width = 121
            Height = 26
            DataField = 'MestoDate'
            DataSource = dsDokument
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
        end
        object gbMestoRogd: TGroupBox
          Left = 2
          Top = 140
          Width = 811
          Height = 79
          Anchors = [akLeft, akTop, akRight]
          Caption = ' 6. '#1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          object Label29: TLabel
            Left = 12
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
          object Label30: TLabel
            Left = 407
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
          object Label33: TLabel
            Left = 12
            Top = 48
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
          object Label34: TLabel
            Left = 407
            Top = 48
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
          object edGOSUD: TDBLookupComboboxEh
            Left = 163
            Top = 18
            Width = 217
            Height = 26
            DataField = 'GOSUD'
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
          object edGOROD: TDBEditEh
            Left = 574
            Top = 45
            Width = 147
            Height = 26
            HelpKeyword = '<FULL>'
            DataField = 'GOROD'
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
          object edB_OBL: TDBCheckBoxEh
            Left = 501
            Top = 19
            Width = 15
            Height = 17
            AllowGrayed = True
            DataField = 'B_OBL'
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
          object edB_GOROD: TDBLookupComboboxEh
            Left = 522
            Top = 45
            Width = 44
            Height = 26
            Alignment = taRightJustify
            DataField = 'B_GOROD'
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
          object edRaion: TDBEditEh
            Left = 163
            Top = 45
            Width = 217
            Height = 26
            DataField = 'RAION'
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
          object edOBL: TDBEditEh
            Left = 522
            Top = 18
            Width = 199
            Height = 26
            Alignment = taLeftJustify
            DataField = 'OBL'
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
        object edOsnov: TDBComboBoxEh
          Left = 369
          Top = 283
          Width = 296
          Height = 26
          DataField = 'OSNOV'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          Visible = True
          OnChange = edOsnovChange
        end
        object edReshSud: TDBEditEh
          Left = 247
          Top = 338
          Width = 496
          Height = 26
          HelpContext = 999
          DataField = 'ReshSud'
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
        object edDateDecl: TDBDateTimeEditEh
          Left = 247
          Top = 311
          Width = 112
          Height = 26
          DataField = 'DateDecl'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 12
          Visible = True
        end
        object N_F_cbBelorus: TDBCheckBoxEh
          Left = 765
          Top = 0
          Width = 47
          Height = 17
          Anchors = [akTop, akRight]
          Caption = #1073#1077#1083
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbGrayed
          TabOrder = 14
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = N_F_cbBelorusClick
        end
        object ENG_edIDENTIF: TDBEditEh
          Left = 600
          Top = 107
          Width = 155
          Height = 26
          CharCase = ecUpperCase
          DataField = 'IDENTIF'
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
        object BLR_edFamiliaDo: TDBEditEh
          Left = 257
          Top = 26
          Width = 139
          Height = 26
          DataField = 'FamiliaDo_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          Visible = True
        end
        object BLR_edNameDo: TDBEditEh
          Left = 257
          Top = 53
          Width = 139
          Height = 26
          DataField = 'NameDo_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
          Visible = True
        end
        object BLR_edOtchDo: TDBEditEh
          Left = 257
          Top = 80
          Width = 139
          Height = 26
          DataField = 'OtchDo_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          Visible = True
        end
        object BLR_edFamiliaPosle: TDBEditEh
          Left = 590
          Top = 26
          Width = 139
          Height = 26
          HelpContext = 888
          DataField = 'FamiliaPosle_B'
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
        object BLR_edNamePosle: TDBEditEh
          Left = 590
          Top = 53
          Width = 139
          Height = 26
          DataField = 'NamePosle_B'
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
        end
        object BLR_edOtchPosle: TDBEditEh
          Left = 590
          Top = 80
          Width = 139
          Height = 26
          HelpType = htKeyword
          HelpContext = 999
          DataField = 'OtchPosle_B'
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
      end
      object tsFaser: TTabSheet
        Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1088#1086#1076#1080#1090#1077#1083#1103#1093
        ImageIndex = 1
        DesignSize = (
          817
          503)
        object Label9: TLabel
          Left = 7
          Top = 23
          Width = 66
          Height = 13
          Caption = '8. '#1060#1072#1084#1080#1083#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label10: TLabel
          Left = 314
          Top = -1
          Width = 30
          Height = 13
          Caption = #1054#1090#1077#1094
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 7
          Top = 50
          Width = 36
          Height = 13
          Caption = '9. '#1048#1084#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 7
          Top = 77
          Width = 76
          Height = 13
          Caption = '10. '#1054#1090#1095#1077#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 7
          Top = 131
          Width = 115
          Height = 13
          Caption = '12. '#1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 7
          Top = 273
          Width = 118
          Height = 13
          Caption = '14. '#1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 7
          Top = 300
          Width = 101
          Height = 13
          Caption = '15. '#1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 639
          Top = -2
          Width = 31
          Height = 13
          Caption = #1052#1072#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 7
          Top = 150
          Width = 121
          Height = 13
          Caption = '13. '#1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 16
          Top = 165
          Width = 134
          Height = 13
          Caption = #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072' ('#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1086')'
        end
        object Label39: TLabel
          Left = 74
          Top = 192
          Width = 76
          Height = 13
          Caption = #1086#1073#1083#1072#1089#1090#1100' ('#1082#1088#1072#1081')'
        end
        object Label41: TLabel
          Left = 118
          Top = 219
          Width = 30
          Height = 13
          Caption = #1088#1072#1081#1086#1085
        end
        object Label42: TLabel
          Left = 68
          Top = 246
          Width = 82
          Height = 13
          Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077')'
        end
        object Label43: TLabel
          Left = 7
          Top = 104
          Width = 100
          Height = 13
          Caption = '11. '#1048#1076#1077#1085#1090'. '#1085#1086#1084#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edON_Familia: TDBEditEh
          Left = 182
          Top = 16
          Width = 145
          Height = 26
          HelpContext = 888
          DataField = 'ON_Familia'
          DataSource = dsDokument
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
              Width = 20
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = True
          OnCheckDrawRequiredState = edFamiliaDoCheckDrawRequiredState
        end
        object edON_Name: TDBEditEh
          Left = 182
          Top = 43
          Width = 145
          Height = 26
          DataField = 'ON_Name'
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
          OnCheckDrawRequiredState = edFamiliaDoCheckDrawRequiredState
        end
        object edON_OTCH: TDBEditEh
          Left = 182
          Top = 70
          Width = 145
          Height = 26
          DataField = 'ON_Otch'
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
          OnCheckDrawRequiredState = edFamiliaDoCheckDrawRequiredState
        end
        object edON_DATER: TDBDateTimeEditEh
          Left = 182
          Top = 124
          Width = 125
          Height = 26
          DataField = 'ON_DateR'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 4
          Visible = True
        end
        object edON_NATION: TDBLookupComboboxEh
          Left = 182
          Top = 266
          Width = 241
          Height = 26
          DataField = 'ON_NATION'
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
          TabOrder = 10
          Visible = True
        end
        object edON_GRAG: TDBLookupComboboxEh
          Left = 182
          Top = 293
          Width = 241
          Height = 26
          DataField = 'ON_GRAG'
          DataSource = dsDokument
          DropDownBox.Width = 300
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'GNAME'
          ListSource = dsGragd
          ParentFont = False
          TabOrder = 11
          Visible = True
        end
        object edONA_Familia: TDBEditEh
          Left = 501
          Top = 16
          Width = 145
          Height = 26
          DataField = 'ONA_Familia'
          DataSource = dsDokument
          EditButtons = <
            item
              Style = ebsGlyphEh
              Width = 20
            end
            item
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDDDDDDDDDDDDDDDDDD00000000000DDDDD09999999990DDDDD0999999999
                0DDDDD09999F99990DDDDDD0999F9990DDDDDDDD00FFF00DDDDDDDDDDD000DDD
                DDDDDDDDD07770DDDDDDDDDDD07770DDDDDDDDDDD07770DDDDDDDDDDD00000DD
                DDDDDDDDDD000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
              Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1082#1090#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080
              Style = ebsGlyphEh
              Visible = False
              Width = 20
              OnClick = edONA_FamiliaEditButtons1Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          Visible = True
          OnCheckDrawRequiredState = edFamiliaDoCheckDrawRequiredState
        end
        object edONA_Name: TDBEditEh
          Left = 501
          Top = 43
          Width = 145
          Height = 26
          DataField = 'ONA_Name'
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
          OnCheckDrawRequiredState = edFamiliaDoCheckDrawRequiredState
        end
        object edONA_OTCH: TDBEditEh
          Left = 501
          Top = 70
          Width = 145
          Height = 26
          DataField = 'ONA_Otch'
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
          OnCheckDrawRequiredState = edFamiliaDoCheckDrawRequiredState
        end
        object edONA_DATER: TDBDateTimeEditEh
          Left = 501
          Top = 124
          Width = 125
          Height = 26
          DataField = 'ONA_DateR'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 16
          Visible = True
        end
        object edONA_NATION: TDBLookupComboboxEh
          Left = 501
          Top = 266
          Width = 241
          Height = 26
          DataField = 'ONA_NATION'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME_G'
          ListSource = dsNation
          ParentFont = False
          TabOrder = 22
          Visible = True
        end
        object edONA_GRAG: TDBLookupComboboxEh
          Left = 501
          Top = 293
          Width = 241
          Height = 26
          DataField = 'ONA_GRAG'
          DataSource = dsDokument
          DropDownBox.Width = 300
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'GNAME'
          ListSource = dsGragd
          ParentFont = False
          TabOrder = 23
          Visible = True
        end
        object btAktRogd: TBitBtn
          Left = 742
          Top = 112
          Width = 65
          Height = 27
          Caption = #1072'\'#1079' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080
          TabOrder = 27
          TabStop = False
          Visible = False
          OnClick = btAktRogdClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDD00000000000DDDDD09999999990DDDDD0999999999
            0DDDDD09999F99990DDDDDD0999F9990DDDDDDDD00FFF00DDDDDDDDDDD000DDD
            DDDDDDDDD07770DDDDDDDDDDD07770DDDDDDDDDDD07770DDDDDDDDDDD00000DD
            DDDDDDDDDD000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
        end
        object btPadeg: TButton
          Left = 719
          Top = 47
          Width = 58
          Height = 21
          Caption = #1074' '#1087#1072#1076#1077#1078#1077
          TabOrder = 26
          TabStop = False
          Visible = False
          OnClick = btPadegClick
        end
        object edON_M_B_OBL: TDBCheckBoxEh
          Left = 164
          Top = 190
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ON_M_B_OBL'
          DataSource = dsDokument
          TabOrder = 28
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edON_M_GOSUD: TDBLookupComboboxEh
          Left = 182
          Top = 158
          Width = 241
          Height = 26
          DataField = 'ON_M_GOSUD'
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
          TabOrder = 5
          Visible = True
        end
        object edON_M_B_GOROD: TDBLookupComboboxEh
          Left = 182
          Top = 239
          Width = 67
          Height = 26
          Alignment = taRightJustify
          DataField = 'ON_M_B_GOROD'
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
          TabOrder = 8
          Visible = True
        end
        object edON_M_GOROD: TDBEditEh
          Left = 271
          Top = 239
          Width = 152
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'ON_M_GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          Visible = True
        end
        object edONA_M_B_OBL: TDBCheckBoxEh
          Left = 481
          Top = 190
          Width = 15
          Height = 17
          AllowGrayed = True
          DataField = 'ONA_M_B_OBL'
          DataSource = dsDokument
          TabOrder = 29
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edONA_M_GOSUD: TDBLookupComboboxEh
          Left = 501
          Top = 158
          Width = 241
          Height = 26
          DataField = 'ONA_M_GOSUD'
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
          TabOrder = 17
          Visible = True
        end
        object edONA_M_B_GOROD: TDBLookupComboboxEh
          Left = 501
          Top = 239
          Width = 67
          Height = 26
          Alignment = taRightJustify
          DataField = 'ONA_M_B_GOROD'
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
          TabOrder = 20
          Visible = True
        end
        object edONA_M_GOROD: TDBEditEh
          Left = 590
          Top = 239
          Width = 152
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'ONA_M_GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 21
          Visible = True
        end
        object ENG_edON_IDENTIF: TDBEditEh
          Left = 182
          Top = 97
          Width = 145
          Height = 26
          CharCase = ecUpperCase
          DataField = 'ON_IDENTIF'
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
        object ENG_edONA_IDENTIF: TDBEditEh
          Left = 501
          Top = 97
          Width = 145
          Height = 26
          CharCase = ecUpperCase
          DataField = 'ONA_IDENTIF'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          Visible = True
        end
        object gbGit: TGroupBox
          Left = 1
          Top = 320
          Width = 815
          Height = 99
          Anchors = [akLeft, akTop, akRight]
          Caption = '16. '#1052#1077#1089#1090#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072' '#1084#1072#1090#1077#1088#1080' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 24
          object Label16: TLabel
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
          object Label17: TLabel
            Left = 435
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
          object Label18: TLabel
            Left = 14
            Top = 48
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
          object Label19: TLabel
            Left = 314
            Top = 48
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
          object Label53: TLabel
            Left = 14
            Top = 75
            Width = 121
            Height = 13
            Caption = #1088'-'#1086#1085'  '#1075#1086#1088'., '#1091#1083'., '#1076#1086#1084', '#1082#1074'.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edONA_GOSUD: TDBLookupComboboxEh
            Left = 192
            Top = 14
            Width = 200
            Height = 26
            DataField = 'ONA_GOSUD'
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
          object edONA_GOROD: TDBEditEh
            Left = 474
            Top = 41
            Width = 170
            Height = 26
            HelpKeyword = '<FULL>'
            DataField = 'ONA_GOROD'
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
          object edONA_B_OBL: TDBCheckBoxEh
            Left = 523
            Top = 19
            Width = 15
            Height = 17
            AllowGrayed = True
            DataField = 'ONA_B_OBL'
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
          object edONA_GOROD_R: TDBEditEh
            Left = 137
            Top = 68
            Width = 304
            Height = 26
            DataField = 'ONA_GOROD_R'
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
          object edONA_B_GOROD: TDBLookupComboboxEh
            Left = 402
            Top = 41
            Width = 62
            Height = 26
            Alignment = taRightJustify
            DataField = 'ONA_B_GOROD'
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
          object edONA_OBL: TDBEditEh
            Left = 546
            Top = 14
            Width = 200
            Height = 26
            Alignment = taLeftJustify
            DataField = 'ONA_OBL'
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
          object edONA_RAION: TDBEditEh
            Left = 57
            Top = 41
            Width = 200
            Height = 26
            Alignment = taLeftJustify
            DataField = 'ONA_RAION'
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
        object gbDok: TGroupBox
          Left = 1
          Top = 422
          Width = 814
          Height = 81
          Anchors = [akLeft, akTop, akRight]
          Caption = '17. '#1044#1086#1082#1091#1084#1077#1085#1090' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1080#1081' '#1083#1080#1095#1085#1086#1089#1090#1100' '#1079#1072#1103#1074#1080#1090#1077#1083#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 25
          object Label69: TLabel
            Left = 554
            Top = 30
            Width = 12
            Height = 13
            Caption = #1086#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label15: TLabel
            Left = 21
            Top = 57
            Width = 29
            Height = 13
            Caption = #1086#1088#1075#1072#1085
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edON_DOKUMENT: TDBEditEh
            Left = 62
            Top = 50
            Width = 429
            Height = 26
            HelpContext = 999
            DataField = 'ON_DOKUMENT'
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
          object edON_DOK_TYPE: TDBComboBoxEh
            Left = 21
            Top = 23
            Width = 334
            Height = 26
            DataField = 'ON_DOK_TYPE'
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
          object edON_DOK_SERIA: TDBEditEh
            Left = 384
            Top = 23
            Width = 41
            Height = 26
            CharCase = ecUpperCase
            DataField = 'ON_DOK_SERIA'
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
          object edON_DOK_NOMER: TDBEditEh
            Left = 436
            Top = 23
            Width = 107
            Height = 26
            DataField = 'ON_DOK_NOMER'
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
          object edON_DOK_DATE: TDBDateTimeEditEh
            Left = 575
            Top = 23
            Width = 120
            Height = 26
            DataField = 'ON_DOK_DATE'
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
        end
        object edON_M_OBL: TDBEditEh
          Left = 182
          Top = 185
          Width = 241
          Height = 26
          Alignment = taLeftJustify
          DataField = 'ON_M_OBL'
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
        object edON_M_RAION: TDBEditEh
          Left = 182
          Top = 212
          Width = 241
          Height = 26
          Alignment = taLeftJustify
          DataField = 'ON_M_RAION'
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
        object edONA_M_OBL: TDBEditEh
          Left = 501
          Top = 185
          Width = 241
          Height = 26
          Alignment = taLeftJustify
          DataField = 'ONA_M_OBL'
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
        object edONA_M_RAION: TDBEditEh
          Left = 501
          Top = 212
          Width = 241
          Height = 26
          Alignment = taLeftJustify
          DataField = 'ONA_M_RAION'
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
        end
        object BLR_edON_Familia: TDBEditEh
          Left = 337
          Top = 16
          Width = 145
          Height = 26
          DataField = 'ON_Familia_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 30
          Visible = True
        end
        object BLR_edON_Name: TDBEditEh
          Left = 337
          Top = 43
          Width = 145
          Height = 26
          DataField = 'ON_Name_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 31
          Visible = True
        end
        object BLR_edON_Otch: TDBEditEh
          Left = 337
          Top = 70
          Width = 145
          Height = 26
          DataField = 'ON_Otch_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 32
          Visible = True
        end
        object BLR_edONA_Familia: TDBEditEh
          Left = 656
          Top = 16
          Width = 145
          Height = 26
          DataField = 'ONA_Familia_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 33
          Visible = True
        end
        object BLR_edONA_Name: TDBEditEh
          Left = 656
          Top = 43
          Width = 145
          Height = 26
          DataField = 'ONA_Name_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 34
          Visible = True
        end
        object BLR_edONA_Otch: TDBEditEh
          Left = 656
          Top = 70
          Width = 145
          Height = 26
          HelpType = htKeyword
          HelpContext = 999
          DataField = 'ONA_Otch_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 35
          Visible = True
        end
      end
      object TabSheet1: TTabSheet
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
        ImageIndex = 2
        DesignSize = (
          817
          503)
        object Label58: TLabel
          Left = 8
          Top = 162
          Width = 93
          Height = 13
          Caption = #1044#1088#1091#1075#1080#1077' '#1076#1072#1085#1085#1099#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Label59: TLabel
          Left = 8
          Top = 140
          Width = 63
          Height = 13
          Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 8
          Top = 29
          Width = 70
          Height = 13
          Caption = '20. '#1054#1090#1084#1077#1090#1082#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 8
          Top = 268
          Width = 65
          Height = 13
          Caption = #1048#1079#1074#1077#1097#1077#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 184
          Top = 297
          Width = 147
          Height = 13
          Caption = #1043#1076#1077' '#1080' '#1082#1077#1084' '#1088#1072#1073#1086#1090#1072#1077#1090' '#1086#1090#1077#1094
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Label36: TLabel
          Left = 184
          Top = 323
          Width = 108
          Height = 13
          Caption = #1054#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077' '#1086#1090#1094#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object lbDolgRuk: TvchDBText
          Left = 4
          Top = 86
          Width = 569
          Height = 17
          Alignment = taRightJustify
          Anchors = [akLeft, akTop, akRight]
          DataField = 'RUKOV_D'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbDolgSpec: TvchDBText
          Left = 4
          Top = 114
          Width = 569
          Height = 17
          Alignment = taRightJustify
          Anchors = [akLeft, akTop, akRight]
          DataField = 'SPEC_D'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edOther: TDBEditEh
          Left = 56
          Top = 162
          Width = 58
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          DataField = 'OTHER'
          DataSource = dsDokument
          EditButtons = <>
          Flat = True
          TabOrder = 5
          Visible = False
          WantReturns = True
          OnDblClick = TBItemEditMemoClick
        end
        object edIzmen: TDBEditEh
          Left = 176
          Top = 139
          Width = 635
          Height = 116
          Anchors = [akLeft, akTop, akRight]
          AutoSelect = False
          AutoSize = False
          DataField = 'IZMEN'
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
          WantReturns = True
          OnDblClick = TBItemEditMemoClick
        end
        object edZametka: TDBEditEh
          Left = 176
          Top = 29
          Width = 635
          Height = 46
          HelpContext = 888
          Anchors = [akLeft, akTop, akRight]
          AutoSelect = False
          AutoSize = False
          DataField = 'Zametka'
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
          WantReturns = True
          OnDblClick = TBItemEditMemoClick
        end
        object edRukov: TDBEditEh
          Left = 582
          Top = 81
          Width = 229
          Height = 26
          Anchors = [akTop, akRight]
          DataField = 'RUKOV'
          DataSource = dsDokument
          EditButtons = <
            item
              Hint = #1042#1099#1073#1088#1072#1090#1100
              Style = ebsEllipsisEh
              OnClick = edRukovEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = True
          OnCheckDrawRequiredState = edFamiliaDoCheckDrawRequiredState
          OnEnter = edRukovEnter
        end
        object edSPEC: TDBEditEh
          Left = 582
          Top = 109
          Width = 229
          Height = 26
          Anchors = [akTop, akRight]
          DataField = 'SPEC'
          DataSource = dsDokument
          EditButtons = <
            item
              Hint = #1042#1099#1073#1088#1072#1090#1100
              Style = ebsEllipsisEh
              OnClick = edSPECEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Visible = True
          OnCheckDrawRequiredState = edFamiliaDoCheckDrawRequiredState
          OnEnter = edSPECEnter
        end
        object edCopy: TDBCheckBoxEh
          Left = 8
          Top = 300
          Width = 75
          Height = 17
          Caption = #1050#1086#1087#1080#1103
          DataField = 'COPIA'
          DataSource = dsDokument
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 7
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object cbPovtor: TDBCheckBoxEh
          Left = 8
          Top = 322
          Width = 99
          Height = 13
          Caption = #1055#1086#1074#1090#1086#1088#1085#1086#1077
          DataField = 'POVTOR'
          DataSource = dsDokument
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 8
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edIzvNomer: TDBEditEh
          Left = 176
          Top = 264
          Width = 65
          Height = 26
          DataField = 'IZV_NOMER'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          Visible = True
        end
        object edIzvDate: TDBDateTimeEditEh
          Left = 257
          Top = 265
          Width = 95
          Height = 26
          DataField = 'IZV_DATE'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 10
          Visible = True
        end
        object Button1: TButton
          Left = 150
          Top = 55
          Width = 17
          Height = 17
          Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100
          Caption = '#'
          TabOrder = 11
          OnClick = Button1Click
        end
        object edIzvech: TDBEditEh
          Left = 368
          Top = 265
          Width = 417
          Height = 26
          HelpContext = 999
          DataField = 'AdresIzvech'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          Visible = True
          OnEnter = edIzvechEnter
        end
        object edON_OBRAZ: TDBComboBoxEh
          Left = 352
          Top = 320
          Width = 195
          Height = 26
          HelpContext = 999
          DataField = 'ON_OBRAZ'
          DataSource = dsDokument
          DropDownBox.Rows = 8
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = False
        end
        object edON_WORK: TDBEditEh
          Left = 352
          Top = 294
          Width = 432
          Height = 26
          DataField = 'ON_WORK'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = False
        end
      end
      object tsPovtor: TTabSheet
        Caption = #1055#1086#1074#1090#1086#1088#1085#1099#1077' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072
        ImageIndex = 3
      end
    end
    object pn: TPanel
      Left = 0
      Top = 0
      Width = 825
      Height = 34
      Align = alTop
      TabOrder = 0
      DesignSize = (
        825
        34)
      object Label7: TLabel
        Left = 8
        Top = 11
        Width = 37
        Height = 13
        Caption = #1053#1086#1084#1077#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 109
        Top = 11
        Width = 31
        Height = 13
        Caption = #1044#1072#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label40: TLabel
        Left = 249
        Top = 11
        Width = 91
        Height = 13
        Caption = 'C'#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label55: TLabel
        Left = 416
        Top = 9
        Width = 15
        Height = 16
        Caption = #8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 515
        Top = 11
        Width = 12
        Height = 13
        Caption = #1086#1090
      end
      object ImageGISUN: TImage
        Left = 796
        Top = 5
        Width = 20
        Height = 20
        Anchors = [akTop, akRight]
        Transparent = True
      end
      object edNomer: TDBEditEh
        Left = 54
        Top = 4
        Width = 40
        Height = 26
        HelpContext = 888
        DataField = 'NOMER'
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
      object edDateZ: TDBDateTimeEditEh
        Left = 146
        Top = 4
        Width = 100
        Height = 26
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
        TabOrder = 1
        Visible = True
      end
      object edSvid_Nomer: TDBEditEh
        Left = 437
        Top = 4
        Width = 68
        Height = 26
        DataField = 'SVID_NOMER'
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
      object N_F_1: TDBCheckBoxEh
        Left = 650
        Top = 6
        Width = 111
        Height = 17
        Caption = '1-'#1099#1081' '#1101#1082#1079#1077#1084#1087#1083#1103#1088
        DataField = 'First_Ekz'
        DataSource = dsDokument
        TabOrder = 5
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object edDateSV: TDBDateTimeEditEh
        Left = 535
        Top = 4
        Width = 100
        Height = 26
        DataField = 'DATESV'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 4
        Visible = True
      end
      object cbProvDvig: TDBCheckBoxEh
        Left = 767
        Top = 6
        Width = 25
        Height = 17
        Caption = #1055#1088#1086#1074#1086#1076#1080#1090#1100
        State = cbGrayed
        TabOrder = 6
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object edSVID_SERIA: TDBLookupComboboxEh
        Left = 348
        Top = 4
        Width = 63
        Height = 26
        DataField = 'SVID_SERIA'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'SERIA'
        ListField = 'SERIA'
        ListSource = dsSeria
        ParentFont = False
        TabOrder = 2
        Visible = True
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 615
    Width = 825
  end
  inherited pnAdd: TPanel
    Width = 825
  end
  inherited dsDokument: TDataSource
    Left = 352
    Top = 234
  end
  object dsNation: TDataSource [7]
    DataSet = dmBase.SprNac
    Left = 676
    Top = 433
  end
  object dsStran: TDataSource [8]
    DataSet = dmBase.SprStran
    Left = 676
    Top = 401
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
        Name = 'NOMER'
        DataType = ftInteger
      end
      item
        Name = 'DATEZ'
        DataType = ftDate
      end
      item
        Name = 'SVID_SERIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SVID_NOMER'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FamiliaDo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'OtchDo'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NameDo'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DateR'
        DataType = ftDate
      end
      item
        Name = 'GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'POL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ON_ID'
        DataType = ftInteger
      end
      item
        Name = 'ON_Familia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ON_Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_Otch'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_DateR'
        DataType = ftDate
      end
      item
        Name = 'ON_NATION'
        DataType = ftInteger
      end
      item
        Name = 'ON_GRAG'
        DataType = ftInteger
      end
      item
        Name = 'ON_SOATO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ON_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'ON_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_GOROD_R'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ON_DOKUMENT'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ON_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'ON_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'ONA_ID'
        DataType = ftInteger
      end
      item
        Name = 'ONA_Familia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Otch'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_DateR'
        DataType = ftDate
      end
      item
        Name = 'ONA_NATION'
        DataType = ftInteger
      end
      item
        Name = 'ONA_GRAG'
        DataType = ftInteger
      end
      item
        Name = 'ONA_SOATO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ONA_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'ONA_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_GOROD_R'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_DOKUMENT'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ONA_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'ONA_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'RUKOV'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'First_Ekz'
        DataType = ftBoolean
      end
      item
        Name = 'LICH_ID'
        DataType = ftInteger
      end
      item
        Name = 'CHILD_ID'
        DataType = ftInteger
      end
      item
        Name = 'Mesto'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'MestoDate'
        DataType = ftDate
      end
      item
        Name = 'MestoNomer'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'FamiliaPosle'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NamePosle'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OtchPosle'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ReshSud'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DateDecl'
        DataType = ftDate
      end
      item
        Name = 'Osnov'
        DataType = ftInteger
      end
      item
        Name = 'SPEC'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ID_ZAGS'
        DataType = ftInteger
      end
      item
        Name = 'FamiliaDo_B'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NameDo_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OtchDo_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FamiliaPosle_B'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NamePosle_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OtchPosle_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_Familia_B'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ON_Name_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_Otch_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Familia_B'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_Name_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Otch_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Rukov_B'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DATESV'
        DataType = ftDate
      end
      item
        Name = 'Familia_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Name_P'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Otch_P'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Familia_B_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Name_B_P'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Otch_B_P'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Familia_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_Name_P'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Otch_P'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Familia_B_P'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ONA_Name_B_P'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_Otch_B_P'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Zametka'
        DataType = ftMemo
      end
      item
        Name = 'OTHER'
        DataType = ftMemo
      end
      item
        Name = 'IZMEN'
        DataType = ftMemo
      end
      item
        Name = 'COPIA'
        DataType = ftBoolean
      end
      item
        Name = 'NOMER_EKZ'
        DataType = ftInteger
      end
      item
        Name = 'IZV_NOMER'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'IZV_DATE'
        DataType = ftDate
      end
      item
        Name = 'PROV'
        DataType = ftBoolean
      end
      item
        Name = 'ON_WORK'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ON_OBRAZ'
        DataType = ftInteger
      end
      item
        Name = 'ON_CHERN'
        DataType = ftSmallint
      end
      item
        Name = 'AdresIzvech'
        DataType = ftMemo
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
        Name = 'VOENKOM'
        DataType = ftInteger
      end
      item
        Name = 'ON_M_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'ON_M_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'ON_M_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'ON_M_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_M_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ON_M_B_GOROD'
        DataType = ftInteger
      end
      item
        Name = 'ON_M_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_M_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'ONA_M_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'ONA_M_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'ONA_M_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_M_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONA_M_B_GOROD'
        DataType = ftInteger
      end
      item
        Name = 'ONA_M_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDENTIF'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'ON_IDENTIF'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'ONA_IDENTIF'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'POLE_GRN'
        DataType = ftSmallint
      end
      item
        Name = 'ON_STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ONA_STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ON_DOK_TYPE'
        DataType = ftInteger
      end
      item
        Name = 'ON_DOK_SERIA'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ON_DOK_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ON_DOK_ORGAN'
        DataType = ftInteger
      end
      item
        Name = 'ON_DOK_DATE'
        DataType = ftDate
      end
      item
        Name = 'ONA_DOK_TYPE'
        DataType = ftInteger
      end
      item
        Name = 'ONA_DOK_SERIA'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ONA_DOK_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ONA_DOK_ORGAN'
        DataType = ftInteger
      end
      item
        Name = 'ONA_DOK_DATE'
        DataType = ftDate
      end
      item
        Name = 'TYPEREG'
        DataType = ftSmallint
      end
      item
        Name = 'TYPEMESSAGE'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'GRAG'
        DataType = ftInteger
      end
      item
        Name = 'B_GOROD'
        DataType = ftInteger
      end
      item
        Name = 'ON_B_GOROD'
        DataType = ftInteger
      end
      item
        Name = 'ONA_B_GOROD'
        DataType = ftInteger
      end
      item
        Name = 'SPEC_B'
        DataType = ftString
        Size = 60
      end>
    Left = 688
    Top = 98
    object DokumentNOMER: TIntegerField [4]
      FieldName = 'NOMER'
    end
    object DokumentDATEZ: TDateField [5]
      FieldName = 'DATEZ'
    end
    object DokumentSVID_SERIA: TStringField [6]
      FieldName = 'SVID_SERIA'
      Size = 10
    end
    object DokumentSVID_NOMER: TStringField [7]
      FieldName = 'SVID_NOMER'
    end
    object DokumentFamiliaDo: TStringField [8]
      FieldName = 'FamiliaDo'
      Size = 50
    end
    object DokumentOtchDo: TStringField [9]
      FieldName = 'OtchDo'
      Size = 30
    end
    object DokumentNameDo: TStringField [10]
      FieldName = 'NameDo'
      Size = 30
    end
    object DokumentDateR: TDateField [11]
      FieldName = 'DateR'
    end
    object DokumentGOSUD: TIntegerField [12]
      FieldName = 'GOSUD'
    end
    object DokumentOBL: TStringField [13]
      FieldName = 'OBL'
      Size = 30
    end
    object DokumentRAION: TStringField [14]
      FieldName = 'RAION'
      Size = 30
    end
    object DokumentGOROD: TStringField [15]
      FieldName = 'GOROD'
      Size = 30
    end
    object DokumentPOL: TStringField [16]
      FieldName = 'POL'
      Size = 1
    end
    object DokumentON_ID: TIntegerField [17]
      FieldName = 'ON_ID'
    end
    object DokumentON_Familia: TStringField [18]
      FieldName = 'ON_Familia'
      Size = 50
    end
    object DokumentON_Name: TStringField [19]
      FieldName = 'ON_Name'
      Size = 30
    end
    object DokumentON_Otch: TStringField [20]
      FieldName = 'ON_Otch'
      Size = 30
    end
    object DokumentON_DateR: TDateField [21]
      FieldName = 'ON_DateR'
    end
    object DokumentON_NATION: TIntegerField [22]
      FieldName = 'ON_NATION'
    end
    object DokumentON_GRAG: TIntegerField [23]
      FieldName = 'ON_GRAG'
    end
    object DokumentON_SOATO: TStringField [24]
      FieldName = 'ON_SOATO'
      Size = 10
    end
    object DokumentON_GOSUD: TIntegerField [25]
      FieldName = 'ON_GOSUD'
    end
    object DokumentON_OBL: TStringField [26]
      FieldName = 'ON_OBL'
      Size = 30
    end
    object DokumentON_RAION: TStringField [27]
      FieldName = 'ON_RAION'
      Size = 30
    end
    object DokumentON_GOROD: TStringField [28]
      FieldName = 'ON_GOROD'
      Size = 30
    end
    object DokumentON_GOROD_R: TStringField [29]
      FieldName = 'ON_GOROD_R'
      Size = 50
    end
    object DokumentON_DOKUMENT: TMemoField [30]
      FieldName = 'ON_DOKUMENT'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentON_B_RESP: TBooleanField [31]
      FieldName = 'ON_B_RESP'
    end
    object DokumentON_B_OBL: TBooleanField [32]
      FieldName = 'ON_B_OBL'
    end
    object DokumentONA_ID: TIntegerField [33]
      FieldName = 'ONA_ID'
    end
    object DokumentONA_Familia: TStringField [34]
      FieldName = 'ONA_Familia'
      Size = 50
    end
    object DokumentONA_Name: TStringField [35]
      FieldName = 'ONA_Name'
      Size = 30
    end
    object DokumentONA_Otch: TStringField [36]
      FieldName = 'ONA_Otch'
      Size = 30
    end
    object DokumentONA_DateR: TDateField [37]
      FieldName = 'ONA_DateR'
    end
    object DokumentONA_NATION: TIntegerField [38]
      FieldName = 'ONA_NATION'
    end
    object DokumentONA_GRAG: TIntegerField [39]
      FieldName = 'ONA_GRAG'
    end
    object DokumentONA_SOATO: TStringField [40]
      FieldName = 'ONA_SOATO'
      Size = 10
    end
    object DokumentONA_GOSUD: TIntegerField [41]
      FieldName = 'ONA_GOSUD'
    end
    object DokumentONA_OBL: TStringField [42]
      FieldName = 'ONA_OBL'
      Size = 30
    end
    object DokumentONA_RAION: TStringField [43]
      FieldName = 'ONA_RAION'
      Size = 30
    end
    object DokumentONA_GOROD: TStringField [44]
      FieldName = 'ONA_GOROD'
      Size = 30
    end
    object DokumentONA_GOROD_R: TStringField [45]
      FieldName = 'ONA_GOROD_R'
      Size = 50
    end
    object DokumentONA_DOKUMENT: TMemoField [46]
      FieldName = 'ONA_DOKUMENT'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentONA_B_RESP: TBooleanField [47]
      FieldName = 'ONA_B_RESP'
    end
    object DokumentONA_B_OBL: TBooleanField [48]
      FieldName = 'ONA_B_OBL'
    end
    object DokumentRUKOV: TStringField [49]
      FieldName = 'RUKOV'
      Size = 60
    end
    object DokumentB_RESP: TBooleanField [50]
      FieldName = 'B_RESP'
    end
    object DokumentB_OBL: TBooleanField [51]
      FieldName = 'B_OBL'
    end
    object DokumentFirst_Ekz: TBooleanField [52]
      FieldName = 'First_Ekz'
    end
    object DokumentLICH_ID: TIntegerField [53]
      FieldName = 'LICH_ID'
    end
    object DokumentCHILD_ID: TIntegerField [54]
      FieldName = 'CHILD_ID'
    end
    object DokumentMesto: TStringField [55]
      FieldName = 'Mesto'
      Size = 100
    end
    object DokumentMestoDate: TDateField [56]
      FieldName = 'MestoDate'
    end
    object DokumentMestoNomer: TStringField [57]
      FieldName = 'MestoNomer'
      Size = 15
    end
    object DokumentFamiliaPosle: TStringField [58]
      FieldName = 'FamiliaPosle'
      Size = 50
    end
    object DokumentNamePosle: TStringField [59]
      FieldName = 'NamePosle'
      Size = 30
    end
    object DokumentOtchPosle: TStringField [60]
      FieldName = 'OtchPosle'
      Size = 30
    end
    object DokumentReshSud: TStringField [61]
      DisplayWidth = 150
      FieldName = 'ReshSud'
      Size = 100
    end
    object DokumentDateDecl: TDateField [62]
      FieldName = 'DateDecl'
    end
    object DokumentOsnov: TIntegerField [63]
      FieldName = 'Osnov'
    end
    object DokumentSPEC: TStringField [64]
      FieldName = 'SPEC'
      Size = 60
    end
    object DokumentID_ZAGS: TIntegerField [65]
      FieldName = 'ID_ZAGS'
    end
    object DokumentFamiliaDo_B: TStringField [66]
      FieldName = 'FamiliaDo_B'
      Size = 50
    end
    object DokumentNameDo_B: TStringField [67]
      FieldName = 'NameDo_B'
      Size = 30
    end
    object DokumentOtchDo_B: TStringField [68]
      FieldName = 'OtchDo_B'
      Size = 30
    end
    object DokumentFamiliaPosle_B: TStringField [69]
      FieldName = 'FamiliaPosle_B'
      Size = 50
    end
    object DokumentNamePosle_B: TStringField [70]
      FieldName = 'NamePosle_B'
      Size = 30
    end
    object DokumentOtchPosle_B: TStringField [71]
      FieldName = 'OtchPosle_B'
      Size = 30
    end
    object DokumentON_Familia_B: TStringField [72]
      FieldName = 'ON_Familia_B'
      Size = 50
    end
    object DokumentON_Name_B: TStringField [73]
      FieldName = 'ON_Name_B'
      Size = 30
    end
    object DokumentON_Otch_B: TStringField [74]
      FieldName = 'ON_Otch_B'
      Size = 30
    end
    object DokumentONA_Familia_B: TStringField [75]
      FieldName = 'ONA_Familia_B'
      Size = 50
    end
    object DokumentONA_Name_B: TStringField [76]
      FieldName = 'ONA_Name_B'
      Size = 30
    end
    object DokumentONA_Otch_B: TStringField [77]
      FieldName = 'ONA_Otch_B'
      Size = 30
    end
    object DokumentRukov_B: TStringField [78]
      FieldName = 'Rukov_B'
      Size = 60
    end
    object DokumentDATESV: TDateField [79]
      FieldName = 'DATESV'
    end
    object DokumentFamilia_P: TStringField [80]
      FieldName = 'Familia_P'
      Size = 50
    end
    object DokumentName_P: TStringField [81]
      FieldName = 'Name_P'
      Size = 30
    end
    object DokumentOtch_P: TStringField [82]
      FieldName = 'Otch_P'
      Size = 30
    end
    object DokumentFamilia_B_P: TStringField [83]
      FieldName = 'Familia_B_P'
      Size = 50
    end
    object DokumentName_B_P: TStringField [84]
      FieldName = 'Name_B_P'
      Size = 30
    end
    object DokumentOtch_B_P: TStringField [85]
      FieldName = 'Otch_B_P'
      Size = 30
    end
    object DokumentONA_Familia_P: TStringField [86]
      FieldName = 'ONA_Familia_P'
      Size = 50
    end
    object DokumentONA_Name_P: TStringField [87]
      FieldName = 'ONA_Name_P'
      Size = 30
    end
    object DokumentONA_Otch_P: TStringField [88]
      FieldName = 'ONA_Otch_P'
      Size = 30
    end
    object DokumentONA_Familia_B_P: TStringField [89]
      FieldName = 'ONA_Familia_B_P'
      Size = 50
    end
    object DokumentONA_Name_B_P: TStringField [90]
      FieldName = 'ONA_Name_B_P'
      Size = 30
    end
    object DokumentONA_Otch_B_P: TStringField [91]
      FieldName = 'ONA_Otch_B_P'
      Size = 30
    end
    object DokumentZametka: TMemoField [92]
      FieldName = 'Zametka'
      BlobType = ftMemo
    end
    object DokumentOTHER: TMemoField [93]
      FieldName = 'OTHER'
      BlobType = ftMemo
    end
    object DokumentIZMEN: TMemoField [94]
      FieldName = 'IZMEN'
      BlobType = ftMemo
    end
    object DokumentCOPIA: TBooleanField [95]
      FieldName = 'COPIA'
    end
    object DokumentIZV_NOMER: TStringField [97]
      FieldName = 'IZV_NOMER'
      Size = 15
    end
    object DokumentIZV_DATE: TDateField [98]
      FieldName = 'IZV_DATE'
    end
    object DokumentPROV: TBooleanField [99]
      FieldName = 'PROV'
    end
    object DokumentON_WORK: TStringField [100]
      FieldName = 'ON_WORK'
      Size = 100
    end
    object DokumentON_OBRAZ: TIntegerField [101]
      FieldName = 'ON_OBRAZ'
    end
    object DokumentON_CHERN: TSmallintField [102]
      FieldName = 'ON_CHERN'
    end
    object DokumentAdresIzvech: TMemoField [103]
      FieldName = 'AdresIzvech'
      BlobType = ftMemo
    end
    object DokumentVOENKOM: TIntegerField
      FieldName = 'VOENKOM'
    end
    object DokumentON_M_B_RESP: TBooleanField
      FieldName = 'ON_M_B_RESP'
    end
    object DokumentON_M_GOSUD: TIntegerField
      FieldName = 'ON_M_GOSUD'
    end
    object DokumentON_M_B_OBL: TBooleanField
      FieldName = 'ON_M_B_OBL'
    end
    object DokumentON_M_OBL: TStringField
      FieldName = 'ON_M_OBL'
      Size = 30
    end
    object DokumentON_M_RAION: TStringField
      FieldName = 'ON_M_RAION'
      Size = 30
    end
    object DokumentON_M_B_GOROD: TIntegerField
      FieldName = 'ON_M_B_GOROD'
    end
    object DokumentON_M_GOROD: TStringField
      FieldName = 'ON_M_GOROD'
      Size = 30
    end
    object DokumentONA_M_B_RESP: TBooleanField
      FieldName = 'ONA_M_B_RESP'
    end
    object DokumentONA_M_GOSUD: TIntegerField
      FieldName = 'ONA_M_GOSUD'
    end
    object DokumentONA_M_B_OBL: TBooleanField
      FieldName = 'ONA_M_B_OBL'
    end
    object DokumentONA_M_OBL: TStringField
      FieldName = 'ONA_M_OBL'
      Size = 30
    end
    object DokumentONA_M_RAION: TStringField
      FieldName = 'ONA_M_RAION'
      Size = 30
    end
    object DokumentONA_M_B_GOROD: TIntegerField
      FieldName = 'ONA_M_B_GOROD'
    end
    object DokumentONA_M_GOROD: TStringField
      FieldName = 'ONA_M_GOROD'
      Size = 30
    end
    object DokumentIDENTIF: TStringField
      FieldName = 'IDENTIF'
      Size = 14
    end
    object DokumentON_IDENTIF: TStringField
      FieldName = 'ON_IDENTIF'
      Size = 14
    end
    object DokumentONA_IDENTIF: TStringField
      FieldName = 'ONA_IDENTIF'
      Size = 14
    end
    object DokumentPOLE_GRN: TSmallintField
      FieldName = 'POLE_GRN'
    end
    object DokumentON_STATUS: TStringField
      FieldName = 'ON_STATUS'
      Size = 1
    end
    object DokumentONA_STATUS: TStringField
      FieldName = 'ONA_STATUS'
      Size = 1
    end
    object DokumentON_DOK_TYPE: TIntegerField
      FieldName = 'ON_DOK_TYPE'
    end
    object DokumentON_DOK_SERIA: TStringField
      FieldName = 'ON_DOK_SERIA'
      Size = 7
    end
    object DokumentON_DOK_NOMER: TStringField
      FieldName = 'ON_DOK_NOMER'
      Size = 10
    end
    object DokumentON_DOK_ORGAN: TIntegerField
      FieldName = 'ON_DOK_ORGAN'
    end
    object DokumentON_DOK_DATE: TDateField
      FieldName = 'ON_DOK_DATE'
    end
    object DokumentONA_DOK_TYPE: TIntegerField
      FieldName = 'ONA_DOK_TYPE'
    end
    object DokumentONA_DOK_SERIA: TStringField
      FieldName = 'ONA_DOK_SERIA'
      Size = 7
    end
    object DokumentONA_DOK_NOMER: TStringField
      FieldName = 'ONA_DOK_NOMER'
      Size = 10
    end
    object DokumentONA_DOK_ORGAN: TIntegerField
      FieldName = 'ONA_DOK_ORGAN'
    end
    object DokumentONA_DOK_DATE: TDateField
      FieldName = 'ONA_DOK_DATE'
    end
    object DokumentTYPEREG: TSmallintField
      FieldName = 'TYPEREG'
    end
    object DokumentTYPEMESSAGE: TStringField
      FieldName = 'TYPEMESSAGE'
      Size = 4
    end
    object DokumentSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object DokumentGRAG: TIntegerField
      FieldName = 'GRAG'
    end
    object DokumentB_GOROD: TIntegerField
      FieldName = 'B_GOROD'
    end
    object DokumentON_B_GOROD: TIntegerField
      FieldName = 'ON_B_GOROD'
    end
    object DokumentONA_B_GOROD: TIntegerField
      FieldName = 'ONA_B_GOROD'
    end
    object DokumentSPEC_B: TStringField
      FieldName = 'SPEC_B'
      Size = 60
    end
    object DokumentRN_B_GOROD: TStringField
      FieldName = 'RN_B_GOROD'
      Size = 10
    end
    object DokumentRN_ONA_M_B_GOROD: TStringField
      FieldName = 'RN_ONA_M_B_GOROD'
      Size = 10
    end
    object DokumentRN_ONA_B_GOROD: TStringField
      FieldName = 'RN_ONA_B_GOROD'
      Size = 10
    end
    object DokumentRN_ON_M_B_GOROD: TStringField
      FieldName = 'RN_ON_M_B_GOROD'
      Size = 10
    end
  end
  inherited HistZAGS: TkbmMemTable
    Left = 392
    Top = 218
  end
  inherited dsSeria: TDataSource
    Left = 728
    Top = 266
  end
  object dsGragd: TDataSource [13]
    Left = 468
    Top = 211
  end
  inherited dsObl: TDataSource
    Left = 712
    Top = 210
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 752
    Top = 130
  end
  inherited dsRN: TDataSource
    Left = 728
    Top = 170
  end
  inherited dsGorod: TDataSource
    Left = 752
    Top = 346
  end
  inherited dsRnGor: TDataSource
    Left = 728
    Top = 354
  end
  inherited dsTypeGorod: TDataSource
    Left = 688
    Top = 394
  end
  inherited ImGISUN: TImageList
    Left = 356
    Top = 203
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Top = 106
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 128
    Top = 98
  end
end
