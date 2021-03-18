inherited fmAktZ: TfmAktZ
  Left = 431
  Top = 56
  ActiveControl = edINST_MN_NAME
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1080
  ClientHeight = 812
  ClientWidth = 939
  Constraints.MinHeight = 850
  Constraints.MinWidth = 955
  Icon.Data = {
    0000010001001010000001001800680300001600000028000000100000002000
    0000010018000000000000030000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFF000000000000000000000000FFFFFF000000000000000000
    000000000000000000000000000000000000000000FFFFFF0000000000000000
    00000000FFFFFFFFFFFF000000000000FFFFFF000000000000FFFFFF00000000
    0000FFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFF000000
    FFFFFF000000000000FFFFFF000000FFFFFFFFFFFFFFFFFF0000000000000000
    00000000FFFFFFFFFFFFFFFFFF000000FFFFFF000000000000FFFFFF000000FF
    FFFFFFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFF000000
    FFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFF0000000000000000
    00000000FFFFFFFFFFFFFFFFFF000000000000FFFFFF000000FFFFFF000000FF
    FFFFFFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
    000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0000000000000000
    00000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF000000FF
    FFFFFFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFF0000000000000000
    00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000003C21
    2D2D0A242827626F647927292E65712830292E6373732827776964746827290A
    2D2D3E0A}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 790
    Width = 939
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited pnTable: TPanel
    Top = 790
    Width = 939
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 939
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
          Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100
          OnClick = TBItemStep2Click
        end
      end
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      object TBItemNomerBook: TTBItem [19]
        Caption = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1085#1086#1084#1077#1088' '#1082#1085#1080#1075#1080
        Hint = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1085#1086#1084#1077#1088' '#1082#1085#1080#1075#1080
        ImageIndex = 45
        OnClick = TBItemNomerBookClick
      end
      inherited TBItemSeekAkt: TTBItem
        Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072
        Hint = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1087#1086' '#1085#1086#1084#1077#1088#1091' '#1080' '#1076#1072#1090#1077
      end
      inherited TBItemShablon: TTBItem
        Visible = True
      end
      inherited TBItemEditMemo: TTBItem
        Visible = True
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 391
        Width = 212
        Visible = True
        inherited edZAGS: TDBEditEh
          Width = 51
        end
        inherited N_F_cbGorod: TDBCheckBoxEh
          Left = 129
        end
      end
    end
  end
  inherited sb: TScrollBox
    Width = 939
    Height = 740
    Align = alClient
    inherited pnPovtor: TPanel
      TabOrder = 3
      inherited imBE: TImage
        Anchors = [akTop]
      end
    end
    object pn: TPanel
      Left = 0
      Top = 0
      Width = 939
      Height = 34
      Align = alTop
      TabOrder = 0
      DesignSize = (
        939
        34)
      object lbNomer: TLabel
        Left = 528
        Top = 11
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
      object lbDateZ: TLabel
        Left = 749
        Top = 11
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
      object ImageGISUN: TImage
        Left = 910
        Top = 6
        Width = 20
        Height = 20
        Anchors = [akTop, akRight]
        Transparent = True
      end
      object lbNomer2: TLabel
        Left = 632
        Top = 11
        Width = 6
        Height = 13
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label70: TLabel
        Left = 378
        Top = 11
        Width = 33
        Height = 13
        Caption = #1050#1085#1080#1075#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label71: TLabel
        Left = 6
        Top = 11
        Width = 37
        Height = 13
        Hint = #1052#1077#1089#1090#1086' '#1087#1086#1075#1088#1077#1073#1077#1085#1080#1103' ('#1082#1083#1072#1076#1073#1080#1097#1077')'
        Caption = #1052#1077#1089#1090#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNomer: TDBEditEh
        Left = 551
        Top = 4
        Width = 73
        Height = 26
        Hint = #1053#1086#1084#1077#1088' '#1079#1072#1087#1080#1089#1080' '#1074' '#1082#1085#1080#1075#1077
        DataField = 'NOMER'
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
      object edDateZ: TDBDateTimeEditEh
        Left = 775
        Top = 4
        Width = 110
        Height = 26
        Hint = #1044#1072#1090#1072' '#1079#1072#1087#1080#1089#1080' '#1074' '#1082#1085#1080#1075#1077
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
        TabOrder = 4
        Visible = True
        OnUpdateData = edDateZUpdateData
      end
      object edNOMER2: TDBEditEh
        Left = 648
        Top = 4
        Width = 94
        Height = 26
        Hint = #1043#1083#1086#1073#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
        HelpType = htKeyword
        HelpContext = 888
        DataField = 'NOMER2'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
      object edBook: TDBNumberEditEh
        Left = 422
        Top = 4
        Width = 92
        Height = 26
        Hint = #1053#1086#1084#1077#1088' '#1082#1085#1080#1075#1080
        TabStop = False
        DataField = 'BOOK'
        DataSource = dsDokument
        DecimalPlaces = 0
        EditButton.Hint = #1053#1086#1084#1077#1088' '#1082#1085#1080#1075#1080
        EditButton.Style = ebsUpDownEh
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxValue = 999999999.000000000000000000
        ParentFont = False
        PopupMenu = pm
        TabOrder = 1
        Visible = True
      end
      object edZH_KLAD: TDBLookupComboboxEh
        Left = 53
        Top = 4
        Width = 305
        Height = 26
        Hint = #1052#1077#1089#1090#1086' '#1087#1086#1075#1088#1077#1073#1077#1085#1080#1103' ('#1082#1083#1072#1076#1073#1080#1097#1077')'
        HelpContext = 888
        DataField = 'ZH_KLAD'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dsKlad
        ParentFont = False
        PopupMenu = pm
        TabOrder = 0
        Visible = True
        OnChange = edZH_KLADChange
      end
    end
    object pc: TPageControl
      Left = 0
      Top = 34
      Width = 939
      Height = 706
      ActivePage = tsAdd
      Align = alClient
      MultiLine = True
      TabOrder = 2
      TabStop = False
      OnChange = pcChange
      object ts1: TTabSheet
        Caption = #1054#1089#1085#1086#1074#1085#1086#1077
        ImageIndex = 1
        object pnTop: TPanel
          Left = 0
          Top = 0
          Width = 931
          Height = 139
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label19: TLabel
            Left = 6
            Top = 28
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
          object Label30: TLabel
            Left = 254
            Top = 28
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
          object Label31: TLabel
            Left = 423
            Top = 28
            Width = 59
            Height = 13
            Caption = #1054#1090#1095#1077#1089#1090#1074#1086' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label34: TLabel
            Left = 6
            Top = 59
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
          object lbDateS: TLabel
            Left = 607
            Top = 59
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
          object lbDateR: TLabel
            Left = 286
            Top = 59
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
          object lbVozr: TvchDBText
            Left = 872
            Top = 59
            Width = 35
            Height = 13
            AutoSize = True
            Color = clInfoBk
            DataField = 'VOZR'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            OnGetText = lbVozr_AktGetText
          end
          object Label29: TLabel
            Left = 657
            Top = 29
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
          object lbSector: TLabel
            Left = 6
            Top = 120
            Width = 42
            Height = 13
            Caption = #1057#1077#1082#1090#1086#1088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbRow: TLabel
            Left = 188
            Top = 120
            Width = 23
            Height = 13
            Caption = #1056#1103#1076
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbMogila: TLabel
            Left = 539
            Top = 120
            Width = 43
            Height = 13
            Caption = #1052#1086#1075#1080#1083#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label72: TLabel
            Left = 281
            Top = 90
            Width = 22
            Height = 13
            Caption = #1042#1080#1076
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label59: TLabel
            Left = 6
            Top = 90
            Width = 109
            Height = 13
            Caption = #1044#1072#1090#1072' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbPlace: TLabel
            Left = 313
            Top = 120
            Width = 105
            Height = 13
            Caption = #1059#1095#1072#1089#1090#1086#1082' ('#1086#1075#1088#1072#1076#1072')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object FIO_GISRN: TvchDBText
            Left = 39
            Top = 2
            Width = 350
            Height = 16
            Hint = #1060#1048#1054' '#1087#1086#1089#1090#1091#1087#1080#1074#1096#1077#1077' '#1080#1079' '#1043#1048#1057' '#1056#1053
            Color = clInfoBk
            Constraints.MaxWidth = 350
            DataField = 'Familia_GIS'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            OnGetText = FIO_GISRNGetText
          end
          object lbZh_Type: TLabel
            Left = 619
            Top = 90
            Width = 20
            Height = 13
            Caption = #1058#1080#1087
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object N_F_lbStatus: TvchDBText
            Left = 800
            Top = 2
            Width = 120
            Height = 16
            Hint = #1057#1090#1072#1090#1091#1089' '#1074' '#1043#1048#1057' '#1056#1053
            Alignment = taRightJustify
            Color = clBtnFace
            Constraints.MaxWidth = 350
            DataField = 'STATUS'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            OnGetText = N_F_lbStatusGetText
          end
          object edFamilia: TDBEditEh
            Left = 73
            Top = 22
            Width = 161
            Height = 26
            HelpType = htKeyword
            HelpContext = 888
            DataField = 'Familia'
            DataSource = dsDokument
            EditButtons = <
              item
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                  DDDDDDDDDDDDDDDDDDDDDD00000000000DDDDD08888888880DDDDD0888888888
                  0DDDDD08888F88880DDDDDD0888F8880DDDDDDDD00FFF00DDDDDDDDDDD000DDD
                  DDDDDDDDD07770DDDDDDDDDDD07770DDDDDDDDDDD07770DDDDDDDDDDD00000DD
                  DDDDDDDDDD000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
                Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1079'/'#1072' '#1086' '#1089#1084#1077#1088#1090#1080
                Style = ebsGlyphEh
                Width = 20
                OnClick = edFamiliaEditButtons0Click
              end
              item
                Hint = #1042#1099#1073#1088#1072#1090#1100
                Style = ebsGlyphEh
                Width = 20
                OnClick = edFamiliaEditButtons1Click
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
            Left = 291
            Top = 22
            Width = 112
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
            Left = 496
            Top = 22
            Width = 136
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
          object ENG_edIDENTIF: TDBEditEh
            Left = 101
            Top = 52
            Width = 155
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
            MRUList.Active = True
            ParentFont = False
            TabOrder = 4
            Visible = True
          end
          object edDateS: TDBDateTimeEditEh
            Left = 698
            Top = 52
            Width = 110
            Height = 26
            HelpKeyword = '4'
            DataField = 'DateS'
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
            OnUpdateData = edDateS_AktUpdateData
            EditFormat = 'DD/MM/YYYY'
          end
          object N_F_cbOnlyGod: TDBComboBoxEh
            Left = 813
            Top = 55
            Width = 26
            Height = 19
            TabStop = False
            DataField = 'ONLYGOD'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Flat = True
            Items.Strings = (
              #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080
              #1043#1086#1076' '#1089#1084#1077#1088#1090#1080
              #1052#1077#1089#1103#1094' '#1080' '#1075#1086#1076' '#1089#1084#1077#1088#1090#1080
              #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080' ('#1090#1077#1082#1089#1090')')
            KeyItems.Strings = (
              '0'
              '1'
              '2'
              '3')
            ParentFont = False
            TabOrder = 8
            Visible = True
            OnChange = N_F_cbOnlyGod_AktChange
          end
          object edTextDateS: TDBEditEh
            Left = 843
            Top = 52
            Width = 23
            Height = 26
            Hint = #1042#1074#1086#1076#1080#1090#1089#1103' '#1077#1089#1083#1080' '#1076#1072#1090#1072' '#1089#1084#1077#1088#1090#1080' '#1085#1077#1080#1079#1074#1077#1089#1090#1085#1072
            DataField = 'TEXT_DATES'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
            Visible = False
          end
          object edDateR: TDBDateTimeEditEh
            Left = 394
            Top = 52
            Width = 110
            Height = 26
            HelpKeyword = '4'
            DataField = 'DateR'
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
            OnUpdateData = edDateR_AktUpdateData
            EditFormat = 'DD/MM/YYYY'
          end
          object N_F_cbOnlyGodR: TDBComboBoxEh
            Left = 515
            Top = 56
            Width = 28
            Height = 19
            TabStop = False
            DataField = 'ONLYGOD_R'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Flat = True
            Items.Strings = (
              #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
              #1043#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
              #1052#1077#1089#1103#1094' '#1080' '#1075#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
              #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103'('#1090#1077#1082#1089#1090')')
            KeyItems.Strings = (
              '0'
              '1'
              '2'
              '3')
            ParentFont = False
            TabOrder = 5
            Visible = True
            OnChange = N_F_cbOnlyGodR_AktChange
          end
          object edTextVozr: TDBEditEh
            Left = 545
            Top = 52
            Width = 33
            Height = 26
            Hint = #1042#1074#1086#1076#1080#1090#1089#1103' '#1077#1089#1083#1080' '#1076#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103' '#1085#1077#1080#1079#1074#1077#1089#1090#1085#1072
            DataField = 'TEXT_VOZR'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            Visible = False
          end
          object edPol: TDBComboBoxEh
            Left = 693
            Top = 22
            Width = 106
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
          end
          object edSector: TDBEditEh
            Left = 62
            Top = 113
            Width = 80
            Height = 26
            DataField = 'ZH_UCH'
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
            OnCheckDrawRequiredState = edSectorCheckDrawRequiredState
            OnUpdateData = edSectorUpdateData
          end
          object edRow: TDBEditEh
            Left = 224
            Top = 113
            Width = 62
            Height = 26
            DataField = 'ZH_RAD'
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
            OnCheckDrawRequiredState = edRowCheckDrawRequiredState
          end
          object edMogila: TDBEditEh
            Left = 594
            Top = 113
            Width = 79
            Height = 26
            DataField = 'ZH_MOG'
            DataSource = dsDokument
            EditButtons = <
              item
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00E5E5E500BFBFBF009F9F9F0088888800888888009F9F
                  9F00BFBFBF00E5E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00CDCDCD00969696009E9E9E00ACACAC00B5B5B500B5B5B500ACAC
                  AC009E9E9E0096969600CDCDCD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00CFCFCF008E8E8E00ACACAC00B4B4B400B4B4B400B4B4B400B4B4B400B4B4
                  B400B4B4B400ACACAC008E8E8E00CFCFCF00FFFFFF00FFFFFF00FFFFFF00E8E8
                  E800A0A0A000A9A9A900AFAFAF00AFAFAF005F5F5F00ACACAC00AFAFAF00AFAF
                  AF00AFAFAF00AFAFAF00A9A9A900A0A0A000E8E8E800FFFFFF00FFFFFF00C8C8
                  C8009E9E9E00A9A9A900A9A9A900A9A9A90000000000494949009C9C9C00A9A9
                  A900A9A9A900A9A9A900A9A9A9009E9E9E00C8C8C800FFFFFF00FFFFFF00B1B1
                  B100A0A0A000A3A3A300A3A3A300A3A3A3000000000000000000242424007C7C
                  7C00A3A3A300A3A3A300A3A3A300A0A0A000B1B1B100FFFFFF00FFFFFF00A4A4
                  A4009D9D9D009D9D9D009D9D9D009D9D9D000000000000000000000000000707
                  0700545454009D9D9D009D9D9D009D9D9D00A4A4A400FFFFFF00FFFFFF00A8A8
                  A800979797009696960096969600969696000000000000000000000000000606
                  06004F4F4F00969696009696960097979700A8A8A800FFFFFF00FFFFFF00BDBD
                  BD009696960090909000909090009090900000000000000000001F1F1F006D6D
                  6D0090909000909090009090900096969600BDBDBD00FFFFFF00FFFFFF00D6D6
                  D6009B9B9B008A8A8A008A8A8A008A8A8A00000000003A3A3A007F7F7F008A8A
                  8A008A8A8A008A8A8A008A8A8A009B9B9B00D6D6D600FFFFFF00FFFFFF00EFEF
                  EF00BEBEBE008D8D8D0085858500858585004747470082828200858585008585
                  850085858500858585008D8D8D00BEBEBE00EFEFEF00FFFFFF00FFFFFF00FFFF
                  FF00E2E2E200BABABA008A8A8A00808080008080800080808000808080008080
                  8000808080008A8A8A00BABABA00E2E2E200FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00E3E3E300C5C5C5009B9B9B008B8B8B0080808000808080008B8B
                  8B009B9B9B00C5C5C500E3E3E300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00F2F2F200DEDEDE00CECECE00C2C2C200C2C2C200CECE
                  CE00DEDEDE00F2F2F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
                Hint = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1085#1086#1084#1077#1088' '#1084#1086#1075#1080#1083#1099' (Insert)'
                ShortCut = 45
                Style = ebsGlyphEh
                Width = 24
                OnClick = edMogilaEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
            Visible = True
            OnCheckDrawRequiredState = edMogilaCheckDrawRequiredState
          end
          object edZH_Vid: TDBComboBoxEh
            Left = 319
            Top = 83
            Width = 254
            Height = 26
            DataField = 'ZH_VID'
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
          end
          object edDateZAH: TDBDateTimeEditEh
            Left = 132
            Top = 83
            Width = 110
            Height = 26
            DataField = 'DATEZH'
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
            OnUpdateData = edDateZAHUpdateData
          end
          object edPlace: TDBEditEh
            Left = 432
            Top = 113
            Width = 81
            Height = 26
            DataField = 'ZH_UCH2'
            DataSource = dsDokument
            EditButtons = <
              item
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00E5E5E500BFBFBF009F9F9F0088888800888888009F9F
                  9F00BFBFBF00E5E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00CDCDCD00969696009E9E9E00ACACAC00B5B5B500B5B5B500ACAC
                  AC009E9E9E0096969600CDCDCD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00CFCFCF008E8E8E00ACACAC00B4B4B400B4B4B400B4B4B400B4B4B400B4B4
                  B400B4B4B400ACACAC008E8E8E00CFCFCF00FFFFFF00FFFFFF00FFFFFF00E8E8
                  E800A0A0A000A9A9A900AFAFAF00AFAFAF005F5F5F00ACACAC00AFAFAF00AFAF
                  AF00AFAFAF00AFAFAF00A9A9A900A0A0A000E8E8E800FFFFFF00FFFFFF00C8C8
                  C8009E9E9E00A9A9A900A9A9A900A9A9A90000000000494949009C9C9C00A9A9
                  A900A9A9A900A9A9A900A9A9A9009E9E9E00C8C8C800FFFFFF00FFFFFF00B1B1
                  B100A0A0A000A3A3A300A3A3A300A3A3A3000000000000000000242424007C7C
                  7C00A3A3A300A3A3A300A3A3A300A0A0A000B1B1B100FFFFFF00FFFFFF00A4A4
                  A4009D9D9D009D9D9D009D9D9D009D9D9D000000000000000000000000000707
                  0700545454009D9D9D009D9D9D009D9D9D00A4A4A400FFFFFF00FFFFFF00A8A8
                  A800979797009696960096969600969696000000000000000000000000000606
                  06004F4F4F00969696009696960097979700A8A8A800FFFFFF00FFFFFF00BDBD
                  BD009696960090909000909090009090900000000000000000001F1F1F006D6D
                  6D0090909000909090009090900096969600BDBDBD00FFFFFF00FFFFFF00D6D6
                  D6009B9B9B008A8A8A008A8A8A008A8A8A00000000003A3A3A007F7F7F008A8A
                  8A008A8A8A008A8A8A008A8A8A009B9B9B00D6D6D600FFFFFF00FFFFFF00EFEF
                  EF00BEBEBE008D8D8D0085858500858585004747470082828200858585008585
                  850085858500858585008D8D8D00BEBEBE00EFEFEF00FFFFFF00FFFFFF00FFFF
                  FF00E2E2E200BABABA008A8A8A00808080008080800080808000808080008080
                  8000808080008A8A8A00BABABA00E2E2E200FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00E3E3E300C5C5C5009B9B9B008B8B8B0080808000808080008B8B
                  8B009B9B9B00C5C5C500E3E3E300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00F2F2F200DEDEDE00CECECE00C2C2C200C2C2C200CECE
                  CE00DEDEDE00F2F2F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
                Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1074#1089#1077#1093' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1085#1099#1093' '#1085#1072' '#1091#1095#1072#1089#1090#1082#1077' (Insert)'
                ShortCut = 45
                Style = ebsGlyphEh
                Width = 24
                OnClick = edPlaceEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 16
            Visible = True
            OnCheckDrawRequiredState = edPlaceCheckDrawRequiredState
            OnKeyDown = edPlaceKeyDown
          end
          object edZH_TYPE: TDBComboBoxEh
            Left = 655
            Top = 83
            Width = 189
            Height = 26
            DataField = 'ZH_TYPE'
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
            OnChange = edZH_TYPEChange
          end
          object N_F_cbLoadCheck: TComboBox
            Left = 814
            Top = 25
            Width = 110
            Height = 21
            Hint = #1055#1077#1088#1077#1082#1083#1102#1095#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' Ctrl-F1'
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 18
            TabStop = False
            Text = #1085#1077' '#1087#1088#1086#1074#1077#1088#1077#1085#1086
            OnChange = N_F_cbLoadCheckChange
            Items.Strings = (
              #1085#1077' '#1087#1088#1086#1074#1077#1088#1077#1085#1086
              #1087#1088#1086#1074#1077#1088#1077#1085#1086)
          end
          object btLoadFIO: TBitBtn
            Left = 11
            Top = 2
            Width = 20
            Height = 19
            Hint = #1047#1072#1087#1080#1089#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1043#1048#1057' '#1056#1053' '#1074' '#1087#1086#1083#1103' '#1060#1048#1054
            TabOrder = 19
            OnClick = btLoadFIOClick
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000CF6F3F60000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000DF8F5F40A05830FFAF4F1F500000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000DF8F5F40D07040FFD05820FF904820FFAF4F
              1F50000000000000000000000000000000000000000000000000000000000000
              00000000000000000000DF8F5F40D07840FFFF9860FFF07830FFD05820FF9048
              20FFAF4F1F400000000000000000000000000000000000000000000000000000
              000000000000EF8F5F30DF7F4FF0FFB890FFFFA870FFFF9860FFF07830FFD058
              20FF904820FF9F471F4000000000000000000000000000000000000000000000
              0000EF8F5F20E08860FFFFC0A0FFFFC0A0FFFFB890FFFFA870FFFF9860FFE088
              50FFD07040FF904820FFAF4F1F5000000000000000000000000000000000DF8F
              5F20E09870FFE09870FFE09870FFE09060FFFFC0A0FFFFB890FFFFA870FFD058
              20FFD06020FFE06830FFE06830FFAF461F500000000000000000000000000000
              0000000000000000000000000000F0A880FFFFC0A0FFFFC0A0FFFFB890FFE070
              30FF000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000F0A880FFFFC0A0FFFFC0A0FFFFB890FFE070
              30FF000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000F0B090FFE0A070FFE09060FFE08050FFE070
              40FF000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000}
          end
        end
        object pnKlum: TPanel
          Left = 0
          Top = 139
          Width = 931
          Height = 31
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object lbSklep: TLabel
            Left = 736
            Top = 11
            Width = 35
            Height = 13
            Caption = #1057#1082#1083#1077#1087
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbKlum: TLabel
            Left = 6
            Top = 11
            Width = 151
            Height = 13
            Caption = #1050#1086#1083#1091#1084#1073#1072#1088#1080#1081' ('#1089#1090#1077#1085#1072'/'#1085#1080#1096#1072')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbKlum2: TLabel
            Left = 260
            Top = 9
            Width = 6
            Height = 13
            Caption = '/'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbKlumStakan: TLabel
            Left = 381
            Top = 11
            Width = 223
            Height = 13
            Caption = #1057#1090#1072#1082#1072#1085' '#1074' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086#1084' '#1082#1086#1083#1091#1084#1073#1072#1088#1080#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edSklep: TDBEditEh
            Left = 782
            Top = 4
            Width = 84
            Height = 26
            DataField = 'ZH_SKLEP'
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
          object edKlum: TDBEditEh
            Left = 273
            Top = 4
            Width = 84
            Height = 26
            Hint = #1053#1086#1084#1077#1088' '#1082#1083#1091#1084#1073#1072#1088#1085#1086#1081' '#1085#1080#1096#1080
            DataField = 'ZH_KLUM'
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
          object edStenaKlum: TDBEditEh
            Left = 170
            Top = 4
            Width = 84
            Height = 26
            Hint = #1053#1086#1084#1077#1088' '#1082#1083#1091#1084#1073#1072#1088#1085#1086#1081' '#1089#1090#1077#1085#1099
            DataField = 'ZH_ST_KLUM'
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
          object edKlumStakan: TDBEditEh
            Left = 619
            Top = 4
            Width = 84
            Height = 26
            DataField = 'ZH_STAKAN'
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
        object pnBotton: TPanel
          Left = 0
          Top = 203
          Width = 931
          Height = 478
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          object gbDecl: TGroupBox
            Left = 0
            Top = 28
            Width = 931
            Height = 214
            Align = alTop
            Caption = ' '#1047#1072#1103#1074#1080#1090#1077#1083#1100' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label38: TLabel
              Left = 12
              Top = 19
              Width = 190
              Height = 13
              Caption = #1060#1072#1084#1080#1083#1080#1103', '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1077' '#1080#1084#1103', '#1086#1090#1095#1077#1089#1090#1074#1086
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label40: TLabel
              Left = 15
              Top = 48
              Width = 118
              Height = 13
              Caption = #1058#1077#1083#1077#1092#1086#1085'       '#1075#1086#1088#1086#1076#1089#1082#1086#1081
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label41: TLabel
              Left = 336
              Top = 48
              Width = 56
              Height = 13
              Caption = #1084#1086#1073#1080#1083#1100#1085#1099#1081
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbGT: TLabel
              Left = 30
              Top = 106
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
            object lbGT_OBL: TLabel
              Left = 478
              Top = 106
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
            object lbGT_RN: TLabel
              Left = 132
              Top = 133
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
            object lbGT_GOR: TLabel
              Left = 478
              Top = 133
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
            object lbGT_RNG: TLabel
              Left = 29
              Top = 161
              Width = 69
              Height = 13
              Caption = #1088#1072#1081#1086#1085' '#1075#1086#1088#1086#1076#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object Label48: TLabel
              Left = 19
              Top = 125
              Width = 82
              Height = 13
              Caption = #1082#1086#1076' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object lbGT_DOM: TLabel
              Left = 480
              Top = 161
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
            object lbGT_KORP: TLabel
              Left = 573
              Top = 161
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
            object lbGT_KV: TLabel
              Left = 679
              Top = 161
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
            object Label67: TLabel
              Left = 12
              Top = 90
              Width = 112
              Height = 13
              Caption = #1052#1077#1089#1090#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbGT_UL: TLabel
              Left = 146
              Top = 161
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
            object Label74: TLabel
              Left = 616
              Top = 48
              Width = 120
              Height = 13
              Caption = #1042#1099#1076#1072#1085#1086' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1077#1085#1080#1077
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label21: TLabel
              Left = 144
              Top = 76
              Width = 192
              Height = 13
              Caption = #1042#1099#1076#1072#1085#1072' '#1089#1087#1088#1072#1074#1082#1072' '#1086' '#1084#1077#1089#1090#1077' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label32: TLabel
              Left = 481
              Top = 77
              Width = 67
              Height = 13
              Caption = #1076#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label57: TLabel
              Left = 20
              Top = 190
              Width = 50
              Height = 13
              Caption = #1044#1086#1082#1091#1084#1077#1085#1090
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edDecl: TDBEditEh
              Left = 219
              Top = 12
              Width = 471
              Height = 26
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
                  Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072' '#1085#1072#1089#1077#1083#1077#1085#1080#1103
                  Style = ebsGlyphEh
                  Width = 20
                  OnClick = edDeclEditButtons0Click
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Visible = True
              OnUpdateData = edDeclUpdateData
            end
            object edDECL_TEL: TDBEditEh
              Left = 147
              Top = 41
              Width = 161
              Height = 26
              DataField = 'DECL_TEL'
              DataSource = dsDokument
              EditButtons = <
                item
                  Hint = #1042#1099#1073#1088#1072#1090#1100
                  Style = ebsGlyphEh
                  Visible = False
                  Width = 20
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Visible = True
            end
            object edDECL_MOB: TDBEditEh
              Left = 408
              Top = 41
              Width = 161
              Height = 26
              DataField = 'DECL_MOB'
              DataSource = dsDokument
              EditButtons = <
                item
                  Hint = #1042#1099#1073#1088#1072#1090#1100
                  Style = ebsGlyphEh
                  Visible = False
                  Width = 20
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Visible = True
            end
            object edGT_GOSUD: TDBLookupComboboxEh
              Left = 183
              Top = 99
              Width = 258
              Height = 26
              DataField = 'GT_GOSUD'
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
              TabOrder = 7
              Visible = True
            end
            object cbGT_B_OBL: TDBCheckBoxEh
              Left = 565
              Top = 104
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
              TabOrder = 8
              TabStop = False
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object edGT_GOROD: TDBEditEh
              Left = 643
              Top = 126
              Width = 165
              Height = 26
              DataField = 'GT_GOROD'
              DataSource = dsDokument
              EditButtons = <
                item
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 12
              Visible = True
            end
            object edGT_RNGOROD: TDBLookupComboboxEh
              Left = 809
              Top = 154
              Width = 40
              Height = 26
              DataField = 'GT_RNGOROD'
              DataSource = dsDokument
              DropDownBox.Rows = 15
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'R_NAME'
              ListField = 'R_NAME'
              ListSource = dsRnGor
              ParentFont = False
              Style = csDropDownEh
              TabOrder = 13
              Visible = False
            end
            object edGT_B_GOROD: TDBLookupComboboxEh
              Left = 586
              Top = 126
              Width = 46
              Height = 26
              Alignment = taRightJustify
              DataField = 'GT_B_GOROD'
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
              TabOrder = 11
              Visible = True
            end
            object edGT_OBL: TDBEditEh
              Left = 586
              Top = 99
              Width = 222
              Height = 26
              DataField = 'GT_OBL'
              DataSource = dsDokument
              EditButtons = <
                item
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
              Visible = True
            end
            object edGT_RAION: TDBEditEh
              Left = 183
              Top = 126
              Width = 258
              Height = 26
              DataField = 'GT_RAION'
              DataSource = dsDokument
              EditButtons = <
                item
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 10
              Visible = True
            end
            object edGT_GOROD_R: TDBEditEh
              Left = 182
              Top = 154
              Width = 258
              Height = 26
              DataField = 'GT_GOROD_R'
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
            object edGT_DOM: TDBEditEh
              Left = 506
              Top = 154
              Width = 47
              Height = 26
              DataField = 'GT_DOM'
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
            object edGT_KORP: TDBEditEh
              Left = 607
              Top = 154
              Width = 47
              Height = 26
              DataField = 'GT_KORP'
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
            object edGT_KV: TDBEditEh
              Left = 700
              Top = 154
              Width = 47
              Height = 26
              DataField = 'GT_KV'
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
            object N_F_IsOrg: TDBCheckBoxEh
              Left = 793
              Top = 16
              Width = 97
              Height = 17
              Caption = #1070#1088'. '#1083#1080#1094#1086
              DataField = 'IS_ORG'
              DataSource = dsDokument
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 19
              TabStop = False
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object edUdost: TDBEditEh
              Left = 744
              Top = 41
              Width = 124
              Height = 26
              DataField = 'UDOST'
              DataSource = dsDokument
              EditButtons = <
                item
                  Hint = #1042#1099#1073#1088#1072#1090#1100
                  Style = ebsGlyphEh
                  Visible = False
                  Width = 20
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              Visible = True
            end
            object edGT_TEXT: TDBEditEh
              Left = 13
              Top = 140
              Width = 68
              Height = 26
              DataField = 'GT_TEXT'
              DataSource = dsDokument
              EditButtons = <
                item
                  Hint = #1042#1099#1073#1088#1072#1090#1100
                  Style = ebsGlyphEh
                  Visible = False
                  Width = 20
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              Visible = False
            end
            object N_F_cbGT_IS_TEXT: TDBCheckBoxEh
              Left = 829
              Top = 101
              Width = 66
              Height = 17
              Hint = #1042#1074#1077#1089#1090#1080' '#1072#1076#1088#1077#1089' '#1074' '#1074#1080#1076#1077' '#1086#1076#1085#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1090#1077#1082#1089#1090#1072
              Caption = #1089#1090#1088#1086#1082#1072
              DataField = 'GT_IS_TEXT'
              DataSource = dsDokument
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 20
              TabStop = False
              ValueChecked = 'True'
              ValueUnchecked = 'False'
              OnClick = N_F_cbGT_IS_TEXTClick
            end
            object edSprNomer: TDBEditEh
              Left = 352
              Top = 70
              Width = 102
              Height = 26
              DataField = 'SPR_NOMER'
              DataSource = dsDokument
              EditButtons = <
                item
                  Hint = #1042#1099#1073#1088#1072#1090#1100
                  Style = ebsGlyphEh
                  Visible = False
                  Width = 20
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
            object edSprDate: TDBDateTimeEditEh
              Left = 559
              Top = 70
              Width = 110
              Height = 26
              HelpKeyword = '4'
              DataField = 'SPR_DATE'
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
              OnUpdateData = edDateR_AktUpdateData
              EditFormat = 'DD/MM/YYYY'
            end
            object edDeclDok: TDBEditEh
              Left = 182
              Top = 183
              Width = 733
              Height = 26
              Hint = #1044#1086#1082#1091#1084#1077#1085#1090' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1080#1081' '#1083#1080#1095#1085#1086#1089#1090#1100
              DataField = 'DECL_DOK'
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
                  Hint = #1042#1074#1077#1089#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
                  Style = ebsEllipsisEh
                  Width = 20
                  OnClick = edDeclDokEditButtons0Click
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 18
              Visible = True
              OnUpdateData = edDeclUpdateData
            end
          end
          object pcZah: TPageControl
            Left = 0
            Top = 242
            Width = 931
            Height = 111
            ActivePage = tsAllZah
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object tsAllZah: TTabSheet
              Caption = #1047#1072#1093#1086#1088#1086#1085#1077#1085#1080#1103' '#1085#1072' '#1091#1095#1072#1089#1090#1082#1077
              ImageIndex = 1
              object GridAllMen: TDBGridEh
                Left = 0
                Top = 0
                Width = 923
                Height = 83
                Align = alClient
                AllowedOperations = [alopUpdateEh]
                Ctl3D = True
                DataSource = dsAllZah
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
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnGetCellParams = GridAllMenGetCellParams
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'POLE_GRN'
                    Footers = <>
                    ImageList = ImGISUN
                    ReadOnly = True
                    Title.Caption = ' '
                    Width = 24
                    OnGetCellParams = GridAllMenColumns0GetCellParams
                  end
                  item
                    EditButtons = <>
                    FieldName = 'FAMILIA'
                    Footers = <>
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = #1060#1072#1084#1080#1083#1080#1103
                    Width = 127
                  end
                  item
                    EditButtons = <>
                    FieldName = 'NAME'
                    Footers = <>
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = #1048#1084#1103
                    Width = 105
                  end
                  item
                    EditButtons = <>
                    FieldName = 'OTCH'
                    Footers = <>
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
                    Width = 106
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'DATER'
                    Footers = <>
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
                    Visible = False
                    Width = 85
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'DATES'
                    Footers = <>
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080
                    Width = 80
                  end
                  item
                    EditButtons = <>
                    FieldName = 'BOOK'
                    Footers = <>
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = #1050#1085#1080#1075#1072
                    Width = 50
                  end
                  item
                    Alignment = taRightJustify
                    EditButtons = <>
                    FieldName = 'NOMER'
                    Footers = <>
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = #1053#1086#1084#1077#1088
                    Width = 66
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'DATEZ'
                    Footers = <>
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = #1044#1072#1090#1072' '#1079#1072#1087#1080#1089#1080
                    Width = 82
                  end
                  item
                    Alignment = taRightJustify
                    EditButtons = <>
                    FieldName = 'ZH_MOG'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1052#1086#1075#1080#1083#1072
                    Width = 68
                  end>
              end
            end
            object tsBron: TTabSheet
              Caption = #1041#1088#1086#1085#1100
              object Panel1: TPanel
                Left = 882
                Top = 0
                Width = 41
                Height = 83
                Align = alRight
                BevelOuter = bvNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object btAdd: TBitBtn
                  Left = 6
                  Top = 4
                  Width = 28
                  Height = 28
                  Hint = #1044#1086#1073#1072#1074#1080#1090#1100
                  TabOrder = 0
                  TabStop = False
                  OnClick = btAddClick
                end
                object btDel: TBitBtn
                  Left = 6
                  Top = 37
                  Width = 28
                  Height = 28
                  Hint = #1059#1076#1072#1083#1080#1090#1100
                  TabOrder = 1
                  TabStop = False
                  OnClick = btDelClick
                end
              end
              object GridAddMen: TDBGridEh
                Left = 0
                Top = 0
                Width = 882
                Height = 83
                Align = alClient
                Ctl3D = True
                DataSource = dsAddMen
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
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'OTNOSHS'
                    Footers = <>
                    MRUList.AutoAdd = False
                    MRUList.Active = True
                    MRUList.Items.Strings = (
                      #1084#1091#1078
                      #1078#1077#1085#1072
                      #1089#1099#1085
                      #1076#1086#1095#1100
                      #1086#1090#1077#1094
                      #1084#1072#1090#1100
                      #1073#1072#1073#1091#1096#1082#1072
                      #1076#1077#1076#1091#1096#1082#1072
                      #1074#1085#1091#1082
                      #1074#1085#1091#1095#1082#1072)
                    MRUList.Rows = 12
                    Title.Alignment = taCenter
                    Title.Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077
                    Width = 116
                  end
                  item
                    EditButtons = <>
                    FieldName = 'FAMILIA'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1060#1072#1084#1080#1083#1080#1103
                    Width = 178
                  end
                  item
                    EditButtons = <>
                    FieldName = 'NAME'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1048#1084#1103
                    Width = 148
                  end
                  item
                    EditButtons = <>
                    FieldName = 'OTCH'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
                    Width = 144
                  end>
              end
            end
          end
          object pnEnd: TPanel
            Left = 0
            Top = 353
            Width = 931
            Height = 123
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 3
            object Label58: TLabel
              Left = 6
              Top = 14
              Width = 305
              Height = 13
              Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1086#1082#1072#1079#1099#1074#1072#1102#1097#1072#1103' '#1091#1089#1083#1091#1075#1080' '#1087#1086' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1102
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label63: TLabel
              Left = 6
              Top = 44
              Width = 62
              Height = 13
              Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label65: TLabel
              Left = 289
              Top = 44
              Width = 36
              Height = 13
              Caption = #1042#1088#1077#1084#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label64: TLabel
              Left = 512
              Top = 44
              Width = 62
              Height = 13
              Caption = #1050#1074#1080#1090#1072#1085#1094#1080#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbRukov: TvchDBText
              Left = 0
              Top = 73
              Width = 616
              Height = 15
              Alignment = taRightJustify
              DataField = 'DOLG_RUKOV'
              DataSource = dsDokument
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object lbSpec: TvchDBText
              Left = 0
              Top = 101
              Width = 616
              Height = 15
              Alignment = taRightJustify
              DataField = 'DOLG_SPEC'
              DataSource = dsDokument
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object edUslug1: TDBEditEh
              Left = 0
              Top = 63
              Width = 40
              Height = 26
              DataField = 'USLUG'
              DataSource = dsDokument
              EditButtons = <
                item
                  Hint = #1042#1099#1073#1088#1072#1090#1100
                  Style = ebsGlyphEh
                  Visible = False
                  Width = 20
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Visible = False
            end
            object edTRAN_VID: TDBEditEh
              Left = 80
              Top = 37
              Width = 171
              Height = 26
              DataField = 'TRAN_VID'
              DataSource = dsDokument
              EditButtons = <
                item
                  Hint = #1042#1099#1073#1088#1072#1090#1100
                  Style = ebsGlyphEh
                  Visible = False
                  Width = 20
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Visible = True
            end
            object edTRAN_TIME: TDBDateTimeEditEh
              Left = 340
              Top = 37
              Width = 124
              Height = 26
              Alignment = taLeftJustify
              DataField = 'TRAN_TIME'
              DataSource = dsDokument
              EditButton.Visible = False
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              Visible = True
              EditFormat = 'HH '#1095#1072#1089'. NN '#1084#1080#1085'.'
            end
            object edKVIT: TDBEditEh
              Left = 590
              Top = 37
              Width = 136
              Height = 26
              DataField = 'KVIT'
              DataSource = dsDokument
              EditButtons = <
                item
                  Hint = #1042#1099#1073#1088#1072#1090#1100
                  Style = ebsGlyphEh
                  Visible = False
                  Width = 20
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
            object edRukov: TDBEditEh
              Left = 637
              Top = 66
              Width = 245
              Height = 26
              HelpContext = 999
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
              TabOrder = 5
              Visible = True
              OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
              OnEnter = edRukov_AktEnter
            end
            object edSpec: TDBEditEh
              Left = 637
              Top = 94
              Width = 246
              Height = 26
              HelpContext = 999
              DataField = 'SPEC'
              DataSource = dsDokument
              EditButtons = <
                item
                  Hint = #1042#1099#1073#1088#1072#1090#1100
                  Style = ebsEllipsisEh
                  OnClick = edSpecEditButtons0Click
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              Visible = True
              OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
              OnEnter = edRukov_AktEnter
            end
            object edUslug: TDBEditEh
              Left = 328
              Top = 7
              Width = 593
              Height = 21
              DataField = 'USLUG'
              DataSource = dsDokument
              EditButtons = <
                item
                  Style = ebsEllipsisEh
                end
                item
                  Style = ebsGlyphEh
                  OnClick = edUslugEditButtons1Click
                end>
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Visible = True
            end
          end
          object pnSvid: TPanel
            Left = 0
            Top = 0
            Width = 931
            Height = 28
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              931
              28)
            object Label53: TLabel
              Left = 6
              Top = 8
              Width = 145
              Height = 13
              Caption = #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086' '#1086' '#1089#1084#1077#1088#1090#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label60: TLabel
              Left = 159
              Top = 8
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
            object Label61: TLabel
              Left = 316
              Top = 8
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
            object Label62: TLabel
              Left = 471
              Top = 8
              Width = 39
              Height = 13
              Caption = #1074#1099#1076#1072#1085#1086
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edSVID_NOMER: TDBEditEh
              Left = 177
              Top = 1
              Width = 126
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
              TabOrder = 0
              Visible = True
            end
            object edSVID_DATE: TDBDateTimeEditEh
              Left = 340
              Top = 1
              Width = 119
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
              TabOrder = 1
              Visible = True
            end
            object edSVID_ZAGS: TDBEditEh
              Left = 525
              Top = 1
              Width = 401
              Height = 26
              Anchors = [akLeft, akTop, akRight]
              DataField = 'SVID_ZAGS'
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
              OnCheckDrawRequiredState = edZAGSCheckDrawRequiredState
            end
          end
        end
        object pnZahRazm: TPanel
          Left = 0
          Top = 170
          Width = 931
          Height = 33
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object lbMogType: TLabel
            Left = 6
            Top = 10
            Width = 76
            Height = 13
            Caption = #1047#1072#1093#1086#1088#1086#1085#1077#1085#1080#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbRazmer1: TLabel
            Left = 392
            Top = 10
            Width = 42
            Height = 13
            Caption = #1056#1072#1079#1084#1077#1088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbRazmer2: TLabel
            Left = 517
            Top = 10
            Width = 6
            Height = 13
            Caption = #1061
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edMOG_TYPE: TDBLookupComboboxEh
            Left = 95
            Top = 3
            Width = 265
            Height = 26
            DataField = 'MOG_TYPE'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsNameZah
            ParentFont = False
            TabOrder = 0
            Visible = True
            OnChange = edMOG_TYPEChange
          end
          object edMOG_L: TDBNumberEditEh
            Left = 446
            Top = 3
            Width = 64
            Height = 26
            DataField = 'MOG_L'
            DataSource = dsDokument
            DecimalPlaces = 1
            DisplayFormat = '0.0'
            EditButton.Style = ebsUpDownEh
            EditButton.Visible = True
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            Increment = 0.100000000000000000
            MaxValue = 99.000000000000000000
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
          object edMOG_W: TDBNumberEditEh
            Left = 531
            Top = 3
            Width = 64
            Height = 26
            DataField = 'MOG_W'
            DataSource = dsDokument
            DecimalPlaces = 1
            DisplayFormat = '0.0'
            EditButton.Style = ebsUpDownEh
            EditButton.Visible = True
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            Increment = 0.100000000000000000
            MaxValue = 99.000000000000000000
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
          object N_F_Rez: TDBCheckBoxEh
            Left = 638
            Top = 8
            Width = 81
            Height = 17
            Caption = #1056#1077#1079#1077#1088#1074
            DataField = 'ZH_BRON'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object N_F_cbBron: TDBCheckBoxEh
            Left = 750
            Top = 8
            Width = 177
            Height = 17
            Caption = #1047#1072#1093#1086#1088#1086#1085#1077#1085#1080#1077' '#1087#1086' '#1073#1088#1086#1085#1080
            DataField = 'BRON'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
      end
      object tsAkt: TTabSheet
        Caption = #1040#1082#1090
        DesignSize = (
          931
          678)
        object Label1: TLabel
          Left = 6
          Top = 8
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
          Left = 263
          Top = 8
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
          Left = 451
          Top = 8
          Width = 59
          Height = 13
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 700
          Top = 7
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
        object lbDateR_Akt: TLabel
          Left = 296
          Top = 38
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
        object lbDateS_Akt: TLabel
          Left = 10
          Top = 224
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
        object Label24: TLabel
          Left = 10
          Top = 143
          Width = 126
          Height = 13
          Caption = #1055#1088#1080#1095#1080#1085#1072' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 424
          Top = 356
          Width = 147
          Height = 13
          Caption = #1044#1086#1082'. '#1087#1086#1076#1090#1074'. '#1092#1072#1082#1090' '#1089#1084#1077#1088#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label55: TLabel
          Left = 10
          Top = 384
          Width = 103
          Height = 13
          Caption = #1057#1087#1088#1072#1074#1082#1072' '#1086' '#1089#1084#1077#1088#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 218
          Top = 384
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
        object Label20: TLabel
          Left = 10
          Top = 356
          Width = 92
          Height = 13
          Caption = #1055#1088#1080#1095#1080#1085#1072' '#1089#1084#1077#1088#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbRukov_Akt: TvchDBText
          Left = 9
          Top = 563
          Width = 572
          Height = 16
          Alignment = taRightJustify
          DataField = 'DOLG_RUKOV'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label5: TLabel
          Left = 367
          Top = 533
          Width = 45
          Height = 13
          Caption = #8470' '#1072#1082#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 503
          Top = 533
          Width = 77
          Height = 13
          Caption = #1072#1082#1090' '#1089#1086#1089#1090#1072#1074#1080#1083
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbSpec_Akt: TvchDBText
          Left = 9
          Top = 590
          Width = 572
          Height = 16
          Alignment = taRightJustify
          DataField = 'DOLG_SPEC'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label18: TLabel
          Left = 367
          Top = 384
          Width = 47
          Height = 13
          Caption = #1074#1099#1076#1072#1085#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label66: TLabel
          Left = 6
          Top = 38
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
        object Label6: TLabel
          Left = 5
          Top = 503
          Width = 109
          Height = 13
          Caption = #1057#1087#1077#1094'. '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 640
          Top = 503
          Width = 24
          Height = 13
          Caption = #1059#1053#1055
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edFamilia_Akt: TDBEditEh
          Left = 73
          Top = 2
          Width = 161
          Height = 26
          HelpType = htKeyword
          HelpContext = 888
          DataField = 'Familia'
          DataSource = dsDokument
          EditButtons = <
            item
              Hint = #1042#1099#1073#1088#1072#1090#1100
              Style = ebsGlyphEh
              Visible = False
              Width = 20
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
        object edName_Akt: TDBEditEh
          Left = 300
          Top = 2
          Width = 126
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
        object edOtch_Akt: TDBEditEh
          Left = 524
          Top = 2
          Width = 155
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
        object edDateR_Akt: TDBDateTimeEditEh
          Left = 404
          Top = 31
          Width = 110
          Height = 26
          HelpKeyword = '4'
          DataField = 'DateR'
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
          OnUpdateData = edDateR_AktUpdateData
          EditFormat = 'DD/MM/YYYY'
        end
        object edPol_Akt: TDBComboBoxEh
          Left = 736
          Top = 1
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
        end
        object edDateS_Akt: TDBDateTimeEditEh
          Left = 109
          Top = 217
          Width = 110
          Height = 26
          HelpKeyword = '4'
          DataField = 'DateS'
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
          OnUpdateData = edDateS_AktUpdateData
          EditFormat = 'DD/MM/YYYY'
        end
        object gbRogd: TGroupBox
          Left = 1
          Top = 60
          Width = 850
          Height = 71
          Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          object Label13: TLabel
            Left = 22
            Top = 19
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
            Left = 471
            Top = 19
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
            Left = 124
            Top = 46
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
            Left = 471
            Top = 46
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
            Left = 165
            Top = 17
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
            TabOrder = 0
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            Visible = False
          end
          object edRG_GOSUD: TDBLookupComboboxEh
            Left = 185
            Top = 13
            Width = 218
            Height = 26
            DataField = 'RG_GOSUD'
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
            TabOrder = 1
            Visible = True
          end
          object edRG_B_OBL: TDBCheckBoxEh
            Left = 558
            Top = 17
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
            Left = 636
            Top = 40
            Width = 160
            Height = 26
            DataField = 'RG_GOROD'
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
          object edRG_B_GOROD: TDBLookupComboboxEh
            Left = 579
            Top = 40
            Width = 46
            Height = 26
            Alignment = taRightJustify
            DataField = 'RG_B_GOROD'
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
            TabOrder = 4
            Visible = True
          end
          object edRG_OBL: TDBEditEh
            Left = 579
            Top = 13
            Width = 218
            Height = 26
            DataField = 'RG_OBL'
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
          object edRG_RAION: TDBEditEh
            Left = 185
            Top = 40
            Width = 218
            Height = 26
            DataField = 'RG_RAION'
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
        end
        object gbMestoZH: TGroupBox
          Left = 1
          Top = 411
          Width = 850
          Height = 81
          Caption = ' '#1052#1077#1089#1090#1086' '#1087#1086#1075#1088#1077#1073#1077#1085#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 18
          object Label15: TLabel
            Left = 758
            Top = 53
            Width = 59
            Height = 13
            Caption = #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label25: TLabel
            Left = 15
            Top = 30
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
          object Label26: TLabel
            Left = 252
            Top = 30
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
            Left = 470
            Top = 30
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
          object Label7: TLabel
            Left = 13
            Top = 57
            Width = 87
            Height = 13
            Caption = #1091#1095#1072#1089#1090#1086#1082' ('#1089#1077#1082#1090#1086#1088')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label16: TLabel
            Left = 189
            Top = 57
            Width = 41
            Height = 13
            Caption = #8470' '#1088#1103#1076#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label17: TLabel
            Left = 311
            Top = 57
            Width = 53
            Height = 13
            Caption = #8470' '#1084#1086#1075#1080#1083#1099
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edGT_B_RESP: TDBCheckBoxEh
            Left = 773
            Top = 51
            Width = 15
            Height = 17
            DataField = 'ZH_B_RESP'
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
            Visible = False
          end
          object edZH_GOSUD: TDBLookupComboboxEh
            Left = 777
            Top = 47
            Width = 48
            Height = 26
            DataField = 'ZH_GOSUD'
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
            TabOrder = 1
            Visible = False
          end
          object cbZH_B_OBL: TDBCheckBoxEh
            Left = 821
            Top = 50
            Width = 15
            Height = 17
            AllowGrayed = True
            DataField = 'ZH_B_OBL'
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
            Visible = False
          end
          object edZH_GOROD_Akt: TDBEditEh
            Left = 617
            Top = 23
            Width = 165
            Height = 26
            DataField = 'ZH_GOROD'
            DataSource = dsDokument
            EditButtons = <
              item
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            Visible = True
          end
          object edZH_B_GOROD_Akt: TDBLookupComboboxEh
            Left = 561
            Top = 23
            Width = 46
            Height = 26
            Alignment = taRightJustify
            DataField = 'ZH_B_GOROD'
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
            TabOrder = 4
            Visible = True
          end
          object edZH_OBL: TDBEditEh
            Left = 66
            Top = 23
            Width = 167
            Height = 26
            DataField = 'ZH_OBL'
            DataSource = dsDokument
            EditButtons = <
              item
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
          object edZH_RAION: TDBEditEh
            Left = 295
            Top = 23
            Width = 143
            Height = 26
            DataField = 'ZH_RAION'
            DataSource = dsDokument
            EditButtons = <
              item
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
          object edZH_UCH_Akt: TDBEditEh
            Left = 109
            Top = 50
            Width = 63
            Height = 26
            DataField = 'ZH_UCH'
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
          object edZH_RAD_Akt: TDBEditEh
            Left = 237
            Top = 50
            Width = 56
            Height = 26
            DataField = 'ZH_RAD'
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
          object edZH_MOG_Akt: TDBEditEh
            Left = 371
            Top = 50
            Width = 56
            Height = 26
            DataField = 'ZH_MOG'
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
        end
        object edFact: TDBEditEh
          Left = 583
          Top = 349
          Width = 343
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          AutoSelect = False
          DataField = 'DOKUMENT'
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
          OnEnter = edFactEnter
        end
        object N_F_cbOnlyGod_Akt: TDBComboBoxEh
          Left = 226
          Top = 221
          Width = 47
          Height = 19
          TabStop = False
          DataField = 'ONLYGOD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Flat = True
          Items.Strings = (
            #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080
            #1043#1086#1076' '#1089#1084#1077#1088#1090#1080
            #1052#1077#1089#1103#1094' '#1080' '#1075#1086#1076' '#1089#1084#1077#1088#1090#1080
            #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080' ('#1090#1077#1082#1089#1090')')
          KeyItems.Strings = (
            '0'
            '1'
            '2'
            '3')
          ParentFont = False
          TabOrder = 26
          Visible = True
          OnChange = N_F_cbOnlyGod_AktChange
        end
        object N_F_cbOnlyGodR_Akt: TDBComboBoxEh
          Left = 594
          Top = 35
          Width = 137
          Height = 19
          TabStop = False
          DataField = 'ONLYGOD_R'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Flat = True
          Items.Strings = (
            #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
            #1043#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
            #1052#1077#1089#1103#1094' '#1080' '#1075#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
            #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103'('#1090#1077#1082#1089#1090')')
          KeyItems.Strings = (
            '0'
            '1'
            '2'
            '3')
          ParentFont = False
          TabOrder = 25
          Visible = True
          OnChange = N_F_cbOnlyGodR_AktChange
        end
        object N_F_cbBelorus: TDBCheckBoxEh
          Left = 885
          Top = 4
          Width = 34
          Height = 17
          Anchors = [akTop, akRight]
          Caption = #1073#1077#1083
          DragCursor = crNo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbGrayed
          TabOrder = 27
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
          OnClick = N_F_cbBelorusClick
        end
        object edTextVozr_Akt: TDBEditEh
          Left = 735
          Top = 31
          Width = 174
          Height = 26
          Hint = #1042#1074#1086#1076#1080#1090#1089#1103' '#1077#1089#1083#1080' '#1076#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103' '#1085#1077#1080#1079#1074#1077#1089#1090#1085#1072
          DataField = 'TEXT_VOZR'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Visible = False
        end
        object edTextDateS_Akt: TDBEditEh
          Left = 276
          Top = 217
          Width = 170
          Height = 26
          Hint = #1042#1074#1086#1076#1080#1090#1089#1103' '#1077#1089#1083#1080' '#1076#1072#1090#1072' '#1089#1084#1077#1088#1090#1080' '#1085#1077#1080#1079#1074#1077#1089#1090#1085#1072
          DataField = 'TEXT_DATES'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          Visible = False
        end
        object gbMestoSm: TGroupBox
          Left = 1
          Top = 244
          Width = 850
          Height = 101
          Caption = ' '#1052#1077#1089#1090#1086' '#1089#1084#1077#1088#1090#1080' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
          object Label9: TLabel
            Left = 18
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
          object Label10: TLabel
            Left = 430
            Top = 20
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
            Left = 120
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
            Left = 430
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
          object Label45: TLabel
            Left = 285
            Top = 75
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
          object Label46: TLabel
            Left = 363
            Top = 77
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
            Left = 449
            Top = 77
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
          object Label68: TLabel
            Left = 42
            Top = 76
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
          object edSM_B_RESP: TDBCheckBoxEh
            Left = 161
            Top = 18
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
            TabOrder = 0
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            Visible = False
          end
          object edSM_GOSUD: TDBLookupComboboxEh
            Left = 181
            Top = 13
            Width = 218
            Height = 26
            HelpKeyword = 'DS;FNAME;FNAME_B'
            DataField = 'SM_GOSUD'
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
            TabOrder = 1
            Visible = True
          end
          object cbSM_OBL: TDBCheckBoxEh
            Left = 500
            Top = 18
            Width = 16
            Height = 17
            AllowGrayed = True
            DataField = 'SM_B_OBL'
            DataSource = dsDokument
            TabOrder = 2
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edSM_OBL: TDBEditEh
            Left = 525
            Top = 13
            Width = 225
            Height = 26
            DataField = 'SM_OBL'
            DataSource = dsDokument
            EditButtons = <
              item
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
          object edSM_RAION: TDBEditEh
            Left = 181
            Top = 41
            Width = 218
            Height = 26
            DataField = 'SM_RAION'
            DataSource = dsDokument
            EditButtons = <
              item
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
          object edSM_B_GOROD: TDBLookupComboboxEh
            Left = 525
            Top = 41
            Width = 53
            Height = 26
            Alignment = taRightJustify
            DataField = 'SM_B_GOROD'
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
            TabOrder = 5
            Visible = True
          end
          object edSM_GOROD: TDBEditEh
            Left = 587
            Top = 41
            Width = 163
            Height = 26
            DataField = 'SM_GOROD'
            DataSource = dsDokument
            EditButtons = <
              item
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            Visible = True
          end
          object edSM_DOM: TDBEditEh
            Left = 313
            Top = 70
            Width = 40
            Height = 26
            DataField = 'SM_DOM'
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
          object edSM_KORP: TDBEditEh
            Left = 400
            Top = 70
            Width = 40
            Height = 26
            DataField = 'SM_KORP'
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
          object edSM_KV: TDBEditEh
            Left = 473
            Top = 70
            Width = 40
            Height = 26
            DataField = 'SM_KV'
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
          object N_F_edBOMG: TDBCheckBoxEh
            Left = 16
            Top = 40
            Width = 41
            Height = 17
            Hint = #1041#1077#1079' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1085#1086#1075#1086' '#1084#1077#1089#1090#1072' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
            Caption = #1041#1054#1052#1046
            DataField = 'BOMG'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            Visible = False
          end
          object edSM_TEXT: TDBEditEh
            Left = 600
            Top = 70
            Width = 236
            Height = 26
            DataField = 'SM_TEXT'
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
          end
          object edSM_GOROD_R: TDBEditEh
            Left = 82
            Top = 69
            Width = 193
            Height = 26
            DataField = 'SM_GOROD_R'
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
        end
        object edRukov_Akt: TDBEditEh
          Left = 591
          Top = 556
          Width = 246
          Height = 26
          HelpContext = 999
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
          TabOrder = 23
          Visible = True
          OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
          OnEnter = edRukov_AktEnter
        end
        object edZH_PRICH: TDBEditEh
          Left = 153
          Top = 136
          Width = 409
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          AutoSelect = False
          DataField = 'ZH_PRICH'
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
          OnEnter = edFactEnter
        end
        object edZA_NOMER: TDBEditEh
          Left = 129
          Top = 377
          Width = 74
          Height = 26
          DataField = 'ZA_NOMER'
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
        object edZA_DATE: TDBDateTimeEditEh
          Left = 246
          Top = 377
          Width = 100
          Height = 26
          DataField = 'ZA_DATE'
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
        object edPrOsn_Name: TDBEditEh
          Left = 115
          Top = 349
          Width = 278
          Height = 26
          Hint = #1086#1089#1085#1086#1074#1085#1072#1103' '#1087#1088#1080#1095#1080#1085#1072' '#1089#1084#1077#1088#1090#1080' '#1085#1072' '#1088#1091#1089#1089#1082#1086#1084' '#1103#1079#1099#1082#1077
          DataField = 'PR_OSN_NAME'
          DataSource = dsDokument
          EditButtons = <
            item
              Style = ebsEllipsisEh
              OnClick = edPrOsn_NameEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          Visible = True
        end
        object gbOrgan: TGroupBox
          Left = 1
          Top = 163
          Width = 850
          Height = 49
          Caption = #1044#1072#1090#1072', '#1086#1088#1075#1072#1085', '#1076#1086#1083#1078#1085#1086#1089#1090#1085#1086#1077' '#1083#1080#1094#1086', '#1076#1072#1074#1096#1077#1077' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1077' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          DesignSize = (
            850
            49)
          object edRAZR_ORGAN: TDBEditEh
            Left = 136
            Top = 17
            Width = 422
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            AutoSelect = False
            DataField = 'RAZR_ORGAN'
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
            OnEnter = edFactEnter
          end
          object edRAZR_DATE: TDBDateTimeEditEh
            Left = 10
            Top = 17
            Width = 100
            Height = 26
            DataField = 'RAZR_DATE'
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
          object edRAZR_FIO: TDBEditEh
            Left = 585
            Top = 17
            Width = 252
            Height = 26
            DataField = 'RAZR_FIO'
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
            OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
            OnEnter = edRukov_AktEnter
          end
        end
        object edAktNomer: TDBEditEh
          Left = 421
          Top = 526
          Width = 61
          Height = 26
          DataField = 'AKT_NOMER'
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
        object edAktSost: TDBEditEh
          Left = 591
          Top = 526
          Width = 246
          Height = 26
          HelpContext = 999
          DataField = 'AKT_SOST'
          DataSource = dsDokument
          EditButtons = <
            item
              Hint = #1042#1099#1073#1088#1072#1090#1100
              Style = ebsEllipsisEh
              Visible = False
              OnClick = edAktSostEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 22
          Visible = True
          OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
          OnEnter = edRukov_AktEnter
        end
        object edSpec_Akt: TDBEditEh
          Left = 591
          Top = 584
          Width = 246
          Height = 26
          HelpContext = 999
          DataField = 'SPEC'
          DataSource = dsDokument
          EditButtons = <
            item
              Hint = #1042#1099#1073#1088#1072#1090#1100
              Style = ebsEllipsisEh
              OnClick = edSpecEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 24
          Visible = True
          OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
          OnEnter = edRukov_AktEnter
        end
        object edSPR_ZAGS: TDBEditEh
          Left = 429
          Top = 377
          Width = 497
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DataField = 'SVID_ZAGS'
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
          OnCheckDrawRequiredState = edZAGSCheckDrawRequiredState
        end
        object ENG_edIDENTIF_Akt: TDBEditEh
          Left = 101
          Top = 31
          Width = 155
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
          MRUList.Active = True
          ParentFont = False
          TabOrder = 4
          Visible = True
        end
        object edOrg: TDBEditEh
          Left = 122
          Top = 496
          Width = 495
          Height = 26
          Hint = 
            #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077', '#1102#1088'. '#1072#1076#1088#1077#1089', '#1072#1076#1088#1077#1089' '#1101#1083'. '#1087#1086#1095#1090#1099', '#1090#1077#1083#1077#1092#1086#1085', '#1092#1072#1082#1089' '#1089#1087#1077#1094'. '#1086#1088 +
            #1075#1072#1085#1080#1079#1072#1094#1080#1080
          DataField = 'ORG'
          DataSource = dsDokument
          EditButtons = <
            item
              Hint = #1042#1099#1073#1088#1072#1090#1100
              Style = ebsEllipsisEh
              Visible = False
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          Visible = True
          OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
          OnEnter = edRukov_AktEnter
        end
        object edOrgUNP: TDBEditEh
          Left = 680
          Top = 496
          Width = 157
          Height = 26
          Hint = #1059#1053#1055' '#1089#1087#1077#1094'. '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
          DataField = 'ORG_UNP'
          DataSource = dsDokument
          EditButtons = <
            item
              Hint = #1042#1099#1073#1088#1072#1090#1100
              Style = ebsEllipsisEh
              Visible = False
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
          Visible = True
          OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
          OnEnter = edRukov_AktEnter
        end
      end
      object tsAdd: TTabSheet
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
        ImageIndex = 2
        object GroupBox1: TGroupBox
          Left = 0
          Top = 101
          Width = 931
          Height = 78
          Align = alTop
          Caption = ' '#1059#1089#1090#1072#1085#1086#1074#1080#1083' '#1085#1072#1076#1075#1088#1086#1073#1080#1077' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label73: TLabel
            Left = 12
            Top = 19
            Width = 190
            Height = 13
            Caption = #1060#1072#1084#1080#1083#1080#1103', '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1077' '#1080#1084#1103', '#1086#1090#1095#1077#1089#1090#1074#1086
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label85: TLabel
            Left = 12
            Top = 48
            Width = 31
            Height = 13
            Caption = #1040#1076#1088#1077#1089
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edINST_MN_NAME: TDBEditEh
            Left = 219
            Top = 12
            Width = 494
            Height = 26
            DataField = 'INST_MN_NAME'
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
                Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072' '#1085#1072#1089#1077#1083#1077#1085#1080#1103
                Style = ebsGlyphEh
                Width = 20
                OnClick = edINST_MN_NAMEEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Visible = True
            OnUpdateData = edDeclUpdateData
          end
          object DBCheckBoxEh2: TDBCheckBoxEh
            Left = 748
            Top = 16
            Width = 97
            Height = 17
            Caption = #1070#1088'. '#1083#1080#1094#1086
            DataField = 'INST_MN_ORG'
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
            Visible = False
          end
          object edINST_MN_ADRES: TDBEditEh
            Left = 219
            Top = 41
            Width = 494
            Height = 26
            DataField = 'INST_MN_ADRES'
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
            OnUpdateData = edDeclUpdateData
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 328
          Width = 931
          Height = 149
          Align = alTop
          Caption = ' '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          DesignSize = (
            931
            149)
          object edZH_PRIM: TDBMemo
            Left = 6
            Top = 16
            Width = 919
            Height = 126
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'ZH_PRIM'
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
        object GroupBox3: TGroupBox
          Left = 0
          Top = 179
          Width = 931
          Height = 149
          Align = alTop
          Caption = ' '#1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1076#1077#1081#1089#1090#1074#1080#1103#1093' '#1087#1086' '#1087#1077#1088#1077#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1102' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          DesignSize = (
            931
            149)
          object edZH_WORK: TDBMemo
            Left = 6
            Top = 16
            Width = 919
            Height = 126
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'ZH_WORK'
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
        object gbPR: TGroupBox
          Left = 0
          Top = 0
          Width = 931
          Height = 101
          Align = alTop
          Caption = ' '#1055#1086#1089#1083#1077#1076#1085#1077#1077' '#1084#1077#1089#1090#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072' '#1091#1084#1077#1088#1096#1077#1075#1086' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object Label8: TLabel
            Left = 18
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
          object Label42: TLabel
            Left = 430
            Top = 20
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
          object Label43: TLabel
            Left = 120
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
          object Label44: TLabel
            Left = 430
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
          object Label47: TLabel
            Left = 285
            Top = 75
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
          object Label49: TLabel
            Left = 363
            Top = 77
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
          object Label50: TLabel
            Left = 449
            Top = 77
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
          object Label52: TLabel
            Left = 42
            Top = 76
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
          object edPR_GOSUD: TDBLookupComboboxEh
            Left = 181
            Top = 13
            Width = 218
            Height = 26
            HelpKeyword = 'DS;FNAME;FNAME_B'
            HelpContext = 888
            DataField = 'PR_GOSUD'
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
          object DBCheckBoxEh3: TDBCheckBoxEh
            Left = 500
            Top = 18
            Width = 16
            Height = 17
            AllowGrayed = True
            DataField = 'PR_B_OBL'
            DataSource = dsDokument
            TabOrder = 1
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            Visible = False
          end
          object edPR_OBL: TDBEditEh
            Left = 525
            Top = 13
            Width = 225
            Height = 26
            DataField = 'PR_OBL'
            DataSource = dsDokument
            EditButtons = <
              item
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
          object edPR_RAION: TDBEditEh
            Left = 181
            Top = 41
            Width = 218
            Height = 26
            DataField = 'PR_RAION'
            DataSource = dsDokument
            EditButtons = <
              item
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
          object edPR_B_GOROD: TDBLookupComboboxEh
            Left = 525
            Top = 41
            Width = 53
            Height = 26
            Alignment = taRightJustify
            DataField = 'PR_B_GOROD'
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
            TabOrder = 4
            Visible = True
          end
          object edPR_GOROD: TDBEditEh
            Left = 587
            Top = 41
            Width = 163
            Height = 26
            DataField = 'PR_GOROD'
            DataSource = dsDokument
            EditButtons = <
              item
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            Visible = True
          end
          object edPR_DOM: TDBEditEh
            Left = 313
            Top = 70
            Width = 40
            Height = 26
            DataField = 'PR_DOM'
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
          object edPR_KORP: TDBEditEh
            Left = 400
            Top = 70
            Width = 40
            Height = 26
            DataField = 'PR_KORP'
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
          object edPR_KV: TDBEditEh
            Left = 473
            Top = 70
            Width = 40
            Height = 26
            DataField = 'PR_KV'
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
          object DBCheckBoxEh4: TDBCheckBoxEh
            Left = 16
            Top = 40
            Width = 41
            Height = 17
            Hint = #1041#1077#1079' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1085#1086#1075#1086' '#1084#1077#1089#1090#1072' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
            Caption = #1041#1054#1052#1046
            DataField = 'BOMG'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            Visible = False
          end
          object edPR_TEXT: TDBEditEh
            Left = 600
            Top = 70
            Width = 236
            Height = 26
            DataField = 'PR_TEXT'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
            Visible = False
          end
          object edPR_GOROD_R: TDBEditEh
            Left = 82
            Top = 69
            Width = 193
            Height = 26
            DataField = 'PR_GOROD_R'
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
        object DBGridEh2: TDBGridEh
          Left = 32
          Top = 568
          Width = 489
          Height = 81
          DataSource = DataSource1
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Visible = False
        end
        object pnZapAkt: TPanel
          Left = 0
          Top = 477
          Width = 931
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 5
          DesignSize = (
            931
            41)
          object Label36: TLabel
            Left = 6
            Top = 15
            Width = 125
            Height = 13
            Caption = #1047#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1089#1084#1077#1088#1090#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label37: TLabel
            Left = 147
            Top = 15
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
          object Label54: TLabel
            Left = 346
            Top = 15
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
          object Label56: TLabel
            Left = 498
            Top = 15
            Width = 58
            Height = 13
            Caption = #1089#1086#1089#1090#1072#1074#1083#1077#1085#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edZapAktNomer: TDBEditEh
            Left = 169
            Top = 8
            Width = 157
            Height = 26
            DataField = 'ZAPAKT_NOMER'
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
          object edZapAktDate: TDBDateTimeEditEh
            Left = 370
            Top = 8
            Width = 110
            Height = 26
            DataField = 'ZAPAKT_DATE'
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
          object edZapAktZags: TDBEditEh
            Left = 567
            Top = 8
            Width = 360
            Height = 26
            HelpContext = 999
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ZAPAKT_ZAGS'
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
            OnCheckDrawRequiredState = edZAGSCheckDrawRequiredState
          end
        end
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 790
    Width = 939
  end
  inherited pnAdd: TPanel
    Width = 939
    Visible = False
    inherited lbAnnulir: TvchDBText
      Width = 194
    end
  end
  inherited dsDokument: TDataSource
    Left = 8
    Top = 146
  end
  inherited Dokument: TkbmMemTable
    AttachMaxCount = 2
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
        Name = 'DOK_KOD'
        DataType = ftSmallint
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
        Size = 50
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
        Size = 300
      end
      item
        Name = 'SPRAV_NOMER'
        DataType = ftString
        Size = 15
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
        Name = 'MAT_SCHET'
        DataType = ftSmallint
      end
      item
        Name = 'MAT_DATER'
        DataType = ftDate
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
        Name = 'RESH_SUDA'
        DataType = ftBoolean
      end
      item
        Name = 'Vb'
        DataType = ftBoolean
      end
      item
        Name = 'LICH_NOMER'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'ARX_ADRESAT'
        DataType = ftMemo
      end
      item
        Name = 'ARX_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ARX_DATE'
        DataType = ftDate
      end
      item
        Name = 'ARX_TEXT'
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
        Name = 'GT_B_RN'
        DataType = ftBoolean
      end
      item
        Name = 'GT_RNGOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONLYGOD'
        DataType = ftSmallint
      end
      item
        Name = 'ONLYGOD_R'
        DataType = ftSmallint
      end
      item
        Name = 'VOZR'
        DataType = ftSmallint
      end
      item
        Name = 'VOENKOM'
        DataType = ftInteger
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
        Name = 'POLE_GRN'
        DataType = ftInteger
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
        Name = 'STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IS_SDAN_DOK'
        DataType = ftBoolean
      end
      item
        Name = 'DOK_TYPE'
        DataType = ftSmallint
      end
      item
        Name = 'DOK_SERIA'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'DOK_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DOK_DATE'
        DataType = ftDate
      end
      item
        Name = 'DOK_ORGAN'
        DataType = ftInteger
      end
      item
        Name = 'DOK_NAME'
        DataType = ftMemo
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
        Name = 'RN_SM_B_GOROD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RN_RG_B_GOROD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RN_GT_B_GOROD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'GT_DOM'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'GT_KORP'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'GT_KV'
        DataType = ftString
        Size = 10
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
        Name = 'PRINT_VOSSTAN'
        DataType = ftBoolean
      end
      item
        Name = 'DUBL_SPR'
        DataType = ftBoolean
      end
      item
        Name = 'BOMG'
        DataType = ftBoolean
      end>
    Left = 56
    Top = 130
    object DokumentID_SOURCE: TIntegerField [0]
      FieldName = 'ID_SOURCE'
    end
    object DokumentID_ZAGS: TIntegerField [1]
      FieldName = 'ID_ZAGS'
    end
    object DokumentDATEZ: TDateField [3]
      FieldName = 'DATEZ'
    end
    object DokumentNOMER: TIntegerField [4]
      FieldName = 'NOMER'
    end
    object DokumentNOMER2: TIntegerField [5]
      FieldName = 'NOMER2'
    end
    object DokumentAKT_NOMER: TIntegerField [8]
      FieldName = 'ZA_NOMER'
    end
    object DokumentAKT_DATE: TDateField [9]
      FieldName = 'ZA_DATE'
    end
    object DokumentSVID_SERIA: TStringField [11]
      FieldName = 'SVID_SERIA'
      Size = 10
    end
    object DokumentSVID_NOMER: TStringField [12]
      FieldName = 'SVID_NOMER'
    end
    object DokumentSVID_ZAGS: TStringField [13]
      FieldName = 'SVID_ZAGS'
      Size = 200
    end
    object DokumentLICH_NOMER: TStringField [14]
      FieldName = 'LICH_NOMER'
      Size = 14
    end
    object DokumentMEN_ID: TIntegerField [15]
      FieldName = 'MEN_ID'
    end
    object DokumentFamilia: TStringField [16]
      FieldName = 'Familia'
      Size = 50
    end
    object DokumentName: TStringField [17]
      FieldName = 'Name'
      Size = 30
    end
    object DokumentOtch: TStringField [18]
      FieldName = 'Otch'
      Size = 30
    end
    object DokumentPOL: TStringField [19]
      FieldName = 'POL'
      Size = 1
    end
    object DokumentGRAG: TIntegerField [20]
      FieldName = 'GRAG'
    end
    object DokumentONLYGOD: TSmallintField [21]
      FieldName = 'ONLYGOD'
    end
    object DokumentDateS: TDateField [22]
      FieldName = 'DateS'
    end
    object DokumentSMERT_POSL: TIntegerField [23]
      FieldName = 'SMERT_POSL'
    end
    object DokumentSM_B_RESP: TBooleanField [24]
      FieldName = 'SM_B_RESP'
    end
    object DokumentSM_GOSUD: TIntegerField [25]
      FieldName = 'SM_GOSUD'
    end
    object DokumentSM_B_OBL: TBooleanField [26]
      FieldName = 'SM_B_OBL'
    end
    object DokumentSM_OBL: TStringField [27]
      FieldName = 'SM_OBL'
      Size = 30
    end
    object DokumentSM_RAION: TStringField [28]
      FieldName = 'SM_RAION'
      Size = 30
    end
    object DokumentSM_B_GOROD: TSmallintField [29]
      FieldName = 'SM_B_GOROD'
    end
    object DokumentSM_GOROD: TStringField [30]
      FieldName = 'SM_GOROD'
      Size = 30
    end
    object DokumentSM_GOROD_R: TStringField [31]
      FieldName = 'SM_GOROD_R'
      Size = 50
    end
    object DokumentSM_DOM: TStringField [32]
      FieldName = 'SM_DOM'
      Size = 5
    end
    object DokumentSM_KORP: TStringField [33]
      FieldName = 'SM_KORP'
      Size = 5
    end
    object DokumentSM_KV: TStringField [34]
      FieldName = 'SM_KV'
      Size = 5
    end
    object DokumentSM_TEXT: TStringField [35]
      FieldName = 'SM_TEXT'
      Size = 300
    end
    object DokumentPR_OSN: TStringField [36]
      FieldName = 'PR_OSN'
      Size = 6
    end
    object DokumentPR_OSN_NAME: TMemoField [37]
      FieldName = 'PR_OSN_NAME'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentDOKUMENT: TMemoField [38]
      FieldName = 'DOKUMENT'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentDOK_KOD: TSmallintField [39]
      FieldName = 'DOK_KOD'
    end
    object DokumentONLYGOD_R: TSmallintField [40]
      FieldName = 'ONLYGOD_R'
    end
    object DokumentDateR: TDateField [41]
      FieldName = 'DateR'
    end
    object DokumentVOZR: TSmallintField [42]
      FieldName = 'VOZR'
    end
    object DokumentRG_B_RESP: TBooleanField [43]
      FieldName = 'RG_B_RESP'
    end
    object DokumentRG_GOSUD: TIntegerField [44]
      FieldName = 'RG_GOSUD'
    end
    object DokumentRG_B_OBL: TBooleanField [45]
      FieldName = 'RG_B_OBL'
    end
    object DokumentRG_OBL: TStringField [46]
      FieldName = 'RG_OBL'
      Size = 30
    end
    object DokumentRG_RAION: TStringField [47]
      FieldName = 'RG_RAION'
      Size = 30
    end
    object DokumentRG_B_GOROD: TSmallintField [48]
      FieldName = 'RG_B_GOROD'
    end
    object DokumentRG_GOROD: TStringField [49]
      FieldName = 'RG_GOROD'
      Size = 30
    end
    object DokumentZH_B_RESP: TBooleanField [50]
      FieldName = 'ZH_B_RESP'
    end
    object DokumentZH_GOSUD: TIntegerField [51]
      FieldName = 'ZH_GOSUD'
    end
    object DokumentZH_B_OBL: TBooleanField [52]
      FieldName = 'ZH_B_OBL'
    end
    object DokumentZH_OBL: TStringField [53]
      FieldName = 'ZH_OBL'
      Size = 30
    end
    object DokumentZH_RAION: TStringField [54]
      FieldName = 'ZH_RAION'
      Size = 30
    end
    object DokumentZH_SS: TStringField [55]
      FieldName = 'ZH_SS'
      Size = 100
    end
    object DokumentZH_B_GOROD: TSmallintField [56]
      FieldName = 'ZH_B_GOROD'
    end
    object DokumentZH_GOROD: TStringField [57]
      FieldName = 'ZH_GOROD'
      Size = 30
    end
    object DokumentZH_TYPE: TSmallintField [58]
      FieldName = 'ZH_TYPE'
    end
    object DokumentZH_KLAD: TIntegerField [59]
      FieldName = 'ZH_KLAD'
    end
    object DokumentZH_UCH: TStringField [60]
      FieldName = 'ZH_UCH'
      Size = 10
    end
    object DokumentZH_RAD: TStringField [61]
      FieldName = 'ZH_RAD'
      Size = 10
    end
    object DokumentZH_UCH2: TStringField [62]
      FieldName = 'ZH_UCH2'
      Size = 10
    end
    object DokumentZH_MOG: TStringField [63]
      FieldName = 'ZH_MOG'
      Size = 5
    end
    object DokumentZH_BRON: TBooleanField [64]
      FieldName = 'ZH_BRON'
    end
    object DokumentZH_KLUM: TStringField [65]
      FieldName = 'ZH_KLUM'
      Size = 10
    end
    object DokumentZH_ST_KLUM: TStringField [66]
      FieldName = 'ZH_ST_KLUM'
      Size = 10
    end
    object DokumentZH_STAKAN: TStringField [67]
      FieldName = 'ZH_STAKAN'
      Size = 10
    end
    object DokumentZH_SKLEP: TStringField [68]
      FieldName = 'ZH_SKLEP'
      Size = 10
    end
    object DokumentZH_PRICH: TMemoField [69]
      FieldName = 'ZH_PRICH'
      BlobType = ftMemo
    end
    object DokumentRUKOV: TStringField [70]
      FieldName = 'RUKOV'
      Size = 60
    end
    object DokumentTEXT_DATES: TStringField [71]
      FieldName = 'TEXT_DATES'
      Size = 30
    end
    object DokumentSOATO: TStringField [72]
      FieldName = 'SOATO'
      Size = 10
    end
    object DokumentFirst_Ekz: TBooleanField [73]
      FieldName = 'First_Ekz'
    end
    object DokumentPROV: TBooleanField [74]
      FieldName = 'PROV'
    end
    object DokumentDATESV: TDateField [75]
      FieldName = 'DATESV'
    end
    object DokumentSPEC: TStringField [76]
      FieldName = 'SPEC'
      Size = 60
    end
    object DokumentDOLG_SPEC: TStringField [77]
      FieldName = 'DOLG_SPEC'
      Size = 200
    end
    object DokumentSUD_NAME: TMemoField [78]
      FieldName = 'SUD_NAME'
      BlobType = ftMemo
    end
    object DokumentSUD_DATE: TDateField [79]
      FieldName = 'SUD_DATE'
    end
    object DokumentRESH_SUDA: TBooleanField [81]
      FieldName = 'RESH_SUDA'
    end
    object DokumentEMPTY_PRICH: TBooleanField [82]
      DisplayLabel = #1055#1091#1089#1090#1072#1103' '#1087#1088#1080#1095#1080#1085#1072' '#1089#1084#1077#1088#1090#1080
      FieldName = 'EMPTY_PRICH'
    end
    object DokumentPOLE_GRN: TIntegerField [85]
      FieldName = 'POLE_GRN'
    end
    object DokumentTYPEMESSAGE: TStringField [86]
      FieldName = 'TYPEMESSAGE'
      Size = 4
    end
    object DokumentTYPEREG: TSmallintField [87]
      FieldName = 'TYPEREG'
    end
    object DokumentSTATUS: TStringField [88]
      FieldName = 'STATUS'
      Size = 1
    end
    object DokumentDOK_TYPE: TSmallintField [89]
      FieldName = 'DOK_TYPE'
    end
    object DokumentDOK_SERIA: TStringField [90]
      FieldName = 'DOK_SERIA'
      Size = 7
    end
    object DokumentDOK_NOMER: TStringField [91]
      FieldName = 'DOK_NOMER'
      Size = 10
    end
    object DokumentDOK_DATE: TDateField [92]
      FieldName = 'DOK_DATE'
    end
    object DokumentDOK_ORGAN: TIntegerField [93]
      FieldName = 'DOK_ORGAN'
    end
    object DokumentDOK_NAME: TMemoField [94]
      FieldName = 'DOK_NAME'
      BlobType = ftMemo
    end
    object DokumentRN_SM_B_GOROD: TStringField [95]
      FieldName = 'RN_SM_B_GOROD'
      Size = 10
    end
    object DokumentRN_RG_B_GOROD: TStringField [96]
      FieldName = 'RN_RG_B_GOROD'
      Size = 10
    end
    object DokumentRN_ZH_B_GOROD: TStringField [97]
      FieldName = 'RN_ZH_B_GOROD'
      Size = 10
    end
    object DokumentDUBL_SPR: TBooleanField [102]
      FieldName = 'DUBL_SPR'
    end
    object DokumentBOMG: TBooleanField [103]
      FieldName = 'BOMG'
    end
    object DokumentSUD_SILA: TDateField [104]
      FieldName = 'SUD_SILA'
    end
    object DokumentTEXT_VOZR: TStringField [106]
      FieldName = 'TEXT_VOZR'
      Size = 30
    end
    object DokumentDATEZH: TDateField
      FieldName = 'DATEZH'
    end
    object DokumentRAZR_ORGAN: TStringField
      FieldName = 'RAZR_ORGAN'
      Size = 200
    end
    object DokumentRAZR_DATE: TDateField
      FieldName = 'RAZR_DATE'
    end
    object DokumentRAZR_FIO: TStringField
      FieldName = 'RAZR_FIO'
      Size = 50
    end
    object DokumentPRIL_LIST: TSmallintField
      FieldName = 'PRIL_LIST'
    end
    object DokumentDECL_ID: TIntegerField
      FieldName = 'DECL_ID'
    end
    object DokumentDECL: TStringField
      FieldName = 'DECL'
      Size = 100
    end
    object DokumentDECL_TEL: TStringField
      FieldName = 'DECL_TEL'
      Size = 15
    end
    object DokumentDECL_MOB: TStringField
      FieldName = 'DECL_MOB'
      Size = 15
    end
    object DokumentGT_GOSUD: TIntegerField
      FieldName = 'GT_GOSUD'
    end
    object DokumentGT_B_OBL: TBooleanField
      FieldName = 'GT_B_OBL'
    end
    object DokumentGT_OBL: TStringField
      FieldName = 'GT_OBL'
      Size = 30
    end
    object DokumentGT_RAION: TStringField
      FieldName = 'GT_RAION'
      Size = 30
    end
    object DokumentGT_RNGOROD: TStringField
      FieldName = 'GT_RNGOROD'
      Size = 30
    end
    object DokumentGT_B_GOROD: TSmallintField
      FieldName = 'GT_B_GOROD'
    end
    object DokumentGT_GOROD: TStringField
      FieldName = 'GT_GOROD'
      Size = 30
    end
    object DokumentGT_GOROD_R: TStringField
      FieldName = 'GT_GOROD_R'
      Size = 50
    end
    object DokumentGT_DOM: TStringField
      FieldName = 'GT_DOM'
      Size = 10
    end
    object DokumentGT_KORP: TStringField
      FieldName = 'GT_KORP'
      Size = 7
    end
    object DokumentGT_KV: TStringField
      FieldName = 'GT_KV'
      Size = 10
    end
    object DokumentMOG_TYPE: TSmallintField
      FieldName = 'MOG_TYPE'
    end
    object DokumentMOG_L: TFloatField
      FieldName = 'MOG_L'
      DisplayFormat = '###.0'
      EditFormat = '###.0'
    end
    object DokumentMOG_W: TFloatField
      FieldName = 'MOG_W'
      DisplayFormat = '##.0'
      EditFormat = '##.0'
    end
    object DokumentKVIT: TStringField
      FieldName = 'KVIT'
      Size = 10
    end
    object DokumentTRAN_VID: TStringField
      FieldName = 'TRAN_VID'
      Size = 15
    end
    object DokumentTRAN_TIME: TTimeField
      FieldName = 'TRAN_TIME'
    end
    object DokumentBRON_COUNT: TSmallintField
      FieldName = 'BRON_COUNT'
    end
    object DokumentPRIM: TMemoField
      FieldName = 'PRIM'
      BlobType = ftMemo
    end
    object DokumentDOLG_RUKOV: TStringField
      FieldName = 'DOLG_RUKOV'
      Size = 100
    end
    object DokumentUSLUG: TStringField
      FieldName = 'USLUG'
      Size = 200
    end
    object DokumentAKT_NOMER2: TIntegerField
      FieldName = 'AKT_NOMER'
    end
    object DokumentAKT_SOST: TStringField
      FieldName = 'AKT_SOST'
      Size = 200
    end
    object DokumentUSLUG_UNP: TStringField
      FieldName = 'ORG_UNP'
      Size = 15
    end
    object DokumentORG: TStringField
      FieldName = 'ORG'
      Size = 200
    end
    object DokumentIS_AKT: TBooleanField
      FieldName = 'IS_AKT'
    end
    object DokumentZH_VID: TSmallintField
      FieldName = 'ZH_VID'
    end
    object DokumentIS_ORG: TBooleanField
      FieldName = 'IS_ORG'
    end
    object DokumentINST_MN_NAME: TStringField
      FieldName = 'INST_MN_NAME'
      Size = 200
    end
    object DokumentINST_MN_ID: TIntegerField
      FieldName = 'INST_MN_ID'
    end
    object DokumentINST_MN_ADRES: TStringField
      FieldName = 'INST_MN_ADRES'
      Size = 200
    end
    object DokumentINST_MN_ORG: TBooleanField
      FieldName = 'INST_MN_ORG'
    end
    object DokumentZH_WORK: TMemoField
      FieldName = 'ZH_WORK'
      BlobType = ftMemo
    end
    object DokumentZH_PRIM: TMemoField
      FieldName = 'ZH_PRIM'
      BlobType = ftMemo
    end
    object DokumentGT_TEXT: TStringField
      FieldName = 'GT_TEXT'
      Size = 200
    end
    object DokumentGT_IS_TEXT: TBooleanField
      FieldName = 'GT_IS_TEXT'
    end
    object DokumentPR_GOSUD: TIntegerField
      FieldName = 'PR_GOSUD'
    end
    object DokumentPR_B_OBL: TBooleanField
      FieldName = 'PR_B_OBL'
    end
    object DokumentPR_OBL: TStringField
      FieldName = 'PR_OBL'
      Size = 30
    end
    object DokumentPR_RAION: TStringField
      FieldName = 'PR_RAION'
      Size = 30
    end
    object DokumentPR_B_GOROD: TSmallintField
      FieldName = 'PR_B_GOROD'
    end
    object DokumentPR_GOROD: TStringField
      FieldName = 'PR_GOROD'
      Size = 30
    end
    object DokumentPR_GOROD_R: TStringField
      FieldName = 'PR_GOROD_R'
      Size = 50
    end
    object DokumentPR_DOM: TStringField
      FieldName = 'PR_DOM'
      Size = 10
    end
    object DokumentPR_KORP: TStringField
      FieldName = 'PR_KORP'
      Size = 7
    end
    object DokumentPR_KV: TStringField
      FieldName = 'PR_KV'
      Size = 10
    end
    object DokumentPR_TEXT: TStringField
      FieldName = 'PR_TEXT'
      Size = 200
    end
    object DokumentUNOMER: TStringField
      FieldName = 'UNOMER'
      Size = 15
    end
    object DokumentBRON: TBooleanField
      FieldName = 'BRON'
    end
    object DokumentUDOST: TStringField
      FieldName = 'UDOST'
      Size = 10
    end
    object DokumentDECL_IN: TStringField
      FieldName = 'DECL_IN'
      Size = 14
    end
    object DokumentDECL_DOK: TStringField
      FieldName = 'DECL_DOK'
      Size = 200
    end
    object DokumentUSLUG_SPR: TIntegerField
      FieldName = 'USLUG_SPR'
    end
    object DokumentFAMILIA_GIS: TStringField
      FieldKind = fkCalculated
      FieldName = 'FAMILIA_GIS'
      Size = 50
      Calculated = True
    end
    object DokumentNAME_GIS: TStringField
      FieldName = 'NAME_GIS'
      Size = 30
    end
    object DokumentOTCH_GIS: TStringField
      FieldName = 'OTCH_GIS'
      Size = 30
    end
    object DokumentLOAD_CHECK: TIntegerField
      FieldName = 'LOAD_CHECK'
    end
    object DokumentID_LOAD: TIntegerField
      FieldName = 'ID_LOAD'
    end
    object DokumentLOAD_FIO: TBooleanField
      FieldName = 'LOAD_FIO'
    end
    object DokumentBOOK: TIntegerField
      FieldName = 'BOOK'
    end
    object DokumentZAPAKT_NOMER: TStringField
      FieldName = 'ZAPAKT_NOMER'
      Size = 25
    end
    object DokumentZAPAKT_DATE: TDateField
      FieldName = 'ZAPAKT_DATE'
    end
    object DokumentZAPAKT_ZAGS: TStringField
      FieldName = 'ZAPAKT_ZAGS'
      Size = 200
    end
    object DokumentSPR_NOMER: TStringField
      FieldName = 'SPR_NOMER'
      Size = 15
    end
    object DokumentSPR_DATE: TDateField
      FieldName = 'SPR_DATE'
    end
  end
  object dsStran: TDataSource [8]
    DataSet = dmBase.SprStran
    Left = 572
    Top = 193
  end
  object dsNation: TDataSource [9]
    DataSet = dmBase.SprNac
    Left = 812
    Top = 201
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 520
    Top = 194
  end
  inherited HistZAGS: TkbmMemTable
    Left = 480
    Top = 186
  end
  inherited dsSeria: TDataSource
    DataSet = dmBase.SvidSeria
    Left = 584
    Top = 362
  end
  inherited dsObl: TDataSource
    Left = 576
    Top = 386
  end
  object dsGragd: TDataSource [14]
    DataSet = dmBase.LookUpCitizen
    Left = 732
    Top = 193
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 920
    Top = 698
  end
  inherited dsPovtor: TDataSource
    Left = 624
    Top = 330
  end
  inherited dsRN: TDataSource
    Left = 712
    Top = 354
  end
  inherited dsGorod: TDataSource
    Left = 704
    Top = 330
  end
  inherited dsRnGor: TDataSource
    Left = 896
    Top = 394
  end
  inherited dsTypeGorod: TDataSource
    Left = 768
    Top = 194
  end
  inherited ImGISUN: TImageList
    Left = 468
  end
  inherited dsVoenkom: TDataSource
    Left = 632
  end
  inherited dsRovd: TDataSource
    Left = 680
    Top = 90
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 784
    Top = 266
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 440
    Top = 194
  end
  object ApplicationEvents1: TApplicationEvents
    Left = 886
    Top = 368
  end
  object dsKlad: TDataSource
    Left = 686
    Top = 210
  end
  object tbAddMen: TkbmMemTable
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
    Left = 676
    Top = 556
    object tbAddMenNOMER: TAutoIncField
      FieldName = 'NOMER'
    end
    object tbAddMenOTNOSHS: TStringField
      FieldName = 'OTNOSHS'
      Size = 50
    end
    object tbAddMenFAMILIA: TStringField
      FieldName = 'FAMILIA'
      Size = 70
    end
    object tbAddMenNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object tbAddMenOTCH: TStringField
      FieldName = 'OTCH'
      Size = 50
    end
  end
  object dsAddMen: TDataSource
    DataSet = tbAddMen
    OnDataChange = dsAddMenDataChange
    Left = 724
    Top = 556
  end
  object dsNameZah: TDataSource
    Left = 46
    Top = 173
  end
  object tbAllZah: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexFieldNames = 'DATES'
    IndexDefs = <
      item
        Name = 'tbAllZahIndexDATES'
        Fields = 'DATES'
      end>
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
    AfterScroll = tbAllZahAfterScroll
    Left = 532
    Top = 556
    object tbAllZahID: TIntegerField
      FieldName = 'ID'
    end
    object tbAllZahPOLE_GRN: TSmallintField
      FieldName = 'POLE_GRN'
    end
    object tbAllZahFAMILIA: TStringField
      FieldName = 'FAMILIA'
      Size = 70
    end
    object tbAllZahNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object tbAllZahOTCH: TStringField
      FieldName = 'OTCH'
      Size = 50
    end
    object tbAllZahDATER: TDateField
      FieldName = 'DATER'
    end
    object tbAllZahDATES: TDateField
      FieldName = 'DATES'
    end
    object tbAllZahBOOK: TSmallintField
      FieldName = 'BOOK'
    end
    object tbAllZahDATEZ: TDateField
      FieldName = 'DATEZ'
    end
    object tbAllZahZH_MOG: TStringField
      FieldName = 'ZH_MOG'
      Size = 5
    end
    object tbAllZahNOMER: TStringField
      FieldName = 'NOMER'
    end
  end
  object dsAllZah: TDataSource
    DataSet = tbAllZah
    OnDataChange = dsAllZahDataChange
    Left = 578
    Top = 554
  end
  object pm: TPopupMenu
    Left = 132
    Top = 353
    object pmEnableEdit: TMenuItem
      Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1091
      OnClick = pmEnableEditClick
    end
  end
  object DataSource1: TDataSource
    Left = 172
    Top = 684
  end
end
