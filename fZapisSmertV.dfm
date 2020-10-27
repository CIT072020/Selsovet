inherited fmZapisSmertV: TfmZapisSmertV
  Left = 378
  Top = 180
  Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1089#1084#1077#1088#1090#1080
  ClientHeight = 622
  ClientWidth = 814
  Constraints.MinHeight = 660
  Constraints.MinWidth = 830
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000008888888880000000
    88888888800000008888F888800000000888F88800000000000FFF0000000000
    0000000000000000000777000000000000077700000000000007770000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    0000FFFF0000E0030000E0030000E0030000E0030000F0070000F80F0000FE3F
    0000FC1F0000FC1F0000FC1F0000FC1F0000FE3F0000FFFF0000FFFF0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 600
    Width = 814
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited pnTable: TPanel
    Top = 600
    Width = 814
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 814
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
        Left = 810
        Top = 22
      end
    end
  end
  inherited sb: TScrollBox
    Width = 814
    Height = 550
    Align = alClient
    inherited pnPovtor: TPanel
      Left = 71
      Top = 121
      TabOrder = 2
      inherited imBE: TImage
        Anchors = [akTop]
      end
    end
    inherited N_F_edTypeEkz: TComboBox
      TabOrder = 3
    end
    object pc: TPageControl
      Left = 0
      Top = 33
      Width = 814
      Height = 517
      ActivePage = ts1
      Align = alClient
      TabOrder = 1
      TabStop = False
      OnChange = pcChange
      object ts1: TTabSheet
        Caption = #1063#1072#1089#1090#1100' 1'
        DesignSize = (
          806
          489)
        object Label1: TLabel
          Left = 12
          Top = 11
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
          Left = 253
          Top = 11
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
          Left = 426
          Top = 11
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
          Top = 40
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
        object Label5: TLabel
          Left = 7
          Top = 276
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
        object Label20: TLabel
          Left = 498
          Top = 40
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
        object Label21: TLabel
          Left = 11
          Top = 69
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
        object Label6: TLabel
          Left = 377
          Top = 69
          Width = 75
          Height = 13
          Caption = #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 203
          Top = 40
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
        object edFamilia: TDBEditEh
          Left = 91
          Top = 5
          Width = 138
          Height = 24
          HelpType = htKeyword
          HelpContext = 888
          DataField = 'Familia'
          DataSource = dsDokument
          EditButtons = <
            item
              Style = ebsGlyphEh
              Width = 16
              OnClick = edFamiliaEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = True
          OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
          OnEnter = edFamiliaEnter
        end
        object edName: TDBEditEh
          Left = 300
          Top = 5
          Width = 108
          Height = 24
          DataField = 'Name'
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
          OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
          OnEnter = edNameEnter
        end
        object edOtch: TDBEditEh
          Left = 503
          Top = 5
          Width = 114
          Height = 24
          DataField = 'Otch'
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
          OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
          OnEnter = edOtchEnter
        end
        object edDateR: TDBDateTimeEditEh
          Left = 113
          Top = 270
          Width = 120
          Height = 24
          DataField = 'DateR'
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
          OnUpdateData = edDateRUpdateData
          EditFormat = 'DD/MM/YYYY      '
        end
        object edPol: TDBComboBoxEh
          Left = 53
          Top = 34
          Width = 121
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
        object edNATION: TDBLookupComboboxEh
          Left = 614
          Top = 34
          Width = 185
          Height = 24
          DataField = 'NATION'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME_M'
          ListSource = dsNation
          ParentFont = False
          TabOrder = 5
          Visible = True
        end
        object edGRAG: TDBLookupComboboxEh
          Left = 99
          Top = 63
          Width = 198
          Height = 24
          DataField = 'GRAG'
          DataSource = dsDokument
          DropDownBox.Width = 300
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'GNAME'
          ListSource = dsGragd
          ParentFont = False
          TabOrder = 6
          Visible = True
        end
        object edDateS: TDBDateTimeEditEh
          Left = 464
          Top = 63
          Width = 120
          Height = 24
          DataField = 'DateS'
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
          OnUpdateData = edDateSUpdateData
          EditFormat = 'DD/MM/YYYY      '
        end
        object gbSmert: TGroupBox
          Left = 2
          Top = 102
          Width = 802
          Height = 74
          Anchors = [akLeft, akTop, akRight]
          Caption = ' '#1052#1077#1089#1090#1086' '#1089#1084#1077#1088#1090#1080' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          object Label9: TLabel
            Left = 36
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
            Left = 401
            Top = 16
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
          object Label11: TLabel
            Left = 36
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
          object Label12: TLabel
            Left = 401
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
          object edSM_B_RESP: TDBCheckBoxEh
            Left = 179
            Top = 14
            Width = 15
            Height = 17
            DataField = 'SM_B_RESP'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edSM_GOSUD: TDBLookupComboboxEh
            Left = 199
            Top = 13
            Width = 155
            Height = 24
            DataField = 'SM_GOSUD'
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
          object edSM_GOROD: TDBEditEh
            Left = 584
            Top = 42
            Width = 113
            Height = 24
            DataField = 'SM_GOROD'
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
            OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
          end
          object edSM_OBL_B: TDBEditEh
            Left = 698
            Top = 13
            Width = 30
            Height = 24
            DataField = 'SM_OBL_B'
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
            OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
          end
          object edSM_RAION_B: TDBEditEh
            Left = 359
            Top = 42
            Width = 34
            Height = 24
            DataField = 'SM_RAION_B'
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
            OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
          end
          object edSM_B_GOROD: TDBLookupComboboxEh
            Left = 530
            Top = 42
            Width = 46
            Height = 24
            Alignment = taRightJustify
            DataField = 'SM_B_GOROD'
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
            TabOrder = 5
            Visible = True
          end
          object edSM_OBL_R: TDBEditEh
            Left = 529
            Top = 13
            Width = 155
            Height = 24
            DataField = 'SM_OBL'
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
            OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
          end
          object edSM_RAION_R: TDBEditEh
            Left = 199
            Top = 42
            Width = 155
            Height = 24
            DataField = 'SM_RAION'
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
            OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
          end
          object DBCheckBoxEh1: TDBCheckBoxEh
            Left = 505
            Top = 14
            Width = 15
            Height = 17
            AllowGrayed = True
            DataField = 'SM_B_OBL'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        object gbRogd: TGroupBox
          Left = 2
          Top = 297
          Width = 801
          Height = 76
          Anchors = [akLeft, akTop, akRight]
          Caption = ' '#1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          object Label13: TLabel
            Left = 36
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
          object Label14: TLabel
            Left = 430
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
          object Label22: TLabel
            Left = 36
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
          object Label23: TLabel
            Left = 430
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
          object edRG_B_RESP: TDBCheckBoxEh
            Left = 179
            Top = 19
            Width = 15
            Height = 17
            DataField = 'RG_B_RESP'
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
          object edRG_GOSUD: TDBLookupComboboxEh
            Left = 199
            Top = 15
            Width = 200
            Height = 24
            DataField = 'RG_GOSUD'
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
          object edRG_B_OBL: TDBCheckBoxEh
            Left = 517
            Top = 19
            Width = 15
            Height = 17
            AllowGrayed = True
            DataField = 'RG_B_OBL'
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
          object edRG_GOROD: TDBEditEh
            Left = 594
            Top = 44
            Width = 144
            Height = 24
            DataField = 'RG_GOROD'
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
          object edRG_B_GOROD: TDBLookupComboboxEh
            Left = 538
            Top = 44
            Width = 46
            Height = 24
            Alignment = taRightJustify
            DataField = 'RG_B_GOROD'
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
          object edRG_OBL: TDBEditEh
            Left = 538
            Top = 15
            Width = 200
            Height = 24
            DataField = 'RG_OBL'
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
          object edRG_RAION: TDBEditEh
            Left = 199
            Top = 44
            Width = 200
            Height = 24
            DataField = 'RG_RAION'
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
        object gbGit: TGroupBox
          Left = 2
          Top = 375
          Width = 801
          Height = 103
          Anchors = [akLeft, akTop, akRight]
          Caption = ' '#1052#1077#1089#1090#1086' '#1087#1086#1089#1090#1086#1103#1085#1085#1086#1075#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
          object Label15: TLabel
            Left = 36
            Top = 20
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
          object Label25: TLabel
            Left = 430
            Top = 20
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
          object Label26: TLabel
            Left = 36
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
          object Label27: TLabel
            Left = 430
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
          object Label53: TLabel
            Left = 36
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
          object edGT_B_RESP: TDBCheckBoxEh
            Left = 179
            Top = 18
            Width = 15
            Height = 17
            DataField = 'GT_B_RESP'
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
          object edGT_GOSUD: TDBLookupComboboxEh
            Left = 199
            Top = 14
            Width = 200
            Height = 24
            DataField = 'GT_GOSUD'
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
          object edGT_B_OBL: TDBCheckBoxEh
            Left = 517
            Top = 18
            Width = 15
            Height = 17
            AllowGrayed = True
            DataField = 'GT_B_OBL'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edGT_GOROD: TDBEditEh
            Left = 594
            Top = 41
            Width = 144
            Height = 24
            DataField = 'GT_GOROD'
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
          object edGT_GOROD_R: TDBEditEh
            Left = 199
            Top = 69
            Width = 322
            Height = 24
            HelpContext = 999
            DataField = 'GT_GOROD_R'
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
          object edGT_B_GOROD: TDBLookupComboboxEh
            Left = 538
            Top = 41
            Width = 46
            Height = 24
            Alignment = taRightJustify
            DataField = 'GT_B_GOROD'
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
          object edGT_OBL: TDBEditEh
            Left = 538
            Top = 14
            Width = 200
            Height = 24
            DataField = 'GT_OBL'
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
          object edGT_RAION: TDBEditEh
            Left = 199
            Top = 41
            Width = 200
            Height = 24
            DataField = 'GT_RAION'
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
        object gbPrichin: TGroupBox
          Left = 2
          Top = 179
          Width = 801
          Height = 85
          Anchors = [akLeft, akTop, akRight]
          Caption = ' '#1055#1088#1080#1095#1080#1085#1072' '#1089#1084#1077#1088#1090#1080' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          object Label28: TLabel
            Left = 24
            Top = 26
            Width = 96
            Height = 13
            Caption = #1053#1077#1087#1086#1089#1088#1077#1076#1089#1090#1074#1077#1085#1085#1072#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label31: TLabel
            Left = 24
            Top = 56
            Width = 49
            Height = 13
            Caption = #1054#1089#1085#1086#1074#1085#1072#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label32: TLabel
            Left = 96
            Top = 53
            Width = 125
            Height = 13
            Caption = #1052#1077#1089#1090#1086' '#1080' '#1086#1073#1089#1090#1086#1103#1090#1077#1083#1100#1089#1090#1074#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label33: TLabel
            Left = 218
            Top = 8
            Width = 20
            Height = 13
            Caption = #1050#1086#1076
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label34: TLabel
            Left = 447
            Top = 8
            Width = 73
            Height = 13
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edPrNep: TDBEditEh
            Left = 201
            Top = 23
            Width = 52
            Height = 24
            CharCase = ecUpperCase
            DataField = 'PR_NEP'
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
          object edPrOsn: TDBEditEh
            Left = 201
            Top = 50
            Width = 52
            Height = 24
            CharCase = ecUpperCase
            DataField = 'PR_OSN'
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
          object edPrMesto: TDBEditEh
            Left = 137
            Top = 50
            Width = 24
            Height = 24
            CharCase = ecUpperCase
            DataField = 'PR_MEST'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Visible = False
          end
          object edPrNep_Name: TDBEditEh
            Left = 264
            Top = 23
            Width = 471
            Height = 24
            DataField = 'PR_NEP_NAME'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            MRUList.Limit = 20
            MRUList.Rows = 10
            ParentFont = False
            TabOrder = 1
            Visible = True
            OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
          end
          object edPrOsn_Name: TDBEditEh
            Left = 264
            Top = 50
            Width = 471
            Height = 24
            DataField = 'PR_OSN_NAME'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Visible = True
            OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
          end
          object edPrMesto_Name: TDBEditEh
            Left = 744
            Top = 34
            Width = 47
            Height = 24
            DataField = 'PR_MEST_NAME'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            Visible = False
            OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
          end
        end
        object ENG_edIDENTIF: TDBEditEh
          Left = 319
          Top = 34
          Width = 155
          Height = 24
          DataField = 'LICH_NOMER'
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
        object cbBelorus: TDBCheckBoxEh
          Left = 742
          Top = 5
          Width = 56
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
          TabOrder = 13
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = cbBelorusClick
        end
      end
      object ts2: TTabSheet
        Caption = #1063#1072#1089#1090#1100' 2'
        ImageIndex = 1
        DesignSize = (
          806
          489)
        object Label19: TLabel
          Left = 14
          Top = 90
          Width = 62
          Height = 13
          Caption = #1047#1072#1103#1074#1080#1090#1077#1083#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label36: TLabel
          Left = 16
          Top = 111
          Width = 51
          Height = 13
          Caption = #1054#1090#1084#1077#1090#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 13
          Top = 9
          Width = 232
          Height = 13
          Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077' '#1074#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080' '#1072#1082#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 530
          Top = 34
          Width = 25
          Height = 13
          Caption = #1076#1072#1090#1072
        end
        object Label59: TLabel
          Left = 16
          Top = 231
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
        object Label24: TLabel
          Left = 28
          Top = 61
          Width = 152
          Height = 13
          Caption = #1074#1089#1090#1091#1087#1080#1074#1096#1077#1077' '#1074' '#1079#1072#1082#1086#1085#1085#1091#1102' '#1089#1080#1083#1091' '
        end
        object lbDolgRuk: TvchDBText
          Left = 3
          Top = 181
          Width = 558
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
          Left = 3
          Top = 207
          Width = 558
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
        object edRukov: TDBEditEh
          Left = 569
          Top = 177
          Width = 234
          Height = 24
          Anchors = [akTop, akRight]
          DataField = 'RUKOV'
          DataSource = dsDokument
          EditButtons = <
            item
              Style = ebsEllipsisEh
              OnClick = edRukovEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Visible = True
          OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
          OnEnter = edRukovEnter
        end
        object edDecl: TDBEditEh
          Left = 122
          Top = 87
          Width = 681
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          DataField = 'DECL'
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
              Width = 20
              OnClick = edDeclEditButtons0Click
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
        object edZametka: TDBEditEh
          Left = 122
          Top = 113
          Width = 681
          Height = 59
          Anchors = [akLeft, akTop, akRight]
          AutoSelect = False
          AutoSize = False
          DataField = 'ZAMETKA'
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
          WantReturns = True
          OnDblClick = TBItemEditMemoClick
        end
        object edSpec: TDBEditEh
          Left = 569
          Top = 203
          Width = 234
          Height = 24
          HelpContext = 999
          Anchors = [akTop, akRight]
          DataField = 'SPEC'
          DataSource = dsDokument
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
          TabOrder = 6
          Visible = True
        end
        object edSUD_NAME: TDBEditEh
          Left = 28
          Top = 28
          Width = 476
          Height = 24
          HelpType = htKeyword
          HelpContext = 888
          DataField = 'SUD_NAME'
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
        object edSUD_DATE: TDBDateTimeEditEh
          Left = 570
          Top = 28
          Width = 120
          Height = 24
          DataField = 'SUD_DATE'
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
        object edIzmen: TDBEditEh
          Left = 122
          Top = 231
          Width = 680
          Height = 79
          Anchors = [akLeft, akTop, akRight]
          AutoSelect = False
          AutoSize = False
          DataField = 'IZMEN'
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
          WantReturns = True
          OnDblClick = TBItemEditMemoClick
        end
        object N_F_edCopy: TDBCheckBoxEh
          Left = 8
          Top = 373
          Width = 97
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
          TabOrder = 8
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object gbMat: TGroupBox
          Left = 3
          Top = 318
          Width = 800
          Height = 48
          Anchors = [akLeft, akTop, akRight]
          Caption = ' '#1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1084#1072#1090#1077#1088#1080' ('#1079#1072#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1076#1083#1103' '#1076#1077#1090#1077#1081' '#1076#1086' 1 '#1075#1086#1076#1072' ) '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          object Label43: TLabel
            Left = 32
            Top = 24
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
          object Label44: TLabel
            Left = 277
            Top = 24
            Width = 229
            Height = 13
            Caption = #1082#1086#1090#1086#1088#1099#1081' '#1087#1086' '#1089#1095#1077#1090#1091' '#1088#1077#1073#1077#1085#1086#1082' '#1088#1086#1076#1080#1083#1089#1103' '#1091' '#1084#1072#1090#1077#1088#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edMatDateR: TDBDateTimeEditEh
            Left = 125
            Top = 18
            Width = 120
            Height = 24
            DataField = 'MAT_DATER'
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
          object edMatSchet: TDBNumberEditEh
            Left = 518
            Top = 18
            Width = 33
            Height = 24
            DataField = 'MAT_SCHET'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxValue = 20.000000000000000000
            MinValue = 1.000000000000000000
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
        end
        object N_F_cbPovtor: TDBCheckBoxEh
          Left = 8
          Top = 396
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
          TabOrder = 10
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edSudSila: TDBDateTimeEditEh
          Left = 187
          Top = 55
          Width = 120
          Height = 24
          DataField = 'SUD_SILA'
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
      object tsPovtor: TTabSheet
        Caption = #1055#1086#1074#1090#1086#1088#1085#1099#1077' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072
        ImageIndex = 2
      end
    end
    object pn: TPanel
      Left = 0
      Top = 0
      Width = 814
      Height = 33
      Align = alTop
      TabOrder = 0
      DesignSize = (
        814
        33)
      object Label7: TLabel
        Left = 6
        Top = 10
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
        Left = 102
        Top = 10
        Width = 14
        Height = 13
        Caption = #1086#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label40: TLabel
        Left = 258
        Top = 10
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
        Left = 425
        Top = 8
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
      object Label39: TLabel
        Left = 516
        Top = 10
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
      object ImageGISUN: TImage
        Left = 788
        Top = 5
        Width = 20
        Height = 20
        Anchors = [akTop, akRight]
        Transparent = True
      end
      object edNomer: TDBEditEh
        Left = 51
        Top = 4
        Width = 44
        Height = 24
        HelpType = htKeyword
        HelpContext = 888
        DataField = 'NOMER'
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
      object edDateZ: TDBDateTimeEditEh
        Left = 123
        Top = 4
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
        TabOrder = 1
        Visible = True
      end
      object N_F_1: TDBCheckBoxEh
        Left = 657
        Top = 6
        Width = 122
        Height = 17
        Caption = '1-'#1099#1081' '#1101#1082#1079#1077#1084#1087#1083#1103#1088
        DataField = 'First_Ekz'
        DataSource = dsDokument
        TabOrder = 5
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object edSvid_Nomer: TDBEditEh
        Left = 444
        Top = 4
        Width = 67
        Height = 24
        DataField = 'SVID_NOMER'
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
      object cbProvDvig: TDBCheckBoxEh
        Left = 737
        Top = 6
        Width = 32
        Height = 17
        Caption = #1055#1088#1086#1074#1086#1076#1080#1090#1100
        State = cbGrayed
        TabOrder = 6
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        Visible = False
      end
      object edDateSV: TDBDateTimeEditEh
        Left = 532
        Top = 4
        Width = 110
        Height = 24
        DataField = 'DATESV'
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
      object edSVID_SERIA: TDBLookupComboboxEh
        Left = 363
        Top = 4
        Width = 56
        Height = 24
        DataField = 'SVID_SERIA'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
    Top = 600
    Width = 814
  end
  inherited pnAdd: TPanel
    Width = 814
  end
  inherited dsDokument: TDataSource
    Left = 552
    Top = 90
  end
  object dsStran: TDataSource [7]
    DataSet = dmBase.SprStran
    Left = 644
    Top = 233
  end
  object dsNation: TDataSource [8]
    DataSet = dmBase.SprNac
    Left = 692
    Top = 169
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
        Name = 'MEN_ID'
        DataType = ftInteger
      end
      item
        Name = 'LICH_ID'
        DataType = ftInteger
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
        Name = 'POL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NATION'
        DataType = ftInteger
      end
      item
        Name = 'GRAG'
        DataType = ftInteger
      end
      item
        Name = 'CHERN'
        DataType = ftSmallint
      end
      item
        Name = 'DateS'
        DataType = ftDate
      end
      item
        Name = 'SMERT_POSL'
        DataType = ftInteger
      end
      item
        Name = 'SM_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'SM_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SM_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SM_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PR_NEP'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'PR_OSN'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'PR_MEST'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'PR_NEP_NAME'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'PR_OSN_NAME'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'PR_MEST_NAME'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'DOKUMENT'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'DateR'
        DataType = ftDate
      end
      item
        Name = 'RG_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'RG_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RG_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RG_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GT_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'GT_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GT_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GT_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GT_GOROD_R'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SEM'
        DataType = ftInteger
      end
      item
        Name = 'WORK_NAME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'OBRAZ'
        DataType = ftInteger
      end
      item
        Name = 'DECL_ID'
        DataType = ftInteger
      end
      item
        Name = 'DECL'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'SPRAV_NOMER'
        DataType = ftInteger
      end
      item
        Name = 'SPRAV_DATE'
        DataType = ftDate
      end
      item
        Name = 'SDAN_DOK'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'SDAN_VB'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ZAMETKA'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'RUKOV'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SOATO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SM_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'SM_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'RG_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'RG_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'GT_B_RESP'
        DataType = ftBoolean
      end
      item
        Name = 'GT_B_OBL'
        DataType = ftBoolean
      end
      item
        Name = 'GT_B_GOROD_R'
        DataType = ftBoolean
      end
      item
        Name = 'First_Ekz'
        DataType = ftBoolean
      end
      item
        Name = 'PROV'
        DataType = ftBoolean
      end
      item
        Name = 'PR_NEP_NAME_B'
        DataType = ftMemo
      end
      item
        Name = 'PR_OSN_NAME_B'
        DataType = ftMemo
      end
      item
        Name = 'PR_MEST_NAME_B'
        DataType = ftMemo
      end
      item
        Name = 'Familia_B'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Name_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Otch_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SM_OBL_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SM_RAION_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SM_GOROD_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DATESV'
        DataType = ftDate
      end
      item
        Name = 'RUKOV_B'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SPEC'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'VOSSTAN'
        DataType = ftBoolean
      end
      item
        Name = 'ZAVIT'
        DataType = ftMemo
      end
      item
        Name = 'SUD_NAME'
        DataType = ftMemo
      end
      item
        Name = 'SUD_DATE'
        DataType = ftDate
      end
      item
        Name = 'ID_ZAGS'
        DataType = ftInteger
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
        Name = 'MAT_DATER'
        DataType = ftDate
      end
      item
        Name = 'MAT_SCHET'
        DataType = ftSmallint
      end
      item
        Name = 'NOMER_EKZ'
        DataType = ftInteger
      end
      item
        Name = 'VUS'
        DataType = ftBoolean
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
        Name = 'SM_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'RG_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'GT_B_GOROD'
        DataType = ftSmallint
      end
      item
        Name = 'LICH_NOMER'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'POLE_GRN'
        DataType = ftSmallint
      end
      item
        Name = 'TYPEMESSAGE'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'TYPEREG'
        DataType = ftSmallint
      end
      item
        Name = 'MESTO'
        DataType = ftMemo
      end
      item
        Name = 'SPEC_B'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ARX_ADRESAT'
        DataType = ftMemo
      end>
    Left = 328
    Top = 162
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
    object DokumentMEN_ID: TIntegerField [8]
      FieldName = 'MEN_ID'
    end
    object DokumentLICH_ID: TIntegerField [9]
      FieldName = 'LICH_ID'
    end
    object DokumentFamilia: TStringField [10]
      FieldName = 'Familia'
      Size = 50
    end
    object DokumentName: TStringField [11]
      FieldName = 'Name'
      Size = 30
    end
    object DokumentOtch: TStringField [12]
      FieldName = 'Otch'
      Size = 30
    end
    object DokumentPOL: TStringField [13]
      FieldName = 'POL'
      Size = 1
    end
    object DokumentNATION: TIntegerField [14]
      FieldName = 'NATION'
    end
    object DokumentGRAG: TIntegerField [15]
      FieldName = 'GRAG'
    end
    object DokumentCHERN: TSmallintField [16]
      FieldName = 'CHERN'
    end
    object DokumentDateS: TDateField [17]
      FieldName = 'DateS'
    end
    object DokumentSMERT_POSL: TIntegerField [18]
      FieldName = 'SMERT_POSL'
    end
    object DokumentSM_GOSUD: TIntegerField [19]
      FieldName = 'SM_GOSUD'
    end
    object DokumentSM_OBL: TStringField [20]
      FieldName = 'SM_OBL'
      Size = 30
    end
    object DokumentSM_RAION: TStringField [21]
      FieldName = 'SM_RAION'
      Size = 30
    end
    object DokumentSM_GOROD: TStringField [22]
      FieldName = 'SM_GOROD'
      Size = 30
    end
    object DokumentPR_NEP: TStringField [23]
      FieldName = 'PR_NEP'
      Size = 6
    end
    object DokumentPR_OSN: TStringField [24]
      FieldName = 'PR_OSN'
      Size = 6
    end
    object DokumentPR_MEST: TStringField [25]
      FieldName = 'PR_MEST'
      Size = 6
    end
    object DokumentPR_NEP_NAME: TMemoField [26]
      FieldName = 'PR_NEP_NAME'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentPR_OSN_NAME: TMemoField [27]
      FieldName = 'PR_OSN_NAME'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentPR_MEST_NAME: TMemoField [28]
      FieldName = 'PR_MEST_NAME'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentDOKUMENT: TMemoField [29]
      FieldName = 'DOKUMENT'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentDateR: TDateField [30]
      FieldName = 'DateR'
    end
    object DokumentRG_GOSUD: TIntegerField [31]
      FieldName = 'RG_GOSUD'
    end
    object DokumentRG_OBL: TStringField [32]
      FieldName = 'RG_OBL'
      Size = 30
    end
    object DokumentRG_RAION: TStringField [33]
      FieldName = 'RG_RAION'
      Size = 30
    end
    object DokumentRG_GOROD: TStringField [34]
      FieldName = 'RG_GOROD'
      Size = 30
    end
    object DokumentGT_GOSUD: TIntegerField [35]
      FieldName = 'GT_GOSUD'
    end
    object DokumentGT_OBL: TStringField [36]
      FieldName = 'GT_OBL'
      Size = 30
    end
    object DokumentGT_RAION: TStringField [37]
      FieldName = 'GT_RAION'
      Size = 30
    end
    object DokumentGT_GOROD: TStringField [38]
      FieldName = 'GT_GOROD'
      Size = 30
    end
    object DokumentGT_GOROD_R: TStringField [39]
      FieldName = 'GT_GOROD_R'
      Size = 30
    end
    object DokumentSEM: TIntegerField [40]
      FieldName = 'SEM'
    end
    object DokumentWORK_NAME: TStringField [41]
      FieldName = 'WORK_NAME'
      Size = 100
    end
    object DokumentOBRAZ: TIntegerField [42]
      FieldName = 'OBRAZ'
    end
    object DokumentDECL_ID: TIntegerField [43]
      FieldName = 'DECL_ID'
    end
    object DokumentDECL: TStringField [44]
      FieldName = 'DECL'
      Size = 150
    end
    object DokumentSPRAV_NOMER: TIntegerField [45]
      FieldName = 'SPRAV_NOMER'
    end
    object DokumentSPRAV_DATE: TDateField [46]
      FieldName = 'SPRAV_DATE'
    end
    object DokumentSDAN_DOK: TMemoField [47]
      FieldName = 'SDAN_DOK'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentSDAN_VB: TMemoField [48]
      FieldName = 'SDAN_VB'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentZAMETKA: TMemoField [49]
      FieldName = 'ZAMETKA'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentRUKOV: TStringField [50]
      FieldName = 'RUKOV'
      Size = 60
    end
    object DokumentSOATO: TStringField [51]
      FieldName = 'SOATO'
      Size = 10
    end
    object DokumentSM_B_RESP: TBooleanField [52]
      FieldName = 'SM_B_RESP'
    end
    object DokumentSM_B_OBL: TBooleanField [53]
      FieldName = 'SM_B_OBL'
    end
    object DokumentRG_B_RESP: TBooleanField [54]
      FieldName = 'RG_B_RESP'
    end
    object DokumentRG_B_OBL: TBooleanField [55]
      FieldName = 'RG_B_OBL'
    end
    object DokumentGT_B_RESP: TBooleanField [56]
      FieldName = 'GT_B_RESP'
    end
    object DokumentGT_B_OBL: TBooleanField [57]
      FieldName = 'GT_B_OBL'
    end
    object DokumentGT_B_GOROD_R: TBooleanField [58]
      FieldName = 'GT_B_GOROD_R'
    end
    object DokumentFirst_Ekz: TBooleanField [59]
      FieldName = 'First_Ekz'
    end
    object DokumentPROV: TBooleanField [60]
      FieldName = 'PROV'
    end
    object DokumentPR_NEP_NAME_B: TMemoField [61]
      FieldName = 'PR_NEP_NAME_B'
      BlobType = ftMemo
    end
    object DokumentPR_OSN_NAME_B: TMemoField [62]
      FieldName = 'PR_OSN_NAME_B'
      BlobType = ftMemo
    end
    object DokumentPR_MEST_NAME_B: TMemoField [63]
      FieldName = 'PR_MEST_NAME_B'
      BlobType = ftMemo
    end
    object DokumentFamilia_B: TStringField [64]
      FieldName = 'Familia_B'
      Size = 50
    end
    object DokumentName_B: TStringField [65]
      FieldName = 'Name_B'
      Size = 30
    end
    object DokumentOtch_B: TStringField [66]
      FieldName = 'Otch_B'
      Size = 30
    end
    object DokumentSM_OBL_B: TStringField [67]
      FieldName = 'SM_OBL_B'
      Size = 30
    end
    object DokumentSM_RAION_B: TStringField [68]
      FieldName = 'SM_RAION_B'
      Size = 30
    end
    object DokumentSM_GOROD_B: TStringField [69]
      FieldName = 'SM_GOROD_B'
      Size = 30
    end
    object DokumentDATESV: TDateField [70]
      FieldName = 'DATESV'
    end
    object DokumentRUKOV_B: TStringField [71]
      FieldName = 'RUKOV_B'
      Size = 60
    end
    object DokumentSPEC: TStringField [72]
      FieldName = 'SPEC'
      Size = 60
    end
    object DokumentVOSSTAN: TBooleanField [73]
      FieldName = 'VOSSTAN'
    end
    object DokumentZAVIT: TMemoField [74]
      FieldName = 'ZAVIT'
      BlobType = ftMemo
    end
    object DokumentSUD_NAME: TMemoField [75]
      FieldName = 'SUD_NAME'
      BlobType = ftMemo
    end
    object DokumentSUD_DATE: TDateField [76]
      FieldName = 'SUD_DATE'
    end
    object DokumentID_ZAGS: TIntegerField [77]
      FieldName = 'ID_ZAGS'
    end
    object DokumentOTHER: TMemoField [78]
      FieldName = 'OTHER'
      BlobType = ftMemo
    end
    object DokumentIZMEN: TMemoField [79]
      FieldName = 'IZMEN'
      BlobType = ftMemo
    end
    object DokumentCOPIA: TBooleanField [80]
      FieldName = 'COPIA'
    end
    object DokumentMAT_DATER: TDateField [81]
      FieldName = 'MAT_DATER'
    end
    object DokumentMAT_SCHET: TSmallintField [82]
      FieldName = 'MAT_SCHET'
    end
    object DokumentVUS: TBooleanField [84]
      FieldName = 'VUS'
    end
    object DokumentSM_B_GOROD: TSmallintField
      FieldName = 'SM_B_GOROD'
    end
    object DokumentRG_B_GOROD: TSmallintField
      FieldName = 'RG_B_GOROD'
    end
    object DokumentGT_B_GOROD: TSmallintField
      FieldName = 'GT_B_GOROD'
    end
    object DokumentLICH_NOMER: TStringField
      FieldName = 'LICH_NOMER'
      Size = 14
    end
    object DokumentSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object DokumentPOLE_GRN: TSmallintField
      FieldName = 'POLE_GRN'
    end
    object DokumentTYPEMESSAGE: TStringField
      FieldName = 'TYPEMESSAGE'
      Size = 4
    end
    object DokumentTYPEREG: TSmallintField
      FieldName = 'TYPEREG'
    end
    object DokumentMESTO: TMemoField
      FieldName = 'MESTO'
      BlobType = ftMemo
    end
    object DokumentSPEC_B: TStringField
      FieldName = 'SPEC_B'
      Size = 60
    end
    object DokumentARX_ADRESAT: TMemoField
      FieldName = 'ARX_ADRESAT'
      BlobType = ftMemo
    end
    object DokumentSUD_SILA: TDateField
      FieldName = 'SUD_SILA'
    end
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 640
    Top = 82
  end
  inherited HistZAGS: TkbmMemTable
    Left = 672
    Top = 218
  end
  inherited dsSeria: TDataSource
    Left = 696
    Top = 138
  end
  inherited dsObl: TDataSource
    Left = 696
  end
  object dsGragd: TDataSource [14]
    Left = 652
    Top = 201
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 616
    Top = 202
  end
  inherited dsPovtor: TDataSource
    Left = 552
    Top = 210
  end
  inherited dsRN: TDataSource
    Left = 712
    Top = 226
  end
  inherited dsTypeGorod: TDataSource
    Left = 704
    Top = 90
  end
  inherited dsVoenkom: TDataSource
    Left = 736
    Top = 186
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 584
    Top = 90
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 280
    Top = 114
  end
end
